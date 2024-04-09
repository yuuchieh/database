CREATE DATABASE  IF NOT EXISTS `phoneone` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `phoneone`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: phoneone
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_no` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `member_id` int NOT NULL,
  `product_no` int NOT NULL,
  PRIMARY KEY (`cart_no`),
  KEY `cAK` (`member_id`,`product_no`) USING BTREE,
  KEY `cFK2_idx` (`product_no`) /*!80000 INVISIBLE */,
  KEY `szxx` (`cart_no`),
  CONSTRAINT `cFK` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`),
  CONSTRAINT `cFK2` FOREIGN KEY (`product_no`) REFERENCES `product` (`product_no`),
  CONSTRAINT `zfzc` FOREIGN KEY (`cart_no`) REFERENCES `cart` (`cart_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,3,1,1),(2,2,2,1),(3,3,1,2),(6,5,5,3),(7,1,4,8),(8,1,6,10),(9,1,7,14),(10,1,7,13);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `comment_no` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `product_no` int NOT NULL,
  `comment_star` varchar(45) NOT NULL,
  `comment_content` varchar(45) DEFAULT NULL,
  `comment_date` date NOT NULL,
  PRIMARY KEY (`comment_no`),
  KEY `coAK` (`member_id`,`product_no`) USING BTREE,
  KEY `coFK1_idx` (`product_no`),
  CONSTRAINT `coFK` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `coFK1` FOREIGN KEY (`product_no`) REFERENCES `product` (`product_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,1,1,'5','I love it','2002-02-08'),(2,3,3,'4','水喔','2023-06-10'),(3,1,1,'2','perfect','2002-02-08'),(4,2,1,'4','good','2023-06-09');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `member_id` int NOT NULL,
  `member_name` varchar(45) NOT NULL,
  `password` int NOT NULL,
  `tel` varchar(45) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  KEY `mak` (`member_id`) USING BTREE /*!80000 INVISIBLE */,
  CONSTRAINT `sdsds` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'yu',123,'0911111111','tainan','女','a@gmail.com','2002-09-21'),(2,'chi',145,'0922222222','taipei','男','b@gmail.com','2002-10-21'),(3,'hello',912,'0933333333','taipei','男','c@gmail.com','2002-11-21'),(4,'chui',345,'0944444444','taichung','男','d@gmail.com','2002-12-21'),(5,'ann',136,'09555555555','taoyuan','女','e@gmail.com','2003-01-21'),(6,'jim',666,'0966666666',NULL,'男','kevin@gmail.com','2003-02-21'),(7,'lily',121,'0977777777',NULL,'女','f@gmail.com','2004-03-21'),(8,'jarren',255,'0988888888',NULL,'男','jarrenpoh@gmail.com','2005-04-21');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `member_BEFORE_UPDATE` BEFORE UPDATE ON `member` FOR EACH ROW BEGIN
	INSERT INTO `member_audit`  
	SET `Action` = 'update', `member_id` = OLD.`member_id`,  `ModifiedDate` = NOW();

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `member_audit`
--

DROP TABLE IF EXISTS `member_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_audit` (
  `member_auditID` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `ModifiedDate` datetime NOT NULL,
  `Action` char(10) NOT NULL,
  `Status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`member_auditID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_audit`
--

LOCK TABLES `member_audit` WRITE;
/*!40000 ALTER TABLE `member_audit` DISABLE KEYS */;
INSERT INTO `member_audit` VALUES (1,1,'2023-06-08 21:35:22','update',NULL),(2,2,'2023-06-09 22:00:01','update',NULL),(3,1,'2023-06-09 22:00:24','update',NULL),(4,3,'2023-06-09 22:00:34','update',NULL),(5,3,'2023-06-09 22:00:52','update',NULL),(6,3,'2023-06-09 23:59:13','update',NULL),(7,3,'2023-06-09 23:59:25','update',NULL),(22,1,'2023-06-10 01:23:38','update',NULL),(23,2,'2023-06-10 01:23:38','update',NULL),(24,3,'2023-06-10 01:23:38','update',NULL),(25,4,'2023-06-10 01:23:38','update',NULL),(26,5,'2023-06-10 01:23:38','update',NULL),(27,6,'2023-06-10 01:23:38','update',NULL),(28,7,'2023-06-10 01:23:38','update',NULL),(29,8,'2023-06-10 01:23:38','update',NULL),(30,3,'2023-06-10 11:55:55','update',NULL);
/*!40000 ALTER TABLE `member_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `memberorders`
--

DROP TABLE IF EXISTS `memberorders`;
/*!50001 DROP VIEW IF EXISTS `memberorders`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `memberorders` AS SELECT 
 1 AS `member_id`,
 1 AS `member_name`,
 1 AS `order_no`,
 1 AS `order_date`,
 1 AS `payment`,
 1 AS `delivery_way`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_no` int NOT NULL,
  `member_id` int NOT NULL,
  `order_date` date DEFAULT NULL,
  `payment` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`order_no`),
  KEY `oddAK` (`member_id`),
  CONSTRAINT `oddFK` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,4,'2023-06-01','credit'),(2,2,'2023-06-01','credit'),(3,2,'2023-06-02','credit'),(4,1,'2023-06-05','credit'),(5,3,'2023-06-05','credit'),(6,5,'2023-06-06','credit'),(7,4,'2023-06-07','credit'),(8,5,'2023-06-08','credit'),(9,3,'2023-06-08','credit'),(10,1,'2023-06-08','credit');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_delivery`
--

DROP TABLE IF EXISTS `order_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_delivery` (
  `delivery_no` int NOT NULL,
  `order_no` int NOT NULL,
  `delivery_way` varchar(45) NOT NULL,
  PRIMARY KEY (`delivery_no`),
  KEY `orderdelivAK` (`order_no`) USING BTREE,
  CONSTRAINT `orderdelivFK` FOREIGN KEY (`order_no`) REFERENCES `order` (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_delivery`
--

LOCK TABLES `order_delivery` WRITE;
/*!40000 ALTER TABLE `order_delivery` DISABLE KEYS */;
INSERT INTO `order_delivery` VALUES (1,1,'711'),(2,3,'711'),(3,6,'711'),(4,5,'711'),(5,8,'711');
/*!40000 ALTER TABLE `order_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `order_details_total`
--

DROP TABLE IF EXISTS `order_details_total`;
/*!50001 DROP VIEW IF EXISTS `order_details_total`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `order_details_total` AS SELECT 
 1 AS `order_no`,
 1 AS `member_id`,
 1 AS `payment`,
 1 AS `order_date`,
 1 AS `product_no`,
 1 AS `product_model`,
 1 AS `quantity`,
 1 AS `product_model_description`,
 1 AS `unit_price`,
 1 AS `total_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `order_product`
--

DROP TABLE IF EXISTS `order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_product` (
  `order_no` int NOT NULL,
  `product_no` int NOT NULL,
  `product_model` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`order_no`,`product_no`),
  KEY `opAK` (`order_no`) USING BTREE,
  KEY `opAK1` (`product_no`) USING BTREE,
  CONSTRAINT `opFK` FOREIGN KEY (`order_no`) REFERENCES `order` (`order_no`),
  CONSTRAINT `opFK2` FOREIGN KEY (`product_no`) REFERENCES `product` (`product_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product`
--

LOCK TABLES `order_product` WRITE;
/*!40000 ALTER TABLE `order_product` DISABLE KEYS */;
INSERT INTO `order_product` VALUES (1,4,13,2),(2,5,14,1),(3,1,11,2),(4,2,12,3),(5,7,13,2),(6,3,12,1),(7,8,14,1),(8,15,11,1),(9,13,13,4),(10,11,11,2);
/*!40000 ALTER TABLE `order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_no` int NOT NULL,
  `unit_price` int NOT NULL,
  `product_model` int NOT NULL,
  `product_intro` varchar(60) DEFAULT NULL,
  `product_img` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`product_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,350,11,'cute','https://www.pinterest.com/pin/985231162123898/'),(2,350,12,'cat','https://www.pinterest.com/pin/899805200526772684/'),(3,400,13,'snoopy','https://www.pinterest.com/pin/178244097745231437/'),(4,400,13,'cloud','https://www.pinterest.com/pin/971722057077823637/'),(5,400,14,'pokemon','https://www.pinterest.com/pin/620722761158275287/'),(6,400,12,'duck','https://www.pinterest.com/pin/29906785018552943/'),(7,400,13,'winnie','https://www.pinterest.com/pin/582934745541619770/'),(8,450,14,'cartoon','https://www.pinterest.com/pin/722124121524792266/'),(9,499,14,'sky','https://www.pinterest.com/pin/965248132615697172/'),(10,499,14,'stitch','https://www.pinterest.com/pin/1119848263571194937/'),(11,500,11,'dog','https://www.pinterest.com/pin/61080138736055245/'),(12,550,12,'cryingcat','https://www.pinterest.com/pin/272960427408581319/'),(13,550,13,'princess','https://www.pinterest.com/pin/174233079326324232/'),(14,600,11,'uglydog','https://www.pinterest.com/pin/629518854187060986/'),(15,670,11,'complex','https://www.pinterest.com/pin/292593307033275492/'),(126,350,13,NULL,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `product_AFTER_INSERT` AFTER INSERT ON `product` FOR EACH ROW BEGIN
    INSERT INTO `product_audit` (`product_no`, `ModifiedDate`, `Action`)
    VALUES (NEW.`product_no`, NOW(), 'insert');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `product_audit`
--

DROP TABLE IF EXISTS `product_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_audit` (
  `product_auditid` int NOT NULL AUTO_INCREMENT,
  `product_no` int NOT NULL,
  `ModifiedDate` datetime NOT NULL,
  `Action` varchar(10) NOT NULL,
  PRIMARY KEY (`product_auditid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_audit`
--

LOCK TABLES `product_audit` WRITE;
/*!40000 ALTER TABLE `product_audit` DISABLE KEYS */;
INSERT INTO `product_audit` VALUES (1,123,'2023-06-09 21:54:39','insert'),(2,124,'2023-06-09 21:55:34','insert'),(4,126,'2023-06-10 11:56:34','insert');
/*!40000 ALTER TABLE `product_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `productratings`
--

DROP TABLE IF EXISTS `productratings`;
/*!50001 DROP VIEW IF EXISTS `productratings`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `productratings` AS SELECT 
 1 AS `product_no`,
 1 AS `product_model`,
 1 AS `avg_rating`,
 1 AS `total_comments`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'phoneone'
--

--
-- Dumping routines for database 'phoneone'
--
/*!50003 DROP PROCEDURE IF EXISTS `calculate_comment_counts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `calculate_comment_counts`()
BEGIN
    -- 建立一個暫存表來存儲手機型號的留言次數
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_comment_counts (
        model VARCHAR(255),
        comment_count INT
    );

    -- 清空暫存表
    TRUNCATE TABLE temp_comment_counts;

    -- 更新手機型號的留言次數
    INSERT INTO temp_comment_counts (model, comment_count)
    SELECT p.product_model, COUNT(c.comment_no) AS comment_count
    FROM product AS p
    LEFT JOIN comment AS c ON p.product_no = c.product_no
    GROUP BY p.product_model;

    -- 檢索結果
    SELECT * FROM temp_comment_counts;

    -- 刪除暫存表
    DROP TABLE IF EXISTS temp_comment_counts;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_cart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_cart`(
	IN r_cart_no INT
)
BEGIN
	DELETE FROM `cart` 
	WHERE `cart_no` = r_cart_no;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_comment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_comment`(
	IN r_comment_no INT
)
BEGIN
	DELETE FROM `comment` 
	WHERE `comment_no` = r_comment_no;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_delivery` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_delivery`(
	IN r_delivery_no INT
)
BEGIN
	DELETE FROM `order_delivery` 
	WHERE `delivery_no` = r_delivery_no;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_member` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_member`(
	IN r_member_id INT
)
BEGIN
	-- 刪除x
	DELETE FROM `member` 
	WHERE `member_id` = r_member_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_cart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_cart`(
	IN cart_no INT,
    IN quantity INT,
    IN member_id INT,
    IN product_no INT
)
BEGIN
	
	INSERT INTO `cart` (cart_no, quantity,member_id,product_no) 
	VALUES (cart_no, quantity,member_id,product_no);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_comment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_comment`(
	IN comment_no INT,
    IN member_id INT,
    IN product_no INT,
    IN comment_star VARCHAR(255),
    In comment_content VARCHAR(255),
    IN comment_date DATE
)
BEGIN
	INSERT INTO `comment` (comment_no, member_id, product_no, comment_star, comment_content, comment_date) 
	VALUES (comment_no, member_id, product_no, comment_star, comment_content, comment_date);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_delivery` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_delivery`(
	IN delivery_no INT,
    IN order_no INT,
    IN delivery_way VARCHAR(255)
)
BEGIN
	INSERT INTO `order_delivery` (delivery_no, order_no, delivery_way) 
	VALUES (delivery_no, order_no, delivery_way);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_member` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_member`(
    IN member_id INT,
    IN member_name VARCHAR(255),
    IN password INT,
    IN tel INT,
    IN email VARCHAR(255)
)
BEGIN
    -- 新增會員
    INSERT INTO member (member_id, member_name, password, tel, email)
    VALUES (member_id, member_name, password, tel, email);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_procedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_procedure`(
	IN member_id INT
)
BEGIN
	-- 刪除
	DELETE FROM `member` 
	WHERE `member_id` = member_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search_cart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `search_cart`(r_cart_no INT)
BEGIN
	SELECT * FROM `cart` 
	WHERE `cart_no` = r_cart_no;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search_comment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `search_comment`(
	IN r_comment_no INT
)
BEGIN
	SELECT * FROM `comment` 
	WHERE `comment_no` = r_comment_no;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search_delivery` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `search_delivery`(
	IN r_delivery_no INT
)
BEGIN
	SELECT * FROM `order_delivery` 
	WHERE `delivery_no` = r_delivery_no;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search_member` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `search_member`(
	IN r_member_id INT
)
BEGIN
	-- 查詢
	SELECT * FROM `member` 
	WHERE `member_id` = r_member_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `search_order`(
	IN r_order_no INT
)
BEGIN
	-- 訂單查詢
	SELECT * FROM `order` 
	WHERE `order_no` = r_order_no;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search_order_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `search_order_product`(
	IN r_order_no INT
)
BEGIN
	-- 訂單商品資訊查詢
	SELECT * FROM `order_product` 
	WHERE `order_no` = r_order_no;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `search_product`(
	IN product_no INT
)
BEGIN
	-- 商品資訊查詢
	SELECT * FROM `product` 
	WHERE `product_no` = product_no;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_cart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_cart`(
	IN r_cart_no INT,
	IN r_quantity INT
)
BEGIN
	-- 購物車修改
	UPDATE`cart`
	SET `quantity` = r_quantity
	WHERE `cart_no` = r_cart_no;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_comment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_comment`(
	IN r_comment_no INT,
	IN r_comment_star VARCHAR(255)
)
BEGIN
	UPDATE`comment`
	SET `comment_star` = r_comment_star
	WHERE `comment_no` = r_comment_no;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_delivery` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_delivery`(
	IN r_delivery_no INT,
	IN r_delivery_way VARCHAR(255)
)
BEGIN
	UPDATE`order_delivery`
	SET `delivery_way` = r_delivery_way
	WHERE `delivery_no` = r_delivery_no;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_member` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_member`(
    IN r_member_id INT,
    IN r_member_name VARCHAR(255),
    IN r_password VARCHAR(255),
    IN r_tel VARCHAR(255),
    IN r_email VARCHAR(255)
)
BEGIN
    -- 修改
    UPDATE `member`
    SET
        `member_name` =  r_member_name,
        `password` =  r_password,
        `tel` = r_tel,
        `email` = r_email
    WHERE `member_id` = r_member_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `memberorders`
--

/*!50001 DROP VIEW IF EXISTS `memberorders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `memberorders` AS select `m`.`member_id` AS `member_id`,`m`.`member_name` AS `member_name`,`o`.`order_no` AS `order_no`,`o`.`order_date` AS `order_date`,`o`.`payment` AS `payment`,`od`.`delivery_way` AS `delivery_way` from ((`member` `m` join `order` `o` on((`m`.`member_id` = `o`.`member_id`))) left join `order_delivery` `od` on((`o`.`order_no` = `od`.`order_no`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `order_details_total`
--

/*!50001 DROP VIEW IF EXISTS `order_details_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `order_details_total` AS select `o`.`order_no` AS `order_no`,`o`.`member_id` AS `member_id`,`o`.`payment` AS `payment`,`o`.`order_date` AS `order_date`,`op`.`product_no` AS `product_no`,`op`.`product_model` AS `product_model`,`op`.`quantity` AS `quantity`,`p`.`product_model` AS `product_model_description`,`p`.`unit_price` AS `unit_price`,(`op`.`quantity` * `p`.`unit_price`) AS `total_price` from ((`order` `o` join `order_product` `op` on((`o`.`order_no` = `op`.`order_no`))) join `product` `p` on((`op`.`product_no` = `p`.`product_no`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `productratings`
--

/*!50001 DROP VIEW IF EXISTS `productratings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `productratings` AS select `p`.`product_no` AS `product_no`,`p`.`product_model` AS `product_model`,avg(`c`.`comment_star`) AS `avg_rating`,count(`c`.`comment_no`) AS `total_comments` from (`product` `p` left join `comment` `c` on((`p`.`product_no` = `c`.`product_no`))) group by `p`.`product_no`,`p`.`product_model` */;
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

-- Dump completed on 2023-06-10 13:47:25
