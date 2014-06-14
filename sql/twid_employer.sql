-- MySQL dump 10.13  Distrib 5.5.37, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: twid
-- ------------------------------------------------------
-- Server version	5.5.37-0ubuntu0.14.04.1-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `twid_employer`
--

DROP TABLE IF EXISTS `twid_employer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `twid_employer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(10) unsigned NOT NULL,
  `first_name_eng` varchar(200) NOT NULL,
  `last_name_eng` varchar(200) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `birth_day` date NOT NULL,
  `skype` varchar(200),
  `phone` varchar(200),
  `room` varchar(200) NOT NULL,
  `email` varchar(75) NOT NULL,
  `dept_id` int(10) unsigned NOT NULL,
  `image` varchar(100),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=300 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twid_employer`
--

LOCK TABLES `twid_employer` WRITE;
/*!40000 ALTER TABLE `twid_employer` DISABLE KEYS */;
INSERT INTO `twid_employer` VALUES 
(1,14,'V','A','В','А','1955-11-11','V.A','+375291231231','529','V.A@example.com',12,'employer/4_11.png'),
(2,15,'S','A','С','А','1955-12-12','S_A','+375291231232','618','S.A@example.com',18,'employer/5_2.png'),
(3,17,'V','B','В','Б','1955-12-12','V.B','+375291231233','531','V.B@example.com',13,'employer/7_2.png'),
(4,19,'S','B','В','Б','1955-11-11','V.B','+375291231234','123','V.B@example.com',14,'employer/9_2.png'),;
/*!40000 ALTER TABLE `twid_employer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-14 16:20:10
