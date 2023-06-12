-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 12-06-2023 a las 16:38:52
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ratemovies`
--
CREATE DATABASE IF NOT EXISTS `ratemovies` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ratemovies`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actor`
--

CREATE TABLE `actor` (
  `codigo` int(9) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `codigo` int(9) NOT NULL,
  `comentario` varchar(255) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `usuario` int(9) NOT NULL,
  `critica` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`codigo`, `comentario`, `fecha`, `usuario`, `critica`) VALUES
(1, 'comentario prueba', '2023-06-10 12:47:54', 3, 2),
(2, 'ejemplo', '2023-06-10 12:48:40', 1, 2),
(3, 'auto comentario', '2023-06-10 12:53:59', 3, 3),
(4, 'respuesta\n', '2023-06-10 12:55:26', 1, 3),
(5, 'auto respuesta', '2023-06-10 12:55:47', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contenido`
--

CREATE TABLE `contenido` (
  `codigo` int(9) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `estreno` date DEFAULT current_timestamp(),
  `poster` varchar(255) DEFAULT NULL,
  `portada` varchar(255) DEFAULT NULL,
  `serie` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contenido`
--

INSERT INTO `contenido` (`codigo`, `titulo`, `alias`, `descripcion`, `estreno`, `poster`, `portada`, `serie`) VALUES
(1, 'El resplandor', NULL, 'Jack Torrance, un escritor ex-alcoholico, acepta un puesto como vigilante de invierno en un solitario hotel de alta montana al que se traslada con su familia. Una vez alli, empieza a sufrir inquietantes trastornos de personalidad.', '2016-12-06', 'poster.jpeg', '58f6150cea080-e1492522867783.jpg.webp', 0),
(2, 'Letras Explicitas', NULL, 'En 1987, cinco jovenes, utilizando rimas brutalmente honestas y bases musicales pesadas, expresan su frustracion y enojo sobre la vida en el lugar mas peligroso de Estados Unidos utilizando el arma mas poderosa que tenian: su musica.', '1998-07-31', 'Straight_Outta_Compton.jpeg', '150811061628-compton-1-780x439.webp', 0),
(3, 'Alien: El octavo pasajero', NULL, 'De regreso a la Tierra, la nave de carga Nostromo interrumpe su viaje y despierta a sus siete tripulantes. El ordenador central, MADRE, ha detectado la misteriosa transmision de una forma de vida desconocida, procedente de un planeta cercano aparentemente deshabitado.', '2003-09-26', 'alien.jpeg', 'e8e08dbc-3d7a-4549-a254-95cc164f7781_alta-libre-aspect-ratio_default_0.jpg', 0),
(4, 'Volver al futuro', NULL, 'El adolescente Marty McFly es amigo de Doc, un cientifico al que todos toman por loco. Cuando Doc crea una maquina para viajar en el tiempo, un error fortuito hace que Marty llegue a 1955, ano en el que sus futuros padres aun no se habian conocido.', '2015-11-08', 'Regreso_al_futuro.jpeg', 'PETXCB7DHFBT3EG6TKQK5L3I2E.jpg', 0),
(5, 'Dragon Ball Z: La resurrecion de Freezer', NULL, 'Despues de que Bills, el Dios de la destruccion, decidiera no destruir la Tierra, se vive una gran epoca de paz. Hasta que Sorbet y Tagoma, antiguos miembros elite de la armada de Freezer, llegan a la Tierra con el objetivo de revivir a su lider por medio de las Esferas del Dragon.', '2017-07-31', 'Dragon_Ball_Z_La_Resurrecciaon_de_F.jpeg', 'DBZ-003.jpg', 0),
(6, 'Actividad Paranormal', NULL, 'Una pareja feliz, joven y de clase media ve su vida atormentada por un espiritu demoniaco. Ella es una estudiante que esta punto de graduarse como profesora, y el, un corredor de bolsa que trabaja desde su casa. Viven desde hace tres anos en una casa que parecia completamente normal.', '2022-09-16', '202748.webp', 'B626BCSI2VMZVNULSNWJFXVXSI.jpg', 0),
(7, 'Tiburon', NULL, 'En las aguas de un pequeno pueblo costero del Este de Estados Unidos, un enorme tiburon ataca a varias personas. Por temor a las repercusiones que este incidente podria tener sobre el negocio turistico, el alcalde se niega a cerrar las playas y a difundir la noticia.', '2012-09-20', 'aCqHb3eFQV8raX30OfGurqPlpjh.jpg', 'jaws-image.jpg', 0),
(8, 'Karate Kid', NULL, 'Remake adaptado a la epoca contemporanea del clasico de los 80 Karate Kid. Sigue la historia de Dre, un joven skateboarder que se muda a China con su madre soltera por motivos de trabajo. Cuando un maton local empiece a molestarle, el joven encontrara un apoyo en Mr. Han.', '2012-04-16', 'The_Karate_Kid_2010.webp', 'descarga.jpg', 0),
(9, 'Pan: Viaje a nunca jamas', NULL, 'Peter es un chico de 12 anos con una irreprimible vena rebelde. Entonces, en el curso de una noche increible, Peter se ve transportado desde el orfanato y aparece en un mundo fantastico de piratas, guerreros y hadas llamado Nunca Jamas. Se enfrentara a sorprendentes aventuras y combates.', '2012-10-10', 'CARTEL.jpg', 'Foto-de-Pan-Viaje-a-Nunca-Jamas-26.jpg', 0),
(10, 'Pixeles', NULL, 'En el campeonato mundial de videojuegos de 1982 compiten Sam, Will, Ludlow y Eddie \'Lanzallamas\' Plant. Una grabacion de este campeonato se envio al espacio, la cual fue malinterpretada por una civilizacion alienigena como una declaracion de guerra y atacan la tierra.', '2013-04-06', 'd45faoiDeZsrdIdYpLy34vtYf3S.jpg', 'pixels-pelicula-etb2_amp_w1200.jpg', 0),
(11, 'Jurassic World: Mundo Jurasico', NULL, 'Todo esta yendo bien, la gente llega por miles a la isla. Pero la ultima gran atraccion del parque, un dinosaurio carnivoro modificado geneticamente para atraer mas visitantes, escapa de su zona de contencion y va matando todo a su paso.', '2022-02-04', 'jurassic_world.jpg', 'Jurassic-World-Bienvenidos-al-mundo-jurasico.jpg', 0),
(12, 'Toy Story 2', NULL, 'Cuando Andy se va de campamento dejando solos a los juguetes, Al McWhiggin, un compulsivo coleccionista de juguetes valiosos, secuestra a Woody. Buzz Lightyear y el resto de los juguetes de Andy deberan actuar con rapidez para rescatarlo, poniendose al frente de una operacion.', '2003-12-05', 'Toy_Story_2-636362526-large.jpg', '1513367359-toy-story-3-di-02-1.jpg.jpeg', 0),
(13, 'La era de hielo', NULL, 'Hace muchos, muchos anos, tantos como 20.000, una pequena ardirata de nombre Scrat queria esconder una bellota en el hielo. Pero lo que hace es provocar una semicatastrofe que provoca que todos los animales migren hacia el sur, hacia tierras mas calidas.', '2008-07-21', '61tU6kN+WyL._AC_UF894,1000_QL80_.jpg', 'ice_age.jpg', 0),
(14, 'Transformers', NULL, 'Aqui entablaran una disputa con los humanos de por medio, que tomaran partido por los autobots. La Tierra es la salida para estas maquinas, pues rica en minerales y quimicos, representa la salvacion para los automatas, quienes emprenderan una terrible guerra por el preciado Cubo.', '2008-11-02', '81aIyHPs82L._AC_UF894,1000_QL80_.jpg', 'AAAABTkBX7eUD-O7u2cYmxUphDEaPTN15cN7I3oDHnlw0nLQhIoBMUEI7M6lUH7sp04Nzmk2H5FKSSnmWZgQBg2qu_QplEA6kC7Sz170.jpg', 0),
(15, 'El Hobbit: Batalla de los cinco ejercitos', NULL, 'Despues de haber recuperado el reino del Dragon Smaug en la montana, la Compania ha desencadenado, sin querer, una potencia maligna. Un Smaug enfurecido vuela hacia la Ciudad del Lago para acabar con todo.  ', '2003-04-01', 'el_hobbit_la_batalla_de_los_cinco_ejercitos-cartel-5939.jpg', 'la-batalla-de-los-cinco-ejercitos-1552403202.jpeg', 0),
(16, 'La mascara', NULL, 'Stanley Ipkiss es un empleado de banca extremadamente amable, pero desgraciadamente es un pusilanime cuando tiene que enfrentarse a alguien. Tras uno de los peores dias de su vida, Stanley encuentra una mascara que representa a Loki, un dios de la malicia y la travesura.', '2019-07-11', 'la_mascara.jpg', 'la-mascara-2-jim-carrey-condiciones-1580119768.jpg', 0),
(17, 'Indiana Jones: En busca del arca perdida', NULL, 'Despues de una infructuosa mision en Sudamerica, el gobierno estadounidense le encarga la busqueda del Arca de la Alianza, donde se conservan las Tablas de la Ley que Dios entrego a Moises.  ', '1999-01-11', 'indiana_jones.webp', 'indiana_arca_perdida.jpeg', 0),
(18, 'Ghost Rider 2: Espiritu de venganza', NULL, 'Nueva adaptacion del comic \'El motorista fantasma\'. vive apartado del mundo y sin relacionarse con nadie, pero acaba siendo localizado por el monje Moreau, que necesita su ayuda para buscar a Nadya y a su hijo Danny antes de que los encuentre Roarke, un viejo conocido de Blaze.', '2006-09-05', 'ghost_rider.jpg', 'critica-ghost-rider-spirit-of-vengeance.jpg', 0),
(19, 'Los Juegos del Hambre: Sinsajo Parte I', NULL, 'Bajo el liderazgo de la comandante Coin y el consejo de sus amigos mas leales, Katniss extiende sus alas mientras lucha por salvar a Peeta Mellark y a una nacion alentada por su valentia...  ', '2022-04-18', 'juegos_del_hambre_sinsajo.jpg', 'e0f41d9eb424509cfc055a786aad5b67c7dc5ca3f5288cfa932dbbadd52d2ed2._RI_TTW_SX720_FMjpg_.jpg', 0),
(20, 'Hombres de Negro 3', NULL, 'Cuando el MIB recibe la informacion de que el Agente K podria morir a manos de un alienigena, lo que cambiaria la historia para siempre, el Agente J es enviado a los anos 60 para evitarlo. Tercera entrega de la popular saga Men in Black.', '2009-10-07', 'mib3.jpg', 'hombres_de_negro.jpg', 0),
(21, 'Ouija', NULL, 'Un grupo de jovenes utiliza una Ouija para contactar con un amigo que ha fallecido recientemente. El problema llega cuando despiertan a una presencia oscura. Adaptacion del juego de tablero de Hasbro.  ', '2009-07-19', 'Ouija_2014_poster.jpg', 'fotonoticia_20141127144338_1200.jpg', 0),
(22, 'Space Jam', NULL, 'Bugs Bunny y su equipo desafian a los Nerdlucks (un grupo de pequenos extraterrestres) a un partido de baloncesto para decidir si los Looney Tunes permanecen en la Tierra o se trasladan a una lejana galaxia para trabajar en un parque de atracciones de Montana Tontolandia.', '2014-03-27', '895501b7c879f8b8b236524db91ee9ab.jpg', 'MV5BZWI3YWI1ZDYtODhhMS00NjI1LWFmZTEtZTBkMDM2NDJkNmU2XkEyXkFqcGdeQVRoaXJkUGFydHlJbmdlc3Rpb25Xb3JrZmxvdw@@._V1_.jpg', 0),
(23, 'Buscando a Nemo', NULL, 'El pececillo Nemo, que es hijo unico, es muy querido y protegido por su padre. Despues de ser capturado en un arrecife australiano va a parar a la pecera de la oficina de un dentista de Sidney. Su timido padre emprendera una peligrosa aventura para rescatarlo.', '1999-12-24', 'buscando_a_nemo.jpg', 'Disney-debuta-la-camara-de-arrecife-de-Finding-Nemo-Dory-780x470.jpg', 0),
(24, 'Solo por dinero', NULL, 'Una mujer divorciada y desempleada se transforma en una caza-recompensas para sobrevivir, esto la lleva a un caso muy dificil que involucra a su ex-novio de preparatoria.  ', '2005-07-13', 'one_for_the_money-354085522-large.jpg', 'La_cazarrecompensas-381656795-large.jpg', 0),
(27, 'Sin escape', NULL, 'Cuando un adolecente encuentra su foto de nino en un sitio web de personas extraviadas. Comienza a cuestionarse todo lo que ha conocido.    ', '2005-07-14', '5c24e8b5dde36e5bef5865597.jpg', 'sin-escape.jpg', 0),
(28, 'Sin nombre', NULL, 'Huyendo de una pandilla, Casper aborda un tren rumbo al Norte para comenzar de cero en otro pais, Esquivando varios peligros, hace amistad con Sayra, una chica hondurena.  ', '2009-07-22', 'sin_nombre.jpg', '33122313123213131.jpg', 0),
(29, 'Los 4 fantasticos', NULL, 'Cuatro jovenes cientificos alcanzan habilidades super-humanas cuando un experimento de tele-transportador sale mal. ahora, deben de aprender a usar sus nuevos poderes para salvar al mundo de un tirano en ascenso.  ', '2020-03-03', 'los_4_fantasticosjpg.jpg', '1233adD_4_fantasticos.jpg', 0),
(30, 'Max', NULL, 'Un perro que ayudo a los soldados Afganistan regresa a los Estados Unidos y es adoptado por la familia de su adiestrador despues de vivir una experiencia traumatica.  ', '1998-09-13', 'max.jpg', 'maxresdefault.jpg', 0),
(31, 'Vacaciones', NULL, 'Un maduro Rusty Griswold sorprende a su esposa, Debbie, y a sus dos hijos con una travesia de vuelta al parque de diversiones preferida de la familia en Estados Unidos, Walley World.  ', '2012-12-23', 'vacaciones.jpg', '2693c24a-f9e4-48a0-a08b-02595bb2ef6e_1140x641.jpg', 0),
(32, 'Mision Imposible 5', NULL, 'Ethan y su equipo regresan para una mision aun mas imposible: erradicar al Syndicato, una organizacion internacional tan bien entrenada como ellos, y destina a destruir al IMF.  ', '2002-07-08', '11266619-10153122819937730-9045367438836263730-o_be95.jpg', '413717.jpg', 0),
(33, 'Los Vengadores 2', NULL, 'Cuando Tony Stark intenta iniciar un programa para garantizar la paz, las cosas se ponen feas y los vengadores deberan detener al villano Ultron, que hara todo lo posible por arruinar sus planes.  ', '2002-05-21', 's-l1600.jpg', 'avengers-age-of-ultron-tv-spot-2.jpg', 0),
(34, 'Lugares Oscuros', NULL, 'Una mujer que sobrevive al brutal asesinato de su familia cuando era nina, es obligada a confrontarse con los eventos ocurridos ese dia, por una sociedad secreta obsesionada con la resolucion de crimenes famosos.  ', '2021-07-26', 'lugares_oscuros.jpg', 'dark places.jpg', 0),
(35, 'Bajo el mismo cielo (Aloha)', NULL, 'Un reconocido instructor militar regresa al lugar donde logro su exito y se reconecta con un viejo amor, mientras inesperadamente se enamora de la responsable de la fuerza aerea que le han puesto para seguirlo.  ', '2007-11-19', 'Aloha-683625110-large.jpg', 'bajo-el-mismo-cielo-1024x506.jpg', 0),
(36, 'Antes de ir', NULL, 'Una mujer pierde el tren de la 1:30 de Nueva York  Boston, tras los cual un musico de la calle pasa la noche tratando de ayudarla a hacer que pueda volver a casa antes de que llegue su marido. A lo largo de la noche aprenden el uno del otro y se enamoran.', '2019-02-03', 'antes_de_irme-640670157-large.jpg', 'antes_de_irme.jpg', 0),
(37, 'El regalo', NULL, 'Simon y Robyn son un joven matrimonio cuya vida va segun lo planeado. Cuando reaparece un viejo conocido de la escuela de Simon, el no lo reconoce, pero despues de varios encuentros inesperados y extranos regalos.', '2015-03-15', 'el_regalo.jpg', '123kjJL_elRegalo.jpg', 0),
(38, 'Chica Final', NULL, 'Un grupo de jovenes adolecentes elige a la chica equivocada para su iniciacion.    ', '2015-07-28', 'Final_Girl-233995687-large.jpg', 'Final_Girl-173774920-large.jpg', 0),
(39, 'Chappie', NULL, 'Luego de haber sido secuestrado por dos criminales durante sus primeras horas de vida, Chappie se convierte en el hijo de una extrana y disfuncional familia. Chappie es especial, tiene un don, es uno en un millon, un prodigio. Chappie, es un robot.', '2005-05-02', 'Chappie-250488177-large.jpg', 'CHAPPIE-ficha.jpg', 0),
(40, 'Kingsman, el servicio secreto', NULL, 'Un veterano agente del servicio secreto de los Estados Unidos toma bajo su proteccion a un nuevo recluta que esta en carrera para convertirse en agente secreto.  ', '2009-10-08', 'kingsman.jpg', 'kingsman-servicio-secreto-2.jpg', 0),
(41, 'El invitado', NULL, 'Los Peterson siguen llorando el fallecimiento de su hijo Caleb en Afganistan, En pleno duelo, David irrumpe en el hogar familiar y conquista a cada uno de sus miembros hasta que uno de ellos empieza a intuir que David no es quien parece ser.', '2006-01-29', 'elinvitadoposter.jpg', 'el-invitado-02.jpg', 0),
(42, 'Dracula', NULL, 'La historia explora el origen de Dracula, mezcla de vampirismo y la historia real del Principe Vlad El Empalador - quien inspiro al Dracula de Bram Stoker -, retratandolo como un heroe en una tragica historia de amor en una oscura epoca de magia y guerra.', '2005-11-15', 'dracula.jpg', 'dracula-gary-oldman.jpg', 0),
(43, 'Resident Evil 5: La venganza', NULL, 'El letal virus T de Unbrella Corporation esta transformando a las personas comunes en legiones de muertos vivos, y la raza humana tiene una unica esperanza: Alice  ', '2021-04-02', 'residentEvil5.jpg', 'resident-evil-5-pelicula-review-900x491.jpg', 0),
(44, 'Mi novio es un Zombie', NULL, 'Un zombie recien fallecido que se come el cerebro de un joven y absorbe sus recuerdos, se enamora de la novia de su victima.    ', '2005-08-05', 'minovioesunzombie_poster.jpg', '277568.jpg', 0),
(45, 'Guerra Mundial Z', NULL, 'Un empleado de la ONU pelea contra el tiempo y el destino mientras viaja por el mundo intentando frenar una pandemia mortal de zombis.    ', '2022-03-24', 'guerra_mundial_z-cartel-3536.jpg', 'guerra_mundialZ.jpg', 0),
(46, 'Terror en Silent Hill 2: La revelacion', NULL, 'Atormnetada por pesadillas y la desaparicion de su padre, Heather ira tras el y descubrira algo inquietante sobre su propia identidad.    ', '2003-08-27', 'silentHill2.jpg', 'terror-en-silent-hill-2.jpg', 0),
(47, 'Carrie', NULL, 'En esta version del filme de horror, una inadaptada adolecente se venga de sus companeros usando poderes sobrenaturales y desata el caos en el baila de graduacion.  ', '2015-04-20', 'carrie-poster-para-1976-ua-red-bank-film-con-sissy-spacek-y-amy-irving-basada-en-la-novela-de-stephen-king-ax53nx.jpg', 'image-w1280.jpg', 0),
(48, 'Diabolica tentacion', NULL, 'Despues de un paseo sobrenatural con una banda satanica emo, la sexy porrista Jennifer se transforma en un demonio.    ', '2013-03-26', 'diabolicaTentacion.jpg', 'megan-fox-jennifer-body-900x491.jpg', 0),
(49, 'Esta detras de ti', NULL, 'Despues de tener sexo, Jay descubre que su ligue le paso una maldicion letal, de la que solo podra librarse acostandose con alguien mas.    ', '2000-10-21', 'gfHRZwv3K00h3iyCJ2qI3nO9UoQ.jpg', '40106_800x339.jpg', 0),
(50, 'Una pelicula de miedo', NULL, 'Marlon y Shawn Wayans participan en esta mordaz satira sobre algunos de los exitos de taquilla de terror adolecente mas popular de Hollywood.    ', '2019-02-16', 'unaPeliculaDeMiedo.jpg', 'scary-movie.jpg', 0),
(51, 'Archivo 253', NULL, 'Un grupo de investigadores de actividades paranormales decide saber la verdad sobre un manicomio abandonado.    ', '2020-09-30', 'ARCHIVO253.jpg', 'uH1plvjLW7Q9r8KJHawo4WDUxab.jpg', 0),
(52, 'Palabras Diabolicas', NULL, 'El panico sacude un pueblito religioso cuando los ninos deaparecen y vuelven poseidos por un demonio. Los residentes tendran que eliminarlos.    ', '2011-05-10', 'palabrasDiabolicas.jpg', '7SFGe5ZPLS5Bhm7p6J5qtDsW07C.jpg', 0),
(53, 'Pesadilla en la calle Elm', NULL, 'Freddy Krueger es un asesino serial que cruza la frontera entre los suenos y la realidad para destripar a sus victimas con sus filosos guantes.  ', '2004-05-06', 'pesadillaElmStreet.jpg', 'pesadilla-en-elm-street-origen-3211.jpg', 0),
(54, 'Siniestro', NULL, 'Un novelista de crimenes de la vida real encuentra unas cintas en las que aparecen asesinatos ocurridos en las casa que acaba de comprar.    ', '2016-04-17', 'Sinister-127255424-large.jpg', 'Sinister.jpg', 0),
(55, 'Mama', NULL, 'Tras la muerte de su madre dos ninas encuentran refugio con su tio, pero pronto se hace patente que no vienen solas.    ', '2021-06-28', 'Mamaa-636240235-large.jpg', 'cc18_fpf_00084r_wide-943692e0f263bc59c5f716d035787392b1a6bac3.jpg', 0),
(56, 'Dama de Negro 2', NULL, 'Durante la segunda guerra mundial, un grupo de estudiantes de Londres son evacuados a una casa dilapidada. Alli, sin darse cuenta, despertaran un espiritu sanguinario.  ', '2002-10-22', 'descarga (5).jfif', 'la_dama_de_negro_2.jpg', 0),
(57, 'Sangre de mi sangre', NULL, 'Ella tiene que cuidar a su hermana, pero su egorafobia la aleja de todos y de todo. Hasta que un vecino revienta la burbuja    ', '2006-02-19', 'MV5BMTMwMDk4MTMyNF5BMl5BanBnXkFtZTcwNDY0ODg2MQ@@._V1_.jpg', 'Blood-Father-1-e1475799630308.jpg', 0),
(58, 'Caso 39', NULL, 'Una ingenua trabajadora social lleva a su casa a una nina de 10 anos para rescatarla de sus padres abusadores, pero pronto descubre que la nina no es lo que parece.  ', '2005-06-14', 'Expediente_39-641733706-large.jpg', 'caso39.jpg', 0),
(59, 'The Ouija Experimenet', NULL, 'Mientras juegan la tabla Ouija, un estudiante de cine con cuatro amigos abren e portal de los espiritus y reciben la visita de una nina que murio ahogada.  ', '2008-08-16', '550167.jpg', 'the-ouija-experiment-2011-film-rcm1200x627u.jpg', 0),
(60, 'La huerfana', NULL, 'Kate y John Coleman adoptan a Esther, una nina de 9 anos , de un orfanato. Pero Kate no tradara en descubrir que se esconde detras del rostro angelical de Esther.  ', '2021-06-18', 'la_huerfana.jpg', '1366-2000_wpkx.jpg', 0),
(61, 'Chucky, el muneco diabolico', NULL, 'Andy, un nino de 6 anos, sabe que su muneco Chucky es responsable de una serie de asesinatos, pero ni su mama ni la policia le creen.    ', '2018-02-17', 'muneco_diabolico.jpg', 'muñeco-diabólico-chucky-las-cosas-que-nos-hacen-felices.jpg', 0),
(62, 'Actividad Paranormal 4', NULL, 'La escalofriante saga de Katie, la joven psicotica, escribe una nueva pagina cuando el espiritu homicida que la habita pide mas sangre.    ', '2011-06-29', 'actividad_paranormal_4.jpg', 'Estreno-Paranormal-Activity-4.jpg', 0),
(63, 'La cabana del terror', NULL, 'Cinco amigos emprenden un viaje de descanso en una cabana alejada. Pero una vez alli descubren que hay un protocolo estricto que seguir si no quieren sufrir un castigo.  ', '2008-12-20', 'la_cabana.jpg', 'critica-the-cabin-in-the-woods-1280x720.jpg', 0),
(64, 'Nuestro ultimo verano en Escocia', NULL, 'Una pareja a punto de divorciarse debe fingir tener un matrimonio perfecto cuando visitan al patriarca familiar moribundo en su cumpleanos.  ', '2003-01-05', 'ultimo_verano_en_escocia.jpg', 'nuestroultimoveranoenescocia.jpg', 0),
(65, 'Verano en Staten Island', NULL, 'Esta historia divertidisima sobre socorristas que planean celebrar el verano a lo grande incluye a los integrantes de Saturday Night Live delante y detras de camara.  ', '2020-05-21', 'verano_en_staten.jpg', '1200x675.jpg', 0),
(66, 'Todo es relativo', NULL, 'Harry peleo duro para conquistar el corazon de Grace y tiene muchas ganas de conocer a sus padres, pero un secreto compartido puede arruinar todo.  ', '1998-07-14', 'todo_es_relativo.jpg', 'resizer.jpg', 0),
(67, 'Amor de mis amores', NULL, 'Dias antes de su boda, ella cree haberse enamorado de un extrano que tambien se dirige hacia el altar, y su vidas cambian radicalmente.    ', '2012-08-12', 'amor_de_mis_amores.jpg', 'AAAABd9aT57pUD87-FxrnVeHL98647S63yFLFFX5nSIlkDiqnXqR_YCi0M40rppkfZsNgmNlquX1TCjFApTsVWI4GfihkAD9PHN7N1YK.jpg', 0),
(68, 'La dictadura perfecta', NULL, 'Tras aceptar un soborno descomunal, una poderosa corporacion televisiva intenta mejorar con mentiras la imagen de un notorio politico corrupto.    ', '1999-05-01', 'la_dictadura_perfecta.jpg', 'maxresdefault.jpg', 0),
(69, 'La peor noche de mi vida', NULL, 'Despues de una peculiar noche de ligue, una aspirante a presentadora de noticias se embrolla en una travesia por los angeles sin, carro, dinero ni memoria.  ', '2000-05-20', 'Pelicula_la-peor-noche-de-mi-vida.webp', 'idzHrO04A40rBu3fcJqgdMiC6Op.jpg', 0),
(70, 'Heroe de centro comercial', NULL, 'Un guardia de seguridad demasiado entusiasta se encuentra en un aprieto cuando intenta frustrar el plan maestro de robar todo un centro comercial.  ', '2011-04-27', 'u5ystUTV99VO7VMslBWS1SR6rtP.jpg', 'kevinjames_paulblart.jpg', 0),
(71, 'Y, donde estan las rubias?', NULL, 'Dos agentes negros del FBI cuya mision es cuidar a dos aristocratas cabezahuecas se hacen pasar por dos muchachas blancas para atrapar a los posibles secuestradores.  ', '2007-03-21', '28b0ecf243509687008d95b3e1a43219630723a8eaf50f7234b05885543e836e._RI_TTW_.jpg', 'rubias-e1562090781628.png', 0),
(72, 'Ese es mi hijo', NULL, 'Las tensiones entre padre e hijo estallan cuando un papa desagradable decide mudarse con su hijo y la prometida de este, justo antes de su boda.  ', '2021-07-29', '81h6obxnq6L._AC_SL1500_.jpg', 'unnamed.jpg', 0),
(73, 'Son como ninos', NULL, 'Cinco amigos se reunen despues de 30 anos en una casa del lago para llorar la perdida de su antiguo entrenador de basquet y vuelven a comportarse como jovencitos.  ', '2002-10-07', '7ad5f1f01cebe0712c523656803874eb.jpg', 'bde8881567b130a785647cfa67c3a89c6583ebe6bee758ebf2129b89c7d6a9e8._RI_TTW_.jpg', 0),
(74, 'Este cuerpo no es mio', NULL, 'La superficialidad de una porrista la mete en problemas cuando roba un juego de aretes malditos y termina atrapada en el cuerpo de un perdedor de 30 anos.  ', '2022-01-13', 'este_cuerpo_no_es_mio.jpg', '2415868.jpg', 0),
(75, 'Jack y Jill', NULL, 'Adam Sandler actua dos papeles como Jack, cabeza de familia y Jill su despota hermana gemela, quien llega de vacasiones y se queda por mas tiempo.  ', '2012-09-27', 'jack_y_jill.jpg', 'critica-jack-and-jill-1280x720.jpg', 0),
(76, 'Todo un parto', NULL, 'Unos dias antes de la fecha de parto de su esposa, Peter aterriza en la lista pasajeros vedados, por lo que debera cruzar el pais en auto con un vago exasperante.  ', '2004-07-26', 'todo_un_parto.jpg', 'unnamed.jpg', 0),
(77, 'Los juegos hambrientos', NULL, 'En esta satira de los juegos del Hambre, una joven llamada Kantmiss toma parte en una feroz competencia que pone en pique a adolecentes entre si.  ', '2010-08-14', 'MV5BMTgwOTk2OTY4MV5BMl5BanBnXkFtZTgwMTU5MjE0MDE@._V1_.jpg', 'starvinggames.jpg', 0),
(78, 'Nacho Libre', NULL, 'Ignacio, cocinero de un monasterio mexicano, desea ayudar a la iglesia con sus problemas financieros y se inscribe en un circuito profesional de lucha con el nombre de Nacho.  ', '2006-05-08', 'MV5BN2ZkNDgxMjMtZmRiYS00MzFkLTk5ZjgtZDJkZWMzYmUxYjg4XkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_FMjpg_UX1000_.jpg', 'maxresdefault.jpg', 0),
(79, 'Norbit', NULL, 'Luego de ser obligado a casarse con una autoritaria mujer, el amable Norbit conoce a la chica de sus suenos en esta divertida comedia romatica.  ', '2010-10-22', '81z3kb3TRpL._SL1500_.jpg', 'norbit-2.jpg', 0),
(80, 'Pelotas en juego', NULL, 'Cuando el propietario de un elegante centro deportivo se dispone a sacar del negocio a Pete, dueno de un modesto gimnasio local, solo hay una respuesta: jugar al quemado.  ', '2019-11-24', 'pelotas_en_juego.jpg', 'dodgeball.png', 0),
(81, 'Una pareja de idiotas', NULL, 'Un par de locos y tontos amigos van en un alocado viaje por carretera para devolver un portafolio lleno de dinero en efecto a su legitimo dueno.  ', '2002-09-20', 'una_pareja_de_idiotas.jpg', 'f608x342-66090_95813_0.jpg', 0),
(82, 'Golpe bajo', NULL, 'Un mariscal de campo profesional convence a su amigo un exentrenador convicto, de preparar a un equipo de reclusos para jugar contra los guardias.  ', '1999-12-25', '854a24475094aaed222f97fb459fdad5--the-longest-yard-original-movie-posters.jpg', 'golpe_bajo.jpg', 0),
(83, 'Mi villano favorito 2', NULL, 'El archivillano Gru y sus tres huerfanas vuelven por mas hazanas turbias en esta chiflada pelicula animada con las voces de grandes figuras de Hollywood.  ', '2012-11-22', 'gru2.jpg', 'Javier-Bardem-podria-ser-el-malo-de-Gru-mi-villano-favorito-2.jpg', 0),
(84, 'El dador de recuerdos', NULL, 'En una sociedad futurista donde nadie sufre las adversidades que surgen del libre albedrio, un joven descubre una poderosa verdad que quiere revelar.  ', '2004-04-12', 'dador_de_recuerdos.jpg', 's640.jpg', 0),
(85, 'El secreto de Adaline', NULL, 'Cuando una hermosa mujer de 29 anos, que vivio mas de un siglo pero que no envejecio, se enamora, el secreto de su pasado sale a la luz.    ', '2019-02-24', 'el_secreto_de_adaline.jpg', 'Adaline_12dwaD.jpg', 0),
(86, 'John Carter: Entre dos mundos', NULL, 'Hace un instante, el veterano de la guerra civil, John Carter se escondia de los apaches, de pronto despierta en Marte, que se encuentra en crisis.  ', '2007-11-16', 'jhon_carter.jpg', 'john-carter.jpg', 0),
(87, 'Astro Boy', NULL, 'Astro Boy, joven robot creado por el Dr. Tenma, en la aventura de navegar por territorio desconocido buscando un proposito antes de regresar a salvar a sus seres queridos.  ', '2019-09-17', '20235306.jpg', 'astro-boy-2.jpg', 0),
(88, 'Los Pinguinos de Madagascar: la pelicula', NULL, 'Los espias de altos vuelos Skiper, Kowalski, Rico y Cabo unen fuerzas con los agentes del Viento Norte para vencer al malvado Octavius Brine.    ', '2002-09-23', 'los_pinguinos_de_madagascar.jpg', 'imagen-de-los-pingueinos-de-madagascar.jpeg', 0),
(90, 'El planeta del tesoro', NULL, 'Cuando un joven de cabina de un galeon espacial descubre el mapa de un tesoro intergalactico, un ciborg cocinero le ensena a enfrentar supernovas y tormentas espaciales.  ', '2006-07-18', 'el_planeta_del_tesoro.jpg', '09.png', 0),
(91, 'Atlantis: El imperio perdido', NULL, 'Esta historia animada de accion sigue las andanzas de un grupo de aventureros en su viaje submarino hacia el mitico reino de la Atlantida.    ', '2022-02-18', 'atlantis.jpg', 'atlantis-1024x559.jpg', 0),
(92, 'Los Vengadores', NULL, 'Un reparto de superheroes, incluidos Iron Man, el increible Hulk y Capitan America, se unen para salvar al mundo de una catastrofe.    ', '2006-08-12', '450_1000.jpg', '1649169230_259440_1649679081_noticia_normal.jpg', 0),
(93, 'Iron Man 2', NULL, 'Robert Downey Jr. regresa como el millonario Tony Stark en esta emocionante secuela, ya revelado su secreto como super heroe, la vida de Tony esta mas agitada que nunca.  ', '2001-01-18', 'Iron_Man_2-587852207-large.jpg', 'a8ae3-im2-crc3adtica-1.jpg', 0),
(94, 'Transformers: El lado oscuro de la Luna', NULL, 'Cuando Optimus Prime se entera de una nave Transformer derribada en la luna, lidera una mision para rescatar al piloto: su mentor, Sentinel Prime.  ', '2016-08-02', 'transformers_lado_oscurp.jpg', 'Transformers-El-lado-oscuro-de-la-luna.jpg', 0),
(95, 'Transformers: La venganza de los caidos', NULL, 'La batalla por la tierra continua cuando el estudiande Sam Witwicky conoce el origen ancestral de los Transformers y debe unirse a la batalla contra los Decepticons.  ', '2005-09-30', 'transformers_venganza_de_los_caidos.jpg', 'Transformers-La-venganza-de-los-caidos.jpg', 0),
(96, 'Gigantes de acero', NULL, 'Un luchador en apuros devenido promotor se reencuentra con sus hijos para convertir a un robot de la vieja generacion en un poderoso contrincante de box.  ', '2007-08-09', 'gigantes_de_acero.jpg', 'Gigantes-de-Acero-Disney.jpg', 0),
(97, 'Megamente', NULL, 'Cuando el brillante supervillano Megamind mata por accidente a su nemesis, crea un nuevo enemigo que se propone destruir el mundo.    ', '2010-08-14', '51A6IuDCdOL._AC_UF894,1000_QL80_.jpg', 'maxresdefault.jpg', 0),
(98, 'Super 8', NULL, 'El escritor y director J.J. Abrams elabora un relato sobrenatural sobre 6 ninos que son testigos de algo increible mientras filman una pelicula con su camara de super 8.  ', '2005-01-11', 'super8.jpg', '0_sLsssIRThu6zqTpR.jpg', 0),
(99, 'Guerra de los mundos', NULL, 'Un trabajador divorciado se convierte en el padre protector que nunca fue cuando una flota de naves espaciales aterriza a la tierra.    ', '1998-09-15', 'guerra_de_los_mundos.jpg', '56947-h.jpg', 0),
(100, 'Invasion el Mundo: Batalla Los Angeles', NULL, 'Liderados por su habilidoso sargento primero, un peloton de audaces infantes de marina lucha por proteger a toda la humanidad de alienigenas sorprendentemente poderosos.  ', '2012-01-03', 'invasion_a_la_tierra.jpg', 'BATTLE_LA_MV5BZDNkM2Q1YTQtMmI3OS00NGI4LWI3ODMtNWYzYTBjZGNmN2ZjXkEyXkFqcGdeQXVyNjcwNDUyODM@._V1_SX1777_CR001777999_AL_.jpg', 0),
(101, 'Sector 9', NULL, 'Tras anos de sagregaciones y trabajos forzosos, un grupo de alienigenas decide revelarse. El enfrentamiento entre humanos y extraterrestres llega a un punto critico.  ', '1999-12-12', 'sector9.jpg', 'sector-9-5.jpg', 0),
(102, 'Wall-E', NULL, 'A muchos anos de distancia, dos robots hacen todo lo que puedan para salvar a una plantita, y a todo el planeta tierra.    ', '2014-01-01', 'walle.jpg', 'Wall-E-1-1024x576.jpg', 0),
(103, 'El planeta de los simios', NULL, 'Tras cruzar un vortice temporal, un astronauta cae en un planeta donde los simios dominan a los humanos, en esta reversion del clasico film 1968.  ', '2005-07-09', 'el_planeta_de_los_simios.jpg', 'simios2_cthe.jpg', 0),
(104, 'Tron', NULL, 'Mientras investiga la desaparicion de su pader, Sam Flynn aterriza en un mundo computarizado de gladiadores esclavizados, donde su padre ha estado viviendo por 20 anos.  ', '2022-02-20', 'tron.jpg', 'a4960e7b-0001-0004-0000-000000172729_w920_r1.7794253938832252_fpx29.17_fpy49.96.jpg', 0),
(105, 'Up: Una aventura de altura', NULL, 'Carl es un anciano de 78 anos que lleva toda la vida sonando con viajar. A esta edad y junto a un joven boy scout se enfrenta a la aventura de su vida.  ', '2009-03-20', 'up.jpg', '3525728209_eff410b9b6.jpg', 0),
(106, 'Recuerda este domingo', NULL, 'Una mesera solitaria conoce a un hombre lindo y excentrico, pero al tiempo se da cuenta de que le esta ocultando algo.    ', '2021-08-11', '1a07bbc6cc9f2578e45a4299a05e7105.jpg', '1200x675.jpg', 0),
(108, 'Amor de Verano', NULL, 'Este drama sobre la transicion a la vida adulta narra la historia de una adolecente poco femenina mientras lidia con su sensualidad emergente y su hermana mayor.  ', '2021-04-12', 'amor_de_verano.jpg', 'Un_amor_de_verano_La_belle_saison-874677580-large.jpg', 0),
(109, 'Si decido quedarme', NULL, 'Una prodigio musical de 17 anos cae en coma luego de un tragico accidente automovilistico y tiene una experiencia extracorporal que pondra en juego su propio destino.  ', '2009-04-17', 'si_decido_quedarme.jpg', 'si-decido-quedarme-2.jpg', 0),
(110, '3 metros sobre el cielo', NULL, 'Un drama romantico que narra la historia de dos jovenes que pertenecen a mundos opuestos. Ella es una chica de clase media educada en la bondad y el un chico rebelde.  ', '2017-01-02', '3msc.jpg', '2fee76e54edd.jpg', 0),
(111, 'Donde el corazon te lleva', NULL, 'Un abogado viudo por la custodia de su nieta mestiza, mientras que la abuela paterna de la nina se opondra a toda costa.    ', '1998-09-13', '5c7fcdedd8e94583a88f4d7bc.jpg', 'BlackOrWhite_2015_1.jpg', 0),
(112, 'Lecho de hielo', NULL, 'Con la esperanza de dejar sus oscuros dias en el departamento de policia de Baltimore, Nate se mudo a Alaska para vivir tranquilo como aguacil de un pueblo.  ', '2008-08-18', 'Northern_Lights_TV_TV-444293585-large.jpg', '8EgswPGTrDwaRC6FlmKLYiqWp5l.jpg', 0),
(113, 'Secuestradores', NULL, 'Por tomar una desviacion peligrosa, una madre soltera y su hijo se convierten en rehenes de un ladron de bancos que secuestran su auto.    ', '2018-11-22', 'Secuestrados-221578801-large.jpg', '1148684a.jpg', 0),
(114, 'La ventajas de ser invisible', NULL, 'Un timido estudiante de nuevo ingreso lucha contra la depresion, la muerte de su mejor amigo y el amor en esta historia de crecimiento y compromiso.  ', '2017-03-23', 'Las-ventajas-de-ser-invisible-poster.webp', 'original-3160-1495832126-3.jpg', 0),
(115, 'Operacion regalo', NULL, 'En su fabrica de juguetes supersecreta, santa encarga a su hijo Arthur, que se haga cargo de una mision de vital importancia par al navidad.    ', '2020-10-26', 'arthur-christmas-operacion-regalo.jpg', 'operacion_regalo.jpg', 0),
(116, 'Siempre Alice', NULL, 'Una profesora de lingistica, felizmente casada y madre de tres hijos, se enfrenta a un diagnostico de Alzheimer temprano que pone en jaque su carrera y su vida familiar.  ', '2013-12-19', 'siempre_alice.jpg', 'siempre-alice-pelicula-foto-02.jpg', 0),
(117, 'Una buena mentira', NULL, 'Un joven refugiado de la guerra de Sudan gana la loteria que le permite comenzar una nueva vida en Estados Unidos. Pero adaptarse a su nuevo hogar tiene sus desafios.  ', '2000-07-01', 'una_buena_mentira.jpg', 'Foto-de-La-buena-mentira-5.jpg', 0),
(118, 'El codigo enigma', NULL, 'Durante la segunda guerra mundial, un brillante matematico lidera un equipo de criptografos que intenta descifrar el inquebrantable codigo enigma de Alemania.  ', '1998-08-02', 'codigo_enigma.jpg', 'el-codigo-enigma.jpg', 0),
(119, 'Orgullo y prejuicio', NULL, 'En la novela de Jane Austen del siglo 19, la Sra.Bennet quiere casar a sus hijas con prosperos caballeros, incluido el recien llegado Sr. Darcy.    ', '2009-02-24', 'orgullo_y_prejuicio.jpg', '_orgulloprejuicio1_3785d0fb.jpg', 0),
(120, 'Duelo de titanes', NULL, 'Denzel Washington es el entrenador afroamericano que lidera al primer equipo de futbol americano integrado de Virginia, en 1971, a pesar de las objeciones.  ', '2013-06-06', 'e76f53f55be2795f333b8d72f3df31cbeac41e3126482161cde0f5271afb4e7a._RI_TTW_.jpg', '210573_945x532.jpg', 0),
(121, 'Historias cruzadas', NULL, 'Misisipi 1960, una joven del sur altera la ciudad cuando comienza a entrevistar a las mujeres negras que trabajan para las familias blancas exponiendo el racismo que viven.  ', '1999-08-22', 'bFxXYf5nm3fx98sCF8b0vibikfl.jpg', '15.jpg', 0),
(122, 'Un sueno posible', NULL, 'En este drama deportivo basado en una historia real, una acaudalada pareja acoge a un joven sin hogar y lo cuida hasta que se convierta en potencia del futbol americano.  ', '2009-06-20', 'xCsQfCmPKOt9ECWYhQLI17NJzvR.jpg', 'un_sueno_posible.jpg', 0),
(123, 'Belleza Americana', NULL, 'Mientras lucha por soportar a un aesposa perfeccionista, un empleo insatisfecho y una hosca hija adolecente, un hombre se encapricha con una amiga de su hija.  ', '2002-04-07', 'belleza_americana.jpg', '1603538314_170039_1603541150_noticia_normal_recorte1.jpg', 0),
(124, 'Suenos en fuga', NULL, 'En esta adaptacion de la novela de Stephen King, Andy Dufresne es acusado de asesinato y enviado a la carcel de Shawshank, donde se hara amigo Red, uno de los reos.  ', '2010-06-03', 'suenos_de_fuga.jpg', 'Shawshank-Featured.jpg', 0),
(125, 'Preciosa', NULL, 'La adolescente Jones, maltratada por su madre y embarazada de su padre, tiene la oportunidad inesperada de tener una vida distinta en una escuela alternativa.  ', '1998-04-12', 'pewciosa.jpg', 'precious-2.jpg', 0),
(126, 'Bajo el mismo techo', NULL, 'Holly y Eric descubren que se odian en la primer acita, pero deberan dejar de lado sus sentimientos al recibir la custodia del bebe de sus amigos.  ', '2006-10-05', 'bajo_el_mismo_techo.jpg', 'bajo_elMismoTecho.jpg', 0),
(127, 'La ultima cancion', NULL, 'Ronnie Miller, una rebelde nina prodigio que toca el piano, intenta aprovecha su verano en Georfia para reconectarse con su padre.    ', '2014-02-23', 'la_ultima_cancion.jpg', 'la-ultima-cancion-2.jpg', 0),
(128, 'Querido John', NULL, 'Mientras esta de permiso, un soldado estadounidense se enamora de una chica, pero debe anrolarse de nuevo Podran las cartas mantener su amor?    ', '2016-07-17', 'qurido_Jhon.jpg', 'AAAABWMZefBjmWdqANv9SYkdK05SEHuIVCHExWR7dzMTd3wmKfBTWVbqoPcrPXibUv-wD8lzaeLSIJUekNzCwxyA2r9frCNzPJdGSRCI.jpg', 0),
(129, 'Crepusculo la saga: Amanecer parte 1', NULL, 'Poco despues de que las almas gemelas inmortales Bella y Edward dan el si, una extrana sensacion comienza a surgir dentro del vientre creciente de Bella.  ', '2006-03-29', 'crepusculo_amanecer.jpg', 'Nuevo-trailer-de-La-Saga-Crepusculo-Amanecer.-Parte-1.jpg', 0),
(130, 'Amigos con derecho', NULL, 'Emma y Adam, los amigos con derechos a roces, no tienen problemas con sus relaciones abiertas hasta que esas pequenas y molestas cosas llamadas sentimientos se entrometen.  ', '2014-06-08', 'amigos-con-derecho.jpg', '21string-span-articleLarge.webp', 0),
(131, 'Love, Rosie', NULL, 'Rosie y Alex son mejores amigos, Crecieron juntos, comparten y conocen todo de sus vidas, pero nunca saben que decir del gran vinculo que los une.  ', '2009-06-01', 'love-rosie-poster.webp', '1206361_Love-Rosie.jpg', 0),
(132, 'Lo mejor de mi', NULL, 'Vuelven a su hogar por un funeral y se reencuentran. Donde hubo fuego, cenizas quedan, pero los recuerdos dolorosos pueden apagarlos para siempre.  ', '2000-07-24', 'lo-mejor-de-mi.jpg', '3dbecb1de837fa9ac0b2564943594c80201efa9e5a2fca30b63f5c47754d7bcb._RI_TTW_.jpg', 0),
(133, 'Un pedacito de cielo', NULL, 'Despues de enterarse de que tiene cancer terminal, una alegre joven piensa que ya no queda mas en el camino, pero su corazon encuentra una esperanza.  ', '2021-09-16', 'un-pedacito-de-cielo.jpg', 'un-pedacito-de-cielo-2.jpg', 0),
(134, 'En tus ojos', NULL, 'Viven en extremos opuestos del pais y nunca se vieron, pero gracias a una conexion telepatica podran unirse en lo mas profundo de su ser y en el camino del amor.  ', '2020-05-16', 'In_Your_Eyes-801554395-large.jpg', 'MV5BMDg4MTM1NDEtZDhiOS00Yzc5LWFhNDItNjNmNzY0MzY5ZGU5XkEyXkFqcGdeQXVyMjV1_.jpg', 0),
(135, 'La vida segun Greta', NULL, 'En esta historia de transicion a la edad adulta, una adolescente autodestructiva va  a pasar el verano de sus abuelosque estan tan tranquilos.  ', '2005-10-09', 'la-vida-segun-greta.jpg', 'MV5BNjczOWQwNWQtNTU2NC00NmZlLThhOGUtZGUyNzA5NDg2OTkzL2ltYWdlXkEyXkFqcGdeQXVyNTE4MzAyNDkV1_.jpg', 0),
(136, '6 anos', NULL, 'Una pareja de jovenes volatiles que estan juntos hace 6 anos tendra oportunidades inesperadas para sus carreras que amenazaran su futuro.    ', '2009-09-11', 'images.jpg', 'AAAABTXoczuXPP-ByRCY4rWiaWTApS4rG8hLyw4hp7aN7TNaBF05CZtmKWJPiMz1XCX1mqIF6bekfP3MPRxL4L7ChU170e6L8PRlQvs6.jpg', 0),
(137, 'Eterna juventud', NULL, 'Cuando una chica se pierde en el bosque y conoce a un chico junto a una fuente magica, se hace amiga de su familia y se entera de porque mantienen sus vidas en secreto.  ', '2014-07-15', 'TuckEverlasting.webp', 'film__11361-tuck-everlasting--hi_res-55fdfe37.jpg', 0),
(138, 'Escribiendo de amor', NULL, 'Un guionista bloqueado, divorciado y endeudado que gano un Oscar hace 15 anos acepta un trabajo como profesor universitario de una estudiante.    ', '2005-10-02', 'escribiendo-de-amor.jpg', 'rewrite2.jpg', 0),
(139, 'Amigos intocables', NULL, 'Una conmovedora historia basada en hechos reales en la que un cuadriplejico contrata a un joven delicuente como su cuidador. La relacion entre ambos cambiara sus vidas.  ', '2015-04-04', 'intocables.jpg', 'Paseando-a-Francois-Cluzet.jpg', 0),
(140, 'Las horas contigo', NULL, 'Una joven con un embarazo no deseado enfrenta sus miedos a la perdida y a la maternidad mientras pasa el tiempo con su abuela agonizada.    ', '1998-09-26', 'las-horas-contigo.jpg', 'horas-contigo.jpg', 0),
(141, 'Luna nueva', NULL, 'Bella sufre por la partida de su amor vampiro, edwars y encuentra consuelo en la amistad con Jacob un hombre lobo.    ', '2003-06-09', 'luna_nueva.jpg', '315372_1140x516.jpg', 0),
(143, 'Recuerdame', NULL, 'Dolido aun por un desgarrador suceso familiar, Tyler se siente revivir cuando conoce a una belleza muy sociable con su pasado similiar al suyo.    ', '2016-12-02', 'recuerdame.jpg', 'dmdfIman0PmPpFPJJJYQvPjlVyP.jpg', 0),
(144, 'Diario de una pasion', NULL, 'En esta adaptacion del exito editorial del Nicholas Sparks, la guerra y las diferencias de clase dividen a dos jovenes amantes en la decada del cuarenta.  ', '2019-08-30', 'diario_de_noah.jpg', 'descarga.jpg', 0),
(145, 'La dama de oro', NULL, 'Seis decadas despues del Holocausto, Maria Altmann inicia una odisea para recuperar las obras de arte (incluso de Gustav Klimt) que los nazis le robaran a su familia.  ', '2018-03-17', 'la_dama_de_oro.jpg', 'la-dama-de-oro-pelicula-2015-01.jpg', 0),
(146, 'Alienigenas Ancestrales y el Bigfoot', NULL, 'Las personas de todos los continentes han afirmado ver las huellas de Pie Grande. Y los mitos antiguos hablan de un simio gigante como el acecho de la tierra.  ', '2010-07-10', 'bigfoot.jpg', '450_1000.jpg', 0),
(147, 'Maravillas modernas: Tecnologia de Da Vinci', NULL, 'Como un hombre del siglo XV pudo concebir innovaciones tan modernas? Si seguimos sus planos, funcionarian sus disenos? Gracias a recientes adelantos tecnologicos y a nuevos materiales, somos la primera generacion capaz de aplicar a la practica los dibujos de Leonardo.', '2006-11-29', 'tecnologias-da-vinci.jpg', '960.jpg', 0),
(148, 'Planeta Tierra: Las cuevas - Los desiertos', NULL, 'Podras conocer los animales mas extranos de la tierra: seres que hacen nidos con su propia saliva, trogloditas que nunca han visto un solo rayo de luz en su vida. Ademas, recorreremos los desiertos donde su flora y fauna sobreviven a las condiciones mas raras de la tierra.', '1999-04-08', 'banner-18454688661284047821.jpg', 'descarga.jpg', 0),
(149, 'Osos', NULL, 'Este documental abre la puerta a la vida de los osos salvajes de la costa y las montanas de Alaska, donde hay una gran poblacion de osos libres y fuertes en sus costumbres cotidianas. Un suceso para no perderselo!', '1999-08-09', 'osos.jpg', 'vgXJ8vNkXTcDszJ6f1MoqD989jn.jpg', 0),
(150, 'Azul intangible', NULL, 'Este documental, es una increible opcion para conocer la maravilla que se oculta en el oceano.    ', '2008-06-27', 'azul_intangible.jpg', 'card_0_3.webp', 0),
(151, 'Hijos de las nubes. La ultima colonia', NULL, 'Documental que inspecciona profundamente la deplorable situacion actual del norte de Africa y la mucha responsabilidad que tienen algunas de las potencias occidentales como Estados Unidos y Francia.  ', '2008-01-05', 'hijos-de-las-nubes.jpg', 'descarga.jpg', 0),
(152, 'Titanes de la Era de Hielo', NULL, 'Este documental transporta a los espectadores a los hermosos paisajes congelados de America del Norte, Europa y Asia diez mil anos antes de la civilizacion moderna.  ', '2021-04-08', 'titanes-de-la-era-del-hielo.jpg', 'titanes_de_la_era_del_helojpg', 0),
(153, 'Indignados', NULL, 'Documental frances que narra las protestas que han estado surgiendo desde el 2011 en las calles europeas, ante las desigualdades sociales, de educacion y economicas. Tony Gatlif narra estos acontecimientos desde la vista de una inmigrante ilegal que se ve inmersa en el movimiento.', '2000-02-11', 'Indignados-198195235-mmed.jpg', 'Indignados_cine-1.jpg', 0),
(154, 'Torre de marfil', NULL, 'Andrew Rossi, no le interesa reflejarse en artifices manas economicas. Asi pues, se introducira, en el campus universitario de Harvard para tratar de resolver esta inquietud que aunque parece sutil, podria resolver el interrogante de Es mejor la educacion publica o privada?.', '2018-06-05', 'torre_de_marfil.jpg', '65103.jpg', 0),
(155, 'Happy Valley', NULL, 'El documental observa profundamente la vida y el pasado del deportista de futbol de la Universidad Estatal de Pennsylvania, Jerry Sandusky, quien fue acusado por abuso sexual a menores. Sera realmente inocente?  ', '2014-06-30', 'happy_valley.jpg', 'O5CFPOSNTZGMBFOQDDMOXALTCI.jpg', 0),
(156, 'Solo. Escalada a la vida', NULL, 'Jordi Salas \"Pelon\" es el protagonista de esta hazana, que cuenta como siendo participe en escalada en la modalidad Solo, puede comprender mas a fondo los delirios y fantasias de la vida.  ', '2006-02-03', 'solo_escalada_a_la_vida.jpg', '38fb50648fd269fe8ef6930603dc2d8fb20c5a079c4467107ad9fba5b5372bf5._RI_TTW_.jpg', 0),
(157, 'El color que cayo del cielo', NULL, 'El documental recrea en cierta manera lo ambicioso que puede ser el ser humano y su falta de criterio personal.    ', '2011-04-12', '3666762.jpg', 'Color-Out-of-Space-terror-psicologico.jpg', 0),
(158, 'En tierra extrana', NULL, 'Documental que cuenta algunas historias sobre jovenes emigrantes espanoles, que tras una fuerte crisis economica en el pais, han decidido buscar un mejor futuro en tierras donde parece que todo es mas fertil.', '2004-10-05', 'en_tierra_extrana-223604670-large.jpg', 'en_tierra_extrana.jpg', 0),
(159, 'Los ojos de America', NULL, 'America Scarfo fue la protagonista de una de las vivencias amorosas, mas apasionantes de toda Argentina. Cuando tenia 14 anos, se encontro en el camino a Severino Di Giovanni. A pesar de la fuerza que emanaba su amor, Di Giovanni fue fusilado a manos de la dictadura militar.', '2019-03-16', 'odeon_afiche_prod.jpg', '82ad3a68455dfe1df0e2806aea5f69eb-600x330.jpg', 0),
(160, 'Eco de la montana', NULL, 'A pesar del gran monumento cultural que ha donado al mundo, como el gran mural que pinto en Royal - Musee du Louvre, Santos es totalmente desconocido y al mismo tiempo ignorado en su propio pais de ahi quiza entonces la necesidad por mostrar su obra y su vida en este documental.', '2004-09-10', 'eco_de_la_montana.jpg', 'ecodelamontana.png', 0),
(161, 'El refugio', NULL, 'El personal tiene la dificil tarea de arreglar los problemas entre estas personas: las mujeres y los ninos primero, luego los hombres, solo hay 100 cupos.  ', '2001-12-27', 'el_refugio.jpg', 'RJR3QZJ5QVD3DKBWAPTCHNWR5E.jpg', 0),
(162, 'Al fin del mundo', NULL, 'Tolhuin, es un remoto pueblo adentrado en las entranas del extremo sur en Argentina nadie va alli, nadie se queda tampoco por el frio y la carencia de comodidades.  ', '2003-04-06', 'al_fin_del_mundo.jpg', 'Captura de pantalla 2023-06-04 005007.png', 0),
(163, 'Muros', NULL, 'Una pared separa, segrega, aisla es no-imagen. Muros es un documental que narra la realidad de algunos territorios disputados en todo el mundo.  ', '1999-01-14', 'Muros-157133034-mmed.jpg', '10296-n2.webp', 0),
(165, 'En los ojos de la memoria', NULL, '1985 fue el ano en el que la Villa turistica Epecuen, ubicada en la provincia de Buenos Aires, se vio perjudicada luego de que una viga de contencion cedio y provoco un accidente que termino en inundacion.  ', '2015-06-07', 'en_los_ojos_de_la_memoria-350579744-large.jpg', 'enLosOjosDeLaMemoria.jpg', 0),
(166, 'Francisco', NULL, 'Como logra ser el Papa Francisco un joven timido que hallo su vocacion religiosa un dia de la de floracion (Dario Gandinetti)?    ', '2015-09-15', 'francisco.jpg', '1595934213005.jpg', 0),
(167, 'Bill', NULL, 'Bill cuenta la historia de lo que realmente sucedio durante los anos perdidos de Shakespeare...Bill Shakespeare deja a su familia y su hogar para seguir su sueno.  ', '2010-06-11', 'bill.jpg', 'maxresdefault.jpg', 0),
(168, 'En busca de la felicidad', NULL, 'Bill cuenta la historia de lo que realmente sucedio durante los anos perdidos de Shakespeare...Bill Shakespeare deja a su familia y su hogar para seguir su sueno.  ', '2018-12-20', 'qF6JFr6IdfNep0x6yw3i7S8avAb.jpg', 'en-busca-de-la-felicidad.jpg', 0),
(169, 'Maradona, la mano de Dios', NULL, 'Pelicula que nos relata la vida del famoso futbolista argentino Diego Armando Maradona. Desde sus inicios en el mundo del futbol y su paso a traves de su larga carrera futbolistica.  ', '2015-03-08', 'maradona_la_mano_de_dios.jpg', 'maradona-la-mano-de-dios-2.jpg', 0),
(170, 'Frida', NULL, 'Pelicula biografica de la que en vida fue la pintora mas revolucionaria tanto en ideas como en su sexualidad. Frida Kahlo, tuvo muchisimo amores, con mujeres como con hombres, en su afan de experimentar y marcar bien sus limites con conocimiento de causa.', '2016-09-23', 'Frida-887160812-large.jpg', 'frida.jpg', 0),
(171, 'Dragon: La vida de Bruce Lee', NULL, 'Cinta biografica, que retrata de una forma clara, la verdadera historia del rey del Kung Fu: Bruce Lee. Bruce Lee, habria muerto dias antes de estrenarse la cinta mas taquillera de todos los tiempos en Artes marciales, Operacion Dragon.', '1999-02-19', 'dragon_bruce_lee.jpg', 'jLHEJba6m2SJKzMJRzVaoFGCbg2.jpg', 0),
(172, 'Zapata: El sueno del heroe', NULL, 'Cinta dirigida por Alfonso Arau, la misma que esta protagonizada por la gran Lucero y Alejandro Fernandez. Desarrolla la historia de Emiliano Zapata, un hombre, valiente y aguerrido que dio su vida durante la revolucion mexicana.', '2017-01-02', 'zapata.jpg', '175938_945x532.jpg', 0),
(173, 'Cleopatra', NULL, 'Cinta historica, que desarrolla lo mejor de la vida de la mas aclamada mujer egipcia: Cleopatra. Por muchos siglos ha sido recordada, y hasta la actualidad es un referente de belleza, inteligencia y caracter.  ', '1999-01-09', 'Cleopatra_poster.jpg', 'cleopatra-2.jpg', 0),
(174, 'El solista', NULL, 'Pelicula dirigida por Joe Wright, y que esta basada en hechos reales, pues desarrolla la historia de Nathaniel Ayers, un talentoso musico que durante sus estudios cayo en la enfermedad de la esquizofrenia y por ello no pudo terminar sus estudios.', '2016-11-30', 'el_solista.jpg', 'el-solista-2.jpg', 0);
INSERT INTO `contenido` (`codigo`, `titulo`, `alias`, `descripcion`, `estreno`, `poster`, `portada`, `serie`) VALUES
(175, 'Sin limites', NULL, 'Pelicula biografica, que desarrolla la historia de Salvador Dali, junto a otros dos estudiantes, que con el tiempo, formarian parte de los mayores exponentes de la literatura.  ', '2007-11-27', 'sin_limites.jpg', 'sin-limites-2.jpg', 0),
(176, 'Ali', NULL, 'Pelicula biografica del peleador profesional Muhammad Ali, desde sus inicios en un pequeno y humilde barrio hasta su exito en las peleas mas dificiles que le toco vivir.  ', '2001-07-18', 'q.jpg', '161831173472014_cine_ATV_Ali.jpg', 0),
(177, 'Sugar', NULL, 'Excelente cinta biografica, que desarrolla la historia de Miguel Sugar, Santos, o como sus amigos le decian Sugar. Considerado uno de los mejores jugadores en la historia del Beisbol dominicano.  ', '2003-01-08', 'sugar.jpg', '15bf8d6560a91e6b43feee0a870c435f157f2b37601e898f4088c4d8130743c6._RI_TTW_.jpg', 0),
(178, 'Howl. La voz de una generacion', NULL, 'Pelicula Biografica de Allen Ginsberg, un icono de la cultura Beat y el movimiento Hippie. Howl (Aullido).    ', '2007-04-06', 'howl-383363751-large.jpg', '450_1000.jpg', 0),
(179, 'Notorious', NULL, 'Biopic de la vida del famoso rapero Notorious B.I.G., un voluminoso cantante de rap neoyorquino que irrumpio con fuerza en el mundo de la musica del hip hop.  ', '2015-08-03', 'notorious.jpg', 'notorious-2.jpg', 0),
(180, 'Amelia', NULL, 'Hilary Swank, protagoniza a Amelia Earhart, la primera mujer que batio records de vuelo, y que intento sobrevolar todo el Oceano Pacifico, en el ano 1937.  ', '2007-06-29', '20236836.jpg', 'image-w1280.jpg', 0),
(181, 'Michael Jackson: La leyenda continua', NULL, 'Documental creado durante la vida del rey del pop, a traves de pequenos fragmentos de conciertos, presentaciones, entrevistas, donde los especialistas opinan sobre el.  ', '2019-04-04', 'la7jS916RmI77Ut3ZOc9TC1C99X.jpg', 'descarga.jpg', 0),
(182, 'Gandhi', NULL, 'En el ano 1982, esta pelicula es merecedora a 8 oscares, y obtuvo 11 nominaciones. Pelicula biografica sobre la vida de Mahatma Gandh, un gran hombre, con ferviente creencia en la paz y en la capacidad de ser escuchados sin necesidad de guerras y muertes.', '2015-08-30', 'Gandhi-movie-Poster.jpg', 'AAAABeRa8Hy-QjpdMbhywpbwp-50mygXxTuSPPhrZ2-TwDYe3XJ98nPJlmMeJDyqU3QZId5OqAixAnQvYtlMZaj_lOdINP6hxEYlqbwa.jpg', 0),
(183, '12 anos de esclavitud', NULL, 'Basada en la novela homonima de Solomon Northup, inspirada en hechos reales. Tras beber dos copas con desconocidos, el musico negro de New York, Solomon Northup es vendido como esclavo en el sur de Louisiana.  ', '2012-03-03', '12_anos_de_esclavitud.jpg', 'descarga.jpg', 0),
(184, 'Shine', NULL, 'Basada en hechos reales, narra la historia de David Helfgott, un brillante y virtuoso pianista australiano cuya insoportable presion paterna le traumatizo hasta el punto de alcanzar estados de demencia y sufrir internamiento en un asilo.', '2009-08-03', '20135577.webp', '772ee67722549180b150765fb851a3fd7c7372be413ea1b5dff54a56baf4fdfe._RI_TTW_.jpg', 0),
(185, 'Mandela: Del mito al hombre', NULL, 'Biopic que narra la historia de Nelson Mandela, desde sus inicios como abogado en el Congreso Nacional de Africa en 1940, cuando la ley Apartheid estaba expandida.  ', '2014-12-23', 'mandela.jpg', 'mandela-del-mito-al-hombre-4.jpg', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `critica`
--

CREATE TABLE `critica` (
  `codigo` int(9) NOT NULL,
  `comentario` varchar(255) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `cod_contenido` int(9) DEFAULT NULL,
  `cod_usuario` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `critica`
--

INSERT INTO `critica` (`codigo`, `comentario`, `fecha`, `cod_contenido`, `cod_usuario`) VALUES
(1, 'nuevo', '2023-06-04 20:48:33', 96, 1),
(2, 'critica de prueba', '2023-06-10 12:46:42', 45, 2),
(3, 'critica', '2023-06-10 12:53:37', 176, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favoritos`
--

CREATE TABLE `favoritos` (
  `codigo` int(9) NOT NULL,
  `cod_contenido` int(11) NOT NULL,
  `cod_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `favoritos`
--

INSERT INTO `favoritos` (`codigo`, `cod_contenido`, `cod_usuario`) VALUES
(63, 76, 1),
(64, 12, 1),
(66, 20, 1),
(68, 57, 1),
(69, 1, 1),
(70, 13, 1),
(71, 22, 1),
(72, 45, 2),
(73, 43, 2),
(74, 74, 2),
(75, 176, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `codigo` int(11) NOT NULL,
  `cod_contenido` int(9) NOT NULL,
  `cod_genero` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`codigo`, `cod_contenido`, `cod_genero`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 3),
(5, 5, 4),
(6, 6, 1),
(7, 7, 1),
(8, 8, 4),
(9, 9, 5),
(10, 10, 6),
(11, 11, 3),
(12, 12, 6),
(13, 13, 6),
(14, 14, 3),
(15, 15, 5),
(16, 16, 6),
(17, 17, 4),
(18, 18, 4),
(19, 19, 5),
(20, 20, 6),
(21, 21, 1),
(22, 22, 6),
(23, 23, 5),
(24, 24, 4),
(27, 27, 4),
(28, 28, 4),
(29, 29, 4),
(30, 30, 4),
(31, 31, 4),
(32, 32, 4),
(33, 33, 4),
(34, 34, 4),
(35, 35, 4),
(36, 36, 4),
(37, 37, 4),
(38, 38, 4),
(39, 39, 4),
(40, 40, 4),
(41, 41, 4),
(42, 42, 4),
(43, 43, 1),
(44, 44, 1),
(45, 45, 1),
(46, 46, 1),
(47, 47, 1),
(48, 48, 1),
(49, 49, 1),
(50, 50, 1),
(51, 51, 1),
(52, 52, 1),
(53, 53, 1),
(54, 54, 1),
(55, 55, 1),
(56, 56, 1),
(57, 57, 1),
(58, 58, 1),
(59, 59, 1),
(60, 60, 1),
(61, 61, 1),
(62, 62, 1),
(63, 63, 1),
(64, 64, 6),
(65, 65, 6),
(66, 66, 6),
(67, 67, 6),
(68, 68, 6),
(69, 69, 6),
(70, 70, 6),
(71, 71, 6),
(72, 72, 6),
(73, 73, 6),
(74, 74, 6),
(75, 75, 6),
(76, 76, 6),
(77, 77, 6),
(78, 78, 6),
(79, 79, 6),
(80, 80, 6),
(81, 81, 6),
(82, 82, 6),
(83, 83, 6),
(84, 84, 3),
(85, 85, 3),
(86, 86, 3),
(87, 87, 3),
(88, 88, 3),
(90, 90, 3),
(91, 91, 3),
(92, 92, 3),
(93, 93, 3),
(94, 94, 3),
(95, 95, 3),
(96, 96, 3),
(97, 97, 3),
(98, 98, 3),
(99, 99, 3),
(100, 100, 3),
(101, 101, 3),
(102, 102, 3),
(103, 103, 3),
(104, 104, 3),
(105, 105, 3),
(106, 106, 7),
(108, 108, 7),
(109, 109, 7),
(110, 110, 7),
(111, 111, 7),
(112, 112, 7),
(113, 113, 7),
(114, 114, 7),
(115, 115, 7),
(116, 116, 7),
(117, 117, 7),
(118, 118, 7),
(119, 119, 7),
(120, 120, 7),
(121, 121, 7),
(122, 122, 7),
(123, 123, 7),
(124, 124, 7),
(125, 125, 7),
(126, 126, 8),
(127, 127, 8),
(128, 128, 8),
(129, 129, 8),
(130, 130, 8),
(131, 131, 8),
(132, 132, 8),
(133, 133, 8),
(134, 134, 8),
(135, 135, 8),
(136, 136, 8),
(137, 137, 8),
(138, 138, 8),
(139, 139, 8),
(140, 140, 8),
(141, 141, 8),
(143, 143, 8),
(144, 144, 8),
(145, 145, 8),
(146, 146, 9),
(147, 147, 9),
(148, 148, 9),
(149, 149, 9),
(150, 150, 9),
(151, 151, 9),
(152, 152, 9),
(153, 153, 9),
(154, 154, 9),
(155, 155, 9),
(156, 156, 9),
(157, 157, 9),
(158, 158, 9),
(159, 159, 9),
(160, 160, 9),
(161, 161, 9),
(162, 162, 9),
(163, 163, 9),
(165, 165, 9),
(166, 166, 2),
(167, 167, 2),
(168, 168, 2),
(169, 169, 2),
(170, 170, 2),
(171, 171, 2),
(172, 172, 2),
(173, 173, 2),
(174, 174, 2),
(175, 175, 2),
(176, 176, 2),
(177, 177, 2),
(178, 178, 2),
(179, 179, 2),
(180, 180, 2),
(181, 181, 2),
(182, 182, 2),
(183, 183, 2),
(184, 184, 2),
(185, 185, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE `generos` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`codigo`, `nombre`) VALUES
(4, 'Accion'),
(5, 'Aventura'),
(2, 'Biografia'),
(6, 'Comedia'),
(9, 'Documental'),
(7, 'Drama'),
(1, 'Horror'),
(8, 'Romance'),
(3, 'Sci-Fi');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `likes`
--

CREATE TABLE `likes` (
  `codigo` int(11) NOT NULL,
  `cod_critica` int(9) DEFAULT NULL,
  `cod_comentario` int(9) DEFAULT NULL,
  `cod_usuario` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `likes`
--

INSERT INTO `likes` (`codigo`, `cod_critica`, `cod_comentario`, `cod_usuario`) VALUES
(4, 2, NULL, 3),
(5, NULL, 1, 1),
(6, 2, NULL, 1),
(7, 3, NULL, 3),
(8, NULL, 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reparto`
--

CREATE TABLE `reparto` (
  `codigo` int(11) NOT NULL,
  `cod_contenido` int(9) NOT NULL,
  `cod_actor` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `siguiendo`
--

CREATE TABLE `siguiendo` (
  `codigo` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `siguiendo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `siguiendo`
--

INSERT INTO `siguiendo` (`codigo`, `usuario`, `siguiendo`) VALUES
(5, 1, 4),
(6, 1, 2),
(9, 1, 3),
(10, 3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `codigo` int(11) NOT NULL,
  `correo` varchar(125) NOT NULL,
  `usuario` varchar(125) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `rol` int(1) DEFAULT NULL,
  `recuperar` int(9) DEFAULT NULL,
  `activado` int(1) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `bloquear` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`codigo`, `correo`, `usuario`, `clave`, `rol`, `recuperar`, `activado`, `foto`, `bloquear`) VALUES
(1, 'prueba@mail.com', 'willmattos', '$2y$13$gG/3rNEMNNp4fC0.CU4ZEuv92kSycI.DQvCHuSuJu8gRsRoaoJtmu', 2, NULL, 1, 'simbolo-de-herramienta-llena-de-filtro.png', NULL),
(2, 'usuario@mail.com', 'user', '$2y$13$Jua3ih.qqxHcnHMfGLnaEub5LwGsThidos.ipys9lCnNV1uTNPCWC', 0, 1402432990, 1, NULL, NULL),
(3, 'usuario2@mail.com', 'usuario2', '$2y$13$Jua3ih.qqxHcnHMfGLnaEub5LwGsThidos.ipys9lCnNV1uTNPCWC', 1, 1402432990, 1, NULL, NULL),
(4, 'nuevacuenta@mail.com', 'nuevacuenta', '$2y$13$DXO.c8DAGPJLmybQagJlVus9NIQp8aJPGz5CauUjWhepYJx6e08oG', NULL, 1293649260, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valora`
--

CREATE TABLE `valora` (
  `codigo` int(11) NOT NULL,
  `puntuacion` int(1) NOT NULL,
  `cod_contenido` int(9) NOT NULL,
  `cod_usuario` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `valora`
--

INSERT INTO `valora` (`codigo`, `puntuacion`, `cod_contenido`, `cod_usuario`) VALUES
(1, 5, 1, 1),
(2, 5, 7, 1),
(3, 5, 76, 1),
(4, 5, 19, 1),
(5, 5, 45, 1),
(6, 3, 45, 2),
(7, 2, 176, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitas`
--

CREATE TABLE `visitas` (
  `codigo` int(11) NOT NULL,
  `cod_contenido` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `contador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `visitas`
--

INSERT INTO `visitas` (`codigo`, `cod_contenido`, `fecha`, `contador`) VALUES
(48, 45, '2023-06-04', 7),
(49, 43, '2023-06-04', 1),
(50, 1, '2023-06-04', 1),
(51, 61, '2023-06-04', 1),
(52, 29, '2023-06-04', 1),
(53, 176, '2023-06-04', 1),
(55, 175, '2023-06-04', 1),
(56, 106, '2023-06-04', 1),
(57, 148, '2023-06-04', 4),
(58, 45, '2023-06-10', 7),
(59, 43, '2023-06-10', 3),
(60, 74, '2023-06-10', 1),
(61, 176, '2023-06-10', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `usuario` (`usuario`),
  ADD KEY `critica` (`critica`);

--
-- Indices de la tabla `contenido`
--
ALTER TABLE `contenido`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `critica`
--
ALTER TABLE `critica`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `cod_contenido` (`cod_contenido`),
  ADD KEY `cod_usuario` (`cod_usuario`);

--
-- Indices de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `cod_contenido` (`cod_contenido`),
  ADD KEY `cod_usuario` (`cod_usuario`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `cod_contenido` (`cod_contenido`),
  ADD KEY `cod_genero` (`cod_genero`);

--
-- Indices de la tabla `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `cod_comentario` (`cod_comentario`),
  ADD KEY `cod_critica` (`cod_critica`),
  ADD KEY `cod_usuario` (`cod_usuario`);

--
-- Indices de la tabla `reparto`
--
ALTER TABLE `reparto`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `cod_actor` (`cod_actor`),
  ADD KEY `cod_contenido` (`cod_contenido`);

--
-- Indices de la tabla `siguiendo`
--
ALTER TABLE `siguiendo`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `siguiendo` (`siguiendo`),
  ADD KEY `usuario` (`usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `valora`
--
ALTER TABLE `valora`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `cod_contenido` (`cod_contenido`),
  ADD KEY `cod_usuario` (`cod_usuario`);

--
-- Indices de la tabla `visitas`
--
ALTER TABLE `visitas`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `cod_contenido` (`cod_contenido`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actor`
--
ALTER TABLE `actor`
  MODIFY `codigo` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `codigo` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `contenido`
--
ALTER TABLE `contenido`
  MODIFY `codigo` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;

--
-- AUTO_INCREMENT de la tabla `critica`
--
ALTER TABLE `critica`
  MODIFY `codigo` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  MODIFY `codigo` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT de la tabla `generos`
--
ALTER TABLE `generos`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `likes`
--
ALTER TABLE `likes`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `reparto`
--
ALTER TABLE `reparto`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `siguiendo`
--
ALTER TABLE `siguiendo`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `valora`
--
ALTER TABLE `valora`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `visitas`
--
ALTER TABLE `visitas`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`critica`) REFERENCES `critica` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `critica`
--
ALTER TABLE `critica`
  ADD CONSTRAINT `critica_ibfk_1` FOREIGN KEY (`cod_contenido`) REFERENCES `contenido` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `critica_ibfk_2` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD CONSTRAINT `favoritos_ibfk_1` FOREIGN KEY (`cod_contenido`) REFERENCES `contenido` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favoritos_ibfk_2` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `genero`
--
ALTER TABLE `genero`
  ADD CONSTRAINT `genero_ibfk_1` FOREIGN KEY (`cod_contenido`) REFERENCES `contenido` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `genero_ibfk_2` FOREIGN KEY (`cod_genero`) REFERENCES `generos` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`cod_comentario`) REFERENCES `comentarios` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`cod_critica`) REFERENCES `critica` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `likes_ibfk_3` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reparto`
--
ALTER TABLE `reparto`
  ADD CONSTRAINT `reparto_ibfk_1` FOREIGN KEY (`cod_actor`) REFERENCES `actor` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reparto_ibfk_2` FOREIGN KEY (`cod_contenido`) REFERENCES `contenido` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `siguiendo`
--
ALTER TABLE `siguiendo`
  ADD CONSTRAINT `siguiendo_ibfk_1` FOREIGN KEY (`siguiendo`) REFERENCES `usuario` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `siguiendo_ibfk_2` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `valora`
--
ALTER TABLE `valora`
  ADD CONSTRAINT `valora_ibfk_1` FOREIGN KEY (`cod_contenido`) REFERENCES `contenido` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `valora_ibfk_2` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `visitas`
--
ALTER TABLE `visitas`
  ADD CONSTRAINT `visitas_ibfk_1` FOREIGN KEY (`cod_contenido`) REFERENCES `contenido` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
