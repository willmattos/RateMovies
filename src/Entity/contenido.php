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
    private $descripcion;
    /**
     * @ORM\Column(type="datetimetz")
     */
    private $estreno;
    /**
    * @ORM\Column(type="integer")
    */
    private $confirmado;
     /**
     * @ORM\Column(type="string")
     */
    private $poster;
     /**
     * @ORM\Column(type="string")
     */
    private $portada;
     /**
     * @ORM\Column(type="int")
     */
    private $cod_ref;

    // /**
    //  * One Consulta solo es tiene un usuario.
    //  * @ORM\OneToOne(targetEntity="Consulta")
    //  * @ORM\JoinColumn(name="codigo_consulta", referencedColumnName="codigo")
    //  */
    // private $codigo_consulta;
    // /**
    //  * One Mensaje solo es tiene un usuario.
    //  * @ORM\OneToOne(targetEntity="Usuario")
    //  * @ORM\JoinColumn(name="id_usuario", referencedColumnName="id")
    //  */
    // private $id_usuario;

    private $ruta;
	
    public function getCodigo() {
        return $this->codigo;
    }
    public function getTitulo() {
        return $this->titulo;
    }
    public function setTitulo($titulo) {
        $this->titulo = $titulo;
    }
	public function getDescripcion() {
        return $this->descripcion;
    }
    public function setDescripcion($descripcion) {
        $this->descripcion = $descripcion;
    }
 	public function getEstreno() {
        return $this->estreno;
    }
    public function setEstreno($estreno) {
        $this->estreno = $estreno;
    }
    public function getConfirmado() {
        return $this->confirmado;
    }
    public function setConfirmado($confirmado) {
        $this->confirmado = $confirmado;
    }
    public function getPoster() {
        return $this->poster;
    }
    public function setPoster($poster) {
        $this->poster = $poster;
    }
    public function getPortada() {
        return $this->portada;
    }
    public function setPortada($portada) {
        $this->portada = $portada;
    }
    public function getCod_ref() {
        return $this->cod_ref;
    }
    public function setCod_ref($cod_ref) {
        $this->cod_ref = $cod_ref;
    }
}
?>
