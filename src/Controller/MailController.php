<?php
namespace App\Controller;
// src/Controller/CrearUsuario.php
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;
use Symfony\Component\Mime\Address;
use App\Entity\Usuario;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Doctrine\DBAL\Exception\IntegrityConstraintViolationException;
class MailController extends AbstractController {
    
	/**
	* @Route("/correoActivacion/{codigo}", name="correoActivacion")
	*/  
	public function correoActivacion($codigo,MailerInterface $mailer){
		$entityManager = $this->getDoctrine()->getManager();
		$usuarios = $entityManager->getRepository(Usuario::class);
            $buscado = $usuarios->findBy([
                'codigo' => $codigo
            ]);
		if(!empty($buscado)){
			$correo = $buscado[0]->getCorreo(); 
			$message = new email();
        	$message->from(new Address('ratemovies@consymfony.com', "RateMovies"));
        	$message->to(new Address($correo));
			$message->subject("Activar cuenta");
        	$message->html("<html>
        		<body>
          			<a href='http://127.0.0.1".$this->container->get('router')->getContext()->getBaseUrl().'/activarUsuario'.'/'.$codigo."'>Activar cuenta</a>
        		</body>
        	</html>");
			$mailer->send($message);	
		}
		return $this->redirectToRoute("home");
    }


    /**
	* @Route("/activarUsuario/{codigo}", name="activarUsuario")
	*/  
	public function activarUsuario($codigo){
		$entityManager = $this->getDoctrine()->getManager();
		$usuarios = $entityManager->getRepository(Usuario::class);
        $usuario = $usuarios->findBy([
            'codigo' => $codigo
        ]);
		$usuario[0]->setActivado(1);
		$entityManager->persist($usuario[0]);
		$entityManager->flush();
		return $this->redirectToRoute("home");
    }
    
}
?>