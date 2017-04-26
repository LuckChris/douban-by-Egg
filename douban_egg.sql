-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: douban_egg
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movieId` int(11) NOT NULL,
  `fromId` int(11) NOT NULL,
  `content` text NOT NULL,
  `create_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (8,26260853,1,'23333333333','2017-04-22 23:23:05'),(9,26260853,1,'good','2017-04-22 23:27:18'),(11,1292213,1,'ok','2017-04-22 23:33:38'),(12,1292213,1,'mkmdklqwd\r\nqwdmjqkdkqw\r\nmklqwd\r\nqwdmklqwd','2017-04-22 23:33:56'),(13,1292213,1,'jkkoko','2017-04-22 23:35:42'),(14,1292213,1,'12123','2017-04-23 11:12:12'),(15,1292213,1,'great','2017-04-23 11:37:41'),(16,1292213,1,'23333333','2017-04-23 12:42:35'),(17,1292213,1,'23333333333','2017-04-23 12:43:20'),(19,1292213,1,'4555555555','2017-04-23 13:43:44'),(20,1292213,1,'788888888','2017-04-23 13:45:55'),(21,1292213,1,'4555','2017-04-23 13:59:36'),(22,1292213,1,'非常好','2017-04-23 14:03:23'),(23,26816383,1,'henhao','2017-04-26 17:24:35'),(24,26816383,1,'haohao','2017-04-26 17:33:32'),(25,26816383,3,'yoyo','2017-04-26 17:35:16'),(26,1292213,3,'不错  好看','2017-04-26 17:36:12'),(27,1292213,1,'好看','2017-04-26 17:38:57'),(28,1292213,1,'good','2017-04-26 17:43:21'),(29,1292213,2,'good\r\n不错！','2017-04-26 18:46:05'),(30,1292213,1,'是的呢','2017-04-26 19:11:29');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commentId` int(11) NOT NULL,
  `fromId` int(11) NOT NULL,
  `toId` int(11) NOT NULL,
  `reply_content` text NOT NULL,
  `create_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (1,12,1,2,'reply','1970-01-01 00:00:00'),(2,11,1,2,'reply','1970-01-01 00:00:00'),(3,11,2,1,'what?','1970-01-01 00:00:00'),(4,12,2,1,'who are you?','1970-01-01 00:00:00'),(5,12,1,2,'who are you????','1970-01-01 00:00:00'),(6,17,1,1,'98888888888','2017-04-23 13:47:21'),(7,17,1,1,'1010101010','2017-04-23 13:47:38'),(8,10,1,2,'hehe','2017-04-23 13:47:52'),(9,10,1,1,'hehee','2017-04-23 13:48:02'),(10,10,1,2,'455555','2017-04-23 14:00:55'),(11,10,1,1,'677777777','2017-04-23 14:01:08'),(12,10,1,2,'899999999999','2017-04-23 14:01:18'),(13,16,1,1,'877','2017-04-23 14:01:29'),(14,18,1,1,'78888888','2017-04-23 14:01:47'),(15,20,1,1,'988888','2017-04-23 14:02:43'),(16,20,1,1,'9898989','2017-04-23 14:03:12'),(17,20,1,1,'756','2017-04-23 14:03:18'),(18,21,1,1,'非常好\r\n恩','2017-04-23 14:03:33'),(19,9,1,1,'ha?','2017-04-23 14:12:53'),(20,8,2,1,'好好好','2017-04-23 14:13:31'),(21,23,1,1,'shide ','2017-04-26 17:24:43'),(22,23,1,1,'hahaha','2017-04-26 17:30:21'),(23,22,3,1,'是的','2017-04-26 17:36:21'),(24,26,1,3,'赞同！','2017-04-26 17:39:04'),(25,26,1,3,'好看','2017-04-26 17:43:15'),(26,27,2,1,'哈哈','2017-04-26 18:46:17'),(27,29,1,2,'good','2017-04-26 19:11:53');
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(16) NOT NULL,
  `password` varchar(32) NOT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `lastedLoginTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin1','/public/images/1493205134560.png',NULL,'2017-04-26 19:10:54'),(2,'user1','user11','/public/images/1493203535918.png','2017-04-22 23:31:37','2017-04-26 18:45:22');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-26 20:05:31
