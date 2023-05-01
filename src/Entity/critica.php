<?php

namespace App\Entity;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity @ORM\Table(name="critica")
 */
class Critica
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
    private $comentario;
    /**
     * @ORM\Column(type="datetimetz")
     */
    private $fecha;
    /**
    * @ORM\Column(type="integer")
    */
    private $cod_contenido;
    /**
    * @ORM\Column(type="integer")
    */
    private $cod_critica;
    /**
     * @ORM\Column(type="integer")
     */
    private $cod_usuario;
	
    public function getCodigo() {
        return $this->codigo;
    }
    public function getComentario() {
        return $this->comentario;
    }
    public function setComentario($comentario) {
        $this->comentario = $comentario;
    }
    public function getFecha() {
        return $this->fecha;
    }
    public function setFecha($fecha) {
        $this->fecha = $fecha;
    }
    public function getCod_contenido() {
        return $this->cod_contenido;
    }
    public function setCod_contenido($cod_contenido) {
        $this->cod_contenido = $cod_contenido;
    }
    public function getCod_critica()
    {
        return $this->cod_critica;
    }

    public function setCod_critica($cod_critica)
    {
        $this->cod_critica = $cod_critica;
    }
    public function getCod_usuario() {
        return $this->cod_usuario;
    }
    public function setCod_usuario($cod_usuario) {
        $this->cod_usuario = $cod_usuario;
    } 

}
?>
