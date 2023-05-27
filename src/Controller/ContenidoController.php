<?php

namespace App\Controller;

use App\Entity\Actor;
use App\Entity\Critica;
use App\Entity\Comentario;
use App\Entity\Contenido;
use App\Entity\Favorito;
use App\Entity\Genero;
use App\Entity\Generos;
use App\Entity\Like;
use App\Entity\Reparto;
use App\Entity\Serie;
use Symfony\Component\Finder\Finder;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use App\Entity\Usuario;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Filesystem\Filesystem;

class ContenidoController extends AbstractController
{
    #[Route('/crearCritica', name: 'crearCritica')]
    public function crearCritica(Request $request)
    {
        $js['respuesta'] = false;
        $codigo = $request->request->get('codigo');
        $texto = $request->request->get('texto');
        $entityManager = $this->getDoctrine()->getManager();
        if ($entityManager->getRepository(Contenido::class)->findOneBy(['codigo' => $codigo])) {
            $critica = new Critica();
            $critica->setComentario($texto);
            $critica->setCod_contenido($codigo);
            $critica->setCod_usuario($this->getUser()->getCodigo());
            $entityManager->persist($critica);
            $entityManager->flush();
            $js['respuesta'] = true;
        }
        return new JSONResponse($js);
    }
    #[Route('/crearComentario', name: 'crearComentario')]
    public function crearComentario(Request $request)
    {
        $js['respuesta'] = false;
        $codigo = $request->request->get('codigo');
        $texto = $request->request->get('texto');
        $entityManager = $this->getDoctrine()->getManager();
        if ($entityManager->getRepository(Critica::class)->findOneBy(['codigo' => $codigo])) {
            $comentario = new Comentario();
            $comentario->setComentario($texto);
            $comentario->setFecha(new \DateTime());
            $comentario->setUsuario_objeto($this->getUser());
            $comentario->setCritica($codigo);
            $entityManager->persist($comentario);
            $entityManager->flush();
            $js['respuesta'] = true;
        }
        return new JSONResponse($js);
    }
    #[Route('/eliminarComentario', name: 'eliminarComentario')]
    public function eliminarComentario(Request $request)
    {
        $js['respuesta'] = false;
        $codigo = $request->request->get('codigo');
        $tipo = $request->request->get('tipo');
        $entityManager = $this->getDoctrine()->getManager();
        if ($tipo) {
            $js['respuesta'] = true;
            if ($critica = $entityManager->getRepository(Critica::class)->findOneBy(['codigo' => $codigo, 'cod_usuario' => $this->getUser()->getCodigo()])) $entityManager->remove($critica);
        } else {
            $js['respuesta'] = true;
            if ($comentario = $entityManager->getRepository(Comentario::class)->findOneBy(['codigo' => $codigo, 'usuario' => $this->getUser()->getCodigo()])) $entityManager->remove($comentario);
        }
        $entityManager->flush();

        return new JSONResponse($js);
    }
    #[Route('/darLike', name: 'darLike')]
    public function darLike(Request $request)
    {
        $js['respuesta'] = false;
        $codigo = $request->request->get('codigo');
        $tipo = $request->request->get('tipo');
        $entityManager = $this->getDoctrine()->getManager();
        $tipo = $tipo ? "cod_critica" : "cod_comentario";
        $like = $entityManager->getRepository(Like::class)->findOneBy([$tipo => $codigo, 'cod_usuario' => $this->getUser()->getCodigo()]);
        if ($like) {
            $entityManager->remove($like);
            $js['respuesta'] = 0;
        } else {
            $like = new Like();
            switch ($tipo) {
                case 'cod_critica':
                    $like->setCod_critica($codigo);
                    break;
                default:
                    $like->setCod_comentario($codigo);
                    break;
            }
            $like->setCod_usuario($this->getUser()->getCodigo());
            $entityManager->persist($like);
            $js['respuesta'] = 1;
        }
        $entityManager->flush();
        return new JSONResponse($js);
    }
    #[Route('/darFavorito', name: 'darFavorito')]
    public function darFavorito(Request $request)
    {
        $js['respuesta'] = false;
        $codigo = $request->request->get('codigo');
        $entityManager = $this->getDoctrine()->getManager();
        if ($favorito = $entityManager->getRepository(Favorito::class)->findOneBy(['cod_contenido' => $codigo, 'cod_usuario' => $this->getUser()->getCodigo()])) {
            $entityManager->remove($favorito);
            $js['respuesta'] = 0;
        } else {
            $favorito = new Favorito();
            $favorito->setCod_usuario($this->getUser()->getCodigo());
            $favorito->setCod_contenido($codigo);
            $entityManager->persist($favorito);
            $js['respuesta'] = 1;
        }
        $entityManager->flush();
        return new JSONResponse($js);
    }
    #[Route('/crearContenido', name: 'crearContenido')]
    public function crearContenido()
    {
        if (isset($_POST['tipo'], $_POST['titulo'], $_POST['alias'], $_POST['estreno'], $_FILES['poster'], $_FILES['portada'], $_POST['trailer'], $_POST['generos'], $_POST['actores'])) {

            $entityManager = $this->getDoctrine()->getManager();

            $contenido = new Contenido();
            $contenido->setTitulo(trim($_POST['titulo']));
            $contenido->setAlias(trim($_POST['alias']));
            $contenido->setPoster($_FILES['poster']['name']);
            $contenido->setPortada($_FILES['portada']['name']);
            $entityManager->persist($contenido);
            $entityManager->flush();
            if ($_POST['tipo']) {
                //pelicula
                $contenido->setDescripcion(isset($_POST['descripcion']) ? $_POST['descripcion'] : null);
                $contenido->setEstreno(isset($_POST['estreno']) ? new \DateTime($_POST['estreno']) : new \DateTime());
                $contenido->setTrailer(isset($_POST['trailer']) ? $_POST['trailer'] : null);
            } else if (isset($_POST['temporada'], $_POST['episodios'])) {
                for ($i = 0; $i < count($_POST['temporada']); $i++) {
                    $serie = new Serie();
                    $serie->setTemporada($_POST['temporada'][$i]);
                    $serie->setDescripcion($_POST['descripcion'][$i]);
                    $serie->setEpisodios($_POST['episodios'][$i]);
                    $serie->setTrailer($_POST['trailer']);
                    $serie->setContenido($contenido->getCodigo());

                    $entityManager->persist($serie);
                }
            }
            foreach ($_POST['actores'] as $actor) {
                $actor = trim($actor);
                $object = $entityManager->getRepository(Actor::class)->createQueryBuilder('a')->andWhere("LOWER(a.nombre) = LOWER('$actor')")->getQuery()->getOneOrNullResult();
                if (!$object) {
                    $object = new Actor();
                    $object->setNombre(ucfirst($actor));
                    $entityManager->persist($object);
                    $entityManager->flush();
                }
                $reparto = new Reparto;
                $reparto->setCod_actor($object->getCodigo());
                $reparto->setCod_contenido($contenido->getCodigo());
                $entityManager->persist($reparto);
                // 
                # code...
            }
            if ($_FILES['poster']) {
                $this->guardarArchivo($contenido->getCodigo(), $_FILES['poster'], 1);
                $contenido->setPoster($_FILES['poster']['name']);
            }
            if ($_FILES['portada']) {
                $this->guardarArchivo($contenido->getCodigo(), $_FILES['portada'], 0);
                $contenido->setPoster($_FILES['portada']['name']);
            }

            foreach ($_POST['generos'] as $genero) {
                $genero = trim($genero);
                $generos = $entityManager->getRepository(Generos::class)->createQueryBuilder('g')->andWhere("LOWER(g.nombre) = LOWER('$genero')")->getQuery()->getOneOrNullResult();
                if (!$generos) {
                    $generos = new Generos();
                    $generos->setNombre(ucfirst($genero));
                    $entityManager->persist($generos);
                    $entityManager->flush();
                }
                $genero = new Genero();
                $genero->setCod_genero($genero->getCodigo());
                $genero->setCod_contenido($contenido->getCodigo());
                $entityManager->persist($genero);
            }
            $entityManager->flush();
        }
        return $this->redirectToRoute('contenido', ['codigo' => $contenido || 0]);
    }
    #[Route('/eliminarContenido', name: 'eliminarContenido')]
    public function eliminarContenido()
    {
        $codigo = isset($_POST['codigo']) ? $_POST['codigo'] : 0;
        if ($this->isGranted('ROLE_ADMIN')) {
            $entityManager = $this->getDoctrine()->getManager();
            if ($contenido = $entityManager->getRepository(Contenido::class)->findOneBy(['codigo' => $codigo])) {

                $parentFolderToDelete = 'public/Contenido/c' . $contenido->getCodigo(); // Reemplaza 'Padre' con el nombre de la carpeta padre que deseas eliminar

                $parentFolderPath = $this->getParameter('kernel.project_dir') . '/' . $parentFolderToDelete;

                if (file_exists($parentFolderPath) && is_dir($parentFolderPath)) {
                    $finder = new Finder();
                    $finder->files()->in($parentFolderPath)->ignoreDotFiles(false);

                    foreach ($finder as $file) {
                        unlink($file->getRealPath());
                    }

                    $iterator = new \RecursiveIteratorIterator(
                        new \RecursiveDirectoryIterator($parentFolderPath, \RecursiveDirectoryIterator::SKIP_DOTS),
                        \RecursiveIteratorIterator::CHILD_FIRST
                    );

                    foreach ($iterator as $path) {
                        if ($path->isDir()) {
                            rmdir($path->getPathname());
                        } else {
                            unlink($path->getPathname());
                        }
                    }

                    rmdir($parentFolderPath);
                }

                $entityManager->remove($contenido);
            }
        }
        return $this->redirectToRoute('contenido', ['codigo' => $codigo]);
    }
    #[Route('/contenido/{codigo}', name: 'contenido')]
    public function contenido($codigo = 0)
    {
        $entityManager = $this->getDoctrine()->getManager();

        if ($contenido = $entityManager->getRepository(Contenido::class)->findOneBy(['codigo' => $codigo])) {
            $criticas = $entityManager->getRepository(Critica::class)->findBy(['cod_contenido' => $contenido->getCodigo()]);
            return $this->render("contenido.html.twig", ['contenido' => $contenido, 'criticas' => $criticas]);
        }
        return $this->redirectToRoute('home');
    }
    private function guardarArchivo($codigo, $file, $tipo)
    {
        $filesystem = new Filesystem();
        $tipo = $tipo ? 'poster' : 'header';
        $folderPath = $this->getParameter('kernel.project_dir') . '/public/Contenido/c' . $codigo . '/' . $tipo . '/';

        // Verificar si la carpeta existe, si no existe, crearla
        if (!$filesystem->exists($folderPath)) {
            $filesystem->mkdir($folderPath);
        }
        $filePath = $folderPath . $file['poster']['name'];
        move_uploaded_file($file['poster']['tmp_name'], $filePath);
    }
}
