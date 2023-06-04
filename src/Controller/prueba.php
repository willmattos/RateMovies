<?php

namespace App\Controller;

use App\Entity\Comentario;
use App\Entity\Contenido;
use App\Entity\Valora;
use App\Entity\Actor;
use App\Entity\Critica;
use App\Entity\Favorito;
use App\Entity\Genero;
use App\Entity\Generos;
use App\Entity\Usuario;
use App\Entity\Siguiendo;
use App\Entity\Like;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\HttpFoundation\Request;
use DateTime;
use Dateinterval;


class prueba extends AbstractController
{

    #[Route('/aniosContenido', name: 'aniosContenido')]
    public function logout()
    {
        $entityManager = $this->getDoctrine()->getManager(); 
        $contenido = $entityManager->getRepository(Contenido::class);
        $todo = $contenido->findAll();


        $fechaInicio = "1940-01-01";
        $fechaFin = "2023-01-01";

        $this->cambiarFechasPeliculas($fechaInicio, $fechaFin);

        return new Response("<h1>se han cambiado los años de las peliculas</h1>");
    }


    function cambiarFechasPeliculas($fechaInicio, $fechaFin) {
        $fechaInicio = new DateTime($fechaInicio);
        $fechaFin = new DateTime($fechaFin);
        
        
        $diferenciaDias = $fechaInicio->diff($fechaFin)->days;
        
        
        $entityManager = $this->getDoctrine()->getManager();
        $contenido = $entityManager->getRepository(Contenido::class);
        $peliculas = $contenido->findAll();
        $fechaInicio = "1998-01-01";
        $fechaFin = "2023-01-01";
        
        foreach ($peliculas as $pelicula) {
            
            $diasAleatorios = rand(0, 30295);
            


            
            //$nuevaFecha = $fechaInicio->add(new DateInterval("P{$diasAleatorios}D"));
            
            
            //if($nuevaFecha>$fechaInicio && $nuevaFecha<$fechaFin){
                $pelicula->setEstreno($this->generarFechaAleatoria($fechaInicio,$fechaFin));
                $entityManager->flush();
            //}
            

        }
        
    }

    function generarFechaAleatoria($fechaInicio, $fechaFin) {
        $fechaInicio = new DateTime($fechaInicio);
        $fechaFin = new DateTime($fechaFin);
    
        // Obtiene los timestamps mínimo y máximo
        $timestampInicio = $fechaInicio->getTimestamp();
        $timestampFin = $fechaFin->getTimestamp();
    
        // Genera un timestamp aleatorio dentro del rango
        $timestampAleatorio = mt_rand($timestampInicio, $timestampFin);
    
        // Crea un objeto DateTime a partir del timestamp aleatorio
        $fechaAleatoria = new DateTime();
        $fechaAleatoria->setTimestamp($timestampAleatorio);
    
        return $fechaAleatoria;
    }
}
