<?php

namespace App\Controller;

use App\Entity\Comentario;
use App\Entity\Contenido;
use App\Entity\Valora;
use App\Entity\Actor;
use App\Entity\Critica;
use App\Entity\Favorito;
use App\Entity\Genero;
use App\Entity\Generos;
use App\Entity\Usuario;
use App\Entity\Siguiendo;
use App\Entity\Like;
use App\Entity\Visita;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Session\SessionInterface;

class WebController extends AbstractController
{
    #[Route('/', name: 'home')]
    public function home()
    {
        $entityManager = $this->getDoctrine()->getManager();
        $queryBuilder = $entityManager->getRepository(Visita::class)->createQueryBuilder('v')->join('v.contenido', 'c');;
        $queryBuilder->select("c.codigo");
        $queryBuilder->distinct(true);
        // $queryBuilder->orderBy('v.fecha', 'DESC')->addOrderBy('v.contador', 'DESC');
        $queryBuilder->orderBy('v.contador', 'DESC');
        $queryBuilder->setMaxResults(6);
        $results = $queryBuilder->getQuery()->getResult();
        $destacados = null;
        for ($i = 0; $i <  count($results); $i++) {
            # code...
            $destacados[] = $entityManager->getRepository(Contenido::class)->findOneBy(['codigo' => $results[$i]]);
        }
        $queryBuilder = $entityManager->getRepository(Visita::class)->createQueryBuilder('v')->join('v.contenido', 'c');;
        $queryBuilder->select("c.codigo");
        $queryBuilder->distinct(true);
        $queryBuilder->orderBy('v.fecha', 'DESC')->addOrderBy('v.contador', 'DESC');
        $queryBuilder->setMaxResults(16);
        $results = $queryBuilder->getQuery()->getResult();
        $popular = null;
        for ($i = 0; $i < count($results); $i++) {
            $popular[] = $entityManager->getRepository(Contenido::class)->findOneBy(['codigo' => $results[$i]]);
        }
        shuffle($popular);
        // shuffle($destacados);

        $novedades = $entityManager->getRepository(Contenido::class)->findBy([], ['estreno' => 'DESC'], 16);
        return $this->render('home.html.twig', ['destacados' => $destacados, 'popular' => $popular, 'novedades' => $novedades]);
    }
    #[Route('/catalogo', name: 'catalogo')]
    public function catalogo()
    {
        $entityManager = $this->getDoctrine()->getManager();
        $generos = $entityManager->getRepository(Generos::class)->findBy([], ['nombre' => "DESC"]);
        $queryBuilder = $entityManager->getRepository(Contenido::class)->createQueryBuilder('c');
        $queryBuilder->select("SUBSTRING(c.estreno, 1, 4) AS year");
        $queryBuilder->distinct(true);
        $queryBuilder->orderBy('c.estreno', 'DESC');
        $results = $queryBuilder->getQuery()->getResult();
        $anios = [];
        foreach ($results as $result) {
            $anios[] = $result['year'];
        }
        $contenidos = [];
        $filtros = null;
        $filtros['titulo'] = null;
        $filtros['generos'] = [];
        $filtros['fecha'] = [];
        $filtros['ordenar'] = null;
        if ($_POST) {
            $queryBuilder = $entityManager->getRepository(Genero::class)->createQueryBuilder('g')->join('g.contenido', 'c');
            $queryBuilder->select('DISTINCT c.codigo');
            if (isset($_POST['titulo']) && $_POST['titulo']) {
                $filtros['titulo'] = $_POST['titulo'];
                $titulo = trim(strtolower($_POST['titulo']));
                $queryBuilder->andWhere($queryBuilder->expr()->like('LOWER(c.titulo)', ':titulo'))
                    ->orWhere($queryBuilder->expr()->like('LOWER(c.alias)', ':titulo'))
                    ->setParameter('titulo', '%' . $titulo . '%');
            }
            if (isset($_POST['generos']) && $_POST['generos']) {
                $filtros['generos'] = $_POST['generos'];
                $queryBuilder->andwhere($queryBuilder->expr()->in('g.cod_genero', $_POST['generos']));
            }
            if (isset($_POST['fecha']) && $_POST['fecha']) {
                $filtros['fecha'] = $_POST['fecha'];
                $queryBuilder->andwhere($queryBuilder->expr()->in('SUBSTRING(c.estreno, 1, 4)', $_POST['fecha']));
            }
            if (isset($_POST['ordenar'])) {
                $filtros['ordenar'] = $_POST['ordenar'];
                $order = $_POST['ordenar'] ? 'ASC' : 'DESC';
                $queryBuilder->orderBy('c.estreno', $order);
            } else {
                shuffle($contenidos);
            }
            $results = $queryBuilder->getQuery()->getResult();
            for ($i = 0; $i < count($results); $i++) {
                $contenidos[] = $entityManager->getRepository(Contenido::class)->findOneBy(['codigo' => $results[$i]]);
            }
        } else {
            $contenidos = $entityManager->getRepository(Contenido::class)->findAll();
            shuffle($contenidos);
        }
        //seleccionar todos e ir aplicando filtros

        return $this->render('catalogo.html.twig', ['generos' => $generos, 'fecha' => $anios, 'contenidos' => $contenidos, 'filtros' => json_encode($filtros), 'titulo_buscar' => $filtros['titulo']]);
    }
    #[Route('/comunidad', name: 'comunidad')]
    public function comunidad()
    {
        if ($this->getUser()) {
            $entityManager = $this->getDoctrine()->getManager();
            $siguiendos = $entityManager->getRepository(Siguiendo::class)->findBy(['usuario' => $this->getUser()->getCodigo()]);
            $usuarios = [$this->getUser()->getCodigo()];
            foreach ($siguiendos as $siguiendo) {
                $usuarios[] = $siguiendo->getSiguiendo();
            }
            $criticas = $entityManager->getRepository(Critica::class)->findBy(['cod_usuario' => $usuarios], ['fecha' => 'DESC']);
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

            return $this->render('comunidad.html.twig', ['criticas' => $criticas]);
        }

        return $this->redirectToRoute('perfil');
    }

    #[Route('/catalogo/{codigo}/{nombre}', name: 'contenido')]
    public function contenido($codigo = 0, $nombre = 0)
    {

        $entityManager = $this->getDoctrine()->getManager();

        if ($contenido = $entityManager->getRepository(Contenido::class)->findOneBy(['codigo' => $codigo])) {
            $result = $entityManager->getRepository(Genero::class)->findBy(['contenido' => $contenido]);
            $contenido->setGeneros($result);
            $generos = [];
            foreach ($result as $genero) {
                $generos[] = $genero->getGenero()->getCodigo();
            }
            $recomendados = [];
            if ($generos) {
                $queryBuilder = $entityManager->getRepository(Genero::class)->createQueryBuilder('g')->join('g.contenido', 'c');
                $queryBuilder->select('DISTINCT c.codigo');
                $queryBuilder->where($queryBuilder->expr()->in('g.cod_genero', $generos));
                $queryBuilder->andWhere('c.codigo != :contenido');
                $queryBuilder->setParameter('contenido', $contenido->getCodigo());
                $queryBuilder->orderBy('c.estreno', 'DESC');
                $results = $queryBuilder->getQuery()->getResult();
                for ($i = 0; $i < count($results) && $i < 8; $i++) {
                    $recomendados[] = $entityManager->getRepository(Contenido::class)->findOneBy(['codigo' => $results[$i]]);
                }
            }
            if (!$recomendados) {
                $recomendados = $entityManager->getRepository(Contenido::class)->findBy([], [], 8);
            }
            shuffle($recomendados);

            $results = $entityManager->getRepository(Valora::class)->findBy(['cod_contenido' => $codigo]);
            $puntuacion = 0;
            foreach ($results as $result) {
                $puntuacion += $result->getPuntuacion();
            }
            $puntuacion = $puntuacion ? ($puntuacion * 100) / (5 * count($results)) : 0;
            $puntuacion = $puntuacion . "%";
            $valora = $entityManager->getRepository(Valora::class)->findOneBy(['cod_contenido' => $codigo, 'cod_usuario' => $this->getUser()->getCodigo()]);
            $valora = $valora ? $valora->getPuntuacion() : 0;
            $criticas = $entityManager->getRepository(Critica::class)->findBy(['cod_contenido' => $contenido->getCodigo()], ['fecha' => 'DESC']);
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
            $contenido->setOwnlike($entityManager->getRepository(Favorito::class)->findOneBy(['contenido' => $contenido, 'cod_usuario' => $this->getUser()->getCodigo()]));
            return $this->render('contenido.html.twig', ['contenido' => $contenido, 'recomendados' => $recomendados, 'criticas' => $criticas, 'valora' => $valora, 'puntuacion' => $puntuacion]);
        }
        return $this->redirectToRoute('home');
    }
    #[Route('/admin', name: 'admin')]
    public function admin()
    {
        if ($this->isGranted('ROLE_ADMIN')) {
            $entityManager = $this->getDoctrine()->getManager();
            $generos = $entityManager->getRepository(Generos::class)->findBy([], ['nombre' => 'ASC']);
            $actores = $entityManager->getRepository(Actor::class)->findBy([], ['nombre' => 'ASC']);
            return $this->render('admin.html.twig', ['titulos' => null, "generos" => $generos, "error" => false, 'actores' => $actores]);
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
    #[Route('/perfil/{username}', name: 'usuario')]
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
        var_dump($_POST);
        die;
    }
    #[Route('/logout', name: 'logout')]
    public function logout()
    {
        return $this->redirectToRoute('perfil');
    }
}
