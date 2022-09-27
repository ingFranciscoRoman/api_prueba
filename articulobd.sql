-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.33 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla articulobd.articulos
CREATE TABLE IF NOT EXISTS `articulos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cod_producto` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `precio` int(10) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla articulobd.articulos: ~10 rows (aproximadamente)
DELETE FROM `articulos`;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
INSERT INTO `articulos` (`id`, `cod_producto`, `descripcion`, `precio`, `stock`) VALUES
	(1, 'cod_5', 'DESCRIPCION DE DATOS DEL PRODUCTO', 530000, 15),
	(5, 'cod_4', 'Platanos Amarillos', 1200, 600),
	(6, 'ABP10', 'PRODUCTO UNO  QUE ESTA EN BD', 530000, 15),
	(7, 'ABP11', 'PRODUCTO DOS  QUE ESTA EN BD', 530000, 15),
	(8, 'ABP12', 'PRODUCTO TRES QUE ESTA EN BD', 530000, 15),
	(9, 'ABP13', 'PRODUCTO CUATRO QUE ESTA EN BD', 530000, 15),
	(11, 'ABP15', 'PRODUCTO CINCO QUE ESTA EN BD', 530000, 15),
	(18, 'ABP15', 'PRODUCTO SEIS QUE ESTA EN BD', 530000, 15),
	(20, 'green', 'PRODUCTO SIETE QUE ESTA EN BD', 190000, 5),
	(21, 'cod_10', 'XXXXXX XXXXX', 350000, 50);
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;

-- Volcando estructura para tabla articulobd.libros
CREATE TABLE IF NOT EXISTS `libros` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagen` varchar(2500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla articulobd.libros: ~0 rows (aproximadamente)
DELETE FROM `libros`;
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;

-- Volcando estructura para tabla articulobd.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla articulobd.migrations: ~0 rows (aproximadamente)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2022_09_22_092143_libros', 1),
	(2, '2022_09_22_161301_user', 2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Volcando estructura para tabla articulobd.tipousuario
CREATE TABLE IF NOT EXISTS `tipousuario` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoUser` varchar(100) DEFAULT NULL,
  `descripcionUser` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla articulobd.tipousuario: ~2 rows (aproximadamente)
DELETE FROM `tipousuario`;
/*!40000 ALTER TABLE `tipousuario` DISABLE KEYS */;
INSERT INTO `tipousuario` (`id_user`, `nombreTipoUser`, `descripcionUser`) VALUES
	(1, 'Administrador', 'Administrados del Sistema'),
	(2, 'empleado', 'Empleado'),
	(3, 'Colaborador', 'Colaborador del Sistema');
/*!40000 ALTER TABLE `tipousuario` ENABLE KEYS */;

-- Volcando estructura para tabla articulobd.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_user_r` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `FK_users_tipousuario` (`id_user_r`),
  CONSTRAINT `FK_users_tipousuario` FOREIGN KEY (`id_user_r`) REFERENCES `tipousuario` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla articulobd.users: ~4 rows (aproximadamente)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `api_token`, `remember_token`, `created_at`, `updated_at`, `id_user_r`) VALUES
	(1, 'Francisco Roman', 'franciscoroman@gmail.com', NULL, '$2y$10$U6H2R3OpT8kyQAg.R1g.H.uKojv0KD7PpB17fog0nPflGZ9sqB9Oq', 'rN0qi9osc2Orj7rwR87uaz2z85TKrrB1BhAUucCRiD6A9b7P1VHBEeNRm9Ec8G6QWqrJSsvoWgRsTK8NOBJnL1zhzmm6KWvKtfBFH36bIoqVtAOvpxzxgvPpHjlQFqwbDZD5ZygRvWzbredYJtzw47', NULL, '2022-09-22 11:53:26', '2022-09-27 05:19:37', 1),
	(2, 'Ana Martinez', 'anamartinez@gmail.com', NULL, '$2y$10$EOSM2evj0nBAQW0BJZdYhem3sV4./T6goibJo3Q6puvhAX/3TYECi', NULL, NULL, '2022-09-22 11:56:36', '2022-09-26 04:25:53', 2),
	(4, 'Johanna Espinosa', 'johannaespinosa@gmail.com', NULL, '$2y$10$U2cj3fflphY75cCw2Ec6redMhoNldLyQjwKxdfiMI3jl9ZYFaIrhK', NULL, NULL, '2022-09-22 11:58:15', '2022-09-22 11:58:15', 2),
	(5, 'Carolina Espinosa', 'carolinaesme@gmail.com', NULL, '$2y$10$BRoNjJnRuTcEPOkwDmVbqOJDkE/nIUIx9NzJ.zmElLomu1Kb6Bupa', NULL, NULL, '2022-09-26 04:30:20', '2022-09-27 04:20:25', 2),
	(8, 'Angelica Fernandez', 'angelicafernandez@gmail.com', NULL, '$2y$10$Vq93rlobSG1JRcwqScpDnedpNugyjjNO3blbaLeaV3LhNogkB.bqa', NULL, NULL, '2022-09-27 05:16:27', '2022-09-27 05:16:27', 2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
