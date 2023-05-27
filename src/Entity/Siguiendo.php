<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity @ORM\Table(name="siguiendo")
 */
class Siguiendo
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
    private $usuario;
    /**
     * @ORM\Column(type="integer")
     */
    private $siguiendo;
    /**
     * @ORM\ManyToOne(targetEntity="Usuario")
     * @ORM\JoinColumn(name="usuario", referencedColumnName="codigo")
     */
    private $follower;
    /**
     * @ORM\ManyToOne(targetEntity="Usuario")
     * @ORM\JoinColumn(name="siguiendo", referencedColumnName="codigo")
     */
    private $following;


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
     * Get the value of siguiendo
     */
    public function getSiguiendo()
    {
        return $this->siguiendo;
    }

    /**
     * Set the value of siguiendo
     *
     * @return  self
     */
    public function setSiguiendo($siguiendo)
    {
        $this->siguiendo = $siguiendo;

        return $this;
    }

    /**
     * Get the value of follower
     */ 
    public function getFollower()
    {
        return $this->follower;
    }

    /**
     * Set the value of follower
     *
     * @return  self
     */ 
    public function setFollower($follower)
    {
        $this->follower = $follower;

        return $this;
    }

    /**
     * Get the value of following
     */ 
    public function getFollowing()
    {
        return $this->following;
    }

    /**
     * Set the value of following
     *
     * @return  self
     */ 
    public function setFollowing($following)
    {
        $this->following = $following;

        return $this;
    }
}
