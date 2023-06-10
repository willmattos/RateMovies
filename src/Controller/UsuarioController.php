<?php

namespace App\Controller;

use App\Entity\Notificacion;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
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
use Symfony\Component\Filesystem\Filesystem;


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
        } else if (!$usuario->getActivado()) {
            $session->getFlashBag()->add('error', "Cuenta no activada");
        } else if ($usuario->getBloquear()) {
            $session->getFlashBag()->add('error', "Cuenta bloqueada");
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
            $ruta = $ruta . "/ratemovies/public/recuperarClave/$recuperacion";
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
            $usuario->setUsuario(substr(preg_replace('/\s+/', '', $user), 0, 10));
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
            $ruta = $ruta . "/ratemovies/public/activarCuenta/$recuperacion";
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
        $usuario = $entityManager->getRepository(Usuario::class)->findOneBy(['codigo' => $codigo]);
        if ($usuario) {
            $js['respuesta'] = true;
            if ($siguiendo = $entityManager->getRepository(Siguiendo::class)->findOneBy(['following' => $usuario, 'follower' => $this->getUser()])) {
                $entityManager->remove($siguiendo);
                $js['tipo'] = 0;
            } else {
                $siguiendo = new Siguiendo();
                $siguiendo->setFollower($this->getUser());
                $siguiendo->setFollowing($usuario);
                $entityManager->persist($siguiendo);
                $js['tipo'] = 1;
            }
            $entityManager->flush();
        }
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
    #[Route('/filtrarUsuario', name: 'filtrarUsuario')]
    public function filtrarUsuarios(Request $request)
    {
        $js = [];
        if ($request->isXmlHttpRequest() && $this->isGranted('ROLE_ADMIN')) {
            $entityManager = $this->getDoctrine()->getManager();
            $usuarios = [];
            if ($nombre = $request->request->get('nombre')) {
                $nombre = strtolower($nombre);
                $qb = $entityManager->getRepository(Usuario::class)->createQueryBuilder('u')->where("LOWER(u.usuario) LIKE '%" . $nombre . "%'");
                $usuarios = $qb->getQuery()->getResult();
            } else {
                $usuarios = $entityManager->getRepository(Usuario::class)->findAll();
            }
            foreach ($usuarios as $usuario) {
                if ($usuario->getCodigo() != $this->getUser()->getCodigo()) $js[] = ['codigo' => $usuario->getCodigo(), 'usuario' => $usuario->getUsuario(), 'bloquear' => $usuario->getBloquear() ? $usuario->getBloquear() : 0, 'rol' => $usuario->getRol() ? $usuario->getRol() : 0, 'foto' => $usuario->getFoto() ? $usuario->getFoto() : ""];
            }
        }
        return new JsonResponse($js);
    }
    #[Route('/actualizarUsuario', name: 'actualizarUsuario')]
    public function actualizarPerfil(Request $request)
    {
        $js = ['respuesta' => false];
        $entityManager = $this->getDoctrine()->getManager();
        $usuario = preg_replace('/\s+/', '', substr(trim($request->request->get('username')), 0, 10));
        if ($usuario && ($usuario == $this->getUser()->getUsuario() || !$entityManager->getRepository(Usuario::class)->findOneBy(['usuario' => $usuario]))) {
            $this->getUser()->setUsuario($usuario);
            $entityManager->flush();
            $js = ['respuesta' => true];
        }
        return new JsonResponse($js);
    }
    #[Route('/bloquearUsuario', name: 'bloquearUsuario')]
    public function bloquearUsuario(Request $request)
    {
        $js = [];
        $js['respuesta'] = false;
        $usuario = $request->request->get('codigo');
        $entityManager = $this->getDoctrine()->getManager();
        $usuario = $entityManager->getRepository(Usuario::class)->findOneBy(['codigo' => $usuario]);
        if ($usuario) {
            if ($usuario->getBloquear()) $usuario->setBloquear(null);
            else $usuario->setBloquear(1);
            $entityManager->flush();
            $js['respuesta'] = true;
            $js['tipo'] = $usuario->getBloquear() ? $usuario->getBloquear() : 0;
        }
        return new JsonResponse($js);
    }
    #[Route('/hacerAdmin', name: 'hacerAdmin')]
    public function hacerAdmin(Request $request)
    {
        $js = [];
        $js['respuesta'] = false;
        $usuario = $request->request->get('codigo');
        $tipo = $request->request->get('tipo');
        $entityManager = $this->getDoctrine()->getManager();
        $usuario = $entityManager->getRepository(Usuario::class)->findOneBy(['codigo' => $usuario]);
        if ($usuario) {
            if ($tipo) {
                $usuario->setRol(2);
            } else {
                $usuario->setRol(1);
            }
            $entityManager->flush();
            $js['respuesta'] = true;
            $js['tipo'] = $usuario->getRol();
        }
        return new JsonResponse($js);
    }
    #[Route('/quitarAdmin', name: 'quitarAdmin')]
    public function quitarAdmin(Request $request)
    {
        $js = [];
        $js['respuesta'] = false;
        $usuario = $request->request->get('codigo');
        $entityManager = $this->getDoctrine()->getManager();
        $usuario = $entityManager->getRepository(Usuario::class)->findOneBy(['codigo' => $usuario]);
        if ($usuario) {
            $usuario->setRol(null);
            $entityManager->flush();
            $js['respuesta'] = true;
        }
        return new JsonResponse($js);
    }
    #[Route('/actualizarFoto', name: 'actualizarFoto')]
    public function actualizarFoto(Request $request)
    {
        $js = [];
        $entityManager = $this->getDoctrine()->getManager();
        $filesystem = new Filesystem();
        $file = $request->files->get('file');
        $folderPath = $this->getParameter('kernel.project_dir') . '/public/Usuario/u' . $this->getUser()->getCodigo() . '/';
        if (!$filesystem->exists($folderPath)) {
            $filesystem->mkdir($folderPath, 0777, true);
        } else {
            $files = glob($folderPath . '*', GLOB_MARK | GLOB_NOSORT);
            // Eliminar cada elemento individualmente
            foreach ($files as $existingFile) {
                $filesystem->remove($existingFile);
            }
        }
        $file->move($folderPath, $file->getClientOriginalName());
        $this->getUser()->setFoto($file->getClientOriginalName());
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->flush();
        return new JsonResponse(['actualizado' => true]);
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
