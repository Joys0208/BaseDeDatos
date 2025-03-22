-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: elecciones_2026
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Temporary view structure for view `candidato_partido_departamento`
--

DROP TABLE IF EXISTS `candidato_partido_departamento`;
/*!50001 DROP VIEW IF EXISTS `candidato_partido_departamento`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `candidato_partido_departamento` AS SELECT 
 1 AS `nombre`,
 1 AS `id_partido`,
 1 AS `nombre_completo`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `candidatos`
--

DROP TABLE IF EXISTS `candidatos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidatos` (
  `id_candidato` int NOT NULL,
  `nombre_completo` varchar(300) NOT NULL,
  `id_partido` int NOT NULL,
  `id_departamento` int NOT NULL,
  PRIMARY KEY (`id_candidato`),
  KEY `fk_tp_partido_idx` (`id_partido`),
  KEY `fk_dpto_idx` (`id_departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidatos`
--

LOCK TABLES `candidatos` WRITE;
/*!40000 ALTER TABLE `candidatos` DISABLE KEYS */;
INSERT INTO `candidatos` VALUES (8,'Candidato prueba',7,2),(10,'Candidato Actualizado',7,1),(10000,'prueba',3,1),(102345678,'Viviana Garcia',3,4),(103456789,'Tatia Gonzalez',4,3),(112346678,'Thiago David Delgado',3,1),(123456789,'Juan Pablo Garcia',1,2);
/*!40000 ALTER TABLE `candidatos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `candidatos_partido_departamento`
--

DROP TABLE IF EXISTS `candidatos_partido_departamento`;
/*!50001 DROP VIEW IF EXISTS `candidatos_partido_departamento`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `candidatos_partido_departamento` AS SELECT 
 1 AS `nombre`,
 1 AS `id_partido`,
 1 AS `nombre_completo`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudades` (
  `id_ciudades` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `id_departamento` int NOT NULL,
  PRIMARY KEY (`id_ciudades`),
  KEY `fk_dpto_idx` (`id_departamento`),
  CONSTRAINT `fk_dpartamento` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id_departamento`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudades`
--

LOCK TABLES `ciudades` WRITE;
/*!40000 ALTER TABLE `ciudades` DISABLE KEYS */;
INSERT INTO `ciudades` VALUES (1,'Medellin',1),(2,'Bucaranga',2),(3,'Neiva',5),(4,'Manizales',3),(5,'Tunja',4),(6,'Bogota',6),(7,'Armenia',7),(8,'Ibague',8);
/*!40000 ALTER TABLE `ciudades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `id_departamento` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Antioquia'),(2,'Santander'),(3,'Caldas'),(4,'Boyaca'),(5,'Huila'),(6,'Cundinamarca'),(7,'Quindio'),(8,'Tolima'),(9,'Caldas'),(10,'Boyaca'),(11,'Huila'),(12,'Cundinamarca'),(13,'Quindio'),(14,'Tolima'),(15,'prueba');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jurados`
--

DROP TABLE IF EXISTS `jurados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jurados` (
  `id_documento` int NOT NULL,
  `nombre_completo` varchar(200) NOT NULL,
  `funcion` enum('Jurado','Testigo') NOT NULL,
  `id_mesas` int NOT NULL,
  `presidente` enum('Si','No') NOT NULL,
  `id_partido` int NOT NULL,
  PRIMARY KEY (`id_documento`),
  KEY `Fk_mesa_idx` (`id_mesas`),
  KEY `Fk_partido_idx` (`id_partido`),
  CONSTRAINT `Fk_mesa` FOREIGN KEY (`id_mesas`) REFERENCES `mesas` (`id_mesas`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Fk_partido` FOREIGN KEY (`id_partido`) REFERENCES `partidos` (`id_partido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jurados`
--

LOCK TABLES `jurados` WRITE;
/*!40000 ALTER TABLE `jurados` DISABLE KEYS */;
INSERT INTO `jurados` VALUES (1234,'Carlos Perez','Jurado',1,'No',1),(2123,'Raul Bedoya','Testigo',2,'Si',1),(2321,'Hugo Ruiz','Jurado',3,'No',2),(3546,'Carolina Diaz','Testigo',4,'No',2),(4423,'Kelly Poso','Jurado',5,'No',2),(5673,'Paola Torre','Testigo',5,'Si',3),(5826,'Paula Toro','Testigo',6,'No',1),(7689,'Tatiana Julio','Jurado',6,'Si',4),(8642,'Marta Rios','Testigo',7,'No',3),(9853,'Pablo Torres','Jurado',8,'No',3);
/*!40000 ALTER TABLE `jurados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `jurados_mesa_partido`
--

DROP TABLE IF EXISTS `jurados_mesa_partido`;
/*!50001 DROP VIEW IF EXISTS `jurados_mesa_partido`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `jurados_mesa_partido` AS SELECT 
 1 AS `id_mesas`,
 1 AS `nombre_completo`,
 1 AS `nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `log_partidos`
--

DROP TABLE IF EXISTS `log_partidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_partidos` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_partidos`
--

LOCK TABLES `log_partidos` WRITE;
/*!40000 ALTER TABLE `log_partidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_partidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lugares_votacion`
--

DROP TABLE IF EXISTS `lugares_votacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lugares_votacion` (
  `id_lugar_votacion` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(250) NOT NULL,
  `id_departamento` int NOT NULL,
  PRIMARY KEY (`id_lugar_votacion`),
  KEY `Fk_depto_idx` (`id_departamento`),
  CONSTRAINT `Fk_depto` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lugares_votacion`
--

LOCK TABLES `lugares_votacion` WRITE;
/*!40000 ALTER TABLE `lugares_votacion` DISABLE KEYS */;
INSERT INTO `lugares_votacion` VALUES (1,'Colegio Mayor','Calle 78',1),(2,'Teatro Valle','cra 40',4),(3,'Teatro Prever','avenida 5',1),(4,'Coliseo Mosquera','cra 1 sur a',3),(5,'Colegio Valle','calle 15',6),(6,'Colegio Popular','cra 65',5),(7,'Universidad Popular','trav 5',4),(8,'Liceo Metropolitano','calle 105',6),(9,'Colegio Gaitán','cra 45',1),(10,'Colegio Conservador','calle 35',3);
/*!40000 ALTER TABLE `lugares_votacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesas`
--

DROP TABLE IF EXISTS `mesas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mesas` (
  `id_mesas` int NOT NULL AUTO_INCREMENT,
  `ubicacion` varchar(100) NOT NULL,
  `genero` enum('Hombre','Mujere','Mixta') NOT NULL,
  `id_lugar_votacion` int NOT NULL,
  `num_votantes_asignado` int DEFAULT NULL,
  PRIMARY KEY (`id_mesas`),
  KEY `Fk_lug_votacion_idx` (`id_lugar_votacion`),
  CONSTRAINT `Fk_lug_votacion` FOREIGN KEY (`id_lugar_votacion`) REFERENCES `lugares_votacion` (`id_lugar_votacion`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesas`
--

LOCK TABLES `mesas` WRITE;
/*!40000 ALTER TABLE `mesas` DISABLE KEYS */;
INSERT INTO `mesas` VALUES (1,'Mesa Colegio Mayor','Hombre',1,50),(2,'Mesa Teatro Valle','Mujere',2,30),(3,'Mesa Teatro Prever','Hombre',4,45),(4,'Mesa Coliseo Mosquera','Mujere',4,15),(5,'Mesa Colegio Valle','Hombre',5,45),(6,'Mesa Colegio Popular','Mujere',6,85),(7,'Mesa Universidad Popular','Mixta',7,25),(8,'Mesa Liceo Metropolitano','Mujere',8,100),(9,'Mesa Colegio Gaitán','Hombre',9,100),(10,'Mesa Colegio Conservador','Mixta',10,50);
/*!40000 ALTER TABLE `mesas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partidos`
--

DROP TABLE IF EXISTS `partidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partidos` (
  `id_partido` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_partido`)
) ENGINE=InnoDB AUTO_INCREMENT=123492 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partidos`
--

LOCK TABLES `partidos` WRITE;
/*!40000 ALTER TABLE `partidos` DISABLE KEYS */;
INSERT INTO `partidos` VALUES (1,'Partido de U'),(2,'Partido Cambio Radical'),(3,'Partido Alianza Verde'),(4,'Partido Conservador'),(5,'Partido Cambio Radical'),(6,'Partido Alianza Verde'),(7,'Partido Conservador');
/*!40000 ALTER TABLE `partidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsables_partidos`
--

DROP TABLE IF EXISTS `responsables_partidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responsables_partidos` (
  `id_responsables_partidos` int NOT NULL,
  `nombres_apellidos` varchar(200) NOT NULL,
  `id_mesa` int NOT NULL,
  `id_partido` int NOT NULL,
  PRIMARY KEY (`id_responsables_partidos`),
  KEY `Fknum__mesa_idx` (`id_mesa`),
  KEY `Fk_partido_idx` (`id_partido`),
  CONSTRAINT `Fknum__mesa` FOREIGN KEY (`id_mesa`) REFERENCES `mesas` (`id_mesas`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Fkpart` FOREIGN KEY (`id_partido`) REFERENCES `partidos` (`id_partido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsables_partidos`
--

LOCK TABLES `responsables_partidos` WRITE;
/*!40000 ALTER TABLE `responsables_partidos` DISABLE KEYS */;
INSERT INTO `responsables_partidos` VALUES (12345678,'Juan Esteban Gonzalez',1,2),(201345678,'Tatiana Pulgarin',8,4),(234567891,'Camilo Hernandez',2,1),(304561278,'David Alvarez',9,1),(345678912,'Danna Perez',3,4),(456789123,'Johana Gonzalez',4,3),(567891234,'Sandra Giraldo',6,2),(567894123,'Samuel Grandas',5,1),(1023456789,'Viviana Sanchez',7,3),(1045067820,'Einer Mosquera',10,2);
/*!40000 ALTER TABLE `responsables_partidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votantes`
--

DROP TABLE IF EXISTS `votantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `votantes` (
  `id_documento` int NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `id_mesas` int NOT NULL,
  `genero` enum('Hombre','Mujer') NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  PRIMARY KEY (`id_documento`),
  KEY `Fk_mesa_idx` (`id_mesas`),
  CONSTRAINT `fkmesa` FOREIGN KEY (`id_mesas`) REFERENCES `mesas` (`id_mesas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votantes`
--

LOCK TABLES `votantes` WRITE;
/*!40000 ALTER TABLE `votantes` DISABLE KEYS */;
INSERT INTO `votantes` VALUES (10204074,'Lina Sanchez',6,'Mujer','1992-04-22'),(10254874,'Raul Mesa',1,'Hombre','2015-01-30'),(10355894,'Saul Hernandez',9,'Hombre','2015-01-30'),(32237984,'Raul Roa',7,'Hombre','1985-11-22'),(42548674,'Ana Gil',4,'Mujer','1999-09-03'),(71234874,'Lucia Calle',2,'Mujer','2000-03-28'),(71525484,'Ivan Rua',7,'Hombre','1987-06-30'),(102548748,'Leonardo Moreno',10,'Hombre','2000-01-30'),(110254874,'Cristian Garavito',1,'Hombre','1998-01-30'),(123456789,'Juan Pérez',1,'Hombre','1990-01-01'),(842543874,'Maria Ruiz',4,'Mujer','1995-08-30'),(1020314874,'Andres Garcia',5,'Hombre','1988-06-23');
/*!40000 ALTER TABLE `votantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votos`
--

DROP TABLE IF EXISTS `votos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `votos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_mesas` int NOT NULL,
  `id_candidato` int NOT NULL,
  `id_votantes` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_candidato_idx` (`id_candidato`),
  KEY `Fk_numesa_idx` (`id_mesas`),
  KEY `Fk_votante_idx` (`id_votantes`),
  CONSTRAINT `Fk_candidato` FOREIGN KEY (`id_candidato`) REFERENCES `candidatos` (`id_candidato`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Fk_numesa` FOREIGN KEY (`id_mesas`) REFERENCES `mesas` (`id_mesas`),
  CONSTRAINT `Fk_votante` FOREIGN KEY (`id_votantes`) REFERENCES `votantes` (`id_documento`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votos`
--

LOCK TABLES `votos` WRITE;
/*!40000 ALTER TABLE `votos` DISABLE KEYS */;
INSERT INTO `votos` VALUES (2,6,102345678,10204074),(3,1,102345678,10254874),(4,9,102345678,10355894),(5,7,103456789,32237984),(6,4,103456789,42548674),(7,2,112346678,71234874),(8,10,112346678,102548748),(9,1,112346678,102548748),(10,4,123456789,842543874),(11,5,123456789,1020314874);
/*!40000 ALTER TABLE `votos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `candidato_partido_departamento`
--

/*!50001 DROP VIEW IF EXISTS `candidato_partido_departamento`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `candidato_partido_departamento` AS select `d`.`nombre` AS `nombre`,`p`.`id_partido` AS `id_partido`,`c`.`nombre_completo` AS `nombre_completo` from ((`candidatos` `c` join `partidos` `p` on((`c`.`id_partido` = `p`.`id_partido`))) join `departamento` `d` on((`c`.`id_departamento` = `d`.`id_departamento`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `candidatos_partido_departamento`
--

/*!50001 DROP VIEW IF EXISTS `candidatos_partido_departamento`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `candidatos_partido_departamento` AS select `d`.`nombre` AS `nombre`,`p`.`id_partido` AS `id_partido`,`c`.`nombre_completo` AS `nombre_completo` from ((`candidatos` `c` join `partidos` `p` on((`c`.`id_partido` = `p`.`id_partido`))) join `departamento` `d` on((`c`.`id_departamento` = `d`.`id_departamento`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `jurados_mesa_partido`
--

/*!50001 DROP VIEW IF EXISTS `jurados_mesa_partido`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `jurados_mesa_partido` AS select `m`.`id_mesas` AS `id_mesas`,`j`.`nombre_completo` AS `nombre_completo`,`p`.`nombre` AS `nombre` from ((`jurados` `j` join `mesas` `m` on((`j`.`id_mesas` = `m`.`id_mesas`))) join `partidos` `p` on((`j`.`id_partido` = `p`.`id_partido`))) */;
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

-- Dump completed on 2025-03-22 17:36:59
