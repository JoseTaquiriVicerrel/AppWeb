-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-09-2017 a las 04:00:51
-- Versión del servidor: 10.1.26-MariaDB
-- Versión de PHP: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `editor`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarDocumeneto` (`_bandera` INT, `_id` INT, `_contenido` TEXT, `_estado` TINYINT)  BEGIN
	if _bandera = 1 then
	insert into documento (contenido, estado) 
	values (_contenido, _estado) ;
	
	select 'si' as rpt;
	end if;
	if _bandera = 2 then
		UPDATE 
		  documento 
		SET
		  contenido = _contenido,
		  estado = _estado
		WHERE id = _id ;
		
		SELECT 'si' AS rpt;
	end if;
    END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento`
--

CREATE TABLE `documento` (
  `id` int(11) NOT NULL,
  `contenido` text COLLATE utf8_spanish_ci NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `documento`
--

INSERT INTO `documento` (`id`, `contenido`, `estado`) VALUES
(1, '<p>(DNIPERSONA) This is my textarea to be replaced with CKEditor.</p>\r\n', 1),
(2, '<p><em>This is my textarea to be replaced with CKEditor</em>.&nbsp;(DNIPERSONA) (NOMPERSONA)&nbsp;</p>\r\n\r\n<p>When you are done, open your test page in the browser.</p>\r\n\r\n<p><strong>Congratulations! You have just installed and used CKEditor on your own page in virtually no time!</strong></p>\r\n', 1),
(3, '<h1 style=\"text-align:center\">CERTIFICADO DE PRUEBA</h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:90px\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align:center\">(FOTPERSONA)</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Para la persona de prueba :</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:center\">(NOMPERSONA)</p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p>Con de DNI : (DNIPERSONA)</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', 1),
(4, '<h1 style=\"text-align:center\">CERTIFICADO DE PRUEBA</h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:90px\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align:center\">(FOTPERSONA)</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Para la persona de prueba :</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:center\">(NOMPERSONA)</p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p>Con de DNI : (DNIPERSONA)</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', 1),
(5, '&lt;h1 style=&quot;text-align:center&quot;&gt;CERTIFICADO DE PRUEBA&lt;/h1&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;1&quot; cellspacing=&quot;1&quot; style=&quot;width:90px&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;(FOTPERSONA)&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;Para la persona de prueba :&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;(NOMPERSONA)&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;Con de DNI : (DNIPERSONA)&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;registro de prueba 13 de septiembre del 2017&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id` int(11) NOT NULL,
  `nombre` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  `dni` varchar(8) COLLATE utf8_spanish_ci NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `nombre`, `dni`, `estado`) VALUES
(1, 'Juan Lopez Castillo', '22224444', 1),
(2, 'Carlos Bardales Lopez', '34341111', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `documento`
--
ALTER TABLE `documento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `documento`
--
ALTER TABLE `documento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
