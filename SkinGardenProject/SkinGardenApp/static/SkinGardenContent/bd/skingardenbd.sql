-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-11-2024 a las 17:36:57
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `skingardenbd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(5) NOT NULL,
  `nom_admin` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `ape_admin` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `dir_admin` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `correo_admin` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `tel_admin` int(11) NOT NULL,
  `user_admin` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `pwd_admin` varchar(30) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`id_admin`, `nom_admin`, `ape_admin`, `dir_admin`, `correo_admin`, `tel_admin`, `user_admin`, `pwd_admin`) VALUES
(1, 'Yorkenis', 'ElMejor', 'Santiago de los caballeros, su casa', 'elmejordetodos@gmail.com', 809, 'yorkenis', '123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add admin', 7, 'add_admin'),
(26, 'Can change admin', 7, 'change_admin'),
(27, 'Can delete admin', 7, 'delete_admin'),
(28, 'Can view admin', 7, 'view_admin'),
(29, 'Can add carritocompra', 8, 'add_carritocompra'),
(30, 'Can change carritocompra', 8, 'change_carritocompra'),
(31, 'Can delete carritocompra', 8, 'delete_carritocompra'),
(32, 'Can view carritocompra', 8, 'view_carritocompra'),
(33, 'Can add categorias', 9, 'add_categorias'),
(34, 'Can change categorias', 9, 'change_categorias'),
(35, 'Can delete categorias', 9, 'delete_categorias'),
(36, 'Can view categorias', 9, 'view_categorias'),
(37, 'Can add facturas', 10, 'add_facturas'),
(38, 'Can change facturas', 10, 'change_facturas'),
(39, 'Can delete facturas', 10, 'delete_facturas'),
(40, 'Can view facturas', 10, 'view_facturas'),
(41, 'Can add productos', 11, 'add_productos'),
(42, 'Can change productos', 11, 'change_productos'),
(43, 'Can delete productos', 11, 'delete_productos'),
(44, 'Can view productos', 11, 'view_productos'),
(45, 'Can add usuario', 12, 'add_usuario'),
(46, 'Can change usuario', 12, 'change_usuario'),
(47, 'Can delete usuario', 12, 'delete_usuario'),
(48, 'Can view usuario', 12, 'view_usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$DzkP9fDua9zQiuNTWaaNiy$eihtz7r4skAzRTOAbxCTrgUoe9IbcKwp7c5pOoDBqwA=', '2024-11-08 12:12:21.089484', 1, 'yorkenis', '', '', 'notiene@gmail.com', 1, 1, '2024-11-08 12:09:47.205916');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carritocompra`
--

CREATE TABLE `carritocompra` (
  `id_carritoCompras` int(5) NOT NULL,
  `id_producto` int(5) NOT NULL,
  `id_usuario` int(5) NOT NULL,
  `cantidad` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `carritocompra`
--

INSERT INTO `carritocompra` (`id_carritoCompras`, `id_producto`, `id_usuario`, `cantidad`) VALUES
(1, 6, 3, 5),
(2, 19, 3, 3),
(3, 1, 3, 2),
(4, 32, 3, 2),
(5, 15, 1, 1),
(6, 32, 1, 1),
(7, 18, 1, 1),
(8, 25, 1, 1),
(9, 14, 4, 1),
(10, 29, 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(5) NOT NULL,
  `nom_categoria` varchar(30) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nom_categoria`) VALUES
(1, 'Limpiadores'),
(2, 'Anti-Imperfecciones'),
(3, 'Hidratación de Cuerpo'),
(4, 'Hidratación de Rostro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'SkinGardenApp', 'admin'),
(8, 'SkinGardenApp', 'carritocompra'),
(9, 'SkinGardenApp', 'categorias'),
(10, 'SkinGardenApp', 'facturas'),
(11, 'SkinGardenApp', 'productos'),
(12, 'SkinGardenApp', 'usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'SkinGardenApp', '0001_initial', '2024-11-07 12:54:19.459319'),
(2, 'contenttypes', '0001_initial', '2024-11-07 12:54:19.813453'),
(3, 'auth', '0001_initial', '2024-11-07 12:54:25.782579'),
(4, 'admin', '0001_initial', '2024-11-07 12:54:26.843980'),
(5, 'admin', '0002_logentry_remove_auto_add', '2024-11-07 12:54:26.996150'),
(6, 'admin', '0003_logentry_add_action_flag_choices', '2024-11-07 12:54:27.141734'),
(7, 'contenttypes', '0002_remove_content_type_name', '2024-11-07 12:54:27.844015'),
(8, 'auth', '0002_alter_permission_name_max_length', '2024-11-07 12:54:28.469060'),
(9, 'auth', '0003_alter_user_email_max_length', '2024-11-07 12:54:29.134661'),
(10, 'auth', '0004_alter_user_username_opts', '2024-11-07 12:54:29.225068'),
(11, 'auth', '0005_alter_user_last_login_null', '2024-11-07 12:54:29.781748'),
(12, 'auth', '0006_require_contenttypes_0002', '2024-11-07 12:54:29.813145'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2024-11-07 12:54:29.903332'),
(14, 'auth', '0008_alter_user_username_max_length', '2024-11-07 12:54:30.531604'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2024-11-07 12:54:31.485314'),
(16, 'auth', '0010_alter_group_name_max_length', '2024-11-07 12:54:32.094404'),
(17, 'auth', '0011_update_proxy_permissions', '2024-11-07 12:54:32.162673'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2024-11-07 12:54:32.609986'),
(19, 'sessions', '0001_initial', '2024-11-07 12:54:32.954464');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('cb1amnrs82wr3y0fnw1tt8wzr2d3yk8n', '.eJxVjEEOwiAQRe_C2hCmQJm4dO8ZyMAMUjU0Ke3KeHdt0oVu_3vvv1Skba1x67LEidVZgTr9bonyQ9oO-E7tNus8t3WZkt4VfdCurzPL83K4fweVev3WHgHs4HwaAwMkYS9jTmyCCVmQnC8uQy7FuoEKEVkJxQEiGUsB0aj3B-VoOCE:1t9Nqf:yMescER6IB04nO9H7-TJFKmJhS0u_jZQbZ-tX7D_Ztw', '2024-11-22 12:12:21.133221'),
('eh4iq8uqamxav1z1g2pdg5pdow00ux37', 'eyJpZF9hZG1pbiI6MX0:1tFwER:r1EIOgVf7hqBwg8Pnuh1YAmwzYGeR7OaT2rPNJ9CM3I', '2024-12-10 14:07:59.467628'),
('ggvp588cthajhmias89ygsi0hym15ocq', 'eyJpZF9hZG1pbiI6MX0:1tE7s9:R3kOGO-0zW1LP0KoeWkWLEUhRDHR7tg_K3LYmmCTp0M', '2024-12-05 14:09:29.693057'),
('q9ih4uk0uwbn62ppifmn3soyqfqpa7zu', 'eyJpZF9hZG1pbiI6MX0:1tFyYM:dSOeqm4kVMeTnmpBOfRFOz3q4prArznkbnqvxzFaXaI', '2024-12-10 16:36:42.288212'),
('su5esd9o2afn1a9zk4645447v6btt2l3', 'eyJ1c3VhcmlvX2lkIjoyLCJpZF9hZG1pbiI6MX0:1tBbDh:rs4CNHjaM82p6J_YYkGT6Be_Q061slAhJbs84x21Fwo', '2024-11-28 14:53:17.013663'),
('t7dbj24wrrj09gprk77qemczwd2ozpri', 'eyJpZF9hZG1pbiI6MSwidXN1YXJpb19pZCI6Mn0:1tFc0M:qO9uXoNeS-CRWhsKe_cbSAzEptshw7jHasbHEKBfNgI', '2024-12-09 16:32:06.218568');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `id_factura` int(5) NOT NULL,
  `id_producto` int(5) NOT NULL,
  `id_usuario` int(5) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`id_factura`, `id_producto`, `id_usuario`, `fecha`) VALUES
(1, 18, 2, '2024-09-06 04:19:01'),
(2, 14, 6, '2024-09-15 04:22:16'),
(3, 16, 2, '2024-09-30 13:10:30'),
(4, 22, 1, '2024-09-30 08:34:10'),
(5, 25, 5, '2024-09-01 15:28:12'),
(6, 13, 4, '2024-08-14 07:15:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_productos` int(5) NOT NULL,
  `nom_producto` varchar(600) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(400) COLLATE utf8_spanish_ci NOT NULL,
  `precio` float(10,0) NOT NULL,
  `id_categoria` int(5) NOT NULL,
  `calificacion` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `estado` char(6) COLLATE utf8_spanish_ci NOT NULL,
  `descuento` int(10) NOT NULL,
  `fecha_pub` date NOT NULL,
  `imagen` varchar(500) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_productos`, `nom_producto`, `descripcion`, `precio`, `id_categoria`, `calificacion`, `estado`, `descuento`, `fecha_pub`, `imagen`) VALUES
(1, 'Cetaphil Locion Limpiadora', 'Ha sido clínicamente probada para proporcionar una hidratación continua que protege contra la sequedad.', 1235, 1, '★★★★★', 'old', 0, '2024-02-10', 'productos_imagenes/limpiadores/limpiador1.png'),
(2, 'Gel Limpiador Espumoso', 'Un limpiador facial espumoso es ideal para eliminar el exceso de grasa, suciedad y maquillaje, y elegir uno que sea suave.', 988, 1, '☆☆☆☆☆', 'old', 0, '2024-01-17', 'productos_imagenes/limpiadores/cleanser-espumoso.png'),
(3, 'Limpiador en Aceite Espumoso', 'Tiene una textura de aceite a espuma que limpia e hidrata la piel sin dejar sensación grasa.', 2135, 1, '★★☆☆☆', 'old', 0, '2024-05-28', 'productos_imagenes/limpiadores/limpiador3.png'),
(4, 'Effclar Gel Limpiador Purifica', 'Gel Limpiador purificante, ahora con el nuevo ingrediente activo Phylobioma, potenciado por la ciencia del microbioma.', 2325, 1, '★★★★☆', 'old', 465, '2023-10-11', 'productos_imagenes/limpiadores/limpiador6.png'),
(5, 'Effclar Gel Purificante Micro-Peeling', 'Purifica intensamente la piel grasa, desobstruye los poros en profundidad y elimina el exceso de sebo.', 1372, 1, '★☆☆☆☆', 'new', 0, '2024-08-09', 'productos_imagenes/limpiadores/limpiador4.png'),
(6, 'Agua Micelar Hidratante', 'Forma ultrasuave que elimina el exceso de grasa, suciedad y maquillaje sin tener que enjuagar.', 2300, 1, '☆☆☆☆☆', 'old', 0, '2023-07-24', 'productos_imagenes/limpiadores/agua-micelar.png'),
(7, 'Liquid Neutrogena', 'Liquid Neutrogena es un limpiador suave y puro que deja la piel limpia, libre de impurezas y con un aspecto mejor.', 1890, 1, '☆☆☆☆☆', 'old', 378, '2024-04-02', 'productos_imagenes/limpiadores/liquidN.png'),
(8, 'Neutrogena Hydro Boost Cleansing Gel & Oil-Free', 'Aumenta el nivel de hidratación para lograr una piel suave y saludable con este limpiador.', 1335, 1, '★★★★☆', 'new', 0, '2024-08-21', 'productos_imagenes/hidratacion-cuerpo/hidratacion-cuerpo7.png'),
(9, 'Crema Reparadora Contorno de Ojos', 'Hidrata el contorno de ojos, al mismo que ayuda a reducir las bolsas y ojeras, con Ácido Hialurónico, para humectar la zona.', 853, 4, '★★★★★', 'old', 0, '2024-09-16', 'productos_imagenes/hidratacion-rostro/hidratacion-rostro1.png'),
(10, 'Sérum Hidratante con Ácido Hialurónico', 'Con Ácido Hialurónico de CeraVe ayuda a hidratar la piel durante 24h, mientras restaura la barrera protectora.', 1476, 4, '★★★★★', 'old', 0, '2024-09-21', 'productos_imagenes/hidratacion-rostro/hidratacion-rostro2.png'),
(11, 'Cetaphil Pro Itch Control Locion Hidratante', 'Loción hidratante de uso diario que nutre, alivia y calma las pieles atópicas, muy secas y sensibles de forma duradera.', 1111, 4, '★★☆☆☆', 'old', 0, '2024-07-18', 'productos_imagenes/hidratacion-rostro/hidratacion-rostro3.png'),
(12, 'Lipkar Gel de Ducha', 'Neutraliza los efectos nocivos del agua dura. Limpieza suave y piel nutrida nada más salir de la ducha.', 1159, 4, '★★★★☆', 'old', 0, '2024-09-30', 'productos_imagenes/hidratacion-rostro/hidratacion-rostro4.png'),
(13, 'Espuma Micelar', 'Agua micelar limpiadora y desmaquillante en espuma para pieles sensibles. Testado bajo control dermatológico.', 1210, 4, '★★★★☆', 'old', 0, '2024-09-03', 'productos_imagenes/hidratacion-rostro/hidratacion-rostro5.png'),
(14, 'Cetaphil Pro Oil Control Hidratante SPF 30', 'Esta fórmula ligera y no grasa se absorbe rápidamentea a medida que hidrata la piel.', 2135, 4, '★★★☆☆', 'new', 427, '2024-09-30', 'productos_imagenes/hidratacion-rostro/hidratacion-rostro6.png'),
(15, 'Cetaphil Exfoliante Facial Suave', 'para eliminar la suciedad, la grasa y las impurezas mientras los gránulos microfinos exfolian suavemente.', 1000, 4, '★★★☆☆', 'old', 0, '2024-08-13', 'productos_imagenes/hidratacion-rostro/hidratacion-rostro7.png'),
(16, 'Cetaphil Pan Dermatologico', 'formulado para limpiar suavemente el rostro y el cuerpo sin resecar la piel y conservar la barrera protectora natural de la piel.', 1845, 4, '★★★☆☆', 'old', 0, '2024-05-14', 'productos_imagenes/hidratacion-rostro/hidratacion-rostro8.png'),
(17, 'Bálsamo Reparador Avanzado', 'Protege, hidrata y alivia inmediatamente las pieles extremadamente secas, irritadas o agrietadas.', 1199, 3, '★☆☆☆☆', '0', 0, '2024-03-13', 'productos_imagenes/hidratacion-cuerpo/hidratacion-cuerpo1.png'),
(18, 'Cetaphil Crema Hidratante', 'Mejora significativamente la barrera cutánea, con un restablecimiento completo en una semana.', 1122, 3, '★☆☆☆☆', '0', 0, '2023-12-15', 'productos_imagenes/hidratacion-cuerpo/hidratacion-cuerpo2.png'),
(19, 'Cetaphil Daily Advance', 'Loción nutritiva con 9 ingredientes hidratantes, incluyendo manteca de karité, vitaminas E, niacinamida (vitamina B3) y pantenol (provitamina B5). ', 1098, 3, '★☆☆☆☆', 'old', 0, '2024-07-23', 'productos_imagenes/hidratacion-cuerpo/hidratacion-cuerpo3.png'),
(20, 'Cetaphil Pro Red-Ness Control', 'Para pieles sensibles con tendencia al enrojecimiento. Limpia suavemente para eliminar la suciedad, las impurezas  y el exceso de grasa sin resecar.', 1259, 3, '★★★★★', 'old', 0, '2024-05-28', 'productos_imagenes/hidratacion-cuerpo/hidratacion-cuerpo4.png'),
(21, 'Lipikar Syndet AP+', 'Crema de lavado para recién nacidos, bebés, niños y adultos con pieles atópicas con tendencia al eczema.', 2057, 3, '★★★★★', 'old', 0, '2024-04-27', 'productos_imagenes/hidratacion-cuerpo/hidratacion-cuerpo5.png'),
(22, 'Crema Hidratante', 'Crema hidratante rica, no grasa y de rápida absorción para pieles Secas a muy secas del rostro.\r\n', 2150, 3, '★★★★★', 'old', 0, '2024-07-06', 'productos_imagenes/hidratacion-cuerpo/hidratacion-cuerpo6.png'),
(23, 'Neutrogena Hydro Boost Whipped', ' la fórmula hidratante aterciopelada y ligera se absorbe instantáneamente en la piel para una piel suave y flexible intensamente repuesta.\r\n', 3100, 3, '★★★★★', 'new', 620, '2024-09-18', 'productos_imagenes/hidratacion-cuerpo/hidratacion-cuerpo7.png'),
(24, 'Neutrogena Hydro Boost Body Gel Cream', 'Fórmula de gel corporal refrescante y ultraligera alimentada por ácido hialurónico.\r\n\r\n', 3260, 3, '★★★★★', 'new', 652, '2024-09-01', 'productos_imagenes/hidratacion-cuerpo/hidratacion-cuerpo8.png'),
(25, 'Anthelios Oil Correct SPF 50+', 'La nueva generación de protectores solares que protege del fotoenvejecimiento inducido por la exposición solar diaria.', 2690, 2, '★★★★★', 'new', 538, '2024-09-14', 'productos_imagenes/anti-imperfecciones/anti-impe1.png'),
(26, 'Anthelios Age Correct SPF 50', 'Protección de amplio espectro y activos dermatológicos correctores, con Ácido Hialurónico.', 2600, 2, '★☆☆☆☆', 'new', 520, '2024-09-30', 'productos_imagenes/anti-imperfecciones/anti-impe2.png'),
(27, 'Limpiador Control Imperfecciones', 'Un exfoliante eficaz que ayuda a eliminar las células muertas y el sebo, reduce los puntos negros.', 1345, 2, '☆☆☆☆☆', 'old', 0, '2023-11-08', 'productos_imagenes/anti-imperfecciones/anti-impe3.png'),
(28, 'Gel Control Imperfecciones', 'Tratamiento en gel transparente que ayuda a desobstruir los poros, mejora la apariencia de las imperfecciones.', 745, 2, '★★★☆☆', 'old', 0, '2024-03-02', 'productos_imagenes/anti-imperfecciones/anti-impe4.png'),
(29, 'Anthelios Uvmune 400 Fluido Invisible SPF 50+ Sin Perfume', 'Protección de amplio espectro que ayuda a prevenir daños causados por los rayos UVA.', 2440, 2, '★★★☆☆', 'old', 0, '2024-06-14', 'productos_imagenes/anti-imperfecciones/anti-impe5.png'),
(31, 'Neutrogena Rapid Wrinkle Repair', 'Mejora los signos del envejecimiento de la piel alrededor de los ojos con esta crema con retinol.', 1181, 2, '★★☆☆☆', 'old', 0, '2024-07-14', 'productos_imagenes/anti-imperfecciones/anti-impe6.png'),
(32, 'Effclar Duo +', 'Reduce visiblemente las imperfecciones, controla el brillo y ayuda a reducir la aparición de marcas.', 1162, 2, '★☆☆☆☆', 'old', 0, '2024-01-07', 'productos_imagenes/anti-imperfecciones/anti-impe7.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(5) NOT NULL,
  `nom_usuario` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `ape_usuario` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `dir_usuario` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `correo_usuario` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `tel_usuario` int(11) NOT NULL,
  `user_usuario` varchar(21) COLLATE utf8_spanish_ci NOT NULL,
  `pwd_usuario` varchar(21) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nom_usuario`, `ape_usuario`, `dir_usuario`, `correo_usuario`, `tel_usuario`, `user_usuario`, `pwd_usuario`) VALUES
(1, 'Yeremy', 'Peralta Baez', 'Santiago, Don Pedro', 'yeremaia@gmail.com', 829, 'yere', '123'),
(2, 'Jeyfferson', 'Gomez', 'Bonao', 'xxGomezxx@gmail.com', 829, 'jey', '12345'),
(3, 'Ambar', 'Perez', 'Santo Domingo', 'ambarez@gmail.com', 809, 'amabarez', '54321'),
(4, 'Mario', 'Betances', 'Santiago', 'mariobross@outlook.c', 849, 'mariobross', 'mario'),
(5, 'Tocayo', 'Hernandez', 'Santiago', 'tocagallo@outlook.co', 809, 'tocayito', 'tocayo1'),
(6, 'Azael', 'Vasquez', 'Santiago', 'azaelito@gmail.com', 829, 'azael', '123321');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `carritocompra`
--
ALTER TABLE `carritocompra`
  ADD PRIMARY KEY (`id_carritoCompras`),
  ADD KEY `id_producto` (`id_producto`,`id_usuario`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `id_producto` (`id_producto`,`id_usuario`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_productos`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carritocompra`
--
ALTER TABLE `carritocompra`
  MODIFY `id_carritoCompras` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `id_factura` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_productos` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `carritocompra`
--
ALTER TABLE `carritocompra`
  ADD CONSTRAINT `carritocompra_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `carritocompra_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_productos`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_productos`),
  ADD CONSTRAINT `facturas_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
