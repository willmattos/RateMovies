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
     * @ORM\Column(type="string", name = "foto")
     */
    private $foto;
    /**
     * @ORM\Column(type="integer", name = "bloquear")
     */
    private $bloquear;

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
     * Get the value of correo
     */
    public function getCorreo()
    {
        return $this->correo;
    }

    /**
     * Set the value of correo
     *
     * @return  self
     */
    public function setCorreo($correo)
    {
        $this->correo = $correo;

        return $this;
    }

    /**
     * Get the value of usuario
     */
    public function getUsuario()
    {
        return $this->usuario;
    }

    /**
     * Set the value of usuario
     *
     * @return  self
     */
    public function setUsuario($usuario)
    {
        $this->usuario = $usuario;

        return $this;
    }

    /**
     * Get the value of clave
     */
    public function getClave()
    {
        return $this->clave;
    }

    /**
     * Set the value of clave
     *
     * @return  self
     */
    public function setClave($clave)
    {
        $this->clave = $clave;

        return $this;
    }

    /**
     * Get the value of rol
     */
    public function getRol()
    {
        return $this->rol;
    }

    /**
     * Set the value of rol
     *
     * @return  self
     */
    public function setRol($rol)
    {
        $this->rol = $rol;

        return $this;
    }

    /**
     * Get the value of recuperar
     */
    public function getRecuperar()
    {
        return $this->recuperar;
    }

    /**
     * Set the value of recuperar
     *
     * @return  self
     */
    public function setRecuperar($recuperar)
    {
        $this->recuperar = $recuperar;

        return $this;
    }

    /**
     * Get the value of activado
     */
    public function getActivado()
    {
        return $this->activado;
    }

    /**
     * Set the value of activado
     *
     * @return  self
     */
    public function setActivado($activado)
    {
        $this->activado = $activado;

        return $this;
    }

    /**
     * Get the value of foto
     */
    public function getFoto()
    {
        return $this->foto;
    }

    /**
     * Set the value of foto
     *
     * @return  self
     */
    public function setFoto($foto)
    {
        $this->foto = $foto;

        return $this;
    }

    public function getRoles()
    {
        switch ($this->getRol()) {
            case 1:
                return ["ROLE_ADMIN"];
                break;
            case 2:
                return ["ROLE_ADMIN", "ROLE_SUPERADMIN"];
                break;
            default:
                return ["ROLE_USER"];
                break;
        }
    }
    public function getUserIdentifier()
    {
        return $this->getCorreo();
    }

    public function getPassword()
    {
        return $this->getClave();
    }

    public function getUsername()
    {
        return $this->getUsuario();
    }

    public function eraseCredentials()
    {
        return;
    }

    public function getSalt()
    {
        return;
    }

    public function serialize()
    {
        return serialize(array(
            $this->codigo,
            $this->correo,
            $this->usuario,
            $this->clave,
            $this->rol,
            $this->recuperar,
            $this->activado,
            $this->foto,
            $this->bloquear,
        ));
    }

    public function unserialize($serialized)
    {
        list(
            $this->codigo,
            $this->correo,
            $this->usuario,
            $this->clave,
            $this->rol,
            $this->recuperar,
            $this->activado,
            $this->foto,
            $this->bloquear,
        ) = unserialize($serialized);
    }

    /**
     * Get the value of bloquear
     */ 
    public function getBloquear()
    {
        return $this->bloquear;
    }

    /**
     * Set the value of bloquear
     *
     * @return  self
     */ 
    public function setBloquear($bloquear)
    {
        $this->bloquear = $bloquear;

        return $this;
    }
}
