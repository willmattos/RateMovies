<?php

namespace App\Entity;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity @ORM\Table(name="usuario")
 */
class Usuario implements UserInterface, \Serializable 
{
    /**
     * @ORM\Id 
     * @ORM\GeneratedValue 
     * @ORM\Column(type="integer", name = "codigo")
     */
    private $codigo;
    /**
     * @ORM\Column(type="string", name = "correo")
     */
    private $correo;
    /**
     * @ORM\Column(type="string", name = "usuario")
     */
    private $usuario;
     /**
     * @ORM\Column(type="string", name = "nombre")
     */
    private $nombre;
    /**
     * @ORM\Column(type="string", name = "descripcion")
     */
    private $descripcion;
    /**
     * @ORM\Column(type="string", name = "clave")
     */
    private $clave;
    /**
     * @ORM\Column(type="integer", name = "rol")
     */
    private $rol;
    /**
     * @ORM\Column(type="integer", name = "recuperar")
     */
    private $recuperar;
    /**
     * @ORM\Column(type="integer", name = "activado")
     */
    private $activado;
    /**
    * @ORM\Column(type="text", name = "foto")
    */
    private $foto;
   // /**
   // * @return mixed
   // */
   // public function getRol(){
   //     return $this->rol;
   // }
   // /**
   // * @param mixed $rol
   //  */
   // public function setRol($rol){
   //     $this->rol = $rol;
   //}

    public function getCodigo() {
        return $this->codigo;
    }
    public function setCorreo($correo) {
       $this->correo = $correo;
    }
    public function getCorreo() {
        return $this->correo;
    }
    public function setUsuario($usuario) {
        $this->usuario = $usuario;
    }
	public function getUsuario() {
        return $this->usuario;
    }
    public function setNombre($nombre) {
        $this->nombre = $nombre;
    }
	public function getNombre() {
        return $this->nombre;
    }
    public function getDescripcion() {
        return $this->descripcion;
    }
    public function setDescripcion($descripcion) {
        $this->descripcion = $descripcion;
    }
    public function getClave() {
        return $this->clave;
    }
    public function setClave($clave) {
        $this->clave = $clave;
    }
    public function getRol(){
        return $this->rol;
    }
    public function setRol($rol){
        $this->rol = $rol;
    }
    public function getRecuperar() {
        return $this->recuperar;
    }
    public function setRecuperar($recuperar) {
        $this->recuperar = $recuperar;
    }
    public function getActivado() {
        return $this->activado;
    }
    public function setActivado($activado) {
        $this->activado = $activado;
    }
    public function getFoto() {
        return $this->foto;
    }
    public function setFoto($foto) {
        $this->foto = $foto;
    }
 	// =======================================================
	// Elementos necesarios para la autenticación
	// =======================================================
   public function getRoles()
    {
        if($this->activado){
            return array('ROLE_USER');  
        }else{
            return array('DESACTIVADO_USER');  
        }                         
	}

    public function getPassword()
    {
        return $this->getClave();
    }

    public function getUsername()
    {
        return $this->getCorreo();
    }

    public function eraseCredentials()
    {
        return;
    }
	
    public function getSalt()
    {
        return;
    }

	public function serialize(){
        return serialize(array(
            $this->codigo,
            $this->correo,
            $this->usuario,
            $this->nombre,
            $this->clave,
            $this->descripcion,
            $this->rol,
			$this->recuperar,
			$this->activado,
            $this->foto
        ));
    }
	
    public function unserialize($serialized){
        list (
            $this->codigo,
            $this->correo,
            $this->usuario,
            $this->nombre,
            $this->clave,
            $this->descripcion,
            $this->rol,
			$this->recuperar,
			$this->activado,
            $this->foto
            ) = unserialize($serialized);
    }
}
?>

   
