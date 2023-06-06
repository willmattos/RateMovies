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
use App\Entity\Visita;
use App\Entity\Valora;
use Symfony\Component\Finder\Finder;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Filesystem\Filesystem;
use Symfony\Component\HttpFoundation\Session\SessionInterface;

class ContenidoController extends AbstractController
{
    #[Route('/crearCritica', name: 'crearCritica')]
    public function crearCritica(Request $request)
    {
        $js['respuesta'] = false;
        $codigo = $request->request->get('codigo');
        $texto = $request->request->get('texto');
        $entityManager = $this->getDoctrine()->getManager();
        if ($contenido = $entityManager->getRepository(Contenido::class)->findOneBy(['codigo' => $codigo])) {
            $critica = new Critica();
            $critica->setComentario($texto);
            $critica->setContenido($contenido);
            $critica->setUsuario($this->getUser());
            $critica->setFecha(new \DateTime());
            $entityManager->persist($critica);
            $entityManager->flush();
            $js['respuesta'] = true;
            $js['codigo'] = $critica->getCodigo();
            $js['fecha'] = $critica->getFecha()->format('Y/m/d H:i:s');
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
            $js['codigo'] = $comentario->getCodigo();
            $js['fecha'] = $comentario->getFecha()->format('Y/m/d H:i:s');
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
        if ($tipo && $this->getUser()) {
            $js['respuesta'] = true;
            if ($critica = $entityManager->getRepository(Critica::class)->findOneBy(['codigo' => $codigo, 'cod_usuario' => $this->getUser()->getCodigo()])) $entityManager->remove($critica);
        } else if ($this->getUser()) {
            $js['respuesta'] = true;
            if ($comentario = $entityManager->getRepository(Comentario::class)->findOneBy(['codigo' => $codigo, 'usuario' => $this->getUser()->getCodigo()])) $entityManager->remove($comentario);
        }
        $entityManager->flush();

        return new JSONResponse($js);
    }
    #[Route('/darLike', name: 'darLike')]
    public function darLike(Request $request)
    {
        if (!$this->getUser()) return new JSONResponse($js['respuesta'] = false);
        $js['respuesta'] = true;
        $codigo = $request->request->get('codigo');
        $tipo = $request->request->get('tipo');
        $entityManager = $this->getDoctrine()->getManager();
        $tipo = $tipo ? "cod_critica" : "cod_comentario";
        $like = $entityManager->getRepository(Like::class)->findOneBy([$tipo => $codigo, 'cod_usuario' => $this->getUser()->getCodigo()]);
        if ($like) {
            $entityManager->remove($like);
            $js['tipo'] = 0;
        } else {
            $like = new Like();
            $aceptar = false;
            switch ($tipo) {
                case 'cod_critica':
                    if ($contenido = $entityManager->getRepository(Critica::class)->findOneBy(['codigo' => $codigo])) {
                        $like->setCod_critica($codigo);
                        $aceptar = true;
                    }
                    break;
                default:
                    if ($entityManager->getRepository(Comentario::class)->findOneBy(['codigo' => $codigo])) {
                        $like->setCod_comentario($codigo);
                        $aceptar = true;
                    }
                    break;
            }
            if ($aceptar) {
                $like->setUsuario_objeto($this->getUser());
                $entityManager->persist($like);
                $js['tipo'] = 1;
            } else {
                $js['respuesta'] = false;
            }
        }
        $entityManager->flush();
        return new JSONResponse($js);
    }
    #[Route('/darFavorito', name: 'darFavorito')]
    public function darFavorito(Request $request)
    {
        $js['respuesta'] = false;
        $contenido = $request->request->get('codigo');
        $entityManager = $this->getDoctrine()->getManager();
        $contenido = $entityManager->getRepository(Contenido::class)->findOneBy(['codigo' => $contenido]);
        if ($contenido) {
            $js['respuesta'] = true;
            if ($favorito = $entityManager->getRepository(Favorito::class)->findOneBy(['contenido' => $contenido, 'cod_usuario' => $this->getUser()->getCodigo()])) {
                $entityManager->remove($favorito);
                $js['tipo'] = 0;
            } else {
                $favorito = new Favorito();
                $favorito->setCod_usuario($this->getUser()->getCodigo());
                $favorito->setContenido($contenido);
                $entityManager->persist($favorito);
                $js['tipo'] = 1;
            }
        }
        $entityManager->flush();
        return new JSONResponse($js);
    }
    #[Route('/puntuarContenido', name: 'puntuarContenido')]
    public function puntuarContenido(Request $request)
    {
        $js['respuesta'] = false;
        $codigo = $request->request->get('codigo');
        $puntuacion = $request->request->get('puntuacion');
        $entityManager = $this->getDoctrine()->getManager();

        if ($objeto = $entityManager->getRepository(Valora::class)->findOneBy(['cod_contenido' => $codigo, 'cod_usuario' => $this->getUser()->getCodigo(), 'puntuacion' => $puntuacion])) {
            $entityManager->remove($objeto);
            $js['respuesta'] = true;
            $js['cantidad'] = 0;
        } else if ($entityManager->getRepository(Contenido::class)->findOneBy(['codigo' => $codigo])) {
            $valora = $entityManager->getRepository(Valora::class)->findOneBy(['cod_contenido' => $codigo, 'cod_usuario' => $this->getUser()->getCodigo()]);
            $valora = $valora ? $valora : new Valora();
            $valora->setCod_usuario($this->getUser()->getCodigo());
            $valora->setCod_contenido($codigo);
            $valora->setPuntuacion($puntuacion);
            $entityManager->persist($valora);
            $js['respuesta'] = true;
            $js['cantidad'] = $puntuacion;
        }
        $entityManager->flush();
        return new JSONResponse($js);
    }
    #[Route('/crearContenido', name: 'crearContenido')]
    public function crearContenido(SessionInterface $session)
    {
        if (isset($_POST['tipo'], $_POST['titulo'], $_POST['alias'], $_POST['fecha'], $_POST['descripcion']) && strlen(trim($_POST['titulo'])) && strlen(trim($_POST['descripcion']))) {
            $entityManager = $this->getDoctrine()->getManager();
            $contenido = new Contenido();
            $contenido->setTitulo(ucfirst(trim($_POST['titulo'])));
            $contenido->setAlias(ucfirst(trim($_POST['alias'])));
            $contenido->setDescripcion(strlen($_POST['descripcion']) ? $_POST['descripcion'] : null);
            $contenido->setEstreno(strlen($_POST['fecha']) >= 10  ? new \DateTime($_POST['fecha']) : null);

            $entityManager->persist($contenido);
            $entityManager->flush();
            if ($_POST['tipo']) {
                $contenido->setSerie(0);
            } else {
                $contenido->setSerie(1);
            }
            if (isset($_FILES['poster']) && strlen($_FILES['poster']['name'])) {
                $this->guardarArchivo($contenido->getCodigo(), $_FILES['poster'], 1);
                $contenido->setPoster($_FILES['poster']['name']);
            }
            if (isset($_FILES['portada']) && strlen($_FILES['portada']['name'])) {
                $this->guardarArchivo($contenido->getCodigo(), $_FILES['portada'], 0);
                $contenido->setPortada($_FILES['portada']['name']);
            }
            if (isset($_POST['generos'])) {
                foreach ($_POST['generos'] as $genero) {
                    $nombre = ucfirst(trim($genero));
                    $genero = $entityManager->getRepository(Generos::class)->findOneBy(['nombre' => $nombre]);
                    if (!$genero) {
                        $genero = new Generos();
                        $genero->setNombre($nombre);
                        $entityManager->persist($genero);
                        $entityManager->flush();
                    }
                    $generos = new Genero();
                    $generos->setGenero($genero);
                    $generos->setContenido($contenido);
                    $entityManager->persist($generos);
                }
            }
            if (isset($_POST['reparto'])) {
                foreach ($_POST['reparto'] as $actor) {
                    $nombre = ucfirst(trim($actor));
                    $actor = $entityManager->getRepository(Actor::class)->findOneBy(['nombre' => $actor]);
                    if (!$actor) {
                        $actor = new Actor();
                        $actor->setNombre($nombre);
                        $entityManager->persist($actor);
                        $entityManager->flush();
                    }
                    $reparto = new Reparto;
                    $reparto->setCod_actor($actor->getCodigo());
                    $reparto->setCod_contenido($contenido->getCodigo());
                    $entityManager->persist($reparto);
                }
            }
            $entityManager->flush();
            return $this->redirectToRoute('contenido', ['codigo' => $contenido->getCodigo(), 'nombre' => $contenido->getTitulo()]);
        }
        $session->getFlashBag()->add('error', "Para");
        return $this->redirectToRoute('nuevo_contenido');
    }
    #[Route('/eliminarContenido', name: 'eliminarContenido')]
    public function eliminarContenido()
    {
        if ($this->isGranted('ROLE_ADMIN') && isset($_POST['codigo'])) {
            $entityManager = $this->getDoctrine()->getManager();
            if ($contenido = $entityManager->getRepository(Contenido::class)->findOneBy(['codigo' => $_POST['codigo']])) {
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
                $entityManager->flush();
            }
        }
        return $this->redirectToRoute('home');
    }
    #[Route('/agregarVisita', name: 'agregarVisita')]
    public function agregarVisita(Request $request)
    {
        $js['respuesta'] = false;
        $codigo = $request->request->get('codigo');
        $entityManager = $this->getDoctrine()->getManager();
        if ($contenido = $entityManager->getRepository(Contenido::class)->findOneBy(['codigo' => $codigo])) {
            $visita = $entityManager->getRepository(Visita::class)->findOneBy(['contenido' => $contenido, 'fecha' => new \DateTime()]);
            $visita = $visita ? $visita : new Visita();
            $visita->setContenido($contenido);
            $visita->setContador($visita->getContador() + 1);
            $visita->setFecha(new \DateTime());
            $entityManager->persist($visita);
            $entityManager->flush();
            $js['respuesta'] = true;
        }
        return new JsonResponse($js);
    }
    private function guardarArchivo($codigo, $file, $tipo)
    {
        $filesystem = new Filesystem();
        $tipo = $tipo ? 'poster' : 'portada';
        $folderPath = $this->getParameter('kernel.project_dir') . '/public/Contenido/c' . $codigo . '/' . $tipo . '/';
        // Verificar si la carpeta existe, si no existe, crearla
        if (!$filesystem->exists($folderPath)) {
            $filesystem->mkdir($folderPath, 0777, true);
        }
        $filePath = $folderPath . $file['name'];
        move_uploaded_file($file['tmp_name'], $filePath);
    }
}
