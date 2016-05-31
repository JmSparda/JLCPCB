-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-05-2016 a las 06:25:20
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.5.34

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
CREATE DEFINER=`root`@`localhost` PROCEDURE `autenticar` (IN `_usu_usuario` VARCHAR(20), `_usu_password` VARCHAR(100))  BEGIN
  SELECT * FROM admusu WHERE usu_usuario = _usu_usuario AND usu_password = _usu_password;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consultaDetalleUsuario` (IN `_usu_usuario` VARCHAR(100))  BEGIN
select u.usu_id, u.per_id, u.usu_usuario, u.usu_password, u.usu_estado, u.usu_last_session, p.per_foto from admusu u
inner join persona p ON p.per_id = u.per_id
where u.usu_usuario = _usu_usuario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consultaDocumento` ()  BEGIN
SELECT * FROM tipodocumento
WHERE estado = 'Activo';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consultaDocumentoTrabajador` (IN `_documento` INT)  BEGIN
SELECT persona.per_numerodocumento,
concat(persona.per_nombre," ", persona.per_apellidop," ",persona.per_apellidom) as nombre,
admrol.rol_descripcion, admsuc.suc_nombre, admtra.tra_iniciocontrato, persona.per_foto
FROM admtra
INNER JOIN persona ON persona.per_id = admtra.per_id
INNER JOIN admrol ON admrol.rol_id = admtra.rol_id
INNER JOIN admsuc ON admsuc.suc_id = admtra.suc_id
WHERE persona.per_numerodocumento = _documento;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consultaEnlace` ()  BEGIN
  SELECT b.bli_id, m.modu_nombre, b.bli_enlace, b.bli_descripcion, b.fecha_modifi 
  FROM blienlaces b
  INNER JOIN admmodu m ON m.modu_id = b.modu_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consultaEnlaceModulo` (IN `_modu_id` INT)  BEGIN
select * from blienlaces b
WHERE modu_id = _modu_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consultaModulo` ()  BEGIN
SELECT * FROM admmodu;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consultaModuloActivo` ()  BEGIN
SELECT * FROM admmodu
WHERE estado = "A";
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consultaModuloPerfilMenu` (IN `_prof_id` INT)  BEGIN
SELECT modu_prof.id_moduprof, admprof.prof_nombre, admmodu.modu_nombre, admmodu.modu_id
FROM modu_prof
INNER JOIN admmodu ON admmodu.modu_id = modu_prof.modu_id
INNER JOIN admprof ON admprof.prof_id = modu_prof.prof_id
WHERE admprof.prof_id = _prof_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consultaPerfil` ()  BEGIN
SELECT * FROM admprof;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consultaPerfilActivo` ()  BEGIN
SELECT * FROM admprof
WHERE estado = "A" ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consultaPersona` ()  BEGIN
SELECT * FROM persona;
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `consultaTrabajador2` ()  BEGIN
SELECT persona.per_id,
concat(persona.per_nombre," ", persona.per_apellidop," ",persona.per_apellidom) as nombre,
admtra.tra_puesto , admsuc.suc_nombre, admtra.tra_iniciocontrato, persona.per_foto
FROM admtra
INNER JOIN persona ON persona.per_id = admtra.per_id
INNER JOIN admsuc ON admsuc.suc_id = admtra.suc_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consultaUsuario` ()  BEGIN
  SELECT admusu.usu_id, 
  concat(persona.per_nombre," ",
  persona.per_apellidop," ",
  persona.per_apellidom) as nombre,
  admusu.usu_usuario, 
  admusu.usu_last_session, 
  admusu.usu_estado 
  FROM admusu
  INNER JOIN persona ON persona.per_id = admusu.per_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consultaUsuarioActivo` ()  BEGIN
  SELECT *
  FROM admusu
  WHERE usu_estado = "A";
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `crearEnlace` (IN `_modu_id` INT, `_bli_enlace` VARCHAR(100), `_bli_descripcion` VARCHAR(100), `_fecha_modifi` VARCHAR(100))  BEGIN
INSERT INTO blienlaces(modu_id, bli_enlace, bli_descripcion, fecha_modifi) 
VALUES (_modu_id, _bli_enlace, _bli_descripcion, _fecha_modifi);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `crearModulo` (IN `_modu_cod` VARCHAR(15), `_modu_nombre` VARCHAR(60), `_modu_desc` VARCHAR(200), `_fecha_modifi` VARCHAR(30), `_estado` VARCHAR(15))  BEGIN
INSERT INTO admmodu(modu_cod,modu_nombre,modu_desc,fecha_modifi,estado)
VALUES (_modu_cod, _modu_nombre, _modu_desc, _fecha_modifi, _estado);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `crearPerfil` (IN `_prof_codigo` VARCHAR(15), `_prof_nombre` VARCHAR(100), `_prof_desc` VARCHAR(200), `_fecha_modifi` VARCHAR(100), `_estado` VARCHAR(15))  BEGIN
INSERT INTO admprof(prof_codigo,prof_nombre,prof_desc,fecha_modifi,estado)
VALUES (_prof_codigo, _prof_nombre, _prof_desc, _fecha_modifi, _estado);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `crearProfModu` (IN `_prof_id` INT, `_modu_id` INT)  BEGIN
INSERT INTO modu_prof(prof_id, modu_id)
VALUES (_prof_id,_modu_id);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `crearTrabajador` (IN `_per_id` INT, `_per_nombre` VARCHAR(30), `_per_apellidop` VARCHAR(20), `_per_apellidom` VARCHAR(20), `_per_sexo` VARCHAR(10), `_per_fechanacimiento` VARCHAR(60), `_per_documentoID` INT, `_per_numerodocumento` INT, `_per_direccion` VARCHAR(100), `_per_telefono` VARCHAR(20), `_per_email` VARCHAR(100), `_per_foto` VARCHAR(100), `_tra_puesto` VARCHAR(100), `_suc_id` INT, `_tra_iniciocontrato` VARCHAR(60), `_user_nombre` VARCHAR(30), `_fecha_modifi` VARCHAR(60))  BEGIN
INSERT INTO persona(per_id, per_nombre, per_apellidop, per_apellidom, per_sexo, per_fechanacimiento, per_documentoID, per_numerodocumento, per_direccion, per_telefono, per_email, per_foto) 
VALUES (_per_id, _per_nombre, _per_apellidop, _per_apellidom, _per_sexo, _per_fechanacimiento, _per_documentoID, _per_numerodocumento, _per_direccion, _per_telefono, _per_email, _per_foto);
INSERT INTO admtra(per_id, tra_puesto, suc_id, tra_iniciocontrato, fecha_modifi) 
VALUES(_per_id, _tra_puesto, _suc_id, _tra_iniciocontrato, _fecha_modifi);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `crearUsuario` (IN `_per_id` INT, `_usu_usuario` VARCHAR(20), `_usu_password` VARCHAR(100), `_usu_estado` VARCHAR(15), `_usu_last_session` VARCHAR(60))  BEGIN
INSERT INTO admusu(per_id, usu_usuario, usu_password, usu_estado, usu_last_session) 
VALUES (_per_id, _usu_usuario, _usu_password, _usu_estado, _usu_last_session);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `crearUsuProf` (IN `_usu_id` INT, `_prof_id` INT)  BEGIN
INSERT INTO usu_prof(usu_id, prof_id)
VALUES (_usu_id,_prof_id);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarEnlace` (IN `_bli_id` INT)  BEGIN
  DELETE FROM blienlaces WHERE bli_id =_bli_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarModulo` (IN `_modu_id` INT)  BEGIN 
  DELETE FROM admmodu WHERE modu_id = _modu_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarPerfil` (IN `_prof_id` INT)  BEGIN
  DELETE FROM admprof WHERE prof_id =_prof_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarTrabajador` (IN `_per_id` INT)  BEGIN 
  DELETE FROM persona WHERE per_id = _per_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarUsuario` (IN `_usu_id` INT)  BEGIN
  DELETE FROM admusu WHERE usu_id =_usu_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateEnlace` (IN `_bli_id` INT, `_modu_id` INT, `_bli_enlace` VARCHAR(100), `_bli_descripcion` VARCHAR(100))  BEGIN
  UPDATE blienlaces
  SET modu_id = _modu_id,
      bli_enlace = _bli_enlace,
      bli_descripcion = _bli_descripcion
  WHERE bli_id = _bli_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateModulo` (IN `_modu_id` INT, `_modu_cod` VARCHAR(15), `_modu_nombre` VARCHAR(60), `_modu_desc` VARCHAR(200), `_fecha_modifi` VARCHAR(30), `_estado` VARCHAR(15))  BEGIN
  UPDATE admmodu 
  SET modu_cod = _modu_cod,
      modu_nombre = _modu_nombre,
      modu_desc = _modu_desc,
      fecha_modifi = _fecha_modifi,
      estado = _estado
  WHERE modu_id = _modu_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updatePerfil` (IN `_prof_id` INT, `_prof_codigo` VARCHAR(20), `_prof_nombre` VARCHAR(100), `_prof_desc` VARCHAR(200), `_fecha_modifi` VARCHAR(100), `_estado` VARCHAR(15))  BEGIN
  UPDATE admprof 
  SET prof_codigo = _prof_codigo,
      prof_nombre = _prof_nombre,
      prof_desc = _prof_desc,
      fecha_modifi = _fecha_modifi,
      estado = _estado
  WHERE prof_id = _prof_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateUsuario` (IN `_usu_id` INT, `_usu_usuario` VARCHAR(20), `_usu_password` VARCHAR(100), `_usu_estado` VARCHAR(15))  BEGIN
  UPDATE admusu 
  SET usu_usuario = _usu_usuario,
      usu_password = _usu_password,
      usu_estado = _usu_estado
  WHERE usu_id = _usu_id;
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
-- Estructura de tabla para la tabla `admmodu`
--

CREATE TABLE `admmodu` (
  `modu_id` int(11) NOT NULL,
  `modu_cod` varchar(15) NOT NULL,
  `modu_nombre` varchar(60) NOT NULL,
  `modu_desc` varchar(200) NOT NULL,
  `fecha_modifi` varchar(30) NOT NULL,
  `estado` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `admmodu`
--

INSERT INTO `admmodu` (`modu_id`, `modu_cod`, `modu_nombre`, `modu_desc`, `fecha_modifi`, `estado`) VALUES
(1, 'MOD001', 'PERFILES', 'Administrar PERFILES', 'fecha', 'A'),
(2, 'MOD002', 'MODULOS', 'Administrar MODULOS', '2016-05-23 01:35:51', 'A'),
(4, 'MOD003', 'ROLES', 'Administrar ROLES', '2016-05-30 09:11:07', 'A'),
(5, 'MOD004', 'ENLACES', 'Administrar ENLACES', '2016-05-30 09:13:01', 'A'),
(6, 'MOD005', 'USUARIOS', 'Administrar USUARIOS', '2016-05-30 10:11:01', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admprof`
--

CREATE TABLE `admprof` (
  `prof_id` int(11) NOT NULL,
  `prof_codigo` varchar(20) NOT NULL,
  `prof_nombre` varchar(100) NOT NULL,
  `prof_desc` varchar(200) NOT NULL,
  `fecha_modifi` varchar(100) NOT NULL,
  `estado` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `admprof`
--

INSERT INTO `admprof` (`prof_id`, `prof_codigo`, `prof_nombre`, `prof_desc`, `fecha_modifi`, `estado`) VALUES
(1, 'PERF001', 'ADMINISTRADOR', 'USUARIO ADMINISTRADOR', '2016-05-23 01:36:29', 'A'),
(2, 'PERF002', 'CLIENTE', 'USUARIO CLIENTE', '2016-05-23 01:36:35', 'A'),
(3, 'PERF003', 'MOZO', 'USUARIO MOZO', '2016-05-25 01:15:33', 'D');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admrol`
--

CREATE TABLE `admrol` (
  `rol_id` int(11) NOT NULL,
  `rol_codigo` varchar(15) NOT NULL,
  `rol_nombre` varchar(30) NOT NULL,
  `rol_descripcion` varchar(200) NOT NULL,
  `fecha_modifi` varchar(30) NOT NULL,
  `estado` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(2, 1, 'Sabor Trujillano La Noria', 'La Noria', '968785432', '2016-05-06 15:53:35', 'ADMIN', '2016-05-06 15:53:35'),
(3, 1, 'Sabor Trujillano Esperanza', 'La Esperanza', '94894949', '2016-05-06 15:53:35', 'ADMIN', '2016-05-06 15:53:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admtra`
--

CREATE TABLE `admtra` (
  `tra_id` int(11) NOT NULL,
  `per_id` int(11) NOT NULL,
  `tra_puesto` varchar(60) NOT NULL,
  `suc_id` int(11) NOT NULL,
  `tra_iniciocontrato` varchar(60) NOT NULL,
  `fecha_modifi` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `admtra`
--

INSERT INTO `admtra` (`tra_id`, `per_id`, `tra_puesto`, `suc_id`, `tra_iniciocontrato`, `fecha_modifi`) VALUES
(9, 1, 'ADMINISTRADOR', 1, '2016-01-01', '2016-05-18 09:10:34'),
(10, 2, 'ADMINISTRADOR', 1, '2016-05-23', '2016-05-18 09:11:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admusu`
--

CREATE TABLE `admusu` (
  `usu_id` int(11) NOT NULL,
  `per_id` int(11) NOT NULL,
  `usu_usuario` varchar(20) NOT NULL,
  `usu_password` varchar(100) NOT NULL,
  `usu_estado` varchar(15) NOT NULL,
  `usu_last_session` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `admusu`
--

INSERT INTO `admusu` (`usu_id`, `per_id`, `usu_usuario`, `usu_password`, `usu_estado`, `usu_last_session`) VALUES
(1, 1, 'jmsparda', '6e20fe9256139a8ac3b1526685ab81e8a9367f42', 'A', '2016-05-23 06:25:45'),
(2, 2, 'pparker', '6e20fe9256139a8ac3b1526685ab81e8a9367f42', 'A', '2016-05-24 09:26:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blienlaces`
--

CREATE TABLE `blienlaces` (
  `bli_id` int(11) NOT NULL,
  `modu_id` int(11) NOT NULL,
  `bli_enlace` varchar(100) NOT NULL,
  `bli_descripcion` varchar(100) NOT NULL,
  `fecha_modifi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `blienlaces`
--

INSERT INTO `blienlaces` (`bli_id`, `modu_id`, `bli_enlace`, `bli_descripcion`, `fecha_modifi`) VALUES
(1, 1, 'tabla-perfiles.jsp', '2016-05-30 12:26:17', '2016-05-30 12:26:17'),
(4, 2, 'tabla-modulos.jsp', '2016-05-30 12:52:01', '2016-05-30 12:52:01'),
(5, 4, 'tabla-roles.jsp', '2016-05-30 09:12:11', '2016-05-30 09:12:11'),
(6, 5, 'tabla-blienlace.jsp', '2016-05-30 09:13:41', '2016-05-30 09:13:41'),
(7, 6, 'tabla-usuarios.jsp', '2016-05-30 10:11:41', '2016-05-30 10:11:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modu_prof`
--

CREATE TABLE `modu_prof` (
  `id_moduprof` int(11) NOT NULL,
  `prof_id` int(11) NOT NULL,
  `modu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `modu_prof`
--

INSERT INTO `modu_prof` (`id_moduprof`, `prof_id`, `modu_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 4),
(4, 1, 5),
(5, 1, 6);

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
(1, 'JUAN MANUEL', 'CABANILLAS', 'LOPEZ', 'MASCULINO', '1991-07-21', 1, 71484498, 'MZ I LOTE 28 - LA ARBOLEDA', '957803984', 'jmlopez2332@gmail.com', 'assets/img/trabajadores/JUANMANUELCABANILLASLOPEZ.jpg'),
(2, 'PETER BENJAMIN', 'PARKER', 'REILLY', 'Masculino', '1991-07-21', 1, 21312323, 'QUEENS', '12345656', 'peterparker@gmail.com', 'assets/img/trabajadores/PETERBENJAMINPARKER.jpg');

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
(3, 'VISA', 'Activo'),
(4, 'DNI EXTRANJERO', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usu_prof`
--

CREATE TABLE `usu_prof` (
  `usuprof_id` int(11) NOT NULL,
  `usu_id` int(11) NOT NULL,
  `prof_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usu_prof`
--

INSERT INTO `usu_prof` (`usuprof_id`, `usu_id`, `prof_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usu_rol`
--

CREATE TABLE `usu_rol` (
  `usurol_ud` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL,
  `usu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admemp`
--
ALTER TABLE `admemp`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indices de la tabla `admmodu`
--
ALTER TABLE `admmodu`
  ADD PRIMARY KEY (`modu_id`);

--
-- Indices de la tabla `admprof`
--
ALTER TABLE `admprof`
  ADD PRIMARY KEY (`prof_id`);

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
  ADD UNIQUE KEY `per_id` (`per_id`),
  ADD KEY `fk_traper` (`per_id`),
  ADD KEY `fk_trarol` (`tra_puesto`),
  ADD KEY `fk_trasuc` (`suc_id`);

--
-- Indices de la tabla `admusu`
--
ALTER TABLE `admusu`
  ADD PRIMARY KEY (`usu_id`),
  ADD KEY `fk_trabajador_usuario` (`per_id`);

--
-- Indices de la tabla `blienlaces`
--
ALTER TABLE `blienlaces`
  ADD PRIMARY KEY (`bli_id`),
  ADD UNIQUE KEY `fk_modu_enlace` (`modu_id`);

--
-- Indices de la tabla `modu_prof`
--
ALTER TABLE `modu_prof`
  ADD PRIMARY KEY (`id_moduprof`),
  ADD KEY `fk_prof_id` (`prof_id`) USING BTREE,
  ADD KEY `fk_modu_id` (`modu_id`) USING BTREE;

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
-- Indices de la tabla `usu_prof`
--
ALTER TABLE `usu_prof`
  ADD PRIMARY KEY (`usuprof_id`),
  ADD KEY `fk_usu_id` (`usu_id`) USING BTREE,
  ADD KEY `fk_prof` (`prof_id`) USING BTREE;

--
-- Indices de la tabla `usu_rol`
--
ALTER TABLE `usu_rol`
  ADD PRIMARY KEY (`usurol_ud`),
  ADD UNIQUE KEY `fk_rol_id` (`rol_id`),
  ADD UNIQUE KEY `fk_usu_id` (`usu_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admemp`
--
ALTER TABLE `admemp`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `admmodu`
--
ALTER TABLE `admmodu`
  MODIFY `modu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `admprof`
--
ALTER TABLE `admprof`
  MODIFY `prof_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `admrol`
--
ALTER TABLE `admrol`
  MODIFY `rol_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `admsuc`
--
ALTER TABLE `admsuc`
  MODIFY `suc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `admtra`
--
ALTER TABLE `admtra`
  MODIFY `tra_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `admusu`
--
ALTER TABLE `admusu`
  MODIFY `usu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `blienlaces`
--
ALTER TABLE `blienlaces`
  MODIFY `bli_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `modu_prof`
--
ALTER TABLE `modu_prof`
  MODIFY `id_moduprof` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `per_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tipodocumento`
--
ALTER TABLE `tipodocumento`
  MODIFY `per_documentoid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `usu_prof`
--
ALTER TABLE `usu_prof`
  MODIFY `usuprof_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `usu_rol`
--
ALTER TABLE `usu_rol`
  MODIFY `usurol_ud` int(11) NOT NULL AUTO_INCREMENT;
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
  ADD CONSTRAINT `fk_traper` FOREIGN KEY (`per_id`) REFERENCES `persona` (`per_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_trasuc` FOREIGN KEY (`suc_id`) REFERENCES `admsuc` (`suc_id`);

--
-- Filtros para la tabla `admusu`
--
ALTER TABLE `admusu`
  ADD CONSTRAINT `admusu_ibfk_1` FOREIGN KEY (`per_id`) REFERENCES `persona` (`per_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `blienlaces`
--
ALTER TABLE `blienlaces`
  ADD CONSTRAINT `blienlaces_ibfk_1` FOREIGN KEY (`modu_id`) REFERENCES `admmodu` (`modu_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `modu_prof`
--
ALTER TABLE `modu_prof`
  ADD CONSTRAINT `modu_prof_ibfk_1` FOREIGN KEY (`prof_id`) REFERENCES `admprof` (`prof_id`),
  ADD CONSTRAINT `modu_prof_ibfk_2` FOREIGN KEY (`modu_id`) REFERENCES `admmodu` (`modu_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fk_perdouc` FOREIGN KEY (`per_documentoID`) REFERENCES `tipodocumento` (`per_documentoid`);

--
-- Filtros para la tabla `usu_prof`
--
ALTER TABLE `usu_prof`
  ADD CONSTRAINT `usu_prof_ibfk_1` FOREIGN KEY (`usu_id`) REFERENCES `admusu` (`usu_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usu_prof_ibfk_2` FOREIGN KEY (`prof_id`) REFERENCES `admprof` (`prof_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usu_rol`
--
ALTER TABLE `usu_rol`
  ADD CONSTRAINT `usu_rol_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `admrol` (`rol_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usu_rol_ibfk_2` FOREIGN KEY (`usu_id`) REFERENCES `admusu` (`usu_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
