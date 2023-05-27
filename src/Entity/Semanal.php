<?php

namespace App\Entity;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity @ORM\Table(name="semanal")
 */
class Semanal
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
    private $contador;
    /**
     * @ORM\Column(type="datetimetz")
     */
    private $fecha;

    public function getCod_contenido() {
        return $this->cod_contenido;
    }
    public function getContador() {
        return $this->contador;
    }
    public function setContador($contador) {
        $this->contador = $contador;
    }
    public function getFecha() {
        return $this->fecha;
    }
    public function setFecha($fecha) {
        $this->fecha = $fecha;
    }
}
