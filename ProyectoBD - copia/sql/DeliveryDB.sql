-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: aplicacion_domicilio
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `id_direccion` int NOT NULL AUTO_INCREMENT,
  `Departamento` varchar(45) NOT NULL,
  `Municipio` varchar(60) NOT NULL,
  `Colonia` varchar(60) NOT NULL,
  `Numero_casa` int NOT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id_direccion`),
  KEY `fk_direccion_info_clientes1_idx` (`id_usuario`),
  CONSTRAINT `fk_direccion_info_clientes1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1,'La Libertad','Santa Tecla','San José',89,1),(2,'San Salvador','Soyapango','San José',45,3),(3,'San Salvador','Soyapango','La campanera',7,1),(4,'San Vicente','San Sebastian','Guadalupe',24,8);
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `or_pro_re`
--

DROP TABLE IF EXISTS `or_pro_re`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `or_pro_re` (
  `id_or_pro_re` int NOT NULL,
  `id_codigo_orden` int NOT NULL,
  `id_repartidor` int NOT NULL,
  `id_producto` int NOT NULL,
  `id_usuario` int NOT NULL,
  `id_direccion` int NOT NULL,
  PRIMARY KEY (`id_or_pro_re`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `or_pro_re`
--

LOCK TABLES `or_pro_re` WRITE;
/*!40000 ALTER TABLE `or_pro_re` DISABLE KEYS */;
/*!40000 ALTER TABLE `or_pro_re` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden`
--

DROP TABLE IF EXISTS `orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden` (
  `id_orden` int NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `Datetime` timestamp NOT NULL,
  `id_producto` int NOT NULL,
  PRIMARY KEY (`id_orden`),
  KEY `fk_id_producto_idx` (`id_producto`),
  CONSTRAINT `fk_id_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden`
--

LOCK TABLES `orden` WRITE;
/*!40000 ALTER TABLE `orden` DISABLE KEYS */;
INSERT INTO `orden` VALUES (9,3,9.00,'SE','2020-08-24 15:46:07',6),(11,4,8.00,'SE','2020-08-25 18:02:38',1),(12,5,10.00,'SE','2020-08-25 18:03:41',1),(13,1,6.00,'SE','2020-08-25 20:38:13',7);
/*!40000 ALTER TABLE `orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_productos`
--

DROP TABLE IF EXISTS `orden_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_productos` (
  `codigo_orden` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `id_orden` int NOT NULL,
  `id_usuario` int NOT NULL,
  `id_direccion` int NOT NULL,
  PRIMARY KEY (`codigo_orden`),
  KEY `fk_Orden_productos_Productos1_idx` (`id_producto`),
  KEY `fk_Orden_productos_Orden1_idx` (`id_orden`),
  KEY `fk_orden_productos_usuario1_idx` (`id_usuario`),
  KEY `fk_id_direccion_idx` (`id_direccion`),
  CONSTRAINT `fk_id_direccion` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`),
  CONSTRAINT `fk_Orden_productos_Orden1` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id_orden`),
  CONSTRAINT `fk_Orden_productos_Productos1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `fk_orden_productos_usuario1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_productos`
--

LOCK TABLES `orden_productos` WRITE;
/*!40000 ALTER TABLE `orden_productos` DISABLE KEYS */;
INSERT INTO `orden_productos` VALUES (9,6,9,1,1),(11,1,11,1,1),(12,1,12,1,3),(13,7,13,3,2);
/*!40000 ALTER TABLE `orden_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `precio` decimal(6,2) NOT NULL,
  `existencia` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,100,2.00,'Sí','Sopa de mariscos'),(5,120,2.45,'Sí','Tacos al Pastor'),(6,150,3.00,'Sí','Churrasco'),(7,50,6.00,'Sí','Rib Eye');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `repartidor_view`
--

DROP TABLE IF EXISTS `repartidor_view`;
/*!50001 DROP VIEW IF EXISTS `repartidor_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `repartidor_view` AS SELECT 
 1 AS `id_usuario`,
 1 AS `Nombre`,
 1 AS `Apellido`,
 1 AS `id_orden`,
 1 AS `cantidad`,
 1 AS `total`,
 1 AS `estado`,
 1 AS `id_producto`,
 1 AS `Producto`,
 1 AS `id_direccion`,
 1 AS `Departamento`,
 1 AS `Municipio`,
 1 AS `Colonia`,
 1 AS `Numero_casa`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `root_view`
--

DROP TABLE IF EXISTS `root_view`;
/*!50001 DROP VIEW IF EXISTS `root_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `root_view` AS SELECT 
 1 AS `id_usuario`,
 1 AS `Nombre`,
 1 AS `Apellido`,
 1 AS `Telefono_usuario`,
 1 AS `id_orden`,
 1 AS `cantidad`,
 1 AS `total`,
 1 AS `estado`,
 1 AS `Fecha_pedido`,
 1 AS `id_producto`,
 1 AS `Producto`,
 1 AS `id_direccion`,
 1 AS `Departamento`,
 1 AS `Municipio`,
 1 AS `Colonia`,
 1 AS `Numero_casa`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sugerencias`
--

DROP TABLE IF EXISTS `sugerencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sugerencias` (
  `idsugerencias` int NOT NULL,
  `email` varchar(70) NOT NULL,
  `asunto` varchar(45) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  PRIMARY KEY (`idsugerencias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sugerencias`
--

LOCK TABLES `sugerencias` WRITE;
/*!40000 ALTER TABLE `sugerencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `sugerencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Apellido` varchar(70) NOT NULL,
  `Telefono` varchar(70) NOT NULL,
  `Email` varchar(60) NOT NULL,
  `Contrasena` varchar(80) NOT NULL,
  `Tipo_usuario` varchar(45) NOT NULL,
  `placa_vehiculo` int DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Francisco','Murillo','72814994','frank@gmail.com','12345','cliente',1),(2,'Oscar','Franco','79631587','oscar@hotmail.com','456','root',1),(3,'Alexander','Petrov','79651285','petrov@yahoo.es','123','cliente',1),(4,'Azaela','Greenwich','79486312','aza@green.com','159','root',1),(5,'Alexei','Ivanov','79461536','alex@ivan.com','753','repartidor',789456),(6,'Vladimir ','Ikenko','72584636','vlad@hotmail.com','4986','repartidor',569624),(7,'Jesus','Barahona','75757575','jesus@gmail.com','09876','repartidor',456784),(8,'Andrea','Lopez','88888888','andrea@gmail.com','00000','cliente',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `repartidor_view`
--

/*!50001 DROP VIEW IF EXISTS `repartidor_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `repartidor_view` AS select `d`.`id_usuario` AS `id_usuario`,`d`.`Nombre` AS `Nombre`,`d`.`Apellido` AS `Apellido`,`a`.`id_orden` AS `id_orden`,`a`.`cantidad` AS `cantidad`,`a`.`total` AS `total`,`a`.`estado` AS `estado`,`c`.`id_producto` AS `id_producto`,`c`.`nombre` AS `Producto`,`e`.`id_direccion` AS `id_direccion`,`e`.`Departamento` AS `Departamento`,`e`.`Municipio` AS `Municipio`,`e`.`Colonia` AS `Colonia`,`e`.`Numero_casa` AS `Numero_casa` from ((((`orden` `a` join `orden_productos` `b` on((`a`.`id_orden` = `b`.`id_orden`))) join `productos` `c` on((`b`.`id_producto` = `c`.`id_producto`))) join `usuario` `d` on((`b`.`id_usuario` = `d`.`id_usuario`))) join `direccion` `e` on((`d`.`id_usuario` = `e`.`id_usuario`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `root_view`
--

/*!50001 DROP VIEW IF EXISTS `root_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `root_view` AS select `d`.`id_usuario` AS `id_usuario`,`d`.`Nombre` AS `Nombre`,`d`.`Apellido` AS `Apellido`,`d`.`Telefono` AS `Telefono_usuario`,`a`.`id_orden` AS `id_orden`,`a`.`cantidad` AS `cantidad`,`a`.`total` AS `total`,`a`.`estado` AS `estado`,`a`.`Datetime` AS `Fecha_pedido`,`c`.`id_producto` AS `id_producto`,`c`.`nombre` AS `Producto`,`e`.`id_direccion` AS `id_direccion`,`e`.`Departamento` AS `Departamento`,`e`.`Municipio` AS `Municipio`,`e`.`Colonia` AS `Colonia`,`e`.`Numero_casa` AS `Numero_casa` from ((((`orden` `a` join `orden_productos` `b` on((`a`.`id_orden` = `b`.`id_orden`))) join `productos` `c` on((`b`.`id_producto` = `c`.`id_producto`))) join `usuario` `d` on((`b`.`id_usuario` = `d`.`id_usuario`))) join `direccion` `e` on((`b`.`id_direccion` = `e`.`id_direccion`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-25 17:17:43
