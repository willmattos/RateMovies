<?php

namespace App\Entity;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity @ORM\Table(name="siguiendo")
 */
class Siguiendo
{

    /**
     * @ORM\Id 
     * @ORM\GeneratedValue 
     * @ORM\Column(type="integer")
     */
    private $cod_seguidor;
    /**
     * @ORM\Column(type="integer")
     */
    private $cod_seguido;

    public function getCod_seguidor() {
        return $this->cod_seguidor;
    }
    public function getCod_seguido() {
        return $this->cod_seguido;
    }
    public function setCod_seguido($cod_seguido) {
        $this->cod_seguido = $cod_seguido;
    }
}
?>
