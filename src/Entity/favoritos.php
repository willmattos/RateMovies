<?php

namespace App\Entity;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity @ORM\Table(name="favoritos")
 */
class Favoritos
{

    /**
     * @ORM\Id 
     * @ORM\GeneratedValue 
     * @ORM\Column(type="integer")
     */
    private $cod_contenido;
    /**
     * @ORM\Column(type="string")
     */
    private $cod_usuario;

    public function cod_contenido() {
        return $this->cod_contenido;
    }
    public function getCod_usuario() {
        return $this->cod_usuario;
    }
    public function setCod_usuario($cod_usuario) {
        $this->cod_usuario = $cod_usuario;
    }
}
?>
