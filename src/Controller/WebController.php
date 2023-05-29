<?php

namespace App\Controller;

use App\Entity\Comentario;
use App\Entity\Contenido;
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
    #[Route('/contenido/{codigo}/{nombre}', name: 'contenido')]
    public function contenido($codigo = 0)
    {
        $entityManager = $this->getDoctrine()->getManager();

        if ($contenido = $entityManager->getRepository(Contenido::class)->findOneBy(['codigo' => $codigo])) {
            $criticas = $entityManager->getRepository(Critica::class)->findBy(['cod_contenido' => $contenido->getCodigo()]);
            foreach ($criticas as $critica) {
                if ($this->getUser()) $critica->setOwnlike($entityManager->getRepository(Like::class)->findOneBy(['cod_critica' => $critica->getCodigo(), 'usuario_objeto' => $this->getUser()]));
                $comentarios = $entityManager->getRepository(Comentario::class)->findBy(['critica' => $critica->getCodigo()], ['fecha' => 'DESC']);
                foreach ($comentarios as $comentario) {
                    if ($this->getUser()) $comentario->setOwnlike($entityManager->getRepository(Like::class)->findOneBy(['cod_comentario' => $comentario->getCodigo(), 'usuario_objeto' => $this->getUser()]));
                    $likes = $entityManager->getRepository(Like::class)->findBy(['cod_comentario' => $comentario->getCodigo()]);
                    $comentario->setLikes($likes);
                }
                $critica->setComentarios($comentarios);
                $likes = $entityManager->getRepository(Like::class)->findBy(['cod_critica' => $critica->getCodigo()]);
                $critica->setLikes($likes);
            }
            return $this->render('contenido.html.twig', ['contenido' => $contenido, 'recomendados' => [], 'criticas' => $criticas]);
        }
        return $this->redirectToRoute('home');
    }
    #[Route('/admin', name: 'admin')]
    public function admin()
    {
        if ($this->isGranted('ROLE_ADMIN')) {
            return $this->render('admin.html.twig', ['titulos' => null, "generos" => null, "error" => false]);
        } else {
            return $this->redirectToRoute('home');
        }
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
        $criticas = $entityManager->getRepository(Critica::class)->findBy(['cod_usuario' => $this->getUser()->getCodigo()], ['fecha' => 'DESC']);
        foreach ($criticas as $critica) {
            if ($this->getUser()) $critica->setOwnlike($entityManager->getRepository(Like::class)->findOneBy(['cod_critica' => $critica->getCodigo(), 'usuario_objeto' => $this->getUser()]));
            $comentarios = $entityManager->getRepository(Comentario::class)->findBy(['critica' => $critica->getCodigo()], ['fecha' => 'DESC']);
            foreach ($comentarios as $comentario) {
                if ($this->getUser()) $comentario->setOwnlike($entityManager->getRepository(Like::class)->findOneBy(['cod_comentario' => $comentario->getCodigo(), 'usuario_objeto' => $this->getUser()]));
                $likes = $entityManager->getRepository(Like::class)->findBy(['cod_comentario' => $comentario->getCodigo()]);
                $comentario->setLikes($likes);
            }
            $critica->setComentarios($comentarios);
            $likes = $entityManager->getRepository(Like::class)->findBy(['cod_critica' => $critica->getCodigo()]);
            $critica->setLikes($likes);
        }
        return $this->render('perfil.html.twig', ['usuario' => $this->getUser(), 'followings' => $following, 'followers' => $followers, 'favoritos' => $favoritos, 'criticas' => $criticas]);
    }
    #[Route('/usuario/{username}', name: 'usuario')]
    public function usuario($username = 0)
    {
        $entityManager = $this->getDoctrine()->getManager();
        $usuario = $entityManager->getRepository(Usuario::class)->findOneBy(['usuario' => $username]);
        if ($usuario && ((!$this->getUser()) || ($this->getUser()->getCodigo() != $usuario->getCodigo()))) {
            $es_seguido = null;
            if ($this->getUser()) {
                $es_seguido = $entityManager->getRepository(Siguiendo::class)->findOneBy(['following' => $usuario, 'follower' => $this->getUser()]);
            }
            $following = $entityManager->getRepository(Siguiendo::class)->findBy(['follower' => $usuario]);
            $followers = $entityManager->getRepository(Siguiendo::class)->findBy(['following' => $usuario]);
            $favoritos = $entityManager->getRepository(Favorito::class)->findBy(['cod_usuario' => $usuario->getCodigo()]);
            $criticas = $entityManager->getRepository(Critica::class)->findBy(['cod_usuario' => $usuario->getCodigo()], ['fecha' => 'DESC']);
            foreach ($criticas as $critica) {
                if ($this->getUser()) $critica->setOwnlike($entityManager->getRepository(Like::class)->findOneBy(['cod_critica' => $critica->getCodigo(), 'usuario_objeto' => $this->getUser()]));
                $comentarios = $entityManager->getRepository(Comentario::class)->findBy(['critica' => $critica->getCodigo()], ['fecha' => 'DESC']);
                foreach ($comentarios as $comentario) {
                    if ($this->getUser()) $comentario->setOwnlike($entityManager->getRepository(Like::class)->findOneBy(['cod_comentario' => $comentario->getCodigo(), 'usuario_objeto' => $this->getUser()]));
                    $likes = $entityManager->getRepository(Like::class)->findBy(['cod_comentario' => $comentario->getCodigo()]);
                    $comentario->setLikes($likes);
                }
                $critica->setComentarios($comentarios);
                $likes = $entityManager->getRepository(Like::class)->findBy(['cod_critica' => $critica->getCodigo()]);
                $critica->setLikes($likes);
            }
            return $this->render('perfil.html.twig', ['usuario' => $usuario, 'followings' => $following, 'followers' => $followers, 'favoritos' => $favoritos, 'criticas' => $criticas, 'es_seguido' => $es_seguido]);
        }
        return $this->redirectToRoute('perfil');
    }
    #[Route('/prueba', name: 'prueba')]
    public function prueba()
    {
    }
    #[Route('/logout', name: 'logout')]
    public function logout()
    {
        return $this->redirectToRoute('perfil');
    }
}
