<?php

namespace App\Entity;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity @ORM\Table(name="serie")
 */
class Serie
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
    private $temporada;
    /**
     * @ORM\Column(type="string")
     */
    private $descripcion;
    /**
     * @ORM\Column(type="integer")
     */
    private $episodios;
     /**
     * @ORM\Column(type="string")
     */
    private $trailer;
     /**
     * @ORM\Column(type="integer")
     */
    private $contenido;


    public function getCodigo() {
        return $this->codigo;
    }
    public function getTemporada() {
        return $this->temporada;
    }
    public function setTemporada($temporada) {
        $this->temporada = $temporada;
    }
    public function getDescripcion() {
        return $this->descripcion;
    }
    public function setDescripcion($descripcion) {
        $this->descripcion = $descripcion;
    }
    public function getEpisodios() {
        return $this->episodios;
    }
    public function setEpisodios($episodios) {
        $this->episodios = $episodios;
    }
    public function getTrailer() {
        return $this->trailer;
    }
    public function setTrailer($trailer) {
        $this->trailer = $trailer;
    }
    public function getContenido() {
        return $this->contenido;
    }
    public function setContenido($contenido) {
        $this->contenido = $contenido;
    }
}
?>
