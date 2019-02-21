-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: suzhuoke
-- ------------------------------------------------------
-- Server version	5.7.24

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
-- Table structure for table `tb_ewm`
--

DROP TABLE IF EXISTS `tb_ewm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_ewm` (
  `ewmid` varchar(20) NOT NULL,
  `ewmsj` varchar(200) NOT NULL,
  PRIMARY KEY (`ewmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ewm`
--

LOCK TABLES `tb_ewm` WRITE;
/*!40000 ALTER TABLE `tb_ewm` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_ewm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ncp`
--

DROP TABLE IF EXISTS `tb_ncp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_ncp` (
  `ncpid` varchar(20) NOT NULL,
  `ncpmc` varchar(20) NOT NULL,
  `cd` varchar(30) DEFAULT NULL,
  `pz` varchar(15) DEFAULT NULL,
  `ccrq` date DEFAULT NULL,
  `zzfs` varchar(30) DEFAULT NULL,
  `qyid` varchar(20) NOT NULL,
  `ewmid` varchar(20) NOT NULL,
  PRIMARY KEY (`ncpid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ncp`
--

LOCK TABLES `tb_ncp` WRITE;
/*!40000 ALTER TABLE `tb_ncp` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_ncp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_qy`
--

DROP TABLE IF EXISTS `tb_qy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_qy` (
  `qyid` varchar(20) NOT NULL,
  `zh` varchar(10) NOT NULL,
  `mm` varchar(10) NOT NULL,
  `qymc` varchar(20) NOT NULL,
  `dz` varchar(30) DEFAULT NULL,
  `fzr` varchar(10) DEFAULT NULL,
  `dh` varchar(15) DEFAULT NULL,
  `yx` varchar(15) DEFAULT NULL,
  `bz` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`qyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_qy`
--

LOCK TABLES `tb_qy` WRITE;
/*!40000 ALTER TABLE `tb_qy` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_qy` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-17 13:47:17
