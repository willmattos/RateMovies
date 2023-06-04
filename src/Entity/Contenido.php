<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity @ORM\Table(name="contenido")
 */
class Contenido
{

    /**
     * @ORM\Id 
     * @ORM\GeneratedValue 
     * @ORM\Column(type="integer")
     */
    private $codigo;
    /**
     * @ORM\Column(type="string")
     */
    private $titulo;
    /**
     * @ORM\Column(type="string")
     */
    private $alias;
    /**
     * @ORM\Column(type="string")
     */
    private $descripcion;
    /**
     * @ORM\Column(type="date")
     */
    private $estreno;
    /**
     * @ORM\Column(type="string")
     */
    private $poster;
    /**
     * @ORM\Column(type="string")
     */
    private $portada;
    /**
     * @ORM\Column(type="integer")
     */
    private $serie;

    private $generos;
    private $ownlike;

    public function getCodigo()
    {
        return $this->codigo;
    }
    public function getTitulo()
    {
        return $this->titulo;
    }
    public function setTitulo($titulo)
    {
        $this->titulo = $titulo;
    }
    public function getAlias()
    {
        return $this->alias;
    }
    public function setAlias($alias)
    {
        $this->alias = $alias;
    }
    public function getDescripcion()
    {
        return $this->descripcion;
    }
    public function setDescripcion($descripcion)
    {
        $this->descripcion = $descripcion;
    }
    public function getEstreno()
    {
        return $this->estreno;
    }
    public function setEstreno($estreno)
    {
        $this->estreno = $estreno;
    }
    public function getPoster()
    {
        return $this->poster;
    }
    public function setPoster($poster)
    {
        $this->poster = $poster;
    }
    public function getPortada()
    {
        return $this->portada;
    }
    public function setPortada($portada)
    {
        $this->portada = $portada;
    }

    /**
     * Get the value of generos
     */
    public function getGeneros()
    {
        return $this->generos;
    }

    /**
     * Set the value of generos
     *
     * @return  self
     */
    public function setGeneros($generos)
    {
        $this->generos = $generos;

        return $this;
    }
    /**
     * Get the value of ownlike
     */
    public function getOwnlike()
    {
        return $this->ownlike;
    }

    /**
     * Set the value of ownlike
     *
     * @return  self
     */
    public function setOwnlike($ownlike)
    {
        $this->ownlike = $ownlike;

        return $this;
    }

    /**
     * Get the value of serie
     */
    public function getSerie()
    {
        return $this->serie;
    }

    /**
     * Set the value of serie
     *
     * @return  self
     */
    public function setSerie($serie)
    {
        $this->serie = $serie;

        return $this;
    }
}
