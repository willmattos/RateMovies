<?php

namespace App\Controller;

use App\Entity\Notificacion;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Security\Core\Authentication\Token\UsernamePasswordToken;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\HttpFoundation\JsonResponse;
use App\Entity\Siguiendo;
use App\Entity\Usuario;
use Symfony\Component\HttpFoundation\Request;

class UsuarioController extends AbstractController
{
    #[Route('/identification', name: 'identification')]
    public function identification(UserPasswordEncoderInterface $passwordEncoder, SessionInterface $session)
    {
        $entityManager = $this->getDoctrine()->getManager();
        $usuario = $_POST['_username'];
        $qb = $entityManager->getRepository(Usuario::class)->createQueryBuilder('u')->andWhere("LOWER(u.correo) = LOWER('$usuario') OR LOWER(u.usuario) = LOWER('$usuario')");
        $usuario = $qb->getQuery()->getOneOrNullResult();

        if (!$usuario || !$passwordEncoder->isPasswordValid($usuario, $_POST['_password'])) {
            $session->getFlashBag()->add('error', "Usuario y/o contraseña incorrectas");
        } else {
            $this->get('security.token_storage')->setToken(new UsernamePasswordToken($usuario, null, 'main', $usuario->getRoles()));
        }

        return $this->redirectToRoute('perfil');
    }
    #[Route('/recuperarCuenta', name: 'recuperarCuenta')]
    public function recuperarCuenta(MailerInterface $mailer)
    {
        $correo = isset($_POST['_username']) ? $_POST['_username'] : "";
        $entityManager = $this->getDoctrine()->getManager();
        $usuario = $entityManager->getRepository(Usuario::class)->findOneBy(array('correo' => $correo));
        do {
            $recuperacion = rand(1, 2147483647);
        } while ($entityManager->getRepository(Usuario::class)->findOneBy(array('recuperar' => $recuperacion)));
        if ($usuario) {
            $ruta = $this->url_origin($_SERVER);
            $ruta = $ruta . "/recuperarClave/$recuperacion";
            $email = (new Email())
                ->from('info@fichar.quality.media')
                ->to($correo)
                ->subject('Cambiar contraseña de tu cuenta')
                ->html("<a href=\"$ruta\">Cambiar contraseña</a>");
            $mailer->send($email);
            $usuario->setRecuperar($recuperacion);
            $entityManager->flush();
        }
        return $this->redirectToRoute('perfil');
    }
    #[Route('/crearUsuario', name: 'crearUsuario')]
    public function crearUsuario(MailerInterface $mailer, UserPasswordHasherInterface $passwordHasher)
    {
        $correo = $_POST['_username'];
        $user = $_POST['usuario'];
        $clave = $_POST['_password'];
        $entityManager = $this->getDoctrine()->getManager();
        $usuario = $entityManager->getRepository(Usuario::class)
            ->createQueryBuilder('u')
            ->andWhere('u.correo = :correo OR u.usuario = :usuario')
            ->setParameter('correo', $correo)
            ->setParameter('usuario', $user)
            ->getQuery()
            ->getResult();
        if (!$usuario) {
            $usuario = new Usuario;
            $usuario->setCorreo(preg_replace('/\s+/', '', $correo));
            $usuario->setUsuario(preg_replace('/\s+/', '', $user));
            $hashedPassword = $passwordHasher->hashPassword($usuario, $clave);
            $usuario->setClave($hashedPassword);

            $entityManager->persist($usuario);
            $entityManager->flush();

            do {
                $recuperacion = rand(1, 2147483647);
            } while ($entityManager->getRepository(Usuario::class)->findOneBy(array('recuperar' => $recuperacion)));
            $usuario->setRecuperar($recuperacion);
            $entityManager->flush();
            $ruta = $this->url_origin($_SERVER);
            $ruta = $ruta . "/activarCuenta/$recuperacion";
            $email = (new Email())
                ->from('info@fichar.quality.media')
                ->to($usuario->getCorreo())
                ->subject('Activa tu cuenta')
                ->html("<a href=\"$ruta\">Activa tu cuenta</a>");
            $mailer->send($email);
        }
        return $this->redirectToRoute('perfil');
    }
    #[Route('/recuperarClave/{codigo}', name: 'recuperarClave')]
    public function recuperarClave($codigo = 0, UserPasswordHasherInterface $passwordHasher)
    {
        $entityManager = $this->getDoctrine()->getManager();
        if (!$this->getUser()) {
            $usuario = $entityManager->getRepository(Usuario::class)->findOneBy(array('recuperar' => $codigo));
            if ($usuario) {
                $usuario->setRecuperar(null);
                $usuario->setActivado(1);
                $entityManager->flush();
                $token = new UsernamePasswordToken($usuario, null, 'main', $usuario->getRoles());
                $this->get('security.token_storage')->setToken($token);
                $this->get('session')->set('_security_main', serialize($token));
                //enviarlo a la pagina para cambiar contraseña
                return $this->render('cambiarClave.html.twig');
            }
        } else if (isset($_POST['_password'])) {
            $hashedPassword = $passwordHasher->hashPassword($this->getUser(), $_POST['_password']);
            $this->getUser()->setClave($hashedPassword);
            $entityManager->flush();
        }
        return $this->redirectToRoute('perfil');
    }
    #[Route('/activarCuenta/{codigo}', name: 'activarCuenta')]
    public function activarCuenta($codigo = 0)
    {
        $entityManager = $this->getDoctrine()->getManager();
        $usuario = $entityManager->getRepository(Usuario::class)->findOneBy(array('recuperar' => $codigo));
        if ($usuario) {
            $usuario->setRecuperar(null);
            $usuario->setActivado(1);
            $entityManager->flush();
            $token = new UsernamePasswordToken($usuario, null, 'main', $usuario->getRoles());
            $this->get('security.token_storage')->setToken($token);
            $this->get('session')->set('_security_main', serialize($token));
        }
        return $this->redirectToRoute('perfil');
    }
    #[Route('/darSeguir', name: 'darSeguir')]
    public function darSeguir(Request $request)
    {
        $js['respuesta'] = false;
        $codigo = $request->request->get('codigo');
        $entityManager = $this->getDoctrine()->getManager();
        if ($siguiendo = $entityManager->getRepository(Siguiendo::class)->findOneBy(['siguiendo' => $codigo, 'usuario' => $this->getUser()->getCodigo()])) {
            $entityManager->remove($siguiendo);
            $js['respuesta'] = 0;
        } else {
            $siguiendo = new Siguiendo();
            $siguiendo->setUsuario($this->getUser()->getCodigo());
            $siguiendo->setSiguiendo($codigo);
            $entityManager->persist($siguiendo);
            $js['respuesta'] = 1;
        }
        $entityManager->flush();
        return new JSONResponse($js);
    }
    #[Route('/notificaciones', name: 'notificaciones')]
    public function verNotificaciones(Request $request)
    {
        $entityManager = $this->getDoctrine()->getManager();
        $notificaciones = $entityManager->getRepository(Notificacion::class)->createQueryBuilder('n')
            ->join('n.siguiendo', 's')
            ->where('s.usuario = :usuario')
            ->setParameter('usuario', $this->getUser()->getCodigo())
            ->getQuery()
            ->getResult();;
        $js['respuesta'] = $notificaciones;

        return new JSONResponse($js);
    }

    private function url_origin($s, $use_forwarded_host = false)
    {

        $ssl = (!empty($s['HTTPS']) && $s['HTTPS'] == 'on') ? true : false;
        $sp = strtolower($s['SERVER_PROTOCOL']);
        $protocol = substr($sp, 0, strpos($sp, '/')) . (($ssl) ? 's' : '');

        $port = $s['SERVER_PORT'];
        $port = ((!$ssl && $port == '80') || ($ssl && $port == '443')) ? '' : ':' . $port;

        $host = ($use_forwarded_host && isset($s['HTTP_X_FORWARDED_HOST'])) ? $s['HTTP_X_FORWARDED_HOST'] : (isset($s['HTTP_HOST']) ? $s['HTTP_HOST'] : null);
        $host = isset($host) ? $host : $s['SERVER_NAME'] . $port;

        return $protocol . '://' . $host;
    }
}
