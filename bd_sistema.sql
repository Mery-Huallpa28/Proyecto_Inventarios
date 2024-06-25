-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 25-06-2024 a las 11:10:02
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
-- Base de datos: `bd_sistema`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`) VALUES
(12, 'Electrónica', 'Dispositivos electrónicos'),
(13, 'Ropa', 'Vestimenta de diferentes tipos'),
(14, 'Utensilios', 'Cerámica'),
(15, 'Libros', 'Diferentes géneros literarios'),
(16, 'Decoración', 'Artículos decorativos'),
(17, 'Jardinería', 'Herramientas y productos'),
(18, 'Alimentos', 'Productos alimenticios'),
(19, 'Bebidas', 'Bebidas de todo tipo'),
(20, 'Muebles', 'Mobiliario para el hogar'),
(21, 'Deportes', 'Equipamiento deportivo'),
(22, 'Electrodomésticos', 'Para el hogar'),
(23, 'Automotriz', 'Productos para vehículos'),
(24, 'Salud', 'Productos de salud'),
(25, 'Belleza', 'Productos de belleza'),
(26, 'Mascotas', 'Accesorios y alimentos'),
(27, 'Papelería', 'Material de oficina'),
(28, 'Joyería', 'Joyas y accesorios'),
(29, 'Calzado', 'Zapatos y sandalias'),
(30, 'Accesorios', 'Complementos y moda'),
(31, 'Juguetes', 'plastico'),
(32, 'Electrónica', 'Dispositivos electrónicos'),
(33, 'Ropa', 'Vestimenta de diferentes tipos'),
(34, 'Utensilios', 'Cerámica'),
(35, 'Libros', 'Diferentes géneros literarios'),
(36, 'Decoración', 'Artículos decorativos'),
(37, 'Jardinería', 'Herramientas y productos'),
(38, 'Alimentos', 'Productos alimenticios'),
(39, 'Bebidas', 'Bebidas de todo tipo'),
(40, 'Muebles', 'Mobiliario para el hogar'),
(41, 'Deportes', 'Equipamiento deportivo'),
(42, 'Electrodomésticos', 'Para el hogar'),
(43, 'Automotriz', 'Productos para vehículos'),
(44, 'Salud', 'Productos de salud'),
(45, 'Belleza', 'Productos de belleza'),
(46, 'Mascotas', 'Accesorios y alimentos'),
(47, 'Papelería', 'Material de oficina'),
(48, 'Joyería', 'Joyas y accesorios'),
(49, 'Calzado', 'Zapatos y sandalias'),
(50, 'Accesorios', 'Complementos y moda'),
(51, 'Cuadros', 'Cuadros o liensos pintados a mano');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes`
--

CREATE TABLE `ordenes` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ordenes`
--

INSERT INTO `ordenes` (`id`, `producto_id`, `cantidad`, `fecha`) VALUES
(24, 126, 5, '2024-05-25'),
(25, 127, 1, '2024-06-01'),
(26, 135, 10, '2024-06-10'),
(27, 132, 20, '2024-06-14'),
(28, 134, 4, '2024-06-13'),
(29, 136, 20, '2024-06-23'),
(30, 139, 2, '2024-06-23'),
(32, 127, 80, '2024-06-22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` float(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `categoria_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `cantidad`, `categoria_id`) VALUES
(126, 'Laptop', 'Portatil de alta gama', 1200.00, 50, 12),
(127, 'Telefono', 'Smartphone ultima generacion', 800.00, 150, 12),
(128, 'Camiseta', 'Camiseta de algodon', 20.00, 200, 13),
(129, 'Taza', 'Cerramica pintada a mano', 5.00, 80, 14),
(130, 'Libro \"El fantasma de canterville\"', 'Novela de misterio', 80.00, 150, 15),
(131, 'Zapatilla \"Nike Air force 1LE\"', 'Zapatilla deportiva de color blanco', 450.00, 90, 21),
(132, 'Silla', 'Silla ergonomica', 45.00, 300, 20),
(133, 'Collar \"Arena Roja\"', 'Collar de perlas ', 190.00, 25, 28),
(134, 'Mesa', 'Mesa de Comedor', 600.00, 20, 20),
(135, 'Lampara', 'Lampara de Escritorio', 50.00, 40, 32),
(136, 'Bolso ', 'Mochila de cuero de color negro', 200.00, 70, 13),
(139, 'Vino', 'Vino tinto de reserva cosecha 1950', 1200.00, 300, 19),
(140, 'Reloj \"Rolex\"', 'Reloj de mano', 3000.00, 20, 50),
(141, 'Auriculares ', 'Auriculares inalambricos', 300.00, 500, 32),
(142, 'Camara ', 'Camara digital', 1000.00, 45, 12),
(143, 'Mochila', 'Mochila de pelicula intensamente 2', 100.00, 150, 33);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `nombre`, `telefono`, `email`, `producto_id`) VALUES
(2, 'Carla Pacheco', 123456789, 'carla@gmail.com', 143),
(7, 'Yovana Smith', 7787456, 'yovana@gmail.com', 139),
(8, 'Emily Chamby', 76944827, 'emily@gmail.com', 142),
(9, 'Carlos Mamani', 9435444, 'carlos@gmail.com', 135);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombres` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombres`, `apellidos`, `correo`, `password`) VALUES
(1, 'Admin', 'Administrador', 'admin@gmail.com', 'admin'),
(4, 'Mery', 'Huallpa Asistiri', 'mery@gmail.com', 'mery'),
(5, 'Hilda Lourdes', 'Villca Butron', 'hilda@gmail.com', 'hilda'),
(6, 'Edwin ', 'Qenta Kuno', 'edwin@gmail.com', 'edwin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD CONSTRAINT `ordenes_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`);

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
