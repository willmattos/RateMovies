<?php

namespace App\Controller;

use Symfony\Component\Security\Core\Authentication\Token\UsernamePasswordToken;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use Symfony\Component\Security\Core\Exception\CustomUserMessageAuthenticationException;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\HttpFoundation\Request;
use App\Entity\Usuario;

class UsuarioController extends AbstractController
{
    /**
     * @Route("/identification", name="identification")
     */
    public function identification(UserPasswordEncoderInterface $passwordEncoder, SessionInterface $session)
    {
        $entityManager = $this->getDoctrine()->getManager();
        $usuario = $_POST['_username'];
        $qb = $entityManager->getRepository(Usuario::class)->createQueryBuilder('u')->andWhere("LOWER(u.correo) = LOWER('$usuario') OR LOWER(u.usuario) = LOWER('$usuario')");
        $usuario = $qb->getQuery()->getOneOrNullResult();

        if (!$usuario || !$passwordEncoder->isPasswordValid($usuario, $_POST['_password'])) {
            $session->getFlashBag()->add('error', "Usuario y/o contraseña incorrectas");
        } else {
            // $token = new UsernamePasswordToken($usuario, null, 'main', $usuario->getRoles());
            // $this->get('security.token_storage')->setToken($token);
            // $this->get('session')->set('_security_main', serialize($token));

            $this->get('security.token_storage')->setToken(new UsernamePasswordToken($usuario, null, 'main', $usuario->getRoles()));
        }
        return $this->redirectToRoute('perfil');
    }
    /**
     * @Route("/crearUsuario")
     */
    public function crearUsuario(Request $request)
    {
        $entityManager = $this->getDoctrine()->getManager();
        $form = $this->createFormBuilder()
            ->add('usuario', TextType::class)
            ->add('correo', TextType::class)
            ->add('clave', TextType::class)
            ->add('Crear', SubmitType::class, array('label' => 'Crear'))
            ->getForm();

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $datos = $form->getData();
            $correo = $datos['correo'];
            $clave = $datos['clave'];
            $userName = $datos['usuario'];

            $usuarios = $entityManager->getRepository(Usuario::class);
            $buscado = $usuarios->findBy([
                'usuario' => $userName
            ]);

            if (empty($buscado)) {
                $buscado2 = $usuarios->findBy([
                    'correo' => $correo
                ]);
                if (empty($buscado2)) {
                    $usuario = new Usuario;
                    $usuario->setCorreo($correo);
                    $usuario->setClave($clave);
                    $usuario->setUsuario($userName);
                    $usuario->setNombre("");
                    $entityManager->persist($usuario);
                    $entityManager->flush();
                    $buscado3 = $usuarios->findBy([
                        'correo' => $correo
                    ]);

                    return $this->redirectToRoute("correoActivacion", ["codigo" => $buscado3[0]->getCodigo()]);
                }
            }
        }
        return $this->render('crearUsuario.html.twig', array(
            'form' => $form->createView(),
        ));
    }

    /**
     * @Route("/correoActivacion/{codigo}", name="correoActivacion")
     */
    public function correoActivacion($codigo, MailerInterface $mailer)
    {
        $entityManager = $this->getDoctrine()->getManager();
        $usuarios = $entityManager->getRepository(Usuario::class);
        $buscado = $usuarios->findBy([
            'codigo' => $codigo
        ]);
        if (!empty($buscado)) {
            $correo = $buscado[0]->getCorreo();
            $message = new email();
            $message->from(new Address('ratemovies@consymfony.com', "RateMovies"));
            $message->to(new Address($correo));
            $message->subject("Activar cuenta");
            $message->html("<html>
        		<body>
          			<a href='http://127.0.0.1" . $this->container->get('router')->getContext()->getBaseUrl() . '/activarUsuario' . '/' . $codigo . "'>Activar cuenta</a>
        		</body>
        	</html>");
            $mailer->send($message);
        }
        return new Response("<h1>Home</h1>");
    }


    /**
     * @Route("/activarUsuario/{codigo}", name="activarUsuario")
     */
    public function activarUsuario($codigo)
    {
        $entityManager = $this->getDoctrine()->getManager();
        $usuarios = $entityManager->getRepository(Usuario::class);
        $usuario = $usuarios->findBy([
            'codigo' => $codigo
        ]);
        $usuario[0]->setActivado(1);
        $entityManager->persist($usuario[0]);
        $entityManager->flush();
        return new Response("<h1>Home</h1>");
    }
}
