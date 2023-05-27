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
    private $codigo;
    /**
     * @ORM\Column(type="integer")
     */
    private $cod_contenido;
    /**
     * @ORM\Column(type="integer")
     */
    private $cod_genero;




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
     * Get the value of cod_genero
     */ 
    public function getCod_genero()
    {
        return $this->cod_genero;
    }

    /**
     * Set the value of cod_genero
     *
     * @return  self
     */ 
    public function setCod_genero($cod_genero)
    {
        $this->cod_genero = $cod_genero;

        return $this;
    }
}
