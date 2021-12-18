-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-12-2021 a las 17:24:26
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_iluminarte`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `idAdministrador` int(11) NOT NULL,
  `idUsuarioFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `nombreCategoria` varchar(60) NOT NULL,
  `descripcionCategoria` varchar(60) DEFAULT NULL,
  `estadoCategoria` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `nombreCategoria`, `descripcionCategoria`, `estadoCategoria`) VALUES
(1, 'Industrial', 'Iluminarias solamente para la industria y Pymes', 1),
(2, 'Residencial', 'para la casa', 1),
(3, 'Comercial', 'Solo para tiendas y negocio', 1),
(4, 'Accesorios Eléctricos', 'Elementos de Electricidad', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `idUsuarioFK` int(11) NOT NULL,
  `idMunicipioDivipolaFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallepedido`
--

CREATE TABLE `detallepedido` (
  `idDetallePedido` int(11) NOT NULL,
  `idPedidoFK` int(11) NOT NULL,
  `idProductoFK` int(11) NOT NULL,
  `cantidadDetallePedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `divipola`
--

CREATE TABLE `divipola` (
  `idMunicipioDivipola` int(11) NOT NULL,
  `nombreMunicipioDivipola` varchar(60) NOT NULL,
  `nombreDepartamentoDivipola` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `idPago` int(11) NOT NULL,
  `idPedidoFK` int(11) NOT NULL,
  `estadoPago` varchar(30) NOT NULL,
  `valorPago` double NOT NULL,
  `porcentajeIvaPago` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL,
  `idClienteFK` int(11) NOT NULL,
  `idVendedorFK` int(11) NOT NULL,
  `descripcionPedido` varchar(60) NOT NULL,
  `estadoPedido` varchar(30) NOT NULL,
  `fechaPedido` date NOT NULL,
  `realizaCompraPedido` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `idCategoriaFK` int(11) NOT NULL,
  `idProveedorFK` int(11) NOT NULL,
  `nombreProducto` varchar(60) NOT NULL,
  `precioProducto` double NOT NULL,
  `descripcionProducto` varchar(60) NOT NULL,
  `imagenProducto` varchar(255) DEFAULT NULL,
  `estadoProducto` tinyint(1) NOT NULL,
  `stockProducto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `idCategoriaFK`, `idProveedorFK`, `nombreProducto`, `precioProducto`, `descripcionProducto`, `imagenProducto`, `estadoProducto`, `stockProducto`) VALUES
(12, 1, 1, 'bombillo', 12000, 'prueba_1', 'imagen11377789101069334764ilu1_T.jpg', 1, 30),
(13, 2, 2, 'tubos', 5000, 'prueba_2', 'imagen14242669004914543189ilu2_T.jpg', 1, 35),
(14, 3, 1, 'BOMBILLO BIPIN', 10000, 'prueba_3', 'imagen15510071486249617441ilu3_T.jpg', 1, 40),
(15, 2, 1, 'BOMBILLO LED CLÁSICO', 6000, 'prueba_4', 'imagen10733735628553457930ilu4_T.jpg', 1, 50),
(16, 1, 1, 'BOMBILLO PAR 30 LED', 15000, 'prueba_5', 'imagen11039786471260507131ilu5_T.jpg', 1, 45);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `idProveedor` int(11) NOT NULL,
  `nombreProveedor` varchar(60) NOT NULL,
  `direccionProveedor` varchar(60) NOT NULL,
  `telefonoProveedor` varchar(60) NOT NULL,
  `personaContactoProveedor` varchar(60) DEFAULT NULL,
  `estadoProveedor` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`idProveedor`, `nombreProveedor`, `direccionProveedor`, `telefonoProveedor`, `personaContactoProveedor`, `estadoProveedor`) VALUES
(1, 'capgemini', 'calle 123', '55555556', 'Edwin', 0),
(2, 'unicasa', 'calle 123', '6666', 'Edwin', 1),
(3, 'WELLMAX', '66', '985545', 'Luis Alvarez', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodocumento`
--

CREATE TABLE `tipodocumento` (
  `idTipoDocumento` int(11) NOT NULL,
  `nombreTipoDocumento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipodocumento`
--

INSERT INTO `tipodocumento` (`idTipoDocumento`, `nombreTipoDocumento`) VALUES
(1, 'Cedula de ciudadania'),
(2, 'Cedula Extranjeria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiporol`
--

CREATE TABLE `tiporol` (
  `idRol` int(11) NOT NULL,
  `nombreRol` varchar(20) NOT NULL,
  `estadoRol` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tiporol`
--

INSERT INTO `tiporol` (`idRol`, `nombreRol`, `estadoRol`) VALUES
(1, 'Administrador', 1),
(2, 'Vendedor', 1),
(3, 'Cliente', 1),
(4, 'Secretarioss', 0),
(5, 'Secretario 1', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `idTipoDocumentoFK` int(11) NOT NULL,
  `idRolFK` int(11) NOT NULL,
  `nombreUsuario` varchar(50) NOT NULL,
  `apellidoUsuario` varchar(50) NOT NULL,
  `contrasenaUsuario` varchar(50) NOT NULL,
  `numeroIdentificacionUsuario` varchar(30) NOT NULL,
  `direccionUsuario` varchar(50) NOT NULL,
  `telefonoUsuario` varchar(40) NOT NULL,
  `correoUsuario` varchar(60) NOT NULL,
  `estadoUsuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `idTipoDocumentoFK`, `idRolFK`, `nombreUsuario`, `apellidoUsuario`, `contrasenaUsuario`, `numeroIdentificacionUsuario`, `direccionUsuario`, `telefonoUsuario`, `correoUsuario`, `estadoUsuario`) VALUES
(2, 1, 2, 'Bayron', 'Hortua', '123', '2020', 'calle 55', '200', 'cliente@gmail.com', 1),
(3, 1, 3, 'Yazmin', 'Gonzales', '123', '3030', 'TV 4 Este No 36 K 28', '6666', 'y@gamil.com', 1),
(4, 2, 1, 'Yazmin', 'Gonzales', '123', '3031', 'carrera 4', '333333', 'y@gamil.com', 1),
(5, 2, 2, 'Carlos', 'Romero', '123', '897887', '66', '5555555', 'carlos@misena', 1),
(6, 1, 1, 'jesus', 'mass', '202cb962ac59075b964b07152d234b70', '45545', '55', '988987', 'mauriciomass@misena.edu.co', 1),
(7, 1, 1, 'Alfredo', 'Gutierrez Miranda', '202cb962ac59075b964b07152d234b70', '5875245', '89', '8525452', 'jesusmmass@gmail.com', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedor`
--

CREATE TABLE `vendedor` (
  `idVendedor` int(11) NOT NULL,
  `idUsuarioFK` int(11) NOT NULL,
  `tipoVendedor` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`idAdministrador`),
  ADD KEY `idUsuarioFK` (`idUsuarioFK`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `idUsuarioFK` (`idUsuarioFK`),
  ADD KEY `idMunicipioDivipolaFK` (`idMunicipioDivipolaFK`);

--
-- Indices de la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD PRIMARY KEY (`idDetallePedido`),
  ADD KEY `idPedidoFK` (`idPedidoFK`),
  ADD KEY `idProductoFK` (`idProductoFK`);

--
-- Indices de la tabla `divipola`
--
ALTER TABLE `divipola`
  ADD PRIMARY KEY (`idMunicipioDivipola`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`idPago`),
  ADD KEY `idPedidoFK` (`idPedidoFK`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `idClienteFK` (`idClienteFK`),
  ADD KEY `idVendedorFK` (`idVendedorFK`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `idCategoriaFK` (`idCategoriaFK`),
  ADD KEY `idProveedorFK` (`idProveedorFK`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`idProveedor`);

--
-- Indices de la tabla `tipodocumento`
--
ALTER TABLE `tipodocumento`
  ADD PRIMARY KEY (`idTipoDocumento`);

--
-- Indices de la tabla `tiporol`
--
ALTER TABLE `tiporol`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `idRolFK` (`idRolFK`),
  ADD KEY `idTipoDocumentoFK` (`idTipoDocumentoFK`);

--
-- Indices de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`idVendedor`),
  ADD KEY `idUsuarioFK` (`idUsuarioFK`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `idAdministrador` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  MODIFY `idDetallePedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `idPago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `idProveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipodocumento`
--
ALTER TABLE `tipodocumento`
  MODIFY `idTipoDocumento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tiporol`
--
ALTER TABLE `tiporol`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  MODIFY `idVendedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`idUsuarioFK`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`idUsuarioFK`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`idMunicipioDivipolaFK`) REFERENCES `divipola` (`idMunicipioDivipola`);

--
-- Filtros para la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD CONSTRAINT `detallepedido_ibfk_1` FOREIGN KEY (`idPedidoFK`) REFERENCES `pedido` (`idPedido`),
  ADD CONSTRAINT `detallepedido_ibfk_2` FOREIGN KEY (`idProductoFK`) REFERENCES `producto` (`idProducto`);

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`idPedidoFK`) REFERENCES `pedido` (`idPedido`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`idClienteFK`) REFERENCES `cliente` (`idCliente`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`idVendedorFK`) REFERENCES `vendedor` (`idVendedor`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idCategoriaFK`) REFERENCES `categoria` (`idCategoria`),
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`idProveedorFK`) REFERENCES `proveedor` (`idProveedor`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idRolFK`) REFERENCES `tiporol` (`idRol`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`idTipoDocumentoFK`) REFERENCES `tipodocumento` (`idTipoDocumento`);

--
-- Filtros para la tabla `vendedor`
--
ALTER TABLE `vendedor`
  ADD CONSTRAINT `vendedor_ibfk_1` FOREIGN KEY (`idUsuarioFK`) REFERENCES `usuario` (`idUsuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
