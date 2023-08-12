-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: truckdb
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `agendamientos`
--

DROP TABLE IF EXISTS `agendamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agendamientos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fechaAgendamiento` date NOT NULL,
  `fechaAtencion` date NOT NULL,
  `horaAtencion` time NOT NULL,
  `observaciones` varchar(100) DEFAULT NULL,
  `idVehiculo` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idVehiculo` (`idVehiculo`),
  CONSTRAINT `agendamientos_ibfk_1` FOREIGN KEY (`idVehiculo`) REFERENCES `vehiculos` (`vinNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agendamientos`
--

LOCK TABLES `agendamientos` WRITE;
/*!40000 ALTER TABLE `agendamientos` DISABLE KEYS */;
INSERT INTO `agendamientos` VALUES (1,'1980-04-07','1980-04-10','08:00:00','voy de afan','hqy510');
/*!40000 ALTER TABLE `agendamientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cajas`
--

DROP TABLE IF EXISTS `cajas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cajas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fechaApertura` date NOT NULL,
  `fechaCierre` date NOT NULL,
  `saldoInicial` decimal(10,2) NOT NULL,
  `saldoFinal` decimal(10,2) DEFAULT NULL,
  `totalIngresos` decimal(10,2) DEFAULT NULL,
  `totalEgresos` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cajas`
--

LOCK TABLES `cajas` WRITE;
/*!40000 ALTER TABLE `cajas` DISABLE KEYS */;
INSERT INTO `cajas` VALUES (1,'1980-04-07','1980-04-07',500.00,5500.00,4500.00,1000.00),(2,'1980-04-07','1980-04-07',600.00,6500.00,4500.00,2000.00);
/*!40000 ALTER TABLE `cajas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (5,'jogre'),(9,'accesorioas nuevo');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `valorTotal` decimal(20,2) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `idEmpleado` int DEFAULT NULL,
  `idProveedor` int DEFAULT NULL,
  `idCaja` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `idEmpleado` (`idEmpleado`),
  KEY `idProveedor` (`idProveedor`),
  KEY `fk_compras_cajas` (`idCaja`),
  CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `personas` (`id`),
  CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`idProveedor`) REFERENCES `personas` (`id`),
  CONSTRAINT `fk_compras_cajas` FOREIGN KEY (`idCaja`) REFERENCES `cajas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (300.25,'ambientadores',123,125,1,1),(350.25,'ambientadores editado',123,125,1,2);
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conceptos`
--

DROP TABLE IF EXISTS `conceptos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conceptos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `valor` decimal(20,2) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `idTipo` int NOT NULL,
  `idNomina` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idTipo` (`idTipo`),
  KEY `idNomina` (`idNomina`),
  CONSTRAINT `conceptos_ibfk_1` FOREIGN KEY (`idTipo`) REFERENCES `tipoconcepto` (`id`),
  CONSTRAINT `conceptos_ibfk_2` FOREIGN KEY (`idNomina`) REFERENCES `nominas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conceptos`
--

LOCK TABLES `conceptos` WRITE;
/*!40000 ALTER TABLE `conceptos` DISABLE KEYS */;
INSERT INTO `conceptos` VALUES (1,'1980-04-07',3000.00,'salario abril con time',1,1),(3,'1980-05-07',3000.50,'salario mayo',1,3);
/*!40000 ALTER TABLE `conceptos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleorden`
--

DROP TABLE IF EXISTS `detalleorden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalleorden` (
  `idOrden` int NOT NULL,
  `idServicio` int NOT NULL,
  PRIMARY KEY (`idOrden`,`idServicio`),
  KEY `idServicio` (`idServicio`),
  CONSTRAINT `detalleorden_ibfk_1` FOREIGN KEY (`idOrden`) REFERENCES `ordenreparacion` (`id`),
  CONSTRAINT `detalleorden_ibfk_2` FOREIGN KEY (`idServicio`) REFERENCES `servicios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleorden`
--

LOCK TABLES `detalleorden` WRITE;
/*!40000 ALTER TABLE `detalleorden` DISABLE KEYS */;
INSERT INTO `detalleorden` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `detalleorden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleventa`
--

DROP TABLE IF EXISTS `detalleventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalleventa` (
  `idVenta` int NOT NULL,
  `idElemento` int NOT NULL,
  PRIMARY KEY (`idVenta`,`idElemento`),
  KEY `idElemento` (`idElemento`),
  CONSTRAINT `detalleventa_ibfk_1` FOREIGN KEY (`idVenta`) REFERENCES `ventas` (`id`),
  CONSTRAINT `detalleventa_ibfk_2` FOREIGN KEY (`idElemento`) REFERENCES `elementos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleventa`
--

LOCK TABLES `detalleventa` WRITE;
/*!40000 ALTER TABLE `detalleventa` DISABLE KEYS */;
INSERT INTO `detalleventa` VALUES (1,6);
/*!40000 ALTER TABLE `detalleventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elementos`
--

DROP TABLE IF EXISTS `elementos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elementos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `idCategoria` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idCategoria` (`idCategoria`),
  CONSTRAINT `elementos_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementos`
--

LOCK TABLES `elementos` WRITE;
/*!40000 ALTER TABLE `elementos` DISABLE KEYS */;
INSERT INTO `elementos` VALUES (5,124,'ambientador','marca general',5),(6,789,'limpiabrisas','limpiabrisas en promoción',5);
/*!40000 ALTER TABLE `elementos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nominas`
--

DROP TABLE IF EXISTS `nominas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nominas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `comentarios` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nominas`
--

LOCK TABLES `nominas` WRITE;
/*!40000 ALTER TABLE `nominas` DISABLE KEYS */;
INSERT INTO `nominas` VALUES (1,'1980-04-07','nomina de 1980 abril'),(3,'1980-06-07','nomina de 1980 junio con time');
/*!40000 ALTER TABLE `nominas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenreparacion`
--

DROP TABLE IF EXISTS `ordenreparacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenreparacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaEstimada` date DEFAULT NULL,
  `idVehiculo` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idVehiculo` (`idVehiculo`),
  CONSTRAINT `ordenreparacion_ibfk_1` FOREIGN KEY (`idVehiculo`) REFERENCES `vehiculos` (`vinNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenreparacion`
--

LOCK TABLES `ordenreparacion` WRITE;
/*!40000 ALTER TABLE `ordenreparacion` DISABLE KEYS */;
INSERT INTO `ordenreparacion` VALUES (1,'1980-07-04','1980-07-04','1980-09-04','hqy510'),(2,'1990-07-04','1990-07-04','1990-09-04','hqy511');
/*!40000 ALTER TABLE `ordenreparacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas` (
  `id` int NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `isProvider` int DEFAULT NULL,
  `isCustomer` int DEFAULT NULL,
  `isEmployed` int DEFAULT NULL,
  `isNatural` int DEFAULT NULL,
  `isEmpresa` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (123,'jorge1','giraldo1','correo1@gmail.com','555551','direccion1',0,0,1,0,0),(124,'jorge2','giraldo2','correo2@gmail.com','555552','direccion2',0,1,0,1,0),(125,'jorge3','giraldo3','correo3@gmail.com','555553','direccion3',1,0,0,0,0);
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presupuestos`
--

DROP TABLE IF EXISTS `presupuestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presupuestos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `idVehiculo` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idVehiculo` (`idVehiculo`),
  CONSTRAINT `presupuestos_ibfk_1` FOREIGN KEY (`idVehiculo`) REFERENCES `vehiculos` (`vinNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presupuestos`
--

LOCK TABLES `presupuestos` WRITE;
/*!40000 ALTER TABLE `presupuestos` DISABLE KEYS */;
INSERT INTO `presupuestos` VALUES (1,'1980-07-04',250.00,'hqy510'),(2,'1980-07-04',590.00,'hqy511');
/*!40000 ALTER TABLE `presupuestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios` (
  `id` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `valor` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,'cambio aceite','cambio aceite básico',80.50),(2,'alineación','servicio básico de alineación',32.50);
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testcat`
--

DROP TABLE IF EXISTS `testcat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testcat` (
  `id` int DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcat`
--

LOCK TABLES `testcat` WRITE;
/*!40000 ALTER TABLE `testcat` DISABLE KEYS */;
INSERT INTO `testcat` VALUES (1,'jorge'),(1,'accesorios'),(1,'accesorios');
/*!40000 ALTER TABLE `testcat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoconcepto`
--

DROP TABLE IF EXISTS `tipoconcepto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipoconcepto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoconcepto`
--

LOCK TABLES `tipoconcepto` WRITE;
/*!40000 ALTER TABLE `tipoconcepto` DISABLE KEYS */;
INSERT INTO `tipoconcepto` VALUES (1,'salario','salario mensual');
/*!40000 ALTER TABLE `tipoconcepto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipovehiculo`
--

DROP TABLE IF EXISTS `tipovehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipovehiculo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipovehiculo`
--

LOCK TABLES `tipovehiculo` WRITE;
/*!40000 ALTER TABLE `tipovehiculo` DISABLE KEYS */;
INSERT INTO `tipovehiculo` VALUES (1,'truck modified'),(2,'sedan');
/*!40000 ALTER TABLE `tipovehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombreCompleto` varchar(45) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `userName` varchar(20) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `perfil` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (2,'Jorge Giraldo2','jegiraldo2@correo.com','acevedomarianela','$2b$10$3EChQLm/i/f/TF7gPnR4UuI9JhRvUNuwWgkDz5u.txBmV82dN69tC',2),(7,'maria','jegiraldp@correo.com','maria','$2b$10$1fJp3hmcx0DU3c3ntwE9lOn8e9rX5Yx0uStWjL9hRklq.ZTD8x5Ga',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculos`
--

DROP TABLE IF EXISTS `vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculos` (
  `vinNumber` varchar(25) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `linea` varchar(45) NOT NULL,
  `modelo` int NOT NULL,
  `color` varchar(20) DEFAULT NULL,
  `idTipo` int NOT NULL,
  PRIMARY KEY (`vinNumber`),
  KEY `idTipo` (`idTipo`),
  CONSTRAINT `vehiculos_ibfk_1` FOREIGN KEY (`idTipo`) REFERENCES `tipovehiculo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculos`
--

LOCK TABLES `vehiculos` WRITE;
/*!40000 ALTER TABLE `vehiculos` DISABLE KEYS */;
INSERT INTO `vehiculos` VALUES ('hqy510','kia','cerato',2015,'vblanco',2),('hqy511','chevrolet','camionsote',2021,'rojo',1);
/*!40000 ALTER TABLE `vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `idOrden` int DEFAULT NULL,
  `idCliente` int DEFAULT NULL,
  `idEmpleado` int DEFAULT NULL,
  `valorTotal` decimal(10,2) DEFAULT NULL,
  `descuento` decimal(10,2) DEFAULT NULL,
  `idCaja` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idOrden` (`idOrden`),
  KEY `idCliente` (`idCliente`),
  KEY `idEmpleado` (`idEmpleado`),
  KEY `fk_ventas_cajas` (`idCaja`),
  CONSTRAINT `fk_ventas_cajas` FOREIGN KEY (`idCaja`) REFERENCES `cajas` (`id`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`idOrden`) REFERENCES `ordenreparacion` (`id`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `personas` (`id`),
  CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`idEmpleado`) REFERENCES `personas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,'1980-04-07',1,123,124,1500.00,100.00,1),(2,'1980-04-07',2,123,124,1500.00,200.00,1);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-11 19:21:03
