<?php 
namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use App\Entity\Critica;

<<<<<<< Updated upstream:src/Controller/Acceso.php
class Acceso extends AbstractController{
  
}
=======
class ContenidoController extends AbstractController
{
    /**
     * @Route("/crearCritica",name=crearCritica)
     */
    public function crearCritica(Request $request){
        $codigo = $request->request->get("codigo");
        $texto = $request->request->get("texto");

        $entityManager = $this->getDoctrine()->getManager();
        if($entityManager->getRepository(Contenido::class)->findOneBy(["codigo"=>$codigo])){
            $critica = new Critica();
            $critica= setComentario($texto);
            $critica= setCod_contenido($texto);
            $critica= setCodigo_usuario($this->getUser()->getCodigo());
            $entityManager->persist($critica);
            $entityManager->flush();
        }
        
        return new JSONResponse(["n"=>0]);
        
    }
}
>>>>>>> Stashed changes:src/Controller/ContenidoController.php
