CREATE DATABASE  IF NOT EXISTS `redbeltpoke` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `redbeltpoke`;
-- MySQL dump 10.13  Distrib 5.6.24, for osx10.8 (x86_64)
--
-- Host: 127.0.0.1    Database: redbeltpoke
-- ------------------------------------------------------
-- Server version	5.5.42

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
-- Table structure for table `pokes`
--

DROP TABLE IF EXISTS `pokes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_poking` int(11) NOT NULL,
  `user_poked` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pokes_users_idx` (`user_poking`),
  KEY `fk_poked_users_idx` (`user_poked`),
  CONSTRAINT `fk_poked_users` FOREIGN KEY (`user_poked`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pokes_users` FOREIGN KEY (`user_poking`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokes`
--

LOCK TABLES `pokes` WRITE;
/*!40000 ALTER TABLE `pokes` DISABLE KEYS */;
INSERT INTO `pokes` VALUES (19,9,5,'2015-11-20 14:31:19','2015-11-20 14:31:19'),(20,9,6,'2015-11-20 14:31:20','2015-11-20 14:31:20'),(21,9,6,'2015-11-20 14:31:21','2015-11-20 14:31:21'),(22,9,6,'2015-11-20 14:31:21','2015-11-20 14:31:21'),(23,9,10,'2015-11-20 14:38:29','2015-11-20 14:38:29'),(24,9,10,'2015-11-20 14:38:29','2015-11-20 14:38:29'),(25,9,10,'2015-11-20 14:38:29','2015-11-20 14:38:29'),(26,9,10,'2015-11-20 14:38:30','2015-11-20 14:38:30'),(27,10,9,'2015-11-20 15:03:16','2015-11-20 15:03:16'),(28,10,9,'2015-11-20 15:03:16','2015-11-20 15:03:16'),(29,10,9,'2015-11-20 15:03:17','2015-11-20 15:03:17'),(30,10,9,'2015-11-20 15:03:17','2015-11-20 15:03:17'),(31,10,9,'2015-11-20 15:03:17','2015-11-20 15:03:17'),(32,8,9,'2015-11-20 15:04:09','2015-11-20 15:04:09'),(33,8,10,'2015-11-20 15:04:10','2015-11-20 15:04:10'),(34,8,4,'2015-11-20 15:04:13','2015-11-20 15:04:13'),(35,10,3,'2015-11-20 15:50:24','2015-11-20 15:50:24'),(36,10,2,'2015-11-20 15:50:26','2015-11-20 15:50:26'),(37,10,8,'2015-11-20 15:50:27','2015-11-20 15:50:27'),(38,10,7,'2015-11-20 15:50:28','2015-11-20 15:50:28'),(39,10,2,'2015-11-20 16:00:02','2015-11-20 16:00:02'),(40,10,3,'2015-11-20 16:00:03','2015-11-20 16:00:03'),(41,10,4,'2015-11-20 16:00:04','2015-11-20 16:00:04'),(42,10,5,'2015-11-20 16:00:05','2015-11-20 16:00:05'),(43,10,6,'2015-11-20 16:00:07','2015-11-20 16:00:07'),(44,10,7,'2015-11-20 16:00:08','2015-11-20 16:00:08'),(45,10,8,'2015-11-20 16:00:09','2015-11-20 16:00:09'),(46,10,9,'2015-11-20 16:00:10','2015-11-20 16:00:10'),(47,2,10,'2015-11-20 16:00:22','2015-11-20 16:00:22'),(48,2,9,'2015-11-20 16:00:23','2015-11-20 16:00:23'),(49,2,8,'2015-11-20 16:00:24','2015-11-20 16:00:24'),(50,2,7,'2015-11-20 16:00:24','2015-11-20 16:00:24'),(51,2,6,'2015-11-20 16:00:25','2015-11-20 16:00:25'),(52,2,5,'2015-11-20 16:00:27','2015-11-20 16:00:27'),(53,2,4,'2015-11-20 16:00:27','2015-11-20 16:00:27'),(54,2,3,'2015-11-20 16:00:28','2015-11-20 16:00:28'),(55,10,9,'2015-11-20 16:00:58','2015-11-20 16:00:58'),(56,10,8,'2015-11-20 16:00:58','2015-11-20 16:00:58'),(57,10,7,'2015-11-20 16:00:59','2015-11-20 16:00:59'),(58,10,6,'2015-11-20 16:01:00','2015-11-20 16:01:00'),(59,10,5,'2015-11-20 16:01:00','2015-11-20 16:01:00'),(60,10,4,'2015-11-20 16:01:01','2015-11-20 16:01:01'),(61,10,3,'2015-11-20 16:01:02','2015-11-20 16:01:02'),(62,10,2,'2015-11-20 16:01:03','2015-11-20 16:01:03'),(63,3,2,'2015-11-20 16:01:21','2015-11-20 16:01:21'),(64,3,4,'2015-11-20 16:01:22','2015-11-20 16:01:22'),(65,3,5,'2015-11-20 16:01:22','2015-11-20 16:01:22'),(66,3,6,'2015-11-20 16:01:23','2015-11-20 16:01:23'),(67,3,7,'2015-11-20 16:01:25','2015-11-20 16:01:25'),(68,3,8,'2015-11-20 16:01:25','2015-11-20 16:01:25'),(69,3,9,'2015-11-20 16:01:26','2015-11-20 16:01:26'),(70,3,10,'2015-11-20 16:01:27','2015-11-20 16:01:27'),(71,10,11,'2015-11-20 16:05:23','2015-11-20 16:05:23');
/*!40000 ALTER TABLE `pokes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `poke_count` int(11) DEFAULT NULL,
  `date_of_birth` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'name1','alias1','email@domain.com','asdfgh12',4,'2015-11-02','2015-11-20 13:33:31','2015-11-20 13:33:31'),(3,'name2','alias2','name2@d.com','asdfgh12',4,'2015-11-02','2015-11-20 13:41:39','2015-11-20 13:41:39'),(4,'name3','alias3','name3@d.com','asdfgh12',5,'2015-11-02','2015-11-20 13:42:07','2015-11-20 13:42:07'),(5,'joe','schmo','jo@schmo.com','asdfgh12',7,'2015-11-02','2015-11-20 13:42:25','2015-11-20 13:42:25'),(6,'Dr. Jones','Indiana','no@snakes.com','asdfgh12',7,'2015-11-01','2015-11-20 13:43:00','2015-11-20 13:43:00'),(7,'Peter Parker','Spiderman','pp@globe.com','asdfgh12',5,'2015-11-02','2015-11-20 13:43:41','2015-11-20 13:43:41'),(8,'Bruce Wayne','Dark Knight','b@wayneent.com','asdfgh12',5,'2015-11-01','2015-11-20 13:44:20','2015-11-20 13:44:20'),(9,'Tony Stark','Ironman','t@starkent.com','asdfgh12',10,'2015-11-17','2015-11-20 13:44:55','2015-11-20 13:44:55'),(10,'Bruce Banner','Greenie','me@calm.com','asdfgh12',7,'2015-02-03','2015-11-20 13:45:30','2015-11-20 13:45:30'),(11,'stephen','colbert','s@colbert.com','asdfgh12',1,'2015-11-03','2015-11-20 16:04:15','2015-11-20 16:04:15');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'redbeltpoke'
--

--
-- Dumping routines for database 'redbeltpoke'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-20 16:11:06
