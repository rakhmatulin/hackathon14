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
-- Table structure for table `twid_device`
--

DROP TABLE IF EXISTS `twid_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `twid_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `os` varchar(50) NOT NULL,
  `version` varchar(50) NOT NULL,
  `mac` varchar(50) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twid_device`
--

LOCK TABLES `twid_device` WRITE;
/*!40000 ALTER TABLE `twid_device` DISABLE KEYS */;
INSERT INTO `twid_device` VALUES (1,'iphone-01','iPhone 5','ios','7.0.3','234-sdfdf-234523-sdfsdf','device/iphone-5.jpg',0),(2,'windows-01','Lumia 630','wp','8.0','234-sdfdf-234523-sdfsdf','device/lumia-630.jpg',0),(3,'iphone-03','iPhone 5s','ios','7.0.1','234-sdfdf-234523-sdfsdf','device/iphone-5s.jpg',0),(4,'android-01','Sony Xperia Z1','android','4.1.1','234-sdfdf-234523-sdfsdf','device/sony-z1.jpg',0),(5,'android-03','Sansung Galaxy S4','android','4.0.1','234-sdfdf-234523-sdfsdf','device/galaxy-s4.jpg',0),(6,'ipad-03','iPad Air 10','ios','7.0.2','234-sdfdf-234523-sdfsdf','device/ipad-10.jpg',0),(7,'android-09','Sony Tablet Z1','android','4.4.1','234-sdfdf-234523-sdfsdf','device/sony-t1.jpg',0),(8,'android-10','Huawei Mediapad M1','android','4.2.0','234-sdfdf-234523-sdfsdf','device/huawei-m1.jpg',0),(9,'iphone-05','iPhone 5','ios','7.0.3','234-sdfdf-234523-sdfsdf','device/iphone-5.jpg',0),(10,'windows-03','Lumia 625','wp','8.0','234-sdfdf-234523-sdfsdf','device/lumia-630.jpg',0),(11,'iphone-06','iPhone 5s','ios','7.0.1','234-sdfdf-234523-sdfsdf','device/iphone-5s.jpg',0),(12,'android-11','Sony Xperia Z2','android','4.1.1','234-sdfdf-234523-sdfsdf','device/sony-z1.jpg',0),(13,'android-12','Sansung Galaxy S4','android','4.0.1','234-sdfdf-234523-sdfsdf','device/galaxy-s4.jpg',0),(14,'ipad-01','iPad Air 10','ios','7.0.2','234-sdfdf-234523-sdfsdf','device/ipad-10.jpg',0),(15,'android-05','Sony Tablet Z1','android','4.4.1','234-sdfdf-234523-sdfsdf','device/sony-t1.jpg',0),(16,'android-07','Huawei Mediapad M1','android','4.2.0','234-sdfdf-234523-sdfsdf','device/huawei-m1.jpg',0),(17,'iphone-02','iPhone 5','ios','7.0.1','234-sdfdf-234523-sdfsdf','device/iphone-5.jpg',0),(18,'windows-02','Lumia 630','wp','8.1','234-sdfdf-234523-sdfsdf','device/lumia-630.jpg',0),(19,'iphone-04','iPhone 5s','ios','7.0.1','234-sdfdf-234523-sdfsdf','device/iphone-5s.jpg',0),(20,'android-02','Sony Xperia Z2','android','4.1.1','234-sdfdf-234523-sdfsdf','device/sony-z1.jpg',0),(21,'android-04','Sansung Galaxy S5','android','4.0.1','234-sdfdf-234523-sdfsdf','device/galaxy-s4.jpg',0),(22,'ipad-02','iPad Air 10','ios','7.0.2','234-sdfdf-234523-sdfsdf','device/ipad-10.jpg',0),(23,'android-06','Sony Tablet Z1','android','4.4.1','234-sdfdf-234523-sdfsdf','device/sony-t1.jpg',0),(24,'android-08','Huawei Mediapad M1','android','4.2.0','234-sdfdf-234523-sdfsdf','device/huawei-m1.jpg',0);
/*!40000 ALTER TABLE `twid_device` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-14 16:20:53
