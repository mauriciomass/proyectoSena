-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-01-2022 a las 01:51:46
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

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`idAdministrador`, `idUsuarioFK`) VALUES
(1, 33);

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

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `idUsuarioFK`, `idMunicipioDivipolaFK`) VALUES
(1, 3, 1),
(2, 19, 1),
(5, 4, 1),
(6, 31, 1),
(7, 34, 1),
(8, 35, 1),
(9, 36, 1),
(10, 37, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallepedido`
--

CREATE TABLE `detallepedido` (
  `idDetallePedido` int(11) NOT NULL,
  `idPedidoFK` int(11) NOT NULL,
  `idProductoFK` int(11) NOT NULL,
  `cantidadDetallePedido` int(11) NOT NULL,
  `precioDetallePedido` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detallepedido`
--

INSERT INTO `detallepedido` (`idDetallePedido`, `idPedidoFK`, `idProductoFK`, `cantidadDetallePedido`, `precioDetallePedido`) VALUES
(1, 1, 12, 2, 0),
(4, 22, 13, 3, 5000),
(5, 23, 12, 2, 12000),
(6, 23, 13, 3, 5000),
(7, 24, 12, 2, 12000),
(8, 24, 13, 5, 5000),
(9, 25, 12, 2, 12000),
(10, 25, 13, 5, 5000),
(11, 25, 13, 1, 5000),
(12, 26, 12, 2, 12000),
(13, 26, 13, 5, 5000),
(14, 26, 13, 1, 5000),
(15, 26, 14, 1, 10000),
(16, 26, 14, 1, 10000),
(17, 27, 12, 2, 12000),
(18, 27, 13, 5, 5000),
(19, 27, 13, 1, 5000),
(20, 27, 14, 1, 10000),
(21, 27, 14, 1, 10000),
(22, 28, 12, 2, 12000),
(23, 28, 13, 5, 5000),
(24, 28, 13, 1, 5000),
(25, 28, 14, 1, 10000),
(26, 28, 14, 1, 10000),
(27, 29, 12, 2, 12000),
(28, 29, 13, 5, 5000),
(29, 29, 13, 1, 5000),
(30, 29, 14, 1, 10000),
(31, 29, 14, 1, 10000),
(32, 30, 12, 2, 12000),
(33, 30, 13, 5, 5000),
(34, 30, 13, 1, 5000),
(35, 30, 14, 1, 10000),
(36, 30, 14, 1, 10000),
(37, 31, 12, 2, 12000),
(38, 31, 13, 5, 5000),
(39, 31, 13, 1, 5000),
(40, 31, 14, 1, 10000),
(41, 31, 14, 1, 10000),
(42, 32, 12, 2, 12000),
(43, 32, 13, 5, 5000),
(44, 32, 13, 1, 5000),
(45, 32, 14, 1, 10000),
(46, 32, 14, 1, 10000),
(47, 33, 12, 2, 12000),
(48, 33, 13, 5, 5000),
(49, 33, 13, 1, 5000),
(50, 33, 14, 1, 10000),
(51, 33, 14, 1, 10000),
(52, 34, 12, 2, 12000),
(53, 34, 13, 5, 5000),
(54, 34, 13, 1, 5000),
(55, 34, 14, 1, 10000),
(56, 34, 14, 1, 10000),
(57, 35, 12, 2, 12000),
(58, 35, 13, 5, 5000),
(59, 35, 13, 1, 5000),
(60, 35, 14, 1, 10000),
(61, 35, 14, 1, 10000),
(62, 36, 12, 2, 12000),
(63, 36, 13, 5, 5000),
(64, 36, 13, 1, 5000),
(65, 36, 14, 1, 10000),
(66, 36, 14, 1, 10000),
(67, 37, 12, 2, 12000),
(68, 37, 13, 5, 5000),
(69, 37, 13, 1, 5000),
(70, 37, 14, 1, 10000),
(71, 37, 14, 1, 10000),
(72, 37, 15, 1, 6000),
(73, 38, 12, 2, 12000),
(74, 38, 13, 5, 5000),
(75, 38, 13, 1, 5000),
(76, 38, 14, 1, 10000),
(77, 38, 14, 1, 10000),
(78, 38, 15, 1, 6000),
(79, 39, 12, 2, 12000),
(80, 39, 13, 5, 5000),
(81, 39, 13, 1, 5000),
(82, 39, 14, 1, 10000),
(83, 39, 14, 1, 10000),
(84, 39, 15, 1, 6000),
(85, 40, 12, 2, 12000),
(86, 40, 13, 5, 5000),
(87, 40, 13, 1, 5000),
(88, 40, 14, 1, 10000),
(89, 40, 14, 1, 10000),
(90, 40, 15, 1, 6000),
(91, 41, 15, 1, 6000),
(92, 42, 15, 1, 6000),
(93, 42, 16, 1, 15000),
(94, 43, 16, 1, 15000),
(95, 44, 16, 1, 15000),
(96, 45, 16, 1, 15000),
(97, 46, 16, 1, 15000),
(98, 48, 16, 1, 15000),
(99, 50, 17, 1, 20000),
(100, 51, 17, 1, 20000),
(101, 52, 17, 1, 20000),
(102, 53, 17, 1, 20000),
(103, 54, 17, 1, 20000),
(104, 54, 17, 1, 20000),
(105, 54, 17, 1, 20000),
(106, 54, 17, 1, 20000),
(107, 55, 17, 2, 20000),
(108, 55, 12, 3, 12000),
(109, 55, 14, 2, 10000),
(110, 57, 15, 1, 6000),
(111, 57, 17, 1, 20000),
(112, 57, 13, 1, 5000),
(113, 57, 15, 1, 6000),
(114, 57, 15, 1, 6000),
(115, 57, 15, 3, 6000),
(116, 57, 13, 1, 5000),
(117, 57, 15, 1, 6000),
(118, 57, 14, 5, 10000),
(119, 57, 13, 4, 5000),
(120, 57, 13, 3, 5000),
(121, 57, 15, 3, 6000),
(122, 57, 14, 1, 10000),
(123, 57, 14, 1, 10000),
(124, 57, 14, 1, 10000),
(125, 57, 15, 3, 6000),
(126, 57, 15, 4, 6000),
(127, 57, 15, 2, 6000),
(128, 75, 14, 2, 10000),
(129, 76, 12, 10, 12000),
(130, 76, 14, 2, 10000),
(131, 76, 16, 1, 15000),
(132, 76, 16, 1, 15000),
(133, 76, 15, 2, 6000),
(134, 76, 16, 1, 15000),
(135, 76, 16, 2, 15000),
(136, 76, 16, 3, 15000),
(137, 76, 16, 2, 15000),
(138, 76, 16, 1, 15000),
(139, 76, 13, 2, 5000),
(140, 76, 16, 1, 15000),
(141, 76, 15, 1, 6000),
(142, 76, 12, 1, 12000),
(143, 76, 13, 1, 5000),
(144, 76, 12, 3, 12000),
(145, 92, 13, 2, 5000),
(146, 93, 15, 1, 6000),
(147, 94, 13, 4, 5000),
(148, 95, 13, 3, 5000),
(149, 95, 14, 2, 10000),
(150, 96, 13, 2, 5000),
(151, 96, 16, 1, 15000),
(152, 96, 14, 2, 10000),
(153, 96, 16, 2, 15000),
(154, 96, 13, 1, 5000),
(155, 96, 14, 1, 10000),
(156, 96, 13, 1, 5000),
(157, 96, 14, 1, 10000),
(158, 96, 13, 1, 5000),
(159, 96, 13, 1, 5000),
(160, 96, 17, 3, 20000),
(161, 96, 13, 1, 5000),
(162, 96, 13, 2, 5000),
(163, 96, 12, 1, 12000),
(164, 96, 17, 1, 20000),
(165, 96, 17, 1, 20000),
(166, 96, 13, 1, 5000),
(167, 96, 17, 1, 20000),
(168, 96, 17, 1, 20000),
(169, 96, 17, 1, 20000),
(170, 96, 17, 1, 20000),
(171, 96, 17, 1, 20000),
(172, 96, 17, 1, 20000),
(173, 96, 17, 1, 20000),
(174, 96, 17, 1, 20000),
(175, 96, 17, 1, 20000),
(176, 96, 17, 1, 20000),
(177, 96, 17, 1, 20000),
(178, 96, 17, 1, 20000),
(179, 96, 17, 1, 20000),
(180, 96, 17, 1, 20000),
(181, 96, 17, 1, 20000),
(182, 96, 17, 1, 20000),
(183, 96, 17, 1, 20000),
(184, 96, 17, 1, 20000),
(185, 96, 17, 1, 20000),
(186, 96, 17, 1, 20000),
(187, 96, 17, 1, 20000),
(188, 96, 17, 1, 20000),
(189, 96, 17, 1, 20000),
(190, 96, 17, 1, 20000),
(191, 96, 17, 1, 20000),
(192, 96, 17, 1, 20000),
(193, 96, 17, 1, 20000),
(194, 96, 17, 1, 20000),
(195, 96, 17, 1, 20000),
(196, 96, 17, 1, 20000),
(197, 96, 17, 1, 20000),
(198, 96, 17, 1, 20000),
(199, 96, 17, 1, 20000),
(200, 96, 17, 1, 20000),
(201, 96, 17, 1, 20000),
(202, 96, 17, 1, 20000),
(203, 96, 17, 1, 20000),
(204, 96, 17, 1, 20000),
(205, 96, 17, 1, 20000),
(206, 96, 17, 1, 20000),
(207, 96, 17, 1, 20000),
(208, 96, 17, 1, 20000),
(209, 96, 17, 1, 20000),
(210, 96, 17, 1, 20000),
(211, 96, 17, 1, 20000),
(212, 96, 17, 1, 20000),
(213, 96, 17, 1, 20000),
(214, 96, 17, 1, 20000),
(215, 96, 17, 2, 20000),
(216, 96, 17, 2, 20000),
(217, 96, 17, 2, 20000),
(218, 96, 17, 2, 20000),
(219, 96, 17, 2, 20000),
(220, 96, 17, 2, 20000),
(221, 96, 17, 2, 20000),
(222, 96, 17, 2, 20000),
(223, 96, 17, 2, 20000),
(224, 96, 17, 2, 20000),
(225, 96, 17, 2, 20000),
(226, 96, 17, 2, 20000),
(227, 96, 17, 2, 20000),
(228, 96, 17, 2, 20000),
(229, 96, 17, 2, 20000),
(230, 96, 17, 2, 20000),
(231, 96, 17, 2, 20000),
(232, 96, 17, 2, 20000),
(233, 96, 17, 2, 20000),
(234, 96, 17, 2, 20000),
(235, 96, 13, 2, 5000),
(236, 96, 13, 2, 5000),
(237, 96, 13, 2, 5000),
(238, 96, 13, 2, 5000),
(239, 96, 13, 2, 5000),
(240, 96, 13, 2, 5000),
(241, 96, 13, 2, 5000),
(242, 96, 13, 2, 5000),
(243, 96, 17, 1, 20000),
(244, 97, 17, 1, 20000),
(245, 97, 16, 3, 15000),
(246, 97, 15, 3, 6000),
(247, 97, 15, 3, 6000),
(248, 97, 15, 3, 6000),
(249, 97, 15, 3, 6000),
(250, 97, 15, 3, 6000),
(251, 97, 15, 3, 6000),
(252, 97, 15, 3, 6000),
(253, 97, 15, 3, 6000),
(254, 97, 15, 3, 6000),
(255, 97, 15, 3, 6000),
(256, 97, 15, 3, 6000),
(257, 97, 15, 3, 6000),
(258, 97, 15, 3, 6000),
(259, 97, 15, 3, 6000),
(260, 97, 15, 3, 6000),
(261, 97, 15, 3, 6000),
(262, 97, 13, 1, 5000),
(263, 97, 13, 1, 5000),
(264, 97, 13, 1, 5000),
(265, 97, 13, 1, 5000),
(266, 97, 13, 1, 5000),
(267, 97, 13, 1, 5000),
(268, 97, 13, 1, 5000),
(269, 97, 13, 1, 5000),
(270, 97, 13, 1, 5000),
(271, 97, 13, 1, 5000),
(272, 97, 13, 1, 5000),
(273, 97, 13, 1, 5000),
(274, 97, 13, 1, 5000),
(275, 97, 13, 1, 5000),
(276, 97, 13, 1, 5000),
(277, 97, 13, 1, 5000),
(278, 97, 13, 1, 5000),
(279, 97, 13, 1, 5000),
(280, 97, 13, 1, 5000),
(281, 97, 13, 1, 5000),
(282, 97, 13, 1, 5000),
(283, 97, 13, 1, 5000),
(284, 97, 13, 1, 5000),
(285, 97, 13, 1, 5000),
(286, 97, 13, 1, 5000),
(287, 97, 13, 1, 5000),
(288, 97, 13, 1, 5000),
(289, 97, 13, 1, 5000),
(290, 97, 13, 1, 5000),
(291, 97, 13, 1, 5000),
(292, 97, 13, 1, 5000),
(293, 97, 13, 1, 5000),
(294, 97, 13, 1, 5000),
(295, 97, 13, 1, 5000),
(296, 97, 13, 1, 5000),
(297, 97, 13, 1, 5000),
(298, 97, 13, 1, 5000),
(299, 97, 13, 1, 5000),
(300, 97, 13, 1, 5000),
(301, 97, 13, 1, 5000),
(302, 97, 13, 1, 5000),
(303, 97, 13, 1, 5000),
(304, 97, 17, 1, 20000),
(305, 98, 17, 1, 20000),
(306, 98, 16, 3, 15000),
(307, 98, 15, 3, 6000),
(308, 98, 15, 3, 6000),
(309, 98, 15, 3, 6000),
(310, 98, 15, 3, 6000),
(311, 98, 15, 3, 6000),
(312, 98, 15, 3, 6000),
(313, 98, 15, 3, 6000),
(314, 98, 15, 3, 6000),
(315, 98, 15, 3, 6000),
(316, 98, 15, 3, 6000),
(317, 98, 15, 3, 6000),
(318, 98, 15, 3, 6000),
(319, 98, 15, 3, 6000),
(320, 98, 15, 3, 6000),
(321, 98, 15, 3, 6000),
(322, 98, 15, 3, 6000),
(323, 98, 13, 1, 5000),
(324, 98, 13, 1, 5000),
(325, 98, 13, 1, 5000),
(326, 98, 13, 1, 5000),
(327, 98, 13, 1, 5000),
(328, 98, 13, 1, 5000),
(329, 98, 13, 1, 5000),
(330, 98, 13, 1, 5000),
(331, 98, 13, 1, 5000),
(332, 98, 13, 1, 5000),
(333, 98, 13, 1, 5000),
(334, 98, 13, 1, 5000),
(335, 98, 13, 1, 5000),
(336, 98, 13, 1, 5000),
(337, 98, 13, 1, 5000),
(338, 98, 13, 1, 5000),
(339, 98, 13, 1, 5000),
(340, 98, 13, 1, 5000),
(341, 98, 13, 1, 5000),
(342, 98, 13, 1, 5000),
(343, 98, 13, 1, 5000),
(344, 98, 13, 1, 5000),
(345, 98, 13, 1, 5000),
(346, 98, 13, 1, 5000),
(347, 98, 13, 1, 5000),
(348, 98, 13, 1, 5000),
(349, 98, 13, 1, 5000),
(350, 98, 13, 1, 5000),
(351, 98, 13, 1, 5000),
(352, 98, 13, 1, 5000),
(353, 98, 13, 1, 5000),
(354, 98, 13, 1, 5000),
(355, 98, 13, 1, 5000),
(356, 98, 13, 1, 5000),
(357, 98, 13, 1, 5000),
(358, 98, 13, 1, 5000),
(359, 98, 13, 1, 5000),
(360, 98, 13, 1, 5000),
(361, 98, 13, 1, 5000),
(362, 98, 13, 1, 5000),
(363, 98, 13, 1, 5000),
(364, 98, 13, 1, 5000),
(365, 98, 17, 1, 20000),
(366, 98, 17, 1, 20000),
(367, 99, 17, 1, 20000),
(368, 99, 17, 2, 20000),
(369, 99, 14, 2, 10000),
(370, 100, 17, 1, 20000),
(371, 100, 17, 2, 20000),
(372, 100, 14, 2, 10000),
(373, 100, 15, 1, 6000),
(374, 101, 17, 2, 20000),
(375, 101, 15, 2, 6000),
(376, 101, 16, 3, 15000),
(377, 102, 17, 2, 20000),
(378, 102, 12, 2, 12000),
(379, 102, 15, 4, 6000),
(380, 103, 12, 2, 12000),
(381, 103, 13, 2, 5000),
(382, 103, 14, 1, 10000),
(383, 104, 13, 3, 5000),
(384, 104, 15, 3, 6000),
(385, 104, 17, 2, 20000),
(386, 105, 13, 3, 5000),
(387, 105, 15, 3, 6000),
(388, 105, 17, 2, 20000),
(389, 105, 17, 2, 20000),
(390, 106, 14, 2, 10000),
(391, 106, 17, 2, 20000),
(392, 106, 15, 1, 6000),
(393, 107, 14, 2, 10000),
(394, 107, 17, 2, 20000),
(395, 107, 15, 1, 6000),
(396, 107, 13, 2, 5000),
(397, 108, 12, 1, 12000),
(398, 108, 13, 1, 5000),
(399, 109, 12, 1, 12000),
(400, 109, 13, 1, 5000),
(401, 109, 12, 1, 12000),
(402, 110, 12, 1, 12000),
(403, 110, 13, 1, 5000),
(404, 111, 12, 1, 12000),
(405, 111, 13, 1, 5000),
(406, 112, 12, 1, 12000),
(407, 112, 13, 1, 5000),
(408, 113, 12, 1, 12000),
(409, 113, 13, 1, 5000),
(410, 114, 12, 1, 12000),
(411, 114, 13, 1, 5000),
(412, 114, 12, 1, 12000),
(413, 115, 12, 1, 12000),
(414, 115, 13, 1, 5000),
(415, 115, 14, 1, 10000),
(416, 116, 12, 1, 12000),
(417, 116, 13, 1, 5000),
(418, 116, 14, 1, 10000),
(419, 116, 12, 1, 12000),
(420, 116, 15, 1, 6000),
(421, 117, 12, 1, 12000),
(422, 117, 13, 1, 5000),
(423, 118, 12, 1, 12000),
(424, 118, 13, 1, 5000),
(425, 118, 12, 1, 12000),
(426, 118, 12, 1, 12000),
(427, 118, 12, 1, 12000),
(428, 118, 12, 1, 12000),
(429, 118, 12, 1, 12000),
(430, 118, 12, 1, 12000),
(431, 118, 12, 1, 12000),
(432, 119, 17, 2, 20000),
(433, 119, 13, 3, 5000),
(434, 120, 17, 2, 20000),
(435, 120, 13, 3, 5000),
(436, 121, 13, 3, 5000),
(437, 121, 14, 4, 10000),
(438, 122, 13, 3, 5000),
(439, 122, 14, 4, 10000),
(440, 123, 14, 1, 10000),
(441, 124, 12, 2, 12000),
(442, 125, 12, 3, 12000),
(443, 125, 13, 2, 5000),
(444, 125, 14, 3, 10000),
(445, 126, 12, 2, 12000),
(446, 126, 13, 2, 5000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `divipola`
--

CREATE TABLE `divipola` (
  `idMunicipioDivipola` int(11) NOT NULL,
  `nombreMunicipioDivipola` varchar(60) NOT NULL,
  `nombreDepartamentoDivipola` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `divipola`
--

INSERT INTO `divipola` (`idMunicipioDivipola`, `nombreMunicipioDivipola`, `nombreDepartamentoDivipola`) VALUES
(1, 'Bogotá', 'Cundinamarca'),
(2, 'Medellín', 'Antioquia');

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
  `descripcionPedido` varchar(60) DEFAULT NULL,
  `estadoPedido` tinyint(1) DEFAULT NULL,
  `fechaPedido` date DEFAULT NULL,
  `realizaCompraPedido` tinyint(1) DEFAULT NULL,
  `numeroSeriePedido` varchar(15) DEFAULT NULL,
  `montoPedido` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`idPedido`, `idClienteFK`, `idVendedorFK`, `descripcionPedido`, `estadoPedido`, `fechaPedido`, `realizaCompraPedido`, `numeroSeriePedido`, `montoPedido`) VALUES
(1, 1, 1, 'Compras Online', 1, '2021-12-01', 1, '00000002', 0),
(8, 1, 1, 'Producto', 1, NULL, 1, '00000002', 36),
(9, 1, 1, 'Producto', 1, NULL, 1, '00000003', 36),
(13, 1, 1, 'Producto', 1, NULL, 1, '00000004', 36),
(14, 1, 1, NULL, 1, NULL, 1, '00000004', 36),
(15, 1, 1, 'BOMBILLO BIPIN', 1, NULL, 1, '00000004', 36),
(16, 1, 1, 'tubos', 1, NULL, 1, '00000002', 36),
(17, 1, 1, 'BOMBILLO BIPIN', 1, NULL, 1, '00000002', 30000),
(18, 1, 1, 'BOMBILLO BIPIN', 1, NULL, 1, '00000002', 30000),
(20, 1, 1, 'tubos', 1, NULL, 1, '00000002', 15000),
(21, 1, 1, 'tubos', 1, NULL, 1, '00000002', 5000),
(22, 1, 1, 'tubos', 1, NULL, 1, '00000002', 15000),
(23, 1, 1, 'tubos', 1, NULL, 1, '00000002', 63000),
(24, 1, 1, 'tubos', 1, NULL, 1, '00000002', 73000),
(25, 1, 1, 'tubos', 1, NULL, 1, '00000002', 127000),
(26, 1, 1, 'BOMBILLO BIPIN', 1, NULL, 1, '00000002', 265000),
(27, 1, 1, 'BOMBILLO LED CLÁSICO', 1, NULL, 1, '00000002', 265000),
(28, 1, 1, 'BOMBILLO LED CLÁSICO', 1, NULL, 1, '00000002', 265000),
(29, 1, 1, 'BOMBILLO LED CLÁSICO', 1, NULL, 1, '00000002', 265000),
(30, 1, 1, 'BOMBILLO LED CLÁSICO', 1, NULL, 1, '00000002', 265000),
(31, 1, 1, 'BOMBILLO LED CLÁSICO', 1, NULL, 1, '00000002', 265000),
(32, 1, 1, 'BOMBILLO LED CLÁSICO', 1, NULL, 1, '00000002', 265000),
(33, 1, 1, 'BOMBILLO LED CLÁSICO', 1, NULL, 1, '00000002', 265000),
(34, 1, 1, 'BOMBILLO LED CLÁSICO', 1, NULL, 1, '00000002', 265000),
(35, 1, 1, 'BOMBILLO LED CLÁSICO', 1, NULL, 1, '00000002', 265000),
(36, 1, 1, 'BOMBILLO LED CLÁSICO', 1, NULL, 1, '00000002', 265000),
(37, 1, 1, 'BOMBILLO LED CLÁSICO', 1, NULL, 1, '00000002', 345000),
(38, 1, 1, 'BOMBILLO LED CLÁSICO', 1, NULL, 1, '00000002', 345000),
(39, 1, 1, 'BOMBILLO LED CLÁSICO', 1, NULL, 1, '00000002', 345000),
(40, 1, 1, 'BOMBILLO LED CLÁSICO', 1, NULL, 1, '00000002', 345000),
(41, 1, 1, 'BOMBILLO LED CLÁSICO', 1, NULL, 1, '00000002', 6000),
(42, 1, 1, 'BOMBILLO PAR 30 LED', 1, NULL, 1, '00000002', 27000),
(43, 1, 1, 'BOMBILLO PAR 30 LED', 1, NULL, 1, '00000002', 15000),
(44, 1, 1, 'BOMBILLO PAR 30 LED', 1, NULL, 1, '00000005', 15000),
(45, 1, 1, 'BOMBILLO PAR 30 LED', 1, NULL, 1, '00000006', 15000),
(46, 1, 1, 'BOMBILLO PAR 30 LED', 1, NULL, 1, '00000007', 15000),
(47, 1, 1, NULL, 1, NULL, 1, '00000008', 0),
(48, 1, 1, 'BOMBILLO PAR 30 LED', 1, NULL, 1, '00000009', 15000),
(49, 1, 1, NULL, 1, NULL, 1, '00000010', 0),
(50, 1, 1, 'PANEL LED REDONDO INCRUSTAR', 1, NULL, 1, '00000011', 20000),
(51, 1, 1, 'PANEL LED REDONDO INCRUSTAR', 1, NULL, 1, '00000012', 20000),
(52, 1, 1, 'PANEL LED REDONDO INCRUSTAR', 1, NULL, 1, '00000013', 20000),
(53, 1, 1, 'PANEL LED REDONDO INCRUSTAR', 1, NULL, 1, '00000014', 20000),
(54, 1, 1, 'PANEL LED REDONDO INCRUSTAR', 1, NULL, 1, '00000015', 20000),
(55, 1, 1, 'PANEL LED REDONDO INCRUSTAR', 1, '2021-12-31', 1, '00000016', 40000),
(57, 1, 1, 'BOMBILLO LED CLÁSICO', 1, '2021-12-31', 1, '00000017', 6000),
(75, 1, 1, 'BOMBILLO BIPIN', 1, '2022-01-01', 1, '00000018', 20000),
(76, 2, 1, 'bombillo', 1, '2022-01-01', 1, '00000019', 120000),
(92, 1, 1, 'tubos', 1, '2022-01-03', 1, '00000020', 10000),
(93, 1, 4, 'BOMBILLO LED CLÁSICO', 1, '2022-01-03', 1, '00000021', 6000),
(94, 2, 1, 'tubos', 1, '2022-01-03', 1, '00000022', 20000),
(95, 2, 1, 'BOMBILLO BIPIN', 1, '2022-01-03', 1, '00000023', 35000),
(96, 2, 1, 'PANEL LED REDONDO INCRUSTAR', 1, '2022-01-04', 1, '00000024', 2107000),
(97, 2, 1, 'PANEL LED REDONDO INCRUSTAR', 1, '2022-01-05', 1, '00000025', 583000),
(98, 2, 1, 'PANEL LED REDONDO INCRUSTAR', 1, '2022-01-05', 1, '00000026', 603000),
(99, 2, 1, 'BOMBILLO BIPIN', 1, '2022-01-05', 1, '00000027', 80000),
(100, 2, 1, 'BOMBILLO LED CLÁSICO', 1, '2022-01-05', 1, '00000028', 86000),
(101, 2, 1, 'BOMBILLO PAR 30 LED', 1, '2022-01-05', 1, '00000029', 194000),
(102, 2, 1, 'BOMBILLO LED CLÁSICO', 1, '2022-01-05', 1, '00000030', 88000),
(103, 1, 1, 'BOMBILLO BIPIN', 1, '2022-01-05', 1, '00000031', 44000),
(104, 2, 1, 'PANEL LED REDONDO INCRUSTAR', 1, '2022-01-05', 1, '00000032', 73000),
(105, 2, 1, 'PANEL LED REDONDO INCRUSTAR', 1, '2022-01-05', 1, '00000033', 113000),
(106, 2, 1, 'BOMBILLO LED CLÁSICO', 1, '2022-01-05', 1, '00000034', 66000),
(107, 1, 1, 'tubos', 1, '2022-01-05', 1, '00000035', 76000),
(108, 2, 1, 'BOMBILLO BIPIN', 1, '2022-01-08', 1, '00000036', 17000),
(109, 2, 1, 'bombillo', 1, '2022-01-08', 1, '00000037', 29000),
(110, 2, 1, NULL, 1, '2022-01-08', 1, '00000038', 17000),
(111, 2, 1, '45545', 1, '2022-01-08', 1, '00000039', 17000),
(112, 2, 1, '45545', 1, '2022-01-08', 1, '00000040', 17000),
(113, 1, 1, '45545', 1, '2022-01-08', 1, '00000041', 17000),
(114, 2, 1, '45545', 1, '2022-01-08', 1, '00000042', 29000),
(115, 2, 1, '45545', 1, '2022-01-08', 1, '00000043', 27000),
(116, 1, 1, '45545', 1, '2022-01-08', 1, '00000044', 45000),
(117, 1, 1, '45545', 1, '2022-01-08', 1, '00000045', 17000),
(118, 1, 1, '45545', 1, '2022-01-11', 1, '00000046', 0),
(119, 1, 1, '45545', 1, '2022-01-14', 1, '00000047', 55000),
(120, 1, 1, '45545', 1, '2022-01-14', 1, '00000048', 55000),
(121, 2, 1, '45545', 1, '2022-01-16', 1, '00000049', 55000),
(122, 2, 1, '45545', 1, '2022-01-16', 1, '00000050', 55000),
(123, 2, 1, '45545', 1, '2022-01-16', 1, '00000051', 10000),
(124, 2, 1, '45545', 1, '2022-01-16', 1, '00000052', 24000),
(125, 1, 1, '45545', 1, '2022-01-16', 1, '00000053', 76000),
(126, 2, 1, '45545', 1, '2022-01-16', 1, '00000054', 34000);

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
  `stockProducto` int(11) DEFAULT NULL,
  `codProducto` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `idCategoriaFK`, `idProveedorFK`, `nombreProducto`, `precioProducto`, `descripcionProducto`, `imagenProducto`, `estadoProducto`, `stockProducto`, `codProducto`) VALUES
(12, 1, 1, 'bombillo', 12000, 'prueba_1', 'imagen1724870589119047427avatar-male2.png', 1, 946, 'P01'),
(13, 2, 2, 'tubos', 5000, 'prueba_2', 'imagen14242669004914543189ilu2_T.jpg', 1, 820, 'P02'),
(14, 3, 1, 'BOMBILLO BIPIN', 10000, 'prueba_3', 'imagen15510071486249617441ilu3_T.jpg', 1, 943, 'P03'),
(15, 2, 1, 'BOMBILLO LED CLÁSICO', 6000, 'prueba_4', 'imagen10733735628553457930ilu4_T.jpg', 1, 858, 'P04'),
(16, 1, 1, 'BOMBILLO PAR 30 LED', 15000, 'prueba_5', 'imagen11039786471260507131ilu5_T.jpg', 1, 965, 'P05'),
(17, 4, 3, 'PANEL LED REDONDO INCRUSTAR', 20000, 'prueba_6', 'imagen7972288670169872093img8.jpg', 1, 861, 'P06');

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
(2, 1, 2, 'Bayron', 'Hortua', '202cb962ac59075b964b07152d234b70', '2020', 'calle 55', '200', 'cliente@gmail.com', 1),
(3, 1, 3, 'Yazmin', 'Gonzales', '202cb962ac59075b964b07152d234b70', '3030', 'TV 4 Este No 36 K 28', '6666', 'yaz@gamil.com', 1),
(4, 2, 1, 'Yazmin', 'Gonzales', '202cb962ac59075b964b07152d234b70', '3031', 'carrera 4', '333333', 'y@gamil.com', 1),
(5, 2, 2, 'Carlos', 'Romero', '202cb962ac59075b964b07152d234b70', '897887', '66', '5555555', 'carlos@misena', 1),
(6, 1, 1, 'jesus', 'mass', '202cb962ac59075b964b07152d234b70', '45545', '55', '988987', 'mauriciomass@misena.edu.co', 1),
(7, 1, 1, 'Alfredo', 'Gutierrez Miranda', '202cb962ac59075b964b07152d234b70', '58752451', '89', '8525452', 'jesusmmass@gmail.com1', 1),
(8, 1, 2, 'Luis', 'Fonseca', '202cb962ac59075b964b07152d234b70', '5484512', '33', '8525452', 'jesusmmass@gmail.com2', 1),
(18, 1, 2, 'Karla', 'Gomez', '202cb962ac59075b964b07152d234b70', '5875245', '32655', '8525452', 'jesusmmass@gmail.com3', 1),
(19, 2, 3, 'Lucresia', 'Arroyo', '202cb962ac59075b964b07152d234b70', '5565322', '22', '11', 'jesusmmass@gmail.com', 1),
(31, 1, 3, 'Belinda', 'Garcia', '202cb962ac59075b964b07152d234b70', '9955', '55', '11', 'belinda@micorreo.com', 1),
(32, 2, 2, 'Manuel', 'Perez', '202cb962ac59075b964b07152d234b70', '4324567', '89', '988987', 'manuel@manuel1.com', 1),
(33, 1, 1, 'Vanesa', 'Lopez', '202cb962ac59075b964b07152d234b70', '5484512', '89', '8525452', 'lopezvan@van', 1),
(34, 1, 3, 'Jonatan', 'Mendez', '202cb962ac59075b964b07152d234b70', '6556', '33', '11', 'jonatan@jo', 1),
(35, 1, 3, 'Alirio', 'Perpetuo', '202cb962ac59075b964b07152d234b70', '5677', '66', '98751', 'alirio@alirio', 1),
(36, 2, 3, 'Cristina', 'Volpedo', '202cb962ac59075b964b07152d234b70', '76692', '78', '9756', 'CristVol@cris', 1),
(37, 1, 3, 'Bambi', 'Leiton', '202cb962ac59075b964b07152d234b70', '89765', '544', '543465', 'leiton@leiton', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedor`
--

CREATE TABLE `vendedor` (
  `idVendedor` int(11) NOT NULL,
  `idUsuarioFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `vendedor`
--

INSERT INTO `vendedor` (`idVendedor`, `idUsuarioFK`) VALUES
(2, 5),
(1, 6),
(3, 8),
(4, 18),
(5, 32);

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
  MODIFY `idAdministrador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  MODIFY `idDetallePedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=447;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `idPago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  MODIFY `idVendedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
