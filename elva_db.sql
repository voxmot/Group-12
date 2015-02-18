-- MySQL dump 10.13  Distrib 5.6.12, for debian6.0 (x86_64)
--
-- Host: localhost    Database: elva_db
-- ------------------------------------------------------
-- Server version	5.6.12

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
-- Table structure for table `CUSTOMER`
--

DROP TABLE IF EXISTS `CUSTOMER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CUSTOMER` (
  `CUS_CODE` int(11) NOT NULL,
  `CUS_LNAME` varchar(15) NOT NULL,
  `CUS_FNAME` varchar(15) NOT NULL,
  `CUS_INITIAL` char(1) DEFAULT NULL,
  `CUS_AREACODE` char(3) NOT NULL DEFAULT '615',
  `CUS_PHONE` char(8) NOT NULL,
  `CUS_BALANCE` decimal(9,2) DEFAULT '0.00',
  PRIMARY KEY (`CUS_CODE`),
  UNIQUE KEY `CUS_UI1` (`CUS_LNAME`,`CUS_FNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER`
--

LOCK TABLES `CUSTOMER` WRITE;
/*!40000 ALTER TABLE `CUSTOMER` DISABLE KEYS */;
INSERT INTO `CUSTOMER` VALUES (10010,'Ramas','Alfred','A','615','844-2573',0.00),(10011,'Dunne','Leona','K','713','894-1238',0.00),(10012,'Smith','Kathy','W','615','894-2285',345.86),(10013,'Olowski','Paul','F','615','894-2180',536.75),(10014,'Orlando','Myron',NULL,'615','222-1672',0.00),(10015,'O\'Brian','Amy','B','713','442-3381',0.00),(10016,'Brown','James','G','615','297-1228',221.19),(10017,'Williams','George',NULL,'615','290-2556',768.93),(10018,'Farriss','Anne','G','713','382-7185',216.55),(10019,'Smith','Olette','K','615','297-3809',0.00);
/*!40000 ALTER TABLE `CUSTOMER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMER2`
--

DROP TABLE IF EXISTS `CUSTOMER2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CUSTOMER2` (
  `CUS_CODE` int(11) NOT NULL,
  `CUS_LNAME` varchar(15) NOT NULL,
  `CUS_FNAME` varchar(15) NOT NULL,
  `CUS_INITIAL` char(1) DEFAULT NULL,
  `CUS_AREACODE` char(3) NOT NULL DEFAULT '615',
  `CUS_PHONE` char(8) NOT NULL,
  PRIMARY KEY (`CUS_CODE`),
  UNIQUE KEY `CUS_UI1` (`CUS_LNAME`,`CUS_FNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER2`
--

LOCK TABLES `CUSTOMER2` WRITE;
/*!40000 ALTER TABLE `CUSTOMER2` DISABLE KEYS */;
INSERT INTO `CUSTOMER2` VALUES (345,'Terrell','Justine','H','615','322-9870'),(347,'Olowski','Paul','F','615','894-2180'),(351,'Hernandez','Carlos','J','723','123-7654'),(352,'McDowell','George',NULL,'723','123-7768'),(365,'Tirpin','Amy','G','723','123-9876'),(368,'Lewis','Sherrie','J','734','322-2357'),(369,'Dunne','Leona','K','713','894-1238');
/*!40000 ALTER TABLE `CUSTOMER2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INVOICE`
--

DROP TABLE IF EXISTS `INVOICE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INVOICE` (
  `INV_NUMBER` int(11) NOT NULL,
  `CUS_CODE` int(11) NOT NULL,
  `INV_DATE` date NOT NULL,
  `INV_SUBTOTAL` decimal(9,2) DEFAULT NULL,
  `INV_TAX` decimal(9,2) DEFAULT NULL,
  `INV_TOTAL` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`INV_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INVOICE`
--

LOCK TABLES `INVOICE` WRITE;
/*!40000 ALTER TABLE `INVOICE` DISABLE KEYS */;
INSERT INTO `INVOICE` VALUES (1001,10014,'2012-01-16',24.90,1.99,26.89),(1002,10011,'2012-01-16',9.98,0.80,10.78),(1003,10012,'2012-01-16',153.85,12.31,166.16),(1004,10011,'2012-01-17',34.97,2.80,37.77),(1005,10018,'2012-01-17',70.44,5.64,76.08),(1006,10014,'2012-01-17',397.83,31.83,429.66),(1007,10015,'2012-01-17',34.97,2.80,37.77),(1008,10011,'2012-01-17',399.15,31.93,431.08);
/*!40000 ALTER TABLE `INVOICE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LINE`
--

DROP TABLE IF EXISTS `LINE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LINE` (
  `INV_NUMBER` int(11) NOT NULL,
  `LINE_NUMBER` decimal(2,0) NOT NULL,
  `P_CODE` varchar(10) NOT NULL,
  `LINE_UNITS` decimal(9,2) NOT NULL DEFAULT '0.00',
  `LINE_PRICE` decimal(9,2) NOT NULL DEFAULT '0.00',
  `LINE_TOTAL` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`INV_NUMBER`,`LINE_NUMBER`),
  UNIQUE KEY `LINE_UI1` (`INV_NUMBER`,`P_CODE`),
  KEY `P_CODE` (`P_CODE`),
  CONSTRAINT `LINE_ibfk_1` FOREIGN KEY (`INV_NUMBER`) REFERENCES `INVOICE` (`INV_NUMBER`) ON DELETE CASCADE,
  CONSTRAINT `LINE_ibfk_2` FOREIGN KEY (`P_CODE`) REFERENCES `PRODUCT` (`P_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LINE`
--

LOCK TABLES `LINE` WRITE;
/*!40000 ALTER TABLE `LINE` DISABLE KEYS */;
INSERT INTO `LINE` VALUES (1001,1,'13-Q2/P2',1.00,14.99,14.99),(1001,2,'23109-HB',1.00,9.95,9.95),(1002,1,'54778-2T',2.00,4.99,9.98),(1003,1,'2238/QPD',1.00,38.95,38.95),(1003,2,'1546-QQ2',1.00,39.95,39.95),(1003,3,'13-Q2/P2',5.00,14.99,74.95),(1004,1,'54778-2T',3.00,4.99,14.97),(1004,2,'23109-HB',2.00,9.95,19.90),(1005,1,'PVC23DRT',12.00,5.87,70.44),(1006,1,'SM-18277',3.00,6.99,20.97),(1006,2,'2232/QTY',1.00,109.92,109.92),(1006,3,'23109-HB',1.00,9.95,9.95),(1006,4,'89-WRE-Q',1.00,256.99,256.99),(1007,1,'13-Q2/P2',2.00,14.99,29.98),(1007,2,'54778-2T',1.00,4.99,4.99),(1008,1,'PVC23DRT',5.00,5.87,29.35),(1008,2,'WR3/TT3',3.00,119.95,359.85),(1008,3,'23109-HB',1.00,9.95,9.95);
/*!40000 ALTER TABLE `LINE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT`
--

DROP TABLE IF EXISTS `PRODUCT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT` (
  `P_CODE` varchar(10) NOT NULL,
  `P_DESCRIPT` varchar(35) NOT NULL,
  `P_INDATE` date NOT NULL,
  `P_QOH` int(11) NOT NULL,
  `P_MIN` int(11) NOT NULL,
  `P_PRICE` decimal(8,2) NOT NULL,
  `P_DISCOUNT` decimal(4,2) NOT NULL,
  `V_CODE` int(11) DEFAULT NULL,
  PRIMARY KEY (`P_CODE`),
  KEY `V_CODE` (`V_CODE`),
  CONSTRAINT `PRODUCT_ibfk_1` FOREIGN KEY (`V_CODE`) REFERENCES `VENDOR` (`V_CODE`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT`
--

LOCK TABLES `PRODUCT` WRITE;
/*!40000 ALTER TABLE `PRODUCT` DISABLE KEYS */;
INSERT INTO `PRODUCT` VALUES ('11QER/31','Power painter, 15 psi., 3-nozzle','2011-11-03',8,5,109.99,0.00,25595),('13-Q2/P2','7.25-in. pwr. saw blade','2011-12-23',32,15,14.99,0.05,21344),('14-Q1/L3','9.00-in. pwr. saw blade','2011-11-13',18,12,17.49,0.00,21344),('1546-QQ2','Hrd. cloth, 1/4-in., 2x50','2012-01-15',15,8,39.95,0.00,23119),('1558-QW1','Hrd. cloth, 1/2-in., 3x50','2012-01-15',23,5,43.99,0.00,23119),('2232/QTY','B&D jigsaw, 12-in. blade','2011-12-30',8,5,109.92,0.05,24288),('2232/QWE','B&D jigsaw, 8-in. blade','2011-12-24',6,5,99.87,0.05,24288),('2238/QPD','B&D cordless drill, 1/2-in.','2012-01-20',12,5,38.95,0.05,25595),('23109-HB','Claw hammer','2012-02-20',23,10,9.95,0.10,21225),('23114-AA','Sledge hammer, 12 lb.','2012-01-02',8,5,14.40,0.05,NULL),('54778-2T','Rat-tail file, 1/8-in. fine','2011-12-15',43,20,4.99,0.00,21344),('89-WRE-Q','Hicut chain saw, 16 in.','2012-02-07',11,5,256.99,0.05,24288),('PVC23DRT','PVC pipe, 3.5-in., 8-ft','2011-02-20',188,75,5.87,0.00,NULL),('SM-18277','1.25-in. metal screw, 25','2012-03-01',172,75,6.99,0.00,21225),('SW-23116','2.5-in. wd. screw, 50','2012-02-24',237,100,8.45,0.00,21231),('WR3/TT3','Steel matting, 4\'x8\'x1/6\", .5\" mesh','2012-01-17',18,5,119.95,0.10,25595);
/*!40000 ALTER TABLE `PRODUCT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VENDOR`
--

DROP TABLE IF EXISTS `VENDOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VENDOR` (
  `V_CODE` int(11) NOT NULL DEFAULT '0',
  `V_NAME` varchar(35) NOT NULL,
  `V_CONTACT` varchar(15) NOT NULL,
  `V_AREACODE` char(3) NOT NULL,
  `V_PHONE` char(8) NOT NULL,
  `V_STATE` char(2) NOT NULL,
  `V_ORDER` char(1) NOT NULL,
  PRIMARY KEY (`V_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VENDOR`
--

LOCK TABLES `VENDOR` WRITE;
/*!40000 ALTER TABLE `VENDOR` DISABLE KEYS */;
INSERT INTO `VENDOR` VALUES (21225,'Bryson, Inc.','Smithson','715','223-3234','TN','Y'),(21226,'SuperLoo, Inc.','Flushing','904','215-8995','FL','N'),(21231,'D&E Supply','Singh','715','228-3245','TN','Y'),(21344,'Gomez Bros.','Ortega','715','889-2546','KY','N'),(22567,'Dome Supply','Smith','901','678-1419','GA','N'),(23119,'Randsets Ltd.','Anderson','901','678-3998','GA','Y'),(24004,'Brackman Bros.','Browning','715','228-1410','TN','N'),(24288,'ORDVA, Inc.','Hakford','715','898-1234','TN','Y'),(25443,'B&K, Inc.','Smith','904','227-0093','FL','N'),(25501,'Damal Supplies','Smythe','715','890-3529','TN','N'),(25595,'Rubicon Systems','Orton','904','456-0092','FL','Y');
/*!40000 ALTER TABLE `VENDOR` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-17 20:42:15

