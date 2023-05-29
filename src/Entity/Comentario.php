<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity @ORM\Table(name="comentarios")
 */
class Comentario
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
    private $usuario;
    /**
     * @ORM\Column(type="integer")
     */
    private $critica;

    private $likes;
    /**
     * @ORM\ManyToOne(targetEntity="Usuario")
     * @ORM\JoinColumn(name="usuario", referencedColumnName="codigo")
     */
    private $usuario_objeto;

    private $ownlike;



    /**
     * Get the value of codigo
     */
    public function getCodigo()
    {
        return $this->codigo;
    }

    /**
     * Get the value of comentario
     */
    public function getComentario()
    {
        return $this->comentario;
    }

    /**
     * Set the value of comentario
     *
     * @return  self
     */
    public function setComentario($comentario)
    {
        $this->comentario = $comentario;

        return $this;
    }

    /**
     * Get the value of fecha
     */
    public function getFecha()
    {
        return $this->fecha;
    }

    /**
     * Set the value of fecha
     *
     * @return  self
     */
    public function setFecha($fecha)
    {
        $this->fecha = $fecha;

        return $this;
    }

    /**
     * Get the value of critica
     */
    public function getCritica()
    {
        return $this->critica;
    }

    /**
     * Set the value of critica
     *
     * @return  self
     */
    public function setCritica($critica)
    {
        $this->critica = $critica;

        return $this;
    }

    /**
     * Get the value of likes
     */
    public function getLikes()
    {
        return $this->likes;
    }

    /**
     * Set the value of likes
     *
     * @return  self
     */
    public function setLikes($likes)
    {
        $this->likes = $likes;

        return $this;
    }

    /**
     * Get the value of usuario_objeto
     */
    public function getUsuario_objeto()
    {
        return $this->usuario_objeto;
    }

    /**
     * Set the value of usuario_objeto
     *
     * @return  self
     */
    public function setUsuario_objeto($usuario_objeto)
    {
        $this->usuario_objeto = $usuario_objeto;

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
}
