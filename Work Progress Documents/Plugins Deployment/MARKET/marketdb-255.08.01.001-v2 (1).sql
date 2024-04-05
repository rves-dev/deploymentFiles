-- MySQL dump 10.13  Distrib 5.7.22, for osx10.13 (x86_64)
--
-- Host: localhost    Database: market_255_08_01_001_v2
-- ------------------------------------------------------
-- Server version	5.6.40

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
-- Table structure for table `market_abstract_bill`
--

DROP TABLE IF EXISTS `market_abstract_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_abstract_bill` (
  `objid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_abstract_bill`
--

LOCK TABLES `market_abstract_bill` WRITE;
/*!40000 ALTER TABLE `market_abstract_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_abstract_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_abstract_billitem`
--

DROP TABLE IF EXISTS `market_abstract_billitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_abstract_billitem` (
  `objid` varchar(50) NOT NULL,
  `billid` varchar(50) DEFAULT NULL,
  `itemid` varchar(50) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `amtpaid` decimal(16,2) DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  `uid` varchar(200) DEFAULT NULL,
  `auto` int(11) DEFAULT '0',
  `forwarded` int(11) DEFAULT '0',
  `billdate` date DEFAULT NULL,
  `supersededid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_market_billitem_billid_uid` (`billid`,`uid`),
  KEY `ix_billid` (`billid`),
  KEY `ix_uid` (`uid`),
  KEY `ix_supersededid` (`supersededid`),
  KEY `ix_billdate` (`billdate`),
  KEY `fk_market_billitem_itemid` (`itemid`),
  KEY `uix_market_bilitem_acctid_itemid_billscheduleid` (`billid`,`itemid`),
  CONSTRAINT `fk_market_abstract_billitem_billid` FOREIGN KEY (`billid`) REFERENCES `market_abstract_bill` (`objid`),
  CONSTRAINT `fk_market_abstract_billitem_itemid` FOREIGN KEY (`itemid`) REFERENCES `market_itemaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_abstract_billitem`
--

LOCK TABLES `market_abstract_billitem` WRITE;
/*!40000 ALTER TABLE `market_abstract_billitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_abstract_billitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_account`
--

DROP TABLE IF EXISTS `market_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_account` (
  `objid` varchar(50) NOT NULL,
  `acctno` varchar(50) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `acctinfoid` varchar(50) DEFAULT NULL,
  `taskid` varchar(50) DEFAULT NULL,
  `lastbillid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_market_account_acctno` (`acctno`),
  KEY `fk_market_account_acctinfoid` (`acctinfoid`),
  KEY `fk_market_account_taskid` (`taskid`),
  CONSTRAINT `fk_market_account_acctinfoid` FOREIGN KEY (`acctinfoid`) REFERENCES `market_account_info` (`objid`),
  CONSTRAINT `fk_market_account_taskid` FOREIGN KEY (`taskid`) REFERENCES `market_account_task` (`taskid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_account`
--

LOCK TABLES `market_account` WRITE;
/*!40000 ALTER TABLE `market_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_account_info`
--

DROP TABLE IF EXISTS `market_account_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_account_info` (
  `objid` varchar(50) NOT NULL,
  `acctid` varchar(50) DEFAULT NULL,
  `acctname` varchar(255) DEFAULT NULL,
  `owner_objid` varchar(50) DEFAULT NULL,
  `owner_name` varchar(255) DEFAULT NULL,
  `owner_address_text` varchar(255) DEFAULT NULL,
  `owner_entitytype` varchar(50) DEFAULT NULL,
  `owner_profileid` varchar(50) DEFAULT NULL,
  `owner_profileno` varchar(50) DEFAULT NULL,
  `owner_firstname` varchar(255) DEFAULT NULL,
  `owner_lastname` varchar(255) DEFAULT NULL,
  `owner_middlename` varchar(255) DEFAULT NULL,
  `owner_resident` smallint(6) DEFAULT NULL,
  `owner_address_objid` varchar(50) DEFAULT NULL,
  `owner_address_unitno` varchar(50) DEFAULT NULL,
  `owner_address_bldgno` varchar(50) DEFAULT NULL,
  `owner_address_bldgname` varchar(255) DEFAULT NULL,
  `owner_address_street` varchar(255) DEFAULT NULL,
  `owner_address_subdivision` varchar(255) DEFAULT NULL,
  `owner_address_barangay_objid` varchar(50) DEFAULT NULL,
  `owner_address_barangay_name` varchar(255) DEFAULT NULL,
  `owner_address_citymunicipality` varchar(255) DEFAULT NULL,
  `owner_address_province` varchar(255) DEFAULT NULL,
  `owner_tin` varchar(255) DEFAULT NULL,
  `owner_email` varchar(255) DEFAULT NULL,
  `owner_mobileno` varchar(50) DEFAULT NULL,
  `owner_phoneno` varchar(50) DEFAULT NULL,
  `owner_id_type_name` varchar(50) DEFAULT NULL,
  `owner_id_idno` varchar(50) DEFAULT NULL,
  `owner_id_placeissued` varchar(255) DEFAULT NULL,
  `owner_id_dtissued` date DEFAULT NULL,
  `contact_mobileno` varchar(50) DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `contact_phoneno` varchar(50) DEFAULT NULL,
  `unitid` varchar(50) DEFAULT NULL,
  `paymentmode` varchar(50) DEFAULT NULL,
  `business_objid` varchar(50) DEFAULT NULL,
  `business_bin` varchar(50) DEFAULT NULL,
  `business_tradename` varchar(300) DEFAULT NULL,
  `tags` mediumtext,
  PRIMARY KEY (`objid`),
  KEY `fk_market_account_info_acctid` (`acctid`),
  KEY `fk_market_account_info_unitid` (`unitid`),
  CONSTRAINT `fk_market_account_info_acctid` FOREIGN KEY (`acctid`) REFERENCES `market_account` (`objid`),
  CONSTRAINT `fk_market_account_info_unitid` FOREIGN KEY (`unitid`) REFERENCES `market_rental_unit` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_account_info`
--

LOCK TABLES `market_account_info` WRITE;
/*!40000 ALTER TABLE `market_account_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_account_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_account_task`
--

DROP TABLE IF EXISTS `market_account_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_account_task` (
  `taskid` varchar(50) NOT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `parentprocessid` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `assignee_objid` varchar(50) DEFAULT NULL,
  `assignee_name` varchar(100) DEFAULT NULL,
  `actor_objid` varchar(50) DEFAULT NULL,
  `actor_name` varchar(100) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `dtcreated` datetime DEFAULT NULL,
  `prevtaskid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`taskid`),
  KEY `ix_actor_objid` (`actor_objid`),
  KEY `ix_assignee_objid` (`assignee_objid`),
  KEY `ix_dtcreated` (`dtcreated`),
  KEY `ix_enddate` (`enddate`),
  KEY `ix_parentprocessid` (`parentprocessid`),
  KEY `ix_prevtaskid` (`prevtaskid`),
  KEY `ix_refid` (`refid`),
  KEY `ix_startdate` (`startdate`),
  CONSTRAINT `market_account_task_refid` FOREIGN KEY (`refid`) REFERENCES `market_account` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_account_task`
--

LOCK TABLES `market_account_task` WRITE;
/*!40000 ALTER TABLE `market_account_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_account_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_batch_rental_rate`
--

DROP TABLE IF EXISTS `market_batch_rental_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_batch_rental_rate` (
  `objid` varchar(50) NOT NULL,
  `startdate` date DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `createdby_objid` varchar(50) DEFAULT NULL,
  `createdby_name` varchar(255) DEFAULT NULL,
  `dtcreated` datetime DEFAULT NULL,
  `particulars` varchar(255) DEFAULT NULL,
  `rate` decimal(16,2) DEFAULT NULL,
  `ratetype` varchar(50) DEFAULT NULL,
  `fixed` int(11) DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `nextdate` date DEFAULT NULL,
  `interval` int(11) DEFAULT NULL,
  `centerid` varchar(50) DEFAULT NULL,
  `section` varchar(255) DEFAULT NULL,
  `includeunits` int(11) DEFAULT NULL,
  `units` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_market_batc_rental_rate_centerid` (`centerid`),
  CONSTRAINT `fk_market_batc_rental_rate_centerid` FOREIGN KEY (`centerid`) REFERENCES `market_center` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_batch_rental_rate`
--

LOCK TABLES `market_batch_rental_rate` WRITE;
/*!40000 ALTER TABLE `market_batch_rental_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_batch_rental_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_bill`
--

DROP TABLE IF EXISTS `market_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_bill` (
  `objid` varchar(50) NOT NULL,
  `prevbillid` varchar(50) DEFAULT NULL,
  `billno` varchar(50) DEFAULT NULL,
  `billdate` date DEFAULT NULL,
  `lasttxndate` date DEFAULT NULL,
  `validitydate` date DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `acctid` varchar(50) DEFAULT NULL,
  `acctinfoid` varchar(50) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `balanceforward` decimal(16,2) DEFAULT NULL,
  `totalpayment` decimal(16,2) DEFAULT NULL,
  `interest` decimal(16,2) DEFAULT NULL,
  `surcharge` decimal(16,2) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `discount` decimal(16,2) DEFAULT NULL,
  `txnmode` varchar(50) DEFAULT NULL,
  `uid` varchar(50) DEFAULT NULL,
  `scheduleid` varchar(50) DEFAULT NULL,
  `dtprinted` datetime DEFAULT NULL,
  `rateid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_acctid_scheduleitemid` (`acctid`,`scheduleid`),
  UNIQUE KEY `uix_billno` (`billno`),
  KEY `ix_acctinfoid` (`acctinfoid`),
  KEY `ix_scheduleitemid` (`scheduleid`),
  KEY `fk_market_rental_bill_rateid` (`rateid`),
  CONSTRAINT `fk_market_rental_bill_acctid` FOREIGN KEY (`acctid`) REFERENCES `market_account` (`objid`),
  CONSTRAINT `fk_market_rental_bill_acctinfoid` FOREIGN KEY (`acctinfoid`) REFERENCES `market_account_info` (`objid`),
  CONSTRAINT `fk_market_rental_bill_billscheduleid` FOREIGN KEY (`scheduleid`) REFERENCES `market_billschedule` (`objid`),
  CONSTRAINT `fk_market_rental_bill_objid` FOREIGN KEY (`objid`) REFERENCES `market_abstract_bill` (`objid`),
  CONSTRAINT `fk_market_rental_bill_rateid` FOREIGN KEY (`rateid`) REFERENCES `market_rental_rate` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_bill`
--

LOCK TABLES `market_bill` WRITE;
/*!40000 ALTER TABLE `market_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_bill_cancelled`
--

DROP TABLE IF EXISTS `market_bill_cancelled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_bill_cancelled` (
  `objid` varchar(50) NOT NULL,
  `billno` varchar(50) DEFAULT NULL,
  `scheduleid` varchar(50) DEFAULT NULL,
  `acctid` varchar(50) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_market_bill_temp_billno` (`billno`),
  UNIQUE KEY `uix_market_bill_temp_acctid_year_month` (`acctid`,`year`,`month`),
  CONSTRAINT `fk_market_bill_cancelled_objid` FOREIGN KEY (`objid`) REFERENCES `market_abstract_bill` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_bill_cancelled`
--

LOCK TABLES `market_bill_cancelled` WRITE;
/*!40000 ALTER TABLE `market_bill_cancelled` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_bill_cancelled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_billitem`
--

DROP TABLE IF EXISTS `market_billitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_billitem` (
  `objid` varchar(50) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `paymentplanid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_year_month` (`year`,`month`),
  KEY `ix_year` (`year`),
  KEY `ix_duedate` (`duedate`),
  KEY `fk_market_billitem_compromiseid` (`paymentplanid`),
  CONSTRAINT `fk_market_billitem_objid` FOREIGN KEY (`objid`) REFERENCES `market_abstract_billitem` (`objid`),
  CONSTRAINT `fk_market_billitem_paymentplanid` FOREIGN KEY (`paymentplanid`) REFERENCES `market_payment_plan` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_billitem`
--

LOCK TABLES `market_billitem` WRITE;
/*!40000 ALTER TABLE `market_billitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_billitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_billitem_subitem`
--

DROP TABLE IF EXISTS `market_billitem_subitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_billitem_subitem` (
  `objid` varchar(50) NOT NULL,
  `billitemrefid` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_market_billitem_subitem_billitemrefid` (`billitemrefid`),
  CONSTRAINT `fk_market_billitem_subitem_billitemrefid` FOREIGN KEY (`billitemrefid`) REFERENCES `market_abstract_billitem` (`objid`),
  CONSTRAINT `fk_market_billitem_subitem_objid` FOREIGN KEY (`objid`) REFERENCES `market_abstract_billitem` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_billitem_subitem`
--

LOCK TABLES `market_billitem_subitem` WRITE;
/*!40000 ALTER TABLE `market_billitem_subitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_billitem_subitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_billschedule`
--

DROP TABLE IF EXISTS `market_billschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_billschedule` (
  `objid` varchar(50) NOT NULL,
  `groupid` varchar(50) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `fromdate` date DEFAULT NULL,
  `todate` date DEFAULT NULL,
  `billdate` date DEFAULT NULL,
  `readingdate` date DEFAULT NULL,
  `discdate` date DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `expirydate` date DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_market_billschedule_billgroupid_year_month` (`groupid`,`year`,`month`),
  CONSTRAINT `fk_market_billschedule_groupid` FOREIGN KEY (`groupid`) REFERENCES `market_billschedule_group` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_billschedule`
--

LOCK TABLES `market_billschedule` WRITE;
/*!40000 ALTER TABLE `market_billschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_billschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_billschedule_group`
--

DROP TABLE IF EXISTS `market_billschedule_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_billschedule_group` (
  `objid` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_billschedule_group`
--

LOCK TABLES `market_billschedule_group` WRITE;
/*!40000 ALTER TABLE `market_billschedule_group` DISABLE KEYS */;
INSERT INTO `market_billschedule_group` VALUES ('DEFAULT','default schedule');
/*!40000 ALTER TABLE `market_billschedule_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_center`
--

DROP TABLE IF EXISTS `market_center`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_center` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `address_text` varchar(255) DEFAULT NULL,
  `address_unitno` varchar(20) DEFAULT NULL,
  `address_bldgno` varchar(20) DEFAULT NULL,
  `address_bldgname` varchar(50) DEFAULT NULL,
  `address_street` varchar(50) DEFAULT NULL,
  `address_subdivision` varchar(50) DEFAULT NULL,
  `address_barangay_objid` varchar(50) DEFAULT NULL,
  `address_barangay_name` varchar(255) DEFAULT NULL,
  `address_citymunicipality` varchar(100) DEFAULT NULL,
  `address_province` varchar(50) DEFAULT NULL,
  `contactinfo` varchar(255) DEFAULT NULL,
  `controlcode` varchar(5) DEFAULT NULL,
  `logoid` varchar(50) DEFAULT NULL,
  `schedulegroupid` varchar(50) DEFAULT NULL,
  `org_objid` varchar(50) DEFAULT NULL,
  `org_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_market_center_schedulegroupid` (`schedulegroupid`),
  CONSTRAINT `fk_market_center_schedulegroupid` FOREIGN KEY (`schedulegroupid`) REFERENCES `market_billschedule_group` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_center`
--

LOCK TABLES `market_center` WRITE;
/*!40000 ALTER TABLE `market_center` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_center` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_credit_billitem`
--

DROP TABLE IF EXISTS `market_credit_billitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_credit_billitem` (
  `objid` varchar(50) NOT NULL,
  `paymentid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_market_credit_billitem_paymentid` (`paymentid`),
  CONSTRAINT `fk_market_credit_billitem_objid` FOREIGN KEY (`objid`) REFERENCES `market_abstract_billitem` (`objid`),
  CONSTRAINT `fk_market_credit_billitem_paymentid` FOREIGN KEY (`paymentid`) REFERENCES `market_payment` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_credit_billitem`
--

LOCK TABLES `market_credit_billitem` WRITE;
/*!40000 ALTER TABLE `market_credit_billitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_credit_billitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_credit_paymentitem`
--

DROP TABLE IF EXISTS `market_credit_paymentitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_credit_paymentitem` (
  `objid` varchar(50) NOT NULL,
  `credititemid` varchar(50) DEFAULT NULL,
  `billitemrefid` varchar(50) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `voidamount` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_market_payment_item_parentid` (`credititemid`),
  KEY `fk_market_paymentitem_billitemid` (`billitemrefid`),
  CONSTRAINT `fk_market_credit_paymentitem_billitemrefid` FOREIGN KEY (`billitemrefid`) REFERENCES `market_abstract_billitem` (`objid`),
  CONSTRAINT `fk_market_credit_paymentitem_credititemid` FOREIGN KEY (`credititemid`) REFERENCES `market_credit_billitem` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_credit_paymentitem`
--

LOCK TABLES `market_credit_paymentitem` WRITE;
/*!40000 ALTER TABLE `market_credit_paymentitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_credit_paymentitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_discountitem`
--

DROP TABLE IF EXISTS `market_discountitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_discountitem` (
  `objid` varchar(50) NOT NULL,
  `billitemrefid` varchar(50) DEFAULT NULL,
  `itemid` varchar(50) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `paymentid` varchar(50) DEFAULT NULL,
  `voidamount` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `fk_market_discountitem_billitemrefid` (`billitemrefid`),
  KEY `market_discountitem_itemid` (`itemid`),
  KEY `market_discountitem_paymentid` (`paymentid`),
  CONSTRAINT `fk_market_discountitem_billitemrefid` FOREIGN KEY (`billitemrefid`) REFERENCES `market_billitem` (`objid`),
  CONSTRAINT `fk_market_discountitem_itemid` FOREIGN KEY (`itemid`) REFERENCES `market_itemaccount` (`objid`),
  CONSTRAINT `fk_market_discountitem_paymentid` FOREIGN KEY (`paymentid`) REFERENCES `market_payment` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_discountitem`
--

LOCK TABLES `market_discountitem` WRITE;
/*!40000 ALTER TABLE `market_discountitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_discountitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_itemaccount`
--

DROP TABLE IF EXISTS `market_itemaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_itemaccount` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `item_objid` varchar(50) DEFAULT NULL,
  `item_code` varchar(50) DEFAULT NULL,
  `item_title` varchar(255) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `itemtype` varchar(50) DEFAULT NULL,
  `tag` varchar(20) DEFAULT NULL,
  `allowmanual` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_item_objid` (`item_objid`),
  KEY `ix_item_code` (`item_code`),
  KEY `ix_itemtype` (`itemtype`),
  KEY `ix_tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_itemaccount`
--

LOCK TABLES `market_itemaccount` WRITE;
/*!40000 ALTER TABLE `market_itemaccount` DISABLE KEYS */;
INSERT INTO `market_itemaccount` VALUES ('MARKET_ADVANCE_PAYMENT','MARKET ADVANCE PAYMENT',NULL,NULL,NULL,5,'MAIN',NULL,0),('MARKET_RENTAL','MARKET RENTAL',NULL,NULL,NULL,1,'MAIN',NULL,1),('MARKET_RENTAL_DISCOUNT','MARKET RENTAL DISCOUNT',NULL,NULL,NULL,4,'DISCOUNT',NULL,0),('MARKET_RENTAL_INTEREST','MARKET RENTAL INTEREST',NULL,NULL,NULL,3,'INTEREST',NULL,0),('MARKET_RENTAL_INTEREST_PREVIOUS','MARKET RENTAL PREVIOUS INTEREST',NULL,NULL,NULL,3,'INTEREST',NULL,0),('MARKET_RENTAL_PREVIOUS','MARKET RENTAL PREVIOUS',NULL,NULL,NULL,1,'MAIN',NULL,0),('MARKET_RENTAL_SURCHARGE','MARKET RENTAL SURCHARGE',NULL,NULL,NULL,2,'SURCHARGE',NULL,0),('MARKET_RENTAL_SURCHARGE_PREVIOUS','MARKET RENTAL PREVIOUS SURCHARGE',NULL,NULL,NULL,2,'SURCHARGE',NULL,0),('MARKET_TRANSFER_UNIT_FEE','MARKET TRANSFER FEE',NULL,NULL,NULL,1,'MAIN',NULL,0);
/*!40000 ALTER TABLE `market_itemaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_payment`
--

DROP TABLE IF EXISTS `market_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_payment` (
  `objid` varchar(50) NOT NULL,
  `billid` varchar(50) NOT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `refno` varchar(50) DEFAULT NULL,
  `reftype` varchar(50) DEFAULT NULL,
  `refdate` date DEFAULT NULL,
  `txnmode` varchar(50) DEFAULT NULL,
  `voided` int(11) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `txnid` varchar(50) DEFAULT NULL,
  `payer_objid` varchar(50) DEFAULT NULL,
  `payer_name` varchar(255) DEFAULT NULL,
  `paidby` varchar(255) DEFAULT NULL,
  `paidbyaddress` varchar(255) DEFAULT NULL,
  `posted` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_water_payment_txnid` (`txnid`),
  KEY `fk_water_payment_billid` (`billid`),
  CONSTRAINT `fk_market_payment_billid` FOREIGN KEY (`billid`) REFERENCES `market_abstract_bill` (`objid`),
  CONSTRAINT `fk_market_payment_txnid` FOREIGN KEY (`txnid`) REFERENCES `market_txn` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_payment`
--

LOCK TABLES `market_payment` WRITE;
/*!40000 ALTER TABLE `market_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_payment_plan`
--

DROP TABLE IF EXISTS `market_payment_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_payment_plan` (
  `objid` varchar(50) NOT NULL,
  `downpaymentrate` decimal(16,2) DEFAULT NULL,
  `downpayment` decimal(16,2) DEFAULT NULL,
  `term` int(11) DEFAULT NULL,
  `principal` decimal(16,2) DEFAULT NULL,
  `installmentamt` decimal(16,2) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `billcount` int(11) DEFAULT NULL,
  `amtbilled` decimal(16,2) DEFAULT NULL,
  `itemid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `objid` (`objid`),
  KEY `fk_market_payment_plan_itemid` (`itemid`),
  CONSTRAINT `fk_market_payment_plan_itemid` FOREIGN KEY (`itemid`) REFERENCES `market_itemaccount` (`objid`),
  CONSTRAINT `fk_market_payment_plan_objid` FOREIGN KEY (`objid`) REFERENCES `market_payment` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_payment_plan`
--

LOCK TABLES `market_payment_plan` WRITE;
/*!40000 ALTER TABLE `market_payment_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_payment_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_paymentitem`
--

DROP TABLE IF EXISTS `market_paymentitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_paymentitem` (
  `objid` varchar(50) NOT NULL,
  `paymentid` varchar(50) DEFAULT NULL,
  `billitemrefid` varchar(50) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `voidamount` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_market_payment_item_parentid` (`paymentid`),
  KEY `fk_market_paymentitem_billitemid` (`billitemrefid`),
  CONSTRAINT `fk_market_paymentitem_billitemid` FOREIGN KEY (`billitemrefid`) REFERENCES `market_abstract_billitem` (`objid`),
  CONSTRAINT `fk_market_paymentitem_paymentid` FOREIGN KEY (`paymentid`) REFERENCES `market_payment` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_paymentitem`
--

LOCK TABLES `market_paymentitem` WRITE;
/*!40000 ALTER TABLE `market_paymentitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_paymentitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_rental_rate`
--

DROP TABLE IF EXISTS `market_rental_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_rental_rate` (
  `objid` varchar(50) NOT NULL,
  `unitid` varchar(50) DEFAULT NULL,
  `rate` decimal(16,2) DEFAULT NULL,
  `ratetype` varchar(50) DEFAULT NULL,
  `effectivedate` date DEFAULT NULL,
  `createdby_objid` varchar(50) DEFAULT NULL,
  `createdby_name` varchar(100) DEFAULT NULL,
  `dtcreated` datetime DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `batchid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_market_rental_rate_unitid` (`unitid`),
  KEY `fk_market_rental_rate_batchid` (`batchid`),
  CONSTRAINT `fk_market_rental_rate_batchid` FOREIGN KEY (`batchid`) REFERENCES `market_batch_rental_rate` (`objid`),
  CONSTRAINT `fk_market_rental_rate_unitid` FOREIGN KEY (`unitid`) REFERENCES `market_rental_unit` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_rental_rate`
--

LOCK TABLES `market_rental_rate` WRITE;
/*!40000 ALTER TABLE `market_rental_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_rental_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_rental_unit`
--

DROP TABLE IF EXISTS `market_rental_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_rental_unit` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `centerid` varchar(50) DEFAULT NULL,
  `sectionid` varchar(50) DEFAULT NULL,
  `unitno` varchar(50) DEFAULT NULL,
  `unittype` varchar(50) DEFAULT NULL,
  `currentacctid` varchar(50) DEFAULT NULL,
  `indexno` int(11) DEFAULT NULL,
  `areasqm` decimal(16,2) DEFAULT NULL,
  `schedulegroupid` varchar(50) DEFAULT NULL,
  `uid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_market_account_uid` (`uid`),
  UNIQUE KEY `uix_market_rental_unit_orgunitid_code` (`sectionid`,`unitno`),
  KEY `fk_market_rental_unit_orgid` (`centerid`),
  KEY `fk_market_rental_unit_currentacctid` (`currentacctid`),
  KEY `fk_market_rental_unit_orgunitid` (`sectionid`),
  KEY `fk_market_rental_unit_schedulegroupid` (`schedulegroupid`),
  KEY `fk_market_rental_unit_unittype` (`unittype`),
  CONSTRAINT `fk_market_rental_unit_centerid` FOREIGN KEY (`centerid`) REFERENCES `market_center` (`objid`),
  CONSTRAINT `fk_market_rental_unit_currentacctid` FOREIGN KEY (`currentacctid`) REFERENCES `market_account` (`objid`),
  CONSTRAINT `fk_market_rental_unit_schedulegroupid` FOREIGN KEY (`schedulegroupid`) REFERENCES `market_billschedule_group` (`objid`),
  CONSTRAINT `fk_market_rental_unit_sectionid` FOREIGN KEY (`sectionid`) REFERENCES `market_section` (`objid`),
  CONSTRAINT `fk_market_rental_unit_unittype` FOREIGN KEY (`unittype`) REFERENCES `market_rental_unit_type` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_rental_unit`
--

LOCK TABLES `market_rental_unit` WRITE;
/*!40000 ALTER TABLE `market_rental_unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_rental_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_rental_unit_type`
--

DROP TABLE IF EXISTS `market_rental_unit_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_rental_unit_type` (
  `objid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_rental_unit_type`
--

LOCK TABLES `market_rental_unit_type` WRITE;
/*!40000 ALTER TABLE `market_rental_unit_type` DISABLE KEYS */;
INSERT INTO `market_rental_unit_type` VALUES ('BLOCK'),('SPACE'),('STALL'),('TABLE'),('TILE');
/*!40000 ALTER TABLE `market_rental_unit_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_section`
--

DROP TABLE IF EXISTS `market_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_section` (
  `objid` varchar(50) NOT NULL,
  `centerid` varchar(50) DEFAULT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `leftindex` int(11) DEFAULT NULL,
  `rightindex` int(11) DEFAULT NULL,
  `fullpath` varchar(500) DEFAULT NULL,
  `uid` int(11) NOT NULL,
  `controlcode` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `objid` (`objid`),
  KEY `fk_market_orgunit_centerid` (`centerid`),
  KEY `fk_market_orgunit_parentid` (`parentid`),
  KEY `uix_market_orgunit_uid` (`uid`),
  CONSTRAINT `fk_market_orgunit_centerid` FOREIGN KEY (`centerid`) REFERENCES `market_center` (`objid`),
  CONSTRAINT `fk_market_orgunit_parentid` FOREIGN KEY (`parentid`) REFERENCES `market_section` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_section`
--

LOCK TABLES `market_section` WRITE;
/*!40000 ALTER TABLE `market_section` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_tag`
--

DROP TABLE IF EXISTS `market_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_tag` (
  `objid` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_tag`
--

LOCK TABLES `market_tag` WRITE;
/*!40000 ALTER TABLE `market_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_txn`
--

DROP TABLE IF EXISTS `market_txn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_txn` (
  `objid` varchar(50) NOT NULL,
  `controlno` varchar(50) DEFAULT NULL,
  `txntypeid` varchar(50) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `acctid` varchar(50) DEFAULT NULL,
  `oldacctinfoid` varchar(50) DEFAULT NULL,
  `newacctinfoid` varchar(50) DEFAULT NULL,
  `taskid` varchar(50) DEFAULT NULL,
  `info` mediumtext,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_market_txn_controlno` (`controlno`),
  KEY `fk_market_txn_txntypeid` (`txntypeid`),
  KEY `fk_market_txn_newacctinfoid` (`newacctinfoid`),
  KEY `fk_market_txn_acctinfoid` (`oldacctinfoid`),
  KEY `fk_market_txn_acctid` (`acctid`),
  KEY `fk_market_txn_taskid` (`taskid`),
  CONSTRAINT `fk_market_txn_acctid` FOREIGN KEY (`acctid`) REFERENCES `market_account` (`objid`),
  CONSTRAINT `fk_market_txn_acctinfoid` FOREIGN KEY (`oldacctinfoid`) REFERENCES `market_account_info` (`objid`),
  CONSTRAINT `fk_market_txn_newacctinfoid` FOREIGN KEY (`newacctinfoid`) REFERENCES `market_account_info` (`objid`),
  CONSTRAINT `fk_market_txn_taskid` FOREIGN KEY (`taskid`) REFERENCES `market_txn_task` (`taskid`),
  CONSTRAINT `fk_market_txn_txntypeid` FOREIGN KEY (`txntypeid`) REFERENCES `market_txntype` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_txn`
--

LOCK TABLES `market_txn` WRITE;
/*!40000 ALTER TABLE `market_txn` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_txn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_txn_bill`
--

DROP TABLE IF EXISTS `market_txn_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_txn_bill` (
  `objid` varchar(50) NOT NULL,
  `txnid` varchar(50) DEFAULT NULL,
  `billno` varchar(50) DEFAULT NULL,
  `billdate` date DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_market_txn_bill_billno` (`billno`),
  UNIQUE KEY `fk_market_txn_bill_txnid` (`txnid`),
  CONSTRAINT `fk_market_txn_bill_objid` FOREIGN KEY (`objid`) REFERENCES `market_abstract_bill` (`objid`),
  CONSTRAINT `fk_market_txn_bill_txnid` FOREIGN KEY (`txnid`) REFERENCES `market_txn` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_txn_bill`
--

LOCK TABLES `market_txn_bill` WRITE;
/*!40000 ALTER TABLE `market_txn_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_txn_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_txn_billitem`
--

DROP TABLE IF EXISTS `market_txn_billitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_txn_billitem` (
  `objid` varchar(50) NOT NULL,
  `paymentplanid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_market_txn_billitem_paymentplanid` (`paymentplanid`),
  CONSTRAINT `fk_market_txn_billitem_objid` FOREIGN KEY (`objid`) REFERENCES `market_abstract_billitem` (`objid`),
  CONSTRAINT `fk_market_txn_billitem_paymentplanid` FOREIGN KEY (`paymentplanid`) REFERENCES `market_payment_plan` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_txn_billitem`
--

LOCK TABLES `market_txn_billitem` WRITE;
/*!40000 ALTER TABLE `market_txn_billitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_txn_billitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_txn_task`
--

DROP TABLE IF EXISTS `market_txn_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_txn_task` (
  `taskid` varchar(50) NOT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `parentprocessid` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `assignee_objid` varchar(50) DEFAULT NULL,
  `assignee_name` varchar(100) DEFAULT NULL,
  `actor_objid` varchar(50) DEFAULT NULL,
  `actor_name` varchar(100) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `dtcreated` datetime DEFAULT NULL,
  `prevtaskid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`taskid`),
  KEY `ix_actor_objid` (`actor_objid`),
  KEY `ix_assignee_objid` (`assignee_objid`),
  KEY `ix_dtcreated` (`dtcreated`),
  KEY `ix_enddate` (`enddate`),
  KEY `ix_parentprocessid` (`parentprocessid`),
  KEY `ix_prevtaskid` (`prevtaskid`),
  KEY `ix_refid` (`refid`),
  KEY `ix_startdate` (`startdate`),
  CONSTRAINT `fk_market_txn_task_refid` FOREIGN KEY (`refid`) REFERENCES `market_txn` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_txn_task`
--

LOCK TABLES `market_txn_task` WRITE;
/*!40000 ALTER TABLE `market_txn_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_txn_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_txntype`
--

DROP TABLE IF EXISTS `market_txntype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_txntype` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `sortorder` int(1) DEFAULT NULL,
  `processname` varchar(50) DEFAULT NULL,
  `controlnopattern` varchar(255) DEFAULT NULL,
  `guihandler` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `editableinfo` varchar(255) DEFAULT NULL,
  `active` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_market_txntype_processname` (`processname`),
  KEY `fk_market_txntype_role` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_txntype`
--

LOCK TABLES `market_txntype` WRITE;
/*!40000 ALTER TABLE `market_txntype` DISABLE KEYS */;
INSERT INTO `market_txntype` VALUES ('BLOCK_ACCOUNT','Block Account',100,'market_txn_block_account','MD-[yyyy][MM]-[%06d]','market_txn:block_account','PROCESSOR',NULL,1),('CAPTURE_ACCOUNT','Capture Account',2,'market_txn_capture_account','MCA-[yyyyMM]-[%06d]','market_txn:capture_account','PROCESSOR','.*',1),('CHANGE_ACCTINFO','Change Account info',7,'market_txn_changeinfo','MC-[yyyyMM]-[%06d]','market_txn:change_acctinfo','PROCESSOR','paymentmode',1),('CHANGE_OWNER','Change Owner',3,'market_txn_with_assessment','MT-[yyyyMM]-[%05d]','market_txn:change_owner','PROCESSOR','owner',1),('CLOSE_ACCOUNT','Close Account',102,'market_txn_close_account','MCA-[yyyyMM]-[%06d]','market_txn:close_account','ACCOUNT_MANAGER',NULL,1),('CREDITNOTE','Credit Note',20,'market_txn_creditnote','MCN-[yyyyMM]-[%06d]','market_txn:creditnote','PROCESSOR','credit',0),('NEW_ACCOUNT','New Account',1,'market_txn_newaccount','MA-[yyyyMM]-[%06d]','market_txn:new_account','PROCESSOR','.*',1),('PAYMENT_PLAN','Compromise Agreement',10,'market_txn_payment_plan','MP-[yyyyMM]-[%06d]','market_txn:payment_plan','PROCESSOR','paymentplan',0),('TRANSFER_UNIT','Transfer Unit',4,'market_txn_with_assessment','MA-[yyyyMM]-[%06d]','market_txn:transfer_unit','PROCESSOR','unit',1),('UNBLOCK_ACCOUNT','Unblock Account',101,'market_txn_unblock_account','MU-[yyyyMM]-[%06d]','market_txn:unblock_account','ACCOUNT_MANAGER',NULL,1);
/*!40000 ALTER TABLE `market_txntype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_email_queue`
--

DROP TABLE IF EXISTS `sys_email_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_email_queue` (
  `objid` varchar(50) NOT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `reportid` varchar(50) DEFAULT NULL,
  `dtsent` datetime DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` mediumtext,
  `errmsg` varchar(255) DEFAULT NULL,
  `connection` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_email_queue`
--

LOCK TABLES `sys_email_queue` WRITE;
/*!40000 ALTER TABLE `sys_email_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_email_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_email_template`
--

DROP TABLE IF EXISTS `sys_email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_email_template` (
  `objid` varchar(50) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` mediumtext,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_email_template`
--

LOCK TABLES `sys_email_template` WRITE;
/*!40000 ALTER TABLE `sys_email_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_email_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_message_queue`
--

DROP TABLE IF EXISTS `sys_message_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_message_queue` (
  `objid` varchar(50) NOT NULL,
  `state` int(1) DEFAULT NULL,
  `dtsent` datetime DEFAULT NULL,
  `email` varchar(355) DEFAULT NULL,
  `mobileno` varchar(50) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` mediumtext,
  `errmsg` varchar(255) DEFAULT NULL,
  `connection` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_message_queue`
--

LOCK TABLES `sys_message_queue` WRITE;
/*!40000 ALTER TABLE `sys_message_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_message_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_message_template`
--

DROP TABLE IF EXISTS `sys_message_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_message_template` (
  `objid` varchar(50) NOT NULL,
  `statement` mediumtext,
  `subject` varchar(255) DEFAULT NULL,
  `message` mediumtext,
  `emailfield` varchar(255) DEFAULT NULL,
  `mobilenofield` varchar(255) DEFAULT NULL,
  `connection` varchar(255) DEFAULT NULL,
  `smstext` mediumtext,
  `testparams` text,
  `emailcopyfield` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_message_template`
--

LOCK TABLES `sys_message_template` WRITE;
/*!40000 ALTER TABLE `sys_message_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_message_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_report_def`
--

DROP TABLE IF EXISTS `sys_report_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_report_def` (
  `name` varchar(100) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `reportheader` varchar(100) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `statement` mediumtext,
  `permission` varchar(100) DEFAULT NULL,
  `parameters` mediumtext,
  `querytype` varchar(50) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `properties` mediumtext,
  `paramhandler` varchar(100) DEFAULT NULL,
  `testparams` text,
  `visiblewhen` mediumtext,
  PRIMARY KEY (`name`),
  KEY `fk_sys_report_def_template` (`template`),
  KEY `fk_sys_report_def_reportheader` (`reportheader`),
  KEY `fk_sys_report_def_role` (`role`),
  CONSTRAINT `fk_sys_report_def_reportheader` FOREIGN KEY (`reportheader`) REFERENCES `sys_report_header` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sys_report_def_role` FOREIGN KEY (`role`) REFERENCES `sys_role` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sys_report_def_template` FOREIGN KEY (`template`) REFERENCES `sys_report_template` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_report_def`
--

LOCK TABLES `sys_report_def` WRITE;
/*!40000 ALTER TABLE `sys_report_def` DISABLE KEYS */;
INSERT INTO `sys_report_def` VALUES ('list_of_consumption_below_10cum','List of Consumption (Below 10 cum )','market_reports',NULL,NULL,NULL,100,'SELECT acctname, volume, classification_name, year, month \nFROM  vw_market_bill ',NULL,'[[prompt:1,name:\"year\",caption:\"Year\",type:\"integer\"],[prompt:1,name:\"month\",caption:\"Month\",type:\"monthlist\"]]','SQL','DRAFT','List of Consumption (Below 10 cum )','[]',NULL,'PARAMS.objid = \"\";',NULL),('market_account_statement','View Account Statement','market_account:reports','market_bill_statement',NULL,NULL,1,'def acctEm = EM.lookup( \"vw_market_account\" );\ndef db = DB.lookup( \"market_ytd_statement\" );\ndef vwBillEm = EM.lookup( \"vw_market_bill\" );\n\ndef acct = acctEm.find( [objid: PARAMS.objid] ).first();\nacct.barcode = acct.acctno;\nacct.year = PARAMS.year;\n\n/* find the first bill for the year */\ndef fBill = vwBillEm.find( [acctid: acct.objid] ).where( [\"year = :yr\", [yr: PARAMS.year] ] ).orderBy( \"year ASC, month ASC\" ).first();\nif( !fBill ) throw new Exception(\"There is no bill yet for \" + PARAMS.year );\n\nacct.items = db.getItems( [ acctid: acct.objid, year: PARAMS.year, firstbillid: fBill.objid ]  );\ndef runbal = 0;\nacct.items.each {\n      it.discpenalty = it.surcharge + it.interest - it.discount;\n      runbal += it.amount + it.discpenalty - it.amtpaid;\n      it.runbalance =  runbal; \n\n      if( it.refbillid ) {\n            def info = vwBillEm.find( [objid:it.refbillid ] ).select(\"prevreading,reading,volume,meter.*\").first(); \n            if( info ) it.putAll( info );                  \n      }\n}\nacct.balance = runbal;\nreturn acct;',NULL,'[[prompt:1,name:\"year\",caption:\"year\",type:\"integer\"]]','SCRIPT','DEPLOYED',NULL,'[]',NULL,'PARAMS.objid = \"WTRACCT-1d048235:18c619fca17:-7fff\";\nPARAMS.year = 2023;',NULL),('market_batch_bill_printout','Market Batch Bill Printout','market_batch_bill:reports','market_bill',NULL,NULL,1,'/* PARAMS.objid = \"0002-2023-5\"; */\ndef billEm = EM.lookup( \"vw_market_bill\" );\ndef list = billEm.find( [ batchid: PARAMS.objid ] ).orderBy( \"indexno\" ).list();\n\ndef svc = SERVICE.lookup( \"MarketPaymentService\" );\nlist.each { bill->\n\n    def res = svc.getPaymentInfo( [billid: bill.objid, txndate: bill.validitydate, amtpaid: bill.balance ] );\n    bill.details = res.billitems;\n    bill.details.each {\n          it.discpenalty = it.surcharge + it.interest - it.discount;\n          it.amount = it.amount + it.discpenalty;\n    }\n\n}\nreturn list;\n',NULL,'[]','SCRIPT','DEPLOYED',NULL,'[]',NULL,NULL,NULL),('market_batch_bill_receipt','Market Batch Billing Receipt Form','market_batch_bill:reports','market_batch_bill_receipt',NULL,NULL,10,'/* PARAMS.batchid = \"0001-2023-3\" */;\ndef em = EM.lookup( \"vw_market_bill\" );\nreturn em.find( [batchid: PARAMS.batchid] ).orderBy( \"indexno ASC\" ).list();',NULL,'[]','SCRIPT','DEPLOYED',NULL,'[]',NULL,NULL,NULL),('market_billing_notice','Market Billing Notice','market_account:reports','market_billing_notice',NULL,NULL,1,'def acctEm = EM.lookup( \"vw_market_account\" );\ndef svc = SERVICE.lookup( \"MarketPaymentService\" );\ndef dateSvc = SERVICE.lookup( \"DateService\" );\n\ndef acct = acctEm.find( [objid: PARAMS.objid] ).first();\nacct.billdate = dateSvc.serverDate;\nacct.barcode = acct.acctno;\nif(!acct.lastbillid) throw new Exception(\"Account does not have a last bill\");\ndef res = svc.getPaymentInfo( [billid: acct.lastbillid, txndate: acct.billdate , amtpaid:0 ] );\n\nacct.billitems = res.billitems;\nacct.amount = acct.billitems.sum{ it.total };\nacct.hasitems =  ( acct.billitems.size() > 0 ); \nreturn acct;',NULL,'[]','SCRIPT','DEPLOYED',NULL,'[]',NULL,'PARAMS.objid = \"WTRACCT-1d048235:18c619fca17:-7fff\";',NULL),('market_billing_summary','Summary of Billing','market_reports','market_summaryofbilling',NULL,NULL,110,NULL,NULL,'[]',NULL,'DRAFT',NULL,'[]',NULL,NULL,NULL),('market_bill_printout','Market Bill Printout','market_bill:reports','market_bill',NULL,NULL,1,'def billEm = EM.lookup(  \'vw_market_bill\' );   \ndef bill = billEm.find( [objid: PARAMS.objid] ).first();\n\ndef svc = SERVICE.lookup( \"MarketPaymentService\" );\ndef res = svc.getPaymentInfo( [billid: bill.objid, txndate: bill.validitydate, amtpaid: bill.balance ] );\nbill.details = res.billitems;\nbill.details.each {\n      it.discpenalty = it.surcharge + it.interest - it.discount;\n      it.total = it.amount + it.discpenalty;\n}\nreturn bill;',NULL,'[]','SCRIPT','DEPLOYED',NULL,'[[key:\"visibleWhen\",value:\"#{ entity.billtype == \'RENTAL\' }\"]]',NULL,'PARAMS.objid = \"WTRBILL-46ebebae:18c6223da6b:-8000\";',NULL),('market_bill_statement','Market Bill Statement','market_bill:reports','market_bill_statement',NULL,NULL,10,'def db = DB.lookup( \"market_bill_statement\" );\ndef vwBillEm = EM.lookup( \"vw_market_bill\" );\n\ndef bill = vwBillEm.find( [objid: PARAMS.objid] ).first();\nbill.barcode = bill.acctno;\nbill.items = db.getItems( [ billid: bill.objid ]  );\ndef runbal = 0;\nbill.items.each {\n      if( it.remarks ) it.particulars += \" (\" + it.remarks + \")\";	\n      it.discpenalty = it.surcharge + it.interest - it.discount;\n      runbal += it.amount + it.discpenalty - it.amtpaid;\n      it.runbalance =  runbal; \n      if( it.billyearmonth ) {\n            def info = vwBillEm.find( [acctid: bill.acctid] ).select(\"rate,ratetype\").where( \" ((year*12)+month)  = :yearmonth  \", [yearmonth: it.billyearmonth ]  ).first(); \n            if( info ) it.putAll( info );                  \n      }\n}\nbill.balance = runbal;\nbill.HEADER = [\n     ORG_NAME: \'PUBLIC MARKET TWO\'\n];\nreturn bill;',NULL,'[]','SCRIPT','DEPLOYED',NULL,'[]',NULL,'PARAMS.objid = \"MKTBILL-11c256c8:18cce6cc816:-7ff5\";',NULL),('market_connection_by_account','No. of Connections By Account Status','market_reports','market_account_connection_status',NULL,NULL,10,'def em = ACTIVEDB.lookup( \"market_connection_account_status\" );\ndef rpt = [:];\nrpt.items = em.getReport( [:] );\nreturn rpt',NULL,'[]','SCRIPT','DEPLOYED',NULL,'[]',NULL,NULL,NULL),('market_connection_by_consumption','Connections By Market Consumption','market_reports','market_connection_by_waterconsumption',NULL,NULL,110,'PARAMS.year = 2023;\nPARAMS.month = 3;\ndef em = ACTIVEDB.lookup( \"market_consumption_report\" );\ndef rpt = [:];\nrpt.items = em.getReport( [year: PARAMS.year, month: PARAMS.month] );\nreturn rpt;',NULL,'[]','SCRIPT','DRAFT',NULL,'[]',NULL,NULL,NULL),('market_connection_by_meter','No. of Connections By Meter Status','market_reports','market_meter_connection_status',NULL,NULL,101,NULL,NULL,'[]',NULL,'DRAFT',NULL,'[]',NULL,NULL,NULL),('market_delinquency_report','Delinquency List','market_reports','market_delinquency_listing',NULL,NULL,1,'def reportDb = ACTIVEDB.lookup( \"market_delinquency_report\" );\nreturn reportDb.getList(  [ year: PARAMS.year, month: PARAMS.month, unpaidmonths: 0] ); ',NULL,'[[name:\"year\",caption:\"Year\",type:\"integer\",prompt:1],[name:\"month\",caption:\"Month\",type:\"monthlist\",prompt:1]]','SCRIPT','DEPLOYED',NULL,'[]',NULL,NULL,NULL),('market_meter_reading_sheet','Meter Reading Sheet','market_billgroup:reports','market_meter_reading_sheet',NULL,NULL,1,'def year = PARAMS.year;\ndef month = PARAMS.month\ndef acctEm = EM.lookup( \"vw_market_account\" );\ndef billEm = EM.lookup( \"vw_market_bill\" );\ndef acctList = acctEm.find( [billgroupid: PARAMS.objid ]  ).orderBy(\"indexno\").list();\n\ndef ym = ((year*12)+month);\ndef m1 = billEm.find( [billgroupid: PARAMS.objid ]).where(  \"(year*12)+month = :ym\", [ym: ym ]  ).select(\"acctid,reading\").list();\ndef m2 = billEm.find( [billgroupid: PARAMS.objid ]).where(  \"(year*12)+month = :ym\", [ym: ym + 1 ]  ).select(\"acctid,reading\").list();\ndef m3 = billEm.find( [billgroupid: PARAMS.objid ]).where(  \"(year*12)+month = :ym\", [ym: ym + 2 ]  ).select(\"acctid,reading\").list();\ndef m4 = billEm.find( [billgroupid: PARAMS.objid ]).where(  \"(year*12)+month = :ym\", [ym: ym + 3 ]  ).select(\"acctid,reading\").list();\n\nacctList.each { acct->\n     acct.year = PARAMS.year;\n     acct.month = PARAMS.month;\n     acct.reading1 = m1.find{ it.acctid == acct.objid }?.reading;\n     acct.reading2 = m2.find{ it.acctid == acct.objid }?.reading;\n     acct.reading3 = m3.find{ it.acctid == acct.objid }?.reading;\n     acct.reading4 = m4.find{ it.acctid == acct.objid }?.reading;\n}\n\nreturn acctList;\n  ',NULL,'[[prompt:1,name:\"year\",caption:\"Year\",type:\"integer\"],[prompt:1,name:\"month\",caption:\"Month\",type:\"monthlist\"]]','SCRIPT','DEPLOYED',NULL,'[]',NULL,'PARAMS.objid = \'0028\'; ',NULL),('market_new_accounts','List of New Accounts','market_reports','market_new_account_list',NULL,NULL,102,NULL,NULL,'[]',NULL,'DRAFT',NULL,'[]',NULL,NULL,NULL),('market_ytd_statement','View YTD Statement','market_account:reports',NULL,NULL,NULL,3,NULL,NULL,'[]',NULL,'DRAFT',NULL,'[]',NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_report_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_report_output_template`
--

DROP TABLE IF EXISTS `sys_report_output_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_report_output_template` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `template` mediumtext,
  `options` mediumtext,
  `caption` varchar(255) DEFAULT NULL,
  `printtype` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_sys_report_def_template_parentid` (`parentid`),
  CONSTRAINT `fk_sys_report_def_template_parentid` FOREIGN KEY (`parentid`) REFERENCES `sys_report_def` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_report_output_template`
--

LOCK TABLES `sys_report_output_template` WRITE;
/*!40000 ALTER TABLE `sys_report_output_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_report_output_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_report_subreport_def`
--

DROP TABLE IF EXISTS `sys_report_subreport_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_report_subreport_def` (
  `objid` int(11) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `reportid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `querytype` varchar(50) DEFAULT NULL,
  `statement` mediumtext,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_report_subreport_def`
--

LOCK TABLES `sys_report_subreport_def` WRITE;
/*!40000 ALTER TABLE `sys_report_subreport_def` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_report_subreport_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_report_template`
--

DROP TABLE IF EXISTS `sys_report_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_report_template` (
  `name` varchar(100) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `filepath` varchar(255) NOT NULL,
  `master` int(11) DEFAULT NULL,
  `icon` mediumblob,
  PRIMARY KEY (`name`),
  UNIQUE KEY `uix_sys_report_template_filepath` (`filepath`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_report_template`
--

LOCK TABLES `sys_report_template` WRITE;
/*!40000 ALTER TABLE `sys_report_template` DISABLE KEYS */;
INSERT INTO `sys_report_template` VALUES ('blank','Blank Report','/master-templates/blank.jrxml',1,NULL),('market_account_connection_status','Market Account Connection Status','reports/account_connection_status.jasper',0,NULL),('market_batch_bill_receipt','Market Batch Bill Receipt Form','billing/market_batch_bill_receipt.jasper',0,NULL),('market_bill','Market Bill Printout','billing/market_bill.jasper',0,NULL),('market_billing_notice','Market Billing Notice','billing/market_billing_notice.jasper',0,NULL),('market_bill_statement','Market Bill Statement','billing/market_bill_statement.jasper',0,NULL),('market_connection_by_waterconsumption','Market Connection By Market Consumption','reports/connection_by_waterconsumption.jasper',0,NULL),('market_delinquency_listing','Market Delinquency Listing','reports/delinquency_report.jasper',0,NULL),('market_meter_connection_status','Market Connection By Meter Status','reports/meter_connection_status.jasper',0,NULL),('market_meter_reading_sheet','Market Meter Reading Sheet','billing/market_meter_reading_sheet.jasper',0,NULL),('market_new_account_list','Market New Account List','reports/new_account_list.jasper',0,NULL),('market_summaryofbilling','Summary of Billing','reports/summaryofbilling.jasper',0,NULL),('master1','Master Template','/master-templates/collection/standard/master.jrxml',1,NULL);
/*!40000 ALTER TABLE `sys_report_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `name` varchar(50) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `system` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES ('ACCOUNT_MANAGER','ACCOUNT MANAGER',0),('ADMIN','MARKET ADMIN',NULL),('APPROVER','APPROVER',0),('BILLER','MARKET BILLER',NULL),('INFO','INFO',0),('MASTER','MARKET MASTER',NULL),('PAYMENT_PROCESSOR','PAYMENT PROCESSOR',0),('PROCESSOR','PROCESSOR',0),('RELEASER','RELEASER',0),('REPORT_EDITOR','REPORT EDITOR',0),('RULE_AUTHOR','MARKET RULE AUTHOR',NULL),('SYSTEM','SYSTEM',0),('WF_EDITOR','MARKET WF EDITOR',NULL);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_permission`
--

DROP TABLE IF EXISTS `sys_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_permission` (
  `objid` varchar(100) NOT NULL,
  `role` varchar(50) DEFAULT NULL,
  `object` varchar(25) DEFAULT NULL,
  `permission` varchar(25) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_sys_role_permission_role` (`role`),
  CONSTRAINT `fk_sys_role_permission_role` FOREIGN KEY (`role`) REFERENCES `sys_role` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_permission`
--

LOCK TABLES `sys_role_permission` WRITE;
/*!40000 ALTER TABLE `sys_role_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule`
--

DROP TABLE IF EXISTS `sys_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `ruleset` varchar(50) NOT NULL,
  `rulegroup` varchar(50) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `description` longtext,
  `salience` int(11) DEFAULT NULL,
  `effectivefrom` date DEFAULT NULL,
  `effectiveto` date DEFAULT NULL,
  `dtfiled` datetime DEFAULT NULL,
  `user_objid` varchar(50) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `noloop` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `rulegroup` (`rulegroup`,`ruleset`),
  KEY `ruleset` (`ruleset`),
  CONSTRAINT `sys_rule_ibfk_1` FOREIGN KEY (`rulegroup`, `ruleset`) REFERENCES `sys_rulegroup` (`name`, `ruleset`),
  CONSTRAINT `sys_rule_ibfk_2` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule`
--

LOCK TABLES `sys_rule` WRITE;
/*!40000 ALTER TABLE `sys_rule` DISABLE KEYS */;
INSERT INTO `sys_rule` VALUES ('RUL-397eec50:18ac66691c0:-74a0','DEPLOYED','SET_STANDARD_SCHEDULE','marketbillingschedule','set-schedule','set standard schedule',NULL,50000,NULL,NULL,'2023-09-24 17:15:04','USR-6969defc:157f79cdab6:-7fe8','AFIEL',1),('RUL-437c586b:18ca10ff822:-3e1d','DEPLOYED','APPLY_ADVANCE_CREDITS','marketbilling','apply-credits','Apply advance payment credits',NULL,50000,NULL,NULL,'2023-12-26 10:58:53','USR-6969defc:157f79cdab6:-7fe8','AFIEL',1),('RUL-4396564d:18aeb37fa4d:-601b','DEPLOYED','MAP_DISCOUNT','marketpayment','map-account','MAP DISCOUNT ITEM',NULL,20000,NULL,NULL,'2023-10-01 20:49:55','USR-6969defc:157f79cdab6:-7fe8','AFIEL',1),('RUL-4396564d:18aeb37fa4d:-61e0','DEPLOYED','MAP_RENTAL_ADVANCE','marketpayment','map-account','MAP ADVANCE PAYMENT',NULL,1000,NULL,NULL,'2023-10-01 20:47:07','USR-6969defc:157f79cdab6:-7fe8','AFIEL',1),('RUL-4396564d:18aeb37fa4d:-72d8','DEPLOYED','APPLY_EXCESS_PAYMENT','marketpayment','after-apply-payment','Apply Excess Payment',NULL,50000,NULL,NULL,'2023-10-01 20:40:59','USR-6969defc:157f79cdab6:-7fe8','AFIEL',1),('RUL-4396564d:18aeb37fa4d:-7e7c','DEPLOYED','APPLY_BILLITEM_PAYMENT','marketpayment','apply-payment','Apply billitem payment',NULL,50000,NULL,NULL,'2023-10-01 20:38:13','USR-6969defc:157f79cdab6:-7fe8','AFIEL',0),('RUL-6e742724:18d9c37d0d5:-7da7','DEPLOYED','TRANSFER_UNIT_FEES','marketbilling','compute-fees','Transfer unit fees',NULL,50000,NULL,NULL,'2024-02-12 15:33:04','USR-6969defc:157f79cdab6:-7fe8','AFIEL',1),('RUL1091bf4a:18cbeb4d763:-5d60','DEPLOYED','COMPUTE_RENTAL_DAILY_INITIAL','marketbilling','compute-fees','compute daily rental fee (initial)',NULL,60000,NULL,NULL,'2023-12-31 20:32:50','USR-6969defc:157f79cdab6:-7fe8','AFIEL',1),('RUL1091bf4a:18cbeb4d763:-5de6','DEPLOYED','COMPUTE_MONTHLY_RENTAL_FEE','marketbilling','compute-fees','compute monthly rental fee',NULL,70000,NULL,NULL,'2023-12-31 20:32:14','USR-6969defc:157f79cdab6:-7fe8','AFIEL',1),('RUL1091bf4a:18cbeb4d763:-6f17','DEPLOYED','COMPUTE_RENTAL_DAILY_ADD_DAY','marketbilling','compute-fees','compute daily rental fee (non initial)',NULL,50000,NULL,NULL,'2023-12-31 20:22:20','USR-6969defc:157f79cdab6:-7fe8','AFIEL',1),('RUL1876b96d:18b0794d721:-7029','DEPLOYED','MAP_RENTAL_BILL_PREVIOUS','marketpayment','map-account','MAP RENTAL PREVIOUS MONTH BILL',NULL,60000,NULL,NULL,'2023-10-07 09:58:42','USR-6969defc:157f79cdab6:-7fe8','AFIEL',1),('RUL1b458836:18cc2a4fed5:-5b8a','DEPLOYED','APPLY_BILLITEM_PAYMENT_DAILY','marketpayment','apply-payment','Apply billitem payment for daily',NULL,50000,NULL,NULL,'2024-01-01 12:40:25','USR-6969defc:157f79cdab6:-7fe8','AFIEL',0),('RUL34c58731:18aea1f9197:-7ebd','APPROVED','ADD_DISCOUNT','marketpayment','initial','Add Discount',NULL,50000,NULL,NULL,'2023-10-01 15:26:35','USR-6969defc:157f79cdab6:-7fe8','AFIEL',1),('RUL4a55ddd7:18b329d84db:-7398','DEPLOYED','MAP_INTEREST_PREVIOUS','marketpayment','map-account','MAP INTEREST ACCOUNT FOR PREVIOUS',NULL,13000,NULL,NULL,'2023-10-15 17:30:54','USR-6969defc:157f79cdab6:-7fe8','AFIEL',1),('RUL4a55ddd7:18b329d84db:-7a85','DEPLOYED','MAP_INTEREST_CURRENT','marketpayment','map-account','MAP INTEREST ACCOUNT FOR CURRENT',NULL,12000,NULL,NULL,'2023-10-15 17:25:51','USR-6969defc:157f79cdab6:-7fe8','AFIEL',1),('RUL6330d0e7:18cc9dc49d7:-390b','DEPLOYED','COMPUTE_DAILY_SURCHARGE_SUPERSEDE','marketbilling','compute-surcharge','compute daily supersede existing',NULL,60000,NULL,NULL,'2024-01-02 20:19:59','USR-6969defc:157f79cdab6:-7fe8','AFIEL',1),('RUL6330d0e7:18cc9dc49d7:-443b','APPROVED','REMOVE_ZERO_VALUE','marketbilling','summary','REMOVE ZERO VALUE',NULL,50000,NULL,NULL,'2024-01-02 20:12:31','USR-6969defc:157f79cdab6:-7fe8','AFIEL',1),('RUL6330d0e7:18cc9dc49d7:-7c7d','DEPLOYED','COMPUTE_DAILY_SURCHARGE','marketbilling','compute-surcharge','compute daily surcharge',NULL,50000,NULL,NULL,'2024-01-02 19:27:49','USR-6969defc:157f79cdab6:-7fe8','AFIEL',1),('RUL6cc0d18a:18b0ebcc705:-109','DEPLOYED','MAP_SURCHARGE_PREVIOUS','marketpayment','map-account','MAP SURCHRAGE FOR PREVIOUS UNPAID',NULL,14000,NULL,NULL,'2023-10-09 10:04:55','USR-6969defc:157f79cdab6:-7fe8','AFIEL',1),('RUL6cc0d18a:18b0ebcc705:-4a6c','APPROVED','SUPERSEDE_OLD_INTEREST_ITEM','marketbilling','compute-interest','This is necessary to prevent double interest',NULL,1000,NULL,NULL,'2023-10-08 18:46:35','USR-6969defc:157f79cdab6:-7fe8','AFIEL',1),('RUL6cc0d18a:18b0ebcc705:-6379','APPROVED','ADD_INTEREST','marketbilling','compute-interest','Add 2% per month Interest to be triggered after due date ',NULL,50000,NULL,NULL,'2023-10-08 18:30:20','USR-6969defc:157f79cdab6:-7fe8','AFIEL',1),('RUL6cc0d18a:18b0ebcc705:-677a','APPROVED','COMPUTE_SURCHARGE_PREVIOUS','marketbilling','compute-surcharge','Computes surcharge for previous items in existing bill if it was not computed yet',NULL,50000,NULL,NULL,'2023-10-08 18:19:24','USR-6969defc:157f79cdab6:-7fe8','AFIEL',1),('RUL6cc0d18a:18b0ebcc705:-7e8e','APPROVED','COMPUTE_SURCHARGE_CURRENT','marketbilling','compute-surcharge','Computes the surcharge that is fired within the current bill',NULL,50000,NULL,NULL,'2023-10-08 18:08:19','USR-6969defc:157f79cdab6:-7fe8','AFIEL',1),('RUL6cc0d18a:18b0ebcc705:62','DEPLOYED','MAP_SURCHARGE_CURRENT','marketpayment','map-account','MAP SURCHARGE ACCOUNT FOR CURRENT',NULL,15000,NULL,NULL,'2023-10-09 10:06:41','USR-6969defc:157f79cdab6:-7fe8','AFIEL',1),('RUL6cc0d18a:18b0ebcc705:e','DEPLOYED','MAP_RENTAL_BILL_CURRENT','marketpayment','map-account','MAP RENTAL CURRENT BILL',NULL,50000,NULL,NULL,'2023-10-09 10:06:13','USR-6969defc:157f79cdab6:-7fe8','AFIEL',1),('RUL74f1631d:18af3c9fee8:-7db6','APPROVED','MAP_MARKET_RENTAL_TO_ORG','marketpayment','post-map-account','map market rental to org',NULL,50000,NULL,NULL,'2023-10-03 12:58:35','USR-6969defc:157f79cdab6:-7fe8','AFIEL',1),('RUL75b9f322:18c9fc081bd:-32b6','DEPLOYED','SET_BILL_DUEDATE_AND_VALIDITYDATE','marketbilling','summary','set bill validity date',NULL,50000,NULL,NULL,'2023-12-25 17:25:47','USR-6969defc:157f79cdab6:-7fe8','AFIEL',1);
/*!40000 ALTER TABLE `sys_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_action`
--

DROP TABLE IF EXISTS `sys_rule_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_action` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `actiondef_objid` varchar(50) DEFAULT NULL,
  `actiondef_name` varchar(50) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `parentid` (`parentid`),
  KEY `sys_rule_action_actiondef` (`actiondef_objid`),
  CONSTRAINT `sys_rule_action_actiondef` FOREIGN KEY (`actiondef_objid`) REFERENCES `sys_rule_actiondef` (`objid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sys_rule_action_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_action`
--

LOCK TABLES `sys_rule_action` WRITE;
/*!40000 ALTER TABLE `sys_rule_action` DISABLE KEYS */;
INSERT INTO `sys_rule_action` VALUES ('RA-2b99db48:18b122e2297:-7fcb','RUL6cc0d18a:18b0ebcc705:62','treasury.actions.AddCashReceiptItem','add-cashreceipt-item',0),('RA-2b99db48:18b122e2297:-7fe0','RUL6cc0d18a:18b0ebcc705:e','treasury.actions.AddCashReceiptItem','add-cashreceipt-item',0),('RA-2b99db48:18b122e2297:-7ff2','RUL6cc0d18a:18b0ebcc705:-109','treasury.actions.AddCashReceiptItem','add-cashreceipt-item',0),('RA-4b1e9177:18b07dbbb0f:-7ff5','RUL1876b96d:18b0794d721:-7029','treasury.actions.AddCashReceiptItem','add-cashreceipt-item',0),('RA-56ddf40f:18b0ecc7ce5:-7ff3','RUL6cc0d18a:18b0ebcc705:-677a','treasury.actions.AddSurchargeItem','add-surcharge-item',0),('RA-646e0493:18cca0eff43:-7fc5','RUL6330d0e7:18cc9dc49d7:-390b','treasury.actions.AddSurchargeItem','add-surcharge-item',0),('RA-702c7fbc:18cc352af48:-7ff4','RUL1b458836:18cc2a4fed5:-5b8a','treasury.actions.ApplyBillItemPayment','apply-billitem-payment',0),('RA-7b6570c3:18ca04b6ecd:-7ffa','RUL75b9f322:18c9fc081bd:-32b6','treasury.actions.SetBillValidityDate','set-bill-validity-date',0),('RA3b764887:18aeb32a002:-7fee','RUL-4396564d:18aeb37fa4d:-61e0','treasury.actions.AddCashReceiptItem','add-cashreceipt-item',0),('RA621b7fc5:18cbfcf2e31:-7fb0','RUL1091bf4a:18cbeb4d763:-5d60','market.actions.AddMarketBillItem','add-market-billitem',0),('RA621b7fc5:18cbfcf2e31:-7fc3','RUL1091bf4a:18cbeb4d763:-5de6','market.actions.AddMarketBillItem','add-market-billitem',0),('RA621b7fc5:18cbfcf2e31:-7fde','RUL1091bf4a:18cbeb4d763:-6f17','market.actions.AddMarketBillItem','add-market-billitem',0),('RA7056d297:18b32a137cc:-7fc2','RUL4a55ddd7:18b329d84db:-7398','treasury.actions.AddCashReceiptItem','add-cashreceipt-item',0),('RA7056d297:18b32a137cc:-7fd6','RUL4a55ddd7:18b329d84db:-7a85','treasury.actions.AddCashReceiptItem','add-cashreceipt-item',0),('RACT-397eec50:18ac66691c0:-6f8f','RUL-397eec50:18ac66691c0:-74a0','market.actions.SetMarketBillSchedule','set-market-bill-schedule',0),('RACT-437c586b:18ca10ff822:-2e92','RUL-437c586b:18ca10ff822:-3e1d','treasury.actions.ApplyBillItemCredit','apply-billitem-credit',0),('RACT-4396564d:18aeb37fa4d:-5bf7','RUL-4396564d:18aeb37fa4d:-601b','treasury.actions.AddCashReceiptItem','add-cashreceipt-item',0),('RACT-4396564d:18aeb37fa4d:-6fc1','RUL-4396564d:18aeb37fa4d:-72d8','treasury.actions.AddCreditBillItem','add-credit-billitem',0),('RACT-4396564d:18aeb37fa4d:-7332','RUL-4396564d:18aeb37fa4d:-7e7c','treasury.actions.ApplyBillItemPayment','apply-billitem-payment',0),('RACT-5b2f3581:18af3ee8091:-761e','RUL74f1631d:18af3c9fee8:-7db6','enterprise.actions.ThrowException','throw-exeception',0),('RACT-6e742724:18d9c37d0d5:-7490','RUL-6e742724:18d9c37d0d5:-7da7','treasury.actions.AddBillItem','add-billitem',0),('RACT34c58731:18aea1f9197:-5d01','RUL34c58731:18aea1f9197:-7ebd','treasury.actions.AddDiscountItem','add-discount-item',0),('RACT6330d0e7:18cc9dc49d7:-42da','RUL6330d0e7:18cc9dc49d7:-443b','treasury.actions.RemoveBillItem','remove-billitem',0),('RACT6330d0e7:18cc9dc49d7:-683f','RUL6330d0e7:18cc9dc49d7:-7c7d','treasury.actions.AddSurchargeItem','add-surcharge-item',0),('RACT6cc0d18a:18b0ebcc705:-4712','RUL6cc0d18a:18b0ebcc705:-4a6c','treasury.actions.SupersedeBillItem','supersede-billitem',0),('RACT6cc0d18a:18b0ebcc705:-5242','RUL6cc0d18a:18b0ebcc705:-6379','treasury.actions.AddInterestItem','add-interest-item',0),('RACT6cc0d18a:18b0ebcc705:-6c14','RUL6cc0d18a:18b0ebcc705:-7e8e','treasury.actions.AddSurchargeItem','add-surcharge-item',0),('RACT75b9f322:18c9fc081bd:-307b','RUL75b9f322:18c9fc081bd:-32b6','treasury.actions.SetBillDueDate','set-bill-due-date',0);
/*!40000 ALTER TABLE `sys_rule_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_action_param`
--

DROP TABLE IF EXISTS `sys_rule_action_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_action_param` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `actiondefparam_objid` varchar(100) DEFAULT NULL,
  `stringvalue` varchar(255) DEFAULT NULL,
  `booleanvalue` int(11) DEFAULT NULL,
  `var_objid` varchar(50) DEFAULT NULL,
  `var_name` varchar(50) DEFAULT NULL,
  `expr` longtext,
  `exprtype` varchar(25) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  `obj_key` varchar(50) DEFAULT NULL,
  `obj_value` varchar(255) DEFAULT NULL,
  `listvalue` longtext,
  `lov` varchar(50) DEFAULT NULL,
  `rangeoption` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `parentid` (`parentid`),
  KEY `var_objid` (`var_objid`),
  KEY `sys_rule_action_param_actiondefparam` (`actiondefparam_objid`),
  CONSTRAINT `sys_rule_action_param_actiondefparam` FOREIGN KEY (`actiondefparam_objid`) REFERENCES `sys_rule_actiondef_param` (`objid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sys_rule_action_param_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_action` (`objid`),
  CONSTRAINT `sys_rule_action_param_ibfk_2` FOREIGN KEY (`var_objid`) REFERENCES `sys_rule_condition_var` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_action_param`
--

LOCK TABLES `sys_rule_action_param` WRITE;
/*!40000 ALTER TABLE `sys_rule_action_param` DISABLE KEYS */;
INSERT INTO `sys_rule_action_param` VALUES ('RAP-2b99db48:18b122e2297:-7fc6','RA-2b99db48:18b122e2297:-7fcb','treasury.actions.AddCashReceiptItem.billcode',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MARKET_RENTAL_SURCHARGE','MARKET RENTAL SURCHARGE',NULL,NULL,NULL),('RAP-2b99db48:18b122e2297:-7fc7','RA-2b99db48:18b122e2297:-7fcb','treasury.actions.AddCashReceiptItem.orgid',NULL,NULL,'RCC-2b99db48:18b122e2297:-7fcc','ORGID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP-2b99db48:18b122e2297:-7fc8','RA-2b99db48:18b122e2297:-7fcb','treasury.actions.AddCashReceiptItem.billitem',NULL,NULL,'RC-2b99db48:18b122e2297:-7fd1','SURCHG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP-2b99db48:18b122e2297:-7fc9','RA-2b99db48:18b122e2297:-7fcb','treasury.actions.AddCashReceiptItem.amount',NULL,NULL,NULL,NULL,'AMT','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-2b99db48:18b122e2297:-7fca','RA-2b99db48:18b122e2297:-7fcb','treasury.actions.AddCashReceiptItem.groupid',NULL,NULL,NULL,NULL,'ORGID + \'_\' + UNITNO + \'_SURCHARGE_CURRENT\'','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-2b99db48:18b122e2297:-7fda','RA-2b99db48:18b122e2297:-7fe0','treasury.actions.AddCashReceiptItem.orgid',NULL,NULL,'RCC-2b99db48:18b122e2297:-7fe2','ORGID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP-2b99db48:18b122e2297:-7fdb','RA-2b99db48:18b122e2297:-7fe0','treasury.actions.AddCashReceiptItem.billcode',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MARKET_RENTAL','MARKET RENTAL',NULL,NULL,NULL),('RAP-2b99db48:18b122e2297:-7fdc','RA-2b99db48:18b122e2297:-7fe0','treasury.actions.AddCashReceiptItem.groupid',NULL,NULL,NULL,NULL,'ORGID + \'_\' + UNITNO + \'_RENTAL_CURRENT\'','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-2b99db48:18b122e2297:-7fdd','RA-2b99db48:18b122e2297:-7fe0','treasury.actions.AddCashReceiptItem.billitem',NULL,NULL,'RC-2b99db48:18b122e2297:-7fe9','BILLITEM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP-2b99db48:18b122e2297:-7fde','RA-2b99db48:18b122e2297:-7fe0','treasury.actions.AddCashReceiptItem.amount',NULL,NULL,NULL,NULL,'AMT + DISC','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-2b99db48:18b122e2297:-7fdf','RA-2b99db48:18b122e2297:-7fe0','treasury.actions.AddCashReceiptItem.sortorder',NULL,NULL,NULL,NULL,'2000','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-2b99db48:18b122e2297:-7fed','RA-2b99db48:18b122e2297:-7ff2','treasury.actions.AddCashReceiptItem.billcode',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MARKET_RENTAL_SURCHARGE_PREVIOUS','MARKET RENTAL PREVIOUS SURCHARGE',NULL,NULL,NULL),('RAP-2b99db48:18b122e2297:-7fee','RA-2b99db48:18b122e2297:-7ff2','treasury.actions.AddCashReceiptItem.orgid',NULL,NULL,'RCC-2b99db48:18b122e2297:-7ff3','ORGID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP-2b99db48:18b122e2297:-7fef','RA-2b99db48:18b122e2297:-7ff2','treasury.actions.AddCashReceiptItem.billitem',NULL,NULL,'RC-2b99db48:18b122e2297:-7ff8','SURCHG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP-2b99db48:18b122e2297:-7ff0','RA-2b99db48:18b122e2297:-7ff2','treasury.actions.AddCashReceiptItem.amount',NULL,NULL,NULL,NULL,'AMT','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-2b99db48:18b122e2297:-7ff1','RA-2b99db48:18b122e2297:-7ff2','treasury.actions.AddCashReceiptItem.groupid',NULL,NULL,NULL,NULL,'ORGID + \'_\' + UNITNO + \'_SURCHARGE_PREVIOUS\'','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-4b1e9177:18b07dbbb0f:-7fef','RA-4b1e9177:18b07dbbb0f:-7ff5','treasury.actions.AddCashReceiptItem.billcode',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MARKET_RENTAL_PREVIOUS','MARKET RENTAL PREVIOUS',NULL,NULL,NULL),('RAP-4b1e9177:18b07dbbb0f:-7ff0','RA-4b1e9177:18b07dbbb0f:-7ff5','treasury.actions.AddCashReceiptItem.groupid',NULL,NULL,NULL,NULL,'ORGID + \'_\'+ UNITNO + \'_RENTAL_PREVIOUS\'','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-4b1e9177:18b07dbbb0f:-7ff1','RA-4b1e9177:18b07dbbb0f:-7ff5','treasury.actions.AddCashReceiptItem.orgid',NULL,NULL,'RCONST6cc0d18a:18b0ebcc705:-3288','ORGID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP-4b1e9177:18b07dbbb0f:-7ff2','RA-4b1e9177:18b07dbbb0f:-7ff5','treasury.actions.AddCashReceiptItem.billitem',NULL,NULL,'RC-4b1e9177:18b07dbbb0f:-7ffd','BILLITEM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP-4b1e9177:18b07dbbb0f:-7ff3','RA-4b1e9177:18b07dbbb0f:-7ff5','treasury.actions.AddCashReceiptItem.amount',NULL,NULL,NULL,NULL,'AMT','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-4b1e9177:18b07dbbb0f:-7ff4','RA-4b1e9177:18b07dbbb0f:-7ff5','treasury.actions.AddCashReceiptItem.sortorder',NULL,NULL,NULL,NULL,'1000','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-56ddf40f:18b0ecc7ce5:-7fef','RA-56ddf40f:18b0ecc7ce5:-7ff3','treasury.actions.AddSurchargeItem.billitem',NULL,NULL,'RC-56ddf40f:18b0ecc7ce5:-7ffa','BILLITEM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP-56ddf40f:18b0ecc7ce5:-7ff0','RA-56ddf40f:18b0ecc7ce5:-7ff3','treasury.actions.AddSurchargeItem.billcode',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MARKET_RENTAL_SURCHARGE','MARKET RENTAL SURCHARGE',NULL,NULL,NULL),('RAP-56ddf40f:18b0ecc7ce5:-7ff1','RA-56ddf40f:18b0ecc7ce5:-7ff3','treasury.actions.AddSurchargeItem.amount',NULL,NULL,NULL,NULL,'AMT * 0.10','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-56ddf40f:18b0ecc7ce5:-7ff2','RA-56ddf40f:18b0ecc7ce5:-7ff3','treasury.actions.AddSurchargeItem.billdate',NULL,NULL,NULL,NULL,'FROMDATE','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-646e0493:18cca0eff43:-7fc1','RA-646e0493:18cca0eff43:-7fc5','treasury.actions.AddSurchargeItem.billitem',NULL,NULL,'RC-646e0493:18cca0eff43:-7fd0','BILLITEM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP-646e0493:18cca0eff43:-7fc2','RA-646e0493:18cca0eff43:-7fc5','treasury.actions.AddSurchargeItem.billcode',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MARKET_RENTAL_SURCHARGE','MARKET RENTAL SURCHARGE',NULL,NULL,NULL),('RAP-646e0493:18cca0eff43:-7fc3','RA-646e0493:18cca0eff43:-7fc5','treasury.actions.AddSurchargeItem.amount',NULL,NULL,NULL,NULL,'BAL * 0.10','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-646e0493:18cca0eff43:-7fc4','RA-646e0493:18cca0eff43:-7fc5','treasury.actions.AddSurchargeItem.billdate',NULL,NULL,NULL,NULL,'@DAYADD( BILLDATE, 1 )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-702c7fbc:18cc352af48:-7ff2','RA-702c7fbc:18cc352af48:-7ff4','treasury.actions.ApplyBillItemPayment.payment',NULL,NULL,'RC-702c7fbc:18cc352af48:-7ff8','PMT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP-702c7fbc:18cc352af48:-7ff3','RA-702c7fbc:18cc352af48:-7ff4','treasury.actions.ApplyBillItemPayment.billitem',NULL,NULL,'RC-702c7fbc:18cc352af48:-7ffc','BILLITEM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP-7b6570c3:18ca04b6ecd:-7ff8','RA-7b6570c3:18ca04b6ecd:-7ffa','treasury.actions.SetBillValidityDate.bill',NULL,NULL,'RC-7b6570c3:18ca04b6ecd:-7ffc','MBILL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP-7b6570c3:18ca04b6ecd:-7ff9','RA-7b6570c3:18ca04b6ecd:-7ffa','treasury.actions.SetBillValidityDate.date',NULL,NULL,NULL,NULL,'@IIF( MODE == \'DAILY\' , @IIF( TXNDATE > TODATE , TODATE , TXNDATE ),  TODATE )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP3b764887:18aeb32a002:-7feb','RA3b764887:18aeb32a002:-7fee','treasury.actions.AddCashReceiptItem.amount',NULL,NULL,NULL,NULL,'AMT','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP3b764887:18aeb32a002:-7fec','RA3b764887:18aeb32a002:-7fee','treasury.actions.AddCashReceiptItem.groupid',NULL,NULL,NULL,NULL,'\'BASIC\'','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP621b7fc5:18cbfcf2e31:-7faa','RA621b7fc5:18cbfcf2e31:-7fb0','market.actions.AddMarketBillItem.amount',NULL,NULL,NULL,NULL,'( @DAYDIFF( FROMDATE, @IIF( TXNDATE > TODATE , TODATE , TXNDATE ) ) + 1) * RATE','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP621b7fc5:18cbfcf2e31:-7fab','RA621b7fc5:18cbfcf2e31:-7fb0','market.actions.AddMarketBillItem.month',NULL,NULL,'RCC621b7fc5:18cbfcf2e31:-7fb3','MON',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP621b7fc5:18cbfcf2e31:-7fac','RA621b7fc5:18cbfcf2e31:-7fb0','market.actions.AddMarketBillItem.year',NULL,NULL,'RCC621b7fc5:18cbfcf2e31:-7fb4','YR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP621b7fc5:18cbfcf2e31:-7fad','RA621b7fc5:18cbfcf2e31:-7fb0','market.actions.AddMarketBillItem.account',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MARKET_RENTAL','MARKET RENTAL',NULL,NULL,NULL),('RAP621b7fc5:18cbfcf2e31:-7fae','RA621b7fc5:18cbfcf2e31:-7fb0','market.actions.AddMarketBillItem.billdate',NULL,NULL,NULL,NULL,'@IIF( TXNDATE > TODATE , TODATE , TXNDATE )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP621b7fc5:18cbfcf2e31:-7faf','RA621b7fc5:18cbfcf2e31:-7fb0','market.actions.AddMarketBillItem.remarks',NULL,NULL,NULL,NULL,'@DATEFORMAT( FROMDATE , \'MMM dd\'  )  +  \' to \' + @DATEFORMAT( @IIF( TXNDATE > TODATE , TODATE , TXNDATE ), \'MMM dd\' ); ','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP621b7fc5:18cbfcf2e31:-7fbf','RA621b7fc5:18cbfcf2e31:-7fc3','market.actions.AddMarketBillItem.account',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MARKET_RENTAL','MARKET RENTAL',NULL,NULL,NULL),('RAP621b7fc5:18cbfcf2e31:-7fc0','RA621b7fc5:18cbfcf2e31:-7fc3','market.actions.AddMarketBillItem.year',NULL,NULL,'RCC621b7fc5:18cbfcf2e31:-7fc9','YR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP621b7fc5:18cbfcf2e31:-7fc1','RA621b7fc5:18cbfcf2e31:-7fc3','market.actions.AddMarketBillItem.month',NULL,NULL,'RCC621b7fc5:18cbfcf2e31:-7fca','MON',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP621b7fc5:18cbfcf2e31:-7fc2','RA621b7fc5:18cbfcf2e31:-7fc3','market.actions.AddMarketBillItem.amount',NULL,NULL,NULL,NULL,'if (  RTYPE == \'DAY\'  ){\n    return RATE * @DAY( @MONTHEND( @DATE(  YR, MON , 1 ) )); \n};\nelse {\n    return RATE;\n};\n','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP621b7fc5:18cbfcf2e31:-7fd8','RA621b7fc5:18cbfcf2e31:-7fde','market.actions.AddMarketBillItem.remarks',NULL,NULL,NULL,NULL,'def _from = @DATEFORMAT( @DAYADD( LASTDATE, 1), \'MMM dd\' );\ndef _to = @DATEFORMAT( @IIF( TXNDATE > TODATE , TODATE , TXNDATE ), \'MMM dd\' );\n\nif( _from == _to ) {\n     return _from;\n}; \nelse {\n    return _from + \' to \' + _to;\n};\n  ','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP621b7fc5:18cbfcf2e31:-7fd9','RA621b7fc5:18cbfcf2e31:-7fde','market.actions.AddMarketBillItem.amount',NULL,NULL,NULL,NULL,'@DAYDIFF( LASTDATE, @IIF( TXNDATE > TODATE , TODATE , TXNDATE ) ) * RATE\n\n','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP621b7fc5:18cbfcf2e31:-7fda','RA621b7fc5:18cbfcf2e31:-7fde','market.actions.AddMarketBillItem.month',NULL,NULL,'RCC621b7fc5:18cbfcf2e31:-7fe1','MON',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP621b7fc5:18cbfcf2e31:-7fdb','RA621b7fc5:18cbfcf2e31:-7fde','market.actions.AddMarketBillItem.year',NULL,NULL,'RCC621b7fc5:18cbfcf2e31:-7fe2','YR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP621b7fc5:18cbfcf2e31:-7fdc','RA621b7fc5:18cbfcf2e31:-7fde','market.actions.AddMarketBillItem.account',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MARKET_RENTAL','MARKET RENTAL',NULL,NULL,NULL),('RAP621b7fc5:18cbfcf2e31:-7fdd','RA621b7fc5:18cbfcf2e31:-7fde','market.actions.AddMarketBillItem.billdate',NULL,NULL,NULL,NULL,'@IIF( TXNDATE > TODATE , TODATE , TXNDATE )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP7056d297:18b32a137cc:-7fbd','RA7056d297:18b32a137cc:-7fc2','treasury.actions.AddCashReceiptItem.billcode',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MARKET_RENTAL_INTEREST_PREVIOUS','MARKET RENTAL PREVIOUS INTEREST',NULL,NULL,NULL),('RAP7056d297:18b32a137cc:-7fbe','RA7056d297:18b32a137cc:-7fc2','treasury.actions.AddCashReceiptItem.orgid',NULL,NULL,'RCC7056d297:18b32a137cc:-7fc6','ORGID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP7056d297:18b32a137cc:-7fbf','RA7056d297:18b32a137cc:-7fc2','treasury.actions.AddCashReceiptItem.billitem',NULL,NULL,'RC7056d297:18b32a137cc:-7fc5','INT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP7056d297:18b32a137cc:-7fc0','RA7056d297:18b32a137cc:-7fc2','treasury.actions.AddCashReceiptItem.amount',NULL,NULL,NULL,NULL,'AMT','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP7056d297:18b32a137cc:-7fc1','RA7056d297:18b32a137cc:-7fc2','treasury.actions.AddCashReceiptItem.groupid',NULL,NULL,NULL,NULL,'ORGID + \'_\' + UNITNO + \'_INTEREST_PREVIOUS\'','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP7056d297:18b32a137cc:-7fd1','RA7056d297:18b32a137cc:-7fd6','treasury.actions.AddCashReceiptItem.groupid',NULL,NULL,NULL,NULL,'ORGID + \'_\' + UNITNO + \'_INTEREST_CURRENT\'','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP7056d297:18b32a137cc:-7fd2','RA7056d297:18b32a137cc:-7fd6','treasury.actions.AddCashReceiptItem.amount',NULL,NULL,NULL,NULL,'AMT','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP7056d297:18b32a137cc:-7fd3','RA7056d297:18b32a137cc:-7fd6','treasury.actions.AddCashReceiptItem.billitem',NULL,NULL,'RCOND4a55ddd7:18b329d84db:-795b','INT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP7056d297:18b32a137cc:-7fd4','RA7056d297:18b32a137cc:-7fd6','treasury.actions.AddCashReceiptItem.orgid',NULL,NULL,'RCC7056d297:18b32a137cc:-7fe3','ORGID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP7056d297:18b32a137cc:-7fd5','RA7056d297:18b32a137cc:-7fd6','treasury.actions.AddCashReceiptItem.billcode',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MARKET_RENTAL_INTEREST','MARKET RENTAL INTEREST',NULL,NULL,NULL),('RULACT-25e1447b:18b3301b582:-78bf','RA3b764887:18aeb32a002:-7fee','treasury.actions.AddCashReceiptItem.sortorder',NULL,NULL,NULL,NULL,'8000','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-25e1447b:18b3301b582:-7984','RA7056d297:18b32a137cc:-7fd6','treasury.actions.AddCashReceiptItem.sortorder',NULL,NULL,NULL,NULL,'7000','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-25e1447b:18b3301b582:-7a5e','RA7056d297:18b32a137cc:-7fc2','treasury.actions.AddCashReceiptItem.sortorder',NULL,NULL,NULL,NULL,'6000','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-25e1447b:18b3301b582:-7b38','RA-2b99db48:18b122e2297:-7ff2','treasury.actions.AddCashReceiptItem.sortorder',NULL,NULL,NULL,NULL,'5000','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-25e1447b:18b3301b582:-7c12','RA-2b99db48:18b122e2297:-7fcb','treasury.actions.AddCashReceiptItem.sortorder',NULL,NULL,NULL,NULL,'4000','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-25e1447b:18b3301b582:-7cc2','RACT-4396564d:18aeb37fa4d:-5bf7','treasury.actions.AddCashReceiptItem.sortorder',NULL,NULL,NULL,NULL,'3000','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-397eec50:18ac66691c0:-6a8b','RACT-397eec50:18ac66691c0:-6f8f','market.actions.SetMarketBillSchedule.duedate',NULL,NULL,NULL,NULL,'@FINDNEXTWORKDAY( @DATE( YR , MON ,  20 ), HOLIDAYS, 1 )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-397eec50:18ac66691c0:-6b1d','RACT-397eec50:18ac66691c0:-6f8f','market.actions.SetMarketBillSchedule.expirydate',NULL,NULL,NULL,NULL,'@MONTHEND( @DATE( YR ,  MON ,  1 ) )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-397eec50:18ac66691c0:-6b89','RACT-397eec50:18ac66691c0:-6f8f','market.actions.SetMarketBillSchedule.billdate',NULL,NULL,NULL,NULL,'@DATE( YR ,  MON ,  1 )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-397eec50:18ac66691c0:-6e30','RACT-397eec50:18ac66691c0:-6f8f','market.actions.SetMarketBillSchedule.todate',NULL,NULL,NULL,NULL,'@MONTHEND( @DATE( YR ,  MON ,  1 ) )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-397eec50:18ac66691c0:-6efd','RACT-397eec50:18ac66691c0:-6f8f','market.actions.SetMarketBillSchedule.fromdate',NULL,NULL,NULL,NULL,'@DATE( YR ,  MON ,  1 )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-397eec50:18ac66691c0:-6f4d','RACT-397eec50:18ac66691c0:-6f8f','market.actions.SetMarketBillSchedule.billschedule',NULL,NULL,'RCOND-397eec50:18ac66691c0:-747c','MBS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-3f0414a9:18aeeb9fa1d:-7bb1','RACT34c58731:18aea1f9197:-5d01','treasury.actions.AddDiscountItem.billcode',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MARKET_RENTAL_DISCOUNT','MARKET RENTAL DISCOUNT',NULL,NULL,NULL),('RULACT-437c586b:18ca10ff822:-2e66','RACT-437c586b:18ca10ff822:-2e92','treasury.actions.ApplyBillItemCredit.creditbillitem',NULL,NULL,'RCOND-437c586b:18ca10ff822:-3da8','CRBILL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-437c586b:18ca10ff822:-2e80','RACT-437c586b:18ca10ff822:-2e92','treasury.actions.ApplyBillItemCredit.billitem',NULL,NULL,'RCOND-437c586b:18ca10ff822:-3852','BILLITEM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-4396564d:18aeb37fa4d:-5b8a','RACT-4396564d:18aeb37fa4d:-5bf7','treasury.actions.AddCashReceiptItem.amount',NULL,NULL,NULL,NULL,'0 - AMT','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-4396564d:18aeb37fa4d:-6ed7','RACT-4396564d:18aeb37fa4d:-6fc1','treasury.actions.AddCreditBillItem.payment',NULL,NULL,'RCOND-4396564d:18aeb37fa4d:-724b','PMT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-4396564d:18aeb37fa4d:-6f16','RACT-4396564d:18aeb37fa4d:-6fc1','treasury.actions.AddCreditBillItem.amount',NULL,NULL,NULL,NULL,'AMT','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-4396564d:18aeb37fa4d:-7308','RACT-4396564d:18aeb37fa4d:-7332','treasury.actions.ApplyBillItemPayment.billitem',NULL,NULL,'RCOND-4396564d:18aeb37fa4d:-7d3e','BILLITEM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-4396564d:18aeb37fa4d:-7320','RACT-4396564d:18aeb37fa4d:-7332','treasury.actions.ApplyBillItemPayment.payment',NULL,NULL,'RCOND-4396564d:18aeb37fa4d:-7def','PMT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-5b2f3581:18af3ee8091:-7612','RACT-5b2f3581:18af3ee8091:-761e','enterprise.actions.ThrowException.msg',NULL,NULL,NULL,NULL,'\'Market center is mapped is  \' + ORGID','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-615043b8:18aeb53dbac:-7906','RACT-4396564d:18aeb37fa4d:-6fc1','treasury.actions.AddCreditBillItem.billcode',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MARKET_ADVANCE_PAYMENT','MARKET ADVANCE PAYMENT',NULL,NULL,NULL),('RULACT-615043b8:18aeb53dbac:-7b88','RA3b764887:18aeb32a002:-7fee','treasury.actions.AddCashReceiptItem.account',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ITEMACCT7842de84:157f95fa984:-58f1','INCOME FROM MARKET - RENTALS',NULL,NULL,NULL),('RULACT-6e742724:18d9c37d0d5:-7448','RACT-6e742724:18d9c37d0d5:-7490','treasury.actions.AddBillItem.amount',NULL,NULL,NULL,NULL,'100','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-6e742724:18d9c37d0d5:-746f','RACT-6e742724:18d9c37d0d5:-7490','treasury.actions.AddBillItem.billcode',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MARKET_TRANSFER_UNIT_FEE','MARKET TRANSFER FEE',NULL,NULL,NULL),('RULACT34c58731:18aea1f9197:-5cb0','RACT34c58731:18aea1f9197:-5d01','treasury.actions.AddDiscountItem.amount',NULL,NULL,NULL,NULL,'def disc = AMT * 0.05;\nif( PAMT < ( AMT - disc )) {\n      return 0;\n};\nelse {\n      return disc;\n}; ','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT34c58731:18aea1f9197:-5cdd','RACT34c58731:18aea1f9197:-5d01','treasury.actions.AddDiscountItem.billitem',NULL,NULL,'RCOND34c58731:18aea1f9197:-7124','BILLITEM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACT6330d0e7:18cc9dc49d7:-1a15','RA-646e0493:18cca0eff43:-7fc5','treasury.actions.AddSurchargeItem.supersededbillitem',NULL,NULL,'RC-646e0493:18cca0eff43:-7fd2','SUR_OLD',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACT6330d0e7:18cc9dc49d7:-42ce','RACT6330d0e7:18cc9dc49d7:-42da','treasury.actions.RemoveBillItem.billitem',NULL,NULL,'RCOND6330d0e7:18cc9dc49d7:-43b3','ABILLITEM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACT6330d0e7:18cc9dc49d7:-59d6','RACT6330d0e7:18cc9dc49d7:-683f','treasury.actions.AddSurchargeItem.billdate',NULL,NULL,NULL,NULL,'if( TXNDATE <= BILLDATE ) {\n     return BILLDATE;\n};\nelse if( TXNDATE >= EXPIRYDATE ) {\n     return EXPIRYDATE;\n};\nelse {\n     return @DAYADD( BILLDATE , 1 );\n};','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT6330d0e7:18cc9dc49d7:-6558','RACT6330d0e7:18cc9dc49d7:-683f','treasury.actions.AddSurchargeItem.amount',NULL,NULL,NULL,NULL,'if( TXNDATE <= BILLDATE ) {\n     return (BAL - RATE) * 0.10;\n};\nelse if( TXNDATE >= EXPIRYDATE ) {\n     return (BAL - RATE) * 0.10;\n};\nelse {\n     return BAL * 0.10;\n};','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT6330d0e7:18cc9dc49d7:-67d0','RACT6330d0e7:18cc9dc49d7:-683f','treasury.actions.AddSurchargeItem.billcode',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MARKET_RENTAL_SURCHARGE','MARKET RENTAL SURCHARGE',NULL,NULL,NULL),('RULACT6330d0e7:18cc9dc49d7:-680f','RACT6330d0e7:18cc9dc49d7:-683f','treasury.actions.AddSurchargeItem.billitem',NULL,NULL,'RCOND6330d0e7:18cc9dc49d7:-743d','BILLITEM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACT6cc0d18a:18b0ebcc705:-14f','RACT-4396564d:18aeb37fa4d:-5bf7','treasury.actions.AddCashReceiptItem.groupid',NULL,NULL,NULL,NULL,'ORGID + \'_\' + UNITNO + \'_ADVANCE\'','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT6cc0d18a:18b0ebcc705:-25a6','RACT-4396564d:18aeb37fa4d:-5bf7','treasury.actions.AddCashReceiptItem.billcode',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MARKET_RENTAL_DISCOUNT','MARKET RENTAL DISCOUNT',NULL,NULL,NULL),('RULACT6cc0d18a:18b0ebcc705:-46e6','RACT6cc0d18a:18b0ebcc705:-4712','treasury.actions.SupersedeBillItem.supersederitem',NULL,NULL,'RCOND6cc0d18a:18b0ebcc705:-48c2','NEWINT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACT6cc0d18a:18b0ebcc705:-4700','RACT6cc0d18a:18b0ebcc705:-4712','treasury.actions.SupersedeBillItem.billitem',NULL,NULL,'RCOND6cc0d18a:18b0ebcc705:-49f0','OLDINT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACT6cc0d18a:18b0ebcc705:-50c3','RACT6cc0d18a:18b0ebcc705:-5242','treasury.actions.AddInterestItem.billdate',NULL,NULL,NULL,NULL,'@DAYADD( DUEDATE , 1 )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT6cc0d18a:18b0ebcc705:-51ae','RACT6cc0d18a:18b0ebcc705:-5242','treasury.actions.AddInterestItem.amount',NULL,NULL,NULL,NULL,'def months = ( BYM - YM + 1 );\nif( months > 36 ) months = 36;\nreturn @ROUND( months * 0.02 * ( AMT + SUR ) );\n ','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT6cc0d18a:18b0ebcc705:-51ec','RACT6cc0d18a:18b0ebcc705:-5242','treasury.actions.AddInterestItem.billcode',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MARKET_RENTAL_INTEREST','MARKET RENTAL INTEREST',NULL,NULL,NULL),('RULACT6cc0d18a:18b0ebcc705:-521d','RACT6cc0d18a:18b0ebcc705:-5242','treasury.actions.AddInterestItem.billitem',NULL,NULL,'RCOND6cc0d18a:18b0ebcc705:-614e','BILLITEM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACT6cc0d18a:18b0ebcc705:-6aad','RACT6cc0d18a:18b0ebcc705:-6c14','treasury.actions.AddSurchargeItem.billdate',NULL,NULL,NULL,NULL,'@DAYADD( DUEDATE, 1 )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT6cc0d18a:18b0ebcc705:-6aff','RACT6cc0d18a:18b0ebcc705:-6c14','treasury.actions.AddSurchargeItem.amount',NULL,NULL,NULL,NULL,'AMT * 0.10','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT6cc0d18a:18b0ebcc705:-6b4b','RACT6cc0d18a:18b0ebcc705:-6c14','treasury.actions.AddSurchargeItem.billcode',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MARKET_RENTAL_SURCHARGE','MARKET RENTAL SURCHARGE',NULL,NULL,NULL),('RULACT6cc0d18a:18b0ebcc705:-6be4','RACT6cc0d18a:18b0ebcc705:-6c14','treasury.actions.AddSurchargeItem.billitem',NULL,NULL,'RCOND6cc0d18a:18b0ebcc705:-7d18','BILLITEM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACT75b9f322:18c9fc081bd:-3051','RACT75b9f322:18c9fc081bd:-307b','treasury.actions.SetBillDueDate.date',NULL,NULL,NULL,NULL,'@IIF( MODE == \'DAILY\' , @IIF( TXNDATE > TODATE , TODATE , TXNDATE ),  DUEDATE )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT75b9f322:18c9fc081bd:-3069','RACT75b9f322:18c9fc081bd:-307b','treasury.actions.SetBillDueDate.bill',NULL,NULL,'RC-7b6570c3:18ca04b6ecd:-7ffc','MBILL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_rule_action_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_actiondef`
--

DROP TABLE IF EXISTS `sys_rule_actiondef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_actiondef` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `actionname` varchar(50) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `actionclass` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_actiondef`
--

LOCK TABLES `sys_rule_actiondef` WRITE;
/*!40000 ALTER TABLE `sys_rule_actiondef` DISABLE KEYS */;
INSERT INTO `sys_rule_actiondef` VALUES ('enterprise.actions.PrintTest','print-test','Print Test',1,'print-test','ENTERPRISE','enterprise.actions.PrintTest'),('enterprise.actions.ThrowException','throw-exeception','Throw Exception',1,'throw-exeception','ENTERPRISE','enterprise.actions.ThrowException'),('market.actions.AddMarketBillItem','add-market-billitem','Add Market Bill Item',0,'add-market-billitem','MARKET','market.actions.AddMarketBillItem'),('market.actions.AddMarketBillSchedule','add-market-bill-schedule','Add Market Bill Schedule',0,'add-market-bill-schedule','MARKET','market.actions.AddMarketBillSchedule'),('market.actions.SetMarketBillSchedule','set-market-bill-schedule','Set Market Bill Schedule',1,'set-market-bill-schedule','MARKET','market.actions.SetMarketBillSchedule'),('treasury.actions.AddBillItem','add-billitem','Add Bill Item',2,'add-billitem','TREASURY','treasury.actions.AddBillItem'),('treasury.actions.AddCashReceiptItem','add-cashreceipt-item','Add Cash Receipt Item',1,'add-cashreceipt-item','TREASURY','treasury.actions.AddCashReceiptItem'),('treasury.actions.AddCreditBillItem','add-credit-billitem','Add Credit Bill Item',2,'add-credit-billitem','TREASURY','treasury.actions.AddCreditBillItem'),('treasury.actions.AddDiscountItem','add-discount-item','Add Discount',3,'add-discount-item','TREASURY','treasury.actions.AddDiscountItem'),('treasury.actions.AddExcessBillItem','add-excess-billitem','Add Excess Bill Item',2,'add-excess-billitem','TREASURY','treasury.actions.AddExcessBillItem'),('treasury.actions.AddInterestItem','add-interest-item','Add Interest',3,'add-interest-item','TREASURY','treasury.actions.AddInterestItem'),('treasury.actions.AddRevenueShareByOrg','add-share-by-org','Add Revenue Share By Org',1,'add-share-by-org','TREASURY','treasury.actions.AddRevenueShareByOrg'),('treasury.actions.AddSurchargeItem','add-surcharge-item','Add Surcharge',3,'add-surcharge-item','TREASURY','treasury.actions.AddSurchargeItem'),('treasury.actions.AddVarDate','add-vardate','Add Variable Date',1,'add-vardate','TREASURY','treasury.actions.AddVarDate'),('treasury.actions.AddVarInteger','add-var-integer','Add Var Integer',1,'add-var-integer','TREASURY','treasury.actions.AddVarInteger'),('treasury.actions.ApplyBillItemCredit','apply-billitem-credit','Apply Bill Item Credit',1,'apply-billitem-credit','TREASURY','treasury.actions.ApplyBillItemCredit'),('treasury.actions.ApplyBillItemPayment','apply-billitem-payment','Apply BillItem Payment',1,'apply-billitem-payment','TREASURY','treasury.actions.ApplyBillItemPayment'),('treasury.actions.ApplyPayment','apply-payment','Apply Payment',5,'apply-payment','TREASURY','treasury.actions.ApplyPayment'),('treasury.actions.ComputeFee','compute-fee','Compute Fee',0,'compute-fee','treasury','treasury.actions.ComputeFee'),('treasury.actions.RemoveBillItem','remove-billitem','Remove Bill Item',10,'remove-billitem','TREASURY','treasury.actions.RemoveBillItem'),('treasury.actions.RemoveDiscountItem','remove-discount','Remove Discount',1,'remove-discount','TREASURY','treasury.actions.RemoveDiscountItem'),('treasury.actions.SetBillDueDate','set-bill-due-date','Set Bill Due date',1,'set-bill-due-date','TREASURY','treasury.actions.SetBillDueDate'),('treasury.actions.SetBillItemAccount','set-billitem-account','Set Bill Item Account',4,'set-billitem-account','TREASURY','treasury.actions.SetBillItemAccount'),('treasury.actions.SetBillItemProperty','set-billitem-property','Set BillItem Property Value',10,'set-billitem-property','TREASURY','treasury.actions.SetBillItemProperty'),('treasury.actions.SetBillValidityDate','set-bill-validity-date','Set Bill Validity date',1,'set-bill-validity-date','TREASURY','treasury.actions.SetBillValidityDate'),('treasury.actions.SetCashReceiptItemRemarks','set-cashreceipt-item-remarks','Set Cash Receipt Item Remarks',1,'set-cashreceipt-item-remarks','TREASURY','treasury.actions.SetCashReceiptItemRemarks'),('treasury.actions.SupersedeBillItem','supersede-billitem','Supersede Bill Item',1,'supersede-billitem','TREASURY','treasury.actions.SupersedeBillItem'),('treasury.actions.UpdateBillItemAmount','update-billitem-amount','Update Bill Item Amount',1,'update-billitem-amount','TREASURY','treasury.actions.UpdateBillItemAmount');
/*!40000 ALTER TABLE `sys_rule_actiondef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_actiondef_param`
--

DROP TABLE IF EXISTS `sys_rule_actiondef_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_actiondef_param` (
  `objid` varchar(100) NOT NULL DEFAULT '',
  `parentid` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `datatype` varchar(50) DEFAULT NULL,
  `handler` varchar(50) DEFAULT NULL,
  `lookuphandler` varchar(50) DEFAULT NULL,
  `lookupkey` varchar(50) DEFAULT NULL,
  `lookupvalue` varchar(50) DEFAULT NULL,
  `vardatatype` varchar(50) DEFAULT NULL,
  `lovname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `parentid` (`parentid`),
  CONSTRAINT `sys_rule_actiondef_param_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_actiondef` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_actiondef_param`
--

LOCK TABLES `sys_rule_actiondef_param` WRITE;
/*!40000 ALTER TABLE `sys_rule_actiondef_param` DISABLE KEYS */;
INSERT INTO `sys_rule_actiondef_param` VALUES ('enterprise.actions.PrintTest.message','enterprise.actions.PrintTest','message',1,'Message',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('enterprise.actions.ThrowException.msg','enterprise.actions.ThrowException','msg',1,'Message',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('market.actions.AddMarketBillItem.account','market.actions.AddMarketBillItem','account',1,'Account',NULL,'lookup','itemaccount:lookup','objid','title',NULL,NULL),('market.actions.AddMarketBillItem.amount','market.actions.AddMarketBillItem','amount',2,'Amount',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('market.actions.AddMarketBillItem.billdate','market.actions.AddMarketBillItem','billdate',5,'Bill Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('market.actions.AddMarketBillItem.duedate','market.actions.AddMarketBillItem','duedate',6,'Due Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('market.actions.AddMarketBillItem.month','market.actions.AddMarketBillItem','month',4,'Month',NULL,'var',NULL,NULL,NULL,'integer',NULL),('market.actions.AddMarketBillItem.paymentplanid','market.actions.AddMarketBillItem','paymentplanid',7,'Payment Plan Refid',NULL,'var',NULL,NULL,NULL,'string',NULL),('market.actions.AddMarketBillItem.remarks','market.actions.AddMarketBillItem','remarks',8,'Remarks',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('market.actions.AddMarketBillItem.supersededid','market.actions.AddMarketBillItem','supersededid',9,'Superseded ID',NULL,'var',NULL,NULL,NULL,'string',NULL),('market.actions.AddMarketBillItem.year','market.actions.AddMarketBillItem','year',3,'Year',NULL,'var',NULL,NULL,NULL,'integer',NULL),('market.actions.AddMarketBillSchedule.month','market.actions.AddMarketBillSchedule','month',3,'Month',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('market.actions.AddMarketBillSchedule.params','market.actions.AddMarketBillSchedule','params',1,'Parameters',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('market.actions.AddMarketBillSchedule.year','market.actions.AddMarketBillSchedule','year',2,'Year',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('market.actions.SetMarketBillSchedule.billdate','market.actions.SetMarketBillSchedule','billdate',6,'Bill Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('market.actions.SetMarketBillSchedule.billingduedate','market.actions.SetMarketBillSchedule','billingduedate',7,'Billing Due Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('market.actions.SetMarketBillSchedule.billschedule','market.actions.SetMarketBillSchedule','billschedule',1,'Bill Schedule',NULL,'var',NULL,NULL,NULL,'market.facts.MarketBillSchedule',NULL),('market.actions.SetMarketBillSchedule.discdate','market.actions.SetMarketBillSchedule','discdate',8,'Discount Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('market.actions.SetMarketBillSchedule.duedate','market.actions.SetMarketBillSchedule','duedate',9,'Due Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('market.actions.SetMarketBillSchedule.expirydate','market.actions.SetMarketBillSchedule','expirydate',10,'Bill Expiry Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('market.actions.SetMarketBillSchedule.fromdate','market.actions.SetMarketBillSchedule','fromdate',2,'From Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('market.actions.SetMarketBillSchedule.readingdate','market.actions.SetMarketBillSchedule','readingdate',4,'Reading Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('market.actions.SetMarketBillSchedule.readingduedate','market.actions.SetMarketBillSchedule','readingduedate',5,'Reading Due Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('market.actions.SetMarketBillSchedule.todate','market.actions.SetMarketBillSchedule','todate',3,'To Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddBillItem.amount','treasury.actions.AddBillItem','amount',1,'Amount',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddBillItem.billcode','treasury.actions.AddBillItem','billcode',3,'Bill Code',NULL,'lookup','itemaccount:lookup','objid','title','string',NULL),('treasury.actions.AddBillItem.txntype','treasury.actions.AddBillItem','txntype',2,'Txn Type',NULL,'lookup','billitemtype:lookup','objid','title','string',NULL),('treasury.actions.AddCashReceiptItem.account','treasury.actions.AddCashReceiptItem','account',2,'Account',NULL,'lookup','revenueitem:lookup','objid','title',NULL,NULL),('treasury.actions.AddCashReceiptItem.amount','treasury.actions.AddCashReceiptItem','amount',3,'Amount',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddCashReceiptItem.billcode','treasury.actions.AddCashReceiptItem','billcode',9,'Bill Code',NULL,'lookup','itemaccount:lookup','objid','title','string',NULL),('treasury.actions.AddCashReceiptItem.billitem','treasury.actions.AddCashReceiptItem','billitem',1,'Bill Item',NULL,'var',NULL,NULL,NULL,'treasury.facts.AbstractBillItem',NULL),('treasury.actions.AddCashReceiptItem.groupid','treasury.actions.AddCashReceiptItem','groupid',5,'Group ID',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddCashReceiptItem.orgid','treasury.actions.AddCashReceiptItem','orgid',8,'Org ID',NULL,'var',NULL,NULL,NULL,'string',NULL),('treasury.actions.AddCashReceiptItem.remarks','treasury.actions.AddCashReceiptItem','remarks',6,'Remarks',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddCashReceiptItem.sortorder','treasury.actions.AddCashReceiptItem','sortorder',7,'Sort Order',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddCashReceiptItem.uid','treasury.actions.AddCashReceiptItem','uid',4,'UID',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddCreditBillItem.account','treasury.actions.AddCreditBillItem','account',1,'Account',NULL,'lookup','revenueitem:lookup','objid','title',NULL,NULL),('treasury.actions.AddCreditBillItem.amount','treasury.actions.AddCreditBillItem','amount',2,'Amount',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddCreditBillItem.billcode','treasury.actions.AddCreditBillItem','billcode',1,'Bill code',NULL,'lookup','itemaccount:lookup','objid','title','string',NULL),('treasury.actions.AddCreditBillItem.payment','treasury.actions.AddCreditBillItem','payment',3,'Payment',NULL,'var',NULL,NULL,NULL,'treasury.facts.Payment',NULL),('treasury.actions.AddCreditBillItem.reftype','treasury.actions.AddCreditBillItem','reftype',3,'Ref Type','string','string',NULL,NULL,NULL,'string',NULL),('treasury.actions.AddDiscountItem.account','treasury.actions.AddDiscountItem','account',3,'Account',NULL,'lookup','itemaccount:lookup','objid','title','string',NULL),('treasury.actions.AddDiscountItem.amount','treasury.actions.AddDiscountItem','amount',2,'Amount',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddDiscountItem.billcode','treasury.actions.AddDiscountItem','billcode',4,'Billcode',NULL,'lookup','itemaccount:lookup','objid','title','string',NULL),('treasury.actions.AddDiscountItem.billitem','treasury.actions.AddDiscountItem','billitem',1,'Bill Item',NULL,'var',NULL,NULL,NULL,'treasury.facts.AbstractBillItem',NULL),('treasury.actions.AddDiscountItem.discdate','treasury.actions.AddDiscountItem','discdate',5,'Discount Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddExcessBillItem.account','treasury.actions.AddExcessBillItem','account',1,'Account',NULL,'lookup','revenueitem:lookup','objid','title',NULL,NULL),('treasury.actions.AddExcessBillItem.amount','treasury.actions.AddExcessBillItem','amount',2,'Amount',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddInterestItem.account','treasury.actions.AddInterestItem','account',3,'Account',NULL,'lookup','itemaccount:lookup','objid','title',NULL,NULL),('treasury.actions.AddInterestItem.amount','treasury.actions.AddInterestItem','amount',2,'Amount',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddInterestItem.billcode','treasury.actions.AddInterestItem','billcode',4,'Billcode',NULL,'lookup','itemaccount:lookup','objid','title','string',NULL),('treasury.actions.AddInterestItem.billdate','treasury.actions.AddInterestItem','billdate',5,'Bill Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddInterestItem.billitem','treasury.actions.AddInterestItem','billitem',1,'Bill Item',NULL,'var',NULL,NULL,NULL,'treasury.facts.AbstractBillItem',NULL),('treasury.actions.AddInterestItem.supersededbillitem','treasury.actions.AddInterestItem','supersededbillitem',6,'Superseded BillItem',NULL,'var',NULL,NULL,NULL,'treasury.facts.AbstractBillItem',NULL),('treasury.actions.AddRevenueShareByOrg.amount','treasury.actions.AddRevenueShareByOrg','amount',4,'Amount',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddRevenueShareByOrg.org','treasury.actions.AddRevenueShareByOrg','org',3,'Org',NULL,'var',NULL,NULL,NULL,'enterprise.facts.Org',NULL),('treasury.actions.AddRevenueShareByOrg.payableaccount','treasury.actions.AddRevenueShareByOrg','payableaccount',2,'Payable Account',NULL,'lookup','payableaccount:lookup','objid','title','string',NULL),('treasury.actions.AddRevenueShareByOrg.refitem','treasury.actions.AddRevenueShareByOrg','refitem',1,'Ref Item',NULL,'var','revenueitem:lookup','objid','title','treasury.facts.AbstractBillItem',NULL),('treasury.actions.AddSurchargeItem.account','treasury.actions.AddSurchargeItem','account',3,'Account',NULL,'lookup','itemaccount:lookup','objid','title',NULL,NULL),('treasury.actions.AddSurchargeItem.amount','treasury.actions.AddSurchargeItem','amount',2,'Amount',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddSurchargeItem.billcode','treasury.actions.AddSurchargeItem','billcode',4,'Bill code',NULL,'lookup','itemaccount:lookup','objid','title','string',NULL),('treasury.actions.AddSurchargeItem.billdate','treasury.actions.AddSurchargeItem','billdate',6,'Bill Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddSurchargeItem.billitem','treasury.actions.AddSurchargeItem','billitem',1,'Bill Item',NULL,'var',NULL,NULL,NULL,'treasury.facts.AbstractBillItem',NULL),('treasury.actions.AddSurchargeItem.forwarded','treasury.actions.AddSurchargeItem','forwarded',7,'Forwarded',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddSurchargeItem.supersededbillitem','treasury.actions.AddSurchargeItem','supersededbillitem',8,'Superseded BillItem',NULL,'var',NULL,NULL,NULL,'treasury.facts.AbstractBillItem',NULL),('treasury.actions.AddSurchargeItem.txntype','treasury.actions.AddSurchargeItem','txntype',5,'Txn Type',NULL,'lookup','billitem_txntype:lookup','objid','title','string',NULL),('treasury.actions.AddVarDate.date','treasury.actions.AddVarDate','date',2,'Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddVarDate.tag','treasury.actions.AddVarDate','tag',1,'Tag','string','string',NULL,NULL,NULL,'string',NULL),('treasury.actions.AddVarInteger.tag','treasury.actions.AddVarInteger','tag',2,'Tag','string','string',NULL,NULL,NULL,'string',NULL),('treasury.actions.AddVarInteger.value','treasury.actions.AddVarInteger','value',1,'Value',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.ApplyBillItemCredit.billitem','treasury.actions.ApplyBillItemCredit','billitem',1,'Bill Item',NULL,'var',NULL,NULL,NULL,'treasury.facts.AbstractBillItem',NULL),('treasury.actions.ApplyBillItemCredit.creditbillitem','treasury.actions.ApplyBillItemCredit','creditbillitem',2,'Credit Bill Item',NULL,'var',NULL,NULL,NULL,'treasury.facts.CreditBillItem',NULL),('treasury.actions.ApplyBillItemPayment.billitem','treasury.actions.ApplyBillItemPayment','billitem',2,'Bill Item',NULL,'var',NULL,NULL,NULL,'treasury.facts.AbstractBillItem',NULL),('treasury.actions.ApplyBillItemPayment.payment','treasury.actions.ApplyBillItemPayment','payment',1,'Payment',NULL,'var',NULL,NULL,NULL,'treasury.facts.Payment',NULL),('treasury.actions.ApplyPayment.payment','treasury.actions.ApplyPayment','payment',1,'Payment',NULL,'var',NULL,NULL,NULL,'treasury.facts.Payment',NULL),('treasury.actions.ComputeFee.account','treasury.actions.ComputeFee','account',1,'Account',NULL,'lookup','revenueitem:lookup','objid','title',NULL,NULL),('treasury.actions.ComputeFee.amount','treasury.actions.ComputeFee','amount',2,'Amount',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.ComputeFee.remarks','treasury.actions.ComputeFee','remarks',3,'Remarks',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.RemoveBillItem.billitem','treasury.actions.RemoveBillItem','billitem',1,'Bill Item',NULL,'var',NULL,NULL,NULL,'treasury.facts.AbstractBillItem',NULL),('treasury.actions.RemoveDiscountItem.billitem','treasury.actions.RemoveDiscountItem','billitem',1,'Bill Item',NULL,'var',NULL,NULL,NULL,'treasury.facts.AbstractBillItem',NULL),('treasury.actions.SetBillDueDate.bill','treasury.actions.SetBillDueDate','bill',1,'Bill',NULL,'var',NULL,NULL,NULL,'treasury.facts.Bill',NULL),('treasury.actions.SetBillDueDate.date','treasury.actions.SetBillDueDate','date',2,'Due Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.SetBillItemAccount.account','treasury.actions.SetBillItemAccount','account',2,'Account',NULL,'lookup','revenueitem:lookup','objid','title',NULL,NULL),('treasury.actions.SetBillItemAccount.billcode','treasury.actions.SetBillItemAccount','billcode',3,'Billcode',NULL,'lookup','itemaccount:lookup','objid','title','string',NULL),('treasury.actions.SetBillItemAccount.billitem','treasury.actions.SetBillItemAccount','billitem',1,'Bill Item',NULL,'var',NULL,NULL,NULL,'treasury.facts.AbstractBillItem',NULL),('treasury.actions.SetBillItemProperty.billitem','treasury.actions.SetBillItemProperty','billitem',1,'Bill Item',NULL,'var',NULL,NULL,NULL,'treasury.facts.BillItem',NULL),('treasury.actions.SetBillItemProperty.fieldname','treasury.actions.SetBillItemProperty','fieldname',2,'Property Field Name',NULL,'fieldlist',NULL,'billitem',NULL,NULL,NULL),('treasury.actions.SetBillItemProperty.value','treasury.actions.SetBillItemProperty','value',3,'Value',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.SetBillValidityDate.bill','treasury.actions.SetBillValidityDate','bill',1,'Bill',NULL,'var',NULL,NULL,NULL,'treasury.facts.Bill',NULL),('treasury.actions.SetBillValidityDate.date','treasury.actions.SetBillValidityDate','date',2,'Validity Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.SetCashReceiptItemRemarks.receiptitem','treasury.actions.SetCashReceiptItemRemarks','receiptitem',1,'Receipt Item',NULL,'var',NULL,NULL,NULL,'treasury.facts.CashReceiptItem',NULL),('treasury.actions.SetCashReceiptItemRemarks.remarks','treasury.actions.SetCashReceiptItemRemarks','remarks',2,'Remarks',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.SetCashReceiptItemRemarks.type','treasury.actions.SetCashReceiptItemRemarks','type',3,'Type',NULL,'lov',NULL,NULL,NULL,NULL,'UPDATE_TYPE'),('treasury.actions.SupersedeBillItem.billitem','treasury.actions.SupersedeBillItem','billitem',1,'Bill Item',NULL,'var',NULL,NULL,NULL,'treasury.facts.AbstractBillItem',NULL),('treasury.actions.SupersedeBillItem.supersederitem','treasury.actions.SupersedeBillItem','supersederitem',2,'Superseder BillItem',NULL,'var',NULL,NULL,NULL,'treasury.facts.AbstractBillItem',NULL),('treasury.actions.UpdateBillItemAmount.amount','treasury.actions.UpdateBillItemAmount','amount',3,'Amount',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.UpdateBillItemAmount.billitem','treasury.actions.UpdateBillItemAmount','billitem',1,'Bill Item',NULL,'var',NULL,NULL,NULL,'treasury.facts.BillItem',NULL),('treasury.actions.UpdateBillItemAmount.type','treasury.actions.UpdateBillItemAmount','type',2,'Type',NULL,'lov',NULL,NULL,NULL,NULL,'UPDATE_BILLITEM_TYPE');
/*!40000 ALTER TABLE `sys_rule_actiondef_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_condition`
--

DROP TABLE IF EXISTS `sys_rule_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_condition` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `fact_name` varchar(50) DEFAULT NULL,
  `fact_objid` varchar(50) DEFAULT NULL,
  `varname` varchar(50) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  `ruletext` longtext,
  `displaytext` longtext,
  `dynamic_datatype` varchar(50) DEFAULT NULL,
  `dynamic_key` varchar(50) DEFAULT NULL,
  `dynamic_value` varchar(50) DEFAULT NULL,
  `notexist` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `fact_objid` (`fact_objid`),
  KEY `parentid` (`parentid`),
  CONSTRAINT `sys_rule_condition_fact` FOREIGN KEY (`fact_objid`) REFERENCES `sys_rule_fact` (`objid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sys_rule_condition_ibfk_1` FOREIGN KEY (`fact_objid`) REFERENCES `sys_rule_fact` (`objid`),
  CONSTRAINT `sys_rule_condition_ibfk_2` FOREIGN KEY (`parentid`) REFERENCES `sys_rule` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_condition`
--

LOCK TABLES `sys_rule_condition` WRITE;
/*!40000 ALTER TABLE `sys_rule_condition` DISABLE KEYS */;
INSERT INTO `sys_rule_condition` VALUES ('RC-2b99db48:18b122e2297:-7fce','RUL6cc0d18a:18b0ebcc705:62','market.facts.MarketAccount','market.facts.MarketAccount','ACCT',0,NULL,NULL,NULL,NULL,NULL,0),('RC-2b99db48:18b122e2297:-7fd1','RUL6cc0d18a:18b0ebcc705:62','treasury.facts.SurchargeItem','treasury.facts.SurchargeItem','SURCHG',4,NULL,NULL,NULL,NULL,NULL,0),('RC-2b99db48:18b122e2297:-7fd4','RUL6cc0d18a:18b0ebcc705:62','treasury.facts.PaymentItem','treasury.facts.PaymentItem',NULL,5,NULL,NULL,NULL,NULL,NULL,0),('RC-2b99db48:18b122e2297:-7fd7','RUL6cc0d18a:18b0ebcc705:62','market.facts.MarketBillItem','market.facts.MarketBillItem','BILLITEM',2,NULL,NULL,NULL,NULL,NULL,0),('RC-2b99db48:18b122e2297:-7fd9','RUL6cc0d18a:18b0ebcc705:62','market.facts.MarketBill','market.facts.MarketBill','MBILL',1,NULL,NULL,NULL,NULL,NULL,0),('RC-2b99db48:18b122e2297:-7fe3','RUL6cc0d18a:18b0ebcc705:e','market.facts.MarketAccount','market.facts.MarketAccount','ACCT',0,NULL,NULL,NULL,NULL,NULL,0),('RC-2b99db48:18b122e2297:-7fe5','RUL6cc0d18a:18b0ebcc705:e','market.facts.MarketBill','market.facts.MarketBill','MBILL',1,NULL,NULL,NULL,NULL,NULL,0),('RC-2b99db48:18b122e2297:-7fe9','RUL6cc0d18a:18b0ebcc705:e','market.facts.MarketBillItem','market.facts.MarketBillItem','BILLITEM',2,NULL,NULL,NULL,NULL,NULL,0),('RC-2b99db48:18b122e2297:-7fec','RUL6cc0d18a:18b0ebcc705:e','treasury.facts.PaymentItem','treasury.facts.PaymentItem',NULL,3,NULL,NULL,NULL,NULL,NULL,0),('RC-2b99db48:18b122e2297:-7ff5','RUL6cc0d18a:18b0ebcc705:-109','market.facts.MarketAccount','market.facts.MarketAccount','ACCT',0,NULL,NULL,NULL,NULL,NULL,0),('RC-2b99db48:18b122e2297:-7ff8','RUL6cc0d18a:18b0ebcc705:-109','treasury.facts.SurchargeItem','treasury.facts.SurchargeItem','SURCHG',4,NULL,NULL,NULL,NULL,NULL,0),('RC-2b99db48:18b122e2297:-7ffb','RUL6cc0d18a:18b0ebcc705:-109','treasury.facts.PaymentItem','treasury.facts.PaymentItem',NULL,5,NULL,NULL,NULL,NULL,NULL,0),('RC-2b99db48:18b122e2297:-7ffe','RUL6cc0d18a:18b0ebcc705:-109','market.facts.MarketBillItem','market.facts.MarketBillItem','BILLITEM',2,NULL,NULL,NULL,NULL,NULL,0),('RC-2b99db48:18b122e2297:-8000','RUL6cc0d18a:18b0ebcc705:-109','market.facts.MarketBill','market.facts.MarketBill','MBILL',1,NULL,NULL,NULL,NULL,NULL,0),('RC-4b1e9177:18b07dbbb0f:-7ff9','RUL1876b96d:18b0794d721:-7029','market.facts.MarketBill','market.facts.MarketBill','MBILL',1,NULL,NULL,NULL,NULL,NULL,0),('RC-4b1e9177:18b07dbbb0f:-7ffd','RUL1876b96d:18b0794d721:-7029','market.facts.MarketBillItem','market.facts.MarketBillItem','BILLITEM',2,NULL,NULL,NULL,NULL,NULL,0),('RC-4b1e9177:18b07dbbb0f:-8000','RUL1876b96d:18b0794d721:-7029','treasury.facts.PaymentItem','treasury.facts.PaymentItem',NULL,3,NULL,NULL,NULL,NULL,NULL,0),('RC-56ddf40f:18b0ecc7ce5:-7ff5','RUL6cc0d18a:18b0ebcc705:-677a','market.facts.MarketBill','market.facts.MarketBill','MBILL',0,NULL,NULL,NULL,NULL,NULL,0),('RC-56ddf40f:18b0ecc7ce5:-7ffa','RUL6cc0d18a:18b0ebcc705:-677a','market.facts.MarketBillItem','market.facts.MarketBillItem','BILLITEM',2,NULL,NULL,NULL,NULL,NULL,0),('RC-56ddf40f:18b0ecc7ce5:-7ffc','RUL6cc0d18a:18b0ebcc705:-677a','market.facts.MarketBillSchedule','market.facts.MarketBillSchedule','MBS',3,NULL,NULL,NULL,NULL,NULL,0),('RC-56ddf40f:18b0ecc7ce5:-8000','RUL6cc0d18a:18b0ebcc705:-677a','treasury.facts.SurchargeItem','treasury.facts.SurchargeItem','',4,NULL,NULL,NULL,NULL,NULL,1),('RC-646e0493:18cca0eff43:-7fc9','RUL6330d0e7:18cc9dc49d7:-390b','market.facts.MarketBill','market.facts.MarketBill','MBILL',0,NULL,NULL,NULL,NULL,NULL,0),('RC-646e0493:18cca0eff43:-7fcb','RUL6330d0e7:18cc9dc49d7:-390b','treasury.facts.TransactionDate','treasury.facts.TransactionDate',NULL,1,NULL,NULL,NULL,NULL,NULL,0),('RC-646e0493:18cca0eff43:-7fd0','RUL6330d0e7:18cc9dc49d7:-390b','market.facts.MarketBillItem','market.facts.MarketBillItem','BILLITEM',2,NULL,NULL,NULL,NULL,NULL,0),('RC-646e0493:18cca0eff43:-7fd2','RUL6330d0e7:18cc9dc49d7:-390b','treasury.facts.SurchargeItem','treasury.facts.SurchargeItem','SUR_OLD',3,NULL,NULL,NULL,NULL,NULL,0),('RC-702c7fbc:18cc352af48:-7ff6','RUL1b458836:18cc2a4fed5:-5b8a','market.facts.MarketBill','market.facts.MarketBill','MBILL',3,NULL,NULL,NULL,NULL,NULL,0),('RC-702c7fbc:18cc352af48:-7ff8','RUL1b458836:18cc2a4fed5:-5b8a','treasury.facts.Payment','treasury.facts.Payment','PMT',0,NULL,NULL,NULL,NULL,NULL,0),('RC-702c7fbc:18cc352af48:-7ffc','RUL1b458836:18cc2a4fed5:-5b8a','market.facts.MarketBillItem','market.facts.MarketBillItem','BILLITEM',1,NULL,NULL,NULL,NULL,NULL,0),('RC-702c7fbc:18cc352af48:-8000','RUL1b458836:18cc2a4fed5:-5b8a','market.facts.MarketBillItem','market.facts.MarketBillItem','',2,NULL,NULL,NULL,NULL,NULL,1),('RC-7b6570c3:18ca04b6ecd:-7ffc','RUL75b9f322:18c9fc081bd:-32b6','market.facts.MarketBill','market.facts.MarketBill','MBILL',0,NULL,NULL,NULL,NULL,NULL,0),('RC-7b6570c3:18ca04b6ecd:-7ffe','RUL75b9f322:18c9fc081bd:-32b6','market.facts.MarketBillSchedule','market.facts.MarketBillSchedule','MBS',1,NULL,NULL,NULL,NULL,NULL,0),('RC-7b6570c3:18ca04b6ecd:-8000','RUL75b9f322:18c9fc081bd:-32b6','treasury.facts.TransactionDate','treasury.facts.TransactionDate',NULL,2,NULL,NULL,NULL,NULL,NULL,0),('RC621b7fc5:18cbfcf2e31:-7fb2','RUL1091bf4a:18cbeb4d763:-5d60','treasury.facts.TransactionDate','treasury.facts.TransactionDate',NULL,2,NULL,NULL,NULL,NULL,NULL,0),('RC621b7fc5:18cbfcf2e31:-7fb8','RUL1091bf4a:18cbeb4d763:-5d60','market.facts.MarketBill','market.facts.MarketBill','MBILL',1,NULL,NULL,NULL,NULL,NULL,0),('RC621b7fc5:18cbfcf2e31:-7fba','RUL1091bf4a:18cbeb4d763:-5d60','market.facts.MarketBillSchedule','market.facts.MarketBillSchedule','MBS',3,NULL,NULL,NULL,NULL,NULL,0),('RC621b7fc5:18cbfcf2e31:-7fbd','RUL1091bf4a:18cbeb4d763:-5d60','market.facts.MarketBillItem','market.facts.MarketBillItem','',2,NULL,NULL,NULL,NULL,NULL,1),('RC621b7fc5:18cbfcf2e31:-7fc5','RUL1091bf4a:18cbeb4d763:-5de6','market.facts.MarketBillSchedule','market.facts.MarketBillSchedule','MBS',1,NULL,NULL,NULL,NULL,NULL,0),('RC621b7fc5:18cbfcf2e31:-7fcb','RUL1091bf4a:18cbeb4d763:-5de6','market.facts.MarketBill','market.facts.MarketBill','MBILL',1,NULL,NULL,NULL,NULL,NULL,0),('RC621b7fc5:18cbfcf2e31:-7fe0','RUL1091bf4a:18cbeb4d763:-6f17','treasury.facts.TransactionDate','treasury.facts.TransactionDate',NULL,1,NULL,NULL,NULL,NULL,NULL,0),('RC621b7fc5:18cbfcf2e31:-7fe6','RUL1091bf4a:18cbeb4d763:-6f17','market.facts.MarketBill','market.facts.MarketBill','MBILL',0,NULL,NULL,NULL,NULL,NULL,0),('RC621b7fc5:18cbfcf2e31:-7fed','RUL1091bf4a:18cbeb4d763:-6f17','market.facts.MarketBillItem','market.facts.MarketBillItem',NULL,2,NULL,NULL,NULL,NULL,NULL,0),('RC7056d297:18b32a137cc:-7fc5','RUL4a55ddd7:18b329d84db:-7398','treasury.facts.InterestItem','treasury.facts.InterestItem','INT',4,NULL,NULL,NULL,NULL,NULL,0),('RC7056d297:18b32a137cc:-7fc8','RUL4a55ddd7:18b329d84db:-7398','market.facts.MarketAccount','market.facts.MarketAccount','ACCT',0,NULL,NULL,NULL,NULL,NULL,0),('RC7056d297:18b32a137cc:-7fcb','RUL4a55ddd7:18b329d84db:-7398','treasury.facts.PaymentItem','treasury.facts.PaymentItem',NULL,5,NULL,NULL,NULL,NULL,NULL,0),('RC7056d297:18b32a137cc:-7fce','RUL4a55ddd7:18b329d84db:-7398','market.facts.MarketBillItem','market.facts.MarketBillItem','BILLITEM',2,NULL,NULL,NULL,NULL,NULL,0),('RC7056d297:18b32a137cc:-7fd0','RUL4a55ddd7:18b329d84db:-7398','market.facts.MarketBill','market.facts.MarketBill','MBILL',1,NULL,NULL,NULL,NULL,NULL,0),('RC7056d297:18b32a137cc:-7fd8','RUL4a55ddd7:18b329d84db:-7a85','market.facts.MarketBill','market.facts.MarketBill','MBILL',1,NULL,NULL,NULL,NULL,NULL,0),('RC7056d297:18b32a137cc:-7fdb','RUL4a55ddd7:18b329d84db:-7a85','market.facts.MarketBillItem','market.facts.MarketBillItem','BILLITEM',2,NULL,NULL,NULL,NULL,NULL,0),('RC7056d297:18b32a137cc:-7fde','RUL4a55ddd7:18b329d84db:-7a85','treasury.facts.PaymentItem','treasury.facts.PaymentItem',NULL,5,NULL,NULL,NULL,NULL,NULL,0),('RC7056d297:18b32a137cc:-7fe4','RUL4a55ddd7:18b329d84db:-7a85','market.facts.MarketAccount','market.facts.MarketAccount','ACCT',0,NULL,NULL,NULL,NULL,NULL,0),('RCOND-397eec50:18ac66691c0:-6fc0','RUL-397eec50:18ac66691c0:-74a0','treasury.facts.HolidayFact','treasury.facts.HolidayFact','HOLIDAYS',1,NULL,NULL,NULL,NULL,NULL,0),('RCOND-397eec50:18ac66691c0:-747c','RUL-397eec50:18ac66691c0:-74a0','market.facts.MarketBillSchedule','market.facts.MarketBillSchedule','MBS',0,NULL,NULL,NULL,NULL,NULL,0),('RCOND-437c586b:18ca10ff822:-33da','RUL-437c586b:18ca10ff822:-3e1d','market.facts.MarketBillItem','market.facts.MarketBillItem','',2,NULL,NULL,NULL,NULL,NULL,1),('RCOND-437c586b:18ca10ff822:-3852','RUL-437c586b:18ca10ff822:-3e1d','market.facts.MarketBillItem','market.facts.MarketBillItem','BILLITEM',1,NULL,NULL,NULL,NULL,NULL,0),('RCOND-437c586b:18ca10ff822:-3da8','RUL-437c586b:18ca10ff822:-3e1d','treasury.facts.CreditBillItem','treasury.facts.CreditBillItem','CRBILL',0,NULL,NULL,NULL,NULL,NULL,0),('RCOND-4396564d:18aeb37fa4d:-5f88','RUL-4396564d:18aeb37fa4d:-601b','treasury.facts.DiscountItem','treasury.facts.DiscountItem','DISC',0,NULL,NULL,NULL,NULL,NULL,0),('RCOND-4396564d:18aeb37fa4d:-6129','RUL-4396564d:18aeb37fa4d:-61e0','treasury.facts.CreditBillItem','treasury.facts.CreditBillItem','CRBILL',2,NULL,NULL,NULL,NULL,NULL,0),('RCOND-4396564d:18aeb37fa4d:-706a','RUL-4396564d:18aeb37fa4d:-72d8','treasury.facts.DiscountItem','treasury.facts.DiscountItem','',1,NULL,NULL,NULL,NULL,NULL,1),('RCOND-4396564d:18aeb37fa4d:-724b','RUL-4396564d:18aeb37fa4d:-72d8','treasury.facts.Payment','treasury.facts.Payment','PMT',0,NULL,NULL,NULL,NULL,NULL,0),('RCOND-4396564d:18aeb37fa4d:-78aa','RUL-4396564d:18aeb37fa4d:-7e7c','market.facts.MarketBillItem','market.facts.MarketBillItem','',2,NULL,NULL,NULL,NULL,NULL,1),('RCOND-4396564d:18aeb37fa4d:-7d3e','RUL-4396564d:18aeb37fa4d:-7e7c','market.facts.MarketBillItem','market.facts.MarketBillItem','BILLITEM',1,NULL,NULL,NULL,NULL,NULL,0),('RCOND-4396564d:18aeb37fa4d:-7def','RUL-4396564d:18aeb37fa4d:-7e7c','treasury.facts.Payment','treasury.facts.Payment','PMT',0,NULL,NULL,NULL,NULL,NULL,0),('RCOND-5b2f3581:18af3ee8091:-7bfd','RUL74f1631d:18af3c9fee8:-7db6','treasury.facts.CashReceiptItem','treasury.facts.CashReceiptItem','CRI',0,NULL,NULL,NULL,NULL,NULL,0),('RCOND-6e742724:18d9c37d0d5:-7943','RUL-6e742724:18d9c37d0d5:-7da7','market.facts.MarketTxn','market.facts.MarketTxn',NULL,0,NULL,NULL,NULL,NULL,NULL,0),('RCOND13be5044:18ccdf11ff7:-7828','RUL6330d0e7:18cc9dc49d7:-7c7d','market.facts.MarketBillSchedule','market.facts.MarketBillSchedule','MBS',4,NULL,NULL,NULL,NULL,NULL,0),('RCOND1b458836:18cc2a4fed5:-3d7c','RUL-437c586b:18ca10ff822:-3e1d','market.facts.MarketBill','market.facts.MarketBill','MBILL',3,NULL,NULL,NULL,NULL,NULL,0),('RCOND1b458836:18cc2a4fed5:-5d00','RUL-4396564d:18aeb37fa4d:-7e7c','market.facts.MarketBill','market.facts.MarketBill','MBILL',3,NULL,NULL,NULL,NULL,NULL,0),('RCOND1b458836:18cc2a4fed5:-75f7','RUL1091bf4a:18cbeb4d763:-6f17','market.facts.MarketBillSchedule','market.facts.MarketBillSchedule','MBS',3,NULL,NULL,NULL,NULL,NULL,0),('RCOND34c58731:18aea1f9197:-6402','RUL34c58731:18aea1f9197:-7ebd','treasury.facts.Payment','treasury.facts.Payment','PMT',4,NULL,NULL,NULL,NULL,NULL,0),('RCOND34c58731:18aea1f9197:-7124','RUL34c58731:18aea1f9197:-7ebd','market.facts.MarketBillItem','market.facts.MarketBillItem','BILLITEM',2,NULL,NULL,NULL,NULL,NULL,0),('RCOND34c58731:18aea1f9197:-7421','RUL34c58731:18aea1f9197:-7ebd','market.facts.MarketBill','market.facts.MarketBill','MBILL',1,NULL,NULL,NULL,NULL,NULL,0),('RCOND34c58731:18aea1f9197:-74e4','RUL34c58731:18aea1f9197:-7ebd','treasury.facts.TransactionDate','treasury.facts.TransactionDate',NULL,0,NULL,NULL,NULL,NULL,NULL,0),('RCOND4a55ddd7:18b329d84db:-795b','RUL4a55ddd7:18b329d84db:-7a85','treasury.facts.InterestItem','treasury.facts.InterestItem','INT',4,NULL,NULL,NULL,NULL,NULL,0),('RCOND6330d0e7:18cc9dc49d7:-43b3','RUL6330d0e7:18cc9dc49d7:-443b','treasury.facts.AbstractBillItem','treasury.facts.AbstractBillItem','ABILLITEM',0,NULL,NULL,NULL,NULL,NULL,0),('RCOND6330d0e7:18cc9dc49d7:-693f','RUL6330d0e7:18cc9dc49d7:-7c7d','treasury.facts.SurchargeItem','treasury.facts.SurchargeItem','',3,NULL,NULL,NULL,NULL,NULL,1),('RCOND6330d0e7:18cc9dc49d7:-743d','RUL6330d0e7:18cc9dc49d7:-7c7d','market.facts.MarketBillItem','market.facts.MarketBillItem','BILLITEM',2,NULL,NULL,NULL,NULL,NULL,0),('RCOND6330d0e7:18cc9dc49d7:-793d','RUL6330d0e7:18cc9dc49d7:-7c7d','treasury.facts.TransactionDate','treasury.facts.TransactionDate',NULL,1,NULL,NULL,NULL,NULL,NULL,0),('RCOND6330d0e7:18cc9dc49d7:-7afc','RUL6330d0e7:18cc9dc49d7:-7c7d','market.facts.MarketBill','market.facts.MarketBill','MBILL',0,NULL,NULL,NULL,NULL,NULL,0),('RCOND6cc0d18a:18b0ebcc705:-2db','RUL-4396564d:18aeb37fa4d:-601b','market.facts.MarketAccount','market.facts.MarketAccount','ACCT',1,NULL,NULL,NULL,NULL,NULL,0),('RCOND6cc0d18a:18b0ebcc705:-32c8','RUL1876b96d:18b0794d721:-7029','market.facts.MarketAccount','market.facts.MarketAccount','ACCT',0,NULL,NULL,NULL,NULL,NULL,0),('RCOND6cc0d18a:18b0ebcc705:-48c2','RUL6cc0d18a:18b0ebcc705:-4a6c','treasury.facts.InterestItem','treasury.facts.InterestItem','NEWINT',1,NULL,NULL,NULL,NULL,NULL,0),('RCOND6cc0d18a:18b0ebcc705:-49f0','RUL6cc0d18a:18b0ebcc705:-4a6c','treasury.facts.InterestItem','treasury.facts.InterestItem','OLDINT',0,NULL,NULL,NULL,NULL,NULL,0),('RCOND6cc0d18a:18b0ebcc705:-53ae','RUL6cc0d18a:18b0ebcc705:-6379','treasury.facts.InterestItem','treasury.facts.InterestItem','',4,NULL,NULL,NULL,NULL,NULL,1),('RCOND6cc0d18a:18b0ebcc705:-614e','RUL6cc0d18a:18b0ebcc705:-6379','market.facts.MarketBillItem','market.facts.MarketBillItem','BILLITEM',2,NULL,NULL,NULL,NULL,NULL,0),('RCOND6cc0d18a:18b0ebcc705:-6253','RUL6cc0d18a:18b0ebcc705:-6379','market.facts.MarketBill','market.facts.MarketBill','MBILL',1,NULL,NULL,NULL,NULL,NULL,0),('RCOND6cc0d18a:18b0ebcc705:-6306','RUL6cc0d18a:18b0ebcc705:-6379','treasury.facts.TransactionDate','treasury.facts.TransactionDate',NULL,0,NULL,NULL,NULL,NULL,NULL,0),('RCOND6cc0d18a:18b0ebcc705:-6e4f','RUL6cc0d18a:18b0ebcc705:-7e8e','treasury.facts.SurchargeItem','treasury.facts.SurchargeItem','',4,NULL,NULL,NULL,NULL,NULL,1),('RCOND6cc0d18a:18b0ebcc705:-7292','RUL6cc0d18a:18b0ebcc705:-7e8e','treasury.facts.TransactionDate','treasury.facts.TransactionDate',NULL,0,NULL,NULL,NULL,NULL,NULL,0),('RCOND6cc0d18a:18b0ebcc705:-7d18','RUL6cc0d18a:18b0ebcc705:-7e8e','market.facts.MarketBillItem','market.facts.MarketBillItem','BILLITEM',2,NULL,NULL,NULL,NULL,NULL,0),('RCOND6cc0d18a:18b0ebcc705:-7e1d','RUL6cc0d18a:18b0ebcc705:-7e8e','market.facts.MarketBill','market.facts.MarketBill','MBILL',0,NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `sys_rule_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_condition_constraint`
--

DROP TABLE IF EXISTS `sys_rule_condition_constraint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_condition_constraint` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `field_objid` varchar(100) DEFAULT NULL,
  `fieldname` varchar(50) DEFAULT NULL,
  `varname` varchar(50) DEFAULT NULL,
  `operator_caption` varchar(50) DEFAULT NULL,
  `operator_symbol` varchar(50) DEFAULT NULL,
  `usevar` int(11) DEFAULT NULL,
  `var_objid` varchar(50) DEFAULT NULL,
  `var_name` varchar(50) DEFAULT NULL,
  `decimalvalue` decimal(16,2) DEFAULT NULL,
  `intvalue` int(11) DEFAULT NULL,
  `stringvalue` varchar(255) DEFAULT NULL,
  `listvalue` longtext,
  `datevalue` date DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `parentid` (`parentid`),
  KEY `var_objid` (`var_objid`),
  KEY `sys_rule_condition_constraint_fact_field` (`field_objid`),
  CONSTRAINT `sys_rule_condition_constraint_fact_field` FOREIGN KEY (`field_objid`) REFERENCES `sys_rule_fact_field` (`objid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sys_rule_condition_constraint_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_condition` (`objid`),
  CONSTRAINT `sys_rule_condition_constraint_ibfk_2` FOREIGN KEY (`var_objid`) REFERENCES `sys_rule_condition_var` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_condition_constraint`
--

LOCK TABLES `sys_rule_condition_constraint` WRITE;
/*!40000 ALTER TABLE `sys_rule_condition_constraint` DISABLE KEYS */;
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-2b99db48:18b122e2297:-7fcc','RC-2b99db48:18b122e2297:-7fce','market.facts.MarketAccount.orgid','orgid','ORGID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC-2b99db48:18b122e2297:-7fcd','RC-2b99db48:18b122e2297:-7fce','market.facts.MarketAccount.unitno','unitno','UNITNO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCC-2b99db48:18b122e2297:-7fcf','RC-2b99db48:18b122e2297:-7fd1','treasury.facts.SurchargeItem.billitemrefid','billitemrefid',NULL,'equal to','==',1,'RCC-2b99db48:18b122e2297:-7fd5','ITEMID',NULL,NULL,NULL,NULL,NULL,1),('RCC-2b99db48:18b122e2297:-7fd0','RC-2b99db48:18b122e2297:-7fd1','treasury.facts.SurchargeItem.objid','objid','REFID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC-2b99db48:18b122e2297:-7fd2','RC-2b99db48:18b122e2297:-7fd4','treasury.facts.PaymentItem.billitemrefid','billitemrefid',NULL,'equals','==',NULL,NULL,'REFID',NULL,NULL,NULL,NULL,NULL,0),('RCC-2b99db48:18b122e2297:-7fd3','RC-2b99db48:18b122e2297:-7fd4','treasury.facts.PaymentItem.amount','amount','AMT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCC-2b99db48:18b122e2297:-7fd5','RC-2b99db48:18b122e2297:-7fd7','market.facts.MarketBillItem.objid','objid','ITEMID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC-2b99db48:18b122e2297:-7fd6','RC-2b99db48:18b122e2297:-7fd7','market.facts.MarketBillItem.yearmonth','yearmonth',NULL,'equal to','==',1,'RCC-2b99db48:18b122e2297:-7fd8','BYM',NULL,NULL,NULL,NULL,NULL,1),('RCC-2b99db48:18b122e2297:-7fd8','RC-2b99db48:18b122e2297:-7fd9','market.facts.MarketBill.yearmonth','yearmonth','BYM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC-2b99db48:18b122e2297:-7fe1','RC-2b99db48:18b122e2297:-7fe3','market.facts.MarketAccount.unitno','unitno','UNITNO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCC-2b99db48:18b122e2297:-7fe2','RC-2b99db48:18b122e2297:-7fe3','market.facts.MarketAccount.orgid','orgid','ORGID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC-2b99db48:18b122e2297:-7fe4','RC-2b99db48:18b122e2297:-7fe5','market.facts.MarketBill.yearmonth','yearmonth','BYM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC-2b99db48:18b122e2297:-7fe6','RC-2b99db48:18b122e2297:-7fe9','market.facts.MarketBillItem.yearmonth','yearmonth',NULL,'equal to','==',1,NULL,'BYM',NULL,NULL,NULL,NULL,NULL,2),('RCC-2b99db48:18b122e2297:-7fe7','RC-2b99db48:18b122e2297:-7fe9','market.facts.MarketBillItem.objid','objid','OBJID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC-2b99db48:18b122e2297:-7fe8','RC-2b99db48:18b122e2297:-7fe9','market.facts.MarketBillItem.discount','discount','DISC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),('RCC-2b99db48:18b122e2297:-7fea','RC-2b99db48:18b122e2297:-7fec','treasury.facts.PaymentItem.billitemrefid','billitemrefid',NULL,'equals','==',NULL,NULL,'OBJID',NULL,NULL,NULL,NULL,NULL,0),('RCC-2b99db48:18b122e2297:-7feb','RC-2b99db48:18b122e2297:-7fec','treasury.facts.PaymentItem.amount','amount','AMT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCC-2b99db48:18b122e2297:-7ff3','RC-2b99db48:18b122e2297:-7ff5','market.facts.MarketAccount.orgid','orgid','ORGID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC-2b99db48:18b122e2297:-7ff4','RC-2b99db48:18b122e2297:-7ff5','market.facts.MarketAccount.unitno','unitno','UNITNO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCC-2b99db48:18b122e2297:-7ff6','RC-2b99db48:18b122e2297:-7ff8','treasury.facts.SurchargeItem.billitemrefid','billitemrefid',NULL,'equal to','==',1,'RCC-2b99db48:18b122e2297:-7ffc','ITEMID',NULL,NULL,NULL,NULL,NULL,1),('RCC-2b99db48:18b122e2297:-7ff7','RC-2b99db48:18b122e2297:-7ff8','treasury.facts.SurchargeItem.objid','objid','REFID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC-2b99db48:18b122e2297:-7ff9','RC-2b99db48:18b122e2297:-7ffb','treasury.facts.PaymentItem.billitemrefid','billitemrefid',NULL,'equals','==',NULL,NULL,'REFID',NULL,NULL,NULL,NULL,NULL,0),('RCC-2b99db48:18b122e2297:-7ffa','RC-2b99db48:18b122e2297:-7ffb','treasury.facts.PaymentItem.amount','amount','AMT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCC-2b99db48:18b122e2297:-7ffc','RC-2b99db48:18b122e2297:-7ffe','market.facts.MarketBillItem.objid','objid','ITEMID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC-2b99db48:18b122e2297:-7ffd','RC-2b99db48:18b122e2297:-7ffe','market.facts.MarketBillItem.yearmonth','yearmonth',NULL,'less than','<',1,'RCC-2b99db48:18b122e2297:-7fff','BYM',NULL,NULL,NULL,NULL,NULL,1),('RCC-2b99db48:18b122e2297:-7fff','RC-2b99db48:18b122e2297:-8000','market.facts.MarketBill.yearmonth','yearmonth','BYM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC-4b1e9177:18b07dbbb0f:-7ff8','RC-4b1e9177:18b07dbbb0f:-7ff9','market.facts.MarketBill.yearmonth','yearmonth','BYM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC-4b1e9177:18b07dbbb0f:-7ffa','RC-4b1e9177:18b07dbbb0f:-7ffd','market.facts.MarketBillItem.yearmonth','yearmonth',NULL,'less than','<',1,'RCC-4b1e9177:18b07dbbb0f:-7ff8','BYM',NULL,NULL,NULL,NULL,NULL,5),('RCC-4b1e9177:18b07dbbb0f:-7ffb','RC-4b1e9177:18b07dbbb0f:-7ffd','market.facts.MarketBillItem.objid','objid','OBJID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC-4b1e9177:18b07dbbb0f:-7ffe','RC-4b1e9177:18b07dbbb0f:-8000','treasury.facts.PaymentItem.billitemrefid','billitemrefid',NULL,'equals','==',NULL,'RCC-4b1e9177:18b07dbbb0f:-7ffb','OBJID',NULL,NULL,NULL,NULL,NULL,0),('RCC-4b1e9177:18b07dbbb0f:-7fff','RC-4b1e9177:18b07dbbb0f:-8000','treasury.facts.PaymentItem.amount','amount','AMT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCC-56ddf40f:18b0ecc7ce5:-7ff4','RC-56ddf40f:18b0ecc7ce5:-7ff5','market.facts.MarketBill.yearmonth','yearmonth','BYM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC-56ddf40f:18b0ecc7ce5:-7ff6','RC-56ddf40f:18b0ecc7ce5:-7ffa','market.facts.MarketBillItem.balance','balance','AMT','greater than','>',NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,0),('RCC-56ddf40f:18b0ecc7ce5:-7ff7','RC-56ddf40f:18b0ecc7ce5:-7ffa','market.facts.MarketBillItem.yearmonth','yearmonth',NULL,'less than','<',1,'RCC-56ddf40f:18b0ecc7ce5:-7ff4','BYM',NULL,NULL,NULL,NULL,NULL,1),('RCC-56ddf40f:18b0ecc7ce5:-7ff8','RC-56ddf40f:18b0ecc7ce5:-7ffa','market.facts.MarketBillItem.objid','objid','ITEMID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),('RCC-56ddf40f:18b0ecc7ce5:-7ff9','RC-56ddf40f:18b0ecc7ce5:-7ffa','market.facts.MarketBillItem.billcode','billcode',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"MARKET_RENTAL\",value:\"MARKET RENTAL\"]]',NULL,3),('RCC-56ddf40f:18b0ecc7ce5:-7fff','RC-56ddf40f:18b0ecc7ce5:-8000','treasury.facts.SurchargeItem.billitemrefid','billitemrefid',NULL,'equal to','==',1,NULL,'ITEMID',NULL,NULL,NULL,NULL,NULL,0),('RCC-646e0493:18cca0eff43:-7fc6','RC-646e0493:18cca0eff43:-7fc9','market.facts.MarketBill.paymentmode','paymentmode',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[\"DAILY\"]',NULL,0),('RCC-646e0493:18cca0eff43:-7fc7','RC-646e0493:18cca0eff43:-7fc9','market.facts.MarketBill.yearmonth','yearmonth','BYM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCC-646e0493:18cca0eff43:-7fc8','RC-646e0493:18cca0eff43:-7fc9','market.facts.MarketBill.rate','rate','RATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),('RCC-646e0493:18cca0eff43:-7fca','RC-646e0493:18cca0eff43:-7fcb','treasury.facts.TransactionDate.date','date','TXNDATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC-646e0493:18cca0eff43:-7fcc','RC-646e0493:18cca0eff43:-7fd0','market.facts.MarketBillItem.yearmonth','yearmonth',NULL,'equal to','==',1,'RCC-646e0493:18cca0eff43:-7fc7','BYM',NULL,NULL,NULL,NULL,NULL,0),('RCC-646e0493:18cca0eff43:-7fcd','RC-646e0493:18cca0eff43:-7fd0','market.facts.MarketBillItem.balance','balance','BAL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),('RCC-646e0493:18cca0eff43:-7fce','RC-646e0493:18cca0eff43:-7fd0','market.facts.MarketBillItem.objid','objid','BILLITEMID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),('RCC-646e0493:18cca0eff43:-7fcf','RC-646e0493:18cca0eff43:-7fd0','market.facts.MarketBillItem.billdate','billdate','BILLDATE',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4),('RCC-646e0493:18cca0eff43:-7fd1','RC-646e0493:18cca0eff43:-7fd2','treasury.facts.SurchargeItem.billitemrefid','billitemrefid',NULL,'equal to','==',1,'RCC-646e0493:18cca0eff43:-7fce','BILLITEMID',NULL,NULL,NULL,NULL,NULL,0),('RCC-702c7fbc:18cc352af48:-7ff5','RC-702c7fbc:18cc352af48:-7ff6','market.facts.MarketBill.paymentmode','paymentmode',NULL,'is any of the ff.','matches',0,NULL,NULL,NULL,NULL,NULL,'[\"DAILY\"]',NULL,0),('RCC-702c7fbc:18cc352af48:-7ff7','RC-702c7fbc:18cc352af48:-7ff8','treasury.facts.Payment.amount','amount',NULL,'greater than','>',NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,0),('RCC-702c7fbc:18cc352af48:-7ff9','RC-702c7fbc:18cc352af48:-7ffc','market.facts.MarketBillItem.paid','paid',NULL,'not true','== false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC-702c7fbc:18cc352af48:-7ffb','RC-702c7fbc:18cc352af48:-7ffc','market.facts.MarketBillItem.billcode','billcode',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"MARKET_RENTAL\",value:\"MARKET RENTAL\"]]',NULL,2),('RCC-702c7fbc:18cc352af48:-7ffe','RC-702c7fbc:18cc352af48:-8000','market.facts.MarketBillItem.paid','paid',NULL,'not true','== false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC-702c7fbc:18cc352af48:-7fff','RC-702c7fbc:18cc352af48:-8000','market.facts.MarketBillItem.billcode','billcode',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"MARKET_RENTAL\",value:\"MARKET RENTAL\"]]',NULL,1),('RCC-7b6570c3:18ca04b6ecd:-7ffb','RC-7b6570c3:18ca04b6ecd:-7ffc','market.facts.MarketBill.paymentmode','paymentmode','MODE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC-7b6570c3:18ca04b6ecd:-7ffd','RC-7b6570c3:18ca04b6ecd:-7ffe','market.facts.MarketBillSchedule.todate','todate','TODATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC-7b6570c3:18ca04b6ecd:-7fff','RC-7b6570c3:18ca04b6ecd:-8000','treasury.facts.TransactionDate.date','date','TXNDATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC621b7fc5:18cbfcf2e31:-7fb1','RC621b7fc5:18cbfcf2e31:-7fb2','treasury.facts.TransactionDate.date','date','TXNDATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC621b7fc5:18cbfcf2e31:-7fb3','RC621b7fc5:18cbfcf2e31:-7fb8','market.facts.MarketBill.month','month','MON',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCC621b7fc5:18cbfcf2e31:-7fb4','RC621b7fc5:18cbfcf2e31:-7fb8','market.facts.MarketBill.year','year','YR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC621b7fc5:18cbfcf2e31:-7fb5','RC621b7fc5:18cbfcf2e31:-7fb8','market.facts.MarketBill.paymentmode','paymentmode','PMODE','is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[\"DAILY\"]',NULL,4),('RCC621b7fc5:18cbfcf2e31:-7fb6','RC621b7fc5:18cbfcf2e31:-7fb8','market.facts.MarketBill.ratetype','ratetype','RTYPE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),('RCC621b7fc5:18cbfcf2e31:-7fb7','RC621b7fc5:18cbfcf2e31:-7fb8','market.facts.MarketBill.rate','rate','RATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),('RCC621b7fc5:18cbfcf2e31:-7fb9','RC621b7fc5:18cbfcf2e31:-7fba','market.facts.MarketBillSchedule.fromdate','fromdate','FROMDATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC621b7fc5:18cbfcf2e31:-7fbb','RC621b7fc5:18cbfcf2e31:-7fbd','market.facts.MarketBillItem.month','month',NULL,'equal to','==',1,NULL,'MON',NULL,NULL,NULL,NULL,NULL,1),('RCC621b7fc5:18cbfcf2e31:-7fbc','RC621b7fc5:18cbfcf2e31:-7fbd','market.facts.MarketBillItem.year','year',NULL,'equal to','==',1,NULL,'YR',NULL,NULL,NULL,NULL,NULL,0),('RCC621b7fc5:18cbfcf2e31:-7fc4','RC621b7fc5:18cbfcf2e31:-7fc5','market.facts.MarketBillSchedule.fromdate','fromdate','FROMDATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC621b7fc5:18cbfcf2e31:-7fc6','RC621b7fc5:18cbfcf2e31:-7fcb','market.facts.MarketBill.rate','rate','RATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),('RCC621b7fc5:18cbfcf2e31:-7fc7','RC621b7fc5:18cbfcf2e31:-7fcb','market.facts.MarketBill.ratetype','ratetype','RTYPE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),('RCC621b7fc5:18cbfcf2e31:-7fc8','RC621b7fc5:18cbfcf2e31:-7fcb','market.facts.MarketBill.paymentmode','paymentmode','PMODE','is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[\"MONTHLY\"]',NULL,4),('RCC621b7fc5:18cbfcf2e31:-7fc9','RC621b7fc5:18cbfcf2e31:-7fcb','market.facts.MarketBill.year','year','YR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC621b7fc5:18cbfcf2e31:-7fca','RC621b7fc5:18cbfcf2e31:-7fcb','market.facts.MarketBill.month','month','MON',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCC621b7fc5:18cbfcf2e31:-7fdf','RC621b7fc5:18cbfcf2e31:-7fe0','treasury.facts.TransactionDate.date','date','TXNDATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC621b7fc5:18cbfcf2e31:-7fe1','RC621b7fc5:18cbfcf2e31:-7fe6','market.facts.MarketBill.month','month','MON',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCC621b7fc5:18cbfcf2e31:-7fe2','RC621b7fc5:18cbfcf2e31:-7fe6','market.facts.MarketBill.year','year','YR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC621b7fc5:18cbfcf2e31:-7fe3','RC621b7fc5:18cbfcf2e31:-7fe6','market.facts.MarketBill.paymentmode','paymentmode','PMODE','is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[\"DAILY\"]',NULL,4),('RCC621b7fc5:18cbfcf2e31:-7fe5','RC621b7fc5:18cbfcf2e31:-7fe6','market.facts.MarketBill.rate','rate','RATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),('RCC621b7fc5:18cbfcf2e31:-7fe7','RC621b7fc5:18cbfcf2e31:-7fed','market.facts.MarketBillItem.input','input',NULL,'is true','== true',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),('RCC621b7fc5:18cbfcf2e31:-7fe8','RC621b7fc5:18cbfcf2e31:-7fed','market.facts.MarketBillItem.billdate','billdate','LASTDATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),('RCC621b7fc5:18cbfcf2e31:-7feb','RC621b7fc5:18cbfcf2e31:-7fed','market.facts.MarketBillItem.month','month',NULL,'equal to','==',1,'RCC621b7fc5:18cbfcf2e31:-7fe1','MON',NULL,NULL,NULL,NULL,NULL,1),('RCC621b7fc5:18cbfcf2e31:-7fec','RC621b7fc5:18cbfcf2e31:-7fed','market.facts.MarketBillItem.year','year',NULL,'equal to','==',1,'RCC621b7fc5:18cbfcf2e31:-7fe2','YR',NULL,NULL,NULL,NULL,NULL,0),('RCC7056d297:18b32a137cc:-7fc3','RC7056d297:18b32a137cc:-7fc5','treasury.facts.InterestItem.objid','objid','REFID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC7056d297:18b32a137cc:-7fc4','RC7056d297:18b32a137cc:-7fc5','treasury.facts.InterestItem.billitemrefid','billitemrefid',NULL,'equal to','==',1,'RCC7056d297:18b32a137cc:-7fcc','ITEMID',NULL,NULL,NULL,NULL,NULL,1),('RCC7056d297:18b32a137cc:-7fc6','RC7056d297:18b32a137cc:-7fc8','market.facts.MarketAccount.orgid','orgid','ORGID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC7056d297:18b32a137cc:-7fc7','RC7056d297:18b32a137cc:-7fc8','market.facts.MarketAccount.unitno','unitno','UNITNO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCC7056d297:18b32a137cc:-7fc9','RC7056d297:18b32a137cc:-7fcb','treasury.facts.PaymentItem.billitemrefid','billitemrefid',NULL,'equals','==',NULL,NULL,'REFID',NULL,NULL,NULL,NULL,NULL,0),('RCC7056d297:18b32a137cc:-7fca','RC7056d297:18b32a137cc:-7fcb','treasury.facts.PaymentItem.amount','amount','AMT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCC7056d297:18b32a137cc:-7fcc','RC7056d297:18b32a137cc:-7fce','market.facts.MarketBillItem.objid','objid','ITEMID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC7056d297:18b32a137cc:-7fcd','RC7056d297:18b32a137cc:-7fce','market.facts.MarketBillItem.yearmonth','yearmonth',NULL,'less than','<',1,'RCC7056d297:18b32a137cc:-7fcf','BYM',NULL,NULL,NULL,NULL,NULL,1),('RCC7056d297:18b32a137cc:-7fcf','RC7056d297:18b32a137cc:-7fd0','market.facts.MarketBill.yearmonth','yearmonth','BYM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC7056d297:18b32a137cc:-7fd7','RC7056d297:18b32a137cc:-7fd8','market.facts.MarketBill.yearmonth','yearmonth','BYM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC7056d297:18b32a137cc:-7fd9','RC7056d297:18b32a137cc:-7fdb','market.facts.MarketBillItem.yearmonth','yearmonth',NULL,'equal to','==',1,NULL,'BYM',NULL,NULL,NULL,NULL,NULL,1),('RCC7056d297:18b32a137cc:-7fda','RC7056d297:18b32a137cc:-7fdb','market.facts.MarketBillItem.objid','objid','ITEMID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC7056d297:18b32a137cc:-7fdc','RC7056d297:18b32a137cc:-7fde','treasury.facts.PaymentItem.amount','amount','AMT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCC7056d297:18b32a137cc:-7fdd','RC7056d297:18b32a137cc:-7fde','treasury.facts.PaymentItem.billitemrefid','billitemrefid',NULL,'equals','==',NULL,'RCONST4a55ddd7:18b329d84db:-7920','REFID',NULL,NULL,NULL,NULL,NULL,0),('RCC7056d297:18b32a137cc:-7fe2','RC7056d297:18b32a137cc:-7fe4','market.facts.MarketAccount.unitno','unitno','UNITNO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCC7056d297:18b32a137cc:-7fe3','RC7056d297:18b32a137cc:-7fe4','market.facts.MarketAccount.orgid','orgid','ORGID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONST-1a42654b:18b3131d28a:-6516','RCOND6cc0d18a:18b0ebcc705:-48c2','treasury.facts.InterestItem.input','input',NULL,'not true','== false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCONST-1a42654b:18b3131d28a:-65fe','RCOND6cc0d18a:18b0ebcc705:-49f0','treasury.facts.InterestItem.input','input',NULL,'is true','== true',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCONST-397eec50:18ac66691c0:-726b','RCOND-397eec50:18ac66691c0:-747c','market.facts.MarketBillSchedule.month','month','MON',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCONST-397eec50:18ac66691c0:-72e8','RCOND-397eec50:18ac66691c0:-747c','market.facts.MarketBillSchedule.year','year','YR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONST-437c586b:18ca10ff822:-3201','RCOND-437c586b:18ca10ff822:-33da','market.facts.MarketBillItem.billcode','billcode',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"MARKET_RENTAL\",value:\"MARKET RENTAL\"]]',NULL,1),('RCONST-437c586b:18ca10ff822:-3280','RCOND-437c586b:18ca10ff822:-33da','market.facts.MarketBillItem.paid','paid',NULL,'not true','== false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONST-437c586b:18ca10ff822:-34a0','RCOND-437c586b:18ca10ff822:-3852','market.facts.MarketBillItem.billcode','billcode',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"MARKET_RENTAL\",value:\"MARKET RENTAL\"]]',NULL,2),('RCONST-437c586b:18ca10ff822:-36f9','RCOND-437c586b:18ca10ff822:-3852','market.facts.MarketBillItem.paid','paid','ISPAID','not true','== false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONST-437c586b:18ca10ff822:-3d41','RCOND-437c586b:18ca10ff822:-3da8','treasury.facts.CreditBillItem.unusedbalance','unusedbalance',NULL,'greater than','>',NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,0),('RCONST-4396564d:18aeb37fa4d:-5f0a','RCOND-4396564d:18aeb37fa4d:-5f88','treasury.facts.DiscountItem.amount','amount','AMT','greater than','>',NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,0),('RCONST-4396564d:18aeb37fa4d:-6104','RCOND-4396564d:18aeb37fa4d:-6129','treasury.facts.CreditBillItem.unusedbalance','unusedbalance','AMT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONST-4396564d:18aeb37fa4d:-7047','RCOND-4396564d:18aeb37fa4d:-706a','treasury.facts.DiscountItem.amount','amount',NULL,'equal to','==',1,'RCONST-4396564d:18aeb37fa4d:-7235','AMT',NULL,NULL,NULL,NULL,NULL,0),('RCONST-4396564d:18aeb37fa4d:-7235','RCOND-4396564d:18aeb37fa4d:-724b','treasury.facts.Payment.amount','amount','AMT','greater than','>',NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,0),('RCONST-4396564d:18aeb37fa4d:-76c1','RCOND-4396564d:18aeb37fa4d:-78aa','market.facts.MarketBillItem.billcode','billcode',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"MARKET_RENTAL\",value:\"MARKET RENTAL\"]]',NULL,1),('RCONST-4396564d:18aeb37fa4d:-7740','RCOND-4396564d:18aeb37fa4d:-78aa','market.facts.MarketBillItem.paid','paid',NULL,'not true','== false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONST-4396564d:18aeb37fa4d:-79b3','RCOND-4396564d:18aeb37fa4d:-7d3e','market.facts.MarketBillItem.billcode','billcode',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"MARKET_RENTAL\",value:\"MARKET RENTAL\"]]',NULL,2),('RCONST-4396564d:18aeb37fa4d:-7a7b','RCOND-4396564d:18aeb37fa4d:-7d3e','market.facts.MarketBillItem.yearmonth','yearmonth','YM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCONST-4396564d:18aeb37fa4d:-7c22','RCOND-4396564d:18aeb37fa4d:-7d3e','market.facts.MarketBillItem.paid','paid',NULL,'not true','== false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONST-4396564d:18aeb37fa4d:-7dd9','RCOND-4396564d:18aeb37fa4d:-7def','treasury.facts.Payment.amount','amount',NULL,'greater than','>',NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,0),('RCONST-5b2f3581:18af3ee8091:-7bb5','RCOND-5b2f3581:18af3ee8091:-7bfd','treasury.facts.CashReceiptItem.billcode','billcode',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"MARKET_RENTAL\",value:\"MARKET RENTAL\"]]',NULL,0),('RCONST-6318955a:18b04cf69ac:-7b97','RCOND-5b2f3581:18af3ee8091:-7bfd','treasury.facts.CashReceiptItem.orgid','orgid','ORGID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCONST-6e742724:18d9c37d0d5:-7933','RCOND-6e742724:18d9c37d0d5:-7943','market.facts.MarketTxn.typeid','typeid',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"TRANSFER_UNIT\",value:\"Transfer Unit\"]]',NULL,0),('RCONST13be5044:18ccdf11ff7:-7768','RCOND13be5044:18ccdf11ff7:-7828','market.facts.MarketBillSchedule.expirydate','expirydate','EXPIRYDATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONST13be5044:18ccdf11ff7:-799f','RC-646e0493:18cca0eff43:-7fd2','treasury.facts.SurchargeItem.input','input',NULL,'is true','== true',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),('RCONST153dc6c6:18da2464e95:-7f09','RCOND-397eec50:18ac66691c0:-747c','market.facts.MarketBillSchedule.name','name',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"DEFAULT\",value:\"DEFAULT\"]]',NULL,2),('RCONST1876b96d:18b0794d721:-6478','RCOND-4396564d:18aeb37fa4d:-78aa','market.facts.MarketBillItem.yearmonth','yearmonth',NULL,'less than','<',1,'RCONST-4396564d:18aeb37fa4d:-7a7b','YM',NULL,NULL,NULL,NULL,NULL,2),('RCONST1876b96d:18b0794d721:-68b1','RC-4b1e9177:18b07dbbb0f:-7ffd','market.facts.MarketBillItem.billcode','billcode',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"MARKET_RENTAL\",value:\"MARKET RENTAL\"]]',NULL,2),('RCONST1b458836:18cc2a4fed5:-3c6f','RCOND1b458836:18cc2a4fed5:-3d7c','market.facts.MarketBill.paymentmode','paymentmode',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[\"DAILY\"]',NULL,0),('RCONST1b458836:18cc2a4fed5:-410','RC-702c7fbc:18cc352af48:-8000','market.facts.MarketBillItem.balance','balance',NULL,'greater than','>',NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,3),('RCONST1b458836:18cc2a4fed5:-4a86','RC-702c7fbc:18cc352af48:-7ffc','market.facts.MarketBillItem.sortorder','sortorder','SORTORDER',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4),('RCONST1b458836:18cc2a4fed5:-4e01','RC-702c7fbc:18cc352af48:-8000','market.facts.MarketBillItem.sortorder','sortorder',NULL,'less than','<',1,'RCONST1b458836:18cc2a4fed5:-4a86','SORTORDER',NULL,NULL,NULL,NULL,NULL,3),('RCONST1b458836:18cc2a4fed5:-50da','RC-702c7fbc:18cc352af48:-7ffc','market.facts.MarketBillItem.balance','balance','BAL','greater than','>',NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,3),('RCONST1b458836:18cc2a4fed5:-5be7','RCOND1b458836:18cc2a4fed5:-5d00','market.facts.MarketBill.paymentmode','paymentmode',NULL,'is any of the ff.','matches',0,NULL,NULL,NULL,NULL,NULL,'[\"MONTHLY\"]',NULL,0),('RCONST1b458836:18cc2a4fed5:-5fc4','RCOND-437c586b:18ca10ff822:-33da','market.facts.MarketBillItem.sortorder','sortorder',NULL,'less than','<',1,'RCONST1b458836:18cc2a4fed5:-65c9','SORTORDER',NULL,NULL,NULL,NULL,NULL,3),('RCONST1b458836:18cc2a4fed5:-65c9','RCOND-437c586b:18ca10ff822:-3852','market.facts.MarketBillItem.sortorder','sortorder','SORTORDER',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),('RCONST1b458836:18cc2a4fed5:-758b','RCOND1b458836:18cc2a4fed5:-75f7','market.facts.MarketBillSchedule.todate','todate','TODATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONST1b458836:18cc2a4fed5:-7757','RC621b7fc5:18cbfcf2e31:-7fba','market.facts.MarketBillSchedule.todate','todate','TODATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCONST1b458836:18cc2a4fed5:-7e5','RCOND-437c586b:18ca10ff822:-33da','market.facts.MarketBillItem.balance','balance',NULL,'greater than','>',NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,3),('RCONST1b458836:18cc2a4fed5:-a91','RCOND-437c586b:18ca10ff822:-3852','market.facts.MarketBillItem.balance','balance',NULL,'greater than','>',NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,3),('RCONST34c58731:18aea1f9197:-63ec','RCOND34c58731:18aea1f9197:-6402','treasury.facts.Payment.amount','amount','PAMT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONST34c58731:18aea1f9197:-684e','RCOND34c58731:18aea1f9197:-7124','market.facts.MarketBillItem.paid','paid',NULL,'not true','== false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),('RCONST34c58731:18aea1f9197:-69e9','RCOND34c58731:18aea1f9197:-7124','market.facts.MarketBillItem.yearmonth','yearmonth',NULL,'equal to','==',1,'RCONST34c58731:18aea1f9197:-73ab','BYM',NULL,NULL,NULL,NULL,NULL,2),('RCONST34c58731:18aea1f9197:-6c33','RCOND34c58731:18aea1f9197:-7124','market.facts.MarketBillItem.amount','amount','AMT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCONST34c58731:18aea1f9197:-6cd6','RCOND34c58731:18aea1f9197:-7124','market.facts.MarketBillItem.billcode','billcode',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"MARKET_RENTAL\",value:\"MARKET RENTAL\"]]',NULL,0),('RCONST34c58731:18aea1f9197:-71da','RCOND34c58731:18aea1f9197:-7421','market.facts.MarketBill.balanceforward','balanceforward',NULL,'less than or equal to','<=',NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,1),('RCONST34c58731:18aea1f9197:-73ab','RCOND34c58731:18aea1f9197:-7421','market.facts.MarketBill.yearmonth','yearmonth','BYM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONST34c58731:18aea1f9197:-74b6','RCOND34c58731:18aea1f9197:-74e4','treasury.facts.TransactionDate.date','date','TDATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONST4a55ddd7:18b329d84db:-78bf','RCOND4a55ddd7:18b329d84db:-795b','treasury.facts.InterestItem.billitemrefid','billitemrefid',NULL,'equal to','==',1,'RCC7056d297:18b32a137cc:-7fda','ITEMID',NULL,NULL,NULL,NULL,NULL,1),('RCONST4a55ddd7:18b329d84db:-7920','RCOND4a55ddd7:18b329d84db:-795b','treasury.facts.InterestItem.objid','objid','REFID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONST5085132e:18ccde5b52a:-7db5','RC-646e0493:18cca0eff43:-7fd2','treasury.facts.SurchargeItem.billdate','billdate','SURDATE','on','==',1,'RCC-646e0493:18cca0eff43:-7fcf','BILLDATE',NULL,NULL,NULL,NULL,NULL,1),('RCONST6330d0e7:18cc9dc49d7:-438e','RCOND6330d0e7:18cc9dc49d7:-43b3','treasury.facts.AbstractBillItem.amount','amount',NULL,'equal to','==',NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,0),('RCONST6330d0e7:18cc9dc49d7:-5b32','RCOND6330d0e7:18cc9dc49d7:-743d','market.facts.MarketBillItem.billdate','billdate','BILLDATE',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4),('RCONST6330d0e7:18cc9dc49d7:-664a','RCOND6330d0e7:18cc9dc49d7:-7afc','market.facts.MarketBill.rate','rate','RATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),('RCONST6330d0e7:18cc9dc49d7:-68ea','RCOND6330d0e7:18cc9dc49d7:-693f','treasury.facts.SurchargeItem.billitemrefid','billitemrefid',NULL,'equal to','==',1,'RCONST6330d0e7:18cc9dc49d7:-6a81','BILLITEMID',NULL,NULL,NULL,NULL,NULL,0),('RCONST6330d0e7:18cc9dc49d7:-6a81','RCOND6330d0e7:18cc9dc49d7:-743d','market.facts.MarketBillItem.objid','objid','BILLITEMID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),('RCONST6330d0e7:18cc9dc49d7:-6cac','RCOND6330d0e7:18cc9dc49d7:-743d','market.facts.MarketBillItem.balance','balance','BAL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),('RCONST6330d0e7:18cc9dc49d7:-7347','RCOND6330d0e7:18cc9dc49d7:-743d','market.facts.MarketBillItem.yearmonth','yearmonth',NULL,'equal to','==',1,'RCONST6330d0e7:18cc9dc49d7:-7517','BYM',NULL,NULL,NULL,NULL,NULL,0),('RCONST6330d0e7:18cc9dc49d7:-7517','RCOND6330d0e7:18cc9dc49d7:-7afc','market.facts.MarketBill.yearmonth','yearmonth','BYM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCONST6330d0e7:18cc9dc49d7:-790f','RCOND6330d0e7:18cc9dc49d7:-793d','treasury.facts.TransactionDate.date','date','TXNDATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONST6330d0e7:18cc9dc49d7:-79ca','RCOND6330d0e7:18cc9dc49d7:-7afc','market.facts.MarketBill.paymentmode','paymentmode',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[\"DAILY\"]',NULL,0),('RCONST6cc0d18a:18b0ebcc705:-21d','RCOND6cc0d18a:18b0ebcc705:-2db','market.facts.MarketAccount.unitno','unitno','UNITNO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCONST6cc0d18a:18b0ebcc705:-29b','RCOND6cc0d18a:18b0ebcc705:-2db','market.facts.MarketAccount.orgid','orgid','ORGID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONST6cc0d18a:18b0ebcc705:-3288','RCOND6cc0d18a:18b0ebcc705:-32c8','market.facts.MarketAccount.orgid','orgid','ORGID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONST6cc0d18a:18b0ebcc705:-47c6','RCOND6cc0d18a:18b0ebcc705:-48c2','treasury.facts.InterestItem.billitemrefid','billitemrefid',NULL,'equal to','==',1,'RCONST6cc0d18a:18b0ebcc705:-495a','REFID',NULL,NULL,NULL,NULL,NULL,1),('RCONST6cc0d18a:18b0ebcc705:-495a','RCOND6cc0d18a:18b0ebcc705:-49f0','treasury.facts.InterestItem.billitemrefid','billitemrefid','REFID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCONST6cc0d18a:18b0ebcc705:-52de','RCOND6cc0d18a:18b0ebcc705:-53ae','treasury.facts.InterestItem.forwarded','forwarded',NULL,'not true','== false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCONST6cc0d18a:18b0ebcc705:-533d','RCOND6cc0d18a:18b0ebcc705:-53ae','treasury.facts.InterestItem.billitemrefid','billitemrefid',NULL,'equal to','==',1,'RCONST6cc0d18a:18b0ebcc705:-5801','ITEMID',NULL,NULL,NULL,NULL,NULL,0),('RCONST6cc0d18a:18b0ebcc705:-564a','RCOND6cc0d18a:18b0ebcc705:-614e','market.facts.MarketBillItem.billcode','billcode',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"MARKET_RENTAL\",value:\"MARKET RENTAL\"]]',NULL,4),('RCONST6cc0d18a:18b0ebcc705:-5734','RCOND6cc0d18a:18b0ebcc705:-614e','market.facts.MarketBillItem.surcharge','surcharge','SUR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),('RCONST6cc0d18a:18b0ebcc705:-580','RCOND6cc0d18a:18b0ebcc705:-32c8','market.facts.MarketAccount.unitno','unitno','UNITNO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCONST6cc0d18a:18b0ebcc705:-5801','RCOND6cc0d18a:18b0ebcc705:-614e','market.facts.MarketBillItem.objid','objid','ITEMID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),('RCONST6cc0d18a:18b0ebcc705:-589a','RCOND6cc0d18a:18b0ebcc705:-614e','market.facts.MarketBillItem.yearmonth','yearmonth','YM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCONST6cc0d18a:18b0ebcc705:-5bb2','RCOND6cc0d18a:18b0ebcc705:-614e','market.facts.MarketBillItem.balance','balance','AMT','greater than','>',NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,0),('RCONST6cc0d18a:18b0ebcc705:-61dd','RCOND6cc0d18a:18b0ebcc705:-6253','market.facts.MarketBill.yearmonth','yearmonth','BYM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONST6cc0d18a:18b0ebcc705:-62d8','RCOND6cc0d18a:18b0ebcc705:-6306','treasury.facts.TransactionDate.date','date','TXNDATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONST6cc0d18a:18b0ebcc705:-6514','RC-56ddf40f:18b0ecc7ce5:-7ffc','market.facts.MarketBillSchedule.fromdate','fromdate','FROMDATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCONST6cc0d18a:18b0ebcc705:-6df7','RCOND6cc0d18a:18b0ebcc705:-6e4f','treasury.facts.SurchargeItem.billitemrefid','billitemrefid',NULL,'equal to','==',1,'RCONST6cc0d18a:18b0ebcc705:-76d0','ITEMID',NULL,NULL,NULL,NULL,NULL,0),('RCONST6cc0d18a:18b0ebcc705:-7264','RCOND6cc0d18a:18b0ebcc705:-7292','treasury.facts.TransactionDate.date','date','TXNDATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONST6cc0d18a:18b0ebcc705:-7611','RCOND6cc0d18a:18b0ebcc705:-7d18','market.facts.MarketBillItem.billcode','billcode',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"MARKET_RENTAL\",value:\"MARKET RENTAL\"]]',NULL,3),('RCONST6cc0d18a:18b0ebcc705:-76d0','RCOND6cc0d18a:18b0ebcc705:-7d18','market.facts.MarketBillItem.objid','objid','ITEMID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),('RCONST6cc0d18a:18b0ebcc705:-779f','RCOND6cc0d18a:18b0ebcc705:-7d18','market.facts.MarketBillItem.yearmonth','yearmonth',NULL,'equal to','==',1,'RCONST6cc0d18a:18b0ebcc705:-7da7','BYM',NULL,NULL,NULL,NULL,NULL,1),('RCONST6cc0d18a:18b0ebcc705:-7ae0','RCOND6cc0d18a:18b0ebcc705:-7d18','market.facts.MarketBillItem.balance','balance','AMT','greater than','>',NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,0),('RCONST6cc0d18a:18b0ebcc705:-7da7','RCOND6cc0d18a:18b0ebcc705:-7e1d','market.facts.MarketBill.yearmonth','yearmonth','BYM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONST75b9f322:18c9fc081bd:-24c8','RCOND6cc0d18a:18b0ebcc705:-6253','market.facts.MarketBill.duedate','duedate',NULL,'before','<',1,'RCONST6cc0d18a:18b0ebcc705:-62d8','TXNDATE',NULL,NULL,NULL,NULL,NULL,2),('RCONST75b9f322:18c9fc081bd:-26e9','RCOND6cc0d18a:18b0ebcc705:-7e1d','market.facts.MarketBill.duedate','duedate','DUEDATE','before','<',1,'RCONST6cc0d18a:18b0ebcc705:-7264','TXNDATE',NULL,NULL,NULL,NULL,NULL,2),('RCONST75b9f322:18c9fc081bd:-2cdf','RC-7b6570c3:18ca04b6ecd:-7ffe','market.facts.MarketBillSchedule.duedate','duedate','DUEDATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),('RCONST75b9f322:18c9fc081bd:-47b1','RCOND6cc0d18a:18b0ebcc705:-6253','market.facts.MarketBill.paymentmode','paymentmode',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[\"MONTHLY\"]',NULL,1),('RCONST75b9f322:18c9fc081bd:-49a3','RCOND6cc0d18a:18b0ebcc705:-7e1d','market.facts.MarketBill.paymentmode','paymentmode',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[\"MONTHLY\"]',NULL,1),('RCONST75b9f322:18c9fc081bd:-4bb8','RC-56ddf40f:18b0ecc7ce5:-7ff5','market.facts.MarketBill.paymentmode','paymentmode',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[\"MONTHLY\"]',NULL,1);
/*!40000 ALTER TABLE `sys_rule_condition_constraint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_condition_var`
--

DROP TABLE IF EXISTS `sys_rule_condition_var`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_condition_var` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `ruleid` varchar(50) DEFAULT NULL,
  `varname` varchar(50) DEFAULT NULL,
  `datatype` varchar(50) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `parentid` (`parentid`),
  CONSTRAINT `sys_rule_condition_var_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_condition` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_condition_var`
--

LOCK TABLES `sys_rule_condition_var` WRITE;
/*!40000 ALTER TABLE `sys_rule_condition_var` DISABLE KEYS */;
INSERT INTO `sys_rule_condition_var` VALUES ('RC-2b99db48:18b122e2297:-7fce','RC-2b99db48:18b122e2297:-7fce','RUL6cc0d18a:18b0ebcc705:62','ACCT','market.facts.MarketAccount',0),('RC-2b99db48:18b122e2297:-7fd1','RC-2b99db48:18b122e2297:-7fd1','RUL6cc0d18a:18b0ebcc705:62','SURCHG','treasury.facts.SurchargeItem',4),('RC-2b99db48:18b122e2297:-7fd7','RC-2b99db48:18b122e2297:-7fd7','RUL6cc0d18a:18b0ebcc705:62','BILLITEM','market.facts.MarketBillItem',2),('RC-2b99db48:18b122e2297:-7fd9','RC-2b99db48:18b122e2297:-7fd9','RUL6cc0d18a:18b0ebcc705:62','MBILL','market.facts.MarketBill',1),('RC-2b99db48:18b122e2297:-7fe3','RC-2b99db48:18b122e2297:-7fe3','RUL6cc0d18a:18b0ebcc705:e','ACCT','market.facts.MarketAccount',0),('RC-2b99db48:18b122e2297:-7fe5','RC-2b99db48:18b122e2297:-7fe5','RUL6cc0d18a:18b0ebcc705:e','MBILL','market.facts.MarketBill',1),('RC-2b99db48:18b122e2297:-7fe9','RC-2b99db48:18b122e2297:-7fe9','RUL6cc0d18a:18b0ebcc705:e','BILLITEM','market.facts.MarketBillItem',2),('RC-2b99db48:18b122e2297:-7ff5','RC-2b99db48:18b122e2297:-7ff5','RUL6cc0d18a:18b0ebcc705:-109','ACCT','market.facts.MarketAccount',0),('RC-2b99db48:18b122e2297:-7ff8','RC-2b99db48:18b122e2297:-7ff8','RUL6cc0d18a:18b0ebcc705:-109','SURCHG','treasury.facts.SurchargeItem',4),('RC-2b99db48:18b122e2297:-7ffe','RC-2b99db48:18b122e2297:-7ffe','RUL6cc0d18a:18b0ebcc705:-109','BILLITEM','market.facts.MarketBillItem',2),('RC-2b99db48:18b122e2297:-8000','RC-2b99db48:18b122e2297:-8000','RUL6cc0d18a:18b0ebcc705:-109','MBILL','market.facts.MarketBill',1),('RC-4b1e9177:18b07dbbb0f:-7ff9','RC-4b1e9177:18b07dbbb0f:-7ff9','RUL1876b96d:18b0794d721:-7029','MBILL','market.facts.MarketBill',1),('RC-4b1e9177:18b07dbbb0f:-7ffd','RC-4b1e9177:18b07dbbb0f:-7ffd','RUL1876b96d:18b0794d721:-7029','BILLITEM','market.facts.MarketBillItem',2),('RC-56ddf40f:18b0ecc7ce5:-7ff5','RC-56ddf40f:18b0ecc7ce5:-7ff5','RUL6cc0d18a:18b0ebcc705:-677a','MBILL','market.facts.MarketBill',0),('RC-56ddf40f:18b0ecc7ce5:-7ffa','RC-56ddf40f:18b0ecc7ce5:-7ffa','RUL6cc0d18a:18b0ebcc705:-677a','BILLITEM','market.facts.MarketBillItem',2),('RC-56ddf40f:18b0ecc7ce5:-7ffc','RC-56ddf40f:18b0ecc7ce5:-7ffc','RUL6cc0d18a:18b0ebcc705:-677a','MBS','market.facts.MarketBillSchedule',3),('RC-646e0493:18cca0eff43:-7fc9','RC-646e0493:18cca0eff43:-7fc9','RUL6330d0e7:18cc9dc49d7:-390b','MBILL','market.facts.MarketBill',0),('RC-646e0493:18cca0eff43:-7fd0','RC-646e0493:18cca0eff43:-7fd0','RUL6330d0e7:18cc9dc49d7:-390b','BILLITEM','market.facts.MarketBillItem',2),('RC-646e0493:18cca0eff43:-7fd2','RC-646e0493:18cca0eff43:-7fd2','RUL6330d0e7:18cc9dc49d7:-390b','SUR_OLD','treasury.facts.SurchargeItem',3),('RC-702c7fbc:18cc352af48:-7ff6','RC-702c7fbc:18cc352af48:-7ff6','RUL1b458836:18cc2a4fed5:-5b8a','MBILL','market.facts.MarketBill',3),('RC-702c7fbc:18cc352af48:-7ff8','RC-702c7fbc:18cc352af48:-7ff8','RUL1b458836:18cc2a4fed5:-5b8a','PMT','treasury.facts.Payment',0),('RC-702c7fbc:18cc352af48:-7ffc','RC-702c7fbc:18cc352af48:-7ffc','RUL1b458836:18cc2a4fed5:-5b8a','BILLITEM','market.facts.MarketBillItem',1),('RC-7b6570c3:18ca04b6ecd:-7ffc','RC-7b6570c3:18ca04b6ecd:-7ffc','RUL75b9f322:18c9fc081bd:-32b6','MBILL','market.facts.MarketBill',0),('RC-7b6570c3:18ca04b6ecd:-7ffe','RC-7b6570c3:18ca04b6ecd:-7ffe','RUL75b9f322:18c9fc081bd:-32b6','MBS','market.facts.MarketBillSchedule',1),('RC621b7fc5:18cbfcf2e31:-7fb8','RC621b7fc5:18cbfcf2e31:-7fb8','RUL1091bf4a:18cbeb4d763:-5d60','MBILL','market.facts.MarketBill',1),('RC621b7fc5:18cbfcf2e31:-7fba','RC621b7fc5:18cbfcf2e31:-7fba','RUL1091bf4a:18cbeb4d763:-5d60','MBS','market.facts.MarketBillSchedule',3),('RC621b7fc5:18cbfcf2e31:-7fc5','RC621b7fc5:18cbfcf2e31:-7fc5','RUL1091bf4a:18cbeb4d763:-5de6','MBS','market.facts.MarketBillSchedule',1),('RC621b7fc5:18cbfcf2e31:-7fcb','RC621b7fc5:18cbfcf2e31:-7fcb','RUL1091bf4a:18cbeb4d763:-5de6','MBILL','market.facts.MarketBill',1),('RC621b7fc5:18cbfcf2e31:-7fe6','RC621b7fc5:18cbfcf2e31:-7fe6','RUL1091bf4a:18cbeb4d763:-6f17','MBILL','market.facts.MarketBill',0),('RC7056d297:18b32a137cc:-7fc5','RC7056d297:18b32a137cc:-7fc5','RUL4a55ddd7:18b329d84db:-7398','INT','treasury.facts.InterestItem',4),('RC7056d297:18b32a137cc:-7fc8','RC7056d297:18b32a137cc:-7fc8','RUL4a55ddd7:18b329d84db:-7398','ACCT','market.facts.MarketAccount',0),('RC7056d297:18b32a137cc:-7fce','RC7056d297:18b32a137cc:-7fce','RUL4a55ddd7:18b329d84db:-7398','BILLITEM','market.facts.MarketBillItem',2),('RC7056d297:18b32a137cc:-7fd0','RC7056d297:18b32a137cc:-7fd0','RUL4a55ddd7:18b329d84db:-7398','MBILL','market.facts.MarketBill',1),('RC7056d297:18b32a137cc:-7fd8','RC7056d297:18b32a137cc:-7fd8','RUL4a55ddd7:18b329d84db:-7a85','MBILL','market.facts.MarketBill',1),('RC7056d297:18b32a137cc:-7fdb','RC7056d297:18b32a137cc:-7fdb','RUL4a55ddd7:18b329d84db:-7a85','BILLITEM','market.facts.MarketBillItem',2),('RC7056d297:18b32a137cc:-7fe4','RC7056d297:18b32a137cc:-7fe4','RUL4a55ddd7:18b329d84db:-7a85','ACCT','market.facts.MarketAccount',0),('RCC-2b99db48:18b122e2297:-7fcc','RC-2b99db48:18b122e2297:-7fce','RUL6cc0d18a:18b0ebcc705:62','ORGID','string',0),('RCC-2b99db48:18b122e2297:-7fcd','RC-2b99db48:18b122e2297:-7fce','RUL6cc0d18a:18b0ebcc705:62','UNITNO','string',1),('RCC-2b99db48:18b122e2297:-7fd0','RC-2b99db48:18b122e2297:-7fd1','RUL6cc0d18a:18b0ebcc705:62','REFID','string',0),('RCC-2b99db48:18b122e2297:-7fd3','RC-2b99db48:18b122e2297:-7fd4','RUL6cc0d18a:18b0ebcc705:62','AMT','decimal',1),('RCC-2b99db48:18b122e2297:-7fd5','RC-2b99db48:18b122e2297:-7fd7','RUL6cc0d18a:18b0ebcc705:62','ITEMID','string',0),('RCC-2b99db48:18b122e2297:-7fd8','RC-2b99db48:18b122e2297:-7fd9','RUL6cc0d18a:18b0ebcc705:62','BYM','integer',0),('RCC-2b99db48:18b122e2297:-7fe1','RC-2b99db48:18b122e2297:-7fe3','RUL6cc0d18a:18b0ebcc705:e','UNITNO','string',1),('RCC-2b99db48:18b122e2297:-7fe2','RC-2b99db48:18b122e2297:-7fe3','RUL6cc0d18a:18b0ebcc705:e','ORGID','string',0),('RCC-2b99db48:18b122e2297:-7fe4','RC-2b99db48:18b122e2297:-7fe5','RUL6cc0d18a:18b0ebcc705:e','BYM','integer',0),('RCC-2b99db48:18b122e2297:-7fe7','RC-2b99db48:18b122e2297:-7fe9','RUL6cc0d18a:18b0ebcc705:e','OBJID','string',0),('RCC-2b99db48:18b122e2297:-7fe8','RC-2b99db48:18b122e2297:-7fe9','RUL6cc0d18a:18b0ebcc705:e','DISC','decimal',3),('RCC-2b99db48:18b122e2297:-7feb','RC-2b99db48:18b122e2297:-7fec','RUL6cc0d18a:18b0ebcc705:e','AMT','decimal',1),('RCC-2b99db48:18b122e2297:-7ff3','RC-2b99db48:18b122e2297:-7ff5','RUL6cc0d18a:18b0ebcc705:-109','ORGID','string',0),('RCC-2b99db48:18b122e2297:-7ff4','RC-2b99db48:18b122e2297:-7ff5','RUL6cc0d18a:18b0ebcc705:-109','UNITNO','string',1),('RCC-2b99db48:18b122e2297:-7ff7','RC-2b99db48:18b122e2297:-7ff8','RUL6cc0d18a:18b0ebcc705:-109','REFID','string',0),('RCC-2b99db48:18b122e2297:-7ffa','RC-2b99db48:18b122e2297:-7ffb','RUL6cc0d18a:18b0ebcc705:-109','AMT','decimal',1),('RCC-2b99db48:18b122e2297:-7ffc','RC-2b99db48:18b122e2297:-7ffe','RUL6cc0d18a:18b0ebcc705:-109','ITEMID','string',0),('RCC-2b99db48:18b122e2297:-7fff','RC-2b99db48:18b122e2297:-8000','RUL6cc0d18a:18b0ebcc705:-109','BYM','integer',0),('RCC-4b1e9177:18b07dbbb0f:-7ff8','RC-4b1e9177:18b07dbbb0f:-7ff9','RUL1876b96d:18b0794d721:-7029','BYM','integer',0),('RCC-4b1e9177:18b07dbbb0f:-7ffb','RC-4b1e9177:18b07dbbb0f:-7ffd','RUL1876b96d:18b0794d721:-7029','OBJID','string',0),('RCC-4b1e9177:18b07dbbb0f:-7fff','RC-4b1e9177:18b07dbbb0f:-8000','RUL1876b96d:18b0794d721:-7029','AMT','decimal',1),('RCC-56ddf40f:18b0ecc7ce5:-7ff4','RC-56ddf40f:18b0ecc7ce5:-7ff5','RUL6cc0d18a:18b0ebcc705:-677a','BYM','integer',0),('RCC-56ddf40f:18b0ecc7ce5:-7ff6','RC-56ddf40f:18b0ecc7ce5:-7ffa','RUL6cc0d18a:18b0ebcc705:-677a','AMT','decimal',0),('RCC-56ddf40f:18b0ecc7ce5:-7ff8','RC-56ddf40f:18b0ecc7ce5:-7ffa','RUL6cc0d18a:18b0ebcc705:-677a','ITEMID','string',2),('RCC-646e0493:18cca0eff43:-7fc7','RC-646e0493:18cca0eff43:-7fc9','RUL6330d0e7:18cc9dc49d7:-390b','BYM','integer',1),('RCC-646e0493:18cca0eff43:-7fc8','RC-646e0493:18cca0eff43:-7fc9','RUL6330d0e7:18cc9dc49d7:-390b','RATE','decimal',2),('RCC-646e0493:18cca0eff43:-7fca','RC-646e0493:18cca0eff43:-7fcb','RUL6330d0e7:18cc9dc49d7:-390b','TXNDATE','date',0),('RCC-646e0493:18cca0eff43:-7fcd','RC-646e0493:18cca0eff43:-7fd0','RUL6330d0e7:18cc9dc49d7:-390b','BAL','decimal',2),('RCC-646e0493:18cca0eff43:-7fce','RC-646e0493:18cca0eff43:-7fd0','RUL6330d0e7:18cc9dc49d7:-390b','BILLITEMID','string',3),('RCC-646e0493:18cca0eff43:-7fcf','RC-646e0493:18cca0eff43:-7fd0','RUL6330d0e7:18cc9dc49d7:-390b','BILLDATE','date',4),('RCC-7b6570c3:18ca04b6ecd:-7ffb','RC-7b6570c3:18ca04b6ecd:-7ffc','RUL75b9f322:18c9fc081bd:-32b6','MODE','string',0),('RCC-7b6570c3:18ca04b6ecd:-7ffd','RC-7b6570c3:18ca04b6ecd:-7ffe','RUL75b9f322:18c9fc081bd:-32b6','TODATE','date',0),('RCC-7b6570c3:18ca04b6ecd:-7fff','RC-7b6570c3:18ca04b6ecd:-8000','RUL75b9f322:18c9fc081bd:-32b6','TXNDATE','date',0),('RCC621b7fc5:18cbfcf2e31:-7fb1','RC621b7fc5:18cbfcf2e31:-7fb2','RUL1091bf4a:18cbeb4d763:-5d60','TXNDATE','date',0),('RCC621b7fc5:18cbfcf2e31:-7fb3','RC621b7fc5:18cbfcf2e31:-7fb8','RUL1091bf4a:18cbeb4d763:-5d60','MON','integer',1),('RCC621b7fc5:18cbfcf2e31:-7fb4','RC621b7fc5:18cbfcf2e31:-7fb8','RUL1091bf4a:18cbeb4d763:-5d60','YR','integer',0),('RCC621b7fc5:18cbfcf2e31:-7fb5','RC621b7fc5:18cbfcf2e31:-7fb8','RUL1091bf4a:18cbeb4d763:-5d60','PMODE','string',4),('RCC621b7fc5:18cbfcf2e31:-7fb6','RC621b7fc5:18cbfcf2e31:-7fb8','RUL1091bf4a:18cbeb4d763:-5d60','RTYPE','string',3),('RCC621b7fc5:18cbfcf2e31:-7fb7','RC621b7fc5:18cbfcf2e31:-7fb8','RUL1091bf4a:18cbeb4d763:-5d60','RATE','decimal',2),('RCC621b7fc5:18cbfcf2e31:-7fb9','RC621b7fc5:18cbfcf2e31:-7fba','RUL1091bf4a:18cbeb4d763:-5d60','FROMDATE','date',0),('RCC621b7fc5:18cbfcf2e31:-7fc4','RC621b7fc5:18cbfcf2e31:-7fc5','RUL1091bf4a:18cbeb4d763:-5de6','FROMDATE','date',0),('RCC621b7fc5:18cbfcf2e31:-7fc6','RC621b7fc5:18cbfcf2e31:-7fcb','RUL1091bf4a:18cbeb4d763:-5de6','RATE','decimal',2),('RCC621b7fc5:18cbfcf2e31:-7fc7','RC621b7fc5:18cbfcf2e31:-7fcb','RUL1091bf4a:18cbeb4d763:-5de6','RTYPE','string',3),('RCC621b7fc5:18cbfcf2e31:-7fc8','RC621b7fc5:18cbfcf2e31:-7fcb','RUL1091bf4a:18cbeb4d763:-5de6','PMODE','string',4),('RCC621b7fc5:18cbfcf2e31:-7fc9','RC621b7fc5:18cbfcf2e31:-7fcb','RUL1091bf4a:18cbeb4d763:-5de6','YR','integer',0),('RCC621b7fc5:18cbfcf2e31:-7fca','RC621b7fc5:18cbfcf2e31:-7fcb','RUL1091bf4a:18cbeb4d763:-5de6','MON','integer',1),('RCC621b7fc5:18cbfcf2e31:-7fdf','RC621b7fc5:18cbfcf2e31:-7fe0','RUL1091bf4a:18cbeb4d763:-6f17','TXNDATE','date',0),('RCC621b7fc5:18cbfcf2e31:-7fe1','RC621b7fc5:18cbfcf2e31:-7fe6','RUL1091bf4a:18cbeb4d763:-6f17','MON','integer',1),('RCC621b7fc5:18cbfcf2e31:-7fe2','RC621b7fc5:18cbfcf2e31:-7fe6','RUL1091bf4a:18cbeb4d763:-6f17','YR','integer',0),('RCC621b7fc5:18cbfcf2e31:-7fe3','RC621b7fc5:18cbfcf2e31:-7fe6','RUL1091bf4a:18cbeb4d763:-6f17','PMODE','string',4),('RCC621b7fc5:18cbfcf2e31:-7fe5','RC621b7fc5:18cbfcf2e31:-7fe6','RUL1091bf4a:18cbeb4d763:-6f17','RATE','decimal',2),('RCC621b7fc5:18cbfcf2e31:-7fe8','RC621b7fc5:18cbfcf2e31:-7fed','RUL1091bf4a:18cbeb4d763:-6f17','LASTDATE','date',3),('RCC7056d297:18b32a137cc:-7fc3','RC7056d297:18b32a137cc:-7fc5','RUL4a55ddd7:18b329d84db:-7398','REFID','string',0),('RCC7056d297:18b32a137cc:-7fc6','RC7056d297:18b32a137cc:-7fc8','RUL4a55ddd7:18b329d84db:-7398','ORGID','string',0),('RCC7056d297:18b32a137cc:-7fc7','RC7056d297:18b32a137cc:-7fc8','RUL4a55ddd7:18b329d84db:-7398','UNITNO','string',1),('RCC7056d297:18b32a137cc:-7fca','RC7056d297:18b32a137cc:-7fcb','RUL4a55ddd7:18b329d84db:-7398','AMT','decimal',1),('RCC7056d297:18b32a137cc:-7fcc','RC7056d297:18b32a137cc:-7fce','RUL4a55ddd7:18b329d84db:-7398','ITEMID','string',0),('RCC7056d297:18b32a137cc:-7fcf','RC7056d297:18b32a137cc:-7fd0','RUL4a55ddd7:18b329d84db:-7398','BYM','integer',0),('RCC7056d297:18b32a137cc:-7fd7','RC7056d297:18b32a137cc:-7fd8','RUL4a55ddd7:18b329d84db:-7a85','BYM','integer',0),('RCC7056d297:18b32a137cc:-7fda','RC7056d297:18b32a137cc:-7fdb','RUL4a55ddd7:18b329d84db:-7a85','ITEMID','string',0),('RCC7056d297:18b32a137cc:-7fdc','RC7056d297:18b32a137cc:-7fde','RUL4a55ddd7:18b329d84db:-7a85','AMT','decimal',1),('RCC7056d297:18b32a137cc:-7fe2','RC7056d297:18b32a137cc:-7fe4','RUL4a55ddd7:18b329d84db:-7a85','UNITNO','string',1),('RCC7056d297:18b32a137cc:-7fe3','RC7056d297:18b32a137cc:-7fe4','RUL4a55ddd7:18b329d84db:-7a85','ORGID','string',0),('RCOND-397eec50:18ac66691c0:-6fc0','RCOND-397eec50:18ac66691c0:-6fc0','RUL-397eec50:18ac66691c0:-74a0','HOLIDAYS','treasury.facts.HolidayFact',1),('RCOND-397eec50:18ac66691c0:-747c','RCOND-397eec50:18ac66691c0:-747c','RUL-397eec50:18ac66691c0:-74a0','MBS','market.facts.MarketBillSchedule',0),('RCOND-437c586b:18ca10ff822:-3852','RCOND-437c586b:18ca10ff822:-3852','RUL-437c586b:18ca10ff822:-3e1d','BILLITEM','market.facts.MarketBillItem',1),('RCOND-437c586b:18ca10ff822:-3da8','RCOND-437c586b:18ca10ff822:-3da8','RUL-437c586b:18ca10ff822:-3e1d','CRBILL','treasury.facts.CreditBillItem',0),('RCOND-4396564d:18aeb37fa4d:-5f88','RCOND-4396564d:18aeb37fa4d:-5f88','RUL-4396564d:18aeb37fa4d:-601b','DISC','treasury.facts.DiscountItem',0),('RCOND-4396564d:18aeb37fa4d:-6129','RCOND-4396564d:18aeb37fa4d:-6129','RUL-4396564d:18aeb37fa4d:-61e0','CRBILL','treasury.facts.CreditBillItem',2),('RCOND-4396564d:18aeb37fa4d:-724b','RCOND-4396564d:18aeb37fa4d:-724b','RUL-4396564d:18aeb37fa4d:-72d8','PMT','treasury.facts.Payment',0),('RCOND-4396564d:18aeb37fa4d:-7d3e','RCOND-4396564d:18aeb37fa4d:-7d3e','RUL-4396564d:18aeb37fa4d:-7e7c','BILLITEM','market.facts.MarketBillItem',1),('RCOND-4396564d:18aeb37fa4d:-7def','RCOND-4396564d:18aeb37fa4d:-7def','RUL-4396564d:18aeb37fa4d:-7e7c','PMT','treasury.facts.Payment',0),('RCOND-5b2f3581:18af3ee8091:-7bfd','RCOND-5b2f3581:18af3ee8091:-7bfd','RUL74f1631d:18af3c9fee8:-7db6','CRI','treasury.facts.CashReceiptItem',0),('RCOND13be5044:18ccdf11ff7:-7828','RCOND13be5044:18ccdf11ff7:-7828','RUL6330d0e7:18cc9dc49d7:-7c7d','MBS','market.facts.MarketBillSchedule',4),('RCOND1b458836:18cc2a4fed5:-3d7c','RCOND1b458836:18cc2a4fed5:-3d7c','RUL-437c586b:18ca10ff822:-3e1d','MBILL','market.facts.MarketBill',3),('RCOND1b458836:18cc2a4fed5:-5d00','RCOND1b458836:18cc2a4fed5:-5d00','RUL-4396564d:18aeb37fa4d:-7e7c','MBILL','market.facts.MarketBill',3),('RCOND1b458836:18cc2a4fed5:-75f7','RCOND1b458836:18cc2a4fed5:-75f7','RUL1091bf4a:18cbeb4d763:-6f17','MBS','market.facts.MarketBillSchedule',3),('RCOND34c58731:18aea1f9197:-6402','RCOND34c58731:18aea1f9197:-6402','RUL34c58731:18aea1f9197:-7ebd','PMT','treasury.facts.Payment',4),('RCOND34c58731:18aea1f9197:-7124','RCOND34c58731:18aea1f9197:-7124','RUL34c58731:18aea1f9197:-7ebd','BILLITEM','market.facts.MarketBillItem',2),('RCOND34c58731:18aea1f9197:-7421','RCOND34c58731:18aea1f9197:-7421','RUL34c58731:18aea1f9197:-7ebd','MBILL','market.facts.MarketBill',1),('RCOND4a55ddd7:18b329d84db:-795b','RCOND4a55ddd7:18b329d84db:-795b','RUL4a55ddd7:18b329d84db:-7a85','INT','treasury.facts.InterestItem',4),('RCOND6330d0e7:18cc9dc49d7:-43b3','RCOND6330d0e7:18cc9dc49d7:-43b3','RUL6330d0e7:18cc9dc49d7:-443b','ABILLITEM','treasury.facts.AbstractBillItem',0),('RCOND6330d0e7:18cc9dc49d7:-743d','RCOND6330d0e7:18cc9dc49d7:-743d','RUL6330d0e7:18cc9dc49d7:-7c7d','BILLITEM','market.facts.MarketBillItem',2),('RCOND6330d0e7:18cc9dc49d7:-7afc','RCOND6330d0e7:18cc9dc49d7:-7afc','RUL6330d0e7:18cc9dc49d7:-7c7d','MBILL','market.facts.MarketBill',0),('RCOND6cc0d18a:18b0ebcc705:-2db','RCOND6cc0d18a:18b0ebcc705:-2db','RUL-4396564d:18aeb37fa4d:-601b','ACCT','market.facts.MarketAccount',1),('RCOND6cc0d18a:18b0ebcc705:-32c8','RCOND6cc0d18a:18b0ebcc705:-32c8','RUL1876b96d:18b0794d721:-7029','ACCT','market.facts.MarketAccount',0),('RCOND6cc0d18a:18b0ebcc705:-48c2','RCOND6cc0d18a:18b0ebcc705:-48c2','RUL6cc0d18a:18b0ebcc705:-4a6c','NEWINT','treasury.facts.InterestItem',1),('RCOND6cc0d18a:18b0ebcc705:-49f0','RCOND6cc0d18a:18b0ebcc705:-49f0','RUL6cc0d18a:18b0ebcc705:-4a6c','OLDINT','treasury.facts.InterestItem',0),('RCOND6cc0d18a:18b0ebcc705:-614e','RCOND6cc0d18a:18b0ebcc705:-614e','RUL6cc0d18a:18b0ebcc705:-6379','BILLITEM','market.facts.MarketBillItem',2),('RCOND6cc0d18a:18b0ebcc705:-6253','RCOND6cc0d18a:18b0ebcc705:-6253','RUL6cc0d18a:18b0ebcc705:-6379','MBILL','market.facts.MarketBill',1),('RCOND6cc0d18a:18b0ebcc705:-7d18','RCOND6cc0d18a:18b0ebcc705:-7d18','RUL6cc0d18a:18b0ebcc705:-7e8e','BILLITEM','market.facts.MarketBillItem',2),('RCOND6cc0d18a:18b0ebcc705:-7e1d','RCOND6cc0d18a:18b0ebcc705:-7e1d','RUL6cc0d18a:18b0ebcc705:-7e8e','MBILL','market.facts.MarketBill',0),('RCONST-397eec50:18ac66691c0:-726b','RCOND-397eec50:18ac66691c0:-747c','RUL-397eec50:18ac66691c0:-74a0','MON','integer',1),('RCONST-397eec50:18ac66691c0:-72e8','RCOND-397eec50:18ac66691c0:-747c','RUL-397eec50:18ac66691c0:-74a0','YR','integer',0),('RCONST-437c586b:18ca10ff822:-36f9','RCOND-437c586b:18ca10ff822:-3852','RUL-437c586b:18ca10ff822:-3e1d','ISPAID','boolean',0),('RCONST-4396564d:18aeb37fa4d:-5f0a','RCOND-4396564d:18aeb37fa4d:-5f88','RUL-4396564d:18aeb37fa4d:-601b','AMT','decimal',0),('RCONST-4396564d:18aeb37fa4d:-6104','RCOND-4396564d:18aeb37fa4d:-6129','RUL-4396564d:18aeb37fa4d:-61e0','AMT','decimal',0),('RCONST-4396564d:18aeb37fa4d:-7235','RCOND-4396564d:18aeb37fa4d:-724b','RUL-4396564d:18aeb37fa4d:-72d8','AMT','decimal',0),('RCONST-4396564d:18aeb37fa4d:-7a7b','RCOND-4396564d:18aeb37fa4d:-7d3e','RUL-4396564d:18aeb37fa4d:-7e7c','YM','integer',1),('RCONST-6318955a:18b04cf69ac:-7b97','RCOND-5b2f3581:18af3ee8091:-7bfd','RUL74f1631d:18af3c9fee8:-7db6','ORGID','string',1),('RCONST13be5044:18ccdf11ff7:-7768','RCOND13be5044:18ccdf11ff7:-7828','RUL6330d0e7:18cc9dc49d7:-7c7d','EXPIRYDATE','date',0),('RCONST1b458836:18cc2a4fed5:-4a86','RC-702c7fbc:18cc352af48:-7ffc','RUL1b458836:18cc2a4fed5:-5b8a','SORTORDER','integer',4),('RCONST1b458836:18cc2a4fed5:-50da','RC-702c7fbc:18cc352af48:-7ffc','RUL1b458836:18cc2a4fed5:-5b8a','BAL','decimal',3),('RCONST1b458836:18cc2a4fed5:-65c9','RCOND-437c586b:18ca10ff822:-3852','RUL-437c586b:18ca10ff822:-3e1d','SORTORDER','integer',3),('RCONST1b458836:18cc2a4fed5:-758b','RCOND1b458836:18cc2a4fed5:-75f7','RUL1091bf4a:18cbeb4d763:-6f17','TODATE','date',0),('RCONST1b458836:18cc2a4fed5:-7757','RC621b7fc5:18cbfcf2e31:-7fba','RUL1091bf4a:18cbeb4d763:-5d60','TODATE','date',1),('RCONST34c58731:18aea1f9197:-63ec','RCOND34c58731:18aea1f9197:-6402','RUL34c58731:18aea1f9197:-7ebd','PAMT','decimal',0),('RCONST34c58731:18aea1f9197:-6c33','RCOND34c58731:18aea1f9197:-7124','RUL34c58731:18aea1f9197:-7ebd','AMT','decimal',1),('RCONST34c58731:18aea1f9197:-73ab','RCOND34c58731:18aea1f9197:-7421','RUL34c58731:18aea1f9197:-7ebd','BYM','integer',0),('RCONST34c58731:18aea1f9197:-74b6','RCOND34c58731:18aea1f9197:-74e4','RUL34c58731:18aea1f9197:-7ebd','TDATE','date',0),('RCONST4a55ddd7:18b329d84db:-7920','RCOND4a55ddd7:18b329d84db:-795b','RUL4a55ddd7:18b329d84db:-7a85','REFID','string',0),('RCONST5085132e:18ccde5b52a:-7db5','RC-646e0493:18cca0eff43:-7fd2','RUL6330d0e7:18cc9dc49d7:-390b','SURDATE','date',1),('RCONST6330d0e7:18cc9dc49d7:-5b32','RCOND6330d0e7:18cc9dc49d7:-743d','RUL6330d0e7:18cc9dc49d7:-7c7d','BILLDATE','date',4),('RCONST6330d0e7:18cc9dc49d7:-664a','RCOND6330d0e7:18cc9dc49d7:-7afc','RUL6330d0e7:18cc9dc49d7:-7c7d','RATE','decimal',2),('RCONST6330d0e7:18cc9dc49d7:-6a81','RCOND6330d0e7:18cc9dc49d7:-743d','RUL6330d0e7:18cc9dc49d7:-7c7d','BILLITEMID','string',3),('RCONST6330d0e7:18cc9dc49d7:-6cac','RCOND6330d0e7:18cc9dc49d7:-743d','RUL6330d0e7:18cc9dc49d7:-7c7d','BAL','decimal',2),('RCONST6330d0e7:18cc9dc49d7:-7517','RCOND6330d0e7:18cc9dc49d7:-7afc','RUL6330d0e7:18cc9dc49d7:-7c7d','BYM','integer',1),('RCONST6330d0e7:18cc9dc49d7:-790f','RCOND6330d0e7:18cc9dc49d7:-793d','RUL6330d0e7:18cc9dc49d7:-7c7d','TXNDATE','date',0),('RCONST6cc0d18a:18b0ebcc705:-21d','RCOND6cc0d18a:18b0ebcc705:-2db','RUL-4396564d:18aeb37fa4d:-601b','UNITNO','string',1),('RCONST6cc0d18a:18b0ebcc705:-29b','RCOND6cc0d18a:18b0ebcc705:-2db','RUL-4396564d:18aeb37fa4d:-601b','ORGID','string',0),('RCONST6cc0d18a:18b0ebcc705:-3288','RCOND6cc0d18a:18b0ebcc705:-32c8','RUL1876b96d:18b0794d721:-7029','ORGID','string',0),('RCONST6cc0d18a:18b0ebcc705:-495a','RCOND6cc0d18a:18b0ebcc705:-49f0','RUL6cc0d18a:18b0ebcc705:-4a6c','REFID','string',1),('RCONST6cc0d18a:18b0ebcc705:-5734','RCOND6cc0d18a:18b0ebcc705:-614e','RUL6cc0d18a:18b0ebcc705:-6379','SUR','decimal',3),('RCONST6cc0d18a:18b0ebcc705:-580','RCOND6cc0d18a:18b0ebcc705:-32c8','RUL1876b96d:18b0794d721:-7029','UNITNO','string',1),('RCONST6cc0d18a:18b0ebcc705:-5801','RCOND6cc0d18a:18b0ebcc705:-614e','RUL6cc0d18a:18b0ebcc705:-6379','ITEMID','string',2),('RCONST6cc0d18a:18b0ebcc705:-589a','RCOND6cc0d18a:18b0ebcc705:-614e','RUL6cc0d18a:18b0ebcc705:-6379','YM','integer',1),('RCONST6cc0d18a:18b0ebcc705:-5bb2','RCOND6cc0d18a:18b0ebcc705:-614e','RUL6cc0d18a:18b0ebcc705:-6379','AMT','decimal',0),('RCONST6cc0d18a:18b0ebcc705:-61dd','RCOND6cc0d18a:18b0ebcc705:-6253','RUL6cc0d18a:18b0ebcc705:-6379','BYM','integer',0),('RCONST6cc0d18a:18b0ebcc705:-62d8','RCOND6cc0d18a:18b0ebcc705:-6306','RUL6cc0d18a:18b0ebcc705:-6379','TXNDATE','date',0),('RCONST6cc0d18a:18b0ebcc705:-6514','RC-56ddf40f:18b0ecc7ce5:-7ffc','RUL6cc0d18a:18b0ebcc705:-677a','FROMDATE','date',1),('RCONST6cc0d18a:18b0ebcc705:-7264','RCOND6cc0d18a:18b0ebcc705:-7292','RUL6cc0d18a:18b0ebcc705:-7e8e','TXNDATE','date',0),('RCONST6cc0d18a:18b0ebcc705:-76d0','RCOND6cc0d18a:18b0ebcc705:-7d18','RUL6cc0d18a:18b0ebcc705:-7e8e','ITEMID','string',2),('RCONST6cc0d18a:18b0ebcc705:-7ae0','RCOND6cc0d18a:18b0ebcc705:-7d18','RUL6cc0d18a:18b0ebcc705:-7e8e','AMT','decimal',0),('RCONST6cc0d18a:18b0ebcc705:-7da7','RCOND6cc0d18a:18b0ebcc705:-7e1d','RUL6cc0d18a:18b0ebcc705:-7e8e','BYM','integer',0),('RCONST75b9f322:18c9fc081bd:-26e9','RCOND6cc0d18a:18b0ebcc705:-7e1d','RUL6cc0d18a:18b0ebcc705:-7e8e','DUEDATE','date',2),('RCONST75b9f322:18c9fc081bd:-2cdf','RC-7b6570c3:18ca04b6ecd:-7ffe','RUL75b9f322:18c9fc081bd:-32b6','DUEDATE','date',2);
/*!40000 ALTER TABLE `sys_rule_condition_var` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_deployed`
--

DROP TABLE IF EXISTS `sys_rule_deployed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_deployed` (
  `objid` varchar(50) NOT NULL,
  `ruletext` longtext,
  PRIMARY KEY (`objid`),
  CONSTRAINT `sys_rule_deployed_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `sys_rule` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_deployed`
--

LOCK TABLES `sys_rule_deployed` WRITE;
/*!40000 ALTER TABLE `sys_rule_deployed` DISABLE KEYS */;
INSERT INTO `sys_rule_deployed` VALUES ('RUL-397eec50:18ac66691c0:-74a0','\npackage marketbillingschedule.SET_STANDARD_SCHEDULE;\nimport marketbillingschedule.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"SET_STANDARD_SCHEDULE\"\n	agenda-group \"set-schedule\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		MBS: market.facts.MarketBillSchedule (  YR:year,MON:month,name matches \"DEFAULT\" ) \n		\n		HOLIDAYS: treasury.facts.HolidayFact (   ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"MBS\", MBS );\n		\n		bindings.put(\"YR\", YR );\n		\n		bindings.put(\"HOLIDAYS\", HOLIDAYS );\n		\n		bindings.put(\"MON\", MON );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"billschedule\", MBS );\n_p0.put( \"fromdate\", (new ActionExpression(\"@DATE( YR ,  MON ,  1 )\", bindings)) );\n_p0.put( \"todate\", (new ActionExpression(\"@MONTHEND( @DATE( YR ,  MON ,  1 ) )\", bindings)) );\n_p0.put( \"billdate\", (new ActionExpression(\"@DATE( YR ,  MON ,  1 )\", bindings)) );\n_p0.put( \"duedate\", (new ActionExpression(\"@FINDNEXTWORKDAY( @DATE( YR , MON ,  20 ), HOLIDAYS, 1 )\", bindings)) );\n_p0.put( \"expirydate\", (new ActionExpression(\"@MONTHEND( @DATE( YR ,  MON ,  1 ) )\", bindings)) );\naction.execute( \"set-market-bill-schedule\",_p0,drools);\n\nend\n\n\n	'),('RUL-437c586b:18ca10ff822:-3e1d','\npackage marketbilling.APPLY_ADVANCE_CREDITS;\nimport marketbilling.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"APPLY_ADVANCE_CREDITS\"\n	agenda-group \"apply-credits\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		CRBILL: treasury.facts.CreditBillItem (  unusedbalance > 0.00 ) \n		\n		BILLITEM: market.facts.MarketBillItem (  ISPAID:paid == false ,billcode matches \"MARKET_RENTAL\",balance > 0.00,SORTORDER:sortorder ) \n		\n		not ( market.facts.MarketBillItem (  paid == false ,billcode matches \"MARKET_RENTAL\",balance > 0.00,sortorder < SORTORDER ) )\n		\n		MBILL: market.facts.MarketBill (  paymentmode matches \"DAILY\" ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"CRBILL\", CRBILL );\n		\n		bindings.put(\"ISPAID\", ISPAID );\n		\n		bindings.put(\"BILLITEM\", BILLITEM );\n		\n		bindings.put(\"MBILL\", MBILL );\n		\n		bindings.put(\"SORTORDER\", SORTORDER );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"billitem\", BILLITEM );\n_p0.put( \"creditbillitem\", CRBILL );\naction.execute( \"apply-billitem-credit\",_p0,drools);\n\nend\n\n\n	'),('RUL-4396564d:18aeb37fa4d:-601b','\npackage marketpayment.MAP_DISCOUNT;\nimport marketpayment.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"MAP_DISCOUNT\"\n	agenda-group \"map-account\"\n	salience 20000\n	no-loop\n	when\n		\n		\n		DISC: treasury.facts.DiscountItem (  AMT:amount > 0.00 ) \n		\n		ACCT: market.facts.MarketAccount (  ORGID:orgid,UNITNO:unitno ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"DISC\", DISC );\n		\n		bindings.put(\"AMT\", AMT );\n		\n		bindings.put(\"ORGID\", ORGID );\n		\n		bindings.put(\"ACCT\", ACCT );\n		\n		bindings.put(\"UNITNO\", UNITNO );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"amount\", (new ActionExpression(\"0 - AMT\", bindings)) );\n_p0.put( \"groupid\", (new ActionExpression(\"ORGID + \'_\' + UNITNO + \'_ADVANCE\'\", bindings)) );\n_p0.put( \"sortorder\", (new ActionExpression(\"3000\", bindings)) );\n_p0.put( \"billcode\", new KeyValue(\"MARKET_RENTAL_DISCOUNT\", \"MARKET RENTAL DISCOUNT\") );\naction.execute( \"add-cashreceipt-item\",_p0,drools);\n\nend\n\n\n	'),('RUL-4396564d:18aeb37fa4d:-61e0','\npackage marketpayment.MAP_RENTAL_ADVANCE;\nimport marketpayment.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"MAP_RENTAL_ADVANCE\"\n	agenda-group \"map-account\"\n	salience 1000\n	no-loop\n	when\n		\n		\n		CRBILL: treasury.facts.CreditBillItem (  AMT:unusedbalance ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"AMT\", AMT );\n		\n		bindings.put(\"CRBILL\", CRBILL );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"account\", new KeyValue(\"ITEMACCT7842de84:157f95fa984:-58f1\", \"INCOME FROM MARKET - RENTALS\") );\n_p0.put( \"amount\", (new ActionExpression(\"AMT\", bindings)) );\n_p0.put( \"groupid\", (new ActionExpression(\"\'BASIC\'\", bindings)) );\n_p0.put( \"sortorder\", (new ActionExpression(\"8000\", bindings)) );\naction.execute( \"add-cashreceipt-item\",_p0,drools);\n\nend\n\n\n	'),('RUL-4396564d:18aeb37fa4d:-72d8','\npackage marketpayment.APPLY_EXCESS_PAYMENT;\nimport marketpayment.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"APPLY_EXCESS_PAYMENT\"\n	agenda-group \"after-apply-payment\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		PMT: treasury.facts.Payment (  AMT:amount > 0.00 ) \n		\n		not ( treasury.facts.DiscountItem (  amount == AMT ) )\n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"PMT\", PMT );\n		\n		bindings.put(\"AMT\", AMT );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"billcode\", new KeyValue(\"MARKET_ADVANCE_PAYMENT\", \"MARKET ADVANCE PAYMENT\") );\n_p0.put( \"amount\", (new ActionExpression(\"AMT\", bindings)) );\n_p0.put( \"payment\", PMT );\naction.execute( \"add-credit-billitem\",_p0,drools);\n\nend\n\n\n	'),('RUL-4396564d:18aeb37fa4d:-7e7c','\npackage marketpayment.APPLY_BILLITEM_PAYMENT;\nimport marketpayment.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"APPLY_BILLITEM_PAYMENT\"\n	agenda-group \"apply-payment\"\n	salience 50000\n	\n	when\n		\n		\n		PMT: treasury.facts.Payment (  amount > 0.00 ) \n		\n		BILLITEM: market.facts.MarketBillItem (  paid == false ,YM:yearmonth,billcode matches \"MARKET_RENTAL\" ) \n		\n		not ( market.facts.MarketBillItem (  paid == false ,billcode matches \"MARKET_RENTAL\",yearmonth < YM ) )\n		\n		MBILL: market.facts.MarketBill (  paymentmode matches \"MONTHLY\" ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"PMT\", PMT );\n		\n		bindings.put(\"BILLITEM\", BILLITEM );\n		\n		bindings.put(\"YM\", YM );\n		\n		bindings.put(\"MBILL\", MBILL );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"payment\", PMT );\n_p0.put( \"billitem\", BILLITEM );\naction.execute( \"apply-billitem-payment\",_p0,drools);\n\nend\n\n\n	'),('RUL-6e742724:18d9c37d0d5:-7da7','\npackage marketbilling.TRANSFER_UNIT_FEES;\nimport marketbilling.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"TRANSFER_UNIT_FEES\"\n	agenda-group \"compute-fees\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		 market.facts.MarketTxn (  typeid matches \"TRANSFER_UNIT\" ) \n		\n	then\n		Map bindings = new HashMap();\n		\n	Map _p0 = new HashMap();\n_p0.put( \"amount\", (new ActionExpression(\"100\", bindings)) );\n_p0.put( \"billcode\", new KeyValue(\"MARKET_TRANSFER_UNIT_FEE\", \"MARKET TRANSFER FEE\") );\naction.execute( \"add-billitem\",_p0,drools);\n\nend\n\n\n	'),('RUL1091bf4a:18cbeb4d763:-5d60','\npackage marketbilling.COMPUTE_RENTAL_DAILY_INITIAL;\nimport marketbilling.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"COMPUTE_RENTAL_DAILY_INITIAL\"\n	agenda-group \"compute-fees\"\n	salience 60000\n	no-loop\n	when\n		\n		\n		MBILL: market.facts.MarketBill (  YR:year,MON:month,RATE:rate,RTYPE:ratetype,PMODE:paymentmode matches \"DAILY\" ) \n		\n		 treasury.facts.TransactionDate (  TXNDATE:date ) \n		\n		not ( market.facts.MarketBillItem (  year == YR,month == MON ) )\n		\n		MBS: market.facts.MarketBillSchedule (  FROMDATE:fromdate,TODATE:todate ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"FROMDATE\", FROMDATE );\n		\n		bindings.put(\"TXNDATE\", TXNDATE );\n		\n		bindings.put(\"YR\", YR );\n		\n		bindings.put(\"MBILL\", MBILL );\n		\n		bindings.put(\"TODATE\", TODATE );\n		\n		bindings.put(\"MON\", MON );\n		\n		bindings.put(\"RATE\", RATE );\n		\n		bindings.put(\"RTYPE\", RTYPE );\n		\n		bindings.put(\"MBS\", MBS );\n		\n		bindings.put(\"PMODE\", PMODE );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"account\", new KeyValue(\"MARKET_RENTAL\", \"MARKET RENTAL\") );\n_p0.put( \"amount\", (new ActionExpression(\"( @DAYDIFF( FROMDATE, @IIF( TXNDATE > TODATE , TODATE , TXNDATE ) ) + 1) * RATE\", bindings)) );\n_p0.put( \"year\", YR );\n_p0.put( \"month\", MON );\n_p0.put( \"billdate\", (new ActionExpression(\"@IIF( TXNDATE > TODATE , TODATE , TXNDATE )\", bindings)) );\n_p0.put( \"remarks\", (new ActionExpression(\"@DATEFORMAT( FROMDATE , \'MMM dd\'  )  +  \' to \' + @DATEFORMAT( @IIF( TXNDATE > TODATE , TODATE , TXNDATE ), \'MMM dd\' ); \", bindings)) );\naction.execute( \"add-market-billitem\",_p0,drools);\n\nend\n\n\n	'),('RUL1091bf4a:18cbeb4d763:-5de6','\npackage marketbilling.COMPUTE_MONTHLY_RENTAL_FEE;\nimport marketbilling.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"COMPUTE_MONTHLY_RENTAL_FEE\"\n	agenda-group \"compute-fees\"\n	salience 70000\n	no-loop\n	when\n		\n		\n		MBS: market.facts.MarketBillSchedule (  FROMDATE:fromdate ) \n		\n		MBILL: market.facts.MarketBill (  YR:year,MON:month,RATE:rate,RTYPE:ratetype,PMODE:paymentmode matches \"MONTHLY\" ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"FROMDATE\", FROMDATE );\n		\n		bindings.put(\"YR\", YR );\n		\n		bindings.put(\"MBS\", MBS );\n		\n		bindings.put(\"MBILL\", MBILL );\n		\n		bindings.put(\"MON\", MON );\n		\n		bindings.put(\"RATE\", RATE );\n		\n		bindings.put(\"RTYPE\", RTYPE );\n		\n		bindings.put(\"PMODE\", PMODE );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"account\", new KeyValue(\"MARKET_RENTAL\", \"MARKET RENTAL\") );\n_p0.put( \"amount\", (new ActionExpression(\"if (  RTYPE == \'DAY\'  ){     return RATE * @DAY( @MONTHEND( @DATE(  YR, MON , 1 ) ));  }; else {     return RATE; }; \", bindings)) );\n_p0.put( \"year\", YR );\n_p0.put( \"month\", MON );\naction.execute( \"add-market-billitem\",_p0,drools);\n\nend\n\n\n	'),('RUL1091bf4a:18cbeb4d763:-6f17','\npackage marketbilling.COMPUTE_RENTAL_DAILY_ADD_DAY;\nimport marketbilling.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"COMPUTE_RENTAL_DAILY_ADD_DAY\"\n	agenda-group \"compute-fees\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		MBILL: market.facts.MarketBill (  YR:year,MON:month,RATE:rate,PMODE:paymentmode matches \"DAILY\" ) \n		\n		 treasury.facts.TransactionDate (  TXNDATE:date ) \n		\n		 market.facts.MarketBillItem (  year == YR,month == MON,input == true ,LASTDATE:billdate ) \n		\n		MBS: market.facts.MarketBillSchedule (  TODATE:todate ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"MBILL\", MBILL );\n		\n		bindings.put(\"TXNDATE\", TXNDATE );\n		\n		bindings.put(\"YR\", YR );\n		\n		bindings.put(\"TODATE\", TODATE );\n		\n		bindings.put(\"MON\", MON );\n		\n		bindings.put(\"RATE\", RATE );\n		\n		bindings.put(\"LASTDATE\", LASTDATE );\n		\n		bindings.put(\"MBS\", MBS );\n		\n		bindings.put(\"PMODE\", PMODE );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"account\", new KeyValue(\"MARKET_RENTAL\", \"MARKET RENTAL\") );\n_p0.put( \"amount\", (new ActionExpression(\"@DAYDIFF( LASTDATE, @IIF( TXNDATE > TODATE , TODATE , TXNDATE ) ) * RATE  \", bindings)) );\n_p0.put( \"year\", YR );\n_p0.put( \"month\", MON );\n_p0.put( \"billdate\", (new ActionExpression(\"@IIF( TXNDATE > TODATE , TODATE , TXNDATE )\", bindings)) );\n_p0.put( \"remarks\", (new ActionExpression(\"def _from = @DATEFORMAT( @DAYADD( LASTDATE, 1), \'MMM dd\' ); def _to = @DATEFORMAT( @IIF( TXNDATE > TODATE , TODATE , TXNDATE ), \'MMM dd\' );  if( _from == _to ) {      return _from; };  else {     return _from + \' to \' + _to; };   \", bindings)) );\naction.execute( \"add-market-billitem\",_p0,drools);\n\nend\n\n\n	'),('RUL1876b96d:18b0794d721:-7029','\npackage marketpayment.MAP_RENTAL_BILL_PREVIOUS;\nimport marketpayment.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"MAP_RENTAL_BILL_PREVIOUS\"\n	agenda-group \"map-account\"\n	salience 60000\n	no-loop\n	when\n		\n		\n		ACCT: market.facts.MarketAccount (  ORGID:orgid,UNITNO:unitno ) \n		\n		MBILL: market.facts.MarketBill (  BYM:yearmonth ) \n		\n		BILLITEM: market.facts.MarketBillItem (  OBJID:objid,billcode matches \"MARKET_RENTAL\",yearmonth < BYM ) \n		\n		 treasury.facts.PaymentItem (  billitemrefid == OBJID,AMT:amount ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"BYM\", BYM );\n		\n		bindings.put(\"OBJID\", OBJID );\n		\n		bindings.put(\"ACCT\", ACCT );\n		\n		bindings.put(\"ORGID\", ORGID );\n		\n		bindings.put(\"MBILL\", MBILL );\n		\n		bindings.put(\"AMT\", AMT );\n		\n		bindings.put(\"UNITNO\", UNITNO );\n		\n		bindings.put(\"BILLITEM\", BILLITEM );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"billitem\", BILLITEM );\n_p0.put( \"amount\", (new ActionExpression(\"AMT\", bindings)) );\n_p0.put( \"groupid\", (new ActionExpression(\"ORGID + \'_\'+ UNITNO + \'_RENTAL_PREVIOUS\'\", bindings)) );\n_p0.put( \"sortorder\", (new ActionExpression(\"1000\", bindings)) );\n_p0.put( \"orgid\", ORGID );\n_p0.put( \"billcode\", new KeyValue(\"MARKET_RENTAL_PREVIOUS\", \"MARKET RENTAL PREVIOUS\") );\naction.execute( \"add-cashreceipt-item\",_p0,drools);\n\nend\n\n\n	'),('RUL1b458836:18cc2a4fed5:-5b8a','\npackage marketpayment.APPLY_BILLITEM_PAYMENT_DAILY;\nimport marketpayment.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"APPLY_BILLITEM_PAYMENT_DAILY\"\n	agenda-group \"apply-payment\"\n	salience 50000\n	\n	when\n		\n		\n		PMT: treasury.facts.Payment (  amount > 0.00 ) \n		\n		BILLITEM: market.facts.MarketBillItem (  paid == false ,billcode matches \"MARKET_RENTAL\",BAL:balance > 0.00,SORTORDER:sortorder ) \n		\n		not ( market.facts.MarketBillItem (  paid == false ,billcode matches \"MARKET_RENTAL\",balance > 0.00,sortorder < SORTORDER ) )\n		\n		MBILL: market.facts.MarketBill (  paymentmode matches \"DAILY\" ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"PMT\", PMT );\n		\n		bindings.put(\"BILLITEM\", BILLITEM );\n		\n		bindings.put(\"MBILL\", MBILL );\n		\n		bindings.put(\"BAL\", BAL );\n		\n		bindings.put(\"SORTORDER\", SORTORDER );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"payment\", PMT );\n_p0.put( \"billitem\", BILLITEM );\naction.execute( \"apply-billitem-payment\",_p0,drools);\n\nend\n\n\n	'),('RUL4a55ddd7:18b329d84db:-7398','\npackage marketpayment.MAP_INTEREST_PREVIOUS;\nimport marketpayment.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"MAP_INTEREST_PREVIOUS\"\n	agenda-group \"map-account\"\n	salience 13000\n	no-loop\n	when\n		\n		\n		ACCT: market.facts.MarketAccount (  ORGID:orgid,UNITNO:unitno ) \n		\n		MBILL: market.facts.MarketBill (  BYM:yearmonth ) \n		\n		BILLITEM: market.facts.MarketBillItem (  ITEMID:objid,yearmonth < BYM ) \n		\n		INT: treasury.facts.InterestItem (  REFID:objid,billitemrefid == ITEMID ) \n		\n		 treasury.facts.PaymentItem (  billitemrefid == REFID,AMT:amount ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"BYM\", BYM );\n		\n		bindings.put(\"ITEMID\", ITEMID );\n		\n		bindings.put(\"ORGID\", ORGID );\n		\n		bindings.put(\"REFID\", REFID );\n		\n		bindings.put(\"ACCT\", ACCT );\n		\n		bindings.put(\"MBILL\", MBILL );\n		\n		bindings.put(\"UNITNO\", UNITNO );\n		\n		bindings.put(\"AMT\", AMT );\n		\n		bindings.put(\"BILLITEM\", BILLITEM );\n		\n		bindings.put(\"INT\", INT );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"billitem\", INT );\n_p0.put( \"amount\", (new ActionExpression(\"AMT\", bindings)) );\n_p0.put( \"groupid\", (new ActionExpression(\"ORGID + \'_\' + UNITNO + \'_INTEREST_PREVIOUS\'\", bindings)) );\n_p0.put( \"sortorder\", (new ActionExpression(\"6000\", bindings)) );\n_p0.put( \"orgid\", ORGID );\n_p0.put( \"billcode\", new KeyValue(\"MARKET_RENTAL_INTEREST_PREVIOUS\", \"MARKET RENTAL PREVIOUS INTEREST\") );\naction.execute( \"add-cashreceipt-item\",_p0,drools);\n\nend\n\n\n	'),('RUL4a55ddd7:18b329d84db:-7a85','\npackage marketpayment.MAP_INTEREST_CURRENT;\nimport marketpayment.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"MAP_INTEREST_CURRENT\"\n	agenda-group \"map-account\"\n	salience 12000\n	no-loop\n	when\n		\n		\n		ACCT: market.facts.MarketAccount (  ORGID:orgid,UNITNO:unitno ) \n		\n		MBILL: market.facts.MarketBill (  BYM:yearmonth ) \n		\n		BILLITEM: market.facts.MarketBillItem (  ITEMID:objid,yearmonth == BYM ) \n		\n		INT: treasury.facts.InterestItem (  REFID:objid,billitemrefid == ITEMID ) \n		\n		 treasury.facts.PaymentItem (  billitemrefid == REFID,AMT:amount ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"REFID\", REFID );\n		\n		bindings.put(\"ORGID\", ORGID );\n		\n		bindings.put(\"ACCT\", ACCT );\n		\n		bindings.put(\"BYM\", BYM );\n		\n		bindings.put(\"ITEMID\", ITEMID );\n		\n		bindings.put(\"UNITNO\", UNITNO );\n		\n		bindings.put(\"AMT\", AMT );\n		\n		bindings.put(\"MBILL\", MBILL );\n		\n		bindings.put(\"BILLITEM\", BILLITEM );\n		\n		bindings.put(\"INT\", INT );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"billitem\", INT );\n_p0.put( \"amount\", (new ActionExpression(\"AMT\", bindings)) );\n_p0.put( \"groupid\", (new ActionExpression(\"ORGID + \'_\' + UNITNO + \'_INTEREST_CURRENT\'\", bindings)) );\n_p0.put( \"sortorder\", (new ActionExpression(\"7000\", bindings)) );\n_p0.put( \"orgid\", ORGID );\n_p0.put( \"billcode\", new KeyValue(\"MARKET_RENTAL_INTEREST\", \"MARKET RENTAL INTEREST\") );\naction.execute( \"add-cashreceipt-item\",_p0,drools);\n\nend\n\n\n	'),('RUL6330d0e7:18cc9dc49d7:-390b','\npackage marketbilling.COMPUTE_DAILY_SURCHARGE_SUPERSEDE;\nimport marketbilling.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"COMPUTE_DAILY_SURCHARGE_SUPERSEDE\"\n	agenda-group \"compute-surcharge\"\n	salience 60000\n	no-loop\n	when\n		\n		\n		MBILL: market.facts.MarketBill (  paymentmode matches \"DAILY\",BYM:yearmonth,RATE:rate ) \n		\n		 treasury.facts.TransactionDate (  TXNDATE:date ) \n		\n		BILLITEM: market.facts.MarketBillItem (  yearmonth == BYM,BAL:balance,BILLITEMID:objid,BILLDATE:billdate ) \n		\n		SUR_OLD: treasury.facts.SurchargeItem (  billitemrefid == BILLITEMID,SURDATE:billdate == BILLDATE,input == true  ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"MBILL\", MBILL );\n		\n		bindings.put(\"TXNDATE\", TXNDATE );\n		\n		bindings.put(\"BYM\", BYM );\n		\n		bindings.put(\"SURDATE\", SURDATE );\n		\n		bindings.put(\"RATE\", RATE );\n		\n		bindings.put(\"BILLITEM\", BILLITEM );\n		\n		bindings.put(\"BAL\", BAL );\n		\n		bindings.put(\"SUR_OLD\", SUR_OLD );\n		\n		bindings.put(\"BILLITEMID\", BILLITEMID );\n		\n		bindings.put(\"BILLDATE\", BILLDATE );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"billitem\", BILLITEM );\n_p0.put( \"amount\", (new ActionExpression(\"BAL * 0.10\", bindings)) );\n_p0.put( \"billcode\", new KeyValue(\"MARKET_RENTAL_SURCHARGE\", \"MARKET RENTAL SURCHARGE\") );\n_p0.put( \"billdate\", (new ActionExpression(\"@DAYADD( BILLDATE, 1 )\", bindings)) );\n_p0.put( \"supersededbillitem\", SUR_OLD );\naction.execute( \"add-surcharge-item\",_p0,drools);\n\nend\n\n\n	'),('RUL6330d0e7:18cc9dc49d7:-7c7d','\npackage marketbilling.COMPUTE_DAILY_SURCHARGE;\nimport marketbilling.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"COMPUTE_DAILY_SURCHARGE\"\n	agenda-group \"compute-surcharge\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		MBILL: market.facts.MarketBill (  paymentmode matches \"DAILY\",BYM:yearmonth,RATE:rate ) \n		\n		 treasury.facts.TransactionDate (  TXNDATE:date ) \n		\n		BILLITEM: market.facts.MarketBillItem (  yearmonth == BYM,BAL:balance,BILLITEMID:objid,BILLDATE:billdate ) \n		\n		not ( treasury.facts.SurchargeItem (  billitemrefid == BILLITEMID ) )\n		\n		MBS: market.facts.MarketBillSchedule (  EXPIRYDATE:expirydate ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"TXNDATE\", TXNDATE );\n		\n		bindings.put(\"MBILL\", MBILL );\n		\n		bindings.put(\"EXPIRYDATE\", EXPIRYDATE );\n		\n		bindings.put(\"BYM\", BYM );\n		\n		bindings.put(\"BAL\", BAL );\n		\n		bindings.put(\"RATE\", RATE );\n		\n		bindings.put(\"BILLITEM\", BILLITEM );\n		\n		bindings.put(\"BILLITEMID\", BILLITEMID );\n		\n		bindings.put(\"BILLDATE\", BILLDATE );\n		\n		bindings.put(\"MBS\", MBS );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"billitem\", BILLITEM );\n_p0.put( \"amount\", (new ActionExpression(\"if( TXNDATE <= BILLDATE ) {      return (BAL - RATE) * 0.10; }; else if( TXNDATE >= EXPIRYDATE ) {      return (BAL - RATE) * 0.10; }; else {      return BAL * 0.10; };\", bindings)) );\n_p0.put( \"billcode\", new KeyValue(\"MARKET_RENTAL_SURCHARGE\", \"MARKET RENTAL SURCHARGE\") );\n_p0.put( \"billdate\", (new ActionExpression(\"if( TXNDATE <= BILLDATE ) {      return BILLDATE; }; else if( TXNDATE >= EXPIRYDATE ) {      return EXPIRYDATE; }; else {      return @DAYADD( BILLDATE , 1 ); };\", bindings)) );\naction.execute( \"add-surcharge-item\",_p0,drools);\n\nend\n\n\n	'),('RUL6cc0d18a:18b0ebcc705:-109','\npackage marketpayment.MAP_SURCHARGE_PREVIOUS;\nimport marketpayment.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"MAP_SURCHARGE_PREVIOUS\"\n	agenda-group \"map-account\"\n	salience 14000\n	no-loop\n	when\n		\n		\n		ACCT: market.facts.MarketAccount (  ORGID:orgid,UNITNO:unitno ) \n		\n		MBILL: market.facts.MarketBill (  BYM:yearmonth ) \n		\n		BILLITEM: market.facts.MarketBillItem (  ITEMID:objid,yearmonth < BYM ) \n		\n		SURCHG: treasury.facts.SurchargeItem (  REFID:objid,billitemrefid == ITEMID ) \n		\n		 treasury.facts.PaymentItem (  billitemrefid == REFID,AMT:amount ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"ACCT\", ACCT );\n		\n		bindings.put(\"ITEMID\", ITEMID );\n		\n		bindings.put(\"REFID\", REFID );\n		\n		bindings.put(\"BYM\", BYM );\n		\n		bindings.put(\"ORGID\", ORGID );\n		\n		bindings.put(\"MBILL\", MBILL );\n		\n		bindings.put(\"AMT\", AMT );\n		\n		bindings.put(\"UNITNO\", UNITNO );\n		\n		bindings.put(\"BILLITEM\", BILLITEM );\n		\n		bindings.put(\"SURCHG\", SURCHG );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"billitem\", SURCHG );\n_p0.put( \"amount\", (new ActionExpression(\"AMT\", bindings)) );\n_p0.put( \"groupid\", (new ActionExpression(\"ORGID + \'_\' + UNITNO + \'_SURCHARGE_PREVIOUS\'\", bindings)) );\n_p0.put( \"sortorder\", (new ActionExpression(\"5000\", bindings)) );\n_p0.put( \"orgid\", ORGID );\n_p0.put( \"billcode\", new KeyValue(\"MARKET_RENTAL_SURCHARGE_PREVIOUS\", \"MARKET RENTAL PREVIOUS SURCHARGE\") );\naction.execute( \"add-cashreceipt-item\",_p0,drools);\n\nend\n\n\n	'),('RUL6cc0d18a:18b0ebcc705:62','\npackage marketpayment.MAP_SURCHARGE_CURRENT;\nimport marketpayment.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"MAP_SURCHARGE_CURRENT\"\n	agenda-group \"map-account\"\n	salience 15000\n	no-loop\n	when\n		\n		\n		ACCT: market.facts.MarketAccount (  ORGID:orgid,UNITNO:unitno ) \n		\n		MBILL: market.facts.MarketBill (  BYM:yearmonth ) \n		\n		BILLITEM: market.facts.MarketBillItem (  ITEMID:objid,yearmonth == BYM ) \n		\n		SURCHG: treasury.facts.SurchargeItem (  REFID:objid,billitemrefid == ITEMID ) \n		\n		 treasury.facts.PaymentItem (  billitemrefid == REFID,AMT:amount ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"ACCT\", ACCT );\n		\n		bindings.put(\"ITEMID\", ITEMID );\n		\n		bindings.put(\"REFID\", REFID );\n		\n		bindings.put(\"BYM\", BYM );\n		\n		bindings.put(\"ORGID\", ORGID );\n		\n		bindings.put(\"MBILL\", MBILL );\n		\n		bindings.put(\"AMT\", AMT );\n		\n		bindings.put(\"UNITNO\", UNITNO );\n		\n		bindings.put(\"BILLITEM\", BILLITEM );\n		\n		bindings.put(\"SURCHG\", SURCHG );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"billitem\", SURCHG );\n_p0.put( \"amount\", (new ActionExpression(\"AMT\", bindings)) );\n_p0.put( \"groupid\", (new ActionExpression(\"ORGID + \'_\' + UNITNO + \'_SURCHARGE_CURRENT\'\", bindings)) );\n_p0.put( \"sortorder\", (new ActionExpression(\"4000\", bindings)) );\n_p0.put( \"orgid\", ORGID );\n_p0.put( \"billcode\", new KeyValue(\"MARKET_RENTAL_SURCHARGE\", \"MARKET RENTAL SURCHARGE\") );\naction.execute( \"add-cashreceipt-item\",_p0,drools);\n\nend\n\n\n	'),('RUL6cc0d18a:18b0ebcc705:e','\npackage marketpayment.MAP_RENTAL_BILL_CURRENT;\nimport marketpayment.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"MAP_RENTAL_BILL_CURRENT\"\n	agenda-group \"map-account\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		ACCT: market.facts.MarketAccount (  ORGID:orgid,UNITNO:unitno ) \n		\n		MBILL: market.facts.MarketBill (  BYM:yearmonth ) \n		\n		BILLITEM: market.facts.MarketBillItem (  OBJID:objid,yearmonth == BYM,DISC:discount ) \n		\n		 treasury.facts.PaymentItem (  billitemrefid == OBJID,AMT:amount ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"ACCT\", ACCT );\n		\n		bindings.put(\"ORGID\", ORGID );\n		\n		bindings.put(\"BYM\", BYM );\n		\n		bindings.put(\"OBJID\", OBJID );\n		\n		bindings.put(\"MBILL\", MBILL );\n		\n		bindings.put(\"UNITNO\", UNITNO );\n		\n		bindings.put(\"AMT\", AMT );\n		\n		bindings.put(\"BILLITEM\", BILLITEM );\n		\n		bindings.put(\"DISC\", DISC );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"billitem\", BILLITEM );\n_p0.put( \"amount\", (new ActionExpression(\"AMT + DISC\", bindings)) );\n_p0.put( \"groupid\", (new ActionExpression(\"ORGID + \'_\' + UNITNO + \'_RENTAL_CURRENT\'\", bindings)) );\n_p0.put( \"sortorder\", (new ActionExpression(\"2000\", bindings)) );\n_p0.put( \"orgid\", ORGID );\n_p0.put( \"billcode\", new KeyValue(\"MARKET_RENTAL\", \"MARKET RENTAL\") );\naction.execute( \"add-cashreceipt-item\",_p0,drools);\n\nend\n\n\n	'),('RUL75b9f322:18c9fc081bd:-32b6','\npackage marketbilling.SET_BILL_DUEDATE_AND_VALIDITYDATE;\nimport marketbilling.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"SET_BILL_DUEDATE_AND_VALIDITYDATE\"\n	agenda-group \"summary\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		MBILL: market.facts.MarketBill (  MODE:paymentmode ) \n		\n		MBS: market.facts.MarketBillSchedule (  TODATE:todate,DUEDATE:duedate ) \n		\n		 treasury.facts.TransactionDate (  TXNDATE:date ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"MBILL\", MBILL );\n		\n		bindings.put(\"MODE\", MODE );\n		\n		bindings.put(\"TODATE\", TODATE );\n		\n		bindings.put(\"TXNDATE\", TXNDATE );\n		\n		bindings.put(\"MBS\", MBS );\n		\n		bindings.put(\"DUEDATE\", DUEDATE );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"bill\", MBILL );\n_p0.put( \"date\", (new ActionExpression(\"@IIF( MODE == \'DAILY\' , @IIF( TXNDATE > TODATE , TODATE , TXNDATE ),  TODATE )\", bindings)) );\naction.execute( \"set-bill-validity-date\",_p0,drools);\nMap _p1 = new HashMap();\n_p1.put( \"bill\", MBILL );\n_p1.put( \"date\", (new ActionExpression(\"@IIF( MODE == \'DAILY\' , @IIF( TXNDATE > TODATE , TODATE , TXNDATE ),  DUEDATE )\", bindings)) );\naction.execute( \"set-bill-due-date\",_p1,drools);\n\nend\n\n\n	');
/*!40000 ALTER TABLE `sys_rule_deployed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_fact`
--

DROP TABLE IF EXISTS `sys_rule_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_fact` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `title` varchar(160) DEFAULT NULL,
  `factclass` varchar(50) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `handler` varchar(50) DEFAULT NULL,
  `defaultvarname` varchar(25) DEFAULT NULL,
  `dynamic` int(11) DEFAULT NULL,
  `lookuphandler` varchar(50) DEFAULT NULL,
  `lookupkey` varchar(50) DEFAULT NULL,
  `lookupvalue` varchar(50) DEFAULT NULL,
  `lookupdatatype` varchar(50) DEFAULT NULL,
  `dynamicfieldname` varchar(50) DEFAULT NULL,
  `builtinconstraints` varchar(50) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `factsuperclass` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_fact`
--

LOCK TABLES `sys_rule_fact` WRITE;
/*!40000 ALTER TABLE `sys_rule_fact` DISABLE KEYS */;
INSERT INTO `sys_rule_fact` VALUES ('market.facts.MarketAccount','market.facts.MarketAccount','Market Account','market.facts.MarketAccount',1,NULL,'ACCT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MARKET',NULL),('market.facts.MarketBill','market.facts.MarketBill','Market Bill','market.facts.MarketBill',1,NULL,'MBILL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MARKET','treasury.facts.Bill'),('market.facts.MarketBillItem','market.facts.MarketBillItem','Market Bill Item','market.facts.MarketBillItem',1,NULL,'BILLITEM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MARKET','treasury.facts.AbstractBillItem'),('market.facts.MarketBillSchedule','market.facts.MarketBillSchedule','Market Bill Schedule','market.facts.MarketBillSchedule',-1,NULL,'MBS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MARKET',NULL),('market.facts.MarketPaymentPlan','market.facts.MarketPaymentPlan','Market Payment Plan','market.facts.MarketPaymentPlan',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MARKET',NULL),('market.facts.MarketTxn','market.facts.MarketTxn','Market Txn','market.facts.MarketTxn',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MARKET',NULL),('treasury.facts.AbstractBillItem','treasury.facts.AbstractBillItem','Abstract Bill Item','treasury.facts.AbstractBillItem',1,NULL,'ABILLITEM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.Bill','treasury.facts.Bill','Bill','treasury.facts.Bill',1,NULL,'BILL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.BillItem','treasury.facts.BillItem','Bill Item','treasury.facts.BillItem',1,NULL,'BILLITEM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY','treasury.facts.AbstractBillItem'),('treasury.facts.BillSubItem','treasury.facts.BillSubItem','Bill Sub Item','treasury.facts.BillSubItem',1,NULL,'SUBITM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY','treasury.facts.AbstractBillItem'),('treasury.facts.CashReceipt','treasury.facts.CashReceipt','Cash Receipt','treasury.facts.CashReceipt',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.CashReceiptItem','treasury.facts.CashReceiptItem','Cash Receipt Item','treasury.facts.CashReceiptItem',1,NULL,'CRI',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.CreditBillItem','treasury.facts.CreditBillItem','Credit Bill Item','treasury.facts.CreditBillItem',1,NULL,'CRBILL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY','treasury.facts.AbstractBillItem'),('treasury.facts.Deposit','treasury.facts.Deposit','Deposit','treasury.facts.Deposit',5,NULL,'PMT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.DiscountItem','treasury.facts.DiscountItem','Discount Item','treasury.facts.DiscountItem',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY','treasury.facts.AbstractBillItem'),('treasury.facts.DueDate','treasury.facts.DueDate','Due Date','treasury.facts.DueDate',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.ExcessPayment','treasury.facts.ExcessPayment','Excess Payment','treasury.facts.ExcessPayment',6,NULL,'EXPMT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.HolidayFact','treasury.facts.HolidayFact','Holidays','treasury.facts.HolidayFact',1,NULL,'HOLIDAYS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.InterestItem','treasury.facts.InterestItem','Interest Item','treasury.facts.InterestItem',1,NULL,'INT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY','treasury.facts.AbstractBillItem'),('treasury.facts.MonthEntry','treasury.facts.MonthEntry','Month Entry','treasury.facts.MonthEntry',1,NULL,'MONTHENTRY',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.Payment','treasury.facts.Payment','Payment','treasury.facts.Payment',5,NULL,'PMT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.PaymentItem','treasury.facts.PaymentItem','Payment Item','treasury.facts.PaymentItem',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.Requirement','treasury.facts.Requirement','Requirement','treasury.facts.Requirement',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.SurchargeItem','treasury.facts.SurchargeItem','Surcharge Item','treasury.facts.SurchargeItem',1,NULL,'SURCHG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY','treasury.facts.AbstractBillItem'),('treasury.facts.TransactionDate','treasury.facts.TransactionDate','Transaction Date','treasury.facts.TransactionDate',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.VarDate','treasury.facts.VarDate','Variable Date','treasury.facts.VarDate',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.VarInteger','treasury.facts.VarInteger','Var Integer','treasury.facts.VarInteger',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL);
/*!40000 ALTER TABLE `sys_rule_fact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_fact_field`
--

DROP TABLE IF EXISTS `sys_rule_fact_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_fact_field` (
  `objid` varchar(100) NOT NULL DEFAULT '',
  `parentid` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `title` varchar(160) DEFAULT NULL,
  `datatype` varchar(50) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `handler` varchar(50) DEFAULT NULL,
  `lookuphandler` varchar(50) DEFAULT NULL,
  `lookupkey` varchar(50) DEFAULT NULL,
  `lookupvalue` varchar(50) DEFAULT NULL,
  `lookupdatatype` varchar(50) DEFAULT NULL,
  `multivalued` int(11) DEFAULT NULL,
  `required` int(11) DEFAULT NULL,
  `vardatatype` varchar(50) DEFAULT NULL,
  `lovname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `parentid` (`parentid`),
  CONSTRAINT `sys_rule_fact_field_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_fact` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_fact_field`
--

LOCK TABLES `sys_rule_fact_field` WRITE;
/*!40000 ALTER TABLE `sys_rule_fact_field` DISABLE KEYS */;
INSERT INTO `sys_rule_fact_field` VALUES ('market.facts.MarketAccount.centerid','market.facts.MarketAccount','centerid','Center','string',5,'lookup','market_center:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('market.facts.MarketAccount.orgid','market.facts.MarketAccount','orgid','Org ID','string',6,'lookup','org:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('market.facts.MarketAccount.paymentmode','market.facts.MarketAccount','paymentmode','Payment Mode','string',1,'lov',NULL,NULL,NULL,NULL,NULL,NULL,'string','MARKET_PAYMENT_MODE'),('market.facts.MarketAccount.rate','market.facts.MarketAccount','rate','Rate','decimal',2,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('market.facts.MarketAccount.ratetype','market.facts.MarketAccount','ratetype','Rate Type','string',3,'lov',NULL,NULL,NULL,NULL,NULL,NULL,'string','MARKET_RATE_TYPE'),('market.facts.MarketAccount.unitno','market.facts.MarketAccount','unitno','Unit No','string',4,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('market.facts.MarketBill.balance','market.facts.MarketBill','balance','Balance','decimal',8,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('market.facts.MarketBill.balanceforward','market.facts.MarketBill','balanceforward','Balance Forward','decimal',2,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('market.facts.MarketBill.billdate','market.facts.MarketBill','billdate','Bill Date','date',6,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('market.facts.MarketBill.billtype','market.facts.MarketBill','billtype','Bill Type','string',9,'lov',NULL,NULL,NULL,NULL,NULL,NULL,'string','MARKET_BILL_TYPE'),('market.facts.MarketBill.centerid','market.facts.MarketBill','centerid','Center','string',16,'lookup','market_center:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('market.facts.MarketBill.duedate','market.facts.MarketBill','duedate','Due Date','date',11,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('market.facts.MarketBill.month','market.facts.MarketBill','month','Month','integer',5,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('market.facts.MarketBill.objid','market.facts.MarketBill','objid','Obj ID','string',1,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('market.facts.MarketBill.orgid','market.facts.MarketBill','orgid','Org','string',17,'lookup','org:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('market.facts.MarketBill.paymentmode','market.facts.MarketBill','paymentmode','Payment Mode','string',14,'lov',NULL,NULL,NULL,NULL,NULL,NULL,'string','MARKET_PAYMENT_MODE'),('market.facts.MarketBill.rate','market.facts.MarketBill','rate','Rate','decimal',12,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('market.facts.MarketBill.ratetype','market.facts.MarketBill','ratetype','Rate Type','string',13,'lov',NULL,NULL,NULL,NULL,NULL,NULL,'string','MARKET_RATE_TYPE'),('market.facts.MarketBill.state','market.facts.MarketBill','state','State','string',3,'lov',NULL,NULL,NULL,NULL,NULL,NULL,'string','WATER_BILL_STATE'),('market.facts.MarketBill.unitno','market.facts.MarketBill','unitno','Unit No','string',15,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('market.facts.MarketBill.validitydate','market.facts.MarketBill','validitydate','Validity Date','date',7,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('market.facts.MarketBill.year','market.facts.MarketBill','year','Year','integer',4,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('market.facts.MarketBill.yearmonth','market.facts.MarketBill','yearmonth','Year Month','integer',10,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('market.facts.MarketBillItem.acctid','market.facts.MarketBillItem','acctid','Account','string',3,'lookup','itemaccount:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('market.facts.MarketBillItem.amount','market.facts.MarketBillItem','amount','Amount','decimal',5,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('market.facts.MarketBillItem.amtpaid','market.facts.MarketBillItem','amtpaid','Amt Paid','decimal',20,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('market.facts.MarketBillItem.balance','market.facts.MarketBillItem','balance','Balance','decimal',17,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('market.facts.MarketBillItem.billcode','market.facts.MarketBillItem','billcode','Bill code','string',4,'lookup','itemaccount:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('market.facts.MarketBillItem.billdate','market.facts.MarketBillItem','billdate','Bill Date','date',12,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('market.facts.MarketBillItem.billid','market.facts.MarketBillItem','billid','Bill ID','string',2,'var',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('market.facts.MarketBillItem.day','market.facts.MarketBillItem','day','Day','integer',10,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('market.facts.MarketBillItem.discount','market.facts.MarketBillItem','discount','Discount','decimal',18,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('market.facts.MarketBillItem.duedate','market.facts.MarketBillItem','duedate','Due Date','date',19,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('market.facts.MarketBillItem.forwarded','market.facts.MarketBillItem','forwarded','Forwarded','boolean',14,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('market.facts.MarketBillItem.input','market.facts.MarketBillItem','input','Input','boolean',21,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('market.facts.MarketBillItem.interest','market.facts.MarketBillItem','interest','Interest','decimal',8,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('market.facts.MarketBillItem.month','market.facts.MarketBillItem','month','Month','integer',9,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('market.facts.MarketBillItem.objid','market.facts.MarketBillItem','objid','ObjID','string',1,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('market.facts.MarketBillItem.paid','market.facts.MarketBillItem','paid','Paid','boolean',16,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('market.facts.MarketBillItem.remarks','market.facts.MarketBillItem','remarks','Remarks','string',13,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('market.facts.MarketBillItem.sortorder','market.facts.MarketBillItem','sortorder','Sort Order','integer',22,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('market.facts.MarketBillItem.surcharge','market.facts.MarketBillItem','surcharge','Surcharge','decimal',6,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('market.facts.MarketBillItem.tag','market.facts.MarketBillItem','tag','Tag','string',11,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('market.facts.MarketBillItem.year','market.facts.MarketBillItem','year','Year','integer',7,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('market.facts.MarketBillItem.yearmonth','market.facts.MarketBillItem','yearmonth','Year Month','integer',15,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('market.facts.MarketBillSchedule.billdate','market.facts.MarketBillSchedule','billdate','Bill Date','date',9,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('market.facts.MarketBillSchedule.billingduedate','market.facts.MarketBillSchedule','billingduedate','Billing Due Date','date',10,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('market.facts.MarketBillSchedule.day','market.facts.MarketBillSchedule','day','Day','integer',4,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('market.facts.MarketBillSchedule.discdate','market.facts.MarketBillSchedule','discdate','Discount Date','date',11,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('market.facts.MarketBillSchedule.duedate','market.facts.MarketBillSchedule','duedate','Due Date','date',12,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('market.facts.MarketBillSchedule.expirydate','market.facts.MarketBillSchedule','expirydate','Bill Expiry Date','date',13,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('market.facts.MarketBillSchedule.fromdate','market.facts.MarketBillSchedule','fromdate','From Date','date',5,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('market.facts.MarketBillSchedule.month','market.facts.MarketBillSchedule','month','Month','integer',3,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('market.facts.MarketBillSchedule.name','market.facts.MarketBillSchedule','name','Name','string',1,'lookup','market_billschedule_group:lookup','objid','objid',NULL,NULL,NULL,'string',NULL),('market.facts.MarketBillSchedule.readingdate','market.facts.MarketBillSchedule','readingdate','Reading Date','date',7,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('market.facts.MarketBillSchedule.readingduedate','market.facts.MarketBillSchedule','readingduedate','Reading Due Date','date',8,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('market.facts.MarketBillSchedule.todate','market.facts.MarketBillSchedule','todate','To Date','date',6,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('market.facts.MarketBillSchedule.year','market.facts.MarketBillSchedule','year','Year','integer',2,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('market.facts.MarketPaymentPlan.amtdue','market.facts.MarketPaymentPlan','amtdue','Amt Due','decimal',4,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('market.facts.MarketPaymentPlan.billcount','market.facts.MarketPaymentPlan','billcount','Bill Count','integer',8,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('market.facts.MarketPaymentPlan.downpayment','market.facts.MarketPaymentPlan','downpayment','Downpayment','decimal',2,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('market.facts.MarketPaymentPlan.installmentamt','market.facts.MarketPaymentPlan','installmentamt','Installment Amount','decimal',6,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('market.facts.MarketPaymentPlan.objid','market.facts.MarketPaymentPlan','objid','Objid','string',1,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('market.facts.MarketPaymentPlan.principal','market.facts.MarketPaymentPlan','principal','Principal','decimal',3,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('market.facts.MarketPaymentPlan.term','market.facts.MarketPaymentPlan','term','Term','integer',5,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('market.facts.MarketPaymentPlan.txntypeid','market.facts.MarketPaymentPlan','txntypeid','Txn Type','string',7,'lookup','market_txntype:lookup','objid','objid',NULL,NULL,NULL,'string',NULL),('market.facts.MarketTxn.typeid','market.facts.MarketTxn','typeid','Type','string',1,'lookup','market_txntype:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('treasury.facts.AbstractBillItem.acctid','treasury.facts.AbstractBillItem','acctid','Account','string',2,'lookup','itemaccount:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('treasury.facts.AbstractBillItem.amount','treasury.facts.AbstractBillItem','amount','Amount','decimal',3,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.AbstractBillItem.objid','treasury.facts.AbstractBillItem','objid','ObjID','string',1,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.Bill.amount','treasury.facts.Bill','amount','Amount','decimal',6,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.Bill.balance','treasury.facts.Bill','balance','Balance','decimal',8,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.Bill.balanceforward','treasury.facts.Bill','balanceforward','Balance Forward','decimal',4,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.Bill.billdate','treasury.facts.Bill','billdate','Bill Date','date',5,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.Bill.expirydate','treasury.facts.Bill','expirydate','Expiry Date','date',3,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.Bill.objid','treasury.facts.Bill','objid','ObjID',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('treasury.facts.Bill.state','treasury.facts.Bill','state','State','string',7,'lov',NULL,NULL,NULL,NULL,NULL,NULL,'string','MARKET_BILL_STATE'),('treasury.facts.Bill.validitydate','treasury.facts.Bill','validitydate','Validity Date','date',2,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.BillItem.account','treasury.facts.BillItem','account','Account','string',3,'lookup','revenueitem:lookup','objid','title',NULL,NULL,NULL,'object',NULL),('treasury.facts.BillItem.account.objid','treasury.facts.BillItem','account.objid','Account','string',2,'lookup','revenueitem:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('treasury.facts.BillItem.amount','treasury.facts.BillItem','amount','Amount','decimal',1,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.BillItem.billcode','treasury.facts.BillItem','billcode','Bill Code','string',4,'lookup','itemaccount:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('treasury.facts.BillItem.billrefid','treasury.facts.BillItem','billrefid','Bill Ref ID','string',7,'var',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.BillItem.discount','treasury.facts.BillItem','discount','Discount','decimal',8,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.BillItem.duedate','treasury.facts.BillItem','duedate','Due Date','date',2,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.BillItem.fromdate','treasury.facts.BillItem','fromdate','From Date','date',14,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.BillItem.interest','treasury.facts.BillItem','interest','Interest','decimal',11,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.BillItem.month','treasury.facts.BillItem','month','Month','integer',13,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.BillItem.org','treasury.facts.BillItem','org','Org','string',10,'var',NULL,NULL,NULL,NULL,NULL,NULL,'enterprise.facts.Org',NULL),('treasury.facts.BillItem.parentaccount','treasury.facts.BillItem','parentaccount','Parent Account','string',9,'lookup','revenueitem:lookup','objid','title',NULL,NULL,NULL,'object',NULL),('treasury.facts.BillItem.paypriority','treasury.facts.BillItem','paypriority','Pay Priority','integer',18,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.BillItem.refid','treasury.facts.BillItem','refid','Ref ID','string',16,'var',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.BillItem.remarks','treasury.facts.BillItem','remarks','Remarks','string',17,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.BillItem.sortorder','treasury.facts.BillItem','sortorder','Sort Order','integer',19,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.BillItem.surcharge','treasury.facts.BillItem','surcharge','Surcharge','decimal',5,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.BillItem.tag','treasury.facts.BillItem','tag','Tag','string',5,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.BillItem.todate','treasury.facts.BillItem','todate','To Date','date',15,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.BillItem.txntype','treasury.facts.BillItem','txntype','Txn Type','string',3,'lookup','billitem_txntype:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('treasury.facts.BillItem.year','treasury.facts.BillItem','year','Year','integer',12,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.BillSubItem.acctid','treasury.facts.BillSubItem','acctid','Account','string',2,'lookup','itemaccount:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('treasury.facts.BillSubItem.amount','treasury.facts.BillSubItem','amount','Amount','decimal',3,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.BillSubItem.billitemrefid','treasury.facts.BillSubItem','billitemrefid','Bill Item Refid','string',5,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.BillSubItem.objid','treasury.facts.BillSubItem','objid','ObjID','string',1,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.BillSubItem.type','treasury.facts.BillSubItem','type','Type','string',4,'lov',NULL,NULL,NULL,NULL,NULL,NULL,'string','SUB_BILLITEM_TYPE'),('treasury.facts.CashReceipt.receiptdate','treasury.facts.CashReceipt','receiptdate','Receipt Date','date',2,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.CashReceipt.txnmode','treasury.facts.CashReceipt','txnmode','Txn Mode','string',1,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.CashReceiptItem.account','treasury.facts.CashReceiptItem','account','Account','string',1,'lookup','itemaccount:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('treasury.facts.CashReceiptItem.amount','treasury.facts.CashReceiptItem','amount','Amount','decimal',2,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.CashReceiptItem.billcode','treasury.facts.CashReceiptItem','billcode','Billcode','string',6,'lookup','itemaccount:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('treasury.facts.CashReceiptItem.billitems','treasury.facts.CashReceiptItem','billitems','Bill Items','string',4,'var',NULL,NULL,NULL,NULL,NULL,NULL,'object',NULL),('treasury.facts.CashReceiptItem.orgid','treasury.facts.CashReceiptItem','orgid','Org ID','string',7,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.CashReceiptItem.remarks','treasury.facts.CashReceiptItem','remarks','Remarks','string',3,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.CashReceiptItem.sortorder','treasury.facts.CashReceiptItem','sortorder','Sort Order','integer',5,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.CreditBillItem.amount','treasury.facts.CreditBillItem','amount','Amount','decimal',1,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.CreditBillItem.billcode','treasury.facts.CreditBillItem','billcode','Bill code','string',2,'lookup','waterworks_itemaccount:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('treasury.facts.CreditBillItem.unusedbalance','treasury.facts.CreditBillItem','unusedbalance','Unused Balance','decimal',2,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.Deposit.amount','treasury.facts.Deposit','amount','Amount','decimal',1,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.DiscountItem.amount','treasury.facts.DiscountItem','amount','Amount','decimal',2,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.DiscountItem.billitemrefid','treasury.facts.DiscountItem','billitemrefid','Bill Item Ref ID','string',1,'var',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.DiscountItem.discdate','treasury.facts.DiscountItem','discdate','Discount Date','date',3,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.DueDate.date','treasury.facts.DueDate','date','Date','date',1,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.DueDate.day','treasury.facts.DueDate','day','Day','integer',4,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.DueDate.month','treasury.facts.DueDate','month','Month','integer',3,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.DueDate.qtr','treasury.facts.DueDate','qtr','Qtr','integer',5,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.DueDate.year','treasury.facts.DueDate','year','Year','integer',2,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.ExcessPayment.amount','treasury.facts.ExcessPayment','amount','Amount','decimal',1,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.HolidayFact.id','treasury.facts.HolidayFact','id','ID','string',1,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.InterestItem.acctid','treasury.facts.InterestItem','acctid','Account','string',2,'lookup','itemaccount:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('treasury.facts.InterestItem.amount','treasury.facts.InterestItem','amount','Amount','decimal',3,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.InterestItem.billcode','treasury.facts.InterestItem','billcode','Bill code','string',6,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.InterestItem.billitemrefid','treasury.facts.InterestItem','billitemrefid','Bill Item Refid','string',5,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.InterestItem.forwarded','treasury.facts.InterestItem','forwarded','Forwarded','boolean',7,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('treasury.facts.InterestItem.input','treasury.facts.InterestItem','input','Input','boolean',8,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('treasury.facts.InterestItem.objid','treasury.facts.InterestItem','objid','ObjID','string',1,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.InterestItem.type','treasury.facts.InterestItem','type','Type','string',4,'lov',NULL,NULL,NULL,NULL,NULL,NULL,'string','SUB_BILLITEM_TYPE'),('treasury.facts.MonthEntry.duedate','treasury.facts.MonthEntry','duedate','Due date','date',13,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.MonthEntry.first','treasury.facts.MonthEntry','first','First','boolean',11,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('treasury.facts.MonthEntry.fromdate','treasury.facts.MonthEntry','fromdate','From Date','date',4,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.MonthEntry.fromday','treasury.facts.MonthEntry','fromday','From Day','integer',6,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.MonthEntry.index','treasury.facts.MonthEntry','index','Index','integer',10,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.MonthEntry.last','treasury.facts.MonthEntry','last','Last','boolean',12,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('treasury.facts.MonthEntry.maxdays','treasury.facts.MonthEntry','maxdays','Month Max Days','integer',9,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.MonthEntry.month','treasury.facts.MonthEntry','month','Month','integer',2,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.MonthEntry.numdays','treasury.facts.MonthEntry','numdays','No. of Days','integer',8,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.MonthEntry.qtr','treasury.facts.MonthEntry','qtr','Qtr','integer',3,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.MonthEntry.todate','treasury.facts.MonthEntry','todate','To Date','date',5,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.MonthEntry.today','treasury.facts.MonthEntry','today','To Day','integer',7,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.MonthEntry.year','treasury.facts.MonthEntry','year','Year','integer',1,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.Payment.amount','treasury.facts.Payment','amount','Amount','decimal',1,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.Payment.reftype','treasury.facts.Payment','reftype','Reftype','string',2,'lov',NULL,NULL,NULL,NULL,NULL,NULL,'string','PAYMENT_REFTYPE'),('treasury.facts.PaymentItem.amount','treasury.facts.PaymentItem','amount','Amount','decimal',2,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.PaymentItem.billitemrefid','treasury.facts.PaymentItem','billitemrefid','BillItem Ref ID','string',1,'var',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.Requirement.code','treasury.facts.Requirement','code','Code','string',1,'lookup','requirementtype:lookup','code','title',NULL,NULL,NULL,'string',NULL),('treasury.facts.Requirement.completed','treasury.facts.Requirement','completed','Completed','boolean',2,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('treasury.facts.SurchargeItem.acctid','treasury.facts.SurchargeItem','acctid','Account','string',2,'lookup','itemaccount:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('treasury.facts.SurchargeItem.amount','treasury.facts.SurchargeItem','amount','Amount','decimal',3,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.SurchargeItem.billcode','treasury.facts.SurchargeItem','billcode','Bill code','string',7,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.SurchargeItem.billdate','treasury.facts.SurchargeItem','billdate','Bill Date','date',10,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.SurchargeItem.billitem','treasury.facts.SurchargeItem','billitem','Ref Bill Item','string',5,'var',NULL,NULL,NULL,NULL,NULL,NULL,'treasury.facts.BillItem',NULL),('treasury.facts.SurchargeItem.billitemrefid','treasury.facts.SurchargeItem','billitemrefid','Bill Item Refid','string',6,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.SurchargeItem.forwarded','treasury.facts.SurchargeItem','forwarded','Forwarded','boolean',8,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('treasury.facts.SurchargeItem.input','treasury.facts.SurchargeItem','input','Input','boolean',9,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('treasury.facts.SurchargeItem.objid','treasury.facts.SurchargeItem','objid','ObjID','string',1,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.SurchargeItem.type','treasury.facts.SurchargeItem','type','Type','string',4,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.TransactionDate.date','treasury.facts.TransactionDate','date','Date','date',1,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.TransactionDate.day','treasury.facts.TransactionDate','day','Day','integer',4,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.TransactionDate.month','treasury.facts.TransactionDate','month','Month','integer',3,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.TransactionDate.qtr','treasury.facts.TransactionDate','qtr','Qtr','integer',5,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.TransactionDate.tag','treasury.facts.TransactionDate','tag','Tag','string',6,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.TransactionDate.year','treasury.facts.TransactionDate','year','Year','integer',2,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.VarDate.date','treasury.facts.VarDate','date','Date','date',1,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.VarDate.day','treasury.facts.VarDate','day','Day','integer',4,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.VarDate.month','treasury.facts.VarDate','month','Month','integer',3,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.VarDate.qtr','treasury.facts.VarDate','qtr','Qtr','integer',5,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.VarDate.tag','treasury.facts.VarDate','tag','Tag','string',6,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.VarDate.year','treasury.facts.VarDate','year','Year','integer',2,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.VarInteger.tag','treasury.facts.VarInteger','tag','Tag','string',2,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.VarInteger.value','treasury.facts.VarInteger','value','Value','integer',1,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL);
/*!40000 ALTER TABLE `sys_rule_fact_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rulegroup`
--

DROP TABLE IF EXISTS `sys_rulegroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rulegroup` (
  `name` varchar(50) NOT NULL,
  `ruleset` varchar(50) NOT NULL,
  `title` varchar(160) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`,`ruleset`),
  KEY `ruleset` (`ruleset`),
  CONSTRAINT `sys_rulegroup_ibfk_1` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rulegroup`
--

LOCK TABLES `sys_rulegroup` WRITE;
/*!40000 ALTER TABLE `sys_rulegroup` DISABLE KEYS */;
INSERT INTO `sys_rulegroup` VALUES ('after-apply-payment','marketpayment','After apply payment',3),('apply-credits','marketbilling','Apply Credits',2),('apply-payment','marketpayment','Payment',1),('compute-fees','marketbilling','Compute Fees',1),('compute-interest','marketbilling','Compute Interest',4),('compute-surcharge','marketbilling','Compute Surcharge',3),('initial','marketbilling','Initial',0),('initial','marketbillingschedule','Initial',0),('initial','marketpayment','Initial',0),('map-account','marketpayment','Map Account',3),('post-map-account','marketpayment','Post Map Account',4),('set-schedule','marketbillingschedule','Set Schedule',1),('summary','marketbilling','Summary',5);
/*!40000 ALTER TABLE `sys_rulegroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_ruleset`
--

DROP TABLE IF EXISTS `sys_ruleset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_ruleset` (
  `name` varchar(50) NOT NULL,
  `title` varchar(160) DEFAULT NULL,
  `packagename` varchar(50) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `permission` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_ruleset`
--

LOCK TABLES `sys_ruleset` WRITE;
/*!40000 ALTER TABLE `sys_ruleset` DISABLE KEYS */;
INSERT INTO `sys_ruleset` VALUES ('marketbilling','Market Billing','marketbilling','MARKET','RULE_AUTHOR',NULL),('marketbillingschedule','Market Billing Schedule','marketbillingschedule','MARKET','RULE_AUTHOR',NULL),('marketpayment','Market Payment','marketpayment','MARKET','RULE_AUTHOR',NULL);
/*!40000 ALTER TABLE `sys_ruleset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_ruleset_actiondef`
--

DROP TABLE IF EXISTS `sys_ruleset_actiondef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_ruleset_actiondef` (
  `ruleset` varchar(50) NOT NULL,
  `actiondef` varchar(50) NOT NULL,
  PRIMARY KEY (`actiondef`,`ruleset`),
  KEY `actiondef` (`actiondef`),
  KEY `sys_ruleset_actiondef_ibfk_2` (`ruleset`),
  CONSTRAINT `fk_sys_ruleset_actiondef_actiondef` FOREIGN KEY (`actiondef`) REFERENCES `sys_rule_actiondef` (`objid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sys_ruleset_actiondef_ibfk_2` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_ruleset_actiondef`
--

LOCK TABLES `sys_ruleset_actiondef` WRITE;
/*!40000 ALTER TABLE `sys_ruleset_actiondef` DISABLE KEYS */;
INSERT INTO `sys_ruleset_actiondef` VALUES ('marketbilling','enterprise.actions.PrintTest'),('marketpayment','enterprise.actions.PrintTest'),('marketbilling','enterprise.actions.ThrowException'),('marketbillingschedule','enterprise.actions.ThrowException'),('marketpayment','enterprise.actions.ThrowException'),('marketbilling','market.actions.AddMarketBillItem'),('marketpayment','market.actions.AddMarketBillItem'),('marketbillingschedule','market.actions.AddMarketBillSchedule'),('marketbillingschedule','market.actions.SetMarketBillSchedule'),('marketbilling','treasury.actions.AddBillItem'),('marketpayment','treasury.actions.AddCashReceiptItem'),('marketpayment','treasury.actions.AddCreditBillItem'),('marketbilling','treasury.actions.AddDiscountItem'),('marketpayment','treasury.actions.AddDiscountItem'),('marketbilling','treasury.actions.AddInterestItem'),('marketbilling','treasury.actions.AddSurchargeItem'),('marketbilling','treasury.actions.ApplyBillItemCredit'),('marketpayment','treasury.actions.ApplyBillItemCredit'),('marketpayment','treasury.actions.ApplyBillItemPayment'),('marketbilling','treasury.actions.RemoveBillItem'),('marketbilling','treasury.actions.SetBillDueDate'),('marketpayment','treasury.actions.SetBillItemAccount'),('marketbilling','treasury.actions.SetBillItemProperty'),('marketbilling','treasury.actions.SetBillValidityDate'),('marketpayment','treasury.actions.SetCashReceiptItemRemarks'),('marketbilling','treasury.actions.SupersedeBillItem'),('marketbilling','treasury.actions.UpdateBillItemAmount');
/*!40000 ALTER TABLE `sys_ruleset_actiondef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_ruleset_fact`
--

DROP TABLE IF EXISTS `sys_ruleset_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_ruleset_fact` (
  `ruleset` varchar(50) NOT NULL,
  `rulefact` varchar(50) NOT NULL,
  PRIMARY KEY (`rulefact`,`ruleset`),
  KEY `rulefact` (`rulefact`),
  KEY `sys_ruleset_fact_ibfk_2` (`ruleset`),
  CONSTRAINT `fk_sys_ruleset_fact_rulefact` FOREIGN KEY (`rulefact`) REFERENCES `sys_rule_fact` (`objid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sys_ruleset_fact_ibfk_2` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_ruleset_fact`
--

LOCK TABLES `sys_ruleset_fact` WRITE;
/*!40000 ALTER TABLE `sys_ruleset_fact` DISABLE KEYS */;
INSERT INTO `sys_ruleset_fact` VALUES ('marketpayment','market.facts.MarketAccount'),('marketbilling','market.facts.MarketBill'),('marketpayment','market.facts.MarketBill'),('marketbilling','market.facts.MarketBillItem'),('marketpayment','market.facts.MarketBillItem'),('marketbilling','market.facts.MarketBillSchedule'),('marketbillingschedule','market.facts.MarketBillSchedule'),('marketpayment','market.facts.MarketBillSchedule'),('marketbilling','market.facts.MarketPaymentPlan'),('marketbilling','market.facts.MarketTxn'),('marketpayment','market.facts.MarketTxn'),('marketbilling','treasury.facts.AbstractBillItem'),('marketpayment','treasury.facts.AbstractBillItem'),('marketbilling','treasury.facts.Bill'),('marketbilling','treasury.facts.BillItem'),('marketpayment','treasury.facts.CashReceiptItem'),('marketbilling','treasury.facts.CreditBillItem'),('marketpayment','treasury.facts.CreditBillItem'),('marketpayment','treasury.facts.DiscountItem'),('marketpayment','treasury.facts.ExcessPayment'),('marketbillingschedule','treasury.facts.HolidayFact'),('marketbilling','treasury.facts.InterestItem'),('marketpayment','treasury.facts.InterestItem'),('marketpayment','treasury.facts.Payment'),('marketpayment','treasury.facts.PaymentItem'),('marketbilling','treasury.facts.SurchargeItem'),('marketpayment','treasury.facts.SurchargeItem'),('marketbilling','treasury.facts.TransactionDate'),('marketpayment','treasury.facts.TransactionDate');
/*!40000 ALTER TABLE `sys_ruleset_fact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_sequence`
--

DROP TABLE IF EXISTS `sys_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_sequence` (
  `objid` varchar(100) NOT NULL,
  `nextSeries` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_sequence`
--

LOCK TABLES `sys_sequence` WRITE;
/*!40000 ALTER TABLE `sys_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `objid` varchar(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `jobtitle` varchar(50) DEFAULT NULL,
  `txncode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_username` (`username`),
  KEY `ix_lastname_firstname` (`lastname`,`firstname`),
  KEY `ix_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `objid` varchar(50) NOT NULL,
  `role` varchar(50) DEFAULT NULL,
  `userid` varchar(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `org_objid` varchar(50) DEFAULT NULL,
  `org_name` varchar(50) DEFAULT NULL,
  `securitygroup_objid` varchar(50) DEFAULT NULL,
  `exclude` varchar(255) DEFAULT NULL,
  `uid` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_sys_user_role_uid` (`uid`),
  KEY `fk_sys_user_role_role` (`role`),
  KEY `fk_sys_user_role_userid` (`userid`),
  CONSTRAINT `fk_sys_user_role_role` FOREIGN KEY (`role`) REFERENCES `sys_role` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_var`
--

DROP TABLE IF EXISTS `sys_var`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_var` (
  `name` varchar(50) NOT NULL,
  `value` longtext,
  `description` varchar(255) DEFAULT NULL,
  `datatype` varchar(15) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_var`
--

LOCK TABLES `sys_var` WRITE;
/*!40000 ALTER TABLE `sys_var` DISABLE KEYS */;
INSERT INTO `sys_var` VALUES ('market_batch_rental_rate_no','MBRR-[yyyyMM]-[%06d]',NULL,NULL,NULL),('market_billno','MB-[yyyy][MM][%06d]',NULL,NULL,NULL),('market_rental_billno','MRB-[yyyy][MM][%06d]',NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_var` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_wf`
--

DROP TABLE IF EXISTS `sys_wf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_wf` (
  `name` varchar(50) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_wf`
--

LOCK TABLES `sys_wf` WRITE;
/*!40000 ALTER TABLE `sys_wf` DISABLE KEYS */;
INSERT INTO `sys_wf` VALUES ('market_account','Market Account','MARKET'),('market_txn_block_account','Market Block Account','MARKET'),('market_txn_capture_account','Market Capture Account','MARKET'),('market_txn_changeinfo','Market Change Info','MARKET'),('market_txn_close_account','Market Close Account','MARKET'),('market_txn_creditnote','Market Credit Note','MARKET'),('market_txn_newaccount','Market New Account','MARKET'),('market_txn_payment_plan','Market Payment Plan','MARKET'),('market_txn_unblock_account','Market Unblock Account','MARKET'),('market_txn_with_assessment','Market Txn with Assessment','MARKET');
/*!40000 ALTER TABLE `sys_wf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_wf_eventaction`
--

DROP TABLE IF EXISTS `sys_wf_eventaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_wf_eventaction` (
  `processname` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `eventtype` varchar(10) DEFAULT NULL,
  `index` int(11) DEFAULT NULL,
  `nodename` varchar(50) DEFAULT NULL,
  `transitionto` varchar(50) DEFAULT NULL,
  `scriptname` varchar(255) DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  `params` varchar(255) DEFAULT NULL,
  `retval` varchar(255) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`,`processname`),
  KEY `fk_sys_wf_eventaction_transition` (`processname`,`nodename`,`transitionto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_wf_eventaction`
--

LOCK TABLES `sys_wf_eventaction` WRITE;
/*!40000 ALTER TABLE `sys_wf_eventaction` DISABLE KEYS */;
INSERT INTO `sys_wf_eventaction` VALUES ('market_txn_capture_account','activate-account','after',1,'approval','end','MarketTxnService','activateAccount','[ txnid: refid, action: \'pending\' ]',NULL,1),('market_txn_newaccount','activate-new-account','after',1,'for-activation','end','MarketTxnService','activateAccount','[ txnid: refid, action: \'activate\' ]',NULL,1),('market_txn_changeinfo','apply-changes','after',1,'approval','end','MarketTxnService','updateAccount','[ txnid:  refid ]',NULL,1),('market_txn_with_assessment','apply-changes','after',1,'releasing','end','MarketTxnService','updateAccount','[ txnid:  refid ]',NULL,1),('market_txn_block_account','block-account','after',1,'approval','end','MarketTxnService','signalAccount','[ txnid: refid, action: \'block\' ]',NULL,1),('market_txn_payment_plan','check-has-bill','before',1,'check-has-bill','approval','MarketTxnService','checkHasBill','[ txnid: refid ]',NULL,1),('market_txn_unblock_account','check-has-bill','before',2,'assessment','approval','MarketTxnService','validateHasBill','[ txnid : refid ]',NULL,1),('market_txn_capture_account','check-has-unit-rate','after',3,'approval','end','MarketTxnService','checkHasUnitRate','[ txnid: refid ]',NULL,1),('market_txn_newaccount','check-has-unit-rate','after',3,'for-activation','end','MarketTxnService','checkHasUnitRate','[ txnid: refid ]',NULL,1),('market_txn_close_account','check-has-unpaid-balance','before',1,'approval','end','MarketTxnService','checkUnpaidBalance','[ txnid: refid ]',NULL,1),('market_txn_unblock_account','check-no-unpaid-balance','before',1,'assessment','approval','MarketTxnService','checkUnpaidBalance','[ txnid: refid ]',NULL,1),('market_txn_close_account','close-account','after',1,'approval','end','MarketTxnService','signalAccount','[ txnid: refid, action: \'close\' ]',NULL,1),('market_txn_payment_plan','determine-has-bill','before',1,'check-has-bill',NULL,'MarketTxnService','checkHasBill','[ txnid: refid ]',NULL,1),('market_txn_creditnote','post-credit','after',1,'approval','end','MarketTxnService','postCredit','[ txnid: refid ]',NULL,1),('market_txn_payment_plan','post-credit','after',1,'payment','end','MarketTxnService','postCredit','[ txnid: refid ]',NULL,1),('market_txn_payment_plan','post-credit-wo-payment','after',1,'check-has-bill','end','MarketTxnService','postCredit','[ txnid: refid ]',NULL,1),('market_txn_unblock_account','unblock-account','after',1,'releasing','end','MarketTxnService','signalAccount','[ txnid: refid, action: \'unblock\' ]',NULL,1),('market_txn_with_assessment','validate-has-bill','before',1,'assessment','approval','MarketTxnService','validateHasBill','[ txnid: refid ]',NULL,1),('market_txn_payment_plan','validate-payment-plan','before',1,'assessment','approval','MarketTxnService','validatePaymentPlan','[ txnid: refid ]',NULL,1);
/*!40000 ALTER TABLE `sys_wf_eventaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_wf_node`
--

DROP TABLE IF EXISTS `sys_wf_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_wf_node` (
  `name` varchar(50) NOT NULL,
  `processname` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(100) DEFAULT NULL,
  `nodetype` varchar(10) DEFAULT NULL,
  `idx` int(11) DEFAULT NULL,
  `salience` int(11) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `ui` text,
  `properties` text,
  `tracktime` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`,`processname`),
  KEY `fk_sys_wf_node_role` (`role`),
  CONSTRAINT `fk_sys_wf_node_role` FOREIGN KEY (`role`) REFERENCES `sys_role` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_wf_node`
--

LOCK TABLES `sys_wf_node` WRITE;
/*!40000 ALTER TABLE `sys_wf_node` DISABLE KEYS */;
INSERT INTO `sys_wf_node` VALUES ('active','market_account','Active','state',3,0,'MARKET','ACCOUNT_MANAGER','[fillColor:\"#c0c0c0\",size:[107,50],pos:[435,97],type:\"state\"]','[:]',NULL),('approval','market_txn_block_account','Approval','state',2,1,NULL,NULL,'[fillColor:\"#c0c0c0\",size:[109,49],pos:[403,179],type:\"state\"]','[:]',1),('approval','market_txn_capture_account','Approval','state',2,1,'MARKET','APPROVER','[fillColor:\"#c0c0c0\",size:[109,49],pos:[403,179],type:\"state\"]','[:]',1),('approval','market_txn_changeinfo','Approval','state',2,1,NULL,NULL,'[type:\"state\",fillColor:\"#c0c0c0\",pos:[403,179],size:[109,49]]','[:]',1),('approval','market_txn_close_account','Approval','state',2,1,NULL,NULL,'[fillColor:\"#c0c0c0\",size:[109,49],pos:[403,179],type:\"state\"]','[:]',1),('approval','market_txn_creditnote','Approval','state',2,1,NULL,NULL,'[fillColor:\"#c0c0c0\",size:[109,49],pos:[403,179],type:\"state\"]','[:]',1),('approval','market_txn_newaccount','Approval','state',5,1,NULL,NULL,'[fillColor:\"#c0c0c0\",size:[109,49],pos:[438,259],type:\"state\"]','[:]',1),('approval','market_txn_payment_plan','Approval','state',3,1,NULL,NULL,'[fillColor:\"#c0c0c0\",size:[109,49],pos:[393,149],type:\"state\"]','[:]',1),('approval','market_txn_unblock_account','Approval','state',3,1,NULL,NULL,'[fillColor:\"#c0c0c0\",size:[109,49],pos:[393,149],type:\"state\"]','[:]',1),('approval','market_txn_with_assessment','Approval','state',3,1,NULL,NULL,'[fillColor:\"#c0c0c0\",size:[109,49],pos:[424,156],type:\"state\"]','[:]',1),('assessment','market_txn_newaccount','Assessment','state',4,0,'MARKET','BILLER','[fillColor:\"#c0c0c0\",size:[115,51],pos:[463,130],type:\"state\"]','[:]',1),('assessment','market_txn_payment_plan','Assessment','state',2,0,'MARKET','BILLER','[fillColor:\"#c0c0c0\",size:[115,51],pos:[191,138],type:\"state\"]','[:]',1),('assessment','market_txn_unblock_account','Assessment','state',2,0,'MARKET','BILLER','[fillColor:\"#c0c0c0\",size:[115,51],pos:[191,138],type:\"state\"]','[:]',1),('assessment','market_txn_with_assessment','Assessment','state',2,0,'MARKET','ACCOUNT_MANAGER','[fillColor:\"#c0c0c0\",size:[109,57],pos:[389,33],type:\"state\"]','[:]',1),('blocked','market_account','Blocked','state',5,0,NULL,NULL,'[fillColor:\"#c0c0c0\",size:[112,53],pos:[639,176],type:\"state\"]','[:]',0),('check-has-bill','market_txn_payment_plan','Check Has Bill','decision',0,0,NULL,NULL,'[fillColor:\"#c0c0c0\",size:[136,61],pos:[637,96],type:\"decision\"]','[:]',NULL),('end','market_account','Closed','end',6,NULL,NULL,NULL,'[fillColor:\"#ff0000\",size:[32,32],pos:[872,257],type:\"end\"]','[:]',NULL),('end','market_txn_block_account','Completed','end',5,0,NULL,NULL,'[fillColor:\"#ff0000\",size:[32,32],pos:[496,458],type:\"end\"]','[:]',NULL),('end','market_txn_capture_account','Completed','end',5,0,NULL,NULL,'[fillColor:\"#ff0000\",size:[32,32],pos:[496,458],type:\"end\"]','[:]',NULL),('end','market_txn_changeinfo','Completed','end',5,0,NULL,NULL,'[type:\"end\",fillColor:\"#ff0000\",pos:[496,458],size:[32,32]]','[:]',NULL),('end','market_txn_close_account','Completed','end',5,0,NULL,NULL,'[fillColor:\"#ff0000\",size:[32,32],pos:[496,458],type:\"end\"]','[:]',NULL),('end','market_txn_creditnote','Completed','end',5,0,NULL,NULL,'[fillColor:\"#ff0000\",size:[32,32],pos:[496,458],type:\"end\"]','[:]',NULL),('end','market_txn_newaccount','Completed','end',8,0,NULL,NULL,'[fillColor:\"#ff0000\",size:[32,32],pos:[897,431],type:\"end\"]','[:]',NULL),('end','market_txn_payment_plan','Completed','end',5,0,NULL,NULL,'[fillColor:\"#ff0000\",size:[32,32],pos:[913,322],type:\"end\"]','[:]',NULL),('end','market_txn_unblock_account','Completed','end',6,0,NULL,NULL,'[fillColor:\"#ff0000\",size:[32,32],pos:[921,340],type:\"end\"]','[:]',NULL),('end','market_txn_with_assessment','Completed','end',6,0,NULL,NULL,'[fillColor:\"#ff0000\",size:[32,32],pos:[750,425],type:\"end\"]','[:]',NULL),('for-activation','market_txn_newaccount','For Activation','state',7,0,NULL,NULL,'[fillColor:\"#c0c0c0\",size:[124,56],pos:[835,309],type:\"state\"]','[:]',1),('hold','market_account','On Hold','state',4,0,'MARKET','ACCOUNT_MANAGER','[fillColor:\"#c0c0c0\",size:[119,49],pos:[655,35],type:\"state\"]','[:]',NULL),('inspection','market_txn_newaccount','Inspection','state',3,0,NULL,NULL,'[fillColor:\"#c0c0c0\",size:[111,51],pos:[413,27],type:\"state\"]','[:]',1),('payment','market_txn_newaccount','Payment','state',6,0,NULL,NULL,'[fillColor:\"#c0c0c0\",size:[109,53],pos:[646,262],type:\"state\"]','[:]',NULL),('payment','market_txn_payment_plan','Payment','state',4,0,'MARKET','PAYMENT_PROCESSOR','[fillColor:\"#c0c0c0\",size:[112,55],pos:[705,219],type:\"state\"]','[:]',NULL),('payment','market_txn_unblock_account','Payment','state',4,0,'MARKET','PAYMENT_PROCESSOR','[fillColor:\"#c0c0c0\",size:[112,55],pos:[611,206],type:\"state\"]','[:]',NULL),('payment','market_txn_with_assessment','Payment','state',4,0,'MARKET','SYSTEM','[fillColor:\"#c0c0c0\",size:[124,57],pos:[387,257],type:\"state\"]','[:]',NULL),('pending','market_account','Pending','state',2,0,'MARKET','ACCOUNT_MANAGER','[fillColor:\"#c0c0c0\",size:[93,47],pos:[298,211],type:\"state\"]','[:]',1),('receiving','market_txn_newaccount','Receiving','state',2,0,NULL,NULL,'[fillColor:\"#c0c0c0\",size:[106,51],pos:[236,77],type:\"state\"]','[:]',1),('releasing','market_txn_unblock_account','Releasing','state',5,0,NULL,NULL,'[fillColor:\"#c0c0c0\",size:[104,54],pos:[647,327],type:\"state\"]','[:]',1),('releasing','market_txn_with_assessment','Releasing','state',5,0,'MARKET','RELEASER','[fillColor:\"#c0c0c0\",size:[116,52],pos:[622,290],type:\"state\"]','[:]',NULL),('start','market_account','Start','start',1,NULL,NULL,NULL,'[fillColor:\"#00ff00\",size:[32,32],pos:[223,88],type:\"start\"]','[:]',NULL),('start','market_txn_block_account','start','start',1,NULL,NULL,NULL,'[fillColor:\"#00ff00\",size:[32,32],pos:[159,29],type:\"start\"]','[:]',NULL),('start','market_txn_capture_account','start','start',1,NULL,NULL,NULL,'[fillColor:\"#00ff00\",size:[32,32],pos:[159,29],type:\"start\"]','[:]',NULL),('start','market_txn_changeinfo','start','start',1,NULL,NULL,NULL,'[type:\"start\",fillColor:\"#00ff00\",pos:[159,29],size:[32,32]]','[:]',NULL),('start','market_txn_close_account','start','start',1,NULL,NULL,NULL,'[fillColor:\"#00ff00\",size:[32,32],pos:[159,29],type:\"start\"]','[:]',NULL),('start','market_txn_creditnote','start','start',1,NULL,NULL,NULL,'[fillColor:\"#00ff00\",size:[32,32],pos:[159,29],type:\"start\"]','[:]',NULL),('start','market_txn_newaccount','start','start',1,NULL,NULL,NULL,'[fillColor:\"#00ff00\",size:[32,32],pos:[159,29],type:\"start\"]','[:]',NULL),('start','market_txn_payment_plan','start','start',1,NULL,NULL,NULL,'[fillColor:\"#00ff00\",size:[32,32],pos:[159,29],type:\"start\"]','[:]',NULL),('start','market_txn_unblock_account','start','start',1,NULL,NULL,NULL,'[fillColor:\"#00ff00\",size:[32,32],pos:[159,29],type:\"start\"]','[:]',NULL),('start','market_txn_with_assessment','start','start',1,NULL,NULL,NULL,'[fillColor:\"#00ff00\",size:[32,32],pos:[159,29],type:\"start\"]','[:]',NULL);
/*!40000 ALTER TABLE `sys_wf_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_wf_transition`
--

DROP TABLE IF EXISTS `sys_wf_transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_wf_transition` (
  `parentid` varchar(50) NOT NULL DEFAULT '',
  `processname` varchar(50) NOT NULL DEFAULT '',
  `action` varchar(50) NOT NULL,
  `to` varchar(50) NOT NULL,
  `idx` int(11) DEFAULT NULL,
  `eval` mediumtext,
  `properties` varchar(255) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `ui` text,
  PRIMARY KEY (`action`,`parentid`,`processname`,`to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_wf_transition`
--

LOCK TABLES `sys_wf_transition` WRITE;
/*!40000 ALTER TABLE `sys_wf_transition` DISABLE KEYS */;
INSERT INTO `sys_wf_transition` VALUES ('for-activation','market_txn_newaccount','activate','end',0,NULL,'[:]',NULL,'Activate','[size:[32,69],pos:[897,366],type:\"arrow\",points:[897,366,929,435]]'),('start','market_account','activate','active',0,NULL,'[:]',NULL,'Activate','[size:[183,17],pos:[255,103],type:\"arrow\",points:[255,103,323,103,379,110,438,120]]'),('approval','market_txn_block_account','approve','end',0,NULL,'[showConfirm:true,confirmMessage:\"You are about to approve this transaction. Proceed with disconnection?\"]',NULL,'Approve','[size:[47,230],pos:[462,228],type:\"arrow\",points:[462,228,474,290,509,458]]'),('approval','market_txn_capture_account','approve','end',0,NULL,'[showConfirm:true,confirmMessage:\"You are about to approve?\"]',NULL,'Approve','[size:[47,230],pos:[462,228],type:\"arrow\",points:[462,228,474,290,509,458]]'),('approval','market_txn_changeinfo','approve','end',0,NULL,'[showConfirm:true,confirmMessage:\"You are about to approve?\"]',NULL,'Approve','[points:[462,228,474,290,509,458],type:\"arrow\",pos:[462,228],size:[47,230]]'),('approval','market_txn_close_account','approve','end',0,NULL,'[showConfirm:true,confirmMessage:\"You are about to approve this transaction. Proceed with disconnection?\"]',NULL,'Approve','[size:[47,230],pos:[462,228],type:\"arrow\",points:[462,228,474,290,509,458]]'),('approval','market_txn_creditnote','approve','end',0,NULL,'[showConfirm:true,confirmMessage:\"You are about to approve?\"]',NULL,'Approve','[size:[47,230],pos:[462,228],type:\"arrow\",points:[462,228,474,290,509,458]]'),('approval','market_txn_newaccount','approve','payment',0,NULL,'[:]',NULL,'Approve for Payment','[size:[99,22],pos:[547,277],type:\"arrow\",points:[547,299,595,290,646,277]]'),('approval','market_txn_payment_plan','approve','check-has-bill',0,NULL,'[showConfirm:true,confirmMessage:\"You are about to approve this transaction. Proceed?\"]',NULL,'Approve','[size:[135,25],pos:[502,139],type:\"arrow\",points:[502,164,540,159,637,139]]'),('approval','market_txn_unblock_account','approve','payment',0,NULL,'[showConfirm:true,confirmMessage:\"You are about to approve this for payment. Proceed?\"]',NULL,'Approve for Payment','[size:[109,50],pos:[502,159],type:\"arrow\",points:[502,164,540,159,611,209]]'),('approval','market_txn_with_assessment','approve','payment',0,NULL,'[:]',NULL,'Approve for Payment','[size:[55,52],pos:[435,205],type:\"arrow\",points:[490,205,435,257]]'),('pending','market_account','approve','active',0,NULL,'[showConfirm:true,confirmMessage:\"You are about to approve this record. Please check if ledger is complete.\"]',NULL,'Approve','[size:[52,64],pos:[386,147],type:\"arrow\",points:[386,211,438,147]]'),('active','market_account','block','blocked',0,NULL,'[visibleWhen:\"#{ false }\"]',NULL,'Block','[size:[97,37],pos:[542,142],type:\"arrow\",points:[542,142,639,179]]'),('hold','market_account','block','blocked',0,NULL,'[visibleWhen:\"#{ false }\"]',NULL,'Block','[size:[12,92],pos:[698,84],type:\"arrow\",points:[710,84,698,176]]'),('blocked','market_account','close','end',0,NULL,'[visibleWhen:\"#{ false }\"]',NULL,'Close Account','[size:[121,44],pos:[751,222],type:\"arrow\",points:[751,222,872,266]]'),('check-has-bill','market_txn_payment_plan','has-bill','payment',0,'#{ info.hasbill == true }','[:]',NULL,'Has Bill','[size:[41,62],pos:[722,157],type:\"arrow\",points:[722,157,763,219]]'),('check-has-bill','market_txn_payment_plan','has-no-bill','end',0,'#{ info.hasbill == false }','[:]',NULL,'No Bill','[size:[173,180],pos:[773,142],type:\"arrow\",points:[773,142,946,185,930,322]]'),('active','market_account','hold','hold',0,NULL,'[showPrompt:true]',NULL,'Hold','[size:[112,62],pos:[542,51],type:\"arrow\",points:[542,113,654,51]]'),('start','market_account','pending','pending',0,NULL,'[:]',NULL,'Pending','[size:[61,95],pos:[255,116],type:\"arrow\",points:[255,116,316,211]]'),('payment','market_txn_newaccount','post-payment','for-activation',0,NULL,'[:]',NULL,'Post Payment','[size:[122,6],pos:[738,309],type:\"arrow\",points:[738,315,860,309]]'),('payment','market_txn_payment_plan','post-payment','end',0,NULL,'[:]',NULL,'Post Payment','[size:[187,48],pos:[750,274],type:\"arrow\",points:[750,274,937,322]]'),('payment','market_txn_unblock_account','post-payment','releasing',0,NULL,'[:]',NULL,'Post Payment','[size:[7,69],pos:[680,263],type:\"arrow\",points:[680,263,687,332]]'),('payment','market_txn_with_assessment','post-payment','releasing',0,NULL,'[:]',NULL,'Post Payment','[size:[111,14],pos:[511,292],type:\"arrow\",points:[511,292,546,298,622,306]]'),('releasing','market_txn_unblock_account','release','end',0,NULL,'[:]',NULL,'Release','[size:[178,15],pos:[746,354],type:\"arrow\",points:[746,354,832,369,924,358]]'),('releasing','market_txn_with_assessment','release','end',0,NULL,'[:]',NULL,'Release','[size:[72,85],pos:[693,340],type:\"arrow\",points:[693,340,703,387,700,385,703,379,706,392,716,406,715,407,715,408,765,425]]'),('payment','market_txn_payment_plan','return-to-assessment','assessment',0,NULL,'[:]',NULL,'Return for Assessment','[size:[399,77],pos:[306,176],type:\"arrow\",points:[705,237,427,253,306,176]]'),('payment','market_txn_unblock_account','return-to-assessment','assessment',0,NULL,'[:]',NULL,'Return for Assessment','[size:[305,77],pos:[306,176],type:\"arrow\",points:[611,224,427,253,306,176]]'),('assessment','market_txn_unblock_account','send-for-release','releasing',0,NULL,'[showConfirm:true,confirmMessage:\"Approve without assessment?\"]',NULL,'Submit for Release','[size:[378,159],pos:[269,189],type:\"arrow\",points:[269,189,375,320,647,348]]'),('start','market_txn_block_account','start','approval',0,NULL,'[:]',NULL,'Start','[size:[212,152],pos:[191,46],type:\"arrow\",points:[191,46,403,198]]'),('start','market_txn_capture_account','start','approval',0,NULL,'[:]',NULL,'Start','[size:[212,152],pos:[191,46],type:\"arrow\",points:[191,46,403,198]]'),('start','market_txn_changeinfo','start','approval',0,NULL,'[:]',NULL,'Start','[points:[191,46,403,198],type:\"arrow\",pos:[191,46],size:[212,152]]'),('start','market_txn_close_account','start','approval',0,NULL,'[:]',NULL,'Start','[size:[212,152],pos:[191,46],type:\"arrow\",points:[191,46,403,198]]'),('start','market_txn_creditnote','start','approval',0,NULL,'[:]',NULL,'Start','[size:[212,152],pos:[191,46],type:\"arrow\",points:[191,46,403,198]]'),('start','market_txn_newaccount','start','receiving',0,NULL,'[:]',NULL,'Start','[size:[50,25],pos:[191,52],type:\"arrow\",points:[191,52,241,77]]'),('start','market_txn_payment_plan','start','assessment',0,NULL,'[:]',NULL,'Start','[size:[50,77],pos:[185,61],type:\"arrow\",points:[185,61,235,138]]'),('start','market_txn_unblock_account','start','assessment',0,NULL,'[:]',NULL,'Start','[size:[50,77],pos:[185,61],type:\"arrow\",points:[185,61,235,138]]'),('start','market_txn_with_assessment','start','assessment',0,NULL,'[:]',NULL,'Start','[size:[198,10],pos:[191,45],type:\"arrow\",points:[191,45,389,55]]'),('assessment','market_txn_newaccount','submit','approval',0,NULL,'[:]',NULL,'Submit','[size:[18,78],pos:[495,181],type:\"arrow\",points:[513,181,495,259]]'),('assessment','market_txn_payment_plan','submit','approval',0,NULL,'[:]',NULL,'Submit','[size:[87,10],pos:[306,163],type:\"arrow\",points:[306,173,393,163]]'),('assessment','market_txn_unblock_account','submit','approval',0,NULL,'[:]',NULL,'Submit for Approval','[size:[87,10],pos:[306,163],type:\"arrow\",points:[306,173,393,163]]'),('assessment','market_txn_with_assessment','submit','approval',0,NULL,'[:]',NULL,'Submit for Approval','[size:[29,66],pos:[445,90],type:\"arrow\",points:[445,90,474,156]]'),('inspection','market_txn_newaccount','submit','assessment',0,NULL,'[:]',NULL,'Submit','[size:[28,52],pos:[482,78],type:\"arrow\",points:[482,78,510,130]]'),('receiving','market_txn_newaccount','submit','inspection',0,NULL,'[:]',NULL,'Submit for Inspection','[size:[71,17],pos:[342,70],type:\"arrow\",points:[342,87,413,70]]'),('blocked','market_account','unblock','active',0,NULL,'[visibleWhen:\"#{ false }\"]',NULL,'Unblock','[size:[138,59],pos:[501,147],type:\"arrow\",points:[639,203,554,206,518,179,501,147]]'),('hold','market_account','unhold','active',0,NULL,'[:]',NULL,'Reactivate','[size:[113,41],pos:[542,84],type:\"arrow\",points:[655,84,600,125,542,123]]'),('releasing','market_txn_with_assessment','void-payment','payment',0,NULL,'[visibleWhen:\"#{ false }\"]',NULL,'Void Payment','[size:[119,33],pos:[503,314],type:\"arrow\",points:[622,331,565,347,503,314]]');
/*!40000 ALTER TABLE `sys_wf_transition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_market_account`
--

DROP TABLE IF EXISTS `vw_market_account`;
/*!50001 DROP VIEW IF EXISTS `vw_market_account`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_market_account` AS SELECT 
 1 AS `objid`,
 1 AS `acctno`,
 1 AS `remarks`,
 1 AS `acctinfoid`,
 1 AS `taskid`,
 1 AS `lastbillid`,
 1 AS `acctname`,
 1 AS `owner_name`,
 1 AS `owner_address_text`,
 1 AS `owner_entitytype`,
 1 AS `owner_profileid`,
 1 AS `owner_profileno`,
 1 AS `owner_firstname`,
 1 AS `owner_lastname`,
 1 AS `owner_middlename`,
 1 AS `owner_resident`,
 1 AS `owner_address_unitno`,
 1 AS `owner_address_bldgno`,
 1 AS `owner_address_bldgname`,
 1 AS `owner_address_street`,
 1 AS `owner_address_subdivision`,
 1 AS `owner_address_barangay_objid`,
 1 AS `owner_address_barangay_name`,
 1 AS `owner_address_citymunicipality`,
 1 AS `owner_address_province`,
 1 AS `owner_tin`,
 1 AS `owner_email`,
 1 AS `owner_mobileno`,
 1 AS `owner_phoneno`,
 1 AS `owner_id_type_name`,
 1 AS `owner_id_idno`,
 1 AS `owner_id_placeissued`,
 1 AS `owner_id_dtissued`,
 1 AS `contact_mobileno`,
 1 AS `contact_email`,
 1 AS `contact_phoneno`,
 1 AS `business_objid`,
 1 AS `business_bin`,
 1 AS `business_tradename`,
 1 AS `tags`,
 1 AS `unitid`,
 1 AS `unitno`,
 1 AS `centerid`,
 1 AS `areasqm`,
 1 AS `center_objid`,
 1 AS `center_name`,
 1 AS `sectionid`,
 1 AS `section_objid`,
 1 AS `section_name`,
 1 AS `section_fullpath`,
 1 AS `org_objid`,
 1 AS `org_name`,
 1 AS `schedulegroupid`,
 1 AS `rateid`,
 1 AS `ratetype`,
 1 AS `rate`,
 1 AS `paymentmode`,
 1 AS `task_state`,
 1 AS `task_dtcreated`,
 1 AS `task_startdate`,
 1 AS `task_enddate`,
 1 AS `task_assignee_objid`,
 1 AS `task_assignee_name`,
 1 AS `task_actor_objid`,
 1 AS `task_actor_name`,
 1 AS `task_title`,
 1 AS `task_tracktime`,
 1 AS `task_properties`,
 1 AS `bill_balance`,
 1 AS `bill_year`,
 1 AS `bill_month`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_market_account_info`
--

DROP TABLE IF EXISTS `vw_market_account_info`;
/*!50001 DROP VIEW IF EXISTS `vw_market_account_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_market_account_info` AS SELECT 
 1 AS `objid`,
 1 AS `acctid`,
 1 AS `acctname`,
 1 AS `owner_objid`,
 1 AS `owner_name`,
 1 AS `owner_address_text`,
 1 AS `owner_entitytype`,
 1 AS `owner_profileid`,
 1 AS `owner_profileno`,
 1 AS `owner_firstname`,
 1 AS `owner_lastname`,
 1 AS `owner_middlename`,
 1 AS `owner_resident`,
 1 AS `owner_address_objid`,
 1 AS `owner_address_unitno`,
 1 AS `owner_address_bldgno`,
 1 AS `owner_address_bldgname`,
 1 AS `owner_address_street`,
 1 AS `owner_address_subdivision`,
 1 AS `owner_address_barangay_objid`,
 1 AS `owner_address_barangay_name`,
 1 AS `owner_address_citymunicipality`,
 1 AS `owner_address_province`,
 1 AS `owner_tin`,
 1 AS `owner_email`,
 1 AS `owner_mobileno`,
 1 AS `owner_phoneno`,
 1 AS `owner_id_type_name`,
 1 AS `owner_id_idno`,
 1 AS `owner_id_placeissued`,
 1 AS `owner_id_dtissued`,
 1 AS `contact_mobileno`,
 1 AS `contact_email`,
 1 AS `contact_phoneno`,
 1 AS `unitid`,
 1 AS `paymentmode`,
 1 AS `business_objid`,
 1 AS `business_bin`,
 1 AS `business_tradename`,
 1 AS `tags`,
 1 AS `unitno`,
 1 AS `centerid`,
 1 AS `areasqm`,
 1 AS `center_objid`,
 1 AS `center_name`,
 1 AS `sectionid`,
 1 AS `section_objid`,
 1 AS `section_name`,
 1 AS `section_fullpath`,
 1 AS `schedulegroupid`,
 1 AS `rateid`,
 1 AS `ratetype`,
 1 AS `rate`,
 1 AS `org_objid`,
 1 AS `org_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_market_bill`
--

DROP TABLE IF EXISTS `vw_market_bill`;
/*!50001 DROP VIEW IF EXISTS `vw_market_bill`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_market_bill` AS SELECT 
 1 AS `objid`,
 1 AS `prevbillid`,
 1 AS `billno`,
 1 AS `billdate`,
 1 AS `lasttxndate`,
 1 AS `validitydate`,
 1 AS `duedate`,
 1 AS `acctid`,
 1 AS `acctinfoid`,
 1 AS `state`,
 1 AS `remarks`,
 1 AS `balanceforward`,
 1 AS `totalpayment`,
 1 AS `interest`,
 1 AS `surcharge`,
 1 AS `amount`,
 1 AS `discount`,
 1 AS `txnmode`,
 1 AS `uid`,
 1 AS `scheduleid`,
 1 AS `dtprinted`,
 1 AS `rateid`,
 1 AS `acctno`,
 1 AS `acctname`,
 1 AS `year`,
 1 AS `month`,
 1 AS `fromdate`,
 1 AS `todate`,
 1 AS `discdate`,
 1 AS `expirydate`,
 1 AS `balance`,
 1 AS `owner_objid`,
 1 AS `owner_name`,
 1 AS `expired`,
 1 AS `rate`,
 1 AS `ratetype`,
 1 AS `paymentmode`,
 1 AS `section_name`,
 1 AS `section_fullpath`,
 1 AS `center_objid`,
 1 AS `center_name`,
 1 AS `unitno`,
 1 AS `org_objid`,
 1 AS `org_name`,
 1 AS `schedulegroupid`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_market_bill_payment`
--

DROP TABLE IF EXISTS `vw_market_bill_payment`;
/*!50001 DROP VIEW IF EXISTS `vw_market_bill_payment`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_market_bill_payment` AS SELECT 
 1 AS `objid`,
 1 AS `billid`,
 1 AS `refid`,
 1 AS `refno`,
 1 AS `reftype`,
 1 AS `refdate`,
 1 AS `txnmode`,
 1 AS `voided`,
 1 AS `amount`,
 1 AS `remarks`,
 1 AS `txnid`,
 1 AS `payer_objid`,
 1 AS `payer_name`,
 1 AS `paidby`,
 1 AS `paidbyaddress`,
 1 AS `posted`,
 1 AS `acctid`,
 1 AS `billrefno`,
 1 AS `year`,
 1 AS `month`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_market_billitem`
--

DROP TABLE IF EXISTS `vw_market_billitem`;
/*!50001 DROP VIEW IF EXISTS `vw_market_billitem`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_market_billitem` AS SELECT 
 1 AS `objid`,
 1 AS `billid`,
 1 AS `itemid`,
 1 AS `amount`,
 1 AS `amtpaid`,
 1 AS `remarks`,
 1 AS `uid`,
 1 AS `auto`,
 1 AS `forwarded`,
 1 AS `billdate`,
 1 AS `supersededid`,
 1 AS `particulars`,
 1 AS `year`,
 1 AS `month`,
 1 AS `duedate`,
 1 AS `paymentplanid`,
 1 AS `superseded`,
 1 AS `supersederid`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_market_billitem_subitem`
--

DROP TABLE IF EXISTS `vw_market_billitem_subitem`;
/*!50001 DROP VIEW IF EXISTS `vw_market_billitem_subitem`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_market_billitem_subitem` AS SELECT 
 1 AS `objid`,
 1 AS `billid`,
 1 AS `itemid`,
 1 AS `amount`,
 1 AS `amtpaid`,
 1 AS `remarks`,
 1 AS `uid`,
 1 AS `auto`,
 1 AS `forwarded`,
 1 AS `billdate`,
 1 AS `supersededid`,
 1 AS `billitemrefid`,
 1 AS `balance`,
 1 AS `type`,
 1 AS `superseded`,
 1 AS `supersederid`,
 1 AS `refitemid`,
 1 AS `refyear`,
 1 AS `refmonth`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_market_credit_billitem`
--

DROP TABLE IF EXISTS `vw_market_credit_billitem`;
/*!50001 DROP VIEW IF EXISTS `vw_market_credit_billitem`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_market_credit_billitem` AS SELECT 
 1 AS `objid`,
 1 AS `billid`,
 1 AS `itemid`,
 1 AS `amount`,
 1 AS `amtpaid`,
 1 AS `remarks`,
 1 AS `uid`,
 1 AS `auto`,
 1 AS `forwarded`,
 1 AS `billdate`,
 1 AS `supersededid`,
 1 AS `particulars`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_market_payment_plan`
--

DROP TABLE IF EXISTS `vw_market_payment_plan`;
/*!50001 DROP VIEW IF EXISTS `vw_market_payment_plan`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_market_payment_plan` AS SELECT 
 1 AS `objid`,
 1 AS `downpaymentrate`,
 1 AS `downpayment`,
 1 AS `term`,
 1 AS `principal`,
 1 AS `installmentamt`,
 1 AS `startdate`,
 1 AS `billcount`,
 1 AS `amtbilled`,
 1 AS `itemid`,
 1 AS `refid`,
 1 AS `refno`,
 1 AS `refdate`,
 1 AS `reftype`,
 1 AS `txnid`,
 1 AS `billid`,
 1 AS `txnmode`,
 1 AS `voided`,
 1 AS `remarks`,
 1 AS `posted`,
 1 AS `amount`,
 1 AS `acctid`,
 1 AS `txntypeid`,
 1 AS `balance`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_market_rental_unit`
--

DROP TABLE IF EXISTS `vw_market_rental_unit`;
/*!50001 DROP VIEW IF EXISTS `vw_market_rental_unit`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_market_rental_unit` AS SELECT 
 1 AS `objid`,
 1 AS `state`,
 1 AS `centerid`,
 1 AS `sectionid`,
 1 AS `unitno`,
 1 AS `unittype`,
 1 AS `currentacctid`,
 1 AS `indexno`,
 1 AS `areasqm`,
 1 AS `schedulegroupid`,
 1 AS `uid`,
 1 AS `center_objid`,
 1 AS `center_name`,
 1 AS `org_objid`,
 1 AS `org_name`,
 1 AS `section_objid`,
 1 AS `section_name`,
 1 AS `section_leftindex`,
 1 AS `section_rightindex`,
 1 AS `section_fullpath`,
 1 AS `account_acctno`,
 1 AS `account_objid`,
 1 AS `account_acctname`,
 1 AS `rateid`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_market_txn`
--

DROP TABLE IF EXISTS `vw_market_txn`;
/*!50001 DROP VIEW IF EXISTS `vw_market_txn`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_market_txn` AS SELECT 
 1 AS `objid`,
 1 AS `controlno`,
 1 AS `txntypeid`,
 1 AS `remarks`,
 1 AS `acctid`,
 1 AS `acctinfoid`,
 1 AS `oldacctinfoid`,
 1 AS `newacctinfoid`,
 1 AS `taskid`,
 1 AS `info`,
 1 AS `task_state`,
 1 AS `task_dtcreated`,
 1 AS `task_startdate`,
 1 AS `task_enddate`,
 1 AS `task_assignee_objid`,
 1 AS `task_assignee_name`,
 1 AS `task_actor_objid`,
 1 AS `task_actor_name`,
 1 AS `task_title`,
 1 AS `task_tracktime`,
 1 AS `task_properties`,
 1 AS `billid`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_market_txn_billitem`
--

DROP TABLE IF EXISTS `vw_market_txn_billitem`;
/*!50001 DROP VIEW IF EXISTS `vw_market_txn_billitem`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_market_txn_billitem` AS SELECT 
 1 AS `objid`,
 1 AS `billid`,
 1 AS `itemid`,
 1 AS `amount`,
 1 AS `amtpaid`,
 1 AS `remarks`,
 1 AS `uid`,
 1 AS `auto`,
 1 AS `forwarded`,
 1 AS `billdate`,
 1 AS `supersededid`,
 1 AS `paymentplanid`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_market_txn_paymentitem`
--

DROP TABLE IF EXISTS `vw_market_txn_paymentitem`;
/*!50001 DROP VIEW IF EXISTS `vw_market_txn_paymentitem`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_market_txn_paymentitem` AS SELECT 
 1 AS `objid`,
 1 AS `paymentid`,
 1 AS `particulars`,
 1 AS `amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_market_account`
--

/*!50001 DROP VIEW IF EXISTS `vw_market_account`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_market_account` AS select `ma`.`objid` AS `objid`,`ma`.`acctno` AS `acctno`,`ma`.`remarks` AS `remarks`,`ma`.`acctinfoid` AS `acctinfoid`,`ma`.`taskid` AS `taskid`,`ma`.`lastbillid` AS `lastbillid`,`mai`.`acctname` AS `acctname`,`mai`.`owner_name` AS `owner_name`,`mai`.`owner_address_text` AS `owner_address_text`,`mai`.`owner_entitytype` AS `owner_entitytype`,`mai`.`owner_profileid` AS `owner_profileid`,`mai`.`owner_profileno` AS `owner_profileno`,`mai`.`owner_firstname` AS `owner_firstname`,`mai`.`owner_lastname` AS `owner_lastname`,`mai`.`owner_middlename` AS `owner_middlename`,`mai`.`owner_resident` AS `owner_resident`,`mai`.`owner_address_unitno` AS `owner_address_unitno`,`mai`.`owner_address_bldgno` AS `owner_address_bldgno`,`mai`.`owner_address_bldgname` AS `owner_address_bldgname`,`mai`.`owner_address_street` AS `owner_address_street`,`mai`.`owner_address_subdivision` AS `owner_address_subdivision`,`mai`.`owner_address_barangay_objid` AS `owner_address_barangay_objid`,`mai`.`owner_address_barangay_name` AS `owner_address_barangay_name`,`mai`.`owner_address_citymunicipality` AS `owner_address_citymunicipality`,`mai`.`owner_address_province` AS `owner_address_province`,`mai`.`owner_tin` AS `owner_tin`,`mai`.`owner_email` AS `owner_email`,`mai`.`owner_mobileno` AS `owner_mobileno`,`mai`.`owner_phoneno` AS `owner_phoneno`,`mai`.`owner_id_type_name` AS `owner_id_type_name`,`mai`.`owner_id_idno` AS `owner_id_idno`,`mai`.`owner_id_placeissued` AS `owner_id_placeissued`,`mai`.`owner_id_dtissued` AS `owner_id_dtissued`,`mai`.`contact_mobileno` AS `contact_mobileno`,`mai`.`contact_email` AS `contact_email`,`mai`.`contact_phoneno` AS `contact_phoneno`,`mai`.`business_objid` AS `business_objid`,`mai`.`business_bin` AS `business_bin`,`mai`.`business_tradename` AS `business_tradename`,`mai`.`tags` AS `tags`,`mai`.`unitid` AS `unitid`,`mai`.`unitno` AS `unitno`,`mai`.`centerid` AS `centerid`,`mai`.`areasqm` AS `areasqm`,`mai`.`center_objid` AS `center_objid`,`mai`.`center_name` AS `center_name`,`mai`.`sectionid` AS `sectionid`,`mai`.`section_objid` AS `section_objid`,`mai`.`section_name` AS `section_name`,`mai`.`section_fullpath` AS `section_fullpath`,`mai`.`org_objid` AS `org_objid`,`mai`.`org_name` AS `org_name`,`mai`.`schedulegroupid` AS `schedulegroupid`,`mai`.`rateid` AS `rateid`,`mai`.`ratetype` AS `ratetype`,`mai`.`rate` AS `rate`,`mai`.`paymentmode` AS `paymentmode`,`t`.`state` AS `task_state`,`t`.`dtcreated` AS `task_dtcreated`,`t`.`startdate` AS `task_startdate`,`t`.`enddate` AS `task_enddate`,`t`.`assignee_objid` AS `task_assignee_objid`,`t`.`assignee_name` AS `task_assignee_name`,`t`.`actor_objid` AS `task_actor_objid`,`t`.`actor_name` AS `task_actor_name`,`sn`.`title` AS `task_title`,`sn`.`tracktime` AS `task_tracktime`,`sn`.`properties` AS `task_properties`,((((`mb`.`balanceforward` + `mb`.`interest`) + `mb`.`surcharge`) + `mb`.`amount`) - (`mb`.`totalpayment` + `mb`.`discount`)) AS `bill_balance`,`mbs`.`year` AS `bill_year`,`mbs`.`month` AS `bill_month` from (((((`market_account` `ma` join `vw_market_account_info` `mai` on((`ma`.`acctinfoid` = `mai`.`objid`))) left join `market_account_task` `t` on((`ma`.`taskid` = `t`.`taskid`))) left join `sys_wf_node` `sn` on(((`sn`.`processname` = 'market_account') and (`sn`.`name` = `t`.`state`)))) left join `market_bill` `mb` on((`ma`.`lastbillid` = `mb`.`objid`))) left join `market_billschedule` `mbs` on((`mb`.`scheduleid` = `mbs`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_market_account_info`
--

/*!50001 DROP VIEW IF EXISTS `vw_market_account_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_market_account_info` AS select `mai`.`objid` AS `objid`,`mai`.`acctid` AS `acctid`,`mai`.`acctname` AS `acctname`,`mai`.`owner_objid` AS `owner_objid`,`mai`.`owner_name` AS `owner_name`,`mai`.`owner_address_text` AS `owner_address_text`,`mai`.`owner_entitytype` AS `owner_entitytype`,`mai`.`owner_profileid` AS `owner_profileid`,`mai`.`owner_profileno` AS `owner_profileno`,`mai`.`owner_firstname` AS `owner_firstname`,`mai`.`owner_lastname` AS `owner_lastname`,`mai`.`owner_middlename` AS `owner_middlename`,`mai`.`owner_resident` AS `owner_resident`,`mai`.`owner_address_objid` AS `owner_address_objid`,`mai`.`owner_address_unitno` AS `owner_address_unitno`,`mai`.`owner_address_bldgno` AS `owner_address_bldgno`,`mai`.`owner_address_bldgname` AS `owner_address_bldgname`,`mai`.`owner_address_street` AS `owner_address_street`,`mai`.`owner_address_subdivision` AS `owner_address_subdivision`,`mai`.`owner_address_barangay_objid` AS `owner_address_barangay_objid`,`mai`.`owner_address_barangay_name` AS `owner_address_barangay_name`,`mai`.`owner_address_citymunicipality` AS `owner_address_citymunicipality`,`mai`.`owner_address_province` AS `owner_address_province`,`mai`.`owner_tin` AS `owner_tin`,`mai`.`owner_email` AS `owner_email`,`mai`.`owner_mobileno` AS `owner_mobileno`,`mai`.`owner_phoneno` AS `owner_phoneno`,`mai`.`owner_id_type_name` AS `owner_id_type_name`,`mai`.`owner_id_idno` AS `owner_id_idno`,`mai`.`owner_id_placeissued` AS `owner_id_placeissued`,`mai`.`owner_id_dtissued` AS `owner_id_dtissued`,`mai`.`contact_mobileno` AS `contact_mobileno`,`mai`.`contact_email` AS `contact_email`,`mai`.`contact_phoneno` AS `contact_phoneno`,`mai`.`unitid` AS `unitid`,`mai`.`paymentmode` AS `paymentmode`,`mai`.`business_objid` AS `business_objid`,`mai`.`business_bin` AS `business_bin`,`mai`.`business_tradename` AS `business_tradename`,`mai`.`tags` AS `tags`,`mu`.`unitno` AS `unitno`,`mu`.`centerid` AS `centerid`,`mu`.`areasqm` AS `areasqm`,`mu`.`center_objid` AS `center_objid`,`mu`.`center_name` AS `center_name`,`mu`.`sectionid` AS `sectionid`,`mu`.`section_objid` AS `section_objid`,`mu`.`section_name` AS `section_name`,`mu`.`section_fullpath` AS `section_fullpath`,ifnull(`mu`.`schedulegroupid`,`mc`.`schedulegroupid`) AS `schedulegroupid`,`mu`.`rateid` AS `rateid`,`mr`.`ratetype` AS `ratetype`,`mr`.`rate` AS `rate`,`mc`.`org_objid` AS `org_objid`,`mc`.`org_name` AS `org_name` from (((`market_account_info` `mai` join `vw_market_rental_unit` `mu` on((`mai`.`unitid` = `mu`.`objid`))) join `market_center` `mc` on((`mu`.`centerid` = `mc`.`objid`))) left join `market_rental_rate` `mr` on((`mu`.`rateid` = `mr`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_market_bill`
--

/*!50001 DROP VIEW IF EXISTS `vw_market_bill`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_market_bill` AS select `mb`.`objid` AS `objid`,`mb`.`prevbillid` AS `prevbillid`,`mb`.`billno` AS `billno`,`mb`.`billdate` AS `billdate`,`mb`.`lasttxndate` AS `lasttxndate`,`mb`.`validitydate` AS `validitydate`,`mb`.`duedate` AS `duedate`,`mb`.`acctid` AS `acctid`,`mb`.`acctinfoid` AS `acctinfoid`,`mb`.`state` AS `state`,`mb`.`remarks` AS `remarks`,`mb`.`balanceforward` AS `balanceforward`,`mb`.`totalpayment` AS `totalpayment`,`mb`.`interest` AS `interest`,`mb`.`surcharge` AS `surcharge`,`mb`.`amount` AS `amount`,`mb`.`discount` AS `discount`,`mb`.`txnmode` AS `txnmode`,`mb`.`uid` AS `uid`,`mb`.`scheduleid` AS `scheduleid`,`mb`.`dtprinted` AS `dtprinted`,`mb`.`rateid` AS `rateid`,`ma`.`acctno` AS `acctno`,`mai`.`acctname` AS `acctname`,`mbs`.`year` AS `year`,`mbs`.`month` AS `month`,`mbs`.`fromdate` AS `fromdate`,`mbs`.`todate` AS `todate`,`mbs`.`discdate` AS `discdate`,`mbs`.`expirydate` AS `expirydate`,((((`mb`.`balanceforward` + `mb`.`interest`) + `mb`.`surcharge`) + `mb`.`amount`) - (`mb`.`totalpayment` + `mb`.`discount`)) AS `balance`,`mai`.`owner_objid` AS `owner_objid`,`mai`.`owner_name` AS `owner_name`,(case when (`mbs`.`expirydate` < now()) then 1 else 0 end) AS `expired`,`mr`.`rate` AS `rate`,`mr`.`ratetype` AS `ratetype`,`mai`.`paymentmode` AS `paymentmode`,`mai`.`section_name` AS `section_name`,`mai`.`section_fullpath` AS `section_fullpath`,`mai`.`center_objid` AS `center_objid`,`mai`.`center_name` AS `center_name`,`mai`.`unitno` AS `unitno`,`mai`.`org_objid` AS `org_objid`,`mai`.`org_name` AS `org_name`,`mbs`.`groupid` AS `schedulegroupid` from ((((`market_bill` `mb` join `market_billschedule` `mbs` on((`mb`.`scheduleid` = `mbs`.`objid`))) join `market_rental_rate` `mr` on((`mb`.`rateid` = `mr`.`objid`))) join `market_account` `ma` on((`mb`.`acctid` = `ma`.`objid`))) join `vw_market_account_info` `mai` on((`ma`.`acctinfoid` = `mai`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_market_bill_payment`
--

/*!50001 DROP VIEW IF EXISTS `vw_market_bill_payment`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_market_bill_payment` AS select `pp`.`objid` AS `objid`,`pp`.`billid` AS `billid`,`pp`.`refid` AS `refid`,`pp`.`refno` AS `refno`,`pp`.`reftype` AS `reftype`,`pp`.`refdate` AS `refdate`,`pp`.`txnmode` AS `txnmode`,`pp`.`voided` AS `voided`,`pp`.`amount` AS `amount`,`pp`.`remarks` AS `remarks`,`pp`.`txnid` AS `txnid`,`pp`.`payer_objid` AS `payer_objid`,`pp`.`payer_name` AS `payer_name`,`pp`.`paidby` AS `paidby`,`pp`.`paidbyaddress` AS `paidbyaddress`,`pp`.`posted` AS `posted`,`mb`.`acctid` AS `acctid`,`mb`.`billno` AS `billrefno`,`bs`.`year` AS `year`,`bs`.`month` AS `month` from ((`market_payment` `pp` join `market_bill` `mb` on((`pp`.`billid` = `mb`.`objid`))) join `market_billschedule` `bs` on((`mb`.`scheduleid` = `bs`.`objid`))) where ((`pp`.`reftype` in ('cashreceipt','eor')) and (`pp`.`voided` = 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_market_billitem`
--

/*!50001 DROP VIEW IF EXISTS `vw_market_billitem`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_market_billitem` AS select `mbi`.`objid` AS `objid`,`mbi`.`billid` AS `billid`,`mbi`.`itemid` AS `itemid`,`mbi`.`amount` AS `amount`,`mbi`.`amtpaid` AS `amtpaid`,`mbi`.`remarks` AS `remarks`,`mbi`.`uid` AS `uid`,`mbi`.`auto` AS `auto`,`mbi`.`forwarded` AS `forwarded`,`mbi`.`billdate` AS `billdate`,`mbi`.`supersededid` AS `supersededid`,(case when isnull(`mri`.`year`) then concat(`mai`.`title`,' ',`mri`.`year`,' ',`mri`.`month`) else `mai`.`title` end) AS `particulars`,`mri`.`year` AS `year`,`mri`.`month` AS `month`,`mri`.`duedate` AS `duedate`,`mri`.`paymentplanid` AS `paymentplanid`,(case when isnull(`abi`.`objid`) then 0 else 1 end) AS `superseded`,`abi`.`supersededid` AS `supersederid` from (((`market_abstract_billitem` `mbi` join `market_billitem` `mri` on((`mri`.`objid` = `mbi`.`objid`))) join `market_itemaccount` `mai` on((`mbi`.`itemid` = `mai`.`objid`))) left join `market_abstract_billitem` `abi` on((`mbi`.`objid` = `abi`.`supersededid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_market_billitem_subitem`
--

/*!50001 DROP VIEW IF EXISTS `vw_market_billitem_subitem`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_market_billitem_subitem` AS select `abi`.`objid` AS `objid`,`abi`.`billid` AS `billid`,`abi`.`itemid` AS `itemid`,`abi`.`amount` AS `amount`,`abi`.`amtpaid` AS `amtpaid`,`abi`.`remarks` AS `remarks`,`abi`.`uid` AS `uid`,`abi`.`auto` AS `auto`,`abi`.`forwarded` AS `forwarded`,`abi`.`billdate` AS `billdate`,`abi`.`supersededid` AS `supersededid`,`pbi`.`billitemrefid` AS `billitemrefid`,(`abi`.`amount` - `abi`.`amtpaid`) AS `balance`,`pbi`.`type` AS `type`,(case when isnull(`xbi`.`objid`) then 0 else 1 end) AS `superseded`,`xbi`.`supersededid` AS `supersederid`,`rabi`.`itemid` AS `refitemid`,`rbi`.`year` AS `refyear`,`rbi`.`month` AS `refmonth` from ((((`market_abstract_billitem` `abi` join `market_billitem_subitem` `pbi` on((`pbi`.`objid` = `abi`.`objid`))) join `market_abstract_billitem` `rabi` on((`rabi`.`objid` = `pbi`.`billitemrefid`))) left join `market_billitem` `rbi` on((`rabi`.`objid` = `rbi`.`objid`))) left join `market_abstract_billitem` `xbi` on((`abi`.`objid` = `xbi`.`supersededid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_market_credit_billitem`
--

/*!50001 DROP VIEW IF EXISTS `vw_market_credit_billitem`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_market_credit_billitem` AS select `mbi`.`objid` AS `objid`,`mbi`.`billid` AS `billid`,`mbi`.`itemid` AS `itemid`,`mbi`.`amount` AS `amount`,`mbi`.`amtpaid` AS `amtpaid`,`mbi`.`remarks` AS `remarks`,`mbi`.`uid` AS `uid`,`mbi`.`auto` AS `auto`,`mbi`.`forwarded` AS `forwarded`,`mbi`.`billdate` AS `billdate`,`mbi`.`supersededid` AS `supersededid`,`mai`.`title` AS `particulars` from ((`market_abstract_billitem` `mbi` join `market_credit_billitem` `mri` on((`mri`.`objid` = `mbi`.`objid`))) join `market_itemaccount` `mai` on((`mbi`.`itemid` = `mai`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_market_payment_plan`
--

/*!50001 DROP VIEW IF EXISTS `vw_market_payment_plan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_market_payment_plan` AS select `pp`.`objid` AS `objid`,`pp`.`downpaymentrate` AS `downpaymentrate`,`pp`.`downpayment` AS `downpayment`,`pp`.`term` AS `term`,`pp`.`principal` AS `principal`,`pp`.`installmentamt` AS `installmentamt`,`pp`.`startdate` AS `startdate`,`pp`.`billcount` AS `billcount`,`pp`.`amtbilled` AS `amtbilled`,`pp`.`itemid` AS `itemid`,`p`.`refid` AS `refid`,`p`.`refno` AS `refno`,`p`.`refdate` AS `refdate`,`p`.`reftype` AS `reftype`,`p`.`txnid` AS `txnid`,`p`.`billid` AS `billid`,`p`.`txnmode` AS `txnmode`,`p`.`voided` AS `voided`,`p`.`remarks` AS `remarks`,`p`.`posted` AS `posted`,`p`.`amount` AS `amount`,`txn`.`acctid` AS `acctid`,`txn`.`txntypeid` AS `txntypeid`,(`pp`.`principal` - `pp`.`amtbilled`) AS `balance` from ((`market_payment_plan` `pp` join `market_payment` `p` on((`pp`.`objid` = `p`.`objid`))) join `market_txn` `txn` on((`p`.`txnid` = `txn`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_market_rental_unit`
--

/*!50001 DROP VIEW IF EXISTS `vw_market_rental_unit`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_market_rental_unit` AS select `mu`.`objid` AS `objid`,`mu`.`state` AS `state`,`mu`.`centerid` AS `centerid`,`mu`.`sectionid` AS `sectionid`,`mu`.`unitno` AS `unitno`,`mu`.`unittype` AS `unittype`,`mu`.`currentacctid` AS `currentacctid`,`mu`.`indexno` AS `indexno`,`mu`.`areasqm` AS `areasqm`,`mu`.`schedulegroupid` AS `schedulegroupid`,`mu`.`uid` AS `uid`,`mc`.`objid` AS `center_objid`,`mc`.`name` AS `center_name`,`mc`.`org_objid` AS `org_objid`,`mc`.`org_name` AS `org_name`,`ou`.`objid` AS `section_objid`,`ou`.`name` AS `section_name`,`ou`.`leftindex` AS `section_leftindex`,`ou`.`rightindex` AS `section_rightindex`,`ou`.`fullpath` AS `section_fullpath`,`ma`.`acctno` AS `account_acctno`,`ma`.`objid` AS `account_objid`,`mai`.`acctname` AS `account_acctname`,(select `market_rental_rate`.`objid` from `market_rental_rate` where ((`market_rental_rate`.`unitid` = `mu`.`objid`) and (`market_rental_rate`.`effectivedate` <= now())) order by `market_rental_rate`.`effectivedate` desc limit 1) AS `rateid` from ((((`market_rental_unit` `mu` join `market_center` `mc` on((`mu`.`centerid` = `mc`.`objid`))) join `market_section` `ou` on((`mu`.`sectionid` = `ou`.`objid`))) left join `market_account` `ma` on((`mu`.`currentacctid` = `ma`.`objid`))) left join `market_account_info` `mai` on((`ma`.`acctinfoid` = `mai`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_market_txn`
--

/*!50001 DROP VIEW IF EXISTS `vw_market_txn`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_market_txn` AS select `txn`.`objid` AS `objid`,`txn`.`controlno` AS `controlno`,`txn`.`txntypeid` AS `txntypeid`,`txn`.`remarks` AS `remarks`,`txn`.`acctid` AS `acctid`,(case when isnull(`txn`.`newacctinfoid`) then `txn`.`oldacctinfoid` else `txn`.`newacctinfoid` end) AS `acctinfoid`,`txn`.`oldacctinfoid` AS `oldacctinfoid`,`txn`.`newacctinfoid` AS `newacctinfoid`,`txn`.`taskid` AS `taskid`,`txn`.`info` AS `info`,`t`.`state` AS `task_state`,`t`.`dtcreated` AS `task_dtcreated`,`t`.`startdate` AS `task_startdate`,`t`.`enddate` AS `task_enddate`,`t`.`assignee_objid` AS `task_assignee_objid`,`t`.`assignee_name` AS `task_assignee_name`,`t`.`actor_objid` AS `task_actor_objid`,`t`.`actor_name` AS `task_actor_name`,`sn`.`title` AS `task_title`,`sn`.`tracktime` AS `task_tracktime`,`sn`.`properties` AS `task_properties`,`tb`.`objid` AS `billid` from ((((`market_txn` `txn` join `market_txntype` `typ` on((`txn`.`txntypeid` = `typ`.`objid`))) join `market_txn_task` `t` on((`txn`.`taskid` = `t`.`taskid`))) join `sys_wf_node` `sn` on(((`sn`.`processname` = `typ`.`processname`) and (`sn`.`name` = `t`.`state`)))) left join `market_txn_bill` `tb` on((`txn`.`objid` = `tb`.`txnid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_market_txn_billitem`
--

/*!50001 DROP VIEW IF EXISTS `vw_market_txn_billitem`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_market_txn_billitem` AS select `ma`.`objid` AS `objid`,`ma`.`billid` AS `billid`,`ma`.`itemid` AS `itemid`,`ma`.`amount` AS `amount`,`ma`.`amtpaid` AS `amtpaid`,`ma`.`remarks` AS `remarks`,`ma`.`uid` AS `uid`,`ma`.`auto` AS `auto`,`ma`.`forwarded` AS `forwarded`,`ma`.`billdate` AS `billdate`,`ma`.`supersededid` AS `supersededid`,`b`.`paymentplanid` AS `paymentplanid` from (`market_abstract_billitem` `ma` join `market_txn_billitem` `b` on((`ma`.`objid` = `b`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_market_txn_paymentitem`
--

/*!50001 DROP VIEW IF EXISTS `vw_market_txn_paymentitem`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_market_txn_paymentitem` AS select `bi`.`objid` AS `objid`,`pi`.`paymentid` AS `paymentid`,concat(`ia`.`title`,' ',`bi`.`year`,'-',`bi`.`month`) AS `particulars`,`pi`.`amount` AS `amount` from (((`market_billitem` `bi` join `market_abstract_billitem` `abi` on((`bi`.`objid` = `abi`.`objid`))) join `market_paymentitem` `pi` on((`pi`.`billitemrefid` = `bi`.`objid`))) join `market_itemaccount` `ia` on((`abi`.`itemid` = `ia`.`objid`))) union select `sbi`.`objid` AS `objid`,`pi`.`paymentid` AS `paymentid`,concat(`ia`.`title`,' ',`bi`.`year`,'-',`bi`.`month`) AS `particulars`,`pi`.`amount` AS `amount` from ((((`market_billitem_subitem` `sbi` join `market_abstract_billitem` `abi` on((`sbi`.`objid` = `abi`.`objid`))) join `market_paymentitem` `pi` on((`pi`.`billitemrefid` = `sbi`.`objid`))) join `market_billitem` `bi` on((`sbi`.`billitemrefid` = `bi`.`objid`))) join `market_itemaccount` `ia` on((`abi`.`itemid` = `ia`.`objid`))) */;
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

-- Dump completed on 2024-02-13 20:25:37
