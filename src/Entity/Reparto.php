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
    private $codigo;
    /**
     * @ORM\Column(type="integer")
     */
    private $cod_contenido;
    /**
     * @ORM\Column(type="integer")
     */
    private $cod_actor;

    /**
     * Get the value of codigo
     */ 
    public function getCodigo()
    {
        return $this->codigo;
    }

    /**
     * Set the value of codigo
     *
     * @return  self
     */ 
    public function setCodigo($codigo)
    {
        $this->codigo = $codigo;

        return $this;
    }

    /**
     * Get the value of cod_contenido
     */ 
    public function getCod_contenido()
    {
        return $this->cod_contenido;
    }

    /**
     * Set the value of cod_contenido
     *
     * @return  self
     */ 
    public function setCod_contenido($cod_contenido)
    {
        $this->cod_contenido = $cod_contenido;

        return $this;
    }

    /**
     * Get the value of cod_actor
     */ 
    public function getCod_actor()
    {
        return $this->cod_actor;
    }

    /**
     * Set the value of cod_actor
     *
     * @return  self
     */ 
    public function setCod_actor($cod_actor)
    {
        $this->cod_actor = $cod_actor;

        return $this;
    }
}
