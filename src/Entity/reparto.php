<?php

namespace App\Entity;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity @ORM\Table(name="reparto")
 */
class Reparto
{

    /**
     * @ORM\Id 
     * @ORM\GeneratedValue 
     * @ORM\Column(type="integer")
     */
    private $cod_contenido;
    /**
     * @ORM\Column(type="integer")
     */
    private $cod_actor;

    public function getCod_contenido() {
        return $this->cod_contenido;
    }
    public function getCod_actor() {
        return $this->cod_actor;
    }
    public function setCod_actor($cod_actor) {
        $this->cod_actor = $cod_actor;
    }
}
?>
