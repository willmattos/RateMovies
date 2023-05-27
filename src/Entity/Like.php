<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity @ORM\Table(name="likes")
 */
class Like
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
    private $cod_critica;
    /**
     * @ORM\Column(type="integer")
     */
    private $cod_comentario;
    /**
     * @ORM\Column(type="integer")
     */
    private $cod_usuario;


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
     * Get the value of cod_usuario
     */
    public function getCod_usuario()
    {
        return $this->cod_usuario;
    }

    /**
     * Set the value of cod_usuario
     *
     * @return  self
     */
    public function setCod_usuario($cod_usuario)
    {
        $this->cod_usuario = $cod_usuario;

        return $this;
    }
}
