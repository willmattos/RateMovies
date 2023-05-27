<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity @ORM\Table(name="favoritos")
 */
class Favorito
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
    private $cod_usuario;
    /**
     * @ORM\ManyToOne(targetEntity="Contenido")
     * @ORM\JoinColumn(name="cod_contenido", referencedColumnName="codigo")
     */
    private $contenido;


    public function getCod_usuario()
    {
        return $this->cod_usuario;
    }
    public function setCod_usuario($cod_usuario)
    {
        $this->cod_usuario = $cod_usuario;
    }

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
     * Get the value of contenido
     */ 
    public function getContenido()
    {
        return $this->contenido;
    }

    /**
     * Set the value of contenido
     *
     * @return  self
     */ 
    public function setContenido($contenido)
    {
        $this->contenido = $contenido;

        return $this;
    }
}
