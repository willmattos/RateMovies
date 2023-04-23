-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 23-04-2023 a las 21:31:32
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
-- Estructura de tabla para la tabla `contenido`
--

CREATE TABLE `contenido` (
  `codigo` int(9) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `descripcion` text NOT NULL,
  `estreno` date NOT NULL DEFAULT current_timestamp(),
  `confirmado` int(1) NOT NULL DEFAULT 0,
  `poster` varchar(255) DEFAULT NULL,
  `portada` varchar(255) DEFAULT NULL,
  `trailer` varchar(255) NOT NULL,
  `cod_ref` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contenido`
--

INSERT INTO `contenido` (`codigo`, `titulo`, `alias`, `descripcion`, `estreno`, `confirmado`, `poster`, `portada`, `trailer`, `cod_ref`) VALUES
(1, 'El resplandor', NULL, 'Jack Torrance, un escritor ex-alcoholico, acepta un puesto como vigilante de invierno en un solitario hotel de alta montana al que se traslada con su familia. Una vez alli, empieza a sufrir inquietantes trastornos de personalidad.', '2023-03-13', 1, NULL, NULL, '', NULL),
(2, 'Letras Explicitas', NULL, 'En 1987, cinco jovenes, utilizando rimas brutalmente honestas y bases musicales pesadas, expresan su frustracion y enojo sobre la vida en el lugar mas peligroso de Estados Unidos utilizando el arma mas poderosa que tenian: su musica.', '2023-03-13', 1, NULL, NULL, '', NULL),
(3, 'Alien: El octavo pasajero', NULL, 'De regreso a la Tierra, la nave de carga Nostromo interrumpe su viaje y despierta a sus siete tripulantes. El ordenador central, MADRE, ha detectado la misteriosa transmision de una forma de vida desconocida, procedente de un planeta cercano aparentemente deshabitado.', '2023-03-13', 1, NULL, NULL, '', NULL),
(4, 'Volver al futuro', NULL, 'El adolescente Marty McFly es amigo de Doc, un cientifico al que todos toman por loco. Cuando Doc crea una maquina para viajar en el tiempo, un error fortuito hace que Marty llegue a 1955, ano en el que sus futuros padres aun no se habian conocido.', '2023-03-13', 1, NULL, NULL, '', NULL),
(5, 'Dragon Ball Z: La resurrecion de Freezer', NULL, 'Despues de que Bills, el Dios de la destruccion, decidiera no destruir la Tierra, se vive una gran epoca de paz. Hasta que Sorbet y Tagoma, antiguos miembros elite de la armada de Freezer, llegan a la Tierra con el objetivo de revivir a su lider por medio de las Esferas del Dragon.', '2023-03-13', 1, NULL, NULL, '', NULL),
(6, 'Actividad Paranormal', NULL, 'Una pareja feliz, joven y de clase media ve su vida atormentada por un espiritu demoniaco. Ella es una estudiante que esta punto de graduarse como profesora, y el, un corredor de bolsa que trabaja desde su casa. Viven desde hace tres anos en una casa que parecia completamente normal.', '2023-03-13', 1, NULL, NULL, '', NULL),
(7, 'Tiburon', NULL, 'En las aguas de un pequeno pueblo costero del Este de Estados Unidos, un enorme tiburon ataca a varias personas. Por temor a las repercusiones que este incidente podria tener sobre el negocio turistico, el alcalde se niega a cerrar las playas y a difundir la noticia.', '2023-03-13', 1, NULL, NULL, '', NULL),
(8, 'Karate Kid', NULL, 'Remake adaptado a la epoca contemporanea del clasico de los 80 Karate Kid. Sigue la historia de Dre, un joven skateboarder que se muda a China con su madre soltera por motivos de trabajo. Cuando un maton local empiece a molestarle, el joven encontrara un apoyo en Mr. Han.', '2023-03-13', 1, NULL, NULL, '', NULL),
(9, 'Pan: Viaje a nunca jamas', NULL, 'Peter es un chico de 12 anos con una irreprimible vena rebelde. Entonces, en el curso de una noche increible, Peter se ve transportado desde el orfanato y aparece en un mundo fantastico de piratas, guerreros y hadas llamado Nunca Jamas. Se enfrentara a sorprendentes aventuras y combates.', '2023-03-13', 1, NULL, NULL, '', NULL),
(10, 'Pixeles', NULL, 'En el campeonato mundial de videojuegos de 1982 compiten Sam, Will, Ludlow y Eddie \'Lanzallamas\' Plant. Una grabacion de este campeonato se envio al espacio, la cual fue malinterpretada por una civilizacion alienigena como una declaracion de guerra y atacan la tierra.', '2023-03-13', 1, NULL, NULL, '', NULL),
(11, 'Jurassic World: Mundo Jurasico', NULL, 'Todo esta yendo bien, la gente llega por miles a la isla. Pero la ultima gran atraccion del parque, un dinosaurio carnivoro modificado geneticamente para atraer mas visitantes, escapa de su zona de contencion y va matando todo a su paso.', '2023-03-13', 1, NULL, NULL, '', NULL),
(12, 'Toy Story 2', NULL, 'Cuando Andy se va de campamento dejando solos a los juguetes, Al McWhiggin, un compulsivo coleccionista de juguetes valiosos, secuestra a Woody. Buzz Lightyear y el resto de los juguetes de Andy deberan actuar con rapidez para rescatarlo, poniendose al frente de una operacion.', '2023-03-13', 1, NULL, NULL, '', NULL),
(13, 'La era de hielo', NULL, 'Hace muchos, muchos anos, tantos como 20.000, una pequena ardirata de nombre Scrat queria esconder una bellota en el hielo. Pero lo que hace es provocar una semicatastrofe que provoca que todos los animales migren hacia el sur, hacia tierras mas calidas.', '2023-03-13', 1, NULL, NULL, '', NULL),
(14, 'Transformers', NULL, 'Aqui entablaran una disputa con los humanos de por medio, que tomaran partido por los autobots. La Tierra es la salida para estas maquinas, pues rica en minerales y quimicos, representa la salvacion para los automatas, quienes emprenderan una terrible guerra por el preciado Cubo.', '2023-03-13', 1, NULL, NULL, '', NULL),
(15, 'El Hobbit: Batalla de los cinco ejercitos', NULL, 'Despues de haber recuperado el reino del Dragon Smaug en la montana, la Compania ha desencadenado, sin querer, una potencia maligna. Un Smaug enfurecido vuela hacia la Ciudad del Lago para acabar con todo.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(16, 'La mascara', NULL, 'Stanley Ipkiss es un empleado de banca extremadamente amable, pero desgraciadamente es un pusilanime cuando tiene que enfrentarse a alguien. Tras uno de los peores dias de su vida, Stanley encuentra una mascara que representa a Loki, un dios de la malicia y la travesura.', '2023-03-13', 1, NULL, NULL, '', NULL),
(17, 'Indiana Jones: En busca del arca perdida', NULL, 'Despues de una infructuosa mision en Sudamerica, el gobierno estadounidense le encarga la busqueda del Arca de la Alianza, donde se conservan las Tablas de la Ley que Dios entrego a Moises.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(18, 'Ghost Rider 2: Espiritu de venganza', NULL, 'Nueva adaptacion del comic \'El motorista fantasma\'. vive apartado del mundo y sin relacionarse con nadie, pero acaba siendo localizado por el monje Moreau, que necesita su ayuda para buscar a Nadya y a su hijo Danny antes de que los encuentre Roarke, un viejo conocido de Blaze.', '2023-03-13', 1, NULL, NULL, '', NULL),
(19, 'Los Juegos del Hambre: Sinsajo Parte I', NULL, 'Bajo el liderazgo de la comandante Coin y el consejo de sus amigos mas leales, Katniss extiende sus alas mientras lucha por salvar a Peeta Mellark y a una nacion alentada por su valentia...  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(20, 'Hombres de Negro 3', NULL, 'Cuando el MIB recibe la informacion de que el Agente K podria morir a manos de un alienigena, lo que cambiaria la historia para siempre, el Agente J es enviado a los anos 60 para evitarlo. Tercera entrega de la popular saga Men in Black.', '2023-03-13', 1, NULL, NULL, '', NULL),
(21, 'Ouija', NULL, 'Un grupo de jovenes utiliza una Ouija para contactar con un amigo que ha fallecido recientemente. El problema llega cuando despiertan a una presencia oscura. Adaptacion del juego de tablero de Hasbro.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(22, 'Space Jam', NULL, 'Bugs Bunny y su equipo desafian a los Nerdlucks (un grupo de pequenos extraterrestres) a un partido de baloncesto para decidir si los Looney Tunes permanecen en la Tierra o se trasladan a una lejana galaxia para trabajar en un parque de atracciones de Montana Tontolandia.', '2023-03-13', 1, NULL, NULL, '', NULL),
(23, 'Buscando a Nemo', NULL, 'El pececillo Nemo, que es hijo unico, es muy querido y protegido por su padre. Despues de ser capturado en un arrecife australiano va a parar a la pecera de la oficina de un dentista de Sidney. Su timido padre emprendera una peligrosa aventura para rescatarlo.', '2023-03-13', 1, NULL, NULL, '', NULL),
(24, 'Solo por dinero', NULL, 'Una mujer divorciada y desempleada se transforma en una caza-recompensas para sobrevivir, esto la lleva a un caso muy dificil que involucra a su ex-novio de preparatoria.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(25, 'Sinsajo Parte 1', NULL, 'Ya en el Distrito 13 tras demoler los Juegos del Hambre, Katniss se convierte en el simbolo de una gran rebelion en contra del Capitolio.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(26, 'Sin limites', NULL, 'Con su carrera como escritor hundiendose, Eddie Morra le da un giro a su vida despues de tomar una droga que proporciona un enfoque mental asombroso.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(27, 'Sin escape', NULL, 'Cuando un adolecente encuentra su foto de nino en un sitio web de personas extraviadas. Comienza a cuestionarse todo lo que ha conocido.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(28, 'Sin nombre', NULL, 'Huyendo de una pandilla, Casper aborda un tren rumbo al Norte para comenzar de cero en otro pais, Esquivando varios peligros, hace amistad con Sayra, una chica hondurena.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(29, 'Los 4 fantasticos', NULL, 'Cuatro jovenes cientificos alcanzan habilidades super-humanas cuando un experimento de tele-transportador sale mal. ahora, deben de aprender a usar sus nuevos poderes para salvar al mundo de un tirano en ascenso.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(30, 'Max', NULL, 'Un perro que ayudo a los soldados Afganistan regresa a los Estados Unidos y es adoptado por la familia de su adiestrador despues de vivir una experiencia traumatica.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(31, 'Vacaciones', NULL, 'Un maduro Rusty Griswold sorprende a su esposa, Debbie, y a sus dos hijos con una travesia de vuelta al parque de diversiones preferida de la familia en Estados Unidos, Walley World.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(32, 'Mision Imposible 5', NULL, 'Ethan y su equipo regresan para una mision aun mas imposible: erradicar al Syndicato, una organizacion internacional tan bien entrenada como ellos, y destina a destruir al IMF.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(33, 'Los Vengadores 2', NULL, 'Cuando Tony Stark intenta iniciar un programa para garantizar la paz, las cosas se ponen feas y los vengadores deberan detener al villano Ultron, que hara todo lo posible por arruinar sus planes.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(34, 'Lugares Oscuros', NULL, 'Una mujer que sobrevive al brutal asesinato de su familia cuando era nina, es obligada a confrontarse con los eventos ocurridos ese dia, por una sociedad secreta obsesionada con la resolucion de crimenes famosos.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(35, 'Bajo el mismo cielo (Aloha)', NULL, 'Un reconocido instructor militar regresa al lugar donde logro su exito y se reconecta con un viejo amor, mientras inesperadamente se enamora de la responsable de la fuerza aerea que le han puesto para seguirlo.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(36, 'Antes de ir', NULL, 'Una mujer pierde el tren de la 1:30 de Nueva York  Boston, tras los cual un musico de la calle pasa la noche tratando de ayudarla a hacer que pueda volver a casa antes de que llegue su marido. A lo largo de la noche aprenden el uno del otro y se enamoran.', '2023-03-13', 1, NULL, NULL, '', NULL),
(37, 'El regalo', NULL, 'Simon y Robyn son un joven matrimonio cuya vida va segun lo planeado. Cuando reaparece un viejo conocido de la escuela de Simon, el no lo reconoce, pero despues de varios encuentros inesperados y extranos regalos.', '2023-03-13', 1, NULL, NULL, '', NULL),
(38, 'Chica Final', NULL, 'Un grupo de jovenes adolecentes elige a la chica equivocada para su iniciacion.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(39, 'Chappie', NULL, 'Luego de haber sido secuestrado por dos criminales durante sus primeras horas de vida, Chappie se convierte en el hijo de una extrana y disfuncional familia. Chappie es especial, tiene un don, es uno en un millon, un prodigio. Chappie, es un robot.', '2023-03-13', 1, NULL, NULL, '', NULL),
(40, 'Kingsman, el servicio secreto', NULL, 'Un veterano agente del servicio secreto de los Estados Unidos toma bajo su proteccion a un nuevo recluta que esta en carrera para convertirse en agente secreto.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(41, 'El invitado', NULL, 'Los Peterson siguen llorando el fallecimiento de su hijo Caleb en Afganistan, En pleno duelo, David irrumpe en el hogar familiar y conquista a cada uno de sus miembros hasta que uno de ellos empieza a intuir que David no es quien parece ser.', '2023-03-13', 1, NULL, NULL, '', NULL),
(42, 'Dracula', NULL, 'La historia explora el origen de Dracula, mezcla de vampirismo y la historia real del Principe Vlad El Empalador - quien inspiro al Dracula de Bram Stoker -, retratandolo como un heroe en una tragica historia de amor en una oscura epoca de magia y guerra.', '2023-03-13', 1, NULL, NULL, '', NULL),
(43, 'Resident Evil 5: La venganza', NULL, 'El letal virus T de Unbrella Corporation esta transformando a las personas comunes en legiones de muertos vivos, y la raza humana tiene una unica esperanza: Alice  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(44, 'Mi novio es un Zombie', NULL, 'Un zombie recien fallecido que se come el cerebro de un joven y absorbe sus recuerdos, se enamora de la novia de su victima.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(45, 'Guerra Mundial Z', NULL, 'Un empleado de la ONU pelea contra el tiempo y el destino mientras viaja por el mundo intentando frenar una pandemia mortal de zombis.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(46, 'Terror en Silent Hill 2: La revelacion', NULL, 'Atormnetada por pesadillas y la desaparicion de su padre, Heather ira tras el y descubrira algo inquietante sobre su propia identidad.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(47, 'Carrie', NULL, 'En esta version del filme de horror, una inadaptada adolecente se venga de sus companeros usando poderes sobrenaturales y desata el caos en el baila de graduacion.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(48, 'Diabolica tentacion', NULL, 'Despues de un paseo sobrenatural con una banda satanica emo, la sexy porrista Jennifer se transforma en un demonio.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(49, 'Esta detras de ti', NULL, 'Despues de tener sexo, Jay descubre que su ligue le paso una maldicion letal, de la que solo podra librarse acostandose con alguien mas.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(50, 'Una pelicula de miedo', NULL, 'Marlon y Shawn Wayans participan en esta mordaz satira sobre algunos de los exitos de taquilla de terror adolecente mas popular de Hollywood.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(51, 'Archivo 253', NULL, 'Un grupo de investigadores de actividades paranormales decide saber la verdad sobre un manicomio abandonado.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(52, 'Palabras Diabolicas', NULL, 'El panico sacude un pueblito religioso cuando los ninos deaparecen y vuelven poseidos por un demonio. Los residentes tendran que eliminarlos.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(53, 'Pesadilla en la calle Elm', NULL, 'Freddy Krueger es un asesino serial que cruza la frontera entre los suenos y la realidad para destripar a sus victimas con sus filosos guantes.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(54, 'Siniestro', NULL, 'Un novelista de crimenes de la vida real encuentra unas cintas en las que aparecen asesinatos ocurridos en las casa que acaba de comprar.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(55, 'Mama', NULL, 'Tras la muerte de su madre dos ninas encuentran refugio con su tio, pero pronto se hace patente que no vienen solas.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(56, 'Dama de Negro 2', NULL, 'Durante la segunda guerra mundial, un grupo de estudiantes de Londres son evacuados a una casa dilapidada. Alli, sin darse cuenta, despertaran un espiritu sanguinario.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(57, 'Sangre de mi sangre', NULL, 'Ella tiene que cuidar a su hermana, pero su egorafobia la aleja de todos y de todo. Hasta que un vecino revienta la burbuja    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(58, 'Caso 39', NULL, 'Una ingenua trabajadora social lleva a su casa a una nina de 10 anos para rescatarla de sus padres abusadores, pero pronto descubre que la nina no es lo que parece.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(59, 'The Ouija Experimenet', NULL, 'Mientras juegan la tabla Ouija, un estudiante de cine con cuatro amigos abren e portal de los espiritus y reciben la visita de una nina que murio ahogada.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(60, 'La huerfana', NULL, 'Kate y John Coleman adoptan a Esther, una nina de 9 anos , de un orfanato. Pero Kate no tradara en descubrir que se esconde detras del rostro angelical de Esther.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(61, 'Chucky, el muneco diabolico', NULL, 'Andy, un nino de 6 anos, sabe que su muneco Chucky es responsable de una serie de asesinatos, pero ni su mama ni la policia le creen.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(62, 'Actividad Paranormal 4', NULL, 'La escalofriante saga de Katie, la joven psicotica, escribe una nueva pagina cuando el espiritu homicida que la habita pide mas sangre.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(63, 'La cabana del terror', NULL, 'Cinco amigos emprenden un viaje de descanso en una cabana alejada. Pero una vez alli descubren que hay un protocolo estricto que seguir si no quieren sufrir un castigo.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(64, 'Nuestro ultimo verano en Escocia', NULL, 'Una pareja a punto de divorciarse debe fingir tener un matrimonio perfecto cuando visitan al patriarca familiar moribundo en su cumpleanos.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(65, 'Verano en Staten Island', NULL, 'Esta historia divertidisima sobre socorristas que planean celebrar el verano a lo grande incluye a los integrantes de Saturday Night Live delante y detras de camara.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(66, 'Todo es relativo', NULL, 'Harry peleo duro para conquistar el corazon de Grace y tiene muchas ganas de conocer a sus padres, pero un secreto compartido puede arruinar todo.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(67, 'Amor de mis amores', NULL, 'Dias antes de su boda, ella cree haberse enamorado de un extrano que tambien se dirige hacia el altar, y su vidas cambian radicalmente.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(68, 'La dictadura perfecta', NULL, 'Tras aceptar un soborno descomunal, una poderosa corporacion televisiva intenta mejorar con mentiras la imagen de un notorio politico corrupto.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(69, 'La peor noche de mi vida', NULL, 'Despues de una peculiar noche de ligue, una aspirante a presentadora de noticias se embrolla en una travesia por los angeles sin, carro, dinero ni memoria.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(70, 'Heroe de centro comercial', NULL, 'Un guardia de seguridad demasiado entusiasta se encuentra en un aprieto cuando intenta frustrar el plan maestro de robar todo un centro comercial.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(71, 'Y, donde estan las rubias?', NULL, 'Dos agentes negros del FBI cuya mision es cuidar a dos aristocratas cabezahuecas se hacen pasar por dos muchachas blancas para atrapar a los posibles secuestradores.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(72, 'Ese es mi hijo', NULL, 'Las tensiones entre padre e hijo estallan cuando un papa desagradable decide mudarse con su hijo y la prometida de este, justo antes de su boda.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(73, 'Son como ninos', NULL, 'Cinco amigos se reunen despues de 30 anos en una casa del lago para llorar la perdida de su antiguo entrenador de basquet y vuelven a comportarse como jovencitos.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(74, 'Este cuerpo no es mio', NULL, 'La superficialidad de una porrista la mete en problemas cuando roba un juego de aretes malditos y termina atrapada en el cuerpo de un perdedor de 30 anos.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(75, 'Jack y Jill', NULL, 'Adam Sandler actua dos papeles como Jack, cabeza de familia y Jill su despota hermana gemela, quien llega de vacasiones y se queda por mas tiempo.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(76, 'Todo un parto', NULL, 'Unos dias antes de la fecha de parto de su esposa, Peter aterriza en la lista pasajeros vedados, por lo que debera cruzar el pais en auto con un vago exasperante.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(77, 'Los juegos hambrientos', NULL, 'En esta satira de los juegos del Hambre, una joven llamada Kantmiss toma parte en una feroz competencia que pone en pique a adolecentes entre si.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(78, 'Nacho Libre', NULL, 'Ignacio, cocinero de un monasterio mexicano, desea ayudar a la iglesia con sus problemas financieros y se inscribe en un circuito profesional de lucha con el nombre de Nacho.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(79, 'Norbit', NULL, 'Luego de ser obligado a casarse con una autoritaria mujer, el amable Norbit conoce a la chica de sus suenos en esta divertida comedia romatica.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(80, 'Pelotas en juego', NULL, 'Cuando el propietario de un elegante centro deportivo se dispone a sacar del negocio a Pete, dueno de un modesto gimnasio local, solo hay una respuesta: jugar al quemado.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(81, 'Una pareja de idiotas', NULL, 'Un par de locos y tontos amigos van en un alocado viaje por carretera para devolver un portafolio lleno de dinero en efecto a su legitimo dueno.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(82, 'Golpe bajo', NULL, 'Un mariscal de campo profesional convence a su amigo un exentrenador convicto, de preparar a un equipo de reclusos para jugar contra los guardias.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(83, 'Mi villano favorito 2', NULL, 'El archivillano Gru y sus tres huerfanas vuelven por mas hazanas turbias en esta chiflada pelicula animada con las voces de grandes figuras de Hollywood.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(84, 'El dador de recuerdos', NULL, 'En una sociedad futurista donde nadie sufre las adversidades que surgen del libre albedrio, un joven descubre una poderosa verdad que quiere revelar.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(85, 'El secreto de Adaline', NULL, 'Cuando una hermosa mujer de 29 anos, que vivio mas de un siglo pero que no envejecio, se enamora, el secreto de su pasado sale a la luz.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(86, 'John Carter: Entre dos mundos', NULL, 'Hace un instante, el veterano de la guerra civil, John Carter se escondia de los apaches, de pronto despierta en Marte, que se encuentra en crisis.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(87, 'Astro Boy', NULL, 'Astro Boy, joven robot creado por el Dr. Tenma, en la aventura de navegar por territorio desconocido buscando un proposito antes de regresar a salvar a sus seres queridos.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(88, 'Los Pinguinos de Madagascar: la pelicula', NULL, 'Los espias de altos vuelos Skiper, Kowalski, Rico y Cabo unen fuerzas con los agentes del Viento Norte para vencer al malvado Octavius Brine.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(89, 'Hombres de negro 3', NULL, 'Con la tierra bajo una amenaza alienigena, el agente J viaja en el tiempo y se une a un agente K mas joven para cambiar el curso de la historia.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(90, 'El planeta del tesoro', NULL, 'Cuando un joven de cabina de un galeon espacial descubre el mapa de un tesoro intergalactico, un ciborg cocinero le ensena a enfrentar supernovas y tormentas espaciales.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(91, 'Atlantis: El imperio perdido', NULL, 'Esta historia animada de accion sigue las andanzas de un grupo de aventureros en su viaje submarino hacia el mitico reino de la Atlantida.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(92, 'Los Vengadores', NULL, 'Un reparto de superheroes, incluidos Iron Man, el increible Hulk y Capitan America, se unen para salvar al mundo de una catastrofe.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(93, 'Iron Man 2', NULL, 'Robert Downey Jr. regresa como el millonario Tony Stark en esta emocionante secuela, ya revelado su secreto como super heroe, la vida de Tony esta mas agitada que nunca.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(94, 'Transformers: El lado oscuro de la Luna', NULL, 'Cuando Optimus Prime se entera de una nave Transformer derribada en la luna, lidera una mision para rescatar al piloto: su mentor, Sentinel Prime.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(95, 'Transformers: La venganza de los caidos', NULL, 'La batalla por la tierra continua cuando el estudiande Sam Witwicky conoce el origen ancestral de los Transformers y debe unirse a la batalla contra los Decepticons.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(96, 'Gigantes de acero', NULL, 'Un luchador en apuros devenido promotor se reencuentra con sus hijos para convertir a un robot de la vieja generacion en un poderoso contrincante de box.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(97, 'Megamente', NULL, 'Cuando el brillante supervillano Megamind mata por accidente a su nemesis, crea un nuevo enemigo que se propone destruir el mundo.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(98, 'Super 8', NULL, 'El escritor y director J.J. Abrams elabora un relato sobrenatural sobre 6 ninos que son testigos de algo increible mientras filman una pelicula con su camara de super 8.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(99, 'Guerra de los mundos', NULL, 'Un trabajador divorciado se convierte en el padre protector que nunca fue cuando una flota de naves espaciales aterriza a la tierra.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(100, 'Invasion el Mundo: Batalla Los Angeles', NULL, 'Liderados por su habilidoso sargento primero, un peloton de audaces infantes de marina lucha por proteger a toda la humanidad de alienigenas sorprendentemente poderosos.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(101, 'Sector 9', NULL, 'Tras anos de sagregaciones y trabajos forzosos, un grupo de alienigenas decide revelarse. El enfrentamiento entre humanos y extraterrestres llega a un punto critico.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(102, 'Wall-E', NULL, 'A muchos anos de distancia, dos robots hacen todo lo que puedan para salvar a una plantita, y a todo el planeta tierra.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(103, 'El planeta de los simios', NULL, 'Tras cruzar un vortice temporal, un astronauta cae en un planeta donde los simios dominan a los humanos, en esta reversion del clasico film 1968.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(104, 'Tron', NULL, 'Mientras investiga la desaparicion de su pader, Sam Flynn aterriza en un mundo computarizado de gladiadores esclavizados, donde su padre ha estado viviendo por 20 anos.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(105, 'Up: Una aventura de altura', NULL, 'Carl es un anciano de 78 anos que lleva toda la vida sonando con viajar. A esta edad y junto a un joven boy scout se enfrenta a la aventura de su vida.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(106, 'Recuerda este domingo', NULL, 'Una mesera solitaria conoce a un hombre lindo y excentrico, pero al tiempo se da cuenta de que le esta ocultando algo.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(107, 'La vida segura Grata', NULL, 'En esta historia de transicion a la edad adulta, una adolescente autodestructora va a pasar el verano de sus abuelos que estaban tan tranquilos.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(108, 'Amor de Verano', NULL, 'Este drama sobre la transicion a la vida adulta narra la historia de una adolecente poco femenina mientras lidia con su sensualidad emergente y su hermana mayor.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(109, 'Si decido quedarme', NULL, 'Una prodigio musical de 17 anos cae en coma luego de un tragico accidente automovilistico y tiene una experiencia extracorporal que pondra en juego su propio destino.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(110, '3 metros sobre el cielo', NULL, 'Un drama romantico que narra la historia de dos jovenes que pertenecen a mundos opuestos. Ella es una chica de clase media educada en la bondad y el un chico rebelde.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(111, 'Donde el corazon te lleva', NULL, 'Un abogado viudo por la custodia de su nieta mestiza, mientras que la abuela paterna de la nina se opondra a toda costa.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(112, 'Lecho de hielo', NULL, 'Con la esperanza de dejar sus oscuros dias en el departamento de policia de Baltimore, Nate se mudo a Alaska para vivir tranquilo como aguacil de un pueblo.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(113, 'Secuestradores', NULL, 'Por tomar una desviacion peligrosa, una madre soltera y su hijo se convierten en rehenes de un ladron de bancos que secuestran su auto.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(114, 'La ventajas de ser invisible', NULL, 'Un timido estudiante de nuevo ingreso lucha contra la depresion, la muerte de su mejor amigo y el amor en esta historia de crecimiento y compromiso.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(115, 'Operacion regalo', NULL, 'En su fabrica de juguetes supersecreta, santa encarga a su hijo Arthur, que se haga cargo de una mision de vital importancia par al navidad.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(116, 'Siempre Alice', NULL, 'Una profesora de lingistica, felizmente casada y madre de tres hijos, se enfrenta a un diagnostico de Alzheimer temprano que pone en jaque su carrera y su vida familiar.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(117, 'Una buena mentira', NULL, 'Un joven refugiado de la guerra de Sudan gana la loteria que le permite comenzar una nueva vida en Estados Unidos. Pero adaptarse a su nuevo hogar tiene sus desafios.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(118, 'El codigo enigma', NULL, 'Durante la segunda guerra mundial, un brillante matematico lidera un equipo de criptografos que intenta descifrar el inquebrantable codigo enigma de Alemania.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(119, 'Orgullo y prejuicio', NULL, 'En la novela de Jane Austen del siglo 19, la Sra.Bennet quiere casar a sus hijas con prosperos caballeros, incluido el recien llegado Sr. Darcy.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(120, 'Duelo de titanes', NULL, 'Denzel Washington es el entrenador afroamericano que lidera al primer equipo de futbol americano integrado de Virginia, en 1971, a pesar de las objeciones.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(121, 'Historias cruzadas', NULL, 'Misisipi 1960, una joven del sur altera la ciudad cuando comienza a entrevistar a las mujeres negras que trabajan para las familias blancas exponiendo el racismo que viven.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(122, 'Un sueno imposible', NULL, 'En este drama deportivo basado en una historia real, una acaudalada pareja acoge a un joven sin hogar y lo cuida hasta que se convierta en potencia del futbol americano.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(123, 'Belleza Americana', NULL, 'Mientras lucha por soportar a un aesposa perfeccionista, un empleo insatisfecho y una hosca hija adolecente, un hombre se encapricha con una amiga de su hija.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(124, 'Suenos en fuga', NULL, 'En esta adaptacion de la novela de Stephen King, Andy Dufresne es acusado de asesinato y enviado a la carcel de Shawshank, donde se hara amigo Red, uno de los reos.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(125, 'Preciosa', NULL, 'La adolescente Jones, maltratada por su madre y embarazada de su padre, tiene la oportunidad inesperada de tener una vida distinta en una escuela alternativa.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(126, 'Bajo el mismo techo', NULL, 'Holly y Eric descubren que se odian en la primer acita, pero deberan dejar de lado sus sentimientos al recibir la custodia del bebe de sus amigos.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(127, 'La ultima cancion', NULL, 'Ronnie Miller, una rebelde nina prodigio que toca el piano, intenta aprovecha su verano en Georfia para reconectarse con su padre.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(128, 'Querido John', NULL, 'Mientras esta de permiso, un soldado estadounidense se enamora de una chica, pero debe anrolarse de nuevo Podran las cartas mantener su amor?    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(129, 'Crepusculo la saga: Amanecer parte 1', NULL, 'Poco despues de que las almas gemelas inmortales Bella y Edward dan el si, una extrana sensacion comienza a surgir dentro del vientre creciente de Bella.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(130, 'Amigos con derecho', NULL, 'Emma y Adam, los amigos con derechos a roces, no tienen problemas con sus relaciones abiertas hasta que esas pequenas y molestas cosas llamadas sentimientos se entrometen.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(131, 'Love, Rosie', NULL, 'Rosie y Alex son mejores amigos, Crecieron juntos, comparten y conocen todo de sus vidas, pero nunca saben que decir del gran vinculo que los une.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(132, 'Lo mejor de mi', NULL, 'Vuelven a su hogar por un funeral y se reencuentran. Donde hubo fuego, cenizas quedan, pero los recuerdos dolorosos pueden apagarlos para siempre.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(133, 'Un pedacito de cielo', NULL, 'Despues de enterarse de que tiene cancer terminal, una alegre joven piensa que ya no queda mas en el camino, pero su corazon encuentra una esperanza.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(134, 'En tus ojos', NULL, 'Viven en extremos opuestos del pais y nunca se vieron, pero gracias a una conexion telepatica podran unirse en lo mas profundo de su ser y en el camino del amor.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(135, 'La vida segun Greta', NULL, 'En esta historia de transicion a la edad adulta, una adolescente autodestructiva va  a pasar el verano de sus abuelosque estan tan tranquilos.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(136, '6 anos', NULL, 'Una pareja de jovenes volatiles que estan juntos hace 6 anos tendra oportunidades inesperadas para sus carreras que amenazaran su futuro.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(137, 'Eterna juventud', NULL, 'Cuando una chica se pierde en el bosque y conoce a un chico junto a una fuente magica, se hace amiga de su familia y se entera de porque mantienen sus vidas en secreto.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(138, 'Escribiendo de amor', NULL, 'Un guionista bloqueado, divorciado y endeudado que gano un Oscar hace 15 anos acepta un trabajo como profesor universitario de una estudiante.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(139, 'Amigos intocables', NULL, 'Una conmovedora historia basada en hechos reales en la que un cuadriplejico contrata a un joven delicuente como su cuidador. La relacion entre ambos cambiara sus vidas.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(140, 'Las horas contigo', NULL, 'Una joven con un embarazo no deseado enfrenta sus miedos a la perdida y a la maternidad mientras pasa el tiempo con su abuela agonizada.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(141, 'Luna nueva', NULL, 'Bella sufre por la partida de su amor vampiro, edwars y encuentra consuelo en la amistad con Jacob un hombre lobo.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(142, 'Tributo a mi madre', NULL, 'Al morir su abuela, una antigua estrella infantil se muda a la granja familiar y se entera de secretos sorprendetentes de su madre.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(143, 'Recuerdame', NULL, 'Dolido aun por un desgarrador suceso familiar, Tyler se siente revivir cuando conoce a una belleza muy sociable con su pasado similiar al suyo.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(144, 'Diario de una pasion', NULL, 'En esta adaptacion del exito editorial del Nicholas Sparks, la guerra y las diferencias de clase dividen a dos jovenes amantes en la decada del cuarenta.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(145, 'La dama de oro', NULL, 'Seis decadas despues del Holocausto, Maria Altmann inicia una odisea para recuperar las obras de arte (incluso de Gustav Klimt) que los nazis le robaran a su familia.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(146, 'Alienigenas Ancestrales y el Bigfoot', NULL, 'Las personas de todos los continentes han afirmado ver las huellas de Pie Grande. Y los mitos antiguos hablan de un simio gigante como el acecho de la tierra.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(147, 'Maravillas modernas: Tecnologia de Da Vinci', NULL, 'Como un hombre del siglo XV pudo concebir innovaciones tan modernas? Si seguimos sus planos, funcionarian sus disenos? Gracias a recientes adelantos tecnologicos y a nuevos materiales, somos la primera generacion capaz de aplicar a la practica los dibujos de Leonardo.', '2023-03-13', 1, NULL, NULL, '', NULL),
(148, 'Planeta Tierra: Las cuevas - Los desiertos', NULL, 'Podras conocer los animales mas extranos de la tierra: seres que hacen nidos con su propia saliva, trogloditas que nunca han visto un solo rayo de luz en su vida. Ademas, recorreremos los desiertos donde su flora y fauna sobreviven a las condiciones mas raras de la tierra.', '2023-03-13', 1, NULL, NULL, '', NULL),
(149, 'Osos', NULL, 'Este documental abre la puerta a la vida de los osos salvajes de la costa y las montanas de Alaska, donde hay una gran poblacion de osos libres y fuertes en sus costumbres cotidianas. Un suceso para no perderselo!', '2023-03-13', 1, NULL, NULL, '', NULL),
(150, 'Azul intangible', NULL, 'Este documental, es una increible opcion para conocer la maravilla que se oculta en el oceano.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(151, 'Hijos de las nubes. La ultima colonia', NULL, 'Documental que inspecciona profundamente la deplorable situacion actual del norte de Africa y la mucha responsabilidad que tienen algunas de las potencias occidentales como Estados Unidos y Francia.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(152, 'Titanes de la Era de Hielo', NULL, 'Este documental transporta a los espectadores a los hermosos paisajes congelados de America del Norte, Europa y Asia diez mil anos antes de la civilizacion moderna.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(153, 'Indignados', NULL, 'Documental frances que narra las protestas que han estado surgiendo desde el 2011 en las calles europeas, ante las desigualdades sociales, de educacion y economicas. Tony Gatlif narra estos acontecimientos desde la vista de una inmigrante ilegal que se ve inmersa en el movimiento.', '2023-03-13', 1, NULL, NULL, '', NULL),
(154, 'Torre de marfil', NULL, 'Andrew Rossi, no le interesa reflejarse en artifices manas economicas. Asi pues, se introducira, en el campus universitario de Harvard para tratar de resolver esta inquietud que aunque parece sutil, podria resolver el interrogante de Es mejor la educacion publica o privada?.', '2023-03-13', 1, NULL, NULL, '', NULL),
(155, 'Happy Valley', NULL, 'El documental observa profundamente la vida y el pasado del deportista de futbol de la Universidad Estatal de Pennsylvania, Jerry Sandusky, quien fue acusado por abuso sexual a menores. Sera realmente inocente?  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(156, 'Solo. Escalada a la vida', NULL, 'Jordi Salas \"Pelon\" es el protagonista de esta hazana, que cuenta como siendo participe en escalada en la modalidad Solo, puede comprender mas a fondo los delirios y fantasias de la vida.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(157, 'El color que cayo del cielo', NULL, 'El documental recrea en cierta manera lo ambicioso que puede ser el ser humano y su falta de criterio personal.    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(158, 'En tierra extrana', NULL, 'Documental que cuenta algunas historias sobre jovenes emigrantes espanoles, que tras una fuerte crisis economica en el pais, han decidido buscar un mejor futuro en tierras donde parece que todo es mas fertil.', '2023-03-13', 1, NULL, NULL, '', NULL),
(159, 'Los ojos de America', NULL, 'America Scarfo fue la protagonista de una de las vivencias amorosas, mas apasionantes de toda Argentina. Cuando tenia 14 anos, se encontro en el camino a Severino Di Giovanni. A pesar de la fuerza que emanaba su amor, Di Giovanni fue fusilado a manos de la dictadura militar.', '2023-03-13', 1, NULL, NULL, '', NULL),
(160, 'Eco de la montana', NULL, 'A pesar del gran monumento cultural que ha donado al mundo, como el gran mural que pinto en Royal - Musee du Louvre, Santos es totalmente desconocido y al mismo tiempo ignorado en su propio pais de ahi quiza entonces la necesidad por mostrar su obra y su vida en este documental.', '2023-03-13', 1, NULL, NULL, '', NULL),
(161, 'El refugio', NULL, 'El personal tiene la dificil tarea de arreglar los problemas entre estas personas: las mujeres y los ninos primero, luego los hombres, solo hay 100 cupos.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(162, 'Al fin del mundo', NULL, 'Tolhuin, es un remoto pueblo adentrado en las entranas del extremo sur en Argentina nadie va alli, nadie se queda tampoco por el frio y la carencia de comodidades.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(163, 'Muros', NULL, 'Una pared separa, segrega, aisla es no-imagen. Muros es un documental que narra la realidad de algunos territorios disputados en todo el mundo.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(164, 'Lucha por el patrimonio', NULL, 'En el corazon de la ultima region salvaje de Australia, una comunidad aborigen, el Goolarabooloo, debe lidiar con el proyecto de desarrollo de la mayor fabrica de gas en el mundo, con el apoyo del gobierno.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(165, 'En los ojos de la memoria', NULL, '1985 fue el ano en el que la Villa turistica Epecuen, ubicada en la provincia de Buenos Aires, se vio perjudicada luego de que una viga de contencion cedio y provoco un accidente que termino en inundacion.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(166, 'Francisco', NULL, 'Como logra ser el Papa Francisco un joven timido que hallo su vocacion religiosa un dia de la de floracion (Dario Gandinetti)?    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(167, 'Bill', NULL, 'Bill cuenta la historia de lo que realmente sucedio durante los anos perdidos de Shakespeare...Bill Shakespeare deja a su familia y su hogar para seguir su sueno.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(168, 'En busca de la felicidad', NULL, 'Bill cuenta la historia de lo que realmente sucedio durante los anos perdidos de Shakespeare...Bill Shakespeare deja a su familia y su hogar para seguir su sueno.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(169, 'Maradona, la mano de Dios', NULL, 'Pelicula que nos relata la vida del famoso futbolista argentino Diego Armando Maradona. Desde sus inicios en el mundo del futbol y su paso a traves de su larga carrera futbolistica.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(170, 'Frida', NULL, 'Pelicula biografica de la que en vida fue la pintora mas revolucionaria tanto en ideas como en su sexualidad. Frida Kahlo, tuvo muchisimo amores, con mujeres como con hombres, en su afan de experimentar y marcar bien sus limites con conocimiento de causa.', '2023-03-13', 1, NULL, NULL, '', NULL),
(171, 'Dragon: La vida de Bruce Lee', NULL, 'Cinta biografica, que retrata de una forma clara, la verdadera historia del rey del Kung Fu: Bruce Lee. Bruce Lee, habria muerto dias antes de estrenarse la cinta mas taquillera de todos los tiempos en Artes marciales, Operacion Dragon.', '2023-03-13', 1, NULL, NULL, '', NULL),
(172, 'Zapata: El sueno del heroe', NULL, 'Cinta dirigida por Alfonso Arau, la misma que esta protagonizada por la gran Lucero y Alejandro Fernandez. Desarrolla la historia de Emiliano Zapata, un hombre, valiente y aguerrido que dio su vida durante la revolucion mexicana.', '2023-03-13', 1, NULL, NULL, '', NULL),
(173, 'Cleopatra', NULL, 'Cinta historica, que desarrolla lo mejor de la vida de la mas aclamada mujer egipcia: Cleopatra. Por muchos siglos ha sido recordada, y hasta la actualidad es un referente de belleza, inteligencia y caracter.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(174, 'El solista', NULL, 'Pelicula dirigida por Joe Wright, y que esta basada en hechos reales, pues desarrolla la historia de Nathaniel Ayers, un talentoso musico que durante sus estudios cayo en la enfermedad de la esquizofrenia y por ello no pudo terminar sus estudios.', '2023-03-13', 1, NULL, NULL, '', NULL),
(175, 'Sin limites', NULL, 'Pelicula biografica, que desarrolla la historia de Salvador Dali, junto a otros dos estudiantes, que con el tiempo, formarian parte de los mayores exponentes de la literatura.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(176, 'Ali', NULL, 'Pelicula biografica del peleador profesional Muhammad Ali, desde sus inicios en un pequeno y humilde barrio hasta su exito en las peleas mas dificiles que le toco vivir.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(177, 'Sugar', NULL, 'Excelente cinta biografica, que desarrolla la historia de Miguel Sugar, Santos, o como sus amigos le decian Sugar. Considerado uno de los mejores jugadores en la historia del Beisbol dominicano.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(178, 'Howl. La voz de una generacion', NULL, 'Pelicula Biografica de Allen Ginsberg, un icono de la cultura Beat y el movimiento Hippie. Howl (Aullido).    ', '2023-03-13', 1, NULL, NULL, '', NULL),
(179, 'Notorious', NULL, 'Biopic de la vida del famoso rapero Notorious B.I.G., un voluminoso cantante de rap neoyorquino que irrumpio con fuerza en el mundo de la musica del hip hop.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(180, 'Amelia', NULL, 'Hilary Swank, protagoniza a Amelia Earhart, la primera mujer que batio records de vuelo, y que intento sobrevolar todo el Oceano Pacifico, en el ano 1937.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(181, 'Michael Jackson: La leyenda continua', NULL, 'Documental creado durante la vida del rey del pop, a traves de pequenos fragmentos de conciertos, presentaciones, entrevistas, donde los especialistas opinan sobre el.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(182, 'Gandhi', NULL, 'En el ano 1982, esta pelicula es merecedora a 8 oscares, y obtuvo 11 nominaciones. Pelicula biografica sobre la vida de Mahatma Gandh, un gran hombre, con ferviente creencia en la paz y en la capacidad de ser escuchados sin necesidad de guerras y muertes.', '2023-03-13', 1, NULL, NULL, '', NULL),
(183, '12 anos de esclavitud', NULL, 'Basada en la novela homonima de Solomon Northup, inspirada en hechos reales. Tras beber dos copas con desconocidos, el musico negro de New York, Solomon Northup es vendido como esclavo en el sur de Louisiana.  ', '2023-03-13', 1, NULL, NULL, '', NULL),
(184, 'Shine', NULL, 'Basada en hechos reales, narra la historia de David Helfgott, un brillante y virtuoso pianista australiano cuya insoportable presion paterna le traumatizo hasta el punto de alcanzar estados de demencia y sufrir internamiento en un asilo.', '2023-03-13', 1, NULL, NULL, '', NULL),
(185, 'Mandela: Del mito al hombre', NULL, 'Biopic que narra la historia de Nelson Mandela, desde sus inicios como abogado en el Congreso Nacional de Africa en 1940, cuando la ley Apartheid estaba expandida.  ', '2023-03-13', 1, NULL, NULL, '', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `critica`
--

CREATE TABLE `critica` (
  `codigo` int(9) NOT NULL,
  `comentario` varchar(255) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `cod_contenido` int(9) NOT NULL,
  `cod_usuario` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favoritos`
--

CREATE TABLE `favoritos` (
  `cod_contenido` int(11) NOT NULL,
  `cod_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `cod_contenido` int(9) NOT NULL,
  `cod_genero` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`cod_contenido`, `cod_genero`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 3),
(5, 4),
(6, 1),
(7, 1),
(8, 4),
(9, 5),
(10, 6),
(11, 3),
(12, 6),
(13, 6),
(14, 3),
(15, 5),
(16, 6),
(17, 4),
(18, 4),
(19, 5),
(20, 6),
(21, 1),
(22, 6),
(23, 5),
(24, 4),
(25, 4),
(26, 4),
(27, 4),
(28, 4),
(29, 4),
(30, 4),
(31, 4),
(32, 4),
(33, 4),
(34, 4),
(35, 4),
(36, 4),
(37, 4),
(38, 4),
(39, 4),
(40, 4),
(41, 4),
(42, 4),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 6),
(65, 6),
(66, 6),
(67, 6),
(68, 6),
(69, 6),
(70, 6),
(71, 6),
(72, 6),
(73, 6),
(74, 6),
(75, 6),
(76, 6),
(77, 6),
(78, 6),
(79, 6),
(80, 6),
(81, 6),
(82, 6),
(83, 6),
(84, 3),
(85, 3),
(86, 3),
(87, 3),
(88, 3),
(89, 3),
(90, 3),
(91, 3),
(92, 3),
(93, 3),
(94, 3),
(95, 3),
(96, 3),
(97, 3),
(98, 3),
(99, 3),
(100, 3),
(101, 3),
(102, 3),
(103, 3),
(104, 3),
(105, 3),
(106, 7),
(107, 7),
(108, 7),
(109, 7),
(110, 7),
(111, 7),
(112, 7),
(113, 7),
(114, 7),
(115, 7),
(116, 7),
(117, 7),
(118, 7),
(119, 7),
(120, 7),
(121, 7),
(122, 7),
(123, 7),
(124, 7),
(125, 7),
(126, 8),
(127, 8),
(128, 8),
(129, 8),
(130, 8),
(131, 8),
(132, 8),
(133, 8),
(134, 8),
(135, 8),
(136, 8),
(137, 8),
(138, 8),
(139, 8),
(140, 8),
(141, 8),
(142, 8),
(143, 8),
(144, 8),
(145, 8),
(146, 9),
(147, 9),
(148, 9),
(149, 9),
(150, 9),
(151, 9),
(152, 9),
(153, 9),
(154, 9),
(155, 9),
(156, 9),
(157, 9),
(158, 9),
(159, 9),
(160, 9),
(161, 9),
(162, 9),
(163, 9),
(164, 9),
(165, 9),
(166, 2),
(167, 2),
(168, 2),
(169, 2),
(170, 2),
(171, 2),
(172, 2),
(173, 2),
(174, 2),
(175, 2),
(176, 2),
(177, 2),
(178, 2),
(179, 2),
(180, 2),
(181, 2),
(182, 2),
(183, 2),
(184, 2),
(185, 2);

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
  `cod_critica` int(9) NOT NULL,
  `cod_usuario` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion`
--

CREATE TABLE `notificacion` (
  `cod_seguidor` int(9) NOT NULL,
  `cod_seguido` int(9) NOT NULL,
  `cod_critica` int(9) NOT NULL,
  `leido` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reparto`
--

CREATE TABLE `reparto` (
  `cod_contenido` int(9) NOT NULL,
  `cod_actor` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `semanal`
--

CREATE TABLE `semanal` (
  `cod_contenido` int(9) NOT NULL,
  `contador` int(9) NOT NULL DEFAULT 1,
  `fecha` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `serie`
--

CREATE TABLE `serie` (
  `codigo` int(9) NOT NULL,
  `temporada` int(9) NOT NULL,
  `descripcion` text NOT NULL,
  `episodios` int(9) NOT NULL,
  `trailer` varchar(255) NOT NULL,
  `contenido` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `siguiendo`
--

CREATE TABLE `siguiendo` (
  `cod_seguidor` int(11) NOT NULL,
  `cod_seguido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `codigo` int(9) NOT NULL,
  `correo` varchar(125) NOT NULL,
  `usuario` varchar(125) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `rol` int(1) DEFAULT NULL,
  `recuperar` int(9) DEFAULT NULL,
  `activado` int(1) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`codigo`, `correo`, `usuario`, `clave`, `descripcion`, `rol`, `recuperar`, `activado`, `foto`) VALUES
(1, 'prueba@mail.com', 'Prueba', '$2y$13$gG/3rNEMNNp4fC0.CU4ZEuv92kSycI.DQvCHuSuJu8gRsRoaoJtmu', NULL, 1, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valora`
--

CREATE TABLE `valora` (
  `puntacion` int(1) NOT NULL,
  `cod_contenido` int(9) NOT NULL,
  `cod_usuario` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `contenido`
--
ALTER TABLE `contenido`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `cod_ref` (`cod_ref`);

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
  ADD PRIMARY KEY (`cod_contenido`,`cod_usuario`),
  ADD KEY `cod_usuario` (`cod_usuario`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`cod_contenido`,`cod_genero`),
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
  ADD PRIMARY KEY (`cod_critica`,`cod_usuario`),
  ADD KEY `cod_usuario` (`cod_usuario`);

--
-- Indices de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD KEY `cod_critica` (`cod_critica`),
  ADD KEY `cod_seguido` (`cod_seguido`),
  ADD KEY `cod_seguidor` (`cod_seguidor`);

--
-- Indices de la tabla `reparto`
--
ALTER TABLE `reparto`
  ADD PRIMARY KEY (`cod_contenido`,`cod_actor`),
  ADD KEY `cod_actor` (`cod_actor`);

--
-- Indices de la tabla `semanal`
--
ALTER TABLE `semanal`
  ADD PRIMARY KEY (`cod_contenido`);

--
-- Indices de la tabla `serie`
--
ALTER TABLE `serie`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `contenido` (`contenido`);

--
-- Indices de la tabla `siguiendo`
--
ALTER TABLE `siguiendo`
  ADD PRIMARY KEY (`cod_seguidor`,`cod_seguido`),
  ADD KEY `cod_seguido` (`cod_seguido`);

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
  ADD PRIMARY KEY (`cod_contenido`,`cod_usuario`),
  ADD KEY `cod_usuario` (`cod_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actor`
--
ALTER TABLE `actor`
  MODIFY `codigo` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contenido`
--
ALTER TABLE `contenido`
  MODIFY `codigo` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;

--
-- AUTO_INCREMENT de la tabla `critica`
--
ALTER TABLE `critica`
  MODIFY `codigo` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `generos`
--
ALTER TABLE `generos`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `codigo` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `contenido`
--
ALTER TABLE `contenido`
  ADD CONSTRAINT `contenido_ibfk_1` FOREIGN KEY (`cod_ref`) REFERENCES `contenido` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`cod_critica`) REFERENCES `critica` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD CONSTRAINT `notificacion_ibfk_1` FOREIGN KEY (`cod_critica`) REFERENCES `critica` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notificacion_ibfk_2` FOREIGN KEY (`cod_seguido`) REFERENCES `usuario` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notificacion_ibfk_3` FOREIGN KEY (`cod_seguidor`) REFERENCES `usuario` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reparto`
--
ALTER TABLE `reparto`
  ADD CONSTRAINT `reparto_ibfk_1` FOREIGN KEY (`cod_actor`) REFERENCES `actor` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reparto_ibfk_2` FOREIGN KEY (`cod_contenido`) REFERENCES `contenido` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `semanal`
--
ALTER TABLE `semanal`
  ADD CONSTRAINT `semanal_ibfk_1` FOREIGN KEY (`cod_contenido`) REFERENCES `contenido` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `serie`
--
ALTER TABLE `serie`
  ADD CONSTRAINT `serie_ibfk_1` FOREIGN KEY (`contenido`) REFERENCES `contenido` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `siguiendo`
--
ALTER TABLE `siguiendo`
  ADD CONSTRAINT `siguiendo_ibfk_1` FOREIGN KEY (`cod_seguido`) REFERENCES `usuario` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `valora`
--
ALTER TABLE `valora`
  ADD CONSTRAINT `valora_ibfk_1` FOREIGN KEY (`cod_contenido`) REFERENCES `contenido` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `valora_ibfk_2` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
