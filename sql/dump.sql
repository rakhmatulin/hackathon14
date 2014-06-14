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
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add migration history',7,'add_migrationhistory'),(20,'Can change migration history',7,'change_migrationhistory'),(21,'Can delete migration history',7,'delete_migrationhistory'),(22,'Can add employer',8,'add_employer'),(23,'Can change employer',8,'change_employer'),(24,'Can delete employer',8,'delete_employer'),(25,'Can add device',9,'add_device'),(26,'Can change device',9,'change_device'),(27,'Can delete device',9,'delete_device'),(28,'Can add history',10,'add_history'),(29,'Can change history',10,'change_history'),(30,'Can delete history',10,'delete_history'),(31,'Can add device update request',11,'add_deviceupdaterequest'),(32,'Can change device update request',11,'change_deviceupdaterequest'),(33,'Can delete device update request',11,'delete_deviceupdaterequest');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$uW2klOXq8Rp8$ouuDp3IFGBqmZA25y9YjjSrDKxfED67N9mwoIOBmctk=','2014-06-14 13:49:59',1,'igor','','','tr@tr.com',1,1,'2014-06-14 12:12:24');
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2014-06-14 15:08:15',1,9,'24','Huawei Mediapad M1',2,'Изменен employer.'),(2,'2014-06-14 15:45:44',1,9,'23','Sony Tablet Z1',2,'Изменен employer.'),(3,'2014-06-14 18:38:44',1,9,'23','Sony Tablet Z1',2,'Изменен employer.'),(4,'2014-06-14 18:59:09',1,9,'19','iPhone 5s',2,'Изменен employer.'),(5,'2014-06-14 19:32:50',1,9,'19','iPhone 5s',2,'Изменен employer.'),(6,'2014-06-14 19:33:54',1,9,'10','Lumia 625',2,'Изменен employer.'),(7,'2014-06-14 19:34:01',1,9,'6','iPad Air 10',2,'Изменен employer.'),(8,'2014-06-14 19:38:21',1,9,'5','Sansung Galaxy S4',2,'Изменен employer.'),(9,'2014-06-14 19:38:26',1,9,'1','iPhone 5',2,'Изменен employer.'),(10,'2014-06-14 19:42:33',1,9,'14','iPad Air 10',2,'Изменен employer.'),(11,'2014-06-14 19:42:44',1,9,'17','iPhone 5',2,'Изменен employer.'),(12,'2014-06-14 20:32:52',1,9,'9','iPhone 5',2,'Изменен employer.'),(13,'2014-06-14 20:36:35',1,9,'6','iPad Air 10',2,'Изменен employer.'),(14,'2014-06-14 20:36:41',1,9,'20','Sony Xperia Z2',2,'Изменен employer.');
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
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'migration history','south','migrationhistory'),(8,'employer','twid','employer'),(9,'device','twid','device'),(10,'history','twid','history'),(11,'device update request','twid','deviceupdaterequest');
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
INSERT INTO `django_session` VALUES ('2d0rxxa11u23st7xiekjxxpshfulbt37','YzgwZTQ3YjRhMDg1YjQzOWE4NDc3Y2ZlMWQxMzkyZDNmZTg2YjYxNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-28 13:49:59');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'twid','0001_initial','2014-06-14 12:18:08'),(2,'twid','0002_auto__add_field_device_status__del_field_employer_depth_id__add_field_','2014-06-14 12:18:10'),(3,'twid','0003_auto__chg_field_employer_phone__chg_field_employer_skype','2014-06-14 13:06:07'),(4,'twid','0004_auto__add_history','2014-06-14 14:13:24'),(5,'twid','0005_auto__add_field_device_employer','2014-06-14 14:40:36'),(7,'twid','0006_auto__add_deviceupdaterequest','2014-06-14 15:31:53'),(8,'twid','0007_auto__add_field_deviceupdaterequest_approved','2014-06-14 17:12:47'),(9,'twid','0008_auto__add_field_device_date_action__add_field_employer_date_action','2014-06-14 19:08:45'),(10,'twid','0009_set_data_action','2014-06-14 19:28:34'),(11,'twid','0010_auto__chg_field_employer_room','2014-06-14 20:08:59');
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
INSERT INTO `twid_device` VALUES (1,'iphone-01','iPhone 5','ios','7.0.3','234-sdfdf-234523-sdfsdf','device/iphone-5.jpg',0,1,'2014-06-14 19:38:26'),(2,'windows-01','Lumia 630','wp','8.0','234-sdfdf-234523-sdfsdf','device/lumia-630.jpg',0,NULL,NULL),(3,'iphone-03','iPhone 5s','ios','7.0.1','234-sdfdf-234523-sdfsdf','device/iphone-5s.jpg',0,NULL,NULL),(4,'android-01','Sony Xperia Z1','android','4.1.1','234-sdfdf-234523-sdfsdf','device/sony-z1.jpg',0,NULL,NULL),(5,'android-03','Sansung Galaxy S4','android','4.0.1','234-sdfdf-234523-sdfsdf','device/galaxy-s4.jpg',0,1,'2014-06-14 19:38:21'),(6,'ipad-03','iPad Air 10','ios','7.0.2','234-sdfdf-234523-sdfsdf','device/ipad-10.jpg',0,3,'2014-06-14 20:36:35'),(7,'android-09','Sony Tablet Z1','android','4.4.1','234-sdfdf-234523-sdfsdf','device/sony-t1.jpg',0,NULL,NULL),(8,'android-10','Huawei Mediapad M1','android','4.2.0','234-sdfdf-234523-sdfsdf','device/huawei-m1.jpg',0,NULL,NULL),(9,'iphone-05','iPhone 5','ios','7.0.3','234-sdfdf-234523-sdfsdf','device/iphone-5.jpg',0,44,'2014-06-14 20:32:52'),(10,'windows-03','Lumia 625','wp','8.0','234-sdfdf-234523-sdfsdf','device/lumia-630.jpg',0,1,'2014-06-14 19:33:54'),(11,'iphone-06','iPhone 5s','ios','7.0.1','234-sdfdf-234523-sdfsdf','device/iphone-5s.jpg',0,NULL,NULL),(12,'android-11','Sony Xperia Z2','android','4.1.1','234-sdfdf-234523-sdfsdf','device/sony-z1.jpg',0,NULL,NULL),(13,'android-12','Sansung Galaxy S4','android','4.0.1','234-sdfdf-234523-sdfsdf','device/galaxy-s4.jpg',0,NULL,NULL),(14,'ipad-01','iPad Air 10','ios','7.0.2','234-sdfdf-234523-sdfsdf','device/ipad-10.jpg',0,11,'2014-06-14 20:46:34'),(15,'android-05','Sony Tablet Z1','android','4.4.1','234-sdfdf-234523-sdfsdf','device/sony-t1.jpg',0,NULL,NULL),(16,'android-07','Huawei Mediapad M1','android','4.2.0','234-sdfdf-234523-sdfsdf','device/huawei-m1.jpg',0,NULL,NULL),(17,'iphone-02','iPhone 5','ios','7.0.1','234-sdfdf-234523-sdfsdf','device/iphone-5.jpg',0,54,'2014-06-14 20:44:13'),(18,'windows-02','Lumia 630','wp','8.1','234-sdfdf-234523-sdfsdf','device/lumia-630.jpg',0,NULL,NULL),(19,'iphone-04','iPhone 5s','ios','7.0.1','234-sdfdf-234523-sdfsdf','device/iphone-5s.jpg',0,2,'2014-06-14 19:32:50'),(20,'android-02','Sony Xperia Z2','android','4.1.1','234-sdfdf-234523-sdfsdf','device/sony-z1.jpg',0,5,'2014-06-14 20:36:41'),(21,'android-04','Sansung Galaxy S5','android','4.0.1','234-sdfdf-234523-sdfsdf','device/galaxy-s4.jpg',0,NULL,NULL),(22,'ipad-02','iPad Air 10','ios','7.0.2','234-sdfdf-234523-sdfsdf','device/ipad-10.jpg',0,NULL,NULL),(23,'android-06','Sony Tablet Z1','android','4.4.1','234-sdfdf-234523-sdfsdf','device/sony-t1.jpg',0,2,'2014-06-14 15:45:44'),(24,'android-08','Huawei Mediapad M1','android','4.2.0','234-sdfdf-234523-sdfsdf','device/huawei-m1.jpg',0,1,'2014-06-14 15:08:15');
/*!40000 ALTER TABLE `twid_device` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twid_deviceupdaterequest`
--

LOCK TABLES `twid_deviceupdaterequest` WRITE;
/*!40000 ALTER TABLE `twid_deviceupdaterequest` DISABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=300 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twid_employer`
--

LOCK TABLES `twid_employer` WRITE;
/*!40000 ALTER TABLE `twid_employer` DISABLE KEYS */;
INSERT INTO `twid_employer` VALUES (1,4,'Vitaly','Aksionchyk','Виталий','Аксенчик','1980-12-26','Vitaly.Aksionchyk','+375291826664',519,'Vitaly.Aksionchyk@itechart-group.com',2,'employer/4_11.png','2014-06-14 19:38:26'),(2,5,'Sergey','Aldoshkin','Сергей','Алдошкин','1977-06-30','Sergey_Aldoshkin','+375297735539',608,'Sergey.Aldoshkin@itechart-group.com',8,'employer/5_2.png','2014-06-14 19:34:01'),(3,7,'Viktoria','Balakshina','Виктория','Балакшина','1986-11-05','viktoria.balakshina','+375297049428',521,'viktoria.balakshina@itechart-group.com',3,'employer/7_2.png','2014-06-14 20:36:35'),(4,9,'Vasil','Boika','Василий','Бойко','1978-07-03','Vasil.Boika','+375293533780',1,'Vasil.Boika@itechart-group.com',15,'employer/9_2.png','2014-06-14 19:42:44'),(5,10,'Siarhei','Bunas','Сергей','Бунас','1988-04-26','siarhei.bunas','+375295645194',521,'siarhei.bunas@itechart-group.com',11,'employer/10_2.png','2014-06-14 20:36:41'),(6,12,'Yury','Bykovsky','Юрий','Быковский','1982-08-05','yury_bykovsky','+375291208434',523,'yury.bykovsky@itechart-group.com',2,'employer/12_2.png','2014-06-14 20:43:57'),(7,15,'Vladimir','Dulevich','Владимир','Дулевич','1987-06-30','quickingskyper','+375293323711',605,'Vladimir.Dulevich@itechart-group.com',18,'employer/15_2.png',NULL),(8,22,'Pavel','Gurin','Павел','Гурин','1986-03-16','Pavel.Gurin','+375293500117',522,'Pavel.Gurin@itechart-group.com',10,'employer/22_2.png',NULL),(9,23,'Pavel','Hizhuk','Павел','Хижук','1987-01-29','pavel.hizhuk','+375297938231',521,'pavel.hizhuk@itechart-group.com',11,'employer/23_2.png',NULL),(10,24,'Pavel','Hudau','Павел','Гудов','1987-07-24','Pavel.Hudau','+375295559049',1,'Pavel.Hudau@itechart-group.com',15,'employer/24_2.png',NULL),(11,25,'Vitali','Kasyanenka','Виталий','Касьяненко','1985-03-30','vitali.kasyanenka','+375297556416',520,'vitali.kasyanenka@itechart-group.com',4,'employer/25_2.png','2014-06-14 20:46:34'),(12,26,'Denis','Kolkovskiy','Денис','Колковский','1985-09-04','dzianis_kalkouski','+375297029870',500,'Denis.Kolkovskiy@itechart-group.com',11,'employer/26_2.png',NULL),(13,28,'Irina','Konovalova','Ирина','Коновалова','1971-05-03','Ira.Konovalova1','+375447581718',612,'Irina.Konovalova@itechart-group.com',5,'employer/28_2.png',NULL),(14,30,'Gennady','Korolev','Геннадий','Королев','1973-12-21','ul-hank','+375296777064',605,'Gennady.Korolev@itechart-group.com',18,'employer/30_2.png',NULL),(15,31,'Vasiliy','Kotov','Василий','Котов','1987-10-29','xmpgek','+375295686035',505,'vasiliy.kotov@itechart-group.com',3,'employer/31_2.png',NULL),(16,32,'Sergei','Kovalenko','Сергей','Коваленко','1974-01-21','Sergei.Kovalenko','+375296768057',0,'Sergei.Kovalenko@itechart-group.com',5,'employer/32_2.png',NULL),(17,33,'Alexandr','Kovalev','Александр','Ковалев','1983-06-30','Alexandr.Kovalev','+375297528130',522,'Alexandr.Kovalev@itechart-group.com',10,'employer/33_2.png',NULL),(18,34,'Timofey','Kovaloyv','Тимофей','Ковалев','1985-12-30','Timofey.Kovaloyv','+375291840967',605,'Timofey.Kovaloyv@itechart-group.com',18,'employer/34_2.png',NULL),(19,35,'Dmitry','Kozlov','Дмитрий','Козлов','1984-12-21','mitschman_','+375297798457',608,'Dmitry.Kozlov@itechart-group.com',3,'employer/35_2.png',NULL),(20,37,'Sergei','Krylov','Сергей','Крылов','1986-10-22','sergei.krylov','+375293401050',519,'sergei.krylov@itechart-group.com',2,'employer/37_2.png',NULL),(21,39,'Andrey','Kulgachev','Андрей','Кульгачев','1978-05-11','grizzlick','+375296907735',613,'Andrey.Kulgachev@itechart-group.com',5,'employer/39_2.png',NULL),(22,47,'Denis','Maslov','Денис','Маслов','1979-03-26','Den.Maslov','+375296714874',609,'Denis.Maslov@itechart-group.com',19,'employer/47_2.png',NULL),(23,49,'Egor','Moroz','Егор','Мороз','1986-11-07','egor.moroz','+375297617254',505,'egor.moroz@itechart-group.com',3,'employer/49_2.png',NULL),(24,50,'Yan','Nesteruk','Ян','Нестерук','1987-04-22','yan.nesteryk','+375295049657',503,'yan.nesteruk@itechart-group.com',3,'employer/50_2.png',NULL),(25,53,'Alexei','Pavlov','Алексей','Павлов','1977-05-06','Alexey_Pavlov','+375296558842',1,'Alexey.Pavlov@itechart-group.com',15,'employer/53_2.png',NULL),(26,55,'Andrey','Prohorenko','Андрей','Прохоренко','1977-04-20','Andrey.Prohorenko','+375293202563',505,'Andrey.Prohorenko@itechart-group.com',3,'employer/55_2.png',NULL),(27,57,'Alexander','Radevich','Александр','Радевич','1986-07-14','Alexandr.Radevich','+375295632334',1,'Alexander.Radevich@itechart-group.com',18,'employer/57_2.png',NULL),(28,59,'Dmitry','Roy','Дмитрий','Рой','1978-04-14','Dmitry.Roy','+375296442201',520,'Dmitry.Roy@itechart-group.com',4,'employer/59_2.png',NULL),(29,61,'Andrei','Shenets','Андрей','Шенец','1988-01-04','andrew.shenets','+375293135053',522,'andrei.shenets@itechart-group.com',10,'employer/61_2.png',NULL),(30,62,'Svetlana','Shimanskaya','Светлана','Шиманская','1978-10-19','Svetlana.Shimanskaya','+375293343411',0,'Svetlana.Shimanskaya@itechart-group.com',5,'employer/62_2.png',NULL),(31,63,'Konstantin','Shpakovski','Константин','Шпаковский','1980-07-22','Konstantin.Shpakovski','+375296800722',519,'K.Shpakovski@itechart-group.com',2,'employer/63_2.png',NULL),(32,66,'Alexander','Sokolchik','Александр','Сокольчик','1986-09-12','Alexander.Sokolchik','+375336634873',1,'Alexander.Sokolchik@itechart-group.com',1,'employer/66_2.png',NULL),(33,73,'Gleb','Vasilevsky','Глеб','Василевский','1986-09-12','vgoskype','+375298603179',605,'Gleb.Vasilevsky@itechart-group.com',4,'employer/73_2.png',NULL),(34,74,'Dmitry','Vishnyakov','Дмитрий','Вишняков','1986-05-13','Dmitry.Vishnyakov','+375295113840',607,'Dmitry.Vishnyakov@itechart-group.com',18,'employer/74_2.png',NULL),(35,81,'Nadya','Zhuevskaya','Надежда','Жуевская','1986-03-17','Nadya.Zhuevskaya','+375297849096',517,'Nadya.Zhuevskaya@itechart-group.com',6,'employer/81_2.png',NULL),(36,83,'Denis','Zhylin','Денис','Жилин','1977-08-09','eisenx','+375297508470',518,'Denis.Zhylin@itechart-group.com',9,'employer/83_2.png',NULL),(37,87,'Darya','Zeliankova','Дарья','Зеленкова','1980-12-05','darya.zeliankova','+375-29-269-08-91',612,'darya.zeliankova@itechart-group.com',5,'employer/87_2.png',NULL),(38,91,'Mikhail','Aksionchyk','Михаил','Аксенчик','1983-08-17','m.aksionchyk','+375296634900',526,'mikhail.aksionchyk@itechart-group.com',16,'employer/91_2.png',NULL),(39,96,'Andrey','Kholod','Андрей','Холод','1979-05-01','scout_by','+375297602188',518,'Andrey.Kholod@itechart-group.com',9,'employer/96_2.png',NULL),(40,98,'Andrey','Mikhalkov','Андрей','Михальков','1983-07-04','andrew.mihalkov','+375293636954',605,'andrey.mikhalkov@itechart-group.com',3,'employer/98_2.png',NULL),(41,100,'Igor','Chernetsky','Игорь','Чернецкий','1986-03-09','Chernetsky.Igor','+375297930772',505,'Igor.Chernetsky@itechart-group.com',3,'employer/100_2.png',NULL),(42,102,'Arseni','Radziuk','Арсений','Радюк','1985-07-02','aradzyuk','+375297695744',320,'arseni.radziuk@itechart-group.com',1,'employer/102_2.png',NULL),(43,113,'Denis','Pakhomov','Денис','Пахомов','1979-01-12','Denis_Pakhomov','+375296139837',613,'Denis.Pakhomov@itechart-group.com',5,'employer/113_2.png',NULL),(44,114,'Anna','Senuk','Анна','Сенюк','1988-01-03','anna.zhelukevich','+375298835481',517,'anna.zhelukevich@itechart-group.com',6,'employer/114_2.png','2014-06-14 20:32:52'),(45,118,'Alexander','Ratomski','Александр','Ратомский','1988-03-04','alexander.ratomski','+375295542354',505,'alexander.ratomski@itechart-group.com',11,'employer/118_2.png',NULL),(46,120,'Alexey','Bedunkevich','Алексей','Бедункевич','1987-08-28','Alexey.Bedunkevich','+375298602817',526,'Alexey.Bedunkevich@itechart-group.com',4,'employer/120_2.png',NULL),(47,121,'Natalya','Krupskaya','Наталья','Крупская','1985-10-28','natalya.krupskaya','+375295078624',515,'natalya.krupskaya@itechart-group.com',8,'employer/121_2.png',NULL),(48,122,'Pavel','Ryabov','Павел','Рябов','1987-11-10','Pavel.Ruabov','+375292586914',608,'Pavel.Ryabov@itechart-group.com',3,'employer/122_2.png',NULL),(49,128,'Dmitry','Mochalov','Дмитрий','Мочалов','1988-09-06','dmitry.mochalov_1','+375295431817',505,'dmitry.mochalov@itechart-group.com',3,'employer/128_2.png',NULL),(50,129,'Dmitry','Orlov','Дмитрий','Орлов','1988-06-23','dmtr.orlov','+375297149288',505,'dmitry.orlov@itechart-group.com',3,'employer/129_2.png',NULL),(51,130,'Olga','Andreyeva','Ольга','Андреева','1979-05-01','Olga_Andreyeva_79','+375 29 656 29 01',612,'olga.andreyeva@itechart-group.com',14,'employer/130_2.png',NULL),(52,131,'Alexander','Struchalin','Александр','Стручалин','1983-12-06','alexandr.struchalin','+375 29 74 64 272',609,'alexander.struchalin@itechart-group.com',4,'employer/131_2.png',NULL),(53,134,'Eugeny','Kobzar','Евгений','Кобзарь','1983-11-09','misterw2','+375 29 769 83 69',523,'eugeny.kobzar@itechart-group.com',2,'employer/134_2.png',NULL),(54,135,'Konstantin','Tsybulko','Константин','Цыбулько','1990-03-19','konstantin.tsybulko','+275296815830',517,'konstantin.tsybulko@itechart-group.com',6,'employer/135_2.png','2014-06-14 20:44:13'),(55,138,'Vitaly','Polyashov','Виталий','Поляшов','1989-05-16','vitaliy.polyashov','+375292694715',687,'vitaly.polyashov@itechart-group.com',3,'employer/138_2.png',NULL),(56,139,'Yaroslav','Shulyak','Ярослав','Шуляк','1985-05-07','jaroslav.shulyak','+375297699810',605,'Yaroslav.Shulyak@itechart-group.com',18,'employer/139_2.png',NULL),(57,142,'Alexander','Govorukhin','Александр','Говорухин','1985-07-05','merovingian.by','+375447557699',521,'alexander.govorukhin@itechart-group.com',8,'employer/142_2.png',NULL),(58,143,'Dmitry','Ermakov','Дмитрий','Ермаков','1973-11-27','ermak_d','+375296990126',517,'Dmitry.Ermakov@itechart-group.com',6,'employer/143_2.png',NULL),(59,144,'Denis','Gursky','Денис','Гурский','1989-05-16','denis_gursky','+375292371078',526,'denis.gursky@itechart-group.com',16,'employer/144_2.png',NULL),(60,153,'Vladimir','Kazachenok','Владимир','Казачёнок','1987-11-06','vladimir.kazachenok','+375 44 711 2129',605,'vladimir.kazachenok@itechart-group.com',18,'employer/153_2.png',NULL),(61,154,'Dmitry','Zhuravkin','Дмитрий','Журавкин','1988-12-02','dmitry.zhuravkin','+375 029 256 45 18',603,'Dmitry.Zhuravkin@itechart-group.com',8,'employer/154_2.png',NULL),(62,155,'Yury','Chetyrbok','Юрий','Четырбок','1988-04-29','yury.chetyrbok','+375 029 224 07 43',527,'Yury.Chetyrbok@itechart-group.com',21,'employer/155_2.png',NULL),(63,157,'Ilia','Sokolov','Илья','Соколов','1989-06-12','ilia.sokolov','+375 029 551 05 63',500,'Ilia.Sokolov@itechart-group.com',11,'employer/157_2.png',NULL),(64,163,'Denis','Fedynich','Денис','Федынич','1988-04-02','deniplane','+375 029  673 36 47',500,'denis.fedynich@itechart-group.com',11,'employer/163_2.png',NULL),(65,167,'Alexander','Chajka','Александр','Чайка','1985-09-09','alexandr-chaika','+275295105493',519,'Alexander.Chajka@itechart-group.com',2,'employer/167_2.png',NULL),(66,171,'Gennady','Novik','Геннадий','Новик','1974-06-11','gennady.novik','+375 029  551 23 96',611,'gennady.novik@itechart-group.com',1,'employer/171_2.png',NULL),(67,175,'Denis','Sokol','Денис','Сокол','1988-03-31','denis.sokol1','+375 25 7584834',528,'Denis.Sokol@itechart-group.com',1,'employer/175_2.png',NULL),(68,180,'Ilya','Kozik','Илья','Козик','1988-10-02','ilya.kozik','+375 29  342 66 94',505,'Ilya.Kozik@itechart-group.com',3,'employer/180_2.png',NULL),(69,183,'Oleg','Saraseko','Олег','Сарасеко','1983-10-24','oleg.saraseko','+375256440407',603,'Oleg.Saraseko@itechart-group.com',8,'employer/183_2.png',NULL),(70,190,'Siarhei','Skiba','Сергей','Скиба','1974-06-30','sergey.skiba','+375 29  776 48 28',320,'Siarhei.Skiba@itechart-group.com',1,'employer/190_2.png',NULL),(71,193,'Mikhail','Shestak','Михаил','Шестак','1981-10-27','mikhail.shestak','+375 029  569 66 68',503,'Mikhail.Shestak@itechart-group.com',21,'employer/193_2.png',NULL),(72,196,'Dmitry','Pivovarov','Дмитрий','Пивоваров','1986-06-06','d.pivovarov','+375 29 763 59 51',1,'dmitry.pivovarov@itechart-group.com',15,'employer/196_2.png',NULL),(73,197,'Tatyana','Letschenok','Татьяна','Лещенок','1989-03-19','tatyana.letschenok','+375 029  509 11 14',611,'tatyana.letschenok@itechart-group.com',8,'employer/197_2.png',NULL),(74,202,'Olga','Lovgach','Ольга','Ловгач','1988-04-18','olga.volskaya','+375 29 706 00 63',609,'Olga.Volskaya@itechart-group.com',4,'employer/202_2.png',NULL),(75,205,'Evgeny','Shimanovich','Евгений','Шиманович','1991-01-08','eugene.shimanovich','+375 29 9315120, +375 33 3116138',500,'Evgeny.Shimanovich@itechart-group.com',11,'employer/205_2.png',NULL),(76,206,'Sergey','Shiroky','Сергей','Широкий','1990-01-26','wideserg','+375 29 8814410',500,'Sergey.Shiroky@itechart-group.com',11,'employer/206_2.png',NULL),(77,207,'Denis','Antonenko','Денис','Антоненко','1990-01-13','denis.antonenko','+375 33 675 41 63',608,'Denis.Antonenko@itechart-group.com',8,'employer/207_2.png',NULL),(78,209,'Dmitry','Ivashutin','Дмитрий','Ивашутин','1987-06-04','dmitriy.ivashutin.itechart','+375 25 9123459',522,'Dmitry.Ivashutin@itechart-group.com',10,'employer/209_2.png',NULL),(79,210,'Alexander','Povkolas','Александр','Повколас','1988-12-02','alexander.povkolas','+375 29 501 86 44',610,'Alexander.Povkolas@itechart-group.com',8,'employer/210_2.png',NULL),(80,216,'Roman','Andreyenko','Роман','Андреенко','1989-03-02','roman.andreyenko','+375 29 322 84 54',503,'Roman.Andreyenko@itechart-group.com',3,'employer/216_2.png',NULL),(81,219,'Dmitry','Ryabichko','Дмитрий','Рябичко','1978-12-21','necrogrammist','+375 029  559 53 22',608,'Dmitry.Ryabichko@itechart-group.com',10,'employer/219_2.png',NULL),(82,220,'Anton','Kukharenko','Антон','Кухаренко','1990-08-25','kuharenko.anton','+375295430067',505,'anton.kukharenko@itechart-group.com',3,'employer/220_2.png',NULL),(83,221,'Kirill','Chalenko','Кирилл','Чаленко','1989-08-22','kiryl.chalenka','+375 29 7075116',603,'Kirill.Chalenko@itechart-group.com',8,'employer/221_2.png',NULL),(84,223,'Yulia','Pakhomova','Юлия','Пахомова','1978-10-22','julia.a.pakhomova','',604,'Yulia.Pakhomova@itechart-group.com',9,'employer/223_2.png',NULL),(85,224,'Stanislava','Kuzmenkova','Станислава','Кузьменкова','1977-04-25','stanislava.kuzmiankova','',622,'S.Kuzmenkova@itechart-group.com',20,'employer/224_2.png',NULL),(86,225,'Sergey','Bondar','Сергей','Бондарь','1989-06-21','sergiy_bondar','+375 29 611 76 56',608,'Sergey.Bondar@itechart-group.com',10,'employer/225_2.png',NULL),(87,228,'Anastasia','Vasilevskaya','Анастасия','Василевская','1990-07-26','anastasia_vasilevskaya1','+375 29 256 88 78',524,'Nastya.Vasilevskaya@itechart-group.com',4,'employer/228_2.png',NULL),(88,230,'Alexander','Yazvinsky','Александр','Язвинский','1990-03-02','yazvin','+375 33 662 73 52',503,'Alexander.Yazvinsky@itechart-group.com',11,'employer/230_2.png',NULL),(89,232,'Anatoly','Kurtsevich','Анатолий','Курцевич','1991-03-03','anatoly.kurtsevich','+375 44 572 89 49',519,'Anatoly.Kurtsevich@itechart-group.com',2,'employer/232_2.png',NULL),(90,234,'Evgeny','Razumov','Евгений','Разумов','1989-09-14','evgeny_razumov','+375 29 246 91 21',521,'Evgeny.Razumov@itechart-group.com',8,'employer/234_2.png',NULL),(91,235,'Olga','Tsareva','Ольга','Царева','1987-04-01','olle.tsareva','+375 29 711 29 40',504,'Olga.Tsareva@itechart-group.com',2,'employer/235_2.png',NULL),(92,236,'Maxim','Ivashkevich','Максим','Ивашкевич','1990-04-24','maxim.ivashkevich','+375 29 369 01 31',503,'Maxim.Ivashkevich@itechart-group.com',3,'employer/236_2.png',NULL),(93,238,'Alexey','Klimuk','Алексей','Климук','1990-01-10','quicksand_0','+375 29 777 59 87',504,'Alexey.Klimuk@itechart-group.com',2,'employer/238_2.png',NULL),(94,240,'Vadim','Shevtsov','Вадим','Шевцов','1983-11-13','vadim_shevtsov','+375 29 553 24 51',523,'Vadim.Shevtsov@itechart-group.com',2,'employer/240_2.png',NULL),(95,241,'Anton','Shutik','Антон','Шутик','1989-07-05','','+375 29 2524429',523,'Anton.Shutik@itechart-group.com',2,'employer/241_2.png',NULL),(96,243,'Igor','Leonov','Игорь','Леонов','1990-02-25','chtobzvonit','+275 29 263 88 19',320,'Igor.Leonov@itechart-group.com',1,'employer/243_2.png',NULL),(97,244,'Ilya','Chaplin','Илья','Чаплин','1990-08-02','charley_chaplin','+375 33 674 64 57',603,'Ilya.Chaplin@itechart-group.com',8,'employer/244_2.png',NULL),(98,246,'Alexander','Ermolayev','Александр','Ермолаев','1989-12-19','ialexander.ermolaev','+375 29 114 24 42',522,'Alexander.Ermolayev@itechart-group.com',10,'employer/246_2.png',NULL),(99,247,'Alexander','Lobankov','Александр','Лобанков','1986-11-29','tigra.by','+375 29 500 79 82',605,'Alexander.Lobankov@itechart-group.com',8,'employer/247_2.png',NULL),(100,251,'Pavel','Barabolkin','Павел','Бараболкин','1987-10-29','pavel.barabolkin','+375 29 277 68 53',526,'Pavel.Barabolkin@itechart-group.com',16,'employer/251_2.png',NULL),(101,254,'Alexander','Tolstoy','Александр','Толстой','1985-11-14','','+375 25 937 75 27',320,'Alexander.Tolstoy@itechart-group.com',1,'employer/254_2.png',NULL),(102,255,'Pavel','Krylatov','Павел','Крылатов','1991-07-04','krylatov.pavel','+375 29 150 67 44',526,'Pavel.Krylatov@itechart-group.com',16,'employer/255_2.png',NULL),(103,261,'Vladimir','Zhidal','Владимир','Жидаль','1989-05-17','skweerel','+375 29876 36 38',521,'Vladimir.Zhidal@itechart-group.com',11,'employer/261_2.png',NULL),(104,262,'Gennady','Andreyev','Геннадий','Андреев','1987-09-14','gennady.andreyev','+375 29 572 82 35',504,'Gennady.Andreyev@itechart-group.com',2,'employer/262_2.png',NULL),(105,263,'Dmitry','Turach','Дмитрий','Турач','1990-05-19','dmitry.turach','+375 29 283 81 99',502,'Dmitry.Turach@itechart-group.com',3,'employer/263_2.png',NULL),(106,264,'Alexander','Bladyko','Александр','Бладыко','1991-04-17','bladyko.alexander','+375 29 561 80 36',500,'Alexander.Bladyko@itechart-group.com',11,'employer/264_2.png',NULL),(107,265,'Evgeny','Kapylsky','Евгений','Капыльский','1989-11-08','evgeny.kapilsky','+375 29 195 55 72',500,'Evgeny.Kapylsky@itechart-group.com',11,'employer/265_2.png',NULL),(108,267,'Alexey','Matjuk','Алексей','Матюк','1986-08-26','psa.alexei.matuk','+375 29  604 10 74',503,'Alexey.Matjuk@itechart-group.com',3,'employer/267_2.png',NULL),(109,268,'Evgeny','Lychkovsky','Евгений','Лычковский','1990-11-29','miphreal','+375 29 566 56 91',504,'Evgeny.Lychkovsky@itechart-group.com',2,'employer/268_2.png',NULL),(110,269,'Pavel','Lapin','Павел','Лапин','1982-09-22','pavel.lapin22','+375 44 739 77 23',608,'Pavel.Lapin@itechart-group.com',10,'employer/269_2.png',NULL),(111,272,'Roman','Prokhodsky','Роман','Проходский','1990-12-12','romashkapro','+375 44 702 89 91',500,'Roman.Prokhodsky@itechart-group.com',11,'employer/272_2.png',NULL),(112,274,'Alexey','Skachikhin','Алексей','Скачихин','1990-07-23','','+375 33 640 24 71',521,'Alexey.Skachikhin@itechart-group.com',11,'employer/274_2.png',NULL),(113,275,'Valery','Kasinsky','Валерий','Касинский','1981-02-08','valery.kasinski','+375 29 770 08 21',320,'valery.kasinsky@itechart-group.com',1,'employer/275_1.png',NULL),(114,276,'Andrey','Senchuk','Андрей','Сенчук','1990-12-02','andrei.senchuk','+375 29 306 33 40',526,'Andrey.Senchuk@itechart-group.com',3,'employer/276_1.png',NULL),(115,277,'Antonina','Vashchilo','Антонина','Ващило-Кутас','1983-08-29','Antonina_VK','+375 29 567 07 72',612,'Antonina.Vashchilo@itechart-group.com',14,'employer/277_1.png',NULL),(116,278,'Alexander','Matusevich','Александр','Матусевич','1991-03-30','alexander.matusevich1','+375 33 689 28 09',527,'Alexander.Matusevich@itechart-group.com',11,'employer/278_1.png',NULL),(117,281,'Alexander','Solovey','Александр','Соловей','1981-11-14','alexander.solovey','+375 29 774 89 48',1,'Alexander.Solovey@itechart-group.com',15,'employer/281_1.png',NULL),(118,282,'Vyacheclav','Ivantsov','Вячеслав','Иванцов','1986-02-22','ivantsov_vo','+375 29 803 94 74',518,'Vyacheslav.Ivantsov@itechart-group.com',9,'employer/282_1.png',NULL),(119,284,'German','Demsky','Герман','Демский','1990-12-20','dhermand','+375 29 148 04 29',528,'German.Demsky@itechart-group.com',10,'employer/284_1.png',NULL),(120,286,'Anton','Nekrasov','Антон','Некрасов','1985-09-28','anton.nekrasov85','+375 29 330 97 29',610,'Anton.Nekrasov@itechart-group.com',1,'employer/286_1.png',NULL),(121,287,'Alexander','Odinets','Александр','Одинец','1991-05-08','alexander.odinets1','+375 29 340 85 27',610,'Alexander.Odinets@itechart-group.com',1,'employer/287_1.png',NULL),(122,290,'Sergey','Gontsarevich','Сергей','Гонцаревич','1990-11-10','gontsarevich_sergey','+375 29 279 05 24',521,'Sergey.Gontsarevich@itechart-group.com',11,'employer/290_1.png',NULL),(123,291,'Andrey','Pavelchuk','Андрей','Павельчук','1989-05-15','pavelchuk.andrey','+375 33 330 00 33',523,'Andrey.Pavelchuk@itechart-group.com',2,'employer/291_1.png',NULL),(124,292,'Olga','Katko','Ольга','Котько','1970-01-01','','',604,'Olga.Katko@itechart-group.com',5,'employer/292_1.png',NULL),(125,294,'Ekaterina','Lavrenko','Екатерина','Лавренко','1970-01-01',NULL,NULL,0,'',14,'employer/294_1.png',NULL),(126,296,'Alexander','Petkevich','Александр','Петкевич','1979-12-18','alex.doggy','+375 29 653 15 75',610,'Alexander.Petkevich@itechart-group.com',1,'employer/296.png',NULL),(127,297,'Nikolay','Saskovets','Николай','Сасковец','1989-01-03','nikolay.saskovets','+375 29 323 27 55',519,'Nikolay.Saskovets@itechart-group.com',2,'employer/297.png',NULL),(128,302,'Alexander','Amyago','Александр','Амяго','1989-03-02','alexander.amyago','+375291731976',527,'Alexander.Amyago@itechart-group.com',21,'employer/302.png',NULL),(129,303,'Ludmila','Kulgacheva','Людмила','Кульгачёва','1970-01-01',NULL,NULL,0,'',5,'employer/303.png',NULL),(130,304,'Marina','Kovalenko','Марина','Коваленко','1970-01-01',NULL,NULL,0,'Marina.Kovalenko@itechart-group.com',5,'employer/304.png',NULL),(131,305,'Valery','Kovalenko','Валерий','Коваленко','1970-01-01',NULL,NULL,0,'',5,'employer/305.png',NULL),(132,308,'Dmitry','Shiray','Дмитрий','Ширай','1990-08-19','dimitry_shiray','+375 29 188 63 43',607,'Dmitry.Shiray@itechart-group.com',11,'employer/308.png',NULL),(133,309,'Nadezhda','Shkuda','Надежда','Шкуда','1990-05-23','pechenka436','+375 29 336 48 13',502,'Nadezhda.Shkuda@itechart-group.com',4,'employer/309.png',NULL),(134,312,'Yury','Kunitsky','Юрий','Куницкий','1990-09-10','yury_kunitsky','+375 29 723 10 07',687,'Yury.Kunitsky@itechart-group.com',3,'employer/312.png',NULL),(135,313,'Sergey','Svirsky','Сергей','Свирский','1990-08-16','gen_meow','+375 29 189 11 23',500,'Sergey.Svirsky@itechart-group.com',11,'employer/313.png',NULL),(136,314,'Marina','Zorich','Марина','Зорич','1985-09-08','zorich.marina','+375291422463',612,'Marina.Zorich@itechart-group.com',14,'employer/314.png',NULL),(137,315,'Igor','Veyalkin','Игорь','Веялкин','1989-11-25','igor.veyalkin','+375 29 306 17 05',503,'Igor.Veyalkin@itechart-group.com',3,'employer/315.png',NULL),(138,316,'Alexander','Kozlov','Александр','Козлов','1990-07-28','colberg_','+375 25 791 73 26',528,'Alexander.Kozlov@itechart-group.com',10,'employer/316.png',NULL),(139,317,'Oksana','Kovalenko','Оксана','Коваленко','1970-01-01',NULL,NULL,0,'oksana.kovalenko@itechart-group.com',5,'employer/317.png',NULL),(140,318,'Andrey','Yurashevich','Андрей','Юрашевич','1992-06-30','andrey.yurashevich','+375 29 527 09 70',521,'Andrey.Yurashevich@itechart-group.com',11,'employer/318.png',NULL),(141,324,'Sergey','Karavay','Сергей','Каравай','1990-04-13','gpkaravay','+375 33 6663939',523,'Sergey.Karavay@itechart-group.com',2,'employer/324.png',NULL),(142,326,'Dmitry','Sergeyev','Дмитрий','Сергеев','1992-05-20','','',519,'Dmitry.Sergeyev@itechart-group.com',1,'employer/326.png',NULL),(143,327,'Andrey','Avramchikov','Андрей','Аврамчиков','1990-09-20','unitedstates42','+375 44 739 24 62',504,'Andrey.Avramchikov@itechart-group.com',2,'employer/327.png',NULL),(144,328,'Evgeny','Gurinovich','Евгений','Гуринович','1991-12-07','evgeny.gurinovich','+375 29 279 23 67',526,'Evgeny.Gurinovich@itechart-group.com',4,'employer/328.png',NULL),(145,330,'Alexey','Patsovsky','Алексей','Пацовский','1992-07-05','alexey.patsovsky','+375 29 393 28 79',515,'Alexey.Patsovsky@itechart-group.com',11,'employer/330.png',NULL),(146,335,'Alexander','Turuta','Александр','Турута','1991-09-24','alexandr.turuta','+375 29 257 20 62',605,'Alexander.Turuta@itechart-group.com',3,'employer/335.png',NULL),(147,336,'Dmitry','Rodov','Дмитрий','Родов','1991-08-12','dmiitryrodov','+375 29 811 86 99, +375 44 722 86 99',515,'Dmitry.Rodov@itechart-group.com',11,'employer/336.png',NULL),(148,339,'Alexey','Avdey','Алексей','Авдей','1992-07-20','alexcre8or','+375 29 857 95 85',608,'Alexey.Avdey@itechart-group.com',8,'employer/339.png',NULL),(149,344,'Ilya','Markevich','Илья','Маркевич','1991-10-20','ilybarca','+375447891320',515,'Ilya.Markevich@itechart-group.com',11,'employer/344.png',NULL),(150,347,'Ilya','Gumbar','Илья','Гумбар','1989-12-12','ilya.humbar','+375 29 657 09 41',608,'Ilya.Gumbar@itechart-group.com',10,'employer/347.png',NULL),(151,348,'Pavel','Tschors','Павел','Щорс','1991-06-04','pavel.tschors','+375 25 941 32 78',603,'Pavel.Tschors@itechart-group.com',8,'employer/348.png',NULL),(152,349,'Artur','Nazarenko','Артур','Назаренко','1992-04-17','demerk24','+375 29 350 79 84',523,'Artur.Nazarenko@itechart-group.com',2,'employer/349.png',NULL),(153,351,'Axana','Skinder','Оксана','Скиндер','1982-12-14','oxana_yurkina','+375 29 643 69 33',616,'Axana.Pretkel@itechart-group.com',17,'employer/351.png',NULL),(154,353,'Dmitry','Skobelev','Дмитрий','Скобелев','1992-02-19','stalin_labs','+375 29 750 72 45',502,'Dmitry.Skobelev@itechart-group.com',10,'employer/353.png',NULL),(155,354,'Ekaterina','Krasnotschek','Екатерина','Краснощек','1989-11-29','poet-romantic','+375 29 390 07 99',610,'E.Krasnotschek@itechart-group.com',1,'employer/354.png',NULL),(156,355,'Anna','Krasnikova','Анна','Красникова','1988-07-09','agentanno3000','+375 25 999 71 34',528,'Anna.Krasnikova@itechart-group.com',10,'employer/355.png',NULL),(157,356,'Tatyana','Krutovtsova','Татьяна','Крутовцова','1990-04-24','tanya_krutov','+375 29 512 67 90',687,'tatyana.krutovtsova@itechart-group.com',4,'employer/356.png',NULL),(158,358,'Andrey','Karavaychik','Андрей','Каравайчик','1987-02-20','andrewqwert','+375 44 731 95 26',605,'andrey.karavaychik@itechart-group.com',3,'employer/358.png',NULL),(159,359,'Artem','Lomanovich','Артем','Ломанович','1989-12-30','pabacham','+375 25 996 50 56',527,'artem.lomanovich@itechart-group.com',2,'employer/359.png',NULL),(160,360,'Alexey','Puchko','Алексей','Пучко','1991-06-02','thepokep','+375 29 154 39 46',503,'alexey.puchko@itechart-group.com',3,'employer/360.png',NULL),(161,361,'Tatyana','Chernyavskaya','Татьяна','Чернявская','1990-08-08','tatusia.ch','+375 29 522 79 64',610,'tatyana.chernyavskaya@itechart-group.com',8,'employer/361.png',NULL),(162,362,'Andrey','Sotnikov','Андрей','Сотников','1985-06-14','andrey.zzz','+375 33 663 10 86',603,'andrey.sotnikov@itechart-group.com',8,'employer/362.png',NULL),(163,363,'Taras','Gordienko','Тарас','Гордиенко','1992-02-05','gordienko_taras','+375 29 687 09 90',503,'taras.gordienko@itechart-group.com',3,'employer/363.png',NULL),(164,364,'Sergey','Golovenchik','Сергей','Головенчик','1992-01-04','sergey.golovenchik','+375 29 552 10 96',528,'sergey.golovenchik@itechart-group.com',16,'employer/364.png',NULL),(165,365,'Alexander','Burak','Александр','Бурак','1992-07-09','alexanderburak','+375 44 724 10 21',528,'alexander.burak@itechart-group.com',16,'employer/365.png',NULL),(166,366,'Alexey','Zenovich','Алексей','Зенович','1992-02-15','aleksei.zenovich','+375 29 5007054',519,'alexey.zenovich@itechart-group.com',2,'employer/366.png',NULL),(167,367,'Alexander','Tolkachev','Александр','Толкачёв','1992-08-09','','+375 29 203 75 22',502,'alexander.tolkachev@itechart-group.com',10,'employer/367.png',NULL),(168,368,'Dmitry','Zaprutsky','Дмитрий','Запруцкий','1991-02-13','dmitry.zaprutsky','+375 25 979 22 83, +375 59 565 38 47',515,'dmitry.zaprutsky@itechart-group.com',10,'employer/368.png',NULL),(169,369,'Igor','Shalimov','Игорь','Шалимов','1991-04-24','shalimov2974','+375 29 676 29 74',500,'igor.shalimov@itechart-group.com',11,'employer/369.png',NULL),(170,370,'Artem','Stepaniuk','Артем','Степанюк','1991-08-09','faulknercs','+375 29 332 93 10',607,'Artem.Stepaniuk@itechart-group.com',10,'employer/370.png',NULL),(171,371,'Ksenia','Kapnik','Ксения','Капник','1992-10-03','','+375 44 745 47 44',526,'Ksenia.Kapnik@itechart-group.com',11,'employer/371.png',NULL),(172,372,'Alexander','Shebushev','Александр','Шебушев','1991-09-21','shebushev.a','+375 29 367 82 40',505,'Alexander.Shebushev@itechart-group.com',3,'employer/372.png',NULL),(173,374,'Arseny','Pogorelov','Арсений','Погорелов','1992-02-18','arseni.paharelau','+375 29 385 96 63',502,'Arseny.Pogorelov@itechart-group.com',3,'employer/374.png',NULL),(174,375,'Alexey','Tayanovsky','Алексей','Таяновский','1992-07-30','aliaksei.tayanouski','+375 25 962 90 13',519,'alexey.tayanovsky@itechart-group.com',21,'employer/375.png',NULL),(175,376,'Pavel','Kartel','Павел','Картель','1992-01-15','pkartsel','+ 375 29 323 89 39',608,'pavel.kartel@itechart-group.com',16,'employer/376.png',NULL),(176,377,'Natalya','Chukhno','Наталья','Чухно','1992-10-06','yanatali_al','+375 29 266 99 10',503,'natalya.chukhno@itechart-group.com',16,'employer/377.png',NULL),(177,378,'Mikhail','Ignashevich','Михаил','Игнашевич','1989-11-21','mikhail.ihnashevich','+ 375 29 243 71 64',515,'mikhail.ignashevich@itechart-group.com',11,'employer/378.png',NULL),(178,379,'Evgeny','Kapitonov','Евгений','Капитонов','1990-09-05','evgeny.kapitonov','+ 375 29 387 88 02',687,'evgeny.kapitonov@itechart-group.com',8,'employer/379.png',NULL),(179,380,'Ekaterina','Lepunova','Екатерина','Лепунова','1992-04-25','ekaterina.lepunova','+375 29 511 63 17',528,'ekaterina.lepunova@itechart-group.com',10,'employer/380.png',NULL),(180,381,'Sergey','Samkov','Сергей','Самков','1977-04-19','sergei.samkov','+375296278407',527,'Sergey.Samkov@itechart-group.com',21,'employer/381.png',NULL),(181,382,'Igor','Kharitoniuk','Игорь','Харитонюк','1991-12-04','igor_splash','+375 29 221 23 75',603,'igor.kharitoniuk@itechart-group.com',8,'employer/382.png',NULL),(182,385,'Nikita','Lychkovsky','Никита','Лычковский','1992-04-23','miisterbear','+375 29 320 21 41',503,'nikita.lychkovsky@itechart-group.com',3,'employer/385.png',NULL),(183,387,'Alexey','Demyanovich','Алексей','Демьянович','1990-07-22','aleksei.demyanovich','+375 33 33 55 993',608,'alexey.demyanovich@itechart-group.com',10,'employer/387.png',NULL),(184,392,'Sabina','Musaeva','Сабина','Мусаева','1990-10-01','musaeva.sabina','+375 29 251 49 41',524,'sabina.musaeva@itechart-group.com',17,'employer/392.png',NULL),(185,393,'Dmitry','Zuev','Дмитрий','Зуев','1980-01-25','dmitri_zuev','+375 29 16 888 75',320,'dmitry.zuev@itechart-group.com',1,'employer/393.png',NULL),(186,394,'Inessa','Osipyan','Инесса','Осипян','1988-03-10','vessnaos','+375 29 787 69 82',524,'inessa.osipyan@itechart-group.com',17,'employer/394.png',NULL),(187,395,'Maria','Kuznetsova','Мария','Кузнецова','1991-04-21','mary_kuznetsova','+375 44 711 21 22',519,'maria.kuznetsova@itechart-group.com',2,'employer/395.png',NULL),(188,396,'Artem','Zhurbilo','Артем','Журбило','1991-04-26','artsiom.zhurbilo','+375 29 605 06 32',523,'Artem.Zhurbilo@itechart-group.com',17,'employer/396.png',NULL),(189,397,'Igor','Kaleda','Игорь','Каледа','1987-09-28','igor.kaleda','+ 375 29 120 29 65',616,'igor.kaleda@itechart-group.com',17,'employer/397.png',NULL),(190,398,'Dmitry','Vlasov','Дмитрий','Власов','1991-08-04','brver1991','+375 44 763 35 56',504,'Dmitry.Vlasov@itechart-group.com',2,'employer/398.png',NULL),(191,399,'Ernest','Rakhmatulin','Эрнест','Рахматулин','1991-10-15','ernest.rahmatulin','+375297752527',504,'ernest.rakhmatulin@itechart-group.com',2,'employer/399.png',NULL),(192,400,'Zakhar','Konofalsky','Захар','Конофальский','1991-09-29','','',504,'Zakhar.Konofalsky@itechart-group.com',2,'employer/400.png',NULL),(193,401,'Alexandra','Aliseychik','Александра','Алисейчик','1990-08-15','avarta8','+375336640825',609,'alexandra.aliseychik@itechart-group.com',19,'employer/401.png',NULL),(194,402,'Oksana','Boreyko','Оксана','Борейко','1985-11-07','oksana.boreyko','+375297098597',687,'oksana.boreyko@itechart-group.com',17,'employer/402.png',NULL),(195,403,'Ekaterina','Melnikova','Екатерина','Мельникова','1985-04-27','katya.makarenya','+375293434554',612,'Ekaterina.Melnikova@itechart-group.com',14,'employer/403.png',NULL),(196,404,'Lilia','Tuchkovskaya','Лилия','Тучковская','1991-06-04','liliatuchick','+375298832834',520,'lilia.tuchkovskaya@itechart-group.com',4,'employer/404.png',NULL),(197,405,'Olga','Zarovskaya','Ольга','Заровская','1970-01-01','','',612,'olga.Zarovskaya@itechart-group.com',5,'employer/405.png',NULL),(198,406,'Sergey','Dokutovich','Сергей','Докутович','1974-01-07','razor11174','+375 29 665 44 90',515,'sergey.dokutovich@itechart-group.com',8,'employer/406.png',NULL),(199,407,'Vyacheslav','Poddubsky','Вячеслав','Поддубский','1989-06-12','vicheslavp','+375 33 633 88 47',504,'vyacheslav.poddubsky@itechart-group.com',2,'employer/407.png',NULL),(200,408,'Mikhail','Krupsky','Михаил','Крупский','1991-02-15','mikhail.krupskiy','+375 29 338 48 47',500,'mikhail.krupsky@itechart-group.com',11,'employer/408.png',NULL),(201,409,'Ivan','Solonenko','Иван','Солоненко','1991-12-27','cruazer','+375 29 302 13 23',608,'ivan.solonenko@itechart-group.com',16,'employer/409.png',NULL),(202,410,'Anna','Malatschenok','Анна','Малащенок','1991-03-29','anna.malatschenok','+375 29 880 00 76',612,'Anna.Malatschenok@itechart-group.com',5,'employer/410.png',NULL),(203,411,'Viktor','Pylinsky','Виктор','Пылинский','1991-07-23','victorpylinskiy','+375 29 527 25 98',610,'viktor.pylinsky@itechart-group.com',1,'employer/411.png',NULL),(204,412,'Vitaly','Pylinsky','Виталий','Пылинский','1991-07-23','vitalypylinsky','+375 25 738 45 56',320,'vitaly.pylinsky@itechart-group.com',1,'employer/412.png',NULL),(205,416,'Tatyana','Shvets','Татьяна','Швец','1991-10-17','tanya.kimi.shvets','+375 44 729 09 21',526,'tatyana.shvets@itechart-group.com',16,'employer/416.png',NULL),(206,417,'Igor','Kanunnikov','Игорь','Канунников','1991-11-11','igorkan45','+375 29 8728371',609,'igor.kanunnikov@itechart-group.com',4,'employer/417.png',NULL),(207,419,'Olesya','Gramovich','Олеся','Грамович','1981-10-30','alex301081','+375297312840',520,'olesya.gramovich@itechart-group.com',4,'employer/419.png',NULL),(208,423,'Pavel','Sosunkevich','Павел','Сосункевич','1981-12-28','pavsasunkevich','+375 29 556 99 25',527,'pavel.sosunkevich@itechart-group.com',21,'employer/423.png',NULL),(209,427,'Anton','Chugunov','Антон','Чугунов','1984-05-04','anton.chugunov1','+375 29 388 80 67',687,'anton.chugunov@itechart-group.com',8,'employer/427.png',NULL),(210,428,'Sergey','Bedulin','Сергей','Бедулин','1987-06-14','serge.bedulin','+375 44 768 10 29',522,'sergey.bedulin@itechart-group.com',10,'employer/428.png',NULL),(211,429,'Sergey','Trukhachev','Сергей','Трухачев','1983-10-09','s.trukhachev','+375 29 685 28 32',603,'sergey.trukhachev@itechart-group.com',8,'employer/429.png',NULL),(212,430,'Valery','Margunov','Валерий','Маргунов','1991-04-20','valerymargunov','+375 29 822 75 96',607,'valery.margunov@itechart-group.com',16,'employer/430.png',NULL),(213,432,'Alina','Grigorenko','Алина','Григоренко','1990-02-28','ali-g28','+375 29 364 85 60',609,'alina.grigorenko@itechart-group.com',19,'employer/432.png',NULL),(214,433,'Alexey','Ovechkin','Алексей','Овечкин','1989-05-01','aavechkin','+375 29 168 07 64',526,'alexey.ovechkin@itechart-group.com',16,'employer/433.png',NULL),(215,434,'Artem','Gerasimchuk','Артем','Герасимчук','1991-09-27','herasimchuk1991','+375 (44) 728-14-39',607,'artem.gerasimchuk@itechart-group.com',8,'employer/434.png',NULL),(216,437,'Vasil','Posudevsky','Василий','Посудевский','1992-01-21','vasiliy.posudevskiy','+375 44 599 83 15',611,'vasil.posudevsky@itechart-group.com',1,'employer/437.png',NULL),(217,438,'Ilya','Starostin','Илья','Старостин','1992-10-06','frozen_this_my_log','+375 29 263 84 17',528,'ilya.starostin@itechart-group.com',16,'employer/438.png',NULL),(218,439,'Anton','Narkevich','Антон','Наркевич','1992-07-29','neurosis_2','+375259992400',502,'anton.narkevich@itechart-group.com',16,'employer/439.png',NULL),(219,440,'Valery','Dolyuk','Валерий','Долюк','1993-05-14','valery.dolyuk','+375296695344',500,'valery.dolyuk@itechart-group.com',11,'employer/440.png',NULL),(220,441,'Kirill','Utenkov','Кирилл','Утенков','1992-06-11','partifer','+375291469576',523,'kirill.utenkov@itechart-group.com',2,'employer/441.png',NULL),(221,442,'Pavel','Shlykov','Павел','Шлыков','1986-02-19','james_hatfield86','+375292605997',526,'pavel.shlykov@itechart-group.com',16,'employer/442.png',NULL),(222,443,'Dmitry','Zezyulkin','Дмитрий','Зезюлькин','1993-08-25','dima_zez','+375295650201',502,'Dmitry.Zezyulkin@itechart-group.com',11,'employer/443.png',NULL),(223,444,'Olga','Glukhovskaya','Ольга','Глуховская','1987-05-19','dobra9_misl9','+375293551801',616,'olga.glukhovskaya@itechart-group.com',17,'employer/444.png',NULL),(224,446,'Stanislav','Tarazevich','Станислав','Таразевич','1993-06-28','intelligencegivespower','+375259006873',523,'stanislav.tarazevich@itechart-group.com',3,'employer/446.png',NULL),(225,448,'Tatyana','Kushner','Татьяна','Кушнер','1989-11-17','tatianka_yurievna','+375296823349',612,'tatyana.kushner@itechart-group.com',14,'employer/448.png',NULL),(226,453,'Nikita','Klushnikov','Никита','Клюшников','1993-01-21','nikita.klushnikov','+375293545626',522,'nikita.klushnikov@itechart-group.com',10,'employer/453.png',NULL),(227,454,'Nikolay','Bolotin','Николай','Болотин','1992-03-17','b_nicolai','+375 44 7730942',607,'nikolay.bolotin@itechart-group.com',3,'employer/454.png',NULL),(228,456,'Tatyana','Zhvalik','Татьяна','Жвалик','1986-02-22','tatsiana_zhvalik','+375297508574',504,'tatyana.zhvalik@itechart-group.com',17,'employer/456.png',NULL),(229,457,'Tatyana','Kugaeva','Татьяна','Кугаева','1984-01-10','tanya_74562','+375295024779',622,'tatyana.kugaeva@itechart-group.com',20,'employer/457.png',NULL),(230,458,'Aleksey','Kuchik','Алексей','Кучик','1992-10-13','lightdefender13','+375297043353',500,'aleksey.kuchik@itechart-group.com',11,'employer/458.png',NULL),(231,459,'Alexander','Belyaev','Александр','Беляев','1993-08-09','a.beliayeu','+375298521619',610,'alexander.belyaev@itechart-group.com',1,'employer/459.png',NULL),(232,460,'Andrey','Gusakov','Андрей','Гусаков','1991-01-19','andrey_husakov','+375333259320',500,'andrey.gusakov@itechart-group.com',11,'employer/460.png',NULL),(233,464,'Marina','Lozuk','Марина','Лозюк','1993-01-25','marusja_93','+375 29 807 40 17',611,'',21,'employer/464.png',NULL),(234,465,'Dmitry','Mavchun','Дмитрий','Мавчун','1991-07-22','svamt44','+375292731748',611,'dmitry.mavchun@itechart-group.com',21,'employer/465.png',NULL),(235,466,'Elena','Levina','Елена','Левина','1992-04-30','aliona.levina','+375 29 342 04 92',528,'elena.levina@itechart-group.com',16,'employer/466.png',NULL),(236,467,'Maksim','Kulik','Максим','Кулик','1985-12-06','kulmaks','+375293804595',518,'Maksim.Kulik@itechart-group.com',9,'employer/467.png',NULL),(237,468,'Andrey','Prudnikov','Андрей','Прудников','1984-11-28','prudnikov.andrey','+375293460434',1,'andrey.prudnikov@itechart-group.com',10,'employer/468.png',NULL),(238,469,'Vyacheslav','Bakhtin','Вячеслав','Бахтин','1992-12-03','slava_bakhtin','+375298728296',687,'vyacheslav.bakhtin@itechart-group.com',8,'employer/469.png',NULL),(239,470,'Alexey','Barashkov','Алексей','Барашков','1992-12-25','barashkov.a.d','+375295611217',500,'alexey.barashkov@itechart-group.com',11,'employer/470.png',NULL),(240,473,'Igor','Tatarnikov','Игорь','Татарников','1989-04-15','ihar_tatarnikau','+375 29 2230595',521,'igor.tatarnikov@itechart-group.com',16,'employer/473.png',NULL),(241,474,'Dmitry','Shamak','Дмитрий','Шамак','1990-05-15','dmitryshamak','+375336492779',502,'dmitry.shamak@itechart-group.com',16,'employer/474.png',NULL),(242,475,'Alesya','Ermakovich','Алеся','Ермакович','1992-09-10','alesya7059','',609,'alesya.ermakovich@itechart-group.com',5,'employer/475.png',NULL),(243,476,'Sergey','Pristavko','Сергей','Приставко','1987-01-01','siarhei_prystauka','+375 29 254 16 56',502,'sergey.pristavko@itechart-group.com',16,'employer/476.png',NULL),(244,477,'Denis','Podgorny','Денис','Подгорный','1991-05-08','denispodgorny','+375 29 165 60 05',687,'denis.podgorny@itechart-group.com',4,'employer/477.png',NULL),(245,479,'Alexey','Dudarev','Алексей','Дударев','1983-10-07','dudarev_av','+375298970249',522,'alexey.dudarev@itechart-group.com',10,'employer/479.png',NULL),(246,480,'Emiliya','Davydova','Эмилия','Давыдова','1991-05-12','emiliya_davidova','+375296173688',687,'emiliya.davydova@itechart-group.com',4,'employer/480.png',NULL),(247,481,'Alexey','Kalachik','Алексей','Калачик','1992-06-02','vakintoshka','+375 29 816 39 77',527,'alexey.kalachik@itechart-group.com',21,'employer/481.png',NULL),(248,482,'Sergei','Sergeev','Сергей','Сергеев','1987-08-09','sergei-s-a','+375 29 762 63 58',500,'sergei.sergeev@itechart-group.com',11,'employer/482.png',NULL),(249,483,'Dzmitry','Kremez','Дмитрий','Кремез','1990-09-12','kremez190','+375295103865',519,'dzmitry.kremez@itechart-group.com',2,'employer/483.png',NULL),(250,484,'Ilya','Novikov','Илья','Новиков','1988-05-07','ilya.novikov44','+375336675534',527,'ilya.novikov@itechart-group.com',21,'employer/484.png',NULL),(251,485,'Dzmitry','Ihnatovich','Дмитрий','Игнатович','1988-04-27','sanderson_dm','+375298764767',616,'dzmitry.ihnatovich@itechart-group.com',17,'employer/485.png',NULL),(252,486,'Mikita','Almakou','Никита','Алмаков','1993-08-18','westandskif','+375447214317',504,'mikita.almakou@itechart-group.com',2,'employer/486.png',NULL),(253,487,'Tatsiana','Bayarevich','Татьяна','Бояревич','1987-08-27','tanya_botya','+375 29 582 63 50',524,'tatsiana.bayarevich@itechart-group.com',17,'employer/487.png',NULL),(254,488,'Anatoli','Ihnatau','Анатолий','Игнатов','1981-12-31','anatoli.ignatov.','+375447623432',503,'anatoli.ihnatau@itechart-group.com',4,'employer/488.png',NULL),(255,489,'Aliaksei','Damaronak','Алексей','Доморенок','1991-11-19','plesenb_bl','+375291710473',610,'Aliaksei.Damaronak@itechart-group.com',1,'employer/489.png',NULL),(256,491,'Ilya','Yalchyk','Илья','Яльчик','1993-03-13','yalchik_ilya','+375 29 2119680',320,'Ilya.Yalchyk@itechart-group.com',1,'employer/491.png',NULL),(257,492,'Veranika','Belakhonava','Вероника','Белахонова','1993-09-10','nikulya09','+375 44 777 46 50',320,'Veranika.Belakhonava@itechart-group.com',1,'employer/492.png',NULL),(258,493,'Valery','Kuzmenka','Валерий','Кузьменко','1985-02-04','valera_kyz','+375 29 779 27 54',503,'Valery.Kuzmenka@itechart-group.com',21,'employer/493.png',NULL),(259,494,'Lalita','Kurshakova','Лолита','Куршакова','1992-05-28','lol_nya','+375 29 389 28 10',320,'Lalita.Kurshakova@itechart-group.com',1,'employer/494.png',NULL),(260,495,'Dzianis','Sipakou','Денис','Сипаков','1983-08-29','denis.sipakov','+375297520189',609,'dzianis.sipakou@itechart-group.com',4,'employer/495.png',NULL),(261,496,'Sviatlana','Vishniova','Светлана','Вишнёва','1978-04-14','s_v_e_t_a_007','+375336382103',524,'sviatlana.vishniova@itechart-group.com',17,'employer/496.png',NULL),(262,497,'Anton','Zasenka','Антон','Засенко','1993-04-21','crabman.','+375292023001',607,'anton.zasenka@itechart-group.com',10,'employer/497.png',NULL),(263,498,'Aliaksei','Lasyi','Алексей','Ласый','1993-03-02','alex.lasyi','+375 29 270 39 84',522,'aliaksei.lasyi@itechart-group.com',10,'employer/498.png',NULL),(264,499,'Mikita','Luksha','Никита','Лукша','1989-10-07','lu.nikita','+375297582083',609,'mikita.luksha@itechart-group.com',8,'employer/499.png',NULL),(265,501,'Aliaksandr','Valkouski','Александр','Волковский','1993-09-15','volkovsky_alex','+375336560845',505,'aliaksandr.valkouski@itechart-group.com',3,'employer/501.png',NULL),(266,502,'Hanna','Shviatsova','Анна','Швецова','1991-10-04','judokiu','+375291224768',609,'hanna.shviatsova@itechart-group.com',8,'employer/502.png',NULL),(267,504,'Sviatlana','Sachkouskaya','Светлана','Сачковская','1993-01-18','svetlana.sachkovskaya.','+375292068041',607,'sviatlana.sachkouskaya@itechart-group.com',10,'employer/504.png',NULL),(268,505,'Dzmitry','Fralou','Дмитрий','Фролов','1990-08-04','dnfrolov','+375445936131',500,'dzmitry.fralou@itechart-group.com',11,'employer/505.png',NULL),(269,506,'Alexandr','Yakovlev','Александр','Яковлев','1987-07-18','alexandr-rock','+375 29 812 51 95',1,'alexandr.yakovlev@itechart-group.com',11,'employer/506.png',NULL),(270,507,'Daria','Zabrodets','Дарья','Забродец','1993-04-30','Daria.Zabrodets','+375293555266',528,'daria.zabrodets@itechart-group.com',16,'employer/507.png',NULL),(271,508,'Artsiom','Kuts','Артём','Куц','1991-10-15','grandmother_spider','+375295080988',504,'artsiom.kuts@itechart-group.com',16,'employer/508.png',NULL),(272,509,'Kiryl','Andruski','Кирилл','Андрусский','1993-06-10','kiryl.andruski','+375298544477',515,'kiryl.andruski@itechart-group.com',11,'employer/509.png',NULL),(273,510,'Ilya','Zaprutski','Илья','Запруцкий','1993-08-02','ilya_zaprutski','+375298597096',515,'ilya.zaprutski@itechart-group.com',11,'employer/510.png',NULL),(274,512,'Anton','Matseichyk','Антон','Матейчик','1992-12-30','mateichik.a.v','+375298747336',521,'anton.matseichyk@itechart-group.com',11,'employer/512.png',NULL),(275,513,'Aleh','Hilenchanka','Олег','Гиленченко','1989-12-03','oleg.gilenchenko.csi','+375 29 209 99 91',528,'aleh.hilenchanka@itechart-group.com',16,'employer/513.png',NULL),(276,514,'Alena','Labada','Елена','Лабода','1990-12-12','mi1edi','+375 29 360 87 99',611,'alena.labada@itechart-group.com',21,'employer/514.png',NULL),(277,515,'Viachaslau','Marozau','Вячеслав','Морозов','1993-07-07','vyacheslav.a.m','+375 25 947 19 90',524,'viachaslau.marozau@itechart-group.com',17,'employer/515.png',NULL),(278,516,'Pavel','Shpak','Павел','Шпак','1986-10-31','mort_al','+375 44 579 39 91',523,'pavel.shpak@itechart-group.com',21,'employer/516.png',NULL),(279,517,'Anton','Haranski','Антон','Гаранский','1992-01-27','helloworld19920127','+375298951858',320,'anton.haranski@itechart-group.com',1,'employer/517.png',NULL),(280,519,'Viktoryia','Nedabeha','Виктория','Недобега','1988-01-19','viktoryia_nedabeha','+375447141275',616,'viktoryia.nedabeha@itechart-group.com',17,'employer/519.png',NULL),(281,521,'Kiryl','Kalasouski','Кирилл','Колосовский','1991-04-02','kirylk','+375447697747',607,'kiryl.kalasouski@itechart-group.com',16,'employer/521.png',NULL),(282,522,'Mikhail','Nikitsin','Михаил','Никитин','1993-03-20','nonkrip','+375292133650',687,'mikhail.nikitsin@itechart-group.com',3,'employer/522.png',NULL),(283,524,'Artsiom','Muzychenka','Артем','Музыченко','1990-09-07','artem.muzychenko','+375298589979',605,'artsiom.muzychenka@itechart-group.com',16,'employer/524.png',NULL),(284,525,'Andrei','Sumar','Андрей','Сумар','1992-08-16','andrei.sumar','+375447195973',522,'andrei.sumar@itechart-group.com',10,'employer/525.png',NULL),(285,526,'Aliaksey','Rudziak','Алексей','Рудяк','1985-06-21','lexa_1985_06','+375 29 755 31 18',515,'aliaksey.rudziak@itechart-group.com',8,'employer/526.png',NULL),(286,528,'Aliaksei','Mordas','Алексей','Мордас','1990-09-03','alexey.mordas','+375293300655',520,'aliaksei.mordas@itechart-group.com',4,'employer/528.png',NULL),(287,529,'Artur','Fenko','Артур','Фенько','1986-10-02','art.fenko','+375297529352',320,'artur.fenko@itechart-group.com',1,'employer/529.png',NULL),(288,530,'Kanstantsin','Smaliakou','Константин','Смоляков','1993-09-05','smolyakoff.ko','+375 29 359 32 95',528,'k.smaliakou@itechart-group.com',10,'employer/530.png',NULL),(289,531,'Hanna','Shutava','Анна','Шутова','1981-02-22','shutova.a','+375297656826',612,'Hanna.Shutava@itechart-group.com',14,'employer/531.png',NULL),(290,532,'Tatsiana','Kaushar','Татьяна','Ковшар','1993-02-11','tatianakovshar','+375295533274',520,'tatsiana.kaushar@itechart-group.com',17,'employer/532.png',NULL),(291,533,'Volha','Suvalava','Ольга','Сувалова','1991-10-22','olya.suvalova','+375257419409',502,'Volha.Suvalava@itechart-group.com',4,'employer/533.png',NULL),(292,534,'Maksim','Kudash','Максим','Кудош','1994-01-28','makskudosh','+375296127690',607,'Maksim.Kudash@itechart-group.com',10,'employer/534.png',NULL),(293,535,'Henadzi','Baranau','Геннадий','Баранов','1991-04-10','henadzi_baranau','+375 29 352 97 62',522,'Henadzi.Baranau@itechart-group.com',10,'employer/535.png',NULL),(294,536,'Yana','Berkina','Яна','Беркина','1990-05-09','berkina-yana','',612,'Yana.Berkina@itechart-group.com',14,'employer/536.png',NULL),(295,537,'Dzianis','Zabalatniuk','Денис','Заболотнюк','1989-02-24','denis_zabolotniuk','+375 29 515 63 81',605,'Dzianis.Zabalatniuk@itechart-group.com',18,'employer/537.png',NULL),(296,538,'Natalia','Govor','Наталья','Говор','1993-02-04','natasha.govor','+375293311670',687,'natalia.govor@itechart-group.com',10,'employer/538.png',NULL),(297,539,'Maryna','Tsarun','Марина','Царун','1992-11-02','maryna.tsarun','+375297377180',520,'maryna.tsarun@itechart-group.com',4,'employer/539.png',NULL),(298,540,'Yauheniya','Makarchyk','Евгения','Макарчик','1989-09-08','evgenija.makarchik','+375447615041',517,'yauheniya.makarchyk@itechart-group.com',6,'employer/540.png',NULL),(299,541,'Svetlana','Dedunovich','Светлана','Дедунович','1993-03-06','dedunovich.sveta','+375297081374',505,'svetlana.dedunovich@itechart-group.com',3,'employer/541.png',NULL);
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
  PRIMARY KEY (`id`),
  KEY `twid_history_0f030170` (`employer_id`),
  KEY `twid_history_b6860804` (`device_id`),
  CONSTRAINT `device_id_refs_id_d9d79e46` FOREIGN KEY (`device_id`) REFERENCES `twid_device` (`id`),
  CONSTRAINT `employer_id_refs_id_266a3be2` FOREIGN KEY (`employer_id`) REFERENCES `twid_employer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twid_history`
--

LOCK TABLES `twid_history` WRITE;
/*!40000 ALTER TABLE `twid_history` DISABLE KEYS */;
INSERT INTO `twid_history` VALUES (1,1,24,'2014-06-14 15:08:15'),(2,1,23,'2014-06-14 15:45:44'),(3,2,23,'2014-06-14 18:38:44'),(4,1,19,'2014-06-14 18:59:09'),(5,2,19,'2014-06-14 19:32:50'),(6,1,10,'2014-06-14 19:33:54'),(7,2,6,'2014-06-14 19:34:01'),(8,1,5,'2014-06-14 19:38:21'),(9,1,1,'2014-06-14 19:38:26'),(10,4,14,'2014-06-14 19:42:33'),(11,4,17,'2014-06-14 19:42:44'),(12,44,9,'2014-06-14 20:32:52'),(13,3,6,'2014-06-14 20:36:35'),(14,5,20,'2014-06-14 20:36:41'),(15,6,17,'2014-06-14 20:43:57'),(16,54,17,'2014-06-14 20:44:13'),(17,11,14,'2014-06-14 20:46:34');
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

-- Dump completed on 2014-06-15  0:01:08
