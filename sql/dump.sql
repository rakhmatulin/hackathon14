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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can add permission',2,'add_permission'),
(5,'Can change permission',2,'change_permission'),
(6,'Can delete permission',2,'delete_permission'),
(7,'Can add group',3,'add_group'),
(8,'Can change group',3,'change_group'),
(9,'Can delete group',3,'delete_group'),
(10,'Can add user',4,'add_user'),
(11,'Can change user',4,'change_user'),
(12,'Can delete user',4,'delete_user'),
(13,'Can add content type',5,'add_contenttype'),
(14,'Can change content type',5,'change_contenttype'),
(15,'Can delete content type',5,'delete_contenttype'),
(16,'Can add session',6,'add_session'),
(17,'Can change session',6,'change_session'),
(18,'Can delete session',6,'delete_session'),
(19,'Can add migration history',7,'add_migrationhistory'),
(20,'Can change migration history',7,'change_migrationhistory'),
(21,'Can delete migration history',7,'delete_migrationhistory'),
(22,'Can add employer',8,'add_employer'),
(23,'Can change employer',8,'change_employer'),
(24,'Can delete employer',8,'delete_employer'),
(25,'Can add device',9,'add_device'),
(26,'Can change device',9,'change_device'),
(27,'Can delete device',9,'delete_device'),
(28,'Can add history',10,'add_history'),
(29,'Can change history',10,'change_history'),
(30,'Can delete history',10,'delete_history'),
(31,'Can add device update request',11,'add_deviceupdaterequest'),
(32,'Can change device update request',11,'change_deviceupdaterequest'),
(33,'Can delete device update request',11,'delete_deviceupdaterequest');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES 
(1,'pbkdf2_sha256$12000$uW2klOXq8Rp8$ouuDp3IFGBqmZA25y9YjjSrDKxfED67N9mwoIOBmctk=','2014-06-14 13:49:59',1,'igor','','','tr@tr.com',1,1,'2014-06-14 12:12:24'),
(8,'pbkdf2_sha256$12000$KJH4Dml2OI8O$BedtRmjTGar0O+0TdP3JQa1lfuW+5SpCtLkhy0LULEQ=','2014-06-15 05:32:47',0,'399','','','',0,1,'2014-06-15 03:35:11');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES 
(1,'2014-06-14 15:08:15',1,9,'24','hhh ddd M1',2,'Изменен employer.'),
(2,'2014-06-14 15:45:44',1,9,'23','sss ttt Z1',2,'Изменен employer.'),
(3,'2014-06-14 18:38:44',1,9,'23','sss ttt Z1',2,'Изменен employer.'),
(4,'2014-06-14 18:59:09',1,9,'19','iii 5s',2,'Изменен employer.'),
(5,'2014-06-14 19:32:50',1,9,'19','iii 5s',2,'Изменен employer.'),
(6,'2014-06-14 19:33:54',1,9,'10','lll 625',2,'Изменен employer.'),
(7,'2014-06-14 19:34:01',1,9,'6','ppp aaa 10',2,'Изменен employer.'),
(8,'2014-06-14 19:38:21',1,9,'5','mmm ggg S4',2,'Изменен employer.'),
(9,'2014-06-14 19:38:26',1,9,'1','iii 5',2,'Изменен employer.'),
(10,'2014-06-14 19:42:33',1,9,'14','ppp aaa 10',2,'Изменен employer.'),
(11,'2014-06-14 19:42:44',1,9,'17','iii 5',2,'Изменен employer.'),
(12,'2014-06-14 20:32:52',1,9,'9','iii 5',2,'Изменен employer.'),
(13,'2014-06-14 20:36:35',1,9,'6','ppp aaa 10',2,'Изменен employer.'),
(14,'2014-06-14 20:36:41',1,9,'20','sss xxx Z2',2,'Изменен employer.'),
(15,'2014-06-15 00:30:22',1,8,'278','Павел Шпак',2,'Изменен user_id.');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),
(2,'permission','auth','permission'),
(3,'group','auth','group'),
(4,'user','auth','user'),
(5,'content type','contenttypes','contenttype'),
(6,'session','sessions','session'),
(7,'migration history','south','migrationhistory'),
(8,'employer','twid','employer'),
(9,'device','twid','device'),
(10,'history','twid','history'),
(11,'device update request','twid','deviceupdaterequest');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES 
('3cocs6o2c6v3hkelu3k5m8k9g5knnfdm','OTkxODJkOTA3MDdhMDZhMWRiODM3MzdkMmViZmRhMzJhNDBmOGI2ZTp7fQ==','2014-06-29 05:32:49'),
('89fd1jhgus47mo73jpxsibh32rbcmiuk','OTkxODJkOTA3MDdhMDZhMWRiODM3MzdkMmViZmRhMzJhNDBmOGI2ZTp7fQ==','2014-06-29 04:04:19'),
('g5qyoc52s38vi22e6wkqq8x6q95zjnb9','OTkxODJkOTA3MDdhMDZhMWRiODM3MzdkMmViZmRhMzJhNDBmOGI2ZTp7fQ==','2014-06-29 04:00:06'),
('im7aw3eg9sqlavvb570lv3258n8w6la2','OTkxODJkOTA3MDdhMDZhMWRiODM3MzdkMmViZmRhMzJhNDBmOGI2ZTp7fQ==','2014-06-29 03:39:16');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `south_migrationhistory`
--

DROP TABLE IF EXISTS `south_migrationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'twid','0001_initial','2014-06-14 12:18:08'),
(2,'twid','0002_auto__add_field_device_status__del_field_employer_depth_id__add_field_','2014-06-14 12:18:10'),
(3,'twid','0003_auto__chg_field_employer_phone__chg_field_employer_skype','2014-06-14 13:06:07'),
(4,'twid','0004_auto__add_history','2014-06-14 14:13:24'),
(5,'twid','0005_auto__add_field_device_employer','2014-06-14 14:40:36'),
(7,'twid','0006_auto__add_deviceupdaterequest','2014-06-14 15:31:53'),
(8,'twid','0007_auto__add_field_deviceupdaterequest_approved','2014-06-14 17:12:47'),
(9,'twid','0008_auto__add_field_device_date_action__add_field_employer_date_action','2014-06-14 19:08:45'),
(10,'twid','0009_set_data_action','2014-06-14 19:28:34'),
(11,'twid','0010_auto__chg_field_employer_room','2014-06-14 20:08:59'),
(12,'twid','0011_auto__add_field_history_old_employer','2014-06-14 21:30:40'),
(13,'twid','0012_fixed_history','2014-06-14 21:48:26'),
(14,'twid','0013_auto__add_field_employer_user_id','2014-06-15 00:29:36'),
(15,'twid','0014_auto__add_deviceupdateemployer','2014-06-15 02:07:12'),
(16,'twid','0015_auto__add_field_employer_skills','2014-06-15 05:38:56');
/*!40000 ALTER TABLE `south_migrationhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `twid_device`
--

DROP TABLE IF EXISTS `twid_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `twid_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `os` varchar(50) DEFAULT NULL,
  `version` varchar(50) DEFAULT NULL,
  `mac` varchar(50) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `employer_id` int(11),
  `date_action` datetime,
  PRIMARY KEY (`id`),
  KEY `twid_device_0f030170` (`employer_id`),
  CONSTRAINT `employer_id_refs_id_ed60f844` FOREIGN KEY (`employer_id`) REFERENCES `twid_employer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twid_device`
--

LOCK TABLES `twid_device` WRITE;
/*!40000 ALTER TABLE `twid_device` DISABLE KEYS */;

INSERT INTO `twid_device` VALUES (1,'iphone-01','iPhone 5','ios','7.0.3','234-sdfdf-234523-sdfsdf','device/iphone-5.jpg',0,1,'2014-06-14 19:38:26'),(2,'windows-01','Lumia 630','wp','8.0','234-sdfdf-234523-sdfsdf','device/lumia-630.jpg',0,8,'2014-06-14 21:49:23'),(3,'iphone-03','iPhone 5s','ios','7.0.1','234-sdfdf-234523-sdfsdf','device/iphone-5s.jpg',0,NULL,NULL),(4,'android-01','Sony Xperia Z1','android','4.1.1','234-sdfdf-234523-sdfsdf','device/sony-z1.jpg',0,NULL,NULL),(5,'android-03','Sansung Galaxy S4','android','4.0.1','234-sdfdf-234523-sdfsdf','device/galaxy-s4.jpg',0,1,'2014-06-14 19:38:21'),(6,'ipad-03','iPad Air 10','ios','7.0.2','234-sdfdf-234523-sdfsdf','device/ipad-10.jpg',0,3,'2014-06-14 20:36:35'),(7,'android-09','Sony Tablet Z1','android','4.4.1','234-sdfdf-234523-sdfsdf','device/sony-t1.jpg',0,NULL,NULL),(8,'android-10','Huawei Mediapad M1','android','4.2.0','234-sdfdf-234523-sdfsdf','device/huawei-m1.jpg',0,191,'2014-06-15 04:48:09'),(9,'iphone-05','iPhone 5','ios','7.0.3','234-sdfdf-234523-sdfsdf','device/iphone-5.jpg',0,44,'2014-06-14 20:32:52'),(10,'windows-03','Lumia 625','wp','8.0','234-sdfdf-234523-sdfsdf','device/lumia-630.jpg',0,191,'2014-06-15 03:43:37'),(11,'iphone-06','iPhone 5s','ios','7.0.1','234-sdfdf-234523-sdfsdf','device/iphone-5s.jpg',0,NULL,NULL),(12,'android-11','Sony Xperia Z2','android','4.1.1','234-sdfdf-234523-sdfsdf','device/sony-z1.jpg',0,191,'2014-06-15 04:27:25'),(13,'android-12','Sansung Galaxy S4','android','4.0.1','234-sdfdf-234523-sdfsdf','device/galaxy-s4.jpg',0,35,'2014-06-15 01:27:42'),(14,'ipad-01','iPad Air 10','ios','7.0.2','234-sdfdf-234523-sdfsdf','device/ipad-10.jpg',0,11,'2014-06-14 20:46:34'),(15,'android-05','Sony Tablet Z1','android','4.4.1','234-sdfdf-234523-sdfsdf','device/sony-t1.jpg',0,15,'2014-06-15 00:52:25'),(16,'android-07','Huawei Mediapad M1','android','4.2.0','234-sdfdf-234523-sdfsdf','device/huawei-m1.jpg',0,NULL,NULL),(17,'iphone-02','iPhone 5','ios','7.0.1','234-sdfdf-234523-sdfsdf','device/iphone-5.jpg',0,268,'2014-06-15 05:12:36'),(18,'windows-02','Lumia 630','wp','8.1','234-sdfdf-234523-sdfsdf','device/lumia-630.jpg',0,NULL,NULL),(19,'iphone-04','iPhone 5s','ios','7.0.1','234-sdfdf-234523-sdfsdf','device/iphone-5s.jpg',0,2,'2014-06-14 19:32:50'),(20,'android-02','Sony Xperia Z2','android','4.1.1','234-sdfdf-234523-sdfsdf','device/sony-z1.jpg',0,5,'2014-06-14 20:36:41'),(21,'android-04','Sansung Galaxy S5','android','4.0.1','234-sdfdf-234523-sdfsdf','device/galaxy-s4.jpg',0,NULL,NULL),(22,'ipad-02','iPad Air 10','ios','7.0.2','234-sdfdf-234523-sdfsdf','device/ipad-10.jpg',0,NULL,NULL),(23,'android-06','Sony Tablet Z1','android','4.4.1','234-sdfdf-234523-sdfsdf','device/sony-t1.jpg',0,2,'2014-06-14 15:45:44'),(24,'android-08','Huawei Mediapad M1','android','4.2.0','234-sdfdf-234523-sdfsdf','device/huawei-m1.jpg',0,1,'2014-06-14 15:08:15');

/*!40000 ALTER TABLE `twid_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `twid_deviceupdateemployer`
--

DROP TABLE IF EXISTS `twid_deviceupdateemployer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `twid_deviceupdateemployer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_request_id` int(11) NOT NULL,
  `employer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `twid_deviceupdateemployer_466979ab` (`update_request_id`),
  KEY `twid_deviceupdateemployer_0f030170` (`employer_id`),
  CONSTRAINT `employer_id_refs_id_a6763146` FOREIGN KEY (`employer_id`) REFERENCES `twid_employer` (`id`),
  CONSTRAINT `update_request_id_refs_id_034db133` FOREIGN KEY (`update_request_id`) REFERENCES `twid_deviceupdaterequest` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twid_deviceupdateemployer`
--

LOCK TABLES `twid_deviceupdateemployer` WRITE;
/*!40000 ALTER TABLE `twid_deviceupdateemployer` DISABLE KEYS */;
INSERT INTO `twid_deviceupdateemployer` VALUES (1,1,191);
/*!40000 ALTER TABLE `twid_deviceupdateemployer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `twid_deviceupdaterequest`
--

DROP TABLE IF EXISTS `twid_deviceupdaterequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `twid_deviceupdaterequest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employer_id` int(11) NOT NULL,
  `device_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `request_message` longtext NOT NULL,
  `likes` int(11) NOT NULL,
  `dislikes` int(11) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `twid_deviceupdaterequest_0f030170` (`employer_id`),
  KEY `twid_deviceupdaterequest_b6860804` (`device_id`),
  CONSTRAINT `device_id_refs_id_70346ee5` FOREIGN KEY (`device_id`) REFERENCES `twid_device` (`id`),
  CONSTRAINT `employer_id_refs_id_b9e9932b` FOREIGN KEY (`employer_id`) REFERENCES `twid_employer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twid_deviceupdaterequest`
--

LOCK TABLES `twid_deviceupdaterequest` WRITE;
/*!40000 ALTER TABLE `twid_deviceupdaterequest` DISABLE KEYS */;
INSERT INTO `twid_deviceupdaterequest` VALUES (1,191,10,'2014-06-15 03:43:13',';ljkhklhkh;',0,1,0);
/*!40000 ALTER TABLE `twid_deviceupdaterequest` ENABLE KEYS */;
UNLOCK TABLES;

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
  `room` int(10) unsigned NOT NULL,
  `email` varchar(75) NOT NULL,
  `dept_id` int(10) unsigned NOT NULL,
  `image` varchar(100),
  `date_action` datetime,
  `user_id_id` int(11),
  `skills` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `twid_employer_1ffdedc6` (`user_id_id`),
  CONSTRAINT `user_id_id_refs_id_8a6545d1` FOREIGN KEY (`user_id_id`) REFERENCES `auth_user` (`id`)
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

--
-- Table structure for table `twid_history`
--

DROP TABLE IF EXISTS `twid_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `twid_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employer_id` int(11) NOT NULL,
  `device_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `old_employer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `twid_history_0f030170` (`employer_id`),
  KEY `twid_history_b6860804` (`device_id`),
  KEY `twid_history_c35368d5` (`old_employer_id`),
  CONSTRAINT `old_employer_id_refs_id_266a3be2` FOREIGN KEY (`old_employer_id`) REFERENCES `twid_employer` (`id`),
  CONSTRAINT `device_id_refs_id_d9d79e46` FOREIGN KEY (`device_id`) REFERENCES `twid_device` (`id`),
  CONSTRAINT `employer_id_refs_id_266a3be2` FOREIGN KEY (`employer_id`) REFERENCES `twid_employer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twid_history`
--

LOCK TABLES `twid_history` WRITE;
/*!40000 ALTER TABLE `twid_history` DISABLE KEYS */;
INSERT INTO `twid_history` VALUES (1,1,24,'2014-06-14 15:08:15',NULL),
(2,1,23,'2014-06-14 15:45:44',NULL),
(4,1,19,'2014-06-14 18:59:09',NULL),
(6,1,10,'2014-06-14 19:33:54',NULL),
(8,1,5,'2014-06-14 19:38:21',NULL),
(9,1,1,'2014-06-14 19:38:26',NULL),
(12,44,9,'2014-06-14 20:32:52',NULL),
(14,5,20,'2014-06-14 20:36:41',NULL),
(16,54,17,'2014-06-14 20:44:13',6),
(18,62,2,'2014-06-14 21:05:26',NULL),
(19,268,12,'2014-06-14 21:09:52',NULL),
(20,64,2,'2014-06-14 21:48:52',62),
(21,8,2,'2014-06-14 21:49:23',64),
(22,268,10,'2014-06-14 23:03:15',1),
(23,62,12,'2014-06-15 00:31:12',268),
(24,15,15,'2014-06-15 00:52:25',NULL),
(25,54,13,'2014-06-15 01:24:25',NULL),
(26,6,13,'2014-06-15 01:24:51',54),
(27,107,13,'2014-06-15 01:25:00',6),
(28,35,13,'2014-06-15 01:27:42',107),
(29,31,10,'2014-06-15 01:32:41',268),
(30,191,10,'2014-06-15 03:43:37',31),
(31,191,12,'2014-06-15 04:27:25',62),
(32,191,8,'2014-06-15 04:48:09',NULL),
(33,268,17,'2014-06-15 05:12:36',54);
/*!40000 ALTER TABLE `twid_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-15  8:38:59
