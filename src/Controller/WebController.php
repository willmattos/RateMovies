<?php

namespace App\Controller;

use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Security\Core\Authentication\Token\UsernamePasswordToken;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Session\SessionInterface;

//Este controlador es solo para render, si afecta al usuario en UsuarioController, si afecta al contenido en 

class WebController extends AbstractController
{
    /**
     * @Route("/", name="home")
     */
    public function home()
    {
        return $this->render('home.html.twig');
    }
    /**
     * @Route("/categorias", name="categorias")
     */
    public function catalogo()
    {
        return $this->render('catalogo.html.twig');
    }
    /**
     * @Route("/comunidad", name="comunidad")
     */
    public function comunidad()
    {
        return $this->render('home.html.twig');
    }
    /**
     * @Route("/perfil", name="perfil")
     */
    public function perfil(SessionInterface $session)
    {
        if (!$this->getUser()) {
            $errorMessages = $session->getFlashBag()->get('error');
            return $this->render('login.html.twig', array("errorMessages" => $errorMessages));
        }
        // $entityManager = $this->getDoctrine()->getManager();
        // $usuario = $_POST['usuario'];
        // $qb = $entityManager->getRepository(Usuario::class)->createQueryBuilder('u')->andWhere("j.correo = '$usuario' OR j.usuario = '$usuario'");
        // $usuario = $qb->getQuery()->getResult();

        // if ($usuario[0] && $codigo) {
        //     $token = new UsernamePasswordToken($usuario, null, 'main', $usuario->getRoles());
        //     $this->get('security.token_storage')->setToken($token);
        //     $this->get('session')->set('_security_main', serialize($token));
        // }

        return $this->render('home.html.twig');
    }
        /**
     * @Route("/logout", name="logout")
     */
    public function logout()
    {
        return $this->redirectToRoute('perfil');
    }
}
