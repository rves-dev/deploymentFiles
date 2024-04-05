-- MySQL dump 10.13  Distrib 5.7.42, for Win64 (x86_64)
--
-- Host: localhost    Database: water_panglao
-- ------------------------------------------------------
-- Server version	5.7.42-log

CREATE DATABASE `water_panglao` CHARACTER SET utf8
;

USE `water_panglao`
;


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
  PRIMARY KEY (`objid`) USING BTREE
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
  PRIMARY KEY (`objid`) USING BTREE
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
  PRIMARY KEY (`objid`) USING BTREE
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
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_message_template`
--

LOCK TABLES `sys_message_template` WRITE;
/*!40000 ALTER TABLE `sys_message_template` DISABLE KEYS */;
INSERT INTO `sys_message_template` VALUES ('sample_message','def info = [:];\ninfo.email = \"elmonazareno@gmail.com\";\ninfo.mobileno = \"09173070196\";\ninfo.lastname = \"Nazareno\";\ninfo.firstname = \"Elmo\";\ninfo.amtdue = 1287.89;\nreturn [ info ] ;','Due amount for ${it.lastname}, ${firstname}','Dear ${it.lastname}, ${firstname}, <br>\n\nYour present balace is ${amtdue}. Please pay immediately <br>\n\nIligan Water','${ it.email }','${mobileno}','water','Your present balance is ${amtdue}',NULL,NULL);
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
  PRIMARY KEY (`name`) USING BTREE,
  KEY `fk_sys_report_def_template` (`template`) USING BTREE,
  KEY `fk_sys_report_def_reportheader` (`reportheader`) USING BTREE,
  KEY `fk_sys_report_def_role` (`role`) USING BTREE,
  CONSTRAINT `fk_sys_report_def_reportheader` FOREIGN KEY (`reportheader`) REFERENCES `sys_report_header` (`name`),
  CONSTRAINT `fk_sys_report_def_role` FOREIGN KEY (`role`) REFERENCES `sys_role` (`name`),
  CONSTRAINT `fk_sys_report_def_template` FOREIGN KEY (`template`) REFERENCES `sys_report_template` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_report_def`
--

LOCK TABLES `sys_report_def` WRITE;
/*!40000 ALTER TABLE `sys_report_def` DISABLE KEYS */;
INSERT INTO `sys_report_def` VALUES ('list_of_consumption_below_10cum','List of Consumption (Below 10 cum )','water_reports',NULL,NULL,NULL,100,'SELECT acctname, volume, classification_name, year, month \nFROM  vw_water_bill ',NULL,'[[prompt:1,name:\"year\",caption:\"Year\",type:\"integer\"],[prompt:1,name:\"month\",caption:\"Month\",type:\"monthlist\"]]','SQL','DRAFT','List of Consumption (Below 10 cum )','[]',NULL,'PARAMS.objid = \"\";',NULL),('water_account_statement','View Account Statement','water_account:reports','water_bill_statement',NULL,NULL,1,'def acctEm = EM.lookup( \"vw_water_account\" );\ndef db = DB.lookup( \"water_ytd_statement\" );\ndef vwBillEm = EM.lookup( \"vw_water_bill\" );\n\ndef acct = acctEm.find( [objid: PARAMS.objid] ).first();\nacct.barcode = acct.acctno;\nacct.year = PARAMS.year;\n\n/* find the first bill for the year */\ndef fBill = vwBillEm.find( [acctid: acct.objid] ).where( [\"year = :yr\", [yr: PARAMS.year] ] ).orderBy( \"year ASC, month ASC\" ).first();\nif( !fBill ) throw new Exception(\"There is no bill yet for \" + PARAMS.year );\n\nacct.items = db.getItems( [ acctid: acct.objid, year: PARAMS.year, firstbillid: fBill.objid ]  );\ndef runbal = 0;\nacct.items.each {\n      it.discpenalty = it.surcharge + it.interest - it.discount;\n      runbal += it.amount + it.discpenalty - it.amtpaid;\n      it.runbalance =  runbal; \n\n      if( it.refbillid ) {\n            def info = vwBillEm.find( [objid:it.refbillid ] ).select(\"prevreading,reading,volume,meter.*\").first(); \n            if( info ) it.putAll( info );                  \n      }\n}\nacct.balance = runbal;\nreturn acct;',NULL,'[[prompt:1,name:\"year\",caption:\"year\",type:\"integer\"]]','SCRIPT','DEPLOYED',NULL,'[]',NULL,'PARAMS.objid = \"WTRACCT-1d048235:18c619fca17:-7fff\";\nPARAMS.year = 2023;',NULL),('water_batch_bill_printout','Water Batch Bill Printout','water_batch_bill:reports','water_bill',NULL,NULL,1,'/* PARAMS.objid = \"0002-2023-5\"; */\ndef billEm = EM.lookup( \"vw_water_bill\" );\ndef list = billEm.find( [ batchid: PARAMS.objid ] ).orderBy( \"indexno\" ).list();\n\ndef svc = SERVICE.lookup( \"WaterPaymentService\" );\nlist.each { bill->\n\n    def res = svc.getPaymentInfo( [billid: bill.objid, txndate: bill.validitydate, amtpaid: bill.balance ] );\n    bill.details = res.billitems;\n    bill.details.each {\n          it.discpenalty = it.surcharge + it.interest - it.discount;\n          it.amount = it.amount + it.discpenalty;\n    }\n\n}\nreturn list;\n',NULL,'[]','SCRIPT','DEPLOYED',NULL,'[]',NULL,NULL,NULL),('water_batch_bill_receipt','Water Batch Billing Receipt Form','water_batch_bill:reports','water_batch_bill_receipt',NULL,NULL,10,'/* PARAMS.batchid = \"0001-2023-3\" */;\ndef em = EM.lookup( \"vw_water_bill\" );\nreturn em.find( [batchid: PARAMS.batchid] ).orderBy( \"indexno ASC\" ).list();',NULL,'[]','SCRIPT','DEPLOYED',NULL,'[]',NULL,NULL,NULL),('water_billing_notice','Water Billing Notice','water_account:reports','water_billing_notice',NULL,NULL,1,'def acctEm = EM.lookup( \"vw_water_account\" );\ndef svc = SERVICE.lookup( \"WaterPaymentService\" );\ndef dateSvc = SERVICE.lookup( \"DateService\" );\n\ndef acct = acctEm.find( [objid: PARAMS.objid] ).first();\nacct.billdate = dateSvc.serverDate;\nacct.barcode = acct.acctno;\nif(!acct.lastbillid) throw new Exception(\"Account does not have a last bill\");\ndef res = svc.getPaymentInfo( [billid: acct.lastbillid, txndate: acct.billdate , amtpaid:0 ] );\n\nacct.billitems = res.billitems;\nacct.amount = acct.billitems.sum{ it.total };\nacct.hasitems =  ( acct.billitems.size() > 0 ); \nreturn acct;',NULL,'[]','SCRIPT','DEPLOYED',NULL,'[]',NULL,'PARAMS.objid = \"WTRACCT-1d048235:18c619fca17:-7fff\";',NULL),('water_billing_summary','Summary of Billing','water_reports','water_summaryofbilling',NULL,NULL,110,NULL,NULL,'[]',NULL,'DRAFT',NULL,'[]',NULL,NULL,NULL),('water_bill_printout','Water Bill Printout','water_bill:form:reports','water_bill',NULL,NULL,1,'def billEm = EM.lookup(  \'vw_water_bill\' );   \ndef bill = billEm.find( [objid: PARAMS.objid] ).first();\n\ndef svc = SERVICE.lookup( \"WaterPaymentService\" );\ndef res = svc.getPaymentInfo( [billid: bill.objid, txndate: bill.validitydate, amtpaid: bill.balance ] );\nbill.details = res.billitems;\nbill.details.each {\n      it.discpenalty = it.surcharge + it.interest - it.discount;\n      it.total = it.amount + it.discpenalty;\n}\nreturn bill;',NULL,'[]','SCRIPT','DEPLOYED',NULL,'[[key:\"visibleWhen\",value:\"#{ entity.billtype == \'RENTAL\' }\"]]',NULL,'PARAMS.objid = \"WTRBILL-46ebebae:18c6223da6b:-8000\";',NULL),('water_bill_statement','Water Bill Statement','water_bill:form:reports','water_bill_statement',NULL,NULL,10,'def billEm = DB.lookup( \"water_bill\" );\ndef db = DB.lookup( \"water_bill_statement\" );\ndef vwBillEm = EM.lookup( \"vw_water_bill\" );\n\ndef bill = billEm.findBill( [billid: PARAMS.objid] );\nif(bill.location?.text) {\n    bill.location.text = bill.location.text.replaceAll(\"\\n\", \",\");\n}\nbill.barcode = bill.acctno;\nbill.items = db.getItems( [ billid: bill.objid ]  );\ndef runbal = 0;\nbill.items.each {\n      it.discpenalty = it.surcharge + it.interest - it.discount;\n      runbal += it.amount + it.discpenalty - it.amtpaid;\n      it.runbalance =  runbal; \n\n      if( it.billyearmonth ) {\n            def info = vwBillEm.find( [acctid: bill.acctid] ).select(\"prevreading,reading,volume,meter.*\").where( \" ((year*12)+month)  = :yearmonth  \", [yearmonth: it.billyearmonth ]  ).first(); \n            if( info ) it.putAll( info );                  \n      }\n}\nbill.balance = runbal;\nreturn bill;',NULL,'[]','SCRIPT','DEPLOYED',NULL,'[]',NULL,'PARAMS.objid = \"WTRBILL-46ebebae:18c6223da6b:-8000\";',NULL),('water_connection_by_account','No. of Connections By Account Status','water_reports','water_account_connection_status',NULL,NULL,10,'def em = ACTIVEDB.lookup( \"water_connection_account_status\" );\ndef rpt = [:];\nrpt.items = em.getReport( [:] );\nreturn rpt',NULL,'[]','SCRIPT','DEPLOYED',NULL,'[]',NULL,NULL,NULL),('water_connection_by_consumption','Connections By Water Consumption','water_reports','water_connection_by_waterconsumption',NULL,NULL,110,'PARAMS.year = 2023;\nPARAMS.month = 3;\ndef em = ACTIVEDB.lookup( \"water_consumption_report\" );\ndef rpt = [:];\nrpt.items = em.getReport( [year: PARAMS.year, month: PARAMS.month] );\nreturn rpt;',NULL,'[]','SCRIPT','DRAFT',NULL,'[]',NULL,NULL,NULL),('water_connection_by_meter','No. of Connections By Meter Status','water_reports','water_meter_connection_status',NULL,NULL,101,NULL,NULL,'[]',NULL,'DRAFT',NULL,'[]',NULL,NULL,NULL),('water_delinquency_report','Delinquency List','water_reports','water_delinquency_listing',NULL,NULL,1,'def reportDb = ACTIVEDB.lookup( \"water_delinquency_report\" );\nreturn reportDb.getList(  [ year: PARAMS.year, month: PARAMS.month, unpaidmonths: 0] ); ',NULL,'[[name:\"year\",caption:\"Year\",type:\"integer\",prompt:1],[name:\"month\",caption:\"Month\",type:\"monthlist\",prompt:1]]','SCRIPT','DEPLOYED',NULL,'[]',NULL,NULL,NULL),('water_meter_reading_sheet','Meter Reading Sheet','water_billgroup:reports','water_meter_reading_sheet',NULL,NULL,1,'def year = PARAMS.year;\ndef month = PARAMS.month\ndef acctEm = EM.lookup( \"vw_water_account\" );\ndef billEm = EM.lookup( \"vw_water_bill\" );\ndef acctList = acctEm.find( [billgroupid: PARAMS.objid ]  ).orderBy(\"indexno\").list();\n\ndef ym = ((year*12)+month);\ndef m1 = billEm.find( [billgroupid: PARAMS.objid ]).where(  \"(year*12)+month = :ym\", [ym: ym ]  ).select(\"acctid,reading\").list();\ndef m2 = billEm.find( [billgroupid: PARAMS.objid ]).where(  \"(year*12)+month = :ym\", [ym: ym + 1 ]  ).select(\"acctid,reading\").list();\ndef m3 = billEm.find( [billgroupid: PARAMS.objid ]).where(  \"(year*12)+month = :ym\", [ym: ym + 2 ]  ).select(\"acctid,reading\").list();\ndef m4 = billEm.find( [billgroupid: PARAMS.objid ]).where(  \"(year*12)+month = :ym\", [ym: ym + 3 ]  ).select(\"acctid,reading\").list();\n\nacctList.each { acct->\n     acct.year = PARAMS.year;\n     acct.month = PARAMS.month;\n     acct.reading1 = m1.find{ it.acctid == acct.objid }?.reading;\n     acct.reading2 = m2.find{ it.acctid == acct.objid }?.reading;\n     acct.reading3 = m3.find{ it.acctid == acct.objid }?.reading;\n     acct.reading4 = m4.find{ it.acctid == acct.objid }?.reading;\n}\n\nreturn acctList;\n  ',NULL,'[[prompt:1,name:\"year\",caption:\"Year\",type:\"integer\"],[prompt:1,name:\"month\",caption:\"Month\",type:\"monthlist\"]]','SCRIPT','DEPLOYED',NULL,'[]',NULL,'PARAMS.objid = \'0028\'; ',NULL),('water_new_accounts','List of New Accounts','water_reports','water_new_account_list',NULL,NULL,102,NULL,NULL,'[]',NULL,'DRAFT',NULL,'[]',NULL,NULL,NULL),('water_ytd_statement','View YTD Statement','water_account:reports',NULL,NULL,NULL,3,NULL,NULL,'[]',NULL,'DRAFT',NULL,'[]',NULL,NULL,NULL);
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
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `fk_sys_report_def_template_parentid` (`parentid`) USING BTREE,
  CONSTRAINT `fk_sys_report_def_template_parentid` FOREIGN KEY (`parentid`) REFERENCES `sys_report_def` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_report_output_template`
--

LOCK TABLES `sys_report_output_template` WRITE;
/*!40000 ALTER TABLE `sys_report_output_template` DISABLE KEYS */;
INSERT INTO `sys_report_output_template` VALUES ('water_batch_bill_printout:textprint','water_batch_bill_printout','textprint','${it.billno} ${it.reading}\n\n${it.amount}','[:]','Water Batch Bill Text Print',0);
/*!40000 ALTER TABLE `sys_report_output_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_report_subreport_def`
--

DROP TABLE IF EXISTS `sys_report_subreport_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_report_subreport_def` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `reportid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `querytype` varchar(50) DEFAULT NULL,
  `statement` mediumtext,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `fk_sys_report_subreport_def_reportid` (`reportid`) USING BTREE,
  CONSTRAINT `fk_sys_report_subreport_def_reportid` FOREIGN KEY (`reportid`) REFERENCES `sys_report_def` (`name`)
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
  PRIMARY KEY (`name`) USING BTREE,
  UNIQUE KEY `uix_sys_report_template_filepath` (`filepath`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_report_template`
--

LOCK TABLES `sys_report_template` WRITE;
/*!40000 ALTER TABLE `sys_report_template` DISABLE KEYS */;
INSERT INTO `sys_report_template` VALUES ('blank','Blank Report','/master-templates/blank.jrxml',1,NULL),('master1','Master Template','/master-templates/collection/standard/master.jrxml',1,NULL),('test_report','Test Report','test/test_report.jasper',0,NULL),('water_account_connection_status','Water Account Connection Status','reports/account_connection_status.jasper',0,NULL),('water_batch_bill_receipt','Water Batch Bill Receipt Form','billing/water_batch_bill_receipt.jasper',0,NULL),('water_bill','Water Bill Printout','billing/water_bill.jasper',0,NULL),('water_billing_notice','Water Billing Notice','billing/water_billing_notice.jasper',0,NULL),('water_bill_statement','Water Bill Statement','billing/water_bill_statement.jasper',0,NULL),('water_connection_by_waterconsumption','Water Connection By Water Consumption','reports/connection_by_waterconsumption.jasper',0,NULL),('water_delinquency_listing','Water Delinquency Listing','reports/delinquency_report.jasper',0,NULL),('water_meter_connection_status','Water Connection By Meter Status','reports/meter_connection_status.jasper',0,NULL),('water_meter_reading_sheet','Water Meter Reading Sheet','billing/water_meter_reading_sheet.jasper',0,NULL),('water_new_account_list','Water New Account List','reports/new_account_list.jasper',0,NULL),('water_summaryofbilling','Summary of Billing','reports/summaryofbilling.jasper',0,NULL);
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
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES ('ACCOUNT_MANAGER','ACCOUNT MANAGER',0),('ADMIN','WATER ADMIN',NULL),('APPROVER','APPROVER',0),('BILLER','WATER BILLER',NULL),('DATA_ENTRY_CLERK','DATA ENTRY CLERK',0),('MASTER','WATER MASTER',NULL),('PAYMENT_PROCESSOR','PAYMENT PROCESSOR',0),('PROCESSOR','WATER PROCESSOR',NULL),('READER','WATER READER',NULL),('REPORT_EDITOR','REPORT EDITOR',0),('RULE_AUTHOR','WATER RULE AUTHOR',NULL),('TEST','TEST',0),('WF_EDITOR','WATER WF EDITOR',NULL);
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
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `fk_sys_role_permission_role` (`role`) USING BTREE,
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
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `rulegroup` (`rulegroup`,`ruleset`) USING BTREE,
  KEY `ruleset` (`ruleset`) USING BTREE,
  CONSTRAINT `sys_rule_ibfk_1` FOREIGN KEY (`rulegroup`, `ruleset`) REFERENCES `sys_rulegroup` (`name`, `ruleset`),
  CONSTRAINT `sys_rule_ibfk_2` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule`
--

LOCK TABLES `sys_rule` WRITE;
/*!40000 ALTER TABLE `sys_rule` DISABLE KEYS */;
INSERT INTO `sys_rule` VALUES ('RUL-21685239:17b6cdabf45:-7520','APPROVED','REMOVE_NON_AMOUNT','waterbilling','summary','Remove Bill Items with zero amount',NULL,50000,NULL,NULL,'2021-08-22 16:05:57','USR-ADMIN','ADMIN',1),('RUL-22e7de62:18c619db161:-782b','APPROVED','WATER_BILL_BASIC_RATE','waterconsumption','compute-rate','WATER BILL BASIC RATE',NULL,50000,NULL,NULL,'2023-12-13 14:08:52','USR-ADMIN','ADMIN',1),('RUL-2524933:189520f3f6b:-7ce4','APPROVED','NEW_INSTALLATION_FEE','waterbilling','compute-txn-fees','compute new installation fee',NULL,50000,NULL,NULL,'2023-07-14 10:23:13','USR-1b82c604:14cc29913bb:-7fec','ADMIN',1),('RUL-346b1972:18acb117570:-7c56','DEPLOYED','ADD_WATER_BILL','waterbilling','compute-fees','Post water bill',NULL,50000,NULL,NULL,'2023-09-25 14:50:46','USR-6969defc:157f79cdab6:-7fe8','AFIEL',1),('RUL-5a798cf1:18e5a35a0b4:-7a3b','DEPLOYED','WATER_INDUSTRIAL_RATE','waterconsumption','compute-rate','Industrial Rate',NULL,50000,NULL,NULL,'2024-03-20 13:18:31','USR-7c0d9317:18e5a31b423:-7d26','WATER',1),('RUL-5bdd949d:1851f0d205d:-7643','DEPLOYED','MAP_CREDIT_BILLITEM','waterpayment','map-account','MAP ADVANCE PAYMENT',NULL,10000,NULL,NULL,'2022-12-18 01:40:27','USR-1b82c604:14cc29913bb:-7fec','ADMIN',1),('RUL-62d5b87:18cd865ce1a:-6280','DEPLOYED','WATER_COMMERCIAL_RATE','waterconsumption','compute-rate','Commercial Rate',NULL,50000,NULL,NULL,'2024-01-05 08:14:21','USR-ADMIN','ADMIN',1),('RUL-62d5b87:18cd865ce1a:-6750','DEPLOYED','WATER_RESIDENTIAL_RATE','waterconsumption','compute-rate','Residential Rate',NULL,50000,NULL,NULL,'2024-01-05 08:03:42','USR-ADMIN','ADMIN',1),('RUL-62d5b87:18cd865ce1a:-7bbc','DEPLOYED','S1','waterbillingschedule','initial','Schedule 1',NULL,50000,NULL,NULL,'2024-01-05 07:17:55','USR-ADMIN','ADMIN',1),('RUL-689492a6:18c60ee947f:-5dfa','DEPLOYED','APPLY_EXCESS_PAYMENT','waterpayment','after-payment','APPLY_EXCESS_PAYMENT',NULL,50000,NULL,NULL,'2023-12-13 11:38:15','USR-ADMIN','ADMIN',1),('RUL-689492a6:18c60ee947f:-6d73','APPROVED','WATER_BILL_PENALTY_PREVIOUS','waterbilling','compute-surcharge','PENTLY FOR CAPTURED PREVIOUS ENTRIES',NULL,50000,NULL,NULL,'2023-12-13 11:30:17','USR-ADMIN','ADMIN',1),('RUL-689492a6:18c60ee947f:-71e6','APPROVED','WATER_PENALTY','waterbilling','compute-surcharge','WATER PENALTY',NULL,50000,NULL,NULL,'2023-12-13 11:25:22','USR-ADMIN','ADMIN',1),('RUL-689492a6:18c60ee947f:-7603','DEPLOYED','C3','waterbillingschedule','initial','Schedule for C3',NULL,50000,NULL,NULL,'2023-12-13 11:08:58','USR-ADMIN','ADMIN',1),('RUL-689492a6:18c60ee947f:-7614','DEPLOYED','C2','waterbillingschedule','initial','Schedule for C2',NULL,50000,NULL,NULL,'2023-12-13 11:08:47','USR-ADMIN','ADMIN',1),('RUL-689492a6:18c60ee947f:-793f','DEPLOYED','C4','waterbillingschedule','initial','Schedule for C4',NULL,50000,NULL,NULL,'2023-12-13 11:00:52','USR-ADMIN','ADMIN',1),('RUL-689492a6:18c60ee947f:-7d9b','DEPLOYED','C1','waterbillingschedule','initial','Schedule for C1',NULL,50000,NULL,NULL,'2023-12-13 10:44:54','USR-ADMIN','ADMIN',1),('RUL-72f22338:18521353cbd:-7e32','DEPLOYED','APPLY_BILLITEM_PAYMENT','waterpayment','apply-payment','APPLY BILLITEM PAYMENT',NULL,100000,NULL,NULL,'2022-12-18 01:55:30','USR-1b82c604:14cc29913bb:-7fec','ADMIN',0),('RUL1fe7cfee:18869517acb:-786e','APPROVED','RECONNECTION_FEE','waterbilling','compute-txn-fees','compute reconnection fee',NULL,50000,NULL,NULL,'2023-05-30 05:25:51','USR-1b82c604:14cc29913bb:-7fec','ADMIN',1),('RUL228733b9:18869839124:-700b','APPROVED','RECONNECTION_DOWNPAYMENT','waterbilling','compute-txn-fees','compute downpayment',NULL,50000,NULL,NULL,'2023-05-30 06:21:54','USR-1b82c604:14cc29913bb:-7fec','ADMIN',1),('RUL287770ca:1895d0dd958:-7d6d','APPROVED','INSTALLMENT_DOWNPAYMENT','waterbilling','compute-txn-fees','installment downpayment',NULL,50000,NULL,NULL,'2023-07-16 12:58:56','USR-1b82c604:14cc29913bb:-7fec','ADMIN',1),('RUL2a0555f7:18cecb153f1:-6cd8','DEPLOYED','SURCHARGE_FOR_PREVIOUS','waterbilling','compute-surcharge','SURCHARGE FOR PREVIOUS',NULL,50000,NULL,NULL,'2024-01-09 05:49:33','USR-ADMIN','ADMIN',1),('RUL4e803530:1887047c12e:-7e68','APPROVED','ADD_PAYMENT_PLAN_RECONNECTION','waterbilling','initial','Add Payment Plan for reconnection dues',NULL,50000,NULL,NULL,'2023-05-31 13:31:23','USR-1b82c604:14cc29913bb:-7fec','ADMIN',1),('RUL61e00012:187074846ff:-6223','APPROVED','SET_READING_DUEDATE','waterbillingschedule','set-schedule','Set Reading Due Date',NULL,40000,NULL,NULL,'2023-03-22 11:39:45','USR-1b82c604:14cc29913bb:-7fec','ADMIN',1),('RUL61e00012:187074846ff:-65a0','APPROVED','SET_READING_DATE','waterbillingschedule','set-schedule','Set Reading Date',NULL,50000,NULL,NULL,'2023-03-22 11:37:23','USR-1b82c604:14cc29913bb:-7fec','ADMIN',1),('RUL61e00012:187074846ff:-6dcb','APPROVED','SET_FROM_TO_PERIOD','waterbillingschedule','set-schedule','Set Billing Schedule From To Period',NULL,100000,NULL,NULL,'2023-03-22 11:28:25','USR-1b82c604:14cc29913bb:-7fec','ADMIN',1),('RUL634529e7:188e6b97ac9:-7aac','APPROVED','RECONNECTION_FEE_WITH_BILL','waterbilling','compute-txn-fees','compute reconnection fee with bill. Reconnection fee will be calclated based on the no. of months since last bill',NULL,50000,NULL,NULL,'2023-06-23 14:25:42','USR-1b82c604:14cc29913bb:-7fec','ADMIN',1),('RUL66638ced:1889f25c026:-7dc0','APPROVED','SET_BILLING_DATE','waterbillingschedule','set-schedule','Set Billing Date',NULL,30000,NULL,NULL,'2023-06-09 19:04:09','USR-1b82c604:14cc29913bb:-7fec','ADMIN',1),('RUL7834f671:18b2e3ebb80:-6c69','DEPLOYED','MAP_SURCHARGE_PREVIOUS','waterpayment','map-account','MAP SURCHARGE PREVIOUS',NULL,25000,NULL,NULL,'2023-10-14 21:16:00','USR-6969defc:157f79cdab6:-7fe8','AFIEL',1),('RUL7834f671:18b2e3ebb80:-73bc','DEPLOYED','MAP_SURCHARGE_CURRENT','waterpayment','map-account','MAP SURCHARGE',NULL,24000,NULL,NULL,'2023-10-14 21:11:24','USR-6969defc:157f79cdab6:-7fe8','AFIEL',1),('RUL7834f671:18b2e3ebb80:-76fb','DEPLOYED','MAP_WATER_BILL_PREVIOUS','waterpayment','map-account','MAP WATER FEE PREVIOUS',NULL,50000,NULL,NULL,'2023-10-14 21:08:43','USR-6969defc:157f79cdab6:-7fe8','AFIEL',1),('RUL7834f671:18b2e3ebb80:-7d64','DEPLOYED','MAP_WATER_BILL_CURRENT','waterpayment','map-account','MAP WATER FEE CURRENT',NULL,40000,NULL,NULL,'2023-10-14 21:02:41','USR-6969defc:157f79cdab6:-7fe8','AFIEL',1),('RUL7b73bf4:1850ee0fd3b:-7eed','DEPLOYED','SET_VALIDITY_DATE','waterbilling','summary','set validity date',NULL,50000,NULL,NULL,'2022-12-14 12:29:05','USR-1b82c604:14cc29913bb:-7fec','ADMIN',1),('RULc8dbf18:1870773e513:-75af','APPROVED','SET_DUEDATE','waterbillingschedule','set-schedule','Set Due Date',NULL,10000,NULL,NULL,'2023-03-22 12:34:42','USR-1b82c604:14cc29913bb:-7fec','ADMIN',1),('RULc8dbf18:1870773e513:-7a3e','APPROVED','SET_DISCDATE','waterbillingschedule','set-schedule','Set Discount Date',NULL,20000,NULL,NULL,'2023-03-22 12:25:29','USR-1b82c604:14cc29913bb:-7fec','ADMIN',1),('RULfb67ce3:18a5ef5cb85:-7a6f','APPROVED','WATERFEE_RESIDENTIAL_AND_GOVERNMENT_ZERO_OR_LESS','waterconsumption','compute-rate','water fee for residential and government for volume zero or less',NULL,50000,NULL,NULL,'2023-09-04 15:46:15','USR-6969defc:157f79cdab6:-7fe8','AFIEL',1),('RULfb67ce3:18a5ef5cb85:-7ad4','APPROVED','WATERFEE_RESIDENTIAL_AND_GOVERNMENT','waterconsumption','compute-rate','water fee for residential and government',NULL,50000,NULL,NULL,'2023-09-04 15:43:22','USR-6969defc:157f79cdab6:-7fe8','AFIEL',1),('RULfb67ce3:18a5ef5cb85:-7baf','APPROVED','WATERFEE_COMMERCIAL','waterconsumption','compute-rate','water fee for commercial',NULL,50000,NULL,NULL,'2023-09-04 15:29:58','USR-6969defc:157f79cdab6:-7fe8','AFIEL',1),('RULfb67ce3:18a5ef5cb85:-7bce','APPROVED','WATERFEE_COMMERCIAL_ZERO_OR_LESS','waterconsumption','compute-rate','water fee for commercial for volume zero or less',NULL,50000,NULL,NULL,'2023-09-04 15:29:31','USR-6969defc:157f79cdab6:-7fe8','AFIEL',1);
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
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `parentid` (`parentid`) USING BTREE,
  KEY `sys_rule_action_actiondef` (`actiondef_objid`) USING BTREE,
  CONSTRAINT `sys_rule_action_actiondef` FOREIGN KEY (`actiondef_objid`) REFERENCES `sys_rule_actiondef` (`objid`),
  CONSTRAINT `sys_rule_action_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_action`
--

LOCK TABLES `sys_rule_action` WRITE;
/*!40000 ALTER TABLE `sys_rule_action` DISABLE KEYS */;
INSERT INTO `sys_rule_action` VALUES ('RA-3573de3e:18b2d22ab69:-7fb2','RUL7834f671:18b2e3ebb80:-6c69','treasury.actions.AddCashReceiptItem','add-cashreceipt-item',0),('RA-3573de3e:18b2d22ab69:-7fc2','RUL7834f671:18b2e3ebb80:-73bc','treasury.actions.AddCashReceiptItem','add-cashreceipt-item',0),('RA-3573de3e:18b2d22ab69:-7fce','RUL7834f671:18b2e3ebb80:-76fb','treasury.actions.AddCashReceiptItem','add-cashreceipt-item',0),('RA-3573de3e:18b2d22ab69:-7fe1','RUL7834f671:18b2e3ebb80:-7d64','treasury.actions.AddCashReceiptItem','add-cashreceipt-item',0),('RA-50939045:18c60fd7aab:-7fb5','RUL-689492a6:18c60ee947f:-5dfa','treasury.actions.AddCreditBillItem','add-credit-billitem',0),('RA-50939045:18c60fd7aab:-7fbe','RUL-689492a6:18c60ee947f:-71e6','treasury.actions.AddSurchargeItem','add-surcharge-item',0),('RA-50939045:18c60fd7aab:-7fd3','RUL-689492a6:18c60ee947f:-7603','water.actions.SetWaterBillSchedule','set-water-bill-schedule',0),('RA-50939045:18c60fd7aab:-7fe0','RUL-689492a6:18c60ee947f:-7614','water.actions.SetWaterBillSchedule','set-water-bill-schedule',0),('RA-50939045:18c60fd7aab:-7fed','RUL-689492a6:18c60ee947f:-793f','water.actions.SetWaterBillSchedule','set-water-bill-schedule',0),('RA-50939045:18c60fd7aab:-7ffa','RUL-689492a6:18c60ee947f:-7d9b','water.actions.SetWaterBillSchedule','set-water-bill-schedule',0),('RA2a849d8a:18aca9676a8:-7ff7','RUL-346b1972:18acb117570:-7c56','water.actions.AddWaterBillItem','add-water-billitem',0),('RA5118db67:1851f22bb8d:-7ff2','RUL-5bdd949d:1851f0d205d:-7643','treasury.actions.AddCashReceiptItem','add-cashreceipt-item',0),('RA53bee69f:188e6ecc2a9:-7ff5','RUL634529e7:188e6b97ac9:-7aac','treasury.actions.AddBillItem','add-billitem',0),('RA5be77a81:18e5a358870:-7fef','RUL-5a798cf1:18e5a35a0b4:-7a3b','water.actions.ComputeBillRate','compute-bill-rate',0),('RA5cff48f4:18a5f16cf2a:-7fdb','RULfb67ce3:18a5ef5cb85:-7a6f','water.actions.ComputeBillRate','compute-bill-rate',0),('RA5cff48f4:18a5f16cf2a:-7fe3','RULfb67ce3:18a5ef5cb85:-7ad4','water.actions.ComputeBillRate','compute-bill-rate',0),('RA5cff48f4:18a5f16cf2a:-7feb','RULfb67ce3:18a5ef5cb85:-7baf','water.actions.ComputeBillRate','compute-bill-rate',0),('RA5cff48f4:18a5f16cf2a:-7ff3','RULfb67ce3:18a5ef5cb85:-7bce','water.actions.ComputeBillRate','compute-bill-rate',0),('RA65270b36:1895d10e6f2:-7ffc','RUL287770ca:1895d0dd958:-7d6d','treasury.actions.AddBillItem','add-billitem',0),('RA690c2690:1889fd3fa0e:-7ffd','RUL66638ced:1889f25c026:-7dc0','water.actions.SetWaterBillSchedule','set-water-bill-schedule',0),('RAcce69e1:1886997296a:-7ff6','RUL228733b9:18869839124:-700b','treasury.actions.AddBillItem','add-billitem',0),('RACT-21685239:17b6cdabf45:-7404','RUL-21685239:17b6cdabf45:-7520','treasury.actions.RemoveBillItem','remove-billitem',0),('RACT-22e7de62:18c619db161:-7700','RUL-22e7de62:18c619db161:-782b','water.actions.ComputeBillRate','compute-bill-rate',0),('RACT-2524933:189520f3f6b:-7b68','RUL-2524933:189520f3f6b:-7ce4','treasury.actions.AddBillItem','add-billitem',0),('RACT-39cfbe4a:188696e0369:-7c6e','RUL1fe7cfee:18869517acb:-786e','treasury.actions.AddBillItem','add-billitem',0),('RACT-5a798cf1:18e5a35a0b4:-7baf','RUL-62d5b87:18cd865ce1a:-6280','water.actions.ComputeBillRate','compute-bill-rate',0),('RACT-62d5b87:18cd865ce1a:-65be','RUL-62d5b87:18cd865ce1a:-6750','water.actions.ComputeBillRate','compute-bill-rate',0),('RACT-62d5b87:18cd865ce1a:-794e','RUL-62d5b87:18cd865ce1a:-7bbc','water.actions.SetWaterBillSchedule','set-water-bill-schedule',0),('RACT-689492a6:18c60ee947f:-6156','RUL-689492a6:18c60ee947f:-6d73','treasury.actions.AddSurchargeItem','add-surcharge-item',0),('RACT-72f22338:18521353cbd:-7269','RUL-72f22338:18521353cbd:-7e32','treasury.actions.ApplyBillItemPayment','apply-billitem-payment',0),('RACT2a0555f7:18cecb153f1:-630a','RUL2a0555f7:18cecb153f1:-6cd8','treasury.actions.AddSurchargeItem','add-surcharge-item',0),('RACT4e803530:1887047c12e:-7a18','RUL4e803530:1887047c12e:-7e68','water.actions.AddWaterBillItem','add-water-billitem',0),('RACT61e00012:187074846ff:-612e','RUL61e00012:187074846ff:-6223','water.actions.SetWaterBillSchedule','set-water-bill-schedule',0),('RACT61e00012:187074846ff:-62f1','RUL61e00012:187074846ff:-65a0','water.actions.SetWaterBillSchedule','set-water-bill-schedule',0),('RACT61e00012:187074846ff:-6b5d','RUL61e00012:187074846ff:-6dcb','water.actions.SetWaterBillSchedule','set-water-bill-schedule',0),('RACT7b73bf4:1850ee0fd3b:-7b28','RUL7b73bf4:1850ee0fd3b:-7eed','treasury.actions.SetBillValidityDate','set-bill-validity-date',0),('RACTc8dbf18:1870773e513:-73f2','RULc8dbf18:1870773e513:-75af','water.actions.SetWaterBillSchedule','set-water-bill-schedule',0),('RACTc8dbf18:1870773e513:-7907','RULc8dbf18:1870773e513:-7a3e','water.actions.SetWaterBillSchedule','set-water-bill-schedule',0);
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
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `parentid` (`parentid`) USING BTREE,
  KEY `sys_rule_action_param_actiondefparam` (`actiondefparam_objid`) USING BTREE,
  KEY `var_objid` (`var_objid`) USING BTREE,
  CONSTRAINT `sys_rule_action_param_actiondefparam` FOREIGN KEY (`actiondefparam_objid`) REFERENCES `sys_rule_actiondef_param` (`objid`),
  CONSTRAINT `sys_rule_action_param_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_action` (`objid`),
  CONSTRAINT `sys_rule_action_param_ibfk_2` FOREIGN KEY (`var_objid`) REFERENCES `sys_rule_condition_var` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_action_param`
--

LOCK TABLES `sys_rule_action_param` WRITE;
/*!40000 ALTER TABLE `sys_rule_action_param` DISABLE KEYS */;
INSERT INTO `sys_rule_action_param` VALUES ('RAP-3573de3e:18b2d22ab69:-7fad','RA-3573de3e:18b2d22ab69:-7fb2','treasury.actions.AddCashReceiptItem.billcode',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WATER_PENALTY','WATER PENALTY',NULL,NULL,NULL),('RAP-3573de3e:18b2d22ab69:-7fae','RA-3573de3e:18b2d22ab69:-7fb2','treasury.actions.AddCashReceiptItem.groupid',NULL,NULL,NULL,NULL,'\'WATER_PENALTY\'','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-3573de3e:18b2d22ab69:-7faf','RA-3573de3e:18b2d22ab69:-7fb2','treasury.actions.AddCashReceiptItem.amount',NULL,NULL,NULL,NULL,'AMT','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-3573de3e:18b2d22ab69:-7fb0','RA-3573de3e:18b2d22ab69:-7fb2','treasury.actions.AddCashReceiptItem.billitem',NULL,NULL,'RC-3573de3e:18b2d22ab69:-7fbd','SURCHG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP-3573de3e:18b2d22ab69:-7fb1','RA-3573de3e:18b2d22ab69:-7fb2','treasury.actions.AddCashReceiptItem.sortorder',NULL,NULL,NULL,NULL,'100000','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-3573de3e:18b2d22ab69:-7fbe','RA-3573de3e:18b2d22ab69:-7fc2','treasury.actions.AddCashReceiptItem.sortorder',NULL,NULL,NULL,NULL,'100000','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-3573de3e:18b2d22ab69:-7fbf','RA-3573de3e:18b2d22ab69:-7fc2','treasury.actions.AddCashReceiptItem.billitem',NULL,NULL,'RC-3573de3e:18b2d22ab69:-7fc4','SURCHG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP-3573de3e:18b2d22ab69:-7fc0','RA-3573de3e:18b2d22ab69:-7fc2','treasury.actions.AddCashReceiptItem.amount',NULL,NULL,NULL,NULL,'AMT','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-3573de3e:18b2d22ab69:-7fc1','RA-3573de3e:18b2d22ab69:-7fc2','treasury.actions.AddCashReceiptItem.groupid',NULL,NULL,NULL,NULL,'\'WATER_PENALTY\'','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-3573de3e:18b2d22ab69:-7fc8','RA-3573de3e:18b2d22ab69:-7fce','treasury.actions.AddCashReceiptItem.billcode',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WATER_BILL','WATER BILL',NULL,NULL,NULL),('RAP-3573de3e:18b2d22ab69:-7fc9','RA-3573de3e:18b2d22ab69:-7fce','treasury.actions.AddCashReceiptItem.amount',NULL,NULL,NULL,NULL,'AMT ','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-3573de3e:18b2d22ab69:-7fca','RA-3573de3e:18b2d22ab69:-7fce','treasury.actions.AddCashReceiptItem.groupid',NULL,NULL,NULL,NULL,'\'WATER_BILL\'','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-3573de3e:18b2d22ab69:-7fcc','RA-3573de3e:18b2d22ab69:-7fce','treasury.actions.AddCashReceiptItem.sortorder',NULL,NULL,NULL,NULL,'BYM','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-3573de3e:18b2d22ab69:-7fcd','RA-3573de3e:18b2d22ab69:-7fce','treasury.actions.AddCashReceiptItem.billitem',NULL,NULL,'RC-3573de3e:18b2d22ab69:-7fd9','BILLITEM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP-3573de3e:18b2d22ab69:-7fdc','RA-3573de3e:18b2d22ab69:-7fe1','treasury.actions.AddCashReceiptItem.billitem',NULL,NULL,'RC-3573de3e:18b2d22ab69:-7fe8','BILLITEM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP-3573de3e:18b2d22ab69:-7fdd','RA-3573de3e:18b2d22ab69:-7fe1','treasury.actions.AddCashReceiptItem.sortorder',NULL,NULL,NULL,NULL,'BYM','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-3573de3e:18b2d22ab69:-7fdf','RA-3573de3e:18b2d22ab69:-7fe1','treasury.actions.AddCashReceiptItem.groupid',NULL,NULL,NULL,NULL,'\'WATER_BILL\'','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-3573de3e:18b2d22ab69:-7fe0','RA-3573de3e:18b2d22ab69:-7fe1','treasury.actions.AddCashReceiptItem.amount',NULL,NULL,NULL,NULL,'AMT + DISC','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-50939045:18c60fd7aab:-7fb2','RA-50939045:18c60fd7aab:-7fb5','treasury.actions.AddCreditBillItem.account',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WATER_BILL_ADVANCE','WATER BILL ADVANCE PAYMENT',NULL,NULL,NULL),('RAP-50939045:18c60fd7aab:-7fb3','RA-50939045:18c60fd7aab:-7fb5','treasury.actions.AddCreditBillItem.amount',NULL,NULL,NULL,NULL,'AMT','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-50939045:18c60fd7aab:-7fb4','RA-50939045:18c60fd7aab:-7fb5','treasury.actions.AddCreditBillItem.payment',NULL,NULL,'RC-50939045:18c60fd7aab:-7fb9','PMT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP-50939045:18c60fd7aab:-7fba','RA-50939045:18c60fd7aab:-7fbe','treasury.actions.AddSurchargeItem.billitem',NULL,NULL,'RC-50939045:18c60fd7aab:-7fc5','BILLITEM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP-50939045:18c60fd7aab:-7fbb','RA-50939045:18c60fd7aab:-7fbe','treasury.actions.AddSurchargeItem.account',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WATER_PENALTY','WATER PENALTY',NULL,NULL,NULL),('RAP-50939045:18c60fd7aab:-7fbc','RA-50939045:18c60fd7aab:-7fbe','treasury.actions.AddSurchargeItem.amount',NULL,NULL,NULL,NULL,'AMT * 0.10','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-50939045:18c60fd7aab:-7fbd','RA-50939045:18c60fd7aab:-7fbe','treasury.actions.AddSurchargeItem.billdate',NULL,NULL,NULL,NULL,'@DAYADD( DUEDATE , 1 )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-50939045:18c60fd7aab:-7fcc','RA-50939045:18c60fd7aab:-7fd3','water.actions.SetWaterBillSchedule.expirydate',NULL,NULL,NULL,NULL,'@MONTHADD( @DATE( YR , MON , 17 ), 1 )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-50939045:18c60fd7aab:-7fcd','RA-50939045:18c60fd7aab:-7fd3','water.actions.SetWaterBillSchedule.duedate',NULL,NULL,NULL,NULL,'@FINDNEXTWORKDAY( @DATE( YR , MON, 26  ), HOLIDAYS, 1 )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-50939045:18c60fd7aab:-7fce','RA-50939045:18c60fd7aab:-7fd3','water.actions.SetWaterBillSchedule.billdate',NULL,NULL,NULL,NULL,'@DATE( YR , MON ,  20 )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-50939045:18c60fd7aab:-7fcf','RA-50939045:18c60fd7aab:-7fd3','water.actions.SetWaterBillSchedule.readingdate',NULL,NULL,NULL,NULL,' @DATE( YR , MON, 18 )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-50939045:18c60fd7aab:-7fd0','RA-50939045:18c60fd7aab:-7fd3','water.actions.SetWaterBillSchedule.todate',NULL,NULL,NULL,NULL,'@DATE( YR ,MON, 18  )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-50939045:18c60fd7aab:-7fd1','RA-50939045:18c60fd7aab:-7fd3','water.actions.SetWaterBillSchedule.fromdate',NULL,NULL,NULL,NULL,'@MONTHADD( @DATE( YR , MON , 17 ) , -1  )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-50939045:18c60fd7aab:-7fd2','RA-50939045:18c60fd7aab:-7fd3','water.actions.SetWaterBillSchedule.billschedule',NULL,NULL,'RC-50939045:18c60fd7aab:-7fd7','WBS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP-50939045:18c60fd7aab:-7fd9','RA-50939045:18c60fd7aab:-7fe0','water.actions.SetWaterBillSchedule.expirydate',NULL,NULL,NULL,NULL,'@MONTHADD( @DATE( YR , MON , 13 ), 1 )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-50939045:18c60fd7aab:-7fda','RA-50939045:18c60fd7aab:-7fe0','water.actions.SetWaterBillSchedule.duedate',NULL,NULL,NULL,NULL,'@FINDNEXTWORKDAY( @DATE( YR , MON, 22 ), HOLIDAYS, 1 )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-50939045:18c60fd7aab:-7fdb','RA-50939045:18c60fd7aab:-7fe0','water.actions.SetWaterBillSchedule.billdate',NULL,NULL,NULL,NULL,'@DATE( YR , MON ,  16 )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-50939045:18c60fd7aab:-7fdc','RA-50939045:18c60fd7aab:-7fe0','water.actions.SetWaterBillSchedule.readingdate',NULL,NULL,NULL,NULL,' @DATE( YR , MON, 14 )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-50939045:18c60fd7aab:-7fdd','RA-50939045:18c60fd7aab:-7fe0','water.actions.SetWaterBillSchedule.todate',NULL,NULL,NULL,NULL,'@DATE( YR ,MON, 14  )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-50939045:18c60fd7aab:-7fde','RA-50939045:18c60fd7aab:-7fe0','water.actions.SetWaterBillSchedule.fromdate',NULL,NULL,NULL,NULL,'@MONTHADD( @DATE( YR , MON , 13 ) , -1  )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-50939045:18c60fd7aab:-7fdf','RA-50939045:18c60fd7aab:-7fe0','water.actions.SetWaterBillSchedule.billschedule',NULL,NULL,'RC-50939045:18c60fd7aab:-7fe4','WBS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP-50939045:18c60fd7aab:-7fe6','RA-50939045:18c60fd7aab:-7fed','water.actions.SetWaterBillSchedule.expirydate',NULL,NULL,NULL,NULL,'@MONTHADD( @DATE( YR , MON , 21 ), 1 )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-50939045:18c60fd7aab:-7fe7','RA-50939045:18c60fd7aab:-7fed','water.actions.SetWaterBillSchedule.duedate',NULL,NULL,NULL,NULL,'@FINDNEXTWORKDAY(  @MONTHEND(  @DATE( YR , MON, 1 )), HOLIDAYS, 1 )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-50939045:18c60fd7aab:-7fe8','RA-50939045:18c60fd7aab:-7fed','water.actions.SetWaterBillSchedule.billdate',NULL,NULL,NULL,NULL,'@DATE( YR , MON , 24  )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-50939045:18c60fd7aab:-7fe9','RA-50939045:18c60fd7aab:-7fed','water.actions.SetWaterBillSchedule.readingdate',NULL,NULL,NULL,NULL,' @DATE( YR , MON, 22 )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-50939045:18c60fd7aab:-7fea','RA-50939045:18c60fd7aab:-7fed','water.actions.SetWaterBillSchedule.todate',NULL,NULL,NULL,NULL,'@DATE( YR ,MON, 22  )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-50939045:18c60fd7aab:-7feb','RA-50939045:18c60fd7aab:-7fed','water.actions.SetWaterBillSchedule.fromdate',NULL,NULL,NULL,NULL,'@MONTHADD( @DATE( YR , MON , 21 ) , -1  )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-50939045:18c60fd7aab:-7fec','RA-50939045:18c60fd7aab:-7fed','water.actions.SetWaterBillSchedule.billschedule',NULL,NULL,'RC-50939045:18c60fd7aab:-7ff1','WBS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP-50939045:18c60fd7aab:-7ff3','RA-50939045:18c60fd7aab:-7ffa','water.actions.SetWaterBillSchedule.billschedule',NULL,NULL,'RC-50939045:18c60fd7aab:-7fff','WBS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP-50939045:18c60fd7aab:-7ff4','RA-50939045:18c60fd7aab:-7ffa','water.actions.SetWaterBillSchedule.fromdate',NULL,NULL,NULL,NULL,'@MONTHADD( @DATE( YR , MON , 9 ) , -1  )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-50939045:18c60fd7aab:-7ff5','RA-50939045:18c60fd7aab:-7ffa','water.actions.SetWaterBillSchedule.todate',NULL,NULL,NULL,NULL,'@DATE( YR ,MON, 10  )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-50939045:18c60fd7aab:-7ff6','RA-50939045:18c60fd7aab:-7ffa','water.actions.SetWaterBillSchedule.readingdate',NULL,NULL,NULL,NULL,' @DATE( YR , MON, 10 )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-50939045:18c60fd7aab:-7ff7','RA-50939045:18c60fd7aab:-7ffa','water.actions.SetWaterBillSchedule.billdate',NULL,NULL,NULL,NULL,'@DATE( YR , MON ,  12 )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-50939045:18c60fd7aab:-7ff8','RA-50939045:18c60fd7aab:-7ffa','water.actions.SetWaterBillSchedule.duedate',NULL,NULL,NULL,NULL,'@FINDNEXTWORKDAY( @DATE( YR , MON, 18 ), HOLIDAYS, 1 )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-50939045:18c60fd7aab:-7ff9','RA-50939045:18c60fd7aab:-7ffa','water.actions.SetWaterBillSchedule.expirydate',NULL,NULL,NULL,NULL,'@MONTHADD( @DATE( YR , MON , 9 ), 1 )','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP2a849d8a:18aca9676a8:-7ff1','RA2a849d8a:18aca9676a8:-7ff7','water.actions.AddWaterBillItem.account',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WATER_BILL','WATER BILL',NULL,NULL,NULL),('RAP2a849d8a:18aca9676a8:-7ff2','RA2a849d8a:18aca9676a8:-7ff7','water.actions.AddWaterBillItem.year',NULL,NULL,'RCC2a849d8a:18aca9676a8:-7ffe','YR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP2a849d8a:18aca9676a8:-7ff3','RA2a849d8a:18aca9676a8:-7ff7','water.actions.AddWaterBillItem.month',NULL,NULL,'RCC2a849d8a:18aca9676a8:-7ffd','MON',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP2a849d8a:18aca9676a8:-7ff4','RA2a849d8a:18aca9676a8:-7ff7','water.actions.AddWaterBillItem.amount',NULL,NULL,NULL,NULL,'RATE','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP2a849d8a:18aca9676a8:-7ff5','RA2a849d8a:18aca9676a8:-7ff7','water.actions.AddWaterBillItem.billdate',NULL,NULL,NULL,NULL,'BDATE','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP5118db67:1851f22bb8d:-7ff1','RA5118db67:1851f22bb8d:-7ff2','treasury.actions.AddCashReceiptItem.amount',NULL,NULL,NULL,NULL,'AMT','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP53bee69f:188e6ecc2a9:-7ff3','RA53bee69f:188e6ecc2a9:-7ff5','treasury.actions.AddBillItem.billcode',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WATER_RECONNECTION_FEE','WATER RECONNECTION FEE',NULL,NULL,NULL),('RAP53bee69f:188e6ecc2a9:-7ff4','RA53bee69f:188e6ecc2a9:-7ff5','treasury.actions.AddBillItem.amount',NULL,NULL,NULL,NULL,'def diff =  ( (YR*12)+MON) -  ( (BYR*12)+BMON );\nreturn 300 * diff; ','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP5be77a81:18e5a358870:-7fed','RA5be77a81:18e5a358870:-7fef','water.actions.ComputeBillRate.bill',NULL,NULL,'RC5be77a81:18e5a358870:-7ff3','WBILL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP5be77a81:18e5a358870:-7fee','RA5be77a81:18e5a358870:-7fef','water.actions.ComputeBillRate.amount',NULL,NULL,'RCC5be77a81:18e5a358870:-7ff2','VOL','<table border=\"1\" cellpadding=\"1\" cellspacing=\"0\">\n    <tr>\n        <td colspan=\"3\">Use Variable: VOL</td>\n    </tr>\n    \n    \n        <tr>\n            <th>Greater than or equal to</th>\n            <th>Less than</th>\n            <th>Formula</th>\n        </tr>\n    \n    \n        <tr>\n            <td></td>\n            <td>5.00</td>\n            <td>60</td>\n        </tr>\n    \n        <tr>\n            <td>5.00</td>\n            <td></td>\n            <td>VOL*18.00</td>\n        </tr>\n    \n</table>','range',NULL,NULL,NULL,'[[from:0.00,to:5.00,value:\"60\"],[from:5.00,value:\"VOL*18.00\"]]',NULL,0),('RAP5cff48f4:18a5f16cf2a:-7fd9','RA5cff48f4:18a5f16cf2a:-7fdb','water.actions.ComputeBillRate.bill',NULL,NULL,'RC5cff48f4:18a5f16cf2a:-7fe0','WBILL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP5cff48f4:18a5f16cf2a:-7fda','RA5cff48f4:18a5f16cf2a:-7fdb','water.actions.ComputeBillRate.amount',NULL,NULL,NULL,NULL,'(VOL == 0) ? 62 : 0;','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP5cff48f4:18a5f16cf2a:-7fe1','RA5cff48f4:18a5f16cf2a:-7fe3','water.actions.ComputeBillRate.amount',NULL,NULL,'RCC5cff48f4:18a5f16cf2a:-7fe4','VOL','<table border=\"1\" cellpadding=\"1\" cellspacing=\"0\">\n    <tr>\n        <td colspan=\"3\">Use Variable: VOL</td>\n    </tr>\n    \n        <tr>\n            <th>Greater than</th>\n            <th>Less than or equal to</th>\n            <th>Formula</th>\n        </tr>\n    \n    \n    \n        <tr>\n            <td></td>\n            <td>10.00</td>\n            <td>62</td>\n        </tr>\n    \n        <tr>\n            <td>10.00</td>\n            <td>20.00</td>\n            <td>62 + ((VOL-10) * 7 )</td>\n        </tr>\n    \n        <tr>\n            <td>20.00</td>\n            <td>30.00</td>\n            <td>132 + ((VOL-20) * 8 )</td>\n        </tr>\n    \n        <tr>\n            <td>30.00</td>\n            <td>40.00</td>\n            <td>212 + ((VOL-30) * 11)</td>\n        </tr>\n    \n        <tr>\n            <td>40.00</td>\n            <td>50.00</td>\n            <td>322 + ((VOL-40) * 14 )</td>\n        </tr>\n    \n        <tr>\n            <td>50.00</td>\n            <td>60.00</td>\n            <td>462 + ((VOL-50) * 17)</td>\n        </tr>\n    \n        <tr>\n            <td>60.00</td>\n            <td>70.00</td>\n            <td>632 + ((VOL-60) * 20)</td>\n        </tr>\n    \n        <tr>\n            <td>70.00</td>\n            <td></td>\n            <td>832 + ((VOL-70) * 23)</td>\n        </tr>\n    \n</table>','range',NULL,NULL,NULL,'[[value:\"62\",to:10.00,from:0],[value:\"62 + ((VOL-10) * 7 )\",to:20.00,from:10.00],[value:\"132 + ((VOL-20) * 8 )\",to:30.00,from:20.00],[value:\"212 + ((VOL-30) * 11)\",to:40.00,from:30.00],[value:\"322 + ((VOL-40) * 14 )\",to:50.00,from:40.00],[value:\"462 + ((VOL-50) * 17)\",from:50.00,to:60.00],[from:60.00,to:70.00,value:\"632 + ((VOL-60) * 20)\"],[from:70.00,value:\"832 + ((VOL-70) * 23)\"]]',NULL,1),('RAP5cff48f4:18a5f16cf2a:-7fe2','RA5cff48f4:18a5f16cf2a:-7fe3','water.actions.ComputeBillRate.bill',NULL,NULL,'RC5cff48f4:18a5f16cf2a:-7fe6','WBILL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP5cff48f4:18a5f16cf2a:-7fe9','RA5cff48f4:18a5f16cf2a:-7feb','water.actions.ComputeBillRate.bill',NULL,NULL,'RC5cff48f4:18a5f16cf2a:-7ff0','WBILL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP5cff48f4:18a5f16cf2a:-7fea','RA5cff48f4:18a5f16cf2a:-7feb','water.actions.ComputeBillRate.amount',NULL,NULL,NULL,NULL,'VOL * 23','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP5cff48f4:18a5f16cf2a:-7ff1','RA5cff48f4:18a5f16cf2a:-7ff3','water.actions.ComputeBillRate.amount',NULL,NULL,NULL,NULL,'(VOL == 0) ? 23 : 0;','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP5cff48f4:18a5f16cf2a:-7ff2','RA5cff48f4:18a5f16cf2a:-7ff3','water.actions.ComputeBillRate.bill',NULL,NULL,'RC5cff48f4:18a5f16cf2a:-7ff6','WBILL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAP65270b36:1895d10e6f2:-7ffa','RA65270b36:1895d10e6f2:-7ffc','treasury.actions.AddBillItem.amount',NULL,NULL,NULL,NULL,'DP','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP65270b36:1895d10e6f2:-7ffb','RA65270b36:1895d10e6f2:-7ffc','treasury.actions.AddBillItem.billcode',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WATER_DOWNPAYMENT','WATER DOWNPAYMENT',NULL,NULL,NULL),('RAP690c2690:1889fd3fa0e:-7ffc','RA690c2690:1889fd3fa0e:-7ffd','water.actions.SetWaterBillSchedule.billschedule',NULL,NULL,'RC690c2690:1889fd3fa0e:-8000','WBS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RAPcce69e1:1886997296a:-7ff4','RAcce69e1:1886997296a:-7ff6','treasury.actions.AddBillItem.billcode',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WATER_DOWNPAYMENT','WATER DOWNPAYMENT',NULL,NULL,NULL),('RAPcce69e1:1886997296a:-7ff5','RAcce69e1:1886997296a:-7ff6','treasury.actions.AddBillItem.amount',NULL,NULL,NULL,NULL,'DP','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-21685239:17b6cdabf45:-73f8','RACT-21685239:17b6cdabf45:-7404','treasury.actions.RemoveBillItem.billitem',NULL,NULL,'RCOND3c37d24d:17f1ac2fff3:-7c89','ABILLITEM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-22e7de62:18c619db161:-76da','RACT-22e7de62:18c619db161:-7700','water.actions.ComputeBillRate.amount',NULL,NULL,NULL,NULL,'VOL * 10','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-22e7de62:18c619db161:-76f0','RACT-22e7de62:18c619db161:-7700','water.actions.ComputeBillRate.bill',NULL,NULL,'RCOND-22e7de62:18c619db161:-77ff','WBILL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-2524933:189520f3f6b:-7adb','RACT-2524933:189520f3f6b:-7b68','treasury.actions.AddBillItem.amount',NULL,NULL,NULL,NULL,'200','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-2524933:189520f3f6b:-7b47','RACT-2524933:189520f3f6b:-7b68','treasury.actions.AddBillItem.billcode',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WATER_INSTALLATION_FEE','INSTALLATION FEE',NULL,NULL,NULL),('RULACT-3819b621:18ad7433b7c:-6cbb','RA5118db67:1851f22bb8d:-7ff2','treasury.actions.AddCashReceiptItem.billitem',NULL,NULL,'RC5118db67:1851f22bb8d:-7ff4','CRBILL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-39cfbe4a:188696e0369:-7c05','RACT-39cfbe4a:188696e0369:-7c6e','treasury.actions.AddBillItem.amount',NULL,NULL,NULL,NULL,'300','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-39cfbe4a:188696e0369:-7c4d','RACT-39cfbe4a:188696e0369:-7c6e','treasury.actions.AddBillItem.billcode',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WATER_RECONNECTION_FEE','WATER RECONNECTION FEE',NULL,NULL,NULL),('RULACT-5a798cf1:18e5a35a0b4:-7a88','RACT-62d5b87:18cd865ce1a:-65be','water.actions.ComputeBillRate.amount',NULL,NULL,'RCONST-62d5b87:18cd865ce1a:-6693','VOL','<table border=\"1\" cellpadding=\"1\" cellspacing=\"0\">\n    <tr>\n        <td colspan=\"3\">Use Variable: VOL</td>\n    </tr>\n    \n    \n        <tr>\n            <th>Greater than or equal to</th>\n            <th>Less than</th>\n            <th>Formula</th>\n        </tr>\n    \n    \n        <tr>\n            <td></td>\n            <td>5.00</td>\n            <td>30</td>\n        </tr>\n    \n        <tr>\n            <td>5.00</td>\n            <td></td>\n            <td>VOL*9.00</td>\n        </tr>\n    \n</table>','range',NULL,NULL,NULL,'[[from:0.00,to:5.00,value:\"30\"],[from:5.00,value:\"VOL*9.00\"]]',NULL,0),('RULACT-5a798cf1:18e5a35a0b4:-7b78','RACT-5a798cf1:18e5a35a0b4:-7baf','water.actions.ComputeBillRate.amount',NULL,NULL,'RCC-4c00ed59:18cd865480c:-7fda','VOL','<table border=\"1\" cellpadding=\"1\" cellspacing=\"0\">\n    <tr>\n        <td colspan=\"3\">Use Variable: VOL</td>\n    </tr>\n    \n    \n        <tr>\n            <th>Greater than or equal to</th>\n            <th>Less than</th>\n            <th>Formula</th>\n        </tr>\n    \n    \n        <tr>\n            <td></td>\n            <td>5.00</td>\n            <td>60</td>\n        </tr>\n    \n        <tr>\n            <td>5.00</td>\n            <td></td>\n            <td>VOL*18.00</td>\n        </tr>\n    \n</table>','range',NULL,NULL,NULL,'[[from:0.00,to:5.00,value:\"60\"],[from:5.00,value:\"VOL*18.00\"]]',NULL,0),('RULACT-5a798cf1:18e5a35a0b4:-7ba1','RACT-5a798cf1:18e5a35a0b4:-7baf','water.actions.ComputeBillRate.bill',NULL,NULL,'RC-4c00ed59:18cd865480c:-7fdb','WBILL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-62d5b87:18cd865ce1a:-65b0','RACT-62d5b87:18cd865ce1a:-65be','water.actions.ComputeBillRate.bill',NULL,NULL,'RCOND-62d5b87:18cd865ce1a:-66f7','WBILL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-62d5b87:18cd865ce1a:-71f8','RACT-62d5b87:18cd865ce1a:-794e','water.actions.SetWaterBillSchedule.expirydate',NULL,NULL,NULL,NULL,'@MONTHEND(@DATE( YR ,MON, 1))','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-62d5b87:18cd865ce1a:-7266','RACT-62d5b87:18cd865ce1a:-794e','water.actions.SetWaterBillSchedule.duedate',NULL,NULL,NULL,NULL,'@FINDNEXTWORKDAY( @DATE( YR ,MON, 15),HOLIDAYS,1)','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-62d5b87:18cd865ce1a:-7334','RACT-62d5b87:18cd865ce1a:-794e','water.actions.SetWaterBillSchedule.billdate',NULL,NULL,NULL,NULL,'@DATE( YR ,MON, 10)','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-62d5b87:18cd865ce1a:-73d7','RACT-62d5b87:18cd865ce1a:-794e','water.actions.SetWaterBillSchedule.readingduedate',NULL,NULL,NULL,NULL,'@DATE( YR ,MON, 10)','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-62d5b87:18cd865ce1a:-74e6','RACT-62d5b87:18cd865ce1a:-794e','water.actions.SetWaterBillSchedule.readingdate',NULL,NULL,NULL,NULL,'@MONTHADD(@DATE( YR ,MON,28 ), -1)','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-62d5b87:18cd865ce1a:-78a2','RACT-62d5b87:18cd865ce1a:-794e','water.actions.SetWaterBillSchedule.todate',NULL,NULL,NULL,NULL,'@MONTHEND(@MONTHADD(@DATE( YR ,MON,1 ), -1))','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-62d5b87:18cd865ce1a:-78d8','RACT-62d5b87:18cd865ce1a:-794e','water.actions.SetWaterBillSchedule.fromdate',NULL,NULL,NULL,NULL,'@MONTHADD(@DATE( YR ,MON,1 ), -1)','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-62d5b87:18cd865ce1a:-790c','RACT-62d5b87:18cd865ce1a:-794e','water.actions.SetWaterBillSchedule.billschedule',NULL,NULL,'RCOND-62d5b87:18cd865ce1a:-7b8e','WBS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-689492a6:18c60ee947f:-5fed','RACT-689492a6:18c60ee947f:-6156','treasury.actions.AddSurchargeItem.forwarded',NULL,NULL,NULL,NULL,'true','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-689492a6:18c60ee947f:-605e','RACT-689492a6:18c60ee947f:-6156','treasury.actions.AddSurchargeItem.billdate',NULL,NULL,NULL,NULL,'BILLDATE','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-689492a6:18c60ee947f:-609d','RACT-689492a6:18c60ee947f:-6156','treasury.actions.AddSurchargeItem.account',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WATER_PENALTY','WATER PENALTY',NULL,NULL,NULL),('RULACT-689492a6:18c60ee947f:-610d','RACT-689492a6:18c60ee947f:-6156','treasury.actions.AddSurchargeItem.amount',NULL,NULL,NULL,NULL,'AMT * 0.10','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-689492a6:18c60ee947f:-6136','RACT-689492a6:18c60ee947f:-6156','treasury.actions.AddSurchargeItem.billitem',NULL,NULL,'RCOND-689492a6:18c60ee947f:-6ac2','BILLITEM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-72f22338:18521353cbd:-723f','RACT-72f22338:18521353cbd:-7269','treasury.actions.ApplyBillItemPayment.payment',NULL,NULL,'RCOND-72f22338:18521353cbd:-7d19','PMT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-72f22338:18521353cbd:-7251','RACT-72f22338:18521353cbd:-7269','treasury.actions.ApplyBillItemPayment.billitem',NULL,NULL,'RCOND-72f22338:18521353cbd:-79a4','BILLITEM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACT2a0555f7:18cecb153f1:-5b85','RACT2a0555f7:18cecb153f1:-630a','treasury.actions.AddSurchargeItem.billdate',NULL,NULL,NULL,NULL,'BILLDATE','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT2a0555f7:18cecb153f1:-60dd','RACT2a0555f7:18cecb153f1:-630a','treasury.actions.AddSurchargeItem.amount',NULL,NULL,NULL,NULL,'BAL*0.10','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT2a0555f7:18cecb153f1:-62c9','RACT2a0555f7:18cecb153f1:-630a','treasury.actions.AddSurchargeItem.account',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WATER_BILL_SURCHARGE','WATER BILL SURCHARGE',NULL,NULL,NULL),('RULACT2a0555f7:18cecb153f1:-62ef','RACT2a0555f7:18cecb153f1:-630a','treasury.actions.AddSurchargeItem.billitem',NULL,NULL,'RCOND2a0555f7:18cecb153f1:-65c6','BILLITEM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACT3048fa3a:18871bcfa7d:-7d61','RACT4e803530:1887047c12e:-7a18','water.actions.AddWaterBillItem.billdate',NULL,NULL,NULL,NULL,'BDATE','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT396bc69f:1887204eb56:-7666','RACT4e803530:1887047c12e:-7a18','water.actions.AddWaterBillItem.paymentplanid',NULL,NULL,'RCONST396bc69f:1887204eb56:-7805','PMTID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACT4e803530:1887047c12e:-725a','RACT4e803530:1887047c12e:-7a18','water.actions.AddWaterBillItem.amount',NULL,NULL,NULL,NULL,'if ( (BCOUNT + 1) == TERM ) {\n     return @ROUND( PAMT - (IAMT * (TERM-1))  );   \n};\nelse {\n   return IAMT;\n};','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT4e803530:1887047c12e:-755f','RACT4e803530:1887047c12e:-7a18','water.actions.AddWaterBillItem.account',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WATER_COMPROMISE_FEE','WATER COMPROMISE FEE',NULL,NULL,NULL),('RULACT4e803530:1887047c12e:-79a8','RACT4e803530:1887047c12e:-7a18','water.actions.AddWaterBillItem.year',NULL,NULL,'RCONST4e803530:1887047c12e:-7d4e','BYR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACT4e803530:1887047c12e:-79e0','RACT4e803530:1887047c12e:-7a18','water.actions.AddWaterBillItem.month',NULL,NULL,'RCONST4e803530:1887047c12e:-7cc9','BMON',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACT61e00012:187074846ff:-60a1','RACT61e00012:187074846ff:-612e','water.actions.SetWaterBillSchedule.readingduedate',NULL,NULL,NULL,NULL,'def dt = READINGDATE;\n(1..4).each {\n    dt = @FINDNEXTWORKDAY(  @DAYADD( dt , 1 ),  HOLIDAYS, 1 );\n};\nreturn dt;\n\n','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT61e00012:187074846ff:-60f2','RACT61e00012:187074846ff:-612e','water.actions.SetWaterBillSchedule.billschedule',NULL,NULL,'RCOND61e00012:187074846ff:-61eb','WBS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACT61e00012:187074846ff:-6266','RACT61e00012:187074846ff:-62f1','water.actions.SetWaterBillSchedule.readingdate',NULL,NULL,NULL,NULL,'TODATE','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT61e00012:187074846ff:-62b5','RACT61e00012:187074846ff:-62f1','water.actions.SetWaterBillSchedule.billschedule',NULL,NULL,'RCOND61e00012:187074846ff:-6568','WBS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACT61e00012:187074846ff:-6415','RACT61e00012:187074846ff:-6b5d','water.actions.SetWaterBillSchedule.billschedule',NULL,NULL,'RCOND61e00012:187074846ff:-6d95','WBS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACT61e00012:187074846ff:-6acb','RACT61e00012:187074846ff:-6b5d','water.actions.SetWaterBillSchedule.todate',NULL,NULL,NULL,NULL,'def dt = @DATE( YR, MON, 1 );\nfor( int i=1; i < DAYS; i++ ) {\n    dt = @FINDNEXTWORKDAY(  @DAYADD( dt , 1 ), HOLIDAYS, 1 );\n}; \nreturn dt;','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT61e00012:187074846ff:-6b14','RACT61e00012:187074846ff:-6b5d','water.actions.SetWaterBillSchedule.fromdate',NULL,NULL,NULL,NULL,'def dt = @MONTHADD( @DATE( YR, MON, 1), -1 );\nfor( int i=1; i < DAYS; i++ ) {\n     dt = @FINDNEXTWORKDAY(  @DAYADD( dt , 1 ) , HOLIDAYS, 1  );\n};\nreturn dt;  ','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT66638ced:1889f25c026:-7821','RA690c2690:1889fd3fa0e:-7ffd','water.actions.SetWaterBillSchedule.billingduedate',NULL,NULL,NULL,NULL,'READINGDUEDATE','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT66638ced:1889f25c026:-7d2f','RA690c2690:1889fd3fa0e:-7ffd','water.actions.SetWaterBillSchedule.billdate',NULL,NULL,NULL,NULL,'READINGDUEDATE','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT7834f671:18b2e3ebb80:-5f63','RA5118db67:1851f22bb8d:-7ff2','treasury.actions.AddCashReceiptItem.billcode',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WATER_BILL_ADVANCE','WATER BILL ADVANCE PAYMENT',NULL,NULL,NULL),('RULACT7834f671:18b2e3ebb80:-6ca0','RA-3573de3e:18b2d22ab69:-7fc2','treasury.actions.AddCashReceiptItem.billcode',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WATER_PENALTY','WATER PENALTY',NULL,NULL,NULL),('RULACT7834f671:18b2e3ebb80:-7779','RA-3573de3e:18b2d22ab69:-7fe1','treasury.actions.AddCashReceiptItem.billcode',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WATER_BILL','WATER BILL',NULL,NULL,NULL),('RULACT7b73bf4:1850ee0fd3b:-7afe','RACT7b73bf4:1850ee0fd3b:-7b28','treasury.actions.SetBillValidityDate.date',NULL,NULL,NULL,NULL,' if(  TDATE <= DUEDATE  ) return DUEDATE;\nreturn EXPIRYDATE;','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT7b73bf4:1850ee0fd3b:-7b16','RACT7b73bf4:1850ee0fd3b:-7b28','treasury.actions.SetBillValidityDate.bill',NULL,NULL,'RCOND7b73bf4:1850ee0fd3b:-7b8a','WBILL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACTc8dbf18:1870773e513:-701c','RACT61e00012:187074846ff:-6b5d','water.actions.SetWaterBillSchedule.expirydate',NULL,NULL,NULL,NULL,'def dt = @MONTHADD( @DATE( YR, MON, 1), 1 );\nfor( int i=1; i < DAYS; i++ ) {\n     dt = @FINDNEXTWORKDAY(  @DAYADD( dt , 1 ) , HOLIDAYS, 1  );\n};\nreturn dt;  ','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACTc8dbf18:1870773e513:-7351','RACTc8dbf18:1870773e513:-73f2','water.actions.SetWaterBillSchedule.duedate',NULL,NULL,NULL,NULL,'@DAYADD( DISCDATE ,  5 );','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACTc8dbf18:1870773e513:-73b0','RACTc8dbf18:1870773e513:-73f2','water.actions.SetWaterBillSchedule.billschedule',NULL,NULL,'RCONDc8dbf18:1870773e513:-7577','WBS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACTc8dbf18:1870773e513:-7869','RACTc8dbf18:1870773e513:-7907','water.actions.SetWaterBillSchedule.discdate',NULL,NULL,NULL,NULL,'@FINDNEXTWORKDAY( @DAYADD( BILLINGDUEDATE, 15 ), HOLIDAYS, 1 );','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACTc8dbf18:1870773e513:-78c5','RACTc8dbf18:1870773e513:-7907','water.actions.SetWaterBillSchedule.billschedule',NULL,NULL,'RCONDc8dbf18:1870773e513:-7a06','WBS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_actiondef`
--

LOCK TABLES `sys_rule_actiondef` WRITE;
/*!40000 ALTER TABLE `sys_rule_actiondef` DISABLE KEYS */;
INSERT INTO `sys_rule_actiondef` VALUES ('enterprise.actions.AddRequirement','add-requirement','Add Requirement',2,'add-requirement','enterprise','enterprise.actions.AddRequirement'),('enterprise.actions.PrintTest','print-test','Print Test',1,'print-test','ENTERPRISE','enterprise.actions.PrintTest'),('enterprise.actions.ThrowException','throw-exeception','Throw Exception',1,'throw-exeception','ENTERPRISE','enterprise.actions.ThrowException'),('treasury.actions.AddBillItem','add-billitem','Add Bill Item',2,'add-billitem','TREASURY','treasury.actions.AddBillItem'),('treasury.actions.AddCashReceiptItem','add-cashreceipt-item','Add Cash Receipt Item',1,'add-cashreceipt-item','TREASURY','treasury.actions.AddCashReceiptItem'),('treasury.actions.AddCreditBillItem','add-credit-billitem','Add Credit Bill Item',2,'add-credit-billitem','TREASURY','treasury.actions.AddCreditBillItem'),('treasury.actions.AddDiscountItem','add-discount-item','Add Discount',3,'add-discount-item','TREASURY','treasury.actions.AddDiscountItem'),('treasury.actions.AddInterestItem','add-interest-item','Add Interest',3,'add-interest-item','TREASURY','treasury.actions.AddInterestItem'),('treasury.actions.AddSurchargeItem','add-surcharge-item','Add Surcharge',3,'add-surcharge-item','TREASURY','treasury.actions.AddSurchargeItem'),('treasury.actions.AddVarInteger','add-var-integer','Add Var Integer',1,'add-var-integer','TREASURY','treasury.actions.AddVarInteger'),('treasury.actions.ApplyBillItemCredit','apply-billitem-credit','Apply Bill Item Credit',1,'apply-billitem-credit','TREASURY','treasury.actions.ApplyBillItemCredit'),('treasury.actions.ApplyBillItemPayment','apply-billitem-payment','Apply Bill Item Payment',1,'apply-billitem-payment','TREASURY','treasury.actions.ApplyBillItemPayment'),('treasury.actions.ApplyPayment','apply-payment','Apply Payment',5,'apply-payment','TREASURY','treasury.actions.ApplyPayment'),('treasury.actions.RemoveBillItem','remove-billitem','Remove Bill Item',10,'remove-billitem','TREASURY','treasury.actions.RemoveBillItem'),('treasury.actions.SetBillItemAccount','set-billitem-account','Set Bill Item Account',4,'set-billitem-account','TREASURY','treasury.actions.SetBillItemAccount'),('treasury.actions.SetBillItemProperty','set-billitem-property','Set BillItem Property Value',10,'set-billitem-property','TREASURY','treasury.actions.SetBillItemProperty'),('treasury.actions.SetBillValidityDate','set-bill-validity-date','Set Bill Validity date',1,'set-bill-validity-date','TREASURY','treasury.actions.SetBillValidityDate'),('treasury.actions.SetCashReceiptItemRemarks','set-cashreceipt-item-remarks','Set Cash Receipt Item Remarks',1,'set-cashreceipt-item-remarks','TREASURY','treasury.actions.SetCashReceiptItemRemarks'),('treasury.actions.SupersedeBillItem','supersede-billitem','Supersede Bill Item',1,'supersede-billitem','TREASURY','treasury.actions.SupersedeBillItem'),('treasury.actions.UpdateBillItemAmount','update-billitem-amount','Update Bill Item Amount',1,'update-billitem-amount','TREASURY','treasury.actions.UpdateBillItemAmount'),('water.actions.AddWaterBillItem','add-water-billitem','Add Water Bill Item',0,'add-water-billitem','WATER','water.actions.AddWaterBillItem'),('water.actions.AddWaterBillSchedule','add-water-bill-schedule','Add Water Bill Schedule',0,'add-water-bill-schedule','WATER','water.actions.AddWaterBillSchedule'),('water.actions.ChangeVolume','change-volume','Change Volume',1,'change-volume','WATER','water.actions.ChangeVolume'),('water.actions.ComputeBillRate','compute-bill-rate','Compute Bill Rate',1,'compute-bill-rate','WATER','water.actions.ComputeBillRate'),('water.actions.SetWaterBillSchedule','set-water-bill-schedule','Set Water Bill Schedule',1,'set-water-bill-schedule','WATER','water.actions.SetWaterBillSchedule');
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
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `parentid` (`parentid`) USING BTREE,
  CONSTRAINT `sys_rule_actiondef_param_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_actiondef` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_actiondef_param`
--

LOCK TABLES `sys_rule_actiondef_param` WRITE;
/*!40000 ALTER TABLE `sys_rule_actiondef_param` DISABLE KEYS */;
INSERT INTO `sys_rule_actiondef_param` VALUES ('enterprise.actions.AddRequirement.message','enterprise.actions.AddRequirement','message',2,'Message',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('enterprise.actions.AddRequirement.reqtype','enterprise.actions.AddRequirement','reqtype',1,'Requirement Type',NULL,'lookup','sys_requirement_type:lookup','code','title','string',NULL),('enterprise.actions.AddRequirement.required','enterprise.actions.AddRequirement','required',4,'Required','boolean','boolean',NULL,NULL,NULL,'boolean',NULL),('enterprise.actions.AddRequirement.sortorder','enterprise.actions.AddRequirement','sortorder',3,'Sort Order','string','string',NULL,NULL,NULL,'string',NULL),('enterprise.actions.PrintTest.message','enterprise.actions.PrintTest','message',1,'Message',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('enterprise.actions.ThrowException.msg','enterprise.actions.ThrowException','msg',1,'Message',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddBillItem.amount','treasury.actions.AddBillItem','amount',1,'Amount',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddBillItem.billcode','treasury.actions.AddBillItem','billcode',3,'Bill Code',NULL,'lookup','itemaccount:lookup','objid','title','string',NULL),('treasury.actions.AddBillItem.txntype','treasury.actions.AddBillItem','txntype',2,'Txn Type',NULL,'lookup','billitemtype:lookup','objid','title','string',NULL),('treasury.actions.AddCashReceiptItem.account','treasury.actions.AddCashReceiptItem','account',2,'Account',NULL,'lookup','revenueitem:lookup','objid','title',NULL,NULL),('treasury.actions.AddCashReceiptItem.amount','treasury.actions.AddCashReceiptItem','amount',3,'Amount',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddCashReceiptItem.billcode','treasury.actions.AddCashReceiptItem','billcode',8,'Bill Code',NULL,'lookup','itemaccount:lookup','objid','title','string',NULL),('treasury.actions.AddCashReceiptItem.billitem','treasury.actions.AddCashReceiptItem','billitem',1,'Bill Item',NULL,'var',NULL,NULL,NULL,'treasury.facts.AbstractBillItem',NULL),('treasury.actions.AddCashReceiptItem.groupid','treasury.actions.AddCashReceiptItem','groupid',5,'Group ID',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddCashReceiptItem.remarks','treasury.actions.AddCashReceiptItem','remarks',6,'Remarks',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddCashReceiptItem.sortorder','treasury.actions.AddCashReceiptItem','sortorder',7,'Sort Order',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddCashReceiptItem.uid','treasury.actions.AddCashReceiptItem','uid',4,'UID',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddCreditBillItem.account','treasury.actions.AddCreditBillItem','account',1,'Account',NULL,'lookup','itemaccount:lookup','objid','title',NULL,NULL),('treasury.actions.AddCreditBillItem.amount','treasury.actions.AddCreditBillItem','amount',2,'Amount',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddCreditBillItem.payment','treasury.actions.AddCreditBillItem','payment',3,'Payment',NULL,'var',NULL,NULL,NULL,'treasury.facts.Payment',NULL),('treasury.actions.AddDiscountItem.account','treasury.actions.AddDiscountItem','account',3,'Account',NULL,'lookup','water_itemaccount:lookup','objid','title','string',NULL),('treasury.actions.AddDiscountItem.amount','treasury.actions.AddDiscountItem','amount',2,'Amount',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddDiscountItem.billcode','treasury.actions.AddDiscountItem','billcode',5,'Bill Code',NULL,'lookup','itemaccount:lookup','objid','title','string',NULL),('treasury.actions.AddDiscountItem.billitem','treasury.actions.AddDiscountItem','billitem',1,'Bill Item',NULL,'var',NULL,NULL,NULL,'treasury.facts.BillItem',NULL),('treasury.actions.AddDiscountItem.discdate','treasury.actions.AddDiscountItem','discdate',4,'Discount Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddInterestItem.account','treasury.actions.AddInterestItem','account',3,'Account',NULL,'lookup','water_itemaccount:lookup','objid','title',NULL,NULL),('treasury.actions.AddInterestItem.amount','treasury.actions.AddInterestItem','amount',2,'Amount',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddInterestItem.billcode','treasury.actions.AddInterestItem','billcode',5,'Bill Code',NULL,'lookup','itemaccount:lookup','objid','title','string',NULL),('treasury.actions.AddInterestItem.billdate','treasury.actions.AddInterestItem','billdate',4,'Bill Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddInterestItem.billitem','treasury.actions.AddInterestItem','billitem',1,'Bill Item',NULL,'var',NULL,NULL,NULL,'treasury.facts.BillItem',NULL),('treasury.actions.AddSurchargeItem.account','treasury.actions.AddSurchargeItem','account',3,'Account',NULL,'lookup','water_itemaccount:lookup','objid','title',NULL,NULL),('treasury.actions.AddSurchargeItem.amount','treasury.actions.AddSurchargeItem','amount',2,'Amount',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddSurchargeItem.billcode','treasury.actions.AddSurchargeItem','billcode',6,'Bill Code',NULL,'lookup','itemaccount:lookup','objid','title','string',NULL),('treasury.actions.AddSurchargeItem.billdate','treasury.actions.AddSurchargeItem','billdate',4,'Bill Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddSurchargeItem.billitem','treasury.actions.AddSurchargeItem','billitem',1,'Bill Item',NULL,'var',NULL,NULL,NULL,'treasury.facts.AbstractBillItem',NULL),('treasury.actions.AddSurchargeItem.forwarded','treasury.actions.AddSurchargeItem','forwarded',5,'Forwarded',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddVarInteger.tag','treasury.actions.AddVarInteger','tag',2,'Tag','string','string',NULL,NULL,NULL,'string',NULL),('treasury.actions.AddVarInteger.value','treasury.actions.AddVarInteger','value',1,'Value',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.ApplyBillItemCredit.billitem','treasury.actions.ApplyBillItemCredit','billitem',1,'Bill Item',NULL,'var',NULL,NULL,NULL,'treasury.facts.BillItem',NULL),('treasury.actions.ApplyBillItemCredit.creditbillitem','treasury.actions.ApplyBillItemCredit','creditbillitem',2,'Credit Bill Item',NULL,'var',NULL,NULL,NULL,'treasury.facts.CreditBillItem',NULL),('treasury.actions.ApplyBillItemPayment.billitem','treasury.actions.ApplyBillItemPayment','billitem',2,'Bill Item',NULL,'var',NULL,NULL,NULL,'treasury.facts.AbstractBillItem',NULL),('treasury.actions.ApplyBillItemPayment.payment','treasury.actions.ApplyBillItemPayment','payment',1,'Payment',NULL,'var',NULL,NULL,NULL,'treasury.facts.Payment',NULL),('treasury.actions.ApplyPayment.payment','treasury.actions.ApplyPayment','payment',1,'Payment',NULL,'var',NULL,NULL,NULL,'treasury.facts.Payment',NULL),('treasury.actions.RemoveBillItem.billitem','treasury.actions.RemoveBillItem','billitem',1,'Bill Item',NULL,'var',NULL,NULL,NULL,'treasury.facts.AbstractBillItem',NULL),('treasury.actions.SetBillItemAccount.account','treasury.actions.SetBillItemAccount','account',2,'Account',NULL,'lookup','itemaccount:lookup','objid','title',NULL,NULL),('treasury.actions.SetBillItemAccount.billcode','treasury.actions.SetBillItemAccount','billcode',3,'Billcode',NULL,'lookup','waterworks_itemaccount:lookup','objid','title','string',NULL),('treasury.actions.SetBillItemAccount.billitem','treasury.actions.SetBillItemAccount','billitem',1,'Bill Item',NULL,'var',NULL,NULL,NULL,'treasury.facts.AbstractBillItem',NULL),('treasury.actions.SetBillItemProperty.billitem','treasury.actions.SetBillItemProperty','billitem',1,'Bill Item',NULL,'var',NULL,NULL,NULL,'treasury.facts.BillItem',NULL),('treasury.actions.SetBillItemProperty.fieldname','treasury.actions.SetBillItemProperty','fieldname',2,'Property Field Name',NULL,'fieldlist',NULL,'billitem',NULL,NULL,NULL),('treasury.actions.SetBillItemProperty.value','treasury.actions.SetBillItemProperty','value',3,'Value',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.SetBillValidityDate.bill','treasury.actions.SetBillValidityDate','bill',1,'Bill',NULL,'var',NULL,NULL,NULL,'treasury.facts.Bill',NULL),('treasury.actions.SetBillValidityDate.date','treasury.actions.SetBillValidityDate','date',2,'Validity Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.SetCashReceiptItemRemarks.receiptitem','treasury.actions.SetCashReceiptItemRemarks','receiptitem',1,'Receipt Item',NULL,'var',NULL,NULL,NULL,'treasury.facts.CashReceiptItem',NULL),('treasury.actions.SetCashReceiptItemRemarks.remarks','treasury.actions.SetCashReceiptItemRemarks','remarks',2,'Remarks',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.SetCashReceiptItemRemarks.type','treasury.actions.SetCashReceiptItemRemarks','type',3,'Type',NULL,'lov',NULL,NULL,NULL,NULL,'UPDATE_TYPE'),('treasury.actions.SupersedeBillItem.billitem','treasury.actions.SupersedeBillItem','billitem',1,'Bill Item',NULL,'var',NULL,NULL,NULL,'treasury.facts.AbstractBillItem',NULL),('treasury.actions.SupersedeBillItem.supersederitem','treasury.actions.SupersedeBillItem','supersederitem',2,'Superseder BillItem',NULL,'var',NULL,NULL,NULL,'treasury.facts.AbstractBillItem',NULL),('treasury.actions.UpdateBillItemAmount.amount','treasury.actions.UpdateBillItemAmount','amount',3,'Amount',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.UpdateBillItemAmount.billitem','treasury.actions.UpdateBillItemAmount','billitem',1,'Bill Item',NULL,'var',NULL,NULL,NULL,'treasury.facts.BillItem',NULL),('treasury.actions.UpdateBillItemAmount.type','treasury.actions.UpdateBillItemAmount','type',2,'Type',NULL,'lov',NULL,NULL,NULL,NULL,'UPDATE_BILLITEM_TYPE'),('water.actions.AddWaterBillItem.account','water.actions.AddWaterBillItem','account',1,'Account',NULL,'lookup','water_itemaccount:lookup','objid','title',NULL,NULL),('water.actions.AddWaterBillItem.amount','water.actions.AddWaterBillItem','amount',2,'Amount',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('water.actions.AddWaterBillItem.billdate','water.actions.AddWaterBillItem','billdate',5,'Bill Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('water.actions.AddWaterBillItem.duedate','water.actions.AddWaterBillItem','duedate',6,'Due Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('water.actions.AddWaterBillItem.month','water.actions.AddWaterBillItem','month',4,'Month',NULL,'var',NULL,NULL,NULL,'integer',NULL),('water.actions.AddWaterBillItem.paymentplanid','water.actions.AddWaterBillItem','paymentplanid',7,'Payment Plan Refid',NULL,'var',NULL,NULL,NULL,'string',NULL),('water.actions.AddWaterBillItem.year','water.actions.AddWaterBillItem','year',3,'Year',NULL,'var',NULL,NULL,NULL,'integer',NULL),('water.actions.AddWaterBillSchedule.month','water.actions.AddWaterBillSchedule','month',3,'Month',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('water.actions.AddWaterBillSchedule.params','water.actions.AddWaterBillSchedule','params',1,'Parameters',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('water.actions.AddWaterBillSchedule.year','water.actions.AddWaterBillSchedule','year',2,'Year',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('water.actions.ChangeVolume.bill','water.actions.ChangeVolume','bill',1,'Bill',NULL,'var',NULL,NULL,NULL,'water.facts.WaterBill',NULL),('water.actions.ChangeVolume.volume','water.actions.ChangeVolume','volume',2,'Volume',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('water.actions.ComputeBillRate.amount','water.actions.ComputeBillRate','amount',2,'Amount',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('water.actions.ComputeBillRate.bill','water.actions.ComputeBillRate','bill',1,'Bill',NULL,'var',NULL,NULL,NULL,'water.facts.WaterBill',NULL),('water.actions.SetWaterBillSchedule.billdate','water.actions.SetWaterBillSchedule','billdate',6,'Bill Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('water.actions.SetWaterBillSchedule.billingduedate','water.actions.SetWaterBillSchedule','billingduedate',7,'Billing Due Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('water.actions.SetWaterBillSchedule.billschedule','water.actions.SetWaterBillSchedule','billschedule',1,'Bill Schedule',NULL,'var',NULL,NULL,NULL,'water.facts.WaterBillSchedule',NULL),('water.actions.SetWaterBillSchedule.discdate','water.actions.SetWaterBillSchedule','discdate',8,'Discount Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('water.actions.SetWaterBillSchedule.duedate','water.actions.SetWaterBillSchedule','duedate',9,'Due Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('water.actions.SetWaterBillSchedule.expirydate','water.actions.SetWaterBillSchedule','expirydate',10,'Bill Expiry Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('water.actions.SetWaterBillSchedule.fromdate','water.actions.SetWaterBillSchedule','fromdate',2,'From Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('water.actions.SetWaterBillSchedule.readingdate','water.actions.SetWaterBillSchedule','readingdate',4,'Reading Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('water.actions.SetWaterBillSchedule.readingduedate','water.actions.SetWaterBillSchedule','readingduedate',5,'Reading Due Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('water.actions.SetWaterBillSchedule.todate','water.actions.SetWaterBillSchedule','todate',3,'To Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL);
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
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `fact_objid` (`fact_objid`) USING BTREE,
  KEY `parentid` (`parentid`) USING BTREE,
  CONSTRAINT `sys_rule_condition_fact` FOREIGN KEY (`fact_objid`) REFERENCES `sys_rule_fact` (`objid`),
  CONSTRAINT `sys_rule_condition_ibfk_1` FOREIGN KEY (`fact_objid`) REFERENCES `sys_rule_fact` (`objid`),
  CONSTRAINT `sys_rule_condition_ibfk_2` FOREIGN KEY (`parentid`) REFERENCES `sys_rule` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_condition`
--

LOCK TABLES `sys_rule_condition` WRITE;
/*!40000 ALTER TABLE `sys_rule_condition` DISABLE KEYS */;
INSERT INTO `sys_rule_condition` VALUES ('RC-3573de3e:18b2d22ab69:-7fb4','RUL7834f671:18b2e3ebb80:-6c69','water.facts.WaterBill','water.facts.WaterBill','WBILL',0,NULL,NULL,NULL,NULL,NULL,0),('RC-3573de3e:18b2d22ab69:-7fb7','RUL7834f671:18b2e3ebb80:-6c69','water.facts.WaterBillItem','water.facts.WaterBillItem','BILLITEM',1,NULL,NULL,NULL,NULL,NULL,0),('RC-3573de3e:18b2d22ab69:-7fba','RUL7834f671:18b2e3ebb80:-6c69','treasury.facts.PaymentItem','treasury.facts.PaymentItem',NULL,4,NULL,NULL,NULL,NULL,NULL,0),('RC-3573de3e:18b2d22ab69:-7fbd','RUL7834f671:18b2e3ebb80:-6c69','treasury.facts.SurchargeItem','treasury.facts.SurchargeItem','SURCHG',2,NULL,NULL,NULL,NULL,NULL,0),('RC-3573de3e:18b2d22ab69:-7fc4','RUL7834f671:18b2e3ebb80:-73bc','treasury.facts.SurchargeItem','treasury.facts.SurchargeItem','SURCHG',2,NULL,NULL,NULL,NULL,NULL,0),('RC-3573de3e:18b2d22ab69:-7fc7','RUL7834f671:18b2e3ebb80:-73bc','treasury.facts.PaymentItem','treasury.facts.PaymentItem',NULL,4,NULL,NULL,NULL,NULL,NULL,0),('RC-3573de3e:18b2d22ab69:-7fd0','RUL7834f671:18b2e3ebb80:-76fb','water.facts.WaterBill','water.facts.WaterBill','WBILL',0,NULL,NULL,NULL,NULL,NULL,0),('RC-3573de3e:18b2d22ab69:-7fd3','RUL7834f671:18b2e3ebb80:-76fb','treasury.facts.PaymentItem','treasury.facts.PaymentItem',NULL,2,NULL,NULL,NULL,NULL,NULL,0),('RC-3573de3e:18b2d22ab69:-7fd9','RUL7834f671:18b2e3ebb80:-76fb','water.facts.WaterBillItem','water.facts.WaterBillItem','BILLITEM',1,NULL,NULL,NULL,NULL,NULL,0),('RC-3573de3e:18b2d22ab69:-7fdb','RUL7834f671:18b2e3ebb80:-76fb','water.facts.WaterAccount','water.facts.WaterAccount',NULL,3,NULL,NULL,NULL,NULL,NULL,0),('RC-3573de3e:18b2d22ab69:-7fe3','RUL7834f671:18b2e3ebb80:-7d64','water.facts.WaterAccount','water.facts.WaterAccount',NULL,3,NULL,NULL,NULL,NULL,NULL,0),('RC-3573de3e:18b2d22ab69:-7fe8','RUL7834f671:18b2e3ebb80:-7d64','water.facts.WaterBillItem','water.facts.WaterBillItem','BILLITEM',1,NULL,NULL,NULL,NULL,NULL,0),('RC-3573de3e:18b2d22ab69:-7feb','RUL7834f671:18b2e3ebb80:-7d64','treasury.facts.PaymentItem','treasury.facts.PaymentItem',NULL,2,NULL,NULL,NULL,NULL,NULL,0),('RC-4c00ed59:18cd865480c:-7fdb','RUL-62d5b87:18cd865ce1a:-6280','water.facts.WaterBill','water.facts.WaterBill','WBILL',0,NULL,NULL,NULL,NULL,NULL,0),('RC-4c00ed59:18cd865480c:-7fdd','RUL-62d5b87:18cd865ce1a:-6280','water.facts.WaterAccount','water.facts.WaterAccount',NULL,1,NULL,NULL,NULL,NULL,NULL,0),('RC-50939045:18c60fd7aab:-7fb9','RUL-689492a6:18c60ee947f:-5dfa','treasury.facts.Payment','treasury.facts.Payment','PMT',0,NULL,NULL,NULL,NULL,NULL,0),('RC-50939045:18c60fd7aab:-7fc5','RUL-689492a6:18c60ee947f:-71e6','water.facts.WaterBillItem','water.facts.WaterBillItem','BILLITEM',1,NULL,NULL,NULL,NULL,NULL,0),('RC-50939045:18c60fd7aab:-7fc7','RUL-689492a6:18c60ee947f:-71e6','water.facts.WaterBillSchedule','water.facts.WaterBillSchedule','WBS',2,NULL,NULL,NULL,NULL,NULL,0),('RC-50939045:18c60fd7aab:-7fc9','RUL-689492a6:18c60ee947f:-71e6','treasury.facts.TransactionDate','treasury.facts.TransactionDate',NULL,3,NULL,NULL,NULL,NULL,NULL,0),('RC-50939045:18c60fd7aab:-7fcb','RUL-689492a6:18c60ee947f:-71e6','treasury.facts.SurchargeItem','treasury.facts.SurchargeItem','',4,NULL,NULL,NULL,NULL,NULL,1),('RC-50939045:18c60fd7aab:-7fd7','RUL-689492a6:18c60ee947f:-7603','water.facts.WaterBillSchedule','water.facts.WaterBillSchedule','WBS',0,NULL,NULL,NULL,NULL,NULL,0),('RC-50939045:18c60fd7aab:-7fd8','RUL-689492a6:18c60ee947f:-7603','treasury.facts.HolidayFact','treasury.facts.HolidayFact','HOLIDAYS',1,NULL,NULL,NULL,NULL,NULL,0),('RC-50939045:18c60fd7aab:-7fe4','RUL-689492a6:18c60ee947f:-7614','water.facts.WaterBillSchedule','water.facts.WaterBillSchedule','WBS',0,NULL,NULL,NULL,NULL,NULL,0),('RC-50939045:18c60fd7aab:-7fe5','RUL-689492a6:18c60ee947f:-7614','treasury.facts.HolidayFact','treasury.facts.HolidayFact','HOLIDAYS',1,NULL,NULL,NULL,NULL,NULL,0),('RC-50939045:18c60fd7aab:-7ff1','RUL-689492a6:18c60ee947f:-793f','water.facts.WaterBillSchedule','water.facts.WaterBillSchedule','WBS',0,NULL,NULL,NULL,NULL,NULL,0),('RC-50939045:18c60fd7aab:-7ff2','RUL-689492a6:18c60ee947f:-793f','treasury.facts.HolidayFact','treasury.facts.HolidayFact','HOLIDAYS',1,NULL,NULL,NULL,NULL,NULL,0),('RC-50939045:18c60fd7aab:-7ffb','RUL-689492a6:18c60ee947f:-7d9b','treasury.facts.HolidayFact','treasury.facts.HolidayFact','HOLIDAYS',1,NULL,NULL,NULL,NULL,NULL,0),('RC-50939045:18c60fd7aab:-7fff','RUL-689492a6:18c60ee947f:-7d9b','water.facts.WaterBillSchedule','water.facts.WaterBillSchedule','WBS',0,NULL,NULL,NULL,NULL,NULL,0),('RC2a849d8a:18aca9676a8:-7ff9','RUL-346b1972:18acb117570:-7c56','water.facts.WaterBillSchedule','water.facts.WaterBillSchedule','WBS',2,NULL,NULL,NULL,NULL,NULL,0),('RC2a849d8a:18aca9676a8:-7fff','RUL-346b1972:18acb117570:-7c56','water.facts.WaterBill','water.facts.WaterBill','WBILL',0,NULL,NULL,NULL,NULL,NULL,0),('RC5118db67:1851f22bb8d:-7ff4','RUL-5bdd949d:1851f0d205d:-7643','treasury.facts.CreditBillItem','treasury.facts.CreditBillItem','CRBILL',0,NULL,NULL,NULL,NULL,NULL,0),('RC53bee69f:188e6ecc2a9:-7ff8','RUL634529e7:188e6b97ac9:-7aac','water.facts.WaterBill','water.facts.WaterBill','WBILL',1,NULL,NULL,NULL,NULL,NULL,0),('RC53bee69f:188e6ecc2a9:-7ffb','RUL634529e7:188e6b97ac9:-7aac','treasury.facts.TransactionDate','treasury.facts.TransactionDate',NULL,2,NULL,NULL,NULL,NULL,NULL,0),('RC53bee69f:188e6ecc2a9:-7ffd','RUL634529e7:188e6b97ac9:-7aac','water.facts.WaterTxn','water.facts.WaterTxn',NULL,0,NULL,NULL,NULL,NULL,NULL,0),('RC5be77a81:18e5a358870:-7ff1','RUL-5a798cf1:18e5a35a0b4:-7a3b','water.facts.WaterAccount','water.facts.WaterAccount',NULL,1,NULL,NULL,NULL,NULL,NULL,0),('RC5be77a81:18e5a358870:-7ff3','RUL-5a798cf1:18e5a35a0b4:-7a3b','water.facts.WaterBill','water.facts.WaterBill','WBILL',0,NULL,NULL,NULL,NULL,NULL,0),('RC5cff48f4:18a5f16cf2a:-7fdd','RULfb67ce3:18a5ef5cb85:-7a6f','water.facts.WaterAccount','water.facts.WaterAccount',NULL,1,NULL,NULL,NULL,NULL,NULL,0),('RC5cff48f4:18a5f16cf2a:-7fe0','RULfb67ce3:18a5ef5cb85:-7a6f','water.facts.WaterBill','water.facts.WaterBill','WBILL',0,NULL,NULL,NULL,NULL,NULL,0),('RC5cff48f4:18a5f16cf2a:-7fe6','RULfb67ce3:18a5ef5cb85:-7ad4','water.facts.WaterBill','water.facts.WaterBill','WBILL',0,NULL,NULL,NULL,NULL,NULL,0),('RC5cff48f4:18a5f16cf2a:-7fe8','RULfb67ce3:18a5ef5cb85:-7ad4','water.facts.WaterAccount','water.facts.WaterAccount',NULL,1,NULL,NULL,NULL,NULL,NULL,0),('RC5cff48f4:18a5f16cf2a:-7fed','RULfb67ce3:18a5ef5cb85:-7baf','water.facts.WaterAccount','water.facts.WaterAccount',NULL,1,NULL,NULL,NULL,NULL,NULL,0),('RC5cff48f4:18a5f16cf2a:-7ff0','RULfb67ce3:18a5ef5cb85:-7baf','water.facts.WaterBill','water.facts.WaterBill','WBILL',0,NULL,NULL,NULL,NULL,NULL,0),('RC5cff48f4:18a5f16cf2a:-7ff6','RULfb67ce3:18a5ef5cb85:-7bce','water.facts.WaterBill','water.facts.WaterBill','WBILL',0,NULL,NULL,NULL,NULL,NULL,0),('RC5cff48f4:18a5f16cf2a:-7ff8','RULfb67ce3:18a5ef5cb85:-7bce','water.facts.WaterAccount','water.facts.WaterAccount',NULL,1,NULL,NULL,NULL,NULL,NULL,0),('RC65270b36:1895d10e6f2:-7ffe','RUL287770ca:1895d0dd958:-7d6d','water.facts.WaterPaymentPlan','water.facts.WaterPaymentPlan',NULL,1,NULL,NULL,NULL,NULL,NULL,0),('RC65270b36:1895d10e6f2:-8000','RUL287770ca:1895d0dd958:-7d6d','water.facts.WaterTxn','water.facts.WaterTxn',NULL,0,NULL,NULL,NULL,NULL,NULL,0),('RC690c2690:1889fd3fa0e:-7ffe','RUL66638ced:1889f25c026:-7dc0','treasury.facts.HolidayFact','treasury.facts.HolidayFact','HOLIDAYS',1,NULL,NULL,NULL,NULL,NULL,0),('RC690c2690:1889fd3fa0e:-8000','RUL66638ced:1889f25c026:-7dc0','water.facts.WaterBillSchedule','water.facts.WaterBillSchedule','WBS',0,NULL,NULL,NULL,NULL,NULL,0),('RCcce69e1:1886997296a:-7ffe','RUL228733b9:18869839124:-700b','water.facts.WaterTxn','water.facts.WaterTxn',NULL,0,NULL,NULL,NULL,NULL,NULL,0),('RCOND-22e7de62:18c619db161:-77ff','RUL-22e7de62:18c619db161:-782b','water.facts.WaterBill','water.facts.WaterBill','WBILL',0,NULL,NULL,NULL,NULL,NULL,0),('RCOND-2524933:189520f3f6b:-7c39','RUL-2524933:189520f3f6b:-7ce4','water.facts.WaterTxn','water.facts.WaterTxn',NULL,0,NULL,NULL,NULL,NULL,NULL,0),('RCOND-4fd33246:1886967af53:-7d0e','RUL1fe7cfee:18869517acb:-786e','water.facts.WaterTxn','water.facts.WaterTxn',NULL,0,NULL,NULL,NULL,NULL,NULL,0),('RCOND-62d5b87:18cd865ce1a:-663c','RUL-62d5b87:18cd865ce1a:-6750','water.facts.WaterAccount','water.facts.WaterAccount',NULL,1,NULL,NULL,NULL,NULL,NULL,0),('RCOND-62d5b87:18cd865ce1a:-66f7','RUL-62d5b87:18cd865ce1a:-6750','water.facts.WaterBill','water.facts.WaterBill','WBILL',0,NULL,NULL,NULL,NULL,NULL,0),('RCOND-62d5b87:18cd865ce1a:-6d23','RUL-62d5b87:18cd865ce1a:-7bbc','treasury.facts.HolidayFact','treasury.facts.HolidayFact','HOLIDAYS',1,NULL,NULL,NULL,NULL,NULL,0),('RCOND-62d5b87:18cd865ce1a:-7b8e','RUL-62d5b87:18cd865ce1a:-7bbc','water.facts.WaterBillSchedule','water.facts.WaterBillSchedule','WBS',0,NULL,NULL,NULL,NULL,NULL,0),('RCOND-689492a6:18c60ee947f:-65af','RUL-689492a6:18c60ee947f:-6d73','treasury.facts.SurchargeItem','treasury.facts.SurchargeItem','',2,NULL,NULL,NULL,NULL,NULL,1),('RCOND-689492a6:18c60ee947f:-6ac2','RUL-689492a6:18c60ee947f:-6d73','water.facts.WaterBillItem','water.facts.WaterBillItem','BILLITEM',1,NULL,NULL,NULL,NULL,NULL,0),('RCOND-689492a6:18c60ee947f:-6cf9','RUL-689492a6:18c60ee947f:-6d73','water.facts.WaterBill','water.facts.WaterBill','WBILL',0,NULL,NULL,NULL,NULL,NULL,0),('RCOND-689492a6:18c60ee947f:-6fcf','RUL-689492a6:18c60ee947f:-71e6','water.facts.WaterBill','water.facts.WaterBill','WBILL',0,NULL,NULL,NULL,NULL,NULL,0),('RCOND-72f22338:18521353cbd:-766d','RUL-72f22338:18521353cbd:-7e32','water.facts.WaterBillItem','water.facts.WaterBillItem','',2,NULL,NULL,NULL,NULL,NULL,1),('RCOND-72f22338:18521353cbd:-79a4','RUL-72f22338:18521353cbd:-7e32','water.facts.WaterBillItem','water.facts.WaterBillItem','BILLITEM',1,NULL,NULL,NULL,NULL,NULL,0),('RCOND-72f22338:18521353cbd:-7d19','RUL-72f22338:18521353cbd:-7e32','treasury.facts.Payment','treasury.facts.Payment','PMT',0,NULL,NULL,NULL,NULL,NULL,0),('RCOND228733b9:18869839124:-6f56','RUL228733b9:18869839124:-700b','water.facts.WaterPaymentPlan','water.facts.WaterPaymentPlan',NULL,1,NULL,NULL,NULL,NULL,NULL,0),('RCOND228733b9:18869839124:-7c8c','RUL1fe7cfee:18869517acb:-786e','water.facts.WaterBill','water.facts.WaterBill','',1,NULL,NULL,NULL,NULL,NULL,1),('RCOND2a0555f7:18cecb153f1:-5885','RUL2a0555f7:18cecb153f1:-6cd8','treasury.facts.SurchargeItem','treasury.facts.SurchargeItem','',2,NULL,NULL,NULL,NULL,NULL,1),('RCOND2a0555f7:18cecb153f1:-65c6','RUL2a0555f7:18cecb153f1:-6cd8','water.facts.WaterBillItem','water.facts.WaterBillItem','BILLITEM',1,NULL,NULL,NULL,NULL,NULL,0),('RCOND2a0555f7:18cecb153f1:-6c36','RUL2a0555f7:18cecb153f1:-6cd8','water.facts.WaterBill','water.facts.WaterBill','WBILL',0,NULL,NULL,NULL,NULL,NULL,0),('RCOND3c37d24d:17f1ac2fff3:-7c89','RUL-21685239:17b6cdabf45:-7520','treasury.facts.AbstractBillItem','treasury.facts.AbstractBillItem','ABILLITEM',1,NULL,NULL,NULL,NULL,NULL,0),('RCOND4e803530:1887047c12e:-7bf3','RUL4e803530:1887047c12e:-7e68','water.facts.WaterPaymentPlan','water.facts.WaterPaymentPlan',NULL,1,NULL,NULL,NULL,NULL,NULL,0),('RCOND4e803530:1887047c12e:-7dba','RUL4e803530:1887047c12e:-7e68','water.facts.WaterBill','water.facts.WaterBill','WBILL',0,NULL,NULL,NULL,NULL,NULL,0),('RCOND61e00012:187074846ff:-5e81','RUL61e00012:187074846ff:-6223','treasury.facts.HolidayFact','treasury.facts.HolidayFact','HOLIDAYS',1,NULL,NULL,NULL,NULL,NULL,0),('RCOND61e00012:187074846ff:-61eb','RUL61e00012:187074846ff:-6223','water.facts.WaterBillSchedule','water.facts.WaterBillSchedule','WBS',0,NULL,NULL,NULL,NULL,NULL,0),('RCOND61e00012:187074846ff:-6568','RUL61e00012:187074846ff:-65a0','water.facts.WaterBillSchedule','water.facts.WaterBillSchedule','WBS',0,NULL,NULL,NULL,NULL,NULL,0),('RCOND61e00012:187074846ff:-6c10','RUL61e00012:187074846ff:-6dcb','treasury.facts.VarInteger','treasury.facts.VarInteger',NULL,2,NULL,NULL,NULL,NULL,NULL,0),('RCOND61e00012:187074846ff:-6c4a','RUL61e00012:187074846ff:-6dcb','treasury.facts.HolidayFact','treasury.facts.HolidayFact','HOLIDAYS',1,NULL,NULL,NULL,NULL,NULL,0),('RCOND61e00012:187074846ff:-6d95','RUL61e00012:187074846ff:-6dcb','water.facts.WaterBillSchedule','water.facts.WaterBillSchedule','WBS',0,NULL,NULL,NULL,NULL,NULL,0),('RCOND7834f671:18b2e3ebb80:-7096','RUL7834f671:18b2e3ebb80:-73bc','water.facts.WaterBillItem','water.facts.WaterBillItem','BILLITEM',1,NULL,NULL,NULL,NULL,NULL,0),('RCOND7834f671:18b2e3ebb80:-722f','RUL7834f671:18b2e3ebb80:-73bc','water.facts.WaterBill','water.facts.WaterBill','WBILL',0,NULL,NULL,NULL,NULL,NULL,0),('RCOND7834f671:18b2e3ebb80:-7b90','RUL7834f671:18b2e3ebb80:-7d64','water.facts.WaterBill','water.facts.WaterBill','WBILL',0,NULL,NULL,NULL,NULL,NULL,0),('RCOND7b73bf4:1850ee0fd3b:-7b8a','RUL7b73bf4:1850ee0fd3b:-7eed','water.facts.WaterBill','water.facts.WaterBill','WBILL',2,NULL,NULL,NULL,NULL,NULL,0),('RCOND7b73bf4:1850ee0fd3b:-7d0e','RUL7b73bf4:1850ee0fd3b:-7eed','treasury.facts.TransactionDate','treasury.facts.TransactionDate',NULL,1,NULL,NULL,NULL,NULL,NULL,0),('RCOND7b73bf4:1850ee0fd3b:-7e97','RUL7b73bf4:1850ee0fd3b:-7eed','water.facts.WaterBillSchedule','water.facts.WaterBillSchedule','WBS',0,NULL,NULL,NULL,NULL,NULL,0),('RCONDc8dbf18:1870773e513:-7577','RULc8dbf18:1870773e513:-75af','water.facts.WaterBillSchedule','water.facts.WaterBillSchedule','WBS',0,NULL,NULL,NULL,NULL,NULL,0),('RCONDc8dbf18:1870773e513:-7941','RULc8dbf18:1870773e513:-7a3e','treasury.facts.HolidayFact','treasury.facts.HolidayFact','HOLIDAYS',1,NULL,NULL,NULL,NULL,NULL,0),('RCONDc8dbf18:1870773e513:-7a06','RULc8dbf18:1870773e513:-7a3e','water.facts.WaterBillSchedule','water.facts.WaterBillSchedule','WBS',0,NULL,NULL,NULL,NULL,NULL,0);
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
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `parentid` (`parentid`) USING BTREE,
  KEY `sys_rule_condition_constraint_fact_field` (`field_objid`) USING BTREE,
  KEY `var_objid` (`var_objid`) USING BTREE,
  CONSTRAINT `sys_rule_condition_constraint_fact_field` FOREIGN KEY (`field_objid`) REFERENCES `sys_rule_fact_field` (`objid`),
  CONSTRAINT `sys_rule_condition_constraint_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_condition` (`objid`),
  CONSTRAINT `sys_rule_condition_constraint_ibfk_2` FOREIGN KEY (`var_objid`) REFERENCES `sys_rule_condition_var` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_condition_constraint`
--

LOCK TABLES `sys_rule_condition_constraint` WRITE;
/*!40000 ALTER TABLE `sys_rule_condition_constraint` DISABLE KEYS */;
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-3573de3e:18b2d22ab69:-7fb3','RC-3573de3e:18b2d22ab69:-7fb4','water.facts.WaterBill.yearmonth','yearmonth','BYM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC-3573de3e:18b2d22ab69:-7fb5','RC-3573de3e:18b2d22ab69:-7fb7','water.facts.WaterBillItem.objid','objid','BREFID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC-3573de3e:18b2d22ab69:-7fb6','RC-3573de3e:18b2d22ab69:-7fb7','water.facts.WaterBillItem.yearmonth','yearmonth',NULL,'less than','<',1,'RCC-3573de3e:18b2d22ab69:-7fb3','BYM',NULL,NULL,NULL,NULL,NULL,1),('RCC-3573de3e:18b2d22ab69:-7fb8','RC-3573de3e:18b2d22ab69:-7fba','treasury.facts.PaymentItem.amount','amount','AMT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCC-3573de3e:18b2d22ab69:-7fb9','RC-3573de3e:18b2d22ab69:-7fba','treasury.facts.PaymentItem.billitemrefid','billitemrefid',NULL,'equals','==',NULL,'RCC-3573de3e:18b2d22ab69:-7fbc','OBJID',NULL,NULL,NULL,NULL,NULL,0),('RCC-3573de3e:18b2d22ab69:-7fbb','RC-3573de3e:18b2d22ab69:-7fbd','treasury.facts.SurchargeItem.billitemrefid','billitemrefid',NULL,'equal to','==',1,NULL,'BREFID',NULL,NULL,NULL,NULL,NULL,1),('RCC-3573de3e:18b2d22ab69:-7fbc','RC-3573de3e:18b2d22ab69:-7fbd','treasury.facts.SurchargeItem.objid','objid','OBJID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC-3573de3e:18b2d22ab69:-7fc3','RC-3573de3e:18b2d22ab69:-7fc4','treasury.facts.SurchargeItem.objid','objid','OBJID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC-3573de3e:18b2d22ab69:-7fc5','RC-3573de3e:18b2d22ab69:-7fc7','treasury.facts.PaymentItem.billitemrefid','billitemrefid',NULL,'equals','==',NULL,'RCC-3573de3e:18b2d22ab69:-7fc3','OBJID',NULL,NULL,NULL,NULL,NULL,0),('RCC-3573de3e:18b2d22ab69:-7fc6','RC-3573de3e:18b2d22ab69:-7fc7','treasury.facts.PaymentItem.amount','amount','AMT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCC-3573de3e:18b2d22ab69:-7fcf','RC-3573de3e:18b2d22ab69:-7fd0','water.facts.WaterBill.yearmonth','yearmonth','BYM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC-3573de3e:18b2d22ab69:-7fd1','RC-3573de3e:18b2d22ab69:-7fd3','treasury.facts.PaymentItem.billitemrefid','billitemrefid',NULL,'equals','==',NULL,'RCC-3573de3e:18b2d22ab69:-7fd5','OBJID',NULL,NULL,NULL,NULL,NULL,0),('RCC-3573de3e:18b2d22ab69:-7fd2','RC-3573de3e:18b2d22ab69:-7fd3','treasury.facts.PaymentItem.amount','amount','AMT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCC-3573de3e:18b2d22ab69:-7fd4','RC-3573de3e:18b2d22ab69:-7fd9','water.facts.WaterBillItem.yearmonth','yearmonth',NULL,'less than','<',1,'RCC-3573de3e:18b2d22ab69:-7fcf','BYM',NULL,NULL,NULL,NULL,NULL,4),('RCC-3573de3e:18b2d22ab69:-7fd5','RC-3573de3e:18b2d22ab69:-7fd9','water.facts.WaterBillItem.objid','objid','OBJID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCC-3573de3e:18b2d22ab69:-7fd7','RC-3573de3e:18b2d22ab69:-7fd9','water.facts.WaterBillItem.year','year','YR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCC-3573de3e:18b2d22ab69:-7fd8','RC-3573de3e:18b2d22ab69:-7fd9','water.facts.WaterBillItem.month','month','MON',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),('RCC-3573de3e:18b2d22ab69:-7fda','RC-3573de3e:18b2d22ab69:-7fdb','water.facts.WaterAccount.acctno','acctno','ACCTNO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC-3573de3e:18b2d22ab69:-7fe2','RC-3573de3e:18b2d22ab69:-7fe3','water.facts.WaterAccount.acctno','acctno','ACCTNO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC-3573de3e:18b2d22ab69:-7fe4','RC-3573de3e:18b2d22ab69:-7fe8','water.facts.WaterBillItem.month','month','MON',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),('RCC-3573de3e:18b2d22ab69:-7fe5','RC-3573de3e:18b2d22ab69:-7fe8','water.facts.WaterBillItem.year','year','YR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCC-3573de3e:18b2d22ab69:-7fe6','RC-3573de3e:18b2d22ab69:-7fe8','water.facts.WaterBillItem.discount','discount','DISC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),('RCC-3573de3e:18b2d22ab69:-7fe7','RC-3573de3e:18b2d22ab69:-7fe8','water.facts.WaterBillItem.objid','objid','OBJID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCC-3573de3e:18b2d22ab69:-7fe9','RC-3573de3e:18b2d22ab69:-7feb','treasury.facts.PaymentItem.amount','amount','AMT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCC-3573de3e:18b2d22ab69:-7fea','RC-3573de3e:18b2d22ab69:-7feb','treasury.facts.PaymentItem.billitemrefid','billitemrefid',NULL,'equals','==',NULL,'RCC-3573de3e:18b2d22ab69:-7fe7','OBJID',NULL,NULL,NULL,NULL,NULL,0),('RCC-4c00ed59:18cd865480c:-7fda','RC-4c00ed59:18cd865480c:-7fdb','water.facts.WaterBill.volume','volume','VOL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC-50939045:18c60fd7aab:-7fb8','RC-50939045:18c60fd7aab:-7fb9','treasury.facts.Payment.amount','amount','AMT','greater than','>',NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,0),('RCC-50939045:18c60fd7aab:-7fc2','RC-50939045:18c60fd7aab:-7fc5','water.facts.WaterBillItem.acctid','acctid',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"WATER_BILL\",value:\"WATER BILL\"]]',NULL,3),('RCC-50939045:18c60fd7aab:-7fc3','RC-50939045:18c60fd7aab:-7fc5','water.facts.WaterBillItem.balance','balance','AMT','greater than','>',NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,0),('RCC-50939045:18c60fd7aab:-7fc4','RC-50939045:18c60fd7aab:-7fc5','water.facts.WaterBillItem.objid','objid','ITEMID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),('RCC-50939045:18c60fd7aab:-7fc6','RC-50939045:18c60fd7aab:-7fc7','water.facts.WaterBillSchedule.duedate','duedate','DUEDATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC-50939045:18c60fd7aab:-7fc8','RC-50939045:18c60fd7aab:-7fc9','treasury.facts.TransactionDate.date','date',NULL,'after','>',1,NULL,'DUEDATE',NULL,NULL,NULL,NULL,NULL,0),('RCC-50939045:18c60fd7aab:-7fca','RC-50939045:18c60fd7aab:-7fcb','treasury.facts.SurchargeItem.billitemrefid','billitemrefid',NULL,'equal to','==',1,NULL,'ITEMID',NULL,NULL,NULL,NULL,NULL,0),('RCC-50939045:18c60fd7aab:-7fd4','RC-50939045:18c60fd7aab:-7fd7','water.facts.WaterBillSchedule.name','name',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"C3\",value:\"C3\"]]',NULL,0),('RCC-50939045:18c60fd7aab:-7fd5','RC-50939045:18c60fd7aab:-7fd7','water.facts.WaterBillSchedule.month','month','MON',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),('RCC-50939045:18c60fd7aab:-7fd6','RC-50939045:18c60fd7aab:-7fd7','water.facts.WaterBillSchedule.year','year','YR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCC-50939045:18c60fd7aab:-7fe1','RC-50939045:18c60fd7aab:-7fe4','water.facts.WaterBillSchedule.name','name',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"C2\",value:\"C2\"]]',NULL,0),('RCC-50939045:18c60fd7aab:-7fe2','RC-50939045:18c60fd7aab:-7fe4','water.facts.WaterBillSchedule.month','month','MON',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),('RCC-50939045:18c60fd7aab:-7fe3','RC-50939045:18c60fd7aab:-7fe4','water.facts.WaterBillSchedule.year','year','YR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCC-50939045:18c60fd7aab:-7fee','RC-50939045:18c60fd7aab:-7ff1','water.facts.WaterBillSchedule.name','name',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"C4\",value:\"C4\"]]',NULL,0),('RCC-50939045:18c60fd7aab:-7fef','RC-50939045:18c60fd7aab:-7ff1','water.facts.WaterBillSchedule.month','month','MON',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),('RCC-50939045:18c60fd7aab:-7ff0','RC-50939045:18c60fd7aab:-7ff1','water.facts.WaterBillSchedule.year','year','YR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCC-50939045:18c60fd7aab:-7ffc','RC-50939045:18c60fd7aab:-7fff','water.facts.WaterBillSchedule.year','year','YR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCC-50939045:18c60fd7aab:-7ffd','RC-50939045:18c60fd7aab:-7fff','water.facts.WaterBillSchedule.month','month','MON',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),('RCC-50939045:18c60fd7aab:-7ffe','RC-50939045:18c60fd7aab:-7fff','water.facts.WaterBillSchedule.name','name',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"C1\",value:\"C1\"]]',NULL,0),('RCC2a849d8a:18aca9676a8:-7ff8','RC2a849d8a:18aca9676a8:-7ff9','water.facts.WaterBillSchedule.duedate','duedate','DUEDATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC2a849d8a:18aca9676a8:-7ffa','RC2a849d8a:18aca9676a8:-7fff','water.facts.WaterBill.rate','rate','RATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5),('RCC2a849d8a:18aca9676a8:-7ffb','RC2a849d8a:18aca9676a8:-7fff','water.facts.WaterBill.state','state',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[\"POSTED\"]',NULL,4),('RCC2a849d8a:18aca9676a8:-7ffc','RC2a849d8a:18aca9676a8:-7fff','water.facts.WaterBill.billdate','billdate','BDATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),('RCC2a849d8a:18aca9676a8:-7ffd','RC2a849d8a:18aca9676a8:-7fff','water.facts.WaterBill.month','month','MON',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),('RCC2a849d8a:18aca9676a8:-7ffe','RC2a849d8a:18aca9676a8:-7fff','water.facts.WaterBill.year','year','YR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCC53bee69f:188e6ecc2a9:-7ff6','RC53bee69f:188e6ecc2a9:-7ff8','water.facts.WaterBill.year','year','BYR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC53bee69f:188e6ecc2a9:-7ff7','RC53bee69f:188e6ecc2a9:-7ff8','water.facts.WaterBill.month','month','BMON',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCC53bee69f:188e6ecc2a9:-7ff9','RC53bee69f:188e6ecc2a9:-7ffb','treasury.facts.TransactionDate.year','year','YR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC53bee69f:188e6ecc2a9:-7ffa','RC53bee69f:188e6ecc2a9:-7ffb','treasury.facts.TransactionDate.month','month','MON',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCC53bee69f:188e6ecc2a9:-7ffc','RC53bee69f:188e6ecc2a9:-7ffd','water.facts.WaterTxn.typeid','typeid',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"RECONNECTION\",value:\"RECONNECTION\"]]',NULL,0),('RCC5be77a81:18e5a358870:-7ff0','RC5be77a81:18e5a358870:-7ff1','water.facts.WaterAccount.classificationid','classificationid',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"INDUSTRIAL\",value:\"INDUSTRIAL\"]]',NULL,0),('RCC5be77a81:18e5a358870:-7ff2','RC5be77a81:18e5a358870:-7ff3','water.facts.WaterBill.volume','volume','VOL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC5cff48f4:18a5f16cf2a:-7fdc','RC5cff48f4:18a5f16cf2a:-7fdd','water.facts.WaterAccount.classificationid','classificationid',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"RESIDENTIAL\",value:\"RESIDENTIAL\"],[key:\"GOVERNMENT\",value:\"GOVERNMENT\"]]',NULL,0),('RCC5cff48f4:18a5f16cf2a:-7fde','RC5cff48f4:18a5f16cf2a:-7fe0','water.facts.WaterBill.volume','volume','VOL','less than or equal to','<=',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),('RCC5cff48f4:18a5f16cf2a:-7fdf','RC5cff48f4:18a5f16cf2a:-7fe0','water.facts.WaterBill.rate','rate',NULL,'equal to','==',NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,1),('RCC5cff48f4:18a5f16cf2a:-7fe4','RC5cff48f4:18a5f16cf2a:-7fe6','water.facts.WaterBill.volume','volume','VOL','greater than','>',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),('RCC5cff48f4:18a5f16cf2a:-7fe5','RC5cff48f4:18a5f16cf2a:-7fe6','water.facts.WaterBill.rate','rate',NULL,'equal to','==',NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,1),('RCC5cff48f4:18a5f16cf2a:-7fe7','RC5cff48f4:18a5f16cf2a:-7fe8','water.facts.WaterAccount.classificationid','classificationid',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"RESIDENTIAL\",value:\"RESIDENTIAL\"],[key:\"GOVERNMENT\",value:\"GOVERNMENT\"]]',NULL,0),('RCC5cff48f4:18a5f16cf2a:-7fec','RC5cff48f4:18a5f16cf2a:-7fed','water.facts.WaterAccount.classificationid','classificationid',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"COMMERCIAL\",value:\"COMMERCIAL\"]]',NULL,0),('RCC5cff48f4:18a5f16cf2a:-7fee','RC5cff48f4:18a5f16cf2a:-7ff0','water.facts.WaterBill.volume','volume','VOL','greater than','>',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),('RCC5cff48f4:18a5f16cf2a:-7fef','RC5cff48f4:18a5f16cf2a:-7ff0','water.facts.WaterBill.rate','rate',NULL,'equal to','==',NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,1),('RCC5cff48f4:18a5f16cf2a:-7ff4','RC5cff48f4:18a5f16cf2a:-7ff6','water.facts.WaterBill.rate','rate',NULL,'equal to','==',NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,1),('RCC5cff48f4:18a5f16cf2a:-7ff5','RC5cff48f4:18a5f16cf2a:-7ff6','water.facts.WaterBill.volume','volume','VOL','less than or equal to','<=',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),('RCC5cff48f4:18a5f16cf2a:-7ff7','RC5cff48f4:18a5f16cf2a:-7ff8','water.facts.WaterAccount.classificationid','classificationid',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"COMMERCIAL\",value:\"COMMERCIAL\"]]',NULL,0),('RCC65270b36:1895d10e6f2:-7ffd','RC65270b36:1895d10e6f2:-7ffe','water.facts.WaterPaymentPlan.downpayment','downpayment','DP',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCC65270b36:1895d10e6f2:-7fff','RC65270b36:1895d10e6f2:-8000','water.facts.WaterTxn.typeid','typeid',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"NEW_ACCOUNT\",value:\"NEW_ACCOUNT\"]]',NULL,0),('RCC690c2690:1889fd3fa0e:-7fff','RC690c2690:1889fd3fa0e:-8000','water.facts.WaterBillSchedule.readingduedate','readingduedate','READINGDUEDATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCCcce69e1:1886997296a:-7ffd','RCcce69e1:1886997296a:-7ffe','water.facts.WaterTxn.typeid','typeid',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"RECONNECTION\",value:\"RECONNECTION\"],[key:\"PAYMENT_PLAN\",value:\"PAYMENT_PLAN\"]]',NULL,0),('RCONST-22e7de62:18c619db161:-7791','RCOND-22e7de62:18c619db161:-77ff','water.facts.WaterBill.volume','volume','VOL','greater than','>',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),('RCONST-2524933:189520f3f6b:-7c29','RCOND-2524933:189520f3f6b:-7c39','water.facts.WaterTxn.typeid','typeid',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"NEW_ACCOUNT\",value:\"NEW_ACCOUNT\"]]',NULL,0),('RCONST-4fd33246:1886967af53:-7cfe','RCOND-4fd33246:1886967af53:-7d0e','water.facts.WaterTxn.typeid','typeid',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"RECONNECTION\",value:\"RECONNECTION\"]]',NULL,0),('RCONST-5a798cf1:18e5a35a0b4:-7ce8','RC-4c00ed59:18cd865480c:-7fdd','water.facts.WaterAccount.classificationid','classificationid',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"COMMERCIAL\",value:\"COMMERCIAL\"]]',NULL,0),('RCONST-62d5b87:18cd865ce1a:-661b','RCOND-62d5b87:18cd865ce1a:-663c','water.facts.WaterAccount.classificationid','classificationid',NULL,'is any of the ff.','matches',0,NULL,NULL,NULL,NULL,NULL,'[[key:\"RESIDENTIAL\",value:\"RESIDENTIAL\"]]',NULL,0),('RCONST-62d5b87:18cd865ce1a:-6693','RCOND-62d5b87:18cd865ce1a:-66f7','water.facts.WaterBill.volume','volume','VOL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONST-62d5b87:18cd865ce1a:-7a2a','RCOND-62d5b87:18cd865ce1a:-7b8e','water.facts.WaterBillSchedule.month','month','MON',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),('RCONST-62d5b87:18cd865ce1a:-7aa5','RCOND-62d5b87:18cd865ce1a:-7b8e','water.facts.WaterBillSchedule.year','year','YR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCONST-62d5b87:18cd865ce1a:-7b39','RCOND-62d5b87:18cd865ce1a:-7b8e','water.facts.WaterBillSchedule.name','name',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"S1\",value:\"S1\"]]',NULL,0),('RCONST-689492a6:18c60ee947f:-6544','RCOND-689492a6:18c60ee947f:-65af','treasury.facts.SurchargeItem.billitemrefid','billitemrefid',NULL,'equal to','==',1,'RCONST-689492a6:18c60ee947f:-6836','ITEMID',NULL,NULL,NULL,NULL,NULL,0),('RCONST-689492a6:18c60ee947f:-66c3','RCOND-689492a6:18c60ee947f:-6ac2','water.facts.WaterBillItem.acctid','acctid',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"WATER_BILL\",value:\"WATER BILL\"]]',NULL,3),('RCONST-689492a6:18c60ee947f:-6836','RCOND-689492a6:18c60ee947f:-6ac2','water.facts.WaterBillItem.objid','objid','ITEMID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),('RCONST-689492a6:18c60ee947f:-6970','RCOND-689492a6:18c60ee947f:-6ac2','water.facts.WaterBillItem.yearmonth','yearmonth',NULL,'less than','<',1,'RCONST-689492a6:18c60ee947f:-6c76','BYM',NULL,NULL,NULL,NULL,NULL,1),('RCONST-689492a6:18c60ee947f:-6a61','RCOND-689492a6:18c60ee947f:-6ac2','water.facts.WaterBillItem.amount','amount','AMT','greater than','>',NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,0),('RCONST-689492a6:18c60ee947f:-6bac','RCOND-689492a6:18c60ee947f:-6cf9','water.facts.WaterBill.billdate','billdate','BILLDATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCONST-689492a6:18c60ee947f:-6c76','RCOND-689492a6:18c60ee947f:-6cf9','water.facts.WaterBill.yearmonth','yearmonth','BYM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONST-689492a6:18c60ee947f:-6e70','RC-50939045:18c60fd7aab:-7fc5','water.facts.WaterBillItem.yearmonth','yearmonth',NULL,'equal to','==',1,'RCONST-689492a6:18c60ee947f:-6f6e','BYM',NULL,NULL,NULL,NULL,NULL,3),('RCONST-689492a6:18c60ee947f:-6f6e','RCOND-689492a6:18c60ee947f:-6fcf','water.facts.WaterBill.yearmonth','yearmonth','BYM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONST-72f22338:18521353cbd:-740a','RCOND-72f22338:18521353cbd:-766d','water.facts.WaterBillItem.yearmonth','yearmonth',NULL,'less than','<',1,'RCONST-72f22338:18521353cbd:-774a','YM',NULL,NULL,NULL,NULL,NULL,1),('RCONST-72f22338:18521353cbd:-7569','RCOND-72f22338:18521353cbd:-766d','water.facts.WaterBillItem.paid','paid',NULL,'not true','== false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONST-72f22338:18521353cbd:-774a','RCOND-72f22338:18521353cbd:-79a4','water.facts.WaterBillItem.yearmonth','yearmonth','YM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCONST-72f22338:18521353cbd:-7894','RCOND-72f22338:18521353cbd:-79a4','water.facts.WaterBillItem.paid','paid',NULL,'not true','== false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONST-72f22338:18521353cbd:-7d03','RCOND-72f22338:18521353cbd:-7d19','treasury.facts.Payment.amount','amount',NULL,'greater than','>',NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,0),('RCONST228733b9:18869839124:-6f2e','RCOND228733b9:18869839124:-6f56','water.facts.WaterPaymentPlan.downpayment','downpayment','DP',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONST2a0555f7:18cecb153f1:-5840','RCOND2a0555f7:18cecb153f1:-5885','treasury.facts.SurchargeItem.billitemrefid','billitemrefid',NULL,'equal to','==',1,'RCONST2a0555f7:18cecb153f1:-63db','BILLITEMID',NULL,NULL,NULL,NULL,NULL,0),('RCONST2a0555f7:18cecb153f1:-5c52','RCOND2a0555f7:18cecb153f1:-6c36','water.facts.WaterBill.billdate','billdate','BILLDATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCONST2a0555f7:18cecb153f1:-61c8','RCOND2a0555f7:18cecb153f1:-65c6','water.facts.WaterBillItem.balance','balance','BAL','greater than','>',NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,2),('RCONST2a0555f7:18cecb153f1:-63db','RCOND2a0555f7:18cecb153f1:-65c6','water.facts.WaterBillItem.objid','objid','BILLITEMID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCONST2a0555f7:18cecb153f1:-6539','RCOND2a0555f7:18cecb153f1:-65c6','water.facts.WaterBillItem.yearmonth','yearmonth',NULL,'less than','<',1,'RCONST2a0555f7:18cecb153f1:-66cf','BYM',NULL,NULL,NULL,NULL,NULL,0),('RCONST2a0555f7:18cecb153f1:-66cf','RCOND2a0555f7:18cecb153f1:-6c36','water.facts.WaterBill.yearmonth','yearmonth','BYM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),('RCONST3048fa3a:18871bcfa7d:-7c90','RCOND4e803530:1887047c12e:-7dba','water.facts.WaterBill.billdate','billdate','BDATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),('RCONST396bc69f:1887204eb56:-7805','RCOND4e803530:1887047c12e:-7bf3','water.facts.WaterPaymentPlan.objid','objid','PMTID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5),('RCONST3c37d24d:17f1ac2fff3:-7c63','RCOND3c37d24d:17f1ac2fff3:-7c89','treasury.facts.AbstractBillItem.amount','amount',NULL,'equal to','==',NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,0),('RCONST4e803530:1887047c12e:-73fb','RCOND4e803530:1887047c12e:-7bf3','water.facts.WaterPaymentPlan.billcount','billcount','BCOUNT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4),('RCONST4e803530:1887047c12e:-7814','RCOND4e803530:1887047c12e:-7bf3','water.facts.WaterPaymentPlan.term','term','TERM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),('RCONST4e803530:1887047c12e:-7ae3','RCOND4e803530:1887047c12e:-7bf3','water.facts.WaterPaymentPlan.principal','principal','PAMT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),('RCONST4e803530:1887047c12e:-7b4b','RCOND4e803530:1887047c12e:-7bf3','water.facts.WaterPaymentPlan.installmentamt','installmentamt','IAMT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCONST4e803530:1887047c12e:-7bb3','RCOND4e803530:1887047c12e:-7bf3','water.facts.WaterPaymentPlan.txntypeid','txntypeid',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"RECONNECTION\",value:\"RECONNECTION\"]]',NULL,0),('RCONST4e803530:1887047c12e:-7cc9','RCOND4e803530:1887047c12e:-7dba','water.facts.WaterBill.month','month','BMON',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCONST4e803530:1887047c12e:-7d4e','RCOND4e803530:1887047c12e:-7dba','water.facts.WaterBill.year','year','BYR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONST56bd88b9:18523203cd8:-785e','RC5118db67:1851f22bb8d:-7ff4','treasury.facts.CreditBillItem.unusedbalance','unusedbalance','AMT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONST61e00012:187074846ff:-617d','RCOND61e00012:187074846ff:-61eb','water.facts.WaterBillSchedule.readingdate','readingdate','READINGDATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONST61e00012:187074846ff:-64fe','RCOND61e00012:187074846ff:-6568','water.facts.WaterBillSchedule.todate','todate','TODATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONST61e00012:187074846ff:-6bc9','RCOND61e00012:187074846ff:-6c10','treasury.facts.VarInteger.value','value','DAYS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCONST61e00012:187074846ff:-6bf4','RCOND61e00012:187074846ff:-6c10','treasury.facts.VarInteger.tag','tag',NULL,'equal to','==',NULL,NULL,NULL,NULL,NULL,'day',NULL,NULL,0),('RCONST61e00012:187074846ff:-6cb8','RCOND61e00012:187074846ff:-6d95','water.facts.WaterBillSchedule.month','month','MON',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCONST61e00012:187074846ff:-6d33','RCOND61e00012:187074846ff:-6d95','water.facts.WaterBillSchedule.year','year','YR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONST7834f671:18b2e3ebb80:-6d72','RC-3573de3e:18b2d22ab69:-7fc4','treasury.facts.SurchargeItem.billitemrefid','billitemrefid',NULL,'equal to','==',1,'RCONST7834f671:18b2e3ebb80:-7032','BREFID',NULL,NULL,NULL,NULL,NULL,1),('RCONST7834f671:18b2e3ebb80:-6e9a','RCOND7834f671:18b2e3ebb80:-7096','water.facts.WaterBillItem.yearmonth','yearmonth',NULL,'equal to','==',1,'RCONST7834f671:18b2e3ebb80:-71b5','BYM',NULL,NULL,NULL,NULL,NULL,1),('RCONST7834f671:18b2e3ebb80:-7032','RCOND7834f671:18b2e3ebb80:-7096','water.facts.WaterBillItem.objid','objid','BREFID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONST7834f671:18b2e3ebb80:-71b5','RCOND7834f671:18b2e3ebb80:-722f','water.facts.WaterBill.yearmonth','yearmonth','BYM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONST7834f671:18b2e3ebb80:-78ee','RC-3573de3e:18b2d22ab69:-7fe8','water.facts.WaterBillItem.yearmonth','yearmonth',NULL,'equal to','==',1,'RCONST7834f671:18b2e3ebb80:-7b16','BYM',NULL,NULL,NULL,NULL,NULL,4),('RCONST7834f671:18b2e3ebb80:-7b16','RCOND7834f671:18b2e3ebb80:-7b90','water.facts.WaterBill.yearmonth','yearmonth','BYM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONST7b73bf4:1850ee0fd3b:-7ce0','RCOND7b73bf4:1850ee0fd3b:-7d0e','treasury.facts.TransactionDate.date','date','TDATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONST7b73bf4:1850ee0fd3b:-7dce','RCOND7b73bf4:1850ee0fd3b:-7e97','water.facts.WaterBillSchedule.expirydate','expirydate','EXPIRYDATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCONST7b73bf4:1850ee0fd3b:-7e3e','RCOND7b73bf4:1850ee0fd3b:-7e97','water.facts.WaterBillSchedule.duedate','duedate','DUEDATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONSTc8dbf18:1870773e513:-747b','RCONDc8dbf18:1870773e513:-7577','water.facts.WaterBillSchedule.discdate','discdate','DISCDATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONSTc8dbf18:1870773e513:-7992','RCONDc8dbf18:1870773e513:-7a06','water.facts.WaterBillSchedule.billingduedate','billingduedate','BILLINGDUEDATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0);
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
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `parentid` (`parentid`) USING BTREE,
  CONSTRAINT `sys_rule_condition_var_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_condition` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_condition_var`
--

LOCK TABLES `sys_rule_condition_var` WRITE;
/*!40000 ALTER TABLE `sys_rule_condition_var` DISABLE KEYS */;
INSERT INTO `sys_rule_condition_var` VALUES ('RC-3573de3e:18b2d22ab69:-7fb4','RC-3573de3e:18b2d22ab69:-7fb4','RUL7834f671:18b2e3ebb80:-6c69','WBILL','water.facts.WaterBill',0),('RC-3573de3e:18b2d22ab69:-7fb7','RC-3573de3e:18b2d22ab69:-7fb7','RUL7834f671:18b2e3ebb80:-6c69','BILLITEM','water.facts.WaterBillItem',1),('RC-3573de3e:18b2d22ab69:-7fbd','RC-3573de3e:18b2d22ab69:-7fbd','RUL7834f671:18b2e3ebb80:-6c69','SURCHG','treasury.facts.SurchargeItem',2),('RC-3573de3e:18b2d22ab69:-7fc4','RC-3573de3e:18b2d22ab69:-7fc4','RUL7834f671:18b2e3ebb80:-73bc','SURCHG','treasury.facts.SurchargeItem',2),('RC-3573de3e:18b2d22ab69:-7fd0','RC-3573de3e:18b2d22ab69:-7fd0','RUL7834f671:18b2e3ebb80:-76fb','WBILL','water.facts.WaterBill',0),('RC-3573de3e:18b2d22ab69:-7fd9','RC-3573de3e:18b2d22ab69:-7fd9','RUL7834f671:18b2e3ebb80:-76fb','BILLITEM','water.facts.WaterBillItem',1),('RC-3573de3e:18b2d22ab69:-7fe8','RC-3573de3e:18b2d22ab69:-7fe8','RUL7834f671:18b2e3ebb80:-7d64','BILLITEM','water.facts.WaterBillItem',1),('RC-4c00ed59:18cd865480c:-7fdb','RC-4c00ed59:18cd865480c:-7fdb','RUL-62d5b87:18cd865ce1a:-6280','WBILL','water.facts.WaterBill',0),('RC-50939045:18c60fd7aab:-7fb9','RC-50939045:18c60fd7aab:-7fb9','RUL-689492a6:18c60ee947f:-5dfa','PMT','treasury.facts.Payment',0),('RC-50939045:18c60fd7aab:-7fc5','RC-50939045:18c60fd7aab:-7fc5','RUL-689492a6:18c60ee947f:-71e6','BILLITEM','water.facts.WaterBillItem',1),('RC-50939045:18c60fd7aab:-7fc7','RC-50939045:18c60fd7aab:-7fc7','RUL-689492a6:18c60ee947f:-71e6','WBS','water.facts.WaterBillSchedule',2),('RC-50939045:18c60fd7aab:-7fd7','RC-50939045:18c60fd7aab:-7fd7','RUL-689492a6:18c60ee947f:-7603','WBS','water.facts.WaterBillSchedule',0),('RC-50939045:18c60fd7aab:-7fd8','RC-50939045:18c60fd7aab:-7fd8','RUL-689492a6:18c60ee947f:-7603','HOLIDAYS','treasury.facts.HolidayFact',1),('RC-50939045:18c60fd7aab:-7fe4','RC-50939045:18c60fd7aab:-7fe4','RUL-689492a6:18c60ee947f:-7614','WBS','water.facts.WaterBillSchedule',0),('RC-50939045:18c60fd7aab:-7fe5','RC-50939045:18c60fd7aab:-7fe5','RUL-689492a6:18c60ee947f:-7614','HOLIDAYS','treasury.facts.HolidayFact',1),('RC-50939045:18c60fd7aab:-7ff1','RC-50939045:18c60fd7aab:-7ff1','RUL-689492a6:18c60ee947f:-793f','WBS','water.facts.WaterBillSchedule',0),('RC-50939045:18c60fd7aab:-7ff2','RC-50939045:18c60fd7aab:-7ff2','RUL-689492a6:18c60ee947f:-793f','HOLIDAYS','treasury.facts.HolidayFact',1),('RC-50939045:18c60fd7aab:-7ffb','RC-50939045:18c60fd7aab:-7ffb','RUL-689492a6:18c60ee947f:-7d9b','HOLIDAYS','treasury.facts.HolidayFact',1),('RC-50939045:18c60fd7aab:-7fff','RC-50939045:18c60fd7aab:-7fff','RUL-689492a6:18c60ee947f:-7d9b','WBS','water.facts.WaterBillSchedule',0),('RC2a849d8a:18aca9676a8:-7ff9','RC2a849d8a:18aca9676a8:-7ff9','RUL-346b1972:18acb117570:-7c56','WBS','water.facts.WaterBillSchedule',2),('RC2a849d8a:18aca9676a8:-7fff','RC2a849d8a:18aca9676a8:-7fff','RUL-346b1972:18acb117570:-7c56','WBILL','water.facts.WaterBill',0),('RC5118db67:1851f22bb8d:-7ff4','RC5118db67:1851f22bb8d:-7ff4','RUL-5bdd949d:1851f0d205d:-7643','CRBILL','treasury.facts.CreditBillItem',0),('RC53bee69f:188e6ecc2a9:-7ff8','RC53bee69f:188e6ecc2a9:-7ff8','RUL634529e7:188e6b97ac9:-7aac','WBILL','water.facts.WaterBill',1),('RC5be77a81:18e5a358870:-7ff3','RC5be77a81:18e5a358870:-7ff3','RUL-5a798cf1:18e5a35a0b4:-7a3b','WBILL','water.facts.WaterBill',0),('RC5cff48f4:18a5f16cf2a:-7fe0','RC5cff48f4:18a5f16cf2a:-7fe0','RULfb67ce3:18a5ef5cb85:-7a6f','WBILL','water.facts.WaterBill',0),('RC5cff48f4:18a5f16cf2a:-7fe6','RC5cff48f4:18a5f16cf2a:-7fe6','RULfb67ce3:18a5ef5cb85:-7ad4','WBILL','water.facts.WaterBill',0),('RC5cff48f4:18a5f16cf2a:-7ff0','RC5cff48f4:18a5f16cf2a:-7ff0','RULfb67ce3:18a5ef5cb85:-7baf','WBILL','water.facts.WaterBill',0),('RC5cff48f4:18a5f16cf2a:-7ff6','RC5cff48f4:18a5f16cf2a:-7ff6','RULfb67ce3:18a5ef5cb85:-7bce','WBILL','water.facts.WaterBill',0),('RC690c2690:1889fd3fa0e:-7ffe','RC690c2690:1889fd3fa0e:-7ffe','RUL66638ced:1889f25c026:-7dc0','HOLIDAYS','treasury.facts.HolidayFact',1),('RC690c2690:1889fd3fa0e:-8000','RC690c2690:1889fd3fa0e:-8000','RUL66638ced:1889f25c026:-7dc0','WBS','water.facts.WaterBillSchedule',0),('RCC-3573de3e:18b2d22ab69:-7fb3','RC-3573de3e:18b2d22ab69:-7fb4','RUL7834f671:18b2e3ebb80:-6c69','BYM','integer',0),('RCC-3573de3e:18b2d22ab69:-7fb5','RC-3573de3e:18b2d22ab69:-7fb7','RUL7834f671:18b2e3ebb80:-6c69','BREFID','string',0),('RCC-3573de3e:18b2d22ab69:-7fb8','RC-3573de3e:18b2d22ab69:-7fba','RUL7834f671:18b2e3ebb80:-6c69','AMT','decimal',1),('RCC-3573de3e:18b2d22ab69:-7fbc','RC-3573de3e:18b2d22ab69:-7fbd','RUL7834f671:18b2e3ebb80:-6c69','OBJID','string',0),('RCC-3573de3e:18b2d22ab69:-7fc3','RC-3573de3e:18b2d22ab69:-7fc4','RUL7834f671:18b2e3ebb80:-73bc','OBJID','string',0),('RCC-3573de3e:18b2d22ab69:-7fc6','RC-3573de3e:18b2d22ab69:-7fc7','RUL7834f671:18b2e3ebb80:-73bc','AMT','decimal',1),('RCC-3573de3e:18b2d22ab69:-7fcf','RC-3573de3e:18b2d22ab69:-7fd0','RUL7834f671:18b2e3ebb80:-76fb','BYM','integer',0),('RCC-3573de3e:18b2d22ab69:-7fd2','RC-3573de3e:18b2d22ab69:-7fd3','RUL7834f671:18b2e3ebb80:-76fb','AMT','decimal',1),('RCC-3573de3e:18b2d22ab69:-7fd5','RC-3573de3e:18b2d22ab69:-7fd9','RUL7834f671:18b2e3ebb80:-76fb','OBJID','string',1),('RCC-3573de3e:18b2d22ab69:-7fd7','RC-3573de3e:18b2d22ab69:-7fd9','RUL7834f671:18b2e3ebb80:-76fb','YR','integer',1),('RCC-3573de3e:18b2d22ab69:-7fd8','RC-3573de3e:18b2d22ab69:-7fd9','RUL7834f671:18b2e3ebb80:-76fb','MON','integer',2),('RCC-3573de3e:18b2d22ab69:-7fda','RC-3573de3e:18b2d22ab69:-7fdb','RUL7834f671:18b2e3ebb80:-76fb','ACCTNO','string',0),('RCC-3573de3e:18b2d22ab69:-7fe2','RC-3573de3e:18b2d22ab69:-7fe3','RUL7834f671:18b2e3ebb80:-7d64','ACCTNO','string',0),('RCC-3573de3e:18b2d22ab69:-7fe4','RC-3573de3e:18b2d22ab69:-7fe8','RUL7834f671:18b2e3ebb80:-7d64','MON','integer',2),('RCC-3573de3e:18b2d22ab69:-7fe5','RC-3573de3e:18b2d22ab69:-7fe8','RUL7834f671:18b2e3ebb80:-7d64','YR','integer',1),('RCC-3573de3e:18b2d22ab69:-7fe6','RC-3573de3e:18b2d22ab69:-7fe8','RUL7834f671:18b2e3ebb80:-7d64','DISC','decimal',3),('RCC-3573de3e:18b2d22ab69:-7fe7','RC-3573de3e:18b2d22ab69:-7fe8','RUL7834f671:18b2e3ebb80:-7d64','OBJID','string',1),('RCC-3573de3e:18b2d22ab69:-7fe9','RC-3573de3e:18b2d22ab69:-7feb','RUL7834f671:18b2e3ebb80:-7d64','AMT','decimal',1),('RCC-4c00ed59:18cd865480c:-7fda','RC-4c00ed59:18cd865480c:-7fdb','RUL-62d5b87:18cd865ce1a:-6280','VOL','integer',0),('RCC-50939045:18c60fd7aab:-7fb8','RC-50939045:18c60fd7aab:-7fb9','RUL-689492a6:18c60ee947f:-5dfa','AMT','decimal',0),('RCC-50939045:18c60fd7aab:-7fc3','RC-50939045:18c60fd7aab:-7fc5','RUL-689492a6:18c60ee947f:-71e6','AMT','decimal',0),('RCC-50939045:18c60fd7aab:-7fc4','RC-50939045:18c60fd7aab:-7fc5','RUL-689492a6:18c60ee947f:-71e6','ITEMID','string',2),('RCC-50939045:18c60fd7aab:-7fc6','RC-50939045:18c60fd7aab:-7fc7','RUL-689492a6:18c60ee947f:-71e6','DUEDATE','date',0),('RCC-50939045:18c60fd7aab:-7fd5','RC-50939045:18c60fd7aab:-7fd7','RUL-689492a6:18c60ee947f:-7603','MON','integer',2),('RCC-50939045:18c60fd7aab:-7fd6','RC-50939045:18c60fd7aab:-7fd7','RUL-689492a6:18c60ee947f:-7603','YR','integer',1),('RCC-50939045:18c60fd7aab:-7fe2','RC-50939045:18c60fd7aab:-7fe4','RUL-689492a6:18c60ee947f:-7614','MON','integer',2),('RCC-50939045:18c60fd7aab:-7fe3','RC-50939045:18c60fd7aab:-7fe4','RUL-689492a6:18c60ee947f:-7614','YR','integer',1),('RCC-50939045:18c60fd7aab:-7fef','RC-50939045:18c60fd7aab:-7ff1','RUL-689492a6:18c60ee947f:-793f','MON','integer',2),('RCC-50939045:18c60fd7aab:-7ff0','RC-50939045:18c60fd7aab:-7ff1','RUL-689492a6:18c60ee947f:-793f','YR','integer',1),('RCC-50939045:18c60fd7aab:-7ffc','RC-50939045:18c60fd7aab:-7fff','RUL-689492a6:18c60ee947f:-7d9b','YR','integer',1),('RCC-50939045:18c60fd7aab:-7ffd','RC-50939045:18c60fd7aab:-7fff','RUL-689492a6:18c60ee947f:-7d9b','MON','integer',2),('RCC2a849d8a:18aca9676a8:-7ff8','RC2a849d8a:18aca9676a8:-7ff9','RUL-346b1972:18acb117570:-7c56','DUEDATE','date',0),('RCC2a849d8a:18aca9676a8:-7ffa','RC2a849d8a:18aca9676a8:-7fff','RUL-346b1972:18acb117570:-7c56','RATE','decimal',5),('RCC2a849d8a:18aca9676a8:-7ffc','RC2a849d8a:18aca9676a8:-7fff','RUL-346b1972:18acb117570:-7c56','BDATE','date',3),('RCC2a849d8a:18aca9676a8:-7ffd','RC2a849d8a:18aca9676a8:-7fff','RUL-346b1972:18acb117570:-7c56','MON','integer',2),('RCC2a849d8a:18aca9676a8:-7ffe','RC2a849d8a:18aca9676a8:-7fff','RUL-346b1972:18acb117570:-7c56','YR','integer',1),('RCC53bee69f:188e6ecc2a9:-7ff6','RC53bee69f:188e6ecc2a9:-7ff8','RUL634529e7:188e6b97ac9:-7aac','BYR','integer',0),('RCC53bee69f:188e6ecc2a9:-7ff7','RC53bee69f:188e6ecc2a9:-7ff8','RUL634529e7:188e6b97ac9:-7aac','BMON','integer',1),('RCC53bee69f:188e6ecc2a9:-7ff9','RC53bee69f:188e6ecc2a9:-7ffb','RUL634529e7:188e6b97ac9:-7aac','YR','integer',0),('RCC53bee69f:188e6ecc2a9:-7ffa','RC53bee69f:188e6ecc2a9:-7ffb','RUL634529e7:188e6b97ac9:-7aac','MON','integer',1),('RCC5be77a81:18e5a358870:-7ff2','RC5be77a81:18e5a358870:-7ff3','RUL-5a798cf1:18e5a35a0b4:-7a3b','VOL','integer',0),('RCC5cff48f4:18a5f16cf2a:-7fde','RC5cff48f4:18a5f16cf2a:-7fe0','RULfb67ce3:18a5ef5cb85:-7a6f','VOL','integer',0),('RCC5cff48f4:18a5f16cf2a:-7fe4','RC5cff48f4:18a5f16cf2a:-7fe6','RULfb67ce3:18a5ef5cb85:-7ad4','VOL','integer',0),('RCC5cff48f4:18a5f16cf2a:-7fee','RC5cff48f4:18a5f16cf2a:-7ff0','RULfb67ce3:18a5ef5cb85:-7baf','VOL','integer',0),('RCC5cff48f4:18a5f16cf2a:-7ff5','RC5cff48f4:18a5f16cf2a:-7ff6','RULfb67ce3:18a5ef5cb85:-7bce','VOL','integer',0),('RCC65270b36:1895d10e6f2:-7ffd','RC65270b36:1895d10e6f2:-7ffe','RUL287770ca:1895d0dd958:-7d6d','DP','decimal',0),('RCC690c2690:1889fd3fa0e:-7fff','RC690c2690:1889fd3fa0e:-8000','RUL66638ced:1889f25c026:-7dc0','READINGDUEDATE','date',0),('RCOND-22e7de62:18c619db161:-77ff','RCOND-22e7de62:18c619db161:-77ff','RUL-22e7de62:18c619db161:-782b','WBILL','water.facts.WaterBill',0),('RCOND-62d5b87:18cd865ce1a:-66f7','RCOND-62d5b87:18cd865ce1a:-66f7','RUL-62d5b87:18cd865ce1a:-6750','WBILL','water.facts.WaterBill',0),('RCOND-62d5b87:18cd865ce1a:-6d23','RCOND-62d5b87:18cd865ce1a:-6d23','RUL-62d5b87:18cd865ce1a:-7bbc','HOLIDAYS','treasury.facts.HolidayFact',1),('RCOND-62d5b87:18cd865ce1a:-7b8e','RCOND-62d5b87:18cd865ce1a:-7b8e','RUL-62d5b87:18cd865ce1a:-7bbc','WBS','water.facts.WaterBillSchedule',0),('RCOND-689492a6:18c60ee947f:-6ac2','RCOND-689492a6:18c60ee947f:-6ac2','RUL-689492a6:18c60ee947f:-6d73','BILLITEM','water.facts.WaterBillItem',1),('RCOND-689492a6:18c60ee947f:-6cf9','RCOND-689492a6:18c60ee947f:-6cf9','RUL-689492a6:18c60ee947f:-6d73','WBILL','water.facts.WaterBill',0),('RCOND-689492a6:18c60ee947f:-6fcf','RCOND-689492a6:18c60ee947f:-6fcf','RUL-689492a6:18c60ee947f:-71e6','WBILL','water.facts.WaterBill',0),('RCOND-72f22338:18521353cbd:-79a4','RCOND-72f22338:18521353cbd:-79a4','RUL-72f22338:18521353cbd:-7e32','BILLITEM','water.facts.WaterBillItem',1),('RCOND-72f22338:18521353cbd:-7d19','RCOND-72f22338:18521353cbd:-7d19','RUL-72f22338:18521353cbd:-7e32','PMT','treasury.facts.Payment',0),('RCOND2a0555f7:18cecb153f1:-65c6','RCOND2a0555f7:18cecb153f1:-65c6','RUL2a0555f7:18cecb153f1:-6cd8','BILLITEM','water.facts.WaterBillItem',1),('RCOND2a0555f7:18cecb153f1:-6c36','RCOND2a0555f7:18cecb153f1:-6c36','RUL2a0555f7:18cecb153f1:-6cd8','WBILL','water.facts.WaterBill',0),('RCOND3c37d24d:17f1ac2fff3:-7c89','RCOND3c37d24d:17f1ac2fff3:-7c89','RUL-21685239:17b6cdabf45:-7520','ABILLITEM','treasury.facts.AbstractBillItem',1),('RCOND4e803530:1887047c12e:-7dba','RCOND4e803530:1887047c12e:-7dba','RUL4e803530:1887047c12e:-7e68','WBILL','water.facts.WaterBill',0),('RCOND61e00012:187074846ff:-5e81','RCOND61e00012:187074846ff:-5e81','RUL61e00012:187074846ff:-6223','HOLIDAYS','treasury.facts.HolidayFact',1),('RCOND61e00012:187074846ff:-61eb','RCOND61e00012:187074846ff:-61eb','RUL61e00012:187074846ff:-6223','WBS','water.facts.WaterBillSchedule',0),('RCOND61e00012:187074846ff:-6568','RCOND61e00012:187074846ff:-6568','RUL61e00012:187074846ff:-65a0','WBS','water.facts.WaterBillSchedule',0),('RCOND61e00012:187074846ff:-6c4a','RCOND61e00012:187074846ff:-6c4a','RUL61e00012:187074846ff:-6dcb','HOLIDAYS','treasury.facts.HolidayFact',1),('RCOND61e00012:187074846ff:-6d95','RCOND61e00012:187074846ff:-6d95','RUL61e00012:187074846ff:-6dcb','WBS','water.facts.WaterBillSchedule',0),('RCOND7834f671:18b2e3ebb80:-7096','RCOND7834f671:18b2e3ebb80:-7096','RUL7834f671:18b2e3ebb80:-73bc','BILLITEM','water.facts.WaterBillItem',1),('RCOND7834f671:18b2e3ebb80:-722f','RCOND7834f671:18b2e3ebb80:-722f','RUL7834f671:18b2e3ebb80:-73bc','WBILL','water.facts.WaterBill',0),('RCOND7834f671:18b2e3ebb80:-7b90','RCOND7834f671:18b2e3ebb80:-7b90','RUL7834f671:18b2e3ebb80:-7d64','WBILL','water.facts.WaterBill',0),('RCOND7b73bf4:1850ee0fd3b:-7b8a','RCOND7b73bf4:1850ee0fd3b:-7b8a','RUL7b73bf4:1850ee0fd3b:-7eed','WBILL','water.facts.WaterBill',2),('RCOND7b73bf4:1850ee0fd3b:-7e97','RCOND7b73bf4:1850ee0fd3b:-7e97','RUL7b73bf4:1850ee0fd3b:-7eed','WBS','water.facts.WaterBillSchedule',0),('RCONDc8dbf18:1870773e513:-7577','RCONDc8dbf18:1870773e513:-7577','RULc8dbf18:1870773e513:-75af','WBS','water.facts.WaterBillSchedule',0),('RCONDc8dbf18:1870773e513:-7941','RCONDc8dbf18:1870773e513:-7941','RULc8dbf18:1870773e513:-7a3e','HOLIDAYS','treasury.facts.HolidayFact',1),('RCONDc8dbf18:1870773e513:-7a06','RCONDc8dbf18:1870773e513:-7a06','RULc8dbf18:1870773e513:-7a3e','WBS','water.facts.WaterBillSchedule',0),('RCONST-22e7de62:18c619db161:-7791','RCOND-22e7de62:18c619db161:-77ff','RUL-22e7de62:18c619db161:-782b','VOL','integer',0),('RCONST-62d5b87:18cd865ce1a:-6693','RCOND-62d5b87:18cd865ce1a:-66f7','RUL-62d5b87:18cd865ce1a:-6750','VOL','integer',0),('RCONST-62d5b87:18cd865ce1a:-7a2a','RCOND-62d5b87:18cd865ce1a:-7b8e','RUL-62d5b87:18cd865ce1a:-7bbc','MON','integer',2),('RCONST-62d5b87:18cd865ce1a:-7aa5','RCOND-62d5b87:18cd865ce1a:-7b8e','RUL-62d5b87:18cd865ce1a:-7bbc','YR','integer',1),('RCONST-689492a6:18c60ee947f:-6836','RCOND-689492a6:18c60ee947f:-6ac2','RUL-689492a6:18c60ee947f:-6d73','ITEMID','string',2),('RCONST-689492a6:18c60ee947f:-6a61','RCOND-689492a6:18c60ee947f:-6ac2','RUL-689492a6:18c60ee947f:-6d73','AMT','decimal',0),('RCONST-689492a6:18c60ee947f:-6bac','RCOND-689492a6:18c60ee947f:-6cf9','RUL-689492a6:18c60ee947f:-6d73','BILLDATE','date',1),('RCONST-689492a6:18c60ee947f:-6c76','RCOND-689492a6:18c60ee947f:-6cf9','RUL-689492a6:18c60ee947f:-6d73','BYM','integer',0),('RCONST-689492a6:18c60ee947f:-6f6e','RCOND-689492a6:18c60ee947f:-6fcf','RUL-689492a6:18c60ee947f:-71e6','BYM','integer',0),('RCONST-72f22338:18521353cbd:-774a','RCOND-72f22338:18521353cbd:-79a4','RUL-72f22338:18521353cbd:-7e32','YM','integer',1),('RCONST228733b9:18869839124:-6f2e','RCOND228733b9:18869839124:-6f56','RUL228733b9:18869839124:-700b','DP','decimal',0),('RCONST2a0555f7:18cecb153f1:-5c52','RCOND2a0555f7:18cecb153f1:-6c36','RUL2a0555f7:18cecb153f1:-6cd8','BILLDATE','date',1),('RCONST2a0555f7:18cecb153f1:-61c8','RCOND2a0555f7:18cecb153f1:-65c6','RUL2a0555f7:18cecb153f1:-6cd8','BAL','decimal',2),('RCONST2a0555f7:18cecb153f1:-63db','RCOND2a0555f7:18cecb153f1:-65c6','RUL2a0555f7:18cecb153f1:-6cd8','BILLITEMID','string',1),('RCONST2a0555f7:18cecb153f1:-66cf','RCOND2a0555f7:18cecb153f1:-6c36','RUL2a0555f7:18cecb153f1:-6cd8','BYM','integer',2),('RCONST3048fa3a:18871bcfa7d:-7c90','RCOND4e803530:1887047c12e:-7dba','RUL4e803530:1887047c12e:-7e68','BDATE','date',2),('RCONST396bc69f:1887204eb56:-7805','RCOND4e803530:1887047c12e:-7bf3','RUL4e803530:1887047c12e:-7e68','PMTID','string',5),('RCONST4e803530:1887047c12e:-73fb','RCOND4e803530:1887047c12e:-7bf3','RUL4e803530:1887047c12e:-7e68','BCOUNT','integer',4),('RCONST4e803530:1887047c12e:-7814','RCOND4e803530:1887047c12e:-7bf3','RUL4e803530:1887047c12e:-7e68','TERM','integer',3),('RCONST4e803530:1887047c12e:-7ae3','RCOND4e803530:1887047c12e:-7bf3','RUL4e803530:1887047c12e:-7e68','PAMT','decimal',2),('RCONST4e803530:1887047c12e:-7b4b','RCOND4e803530:1887047c12e:-7bf3','RUL4e803530:1887047c12e:-7e68','IAMT','decimal',1),('RCONST4e803530:1887047c12e:-7cc9','RCOND4e803530:1887047c12e:-7dba','RUL4e803530:1887047c12e:-7e68','BMON','integer',1),('RCONST4e803530:1887047c12e:-7d4e','RCOND4e803530:1887047c12e:-7dba','RUL4e803530:1887047c12e:-7e68','BYR','integer',0),('RCONST56bd88b9:18523203cd8:-785e','RC5118db67:1851f22bb8d:-7ff4','RUL-5bdd949d:1851f0d205d:-7643','AMT','decimal',0),('RCONST61e00012:187074846ff:-617d','RCOND61e00012:187074846ff:-61eb','RUL61e00012:187074846ff:-6223','READINGDATE','date',0),('RCONST61e00012:187074846ff:-64fe','RCOND61e00012:187074846ff:-6568','RUL61e00012:187074846ff:-65a0','TODATE','date',0),('RCONST61e00012:187074846ff:-6bc9','RCOND61e00012:187074846ff:-6c10','RUL61e00012:187074846ff:-6dcb','DAYS','integer',1),('RCONST61e00012:187074846ff:-6cb8','RCOND61e00012:187074846ff:-6d95','RUL61e00012:187074846ff:-6dcb','MON','integer',1),('RCONST61e00012:187074846ff:-6d33','RCOND61e00012:187074846ff:-6d95','RUL61e00012:187074846ff:-6dcb','YR','integer',0),('RCONST7834f671:18b2e3ebb80:-7032','RCOND7834f671:18b2e3ebb80:-7096','RUL7834f671:18b2e3ebb80:-73bc','BREFID','string',0),('RCONST7834f671:18b2e3ebb80:-71b5','RCOND7834f671:18b2e3ebb80:-722f','RUL7834f671:18b2e3ebb80:-73bc','BYM','integer',0),('RCONST7834f671:18b2e3ebb80:-7b16','RCOND7834f671:18b2e3ebb80:-7b90','RUL7834f671:18b2e3ebb80:-7d64','BYM','integer',0),('RCONST7b73bf4:1850ee0fd3b:-7ce0','RCOND7b73bf4:1850ee0fd3b:-7d0e','RUL7b73bf4:1850ee0fd3b:-7eed','TDATE','date',0),('RCONST7b73bf4:1850ee0fd3b:-7dce','RCOND7b73bf4:1850ee0fd3b:-7e97','RUL7b73bf4:1850ee0fd3b:-7eed','EXPIRYDATE','date',1),('RCONST7b73bf4:1850ee0fd3b:-7e3e','RCOND7b73bf4:1850ee0fd3b:-7e97','RUL7b73bf4:1850ee0fd3b:-7eed','DUEDATE','date',0),('RCONSTc8dbf18:1870773e513:-747b','RCONDc8dbf18:1870773e513:-7577','RULc8dbf18:1870773e513:-75af','DISCDATE','date',0),('RCONSTc8dbf18:1870773e513:-7992','RCONDc8dbf18:1870773e513:-7a06','RULc8dbf18:1870773e513:-7a3e','BILLINGDUEDATE','date',0);
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
  PRIMARY KEY (`objid`) USING BTREE,
  CONSTRAINT `sys_rule_deployed_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `sys_rule` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_deployed`
--

LOCK TABLES `sys_rule_deployed` WRITE;
/*!40000 ALTER TABLE `sys_rule_deployed` DISABLE KEYS */;
INSERT INTO `sys_rule_deployed` VALUES ('RUL-346b1972:18acb117570:-7c56','\npackage waterbilling.ADD_WATER_BILL;\nimport waterbilling.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"ADD_WATER_BILL\"\n	agenda-group \"compute-fees\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		WBILL: water.facts.WaterBill (  YR:year,MON:month,BDATE:billdate,state matches \"POSTED\",RATE:rate ) \n		\n		WBS: water.facts.WaterBillSchedule (  DUEDATE:duedate ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"WBILL\", WBILL );\n		\n		bindings.put(\"DUEDATE\", DUEDATE );\n		\n		bindings.put(\"YR\", YR );\n		\n		bindings.put(\"WBS\", WBS );\n		\n		bindings.put(\"MON\", MON );\n		\n		bindings.put(\"BDATE\", BDATE );\n		\n		bindings.put(\"RATE\", RATE );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"account\", new KeyValue(\"WATER_BILL\", \"WATER BILL\") );\n_p0.put( \"amount\", (new ActionExpression(\"RATE\", bindings)) );\n_p0.put( \"year\", YR );\n_p0.put( \"month\", MON );\n_p0.put( \"billdate\", (new ActionExpression(\"BDATE\", bindings)) );\naction.execute( \"add-water-billitem\",_p0,drools);\n\nend\n\n\n	'),('RUL-5a798cf1:18e5a35a0b4:-7a3b','\npackage waterconsumption.WATER_INDUSTRIAL_RATE;\nimport waterconsumption.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"WATER_INDUSTRIAL_RATE\"\n	agenda-group \"compute-rate\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		WBILL: water.facts.WaterBill (  VOL:volume ) \n		\n		 water.facts.WaterAccount (  classificationid matches \"INDUSTRIAL\" ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"WBILL\", WBILL );\n		\n		bindings.put(\"VOL\", VOL );\n		\n	RangeEntry re0 = new RangeEntry(\"WATER_INDUSTRIAL_RATE\");\nre0.setBindings(bindings);\nre0.setIntvalue(VOL);\nre0.getParams().put( \"bill\", WBILL );\nre0.getParams().put( \"amount\", 0.0 );\ninsert(re0);\n\nend\n\n\n	\nrule \"compute-bill-rate_0_0\"\n	agenda-group \"compute-rate\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		\n		rv: RangeEntry( id==\"WATER_INDUSTRIAL_RATE\", intvalue < 5.00 )\n		\n	then\n		Map bindings = rv.getBindings();\n		Map params = rv.getParams();\n		params.put( \"amount\", (new ActionExpression(\"60\", bindings)) );	\n		 \n		action.execute( \"compute-bill-rate\",params, drools);\nend\n\n\n	\nrule \"compute-bill-rate_0_1\"\n	agenda-group \"compute-rate\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		rv: RangeEntry( id==\"WATER_INDUSTRIAL_RATE\", intvalue >= 5.00 )\n		\n		\n	then\n		Map bindings = rv.getBindings();\n		Map params = rv.getParams();\n		params.put( \"amount\", (new ActionExpression(\"VOL*18.00\", bindings)) );	\n		 \n		action.execute( \"compute-bill-rate\",params, drools);\nend\n\n\n	'),('RUL-5bdd949d:1851f0d205d:-7643','\npackage waterpayment.MAP_CREDIT_BILLITEM;\nimport waterpayment.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"MAP_CREDIT_BILLITEM\"\n	agenda-group \"map-account\"\n	salience 10000\n	no-loop\n	when\n		\n		\n		CRBILL: treasury.facts.CreditBillItem (  AMT:unusedbalance ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"CRBILL\", CRBILL );\n		\n		bindings.put(\"AMT\", AMT );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"billitem\", CRBILL );\n_p0.put( \"amount\", (new ActionExpression(\"AMT\", bindings)) );\n_p0.put( \"billcode\", new KeyValue(\"WATER_BILL_ADVANCE\", \"WATER BILL ADVANCE PAYMENT\") );\naction.execute( \"add-cashreceipt-item\",_p0,drools);\n\nend\n\n\n	'),('RUL-62d5b87:18cd865ce1a:-6280','\npackage waterconsumption.WATER_COMMERCIAL_RATE;\nimport waterconsumption.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"WATER_COMMERCIAL_RATE\"\n	agenda-group \"compute-rate\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		WBILL: water.facts.WaterBill (  VOL:volume ) \n		\n		 water.facts.WaterAccount (  classificationid matches \"COMMERCIAL\" ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"WBILL\", WBILL );\n		\n		bindings.put(\"VOL\", VOL );\n		\n	RangeEntry re0 = new RangeEntry(\"WATER_COMMERCIAL_RATE\");\nre0.setBindings(bindings);\nre0.setIntvalue(VOL);\nre0.getParams().put( \"bill\", WBILL );\nre0.getParams().put( \"amount\", 0.0 );\ninsert(re0);\n\nend\n\n\n	\nrule \"compute-bill-rate_0_0\"\n	agenda-group \"compute-rate\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		\n		rv: RangeEntry( id==\"WATER_COMMERCIAL_RATE\", intvalue < 5.00 )\n		\n	then\n		Map bindings = rv.getBindings();\n		Map params = rv.getParams();\n		params.put( \"amount\", (new ActionExpression(\"60\", bindings)) );	\n		 \n		action.execute( \"compute-bill-rate\",params, drools);\nend\n\n\n	\nrule \"compute-bill-rate_0_1\"\n	agenda-group \"compute-rate\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		rv: RangeEntry( id==\"WATER_COMMERCIAL_RATE\", intvalue >= 5.00 )\n		\n		\n	then\n		Map bindings = rv.getBindings();\n		Map params = rv.getParams();\n		params.put( \"amount\", (new ActionExpression(\"VOL*18.00\", bindings)) );	\n		 \n		action.execute( \"compute-bill-rate\",params, drools);\nend\n\n\n	'),('RUL-62d5b87:18cd865ce1a:-6750','\npackage waterconsumption.WATER_RESIDENTIAL_RATE;\nimport waterconsumption.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"WATER_RESIDENTIAL_RATE\"\n	agenda-group \"compute-rate\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		WBILL: water.facts.WaterBill (  VOL:volume ) \n		\n		 water.facts.WaterAccount (  classificationid matches \"RESIDENTIAL\" ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"WBILL\", WBILL );\n		\n		bindings.put(\"VOL\", VOL );\n		\n	RangeEntry re0 = new RangeEntry(\"WATER_RESIDENTIAL_RATE\");\nre0.setBindings(bindings);\nre0.setIntvalue(VOL);\nre0.getParams().put( \"bill\", WBILL );\nre0.getParams().put( \"amount\", 0.0 );\ninsert(re0);\n\nend\n\n\n	\nrule \"compute-bill-rate_0_0\"\n	agenda-group \"compute-rate\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		\n		rv: RangeEntry( id==\"WATER_RESIDENTIAL_RATE\", intvalue < 5.00 )\n		\n	then\n		Map bindings = rv.getBindings();\n		Map params = rv.getParams();\n		params.put( \"amount\", (new ActionExpression(\"30\", bindings)) );	\n		 \n		action.execute( \"compute-bill-rate\",params, drools);\nend\n\n\n	\nrule \"compute-bill-rate_0_1\"\n	agenda-group \"compute-rate\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		rv: RangeEntry( id==\"WATER_RESIDENTIAL_RATE\", intvalue >= 5.00 )\n		\n		\n	then\n		Map bindings = rv.getBindings();\n		Map params = rv.getParams();\n		params.put( \"amount\", (new ActionExpression(\"VOL*9.00\", bindings)) );	\n		 \n		action.execute( \"compute-bill-rate\",params, drools);\nend\n\n\n	'),('RUL-62d5b87:18cd865ce1a:-7bbc','\npackage waterbillingschedule.S1;\nimport waterbillingschedule.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"S1\"\n	agenda-group \"initial\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		WBS: water.facts.WaterBillSchedule (  name matches \"S1\",YR:year,MON:month ) \n		\n		HOLIDAYS: treasury.facts.HolidayFact (   ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"WBS\", WBS );\n		\n		bindings.put(\"HOLIDAYS\", HOLIDAYS );\n		\n		bindings.put(\"YR\", YR );\n		\n		bindings.put(\"MON\", MON );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"billschedule\", WBS );\n_p0.put( \"fromdate\", (new ActionExpression(\"@MONTHADD(@DATE( YR ,MON,1 ), -1)\", bindings)) );\n_p0.put( \"todate\", (new ActionExpression(\"@MONTHEND(@MONTHADD(@DATE( YR ,MON,1 ), -1))\", bindings)) );\n_p0.put( \"readingdate\", (new ActionExpression(\"@MONTHADD(@DATE( YR ,MON,28 ), -1)\", bindings)) );\n_p0.put( \"readingduedate\", (new ActionExpression(\"@DATE( YR ,MON, 10)\", bindings)) );\n_p0.put( \"billdate\", (new ActionExpression(\"@DATE( YR ,MON, 10)\", bindings)) );\n_p0.put( \"duedate\", (new ActionExpression(\"@FINDNEXTWORKDAY( @DATE( YR ,MON, 15),HOLIDAYS,1)\", bindings)) );\n_p0.put( \"expirydate\", (new ActionExpression(\"@MONTHEND(@DATE( YR ,MON, 1))\", bindings)) );\naction.execute( \"set-water-bill-schedule\",_p0,drools);\n\nend\n\n\n	'),('RUL-689492a6:18c60ee947f:-5dfa','\npackage waterpayment.APPLY_EXCESS_PAYMENT;\nimport waterpayment.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"APPLY_EXCESS_PAYMENT\"\n	agenda-group \"after-payment\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		PMT: treasury.facts.Payment (  AMT:amount > 0.00 ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"PMT\", PMT );\n		\n		bindings.put(\"AMT\", AMT );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"account\", new KeyValue(\"WATER_BILL_ADVANCE\", \"WATER BILL ADVANCE PAYMENT\") );\n_p0.put( \"amount\", (new ActionExpression(\"AMT\", bindings)) );\n_p0.put( \"payment\", PMT );\naction.execute( \"add-credit-billitem\",_p0,drools);\n\nend\n\n\n	'),('RUL-689492a6:18c60ee947f:-7603','\npackage waterbillingschedule.C3;\nimport waterbillingschedule.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"C3\"\n	agenda-group \"initial\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		WBS: water.facts.WaterBillSchedule (  name matches \"C3\",YR:year,MON:month ) \n		\n		HOLIDAYS: treasury.facts.HolidayFact (   ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"WBS\", WBS );\n		\n		bindings.put(\"HOLIDAYS\", HOLIDAYS );\n		\n		bindings.put(\"YR\", YR );\n		\n		bindings.put(\"MON\", MON );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"billschedule\", WBS );\n_p0.put( \"fromdate\", (new ActionExpression(\"@MONTHADD( @DATE( YR , MON , 17 ) , -1  )\", bindings)) );\n_p0.put( \"todate\", (new ActionExpression(\"@DATE( YR ,MON, 18  )\", bindings)) );\n_p0.put( \"readingdate\", (new ActionExpression(\" @DATE( YR , MON, 18 )\", bindings)) );\n_p0.put( \"billdate\", (new ActionExpression(\"@DATE( YR , MON ,  20 )\", bindings)) );\n_p0.put( \"duedate\", (new ActionExpression(\"@FINDNEXTWORKDAY( @DATE( YR , MON, 26  ), HOLIDAYS, 1 )\", bindings)) );\n_p0.put( \"expirydate\", (new ActionExpression(\"@MONTHADD( @DATE( YR , MON , 17 ), 1 )\", bindings)) );\naction.execute( \"set-water-bill-schedule\",_p0,drools);\n\nend\n\n\n	'),('RUL-689492a6:18c60ee947f:-7614','\npackage waterbillingschedule.C2;\nimport waterbillingschedule.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"C2\"\n	agenda-group \"initial\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		WBS: water.facts.WaterBillSchedule (  name matches \"C2\",YR:year,MON:month ) \n		\n		HOLIDAYS: treasury.facts.HolidayFact (   ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"WBS\", WBS );\n		\n		bindings.put(\"HOLIDAYS\", HOLIDAYS );\n		\n		bindings.put(\"YR\", YR );\n		\n		bindings.put(\"MON\", MON );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"billschedule\", WBS );\n_p0.put( \"fromdate\", (new ActionExpression(\"@MONTHADD( @DATE( YR , MON , 13 ) , -1  )\", bindings)) );\n_p0.put( \"todate\", (new ActionExpression(\"@DATE( YR ,MON, 14  )\", bindings)) );\n_p0.put( \"readingdate\", (new ActionExpression(\" @DATE( YR , MON, 14 )\", bindings)) );\n_p0.put( \"billdate\", (new ActionExpression(\"@DATE( YR , MON ,  16 )\", bindings)) );\n_p0.put( \"duedate\", (new ActionExpression(\"@FINDNEXTWORKDAY( @DATE( YR , MON, 22 ), HOLIDAYS, 1 )\", bindings)) );\n_p0.put( \"expirydate\", (new ActionExpression(\"@MONTHADD( @DATE( YR , MON , 13 ), 1 )\", bindings)) );\naction.execute( \"set-water-bill-schedule\",_p0,drools);\n\nend\n\n\n	'),('RUL-689492a6:18c60ee947f:-793f','\npackage waterbillingschedule.C4;\nimport waterbillingschedule.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"C4\"\n	agenda-group \"initial\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		WBS: water.facts.WaterBillSchedule (  name matches \"C4\",YR:year,MON:month ) \n		\n		HOLIDAYS: treasury.facts.HolidayFact (   ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"WBS\", WBS );\n		\n		bindings.put(\"HOLIDAYS\", HOLIDAYS );\n		\n		bindings.put(\"YR\", YR );\n		\n		bindings.put(\"MON\", MON );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"billschedule\", WBS );\n_p0.put( \"fromdate\", (new ActionExpression(\"@MONTHADD( @DATE( YR , MON , 21 ) , -1  )\", bindings)) );\n_p0.put( \"todate\", (new ActionExpression(\"@DATE( YR ,MON, 22  )\", bindings)) );\n_p0.put( \"readingdate\", (new ActionExpression(\" @DATE( YR , MON, 22 )\", bindings)) );\n_p0.put( \"billdate\", (new ActionExpression(\"@DATE( YR , MON , 24  )\", bindings)) );\n_p0.put( \"duedate\", (new ActionExpression(\"@FINDNEXTWORKDAY(  @MONTHEND(  @DATE( YR , MON, 1 )), HOLIDAYS, 1 )\", bindings)) );\n_p0.put( \"expirydate\", (new ActionExpression(\"@MONTHADD( @DATE( YR , MON , 21 ), 1 )\", bindings)) );\naction.execute( \"set-water-bill-schedule\",_p0,drools);\n\nend\n\n\n	'),('RUL-689492a6:18c60ee947f:-7d9b','\npackage waterbillingschedule.C1;\nimport waterbillingschedule.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"C1\"\n	agenda-group \"initial\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		WBS: water.facts.WaterBillSchedule (  name matches \"C1\",YR:year,MON:month ) \n		\n		HOLIDAYS: treasury.facts.HolidayFact (   ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"WBS\", WBS );\n		\n		bindings.put(\"HOLIDAYS\", HOLIDAYS );\n		\n		bindings.put(\"YR\", YR );\n		\n		bindings.put(\"MON\", MON );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"billschedule\", WBS );\n_p0.put( \"fromdate\", (new ActionExpression(\"@MONTHADD( @DATE( YR , MON , 9 ) , -1  )\", bindings)) );\n_p0.put( \"todate\", (new ActionExpression(\"@DATE( YR ,MON, 10  )\", bindings)) );\n_p0.put( \"readingdate\", (new ActionExpression(\" @DATE( YR , MON, 10 )\", bindings)) );\n_p0.put( \"billdate\", (new ActionExpression(\"@DATE( YR , MON ,  12 )\", bindings)) );\n_p0.put( \"duedate\", (new ActionExpression(\"@FINDNEXTWORKDAY( @DATE( YR , MON, 18 ), HOLIDAYS, 1 )\", bindings)) );\n_p0.put( \"expirydate\", (new ActionExpression(\"@MONTHADD( @DATE( YR , MON , 9 ), 1 )\", bindings)) );\naction.execute( \"set-water-bill-schedule\",_p0,drools);\n\nend\n\n\n	'),('RUL-72f22338:18521353cbd:-7e32','\npackage waterpayment.APPLY_BILLITEM_PAYMENT;\nimport waterpayment.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"APPLY_BILLITEM_PAYMENT\"\n	agenda-group \"apply-payment\"\n	salience 100000\n	\n	when\n		\n		\n		PMT: treasury.facts.Payment (  amount > 0.00 ) \n		\n		BILLITEM: water.facts.WaterBillItem (  paid == false ,YM:yearmonth ) \n		\n		not ( water.facts.WaterBillItem (  paid == false ,yearmonth < YM ) )\n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"PMT\", PMT );\n		\n		bindings.put(\"BILLITEM\", BILLITEM );\n		\n		bindings.put(\"YM\", YM );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"payment\", PMT );\n_p0.put( \"billitem\", BILLITEM );\naction.execute( \"apply-billitem-payment\",_p0,drools);\n\nend\n\n\n	'),('RUL2a0555f7:18cecb153f1:-6cd8','\npackage waterbilling.SURCHARGE_FOR_PREVIOUS;\nimport waterbilling.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"SURCHARGE_FOR_PREVIOUS\"\n	agenda-group \"compute-surcharge\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		WBILL: water.facts.WaterBill (  BILLDATE:billdate,BYM:yearmonth ) \n		\n		BILLITEM: water.facts.WaterBillItem (  yearmonth < BYM,BILLITEMID:objid,BAL:balance > 0.00 ) \n		\n		not ( treasury.facts.SurchargeItem (  billitemrefid == BILLITEMID ) )\n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"WBILL\", WBILL );\n		\n		bindings.put(\"BILLITEM\", BILLITEM );\n		\n		bindings.put(\"BILLDATE\", BILLDATE );\n		\n		bindings.put(\"BILLITEMID\", BILLITEMID );\n		\n		bindings.put(\"BAL\", BAL );\n		\n		bindings.put(\"BYM\", BYM );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"billitem\", BILLITEM );\n_p0.put( \"amount\", (new ActionExpression(\"BAL*0.10\", bindings)) );\n_p0.put( \"account\", new KeyValue(\"WATER_BILL_SURCHARGE\", \"WATER BILL SURCHARGE\") );\n_p0.put( \"billdate\", (new ActionExpression(\"BILLDATE\", bindings)) );\naction.execute( \"add-surcharge-item\",_p0,drools);\n\nend\n\n\n	'),('RUL7834f671:18b2e3ebb80:-6c69','\npackage waterpayment.MAP_SURCHARGE_PREVIOUS;\nimport waterpayment.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"MAP_SURCHARGE_PREVIOUS\"\n	agenda-group \"map-account\"\n	salience 25000\n	no-loop\n	when\n		\n		\n		WBILL: water.facts.WaterBill (  BYM:yearmonth ) \n		\n		BILLITEM: water.facts.WaterBillItem (  BREFID:objid,yearmonth < BYM ) \n		\n		SURCHG: treasury.facts.SurchargeItem (  OBJID:objid,billitemrefid == BREFID ) \n		\n		 treasury.facts.PaymentItem (  billitemrefid == OBJID,AMT:amount ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"WBILL\", WBILL );\n		\n		bindings.put(\"BYM\", BYM );\n		\n		bindings.put(\"BREFID\", BREFID );\n		\n		bindings.put(\"OBJID\", OBJID );\n		\n		bindings.put(\"BILLITEM\", BILLITEM );\n		\n		bindings.put(\"AMT\", AMT );\n		\n		bindings.put(\"SURCHG\", SURCHG );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"billitem\", SURCHG );\n_p0.put( \"amount\", (new ActionExpression(\"AMT\", bindings)) );\n_p0.put( \"groupid\", (new ActionExpression(\"\'WATER_PENALTY\'\", bindings)) );\n_p0.put( \"sortorder\", (new ActionExpression(\"100000\", bindings)) );\n_p0.put( \"billcode\", new KeyValue(\"WATER_PENALTY\", \"WATER PENALTY\") );\naction.execute( \"add-cashreceipt-item\",_p0,drools);\n\nend\n\n\n	'),('RUL7834f671:18b2e3ebb80:-73bc','\npackage waterpayment.MAP_SURCHARGE_CURRENT;\nimport waterpayment.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"MAP_SURCHARGE_CURRENT\"\n	agenda-group \"map-account\"\n	salience 24000\n	no-loop\n	when\n		\n		\n		WBILL: water.facts.WaterBill (  BYM:yearmonth ) \n		\n		BILLITEM: water.facts.WaterBillItem (  BREFID:objid,yearmonth == BYM ) \n		\n		SURCHG: treasury.facts.SurchargeItem (  OBJID:objid,billitemrefid == BREFID ) \n		\n		 treasury.facts.PaymentItem (  billitemrefid == OBJID,AMT:amount ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"OBJID\", OBJID );\n		\n		bindings.put(\"WBILL\", WBILL );\n		\n		bindings.put(\"BREFID\", BREFID );\n		\n		bindings.put(\"BYM\", BYM );\n		\n		bindings.put(\"AMT\", AMT );\n		\n		bindings.put(\"BILLITEM\", BILLITEM );\n		\n		bindings.put(\"SURCHG\", SURCHG );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"billitem\", SURCHG );\n_p0.put( \"amount\", (new ActionExpression(\"AMT\", bindings)) );\n_p0.put( \"groupid\", (new ActionExpression(\"\'WATER_PENALTY\'\", bindings)) );\n_p0.put( \"sortorder\", (new ActionExpression(\"100000\", bindings)) );\n_p0.put( \"billcode\", new KeyValue(\"WATER_PENALTY\", \"WATER PENALTY\") );\naction.execute( \"add-cashreceipt-item\",_p0,drools);\n\nend\n\n\n	'),('RUL7834f671:18b2e3ebb80:-76fb','\npackage waterpayment.MAP_WATER_BILL_PREVIOUS;\nimport waterpayment.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"MAP_WATER_BILL_PREVIOUS\"\n	agenda-group \"map-account\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		WBILL: water.facts.WaterBill (  BYM:yearmonth ) \n		\n		BILLITEM: water.facts.WaterBillItem (  OBJID:objid,YR:year,MON:month,yearmonth < BYM ) \n		\n		 treasury.facts.PaymentItem (  billitemrefid == OBJID,AMT:amount ) \n		\n		 water.facts.WaterAccount (  ACCTNO:acctno ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"WBILL\", WBILL );\n		\n		bindings.put(\"BYM\", BYM );\n		\n		bindings.put(\"ACCTNO\", ACCTNO );\n		\n		bindings.put(\"BILLITEM\", BILLITEM );\n		\n		bindings.put(\"AMT\", AMT );\n		\n		bindings.put(\"OBJID\", OBJID );\n		\n		bindings.put(\"YR\", YR );\n		\n		bindings.put(\"MON\", MON );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"billitem\", BILLITEM );\n_p0.put( \"amount\", (new ActionExpression(\"AMT \", bindings)) );\n_p0.put( \"groupid\", (new ActionExpression(\"\'WATER_BILL\'\", bindings)) );\n_p0.put( \"sortorder\", (new ActionExpression(\"BYM\", bindings)) );\n_p0.put( \"billcode\", new KeyValue(\"WATER_BILL\", \"WATER BILL\") );\naction.execute( \"add-cashreceipt-item\",_p0,drools);\n\nend\n\n\n	'),('RUL7834f671:18b2e3ebb80:-7d64','\npackage waterpayment.MAP_WATER_BILL_CURRENT;\nimport waterpayment.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"MAP_WATER_BILL_CURRENT\"\n	agenda-group \"map-account\"\n	salience 40000\n	no-loop\n	when\n		\n		\n		WBILL: water.facts.WaterBill (  BYM:yearmonth ) \n		\n		BILLITEM: water.facts.WaterBillItem (  YR:year,OBJID:objid,MON:month,DISC:discount,yearmonth == BYM ) \n		\n		 treasury.facts.PaymentItem (  billitemrefid == OBJID,AMT:amount ) \n		\n		 water.facts.WaterAccount (  ACCTNO:acctno ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"ACCTNO\", ACCTNO );\n		\n		bindings.put(\"WBILL\", WBILL );\n		\n		bindings.put(\"BYM\", BYM );\n		\n		bindings.put(\"BILLITEM\", BILLITEM );\n		\n		bindings.put(\"YR\", YR );\n		\n		bindings.put(\"OBJID\", OBJID );\n		\n		bindings.put(\"AMT\", AMT );\n		\n		bindings.put(\"MON\", MON );\n		\n		bindings.put(\"DISC\", DISC );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"billitem\", BILLITEM );\n_p0.put( \"amount\", (new ActionExpression(\"AMT + DISC\", bindings)) );\n_p0.put( \"groupid\", (new ActionExpression(\"\'WATER_BILL\'\", bindings)) );\n_p0.put( \"sortorder\", (new ActionExpression(\"BYM\", bindings)) );\n_p0.put( \"billcode\", new KeyValue(\"WATER_BILL\", \"WATER BILL\") );\naction.execute( \"add-cashreceipt-item\",_p0,drools);\n\nend\n\n\n	'),('RUL7b73bf4:1850ee0fd3b:-7eed','\npackage waterbilling.SET_VALIDITY_DATE;\nimport waterbilling.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"SET_VALIDITY_DATE\"\n	agenda-group \"summary\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		WBS: water.facts.WaterBillSchedule (  DUEDATE:duedate,EXPIRYDATE:expirydate ) \n		\n		 treasury.facts.TransactionDate (  TDATE:date ) \n		\n		WBILL: water.facts.WaterBill (   ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"WBS\", WBS );\n		\n		bindings.put(\"TDATE\", TDATE );\n		\n		bindings.put(\"DUEDATE\", DUEDATE );\n		\n		bindings.put(\"EXPIRYDATE\", EXPIRYDATE );\n		\n		bindings.put(\"WBILL\", WBILL );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"bill\", WBILL );\n_p0.put( \"date\", (new ActionExpression(\" if(  TDATE <= DUEDATE  ) return DUEDATE; return EXPIRYDATE;\", bindings)) );\naction.execute( \"set-bill-validity-date\",_p0,drools);\n\nend\n\n\n	');
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
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_fact`
--

LOCK TABLES `sys_rule_fact` WRITE;
/*!40000 ALTER TABLE `sys_rule_fact` DISABLE KEYS */;
INSERT INTO `sys_rule_fact` VALUES ('com.rameses.rules.common.CurrentDate','com.rameses.rules.common.CurrentDate','Current Date','com.rameses.rules.common.CurrentDate',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'SYSTEM',NULL),('treasury.facts.AbstractBillItem','treasury.facts.AbstractBillItem','Abstract Bill Item','treasury.facts.AbstractBillItem',1,NULL,'ABILLITEM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.Bill','treasury.facts.Bill','Bill','treasury.facts.Bill',1,NULL,'BILL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.BillItem','treasury.facts.BillItem','Bill Item','treasury.facts.BillItem',1,NULL,'BILLITEM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY','treasury.facts.AbstractBillItem'),('treasury.facts.BillSubItem','treasury.facts.BillSubItem','Bill Sub Item','treasury.facts.BillSubItem',1,NULL,'SUBITM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY','treasury.facts.AbstractBillItem'),('treasury.facts.CashReceipt','treasury.facts.CashReceipt','Cash Receipt','treasury.facts.CashReceipt',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.CashReceiptItem','treasury.facts.CashReceiptItem','Cash Receipt Item','treasury.facts.CashReceiptItem',1,NULL,'CRI',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.CreditBillItem','treasury.facts.CreditBillItem','Credit Bill Item','treasury.facts.CreditBillItem',1,NULL,'CRBILL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY','treasury.facts.AbstractBillItem'),('treasury.facts.Deposit','treasury.facts.Deposit','Deposit','treasury.facts.Deposit',5,NULL,'PMT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.DiscountItem','treasury.facts.DiscountItem','Discount Item','treasury.facts.DiscountItem',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY','treasury.facts.AbstractBillItem'),('treasury.facts.ExcessPayment','treasury.facts.ExcessPayment','Excess Payment','treasury.facts.ExcessPayment',5,NULL,'EXPMT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.HolidayFact','treasury.facts.HolidayFact','Holidays','treasury.facts.HolidayFact',1,NULL,'HOLIDAYS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.InterestItem','treasury.facts.InterestItem','Interest Item','treasury.facts.InterestItem',1,NULL,'INT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY','treasury.facts.AbstractBillItem'),('treasury.facts.Payment','treasury.facts.Payment','Payment','treasury.facts.Payment',5,NULL,'PMT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.PaymentItem','treasury.facts.PaymentItem','Payment Item','treasury.facts.PaymentItem',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.Requirement','treasury.facts.Requirement','Requirement','treasury.facts.Requirement',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.SurchargeItem','treasury.facts.SurchargeItem','Surcharge Item','treasury.facts.SurchargeItem',1,NULL,'SURCHG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY','treasury.facts.AbstractBillItem'),('treasury.facts.TransactionDate','treasury.facts.TransactionDate','Transaction Date','treasury.facts.TransactionDate',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.VarInteger','treasury.facts.VarInteger','Var Integer','treasury.facts.VarInteger',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('water.facts.WaterAccount','water.facts.WaterAccount','Water Account','water.facts.WaterAccount',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WATER',NULL),('water.facts.WaterAccountTag','water.facts.WaterAccountTag','Water Account Tag','water.facts.WaterAccountTag',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WATER',NULL),('water.facts.WaterBill','water.facts.WaterBill','Water Bill','water.facts.WaterBill',1,NULL,'WBILL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WATER','treasury.facts.Bill'),('water.facts.WaterBillGroup','water.facts.WaterBillGroup','Water Bill Group','water.facts.WaterBillGroup',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WATER',NULL),('water.facts.WaterBillItem','water.facts.WaterBillItem','Water Bill Item','water.facts.WaterBillItem',1,NULL,'BILLITEM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WATER','treasury.facts.AbstractBillItem'),('water.facts.WaterBillSchedule','water.facts.WaterBillSchedule','Water Bill Schedule','water.facts.WaterBillSchedule',-1,NULL,'WBS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WATER',NULL),('water.facts.WaterConsumption','water.facts.WaterConsumption','Water Consumption','water.facts.WaterConsumption',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WATER',NULL),('water.facts.WaterMeter','water.facts.WaterMeter','Water Meter','water.facts.WaterMeter',1,NULL,'WM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WATER',NULL),('water.facts.WaterPaymentPlan','water.facts.WaterPaymentPlan','Water Payment Plan','water.facts.WaterPaymentPlan',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WATER',NULL),('water.facts.WaterTxn','water.facts.WaterTxn','Water Transaction','water.facts.WaterTxn',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WATER',NULL);
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
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `parentid` (`parentid`) USING BTREE,
  CONSTRAINT `sys_rule_fact_field_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_fact` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_fact_field`
--

LOCK TABLES `sys_rule_fact_field` WRITE;
/*!40000 ALTER TABLE `sys_rule_fact_field` DISABLE KEYS */;
INSERT INTO `sys_rule_fact_field` VALUES ('com.rameses.rules.common.CurrentDate.date','com.rameses.rules.common.CurrentDate','date','Date','date',4,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('com.rameses.rules.common.CurrentDate.day','com.rameses.rules.common.CurrentDate','day','Day','integer',5,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('com.rameses.rules.common.CurrentDate.month','com.rameses.rules.common.CurrentDate','month','Month','integer',3,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('com.rameses.rules.common.CurrentDate.qtr','com.rameses.rules.common.CurrentDate','qtr','Qtr','integer',1,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('com.rameses.rules.common.CurrentDate.year','com.rameses.rules.common.CurrentDate','year','Year','integer',2,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.AbstractBillItem.acctid','treasury.facts.AbstractBillItem','acctid','Account','string',2,'lookup','itemaccount:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('treasury.facts.AbstractBillItem.amount','treasury.facts.AbstractBillItem','amount','Amount','decimal',3,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.AbstractBillItem.objid','treasury.facts.AbstractBillItem','objid','ObjID','string',1,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.Bill.amount','treasury.facts.Bill','amount','Amount','decimal',6,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.Bill.balance','treasury.facts.Bill','balance','Balance','decimal',8,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.Bill.balanceforward','treasury.facts.Bill','balanceforward','Balance Forward','decimal',4,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.Bill.billdate','treasury.facts.Bill','billdate','Bill Date','date',5,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.Bill.expirydate','treasury.facts.Bill','expirydate','Expiry Date','date',3,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.Bill.objid','treasury.facts.Bill','objid','ObjID',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('treasury.facts.Bill.state','treasury.facts.Bill','state','State','string',7,'lov',NULL,NULL,NULL,NULL,NULL,NULL,'string','MARKET_BILL_STATE'),('treasury.facts.Bill.validitydate','treasury.facts.Bill','validitydate','Validity Date','date',2,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.BillItem.amount','treasury.facts.BillItem','amount','Amount','decimal',1,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.BillItem.billcode','treasury.facts.BillItem','billcode','Bill Code','string',4,'lookup','itemaccount:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('treasury.facts.BillItem.duedate','treasury.facts.BillItem','duedate','Due Date','date',2,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.BillItem.tag','treasury.facts.BillItem','tag','Tag','string',5,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.BillItem.txntype','treasury.facts.BillItem','txntype','Txn Type','string',3,'lookup','billitem_txntype:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('treasury.facts.BillSubItem.acctid','treasury.facts.BillSubItem','acctid','Account','string',2,'lookup','itemaccount:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('treasury.facts.BillSubItem.amount','treasury.facts.BillSubItem','amount','Amount','decimal',3,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.BillSubItem.billitemrefid','treasury.facts.BillSubItem','billitemrefid','Bill Item Refid','string',5,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.BillSubItem.objid','treasury.facts.BillSubItem','objid','ObjID','string',1,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.BillSubItem.type','treasury.facts.BillSubItem','type','Type','string',4,'lov',NULL,NULL,NULL,NULL,NULL,NULL,'string','SUB_BILLITEM_TYPE'),('treasury.facts.CashReceipt.receiptdate','treasury.facts.CashReceipt','receiptdate','Receipt Date','date',2,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.CashReceipt.txnmode','treasury.facts.CashReceipt','txnmode','Txn Mode','string',1,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.CashReceiptItem.account','treasury.facts.CashReceiptItem','account','Account','string',1,'lookup','itemaccount:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('treasury.facts.CashReceiptItem.amount','treasury.facts.CashReceiptItem','amount','Amount','decimal',2,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.CashReceiptItem.billitems','treasury.facts.CashReceiptItem','billitems','Bill Items','string',4,'var',NULL,NULL,NULL,NULL,NULL,NULL,'object',NULL),('treasury.facts.CashReceiptItem.remarks','treasury.facts.CashReceiptItem','remarks','Remarks','string',3,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.CashReceiptItem.sortorder','treasury.facts.CashReceiptItem','sortorder','Sort Order','integer',5,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.CreditBillItem.amount','treasury.facts.CreditBillItem','amount','Amount','decimal',1,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.CreditBillItem.billcode','treasury.facts.CreditBillItem','billcode','Bill code','string',2,'lookup','waterworks_itemaccount:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('treasury.facts.CreditBillItem.unusedbalance','treasury.facts.CreditBillItem','unusedbalance','Unused Balance','decimal',2,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.Deposit.amount','treasury.facts.Deposit','amount','Amount','decimal',1,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.DiscountItem.amount','treasury.facts.DiscountItem','amount','Amount','decimal',2,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.DiscountItem.billitemrefid','treasury.facts.DiscountItem','billitemrefid','Bill ItemRef ID','string',1,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.DiscountItem.discdate','treasury.facts.DiscountItem','discdate','Discount Date','date',3,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.ExcessPayment.amount','treasury.facts.ExcessPayment','amount','Amount','decimal',1,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.HolidayFact.id','treasury.facts.HolidayFact','id','ID','string',1,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.InterestItem.acctid','treasury.facts.InterestItem','acctid','Account','string',2,'lookup','itemaccount:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('treasury.facts.InterestItem.amount','treasury.facts.InterestItem','amount','Amount','decimal',3,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.InterestItem.billcode','treasury.facts.InterestItem','billcode','Bill code','string',6,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.InterestItem.billitemrefid','treasury.facts.InterestItem','billitemrefid','Bill Item Refid','string',5,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.InterestItem.forwarded','treasury.facts.InterestItem','forwarded','Forwarded','boolean',7,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('treasury.facts.InterestItem.input','treasury.facts.InterestItem','input','Input','boolean',8,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('treasury.facts.InterestItem.objid','treasury.facts.InterestItem','objid','ObjID','string',1,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.InterestItem.type','treasury.facts.InterestItem','type','Type','string',4,'lov',NULL,NULL,NULL,NULL,NULL,NULL,'string','SUB_BILLITEM_TYPE'),('treasury.facts.Payment.amount','treasury.facts.Payment','amount','Amount','decimal',1,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.Payment.reftype','treasury.facts.Payment','reftype','Ref Type','string',2,'lov',NULL,NULL,NULL,NULL,NULL,NULL,'string','PAYMENT_REFTYPE'),('treasury.facts.PaymentItem.amount','treasury.facts.PaymentItem','amount','Amount','decimal',2,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.PaymentItem.billitemrefid','treasury.facts.PaymentItem','billitemrefid','Bill Item Ref ID','string',1,'var',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.Requirement.code','treasury.facts.Requirement','code','Code','string',1,'lookup','requirementtype:lookup','code','title',NULL,NULL,NULL,'string',NULL),('treasury.facts.Requirement.completed','treasury.facts.Requirement','completed','Completed','boolean',2,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('treasury.facts.SurchargeItem.acctid','treasury.facts.SurchargeItem','acctid','Account','string',2,'lookup','itemaccount:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('treasury.facts.SurchargeItem.amount','treasury.facts.SurchargeItem','amount','Amount','decimal',3,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.SurchargeItem.billcode','treasury.facts.SurchargeItem','billcode','Bill code','string',7,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.SurchargeItem.billitem','treasury.facts.SurchargeItem','billitem','Ref Bill Item','string',5,'var',NULL,NULL,NULL,NULL,NULL,NULL,'treasury.facts.BillItem',NULL),('treasury.facts.SurchargeItem.billitemrefid','treasury.facts.SurchargeItem','billitemrefid','Bill Item Refid','string',6,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.SurchargeItem.forwarded','treasury.facts.SurchargeItem','forwarded','Forwarded','boolean',8,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('treasury.facts.SurchargeItem.input','treasury.facts.SurchargeItem','input','Input','boolean',9,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('treasury.facts.SurchargeItem.objid','treasury.facts.SurchargeItem','objid','ObjID','string',1,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.SurchargeItem.type','treasury.facts.SurchargeItem','type','Type','string',4,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.TransactionDate.date','treasury.facts.TransactionDate','date','Date','date',1,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.TransactionDate.day','treasury.facts.TransactionDate','day','Day','integer',4,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.TransactionDate.month','treasury.facts.TransactionDate','month','Month','integer',3,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.TransactionDate.qtr','treasury.facts.TransactionDate','qtr','Qtr','integer',5,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.TransactionDate.tag','treasury.facts.TransactionDate','tag','Tag','string',6,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.TransactionDate.year','treasury.facts.TransactionDate','year','Year','integer',2,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.VarInteger.tag','treasury.facts.VarInteger','tag','Tag','string',2,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.VarInteger.value','treasury.facts.VarInteger','value','Value','integer',1,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('water.facts.WaterAccount.acctno','water.facts.WaterAccount','acctno','Acct No','string',1,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('water.facts.WaterAccount.classificationid','water.facts.WaterAccount','classificationid','Classification','string',2,'lookup','water_classification:lookup','objid','name',NULL,NULL,NULL,'string',NULL),('water.facts.WaterAccount.metered','water.facts.WaterAccount','metered','Metered','boolean',4,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('water.facts.WaterAccount.units','water.facts.WaterAccount','units','Units','integer',3,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('water.facts.WaterAccountTag.name','water.facts.WaterAccountTag','name','Name','string',1,'lookup','water_tag:single:lookup','objid','objid',NULL,NULL,NULL,'string',NULL),('water.facts.WaterBill.balance','water.facts.WaterBill','balance','Balance','decimal',8,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('water.facts.WaterBill.balanceforward','water.facts.WaterBill','balanceforward','Balance Forward','decimal',2,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('water.facts.WaterBill.billdate','water.facts.WaterBill','billdate','Bill Date','date',6,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('water.facts.WaterBill.billtype','water.facts.WaterBill','billtype','Bill Type','string',9,'lov',NULL,NULL,NULL,NULL,NULL,NULL,'string','MARKET_BILL_TYPE'),('water.facts.WaterBill.duedate','water.facts.WaterBill','duedate','Due Date','date',12,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('water.facts.WaterBill.month','water.facts.WaterBill','month','Month','integer',5,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('water.facts.WaterBill.objid','water.facts.WaterBill','objid','Obj ID','string',1,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('water.facts.WaterBill.prevreading','water.facts.WaterBill','prevreading','Prev Reading','integer',14,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('water.facts.WaterBill.rate','water.facts.WaterBill','rate','Rate','decimal',16,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('water.facts.WaterBill.reading','water.facts.WaterBill','reading','Reading','integer',13,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('water.facts.WaterBill.state','water.facts.WaterBill','state','State','string',3,'lov',NULL,NULL,NULL,NULL,NULL,NULL,'string','WATER_BILL_STATE'),('water.facts.WaterBill.unitvolume','water.facts.WaterBill','unitvolume','Unit Volume','integer',15,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('water.facts.WaterBill.validitydate','water.facts.WaterBill','validitydate','Validity Date','date',7,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('water.facts.WaterBill.volume','water.facts.WaterBill','volume','Volume','integer',11,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('water.facts.WaterBill.year','water.facts.WaterBill','year','Year','integer',4,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('water.facts.WaterBill.yearmonth','water.facts.WaterBill','yearmonth','Year Month','integer',10,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('water.facts.WaterBillGroup.id','water.facts.WaterBillGroup','id','ID','string',1,'lookup','water_billgroup:lookup','objid','objid',NULL,NULL,NULL,'string',NULL),('water.facts.WaterBillGroup.tag','water.facts.WaterBillGroup','tag','Tag','string',2,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('water.facts.WaterBillItem.acctid','water.facts.WaterBillItem','acctid','Account','string',3,'lookup','itemaccount:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('water.facts.WaterBillItem.amount','water.facts.WaterBillItem','amount','Amount','decimal',5,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('water.facts.WaterBillItem.amtpaid','water.facts.WaterBillItem','amtpaid','Amt Paid','decimal',20,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('water.facts.WaterBillItem.balance','water.facts.WaterBillItem','balance','Balance','decimal',17,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('water.facts.WaterBillItem.billcode','water.facts.WaterBillItem','billcode','Bill code','string',4,'lookup','itemaccount:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('water.facts.WaterBillItem.billdate','water.facts.WaterBillItem','billdate','Bill Date','date',12,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('water.facts.WaterBillItem.billid','water.facts.WaterBillItem','billid','Bill ID','string',2,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('water.facts.WaterBillItem.day','water.facts.WaterBillItem','day','Day','integer',10,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('water.facts.WaterBillItem.discount','water.facts.WaterBillItem','discount','Discount','decimal',18,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('water.facts.WaterBillItem.duedate','water.facts.WaterBillItem','duedate','Due Date','date',19,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('water.facts.WaterBillItem.forwarded','water.facts.WaterBillItem','forwarded','Forwarded','boolean',14,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('water.facts.WaterBillItem.input','water.facts.WaterBillItem','input','Input','boolean',21,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('water.facts.WaterBillItem.interest','water.facts.WaterBillItem','interest','Interest','decimal',8,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('water.facts.WaterBillItem.month','water.facts.WaterBillItem','month','Month','integer',9,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('water.facts.WaterBillItem.objid','water.facts.WaterBillItem','objid','ObjID','string',1,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('water.facts.WaterBillItem.paid','water.facts.WaterBillItem','paid','Paid','boolean',16,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('water.facts.WaterBillItem.remarks','water.facts.WaterBillItem','remarks','Remarks','string',13,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('water.facts.WaterBillItem.surcharge','water.facts.WaterBillItem','surcharge','Surcharge','decimal',6,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('water.facts.WaterBillItem.tag','water.facts.WaterBillItem','tag','Tag','string',11,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('water.facts.WaterBillItem.year','water.facts.WaterBillItem','year','Year','integer',7,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('water.facts.WaterBillItem.yearmonth','water.facts.WaterBillItem','yearmonth','Year Month','integer',15,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('water.facts.WaterBillSchedule.billdate','water.facts.WaterBillSchedule','billdate','Bill Date','date',9,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('water.facts.WaterBillSchedule.billingduedate','water.facts.WaterBillSchedule','billingduedate','Billing Due Date','date',10,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('water.facts.WaterBillSchedule.day','water.facts.WaterBillSchedule','day','Day','integer',4,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('water.facts.WaterBillSchedule.discdate','water.facts.WaterBillSchedule','discdate','Discount Date','date',11,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('water.facts.WaterBillSchedule.duedate','water.facts.WaterBillSchedule','duedate','Due Date','date',12,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('water.facts.WaterBillSchedule.expirydate','water.facts.WaterBillSchedule','expirydate','Bill Expiry Date','date',13,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('water.facts.WaterBillSchedule.fromdate','water.facts.WaterBillSchedule','fromdate','From Date','date',5,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('water.facts.WaterBillSchedule.month','water.facts.WaterBillSchedule','month','Month','integer',3,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('water.facts.WaterBillSchedule.name','water.facts.WaterBillSchedule','name','Name','string',1,'lookup','water_billschedule_group:lookup','objid','objid',NULL,NULL,NULL,'string',NULL),('water.facts.WaterBillSchedule.readingdate','water.facts.WaterBillSchedule','readingdate','Reading Date','date',7,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('water.facts.WaterBillSchedule.readingduedate','water.facts.WaterBillSchedule','readingduedate','Reading Due Date','date',8,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('water.facts.WaterBillSchedule.todate','water.facts.WaterBillSchedule','todate','To Date','date',6,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('water.facts.WaterBillSchedule.year','water.facts.WaterBillSchedule','year','Year','integer',2,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('water.facts.WaterConsumption.amount','water.facts.WaterConsumption','amount','Amount','decimal',2,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('water.facts.WaterConsumption.billtype','water.facts.WaterConsumption','billtype','Bill Type','string',3,'lov',NULL,NULL,NULL,NULL,NULL,NULL,'string','MARKET_CONSUMPTION_TYPE'),('water.facts.WaterConsumption.volume','water.facts.WaterConsumption','volume','Volume','integer',1,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('water.facts.WaterMeter.capacity','water.facts.WaterMeter','capacity','Capacity','integer',3,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('water.facts.WaterMeter.sizeid','water.facts.WaterMeter','sizeid','Meter Size','string',2,'lookup','water_metersize:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('water.facts.WaterMeter.state','water.facts.WaterMeter','state','State','string',1,'lov',NULL,NULL,NULL,NULL,NULL,NULL,'string','WATER_METER_STATES'),('water.facts.WaterPaymentPlan.amtdue','water.facts.WaterPaymentPlan','amtdue','Amt Due','decimal',4,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('water.facts.WaterPaymentPlan.billcount','water.facts.WaterPaymentPlan','billcount','Bill Count','integer',8,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('water.facts.WaterPaymentPlan.downpayment','water.facts.WaterPaymentPlan','downpayment','Downpayment','decimal',2,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('water.facts.WaterPaymentPlan.installmentamt','water.facts.WaterPaymentPlan','installmentamt','Installment Amount','decimal',6,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('water.facts.WaterPaymentPlan.objid','water.facts.WaterPaymentPlan','objid','Objid','string',1,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('water.facts.WaterPaymentPlan.principal','water.facts.WaterPaymentPlan','principal','Principal','decimal',3,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('water.facts.WaterPaymentPlan.term','water.facts.WaterPaymentPlan','term','Term','integer',5,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('water.facts.WaterPaymentPlan.txntypeid','water.facts.WaterPaymentPlan','txntypeid','Txn Type','string',7,'lookup','water_txntype:lookup','objid','objid',NULL,NULL,NULL,'string',NULL),('water.facts.WaterTxn.typeid','water.facts.WaterTxn','typeid','Type','string',1,'lookup','water_txntype:lookup','objid','objid',NULL,NULL,NULL,'string',NULL);
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
  PRIMARY KEY (`name`,`ruleset`) USING BTREE,
  KEY `ruleset` (`ruleset`) USING BTREE,
  CONSTRAINT `sys_rulegroup_ibfk_1` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rulegroup`
--

LOCK TABLES `sys_rulegroup` WRITE;
/*!40000 ALTER TABLE `sys_rulegroup` DISABLE KEYS */;
INSERT INTO `sys_rulegroup` VALUES ('after-compute','waterconsumption','After Compute',2),('after-payment','waterpayment','After Payment',2),('apply-payment','waterpayment','Payment',1),('compute-fees','waterbilling','Compute Fees',1),('compute-interest','waterbilling','Compute Interest',4),('compute-rate','waterconsumption','Compute Rate',1),('compute-surcharge','waterbilling','Compute Surcharge',3),('compute-txn-fees','waterbilling','Compute Transaction Fees',2),('initial','waterbilling','Initial',0),('initial','waterbillingschedule','Initial',0),('initial','waterconsumption','Initial',0),('initial','waterpayment','Initial',0),('map-account','waterpayment','Map Account',3),('post-map-account','waterpayment','Post Map Account',4),('set-schedule','waterbillingschedule','Set Schedule',1),('summary','waterbilling','Summary',5);
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
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_ruleset`
--

LOCK TABLES `sys_ruleset` WRITE;
/*!40000 ALTER TABLE `sys_ruleset` DISABLE KEYS */;
INSERT INTO `sys_ruleset` VALUES ('waterbilling','Water Billing','waterbilling','WATER','RULE_AUTHOR',NULL),('waterbillingschedule','Water Billing Schedule','waterbillingschedule','WATER','RULE_AUTHOR',NULL),('waterconsumption','Water Consumption','waterconsumption','WATER','RULE_AUTHOR',NULL),('waterpayment','Water Payment','waterpayment','WATER','RULE_AUTHOR',NULL);
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
  PRIMARY KEY (`actiondef`,`ruleset`) USING BTREE,
  KEY `actiondef` (`actiondef`) USING BTREE,
  KEY `sys_ruleset_actiondef_ibfk_2` (`ruleset`) USING BTREE,
  CONSTRAINT `fk_sys_ruleset_actiondef_actiondef` FOREIGN KEY (`actiondef`) REFERENCES `sys_rule_actiondef` (`objid`),
  CONSTRAINT `sys_ruleset_actiondef_ibfk_2` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_ruleset_actiondef`
--

LOCK TABLES `sys_ruleset_actiondef` WRITE;
/*!40000 ALTER TABLE `sys_ruleset_actiondef` DISABLE KEYS */;
INSERT INTO `sys_ruleset_actiondef` VALUES ('waterbilling','enterprise.actions.PrintTest'),('waterconsumption','enterprise.actions.PrintTest'),('waterbilling','enterprise.actions.ThrowException'),('waterbillingschedule','enterprise.actions.ThrowException'),('waterconsumption','enterprise.actions.ThrowException'),('waterpayment','enterprise.actions.ThrowException'),('waterbilling','treasury.actions.AddBillItem'),('waterpayment','treasury.actions.AddCashReceiptItem'),('waterpayment','treasury.actions.AddCreditBillItem'),('waterbilling','treasury.actions.AddDiscountItem'),('waterpayment','treasury.actions.AddDiscountItem'),('waterbilling','treasury.actions.AddInterestItem'),('waterbilling','treasury.actions.AddSurchargeItem'),('waterbillingschedule','treasury.actions.AddVarInteger'),('waterbilling','treasury.actions.ApplyBillItemCredit'),('waterpayment','treasury.actions.ApplyBillItemCredit'),('waterpayment','treasury.actions.ApplyBillItemPayment'),('waterbilling','treasury.actions.RemoveBillItem'),('waterpayment','treasury.actions.SetBillItemAccount'),('waterbilling','treasury.actions.SetBillItemProperty'),('waterbilling','treasury.actions.SetBillValidityDate'),('waterpayment','treasury.actions.SetCashReceiptItemRemarks'),('waterbilling','treasury.actions.SupersedeBillItem'),('waterbilling','treasury.actions.UpdateBillItemAmount'),('waterbilling','water.actions.AddWaterBillItem'),('waterbillingschedule','water.actions.AddWaterBillSchedule'),('waterconsumption','water.actions.ChangeVolume'),('waterconsumption','water.actions.ComputeBillRate'),('waterbillingschedule','water.actions.SetWaterBillSchedule');
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
  PRIMARY KEY (`rulefact`,`ruleset`) USING BTREE,
  KEY `rulefact` (`rulefact`) USING BTREE,
  KEY `sys_ruleset_fact_ibfk_2` (`ruleset`) USING BTREE,
  CONSTRAINT `fk_sys_ruleset_fact_rulefact` FOREIGN KEY (`rulefact`) REFERENCES `sys_rule_fact` (`objid`),
  CONSTRAINT `sys_ruleset_fact_ibfk_2` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_ruleset_fact`
--

LOCK TABLES `sys_ruleset_fact` WRITE;
/*!40000 ALTER TABLE `sys_ruleset_fact` DISABLE KEYS */;
INSERT INTO `sys_ruleset_fact` VALUES ('waterpayment','com.rameses.rules.common.CurrentDate'),('waterbilling','treasury.facts.AbstractBillItem'),('waterpayment','treasury.facts.AbstractBillItem'),('waterbilling','treasury.facts.Bill'),('waterbilling','treasury.facts.BillItem'),('waterpayment','treasury.facts.CashReceiptItem'),('waterbilling','treasury.facts.CreditBillItem'),('waterpayment','treasury.facts.CreditBillItem'),('waterpayment','treasury.facts.DiscountItem'),('waterpayment','treasury.facts.ExcessPayment'),('waterbillingschedule','treasury.facts.HolidayFact'),('waterbilling','treasury.facts.InterestItem'),('waterpayment','treasury.facts.InterestItem'),('waterpayment','treasury.facts.Payment'),('waterpayment','treasury.facts.PaymentItem'),('waterbilling','treasury.facts.SurchargeItem'),('waterpayment','treasury.facts.SurchargeItem'),('waterbilling','treasury.facts.TransactionDate'),('waterpayment','treasury.facts.TransactionDate'),('waterbillingschedule','treasury.facts.VarInteger'),('waterbilling','water.facts.WaterAccount'),('waterconsumption','water.facts.WaterAccount'),('waterpayment','water.facts.WaterAccount'),('waterbilling','water.facts.WaterAccountTag'),('waterconsumption','water.facts.WaterAccountTag'),('waterpayment','water.facts.WaterAccountTag'),('waterbilling','water.facts.WaterBill'),('waterconsumption','water.facts.WaterBill'),('waterpayment','water.facts.WaterBill'),('waterbilling','water.facts.WaterBillGroup'),('waterbillingschedule','water.facts.WaterBillGroup'),('waterbilling','water.facts.WaterBillItem'),('waterpayment','water.facts.WaterBillItem'),('waterbilling','water.facts.WaterBillSchedule'),('waterbillingschedule','water.facts.WaterBillSchedule'),('waterpayment','water.facts.WaterBillSchedule'),('waterbilling','water.facts.WaterMeter'),('waterconsumption','water.facts.WaterMeter'),('waterbilling','water.facts.WaterPaymentPlan'),('waterbillingschedule','water.facts.WaterScheduleParam'),('waterbilling','water.facts.WaterTxn'),('waterbilling','water.facts.WaterUtilityConsumption');
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
  PRIMARY KEY (`objid`) USING BTREE
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
  PRIMARY KEY (`objid`) USING BTREE,
  UNIQUE KEY `uix_username` (`username`) USING BTREE,
  KEY `ix_lastname_firstname` (`lastname`,`firstname`) USING BTREE,
  KEY `ix_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES ('USR-7c0d9317:18e5a31b423:-7d26','WATER','WATER','WATER','WATER','WATER, WATER WATER','WATER','WATER'),('USR-ADMIN','ADMIN','ADMIN','ADMIN','.','ADMIN, ADMIN .','ADMIN',NULL);
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
  PRIMARY KEY (`objid`) USING BTREE,
  UNIQUE KEY `uix_sys_user_role_uid` (`uid`) USING BTREE,
  KEY `fk_sys_user_role_role` (`role`) USING BTREE,
  KEY `fk_sys_user_role_userid` (`userid`) USING BTREE,
  CONSTRAINT `fk_sys_user_role_role` FOREIGN KEY (`role`) REFERENCES `sys_role` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES ('USRROL-302993ce:18de35bd614:-7ff4','WF_EDITOR','USR-4cb9ce01:18de3329ce5:-7dd2','WATER',NULL,NULL,NULL,NULL,'USR-4cb9ce01:18de3329ce5:-7dd2-WF_EDITOR'),('USRROL-302993ce:18de35bd614:-7ff5','TEST','USR-4cb9ce01:18de3329ce5:-7dd2','WATER',NULL,NULL,NULL,NULL,'USR-4cb9ce01:18de3329ce5:-7dd2-TEST'),('USRROL-302993ce:18de35bd614:-7ff6','RULE_AUTHOR','USR-4cb9ce01:18de3329ce5:-7dd2','WATER',NULL,NULL,NULL,NULL,'USR-4cb9ce01:18de3329ce5:-7dd2-RULE_AUTHOR'),('USRROL-302993ce:18de35bd614:-7ff7','REPORT_EDITOR','USR-4cb9ce01:18de3329ce5:-7dd2','WATER',NULL,NULL,NULL,NULL,'USR-4cb9ce01:18de3329ce5:-7dd2-REPORT_EDITOR'),('USRROL-302993ce:18de35bd614:-7ff8','READER','USR-4cb9ce01:18de3329ce5:-7dd2','WATER',NULL,NULL,NULL,NULL,'USR-4cb9ce01:18de3329ce5:-7dd2-READER'),('USRROL-302993ce:18de35bd614:-7ff9','PROCESSOR','USR-4cb9ce01:18de3329ce5:-7dd2','WATER',NULL,NULL,NULL,NULL,'USR-4cb9ce01:18de3329ce5:-7dd2-PROCESSOR'),('USRROL-302993ce:18de35bd614:-7ffa','PAYMENT_PROCESSOR','USR-4cb9ce01:18de3329ce5:-7dd2','WATER',NULL,NULL,NULL,NULL,'USR-4cb9ce01:18de3329ce5:-7dd2-PAYMENT_PROCESSOR'),('USRROL-302993ce:18de35bd614:-7ffb','MASTER','USR-4cb9ce01:18de3329ce5:-7dd2','WATER',NULL,NULL,NULL,NULL,'USR-4cb9ce01:18de3329ce5:-7dd2-MASTER'),('USRROL-302993ce:18de35bd614:-7ffc','DATA_ENTRY_CLERK','USR-4cb9ce01:18de3329ce5:-7dd2','WATER',NULL,NULL,NULL,NULL,'USR-4cb9ce01:18de3329ce5:-7dd2-DATA_ENTRY_CLERK'),('USRROL-302993ce:18de35bd614:-7ffd','BILLER','USR-4cb9ce01:18de3329ce5:-7dd2','WATER',NULL,NULL,NULL,NULL,'USR-4cb9ce01:18de3329ce5:-7dd2-BILLER'),('USRROL-302993ce:18de35bd614:-7ffe','APPROVER','USR-4cb9ce01:18de3329ce5:-7dd2','WATER',NULL,NULL,NULL,NULL,'USR-4cb9ce01:18de3329ce5:-7dd2-APPROVER'),('USRROL-302993ce:18de35bd614:-7fff','ADMIN','USR-4cb9ce01:18de3329ce5:-7dd2','WATER',NULL,NULL,NULL,NULL,'USR-4cb9ce01:18de3329ce5:-7dd2-ADMIN'),('USRROL-302993ce:18de35bd614:-8000','ACCOUNT_MANAGER','USR-4cb9ce01:18de3329ce5:-7dd2','WATER',NULL,NULL,NULL,NULL,'USR-4cb9ce01:18de3329ce5:-7dd2-ACCOUNT_MANAGER'),('USRROL5be77a81:18e5a358870:-7ff4','WF_EDITOR','USR-7c0d9317:18e5a31b423:-7d26','WATER',NULL,NULL,NULL,NULL,'USR-7c0d9317:18e5a31b423:-7d26-WF_EDITOR'),('USRROL5be77a81:18e5a358870:-7ff5','TEST','USR-7c0d9317:18e5a31b423:-7d26','WATER',NULL,NULL,NULL,NULL,'USR-7c0d9317:18e5a31b423:-7d26-TEST'),('USRROL5be77a81:18e5a358870:-7ff6','RULE_AUTHOR','USR-7c0d9317:18e5a31b423:-7d26','WATER',NULL,NULL,NULL,NULL,'USR-7c0d9317:18e5a31b423:-7d26-RULE_AUTHOR'),('USRROL5be77a81:18e5a358870:-7ff7','REPORT_EDITOR','USR-7c0d9317:18e5a31b423:-7d26','WATER',NULL,NULL,NULL,NULL,'USR-7c0d9317:18e5a31b423:-7d26-REPORT_EDITOR'),('USRROL5be77a81:18e5a358870:-7ff8','READER','USR-7c0d9317:18e5a31b423:-7d26','WATER',NULL,NULL,NULL,NULL,'USR-7c0d9317:18e5a31b423:-7d26-READER'),('USRROL5be77a81:18e5a358870:-7ff9','PROCESSOR','USR-7c0d9317:18e5a31b423:-7d26','WATER',NULL,NULL,NULL,NULL,'USR-7c0d9317:18e5a31b423:-7d26-PROCESSOR'),('USRROL5be77a81:18e5a358870:-7ffa','PAYMENT_PROCESSOR','USR-7c0d9317:18e5a31b423:-7d26','WATER',NULL,NULL,NULL,NULL,'USR-7c0d9317:18e5a31b423:-7d26-PAYMENT_PROCESSOR'),('USRROL5be77a81:18e5a358870:-7ffb','MASTER','USR-7c0d9317:18e5a31b423:-7d26','WATER',NULL,NULL,NULL,NULL,'USR-7c0d9317:18e5a31b423:-7d26-MASTER'),('USRROL5be77a81:18e5a358870:-7ffc','DATA_ENTRY_CLERK','USR-7c0d9317:18e5a31b423:-7d26','WATER',NULL,NULL,NULL,NULL,'USR-7c0d9317:18e5a31b423:-7d26-DATA_ENTRY_CLERK'),('USRROL5be77a81:18e5a358870:-7ffd','BILLER','USR-7c0d9317:18e5a31b423:-7d26','WATER',NULL,NULL,NULL,NULL,'USR-7c0d9317:18e5a31b423:-7d26-BILLER'),('USRROL5be77a81:18e5a358870:-7ffe','APPROVER','USR-7c0d9317:18e5a31b423:-7d26','WATER',NULL,NULL,NULL,NULL,'USR-7c0d9317:18e5a31b423:-7d26-APPROVER'),('USRROL5be77a81:18e5a358870:-7fff','ADMIN','USR-7c0d9317:18e5a31b423:-7d26','WATER',NULL,NULL,NULL,NULL,'USR-7c0d9317:18e5a31b423:-7d26-ADMIN'),('USRROL5be77a81:18e5a358870:-8000','ACCOUNT_MANAGER','USR-7c0d9317:18e5a31b423:-7d26','WATER',NULL,NULL,NULL,NULL,'USR-7c0d9317:18e5a31b423:-7d26-ACCOUNT_MANAGER');
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
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_var`
--

LOCK TABLES `sys_var` WRITE;
/*!40000 ALTER TABLE `sys_var` DISABLE KEYS */;
INSERT INTO `sys_var` VALUES ('sys_report_header','LGUFORMALNAME=ILIGAN CITY\nTREASURERNAME=MR.WATER',NULL,NULL,NULL),('water_account_acctno','WA-[yyyy][MM][%06d]',NULL,NULL,NULL),('water_appno','WA[yyyy][MM][%06d]',NULL,NULL,NULL),('water_billno','WB-[yyyy][MM][%06d]',NULL,NULL,NULL),('water_changeapp_appno','MCA-[yyyy][MM][%06d]',NULL,NULL,NULL),('water_compromise_controlno','MCOMP-[yyyy][MM][%06d]',NULL,NULL,NULL);
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
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_wf`
--

LOCK TABLES `sys_wf` WRITE;
/*!40000 ALTER TABLE `sys_wf` DISABLE KEYS */;
INSERT INTO `sys_wf` VALUES ('water_account','Water Account','WATER'),('water_batch_bill','Water Batch Bill','WATER'),('water_txn_adjustreading','Water Adjust Reading','WATER'),('water_txn_capture_account','Water Capture Account','WATER'),('water_txn_changeinfo','Water Change Location','WATER'),('water_txn_changeowner','Water Change Owner','WATER'),('water_txn_creditnote','Water Credit Note','WATER'),('water_txn_disconnection','Water Disconnection','WATER'),('water_txn_newaccount','Water New Account','WATER'),('water_txn_payment_plan','Water Payment Plan','WATER'),('water_txn_reconnection','Water Reconnection','WATER');
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
  PRIMARY KEY (`name`,`processname`) USING BTREE,
  KEY `fk_sys_wf_eventaction_transition` (`processname`,`nodename`,`transitionto`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_wf_eventaction`
--

LOCK TABLES `sys_wf_eventaction` WRITE;
/*!40000 ALTER TABLE `sys_wf_eventaction` DISABLE KEYS */;
INSERT INTO `sys_wf_eventaction` VALUES ('water_txn_capture_account','activate-account','after',1,'approval','end','WaterTxnService','activateAccount','[ txnid: refid, action: \'pending\' ]',NULL,1),('water_txn_newaccount','activate-new-account','after',1,'for-activation','end','WaterTxnService','activateAccount','[ txnid: refid, action: \'activate\' ]',NULL,1),('water_txn_changeinfo','apply-changes','after',1,'approval','end','WaterTxnService','applyChanges','[ txnid:  refid ]',NULL,1),('water_txn_changeowner','apply-changes','after',1,'approval','end','WaterTxnService','applyChanges','[ txnid:  refid ]',NULL,1),('water_txn_payment_plan','check-has-bill','before',1,'check-has-bill','approval','WaterTxnService','checkHasBill','[ txnid: refid ]',NULL,1),('water_txn_reconnection','check-has-bill','before',2,'assessment','approval','WaterTxnService','validateHasBill','[ txnid : refid ]',NULL,1),('water_txn_reconnection','check-no-unpaid-balance','before',1,'assessment','approval','WaterTxnService','checkUnpaidBalance','[ txnid: refid ]',NULL,1),('water_batch_bill','check-unbilled-accounts','before',1,'pending','for-reading','WaterBatchBillingService','checkUnbilledAccounts','[ batchid: refid ]',NULL,1),('water_batch_bill','check-unbilled-accounts2','before',1,'pending','for-mobile-reading','WaterBatchBillingService','checkUnbilledAccounts','[ batchid: refid ]',NULL,1),('water_batch_bill','check-unposted-bills','before',1,'for-reading','for-approval','WaterBatchBillingService','checkUnpostedBills','[ batchid: refid ]',NULL,1),('water_batch_bill','check-unposted-mobile-bills','before',1,'for-mobile-reading','for-approval','WaterBatchBillingService','checkUnpostedBills','[ batchid: refid ]',NULL,1),('water_batch_bill','check-unprinted-bills','before',1,'for-printing','end','WaterBatchBillingService','checkUnprintedBills','[ batchid: refid ]',NULL,0),('water_account','detach-from-batch','before',1,'active','hold','WaterAccountService','detachBillFromBatch','[ acctid: refid ]',NULL,1),('water_txn_payment_plan','determine-has-bill','before',1,'check-has-bill',NULL,'WaterTxnService','checkHasBill','[ txnid: refid ]',NULL,1),('water_txn_disconnection','disconnect','after',1,'approval','end','WaterTxnService','disconnectAccount','[ txnid: refid ]',NULL,1),('water_txn_creditnote','post-credit','after',1,'approval','end','WaterTxnService','postCredit','[ txnid: refid ]',NULL,1),('water_txn_payment_plan','post-credit','after',1,'payment','end','WaterTxnService','postCredit','[ txnid: refid ]',NULL,1),('water_txn_payment_plan','post-credit-wo-payment','after',1,'check-has-bill','end','WaterTxnService','postCredit','[ txnid: refid ]',NULL,1),('water_account','reattach-bill-to-batch','before',1,'hold','active','WaterAccountService','rejoinBillToBatch','[ acctid: refid ]',NULL,1),('water_txn_reconnection','reconnect','after',1,'payment','end','WaterTxnService','reconnectAccount','[ txnid: refid ]',NULL,1),('water_txn_adjustreading','update-reading','after',1,'approval','end','WaterTxnService','updateReadings','[ txnid:  refid ]',NULL,1),('water_txn_payment_plan','validate-payment-plan','before',1,'assessment','approval','WaterTxnService','validatePaymentPlan','[ txnid: refid ]',NULL,1);
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
  PRIMARY KEY (`name`,`processname`) USING BTREE,
  KEY `fk_sys_wf_node_role` (`role`) USING BTREE,
  CONSTRAINT `fk_sys_wf_node_role` FOREIGN KEY (`role`) REFERENCES `sys_role` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_wf_node`
--

LOCK TABLES `sys_wf_node` WRITE;
/*!40000 ALTER TABLE `sys_wf_node` DISABLE KEYS */;
INSERT INTO `sys_wf_node` VALUES ('active','water_account','Active','state',3,0,'WATER','ACCOUNT_MANAGER','[fillColor:\"#c0c0c0\",size:[107,50],pos:[435,97],type:\"state\"]','[:]',NULL),('approval','water_txn_adjustreading','Approval','state',2,1,NULL,NULL,'[fillColor:\"#c0c0c0\",size:[109,49],pos:[403,179],type:\"state\"]','[:]',1),('approval','water_txn_capture_account','Approval','state',2,1,NULL,NULL,'[fillColor:\"#c0c0c0\",size:[109,49],pos:[403,179],type:\"state\"]','[:]',1),('approval','water_txn_changeinfo','Approval','state',2,1,NULL,NULL,'[type:\"state\",fillColor:\"#c0c0c0\",pos:[403,179],size:[109,49]]','[:]',1),('approval','water_txn_changeowner','Approval','state',2,1,NULL,NULL,'[fillColor:\"#c0c0c0\",size:[109,49],pos:[403,179],type:\"state\"]','[:]',1),('approval','water_txn_creditnote','Approval','state',2,1,NULL,NULL,'[fillColor:\"#c0c0c0\",size:[109,49],pos:[403,179],type:\"state\"]','[:]',1),('approval','water_txn_disconnection','Approval','state',2,1,NULL,NULL,'[fillColor:\"#c0c0c0\",size:[109,49],pos:[403,179],type:\"state\"]','[:]',1),('approval','water_txn_newaccount','Approval','state',5,1,NULL,NULL,'[fillColor:\"#c0c0c0\",size:[109,49],pos:[438,259],type:\"state\"]','[:]',1),('approval','water_txn_payment_plan','Approval','state',3,1,NULL,NULL,'[fillColor:\"#c0c0c0\",size:[109,49],pos:[393,149],type:\"state\"]','[:]',1),('approval','water_txn_reconnection','Approval','state',3,1,NULL,NULL,'[fillColor:\"#c0c0c0\",size:[109,49],pos:[393,149],type:\"state\"]','[:]',1),('assessment','water_txn_changeowner','Assessment','state',0,0,NULL,NULL,'[fillColor:\"#c0c0c0\",size:[109,57],pos:[389,33],type:\"state\"]','[:]',1),('assessment','water_txn_newaccount','Assessment','state',4,0,'WATER','BILLER','[fillColor:\"#c0c0c0\",size:[115,51],pos:[463,130],type:\"state\"]','[:]',1),('assessment','water_txn_payment_plan','Assessment','state',2,0,'WATER','BILLER','[fillColor:\"#c0c0c0\",size:[115,51],pos:[191,138],type:\"state\"]','[:]',1),('assessment','water_txn_reconnection','Assessment','state',2,0,'WATER','BILLER','[fillColor:\"#c0c0c0\",size:[115,51],pos:[191,138],type:\"state\"]','[:]',1),('check-has-bill','water_txn_payment_plan','Check Has Bill','decision',0,0,NULL,NULL,'[fillColor:\"#c0c0c0\",size:[136,61],pos:[637,96],type:\"decision\"]','[:]',NULL),('closure','water_account','For Closure','state',6,0,'WATER','ACCOUNT_MANAGER','[fillColor:\"#c0c0c0\",size:[123,52],pos:[822,260],type:\"state\"]','[:]',NULL),('disconnected','water_account','Disconnected','state',5,0,NULL,NULL,'[fillColor:\"#c0c0c0\",size:[118,56],pos:[617,254],type:\"state\"]','[:]',NULL),('end','water_account','Closed','end',7,NULL,NULL,NULL,'[fillColor:\"#ff0000\",size:[32,32],pos:[1013,176],type:\"end\"]','[:]',NULL),('end','water_batch_bill','Closed','end',8,NULL,NULL,NULL,'[fillColor:\"#ff0000\",size:[32,32],pos:[1044,288],type:\"end\"]','[:]',NULL),('end','water_txn_adjustreading','Completed','end',5,0,NULL,NULL,'[fillColor:\"#ff0000\",size:[32,32],pos:[496,458],type:\"end\"]','[:]',NULL),('end','water_txn_capture_account','Completed','end',5,0,NULL,NULL,'[fillColor:\"#ff0000\",size:[32,32],pos:[496,458],type:\"end\"]','[:]',NULL),('end','water_txn_changeinfo','Completed','end',5,0,NULL,NULL,'[type:\"end\",fillColor:\"#ff0000\",pos:[496,458],size:[32,32]]','[:]',NULL),('end','water_txn_changeowner','Completed','end',5,0,NULL,NULL,'[fillColor:\"#ff0000\",size:[32,32],pos:[496,458],type:\"end\"]','[:]',NULL),('end','water_txn_creditnote','Completed','end',5,0,NULL,NULL,'[fillColor:\"#ff0000\",size:[32,32],pos:[496,458],type:\"end\"]','[:]',NULL),('end','water_txn_disconnection','Completed','end',5,0,NULL,NULL,'[fillColor:\"#ff0000\",size:[32,32],pos:[496,458],type:\"end\"]','[:]',NULL),('end','water_txn_newaccount','Completed','end',8,0,NULL,NULL,'[fillColor:\"#ff0000\",size:[32,32],pos:[897,431],type:\"end\"]','[:]',NULL),('end','water_txn_payment_plan','Completed','end',5,0,NULL,NULL,'[fillColor:\"#ff0000\",size:[32,32],pos:[913,322],type:\"end\"]','[:]',NULL),('end','water_txn_reconnection','Completed','end',5,0,NULL,NULL,'[fillColor:\"#ff0000\",size:[32,32],pos:[605,336],type:\"end\"]','[:]',NULL),('for-activation','water_txn_newaccount','For Activation','state',7,0,NULL,NULL,'[fillColor:\"#c0c0c0\",size:[124,56],pos:[835,309],type:\"state\"]','[:]',1),('for-approval','water_batch_bill','For Approval','state',6,0,'WATER','APPROVER','[fillColor:\"#c0c0c0\",size:[108,49],pos:[650,267],type:\"state\"]','[:]',1),('for-mobile-reading','water_batch_bill','For Mobile Reading','state',4,0,'WATER','BILLER','[fillColor:\"#c0c0c0\",size:[131,44],pos:[444,53],type:\"state\"]','[:]',NULL),('for-printing','water_batch_bill','For Printing','state',7,0,'WATER','BILLER','[fillColor:\"#c0c0c0\",size:[106,57],pos:[839,280],type:\"state\"]','[:]',1),('for-reading','water_batch_bill','For Reading','state',3,0,'WATER','BILLER','[fillColor:\"#c0c0c0\",size:[102,51],pos:[321,148],type:\"state\"]','[:]',1),('hold','water_account','On Hold','state',4,0,'WATER','ACCOUNT_MANAGER','[fillColor:\"#c0c0c0\",size:[119,49],pos:[650,32],type:\"state\"]','[:]',NULL),('inspection','water_txn_newaccount','Inspection','state',3,0,NULL,NULL,'[fillColor:\"#c0c0c0\",size:[111,51],pos:[413,27],type:\"state\"]','[:]',1),('payment','water_txn_newaccount','Payment','state',6,0,NULL,NULL,'[fillColor:\"#c0c0c0\",size:[109,53],pos:[646,262],type:\"state\"]','[:]',NULL),('payment','water_txn_payment_plan','Payment','state',4,0,'WATER','PAYMENT_PROCESSOR','[fillColor:\"#c0c0c0\",size:[112,55],pos:[705,219],type:\"state\"]','[:]',NULL),('payment','water_txn_reconnection','Payment','state',4,0,'WATER','PAYMENT_PROCESSOR','[fillColor:\"#c0c0c0\",size:[112,55],pos:[611,206],type:\"state\"]','[:]',NULL),('pending','water_account','Pending','state',2,0,'WATER','ACCOUNT_MANAGER','[fillColor:\"#c0c0c0\",size:[136,65],pos:[243,165],type:\"state\"]','[:]',1),('pending','water_batch_bill','Pending','state',2,0,'WATER','BILLER','[fillColor:\"#c0c0c0\",size:[118,56],pos:[155,85],type:\"state\"]','[:]',NULL),('receiving','water_txn_newaccount','Receiving','state',2,0,NULL,NULL,'[fillColor:\"#c0c0c0\",size:[106,51],pos:[236,77],type:\"state\"]','[:]',1),('start','water_account','Start','start',1,NULL,NULL,NULL,'[fillColor:\"#00ff00\",size:[32,32],pos:[153,77],type:\"start\"]','[:]',NULL),('start','water_batch_bill','Start','start',1,NULL,NULL,NULL,'[fillColor:\"#00ff00\",size:[32,32],pos:[67,25],type:\"start\"]','[:]',NULL),('start','water_txn_adjustreading','start','start',1,NULL,NULL,NULL,'[fillColor:\"#00ff00\",size:[32,32],pos:[159,29],type:\"start\"]','[:]',NULL),('start','water_txn_capture_account','start','start',1,NULL,NULL,NULL,'[fillColor:\"#00ff00\",size:[32,32],pos:[159,29],type:\"start\"]','[:]',NULL),('start','water_txn_changeinfo','start','start',1,NULL,NULL,NULL,'[type:\"start\",fillColor:\"#00ff00\",pos:[159,29],size:[32,32]]','[:]',NULL),('start','water_txn_changeowner','start','start',1,NULL,NULL,NULL,'[fillColor:\"#00ff00\",size:[32,32],pos:[159,29],type:\"start\"]','[:]',NULL),('start','water_txn_creditnote','start','start',1,NULL,NULL,NULL,'[fillColor:\"#00ff00\",size:[32,32],pos:[159,29],type:\"start\"]','[:]',NULL),('start','water_txn_disconnection','start','start',1,NULL,NULL,NULL,'[fillColor:\"#00ff00\",size:[32,32],pos:[159,29],type:\"start\"]','[:]',NULL),('start','water_txn_newaccount','start','start',1,NULL,NULL,NULL,'[fillColor:\"#00ff00\",size:[32,32],pos:[159,29],type:\"start\"]','[:]',NULL),('start','water_txn_payment_plan','start','start',1,NULL,NULL,NULL,'[fillColor:\"#00ff00\",size:[32,32],pos:[159,29],type:\"start\"]','[:]',NULL),('start','water_txn_reconnection','start','start',1,NULL,NULL,NULL,'[fillColor:\"#00ff00\",size:[32,32],pos:[159,29],type:\"start\"]','[:]',NULL);
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
  PRIMARY KEY (`action`,`parentid`,`processname`,`to`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_wf_transition`
--

LOCK TABLES `sys_wf_transition` WRITE;
/*!40000 ALTER TABLE `sys_wf_transition` DISABLE KEYS */;
INSERT INTO `sys_wf_transition` VALUES ('for-activation','water_txn_newaccount','activate','end',0,NULL,'[:]',NULL,'Activate','[size:[32,69],pos:[897,366],type:\"arrow\",points:[897,366,929,435]]'),('start','water_account','activate','active',0,NULL,'[:]',NULL,'Activate','[size:[253,28],pos:[185,92],type:\"arrow\",points:[185,92,323,103,379,110,438,120]]'),('approval','water_txn_adjustreading','approve','end',0,NULL,'[showConfirm:true,confirmMessage:\"You are about to approve?\"]',NULL,'Approve','[size:[47,230],pos:[462,228],type:\"arrow\",points:[462,228,474,290,509,458]]'),('approval','water_txn_capture_account','approve','end',0,NULL,'[showConfirm:true,confirmMessage:\"You are about to approve?\"]',NULL,'Approve','[size:[47,230],pos:[462,228],type:\"arrow\",points:[462,228,474,290,509,458]]'),('approval','water_txn_changeinfo','approve','end',0,NULL,'[showConfirm:true,confirmMessage:\"You are about to approve?\"]',NULL,'Approve','[points:[462,228,474,290,509,458],type:\"arrow\",pos:[462,228],size:[47,230]]'),('approval','water_txn_changeowner','approve','end',0,NULL,'[showConfirm:true,confirmMessage:\"You are about to approve?\"]',NULL,'Approve','[size:[47,230],pos:[462,228],type:\"arrow\",points:[462,228,474,290,509,458]]'),('approval','water_txn_creditnote','approve','end',0,NULL,'[showConfirm:true,confirmMessage:\"You are about to approve?\"]',NULL,'Approve','[size:[47,230],pos:[462,228],type:\"arrow\",points:[462,228,474,290,509,458]]'),('approval','water_txn_disconnection','approve','end',0,NULL,'[showConfirm:true,confirmMessage:\"You are about to approve this transaction. Proceed with disconnection?\"]',NULL,'Approve','[size:[47,230],pos:[462,228],type:\"arrow\",points:[462,228,474,290,509,458]]'),('approval','water_txn_newaccount','approve','payment',0,NULL,'[:]',NULL,'Approve for Payment','[size:[99,22],pos:[547,277],type:\"arrow\",points:[547,299,595,290,646,277]]'),('approval','water_txn_payment_plan','approve','check-has-bill',0,NULL,'[showConfirm:true,confirmMessage:\"You are about to approve this transaction. Proceed?\"]',NULL,'Approve','[size:[135,25],pos:[502,139],type:\"arrow\",points:[502,164,540,159,637,139]]'),('approval','water_txn_reconnection','approve','payment',0,NULL,'[showConfirm:true,confirmMessage:\"You are about to approve this for payment. Proceed?\"]',NULL,'Approve for Payment','[size:[109,50],pos:[502,159],type:\"arrow\",points:[502,164,540,159,611,209]]'),('for-approval','water_batch_bill','approve','for-printing',0,NULL,'[:]',NULL,'Approve','[size:[81,9],pos:[758,294],type:\"arrow\",points:[758,294,839,303]]'),('pending','water_account','approve','active',0,NULL,'[showConfirm:true,confirmMessage:\"Approve ledger?\"]',NULL,'Approve','[size:[57,22],pos:[379,147],type:\"arrow\",points:[379,169,436,147]]'),('active','water_account','disconnect','disconnected',0,NULL,'[visibleWhen:\"#{ false }\"]',NULL,'Disconnect','[size:[75,121],pos:[542,141],type:\"arrow\",points:[542,141,617,262]]'),('hold','water_account','disconnect','disconnected',0,NULL,'[visibleWhen:\"#{ false }\"]',NULL,'Disconnect','[size:[24,173],pos:[681,81],type:\"arrow\",points:[705,81,681,254]]'),('closure','water_account','end','end',0,NULL,'[showConfirm:true,confirmMessage:\"This transaction cannot be reversed. Proceed?\"]',NULL,'End','[size:[88,54],pos:[925,206],type:\"arrow\",points:[925,260,1013,206]]'),('check-has-bill','water_txn_payment_plan','has-bill','payment',0,'#{ info.hasbill == true }','[:]',NULL,'Has Bill','[size:[41,62],pos:[722,157],type:\"arrow\",points:[722,157,763,219]]'),('check-has-bill','water_txn_payment_plan','has-no-bill','end',0,'#{ info.hasbill == false }','[:]',NULL,'No Bill','[size:[173,180],pos:[773,142],type:\"arrow\",points:[773,142,946,185,930,322]]'),('active','water_account','hold','hold',0,NULL,'[showPrompt:true]',NULL,'Hold','[size:[107,65],pos:[542,48],type:\"arrow\",points:[542,113,649,48]]'),('start','water_account','pending','pending',0,NULL,'[:]',NULL,'Pending','[size:[65,64],pos:[185,101],type:\"arrow\",points:[185,101,250,165]]'),('payment','water_txn_newaccount','post-payment','for-activation',0,NULL,'[:]',NULL,'Post Payment','[size:[122,6],pos:[738,309],type:\"arrow\",points:[738,315,860,309]]'),('payment','water_txn_payment_plan','post-payment','end',0,NULL,'[:]',NULL,'Post Payment','[size:[187,48],pos:[750,274],type:\"arrow\",points:[750,274,937,322]]'),('payment','water_txn_reconnection','post-payment','end',0,NULL,'[:]',NULL,'Post Payment','[size:[27,75],pos:[629,261],type:\"arrow\",points:[656,261,629,336]]'),('disconnected','water_account','reconnect','active',0,NULL,'[visibleWhen:\"#{ false }\"]',NULL,'Reconnect','[size:[88,146],pos:[528,147],type:\"arrow\",points:[616,293,528,205,528,147]]'),('payment','water_txn_payment_plan','return-to-assessment','assessment',0,NULL,'[:]',NULL,'Return for Assessment','[size:[399,77],pos:[306,176],type:\"arrow\",points:[705,237,427,253,306,176]]'),('payment','water_txn_reconnection','return-to-assessment','assessment',0,NULL,'[:]',NULL,'Return for Assessment','[size:[305,77],pos:[306,176],type:\"arrow\",points:[611,224,427,253,306,176]]'),('for-mobile-reading','water_batch_bill','return-to-pending','pending',0,NULL,'[:]',NULL,'Send to Pending','[size:[171,22],pos:[273,83],type:\"arrow\",points:[444,83,273,105]]'),('for-reading','water_batch_bill','send-to-pending','pending',0,NULL,'[:]',NULL,'Return to Pending','[size:[75,35],pos:[273,113],type:\"arrow\",points:[348,148,317,114,273,113]]'),('start','water_batch_bill','start','pending',0,NULL,'[:]',NULL,'Start','[size:[63,36],pos:[99,49],type:\"arrow\",points:[99,49,162,85]]'),('start','water_txn_adjustreading','start','approval',0,NULL,'[:]',NULL,'Start','[size:[212,152],pos:[191,46],type:\"arrow\",points:[191,46,403,198]]'),('start','water_txn_capture_account','start','approval',0,NULL,'[:]',NULL,'Start','[size:[212,152],pos:[191,46],type:\"arrow\",points:[191,46,403,198]]'),('start','water_txn_changeinfo','start','approval',0,NULL,'[:]',NULL,'Start','[points:[191,46,403,198],type:\"arrow\",pos:[191,46],size:[212,152]]'),('start','water_txn_changeowner','start','assessment',0,NULL,'[:]',NULL,'Start','[size:[198,10],pos:[191,45],type:\"arrow\",points:[191,45,389,55]]'),('start','water_txn_creditnote','start','approval',0,NULL,'[:]',NULL,'Start','[size:[212,152],pos:[191,46],type:\"arrow\",points:[191,46,403,198]]'),('start','water_txn_disconnection','start','approval',0,NULL,'[:]',NULL,'Start','[size:[212,152],pos:[191,46],type:\"arrow\",points:[191,46,403,198]]'),('start','water_txn_newaccount','start','receiving',0,NULL,'[:]',NULL,'Start','[size:[50,25],pos:[191,52],type:\"arrow\",points:[191,52,241,77]]'),('start','water_txn_payment_plan','start','assessment',0,NULL,'[:]',NULL,'Start','[size:[50,77],pos:[185,61],type:\"arrow\",points:[185,61,235,138]]'),('start','water_txn_reconnection','start','assessment',0,NULL,'[:]',NULL,'Start','[size:[50,77],pos:[185,61],type:\"arrow\",points:[185,61,235,138]]'),('assessment','water_txn_changeowner','submit','approval',0,NULL,'[:]',NULL,'Submit for Approval','[size:[8,89],pos:[445,90],type:\"arrow\",points:[445,90,453,179]]'),('assessment','water_txn_newaccount','submit','approval',0,NULL,'[:]',NULL,'Submit','[size:[18,78],pos:[495,181],type:\"arrow\",points:[513,181,495,259]]'),('assessment','water_txn_payment_plan','submit','approval',0,NULL,'[:]',NULL,'Submit','[size:[87,10],pos:[306,163],type:\"arrow\",points:[306,173,393,163]]'),('assessment','water_txn_reconnection','submit','approval',0,NULL,'[:]',NULL,'Submit','[size:[87,10],pos:[306,163],type:\"arrow\",points:[306,173,393,163]]'),('disconnected','water_account','submit','closure',0,NULL,'[showPrompt:true]',NULL,'Submit for Closure','[size:[87,14],pos:[735,275],type:\"arrow\",points:[735,289,822,275]]'),('for-mobile-reading','water_batch_bill','submit','for-approval',0,NULL,'[:]',NULL,'Submit for Approval','[size:[152,170],pos:[528,97],type:\"arrow\",points:[528,97,680,267]]'),('for-printing','water_batch_bill','submit','end',0,NULL,'[:]',NULL,'Finish','[size:[99,4],pos:[945,302],type:\"arrow\",points:[945,302,1044,306]]'),('for-reading','water_batch_bill','submit','for-approval',0,NULL,'[:]',NULL,'Send For Approval','[size:[227,78],pos:[423,190],type:\"arrow\",points:[423,190,650,268]]'),('inspection','water_txn_newaccount','submit','assessment',0,NULL,'[:]',NULL,'Submit','[size:[28,52],pos:[482,78],type:\"arrow\",points:[482,78,510,130]]'),('pending','water_batch_bill','submit','for-reading',0,NULL,'[:]',NULL,'Submit for Reading','[size:[76,29],pos:[245,141],type:\"arrow\",points:[245,141,321,170]]'),('receiving','water_txn_newaccount','submit','inspection',0,NULL,'[:]',NULL,'Submit for Inspection','[size:[71,17],pos:[342,70],type:\"arrow\",points:[342,87,413,70]]'),('pending','water_batch_bill','submit-for-mobile-reading','for-mobile-reading',0,NULL,'[:]',NULL,'Submit for Mobile Reading','[size:[194,31],pos:[250,54],type:\"arrow\",points:[250,85,291,54,444,68]]'),('hold','water_account','unhold','active',0,NULL,'[:]',NULL,'Reactivate','[size:[108,44],pos:[542,81],type:\"arrow\",points:[650,81,600,125,542,123]]'),('for-printing','water_batch_bill','unpost','for-reading',0,NULL,'[visibleWhen:\"#{ false }\"]',NULL,'Unpost','[size:[482,163],pos:[373,199],type:\"arrow\",points:[855,338,760,362,384,332,373,199]]');
/*!40000 ALTER TABLE `sys_wf_transition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmp_water_bill`
--

DROP TABLE IF EXISTS `tmp_water_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_water_bill` (
  `objid` varchar(50) NOT NULL,
  `acctid` varchar(50) DEFAULT NULL,
  `batchid` varchar(50) DEFAULT NULL,
  `billno` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `txnmode` varchar(50) DEFAULT NULL,
  `balanceforward` decimal(16,2) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `amtpaid` decimal(16,2) DEFAULT NULL,
  `otherfees` decimal(16,2) DEFAULT NULL,
  `surcharge` decimal(16,2) DEFAULT NULL,
  `interest` decimal(16,2) DEFAULT NULL,
  `discount` decimal(16,2) DEFAULT NULL,
  `prevreading` int(11) DEFAULT NULL,
  `reading` int(11) DEFAULT NULL,
  `volume` int(11) DEFAULT NULL,
  `rate` decimal(16,2) DEFAULT NULL,
  `scheduleid` varchar(50) DEFAULT NULL,
  `billdate` date DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `consumptionid` varchar(50) DEFAULT NULL,
  `hold` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `scheduleitemid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `ix_acctid` (`acctid`) USING BTREE,
  KEY `ix_year_month` (`acctid`,`year`,`month`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmp_water_bill`
--

LOCK TABLES `tmp_water_bill` WRITE;
/*!40000 ALTER TABLE `tmp_water_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmp_water_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_water_abstract_bill`
--

DROP TABLE IF EXISTS `vw_water_abstract_bill`;
/*!50001 DROP VIEW IF EXISTS `vw_water_abstract_bill`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_water_abstract_bill` AS SELECT 
 1 AS `objid`,
 1 AS `billno`,
 1 AS `billgroupid`,
 1 AS `billtype`,
 1 AS `year`,
 1 AS `month`,
 1 AS `particulars`,
 1 AS `amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_water_account`
--

DROP TABLE IF EXISTS `vw_water_account`;
/*!50001 DROP VIEW IF EXISTS `vw_water_account`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_water_account` AS SELECT 
 1 AS `objid`,
 1 AS `acctno`,
 1 AS `acctinfoid`,
 1 AS `taskid`,
 1 AS `lastbillid`,
 1 AS `billgroupid`,
 1 AS `indexno`,
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
 1 AS `meterid`,
 1 AS `classificationid`,
 1 AS `classification_objid`,
 1 AS `classification_name`,
 1 AS `location_text`,
 1 AS `location_unitno`,
 1 AS `location_bldgno`,
 1 AS `location_bldgname`,
 1 AS `location_street`,
 1 AS `location_subdivision`,
 1 AS `location_barangay_objid`,
 1 AS `location_barangay_name`,
 1 AS `location_lng`,
 1 AS `location_lat`,
 1 AS `business_objid`,
 1 AS `business_bin`,
 1 AS `business_tradename`,
 1 AS `units`,
 1 AS `tags`,
 1 AS `acctgroupid`,
 1 AS `acctgroup_name`,
 1 AS `acctgroup_fullpath`,
 1 AS `metered`,
 1 AS `meter_objid`,
 1 AS `meter_serialno`,
 1 AS `meter_brand`,
 1 AS `meter_capacity`,
 1 AS `meter_sizeid`,
 1 AS `meter_customerowned`,
 1 AS `meter_stocktype`,
 1 AS `meter_state`,
 1 AS `meter_size_objid`,
 1 AS `meter_size_title`,
 1 AS `meter_supersededid`,
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
 1 AS `notes`,
 1 AS `bill_balance`,
 1 AS `bill_year`,
 1 AS `bill_month`,
 1 AS `state`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_water_account_info`
--

DROP TABLE IF EXISTS `vw_water_account_info`;
/*!50001 DROP VIEW IF EXISTS `vw_water_account_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_water_account_info` AS SELECT 
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
 1 AS `meterid`,
 1 AS `classificationid`,
 1 AS `business_objid`,
 1 AS `business_bin`,
 1 AS `business_tradename`,
 1 AS `units`,
 1 AS `txnid`,
 1 AS `txntype`,
 1 AS `location_text`,
 1 AS `location_unitno`,
 1 AS `location_bldgno`,
 1 AS `location_bldgname`,
 1 AS `location_street`,
 1 AS `location_subdivision`,
 1 AS `location_barangay_objid`,
 1 AS `location_barangay_name`,
 1 AS `location_lng`,
 1 AS `location_lat`,
 1 AS `tags`,
 1 AS `notes`,
 1 AS `meter_objid`,
 1 AS `meter_serialno`,
 1 AS `meter_brand`,
 1 AS `meter_capacity`,
 1 AS `meter_sizeid`,
 1 AS `meter_customerowned`,
 1 AS `meter_stocktype`,
 1 AS `meter_state`,
 1 AS `meter_size_objid`,
 1 AS `meter_size_title`,
 1 AS `meter_supersededid`,
 1 AS `classification_objid`,
 1 AS `classification_name`,
 1 AS `classification_description`,
 1 AS `metered`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_water_batch_bill`
--

DROP TABLE IF EXISTS `vw_water_batch_bill`;
/*!50001 DROP VIEW IF EXISTS `vw_water_batch_bill`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_water_batch_bill` AS SELECT 
 1 AS `objid`,
 1 AS `state`,
 1 AS `billgroupid`,
 1 AS `scheduleid`,
 1 AS `reader_objid`,
 1 AS `reader_name`,
 1 AS `readingdate`,
 1 AS `taskid`,
 1 AS `createdby_objid`,
 1 AS `createdby_name`,
 1 AS `dtcreated`,
 1 AS `schedulegroupid`,
 1 AS `year`,
 1 AS `month`,
 1 AS `fromdate`,
 1 AS `todate`,
 1 AS `discdate`,
 1 AS `duedate`,
 1 AS `readingduedate`,
 1 AS `expirydate`,
 1 AS `description`,
 1 AS `expired`,
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
 1 AS `task_properties`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_water_bill`
--

DROP TABLE IF EXISTS `vw_water_bill`;
/*!50001 DROP VIEW IF EXISTS `vw_water_bill`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_water_bill` AS SELECT 
 1 AS `objid`,
 1 AS `batchid`,
 1 AS `billgroupid`,
 1 AS `prevbillid`,
 1 AS `billno`,
 1 AS `billdate`,
 1 AS `lasttxndate`,
 1 AS `validitydate`,
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
 1 AS `prevreading`,
 1 AS `reading`,
 1 AS `readingdate`,
 1 AS `reader_objid`,
 1 AS `reader_name`,
 1 AS `volume`,
 1 AS `rate`,
 1 AS `dtprinted`,
 1 AS `acctno`,
 1 AS `acctname`,
 1 AS `year`,
 1 AS `month`,
 1 AS `fromdate`,
 1 AS `todate`,
 1 AS `discdate`,
 1 AS `duedate`,
 1 AS `expirydate`,
 1 AS `balance`,
 1 AS `owner_objid`,
 1 AS `owner_name`,
 1 AS `location_text`,
 1 AS `indexno`,
 1 AS `location_barangay_name`,
 1 AS `location_barangay_objid`,
 1 AS `classification_objid`,
 1 AS `classification_name`,
 1 AS `contact_mobileno`,
 1 AS `contact_email`,
 1 AS `contact_phoneno`,
 1 AS `expired`,
 1 AS `metered`,
 1 AS `meterid`,
 1 AS `meter_objid`,
 1 AS `meter_serialno`,
 1 AS `meter_brand`,
 1 AS `meter_capacity`,
 1 AS `meter_sizeid`,
 1 AS `meter_customerowned`,
 1 AS `meter_stocktype`,
 1 AS `meter_state`,
 1 AS `meter_size_objid`,
 1 AS `meter_size_title`,
 1 AS `meter_supersededid`,
 1 AS `units`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_water_bill_account_info`
--

DROP TABLE IF EXISTS `vw_water_bill_account_info`;
/*!50001 DROP VIEW IF EXISTS `vw_water_bill_account_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_water_bill_account_info` AS SELECT 
 1 AS `objid`,
 1 AS `acctname`,
 1 AS `owner_objid`,
 1 AS `owner_name`,
 1 AS `location_text`,
 1 AS `location_barangay_name`,
 1 AS `location_barangay_objid`,
 1 AS `contact_mobileno`,
 1 AS `contact_email`,
 1 AS `contact_phoneno`,
 1 AS `metered`,
 1 AS `meterid`,
 1 AS `units`,
 1 AS `meter_objid`,
 1 AS `meter_serialno`,
 1 AS `meter_brand`,
 1 AS `meter_capacity`,
 1 AS `meter_sizeid`,
 1 AS `meter_customerowned`,
 1 AS `meter_stocktype`,
 1 AS `meter_state`,
 1 AS `meter_size_objid`,
 1 AS `meter_size_title`,
 1 AS `meter_supersededid`,
 1 AS `classification_objid`,
 1 AS `classification_name`,
 1 AS `classification_description`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_water_bill_payment`
--

DROP TABLE IF EXISTS `vw_water_bill_payment`;
/*!50001 DROP VIEW IF EXISTS `vw_water_bill_payment`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_water_bill_payment` AS SELECT 
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
-- Temporary table structure for view `vw_water_billitem`
--

DROP TABLE IF EXISTS `vw_water_billitem`;
/*!50001 DROP VIEW IF EXISTS `vw_water_billitem`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_water_billitem` AS SELECT 
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
-- Temporary table structure for view `vw_water_billitem_subitem`
--

DROP TABLE IF EXISTS `vw_water_billitem_subitem`;
/*!50001 DROP VIEW IF EXISTS `vw_water_billitem_subitem`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_water_billitem_subitem` AS SELECT 
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
-- Temporary table structure for view `vw_water_credit_billitem`
--

DROP TABLE IF EXISTS `vw_water_credit_billitem`;
/*!50001 DROP VIEW IF EXISTS `vw_water_credit_billitem`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_water_credit_billitem` AS SELECT 
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
 1 AS `paymentid`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_water_expired_batch_bill`
--

DROP TABLE IF EXISTS `vw_water_expired_batch_bill`;
/*!50001 DROP VIEW IF EXISTS `vw_water_expired_batch_bill`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_water_expired_batch_bill` AS SELECT 
 1 AS `objid`,
 1 AS `description`,
 1 AS `state`,
 1 AS `tag`,
 1 AS `schedulegroupid`,
 1 AS `currentbatchid`,
 1 AS `acctgroupid`,
 1 AS `year`,
 1 AS `month`,
 1 AS `scheduleid`,
 1 AS `expirydate`,
 1 AS `task_state`,
 1 AS `reader_objid`,
 1 AS `reader_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_water_meter`
--

DROP TABLE IF EXISTS `vw_water_meter`;
/*!50001 DROP VIEW IF EXISTS `vw_water_meter`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_water_meter` AS SELECT 
 1 AS `objid`,
 1 AS `state`,
 1 AS `serialno`,
 1 AS `brand`,
 1 AS `currentacctid`,
 1 AS `capacity`,
 1 AS `customerowned`,
 1 AS `stocktype`,
 1 AS `sizeid`,
 1 AS `supersededid`,
 1 AS `account_objid`,
 1 AS `account_acctno`,
 1 AS `account_acctname`,
 1 AS `size_objid`,
 1 AS `size_title`,
 1 AS `superseded`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_water_payment_plan`
--

DROP TABLE IF EXISTS `vw_water_payment_plan`;
/*!50001 DROP VIEW IF EXISTS `vw_water_payment_plan`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_water_payment_plan` AS SELECT 
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
-- Temporary table structure for view `vw_water_txn`
--

DROP TABLE IF EXISTS `vw_water_txn`;
/*!50001 DROP VIEW IF EXISTS `vw_water_txn`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_water_txn` AS SELECT 
 1 AS `objid`,
 1 AS `controlno`,
 1 AS `txntypeid`,
 1 AS `dtcreated`,
 1 AS `createdby_objid`,
 1 AS `createdby_name`,
 1 AS `remarks`,
 1 AS `acctid`,
 1 AS `acctinfoid`,
 1 AS `newacctinfoid`,
 1 AS `taskid`,
 1 AS `info`,
 1 AS `txntype_objid`,
 1 AS `txntype_title`,
 1 AS `txntype_processname`,
 1 AS `txntype_guihandler`,
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
-- Temporary table structure for view `vw_water_txn_paymentitem`
--

DROP TABLE IF EXISTS `vw_water_txn_paymentitem`;
/*!50001 DROP VIEW IF EXISTS `vw_water_txn_paymentitem`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_water_txn_paymentitem` AS SELECT 
 1 AS `objid`,
 1 AS `paymentid`,
 1 AS `particulars`,
 1 AS `amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `water_abstract_bill`
--

DROP TABLE IF EXISTS `water_abstract_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `water_abstract_bill` (
  `objid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `water_abstract_bill`
--

LOCK TABLES `water_abstract_bill` WRITE;
/*!40000 ALTER TABLE `water_abstract_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `water_abstract_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `water_abstract_billitem`
--

DROP TABLE IF EXISTS `water_abstract_billitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `water_abstract_billitem` (
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
  PRIMARY KEY (`objid`) USING BTREE,
  UNIQUE KEY `uix_water_billitem_billid_uid` (`billid`,`uid`) USING BTREE,
  KEY `fk_water_billitem_itemid` (`itemid`) USING BTREE,
  KEY `uix_water_bilitem_acctid_itemid_billscheduleid` (`billid`,`itemid`) USING BTREE,
  KEY `ix_billid` (`billid`) USING BTREE,
  KEY `ix_uid` (`uid`) USING BTREE,
  KEY `ix_supersededid` (`supersededid`) USING BTREE,
  KEY `ix_billdate` (`billdate`) USING BTREE,
  CONSTRAINT `fk_water_billitem_itemid` FOREIGN KEY (`itemid`) REFERENCES `water_itemaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `water_abstract_billitem`
--

LOCK TABLES `water_abstract_billitem` WRITE;
/*!40000 ALTER TABLE `water_abstract_billitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `water_abstract_billitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `water_account`
--

DROP TABLE IF EXISTS `water_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `water_account` (
  `objid` varchar(50) NOT NULL,
  `acctno` varchar(50) DEFAULT NULL,
  `acctinfoid` varchar(50) DEFAULT NULL,
  `taskid` varchar(50) DEFAULT NULL,
  `lastbillid` varchar(50) DEFAULT NULL,
  `billgroupid` varchar(50) DEFAULT NULL,
  `indexno` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  UNIQUE KEY `uix_acctno` (`acctno`) USING BTREE,
  KEY `ix_acctinfoid` (`acctinfoid`) USING BTREE,
  KEY `fk_water_account_task` (`taskid`) USING BTREE,
  KEY `fk_water_account_lastbillid` (`lastbillid`) USING BTREE,
  KEY `fk_water_account_billgroupid` (`billgroupid`) USING BTREE,
  CONSTRAINT `fk_water_account_acctinfoid` FOREIGN KEY (`acctinfoid`) REFERENCES `water_account_info` (`objid`),
  CONSTRAINT `fk_water_account_billgroupid` FOREIGN KEY (`billgroupid`) REFERENCES `water_billgroup` (`objid`),
  CONSTRAINT `fk_water_account_lastbillid` FOREIGN KEY (`lastbillid`) REFERENCES `water_bill` (`objid`),
  CONSTRAINT `fk_water_account_task` FOREIGN KEY (`taskid`) REFERENCES `water_account_task` (`taskid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `water_account`
--

LOCK TABLES `water_account` WRITE;
/*!40000 ALTER TABLE `water_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `water_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `water_account_info`
--

DROP TABLE IF EXISTS `water_account_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `water_account_info` (
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
  `owner_id_type_name` varchar(255) DEFAULT NULL,
  `owner_id_idno` varchar(50) DEFAULT NULL,
  `owner_id_placeissued` varchar(255) DEFAULT NULL,
  `owner_id_dtissued` date DEFAULT NULL,
  `contact_mobileno` varchar(50) DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `contact_phoneno` varchar(50) DEFAULT NULL,
  `meterid` varchar(50) DEFAULT NULL,
  `classificationid` varchar(50) DEFAULT NULL,
  `business_objid` varchar(50) DEFAULT NULL,
  `business_bin` varchar(50) DEFAULT NULL,
  `business_tradename` varchar(300) DEFAULT NULL,
  `units` int(11) DEFAULT NULL,
  `txnid` varchar(50) DEFAULT NULL,
  `txntype` varchar(50) DEFAULT NULL,
  `location_text` varchar(255) DEFAULT NULL,
  `location_unitno` varchar(50) DEFAULT NULL,
  `location_bldgno` varchar(50) DEFAULT NULL,
  `location_bldgname` varchar(50) DEFAULT NULL,
  `location_street` varchar(50) DEFAULT NULL,
  `location_subdivision` varchar(50) DEFAULT NULL,
  `location_barangay_objid` varchar(50) DEFAULT NULL,
  `location_barangay_name` varchar(50) DEFAULT NULL,
  `location_lng` float DEFAULT NULL,
  `location_lat` float DEFAULT NULL,
  `tags` mediumtext,
  `notes` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `ix_acctid` (`acctid`) USING BTREE,
  KEY `ix_classificationid` (`classificationid`) USING BTREE,
  KEY `ix_meterid` (`meterid`) USING BTREE,
  KEY `ix_txnid` (`txnid`) USING BTREE,
  CONSTRAINT `fk_water_account_info_acctid` FOREIGN KEY (`acctid`) REFERENCES `water_account` (`objid`),
  CONSTRAINT `fk_water_account_info_classificationid` FOREIGN KEY (`classificationid`) REFERENCES `water_classification` (`objid`),
  CONSTRAINT `fk_water_account_info_meterid` FOREIGN KEY (`meterid`) REFERENCES `water_meter` (`objid`),
  CONSTRAINT `fk_water_account_info_txnid` FOREIGN KEY (`txnid`) REFERENCES `water_txn` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `water_account_info`
--

LOCK TABLES `water_account_info` WRITE;
/*!40000 ALTER TABLE `water_account_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `water_account_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `water_account_task`
--

DROP TABLE IF EXISTS `water_account_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `water_account_task` (
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
  PRIMARY KEY (`taskid`) USING BTREE,
  KEY `ix_actor_objid` (`actor_objid`) USING BTREE,
  KEY `ix_assignee_objid` (`assignee_objid`) USING BTREE,
  KEY `ix_dtcreated` (`dtcreated`) USING BTREE,
  KEY `ix_enddate` (`enddate`) USING BTREE,
  KEY `ix_parentprocessid` (`parentprocessid`) USING BTREE,
  KEY `ix_prevtaskid` (`prevtaskid`) USING BTREE,
  KEY `ix_refid` (`refid`) USING BTREE,
  KEY `ix_startdate` (`startdate`) USING BTREE,
  CONSTRAINT `water_account_task_refid` FOREIGN KEY (`refid`) REFERENCES `water_account` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `water_account_task`
--

LOCK TABLES `water_account_task` WRITE;
/*!40000 ALTER TABLE `water_account_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `water_account_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `water_acctgroup`
--

DROP TABLE IF EXISTS `water_acctgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `water_acctgroup` (
  `objid` varchar(50) NOT NULL,
  `rootid` varchar(50) DEFAULT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `leftindex` int(11) DEFAULT NULL,
  `rightindex` int(11) DEFAULT NULL,
  `fullpath` varchar(500) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  UNIQUE KEY `uix_uid` (`uid`) USING BTREE,
  KEY `ix_parentid` (`parentid`) USING BTREE,
  KEY `ix_rootid` (`rootid`) USING BTREE,
  CONSTRAINT `fk_water_acctgroup_parentid` FOREIGN KEY (`parentid`) REFERENCES `water_acctgroup` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `water_acctgroup`
--

LOCK TABLES `water_acctgroup` WRITE;
/*!40000 ALTER TABLE `water_acctgroup` DISABLE KEYS */;
INSERT INTO `water_acctgroup` VALUES ('WTRAGRP5be77a81:18e5a358870:-7feb','WTRAGRP5be77a81:18e5a358870:-7feb',NULL,'DEFAULT','DEFAULT',0,1,'DEFAULT',-2032180703);
/*!40000 ALTER TABLE `water_acctgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `water_batch_bill`
--

DROP TABLE IF EXISTS `water_batch_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `water_batch_bill` (
  `objid` varchar(255) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `billgroupid` varchar(50) DEFAULT NULL,
  `scheduleid` varchar(50) DEFAULT NULL,
  `reader_objid` varchar(50) DEFAULT NULL,
  `reader_name` varchar(255) DEFAULT NULL,
  `readingdate` date DEFAULT NULL,
  `taskid` varchar(50) DEFAULT NULL,
  `createdby_objid` varchar(50) DEFAULT NULL,
  `createdby_name` varchar(255) DEFAULT NULL,
  `dtcreated` datetime DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `fk_water_batch_bill_billgroupid` (`billgroupid`) USING BTREE,
  KEY `fk_water_batch_bill_billscheduleid` (`scheduleid`) USING BTREE,
  KEY `fk_water_batch_bill_taskid` (`taskid`) USING BTREE,
  CONSTRAINT `fk_water_batch_bill_billgroupid` FOREIGN KEY (`billgroupid`) REFERENCES `water_billgroup` (`objid`),
  CONSTRAINT `fk_water_batch_bill_scheduleid` FOREIGN KEY (`scheduleid`) REFERENCES `water_billschedule` (`objid`),
  CONSTRAINT `fk_water_batch_bill_taskid` FOREIGN KEY (`taskid`) REFERENCES `water_batch_bill_task` (`taskid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `water_batch_bill`
--

LOCK TABLES `water_batch_bill` WRITE;
/*!40000 ALTER TABLE `water_batch_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `water_batch_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `water_batch_bill_error`
--

DROP TABLE IF EXISTS `water_batch_bill_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `water_batch_bill_error` (
  `objid` varchar(50) NOT NULL,
  `batchid` varchar(50) DEFAULT NULL,
  `acctid` varchar(50) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `billid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `fk_water_batch_bill_error_batchid` (`batchid`) USING BTREE,
  CONSTRAINT `fk_water_batch_bill_error_batchid` FOREIGN KEY (`batchid`) REFERENCES `water_batch_bill` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `water_batch_bill_error`
--

LOCK TABLES `water_batch_bill_error` WRITE;
/*!40000 ALTER TABLE `water_batch_bill_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `water_batch_bill_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `water_batch_bill_task`
--

DROP TABLE IF EXISTS `water_batch_bill_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `water_batch_bill_task` (
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
  PRIMARY KEY (`taskid`) USING BTREE,
  KEY `ix_actor_objid` (`actor_objid`) USING BTREE,
  KEY `ix_assignee_objid` (`assignee_objid`) USING BTREE,
  KEY `ix_dtcreated` (`dtcreated`) USING BTREE,
  KEY `ix_enddate` (`enddate`) USING BTREE,
  KEY `ix_parentprocessid` (`parentprocessid`) USING BTREE,
  KEY `ix_prevtaskid` (`prevtaskid`) USING BTREE,
  KEY `ix_refid` (`refid`) USING BTREE,
  KEY `ix_startdate` (`startdate`) USING BTREE,
  CONSTRAINT `fk_water_batch_bill_task_refid` FOREIGN KEY (`refid`) REFERENCES `water_batch_bill` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `water_batch_bill_task`
--

LOCK TABLES `water_batch_bill_task` WRITE;
/*!40000 ALTER TABLE `water_batch_bill_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `water_batch_bill_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `water_bill`
--

DROP TABLE IF EXISTS `water_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `water_bill` (
  `objid` varchar(50) NOT NULL,
  `batchid` varchar(50) DEFAULT NULL,
  `billgroupid` varchar(50) DEFAULT NULL,
  `prevbillid` varchar(50) DEFAULT NULL,
  `billno` varchar(50) DEFAULT NULL,
  `billdate` date DEFAULT NULL,
  `lasttxndate` date DEFAULT NULL,
  `validitydate` date DEFAULT NULL,
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
  `prevreading` int(11) DEFAULT NULL,
  `reading` int(11) DEFAULT NULL,
  `readingdate` date DEFAULT NULL,
  `reader_objid` varchar(50) DEFAULT NULL,
  `reader_name` varchar(255) DEFAULT NULL,
  `volume` int(11) DEFAULT NULL,
  `rate` decimal(16,2) DEFAULT NULL,
  `dtprinted` datetime DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  UNIQUE KEY `uix__billno` (`billno`) USING BTREE,
  UNIQUE KEY `uix_acctid_scheduleitemid` (`acctid`,`scheduleid`) USING BTREE,
  KEY `ix_acctinfoid` (`acctinfoid`) USING BTREE,
  KEY `ix_scheduleitemid` (`scheduleid`) USING BTREE,
  KEY `ix_batchid` (`batchid`) USING BTREE,
  KEY `fk_water_bill_billgroupid` (`billgroupid`) USING BTREE,
  CONSTRAINT `fk_water_bill_acctid` FOREIGN KEY (`acctid`) REFERENCES `water_account` (`objid`),
  CONSTRAINT `fk_water_bill_acctinfoid` FOREIGN KEY (`acctinfoid`) REFERENCES `water_account_info` (`objid`),
  CONSTRAINT `fk_water_bill_batchid` FOREIGN KEY (`batchid`) REFERENCES `water_batch_bill` (`objid`),
  CONSTRAINT `fk_water_bill_billgroupid` FOREIGN KEY (`billgroupid`) REFERENCES `water_billgroup` (`objid`),
  CONSTRAINT `fk_water_bill_billscheduleid` FOREIGN KEY (`scheduleid`) REFERENCES `water_billschedule` (`objid`),
  CONSTRAINT `fk_water_bill_objid` FOREIGN KEY (`objid`) REFERENCES `water_abstract_bill` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `water_bill`
--

LOCK TABLES `water_bill` WRITE;
/*!40000 ALTER TABLE `water_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `water_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `water_bill_cancelled`
--

DROP TABLE IF EXISTS `water_bill_cancelled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `water_bill_cancelled` (
  `objid` varchar(50) NOT NULL,
  `billno` varchar(50) DEFAULT NULL,
  `batchid` varchar(50) DEFAULT NULL,
  `billgroupid` varchar(50) DEFAULT NULL,
  `scheduleid` varchar(50) DEFAULT NULL,
  `acctid` varchar(50) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `reader_objid` varchar(50) DEFAULT NULL,
  `reader_name` varchar(255) DEFAULT NULL,
  `readingdate` date DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  UNIQUE KEY `uix_water_bill_temp_billno` (`billno`) USING BTREE,
  UNIQUE KEY `uix_water_bill_temp_acctid_year_month` (`acctid`,`year`,`month`) USING BTREE,
  CONSTRAINT `fk_water_bill_cancelled_objid` FOREIGN KEY (`objid`) REFERENCES `water_abstract_bill` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `water_bill_cancelled`
--

LOCK TABLES `water_bill_cancelled` WRITE;
/*!40000 ALTER TABLE `water_bill_cancelled` DISABLE KEYS */;
/*!40000 ALTER TABLE `water_bill_cancelled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `water_billgroup`
--

DROP TABLE IF EXISTS `water_billgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `water_billgroup` (
  `objid` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `tag` varchar(100) DEFAULT NULL,
  `schedulegroupid` varchar(50) DEFAULT NULL,
  `currentbatchid` varchar(50) DEFAULT NULL,
  `reader_objid` varchar(50) DEFAULT NULL,
  `reader_name` varchar(255) DEFAULT NULL,
  `acctgroupid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `ix_scheduleid` (`schedulegroupid`) USING BTREE,
  KEY `fk_water_billgroup_currentbatchid` (`currentbatchid`) USING BTREE,
  KEY `fk_water_billgroup_acctgroupid` (`acctgroupid`) USING BTREE,
  CONSTRAINT `fk_water_billgroup_acctgroupid` FOREIGN KEY (`acctgroupid`) REFERENCES `water_acctgroup` (`objid`),
  CONSTRAINT `fk_water_billgroup_currentbatchid` FOREIGN KEY (`currentbatchid`) REFERENCES `water_batch_bill` (`objid`),
  CONSTRAINT `fk_water_billgroup_schedulegroupid` FOREIGN KEY (`schedulegroupid`) REFERENCES `water_billschedule_group` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `water_billgroup`
--

LOCK TABLES `water_billgroup` WRITE;
/*!40000 ALTER TABLE `water_billgroup` DISABLE KEYS */;
INSERT INTO `water_billgroup` VALUES ('B01','Bil-san','ACTIVE',NULL,'S1',NULL,NULL,NULL,'WTRAGRP5be77a81:18e5a358870:-7feb'),('B02','Bolod	','ACTIVE',NULL,'S1',NULL,NULL,NULL,'WTRAGRP5be77a81:18e5a358870:-7feb'),('B03','Danao','ACTIVE',NULL,'S1',NULL,NULL,NULL,'WTRAGRP5be77a81:18e5a358870:-7feb'),('B04','Doljo','ACTIVE',NULL,'S1',NULL,NULL,NULL,'WTRAGRP5be77a81:18e5a358870:-7feb'),('B05','Libaong','ACTIVE',NULL,'S1',NULL,NULL,NULL,'WTRAGRP5be77a81:18e5a358870:-7feb'),('B06','Looc','ACTIVE',NULL,'S1',NULL,NULL,NULL,'WTRAGRP5be77a81:18e5a358870:-7feb'),('B07','Lourdes','ACTIVE',NULL,'S1',NULL,NULL,NULL,'WTRAGRP5be77a81:18e5a358870:-7feb'),('B08','Poblacion','ACTIVE',NULL,'S1',NULL,NULL,NULL,'WTRAGRP5be77a81:18e5a358870:-7feb'),('B09','Tangnan','ACTIVE',NULL,'S1',NULL,NULL,NULL,'WTRAGRP5be77a81:18e5a358870:-7feb'),('B10','Tawala','ACTIVE',NULL,'S1',NULL,NULL,NULL,'WTRAGRP5be77a81:18e5a358870:-7feb');
/*!40000 ALTER TABLE `water_billgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `water_billitem`
--

DROP TABLE IF EXISTS `water_billitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `water_billitem` (
  `objid` varchar(50) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `paymentplanid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `fk_water_billitem_compromiseid` (`paymentplanid`) USING BTREE,
  KEY `ix_year_month` (`year`,`month`) USING BTREE,
  KEY `ix_year` (`year`) USING BTREE,
  KEY `ix_duedate` (`duedate`) USING BTREE,
  CONSTRAINT `fk_water_billitem_objid` FOREIGN KEY (`objid`) REFERENCES `water_abstract_billitem` (`objid`),
  CONSTRAINT `fk_water_billitem_paymentplanid` FOREIGN KEY (`paymentplanid`) REFERENCES `water_payment_plan` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `water_billitem`
--

LOCK TABLES `water_billitem` WRITE;
/*!40000 ALTER TABLE `water_billitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `water_billitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `water_billitem_subitem`
--

DROP TABLE IF EXISTS `water_billitem_subitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `water_billitem_subitem` (
  `objid` varchar(50) NOT NULL,
  `billitemrefid` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `fk_water_penalty_billitem_billitemrefid` (`billitemrefid`) USING BTREE,
  CONSTRAINT `fk_water_penalty_billitem_billitemrefid` FOREIGN KEY (`billitemrefid`) REFERENCES `water_abstract_billitem` (`objid`),
  CONSTRAINT `fk_water_penalty_billitem_objid` FOREIGN KEY (`objid`) REFERENCES `water_abstract_billitem` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `water_billitem_subitem`
--

LOCK TABLES `water_billitem_subitem` WRITE;
/*!40000 ALTER TABLE `water_billitem_subitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `water_billitem_subitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `water_billschedule`
--

DROP TABLE IF EXISTS `water_billschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `water_billschedule` (
  `objid` varchar(50) NOT NULL,
  `groupid` varchar(50) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `fromdate` date DEFAULT NULL,
  `todate` date DEFAULT NULL,
  `billdate` date DEFAULT NULL,
  `billingduedate` date DEFAULT NULL,
  `readingdate` date DEFAULT NULL,
  `readingduedate` date DEFAULT NULL,
  `discdate` date DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `expirydate` date DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  UNIQUE KEY `uix_parentid_year_month_fromdate` (`groupid`,`year`,`month`,`fromdate`) USING BTREE,
  KEY `ix_parentid` (`groupid`) USING BTREE,
  CONSTRAINT `fk_water_billschedule_groupid` FOREIGN KEY (`groupid`) REFERENCES `water_billschedule_group` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `water_billschedule`
--

LOCK TABLES `water_billschedule` WRITE;
/*!40000 ALTER TABLE `water_billschedule` DISABLE KEYS */;
INSERT INTO `water_billschedule` VALUES ('S1202401','S1',2024,1,'2023-12-01','2023-12-31','2024-01-10',NULL,'2023-12-28','2024-01-10',NULL,'2024-01-15','2024-01-31'),('S1202402','S1',2024,2,'2024-01-01','2024-01-31','2024-02-10',NULL,'2024-01-28','2024-02-10',NULL,'2024-02-15','2024-02-29'),('S1202403','S1',2024,3,'2024-02-01','2024-02-29','2024-03-10',NULL,'2024-02-28','2024-03-10',NULL,'2024-03-15','2024-03-31');
/*!40000 ALTER TABLE `water_billschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `water_billschedule_group`
--

DROP TABLE IF EXISTS `water_billschedule_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `water_billschedule_group` (
  `objid` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `water_billschedule_group`
--

LOCK TABLES `water_billschedule_group` WRITE;
/*!40000 ALTER TABLE `water_billschedule_group` DISABLE KEYS */;
INSERT INTO `water_billschedule_group` VALUES ('S1','Default Schedule');
/*!40000 ALTER TABLE `water_billschedule_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `water_classification`
--

DROP TABLE IF EXISTS `water_classification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `water_classification` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `water_classification`
--

LOCK TABLES `water_classification` WRITE;
/*!40000 ALTER TABLE `water_classification` DISABLE KEYS */;
INSERT INTO `water_classification` VALUES ('BULK','BULK','BULK'),('COMMERCIAL','COMMERCIAL','COMMERCIAL'),('GOVERNMENT','GOVERNMENT','GOVERNMENT'),('INDUSTRIAL','INDUSTRIAL','INDUSTRIAL'),('RESIDENTIAL','RESIDENTIAL','RESIDENTIAL');
/*!40000 ALTER TABLE `water_classification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `water_credit_billitem`
--

DROP TABLE IF EXISTS `water_credit_billitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `water_credit_billitem` (
  `objid` varchar(50) NOT NULL,
  `paymentid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `fk_water_credit_billitem_paymentid` (`paymentid`) USING BTREE,
  CONSTRAINT `fk_water_credit_billitem_objid` FOREIGN KEY (`objid`) REFERENCES `water_abstract_billitem` (`objid`),
  CONSTRAINT `fk_water_credit_billitem_paymentid` FOREIGN KEY (`paymentid`) REFERENCES `water_payment` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `water_credit_billitem`
--

LOCK TABLES `water_credit_billitem` WRITE;
/*!40000 ALTER TABLE `water_credit_billitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `water_credit_billitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `water_discountitem`
--

DROP TABLE IF EXISTS `water_discountitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `water_discountitem` (
  `objid` varchar(50) NOT NULL,
  `billitemrefid` varchar(50) DEFAULT NULL,
  `itemid` varchar(50) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `paymentid` varchar(50) DEFAULT NULL,
  `voidamount` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  UNIQUE KEY `fk_water_discountitem_billitemrefid` (`billitemrefid`) USING BTREE,
  KEY `water_discountitem_itemid` (`itemid`) USING BTREE,
  KEY `water_discountitem_paymentid` (`paymentid`) USING BTREE,
  CONSTRAINT `water_discountitem_billitemrefid` FOREIGN KEY (`billitemrefid`) REFERENCES `water_billitem` (`objid`),
  CONSTRAINT `water_discountitem_itemid` FOREIGN KEY (`itemid`) REFERENCES `water_itemaccount` (`objid`),
  CONSTRAINT `water_discountitem_paymentid` FOREIGN KEY (`paymentid`) REFERENCES `water_payment` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `water_discountitem`
--

LOCK TABLES `water_discountitem` WRITE;
/*!40000 ALTER TABLE `water_discountitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `water_discountitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `water_itemaccount`
--

DROP TABLE IF EXISTS `water_itemaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `water_itemaccount` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `item_objid` varchar(50) DEFAULT NULL,
  `item_code` varchar(50) DEFAULT NULL,
  `item_title` varchar(255) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `itemtype` varchar(50) DEFAULT NULL,
  `tag` varchar(20) DEFAULT NULL,
  `allowmanual` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `ix_item_objid` (`item_objid`) USING BTREE,
  KEY `ix_item_code` (`item_code`) USING BTREE,
  KEY `ix_itemtype` (`itemtype`) USING BTREE,
  KEY `ix_tag` (`tag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `water_itemaccount`
--

LOCK TABLES `water_itemaccount` WRITE;
/*!40000 ALTER TABLE `water_itemaccount` DISABLE KEYS */;
INSERT INTO `water_itemaccount` VALUES ('WATER_BILL','WATER BILL','IA4d96b8b6:13b3f2967a2:-7f92','4-02-02-090','WATER BILL',0,'MAIN',NULL,1),('WATER_BILL_ADVANCE','WATER BILL ADVANCE PAYMENT','ITMACCT62a8f81c:171c9e9bfd4:-6fba','781','WATER BILL - ADVANCE PAYMENT',2,'BASIC',NULL,0),('WATER_BILL_DISCOUNT','WATER BILL DISCOUNT',NULL,NULL,NULL,20,'DISCOUNT',NULL,0),('WATER_BILL_INTEREST','WATER BILL INTEREST','ITMACCT44937c75:178576cbb7f:-7b57','-','WATER BILL COMSUMPTION FOR THE MONTH OF',15,'INTEREST',NULL,0),('WATER_BILL_INTEREST_PREVIOUS','WATER BILL PREVIOUS INTEREST',NULL,NULL,NULL,16,'INTEREST',NULL,0),('WATER_BILL_PREVIOUS','WATER PREVIOUS BILL',NULL,NULL,NULL,0,'MAIN',NULL,0),('WATER_BILL_SURCHARGE','WATER BILL SURCHARGE','IA1b809310:1488b2bb8a8:-7f60','4-02-02-980','WATER (PENALTY)',10,'SURCHARGE',NULL,0),('WATER_BILL_SURCHARGE_PREVIOUS','WATER BILL PREVIOUS SURCHARGE','IA1b809310:1488b2bb8a8:-7f60','4-02-02-980','WATER (PENALTY)',11,'SURCHARGE',NULL,0),('WATER_COMPROMISE_FEE','WATER COMPROMISE FEE',NULL,NULL,NULL,200,'BASIC',NULL,0),('WATER_DOWNPAYMENT','WATER DOWNPAYMENT',NULL,NULL,NULL,200,'BASIC',NULL,0),('WATER_NEW_CONNECTION_FEE','WATER NEW CONNECTION FEE',NULL,NULL,NULL,100,'BASIC',NULL,0),('WATER_PENALTY','WATER PENALTY','IA1b809310:1488b2bb8a8:-7f60','4-02-02-980','WATER (PENALTY)',10,'SURCHARGE',NULL,0),('WATER_RECONNECTION_FEE','WATER RECONNECTION FEE',NULL,NULL,NULL,100,'BASIC',NULL,0);
/*!40000 ALTER TABLE `water_itemaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `water_meter`
--

DROP TABLE IF EXISTS `water_meter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `water_meter` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `serialno` varchar(50) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `currentacctid` varchar(50) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `customerowned` int(11) DEFAULT NULL,
  `stocktype` varchar(50) DEFAULT NULL,
  `sizeid` varchar(50) DEFAULT NULL,
  `supersededid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `fk_water_meter_currentacctid` (`currentacctid`) USING BTREE,
  KEY `fk_water_meter_supersededid` (`supersededid`) USING BTREE,
  CONSTRAINT `fk_water_meter_currentacctid` FOREIGN KEY (`currentacctid`) REFERENCES `water_account` (`objid`),
  CONSTRAINT `fk_water_meter_supersededid` FOREIGN KEY (`supersededid`) REFERENCES `water_meter` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `water_meter`
--

LOCK TABLES `water_meter` WRITE;
/*!40000 ALTER TABLE `water_meter` DISABLE KEYS */;
INSERT INTO `water_meter` VALUES ('WTRMTR-5a798cf1:18e5a35a0b4:-74ee','ACTIVE','555001','EVER',NULL,10000,NULL,'STOCK','ONE_AND_HALF_INCH',NULL),('WTRMTR-5a798cf1:18e5a35a0b4:-750e','ACTIVE','900005','EVER',NULL,10000,NULL,'STOCK','ONE_HALF',NULL),('WTRMTR-5a798cf1:18e5a35a0b4:-7552','ACTIVE','900004','EVER',NULL,10000,NULL,'STOCK','ONE_HALF',NULL),('WTRMTR-5a798cf1:18e5a35a0b4:-7575','ACTIVE','900003','EVER',NULL,10000,NULL,'STOCK','ONE_HALF',NULL),('WTRMTR-5a798cf1:18e5a35a0b4:-7595','ACTIVE','900002','EVER',NULL,10000,NULL,'STOCK','ONE_HALF',NULL),('WTRMTR-5a798cf1:18e5a35a0b4:-764f','ACTIVE','900001','EVER',NULL,10000,NULL,'STOCK','ONE_HALF',NULL);
/*!40000 ALTER TABLE `water_meter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `water_metersize`
--

DROP TABLE IF EXISTS `water_metersize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `water_metersize` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `water_metersize`
--

LOCK TABLES `water_metersize` WRITE;
/*!40000 ALTER TABLE `water_metersize` DISABLE KEYS */;
INSERT INTO `water_metersize` VALUES ('FOUR_INCH','4\"'),('ONE_AND_HALF_INCH','1 1/2\"'),('ONE_HALF','1/2\"'),('ONE_INCH','1\"'),('SIX_INCH','6\"'),('THREE_FOURTH_INCH','3/4\"'),('THREE_INCH','3\"'),('TWO_INCH','2\"');
/*!40000 ALTER TABLE `water_metersize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `water_payment`
--

DROP TABLE IF EXISTS `water_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `water_payment` (
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
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `fk_water_payment_txnid` (`txnid`) USING BTREE,
  KEY `fk_water_payment_billid` (`billid`) USING BTREE,
  CONSTRAINT `fk_water_payment_billid` FOREIGN KEY (`billid`) REFERENCES `water_abstract_bill` (`objid`),
  CONSTRAINT `fk_water_payment_txnid` FOREIGN KEY (`txnid`) REFERENCES `water_txn` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `water_payment`
--

LOCK TABLES `water_payment` WRITE;
/*!40000 ALTER TABLE `water_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `water_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `water_payment_plan`
--

DROP TABLE IF EXISTS `water_payment_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `water_payment_plan` (
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
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `objid` (`objid`) USING BTREE,
  KEY `fk_water_payment_plan_itemid` (`itemid`) USING BTREE,
  CONSTRAINT `fk_water_payment_plan_itemid` FOREIGN KEY (`itemid`) REFERENCES `water_itemaccount` (`objid`),
  CONSTRAINT `fk_water_payment_plan_objid` FOREIGN KEY (`objid`) REFERENCES `water_payment` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `water_payment_plan`
--

LOCK TABLES `water_payment_plan` WRITE;
/*!40000 ALTER TABLE `water_payment_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `water_payment_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `water_paymentitem`
--

DROP TABLE IF EXISTS `water_paymentitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `water_paymentitem` (
  `objid` varchar(50) NOT NULL,
  `paymentid` varchar(50) DEFAULT NULL,
  `billitemrefid` varchar(50) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `voidamount` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `fk_water_payment_item_parentid` (`paymentid`) USING BTREE,
  KEY `fk_water_paymentitem_billitemid` (`billitemrefid`) USING BTREE,
  CONSTRAINT `fk_water_paymentitem_billitemid` FOREIGN KEY (`billitemrefid`) REFERENCES `water_abstract_billitem` (`objid`),
  CONSTRAINT `fk_water_paymentitem_paymentid` FOREIGN KEY (`paymentid`) REFERENCES `water_payment` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `water_paymentitem`
--

LOCK TABLES `water_paymentitem` WRITE;
/*!40000 ALTER TABLE `water_paymentitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `water_paymentitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `water_tag`
--

DROP TABLE IF EXISTS `water_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `water_tag` (
  `objid` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `water_tag`
--

LOCK TABLES `water_tag` WRITE;
/*!40000 ALTER TABLE `water_tag` DISABLE KEYS */;
INSERT INTO `water_tag` VALUES ('LOT_DONOR','LOT DONOR'),('SENIOR','SENIOR CITIZEN'),('SUBDIVISION','SUBDIVISION');
/*!40000 ALTER TABLE `water_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `water_txn`
--

DROP TABLE IF EXISTS `water_txn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `water_txn` (
  `objid` varchar(50) NOT NULL,
  `controlno` varchar(50) DEFAULT NULL,
  `txntypeid` varchar(50) DEFAULT NULL,
  `dtcreated` datetime DEFAULT NULL,
  `createdby_objid` varchar(50) DEFAULT NULL,
  `createdby_name` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `acctid` varchar(50) DEFAULT NULL,
  `acctinfoid` varchar(50) DEFAULT NULL,
  `newacctinfoid` varchar(50) DEFAULT NULL,
  `taskid` varchar(50) DEFAULT NULL,
  `info` mediumtext,
  PRIMARY KEY (`objid`) USING BTREE,
  UNIQUE KEY `uix_water_txn_appno` (`controlno`) USING BTREE,
  KEY `fk_water_txn_txntypeid` (`txntypeid`) USING BTREE,
  KEY `fk_water_txn_newacctinfoid` (`newacctinfoid`) USING BTREE,
  KEY `fk_water_txn_acctinfoid` (`acctinfoid`) USING BTREE,
  KEY `fk_water_txn_acctid` (`acctid`) USING BTREE,
  KEY `fk_water_txn_taskid` (`taskid`) USING BTREE,
  CONSTRAINT `fk_water_txn_acctid` FOREIGN KEY (`acctid`) REFERENCES `water_account` (`objid`),
  CONSTRAINT `fk_water_txn_acctinfoid` FOREIGN KEY (`acctinfoid`) REFERENCES `water_account_info` (`objid`),
  CONSTRAINT `fk_water_txn_newacctinfoid` FOREIGN KEY (`newacctinfoid`) REFERENCES `water_account_info` (`objid`),
  CONSTRAINT `fk_water_txn_taskid` FOREIGN KEY (`taskid`) REFERENCES `water_txn_task` (`taskid`),
  CONSTRAINT `fk_water_txn_txntypeid` FOREIGN KEY (`txntypeid`) REFERENCES `water_txntype` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `water_txn`
--

LOCK TABLES `water_txn` WRITE;
/*!40000 ALTER TABLE `water_txn` DISABLE KEYS */;
/*!40000 ALTER TABLE `water_txn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `water_txn_bill`
--

DROP TABLE IF EXISTS `water_txn_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `water_txn_bill` (
  `objid` varchar(50) NOT NULL,
  `txnid` varchar(50) DEFAULT NULL,
  `billno` varchar(50) DEFAULT NULL,
  `billdate` date DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  UNIQUE KEY `uix_water_txn_bill_billno` (`billno`) USING BTREE,
  UNIQUE KEY `fk_water_txn_bill_txnid` (`txnid`) USING BTREE,
  CONSTRAINT `fk_water_txn_bill_objid` FOREIGN KEY (`objid`) REFERENCES `water_abstract_bill` (`objid`),
  CONSTRAINT `fk_water_txn_bill_txnid` FOREIGN KEY (`txnid`) REFERENCES `water_txn` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `water_txn_bill`
--

LOCK TABLES `water_txn_bill` WRITE;
/*!40000 ALTER TABLE `water_txn_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `water_txn_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `water_txn_billitem`
--

DROP TABLE IF EXISTS `water_txn_billitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `water_txn_billitem` (
  `objid` varchar(50) NOT NULL,
  `billid` varchar(50) DEFAULT NULL,
  `itemid` varchar(50) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `unitrate` decimal(16,2) DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  `auto` int(11) DEFAULT NULL,
  `paymentplanid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  UNIQUE KEY `uix_water_billitem_billid_itemid` (`billid`,`itemid`) USING BTREE,
  KEY `fk_water_txn_billitem_itemid` (`itemid`) USING BTREE,
  KEY `fk_water_txn_billitem_billid` (`billid`) USING BTREE,
  KEY `fk_water_txn_billitem_paymentplanid` (`paymentplanid`) USING BTREE,
  CONSTRAINT `fk_water_txn_billitem_billid` FOREIGN KEY (`billid`) REFERENCES `water_txn_bill` (`objid`),
  CONSTRAINT `fk_water_txn_billitem_itemid` FOREIGN KEY (`itemid`) REFERENCES `water_itemaccount` (`objid`),
  CONSTRAINT `fk_water_txn_billitem_paymentplanid` FOREIGN KEY (`paymentplanid`) REFERENCES `water_payment_plan` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `water_txn_billitem`
--

LOCK TABLES `water_txn_billitem` WRITE;
/*!40000 ALTER TABLE `water_txn_billitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `water_txn_billitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `water_txn_task`
--

DROP TABLE IF EXISTS `water_txn_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `water_txn_task` (
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
  PRIMARY KEY (`taskid`) USING BTREE,
  KEY `ix_actor_objid` (`actor_objid`) USING BTREE,
  KEY `ix_assignee_objid` (`assignee_objid`) USING BTREE,
  KEY `ix_dtcreated` (`dtcreated`) USING BTREE,
  KEY `ix_enddate` (`enddate`) USING BTREE,
  KEY `ix_parentprocessid` (`parentprocessid`) USING BTREE,
  KEY `ix_prevtaskid` (`prevtaskid`) USING BTREE,
  KEY `ix_refid` (`refid`) USING BTREE,
  KEY `ix_startdate` (`startdate`) USING BTREE,
  CONSTRAINT `fk_water_txn_task_refid` FOREIGN KEY (`refid`) REFERENCES `water_txn` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `water_txn_task`
--

LOCK TABLES `water_txn_task` WRITE;
/*!40000 ALTER TABLE `water_txn_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `water_txn_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `water_txntype`
--

DROP TABLE IF EXISTS `water_txntype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `water_txntype` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `sortorder` int(1) DEFAULT NULL,
  `processname` varchar(50) DEFAULT NULL,
  `controlnopattern` varchar(255) DEFAULT NULL,
  `guihandler` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `fk_water_txntype_processname` (`processname`) USING BTREE,
  KEY `fk_water_txntype_role` (`role`) USING BTREE,
  CONSTRAINT `fk_water_txntype_processname` FOREIGN KEY (`processname`) REFERENCES `sys_wf` (`name`),
  CONSTRAINT `fk_water_txntype_role` FOREIGN KEY (`role`) REFERENCES `sys_role` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `water_txntype`
--

LOCK TABLES `water_txntype` WRITE;
/*!40000 ALTER TABLE `water_txntype` DISABLE KEYS */;
INSERT INTO `water_txntype` VALUES ('CAPTURE_ACCOUNT','Capture Account',2,'water_txn_capture_account','CA-[yyyyMM]-[%06d]','water_txn:capture_account','PROCESSOR'),('CHANGE_CLASSIFICATION','Change Account Classification',8,'water_txn_changeinfo','WAC-[yyyyMM]-[%03d]','water_txn:change_classification','PROCESSOR'),('CHANGE_LOCATION','Change Location',4,'water_txn_changeinfo','WA-[yyyyMM]-[%06d]','water_txn:change_location','PROCESSOR'),('CHANGE_METER','Change Meter',5,'water_txn_changeinfo','WC-[yyyy][MM]-[%06d]','water_txn:change_meter','PROCESSOR'),('CHANGE_METER_INFO','Change Meter Info',6,'water_txn_changeinfo','WA-[yyyy][MM]-[%06d]','water_txn:change_meter_info','PROCESSOR'),('CHANGE_OWNER','Change Owner',3,'water_txn_changeowner','WT-[yyyyMM]-[%05d]','water_txn:change_owner','PROCESSOR'),('CHANGE_TAGS','Change Account Tags',9,'water_txn_changeinfo','WAC-[yyyyMM]-[%03d]','water_txn:change_tags','PROCESSOR'),('CHANGE_UNITS','Change Account Units',10,'water_txn_changeinfo','WU-[yyyyMM]-[%03d]','water_txn:change_units','PROCESSOR'),('CHANGE_VOLUME','Change Bill Volume',7,'water_txn_changeinfo','WV-[yyyyMM]-[%03d]','water_txn:change_volume','PROCESSOR'),('CREDITNOTE','Credit Note',20,'water_txn_creditnote','WCN-[yyyyMM]-[%06d]','water_txn:creditnote','PROCESSOR'),('DISCONNECTION','Disconnection',100,'water_txn_disconnection','WD-[yyyy][MM]-[%06d]','water_txn:disconnection','PROCESSOR'),('NEW_ACCOUNT','New Account',1,'water_txn_newaccount','WA-[yyyyMM]-[%06d]','water_txn:new_account','PROCESSOR'),('PAYMENT_PLAN','Compromise Agreement',15,'water_txn_payment_plan','WP-[yyyyMM]-[%03d]','water_txn:payment_plan','PROCESSOR'),('READING_ADJUSTMENT','Reading Adjustment',30,'water_txn_adjustreading','WRD-[yyyyMM]-[%06d]','water_txn:adjust_reading','PROCESSOR'),('RECONNECTION','Reconnection',101,'water_txn_reconnection','WR-[yyyyMM]-[%06d]','water_txn:reconnection','PROCESSOR');
/*!40000 ALTER TABLE `water_txntype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `vw_water_abstract_bill`
--

/*!50001 DROP VIEW IF EXISTS `vw_water_abstract_bill`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_water_abstract_bill` AS select `wb`.`objid` AS `objid`,`wb`.`billno` AS `billno`,`wb`.`billgroupid` AS `billgroupid`,'waterbill' AS `billtype`,`wb`.`year` AS `year`,`wb`.`month` AS `month`,concat(cast(`wb`.`year` as char(4) charset utf8),' ',cast(`wb`.`month` as char(2) charset utf8)) AS `particulars`,(((`wb`.`balanceforward` + `wb`.`interest`) + `wb`.`surcharge`) + `wb`.`amount`) AS `amount` from `vw_water_bill` `wb` union select `tb`.`objid` AS `objid`,`tb`.`billno` AS `billno`,NULL AS `billgroupid`,'txnbill' AS `billtype`,NULL AS `year`,NULL AS `month`,`txn`.`txntypeid` AS `particulars`,`tb`.`amount` AS `amount` from (`water_txn_bill` `tb` join `water_txn` `txn` on((`tb`.`txnid` = `txn`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_water_account`
--

/*!50001 DROP VIEW IF EXISTS `vw_water_account`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_water_account` AS select `ma`.`objid` AS `objid`,`ma`.`acctno` AS `acctno`,`ma`.`acctinfoid` AS `acctinfoid`,`ma`.`taskid` AS `taskid`,`ma`.`lastbillid` AS `lastbillid`,`ma`.`billgroupid` AS `billgroupid`,`ma`.`indexno` AS `indexno`,`mai`.`acctname` AS `acctname`,`mai`.`owner_name` AS `owner_name`,`mai`.`owner_address_text` AS `owner_address_text`,`mai`.`owner_entitytype` AS `owner_entitytype`,`mai`.`owner_profileid` AS `owner_profileid`,`mai`.`owner_profileno` AS `owner_profileno`,`mai`.`owner_firstname` AS `owner_firstname`,`mai`.`owner_lastname` AS `owner_lastname`,`mai`.`owner_middlename` AS `owner_middlename`,`mai`.`owner_resident` AS `owner_resident`,`mai`.`owner_address_unitno` AS `owner_address_unitno`,`mai`.`owner_address_bldgno` AS `owner_address_bldgno`,`mai`.`owner_address_bldgname` AS `owner_address_bldgname`,`mai`.`owner_address_street` AS `owner_address_street`,`mai`.`owner_address_subdivision` AS `owner_address_subdivision`,`mai`.`owner_address_barangay_objid` AS `owner_address_barangay_objid`,`mai`.`owner_address_barangay_name` AS `owner_address_barangay_name`,`mai`.`owner_address_citymunicipality` AS `owner_address_citymunicipality`,`mai`.`owner_address_province` AS `owner_address_province`,`mai`.`owner_tin` AS `owner_tin`,`mai`.`owner_email` AS `owner_email`,`mai`.`owner_mobileno` AS `owner_mobileno`,`mai`.`owner_phoneno` AS `owner_phoneno`,`mai`.`owner_id_type_name` AS `owner_id_type_name`,`mai`.`owner_id_idno` AS `owner_id_idno`,`mai`.`owner_id_placeissued` AS `owner_id_placeissued`,`mai`.`owner_id_dtissued` AS `owner_id_dtissued`,`mai`.`contact_mobileno` AS `contact_mobileno`,`mai`.`contact_email` AS `contact_email`,`mai`.`contact_phoneno` AS `contact_phoneno`,`mai`.`meterid` AS `meterid`,`mai`.`classificationid` AS `classificationid`,`mai`.`classification_objid` AS `classification_objid`,`mai`.`classification_name` AS `classification_name`,`mai`.`location_text` AS `location_text`,`mai`.`location_unitno` AS `location_unitno`,`mai`.`location_bldgno` AS `location_bldgno`,`mai`.`location_bldgname` AS `location_bldgname`,`mai`.`location_street` AS `location_street`,`mai`.`location_subdivision` AS `location_subdivision`,`mai`.`location_barangay_objid` AS `location_barangay_objid`,`mai`.`location_barangay_name` AS `location_barangay_name`,`mai`.`location_lng` AS `location_lng`,`mai`.`location_lat` AS `location_lat`,`mai`.`business_objid` AS `business_objid`,`mai`.`business_bin` AS `business_bin`,`mai`.`business_tradename` AS `business_tradename`,`mai`.`units` AS `units`,`mai`.`tags` AS `tags`,`wag`.`objid` AS `acctgroupid`,`wag`.`name` AS `acctgroup_name`,`wag`.`fullpath` AS `acctgroup_fullpath`,`mai`.`metered` AS `metered`,`mai`.`meter_objid` AS `meter_objid`,`mai`.`meter_serialno` AS `meter_serialno`,`mai`.`meter_brand` AS `meter_brand`,`mai`.`meter_capacity` AS `meter_capacity`,`mai`.`meter_sizeid` AS `meter_sizeid`,`mai`.`meter_customerowned` AS `meter_customerowned`,`mai`.`meter_stocktype` AS `meter_stocktype`,`mai`.`meter_state` AS `meter_state`,`mai`.`meter_size_objid` AS `meter_size_objid`,`mai`.`meter_size_title` AS `meter_size_title`,`mai`.`meter_supersededid` AS `meter_supersededid`,`t`.`state` AS `task_state`,`t`.`dtcreated` AS `task_dtcreated`,`t`.`startdate` AS `task_startdate`,`t`.`enddate` AS `task_enddate`,`t`.`assignee_objid` AS `task_assignee_objid`,`t`.`assignee_name` AS `task_assignee_name`,`t`.`actor_objid` AS `task_actor_objid`,`t`.`actor_name` AS `task_actor_name`,`sn`.`title` AS `task_title`,`sn`.`tracktime` AS `task_tracktime`,`sn`.`properties` AS `task_properties`,`mai`.`notes` AS `notes`,((((`wb`.`balanceforward` + `wb`.`interest`) + `wb`.`surcharge`) + `wb`.`amount`) - (`wb`.`totalpayment` + `wb`.`discount`)) AS `bill_balance`,`bs`.`year` AS `bill_year`,`bs`.`month` AS `bill_month`,`t`.`state` AS `state` from (((((((`water_account` `ma` join `vw_water_account_info` `mai` on((`ma`.`acctinfoid` = `mai`.`objid`))) join `water_account_task` `t` on((`ma`.`taskid` = `t`.`taskid`))) join `sys_wf_node` `sn` on(((`sn`.`processname` = 'water_account') and (`sn`.`name` = `t`.`state`)))) join `water_billgroup` `wbg` on((`ma`.`billgroupid` = `wbg`.`objid`))) join `water_acctgroup` `wag` on((`wbg`.`acctgroupid` = `wag`.`objid`))) left join `water_bill` `wb` on((`wb`.`objid` = `ma`.`lastbillid`))) left join `water_billschedule` `bs` on((`wb`.`scheduleid` = `bs`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_water_account_info`
--

/*!50001 DROP VIEW IF EXISTS `vw_water_account_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_water_account_info` AS select `wai`.`objid` AS `objid`,`wai`.`acctid` AS `acctid`,`wai`.`acctname` AS `acctname`,`wai`.`owner_objid` AS `owner_objid`,`wai`.`owner_name` AS `owner_name`,`wai`.`owner_address_text` AS `owner_address_text`,`wai`.`owner_entitytype` AS `owner_entitytype`,`wai`.`owner_profileid` AS `owner_profileid`,`wai`.`owner_profileno` AS `owner_profileno`,`wai`.`owner_firstname` AS `owner_firstname`,`wai`.`owner_lastname` AS `owner_lastname`,`wai`.`owner_middlename` AS `owner_middlename`,`wai`.`owner_resident` AS `owner_resident`,`wai`.`owner_address_objid` AS `owner_address_objid`,`wai`.`owner_address_unitno` AS `owner_address_unitno`,`wai`.`owner_address_bldgno` AS `owner_address_bldgno`,`wai`.`owner_address_bldgname` AS `owner_address_bldgname`,`wai`.`owner_address_street` AS `owner_address_street`,`wai`.`owner_address_subdivision` AS `owner_address_subdivision`,`wai`.`owner_address_barangay_objid` AS `owner_address_barangay_objid`,`wai`.`owner_address_barangay_name` AS `owner_address_barangay_name`,`wai`.`owner_address_citymunicipality` AS `owner_address_citymunicipality`,`wai`.`owner_address_province` AS `owner_address_province`,`wai`.`owner_tin` AS `owner_tin`,`wai`.`owner_email` AS `owner_email`,`wai`.`owner_mobileno` AS `owner_mobileno`,`wai`.`owner_phoneno` AS `owner_phoneno`,`wai`.`owner_id_type_name` AS `owner_id_type_name`,`wai`.`owner_id_idno` AS `owner_id_idno`,`wai`.`owner_id_placeissued` AS `owner_id_placeissued`,`wai`.`owner_id_dtissued` AS `owner_id_dtissued`,`wai`.`contact_mobileno` AS `contact_mobileno`,`wai`.`contact_email` AS `contact_email`,`wai`.`contact_phoneno` AS `contact_phoneno`,`wai`.`meterid` AS `meterid`,`wai`.`classificationid` AS `classificationid`,`wai`.`business_objid` AS `business_objid`,`wai`.`business_bin` AS `business_bin`,`wai`.`business_tradename` AS `business_tradename`,`wai`.`units` AS `units`,`wai`.`txnid` AS `txnid`,`wai`.`txntype` AS `txntype`,`wai`.`location_text` AS `location_text`,`wai`.`location_unitno` AS `location_unitno`,`wai`.`location_bldgno` AS `location_bldgno`,`wai`.`location_bldgname` AS `location_bldgname`,`wai`.`location_street` AS `location_street`,`wai`.`location_subdivision` AS `location_subdivision`,`wai`.`location_barangay_objid` AS `location_barangay_objid`,`wai`.`location_barangay_name` AS `location_barangay_name`,`wai`.`location_lng` AS `location_lng`,`wai`.`location_lat` AS `location_lat`,`wai`.`tags` AS `tags`,`wai`.`notes` AS `notes`,`wm`.`objid` AS `meter_objid`,`wm`.`serialno` AS `meter_serialno`,`wm`.`brand` AS `meter_brand`,`wm`.`capacity` AS `meter_capacity`,`wm`.`sizeid` AS `meter_sizeid`,`wm`.`customerowned` AS `meter_customerowned`,`wm`.`stocktype` AS `meter_stocktype`,`wm`.`state` AS `meter_state`,`sz`.`objid` AS `meter_size_objid`,`sz`.`title` AS `meter_size_title`,`wm`.`supersededid` AS `meter_supersededid`,`wc`.`objid` AS `classification_objid`,`wc`.`name` AS `classification_name`,`wc`.`description` AS `classification_description`,(case when isnull(`wai`.`meterid`) then 0 else 1 end) AS `metered` from (((`water_account_info` `wai` left join `water_meter` `wm` on((`wai`.`meterid` = `wm`.`objid`))) left join `water_metersize` `sz` on((`wm`.`sizeid` = `sz`.`objid`))) left join `water_classification` `wc` on((`wai`.`classificationid` = `wc`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_water_batch_bill`
--

/*!50001 DROP VIEW IF EXISTS `vw_water_batch_bill`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_water_batch_bill` AS select `mb`.`objid` AS `objid`,`mb`.`state` AS `state`,`mb`.`billgroupid` AS `billgroupid`,`mb`.`scheduleid` AS `scheduleid`,`mb`.`reader_objid` AS `reader_objid`,`mb`.`reader_name` AS `reader_name`,`mb`.`readingdate` AS `readingdate`,`mb`.`taskid` AS `taskid`,`mb`.`createdby_objid` AS `createdby_objid`,`mb`.`createdby_name` AS `createdby_name`,`mb`.`dtcreated` AS `dtcreated`,`mbs`.`groupid` AS `schedulegroupid`,`mbs`.`year` AS `year`,`mbs`.`month` AS `month`,`mbs`.`fromdate` AS `fromdate`,`mbs`.`todate` AS `todate`,`mbs`.`discdate` AS `discdate`,`mbs`.`duedate` AS `duedate`,`mbs`.`readingduedate` AS `readingduedate`,`mbs`.`expirydate` AS `expirydate`,`bg`.`description` AS `description`,(case when (`mbs`.`expirydate` < now()) then 1 else 0 end) AS `expired`,`t`.`state` AS `task_state`,`t`.`dtcreated` AS `task_dtcreated`,`t`.`startdate` AS `task_startdate`,`t`.`enddate` AS `task_enddate`,`t`.`assignee_objid` AS `task_assignee_objid`,`t`.`assignee_name` AS `task_assignee_name`,`t`.`actor_objid` AS `task_actor_objid`,`t`.`actor_name` AS `task_actor_name`,`sn`.`title` AS `task_title`,`sn`.`tracktime` AS `task_tracktime`,`sn`.`properties` AS `task_properties` from ((((`water_batch_bill` `mb` join `water_billschedule` `mbs` on((`mb`.`scheduleid` = `mbs`.`objid`))) join `water_billgroup` `bg` on((`mb`.`billgroupid` = `bg`.`objid`))) join `water_batch_bill_task` `t` on((`mb`.`taskid` = `t`.`taskid`))) join `sys_wf_node` `sn` on(((`sn`.`processname` = 'water_batch_bill') and (`sn`.`name` = `t`.`state`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_water_bill`
--

/*!50001 DROP VIEW IF EXISTS `vw_water_bill`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_water_bill` AS select `mb`.`objid` AS `objid`,`mb`.`batchid` AS `batchid`,`mb`.`billgroupid` AS `billgroupid`,`mb`.`prevbillid` AS `prevbillid`,`mb`.`billno` AS `billno`,`mb`.`billdate` AS `billdate`,`mb`.`lasttxndate` AS `lasttxndate`,`mb`.`validitydate` AS `validitydate`,`mb`.`acctid` AS `acctid`,`mb`.`acctinfoid` AS `acctinfoid`,`mb`.`state` AS `state`,`mb`.`remarks` AS `remarks`,`mb`.`balanceforward` AS `balanceforward`,`mb`.`totalpayment` AS `totalpayment`,`mb`.`interest` AS `interest`,`mb`.`surcharge` AS `surcharge`,`mb`.`amount` AS `amount`,`mb`.`discount` AS `discount`,`mb`.`txnmode` AS `txnmode`,`mb`.`uid` AS `uid`,`mb`.`scheduleid` AS `scheduleid`,`mb`.`prevreading` AS `prevreading`,`mb`.`reading` AS `reading`,`mb`.`readingdate` AS `readingdate`,`mb`.`reader_objid` AS `reader_objid`,`mb`.`reader_name` AS `reader_name`,`mb`.`volume` AS `volume`,`mb`.`rate` AS `rate`,`mb`.`dtprinted` AS `dtprinted`,`ma`.`acctno` AS `acctno`,`mai`.`acctname` AS `acctname`,`mbs`.`year` AS `year`,`mbs`.`month` AS `month`,`mbs`.`fromdate` AS `fromdate`,`mbs`.`todate` AS `todate`,`mbs`.`discdate` AS `discdate`,`mbs`.`duedate` AS `duedate`,`mbs`.`expirydate` AS `expirydate`,((((`mb`.`balanceforward` + `mb`.`interest`) + `mb`.`surcharge`) + `mb`.`amount`) - (`mb`.`totalpayment` + `mb`.`discount`)) AS `balance`,`mai`.`owner_objid` AS `owner_objid`,`mai`.`owner_name` AS `owner_name`,`mai`.`location_text` AS `location_text`,`ma`.`indexno` AS `indexno`,`mai`.`location_barangay_name` AS `location_barangay_name`,`mai`.`location_barangay_objid` AS `location_barangay_objid`,`mai`.`classification_objid` AS `classification_objid`,`mai`.`classification_name` AS `classification_name`,`mai`.`contact_mobileno` AS `contact_mobileno`,`mai`.`contact_email` AS `contact_email`,`mai`.`contact_phoneno` AS `contact_phoneno`,(case when (`mbs`.`expirydate` < now()) then 1 else 0 end) AS `expired`,`mai`.`metered` AS `metered`,`mai`.`meterid` AS `meterid`,`mai`.`meter_objid` AS `meter_objid`,`mai`.`meter_serialno` AS `meter_serialno`,`mai`.`meter_brand` AS `meter_brand`,`mai`.`meter_capacity` AS `meter_capacity`,`mai`.`meter_sizeid` AS `meter_sizeid`,`mai`.`meter_customerowned` AS `meter_customerowned`,`mai`.`meter_stocktype` AS `meter_stocktype`,`mai`.`meter_state` AS `meter_state`,`mai`.`meter_size_objid` AS `meter_size_objid`,`mai`.`meter_size_title` AS `meter_size_title`,`mai`.`meter_supersededid` AS `meter_supersededid`,`mai`.`units` AS `units` from (((`water_bill` `mb` join `water_billschedule` `mbs` on((`mb`.`scheduleid` = `mbs`.`objid`))) join `water_account` `ma` on((`mb`.`acctid` = `ma`.`objid`))) join `vw_water_bill_account_info` `mai` on((`ma`.`acctinfoid` = `mai`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_water_bill_account_info`
--

/*!50001 DROP VIEW IF EXISTS `vw_water_bill_account_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_water_bill_account_info` AS select `wai`.`objid` AS `objid`,`wai`.`acctname` AS `acctname`,`wai`.`owner_objid` AS `owner_objid`,`wai`.`owner_name` AS `owner_name`,`wai`.`location_text` AS `location_text`,`wai`.`location_barangay_name` AS `location_barangay_name`,`wai`.`location_barangay_objid` AS `location_barangay_objid`,`wai`.`contact_mobileno` AS `contact_mobileno`,`wai`.`contact_email` AS `contact_email`,`wai`.`contact_phoneno` AS `contact_phoneno`,1 AS `metered`,`wai`.`meterid` AS `meterid`,`wai`.`units` AS `units`,`wm`.`objid` AS `meter_objid`,`wm`.`serialno` AS `meter_serialno`,`wm`.`brand` AS `meter_brand`,`wm`.`capacity` AS `meter_capacity`,`wm`.`sizeid` AS `meter_sizeid`,`wm`.`customerowned` AS `meter_customerowned`,`wm`.`stocktype` AS `meter_stocktype`,`wm`.`state` AS `meter_state`,`sz`.`objid` AS `meter_size_objid`,`sz`.`title` AS `meter_size_title`,`wm`.`supersededid` AS `meter_supersededid`,`wc`.`objid` AS `classification_objid`,`wc`.`name` AS `classification_name`,`wc`.`description` AS `classification_description` from (((`water_account_info` `wai` join `water_meter` `wm` on((`wai`.`meterid` = `wm`.`objid`))) join `water_metersize` `sz` on((`wm`.`sizeid` = `sz`.`objid`))) join `water_classification` `wc` on((`wai`.`classificationid` = `wc`.`objid`))) union select `wai`.`objid` AS `objid`,`wai`.`acctname` AS `acctname`,`wai`.`owner_objid` AS `owner_objid`,`wai`.`owner_name` AS `owner_name`,`wai`.`location_text` AS `location_text`,`wai`.`location_barangay_name` AS `location_barangay_name`,`wai`.`location_barangay_objid` AS `location_barangay_objid`,`wai`.`contact_mobileno` AS `contact_mobileno`,`wai`.`contact_email` AS `contact_email`,`wai`.`contact_phoneno` AS `contact_phoneno`,0 AS `metered`,`wai`.`meterid` AS `meterid`,`wai`.`units` AS `units`,NULL AS `meter_objid`,NULL AS `meter_serialno`,NULL AS `meter_brand`,NULL AS `meter_capacity`,NULL AS `meter_sizeid`,NULL AS `meter_customerowned`,NULL AS `meter_stocktype`,NULL AS `meter_state`,NULL AS `meter_size_objid`,NULL AS `meter_size_title`,NULL AS `meter_supersededid`,`wc`.`objid` AS `classification_objid`,`wc`.`name` AS `classification_name`,`wc`.`description` AS `classification_description` from (`water_account_info` `wai` join `water_classification` `wc` on((`wai`.`classificationid` = `wc`.`objid`))) where isnull(`wai`.`meterid`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_water_bill_payment`
--

/*!50001 DROP VIEW IF EXISTS `vw_water_bill_payment`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_water_bill_payment` AS select `pp`.`objid` AS `objid`,`pp`.`billid` AS `billid`,`pp`.`refid` AS `refid`,`pp`.`refno` AS `refno`,`pp`.`reftype` AS `reftype`,`pp`.`refdate` AS `refdate`,`pp`.`txnmode` AS `txnmode`,`pp`.`voided` AS `voided`,`pp`.`amount` AS `amount`,`pp`.`remarks` AS `remarks`,`pp`.`txnid` AS `txnid`,`pp`.`payer_objid` AS `payer_objid`,`pp`.`payer_name` AS `payer_name`,`pp`.`paidby` AS `paidby`,`pp`.`paidbyaddress` AS `paidbyaddress`,`pp`.`posted` AS `posted`,`wb`.`acctid` AS `acctid`,`wb`.`billno` AS `billrefno`,`bs`.`year` AS `year`,`bs`.`month` AS `month` from ((`water_payment` `pp` join `water_bill` `wb` on((`pp`.`billid` = `wb`.`objid`))) join `water_billschedule` `bs` on((`wb`.`scheduleid` = `bs`.`objid`))) where ((`pp`.`reftype` in ('cashreceipt','eor')) and (`pp`.`voided` = 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_water_billitem`
--

/*!50001 DROP VIEW IF EXISTS `vw_water_billitem`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_water_billitem` AS select `mbi`.`objid` AS `objid`,`mbi`.`billid` AS `billid`,`mbi`.`itemid` AS `itemid`,`mbi`.`amount` AS `amount`,`mbi`.`amtpaid` AS `amtpaid`,`mbi`.`remarks` AS `remarks`,`mbi`.`uid` AS `uid`,`mbi`.`auto` AS `auto`,`mbi`.`forwarded` AS `forwarded`,`mbi`.`billdate` AS `billdate`,`mbi`.`supersededid` AS `supersededid`,(case when isnull(`mri`.`year`) then concat(`mai`.`title`,' ',cast(`mri`.`year` as char(4) charset utf8),' ',cast(`mri`.`month` as char(2) charset utf8)) else `mai`.`title` end) AS `particulars`,`mri`.`year` AS `year`,`mri`.`month` AS `month`,`mri`.`duedate` AS `duedate`,`mri`.`paymentplanid` AS `paymentplanid`,(case when isnull(`abi`.`objid`) then 0 else 1 end) AS `superseded`,`abi`.`supersededid` AS `supersederid` from (((`water_abstract_billitem` `mbi` join `water_billitem` `mri` on((`mri`.`objid` = `mbi`.`objid`))) join `water_itemaccount` `mai` on((`mbi`.`itemid` = `mai`.`objid`))) left join `water_abstract_billitem` `abi` on((`mbi`.`objid` = `abi`.`supersededid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_water_billitem_subitem`
--

/*!50001 DROP VIEW IF EXISTS `vw_water_billitem_subitem`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_water_billitem_subitem` AS select `abi`.`objid` AS `objid`,`abi`.`billid` AS `billid`,`abi`.`itemid` AS `itemid`,`abi`.`amount` AS `amount`,`abi`.`amtpaid` AS `amtpaid`,`abi`.`remarks` AS `remarks`,`abi`.`uid` AS `uid`,`abi`.`auto` AS `auto`,`abi`.`forwarded` AS `forwarded`,`abi`.`billdate` AS `billdate`,`abi`.`supersededid` AS `supersededid`,`pbi`.`billitemrefid` AS `billitemrefid`,(`abi`.`amount` - `abi`.`amtpaid`) AS `balance`,`pbi`.`type` AS `type`,(case when isnull(`xbi`.`objid`) then 0 else 1 end) AS `superseded`,`xbi`.`supersededid` AS `supersederid`,`rabi`.`itemid` AS `refitemid`,`rbi`.`year` AS `refyear`,`rbi`.`month` AS `refmonth` from ((((`water_abstract_billitem` `abi` join `water_billitem_subitem` `pbi` on((`pbi`.`objid` = `abi`.`objid`))) join `water_abstract_billitem` `rabi` on((`rabi`.`objid` = `pbi`.`billitemrefid`))) left join `water_billitem` `rbi` on((`rabi`.`objid` = `rbi`.`objid`))) left join `water_abstract_billitem` `xbi` on((`abi`.`objid` = `xbi`.`supersededid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_water_credit_billitem`
--

/*!50001 DROP VIEW IF EXISTS `vw_water_credit_billitem`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_water_credit_billitem` AS select `abi`.`objid` AS `objid`,`abi`.`billid` AS `billid`,`abi`.`itemid` AS `itemid`,`abi`.`amount` AS `amount`,`abi`.`amtpaid` AS `amtpaid`,`abi`.`remarks` AS `remarks`,`abi`.`uid` AS `uid`,`abi`.`auto` AS `auto`,`abi`.`forwarded` AS `forwarded`,`abi`.`billdate` AS `billdate`,`abi`.`supersededid` AS `supersededid`,`cbi`.`paymentid` AS `paymentid` from (`water_abstract_billitem` `abi` join `water_credit_billitem` `cbi` on((`cbi`.`objid` = `abi`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_water_expired_batch_bill`
--

/*!50001 DROP VIEW IF EXISTS `vw_water_expired_batch_bill`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_water_expired_batch_bill` AS select `bb`.`objid` AS `objid`,`bg`.`description` AS `description`,`bg`.`state` AS `state`,`bg`.`tag` AS `tag`,`bg`.`schedulegroupid` AS `schedulegroupid`,`bg`.`currentbatchid` AS `currentbatchid`,`bg`.`acctgroupid` AS `acctgroupid`,`bb`.`year` AS `year`,`bb`.`month` AS `month`,`bb`.`scheduleid` AS `scheduleid`,`bb`.`expirydate` AS `expirydate`,`bb`.`task_state` AS `task_state`,`bb`.`reader_objid` AS `reader_objid`,`bb`.`reader_name` AS `reader_name` from (`water_billgroup` `bg` join `vw_water_batch_bill` `bb` on((`bg`.`currentbatchid` = `bb`.`objid`))) where ((`bb`.`expirydate` < now()) and (`bb`.`task_state` = 'end')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_water_meter`
--

/*!50001 DROP VIEW IF EXISTS `vw_water_meter`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_water_meter` AS select `wm`.`objid` AS `objid`,`wm`.`state` AS `state`,`wm`.`serialno` AS `serialno`,`wm`.`brand` AS `brand`,`wm`.`currentacctid` AS `currentacctid`,`wm`.`capacity` AS `capacity`,`wm`.`customerowned` AS `customerowned`,`wm`.`stocktype` AS `stocktype`,`wm`.`sizeid` AS `sizeid`,`wm`.`supersededid` AS `supersededid`,`wa`.`objid` AS `account_objid`,`wa`.`acctno` AS `account_acctno`,`wa`.`acctname` AS `account_acctname`,`ws`.`objid` AS `size_objid`,`ws`.`title` AS `size_title`,(case when isnull(`swm`.`objid`) then 0 else 1 end) AS `superseded` from (((`water_meter` `wm` left join `water_metersize` `ws` on((`wm`.`sizeid` = `ws`.`objid`))) left join `water_meter` `swm` on((`wm`.`objid` = `swm`.`supersededid`))) left join `vw_water_account` `wa` on((`wm`.`currentacctid` = `wa`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_water_payment_plan`
--

/*!50001 DROP VIEW IF EXISTS `vw_water_payment_plan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_water_payment_plan` AS select `pp`.`objid` AS `objid`,`pp`.`downpaymentrate` AS `downpaymentrate`,`pp`.`downpayment` AS `downpayment`,`pp`.`term` AS `term`,`pp`.`principal` AS `principal`,`pp`.`installmentamt` AS `installmentamt`,`pp`.`startdate` AS `startdate`,`pp`.`billcount` AS `billcount`,`pp`.`amtbilled` AS `amtbilled`,`pp`.`itemid` AS `itemid`,`p`.`refid` AS `refid`,`p`.`refno` AS `refno`,`p`.`refdate` AS `refdate`,`p`.`reftype` AS `reftype`,`p`.`txnid` AS `txnid`,`p`.`billid` AS `billid`,`p`.`txnmode` AS `txnmode`,`p`.`voided` AS `voided`,`p`.`remarks` AS `remarks`,`p`.`posted` AS `posted`,`p`.`amount` AS `amount`,`txn`.`acctid` AS `acctid`,`txn`.`txntypeid` AS `txntypeid`,(`pp`.`principal` - `pp`.`amtbilled`) AS `balance` from ((`water_payment_plan` `pp` join `water_payment` `p` on((`pp`.`objid` = `p`.`objid`))) join `water_txn` `txn` on((`p`.`txnid` = `txn`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_water_txn`
--

/*!50001 DROP VIEW IF EXISTS `vw_water_txn`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_water_txn` AS select `txn`.`objid` AS `objid`,`txn`.`controlno` AS `controlno`,`txn`.`txntypeid` AS `txntypeid`,`txn`.`dtcreated` AS `dtcreated`,`txn`.`createdby_objid` AS `createdby_objid`,`txn`.`createdby_name` AS `createdby_name`,`txn`.`remarks` AS `remarks`,`txn`.`acctid` AS `acctid`,`txn`.`acctinfoid` AS `acctinfoid`,`txn`.`newacctinfoid` AS `newacctinfoid`,`txn`.`taskid` AS `taskid`,`txn`.`info` AS `info`,`typ`.`objid` AS `txntype_objid`,`typ`.`title` AS `txntype_title`,`typ`.`processname` AS `txntype_processname`,`typ`.`guihandler` AS `txntype_guihandler`,`t`.`state` AS `task_state`,`t`.`dtcreated` AS `task_dtcreated`,`t`.`startdate` AS `task_startdate`,`t`.`enddate` AS `task_enddate`,`t`.`assignee_objid` AS `task_assignee_objid`,`t`.`assignee_name` AS `task_assignee_name`,`t`.`actor_objid` AS `task_actor_objid`,`t`.`actor_name` AS `task_actor_name`,`sn`.`title` AS `task_title`,`sn`.`tracktime` AS `task_tracktime`,`sn`.`properties` AS `task_properties`,`tb`.`objid` AS `billid` from ((((`water_txn` `txn` join `water_txntype` `typ` on((`txn`.`txntypeid` = `typ`.`objid`))) join `water_txn_task` `t` on((`txn`.`taskid` = `t`.`taskid`))) join `sys_wf_node` `sn` on(((`sn`.`processname` = `typ`.`processname`) and (`sn`.`name` = `t`.`state`)))) left join `water_txn_bill` `tb` on((`txn`.`objid` = `tb`.`txnid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_water_txn_paymentitem`
--

/*!50001 DROP VIEW IF EXISTS `vw_water_txn_paymentitem`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_water_txn_paymentitem` AS select `bi`.`objid` AS `objid`,`pi`.`paymentid` AS `paymentid`,concat(`ia`.`title`,' ',cast(`bi`.`year` as char(4) charset utf8),'-',cast(`bi`.`month` as char(2) charset utf8)) AS `particulars`,`pi`.`amount` AS `amount` from (((`water_billitem` `bi` join `water_abstract_billitem` `abi` on((`bi`.`objid` = `abi`.`objid`))) join `water_paymentitem` `pi` on((`pi`.`billitemrefid` = `bi`.`objid`))) join `water_itemaccount` `ia` on((`abi`.`itemid` = `ia`.`objid`))) union select `sbi`.`objid` AS `objid`,`pi`.`paymentid` AS `paymentid`,concat(`ia`.`title`,' ',`bi`.`year`,'-',`bi`.`month`) AS `particulars`,`pi`.`amount` AS `amount` from ((((`water_billitem_subitem` `sbi` join `water_abstract_billitem` `abi` on((`sbi`.`objid` = `abi`.`objid`))) join `water_paymentitem` `pi` on((`pi`.`billitemrefid` = `sbi`.`objid`))) join `water_billitem` `bi` on((`sbi`.`billitemrefid` = `bi`.`objid`))) join `water_itemaccount` `ia` on((`abi`.`itemid` = `ia`.`objid`))) */;
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

-- Dump completed on 2024-03-21 16:13:34
