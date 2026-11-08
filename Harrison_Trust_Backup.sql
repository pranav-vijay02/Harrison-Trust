-- MySQL dump 10.13  Distrib 5.1.33, for Win32 (ia32)
--
-- Host: localhost    Database: harrisontrust
-- ------------------------------------------------------
-- Server version	5.1.33-community

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
-- Current Database: `harrisontrust`
--

/*!40000 DROP DATABASE IF EXISTS `harrisontrust`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `harrisontrust` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `harrisontrust`;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_users` (
  `Admin_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) NOT NULL,
  `Password_Salt` varchar(64) NOT NULL,
  `Password_Hash` varchar(64) NOT NULL,
  PRIMARY KEY (`Admin_ID`),
  UNIQUE KEY `Username` (`Username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'admin','f1f6ec662c0ecd50abd625b8cc369188','8b407cc06f3dcbf2307d040b5375e4bacf3a3922396ef75566c07ba2cfb5e6c5'),(2,'manager','4202f395d4ef7b2b2404feed772e13ce','9f97bda61638fec713c62760e85ba25c018e263d008ebe19d4c4e1d1a9e52795'),(3,'staff','2e9781421fcf5508b6f612e86a0faf9f','b0be0c6f39ea29d2b743ae416d1867d31b77c1124e42c738c87fe3fb3893ae6e');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donors_general`
--

DROP TABLE IF EXISTS `donors_general`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donors_general` (
  `Donor_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Donor_Name` varchar(50) NOT NULL,
  `Age` int(11) NOT NULL,
  `DOB` date NOT NULL,
  `Gender` varchar(7) DEFAULT NULL,
  `Blood_Group` varchar(3) NOT NULL,
  `Phone` char(10) NOT NULL,
  `City` varchar(200) NOT NULL,
  PRIMARY KEY (`Donor_ID`),
  UNIQUE KEY `unique_donor_phone` (`Phone`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donors_general`
--

LOCK TABLES `donors_general` WRITE;
/*!40000 ALTER TABLE `donors_general` DISABLE KEYS */;
INSERT INTO `donors_general` VALUES (1,'Narain Raj',58,'1968-02-15','Female','A-','7000000000','Bengaluru'),(2,'Ananya Iyer',56,'1970-06-15','Female','A+','7000000001','Ahmedabad'),(3,'Nikhil Varma',63,'1963-06-04','Male','AB-','7000000002','Delhi'),(4,'Nandhini Devi',19,'2007-07-26','Male','B+','7000000003','Delhi'),(5,'Mithun Raj',24,'2002-02-07','Female','AB-','7000000004','Mumbai'),(6,'Rohit Nair',54,'1972-04-28','Female','A+','7000000005','Ahmedabad'),(7,'Sneha Raj',54,'1972-10-03','Female','A-','7000000006','Ahmedabad'),(8,'Manish Rao',27,'1999-04-19','Male','O-','7000000007','Hyderabad'),(9,'Ajay Kumar',58,'1968-09-26','Female','AB+','7000000008','Hyderabad'),(10,'Karthik Rajan',56,'1970-08-03','Male','A+','7000000009','Delhi'),(11,'Sindhuja R',18,'2008-04-14','Female','AB-','7000000010','Ahmedabad'),(12,'Divya Menon',50,'1975-11-12','Male','A+','7000000011','Bengaluru'),(13,'Surya Prakash',29,'1997-01-25','Female','B+','7000000012','Bengaluru'),(14,'Sowmya Ravi',31,'1995-02-08','Female','B-','7000000013','Mumbai'),(15,'Deepa Mohan',36,'1990-06-04','Female','O-','7000000014','Delhi'),(16,'Gautam Shah',42,'1984-03-23','Male','O+','7000000015','Mumbai'),(17,'Ritika Sinha',48,'1978-11-04','Female','O-','7000000016','Mumbai'),(18,'Swathi Lakshmi',39,'1987-05-01','Female','A+','7000000017','Chennai'),(19,'Akshaya S',48,'1978-01-11','Male','B-','7000000018','Mumbai'),(20,'Sanjana S',34,'1992-04-20','Male','O+','7000000019','Hyderabad'),(21,'Naveen Kumar',29,'1997-09-25','Female','B-','7000000020','Delhi'),(22,'Arun Kumar',18,'2008-10-24','Male','A-','7000000021','Bengaluru'),(23,'Harish Kumar',57,'1969-06-18','Male','A-','7000000022','Bengaluru'),(24,'Tarun Mehta',51,'1975-08-19','Male','B-','7000000023','Mumbai'),(25,'Keerthana S',55,'1971-07-11','Female','B-','7000000024','Delhi'),(26,'Vikram Singh',43,'1983-09-26','Male','B+','7000000025','Bengaluru'),(27,'Srilakshmi P',46,'1979-12-01','Female','AB+','7000000026','Hyderabad'),(28,'Nithya Raman',23,'2003-06-29','Male','A-','7000000027','Chennai'),(29,'Pranav Shah',34,'1991-11-24','Male','AB-','7000000028','Delhi'),(30,'Manoj Das',36,'1989-11-18','Male','B-','7000000029','Chennai'),(31,'Deepak Verma',45,'1981-06-17','Male','A-','7000000030','Mumbai'),(32,'Vidhya Raman',31,'1995-10-14','Female','AB+','7000000031','Delhi'),(33,'Shreya Kapoor',55,'1971-02-24','Female','AB-','7000000032','Hyderabad'),(34,'Revathi Kumar',38,'1988-07-20','Female','A+','7000000033','Hyderabad'),(35,'Kiran Kumar',21,'2005-03-10','Female','AB-','7000000034','Chennai'),(36,'Arjun Rao',22,'2004-05-13','Male','O-','7000000035','Delhi'),(37,'Vignesh K',52,'1974-09-13','Male','B-','7000000036','Mumbai'),(38,'Aparna Krishnan',54,'1972-01-04','Male','A-','7000000037','Ahmedabad'),(39,'Varun Chakraborty',51,'1975-06-15','Male','B+','7000000038','Ahmedabad'),(40,'Abhishek Jain',41,'1985-03-07','Female','O+','7000000039','Delhi'),(41,'Rahul Verma',58,'1968-05-24','Female','A-','7000000040','Chennai'),(42,'Kavya Srinivasan',32,'1994-09-16','Male','B-','7000000041','Hyderabad'),(43,'Pooja Agarwal',61,'1965-08-20','Female','B-','7000000042','Delhi'),(44,'Ramesh Babu',29,'1996-11-21','Male','AB+','7000000043','Chennai'),(45,'Pavithra M',39,'1987-10-23','Female','AB+','7000000044','Bengaluru'),(46,'Gayathri S',42,'1984-08-28','Female','AB-','7000000045','Ahmedabad'),(47,'Vivek Anand',57,'1969-10-04','Female','B+','7000000046','Bengaluru'),(48,'Akash Deep',30,'1996-07-07','Male','AB-','7000000047','Hyderabad'),(49,'Roshni Mathew',62,'1964-02-20','Female','AB+','7000000048','Bengaluru'),(50,'Nisha Menon',25,'2001-10-15','Male','AB-','7000000049','Ahmedabad'),(51,'Harini V',56,'1970-06-10','Male','O+','7000000050','Chennai'),(52,'Ravi Shankar',59,'1967-04-30','Male','B-','7000000051','Bengaluru'),(53,'Priya Sharma',23,'2003-01-03','Female','B+','7000000052','Mumbai'),(54,'Monisha R',23,'2003-01-06','Male','AB+','7000000053','Delhi'),(55,'Praveen Raj',39,'1987-10-17','Male','O+','7000000054','Bengaluru'),(56,'Nitin Raj',52,'1974-07-17','Male','AB-','7000000055','Mumbai'),(57,'Rakesh Kumar',33,'1992-11-21','Male','B-','7000000056','Mumbai'),(58,'Sathish B',35,'1991-03-04','Female','AB+','7000000057','Bengaluru'),(59,'Tanvi Joshi',47,'1979-03-03','Male','A+','7000000058','Delhi'),(60,'Neha Malhotra',52,'1974-03-22','Male','B-','7000000059','Bengaluru'),(61,'Sanjay Gupta',55,'1971-06-07','Male','A+','7000000060','Hyderabad'),(62,'Anjali Pillai',53,'1972-11-29','Male','AB+','7000000061','Hyderabad'),(63,'Abirami K',30,'1996-11-01','Female','O-','7000000062','Mumbai'),(64,'Joseph Vijay',31,'1995-06-12','Male','AB+','7000000063','Chennai'),(65,'Dinesh Kumar',45,'1981-07-06','Female','A-','7000000064','Mumbai'),(66,'Ishita Roy',33,'1993-08-03','Male','A+','7000000065','Ahmedabad'),(67,'Pranav Vijay',36,'1990-10-02','Male','B-','7000000066','Chennai'),(68,'Rahul Das',36,'1990-10-14','Female','AB-','7000000067','Hyderabad'),(69,'Ashwin Raj',44,'1982-09-12','Female','O-','7000000068','Ahmedabad'),(70,'Maya Thomas',27,'1999-10-08','Female','O-','7000000069','Mumbai'),(71,'Madhan Kumar',47,'1979-11-01','Male','B-','7000000070','Hyderabad'),(72,'Rajkumar Shukla',40,'1986-01-19','Female','AB+','7000000071','Ahmedabad'),(73,'Aaradhya Singh',41,'1985-07-28','Female','B-','7000000072','Delhi'),(74,'Janani Balaji',46,'1980-10-24','Female','A+','7000000073','Delhi'),(75,'Prakash Menon',63,'1962-12-22','Male','A+','7000000074','Delhi'),(76,'Raghav Sharma',18,'2007-12-07','Male','AB-','7000000075','Hyderabad'),(77,'Divya Krishnan',52,'1974-05-22','Female','B-','7000000076','Chennai'),(78,'Sameera Karthi',22,'2004-03-20','Female','A-','7000000077','Bengaluru'),(79,'Simran Kaur',23,'2003-09-30','Female','AB+','7000000078','Bengaluru'),(80,'Nivetha R',21,'2005-07-18','Male','O+','7000000079','Hyderabad'),(81,'Bharath Kumar',33,'1992-11-12','Female','A+','7000000080','Chennai'),(82,'Aishwarya Menon',30,'1996-07-14','Male','O+','7000000081','Delhi'),(83,'Vishal Patel',52,'1974-08-21','Male','A-','7000000082','Delhi'),(84,'Balaji R',26,'2000-04-04','Male','AB-','7000000083','Chennai'),(85,'Karthik Subramanian',30,'1996-01-22','Male','A+','7000000084','Mumbai'),(86,'Sanjana Rao',27,'1998-12-10','Female','B-','7000000085','Delhi'),(87,'Shalini Gupta',51,'1975-05-12','Male','A-','7000000086','Bengaluru'),(88,'Malavika Nair',57,'1969-05-17','Female','B+','7000000087','Bengaluru'),(89,'Suraj Nair',18,'2008-10-30','Male','AB+','7000000088','Ahmedabad'),(90,'Rohan Mehta',52,'1974-11-06','Male','O+','7000000089','Mumbai'),(91,'Siddharth Bose',62,'1964-04-29','Female','B-','7000000090','Mumbai'),(92,'Pallavi Shah',61,'1965-06-07','Male','AB-','7000000091','Chennai'),(93,'Suresh Krishnan',30,'1995-12-24','Male','A+','7000000092','Hyderabad'),(94,'Gokul Nathan',25,'2001-01-20','Male','B-','7000000093','Hyderabad'),(95,'Vaishnavi R',60,'1966-09-27','Male','O-','7000000094','Bengaluru'),(96,'Riya Das',44,'1982-10-20','Male','AB-','7000000095','Mumbai'),(97,'Mohan Lal',55,'1971-04-29','Female','O+','7000000096','Delhi'),(98,'Anand Krishnan',65,'1961-08-07','Female','B+','7000000097','Chennai'),(99,'Aditi Mishra',45,'1981-08-01','Female','B-','7000000098','Ahmedabad');
/*!40000 ALTER TABLE `donors_general` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donors_medical`
--

DROP TABLE IF EXISTS `donors_medical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donors_medical` (
  `Donor_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Haemoglobin` decimal(4,1) NOT NULL,
  `Weight` decimal(5,1) NOT NULL,
  `Systolic_BP` int(11) NOT NULL,
  `Diastolic_BP` int(11) NOT NULL,
  `Last_Donation` date DEFAULT NULL,
  PRIMARY KEY (`Donor_ID`),
  CONSTRAINT `donors_medical_ibfk_1` FOREIGN KEY (`Donor_ID`) REFERENCES `donors_general` (`Donor_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donors_medical`
--

LOCK TABLES `donors_medical` WRITE;
/*!40000 ALTER TABLE `donors_medical` DISABLE KEYS */;
INSERT INTO `donors_medical` VALUES (1,'16.0','78.7',118,85,'2026-04-13'),(2,'14.8','78.7',128,77,'2025-08-08'),(3,'15.6','66.9',117,85,'2025-08-12'),(4,'14.8','72.4',122,73,'2025-10-07'),(5,'13.4','73.2',126,75,'2025-08-29'),(6,'14.1','83.1',126,73,'2025-12-05'),(7,'14.9','71.5',129,75,'2026-02-23'),(8,'13.7','61.6',112,76,'2025-09-04'),(9,'15.1','66.0',115,75,'2025-09-28'),(10,'14.4','72.1',128,81,'2025-12-15'),(11,'14.8','78.9',126,78,'2025-12-25'),(12,'13.6','81.5',124,82,'2026-02-04'),(13,'14.4','68.9',111,71,'2026-02-17'),(14,'15.8','70.9',125,77,'2026-01-20'),(15,'13.6','79.0',121,79,'2026-02-16'),(16,'15.7','62.7',110,75,'2025-11-28'),(17,'15.2','64.5',126,80,'2026-03-04'),(18,'13.4','61.5',117,71,'2026-02-10'),(19,'15.8','66.6',116,71,'2026-03-14'),(20,'13.3','74.9',128,74,'2025-10-10'),(21,'14.7','69.7',117,85,'2026-05-29'),(22,'13.1','74.1',125,79,'2026-01-03'),(23,'14.8','61.8',116,79,'2025-12-25'),(24,'14.4','76.2',115,80,'2026-02-19'),(25,'14.1','76.5',119,83,'2026-05-12'),(26,'14.0','80.9',119,76,'2026-02-04'),(27,'14.8','62.8',111,84,'2025-12-06'),(28,'14.5','68.6',123,74,'2025-08-03'),(29,'15.1','83.3',127,76,'2026-01-15'),(30,'14.1','53.9',119,70,'2026-05-09'),(31,'15.0','78.0',120,74,'2025-10-17'),(32,'15.4','50.9',116,74,'2025-10-01'),(33,'13.9','67.5',112,85,'2025-07-21'),(34,'15.5','54.3',126,83,'2026-04-25'),(35,'13.3','54.4',116,85,'2025-09-19'),(36,'15.0','52.5',120,70,'2025-09-12'),(37,'15.6','73.4',128,80,'2026-03-10'),(38,'15.3','76.9',124,70,'2025-08-15'),(39,'15.7','57.8',127,80,'2025-10-12'),(40,'14.1','66.4',122,80,'2026-05-18'),(41,'13.0','57.6',116,82,'2025-08-25'),(42,'13.7','71.7',126,73,'2026-03-15'),(43,'13.1','83.7',114,85,'2025-07-17'),(44,'15.3','54.4',127,83,'2025-08-09'),(45,'15.0','69.7',127,84,'2025-09-01'),(46,'13.7','82.5',111,80,'2025-09-02'),(47,'13.1','75.4',120,70,'2026-05-06'),(48,'14.8','75.7',122,81,'2026-04-25'),(49,'13.6','73.4',119,82,'2026-03-29'),(50,'14.1','71.5',119,80,'2025-11-27'),(51,'15.4','71.9',114,81,'2025-12-05'),(52,'13.4','71.0',122,80,'2025-12-10'),(53,'15.8','54.5',118,81,'2026-04-26'),(54,'14.4','82.8',112,70,'2026-03-30'),(55,'14.2','70.6',129,80,'2026-01-26'),(56,'14.1','77.6',112,75,'2025-10-24'),(57,'13.4','79.5',129,71,'2026-04-04'),(58,'13.1','70.5',120,73,'2025-12-02'),(59,'15.3','79.3',122,70,'2026-04-19'),(60,'13.3','81.8',116,84,'2025-10-21'),(61,'13.9','50.8',130,79,'2025-10-08'),(62,'14.7','64.0',120,70,'2026-02-13'),(63,'14.3','50.0',125,70,'2026-01-21'),(64,'14.4','74.8',113,75,'2025-07-30'),(65,'13.5','57.0',122,74,'2025-10-08'),(66,'15.2','67.0',126,75,'2025-08-01'),(67,'15.8','64.0',123,83,'2025-11-25'),(68,'14.5','64.2',130,83,'2025-12-23'),(69,'15.1','73.3',126,74,'2025-11-24'),(70,'13.6','68.4',129,83,'2026-01-23'),(71,'15.1','58.1',127,80,'2026-06-06'),(72,'15.9','58.9',127,82,'2025-12-17'),(73,'14.5','72.5',123,75,'2025-07-21'),(74,'13.4','51.8',127,71,'2025-07-25'),(75,'13.8','62.4',126,76,'2026-05-08'),(76,'14.2','83.2',125,84,'2026-06-05'),(77,'13.1','70.1',116,70,'2025-11-29'),(78,'13.8','69.8',119,77,'2025-11-21'),(79,'13.6','77.0',119,72,'2025-08-20'),(80,'14.8','76.0',115,78,'2026-04-24'),(81,'14.3','82.4',126,77,'2025-10-14'),(82,'14.9','54.8',117,78,'2026-05-28'),(83,'14.8','74.2',127,78,'2025-08-23'),(84,'15.3','69.7',125,77,'2025-12-19'),(85,'15.1','53.7',115,85,'2026-02-02'),(86,'14.8','75.7',128,80,'2026-05-26'),(87,'14.2','55.4',118,82,'2025-12-12'),(88,'13.5','83.8',115,76,'2025-12-10'),(89,'15.7','53.4',112,76,'2026-05-19'),(90,'13.3','65.7',129,78,'2026-04-02'),(91,'14.6','60.1',113,78,'2025-07-13'),(92,'15.8','57.3',123,79,'2025-08-20'),(93,'13.6','54.4',110,73,'2025-09-20'),(94,'13.8','80.2',126,85,'2025-09-15'),(95,'14.6','66.5',110,76,'2025-10-01'),(96,'14.7','64.7',113,79,'2025-12-27'),(97,'15.5','83.0',110,80,'2026-03-20'),(98,'15.5','57.6',128,81,'2026-02-06'),(99,'13.3','68.0',130,84,'2026-05-23');
/*!40000 ALTER TABLE `donors_medical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipients_general`
--

DROP TABLE IF EXISTS `recipients_general`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipients_general` (
  `Recipient_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Recipient_Name` varchar(50) NOT NULL,
  `Age` int(11) NOT NULL,
  `DOB` date NOT NULL,
  `Gender` varchar(50) DEFAULT NULL,
  `Blood_Group` varchar(3) NOT NULL,
  `Phone` char(10) NOT NULL,
  PRIMARY KEY (`Recipient_ID`),
  UNIQUE KEY `unique_recipient_phone` (`Phone`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipients_general`
--

LOCK TABLES `recipients_general` WRITE;
/*!40000 ALTER TABLE `recipients_general` DISABLE KEYS */;
INSERT INTO `recipients_general` VALUES (1,'Raghav Gupta',83,'1942-12-27','Male','O+','7000000099'),(2,'Praveen Nair',84,'1942-08-14','Female','O-','7000000100'),(3,'Ramesh Kumar',21,'2005-05-19','Male','AB-','7000000101'),(4,'Anand Kumar',28,'1998-05-24','Female','AB-','7000000102'),(5,'Ravi Shankar',58,'1968-03-22','Male','A+','7000000103'),(6,'Anjali Rao',77,'1949-05-23','Female','A+','7000000104'),(7,'Varun Nair',23,'2003-01-16','Female','A-','7000000105'),(8,'Tarun Kumar',26,'2000-09-15','Male','B+','7000000106'),(9,'Pallavi Nair',66,'1960-03-19','Male','O+','7000000107'),(10,'Madhan Kumar',68,'1957-12-23','Male','O-','7000000108'),(11,'Divya Lakshmi',71,'1954-12-01','Female','B+','7000000109'),(12,'Aparna Menon',59,'1967-08-07','Female','O+','7000000110'),(13,'Simran Kaur',39,'1987-02-13','Female','O+','7000000111'),(14,'Malavika S',3,'2023-07-26','Female','B+','7000000112'),(15,'Aditya Nair',31,'1995-02-12','Male','A+','7000000113'),(16,'Ajith Kumar',79,'1947-05-28','Male','O+','7000000114'),(17,'Gokul Raj',58,'1968-08-25','Female','A-','7000000115'),(18,'Nivetha Iyer',5,'2021-02-13','Male','O-','7000000116'),(19,'Sathya Narayanan',56,'1970-05-04','Male','O+','7000000117'),(20,'Pooja Shah',69,'1957-05-20','Female','A-','7000000118'),(21,'Siddharth Rao',36,'1990-05-29','Female','AB+','7000000119'),(22,'Arun Babu',21,'2004-11-23','Male','B-','7000000120'),(23,'Geetha Krishnan',14,'2012-03-06','Male','O-','7000000121'),(24,'Vivek Sharma',13,'2013-05-16','Male','AB+','7000000122'),(25,'Swathi Reddy',90,'1935-11-22','Male','O-','7000000123'),(26,'Nandita Rao',88,'1938-08-12','Male','O+','7000000124'),(27,'Revathi S',21,'2004-11-24','Male','B+','7000000125'),(28,'Lakshmi Devi',2,'2023-12-13','Male','O-','7000000126'),(29,'Gopal Krishnan',25,'2001-03-20','Female','O-','7000000127'),(30,'Deepika Sharma',80,'1946-08-21','Female','B-','7000000128'),(31,'Akshaya Raj',81,'1945-03-04','Female','O+','7000000129'),(32,'Manish Gupta',79,'1947-08-09','Female','O+','7000000130'),(33,'Ravi Teja',21,'2005-01-26','Female','AB+','7000000131'),(34,'Tanvi Sharma',46,'1980-07-14','Male','B+','7000000132'),(35,'Aishwarya Raj',32,'1994-01-28','Female','AB+','7000000133'),(36,'Karthik Mohan',30,'1996-11-06','Female','A+','7000000134'),(37,'Vaishnavi Raj',72,'1954-06-29','Male','O+','7000000135'),(38,'Prakash Babu',70,'1956-04-28','Female','A+','7000000136'),(39,'Dinesh Babu',1,'2025-09-23','Female','O-','7000000137'),(40,'Harini Iyer',69,'1957-07-09','Female','AB-','7000000138'),(41,'Pradeep Kumar',74,'1952-07-05','Male','O+','7000000139'),(42,'Rakesh Kumar',73,'1953-06-09','Female','A+','7000000140'),(43,'Ananya Sharma',21,'2005-04-20','Male','A-','7000000141'),(44,'Suresh Nair',86,'1940-07-13','Male','B+','7000000142'),(45,'Meenakshi Iyer',38,'1988-06-11','Male','AB+','7000000143'),(46,'Vishal Nair',44,'1982-08-01','Male','A+','7000000144'),(47,'Vignesh Babu',69,'1957-05-06','Female','B-','7000000145'),(48,'Maya Thomas',29,'1997-05-02','Female','B-','7000000146'),(49,'Nandhini S',87,'1939-01-27','Female','A-','7000000147'),(50,'Shreya Menon',89,'1937-10-20','Male','O-','7000000148'),(51,'Vijay Prakash',12,'2014-02-17','Female','O-','7000000149'),(52,'Mohammed Imran',39,'1987-05-07','Male','A+','7000000150'),(53,'Suresh Reddy',28,'1998-03-08','Female','O+','7000000151'),(54,'Sowmya Iyer',40,'1986-04-22','Female','O-','7000000152'),(55,'Ishita Mehta',72,'1954-09-05','Male','AB+','7000000153'),(56,'Manoj Nair',82,'1943-12-30','Male','A+','7000000154'),(57,'Suraj Patel',59,'1967-03-20','Female','A+','7000000155'),(58,'Harish Reddy',55,'1971-01-24','Male','O-','7000000156'),(59,'Kavitha Raj',59,'1967-06-22','Male','AB+','7000000157'),(60,'Roshni Mathew',42,'1983-11-13','Female','B+','7000000158'),(61,'Sanjana Menon',40,'1985-12-07','Female','A+','7000000159'),(62,'Mithun Nair',9,'2017-09-25','Male','A+','7000000160'),(63,'Surya Kumar',41,'1984-12-04','Male','O+','7000000161'),(64,'Priyanka Das',67,'1959-05-08','Female','AB+','7000000162'),(65,'Sathish Kumar',51,'1975-08-15','Female','A+','7000000163'),(66,'Ritika Shah',15,'2010-11-30','Male','A-','7000000164'),(67,'Meera Iyer',36,'1990-05-08','Male','O+','7000000165'),(68,'Nithya Menon',23,'2002-12-22','Male','B+','7000000166'),(69,'Kiran Raj',48,'1978-06-13','Male','A-','7000000167'),(70,'Gautam Rao',78,'1948-01-20','Female','O-','7000000168'),(71,'Rohan Das',45,'1981-06-12','Female','A-','7000000169'),(72,'Naveen Raj',36,'1990-10-24','Female','O-','7000000170'),(73,'Rohit Das',6,'2020-10-22','Male','A+','7000000171'),(74,'Janani Krishnan',11,'2015-08-18','Male','B-','7000000172'),(75,'Aditi Rao',55,'1971-02-05','Male','AB-','7000000173'),(76,'Kavya Menon',79,'1947-03-31','Female','AB+','7000000174'),(77,'Pooja Nair',79,'1947-06-11','Female','O+','7000000175'),(78,'Bharath Reddy',65,'1961-07-14','Male','A-','7000000176'),(79,'Sindhuja R',16,'2010-05-14','Male','AB+','7000000177'),(80,'Ashwin Kumar',42,'1984-05-15','Male','AB+','7000000178'),(81,'Nisha Sharma',85,'1941-04-16','Male','B+','7000000179'),(82,'Monisha Raj',1,'2025-08-26','Female','AB+','7000000180'),(83,'Neha Jain',12,'2014-06-13','Female','B+','7000000181'),(84,'Abhishek Kumar',49,'1977-08-23','Female','O-','7000000182'),(85,'Aarav Mehta',38,'1988-08-26','Male','A+','7000000183'),(86,'Rahul Reddy',48,'1978-01-26','Male','B-','7000000184'),(87,'Pavithra Raj',73,'1953-06-22','Female','A-','7000000185'),(88,'Pranav Kumar',50,'1975-11-29','Female','B-','7000000186'),(89,'Shalini Menon',62,'1964-10-08','Female','AB+','7000000187'),(90,'Arjun Menon',80,'1946-07-27','Female','AB-','7000000188'),(91,'Sanjay Patel',63,'1963-10-04','Male','B+','7000000189'),(92,'Sneha Iyer',31,'1994-12-15','Female','O-','7000000190'),(93,'Vidhya Raj',53,'1972-12-02','Female','B-','7000000191'),(94,'Srilakshmi S',82,'1944-09-07','Male','AB-','7000000192'),(95,'Gayathri Iyer',80,'1946-09-28','Female','A+','7000000193'),(96,'Nikhil Sharma',68,'1958-01-26','Male','O-','7000000194'),(97,'Keerthana Raj',40,'1986-07-21','Female','AB+','7000000195'),(98,'Akash Verma',17,'2008-11-12','Female','AB-','7000000196'),(99,'Mohan Kumar',2,'2024-01-05','Female','AB+','7000000197');
/*!40000 ALTER TABLE `recipients_general` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipients_medical`
--

DROP TABLE IF EXISTS `recipients_medical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipients_medical` (
  `Recipient_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Rec_Condition` enum('Critical','Normal') NOT NULL,
  `Urgency` enum('High','Medium','Low') NOT NULL,
  `Units_Reqd` int(11) NOT NULL,
  PRIMARY KEY (`Recipient_ID`),
  CONSTRAINT `recipients_medical_ibfk_1` FOREIGN KEY (`Recipient_ID`) REFERENCES `recipients_general` (`Recipient_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipients_medical`
--

LOCK TABLES `recipients_medical` WRITE;
/*!40000 ALTER TABLE `recipients_medical` DISABLE KEYS */;
INSERT INTO `recipients_medical` VALUES (1,'Critical','Low',2),(2,'Critical','Medium',2),(3,'Critical','Medium',5),(4,'Normal','High',2),(5,'Critical','High',5),(6,'Normal','Medium',1),(7,'Normal','Low',5),(8,'Critical','Low',3),(9,'Normal','Low',2),(10,'Critical','High',4),(11,'Critical','High',5),(12,'Critical','Low',4),(13,'Normal','Low',2),(14,'Critical','Low',3),(15,'Critical','Low',3),(16,'Critical','High',2),(17,'Normal','Low',1),(18,'Critical','Low',2),(19,'Normal','Medium',3),(20,'Normal','High',4),(21,'Critical','High',1),(22,'Normal','Medium',3),(23,'Critical','Low',3),(24,'Normal','High',5),(25,'Critical','Low',4),(26,'Critical','High',5),(27,'Critical','Medium',5),(28,'Normal','Medium',2),(29,'Normal','Low',4),(30,'Normal','Low',4),(31,'Normal','Low',5),(32,'Critical','High',3),(33,'Critical','High',5),(34,'Critical','High',1),(35,'Normal','Low',5),(36,'Critical','Low',5),(37,'Normal','Low',5),(38,'Normal','High',1),(39,'Normal','Low',4),(40,'Normal','Medium',4),(41,'Normal','High',4),(42,'Normal','Medium',4),(43,'Critical','High',1),(44,'Normal','High',2),(45,'Normal','Medium',1),(46,'Critical','High',4),(47,'Critical','High',2),(48,'Critical','Low',2),(49,'Normal','Medium',3),(50,'Normal','Medium',3),(51,'Critical','High',3),(52,'Critical','Low',2),(53,'Critical','Low',4),(54,'Critical','Low',2),(55,'Normal','Low',2),(56,'Normal','Low',5),(57,'Normal','High',3),(58,'Normal','Low',2),(59,'Normal','High',1),(60,'Normal','Low',3),(61,'Normal','Medium',4),(62,'Normal','Medium',3),(63,'Normal','High',1),(64,'Critical','High',3),(65,'Normal','Low',3),(66,'Normal','Medium',5),(67,'Normal','Medium',5),(68,'Critical','Low',3),(69,'Normal','Low',1),(70,'Normal','Medium',2),(71,'Normal','Low',4),(72,'Normal','High',1),(73,'Normal','Medium',4),(74,'Normal','Low',3),(75,'Critical','High',4),(76,'Normal','Medium',3),(77,'Critical','High',1),(78,'Critical','High',1),(79,'Critical','High',3),(80,'Normal','High',2),(81,'Normal','Medium',1),(82,'Critical','Medium',3),(83,'Normal','Low',4),(84,'Critical','Medium',1),(85,'Critical','Low',1),(86,'Critical','High',5),(87,'Critical','High',2),(88,'Normal','Medium',1),(89,'Normal','Medium',5),(90,'Normal','Medium',2),(91,'Normal','Medium',1),(92,'Critical','High',2),(93,'Normal','Medium',5),(94,'Normal','High',4),(95,'Normal','Low',3),(96,'Normal','Medium',1),(97,'Normal','Low',5),(98,'Normal','High',5),(99,'Critical','High',3);
/*!40000 ALTER TABLE `recipients_medical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'harrisontrust'
--

--
-- Dumping routines for database 'harrisontrust'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-08 11:18:44
