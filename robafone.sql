-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-01-2024 a las 20:28:28
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `robafone`
--
CREATE DATABASE IF NOT EXISTS `robafone` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `robafone`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(32) NOT NULL DEFAULT '',
  `apellidos` varchar(32) NOT NULL DEFAULT '',
  `fechanacimiento` date NOT NULL,
  `password` varchar(255) NOT NULL,
  `user` varchar(16) NOT NULL,
  `direccion` varchar(128) NOT NULL,
  `DNI` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `apellidos`, `fechanacimiento`, `password`, `user`, `direccion`, `DNI`) VALUES
(1, 'Pablo', 'Valdes', '1994-01-21', 'fouewnfpi3qjfdpoq', 'pablo', 'pablo@alum.uca.es', '12345678A'),
(2, 'Miguel', 'Navarro', '2001-01-22', 'vrwg5hj6jq64j45', 'miguel', 'miguel@alum.uca.es', '87654321B'),
(3, 'Javier', 'Moscoso', '1999-01-21', 'fouewgfpi3qjfdpoq', 'javi', 'javi@alum.uca.es', '12341234C');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contrato`
--

CREATE TABLE `contrato` (
  `id` bigint(20) NOT NULL,
  `cliente_id` bigint(20) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `fecha_permanencia` date NOT NULL,
  `fecha_fin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contrato`
--

INSERT INTO `contrato` (`id`, `cliente_id`, `fecha_inicio`, `fecha_vencimiento`, `fecha_permanencia`, `fecha_fin`) VALUES
(2, 1, '2024-01-01', '2024-01-10', '2024-01-05', '2024-01-24'),
(3, 2, '2024-01-01', '2024-01-11', '2024-01-06', '0000-00-00'),
(4, 3, '2024-01-11', '2024-01-17', '2024-01-11', '2024-01-31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(32) NOT NULL DEFAULT '',
  `apellidos` varchar(32) NOT NULL DEFAULT '',
  `fechanacimiento` date NOT NULL,
  `password` varchar(255) NOT NULL,
  `user` varchar(16) NOT NULL,
  `tipo_usuario` enum('ventas','atencion cliente','finanzas') DEFAULT NULL,
  `DNI` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id`, `nombre`, `apellidos`, `fechanacimiento`, `password`, `user`, `tipo_usuario`, `DNI`) VALUES
(1, 'tomeu', 'pctr', '0666-01-21', 'reg42gqgewdvbeav', 'tomeu', 'ventas', '12345678A'),
(2, 'de la huerta', 'ednl', '0666-01-22', 'reg42gbveewdvbeav', 'dlh', 'atencion cliente', '12345678A'),
(3, 'josefi', 'poo', '0666-01-23', 'vwrgwvewdevbrtr', 'josefi', 'finanzas', '12345678A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_reclamacion`
--

CREATE TABLE `empleado_reclamacion` (
  `id_empleado` bigint(20) NOT NULL,
  `id_reclamacion` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id` bigint(20) NOT NULL,
  `contrato_id` bigint(20) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id`, `contrato_id`, `precio`, `fecha`) VALUES
(1, 2, 234, '2024-01-03'),
(2, 3, 324, '2024-01-10'),
(3, 4, 120, '2024-01-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opcion`
--

CREATE TABLE `opcion` (
  `id` bigint(20) NOT NULL,
  `cliente_id` bigint(20) NOT NULL,
  `tipo` enum('roaming','compartir datos','numero bloqueado') NOT NULL,
  `valor` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `opcion`
--

INSERT INTO `opcion` (`id`, `cliente_id`, `tipo`, `valor`) VALUES
(1, 2, 'roaming', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reclamacion`
--

CREATE TABLE `reclamacion` (
  `id` bigint(20) NOT NULL,
  `cliente_id` bigint(20) NOT NULL,
  `asunto` varchar(128) NOT NULL,
  `cuerpo` varchar(1024) NOT NULL,
  `estado` enum('iniciada','en revision','finalizada') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reclamacion`
--

INSERT INTO `reclamacion` (`id`, `cliente_id`, `asunto`, `cuerpo`, `estado`) VALUES
(0, 3, 'no va el wifi', 'el clash royale pega tirones, no he podido hacer los dos ataques en guerra', 'en revision'),
(1, 3, 'no va el wifi', 'el clash royale pega tirones, no he podido hacer los dos ataques en guerra', 'en revision');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id` bigint(20) NOT NULL,
  `contrato_id` bigint(20) NOT NULL,
  `tipo` enum('fijo','fibra','movil') NOT NULL,
  `caracteristica` varchar(128) NOT NULL,
  `precio` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`id`, `contrato_id`, `tipo`, `caracteristica`, `precio`) VALUES
(2, 2, 'fibra', '300mb', 120),
(3, 4, 'movil', '20gb\r\n600min', 120);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contratocliente` (`cliente_id`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empleado_reclamacion`
--
ALTER TABLE `empleado_reclamacion`
  ADD PRIMARY KEY (`id_empleado`,`id_reclamacion`),
  ADD KEY `reclamacion` (`id_reclamacion`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `facturacontrato` (`contrato_id`);

--
-- Indices de la tabla `opcion`
--
ALTER TABLE `opcion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `opcioncliente` (`cliente_id`);

--
-- Indices de la tabla `reclamacion`
--
ALTER TABLE `reclamacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reclamacioncliente` (`cliente_id`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `contrato`
--
ALTER TABLE `contrato`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `opcion`
--
ALTER TABLE `opcion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD CONSTRAINT `contratocliente` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `empleado_reclamacion`
--
ALTER TABLE `empleado_reclamacion`
  ADD CONSTRAINT `empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id`),
  ADD CONSTRAINT `reclamacion` FOREIGN KEY (`id_reclamacion`) REFERENCES `reclamacion` (`id`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `facturacontrato` FOREIGN KEY (`contrato_id`) REFERENCES `contrato` (`id`);

--
-- Filtros para la tabla `opcion`
--
ALTER TABLE `opcion`
  ADD CONSTRAINT `opcioncliente` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `reclamacion`
--
ALTER TABLE `reclamacion`
  ADD CONSTRAINT `reclamacioncliente` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `serviciocontrato` FOREIGN KEY (`contrato_id`) REFERENCES `contrato` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
