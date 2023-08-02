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
-- Table structure for table 'agendamientos'
--

DROP TABLE IF EXISTS 'agendamientos';
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE 'agendamientos' (
  'id' int NOT NULL AUTO_INCREMENT,
  'fechaAgendamiento' date NOT NULL,
  'fechaAtencion' date NOT NULL,
  'horaAtencion' time NOT NULL,
  'observaciones' varchar(100) DEFAULT NULL,
  'idVehiculo' varchar(25) NOT NULL,
  PRIMARY KEY ('id'),
  KEY 'idVehiculo' ('idVehiculo'),
  CONSTRAINT 'agendamientos_ibfk_1' FOREIGN KEY ('idVehiculo') REFERENCES 'vehiculos' ('vinNumber')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table 'cajas'
--

DROP TABLE IF EXISTS 'cajas';
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE 'cajas' (
  'id' int NOT NULL AUTO_INCREMENT,
  'fechaApertura' date NOT NULL,
  'fecheCierre' date NOT NULL,
  'saldoInicial' decimal(10,2) NOT NULL,
  'saldoFinal' decimal(10,2) DEFAULT NULL,
  'totalIngresos' decimal(10,2) DEFAULT NULL,
  'totalEgresos' decimal(10,2) DEFAULT NULL,
  PRIMARY KEY ('id')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table 'categorias'
--

DROP TABLE IF EXISTS 'categorias';
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE 'categorias' (
  'id' int NOT NULL AUTO_INCREMENT,
  'nombre' varchar(45) NOT NULL,
  PRIMARY KEY ('id')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table 'compras'
--

DROP TABLE IF EXISTS 'compras';
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE 'compras' (
  'id' int NOT NULL,
  'valorTotal' decimal(20,2) NOT NULL,
  'descripcion' varchar(100) DEFAULT NULL,
  'idEmpleado' int DEFAULT NULL,
  'idProveedor' int DEFAULT NULL,
  PRIMARY KEY ('id'),
  KEY 'idEmpleado' ('idEmpleado'),
  KEY 'idProveedor' ('idProveedor'),
  CONSTRAINT 'compras_ibfk_1' FOREIGN KEY ('idEmpleado') REFERENCES 'personas' ('id'),
  CONSTRAINT 'compras_ibfk_2' FOREIGN KEY ('idProveedor') REFERENCES 'personas' ('id')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table 'conceptos'
--

DROP TABLE IF EXISTS 'conceptos';
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE 'conceptos' (
  'id' int NOT NULL AUTO_INCREMENT,
  'fecha' date NOT NULL,
  'valor' decimal(20,2) NOT NULL,
  'descripcion' varchar(45) DEFAULT NULL,
  'idTipo' int NOT NULL,
  'idNomina' int NOT NULL,
  PRIMARY KEY ('id'),
  KEY 'idTipo' ('idTipo'),
  KEY 'idNomina' ('idNomina'),
  CONSTRAINT 'conceptos_ibfk_1' FOREIGN KEY ('idTipo') REFERENCES 'tipoconcepto' ('id'),
  CONSTRAINT 'conceptos_ibfk_2' FOREIGN KEY ('idNomina') REFERENCES 'nominas' ('id')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table 'detalleorden'
--

DROP TABLE IF EXISTS 'detalleorden';
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE 'detalleorden' (
  'idVehiculo' varchar(25) NOT NULL,
  'idOrden' int NOT NULL,
  PRIMARY KEY ('idVehiculo','idOrden'),
  KEY 'idOrden' ('idOrden'),
  CONSTRAINT 'detalleorden_ibfk_1' FOREIGN KEY ('idVehiculo') REFERENCES 'vehiculos' ('vinNumber'),
  CONSTRAINT 'detalleorden_ibfk_2' FOREIGN KEY ('idOrden') REFERENCES 'ordenreparacion' ('id')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table 'detalleventa'
--

DROP TABLE IF EXISTS 'detalleventa';
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE 'detalleventa' (
  'idVenta' int NOT NULL,
  'idElemento' int NOT NULL,
  PRIMARY KEY ('idVenta','idElemento'),
  KEY 'idElemento' ('idElemento'),
  CONSTRAINT 'detalleventa_ibfk_1' FOREIGN KEY ('idVenta') REFERENCES 'ventas' ('id'),
  CONSTRAINT 'detalleventa_ibfk_2' FOREIGN KEY ('idElemento') REFERENCES 'elementos' ('id')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table 'elementos'
--

DROP TABLE IF EXISTS 'elementos';
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE 'elementos' (
  'id' int NOT NULL AUTO_INCREMENT,
  'codigo' int NOT NULL,
  'nombre' varchar(45) NOT NULL,
  'descripcion' varchar(45) DEFAULT NULL,
  'idCategoria' int NOT NULL,
  PRIMARY KEY ('id'),
  KEY 'idCategoria' ('idCategoria'),
  CONSTRAINT 'elementos_ibfk_1' FOREIGN KEY ('idCategoria') REFERENCES 'categorias' ('id')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table 'nominas'
--

DROP TABLE IF EXISTS 'nominas';
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE 'nominas' (
  'id' int NOT NULL AUTO_INCREMENT,
  'fecha' date NOT NULL,
  'comentarios' varchar(100) DEFAULT NULL,
  PRIMARY KEY ('id')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table 'ordenreparacion'
--

DROP TABLE IF EXISTS 'ordenreparacion';
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE 'ordenreparacion' (
  'id' int NOT NULL AUTO_INCREMENT,
  'fecha' date NOT NULL,
  'fechaInicio' date NOT NULL,
  'fechaEstimada' date DEFAULT NULL,
  'idVehiculo' varchar(25) NOT NULL,
  PRIMARY KEY ('id'),
  KEY 'idVehiculo' ('idVehiculo'),
  CONSTRAINT 'ordenreparacion_ibfk_1' FOREIGN KEY ('idVehiculo') REFERENCES 'vehiculos' ('vinNumber')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table 'personas'
--

DROP TABLE IF EXISTS 'personas';
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE 'personas' (
  'id' int NOT NULL,
  'firstName' varchar(45) NOT NULL,
  'lastName' varchar(45) NOT NULL,
  'email' varchar(45) NOT NULL,
  'phone' varchar(45) DEFAULT NULL,
  'address' varchar(45) DEFAULT NULL,
  'isProvider' int DEFAULT NULL,
  'isCustomer' int DEFAULT NULL,
  'isEmployed' int DEFAULT NULL,
  'isNatural' int DEFAULT NULL,
  'isEmpresa' int DEFAULT NULL,
  PRIMARY KEY ('id')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table 'presupuestos'
--

DROP TABLE IF EXISTS 'presupuestos';
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE 'presupuestos' (
  'id' int NOT NULL AUTO_INCREMENT,
  'fecha' date NOT NULL,
  'valor' decimal(10,2) NOT NULL,
  'idVehiculo' varchar(25) NOT NULL,
  PRIMARY KEY ('id'),
  KEY 'idVehiculo' ('idVehiculo'),
  CONSTRAINT 'presupuestos_ibfk_1' FOREIGN KEY ('idVehiculo') REFERENCES 'vehiculos' ('vinNumber')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table 'servicios'
--

DROP TABLE IF EXISTS 'servicios';
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE 'servicios' (
  'id' int NOT NULL,
  'nombre' varchar(45) NOT NULL,
  'descripcion' varchar(45) DEFAULT NULL,
  PRIMARY KEY ('id')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table 'tipoconcepto'
--

DROP TABLE IF EXISTS 'tipoconcepto';
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE 'tipoconcepto' (
  'id' int NOT NULL AUTO_INCREMENT,
  'nombre' varchar(45) NOT NULL,
  'descripcion' varchar(45) DEFAULT NULL,
  PRIMARY KEY ('id')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table 'tipovehiculo'
--

DROP TABLE IF EXISTS 'tipovehiculo';
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE 'tipovehiculo' (
  'id' int NOT NULL AUTO_INCREMENT,
  'nombre' varchar(45) NOT NULL,
  PRIMARY KEY ('id')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table 'vehiculos'
--

DROP TABLE IF EXISTS 'vehiculos';
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE 'vehiculos' (
  'vinNumber' varchar(25) NOT NULL,
  'marca' varchar(45) NOT NULL,
  'linea' varchar(45) NOT NULL,
  'modelo' int NOT NULL,
  'color' varchar(20) DEFAULT NULL,
  'idTipo' int NOT NULL,
  PRIMARY KEY ('vinNumber'),
  KEY 'idTipo' ('idTipo'),
  CONSTRAINT 'vehiculos_ibfk_1' FOREIGN KEY ('idTipo') REFERENCES 'tipovehiculo' ('id')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table 'ventas'
--

DROP TABLE IF EXISTS 'ventas';
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE 'ventas' (
  'id' int NOT NULL AUTO_INCREMENT,
  'fecha' date NOT NULL,
  'idOrden' int DEFAULT NULL,
  'idCliente' int DEFAULT NULL,
  'idEmpleado' int DEFAULT NULL,
  'valorTotal' decimal(10,2) DEFAULT NULL,
  'descuento' decimal(10,2) DEFAULT NULL,
  PRIMARY KEY ('id'),
  KEY 'idOrden' ('idOrden'),
  KEY 'idCliente' ('idCliente'),
  KEY 'idEmpleado' ('idEmpleado'),
  CONSTRAINT 'ventas_ibfk_1' FOREIGN KEY ('idOrden') REFERENCES 'ordenreparacion' ('id'),
  CONSTRAINT 'ventas_ibfk_2' FOREIGN KEY ('idCliente') REFERENCES 'personas' ('id'),
  CONSTRAINT 'ventas_ibfk_3' FOREIGN KEY ('idEmpleado') REFERENCES 'personas' ('id')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-31 20:50:49
