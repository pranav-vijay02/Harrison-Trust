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
  `Password` varchar(100) NOT NULL,
  PRIMARY KEY (`Admin_ID`),
  UNIQUE KEY `Username` (`Username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'admin','Harrison@2026'),(2,'manager','Manager@2026'),(3,'staff','Staff@2026');
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
INSERT INTO `donors_general` VALUES (1,'Aaradhya Singh',50,'1976-03-26','Female','A+','7000000000','Mumbai'),(2,'Rahul Verma',58,'1968-10-30','Male','O+','7000000001','Hyderabad'),(3,'Karthik Rajan',32,'1994-03-17','Male','O+','7000000002','Delhi'),(4,'Vikram Singh',20,'2006-10-20','Male','O+','7000000003','Hyderabad'),(5,'Vivek Anand',26,'2000-04-17','Male','AB-','7000000004','Delhi'),(6,'Divya Krishnan',64,'1961-11-27','Female','AB+','7000000005','Hyderabad'),(7,'Suresh Krishnan',58,'1967-12-09','Male','A+','7000000006','Delhi'),(8,'Rajkumar Shukla',58,'1967-12-01','Male','A+','7000000007','Mumbai'),(9,'Shalini Gupta',44,'1982-08-16','Female','A+','7000000008','Ahmedabad'),(10,'Rohit Nair',51,'1975-05-10','Male','B-','7000000009','Chennai'),(11,'Sanjay Gupta',35,'1991-02-23','Male','A+','7000000010','Bengaluru'),(12,'Manoj Das',30,'1995-12-19','Male','B+','7000000011','Delhi'),(13,'Nisha Menon',62,'1964-03-26','Female','B-','7000000012','Bengaluru'),(14,'Madhan Kumar',51,'1975-05-08','Male','O+','7000000013','Delhi'),(15,'Narain Raj',34,'1991-12-15','Male','AB-','7000000014','Hyderabad'),(16,'Gokul Nathan',36,'1990-09-24','Male','A-','7000000015','Mumbai'),(17,'Aishwarya Menon',56,'1970-09-29','Female','AB-','7000000016','Bengaluru'),(18,'Mithun Raj',37,'1989-10-21','Male','B-','7000000017','Hyderabad'),(19,'Srilakshmi P',36,'1990-03-20','Female','B+','7000000018','Bengaluru'),(20,'Keerthana S',39,'1987-10-20','Female','A-','7000000019','Ahmedabad'),(21,'Prakash Menon',51,'1975-10-25','Male','AB+','7000000020','Ahmedabad'),(22,'Bharath Kumar',46,'1980-09-21','Male','A-','7000000021','Chennai'),(23,'Pranav Shah',64,'1962-08-28','Male','O-','7000000022','Chennai'),(24,'Akash Deep',65,'1961-08-09','Male','B+','7000000023','Ahmedabad'),(25,'Balaji R',64,'1961-11-16','Male','A+','7000000024','Chennai'),(26,'Rahul Das',54,'1972-03-15','Male','AB-','7000000025','Chennai'),(27,'Malavika Nair',41,'1985-06-01','Female','O+','7000000026','Delhi'),(28,'Pallavi Shah',64,'1962-09-09','Female','O+','7000000027','Hyderabad'),(29,'Abirami K',42,'1984-06-01','Female','B-','7000000028','Bengaluru'),(30,'Nitin Raj',25,'2001-03-16','Male','AB-','7000000029','Ahmedabad'),(31,'Sowmya Ravi',33,'1993-04-28','Female','B+','7000000030','Hyderabad'),(32,'Sneha Raj',31,'1994-11-26','Female','AB+','7000000031','Chennai'),(33,'Mohan Lal',33,'1993-10-02','Male','O+','7000000032','Chennai'),(34,'Ajay Kumar',21,'2005-01-28','Male','B-','7000000033','Mumbai'),(35,'Gayathri S',52,'1974-04-20','Female','AB-','7000000034','Chennai'),(36,'Vaishnavi R',56,'1970-05-15','Female','O-','7000000035','Hyderabad'),(37,'Anand Krishnan',58,'1968-11-04','Male','O-','7000000036','Chennai'),(38,'Surya Prakash',30,'1995-12-10','Male','O+','7000000037','Hyderabad'),(39,'Manish Rao',26,'2000-11-02','Male','O+','7000000038','Delhi'),(40,'Varun Chakraborty',59,'1967-10-23','Male','A+','7000000039','Ahmedabad'),(41,'Arjun Rao',19,'2007-09-26','Male','O-','7000000040','Delhi'),(42,'Simran Kaur',36,'1990-03-28','Female','A-','7000000041','Chennai'),(43,'Ritika Sinha',41,'1985-06-16','Female','O-','7000000042','Chennai'),(44,'Pooja Agarwal',46,'1979-12-05','Female','B-','7000000043','Mumbai'),(45,'Kiran Kumar',41,'1985-05-03','Male','A-','7000000044','Hyderabad'),(46,'Akshaya S',65,'1961-07-02','Female','A-','7000000045','Ahmedabad'),(47,'Vidhya Raman',58,'1968-08-27','Female','AB-','7000000046','Chennai'),(48,'Ravi Shankar',19,'2007-09-08','Male','B-','7000000047','Ahmedabad'),(49,'Pavithra M',56,'1970-04-23','Female','B-','7000000048','Delhi'),(50,'Harini V',54,'1972-09-19','Female','A+','7000000049','Bengaluru'),(51,'Abhishek Jain',31,'1995-10-05','Male','A-','7000000050','Mumbai'),(52,'Karthik Subramanian',27,'1999-04-30','Male','O+','7000000051','Ahmedabad'),(53,'Sanjana Rao',40,'1986-01-21','Female','AB-','7000000052','Chennai'),(54,'Maya Thomas',31,'1995-05-17','Female','AB-','7000000053','Mumbai'),(55,'Dinesh Kumar',51,'1975-02-09','Male','AB-','7000000054','Ahmedabad'),(56,'Neha Malhotra',32,'1993-12-09','Female','AB+','7000000055','Hyderabad'),(57,'Tanvi Joshi',44,'1981-11-18','Female','O-','7000000056','Delhi'),(58,'Ashwin Raj',48,'1978-09-15','Male','A+','7000000057','Ahmedabad'),(59,'Ananya Iyer',34,'1992-04-01','Female','B-','7000000058','Hyderabad'),(60,'Tarun Mehta',58,'1968-01-24','Male','A-','7000000059','Delhi'),(61,'Ramesh Babu',56,'1969-12-01','Male','B-','7000000060','Chennai'),(62,'Deepa Mohan',43,'1983-11-11','Female','AB+','7000000061','Mumbai'),(63,'Ishita Roy',46,'1980-07-24','Female','O-','7000000062','Mumbai'),(64,'Revathi Kumar',61,'1965-03-26','Female','B-','7000000063','Hyderabad'),(65,'Swathi Lakshmi',39,'1987-11-01','Female','A-','7000000064','Ahmedabad'),(66,'Divya Menon',39,'1987-10-16','Female','AB-','7000000065','Chennai'),(67,'Sindhuja R',22,'2004-04-10','Female','O+','7000000066','Ahmedabad'),(68,'Rohan Mehta',32,'1994-03-06','Male','A-','7000000067','Bengaluru'),(69,'Rakesh Kumar',53,'1973-09-11','Male','A-','7000000068','Chennai'),(70,'Lakshmi Narayanan',44,'1982-10-15','Female','B-','7000000069','Bengaluru'),(71,'Gautam Shah',24,'2002-05-07','Male','O-','7000000070','Chennai'),(72,'Siddharth Bose',40,'1986-05-06','Male','O+','7000000071','Mumbai'),(73,'Praveen Raj',39,'1987-03-13','Male','A-','7000000072','Ahmedabad'),(74,'Roshni Mathew',36,'1989-12-01','Female','O-','7000000073','Hyderabad'),(75,'Sameera Karthi',41,'1985-03-26','Female','B-','7000000074','Chennai'),(76,'Aparna Krishnan',25,'2001-06-01','Female','AB-','7000000075','Mumbai'),(77,'Suraj Nair',64,'1962-08-26','Male','B-','7000000076','Ahmedabad'),(78,'Nivetha R',31,'1995-09-02','Female','B+','7000000077','Chennai'),(79,'Aditi Mishra',53,'1973-03-14','Female','O+','7000000078','Bengaluru'),(80,'Raghav Sharma',27,'1999-09-29','Male','B-','7000000079','Hyderabad'),(81,'Harish Kumar',20,'2006-01-24','Male','A-','7000000080','Delhi'),(82,'Naveen Kumar',23,'2002-12-30','Male','AB-','7000000081','Hyderabad'),(83,'Sathish B',42,'1984-02-22','Male','A+','7000000082','Delhi'),(84,'Arun Kumar',31,'1994-12-06','Male','A+','7000000083','Bengaluru'),(85,'Kavya Srinivasan',27,'1999-05-20','Female','O-','7000000084','Bengaluru'),(86,'Sanjana S',30,'1996-04-25','Female','B+','7000000085','Delhi'),(87,'Monisha R',60,'1966-07-25','Female','B+','7000000086','Mumbai'),(88,'Nikhil Varma',34,'1992-06-21','Male','AB-','7000000087','Ahmedabad'),(89,'Anjali Pillai',20,'2006-08-24','Female','A-','7000000088','Chennai'),(90,'Nandhini Devi',49,'1977-01-30','Female','A+','7000000089','Hyderabad'),(91,'Vishal Patel',65,'1960-11-13','Male','O-','7000000090','Bengaluru'),(92,'Priya Sharma',50,'1976-05-13','Female','B+','7000000091','Bengaluru'),(93,'Riya Das',63,'1963-05-06','Female','O-','7000000092','Ahmedabad'),(94,'Pranav Vijay',45,'1981-06-05','Male','O+','7000000093','Hyderabad'),(95,'Nithya Raman',23,'2003-02-20','Female','A+','7000000094','Delhi'),(96,'Janani Balaji',40,'1986-10-29','Female','A+','7000000095','Bengaluru'),(97,'Vignesh K',48,'1978-02-28','Male','O+','7000000096','Bengaluru'),(98,'Deepak Verma',57,'1969-04-08','Male','O+','7000000097','Delhi'),(99,'Shreya Kapoor',20,'2006-08-22','Female','B+','7000000098','Bengaluru');
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
INSERT INTO `donors_medical` VALUES (1,'14.1','68.5',114,72,'2025-08-31'),(2,'14.4','61.3',113,72,'2025-07-31'),(3,'14.4','50.5',123,72,'2025-09-14'),(4,'15.1','73.2',129,72,'2025-09-22'),(5,'15.9','53.3',128,85,'2025-11-03'),(6,'14.1','62.1',111,74,'2025-07-30'),(7,'14.4','69.2',114,71,'2026-04-21'),(8,'15.6','53.8',125,77,'2025-12-24'),(9,'13.8','64.8',129,84,'2025-09-04'),(10,'14.9','61.8',129,76,'2025-08-30'),(11,'15.8','52.2',121,82,'2025-12-07'),(12,'13.0','78.6',126,82,'2025-09-07'),(13,'16.0','79.5',115,73,'2025-07-26'),(14,'14.6','73.4',125,75,'2026-01-02'),(15,'13.4','76.6',111,84,'2025-08-24'),(16,'13.4','78.2',114,73,'2025-10-19'),(17,'13.6','60.5',117,72,'2026-04-28'),(18,'13.1','71.3',130,71,'2026-06-11'),(19,'14.2','55.7',120,77,'2025-09-21'),(20,'15.5','58.6',119,71,'2025-08-18'),(21,'14.7','73.4',123,74,'2025-11-12'),(22,'15.5','82.0',125,73,'2026-06-04'),(23,'14.4','74.0',117,80,'2026-05-06'),(24,'14.5','60.9',113,73,'2025-08-03'),(25,'13.7','58.1',125,74,'2025-10-23'),(26,'13.4','57.1',119,78,'2026-05-21'),(27,'15.3','53.0',116,79,'2025-07-24'),(28,'14.3','52.3',124,74,'2026-06-03'),(29,'13.6','73.9',123,74,'2026-03-11'),(30,'14.7','79.5',114,83,'2025-09-20'),(31,'14.7','51.6',130,79,'2026-02-13'),(32,'15.2','82.5',129,84,'2026-04-19'),(33,'15.5','53.1',110,83,'2026-02-23'),(34,'13.5','57.1',113,77,'2025-08-30'),(35,'14.4','59.2',130,84,'2026-02-13'),(36,'13.3','59.2',115,78,'2025-10-30'),(37,'15.3','83.4',114,76,'2025-08-13'),(38,'15.7','66.4',128,74,'2026-02-03'),(39,'15.0','74.3',130,71,'2026-03-23'),(40,'15.1','50.7',128,70,'2026-05-06'),(41,'14.3','63.4',128,75,'2025-07-23'),(42,'15.8','67.2',115,81,'2025-10-09'),(43,'15.4','64.2',110,74,'2025-08-26'),(44,'13.0','70.5',115,82,'2025-09-27'),(45,'15.3','69.9',125,73,'2026-03-20'),(46,'15.5','77.4',120,78,'2025-12-06'),(47,'13.7','83.3',115,70,'2026-06-04'),(48,'14.0','57.0',128,79,'2026-02-05'),(49,'15.0','62.1',118,72,'2026-06-03'),(50,'14.8','66.6',111,70,'2025-09-23'),(51,'15.1','84.3',129,70,'2025-09-18'),(52,'13.3','69.7',129,81,'2025-09-21'),(53,'16.0','84.4',124,84,'2025-07-04'),(54,'14.4','75.2',112,74,'2025-12-25'),(55,'16.0','68.0',129,83,'2025-12-25'),(56,'14.3','64.2',128,81,'2026-03-14'),(57,'15.9','78.2',115,83,'2026-01-30'),(58,'15.4','74.4',127,70,'2025-12-06'),(59,'13.1','74.3',110,73,'2026-06-14'),(60,'15.4','84.5',121,76,'2026-04-18'),(61,'14.7','52.2',111,77,'2026-04-08'),(62,'14.7','64.9',114,71,'2026-06-03'),(63,'13.4','70.3',118,79,'2026-05-05'),(64,'15.8','56.1',129,72,'2026-04-24'),(65,'15.6','58.6',128,70,'2025-09-05'),(66,'14.0','65.7',123,79,'2025-07-02'),(67,'14.2','69.9',117,70,'2025-06-30'),(68,'13.8','55.6',126,81,'2025-09-14'),(69,'13.8','53.3',120,71,'2025-11-16'),(70,'14.8','64.7',110,71,'2026-05-19'),(71,'15.0','82.8',120,80,'2025-08-15'),(72,'13.3','57.2',127,85,'2025-07-07'),(73,'13.6','82.2',126,82,'2025-09-09'),(74,'13.5','54.3',114,76,'2025-09-22'),(75,'15.9','56.5',121,75,'2026-05-11'),(76,'13.1','73.0',116,83,'2025-12-03'),(77,'13.7','58.1',112,74,'2025-08-04'),(78,'13.4','63.4',124,75,'2025-08-27'),(79,'15.2','58.5',120,71,'2026-05-23'),(80,'13.9','56.4',115,77,'2025-06-30'),(81,'15.3','80.2',120,77,'2025-07-12'),(82,'15.8','80.6',114,73,'2026-05-03'),(83,'13.7','65.7',126,82,'2026-02-08'),(84,'14.9','82.8',116,72,'2025-07-29'),(85,'15.7','82.6',122,74,'2026-04-29'),(86,'15.0','79.3',118,84,'2025-06-30'),(87,'14.2','84.8',113,78,'2026-01-07'),(88,'13.6','65.9',124,72,'2026-01-30'),(89,'15.7','79.5',127,85,'2026-01-27'),(90,'13.2','57.0',116,78,'2026-05-06'),(91,'13.3','61.6',113,77,'2025-09-11'),(92,'14.5','56.8',110,74,'2025-12-02'),(93,'13.8','83.1',121,74,'2026-04-11'),(94,'16.0','84.0',125,82,'2026-02-20'),(95,'15.5','72.2',129,72,'2025-09-19'),(96,'15.6','83.0',124,84,'2025-10-20'),(97,'15.9','66.2',113,81,'2026-04-17'),(98,'13.6','66.4',124,73,'2026-05-11'),(99,'15.0','52.4',129,79,'2026-02-20');
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
INSERT INTO `recipients_general` VALUES (1,'Sneha Iyer',27,'1999-07-22','Female','AB-','7000000099'),(2,'Anand Kumar',4,'2021-11-15','Male','B+','7000000100'),(3,'Shalini Menon',82,'1943-11-28','Female','B-','7000000101'),(4,'Harish Reddy',26,'2000-02-09','Male','AB+','7000000102'),(5,'Gopal Krishnan',32,'1994-07-05','Male','AB-','7000000103'),(6,'Ishita Mehta',69,'1957-09-23','Female','O-','7000000104'),(7,'Dinesh Babu',50,'1976-07-07','Male','AB+','7000000105'),(8,'Vijay Prakash',66,'1960-10-20','Male','AB-','7000000106'),(9,'Prakash Babu',57,'1969-08-06','Male','O+','7000000107'),(10,'Surya Kumar',36,'1990-06-07','Male','AB-','7000000108'),(11,'Revathi S',11,'2015-08-14','Female','B-','7000000109'),(12,'Meera Iyer',37,'1989-03-02','Female','O+','7000000110'),(13,'Raghav Gupta',26,'2000-05-10','Male','O-','7000000111'),(14,'Janani Krishnan',42,'1984-09-25','Female','O-','7000000112'),(15,'Mohan Kumar',23,'2003-05-05','Male','O+','7000000113'),(16,'Sanjay Patel',7,'2019-08-22','Male','O+','7000000114'),(17,'Tanvi Sharma',22,'2004-02-10','Female','AB-','7000000115'),(18,'Akash Verma',86,'1939-12-22','Male','A+','7000000116'),(19,'Tarun Kumar',69,'1957-05-16','Male','B-','7000000117'),(20,'Kavya Menon',79,'1946-12-16','Female','B+','7000000118'),(21,'Gayathri Iyer',45,'1981-03-07','Female','B+','7000000119'),(22,'Nithya Menon',86,'1940-07-18','Female','O-','7000000120'),(23,'Ritika Shah',2,'2024-07-28','Female','O-','7000000121'),(24,'Pooja Shah',23,'2003-04-04','Female','B+','7000000122'),(25,'Bharath Reddy',63,'1963-08-03','Male','AB+','7000000123'),(26,'Monisha Raj',58,'1967-12-09','Female','O+','7000000124'),(27,'Manoj Nair',20,'2006-07-01','Male','B+','7000000125'),(28,'Priyanka Das',37,'1989-05-16','Female','AB+','7000000126'),(29,'Vidhya Raj',84,'1942-08-06','Female','B+','7000000127'),(30,'Arjun Menon',15,'2011-08-09','Male','O+','7000000128'),(31,'Rohit Das',59,'1967-10-21','Male','A-','7000000129'),(32,'Malavika S',83,'1942-12-31','Female','A-','7000000130'),(33,'Sathish Kumar',15,'2011-02-13','Male','B+','7000000131'),(34,'Anjali Rao',21,'2005-03-20','Female','O+','7000000132'),(35,'Ravi Shankar',58,'1968-07-17','Male','B+','7000000133'),(36,'Pradeep Kumar',64,'1962-02-06','Male','AB-','7000000134'),(37,'Vignesh Babu',21,'2005-04-26','Male','A-','7000000135'),(38,'Pranav Kumar',85,'1941-06-20','Male','A-','7000000136'),(39,'Nikhil Sharma',89,'1937-07-24','Male','AB-','7000000137'),(40,'Swathi Reddy',58,'1968-10-19','Female','AB+','7000000138'),(41,'Neha Jain',25,'2001-10-14','Female','O-','7000000139'),(42,'Rohan Das',10,'2016-02-12','Male','A-','7000000140'),(43,'Ajith Kumar',10,'2016-09-07','Male','AB-','7000000141'),(44,'Deepika Sharma',38,'1988-03-30','Female','AB+','7000000142'),(45,'Maya Thomas',90,'1936-01-12','Female','B+','7000000143'),(46,'Meenakshi Iyer',33,'1993-02-07','Female','O+','7000000144'),(47,'Karthik Mohan',19,'2007-03-29','Male','A+','7000000145'),(48,'Mohammed Imran',23,'2003-06-07','Male','A-','7000000146'),(49,'Ashwin Kumar',75,'1951-08-24','Male','AB-','7000000147'),(50,'Harini Iyer',65,'1960-12-20','Female','A+','7000000148'),(51,'Ananya Sharma',78,'1948-06-10','Female','AB-','7000000149'),(52,'Sowmya Iyer',43,'1983-09-27','Female','AB+','7000000150'),(53,'Madhan Kumar',60,'1965-12-05','Male','AB-','7000000151'),(54,'Shreya Menon',59,'1967-02-25','Female','B-','7000000152'),(55,'Siddharth Rao',35,'1991-02-04','Male','A-','7000000153'),(56,'Suraj Patel',53,'1972-12-24','Male','A-','7000000154'),(57,'Aishwarya Raj',53,'1973-07-10','Female','O-','7000000155'),(58,'Pallavi Nair',74,'1952-04-29','Female','B-','7000000156'),(59,'Nisha Sharma',7,'2018-11-25','Female','O-','7000000157'),(60,'Ramesh Kumar',87,'1939-05-10','Male','B-','7000000158'),(61,'Kiran Raj',45,'1981-02-02','Male','AB+','7000000159'),(62,'Geetha Krishnan',72,'1954-02-26','Female','A+','7000000160'),(63,'Manish Gupta',27,'1999-01-29','Male','B+','7000000161'),(64,'Abhishek Kumar',7,'2019-08-11','Male','A+','7000000162'),(65,'Aditi Rao',64,'1962-06-29','Female','O+','7000000163'),(66,'Sathya Narayanan',39,'1987-01-19','Female','B+','7000000164'),(67,'Suresh Nair',1,'2025-06-30','Male','A-','7000000165'),(68,'Keerthana Raj',34,'1991-12-02','Female','O-','7000000166'),(69,'Rakesh Kumar',49,'1977-01-09','Male','B-','7000000167'),(70,'Vivek Sharma',3,'2023-01-27','Male','B-','7000000168'),(71,'Pooja Nair',72,'1953-11-27','Female','AB+','7000000169'),(72,'Rahul Reddy',9,'2016-12-08','Male','O+','7000000170'),(73,'Sindhuja R',29,'1997-05-08','Female','B+','7000000171'),(74,'Nivetha Iyer',25,'2001-05-11','Female','AB-','7000000172'),(75,'Aparna Menon',10,'2016-04-21','Female','AB-','7000000173'),(76,'Simran Kaur',8,'2017-11-25','Female','A+','7000000174'),(77,'Kavitha Raj',84,'1942-06-30','Female','B-','7000000175'),(78,'Lakshmi Devi',47,'1979-10-03','Female','A+','7000000176'),(79,'Gokul Raj',4,'2022-09-02','Male','O+','7000000177'),(80,'Ravi Teja',4,'2022-10-13','Male','B+','7000000178'),(81,'Srilakshmi S',86,'1940-06-04','Female','A+','7000000179'),(82,'Praveen Nair',28,'1998-10-19','Male','AB+','7000000180'),(83,'Suresh Reddy',30,'1996-03-14','Male','A-','7000000181'),(84,'Pavithra Raj',62,'1964-06-03','Female','AB-','7000000182'),(85,'Naveen Raj',83,'1943-05-30','Male','O+','7000000183'),(86,'Varun Nair',13,'2012-11-15','Male','AB+','7000000184'),(87,'Mithun Nair',72,'1954-07-28','Male','O-','7000000185'),(88,'Akshaya Raj',51,'1975-06-18','Female','O-','7000000186'),(89,'Roshni Mathew',15,'2011-02-06','Female','O+','7000000187'),(90,'Sanjana Menon',83,'1943-04-24','Female','O-','7000000188'),(91,'Aditya Nair',29,'1997-03-17','Male','O+','7000000189'),(92,'Vishal Nair',19,'2007-06-29','Male','A+','7000000190'),(93,'Divya Lakshmi',31,'1995-08-04','Female','AB-','7000000191'),(94,'Aarav Mehta',41,'1985-01-13','Male','B+','7000000192'),(95,'Arun Babu',76,'1950-09-23','Male','O+','7000000193'),(96,'Nandita Rao',2,'2023-11-30','Female','AB+','7000000194'),(97,'Gautam Rao',30,'1996-07-26','Male','AB-','7000000195'),(98,'Nandhini S',12,'2014-04-08','Female','AB+','7000000196'),(99,'Vaishnavi Raj',86,'1940-08-14','Female','B+','7000000197');
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
INSERT INTO `recipients_medical` VALUES (1,'Critical','Medium',4),(2,'Critical','Low',3),(3,'Normal','High',1),(4,'Normal','Low',4),(5,'Normal','High',2),(6,'Critical','Medium',5),(7,'Critical','Medium',3),(8,'Normal','Medium',5),(9,'Normal','Low',3),(10,'Normal','High',1),(11,'Normal','Low',3),(12,'Normal','Low',4),(13,'Critical','Medium',2),(14,'Critical','Low',2),(15,'Normal','High',5),(16,'Critical','Medium',5),(17,'Normal','Low',3),(18,'Critical','Low',4),(19,'Normal','Low',1),(20,'Critical','Medium',1),(21,'Critical','High',3),(22,'Critical','Medium',3),(23,'Normal','Low',2),(24,'Critical','Low',3),(25,'Normal','Medium',2),(26,'Critical','Low',3),(27,'Critical','High',2),(28,'Normal','Medium',1),(29,'Critical','High',3),(30,'Critical','Medium',3),(31,'Critical','High',2),(32,'Critical','High',5),(33,'Critical','High',1),(34,'Critical','High',1),(35,'Normal','Medium',1),(36,'Critical','Medium',1),(37,'Normal','Medium',4),(38,'Normal','Low',1),(39,'Normal','High',3),(40,'Normal','High',3),(41,'Critical','Low',5),(42,'Critical','Medium',3),(43,'Normal','High',2),(44,'Normal','Medium',5),(45,'Critical','Low',4),(46,'Normal','Medium',2),(47,'Critical','High',4),(48,'Critical','High',5),(49,'Critical','Low',3),(50,'Normal','High',3),(51,'Critical','High',3),(52,'Critical','High',1),(53,'Critical','High',3),(54,'Critical','Medium',3),(55,'Critical','Low',4),(56,'Critical','High',5),(57,'Normal','Low',2),(58,'Normal','High',2),(59,'Critical','Low',5),(60,'Critical','Medium',5),(61,'Normal','High',1),(62,'Critical','Medium',2),(63,'Critical','High',4),(64,'Normal','High',2),(65,'Normal','Low',2),(66,'Normal','Medium',1),(67,'Critical','Medium',1),(68,'Normal','Low',4),(69,'Critical','Medium',2),(70,'Critical','High',2),(71,'Normal','High',2),(72,'Normal','High',3),(73,'Normal','High',3),(74,'Normal','High',5),(75,'Normal','High',3),(76,'Normal','High',4),(77,'Critical','Low',2),(78,'Normal','Medium',4),(79,'Critical','Medium',3),(80,'Critical','Low',3),(81,'Critical','Medium',3),(82,'Normal','High',1),(83,'Normal','High',1),(84,'Critical','High',1),(85,'Normal','Low',1),(86,'Normal','Medium',5),(87,'Critical','Medium',3),(88,'Normal','Medium',1),(89,'Normal','High',4),(90,'Critical','High',3),(91,'Normal','Medium',4),(92,'Normal','Medium',4),(93,'Critical','Medium',4),(94,'Critical','Low',2),(95,'Normal','Medium',1),(96,'Critical','Low',2),(97,'Critical','Medium',3),(98,'Critical','Medium',3),(99,'Critical','High',3);
/*!40000 ALTER TABLE `recipients_medical` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-11 18:46:52
