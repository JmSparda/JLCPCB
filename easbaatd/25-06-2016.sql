-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-05-2016 a las 03:50:58
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 7.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `restweb`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultaDocumento` ()  BEGIN
SELECT * FROM tipodocumento
WHERE estado = 'Activo';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consultaRol` ()  BEGIN
SELECT * FROM admrol
WHERE rol_estado = 'Activo';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consultaSucursal` ()  BEGIN
SELECT * FROM admsuc;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consultaTrabajador` ()  BEGIN
SELECT * FROM persona, admtra
WHERE admtra.per_id = persona.per_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `crearTrabajador` (IN `_per_id` INT, `_per_nombre` VARCHAR(30), `_per_apellidop` VARCHAR(20), `_per_apellidom` VARCHAR(20), `_per_sexo` VARCHAR(10), `_per_fechanacimiento` DATE, `_per_documentoID` INT, `_per_numerodocumento` INT, `_per_direccion` VARCHAR(100), `_per_telefono` VARCHAR(20), `_per_email` VARCHAR(100), `_per_foto` VARCHAR(100), `_rol_id` INT, `_suc_id` INT, `_tra_iniciocontrato` DATE, `_user_nombre` VARCHAR(30), `_fecha_modifi` DATETIME)  BEGIN
INSERT INTO persona(per_id, per_nombre, per_apellidop, per_apellidom, per_sexo, per_fechanacimiento, per_documentoID, per_numerodocumento, per_direccion, per_telefono, per_email, per_foto) 
VALUES (_per_id, _per_nombre, _per_apellidop, _per_apellidom, _per_sexo, _per_fechanacimiento, _per_documentoID, _per_numerodocumento, _per_direccion, _per_telefono, _per_email, _per_foto);
INSERT INTO admtra(per_id, rol_id, suc_id, tra_iniciocontrato, user_nombre, fecha_modifi) 
VALUES(_per_id, _rol_id, _suc_id, _tra_iniciocontrato, _user_nombre, fecha_modifi);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admemp`
--

CREATE TABLE `admemp` (
  `emp_id` int(11) NOT NULL,
  `emp_nombre` varchar(30) NOT NULL,
  `emp_ruc` varchar(11) NOT NULL,
  `emp_direccion` varchar(30) NOT NULL,
  `emp_telefono` varchar(20) NOT NULL,
  `emp_ubigeo` varchar(30) NOT NULL,
  `emp_fechareg` datetime NOT NULL,
  `emp_estado` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `admemp`
--

INSERT INTO `admemp` (`emp_id`, `emp_nombre`, `emp_ruc`, `emp_direccion`, `emp_telefono`, `emp_ubigeo`, `emp_fechareg`, `emp_estado`) VALUES
(1, 'SaborTrujillano', '12345678901', 'Mz I lote 28 La Arboleda', '957803984', 'La Libertad', '2016-05-06 15:51:29', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admrol`
--

CREATE TABLE `admrol` (
  `rol_id` int(11) NOT NULL,
  `rol_descripcion` varchar(40) NOT NULL,
  `rol_estado` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `admrol`
--

INSERT INTO `admrol` (`rol_id`, `rol_descripcion`, `rol_estado`) VALUES
(1, 'ADMINISTRADOR', 'Activo'),
(2, 'CAJERO', 'Activo'),
(3, 'MESERO', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admsuc`
--

CREATE TABLE `admsuc` (
  `suc_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `suc_nombre` varchar(30) NOT NULL,
  `suc_direccion` varchar(30) NOT NULL,
  `suc_telefono` varchar(20) NOT NULL,
  `suc_fechareg` varchar(30) NOT NULL,
  `user_nombre` varchar(30) NOT NULL,
  `fecha_modifi` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `admsuc`
--

INSERT INTO `admsuc` (`suc_id`, `emp_id`, `suc_nombre`, `suc_direccion`, `suc_telefono`, `suc_fechareg`, `user_nombre`, `fecha_modifi`) VALUES
(1, 1, 'Sabor Trujillano La Arboleda', 'La Arboleda', '968785432', '2016-05-06 15:53:35', 'ADMIN', '2016-05-06 15:53:35'),
(2, 1, 'Sabor Trujillano La Noria', 'La Noria', '968785432', '2016-05-06 15:53:35', 'ADMIN', '2016-05-06 15:53:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admtra`
--

CREATE TABLE `admtra` (
  `tra_id` int(11) NOT NULL,
  `per_id` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL,
  `suc_id` int(11) NOT NULL,
  `tra_iniciocontrato` varchar(60) NOT NULL,
  `user_nombre` varchar(30) NOT NULL,
  `fecha_modifi` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `admtra`
--

INSERT INTO `admtra` (`tra_id`, `per_id`, `rol_id`, `suc_id`, `tra_iniciocontrato`, `user_nombre`, `fecha_modifi`) VALUES
(1, 1, 1, 1, '2016-05-07', 'ADMIN', '2016-05-07 00:00:00'),
(2, 2, 1, 2, '2015-05-07', 'ADMIN', '2016-05-07 00:00:00'),
(3, 3, 1, 1, '2016-05-16', 'ADMIN', ''),
(4, 4, 3, 2, '2016-05-16', 'ADMIN', ''),
(5, 5, 2, 1, '2016-05-16', 'ADMIN', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admusu`
--

CREATE TABLE `admusu` (
  `usu_id` int(11) NOT NULL,
  `tra_id` int(11) NOT NULL,
  `usu_usuario` varchar(20) NOT NULL,
  `usu_password` varchar(20) NOT NULL,
  `usu_estado` varchar(15) NOT NULL,
  `fecha_modifi` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `per_id` int(11) NOT NULL,
  `per_nombre` varchar(30) NOT NULL,
  `per_apellidop` varchar(20) NOT NULL,
  `per_apellidom` varchar(20) NOT NULL,
  `per_sexo` varchar(10) NOT NULL,
  `per_fechanacimiento` varchar(60) NOT NULL,
  `per_documentoID` int(11) NOT NULL,
  `per_numerodocumento` int(15) NOT NULL,
  `per_direccion` varchar(100) NOT NULL,
  `per_telefono` varchar(20) NOT NULL,
  `per_email` varchar(100) NOT NULL,
  `per_foto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`per_id`, `per_nombre`, `per_apellidop`, `per_apellidom`, `per_sexo`, `per_fechanacimiento`, `per_documentoID`, `per_numerodocumento`, `per_direccion`, `per_telefono`, `per_email`, `per_foto`) VALUES
(1, 'JUAN MANUEL', 'CABANILLAS', 'LOPEZ', 'MASCULINO', '1991-07-21', 1, 71484498, 'MZ I LOTE 28 LA ARBOLEDA - 4TO PISO', '957803984', 'jmlopez2332@gmail.com', 'img/personas/CABANILLAS_LOPEZ_JUAN_MANUEL.jpg'),
(2, 'JOSE GUILLERMO', 'CABANILLAS', 'LOPEZ', 'MASCULINO', '1991-08-30', 1, 12345678, 'JR DESAMPARADOs #136', '44322459', 'jghcl@hotmal.com', 'img/personas/CABANILLAS_LOPEZ_JOSE_GUILLERMO.jpg'),
(3, 'MARIA DE FATIMA', 'ALVA', 'VALERA', 'Femenino', '1991-01-01', 1, 72112843, 'PEDRO MUNIZ SIN NUMERO LOL', '7777766', 'fatitav@gmail.com', 'img/trabajadores/FATIMA ALVA VALERA.jpg'),
(4, 'CESAR ', 'PANTOJA', 'ROSALES', 'Masculino', '1991-01-01', 2, 213712382, 'LA NORIA', '288128', 'cesarpantoja@gmail.com', 'img/trabajadores/CESAR PANTOJA ROSALES.jpg'),
(5, 'CLAUDIA', 'BORJA', 'RAMOS', 'Femenino', '1991-01-01', 1, 72112843, 'LA NORIA', '7777766', 'claudiaborja@gmail.com', 'img/trabajadores/CLAUDIA BORJA RAMOS.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodocumento`
--

CREATE TABLE `tipodocumento` (
  `per_documentoid` int(11) NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `estado` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipodocumento`
--

INSERT INTO `tipodocumento` (`per_documentoid`, `descripcion`, `estado`) VALUES
(1, 'DNI', 'Activo'),
(2, 'PASAPORTE', 'Activo'),
(3, 'VISA', 'Activo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admemp`
--
ALTER TABLE `admemp`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indices de la tabla `admrol`
--
ALTER TABLE `admrol`
  ADD PRIMARY KEY (`rol_id`);

--
-- Indices de la tabla `admsuc`
--
ALTER TABLE `admsuc`
  ADD PRIMARY KEY (`suc_id`),
  ADD KEY `fk_sucemp` (`emp_id`);

--
-- Indices de la tabla `admtra`
--
ALTER TABLE `admtra`
  ADD PRIMARY KEY (`tra_id`),
  ADD KEY `fk_traper` (`per_id`),
  ADD KEY `fk_trarol` (`rol_id`),
  ADD KEY `fk_trasuc` (`suc_id`);

--
-- Indices de la tabla `admusu`
--
ALTER TABLE `admusu`
  ADD PRIMARY KEY (`usu_id`),
  ADD KEY `fk_trabajador_usuario` (`tra_id`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`per_id`),
  ADD KEY `fk_tipodocumento` (`per_documentoID`);

--
-- Indices de la tabla `tipodocumento`
--
ALTER TABLE `tipodocumento`
  ADD PRIMARY KEY (`per_documentoid`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admemp`
--
ALTER TABLE `admemp`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `admrol`
--
ALTER TABLE `admrol`
  MODIFY `rol_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `admsuc`
--
ALTER TABLE `admsuc`
  MODIFY `suc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `admtra`
--
ALTER TABLE `admtra`
  MODIFY `tra_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `admusu`
--
ALTER TABLE `admusu`
  MODIFY `usu_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `per_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `tipodocumento`
--
ALTER TABLE `tipodocumento`
  MODIFY `per_documentoid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `admsuc`
--
ALTER TABLE `admsuc`
  ADD CONSTRAINT `fk_sucemp` FOREIGN KEY (`emp_id`) REFERENCES `admemp` (`emp_id`);

--
-- Filtros para la tabla `admtra`
--
ALTER TABLE `admtra`
  ADD CONSTRAINT `fk_traper` FOREIGN KEY (`per_id`) REFERENCES `persona` (`per_id`),
  ADD CONSTRAINT `fk_trarol` FOREIGN KEY (`rol_id`) REFERENCES `admrol` (`rol_id`),
  ADD CONSTRAINT `fk_trasuc` FOREIGN KEY (`suc_id`) REFERENCES `admsuc` (`suc_id`);

--
-- Filtros para la tabla `admusu`
--
ALTER TABLE `admusu`
  ADD CONSTRAINT `fk_trabajador_usuario` FOREIGN KEY (`tra_id`) REFERENCES `admtra` (`tra_id`);

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fk_tipodocumento` FOREIGN KEY (`per_documentoID`) REFERENCES `tipodocumento` (`per_documentoid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
