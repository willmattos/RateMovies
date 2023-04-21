<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Security\Core\Authentication\Token\UsernamePasswordToken;

class Acceso extends AbstractController
{

    /**
     * @Route("/login", name="login")
     */
    public function login()
    {
            $entityManager = $this->getDoctrine()->getManager();
            $usuario = $_POST['usuario'];
            $qb = $entityManager->getRepository(Usuario::class)->createQueryBuilder('u')->andWhere("j.correo = '$usuario' OR j.usuario = '$usuario'");
            $usuario = $qb->getQuery()->getResult();
    
            if ($usuario[0] && $codigo) {
                $token = new UsernamePasswordToken($usuario, null, 'main', $usuario->getRoles());
                $this->get('security.token_storage')->setToken($token);
                $this->get('session')->set('_security_main', serialize($token));
            }
        return $this->redirectToRoute('bandeja');
    }
}
