<?php

namespace App\Controller;

use App\Entity\Comentario;
use App\Entity\Critica;
use App\Entity\Favorito;
use App\Entity\Usuario;
use App\Entity\Siguiendo;
use App\Entity\Like;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\HttpFoundation\Request;

class WebController extends AbstractController
{
    #[Route('/', name: 'home')]
    public function home()
    {
        return $this->render('home.html.twig', ['destacados' => null, 'recomendados' => null, 'novedades' => null]);
    }
    #[Route('/catalogo', name: 'catalogo')]
    public function catalogo()
    {
        return $this->render('catalogo.html.twig', ['generos' => null]);
    }
    #[Route('/comunidad', name: 'comunidad')]
    public function comunidad()
    {
        return $this->render('comunidad.html.twig');
    }
    #[Route('/contenido/{codigo}', name: 'contenido')]
    public function contenido()
    {
        return $this->render('contenido.html.twig', ['recomendados' => null, "contenido" => null]);
    }
    #[Route('/admin', name: 'admin')]
    public function admin()
    {
        return $this->render('admin.html.twig', ['titulos' => null, "generos" => null, "error" => false]);
    }
    #[Route('/perfil', name: 'perfil')]
    public function perfil(SessionInterface $session)
    {
        if (!$this->getUser()) {
            $errorMessages = $session->getFlashBag()->get('error');
            return $this->render('login.html.twig', array("errorMessages" => $errorMessages));
        }
        $entityManager = $this->getDoctrine()->getManager();
        $following = $entityManager->getRepository(Siguiendo::class)->findBy(['follower' => $this->getUser()]);
        $followers = $entityManager->getRepository(Siguiendo::class)->findBy(['following' => $this->getUser()]);
        $favoritos = $entityManager->getRepository(Favorito::class)->findBy(['cod_usuario' => $this->getUser()->getCodigo()]);
        $criticas = $entityManager->getRepository(Critica::class)->findBy(['cod_usuario' => $this->getUser()->getCodigo()]);
        foreach ($criticas as $critica) {
            $comentarios = $entityManager->getRepository(Comentario::class)->findBy(['critica' => $critica->getCodigo()]);
            foreach ($comentarios as $comentario) {
                $likes = $entityManager->getRepository(Like::class)->findBy(['cod_comentario' => $comentario->getCodigo()]);
                $comentario->setLikes($likes);
            }
            $critica->setComentarios($comentarios);
            $likes = $entityManager->getRepository(Like::class)->findBy(['cod_critica' => $critica->getCodigo()]);
            $critica->setLikes($likes);
        }
        return $this->render('perfil.html.twig', ['followings' => $following, 'followers' => $followers, 'favoritos' => $favoritos, 'criticas' => $criticas]);
    }
    #[Route('/usuario/{usuario}', name: 'usuario')]
    public function usuario($usuario = 0)
    {
        $entityManager = $this->getDoctrine()->getManager();
        $usuario = $entityManager->getRepository(Usuario::class)->findOneBy(['usuario' => $usuario]);
        if ($usuario) return $this->render('perfil.html.twig');
        return $this->redirectToRoute('home');
    }
    #[Route('/prueba', name: 'prueba')]
    public function prueba()
    {
        $entityManager = $this->getDoctrine()->getManager();
        $usuario = $entityManager->getRepository(Siguiendo::class)->findOneBy(['codigo' => 1]);
        var_dump($usuario->getFollower()->getUsuario());
        var_dump($usuario->getFollowing()->getUsuario());
        die;
        return $this->redirectToRoute('home');
    }
    #[Route('/logout', name: 'logout')]
    public function logout()
    {
        return $this->redirectToRoute('perfil');
    }
}
