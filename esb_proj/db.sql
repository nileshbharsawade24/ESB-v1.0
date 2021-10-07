-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: pavan
-- ------------------------------------------------------
-- Server version	8.0.26-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth`
--

DROP TABLE IF EXISTS `auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth` (
  `id` int NOT NULL AUTO_INCREMENT,
  `signature` varchar(65) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth`
--

LOCK TABLES `auth` WRITE;
/*!40000 ALTER TABLE `auth` DISABLE KEYS */;
INSERT INTO `auth` VALUES (1,'63f5f61f7a79301f715433f8f3689390d1f5da4f855169023300491c00b8113c');
/*!40000 ALTER TABLE `auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esb_request`
--

DROP TABLE IF EXISTS `esb_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esb_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sender_id` varchar(45) DEFAULT NULL,
  `dest_id` varchar(45) DEFAULT NULL,
  `message_type` varchar(45) DEFAULT NULL,
  `reference_id` varchar(45) DEFAULT NULL,
  `message_id` varchar(45) DEFAULT NULL,
  `received_on` datetime DEFAULT NULL,
  `data_location` text,
  `status` varchar(20) DEFAULT NULL,
  `status_details` text,
  `processing_attempts` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esb_request`
--

LOCK TABLES `esb_request` WRITE;
/*!40000 ALTER TABLE `esb_request` DISABLE KEYS */;
INSERT INTO `esb_request` VALUES (1,'756E2EAA-1D5B-4BC0-ACC4-4CEB669408DA','6393F82F-4687-433D-AA23-1966330381FE','CreditReport ',NULL,'A9ECAEF2-107A-4452-9553-043B6D25386E',NULL,NULL,NULL,NULL,1),(2,'756E2EAA-1D5B-4BC0-ACC4-4CEB669408DA','6393F82F-4687-433D-AA23-1966330381FE','CreditReport',NULL,'A9ECAEF2-107A-4452-9553-043B6D25386E','2021-09-21 16:46:16',NULL,NULL,NULL,1),(18,'756E2EAA-1D5B-4BC0-ACC4-4CEB669408DA','6393F82F-4687-433D-AA23-1966330381FE','CreditReport','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-09-23 16:54:23','/home/pavankolur/Bat/TCP_Server_Client/new_multi_client/','Done','Sucessfully reached the dest',2),(19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yet to process',1),(192,'756E2EAA-1D5B-4BC0-ACC4-4CEB669408DA','6393F82F-4687-433D-AA23-1966330381FE','CreditReport','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-09-27 16:40:41','/home/pavankolur/Bat/TCP_Server_Client/new_multi_client/','Done','Sucessfully reached the dest',2),(193,'756E2EAA-1D5B-4BC0-ACC4-4CEB669408DA','6393F82F-4687-433D-AA23-1966330381FE','CreditReport','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-09-27 17:33:42','/home/pavankolur/Bat/TCP_Server_Client/new_multi_client/','Taken','Yet to process',2),(194,'756E2EAA-1D5B-4BC0-ACC4-4CEB669408DA','6393F82F-4687-433D-AA23-1966330381FE','CreditReport','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-09-27 22:52:36','/home/pavankolur/Bat/TCP_Server_Client/new_multi_client/','Taken','Yet to process',2),(195,'756E2EAA-1D5B-4BC0-ACC4-4CEB669408DA','6393F82F-4687-433D-AA23-1966330381FE','CreditReport','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-09-27 22:52:37','/home/pavankolur/Bat/TCP_Server_Client/new_multi_client/','Taken','Yet to process',2),(196,'756E2EAA-1D5B-4BC0-ACC4-4CEB669408DA','6393F82F-4687-433D-AA23-1966330381FE','CreditReport','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-09-27 22:52:38','/home/pavankolur/Bat/TCP_Server_Client/new_multi_client/','Taken','Yet to process',2),(197,'756E2EAA-1D5B-4BC0-ACC4-4CEB669408DA','6393F82F-4687-433D-AA23-1966330381FE','CreditReport','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-09-27 22:52:40','/home/pavankolur/Bat/TCP_Server_Client/new_multi_client/','Taken','Yet to process',2),(201,'756E2EAA-1D5B-4BC0-ACC4-4CEB669408DA','6393F82F-4687-433D-AA23-1966330381FE','CreditReport','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-10-03 21:45:12','./','Taken','Yet to process',2),(202,'756E2EAA-1D5B-4BC0-ACC4-4CEB669408DA','6393F82F-4687-433D-AA23-1966330381FE','CreditReport','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-10-03 23:13:22','./','Taken','Yet to process',2),(203,'756E2EAA-1D5B-4BC0-ACC3-4CEB669408DA','6393F82F-4687-433D-AA33-1966330381FE','DebitReport','123','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-10-03 23:19:34','./BMD2.xml','Taken','Yet to process',2),(204,'756E2EAA-1D5B-4BC0-ACC3-4CEB669408DA','6393F82F-4687-433D-AA33-1966330381FE','DebitReport','123','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-10-03 23:37:58','./BMD2.xml','Taken','Yet to process',2),(205,'756E2EAA-1D5B-4BC0-ACC3-4CEB669408DA','6393F82F-4687-433D-AA33-1966330381FE','DebitReport','123','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-10-03 23:39:52','./BMD2.xml','Taken','Yet to process',2),(206,'756E2EAA-1D5B-4BC0-ACC2-4CEB669408DA','6393F82F-4687-433D-AA22-1966330381FE','AccountBalance','122','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-10-03 23:50:01','./BMD2.xml','Taken','Yet to process',2),(207,'756E2EAA-1D5B-4BC0-ACC4-4CEB669408DA','6393F82F-4687-433D-AA23-1966330381FE','CreditReport','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-10-04 12:41:05','./','Taken','Yet to process',2),(208,'756E2EAA-1D5B-4BC0-ACC4-4CEB669408DA','6393F82F-4687-433D-AA23-1966330381FE','CreditReport','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-10-04 12:43:28','./','Taken','Yet to process',2),(209,'756E2EAA-1D5B-4BC0-ACC4-4CEB669408DA','6393F82F-4687-433D-AA23-1966330381FE','CreditReport','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-10-04 12:44:36','./','Taken','Yet to process',2),(210,'756E2EAA-1D5B-4BC0-ACC4-4CEB669408DA','6393F82F-4687-433D-AA23-1966330381FE','CreditReport','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-10-04 12:45:22','./','Taken','Yet to process',2),(211,'756E2EAA-1D5B-4BC0-ACC4-4CEB669408DA','6393F82F-4687-433D-AA23-1966330381FE','CreditReport','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-10-04 12:49:32','./','Taken','Yet to process',2),(212,'756E2EAA-1D5B-4BC0-ACC4-4CEB669408DA','6393F82F-4687-433D-AA23-1966330381FE','CreditReport','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-10-04 12:52:17','./','Taken','Yet to process',2),(213,'756E2EAA-1D5B-4BC0-ACC4-4CEB669408DA','6393F82F-4687-433D-AA23-1966330381FE','CreditReport','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-10-04 12:53:27','./','Taken','Yet to process',2),(214,'756E2EAA-1D5B-4BC0-ACC4-4CEB669408DA','6393F82F-4687-433D-AA23-1966330381FE','CreditReport','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-10-04 12:54:07','./','Taken','Yet to process',2),(215,'756E2EAA-1D5B-4BC0-ACC4-4CEB669408DA','6393F82F-4687-433D-AA23-1966330381FE','CreditReport','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-10-04 12:56:09','./','Taken','Yet to process',2),(216,'756E2EAA-1D5B-4BC0-ACC4-4CEB669408DA','6393F82F-4687-433D-AA23-1966330381FE','CreditReport','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-10-04 12:57:29','./','Taken','Yet to process',2),(217,'756E2EAA-1D5B-4BC0-ACC4-4CEB669408DA','6393F82F-4687-433D-AA23-1966330381FE','CreditReport','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-10-04 12:59:23','./','Taken','Yet to process',2),(218,'756E2EAA-1D5B-4BC0-ACC4-4CEB669408DA','6393F82F-4687-433D-AA23-1966330381FE','CreditReport','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-10-05 16:37:54','./','Taken','Yet to process',2),(219,'756E2EAA-1D5B-4BC0-ACC4-4CEB669408DA','6393F82F-4687-433D-AA23-1966330381FE','CreditReport','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-10-05 16:38:43','./','Done','Sucessfully reached the dest',2),(220,'756E2EAA-1D5B-4BC0-ACC4-4CEB669408DA','6393F82F-4687-433D-AA23-1966330381FE','CreditReport','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-10-05 17:15:19','./','Taken','Yet to process',2),(221,'756E2EAA-1D5B-4BC0-ACC4-4CEB669408DA','6393F82F-4687-433D-AA23-1966330381FE','CreditReport','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-10-06 01:12:27','./','Taken','Yet to process',2),(222,'756E2EAA-1D5B-4BC0-ACC4-4CEB669408DA','6393F82F-4687-433D-AA23-1966330381FE','CreditReport','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-10-06 01:16:01','./','Done','Sucessfully reached the dest',2),(223,'756E2EAA-1D5B-4BC0-ACC3-4CEB669408DA','6393F82F-4687-433D-AA33-1966330381FE','DebitReport','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-10-06 01:24:22','./U','Done','Sucessfully reached the dest',2),(224,'756E2EAA-1D5B-4BC0-ACC4-4CEB669408DA','6393F82F-4687-433D-AA23-1966330381FE','CreditReport','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-10-06 01:24:59','./','Taken','Yet to process',2),(225,'756E2EAA-1D5B-4BC0-ACC3-4CEB669408DA','6393F82F-4687-433D-AA33-1966330381FE','DebitReport','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-10-06 01:26:42','./','Taken','Yet to process',2),(226,'756E2EAA-1D5B-4BC0-ACC3-4CEB669408DA','6393F82F-4687-433D-AA33-1966330381FE','DebitReport','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-10-06 01:28:25','./','Done','Sucessfully reached the dest',2),(227,'756E2EAA-1D5B-4BC0-ACC2-4CEB669408DA','6393F82F-4687-433D-AA22-1966330381FE','AccountBalance','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-10-06 01:30:02','./','Done','Sucessfully reached the dest',2),(228,'756E2EAA-1D5B-4BC0-ACC2-4CEB669408DA','6393F82F-4687-433D-AA22-1966330381FE','AccountBalance','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-10-06 01:31:38','./','Done','Sucessfully reached the dest',2),(229,'756E2EAA-1D5B-4BC0-ACC2-4CEB669408DA','6393F82F-4687-433D-AA22-1966330381FE','AccountBalance','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-10-06 16:36:14','./','Done','Sucessfully reached the dest',2),(230,'756E2EAA-1D5B-4BC0-ACC4-4CEB669408DA','6393F82F-4687-433D-AA23-1966330381FE','CreditReport','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-10-07 01:11:14','./','Available','Yet to process',1),(231,'756E2EAA-1D5B-4BC0-ACC4-4CEB669408DA','6393F82F-4687-433D-AA23-1966330381FE','CreditReport','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-10-07 01:11:15','./','Available','Yet to process',1),(232,'756E2EAA-1D5B-4BC0-ACC4-4CEB669408DA','6393F82F-4687-433D-AA23-1966330381FE','CreditReport','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-10-07 01:11:16','./','Available','Yet to process',1),(233,'756E2EAA-1D5B-4BC0-ACC4-4CEB669408DA','6393F82F-4687-433D-AA23-1966330381FE','CreditReport','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-10-07 01:11:17','./','Available','Yet to process',1),(234,'756E2EAA-1D5B-4BC0-ACC3-4CEB669408DA','6393F82F-4687-433D-AA33-1966330381FE','DebitReport','INV-PROFILE-889712','A9ECAEF2-107A-4452-9553-043B6D25386E','2021-10-07 01:12:36','./','Available','Yet to process',1);
/*!40000 ALTER TABLE `esb_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routes` (
  `route_id` int NOT NULL,
  `sender` varchar(45) DEFAULT NULL,
  `destination` varchar(45) DEFAULT NULL,
  `message_type` varchar(45) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`route_id`),
  UNIQUE KEY `root_id` (`route_id`),
  UNIQUE KEY `root_id_2` (`route_id`),
  UNIQUE KEY `sender` (`sender`),
  UNIQUE KEY `destination` (`destination`),
  UNIQUE KEY `message_type` (`message_type`),
  UNIQUE KEY `destination_2` (`destination`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
INSERT INTO `routes` VALUES (1,'756E2EAA-1D5B-4BC0-ACC4-4CEB669408DA','6393F82F-4687-433D-AA23-1966330381FE','CreditReport',_binary ''),(2,'756E2EAA-1D5B-4BC0-ACC3-4CEB669408DA','6393F82F-4687-433D-AA33-1966330381FE','DebitReport',_binary ''),(3,'756E2EAA-1D5B-4BC0-ACC2-4CEB669408DA','6393F82F-4687-433D-AA22-1966330381FE','AccountBalance',_binary '');
/*!40000 ALTER TABLE `routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transform_config`
--

DROP TABLE IF EXISTS `transform_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transform_config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `route_id` int DEFAULT NULL,
  `config_key` varchar(45) DEFAULT NULL,
  `config_value` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `route_id` (`route_id`),
  UNIQUE KEY `config_key` (`config_key`),
  KEY `route_idx` (`route_id`),
  CONSTRAINT `transform_config_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `routes` (`route_id`),
  CONSTRAINT `transform_config_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `routes` (`route_id`),
  CONSTRAINT `transform_config_ibfk_3` FOREIGN KEY (`route_id`) REFERENCES `routes` (`route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transform_config`
--

LOCK TABLES `transform_config` WRITE;
/*!40000 ALTER TABLE `transform_config` DISABLE KEYS */;
INSERT INTO `transform_config` VALUES (1,1,'JSON','reciver expect json format'),(2,2,'CSV','reciver expect CSV format'),(3,3,'XML','reciver expect XML format');
/*!40000 ALTER TABLE `transform_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport_config`
--

DROP TABLE IF EXISTS `transport_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transport_config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `route_id` int DEFAULT NULL,
  `config_key` varchar(45) DEFAULT NULL,
  `config_value` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `route_id` (`route_id`),
  UNIQUE KEY `config_key` (`config_key`),
  KEY `route_idx` (`route_id`),
  CONSTRAINT `transport_config_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `routes` (`route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport_config`
--

LOCK TABLES `transport_config` WRITE;
/*!40000 ALTER TABLE `transport_config` DISABLE KEYS */;
INSERT INTO `transport_config` VALUES (1,1,'SMTP','pavankolur2000@gmail.com'),(2,2,'HTTP','https://reqbin.com/echo/post/json'),(3,3,'SFTP','127.0.0.1');
/*!40000 ALTER TABLE `transport_config` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-07 13:06:04
