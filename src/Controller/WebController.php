<?php

namespace App\Controller;

use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Security\Core\Authentication\Token\UsernamePasswordToken;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Filesystem\Filesystem;
use Symfony\Component\Filesystem\Path;
use Symfony\Component\Finder\Finder;
use Symfony\Component\Validator\Constraints\DateTime;
use App\Entity\Contenido;

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
        return $this->render('admin1.html.twig', ['titulos' => null, "generos" => null, "error"=>false]);
    }
    /**
     * @Route("/formAdmin", name="formAdmin")
     */
    public function formAdmin(){
        //var_dump($_FILES);
       // var_dump($_REQUEST);
       // var_dump($_POST);

       // return $this->render('admin.html.twig', ['titulos' => null, "generos" => null]);
       if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        if(isset($_POST['tipo'])){
            if($_POST['tipo'] == 1){
                if(isset($_POST['titulo'],$_POST['alias'],$_POST['descripcion'],$_POST['estreno'],$_FILES['poster'],$_FILES['portada'],$_POST['trailer'],$_POST['generos'])){
                    $tipo = $_POST['tipo'];
                    $titulo = $_POST['titulo'];
                    $alias = $_POST['alias'];
                    $descripcion = $_POST['descripcion'];
                    $estreno = $_POST['estreno'];
                    $poster = $_FILES['poster'];
                    $portada = $_FILES['portada'];
                    $trailer = $_POST['trailer'];
                    $generos = $_POST['generos'];

                    //Creo la pelicula tabla de contenidos.
                    $entityManager = $this->getDoctrine()->getManager();
                    $pelicula = new Contenido();
                    $pelicula->setTitulo($titulo);
                    $pelicula->setAlias($alias);
                    $pelicula->setDescripcion($descripcion);
                    $pelicula->setEstreno(new \DateTime ($estreno));

                    $pelicula->setTrailer($trailer);
                    if(!($_FILES['poster']['name'] == '') && !($_FILES['portada']['name'] == '')){
                        $pelicula->setPoster($_FILES['poster']['name']);
                        $pelicula->setPortada($_FILES['portada']['name']);

                        //Añadir el documento a la carpeta correspondiente en public.
                        $posterFile = $_FILES['poster']['tmp_name'];
                        $portadaFile = $_FILES['portada']['tmp_name'];
                        $filesystem = new Filesystem();
                        $directorio = dirname(__FILE__);
                        $rutaPoster = $filesystem->exists($directorio.'/../../public/'.$titulo.'/Poster/');
                        $rutaPortada = $filesystem->exists($directorio.'/../../public/'.$titulo.'/Portada/');
                        var_dump($rutaPortada);
                        if(!$rutaPoster && !$rutaPortada){
                            $this->comprobarcarpeta($titulo);    
                        }
                        $rutaPosterF = $directorio.'/../../public/'.$titulo.'/Poster/'.$_FILES['poster']['name'];
                        $rutaPortadaF = $directorio.'/../../public/'.$titulo.'/Portada/'.$_FILES['portada']['name'];
                        $mover = move_uploaded_file($posterFile, $rutaPosterF); 
                        $mover = move_uploaded_file($portadaFile, $rutaPortadaF); 

                    }

                    $entityManager->persist($pelicula); 
                    $entityManager->flush(); 
                    

                }else{
                    return $this->render('admin1.html.twig', ['titulos' => null, "generos" => null, "error"=>true]);  
                }
            }else{
                if(isset($titulo,$alias,$poster,$portada,$generos)){
                    echo("hola");

                }else{
                    return $this->render('admin1.html.twig', ['titulos' => null, "generos" => null, "error"=>true]);  
                }
            }
        }
    } 
    return $this->render('admin1.html.twig', ['titulos' => null, "generos" => null, "error"=>false]);  
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


//Funciones

    //Funcion para crear la carpeta de usuario y dentro de el la de cv
    private function comprobarcarpeta($titulo){
        try {
            $filesystem = new Filesystem();
            $finder = new Finder();
            $directorio = dirname(__FILE__);
            $filesystem->exists($directorio.'/../../public/'.$titulo.'/Poster/');
            $filesystem->exists($directorio.'/../../public/'.$titulo.'/Portada/');
            if(is_dir($directorio.'/../../public/'.$titulo.'/Poster/') && is_dir($directorio.'/../../public/'.$titulo.'/Portada/')){
                    echo null;
            }else{
                $filesystem->mkdir(
                    Path::normalize($directorio.'/../../public/'.$titulo.'/Poster/'),
                );
                $filesystem->mkdir(
                    Path::normalize($directorio.'/../../public/'.$titulo.'/Portada/'),
                );
            } 
           }
           catch (IOExceptionInterface $exception) {
            echo "An error occurred while creating your directory at ".$exception->getPath();
        }
    }
}
