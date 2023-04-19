# RateMovies
Notas:
Cualquier tipo de imagenes se almacenará en el servidor, y en la bd añadiremos el nombre del archivo(original).
Las imagenes del contenido Series/Pelis se guardarán en la carpeta public/Contenido/c+codigo del contenido. Ej public/Contenido/c1/prueba.jpg
Las fotos de los usuarios se guardarán en la carpeta public/Usuario/u+codigo de usuario. Ej public/Usuario/u1/prueba.jpg

antes de añadir se comprobará si existe la carpeta, en caso que no exista se creará


Empezar creando las entidades
genero
generos
actor
reparto
contenido
critica
favoritos
likes
semanal
siguiendo
valora

//relaciones
entidad genero debe traer el objeto generos
entidad reparto traer al objeto actor en vez de su codigo
entidad contenido debe tener un array con todos los actores del reparto (mirar el ejercicio de equipo y jugadores del aula)
entidad contenido debe tener un array con todos los generos que tiene (mirar el ejercicio de equipo y jugadores del aula)
entidad critica debe traer el objeto contenido y el objeto usuario

entidad favoritos debe trar el objeto contenido
entidad usuario debe tener un array con todos sus favoritos (mirar el ejercicio de equipo y jugadores del aula)
entidad siguiendo debe trar el objeto usuario (del campo cod_seguido)
entidad usuario debe tener un array con todos a los que sigue (mirar el ejercicio de equipo y jugadores del aula)
entidad notificacion debe trar el objeto usuario (del campo cod_seguido), y el objeto critica

//controladores

crear un formulario y añadir algun contenido (añadir poster y portada)
crear un formulario y añadir alguna critica
con ajax darle like a una critica mediante un boton(tener en cuenta que cada vez que se pulsa el boton se da o se quita el like)
con ajax darle a seguir a un usuario(tener en cuenta que cada vez que se pulsa el boton se sigue o se quita el seguido)
crear un formulario de registro, verificacion y login

##posible api a usar
https://www.omdbapi.com
