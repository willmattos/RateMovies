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
        return $this->render('home.html.twig', ['destacados' => null, 'recomendados' => null, 'novedades' => null]);
    }
    /**
     * @Route("/categorias", name="categorias")
     */
    public function catalogo()
    {
        return $this->render('catalogo.html.twig', ['generos' => null]);
    }
    /**
     * @Route("/contenido", name="contenido")
     */
    public function contenido()
    {
        return $this->render('contenido.html.twig', ['recomendados' => null, "contenido" => null]);
    }
    /**
     * @Route("/admin", name="admin")
     */
    public function admin()
    {
        return $this->render('admin.html.twig', ['titulos' => null, "generos" => null]);
    }
    /**
     * @Route("/comunidad", name="comunidad")
     */
    public function comunidad()
    {
        return $this->render('comunidad.html.twig');
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
        return $this->render('perfil.html.twig');
    }
    /**
     * @Route("/logout", name="logout")
     */
    public function logout()
    {
        return $this->redirectToRoute('perfil');
    }
}
