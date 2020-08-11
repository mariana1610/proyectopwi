-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-08-2020 a las 23:30:21
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectobmr`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id_carrito` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `lote` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `id_producto` int(11) NOT NULL,
  `precio` float NOT NULL,
  `cantidad` int(11) NOT NULL,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `categoria_status` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre`, `categoria_status`, `ts_create`, `ts_update`) VALUES
(1, 'torta', '1', '2020-07-05 12:03:36', '2020-07-05 12:03:36'),
(2, 'chocolateria', '1', '2020-07-05 12:04:02', '2020-07-05 12:04:02'),
(3, 'panaderia', '1', '2020-07-05 12:04:36', '2020-07-05 12:04:36'),
(4, 'caja', '1', '2020-07-05 12:04:36', '2020-07-05 12:04:36'),
(5, 'pascuas', '1', '2020-07-05 12:08:54', '2020-07-05 12:08:54'),
(6, 'especiales', '1', '2020-07-05 12:08:54', '2020-07-05 12:08:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id_compra` int(11) NOT NULL,
  `id_lote` int(11) NOT NULL,
  `horarioentrega` varchar(255) COLLATE utf16_spanish2_ci NOT NULL COMMENT 'mañana (10-12) o tarde (13-19)',
  `precio_final` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envio`
--

CREATE TABLE `envio` (
  `id_envio` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_orden` int(11) NOT NULL,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `descripcion` text COLLATE utf16_spanish2_ci NOT NULL,
  `categoria` int(255) NOT NULL,
  `precio` float NOT NULL,
  `imagen` varchar(255) COLLATE utf16_spanish2_ci DEFAULT '/images/productos/default.png' COMMENT 'url de imagen',
  `stock` int(11) NOT NULL,
  `descuento` int(255) NOT NULL DEFAULT 0,
  `status` tinyint(255) NOT NULL DEFAULT 1 COMMENT '1 si, 0 no',
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre`, `descripcion`, `categoria`, `precio`, `imagen`, `stock`, `descuento`, `status`, `ts_create`, `ts_update`) VALUES
(1, 'Caja 6 conitos', 'Blancos, negros, o surtidos. ', 2, 385, '/images/productos/conitoc.png', 20, 0, 1, '2020-07-05 12:35:30', '2020-07-05 12:35:30'),
(2, 'Caja 6 alfajores', 'Blancos, negros, o surtidos.', 2, 385, '/images/productos/alfajorc.png', 30, 0, 1, '2020-07-05 12:36:26', '2020-07-05 12:36:26'),
(3, 'Compotera de helado con cuchara', 'Contenido: Tableta marmolada con rocklets, alfajor, 40grs de bombones surtidos.', 6, 600, '/images/productos/compotera.png', 20, 0, 1, '2020-07-05 12:48:26', '2020-07-05 12:48:26'),
(4, 'Desayuno - opción 1', '4 alfajores blancos + 4 alfajores negros + 100grs de bombones surtidos + 2 corazones de chocolate rellenos + 1 mini torta (consultar stock). Colores a elección. ', 4, 800, '/images/productos/desayuno1.png', 25, 0, 1, '2020-07-05 12:50:53', '2020-07-05 12:50:53'),
(5, 'Desayuno - opción 2', '3 alfajores surtidos + 2 alfacocos o maicenas + 1 mini rogel + 2 muffins + 100grs de bombones surtidos + 1 corazón de chocolate relleno + numercake o lettercake. Colores a elección. ', 4, 1150, '/images/productos/desayuno2.png', 0, 0, 1, '2020-07-05 12:52:49', '2020-07-05 12:52:49'),
(6, 'Desayuno - opción 3', '3 alfajores surtidos + 2 alfacocos o maicenas + 1 mini rogel + 2 muffins + 100grs de bombones surtidos + 1 corazón de chocolate relleno + numercake o lettercake. Colores a elección. ', 4, 1150, '/images/productos/desayuno3.png', 30, 0, 1, '2020-07-05 12:53:00', '2020-07-05 12:53:00'),
(7, 'Torta Buttercream (Violeta)', 'Torta de buttercream con relleno a elección. Decorada con chocolates y bombones. ', 1, 2000, '/images/productos/tortavioleta.png', 30, 0, 1, '2020-07-20 10:36:20', '2020-07-20 10:36:20'),
(8, 'Torta Buttercream (Rosa)', 'Torta de buttercream con relleno a elección. Decorada con chocolates y bombones. ', 1, 2000, '/images/productos/tortarosa.png', 30, 0, 1, '2020-07-20 10:36:20', '2020-07-20 10:36:20'),
(9, 'Torta Buttercream Personalizada', 'Torta de buttercream con relleno a elección. Decorada con chocolates y bombones, temática a elección.', 1, 2000, '/images/productos/tortalila.png', 30, 0, 1, '2020-07-20 10:36:20', '2020-07-20 10:36:20'),
(10, 'Torta Brownie', 'Torta de brownie con dulce de leche, chocolates y bombones.', 1, 2000, '/images/productos/tortabrownie.png', 30, 0, 1, '2020-07-20 10:36:20', '2020-07-20 10:36:20'),
(11, 'Torta de galletas', 'Torta de relleno a elección, decorada con galletas pintadas a mano.', 1, 2000, '/images/productos/tortagalletas1.png', 30, 0, 1, '2020-07-20 10:36:20', '2020-07-20 10:36:20'),
(12, 'Torta Buttercream (Celeste)', 'Torta de buttercream con relleno a elección. Decorada con chocolates y bombones. ', 1, 2000, '/images/productos/tortaturquesa.png', 30, 0, 1, '2020-07-20 10:36:20', '2020-07-20 10:36:20'),
(13, 'Tableta de chocolate', 'Oreo, rocklets, marmolado, marroc, o frutos secos.', 2, 400, '/images/productos/tabletachoco1.png', 30, 0, 1, '2020-07-05 12:36:26', '2020-07-05 12:36:26'),
(14, 'Alfajores arcoiris', 'Caja de alfajores surtidos. ', 2, 400, '/images/productos/alfajorarcoiris1.png', 30, 0, 1, '2020-07-05 12:36:26', '2020-07-05 12:36:26'),
(15, 'Caja de bombones corazón', 'Marroc, blancos, y negros. A elección.', 2, 600, '/images/productos/cajabombon1.png', 30, 0, 1, '2020-07-05 12:36:26', '2020-07-05 12:36:26'),
(16, 'Caja de bombones rosa', 'Marroc, blancos, y negros, surtidos. Temática de bombones a elección. ', 2, 800, '/images/productos/cajabombonrosa.png', 30, 0, 1, '2020-07-05 12:36:26', '2020-07-05 12:36:26'),
(17, 'Chips osito', 'Pan casero tipo chip. ', 3, 600, '/images/productos/chips1.png', 30, 0, 1, '2020-07-05 12:36:26', '2020-07-05 12:36:26'),
(18, 'Pan lactal casero', 'Pan casero tipo lactal. ', 3, 600, '/images/productos/panlactal.jpg', 30, 0, 1, '2020-07-05 12:36:26', '2020-07-05 12:36:26'),
(19, 'Huevo Harry Potter', 'Unicornio temático de Harry Potter.', 5, 700, '/images/productos/huevosharry.jpg', 20, 0, 1, '2020-07-05 12:35:30', '2020-07-05 12:35:30'),
(20, 'Medio-huevo Marroc', 'Medio huevo en caja, temática marroc. ', 5, 700, '/images/productos/mediohuevos.jpg', 20, 0, 1, '2020-07-05 12:35:30', '2020-07-05 12:35:30'),
(21, 'Medio-huevo temático', 'Medio huevo en caja, temática conejo. ', 5, 700, '/images/productos/mediohuevotem.png', 20, 0, 1, '2020-07-05 12:35:30', '2020-07-05 12:35:30'),
(22, 'Cookie pintada a mano', 'Cookies pintadas a mano, temática a elección. ', 3, 600, '/images/productos/cookiepintada.png', 30, 0, 1, '2020-07-05 12:36:26', '2020-07-05 12:36:26'),
(23, 'Caja de cookies', 'Cookies de chips, rocklets, marroc, a elección.', 3, 600, '/images/productos/cookie1.png', 30, 0, 1, '2020-07-05 12:36:26', '2020-07-05 12:36:26'),
(24, 'Desayuno Brownie', 'Caja de desayuno con contenido a elección, en tonos rojos. ', 4, 1150, '/images/productos/cajaroja1.jpg', 30, 0, 1, '2020-07-05 12:53:00', '2020-07-05 12:53:00'),
(25, 'Desayuno Día Especial', 'Caja de desayuno con contenido a elección, y mensaje. ', 4, 1150, '/images/productos/cajapadre.jpg', 30, 0, 1, '2020-07-05 12:53:00', '2020-07-05 12:53:00'),
(26, 'Desayuno Día Especial 2', 'Caja de desayuno con contenido a elección, y mensaje. Tonos dorados. ', 4, 1150, '/images/productos/cajaacepto.jpg', 30, 0, 1, '2020-07-05 12:53:00', '2020-07-05 12:53:00'),
(27, 'Huevo Unicornio', 'Unicornio con colores a elección.', 5, 700, '/images/productos/unihuevo1.png', 20, 0, 1, '2020-07-05 12:35:30', '2020-07-05 12:35:30'),
(28, 'Huevo Cara de Papa', 'Huevo de chocolate de Cara de Papa.', 5, 700, '/images/productos/huevocaradepapa.png', 20, 0, 1, '2020-07-05 12:35:30', '2020-07-05 12:35:30'),
(29, 'Huevo Erizo', 'Huevo de chocolate modelo Erizo.', 5, 700, '/images/productos/huevoerizo.png', 20, 0, 1, '2020-07-05 12:35:30', '2020-07-05 12:35:30'),
(30, 'Bombones San Valentín', 'Bombones rellenos temática del Día de los Enamorados.', 6, 600, '/images/productos/sv1.png', 20, 0, 1, '2020-07-05 12:48:26', '2020-07-05 12:48:26'),
(31, 'Calus Cupcake', 'Calus Cupcake de chocolate relleno de dulce de leche.', 6, 600, '/images/productos/calucup.png', 20, 0, 1, '2020-07-05 12:48:26', '2020-07-05 12:48:26'),
(32, 'Cactus de chocolate', 'Cactus de chocolate blanco y negro relleno de 200grs de bombones. ', 6, 600, '/images/productos/cactus1.png', 20, 0, 1, '2020-07-05 12:48:26', '2020-07-05 12:48:26'),
(33, 'Rosca de pascua', 'En tres tamaños. Puede ser tradicional o rellena de pastelera, dulce de leche o nutella.', 3, 600, '/images/productos/roscapascua.png', 20, 0, 1, '2020-07-05 12:48:26', '2020-07-05 12:48:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE `recetas` (
  `id_receta` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `texto` text COLLATE utf16_spanish2_ci NOT NULL,
  `imagen` varchar(255) COLLATE utf16_spanish2_ci DEFAULT NULL COMMENT 'url de imagen',
  `ts_create` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `usuario` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `password` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `apellido` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `email` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `c.p.` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0false 1true',
  `admin` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0false 1true',
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `usuario`, `password`, `nombre`, `apellido`, `telefono`, `email`, `direccion`, `c.p.`, `status`, `admin`, `ts_create`, `ts_update`) VALUES
(1, 'admin', '1234', 'Mariana', 'Pavón', '1511111111', 'mari_ines_95@hotmail.com', 'Baker Street 221 b', '5897', 1, 1, '2020-07-05 12:43:09', '2020-07-05 12:43:09'),
(2, 'bmradmin', '1234', 'Belén', 'Rinavera', '1522222222', 'bmrcakes@gmail.com', 'Evergreen Terrace 742', '5896', 1, 1, '2020-07-05 12:45:34', '2020-07-05 12:45:34');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id_carrito`),
  ADD KEY `id_usuario` (`id_usuario`,`id_producto`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `nombrecategoria` (`nombre`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `id_lote` (`id_lote`);

--
-- Indices de la tabla `envio`
--
ALTER TABLE `envio`
  ADD PRIMARY KEY (`id_envio`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `categoria` (`categoria`);

--
-- Indices de la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD PRIMARY KEY (`id_receta`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id_carrito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `envio`
--
ALTER TABLE `envio`
  MODIFY `id_envio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
  MODIFY `id_receta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `envio`
--
ALTER TABLE `envio`
  ADD CONSTRAINT `envio_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
