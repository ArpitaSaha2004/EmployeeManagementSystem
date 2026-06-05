CREATE DATABASE  IF NOT EXISTS `employee_management` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `employee_management`;
-- MySQL dump 10.13  Distrib 8.0.46, for macos15 (arm64)
--
-- Host: localhost    Database: employee_management
-- ------------------------------------------------------
-- Server version	9.7.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '659e00ca-533b-11f1-8ebc-24acf1b6b97d:1-75';

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin','admin123','admin');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (21,'Rahul','Sharma','rahul@gmail.com','Kolkata','1998-05-10','9876543210','IT','Java Developer',55000,'Employee','rahul','rahul123'),(22,'Priya','Das','priya@gmail.com','Delhi','1997-08-14','9876543211','HR','HR Manager',48000,'Admin','priya','priya123'),(23,'Amit','Roy','amit@gmail.com','Mumbai','1999-02-20','9876543212','Finance','Accountant',22000,'Employee','amit','amit123'),(24,'Sneha','Paul','sneha@gmail.com','Bangalore','1998-11-05','9876543213','Marketing','Marketing Executive',39000,'Employee','sneha','sneha123'),(25,'Arjun','Sen','arjun@gmail.com','Pune','1996-07-18','9876543214','IT','Backend Developer',67000,'Employee','arjun','arjun123'),(26,'Vikram','Singh','vikram@gmail.com','Chennai','1995-04-12','9876543215','Finance','Financial Analyst',68000,'Employee','vikram','vikram123'),(27,'Tina','Paul','tina@gmail.com','Hyderabad','1997-03-22','9876543216','Marketing','SEO Specialist',43000,'Employee','tina','tina123'),(28,'Rohit','Naskar','rohit@gmail.com','Kolkata','1998-09-11','9876543217','Finance','Full Stack Developer',72000,'Admin','rohit','rohit123'),(29,'Pooja','Dutta','pooja@gmail.com','Delhi','1999-12-01','9876543218','Design','Graphic Designer',40000,'Employee','pooja','pooja123'),(30,'Abhishek','Roy','abhishek@gmail.com','Mumbai','1995-06-28','9876543219','Operations','Operations Manager',54000,'Employee','abhishek','abhishek123'),(31,'Neha','Kapoor','neha@gmail.com','Pune','1997-10-09','9876543220','HR','Recruiter',35000,'Employee','neha','neha123'),(32,'Sourav','Das','sourav@gmail.com','Kolkata','1996-01-15','9876543221','IT','DevOps Engineer',69000,'Employee','sourav','sourav123'),(33,'Meera','Iyerr','meera@gmail.com','Chennai','1998-08-08','9876543222','Finance','Tax Consultant',52000,'Employee','meera','meera123'),(34,'Karan','Malhotra','karan@gmail.com','Delhi','1995-05-25','9876543223','Sales','Sales Executive',47000,'Employee','karan','karan123'),(35,'Ananya','Ghosh','ananya@gmail.com','Kolkata','1999-04-30','9876543224','Design','UI/UX Designer',51000,'Employee','ananya','ananya123');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-23 10:17:10
