<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity @ORM\Table(name="valora")
 */
class Valora
{
    /**
     * @ORM\Column(type="integer")
     */
    private $puntacion;
    /**
     * @ORM\Id 
     * @ORM\GeneratedValue 
     * @ORM\Column(type="integer")
     */
    private $cod_contenido;

    /**
     * @ORM\Column(type="integer")
     */
    private $cod_usuario;

    public function getPuntacion()
    {
        return $this->puntacion;
    }
    public function setPuntacion($puntacion)
    {
        $this->puntacion = $puntacion;
    }
    public function getCod_contenido()
    {
        return $this->cod_contenido;
    }
    public function getCod_usuario()
    {
        return $this->cod_usuario;
    }
    public function setCod_usuario($cod_usuario)
    {
        $this->cod_usuario = $cod_usuario;
    }
}
