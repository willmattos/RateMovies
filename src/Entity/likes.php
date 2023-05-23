<?php

namespace App\Entity;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity @ORM\Table(name="likes")
 */
class Likes
{

    /**
     * @ORM\Id 
     * @ORM\GeneratedValue 
     * @ORM\Column(type="integer")
     */
    private $cod_critica;
    /**
     * @ORM\Column(type="integer")
     */
    private $cod_usuario;

    public function getCod_critica() {
        return $this->cod_critica;
    }
    public function getCod_usuario() {
        return $this->cod_usuario;
    }
    public function setCod_usuario($cod_usuario) {
        $this->cod_usuario = $cod_usuario;
    }
}
?>
