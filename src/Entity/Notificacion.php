<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity @ORM\Table(name="notificacion")
 */
class Notificacion
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
    private $cod_siguiendo;
    /**
     * @ORM\Column(type="integer")
     */
    private $cod_critica;
    /**
     * @ORM\Column(type="integer")
     */
    private $cod_comentario;
    /**
     * @ORM\Column(type="integer")
     */
    private $leido;
    /**
     * @ORM\ManyToOne(targetEntity="Siguiendo")
     * @ORM\JoinColumn(name="cod_siguiendo", referencedColumnName="codigo")
     */
    private $siguiendo;


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
     * Get the value of seguido
     */
    public function getSeguido()
    {
        return $this->seguido;
    }

    /**
     * Set the value of seguido
     *
     * @return  self
     */
    public function setSeguido($seguido)
    {
        $this->seguido = $seguido;

        return $this;
    }

    /**
     * Get the value of cod_critica
     */
    public function getCod_critica()
    {
        return $this->cod_critica;
    }

    /**
     * Set the value of cod_critica
     *
     * @return  self
     */
    public function setCod_critica($cod_critica)
    {
        $this->cod_critica = $cod_critica;

        return $this;
    }

    /**
     * Get the value of cod_comentario
     */
    public function getCod_comentario()
    {
        return $this->cod_comentario;
    }

    /**
     * Set the value of cod_comentario
     *
     * @return  self
     */
    public function setCod_comentario($cod_comentario)
    {
        $this->cod_comentario = $cod_comentario;

        return $this;
    }

    /**
     * Get the value of leido
     */
    public function getLeido()
    {
        return $this->leido;
    }

    /**
     * Set the value of leido
     *
     * @return  self
     */
    public function setLeido($leido)
    {
        $this->leido = $leido;

        return $this;
    }

    /**
     * Get the value of cod_siguiendo
     */
    public function getCod_siguiendo()
    {
        return $this->cod_siguiendo;
    }

    /**
     * Set the value of cod_siguiendo
     *
     * @return  self
     */
    public function setCod_siguiendo($cod_siguiendo)
    {
        $this->cod_siguiendo = $cod_siguiendo;

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
}
