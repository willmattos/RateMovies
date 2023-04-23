<?php

namespace App\Controller;

use Symfony\Component\Security\Core\Authentication\Token\UsernamePasswordToken;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use Symfony\Component\Security\Core\Exception\CustomUserMessageAuthenticationException;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\HttpFoundation\Request;
use App\Entity\Usuario;

class UsuarioController extends AbstractController
{
    /**
     * @Route("/identification", name="identification")
     */
    public function identification(UserPasswordEncoderInterface $passwordEncoder, SessionInterface $session)
    {
        $entityManager = $this->getDoctrine()->getManager();
        $usuario = $_POST['_username'];
        $qb = $entityManager->getRepository(Usuario::class)->createQueryBuilder('u')->andWhere("LOWER(u.correo) = LOWER('$usuario') OR LOWER(u.usuario) = LOWER('$usuario')");
        $usuario = $qb->getQuery()->getOneOrNullResult();

        if (!$usuario || !$passwordEncoder->isPasswordValid($usuario, $_POST['_password'])) {
            $session->getFlashBag()->add('error', "Usuario y/o contraseña incorrectas");
        } else {
            // $token = new UsernamePasswordToken($usuario, null, 'main', $usuario->getRoles());
            // $this->get('security.token_storage')->setToken($token);
            // $this->get('session')->set('_security_main', serialize($token));

            $this->get('security.token_storage')->setToken(new UsernamePasswordToken($usuario, null, 'main', $usuario->getRoles()));
        }
        return $this->redirectToRoute('perfil');
    }
    /**
     * @Route("/logout", name="logout")
     */
    public function logout()
    {
        return $this->redirectToRoute('perfil');
    }
}
