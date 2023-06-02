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
     * @ORM\Column(type="string")
     */
    private $trailer;
    /**
     * @ORM\Column(type="integer")
     */
    private $temporadas;
    /**
     * @ORM\Column(type="integer")
     */
    private $episodios;
    /**
     * @ORM\Column(type="string")
     */
    private $fecha_inicio;
    /**
     * @ORM\Column(type="string")
     */
    private $fecha_fin;
    
    private $generos;

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
    public function getTrailer()
    {
        return $this->trailer;
    }
    public function setTrailer($trailer)
    {
        $this->trailer = $trailer;
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
     * Get the value of temporadas
     */
    public function getTemporadas()
    {
        return $this->temporadas;
    }

    /**
     * Set the value of temporadas
     *
     * @return  self
     */
    public function setTemporadas($temporadas)
    {
        $this->temporadas = $temporadas;

        return $this;
    }

    /**
     * Get the value of episodios
     */
    public function getEpisodios()
    {
        return $this->episodios;
    }

    /**
     * Set the value of episodios
     *
     * @return  self
     */
    public function setEpisodios($episodios)
    {
        $this->episodios = $episodios;

        return $this;
    }

    /**
     * Get the value of fecha_fin
     */ 
    public function getFecha_fin()
    {
        return $this->fecha_fin;
    }

    /**
     * Set the value of fecha_fin
     *
     * @return  self
     */ 
    public function setFecha_fin($fecha_fin)
    {
        $this->fecha_fin = $fecha_fin;

        return $this;
    }

    /**
     * Get the value of fecha_inicio
     */ 
    public function getFecha_inicio()
    {
        return $this->fecha_inicio;
    }

    /**
     * Set the value of fecha_inicio
     *
     * @return  self
     */ 
    public function setFecha_inicio($fecha_inicio)
    {
        $this->fecha_inicio = $fecha_inicio;

        return $this;
    }
}
