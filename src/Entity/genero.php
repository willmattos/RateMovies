<?php

namespace App\Entity;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity @ORM\Table(name="genero")
 */
class Genero
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
    private $cod_genero;



    public function getCod_contenido() {
        return $this->cod_contenido;
    }
    public function getCod_genero() {
        return $this->cod_genero;
    }
    public function setCod_genero($cod_genero) {
        $this->cod_genero = $cod_genero;
    }
}
?>
