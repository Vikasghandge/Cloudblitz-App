-- MySQL dump 10.13  Distrib 8.0.43, for Linux (x86_64)
--
-- Host: cloudblitz-backup.cluo4ag8m536.ap-south-1.rds.amazonaws.com    Database: student_db
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `course` varchar(255) DEFAULT NULL,
  `student_class` varchar(255) DEFAULT NULL,
  `percentage` double DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (80,'Aarav Sharma','aarav.sharma@example.com','B.Tech','2025',85.6,'Computer Science','9876543210'),(81,'Priya Singh','priya.singh@example.com','B.Sc','2025',78.2,'Physics','9876543211'),(82,'Rohan Gupta','rohan.gupta@example.com','B.Com','2025',82.4,'Commerce','9876543212'),(83,'Sneha Patel','sneha.patel@example.com','B.A','2025',74.9,'English','9876543213'),(84,'Aditya Mehra','aditya.mehra@example.com','B.Tech','2025',91.3,'Mechanical','9876543214'),(85,'Ananya Verma','ananya.verma@example.com','BBA','2025',69.5,'Management','9876543215'),(86,'Vivaan Khanna','vivaan.khanna@example.com','B.Tech','2025',88.7,'Electrical','9876543216'),(87,'Isha Rao','isha.rao@example.com','B.Sc','2025',81,'Chemistry','9876543217'),(88,'Kabir Joshi','kabir.joshi@example.com','B.Com','2025',76.4,'Accounting','9876543218'),(89,'Diya Malhotra','diya.malhotra@example.com','B.A','2025',79.5,'History','9876543219');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `branch` varchar(255) DEFAULT NULL,
  `course` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `percentage` double DEFAULT NULL,
  `student_class` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'skmsmf','sfnnkfn','ghandgevikas804@gm','07798834281','Vikas Ghand',4874,'snksnf'),(2,'fuu`','bca','shubham@gmail.com','494964','shubham pal',90,'mca'),(3,'no','devops','shiv@gmail.com','07798834281','shiv',88,'mca'),(4,'dnkjdnv','d jd ','ghandgevikas804@gm','07798834281','Vikas Ghand',847847,'ndkn'),(5,'sv ksm v','djnjn','ghandgevikas804@gm','07798834281','Vikas Ghand',5484,'kcnks ');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-23  8:06:30
