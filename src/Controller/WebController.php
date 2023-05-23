<?php

namespace App\Controller;

use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Security\Core\Authentication\Token\UsernamePasswordToken;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Entity\Usuario;

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
        return $this->render('admin1.html.twig', ['titulos' => null, "generos" => null]);
    }
    /**
     * @Route("/formAdmin", name="formAdmin")
     */
    public function formAdmin()
    {
        var_dump($_FILES);
        var_dump($_POST);die;
       // return $this->render('admin.html.twig', ['titulos' => null, "generos" => null]);
       if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        // Obtener los valores del formulario
        $tipo = $_POST['tipo'];
        $titulo = $_POST['titulo'];
        $alias = $_POST['alias'];
        $descripcion = $_POST['descripcion'];
        $estreno = $_POST['estreno'];
        $poster = $_FILES['poster'];
        $portada = $_FILES['portada'];
        $trailer = $_POST['trailer'];
        $generos = isset($_POST['generos']) ? $_POST['generos'] : array(); // Array de generos seleccionados
    
        // Procesar los datos o guardarlos en la base de datos
    
        // Ejemplo de cómo imprimir los valores obtenidos
        echo "Tipo: " . $tipo . "<br>";
        echo "Título: " . $titulo . "<br>";
        echo "Alias: " . $alias . "<br>";
        echo "Descripción: " . $descripcion . "<br>";
        echo "Estreno: " . $estreno . "<br>";
        // Aquí puedes realizar las acciones necesarias con los archivos subidos
        // ...
        echo "Trailer: " . $trailer . "<br>";
        echo "Generos seleccionados: ";
        foreach ($generos as $genero) {
            echo $genero . ", ";
        }
    }die;
    }
    /**
     * @Route("/comunidad", name="comunidad")
     */
    public function comunidad()
    {
        return $this->render('comunidad.html.twig');
    }

    /**
     * @Route("/criticas", name="criticas")
     */
    public function criticas()
    {
        return $this->render('criticas.html');
    }

    /**
     * @Route("/perfil", name="perfil")
     */
    public function perfil(SessionInterface $session,Request $request)
    {
        if($request->isMethod('POST')){
            $entityManager = $this->getDoctrine()->getManager();
            $correo = $request->request->get('_username');
            $user = $request->request->get('usuario');
            $clave = $request->request->get('_password');
            $usuarios = $entityManager->getRepository(Usuario::class);
            $buscado = $usuarios->findBy([
                'usuario' => $user
            ]);

            if (empty($buscado)) {
                $buscado2 = $usuarios->findBy([
                    'correo' => $correo
                ]);
                if (empty($buscado2)) {
                    $usuario = new Usuario;
                    /*$usuario->setCorreo($correo);*/
                    $usuario->setCorreo(preg_replace('/\s+/', '', $correo));
                    $usuario->setClave(password_hash($clave, PASSWORD_DEFAULT));
                    /*$usuario->setUsuario($user);*/
                    $usuario->setUsuario(preg_replace('/\s+/', '', $user));
                    $entityManager->persist($usuario);
                    $entityManager->flush();
                    $buscado3 = $usuarios->findBy([
						'correo' => $correo
						]);
					
					return $this->redirectToRoute("correoActivacion", ["codigo" => $buscado3[0]->getCodigo()]);
                }
            }

        }
        else {
            if (!$this->getUser()) {
                $errorMessages = $session->getFlashBag()->get('error');
                return $this->render('login.html.twig', array("errorMessages" => $errorMessages));
            }
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
