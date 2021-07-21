-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: localhost    Database: e_sapp
-- ------------------------------------------------------
-- Server version	8.0.25-0ubuntu0.21.04.1

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
-- Table structure for table `audit_trail`
--

DROP TABLE IF EXISTS `audit_trail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_trail` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user` int NOT NULL,
  `action` text NOT NULL,
  `date` int unsigned NOT NULL,
  `ip_address` varchar(255) NOT NULL DEFAULT '',
  `user_agent` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `fk_audit_trail_1_idx` (`user`),
  CONSTRAINT `fk_audit_trail_1` FOREIGN KEY (`user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `awpb_activity`
--

DROP TABLE IF EXISTS `awpb_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awpb_activity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `activity_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_activity_id` int DEFAULT NULL,
  `component_id` int NOT NULL,
  `outcome_id` int DEFAULT NULL,
  `output_id` int DEFAULT NULL,
  `commodity_type_id` int unsigned DEFAULT NULL,
  `type` int NOT NULL COMMENT '0 Main activity, 1 Subactivity',
  `activity_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `awpb_template_id` int DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_of_measure_id` int DEFAULT NULL,
  `programme_target` double DEFAULT NULL,
  `cumulative_planned` double NOT NULL,
  `cumulative_actual` double NOT NULL,
  `indicator_id` int DEFAULT NULL,
  `funder_id` int DEFAULT NULL,
  `gl_account_code` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quarter_one_budget` double DEFAULT NULL,
  `quarter_two_budget` double DEFAULT NULL,
  `quarter_three_budget` double DEFAULT NULL,
  `quarter_four_budget` double DEFAULT NULL,
  `total_budget` double DEFAULT NULL,
  `expense_category_id` int DEFAULT NULL,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `description` (`description`),
  KEY `component_id` (`component_id`),
  KEY `commodity_id` (`commodity_type_id`),
  KEY `output_id` (`output_id`),
  KEY `outcome_id` (`outcome_id`),
  KEY `indicator_id` (`indicator_id`),
  KEY `funder_id` (`funder_id`),
  KEY `activity_code` (`activity_code`),
  KEY `unit_of_measure_id` (`unit_of_measure_id`),
  KEY `awpb_template_id` (`awpb_template_id`),
  KEY `expense_category_id` (`expense_category_id`),
  CONSTRAINT `awpb_activity_ibfk_1` FOREIGN KEY (`component_id`) REFERENCES `awpb_component` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `awpb_activity_ibfk_2` FOREIGN KEY (`expense_category_id`) REFERENCES `awpb_expense_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `awpb_activity_ibfk_3` FOREIGN KEY (`awpb_template_id`) REFERENCES `awpb_template` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `awpb_activity_ibfk_4` FOREIGN KEY (`unit_of_measure_id`) REFERENCES `awpb_unit_of_measure` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `awpb_activity_ibfk_5` FOREIGN KEY (`funder_id`) REFERENCES `awpb_funder` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `awpb_activity_ibfk_6` FOREIGN KEY (`indicator_id`) REFERENCES `awpb_indicator` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `awpb_activity_ibfk_7` FOREIGN KEY (`outcome_id`) REFERENCES `awpb_outcome` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `awpb_activity_ibfk_8` FOREIGN KEY (`output_id`) REFERENCES `awpb_output` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `awpb_activity_ibfk_9` FOREIGN KEY (`commodity_type_id`) REFERENCES `awpb_commodity_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awpb_activity`
--

LOCK TABLES `awpb_activity` WRITE;
/*!40000 ALTER TABLE `awpb_activity` DISABLE KEYS */;
INSERT INTO `awpb_activity` VALUES (90,'1.1.A',NULL,42,1,1,1,0,'Main',32,'Policy related activities','Policy related activities',1,500,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,14,14,14),(95,'1.1.A2',90,42,NULL,1,12,1,'Subactivity',NULL,'Provincial Validation of the ZNAD','Provincial Validation of the ZNAD',1,500,0,1965,NULL,2,'2000',NULL,NULL,NULL,NULL,NULL,1,1621278447,1621278447,14,14),(96,'1.1.A2',90,42,NULL,1,12,1,'Subactivity',NULL,'Drafting of the ZNADS','Drafting of the ZNADS',NULL,500,0,0,NULL,1,'2000',NULL,NULL,NULL,NULL,NULL,1,1621281291,1621281291,14,14),(98,'1.1.B',NULL,42,NULL,NULL,NULL,0,'Main Activity',NULL,' ZNADS implementation activities ',' ZNADS implementation activities ',NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1621282942,1621282942,14,14),(99,'1.1.B1',98,43,NULL,1,12,1,'Subactivity',NULL,'Dissemination of the Strategy    ','Dissemination of the Strategy    ',1,300,0,50,NULL,2,'2000',NULL,NULL,NULL,NULL,NULL,1,1621283049,1625594530,14,14),(100,'2.1.A',NULL,44,NULL,2,NULL,0,'Main Activity',NULL,'Activities related to strengthening of organizations/cooperatives/marketing groups  and creation of formal partnerships/agreements','Activity 2.1.A',NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1622381978,1622381978,14,14),(101,'2.1.A1',100,44,NULL,2,12,1,'Subactivity',NULL,'Stakeholder Engagement for Phase 2 and 3 Cat. A farmers\r\n','Activity 2.1.A1',NULL,500,0,0,NULL,2,'0760',NULL,NULL,NULL,NULL,NULL,1,1622386805,1622386805,14,14);
/*!40000 ALTER TABLE `awpb_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awpb_activity_funder`
--

DROP TABLE IF EXISTS `awpb_activity_funder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awpb_activity_funder` (
  `id` int NOT NULL AUTO_INCREMENT,
  `activity_id` int NOT NULL,
  `funder_id` int NOT NULL,
  `amount` double NOT NULL,
  `percentage` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `funder_id` (`funder_id`),
  KEY `activity_id` (`activity_id`),
  CONSTRAINT `awpb_activity_funder_ibfk_1` FOREIGN KEY (`funder_id`) REFERENCES `awpb_funder` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `awpb_activity_funder_ibfk_2` FOREIGN KEY (`activity_id`) REFERENCES `awpb_activity` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awpb_activity_funder`
--

LOCK TABLES `awpb_activity_funder` WRITE;
/*!40000 ALTER TABLE `awpb_activity_funder` DISABLE KEYS */;
/*!40000 ALTER TABLE `awpb_activity_funder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awpb_activity_line`
--

DROP TABLE IF EXISTS `awpb_activity_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awpb_activity_line` (
  `id` int NOT NULL AUTO_INCREMENT,
  `activity_id` int NOT NULL,
  `awpb_template_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_cost` double NOT NULL,
  `mo_1` double DEFAULT NULL,
  `mo_2` double DEFAULT NULL,
  `mo_3` double DEFAULT NULL,
  `mo_4` double DEFAULT NULL,
  `mo_5` double DEFAULT NULL,
  `mo_6` double DEFAULT NULL,
  `mo_7` double DEFAULT NULL,
  `mo_8` double DEFAULT NULL,
  `mo_9` double DEFAULT NULL,
  `mo_10` double DEFAULT NULL,
  `mo_11` double DEFAULT NULL,
  `mo_12` double DEFAULT NULL,
  `quarter_one_quantity` double DEFAULT NULL,
  `quarter_two_quantity` double DEFAULT NULL,
  `quarter_three_quantity` double DEFAULT NULL,
  `quarter_four_quantity` double DEFAULT NULL,
  `total_quantity` double NOT NULL,
  `mo_1_amount` double DEFAULT NULL,
  `mo_2_amount` double DEFAULT NULL,
  `mo_3_amount` double DEFAULT NULL,
  `mo_4_amount` double DEFAULT NULL,
  `mo_5_amount` double DEFAULT NULL,
  `mo_6_amount` double DEFAULT NULL,
  `mo_7_amount` double DEFAULT NULL,
  `mo_8_amount` double DEFAULT NULL,
  `mo_9_amount` double DEFAULT NULL,
  `mo_10_amount` double DEFAULT NULL,
  `mo_11_amount` double DEFAULT NULL,
  `mo_12_amount` double DEFAULT NULL,
  `quarter_one_amount` double DEFAULT NULL,
  `quarter_two_amount` double DEFAULT NULL,
  `quarter_three_amount` double DEFAULT NULL,
  `quarter_four_amount` double DEFAULT NULL,
  `total_amount` double NOT NULL,
  `mo_1_actual` double DEFAULT NULL,
  `mo_2_actual` double DEFAULT NULL,
  `mo_3_actual` double DEFAULT NULL,
  `mo_4_actual` double DEFAULT NULL,
  `mo_5_actual` double DEFAULT NULL,
  `mo_6_actual` double DEFAULT NULL,
  `mo_7_actual` double DEFAULT NULL,
  `mo_8_actual` double DEFAULT NULL,
  `mo_9_actual` double DEFAULT NULL,
  `mo_10_actual` double DEFAULT NULL,
  `mo_11_actual` double DEFAULT NULL,
  `mo_12_actual` double DEFAULT NULL,
  `status` int NOT NULL,
  `district_id` int unsigned DEFAULT NULL,
  `province_id` int unsigned DEFAULT NULL,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `province_id` (`province_id`),
  KEY `district_id` (`district_id`),
  KEY `activity_id` (`activity_id`),
  KEY `awpb_template_id` (`awpb_template_id`),
  CONSTRAINT `awpb_activity_line_ibfk_3` FOREIGN KEY (`activity_id`) REFERENCES `awpb_activity` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `awpb_activity_line_ibfk_4` FOREIGN KEY (`awpb_template_id`) REFERENCES `awpb_template` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awpb_activity_line`
--

LOCK TABLES `awpb_activity_line` WRITE;
/*!40000 ALTER TABLE `awpb_activity_line` DISABLE KEYS */;
/*!40000 ALTER TABLE `awpb_activity_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awpb_budget`
--

DROP TABLE IF EXISTS `awpb_budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awpb_budget` (
  `id` int NOT NULL AUTO_INCREMENT,
  `component_id` int NOT NULL,
  `output_id` int NOT NULL,
  `activity_id` int NOT NULL,
  `awpb_template_id` int NOT NULL,
  `indicator_id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `unit_cost` double DEFAULT NULL,
  `mo_1` double DEFAULT NULL,
  `mo_2` double DEFAULT NULL,
  `mo_3` double DEFAULT NULL,
  `mo_4` double DEFAULT NULL,
  `mo_5` double DEFAULT NULL,
  `mo_6` double DEFAULT NULL,
  `mo_7` double DEFAULT NULL,
  `mo_8` double DEFAULT NULL,
  `mo_9` double DEFAULT NULL,
  `mo_10` double DEFAULT NULL,
  `mo_11` double DEFAULT NULL,
  `mo_12` double DEFAULT NULL,
  `quarter_one_quantity` double DEFAULT NULL,
  `quarter_two_quantity` double DEFAULT NULL,
  `quarter_three_quantity` double DEFAULT NULL,
  `quarter_four_quantity` double DEFAULT NULL,
  `total_quantity` double NOT NULL,
  `mo_1_amount` double DEFAULT NULL,
  `mo_2_amount` double DEFAULT NULL,
  `mo_3_amount` double DEFAULT NULL,
  `mo_4_amount` double DEFAULT NULL,
  `mo_5_amount` double DEFAULT NULL,
  `mo_6_amount` double DEFAULT NULL,
  `mo_7_amount` double DEFAULT NULL,
  `mo_8_amount` double DEFAULT NULL,
  `mo_9_amount` double DEFAULT NULL,
  `mo_10_amount` double DEFAULT NULL,
  `mo_11_amount` double DEFAULT NULL,
  `mo_12_amount` double DEFAULT NULL,
  `quarter_one_amount` double DEFAULT NULL,
  `quarter_two_amount` double DEFAULT NULL,
  `quarter_three_amount` double DEFAULT NULL,
  `quarter_four_amount` double DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `mo_1_actual` double DEFAULT NULL,
  `mo_2_actual` double DEFAULT NULL,
  `mo_3_actual` double DEFAULT NULL,
  `mo_4_actual` double DEFAULT NULL,
  `mo_5_actual` double DEFAULT NULL,
  `mo_6_actual` double DEFAULT NULL,
  `mo_7_actual` double DEFAULT NULL,
  `mo_8_actual` double DEFAULT NULL,
  `mo_9_actual` double DEFAULT NULL,
  `mo_10_actual` double DEFAULT NULL,
  `mo_11_actual` double DEFAULT NULL,
  `mo_12_actual` double DEFAULT NULL,
  `quarter_one_actual` double DEFAULT NULL,
  `quarter_two_actual` double DEFAULT NULL,
  `quarter_three_actual` double DEFAULT NULL,
  `quarter_four_actual` double DEFAULT NULL,
  `status` int NOT NULL,
  `number_of_females` int DEFAULT NULL,
  `number_of_males` int DEFAULT NULL,
  `number_of_young_people` int DEFAULT NULL,
  `number_of_not_young_people` int DEFAULT NULL,
  `number_of_women_headed_households` int DEFAULT NULL,
  `number_of_non_women_headed_households` int DEFAULT NULL,
  `number_of_household_members` int DEFAULT NULL,
  `number_of_females_actual` double DEFAULT NULL,
  `number_of_males_actual` double DEFAULT NULL,
  `number_of_young_people_actual` double DEFAULT NULL,
  `number_of_not_young_people_actual` double DEFAULT NULL,
  `number_of_women_headed_households_actual` double DEFAULT NULL,
  `number_of_non_women_headed_households_actual` double DEFAULT NULL,
  `number_of_household_members_actual` double DEFAULT NULL,
  `camp_id` int unsigned DEFAULT NULL,
  `district_id` int unsigned DEFAULT NULL,
  `province_id` int unsigned DEFAULT NULL,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_id` (`activity_id`),
  KEY `district_id` (`district_id`),
  KEY `province_id` (`province_id`),
  KEY `awpb_template_id` (`awpb_template_id`),
  KEY `indicator_id` (`indicator_id`),
  KEY `component_id` (`component_id`),
  KEY `output_id` (`output_id`),
  KEY `camp_id` (`camp_id`),
  CONSTRAINT `awpb_budget_ibfk_1` FOREIGN KEY (`awpb_template_id`) REFERENCES `awpb_template` (`id`),
  CONSTRAINT `awpb_budget_ibfk_2` FOREIGN KEY (`component_id`) REFERENCES `awpb_component` (`id`),
  CONSTRAINT `awpb_budget_ibfk_3` FOREIGN KEY (`output_id`) REFERENCES `awpb_output` (`id`),
  CONSTRAINT `awpb_budget_ibfk_4` FOREIGN KEY (`activity_id`) REFERENCES `awpb_activity` (`id`),
  CONSTRAINT `awpb_budget_ibfk_5` FOREIGN KEY (`indicator_id`) REFERENCES `awpb_indicator` (`id`),
  CONSTRAINT `awpb_budget_ibfk_6` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`),
  CONSTRAINT `awpb_budget_ibfk_7` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`),
  CONSTRAINT `awpb_budget_ibfk_8` FOREIGN KEY (`camp_id`) REFERENCES `camp` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awpb_budget`
--

LOCK TABLES `awpb_budget` WRITE;
/*!40000 ALTER TABLE `awpb_budget` DISABLE KEYS */;
INSERT INTO `awpb_budget` VALUES (59,42,2,98,31,14,'Number of Category A farmers mobilised',NULL,1,0,0,2,0,0,0,0,0,0,0,0,1,2,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,4,5,3,6,5,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,0,1624269646,14,14),(60,43,2,99,31,15,'Number of Category A female farmers Mobi',NULL,5,4,58,89,96,96,99,98,77,22,11,23,67,281,274,56,678,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,NULL,1,10,2,9,3,6,0,0,18,NULL,2,NULL,7,NULL,NULL,NULL,2,1,1623538161,1624269646,14,14),(61,44,2,100,31,17,'Number of Category A Female Headed House',NULL,5,5,8,8,8,8,7,8,8,8,8,48,18,24,23,64,129,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,5,5,5,5,5,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,42,5,1623546812,1625003653,18,18),(62,44,2,101,31,14,'Number of Category A farmers mobilised',NULL,15,5,5,5,5,5,5,5,5,5,5,5,25,15,15,15,70,0,0,0,0,0,0,0,0,0,0,0,0,3833.25,3833.25,3833.25,3833.25,15333,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,6,6,5,5,5,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,42,5,1624609480,1625004156,18,18),(63,44,2,101,29,14,'Number of Category A farmers mobilised',NULL,2,2,2,2,2,2,2,2,2,2,2,2,6,6,6,6,24,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15000,15000,10000,45000,85000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,2,2,2,2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,42,5,1624633310,1625004157,18,18);
/*!40000 ALTER TABLE `awpb_budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awpb_comment`
--

DROP TABLE IF EXISTS `awpb_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awpb_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `awpb_template_id` int NOT NULL,
  `district_id` int DEFAULT NULL,
  `province_id` int DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awpb_comment`
--

LOCK TABLES `awpb_comment` WRITE;
/*!40000 ALTER TABLE `awpb_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `awpb_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awpb_commodity_type`
--

DROP TABLE IF EXISTS `awpb_commodity_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awpb_commodity_type` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_commodity_type_1_idx` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awpb_commodity_type`
--

LOCK TABLES `awpb_commodity_type` WRITE;
/*!40000 ALTER TABLE `awpb_commodity_type` DISABLE KEYS */;
INSERT INTO `awpb_commodity_type` VALUES (1,1,'comodity 1',1,1,NULL,NULL),(2,3,'Soya beans',1607447814,1607447814,1,1),(3,3,'Groundnuts',1607447827,1607447827,1,1),(4,3,'Rice',1607447871,1607447871,1,1),(5,4,'Mealie meal',1607447890,1607447952,1,1),(6,4,'Roller meal',1607447902,1607447956,1,1),(7,2,'Maize Seed',1607447971,1607447971,1,1),(8,2,'Groundnut seed',1607447992,1607447992,1,1),(9,2,'Rice seed',1607448004,1607448004,1,1),(10,2,'D-Compound',1607448021,1607448021,1,1),(11,2,'Urea',1607448041,1607448041,1,1),(12,NULL,'Multiple',1607182013,1607362711,14,14),(20,3,'Maize',1607446739,1607447798,1,1);
/*!40000 ALTER TABLE `awpb_commodity_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awpb_component`
--

DROP TABLE IF EXISTS `awpb_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awpb_component` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_component_id` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `outcome` text COLLATE utf8mb4_unicode_ci,
  `output` text COLLATE utf8mb4_unicode_ci,
  `type` int NOT NULL DEFAULT '0' COMMENT '0 Main component, 1 Subcomponent,',
  `access_level` int DEFAULT '0' COMMENT '0 All.1 District, 2 Programme,',
  `subcomponent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `funder_id` int DEFAULT NULL,
  `expense_category_id` int DEFAULT NULL,
  `gl_account_code` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_level_district` int DEFAULT NULL,
  `access_level_programme` int DEFAULT NULL,
  `access_level_province` int DEFAULT NULL,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int NOT NULL,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `description` (`description`),
  UNIQUE KEY `component_description` (`name`),
  UNIQUE KEY `component_code` (`code`),
  KEY `funder_id` (`funder_id`),
  KEY `expense_category_id` (`expense_category_id`),
  KEY `parent_component_id` (`parent_component_id`),
  CONSTRAINT `awpb_component_ibfk_1` FOREIGN KEY (`expense_category_id`) REFERENCES `awpb_expense_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `awpb_component_ibfk_2` FOREIGN KEY (`funder_id`) REFERENCES `awpb_funder` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awpb_component`
--

LOCK TABLES `awpb_component` WRITE;
/*!40000 ALTER TABLE `awpb_component` DISABLE KEYS */;
INSERT INTO `awpb_component` VALUES (41,'2.3',43,'Facilitating Pro-Smallholder Market-Pull Agribusiness Partnerships','Facilitating Pro-Smallholder Market-Pull Agribusiness Partnerships','','',1,2,'Subcomponent',NULL,NULL,NULL,1,NULL,1,0,0,14,14),(42,'2.2',43,'Enhancing Agro-Micro, Small & Medium Enterprises','Enhancing Agro-Micro, Small & Medium Enterprises','dd','dd',1,2,'Subcomponent',NULL,NULL,'0700',1,0,1,0,0,14,14),(43,'2',NULL,'Sustainable Agribusiness Partnerships	','COMPONENT 2: Sustainable Agribusiness Partnerships	\r\n',NULL,NULL,0,0,'Component',NULL,NULL,NULL,1,0,0,0,0,14,14),(44,'2.1',43,'Strategic Linkages of Graduating Subsistence Farmers to Markets','Sub-Component 2.1 Strategic Linkages of Graduating Subsistence Farmers to Markets',NULL,NULL,1,0,'Subcomponent',NULL,NULL,'0900',1,0,0,0,0,14,14);
/*!40000 ALTER TABLE `awpb_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awpb_consolidated`
--

DROP TABLE IF EXISTS `awpb_consolidated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awpb_consolidated` (
  `id` int NOT NULL,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awpb_consolidated`
--

LOCK TABLES `awpb_consolidated` WRITE;
/*!40000 ALTER TABLE `awpb_consolidated` DISABLE KEYS */;
/*!40000 ALTER TABLE `awpb_consolidated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awpb_expense_category`
--

DROP TABLE IF EXISTS `awpb_expense_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awpb_expense_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awpb_expense_category`
--

LOCK TABLES `awpb_expense_category` WRITE;
/*!40000 ALTER TABLE `awpb_expense_category` DISABLE KEYS */;
INSERT INTO `awpb_expense_category` VALUES (1,'e1',1,'exp one',1,1,1,1),(2,'II',1,'Equipment and Material',0,0,14,14),(3,'I',1,'Consultancy',0,0,14,14),(8,'IV',1,'Labour',0,0,NULL,11);
/*!40000 ALTER TABLE `awpb_expense_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awpb_funder`
--

DROP TABLE IF EXISTS `awpb_funder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awpb_funder` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awpb_funder`
--

LOCK TABLES `awpb_funder` WRITE;
/*!40000 ALTER TABLE `awpb_funder` DISABLE KEYS */;
INSERT INTO `awpb_funder` VALUES (1,'F1','funder one','desc',1,1,1,1,1),(2,'2','GRZ','GRZ',1,1612810868,1612810868,14,14),(3,'1','IFAD','IFAD',1,1612809613,1612809613,14,14);
/*!40000 ALTER TABLE `awpb_funder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awpb_funding_type`
--

DROP TABLE IF EXISTS `awpb_funding_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awpb_funding_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `funding_type_code` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `funding_type_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `funding_type_code` (`funding_type_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awpb_funding_type`
--

LOCK TABLES `awpb_funding_type` WRITE;
/*!40000 ALTER TABLE `awpb_funding_type` DISABLE KEYS */;
INSERT INTO `awpb_funding_type` VALUES (1,'f1','Funder one',1,1,1,1);
/*!40000 ALTER TABLE `awpb_funding_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awpb_indicator`
--

DROP TABLE IF EXISTS `awpb_indicator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awpb_indicator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `activity_id` int DEFAULT NULL,
  `component_id` int NOT NULL,
  `outcome_id` int NOT NULL,
  `output_id` int DEFAULT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_of_measure_id` int DEFAULT NULL,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awpb_indicator`
--

LOCK TABLES `awpb_indicator` WRITE;
/*!40000 ALTER TABLE `awpb_indicator` DISABLE KEYS */;
INSERT INTO `awpb_indicator` VALUES (14,101,44,0,2,'Number of Category A farmers mobilised','Number of Category A farmers mobilised\r\n',1,0,0,NULL,NULL),(15,101,44,0,2,'Number of Category A female farmers Mobi','Number of Category A female farmers Mobilised\r\n',1,0,0,NULL,NULL),(16,101,44,0,2,'Number of Category A Youth Farmers Mobil','Number of Category A Youth Farmers Mobilised\r\n',1,0,0,NULL,NULL),(17,101,44,0,2,'Number of Category A Female Headed House','Number of Category A Female Headed Households Mobilised\r\n',1,0,0,NULL,NULL);
/*!40000 ALTER TABLE `awpb_indicator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awpb_input`
--

DROP TABLE IF EXISTS `awpb_input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awpb_input` (
  `id` int NOT NULL AUTO_INCREMENT,
  `activity_id` int NOT NULL,
  `awpb_template_id` int NOT NULL,
  `indicator_id` int NOT NULL,
  `budget_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `unit_cost` double NOT NULL,
  `mo_1` double DEFAULT NULL,
  `mo_2` double DEFAULT NULL,
  `mo_3` double DEFAULT NULL,
  `mo_4` double DEFAULT NULL,
  `mo_5` double DEFAULT NULL,
  `mo_6` double DEFAULT NULL,
  `mo_7` double DEFAULT NULL,
  `mo_8` double DEFAULT NULL,
  `mo_9` double DEFAULT NULL,
  `mo_10` double DEFAULT NULL,
  `mo_11` double DEFAULT NULL,
  `mo_12` double DEFAULT NULL,
  `quarter_one_quantity` double DEFAULT NULL,
  `quarter_two_quantity` double DEFAULT NULL,
  `quarter_three_quantity` double DEFAULT NULL,
  `quarter_four_quantity` double DEFAULT NULL,
  `total_quantity` double DEFAULT NULL,
  `mo_1_amount` double DEFAULT NULL,
  `mo_2_amount` double DEFAULT NULL,
  `mo_3_amount` double DEFAULT NULL,
  `mo_4_amount` double DEFAULT NULL,
  `mo_5_amount` double DEFAULT NULL,
  `mo_6_amount` double DEFAULT NULL,
  `mo_7_amount` double DEFAULT NULL,
  `mo_8_amount` double DEFAULT NULL,
  `mo_9_amount` double DEFAULT NULL,
  `mo_10_amount` double DEFAULT NULL,
  `mo_11_amount` double DEFAULT NULL,
  `mo_12_amount` double DEFAULT NULL,
  `quarter_one_amount` double DEFAULT NULL,
  `quarter_two_amount` double DEFAULT NULL,
  `quarter_three_amount` double DEFAULT NULL,
  `quarter_four_amount` double DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `mo_1_actual` double DEFAULT NULL,
  `mo_2_actual` double DEFAULT NULL,
  `mo_3_actual` double DEFAULT NULL,
  `mo_4_actual` double DEFAULT NULL,
  `mo_5_actual` double DEFAULT NULL,
  `mo_6_actual` double DEFAULT NULL,
  `mo_7_actual` double DEFAULT NULL,
  `mo_8_actual` double DEFAULT NULL,
  `mo_9_actual` double DEFAULT NULL,
  `mo_10_actual` double DEFAULT NULL,
  `mo_11_actual` double DEFAULT NULL,
  `mo_12_actual` double DEFAULT NULL,
  `status` int NOT NULL,
  `camp_id` int DEFAULT NULL,
  `district_id` int unsigned DEFAULT NULL,
  `province_id` int unsigned DEFAULT NULL,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_id` (`activity_id`),
  KEY `district_id` (`district_id`),
  KEY `province_id` (`province_id`),
  KEY `awpb_template_id` (`awpb_template_id`),
  KEY `indicator_id` (`indicator_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `awpb_input_ibfk_1` (`budget_id`),
  CONSTRAINT `awpb_input_ibfk_1` FOREIGN KEY (`budget_id`) REFERENCES `awpb_budget` (`id`),
  CONSTRAINT `awpb_input_ibfk_2` FOREIGN KEY (`awpb_template_id`) REFERENCES `awpb_template` (`id`),
  CONSTRAINT `awpb_input_ibfk_3` FOREIGN KEY (`activity_id`) REFERENCES `awpb_activity` (`id`),
  CONSTRAINT `awpb_input_ibfk_4` FOREIGN KEY (`indicator_id`) REFERENCES `awpb_indicator` (`id`),
  CONSTRAINT `awpb_input_ibfk_5` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`),
  CONSTRAINT `awpb_input_ibfk_6` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`),
  CONSTRAINT `awpb_input_ibfk_7` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `awpb_input_ibfk_8` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awpb_input`
--

LOCK TABLES `awpb_input` WRITE;
/*!40000 ALTER TABLE `awpb_input` DISABLE KEYS */;
/*!40000 ALTER TABLE `awpb_input` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awpb_outcome`
--

DROP TABLE IF EXISTS `awpb_outcome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awpb_outcome` (
  `id` int NOT NULL AUTO_INCREMENT,
  `outcome_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `component_id` int DEFAULT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `outcome_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `outcome_code` (`outcome_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awpb_outcome`
--

LOCK TABLES `awpb_outcome` WRITE;
/*!40000 ALTER TABLE `awpb_outcome` DISABLE KEYS */;
INSERT INTO `awpb_outcome` VALUES (1,'',42,'Policy and institutional environment enh','Policy and institutional environment enhanced for agribusiness development',14,14,14,14);
/*!40000 ALTER TABLE `awpb_outcome` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awpb_output`
--

DROP TABLE IF EXISTS `awpb_output`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awpb_output` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `component_id` int NOT NULL,
  `outcome_id` int DEFAULT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awpb_output`
--

LOCK TABLES `awpb_output` WRITE;
/*!40000 ALTER TABLE `awpb_output` DISABLE KEYS */;
INSERT INTO `awpb_output` VALUES (1,'',42,1,'Strategic framework that supports agribu','Strategic framework that supports agribusiness developed and implementated',14,14,14,14),(2,'2.1',44,NULL,'Output 2.1','Output 2.1 Capacity of  smallholder farmers to produce a surplus for the market increased',0,0,NULL,NULL);
/*!40000 ALTER TABLE `awpb_output` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awpb_template`
--

DROP TABLE IF EXISTS `awpb_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awpb_template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fiscal_year` int NOT NULL,
  `budget_theme` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `guideline_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL COMMENT '0 Closed, 1 open, 2 Blockedsed',
  `status_activities` int DEFAULT NULL,
  `status_users` int DEFAULT NULL,
  `preparation_deadline_first_draft` date DEFAULT NULL,
  `submission_deadline` date DEFAULT NULL,
  `consolidation_deadline` date DEFAULT NULL,
  `review_deadline` date DEFAULT NULL,
  `preparation_deadline_second_draft` date DEFAULT NULL,
  `review_deadline_pco` date DEFAULT NULL,
  `finalisation_deadline_pco` date DEFAULT NULL,
  `submission_deadline_moa_mfl` date DEFAULT NULL,
  `approval_deadline_jpsc` date DEFAULT NULL,
  `incorpation_deadline_pco_moa_mfl` date DEFAULT NULL,
  `submission_deadline_ifad` date DEFAULT NULL,
  `comment_deadline_ifad` date DEFAULT NULL,
  `distribution_deadline` date DEFAULT NULL,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fiscal_year` (`fiscal_year`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awpb_template`
--

LOCK TABLES `awpb_template` WRITE;
/*!40000 ALTER TABLE `awpb_template` DISABLE KEYS */;
INSERT INTO `awpb_template` VALUES (1,2001,'nnnn 56666','Hi Hi Googogo',NULL,3,NULL,NULL,'2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20',1609964565,1621939468,14,14),(2,2000,'Tetstst','Testst7778',NULL,3,NULL,NULL,'2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20',1609964703,1621939469,14,14),(3,2004,'2002','2002','',3,NULL,NULL,'2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20',1609965221,1621939469,14,14),(4,2003,'bb','bb',NULL,3,NULL,NULL,'2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20',1609968491,1621939469,14,14),(5,2005,'bb','bb',NULL,3,NULL,NULL,'2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20',1609968527,1621939469,14,14),(6,2006,'ffff','fff',NULL,3,NULL,NULL,'2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20',1609968637,1621939469,14,14),(7,1980,'ttt','gg',NULL,3,NULL,NULL,'2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20',1610000838,1621939469,14,14),(8,1981,'ttt','gg',NULL,3,NULL,NULL,'2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20',1610000993,1621939469,14,14),(9,1983,'ttt','gg',NULL,3,NULL,NULL,'2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20',1610001015,1621939469,14,14),(10,1982,'ttt','gg',NULL,3,NULL,NULL,'2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20',1610001129,1621939469,14,14),(11,1984,'ttt','gg',NULL,3,NULL,NULL,'2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20',1610001215,1621939469,14,14),(12,1985,'ttt','gg',NULL,3,NULL,NULL,'2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20',1610001405,1621939469,14,14),(13,1986,'ttt','gg',NULL,3,NULL,NULL,'2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20',1610001587,1621939469,14,14),(14,1987,'ttt','gg',NULL,3,NULL,NULL,'2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20',1610001883,1621939469,14,14),(15,1988,'ttt','gg',NULL,3,NULL,NULL,'2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20',1610001985,1621939469,14,14),(16,1989,'ttt','gg',NULL,3,NULL,NULL,'2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20',1610002209,1621939469,14,14),(17,1910,'ttt','gg',NULL,3,NULL,NULL,'2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20',1610002266,1621939469,14,14),(18,1911,'ttt','gg',NULL,3,NULL,NULL,'2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20',1610002642,1621939469,14,14),(19,1912,'2','2',NULL,3,NULL,NULL,'2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20',1610007825,1621939469,14,14),(21,1915,'2','2',NULL,3,NULL,NULL,'2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20',1610008326,1621939469,14,14),(22,1916,'2','2',NULL,3,NULL,NULL,'2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20',1610008412,1621939469,14,14),(23,1917,'2','2',NULL,3,NULL,NULL,'2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20',1610008552,1621939469,14,14),(24,1918,'2','2',NULL,3,NULL,NULL,'2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20',1610008748,1621939469,14,14),(25,1803,'1803666','180366','1803-AWPB-Guidelines.pdf',3,NULL,NULL,'2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20',1610039971,1621939469,14,14),(26,1804,'25666','2566','',3,NULL,NULL,'2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20',1610040425,1621939470,14,14),(27,1805,'lllll','llllll','1805-AWPB-Guidelines.pdf',3,NULL,NULL,'2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20',1610040775,1621939470,14,14),(28,1856,'nsnsn','nnnnn','1856-AWPB-Guidelines.pdf',3,NULL,NULL,'2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20',1610968426,1621939470,14,14),(29,2020,'Farming as a Business','Business is the way to go','2020-AWPB-Guidelines.pdf',3,NULL,NULL,'2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20',1610986059,1621939470,14,14),(31,2021,'2021','2021','2021-AWPB-Guidelines.pdf',2,NULL,NULL,'2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20',1611785873,1611786373,10,10),(32,2022,'2022','2022','2022-AWPB-Guidelines.pdf',3,NULL,NULL,'2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20','2021-07-20',1611786373,1621939470,10,14),(33,2019,'Test','Test','2019-AWPB-Guidelines.pdf',1,1,1,'2021-05-25','2021-06-30','2021-07-30','2021-08-30','2021-09-15','2021-09-30','2021-10-14','2021-11-01','2021-11-08','2021-11-15','2021-11-29','2021-10-21','2021-10-28',1621939470,1622573307,14,14);
/*!40000 ALTER TABLE `awpb_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awpb_template_activity`
--

DROP TABLE IF EXISTS `awpb_template_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awpb_template_activity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `activity_id` int NOT NULL,
  `component_id` int DEFAULT NULL,
  `outcome_id` int DEFAULT NULL,
  `output_id` int DEFAULT NULL,
  `awpb_template_id` int NOT NULL,
  `funder_id` int DEFAULT NULL,
  `expense_category_id` int DEFAULT NULL,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `awpb_template_id` (`awpb_template_id`),
  KEY `expense_category_id` (`expense_category_id`),
  KEY `component_id` (`component_id`),
  KEY `output_id` (`output_id`),
  KEY `outcome_id` (`outcome_id`),
  KEY `funder_id` (`funder_id`),
  KEY `activity_code` (`activity_id`),
  CONSTRAINT `awpb_template_activity_ibfk_1` FOREIGN KEY (`activity_id`) REFERENCES `awpb_activity` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `awpb_template_activity_ibfk_2` FOREIGN KEY (`awpb_template_id`) REFERENCES `awpb_template` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `awpb_template_activity_ibfk_3` FOREIGN KEY (`component_id`) REFERENCES `awpb_component` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awpb_template_activity`
--

LOCK TABLES `awpb_template_activity` WRITE;
/*!40000 ALTER TABLE `awpb_template_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `awpb_template_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awpb_unit_of_measure`
--

DROP TABLE IF EXISTS `awpb_unit_of_measure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awpb_unit_of_measure` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `created_by` int NOT NULL,
  `created_at` int NOT NULL,
  `updated_by` int NOT NULL,
  `updated_at` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awpb_unit_of_measure`
--

LOCK TABLES `awpb_unit_of_measure` WRITE;
/*!40000 ALTER TABLE `awpb_unit_of_measure` DISABLE KEYS */;
INSERT INTO `awpb_unit_of_measure` VALUES (1,'KG',1,1,1,1,1);
/*!40000 ALTER TABLE `awpb_unit_of_measure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camp`
--

DROP TABLE IF EXISTS `camp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camp` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `district_id` int unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `latitude` varchar(30) DEFAULT NULL,
  `longitude` varchar(30) DEFAULT NULL,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_camp_1_idx` (`district_id`),
  CONSTRAINT `fk_camp_1` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camp`
--

LOCK TABLES `camp` WRITE;
/*!40000 ALTER TABLE `camp` DISABLE KEYS */;
INSERT INTO `camp` VALUES (5,2,'Camp two','','-14.624586674161693','28.13769210937501',1607263313,1625074357,1,1),(6,2,'Camp three','','-14.663616632630394','28.091343537597666',1607263313,1625075081,1,1),(7,2,'Camp four','','-14.47571105850427','28.41235031250001',1607263313,1625090266,1,1),(8,42,'Chila one group','','-15.569439292403246','28.28154434326173',1625092685,1625092685,1,1);
/*!40000 ALTER TABLE `camp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commodity_category`
--

DROP TABLE IF EXISTS `commodity_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commodity_category` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodity_category`
--

LOCK TABLES `commodity_category` WRITE;
/*!40000 ALTER TABLE `commodity_category` DISABLE KEYS */;
INSERT INTO `commodity_category` VALUES (2,'Farming inputs','The resources that are used in farm production, such as chemicals, equipment, feed, seed, and energy ',1607417556,1607419333,1,1),(3,'Farm outputs','Farm outputs such as maize, groundnuts\r\n',1607417638,1607447942,1,1),(4,'Farm output by-products',NULL,1607447921,1607585616,1,1);
/*!40000 ALTER TABLE `commodity_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commodity_price_collection`
--

DROP TABLE IF EXISTS `commodity_price_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commodity_price_collection` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `district` int unsigned NOT NULL,
  `market_id` int unsigned NOT NULL,
  `commodity_type_id` int unsigned NOT NULL,
  `price_level_id` int unsigned NOT NULL,
  `unit_of_measure` varchar(45) DEFAULT NULL,
  `price` double(10,2) NOT NULL,
  `description` text,
  `month` varchar(3) NOT NULL,
  `year` varchar(11) NOT NULL,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_commodity_price_collection_2_idx` (`price_level_id`),
  KEY `fk_commodity_price_collection_4_idx` (`commodity_type_id`),
  KEY `fk_commodity_price_collection_3_idx` (`market_id`),
  KEY `fk_commodity_price_collection_1_idx` (`district`),
  CONSTRAINT `fk_commodity_price_collection_1` FOREIGN KEY (`district`) REFERENCES `district` (`id`),
  CONSTRAINT `fk_commodity_price_collection_2` FOREIGN KEY (`price_level_id`) REFERENCES `commodity_price_level` (`id`),
  CONSTRAINT `fk_commodity_price_collection_3` FOREIGN KEY (`market_id`) REFERENCES `market` (`id`),
  CONSTRAINT `fk_commodity_price_collection_4` FOREIGN KEY (`commodity_type_id`) REFERENCES `commodity_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodity_price_collection`
--

LOCK TABLES `commodity_price_collection` WRITE;
/*!40000 ALTER TABLE `commodity_price_collection` DISABLE KEYS */;
INSERT INTO `commodity_price_collection` VALUES (2,1,3,4,3,'2Kg',15.00,NULL,'12','2020',1607626330,1607626330,1,1),(3,1,3,6,3,'10Kg',69.00,NULL,'12','2020',1607627366,1607627366,1,1),(4,1,3,5,3,'25Kg',120.00,NULL,'12','2020',1607627366,1607627366,1,1),(5,1,3,1,3,'2kg',20.00,NULL,'12','2020',1607627366,1607627366,1,1),(6,1,3,2,3,'5kg',25.00,NULL,'12','2020',1607627366,1607627366,1,1),(7,1,3,6,3,'2KG',15.00,NULL,'1','2021',1607627366,1607627366,1,1),(8,1,3,1,3,'2KG',15.00,NULL,'1','2021',1607627366,1607627366,1,1),(9,1,3,3,3,'2KG',15.00,NULL,'1','2021',1607627366,1607627366,1,1),(10,1,3,4,3,'5KG',25.00,NULL,'1','2021',1607627366,1607627366,1,1),(11,1,3,5,3,'10KG',50.00,NULL,'1','2021',1607627366,1607627366,1,1),(12,1,3,3,3,'10KG',30.00,NULL,'1','2021',1607627366,1607627366,1,1),(13,2,4,2,3,'2Kg',2.00,NULL,'1','2021',1611076848,1611076848,10,10),(14,2,4,2,3,'15KG',20.00,NULL,'2','2021',1614013880,1614013880,10,10),(15,2,4,11,3,'10kg',20.00,NULL,'10','2021',1614013941,1614013941,10,10),(16,2,4,11,3,'10KG',20.00,NULL,'2','2021',1614071294,1614071294,10,10),(17,2,4,5,3,'25Kg',100.00,NULL,'2','2021',1614071294,1614071294,10,10);
/*!40000 ALTER TABLE `commodity_price_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commodity_price_level`
--

DROP TABLE IF EXISTS `commodity_price_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commodity_price_level` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `level` varchar(45) NOT NULL,
  `description` text,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodity_price_level`
--

LOCK TABLES `commodity_price_level` WRITE;
/*!40000 ALTER TABLE `commodity_price_level` DISABLE KEYS */;
INSERT INTO `commodity_price_level` VALUES (1,'Farm gate','Farm gate',1568287523,1568287523,NULL,1),(2,'Wholesale',NULL,1568287523,1568287523,NULL,NULL),(3,'Retail',NULL,1568287523,1568287523,NULL,NULL);
/*!40000 ALTER TABLE `commodity_price_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commodity_type`
--

DROP TABLE IF EXISTS `commodity_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commodity_type` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_commodity_type_1_idx` (`category_id`),
  CONSTRAINT `fk_commodity_type_1` FOREIGN KEY (`category_id`) REFERENCES `commodity_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodity_type`
--

LOCK TABLES `commodity_type` WRITE;
/*!40000 ALTER TABLE `commodity_type` DISABLE KEYS */;
INSERT INTO `commodity_type` VALUES (1,3,'Maize',1607446739,1607447798,1,1),(2,3,'Soya beans',1607447814,1607447814,1,1),(3,3,'Groundnuts',1607447827,1607447827,1,1),(4,3,'Rice',1607447871,1607447871,1,1),(5,4,'Mealie meal',1607447890,1607447952,1,1),(6,4,'Roller meal',1607447902,1607447956,1,1),(7,2,'Maize Seed',1607447971,1607447971,1,1),(8,2,'Groundnut seed',1607447992,1607447992,1,1),(9,2,'Rice seed',1607448004,1607448004,1,1),(10,2,'D-Compound',1607448021,1607448021,1,1),(11,2,'Urea',1607448041,1607448041,1,1);
/*!40000 ALTER TABLE `commodity_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `district` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `province_id` int unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `lat` varchar(20) DEFAULT NULL,
  `long` varchar(20) DEFAULT NULL,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_district_province_idx` (`province_id`),
  CONSTRAINT `fk_district_province` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES (1,1,'Chisamba','-14.982045','28.377941',0,1607257385,NULL,1),(2,1,'Chibombo','-14.659314','28.080540',0,0,NULL,NULL),(3,1,'Chitambo','-12.226766','30.050454',0,0,NULL,NULL),(4,1,'Itezhi-Tezhi','-15.600785','25.903189',0,0,NULL,NULL),(5,1,'Mkushi','-13.618959','29.395959',0,0,NULL,NULL),(6,1,'Mumbwa','-14.983506','27.062202',0,0,NULL,NULL),(7,1,'Kabwe','-14.435119','28.449286',0,0,NULL,NULL),(8,1,'Kapiri Mposhi','-13.965676','28.679295',0,0,NULL,NULL),(9,1,'Luano','-14.115876','30.165637',0,0,NULL,NULL),(10,1,'Serenje','-13.230460','30.232615',0,0,NULL,NULL),(11,1,'Ngabwe','-14.083993','27.254295',0,0,NULL,NULL),(12,2,'Lufwanyama','-12.950965','27.410405',0,1607251969,NULL,NULL),(13,2,'Mufulira','-12.547810','28.239540',0,0,NULL,NULL),(14,2,'Kitwe','-12.829186','28.221206',0,0,NULL,NULL),(15,2,'Chililabombwe','-12.369279','27.837037',0,0,NULL,NULL),(16,2,'Kalulushi','-12.841575','28.093685',0,0,NULL,NULL),(17,2,'Ndola','-12.985475','28.641245',0,0,NULL,NULL),(18,2,'Luanshya','-13.143666','28.407905',0,0,NULL,NULL),(19,2,'Mpongwe','-13.512809','28.156596',0,0,NULL,NULL),(20,2,'Chingola','-12.538506','27.863672',0,0,NULL,NULL),(21,2,'Masaiti','-13.260320','28.405731',0,1607362090,NULL,1),(22,3,'Katete','-14.060067','32.044859',0,0,NULL,NULL),(23,3,'Chipata','-13.641016','32.644361',0,0,NULL,NULL),(24,3,'Petauke','-14.247244','31.328673',0,0,NULL,NULL),(25,3,'Lundazi','-12.289583','33.178067',0,0,NULL,NULL),(26,3,'Chadiza','-14.064839','32.436619',0,0,NULL,NULL),(27,3,'Mambwe','-13.212054','31.816900',0,0,NULL,NULL),(28,3,'Nyimba','-14.560282','30.820266',0,0,NULL,NULL),(29,3,'Vubwi','-14.035375','32.869092',0,0,NULL,NULL),(30,3,'Sinda','-14.214009','31.760187',0,0,NULL,NULL),(31,4,'Chiengi','-8.663500','29.160315',0,0,NULL,NULL),(32,4,'Nchelenge','-9.351089','28.739773',0,0,NULL,NULL),(33,4,'Kawambwa','-9.795545','29.074804',0,0,NULL,NULL),(34,4,'Mwense','-10.388397','28.701568',0,0,NULL,NULL),(35,4,'Mansa','-11.187779','28.883424',0,0,NULL,NULL),(36,4,'Samfya','-11.367624','29.554017',0,0,NULL,NULL),(37,4,'Milenge','-11.912971','29.189114',0,0,NULL,NULL),(38,4,'Chembe','-11.952502','28.744292',0,0,NULL,NULL),(39,4,'Lunga','-11.575272','30.102494',0,0,NULL,NULL),(40,4,'Chipili','-10.737772','29.091339',0,0,NULL,NULL),(41,4,'Mwansabombwe','-9.820162','28.763924',0,0,NULL,NULL),(42,5,'Chilanga','-15.567154','28.273961',0,0,NULL,NULL),(43,5,'Chirundu','-16.028711','28.850641',0,0,NULL,NULL),(44,5,'Chongwe','-15.331246','28.677833',0,0,NULL,NULL),(45,5,'Kafue','-15.761006','28.176701',0,0,NULL,NULL),(46,5,'Luangwa','-15.625206','30.402532',0,0,NULL,NULL),(47,5,'Rufunsa','-15.078131','29.634890',0,0,NULL,NULL),(48,1,'Shibuyunji','-15.424570','27.808064',0,0,NULL,NULL),(49,5,'Lusaka','-15.408867','28.333450',0,0,NULL,NULL),(50,6,'Chama','-11.214196','33.154732',0,0,NULL,NULL),(51,6,'Chinsali','-10.544049','32.064843',0,0,NULL,NULL),(52,6,'Isoka','-10.151943','32.635510',0,0,NULL,NULL),(53,6,'Mafinga','-10.239173','33.315920',0,0,NULL,NULL),(54,6,'Mpika','-11.825579','31.448707',0,0,NULL,NULL),(55,6,'Nakonde','-9.329901','32.753227',0,0,NULL,NULL),(56,6,'Shiwang\'andu','-11.230661','31.742384',0,0,NULL,NULL),(57,7,'Chilubi','-11.1534286','29.8948552',0,0,NULL,NULL),(58,7,'Kaputa','-8.4762768','29.6415851',0,0,NULL,NULL),(59,7,'Kasama','-10.2363082','31.143275',0,0,NULL,NULL),(60,7,'Luwingu','-10.6085541','29.3183597',0,0,NULL,NULL),(61,7,'Mbala','-8.8480727','31.3228791',0,0,NULL,NULL),(62,7,'Mporokoso','-9.371369','30.09005',0,0,NULL,NULL),(63,7,'Mpulungu','-8.7692783','31.0999665',0,0,NULL,NULL),(64,7,'Mungwi','-10.1783646','31.3394879',0,0,NULL,NULL),(65,7,'Nsama','-8.8943783','29.9513269',0,0,NULL,NULL),(66,8,'Chavuma','-13.0836162','22.6792037',0,0,NULL,NULL),(67,8,'Ikelenge','-11.2374247','24.2536066',0,0,NULL,NULL),(68,8,'Kabompo','-13.5951014','24.1840838',0,0,NULL,NULL),(69,8,'Kasempa','-13.8025204','25.1080866',0,0,NULL,NULL),(70,8,'Manyinga','-13.3964558','24.3100834',0,0,NULL,NULL),(71,8,'Mufumbwe','-13.6833117','24.7912452',0,0,NULL,NULL),(72,8,'Mwinilunga','-11.7384907','24.4135768',0,0,NULL,NULL),(73,8,'Zambezi','-13.5486671','23.0780261',0,0,NULL,NULL),(74,8,'Solwezi','-12.1689464','26.3574449',0,0,NULL,NULL),(75,9,'Chikankata','-16.2499789','28.1245782',0,0,NULL,NULL),(76,9,'Gwembe','-16.4968365','27.5772712',0,0,NULL,NULL),(77,9,'Kalomo','-17.0311796','26.4632748',0,0,NULL,NULL),(78,9,'Kazungula','-17.7807326','25.2633509',0,0,NULL,NULL),(79,9,'Monze','-16.2782505','27.438872',0,0,NULL,NULL),(80,9,'Namwala','-15.7537827','26.4339638',0,0,NULL,NULL),(81,9,'Pemba','-16.5224626','27.3495196',0,0,NULL,NULL),(82,9,'Siavonga','-16.5344177','28.6961882',0,0,NULL,NULL),(83,9,'Sinazongwe','-17.2282349','27.4392796',0,0,NULL,NULL),(84,9,'Zimba','-17.3155688','26.1730813',0,0,NULL,NULL),(85,9,'Livingstone','-17.8516495','25.8136647',0,0,NULL,NULL),(86,9,'Choma','-16.8065884','26.9398062',0,0,NULL,NULL),(87,9,'Mazabuka','-15.8598383','27.718548',0,0,NULL,NULL),(88,10,'Kalabo','-14.9929965','22.6765537',0,0,NULL,NULL),(89,10,'Kaoma','-14.8178214','24.7662298',0,0,NULL,NULL),(90,10,'Limulunga','-15.1308547','23.1433868',0,0,NULL,NULL),(91,10,'Luampa','-15.063068','24.4033706',0,0,NULL,NULL),(92,10,'Lukulu','-14.4081161','23.257885',0,0,NULL,NULL),(93,10,'Mitete','-14.1333121','22.8579119',0,0,NULL,NULL),(94,10,'Mulobezi','-16.7806905','25.162382',0,0,NULL,NULL),(95,10,'Mwandi','-17.5177437','24.8150758',0,0,NULL,NULL),(96,10,'Nalolo','-15.5396655','23.1134373',0,0,NULL,NULL),(97,10,'Nkeyema','-14.8509307','25.1825476',0,0,NULL,NULL),(98,10,'Senanga','-16.1161414','23.288226',0,0,NULL,NULL),(99,10,'Sesheke','-17.4747938','24.2784546',0,0,NULL,NULL),(100,10,'Shangombo','-16.3225216','22.0986338',0,0,NULL,NULL),(101,10,'Sikongo','-15.0334481','22.1591901',0,0,NULL,NULL),(102,10,'Sioma','-16.6038901','23.5006356',0,0,NULL,NULL),(103,10,'Mongu','-15.2705632','23.1280444',0,0,NULL,NULL),(104,3,'Kasenengwa','-13.316667','31.916667',0,0,NULL,NULL),(105,3,'Lumezi','-12.525488','33.046017',0,0,NULL,NULL),(106,3,'Msanzala','-14.083333','31.350000',0,0,NULL,NULL),(107,3,'Chipangali','-13.217256','32.764192',0,0,NULL,NULL),(108,3,'Chasefu','-11.921364','33.093417',0,0,NULL,NULL),(109,4,'Chifunabuli','-11.107550','29.667098',0,0,NULL,NULL),(110,6,'Chilinda','-13.0905358','24.1696381',0,0,NULL,NULL),(112,6,'Kanchibiya','-11.3756661','31.0114803',0,0,NULL,NULL),(113,6,'Lavushimanda','-12.3999787','30.8579119',0,0,NULL,NULL),(114,7,'Lunte',NULL,NULL,0,0,NULL,NULL),(115,7,'Lupososhi','-10.5340351','30.0180635',0,0,NULL,NULL),(116,7,'Senga','-9.3730437','31.2241528',0,0,NULL,NULL),(117,8,'Kalumbila','-12.2735897','25.3718008',0,0,NULL,NULL),(118,8,'Mushindamo','-11.8666667','27.1166667',0,0,NULL,NULL);
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lkm_storyofchange`
--

DROP TABLE IF EXISTS `lkm_storyofchange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lkm_storyofchange` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `title` text NOT NULL COMMENT 'Title of the story of change',
  `interviewee_names` text NOT NULL,
  `interviewer_names` text NOT NULL,
  `date_interviewed` date NOT NULL,
  `introduction` text COMMENT 'Introduction of the story: 2-3 sentences summary of the case study or success story',
  `challenge` text COMMENT 'The problem that was being addressed in the story',
  `actions` text COMMENT 'What was done, how, by and with who etc',
  `results` text COMMENT 'what changed and what difference was made',
  `conclusions` text COMMENT 'Factors that seemed to be critical to achieving the outcomes',
  `sequel` text COMMENT 'Summarising what happens next, whether this seems to be the end of the story or whether the programme will continue to track changes',
  `status` int NOT NULL DEFAULT '0',
  `paio_review_status` int DEFAULT '0',
  `paio_comments` text,
  `ikmo_review_status` int DEFAULT '0',
  `ikmo_comments` text,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `camp_id` int DEFAULT NULL,
  `district_id` int DEFAULT NULL,
  `province_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_lkm_storyofchange_1_idx` (`category_id`),
  CONSTRAINT `fk_lkm_storyofchange_1` FOREIGN KEY (`category_id`) REFERENCES `lkm_storyofchange_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lkm_storyofchange`
--

LOCK TABLES `lkm_storyofchange` WRITE;
/*!40000 ALTER TABLE `lkm_storyofchange` DISABLE KEYS */;
INSERT INTO `lkm_storyofchange` VALUES (2,3,'Test','Upendo Chulu','Francis Chulu','2021-01-11','<p><strong>My story introduction<br></strong></p><p>Yes this is my introduction of this story</p>','<p>The challenges</p>','<p>Story Actions</p>','<p><strong>The results</strong></p>','<p>The conclusions</p>','<p><strong>The sequel</strong></p>',0,0,NULL,1,'Story accepted',1610388925,1614019554,1,1,NULL,NULL,NULL),(3,4,'From subsistence to commercial farming-Case of Mr. Chulu','Francis Chulu','Edson Chulu','2021-01-12','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin malesuada lacus ullamcorper dui molestie, sit amet congue quam finibus. Etiam ultricies nunc non magna feugiat commodo. Etiam odio magna, mollis auctor felis vitae, ullamcorper ornare ligula. Proin pellentesque tincidunt nisi, vitae ullamcorper felis aliquam id. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin id orci eu lectus blandit suscipit. Phasellus porta, ante et varius ornare, sem enim sollicitudin eros, at commodo leo est vitae lacus. Etiam ut porta sem. Proin porttitor porta nisl, id tempor risus rhoncus quis. In in quam a nibh cursus pulvinar non consequat neque. Mauris lacus elit, condimentum ac condimentum at, semper vitae lectus. Cras lacinia erat eget sapien porta consectetur.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin malesuada lacus ullamcorper dui molestie, sit amet congue quam finibus. Etiam ultricies nunc non magna feugiat commodo. Etiam odio magna, mollis auctor felis vitae, ullamcorper ornare ligula. Proin pellentesque tincidunt nisi, vitae ullamcorper felis aliquam id. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin id orci eu lectus blandit suscipit. Phasellus porta, ante et varius ornare, sem enim sollicitudin eros, at commodo leo est vitae lacus. Etiam ut porta sem. Proin porttitor porta nisl, id tempor risus rhoncus quis. In in quam a nibh cursus pulvinar non consequat neque. Mauris lacus elit, condimentum ac condimentum at, semper vitae lectus. Cras lacinia erat eget sapien porta consectetur.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin malesuada lacus ullamcorper dui molestie, sit amet congue quam finibus. Etiam ultricies nunc non magna feugiat commodo. Etiam odio magna, mollis auctor felis vitae, ullamcorper ornare ligula. Proin pellentesque tincidunt nisi, vitae ullamcorper felis aliquam id. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin id orci eu lectus blandit suscipit. Phasellus porta, ante et varius ornare, sem enim sollicitudin eros, at commodo leo est vitae lacus. Etiam ut porta sem. Proin porttitor porta nisl, id tempor risus rhoncus quis. In in quam a nibh cursus pulvinar non consequat neque. Mauris lacus elit, condimentum ac condimentum at, semper vitae lectus. Cras lacinia erat eget sapien porta consectetur.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin malesuada lacus ullamcorper dui molestie, sit amet congue quam finibus. Etiam ultricies nunc non magna feugiat commodo. Etiam odio magna, mollis auctor felis vitae, ullamcorper ornare ligula. Proin pellentesque tincidunt nisi, vitae ullamcorper felis aliquam id. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin id orci eu lectus blandit suscipit. Phasellus porta, ante et varius ornare, sem enim sollicitudin eros, at commodo leo est vitae lacus. Etiam ut porta sem. Proin porttitor porta nisl, id tempor risus rhoncus quis. In in quam a nibh cursus pulvinar non consequat neque. Mauris lacus elit, condimentum ac condimentum at, semper vitae lectus. Cras lacinia erat eget sapien porta consectetur.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin malesuada lacus ullamcorper dui molestie, sit amet congue quam finibus. Etiam ultricies nunc non magna feugiat commodo. Etiam odio magna, mollis auctor felis vitae, ullamcorper ornare ligula. Proin pellentesque tincidunt nisi, vitae ullamcorper felis aliquam id. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin id orci eu lectus blandit suscipit. Phasellus porta, ante et varius ornare, sem enim sollicitudin eros, at commodo leo est vitae lacus. Etiam ut porta sem. Proin porttitor porta nisl, id tempor risus rhoncus quis. In in quam a nibh cursus pulvinar non consequat neque. Mauris lacus elit, condimentum ac condimentum at, semper vitae lectus. Cras lacinia erat eget sapien porta consectetur.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin malesuada lacus ullamcorper dui molestie, sit amet congue quam finibus. Etiam ultricies nunc non magna feugiat commodo. Etiam odio magna, mollis auctor felis vitae, ullamcorper ornare ligula. Proin pellentesque tincidunt nisi, vitae ullamcorper felis aliquam id. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin id orci eu lectus blandit suscipit. Phasellus porta, ante et varius ornare, sem enim sollicitudin eros, at commodo leo est vitae lacus. Etiam ut porta sem. Proin porttitor porta nisl, id tempor risus rhoncus quis. In in quam a nibh cursus pulvinar non consequat neque. Mauris lacus elit, condimentum ac condimentum at, semper vitae lectus. Cras lacinia erat eget sapien porta consectetur.<span class=\"redactor-invisible-space\"></span></p>',0,0,NULL,1,'',1610472852,1614020092,10,1,NULL,2,1),(5,3,'From subsistence to commercial farming-Case of Chulu','Francis Chulu','Test names','2021-02-16','<p>Introduction</p>','<p>Challenges<br></p>','<p>The actions<br></p>','The results','Conclusion','Sequel',0,0,NULL,0,NULL,1614019196,1614019397,10,10,NULL,2,1),(6,4,'From subsistence to commercial farming-Case of Mr Chulu Francis','Francis Chulu','Edson Chulu','2021-02-09','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',1,0,NULL,1,'',1614070456,1624898204,10,1,NULL,2,1),(7,3,'From subsistence to commercial farming test','Upendo Chulu','Francis Chulu','2021-03-10','<p>test</p>','<p>test</p>','<p>action</p>','<p>results</p>','<p>test<br></p>','<p>sequel</p>',1,0,NULL,1,'',1618996486,1618996726,10,1,NULL,2,1),(8,3,'Farming story','Farmer names','My names','2021-05-29','<p>Test introduction</p>','<p>Challenge one</p>','<p>Actions</p>','<p>Result</p>','<p>Conclusions</p>','<p>Next steps</p><p><br></p>',1,0,NULL,1,'',1622279337,1622279541,10,1,NULL,2,1);
/*!40000 ALTER TABLE `lkm_storyofchange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lkm_storyofchange_article`
--

DROP TABLE IF EXISTS `lkm_storyofchange_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lkm_storyofchange_article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `story_id` int DEFAULT NULL,
  `article_type` varchar(255) DEFAULT NULL,
  `description` text,
  `file` varchar(255) NOT NULL,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `file_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lkm_storyofchange_article`
--

LOCK TABLES `lkm_storyofchange_article` WRITE;
/*!40000 ALTER TABLE `lkm_storyofchange_article` DISABLE KEYS */;
INSERT INTO `lkm_storyofchange_article` VALUES (5,3,NULL,'Article description','DWpPgMuaYfz35QYbjzXdl86Rz03k2Avk.pdf',1610993207,1610993525,1,1,'my sample.pdf'),(6,2,NULL,'Description','JXqdPvl27LGf0T51dn54_yOxRqF4deXk.pdf',1614019624,1614019624,1,1,'my sample.pdf'),(7,6,NULL,'','_KDjaAkOc32clJN1sKBeKHCnTRUhjzIi.pdf',1614070974,1614070974,1,1,'my sample.pdf'),(8,7,NULL,'','mvxMFs5PxGYVPLu9AVAlY6xU9qBXzqMW.pdf',1618996769,1618996769,1,1,'my sample.pdf'),(9,8,NULL,'','DJxF6Pzd8BHAT3R3RsIpmTjanHKow9jj.pdf',1622279606,1622279606,1,1,'my sample.pdf');
/*!40000 ALTER TABLE `lkm_storyofchange_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lkm_storyofchange_category`
--

DROP TABLE IF EXISTS `lkm_storyofchange_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lkm_storyofchange_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL COMMENT 'Story category name',
  `description` text COMMENT 'Story category description',
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lkm_storyofchange_category`
--

LOCK TABLES `lkm_storyofchange_category` WRITE;
/*!40000 ALTER TABLE `lkm_storyofchange_category` DISABLE KEYS */;
INSERT INTO `lkm_storyofchange_category` VALUES (3,'Livestock farming','',1610361550,1610378652,1,1),(4,'Subsistence farming','Subsistence farming',1610361568,1610361592,1,1);
/*!40000 ALTER TABLE `lkm_storyofchange_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lkm_storyofchange_interview_guide_template_questions`
--

DROP TABLE IF EXISTS `lkm_storyofchange_interview_guide_template_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lkm_storyofchange_interview_guide_template_questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `section` varchar(45) NOT NULL,
  `number` varchar(4) NOT NULL,
  `question` text NOT NULL,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lkm_storyofchange_interview_guide_template_questions`
--

LOCK TABLES `lkm_storyofchange_interview_guide_template_questions` WRITE;
/*!40000 ALTER TABLE `lkm_storyofchange_interview_guide_template_questions` DISABLE KEYS */;
INSERT INTO `lkm_storyofchange_interview_guide_template_questions` VALUES (1,'Introduction','1','Please introduce yourself and tell me a bit about yourself?',1609956950,1609956950,1,1),(2,'The Problem','2','What Challenges were you experiencing before the E-SAPP and why?',1609958624,1609958624,1,1),(3,'The Problem','3','Did you do anything to solve the problem before E-SAPP? If yes, what did you do?',1609958658,1609958658,1,1),(4,'The Action','4','What interventions did E-SAPP put in place to resolve the problem?  <b>Probe: Detail them according to the different steps taken</b>.',1609958714,1610358307,1,1),(5,'The Action','5','Did the interventions by E-SAPP resolve the problem? Give a reason for your answer.',1609958980,1609958980,1,1),(6,'The Action','6','In your opinion, do you think this problem was going to be addressed if it was not for the intervention from E-SAPP? Give a reason?',1609958996,1609958996,1,1),(7,'The Action','7','What are the key areas of change that you noticed as a result of the intervention? Give examples. ',1609959016,1609959016,1,1),(8,'The Action','8','What are some of the lessons that you have learnt from the intervention?',1609959038,1609959038,1,1),(9,'Recommendations','9',' In terms of how the E-SAPP could improve its intervention delivery, do you have any recommendations/ suggestions? What do you think needs to be done?',1609959055,1609959055,1,1),(10,'Introduction','10','Test question another',1614019009,1614070301,1,1),(11,'Recommendations','11','Another recommendation',1614070268,1614070268,1,1);
/*!40000 ALTER TABLE `lkm_storyofchange_interview_guide_template_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lkm_storyofchange_media`
--

DROP TABLE IF EXISTS `lkm_storyofchange_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lkm_storyofchange_media` (
  `id` int NOT NULL AUTO_INCREMENT,
  `story_id` int NOT NULL,
  `media_type` text NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file` varchar(255) NOT NULL,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_lkm_storyofchange_media_1_idx` (`story_id`),
  CONSTRAINT `fk_lkm_storyofchange_media_1` FOREIGN KEY (`story_id`) REFERENCES `lkm_storyofchange` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lkm_storyofchange_media`
--

LOCK TABLES `lkm_storyofchange_media` WRITE;
/*!40000 ALTER TABLE `lkm_storyofchange_media` DISABLE KEYS */;
INSERT INTO `lkm_storyofchange_media` VALUES (26,3,'Picture','index.png','dmG_gpT6kkkEblh3ReA_Ar4jHtSAjWzM.png',1610984242,1610984357,10,10),(27,3,'Audio','sample audio.mp3','zLCUZmBHpAx05bs5eV6ktmSDNq-XPZnG.mp3',1610984390,1610984427,10,10),(28,3,'Video','sample video.mp4','gMBISWTb_mKuJStmt2MKqT8BPblM_qpl.mp4',1610984457,1610984457,10,10),(30,3,'Picture','coa.png','Joxf6pf6YuhmsiTakdyzQBkBXrmXq8tw.png',1611056653,1611056653,10,10),(32,6,'Video','sample video.mp4','MwlYJ1CCJxJWq6CSK8aGnA0us31uKacY.mp4',1614936357,1614936357,10,10),(33,6,'Audio','sample audio.mp3','L9ZJK9i-cH2l85NfrOs4CtuF-FUvhzAz.mp3',1614936417,1614936417,10,10),(38,6,'Picture','profile.png','JsN6az9MI360kbJ_jr-clyVt1rycpzU3wuicQrqwga9Aq.png',1614938053,1614938053,10,10),(41,6,'Picture','coa.png','zMajjrs0uQzjIkVj08C3Yd9ZMADZfXsJYB7Lte1dMa-bu.png',1615309307,1615309307,10,10);
/*!40000 ALTER TABLE `lkm_storyofchange_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market`
--

DROP TABLE IF EXISTS `market`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `market` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `district_id` int unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_market_1_idx` (`district_id`),
  CONSTRAINT `fk_market_1` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market`
--

LOCK TABLES `market` WRITE;
/*!40000 ALTER TABLE `market` DISABLE KEYS */;
INSERT INTO `market` VALUES (1,14,'Chisokone',NULL,1607267413,1607362158,1,1),(2,49,'Soweto',NULL,1607267496,1607362171,1,1),(3,1,'Chisamba test',NULL,1607623358,1607623358,1,1),(4,2,'Test market',NULL,1611076081,1611076081,1,1);
/*!40000 ALTER TABLE `market` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_back_to_office_annexes`
--

DROP TABLE IF EXISTS `me_back_to_office_annexes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `me_back_to_office_annexes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `btor_id` int NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `type` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_me_back_to_office_annexes_1_idx` (`btor_id`),
  CONSTRAINT `fk_me_back_to_office_annexes_1` FOREIGN KEY (`btor_id`) REFERENCES `me_back_to_office_report` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_back_to_office_annexes`
--

LOCK TABLES `me_back_to_office_annexes` WRITE;
/*!40000 ALTER TABLE `me_back_to_office_annexes` DISABLE KEYS */;
INSERT INTO `me_back_to_office_annexes` VALUES (6,1,'V9XfYkKs46FLVtZ2hHdRmobydYhTtjp2oYKO2FbJiptux.mp4','sample video.mp4','Video'),(9,1,'ry2Vh1FfV5sEHq7-0ik4kmHRztYzTUk_0ETkvNKxmXX_L.jpg','user1.jpg','Image'),(10,1,'NJYELhVsvMtZpbfQ6vYp1oduYHbjgyl-r1SmjUKeIi2cW.jpg','user1.jpg','Image');
/*!40000 ALTER TABLE `me_back_to_office_annexes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_back_to_office_report`
--

DROP TABLE IF EXISTS `me_back_to_office_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `me_back_to_office_report` (
  `id` int NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `name_of_officer` varchar(45) NOT NULL,
  `team_members` text,
  `key_partners` text COMMENT 'Key partners in each location/site visited',
  `purpose_of_assignment` text NOT NULL,
  `summary_of_assignment_outcomes` text NOT NULL,
  `key_findings` text NOT NULL,
  `key_recommendations` text NOT NULL COMMENT 'Key Recommendations/Actions to be taken, by whom',
  `copy_sent_to` text,
  `annexes` text,
  `status` int NOT NULL DEFAULT '0' COMMENT 'Pending submission for review=0, Reviewed and accepted=1,Submitted for review=2,Reviewed and sent back for more information=3',
  `reviewer_comments` varchar(45) DEFAULT NULL,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_back_to_office_report`
--

LOCK TABLES `me_back_to_office_report` WRITE;
/*!40000 ALTER TABLE `me_back_to_office_report` DISABLE KEYS */;
INSERT INTO `me_back_to_office_report` VALUES (1,'2021-03-10','2021-03-12','test  Test','Francis  Chulu','<p>Partners</p>','<p>Purpose</p>','<p>Summary</p>','<p>Findings</p>','<p>Recommedations</p>',NULL,'',1,'',1615321516,1625578272,10,1),(2,'2021-03-09','2021-03-12','test  Test','Chulu  Francis, Test  Test','<p>Partners</p>','<p>Lorem ipsum</p>','<p>Lorem ipsum</p>','<p>Lorem ipsum</p>','<p>Lorem ipsum</p>',NULL,'',0,'',1617129037,1617129133,10,1),(3,'2021-03-24','2021-03-27','test  Test','Francis  Chulu, test test','<p>lorem ipsum</p>','<p>lorem ipsum</p>','<p>lorem ipsum</p>','<p>lorem ipsum</p>','<p>lorem ipsum</p>',NULL,'',0,'',1617178995,1617179107,10,1);
/*!40000 ALTER TABLE `me_back_to_office_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_camp_subproject_records_awpb_objectives`
--

DROP TABLE IF EXISTS `me_camp_subproject_records_awpb_objectives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `me_camp_subproject_records_awpb_objectives` (
  `id` int NOT NULL AUTO_INCREMENT,
  `camp_id` int unsigned NOT NULL,
  `quarter` int NOT NULL,
  `key_indicators` text NOT NULL,
  `period_unit` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL,
  `year` varchar(5) NOT NULL,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_me_camp_subproject_records_awpb_objectives_1_idx` (`camp_id`),
  CONSTRAINT `fk_me_camp_subproject_records_awpb_objectives_1` FOREIGN KEY (`camp_id`) REFERENCES `camp` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_camp_subproject_records_awpb_objectives`
--

LOCK TABLES `me_camp_subproject_records_awpb_objectives` WRITE;
/*!40000 ALTER TABLE `me_camp_subproject_records_awpb_objectives` DISABLE KEYS */;
INSERT INTO `me_camp_subproject_records_awpb_objectives` VALUES (1,5,1,'Not set','Not set','0','2021',1615474709,1615489186,10,10),(2,5,2,'Not set','Not set','0','2021',1615474709,1615489186,10,10),(3,5,3,'Not set','Not set','0','2021',1615474709,1615489186,10,10),(4,5,4,'Not set','Not set','0','2021',1615474709,1615489186,10,10),(5,6,1,'Not set','Not set','0','2021',1615474709,1615487999,10,10),(6,6,2,'Not set','Not set','0','2021',1615474709,1615487999,10,10),(7,6,3,'Not set','Not set','0','2021',1615474709,1615487999,10,10),(8,6,4,'Not set','Not set','0','2021',1615474709,1615487999,10,10),(9,7,1,'- Train 10 farmers\r\n- Indicator two\r\n','12','10','2021',1615474709,1615486522,10,10),(10,7,2,'- Issue out 5 commodity sacks','20','5','2021',1615474709,1615486522,10,10),(11,7,3,'- Indicator one\r\n- Indicator two','1','1','2021',1615474709,1615486629,10,10),(12,7,4,'- Indicator one\r\n- Indicator two','3','2','2021',1615474709,1615486522,10,10);
/*!40000 ALTER TABLE `me_camp_subproject_records_awpb_objectives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_camp_subproject_records_improved_tech_facilitation`
--

DROP TABLE IF EXISTS `me_camp_subproject_records_improved_tech_facilitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `me_camp_subproject_records_improved_tech_facilitation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `camp_id` int unsigned NOT NULL,
  `output_level_indicator_id` int NOT NULL,
  `year` varchar(5) NOT NULL,
  `quarter` varchar(4) DEFAULT NULL,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_me_camp_subproject_improved_tech_facilitation_1_idx` (`output_level_indicator_id`),
  CONSTRAINT `fk_me_camp_subproject_improved_tech_facilitation_1` FOREIGN KEY (`output_level_indicator_id`) REFERENCES `me_camp_subproject_records_output_level_indicators` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_camp_subproject_records_improved_tech_facilitation`
--

LOCK TABLES `me_camp_subproject_records_improved_tech_facilitation` WRITE;
/*!40000 ALTER TABLE `me_camp_subproject_records_improved_tech_facilitation` DISABLE KEYS */;
/*!40000 ALTER TABLE `me_camp_subproject_records_improved_tech_facilitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_camp_subproject_records_monthly_planned_activities`
--

DROP TABLE IF EXISTS `me_camp_subproject_records_monthly_planned_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `me_camp_subproject_records_monthly_planned_activities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `work_effort_id` int NOT NULL,
  `activity_id` int NOT NULL,
  `faabs_id` int NOT NULL,
  `zone` varchar(45) DEFAULT NULL,
  `activity_target` varchar(255) DEFAULT NULL,
  `beneficiary_target_total` int DEFAULT '0',
  `beneficiary_target_women` varchar(45) NOT NULL DEFAULT '0',
  `beneficiary_target_youth` varchar(45) NOT NULL DEFAULT '0',
  `beneficiary_target_women_headed` varchar(45) NOT NULL DEFAULT '0',
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_me_camp_subproject_records_monthly_planned_activities_1_idx` (`faabs_id`),
  KEY `fk_me_camp_subproject_records_monthly_planned_activities_2_idx` (`work_effort_id`),
  CONSTRAINT `fk_me_camp_subproject_records_monthly_planned_activities_1` FOREIGN KEY (`faabs_id`) REFERENCES `me_faabs_groups` (`id`),
  CONSTRAINT `fk_me_camp_subproject_records_monthly_planned_activities_2` FOREIGN KEY (`work_effort_id`) REFERENCES `me_camp_subproject_records_planned_work_effort` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_camp_subproject_records_monthly_planned_activities`
--

LOCK TABLES `me_camp_subproject_records_monthly_planned_activities` WRITE;
/*!40000 ALTER TABLE `me_camp_subproject_records_monthly_planned_activities` DISABLE KEYS */;
INSERT INTO `me_camp_subproject_records_monthly_planned_activities` VALUES (14,14,37,3,'Zone','1',7,'1','3','3',1616679511,1616679511,10,10),(15,14,39,3,'Zone','1',7,'2','2','3',1617179520,1617179520,10,10),(16,13,37,3,'Zone','1',3,'1','1','1',1618423737,1618423737,10,10),(17,15,1,3,'Zone','2',10,'2','2','6',1621772200,1621772200,10,10),(19,17,99,1,'Zone','99',25,'10','9','6',1625591437,1625591437,10,10);
/*!40000 ALTER TABLE `me_camp_subproject_records_monthly_planned_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_camp_subproject_records_monthly_planned_activities_actual`
--

DROP TABLE IF EXISTS `me_camp_subproject_records_monthly_planned_activities_actual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `me_camp_subproject_records_monthly_planned_activities_actual` (
  `id` int NOT NULL AUTO_INCREMENT,
  `planned_activity_id` int NOT NULL,
  `hours_worked_field` varchar(2) NOT NULL DEFAULT '0',
  `hours_worked_office` varchar(2) NOT NULL DEFAULT '0',
  `hours_worked_total` varchar(4) DEFAULT '0',
  `achieved_activity_target` varchar(45) NOT NULL,
  `beneficiary_target_achieved_total` varchar(45) DEFAULT '0',
  `beneficiary_target_achieved_women` varchar(45) DEFAULT '0',
  `beneficiary_target_achieved_youth` varchar(45) DEFAULT '0',
  `beneficiary_target_achieved_women_headed` varchar(45) DEFAULT '0',
  `remarks` text,
  `year` varchar(5) DEFAULT NULL,
  `month` varchar(3) DEFAULT NULL,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_new_table_2_idx` (`planned_activity_id`),
  CONSTRAINT `fk_new_table_2` FOREIGN KEY (`planned_activity_id`) REFERENCES `me_camp_subproject_records_monthly_planned_activities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_camp_subproject_records_monthly_planned_activities_actual`
--

LOCK TABLES `me_camp_subproject_records_monthly_planned_activities_actual` WRITE;
/*!40000 ALTER TABLE `me_camp_subproject_records_monthly_planned_activities_actual` DISABLE KEYS */;
INSERT INTO `me_camp_subproject_records_monthly_planned_activities_actual` VALUES (1,14,'1','1','2','1','31','18','5','8','',NULL,NULL,1617129988,1617129988,10,10),(2,15,'1','10','11','1','12','4','4','4','',NULL,NULL,1617179689,1617179689,10,10),(3,16,'1','1','2','1','3','1','1','1','',NULL,NULL,1618423751,1618423751,10,10),(7,19,'6','5','11','50','27','18','2','7','',NULL,NULL,1625594530,1625594530,10,10);
/*!40000 ALTER TABLE `me_camp_subproject_records_monthly_planned_activities_actual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_camp_subproject_records_output_level_indicators`
--

DROP TABLE IF EXISTS `me_camp_subproject_records_output_level_indicators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `me_camp_subproject_records_output_level_indicators` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indicator` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_camp_subproject_records_output_level_indicators`
--

LOCK TABLES `me_camp_subproject_records_output_level_indicators` WRITE;
/*!40000 ALTER TABLE `me_camp_subproject_records_output_level_indicators` DISABLE KEYS */;
/*!40000 ALTER TABLE `me_camp_subproject_records_output_level_indicators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_camp_subproject_records_planned_work_effort`
--

DROP TABLE IF EXISTS `me_camp_subproject_records_planned_work_effort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `me_camp_subproject_records_planned_work_effort` (
  `id` int NOT NULL AUTO_INCREMENT,
  `camp_id` int unsigned NOT NULL,
  `year` int NOT NULL,
  `month` varchar(15) NOT NULL,
  `days_in_month` int NOT NULL,
  `days_field` int NOT NULL DEFAULT '0',
  `days_office` int NOT NULL DEFAULT '0',
  `days_total` int DEFAULT '0' COMMENT 'Field days + Office days',
  `days_other_non_esapp_activities` int DEFAULT NULL,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_me_camp_subproject_records_planned_work_effort_1_idx` (`camp_id`),
  CONSTRAINT `fk_me_camp_subproject_records_planned_work_effort_1` FOREIGN KEY (`camp_id`) REFERENCES `camp` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_camp_subproject_records_planned_work_effort`
--

LOCK TABLES `me_camp_subproject_records_planned_work_effort` WRITE;
/*!40000 ALTER TABLE `me_camp_subproject_records_planned_work_effort` DISABLE KEYS */;
INSERT INTO `me_camp_subproject_records_planned_work_effort` VALUES (13,6,2021,'3',31,12,12,24,2,1616678720,1616678720,10,10),(14,5,2021,'3',31,6,4,10,7,1616678740,1616751023,10,10),(15,5,2021,'5',31,2,2,4,3,1621770811,1621770811,10,10),(16,7,2021,'5',31,3,2,5,12,1622286786,1622286786,10,10),(17,7,2021,'7',31,15,10,25,6,1625561338,1625561338,10,10);
/*!40000 ALTER TABLE `me_camp_subproject_records_planned_work_effort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_camp_subproject_records_subcomponents`
--

DROP TABLE IF EXISTS `me_camp_subproject_records_subcomponents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `me_camp_subproject_records_subcomponents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `facilitation_id` int NOT NULL,
  `sub_component` varchar(255) NOT NULL,
  `females` varchar(45) NOT NULL DEFAULT '0',
  `males` varchar(45) NOT NULL DEFAULT '0',
  `women_headed` varchar(45) NOT NULL DEFAULT '0',
  `youth` varchar(45) NOT NULL DEFAULT '0',
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_me_camp_subproject_records_subcomponents_1_idx` (`facilitation_id`),
  CONSTRAINT `fk_me_camp_subproject_records_subcomponents_1` FOREIGN KEY (`facilitation_id`) REFERENCES `me_camp_subproject_records_improved_tech_facilitation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_camp_subproject_records_subcomponents`
--

LOCK TABLES `me_camp_subproject_records_subcomponents` WRITE;
/*!40000 ALTER TABLE `me_camp_subproject_records_subcomponents` DISABLE KEYS */;
/*!40000 ALTER TABLE `me_camp_subproject_records_subcomponents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_faabs_category_a_farmers`
--

DROP TABLE IF EXISTS `me_faabs_category_a_farmers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `me_faabs_category_a_farmers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `faabs_group_id` int NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `other_names` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `sex` varchar(7) NOT NULL,
  `dob` date NOT NULL,
  `nrc` varchar(20) DEFAULT NULL,
  `marital_status` varchar(15) NOT NULL,
  `contact_number` varchar(16) DEFAULT NULL,
  `relationship_to_household_head` varchar(50) DEFAULT NULL,
  `registration_date` date NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `household_size` int DEFAULT '0',
  `village` varchar(255) DEFAULT NULL,
  `chiefdom` varchar(255) DEFAULT NULL,
  `block` varchar(255) DEFAULT NULL,
  `zone` varchar(255) DEFAULT NULL,
  `commodity` varchar(255) DEFAULT NULL,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `title` varchar(10) NOT NULL,
  `age` int DEFAULT NULL,
  `household_head_type` enum('Female headed','Male headed') DEFAULT 'Male headed' COMMENT 'Female headed or Male headed',
  PRIMARY KEY (`id`),
  KEY `fk_me_faabs_farmer_register_1_idx` (`faabs_group_id`),
  CONSTRAINT `fk_me_faabs_category_a_farmers` FOREIGN KEY (`faabs_group_id`) REFERENCES `me_faabs_groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_faabs_category_a_farmers`
--

LOCK TABLES `me_faabs_category_a_farmers` WRITE;
/*!40000 ALTER TABLE `me_faabs_category_a_farmers` DISABLE KEYS */;
INSERT INTO `me_faabs_category_a_farmers` VALUES (1,3,'Francis','','Chulu','Male','1990-06-05','1828672/12/34','Married','+260978981455','','2021-03-03',1,10,'Village one','Chiefdom','Block','Zone','Commodity',1615132100,1616709828,10,10,'Mr.',30,'Male headed'),(2,3,'Francis','','test','Male','1989-07-19','1828672/12/00','Single','','','2021-03-25',1,NULL,'','','','','',1616709481,1616709903,10,10,'Mr.',31,'Male headed'),(3,1,'First ','','Last name','Female','1980-07-23','1828672/12/09','Married','','','2021-03-26',1,6,'Village one','Chiefdom','Block','Zone','Commodity',1616764476,1616764476,10,10,'Mrs.',40,'Male headed'),(4,3,'Francis','','Other name','Male','1981-07-30','1828672/12/1','Married','','','2020-03-11',1,NULL,'','','','','',1621769681,1621769895,10,10,'Mr.',39,'Male headed');
/*!40000 ALTER TABLE `me_faabs_category_a_farmers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_faabs_groups`
--

DROP TABLE IF EXISTS `me_faabs_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `me_faabs_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `camp_id` int unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `status` int DEFAULT '1',
  `created_at` int unsigned NOT NULL,
  `latitude` varchar(45) DEFAULT NULL,
  `longitude` varchar(45) DEFAULT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `max_farmer_graduation_training_topics` int DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_me_faabs_groups_1_idx` (`camp_id`),
  CONSTRAINT `fk_me_faabs_groups_1` FOREIGN KEY (`camp_id`) REFERENCES `camp` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_faabs_groups`
--

LOCK TABLES `me_faabs_groups` WRITE;
/*!40000 ALTER TABLE `me_faabs_groups` DISABLE KEYS */;
INSERT INTO `me_faabs_groups` VALUES (1,5,'FaaBS One','FO',1,1607263313,'-14.72048826007502','28.090678349761973',1625092460,1,10,1),(3,5,'Come together Group',NULL,1,1615123711,'-13.889884','28.368405',1625084332,10,10,2);
/*!40000 ALTER TABLE `me_faabs_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_faabs_register`
--

DROP TABLE IF EXISTS `me_faabs_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `me_faabs_register` (
  `id` int NOT NULL AUTO_INCREMENT,
  `faabs_group_id` int NOT NULL,
  `farmer_id` int NOT NULL,
  `present` enum('Yes','No') DEFAULT 'Yes',
  `date` date NOT NULL,
  `topic` mediumtext NOT NULL COMMENT 'Topic or session covered i.e. Village Chicken housing',
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_me_faabs_register_1_idx` (`farmer_id`),
  KEY `fk_me_faabs_register_2_idx` (`faabs_group_id`),
  CONSTRAINT `fk_me_faabs_register_1` FOREIGN KEY (`farmer_id`) REFERENCES `me_faabs_category_a_farmers` (`id`),
  CONSTRAINT `fk_me_faabs_register_2` FOREIGN KEY (`faabs_group_id`) REFERENCES `me_faabs_groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_faabs_register`
--

LOCK TABLES `me_faabs_register` WRITE;
/*!40000 ALTER TABLE `me_faabs_register` DISABLE KEYS */;
/*!40000 ALTER TABLE `me_faabs_register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_faabs_training_attendance_sheet`
--

DROP TABLE IF EXISTS `me_faabs_training_attendance_sheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `me_faabs_training_attendance_sheet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `faabs_group_id` int NOT NULL,
  `farmer_id` int NOT NULL,
  `household_head_type` varchar(45) DEFAULT 'Male headed' COMMENT 'Female headed or Male headed',
  `topic` text NOT NULL COMMENT 'Training course',
  `facilitators` text NOT NULL COMMENT 'Facilitators/Organisation',
  `partner_organisations` text,
  `training_date` date NOT NULL,
  `duration` varchar(10) NOT NULL COMMENT 'Duration hours and minutes',
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `full_names` varchar(255) DEFAULT NULL,
  `youth_non_youth` enum('Youth','Non Youth') DEFAULT NULL,
  `marital_status` varchar(45) DEFAULT NULL,
  `sex` varchar(45) DEFAULT NULL,
  `year_of_birth` varchar(6) DEFAULT NULL,
  `quarter` varchar(2) DEFAULT NULL,
  `topic_indicator` text,
  `topic_subcomponent` varchar(45) DEFAULT NULL,
  `training_type` text,
  PRIMARY KEY (`id`),
  KEY `fk_me_faabs_training_attendance_sheet_1_idx` (`farmer_id`),
  KEY `fk_me_faabs_training_attendance_sheet_2_idx` (`faabs_group_id`),
  CONSTRAINT `fk_me_faabs_training_attendance_sheet_1` FOREIGN KEY (`farmer_id`) REFERENCES `me_faabs_category_a_farmers` (`id`),
  CONSTRAINT `fk_me_faabs_training_attendance_sheet_2` FOREIGN KEY (`faabs_group_id`) REFERENCES `me_faabs_groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_faabs_training_attendance_sheet`
--

LOCK TABLES `me_faabs_training_attendance_sheet` WRITE;
/*!40000 ALTER TABLE `me_faabs_training_attendance_sheet` DISABLE KEYS */;
INSERT INTO `me_faabs_training_attendance_sheet` VALUES (9,3,1,'','3','Facilitator names','','2021-04-06','12:30',1618397385,1618398329,10,10,NULL,'Non Youth',NULL,'Male',NULL,'2','Number of smallholders trained in the use of improved production technologies & best practices to enhance productivity that allow production to comply with market requirements (at least 3 improved production technologies facilitated)','Sub-component 2.2','Participants under non-Direct/Other Training [Stream 2]'),(10,3,1,'Male headed','5','Facilitator names','','2021-04-12','13:00',1618917211,1621769908,10,10,NULL,'Non Youth',NULL,'Male',NULL,'2','Number of local service providers (farm & non-farm) strengthened and/or trained to provide services that allow production to meet market requirements [Strengthening of coordination & business models] ','Sub-component 2.1','Participants under Direct/Intensive Training [Stream 1]');
/*!40000 ALTER TABLE `me_faabs_training_attendance_sheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_faabs_training_topic_enrolment`
--

DROP TABLE IF EXISTS `me_faabs_training_topic_enrolment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `me_faabs_training_topic_enrolment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `faabs_id` int NOT NULL,
  `training_type` varchar(255) NOT NULL,
  `topic_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_me_faabs_training_topic_enrolment_1_idx` (`faabs_id`),
  KEY `fk_me_faabs_training_topic_enrolment_2_idx` (`topic_id`),
  CONSTRAINT `fk_me_faabs_training_topic_enrolment_1` FOREIGN KEY (`faabs_id`) REFERENCES `me_faabs_groups` (`id`),
  CONSTRAINT `fk_me_faabs_training_topic_enrolment_2` FOREIGN KEY (`topic_id`) REFERENCES `me_faabs_training_topics` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_faabs_training_topic_enrolment`
--

LOCK TABLES `me_faabs_training_topic_enrolment` WRITE;
/*!40000 ALTER TABLE `me_faabs_training_topic_enrolment` DISABLE KEYS */;
INSERT INTO `me_faabs_training_topic_enrolment` VALUES (14,1,'Participants under non-Direct/Other Training [Stream 2]',2),(15,1,'Participants under non-Direct/Other Training [Stream 2]',3),(16,1,'Participants under non-Direct/Other Training [Stream 2]',4),(28,3,'Participants under Direct/Intensive Training [Stream 1]',2),(29,3,'Participants under Direct/Intensive Training [Stream 1]',3),(30,3,'Participants under Direct/Intensive Training [Stream 1]',4),(31,3,'Participants under Direct/Intensive Training [Stream 1]',5),(32,3,'Participants under Direct/Intensive Training [Stream 1]',6);
/*!40000 ALTER TABLE `me_faabs_training_topic_enrolment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_faabs_training_topics`
--

DROP TABLE IF EXISTS `me_faabs_training_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `me_faabs_training_topics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `topic` text NOT NULL,
  `output_level_indicator` text NOT NULL,
  `category` text NOT NULL,
  `subcomponent` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_faabs_training_topics`
--

LOCK TABLES `me_faabs_training_topics` WRITE;
/*!40000 ALTER TABLE `me_faabs_training_topics` DISABLE KEYS */;
INSERT INTO `me_faabs_training_topics` VALUES (2,'Production enhancing technologies: early planting','Number of smallholders trained in the use of improved production technologies & best practices to enhance productivity that allow production to comply with market requirements (at least 3 improved production technologies facilitated)','Crops','Sub-component 2.1'),(3,'Production enhancing technologies: row planting,','Number of smallholders trained in the use of improved production technologies & best practices to enhance productivity that allow production to comply with market requirements (at least 3 improved production technologies facilitated)','Crops','Sub-component 2.2'),(4,'Production enhancing technologies: construct and use improved livestock housing','Number of smallholders trained in improved Post-harvest technologies (at least 2 improved post-harvest technologies)','Livestock','Sub-component 2.2'),(5,'Test topic 1','Number of local service providers (farm & non-farm) strengthened and/or trained to provide services that allow production to meet market requirements [Strengthening of coordination & business models] ','Aquaculture','Sub-component 2.1'),(6,'Test topic 2','Number of smallholder producers (desegregated by gender) in organizations/cooperatives/marketing groups trained in crucial aspects for inclusion in VC i.e. identification of partnership opportunities, negotiation, market linkages, business management, governance etc [Strengthening of coordination & business models] ','Livestock','Sub-component 2.2'),(7,'Test topic 3','Number of smallholders trained in improved Post-harvest technologies (at least 2 improved post-harvest technologies)','Crops','Sub-component 2.1'),(8,'test topic','Number of smallholders trained in the use of improved production technologies & best practices to enhance productivity that allow production to comply with market requirements (at least 3 improved production technologies facilitated)','Crops','Sub-component 2.1');
/*!40000 ALTER TABLE `me_faabs_training_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_field_monitoring_checklist_issues`
--

DROP TABLE IF EXISTS `me_field_monitoring_checklist_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `me_field_monitoring_checklist_issues` (
  `id` int NOT NULL AUTO_INCREMENT,
  `level` varchar(45) NOT NULL,
  `issue_category` varchar(255) NOT NULL,
  `issue` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_field_monitoring_checklist_issues`
--

LOCK TABLES `me_field_monitoring_checklist_issues` WRITE;
/*!40000 ALTER TABLE `me_field_monitoring_checklist_issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `me_field_monitoring_checklist_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_field_monitoring_checklists`
--

DROP TABLE IF EXISTS `me_field_monitoring_checklists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `me_field_monitoring_checklists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `district_id` int DEFAULT NULL,
  `province_id` int DEFAULT NULL,
  `issue_id` int NOT NULL,
  `addressed` enum('Yes','No') NOT NULL DEFAULT 'No',
  `comments` varchar(45) DEFAULT NULL,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_me_field_monitoring_checklists_1_idx` (`issue_id`),
  CONSTRAINT `fk_me_field_monitoring_checklists_1` FOREIGN KEY (`issue_id`) REFERENCES `me_field_monitoring_checklist_issues` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_field_monitoring_checklists`
--

LOCK TABLES `me_field_monitoring_checklists` WRITE;
/*!40000 ALTER TABLE `me_field_monitoring_checklists` DISABLE KEYS */;
/*!40000 ALTER TABLE `me_field_monitoring_checklists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_quarterly_operations_funds_requisition`
--

DROP TABLE IF EXISTS `me_quarterly_operations_funds_requisition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `me_quarterly_operations_funds_requisition` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quarter_workplan_id` int NOT NULL,
  `budget_estimate_month_1` varchar(50) DEFAULT '0',
  `budget_estimate_month_2` varchar(50) DEFAULT '0',
  `budget_estimate_month_3` varchar(50) DEFAULT '0',
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_me_quarterly_operations_funds_requisition_1_idx` (`quarter_workplan_id`),
  CONSTRAINT `fk_me_quarterly_operations_funds_requisition_1` FOREIGN KEY (`quarter_workplan_id`) REFERENCES `me_quarterly_work_plan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_quarterly_operations_funds_requisition`
--

LOCK TABLES `me_quarterly_operations_funds_requisition` WRITE;
/*!40000 ALTER TABLE `me_quarterly_operations_funds_requisition` DISABLE KEYS */;
/*!40000 ALTER TABLE `me_quarterly_operations_funds_requisition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_quarterly_outreach_records`
--

DROP TABLE IF EXISTS `me_quarterly_outreach_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `me_quarterly_outreach_records` (
  `id` int NOT NULL AUTO_INCREMENT,
  `component` text NOT NULL,
  `sub_component` text NOT NULL,
  `province_id` int DEFAULT NULL,
  `district_id` int DEFAULT NULL,
  `year` varchar(5) NOT NULL,
  `quarter` tinyint NOT NULL,
  `number_females` int NOT NULL DEFAULT '0',
  `number_males` int NOT NULL DEFAULT '0',
  `number_young` int NOT NULL DEFAULT '0',
  `number_not_young` int NOT NULL DEFAULT '0',
  `number_women_headed_households` int NOT NULL DEFAULT '0',
  `number_non_women_headed_households` int DEFAULT '0',
  `number_households` int NOT NULL DEFAULT '0',
  `number_household_members` int NOT NULL DEFAULT '0',
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_quarterly_outreach_records`
--

LOCK TABLES `me_quarterly_outreach_records` WRITE;
/*!40000 ALTER TABLE `me_quarterly_outreach_records` DISABLE KEYS */;
INSERT INTO `me_quarterly_outreach_records` VALUES (3,'Component 2: Sustainable Agribusiness Partnerships','2.1: Strategic Linkages of Graduating Subsistence Farmers',1,2,'2021',1,10,20,15,15,10,0,20,50,1625654301,1625655308,10,10),(4,'Component 2: Sustainable Agribusiness Partnerships','2.2: Enhancing Agro-Micro, Small & Medium Enterprises',1,2,'2021',2,10,12,9,13,10,0,30,40,1625655366,1625655366,10,10),(5,'Component 2: Sustainable Agribusiness Partnerships','2.3: Facilitating Pro-Smallholder Market-Pull Agribusiness',1,2,'2021',3,5,5,3,7,5,0,10,20,1625655406,1625655406,10,10),(6,'Component 2: Sustainable Agribusiness Partnerships','2.1: Strategic Linkages of Graduating Subsistence Farmers',1,2,'2021',4,20,10,10,20,20,0,40,90,1625655454,1625655454,10,10),(7,'Component 2: Sustainable Agribusiness Partnerships','2.1: Strategic Linkages of Graduating Subsistence Farmers',1,2,'2017',1,10,20,10,10,5,6,0,20,1625679617,1625679617,10,10),(8,'Component 2: Sustainable Agribusiness Partnerships','2.2: Enhancing Agro-Micro, Small & Medium Enterprises',1,2,'2017',2,12,10,10,12,10,10,0,30,1625679648,1625679648,10,10),(9,'Component 2: Sustainable Agribusiness Partnerships','2.3: Facilitating Pro-Smallholder Market-Pull Agribusiness',1,2,'2017',4,10,10,10,10,10,10,0,20,1625679675,1625679675,10,10),(10,'Component 2: Sustainable Agribusiness Partnerships','2.3: Facilitating Pro-Smallholder Market-Pull Agribusiness',1,2,'2017',3,5,5,5,5,5,5,0,15,1625679718,1625679718,10,10);
/*!40000 ALTER TABLE `me_quarterly_outreach_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_quarterly_work_plan`
--

DROP TABLE IF EXISTS `me_quarterly_work_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `me_quarterly_work_plan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `activity_id` int NOT NULL,
  `province_id` int NOT NULL,
  `district_id` int NOT NULL,
  `month` int NOT NULL,
  `quarter` varchar(15) NOT NULL,
  `year` varchar(5) NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `district_approval_status` int NOT NULL DEFAULT '0',
  `provincial_approval_status` int NOT NULL,
  `Remarks` text NOT NULL,
  `esapp_comments` text,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_quarterly_work_plan`
--

LOCK TABLES `me_quarterly_work_plan` WRITE;
/*!40000 ALTER TABLE `me_quarterly_work_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `me_quarterly_work_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgf_activity`
--

DROP TABLE IF EXISTS `mgf_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mgf_activity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `activity_no` int NOT NULL,
  `activity_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtotal` decimal(12,2) NOT NULL DEFAULT '0.00',
  `componet_id` int NOT NULL,
  `inputs` int NOT NULL DEFAULT '0',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `componet_id` (`componet_id`),
  KEY `createdby` (`createdby`),
  CONSTRAINT `mgf_activity_ibfk_1` FOREIGN KEY (`createdby`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mgf_activity_ibfk_2` FOREIGN KEY (`componet_id`) REFERENCES `mgf_component` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mgf_activity`
--

LOCK TABLES `mgf_activity` WRITE;
/*!40000 ALTER TABLE `mgf_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `mgf_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgf_applicant`
--

DROP TABLE IF EXISTS `mgf_applicant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mgf_applicant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province_id` int unsigned DEFAULT NULL,
  `district_id` int unsigned DEFAULT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationalid` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `applicant_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int NOT NULL,
  `organisation_id` int DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `fk_applicant_district` (`district_id`),
  KEY `fk_mgf_applicant_1_idx` (`province_id`),
  CONSTRAINT `fk_applicant_district` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_mgf_applicant_1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`),
  CONSTRAINT `mgf_applicant_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mgf_applicant`
--

LOCK TABLES `mgf_applicant` WRITE;
/*!40000 ALTER TABLE `mgf_applicant` DISABLE KEYS */;
/*!40000 ALTER TABLE `mgf_applicant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgf_application`
--

DROP TABLE IF EXISTS `mgf_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mgf_application` (
  `id` int NOT NULL AUTO_INCREMENT,
  `attachements` int DEFAULT NULL,
  `applicant_id` int NOT NULL,
  `organisation_id` int NOT NULL,
  `application_status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Initialized',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_submitted` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_id` (`organisation_id`),
  KEY `applicant_id` (`applicant_id`),
  CONSTRAINT `mgf_application_ibfk_1` FOREIGN KEY (`applicant_id`) REFERENCES `mgf_applicant` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mgf_application_ibfk_2` FOREIGN KEY (`organisation_id`) REFERENCES `mgf_organisation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mgf_application`
--

LOCK TABLES `mgf_application` WRITE;
/*!40000 ALTER TABLE `mgf_application` DISABLE KEYS */;
/*!40000 ALTER TABLE `mgf_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgf_approval`
--

DROP TABLE IF EXISTS `mgf_approval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mgf_approval` (
  `id` int NOT NULL AUTO_INCREMENT,
  `application_id` int NOT NULL,
  `conceptnote_id` int NOT NULL,
  `scores` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `review_remark` text COLLATE utf8mb4_unicode_ci,
  `review_submission` timestamp NULL DEFAULT NULL,
  `reviewed_by` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certify_remark` text COLLATE utf8mb4_unicode_ci,
  `certify_submission` timestamp NULL DEFAULT NULL,
  `certified_by` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `review2_remark` text COLLATE utf8mb4_unicode_ci,
  `review2_submission` timestamp NULL DEFAULT NULL,
  `reviewed2_by` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approval_remark` text COLLATE utf8mb4_unicode_ci,
  `approve_submittion` timestamp NULL DEFAULT NULL,
  `approved_by` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `application_id` (`application_id`),
  KEY `conceptnote_id` (`conceptnote_id`),
  CONSTRAINT `mgf_approval_ibfk_1` FOREIGN KEY (`conceptnote_id`) REFERENCES `mgf_concept_note` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mgf_approval_ibfk_2` FOREIGN KEY (`application_id`) REFERENCES `mgf_application` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mgf_approval`
--

LOCK TABLES `mgf_approval` WRITE;
/*!40000 ALTER TABLE `mgf_approval` DISABLE KEYS */;
/*!40000 ALTER TABLE `mgf_approval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgf_approval_status`
--

DROP TABLE IF EXISTS `mgf_approval_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mgf_approval_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `approval_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lowerlimit` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `upperlimit` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `mgf_approval_status_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mgf_approval_status`
--

LOCK TABLES `mgf_approval_status` WRITE;
/*!40000 ALTER TABLE `mgf_approval_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `mgf_approval_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgf_attachements`
--

DROP TABLE IF EXISTS `mgf_attachements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mgf_attachements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `registration_certificate` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `articles_of_assoc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `audit_reports` text COLLATE utf8mb4_unicode_ci,
  `mou_contract` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `board_resolution` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `application_attachement` text COLLATE utf8mb4_unicode_ci,
  `organisation_id` int NOT NULL,
  `application_id` int NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `application_id` (`application_id`),
  KEY `organisation_id` (`organisation_id`),
  CONSTRAINT `mgf_attachements_ibfk_1` FOREIGN KEY (`organisation_id`) REFERENCES `mgf_organisation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mgf_attachements_ibfk_2` FOREIGN KEY (`application_id`) REFERENCES `mgf_application` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mgf_attachements`
--

LOCK TABLES `mgf_attachements` WRITE;
/*!40000 ALTER TABLE `mgf_attachements` DISABLE KEYS */;
/*!40000 ALTER TABLE `mgf_attachements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgf_component`
--

DROP TABLE IF EXISTS `mgf_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mgf_component` (
  `id` int NOT NULL AUTO_INCREMENT,
  `component_no` int NOT NULL,
  `component_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtotal` decimal(12,2) NOT NULL DEFAULT '0.00',
  `proposal_id` int NOT NULL,
  `activities` int NOT NULL DEFAULT '0',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `proposal_id` (`proposal_id`),
  KEY `createdby` (`createdby`),
  CONSTRAINT `mgf_component_ibfk_1` FOREIGN KEY (`createdby`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mgf_component_ibfk_2` FOREIGN KEY (`proposal_id`) REFERENCES `mgf_proposal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mgf_component`
--

LOCK TABLES `mgf_component` WRITE;
/*!40000 ALTER TABLE `mgf_component` DISABLE KEYS */;
/*!40000 ALTER TABLE `mgf_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgf_concept_note`
--

DROP TABLE IF EXISTS `mgf_concept_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mgf_concept_note` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_title` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estimated_cost` decimal(12,2) NOT NULL,
  `starting_date` date NOT NULL,
  `operation_id` int NOT NULL,
  `implimentation_period` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_operation_type` text COLLATE utf8mb4_unicode_ci,
  `application_id` int NOT NULL,
  `organisation_id` int NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_submitted` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_id` (`operation_id`),
  KEY `organisation_id` (`organisation_id`),
  KEY `application_id` (`application_id`),
  CONSTRAINT `mgf_concept_note_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `mgf_application` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mgf_concept_note_ibfk_2` FOREIGN KEY (`organisation_id`) REFERENCES `mgf_organisation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mgf_concept_note_ibfk_3` FOREIGN KEY (`operation_id`) REFERENCES `mgf_operation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mgf_concept_note`
--

LOCK TABLES `mgf_concept_note` WRITE;
/*!40000 ALTER TABLE `mgf_concept_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `mgf_concept_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgf_contact`
--

DROP TABLE IF EXISTS `mgf_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mgf_contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel_no` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `physical_address` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organisation_id` int NOT NULL,
  `position_id` int NOT NULL,
  `applicant_id` int NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `applicant_id` (`applicant_id`),
  KEY `position_id` (`position_id`),
  KEY `organisation_id` (`organisation_id`),
  CONSTRAINT `mgf_contact_ibfk_1` FOREIGN KEY (`organisation_id`) REFERENCES `mgf_organisation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mgf_contact_ibfk_2` FOREIGN KEY (`position_id`) REFERENCES `mgf_position` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mgf_contact_ibfk_3` FOREIGN KEY (`applicant_id`) REFERENCES `mgf_applicant` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mgf_contact`
--

LOCK TABLES `mgf_contact` WRITE;
/*!40000 ALTER TABLE `mgf_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `mgf_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgf_experience`
--

DROP TABLE IF EXISTS `mgf_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mgf_experience` (
  `id` int NOT NULL AUTO_INCREMENT,
  `financed_before` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `any_collaboration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collaboration_will` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collaboration_ready` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organisation_id` int NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `organisation_id` (`organisation_id`),
  CONSTRAINT `mgf_experience_ibfk_1` FOREIGN KEY (`organisation_id`) REFERENCES `mgf_organisation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mgf_experience`
--

LOCK TABLES `mgf_experience` WRITE;
/*!40000 ALTER TABLE `mgf_experience` DISABLE KEYS */;
/*!40000 ALTER TABLE `mgf_experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgf_final_evaluation`
--

DROP TABLE IF EXISTS `mgf_final_evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mgf_final_evaluation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `proposal_id` int NOT NULL,
  `organisation_id` int NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `finalscore` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decision` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notified` tinyint(1) NOT NULL DEFAULT '0',
  `finalcomment` text COLLATE utf8mb4_unicode_ci,
  `response` text COLLATE utf8mb4_unicode_ci,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `proposal_id` (`proposal_id`),
  KEY `organisation_id` (`organisation_id`),
  CONSTRAINT `mgf_final_evaluation_ibfk_1` FOREIGN KEY (`proposal_id`) REFERENCES `mgf_proposal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mgf_final_evaluation_ibfk_2` FOREIGN KEY (`organisation_id`) REFERENCES `mgf_organisation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mgf_final_evaluation`
--

LOCK TABLES `mgf_final_evaluation` WRITE;
/*!40000 ALTER TABLE `mgf_final_evaluation` DISABLE KEYS */;
/*!40000 ALTER TABLE `mgf_final_evaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgf_input_cost`
--

DROP TABLE IF EXISTS `mgf_input_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mgf_input_cost` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_no` int NOT NULL,
  `input_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_cost` decimal(9,2) NOT NULL,
  `project_year_1` decimal(9,2) unsigned DEFAULT NULL,
  `project_year_2` decimal(9,2) unsigned DEFAULT NULL,
  `project_year_3` decimal(9,2) unsigned DEFAULT NULL,
  `project_year_4` decimal(9,2) unsigned DEFAULT NULL,
  `project_year_5` decimal(9,2) unsigned NOT NULL,
  `project_year_6` decimal(9,2) unsigned NOT NULL,
  `project_year_7` decimal(9,2) unsigned NOT NULL,
  `project_year_8` decimal(9,2) unsigned NOT NULL,
  `total_cost` decimal(9,2) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `activity_id` int NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_id` (`activity_id`),
  KEY `createdby` (`createdby`),
  CONSTRAINT `mgf_input_cost_ibfk_1` FOREIGN KEY (`createdby`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mgf_input_cost_ibfk_2` FOREIGN KEY (`activity_id`) REFERENCES `mgf_activity` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mgf_input_cost`
--

LOCK TABLES `mgf_input_cost` WRITE;
/*!40000 ALTER TABLE `mgf_input_cost` DISABLE KEYS */;
/*!40000 ALTER TABLE `mgf_input_cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgf_input_item`
--

DROP TABLE IF EXISTS `mgf_input_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mgf_input_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_no` int NOT NULL,
  `input_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_of_measure` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_year_1` decimal(9,2) NOT NULL DEFAULT '0.00',
  `project_year_2` decimal(9,2) DEFAULT '0.00',
  `project_year_3` decimal(9,2) NOT NULL DEFAULT '0.00',
  `project_year_4` decimal(9,2) NOT NULL DEFAULT '0.00',
  `project_year_5` decimal(9,2) unsigned NOT NULL,
  `project_year_6` decimal(9,2) unsigned NOT NULL,
  `project_year_7` decimal(9,2) unsigned NOT NULL,
  `project_year_8` decimal(9,2) unsigned NOT NULL,
  `unit_cost` decimal(9,2) NOT NULL,
  `total_cost` decimal(9,2) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `activity_id` int NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_id` (`activity_id`),
  KEY `createdby` (`createdby`),
  CONSTRAINT `mgf_input_item_ibfk_1` FOREIGN KEY (`createdby`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mgf_input_item_ibfk_2` FOREIGN KEY (`activity_id`) REFERENCES `mgf_activity` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mgf_input_item`
--

LOCK TABLES `mgf_input_item` WRITE;
/*!40000 ALTER TABLE `mgf_input_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `mgf_input_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgf_offer`
--

DROP TABLE IF EXISTS `mgf_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mgf_offer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `proposal_id` int NOT NULL,
  `organisation_id` int NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amountoffered` decimal(12,2) NOT NULL,
  `contribution` decimal(12,2) NOT NULL,
  `responded` tinyint(1) DEFAULT '0',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_responde` timestamp NULL DEFAULT NULL,
  `createdby` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_id` (`organisation_id`),
  KEY `proposal_id` (`proposal_id`),
  KEY `createdby` (`createdby`),
  CONSTRAINT `mgf_offer_ibfk_1` FOREIGN KEY (`createdby`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mgf_offer_ibfk_2` FOREIGN KEY (`proposal_id`) REFERENCES `mgf_proposal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mgf_offer_ibfk_3` FOREIGN KEY (`organisation_id`) REFERENCES `mgf_organisation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mgf_offer`
--

LOCK TABLES `mgf_offer` WRITE;
/*!40000 ALTER TABLE `mgf_offer` DISABLE KEYS */;
/*!40000 ALTER TABLE `mgf_offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgf_operation`
--

DROP TABLE IF EXISTS `mgf_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mgf_operation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `operation_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `operation_type` (`operation_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mgf_operation`
--

LOCK TABLES `mgf_operation` WRITE;
/*!40000 ALTER TABLE `mgf_operation` DISABLE KEYS */;
/*!40000 ALTER TABLE `mgf_operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgf_organisation`
--

DROP TABLE IF EXISTS `mgf_organisation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mgf_organisation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cooperative` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `acronym` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `registration_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `registration_no` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trade_license_no` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `registration_date` date NOT NULL,
  `business_objective` text COLLATE utf8mb4_unicode_ci,
  `email_address` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `physical_address` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel_no` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province_id` int unsigned DEFAULT NULL,
  `district_id` int unsigned DEFAULT NULL,
  `applicant_id` int NOT NULL,
  `is_active` int DEFAULT '1',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_address` (`email_address`),
  UNIQUE KEY `trade_license_no` (`trade_license_no`),
  UNIQUE KEY `registration_no` (`registration_no`),
  KEY `applicant_id` (`applicant_id`),
  KEY `fk_org_district` (`district_id`),
  KEY `fk_org_province_idx` (`province_id`),
  CONSTRAINT `fk_org_district` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_org_province` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mgf_organisation_ibfk_1` FOREIGN KEY (`applicant_id`) REFERENCES `mgf_applicant` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mgf_organisation`
--

LOCK TABLES `mgf_organisation` WRITE;
/*!40000 ALTER TABLE `mgf_organisation` DISABLE KEYS */;
/*!40000 ALTER TABLE `mgf_organisation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgf_organisational_details`
--

DROP TABLE IF EXISTS `mgf_organisational_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mgf_organisational_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mgt_Staff` int NOT NULL,
  `senior_Staff` int NOT NULL,
  `junior_Staff` int NOT NULL,
  `others` int NOT NULL,
  `last_board` date NOT NULL,
  `last_agm` date NOT NULL,
  `last_audit` date NOT NULL,
  `has_finance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_resources` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organisation_id` int NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `organisation_id` (`organisation_id`),
  CONSTRAINT `mgf_organisational_details_ibfk_1` FOREIGN KEY (`organisation_id`) REFERENCES `mgf_organisation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mgf_organisational_details`
--

LOCK TABLES `mgf_organisational_details` WRITE;
/*!40000 ALTER TABLE `mgf_organisational_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `mgf_organisational_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgf_partnership`
--

DROP TABLE IF EXISTS `mgf_partnership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mgf_partnership` (
  `id` int NOT NULL AUTO_INCREMENT,
  `partner_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `partnership_aim` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `partnership_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `experience_id` int NOT NULL,
  `organisation_id` int NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `organisation_id` (`organisation_id`),
  CONSTRAINT `mgf_partnership_ibfk_1` FOREIGN KEY (`organisation_id`) REFERENCES `mgf_organisation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mgf_partnership`
--

LOCK TABLES `mgf_partnership` WRITE;
/*!40000 ALTER TABLE `mgf_partnership` DISABLE KEYS */;
/*!40000 ALTER TABLE `mgf_partnership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgf_pastproject`
--

DROP TABLE IF EXISTS `mgf_pastproject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mgf_pastproject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `years_assisted` int NOT NULL,
  `amount_assisted` decimal(10,0) NOT NULL,
  `obligations_met` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `outcome_response` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `organisation_id` int NOT NULL,
  `experience_id` int NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `experience_id` (`experience_id`),
  KEY `organisation_id` (`organisation_id`),
  CONSTRAINT `mgf_pastproject_ibfk_1` FOREIGN KEY (`organisation_id`) REFERENCES `mgf_organisation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mgf_pastproject_ibfk_2` FOREIGN KEY (`experience_id`) REFERENCES `mgf_experience` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mgf_pastproject`
--

LOCK TABLES `mgf_pastproject` WRITE;
/*!40000 ALTER TABLE `mgf_pastproject` DISABLE KEYS */;
/*!40000 ALTER TABLE `mgf_pastproject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgf_position`
--

DROP TABLE IF EXISTS `mgf_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mgf_position` (
  `id` int NOT NULL AUTO_INCREMENT,
  `position` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `position` (`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mgf_position`
--

LOCK TABLES `mgf_position` WRITE;
/*!40000 ALTER TABLE `mgf_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `mgf_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgf_project_evaluation`
--

DROP TABLE IF EXISTS `mgf_project_evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mgf_project_evaluation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `proposal_id` int NOT NULL,
  `organisation_id` int NOT NULL,
  `window` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  `observation` text COLLATE utf8mb4_unicode_ci,
  `declaration` text COLLATE utf8mb4_unicode_ci,
  `totalscore` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `decision` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_submitted` timestamp NULL DEFAULT NULL,
  `date_reviewed` timestamp NULL DEFAULT NULL,
  `reviewedby` int NOT NULL,
  `signature` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `organisation_id` (`organisation_id`),
  KEY `proposal_id` (`proposal_id`),
  KEY `reviewedby` (`reviewedby`),
  CONSTRAINT `mgf_project_evaluation_ibfk_1` FOREIGN KEY (`reviewedby`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mgf_project_evaluation_ibfk_2` FOREIGN KEY (`proposal_id`) REFERENCES `mgf_proposal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mgf_project_evaluation_ibfk_3` FOREIGN KEY (`organisation_id`) REFERENCES `mgf_organisation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mgf_project_evaluation`
--

LOCK TABLES `mgf_project_evaluation` WRITE;
/*!40000 ALTER TABLE `mgf_project_evaluation` DISABLE KEYS */;
/*!40000 ALTER TABLE `mgf_project_evaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgf_proposal`
--

DROP TABLE IF EXISTS `mgf_proposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mgf_proposal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_title` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mgf_no` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `organisation_id` int NOT NULL,
  `applicant_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starting_date` date NOT NULL,
  `ending_date` date DEFAULT NULL,
  `project_length` int NOT NULL DEFAULT '0',
  `number_reviewers` int NOT NULL DEFAULT '0',
  `project_operations` text COLLATE utf8mb4_unicode_ci,
  `any_experience` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `experience_response` text COLLATE utf8mb4_unicode_ci,
  `indicate_partnerships` text COLLATE utf8mb4_unicode_ci,
  `proposal_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Created',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_submitted` timestamp NULL DEFAULT NULL,
  `problem_statement` text COLLATE utf8mb4_unicode_ci,
  `overall_objective` text COLLATE utf8mb4_unicode_ci,
  `is_active` int DEFAULT '0',
  `totalcost` decimal(15,2) DEFAULT '0.00',
  `province_id` int unsigned DEFAULT NULL,
  `district_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_id` (`organisation_id`),
  KEY `fk_prop_district` (`district_id`),
  KEY `fk_prop_province_idx` (`province_id`),
  CONSTRAINT `fk_prop_district` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_prop_province` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mgf_proposal_ibfk_1` FOREIGN KEY (`organisation_id`) REFERENCES `mgf_organisation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mgf_proposal`
--

LOCK TABLES `mgf_proposal` WRITE;
/*!40000 ALTER TABLE `mgf_proposal` DISABLE KEYS */;
/*!40000 ALTER TABLE `mgf_proposal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgf_proposal_evaluation`
--

DROP TABLE IF EXISTS `mgf_proposal_evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mgf_proposal_evaluation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `proposal_id` int NOT NULL,
  `criterion_id` int NOT NULL,
  `awardedscore` int DEFAULT NULL,
  `grade` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `criterion_id` (`criterion_id`),
  KEY `proposal_id` (`proposal_id`),
  KEY `createdby` (`createdby`),
  CONSTRAINT `mgf_proposal_evaluation_ibfk_1` FOREIGN KEY (`createdby`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mgf_proposal_evaluation_ibfk_2` FOREIGN KEY (`proposal_id`) REFERENCES `mgf_proposal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mgf_proposal_evaluation_ibfk_3` FOREIGN KEY (`criterion_id`) REFERENCES `mgf_selection_criteria` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mgf_proposal_evaluation`
--

LOCK TABLES `mgf_proposal_evaluation` WRITE;
/*!40000 ALTER TABLE `mgf_proposal_evaluation` DISABLE KEYS */;
/*!40000 ALTER TABLE `mgf_proposal_evaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgf_reviewer`
--

DROP TABLE IF EXISTS `mgf_reviewer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mgf_reviewer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reviewer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area_of_expertise` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `confirmed` int DEFAULT '0',
  `createdBy` int unsigned DEFAULT NULL,
  `total_assigned_1` int DEFAULT '0',
  `total_assigned_2` int DEFAULT '0',
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_code` (`login_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mgf_reviewer`
--

LOCK TABLES `mgf_reviewer` WRITE;
/*!40000 ALTER TABLE `mgf_reviewer` DISABLE KEYS */;
/*!40000 ALTER TABLE `mgf_reviewer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgf_screening`
--

DROP TABLE IF EXISTS `mgf_screening`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mgf_screening` (
  `id` int NOT NULL AUTO_INCREMENT,
  `conceptnote_id` int NOT NULL,
  `organisation_id` int NOT NULL,
  `criterion` text COLLATE utf8mb4_unicode_ci,
  `satisfactory` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approve_submittion` timestamp NULL DEFAULT NULL,
  `verified_by` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_id` (`organisation_id`),
  KEY `conceptnote_id` (`conceptnote_id`),
  CONSTRAINT `mgf_screening_ibfk_1` FOREIGN KEY (`conceptnote_id`) REFERENCES `mgf_concept_note` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mgf_screening_ibfk_2` FOREIGN KEY (`organisation_id`) REFERENCES `mgf_organisation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mgf_screening`
--

LOCK TABLES `mgf_screening` WRITE;
/*!40000 ALTER TABLE `mgf_screening` DISABLE KEYS */;
/*!40000 ALTER TABLE `mgf_screening` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgf_selection_category`
--

DROP TABLE IF EXISTS `mgf_selection_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mgf_selection_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `createdby` (`createdby`),
  CONSTRAINT `mgf_selection_category_ibfk_1` FOREIGN KEY (`createdby`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mgf_selection_category`
--

LOCK TABLES `mgf_selection_category` WRITE;
/*!40000 ALTER TABLE `mgf_selection_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `mgf_selection_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgf_selection_criteria`
--

DROP TABLE IF EXISTS `mgf_selection_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mgf_selection_criteria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `criterion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `createdby` (`createdby`),
  CONSTRAINT `mgf_selection_criteria_ibfk_1` FOREIGN KEY (`createdby`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mgf_selection_criteria_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `mgf_selection_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mgf_selection_criteria`
--

LOCK TABLES `mgf_selection_criteria` WRITE;
/*!40000 ALTER TABLE `mgf_selection_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `mgf_selection_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgf_selection_grade`
--

DROP TABLE IF EXISTS `mgf_selection_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mgf_selection_grade` (
  `id` int NOT NULL AUTO_INCREMENT,
  `grade` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `criterion_id` int NOT NULL,
  `awardedscore` int NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `criterion_id` (`criterion_id`),
  KEY `createdby` (`createdby`),
  CONSTRAINT `mgf_selection_grade_ibfk_1` FOREIGN KEY (`createdby`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mgf_selection_grade_ibfk_2` FOREIGN KEY (`criterion_id`) REFERENCES `mgf_selection_criteria` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mgf_selection_grade`
--

LOCK TABLES `mgf_selection_grade` WRITE;
/*!40000 ALTER TABLE `mgf_selection_grade` DISABLE KEYS */;
/*!40000 ALTER TABLE `mgf_selection_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgf_unit`
--

DROP TABLE IF EXISTS `mgf_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mgf_unit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `unit` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `synonym` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unit` (`unit`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `mgf_unit_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mgf_unit`
--

LOCK TABLES `mgf_unit` WRITE;
/*!40000 ALTER TABLE `mgf_unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `mgf_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m000000_000000_base',1621726502),('m130524_201442_init',1621726752),('m190124_110200_add_verification_token_column_to_user_table',1621726752),('m210521_150431_001_create_table_awpb_comment',1621726752),('m210521_150431_002_create_table_awpb_commodity_type',1621726752),('m210521_150431_003_create_table_awpb_consolidated',1621726752),('m210521_150431_004_create_table_awpb_expense_category',1621726753),('m210521_150431_005_create_table_awpb_funder',1621726753),('m210521_150431_006_create_table_awpb_funding_type',1621726753),('m210521_150432_007_create_table_awpb_template',1621726791),('m210521_150432_008_create_table_awpb_unit_of_measure',1621726804),('m210521_150433_025_create_table_awpb_component',1621726806),('m210521_150433_026_create_table_awpb_indicator',1621726806),('m210521_150433_027_create_table_awpb_outcome',1621726807),('m210521_150433_028_create_table_awpb_output',1621726807),('m210521_150434_036_create_table_awpb_activity',1621726811),('m210521_150434_037_create_table_awpb_activity_funder',1621726812),('m210521_150434_038_create_table_awpb_activity_line',1621726812),('m210521_150434_039_create_table_awpb_template_activity',1621726814),('m210523_092652_024_create_table_mgf_operation',1621797277),('m210523_092653_025_create_table_mgf_position',1621797277),('m210523_092653_026_create_table_mgf_reviewer',1621797277),('m210523_092654_039_create_table_mgf_applicant',1621797278),('m210523_092654_040_create_table_mgf_approval_status',1621797279),('m210523_092654_041_create_table_mgf_organisation',1621797280),('m210523_092655_042_create_table_mgf_organisational_details',1621797280),('m210523_092655_043_create_table_mgf_partnership',1621797280),('m210523_092655_044_create_table_mgf_proposal',1621797281),('m210523_092655_045_create_table_mgf_selection_category',1621797281),('m210523_092655_046_create_table_mgf_selection_criteria',1621797281),('m210523_092655_047_create_table_mgf_selection_grade',1621797282),('m210523_092655_048_create_table_mgf_unit',1621797282),('m210523_092656_055_create_table_mgf_application',1621797283),('m210523_092656_056_create_table_mgf_attachements',1621797283),('m210523_092656_057_create_table_mgf_component',1621797284),('m210523_092656_058_create_table_mgf_concept_note',1621797284),('m210523_092656_059_create_table_mgf_contact',1621797285),('m210523_092656_060_create_table_mgf_experience',1621797285),('m210523_092656_061_create_table_mgf_final_evaluation',1621797286),('m210523_092656_062_create_table_mgf_offer',1621797286),('m210523_092656_063_create_table_mgf_pastproject',1621797287),('m210523_092657_064_create_table_mgf_project_evaluation',1621797287),('m210523_092657_065_create_table_mgf_proposal_evaluation',1621797288),('m210523_092657_066_create_table_mgf_screening',1621797289),('m210523_092658_072_create_table_mgf_activity',1621797289),('m210523_092658_073_create_table_mgf_approval',1621797290),('m210523_092658_074_create_table_mgf_input_cost',1621797290),('m210523_092658_075_create_table_mgf_input_item',1621797291);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `right` text,
  `definition` text,
  `active` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'Manage Users',NULL,1),(2,'View Users',NULL,1),(3,'Manage Roles',NULL,1),(4,'View Roles',NULL,1),(6,'View profile',NULL,1),(7,'View audit trail logs',NULL,1),(8,'Manage provinces',NULL,1),(9,'Manage districts',NULL,1),(10,'Manage camps',NULL,1),(11,'Remove provinces',NULL,1),(12,'Remove districts',NULL,1),(13,'Remove camps',NULL,1),(14,'Manage markets',NULL,1),(15,'Remove markets',NULL,1),(16,'Manage commodity configs',NULL,1),(17,'Remove commodity config',NULL,1),(18,'Collect commodity prices',NULL,1),(19,'View commodity prices',NULL,1),(20,'Remove commodity price',NULL,1),(21,'Manage interview guide template questions',NULL,1),(22,'View interview guide template',NULL,1),(23,'Remove interview guide template question',NULL,1),(24,'Manage story of change categories',NULL,1),(25,'Submit story of change',NULL,1),(26,'Review Story of change',NULL,1),(27,'View Story of change',NULL,1),(28,'Attach case study articles',NULL,1),(29,'Manage faabs groups',NULL,1),(30,'View faabs groups',NULL,1),(31,'Remove faabs groups',NULL,1),(32,'Manage category A farmers',NULL,1),(33,'View category A farmers',NULL,1),(34,'Remove category A farmers',NULL,1),(35,'Submit FaaBS training records',NULL,1),(36,'View FaaBS training records',NULL,1),(37,'Remove FaaBS training records',NULL,1),(38,'Submit back to office report',NULL,1),(39,'Review back to office report',NULL,1),(40,'View back to office report',NULL,1),(43,'Plan camp monthly activities',NULL,1),(44,'Remove planned camp monthly activities',NULL,1),(45,'View planned camp monthly activities',NULL,1),(46,'Manage FaaBS training topics',NULL,1),(47,'View FaaBS training topics',NULL,1),(48,'Remove FaaBS training topics',NULL,1),(49,'View facilitation of improved technologies/best practices report',NULL,1),(50,'View training attendance cumulative report',NULL,1),(55,'View physical tracking table report',NULL,1),(56,'Commodity-Specific AWPB','Commodity-Specific AWPB',1),(57,'View programmes','View programmes',1),(58,'Manage AWPB activities','',1),(59,'View AWPB activities','',1),(60,'Manage components','',1),(61,'View components','',1),(62,'Manage AWPB templates','',1),(63,'View AWPB templates','',1),(64,'View AWPB activity lines','',1),(65,'Manage AWPB activity lines','View AWPB activity lines',1),(66,'Submit District AWPB','',1),(67,'Approve AWPB - Provincial','Approve AWPB - Provincial',1),(68,'Submit programme-wide AWPB','Submit programme-wide AWPB',1),(69,'Manage province consolidated AWPB','Manage province consolidated AWPB',1),(70,'Manage programme-wide AWPB activity lines','Manage programme-wide AWPB activity lines',1),(71,'Approve AWPB - PCO','Approve AWPB - PCO',1),(72,'Manage AWPB funders','Manage AWPB funders',1),(73,'View AWPB funders','View AWPB funders',1),(74,'Setup AWPB','Setup AWPB',1),(75,'Approve AWPB - Ministry','Approve AWPB - Ministry',1),(76,'Manage programme-wide AWPB','Manage programme-wide AWPB',1),(77,'View PW AWPB','View PW AWPB',1),(78,'View MGF module','',1),(79,'View MGF Applicants','',1),(80,'View MGF Organisations','',1),(81,'View MGF Concept Note','',1),(82,'View MGF Application','',1),(83,'View MGF Approvals','',1),(84,'View MGF Proposals','',1),(85,'View MGF Evaluations','',1),(86,'Commodity-Specific AWPB','Commodity-Specific AWPB',1),(87,'View programmes','View programmes',1),(88,'Manage AWPB activities','',1),(89,'View AWPB activities','',1),(90,'Manage components','',1),(91,'View components','',1),(92,'Manage AWPB templates','',1),(93,'View AWPB templates','',1),(94,'View AWPB activity lines','',1),(95,'Manage AWPB activity lines','View AWPB activity lines',1),(96,'Submit District AWPB','',1),(97,'Approve AWPB - Provincial','Approve AWPB - Provincial',1),(98,'Submit programme-wide AWPB','Submit programme-wide AWPB',1),(99,'Manage province consolidated AWPB','Manage province consolidated AWPB',1),(100,'Manage programme-wide AWPB activity lines','Manage programme-wide AWPB activity lines',1),(101,'Approve AWPB - PCO','Approve AWPB - PCO',1),(102,'Manage AWPB funders','Manage AWPB funders',1),(103,'View AWPB funders','View AWPB funders',1),(104,'Setup AWPB','Setup AWPB',1),(105,'Approve AWPB - Ministry','Approve AWPB - Ministry',1),(106,'Manage programme-wide AWPB','Manage programme-wide AWPB',1),(107,'View PW AWPB','View PW AWPB',1),(108,'Manage Users','',1),(109,'View Users','',1),(110,'Manage Roles','',1),(111,'View Roles','',1),(112,'View profile','',1),(113,'View audit trail logs','',1),(114,'Manage provinces','',1),(115,'Manage districts','',1),(116,'Manage camps','',1),(117,'Remove provinces','',1),(118,'Remove districts','',1),(119,'Remove camps','',1),(120,'Manage markets','',1),(121,'Remove markets','',1),(122,'Manage commodity configs','',1),(123,'Remove commodity config','',1),(124,'Collect commodity prices','',1),(125,'View commodity prices','',1),(126,'Remove commodity price','',1),(127,'Manage interview guide template questions','',1),(128,'View interview guide template','',1),(129,'Remove interview guide template question','',1),(130,'Manage story of change categories','',1),(131,'Submit story of change','',1),(132,'Review Story of change','',1),(133,'View Story of change','',1),(134,'Attach case study articles','',1),(135,'Manage faabs groups','',1),(136,'View faabs groups','',1),(137,'Remove faabs groups','',1),(138,'Manage category A farmers','',1),(139,'View category A farmers','',1),(140,'Remove category A farmers','',1),(141,'Submit FaaBS training records','',1),(142,'View FaaBS training records','',1),(143,'Remove FaaBS training records','',1),(144,'Submit back to office report','',1),(145,'Review back to office report','',1),(146,'View back to office report','',1),(147,'Plan camp monthly activities','',1),(148,'Remove planned camp monthly activities','',1),(149,'View planned camp monthly activities','',1),(150,'Manage FaaBS training topics','',1),(151,'View FaaBS training topics','',1),(152,'Remove FaaBS training topics','',1),(153,'View facilitation of improved technologies/best practices report','',1),(154,'View training attendance cumulative report','',1),(155,'View physical tracking table report','View physical tracking table report',1),(156,'View MGF module','',1),(157,'View MGF Applicants','',1),(158,'View MGF Organisations','',1),(159,'View MGF Concept Note','',1),(160,'View MGF Application','',1),(161,'View MGF Approvals','',1),(162,'View MGF Proposals','',1),(163,'View MGF Evaluations','',1),(164,'Submit project outreach records','Can submit project outreach quarterly records',1),(165,'Remove project outreach records','Remove project outreach records',1),(166,'View project outreach reports','View project outreach reports',1);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `province` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `polygon` geometry DEFAULT NULL,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES (1,'Central',_binary '\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0�9�w\�\�;@*T7�.��s\�\�\�;@	\���c�.�B^&\�\�;@ѱ�J\\�.�F\ne\�\�\�;@�C�\�\�.��\�7\�\�;@/�4\'/�.��\�\0d\�;@|�8c��.�\�#\rnk\�;@ {��\�.�Yk(�\�;@B͐*��.��0\��\�;@a��M�.�ɏ�k\�;@\��|zl�.�=�Е\�;@H6W\�s�.�vnڌ\�\�;@�EB[έ.�ra�r\�;@\�v��\Z�.�4�\�\�;@%\�\�Rί.�v\�1<\�;@\0��q��.��`�un\�;@�8�t�.�\�mlv�\�;@\�\�(yu�.�ҏ�S\�\�;@\n1�Tm�.�\�h\0o�\�;@�\�jdW�.�_b,\�/\�;@\��X�.��6o�\�;@x\�W�f�.�\�X�yV\�;@@�5_�.�a�HZ\�;@\�\\\���.�wj.7\�;@\�\�[v�.���À\�;@i���.�\�س\�2\�;@�����\�.��\�\�l\�\�;@����\�\�.��ฌ�\�;@��켍\�.���?�:\�;@#�~�\r\�.��,��\�;@+n\�b~\�.��\�]��\�;@!�\�F\�\�.�\�\�]\�;@Rb\��\�.���/Ie\�;@]��u\�.�ywd�6\�;@!Z+\�\�.�\�T�]\�;@�x\�\�.��9\�m\�\�;@\�xwd�\�.����&�\�;@<�$\�.���%VF\�;@n��ʆ\�.��h���\�;@�w�~\�.�¿\Z3\�;@\�\�P\�\�.�����\'\�;@�\\m\��\�.���X�\�\�;@;\�\����.�C��\�\�;@��0B�.�\���\�;@�i�:�.�v�և�\�;@��&�.�\�\�e\�i\�;@\n�]��.�\�9?\�q\�;@ ��\�\�.�K>v(\�;@:tzލ�.�Yni5$\�;@T��~�.���\�;@CX�%��.�Ul\�\�\�;@�\�\�a��.��U��y\�;@uv28J�.���B�\�;@�%\�`�.�=\�!7\�\�;@\�	��$�.�|V�\�;@���\�ѽ.�����.\�;@���\�\�.�;6�\�;@K\�^b\�.�ҋ\��*�;@u\��\�.�Dn���;@�-\�R\\\�.�\\t�\�z�;@9�ߡ(\�.��J��;@\�y�]�\�.�y�\'e�;@Քd��.�\�(��;@�Cl�p/�\�\�O=�;@\�mP��\r/���5[y�;@W횐\�(/�M�x$^\�;@�Z��K%/�9DܜJ\�;@��EB[&/�C9ѮB\�;@\\1е\'/�k�=&R\�;@\\�v5)/���Hi\�;@��\�\�*/�7P\��|\�;@�1��,/�;\�O��\�;@�;�_�-/�1^�\�;@�z��./�z�I|\�;@�\�\\\��0/�\�;\�;@�\�ދ/2/���h\�;@�۠�[3/�i�\�Q\�\�;@�.n�4/���X�\�\�;@��aM5/��8*7Q\�;@\"r�z�6/�\�\�h\��\�;@xG\�j�7/�4.\�\�;@|eު\�8/����;�\�;@\��\�>:/��\n�\�;@\�\�l;/��N\�P\�\�;@Y�n\�=/�b0�\�\�;@��N�?/�	\���c\�;@kׄ�\�@/�pC�׼\�;@\��̰A/�^�o%\�;@\nK<�lB/�X9\�\�;@;9Cq\�C/��\�;@�\�0|D/�R)v4\�;@����E/�\�(\�\r\�;@1y\�|G/�!\\�z\�;@�\���H/�P�s\�\�;@\�&���I/�>ʈ@\�;@t~�\��K/�CF�7\�;@=\�\�\�M/�\��R�1\�;@4�y\�SO/�\�[[\�;@\�>rk\�M/�/R(_\�;@Y|EO/����\�;@J�i�O/��� \�>\�;@�J\�hM/�{�p̲\�;@i\�\�IK/�BC�\�;@\��ԱJI/���\�\�k\�;@ur�\�G/��L�T�;@�����F/�z�W�;@�#*T7G/�Ts��P�;@�	��I/��R?o*�;@\�^zoL/�[]N	��;@�}iN/�\�\�aN�;@� \�P/�!XU/��;@I\�\"i7R/�r�\��;@Mg\'��T/�\�\�\�V�;@L7�A`U/�e\��Q�;@\�5�o�Q/�u��;@C�=�P/�\���Ե;@��\��kO/��-\�R\\�;@F^\�\�O/��\"\�\�)�;@�Į\�\�N/��m��;@! _BO/�\�Xl���;@�g^�O/��}s�;@\��x�ZQ/��\�d�`�;@wf�\�\\S/�4���;@6sHj�T/�[$\�F�;@�Ũk\�U/�ٲ|]�;@Ϣw*\�V/��衶�;@��ؙBW/�Q��r��;@N*\ZkW/�_%��;@\�\�-W/�����;@_\�\�WV/���|��;@��_�T/�\�t\����;@\�}�R/�^,�ӫ;@A��LjP/��\�/-\�;@\�_vON/��`���;@\�G�L/����eN�;@\�[��K/�\�<��t�;@�h[\�J/�\Zn�燩;@5&\�\\J/��l ]�;@�y\Z0HJ/��6�X��;@/�\�I/�\\�nK\�;@���3�H/�*\�t���;@\�5\�KoG/�J&�v�;@.�!��E/�j\�\�4ӥ;@��c�\�C/��\�\\\��;@�Z\�7\�A/�\���P��;@q\�Ws�@/�;\�Ԗ:�;@�\��\�q?/�TW>\��;@��</�\�\��\�L�;@�W\�:/��[\���;@毐�28/��V`\�\�;@H��\n6/��z�;@r6\�4/��F\�ҿ�;@ta��3/�O\�\�\�N�;@tϺF\�1/�-Ӿ�;@\��\�o//��k$	©;@\�n�-/��tZ�A�;@��a,/�*:�\��;@\�\�b�,/��P�%��;@��B=-/���\\mŦ;@ۢ\��,/�\ZM.\���;@,g*/�ӽN\�˦;@LnYk(/����Q�;@�aۢ\�&/���\�t �;@c`\�%/�t\\�\�J�;@�M�a�#/�\r�\�۟�;@s��\"/�&VF#��;@\�[[% /��/L�\n�;@\�8b->/���~31�;@�\�\�L0/�\�T����;@�+�\�\Z/�\�d�<\r�;@�jIG/�)[$\�F�;@\�\�!�/�\�	F��;@��\�,\�/�P�V\��;@���\�I/�\�аu�;@g\n�\�\�/��|�R��;@6�.6�/��mQf��;@��C�R/�\0\�]���;@tϺF\�/��?�ϝ�;@9\�\�m4/�1\�����;@p#e��\r/�f�\�(Ϡ;@�N/�\�\�à;@�\�o\�\�\n/��D\�Ɵ�;@4\��`	/��Z}uU�;@�j\�v/�c\�tv2�;@�{)<h/�yܝ��;@o��/�m���5�;@�\�P�/�m���;@ͱ��/�a5��6�;@E�>�\'	/�4��\�l�;@\�g#\�M	/���u�X�;@A��/�wf�\�\\�;@Z��\�f/����\�{�;@/�HM�/�Ӥt{�;@Օ\��</�4-�2\Z�;@Ԟ�sb/�<�\��r�;@d�\�3�/���\�	��;@�lY�./�\�&2s��;@y\�ՏM/����\�;@I\�\�\�/��V\�f�;@���Ա/��q6�;@�\0ݗ3/�i\�V��;@3܀\�/�1\�q��;@�\�<�/�k\�m�\\�;@F��\\\Z�.�\�y�ȏ;@j�WV��.�3�}ƅ�;@W�\"��.�������;@�Ljh�.����\�;@U/�\�d�.�\�v��;@��`U�.��\�QcB�;@H��5\\�.�j�t��;@\�t����.�8\�ܘ��;@C �8��.�mo�$�;@�y�3M�.�e\����;@@/ܹ0�.�&��\��;@P÷�n�.�\�\�\��h�;@\"��u\��.�G�\����;@	��8��.��\�\�V\�;@�,���.�@�&M��;@OjM�.�ȗP��;@` ���.��9���;@\�@e���.�m\�\�]ى;@U4\��\��.�p>u�R�;@T\���.�\Z\�kA\�;@�b\r��.�\���k�;@��v\�\0/�\�\na5��;@�\�g\�\�\0/�X\0S�;@;��.R\0/���;@��I~\��.�5F\�j�;@_a����.�T\�\�$[�;@�Ǚ&l�.��]h�ӄ;@\�:q9^/�:�۠��;@\�<c_�/��F!ɬ�;@��\�/�L�\��\�;@�\�\�\�\�/��\�2R\�;@K\�^b/�^M����;@�*4\�/�ʇ�j�;@��\�Z�/���G���;@z\��\�3/�?Ȳ`\�;@�\�6o�/��\�\�׃;@���&�/�6\�,�;@�k���/�\'3\�Vz�;@\�8\n/��C\�ͩ�;@\�\�rJ@/�u\�b�T�;@�V\�f/�46<�~;@Hū�/�8K\�r~;@�O�\�/��*\�3};@�`���/�\�/J\�_|;@�_\�\�M/�<jL��|;@�۽\�\'/�ǽ�\r};@@��w\�/����,\'};@B��	\�\Z/�\�\��{�z;@��s\�f/�\\\�	�y;@�,�\�o/�\�y��w;@M�\rO�/�\�A\�Ѫv;@�z�\�{/��QF\\\0v;@;��T\�/�\�AA)Zu;@\�)9\'� /��\�{\�\�t;@;U�g$\"/�r1\�qt;@\"�\�<#/�%̴�s;@�qo~\�$/���\�Ĭs;@^emS<&/�~�<�r;@��]/M)/�N~�N�r;@:=\�Ƃ*/�\�0��r;@��\�SV+/�jP4`q;@6 B\\9+/�j���vp;@]�&�*/�l\�<*�o;@�l;m�(/�x_��o;@�30�&/�\"�4�n;@5_%�#/�3�p�an;@,�)$/�g��em;@�s\�\�q%/��/g�+l;@���2�&/���2SZk;@\�\�I\'/��{\�5Zj;@4`�_\'/��=	l\�i;@\�*�C3\'/�\�س\�2i;@�L2r&/�(�bd\�h;@��1��#/�j�WV�h;@f.py�!/�+\��h;@\��0{\�/�#�\�Jvh;@\�Χ�/��6qr�g;@$\�\�(�/��tF^f;@Z�N\�/��\�&�e;@�_w��/�Z� e;@\\!�\�/�R�\�\�d;@\r�\'�8/�\�&��d;@>{.S� /�2��d;@\�~��#/�\�\�~��d;@�x\r%/����=�d;@U\�z�)/�zod;@$���~+/��zܷZc;@�9�\0-/�\�O��nb;@$�\�;\�./�29�3La;@�\�\�1/��B�\�\�`;@�\��o^4/�\��Q�`;@�;2V�7/�c(\'\�U`;@!yv9/�\�p>?`;@�a�Q+</�=HO�C`;@!��=/��-u�\�_;@�\�\"�?/���)�D_;@�L\�*�A/�g_y��^;@��RAEE/���a];@\�\��R�I/�A��\�F\\;@7�~L/�\�ƃ-v[;@h�O/�\�.\���Z;@�;P�<R/��\�.4\�Q;@(F�\�q/�ϼv\�Q;@��Ƅ�s/�\Z�uT5Q;@�\�(�u/����[�O;@\�\�\�\"v/��mp�N;@\��w/�m\���{N;@\�9x&4y/�q<��N;@\"��u\�|/���C�N;@�m��\�~/����\�N;@{���/�8�-:YN;@AG�Z�/�G\�\��M;@�}�\�Ł/���K\�L;@\�x\"��/�o\�L;@W&�R?/�;n�\�tK;@ۣ7\�G~/�\npUJ;@IZ\��{/�\�>\�-WG;@*\�t��v/�+2: 	G;@\�\�\�u/��7�G;@x�q\�Zt/�QL\�\0G;@\�,	PSs/�\�2��F;@���-=r/�\�1�\�lF;@\�ܴ�q/����\��E;@\�\'G�p/��.ȖE;@M����o/��W zR2;@\��)\�.�/PR`\0;@��=\�\�.�$a\�N�:@%\��\�\�.�%\�\�\��:@�8\'0\�.��֥F\��:@�?����.��@I�\0;@��E\�T�.�_�L\0;@*�~��.�oe�\�2�:@\�X\�׷.�6\�,\�:@A�M�G�.����(	\�:@\�\�[�.�\��iܛ�:@�0��.��^)˘:@��ŋ��.�mY�.\�:@\�AB�/�.�\��i\�[:@�D/�X�.�+1\�J\":@�h[͚.��\�\��:@\�w��D�.�臭���9@��V���.�\�)��\�9@��\�Y��.��\��\\4�9@�\�F\��.�l\\��9@�P\��.��R�ZQ9@�\"�ng�.��4�BT9@�#~\�\Z�.�\�h9\�CU9@�zO\�.���>�T9@7�\���w.�\�Sr3T9@ԛQ�Ur.�ޓ��ZS9@9�Z\�l.��d�Q9@h�_.�z\��W9@nQf�LR.�x%\�s}[9@�cyW=P.�h\���c^9@@x\�=L.�\�\�\�\�\�`9@}x� #H.���^�2e9@��W��E.�\�y�i9@l|&�\�I.��/�\�l9@��D.�\�\�\�\��l9@f0F$\n=.�ݔ�Z	m9@�Ø��2.�Q���Jk9@�/\�x�-.�c��\�\Zl9@D�в\�\'.�l��o9@,G\�@&.�-?p�\'t9@�u7O.�D\�1uWv9@���n/.��o\�v9@\�$\"��\0.��\�HK\�u9@yu�\��-�/2�Fv9@MK��F�-��?mT�w9@�(�A&�-�\�\�]\�w9@\�\�\�\�\�-�f�c]\�r9@Y�\�\0\�-�ND��n9@Z��U�\�-�ͫ:�n9@K�|%�\�-�T�4��m9@�@�m\�\�-���\n\�\�m9@��K���-�\�^zop9@���:\�-�l\���r9@\�p�{��-���\'Hls9@s�=A�-�\0�)U�t9@\�uS\�k�-���-@w9@�1��\�-��g\�K6z9@]P\�2�-��\��|9@>��-�8�\�L}9@/�ͮ�-�Q.�_x}9@M��\Z��-��dȱ�|9@\�\��/-��i�WV~9@)yu�y-��4�BX}9@�i\���q-�ʌ��^{9@(-\\Vak-�\�}��y9@$\�6�De-�\nfL�\Z{9@�g%��^-�J\�\�\�n}9@W#�\�2Z-��\�\�D�9@p\��U-���8G�9@�ng_yP-�Gq�::�9@�\�jeJ-�ip[[�9@h\\8�E-�U/�\�d�9@fJ\�o	@-�0�&�9@\�\�[\�;-��X32ȉ9@\�\Z��3-�\�`ũ֊9@�p�a�.-�4-�2\Z�9@E/�Xn)-�*�\�ŏ9@\�_!se(-�\����9@K���%-�>x\�҆�9@1\�f!-�%��9@\"��u\�-�\�\��9#�9@j�drj-�R�\��9@�߼8�-�T�<\�9@�	0,-�S\�\��\"1:@\r9��!<-���dV\�0:@����O>-�\�Y-�\�0:@�/ע@-�I�+�0:@o\rl�`A-�Sv�A]0:@^�o%C-�,�\�0:@iƢ\�D-���c��/:@F\�=�\�F-�,H3M/:@\��\�K-��(��/:@\�`6�M-���\�s�0:@5a�\�O-�0�Qd�1:@�\�\rP-�}zlˀ3:@nē\�\�P-�R\�\��T5:@�!��uP-�&9{6:@Ę��RP-�`\�U,~7:@���\�P-�E�<�8:@�	�\�P-�eo)\�9:@@KW��P-��Ɍ��::@�r�9>R-��X\"�;:@\�,\�T-�Tƿϸ<:@(�rU-�����}=:@\�^}<�U-�C9ѮB>:@\Z��\�AV-�a3�\�>:@T^-W-�L<�?:@\�\�ĭ�X-��^�sa@:@��[;QZ-��\�0\�A:@\��S\�[-�T���rA:@u\�b�T\\-�Oyt#,B:@J��%�\\-�\�\�g#C:@J�U\�\\-��\�>V�C:@l\ndv]-�x��\�\�D:@(�N>]-�@�\�\�vE:@W\�\�m]-�[^�\�6G:@�\�\�^-����5H:@�Z�\Z�_-����}I:@Է\�\�`-�e\ZMJ:@h�b-�ⱟ\�RL:@v5y\�b-�/�XniM:@�h[\�b-�\Z�\�6N:@M1AGc-�\�	�O:@F�7�c-�;\�Ԗ:P:@\����e-�\�z�2QP:@�cZ�\�f-��)WP:@\��\�\�i-�\�5w��P:@]�gA(o-��ba��R:@h\�ejt-�\�/�\�S:@lˀ��t-����\�U:@�ϸp t-��\�\�V:@,\�p�{r-�2˞6W:@�\�7\�\�p-�w�NytW:@\"4��\�o-�r�t��[:@�l\�l-���f�]:@�\�\0\�j-��\�qQ-^:@-z�\�i-��\"�-\�^:@��^�2i-��@�M�_:@崧\�h-��{�Y�`:@\��G�Cg-�Z�wga:@\�8��\0f-�i��a:@\�Q�\�c-�@�\�\�`:@��	�\�_-���\rN`:@\�\�\�EC^-��:�p\�_:@�a��\�\\-�\�ͨ�^:@i�-�W-���_:@*s�\�V-�IK\�\�_:@�\�x>R-���\�p<_:@ɏ�kP-���\�I�_:@\�\�!��N-�_\�lW\�_:@Z�!�[M-�g\�|�|`:@\0��qK-����=\�`:@\�%jJ-�\�X�a:@�\�t=I-�{�2Q�d:@\��\�\'+F-�؀qe:@�\�\0�E-�MK��Ff:@\�:]�C-�k\�\�uf:@\�\�@�B-�x\'�\�f:@\�c�\rA-����N@g:@����?-��RAE\�g:@\�e6\�<-��\�\�bh:@f��O;-�\�^(`;h:@dT8:-��L���h:@*��s8-��W\�\\i:@�u\��5-�ޭ,\�Yj:@voEb�2-�)x\n�Rk:@�R�r/0-�j�J>vk:@5|\�.-�ؚ��\�k:@`r�\�Z+-��S\�\�m:@�q�d�(-��9\�m\�m:@�#c��\'-�\�k]j�n:@����	\'-�a\�$\�o:@�}��\�%-��C�R�o:@D�3�$-���np:@�\�\�\�/#-��<�q:@�I~į -�\�\�\��q:@e\�F ^-�@�Z�kr:@z�I|-���oHs:@\�qn\�-�\�\�\�s:@\�|#�g-�F\�j�t:@Ǜ��-������u:@\��B-�n4��@v:@���L\Z-�.T���v:@0��-�fg\�;x:@����!-�W\n�\\\�x:@��\�-�A*Ŏ\�y:@�`��\�-�K\�X\�U{:@\��&�E-��]��a}:@\�`\"-����\'�~:@\��-�-�/�HM:@�\�\�-�xԘs�:@2��|-�Q0c\n�:@}�\��\�-��D�\���:@���e�-�2\"QhY�:@�HZ\�\r-�s�w���:@K�\��>-�bg\n��:@\���|\�\n-�j��\�ȃ:@QMI\�\�-�\��b\�Ń:@7߈\�Y-�\�\�m���:@G�(\r-�<��Ӹ�:@�~j�t-�Ӿ��:@�\�\��-�CƣT:@	Q�\0-���\���:@0e\���,�7�~�:@���>�,��j\�:@|�8c��,�8��\n*�:@EGr��,�ޫV&��:@��\����,�5%Y���:@D6�.6�,�eT\�݈:@\�\�W;��,�\�tYLl�:@���_�,�=b�܊:@\�(�\�P�,���u�X�:@\�\�y��,�.=�\�Ɍ:@\��i\�,��\�WW�:@Tȕz\�,��=B͐�:@�$�z�\�,�/�ͮ�:@-����\�,�\�z�I�:@���F\�,��$\�pt�:@�1\�\�\�,�\�\���:@i�\0�w\�,��K��:@�<\��\�\�,��O\�\�۔:@(`;�\�,��\�4\r�:@��O�\�\�,�\� \�hU�:@\�ݮ��\�,�[Ӽ\��:@#�\��\�,�\�\�\�;��:@�)Wx�\�,�\0\�Ȓ9�:@	\�%qV\�,�bf�\�(�:@\�S\�*\�,��x\r��:@\�\��%\�,�����*�:@�&OYM\�,����T��:@ߌ���\�,�\�\�B\�:@F;�I\�,��\�c�g�:@\��a\�,�RG\�\�Ȟ:@\�\�\�n\�,��>�\'I�:@=Զa\�,�q㊋�:@衶\r\�,���1v:@O\���\�,�\�(�\�:@�\ZO\�,��\� ���:@��\�5>\�,�yt#,*�:@��\�,�\�c\�ߧ:@����y\�,��\"���:@NA~6\�,��g�:@\'�o|\�\�,�3O�)��:@\�6p\�\�,�G�Z\�Q�:@\�?3�\�,���0a�:@\�o_\�\�,�E*�-�:@s�c��\�,�\�1�\�l�:@\�;�(A\�,�}w+�:@�L��~\�,�T8�T��:@�**\�,�֭��޿:@>?�\�,�Ll>�\r�:@%z\�r\�,�/�H�:@L\�1�=\�,�֧�\��:@ޮ��\�,�{�ю\�:@��n�\�,���\�C\�\�:@4iSu�\�,�ګ���\�:@���T\�,�D4��\�\�:@c*���\�,��\�`ũ\�:@x�\Z\�,��N\�:@\�U�\�\�,�%�}�e\�:@%]3�f\�,�\�:�\�:@�\�\��5\�,�<2V��\�:@(F�\�\�,��_\�\�\�:@�vj.7\�,�kծ	i\�:@i�\"�\�,�s۾G�\�:@D�3�\�,�MN\�S\�:@I\�\0O\�,�E�\�\�:@կt><\�,��ׂ\�\�:@��KTo\�,�{g�UI\�:@�\�	\�\�,�.\�Ue\�\�:@4���\�,��Ov3\�:@a�4\�,�\�v�\�:@؞Y�\�,��̕A\�:@�a\�\r�\�,�����\�\�:@\�K\Z�u\�,��j�j�\�:@�\ZKX\�,�0���h\�:@4J��%\�,�ǻ#c�\�:@�m��\�,�+j0\r\�:@\"o���\�,��\� v\�:@<FzQ\�,��d��\�:@!���\�,�^i��\�:@\�_\�+\�\�,��Z��\�:@#-��#\�,�Է\�\�\�:@`s�	\�,�D�M\�:@E|\�,����3�\�:@B#ظ�\�,�\r�~1[\�:@��il�\�,�u><K�\�:@;\�\r�\�,�\"S>U\�:@,cC7\�,�F\�~\�\�:@G\�g\�u\�,�\� ����:@\��K\�\�,�6�\�\n�:@�EИI\�,�q㊋�:@>�x\�,�m�IF\��:@5��\�,�s߉Y�:@{�\\�~,�!u;�\��:@l?\�\�|,��\�\riT�:@n�\�E�x,���vN��:@x^*6\�u,�l\\��\��:@)v4�s,��	.V\��:@��\�%\�r,�L�\nF%�:@\�{L�l,��\�	m�:@{��mmi,�\�\�\�0��:@���>e,�\�I}Y\��:@P\�\���a,�\�v/��:@m�^,���n\��:@�8��\�\\,�\�`6��:@\�\�O=Z,��\�\�\��:@\Z�h8eV,�n�\\p�:@\���}P,�\�\����:@<���N,�ka\�9�:@N\'\�\�rJ,�\��vKr�:@毐�2H,��9@0G�:@FaED,�.q\�\��:@�JC�B,��\�S9\��:@\�V*�@,�DmFA�:@c\n\�8�>,��F!ɬ�:@8���;,����e�:@�d\�,\�9,��\�{�E\�:@\�\�t!V7,����\�(\�:@\�\�\�B�1,�\�w~Q�\�:@�0�*-,�d�\�3�\�:@�X�O(,���S\�\0\�:@�e�YJ&,��ʉv\�:@\�*l� ,�j\�0\n�\�:@`!seP,�\Z\��lY\�:@\0��q,�8� \"5\�:@C�l\�,��4�B\�:@T��b�,�\�\�\\5\�:@9\�\�\�\�,���K\�:@���L,�<\�\r�\�:@��z\�\",�1@�	\�:@�GT�,�\�\�l�\�\�:@e���\r,�J�\��\�:@ zR&5,���$\�p\�:@�1zn	,�nڌ\�\�:@4ڪ$�,�-]�6\�\�:@�0\�,����\�q\�:@m\�\�]\�,�\�ډ��\�:@���,�\�\�\�(y\�:@)@̘,��n/i�\�:@�o�\�e,�;�\�u�\�:@�4\�\�o\0,�Ԛ\��\�:@uX\��+�\�5&\�\�:@�߼8��+��\�Ry\�:@=\nףp�+�.s�,&\�:@[��K��+��O�e\�:@�UJ\���+�DR%�\�:@}гY��+�����\�:@�\�#��+�+�\�p\�\�:@�/ע�+��Dׅ\�:@!�˛�+��o}Xo\�:@��\�T��+�\�Kp\�\�:@eo)\�\�+��͋_\�:@Ǻ��\�+�B�F��\�:@�!�\Z�\�+�\�ù�\�:@�\n\�\�\�\�+�]�z\�:@�\�\n(\�+��5\�;N\�:@l{�%9\�+�0\�r.\�:@\�\�.Q\�+�\0;7m\�\�:@ƾd\��\�+��0{\�v\�:@DN_\�\�\�+�Ί��>\�:@b��m�\�+�b�G\�:@\�\�l�\�\�+�f���\�:@\�8�\�\�+��\�&�\�:@��0\�+��$w\�D\�:@�\�\�V\�+�!ɬ\�\�\�:@${��!�+� %vmo\�:@|,}肺+��\�\�-\�\�:@6#�\�E�+�(\�4��:@3\�\�(�+�\�\0��F�:@VE�ɨ�+��2\���:@\\t�\�z�+�@Qٰ��:@\�y���+��\�O\��:@�m�R]�+�-	PS\��:@b����+�Ƌ�!r�:@7\��+��\�SV\��:@w��\�+�\�BW\"P�:@��\0�+��\�0|�:@8J^�c�+����j\�:@J����+�R*\�	�\�:@z\�\�\�+���i\�\�:@#/kb��+���F\�:@��\�\�;�+����Σ\�:@���+����\�:@������+��6qr�\�:@��N\�z�+���~\�:@\�fG�\�+�Fx{\�:@\�\�\�zi�+�N^d~\�:@\�X��L�+��\�&�\�:@Fy\�尋+��Z�[!\�:@�[�\�A�+��£�\�:@\�D\���+��\"h\�$\�:@qN`:}+�\��n,(\0;@\07�s+��\��=\�W;@\�\�\�dq+��i�:X;@Υ��\�s+��*8�X;@�**w+��\�(Y;@���1�x+���ŋ�Y;@�ʼU\�y+���\�\��Y;@\�	L�u{+�\'N\�w(Z;@�:�*}+�<�l\�Z;@���g~+��S�\Z�Y;@��\�Mb�+�\�/fKVY;@l_@/܁+�tѐ�(Y;@���̓+�0�[w�X;@L\��1�+�衶\r�X;@�\Z��+��\��ZX;@�7�\�w�+�-\n�(zX;@�\�D�+�ߥ\�%\�X;@*U�\�-�+�-Y;@�\��5�+�%=�NZ;@\��x�Z�+��o^��Z;@B>\�٬�+�\�\�4��Z;@a4+ۇ�+��|�F[;@\�\�Ŧ�+�D0.[;@\0�M�ܗ+��ю~[;@ޯ|��+�rP\�L[;@\n����+��\����^;@p�N\\��+�\�4\�Ry_;@`\�eM,�+�b�\�U�a;@ հ\��+�\�j{a;@�\�\�jH�+�\�1�\�`;@\�/\�\rۦ+�ͰQ\�ob;@T�\��+�G�tFb;@�4E�ӫ+��TN{Jb;@c`\��+��\�a0a;@E)!XU�+�\�u�Ba;@�X\�E\�+�1�Tm7a;@*T7�+�7T��7a;@�)��+�<\�y8a;@�x�0D�+�xe��a;@RD�U��+���x��a;@o�m�+�\�].\�;a;@\�{\�ʄ�+�;\�Ԗ:`;@�\�×�+�1\�\�PN`;@X���<\�+�A�\n�`;@�����\�+�i��֦a;@~�e�\�\�+�^-wb;@2\�\�Y\�+�\�(\�QGc;@4\��\��\�+���X�\�c;@JC�B\�+��Gߤid;@�\�;\�\�+�\���d;@\�L�x$\�+���KqUe;@y=�\�+�-�\\o�e;@6�~\�+�m\�)\�e;@\�F���\�+����;g;@���I\r\�+��m�g;@�~4�2\�+�y;\�i�g;@�\��B\�+� zR&5h;@�z\�\�\�+�\����>i;@�\��\Z\�+�N)��\�i;@\�L0�k\�+��W\�j;@y\�|\�+�]�`7lk;@\�;�\�~\�+���=�$l;@ٱ�\�\�+��\�sm;@\0Uܸ\�\�+�]��\�l;@5F\�j\�+�\�\�mnl;@q�\�d�\�+�\�tv28n;@~�<�\�+��[!�\�n;@�\�\�\��\�+�\����Tq;@\�֤\�\�+����\�q;@���\��\�+�\�=��jr;@.Ȗ\�\�\�+��R{ms;@�:�/K\�+��V\�\�\�t;@\�P�n\�+�A�,_�u;@\�6\�\�\�+�AJ\�\�\�v;@l!\�A	\�+��/h!w;@Y\�\�\�+�MK��v;@���j\�+�\�\�\�\�v;@Xᖏ�\�+�\�ĭ�x;@3Q�\�\�\�+��qR��x;@�\�\�u6\�+�m���y;@\�\�\�:�+�\�n�1|;@�X��+�c\�\�K\�};@y=��+�H�]\�\�};@�\�U�պ+���N\�z};@\'�O:��+��*\�3};@`�n�+�4�\�H|;@�ݒ��+�6�\�\�{;@�\�\��+�\'OYM\�{;@�g%���+���r\�{;@:\���+�M/1�\�{;@(\�\�h��+�e��\�\�{;@�9$�P�+��\�4�{;@ C\�*�+�\"4��\�{;@���2�+��E\'K�{;@ƈD�e�+�zpw\�n{;@\�\�\�c�+���\�p<{;@�Y�X�+�\���\r{;@�nض�+�u\�z;@�Ku�+�*��%\0{;@��ip�+��W<�H{;@�h\�x��+�̸��\�{;@*�Z^�+��6�\��|;@�u���+�F#�W<};@�Σ\���+��~31]�;@���>�+���9y��;@��\Zb�+�p�N\\��;@{�p̲�+�^��\�;@\�T����+�\�\��q��;@��\0�S�+��E(���;@\�3\�ۛ+�UK:\���;@*s�\�+��zk`��;@뫫��+�S$_	��;@\�C�|�+���ݰm�;@_Cp\\ƥ+�1[�*�;@��-�+�\�h��Ȋ;@9DܜJ�+�R\�>\�G�;@]�z\�+��\�.�;@�(	���+�=)�\Z�;@�Q�¢+��! _�;@�/����+�\�f��;@\�h\��+�K�b�;@�(�N�+�6\\䞮�;@\�ꫫ�+�	�/��;@+��+�\�6��;@w��N#�+�K�\�\�J�;@�2\Z���+�$\�@��;@\�g@��+��#D�;@����+�%\�/�;@E\�\��+�Q�?Û�;@��\�֌+�OWw,��;@��26t�+���\�\�;@tCSv��+�<���	�;@��3���+�]7��V�;@���+���8�~�;@�\�HK\�+�w�Nyt�;@u�\�&~+�e\ZM.Ƙ;@�DeÚz+�D\����;@_�\�?\�x+�t\�v�4�;@gE\�D�w+�\�bb�q�;@��y�Cv+���ᱟ�;@A,�9$u+�V-��;@�t{Is+�cAaP��;@��\r\rr+�(�r�w�;@�!��up+�\n+TT�;@��L�No+���sE)�;@:\�,B�m+���6Ę;@V\�1�j+�Ψ�*��;@�>\�h+�B�F���;@�U�P�g+��ba���;@;M�\rg+�gd���;@9(a�\�g+�$�����;@]lZ)j+�u/3l�;@�G7¢j+���dV\�;@��Zk+�Q\��&��;@�^\�Dk+�\��a�;@\�l�\�<k+�\�O\��0�;@	���k+�[\�a/�;@��~�\�j+�,����;@����i+�}��\r�;@zn�+h+���\�U֞;@\�mlv�Z+�H��\'��;@9(a�\�W+�X�vMH�;@\�G\�V+�\�&N\�w�;@��\�\�~T+�\�ξ� �;@t\�\�S+�X9�\�v�;@vöEQ+�c����;@�ng_yP+��+j�;@��]ؚM+�V�F�;@�**�J+�\�j��\�;@K�b�J+�ԁ��V�;@@�P�%O+��J\�^�;@\�\�ME*T+�\�w��;@/�>:uU+�t_\�l�;@�P\�\\�U+���;@-��\�V+���V|C�;@\�\�:�W+�{\�ᯱ;@�\�t=Y+�����;@}\���Y+�oK\�3�;@E�*k�Z+�2�Mc{�;@k+��\�[+�E��fֶ;@�~�x\�\\+�U�3�Y�;@=\�\�\�]+�\��z��;@H\�c\�C_+�y\���;@x%\�s}_+�/O犺;@�ݯ|_+���72��;@����_+�x}\�O�;@#�Ƥ_+�g�\��;@\nfL�\Z_+�\�\�8\�\�;@���_+�\�e�O7�;@\�;1\�\�`+�̶\�ֈ\�;@v\�[��`+��&ݖ\�\�;@��vN�`+�5\�|\�\�\�;@pΈ\�\�`+��\�	K<\�;@2t\�`+�v7Ou\�\�;@;M�\r_+�\�o�h�\�;@a\�\�L^+���5��\�;@įX\�E^+�Z��լ\�;@\�,	PS[+��\�(\�;@r7�֊V+��b�\�\�;@C=}�P+��\�p\�W\�;@G\�@�]N+���ʅ\�\�;@_\rP\ZjL+�g��}q\�;@���\�I+�ё\\�C\�;@\�1��8�+���8*7\�;@��\��+�\�5&\�\�;@�Ϲە+�\�?�d\�;@�����+�ʊ\�\�\0\�;@�ߘ+��$�z\�;@k�=&R�+�\��R�1\�;@\�P�[�+�\'/2�\�;@��aM�+�X�\�0_\�;@-\�i���+��\�-\�;@�\�\�%��+�a\�\�+\�;@\�y��+��z�Fw\�;@FCƣT�+�.Ȗ\�\�;@\�j���+���\�|\\\�;@�ۼqR�+�\�\�DR\�;@ �\��+��t\�;@\�F<\�ͬ+�^-w\�;@\�9\��+�5C�(^\�;@tE)!X�+��k�F=\�;@�6\�x�+��i\���\�;@8fٓ��+��)x\n\�;@������+�s��o\�;@�sa��+�\�|\\*\�;@���n/�+�40�&\�;@h\�,{�+��˵h\�;@z\�蹽+�\�\�S\�\�;@�>\�\��+�\\\�M\r4\�;@�KTo\r\�+�&�v��\�;@!�1\�\�+�;pΈ\�\�;@��^~�\�+�\�0\� \�;@\�\�\�e\�+�~\��\�\�\�;@I�Q\�+��MG\07\�;@L\�\�\�<\�+�\�\�uS\�\�;@6\�D.\�+�I��r\�\�;@���\��\�+���D��\�;@B�?�\�\�+�d> Й\�;@yv�\�\�+�g��}q\�;@�\n\�\�\�\�+�x\�=\\\�;@N��oD\�+���\�s\�\�;@w�$$\�\�+��\�\��;@)YNB\�\�+�z\�蹅�;@��]�9\�+��2\�FY�;@\'��@\�+�\�9\�}\��;@\�|~\�+��\�e1��;@�\�\�C\�\�+�Ts��P�;@y�\�\�+�K̳�V�;@x��,\�+���Gߤ�;@\�j,am\�+�G�Z\�Q�;@�\�\�\�/\�+�\�\�1\��;@���&�\�+�\�҇.��;@����Q\�+��R\�h�;@�n�H\�+�j���<�;@7P\��|\�+�ni5$\��;@\�k��\�+�O \���;@�J�({\�+�2U0*��;@}@�3i\�+��\�\�V\0<@̖��p\�+��+\��<@�_>Y1\�+�\�\�<@\�x\�@e\�+�\�\�m3<@\�|#�g\�+�\�8�<@\��;\�\�+�\�\�m4�<@횐\�\�+�%�9\�<@6�ڋh\�+��%Tpx	<@\0�#G:\�+��\�qQ-\n<@�UJ\��\�+�\�`ũ\�\n<@�\r1^�\�+�?\���<@�!�\Z�\�+�hv\�[�<@\��\�\r�\�+��9��\r<@E�\�\�+�\�\���W<@�\�i� \�+�\�\�nf�<@\�O9&\�+����}\�<@5\�\�\�+�܂���<@��|\�r\�+�f6\\<@cE\r�a\�+�\��p�<@y=�\�+��RE�<@.\Z2\�+���\�Xl<@���\�+��U��<@�� \�X\�+�\�g@�<@�\�\�h\�\�+����v�\Z<@�}\�\�+�m\�\�]<@\"O���\�+��ei�\�<@\�\�7\�\�+��\�ֈ` <@vq\r\�\�+���-=�\"<@�u\��\�+��~�x\�$<@\�س\�2\�+���,`\'<@FИI\�\�+�䞮\�X(<@X\�B\�_\�+���8G)<@[A\�\�+�:�w\�*<@�0\�q�\�+�,�-X*<@�,D�\�+�=��S�*<@�\\�\�$\�+���W+<@)=\�K�\�+�f�YJ�+<@�\�7i\Z\�+�j�t�,<@��T�\�+�d���\�,<@IddY�+�\�7�{\�5<@G;n�ݼ+�O�S\�{6<@M�\rO��+�D���@7<@U.T���+�\rnk\�7<@�iӼ+�A�G�:<@#K\�X޽+����<<@�g?RD�+��ѓ2=<@��gx��+�DԷ\�=<@�ן\�\�+����><@+��ݓ�+��\�\"R?<@�\�8�+���X�\�?<@\�(]��+�\�5w��@<@-���+��E\�n�A<@{�\�v��+�ZH�\��B<@z\�΅�+���	\�yC<@\�\�X\��+����g%E<@nLOX\��+�M�NϻE<@>%\�\�\�+�@Qٰ�F<@i\�+�0�\�mPG<@۾G��\�+�ρ\�H<@e��\�+�!\"5\�bJ<@B\�\�\�\�+�u\���K<@���_\�\�+�\�\r0�L<@�E���\�+�4��\�lM<@SAEկ\�+�\�I`sN<@KXc\'\�+��%!�N<@\0��q\�+�\n��b\�P<@\�(]��+��c�~Q<@��-�+��_�nS<@a����+�a2U0*U<@[C����+����\�U<@\Z\�\���+��lw�V<@\��_�+�B?S�[X<@�HV�+�\��F\�\\<@e�u\�+�M��(#^<@֍wG\�\�+�2�=B\�`<@0�\�mP\�+���g\�eb<@5\r�\�\�+�\�\�\�1c<@!\�\�*�\�+�t\�5=(d<@\�$��\�+��\�M�\�d<@�ެ�\�+�&\�\\R�e<@\�,^\�+�`\��f<@\�uS\�k\�+�\�\�H�g<@\�Vzm6\�+�I�[\�h<@}ZEh\�+�W\�\�\�xi<@�ݰmQ\�+��4F\�j<@&�v��\�+�\n��ak<@�-\�R\\\�+�䠄�n<@|~!\�+��@ Co<@\��9z\�+�\�\�nf�o<@�~\�~�\�+�\�y�p<@�H�<\�+�����Gq<@n½2o\�+�{�\�\�r<@tE)!X\�+�D��<�r<@\�f�\"\�+�\�PS\�s<@�\��\�+�6\��\�\�t<@a4+ۇ\�+�\�	L�uw<@u\��\�+�)H4y<@N\�=��\�+��\�^\'�y<@i�QH2\�+��\�{\�_{<@\�~K�\�+��ۼqR|<@�\�(ϼ\�+��\�W\\�<@��s\�f\�+�\�̯\�\0�<@o+�6\�+�D�\�\���<@\�/��\��+�\�\�5��<@�v����+�4�\��<@�9τ�+���-u��<@;�O\0�+�C=}��<@?�m�+��\'I\�L�<@�\�ۻ+�Ih˹�<@�m��+�,*\�t��<@]p��+��DK�<@\�6��+�\�E\�~�<@�\�t牷+�B`\�\�\"�<@��\�}��+�)\���Ɣ<@�Z�\Z��+�ٯ;\�y�<@uXᖷ+�\Z����<@oF\�Wɷ+�\�\�\��6�<@l\�V^�+�P)��<@\�.Q�5�+�c��\�\Z�<@1\n�Ƿ�+�\�{\r�q�<@^,�ӷ+�y\�ՏM�<@��\�+�+�\�(�\��<@�{�Y��+�:�!�<@N&nĸ+�\�����<@\�X�Ѹ+��im\Zۧ<@\�S\��+�u�BY�<@\�4\�8E�+�Pō[�<@�9Dܴ+�7��\�N�<@��ky\�+���,AF�<@ \�E\ne�+�\��QF\\�<@�\�\�-\�+�\�\�mn�<@?\�\�\�+�{�2Q��<@�>:u\�+���n��<@�֊6ǩ+��ۼqR�<@h����+��2��A�<@\�T\�#��+� zR&5�<@�\�WW�+�\��,�<@m�s��+�\�\�nf��<@i��\�+�,cC7��<@M!u;�+��,�ާ<@8\�ܘ��+��y9쾧<@�\�\�\�%�+�]3�f��<@p���ӕ+��|A�<@��։�+��U-\�(�<@\�CmF�+�u�(%�<@\\����+�zrM�̦<@1^�Ί+�`\���<@|C\�u�+��c!:�<@�4~ᕄ+����\���<@c%\�YI�+�\�\n�\�<@\�	\�\���+��W\�2ĥ<@�wcAa�+�W|C᳥<@\�\��\�~+�%�z�ۥ<@�j�j�z+�Y�\�\0�<@\�\�`obx+�\�\�u��<@4+ۇ�u+��@j�<@T�\�\��s+�E�ɨ2�<@q:q+�6\�\���<@�Cn�p+�0��ĩ<@;\Z��m+���\�I��<@v\�Kp\�k+�&qVDM�<@�\�\'�i+�K��<@\\\�J�g+�^�)ʥ�<@B@��\nf+�;�\��<@��c${d+�\�E��\\�<@���X�b+�~SX���<@\�ݮ��`+���j�j�<@Z��Z+�����.�<@\�MY+�l��+�<@S\�k%tW+�L\�[\�߲<@�Q<�U+�M1AG�<@\0!�T+�$0�ܳ<@�?�Z�S+�崧䜴<@�<i\�R+�w��N#�<@����9R+�\�]���<@�`�\�M+�L\�1�=�<@2��8*G+�2\0Ǟ�<@܁:\�\�E+�ǃ-v��<@�ȯbC+��wG\�j�<@�i�WV:+��f��}\�<@8�\�d�0+�\�\�7�{\�<@?�\�V.+��qm�\�<@U�\�-\�,+�\�I\�5�\�<@h[\�:\�++�p��\�$\�<@m��*+�an�r�\�<@�O0�)+����[\�<@f2\�g(+�q�\�\�<@\�j��\'+�i�\�\�\�<@qr�CQ +�qN`\�<@N��;P+��H�]\�<@~�Ɍ�+�p�x�0\�<@E���+�E�\�\�<@��P��+�{��&3\�<@\��\�\�\�+��g\�,\�<@�\'�.�+�n�\�\�<@�o}Xo+�\�\�a�\�<@ū�m+�(Hlw\�<@�b��\�+��e�\�a\�<@\�\�q\�+�z��Q�\�<@��\�W:+�\��\'�\�<@AEկt+�w��N#\�<@W\�\�\�x\r+�\�9}=\�<@���\�\�+�j3NCT�<@8/N|�+���W���<@\�%j+�n�2d�<@�P�\�+�\�}�u\��<@Y�oC��*�q\��s�<@H4�\"�*���L��<@w-!��*�^/M\��<@\�\�Sr�*�\�u6\��<@k�*�*���~�<@z����*��ٮ\��<@Lk\�\��*��\�\���<@!���*�Q����<@s�69�*�\��UG��<@£�#\��*�!\�A	3�<@�<�\\�*�\�^`V(�<@�Ӻ\rj\�*���	\�y�<@\�n�\�*��F�\0=@�\�}�u\�*�I�\�\�|\0=@�\'�\�9\�*�\�zj�=@U�	g�\�*�\�4=@�\�C�\�*�%\��}8=@\�6\�\�\�*��\�PMI=@-\�\�*�QۆQ=@n0\�a�\�*�\�W��=@�k\�}�\�*�Q�O\�I\n=@��D��\�*���\�Z�=@%���\�\�*���ȭ	=@ض(�A\�*�\�L��\Z=@-%\�I(\�*�\�\�f*\�=@�]ؚ�\�*�P\�\�\�\�=@;\�\r�\�*��f��}\r=@�O\0\�\�\�*��\�W:=@�ަ?�\�*�Ii6�\�=@d;\�O�\�*�L�Q\�=@	oB@\�*�|�Y�H=@m\�OT6\�*�e�<\r=@<��.\�*�˟o=@jhwH�*��\�ԕ\�=@\r\�-���*�\�\�|#�=@zo�*�E\�\ZJ=@�ѩ+�*�!\"5\�b\Z=@m��*�d#�\�=@�T�t<�*�Yk(�=@N^d~�*�,J	��=@\�\�W;��*�lxz�,=@�\�v�*��a�=@]ݱ\�&�*�ys�V{ =@�ѩ+�*�\�zj�!=@!\�K��*���J&#=@�(&o��*�d���$=@\\qqTn\�*�]n0\�a%=@�y9\�\�*����Y&=@\��L�\�*��WuV\'=@M�d�\�*���\rګ\'=@��\�\�W\�*��\�V�\�(=@�&�\�\�*�\r8K\�r*=@�WY\�\�*��-\�\�e,=@���U-\�*�/\�\�[<,=@�\0�6q\�*�\"\�\�T2,=@l���\�*��e�c],=@\�\��%\�*��\� ��,=@�\�67�\�*�Ɗ\ZL\�,=@:\�\�\�*��il�-=@�s�Lh\�*�e\���-=@0�\�mP\�*�6��\\.=@\�\n\��\Z\�*�IV�.=@\n�Rς\�*�>x\�҆/=@v\�\�S\�*�&\��p0=@��m�R\�*��\�p��0=@m\06 B\�*�]��m1=@���`\�*��\�\�1=@~��E}\�*�]1#�=4=@B\�\�\�\�*�p��\�4=@\�A��\�*�$F\�-t5=@)��R\�*�E7�6=@8��̒\�*�~9�]�7=@�\�8\�*����J8=@�|A	\�*��u��9=@G�ŧ\0\�*�-\�:=@l\�<*�\�*���\�%\�:=@��Ր�\�*��۠�[;=@7¢\"N\�*�i��\�><=@-@\�j\�*�\"3�<>=@u�)\�\�*�b�o?=@vQ��\�\�*�즔\�J@=@\�?�=\�*��\�\�A=@�ݰmQ\�*���ʡEB=@h?RD�\�*�B[Υ�B=@o��ܚ\�*�ep��:C=@f/\�N\�*�l#�	D=@܁:\��*� �O�D=@\�%�<�*�Z�!�[E=@\��,�*��sF��F=@u\�\�p�*�\�\�uS\�G=@\���ި�*����h\�H=@��ᱟ�*���tJ=@)B\�v��*��%9`WK=@\�oB!�*��\�҇.L=@tb\�c�*�~�u\�rL=@\��q�*�;�M=@�^���*�ΎT\��M=@k\�SUh�*��;�N=@\�L�\�\�*�\�Q�\�O=@�k�ȵ*��l�O=@\�6���*�����O=@]�\�$?�*�5��\�O=@��J\\ǰ*�4�\"1P=@�\�e�*�=ԶaP=@\�\�[�*�h\\W\�P=@܃�/�*��\'I\�LZ=@����\�*�{Nz\��Z=@#K\�*���)\"[=@Ec\�\�l�*��\�\�G[=@�\�\�l\�*�\�T\�#�[=@0�\�s�*�\�{�\�[=@\"5\�b��*� �8�@\\=@\�٬�\\�*��n�\�I]=@�\�U��*�1{\�v\�^=@��\���*��\�\�h\�_=@��o�N�*�\�F���b=@M2r��*�__\�Rc=@�2\��*�r�Pi\�d=@G�	1��*����\�e=@�ѫJ�*�\���Sf=@�\�}�u�*��`\�h=@�+ٱ�*��L�Jj=@��\�{*�*�\�\�G\�)k=@�n����*�)\�\�ql=@ND���*�4J��%m=@\�\�1˞*�U�W�n=@AJ\�\�ޞ*�a�rip=@Ͻ�K�*�TW>\��p=@\\9{g��*�k�ѯq=@\�R���*��혺+s=@CV�zN�*�B^&\�s=@��\0�6�*���.�t=@��@���*�B\�\�\�Du=@\�xwd��*���j�#v=@B\�!\�*�\�ɧw=@V�\�{�*�^=�1x=@��։�*��`��\�x=@����ӑ*�3\Z��\�y=@���ӝ�*��2�\�z=@�,g�*�9ѮB\�{=@A~6r݌*�R�GT|=@�\�\�.�*�\�]gC�}=@�e�\�a�*�u~=@���\�:�*�z�3M\�~=@�\��\�\r�*�\�ۃ�=@j���*��J�8�=@�\�!ƃ*��V����=@��++M�*�ɪ7�=@\�4\�8E*�*�t�=@]��ky}*�Lo.\Z�=@�\Z�{b}*�a�ri��=@��\�{*�X��V\�=@5\�\�o�x*��ݳ��=@C��gw*��;P�<�=@4�%v*��\rk*�=@p��\�$t*������=@\��ls*�v�X��=@K\0�)Ur*�\�T�G\�=@�k$	r*�J_9�=@�+��q*��b\r�=@�h[\�r*��>eč=@1{\�v\�r*�)x\n��=@2�#\�h*�\�2��=@��\�\�g*�\�}\�kϔ=@�1w-!g*�.���1�=@\�7>[g*�n�\\p�=@��P�Bh*�B͐*��=@� L�i*��h�\'�=@\�\�mk*��w�Go�=@t�\�Ym*�0du�\�=@l� [n*�N\�S[�=@�J�8�q*���\�A^�=@�y\0��r*�\nJ\�ʽ�=@\�D\��t*�d��\r�=@\�X�_\"v*���U��=@Hm\�\�v*�z9\�c�=@ʊ\�\�\0x*�\�z�G�=@\'i�x*�;\�O���=@�S\�{Fz*�\�	m9�=@�}\�Azz*�\�R$_	�=@\nh\"lxz*�m�s��=@����y*��H�H�=@�,&�x*�\n�<I�=@E����w*�\�\�\�#�=@+�� v*��!�\n�=@t��%u*��C�\�ݨ=@9}=_�t*�.s��=@	�nt*�Ό~4��=@\�\�W;�s*��ky\�z�=@\���r*�m:�Y�=@	q\�\�q*�\�5Z��=@*��\�\�q*�\�<G们=@lMK�t*���I���=@�� @�v*�s\�SrN�=@$C��gx*��z�=@�9>Z�y*���\rګ�=@F�Sw}*�@0G�߫=@��b��*��a����=@(��\�*�Z�\�Bs�=@P6\�\n*�����=@��\Zb~*����EҮ=@x\�-;\�*���Os�=@]�@��*�	�Į\��=@8i\Z̓*�h?RD��=@\�Ia\�\�*�;��=@7\0!�*�\��n��=@\�v��\Z�*��_>Y1�=@\�,{�*�\"��p�=@\�{F\"4�*�.9(a�=@�Ά�3�*�\��\�\�=@\�\�gy�*��&c`�=@A�m�*���n���=@*Ŏơ�*�K\�3��=@�\�8�*��p!�=@S\�\�%��*���|�\�=@?tA}˔*�V�@\�)�=@\�\'�\�Z�*�\�y�]��=@㈵��*����5�=@\�\���*��B�Y��=@+l� �*���-$�=@=Y���*�m�Yg|�=@T\���*�f��C�=@�(�\�/�*�4���=@\'�|��*��� \�=@�\�\0\��*�Rd��Ԧ=@t\n򳑫*�I��&¦=@*\�#��*�~p>u��=@\�i���*�\rra��=@\�O\�s\'�*�\�\�\���=@�HV�*�@�5_�=@}гY��*��V횤=@\�0X�*��J\��=@W#��*�\r\�\�\�[�=@X\�\\T�*�A����=@\�4�\\�*�~U.T��=@X\�\�\��*�]���2�=@y�ߢ��*��xy:W�=@\�eM,�*��?�Z��=@�\�	۵*��\�\�\�ٞ=@~�Ɍ��*�t&m�\�=@ƈD�e�*����RA�=@!\�A	3�*����y�=@5&\�\\R�*�N%@�=@o��\�T�*�[D�7�=@z�Cn��*�>\��\�d�=@��lu9�*�\�/��\�=@h\�\n�*�F\�=�Ӟ=@\��E��*��1\�樂=@~\�Az�\�*�>\�D��=@\�\�\�\�\�*�\�p;4,�=@G�q��\�*���U��=@���\�\�*�\��.ޏ�=@��9\�\�*�^gEԠ=@=_�\\6\�*���}\�[�=@��vۅ\�*�T;\�Ԗ�=@�\�+��\�*�֋��h�=@t\n�\�*��oC�פ=@fM,�\�*�ҩ+�\�=@�����\�*�E.8���=@��\�S\�*��%jj�=@*r��9\�*�YL��=@\�\0�&P\�*�\\�=셪=@.7\�\�*�I\�L�٪=@1\� O\�*���<���=@\"���\�\�*�iE,b�=@�\�2nj\�*�o�\�o\��=@�U\�p\�*����\�5�=@Xq��0\�*�<��Ӹ�=@\�\��%\�*�I/j���=@\�\��\�*��\��l�=@5D�\�*���W�ѱ=@�p�Qe\�*�U�q7��=@\��1�M\�*�y �H�=@e\�pu\0\�*��z���=@u����\�*�f�\�\\ô=@X��\Z\�*���eN��=@�\�1 {\�*�\�;�\�~�=@g~5\�*�\��Ye��=@��?8\�*�L�\��\�=@\Z�uT5\�*�\r34��=@�{\�5Z\�*��J�\���=@S\�\'�\�*�2ZGU�=@겘\�|\�*��+�`p�=@\��\�>\�*�9a\�hV\�=@\�\r�:�\�*�����\�=@K����\�*�=�\�\��\�=@�\r�W\�*�ux\�\�=@\�j+��\�*�o�\�=\�=@�Wt\�5\�*�$�@\�=@��3w\�*��J\�\�=@3\��O\�*�\�D�\n\�=@����\�*����ɍ\�=@\Z�\'�X\�*�\�\�;\�=@��\�\�\�*��\�ֈ`\�=@y\�ՏM\�*�:\�\�=@y\\T��\�*�$Di\�=@\�xͫ:\�*�o���\�=@\��/\�*�a\��p\�=@���=\�\0*���0\�=@�R\�hJ(�ǠB\�=@��%s<(�()�\0\�=@��\�\�\'(���2SZ\�=@\\=\'�o(���p�Q�=@U�W�(��\�p\�\��=@\�_Z\�\'(����-\n>@f��C(�\�`\Z��>@\"�4�0(�\�*\�]g>@\�j\�\�?(�*\�\�g\\>@�.�KRQ(��˛\�!>@��\�\�\�](�$~\�\Z.*>@�\�p<�i(��\�&N\�3>@\�=��jn(�\�gy\�=>@��=^Hw(��	ܺ�G>@\��M(D�(�*ŎơR>@2�\�̃(���W[>@�đ�(��d:tzf>@� �(�f�y��l>@̴�++�(�9\'0�v>@�W}�(��o\�>@կt><�(�\�;jL��>@N*\Zk�(��}W�>@\�2R\�\�(�Qi{>@�:�p\�(�Ym�_u|>@G8-x\��(����>@�}�\�)���`�>@�\�\�\�\0)�ٕ���>@�il�)��7�0�>@ș&l?))�\\[%X�>@uʣa9)�w\�\Z��>@k��\�H)�\�1�=B�>@M��EC)�1�\�c��>@oe�\�23)�:z�ަ�>@��\�R$?)��\�^f�>@vnڌ\�P)�?q\0�\�>@ \�o_V)��B�Y�\�>@�2��Al)��_>Y1�>@\�>Ȳ`z)���H���>@��)���\�\�\�>@p��1=�)�W\n�\\\�\�>@@�3iS�)�-$`ty�>@wd�6�\�)�\�\"�\�\�>@ux\�\�)� \��\�>@�4f\�)�Ϡ��\�>@�?N�0\�)�T\�\�$[\�>@�\�\���\�)�t�\�Y\�>@\�j{\�)�6\�\��>@\'3\�Vz\�)�;�/K;?@2Ƈ\�\�)�\�Y\�\�?@���\�\�)�MK��F?@\\\0qW�)���\�T�?@	���?*�\�\�8\r%?@�m�B<*��-?@e\�X*�.;\�?l5?@�\�9�)�x\'�??@߉Y/�\�)�%�}�eI?@���u�\�)�\���R?@\�\�9\�}�)�fN�\�\�Z?@\�\�?��)�!<\�8Z?@ƨk\�}\n*�\�.m8,Y?@�W�<\�*���\�U\�V?@KW��x\"*���b\\?@\�6�De3*�\�25	\�\\?@�pvk�4*��Z�\�]?@\�}͑5*�oG8-x]?@�RAE\�7*�\�聏]?@sJ_9*��\�	m]?@m���<*�S\\U�]]?@d\�\�A%>*��?\�,]?@JӠh@*�r75\�\\?@ݗ3\�B*��\�\n��\\?@��	ܺC*�仔�d\\?@��O�\�E*�\�_!se\\?@\�!S>M*��Fv�e\\?@�n/i�N*�\��Q�\\?@\�I\�5�O*�\�\�\�D]?@�T3k)P*��\'v�]?@���R*��,D��]?@��@�MU*��&ݖ\�]?@Q�\�ڦX*�.\�;1\�]?@>�h\�\�Y*�l\�\�TO^?@�\��-[*��\�1 {a?@8��+`*�� \�\�a?@\�\��9#b*�)_\�Bb?@:x&4Id*�L5��b?@\\\�J�g*�YLl>�a?@\�б�j*��\�;a?@\�b�0m*��!Y�`?@X9\�p*�:�\0U`?@o�$\�r*��\�\�t`?@[닄�t*�T9\�)9_?@�d73�y*����k\�^?@�\�\�W|*�֍wG^?@/0+\�~*�\�V�S^?@\�����*�vq\r\�]?@\�\�y7�*�KU�^?@��a���*�o��_?@\��-��*���3��`?@��(좈*�����`a?@\�\��6��*��\Z/\�$b?@\��/׊*��\\pc?@u\�yƾ�*�ⱟ\�Rd?@���*�0��d?@B�Ēr�*�(~��ke?@\��yS�*���b��e?@Z)r��*�ϼv\�e?@�y��C�*�`<���e?@i�\'�*�P�<�f?@�\��\�*�\�&�\�0f?@��nٙ*��\�\�v�f?@\�\�Hٚ*�\��\�wg?@�:\�\r�*�r1\�qh?@\�?2:�*�Ӥt{i?@\�Z��v�*�0EH\�j?@�@�*�1a4+\�k?@��b���*�\�A^&m?@�\���*��F\�g\�m?@��R{�*�\�\��{�n?@ϺFˁ�*�JV\�\�o?@��̒\0�*�~s��o?@\��-�*�\Z��\�o?@\�@�9w�*�\�;�\�~n?@*\���*��q\�\�m?@75\�|ν*�\�_{fm?@\��@�m�*�\�^\��l?@\"5\�b��*���+d�l?@\�Iط\�*�}\�.PRl?@\��\�]�\�*�\�o\n+l?@\��-]\�*�><K�l?@�\� �\�*����*4l?@QhY��\�*�+\��l?@\n��a\�*�I\�\�\�*m?@R�h\�*�W\�f�n?@ė�\"�\�*�(\�hr1n?@o���\�*���|�\�m?@�M+�@\�*��m?@\�\���\�*��V�9\�m?@${��!\�*�1е/l?@f/\�N[\�*�\�\�6\�j?@qt�\�\�*�np��i?@\�q\�\�\�*��C\�bh?@\"S>U\�*�3o\�u�f?@�Y2\�\�*��#�]Je?@*�Z^\�*���7�d?@e�\�2�\�*�}zlˀc?@�\�L�^\�*�m\�)\�a?@��_\�|\�*�]\�].\�_?@hwH1@\�*�d\�3�%_?@\�5w��\�*�E�4^?@\�L�:�\�*��ؙB\�]?@Rew��*��`7l[\\?@t}�*�Eb�\Z�Y?@K��\��*�\��UG�X?@���\\��*�O\�`��W?@\Z���)�*�\�<,\�V?@\ZQ\�|�*��\�H�U?@\�vhX��*�M-[\�T?@���I�*�` ��S?@��Z}�*�p�\'vR?@ɐc\��*�U\�\�\Z�Q?@=\'�o|�*�)yu�Q?@\�R\�{�*���E\�TP?@y\�ՏM+��)\�N?@+k�\�q	+�B\�%U\�M?@�F\�\n+��%\0��J?@5s��+����]/I?@�K�\n+�l{�%9H?@\�\��\n+�d \�.\�F?@*7QKs+��1k�E?@�hs�\�+��\0�S�D?@�\�j�=+�\'��>D?@^�S+�¦Σ\�C?@J�?��+��\nb�kC?@�ٮ\�+�_&��B?@vOj+���J\\\�@?@3SZK+��V\'g@?@�>$D+�{�p̲??@8���+�D0.??@(b\�+�\�s`9B>?@\0�ҥ!+���e�c=?@��:r�#+�G=D�;<?@�\�v��&+��\�:?@\�\�\"�++��\�{*�9?@��\n*�.+�ș&l?9?@���/+�4.\�6?@7n1?74+�<�2T\�4?@{�ю.+�x|{נ3?@�&�,+��\� ��0?@�&�5-+��F/?@�h\�^`.+�!<\�8.?@�\0m�Y/+���w�G+?@\�@�9w3+��dU��(?@|��6+��\�\�9\'?@_@/ܹ8+�\��ǚ%?@�ฌ�:+�J]2��$?@��A\�\"<+����&$?@o��=+���6T�#?@��y?+�2v\�Kp\"?@�.o\�B+�����!?@���#*D+�L\�\�\�<!?@�\�ϷE+��^~�\� ?@bf�\�(G+�+�\�	 ?@ByGK+�\�\�>9\n ?@��\\m\�N+���\� ?@��\�\�Q+�,�) ?@؀qU+��F��1 ?@��E`�W+���{� ?@���`[+�u!V�!?@��]+��(B\�v\"?@\�\�TO\�_+�m\�?3�#?@�\�.4\�a+�(+��$?@ݙ	�se+�<k�]h\"?@y\��\�eg+�\�\r��n!?@�I��	i+�&�fe� ?@�a���j+�g�ba� ?@Y�n\�m+�D?�{?@aO;�5q+��\�@-?@\��Bs+����(	?@\�\�}U.t+�Q�v0b?@)Z��u+�PR`L?@��I~\�w+��\��*�?@\�8EGry+�-x\�W�?@?��H�z+�\�J=B?@)^emS|+��dV\�p?@3�<Fy~+���@�?@Iط���+�IIC�?@xz�,C�+�&TpxA?@.���v�+�\�]gE?@K!�K�+�W$&�\�?@r����+�\�\0��z?@�\�%\�2�+���\�t\�?@��a�+���\"\�?@9^�\�I�+�&\0��*\r?@�}�p�+�!撪\�\n?@��Z`��+�1%�\�	?@����+�C=}�?@rѬ�+���X�\�?@_\\�\��+����9�?@P\�\����+����?@\�z�p̒+��,�?@\�(\�\r�+�j��\�\�?@Ŏơ~�+�\�\�u�?@KVE�ɘ+�e��\�\��>@8���+��Ǵ6��>@�<dʇ�+��ЕT�>@#M�<�+�\�X�yV�>@4\�i���+�\�oB!�>@\�\�`\�+��Ϲ\��>@�Ɍ���+�0��\��>@+��B�+�vq\r\��>@h[\�:�+��A\'��>@�r۾G�+�\��/g�>@\�d8�Ϩ+��wD�\��>@\�/���+�����	�>@�g���+�\�\�\�\��>@��4L�+������>@���b�+��\�{\�_�>@-C\�\�+��t�(%�>@\��\��+�\��v\��>@+�� �+��\�t=\��>@4�27�+��ĬC�>@=\�බ�+���z�>@7m\�i��+�q�\��>@x`\0\�C�+�$\�w~Q�>@E�\�Ӝ\�+�c)���>@��\�\�+�?\�,\�\�>@�ϝ`�\�+�::Z\�\�>@�]��a\�+�S$_	�\�>@ZGUD\�+�Tq\��\�>@�;Mf�\�+�\rU1�~\�>@\�(@\�\�+��b��\�>@�\�\�C\�+�|�y\�\�>@�\�PMI\�+��\�\r\�>@$C��g\�+�����/\�>@�:\�\�+�s�c��\�>@YiR\n�\�+�ڮ\�\�\�>@�I\�\�+�й\��\�\�>@c}�\�+�%\�\�\�\�>@H�\�ߠ\�+�\"\�\�3�>@X�5\�;\�+�)�1k>@=��\�+�}^�\�#>@\�Q��Z\�+��\�˙\�>@H¾�\�+��&\Z� >@%��\�}\�+��&ݖ\�!>@_�sa�\�+��D��\">@\�?O\�+�37߈\�%>@(d\�ml\�+�$����&>@\�\�K�\'\�+�\�_\�+\�\'>@fO�s�+�҉S\�(>@�BY���+��pY�\�(>@W\�\�\�x�+�E�\�(>@�5\\\��+��n��)>@�\�HL�+�*r��9)>@\���j�+�\�L\�T)>@B\�f\�\��+��8�@d)>@_9\���+�i�\0�w)>@�\�ۻ�+�:[@h=(>@�\�\�t\0,����G�(>@	Q�\0,�t_\�lW(>@dT8,���ѫ)>@y?n�|,�|)<hv)>@�	�s\r,�r�\�7)>@E\�\ZJ\�\r,�zm6Vb*>@`=\�[�,��Qԙ{,>@�ߡ(\�,���|г->@ő\"�,�L��O\�.>@`x%\�s,�Y\"��/>@2\0Ǟ,�\r��W\�0>@$}ZE ,�\�c\"�1>@;�p\�G\",�U�2\�2>@f�\�\n\",�\����\�4>@t	�\�\�!,�3j�J>6>@�t\�_�\",�lw\�}9>@g��&,�\�M�q\Z:>@�h�\"\',��&ݖ\�A>@\�\�)�\�*,�\�\�B\�A>@��ʆ5-,�¥c\�3F>@6Y��1,��h�hsH>@\��\�\�5,��/K;5O>@�\'��L,�gE\�DO>@֍wGN,��\r�WN>@�W}O,�cAN>@��^�sQ,�T\�{F\"P>@$d \�._,�<��.O>@���\�_,�\�?k~�M>@(�8\'`,�\�S\�M>@nh\�N?`,�`���\�K>@\�,{`,�+��$\�J>@\��/`,�4+ۇ�I>@͏���_,�6#�\�EH>@]�@�b,���g�\�G>@zpw\�nc,�\"\�k^\�E>@�?x\�e,�\"\�:�vE>@jM�f,�9\�E>@\�oBh,�\\Ɏ�@D>@Z_&j,�-�\�o�C>@V�a�j,��\�<C>@�\��-k,�KU�B>@T\Z1�\�k,�y7RB>@稣\�jl,�\�3\�?>@\�1��p,���\�t>>@qx�\�q,�K\�Բ=>@N\��q,�~!<\�<>@�ҥIr,����·;>@L6l�s,���e�\�9>@g)YNBy,��\�ZC�9>@�&3\�Vz,�\06 B\\9>@w�Ny|,�77�\',9>@�\��\�p},�\nJ\�ʽ8>@�켍\�~,���&��7>@\��-]�,��ЕT7>@i�,�1���6>@\'JB\"m�,��ܶ\�5>@$F\�-t�,�\�\��5>@r\�\�[�,�\�,^,5>@�3iSu�,�g`\�eM4>@�\"�~�,�\�\��3>@�\n��,���\�\�3>@}>ʈ�,�[�}3>@\�a0��,�\�G\�2>@\r�����,�P�mp2>@�ݰmQ�,��6�2>@�#d �,��2��\r0>@�i4��,�\�\�*�C/>@q㊋�,�:\�<c_.>@���,���Dg�->@\�ң���,�~R\�\��,>@\�n\�KS�,�\�\�m4�+>@j��\0ߝ,�m\�\�~�*>@��߃מ,�����*>@\�6\�^��,�yx\�\�)>@�\�p���,�\�\�v�)>@k\�\�u�,���Դ�)>@�I�Oǣ,��\"ڎ�\'>@BҧU��,�R��m\�&>@\0�~�:�,�\\!�\�&>@k�j�Ҩ,��Ku\'>@n0\�a��,�Z)r�\'>@\�D�<�,�l\�,	P\'>@\�\�\��,���B\�&>@��\Z��,���\�\�%>@�m���,��3�/.%>@���@�,�\�Ƃ $>@W�����,�s�69$>@���,���X�\�#>@g���,���T��#>@�l��\�,�\�\�\�=#>@v��\�/�,�\�\�G�\">@P÷�n�,�\\>��\">@\�8b->�,��lXSY >@*��s�,�\��i\�>@�G,�,�^K\�=>@\�o_\��,�\�O�}:>@3\�FY��,�ux\�>@�\�k��,����>@\�\�\�\�>�,�f\��>@*��s�,���\�U\�\Z>@�\�\�\�O�,��ǚ�A\Z>@(�N>=�,�[]N	�>@�*ø�,�\�\�V%>@��\0Q0�,�\�\�A%�>@\�\�x\"��,���9]>@�Q�y9�,�\\\�\�.�>@0�\'�,����tw>@O\�\�C�,��YJ��>@,�IEc�,�\�M\r4�>@\�\��q��,�Rd��\�>@&W��M�,�\���i�>@M��y\0\�,�7�h��>@�b��	\�,�\n\�y�>@a�4\�,�Y1\\\0>@\�{/�\�,�/6�>@�\n\�\�,�=�1X>@YLl>�\�,��m>@F\�\�\�\�\�,��il�>@�\nb�k\�,����6T>@}˜.�\�,�v\�!H>@\�vhX�\�,��X���>@<�\�~\�,�jN^d>@�Gp#e\�,��\�\�\n\r>@�\�\���\�,�]�,σ>@\�n\�KS\�,�m\�\�~�\n>@��d9	\�,�����	>@��7h�\�,�G	>@�\�Q\�\�,��\��>@�gs\�,�P��H�>@��_��\�,�mt\�Oq>@\���\�,�\ZPoF\�>@\�\0�&P\�,�\�I�\�\�>@���);\�,�\�Ry;\�>@�	ܺ�\�,�|c\0�>@Ƨ\0\��,���\"1A>@���\��,�K\�\�\��>@\\[%X�,�Zf��>@N{JΉ�,�\Z�K��>@S\�Q��,���\�n>@��D\��,�\\�-\�\�>@�ri�\��,�[(��\�>@z\�蹅�,��S\�\�>@�\�1�-�t�Lh�>@J��P�-�\�Gq>@\�;�2-�\�e�\�t>@;R}\�-���d�>@1[�*\�-�:w�^�>@XV���-�\�����>@m\Z\�kA-��\�p��\0>@�/ע-���C\0>@�\�a��-�Ov3��=@r�z�f	-�+�\�p\��=@���-�\�k�)\0>@!��\r-�:��K\0>@*1	-�:��K\0>@�\�F\��-�+�\�p\��=@i�\'�-�LK�=@\�\0�}�-�h\���c�=@��#*T-�ˆ5�E�=@�\��-�U�b\��=@k�)\0\�-��\�ފ\��=@\�R\�{-�$\����=@�%� -�\�)H�=@�xZ~\�\"-�\�]\���=@E�4~\�%-���ؖ�=@�\\��)-��VC\��=@p\"���+-��4Lk�=@xADj\�--��\�\�\��=@�r�0-�\�?�d�=@�$A�2-����6\��=@$\�\�S\04-�v?T\Z�=@;\�%85-�\�S�4��=@��\�s�8-�xF[�D�=@\�I}Y\�9-��H\�\0�=@R�h:-�Й����=@���\�g:-�:��K\0>@\�#\rnk;-�.�\�\0>@�ڥ\r�=-�|\�_��\0>@��\n\�>-�|\�_��\0>@\�Ɵ�l@-�:��K\0>@m\�\�~�B-�+�\�p\��=@\"rlE-���{h�=@\�\�aNH-�Cs�FZ�=@��$ΊH-�3��J�=@K:\��lJ-�\�\'c|��=@�\\�&�K-�dʇ�j�=@���\�K-��L���=@\�\�<�K-�d\�˻�=@�*Q��J-�]QJV�=@�j�	�I-��\�\��=@�\�i� I-�~;���=@�E�>I-�|\�ʄ_�=@6Y��I-�\"\�Q*\��=@�ԗ��J-��Z\�7\��=@\�\�LiM-��\\���=@���\�:P-�\�\�\�\�\��=@d~�$Q-��)�D/�=@\�0\�\�R-��/�\�L�=@\�\�^\�S-�D�!T��=@\�g��S-����z�=@\��I\'T-���\�\�\�=@\�[X7\�U-�p\��\�=@m<\�b�W-����\�B\�=@7Ou\�\�X-������\�=@��9\�X-�FA���\�=@�@��_X-�d�\r1\�=@/�\�wW-��ng_y\�=@��B�N-����W\�=@.=�\�\�L-�g~5\�=@���jO-�()�\0\�=@\�s��S-�M0�k�\�=@�J\�hU-�2uWv�\�=@9ѮB\�W-�0�1\"Q\�=@�\�s]Y-�>]ݱ\�\�=@G��R^[-�Y4��\�=@�8\�\�m\\-�@�\�\�v\�=@�����]-�kQL\�\�=@����^-��\�\�\�\�=@S8��_-�-�LN\�\�=@e\ZM.\�`-�̖��p\�=@E�\��Va-��\�\�\�\�=@\�\r��na-�&VF#�\�=@5%Y��c-�\�<��@\�=@Sͬ��d-�2\���\�=@@x\�=d-�&��\�=@�\n�7c-��\��\�=@��e�b-�\�\'i\�=@\�\�-\�c-��\�U�Z\�=@�aۢd-�\��9̗\�=@i:;e-�Ő�L\�\�=@q\�\�e-�\�Jvl\�=@\�<�f-�3nj��\�=@��nh-��\�5&\�=@g��ei-��\�KU\�=@��\�	k-���RAE\�=@\'�y�k-��<�r\�=@�\r\�\�l-�z\�\�\�\�=@�T���l-�n\�\�)\�=@�\���m-��\nF%u\�=@�\�(�n-�˄_\�\�\�=@8gDio-�\�\�WW\�=@�\�\�p-��\�\�\�\�=@!�1\�p-�=�- \�=@�\�+��p-���\�#F\�=@+��ݓo-�6\�e�s\�=@�v�n-��L�D��=@���^�m-�ѭ\����=@\�ڦx\\l-��-X��=@�\"ڎ�k-�\nܺ���=@�Ց#m-�հ\�\�=@��~�s-�\�Qڷ=@\�ܘ��t-�o+�6�=@ׅ�Ou-�\�\�u��=@X�5\�;v-���Wt\�=@gE\�D�w-�eq��\�=@\�\�\�+z-��\"�k�=@;\�%8}-����s�=@�<�r\�}-�`\"ĕ�=@�`<�~-��\r܁:�=@�̰Q\�-�1�Tm7�=@g���-�cԵ�>�=@{���-�\���oҨ=@�.\�\�[�-�~\Z�\�7�=@�\�H��-��\���=@��[��-�ePmp\"�=@�\�\�\��-���6T��=@Z��U��-�OZ���=@t\�׉-��jIG�=@�\�4��-���;۠=@8�W���-�\�8)\�{�=@i\�\�>��-���\�qn�=@H��0~�-��aK���=@��|�\�-�\�r.ŝ=@p�x��-��c�\�3�=@\��[��-�����=@�-�\\�-�+ٱ��=@/�HM��-�L5���=@</O\�-�\�k^\�Y�=@�(\�\�=�-��|A	�=@b����-�0c\n\�8�=@\�e��-�w�(��=@M���$�-�Eg�E(�=@�\�K7�-�?\�ܕ=@I�\\߇�-��O7P\��=@��\Z�D�-�\�3���=@z\�΅��-�#K\�X�=@��k��-�#K\�X�=@��l亡-�b����=@�,\�ģ-��i�=@�6��:�-�\'�;�=@W\�el�-�[��K��=@������-���q\�@�=@�FN��-��\�D-͍=@��\0\�-��Z\�̌=@���\04�-�����\�=@((E+��-� a�\�=@�TPQ��-�.s��=@���a�-�0\�\�Z\n�=@5\�\�-���1���=@\�磌��-�@7n1�=@\��0{ٞ-�\�\'i�=@<k�]h�-�a\�\�+e�=@R\r�=��-�ۿ�Ҥ�=@\�y�ȟ-��/���=@�b\�=�-�;\�O���=@�\0Q0c�-�)\�\�=@6w��\\�-�&\�\��=@Ӿ��z�-���;�B�=@�.o�-�_&��^=@7ǹM��-�78�\�>=@@ޫV&�-�Ki� =@�����-��B�\�=@h�.�K�-�|\'f��<@�:\�z�-��K����<@\�\�\�O��-��A\�\��<@h>\�n�-�|\�/�\�<@e����S.�[�*\�M\�<@�z�T.�2t\�\�<@N�\�\�\�S.�0�\�\\\�<@�`\�T.�\�{c\0\�<@\�˙\�\nU.��yȔ\�<@n��WU.�}!\��\�<@\�(�[ZU.�Q�_�\�<@�q\Z�\nW.��#~\�\Z\�<@.rOWW.�!u;�\�<@#��uW.�^J]2�\�<@)x\n�RW.�\�pt�\�\�<@��%s,W.�d\��u\�<@߇��(W.���};�\�<@=\�[�W.��+f��\�<@�l\\�V.�\Z�e3\�<@��\�h\0W.�s��\��<@\�K8�V.��sb\��<@�\�\�W.�2\"QhY�<@\�&\�+�V.�U/�\�d�<@f1���V.�\�$��ܽ<@{��&3V.�ˠ\�\�D�<@7¢\"NW.��T�-��<@�>$DY.���_#I�<@��aMeY.�t)�*��<@Ӽ\�Y.�T�J\�ï<@�fd��X.����Q�<@��kC\�X.�\�\�Xǭ<@b->�X.����ɍ�<@1$\'�Z.�bX9��<@ŭ�\�Z.�\�\\\���<@/\���Z.��W zR�<@ZJ��PZ.�΋_\��<@%Z�xZ.�R~R\��<@\�\�,�sZ.���B�<@ȕz�Z.�7�C�<@�L���\\.�&\��p�<@\�\�\�e[.�\�/��<@P\�\"�F.��G6W\�<@M.\��:F.�\0\�\��<@QO�?D.����·{<@P�,�C.�a�4\�\�w<@2k�M?.�}y�\�u<@��߆?.�ҌE\�\�i<@MJA��<.�.9(ab<@AJ�A.�\nh\"lx^<@�H�[?.�>�h]<@s���E.�y�t\�X<@M�J\�D.�`w��\�W<@�c�=	L.� 	�v]<@�#���O.��(\r5Z<@\���c\�S.�T8�T�U<@	4\�\�Q.�\'i�T<@7¢\"NW.�ϻ��0X<@7�A`\�X.�t�?PnW<@͔\�\�`.��\��n,T<@\�U��\�^.�Q��dVS<@-[닄f.�\�8\�\�\�V<@(��\�g.��%W��U<@���Xn.���q\�P<@ׅ�Om.�\"�\� >P<@__\�R#t.���hU<@5y\�j�v.�\�\�V`T<@\�@�\�|.�����Q<@�\�%�|.�\\\�tYLP<@\�\�ك.��!q��K<@\�=\�4a�.�{��\�H<@\�B���.�\�~��O<@Л�T�.��=�N<@m�\�͝.�	��YG<@�\�I�Ԡ.��\��k�F<@\Z1�\�c�.�\�\��q�A<@\�Yf��.�(F�̱@<@\�P��d�.�\�e6@<@��\�*l�.�D?�{?<@�7�0�.�\�\���><@�\�\nխ.�u\�\�p><@3�68�.�i�\0�w=<@#J{�/�.�\�<*�\�<<@\���6�.�M��E<<@��\�\�k�.�\�n�\�\\;<@�\�&2s�.�sHj�d:<@�\�E���.�L�;��9<@\�AB�/�.��h�\"7<@��1>̦.�sePmp6<@\"R\�.�.��`�5<@T���r�.�\�熦\�4<@�hs�ۤ.�\�T\�#�3<@�|$%=�.�G\�P�3<@ҍ����.�iSu�l2<@�|�y�.�\n\�\�0<@;�ީ��.��\\\Z��.<@Ę��R�.�\"\08�\�-<@����.�/j��\0+<@=}��.�_\�(\�)<@`\"ĕ�.�E|V(<@�ra�.�܂���\'<@\�OT6��.��[!�\�&<@@Pn\���.�c)��&<@t	4�.�g��e%<@��ؙB�.�=)�\Z\�$<@l]j�~�.��TPQ�#<@P�V\��.�:=\�\�\"<@wۅ\�:�.�\�)\�\�F\"<@R臭��.��!<@AaP�є.�G�ŧ <@?\0�M��.�_~�Ɍ<@\�F\�I�.�QN���<@�wD��.��\"�J <@e�9:�.�иp $<@T\0�gА.��6o�\Z<@8-x\�W�.�v28J^<@A�v�.�c��Ր<@f�O7P�.�z4Փ�<@-\�1�.�G\�\�\�<@p�\�ߍ.��jIG<@\�4}v��.��ϸp <@\�X�_\"�.��\�(<@�խ���.�E.8��<@�a��\�.��\�\��<@膦\��.�=\�\�\�\r<@\�D.8�.�Ƨ\0\�<@[A\��.���2\�<@��)\"�.�Ԟ�sb<@l�`q8�.�O!W\�	<@	�3��.����\�<@�up�7�.���\�C<@�x]��.�j�@+0<@\'�Ҩ�.��c\�Z<@0EH݆.���Τ<@\�8~��.����H\�\0<@QJVՃ.�\�\�9\�}�;@#\���.�Mg\'���;@S=���.�i�\�\��;@E��f֒.�aũ\�\��;@�2d��.�\r����;@쉮?�.�����/�;@D�.l͎.��dȱ�\�;@�\�̓k�.�\rnk\�\�;@���4c�.�����y\�;@�\�\��.��k\��\�;@hz��L�.�-B�4\�;@\�\�\"\���.�㈵�\�;@e\ZM.�.�Y��\�;@\����.��׻?\�;@E�\�\�&�.��I\�\�;@Bx�qĂ.�|\��\�\�;@߿yq�.�ra�r\�;@�\�\"�.��\����\�;@���\�z.�@�\�\�v\�;@ʨ2��y.�0\�\�Z\n\�;@Ǻ��x.�`\�+\�\�\�;@0�^|\�v.�\�\�bg\�;@V��Wy.���O�\�\�;@\�N\�\�{.�tB\�K\�;@F�6��.�Н`�u\�;@��<�.�|DL�$\�;@τ&�%�.�aq8�\�;@\�\�Z\�a�.�O\�\�\�N\�;@Sͬ��.���g\�\�;@�	g���.�1е/\�;@ڨN�.�Л�T\�;@��\�R�.�V�F\�;@}uU��.�o����\�;@���̎.�ʥ��\�;@�h㈵�.�9ѮB\�\�;@�b\r�.�ep��:\�;@}\����.�\�j,a\�;@z\�c�\�.�܀\�#\�;@\�\�\�(y�.�\�:�v\�\�;@OI��.��N@a\�;@�v0b��.�W>\��\�\�;@V��L�.��ҥI\�;@*p�\rܙ.��)��\�;@�ܚt[�.�.\�熦\�;@w,�IE�.��9�w\�\�;@*T7�.�',1607362055,1607362055,NULL,NULL),(2,'Copperbelt',_binary '\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0~��7�;@?q\0��(��+�`p�;@�����(��s�څ;@�\�=Δ(�\�2��;@�_x%ɓ(�5�u�;@\�!\�Q�(����$�;@�{��c�(��L��~�;@\Z�!���(�#�Ƥ�;@�d\0�\�(����);�;@%\�s}�(�R�r��;@*�=%\�(�5s���;@\��|zl�(�6Vb���;@\��\�\r��(�����%�;@?�\�\�ʇ(�;]���;@\�3h蟈(�B\�\�\�D�;@	2*�(�[\�a/�;@%\\\�#��(����3��;@_(`;�(�H4�\"�;@\�\\�(��g\�,�;@\�\�ID��(�\'�y�3�;@\�v�4E�(��QI���;@J\rm\06�(��P�f�;@�8�~߇(�ۇ�\�\�;@g\�R@ڇ(�ʍ\"k\r�;@�\�a��(�\��\����;@i��֦�(�J~įX�;@�\r\�\��(��m5\�;@�H�[�(��\ZI�p�;@z4Փ��(����屦;@5�u�(�I,)w��;@l{�%9�(�Mu��;@\�\�m���(��@I�;@�};��(�4�\�k\�;@�\�K�(�ݘ��ī;@i�\�+I�(����j׬;@_~�Ɍ�(�Mh�XR�;@M�\���(�m\Z\�kA�;@X:�%�(��\"�J �;@�w}欏(�\�\�(�[�;@�u�Ӎ(�@�P�%�;@qu\0\�]�(�!��\�;@LqU\�w�(�Xᖏ��;@��\�ݍ(�.t%շ;@\�QG\�Ր(��6�ُ�;@A�v�(�W_]��;@\�ahur�(�\�(]���;@2\0Tq\�(��\�\nս;@\�J\n,�(�:�\�H�;@D�;���(��\�g�;@L�K\�1�(�a�\�>��;@�˛õ�(��vٯ;�;@	8�*5�(��>e\��;@2r���(��ݰmQ\�;@:��K�(��۽\�\'\�;@�)�D/�(�`�o`r\�;@{\�ᯑ(�Z��լ\�;@\�N\�`��(�\�B\��\�;@\�T����(�K̳�V\�;@\�\�\�\�Z�(�,�\�\�;@\�yƾd�(��.9\�\�;@F�G��(�e�u\�;@�\\\�\�(�\r\�GĔ\�;@/\\sG�(�\�\��\�;@�?߆(��u��\�;@>\�^���(�K̳�V\�;@���\�_�(�B\���8\�;@��&OY�(�9�]�\�;@��a�Q�(�=HO�C\�;@2\�\�A(��+j\�;@��{ds}(����Rx\�;@\�0|D|(�\�	h\"l\�;@6\\�-{(�y]�`7\�;@�yUg�x(��\"�k\�;@�v1\�tw(��(\�\'�\�;@\�#��tv(�Yk(�\�;@!�Ju(�@3�\�\�;@\��jt(�M���$\�;@\��\�\�tq(���@�M\�;@��D�p(�g\'��\�\�;@w��\�q(��<I�f\�;@���\�r(�\07�\�;@\�HLPs(�\��%\�;@\�;p\�s(�}?q\0\�;@\�-��t(��\���\�;@\�\�WWu(�\�s|�8\�;@\n,�)w(�\��5w\�;@(}!\�w(�|_\\�\�\�;@̶\�ֈx(�wd�6�\�;@�\�lɪx(���n�\�;@k�\�P�x(�t&m�\�\�;@\�4}vx(�>]ݱ\�\�;@cAJx(��|^�\�\�;@\�\�w(�\��\�\�;@�?Û5x(��6U�\�\�;@X˝�`x(�E.8��\�;@\�4}vx(�8�0�\�;@9�⪲w(�f��\�\�;@B\�v��w(� F�6\�;@+��ݓw(��I+\�;@\�\�}rx(���T�t\�;@\�k�\�x(��\�<+i\�;@�Q\r�=y(�M.\��:\�;@X\�\��y(���y\�;@����z(�5B?S�\�;@\�\��mz(��?��i\�;@\�}�u\�z(�\�^I�\�;@X\�\\T{(����\�\�;@0��9\\{(�����\�;@��a|(�l%t�\�\�;@�k�\�}(�\�c�\�;@�Zd;(�j�*�\�;@C�=��(�\�\�t_\�;@Ͻ��(�P�\�5\�;@-�cyW�(����\�\r\�;@\�\�u6\�(�\�v/�\�;@�b�(�\�\��I\'\�;@,\�\�f*�(��2�\�\�;@}$%=�(��\��\r\�\�;@��ƽ��(�?\�ܵ��;@�̰Q�(���E\��;@�	\�OƐ(��j�	��;@ zR&5�(�\�G�Ȱ�;@x$(�(�\�\�D�k�;@��E`��(�NE*�-�;@kQLޘ(�\�\�\�\�\��;@�v5y�(��\�o\�D�;@NbX9�(��\�DJ��;@=\�!7Ý(�\�˻\��;@/�\�w�(��\�Ϸ�;@�%\���(�S\"�^F�;@U\��E	�(�@�#H��;@\�g���(���\�̓�;@�\�\'c|�(�\��\0k\��;@��\�%ƪ(�N�q\Z��;@40�&�(�\�r���;@���\�(�(�FA���;@~t\�\�g�(���TN�;@\�\�OV�(�v�e�\��;@\�t_δ(�.rOWw�;@]��ky�(���	�;@}�E�(��\�<��;@��N\�(��@��;@<g��(�֋��h�;@ٙB\�5�(�\"��\��;@\�\�\�D�(�0�\�{�;@�ο]��(�\�ID��;@Q��C��(�\��\���;@Z�\�!Ű(�\�\"���;@\Z3�z��(�{�%9`�;@��fڮ(�ǝ\����;@�|	�(��cϞ\��;@�6\�x�(�eު\�P�;@1\�0&�(�\�\���;@%A�\n�(�\�8�\��;@0/�>:�(��\�\�n�;@m�\���(�+hZbe\0<@y\��\�\�(�h���\0<@��ٮЯ(�\0kծ<@\�p\�Ws�(��/�\�L<@\�&N\�w�(�.II<@J����(�\�`\�$\�<@~T\�~�(�I�\�\�|<@�eo)�(�6<�R�<@p$\�`S�(�\��\�]�<@i\�G5\�(���A<@\�=yX�(���O�<@ܠ�[;�(�\�J=B	<@\Z4�Op�(�i\�\�i�	<@�y\0���(�j�TQ�\n<@�V\n��(�b�k_@<@\n�(z\�(�C�\r�<@���.5�(�)H4\r<@s/0+�(��4c\�t<@��2p�(��U��y<@�����(�_}<�\�<@��h�\'�(��\� v<@���.Ĳ(�\�h���<@s0�\0ò(�+�@.q<@� ��(��v���<@�mߣ��(�N\��1�<@��y\0��(�w�*2<@�P\�\\��(��^|\�<@\�7\��(�\�\0Pō<@TrN졽(�8-x\�W<@�����(�-%\�I(<@�<i\�\�(���wF[<@\\8�\�(�ʣaQ<@��&OY\�(�\�9x&4<@K��\�(���_><@�\Z�\'\�(�o/i�\�<@�}V�\�(��YO�\Z<@�|\�.P\�(�j�drj<@Um7�7\�(��6T��<@����\�(���\�Q<@&�L1\�(�5\�\�o�<@hwH1@\�(��}V�)<@I�\�\�\�(�c��\�<@��\�{*\�(�\�tv28<@Ɗ\ZL\�\�(�P�}:<@K\0�)\�(��5��W <@%Ί��\�(���C5%!<@gaO;�\�(�]\��!<@B\n�B�\�(���\�\�\"<@���\�(����\�\"<@l�F=D\�(�D�+g#<@\�?�Ŋ\�(�\�X\�U$<@�\�D\�(��	.V\�$<@_^�}t\�(��y\�):&<@��Դ�\�(�\n��b\�$<@�F\�(� \�\�Ud$<@�\�e\�\�(�w�*2:$<@\�v�\�(�:[@h=$<@�\��\Z\�(�!sePm$<@B$C��\�(�}�$<@Ui�k|\�(�\�س\�2%<@\�S\�q\�(��Z`��(<@i\�ai\�\�(���N])<@8>[\�(�\�w(\n�)<@J^�c@\�(�I��Z�*<@T�\�\��\�(�u�\�*<@�Rx\�\�\�(�lxz�,+<@\�\�\�Z\��(�-�\�o�+<@�2\�F�(�{�f�l,<@P�i4�(�:\�-<@\�ͨ�*�(��/\�x�-<@u��OU�(�Y\�E\�\�.<@c��\��(�.t%\�/<@nLOX\��(�^=�10<@H��\'�\�(�U0*�0<@@j\'�\�(�Q-\"�\�/<@$��ŋ\�(�K����/<@;pΈ\�\�(�n\�\�)/<@l��\�\�\�(�\�\�%�\�.<@\�&�\�\�(�Dj\�\�4/<@\�H��r\�(���F>�0<@<0��\�(�K�b�2<@�\�K\Z�\�(�c�dU�3<@�����\�(�=�Е4<@�\�,\�(��(	��5<@�����\�(����f6<@1[�*\�\�(�/j��\07<@+/���\�(�\'���7<@�׻?\�(�!��8<@`�E\�\�(��H���8<@�K\�[\�\�(�:$�P29<@\�vhX�\�(�\"rl9<@Ul\�\�\�(�\�\��f\r:<@�y��C\�(�lzPP�:<@��1\�\�(��ۼqR<<@#�G\�(��\"�J =<@R�r�\�(��\�><@,\r���\�(�qqTn�><@���@\�(�\�r��?<@;n�\�t\�(�C\�up@<@\��ǚ\�(�3�PlA<@\�ʦ\\\�(�ظ�]�A<@1\�\�Z\�(�û\\\�wB<@�*��\�(�	�nD<@x�7N\n\�(��m��E<@צ��\�(�p(|�F<@P�<�\�(���\���F<@?��\�(�ʌ��^G<@�\�t\�\�(�\�d�<\rH<@\�t=\�u\�(�\�(yu�I<@\��n�\�(�\�g�\�K<@\�&�\�0\�(�w��\Z/M<@|\�o\�^\�(��\r\��M<@\����\�\�(��K⬈N<@Քd\�(���/O<@[&\��|\�(��U�0�O<@ȳ˷\�(��-\�lP<@!ɬ\�\�\�(�\�|@�3Q<@^��\�(�\�\��\�Q<@����\�(�*s�\�R<@PVW\�(���U�S<@?U�b\�(��\�0\� U<@{��\�`\�(��{�ԗU<@R�d=\�(�\��1%V<@x{�\�(��\�ң�V<@ǜg\�K\�(��tۈW<@n��\�(�\�v�W<@��J�\�\�(�L⬈�X<@5�\Z�\�(�{�\�v�X<@\�5v�\�\�(��\�1�Y<@|_\\�\�\�(�\�SWZ<@x�\'-\\\�(�.Ȗ\�\�Z<@�I\rm\0\�(��\�\�a\�[<@�\�|y\�(�2\�\�Y\\<@\�lɪ\�(�	Q�\\<@�p $\�(����q]<@\�N[#�\�(�m�^<@bhur�\�(��L1A_<@eQ\�E\�\�(�մ�i�_<@�\�mP�\�(��ϸp `<@؞Y�\�(�\��hq\�`<@�&�\�(��\�&�a<@Z���(�>\"�Db<@>ϟ6��(�((E+�b<@�L�\���(�p$\�`Sc<@\\�-\�\��(�-����c<@kb��\��(����\�d<@\�r���(�\0\�]��d<@G��t�(�2\�\��d<@\�a�\��(�����Ke<@WZF\�=�(��5�U�e<@�KR�b�(�1^�f<@H3Mg�(�\�\�^zg<@��W�<�(�:��\�`h<@h@�5�(�]�\�i<@Eׅ��(�.9\�j<@Wд\�\�\0)���5�j<@S��)��\�k<@��66;)�r\�j��l<@�\��Z\�)��V�9\�m<@\�O\�\�)�v��2Sn<@5C�(^)�}ԛQo<@�h8en)�\�M)��p<@E��S�)���b��q<@\�ؗl<)�g\n�\�\�q<@\�!\�Q\n)�&7��q<@tD�K�)�R�8�\�q<@&�(\�\�\r)�\�\�Mr<@Va3�)�\�\�\�r<@��\�qn)�X zR&q<@)\�\�)�\'�\nbp<@K��q�)�9\�\�o<@V�\�#)��a�o<@m�\�J�\Z)��\�\�h\�o<@�oD��)�~t\�\�gq<@���D)�\�\��Tr<@^��� )����1\�r<@\�CmF!)��B�Y�s<@�`\")��\���t<@�A\��v\")��0ҋ\�u<@YO��\")��Sȕzv<@7n1?7$)�.\�|��v<@h\\8�%)��X�\�y<@YNB\�))�\�KS8y<@;�*)�K�!q�y<@\���+)�Z�b+hz<@?tA}\�,)��в\�{<@[�\� �,)�\Z�!��{<@Z5\�\�+)�ɬ\�\�v|<@��.\�\�+)��Wy}<@~\�D�,)��s\n�}<@A�m-)�ę_\�~<@\�s`9B.)�yt#,*~<@�	ܺ�/)�J�O\�c~<@ \��0)����ο�<@3d��3)�J$\�\�(�<@x\�\�e5)����<@8fٓ�6)�\�@\�S��<@1�\�c�7)�i㈵��<@Di\�8)�:�`���<@\'��>8)�\�;F�<@)yu�9)�e\ZM�<@\npU:)�\\!�\��<@\�#F\�-<)�n/�<@\�3�c�=)�+\�]gC�<@ԙ{H�>)��ן\�\�<@��,\n�@)��\�L�^�<@oH�\'C)��YJ���<@\��D)�Ƣ\�\�d�<@zm6VbF)�q\�GR҇<@��U�@H)�NB\�!�<@\����I)�T\���<@�X\0K)����\'�<@n\�8)\�K)�\�3g}ʅ<@}��\rM)����Kq�<@��?8O)���	�<@v��$\�P)�\�%8���<@\0Tq\�S)��\�#0�<@}��\rU)�zQ�_�<@\�\�\�W)��7�\0�<@�\\��Y)��\�4��<@\�y��[)��;2V��<@O<g])��d�<@��\�B^)��:\�z�<@�6U�\�^)���G6W�<@�)t^c_)�F�7�<@�\��;�_)���Ft\�~<@\�H�+`)�\�7�-~<@\�!�aK_)��5\�|<@O��D\�^)�\��j|<@\�cx\�_)���:7mz<@�\�\�vh`)���։\�y<@LnYk`)�s���x<@\�B;�Y`)�	S�K\�w<@q\�Ws�`)�=\�[�w<@�U\�pa)�QN���v<@]\Z��Jb)�wٯ;\�u<@#�\�Jvd)�fKVE�u<@K���e)��\�.Q�u<@��\�\�g)��\��xu<@\�˻\�i)�\\�\�\�t<@ \nfL�j)���\�3.t<@��ZӼk)��I/�s<@\�>�̔n)�t\�\�s<@7�Ӂ�o)�jl��s<@\�25	\�p)�\Z�\�7Lt<@��J�\�r)��b��\�t<@x$(~t)�&\�`6u<@��Or�u)�J`s�u<@Pr�Mdv)�\�\� wv<@�OVWw)��J�\��v<@�\�Z&\�y)�s0�\0\�z<@^I�\\\�)�\�\�,z{<@?8�:V�)��h�\'�{<@&�\�:��)�҉S\�|<@	�v�)���e�~<@H�C�\�)����=z<@^��_�)��\�ډ��<@\"�\�`�)�>Z�1́<@3SZK�)�C9Ѯ�<@�1=a��)�>>!;o�<@\"P��H�)�FzQ��<@\�\�֏)��\�\�W�<@\���|�)���,��<@\�\�^�)�6!�1\�<@���)�\�\�\�\�Z�<@\�nIؕ)�\�\�4}�<@�Z��)�F{���<@�>\�)�\��b\�Ň<@x�\Z�)�\��F;n�<@\�+\�S�)�ǃ-v��<@ݗ3۝)�-\�B;��<@a�4\�͟)��\r�W�<@0b�\0��)�$��\�<@\�U�\��)�ߤiP4�<@J]2���)�����<@S��c$�)�\�K�<@\�t\�\�)�+j0\r�<@�ŏ1�)�t	�ފ<@hv\�[��)�3R臭�<@�@.q\�)�6<�R�<@\�q�Pi�)�\Zj�̊<@������)�\�G\�?�<@�\r�D�)�|��\�<@�\�p<��)�\Z\�1˞�<@ܡa1\�)�\�|?�<@��;ۼ)�\�rߍ<@\0Ǟ=�)�*X\�l:�<@ӟ�H�)���\�ȑ�<@\�/��\�)�_)\�ǎ<@,���\�)��S�<�<@\�;\�)��n.���<@�Bus�\�)�Lb�G�<@�N\�P\�\�)�<��\�ܐ<@��\n\�)��Ku�<@?��?4\�)�W�\�,��<@\�RB�\�)�;�O\0�<@\���\�\�\�)�&\�`6�<@�\�>Ȳ\�)�\Z4�Op�<@K����\�)�D�l\���<@\��9z\�)�\Z�\�6�<@^��\�)�\ZM.\���<@32\�]��)�9*7QK�<@\�x`�)����ڧ�<@�o\��)�\Z\�\�A�<@ԛQ�)�4Lm���<@���\�l�)��\0�<@\�W�f,�)�2s�\�c�<@�8\�Z�)��̕A��<@�Sȕz�)�\�I`s�<@r \nf�)�\rU1�~�<@4-�2�)�F$\n-\�<@\��ǁ�)�zS�\nc�<@�Q\�\���)��\�\n(�<@�A�V��)�࠽�x�<@/\�\�Ҩ)�h\�\�5�<@&4I,)�)�\�wE�<@���4�)��8�Վ�<@�����)��j-\�B�<@�\�g�)�\"nN%�<@�)ͦ)�2\��z�<@\�\�\�V�)��|гY�<@�_�ǣ)�W�\"��<@(~��k�)�`W����<@Tƿϸ�)�f��!�<@\�PS\�)��\�\�\�<@�`TR\'�)�Q\��&��<@0�\�\\�)�z����<@{���)�0\�\�t�<@���\�;�)�l��+�<@\�$\���)�J��P��<@\��QF\\�)�\"���ӫ<@�\Z�{�)���0a�<@ß\�\�\Z�)�\rTƿϬ<@/��\�ǭ)�\�٬�\\�<@�v1\�t�)��d73�<@v�uŌ�)�\�\�1\�3�<@a\��p�)���[1�<@q\�ű)��\�k\��<@t&m�)��n�;2�<@n0\�a��)���\"2��<@i:;�)�w.���<@;�5Y��)�\�\�yT��<@��\�Z��)�\n��O��<@���U�)���K�<@�YJ���)�u�)ɶ<@\�_{f�)�\��?�<@�+J	��)�9\n�<@t�3��)�w/�\�Q�<@(�r��)��\�,\�\�<@\�\�N$�)�!�\�=@�<@H�m��\�)�Ze����<@�?�Z�\�)�t	��<@��m�R\�)��F\�\��<@�\��\�)�M���<@}��b\�)�\�s}�<@t\\�\�J\�)����&��<@��72�\�)�\�8�	��<@s�\�\�)������<@���[\�)�\'�\nb�<@sJ_\�)�\���v\��<@�\�\�)��\�NG�<@i��U\�)�P����<@�PoF\�)�*6\�u\��<@�)��\�)��\'�\��<@��D��\�)��O:�`\�<@,\�S\�\�)�\�\�L�\�<@~oӟ�\�)�%vmo�\�<@>�#d\�)�\�j�\�\�<@���\�\�\�)����f�\�<@N`:�\�)�Q\�\�\�\�<@\'�E\'K\�)�\�s\'\�\�<@��~�\�)�ΎT\��\�<@\r7\��\�\�)��IӠh\�<@\�_�5\�\�)��l�\�<@\��i\�\�)���.\�\�\�<@0G�\�\�\�)�,��A\�<@\r\�\�\�[\�)�׿\�3g\�<@-y�)��!�\�\�<@�d\�F �)��\�\�O\�<@,}\���)� \�\�W\�<@���J?�)�`<���\�<@�����)�\�}r \�<@�l��)�v\��ť\�<@\�{*�=�)�gG�\��\�<@gs�6*�c\0�=\�<@����=*�|ds\�<\�<@\�.�u�*�M1AG\�<@�e�\�*�6Φ#�\�<@\�z�V�*�8؛�\�<@�\� �r*�\'\���\�<@\�\�\�D\n*�8�\�w�\�<@Ւ�r0*�R���<\�<@��,\'�*��R	O\�<@g\��\r*���	.V\�<@�켍\�*����T\�<@�b��\�*� zR&5\�<@\�(\�\'*�\�)\�<@Ku/*�\'OYM\�\�<@\��B:<*�m<\�b�\�<@�3���*��Hi6�\�<@>^H��*��Xİ\�<@�I��4\Z*�\�{\�_�\�<@�\�zM*�)%�\�\�<@S>U�*��\�\�\�\�<@�L�\�\� *�n\�y\�<@wj.7\"*�c�dU�\�<@c\0�=#*�.v��2\�<@d!:�$*��\0�6q\�<@��\�\�%*�+\�MF�\�<@D�|�&*��\�6�h\�<@&Q/�4\'*�If��\�<@a���(*�Ec\�\�l\�<@^��)*���\�}�\�<@��\�i2+*�Ƣ\�\�d\�<@<\�\�\�,*���%!\�<@��m�-*�o�\�\\�\�<@3j�J>.*�� \"5\�\�<@�\\�gA0*�\�/o�\�<@\�\"���1*�7\�\�<@���3*�V�\�6o\�<@9`W��4*���u�\�<@��\�r�7*��l��\�\�<@�Tl\�\�8*��x�Z�\�<@,g:*�VW@\�<@\r�Q\�\�;*�1a4+\�\�<@0�AC�<*�\�r\�\�\�<@���\��=*��\�#�\�<@�\�@*��ӝ\'�\�<@=|�(BB*�h\�4�\�<@W{\�D*�C����\�<@�:\�F*�HĔH�\�<@\�\n��G*�4�\�\�<@\�2\�,%K*�c�\�*3\�<@�\�ڦxL*�f��\�\�<@�6\��M*��,&6\�<@�|�\��M*��\��G�\�<@A,�9$M*���s\�<@Ct	L*�C\���|\�<@�O9&�K*�\�\�!��\�<@^i��L*��Eж\�<@% &\�BN*�\�N\�\�<@�V_]P*�����\�<@\��:�R*�\�\�Đ�\�<@6��,\nS*���&OY\�<@\�\�\�\�R*�R\�\�\�<@\�%ǝ\�Q*���	�\�<@�)�TP*�,�)\�<@\�`�\�\nO*�c\�=y\�<@��\�\�N*�P�,�c\�<@]j�~�N*�5^�I\�<@^f\�(\�O*�Z�\r�\�\�<@B�F��Q*�� [�\�<@�ܙ	�S*�#�\�Jv\�<@ƿϸpX*�ǃ-v�\�<@�aK��Z*�0\�a�[\�<@�L\�\�]*��p]1\�<@�@��_`*��\�#\rn\�<@��n\�a*��\��\�\�<@�_?\�c*�\�:��\�<@\0\�4d*�5��\�\�<@3P�f*�_9\��\�<@\�\�\\QJh*�\�\�!\�<@^J]2�i*�d��S\�<@\�@�شj*�B\��v�\�<@��)X\�l*��w�~\�<@�s\r34n*��|A	\�<@i��q*��R�1�\�<@��Ά�s*�0��\�\�<@��뉮{*�֏M�#\�<@	Q��}*��S�\Z��<@�\�LL�*�TrN\��<@LS8��*�e��\��<@�\�.Q��*��\�|?5�<@\r;�ĝ*�ip[[x�<@�3\���*�\\W\��<@|��\�*�FzQ��<@�f���*��\�BW\"�<@�\�G�Ȩ*�ѐ�(��<@^\�\�-ɩ*�=�1X�<@h\�4��*�G\�I��<@F]k\�S�*�\�=\\r\��<@\�\�m4��*��{�\�\��<@c\�\�K�*�-\�(��<@8�\�w�*�L�;���<@H�C�\�*�/�Xni�<@H��0~�*�\�c�g^�<@�.�ļ*�q�::��<@x��,�*�f\�-��<@3�\���*�ڭe2�<@\rq��\��*�.W?6\��<@gF?\ZN�*�\�m4���<@�����*� A�c\��<@O\"¿\�*��+g\��<@*�~���*�)!XU/�<@,�j��*��U�&�<@��W�<�*�	T� ��<@\�\\R�ݼ*�[`����<@ܺ��:�*��VC\��<@JzZ��*�`\�U,~�<@?6ɏ��*���6T��<@\�M�Mӿ*�o\�j�<@\�~k\'J\�*�	m9��<@ɑ\��\�\�*�?6ɏ��<@�Y�\�!\�*�\�q5�+�<@	\���c\�*������<@�\�\�;�\�*�̙\�\n}�<@���\�*�B\'���<@����\�*��I��	�<@+�m��\�*���8*7�<@��[\�J\�*��tZ�A�<@=\�!7\�\�*�^�\�j�<@H��|�\�*�QۆQ=@n0\�a�\�*��\�PMI=@-\�\�*�%\��}8=@\�6\�\�\�*�\�4=@�\�C�\�*�\�zj�=@U�	g�\�*�I�\�\�|\0=@�\'�\�9\�*��F�\0=@�\�}�u\�*���	\�y�<@\�n�\�*�\�^`V(�<@�Ӻ\rj\�*�!\�A	3�<@�<�\\�*�\��UG��<@£�#\��*�Q����<@s�69�*��\�\���<@!���*��ٮ\��<@Lk\�\��*���~�<@z����*�\�u6\��<@k�*�*�^/M\��<@\�\�Sr�*���L��<@w-!��*�q\��s�<@H4�\"�*�\�}�u\��<@Y�oC��*�n�2d�<@�P�\�+���W���<@\�%j+�j3NCT�<@8/N|�+�\�9}=\�<@���\�\�+�w��N#\�<@W\�\�\�x\r+�\��\'�\�<@AEկt+�z��Q�\�<@��\�W:+��e�\�a\�<@\�\�q\�+�(Hlw\�<@�b��\�+�\�\�a�\�<@ū�m+�n�\�\�<@�o}Xo+��g\�,\�<@�\'�.�+�{��&3\�<@\��\�\�\�+�E�\�\�<@��P��+�p�x�0\�<@E���+��H�]\�<@~�Ɍ�+�qN`\�<@N��;P+�i�\�\�\�<@qr�CQ +�q�\�\�<@\�j��\'+����[\�<@f2\�g(+�an�r�\�<@�O0�)+�p��\�$\�<@m��*+�\�I\�5�\�<@h[\�:\�++��qm�\�<@U�\�-\�,+�\�\�7�{\�<@?�\�V.+��f��}\�<@8�\�d�0+��wG\�j�<@�i�WV:+�ǃ-v��<@�ȯbC+�2\0Ǟ�<@܁:\�\�E+�L\�1�=�<@2��8*G+�\�]���<@�`�\�M+�w��N#�<@����9R+�崧䜴<@�<i\�R+�$0�ܳ<@�?�Z�S+�M1AG�<@\0!�T+�L\�[\�߲<@�Q<�U+�l��+�<@S\�k%tW+�����.�<@\�MY+���j�j�<@Z��Z+�~SX���<@\�ݮ��`+�\�E��\\�<@���X�b+�;�\��<@��c${d+�^�)ʥ�<@B@��\nf+�K��<@\\\�J�g+�&qVDM�<@�\�\'�i+���\�I��<@v\�Kp\�k+�0��ĩ<@;\Z��m+�6\�\���<@�Cn�p+�E�ɨ2�<@q:q+��@j�<@T�\�\��s+�\�\�u��<@4+ۇ�u+�Y�\�\0�<@\�\�`obx+�%�z�ۥ<@�j�j�z+�W|C᳥<@\�\��\�~+��W\�2ĥ<@�wcAa�+�\�\n�\�<@\�	\�\���+����\���<@c%\�YI�+��c!:�<@�4~ᕄ+�`\���<@|C\�u�+�zrM�̦<@1^�Ί+�u�(%�<@\\����+��U-\�(�<@\�CmF�+��|A�<@��։�+�]3�f��<@p���ӕ+��y9쾧<@�\�\�\�%�+��,�ާ<@8\�ܘ��+�,cC7��<@M!u;�+�\�\�nf��<@i��\�+�\��,�<@m�s��+� zR&5�<@�\�WW�+��2��A�<@\�T\�#��+��ۼqR�<@h����+���n��<@�֊6ǩ+�{�2Q��<@�>:u\�+�\�\�mn�<@?\�\�\�+�\��QF\\�<@�\�\�-\�+���,AF�<@ \�E\ne�+�7��\�N�<@��ky\�+�Pō[�<@�9Dܴ+�u�BY�<@\�4\�8E�+��im\Zۧ<@\�S\��+�\�����<@\�X�Ѹ+�:�!�<@N&nĸ+�\�(�\��<@�{�Y��+�y\�ՏM�<@��\�+�+�\�{\r�q�<@^,�ӷ+�c��\�\Z�<@1\n�Ƿ�+�P)��<@\�.Q�5�+�\�\�\��6�<@l\�V^�+�\Z����<@oF\�Wɷ+�ٯ;\�y�<@uXᖷ+�)\���Ɣ<@�Z�\Z��+�B`\�\�\"�<@��\�}��+�\�E\�~�<@�\�t牷+��DK�<@\�6��+�,*\�t��<@]p��+�Ih˹�<@�m��+��\'I\�L�<@�\�ۻ+�C=}��<@?�m�+���-u��<@;�O\0�+�4�\��<@�9τ�+�\�\�5��<@�v����+�D�\�\���<@\�/��\��+�\�̯\�\0�<@o+�6\�+��\�W\\�<@��s\�f\�+��ۼqR|<@�\�(ϼ\�+��\�{\�_{<@\�~K�\�+��\�^\'�y<@i�QH2\�+�)H4y<@N\�=��\�+�\�	L�uw<@u\��\�+�6\��\�\�t<@a4+ۇ\�+�\�PS\�s<@�\��\�+�D��<�r<@\�f�\"\�+�{�\�\�r<@tE)!X\�+�����Gq<@n½2o\�+�\�y�p<@�H�<\�+�\�\�nf�o<@�~\�~�\�+��@ Co<@\��9z\�+�䠄�n<@|~!\�+�\n��ak<@�-\�R\\\�+��4F\�j<@&�v��\�+�W\�\�\�xi<@�ݰmQ\�+�I�[\�h<@}ZEh\�+�\�\�H�g<@\�Vzm6\�+�`\��f<@\�uS\�k\�+�&\�\\R�e<@\�,^\�+��\�M�\�d<@�ެ�\�+�t\�5=(d<@\�$��\�+�\�\�\�1c<@!\�\�*�\�+���g\�eb<@5\r�\�\�+�2�=B\�`<@0�\�mP\�+�M��(#^<@֍wG\�\�+�\��F\�\\<@e�u\�+�B?S�[X<@�HV�+��lw�V<@\��_�+����\�U<@\Z\�\���+�a2U0*U<@[C����+��_�nS<@a����+��c�~Q<@��-�+�\n��b\�P<@\�(]��+��%!�N<@\0��q\�+�\�I`sN<@KXc\'\�+�4��\�lM<@SAEկ\�+�\�\r0�L<@�E���\�+�u\���K<@���_\�\�+�!\"5\�bJ<@B\�\�\�\�+�ρ\�H<@e��\�+�0�\�mPG<@۾G��\�+�@Qٰ�F<@i\�+�M�NϻE<@>%\�\�\�+����g%E<@nLOX\��+���	\�yC<@\�\�X\��+�ZH�\��B<@z\�΅�+��E\�n�A<@{�\�v��+�\�5w��@<@-���+���X�\�?<@\�(]��+��\�\"R?<@�\�8�+����><@+��ݓ�+�DԷ\�=<@�ן\�\�+��ѓ2=<@��gx��+����<<@�g?RD�+�A�G�:<@#K\�X޽+�\rnk\�7<@�iӼ+�D���@7<@U.T���+�O�S\�{6<@M�\rO��+�\�7�{\�5<@G;n�ݼ+�d���\�,<@IddY�+�j�t�,<@��T�\�+�f�YJ�+<@�\�7i\Z\�+���W+<@)=\�K�\�+�=��S�*<@�\\�\�$\�+�,�-X*<@�,D�\�+�:�w\�*<@�0\�q�\�+���8G)<@[A\�\�+�䞮\�X(<@X\�B\�_\�+���,`\'<@FИI\�\�+��~�x\�$<@\�س\�2\�+���-=�\"<@�u\��\�+��\�ֈ` <@vq\r\�\�+��ei�\�<@\�\�7\�\�+�m\�\�]<@\"O���\�+����v�\Z<@�}\�\�+�\�g@�<@�\�\�h\�\�+��U��<@�� \�X\�+���\�Xl<@���\�+��RE�<@.\Z2\�+�\��p�<@y=�\�+�f6\\<@cE\r�a\�+�܂���<@��|\�r\�+����}\�<@5\�\�\�+�\�\�nf�<@\�O9&\�+�\�\���W<@�\�i� \�+��9��\r<@E�\�\�+�hv\�[�<@\��\�\r�\�+�?\���<@�!�\Z�\�+�\�`ũ\�\n<@�\r1^�\�+��\�qQ-\n<@�UJ\��\�+��%Tpx	<@\0�#G:\�+�%�9\�<@6�ڋh\�+�\�\�m4�<@횐\�\�+�\�8�<@\��;\�\�+�\�\�m3<@\�|#�g\�+�\�\�<@\�x\�@e\�+��+\��<@�_>Y1\�+��\�\�V\0<@̖��p\�+�2U0*��;@}@�3i\�+�O \���;@�J�({\�+�ni5$\��;@\�k��\�+�j���<�;@7P\��|\�+��R\�h�;@�n�H\�+�\�҇.��;@����Q\�+�\�\�1\��;@���&�\�+�G�Z\�Q�;@�\�\�\�/\�+���Gߤ�;@\�j,am\�+�K̳�V�;@x��,\�+�Ts��P�;@y�\�\�+��\�e1��;@�\�\�C\�\�+�\�9\�}\��;@\�|~\�+��2\�FY�;@\'��@\�+�z\�蹅�;@��]�9\�+��\�\��;@)YNB\�\�+���\�s\�\�;@w�$$\�\�+�x\�=\\\�;@N��oD\�+�g��}q\�;@�\n\�\�\�\�+�d> Й\�;@yv�\�\�+���D��\�;@B�?�\�\�+�I��r\�\�;@���\��\�+�\�\�uS\�\�;@6\�D.\�+��MG\07\�;@L\�\�\�<\�+�~\��\�\�\�;@I�Q\�+�\�0\� \�;@\�\�\�e\�+�;pΈ\�\�;@��^~�\�+�&�v��\�;@!�1\�\�+�\\\�M\r4\�;@�KTo\r\�+�\�\�S\�\�;@�>\�\��+��˵h\�;@z\�蹽+�40�&\�;@h\�,{�+�\�|\\*\�;@���n/�+�s��o\�;@�sa��+��)x\n\�;@������+��i\���\�;@8fٓ��+��k�F=\�;@�6\�x�+�5C�(^\�;@tE)!X�+�^-w\�;@\�9\��+��t\�;@\�F<\�ͬ+�\�\�DR\�;@ �\��+���\�|\\\�;@�ۼqR�+�.Ȗ\�\�;@\�j���+��z�Fw\�;@FCƣT�+�a\�\�+\�;@\�y��+��\�-\�;@�\�\�%��+�X�\�0_\�;@-\�i���+�\'/2�\�;@��aM�+�\��R�1\�;@\�P�[�+��$�z\�;@k�=&R�+�ʊ\�\�\0\�;@�ߘ+�\�?�d\�;@�����+�\�5&\�\�;@�Ϲە+���8*7\�;@��\��+�ё\\�C\�;@\�1��8�+�g��}q\�;@���\�I+���ʅ\�\�;@_\rP\ZjL+��\�p\�W\�;@G\�@�]N+��b�\�\�;@C=}�P+��\�(\�;@r7�֊V+�Z��լ\�;@\�,	PS[+���5��\�;@įX\�E^+�\�o�h�\�;@a\�\�L^+�v7Ou\�\�;@;M�\r_+��\�	K<\�;@2t\�`+�5\�|\�\�\�;@pΈ\�\�`+��&ݖ\�\�;@��vN�`+�̶\�ֈ\�;@v\�[��`+�\�e�O7�;@\�;1\�\�`+�\�\�8\�\�;@���_+�g�\��;@\nfL�\Z_+�x}\�O�;@#�Ƥ_+���72��;@����_+�/O犺;@�ݯ|_+�y\���;@x%\�s}_+�\��z��;@H\�c\�C_+�U�3�Y�;@=\�\�\�]+�E��fֶ;@�~�x\�\\+�2�Mc{�;@k+��\�[+�oK\�3�;@E�*k�Z+�����;@}\���Y+�{\�ᯱ;@�\�t=Y+���V|C�;@\�\�:�W+���;@-��\�V+�t_\�l�;@�P\�\\�U+�\�w��;@/�>:uU+��J\�^�;@\�\�ME*T+�ԁ��V�;@@�P�%O+�\�j��\�;@K�b�J+�V�F�;@�**�J+��+j�;@��]ؚM+�c����;@�ng_yP+�X9�\�v�;@vöEQ+�\�ξ� �;@t\�\�S+�\�&N\�w�;@��\�\�~T+�X�vMH�;@\�G\�V+�H��\'��;@9(a�\�W+���\�U֞;@\�mlv�Z+�}��\r�;@zn�+h+�,����;@����i+�[\�a/�;@��~�\�j+�\�O\��0�;@	���k+�\��a�;@\�l�\�<k+�Q\��&��;@�^\�Dk+���dV\�;@��Zk+�u/3l�;@�G7¢j+�$�����;@]lZ)j+�gd���;@9(a�\�g+��ba���;@;M�\rg+�B�F���;@�U�P�g+�Ψ�*��;@�>\�h+���6Ę;@V\�1�j+���sE)�;@:\�,B�m+�\n+TT�;@��L�No+�(�r�w�;@�!��up+�cAaP��;@��\r\rr+�V-��;@�t{Is+���ᱟ�;@A,�9$u+�\�bb�q�;@��y�Cv+�t\�v�4�;@gE\�D�w+�D\����;@_�\�?\�x+�e\ZM.Ƙ;@�DeÚz+�w�Nyt�;@u�\�&~+���8�~�;@�\�HK\�+�]7��V�;@���+�<���	�;@��3���+���\�\�;@tCSv��+�OWw,��;@��26t�+�Q�?Û�;@��\�֌+�%\�/�;@E\�\��+��#D�;@����+�$\�@��;@\�g@��+�K�\�\�J�;@�2\Z���+�\�6��;@w��N#�+�	�/��;@+��+�6\\䞮�;@\�ꫫ�+�K�b�;@�(�N�+�\�f��;@\�h\��+��! _�;@�/����+�=)�\Z�;@�Q�¢+��\�.�;@�(	���+�R\�>\�G�;@]�z\�+�\�h��Ȋ;@9DܜJ�+�1[�*�;@��-�+���ݰm�;@_Cp\\ƥ+�S$_	��;@\�C�|�+��zk`��;@뫫��+�UK:\���;@*s�\�+��E(���;@\�3\�ۛ+�\�\��q��;@��\0�S�+�^��\�;@\�T����+�p�N\\��;@{�p̲�+���9y��;@��\Zb�+��~31]�;@���>�+�F#�W<};@�Σ\���+��6�\��|;@�u���+�̸��\�{;@*�Z^�+��W<�H{;@�h\�x��+�*��%\0{;@��ip�+�u\�z;@�Ku�+�\���\r{;@�nض�+���\�p<{;@�Y�X�+�zpw\�n{;@\�\�\�c�+��E\'K�{;@ƈD�e�+�\"4��\�{;@���2�+��\�4�{;@ C\�*�+�e��\�\�{;@�9$�P�+�M/1�\�{;@(\�\�h��+���r\�{;@:\���+�\'OYM\�{;@�g%���+�6�\�\�{;@�\�\��+�4�\�H|;@�ݒ��+��*\�3};@`�n�+���N\�z};@\'�O:��+�H�]\�\�};@�\�U�պ+�c\�\�K\�};@y=��+�\�n�1|;@�X��+�m���y;@\�\�\�:�+��qR��x;@�\�\�u6\�+�\�ĭ�x;@3Q�\�\�\�+�\�\�\�\�v;@Xᖏ�\�+�MK��v;@���j\�+��/h!w;@Y\�\�\�+�AJ\�\�\�v;@l!\�A	\�+�A�,_�u;@\�6\�\�\�+��V\�\�\�t;@\�P�n\�+��R{ms;@�:�/K\�+�\�=��jr;@.Ȗ\�\�\�+����\�q;@���\��\�+�\����Tq;@\�֤\�\�+��[!�\�n;@�\�\�\��\�+�\�tv28n;@~�<�\�+�\�\�mnl;@q�\�d�\�+�]��\�l;@5F\�j\�+��\�sm;@\0Uܸ\�\�+���=�$l;@ٱ�\�\�+�]�`7lk;@\�;�\�~\�+��W\�j;@y\�|\�+�N)��\�i;@\�L0�k\�+�\����>i;@�\��\Z\�+� zR&5h;@�z\�\�\�+�y;\�i�g;@�\��B\�+��m�g;@�~4�2\�+����;g;@���I\r\�+�m\�)\�e;@\�F���\�+�-�\\o�e;@6�~\�+���KqUe;@y=�\�+�\���d;@\�L�x$\�+��Gߤid;@�\�;\�\�+���X�\�c;@JC�B\�+�\�(\�QGc;@4\��\��\�+�^-wb;@2\�\�Y\�+�i��֦a;@~�e�\�\�+�A�\n�`;@�����\�+�1\�\�PN`;@X���<\�+�;\�Ԗ:`;@�\�×�+�\�].\�;a;@\�{\�ʄ�+���x��a;@o�m�+�xe��a;@RD�U��+�<\�y8a;@�x�0D�+�7T��7a;@�)��+�1�Tm7a;@*T7�+�\�u�Ba;@�X\�E\�+��\�a0a;@E)!XU�+��TN{Jb;@c`\��+�G�tFb;@�4E�ӫ+�ͰQ\�ob;@T�\��+�\�1�\�`;@\�/\�\rۦ+�\�j{a;@�\�\�jH�+�b�\�U�a;@ հ\��+�\�4\�Ry_;@`\�eM,�+��\����^;@p�N\\��+�rP\�L[;@\n����+��ю~[;@ޯ|��+�D0.[;@\0�M�ܗ+��|�F[;@\�\�Ŧ�+�\�\�4��Z;@a4+ۇ�+��o^��Z;@B>\�٬�+�%=�NZ;@\��x�Z�+�-Y;@�\��5�+�ߥ\�%\�X;@*U�\�-�+�-\n�(zX;@�\�D�+��\��ZX;@�7�\�w�+�衶\r�X;@�\Z��+�0�[w�X;@L\��1�+�tѐ�(Y;@���̓+�\�/fKVY;@l_@/܁+��S�\Z�Y;@��\�Mb�+�<�l\�Z;@���g~+�\'N\�w(Z;@�:�*}+���\�\��Y;@\�	L�u{+���ŋ�Y;@�ʼU\�y+��\�(Y;@���1�x+��*8�X;@�**w+��i�:X;@Υ��\�s+��\��=\�W;@\�\�\�dq+�\��n,(\0;@\07�s+��\"h\�$\�:@qN`:}+�X\��C\�:@\�\�nf�{+�歺\�\�:@ۦx\\T{+�����\�:@�Nty+�B�p\�-\�:@�C5%Yw+�\�>9\n\�:@\�5�\�t+���\�A^\�:@\r�\'�8o+�\��/g\�:@�\�\�a�m+�l�p�\�\�:@\�kzPPj+�ǡ~�\�:@�?���h+���\�\�:@\�c�g^f+�2�g�\�:@�Ց#e+�-\�\�:@i��֦a+�(\r5\n\�:@J�i�W^+�\�|\�X�\�:@�Q�y9\\+�%\�\�ID\�:@ڨNZ+�eo)\�\�:@ ���W+�G\�g\�u\�:@��\�o\nS+�W횐\�\�:@ZH�\��6+�c`\�\�:@e���\\5+�\�\��\�:@�\�O\�1+�>B͐*\�:@�f,�\�.+��gs\�:@ۢ\��,+�d\�\�:@D�K�K�*�46<\�:@�^��*�5	ސF\�:@Mi�-�*�b��\��\�:@�+�\�E�*�\�~k\'\�:@�\���*��t\�_�\�:@}(\�*�^c��\�\�:@�6qr�\�*�M�\��\�:@j�*�\�*�.\���\�:@?�{�\�*��>�7j\�:@\r8K\�r\�*�1Xr\�:@/\�$\�*�\��X32\�:@i���2\�*�+1\�JZ\�:@mq�\�d\�*�\�\�\rM\�\�:@��߆\�*�\"�\�`\�:@\�#�&\�\�*��3iSu\�:@\�\��hq\�*�^=�1\�:@\�L�x$\�*���U�\�:@\��k\�\�*�P0�A\�:@��cZ�\�*�\��\�\�\�:@�\�C\0�*�\��E�\�:@3�p�a�*�.</\�:@\�DIH��*�y7R�:@K��\��*��f+/��:@U�=ϟ�*�Z��U��:@iUM�*�c{-\��:@�vi\�a�*�x�ܙ	�:@I�H��*�Y�\�\0�:@voEb��*�zq\��:@�\�\n}��*�K�����:@��\�*��J�(�:@�0��\�*���\�@�:@j�����*�T\�{F\"�:@�\0��*��\nҌE�:@B\n�B��*�\�\r\�e�:@?8�:V�*���ᱟ�:@�+g*�<�\�~�:@�-\�\�e�*��\�\�K�:@ɫs\�~*�\�i� \��:@\���\�\�|*�b�\�A�:@�9]{*�\�mr�:@�\0\�m\�x*��\��Z�:@j\���1v*��� \�>�:@\�\0�&Pt*�8�*5{�:@�\����p*�+mq�\��:@\n�]�n*�ĔH���:@<�\��rl*�_�2\��:@\�iO\�9i*����y�:@X�|[�d*���[��:@\�G\�)sc*��\��\�\��:@X�ۼa*�LQ.�_�:@�\\p_*�\�x�\'�:@2\�m�\�^*�\�<\0;@�t\"�T[*��x\���:@\�º�\�X*�E\�Ɵ�\0;@2˞6W*��\�r;@�^\�T*�\"\�k^\�;@��C�RS*�l\�\�C;@U��N�Q*�߇��(;@\\\0qWO*�\�3�;@Z\�\�M*�\�\�\�\��;@\�O�Y�K*�*\�J=;@<\�b�\�J*�>u�Rz;@]\��\'J*�D\�r�c;@�\�(�\�H*�o.��\';@\�\�rg&H*�z7	;@�ڊ�eG*��=Զ	;@\\W\�G*�u\�\n;@>\�D��F*�M�\�΢;@CV�zF*�K#f�y;@���\�IF*��a�\�\r;@�4�\ZF*�*8� ;@&7��E*�V-\�(;@|��8GE*�)v4�;@B�D*�\�O\�\�;@0��9\\C*���D�;@\�!\�QB*�JC�B;@vnڌ\�@*�\�\�\0��;@����?*�ʤ�6\0;@/�=*�)[$\�F;@�]M��:*�遏��;@N�E�8*�\�$��;@j2\�m�7*��\�\�\�;@EJ�y6*��B�Y�;@	]\�4*�n�l��;@3d��3*�)<hv\�;@��n\�1*�b/�;@>�\�@0*��\�W\\;@�<�-*�F��_;@k\�C4�+*�5z5@i;@���}\�)*�\�A%�c;@\�\�m��\'*�֫\�\�;@s��\�%*��\Z�4\�;@�3�\�k$*�\�b\�J;@0�[w#*��\�\�`;@�I�2\"*�{��;@��v\� *�	\�Vд;@a5��*���/\�x;@\r\�\�*�*\0\�3h;@b.�\�n\Z*��g͏�;@\�\�*���Gߤ;@�>�\'I*���\�R;@yu�\�*�kGq�:;@ڍ>\�*�����\�;@\�\Z���*���·g;@�S�\Z�	*�\��\�H;@�ю~*��Qew;@d\�\�A*���jQ;@Z��m\�*�?�\'I\�;@衶\r*�_�L�\Z;@��I\�\0*��fe��;@(�8\'\0*�\�\�)��:@��sE)\�)�Q3��\��:@�0�{�\�)�A\�\�\��:@�RB��\�)��P3��\�:@�\�C�\�)�?\�6�\�:@;ŪA�\�)�\0Uܸ\�\�:@b.�\�)��Pk�\�:@.\�\�H\�)����\�%\�:@�5�Ea\�)�h$B#\�\�:@���\�\�\�)�Mi�-\�:@�\�\�\�\�)�\�\��I\'\�:@�t><K\�)�ͰQ\�o\�:@u��\�a\�)�\�<0\�:@�[ A�\�)�\�sD�K\�:@�\�r��\�)��:\�\�:@	l\��3�)�=��S�\�:@+���ڿ)�=\�[�\�:@��\�!\�)��ky\�z\�:@��\�\�ý)���g�\�:@�ٮ\��)�\ZQ\�|\�:@\�O\�\�)���0\�:@�\�\�5�)��\Z�\�:@֧�ŵ)��\�ܴ\�:@~\�*O �)�w�\0ݗ\�:@�x\��)��w�\'-\�:@u \�կ)��h���\�:@75\�|έ)��`\��\�:@�	�8�)�2\�g@\�:@m\���{�)�?�Q�y\�:@\�\�̯\�)�sJ@L\�\�:@+��ݓ�)�\�>�̔\�:@<\�͌~�)�����\�\�:@�3ڪ$�)�<O<g\�:@L\�\�ݜ)�;S\�\�:@��;3�)�\�U�Z\�:@\n��a�)�X�%��\�:@t\�\�gy�)���8�d\�:@7P\��|�)��z\�\�\�:@/\�$�)�}\�.PR\�:@�Z	\�%�)� _B�\�:@�6\�Nx�)��E\�\�:@\\1е�)�\�\Z��\�:@��R{�)�Xc\'�\�:@,am���)�)<hv\�\�:@�\�j�=�)��X��\�:@�eN�ń)���5?�\�:@m\���{�)�\�!\�k\�:@��߃\�~)�y�	�5\�:@��\�n})���\�\�:@OZ��z)����E\�\�:@\�X\�Ux)��\�\�;�\�:@\�>rk\�u)�\�z�2Q\�:@}zlˀs)��~\�~�\�:@1	�p)�3�`\�:@q\�\�\�n)�TUh �\�:@��v1\�l)�D�;��\�:@�k)��\n*�~\�:@�@�ti)��D\�[\�\�:@��S�c)�\"\�Q*\�\�:@2v\�Kpb)�u\�\�p\�:@ŏ1w-a)���L/1\�:@\�1\0_)�~��\�\�:@e�<\r\\)�#\�dT\�:@��L�\�Y)�%Z�x\�:@Y\"��W)��V&�R\�:@�u��U)�\��[�\�:@[{S)�\��f\�:@:$�P2Q)�Y���\�\�:@�~�N)��Z��K\�:@\�n�M)�7\�\�\�:@u�BY�J)��z\�\�\�:@��D�I)��\�\�O\�:@\�\�\�CG)�>���\�:@��[�nC)����߆\�:@Mf���B)�� \\�\�:@Y�_\"\�B)����\�\�:@�H�\�\�B)�SB��^\�:@�KKC)�(��\Z\�:@衶\rC)�H6W\�s�:@$\n-\��A)��\�J�:@Y���\�@)�P����:@���\�?)�%Z�x�:@~Q��B?)��\�\�K�:@ڨN�>)�GXT\�\��:@\�o\�^}<)�*�TPQ�:@\�8�j�;)��X\�E\��:@���e:)�\�\�(]�:@&:\�,B9)�^���:@*�-98)�\�(\��:@#�~�\r6)�\��/\��:@&\��p4)��kЗ\��:@b�A\n�2)�\�\�m��:@�7�\00)���E;�:@B\�<�E.)�\�ó�:@\��|\�+)��`�.\��:@8�{\�5*)��\�o\�\��:@�����()��\�S�:@�^Cp\\&)�W\�Y\��:@~\�*O $)���\�\�X�:@\�\�,z�\")�x{��:@\�2nj�!)��\�n�U�:@\�0C\� )�\�A	3m�:@�ْU)�\�8F�G\0;@\�A�p\�)�\�#0�\0;@�Y\�>\�)�0b�\0�;@��]L3)��7�\�d;@��E\�n)�\�#�&\�;@�\0��)�\�-c};@�։\��\Z)�<p\��;@A\�)V\r\Z)�\�뤾,;@U0*�)�\�B�i\�;@\�Ȓ9�)����&�;@�\�m�)��`8\�0;@�>+)���D\�\�;@(�r)�\�\�\��r	;@\'�y�)��\�}��\n;@�Ѭl)�-\�\�a;@��-)�\�Đ�L;@F�6�)�&\�`6\r;@�:\�э)��`�un;@6�\�)��Ov3;@����)�b��\�\�;@=ڨN)�ĵ\�\�^;@���r\�)�x��\��;@\�bb�q\r)����Hh;@�|$%\r)�����+;@��)�\�%ǝ\�;@_y��\")�dZ�\��;@7߈\�Y)�\�qo~;@-&6\�)��\�Fu:;@�G\�z)��{H�\�;@Ӿ��z)���:r�;@�N�o)�\�R\��F;@!˂�?\n)��lV}�;@sd\��)���}\�A;@��\�\�)�#�3��;@\�J̳�)��.�.;@Um7�7)�\�2�g;@\�=\�4)�ٴR\�;@X:�%\0)�[\��Ye;@5��-<�(��j�#�;@��\�S�(��\�E�;@Û5x_�(�ڬ�\\m;@\�ֈ`�(�\���;@���G6�(�.rOWw;@r��	�(�\�T�];@�9\�ؗ�(�`;�O;@\\:\�<�(�\��g?R;@�\�-I�(�\�dT;@�	�\��(�7��\�N;@�X\��\�\�(�\�\�}U.;@G�`\�\�(��}\�\�;@ū�m\�(�=�\�\��;@b�qm�\�(�qs*;@&�\�[X\�(�>\�ɋ;@|�\�˙\�(�\�\�\�\�\�;@�$��\�(�� ;@>	l\��\�(��辜;@�l ]l\�(�\Z2�;@\�\�\�d\�(��ʅʿ;@�\�\�-\�\�(��\��\nD;@\��.�\�(���D\�\�;@\�7i\Z\�(�\�4�O;@�$@M-\�(��\�I��;@G�˵h\�(�W\n�\\\�;@+�\�	\�(�(\r5\n;@)\�\�\�(�;�ʃ�;@~p>u\�(����;@E\�[\��\�(�\n�s\r3;@Է\�\�\�(�@���;@DOʤ�\�(���S\�\0;@mW\�e\�(�:vP�;@^�\�(�K��F>;@��};\�(���\�z�;@KXc\�(�Ӄ�R�;@#K\�X\�\�(�R�b�;@\"6X8I\�(�\�(\�\';@�~l��(���w\�;@\'�_[�(�)H4;@���QI�(�\���\\�;@33333�(�\'�\�Q;@����ܹ(�\�\��;@I�Vѷ(��\�\��;@����(�x\�\�!;@�>���(�$�\�;\�;@毐��(�υ�^\�;@x\�\�!�(�\�xy;@�ƈD�(�oض(�1;@�|A	�(�J\rm\068;@��rf�(�\�je\�?;@�\���(�o�$\�B;@\�\�\���(�\�CVD;@\�\��\�(�����\�F;@�\�;jL�(�@0G�\�G;@k�j�Ҹ(�=Fy\�\�H;@{Cr2�(�S�1�#J;@	\�\���(�\�\�!��J;@�\�\�uS�(�DkE�K;@����\\�(�J\�o	�K;@]P\�2�(�o��\�K;@����(��ϸp L;@M�\�\�ƴ(�\�4�OL;@0�[w�(� 	�vM;@ F�6�(�\��}VM;@:�\0U�(�9)\�{�M;@&P6\�(�d�\r1N;@�\�B���(�W\�f�N;@��o\�4�(���\�V;@\�\Z-z�(�0+\�~Z;@a\\:\�(�r�d�P[;@Mg\'���(�5Lk\�\\;@+�\�	�(�h��d;@kGq�:�(�$���k;@\�.\��(��7�\�wl;@��\r��(�@3�\�l;@���\�}�(��\05�lm;@��\�K\Z�(�Ҩ�\�n;@׉\��\n�(�<p\��o;@2\�3/��(�+P��\�p;@\�-��ą(��O\�\�\�p;@N�\�\�P�(���i��q;@Qf�L2�(�8h�>r;@qTn��~(�l$	\�t;@�@�~(�W�\���t;@\r5\nIf}(��߆�u;@\�^}<�}(�\�ikD0v;@�s\�^(�M��(#v;@\"���(�{��v;@[A\��(�h\�\�5v;@�\��9�(�Tn��\�v;@\�P1\�߄(��mē\�x;@J�%r��(���켍y;@0��ā(��>U�z;@z��L��(��|гYy;@� L��(�~\Z�\�7x;@ |(�(�,e\�Xw;@i��(�5Sv;@\�\�e6�(���aMeu;@\�	��(��\�s��t;@�����(�\�ȳs;@`��-�(��!s;@F�G��(�v\�ݑ�r;@�X����(�B\�L��r;@��x軋(��C\�Ht;@H¾��(�E\���Ju;@��E\�(�@�ϝ`w;@^\�Y-��(�.W?6\�w;@-�\\o��(���\�߽w;@�={.S�(�A�ȓ�w;@\��`R|�(�hz��Lw;@�\�w��(�QL\�\03w;@\�[[%�(�иp $w;@\�SrN\�(��\�\�\�w;@q�;�(����\�tx;@\�F��(�ծ	i�y;@}?q\0�(��U�@\�y;@R<���(�\��3�Iz;@ۈ\'��(�Q�_�z;@�\�z�ю(�߈\�Y\�|;@P�<��(�y<-?p};@F\�=�ӎ(��ݰmQ~;@�:9Cq�(�`���\�;@�\�AB��(��릀;@\�6S!�(�\� >�\�;@����(�GW#;@��w�\'�(���)x~;@\��V	�(�\�C��<~;@m�\�<+�(��\�\0�};@�\���(�{��\�`|;@�q���(�!��\�{;@��kC�(���|;@/�\�w�(�|\�o\�^};@�0\���(��F\�g\�};@\�\\�mO�(���\��~;@�0e\�(�Xr�;@��ݒ�(�D3O�)�;@3\��(���:�;@.q\�Ț(�M��(#�;@�`\���(��Ϲ\���;@Z�\�\�И(�A.q䁄;@\�WXp�(�~��7�;@?q\0��(�',1607362055,1607362055,NULL,NULL),(3,'Eastern',_binary '\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0c\0\0h[\�:w@@v\����*�N\�=��v@@\�y�t�*��Ũk\�u@@\�\Z��ʕ*�bMeQ\�u@@���?�*��s\�v@@��YK�*�62;�v@@c\�\�\�*��)\�v@@7m\�i��*�|+\�v@@*\�\�F��*�\�\�\��v@@iUM�*�\���Nw@@(F�̱�*�\�\\5\�w@@Ԝ�\��*����5[w@@�\\��k�*�\�v��w@@�։\��*��\rN\�v@@\�\�P\�*�S#�3�v@@B\�\"LQ�*�\\Ǹ\�\�v@@Nd\���*�\�a�v@@x\�g��*����\�Bv@@�?��w�*��Ky v@@W[��\�*�M��(#v@@�/ע�*�\�\�ZDv@@~p>u��*�\r\�eOv@@_\rP\Zj�*�\��\�v@@U�G\�\��*�_%�v@@d�M*\Z\�*�wj.7v@@�\�	h\"\�*��J�8v@@����\�*�\�tYLlv@@<��k\�\�*�F`�o`v@@�v\��\�*��k�F=v@@\�\�H�\�*�@l\�\�Tu@@�A�۽\�*�T9\�)9u@@\�`obH\�*��71$\'u@@Xo\�\n\�\�*�R\�>\�Gu@@G>�x\�\�*��$>w�u@@�e�\�\�*��\�\�$xu@@mt\�Oq\�*�p|\�%u@@��-\�\�*�\�۟��t@@�@�m\�\�*�\�l�IFt@@s�ۄ{\�*��&P\�\"t@@\�bԵ�\�*�u\�\�pt@@��};�\�*�Z5\�\�s@@\�\� Z+\�*�t�s@@�I��{\�*��v1\�ts@@\�(�[Z\�*�[Ӽ\�s@@S�1�#\�*�4\�i��r@@2\�m�\�\�*�~\Z�\�7r@@�u7\�*���t��q@@$C��g\�*�vOjq@@*;��.\�*�`>Y1\\q@@#�\�\�*�>\�n\�Kq@@�y��C\�*��>�\'Iq@@Ɏ�@�\�*�b\�7�Wq@@�3��7\�*�+�6+q@@�ݭ,\�\�*�!\"5\�bp@@�W\�\�*�\�;��p@@\��\�\�\�*�tD�K�o@@k\�K\�\�*�M�\rOo@@�	0,\�*��RB��n@@�P�\�*�	�nn@@�\�\'+�\�*��*5{�m@@\'��\�K\�*��\�U�m@@\\���4\�*�l��\�\�k@@*\�t���*�mV}��l@@;:�Fv+�\�\�-i@@\����`+�,�\�\�h@@��!r�+�V\�pAh@@�\��=+�\�j\�\�g@@���Z+��a��mg@@u\"�T3+�\�K�\�f@@���+��h\�x�f@@&���+�\�x>\�e@@䠄��+��p�\�[e@@ZՒ�r+��]0�\�d@@,�PO+��g	2d@@: 	�v\Z+��{�\�\�c@@��y\0�+�h\"lxzc@@\�\��+�M��Ec@@e��+�d\\qqTb@@1Xr+�i\Z\�b@@DR%�+�AG�Z\�a@@��h\�x+�\�XP�a@@�f�8+�\�M\r4�a@@(\�\�G\�+���u�|a@@�&�\�d\"+�\�D�\n)a@@��\�$+�\�B\�\�\�`@@��\�t\�$+�\n�Rς`@@�)�\�%+�\r\�eO`@@��,�&+�J�\�_@@��S(+�\�)�n�_@@�o`r�(+��<\r$_@@v()�(+�5E�ӻ^@@L��T�(+��0(\�h^@@�o`r�(+�\Z\�v�]@@�6ǹM(+�j2\�m�]@@6�\�(+��2\�F]@@]�@�\'+�d\�\\@@}�|\�.(+�P���\\@@�}:3(+�Lb�G\\@@,��\�\'+�0g�+�[@@��\�,\�&+��2SZ[@@M��%+�\n\�O\��Z@@\�)��#+�9`W��Z@@�v\�#+���\�Z@@\�\�\�#+��ڥ\r�Y@@�a���\"+�wJ\��X@@%Z�x\"+�9CqǛX@@?n�|�\"+�+i\�7X@@#�-\�R$+�����9X@@\�9[@h%+�Iط�X@@5\�|\�\�&+�%vmo�X@@D��(+�\�*\�\�<X@@H�V\n)+�f���W@@\'�\�Q�++��}t\�\�W@@\r\�n�-+��$A�X@@\�/o�/+�\'�%\�\�W@@M�\�Ӏ1+�|G�	1W@@\'.\�+5+������V@@�A\�f\�7+�~��gV@@\�\�N$8+�-�\�VV@@�I�O\�;+�\�*l�V@@Ǜ��<+�S�K\�X@@�X�v=+����X@@\�Y�rL>+�\�7��\�X@@\�-II?+�h\�$\�Y@@]߇��@+�\�k�\�FY@@\"\08�\�A+����W�Y@@3�\�bbC+����Y@@0du�\�D+�bi\�G5Z@@\�\��E+�G\�I�[@@鹅�DH+�7�h��[@@&\0��*I+�Gɫs\\@@G\�&jI+��>�\�\�\\@@\�PMI\�I+�\�o&�]@@N�\��H+�8ӅX]@@�M�H+�]\�].\�]@@KxB�?I+�I*S\�A^@@v�+.�J+�.T���^@@vp�71L+��Ϛ_@@�i�WVJ+��`�d_@@\�rJ@LJ+���\�\�_@@��\�ׁK+�\"3�<`@@Q29�3L+���ôo`@@S�[\�J+��YJ��`@@�h�\�I+�Ks+�\�`@@�|A	H+�qvk�a@@�+-#�F+�\�=\�4aa@@\�\���F+��\�\�\Z�a@@\�8�\�F+�p��\�$b@@\����G+�\0VG�tb@@�3��7H+��Ƅ�Kd@@V�a�J+����d@@n\�8)\�K+����\n�d@@<\�͌~L+�ٕ��ze@@8�T�M+���c�\�e@@o�mN+�gaO;�e@@J\�o	�O+��D/�Xf@@%�z�\�Q+��$$\�6f@@m\�\�\�R+��·g	f@@,���T+��d\�,\�e@@\�3��U+��C�l\�e@@$��:W+���\�\��e@@sd\��X+��A\'�f@@��%Z+�0fKVEf@@4��[+�q�::�f@@�SW>\�[+�\\\�3\�?g@@]��\�\\+�䃞ͪg@@��\�\�]+��O�mh@@��\�ם^+���n/ih@@pA�,__+�\��\"�\�h@@\�\na5�`+�\�.m8,i@@\�\\5\�a+�\�0\'h�i@@\��Bc+���j@@��A�Vd+���\ZOj@@\�dT\�e+��|�R�j@@*s�\�f+�S\�\�.k@@�|A	h+�ʌ��^k@@��\�ܴi+�C;�Y�k@@\�,^,l+�}\�%\�k@@\�j��o+�N\��1�k@@\n��p+�v�ꭁk@@g�\�Rq+��J�(k@@P6\�\n\�r+��;\�\�j@@�\�ֈ`t+�RH2�wj@@,\�\�s+��!\�\�3j@@�WuVs+�q�5\�h@@��\��r+���֥h@@�h[\�r+�U\�Yh@@.v��2s+�|�O�h@@\�DR�s+�\��5\�eg@@�\�uu+�q\�\�\"g@@���v+����3\�f@@O=\�\�v+�kc섗f@@P9&��w+���\�Qf@@��\0z+��n�;2f@@�ǁW{+�\�\�}rf@@�\���|+�ۇ�\�\�e@@�\�\�}+�O#-��e@@�jׄ�~+����[e@@b�o+�\�^\��d@@��R�r+���D�d@@N�M\�g+�a\�xwdd@@e�z�F+�\�1 {�c@@LQ.�_�+�!���c@@\�\�\rMف+��i�\�c@@\ndv��+�\�)�n�c@@����\�+�1?74ec@@.t%Շ+�s\��Ac@@�5���+�~��k	c@@r\�_!�+���\�x\�b@@W����+�\��z�b@@\�\�\�%Ǎ+��(\�\r�b@@\�\n���+�e6\�$c@@DP5z5�+�_��c@@��7�+� {��\�c@@q8�9�+��G��\'d@@\��M�+�\��`R|d@@�\�tB�+�p�71$e@@q8�9�+���26te@@\�-W?6�+�?\ZN��e@@y�	�5�+�ʨ2��e@@U2\0Tq�+�}\�f@@��$wؔ+��\ncAf@@����1�+�B�Df@@�FZ*o�+���zg@@�Z(���+��z�\�{g@@3Mg\'�+�i8en�g@@�[\�J�+�h[\�:\�g@@�HLP×+�4�Y��g@@���\'��+����h@@\�\��\"��+�h\�ejh@@\�ǵ�b�+��\�\�L0h@@\�_�\��+�\r8K\�rh@@0��+�U�\��h@@c��Ց+�+N�fi@@�l�/�+�=�Еj@@Y\����+��\�s��j@@l>�\r�+���zO\�j@@�\�\��q�+�\�CmFk@@�IbI��+�[\'.\�+l@@\"R\�.�+�1��\�Cl@@Ѭl�+�CT\�\��l@@Q��r��+�� �bm@@���e��+����>n@@\�k\�,	�+�8�-:Yn@@n�2d�+�a�^Cpn@@+3����+��S;\�\�n@@\�\riT\��+�sL�o@@��\�a��+��@�to@@\�/-ꓜ+�T\Z1�\�o@@�1\�	ڜ+�\�\�C6p@@�\"nN�+�\�<0�p@@ \�o_�+�N} y\�p@@,�)�+�G:#/q@@?�g͏�+�\�M\r4�q@@\�\���+�ϼv\�q@@\�U,~S�+�\���r@@�\�Z�+���E;r@@-�\�o��+�\�,{\�r@@.�+�	�c\�r@@�Y,E�+�[�T�r@@ۇ�\�\�+�n�\\ps@@��\0�6�+���\�p<s@@t\�%z�+��~�fs@@�^\n��+��\\ps@@\�K8��+�PQ�+�s@@k:!t�+�6\�;N\�s@@l@���+�r�t��s@@�F\�\�+�¥c\�3t@@G\r6�+�\���St@@Ͻ�K�+�\�\�4}t@@��)Wx�+���T\�t@@\�_!se�+��ʉvu@@��\�\n�+�\�u��u@@��^�s�+��|A	v@@�R\�h�+��m\�(v@@\�\���+�\��Kv@@�\��=\�+��\�g\�\�v@@w\�ِ�+���8w@@E�����+�\�L\�Tw@@��+\��+�\�\r���w@@��ȭ�+��3��x@@F\�@1\�+�P���x@@\�\�L0�\�+�d���x@@3Q�\�\�\�+�e73�\�x@@ė�\"�\�+�9�Վ\�x@@�2��\r\�+�¢\"N\'y@@9�3Lm\�+�%\�I(}y@@\�)\�\�+�Ot]��y@@�\�\�{\�+�\�m3\�y@@��Or�\�+�z�ؘ\�y@@~\0R�8\�+��%䃞y@@\nףp=\�+�ԁ��Vy@@��D�\�\�+�h@�5y@@O\�\�\�N\�+��\"�J y@@�\�+,\�+���\0ny@@\�}r \�+��	My@@ ]lZ)\�+�\�\\\��y@@C\�8\�+��\��Kz@@b.\�\�+��>s֧z@@ 	�v\�+����X�z@@k) \�\�+���]/M{@@OqN\�+�(}!\�{@@O���*\�+����2|@@t\�Oq\�+�\�CԷ|@@\'\��\�+�:vP}@@�]\�p\�+�$a\�N\"~@@��j�#\�+�K#f�y~@@\��\�	\�+�s�\�c\�~@@OGɫ\�+��\�\�C@@֫\�\�\�+��\�&��@@!�lV\�+�&���@@j\�\�_=\�+��	MK�@@�B˺\�+� c\�ZB�@@\�9\�\�\�+�¦Σ\�@@*��\�\�\�+�jm\Z\�k@@\�p�{�\�+��g\�,@@n��Ũ\�+�\�7i\Z@@G�Z\�Q\�+�\�xͫ:@@�~7\��+�\�@H0@@�\'��+�\�ID�@@�6\�4D�+��@�Ρ~@@��\0�6�+��\���~@@\�P1\�\��+��H�\�\�~@@\r6u�+�4�\�~@@\�%\0,��\"nN@@{fI��,��zܷZ@@��\�~�,�\�q\�\�r@@\r�=�N,�\�Χ�@@)[$\�,��.��@@�\�,�Gx$�@@x\'�,�RH2�w�@@x`\0\�,�D�3��@@\�k\�\�,�+��B�@@̛õ\�,��V�9΁@@P�\�W,��^��@@ۧ\�1\r,�\"�aK��@@\�!�aK,�\�O\�\�@@)?��,�2�w��@@E|,�\�Udt@�@@�Ϛ,�\0���@@�j\�0\Z,�8�\�L�@@n\�b~n,�Ou\�\�p�@@p\�G,��\�ң�@@0�[w�,��Sͬ�@@e4�y\�,�g�8\�@@=�e�Y,�~�\�!�@@)\�\�,�$�]J]�@@�HV,�~SX���@@��X��,��\�\0d�@@�\�?�&\r,�\��̰�@@\0\�4,�\�Y�N�@@{k`�,�r�	\�O�@@E��b	,�p\n+T�@@��z��,��aMeQ�@@\�h9\�C,�i\�x�J�@@�2SZ,���++M�@@\�J=B,�Gq�::�@@#K\�X�+�I�5C�@@-\�}�+�0\�a�[�@@+��\��+�E\�[\���@@gb���+�j�\�U��@@$\n-\���+���]i�@@%\�/��+� |(ђ�@@\�d�<\r�+���\�\��@@L\�A�\�\�+�W\�f��@@�9A�\�+�p}XoԌ@@h���\�+��p!�@@��;\�\�+�@7n�@@�u\�\�+��\'\���@@7+1\�\�+��)�@@���\�-\�+�v5y\�j�@@��4*p\�+�\�X�ю@@\�O\��0\�+�\�O\��0�@@!\�\�*�\�+��p�描@@��\"h\�+�z�ؘ׏@@֎\�u\�+�\�\�\\n0�@@��~\�T\�+��mQf��@@\\r\�)\�+��\Z�D��@@�\�\r��\�+�\�\�M�@@�d��\�+���i�{�@@J��	\�\�+�Y�;ۣ�@@C=}�\�+��]L3ݑ@@dX\��\�+�r��	�@@��kЗ\�+��;P�<�@@�d\�p\�+�u/3l�@@�\�(@\�+�\'�ei��@@b�\'֩\�+��Q\�\�@@\r34�\�+����G�@@���\04\�+�QJVՓ@@PS\�\��\�+�F\�-t%�@@\�\�~��\�+�1Bx�q�@@�R	O\�\�+�G\�\���@@\�U��\�+��*P���@@]N	�I\�+�Ox	N}�@@\rl�`q\�+�U3k) �@@�d�\�7\�+�ȶ8K�@@Fx{\�+�s����@@��\\\�+�\�s`9B�@@?�m\�+�ץF\�g�@@\�\�$[]\�+�d\�mlv�@@0��!�+��4f�@@\��B�+�\Z�h8e�@@�@�m\��+��\n�+��@@Φ#���+�ݕ]0��@@Z+\�\��+�t\��\�ט@@�vj.7�+�}Xo\�\n�@@������+�\�\�\�\na�@@R\�o&��+����u��@@\rR��+��#���@@O[#�q\0,�g{���@@.�\�\��+�8h��@@	R)v4�+�^��\�@@5�BX��+�\�~O�S�@@��b�d�+�$���@@]\�\�7��+����\�{�@@e\�\�J��+��&��@@i\�V��+�\"\���@@r\�j��,�;��.R�@@\��yr%,�	��Y}@@��z,,�/�\�Q�r@@����:,�\0VG�tb@@\'�\�2P,�C\�*q[@@��։\�Y,�m���W@@��X�\�_,�ګ��J@@�\�\���s,�\\�-\�\�9@@\�ާ�А,���O�m9@@Yk(��,���\�Y�6@@�\�\�C�,�\�\�ù,@@�`��,��9�*@@N^��,���~P\'@@��\���,�;�p\�G @@��k�6�,�n4��@@@\�o&��,�=�Е@@�L�D�\�,�8�0��?@�W��\�,��\Z�\�2\�?@\�\���,�&S��?@��\\�\�-��jJ��?@�\�\�-\�\'-�\�/o�?@\�a��8-��j\�m?@�ǁWC-���_��W?@�\�/��L-�U��CE?@j\��\�R-��^���$?@&Q/�4g-�QۆQ?@\�v/�q-��D\�Ɵ?@C\�\�\�\�x-�3O�)��>@��yq�-�W\n�\\\�\�>@	8�*5�-���啯>@�\0:v�-�5^�I�>@�t?� �-���=\��{>@��>\�-����\�\�a>@\�%�\�:\�-��\�#\rn7>@#��^�-�^�zk`7>@c�D(�-��2\�FY7>@\�Ɵ�l�-�_\n�]7>@u\�\�m�-�\0<�Bu7>@\�Ӝ�\��-��c���7>@\�ƻ#�-�\�r\�\�7>@BB�/h�-�%z\�r7>@\�:�v\�\�-�T9\�)97>@�*4\�\�-�2W\�6>@\�vLݕ\�-��\�je6>@1�Z\�-�7�h��5>@\���^�\�-��,D��5>@U�\��\�-��i��5>@:��KT\�-�oG8-x5>@R�h\�-��HV5>@y�\'e\�-�AI�05>@\�C�|\�-�%A�\n5>@;��T\�\�-��Nϻ�4>@�\�!\�\�\�-�}�|\�.4>@\�s��\�\�-�࢓�\�3>@r��\�-����3>@}%��\�-�J_9\�3>@m���\�-�\�-��4>@�\�\\\��\�-�\"\�*\�\�4>@*�\�Y�\�-��}ƅ5>@Z��m\�-�֌r5>@8�a�A\�-�����+5>@r\�)�\�-����J?5>@\�\��5\�\�-�)\�\'�$5>@ʩ�aj\�-�\\sG�\�5>@S\�k%t�-��=\�6>@Fж��-�\�\�\�\�5>@N�\�\�\�-�i��֦5>@��\�\�}�-�k{��5>@?\�\�\�2�-��9:Z5>@�2��\r�-���kC5>@i\�V��-�\�D�<5>@|��l;�-���85>@��\��-��\�d�<5>@�q�-�����55>@\�*�\�-�7�A`\�4>@\�}U.T�-�zlˀ�4>@��,\�Ԭ-�J@L4>@����-�LQ.�_4>@	T� ��-��\\�gA4>@M�D�u�-�sI\�v4>@�H\���-�|\�/�3>@�ׂ\��-�~�p\�2>@\�c> С-�˟o2>@E/�Xn�-�lMK�0>@\��\�˚�-�\�=$|\�/>@Q��dV�-����\�/>@	�Į\�-�gE\�D�/>@�J\��-���C�R/>@\rP\Zj�-�\�\�w.>@*\����-�o�ŏ->@Ϣw*\��-�\�\�̯\�,>@�/g�+�-��$y�+>@\�\�o�-����\�)>@\�=]ݱ�-�ȱ�\�(>@_D\�1u�-�\'OYM\�\'>@j���-�\�\�I\'>@Lk\�\�^�-�I\�\"i7&>@)\�\�-�FzQ�_%>@\�j\�߇-�q\�Ws�$>@��\"1A�-�ס���#>@��V��-���9]#>@\���i��-�-]�6\">@͐*�W�-��f��}!>@u��\��-��\�>�\� >@\�y7~-�g���d >@��jׄ|-����\�>@9��!{-�2: 	�>@�\rLny-�\�\�4ӽ>@K\�rJw-��::�F>@0�AC�t-�ͭVc>@-�\�DJs-�\�ң��>@b�*\�3r-�aS\�Q�>@ޒ��q-�|�ڥ\r>@Է\�\�p-��!�\�>@`\��\�n-�\'�_[?>@��oD�l-�Tb.>@\\�=\�j-��Ϲ\��>@�\�9h-���L/1>@-��\�g-���@�M>@�_u\�Hg-�ؼ��Z>@YiR\n�e-�����Y>@@�Ŋ\Zd-�pUj�>@K�\��>d-�S8��>@G:#/c-��ȯb>@U���N`-�p\�G>@\0VG�t^-���\�p<>@]�\�]-�\�`�\�\n>@9|҉[-�&jj\�>@\�oBX-�]7��V>@\�(ϼV-�2s�\�c\r>@Xᖏ�T-�9	�/�>@b���XT-�\�a�\�>@p]1#T-��\'I\�L\n>@`���fS-�\�TO\�	>@���v�R-�L�{)<>@Q�5�UR-�\�\�\�g>@`���Q-�\�(\�\'>@\�b�\�P-�(\n�<>@��\��O-�$����>@��\���N-����m>@G\�&jiN-�Jy��\�>@Q.�_xM-�0.s>@�R]�\�L-�\�SrN\�>@\�&��\�K-���ْU>@&��L-�\�O=\�\0>@�@��L-�0Ie�9\0>@GM-���{h�=@\�\�aNH-�+�\�p\��=@\"rlE-�:��K\0>@m\�\�~�B-�|\�_��\0>@\�Ɵ�l@-�|\�_��\0>@��\n\�>-�.�\�\0>@�ڥ\r�=-�:��K\0>@\�#\rnk;-�Й����=@���\�g:-��H\�\0�=@R�h:-�xF[�D�=@\�I}Y\�9-�\�S�4��=@��\�s�8-�v?T\Z�=@;\�%85-����6\��=@$\�\�S\04-�\�?�d�=@�$A�2-��\�\�\��=@�r�0-��4Lk�=@xADj\�--��VC\��=@p\"���+-���ؖ�=@�\\��)-�\�]\���=@E�4~\�%-�\�)H�=@�xZ~\�\"-�$\����=@�%� -��\�ފ\��=@\�R\�{-�U�b\��=@k�)\0\�-�ˆ5�E�=@�\��-�h\���c�=@��#*T-�LK�=@\�\0�}�-�+�\�p\��=@i�\'�-�:��K\0>@�\�F\��-�:��K\0>@*1	-�\�k�)\0>@!��\r-�+�\�p\��=@���-�Ov3��=@r�z�f	-���C\0>@�\�a��-��\�p��\0>@�/ע-�\�����>@m\Z\�kA-�:w�^�>@XV���-���d�>@1[�*\�-�\�e�\�t>@;R}\�-�\�Gq>@\�;�2-�t�Lh�>@J��P�-��S\�\�>@�\�1�-�[(��\�>@z\�蹅�,�\\�-\�\�>@�ri�\��,���\�n>@��D\��,�\Z�K��>@S\�Q��,�Zf��>@N{JΉ�,�K\�\�\��>@\\[%X�,���\"1A>@���\��,�|c\0�>@Ƨ\0\��,�\�Ry;\�>@�	ܺ�\�,�\�I�\�\�>@���);\�,�\ZPoF\�>@\�\0�&P\�,�mt\�Oq>@\���\�,�P��H�>@��_��\�,��\��>@�gs\�,�G	>@�\�Q\�\�,�����	>@��7h�\�,�m\�\�~�\n>@��d9	\�,�]�,σ>@\�n\�KS\�,��\�\�\n\r>@�\�\���\�,�jN^d>@�Gp#e\�,��X���>@<�\�~\�,�v\�!H>@\�vhX�\�,����6T>@}˜.�\�,��il�>@�\nb�k\�,��m>@F\�\�\�\�\�,�=�1X>@YLl>�\�,�/6�>@�\n\�\�,�Y1\\\0>@\�{/�\�,�\n\�y�>@a�4\�,�7�h��>@�b��	\�,�\���i�>@M��y\0\�,�Rd��\�>@&W��M�,�\�M\r4�>@\�\��q��,��YJ��>@,�IEc�,����tw>@O\�\�C�,�\\\�\�.�>@0�\'�,���9]>@�Q�y9�,�\�\�A%�>@\�\�x\"��,�\�\�V%>@��\0Q0�,�[]N	�>@�*ø�,��ǚ�A\Z>@(�N>=�,���\�U\�\Z>@�\�\�\�O�,�f\��>@*��s�,����>@\�\�\�\�>�,�ux\�>@�\�k��,�\�O�}:>@3\�FY��,�^K\�=>@\�o_\��,�\��i\�>@�G,�,��lXSY >@*��s�,�\\>��\">@\�8b->�,�\�\�G�\">@P÷�n�,�\�\�\�=#>@v��\�/�,���T��#>@�l��\�,���X�\�#>@g���,�s�69$>@���,�\�Ƃ $>@W�����,��3�/.%>@���@�,���\�\�%>@�m���,���B\�&>@��\Z��,�l\�,	P\'>@\�\�\��,�Z)r�\'>@\�D�<�,��Ku\'>@n0\�a��,�\\!�\�&>@k�j�Ҩ,�R��m\�&>@\0�~�:�,��\"ڎ�\'>@BҧU��,���Դ�)>@�I�Oǣ,�\�\�v�)>@k\�\�u�,�yx\�\�)>@�\�p���,�����*>@\�6\�^��,�m\�\�~�*>@��߃מ,�\�\�m4�+>@j��\0ߝ,�~R\�\��,>@\�n\�KS�,���Dg�->@\�ң���,�:\�<c_.>@���,�\�\�*�C/>@q㊋�,��2��\r0>@�i4��,��6�2>@�#d �,�P�mp2>@�ݰmQ�,�\�G\�2>@\r�����,�[�}3>@\�a0��,���\�\�3>@}>ʈ�,�\�\��3>@�\n��,�g`\�eM4>@�\"�~�,�\�,^,5>@�3iSu�,�\�\��5>@r\�\�[�,��ܶ\�5>@$F\�-t�,�1���6>@\'JB\"m�,��ЕT7>@i�,���&��7>@\��-]�,�\nJ\�ʽ8>@�켍\�~,�77�\',9>@�\��\�p},�\06 B\\9>@w�Ny|,��\�ZC�9>@�&3\�Vz,���e�\�9>@g)YNBy,����·;>@L6l�s,�~!<\�<>@�ҥIr,�K\�Բ=>@N\��q,���\�t>>@qx�\�q,�\�3\�?>@\�1��p,�y7RB>@稣\�jl,�KU�B>@T\Z1�\�k,��\�<C>@�\��-k,�-�\�o�C>@V�a�j,�\\Ɏ�@D>@Z_&j,�9\�E>@\�oBh,�\"\�:�vE>@jM�f,�\"\�k^\�E>@�?x\�e,���g�\�G>@zpw\�nc,�6#�\�EH>@]�@�b,�4+ۇ�I>@͏���_,�+��$\�J>@\��/`,�`���\�K>@\�,{`,�\�S\�M>@nh\�N?`,�\�?k~�M>@(�8\'`,�<��.O>@���\�_,�T\�{F\"P>@$d \�._,�cAN>@��^�sQ,��\r�WN>@�W}O,�gE\�DO>@֍wGN,��/K;5O>@�\'��L,��h�hsH>@\��\�\�5,�¥c\�3F>@6Y��1,�\�\�B\�A>@��ʆ5-,��&ݖ\�A>@\�\�)�\�*,�\�M�q\Z:>@�h�\"\',�lw\�}9>@g��&,�3j�J>6>@�t\�_�\",�\����\�4>@t	�\�\�!,�U�2\�2>@f�\�\n\",�\�c\"�1>@;�p\�G\",�\r��W\�0>@$}ZE ,�Y\"��/>@2\0Ǟ,�L��O\�.>@`x%\�s,���|г->@ő\"�,��Qԙ{,>@�ߡ(\�,�zm6Vb*>@`=\�[�,�r�\�7)>@E\�\ZJ\�\r,�|)<hv)>@�	�s\r,���ѫ)>@y?n�|,����G�(>@	Q�\0,�i�\0�w)>@�\�ۻ�+��8�@d)>@_9\���+�\�L\�T)>@B\�f\�\��+�*r��9)>@\���j�+��n��)>@�\�HL�+�E�\�(>@�5\\\��+��pY�\�(>@W\�\�\�x�+�҉S\�(>@�BY���+�\�_\�+\�\'>@fO�s�+�$����&>@\�\�K�\'\�+�37߈\�%>@(d\�ml\�+��D��\">@\�?O\�+��&ݖ\�!>@_�sa�\�+��&\Z� >@%��\�}\�+��\�˙\�>@H¾�\�+�}^�\�#>@\�Q��Z\�+�)�1k>@=��\�+�\"\�\�3�>@X�5\�;\�+�%\�\�\�\�>@H�\�ߠ\�+�й\��\�\�>@c}�\�+�ڮ\�\�\�>@�I\�\�+�s�c��\�>@YiR\n�\�+�����/\�>@�:\�\�+��\�\r\�>@$C��g\�+�|�y\�\�>@�\�PMI\�+��b��\�>@�\�\�C\�+�\rU1�~\�>@\�(@\�\�+�Tq\��\�>@�;Mf�\�+�S$_	�\�>@ZGUD\�+�::Z\�\�>@�]��a\�+�?\�,\�\�>@�ϝ`�\�+�c)���>@��\�\�+�$\�w~Q�>@E�\�Ӝ\�+�q�\��>@x`\0\�C�+���z�>@7m\�i��+��ĬC�>@=\�බ�+��\�t=\��>@4�27�+�\��v\��>@+�� �+��t�(%�>@\��\��+��\�{\�_�>@-C\�\�+������>@���b�+�\�\�\�\��>@��4L�+�����	�>@�g���+��wD�\��>@\�/���+�\��/g�>@\�d8�Ϩ+��A\'��>@�r۾G�+�vq\r\��>@h[\�:�+�0��\��>@+��B�+��Ϲ\��>@�Ɍ���+�\�oB!�>@\�\�`\�+�\�X�yV�>@4\�i���+��ЕT�>@#M�<�+��Ǵ6��>@�<dʇ�+�e��\�\��>@8���+�\�\�u�?@KVE�ɘ+�j��\�\�?@Ŏơ~�+��,�?@\�(\�\r�+����?@\�z�p̒+����9�?@P\�\����+���X�\�?@_\\�\��+�C=}�?@rѬ�+�1%�\�	?@����+�!撪\�\n?@��Z`��+�&\0��*\r?@�}�p�+���\"\�?@9^�\�I�+���\�t\�?@��a�+�\�\0��z?@�\�%\�2�+�W$&�\�?@r����+�\�]gE?@K!�K�+�&TpxA?@.���v�+�IIC�?@xz�,C�+���@�?@Iط���+��dV\�p?@3�<Fy~+�\�J=B?@)^emS|+�-x\�W�?@?��H�z+��\��*�?@\�8EGry+�PR`L?@��I~\�w+�Q�v0b?@)Z��u+����(	?@\�\�}U.t+��\�@-?@\��Bs+�D?�{?@aO;�5q+�g�ba� ?@Y�n\�m+�&�fe� ?@�a���j+�\�\r��n!?@�I��	i+�<k�]h\"?@y\��\�eg+�(+��$?@ݙ	�se+�m\�?3�#?@�\�.4\�a+��(B\�v\"?@\�\�TO\�_+�u!V�!?@��]+���{� ?@���`[+��F��1 ?@��E`�W+�,�) ?@؀qU+���\� ?@��\�\�Q+�\�\�>9\n ?@��\\m\�N+�+�\�	 ?@ByGK+��^~�\� ?@bf�\�(G+�L\�\�\�<!?@�\�ϷE+�����!?@���#*D+�2v\�Kp\"?@�.o\�B+���6T�#?@��y?+����&$?@o��=+�J]2��$?@��A\�\"<+�\��ǚ%?@�ฌ�:+��\�\�9\'?@_@/ܹ8+��dU��(?@|��6+���w�G+?@\�@�9w3+�!<\�8.?@�\0m�Y/+��F/?@�h\�^`.+��\� ��0?@�&�5-+�x|{נ3?@�&�,+�<�2T\�4?@{�ю.+�4.\�6?@7n1?74+�ș&l?9?@���/+��\�{*�9?@��\n*�.+��\�:?@\�\�\"�++�G=D�;<?@�\�v��&+���e�c=?@��:r�#+�\�s`9B>?@\0�ҥ!+�D0.??@(b\�+�{�p̲??@8���+��V\'g@?@�>$D+���J\\\�@?@3SZK+�_&��B?@vOj+��\nb�kC?@�ٮ\�+�¦Σ\�C?@J�?��+�\'��>D?@^�S+��\0�S�D?@�\�j�=+��1k�E?@�hs�\�+�d \�.\�F?@*7QKs+�l{�%9H?@\�\��\n+����]/I?@�K�\n+��%\0��J?@5s��+�B\�%U\�M?@�F\�\n+��)\�N?@+k�\�q	+���E\�TP?@y\�ՏM+�)yu�Q?@\�R\�{�*�U\�\�\Z�Q?@=\'�o|�*�p�\'vR?@ɐc\��*�` ��S?@��Z}�*�M-[\�T?@���I�*��\�H�U?@\�vhX��*�\�<,\�V?@\ZQ\�|�*�O\�`��W?@\Z���)�*�\��UG�X?@���\\��*�Eb�\Z�Y?@K��\��*��`7l[\\?@t}�*��ؙB\�]?@Rew��*�E�4^?@\�L�:�\�*�d\�3�%_?@\�5w��\�*�]\�].\�_?@hwH1@\�*�m\�)\�a?@��_\�|\�*�}zlˀc?@�\�L�^\�*���7�d?@e�\�2�\�*��#�]Je?@*�Z^\�*�3o\�u�f?@�Y2\�\�*��C\�bh?@\"S>U\�*�np��i?@\�q\�\�\�*�\�\�6\�j?@qt�\�\�*�1е/l?@f/\�N[\�*��V�9\�m?@${��!\�*��m?@\�\���\�*���|�\�m?@�M+�@\�*�(\�hr1n?@o���\�*�\��1�Mo?@E�u�\�\�*�L�\�\�\�o?@\��Wy\�*�}\�X��p?@�\�T�G\�*��GQg\�q?@�C�\�\�\�*�+mq�\�t?@DOʤ\�*��;Mf�u?@���·\�*����ɍv?@��Tގ\�*�\�\�\�1w?@:vP\�*�MI\�\�\�z?@иp $\�*�\'2s�\�{?@J��Gp\�*�!\��|?@��V�\�*��?\�,}?@��\�0\�*��\�\�uS~?@�^~�\�\�*��r0�\0?@��UJ\�\�*��f��?@��\�\�*�\�]gE�?@�\�\�_Z\�*�d\���?@l���\�*�H\�9���?@���4\�*�TT�J�?@�(\�\�=\�*�D\�ͩd�?@�LM�7\�*�#M�<�?@kF�\�*�]2��\�?@l>�\r\�*���!r��?@[�T�\�*��`���?@�\�d\�\�\�*�u;�ʃ�?@Y�_\"\�\�*�\�ù��?@l\�u�\�*�l\�\�TO�?@�an�\�*��F\�ҋ?@\�+ٱ\�*����x�?@�Sȕz\�*��\�t牋?@R�d=\�*�QlMK�?@\�b�D\�*�&5�،?@�d\�,\�\�*� )\"\�*�?@\�\�{,\�*��ky\�z�?@L�$z\�*�9{\�\�?@\�\n~b\�*��\�ȑΐ?@�<i\�\�*�X�%���?@\�\�\�B�\�*�\n�2��?@�F\�\�\�*�/m8,\r�?@\'k\�C4\�*�F\���?@{i�\0��*���C5%�?@�P�%��*�\�i��&�?@S���ƿ*�t@�\�?@m򖫿*�j�*��?@W\�I\��*�~���?@R�b��*�>@�\�̞?@��켍�*�Է\�\�?@\��`R|�*�Ɏ�@��?@�s�L�*��!�\Z��?@J+��*�{Nz\���?@;\�G�*���:r��?@\��r��*�4��E`�?@\�,	PS�*�\�_Z\�\'�?@��\�Y��*�^H��0�?@�\�&���*�ut\\�\�?@.py��*�^\�Y-��?@(\�\�G�*���\��?@O\�9���*�\�_ѭ�?@\��\�Đ�*��\�*�?@we��*��Sȕz�?@�V횐�*��uŌ�?@`�\�\�*�\�q\�\�r�?@PR`L�*�İØ��?@cb�qm�*��5�ڋ�?@�+g*�\�M֨?@O崧\�*�j\�q���?@\�\�|@��*�횐\��?@\�n�Uf�*�\�j����?@�uX�*�>[�?@��A\�<�*��GT�n�?@\��)�*�I\�\�\�?@/�>:u�*�\\!�\��?@��*4�*�R��Z��?@0\�70��*�\�\��?@�\�唀�*��C\�b�?@Y0�GQ�*�^�\�I��?@��\Z�D�*��d�?@\��q�*��>���?@�c\�]K�*��jI�?@\�\��L�*�\�g��Ҧ?@��y\0��*��i\�q��?@\�\�h\��*�\�l�IF�?@\�K6l�*��\�Li��?@�ЕT*�B\�%Uۥ?@q̲\'�}*��/ע�?@P:�`�y*�˜.���?@�Q��mx*��%�\"�?@��\�\�Ur*�\'\�+�V�?@�ŋ�!r*�xG\�j�?@9\�\�m4p*�]¡�x�?@K��F>o*�\"H��?@\�\�\�k*�(v�U�?@I0\�\�Zj*�8��̒�?@*\���h*�%W@��?@8k�*g*��f�\\�?@�-s�,f*�yGsd�?@oe�\�2c*��\�E|\'�?@ݗ3\�b*�Z�P۶?@���,\'a*�jl���?@\���}`*�1е/�?@:�\�H_*��\�d�?@+�C3O^*�F\�j��?@�M�\�[*��,D��?@]lZ)Z*�@7n�?@�+�,U*��B �8�?@�#��\�S*�,��\Z�?@\npUR*���T���?@E�\��VQ*�36t�?�?@cAJP*�2�F��?@`?\�O*�$�����?@~SX��J*��E\'K��?@\�E_A�I*�5ӽN\�?@$��\�F*�	\�P��?@\�\�vhXD*��\�p\�W�?@\�>�@*�3�f��?@�\�ŉ�>*�߈\�Y׼?@\��\�:*��|\�.P�?@H\��Q9*�l>�\r�?@7qr�C9*�*\�\�F��?@5(��8*�\�&��\�?@\��&7*��ߡ(п?@܁:\�\�5*�W	�3�?@	4\�\�y4*�D�.l;?@�(^em3*�<\�8b-�?@i\Z\�0*�\�\r�0��?@�/ע-*�ܷZ\'.�?@�\���,*��%��?@�\�\�7�+*�}\"O���?@��I��,*�r2q� \�?@�Ң>\�-*�u��\�a\�?@\�\�\�/*�\� ��\�?@��i��1*����.\�\�?@Dj\�\�43*����X�\�?@�|�R�4*�����@\�?@�Z\�Q6*�\�\�#��\�?@��\04J7*�#��^\�?@p��:\�8*��[�\�A\�?@�u7Ou8*�]2��\�\�?@\�>�̔6*�y�\'e\�?@%\�\�\�4*��RE�\�?@\� \�hU3*�%]3�f\�?@�d732*��lw\�?@vŌ��0*�\�\�\�;�\�?@\�V%�}0*���\��\�?@�\��\�0*�v\���\�?@2Y\�d2*��?mT�\�?@P6\�\n\�2*��\��\�\'\�?@nڌ\�%*�\�H�5\�?@\�\�+\�#*�\��R�1\�?@����\"*�\�Y5\�\�?@a8\�0C#*��\�I��\�?@�\"r$*��\�	m\�?@0du�\�$*�B\�\"LQ\�?@h�\�HK%*����_\�?@\�%\�2�\"*�\�:��\�?@lZ)r!*��\��5\"\�?@�W}*�+\�\�6\�?@mt\�Oq*���/�\�\�?@�;k�]*���\�@\�?@\�,\�i�*�؛��\�?@\�\�$[]*�|F\"4�\�?@+j0*���o\'\�?@�=ϟ6*����\�?@Iط��*��v��-\�?@oJy��*�K�!q�\�?@�\�v�\0\r*�-σ��\�?@a�^Cp*��{)<h\�?@�\��*���\�\�c\�?@9�d�\�*�y\\T��\�?@��a\�*��\�\�\��\�?@IIC�*��.�o�\�?@���\�l*��F� \�?@a4+ۇ*��.�KR\�?@S�u8�*�J\�E�\�?@�\�8�j*���#\�?@�_[?�*���B\�?@t\�\�gy*�QN���\�?@`V(\��*�j\�L�\�?@���*�@�z�\�\�?@ϟ6�\�	*��\Zٕ�\�?@\�\�M�	*��E\�\Z\�?@c�D(\n*�\\W\�\�?@\�\�q5�*�^\�Y-�\�?@m��\�*��\�\n�|\�?@�\��*����W\�?@�}�\�\�	*�?\�\'\�?@�6ǹM*�H�V\n\�?@�\�zM*��1\�	\�\�?@{ܷZ\'*�\�l#�\�?@DkE�\�*���5��\�?@��~�*�6\\�-\�?@If��*���Os\�?@�bd\�*��\�PMI\�?@�\�z�2*�Q1\�߄\�?@����\��)�����\�\�?@fffff�)�&���\�?@<��\�\��)�m\���{\�?@]P\�2��)�40�&\�?@���.\��)��.\��\�?@F�a\�\r�)��<\r$\�?@p|\�%�)�\�a0�\�?@h]�\�@�)�֎\�u\�?@T8�T��)�\��Y�\�?@SX����)�l\�\�C\�?@\�oB�)�\Z\�\�A\�?@\���,A\�)��h�hs\�?@2\���\�)�J�\��\�?@4iSu�\�)�ʣaQ\�?@G��R^\�)���!�\Z\�?@����\�\�)�]�\�a\�?@6l�\�\�)��/���\�?@�$��\�)�*Ral!\�?@T\�d�\�)�_���F\�?@��W�\�\�)�\nL�u\�?@\�cx\�\�)�뭁�\�?@�{�ڥ\�)���\�:8\�?@#�\�\�)�ޏ\�/�\�?@7���\�)�s۾G�\�?@�#�\�)��.�\�|\�?@~7ݲC\�)�)$�\�;\�?@+\��\�)� (�\�{\�?@)�k{\�)�\���W�\�?@���\�i\�)�ۿ�Ҥ\�?@m�\�<+\�)�\�\�M�\�?@\�\��\�)�e\ZM.\�\�?@�u�X�\�)��\�2\�\�?@R�\�\�\�)�tzލ\�?@Sz��\�)�I�Ǵ6\�?@����o\�)��[\�d8\�?@\���\�)�x\n�R\�\�?@؜�gB\�)�f/\�N\�?@\�-��\�)�/�\�|\��?@cC7�\�)���b�d�?@z\��\�)�N\��1��?@vR_�v\�)�_����?@_(`;\�)�8\�GnM�?@DP5z5\�)�g(\�x��?@n\����\�)��l;m��?@��1>\�\�)���P��?@ɫs\�\�)�I��&\��?@�{�ԗ\�)�2: 	��?@_��\�:\�)�33333�?@M1AG\�)�\�0\'h��?@\�ܴ�\�)��UfJ\��?@�B�Գ\�)�\�G5\���?@\�<+i\�\�)�\�%qVD�?@}ZEh\�)��u\���?@n½2o\�)��\�W\\�?@\�5>��\�)����\��?@\"\�k^\��)���\�\��?@���۞�)�J\�o	��?@�[���)�\�eS��?@,�\�E|�)�\�����?@���[�)�\�\�/fK�?@\�I���\�)�d\��\��?@.rOWw\�)�z�ަ?�?@�r\�Sr\�)�Y5s��?@� x|{\�)�\�\�u��?@\�N\"¿\�)�\'f�\��?@B��^~\�)�h\�\n��?@�)U�\�\�)���b�d�?@�\�p\�\�\�)�\�9\�\��?@-$`ty\�)�\�=yX�?@�-�\\�)�a\�\�+�?@�\��\nD�)�m�\�o�?@�Ac&�)�(Hlw\0@@\��p\��)��R��c\0@@+�\�	�)�\���JY\0@@\�T��)�~7ݲC\0@@Ƈ\�˶�)�\n���1\0@@�\�~K�)��x]�`�?@�\�{\�_�)�¥c\�3�?@�yq⫵)�\����?@�>��?�)�˟o�?@�Z\�7ڱ)����b�?@��H�)�w\��\��?@�x\\T��)�y�t\�\��?@x\n�Rϲ)��h�hs\0@@�\���)��w�Go\0@@�z�<d�)�8�L\0@@a����)�Z_\0@@�^�)�G<\�͌\0@@\�\�Ŧ�)���H\�\0@@(�\�v�)�&�L1@@M�:�/�)�-�cyW@@��x���)�\��S\�@@0�\�\\�)���\��@@N*\Zk�)�$~\�\Z.@@�p!�\�)����\�@@�p\�i�)�\� Z+\�@@�\�\�m�)��\Z�$�@@%\�/�)�h���@@6��\\�)����5[@@����)����ɩ@@#��^�)�gaO;�@@XT\�\�$�)��F��1@@ѓ2��)�Q�5�U@@�]/M�)�[�D�A@@��x!�)����;@@����)��\��@@#f�y��)�I�[\�@@ |(ђ)��Ϝ�)@@qW�\"��)�{��mm@@xE𿕔)��i\�L@@2\0Tq\�)�N��;P@@\�\�\�\na�)��\�\�#@@\�B���)�tA}˜@@�|A�)��\��K@@�Q�)�\�[[%@@D�\�\���)��\��@@\'�Ҩ�)��J\�@@�wD�\�)�\�\�l�\�@@�ΤM�)��Քd@@�A&9�)����ӝ@@+1\�JZ�)�ZEh\�@@�\�\�݇)����\�:@@|�?mT�)�X\���@@\�WXp�)����·	@@\�\�[v�)�\�o_\�	@@@�\�\�v�)�xe��	@@\��w�)�_�vj.	@@}A	�)�\�b)��@@-�cyW�)�SYvQ@@��켍�)��Z\�7\�@@�d\�p�)�\���҈@@\��!o��)�\���\�~@@0�k���)�=Y��@@�-�\�~)�C��3@@d\�\�A%~)�FA��@@9CqǛ|)�1\�\�Z@@�G��\'|)������@@��m\�|)��/�\�L@@&�fe{)��\�R\�@@\�$\�\�z)�y�0DN	@@�>;\�z)�\�1��	@@:=\�Ƃz)�7\�\�Z\n@@�U\�x)�\�٭e\n@@obHN&v)�&\�\�s|\n@@lˀ��t)�3R臭\n@@\�eOs)�̘�5\�\n@@\Z4�Opq)��Ϲ\��\n@@\�\�Χn)�z�m\�\n@@`\��-m)�/�\n\�\n@@��\�\�Uj)�\�/fKV@@\�5\�\�h)�\�V%�}@@#\�M)�e)���5�@@M֨�hd)�\�_��@@&S�b)�����Y@@�\'�.�`)�Dio��@@g�8\�_)���QI�\n@@9EGr�_)���S�\Z\n@@�\Zg\�`)�n�l��	@@x%\�s}_)���	@@�\��\�\\)�{נ/�	@@q�{��[)�1`\�U,\n@@\�H��rZ)�N	�I�\n@@�@�\�\�X)�bHN&n@@xcAaPV)��\'��@@�<֌T)�\�a��@@-\�(�Q)��\�ŉ�@@\�\\�mOP)���\��@@kJ�GO)�+\��@@� \�X4M)�\"H�@@i9\�CmK)�\�z�p\�@@\��ԱJI)�ߤiP4\r@@\�m3\�A)�d�\�Tk\r@@��\Zh>?)���^��\r@@ܻ}\�=)�\�\�	/�\r@@\'\�_=)�u�\�&@@\�\�A%�;)�,�)@@\�;jL�9)�;�\�u�@@>�x5)�\�{/�@@\0\Z�K�2)�\�\�\�O@@�\�n�U.)�\�Tƿ@@3ı.n+)���[�\�@@Zbe4�))���n\�!@@�d�P3$)�[A\�+@@i5$\�)��J\�4@@Su�l�\Z)��[�O@@�\r�)�\�б@@l]j�~)�\�-\�\�@@C\���)�����@@4�Op�)�~\�D�@@�\r�\�\�)��Y.�@@�T���)��<e5]@@�[\��)����I@@�0Xr\r)��\�~K@@�\�:8\�)�}\�\�\�E@@cD�в)��l\\@@R\�\�\�\�)�\�)�n�@@��\��)�P�\�W@@��X\0)��\Z�\Z�@@6�\�\n\0)�\�|x� @@@�P�%�(�A�c\�]@@��_��(�z\��@@��¼\��(�p^��j@@��\�_��(�ywd�6@@C�Գ �(�6��,\n@@�&l?�(�뫫�@@m�\�p�(�`��-@@��ôo\�(���_�@@\�U\�6\�\�(�q $�@@�a��m\�(�&�L1@@�^�2\�\�(����\'@@n\�@\�\�(�\�c\�\� @@�\�\0\�(�:�6U�@@-	PS\�\�(�\�P1\�\�@@F�Sw\�(�L��O\�@@׾�^�\�(�X8I�\�@@T�D\�[\�(�M\nJ\�@@��R^+\�(��6\0@@!yv�\�(�|҉S@@�=�\�\�(��K\�1�@@rk\�m�\�(��}��\�@@\�\�bg\�(�\�N�j@@ظ�]�\�(��\�ǘ�@@��\�\�(�\�SW>@@��\0\�(�Z/�r�@@g�+��\�(�Y���.@@\'\"\�\�(�J��4*@@+5{�\�(�\�Sr3@@\�6��\�\�(��\���@@ǃ-v�\�(�b0�\�@@x�\Z\�(�΍\�	K@@�����\�(�\�\�!��@@�\��x\�(�\�.�5@@H\��Q\�(��Mc{-@@<�.\�(��Ӂ��@@g�\�67\�(�<l\"3@@|�y\�\�(�\�\r�:�@@p|\�%�(�nlv��@@f�O7P�(��KK@@`�_?ľ(�]n0\�a@@�\�|\�X�(�J��Gp@@\�0���(��\�\0d@@BA)Z��(�~8gD@@\\=\'�o�(��ƠB@@\�vhX��(�uV\�1@@�˷>��(�Do��@@�Q<��(�q��]\Z@@dx\�g��(���8d@@��aMe�(�\�/fKV@@\�\r��0�(��F=D�@@����(�\�\�1@@����(�)]���@@�r�\�{�(�H5\��\�@@(�8\'�(�U�\�-\�@@tA}˜�(��(\�\r�@@\��M(�(���b�@@�Y�X�(�W#�\�2@@��B\�ʠ(�e73�\�@@@2:=�(��\�{*�@@�]0�\�(�2\�\�Y@@?6ɏ��(��\rND�@@�x?n��(��P�,@@\����`�(�\0\�3h\�@@	��YK�(��_cD @@�\�Y���(��nK\�!@@ {��\�(���\�\�!@@\�MF�a�(�1\'h�\�!@@�{�P�(�\��8�!@@.\��:��(�\�A\�L�!@@\�,�s��(�\��5w\"@@	pz\�(��V\�f#@@\�Jvl�(�\�_w�#@@_(`;�(��\�\n�#@@�P�%��(�>ϟ6�#@@�\�\�l\�(�\�\�=�#@@\�]M��(���Դ�#@@7�\���(��\�\�#@@\�u\Zi�|(�rP\�L\�#@@\�fd�{(�C8fٓ$@@��\�t(����$@@�\�\�Nl(��\�(�\�$@@կt><k(�!\�\�	L%@@\'�\�Q�k(�G ^\�/&@@V+~�g(��P\�\�\�&@@\�;��Jb(�C�l\�&@@��Cl`(�@KW��&@@˝�`8_(�MK��F&@@���<H_(�PQ�+�%@@\�v�>X^(��.Ȗ%@@�\�\�L0\\(�0�Qd�%@@�\�΢wZ(�PQ�+�%@@T���\\W(�\�u\Zi%@@|E�V(��U1�$@@i�\�Q\�T(�\�\�ID�#@@Z�xZ~P(�\�\�\"�#@@�&�%\�N(��\�B��\"@@�;\Z�J(��\�\�C\�#@@~��k	I(�>\�\Z-$@@��};�@(�\�˻\�#@@�\Z�X:(�`�5\�!$@@\�Ɵ�l8(�s��+$@@\��v\�6(��[\��#@@���|�5(��E\�\Z$@@L<�3(�\�\�8\�\�$@@��\�\"2(�\�\�F��&@@\�\�ù.(�JEc\�\�&@@øDk-(�¢\"N\'\'@@/m8,\r,(�\��b\�\�\'@@O�\�\�((�s�69|(@@\n��a\'(��\�\�)@@\���((��yq\�*@@\�	�_\�&(�m�Yg|+@@:x&4I$(��*5{�+@@�=B͐\"(�\����+@@W�\�,� (�6\�\�+@@�|�F(��@��,@@T�n.�(�\�\�a�-@@���>(����oa-@@`\0\�C�(���A{�-@@-y<-(�$�]J].@@�\���(�\��-s.@@q!�\�F\"(��\Z�X.@@��%:\�$(�\���8a.@@\��\�e�&(����.@@J��4*((�\�\0OZ�.@@���\\�((��\�s\��.@@r\�\�Q�)(�(CUL�/@@S]�\�+(�ͫ:�0@@/3l��+(���&0@@JA��4.(�1|DL�0@@y\�Z/(�n�\\p1@@>Y1\\0(�GN��1@@T\0�g\�0(��2Q�\�1@@d���_1(�\�Q\�2@@z�ؘ\�1(��l;m�2@@@4�\�2(�\�I�\�\�2@@� \"5\�2(��I�%r3@@pC�׼2(��\�uoE4@@-Ӿ1(�R�r�4@@rݔ�Z1(��#*T75@@��IӠ0(��ެ�5@@�W�L0(�v5y\�j6@@*\���P0(�z�m\�6@@\��\�˚0(�\�<�7@@KxB�?1(��M*\Zk7@@�\n��1(�qx�\�7@@�\�~�3(��4�B8@@Ja\�\�L3(�n/�8@@wg\��3(���\�8@@�\�E\n5(�\�5�\�8@@(��\�6(�\�c�\�T9@@��\�	�7(�\�\���9@@�\��\�8(�\�\�0:@@$��\�9:(��\�3.:@@�U��y<(��*:@@\�B��>(�\��\ZI:@@2��8*?(�-x\�W�:@@sh�\�|?(��\��\�\�:@@\'�|�?(�\�e\�\�@;@@��լ3>(�{��\�`<@@8�k��=(�4�\�=@@,�z��=(�+0du�=@@U.T��<(�py�>@@�`p\�=(��8\�\�m>@@_��=(�\�:\�?@@�\�^\'�=(��\'v�?@@y\��=(���-$@@@�O\�I\�=(��?��i@@@�U1�>(�\�\�6�@@@�\"1A\r?(�\�q\�_A@@�.R(?(��v\��A@@�\�bc>(��/�\nB@@\�2��>(�&p\�nB@@5~\�$?(��\�\�\�B@@\�ɋL�?(�L8�C@@�\��\�A(�\�iO\�9C@@�\�ĬC(��\�|\�XC@@\Z�K��D(�d;\�O�C@@+/���E(�]\��\'D@@f-��G(�N\'\�\�rD@@P�i4I(��\�\�\�D@@�O:�`J(��i4�E@@o\�\n\��J(�&m�\�E@@c�0\�K(�>\�ɋLF@@��\'��K(�=��\�F@@R���L(�\�\�\�\�F@@\�S�4�M(���i\�F@@\�pt�\�N(�R�hG@@���RxP(���\'HlG@@\�ާ�\�P(�	�nH@@E�>�\'Q(�V��WI@@�b+hZR(�oe�\�2I@@�?mT�S(�?�Ң>I@@a\\:\�T(�\�\�\�\�BI@@{��&3V(�R�d=I@@\��9̗W(�\�\'�H0I@@\�\�\�\�\�X(��I@@-�s�Z(���gI@@��@j[(��ܶ\�QI@@.��S\\(�r��\�I@@�ѩ+�](��%\�J@@:\�](�\�\�>�QJ@@���(\\(����J@@�-v��Z(�\�e\�-K@@\�ߠ��X(���\�(@L@@�\�o�\�V(�\���}L@@�h\�^`V(�~��k	M@@���)�T(��x�aM@@�6�XS(����\�M@@�	MS(�E�ɨ2N@@9�d�\�Q(�d�wN@@�\�ңQ(�֌rO@@��u�R(�9�3LmO@@�j\�vO(�8h�O@@�\�ܴO(�]�C�\�O@@�o(|�N(��\�S:P@@���\�L(�5\�\�P@@%<�ןL(�\�D\���P@@\�r.\�UM(�\�E|\'fQ@@\rR�L(�I\�\�\�Q@@�e��K(�\�Sr3R@@x\'�K(��ܚt[R@@�f��}I(��\��\�\�R@@���sEI(��+\�F<S@@j3NCTI(��[\��S@@�1\�\�I(��mē\�T@@\����I(��#EdXU@@N} y\�H(�\\8�V@@ܽ\�\'GI(�\�4�OV@@�GT�N(�\nIf�W@@{\�v\�\ZQ(�$\�\�(�W@@f���~S(�d\�C\�W@@fM,�U(��\�6S!X@@?#KV(��\�)rX@@c�:\0\�V(�I�2�\�X@@؁sF�V(�\'\�+�VY@@\�wakV(�Xr�Y@@t_\�lW(��0\�q�Y@@\�L�:Y(����-=Z@@��\�<\\(��3M\�~Z@@��`�\\(�f���-[@@ds\�<G\\(��a��h[@@�tu\�b[(�\�҇.�[@@˟o�Z(�{��\\@@�{G�	Y(��&�\\@@�I+W(��(\�\'�\\@@��\�X(�\n�2�&]@@���Z(��mR\�X]@@\�T�\�\�Z(�\�\��S\�]@@`X�|[(�/l\�V^^@@-ͭV[(�Z�P\�^@@6\\�-[(�\�\�\�1_@@�r�\�h[(�ڎ���_@@e��[(��\�}��`@@�Q,��Z(��Z�\�a@@��\ZZ(�\�\�tpa@@�h\�\�iY(�yx\�\�a@@}��bY(�\�4�\\b@@6\�$#gY(��:��b@@|&�\�iX(��9��c@@�- �V(�<��k\�c@@�\�)\�JU(�\�\�Xm�c@@��T(��ӻx?d@@+øDS(�+n\�b~d@@\0��q�Q(��T���d@@\0:̗P(�~�p\�d@@*9\'�\�N(���G��g@@�k	��O(�O!W\�Yh@@�\��wO(����(\�h@@�g�P(�gc%\�Yi@@�5�ڋP(�\�BF�i@@\n��P(�&�(\�\�i@@\�$#gaO(�\\�\��(j@@�\�\�l\�M(�ij@@\"lxz�L(�\�\�\�\�\�j@@X�vMHK(�/\���l@@�\�̓kJ(�)\�\'�$m@@J��	\�I(��\�\�Gm@@��Ɋ\�J(��y\�n@@\�#\��J(���#�n@@Sz��K(��Rx\�\�n@@EeÚ\�J(�\�Ǻ�o@@\�1!\�J(�y@ٔ+p@@�4\�($I(��\�\�dpp@@(\�\�GH(�7\�xͫp@@s�`�G(��\�sq@@;\�GE(�\�P�lq@@\�\\\��XC(��m�q@@̲\'�\�A(�����q@@7�\',�@(�\0�&�r@@�Ϛ?(�2�#\�r@@\r\�º�>(�\\�v5s@@v�;O<?(�\�\�Ŧs@@鷯?(�/�\�\�s@@\�\n�>(�ݗ3\�t@@��]L3=(�j\'�;t@@B\"m\�O<(�T\�qst@@�t\"�T;(�歺\�t@@z\�΅9(����\'u@@#e��\�8(�;:�Fvu@@\�Aȗ8(� {��\�u@@��\�Z�8(����L�v@@L⬈�8(�\�QG\�\�v@@\Z\�\��7(�|\��\�w@@�	�Y\�6(��w\�1w@@\�\�\�*\�5(�X�x�w@@�\�\n\�5(�ZJ��Px@@\�\�L�7(��|�b�x@@\�PS\�7(�^-wf�w@@֪](� \r�\�\�y@@\�\�5\0(���f�8�@@\�U��\�\�\'�%=�N�@@\�c\"�\�,\'��Go���@@_Ӄ�R,\'�vöE��@@Ae���+\'�2\�\�Y؝@@9��!+\'�\"�\�`�@@P0�A+\'�\�\�h���@@ٗl<\�*\'�iƢ\�@@���@g*\'��uX�@@�\�@,�)\'�\���ԟ@@�\�ȑ\�(\'�e\ZM�@@\�\"0\�7(\'�&o��\�@@g\�!\�{\'\'�V�F摡@@\'/2�&\'���rޡ@@\�!\�k&\'�\�8h�@@\Z�\�6&\'�#K\�@@p^��j\'\'�\�-c}�@@��\�x\�(\'�؃I��@@1\\\0q\'\'�e\�/��@@n�\\p\'\'��$@M-�@@u=\�u\�\'\'����Or�@@����\�)\'�P\�\�@�@@\\sG�\�-\'�\'��鳧@@�x\�/\'�e\�pu\0�@@�\��\�/\'�e\ZM.�@@ܠ�[;1\'��-\�R�@@�-�\\o3\'�\ZN��o�@@f\���5\'�\�-���@@�\��\�7\'�\�L���@@Z_&:\'��\�􃺨@@�\�(ϼ<\'��\'\�Ȩ@@t��\�>\'�\�\��Ө@@Sͬ�@\'�}%���@@J\�D\'�7\�xͫ�@@|Bv\�\�F\'��\����@@ZՒ�rH\'��d:tz�@@v6\�L\'�k�#�]�@@Ĵo\�N\'���\�\�L�@@���)P\'�{JΉ=�@@[�\�\�Q\'�Ǻ���@@�C\�HX\'���	��@@V�P�\�Z\'�AF@�#�@@z�I|\�\\\'�;\�Ԗ:�@@ʉvR^\'�\�\�v�>�@@[#�qpa\'�K�\��>�@@\�\�\�\�\�h\'�\0�d\�F�@@��9Dl\'�V�&�5�@@<�Dn\'��R?o*�@@�˵hr\'�)$�\�;�@@\� !\�t\'�N�\�\�P�@@2>\�^�u\'���\�#b�@@kJ�Gw\'��n/i��@@�\n�z\'�\�\�Ȯ��@@&\�\�H|\'�v�S�@@\�\�$[]~\'�¿\Z3�@@	�`\��\'�\�\�\�d�@@\���c΃\'�HnM�-�@@\��\��\'�B\����@@�Q��\'�\�mr��@@\�Mɉ\'�vP�\��@@\�>\�ɋ\'�y\�Z�@@��\'*�\'�\�\��@@K��z2�\'��s�Lh�@@�s�Lh�\'��6ǹM�@@GXT\�\�\'��)\�:�@@\�,\�i��\'��1�Mc�@@�#Ed�\'�\�4D��@@����\�\'��yUg��@@0)>>!�\'�\�H��r�@@ٰ��(�\'�obHN&�@@\�,�s��\'�\nj�֧@@\�\�\�m�\'���L�N�@@���y��\'�^\�/\�\r�@@Gq�::�\'�?�=x\��@@�}:3�\'�rS\�\�@@hZbe4�\'�Yk(��@@\�1Y\��\'�&\�\�\'d�@@˾+���\'��\�H.��@@rl=C�\'�4�\�k\�@@j�TQ\�\'��@�\"�@@ۆQ<\�\'�cԵ�>�@@>^H��\�\'���\�J�@@\�\\���\�\'�e�`TR�@@�R]�\�\�\'�\���N�@@q�5\�\�\'�r�\�ZC�@@A����\�\'�7T��7�@@*�\�\'���O�@@�aQ\�\'�p��Ө@@��\��\�\'���\�7��@@��{�?\�\'�\�L���@@��C�\�\'�|C\�u�@@�w\�1\�\'�*oG8-�@@a\�>\�\'��d#٧@@\�\�\�\�\�\'�d\�]Kȧ@@&�R?o\�\'�l%t�ħ@@\�X4��\�\'�h�\�s��@@�\�g�\�\'���\�r��@@\�?�C�\'�\r�����@@!\���\'��\��\�p�@@O��e��\'�&�fe�@@XU/�\��\'�up�x�@@�`�\��\'��D���@@�7�\0�\'�\��\'�@@�\�bb��\'�\�����@@?�{��\'���À�@@vöE��\'�d\��Ǧ@@!�bG\�\0(����{�@@�%Z(�=֌r�@@(\�\�h�(�>\�n\�K�@@P�V\�(�Lk\�ئ@@\���c�(�B��=�@@�R%\�\�\n(�LS8��@@��@�(�\�\�\��h�@@3��\�U(���\0n�@@J\rm\06(���\�\�Ǥ@@�H0\�\�(���TN{�@@Di\�(�e�\�E�@@]�\�a(�\��/�@@��\�\r�\Z(�{m\�ԣ@@��+f(�\0qW�\"�@@^�\"(��yȔ�@@5�\\��%(�f`X��@@��=\��\'(�=)�\Zڢ@@t\\�\�J+(�\�\�J̳�@@1%�\�-(��6\�\�n�@@<�\\�g1(��v�$$�@@�I4(�6�\�ϡ@@��L�7(��qS�@@�\r\�\�<(�R��m\�@@�֥F\�?(�S�u8��@@&�R?oB(�\��B�@@{��F(�\�\�^z�@@~ƅ!I(�W$&�\�@@�\��\�\'K(��2T\�T�@@�3��\�L(�kE�\�ܢ@@��+dN(�.u�׃�@@�\�P(�\�\�\�m�@@\rq��\�P(�:�Y��@@�\�rQ(�����@@�\�ĬS(��\�oB�@@J�\��T(�z6�>�@@vmo�$W(��++MJ�@@w+Kt�Y(��Gp#e�@@�[Y��\\(�\�=yX��@@g�8\�_(��*�ԧ@@���b(�\�O�Y�@@yY|e(�\�̓k\n�@@�O\0\�h(�?p�\'�@@��\�l(�nR\�X��@@\�&�\�p(�t\�ק@@\�1˞v(�w�\�oѧ@@�+�\�z(��L2r�@@�\�\�\�|(����e��@@\�\�\�\�~(��aN\�&�@@]¡�x�(�<g��@@t�\��(�\�]~�@@\�\��;�(�\�=�Ӟ�@@�&\"\��(� \nfL��@@(\�x�ߊ(�Ӥt{�@@ir1֑(�p���ӫ@@\���cΓ(���g�@@\�j�T�(�yt#,*�@@��y�C�(�Kt�Y��@@�\��n,�(�\�\�8\�\�@@D0.�(�1]�\��@@��[��(��`\���@@]lZ)�(��R%\�ޮ@@��*�\�(����kѮ@@ {��\�(�\�ʠ\�\�@@¦Σ\�(����\'׮@@o�ŏ�(�(-\\Va�@@H�RE�(���X�ʯ@@\�;1\�Ű(�\�\�ĭ��@@�\r����(�\�e��@@\�\���(�Z����@@\�Xl���(�L6l��@@m\�)\�(�\�)s�@@�l\�(��\�o\n+�@@������(��<\�ζ@@�,\�?2�(�*Wx���@@ܠ�[;�(�T���\\�@@��\��˧(�e\�\�k]�@@n2�\�(��\�\�U��@@c�:\0\�(�o����@@�_�L�(��,&��@@\���y�(�\�N�j�@@��7��(��`�un�@@\�\��r-�(��yȔ�@@\�l�(�M��\Z��@@_B��(�ߨ�\��@@��`U��(�R_�vj\�@@�V\n��(�\�捓\�\�@@�>�(�����5\�@@�v�(�[�D�A\�@@2��\��(�bod\�@@З\��\\�(��\'�8\�@@f�L2r�(��G,\�@@�\�o\�D�(�؛��\�@@.\Z2��(�(\�\�G\�\�@@\�H�5�(�?;\�b\�@@\�#F\�-�(�\�st\�@@P�mp�(�(d\�ml\�@@��\�\�(��H��Q\�@@Qf�L2�(��A_z�\�@@�\�����(�\"���\�\�@@@N�0��(�\�@�9w\�@@\�R����(�O<g\�@@ꗈ�ο(�3R臭\�@@|+\��(����-\�@@*p�\r\��(�Eh\�\�\�@@�\�d\�\�\�(�/�HM\�@@�\�Bt\�(���\Z�\�@@��%:\�\�(�\�N?��\�@@hyܝ\�(���@I��@@Wya\�(�uʣ�@@��vN�\�(��sѐ��@@Ot]��\�(�Ho��\��@@B��=\�\�(�s�ѓ�@@j�*�\�(�\�#)\�a�@@�Qԙ{\�(�k�*�@@\�8\n\�(�4�ތ��@@J	��z\�(�h@�5�@@�ǚ�\�(��-v���@@\�$\�\�\�(��(�N�@@��Os\�(�.u�׃�@@Ul\�\�\�(����.ļ@@c&Q/�\�(�V��Ά�@@3��J\�(���\"h�@@M���$\�(�-\�\�b�@@�]=�\�(��\�}�u�@@\n�\\\�\�\�(���6ʼ@@�c\�3�\�(���CR�@@\Z��\�\�(��il��@@�\�)1\�(�>����@@�\Zl\�(��St$�@@�s(CU\�(��\�J\�H�@@���\\7\�(��\����@@��\���\�(�2s�\�c�@@vnڌ\�\�(�\���\r�@@zƾd\�\�(�V�f��@@?\�W�\�\�(���\�!�@@F�7�\�(��[v��@@\�\�5\�\�(�\��\�˚�@@\��Q�\�(��\�u�+�@@�1k�\�(��3w��@@8��+\�\�(��\�\�T�@@��\n\�\�(�O��Dڸ@@_ѭ\���(�m�Yg�@@��\���(�ō[\�Ϸ@@�Rx\�\��(�mT�Y�@@�\�����(��S;\�Զ@@� \�K�(�U���N�@@��B\��(�2ZGU�@@���\r�(��&ݖȵ@@\����P�(����\�}�@@�� @��(��\�\�#�@@\���j\��(�2�#ٴ@@�V��\�\0)��-s��@@�Y2\�)�g�v��@@E|V)�k\�v/�@@�z�\�{)�Ih˹�@@B�۽\�)�\\�O��@@�\�\"[	)�\�\�\�Gó@@���\n\�\n)�e�`TR�@@�\�9x&)�\���{�@@\�\�.�\r)�����y�@@��\�\�a)�\�\��\"��@@�\�k��)�Z�$�9�@@\�,^)��\'*ְ@@��\��\�)��0(\�h�@@\��=\�)���u\���@@vöE)�\�j+���@@_�2\�\Z)�\�GĔH�@@G\r6)�\�ôo\�@@\�R#�3)��3Lm��@@\\\�tYL)�o\rl�`�@@�\',�\Z)��a�\��@@�\�I�\�)�3o\�u��@@<l\"3)���-u��@@\�`\�$\�)��*4˪@@an�r)�\�e�O7�@@\�q��\�)�ǁW˝�@@\�O\�\��)����v��@@d�\r1)�W\�Yʧ@@p\��/)����`�@@��Ù)��;\�䷦@@`\�� )�F[�D��@@=\�බ)�|\�o\�^�@@�8�@d)��\0\�mޤ@@�u��)�\���,A�@@N�W\�)����ْ�@@�={.S)�8�:V)�@@\�z�ю)�W\\���@@\0\�C��)�\�(�\�P�@@%\�pt�)��D�u��@@\�GĔH\Z)�O#-���@@��S�\Z)�`\�U,~�@@��1ZG)� &\�B�@@��&3\�)������@@ILP÷ )�]\�].\�@@\n/��$)�t\��\�מ@@�L/1�))��-���@@�~�f+)�ۅ\�:��@@��\'*.)��Z�kB�@@C</O/)�Hm\�\�~�@@\�e�\�t/)��y\0���@@#��\�/)�\�;���@@2t\�0)�w�\�o�@@&\�lsc2)��\�s��@@}\�\�\�E3)�(����@@�Go��4)���\�+�@@\�QcB\�5)�qVDM��@@;pΈ\�6)���乾�@@t\�f��8)�]\�\�7��@@�>;\�:)�7�X�O�@@�8�*=)��!�@@�%�L1?)�ܡa1\�@@�n�lA)�D��k��@@^��C)��C�l\�@@e\ZMF)��g�@@Ԟ�sbG)�eȱ��@@\�M�M\�G)�$%=��@@Q�B\�yG)��E`�o�@@\�VC\�F)�[x^*6�@@�m�\�EE)�\�\�\\n0�@@�شRD)�ywd�6�@@\�p;4,6)�܄{eޖ@@�\�\�5)��%Z�@@F�Sw5)�\�\\\�@@6!�1\�4)��f�\�I�@@��5�\�3)���n��@@�5�\�2)�{���@@�(�A&1)�#���@@��U-\�0)�{�Fw�@@�q�d�0)��C9ђ@@\n��.\�0)�~\�[�~�@@.X�x1)�\r�\�\�7�@@\'k\�C42)��,_�\�@@�\�I`3)�B|`\��@@�\�D24)�l\ndv�@@.\�R�4)��o`r��@@�:�*5)��	�8�@@:!t\�5)�z\�0\�@@�\n)?�6)�\�ȳ�@@ӆ\�\��7)��:���@@t}:)����\�q�@@ϤM\�=:)��-X��@@>v()8)�Z�!�[�@@�9@07)�\�;\�\r�@@9a\�hV6)�ӽN\�ˌ@@\�wE�5)�|C\�u�@@S{m\�4)�\�\�C6�@@\ZyY3)��Y�$�@@�\�D\�0)�\�\�\�@@ܟ���/)�Nd\���@@P)��/)�\�֤\��@@ལƄ0)��W歺�@@6\�$#g1)�\�n�Uf�@@e\�\�k]2)�K;5��@@q㊋3)�I��rډ@@�-��4)�\�\��@@$F\�-t5)��և�F�@@P�<�6)�\0{��@@�ީ�{6)�o~\�D��@@\�E\�\�\�6)�!W\�Y�@@�$y�7)�QhY���@@\rq��\�8)�\0qW�\"�@@�p\�GR:)�ۤ���@@W$&�\�;)� C\��@@b�1\�\�=)��\�\�ą@@d;\�O�?)�:�Fv��@@^\�\�_A)��\�\����@@x\n�R\�B)�F��0�@@\�}\�k\�D)�Mۿ�҄@@��ο]F)��\�\'c|�@@Ac&Q/H)��|$%=�@@`���I)��v��@@o\�!�aK)�\�\r�Q�@@:�Fv�M)�	PS\�ւ@@\�D�<M)��\���@@�W zRN)��\�唀�@@N�M\�gO)�w��-u�@@�\��\�Q)�f2\�g�@@F&\�\�HR)��\��R�@@9}=_S)�m\�i�*�@@�f\�|U)���|�\�@@�\�ȑ\�X)�\�>rkҁ@@�Vc	[)�vk�ǁ@@6\�e\�\\)����r��@@��n�^)� ��h��@@7�\',�`)�������@@\�^b,c)�\�S\�q�@@:?\�q\�e)��\���@@c��	�h)����hȀ@@a��\�|i)�:ZՒ�@@H,�j)��lXSY�@@��\\��k)�\�M�q\Z�@@AJ\�\�\�n)��B�\�@@>Y1\\p)��\�\�J\�@@���W�q)�\�q5�+@@��8�t)�(\�\�h�~@@\�x>\�u)��,��}@@(���v)��+�j�}@@�K8�w)��<L�|@@�b�Dx)�*�D/�|@@���iy)�_�iN^|@@Ӡh�z)�VG�t|@@�\�l�\�|)�IJzZ{@@CY��Z)�w.��z@@,�\�؀)�5�;�z@@�Q�U�)�w/�\�Qz@@w.��)�|�&\Zz@@;]���)�b�qm�x@@\�\�g\\8�)����\�Bx@@����)�}=_�\\x@@a�\�>��)�(c|��x@@r�CQ��)�\�}�u\�x@@%\�/��)�q�5\�x@@(c|���)�/�\�wy@@�{��)�CY��Zy@@��F!ɜ)�pA�,_y@@�\04J��)�\�u\�\�y@@D�X�o�)��\��y@@29�3L�)�d]\�Fz@@*\���P�)����\�\�y@@�//�>�)�;�vٯy@@#�-\�R�)�,g~y@@*�Z^��)�\��G�Cy@@�$A��)��\�1�y@@\Z\�X�)���\"\�z@@B\����)��4\'/2{@@F^\�ĺ)�G\�g\�u{@@仔�d�)�\\1е{@@��ڊ��)�t\�\�{@@��ȭI�)��.\�|@@��	\�y\�)��\rk*}@@7��\�)��!��g~@@6x_�\�)�\�~@@Ov3�\�)��W\��@@ҫJC\�)��;k�]�@@mp\"��\�)��7�-:�@@1x��\�\�)�>{.S��@@��\��\�)��Z�Ђ@@jh�\�)��RE�@@\�\�\�&�\�)��\�\�\\�@@��\�.4\�)�;�I�@@�?�ϝ\�)��>W[��@@l\�u�\�)�LqU\�w�@@OYM\�\�)�h���@@n��Ũ\�)���kЗ�@@��c\�)�y\\T���@@�\�\�)���ôo�@@\rR�\�)�_{fI�@@+0du�\�)��*8�@@\�J=B\�)�^H��0�@@<\�b�\�\�)�q����@@\�r�c�\�)�K�b�@@\�!\08\�)��;2V��@@\�\�<��)�OWw,��@@n\�\�S�)��j�с@@g\�;p�)�2;�ށ@@p|\�%�)�.\��:��@@���\�B�)��@j�@@:�w\��)�^��\�@@)[$\��)����2��@@�;k�]\0*�\�D��2�@@`��\�*���\�\��@@��\��*��p�\�@@ڎ���*�JV\�\�@@\n0,�*����\�\�@@\�]gC�	*��\�H�@@�\��G�*���ht@@L���H\r*�Mۿ�\�~@@A\�S��*�	Q�~@@r3܀\�*��p\�q�~@@�%Z*���K\�~@@\�u��*����W@@F�7�k*�oF\�W\�@@��\�6p*�\�	\�\��@@\�\"��*�s۾G�@@��#\�\�*�7R�H\�@@H\�?�*���֦�@@\�\�c>  *�\�{\�ʄ@@B]\�!*�\�0|DL@@���e#*�bI��@@��h\�x$*�\���v\�~@@�X32\�%*�h%���~@@\�\�t!V\'*��.6�~@@\�W))*�1�d�\�}@@#I��**�=\�!7\�}@@qN`:-*���c��}@@ګ��.*��[��}@@I�s\n�;*�#��}@@z\Z0H�<*���\�}@@qh�>*��	��}@@?T\Z1�?*�VH�I�}@@�c�~A*��^b,\�}@@\�Z{��B*���&k\�}@@�\n\�D*�\��i\�}@@�Ӂ��F*�P9&��}@@x{�M*�\�2��~@@\�7>[O*�臭��~@@\�\�A%�S*�\"\��~@@�N>=�U*���~@@\��lY�V*��\Z�\Z�~@@�ܶ\�Y*��RB��~@@�d\��[*�\��+�@@�\�\��9c*���X��@@\�@�]�e*��o\�@@.9\�f*�\�LLb�@@\�\�Z\�ag*��v�\n��@@\�*l�h*�k\�с@@x\�1!n*�Q�B\�y�@@\����o*�1@�	�@@V-��o*�aũ\�@@_D\�1uo*��^�@@h�>�n*�v28J^@@�\�\�\'p*���\0n@@^���q*�\n�i�\�~@@�ᱟ\�r*��聏�~@@h�.�s*�࠽�x~@@�C\�t*�\�\�\�1\�}@@�Y\�>\�u*��~�Ϛ}@@\"�4�v*�`>Y1\\}@@\��X32x*���M+}@@�j�	�y*�9B�\�|@@���%:{*�\Z\�1˞|@@2t|*�\�\��L|@@\����}*�\�d|@@�m��\�~*�i�\'�z@@��\Z��*�}>ʈz@@c��Ɂ*�_	�Įy@@+*�Z�*��p�\�y@@�V횈*�Ǆ�K�x@@�\��\�q�*���_\�|x@@ལƄ�*��B\�y�w@@��6ʒ*�h[\�:w@@v\����*�',1607362055,1607362055,NULL,NULL),(4,'Luapula',_binary '\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0-\0\0\�\�\\QJ�=@A�\�ǘ\� ��`<��=@eQ\�E\�\� �#�~�\r�=@�n�\�o\� �F@�#H�=@�d\�pu� ���]�9�=@\�Vд\�� ��q4GV�=@-�\�o�� ��-\�R\\�=@��Rx\�� ��\�g�=@ݕ]0�� �>>!;o=@����!���s\�~=@~T\�~O!�\�W�f,~=@��\�\�\�!�}\"O��}=@|E�^!�\�\��W}=@��q�\�\r!�0�AC�|=@�=#\Z!��B\�O�}=@2\�CP5\"!�U��N�}=@�={.S#!�s��P�}=@�!8.\�&!�\��|=@Ɔn�*!��v\�{=@*U�\�--!����A_z=@�ƠB/!��\�B��x=@��d91!�ҌE\�u=@�Z}uU8!�\��ԱJu=@o��\�T9!��V\'gt=@K\�H��:!��\��\�]s=@�>��;!��\�25	r=@8H��=!�xE�p=@�4c\�t>!�\��\'�o=@�]i�?!��^�So=@��+\�@!�\�G\�n=@,=)�B!�jL���n=@F~�D!�(*\�Tn=@���οE!�\�聏m=@\r\Z�\'�H!�\�46l=@�H¾M!��a��hk=@�%�P!�9�~߿i=@f�L2rV!�G\�\��i=@`#I�X!�\�Q\�g=@\�&p[!�\�س\�f=@\��\�\\!�#��e=@\�$\��]!�\� !\�d=@�\�\�\�_!��t<f�b=@7���b!�m6Vb�a=@M\��.f!�n�|�b`=@Ov3�m!�y=�_=@\��[r!�m��^=@`r�\�Zs!��#��U=@?9\ns!�?Ȳ`\�S=@��/s!�\�w~Q�R=@3܀\�s!�XƆn�O=@\�(ϼv!�JB\"m\�O=@�\�\�Xw!��D(bQ=@\�t!V�!��U��;Q=@x�a���!�c섗\�P=@�\ZL\��!�c��\�\ZP=@�{)<h�!��c@�zO=@�\���!�E\�[\��N=@ɒ9�w�!�#\�dTN=@;Qi�!�\�\�\�\�M=@\�\�;\�!��z��mM=@.X�x�!�\rR�L=@d[���!�|}�K�L=@�$�9�!�\�\�L=@[\�\�X�!�c|��lK=@�T��\�!�a\�9\�J=@�U�&�\�!��ܚt[J=@\�\�ih\�!��~��\�I=@�X�\�+\�!���8*7I=@\��X\�!��D�+G=@3\�ۃ\�!��\�2nF=@�$A�\�!��>�E=@\�\�[\�!�\�\�\�:E=@�Z\�\�\�!�>x\�҆C=@Sͬ�\�!��ฌ�B=@v\��ť\�!�k�)\0B=@�a��h\�!��m��A=@\"��\�\�!�\"nN%?=@d> Й\�!�O?��>=@\�o	�?\�!�\�\�\�(y==@s-Z��\�!����H�<=@�����\�!�m˟;=@�P�\�!�\�]M�:=@�gx�\�!�n½2o9=@�>��\�!�\�9\�5=@,(\�4\�!����\�3=@�혺+\�!��2T\�T2=@\�J�R\�\�!�\�\��\�$1=@\�T\�#�\�!�\���v\�0=@b���\�!�\�º�\�0=@t\�Oq�!�\�\"LQ.1=@��\���!�T\�\�$[1=@H4�\"�!�\�PS1=@ӈ�}�!�d<J%<1=@��n/i�!�Y���\�0=@qTn���!��\�6o�0=@Pō[\��!�\�ĭ�0=@�e2\��!�	�/��/=@\�{\r�q\"�l%t�\�-=@\�CԷ\"�\�镲-=@;��.R\"��\�n-=@����\n\"�}^�\�#-=@o,(\�\"�#0\�70-=@\��\�R�\"��O�\�-=@,am��\"�]�\�-=@ץF\�g\"���d9-=@w;S\�\"�\�P1\�\�,=@^�SH\"�|\�/�+=@�vKr�\"�\�E��(*=@�\�o�\�\"�k) \�(=@�RB��\"�\�d��~\'=@��\�\�\�\"�\�Pj/�%=@]ݱ\�&\"��y��\�#=@ݕ]0�\"�\�)�\�z\"=@ު\�PM\"�;�p\�G\"=@e8�π\Z\"���f��!=@���#\"�-%\�I(!=@l\���\"��\n�H� =@\�X\�\�\"�^=�1 =@VDM�� \"�\�\�H�=@{1�\�\"\"�W\�Y\�=@E�@J$\"�\��- =@[	\�%q&\"��:V)==@�:s	\'\"���/Ie=@a5��&\"�$c��=@(��\�\'\"�!��=@i\�\�I+\"�y��M�=@\�;.\"�9+�&�=@\\1е/\"��l\�\�=@\�\�?�/\"��4Lk=@��70\"�\'��> =@�\�!\�\01\"�5$\��!=@\Z\�.\�4\"�\"ĕ�w\"=@()�\06\"�\�\��r-&=@�E\�\Z:\"��\�ډ&=@ס���;\"�]��u\'=@�-��<\"�ᖏ��\'=@i��\�<\"�ɑ\��\�\'=@k}�Ж;\"�Vc	kc(=@R\'���9\"��Tl\�\�(=@q9^�\�9\"�\r\�n�)=@���\�:\"��\�J\n,=@U�3�Y;\"�x`\0\�+=@��Z}u=\"��\��9,=@Z\�\'�\�>\"�Q�%��-=@\\\�\�.�=\"��\�2n.=@���Y�?\"�y\�ՏM.=@\����A\"�����O.=@�3ڪ$B\"�Vc	k/=@ݳ�\�B\"��\\\�\�1=@\rĲ�C\"���k&\�0=@�0�*E\"�{O崧0=@l�6�F\"��k���0=@wJ\�G\"�Pmp\"�1=@\r\�-�H\"���rf�2=@$H�\�\�H\"�?\���3=@ 	�vI\"�\Z\�.\�4=@Dio��I\"�\�\�\�B�5=@�&M��I\"��]\�pX6=@�K�bI\"�>���6=@vŌ��H\"�+MJA�7=@\�\�v�>H\"�5\�\�8=@\�mnLG\"�HnM�-9=@؁sF�F\"�}�\��\�9=@ԀAҧE\"�v5y\�j:=@��i�:E\"��gx�;=@\�Q*\�	E\"�F�̱�;=@.\Z2E\"��\�鲘<=@>�>tAE\"�:�Fv�==@\�j�E\"�pUj>=@\�$��\�E\"���\�?�>=@��x!F\"���\�@A=@\�\�\�B�I\"�$F\�-tA=@\�;\�J\"�����A=@�\��\��L\"�4\�\ZB=@�d��O\"�~�$A�B=@Q�\�Q\"�\�V�\�,C=@\����Q\"�\�@H0E=@\�K\�\�T\"��ʼU\�E=@c���V\"�}\�O9F=@\�,��\�Y\"��:\�zF=@;�\�u�[\"��Rb\�F=@$^�\�]\"�z�ަ?G=@A	]^\"��9�w\�G=@�N#-�_\"���aI=@�{G�	a\"���)xJ=@\�\�c> `\"�&\��oK=@�H�[_\"�.�\�\�K=@\�\��_\"��\� �rL=@?U�ba\"�\�ȑ\��L=@n�2db\"�*�\�\nM=@`Z\�\'�c\"��\�J\�HM=@\'K��e\"�\�}͑M=@�H\�\0g\"��72��M=@\�\\5\�i\"�{��&3N=@�.�\�|j\"�%Z�xN=@\�o\n+l\"����GO=@`\�\�8m\"�[\\\�3\�O=@��:ǀl\"�\'jin�P=@sI\�vk\"�0\�r.Q=@RI��&j\"�\�\�\��Q=@)\�Ǻh\"��[\�d8R=@gE\�D�g\"���(�R=@���L�f\"��*8�T=@+/���e\"�I\�\�\�U=@���A_j\"�\�)\�\�FV=@�\�%\�2m\"��\�8+V=@��u�Xp\"�U�\�\�U=@�\rNr\"���tw�U=@-����s\"��2\��U=@�z�f�t\"�\�,\�\�V=@m6Vb�u\"�8��+X=@Ec\�\�lw\"�g\�|�|X=@��R^+y\"�p��:\�X=@\�ǵ�b|\"�\�)r�X=@sJ@L\�}\"�ys�V{X=@>]ݱ\�~\"�-yX=@{h+�\"�T5A\�}X=@k����\"�ɬ\�\�vX=@k��\��\"�)�\0�X=@\�\��e�\"�q\0��W=@j���<�\"�:3PW=@IC���\"��8d\�V=@\�/fKV�\"�\�h��\�V=@-��硫\"���\�\�V=@�3���\"�Χ�UV=@5y\�j��\"���\�o\nW=@\�\�S\0��\"�R��Z�W=@(CUL��\"��\Zg\�X=@�\r�D�\"�>^H��X=@�&\"\��\"���\�X=@#[AӚ\"��fd��X=@�,���\"��dȱ�X=@\�����\"��z\�\�Y=@�\����\"�v\�\�fGZ=@㥛\� �\"�E�*k�Z=@\�s`9�\"����gZ=@L6l��\"�\'k\�C4Z=@�b��	�\"�ИI\�Z=@og_y��\"�H\�)s�Y=@�����\"�\�fc%\�Y=@h\\W̨\"�R�8�\�Y=@\n�\���\"��<e5][=@��\�/�\"�2ZGU\\=@\�J��\"�w/�\�Q\\=@Y\�\�\"��-��\\=@j0\r\�G�\"�\�\n~b\\=@\Z�Q\r��\"�Tb.\\=@\0o�ŷ\"�\�w\�-;\\=@U�\���\"�Y�\�+�\\=@,���c�\"�nP���\\=@` ���\"�\��\\=@\�;���\"�\�W)�[=@�3����\"��\rk*[=@%!���\"�U\�YZ=@::Z\�\�\"��*�\�Y=@��� \�\"�y�t\�\�W=@S\"�\�\"��n,(V=@�7/N|\�\"�-�cyWU=@�wF[�\�\"�\�\�$�T=@���6\�\"�W@\�\�S=@�\�qn\�\"�$\���S=@��r۾\�\"�w1\�t�S=@m�_u\�\�\"�&\�5\�T=@�J\"� \�\"�iW!\�\'U=@O�o+\�\"��\�Nw�T=@_&��\�\"���ՑS=@� ��q\�\"��0a4+S=@`\"\�:�\�\"��5\�e�S=@�\�Pj/\�\"��\�\�mS=@\�\�7\�\�\"�Y�oC�S=@\�4\�8E\�\"�;]��S=@��\�G�\�\"��]�9\�S=@�V\��\�\"��;��)T=@����\�\"�3�<\�T=@��\��\�\"�\� ���U=@\�y\�9[\�\"�\n.V\�`V=@K!�K\�\"�Rb\��V=@�\�Pj/\�\"�\�\�\�eW=@e\�VA\�\"��d\�puX=@�Y�\�!\�\"�4��E`X=@AEկt\�\"�\�j,amX=@��\�\�\�\"��a��\�X=@�z\�\��\"�p_\�Y=@:vP��\"�L\Z�uTY=@�=b��\"�7T��7Y=@�[\��\"�歺\�X=@崧\��\"���|\�rY=@��b���\"�#����Y=@��B\��\"��2\Z��Z=@܀\�#�\"��\���\�Z=@\\\�M\r4�\"�s��Z=@)\"\�*\�\0#�,G\�@Z=@�2\Z��#��I�2Z=@jM�S#�ܠ�[;Y=@|�y\�#���ɩ�Y=@4�ތ�#���\�\�Y=@�\r�g	#�5$\��Y=@��\��\r\n#�^M���Z=@AI�0\r#�n��\�[=@\�|\\*#��@�Ρ\\=@�8\�Z�\r#��\��B]=@V��Ά#�\�1�\�l^=@��C�R#�in��\Z_=@T\�d�#���\'\�`=@�B�l#��\�`=@�!q��#�Y��L/a=@�A|`\�#�,\�F<\�a=@\�%�<#��\�\�̯b=@H\��Q#�\�\�\�#c=@e�\�E#��\�\�c=@�L\�#�YP�id=@B]¡#�\��ť*e=@dY0�#���m��e=@\�\�\0��#�U�q7�f=@YO��#�n\�(g=@ı.n�#�r�CQ�g=@��F\�#�I��_�h=@���\�#�\�\�\�%i=@#\�\�)\�#���j=@K��q�#�:3Pk=@��7#�g���\�k=@�qR��#�\�M)��l=@\�`�H#�ڬ�\\mm=@$�]J]#��\�ދ/n=@\r34�#�c\'�o=@�\��~#�\0\�3h\�o=@\�t=\�u#�\ZS�\�\�p=@\�\�bg#���N]q=@��\�K#�]lZ)r=@�[1\�#�c\�\�l�r=@}\�ݮ�#�rR��8s=@&�\�[X#�|b�*\�s=@4���#���3��t=@\�^(`;#�4\��`u=@>{.S�#�����Ov=@\�\'G�#���\�Xlw=@vQ��\�#�0��!x=@E�>�\'#��\�:��x=@��\�f#�\�cx\�w=@�0E�4#���C�lw=@o��\�#�\�\'�_w=@�F\�\�� #�c|��lw=@n4��@\"#�\�\�^zw=@G\�g\�u##�\Z\�\��w=@\�@1�$#��լ3�w=@V\r\�\�\�%#�}>ʈx=@��U�\'#�\�C?�w=@�1!\�*#�t)�*�v=@\�\�A%�+#�\�jH\�cy=@\�JU/#�_\�Qz=@�\n\�.#�0�\�mP{=@���oa-#��\�E_A~=@\�aN\�.#�\�ͨ�~=@ж�u\�/#�K�|%�=@\��&72#�~\�[�~�=@���_3#��V\�f�=@�,\'��5#�n4��@�=@�7N\n�6#���!r��=@Ze���6#�� [��=@I�f�\�6#�U��N��=@�Dׅ4#�_�\\6:�=@�f\r\�W5#�\��|zl�=@w\�ِ>#��Za�^�=@��ʅ\�?#�\�/o��=@u9% &A#�@j\'��=@]�B#��\�E���=@`\"ĕC#���-ʈ=@\�~O�SE#�-wf�\�=@N\r4�sG#��\�%\�2�=@2\�	\�\�H#�\�\�\���=@�\�qQ-J#�2��|�=@\�_{fI#�Ze����=@ip[[H#�\�x�ߢ�=@���\�G#�ퟧ��=@�Pk�G#�NA~6r�=@	�I��G#����^�=@+~��G#��� %�=@w��׹I#�]S ���=@.�\�M\�J#�Ww,�I�=@TT�J\�K#�`���=@�\��\��L#���>U��=@&U\�M�M#�,H3M�=@EH\�\�N#�ds\�<G�=@W[��\�N#�^gEԔ=@(��яN#��ȯ�=@\�r.\�M#�H��\'��=@\�Z_$�M#�֨�ht�=@���\�MN#�˃�9�=@$%=�N#��1\�=@\��/gN#��q����=@|�\�˙M#�A�G��=@�D�L#�z\�(�=@(�\�vL#�2��\�=@\���NM#�l\�f��=@G\�&jiN#���o\'�=@ѬlO#��x\��۝=@�>\�P#�W\�f��=@(a�\�_Q#�6�\�ϟ=@�\�t\�Q#�%\�\�RΣ=@2��|R#�u\�yƾ�=@:\��lT#��V\'g(�=@R(__S#��8�#+�=@�R%\�\�R#�7�C�=@��\�/fS#�F	�=�=@zT�\�U#���\�u�=@\�tYLlV#�\�ם\�<�=@�yȔY#��>�\�Ȯ=@ߦ?��Z#�;�vٯ�=@*q\�Z#�\�ȑ\���=@\�tx[#�A\r\�º�=@�\�\��q[#��{�O��=@\�,B�\\#�ByG�=@\�e6\�\\#���b��=@\�\��S\�]#�s\�}\��=@k*�\�^#��\Z�\�2�=@\�\�G\�_#�\�2��=@z�3M\�^#��fe���=@(d\�ml^#�r\�@H�=@K\�h^#�\r��W\�=@\�7�{\�]#�e\0�\�ƹ=@1C\� ^#��\'���=@�\�˶\�^#�%��r�=@\�<`#��>+�=@`�\�\�a#��ݯ|�=@\�\riT\�d#�d\�]KȻ=@W�c#g#�k��躼=@�\��\nDg#�؀q�=@�8�#+g#��_cD�=@�%\��g#�^f\�(�=@�6qrg#��\��=@s\��Ag#�=�N\��=@�\�\�Xg#�M֨\�=@��ӝ\'f#�\n��b\�\�=@)Z��e#�ۈ\'��\�=@�\�@-f#��\�\�\�\�\�=@\��,h#��I\'L\�=@�\�\�N�g#����\�\�=@\�u��Xg#���\�R\�=@\�\�8�	g#�t\\�\�J\�=@uYLl>f#��\�\�N\�=@D�Öe#�:$�P2\�=@�M�#e#�W@\�\�=@&�v��e#��Y,E\�=@\�\�wf#�a�ri�\�=@��Hh#�!�!\�\�\�=@J\��ci#��\�A�p\�=@�\�j#�\'K��\�=@�\�\�\�n#�\�\�\�\�>\�=@��oa\�p#�\�3�Ib\�=@��\�\�mr#��JY�8\�=@�M�x#�M��E\�=@�i�\�{#��g�\�=@=��tZ#�!\�X4�\�=@&S���#�\�\��m\�=@Bx�qĂ#��GW\�\�=@` ���#�%z\�r\�=@#���#�R~R\�\�=@\�\�e�O�#���Tގ\�=@�c\�]K�#��%:\�,\�=@6\�\�x\"�#�3܀\�\�=@L�\����#���\�3.\�=@��\�`ŉ#�`s�	\�=@���.5�#�)?��\�=@�$�z��#�\�.\���\�=@\�S�4��#��\�je\�=@f�\"ݏ#�\�磌�\�=@h\�\�`o�#��]ؚ�\�=@�,\�}�#�Ww,�I\�=@���2��#�N\�\�\�=@%xC\Z�#���y�C\�=@�\�\"[�#�\�n�Uf\�=@3\��y�#�\�^EF\�=@/�o�ӝ#�a\Z���\�=@y\�Z�#�~r \n\�=@	À%W�#�n\�8)\�\�=@?���#��d\�=@-��\�#��vٯ;\�=@U���N�#�\�\�K\�A\�=@ \�E\ne�#��\�T\�\�=@zZ���#�1\�\�PN\�=@Z�1\�	�#�K�P\�\�=@��%��#����D�\�=@5\�($��#�4�27\�=@֏M�#�#�\�\�\�\�=@-\�i���#��<֌\�=@���3ڪ#�s\�}\��\�=@\�\�\�N�#�\��J\�=@4-�2�#�o\�j\�=@\�_!s�#��\"���\�=@��\'\��#�\�ۃ�\�=@p\��\�#��\�zM\�=@b��\�\�\�#�\�5|\�=@��,\�\�\�#��&�\�\�=@zS�\nc\�#�\�熦\�\�=@?\�\�\�#�줾,\�\�=@\�X\�\�#�Xr�\�\�=@�e�\�S\�#�\�;1\�\�\�=@�71$\'\�#�^��\�\�=@\�h\0o�\�#��\�V�\�=@*��%\0\�#�<��f\�=@t\�Oq\�#�!#�\�\�=@P5z5@\�#���릔\�=@n\�y\�#��\��\�=@j�{�\�\�#�\�|@�3\�=@ZKi�\�#�\�CmF\�=@~b�\�#��I\'L\�=@�:�p\�\�#�\r6u\�=@��3ڪ�#�����\�\�=@��\�jd�#�\��K\�[\�=@�Ss��\0$�uU��\�=@��[;Q$�|b�*\�\�=@Nё\\�$�+�@.q\�=@ ��\0\�$�B\'��\�=@q:	$��=#\Z\�=@D�X�o$�Y6sHj\�=@6\�\��\�$�4\�?O\�=@���/�$�7\�xͫ\�=@\0\�	�$�a�X5\�=@��\rLn$�t\��\�\�\�=@$|\�o\�$�͑�_\�=@\���h\Z$����Kq\�=@\�}͑$��\rN\�\�=@E����$�~�,\�=@�;ۤ\"$�zpw\�n\�=@��c\�$$�\�J#f\�=@���1�($�+/���\�=@E�A�+$��\�\�<\�=@\�9?\�q0$�M2r�\�=@�sb\�3$�\�5\�\�\�=@�4�\Z6$��;�\�=@/\���\�8$�\np\�=@����:$�ꗈ�\�\�=@]1#�=@$�\�bFx\�=@\�\�\�\�B$�>���\�=@l#�\�fF$�\�8+�\�=@%?\�W�I$���a�\�=@\�up�O$��\�V�\�\�=@�|\�.PR$�!��\�=@\r\�n�U$�,+MJA\�=@5\�\�o�X$�g_y��\�=@=\�K�eZ$�^��v\�=@�� \�X\\$�}\�.PR\�=@��\�]$�\�e\�\�@\�=@Z�\r�\�^$�9\'�\�>\�=@\�!7\�\r`$�K\�\��\�=@eq��\�`$�p��\�\�=@8\�GnMb$�ۇ�\�\�\�=@d\�\�1c$�\��\�?k\�=@&��d$�xC\Z8\�=@%\�s}f$�\\ A�c\�=@�r�w�h$�y;\�i�\�=@\�\�%�\�j$�k�MG\0\�=@>�$@Mm$�\'N\�w(\�=@ū�m�o$�lw\�}\�=@�@��_p$�\�۟��\�=@\�\�\\QJp$��^�\�=@�Bus�o$��ͮ{\�=@�\�O\�n$��t\�=@e\ZM.n$�\���\�=@�_w��l$��V\�f\�=@7ݲC�k$����(_\�=@\�\�]\�k$�	\�P�\�=@�F>�xj$�m\����\�=@\�\�\�&�i$���H��\�=@\�э��h$�\�I�\�\�=@�T4\��f$�Ӿ��\�=@�QI��f$�L\��\�=@g,�\�Nf$��\r��M\�=@>��I�f$���\�}�\�=@^\�Y-�g$�F\�~\�\�=@J\n,�i$�R%�S\�=@Ɔn�j$��\�\�\��=@�R%\�\�j$�[\�\�å=@E|V|$�\�<0��=@FA���$�6�\��=@��o\'�$�Mg\'��=@�L!u�$�u:��Ԣ=@\�t\�\�$�zR&5��=@g���$��\��r��=@\�K8�$�\�HLP�=@�p\�\�H�$���\�N��=@M�x$^�$�3d���=@a\��w}�$�o�m�=@��@gҎ$�\���҈�=@$d \�.�$�	��8��=@�R{m�$�㊋��=@\�1��$�w|\���=@�cyW=�$��\�z�2�=@�;\�䷐$��N\�Pܑ=@\�\�i���$�$(~���=@\�(�[Z�$�\�ۂ���=@2�#٘$�m\�)\�=@\�-c}�$���X\���=@\0\�C���$�Lǜg\�=@M\��.�$�eS��.�=@C</O�$�q9^�\�=@��\�C�$�\�v|ӄ=@�h[͢$�Ϟ\�\�$�=@\rĲ��$��8�d��=@ß\�\�\Z�$��\�\�\��=@lˀ���$�+�m��=@\�Fu:��$�?5^�I�=@\�\�!��$� y\�P�~=@e�\�E�$�\�bb�q}=@\�\��@��$��=\�\n}=@�\����$�W\"P��|=@%?\�W��$�{�%9`{=@~\�Az��$��\0�6qz=@\�\�\�;��$�:\\�=\�y=@.\�l�I�$��#EdXy=@�5�Ea�$�r75\�x=@\�%�<�$�Z��mx=@A*Ŏƹ$��\�\�1\�w=@��\��$�+TT�v=@�{�P�$�m���u=@Pqx��$��X�vu=@^\��k�$�\'�o|\�u=@|a2U�$��=x\�\�v=@��խ�\�$�[A\�+w=@\���\�$���\�t w=@F\�T�=\�$�D�.l\�v=@,D���\�$��r�9>v=@���\�$��\�9?\�u=@1�~\�\�\�$����hWu=@\�xwd�\�$�y��\"�t=@7\��\�\�$�=+i\�7t=@�4F\�\�$�.Ȗ\�s=@d�\r1\�$��b\r�s=@W\\��\�$�0+\�~r=@\�3K\�\�$�\"\�\0�&p=@,\�F<\�\�$�\�Q�\�o=@\�mnL\�$��\�LLn=@r��&O\�$��O0�m=@毐�\�$��N�\�m=@��%:\�\�$�+\��l=@�aN\�&\�$����\��k=@�5\�;N\�$��$��k=@@�&M�\�$��!�[=k=@`X�|\�$��k=@�\�2\�\�$���Bk=@8\�q\�\�\�$��~�Ϛk=@m�s��$�eV\�p;l=@`���$��k���l=@�W\��$�\�9x&4m=@[&\��|�$�_\�\�,�m=@�s\�^�$��Ky n=@���\n�$��\�ԕ\�n=@��3���$�\�$��o=@�D���$�\�\0�&Pp=@�\�~K�$����T�p=@g�\�I}�$����\�\�q=@�/Ie��$��`<�r=@���\���$�A��h:s=@L�\�\�\��$�:#J{�s=@\r�����$��ި�s=@*�\�.��$��c#�s=@A*Ŏ\�%�	�vr=@o�UfJ%�\�WWjq=@��5�\�%�\�0C\�p=@t{Ic%�b���\�o=@r\�j��%�ٴR\�n=@R��/I%�ИI\�n=@c�:\0\�%�=\�\�\�m=@\�\rM\�\�%�od��m=@DL�$z	%�D\�\�\�m=@X)�k%�$}ZEl=@��ͪ\�\r%�>&R�\�k=@O!W\�Y%�ٕ��zk=@6v�\�%�+2: 	k=@nM�-�%��y�Cnj=@\Z2�%�\���\�i=@�\'���%�,I�\��h=@�\�\�O\�%���Tlh=@\���6%�\�\�>9\nh=@�F\�? %��\�\�2�g=@fL�\Zg#%�}x� #h=@�\�\"�t%%��lXSYh=@Իx?n\'%�$�&ݖh=@���?Q)%�p%;6i=@q�{��+%�����`e=@��++M:%�\��\�˚d=@\�\��g?:%���d=@�\�f�:%� �\�G�b=@�$\�:%��W\�2\�a=@A�,_�9%��2\�\�`=@����\�7%���k�`=@\�wak6%�R�U�_=@\n����5%���t?_=@D�7�4%�4.\�^=@|b�*\�3%�B@��\n^=@v�+.�2%�\�6�[=@r�\�71%�u�\�Z=@V�@1%�\��\�\�Y=@P\�\���1%�6\\�-W=@\�#�G3%�#�tu\�V=@�o}Xo4%�\�)\�\�FV=@�\�fc%6%�B@��\nV=@�E�x7%�e\0�\�\�U=@��pvk9%��\�?\�@U=@�r�w�@%���L�DT=@CY��ZG%���\�~�S=@\�ʦ\\I%�$���ER=@�+�`pM%�q�\�[uQ=@�i\�LO%�?:u\�P=@@��w\�P%�\�d�<\rP=@R,��\ZR%��\�#\rnO=@c_��`S%��Ky N=@^\��kV%��[�vM=@.��\�W%�\�&N\�wL=@�.6�Z%��$��K=@����[%��u7OI=@�8�*]%�1XrG=@p\��/_%�D�AcF=@(\�\�G`%�?�nJE=@\�\�\�+b%�){K9_D=@�m�sc%�\\�-\�C=@Ϊ\�\�Vd%�\"U��B=@%\�YI+f%�n�r�A=@Wya�h%��\�\�W@=@��Ơj%��;l\"3?=@؜�gBk%�H��\n>=@E���l%�I\�\�\�*==@�\�G��m%���7<=@��vۅn%�ԛQ�U:=@ȔA\�p%�3ı.n7=@�\�0\� u%������5=@��\�w%�T\�qs2=@\�c\"�\�|%���Wt\�1=@Z\�>\�-%����I1=@GtϺF�%�\�|?1=@cԵ�>�%���]ؚ1=@F\�W\�ǆ%����Y2=@��o\'�%�h\�$\�3=@ȷw\r��%�\�[��3=@\�\�~���%�Ϟ\�\�$4=@C��g�%��\�	K<4=@8�0��%�\"�\Z�\Z4=@\�\�c�%�\�,\�i�3=@*8� \"�%��_?\�3=@\�\�4}�%�\0��*Q2=@�B�Գ�%�q\�\�H/2=@i�\�\�%�(|�2=@QlMK�%����2=@�� =E�%��\n��1=@\�AB�/�%��\�Li�1=@R��\�%�cc^G2=@j4��%��e�YJ2=@&�\"\�d�%�w�(�2=@ܞ �ݥ%�4GV~4=@\�\�|@��%��\Z�44=@��Q�\�%�4�\�H4=@�\�zM�%�s��+4=@i�\�r��%�8��+4=@\�\�Sǲ%��E}�;4=@X8I�Ǵ%���1=a%=@��\�ǵ\�%�9\��\�$=@��c�M\�%�\�4�O$=@\�1!\�\�%�*T7#=@�\�\�U�\�%�\�O\�\� =@\�a�\�%�$(~��=@�oC�\�\�%��jJ�=@\�j,a\�%�T\�*�g=@ <�\�%���<e=@5\�|\�\�\�%�ZF\�=�=@]�6\�\�\�%�t	�\�\Z=@ګ��\�%�\��o�=@\�tYLl\�%�\�1�\�=@�u�|\�\�%�U�\�\�B=@гY��\�%�5B?S�=@�V\n�\�%��\�w�=@��\�\�\'\�%��\�im=@�\�BW\"\�%��(\�\�=@y\�P��\�%�k�)\0=@s�\�h�\�%� ^\�/\�-=@<��\�\�\�%��X��5=@[{�%�\�mU==@Q�+��%���jQ<=@v�;O<�%����\�<=@N�\��\0&�\�@׾�>=@�_�\�&�\"nN%?=@\�Ƃ &��^�2\�?=@��f��&�;\�\���@=@�7M�&���~m�@=@\�\Z�\��	&���V\�\�A=@[Υ��&�n\�\�)C=@\�L0�k&�}\�\�\�E=@��i�:&����\�F=@J)\���&��|]��H=@���Q&�R\�\��I=@:ZՒ�\Z&��~��\�I=@!;oc�&�JF\�J=@��$Ί &�Ւ�r0K=@�\�<�!&�\�\�5\�K=@L5��\"&��۠�[O=@)\�\�=$$&�Z\�\�Q=@dϞ\�\�$&�ѬlS=@���\�%&�ș&l?U=@��>U�&&�]\Z��JV=@1�{�O&&�\�\�!�W=@�J�*&&��\"�4Y=@��Wt\�%&�ё\\�CZ=@9�]�&&��\�	h\"\\=@\�S:X\'&�@KW��\\=@��n(&��a��\�\\=@\Z����)&�9a\�hV^=@L8�-&�R%�S_=@i�-�/&��(�\�_=@\Z�\'�X1&�\�J\n,d=@�b(\'\�5&��,&�d=@�|]��4&�\�R\\U�e=@�\��\r\�3&�)x\n�f=@\0\Z�K�2&�\�,\�i�g=@�R\�h2&�\�8)\�{h=@E/�Xn1&���H��i=@߈\�Y\�0&�fN�\�\�j=@s�\�c\�0&�%\�?�l=@\�bE\r�1&�G\�&jm=@���0�2&�79|҉l=@ƥ*mq&�X���l=@k�]h�&�/N|��l=@�P\�\Z&�\\���l=@辜ٮ&��	.V\�l=@/�\�&�Zf��l=@\�5w��&�u\�Hg`l=@��}&�<l\"3l=@]߇��&���\"��k=@�Վ\�\r&��[\��j=@H¾�D&���0�:i=@;8؛\n&�8��\n*f=@n\�(&�fj�!e=@\��\�w\�&��\�R��d=@6\�e\�&�1~\Z�\�c=@\"5\�b�&�\�t��.c=@\�2�g�%�?\ZN��c=@�1\0\��%�\�:��c=@`s�	�%�nڌ\�e=@�\�8�%�L\Z�uTe=@s�69�%��	��e=@�/�\n�%�\���\�e=@Eb�\Z�\�%��4`��e=@\n/��\�%�7\0!f=@gc%\�Y\�%�h\�ej\\=@MK��\�%�dx\�g�\\=@\�\�\�\\Q\�%��\0Ϡ]=@M\�\�u�%�\0���!^=@��۞ �%��̔\�\�^=@3�&c�%�YM\�]_=@獓¼�%����`=@V�)���%��X�\�+a=@�N�\�\�%�\�S�4�a=@�\�!ƻ%��i>\"b=@78�ں%�\�bԵ�b=@	l\��3�%�\�7\�q\�c=@\0R�8��%�֫\�\�d=@\�ahur�%��	�i�d=@Ή=���%�\�{c\0f=@�\�\�ɳ%�B��	\�f=@��-=��%�\�:]�g=@�8�ṯ%��jIGi=@q=\nף�%��[1\�i=@��\�P�%�\�!\�kj=@ޑ�\���%����w�k=@�f�\�6�%�o���l=@P�mp�%�|��m=@K<�lʭ%���il�m=@\�˙\�\n�%��P�v0n=@��c${�%��\r�o=@-\�\�a�%���\�o=@�\\4d<�%��\�\�_Zp=@\�qs*�%�\�\�7\�p=@�\��5\"�%�\�!��\�q=@]\��զ%�5�؀t=@�`8\�0�%�\���}v=@�X�\�+�%�S\�Q�w=@�Q���%�ӡ\��nx=@-��吏%�g��ey=@�T\Z��%�s+�\�Xz=@�1\�%�/o\�j{=@w-!��%��5C�|=@RcB\�%�%�\0Sh}=@\0\�C���%�n\�\�S~=@\Z�[ A�%�l�\�~=@��>s֗%�Kr��&=@\r�R	�%�⏢\�\�=@\�\��%�%�\�g\�u��=@t��%�%�iƢ\�=@\�ZD�%�\�\�\�\�\�=@�䠄�%�ѕT��=@{\�\"0֏%�I-�LN�=@^�\��%��\�3��=@�����%�2�\�̃=@\�\\T�%�\�,%\�I�=@�\��<��%�(�����=@1\�q�	�%�$\�F�=@\��\��%�P\�2�ˆ=@\�\��!o�%���C�=@��\\\Z��%���\�ާ�=@f-���%�rm�\�=@b1\�Z{�%�\��fH�=@��\���%�73�\�p�=@��\�ׅ%�v\�~k�=@�ZӼ\�%��YJ���=@6Φ#��%�F�Sw�=@=|�(B�%�N\�&�O�=@��;��%�cB\�%U�=@��! %�Z�\��Z�=@*�TPQ}%�#�	��=@,\�\�f*|%�������=@X7\�{%�\n�\���=@%�c\\qy%�k���#�=@\�\�H��w%�ǟ�lX�=@uv28Jv%����Or�=@3�ٲt%�_a����=@`���fs%�\�Ԗ:ȗ=@,I�\��p%�r�\�7�=@���m%��p\�=@�\��>l%��\�����=@\���7k%��Y�b+�=@7m\�i�j%�͐*�W�=@T�\�j%��ܶ\�=@\�c> \�i%�|���=@\�\�\�/�i%�#�	��=@\�(yu�i%�{נ/��=@\�ۻ}i%����-��=@a��Mi%�N��;P�=@���,\'i%�C�\r��=@:�6U�h%�\�\�v��=@��\��h%�\�	F��=@�2\�Fi%�\��r-Z�=@jL���j%�C\�K�=@�o\�\Zl%��\�}�=@�PoFm%�\�^fج=@�YO�n%��Q�U�=@.W?6\�o%�||Bvޮ=@À%W�p%����v��=@\r��x�}%�|�i\���=@\��Po~%�O[#�q�=@\�5\�Ѐ%�u��.��=@R\�Q��%�y7R�=@�8��Մ%�i7���=@\�Z_$��%�%\�/��=@T�n.��%�lw\�}�=@U�\�\�B�%�$\'�\n\�=@*Wx���%��*�WY\�=@�D\�Ɵ�%�%!���\�=@�Ac&�%��4\�\�o\�=@^�}t\�%�\��X\�\�=@A\�\�\�\0�%�_b,\�/\�=@2�\�l�%�od��\�=@C�\r��%���q�\�\�=@�̕A��%�]�\�$?\�=@b�A\n��%�����	\�=@(�\�v�%�(\�\�h�\�=@?q\0��%�?\��\�=@�\�\�c>�%�S\"�\�=@:τ&�%�\�ǘ��\�=@�\rk*�%�\��\�\�\�=@\�g@��%���ôo\�=@\�E��(�%�\�9\�\�\�=@��?N��%�\�A\�L�\�=@cAaP��%�s��/\�\�=@,���%���\�`�\�=@7m\�i��%��\�\�\Z�\�=@pD��k�%�\�:��\�=@ףp=\n�%�e�\�2�\�=@:<��Ө%�?�Ң>\�=@TpxAD�%��B\�O�\�=@1\�0&�%��FN�\�=@��n��%����\�\�=@\��_ �%�K<�l\�\�=@\Z����%�\�m3\�\�=@*���[�%�!撪\�\�=@�\0�w�%�(Hlw\�=@F\�v�%�\��R\�\�=@�D���%�i�\�=@Ǽ�8d�%�\��\�o\�=@\�_ѭ�%�\�2�g\�=@\�p����%��v\�\�=@���=\�\0&�p?\��\�=@֍wG\�&�G ^\�/\�=@\r�\�\n&�9�ߡ(\�=@2>\�^�&��w�\'-\�=@rP\�L\�&�\�*�)\�=@\��mR	&�f2\�g\�=@\�\�h��&�!�!\�\�\�=@\��QF\\\�&���|�\�=@ʩ�aj\�&����\�=@\�Z&\��\�&��\�\�B�\�=@#��\�i\�&��8�d�\�=@�\�\�\�&�=}��\�=@\�\�U+\�&�u\�Hg`\�=@�o��1\�&�>w��\�\�=@�L���\�&�ޓ��Z\�=@Qi\�\�>�&��V\n�\�=@W��\��&�PVW\�=@�\�\n��&�]��\�l�=@�Z�\Z��&�ӄ\�\'c\0>@�\���w&�jj\�Z_>@\�y�tu&��u��]>@Cr2q�\�&�ٰ��(x>@\\\��\'�% &\�Br>@p#e��\'���^~�q>@9�@d�\'��D\�\�p>@\�K�\'\'�\�	�o>@\rra�\"\'��\�g\�n>@||Bv\�&\'��30�n>@\�N\"¿(\'�(ђ\�\�n>@\��\\4d,\'�)x\n�n>@5��6\�.\'��lY�.o>@h�\�\'�0\'�Sx\�\�o>@��Ơ2\'�I�0ep>@\�xͫ:3\'�0\�\r\�q>@��B�6\'�G��tq>@ڨN:\'���\�\�q>@\�&��<\'�\�\�8�	S>@�DKO�\'���?�:?>@+�m��\'�=`2\��=@�>\�¹\'��s�\�\�=@\�6��\�\�\'�M�\��\�=@�ꭁ�\�\'�O\�6��\�=@}\�\�\�E\�\'���\�+\�=@�u�;O\�\'�Ku/3\�=@�t\"�\�\'�`\�\�\"\�\�=@\�\�\�\�\�\'��\�z�2\�=@\��+\�\'�b���\�\�=@�\�ǘ�\�\'��Q,��\�=@�S�<\�\'���\��\�=@��\�:8\�\'�!�!\�\�\�=@]��\�l\�\'�y�\�\�A\�=@\�m\�8\�\'�kQL\�\�=@\�%�\�:\�\'�e�<\r\�=@�=��\�\'�\�\�\�=@�\�\r\�\'�\"rl\�=@(a�\�_\�\'��g��\�=@\���}\�\'��q\�\�\�=@-$`ty\�\'���[�\�\�=@����\�\'��\Zٕ�\�=@\���\�\�\�\'�\����\�=@*1	\�\'��~�{\�=@%Z�x\�\'�Yk(�\�=@\�,\�\�\�\'��V`\�\�\�=@���0(\�\'���N\�\�=@�m5\�\�\'���$y\�=@|\��\�\�\'�@\�,\�\�=@F|\'f�\�\'��f��}\�=@�Y/�r\�\'��ΡU\�=@�b��\�\'�Q.�_x\�=@&\Z�\��\'��\�Y�N\�=@\�\�tp�\'�\����^\�=@p\���\'�\�w(\n�\�=@%w\�Df�\'�{1�\�\�=@f�\"\��\'�\�):�\�\�=@\r34��\'�2r��\�=@\�S\�q�\'��Y/�r\�=@;\�bF\0(�\\>��\�=@\�\�V%(�\r\�W\�B\�=@=\r$}(�Xc\'�\�=@\"¿\Z(��\�(�\�\�=@Hk:!(��a\�\r�\�=@3Q�\�\�(�!���3\�=@�\�s\�v(�֏M�#\�=@9\�Z��(�Qf�L2\�=@=��\�(���\���\�=@\�ù�	(�\�\�f�\�=@x�\�\n(�8N\n�\�=@��x\�(�ut\\�\�\�=@�2W\r(��x\�\�=@2:=\�(�%��C\�=@�\�\�\'(�����\�=@Y\�\�;(�ٰ��(\�=@K\\Ǹ\�(�\0t�//\�=@Z\�\�(�\�v�\�=@7p\�(�oc�#\�\�=@+�6+(�R`L\�=@\��8�#(�\�\0l@�\�=@lˀ��(���~31\�=@͒\05�(�\�\�\�\�=@�\r�\�(�\�0��\�=@F\�T�=(�b\��vK\�=@\�̯\�\0!(��\�o\�\�\�=@9F�G�!(�`\�U,~\�=@C��f\"(�S<.�E\�=@��\�>\�\"(��oC�\�\�=@a8\�0C#(�/�Xni\�=@;V)=\�#(�}˜.�\�=@ZGUD%(����s\�=@u��\�a&(�^-wf�\�=@u=\�u\�\'(�\�O�}:\�=@5\�\�o�((�\�\�m\�=@j�\�G)(���k\�\�=@&�\�:�*(��\��\�=@%vmo�,(�\� ��\�=@�闈�.(�\�\ZJ\�E\�=@��\�\�.(�	2*\�=@\�^0(�K\�ó\�=@��D\�1(�1\�q�\�=@B&93(�w;S\�\�=@\�\�9?5(�Sv�A]\�=@\0���6(���\�\�\�=@�H�}8(�is�ۄ\�=@����59(��\�ԕ\�\�=@\�\�4�\�:(�0\�a�[\�=@M-[\�<(�4J��\�=@^�\�>(���ɩ�\�=@�\��\�?(�~W�[\�=@]¡�x@(�\n\�F\�=@G\�g\�uC(��\n\�\�=@���\�lD(�\�xͫ:\�=@\�n�1H(���0\�=@�R\�hJ(�����\�=@GɫsL(�_\�(\�Q\�=@m��\�L(�\�5�\�\�=@�\�C�L(�t�\�=@9�	�\�L(�幾\�=@\��~j�L(�iE,b\�=@�B˺L(�j�TQ�\�=@�\���^M(��\�qn\�=@���4)M(��\�x\�@\�=@\0�)U�L(�N\�w(\n\�=@�3�\�K(�Q�i>\�=@b\�aL�K(�?\�6��=@Q\�E\�O(�9Dܜ�=@?\�ܵ�T(�B]�P�=@\�8�\�V(�}\"O���=@_]�\�X(�\�\�l�=@\�\�+\�[(�\�\0OZ��=@�dȱ�\\(�\�\���=@�6�X�_(�S>U��=@\�\r��[c(�>v()�=@�4��-d(�\�ډ���=@m;m�f(�.W?6ɻ=@�\"�\�Jf(�6rݔ�=@LqU\�we(����>�=@��U�\�f(��Ӹ7��=@%�\�\�g(�>��=@�Ǚ&lg(��\�\�&ܷ=@�s�Lh(�����۷=@��\0\�i(�U���N�=@�쟧k(��,&6�=@\��Pon(�e��~��=@�뉮o(���\�h\0�=@!=Eo(�%��r�=@�\�\n(t(�\�\�ne�=@\��\�t(��&��=@\�A�p\�u(�w�k�F�=@��ڊ�u(��J?\�\�=@nߣ�zu(��\�mP��=@k~��Eu(�ɪ7�=@\�蹅�t(�~V�)��=@(�\�Z&s(�3�f��=@l%t�\�q(�ߦ?���=@����	o(���\�@�=@X\�eSn(�¤����=@kD0.m(�>ϟ6��=@f\�-�n(�Y\�+���=@��\�o(�e��ҝ=@.9\�n(��o��1�=@zlˀ�l(�\�N�j�=@\�$\�\�j(��:����=@�#Di(��I/��=@�tx\�g(�ͮ{+�=@\�\�T�f(�\�X�yV�=@��Sf(�@�J���=@�\�\�B�c(�2!撪�=@>\"�Db(��mQf��=@-]�6\�a(��	j��=@\��R%b(�F\�-t%�=@��\�\r�b(�������=@-AF@�c(� \�!p�=@��\�/fc(��%\��=@r\��\�a(��4�B�=@\�$#ga_(��lY�.�=@�\�\���^(�#��ݯ�=@/��`(�V-�=@�&l?c(��P�\��=@[\�7\�qc(��TPQ��=@\�i\�e(�\�z�V��=@eo)\�e(�od���=@�i\�q�f(�,am���=@\�Aȗh(�m����=@/O\�Rj(�!����=@\�l\�%�k(��1w-!�=@z\�\�m(��\�k���=@\�\�%��n(�\'�;�=@)���o(�\�ECƣ�=@\�C\�\�\�r(��z���=@���x\�s(��\�]M�=@;s	\�s(�\�\�\�k�=@�sb\�s(���8a=@\��I\'t(�\�\�q5��=@�6�ُt(��\�\�\���=@�9�\0u(��)�=@�.Ȗu(��X�\���=@`<��v(�C˺,�=@��\�9\"w(��P�%�=@��հw(�P\�Lۿ~=@\�x\"��x(���\�\��}=@�\�!\�y(�vl\�u}=@\�)\�z(�\�ꫫ}=@�K�;�{(����\�\�{=@_���}(�:̗`{=@\�`�\�\n(�w.��z=@\�3h蟀(�\�\�\"�z=@�=ϟ6�(�!\�hUKz=@8����(�r2q� z=@���\�_�(�N\�\�y=@���5��(�rn\�y=@\�f����(��\�t=y=@\�\Z�N�(�Mg\'��x=@��\�\�(��5\�ex=@�ѓ2�(�\��\�w=@\�D\����(���yw=@LTo\rl�(��q\�@Hv=@\�\�m4��(�\�\�Ŧu=@\����(�W��Mau=@��CR�(�2\�3/�u=@LK�(��3w�u=@��ȭ�(�/��\�\�u=@�r0�\0�(�{�юv=@/0+\�(�FCƣTv=@g�\�I}�(�\��c�v=@�h\�V�(�c\0�=w=@T\�T�	�(��Ƥ�w=@\�|~�(�\��jx=@\�H��r�(�\�o\�DIx=@��ZӼ�(��\�T��x=@3�p�a�(��\Zb.y=@+\�MF��(���eky=@��\�i2�(�O\���y=@\�w���(�\��Q�z=@2t\��(�\��-�{=@�\�;�(�(����\�\�{=@��\�\�(�@�\�߼|=@[C���\�(�Q1\�߄~=@��!9�\�(����*P=@ѭ\���\�(�VDM���=@S	O\��\�(�1}�!8�=@^����\�(��X\��\�=@JΉ=�\�(��˷>��=@�\'�8\�(�\�\�$xC�=@\�3/�\�\�(�Y\�&��=@�Q\r�=\�(��֦���=@m\�\�~�\�(��6U�Ȇ=@\0\�4\�(��aQ�=@,�\�N\�(�#�\�fF�=@�9$�P\�(�\�^EF�=@�n��\�(��I|\��=@3\�\�(\�(�~p>u��=@\�\�3�c\�(���9�=@�\�2nj\�(�\�;jL��=@\��1%\�(�\rq��ۄ=@�\"ڎ�\�(�CV�\�=@M\�*��\�(�\"U���=@\�ʽ��\�(�S��:�=@\�\�\�\�P\�(�����\�}=@ᶶ�\�(�1#�=}=@�\�\�\�(�r�\�{=@}�K�\�\�(�P9&��w=@�\�C\0\�(��<I�r=@�\�7\�\�(�S\\U�]m=@]�\�(���͋k=@6X8I�\�(�/3l�i=@�z0)>\�(��\�\�J\�g=@��\�<\�(�\�Xl��f=@\�xy\�(��w\�1e=@��D�\�(�,am��`=@0�Qd�\�(�j\�0\n�_=@q��\�h\�(��\�9\\=@i\�\n�\�(�\�R���Z=@\� ��\�(�L�\��\�Y=@r1\�q\�(��[ɎY=@\�I`s\�(��ѓ2Y=@�D�+\�(�]¡�X=@\�\�~��\�(�\�\�5\�W=@��\� �\�(����\�V=@��/\�(�3�<\�T=@�\��x\�(�\'�5�T=@��D��\�(���\�T=@yGsd\�(�|a2U0R=@��Or�\�(�\�ZH�P=@QlMK\�(�V\�`\Z�O=@+���\�\�(��N>=�M=@A\r\�º\�(�\�ԕ\��L=@�m\�(��*�\�L=@�@�M�\�(��k���L=@(�N>=\�(�ǃ-v�L=@\�B��\�(�\"7\�\r�L=@܃�/\�(��a���L=@�ZD�\�(�\�מYL=@����\�(��3iSuK=@\�Y-�\�\�(��`R||J=@\��/\�\�(�\�-��\�I=@uV\�1�(�=c_��H=@���H�(�P��nG=@ͭVc�(�~\�Az�D=@@�\�߼�(�\Zެ��B=@\�\�#�(����s\�A=@[\�a/�(��\�\Z�A=@ˢ����(�Xr�\�<=@\�M�\��(����z:=@tF���(�?\�,\�7=@\�\�ZѾ(�:\�5=@[�*\�M�(�H\Z\�\�2=@�e�%\�(�}\�.PR0=@!���(��Fv�e,=@2s�\�c�(�VE�ɨ*=@d\"�\�<�(���%\0�(=@@��\n�(��KTo\r(=@�\�	�_�(�\��v\�&=@\�,{�(�\�u6\�%=@�x]��(�\��w\�$=@\�-W?6�(�\�\�l#=@e�fb\�(��?\�,!=@5�\�a0\�(�5��6\�=@{�\�v�\�(��6�=@�w}\�\�(�\�\�\��R=@MJA��\�(�@�C\�=@y�	�5\�(�aQ��=@\�\"i7��(�-ͭV=@G\�@�]�(�ƣT\�\Z=@\�a�\�4�(�A׾�^=@_\�(\�Q�(�i\�wa=@h\�$\��(�P\�2�\�=@�\�Y���(�\Z\�\��=@�\�#bJ\�(�]Ot]�=@){K9_\�(�ӆ\�\��=@�\�$\"�\�(��`=@�6\�x\�\�(���;P�=@���\�(�/��$=@1{\�v\�\�(�2 {��=@��=zý(�\"ĕ�=@~���(��}t\�\�=@r\�Z|\n�(�\�C\�r�=@\�R\\U��(�G\�?=@�5x_��(�;s	\�=@�	MK�(�$d \�.=@��u��(��4`��=@�\�<�(�\�4a�\�=@�\�P��(�!��q4=@n2�\�(��P�v0=@i��U�(�w��׹=@�x\\T��(�{��9y=@\�c[��(�]��ky=@���w�(�\���j=@�:\�(� \nfL=@�27߈�(���sb=@�\�G\Z�(�~��g\0=@�2�68�(��B˺�<@��0~\Z�(�\"U���<@^��yȌ(�\��ԱJ�<@�9>Z��(�>�x\��<@��B�(��\��y\Z�<@c\r��{(��?N�0�<@I�2�u(�j��%�<@(\'\�UHq(�\�$#ga�<@y\r�l(��\�!\�\0�<@\�1�\�d(��1>\�^\�<@t��\�^(�+j0\�<@\0Uܸ\�\\(�@a\�\�\�<@�ܚt[Z(�^�\�Nw\�<@�\�X(�R�(�1\�<@��Wt\�U(��\"���\�<@�\�\�\�S(�Wд\�\�\�<@\�\��R(�z\�rK\�<@\�.PR`Q(��v�\�<@X�\�IP(�+\��\�<@�\�\�\��N(�{�\�{\�\�<@\�7i\ZM(��o�\�e\�<@\�\�\�\�J(�j�t�\�<@�0�*H(��iQ\�<@��7�F(�N\��\�<@	\�\��C(���X\�<@\�蹅�<(���)\"\�<@h<\�y8(�+�\�X\�\�<@B�Ēr7(�~�\�!\�<@L\�\�\�4(��=Զ\�<@\�\�V\�/3(��1\�\�<@�/\�0(�K̳�V\�<@\�5\�Ko/(�m;m�\�<@��\��+(���0\�\�<@k�#�]*(����\�<@-��#�&(�\n,�)\�<@�f\�|�$(���\�`\�\�<@�πz3\"(�kծ	\�<@\�O=\� (��[w�T\�<@S\��F;(�ZJ��P\�<@&�<Y(��F\�\��\�<@�O:�`\Z(�j\'�;\�<@\�K�\�(��u��\�<@��b�(�����w\�<@\�L�x$(�����\�<@�m\�\�(���ި\�<@6\�e�s(�t\�\�\�<@\�`\"(�\'�_[?\�<@	�c\�\n(��\�:��\�<@\���\n(��\�\�\�o\�<@�-\�l(�\�A�\�\�\�<@C\0p\�\�(���TN\�<@z��\�\�(�\�\Zf\�<@c\�J!��\'����O�\�<@K?�\'���\�|\�<@H\�\�\�\\�\'�|\�%\�<@�W}�\'���Gߤ�<@�\�\��\'�\�mr��<@6Vb���\'�Zh\�4�<@�Դ�\'�~���<@�Or�M�\'��\���D�<@X�f,��\'�in��\Z�<@9\�\��\'�k\�\�^�<@˞6\��\'�\�ƃ-v�<@��e��\'�N\�&�O�<@B�4-�\'�}v�uŴ<@�I~į�\'��E�x�<@1DN_\��\'�2v\�Kp�<@<1\�\�P�\'�^���<@ӆ\�\��\�\'�a�^Cp�<@\���\�h\�\'�o.\Z2�<@��&��\�\'���?¨<@Ԃ}\�\'�A�C��<@t�\�Y\�\'��b*��<@�	�8\�\'�A���<@.�5#\�\'�\��c�<@�+��\�\'�EH\�ξ�<@���\n�\�\'��Y\�>\�<@�\��5\�\'���-Y�<@g\'��\�\�\'��lXSY�<@����\�\'�࢓�֟<@Ral!\�\�\'�\�\�%�ў<@�A\�\�\�\'�S%\�\�R�<@ˠ\�\�D\�\'�\�V�S�<@�v\�\'�7�ُ�<@�;\�\�\�\'��\��\�<@?e\�\�\'���\�Cޚ<@oF\�W\�\�\'�#.\0�ҙ<@:@0G�\�\'�2�\�n�<@gE\�D�\�\'�2�\�l�<@u�i�\�\'�\�\nE���<@^=�1\�\'��6\���<@2Ƈ\�\�\�\'�*:�\��<@;\�G\�\'�\�\�B�<@�3��\�\'�,�)�<@��q��\�\'����<@\06 B\\\�\'��\��\���<@�\�\�а\�\'�j��\�ȇ<@Eׅ�\�\'�u\"�T3�<@�P�\�\'��n,(�<@{JΉ=\�\'��\�k\��<@\npU\�\'�P�\�\�b�<@V�0�{�\'�O \���<@:Yj�\��\'�c섗\��<@m�\�o\�\'�\�%\�2�~<@�Un2\�\'�\�\�\�e\�}<@ \�E\ne�\'���kC}<@6l�ۿ\'����W}<@\�\�\�Nͽ\'�d\�\�}<@\r4�s��\'�/�\nҌ}<@P9&���\'�l%t�\�}<@��+f�\'��_��}<@7\�^���\'�2�Mc{}<@���dǮ\'�V~�}<@JbI���\'�\��}8H|<@�\\Ū\'��6qr�{<@�Ց#��\'��~4�2{<@�fd���\'�Lm���z<@��-$�\'�*\�#��x<@fN�\�Ħ\'�\�o\n+x<@*s�\�\'���)Wxw<@@OI�\'�6\�Kov<@]k\�SU�\'�l����u<@\��K�\'�e�fb�t<@\�r�ѫ\'�2\�%\�s<@\�Q�G�\'��\0��%s<@zS�\nc�\'����E\�r<@t\�\�q5�\'�Ҋo(|r<@Q�v0b�\'�\�T�q<@��&OY�\'�+��\�o<@!���\'�\'�2�g�o<@	S�K\�\'���\�M~o<@Ҏ~7�\'�$\�\�(�o<@�<HO��\'�\�J\�H�o<@Χ�U�\'�\�מYp<@kF���\'��G��\'p<@��Y.�\'��?��ip<@Ț�A\�\'��S�Dq<@)\�^Ґ\'�\Z��\�Ar<@=E7�\'�u\��s<@n5\�\�\'���Ά�s<@.X�x�\'�����s<@ep��:�\'�$D��r<@\rP\Zj�\'�\���\�q<@=Y��\'��dȱ�p<@��5Φ{\'��\�\�h\�o<@0���hx\'���9o<@ɫs\�v\'��z0)>n<@\�\�9?u\'�x	N} m<@��\�\�s\'�Ho��\�j<@H�m��r\'���\�\�1j<@�\�)rp\'�g�v�k<@\�� @n\'�`w��\�k<@\'K��m\'�j���<m<@<��.k\'�MM�7�m<@FCƣTj\'��ҥIn<@��M�h\'�{�/L�n<@��*Q�f\'����Wo<@&�<Yd\'��\"1A\ro<@k��\�`\'��\�Xl�n<@M�\��`\'�Y6sHjm<@z��^\'�}[�Tl<@?tA}\�\\\'�tD�K�k<@c_��`[\'�UMuk<@\�\n��XY\'�#i7��k<@9\'0�V\'�\�M�M\�k<@0�AC�T\'�U�q7l<@�D�S\'�G仔�l<@\����Q\'���ͪ\�m<@3��JN\'�*8� n<@�e��L\'�\'��\�Kn<@�Ø��J\'���}\�[n<@��mm\�I\'��y7n<@:d�wG\'�\��\��\�m<@yx\�\�E\'�u��Om<@<��fD\'��>l<@I\�\�\�A\'���\�uRk<@ۇ�\�\�?\'�\0���!j<@��\�\�\�=\'�*U�\�-i<@��?4�<\'�k\�m�\\h<@�.n�<\'��zO\�g<@\�	�;\'��j-\�Bg<@\r�\�,:\'�\0���f<@�\'�\�98\'�ИI\�f<@\� \�\�^6\'��.��e<@��<e5\'�\�\�\�\�>e<@�6qr�3\'�Mg\'��d<@����\�1\'�\�\�T2\0d<@z�\'L0\'��u\�~c<@W	�3/\'�]o��c<@\�O�}:.\'�,gb<@q�{��+\'�\�4\r�b<@(\'\�UH)\'��\�n�b<@#��u\'\'�\���b<@�\�\\\�%\'�dyW=`b<@/��\�u\"\'��W zRb<@��\�l\�\'�ڒUnb<@D�o\'��Ɍ��b<@�E}�;\'��-Y\�b<@N*\Zk\'�gG�\��b<@yv�և\'�\�;\�\rc<@{�%\'�A�c<@��e�\'�\�}��c<@�\�t\�\'��\0m�Yc<@T���r\r\'�\\W\�oc<@\�CmF	\'�Mg\'�c<@<p\��\'�\�Y5\�c<@\'�_[?\'�~�$Ad<@d\�\�1\'�\�\�6�d<@\�M\�\'�H�\��\�d<@�lw\0\'��I��	e<@�}�p�&�B\�\�\�De<@\�6p\��&��@+0de<@\�\�Sr�&�kծ	ie<@�ݳ��&�Ͼ� =e<@��5��&��\�,�e<@�\�(ϼ�&�\��we<@(���&�\�\�\�ke<@\�(]�\�&��\�\�f<@F\�W\�\�\�&��쟧g<@!\�A	3\�&���\�\�g<@\�4\�Ry\�&�%Y���h<@-&�(\�&���/i<@��<HO\�&�d\�\� wi<@�=\�W\�&��\�25	j<@��,\�&�{�\\�j<@j�\�\�\�&�XT\�\�$k<@\�\�bE\�&�\nL�ul<@}\�\�&�\�k\�\�k<@�f�8\�&��\�,�k<@n4��@\�&��;ۣ7l<@\�M\�&���[�\�m<@0�[w�\�&�\���n<@\�\�\�\�\�&�ƾd\��n<@~:3P\�&���f�\�m<@��8�\�&�\�f��m<@Ƈ\�˶\�&�j�\�{\rm<@W@\�\�&�P�i4m<@��\�a�\�&��։\��n<@�`\���&�\��{o<@k) \��&�L⬈�p<@<�\\��&�n\�(s<@�9Dܼ&��$���s<@׾�^��&�\n�s\r3t<@ni5$\�&�\�G�t<@RC�\r�&�M�J\�t<@�\���&��Վ\�u<@8h�>�&�����uu<@\�<���&�	q\�\�u<@|{נ/�&�Z\r�{,u<@�v�&�hwH1t<@�\��~�&�Q�Hmr<@\"\��Ԥ&��Y2\�r<@\�\��&�\r����r<@���&�\�,	PSs<@�\�J\�H�&�B��^~s<@\�@�9w�&�L�Qԙs<@Q�O\�I�&�\�\n(\�s<@�\�]���&���N]�t<@en�ݓ&��(_\�Bv<@]\��X3�&����mw<@p\�n�\�&�,�\�x<@.\���&�\\ A�cx<@��\��&�j�WV�x<@�@�Ρ�&��i��\�x<@�?\�0`�&�΋_\�x<@	�/���&�y�\�n�y<@Q�����&��^\rP\Zz<@�=B͐�&���c�z<@\�$[]N�&�\� \�hU{<@��\�u&�$(~��{<@&p\�n~&��1v\�K|<@�M�»|&��@��|<@�v5yz&��L�\�\�|<@���zv&���Ք|<@��@I�u&�\�?�=|<@\��.ޏs&�G���R{<@_F�\�\�j&�V}��b{<@\�G�3�i&�\��Dׅ{<@[��\��g&�,\�\�f*|<@�\�K7a&��E`�o|<@\�\Z�N`&�\�8EGr}<@*��\�[&�\�\�\�Z\�}<@\nh\"lxZ&�<���~<@�f+/�W&��C9\�~<@d\\qqTV&��\rk*<@�Z�[!T&�\��|zl<@�i�WVR&�\�\�^\�<@S	O\��O&�	�/��<@9\�Z��N&��fH\�<@\�V`\�J&��A\�f\�<@��;3�H&�\'���<@b\�cG&���\"\�~<@)��\�]B&�֫\�\�|<@D��k�<&�oe�\�2{<@KxB�?9&��4fz<@\�Vzm66&��)z<@GN��3&�g)YNz<@\�j�T1&�\��\�Fuz<@��\� 0&�\�4�z<@�<L�.&�Pō[\�{<@1Xr+&���A�V|<@�Q�U�)&�29�3L}<@\�%U\�M(&�q���~<@��:7m&&�G�Z\�Q~<@��M+%&�#I��~<@�N�o#&��wD�\�~<@\�2��&�.��\�~<@��c&��E\�~<@�%Z\Z&��Y��\�~<@�]\�\�-&��\��\�\r<@�@J\�\�&�H�I�O<@s�ۄ{&�-^,�<@(\����&�0Ie�9�<@�\�\�\�o&���c�<@[�\0m�&���*�؁<@pA�,_&�4�27�<@M�d�	&��乾�<@,G\�@�&�G\�j���<@s�9>Z&�����<@���&�,��\Z�<@�-�\�\0&�Ze����<@���_��%�~\��\�ς<@T\Z1�\��%��쿂<@�w\�\��%��lw��<@{\�l�%���5��<@4����%���\n*��<@��\�	�%�&s,廙<@5��\�\�%�]\�\�7��<@�\�\�L0\�%���f��<@�\�G�\�\�%��{�O��<@��Ơ\�%�Ωd\0��<@��\�\�\�%��o(|��<@j�*�\�%��yqȊ<@t\n�\�%����X��<@0,�-\�%�e\����<@�.o\�%���4�<@]�\�@\�%�\\t�\�z�<@V�\�#\�%�\'�􅐋<@\0\�Ȓ9\�%�:@0G��<@��%VF\�%�T��Yh�<@V~�\�%�\�\�p>�<@\��\�\�%�ʇ�j�<@�-��\�%�\�\�?�Ŋ<@O�C\�\��%����0��<@\�Y�%��;��؊<@.�_x%�%��f�\�6�<@����ɵ%�\�&1��<@Ӣ>\��%��\�<+i�<@�ׂ\��%�6W\�sD�<@Z~\�*O�%�K\�rJ�<@���r��%�5$\���<@9\��%�c_��`�<@Ac&Q�%�\�l���<@��\rN�%�\�\�̯\�<@�;P�<�%�_ѭ\���<@V-���%���)�<@z����%�mV}���<@\�QG\�Ր%� ��Ǘ<@}���%���\Z��<@��$\�%�\Z0H���<@\�Z_$��%�ӈ�}�<@��o���%�\�\�j+��<@\�/\�\r\�v%���z2��<@\�Ԗ:\�s%�՞<@W\n�\\\�p%�L\�1�=�<@O�o+e%�n�\�4�<@�68�b%�?\�-W?�<@���U`%����\�M�<@\�\�J�\�^%�X�%���<@-\���U%��vö�<@1{\�v\�R%�K�!q��<@\\\�d8�O%�}?q\0�<@\'1�J%�\��°<@�\�tBH%��r�]��<@����F%�\r����<@\�B��D%�R�Hڍ�<@�C%��;Mf��<@�Ӟ�sB%��EЬ<@$\�`S\�A%�*\��\�O�<@\��x�ZA%�\�)�\�z�<@~��k	A%���b���<@c�~�@%��*2: �<@�]i�?%���2p�<@�\�a�\�<%�\�8~�<@�ŋ�!:%���猨<@�M�8%����jר<@\��F\�4%�iQ�\�<@\n�Y\�>,%��ؘ\��<@��Os�*%��\�\�\'�<@\�4D�$%�?RD�U�<@�	\�y#%�\�\�V`�<@\�\�\�\�(!%�\�\�ME*�<@֨�ht%��a�1\�<@��L/1%�\�\�?��<@�8\'0%�Wx����<@y�ѩ%�X9�\�v�<@\�s��\�\Z%�\�\\5ϩ<@����\�%�gs�6�<@,am��%�a�unڨ<@\��v\�%��\�{\�ʨ<@*\� \�h%�\�ӹ���<@ޓ��Z%�W\\��<@%y�\�\�%�\�5�ꬦ<@���f�%�\�\r���<@�\�\'c|%�$\�@��<@+���%��\�\�i�<@,e\�X%�T9\�)9�<@1\�JZ�\r%�\��Po�<@M�\rO�%��쟧�<@>\�ɋL%�\"���1�<@3\��O%��#c���<@qZ�\0%�q\�\�<@�[w�T�$��\�t牣<@\�ԕ\���$�kg{��<@Þv�k�$�z�\�y�<@><K��$�qx�ܡ<@u\�yƾ�$�(���<@^�I�$�zo��<@D��~�\�$�\��\�\�<@\���\�$�{�Fw�<@1ҋ\��\�$���\��<@\�\�zi�\�$�Tƿϸ�<@��W\�$��L�T�<@\"7\�\r�\�$��o�\�e�<@��|�\�\�$��G,�<@`u\�Hg\�$���I\�<@���\�#\�$�p��Ӥ<@\�l��\�$�n3⑤<@�\rk*\�$�bi\�G5�<@\�\�N$\�$��DK�<@���4\�$�\�\\�mO�<@\�.�5\�$�/�ͮ�<@�{G�	\�$�aU��N�<@\�\�E\�$�ep��:�<@&7��5\�$��\�\�9�<@������$�\�l�<@�oa\�x�$�}\�\�z��<@���\�$����N@�<@�M�W\�$�\��9̟<@)<hvݳ$�`u\�Hg�<@��wc�$�d\���<@\��a�$�\�Xm�_�<@�\�\�\�$�C����<@t�\�)�$�X�\�0_�<@\�O9&�$��7U�<@*\� \�h�$�\�\n\��\Z�<@毐��$�1x��͡<@�4\�\�o�$�\�sD�K�<@<�$�$��:\�\���<@�\�\�{�$�\�\�\n~�<@���\�-�$�\'i��֞<@��\��$���Ss��<@\�\��m�$���]i�<@\�\�\�v�$�U���N�<@tA}˜�$�9b->�<@\�>\�ɋ$�\�\�PN��<@[\�\�X�$�A Cǚ<@\�\�\�\�$��\r�\�֙<@\ndv��$�\�ut\\�<@!W\�Y�$�A�>\�<@�ѯ�$�{JΉ=�<@����~$�.v��2�<@\�x\�@e|$�@1�d�<@\��~1{$�������<@ZK\0�y$�2Xq���<@\�`\�;x$�\��u��<@Hū�u$�G�J��<@�Qews$�Z��լ�<@\'k\�C4r$�\�i� \�<@\�8~p$�\���9�<@RE�*kk$�����<@\�=�Ӟj$�d��\r�<@�5��i$��\�Д��<@\�je\�g$�\�a�\�4�<@�)U�\�e$��Q+Lߗ<@��~\�Td$�!\�K��<@���\�ib$�O\�\�\�N�<@�&�\�`$�2\�L�<@�\n�l_$�\�\��7�<@Ov3�]$�(`;��<@�\�\�[$��b�D�<@�c\�\�Y$���H��<@\��fX$�?�{�<@o�EE�V$����ߛ<@�\�e�\�T$�6#�\�E�<@;4,F]S$�_�\��<@\�`�\n�S$�;�p\�G�<@K\�^bT$�\�\�8�	�<@?5^�IT$�<g��<@\�,\�T$�\�\0�&P�<@4��S$�\�%�<�<@(�XQ�Q$�8�\�\�<@�\��5\"P$�\�\n(ԟ<@����\�L$�;V)=ӟ<@x�7N\nK$�\��f\rޟ<@?\�\'I$�/ܹ0ҟ<@\�v�H$��\n\�\�ş<@:�Fv�E$�eo)\�<@I�\�\�\�C$�)�\Z\�\0�<@ǁW˝A$�JӠh�<@�P�f?$�t%\�?�<@\�\�\�\Z=$�*\0\�3h�<@�S�\�9$�lˀ���<@`?\�7$�T㥛Ġ<@Dj\�\�43$��|zlˠ<@�\�\"[1$�m8,\r��<@��(�.$�|��8G�<@	4\�,$�+\�\�6�<@ȕz�*$�B%�c\\�<@kQL\�($��ƈD�<@�[\�d8&$����3��<@\�\nY\�\"$�{Cr2�<@;�� \�$����͡<@�\Z�{b$�ګ���<@m\�i�*$�V�zNz�<@H\�9��\Z$��\�\�^(�<@>�#d$�\�\�o{��<@��x��$����)��<@\�z�I$��R\�q�<@>�h$�&\��p�<@��\�J\�$�j���v�<@\�Ԗ:\�$�f�O7P�<@X��\�	$��\���<@��M�$�2�\�l�<@�O��$�z\�蹅�<@��(��$���4�<@\�-���$�Ԝ�\��<@%�)\� \0$�닄���<@Ü�M�#�+ٱ��<@Q�[��#���ZӼ�<@Z)r��#�\�\�nI�<@y\�ՏM�#�Oϻ���<@\�����#��\�[\�<@�;��#��\���^�<@(\r5\nI�#�\�\����<@��n���#�iUM�<@\�*l��#�	\�Vд�<@6\"�\�#�8�*5{�<@\�B��\�#�=Զa�<@�c�~\�#�?���<@b��\��\�#��j����<@�\�{�E\�#�MK��F�<@遏��\�#�\�@��\�<@:u\�<\�#�\�	L�u�<@�<֌\�#�ꕲq�<@Ӥt{\�#�&m�<@���\�\�#�|DL�$�<@h�\�HK\�#�)r�#�<@�Tގp\�#�:>Z�1�<@j�֍\�#�\�^I�<@bg\n�\��#��*n\�b�<@�^�sa�#��\�o�\�<@v��\�/�#�Ҫ�t��<@��\�S�#��\��5\"�<@ հ\��#���\�Mb�<@�l��\�#��\Z�4Ԭ<@v\�Kp\�#�\�^\���<@�Sݠ#�΋_\��<@\�����#�\�GnM��<@���T��#�\�;\�\r�<@�)t^c�#�(�r��<@͔\�\��#�p\\\�M\r�<@�p!��#��4~ᕰ<@*Wx���#�)\�7ӱ<@8k�*�#�Z�1\�	�<@�Z\�Q�#�k\r��\"�<@�\�j��#��T� �<@���cZ�#�()�\0�<@JC�B�#�\�\�#�<@�\"r�#�QL\�\0�<@�\�\"[�#�z�\�y�<@$	\�P�#����vۭ<@jl���#�t\�v�4�<@��u�|�#���\�`��<@\�2ı.�#��\\�&��<@\��d\�#�DmFA�<@�ׂ\��#�8\�ܘ��<@��e��#�%�9Ϭ<@\\1е�#�\�]~�<@\�>\�Ƀ#���S�\Z�<@���ց#�OGɫ�<@}\�1Y\�#�\�0\�Ѫ<@�9z�~#��Q\�o&�<@���#�}^�\�#�<@2\"QhY#�\�J\n,�<@<2V��#����5�<@EH\�\�~#�\�,\�i��<@^+��$~#�\�Z�<@W��U}#�0����<@��_c|#�ͮ{+�<@\�&S{#��%jj�<@A�;x#�\�9��<@\�s��w#�/�.Ǡ<@\Z�Q\r�u#�&\�\�s|�<@.\Z2u#�5%Y���<@�&l?s#�\�\�N���<@Y\�\�;q#�ɫsȞ<@z\�9[@p#�C\�5v��<@�t?� o#�<�_�E�<@\�.�5k#���o�N�<@�Z	\�%i#�\�M\�ɠ<@`\�� h#��Ac&�<@�ŏ1g#�>\��\�d�<@�\�A^f#��^\�\�W�<@a�\�>�d#�^ؚ���<@R�\�b#�c���&�<@���\Zh^#�m򖫟<@�\�H�U#�\�\���<@[z4\�S#����<@1\'h�\�O#�\�\�SǞ<@\�w.�L#�u\�\�m�<@�.�.I#�\���j؛<@\�%@#�\���j؛<@~!<\�8#���/�^�<@��`U5#�\�\�\�=�<@\�u�B)#�\�\�\�%Ǖ<@�\�h��(#�D6�.6�<@���խ&#�\�\��\"��<@CV�\�##�5{��<@^\�/\�\r##�y��M�<@1е/ #�-&�(�<@\�\�TO\�#���Ք�<@�\�\�##�8�T��<@�V`\�\�#�P�<��<@�ơ~#�Pr�Md�<@7n1?7#�n�2d�<@�E\�n�#��jIG9�<@\�\��\"�#�ԘsI�<@?��\�\Z#�\�\��S\�<@��ڊ�#�5C�(^�<@9\�)9\'#�b�qm��<@\'0�\�#���*�\�<@�)�#�AgҦ\�<@\�\�$xC\Z#��ŋ�!�<@�@+0d#�\�&�\�0�<@\�.\�\�#�/�4\'/�<@}˜.�#�B�p\�-�<@6X8I�#�\�E��(�<@%Ί��#�!t\�%�<@ge���#�ӿ$�)�<@\0֪]#�|�w�<@k,am�#���U�\�<@\'�\�d\��\"����2�<@\�@ �\"�\rpA�,�<@ir1\��\"�^c��ޒ<@N\�}��\"�Zg|_\\�<@scz\��\"�S8���<@k����\"�\�PS�<@\�>�Q��\"��\"r�<@\�\�mU�\"��a�1\�<@\�Ŧ��\"�l	��g�<@���(\��\"�\�Xl���<@遏���\"��7/N|�<@k��\��\"��x�Z��<@#�k$�\"�\����<@�\�\�\�+\�\"�`\���<@�A\�<�\�\"��\�]���<@H�\�\�8\�\"��\�eˉ<@͑�_\�\"�4�s�\�<@\�;jL�\�\"��[Ɏ�<@��q\�@\�\"�I�Q�<@\�\�\�\�\"��\�唀�<@Z_\�\"���1���<@܁:\�\�\�\"�W>\��\��<@�\��L\�\"��\�WW�<@}\�X��\�\"�\����4�<@@�\�\�\�\"���>嘄<@;�O\0\�\"�h��\���<@�a�Q+\�\"�� [��<@.Ȗ\�\�\�\"�J\�_\��<@\'�\�2\�\"�\�q�Pi�<@8�{\�5\�\"���a���<@y\��\�\"�mS<.��<@\Z���\�\"�Eb�\Z��<@}\�ݮ�\�\"�}=_�\\�<@��pY\�\"�%\�pt��<@Ug��\�\"�\�^I�<@Ps�\"�\"�\�	K<��<@)!XU/�\"�-y<-?�<@�0E�4�\"��\�\�\�G�<@\�c\�C�\"���%P�<@Hj�dr�\"�rk\�m��<@�Pk��\"�l\�<*�<@\�/\�\rۮ\"�{\�\�\�~<@$�jf-�\"��\rO��}<@\rQ�?ë\"�#�\�Jv|<@��)x�\"�\�\�@�9{<@��\Z��\"�~\�\0�y<@�_\"\�:�\"��\�\�x<@i㈵��\"��^�w<@��C��\"�zPP�Vv<@�Ҥt�\"�2t\�t<@emS<.�\"��:\�\rt<@\�!����\"��\�O\�r<@�+�\�y�\"�/�\�q<@s���M�\"��K�\�\�p<@uYLl>�\"�O�\�\�p<@k�\�qQ�\"�Uj�@o<@�\n\��\"�:Yj�\�l<@8���\"�\�\�L0�k<@W�[ɖ\"���\�j<@�.Ȗ�\"����\�\�i<@vS\�k%�\"�%A�\ni<@	\�\�\��\"��,�\�oh<@�����\"�\�\�=�g<@4�\"��\�^f<@Z\�\'�Î\"��\��r�d<@\�͋\"��\n�\��c<@#�\���\"����Z`c<@m\�\�]�\"��\���b<@�\"�ng�\"��\\\�].b<@b�G�\"�\r$}Za<@\�\�Z\nH�\"�C�B�Ya<@/M\��~\"��\�\��a<@L\�\�\�<}\"�q<��b<@*���{\"�\�\�_=\�c<@Dn��y\"�	l\��3e<@cz\�x\"�{�/L�f<@���zv\"�ӣ��\�g<@��Xu\"�\�G7j<@\�r�r\"��oa\�x�<@���UX\"��8�t̥<@�:\�&\"�N\n�g�<@�\�y�$\"�ߌ����<@*�\�\�\"�R\�>\�G�<@�Tm7��!��\�Nw�\�<@���A\�!��e3���<@|ds\�<!�C�\�\��<@W\n�\\\�\0!��9�\��<@��\�\�� �[z4Փ�<@q\�\�\�� �8\�GnM�<@�:ǀ\�� �\�\�[�<@a\\:\�� ��\�*��<@\�~��� �r�\�ZC�<@\�\�\�� �w�*2�<@3�\�3� �\'L5��<@�gx�� ��\�\�\��<@K<�l\�� �$(~���<@-� �TT�J\��<@�$�9\� �A�;\0=@{\�L�x\� ����x�=@BҧU�\� �QۆQ�=@D��\� ��G,�=@\r��W\�\� �\�,��Ε=@J&�v�\� �b\��vK�=@;\�?l\�\� �\�\�\\QJ�=@A�\�ǘ\� �',1607362055,1607362055,NULL,NULL),(5,'Lusaka',_binary '\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0i�\"�6>@�\0�S��-���!U7>@W?6ɏ\0.���z67>@��b(\'.�՗���7>@=+i\�7.�<��X�8>@�A\n�B.�`��i9>@�Mc{-.�τ&�9>@A�C�\n.��\�^\'�9>@q\��s.��\�&N:>@=e5]O.��]M��:>@�Ǵ6�\r.�\�\�52;>@�ّ\�;.�r\�_!;>@�j\�.�3��A�:>@u�BY�.�_&��:>@��).�\�;:>@N��oD.�]\��9>@��A\�<.��\�E\n9>@*\�dq�.���\�Mb8>@\"7\�\r�.��U�&8>@�J\� .���m\�8>@U\�\�\Z�!.�#\��8>@r���$.��\�8>@c\� \�\�&.�<�9>@+�6+).�a2U0*9>@(-\\Va+.��|$%9>@�\�|?5..�eq��\�8>@x�\�x[1.�\��H9>@�_\�(6.��j\�9>@\��L�7.���\�G:>@�6\�Nx9.�%u�;>@�\�\�u6<.�&\��o;>@P����?.�˺,D;>@���ΣB.��F�0};>@s�\�\�E.�en�\�;>@�Rz��H.��\�7i\Z<>@Z�1\�	J.���F!=>@���I\rM.�1^�\�>>@��n�P.���\�SV?>@\�4�\\�Q.�\n\�F@>@\�A��S.�ۧ\�1A>@\�/��V.����i�A>@�n,(Z.�����B>@LqU\�w].�ץF\�gB>@/6�a.����^B>@)\�QG\�e.�,�V]�B>@S��i.���:r�C>@�u7o.����\�tD>@\�\�\�\\Qr.�H�REE>@�+�,u.�=,Ԛ\�E>@�\'�.�x.��\�&NF>@@0G�\�{.�Ƥ��F>@���q\�|.�l#�\�F>@a���~.� ]lZ)H>@2;�ށ.�\'\�+�VI>@!\���.�~��E}J>@\��\�]��.�\'JB\"mK>@\�\�V`�.��aMeQL>@\�7�-�.�<�.M>@�ͮ{�.�*\�t��N>@\Z8\��.��L�nP>@\�M֐.��4\�($Q>@\�N\�\��.�$DiR>@!\�>\0��.�}\�\�\�ES>@\�2�g�.�	\Z3�zU>@�Q�y9�.�C\�5v�V>@l\�\�C�.�\�w\�-;X>@���ޠ.��\r܁:Y>@\�@�ش�.�:ZՒZ>@�}\�ƃ�.��m�[>@\�N��:�.�z�W\\>@��\n\�b�.�ra�r]>@,E�@�.�)#.\0�^>@�\�6�h�.���g_>@N\�\�.��_x%\�_>@\�[\�t�.�F�\�\�j`>@D\����.��+�\�y`>@��\�\�;�.�5�u`>@\�]��y�.��Wya>@\�3���.�DL�$za>@���\�.�)�k{�a>@S?o*R�.�U1�~\�a>@��d�\�.��\�\�a>@\�\�7\�\�.�H�C�\�a>@��͎T\�.�/n��a>@�����\�.���qa>@Ō�� \�.�*\� \�ha>@�\�HK\�\�.�R��/Ia>@scz\�\�.�ٖg)a>@mr��\�.��\�0\� a>@\��X\�.�\n\�O\��`>@j1x��\�.���u�`>@\����4\�.�\�\Zfh<a>@8/N|�\�.�g׽�a>@0H���\�.�sJ@L\�a>@I�[\�\�.�5c\�tvb>@\�K\�Ƽ\�.��lw�b>@\�ĭ�\�.��\��ld>@�t��\�\�.�4-�2\Ze>@�B</\�.�����/f>@\�\Zfh�.���%�Le>@��\��.�r\�j��d>@�R\�h�.����(\�b>@\�x\�&1\0/�@L<b>@Y\���/�*\�:]a>@%�\�\�/��\Z�4\�`>@��U�\n/��\����`>@\�O\�\�/�\�\rM\�\�_>@1}�!8/�D�.l\�^>@)�*��/��9$�P^>@�u?T/���;�B]>@r�CQ�/�P:�`�]>@���^\Z/�\n�\�\�%^>@{g�UI/�\'�|�_>@�@J\�\�/�\�\��_>@7�A`\� /�\�]�)\�a>@�\�,�#/�\�K8�b>@�\��&/�T��~e>@hB�Ē*/��\�\�\�+g>@E�\0�-/�9\�\�g>@#��\�//�\�oBh>@����\�1/�fO�sh>@n5\�\�3/�~�u\�rh>@�Sͬ5/��\�\Z�i>@\�dT8/�B@��j>@��\�\�}:/��U�\�6k>@�}q�J;/��Nyt#l>@�\�FXT</�\�\�|#�k>@��ek=/�ܷZ\'.k>@\�T�G\�=/����Աj>@�\�\�a>/�z\0���i>@/��$?/�:�`��i>@d*\�\�?/���\�h>@~:3PA/�A��\�Fh>@�i�WVB/���u�|g>@\�\�W;�C/����\'�f>@\�L��D/�ˡE��e>@HO�C\�E/�L\�\�\�<e>@>��I�F/��!Y�d>@��KǜG/�+O \�c>@@3�\�H/�S\�Gb>@�\"\�dTI/�\�}9�a>@�j\�I/�[%X\�`>@\���J/�\�\�Ȯ�\\>@5��M/�\rnk\�[>@��z�O/�5\'/2[>@W`\�\�VO/��HJzZ>@��\�7�N/�h<\�yX>@\�<�E~M/���>U�V>@��+d�L/���\�\�S>@���\�K/�\�[X7\�Q>@S��c$K/��\��p�P>@ʇ�j�J/�\"�4�N>@\�\�%ǝJ/�]~p>M>@�n��J/��\�*L>@?V�\�K/��Σ\��J>@{L�4K/�i�\�r�I>@(��\ZK/���C�H>@�����J/�,J	��F>@�\�ާ�H/�ڪ$�F>@7ǹM�G/�8�9@D>@q�\�B/�\��cC>@ܸ\��\�@/��\��GB>@�+\�F<A/�Ƣ\�\�d@>@�\�8\rQE/��\�+I�?>@�\Z�D�F/�B[Υ�>>@�\\\�\�I/�ΎT\��=>@�B]J/�g��}q=>@�۠�[K/��\�\��<>@��\'�.L/�ˢ���;>@6\�,N/�l�6�:>@9�⪲O/���¼\�9>@HQg\�!Q/�DkE�7>@\�\�\�\�\�T/����l\�6>@[\��YU/�B\�\"LQ6>@#2�\�T/�\���6>@O\�z1�S/�\�LLb5>@��^�sQ/���4)5>@��?N�P/��F� 4>@1\\\0qO/����3>@<L�\�N/�\�b�T42>@�8\�Z�M/��\�]g1>@4iSu�L/�\�{�E{0>@w�*J/�w�x\�0>@C\�\�\�\�H/�k\�C4�/>@.�\�n�G/�\�\�\�/�->@ǡ~�>/�Hp#e�,>@$^�\�=/�Su�l�*>@\�3�</��qS)>@��E;</�Z5\�\�\'>@	\�%qV</��(B\�v&>@dϞ\�\�</�N	�I�$>@b�\Z��=/�\�	L�u#>@^H��0>/�\��+\">@-C\�\�>/�9	�/� >@\�f�v?/��\��>@Gsd\�?/�Pr�Md>@Ԛ\��@/���ި\Z>@���\�xA/��X\�E\�>@�p\�\�@/�\��M(>@*��s@/��\�+H3>@s��/\�@/��f\�|>@���vA/�g}\�1Y>@\�\�B��B/��\�NG	>@T\�\��fE/�ޑ�\��>@Y�O0F/�\�S\�q>@\�!\�\0�F/���Y.>@X\�2ıF/��\��9>@�\rND�F/��@->@�7�G/�l\ndv>@m�F/��Xni5\0>@\�^���F/�\�im\Z�=@�GW\�F/�\� v�\��=@\n��OG/�V\�\�\��=@+j0\r\�G/�\�\�\�\na�=@\"�\Z�\ZH/�l\�<*��=@�\�\�\�\�F/�RD�U��=@\�\�vhXD/�i\Z\��=@u�)\�B/��Or�M\�=@\�a��@/�����@\�=@\� >�\�?/��5\�;N\�=@\�)1	?/�>	l\��\�=@b.�\�>/�%�z�\�\�=@��jGq>/�m��}\�=@z\�\�=/�0K;5�\�=@\�H�=/�\� \�\�\�=@�� \�;/�|�Pk\�=@y\"��p:/�\�i� \�\�=@�W\�\\9/�\�\�P\�\�=@6#�\�E8/�T��b�\�=@�\��\Z9/��P�,\�=@XuV\�9/�5E�ӻ\�=@F?\ZN�;/�;\�\r�\�=@��:r�;/��.�\�|\�=@�\�\�h\�;/�\�!S>\�=@V�j-</���V\�\�=@*\� \�h=/�]4d<J�=@c*���C/�\�B\�\�=@\�Y-�\�D/��πz3�=@\�\�	L�E/�gHū�=@U\�YF/�Q\�\\�m�=@�#*T7G/�\�[\��=@�\�eG/�N�W歲=@��=^HG/�	5C�(�=@RC�\rH/�`;�O�=@v?T\ZI/�4M\�~2�=@h[\�:\�K/�\�PS�=@CV�M/��y�=@_\'�eiO/�R臭��=@���{P/���g�\�=@��vN�P/�P\�\"��=@���Q/�\��UG��=@j� \�\�R/���\�8�=@	�/�R/�衶\r��=@>\"�DR/���լ3�=@v�U�P/�\��ť*�=@B$C��O/�;s	ߗ=@i6�\�`N/�w�(��=@\�z1�M/��_����=@`Z\�\'�K/��ᱟŒ=@B��=\�J/�B\�\�\�D�=@�U��yL/�\��%�=@>\\r\�)M/���\�{*�=@\��aN/�#j�\�G�=@E�\��VQ/�c��\�\Z�=@���\�gS/�\�w��=@�p�\�[U/� \nfL�=@�\�A�W/�}!\���=@�m��Y/��cZ�Ƃ=@�n��Z/�\�)�n�=@a\\:\�\\/�\�\��\�$}=@�IӠh^/�|_\\�\�z=@ݲC�\�^/����w=@\�>�̔^/�lZ)ru=@@\�0`\�]/�\�6�s=@0du�\�\\/�)x\n�r=@	4\�\�y\\/�n�\�fcq=@��n��\\/�\��E�p=@31]�]/��Uס�n=@\�\�6\�^/�����\�m=@��-u�_/���Rbk=@\r34�b/�)\�\�i=@\�\�\n~c/�$C��gh=@�>\�e/��\�\��g=@\Z2�f/���\�f=@\��%h/�^d~�d=@�&M��i/�Dj\�\�4c=@�\�Q�j/�J�\�\�`=@\�&��l/��\�(]=@��oD�l/�fJ\�o	\\=@yGsdm/�\�\�;�\�Z=@VG�tn/�)%�\�Y=@\�\����n/�\�\�SrW=@�[w�To/��Ye��V=@��\�\�o/�\�M)��T=@^��jGq/�Z\�>\�-S=@��KU\�r/��\�|\\R=@�\�\n(t/��]�VP=@�\�g�v/��6U�\�N=@y��\�x/���Դ�M=@>\�\Z-z/�G\�?L=@;n�\�t{/��2�68I=@\�J�R\�}/�\��)G=@\\�~l�/��r�\�E=@�\�\�vh�/��6T��C=@\�.PR`�/�\�\Z��\�A=@�\�\�/�\���@=@.9(a�/�\�Z��v>=@w�$$҆/�vöE�==@�aQ�/���K:=@.W?6ɇ/�Թ��8=@\�\�[v�/�u\"�T37=@W\n�\\\�/��C\�ͩ4=@/�\�\�/�gG�\��2=@�U�f�/�`\�\�\"\�1=@��\\��/��i0=@\�eO�/�\�\�\�k-=@��\�/�/�\��QF\\,=@\�5\�Ko�/�,���d+=@\�ݮ���/��\',�*=@Z\��c!�/��X�\��(=@�\�;�/�+øD\'=@\�V*��/��|гY%=@Ͻ�K��/�\�{L�$=@�\Zl\�/� _B�#=@P6\�\n�/�����Y\"=@_z�sѨ/�3Q�\�\� =@f�\�\n�/�du�\�=@�Y.��/�i���\�=@���\'�/�9\�\�\�\�=@�U\��/�O]�,\�=@�]h�Ӱ/�r���\Z=@a\�\�+e�/�j\���1\Z=@\�\����/�m\�\�]=@3�\�pʴ/�\�<*�\�=@<-?p��/�3p@KW=@��B�/��\Z���=@iV�y�/�jM�=@\�ͻ/�\�Y�rL=@�\�`\�/�f0F$\n=@��q�&�/�<L�\��=@\���x�/���y\�=@T���\\�/�\��x@=@��b���/�;��.R=@ߧ�\�@\�/�\�7>[=@�]�V$\�/�>B͐*=@0fKVE\�/��0\���=@�sCSv\�/��U��=@���\�\�/�����A=@29�3L\�/��K⬈\n=@\�&\�+�\�/�����	=@\�W)\�/�=Fy\�\�=@q㊋\�/�\�\0OZ=@\Z��J�\�/�J�\�\�=@\�X�\�/�\�\�\�=@�в\�\�/�j\�0\n�=@�\�p\�\�\�/�4�\�k\�=@R\�.��\�/���\�\�U=@��G��\�/�9\�\�\�\�=@�Ac&\�/�-AF@�=@f�\"\�\�\�/�q̲\'�=@�.�\�|\�/�Ҩ�\�6\0=@�u?T\�/��ԗ���<@�S�D\�/�zލ��<@�V\'g\�/�?5^�I�<@V��y\�\�/�\�Y\�\��<@�׻\�/��9\�S��<@l�p�\�\�/���+�,�<@��W\�\�/�\r�Q\��<@�wcAa\�/�;\0\�^�<@��`8\�\�/��,σ��<@�T\��E\�/�\�\��6��<@O!W\�\�/�U�\����<@\�\��R�\�/��J>v�<@�\�5!�\�/�\n��a\�<@��\�\�k\�/�\�\�!��\�<@\"nN%\�/��o\�4(\�<@�\� �\�/����\�\�<@\��|zl\�/�\�\�f*\�\�<@�\�4\�\�/�jh�\�<@#[A\�\�/��\"1A\r\�<@s�\�h�\�/�\��̰\�<@�\�H.�\�/�{g�UI\�<@�\�X\�\�\�/��i\�<@D�M\�/�|�E{�\�<@S\\U�]\�/�)���\�<@�\�ӀA\�/�:=\�Ƃ\�<@���\�}\�/�%?\�W�\�<@\�n\�KS\�/�(Hlw\�<@\�`6�\�/�pΈ\�\�\�<@���\�/��6U�\�\�<@$\�6�D\�/��Z�\�\�<@�شR\�/�\�C\�r�\�<@����\�/��@gҦ\�<@~\Z�\�7\�/��\�Y\�h\�<@t\�\�\�\�/�w�E\�<@�	��\�/�\0��*Q\�<@6sHj�\�/�\�\��E\�<@ͯ\�\0�\�/���\�\�\�<@�m�\�/�|G�	1\�<@��Ơ\�/�!%̴\�<@��A{�\�/��Pۆ\�<@P�\�\�b\�/�Z�xZ~\�<@d�w�\�/�p>u�R\�<@t%\�?�/���v\�\�<@\n��O\�/��ZD�\�<@�9A�\�/�<\�\r��<@}w+\�/��\�\�\��<@2\�L\�/�G\��ǽ<@�z�<\�/�\Z�K���<@���GS\�/��ܙ	��<@\���=\�/�\rU1�~�<@}\�\�\�\�/�\�\� w�<@*\��\�O\�/�A\�+��<@�˸�\�/���n��<@�Fw;\�/�*oG8-�<@���}\�\�/�2Ƈ\�˶<@*\�J=\�/�VF#�W�<@��|г\�/�{\�l�<@\�e\�\�\�/�!���\'�<@pA�,_\�/��4\�($�<@З\��\\\�/�%���<@\����\�/�1\\\0q�<@Ϣw*\�\�/�D�b*�<@.��\'H\�/�a��\��<@��,AF\�/��n�Ʃ<@ۤ���\�/��c\\qq�<@\0\�3h\�\�/�\�\�2��<@%W@�\�/�yy:W��<@f�\�\\\�\�/��v����<@�m��\�\�/��\�̞<@y\�j��\�/�|��c��<@�p $\�/��ۼqR�<@\�\�4}\�/��CV��<@�J�*\�/�!\�A	3�<@S\"�^\�/�<J%<��<@�RAE\�\�/�Y�yVҖ<@Tƿϸ\�/��L\�*��<@��I\�\�/��+ٱ�<@@�ϝ`\�/�}w+�<@v28J^\�/�\�eM,�<@\�52;\�/�\�\�ُ<@T�^\rP\�/�\��[�<@֩�=#\�/�\��-]�<@�ʾ+�\�/�j���v�<@\n�Ƿw\�/���&���<@��\�0\�/�T�^\rP�<@\�\�bg\�/�,G\�@��<@@��r��/�r����<@�W��ͼ/�\�\�a\�7�<@z\Z0H��/�m\�\�]م<@g\��ͽ/�\�\�u��<@,�,\�/�\���W�<@�@�m߻/�ca����<@\�1��8�/�^\�\�-Ɂ<@�#c���/��a��\�<@�~�nض/�d��S�<@���U�/�?rk\�mu<@\�+\�\�f�/��\0\�m\�t<@�\�Ϸ�/�b�{�\�s<@\����/��\�\�Ks<@/j��\0�/��_cDr<@�� \�>�/���|\�rq<@��v�\n�/�N\�}�p<@��y�/����o<@[Υ���/�\���JYn<@öE�\r�/�?\�\�m<@\np�/��a\�\r�m<@t{Ic��/�����m<@�\�a0�/��\�i2\�m<@HN&n�/�\�\�\�2n<@H��0~�/�-��\��m<@F\�\�\�\�/��ӂ}m<@5��Ҟ/�-Z��\�l<@O\�\�C�/��\��k<@V�j-�/���26tk<@�Tl̛/��C�Öj<@�\��\�\'�/��ܶ\�i<@#��ݯ�/�`>Y1\\i<@H�V�/�jin��f<@\�%�/��\�Ze<@(��я�/�\�Ȯ��d<@�衶�/�\�\�\�c<@ge����/�Qic<@̳�V|�/�m��b<@d\��ǒ/��\�6pb<@W\�\�:�/�ya�Xa<@i���/�pa\�xw`<@(�r�w�/��\'I\�L^<@�CV��/��b\�\�]<@HP��/��N�o[<@�\�V��/��\"k\r�Z<@I/j���/�#���Z<@�k\�\�/�nYk(Y<@\�^\��x�/���Z�\�W<@�}s�/��£�S<@\\*\���/��g\�,S<@�\���/�x�\�x[Q<@u�/�\"O���P<@-`�\�/�:\��lP<@_�sa��/�.�\�n�O<@�\�\�vh�/���M�N<@L�e�%�/�@�\�\�L<@^f\�(�/�\�\�y7L<@4f��/�P6\�\n\�J<@E+���/�2q� J<@\�\�\�O��/�P�i4I<@�K�b�/�\�s]�H<@��kCŘ/�1\���G<@B�۽ܗ/��H\�\0G<@w�>XƖ/�u\�\�mF<@m�Yg|�/�U\�z�E<@;��/�\�+�z�E<@�<֌�/�ddY0E<@�p��/��S���D<@\�l\�%��/�f/\�N[C<@\0\�Z�\0�/��?QٰB<@\�\�G��/��(\r5B<@��\�\�/��WA<@t�?Pn�/�0��@<@t@�\��/��V���@<@�B˺�/��d�P3@<@Z,E�/�c\r��?<@�\�j,�/���h\�=<@��\�-�/�c\�=y<<@\�\�\�e�/��TPQ�;<@l\�,	P�/�\�\"��:<@|V��/�\Z\�.\�8<@�ܚt[�/�c\�tv28<@ę_\��/��DkE7<@2t\�/�X;�s\�5<@Q\�\\�m�/���sE)5<@0�GQg�/�){K9_4<@\�y��Q�/��bd\�3<@4iSu��/��SH\�1<@\�&2s��/�\�����0<@Χ�U�/���\�Q0<@\���0�/�[y\��\�/<@Z~\�*O�/�q\��s/<@5\nIf��/����)/<@�f\r\�W�/�L\�[\�\�.<@d��\�^�/��c��.<@�~1[��/�f�ʉ.<@\�4�\\��/�\�\��;.<@�ߡ(З/�\rP\Zj.<@���\'��/�-Ӿ-<@S\�\'��/����\�x-<@S$_	��/��\�M�\�,<@�ܙ	��/�S<.�E,<@�<i\�/����~�*<@q\�ő/�̘�5*<@(~��k�/�t��%)<@ٖg)�/��\�\�jH(<@:\�\�\Z�/�ɫs\�&<@\�\r�:��/�z\�΅%<@o�e���/�Ę��R$<@�\�(�/�#�\�E�\"<@���)�/���0�:!<@��\"1A�/�$����<@�BX�%�/����r�<@\�a�[>�/�v�X�<@>\�ͨ�/���\�G�<@�\�ȑΈ/�`\�U,~<@u\�8F��/�!\�hUK\Z<@�\�ypw�/��a��m<@_���/�\�&�\�<@B\�\�˄/���H\��<@qt�/���͋<@ٕ���/�6?�Ң<@]��/��?��\"<@YvQ�/�N�E�<@t\��\�\�~/�Vc	kc<@�\�\�~/��Q+L\�<@`[?�g}/����0�<@J�\��|/�\�OT6�<@�(\�\�=|/�\�.\�<@�\�3K|/�vk�\�<@��S�\Z|/�W	�3<@WAt\�{/�����a<@\�NG\�{/�\�\�\��6\r<@�\�\�,�{/�Uj�@+<@!\���{/�=\�[�<@�\nҌE{/� <�\n<@Na���z/�uV\�1	<@�����y/��\�d<@\r��W\�x/�\����<@�rL�w/��\��\�\r<@�\�z�\�v/��9w�^<@4d<J%t/��G\�z<@���\�r/��D\�[\�<@bodq/� �+\�p<@:@0G�o/���)<@U�q7�n/���Cl<@>?�n/�\�<+i\�<@.\�R\\Un/��\'��<@\�+���n/�Z���<@\�\Z��n/�\�V��\0<@���Yn/�J\�E��;@\�\Z�Nm/�Cus��;@d=��j/�]\�].\��;@t\�\�i/�=ڨN�;@� \�\�*j/��B\�ʠ�;@G�,\�l/�k�\���;@pC�׼r/���)�;@�\���t/�ƿϸp�;@r7�֊v/�a6�\��;@-�\�Vx/����;�;@��0a|/�`\�\�V\��;@\�h9\�C}/�|\�o\�^�;@\�;~/�H�\��\��;@\�E\�\�\�~/�)^emS�;@\�	�/��(���;@��\�\n�/�-`�\��;@q\�q�t�/�x\�\�e�;@��O��/�h׿\�;@F|\'f��/�dWZF\�\�;@�jIG�/���{�?\�;@�\�-\�|�/�\�ֈ`\�;@s/0+�/����eN\�;@�S��Y�/�aR||B\�;@jg�\�R/�wg\��\�;@Ãf׽}/�\�G\�;@�~�7|/�jl��\�;@\�\�\�U{/��\�\�\�;@I�Vy/�C\�5v�\�;@\�A	3mw/��\�VC\�;@1�{�Ov/��n�\�\�;@\�y�]�r/�U��N�\�;@��M�p/�\�.PR`\�;@j�~�^o/�	\�<��\�;@5�+-#m/�f���8\�;@?\0�M�l/�\��LM�\�;@n1?74m/��	M\�;@\�\�n�n/�X�L��\�;@*�\�Dp/�\�\�w\�;@�^)\�o/����6\�\�;@�r��m/�I�s\n�\�;@r \nfl/��\�\�\��\�;@�\�V\�l/�~�{�\�\�;@\�I`sn/����hW\�;@]�z\�n/���E\�n\�;@U[rp/�<g�\�;@ʋL��q/�t�\�)\�;@DkE�s/�&�v��\�;@\�Y�Nt/�:�6U�\�;@M��\Z�t/���\n�H\�;@�.Ȗu/�&\�\�\'d\�;@��1>\�v/��聏�\�;@�y�w/� <�\�;@KxB�?y/�Eb�\Z�\�;@�z��y/�\��\�O\�;@�O\0\�\�z/�\�I�U\�;@h[\�:{/���)Wx\�;@�:�p{/�O\�9��\�;@w�4E�{/��k\��\�;@R�{/�\�\�tp\�;@� x|{/�\0\�Ȓ9\�;@�\�I`{/�xe��\�;@�\\\Z��z/�L�\nF%\�;@Ii6�\�x/���o\'\�;@I\�L�\�v/�7�ُ\�;@\�\�\�t/�;�I/\�;@���P�s/�g)YNB\�;@\�L�:q/��\�s]\�;@+0du�o/�(\�>�\�;@PU��Xn/��N\�P\�\�;@�\�V\�l/�\"m\�OT\�;@-\�\�;�k/��\0��%\�;@\�M\�\�\�j/�\�\n(\�\�;@�0�j/�h$B#\�\�;@\�j�=&j/���^\n\�;@T5A\�}h/�>���4\�;@���?g/�l�\�F\�\�;@��\�ȑf/���\�n\�;@*�n�Ee/�ҌE\�\�;@�M�a�c/�K\�4\�;@�\�`�\�b/��\�\�W;\�;@\���pa/��y7\�;@�2p@K_/�?\�\�\�\�;@N\��1�]/�\�v��\�;@#\��~j\\/�{JΉ=\�;@\�o�[\\/��G��\�;@)�	0\\/���\�K\Z\�;@����[/�`�E\�\�;@\�i�*�Y/�˻\�\�;@u \�\�W/��\�<\�;@\�\�#�V/�3�\�V\�;@�&�\�T/�FA��\�;@�MG\07S/���\�\�U\�;@�+�\�R/����oa\�;@�I|\�S/��r/0+\�;@0עhS/�2\"QhY\�;@3m�\�JS/��\�LL\�;@Y��S/�H\�\�\�\\\�;@|�PkR/�� \�\�;@ir1\�Q/�N�#E\�;@\���0Q/�\�t\���\�;@\�_!seP/�\��R�1\�;@4�y\�SO/�CF�7\�;@=\�\�\�M/�>ʈ@\�;@t~�\��K/�P�s\�\�;@\�&���I/�!\\�z\�;@�\���H/�\�(\�\r\�;@1y\�|G/�R)v4\�;@����E/��\�;@�\�0|D/�X9\�\�;@;9Cq\�C/�^�o%\�;@\nK<�lB/�pC�׼\�;@\��̰A/�	\���c\�;@kׄ�\�@/�b0�\�\�;@��N�?/��N\�P\�\�;@Y�n\�=/��\n�\�;@\�\�l;/����;�\�;@\��\�>:/�4.\�\�;@|eު\�8/�\�\�h\��\�;@xG\�j�7/��8*7Q\�;@\"r�z�6/���X�\�\�;@��aM5/�i�\�Q\�\�;@�.n�4/���h\�;@�۠�[3/�\�;\�;@�\�ދ/2/�z�I|\�;@�\�\\\��0/�1^�\�;@�z��./�;\�O��\�;@�;�_�-/�7P\��|\�;@�1��,/���Hi\�;@��\�\�*/�k�=&R\�;@\\�v5)/�C9ѮB\�;@\\1е\'/�9DܜJ\�;@��EB[&/�M�x$^\�;@�Z��K%/���5[y�;@W횐\�(/�\�\�O=�;@\�mP��\r/�\�(��;@�Cl�p/�y�\'e�;@Քd��.��J��;@\�y�]�\�.�\\t�\�z�;@9�ߡ(\�.�Dn���;@�-\�R\\\�.�ҋ\��*�;@u\��\�.�;6�\�;@K\�^b\�.�����.\�;@���\�\�.�|V�\�;@���\�ѽ.�=\�!7\�\�;@\�	��$�.���B�\�;@�%\�`�.��U��y\�;@uv28J�.�Ul\�\�\�;@�\�\�a��.���\�;@CX�%��.�Yni5$\�;@T��~�.�K>v(\�;@:tzލ�.�\�9?\�q\�;@ ��\�\�.�\�\�e\�i\�;@\n�]��.�v�և�\�;@��&�.�\���\�;@�i�:�.�C��\�\�;@��0B�.���X�\�\�;@;\�\����.�����\'\�;@�\\m\��\�.�¿\Z3\�;@\�\�P\�\�.��h���\�;@�w�~\�.���%VF\�;@n��ʆ\�.����&�\�;@<�$\�.��9\�m\�\�;@\�xwd�\�.�\�T�]\�;@�x\�\�.�ywd�6\�;@!Z+\�\�.���/Ie\�;@]��u\�.�\�\�]\�;@Rb\��\�.��\�]��\�;@!�\�F\�\�.��,��\�;@+n\�b~\�.���?�:\�;@#�~�\r\�.��ฌ�\�;@��켍\�.��\�\�l\�\�;@����\�\�.�\�س\�2\�;@�����\�.���À\�;@i���.�wj.7\�;@\�\�[v�.�a�HZ\�;@\�\\\���.�\�X�yV\�;@@�5_�.��6o�\�;@x\�W�f�.�_b,\�/\�;@\��X�.�\�h\0o�\�;@�\�jdW�.�ҏ�S\�\�;@\n1�Tm�.�\�mlv�\�;@\�\�(yu�.��`�un\�;@�8�t�.�v\�1<\�;@\0��q��.�4�\�\�;@%\�\�Rί.�ra�r\�;@\�v��\Z�.�vnڌ\�\�;@�EB[έ.�=�Е\�;@H6W\�s�.�ɏ�k\�;@\��|zl�.��0\��\�;@a��M�.�Yk(�\�;@B͐*��.�\�#\rnk\�;@ {��\�.��\�\0d\�;@|�8c��.��\�7\�\�;@/�4\'/�.�F\ne\�\�\�;@�C�\�\�.�B^&\�\�;@ѱ�J\\�.��s\�\�\�;@	\���c�.��9�w\�\�;@*T7�.�.\�熦\�;@w,�IE�.��)��\�;@�ܚt[�.��ҥI\�;@*p�\rܙ.�W>\��\�\�;@V��L�.��N@a\�;@�v0b��.�\�:�v\�\�;@OI��.�܀\�#\�;@\�\�\�(y�.�\�j,a\�;@z\�c�\�.�ep��:\�;@}\����.�9ѮB\�\�;@�b\r�.�ʥ��\�;@�h㈵�.�o����\�;@���̎.�V�F\�;@}uU��.�Л�T\�;@��\�R�.�1е/\�;@ڨN�.���g\�\�;@�	g���.�O\�\�\�N\�;@Sͬ��.�aq8�\�;@\�\�Z\�a�.�|DL�$\�;@τ&�%�.�Н`�u\�;@��<�.�tB\�K\�;@F�6��.���O�\�\�;@\�N\�\�{.�\�\�bg\�;@V��Wy.�`\�+\�\�\�;@0�^|\�v.�0\�\�Z\n\�;@Ǻ��x.�@�\�\�v\�;@ʨ2��y.��\����\�;@���\�z.�ra�r\�;@�\�\"�.�|\��\�\�;@߿yq�.��I\�\�;@Bx�qĂ.��׻?\�;@E�\�\�&�.�Y��\�;@\����.�㈵�\�;@e\ZM.�.�-B�4\�;@\�\�\"\���.��k\��\�;@hz��L�.�����y\�;@�\�\��.�\rnk\�\�;@���4c�.��dȱ�\�;@�\�̓k�.�����/�;@D�.l͎.�\r����;@쉮?�.�aũ\�\��;@�2d��.�i�\�\��;@E��f֒.�Mg\'���;@S=���.�\�\�9\�}�;@#\���.����H\�\0<@QJVՃ.���Τ<@\�8~��.��c\�Z<@0EH݆.�j�@+0<@\'�Ҩ�.���\�C<@�x]��.����\�<@�up�7�.�O!W\�	<@	�3��.�Ԟ�sb<@l�`q8�.���2\�<@��)\"�.�Ƨ\0\�<@[A\��.�=\�\�\�\r<@\�D.8�.��\�\��<@膦\��.�E.8��<@�a��\�.��\�(<@�խ���.��ϸp <@\�X�_\"�.��jIG<@\�4}v��.�G\�\�\�<@p�\�ߍ.�z4Փ�<@-\�1�.�c��Ր<@f�O7P�.�v28J^<@A�v�.��6o�\Z<@8-x\�W�.�иp $<@T\0�gА.��\"�J <@e�9:�.�QN���<@�wD��.�_~�Ɍ<@\�F\�I�.�G�ŧ <@?\0�M��.��!<@AaP�є.�\�)\�\�F\"<@R臭��.�:=\�\�\"<@wۅ\�:�.��TPQ�#<@P�V\��.�=)�\Z\�$<@l]j�~�.�g��e%<@��ؙB�.�c)��&<@t	4�.��[!�\�&<@@Pn\���.�܂���\'<@\�OT6��.�E|V(<@�ra�.�_\�(\�)<@`\"ĕ�.�/j��\0+<@=}��.�\"\08�\�-<@����.��\\\Z��.<@Ę��R�.�\n\�\�0<@;�ީ��.�iSu�l2<@�|�y�.�G\�P�3<@ҍ����.�\�T\�#�3<@�|$%=�.�\�熦\�4<@�hs�ۤ.��`�5<@T���r�.�sePmp6<@\"R\�.�.��h�\"7<@��1>̦.�L�;��9<@\�AB�/�.�sHj�d:<@�\�E���.�\�n�\�\\;<@�\�&2s�.�M��E<<@��\�\�k�.�\�<*�\�<<@\���6�.�i�\0�w=<@#J{�/�.�u\�\�p><@3�68�.�\�\���><@�\�\nխ.�D?�{?<@�7�0�.�\�e6@<@��\�*l�.�(F�̱@<@\�P��d�.�\�\��q�A<@\�Yf��.��\��k�F<@\Z1�\�c�.�	��YG<@�\�I�Ԡ.��=�N<@m�\�͝.�\�~��O<@Л�T�.�{��\�H<@\�B���.��!q��K<@\�=\�4a�.�\\\�tYLP<@\�\�ك.�����Q<@�\�%�|.�\�\�V`T<@\�@�\�|.���hU<@5y\�j�v.�\"�\� >P<@__\�R#t.���q\�P<@ׅ�Om.��%W��U<@���Xn.�\�8\�\�\�V<@(��\�g.�Q��dVS<@-[닄f.��\��n,T<@\�U��\�^.�t�?PnW<@͔\�\�`.�ϻ��0X<@7�A`\�X.�\'i�T<@7¢\"NW.�T8�T�U<@	4\�\�Q.��(\r5Z<@\���c\�S.� 	�v]<@�#���O.�`w��\�W<@�c�=	L.�y�t\�X<@M�J\�D.�>�h]<@s���E.�\nh\"lx^<@�H�[?.�.9(ab<@AJ�A.�ҌE\�\�i<@MJA��<.�}y�\�u<@��߆?.�a�4\�\�w<@2k�M?.����·{<@P�,�C.�\0\�\��<@QO�?D.��G6W\�<@M.\��:F.�\�/��<@P\�\"�F.�&\��p�<@\�\�\�e[.�7�C�<@�L���\\.���B�<@ȕz�Z.�R~R\��<@\�\�,�sZ.�΋_\��<@%Z�xZ.��W zR�<@ZJ��PZ.�\�\\\���<@/\���Z.�bX9��<@ŭ�\�Z.����ɍ�<@1$\'�Z.�\�\�Xǭ<@b->�X.����Q�<@��kC\�X.�T�J\�ï<@�fd��X.�t)�*��<@Ӽ\�Y.���_#I�<@��aMeY.��T�-��<@�>$DY.�ˠ\�\�D�<@7¢\"NW.�\�$��ܽ<@{��&3V.�U/�\�d�<@f1���V.�2\"QhY�<@\�&\�+�V.��sb\��<@�\�\�W.�s��\��<@\�K8�V.�\Z�e3\�<@��\�h\0W.��+f��\�<@�l\\�V.���};�\�<@=\�[�W.�d\��u\�<@߇��(W.�\�pt�\�\�<@��%s,W.�^J]2�\�<@)x\n�RW.�!u;�\�<@#��uW.��#~\�\Z\�<@.rOWW.�Q�_�\�<@�q\Z�\nW.�}!\��\�<@\�(�[ZU.��yȔ\�<@n��WU.�\�{c\0\�<@\�˙\�\nU.�0�\�\\\�<@�`\�T.�2t\�\�<@N�\�\�\�S.�[�*\�M\�<@�z�T.�|\�/�\�<@e����S.��A\�\��<@h>\�n�-��K����<@\�\�\�O��-�|\'f��<@�:\�z�-��B�\�=@h�.�K�-�Ki� =@�����-�78�\�>=@@ޫV&�-�_&��^=@7ǹM��-���;�B�=@�.o�-�&\�\��=@Ӿ��z�-�)\�\�=@6w��\\�-�;\�O���=@�\0Q0c�-��/���=@�b\�=�-�ۿ�Ҥ�=@\�y�ȟ-�a\�\�+e�=@R\r�=��-�\�\'i�=@<k�]h�-�@7n1�=@\��0{ٞ-���1���=@\�磌��-�0\�\�Z\n�=@5\�\�-�.s��=@���a�-� a�\�=@�TPQ��-�����\�=@((E+��-��Z\�̌=@���\04�-��\�D-͍=@��\0\�-���q\�@�=@�FN��-�[��K��=@������-�\'�;�=@W\�el�-��i�=@�6��:�-�b����=@�,\�ģ-�#K\�X�=@��l亡-�#K\�X�=@��k��-�\�3���=@z\�΅��-��O7P\��=@��\Z�D�-�?\�ܕ=@I�\\߇�-�Eg�E(�=@�\�K7�-�w�(��=@M���$�-�0c\n\�8�=@\�e��-��|A	�=@b����-�\�k^\�Y�=@�(\�\�=�-�L5���=@</O\�-�+ٱ��=@/�HM��-�����=@�-�\\�-��c�\�3�=@\��[��-�\�r.ŝ=@p�x��-��aK���=@��|�\�-���\�qn�=@H��0~�-�\�8)\�{�=@i\�\�>��-���;۠=@8�W���-��jIG�=@�\�4��-�OZ���=@t\�׉-���6T��=@Z��U��-�ePmp\"�=@�\�\�\��-��\���=@��[��-�~\Z�\�7�=@�\�H��-�\���oҨ=@�.\�\�[�-�cԵ�>�=@{���-�1�Tm7�=@g���-��\r܁:�=@�̰Q\�-�`\"ĕ�=@�`<�~-����s�=@�<�r\�}-��\"�k�=@;\�%8}-�eq��\�=@\�\�\�+z-���Wt\�=@gE\�D�w-�\�\�u��=@X�5\�;v-�o+�6�=@ׅ�Ou-�\�Qڷ=@\�ܘ��t-�հ\�\�=@��~�s-�\nܺ���=@�Ց#m-��-X��=@�\"ڎ�k-�ѭ\����=@\�ڦx\\l-��L�D��=@���^�m-�6\�e�s\�=@�v�n-���\�#F\�=@+��ݓo-�=�- \�=@�\�+��p-��\�\�\�\�=@!�1\�p-�\�\�WW\�=@�\�\�p-�˄_\�\�\�=@8gDio-��\nF%u\�=@�\�(�n-�n\�\�)\�=@�\���m-�z\�\�\�\�=@�T���l-��<�r\�=@�\r\�\�l-���RAE\�=@\'�y�k-��\�KU\�=@��\�	k-��\�5&\�=@g��ei-�3nj��\�=@��nh-�\�Jvl\�=@\�<�f-�Ő�L\�\�=@q\�\�e-�\��9̗\�=@i:;e-��\�U�Z\�=@�aۢd-�\�\'i\�=@\�\�-\�c-��\��\�=@��e�b-�&��\�=@�\n�7c-�2\���\�=@@x\�=d-�\�<��@\�=@Sͬ��d-�&VF#�\�=@5%Y��c-��\�\�\�\�=@\�\r��na-�̖��p\�=@E�\��Va-�-�LN\�\�=@e\ZM.\�`-��\�\�\�\�=@S8��_-�kQL\�\�=@����^-�@�\�\�v\�=@�����]-�Y4��\�=@�8\�\�m\\-�>]ݱ\�\�=@G��R^[-�0�1\"Q\�=@�\�s]Y-�2uWv�\�=@9ѮB\�W-�M0�k�\�=@�J\�hU-�()�\0\�=@\�s��S-�g~5\�=@���jO-����W\�=@.=�\�\�L-��ng_y\�=@��B�N-�d�\r1\�=@/�\�wW-�FA���\�=@�@��_X-������\�=@��9\�X-����\�B\�=@7Ou\�\�X-�p\��\�=@m<\�b�W-���\�\�\�=@\�[X7\�U-����z�=@\��I\'T-�D�!T��=@\�g��S-��/�\�L�=@\�\�^\�S-��)�D/�=@\�0\�\�R-�\�\�\�\�\��=@d~�$Q-��\\���=@���\�:P-��Z\�7\��=@\�\�LiM-�\"\�Q*\��=@�ԗ��J-�|\�ʄ_�=@6Y��I-�~;���=@�E�>I-��\�\��=@�\�i� I-�]QJV�=@�j�	�I-�d\�˻�=@�*Q��J-��L���=@\�\�<�K-�dʇ�j�=@���\�K-�\�\'c|��=@�\\�&�K-�3��J�=@K:\��lJ-�Cs�FZ�=@��$ΊH-���{h�=@\�\�aNH-�0Ie�9\0>@GM-�\�O=\�\0>@�@��L-���ْU>@&��L-�\�SrN\�>@\�&��\�K-�0.s>@�R]�\�L-�Jy��\�>@Q.�_xM-����m>@G\�&jiN-�$����>@��\���N-�(\n�<>@��\��O-�\�(\�\'>@\�b�\�P-�\�\�\�g>@`���Q-�L�{)<>@Q�5�UR-�\�TO\�	>@���v�R-��\'I\�L\n>@`���fS-�\�a�\�>@p]1#T-�9	�/�>@b���XT-�2s�\�c\r>@Xᖏ�T-�]7��V>@\�(ϼV-�&jj\�>@\�oBX-�\�`�\�\n>@9|҉[-���\�p<>@]�\�]-�p\�G>@\0VG�t^-��ȯb>@U���N`-�S8��>@G:#/c-�pUj�>@K�\��>d-�����Y>@@�Ŋ\Zd-�ؼ��Z>@YiR\n�e-���@�M>@�_u\�Hg-���L/1>@-��\�g-��Ϲ\��>@�\�9h-�Tb.>@\\�=\�j-�\'�_[?>@��oD�l-��!�\�>@`\��\�n-�|�ڥ\r>@Է\�\�p-�aS\�Q�>@ޒ��q-�\�ң��>@b�*\�3r-�ͭVc>@-�\�DJs-��::�F>@0�AC�t-�\�\�4ӽ>@K\�rJw-�2: 	�>@�\rLny-����\�>@9��!{-�g���d >@��jׄ|-��\�>�\� >@\�y7~-��f��}!>@u��\��-�-]�6\">@͐*�W�-���9]#>@\���i��-�ס���#>@��V��-�q\�Ws�$>@��\"1A�-�FzQ�_%>@\�j\�߇-�I\�\"i7&>@)\�\�-�\�\�I\'>@Lk\�\�^�-�\'OYM\�\'>@j���-�ȱ�\�(>@_D\�1u�-����\�)>@\�=]ݱ�-��$y�+>@\�\�o�-�\�\�̯\�,>@�/g�+�-�o�ŏ->@Ϣw*\��-�\�\�w.>@*\����-���C�R/>@\rP\Zj�-�gE\�D�/>@�J\��-����\�/>@	�Į\�-�\�=$|\�/>@Q��dV�-�lMK�0>@\��\�˚�-�˟o2>@E/�Xn�-�~�p\�2>@\�c> С-�|\�/�3>@�ׂ\��-�sI\�v4>@�H\���-��\\�gA4>@M�D�u�-�LQ.�_4>@	T� ��-�J@L4>@����-�zlˀ�4>@��,\�Ԭ-�7�A`\�4>@\�}U.T�-�����55>@\�*�\�-��\�d�<5>@�q�-���85>@��\��-�\�D�<5>@|��l;�-���kC5>@i\�V��-��9:Z5>@�2��\r�-�k{��5>@?\�\�\�2�-�i��֦5>@��\�\�}�-�\�\�\�\�5>@N�\�\�\�-��=\�6>@Fж��-�\\sG�\�5>@S\�k%t�-�)\�\'�$5>@ʩ�aj\�-����J?5>@\�\��5\�\�-�����+5>@r\�)�\�-�֌r5>@8�a�A\�-��}ƅ5>@Z��m\�-�\"\�*\�\�4>@*�\�Y�\�-�\�-��4>@�\�\\\��\�-�J_9\�3>@m���\�-����3>@}%��\�-�࢓�\�3>@r��\�-�}�|\�.4>@\�s��\�\�-��Nϻ�4>@�\�!\�\�\�-�%A�\n5>@;��T\�\�-�AI�05>@\�C�|\�-��HV5>@y�\'e\�-�oG8-x5>@R�h\�-��i��5>@:��KT\�-��,D��5>@U�\��\�-�7�h��5>@\���^�\�-��\�je6>@1�Z\�-�2W\�6>@\�vLݕ\�-�T9\�)97>@�*4\�\�-�%z\�r7>@\�:�v\�\�-�\�r\�\�7>@BB�/h�-��c���7>@\�ƻ#�-�\0<�Bu7>@\�Ӝ�\��-�_\n�]7>@u\�\�m�-��2\�FY7>@\�Ɵ�l�-�^�zk`7>@c�D(�-��\�#\rn7>@#��^�-�i�\"�6>@�\0�S��-�',1607362055,1607362055,NULL,NULL),(6,'Muchinga',_binary '\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�	\0\0��\�+��>@=�ϥ&��˷>��>@�\�\�n�&�j\�q���>@%\�\�ڧ&���\�\�>@\"�4��&��\�\�\�/�>@H��|��&�rl=C�>@�����&�5\�8EG�>@�ŏ1�&��\�M�\�>@��]P�&�y�	�5�>@�\�}�&�:d�w�>@_�sa��&�~��E}�>@e5]Ot�&�\�e\�\�@�>@\�ƻ#�&��>�>@K�P\�&�:vP�\�>@@\�j\��&�\�,\�?�>@o�����&�=\�Ƃ´>@�u�;O�&��n�\�o�>@i�&��6��>@\�N\"¿�&��y��̷>@�\�&���+�,�>@t��o�&��#\�\�S�>@\�<��@�&��,�\�o�>@�\\��u�&��!9���>@x�ܙ�&�b�*\�3�>@\�\�^z&��7k�>@2!撪}&�z�,C�>@�~P)|&���\�qn�>@\�Vд\�z&��SW>˻>@\�O=\�x&�&\�\�\'�>@qqTn�v&��\�Z�>@仔�dt&���\n\�b�>@�iN^dr&�X�\�I�>@5�up&�U�\�7�>@:ZՒn&���֥F�>@6Y��i&�(~��k�>@.\�Ue\�e&�\\\�3\�?�>@\�\�gyd&����>@�\�3g}b&��\\o���>@a�X5`&����i�>@Q0c\n^&�E7�\�>@-z�m[&�e����\�>@\Z\�\��W&�T8�T�\�>@+Q��rV&�\�N\�\�\�>@*U�\�-U&�\�N^\�>@V�j-T&�\�<�\�>@9�M�aQ&�@�߾\�>@c\'��N&��;k�]\�>@v\Zi��M&�0�\'\�>@���\�K&��.��\�>@0J\�_\�I&�\�б�\�>@��\�G&�\��O@\�>@\�#���E&�S	O\��\�>@�\�\'�bD&�@3�\�\�>@Y\���B&�\�\�\�\�\�>@t��o@&���\�\�U\�>@ǡ~�>&�G\r6u\�>@ޏ\�/�<&�ڒUn\�>@��r\�S:&�_&��\�>@��\���7&��WuV\�>@x���N4&�\�xͫ:\�>@\��/0&��\�BW\"\�>@/m8,\r,&�n��\�V\�>@�r\�}\�(&��mQf�\�>@3\�\�(%&�\�wE�\�>@!w�(&��{�\�>@O\\�W \Z&�\�e6\�>@��z\�\"&�DN_\�\�\�>@Ü�M&�g)YN\�>@G�q��&�f\�ikD\�>@;�Y�\�&�\��w\�>@��2\�&�ސFN\�>@DܜJ &��\�\\��\�>@g*!&�3P�>\�>@�@gҦ\"&�O�S\�\�>@�\�\�#&�1\����\�>@��\�5$&�$)\�ah\�>@┹�F$&��ʿ�W\�>@P6\�\n\�\"&�/O\�\�>@\�\��!o!&��\�c�g\�>@�\�u�+&���\�\�>@��\�&�����+\�>@`�\�\�&�\�@�m\�>@w�E&���R�r\�>@\�K\�Ƽ&�\�h��\�\�>@\�\�\��&�b.�\�n\�>@�\�{\r�&����\�\�>@��հ&�T�^\rP\�>@ ^\�/\�\r&�܂���\�>@鷯\�&�ߥ\�%\�\�>@�\�\�9&��C6�.\�>@\�W\�\�\�\n&�\�hV�\�>@�ަ?�	&���i�\�>@R\�Q�	&�zVҊo�>@\��ԱJ	&�>\�D��>@sG�˵&�H��0~�>@\�I�U&�����>@rP\�L\�&�\�9\�\��>@g\�!\�{&�\�n�o��>@�W\��&��\�o_�>@��A�V&�C�Գ �>@B	3m�&�!>�\��>@i���\�&��\�K7��>@��a��\0&�S%\�\�R�>@9\n\0&�.�\�M\��>@�=�N��%�;�I�>@�\��%�Y2\���>@���);�%���\�s\��>@\�\'+���%�}Xo\�\n�>@{M\nJ�%��WY\��>@�\����%�s�`��>@�Ǵ6��%�\�2\�,%�>@h\�K6�%�i�QH2�>@\�(yu��%�aU��N�>@E�ӻx\�%�Ϡ���>@��m�R\�%�D�в\��>@���\�\�%�\r�{,}�>@�\�S:\�%�	\�Vд�>@��cZ�\�%�pw\�n��>@\�\�m3\�%�l?\�\��>@G\�I�\�%��M�\�\��>@\�\�m��\�%��\�vL�>@lMK�\�%�`�\�\��>@#�tu\�\�%�m�s�p�>@Ę��R\�%�A�v\0?@���\�%���w\�?@6\\�\�%�\�SW?@\0!�\�%�\�xͫ:?@��\��\�%��|�?@Ւ�r0\�%����?@��Os�\�%�b0�\�?@U�g$B\�%�N�W\�?@�b�dU\�%�;%�?@&8��\�\�%�\�w~Q�?@*V\r\�\�\�%��\�bE\r?@}���\�%�\�ɧ?@\�n�\�\�%��\�d\�\�?@�և�F\�%�3o\�u�?@_D\�1u\�%����j?@��ȯ\�%��F�?@JV\�\�\�%�Y��L/?@�>��\�%�n\����?@���&�\�%��$���?@�.��\�%��{�ڥ	?@pz\�\�\�%�!\�\�	L?@�GG�\�%��\�\�&\�?@���);\�%�=�|\�\�?@\�\���\�%�]3�f�?@�}q�J\�%�(\�4�?@,cC7\�%���\�\�X?@���\�%�s�\�{�?@~7ݲC\�%���+d?@V\�\�\�\�%�]5\��?@�^\n�\�%�\�K�\'?@og_y�\�%�S	O\��?@\�,\�i�\�%�7n1?7?@C\�up\�%�i�\�Q\�?@����\�\�%�@�:s?@ٰ��(\�%�?\�\�\�2?@7�7M�\�%���h:;?@���\�%�\�V�\�?@�\�R��\�%�ZKi�?@�]\�\Z\�%��\Z\�\0l?@׈`\\\�%�c��\�?@֪]\�%��\�{L?@�\�\�\�%��ʆ5�?@����\�%�ݗ3\�\Z?@\�\�)�\�\�%�v\��ť\Z?@!���3\�%��$y�?@J���\�%��5Φ#?@F\�T�=\�%�3\�뤾?@K�8��\�%�#�k$?@\rR�\�%�!\�X4�?@!�˛\�%� ����?@毐�\�%�9GW?@S[\� �\�%�f-��?@�\04J�\�%�|��l;!?@狽_\�%���f�!?@\�	L�u\�%�oEb�\Z\"?@M,�\�\�%�wI�Q#?@\�9x&4\�%�\�U+~%?@%��r\�%�=_�\\6&?@\�E\ne\�\�%�%Z�x&?@�f��}\�%�>\�^��&?@�\�\�\'\�%�\�@-\'?@�^��\�%��ʾ+�\'?@�-X�\�%��&�(?@!\�K�\�%�L\��)?@\�[\��b\�%�ɯb�)?@��Hi\�%���o��*?@\�;p\�\�%�(�\�+?@\�\�(�[\�%��n\�!�-?@81$\'�%�;�.?@�c!:�%���\�-?@9�Z\�%�M0�k�-?@t~�\���%�F#�W<-?@EeÚʺ%��eN�\�,?@�T�-��%�U2\0Tq+?@�>W[��%��7N\n�*?@`\"\�:��%�\�\�I�?*?@\�;�%�8�Q��)?@�u���%��\�a(?@��q���%�N\r4�s\'?@�1%��%���A�&?@\�\�U���%��;�$?@����_�%��1�#%?@1&���%�rn\�%?@\Z�K���%��\�@-&?@Zc\�	��%�\n��$>\'?@$Di�%���\\�(?@<P�<��%�[��d)?@\�x\"��%�F�̱�+?@P4`��%���zO\�,?@ٲ|]��%�j\�0\n.?@�v�ӂ�%��+J	�.?@�����%��}q�J/?@�t�i��%�`���\�/?@I�p�%�\�y\�9[0?@�s\�ᒣ%�%vmo�0?@f��Ӥ%�]�\�1?@\�6�h��%���\�V3?@\r�\�\n�%�@M-[\�3?@h%����%���r0�4?@Lk\�؞%��\�\�c>4?@��̒\0�%��\�\�t4?@p?\���%���\�\�3?@��\'��%�[\�7\�q3?@�/�^|�%�\�&p\�2?@��\��%���\�҇2?@N_\�\�,�%�)%�\�1?@y�\�n��%��0�*1?@뭁��%�o\�0?@��\�镒%�iT\�d/?@\��/�%�Dio��-?@���祒%�ĵ\�\�^,?@\�y��%�f�YJ�+?@V\r\�\�\�%���7h�*?@�\�\��%�7l[�\�(?@�1\�Й%��=~o\'?@��4F\�%��\��\'?@\�,{�%�\�e���&?@\\�-\�ו%�˟o�&?@3�}ƅ�%�\�e���&?@S��:�%��\�\�&?@�֥F\�%��\�g��&?@6\�Ko�%�yt#,*&?@�̒\05�%�\'3\�Vz%?@�3�\�k�%��\����$?@C�׼��%�PQ�+�#?@FCƣT�%�CqǛ�\"?@�Nt�%�I-�L\"?@�2��\r�%����\��!?@Z�rL�%���q\�\�!?@obHN&�%��9��!?@\��\�%�����\�!?@�i�쀃%�/l\�V^\"?@AG�Zҁ%��\��v#?@Gsd\�%�2�F�$?@CV�z~%�Gsd\�%?@qX\Z�Q}%�S\�\'�\�&?@����{%�\�\�q\�\'?@*1	z%�ɏ�k(?@77�\',y%��r�\�{)?@\�\�P1\�w%�����y*?@;\�O��v%��K�;�+?@�P��9u%�6\�\�x\",?@��k&\�t%�\��\�\�\�-?@�\�>V�s%�j1x�.?@{k`�s%�Ւ�r0/?@\�\�\Z��r%�;s	\�/?@��b(\'r%�-\'��0?@S��q%���)1?@;�q%��^Cp\\2?@�\�\�c>p%�\�v��\Z3?@��\�p%�I�V\�3?@\�$\\\�#p%�\�\�\�m6?@\�!p$p%�_\�D�6?@�1%�p%�t�?Pn7?@=c_��p%�\�9?\�q8?@�����q%�Sy;\�i9?@Na���r%�&p\�n�:?@oe�\�2s%�\�1\�3/;?@\�Z�\0ms%��\��<?@t\�%zs%�:�6U�<?@\0\Z�K�r%��!9��=?@C�+r%��Ǚ&l??@�\��o%���K��A?@�z��n%�I�5CB?@��\�p%��@-C?@�Y2\�r%��\�{\�_C?@�|^�\�s%��0�D?@��-v%�\���D?@�\�\rx%��\�0\�E?@\�dq��y%�g\��\�E?@�m\�\�y%��jGq�F?@�k{�%y%�f��OG?@��9�x%�\�8�j�G?@���Vw%�� �\�=H?@J�O\�cv%��)\� \�H?@\n+TTu%�#K\�X\�I?@�z��s%�\�7��\�J?@2t\�r%�R�K?@\Z���q%��R\�qL?@\�Д�~p%�w��\\�N?@�(	��m%�\�\�|@�O?@3�ٲl%�c\�tv2P?@�[\�Jj%��Z\'.\�O?@���i%��o\�O?@j�{�\�g%��uŌ�N?@�4F\�b%���\�?�N?@�\� �r`%�;�� \�N?@�\�\�M_%��TQ�\�N?@��n\�!^%����\��N?@\�2R\�\\%�Q�5�UN?@\���i�Z%�\�f��M?@�\\�C�U%�\�[X7\�M?@\\U�]T%�y:W�N?@�\��S%�\"\�{�N?@<�(AQ%�[\�:\��N?@��\�\�O%�\0֪]O?@�v�k�N%�Tt$��P?@mp\"��M%�;U�g$R?@\�f��M%��\�\��gS?@���M%�V\�\�\�4U?@3o\�u�N%�t\�\�U?@�O%����DW?@\�v�>XN%�5�\�a0W?@���\�K%�t\��\�\�V?@_A��hJ%�sePmpV?@6v�\�I%�[��dU?@Ḍ�\ZH%�\�\�̯\�T?@d;\�O�G%����T?@�x$^�F%��+�j�S?@�#��E%��S?@E�<�D%�GW\�\�:S?@\�ZH�@%�cG\�P�S?@�>W[�?%�d��ST?@�7N\n�>%��yVҊW?@>�\r\�<%�UK:\��X?@�p=\n\�;%�T�D\�[Z?@�ꭁ�:%�r\�_![?@\��3�I:%��n��]?@�	g��9%�\�u��X_?@�6\09%�^\�pX\Z`?@��JY�8%��a?@\�\�fG�7%�\�6��c?@2\�g@5%����u�e?@Y\�d:4%�F{��g?@�?mT�3%�\�\n(\�g?@�Fw;3%�v4��h?@\�\�4�\�2%����5?j?@i\�\�i�1%��\rk*k?@	À%W1%�_Ӄ�Rl?@ip[[0%�L5��n?@z�I|.%���\�C\�n?@\�5=((-%��+f�o?@�\�\�\�+%��W�Lp?@Z��*%�/O\�Rr?@��f��%%�\�\��!s?@�\�\"M�#%�\�\Z��s?@b�*\�3\"%�I\�\�\�*u?@U�	g�%�D�l\��u?@�}i%�.\�|��v?@@OI%�	kc\�w?@9\�\�%�P\�Ry?@�C�\�\� %����\�#z?@���5[!%���Ma�z?@����!%��\�\�\�={?@�d73\"%�Q���|?@GtϺF#%�H6W\�s|?@\�!S>$%��2\�\�|?@;\��\�R%%�AI�0}?@z\�蹅&%�\�\�\�;�}?@����\�\'%�p(|�~?@)\"\�*\�(%�e�P3�~?@\�rJ@L*%��\'�XQ?@.\�R�,%���@�\�?@\�e6,%��g͏��?@7��\�N,%�	�L�n�?@�F\�\�+%�.9\��?@V�a�*%���jGq�?@H\�\�\�\\)%�`�EЂ?@u \�\�\'%��Z�\Z��?@G\�\��%%��\�E\n�?@\�Ko.\"%�\�-\�熆?@v()� %�6Z�P�?@�h�\'�%�\�\0OZ�?@`\"\�:�%��P�v0�?@��\� %����\�?@�E�\r2!%�&\�\�\'�?@��\�\�\"%�\��p��?@�Ŋ\ZL#%�Swe�?@w1\�t�#%�\���W�?@��f�#%�F�\r2ɐ?@G\�g\�u#%�ZEh\�?@L���H%�����\�?@R~R\�%�V\�1��?@�a�\'\�%�\�%\�/�?@\��\�%�m;m��?@�B\��%��i3NC�?@]�\�%����ผ?@\�?�Ŋ%�J	��z�?@��oa\�%�	2*�?@����A%�?S�[�?@t�3�%�+i\�7�?@D1y\�%��i\�L�?@U3k) \r%�O崧\�?@\r����\r%�B#ظ��?@�+g\�%�\�k]j��?@�\�&N\�%�<�$��?@cz\�%�r4GV~�?@IK\�\�%�����ۯ?@g��%�L⬈��?@�\�\�E%�\n���1�?@R<��%�/�Ͳ?@ē\�\�\�%���H��?@jkD0%�ڭe2�?@#-��#%��jI�?@&S�%���z�?@֍wG�$�s�,&6�?@\�u�B�$�A�v�?@)\�^\��$�� =E�?@9{\�\��$�\�AA)Z�?@\���,A�$�\"5\�b��?@�հ\��$�`\�\�VϽ?@\�`ũ\��$���쟿?@{��\��$�oG8-x�?@F\�\�\�\��$�\�%\�2�\�?@��V|C�$�s�69\�?@4J��%�$���^\�?@�s~�\��$�X9�\�\�?@S\"�^F�$�\�z�ю\�?@2t\��$��\�{\�\�\�?@\�\�O\�s\�$�\�rK�\�?@~�\�!\�$�����\�\�?@�\�HK\�\�$�	ȳ\�\�?@�\�a�\�\�$��8�*\�?@�\r܁:\�$�\�M�q\Z\�?@\'K��\�$�C,cC\�?@��	ܺ\�$��ǚ�\�?@�	MK\�$�Zd;\�\�?@�W zR\�$��&7�\�?@�b��\�$�w-!�\�?@\�ȑ\��\�$�\�\�\�O\�?@�\�r��\�$���\�\�\�?@Z*oG8\�$�rjg�\�\�?@vk�\�\�$�\�x�\�n\�?@�HJz\�$��qS\�\�?@�\�w�\�$�vQ��\�?@a�\n�+\�$���{h\�?@sh�\�|\�$�Kw\�ِ\�?@�Z	\�%\�$�\0�M�\�\�?@\�g\�\�`\�$���0(\�\�?@�\�Xl�\�$�\�\�h��\�?@���\�t�$�ҫJC\�?@\�\���$�=,Ԛ\�\�?@H��|��$�\�\�w\�?@ͫ:��$�\�8�\�\�?@{2�蛴$�x\�\�!\�?@oe�\�2�$�aTR\'�\�?@\�A\�L��$��a�\�?@s.\�Ue�$���1\�\�?@��>�$��X�|\�?@\�^\��$�3\��O\�?@�\"1A\r�$�Z\��c\�?@dyW=`�$����\�\�?@���H�$�r�z�f\�?@�����$��\�\�?@\�o	�?�$�g�\\S \�?@�\�D2�$���\'�.\�?@�5\�e��$��Ac&\�?@Ҫ�t��$�\�\��r-\�?@��x軛$��\�\�\�\�\�?@h!�˛$�x�\'-\\�?@�\� >��$��[Z\r��?@\�($�՛$�]QJV�?@��)t^�$�uYLl>�?@�A\��v�$�Á�,`�?@�4\'/2�$�A\�S���?@W[��\�$�!��q4�?@7n1?7�$�\�\�b�?@\�\�\�=�$�jl���?@#���S�$�\� !\��?@Q�_��$�\�G5\���?@�£��$�)=\�K��?@��~�$�\�\�\�y7�?@\0Q���$�\�ͨ��?@���*È$�5_%��?@Q�H�$���&���?@����)�$��Գ ��?@���\��$�E�����?@�L�\�ŀ$�!����?@(�\�{\�$�v�U��?@�\�\�~$�y\�z\�L�?@�f�v�|$�o�����?@�N@a{$���S�?@\�x�Jxz$�\�%\�\��?@�D��y$��:�/K�?@��\�:T{$��U���?@\�?�&M{$�Q��C�\0@@�s�Lx$�5�;�\0@@�+.�\�u$�\���}\0@@��`r$���\�ם\0@@8-x\�Wp$�\���c�\0@@\�vL\�m$���f\�\0@@����=k$�\0{�\0@@M֨�h$�8>[@@o�EE�f$�#\�#\�@@@�\�\�d$�C��3@@���b$��x\�@@�\��;�_$�����\�\0@@��\��^$��i�{�\0@@;�O\0]$����z\0@@��\�J[$��\�ډ\0@@�\�+��X$�\�G5\��\0@@غ\��T$�\�\rx\'@@�\�3KT$���O�m@@�\���\�P$�@�\�\�v@@���\�qN$�\�\�\�\�l@@z�Cn�K$�n\�\�S@@�\�Q\�I$�M�7�Q@@���1\�F$�4-�2\Z@@�\�g\��D$�\�F<\�\�\0@@�q6D$�=)�\Z\0@@w�*B$��0DN_�?@eÚʢ@$�v�;O<�?@�\�,>$�Ve\���?@�y9\�;$�\Z1�\�c\0@@b.\�9$�Gv�e�\0@@�\�\riT8$�\"�D�\0@@��\�h\07$��ތ��\0@@��Or�5$�\�=��j\0@@��Ϲ3$���T[\0@@>v()0$�I��Z�\0@@&4I,)/$�\�\�\�*\�@@\'JB\"m+$�Gw;S@@�=	l\�)$�\�q�t�@@���=\�($�\�MbX@@y��\�($�U�W@@\�\�fG�\'$�I0\�\�Z@@�Q}&$�.rOWw@@+j0%$� y\�P�@@X7\�#$��ʢ��@@@�\�߼ $��x\\T�@@&7��$�Y�\���@@h[\�:$����\�@@S\"�^$�t_\�lW@@�����$�M�n@@��f\�$��ӂ}@@{/�h�$���5�\�@@�\0U\�$���7�@@O\�\\\�$�9B�\�@@m8,\r�$���b�d	@@ձJ\�$�\�\�\�	@@\�ξ� $�e\ZM.\n@@\r4�s�$�M֨�\n@@\�!\�\�T$��|]��\n@@�\�\\\��$�x\�q@@3��($�\\9{g�@@�\�\�V\�$���Hi@@�W\�$�.\���@@�g�\�s\r$�mscz\�@@�U��$��4��@@Ku/$�F\�@\r@@4�\�k\�\n$���tw�\r@@VE�ɨ\n$�Tq\��\r@@}\\*\�	$�\0VG�t@@a\�\�+e	$����[@@Q0c\n\�$�rݔ�Z@@\�rJ_$�\�/o�@@P6\�\n$��b(\'\�@@�\'\�\�$���ݒ@@��\'�$�-�s�@@\�\��E$�K�!q�@@幾$�\�|��\�@@�1=a��#���|�\�@@~�{�\��#�c{-\�@@L8���#�\�c\�\�@@�y\Z0H�#�����\'@@��!�\��#����\Zh@@��\�\��#����N\�@@p\���#�)x\n�R@@�\�\�&\��#�`\�eM,@@0\�\�Z\n�#���a@@H\Z\�\�\�#�ڒUn@@�4~\�\�#�\�\�l#@@s�=A\�#�\��\�\�\�@@\����\�#���K��@@\�C�|\�#��/g�@@���b(\�#�[�\�\�@@�Ϲ\�\�#�\�\�_Z\�@@lMK�\�#�\�б@@t\\�\�J\�#�A�\�ǘ@@\�\��T\�#�np��@@�\�\��\�#�p]1#�@@\�\�#�\�#��\�3K@@�C6�.\�#�\�=��j@@&����\�#��\�\�а@@]���2\�#�7n1?@@�s(CU\�#���q\�\�@@Ͻ�K�\�#�E|V@@��\�\Z\�\�#�\�&p\�@@	S�K\�\�#�˞6\�@@4�Y��\�#�A~6r\�@@S\�q�\�#��gx�@@\�\r�0�\�#��$\�pt@@�?�ϝ\�#����S�@@x�\�\�#�%�\�\�@@�ީ�{\�#��L�n@@*�n�E\�#�pxADj@@\�\�\n~\�#��k���@@���\�#���CR@@�@.q\�\�#�c+hZb@@�S:X�\�#��6\�Nx@@\�\�OV\�#��\�z�2@@\�n�ڿ#�+mq�\�@@�\�<+i�#�\�O\�\�@@_%��#�\�\�V\�/@@o�;2V�#�4�27@@�*���#�	2*@@z4Փ��#��G��\n@@����#��{h@@A�Ρ�#��@�t@@�Or�M�#�\�>\�\�@@����q�#�EKO\�@@�&\"\�#�\�nI\�@@62;��#�\r\�o�@@��ek�#��\��o^@@E,b\�a�#�\�熦\�@@3�}ƅ�#��ƠB@@�|%��#���ᔹ@@\'\�UH��#��t�(%\Z@@��9�#����5�\Z@@M�J\�#�P\�I\�5@@D���@�#��\��*�@@i��֦�#�#�GG@@v��#�E�^Ӄ@@\�c\"��#�\'.\�+@@NCT\�Ϡ#�k�\�t@@�bFx{�#�U\�z�@@\�.Q�5�#�\Z\�1˞@@�FZ*o�#��릔\�@@�쿞#�\��V	@@�\�(��#�Y���t@@\�l\�%��#�\�}9�@@X}w�#�\�\�\�O�@@\n�(z\��#�g,�\�N @@\�?�Ŋ�#�*:�\� @@�����#��\�ǵ� @@S���җ#�-	PS\� @@k*�#� C\�*!@@\nj�֕#�\�\�.�u!@@\�8b->�#����\"@@��Z�#�dZ�\��\"@@$\�F�#�x�a��#@@\�\�\r�#��*$@@A���#�\Z�e3�$@@��W\��#���X%@@\�\�m4��#�Kw\�ِ%@@\�\Z���#�\'�%\�\�%@@��66�#��3��&@@�s\n�#�nnLOX&@@\�\����#�\�M~�N&@@(�r�#�:\�ؗl&@@\��S㥃#�Ƨ\0\�&@@��\�!�#�=�\'@@ \�E\ne�#�\�t=\�u\'@@�\� �r�#��\��/(@@\�l\�?3�#�\�`ũ\�(@@�\�3�~#��1zn)@@j����}#�����)@@,\�F<\�}#���vۅ*@@\�\�1~#�.�_x%+@@hX��\�~#���i��+@@�ؘ\�#�w����,@@,�z��}#��\�d,@@x\�W�f|#��\'I\�L,@@ߦ?��z#�&7��5,@@�\�%\�y#�9��\�,@@���\�x#�.\�\�e�+@@�V횐v#�2Ƈ\�+@@�\��\�t#�*6\�u\�+@@�\�\�s#�\�i\��+@@\�C�r#����+@@}˜.�q#�\���+@@1�闈o#�Sͬ�,@@���/�^#�S�u8�,@@\�g@�]#�8��+\�,@@�cϞ[#�*\�T-@@=�1XY#�\��G�C-@@���AX#�O\�\\-@@�J?\�\�V#��ܶ\�Q-@@_9\��S#��\��\�-@@bhur�R#�\�&1�,@@�X�\�+Q#�\�;��J,@@�\�\���N#���7/N,@@\�\�\��M#�Iط��,@@L���jK#��c\\qq,@@/�h�J#�\�+,�,@@��lXSI#���ZӼ+@@\�+e\�H#��1�Mc+@@� �\�=H#�4\��\��*@@\n��$>G#�e\����*@@q�::�F#��\�ֈ`*@@<���	F#�\�N�j*@@�L�\��D#�I�V\�)@@��\�\�B#��G�C�)@@\�I}Y\�A#�\Z�d)@@k\�SUh@#�r5�+-)@@Yj�\�h?#���v�\�(@@�R	O\�=#�%<�ן(@@�ο]�;#��(���(@@W�9\�m:#�h+�m(@@��^�s9#�įX\�E(@@\�p\�Ws8#�s\��\'@@�-X�8#�S�Z�%@@\�<00#��Zd%@@M\��..#��p\�i%@@\�c\"�\�,#�3m�\�J%@@�\�\�O*#�]�\�%@@F\�@)#��Z�\�$@@��\�(#�kc섗$@@\�\�e�O\'#�\"R\�.$@@d:tz\�%#�\�\�\�$@@�x?n�$#�2;�\�#@@��K��##�p�h��#@@�\�.� #�n½2o#@@���#�7߈\�Y#@@\n�2#��S�D#@@y�ѩ#��l\�)#@@��u\�\�#�F{��#@@=֌r#�\�\�C�\"@@P\�\"�#�@�C\�\"@@Hqh#� \nfL�\"@@[�\�\�#�qqTn�\"@@$}ZE#���T�\"@@8�k��\r#���2p\"@@�\\S �#�&�<Y\"@@؜�g\n#�?5^�I\"@@(\'\�UH	#�P�<�\"@@I�F�q#�\�r.\�!@@\�\�\0��#�+\�MF�!@@�w��##����!@@��+d��\"�M�\�Ӏ!@@Q�f��\"�HP�s!@@��;3��\"�Z�$�9!@@\�\����\"�\"T�\�!@@�����\"��\�C�X!@@����\"����!@@\�캷\"�\"�3���\"@@�2W\�\"�?S�[\"@@z6�>W\�\"��F;n�!@@od��\�\"�\�v/�\�!@@�.Ȗ\�\"��	ܺ�!@@ZJ��P\�\"�~T\�~!@@8��̒\�\"�tb\�c!@@&\�\�\'d\�\"�\�@-!@@\��\�Đ\�\"��Y2\� @@\�\0d\�\�\"��GT� @@�Ss��\�\"����\� @@w��\\�\�\"�J��%� @@\�Đ�L\�\"�\�9� @@ޒ��\�\"�\"�D� @@��\�|\�\"��_\�\� @@���\�\"�\�\riT\� @@�?\�\�\"�l��� @@`��\�\"�\nIf�!@@0��!\�\"�9��U!@@�_��\�\"�]5\�� @@\�)��\�\"�\�+e\� @@((E+�\�\"���\�Z� @@�d73\�\"�\�\\ @@o\rl�`�\"��(\\�\�@@�S:X��\"�yY|@@\�\�\���\"�?�nJ@@1[�*½\"�\"S>U@@��/��\"�K?�a@@�����\"��$\��}@@�7�̯\"�\�!\�Q@@3�<Fy�\"�\�\�t@@\�\�Aȧ\"��/K;5@@\�]����\"�\�V*�@@�0\����\"�mW\�e@@����l�\"�X\0S@@ ����\"��kC\�8@@dY0�G�\"�����\�\Z@@\"\�\�T2�\"�s�4�\Z@@\\\�3\�?�\"�9\�Z��\Z@@����G�\"��?\Z@@�,AF@�\"�\�\r���@@E��f֚\"�g��e@@*�~��\"�\�\�&�@@�\�{�\�\"��)\�@@������\"��E`�o@@:W���\"�v\�1<@@4�\�<�\"�\�y7@@\0�vi�\"��-�v�@@��};�\"�Lk\�\�^@@��\rګ�\"�\�\�@@��pY��\"�c섗\�@@�J�8�\"�Mg\'��@@�]\�\Z�\"��H��Q@@��t���\"�|�&\Z@@\�\0l@��\"�8�k��@@$\rnk�\"��|гY@@�$>w��\"����&@@\�9\�}\�\"�d\�b\�@@4w�\�\"��\�R��@@u\�\�p~\"���\nG�@@��\�\�|\"�Ͻ�K@@�͍\�	{\"��Un2@@���Ssy\"�g\��\�@@VG�tv\"�\Z����@@�VBwIt\"���C�R@@\�3�ތr\"��X�\�+@@��@�n\"��ƠB@@m\06 Bl\"����QI@@\\<�\��j\"���L�N@@�kBZch\"�\�WXp@@\�*�\�pf\"����@@Ll>�\re\"���u\�@@` ��c\"��1\�%@@ٯ;\�yb\"�75\�|@@ \��a\"��`���@@u��\�`\"�\��R\�@@�h\�^\"�\�>9\n@@(����\\\"��I��	@@�Fw;[\"�ʍ\"k\r@@�����Y\"��}V�)@@\�\�z�VX\"�\"S>U@@hz��LW\"��\�#�@@N\��1�U\"��P29�@@&\Z�\�)T\"��\�3K@@:<��\�P\"�$a\�N\"@@\n\�\��IO\"�\�;F@@!\�>\0�M\"�@4�\�@@rjg�\�J\"�i\��@@��!6XH\"�٘\��@@\���\�F\"�\�R�@@(�N>E\"�f\����@@5\r�\�D\"����@@w0b�\0B\"�5c\�tv@@�\�D\�@\"��\�@@*\�#��<\"�\�\�w�\�@@\0\�\�\�Q;\"�\��k\�@@���\�:\"�uʣ@@kF��8\"�9\rQ�?@@�\�\�\�=7\"�(-\\Va@@k{��5\"�\�[\��b@@��\n�H4\"��\�\�m@@\�R���2\"�\�kA\�@@L\��1\"�ծ	i�@@\�/\�\r\�.\"�I�H�@@�A$C�-\"�\'��n@@�ao,\"��2\�FY@@ʌ��^+\"�L8�@@ѮB\�O*\"��\0�S�@@\�c> \�)\"�(�8\'@@�4\�($)\"�(\r5\nI@@8��L�\"�\�[���@@e��\"��}\�\�@@�=��I \"�4�\�@@\�^}<�-\"�]�jJ� @@y\"��pB\"�����E.@@*\�\�g\\@\"�\�Q\�8@@�gA(\�;\"�\� O!9@@\��\�מA\"����v�:@@r\�\�Q�A\"�\�k^\�Y?@@\�#�&M\"�O�\�\�>@@Xo\�\n\�W\"�\�Q\�E@@8��\n*�\"�\�\�dp�H@@��x!~\"�\\\�tYLJ@@d\�˻z\"�tb\�cM@@��\\\Z��\"��f�O@@U2\0Tq�\"��b\rS@@b�[>��\"��\�uoU@@<i\�\n�\"�j/�\�X@@��b\� �\"�`YiR\n\\@@�?\��\"���(\�`@@\�\�|#��\"�;�b@@�8�d��\"�s,\�d@@��_���\"�cb�qmf@@B\n�B��\"��2Wg@@\�\\�\"�U\Z�eg@@[�\�Ω\"��\��g@@6\�u\�!�\"�\�\�Xm�g@@HlwЭ\"�	5C�(h@@+j0\rï\"��u7Ouh@@E\�[\���\"�\�O9&o@@�&M���\"�Q�5�Ur@@��Ց�\"�F^\�\�s@@�$>w�\�\"��Q�U�s@@\�rg&\�\"�\�m�2u@@b\��vK\�\"�\�u��$w@@\�P1\�\�\�\"�\'i�z@@\�.4\�i\�\"�:\�\�\Zy@@� ˂�\�\"��\�ԕy@@�u�X�\�\"�ϡU1y@@͔\�\�\�\"�s�FZ*y@@�F\�\�\�\"��KTo\rz@@\�X��L\�\"���ȭy@@���_\��\"����Iy@@>z\�}\��\"�_���y@@ZF\�=��\"�\�e6\�z@@�u?T�\"��ΤM\�{@@(+���\"��Z�[!|@@���\��\"�ђ\�\��}@@;ŪA�\"�\n���1~@@ܠ�[;�\"�稣\�j~@@�y\�):�\"�u\�yƾ~@@mr���\"�>?�@@��J?\��\"�1\'h�\�@@��*�\��\"�+�\�	�@@�&P\�\"�\"��\�KU�@@\�bb�q�\"�����@@�*�\��\"�\�&���@@�\�\�9�\"�+�\�X@@E�e\�?�\"����w��@@\�T�]#����Y.�@@����#�C\�5v��@@ɭI�%#�⬈�\�@@�U1�#��\�\�`�@@�\�]��#��,����@@\�G�#�\�,^�@@�|�͍!#�\�Fx�@@I�p$#�+1\�J�@@b,\�/\'#���\�I��@@c�0\�+#��y��C�@@\n�(z\�3#�2�Mc{�@@Ḍ�\Z8#�\n\�F\�@@K?\�\�\�:#�75\�|�@@�\�C?=#�C\�5v��@@Ѳ\�A#�&R�\�\�@@g��\�pD#��J %v�@@���\�\�F#��\�=�>�@@J\�5�oF#�T� �!�@@|���@#�bi\�G5�@@\�\�g#?#�\0�vi�@@�a�1\�?#��\�	K<�@@{O崧D#�fl\�f�@@Gr�\�G#�ʇ�j�@@+øDK#�\�q\�_�@@Eb�\Z�M#�G\r6u�@@|+\�X#�s��P��@@l>�\r[#��j�3�@@��+\�X#�#�	��@@Z5\�\�S#�P�eo�@@���vQ#�1е/��@@z\�c�\�L#�\r4�s��@@\�g#\�E#�Pō[�@@lMK�D#�\�r�э@@.�_x%A#�CF�7�@@-��\�>#���9�@@�%Tpx9#�vS\�k%�@@ ���3#�#�tuǎ@@\�,%\�I0#��ܙ	��@@g���d4#�ǹM�W�@@P\�R)6#�	�Į\�@@Rb\��6#�rp\��@@i�\�r�9#����r��@@��y7#�l^\�Y-�@@\�\�\�U3#��\�*�@@\"R\�.�1#��\��QF�@@����\�1#���9�@@\�f\�\�j3#�裌�\0�@@\\\�3\�?7#��I~į�@@\�\0\�	:#�\n����@@{JΉ=<#�:[@h=�@@Q}>\�@#�\�^`V(�@@\�~K�D#�F@�#H�@@��\�\�K#��#EdX�@@B��Q#��\Z�\Z��@@Z���U#��\�U��@@�\��nX#�\�J�RЙ@@��\�t [#�2ZGU�@@\�0��B^#��WV���@@6\�$#ga#��qS�@@��\�s\�c#�+�\�,�@@��x��i#�-�cyW�@@O$�jfm#�\�J\�.��@@�j���p#�/m8,\r�@@-%\�I(u#��\�O՛@@\�7\�q\�w#��K�Kƛ@@a�.\�e~#�w\�ِ�@@\�_��\�~#����[�@@�!��g�#��`�@@\�]\���#�\"T�\��@@k~��E�#�G\�&�@@�;��#�h[\�:�@@jh��#�\�_\�+ס@@H��[\�#�t�Lh��@@Cp\\\�M�#�_)\�Ǣ@@\�?�C�#��\�g\�\�@@�bd\��#�\��yS�@@�\�\�\�y�#���{G��@@�n�H�#�ʉv�@@@��r��#�܂����@@��\�\�W�#�\�4\r��@@� \�\�	�#�$c���@@t\�\�gy�#�ePmp\"�@@v�\��_�#�x�7N\n�@@�\\�gA�#�b.\��@@���X��#�\�d:t�@@O�?��#��\�N��@@?�g͏�#���fڪ@@�dV\�p�#�\�ZD�@@��9�#�]�,σ�@@����_�#��{+�@@P\�R)�#�\�>��@@�̔\�\�\�#�@Qٰ��@@\�xy:\�#��\�M\�Ҭ@@,=)�\�#�\�;\�\r�@@\�҇.�\�#��Ƭ@@\�y�\'\�#�;\�%8��@@�\�i2\�\�#�|ds\�<�@@^�V$&\�#��4��@@�\�\�h\�\�#�_\����@@Ih˹\�#�Q�\���@@\��s\�\�\�#�|����@@B\�<�E\�#���(	��@@�͎T\�\�#�@1�d�@@<Mf��\�#�]2��\�@@�Wy�#�o�;2V�@@\�h9\�C�#�\�*���@@E��S�#�\�(]���@@�\�\�}r�#��<���@@�$�9�#��n�;2�@@\�;jL�$����(�@@_&��$�~8H��@@�\�\�U�$�\�\�\"��@@҉S\�$�I,)w��@@ \�U+$��\Zٕ��@@�}t\�\�$� |(ђ�@@��5[y	$�)Z���@@[$\�F$�k,am��@@-z�\r$��%Tpx�@@�\��$�\�+�V]�@@\�U,~S$�\� O!�@@u\�Hg`$�\�{/��@@�P�$��\Z�{�@@}>ʈ$�ⱟ\�R�@@\�bE\r�$�\��M(D�@@ȷw\r�\Z$���\�lȥ@@�G6W\�$�\�)�n��@@\�%qVD$��(���@@\Z\��lY$�ۆQ<�@@�\�\�9$�0+\�~�@@�]= $�\�\�����@@��0�:!$��-Y\�@@��\�G\"$�Sh\�@@��<�|#$�AaP�Ѧ@@E�\�Ӝ$$�Vb����@@,��ص%$��$]3��@@ڨN�&$��.�o��@@\�\�\�\�&$��l\�ާ@@\"ĕ�\'$��e�c]�@@��vN�($�[Υ���@@ͭVc)$��\��v�@@׿\�3g-$��I���@@��H�0$�\�\�\���@@�\�΢w2$��\�솩@@�\�\�\0�3$�\�\�H/j�@@]��t5$�f\��@@=\�[�7$�{g�UI�@@\�f��5$�\�\�0���@@���l\�2$�?8�:V�@@�\�Bt4$�\�_vO�@@0�\�{�4$�{�f�l�@@S^+��4$��|\�r٬@@wJ\��4$��\�\0d�@@�0�4$���9��@@y]�`74$���\�N��@@\Z\�1˞4$�d=��\�@@V�)��5$�x|{נ�@@��.\�\�7$�&p\�n�@@\��H9$�\n\�8���@@ �\��:$�%vmo��@@.��S<$�sL��@@\�Yf�=$�gc%\�Y�@@�0\�>$�f�YJ��@@�T3k)@$�\�l˱@@��%�LA$�aE|�@@v�\�\�C$�^c��޲@@G�	1�D$�g\��ͳ@@�UfJ\�G$�Z�1\�	�@@}�͍\�I$��Un2�@@�\�\�`K$�.�@@\'�O:�P$�Ψ�*��@@��xx\�Q$��+�PO�@@�W��R$����&�@@c\�J!�S$��\�΢w�@@>\\r\�)U$�?W[���@@ܻ}\�U$��\rګ��@@\�q�dW$�M�^�i�@@�\�\'c|X$�&m�@@�v���X$��q�@@\0kծY$��\�F\��@@\��\�\�Y$�e4�yŻ@@]\�wb\�[$��	MK�@@�g��]$�0\r\�Gļ@@\��\�\�]$�U����@@%��r^$��Y,�@@\�8h`$����H�@@�\�\"M�c$��\�\�T�@@\�LLbe$�!Y�n�@@\�\�V\�Ig$��~�Ϛ�@@(\'\�UHi$��|��@@4.\�j$�zm6Vb�@@\�.�5k$��Jw\�پ@@Gˁjk$�e\�\�J��@@\��1�Mk$�\�U�3�@@Q0c\nn$����U�@@�%\��o$��˸���@@\��r$�<�$��@@n\�\�Su$��F��@@�B</w$��ן\�\��@@��!�x$���Ũk�@@2t\�w$�\�):�\��@@��\�\�v$���<\�@@�**w$��\�O\�\�@@=Byw$�\'ݖ\�\�@@%\�/�y$�M�n\�@@v�ꭁ}$�\�SV\��\�@@D\�H��~$�\��v\�\�@@o�1�$��\�;jL\�@@L5���$�M���$\�@@��g�$������@@� �$��\�\��@@\�\�ù�$��/g��@@Q��B��$�\�qo~�@@J~įX�$��\�Y�N�@@-z��$�#\�#\��@@:vP�\�$�\��s\�\��@@E�ɨ2�$��\�*�@@��M��$�?$D��@@�\�\�\�$�\�%8���@@w+Kt��$�Ac&Q/�@@~p>u��$�\�2���@@�\�U�Z�$���H�@@ߨ�\�$�)�*���@@��o\'�$�\Z�\��\��@@\�3£$��.o�@@�9\�m¥$��\�\���@@\�\Z�N�$�O�o+�@@�p�\�[�$���\"ڎ�@@ݔ�Z	�$��~31]\�@@�\Z��$�\�r�c�\�@@\Zެ���$��3�\�k\�@@�\�W:�$�\�>\0�M\�@@\�cx\�$�\�\\T\�@@4J��%�$�\�\\\��@@\�\�B���$����?\�@@~\�\Z.r�$�3�<Fy\�@@��ѫ�$�t]�@\�@@�q��>\�$��q\�\�Q\�@@#\��\�$�\�KS8\�@@W���\�$�5\'/2\�@@\�^\��x\�$�\�bԵ�\�@@G��t\�$�K\�ó\�@@.c}\�$�\�\�\�#\�@@,���\�$�ܷZ\'.\�@@]~p>\�$���GS=\�@@.��\�\�$�\�\�9\�}\�@@5\�Ry;\�$�`��\�\�@@v6\�\�$�,F]k\�\�@@L\Z�uT\�$��Ƿw\r\�@@A-\�\�$�F�G�\�@@\�\0OZ\�$��\�W:\�@@=_�\\6\�$� F�6\�@@\�J!�K\�$�I�5C\�@@�@d�&\�$�V�\�{\�@@=�Е\�$��O�\�\�@@g�lt\�\�$�j2\�m�\�@@<p\��\�$��X�O\�@@�+�PO\�$�\��_\�@@o\rl�`\�$�.�\�M\�\�@@��\�\�$���j\�@@T\��\�$�\�#�G\�@@MN\�S\�$�aP�\�\�\�@@נ/��\�$�\�\�m4�\�@@\�\�B��\�$�\����\�@@`���\�\�$��\�+,�\�@@\�\�а\�$�ҌE\�\�\�@@8I�Ǵ\�$�)B\�v�\�@@�.��$�4��\�\�\�@@^��\��$�\���\�\�\�@@\�\�<��$�Ƥ��\�\�@@4\�f�$�S��\�@@�\�3g}�$��9]\�@@���\�}�$�\'jin�\�@@\'�\�Q�$���Os\�@@h�\�s��$�\�~�d\�\�@@�c!:�$��\�(\�@@��Z}u�$�O�)�\�\�@@�\�|?5�$���\�\�@@�=~�$�ɏ�k\�@@\\\�\�\rM%��\�\��\�@@r���%�ٴR\�\�@@�\�=\�%�!yv�\�@@\"\�{�%�3Mg\'\�@@9EGr�%���1��\�@@���	%���Wt\�\�@@\�j���%�1���6\�@@,��26%�\Z�e3�\�@@e���%��6U�\�\�@@\�\�\�4%�����u\�@@\�d�<\r%�\0u\�\�@@�FZ*o%�&qVDM\�@@D�\�\�X%�R���<\�@@�-\�l�%�\ZOq\�@@�A&9%�\��\�\�@@��3ڪ%�����\�@@�\�PMI%�¢\"N\'\�@@�\�\�,�%�5�+-#\�@@9+�&�%�B\���\�@@Q\�E\�%�t@�\�\�@@To\rl� %�\0r\�\�@@Q\�y\"%�����\�\�@@�\'I\�L&%��ȭI�\�@@�\�,&%�J�i�W\�@@�\�ފ\�$%����[\�\�@@��\�;j$%��?\�,\�@@g���$%�2\���\�@@\�.\�\�\"%�\��\'�\�@@�\�\"%�ɐc\�\�@@�g��!%���B�\�@@(F�\�!%��$�\�@@n\�y#%��$\��}\�@@�\�]��$%�\�\�mU\�@@o��\'%��q\�\�\�@@!���3*%�;m�\�\�@@�\��\�Y+%�\���k\�@@.\�熦,%����\�\�@@�>��/%���\�f\�@@ݖ\�g0%��(��\�@@��:5%���-u�\�@@���U6%��B�=\�@@t_\�l7%�����\�\�@@\�N\�`�7%�6�\�g\�@@N�\��8%��o%;6\�@@]Ot]�9%��\���K\�@@V�\�{<%��gx�\�@@\�y�t=%��\�cw�\�@@\�\�%>%�0�k��\�@@\n�2�&?%�;\�G\�@@;q9^�@%����\�@@P�D�D%�o���I\�@@\�8\�\�\�F%�y�\�n�\�@@A����I%����\�@@��\"N%��3��E\�@@\"\�\0�&P%�$0�\�\�@@�X��Q%��{G�	\�@@v\�\�fGR%�t#,*\�\�@@h\�u��P%�8�\��\�@@\�\�S\0�O%��G��\�@@�D��Q%�c+hZb\�@@�}\�AzR%�\n�2\�@@��\�\�S%�Ɖ�v\�@@�Y�\�/U%�u\�\�@@���_�V%��\0�S�\�@@�@��_X%�y�\'e\�@@2q� Z%�F\�-t%\�@@��ZӼ[%�;9Cq\�\�@@��\�]%�d\��u\�@@�U-\�(_%�^��\�@@pUj�`%���\�\�@@�lw�f%�j��\�\�\�@@N\r4�sg%�\�u\Zi\�@@���h\�h%����4)\�@@[\�\�\�i%��7k�\�@@��C\�j%�辜ٮ\�@@\�w.l%��\�3g}\�@@�J\�n%�U/�\�d\�@@>Ab�{p%��\�`�H\�@@K?�q%�\�U�Z\�@@oe�\�2s%�\�\"����@@\"7\�\r�t%�e�u�@@�jQLv%�\�\�7\��@@��7x%��GT�n�@@�D�e\�w%�-?p�\'�@@sh�\�|w%�\�8��\0�@@��!6Xx%���[�\�@@\�~k\'Jz%�(`;��@@5��\�{%�is�ۄ�@@�+�,}%�\�����@@<ۣ7\�%���tZ��@@O�C\�́%�\�j{�@@�L!u�%���\�:T�@@I�,|}�%��z��9�@@\�;�\�~�%��\�v�\0�@@�K8��%��%\���@@8gDi�%�n�|�b�@@�\rګ��%�VG�t�@@X�vM�%��>\�½@@�/Ie��%���9y��@@ByG�%���\�LL�@@�Kǜg�%�뫫��@@\�_w��%�v\Zi���@@�U�\�6�%��\�\�u�@@�a�\��%�g)YNB�@@���\��%���C��@@)�\�/��%�b\��vK�@@\�\�\�=�%�f����@@2\�%\�%�\�h\�\r��@@jM�S�%�\�MbX�@@G;n�ݔ%�oJy���@@3P��%��\�ދ/�@@\�M)���%�\�\'��@@�g���%�5s���@@ݚt[\"�%�\�\�\�\�P�@@��vN��%�\�i���@@�]���%�\����@@y\"��p�%����A�@@pC�׼�%��\��\�@@J\n,�)�%�ak��@@�\����%��\�k\��@@f\�?��%�v����@@�\�\0�%�V�j-�@@\�K�%�KY�8ֳ@@F�xx�%�d�����@@E�$]3�%�\��\�O�@@��q\�%����g�@@�s~�\�%��	�\��@@�n.���%��!q���@@\�)1	�%��-�\\�@@P6\�\n�%�\�\�G��@@�ŏ1�%�aobHN�@@\�\�<��%�\ZyY�@@Afg\�;�%�x$(~�@@M\�*���%�%�\�1�@@Y|E�%��;����@@d]\�F�%�p@KW��@@W\'g(\�%�F]k\�S�@@2q� �%��n���@@衶\r�%�mscz¬@@���ģ%����-=�@@�\�p\�ܤ%��a�\'֫@@���@��%��f�\�I�@@9\�Cm�%�I��Z��@@6\�Ko�%�@ޫV&�@@O��Dڦ%�\�\r����@@b.�ڦ%���K�;�@@\'i���%������@@�C\�%�<�l\��@@=+i\�7�%�U\�\�\Z��@@t�3��%�[]N	��@@��O�\�%�\�\�.\\�@@�\�r���%�77�\',�@@Ͻ��%�;\�f��@@��,\�Ԭ%���\�8�@@�q4GV�%�5|\�@@GUDݯ%����.Ħ@@#j�\�G�%�\n�2��@@Qk�w��%����5?�@@/ܹ0ҳ%��.6��@@\"q���%��X�O�@@��\�\�c�%�7���@@�*�\�]�%��\�&N\�@@z5@i��%�Ot]���@@V�a��%��ED1y�@@�Q+L߻%�;��@@\ZS�\�ټ%�\�uoEb�@@����S�%�\�SUh �@@\�ƻ#c�%�6\�ģ@@���Ž%�\�\�<��@@\\\�J��%�JzZ��@@�%Tp�%�j0\r\�G�@@Q���J�%���[\�J�@@?\�ܵ��%��9A��@@�\"����%�\�=\\rܡ@@�	\�y�%�v�ꭁ�@@?n�|��%�\�rK�!�@@�Tގp�%�rOWw,�@@��4L�%�����ӟ@@\�\�[ֻ%�\�\�T��@@y=��%�\�]����@@ڮ\�\��%�\�rJ_�@@Ku/\�%�\�\�XP�@@��\'��\�%�ȗP��@@\�����\�%�\'3\�Vz�@@�\0:\�%�L�\nF%�@@\"�\�I\�%���>�@@F^\�\�\�%�\��̰�@@Y�\�\0\�%�o)狽�@@\�\�L�\�%��<���@@��3��\�%�����@@\�E�S\�%�\��@@�R	O\�\�%�+l� �@@\�N?��\�%��i�쀟@@O$�jf\�%��Ϲ۟@@d�\r1\�%�B��=�@@�1\0\�\�%�-ͭV�@@n5\�\�\�%��R^+��@@�F\�%��\r�\�֡@@w����\�%�e\ZM.�@@�{h\�%�\�ihw�@@��L�D\�%�\�;\�\r�@@r��	\�%��X���@@�Z�\�\�%�\�����@@\\�W z\�%�\�c\�ߣ@@Swe\�%�_�L�@@�ɍ\"k\�%��eo)�@@\�\�w�\�\�%�.v��2�@@�[!�\�\�%�L\��1�@@ɮ��\�\�%�\�\�{,�@@�\�:q9\�%�I��Q,�@@6�\�\�\�%���)�@@ծ	i�\�%�\�/�1\"�@@J\�E�\�%��rf�B�@@c\�\�l�\�%���@�M�@@Z�\��Z�%�<FzQ�@@�//�>�%�\�\�\�\�H�@@��c${�%�&4I,)�@@G\r6u�%�Q�n��@@6�:�%��\�D2�@@X˝�`�%�;]���@@�ʡE��%�jkD0�@@��6\�\0&�=�;k��@@\��\�\0&�\�:���@@D�l\��&����ʧ@@��ݯ&���\�ߧ@@�\�\�\n&���@@+�\�\�&�\�\�9�@@{\�v\�\Z	&�\��i�@@qh�&�\�ihw�@@�\�9&��!Y��@@W��x�&�h@�5�@@X�\�0_&�D5%Y��@@H�`\�&��đ�@@͕A��&�Xt\�5=�@@d\�mlv&�A��\�F�@@\�\Z��&����뉪@@��ᔹ!&�\"�uq�@@_\�lW\�#&�\�X\�@@�\�\�#\'&��m�B<�@@�\�|~(&�G仔��@@J�%r�)&��{�ڥ�@@/m8,\r,&�\�V���@@�V��\�0&�\�º�\�@@��B2&�\�\�\�\��@@�\�`\�3&�Cr2q�@@u6&�DkE��@@\�\r�Q7&�lv��ί@@Q��99&��E�\0�@@��E\�<&�4�Y���@@�=�N�?&�����ܯ@@4���B&�S	O\���@@-B�4E&�D3O�)�@@�\�\�F&�;�*��@@Wд\�\�H&�y[\�ٰ@@o\rl�`I&����\�W�@@MHk:I&���%�L�@@h\�\�`oJ&��\�e˳@@)w�\�M&�\rnkϳ@@\��DׅO&�+�\�O8�@@��ݓ�U&����D�@@aS\�Q�W&�\�\�\���@@(��Y&�AJ\�\�޲@@f�%\�[&�\�)H�@@t\�\�\�^&����)�@@:\��ld&��πz3�@@,��e&�\�\�gy�@@\'/2�f&��Ϲ۱@@�|Ai&�\n��O��@@\ZM.\��j&�%�S;�@@VF#�Wl&�\�D\��@@A�mߣn&�1^�ΰ@@o\�\n\��r&��5\�e�@@M�d�\�w&�\�\�m�@@\�\�\�c{&�L\�A�\�@@�\���|&�6�~�@@n3⑀&�\�.PR`�@@��\�N��&��W��V�@@\�\"���&�nN%@�@@\�C�X��&���V\'�@@��\�&��qR���@@qN`�&�؁sF��@@E�@J�&�c�#\�w�@@��S\�\0�&�\n�\�\�%�@@��\�Y�&�31]�ի@@=HO�C�&�s��P��@@3�<Fy�&��4\�($�@@Yl��ƚ&�\0{��@@7n1?7�&��o%;�@@O�j\�&��\�U��@@�Q���&��,\�ĩ@@b\�\�!�&�#k\r���@@S�1�#�&�4\�\Z�@@o��\�\�&�\�S\�q�@@��뉮�&��\rګ��@@\�A^&�&��z0)>�@@�^|\��&�\�_�5\�@@Yک�ܸ&�\�^\���@@H\�\�\�\\�&����Hh�@@(I\�L��&��p\�@@���O�&����o�@@�0��\��&�?$D��@@�Ù_�&�@�#H��@@\�\����&�]�mO��@@� =E�&��!�\n��@@��c�\�\�&���?\r�@@�\�\�vh\�&�\"�T3k�@@q\r\�-\�&�HP�s�@@zS�\nc\�&���KTo�@@E���\�&��]��a�@@A���\�&�܂����@@-?p�\'\�&�e����@@\nףp=\�&��%\��@@��R{\�&�\�fG�\�@@\�3��\�&�ū�m�@@\\\�\�.�\�&�\�\rM\�\�@@�S^\�&�PS\�\���@@��@�\�\�&��J��@@�\�je\�&���Q,��@@V\�pA\�&�5�\\���@@3R臭\�&���S�@@��Kǜ\�&�\�2R艹@@\��`R\�&�:��*��@@X\�eS\�&���`U��@@K9_\�\�&�s�c���@@��d9	\�&��8�*�@@c���\�&��:�/K�@@��@�\�&�\�\�.Q�@@d�=	l\�&�\�\�̯\�@@k�3�&�\�J#f�@@33333\'�\�$\���@@A�w�\�\'�/�혺�@@��e�\'�b\�\�!�@@����=\'�^*6\�u�@@;\�bF\'�\n�s\r3�@@\"� ˂\'�k����@@�\rk*�\Z\'�Ѱu��@@+hZbe\'�Kw\�ِ�@@:\�,B�\'�,�\�yp�@@\�e�\�t\'�\�\r��[�@@mr��!\'�P\�R�@@��\�C\�\"\'���|\�r�@@v3�\r\'\'��󬤝@@�I�2*\'�2\�\�Y؝@@9��!+\'�vöE��@@Ae���+\'��Go���@@_Ӄ�R,\'�%=�N�@@\�c\"�\�,\'���f�8�@@\�U��\�\�\'� \r�\�\�y@@\�\�5\0(�^-wf�w@@֪](��|�b�x@@\�PS\�7(�ZJ��Px@@\�\�L�7(�X�x�w@@�\�\n\�5(��w\�1w@@\�\�\�*\�5(�|\��\�w@@�	�Y\�6(�\�QG\�\�v@@\Z\�\��7(����L�v@@L⬈�8(� {��\�u@@��\�Z�8(�;:�Fvu@@\�Aȗ8(����\'u@@#e��\�8(�歺\�t@@z\�΅9(�T\�qst@@�t\"�T;(�j\'�;t@@B\"m\�O<(�ݗ3\�t@@��]L3=(�/�\�\�s@@\�\n�>(�\�\�Ŧs@@鷯?(�\\�v5s@@v�;O<?(�2�#\�r@@\r\�º�>(�\0�&�r@@�Ϛ?(�����q@@7�\',�@(��m�q@@̲\'�\�A(�\�P�lq@@\�\\\��XC(��\�sq@@;\�GE(�7\�xͫp@@s�`�G(��\�\�dpp@@(\�\�GH(�y@ٔ+p@@�4\�($I(�\�Ǻ�o@@\�1!\�J(��Rx\�\�n@@EeÚ\�J(���#�n@@Sz��K(��y\�n@@\�#\��J(��\�\�Gm@@��Ɋ\�J(�)\�\'�$m@@J��	\�I(�/\���l@@�\�̓kJ(�\�\�\�\�\�j@@X�vMHK(�ij@@\"lxz�L(�\\�\��(j@@�\�\�l\�M(�&�(\�\�i@@\�$#gaO(�\�BF�i@@\n��P(�gc%\�Yi@@�5�ڋP(����(\�h@@�g�P(�O!W\�Yh@@�\��wO(���G��g@@�k	��O(�~�p\�d@@*9\'�\�N(��T���d@@\0:̗P(�+n\�b~d@@\0��q�Q(��ӻx?d@@+øDS(�\�\�Xm�c@@��T(�<��k\�c@@�\�)\�JU(��9��c@@�- �V(��:��b@@|&�\�iX(�\�4�\\b@@6\�$#gY(�yx\�\�a@@}��bY(�\�\�tpa@@�h\�\�iY(��Z�\�a@@��\ZZ(��\�}��`@@�Q,��Z(�ڎ���_@@e��[(�\�\�\�1_@@�r�\�h[(�Z�P\�^@@6\\�-[(�/l\�V^^@@-ͭV[(�\�\��S\�]@@`X�|[(��mR\�X]@@\�T�\�\�Z(�\n�2�&]@@���Z(��(\�\'�\\@@��\�X(��&�\\@@�I+W(�{��\\@@�{G�	Y(�\�҇.�[@@˟o�Z(��a��h[@@�tu\�b[(�f���-[@@ds\�<G\\(��3M\�~Z@@��`�\\(����-=Z@@��\�<\\(��0\�q�Y@@\�L�:Y(�Xr�Y@@t_\�lW(�\'\�+�VY@@\�wakV(�I�2�\�X@@؁sF�V(��\�)rX@@c�:\0\�V(��\�6S!X@@?#KV(�d\�C\�W@@fM,�U(�$\�\�(�W@@f���~S(�\nIf�W@@{\�v\�\ZQ(�\�4�OV@@�GT�N(�\\8�V@@ܽ\�\'GI(��#EdXU@@N} y\�H(��mē\�T@@\����I(��[\��S@@�1\�\�I(��+\�F<S@@j3NCTI(��\��\�\�R@@���sEI(��ܚt[R@@�f��}I(�\�Sr3R@@x\'�K(�I\�\�\�Q@@�e��K(�\�E|\'fQ@@\rR�L(�\�D\���P@@\�r.\�UM(�5\�\�P@@%<�ןL(��\�S:P@@���\�L(�]�C�\�O@@�o(|�N(�8h�O@@�\�ܴO(�9�3LmO@@�j\�vO(�֌rO@@��u�R(�d�wN@@�\�ңQ(�E�ɨ2N@@9�d�\�Q(����\�M@@�	MS(��x�aM@@�6�XS(�~��k	M@@���)�T(�\���}L@@�h\�^`V(���\�(@L@@�\�o�\�V(�\�e\�-K@@\�ߠ��X(����J@@�-v��Z(�\�\�>�QJ@@���(\\(��%\�J@@:\�](�r��\�I@@�ѩ+�](��ܶ\�QI@@.��S\\(���gI@@��@j[(��I@@-�s�Z(�\�\'�H0I@@\�\�\�\�\�X(�R�d=I@@\��9̗W(�\�\�\�\�BI@@{��&3V(�?�Ң>I@@a\\:\�T(�oe�\�2I@@�?mT�S(�V��WI@@�b+hZR(�	�nH@@E�>�\'Q(���\'HlG@@\�ާ�\�P(�R�hG@@���RxP(���i\�F@@\�pt�\�N(�\�\�\�\�F@@\�S�4�M(�=��\�F@@R���L(�>\�ɋLF@@��\'��K(�&m�\�E@@c�0\�K(��i4�E@@o\�\n\��J(��\�\�\�D@@�O:�`J(�N\'\�\�rD@@P�i4I(�]\��\'D@@f-��G(�d;\�O�C@@+/���E(��\�|\�XC@@\Z�K��D(�\�iO\�9C@@�\�ĬC(�L8�C@@�\��\�A(��\�\�\�B@@\�ɋL�?(�&p\�nB@@5~\�$?(��/�\nB@@\�2��>(��v\��A@@�\�bc>(�\�q\�_A@@�.R(?(�\�\�6�@@@�\"1A\r?(��?��i@@@�U1�>(���-$@@@�O\�I\�=(��\'v�?@@y\��=(�\�:\�?@@�\�^\'�=(��8\�\�m>@@_��=(�py�>@@�`p\�=(�+0du�=@@U.T��<(�4�\�=@@,�z��=(�{��\�`<@@8�k��=(�\�e\�\�@;@@��լ3>(��\��\�\�:@@\'�|�?(�-x\�W�:@@sh�\�|?(�\��\ZI:@@2��8*?(��*:@@\�B��>(��\�3.:@@�U��y<(�\�\�0:@@$��\�9:(�\�\���9@@�\��\�8(�\�c�\�T9@@��\�	�7(�\�5�\�8@@(��\�6(���\�8@@�\�E\n5(�n/�8@@wg\��3(��4�B8@@Ja\�\�L3(�qx�\�7@@�\�~�3(��M*\Zk7@@�\n��1(�\�<�7@@KxB�?1(�z�m\�6@@\��\�˚0(�v5y\�j6@@*\���P0(��ެ�5@@�W�L0(��#*T75@@��IӠ0(�R�r�4@@rݔ�Z1(��\�uoE4@@-Ӿ1(��I�%r3@@pC�׼2(�\�I�\�\�2@@� \"5\�2(��l;m�2@@@4�\�2(�\�Q\�2@@z�ؘ\�1(��2Q�\�1@@d���_1(�GN��1@@T\0�g\�0(�n�\\p1@@>Y1\\0(�1|DL�0@@y\�Z/(���&0@@JA��4.(�ͫ:�0@@/3l��+(�(CUL�/@@S]�\�+(��\�s\��.@@r\�\�Q�)(�\�\0OZ�.@@���\\�((����.@@J��4*((�\���8a.@@\��\�e�&(��\Z�X.@@��%:\�$(�\��-s.@@q!�\�F\"(�$�]J].@@�\���(���A{�-@@-y<-(����oa-@@`\0\�C�(�\�\�a�-@@���>(��@��,@@T�n.�(�6\�\�+@@�|�F(�\����+@@W�\�,� (��*5{�+@@�=B͐\"(�m�Yg|+@@:x&4I$(��yq\�*@@\�	�_\�&(��\�\�)@@\���((�s�69|(@@\n��a\'(�\��b\�\�\'@@O�\�\�((�¢\"N\'\'@@/m8,\r,(�JEc\�\�&@@øDk-(�\�\�F��&@@\�\�ù.(�\�\�8\�\�$@@��\�\"2(��E\�\Z$@@L<�3(��[\��#@@���|�5(�s��+$@@\��v\�6(�`�5\�!$@@\�Ɵ�l8(�\�˻\�#@@�\Z�X:(�>\�\Z-$@@��};�@(��\�\�C\�#@@~��k	I(��\�B��\"@@�;\Z�J(�\�\�\"�#@@�&�%\�N(�\�\�ID�#@@Z�xZ~P(��U1�$@@i�\�Q\�T(�\�u\Zi%@@|E�V(�PQ�+�%@@T���\\W(�0�Qd�%@@�\�΢wZ(��.Ȗ%@@�\�\�L0\\(�PQ�+�%@@\�v�>X^(�MK��F&@@���<H_(�@KW��&@@˝�`8_(�C�l\�&@@��Cl`(��P\�\�\�&@@\�;��Jb(�G ^\�/&@@V+~�g(�!\�\�	L%@@\'�\�Q�k(��\�(�\�$@@կt><k(����$@@�\�\�Nl(�C8fٓ$@@��\�t(�rP\�L\�#@@\�fd�{(��\�\�#@@\�u\Zi�|(���Դ�#@@7�\���(�\�\�=�#@@\�]M��(�>ϟ6�#@@�\�\�l\�(��\�\n�#@@�P�%��(�\�_w�#@@_(`;�(��V\�f#@@\�Jvl�(�\��5w\"@@	pz\�(�\�A\�L�!@@\�,�s��(�\��8�!@@.\��:��(�1\'h�\�!@@�{�P�(���\�\�!@@\�MF�a�(��nK\�!@@ {��\�(��_cD @@�\�Y���(�\0\�3h\�@@	��YK�(��P�,@@\����`�(��\rND�@@�x?n��(�2\�\�Y@@?6ɏ��(��\�{*�@@�]0�\�(�e73�\�@@@2:=�(�W#�\�2@@��B\�ʠ(���b�@@�Y�X�(��(\�\r�@@\��M(�(�U�\�-\�@@tA}˜�(�H5\��\�@@(�8\'�(�)]���@@�r�\�{�(�\�\�1@@����(��F=D�@@����(�\�/fKV@@\�\r��0�(���8d@@��aMe�(�q��]\Z@@dx\�g��(�Do��@@�Q<��(�uV\�1@@�˷>��(��ƠB@@\�vhX��(�~8gD@@\\=\'�o�(��\�\0d@@BA)Z��(�J��Gp@@\�0���(�]n0\�a@@�\�|\�X�(��KK@@`�_?ľ(�nlv��@@f�O7P�(�\�\r�:�@@p|\�%�(�<l\"3@@|�y\�\�(��Ӂ��@@g�\�67\�(��Mc{-@@<�.\�(�\�.�5@@H\��Q\�(�\�\�!��@@�\��x\�(�΍\�	K@@�����\�(�b0�\�@@x�\Z\�(��\���@@ǃ-v�\�(�\�Sr3@@\�6��\�\�(�J��4*@@+5{�\�(�Y���.@@\'\"\�\�(�Z/�r�@@g�+��\�(�\�SW>@@��\0\�(��\�ǘ�@@��\�\�(�\�N�j@@ظ�]�\�(��}��\�@@\�\�bg\�(��K\�1�@@rk\�m�\�(�|҉S@@�=�\�\�(��6\0@@!yv�\�(�M\nJ\�@@��R^+\�(�X8I�\�@@T�D\�[\�(�L��O\�@@׾�^�\�(�\�P1\�\�@@F�Sw\�(�:�6U�@@-	PS\�\�(�\�c\�\� @@�\�\0\�(����\'@@n\�@\�\�(�&�L1@@�^�2\�\�(�q $�@@�a��m\�(���_�@@\�U\�6\�\�(�`��-@@��ôo\�(�뫫�@@m�\�p�(�6��,\n@@�&l?�(�ywd�6@@C�Գ �(�p^��j@@��\�_��(�z\��@@��¼\��(�A�c\�]@@��_��(�\�|x� @@@�P�%�(��\Z�\Z�@@6�\�\n\0)�P�\�W@@��X\0)�\�)�n�@@��\��)��l\\@@R\�\�\�\�)�}\�\�\�E@@cD�в)��\�~K@@�\�:8\�)����I@@�0Xr\r)��<e5]@@�[\��)��Y.�@@�T���)�~\�D�@@�\r�\�\�)�����@@4�Op�)�\�-\�\�@@C\���)�\�б@@l]j�~)��[�O@@�\r�)��J\�4@@Su�l�\Z)�[A\�+@@i5$\�)���n\�!@@�d�P3$)���[�\�@@Zbe4�))�\�Tƿ@@3ı.n+)�\�\�\�O@@�\�n�U.)�\�{/�@@\0\Z�K�2)�;�\�u�@@>�x5)�,�)@@\�;jL�9)�u�\�&@@\�\�A%�;)�\�\�	/�\r@@\'\�_=)���^��\r@@ܻ}\�=)�d�\�Tk\r@@��\Zh>?)�ߤiP4\r@@\�m3\�A)�\�z�p\�@@\��ԱJI)�\"H�@@i9\�CmK)�+\��@@� \�X4M)���\��@@kJ�GO)��\�ŉ�@@\�\\�mOP)�\�a��@@-\�(�Q)��\'��@@�<֌T)�bHN&n@@xcAaPV)�N	�I�\n@@�@�\�\�X)�1`\�U,\n@@\�H��rZ)�{נ/�	@@q�{��[)���	@@�\��\�\\)�n�l��	@@x%\�s}_)���S�\Z\n@@�\Zg\�`)���QI�\n@@9EGr�_)�Dio��@@g�8\�_)�����Y@@�\'�.�`)�\�_��@@&S�b)���5�@@M֨�hd)�\�V%�}@@#\�M)�e)�\�/fKV@@\�5\�\�h)�/�\n\�\n@@��\�\�Uj)�z�m\�\n@@`\��-m)��Ϲ\��\n@@\�\�Χn)�̘�5\�\n@@\Z4�Opq)�3R臭\n@@\�eOs)�&\�\�s|\n@@lˀ��t)�\�٭e\n@@obHN&v)�7\�\�Z\n@@�U\�x)�\�1��	@@:=\�Ƃz)�y�0DN	@@�>;\�z)��\�R\�@@\�$\�\�z)��/�\�L@@&�fe{)������@@��m\�|)�1\�\�Z@@�G��\'|)�FA��@@9CqǛ|)�C��3@@d\�\�A%~)�=Y��@@�-�\�~)�\���\�~@@0�k���)�\���҈@@\��!o��)��Z\�7\�@@�d\�p�)�SYvQ@@��켍�)�\�b)��@@-�cyW�)�_�vj.	@@}A	�)�xe��	@@\��w�)�\�o_\�	@@@�\�\�v�)����·	@@\�\�[v�)�X\���@@\�WXp�)����\�:@@|�?mT�)�ZEh\�@@�\�\�݇)����ӝ@@+1\�JZ�)��Քd@@�A&9�)�\�\�l�\�@@�ΤM�)��J\�@@�wD�\�)��\��@@\'�Ҩ�)�\�[[%@@D�\�\���)��\��K@@�Q�)�tA}˜@@�|A�)��\�\�#@@\�B���)�N��;P@@\�\�\�\na�)��i\�L@@2\0Tq\�)�{��mm@@xE𿕔)��Ϝ�)@@qW�\"��)�I�[\�@@ |(ђ)��\��@@#f�y��)����;@@����)�[�D�A@@��x!�)�Q�5�U@@�]/M�)��F��1@@ѓ2��)�gaO;�@@XT\�\�$�)����ɩ@@#��^�)����5[@@����)�h���@@6��\\�)��\Z�$�@@%\�/�)�\� Z+\�@@�\�\�m�)����\�@@�p\�i�)�$~\�\Z.@@�p!�\�)���\��@@N*\Zk�)�\��S\�@@0�\�\\�)�-�cyW@@��x���)�&�L1@@M�:�/�)���H\�\0@@(�\�v�)�G<\�͌\0@@\�\�Ŧ�)�Z_\0@@�^�)�8�L\0@@a����)��w�Go\0@@�z�<d�)��h�hs\0@@�\���)�y�t\�\��?@x\n�Rϲ)�w\��\��?@�x\\T��)����b�?@��H�)�˟o�?@�Z\�7ڱ)�\����?@�>��?�)�¥c\�3�?@�yq⫵)��x]�`�?@�\�{\�_�)�\n���1\0@@�\�~K�)�~7ݲC\0@@Ƈ\�˶�)�\���JY\0@@\�T��)��R��c\0@@+�\�	�)�(Hlw\0@@\��p\��)�m�\�o�?@�Ac&�)�a\�\�+�?@�\��\nD�)�\�=yX�?@�-�\\�)�\�9\�\��?@-$`ty\�)���b�d�?@�\�p\�\�\�)�h\�\n��?@�)U�\�\�)�\'f�\��?@B��^~\�)�\�\�u��?@\�N\"¿\�)�Y5s��?@� x|{\�)�z�ަ?�?@�r\�Sr\�)�d\��\��?@.rOWw\�)�\�\�/fK�?@\�I���\�)�\�����?@���[�)�\�eS��?@,�\�E|�)�J\�o	��?@�[���)���\�\��?@���۞�)����\��?@\"\�k^\��)��\�W\\�?@\�5>��\�)��u\���?@n½2o\�)�\�%qVD�?@}ZEh\�)�\�G5\���?@\�<+i\�\�)��UfJ\��?@�B�Գ\�)�\�0\'h��?@\�ܴ�\�)�33333�?@M1AG\�)�2: 	��?@_��\�:\�)�I��&\��?@�{�ԗ\�)���P��?@ɫs\�\�)��l;m��?@��1>\�\�)�g(\�x��?@n\����\�)�8\�GnM�?@DP5z5\�)�_����?@_(`;\�)�N\��1��?@vR_�v\�)���b�d�?@z\��\�)�/�\�|\��?@cC7�\�)�f/\�N\�?@\�-��\�)�x\n�R\�\�?@؜�gB\�)��[\�d8\�?@\���\�)�I�Ǵ6\�?@����o\�)�tzލ\�?@Sz��\�)��\�2\�\�?@R�\�\�\�)�e\ZM.\�\�?@�u�X�\�)�\�\�M�\�?@\�\��\�)�ۿ�Ҥ\�?@m�\�<+\�)�\���W�\�?@���\�i\�)� (�\�{\�?@)�k{\�)�)$�\�;\�?@+\��\�)��.�\�|\�?@~7ݲC\�)�s۾G�\�?@�#�\�)�ޏ\�/�\�?@7���\�)���\�:8\�?@#�\�\�)�뭁�\�?@�{�ڥ\�)�\nL�u\�?@\�cx\�\�)�_���F\�?@��W�\�\�)�*Ral!\�?@T\�d�\�)��/���\�?@�$��\�)�]�\�a\�?@6l�\�\�)���!�\Z\�?@����\�\�)�ʣaQ\�?@G��R^\�)�J�\��\�?@4iSu�\�)��h�hs\�?@2\���\�)�\Z\�\�A\�?@\���,A\�)�l\�\�C\�?@\�oB�)�\��Y�\�?@SX����)�֎\�u\�?@T8�T��)�\�a0�\�?@h]�\�@�)��<\r$\�?@p|\�%�)��.\��\�?@F�a\�\r�)�40�&\�?@���.\��)�m\���{\�?@]P\�2��)�&���\�?@<��\�\��)�����\�\�?@fffff�)�Q1\�߄\�?@����\��)��\�PMI\�?@�\�z�2*���Os\�?@�bd\�*�6\\�-\�?@If��*���5��\�?@��~�*�\�l#�\�?@DkE�\�*��1\�	\�\�?@{ܷZ\'*�H�V\n\�?@�\�zM*�?\�\'\�?@�6ǹM*����W\�?@�}�\�\�	*��\�\n�|\�?@�\��*�^\�Y-�\�?@m��\�*�\\W\�\�?@\�\�q5�*��E\�\Z\�?@c�D(\n*��\Zٕ�\�?@\�\�M�	*�@�z�\�\�?@ϟ6�\�	*�j\�L�\�?@���*�QN���\�?@`V(\��*���B\�?@t\�\�gy*���#\�?@�_[?�*�J\�E�\�?@�\�8�j*��.�KR\�?@S�u8�*��F� \�?@a4+ۇ*��.�o�\�?@���\�l*��\�\�\��\�?@IIC�*�y\\T��\�?@��a\�*���\�\�c\�?@9�d�\�*��{)<h\�?@�\��*�-σ��\�?@a�^Cp*�K�!q�\�?@�\�v�\0\r*��v��-\�?@oJy��*����\�?@Iط��*���o\'\�?@�=ϟ6*�|F\"4�\�?@+j0*�؛��\�?@\�\�$[]*���\�@\�?@\�,\�i�*���/�\�\�?@�;k�]*�+\�\�6\�?@mt\�Oq*��\��5\"\�?@�W}*�\�:��\�?@lZ)r!*����_\�?@\�%\�2�\"*�B\�\"LQ\�?@h�\�HK%*��\�	m\�?@0du�\�$*��\�I��\�?@�\"r$*�\�Y5\�\�?@a8\�0C#*�\��R�1\�?@����\"*�\�H�5\�?@\�\�+\�#*��\��\�\'\�?@nڌ\�%*��?mT�\�?@P6\�\n\�2*�v\���\�?@2Y\�d2*���\��\�?@�\��\�0*�\�\�\�;�\�?@\�V%�}0*��lw\�?@vŌ��0*�%]3�f\�?@�d732*��RE�\�?@\� \�hU3*�y�\'e\�?@%\�\�\�4*�]2��\�\�?@\�>�̔6*��[�\�A\�?@�u7Ou8*�#��^\�?@p��:\�8*�\�\�#��\�?@��\04J7*�����@\�?@�Z\�Q6*����X�\�?@�|�R�4*����.\�\�?@Dj\�\�43*�\� ��\�?@��i��1*�u��\�a\�?@\�\�\�/*�r2q� \�?@�Ң>\�-*�}\"O���?@��I��,*��%��?@�\�\�7�+*�ܷZ\'.�?@�\���,*�\�\r�0��?@�/ע-*�<\�8b-�?@i\Z\�0*�D�.l;?@�(^em3*�W	�3�?@	4\�\�y4*��ߡ(п?@܁:\�\�5*�\�&��\�?@\��&7*�*\�\�F��?@5(��8*�l>�\r�?@7qr�C9*��|\�.P�?@H\��Q9*�߈\�Y׼?@\��\�:*�3�f��?@�\�ŉ�>*��\�p\�W�?@\�>�@*�	\�P��?@\�\�vhXD*�5ӽN\�?@$��\�F*��E\'K��?@\�E_A�I*�$�����?@~SX��J*�2�F��?@`?\�O*�36t�?�?@cAJP*���T���?@E�\��VQ*�,��\Z�?@\npUR*��B �8�?@�#��\�S*�@7n�?@�+�,U*��,D��?@]lZ)Z*�F\�j��?@�M�\�[*��\�d�?@+�C3O^*�1е/�?@:�\�H_*�jl���?@\���}`*�Z�P۶?@���,\'a*��\�E|\'�?@ݗ3\�b*�yGsd�?@oe�\�2c*��f�\\�?@�-s�,f*�%W@��?@8k�*g*�8��̒�?@*\���h*�(v�U�?@I0\�\�Zj*�\"H��?@\�\�\�k*�]¡�x�?@K��F>o*�xG\�j�?@9\�\�m4p*�\'\�+�V�?@�ŋ�!r*��%�\"�?@��\�\�Ur*�˜.���?@�Q��mx*��/ע�?@P:�`�y*�B\�%Uۥ?@q̲\'�}*��\�Li��?@�ЕT*�\�l�IF�?@\�K6l�*��i\�q��?@\�\�h\��*�\�g��Ҧ?@��y\0��*��jI�?@\�\��L�*��>���?@�c\�]K�*��d�?@\��q�*�^�\�I��?@��\Z�D�*��C\�b�?@Y0�GQ�*�\�\��?@�\�唀�*�R��Z��?@0\�70��*�\\!�\��?@��*4�*�I\�\�\�?@/�>:u�*��GT�n�?@\��)�*�>[�?@��A\�<�*�\�j����?@�uX�*�횐\��?@\�n�Uf�*�j\�q���?@\�\�|@��*�\�M֨?@O崧\�*��5�ڋ�?@�+g*�İØ��?@cb�qm�*�\�q\�\�r�?@PR`L�*��uŌ�?@`�\�\�*��Sȕz�?@�V횐�*��\�*�?@we��*�\�_ѭ�?@\��\�Đ�*���\��?@O\�9���*�^\�Y-��?@(\�\�G�*�ut\\�\�?@.py��*�^H��0�?@�\�&���*�\�_Z\�\'�?@��\�Y��*�4��E`�?@\�,	PS�*���:r��?@\��r��*�{Nz\���?@;\�G�*��!�\Z��?@J+��*�Ɏ�@��?@�s�L�*�Է\�\�?@\��`R|�*�>@�\�̞?@��켍�*�~���?@R�b��*�j�*��?@W\�I\��*�t@�\�?@m򖫿*�\�i��&�?@S���ƿ*���C5%�?@�P�%��*�F\���?@{i�\0��*�/m8,\r�?@\'k\�C4\�*�\n�2��?@�F\�\�\�*�X�%���?@\�\�\�B�\�*��\�ȑΐ?@�<i\�\�*�9{\�\�?@\�\n~b\�*��ky\�z�?@L�$z\�*� )\"\�*�?@\�\�{,\�*�&5�،?@�d\�,\�\�*�QlMK�?@\�b�D\�*��\�t牋?@R�d=\�*����x�?@�Sȕz\�*��F\�ҋ?@\�+ٱ\�*�l\�\�TO�?@�an�\�*�\�ù��?@l\�u�\�*�u;�ʃ�?@Y�_\"\�\�*��`���?@�\�d\�\�\�*���!r��?@[�T�\�*�]2��\�?@l>�\r\�*�#M�<�?@kF�\�*�D\�ͩd�?@�LM�7\�*�TT�J�?@�(\�\�=\�*�H\�9���?@���4\�*�d\���?@l���\�*�\�]gE�?@�\�\�_Z\�*��f��?@��\�\�*��r0�\0?@��UJ\�\�*��\�\�uS~?@�^~�\�\�*��?\�,}?@��\�0\�*�!\��|?@��V�\�*�\'2s�\�{?@J��Gp\�*�MI\�\�\�z?@иp $\�*�\�\�\�1w?@:vP\�*����ɍv?@��Tގ\�*��;Mf�u?@���·\�*�+mq�\�t?@DOʤ\�*��GQg\�q?@�C�\�\�\�*�}\�X��p?@�\�T�G\�*�L�\�\�\�o?@\��Wy\�*��=^H�o?@a2U0*\�*�Qio?@㈵�\�*�W\�f�n?@ė�\"�\�*�I\�\�\�*m?@R�h\�*�+\��l?@\n��a\�*����*4l?@QhY��\�*�><K�l?@�\� �\�*�\�o\n+l?@\��-]\�*�}\�.PRl?@\��\�]�\�*���+d�l?@\�Iط\�*�\�^\��l?@\"5\�b��*�\�_{fm?@\��@�m�*��q\�\�m?@75\�|ν*�\�;�\�~n?@*\���*�\Z��\�o?@\�@�9w�*�~s��o?@\��-�*�JV\�\�o?@��̒\0�*�\�\��{�n?@ϺFˁ�*��F\�g\�m?@��R{�*�\�A^&m?@�\���*�1a4+\�k?@��b���*�0EH\�j?@�@�*�Ӥt{i?@\�Z��v�*�r1\�qh?@\�?2:�*�\��\�wg?@�:\�\r�*��\�\�v�f?@\�\�Hٚ*�\�&�\�0f?@��nٙ*�P�<�f?@�\��\�*�`<���e?@i�\'�*�ϼv\�e?@�y��C�*���b��e?@Z)r��*�(~��ke?@\��yS�*�0��d?@B�Ēr�*�ⱟ\�Rd?@���*��\\pc?@u\�yƾ�*��\Z/\�$b?@\��/׊*�����`a?@\�\��6��*���3��`?@��(좈*�o��_?@\��-��*�KU�^?@��a���*�vq\r\�]?@\�\�y7�*�\�V�S^?@\�����*�֍wG^?@/0+\�~*����k\�^?@�\�\�W|*�T9\�)9_?@�d73�y*��\�\�t`?@[닄�t*�:�\0U`?@o�$\�r*��!Y�`?@X9\�p*��\�;a?@\�b�0m*�YLl>�a?@\�б�j*�L5��b?@\\\�J�g*�)_\�Bb?@:x&4Id*�� \�\�a?@\�\��9#b*��\�1 {a?@8��+`*�l\�\�TO^?@�\��-[*�.\�;1\�]?@>�h\�\�Y*��&ݖ\�]?@Q�\�ڦX*��,D��]?@��@�MU*��\'v�]?@���R*�\�\�\�D]?@�T3k)P*�\��Q�\\?@\�I\�5�O*��Fv�e\\?@�n/i�N*�\�_!se\\?@\�!S>M*�仔�d\\?@��O�\�E*��\�\n��\\?@��	ܺC*�r75\�\\?@ݗ3\�B*��?\�,]?@JӠh@*�S\\U�]]?@d\�\�A%>*��\�	m]?@m���<*�\�聏]?@sJ_9*�oG8-x]?@�RAE\�7*��Z�\�]?@\�}͑5*�\�25	\�\\?@�pvk�4*���b\\?@\�6�De3*���\�U\�V?@KW��x\"*�\�.m8,Y?@�W�<\�*�!<\�8Z?@ƨk\�}\n*�fN�\�\�Z?@\�\�?��)�\���R?@\�\�9\�}�)�%�}�eI?@���u�\�)�x\'�??@߉Y/�\�)�.;\�?l5?@�\�9�)��-?@e\�X*�\�\�8\r%?@�m�B<*���\�T�?@	���?*�MK��F?@\\\0qW�)�\�Y\�\�?@���\�\�)�;�/K;?@2Ƈ\�\�)�6\�\��>@\'3\�Vz\�)�t�\�Y\�>@\�j{\�)�T\�\�$[\�>@�\�\���\�)�Ϡ��\�>@�?N�0\�)� \��\�>@�4f\�)�\�\"�\�\�>@ux\�\�)�-$`ty�>@wd�6�\�)�W\n�\\\�\�>@@�3iS�)���\�\�\�>@p��1=�)���H���>@��)��_>Y1�>@\�>Ȳ`z)��B�Y�\�>@�2��Al)�?q\0�\�>@ \�o_V)��\�^f�>@vnڌ\�P)�:z�ަ�>@��\�R$?)�1�\�c��>@oe�\�23)�\�1�=B�>@M��EC)�w\�\Z��>@k��\�H)�\\[%X�>@uʣa9)��7�0�>@ș&l?))�ٕ���>@�il�)���`�>@�\�\�\�\0)����>@�}�\�)�Ym�_u|>@G8-x\��(�Qi{>@�:�p\�(��}W�>@\�2R\�\�(�\�;jL��>@N*\Zk�(��o\�>@կt><�(�9\'0�v>@�W}�(�f�y��l>@̴�++�(��d:tzf>@� �(���W[>@�đ�(�*ŎơR>@2�\�̃(��	ܺ�G>@\��M(D�(�\�gy\�=>@��=^Hw(��\�&N\�3>@\�=��jn(�$~\�\Z.*>@�\�p<�i(��˛\�!>@��\�\�\�](�*\�\�g\\>@�.�KRQ(�\�*\�]g>@\�j\�\�?(�\�`\Z��>@\"�4�0(����-\n>@f��C(��\�p\�\��=@\�_Z\�\'(���p�Q�=@U�W�(���2SZ\�=@\\=\'�o(�()�\0\�=@��\�\�\'(�ǠB\�=@��%s<(���0\�=@�R\�hJ(�\�xͫ:\�=@\�n�1H(��\n\�\�=@���\�lD(�\n\�F\�=@G\�g\�uC(�~W�[\�=@]¡�x@(���ɩ�\�=@�\��\�?(�4J��\�=@^�\�>(�0\�a�[\�=@M-[\�<(��\�ԕ\�\�=@\�\�4�\�:(�is�ۄ\�=@����59(���\�\�\�=@�H�}8(�Sv�A]\�=@\0���6(�w;S\�\�=@\�\�9?5(�1\�q�\�=@B&93(�K\�ó\�=@��D\�1(�	2*\�=@\�^0(�\�\ZJ\�E\�=@��\�\�.(�\� ��\�=@�闈�.(��\��\�=@%vmo�,(���k\�\�=@&�\�:�*(�\�\�m\�=@j�\�G)(�\�O�}:\�=@5\�\�o�((�^-wf�\�=@u=\�u\�\'(����s\�=@u��\�a&(�}˜.�\�=@ZGUD%(�/�Xni\�=@;V)=\�#(��oC�\�\�=@a8\�0C#(�S<.�E\�=@��\�>\�\"(�`\�U,~\�=@C��f\"(��\�o\�\�\�=@9F�G�!(�b\��vK\�=@\�̯\�\0!(�\�0��\�=@F\�T�=(�\�\�\�\�=@�\r�\�(���~31\�=@͒\05�(�\�\0l@�\�=@lˀ��(�R`L\�=@\��8�#(�oc�#\�\�=@+�6+(�\�v�\�=@7p\�(�\0t�//\�=@Z\�\�(�ٰ��(\�=@K\\Ǹ\�(�����\�=@Y\�\�;(�%��C\�=@�\�\�\'(��x\�\�=@2:=\�(�ut\\�\�\�=@�2W\r(�8N\n�\�=@��x\�(�\�\�f�\�=@x�\�\n(���\���\�=@\�ù�	(�Qf�L2\�=@=��\�(�֏M�#\�=@9\�Z��(�!���3\�=@�\�s\�v(��a\�\r�\�=@3Q�\�\�(��\�(�\�\�=@Hk:!(�Xc\'�\�=@\"¿\Z(�\r\�W\�B\�=@=\r$}(�\\>��\�=@\�\�V%(��Y/�r\�=@;\�bF\0(�2r��\�=@\�S\�q�\'�\�):�\�\�=@\r34��\'�{1�\�\�=@f�\"\��\'�\�w(\n�\�=@%w\�Df�\'�\����^\�=@p\���\'��\�Y�N\�=@\�\�tp�\'�Q.�_x\�=@&\Z�\��\'��ΡU\�=@�b��\�\'��f��}\�=@�Y/�r\�\'�@\�,\�\�=@F|\'f�\�\'���$y\�=@|\��\�\�\'���N\�\�=@�m5\�\�\'��V`\�\�\�=@���0(\�\'�Yk(�\�=@\�,\�\�\�\'��~�{\�=@%Z�x\�\'�\����\�=@*1	\�\'��\Zٕ�\�=@\���\�\�\�\'���[�\�\�=@����\�\'��q\�\�\�=@-$`ty\�\'��g��\�=@\���}\�\'�\"rl\�=@(a�\�_\�\'�\�\�\�=@�\�\r\�\'�e�<\r\�=@�=��\�\'�kQL\�\�=@\�%�\�:\�\'�y�\�\�A\�=@\�m\�8\�\'�!�!\�\�\�=@]��\�l\�\'���\��\�=@��\�:8\�\'��Q,��\�=@�S�<\�\'�b���\�\�=@�\�ǘ�\�\'��\�z�2\�=@\��+\�\'�`\�\�\"\�\�=@\�\�\�\�\�\'�Ku/3\�=@�t\"�\�\'���\�+\�=@�u�;O\�\'�O\�6��\�=@}\�\�\�E\�\'�M�\��\�=@�ꭁ�\�\'��s�\�\�=@\�6��\�\�\'�=`2\��=@�>\�¹\'���?�:?>@+�m��\'�\�\�8�	S>@�DKO�\'���\�\�q>@\�&��<\'�G��tq>@ڨN:\'�0\�\r\�q>@��B�6\'�I�0ep>@\�xͫ:3\'�Sx\�\�o>@��Ơ2\'��lY�.o>@h�\�\'�0\'�)x\n�n>@5��6\�.\'�(ђ\�\�n>@\��\\4d,\'��30�n>@\�N\"¿(\'��\�g\�n>@||Bv\�&\'�\�	�o>@\rra�\"\'��D\�\�p>@\�K�\'\'���^~�q>@9�@d�\'�% &\�Br>@p#e��\'�ٰ��(x>@\\\��\'���\�\�~x>@�p̲\'\'�Y���\�x>@9\�\�m4\0\'��k\�\�y>@e����&�F	�=z>@\�j��&�\�O\�s\'|>@\�6�De�&�&\0��*}>@y?n�|�&�\�zj�\�}>@W\�o�&�M�\���>@GUD\��&�\�\�-�>@5\nIf��&�gaO;��>@\�jdWZ�&�&䃞͂>@y�\�n��&�\�{�七>@�2�&�\�w)uɄ>@k\r��\"�&�w�\�o�>@�	.V\��&�\�4�>@�m5\�\�&�ǟ�lX�>@1AG�\�&���(#.�>@ͬ���\�&�i㈵��>@؀q\�\�&�\r\�n��>@�~\�T�\�&�\�٭e�>@\�T���\�&�\�k���>@�k\ndv\�&���Ƅ��>@q�a�\�\�&��Z(��>@��\�U\�\�&�G�>@\����T\�&�1`\�U,�>@�Ӟ�s\�&��\�lɪ�>@\�:�� \�&�Զa�>@\��\�Fu\�&��zk`��>@(~��k\�&�\�9\�\�>@�<ڨ\�&�p\"����>@�ao\�&�\�c?���>@\�g@��&�\r�q7�>@�\�\�#�&��\�K�>@����&�\�Nw�x�>@�k�\�&�\"ĕ�w�>@h���&�w��N#�>@��Co�&��Q�>@\�k���&�B�Ēr�>@4��7��&��T3k)�>@N\�&�O�&�\�8)\�{�>@\�hV��&������>@<�ןħ&�ߥ\�%\�>@`<���&�CV��>@,��ص�&���\�+��>@=�ϥ&�',1607362055,1607362055,NULL,NULL),(7,'Northern',_binary '\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0JB\"m\�\�>@\"��\�g �5\�\�o�\�>@�\�#\rnk ���\�t\�\�>@m���m �q�\�[u\�>@c\�\�\�q �y7R\�>@\�	m9w �� ��q\�>@\�PMIց �[\��Y\�>@\�\��UG� �L8�\�>@L\��1� �\�\�$�\�>@��\\��� �Lo.\Z\�>@ѓ2�� �(CUL�\�>@���0� �+1\�JZ\�>@\�9�� �r1\�q\�>@���(\� ��+�j�\�>@����\�� �0�\0\��\�>@���}\� �W\"P��\�>@\�P��\� �I0\�\�Z\�>@��>\� �\��vKr\�>@mV}��\� ��WuV\�>@\�Li�-\� ��$W@\�>@�jQL\� �\��/\��>@6\\�-!�\��p�?@\�\�[<�!��,\�}?@/n��-!���(�\n?@�6��:2!���`�\�?@\�M)��8!�{��!U?@Ӄ�R�:!�\���\�\�?@\��UG�<!�z�ؘ\�?@\��w\�@!�\�\��?@\�t=\�uA!��;Mf�?@q��\�\�A!�u?� ??@\'�;B!���@�\�!?@r\��\�A!�5�u$?@\r�{,}@!�6\�\n\�r%?@\��/@!����5\'?@\�6��\�>!���Tl(?@&�v��=!�[z4Փ)?@0*�\�<!�m�IF\�*?@|�&\Z<!�5ӽN\�+?@4�Op�:!��HZ\�-?@�\Z�D�6!�\���V.?@\\Va3�5!�fN�\�\�.?@6sHj�4!�.Ȗ\�\�.?@\�S\�q3!����U.?@V�F.!�\r��\"\�.?@A~6r\�,!�\�\�zi�0?@S\�\�\�-!��L\�*�1?@\"O���,!�x\�=\\2?@� [��+!���c��3?@@/ܹ0*!�\�\�\�\��4?@\�\�ne)!�\"3�<6?@\�x\"��(!�A��_�7?@\�;F*!�հ\�\�8?@�D�$]+!���cZ�:?@�D�,!�\�0|D<?@,��\�/!�X��V\�<?@��s�//!���o\'=?@S<.�E,!��`\��=?@y]�`7,!��0}�!@?@�M�G\�/!�Xr�\�@?@ę_\�2!��<\r$A?@>[{3!�e5]OtA?@�\�E|\'6!���xx\�A?@?��7!�^�B?@;m�\�9!�\Z1�\�cD?@�0�*=!��\�ZE?@t\�\�\�>!��\�LMF?@*\�\�g\\@!�˝�`8G?@\�ݮ��@!��(z\�cH?@�\��p�@!� �+\�pI?@�\��[@!��Y/�rJ?@�ЕT?!����K?@\�d�z�>!�\�v�K?@\np=!�|+\�L?@rP\�L;!��g�M?@,f��9!�% &\�BN?@��\0n7!�J\'L5O?@�\�.Q�5!��R�r/P?@;\�zj5!�@�P?@\�`66!�YQ�iR?@�Q\�o&6!��;\ZS?@�d\0�\�6!��\�n-S?@\�x8!��\�I\�S?@J`s�9!�&�L1U?@h͏��8!�\Z����U?@\�\�\��9!�>?�V?@�sѐ�8!�i\�V�V?@,�\�yp7!�*���W?@B$C��7!���`�.X?@�\�t\�9!��P\�\�\�X?@\Zn�\�9!��\�.4\�Y?@�n��;9!�I-�LZ?@0���h8!�\�\�F��Z?@ ��\�\�5!�\�i� \�[?@�|гY5!���\�(@\\?@7�C4!�}	^\\?@�>;\�2!�%�)\� \\?@ *��\�/!�\'\���\\?@��Hi.!�\�\�\��]?@5&\�\\R-!���c�M^?@��-\�,!���\��_?@��0a,!�#2�\�`?@�;Mf�-!�L�\���`?@PQ�+�/!��-��`?@ʣaQ1!�p��1=a?@衶\r3!�ʉvRb?@7�C4!�\n�2�&c?@��\�36!��D�e\�c?@��O;!��1v\�Kd?@�[Ɏ=!�y7R�d?@#�Ƥ?!�����\�e?@ʣaQA!��e��g?@\��\"�\�B!�^/M\�h?@LnYC!�\�zMj?@y;\�i�C!�t\�\�\�j?@��~�C!�u=\�u\�k?@�d�P3D!�:�6m?@\�w\�-;D!�D�|�n?@\�ECƣD!�P9&��o?@d���\�D!�˜.��q?@0du�\�D!��,\n�(r?@%$\�6�D!����\�r?@�\�\\\�E!�\�.�u�s?@�\�7��D!��\�\��t?@)=\�K�E!�\�u6\�u?@\�\�wF!�-!�lv?@t��oH!���V�cw?@,J	��J!��yUg�x?@H7¢\"N!���M+y?@є�~PO!��a�\'\�y?@�P\�Q!��g?RDz?@��\�i2S!�|�ڥ\r{?@�]J]2V!�|E�^\�{?@,���X!�\�ŉ�v|?@毐�Z!�\�I�}?@\�\�\�V]!�\�\��I\'~?@}\�O9^!�\��0{\�~?@l\�\��^!��\�\r�?@\�n-�\�`!�\�ECƣ�?@\�\�W�_!�\'0�ց?@����g]!�˻\��?@��|	\\!�\�~�dń?@���#*\\!��	�s\r�?@+hZbe\\!�;�\�u�?@�\�)\\!�l#�?@�&OYM_!��\�9�?@�)��%`!��\�.Q��?@�Z�kBb!�|,}肎?@^�\��d!�P\�I\�5�?@���E\�f!�!sePm�?@�e�Ii!����?@(�Ik!��5Y��?@\��\��m!��q\Z�\n�?@�Uס�r!�r3܀�?@\�&jinu!��)\0\�3�?@΋_\�x!�\"6X8I�?@&�fe{!�e8�π�?@\�1˞~!�kծ	i�?@E�*k��!�46<�?@�k�ȅ!�;��?@�q�&�!�5\�($��?@n\�\�)�!���.�?@2*A�!���i��?@��\�}��!�S�1�#�?@�@��_�!�עh[�?@\�س\�2�!�\����P�?@\�\�j+��!�0�����?@(\�x�ߢ!�\0���?@]��m�!�&�fe�?@<O<g�!�h[\�:\�?@\�#�G�!���`�?@�::�F�!�T\�\� �?@\�|\�ݮ�!����\�(�?@B\�\�\�D�!�\�)9\'��?@�>���!�A����?@�Co��!�/�\�\�?@�.�!��\"1\�?@���Z�!�\�k���?@�\�o\n+�!��\�Pj/�?@zPP�V�!�-AF@��?@*\�\�g\\�!�\�\��q��?@u\0\�]�\�!�\�\�2���?@���cZ\�!�4�9A��?@8M�p\�!�\�8��\0�?@\�º�\�\�!��fHū?@\�3�\�X\�!����?@�\�p��\�!�]\�\���?@�_x%\�\�!�D�|��?@\�\�\�9\�!�p�x��?@+�\�]�\�!��+J	��?@�\�F��\�!��M\�g�?@d\�C\�\�!�-z��?@�F�\�!�\�5\"�?@|�ԗ�\�!��5C��?@�\�K\�!��4f�?@\�%\�\�\�!�1\'h�û?@t�Lh�\�!�\ne\�\�k�?@t�//�\�!�\�/\�\r۾?@R�\�!��T����?@U�-��\�!��N\�P\��?@�\�\�\�!�M�\rO\�?@\�\�*�C\�!��qR��\�?@!���3\�!�YO��\�?@}?5^�\�!��_w��\�?@P5z5@\�!�x�7N\n\�?@[?�g\�\�!�)\�\'�$\�?@c\�ZB>\�!�z\�蹅\�?@�\�Ӝ�\�!�cFx{\�?@I+���\�!� \��X\�?@ƨk\�}\�!�am���\�?@z6�>W\�!�7�\',�\�?@xADj\�\�!�n�\�t\�\�?@5~\�$\�!�q9^�\�\�?@��^�2\�!�:�\Z\�?@�|\�.P\�!�T�n.�\�?@�3�\�k\�!�b�\�4\�\�?@N\�\�\�!�Ec\�\�l\�?@0�&\�!��\�Y�N\�?@�y�\�w\�!�E��b�?@���+�\�!��X\0�?@�\n)?�\�!���Hi�?@ޯ|�\�!���i���?@�\��r�\�!��cyW=�?@\Z�[ A\�!�\�0\'h�\�?@�t\"�\�!�Զa\�?@�$\��}�!�*�~��\�?@hx�\��!�\�\��\�?@�\��w�!�W\�f�\�?@�\\�&��!�\n���?@��\�jd�!�\�\r0��?@#�W<�\0\"�T\�{F\"�?@I�p\"��\�)�?@\��\�e�\"�ལƄ�?@[rP\n\"�tѐ�(�?@ڎ���\"�7\�Nx	�?@ʈ@�\"�\�cw���?@@�5_\r\"�\�?�&M�?@\�\Z��\"�\�$���?@\�5\�Ko\"�üǙ&�?@\�S\0�g\"�`�\�s�?@�ĬC\"�\n�5��?@F�̱�\"�MHk:�?@%\�j�\"�VfJ\�o�?@1C\� \"�\�%�\�:�?@Ad�&\�\"��F��?@^c��\�\Z\"���?�:�?@\�\�vhX\"�\�&1��?@} y\�P\"�=a���?@u\�\"�\�p;4,�?@Ec\�\�l\"�>+N��?@��\�:8 \"��Ǚ&l�?@�\�-\�|!\"�\�\�0�?@��\�\�}\"\"�S\"�?@\�d\�VA$\"��|[�T�?@bi\�G5$\"�\�S�4�@@x\'�#\"�\�e6@@�B�l\"��\\p@@�\�y�]\Z\"�,\�S\�@@Y0�GQ\"�[�D�A\n@@��\�r�\"�=+i\�7@@�\�F��\"�v�և�@@8�Q��\"�\�\'�@@~�u\�r\"�<p\��@@�\�\�W\"�(\r5\nI@@8��L�\"�(�8\'@@�4\�($)\"��\0�S�@@\�c> \�)\"�L8�@@ѮB\�O*\"��2\�FY@@ʌ��^+\"�\'��n@@�ao,\"�I�H�@@�A$C�-\"�ծ	i�@@\�/\�\r\�.\"�\�kA\�@@L\��1\"��\�\�m@@\�R���2\"�\�[\��b@@��\n�H4\"�(-\\Va@@k{��5\"�9\rQ�?@@�\�\�\�=7\"�uʣ@@kF��8\"�\��k\�@@���\�:\"�\�\�w�\�@@\0\�\�\�Q;\"��\�@@*\�#��<\"�5c\�tv@@�\�D\�@\"����@@w0b�\0B\"�f\����@@5\r�\�D\"�\�R�@@(�N>E\"�٘\��@@\���\�F\"�i\��@@��!6XH\"�@4�\�@@rjg�\�J\"�\�;F@@!\�>\0�M\"�$a\�N\"@@\n\�\��IO\"��\�3K@@:<��\�P\"��P29�@@&\Z�\�)T\"��\�#�@@N\��1�U\"�\"S>U@@hz��LW\"��}V�)@@\�\�z�VX\"�ʍ\"k\r@@�����Y\"��I��	@@�Fw;[\"�\�>9\n@@(����\\\"�\��R\�@@�h\�^\"��`���@@u��\�`\"�75\�|@@ \��a\"��1\�%@@ٯ;\�yb\"���u\�@@` ��c\"����@@Ll>�\re\"�\�WXp@@\�*�\�pf\"���L�N@@�kBZch\"����QI@@\\<�\��j\"��ƠB@@m\06 Bl\"��X�\�+@@��@�n\"���C�R@@\�3�ތr\"�\Z����@@�VBwIt\"�g\��\�@@VG�tv\"��Un2@@���Ssy\"�Ͻ�K@@�͍\�	{\"���\nG�@@��\�\�|\"��\�R��@@u\�\�p~\"�d\�b\�@@4w�\�\"����&@@\�9\�}\�\"��|гY@@�$>w��\"�8�k��@@$\rnk�\"�|�&\Z@@\�\0l@��\"��H��Q@@��t���\"�Mg\'��@@�]\�\Z�\"�c섗\�@@�J�8�\"�\�\�@@��pY��\"�Lk\�\�^@@��\rګ�\"��-�v�@@��};�\"�\�y7@@\0�vi�\"�v\�1<@@4�\�<�\"��E`�o@@:W���\"��)\�@@������\"�\�\�&�@@�\�{�\�\"�g��e@@*�~��\"�\�\r���@@E��f֚\"��?\Z@@�,AF@�\"�9\�Z��\Z@@����G�\"�s�4�\Z@@\\\�3\�?�\"�����\�\Z@@\"\�\�T2�\"��kC\�8@@dY0�G�\"�X\0S@@ ����\"�mW\�e@@����l�\"�\�V*�@@�0\����\"��/K;5@@\�]����\"�\�\�t@@\�\�Aȧ\"�\�!\�Q@@3�<Fy�\"��$\��}@@�7�̯\"�K?�a@@�����\"�\"S>U@@��/��\"�?�nJ@@1[�*½\"�yY|@@\�\�\���\"��(\\�\�@@�S:X��\"�\�\\ @@o\rl�`�\"���\�Z� @@�d73\�\"�\�+e\� @@((E+�\�\"�]5\�� @@\�)��\�\"�9��U!@@�_��\�\"�\nIf�!@@0��!\�\"�l��� @@`��\�\"�\�\riT\� @@�?\�\�\"��_\�\� @@���\�\"�\"�D� @@��\�|\�\"�\�9� @@ޒ��\�\"�J��%� @@\�Đ�L\�\"����\� @@w��\\�\�\"��GT� @@�Ss��\�\"��Y2\� @@\�\0d\�\�\"�\�@-!@@\��\�Đ\�\"�tb\�c!@@&\�\�\'d\�\"�~T\�~!@@8��̒\�\"��	ܺ�!@@ZJ��P\�\"�\�v/�\�!@@�.Ȗ\�\"��F;n�!@@od��\�\"�?S�[\"@@z6�>W\�\"�3���\"@@�2W\�\"����!@@\�캷\"�\"��\�C�X!@@����\"�\"T�\�!@@�����\"�Z�$�9!@@\�\����\"�HP�s!@@��;3��\"�M�\�Ӏ!@@Q�f��\"����!@@��+d��\"�+\�MF�!@@�w��##�\�r.\�!@@\�\�\0��#�P�<�\"@@I�F�q#�?5^�I\"@@(\'\�UH	#�&�<Y\"@@؜�g\n#���2p\"@@�\\S �#���T�\"@@8�k��\r#�qqTn�\"@@$}ZE#� \nfL�\"@@[�\�\�#�@�C\�\"@@Hqh#�\�\�C�\"@@P\�\"�#�F{��#@@=֌r#��l\�)#@@��u\�\�#��S�D#@@y�ѩ#�7߈\�Y#@@\n�2#�n½2o#@@���#�p�h��#@@�\�.� #�2;�\�#@@��K��##�\�\�\�$@@�x?n�$#�\"R\�.$@@d:tz\�%#�kc섗$@@\�\�e�O\'#��Z�\�$@@��\�(#�]�\�%@@F\�@)#�3m�\�J%@@�\�\�O*#��p\�i%@@\�c\"�\�,#��Zd%@@M\��..#�S�Z�%@@\�<00#�s\��\'@@�-X�8#�įX\�E(@@\�p\�Ws8#�h+�m(@@��^�s9#��(���(@@W�9\�m:#�%<�ן(@@�ο]�;#���v�\�(@@�R	O\�=#�r5�+-)@@Yj�\�h?#�\Z�d)@@k\�SUh@#��G�C�)@@\�I}Y\�A#�I�V\�)@@��\�\�B#�\�N�j*@@�L�\��D#��\�ֈ`*@@<���	F#�e\����*@@q�::�F#�4\��\��*@@\n��$>G#��1�Mc+@@� �\�=H#���ZӼ+@@\�+e\�H#�\�+,�,@@��lXSI#��c\\qq,@@/�h�J#�Iط��,@@L���jK#���7/N,@@\�\�\��M#�\�;��J,@@�\�\���N#�\�&1�,@@�X�\�+Q#��\��\�-@@bhur�R#��ܶ\�Q-@@_9\��S#�O\�\\-@@�J?\�\�V#�\��G�C-@@���AX#�*\�T-@@=�1XY#�8��+\�,@@�cϞ[#�S�u8�,@@\�g@�]#�Sͬ�,@@���/�^#�\���+@@1�闈o#����+@@}˜.�q#�\�i\��+@@\�C�r#�*6\�u\�+@@�\�\�s#�2Ƈ\�+@@�\��\�t#�.\�\�e�+@@�V횐v#�9��\�,@@���\�x#�&7��5,@@�\�%\�y#��\'I\�L,@@ߦ?��z#��\�d,@@x\�W�f|#�w����,@@,�z��}#���i��+@@�ؘ\�#�.�_x%+@@hX��\�~#���vۅ*@@\�\�1~#�����)@@,\�F<\�}#��1zn)@@j����}#�\�`ũ\�(@@�\�3�~#��\��/(@@\�l\�?3�#�\�t=\�u\'@@�\� �r�#�=�\'@@ \�E\ne�#�Ƨ\0\�&@@��\�!�#�:\�ؗl&@@\��S㥃#�\�M~�N&@@(�r�#�nnLOX&@@\�\����#��3��&@@�s\n�#�\'�%\�\�%@@��66�#�Kw\�ِ%@@\�\Z���#���X%@@\�\�m4��#�\Z�e3�$@@��W\��#��*$@@A���#�x�a��#@@\�\�\r�#�dZ�\��\"@@$\�F�#����\"@@��Z�#�\�\�.�u!@@\�8b->�#� C\�*!@@\nj�֕#�-	PS\� @@k*�#��\�ǵ� @@S���җ#�*:�\� @@�����#�g,�\�N @@\�?�Ŋ�#�\�\�\�O�@@\n�(z\��#�\�}9�@@X}w�#�Y���t@@\�l\�%��#�\��V	@@�\�(��#��릔\�@@�쿞#�\Z\�1˞@@�FZ*o�#�U\�z�@@\�.Q�5�#�k�\�t@@�bFx{�#�\'.\�+@@NCT\�Ϡ#�E�^Ӄ@@\�c\"��#�#�GG@@v��#��\��*�@@i��֦�#�P\�I\�5@@D���@�#����5�\Z@@M�J\�#��t�(%\Z@@��9�#���ᔹ@@\'\�UH��#��ƠB@@�|%��#�\�熦\�@@3�}ƅ�#��\��o^@@E,b\�a�#�\r\�o�@@��ek�#�\�nI\�@@62;��#�EKO\�@@�&\"\�#�\�>\�\�@@����q�#��@�t@@�Or�M�#��{h@@A�Ρ�#��G��\n@@����#�	2*@@z4Փ��#�4�27@@�*���#�\�\�V\�/@@o�;2V�#�\�O\�\�@@_%��#�+mq�\�@@�\�<+i�#��\�z�2@@\�n�ڿ#��6\�Nx@@\�\�OV\�#�c+hZb@@�S:X�\�#���CR@@�@.q\�\�#��k���@@���\�#�pxADj@@\�\�\n~\�#��L�n@@*�n�E\�#�%�\�\�@@�ީ�{\�#����S�@@x�\�\�#��$\�pt@@�?�ϝ\�#��gx�@@\�\r�0�\�#�A~6r\�@@S\�q�\�#�˞6\�@@4�Y��\�#�\�&p\�@@	S�K\�\�#�E|V@@��\�\Z\�\�#���q\�\�@@Ͻ�K�\�#�7n1?@@�s(CU\�#��\�\�а@@]���2\�#�\�=��j@@&����\�#��\�3K@@�C6�.\�#�p]1#�@@\�\�#�\�#�np��@@�\�\��\�#�A�\�ǘ@@\�\��T\�#�\�б@@t\\�\�J\�#�\�\�_Z\�@@lMK�\�#�[�\�\�@@�Ϲ\�\�#��/g�@@���b(\�#���K��@@\�C�|\�#�\��\�\�\�@@\����\�#�\�\�l#@@s�=A\�#�ڒUn@@�4~\�\�#���a@@H\Z\�\�\�#�`\�eM,@@0\�\�Z\n�#�)x\n�R@@�\�\�&\��#����N\�@@p\���#����\Zh@@��\�\��#�����\'@@��!�\��#�\�c\�\�@@�y\Z0H�#�c{-\�@@L8���#���|�\�@@~�{�\��#�\�|��\�@@�1=a��#�K�!q�@@幾$�-�s�@@\�\��E$���ݒ@@��\'�$��b(\'\�@@�\'\�\�$�\�/o�@@P6\�\n$�rݔ�Z@@\�rJ_$����[@@Q0c\n\�$�\0VG�t@@a\�\�+e	$�Tq\��\r@@}\\*\�	$���tw�\r@@VE�ɨ\n$�F\�@\r@@4�\�k\�\n$��4��@@Ku/$�mscz\�@@�U��$�.\���@@�g�\�s\r$���Hi@@�W\�$�\\9{g�@@�\�\�V\�$�x\�q@@3��($��|]��\n@@�\�\\\��$�M֨�\n@@\�!\�\�T$�e\ZM.\n@@\r4�s�$�\�\�\�	@@\�ξ� $���b�d	@@ձJ\�$�9B�\�@@m8,\r�$���7�@@O\�\\\�$���5�\�@@�\0U\�$��ӂ}@@{/�h�$�M�n@@��f\�$�t_\�lW@@�����$����\�@@S\"�^$�Y�\���@@h[\�:$��x\\T�@@&7��$��ʢ��@@@�\�߼ $� y\�P�@@X7\�#$�.rOWw@@+j0%$�I0\�\�Z@@�Q}&$�U�W@@\�\�fG�\'$�\�MbX@@y��\�($�\�q�t�@@���=\�($�Gw;S@@�=	l\�)$�\�\�\�*\�@@\'JB\"m+$�I��Z�\0@@&4I,)/$���T[\0@@>v()0$�\�=��j\0@@��Ϲ3$��ތ��\0@@��Or�5$�\"�D�\0@@��\�h\07$�Gv�e�\0@@�\�\riT8$�\Z1�\�c\0@@b.\�9$�Ve\���?@�y9\�;$�v�;O<�?@�\�,>$��0DN_�?@eÚʢ@$�=)�\Z\0@@w�*B$�\�F<\�\�\0@@�q6D$�4-�2\Z@@�\�g\��D$�M�7�Q@@���1\�F$�n\�\�S@@�\�Q\�I$�\�\�\�\�l@@z�Cn�K$�@�\�\�v@@���\�qN$���O�m@@�\���\�P$�\�\rx\'@@�\�3KT$�\�G5\��\0@@غ\��T$��\�ډ\0@@�\�+��X$����z\0@@��\�J[$��i�{�\0@@;�O\0]$�����\�\0@@��\��^$��x\�@@�\��;�_$�C��3@@���b$�#\�#\�@@@�\�\�d$�8>[@@o�EE�f$�\0{�\0@@M֨�h$���f\�\0@@����=k$�\���c�\0@@\�vL\�m$���\�ם\0@@8-x\�Wp$�\���}\0@@��`r$�5�;�\0@@�+.�\�u$�Q��C�\0@@�s�Lx$��U���?@\�?�&M{$��:�/K�?@��\�:T{$�\�%\�\��?@�D��y$���S�?@\�x�Jxz$�o�����?@�N@a{$�y\�z\�L�?@�f�v�|$�v�U��?@�\�\�~$�!����?@(�\�{\�$�E�����?@�L�\�ŀ$��Գ ��?@���\��$���&���?@����)�$�5_%��?@Q�H�$�\�ͨ��?@���*È$�\�\�\�y7�?@\0Q���$�)=\�K��?@��~�$�\�G5\���?@�£��$�\� !\��?@Q�_��$�jl���?@#���S�$�\�\�b�?@\�\�\�=�$�!��q4�?@7n1?7�$�A\�S���?@W[��\�$�Á�,`�?@�4\'/2�$�uYLl>�?@�A\��v�$�]QJV�?@��)t^�$��[Z\r��?@\�($�՛$�x�\'-\\�?@�\� >��$��\�\�\�\�\�?@h!�˛$�\�\��r-\�?@��x軛$��Ac&\�?@Ҫ�t��$���\'�.\�?@�5\�e��$�g�\\S \�?@�\�D2�$��\�\�?@\�o	�?�$�r�z�f\�?@�����$����\�\�?@���H�$�Z\��c\�?@dyW=`�$�3\��O\�?@�\"1A\r�$��X�|\�?@\�^\��$���1\�\�?@��>�$��a�\�?@s.\�Ue�$�aTR\'�\�?@\�A\�L��$�x\�\�!\�?@oe�\�2�$�\�8�\�\�?@{2�蛴$�\�\�w\�?@ͫ:��$�=,Ԛ\�\�?@H��|��$�ҫJC\�?@\�\���$�\�\�h��\�?@���\�t�$���0(\�\�?@�\�Xl�\�$�\0�M�\�\�?@\�g\�\�`\�$�Kw\�ِ\�?@�Z	\�%\�$���{h\�?@sh�\�|\�$�vQ��\�?@a�\n�+\�$��qS\�\�?@�\�w�\�$�\�x�\�n\�?@�HJz\�$�rjg�\�\�?@vk�\�\�$���\�\�\�?@Z*oG8\�$�\�\�\�O\�?@�\�r��\�$�w-!�\�?@\�ȑ\��\�$��&7�\�?@�b��\�$�Zd;\�\�?@�W zR\�$��ǚ�\�?@�	MK\�$�C,cC\�?@��	ܺ\�$�\�M�q\Z\�?@\'K��\�$��8�*\�?@�\r܁:\�$�	ȳ\�\�?@�\�a�\�\�$�����\�\�?@�\�HK\�\�$�\�rK�\�?@~�\�!\�$��\�{\�\�\�?@\�\�O\�s\�$�\�z�ю\�?@2t\��$�X9�\�\�?@S\"�^F�$���^\�?@�s~�\��$�s�69\�?@4J��%�$�\�%\�2�\�?@��V|C�$�oG8-x�?@F\�\�\�\��$���쟿?@{��\��$�`\�\�VϽ?@\�`ũ\��$�\"5\�b��?@�հ\��$�\�AA)Z�?@\���,A�$�� =E�?@9{\�\��$�A�v�?@)\�^\��$�s�,&6�?@\�u�B�$���z�?@֍wG�$��jI�?@&S�%�ڭe2�?@#-��#%���H��?@jkD0%�/�Ͳ?@ē\�\�\�%�\n���1�?@R<��%�L⬈��?@�\�\�E%�����ۯ?@g��%�r4GV~�?@IK\�\�%�<�$��?@cz\�%�\�k]j��?@�\�&N\�%�B#ظ��?@�+g\�%�O崧\�?@\r����\r%��i\�L�?@U3k) \r%�+i\�7�?@D1y\�%�?S�[�?@t�3�%�	2*�?@����A%�J	��z�?@��oa\�%����ผ?@\�?�Ŋ%��i3NC�?@]�\�%�m;m��?@�B\��%�\�%\�/�?@\��\�%�V\�1��?@�a�\'\�%�����\�?@R~R\�%�ZEh\�?@L���H%�F�\r2ɐ?@G\�g\�u#%�\���W�?@��f�#%�Swe�?@w1\�t�#%�\��p��?@�Ŋ\ZL#%�&\�\�\'�?@��\�\�\"%����\�?@�E�\r2!%��P�v0�?@��\� %�\�\0OZ�?@`\"\�:�%�6Z�P�?@�h�\'�%�\�-\�熆?@v()� %��\�E\n�?@\�Ko.\"%��Z�\Z��?@G\�\��%%�`�EЂ?@u \�\�\'%���jGq�?@H\�\�\�\\)%�.9\��?@V�a�*%�	�L�n�?@�F\�\�+%��g͏��?@7��\�N,%���@�\�?@\�e6,%��\'�XQ?@.\�R�,%�e�P3�~?@\�rJ@L*%�p(|�~?@)\"\�*\�(%�\�\�\�;�}?@����\�\'%�AI�0}?@z\�蹅&%��2\�\�|?@;\��\�R%%�H6W\�s|?@\�!S>$%�Q���|?@GtϺF#%��\�\�\�={?@�d73\"%���Ma�z?@����!%����\�#z?@���5[!%�P\�Ry?@�C�\�\� %�	kc\�w?@9\�\�%�.\�|��v?@@OI%�D�l\��u?@�}i%�I\�\�\�*u?@U�	g�%�\�\Z��s?@b�*\�3\"%�\�\��!s?@�\�\"M�#%�/O\�Rr?@��f��%%��W�Lp?@Z��*%��+f�o?@�\�\�\�+%���\�C\�n?@\�5=((-%�L5��n?@z�I|.%�_Ӄ�Rl?@ip[[0%��\rk*k?@	À%W1%����5?j?@i\�\�i�1%�v4��h?@\�\�4�\�2%�\�\n(\�g?@�Fw;3%�F{��g?@�?mT�3%����u�e?@Y\�d:4%�\�6��c?@2\�g@5%��a?@\�\�fG�7%�^\�pX\Z`?@��JY�8%�\�u��X_?@�6\09%��n��]?@�	g��9%�r\�_![?@\��3�I:%�T�D\�[Z?@�ꭁ�:%�UK:\��X?@�p=\n\�;%��yVҊW?@>�\r\�<%�d��ST?@�7N\n�>%�cG\�P�S?@�>W[�?%�GW\�\�:S?@\�ZH�@%��S?@E�<�D%��+�j�S?@�#��E%����T?@�x$^�F%�\�\�̯\�T?@d;\�O�G%�[��dU?@Ḍ�\ZH%�sePmpV?@6v�\�I%�t\��\�\�V?@_A��hJ%�5�\�a0W?@���\�K%����DW?@\�v�>XN%�t\�\�U?@�O%�V\�\�\�4U?@3o\�u�N%��\�\��gS?@���M%�;U�g$R?@\�f��M%�Tt$��P?@mp\"��M%�\0֪]O?@�v�k�N%�[\�:\��N?@��\�\�O%�\"\�{�N?@<�(AQ%�y:W�N?@�\��S%�\�[X7\�M?@\\U�]T%�\�f��M?@�\\�C�U%�Q�5�UN?@\���i�Z%����\��N?@\�2R\�\\%��TQ�\�N?@��n\�!^%�;�� \�N?@�\�\�M_%���\�?�N?@�\� �r`%��uŌ�N?@�4F\�b%��o\�O?@j�{�\�g%��Z\'.\�O?@���i%�c\�tv2P?@�[\�Jj%�\�\�|@�O?@3�ٲl%�w��\\�N?@�(	��m%��R\�qL?@\�Д�~p%�R�K?@\Z���q%�\�7��\�J?@2t\�r%�#K\�X\�I?@�z��s%��)\� \�H?@\n+TTu%�� �\�=H?@J�O\�cv%�\�8�j�G?@���Vw%�f��OG?@��9�x%��jGq�F?@�k{�%y%�g\��\�E?@�m\�\�y%��\�0\�E?@\�dq��y%�\���D?@�\�\rx%��0�D?@��-v%��\�{\�_C?@�|^�\�s%��@-C?@�Y2\�r%�I�5CB?@��\�p%���K��A?@�z��n%��Ǚ&l??@�\��o%��!9��=?@C�+r%�:�6U�<?@\0\Z�K�r%��\��<?@t\�%zs%�\�1\�3/;?@\�Z�\0ms%�&p\�n�:?@oe�\�2s%�Sy;\�i9?@Na���r%�\�9?\�q8?@�����q%�t�?Pn7?@=c_��p%�_\�D�6?@�1%�p%�\�\�\�m6?@\�!p$p%�I�V\�3?@\�$\\\�#p%�\�v��\Z3?@��\�p%��^Cp\\2?@�\�\�c>p%���)1?@;�q%�-\'��0?@S��q%�;s	\�/?@��b(\'r%�Ւ�r0/?@\�\�\Z��r%�j1x�.?@{k`�s%�\��\�\�\�-?@�\�>V�s%�6\�\�x\",?@��k&\�t%��K�;�+?@�P��9u%�����y*?@;\�O��v%��r�\�{)?@\�\�P1\�w%�ɏ�k(?@77�\',y%�\�\�q\�\'?@*1	z%�S\�\'�\�&?@����{%�Gsd\�%?@qX\Z�Q}%�2�F�$?@CV�z~%��\��v#?@Gsd\�%�/l\�V^\"?@AG�Zҁ%�����\�!?@�i�쀃%��9��!?@\��\�%���q\�\�!?@obHN&�%����\��!?@Z�rL�%�I-�L\"?@�2��\r�%�CqǛ�\"?@�Nt�%�PQ�+�#?@FCƣT�%��\����$?@C�׼��%�\'3\�Vz%?@�3�\�k�%�yt#,*&?@�̒\05�%��\�g��&?@6\�Ko�%��\�\�&?@�֥F\�%�\�e���&?@S��:�%�˟o�&?@3�}ƅ�%�\�e���&?@\\�-\�ו%��\��\'?@\�,{�%��=~o\'?@��4F\�%�7l[�\�(?@�1\�Й%���7h�*?@�\�\��%�f�YJ�+?@V\r\�\�\�%�ĵ\�\�^,?@\�y��%�Dio��-?@���祒%�iT\�d/?@\��/�%�o\�0?@��\�镒%��0�*1?@뭁��%�)%�\�1?@y�\�n��%���\�҇2?@N_\�\�,�%�\�&p\�2?@��\��%�[\�7\�q3?@�/�^|�%���\�\�3?@��\'��%��\�\�t4?@p?\���%��\�\�c>4?@��̒\0�%���r0�4?@Lk\�؞%�@M-[\�3?@h%����%���\�V3?@\r�\�\n�%�]�\�1?@\�6�h��%�%vmo�0?@f��Ӥ%�\�y\�9[0?@�s\�ᒣ%�`���\�/?@I�p�%��}q�J/?@�t�i��%��+J	�.?@�����%�j\�0\n.?@�v�ӂ�%���zO\�,?@ٲ|]��%�F�̱�+?@P4`��%�[��d)?@\�x\"��%���\\�(?@<P�<��%�\n��$>\'?@$Di�%��\�@-&?@Zc\�	��%�rn\�%?@\Z�K���%��1�#%?@1&���%��;�$?@����_�%���A�&?@\�\�U���%�N\r4�s\'?@�1%��%��\�a(?@��q���%�8�Q��)?@�u���%�\�\�I�?*?@\�;�%��7N\n�*?@`\"\�:��%�U2\0Tq+?@�>W[��%��eN�\�,?@�T�-��%�F#�W<-?@EeÚʺ%�M0�k�-?@t~�\���%���\�-?@9�Z\�%�;�.?@�c!:�%��n\�!�-?@81$\'�%�(�\�+?@\�\�(�[\�%���o��*?@\�;p\�\�%�ɯb�)?@��Hi\�%�L\��)?@\�[\��b\�%��&�(?@!\�K�\�%��ʾ+�\'?@�-X�\�%�\�@-\'?@�^��\�%�>\�^��&?@�\�\�\'\�%�%Z�x&?@�f��}\�%�=_�\\6&?@\�E\ne\�\�%�\�U+~%?@%��r\�%�wI�Q#?@\�9x&4\�%�oEb�\Z\"?@M,�\�\�%���f�!?@\�	L�u\�%�|��l;!?@狽_\�%�f-��?@�\04J�\�%�9GW?@S[\� �\�%� ����?@毐�\�%�!\�X4�?@!�˛\�%�#�k$?@\rR�\�%�3\�뤾?@K�8��\�%��5Φ#?@F\�T�=\�%��$y�?@J���\�%�v\��ť\Z?@!���3\�%�ݗ3\�\Z?@\�\�)�\�\�%��ʆ5�?@����\�%��\�{L?@�\�\�\�%�c��\�?@֪]\�%��\Z\�\0l?@׈`\\\�%�ZKi�?@�]\�\Z\�%�\�V�\�?@�\�R��\�%���h:;?@���\�%�?\�\�\�2?@7�7M�\�%�@�:s?@ٰ��(\�%�i�\�Q\�?@����\�\�%�7n1?7?@C\�up\�%�S	O\��?@\�,\�i�\�%�\�K�\'?@og_y�\�%�]5\��?@�^\n�\�%���+d?@V\�\�\�\�%�s�\�{�?@~7ݲC\�%���\�\�X?@���\�%�(\�4�?@,cC7\�%�]3�f�?@�}q�J\�%�=�|\�\�?@\�\���\�%��\�\�&\�?@���);\�%�!\�\�	L?@�GG�\�%��{�ڥ	?@pz\�\�\�%��$���?@�.��\�%�n\����?@���&�\�%�Y��L/?@�>��\�%��F�?@JV\�\�\�%����j?@��ȯ\�%�3o\�u�?@_D\�1u\�%��\�d\�\�?@�և�F\�%�\�ɧ?@\�n�\�\�%��\�bE\r?@}���\�%�\�w~Q�?@*V\r\�\�\�%�;%�?@&8��\�\�%�N�W\�?@�b�dU\�%�b0�\�?@U�g$B\�%����?@��Os�\�%��|�?@Ւ�r0\�%�\�xͫ:?@��\��\�%�\�SW?@\0!�\�%���w\�?@6\\�\�%�A�v\0?@���\�%�m�s�p�>@Ę��R\�%�`�\�\��>@#�tu\�\�%��\�vL�>@lMK�\�%��M�\�\��>@\�\�m��\�%�l?\�\��>@G\�I�\�%�pw\�n��>@\�\�m3\�%�	\�Vд�>@��cZ�\�%�\r�{,}�>@�\�S:\�%�D�в\��>@���\�\�%�Ϡ���>@��m�R\�%�aU��N�>@E�ӻx\�%�i�QH2�>@\�(yu��%�\�2\�,%�>@h\�K6�%�s�`��>@�Ǵ6��%��WY\��>@�\����%�}Xo\�\n�>@{M\nJ�%���\�s\��>@\�\'+���%�Y2\���>@���);�%�;�I�>@�\��%�.�\�M\��>@�=�N��%�S%\�\�R�>@9\n\0&��\�K7��>@��a��\0&�!>�\��>@i���\�&�C�Գ �>@B	3m�&��\�o_�>@��A�V&�\�n�o��>@�W\��&�\�9\�\��>@g\�!\�{&�����>@rP\�L\�&�H��0~�>@\�I�U&�>\�D��>@sG�˵&�zVҊo�>@\��ԱJ	&���i�\�>@R\�Q�	&�\�hV�\�>@�ަ?�	&��C6�.\�>@\�W\�\�\�\n&�ߥ\�%\�\�>@�\�\�9&�܂���\�>@鷯\�&�T�^\rP\�>@ ^\�/\�\r&����\�\�>@��հ&�b.�\�n\�>@�\�{\r�&�\�h��\�\�>@\�\�\��&���R�r\�>@\�K\�Ƽ&�\�@�m\�>@w�E&�����+\�>@`�\�\�&���\�\�>@��\�&��\�c�g\�>@�\�u�+&�/O\�\�>@\�\��!o!&��ʿ�W\�>@P6\�\n\�\"&�$)\�ah\�>@┹�F$&�1\����\�>@��\�5$&�O�S\�\�>@�\�\�#&�3P�>\�>@�@gҦ\"&��\�\\��\�>@g*!&�ސFN\�>@DܜJ &�\��w\�>@��2\�&�f\�ikD\�>@;�Y�\�&�g)YN\�>@G�q��&�DN_\�\�\�>@Ü�M&�\�e6\�>@��z\�\"&��{�\�>@O\\�W \Z&�\�wE�\�>@!w�(&��mQf�\�>@3\�\�(%&�n��\�V\�>@�r\�}\�(&��\�BW\"\�>@/m8,\r,&�\�xͫ:\�>@\��/0&��WuV\�>@x���N4&�_&��\�>@��\���7&�ڒUn\�>@��r\�S:&�G\r6u\�>@ޏ\�/�<&���\�\�U\�>@ǡ~�>&�\�\�\�\�\�>@t��o@&�@3�\�\�>@Y\���B&�S	O\��\�>@�\�\'�bD&�\��O@\�>@\�#���E&�\�б�\�>@��\�G&��.��\�>@0J\�_\�I&�0�\'\�>@���\�K&��;k�]\�>@v\Zi��M&�@�߾\�>@c\'��N&�\�<�\�>@9�M�aQ&�\�N^\�>@V�j-T&�\�N\�\�\�>@*U�\�-U&�T8�T�\�>@+Q��rV&�e����\�>@\Z\�\��W&�E7�\�>@-z�m[&����i�>@Q0c\n^&��\\o���>@a�X5`&����>@�\�3g}b&�\\\�3\�?�>@\�\�gyd&�(~��k�>@.\�Ue\�e&���֥F�>@6Y��i&�U�\�7�>@:ZՒn&�X�\�I�>@5�up&���\n\�b�>@�iN^dr&��\�Z�>@仔�dt&�&\�\�\'�>@qqTn�v&��SW>˻>@\�O=\�x&���\�qn�>@\�Vд\�z&�z�,C�>@�~P)|&��7k�>@2!撪}&�b�*\�3�>@\�\�^z&��!9���>@x�ܙ�&��,�\�o�>@�\\��u�&��#\�\�S�>@\�<��@�&���+�,�>@t��o�&��y��̷>@�\�&��6��>@\�N\"¿�&��n�\�o�>@i�&�=\�Ƃ´>@�u�;O�&�\�,\�?�>@o�����&�:vP�\�>@@\�j\��&��>�>@K�P\�&�\�e\�\�@�>@\�ƻ#�&�~��E}�>@e5]Ot�&�:d�w�>@_�sa��&�y�	�5�>@�\�}�&��\�M�\�>@��]P�&�5\�8EG�>@�ŏ1�&�rl=C�>@�����&��\�\�\�/�>@H��|��&���\�\�>@\"�4��&�j\�q���>@%\�\�ڧ&��˷>��>@�\�\�n�&���\�+��>@=�ϥ&�CV��>@,��ص�&�ߥ\�%\�>@`<���&������>@<�ןħ&�\�8)\�{�>@\�hV��&��T3k)�>@N\�&�O�&�B�Ēr�>@4��7��&��Q�>@\�k���&�w��N#�>@��Co�&�\"ĕ�w�>@h���&�\�Nw�x�>@�k�\�&��\�K�>@����&�\r�q7�>@�\�\�#�&�\�c?���>@\�g@��&�p\"����>@�ao\�&�\�9\�\�>@�<ڨ\�&��zk`��>@(~��k\�&�Զa�>@\��\�Fu\�&��\�lɪ�>@\�:�� \�&�1`\�U,�>@�Ӟ�s\�&�G�>@\����T\�&��Z(��>@��\�U\�\�&���Ƅ��>@q�a�\�\�&�\�k���>@�k\ndv\�&�\�٭e�>@\�T���\�&�\r\�n��>@�~\�T�\�&�i㈵��>@؀q\�\�&���(#.�>@ͬ���\�&�ǟ�lX�>@1AG�\�&�\�4�>@�m5\�\�&�w�\�o�>@�	.V\��&�\�w)uɄ>@k\r��\"�&�\�{�七>@�2�&�&䃞͂>@y�\�n��&�gaO;��>@\�jdWZ�&�\�\�-�>@5\nIf��&�M�\���>@GUD\��&�\�zj�\�}>@W\�o�&�&\0��*}>@y?n�|�&�\�O\�s\'|>@\�6�De�&�F	�=z>@\�j��&��k\�\�y>@e����&�Y���\�x>@9\�\�m4\0\'���\�\�~x>@�p̲\'\'�ٰ��(x>@\\\��\'��u��]>@Cr2q�\�&�jj\�Z_>@\�y�tu&�ӄ\�\'c\0>@�\���w&�]��\�l�=@�Z�\Z��&�PVW\�=@�\�\n��&��V\n�\�=@W��\��&�ޓ��Z\�=@Qi\�\�>�&�>w��\�\�=@�L���\�&�u\�Hg`\�=@�o��1\�&�=}��\�=@\�\�U+\�&��8�d�\�=@�\�\�\�&��\�\�B�\�=@#��\�i\�&����\�=@\�Z&\��\�&���|�\�=@ʩ�aj\�&�!�!\�\�\�=@\��QF\\\�&�f2\�g\�=@\�\�h��&�\�*�)\�=@\��mR	&��w�\'-\�=@rP\�L\�&�9�ߡ(\�=@2>\�^�&�G ^\�/\�=@\r�\�\n&�p?\��\�=@֍wG\�&��v\�\�=@���=\�\0&�\�2�g\�=@\�p����%�\��\�o\�=@\�_ѭ�%�i�\�=@Ǽ�8d�%�\��R\�\�=@�D���%�(Hlw\�=@F\�v�%�!撪\�\�=@�\0�w�%�\�m3\�\�=@*���[�%�K<�l\�\�=@\Z����%����\�\�=@\��_ �%��FN�\�=@��n��%��B\�O�\�=@1\�0&�%�?�Ң>\�=@TpxAD�%�e�\�2�\�=@:<��Ө%�\�:��\�=@ףp=\n�%��\�\�\Z�\�=@pD��k�%���\�`�\�=@7m\�i��%�s��/\�\�=@,���%�\�A\�L�\�=@cAaP��%�\�9\�\�\�=@��?N��%���ôo\�=@\�E��(�%�\��\�\�\�=@\�g@��%�\�ǘ��\�=@�\rk*�%�S\"�\�=@:τ&�%�?\��\�=@�\�\�c>�%�(\�\�h�\�=@?q\0��%�����	\�=@(�\�v�%�]�\�$?\�=@b�A\n��%���q�\�\�=@�̕A��%�od��\�=@C�\r��%�_b,\�/\�=@2�\�l�%�\��X\�\�=@A\�\�\�\0�%��4\�\�o\�=@^�}t\�%�%!���\�=@�Ac&�%��*�WY\�=@�D\�Ɵ�%�$\'�\n\�=@*Wx���%�lw\�}�=@U�\�\�B�%�%\�/��=@T�n.��%�i7���=@\�Z_$��%�y7R�=@�8��Մ%�u��.��=@R\�Q��%�O[#�q�=@\�5\�Ѐ%�|�i\���=@\��Po~%����v��=@\r��x�}%�||Bvޮ=@À%W�p%��Q�U�=@.W?6\�o%�\�^fج=@�YO�n%��\�}�=@�PoFm%�C\�K�=@�o\�\Zl%�\��r-Z�=@jL���j%�\�	F��=@�2\�Fi%�\�\�v��=@��\��h%�C�\r��=@:�6U�h%�N��;P�=@���,\'i%����-��=@a��Mi%�{נ/��=@\�ۻ}i%�#�	��=@\�(yu�i%�|���=@\�\�\�/�i%��ܶ\�=@\�c> \�i%�͐*�W�=@T�\�j%��Y�b+�=@7m\�i�j%��\�����=@\���7k%��p\�=@�\��>l%�r�\�7�=@���m%�\�Ԗ:ȗ=@,I�\��p%�_a����=@`���fs%����Or�=@3�ٲt%�ǟ�lX�=@uv28Jv%�k���#�=@\�\�H��w%�\n�\���=@%�c\\qy%�������=@X7\�{%�#�	��=@,\�\�f*|%�Z�\��Z�=@*�TPQ}%�cB\�%U�=@��! %�N\�&�O�=@��;��%�F�Sw�=@=|�(B�%��YJ���=@6Φ#��%�v\�~k�=@�ZӼ\�%�73�\�p�=@��\�ׅ%�\��fH�=@��\���%�rm�\�=@b1\�Z{�%���\�ާ�=@f-���%���C�=@��\\\Z��%�P\�2�ˆ=@\�\��!o�%�$\�F�=@\��\��%�(�����=@1\�q�	�%�\�,%\�I�=@�\��<��%�2�\�̃=@\�\\T�%��\�3��=@�����%�I-�LN�=@^�\��%�ѕT��=@{\�\"0֏%�\�\�\�\�\�=@�䠄�%�iƢ\�=@\�ZD�%�\�g\�u��=@t��%�%�⏢\�\�=@\�\��%�%�Kr��&=@\r�R	�%�l�\�~=@��>s֗%�n\�\�S~=@\Z�[ A�%�\0Sh}=@\0\�C���%��5C�|=@RcB\�%�%�/o\�j{=@w-!��%�s+�\�Xz=@�1\�%�g��ey=@�T\Z��%�ӡ\��nx=@-��吏%�S\�Q�w=@�Q���%�\���}v=@�X�\�+�%�5�؀t=@�`8\�0�%�\�!��\�q=@]\��զ%�\�\�7\�p=@�\��5\"�%��\�\�_Zp=@\�qs*�%���\�o=@�\\4d<�%��\r�o=@-\�\�a�%��P�v0n=@��c${�%���il�m=@\�˙\�\n�%�|��m=@K<�lʭ%�o���l=@P�mp�%����w�k=@�f�\�6�%�\�!\�kj=@ޑ�\���%��[1\�i=@��\�P�%��jIGi=@q=\nף�%�\�:]�g=@�8�ṯ%�B��	\�f=@��-=��%�\�{c\0f=@�\�\�ɳ%��	�i�d=@Ή=���%�֫\�\�d=@\�ahur�%�\�7\�q\�c=@\0R�8��%�\�bԵ�b=@	l\��3�%��i>\"b=@78�ں%�\�S�4�a=@�\�!ƻ%��X�\�+a=@�N�\�\�%����`=@V�)���%�YM\�]_=@獓¼�%��̔\�\�^=@3�&c�%�\0���!^=@��۞ �%��\0Ϡ]=@M\�\�u�%�dx\�g�\\=@\�\�\�\\Q\�%�h\�ej\\=@MK��\�%�7\0!f=@gc%\�Y\�%��4`��e=@\n/��\�%�\���\�e=@Eb�\Z�\�%��	��e=@�/�\n�%�L\Z�uTe=@s�69�%�nڌ\�e=@�\�8�%�\�:��c=@`s�	�%�?\ZN��c=@�1\0\��%�\�t��.c=@\�2�g�%�1~\Z�\�c=@\"5\�b�&��\�R��d=@6\�e\�&�fj�!e=@\��\�w\�&�8��\n*f=@n\�(&���0�:i=@;8؛\n&��[\��j=@H¾�D&���\"��k=@�Վ\�\r&�<l\"3l=@]߇��&�u\�Hg`l=@��}&�Zf��l=@\�5w��&��	.V\�l=@/�\�&�\\���l=@辜ٮ&�/N|��l=@�P\�\Z&�X���l=@k�]h�&�79|҉l=@ƥ*mq&�G\�&jm=@���0�2&�%\�?�l=@\�bE\r�1&�fN�\�\�j=@s�\�c\�0&���H��i=@߈\�Y\�0&�\�8)\�{h=@E/�Xn1&�\�,\�i�g=@�R\�h2&�)x\n�f=@\0\Z�K�2&�\�R\\U�e=@�\��\r\�3&��,&�d=@�|]��4&�\�J\n,d=@�b(\'\�5&��(�\�_=@\Z�\'�X1&�R%�S_=@i�-�/&�9a\�hV^=@L8�-&��a��\�\\=@\Z����)&�@KW��\\=@��n(&��\�	h\"\\=@\�S:X\'&�ё\\�CZ=@9�]�&&��\"�4Y=@��Wt\�%&�\�\�!�W=@�J�*&&�]\Z��JV=@1�{�O&&�ș&l?U=@��>U�&&�ѬlS=@���\�%&�Z\�\�Q=@dϞ\�\�$&��۠�[O=@)\�\�=$$&�\�\�5\�K=@L5��\"&�Ւ�r0K=@�\�<�!&�JF\�J=@��$Ί &��~��\�I=@!;oc�&�R\�\��I=@:ZՒ�\Z&��|]��H=@���Q&����\�F=@J)\���&�}\�\�\�E=@��i�:&�n\�\�)C=@\�L0�k&���V\�\�A=@[Υ��&���~m�@=@\�\Z�\��	&�;\�\���@=@�7M�&��^�2\�?=@��f��&�\"nN%?=@\�Ƃ &�\�@׾�>=@�_�\�&����\�<=@N�\��\0&���jQ<=@v�;O<�%�\�mU==@Q�+��%��X��5=@[{�%� ^\�/\�-=@<��\�\�\�%�k�)\0=@s�\�h�\�%��(\�\�=@y\�P��\�%��\�im=@�\�BW\"\�%��\�w�=@��\�\�\'\�%�5B?S�=@�V\n�\�%�U�\�\�B=@гY��\�%�\�1�\�=@�u�|\�\�%�\��o�=@\�tYLl\�%�t	�\�\Z=@ګ��\�%�ZF\�=�=@]�6\�\�\�%���<e=@5\�|\�\�\�%�T\�*�g=@ <�\�%��jJ�=@\�j,a\�%�$(~��=@�oC�\�\�%�\�O\�\� =@\�a�\�%�*T7#=@�\�\�U�\�%�\�4�O$=@\�1!\�\�%�9\��\�$=@��c�M\�%���1=a%=@��\�ǵ\�%��E}�;4=@X8I�Ǵ%�8��+4=@\�\�Sǲ%�s��+4=@i�\�r��%�4�\�H4=@�\�zM�%��\Z�44=@��Q�\�%�4GV~4=@\�\�|@��%�w�(�2=@ܞ �ݥ%��e�YJ2=@&�\"\�d�%�cc^G2=@j4��%��\�Li�1=@R��\�%��\n��1=@\�AB�/�%����2=@�� =E�%�(|�2=@QlMK�%�q\�\�H/2=@i�\�\�%�\0��*Q2=@�B�Գ�%��_?\�3=@\�\�4}�%�\�,\�i�3=@*8� \"�%�\"�\Z�\Z4=@\�\�c�%��\�	K<4=@8�0��%�Ϟ\�\�$4=@C��g�%�\�[��3=@\�\�~���%�h\�$\�3=@ȷw\r��%����Y2=@��o\'�%���]ؚ1=@F\�W\�ǆ%�\�|?1=@cԵ�>�%����I1=@GtϺF�%���Wt\�1=@Z\�>\�-%�T\�qs2=@\�c\"�\�|%������5=@��\�w%�3ı.n7=@�\�0\� u%�ԛQ�U:=@ȔA\�p%���7<=@��vۅn%�I\�\�\�*==@�\�G��m%�H��\n>=@E���l%��;l\"3?=@؜�gBk%��\�\�W@=@��Ơj%�n�r�A=@Wya�h%�\"U��B=@%\�YI+f%�\\�-\�C=@Ϊ\�\�Vd%�){K9_D=@�m�sc%�?�nJE=@\�\�\�+b%�D�AcF=@(\�\�G`%�1XrG=@p\��/_%��u7OI=@�8�*]%��$��K=@����[%�\�&N\�wL=@�.6�Z%��[�vM=@.��\�W%��Ky N=@^\��kV%��\�#\rnO=@c_��`S%�\�d�<\rP=@R,��\ZR%�?:u\�P=@@��w\�P%�q�\�[uQ=@�i\�LO%�$���ER=@�+�`pM%���\�~�S=@\�ʦ\\I%���L�DT=@CY��ZG%��\�?\�@U=@�r�w�@%�e\0�\�\�U=@��pvk9%�B@��\nV=@�E�x7%�\�)\�\�FV=@�\�fc%6%�#�tu\�V=@�o}Xo4%�6\\�-W=@\�#�G3%�\��\�\�Y=@P\�\���1%�u�\�Z=@V�@1%�\�6�[=@r�\�71%�B@��\n^=@v�+.�2%�4.\�^=@|b�*\�3%���t?_=@D�7�4%�R�U�_=@\n����5%���k�`=@\�wak6%��2\�\�`=@����\�7%��W\�2\�a=@A�,_�9%� �\�G�b=@�$\�:%���d=@�\�f�:%�\��\�˚d=@\�\��g?:%�����`e=@��++M:%�p%;6i=@q�{��+%�$�&ݖh=@���?Q)%��lXSYh=@Իx?n\'%�}x� #h=@�\�\"�t%%��\�\�2�g=@fL�\Zg#%�\�\�>9\nh=@�F\�? %���Tlh=@\���6%�,I�\��h=@�\�\�O\�%�\���\�i=@�\'���%��y�Cnj=@\Z2�%�+2: 	k=@nM�-�%�ٕ��zk=@6v�\�%�>&R�\�k=@O!W\�Y%�$}ZEl=@��ͪ\�\r%�D\�\�\�m=@X)�k%�od��m=@DL�$z	%�=\�\�\�m=@\�\rM\�\�%�ИI\�n=@c�:\0\�%�ٴR\�n=@R��/I%�b���\�o=@r\�j��%�\�0C\�p=@t{Ic%�\�WWjq=@��5�\�%�	�vr=@o�UfJ%��c#�s=@A*Ŏ\�%��ި�s=@*�\�.��$�:#J{�s=@\r�����$�A��h:s=@L�\�\�\��$��`<�r=@���\���$����\�\�q=@�/Ie��$����T�p=@g�\�I}�$�\�\0�&Pp=@�\�~K�$�\�$��o=@�D���$��\�ԕ\�n=@��3���$��Ky n=@���\n�$�_\�\�,�m=@�s\�^�$�\�9x&4m=@[&\��|�$��k���l=@�W\��$�eV\�p;l=@`���$��~�Ϛk=@m�s��$���Bk=@8\�q\�\�\�$��k=@�\�2\�\�$��!�[=k=@`X�|\�$��$��k=@@�&M�\�$����\��k=@�5\�;N\�$�+\��l=@�aN\�&\�$��N�\�m=@��%:\�\�$��O0�m=@毐�\�$��\�LLn=@r��&O\�$�\�Q�\�o=@\�mnL\�$�\"\�\0�&p=@,\�F<\�\�$�0+\�~r=@\�3K\�\�$��b\r�s=@W\\��\�$�.Ȗ\�s=@d�\r1\�$�=+i\�7t=@�4F\�\�$�y��\"�t=@7\��\�\�$����hWu=@\�xwd�\�$��\�9?\�u=@1�~\�\�\�$��r�9>v=@���\�$�D�.l\�v=@,D���\�$���\�t w=@F\�T�=\�$�[A\�+w=@\���\�$��=x\�\�v=@��խ�\�$�\'�o|\�u=@|a2U�$��X�vu=@^\��k�$�m���u=@Pqx��$�+TT�v=@�{�P�$��\�\�1\�w=@��\��$�Z��mx=@A*Ŏƹ$�r75\�x=@\�%�<�$��#EdXy=@�5�Ea�$�:\\�=\�y=@.\�l�I�$��\0�6qz=@\�\�\�;��$�{�%9`{=@~\�Az��$�W\"P��|=@%?\�W��$��=\�\n}=@�\����$�\�bb�q}=@\�\��@��$� y\�P�~=@e�\�E�$�?5^�I�=@\�\�!��$�+�m��=@\�Fu:��$��\�\�\��=@lˀ���$��8�d��=@ß\�\�\Z�$�Ϟ\�\�$�=@\rĲ��$�\�v|ӄ=@�h[͢$�q9^�\�=@��\�C�$�eS��.�=@C</O�$�Lǜg\�=@M\��.�$���X\���=@\0\�C���$�m\�)\�=@\�-c}�$�\�ۂ���=@2�#٘$�$(~���=@\�(�[Z�$��N\�Pܑ=@\�\�i���$��\�z�2�=@�;\�䷐$�w|\���=@�cyW=�$�㊋��=@\�1��$�	��8��=@�R{m�$�\���҈�=@$d \�.�$�o�m�=@��@gҎ$�3d���=@a\��w}�$���\�N��=@M�x$^�$�\�HLP�=@�p\�\�H�$��\��r��=@\�K8�$�zR&5��=@g���$�u:��Ԣ=@\�t\�\�$�Mg\'��=@�L!u�$�6�\��=@��o\'�$�\�<0��=@FA���$�[\�\�å=@E|V|$��\�\�\��=@�R%\�\�j$�R%�S\�=@Ɔn�j$�F\�~\�\�=@J\n,�i$���\�}�\�=@^\�Y-�g$��\r��M\�=@>��I�f$�L\��\�=@g,�\�Nf$�Ӿ��\�=@�QI��f$�\�I�\�\�=@�T4\��f$���H��\�=@\�э��h$�m\����\�=@\�\�\�&�i$�	\�P�\�=@�F>�xj$����(_\�=@\�\�]\�k$��V\�f\�=@7ݲC�k$�\���\�=@�_w��l$��t\�=@e\ZM.n$��ͮ{\�=@�\�O\�n$��^�\�=@�Bus�o$�\�۟��\�=@\�\�\\QJp$�lw\�}\�=@�@��_p$�\'N\�w(\�=@ū�m�o$�k�MG\0\�=@>�$@Mm$�y;\�i�\�=@\�\�%�\�j$�\\ A�c\�=@�r�w�h$�xC\Z8\�=@%\�s}f$�\��\�?k\�=@&��d$�ۇ�\�\�\�=@d\�\�1c$�p��\�\�=@8\�GnMb$�K\�\��\�=@eq��\�`$�9\'�\�>\�=@\�!7\�\r`$�\�e\�\�@\�=@Z�\r�\�^$�}\�.PR\�=@��\�]$�^��v\�=@�� \�X\\$�g_y��\�=@=\�K�eZ$�,+MJA\�=@5\�\�o�X$�!��\�=@\r\�n�U$��\�V�\�\�=@�|\�.PR$���a�\�=@\�up�O$�\�8+�\�=@%?\�W�I$�>���\�=@l#�\�fF$�\�bFx\�=@\�\�\�\�B$�ꗈ�\�\�=@]1#�=@$�\np\�=@����:$��;�\�=@/\���\�8$�\�5\�\�\�=@�4�\Z6$�M2r�\�=@�sb\�3$��\�\�<\�=@\�9?\�q0$�+/���\�=@E�A�+$�\�J#f\�=@���1�($�zpw\�n\�=@��c\�$$�~�,\�=@�;ۤ\"$��\rN\�\�=@E����$����Kq\�=@\�}͑$�͑�_\�=@\���h\Z$�t\��\�\�\�=@$|\�o\�$�a�X5\�=@��\rLn$�7\�xͫ\�=@\0\�	�$�4\�?O\�=@���/�$�Y6sHj\�=@6\�\��\�$��=#\Z\�=@D�X�o$�B\'��\�=@q:	$�+�@.q\�=@ ��\0\�$�|b�*\�\�=@Nё\\�$�uU��\�=@��[;Q$�\��K\�[\�=@�Ss��\0$�����\�\�=@��\�jd�#�\r6u\�=@��3ڪ�#��I\'L\�=@�:�p\�\�#�\�CmF\�=@~b�\�#�\�|@�3\�=@ZKi�\�#��\��\�=@j�{�\�\�#���릔\�=@n\�y\�#�!#�\�\�=@P5z5@\�#�<��f\�=@t\�Oq\�#��\�V�\�=@*��%\0\�#�^��\�\�=@\�h\0o�\�#�\�;1\�\�\�=@�71$\'\�#�Xr�\�\�=@�e�\�S\�#�줾,\�\�=@\�X\�\�#�\�熦\�\�=@?\�\�\�#��&�\�\�=@zS�\nc\�#�\�5|\�=@��,\�\�\�#��\�zM\�=@b��\�\�\�#�\�ۃ�\�=@p\��\�#��\"���\�=@��\'\��#�o\�j\�=@\�_!s�#�\��J\�=@4-�2�#�s\�}\��\�=@\�\�\�N�#��<֌\�=@���3ڪ#�\�\�\�\�=@-\�i���#�4�27\�=@֏M�#�#����D�\�=@5\�($��#�K�P\�\�=@��%��#�1\�\�PN\�=@Z�1\�	�#��\�T\�\�=@zZ���#�\�\�K\�A\�=@ \�E\ne�#��vٯ;\�=@U���N�#��d\�=@-��\�#�n\�8)\�\�=@?���#�~r \n\�=@	À%W�#�a\Z���\�=@y\�Z�#�\�^EF\�=@/�o�ӝ#�\�n�Uf\�=@3\��y�#���y�C\�=@�\�\"[�#�N\�\�\�=@%xC\Z�#�Ww,�I\�=@���2��#��]ؚ�\�=@�,\�}�#�\�磌�\�=@h\�\�`o�#��\�je\�=@f�\"ݏ#�\�.\���\�=@\�S�4��#�)?��\�=@�$�z��#�`s�	\�=@���.5�#���\�3.\�=@��\�`ŉ#�3܀\�\�=@L�\����#��%:\�,\�=@6\�\�x\"�#���Tގ\�=@�c\�]K�#�R~R\�\�=@\�\�e�O�#�%z\�r\�=@#���#��GW\�\�=@` ���#�\�\��m\�=@Bx�qĂ#�!\�X4�\�=@&S���#��g�\�=@=��tZ#�M��E\�=@�i�\�{#��JY�8\�=@�M�x#�\�3�Ib\�=@��\�\�mr#�\�\�\�\�>\�=@��oa\�p#�\'K��\�=@�\�\�\�n#��\�A�p\�=@�\�j#�!�!\�\�\�=@J\��ci#�a�ri�\�=@��Hh#��Y,E\�=@\�\�wf#�W@\�\�=@&�v��e#�:$�P2\�=@�M�#e#��\�\�N\�=@D�Öe#�t\\�\�J\�=@uYLl>f#���\�R\�=@\�\�8�	g#����\�\�=@\�u��Xg#��I\'L\�=@�\�\�N�g#��\�\�\�\�\�=@\��,h#�ۈ\'��\�=@�\�@-f#�\n��b\�\�=@)Z��e#�M֨\�=@��ӝ\'f#�=�N\��=@�\�\�Xg#��\��=@s\��Ag#�^f\�(�=@�6qrg#��_cD�=@�%\��g#�؀q�=@�8�#+g#�k��躼=@�\��\nDg#�d\�]KȻ=@W�c#g#��ݯ|�=@\�\riT\�d#��>+�=@`�\�\�a#�%��r�=@\�<`#��\'���=@�\�˶\�^#�e\0�\�ƹ=@1C\� ^#�\r��W\�=@\�7�{\�]#�r\�@H�=@K\�h^#��fe���=@(d\�ml^#�\�2��=@z�3M\�^#��\Z�\�2�=@\�\�G\�_#�s\�}\��=@k*�\�^#���b��=@\�\��S\�]#�ByG�=@\�e6\�\\#��{�O��=@\�,B�\\#�A\r\�º�=@�\�\��q[#�\�ȑ\���=@\�tx[#�;�vٯ�=@*q\�Z#��>�\�Ȯ=@ߦ?��Z#�\�ם\�<�=@�yȔY#���\�u�=@\�tYLlV#�F	�=�=@zT�\�U#�7�C�=@��\�/fS#��8�#+�=@�R%\�\�R#��V\'g(�=@R(__S#�u\�yƾ�=@:\��lT#�%\�\�RΣ=@2��|R#�6�\�ϟ=@�\�t\�Q#�W\�f��=@(a�\�_Q#��x\��۝=@�>\�P#���o\'�=@ѬlO#�l\�f��=@G\�&jiN#�2��\�=@\���NM#�z\�(�=@(�\�vL#�A�G��=@�D�L#��q����=@|�\�˙M#��1\�=@\��/gN#�˃�9�=@$%=�N#�֨�ht�=@���\�MN#�H��\'��=@\�Z_$�M#��ȯ�=@\�r.\�M#�^gEԔ=@(��яN#�ds\�<G�=@W[��\�N#�,H3M�=@EH\�\�N#���>U��=@&U\�M�M#�`���=@�\��\��L#�Ww,�I�=@TT�J\�K#�]S ���=@.�\�M\�J#��� %�=@w��׹I#����^�=@+~��G#�NA~6r�=@	�I��G#�ퟧ��=@�Pk�G#�\�x�ߢ�=@���\�G#�Ze����=@ip[[H#�2��|�=@\�_{fI#�\�\�\���=@�\�qQ-J#��\�%\�2�=@2\�	\�\�H#�-wf�\�=@N\r4�sG#���-ʈ=@\�~O�SE#��\�E���=@`\"ĕC#�@j\'��=@]�B#�\�/o��=@u9% &A#��Za�^�=@��ʅ\�?#�\��|zl�=@w\�ِ>#�_�\\6:�=@�f\r\�W5#�U��N��=@�Dׅ4#�� [��=@I�f�\�6#���!r��=@Ze���6#�n4��@�=@�7N\n�6#��V\�f�=@�,\'��5#�~\�[�~�=@���_3#�K�|%�=@\��&72#�\�ͨ�~=@ж�u\�/#��\�E_A~=@\�aN\�.#�0�\�mP{=@���oa-#�_\�Qz=@�\n\�.#�\�jH\�cy=@\�JU/#�t)�*�v=@\�\�A%�+#�\�C?�w=@�1!\�*#�}>ʈx=@��U�\'#��լ3�w=@V\r\�\�\�%#�\Z\�\��w=@\�@1�$#�\�\�^zw=@G\�g\�u##�c|��lw=@n4��@\"#�\�\'�_w=@�F\�\�� #���C�lw=@o��\�#�\�cx\�w=@�0E�4#��\�:��x=@��\�f#�0��!x=@E�>�\'#���\�Xlw=@vQ��\�#�����Ov=@\�\'G�#�4\��`u=@>{.S�#���3��t=@\�^(`;#�|b�*\�s=@4���#�rR��8s=@&�\�[X#�c\�\�l�r=@}\�ݮ�#�]lZ)r=@�[1\�#���N]q=@��\�K#�\ZS�\�\�p=@\�\�bg#�\0\�3h\�o=@\�t=\�u#�c\'�o=@�\��~#��\�ދ/n=@\r34�#�ڬ�\\mm=@$�]J]#�\�M)��l=@\�`�H#�g���\�k=@�qR��#�:3Pk=@��7#���j=@K��q�#�\�\�\�%i=@#\�\�)\�#�I��_�h=@���\�#�r�CQ�g=@��F\�#�n\�(g=@ı.n�#�U�q7�f=@YO��#���m��e=@\�\�\0��#�\��ť*e=@dY0�#�YP�id=@B]¡#��\�\�c=@�L\�#�\�\�\�#c=@e�\�E#��\�\�̯b=@H\��Q#�,\�F<\�a=@\�%�<#�Y��L/a=@�A|`\�#��\�`=@�!q��#���\'\�`=@�B�l#�in��\Z_=@T\�d�#�\�1�\�l^=@��C�R#��\��B]=@V��Ά#��@�Ρ\\=@�8\�Z�\r#�n��\�[=@\�|\\*#�^M���Z=@AI�0\r#�5$\��Y=@��\��\r\n#���\�\�Y=@�\r�g	#���ɩ�Y=@4�ތ�#�ܠ�[;Y=@|�y\�#��I�2Z=@jM�S#�,G\�@Z=@�2\Z��#�s��Z=@)\"\�*\�\0#��\���\�Z=@\\\�M\r4�\"��2\Z��Z=@܀\�#�\"�#����Y=@��B\��\"���|\�rY=@��b���\"�歺\�X=@崧\��\"�7T��7Y=@�[\��\"�L\Z�uTY=@�=b��\"�p_\�Y=@:vP��\"��a��\�X=@�z\�\��\"�\�j,amX=@��\�\�\�\"�4��E`X=@AEկt\�\"��d\�puX=@�Y�\�!\�\"�\�\�\�eW=@e\�VA\�\"�Rb\��V=@�\�Pj/\�\"�\n.V\�`V=@K!�K\�\"�\� ���U=@\�y\�9[\�\"�3�<\�T=@��\��\�\"��;��)T=@����\�\"��]�9\�S=@�V\��\�\"�;]��S=@��\�G�\�\"�Y�oC�S=@\�4\�8E\�\"��\�\�mS=@\�\�7\�\�\"��5\�e�S=@�\�Pj/\�\"��0a4+S=@`\"\�:�\�\"���ՑS=@� ��q\�\"��\�Nw�T=@_&��\�\"�iW!\�\'U=@O�o+\�\"�&\�5\�T=@�J\"� \�\"�w1\�t�S=@m�_u\�\�\"�$\���S=@��r۾\�\"�W@\�\�S=@�\�qn\�\"�\�\�$�T=@���6\�\"�-�cyWU=@�wF[�\�\"��n,(V=@�7/N|\�\"�y�t\�\�W=@S\"�\�\"��*�\�Y=@��� \�\"�U\�YZ=@::Z\�\�\"��\rk*[=@%!���\"�\�W)�[=@�3����\"�\��\\=@\�;���\"�nP���\\=@` ���\"�Y�\�+�\\=@,���c�\"�\�w\�-;\\=@U�\���\"�Tb.\\=@\0o�ŷ\"�\�\n~b\\=@\Z�Q\r��\"��-��\\=@j0\r\�G�\"�w/�\�Q\\=@Y\�\�\"�2ZGU\\=@\�J��\"��<e5][=@��\�/�\"�R�8�\�Y=@\n�\���\"�\�fc%\�Y=@h\\W̨\"�H\�)s�Y=@�����\"�ИI\�Z=@og_y��\"�\'k\�C4Z=@�b��	�\"����gZ=@L6l��\"�E�*k�Z=@\�s`9�\"�v\�\�fGZ=@㥛\� �\"��z\�\�Y=@�\����\"��dȱ�X=@\�����\"��fd��X=@�,���\"���\�X=@#[AӚ\"�>^H��X=@�&\"\��\"��\Zg\�X=@�\r�D�\"�R��Z�W=@(CUL��\"���\�o\nW=@\�\�S\0��\"�Χ�UV=@5y\�j��\"���\�\�V=@�3���\"�\�h��\�V=@-��硫\"��8d\�V=@\�/fKV�\"�:3PW=@IC���\"�q\0��W=@j���<�\"�)�\0�X=@\�\��e�\"�ɬ\�\�vX=@k��\��\"�T5A\�}X=@k����\"�-yX=@{h+�\"�ys�V{X=@>]ݱ\�~\"�\�)r�X=@sJ@L\�}\"�p��:\�X=@\�ǵ�b|\"�g\�|�|X=@��R^+y\"�8��+X=@Ec\�\�lw\"�\�,\�\�V=@m6Vb�u\"��2\��U=@�z�f�t\"���tw�U=@-����s\"�U�\�\�U=@�\rNr\"��\�8+V=@��u�Xp\"�\�)\�\�FV=@�\�%\�2m\"�I\�\�\�U=@���A_j\"��*8�T=@+/���e\"���(�R=@���L�f\"��[\�d8R=@gE\�D�g\"�\�\�\��Q=@)\�Ǻh\"�0\�r.Q=@RI��&j\"�\'jin�P=@sI\�vk\"�[\\\�3\�O=@��:ǀl\"����GO=@`\�\�8m\"�%Z�xN=@\�o\n+l\"�{��&3N=@�.�\�|j\"��72��M=@\�\\5\�i\"�\�}͑M=@�H\�\0g\"��\�J\�HM=@\'K��e\"�*�\�\nM=@`Z\�\'�c\"�\�ȑ\��L=@n�2db\"��\� �rL=@?U�ba\"�.�\�\�K=@\�\��_\"�&\��oK=@�H�[_\"���)xJ=@\�\�c> `\"���aI=@�{G�	a\"��9�w\�G=@�N#-�_\"�z�ަ?G=@A	]^\"��Rb\�F=@$^�\�]\"��:\�zF=@;�\�u�[\"�}\�O9F=@\�,��\�Y\"��ʼU\�E=@c���V\"�\�@H0E=@\�K\�\�T\"�\�V�\�,C=@\����Q\"�~�$A�B=@Q�\�Q\"�4\�\ZB=@�d��O\"�����A=@�\��\��L\"�$F\�-tA=@\�;\�J\"���\�@A=@\�\�\�B�I\"���\�?�>=@��x!F\"�pUj>=@\�$��\�E\"�:�Fv�==@\�j�E\"��\�鲘<=@>�>tAE\"�F�̱�;=@.\Z2E\"��gx�;=@\�Q*\�	E\"�v5y\�j:=@��i�:E\"�}�\��\�9=@ԀAҧE\"�HnM�-9=@؁sF�F\"�5\�\�8=@\�mnLG\"�+MJA�7=@\�\�v�>H\"�>���6=@vŌ��H\"��]\�pX6=@�K�bI\"�\�\�\�B�5=@�&M��I\"�\Z\�.\�4=@Dio��I\"�?\���3=@ 	�vI\"���rf�2=@$H�\�\�H\"�Pmp\"�1=@\r\�-�H\"��k���0=@wJ\�G\"�{O崧0=@l�6�F\"���k&\�0=@�0�*E\"��\\\�\�1=@\rĲ�C\"�Vc	k/=@ݳ�\�B\"�����O.=@�3ڪ$B\"�y\�ՏM.=@\����A\"��\�2n.=@���Y�?\"�Q�%��-=@\\\�\�.�=\"��\��9,=@Z\�\'�\�>\"�x`\0\�+=@��Z}u=\"��\�J\n,=@U�3�Y;\"�\r\�n�)=@���\�:\"��Tl\�\�(=@q9^�\�9\"�Vc	kc(=@R\'���9\"�ɑ\��\�\'=@k}�Ж;\"�ᖏ��\'=@i��\�<\"�]��u\'=@�-��<\"��\�ډ&=@ס���;\"�\�\��r-&=@�E\�\Z:\"�\"ĕ�w\"=@()�\06\"�5$\��!=@\Z\�.\�4\"�\'��> =@�\�!\�\01\"��4Lk=@��70\"��l\�\�=@\�\�?�/\"�9+�&�=@\\1е/\"�y��M�=@\�;.\"�!��=@i\�\�I+\"�$c��=@(��\�\'\"���/Ie=@a5��&\"��:V)==@�:s	\'\"�\��- =@[	\�%q&\"�W\�Y\�=@E�@J$\"�\�\�H�=@{1�\�\"\"�^=�1 =@VDM�� \"��\n�H� =@\�X\�\�\"�-%\�I(!=@l\���\"���f��!=@���#\"�;�p\�G\"=@e8�π\Z\"�\�)�\�z\"=@ު\�PM\"��y��\�#=@ݕ]0�\"�\�Pj/�%=@]ݱ\�&\"�\�d��~\'=@��\�\�\�\"�k) \�(=@�RB��\"�\�E��(*=@�\�o�\�\"�|\�/�+=@�vKr�\"�\�P1\�\�,=@^�SH\"���d9-=@w;S\�\"�]�\�-=@ץF\�g\"��O�\�-=@,am��\"�#0\�70-=@\��\�R�\"�}^�\�#-=@o,(\�\"��\�n-=@����\n\"�\�镲-=@;��.R\"�l%t�\�-=@\�CԷ\"�	�/��/=@\�{\r�q\"�\�ĭ�0=@�e2\��!��\�6o�0=@Pō[\��!�Y���\�0=@qTn���!�d<J%<1=@��n/i�!�\�PS1=@ӈ�}�!�T\�\�$[1=@H4�\"�!�\�\"LQ.1=@��\���!�\�º�\�0=@t\�Oq�!�\���v\�0=@b���\�!�\�\��\�$1=@\�T\�#�\�!��2T\�T2=@\�J�R\�\�!����\�3=@�혺+\�!�\�9\�5=@,(\�4\�!�n½2o9=@�>��\�!�\�]M�:=@�gx�\�!�m˟;=@�P�\�!����H�<=@�����\�!�\�\�\�(y==@s-Z��\�!�O?��>=@\�o	�?\�!�\"nN%?=@d> Й\�!��m��A=@\"��\�\�!�k�)\0B=@�a��h\�!��ฌ�B=@v\��ť\�!�>x\�҆C=@Sͬ�\�!�\�\�\�:E=@�Z\�\�\�!��>�E=@\�\�[\�!��\�2nF=@�$A�\�!��D�+G=@3\�ۃ\�!���8*7I=@\��X\�!��~��\�I=@�X�\�+\�!��ܚt[J=@\�\�ih\�!�a\�9\�J=@�U�&�\�!�c|��lK=@�T��\�!�\�\�L=@[\�\�X�!�|}�K�L=@�$�9�!�\rR�L=@d[���!��z��mM=@.X�x�!�\�\�\�\�M=@\�\�;\�!�#\�dTN=@;Qi�!�E\�[\��N=@ɒ9�w�!��c@�zO=@�\���!�c��\�\ZP=@�{)<h�!�c섗\�P=@�\ZL\��!��U��;Q=@x�a���!��D(bQ=@\�t!V�!�JB\"m\�O=@�\�\�Xw!�XƆn�O=@\�(ϼv!�\�w~Q�R=@3܀\�s!�?Ȳ`\�S=@��/s!��#��U=@?9\ns!�m��^=@`r�\�Zs!�y=�_=@\��[r!�n�|�b`=@Ov3�m!�m6Vb�a=@M\��.f!��t<f�b=@7���b!�\� !\�d=@�\�\�\�_!�#��e=@\�$\��]!�\�س\�f=@\��\�\\!�\�Q\�g=@\�&p[!�G\�\��i=@`#I�X!�9�~߿i=@f�L2rV!��a��hk=@�%�P!�\�46l=@�H¾M!�\�聏m=@\r\Z�\'�H!�(*\�Tn=@���οE!�jL���n=@F~�D!�\�G\�n=@,=)�B!��^�So=@��+\�@!�\��\'�o=@�]i�?!�xE�p=@�4c\�t>!��\�25	r=@8H��=!��\��\�]s=@�>��;!��V\'gt=@K\�H��:!�\��ԱJu=@o��\�T9!�ҌE\�u=@�Z}uU8!��\�B��x=@��d91!����A_z=@�ƠB/!��v\�{=@*U�\�--!�\��|=@Ɔn�*!�s��P�}=@�!8.\�&!�U��N�}=@�={.S#!��B\�O�}=@2\�CP5\"!�0�AC�|=@�=#\Z!�\�\��W}=@��q�\�\r!�}\"O��}=@|E�^!�\�W�f,~=@��\�\�\�!���s\�~=@~T\�~O!�>>!;o=@����!��\�g�=@ݕ]0�� ��-\�R\\�=@��Rx\�� ��q4GV�=@-�\�o�� ���]�9�=@\�Vд\�� �F@�#H�=@�d\�pu� �#�~�\r�=@�n�\�o\� ��`<��=@eQ\�E\�\� �\�\�\\QJ�=@A�\�ǘ\� ��>+�=@�4\r�\�\� ���\�\n�=@\�3�\� ��\�Jvl�=@\�\���\�\� ����zO�=@�f�\�6\� �CV�zN�=@e�\�7i\� �\�\�.�u�=@<jL��\� �\ZN��o�=@�J\�\� �g\'��\�=@�<�;k\� �(\�\�G\�=@}��\� �0G�\�ۤ=@E,b\�a\� �|\��٥=@^�\�6S\� �\��0{٦=@4�y\�S\� �����Ш=@9\�Cm\� ��ɐc�=@=Զa\� �|�y㤬=@��Z\� �3����=@�GQg\�\� �9{g�U�=@\�캷\"\� �\� ���=@M2r�\� �K�\�\�J�=@X\��C�� �M\�\��=@�sCS� ����\��=@\��<�;� �\��l �>@C�B�Yu �JB\"m\�\�>@\"��\�g �',1607362055,1607362055,NULL,NULL),(8,'North-Western',_binary '\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\��X32\�:@i���2\�*�1Xr\�:@/\�$\�*��>�7j\�:@\r8K\�r\�*�.\���\�:@?�{�\�*�M�\��\�:@j�*�\�*�^c��\�\�:@�6qr�\�*��t\�_�\�:@}(\�*�\�~k\'\�:@�\���*�b��\��\�:@�+�\�E�*�5	ސF\�:@Mi�-�*�46<\�:@�^��*�d\�\�:@D�K�K�*��gs\�:@ۢ\��,+�>B͐*\�:@�f,�\�.+�\�\��\�:@�\�O\�1+�c`\�\�:@e���\\5+�W횐\�\�:@ZH�\��6+�G\�g\�u\�:@��\�o\nS+�eo)\�\�:@ ���W+�%\�\�ID\�:@ڨNZ+�\�|\�X�\�:@�Q�y9\\+�(\r5\n\�:@J�i�W^+�-\�\�:@i��֦a+�2�g�\�:@�Ց#e+���\�\�:@\�c�g^f+�ǡ~�\�:@�?���h+�l�p�\�\�:@\�kzPPj+�\��/g\�:@�\�\�a�m+���\�A^\�:@\r�\'�8o+�\�>9\n\�:@\�5�\�t+�B�p\�-\�:@�C5%Yw+�����\�:@�Nty+�歺\�\�:@ۦx\\T{+�X\��C\�:@\�\�nf�{+��\"h\�$\�:@qN`:}+��£�\�:@\�D\���+��Z�[!\�:@�[�\�A�+��\�&�\�:@Fy\�尋+�N^d~\�:@\�X��L�+�Fx{\�:@\�\�\�zi�+���~\�:@\�fG�\�+��6qr�\�:@��N\�z�+����\�:@������+����Σ\�:@���+���F\�:@��\�\�;�+���i\�\�:@#/kb��+�R*\�	�\�:@z\�\�\�+����j\�:@J����+��\�0|�:@8J^�c�+�\�BW\"P�:@��\0�+��\�SV\��:@w��\�+�Ƌ�!r�:@7\��+�-	PS\��:@b����+��\�O\��:@�m�R]�+�@Qٰ��:@\�y���+��2\���:@\\t�\�z�+�\�\0��F�:@VE�ɨ�+�(\�4��:@3\�\�(�+��\�\�-\�\�:@6#�\�E�+� %vmo\�:@|,}肺+�!ɬ\�\�\�:@${��!�+��$w\�D\�:@�\�\�V\�+��\�&�\�:@��0\�+�f���\�:@\�8�\�\�+�b�G\�:@\�\�l�\�\�+�Ί��>\�:@b��m�\�+��0{\�v\�:@DN_\�\�\�+�\0;7m\�\�:@ƾd\��\�+�0\�r.\�:@\�\�.Q\�+��5\�;N\�:@l{�%9\�+�]�z\�:@�\�\n(\�+�\�ù�\�:@�\n\�\�\�\�+�B�F��\�:@�!�\Z�\�+��͋_\�:@Ǻ��\�+�\�Kp\�\�:@eo)\�\�+��o}Xo\�:@��\�T��+��Dׅ\�:@!�˛�+�+�\�p\�\�:@�/ע�+�����\�:@�\�#��+�DR%�\�:@}гY��+��O�e\�:@�UJ\���+�.s�,&\�:@[��K��+��\�Ry\�:@=\nףp�+�\�5&\�\�:@�߼8��+�Ԛ\��\�:@uX\��+�;�\�u�\�:@�4\�\�o\0,��n/i�\�:@�o�\�e,�\�\�\�(y\�:@)@̘,�\�ډ��\�:@���,����\�q\�:@m\�\�]\�,�-]�6\�\�:@�0\�,�nڌ\�\�:@4ڪ$�,���$\�p\�:@�1zn	,�J�\��\�:@ zR&5,�\�\�l�\�\�:@e���\r,�1@�	\�:@�GT�,�<\�\r�\�:@��z\�\",���K\�:@���L,�\�\�\\5\�:@9\�\�\�\�,��4�B\�:@T��b�,�8� \"5\�:@C�l\�,�\Z\��lY\�:@\0��q,�j\�0\n�\�:@`!seP,��ʉv\�:@\�*l� ,���S\�\0\�:@�e�YJ&,�d�\�3�\�:@�X�O(,�\�w~Q�\�:@�0�*-,����\�(\�:@\�\�\�B�1,��\�{�E\�:@\�\�t!V7,����e�:@�d\�,\�9,��F!ɬ�:@8���;,�DmFA�:@c\n\�8�>,��\�S9\��:@\�V*�@,�.q\�\��:@�JC�B,��9@0G�:@FaED,�\��vKr�:@毐�2H,�ka\�9�:@N\'\�\�rJ,�\�\����:@<���N,�n�\\p�:@\���}P,��\�\�\��:@\Z�h8eV,�\�`6��:@\�\�O=Z,���n\��:@�8��\�\\,�\�v/��:@m�^,�\�I}Y\��:@P\�\���a,�\�\�\�0��:@���>e,��\�	m�:@{��mmi,�L�\nF%�:@\�{L�l,��	.V\��:@��\�%\�r,�l\\��\��:@)v4�s,���vN��:@x^*6\�u,��\�\riT�:@n�\�E�x,�!u;�\��:@l?\�\�|,�s߉Y�:@{�\\�~,�m�IF\��:@5��\�,�q㊋�:@>�x\�,�6�\�\n�:@�EИI\�,�\� ����:@\��K\�\�,�F\�~\�\�:@G\�g\�u\�,�\"S>U\�:@,cC7\�,�u><K�\�:@;\�\r�\�,�\r�~1[\�:@��il�\�,����3�\�:@B#ظ�\�,�D�M\�:@E|\�,�Է\�\�\�:@`s�	\�,��Z��\�:@#-��#\�,�^i��\�:@\�_\�+\�\�,��d��\�:@!���\�,��\� v\�:@<FzQ\�,�+j0\r\�:@\"o���\�,�ǻ#c�\�:@�m��\�,�0���h\�:@4J��%\�,��j�j�\�:@�\ZKX\�,�����\�\�:@\�K\Z�u\�,��̕A\�:@�a\�\r�\�,�\�v�\�:@؞Y�\�,��Ov3\�:@a�4\�,�.\�Ue\�\�:@4���\�,�{g�UI\�:@�\�	\�\�,��ׂ\�\�:@��KTo\�,�E�\�\�:@կt><\�,�MN\�S\�:@I\�\0O\�,�s۾G�\�:@D�3�\�,�kծ	i\�:@i�\"�\�,��_\�\�\�:@�vj.7\�,�<2V��\�:@(F�\�\�,�\�:�\�:@�\�\��5\�,�%�}�e\�:@%]3�f\�,��N\�:@\�U�\�\�,��\�`ũ\�:@x�\Z\�,�D4��\�\�:@c*���\�,�ګ���\�:@���T\�,���\�C\�\�:@4iSu�\�,�{�ю\�:@��n�\�,�֧�\��:@ޮ��\�,�/�H�:@L\�1�=\�,�Ll>�\r�:@%z\�r\�,�֭��޿:@>?�\�,�T8�T��:@�**\�,�}w+�:@�L��~\�,�\�1�\�l�:@\�;�(A\�,�E*�-�:@s�c��\�,���0a�:@\�o_\�\�,�G�Z\�Q�:@\�?3�\�,�3O�)��:@\�6p\�\�,��g�:@\'�o|\�\�,��\"���:@NA~6\�,�\�c\�ߧ:@����y\�,�yt#,*�:@��\�,��\� ���:@��\�5>\�,�\�(�\�:@�\ZO\�,���1v:@O\���\�,�q㊋�:@衶\r\�,��>�\'I�:@=Զa\�,�RG\�\�Ȟ:@\�\�\�n\�,��\�c�g�:@\��a\�,�\�\�B\�:@F;�I\�,����T��:@ߌ���\�,�����*�:@�&OYM\�,��x\r��:@\�\��%\�,�bf�\�(�:@\�S\�*\�,�\0\�Ȓ9�:@	\�%qV\�,�\�\�\�;��:@�)Wx�\�,�[Ӽ\��:@#�\��\�,�\� \�hU�:@\�ݮ��\�,��\�4\r�:@��O�\�\�,��O\�\�۔:@(`;�\�,��K��:@�<\��\�\�,�\�\���:@i�\0�w\�,��$\�pt�:@�1\�\�\�,�\�z�I�:@���F\�,�/�ͮ�:@-����\�,��=B͐�:@�$�z�\�,��\�WW�:@Tȕz\�,�.=�\�Ɍ:@\��i\�,���u�X�:@\�\�y��,�=b�܊:@\�(�\�P�,�\�tYLl�:@���_�,�eT\�݈:@\�\�W;��,�5%Y���:@D6�.6�,�ޫV&��:@��\����,�8��\n*�:@EGr��,��j\�:@|�8c��,�7�~�:@���>�,���\���:@0e\���,�CƣT:@	Q�\0-�Ӿ��:@�\�\��-�<��Ӹ�:@�~j�t-�\�\�m���:@G�(\r-�\��b\�Ń:@7߈\�Y-�j��\�ȃ:@QMI\�\�-�bg\n��:@\���|\�\n-�s�w���:@K�\��>-�2\"QhY�:@�HZ\�\r-��D�\���:@���e�-�Q0c\n�:@}�\��\�-�xԘs�:@2��|-�/�HM:@�\�\�-����\'�~:@\��-�-��]��a}:@\�`\"-�K\�X\�U{:@\��&�E-�A*Ŏ\�y:@�`��\�-�W\n�\\\�x:@��\�-�fg\�;x:@����!-�.T���v:@0��-�n4��@v:@���L\Z-������u:@\��B-�F\�j�t:@Ǜ��-�\�\�\�s:@\�|#�g-���oHs:@\�qn\�-�@�Z�kr:@z�I|-�\�\�\��q:@e\�F ^-��<�q:@�I~į -���np:@�\�\�\�/#-��C�R�o:@D�3�$-�a\�$\�o:@�}��\�%-�\�k]j�n:@����	\'-��9\�m\�m:@�#c��\'-��S\�\�m:@�q�d�(-�ؚ��\�k:@`r�\�Z+-�j�J>vk:@5|\�.-�)x\n�Rk:@�R�r/0-�ޭ,\�Yj:@voEb�2-��W\�\\i:@�u\��5-��L���h:@*��s8-�\�^(`;h:@dT8:-��\�\�bh:@f��O;-��RAE\�g:@\�e6\�<-����N@g:@����?-�x\'�\�f:@\�c�\rA-�k\�\�uf:@\�\�@�B-�MK��Ff:@\�:]�C-�؀qe:@�\�\0�E-�{�2Q�d:@\��\�\'+F-�\�X�a:@�\�t=I-����=\�`:@\�%jJ-�g\�|�|`:@\0��qK-�_\�lW\�_:@Z�!�[M-���\�I�_:@\�\�!��N-���\�p<_:@ɏ�kP-�IK\�\�_:@�\�x>R-���_:@*s�\�V-�\�ͨ�^:@i�-�W-��:�p\�_:@�a��\�\\-���\rN`:@\�\�\�EC^-�@�\�\�`:@��	�\�_-�i��a:@\�Q�\�c-�Z�wga:@\�8��\0f-��{�Y�`:@\��G�Cg-��@�M�_:@崧\�h-��\"�-\�^:@��^�2i-��\�qQ-^:@-z�\�i-���f�]:@�\�\0\�j-�r�t��[:@�l\�l-�w�NytW:@\"4��\�o-�2˞6W:@�\�7\�\�p-��\�\�V:@,\�p�{r-����\�U:@�ϸp t-�\�/�\�S:@lˀ��t-��ba��R:@h\�ejt-�\�5w��P:@]�gA(o-��)WP:@\��\�\�i-�\�z�2QP:@�cZ�\�f-�;\�Ԗ:P:@\����e-�\�	�O:@F�7�c-�\Z�\�6N:@M1AGc-�/�XniM:@�h[\�b-�ⱟ\�RL:@v5y\�b-�e\ZMJ:@h�b-����}I:@Է\�\�`-����5H:@�Z�\Z�_-�[^�\�6G:@�\�\�^-�@�\�\�vE:@W\�\�m]-�x��\�\�D:@(�N>]-��\�>V�C:@l\ndv]-�\�\�g#C:@J�U\�\\-�Oyt#,B:@J��%�\\-�T���rA:@u\�b�T\\-��\�0\�A:@\��S\�[-��^�sa@:@��[;QZ-�L<�?:@\�\�ĭ�X-�a3�\�>:@T^-W-�C9ѮB>:@\Z��\�AV-�����}=:@\�^}<�U-�Tƿϸ<:@(�rU-��X\"�;:@\�,\�T-��Ɍ��::@�r�9>R-�eo)\�9:@@KW��P-�E�<�8:@�	�\�P-�`\�U,~7:@���\�P-�&9{6:@Ę��RP-�R\�\��T5:@�!��uP-�}zlˀ3:@nē\�\�P-�0�Qd�1:@�\�\rP-���\�s�0:@5a�\�O-��(��/:@\�`6�M-�,H3M/:@\��\�K-���c��/:@F\�=�\�F-�,�\�0:@iƢ\�D-�Sv�A]0:@^�o%C-�I�+�0:@o\rl�`A-�\�Y-�\�0:@�/ע@-���dV\�0:@����O>-�S\�\��\"1:@\r9��!<-�T�<\�9@�	0,-�R�\��9@�߼8�-�P����9@.��T-��\�\'��9@F\�v-�T\�:Ɖ9@y��\�-�m�\�J��9@�����-�\�cx\�9@��T��-�Q��l�9@&r��-��\��|9@��\�>\�\Z-�\�\�\�C\�y9@\�\�\�%-��ĬCu9@\rP\Zj\"-�$_	�\�r9@r1\�q$-�\�b�T4n9@�Gߤi(-�[{k9@o/i�\�)-��⪲\�f9@�\�#\rn+-�gC��A\\9@���.\�*-�0��!X9@g\r\�W\�*-��v���T9@\�r��+-�Ǻ��N9@2!撪--���\�RJ9@6<�R.-��Σ\��F9@p\��//-�ڎ���;9@Sz��3-�/�\�69@3SZK8-��5Φ#49@rk\�m�<-�$}ZE09@F��\\\Z?-����\�+9@,\��<-�\�/��\�%9@a\�N\"\�?-�\�{\�ʄ#9@\�\�f*\�C-��\�V%�9@�\�d\�\�B-�\�;9@�\�9?\�A-�DOʤ�9@\0\�	�A-��m�B<9@ҌE\�\�A-��yUg�9@�\�->-�dv�S9@@�Z�k:-�YO��9@?�g͏7-�ᶶ�\09@\�|��\�3-��q�߅�8@a����/-�Y���t�8@y\�&1,-�x\�1!�8@���5?&-��\���K�8@\��lY�-�\r\�-��8@\�\Z�N-��f\�|�8@�x#�\�-�\"O����8@p��1=-��=B͐�8@{��\�\r-�`tys��8@�y�3M-�N��oD�8@\�v/�-�\��k\��8@�/EH�,�M�:�/�8@����]�,�q��\�\�9@`�o`r�,���9@/0+\�\�,�\�JZ�\r9@L\�\03\�\�,�\�\�{,9@�N\�6�\�,��M\�=�	9@�F>�x\�,��7M�9@�0\�\�,�5\�($�\r9@�\�bb�\�,�\�C�|9@�&�\�\�,�I+���9@\��\"�-\�,��\�Pj/9@�l\���\�,�N\�&�O9@\�_Z\�\'�,�֩�=#9@\�\�\'�,�o����9@\�\��;�,�6\�\n\�r9@����`�,��h;�\�\Z9@��UJϬ,��_�n9@?74e��,�^�zk`9@\�\��m�,��a��\�9@�\�j�=�,���`�. 9@�J\�h�,��C3O�!9@\����,�3O�)�!9@Su�l��,���t�i9@^i���,���W��9@�V$&��,�.9\�\Z9@/�\�\�{,�\�y�9@�3Lm�{,�zq\�\Z9@M��~\�t,���|	9@\�\Z��\�m,�+hZbe9@=�;k�m,�\�l��9@�|�\��m,�\�z�G\r9@���U�p,�\�.\�\�\n9@&7��m,�	Q���9@S���\�o,�\�l9@1^�\�j,�J@L9@\"� ˂i,��.\��9@Q/�4\'g,�ܝ�\��8@D�в\�g,�\�\�}U.�8@\�D�\ni,�\�\�S\��8@\Z\���d,�⏢\�\��8@P�,�c,���8�8@̶\�ֈ`,�\�N$�\�8@\r��\"\�^,�\�\�I\�8@�t\�y\�^,��p\�GR\�8@-\�(�Y,�\�6�\�8@f1���V,�T��7�\�8@oB@�T,�!�lV\�8@ZF\�=�S,�qTn��\�8@��\���R,�*�~��\�8@鹅�DP,�EKO\�\�8@��N]�L,�\�ͩd\0\�8@O�?�L,�\�y�\�8@�\�Q��N,��\���\�\�8@�u\�K,�6\�\n\�r\�8@bN\�&�G,�{1�\�\�8@\�n-�A,�\�%\�8@[]N	�A,�}\�\�z�\�8@^�\�I�<,�\�^zo�8@}>ʈ8,�w\��\�8@��<�|3,�v�|\�H�8@��`\�2,��a�1\�8@�\�o\n+-,���\�ǵ�8@&�fe�(,�:��KT�8@�\n\�$,����E�8@��q�\�,��f,�ξ8@#/kb�,�\�(߾8@��\�\��,��nض�8@\n�s\r3,���W�ѹ8@F}�;l,��5Y��8@�\�\�\�\�\0,�LnYk�8@�f�\\�+�\�a/��8@��a���+���O��8@\�%�+�H\�z��8@rѬ\�+��(�Ƨ8@?��\�+�=�;k��8@��I���+�77�\',�8@V��\��+�\�H��_�8@;�*�\0,���S\�\0�8@�C9\��+��uŌ�8@EKO\��+����%:�8@\�\�\�\��+�e�z�F�8@\�`\"\�+���\�FX�8@\�\�I�?\�+�u\0\�]��8@�e�I\�+�l��\�ڗ8@:\�S�\�\�+��\�\'��8@GZ*oG�+��\�\"�t�8@\��\'��+�ձJ陖8@\�9\�}\��+�G\�?�8@��g\��+�\�`\�;�8@Ѭl�+��h\�^�8@ȗP��+�Փ�Gߌ8@�l\\�\�+��\�u�+�8@~7ݲC\�+�36t�?�8@\�\\\�+�d\��ǆ8@\�\�`\�+���c�҃8@;oc�#\�+��\�솁8@ǜg\�K\�+�\�\�^z8@\�;\�\r\�+��`�d{8@\"ĕ�w\�+�<�\\�{8@\�i2\�m\�+����S�y8@!:�\�+�(֩�=w8@\�@1�\�+�GUD\�s8@jK\��\�+�:\�q8@\"\�Q*\�\�+�\�J\�.�o8@�9A�\�+�wLݕ]l8@7\�4D\�+�\�\�<�k8@%�c\\q\�+��jIG9h8@�6\�x\�+�}\\*\�e8@=c_��\�+�q:\�Vc8@ta��\�+���\�Q`8@�k$	\�+�L\�\�\�\\8@�Qԙ{\�+�8h�>Z8@��L/1\�+�|�8c�W8@y\r�\�+�zȔAU8@kb��\�\�+�`��V8@:τ&\�+�J\�>\�U8@m�Yg|\�+�Ւ�r0S8@~b�\�\�+�<K�PQ8@Z��\�+�\�f\�\�jO8@-`�\�\�+�\�m�\\pN8@\�d�\�+��(���O8@j� \�\�\�+�\�\Z�NQ8@\�ͩd\0\�+����)N8@�cϞ\�+�\���J8@\'g(\�x\�+��{\�5ZF8@;q9^�\�+�\�V�\�D8@��\�SV\�+����1ZC8@p�\�\�\�+�d���_=8@\n�]�\�+�kE�\�\�>8@�ĬC\�+�\Z��\�;8@\�GR\�\�\�+�!\�K�88@Ή=��\�+�\�\�\�;�58@����\�\�+��-</38@\����\�+�h\�u��08@\Z8\�\�+����3�,8@�\�Z\�+�n��*8@V�Z\�+���	�\�\'8@���^\�+�\�^���&8@\n\�\��I\�+�\�5Z�$8@�0�\�+��,D��!8@\"\�\�T2�+�\�\�_\�8@\�\�\��\�+��[\��\Z8@\�\�\��\�+�D�+g8@�_�L\�+�*�n�E8@t}\�+�1a4+\�8@xρ\�\�+��4\r�\�8@>Y1\\�+���S\�\08@�\�\Z\�*�+�`\�� 8@u\����+�]\�Fx8@�h����+��wJ8@�w*\��\�+��=Ab8@\�\��\��+�t�\�Y	8@��+�\�o�[8@2:=\��+�|\�o\�^8@\�\�C\���+�4.\�8@��QI�\0,�%�\�1\08@�\�\�,�\��l �7@�\�f�,�OWw,��7@��n\�,�L\�\03\��7@`X�|[\0,�;�I�7@��rf�+��[z4�7@\n��.\��+�\�\�\�e\�7@&\�\\R��+��^)\�\�7@�\�\���+�I��� \�7@\"rl=�+�?�=x\�\�7@o\�KS�+��1��\�7@뫫��+��xZ~\�\�7@r��>s�+�1\n�Ƿ\�7@�\�*�,�q��0\�7@b��\�\�,�5&\�\\R\�7@!sePm\0,�`?\�\�7@\�i����+��zܷZ\�7@s֧��+���Hh\�\�7@\�6�\�+�|ds\�<\�7@\�\�N\�\�\�+�EJ�y\�7@�噗�+�\'�Ҩ\�7@\��T\Z�+��jQL\�7@w�*�+�l��+\�7@	O\��\'�+�]o��\�7@�\��+�`��i�7@f���\��+�xF[�D�7@,\r���,����7@��Z`�	,��E`�o�7@=Y��,��D(b�7@	À%W,�rR��8�7@\�R#�3\r,�;�O\0�7@,Ԛ\�,�v\Zi���7@4\�\�yT,�?\�G�3�7@\����^	,�6u��7@���QI\r,��F\�?�7@f/\�,��(�Ɵ7@��\�\�,�\�m\�8�7@2\�m�\�,�\�0��B�7@V-��,�\�x�7@\�\�x\"�,��DK�7@9�t\�y,���\�ׁ�7@H�V\Z,�_]�Ő7@J+�,�Q��C��7@�Ø��\",�&7��5�7@�\'֩�%,�S�!�u�7@��7(,�jM�S�7@\���\�-,��ΤMՅ7@P@�\�/,��qS�7@U���1,�\�\�I�?~7@��|�3,�e���{7@@�t\�_2,�5*p�\rx7@d<J%<1,����t7@/6�1,���V\'o7@��\�\�3,�}�;l\"k7@\�\�Li5,�nh\�N?h7@��%\�8,��?���f7@�f\�=,���2�6d7@L7�A`E,��*n\�bb7@Hū�M,�\�2R\�`7@\�\�e6S,�cc^G^7@G\�\��U,�b�\�UY7@��\�+T,�\�r�V7@��ajKU,�>\�ɋT7@\Z�uT5Q,���T�R7@_	�ĮU,�i�QH2O7@�\�\�uS,�v�L7@j\�L�R,��>��K7@���pZ,��jf-H7@�U�\�6_,�@3�\�D7@\��\��],�(�\�v@7@\���o\�\\,��켍\�>7@4J��%a,�\�ݑ�\�<7@\�j+��e,�$a\�N\":7@�u\��e,�\�\�b�87@��9\�`,��Nyt#87@�\"���[,�o�[t�87@\�y�T,�M\�*��67@#�ng_Q,��B\�y�37@�\�>V�S,�\�\�=$|37@�W\�2\�Y,��n��/7@$�\�\\�[,�2r��/7@��|	U,��\�$��07@6\�D.P,�9\n327@K�|%H,�՗���37@o\�\n\��B,�\�0\�q67@\��@�m?,�y@ٔ+<7@��#�,,��M\�=�=7@0�^|\�&,��o�N\\>7@\�J=B!,���$>w>7@x~Q��\Z,���,�>7@!����,�\�+ٱ=7@�;l\"3,��S��Y<7@ }��A	,���>U�:7@�oD��,�(\r5\n97@�\��\�Y�+��`R||67@Fx{,�\�˶\�\�47@MLb�,��\�Y\�h17@�>U�\n,�Jy��\�.7@�\��,����)7@d]\�F,� a�\�&7@�|ԛ,�L�;��!7@H5\��\�,�t^c��7@LnYk,�j�WV�7@\n���1\n,��7h�>\Z7@4�9A�,�\�\�E_7@�e���+�X:�%7@,\�p�{�+�����S7@\�_w��+��6\�\�n7@�\�\"R�+�\�kA\�\r7@x\�W�f�+�E�A�7@%\�s}�+��\�_�57@#��ݯ,�x\�1!7@���\r,����\��6@��+���X6s�6@�++MJ�+��)ʥ��6@\�\�\"��+�\�|x� �6@)_\�B\�+�$��ŋ�6@�5Φ#\�+�z\�(�6@ɭI�%\�+�n\�\�)�6@\'3\�Vz\�+�_~�Ɍ\�6@M�Nϻ\�+���-Y\�6@O\�6��\�+�Z�wg\�6@1���\�+�?6ɏ�\�6@c`\�\�+��a���\�6@4d<J%\�+�x�\�\�6@��u�X\�+����\�6@{��\�w�+��i\�6@p�71$\�+��a�Q+\�6@�P�%�\�+�\��R\�\�6@f2\�g\�+�qx�\��6@\�\�-\�+�\�m\�8)�6@~�$A\0,�#�k$�6@N`:�\�\0,�^�9\�S�6@(�\���+��-X��6@�L�\�\��+�,��ŧ6@\�h\���+�I�\\߇�6@&U\�M��+��\�`�\n�6@�;O<g�+�Ze����6@c\�ZB>�+�\����6@�%\0��\�+�\�\�g#�6@��T�-\�+���@���6@2\�CP5\�+�$|\�oК6@	\�Vд\�+�\�DR��6@P\Zj�\�+��e�\��6@9{\�\�\�+�KW��x�6@G�ŧ\0\�+��nض(�6@!�1\�\�+�\�t\��6@YiR\n�\�+���v1͈6@j� \�\�\�+�\�7�{օ6@?�g͏\�+��ܶ\�Q�6@�G\�z\�+�$D���6@\�\�6�\�+�A\�!\0�6@�ԗ��\�+�A,�9$}6@�\� �r\�+�\�\�^(`{6@!\���\�+�\�y�\�w6@tB\�K�+�˝�`8s6@C �8��+��o�>;p6@�t\�yƾ+�!\�\'\�>m6@\�HLP�+���\�f�k6@\�s���+�u\�\�pj6@��\�Y��+�ke\�/�g6@�j\�+�\��9̗c6@���\��+�tD�K�_6@*S\�AЩ+�\'\���\\6@��+��|A[6@�Ơ+�Z�wgY6@��\Z/ݜ+�\�\�]\�W6@&6׆�+�\�\�\�\�R6@�d�\�7�+�m���5O6@;TS�u�+�|c\0�M6@\"9��U�+�n��\�K6@=�Е�+�7l[�\�H6@?�=x\�+�f��\�E6@\�C6��+����WC6@Wzm6V�+���\�\�\�=6@ސFN~+�U���*;6@\���\�}+�^0�\�66@���߁+���};�46@�KR�b�+�@�dȱ16@_\�\�W�+�ɫs\�.6@}#�g]�+�\���s+6@5\'/2�+��a��\�(6@�	g���+�\�/�1\"%6@\r�a���+�+\�]gC\"6@̷>�7�+��i�{�6@l���P�+��:M�6@\r5\nIf�+�\'L\�\�6@\�d�+�\�ƻ#6@{���+����6@�x��M�+�\�\�\�+\n6@u \�\�+�x�\�6@Y�\���|+�At\�6@J�\�\�x+��Q\r�=6@�\�\�s+�QN����5@��P�vp+�gs��5@��cm+�q\�-\��5@��\�3.l+��c�=	�5@\�H��rj+�?�\�\�\��5@�w\�\�\�*��_�\��5@Y�O0\�*����\��5@�)\0\�3\0*�\�\�^\�6@)����)�|\r�q�6@��H�\0*��\"�ng�6@�լ3��)�\rU1�~\Z7@�?Pn\��)�\"\�Q*\�7@�U�P��)��wD�\�7@uw�\r��)�i\�G5\��7@z���\0*�\�ZC��8@\�!\���)�&U\�M�\r8@\�\�z�V\0*��]�9\�8@�Gߤi\0*�Ot	8@�\�Д��)�#�\��8@�\�(��)�S\��F;8@g����)� �_>Y\r8@�G��\n�)�1��B\�\n8@@���\��)�%\�YI+\n8@\�,^�)�32\�]�	8@/�HM�)�6#�\�E8@p_\��)���x\�8@tF��\�)�u�l��8@�.Ȗ\�)�g�ܶ8@\\���4\�)�FИI\�8@S?o*R\�)�FD1y8@�[Ɏ\�)�ß\�\�\Z8@f�YJ�\�)���g�\�8@\r�~1[\�)��B˺8@VIdd\�)�CV�z8@]��\�l\�)�\�eM,�8@G=D�;\�)�ʊ\�\�\08@\�\��f\r\�)�-\�i��8@+Kt�Y\�)�h?RD�8@%;6�\�)��cyW=\08@���4c\�)�5%Y���7@�\�\�\�\�)�F^\�\��7@tѐ�(\�)�Mh�XR�7@���\�)���ɩ��7@C��\�\�)��s��7@\�c�g^\�)�\Z�K���7@\�E\�~\�)��^EF�7@J]2��\�)��RE��7@�\� >�\�)��\'֩��7@(__\�\�)�MHk:�7@9Dܜ\�)��\�鲘�7@�\����\�)��z���7@�\�מY\�)�A-\��7@�\"h\�$\�)�:?\�q\��7@[�\0m�\�)�cԵ�>�7@�n�l\�)��.\�\�[�7@jh�\�)�����7@\\X7\�\�)�\0\�	��7@d\�]K\�\�)�\����\��7@S\�G\�)�`r�\�Z\�7@�I)\��\�)��5Y�\�7@��=\��)��\r�\�\�\�7@��k�6�)�\�\��\�7@�Uס��)����n/\�7@���&��)�\�\�~��\�7@�%�L1�)��\n�7\�7@�O7P\�)��,g\�7@ϡU1�)��Sͬ\�7@Z.��)�\�/fKV\�7@�в)�\�L\�\�7@�\�C\0�)�1~\Z�\�\�7@*��%\0�)� ��c\�7@\��c��)��]\�pX\�7@-_�\�?�)��e\�?\�7@��\�\�}�)�Y|E\�7@�ڋh;�)�r\�)�\�7@σ��v�)�&�fe\�7@5z5@i�)�y �H\�7@\�|�R�)�\�t��.\�7@������)�f��C\�7@��(	��)�J~įX\�7@�f�\\�)��H�]\�7@\��\����)��\'eRC\�7@�\�\�V\�)��\�\�\�\�7@��L/1�)�$*T7\�7@B\'���)�K��F>\�7@�%s,\�)��l�\�7@%\�/��)���2�6\�7@{h+��)�\�$��\�7@�\�@,��)�\�WXp\�7@\�\"����)�jj\�Z_\�7@\�A%�c�)�f���-\�7@H3Mg)��\�`\�>\�7@�A]�P~)�rݔ�Z\�7@z\�}\�\�|)��#\�w~\�7@*\��\�O{)�\�\�\�y7\�7@��p\�qw)��<I�\�7@I�,|}u)�E\�[\��\�7@�\��o^t)���W�<\�7@��h�\'s)�!XU/�\�7@�\�\�q)��\�QcB\�7@���?o)��X�\��\�7@�D��m)�#���\�7@\ni�A\'l)�YO��\�7@�@��_h)���\�<\�7@yY|e)�>ʈ@\�7@i��Uc)�!撪\�\�7@�\�X�_b)�ݴ�!\�7@g�lt\�_)��K\�^\�7@�\�d\�VY)�!yv\�7@BҧU�W)�t�\�7@��ᱟU)�L5��\�7@Xc\'�T)�\��\�e�\�7@ʇ�j�R)�*q\�\�7@�\�&2sQ)��\�\�\�\�7@��tN)�E\���J�7@�\�{\r�I)�G\��\��7@�+jH)�T�D\�[�7@st��E)��\�#\rn�7@�\�VCB)��o\'\��7@��6\0@)�<O<g�7@E|>)�����7@��jׄ<)���b��7@�\�I`;)�\�R�7@\�D��2:)�vS\�k%�7@m�\�<+9)���oa\��7@�J\�6)�\�\��\�$�7@�A\�\�5)�T��~�7@�\�6o�4)����7@��\�\�\�.)�,�z���7@�E���,)�R��/I�7@n���))���};��7@r��\�\')�\r\�\��7@rR��8#)��y��7@H���� )�\�0\'h��7@��N\�)�\�\�\\5�7@~\�$\�)���e��7@�\�?k~)��g%���7@�\�2R\�)���)\"�7@\�u��X)�ۉ��H�7@\�7i\Z)��\�#��7@���)��_����7@���~3)�w�ӂ�7@d]\�F)���t�i�7@�����)��\�z�2�7@s	\��)��K�K\��7@b�A\n�\n)�^emS<�7@8��\n*\n)��(^em�7@{\�v\�\Z	)�\�\r0��7@��0	)�$\�@��7@\�@�m)�v28J^�7@ *��\�)�\�C6��7@\�\�\\5)�,cC7�7@9\'�\�>)�<l\"3�7@��Yh\�)�;V)=\��7@�={.S)�����7@\"\�k^\�)�J|\���7@P��ô�(�\�Fu:��7@\�i����(�\�(\�\'�7@\� ���(�V*���7@�{b��(�\�\�A%��7@C��\��(�K\�ó8@�K��$�(�d\��8@���tw�(�LqU\�w8@j\��\��(�\�ܴ�8@\�6\�^�(�����8@�]/M�(��̔\�\�8@�\�bE\r\�(���m58@\0\�]��\�(�\�\\\�	8@P0�A\�(�n���8@Y��Z�\�(�\0kծ8@OqN\�(��\�LM8@|_\\�\�\�(�����8@�/L�\n\�(���q�8@��9\\�\�(���QI�8@\�e\�-\�(�yGsd	8@\n�g�\�(�ȕz�\n8@����G\�(�\�\��8@Ãf׽\�(�D�\�\�\�8@�4f\�(��U���8@[Υ��\�(�	ސF8@\�:��\�(��\�{�E8@B[Υ�\�(�֌r8@�k{�%\�(����T�8@;ǀ\��\�(�w��\�8@膦\��\�(��G8@\Z�\�)\�\�(�s�4�8@)\�\'�$\�(�Y\���8@GT�n.\�(����\�M8@\�($�\�\�(�\�ahur8@W�\���\�(��d=�8@�\�\�c\�(��?4�\�8@���	.\�(�����]8@\0A�\�(�vk�\�8@ѓ2��(�N\r4�s8@\�w��(�\\:\�<c8@�y��C�(�m�Yg|8@t\�\�q5�(�^�zk`8@hz��L�(�ɫs\�8@1[�*µ(���ɩ�8@�� %�(��(�\�8@\�o\�DI�(�\���8@�ؙB\�(�u�)\�\n8@��\���(�b���8@j�\�\�(��HP�8@�4\�(�(�L⬈�8@�\n\�b�(�\�2��8@t^c���(�T�J\�\�8@P�D��(��\�A�8@3\�,%ˑ(��:�p\�8@0�1\"Q�(�p\\\�M\r8@&p\�n�(�L�{)<8@J\�ʽ��(���\�8@`���(�9\�\�8@V\�\�\�4�(�~�\�ŉ8@��\��k�(�a�X58@p]1#��(�(��я8@*\�#��(��\�J#8@��E;�(� \�E\ne\r8@[A\��(�ܛ\�0\�8@�\�\�Ӂ(���u?8@.\��(�\�2�\�8@�\�\�}(�\�\Z���8@�\��|(�cB\�%U8@R\�>\�G{(��\���\�\n8@��a�y(��\�VC\n8@$	\�Px(�up�x	8@K��v(�F|\'f�8@U�\���t(��\�\rx8@\0�={.s(�\�W\�\�\�8@؛��q(�V\�pA8@Y��L/q(�� =E8@�{G�	q(�\0t�//8@![��\�p(��[t�\�8@�O�mp(�	�c8@L\�[\�\�n(�#K\�X\�8@�����m(�/i�\�Q8@�\�\r�:l(��)\� \�\08@�쟧k(�\�~K�\08@6�o��i(��\�\��7@7¢\"Ng(�\�y���7@/�He(��!�uq�7@��u�`(�0�\�mP�7@.\0�ҥ_(�q\�i\��7@���@�](��vR~�7@�z2�\�[(�\�Z|\n��7@j��%Y(��(\�\�=�7@\�\�G\�W(��\�\�&\��7@d\��uV(�f���~�7@�tZ�AU(��v\���7@��_c$(��=�N��7@�:r�3\0(��/��\��7@f�y��\'�A.q\�\08@иp $�\'�܃�/8@y:W��\'�Z\��88@K��\��\'��d9	�8@��ݒ�\'�q\�q�t8@W`\�\�V�\'�x\�g�8@;\�zj�\'�L�4�\�8@�$�z��\'��J %v8@Uj�@+�\'�\��(�8@���r��\'�`r�\�Z8@AEկt�\'�!Z+\�8@P�\�͜\'�Y\�+��8@c\0�=�\'���J�\�8@]6:秘\'���ѫ8@��8a\'���|г8@	kc섏\'�\�\�\�\�\�\08@H�]ۋ\'��\�W8@���[�\'�rS\�\�\08@;�\�\�.�\'�I�0e\08@\���͎�\'�|��\��7@Q1\�߄�\'�a�HZ�7@�Lh�Xz\'�`��\��7@t	�\�r\'�\�@�]��7@(�$\�q\'��ݭ,\��7@��\�g�o\'����7@��Àm\'���GS=�7@}Xo\�\nk\'�T5A\�}�7@\�\�\�Yi\'���P�B�7@T�^\rh\'���\�\��7@tѐ�(e\'�\�\��7@\�\�%ǝb\'�\�)\�\�F�7@|\'f�b\'���\�\��7@X:�%`\'�u!V��7@�\�\�\�[\'�����.�7@v�uŌX\'��o�>;�7@�L2rV\'��S�D\��7@�&�fU\'�\�~���7@6�.6�T\'�DOʤ�7@\�{��R\'��G\Z\�\��7@\�c?��P\'�g}\�1Y�7@��\�\�N\'��L�T�7@xb֋�L\'��n,(�7@�t[\"L\'���H\��7@\��\�d�J\'�\�f/�7@�\�rI\'�__\�R�7@�D�\��F\'�\�\�Sr�7@�\�\�ABD\'� \r�\�\��7@u\�B\'��\�\�K��7@=\�බ@\'�\�R$_	�7@�ͪ\�\�>\'��\�\�E&�7@����=\'�	�=b�7@=��+<\'��G\�z�7@�u7Ou8\'��O�e�7@�Z\�Q6\'�\�*�)\08@	]\�4\'�W\"P��\08@�Hi6�3\'�\�&1�\08@���z0\'���n��\08@���U.\'�z�\�w)8@xE�,\'�\�\�\��8@��c${,\'�F\�W\�\�8@	À%W)\'�\�\���8@Gx$(\'���\�Xl8@rp\��$\'�\�oB8@�\�I�\� \'�?W[��8@���O�\'��t&8@o��;�\'���\��Q8@d#�\�\'��qS8@줾,\�\'�a�X58@F}�;l\'��i�\�	8@�@ C\'�`�\�\�	8@ĳ\r\'�\�\�\��	8@\�\�W;�\'�S��	8@5\�\�	\'���\�T�8@$+�\�\'����J8@\�\��\�\'��\\�gA8@\�Χ�\'���	\�y8@*\�J=\'�zrM�\�8@F\�=�\��&�w�\n�\�8@9(a��&�I\�\�\�8@\n��\Z�&�B��8@s���\��&�\�P�n8@�\0n/�&��\�.4\�8@\'�;�&�\�zj�\�8@;\�\r��&��.Ȗ8@&�\�:��&��\�O\�8@�\�g�\�&��@�8@��1z\�&��6\��8@Fx{\�&�����8@sJ_\�&�Φ#��8@\�\�_Z\�\�&�\�H�F�8@\��d\�\�&�����O8@ӈ�}\�&�\r�Q\�8@�?N�0\�&�\'�\�Q�8@/�\�|\�\�&���0E�8@\��ǁ\�&�Nd\��8@�|zl\�\�&��:\�\��8@\�v�\�&��T\�z\r8@��Kǜ\�&�����c8@\�W�\�\"\�&�\�\�\�8@,Ԛ\�\�&�h͏��8@6t�?P\�&��&P\�\"8@+�@.q\�&�<�D8@�_��\�&�\�\Zfh<8@HN&n�&��\�[X78@\�>\0�M�&�\0�d\�F8@T�<�&�\'K��	8@:\�\�Y&�\Z�[ A	8@B͐*�W&�	\Z3�z	8@�w�WU&����p�	8@{g�UIT&�H\�\�\�\\	8@&P6\�R&�\�س\�2	8@!>�\�P&�&:\�,B	8@}\�\�z�N&��lt\�O	8@\�n��M&�Z\r�{,	8@�z��K&�=�+J		8@��0BH&��G�`8@J�O\�cF&�5B?S�8@h?RD�E&�ԙ{H�8@עh[E&�&���8@D6�.6E&�\�J!�K8@��2\�D&�\�	�8@l	��gC&�e5]Ot8@?�Ң>A&�\�=@�\�\08@����=&�\�}\0R�\08@Vb���:&��b*�\08@�\'-\\V9&�!:�8@�#*T77&��DKO8@�?x\�5&�\�E&\�\�8@�BX�%4&�\�n-�\�8@|Bv\�\�.&�NG\07�8@:�w\�&&�_~�Ɍ8@\�w��$&�\'���8@0c\n\�8#&�X<�H�8@��j\�\�!&�-�\�DJ8@�\�\��&���\�J\�8@��I�\Z&�9��!8@��l\�&��3�\�8@9\�Cm&�5~\�$8@?V�\�&�dZ�\��8@��k	�&�S#�3�8@4���&��h\�8@����&��$z\�8@R��8\�&�Q�f�8@�?�Z�&�DOʤ8@��m��	&�A�mߣ8@zn�+&�*\�t��8@\n�\�&��%�L18@j1x��&� ��h�8@\Z1�\�c&�S�\�\�t8@2\�CP5&�N�f�8@[}uU��%�{.S�\�8@\�\�\���%�g\�\�j+8@\�Sr3�%�\�SW8@\�O9&�%�fI��Z8@6�>W[�%�~8H��8@����\��%�\�Jvl8@Pō[�%�\�s}8@��66�%�?�{�8@�2\���%�\��\�8@�\�d�z�%��\���,8@\�\�\�%���,�8@f�y��\�%�\�<G\�8@F\�@1\�%��m��8@�5_%\�%�~��k	8@]n0\�a\�%�φ�3�8@�\"���\�%��j�38@K\0�)U\�%�>��j�8@ �+\�p\�%�B>\�٬8@z4Փ�\�%�0J\�_\�8@�wg\�\�%�x	N} 8@\�}9�\�%�Ct	\08@\�v�\�%���f�7@:\�\�\Z\�%��t�7@\�X\�\�%��,`��7@�Σ\��\�%��͎T\��7@�6\��\�%�E\���J�7@��\�%��\�/-\��7@�,\�}\�%��o����7@�ڧ\�1\�%�\�R�\08@\�\�zi�\�%�#�	�8@�\rLn\�%�t\�\�gy8@�I��4\�%�v�\�\r8@�\�LM\�%��/ע8@\'1�\�%�\�G��|8@-@\�j\�\�%�\�*q8@A�,_�\�%�F�6�8@��[\�d\�%�we�	8@ |(ђ\�%��\�`ũ\n8@��L�\�%�\�Q\�8@�k|&�\�%���B\�\�8@\� >�\�\�%�3�p�a8@i\�V�\�%��%��\�8@p$\�`S\�%�\�ۂ��8@FzQ�\�%���!�8@�ΡU\�%�\�\��8@\�\��m\�%�p_\�8@�\�5|\�%�%�S;8@\�r.\�\�%�u/3l8@UMu\�%�wH1@�8@�-\�l�\�%���%VF8@�a��m\�%�1|DL�8@�Cn�\�%���0E8@<�\\�\�%�d?��H8@O�C\�\�\�%�؟\�\�N 8@\�;�_\�%�X��\Z!8@p\�4(�\�%���\��\�!8@�wJ\�%�\�\�E_!8@�Z\'.\�\�%��.9\� 8@:;%\�%���\ZO 8@\r\�-��\�%���։8@O\���\�%�Xq��08@Ő�L\�\�%�\�V�\�,8@!ɬ\�\�\�%�\�\�9d8@\�\�rg&\�%�5��\�8@��\Z\�%�I�Ǵ6!8@DkE�\�%�L8�!8@�\��R\�%�F}�;l\"8@��Z}u\�%�ǟ�lX#8@}\�1Y\�\�%��g\�,#8@�d=��%�|�?mT#8@裌�\0�%�����#8@=�;k��%�&\��|$8@�.\��%��,\�\�;$8@�a�\��%��Bus�#8@��ѫ�%�\0�vi#8@h[\�:�%���ؖ#8@�\�\��%��Gp#e#8@��\�g��%�r��\�#8@�Z�kB&�6\�\�x\"$8@J�\��&�e�<\r$8@��X&��c\�]K$8@��-�v&���;\�$8@\�_YiR&�o�ŏ%8@O]�,\�&���\�s&8@\n\�F&�^K\�=\'8@\� Z+\�&�>v()(8@�Ց#&�\����4)8@R臭�&�p@KW�)8@\�y�\'&��I�2*8@\�G�3�&�\Zj�\�*8@�\n�l&�ū�m�+8@�p\�i\r&�i\�x�J,8@gHū&��\0Ϡ-8@\0�vi&�i��T.8@��\n&�?�=x\�.8@E\�[\��\n&���E`�/8@\�8�	�\n&��\�\'�b08@D?�{&�\��\�08@�\��\\4&��k$	\�18@W\�\�m\r&�\�5�\�28@A	]&�����)38@5D�&��&��\�38@\�\�P1\�&��\'�.�48@\�T���&�$�\�;\�68@\�Ue\�&��\n��98@���\�&�\�\�\�	;8@ܹ0ҋ&�)	���;8@\�A��&��N�Z\�;8@g`\�eM&�\�a��<8@r\Z�\n&�\�7L4H=8@\��b\�\�&�wj.7>8@#�qp\�&�EH\�\�>8@_zo&����?8@s�\�c\�&��O\�I\�A8@�\rND�&��\�r��B8@�\�j�=&�j�֍C8@Mh�XR&�\�7L4HE8@z\�΅�&�cD�\�F8@Rb\��&�u�l��G8@�R\�&��\�%�H8@�<�;k&�R\�\��TI8@�rf�B&�\�\��I\'J8@\�O\�\��&�ٗl<\�J8@�\�&N&�5%Y��K8@�	�ʼ&�\�˙\�\nM8@yGsd&��k\�\�M8@\�\�%&��\�\�ON8@�\���&�dZ�\��N8@^�?��&��!q��O8@D��)&���h8Q8@� =E&��\�WWR8@\�\��R�&�䠄�R8@�Fˁ\Z&��Ŋ\ZLS8@�D��\Z&�n5\�\�S8@�P�\��\Z&�\�q\�j�T8@�*P��&��\�e\�U8@:?\�q\�&��7UV8@�=^H�&�&ǝ\��V8@�$� &�P)��W8@\��\�\"&�w;S\�X8@��6\�4$&��}sY8@\��\�O%&�AEկtZ8@ձJ\�&&�C��g[8@\�xy:\'&�\�>\�\�[8@+�\�p\�\'&�\�N^\\8@A�;(&�c�\�^\']8@Q���(&�\0u\�]8@~��k	)&�\�i���^8@^�\�6S)&�\�\��_8@��{G�)&�\�4a�\�`8@\�\�U++&�qX\Z�Qa8@�E�\0.&��[�va8@�\�\�./&�=\�!7\�a8@/�.\�0&�\�;��Jb8@�\�k�1&���pzc8@x�\�2&�\�3/�\�c8@�\�M\�\�4&��F\�\�c8@w�\r�g6&��\��\�Yc8@[y\��\�7&����(\�b8@a\��p9&�6u�c8@/3l�=&�M\�~2\�c8@mq�\�d?&�XY\��c8@�\�\riT@&�P�}:c8@��S�C&�%�\�1 c8@o��ܚD&�s\��Ac8@\�(\�F&�f/\�Nc8@��q\�@H&�r\��\�	c8@\�o�h�J&�_\���b8@�]J]2N&�2Ƈ\�\�b8@��d9Q&��1�#a8@A�>\�T&�;�\�u`8@Ks+�\�X&�A�w�\�a8@\�SUh ^&�:\�S�\�b8@�\�˶\�^&�E�>�c8@�\\�gA`&�9��\�d8@�Z�\�a&�����Ue8@ޓ��Zc&�$��\�9f8@Y��\�e&�`̖��d8@1[�*r&�\Z\���d8@�\"���s&�C�B�Ye8@.\�;1\�u&�g�\�f8@w�\r�gv&�\�\'+��g8@�֦��v&�a�X5h8@j�t�x&���2\�h8@�	M{&��Ƥ�g8@#�-\�R|&�R%�Sg8@z�I|\�|&�w�(�f8@�\�O8�}&�\�@�w�e8@^H��0~&�80�Qde8@z��Q�~&�-e8@ |(ђ&�I�,|}e8@��\�̓�&�I�pf8@^ؚ���&�\�\�\�2f8@1	��&�k�\�=e8@m�\�p�&��hs�\�d8@_\����&�\�Y-�\�d8@F��0�&�\�\Zfhd8@\�\�\��&�gb��c8@F\�j��&�U�g$Bc8@3\�x�&�\\�=\�b8@�\�\�u6�&�QN���b8@\"8.㦖&�v5y\�jb8@=�Е�&�o�\�Iab8@ۥ\r���&��Ma��b8@�t�(%�&�,(\�4b8@cC7��&�2�g�oa8@f�2�}�&�}w+_8@�\�捓�&��K⬈^8@��v\��&�}�͍\�]8@�-\�R\\�&��U\�p]8@��,�&�\�э��\\8@\�\���&��e�I)\\8@��\�ȑ�&�\�F\�\\8@�qSͯ&���r�\�[8@ŭ�\�&�Rb\��Z8@�\�<+i�&�\�\��6�Y8@^�9\�S�&�d�\�TkY8@`tys��&�u\�8F�W8@z\�0\�&�!�\�\�V8@�dV\�p�&�.u�׃U8@�@���&��?��wT8@��]L3�&�����)S8@�q\�@H�&��\�l�Q8@<���	�&��xy:WP8@�T����&�֍wGN8@��i�{�&���ᱟM8@qN`:�&�an�r�L8@���T��&�\�o{�\�J8@�\�s���&��B\�I8@\\�z��&�7�A`\�H8@{\�\��&��c\\qqH8@:ZՒ�\�&�3�`�G8@.s�,&\�&��>\�6I8@AJ�\�&�F�G�J8@!\"5\�b\�&���\�\"K8@����4\�&�=ԶaL8@ꕲq\�&��\���M8@�V{\�\�&�X\0SN8@\�\� w\�&�\�K�\'O8@�@�\�\�\�&��lXSYX8@\�\�@\�S\�&�kծ	Y8@W#�\�&���@g\�Z8@���W\�&�\�ͨ�Z8@^�\��\�&�\'OYM\�[8@\�Ȯ��\�&���ek]8@�\��\�\�&��\�\�^8@�%W��\�&�_ѭ\��`8@C\�up\�&�vl\�ua8@)\"\�*\�\�&�\��\�\r�a8@�\�oB\�&��jׄ�b8@YL�\�&�b�Q+Lc8@m\�\�~�\�&��\�\�\�c8@�U]\�&�f�y��d8@qh�.\�&�0.sf8@\�Tƿ\�&��J\"� g8@�U���\�&����\�g8@:\�\�\Z\�&�@�#H�h8@\�\0��F\�&��^\n�i8@��	\�&���\�h\0k8@ŬC9\�&��Y�wk8@\�\�U+\�&�j���k8@`��i\�&��\�\"M�k8@�Q\�\�\�&�?\�ܵ�l8@��v�\n\�&��|гYm8@t|�8c\�&��L2rn8@��Co\�&�s�69|n8@\�\��r-\�&��[!�\�n8@G:#/\�&��8ӄ\�o8@j\�L�\�&��\�Y��p8@j�\�h\�\�&��Ց#q8@n�ݳ\�&��\n\�r8@0/�>:\�&����\�r8@�_w��\�&�EKO\�s8@��P\�\\\�&�З\��\\t8@�jf-\�&�\�镲u8@\n\�F\�\�&�!%̴u8@߿yq\�\�&��;���w8@>��j�\�&�1\�\�Zy8@�B]\�&��>�y8@\����\�&���o��z8@�%s,\�\�&��;2V�{8@\�Đ�L\�&���!�\Z}8@\�y�t\�&��0E�4~8@\�=yX�\�&��\�NG�8@y\�Տ\�&��\0�6q�8@�L�T\�&��5\"�8@J\�ʽ�\�&��\����8@\�e\�ik\�&�Օ\��<�8@��[\�J\�&��=b�8@QO�?\�&��\�V��8@\�h\0o�\�&�\�\��UG�8@ �O�\�&�\�6���8@LnY\�&�T\�{F\"�8@x�ܙ\�&��\�k\��8@��<e\�&���tw��8@\�\�\�\�&�%\�pt��8@\�^�\�&�\�.�u��8@%̴�+\�&�\\Z\r�{�8@�n,(\�&��ƈD�8@&���\�&�\�$���8@|\�ƻ\�&�]5\���8@\�Y�N\�&�OGɫ�8@�l ]\�&�\�q�Pi�8@0�AC�\�&�Yk(��8@�E\�T�\�&���\�8@	�c\�&�-C\�\�8@8>[\�&�V-���8@yZ~\�*\�&��~31]�8@8���\�\�&�R臭��8@�~�:p\�&��\"\��8@��a\�&�\�\Zٕ�8@[%X\�\�&�{\�\�ɖ8@Ҫ�t�\�&�\�\�\�ז8@h �\�\�&��g%���8@�\�9\�\�&�T��b�8@p(|�\�&�	m9�\�8@���\�Z\�&�M,�ݖ8@\�i��&\�&��$]3��8@}	^\�&�T� �!�8@�.R(\�&�2\"QhY�8@�\�O8�\�&�c\�=y�8@6!�1\�\�&�fj�!�8@\0�)U�\�&�\��\�	�8@� \�&�t	�ޚ8@\��\�w\�&�Sx\�캛8@�\�H.�\�&��x?n��8@��·g\�&��@+0d�8@����!\�&��[\��8@Q��B�\�&�e�I)\�8@%���\�\�&���>s֟8@�kЗ\�\�&���\���8@���\�q\�&�\�8b->�8@+\�]gC\�&�\\�-\�ס8@y$^�\�\�&�\'����8@�شR\�&�=HO�C�8@�%s,\�\�&��i�{��8@ǻ#c�\�&�\n�����8@2�\�l\�&�\���\��8@sg&\�\�&��L�J�8@\�\�\�׺\�&�U\�#���8@��f�\�&�\�&S�8@����\�&��\�\�\�o�8@^��\��&���\�§8@t_\�l�&�&7��5�8@����&���F�0�8@]\�Fx�&�W|Cᳩ8@7\�^���&�k����8@/\�H��&��W zR�8@_a����&�LP÷��8@\�\���&�,�\�N�8@O�o+�&�#����8@s\�<G\�&�iƢ\�\�8@0��\��&�J`s��8@+\�\�6�&����e�8@M֨��&��$@M-�8@�B�\�&�5��ү8@�[w�T�&��$\�\�I�8@k(�Ѯ&�?ư8@)Z���&�`!seP�8@�	�s\r�&��:pΈ�8@��lXS�&�-$`ty�8@�\�oB�&�\�K��8@\�\�V%�&�Vdt@�8@���Hۨ&��(z\�c�8@���w��&��m�\�E�8@0�AC�&�c\� \�\��8@\�\�I�&�MLb��8@�n����&�h\�u���8@��#��&�\�X�Ѽ8@�ɍ\"k�&�\��c!:�8@@�\�ߤ&�Z�H�s�8@�;\�䷠&��ٮ\��8@p\�\�;�&�1е/�8@9\�)9\'�&�<�2Tż8@v��ݰ�&�ԀAҧ�8@%A�\n�&�2\�\�A�8@p��\�$�&�\�l\�%��8@x\n�RϚ&�1|DL��8@/��\"j�&��\�D-\��8@{�/L��&����խ\�8@����&�Ҫ�t�\�8@\rP\Zj�&�L4H�S\�8@��\�~ݙ&�e\Z\�8@�8�t̙&�{m\�\�\�8@!t\�%�&����M\�8@a\�9͚&�Kr��&\�8@>[�&��w\r�\�\�8@�J\\Ǹ�&�\�\Zfh\�8@/��\"j�&�[|\n��\�8@�\�ǵ��&�\�&jin\�8@�CR%�&��y\�\�8@\�\�ECƛ&�z��Q�\�8@�\�?k~�&�G�J�\�8@����\�&�|&�\�i\�8@�x���&�dv�S\�8@\�\"���&�\�\�C\�8@J/��&��\�\�\�8@/\�\�0�&��+�j�\�8@�\�\�\�/�&��\�#bJ\�8@o\�\n\���&�fj�!\�8@\rP\Zj�&�Ad�&\�\�8@Y\��\�F�&��\�ң�\�8@v\�[���&�d> Й\�8@/�HM��&�\�qs*\�8@h���&���n\�!\�8@��_>�&�\�M\�\�\�\�8@q:�&�5\�\�\�8@\�M֘&��S�D\�8@kc섗�&�	�\�\�\�\�8@D3O�)�&�3�\�V\�8@��\�`Ė&�\�v�\�8@\���f�&��E\�\Z\�8@�q���&��I�\�8@`��-�&�Vb���\�8@N`:�ې&�F`�o`\�8@I\�L�َ&�\Zl\�<\�8@q�\�i�&��L�J\�8@g&\�5�&��\�n�o\�8@(ђ\�ӊ&���?�\�8@A�v�&�\�\�j+�\�8@�U\��&��J�\�8@|����&��*\�3\�8@\�J=B�&�$F\�-t\�8@\�\�k�&�\re�f\�8@�\�\���&�(b\�\�8@\���|͊&�����\�8@��H��&��w�~\�8@$����&����\�\�8@\�\���ތ&�\�_YiR\�8@R\�\�\�\�&��?\r\�8@\�t\�\�&��\�\�m�\�8@^��yȌ&��z\�\�8@<��\�܌&�S�!�u\�8@ٓ�\��&�\�\��\�8@�c${��&�ҏ�S\�\�8@��7��&�\�\�m��\�8@�\��ӆ&����U\�8@b�1\�\�&�m�_u\�\�8@\�\�\��6�&�sg&\�\�8@6\��\�Ą&�HP�\�8@\�_!s�&��3Lm�\�8@��^a��&�\"O����8@�M�W\�&�U2\0Tq�8@Y�\�+��&��i3NC�8@\�t!V�&�XU/�\��8@�eN�ń&�\�\�\��@�8@]\�\�7��&�<3�p��8@+\�]gC�&�_$�\�\\�8@t�//��&�\��?���8@]�P��&���|	�8@�@��&�/N|���8@\�\�\�n�&�*\� \�h�8@.Ȗ\�&��b(\'\��8@� ��&�3�<Fy�8@\���0�&�0)>>!�8@����&�ک�\�`�8@\Z����&��0ҋ\��8@��𽿁&���}q��8@x�\�x[�&��\�`\��8@��\0�6�&��\�\'c|\09@!\����&�\��H9@Ec\�\�l&�{�\�\�9@]�gA(&�1^�\�9@L8�&�B͐*�9@�.\�~&�\�\"�9@\�X�_\"~&��A\�<�9@�g��}&���?89@$^�\�}&�\�W)�9@֧�\�}&��\�>V�9@n\����~&�\Z\���9@ŏ1w-�&�P�,�c	9@=|�(B�&�,�-X\n9@��y\�)�&��7N\n�\n9@7�\',�&�t�?Pn9@>�\�@�&��\�B\�\�9@DܜJ�&�}\\*\�\r9@U�]�&��l ]l9@��F\�&�\n�\�9@/2�F�&���͎T9@\��9#J�&�!\�\�*�9@���)��&�Rew�9@\�{L��&�cԵ�>9@��7/N�&�b�1\�\�9@�\����&�\�el\�9@3m�\�J�&���^�9@���;��&��\�99@b\�c�&�\Z�d9@n����&��F\�g\�9@��Ss��&�?V�\�9@����u�&�Ve\��9@ |(�&��\�y�9@�\�ȑ΀&�ΎT\��9@kծ	�&�h#\�M)9@A�\"�&�����9@w0b�\0�&�MJA��9@\����&�oJy��9@��\�\�́&�]\�E\�9@4�27߀&����x9@9�\�v�&�__\�R# 9@�\�Tka~&�8\�ܘ� 9@��W��}&�m\�\�]\�!9@%�|&��y�Cn\"9@��r�|&�6\�u\�!#9@��3ڪ|&�J�i�#9@P\Zj�|&��\� ��$9@٘\��|&�X\�\��%9@��\�<{&��[;Q&9@�?N�0z&�\�\���o&9@ލ�Ay&�\'�%\�\�\'9@ܜJ�z&��\�\�w�(9@\n�8�z&�t\�v�4)9@}\"O��y&�,�z��)9@$\�`S\�y&�W#�\�2*9@N~�N�z&��vKr�*9@\'�Wz&���S\�\�+9@�[\�Jz&��\�%�,9@\�%jz&��v\��-9@y�	�5z&�^\�\Z�.9@c\�\�K\�y&�QL\�\03/9@�$Ί�y&�,\�\�/9@\�u\Ziy&�z719@\�S[\�x&��\�@,�19@F_A��x&�7U�\�\�29@&o��\�x&��\��39@��F!y&��C�.49@幾y&�z\Z0H�49@\�4}vx&�\��yS59@7�Ӂ�w&��H0\�\�69@&8��\�u&�[�kBZ79@yx\�\�u&��\Zg\�89@�^\n�u&�ddY099@W\�\�mu&�$\n-\��99@kD0.u&� �\�;9@v��=t&��A\�f\�;9@�wF[�t&��U��y<9@��y\0�t&�q\�\�\"=9@�\�\�O\�s&��k\�\�=9@��I�r&�5\�\�=9@l|&�\�q&�\�\�(]>9@7\��\�q&�rl=C@9@�t><Kp&�\�:�\�@9@75\�|n&�\�}9�]A9@\� !\�l&��\�\�iB9@\'��k&�\�\�z�pD9@\�a�\�k&�BZc\�	E9@\�\�D�kk&�[�\Z��E9@�F\�j&�W\�oF9@$�]J]j&�N\�=��F9@{��i&�^K\�=G9@�\�BW\"h&�=��\�H9@*\0\�3hh&�\�\�KI9@�Z}uUh&�gDio�I9@���\�g&�\�\�1\�J9@\�*�C3g&�YM\�]K9@�)��f&���v�\nL9@i��e&��h�hsL9@y�t\�d&�8�:V)M9@�X��c&�ձJ\�N9@kdWZFb&�QS\�\'P9@zZ��a&��JY�8R9@/�KR�b&�=�r\�}S9@�J�8d&�K#f�yT9@|�&\Zd&�Cus�U9@�:M�e&�^H��0V9@}ZEhf&��]P\�V9@5\�|\�\�f&�*�\�\�W9@B�\��e&�\\[%XX9@�f�\�Ie&��y�\�wY9@\�B��d&��\Z�XZ9@E�<�d&�+�\�Z9@�`\��we&��EжZ9@Ŏơ~g&�\"\08�\�Y9@�S�Di&�r�\�ZCY9@\�\ZJ\�El&�^�\��X9@>�>tAm&��հ\�W9@�- �n&�R�U�W9@�\�\�p&�\�n�\�W9@ePmp\"r&���N\�V9@	\�\��s&�L�K\�1V9@M��Et&�-@\�j\�U9@	]\�v&�&�(\�\�U9@k���#w&�\nj�\�U9@\�V%�}x&�=,Ԛ\�U9@\�?�d\�y&�\�\� wV9@�\�I`{&�L�K\�1V9@��3w|&��ǚ�AV9@\�\�>�Q~&��3ڪ$V9@\�\�!�&��{�ԗU9@�e�\�a�&��}�e�T9@i8en��&�\�\r��[S9@o�UfJ�&�iSu�lR9@�y\�S��&���W��Q9@ݙ	�s�&��0�R9@i�\0�w�&��+�j�S9@гY���&��4��-T9@Ϡ���&���jU9@\��-�&�F\�@1V9@ew�h�&�d\��\�V9@z���&���	�V9@*�\�D�&�i���\�U9@/\�H��&�.\�R�T9@F\�@1�&�\�\�\�cS9@_\�\�,��&�9\��\�Q9@�GT��&�ʤ�6\0O9@kc섗�&�h\�\nN9@�Z�\��&��f+/�K9@�z3j��&�7U�qK9@\�2�\�&��|�FK9@��r�m�&���\�\�K9@s߉Y�&��\�L9@\�����&�\�%�<M9@+�\�X¢&�b��\��M9@(\�4��&�\�\�Q��N9@\�\�\���&�rm�\�O9@V*����&�^�\�I�P9@3��A��&��\�\\Q9@[\nH��&�\�n\�KSP9@u\�\�l�&�\Z\�\��O9@\�b~nh�&�]3�f�O9@+��ϫ&���\r\�\�O9@��K�;�&����6P9@�\\k�&�Ox	N}P9@)����&�ys�V{P9@\nJ\�ʽ�&�h�.�O9@\�W\�\�\�&���yO9@�\�\�&ܳ&�v��N9@�\�ֈ`�&�2\�LN9@]��ky�&�\�i2\�mM9@\��\�?k�&�E�\�ӜL9@������&�^���TK9@�:ǀ\�&����YJ9@\�\�\�\�H�&��p�\�I9@�W�&�G�	1�H9@\�s\'\��&��\�=�>H9@\�\�0�&�d��SH9@*�Z^�&���%sH9@\�3�ތ�&�Vn2�H9@ݵ�|л&��9D\�H9@|c\0��&�Uܸ\��H9@�0휾&��m�\�EI9@$&�\�[�&�>�hI9@y�	�5\�&�\�{\r�qI9@�|�y\�&�B%�c\\I9@�nJy�\�&���V|CI9@7\�\�\�&�N�\��H9@Pn\���\�&��\��\�H9@\�r߉\�&���4I9@\�\�[\�&��\�\�J9@\�\�C\�&�Y��Z�J9@�?x\�\�&�\�\�\�;K9@h�\�s�\�&�!��\�K9@��ôo\�&��\�\�\�L9@�lt\�O\�&�ԘsIM9@5c\�tv\�&��g��M9@��:ǀ\�&�-�\\o�M9@�%䃞\�&��HP�L9@\�c\�\� \�&�1%�\�eL9@\�}�\�\�&�� [��K9@��5[y\�&�0�\�\\L9@B[Υ�\�&��\�\n\�M9@���\�&�I�5CN9@&��\�\�&��]�V$N9@�o�>;\�&�\��\�N9@�<�+J\�&�\���N9@\r�Q\�\�&�.\�N9@]�C�\�\�&�]�N9@E\�\ZJ\�\�&�9DܜJN9@��_\�|\�&�&Q/�4O9@\��\�\�&���ؖO9@\���o\�\�&�;6�N9@\�\�_\�\�&�ʉvN9@$�&ݖ�&��i>\"N9@\�\�\�&��&��S\�{FN9@QL\�\0�&�h@�5O9@�\���&�4f�N9@�B\�O��&�ǡ~�N9@ND���&��\���N9@,D����&�\�\nE�O9@sePmp�&���2pP9@^.\�;1�&��yȔQ9@*\�\�F��&�<P�<�Q9@0��9�&�_^�}tR9@\�8~��&�\"p$\�`S9@0G�\�\��&�CUL��T9@�r���&�8��L�S9@ܷZ\'.�&��Un2R9@�\�Y\�h\'���wF[Q9@\Z�\�7L\'�iUMQ9@�\���\'��9\�ؗP9@\�(@\�\'���\"��O9@\�@��\'�u\"�T3O9@\�S\�*�\'�#ڎ��N9@\�\�\�O\'�5��M9@D\�1uW\'�{2�\�L9@\�*�C3\'���b\� L9@\0o�\�\'�\�[\��bK9@͐*�W	\'��đ\"K9@[\�7\�q\'�\�`\�>L9@��\�\�~\'�\����M9@��x��\r\'�9\�)9\'N9@\�\�t_\'��b�\�N9@��N\�\'���/O9@�̰Q\�\'����O9@\�~��\'�&\��oO9@P�\�W\'�v�;O<O9@��c\'�\�\�N\�\�N9@U�2\�\'��\�k�\�N9@�o`r�\'��S;\�\�N9@J��	\�\'�s0�\0\�N9@�s)�*\'�N~�N�N9@xb֋�\'����>N9@e\���\'�9�t\�yN9@�\�9?\�!\'�Qi\�\�>O9@����\"\'��\�\�O9@�쟧#\'�hY���P9@\�\�^(`#\'�(b\�R9@��i\�$\'��\���?S9@\�bb�q%\'�\����S9@����/&\'��\�*lT9@�ю~\'\'��Xni5T9@\'i�(\'�`u\�HgT9@4h\�\�*\'�8�*5{T9@a�^Cp,\'�{\�L�xT9@@���\�-\'�x\�W�fT9@�3iSu/\'�<��fT9@KxB�?1\'�a\�xwdT9@m�\�J�2\'�]¡�xT9@yY4\'�_@/ܹT9@�\�^\'�5\'�\�.��T9@T��Yh7\'�d�\�TkU9@&\�\�9\'��ܶ\�U9@�\�!\�;\'�_\�(\�U9@vOj=\'�\�\�.�U9@\�m�\\p>\'���sE)U9@�?��?\'�%$\�6�T9@~SX��B\'��\�,V9@LS8�C\'�pC�׼V9@�$��D\'�qt�\�W9@B�?�\�E\'�YNB\�Y9@<L�\�F\'�[�\0m�Y9@=֌rG\'���\�[9@\�\�\�:I\'�&\�2�]9@�&P\�J\'�\�8�^9@\�FxL\'�fL�\Zg_9@�\�\�dpL\'��iP4`9@_�iN^L\'���oa\�`9@{��!UL\'�\�u6\�a9@�R\�hL\'�\�;\�\rc9@\��p�M\'��\�	K<d9@uYLl>N\'�]��kye9@�\�aP\'�a�\�*f9@֩�=#Q\'����dg9@4��ؙR\'�;\��\�Ri9@.\�;1\�U\'���5�j9@@��ilW\'��dl9@�\'�.�X\'�\�w��l9@h=|�(Z\'�\�o_\�m9@�\\\Z��Z\'�[A\�+o9@�0�\\\'�l���Dp9@�I*S\\\'�F�G�r9@\n�\�ϛZ\'��\�\�9s9@zR&5�Y\'�b�\�At9@B]\�Y\'�\�I}Y\�u9@�:V)=[\'�U2\0Tqw9@���^\'�4�c�=y9@��za\'�0��9\\{9@��g\�d\'�\�C\�r�{9@���\�f\'�:�6U�|9@�D��i\'��\�s\�v}9@@Qٰ�j\'�8.\�~9@��l;mm\'�\'��@~9@��u�|o\'�\�\�\�>9~9@L\��q\'�A\�S��~9@�\�\0s\'��yq\�~9@=��+t\'�֍wG\�~9@ԘsIu\'��z6�~9@�m��w\'�R�r�~9@\'�Ҩx\'��\�\�~9@\�SrN\�y\'�1\�t��~9@\��/|\'�`��~9@�\�(�}\'�iQ�\�~9@a�4\�\�\'���yS�~9@\�kA\'�\��\�~9@\�<\�!7�\'���l;m}9@S$_	��\'�\�Kp\�}9@N^�\'��8\�Z|9@>��\'�\\\�tYL|9@\�s`9�\'�.=�\�\�|9@�\r� x�\'��\nG�J}9@iW!\�\'�\'�t�\�)~9@+\�]gC�\'��xx\�~9@SςPޏ\'�܂���9@q $��\'���k\��9@� \�>\0�\'����y�9@\�0X�\'�o�ꐛ�9@\�б�\'�6?�Ң�9@\\qqTn�\'���L�N�9@�\����\'�\�!p$�9@�3����\'�m\�\�B�9@�\���?�\'�h��9@\�hUM�\'�l\\��ψ9@.\0�ҥ�\'�3��։9@\�8��\0�\'��\��_w�9@\�蹅��\'�	PS\�֊9@�,\�ċ\'��\���9@.X�x�\'�U�\����9@�\�*l�\'��6\�\�n�9@��\�B�\'�FD1y�9@�GT�n�\'��&�f�9@�J�*�\'�\�o�h��9@�\�#Fυ\'�S>U��9@w�k�F�\'��\�2\��9@h=|�(�\'�\�x[鵕9@v�U�0\'��\�m3�9@��\�|\'�s�69|�9@��Ơz\'�+j0\r�9@\�^\'�ey\'�N\��1��9@\�b\�J!x\'��։\��9@�闈�v\'�S<.�E�9@\�QcB\�u\'�7R�Hڝ9@TUh �u\'�3d���9@\�\��f\rv\'�����9@! _Bw\'��ɍ\"k�9@�n�w\'�|\�ʄ_�9@GZ*oGx\'�\�\�uSʣ9@N\r4�sw\'��\�\�ɥ9@�vöu\'��\�\�C�9@�~\�٭u\'��\�.m8�9@\�Ŧ�Bx\'�\��Q��9@&�\�:�z\'�\��x!�9@}\�X��|\'�K\�Բ�9@d]\�F�\'���#�9@�i4��\'�+*�Z�9@�\"2�\�\'�	�^)�9@{M\nJ�\'�h+�m�9@F~��\'�/\�$��9@��m��\'�\n�]��9@�n�e��\'�\�\�W��9@\n.V\�`�\'�Ym�_u�9@>	l\���\'�8�T��9@�P��\'�\�\'\�>�9@�\�zM�\'�]3�f��9@\��Kě\'�QlMK�9@\�2\�,�\'�y�ߢ��9@v3�\r�\'�衶\r�9@����\'�8\�ܘ��9@X�f,��\'�?�=x�9@U/�\�d�\'�\�ôo\�9@-y<-�\'�\�u\Zi��9@�r�4�\'��W\�2Ľ9@D�в\�\'�����E�9@Q��9�\'�` ���9@I�V�\'�\�,^,�9@���\��\'��:\�z\�9@�^��\'�\�\�\�\�9@Xs�`��\'�\�*��\�9@\0�g\�Ч\'��.\�H\�9@W\"P���\'��jIG9\�9@�\�\�ݧ\'�29�3L\�9@>�xꑦ\'�� �b\�9@���GS�\'����)\�9@\�h9\�C�\'��-s�,\�9@:y�	��\'���u�|\�9@�kC\�8�\'�C˺,\�9@�IEc\��\'��hE,\�9@\n��bը\'�g��\�9@�h㈵�\'�Zbe4�\�9@$%=��\'�c���\�9@\�Z_$��\'�\�X\��\�9@Ku/3�\'�)?��\�\�9@sePmp�\'�Qf�L2\�9@v�A]��\'�r�d�P\�9@p\�\�;�\'���{G�\�9@\�аu�\'�;6�\�9@B�?�ϝ\'����\�9@~�Ɍ��\'�-\�B;�\�9@QhY���\'��9τ\�9@a�\��\'���\�\�9@\�\�o�h�\'��\����\�9@�����\'��`<\�9@��G6W�\'�.rOW\�9@��\"j��\'�.rOW\�9@�|�\'�\�7>[\�9@L�Qԙ�\'�\���j\�9@\��d\�\'�����S\�9@v�S�\'��Σ\��\�9@Q�n��\'�\�唀�\�9@�����\'��\\��\�9@5�\Z��\'��M+�@\�9@\�R)v�\'�Ό~4�\�9@=\'�o|�\'�\�}��\�9@GUDݷ\'�ګ���\�9@9��U�\'�v?T\Z\�9@N�G\���\'�\\\��\�9@[\\\�3ٿ\'�\�\�%�\�\�9@�^\�\�W�\'�4w�\�\�9@(E+�\�\'�2�#\�\�9@��RAE\�\'�l\�\�TO\�9@h�\�HK\�\'��qS\�\�9@�4��-\�\'��Ȱ�7�9@��A$\�\'�˅ʿ��9@�͎T\��\'��K�\�\��9@\�4}v�\'�\0{�\\�9@�%\��\'��� \��9@��Cl�\'��\�Fu:�9@)H4�\�\'��߃\�.�9@\�`��\�\�\'�\�����9@\�\�;\�\�\'�v�+.��9@\�\�\�#\�\'�\�\�D�k�9@�K���\�\'���r\��9@\�\�X\�\�\'�ĖM��9@,�IEc\�\'�Hū��9@�:�p\�\�\'�&9{�9@yy:W�\�\'���>��9@�\���\�\'�q\�\�|#�9@:�\�H\�\'��y�\�w�9@�\�\�\'�$�@��9@��f�\�\�\'�9ӄ\�\'�9@\�/�\�\�\'���z��9@\�\��@�\�\'�1\�q�	�9@:�\�H\�\'�\�\�{,�9@%\�/�\�\'��P�\���9@\�\��{\�\'���M��9@ByGs\�\'�\�	�Y�9@,��26\�\'�\Z\�\���9@\�\�\�\�\�\'�\�y7:@J\�\�\�n\�\'�_F�\�\�:@���`\�\'��7j�\�:@\�iO\�9\�\'�M\�\�:@�N�\�\�\'��e��:@\�)r�\�\'�oض(�	:@+1\�JZ\�\'�y\�\��\n:@�7�\0\�\�\'��\�\��q:@Й���\�\'�\�\\�mO:@��\�\�\�\'��5#�\�\r:@\'ݖ\�\�\'��:@��q�\�\�\'��4�\�a:@.\�R\\U\�\'�\�}��:@�M�G\�\�\'�\�:�:@����\�\'�,�\�\�:@\�\�\�\�\'�\�L�::@�iQ\�\'��\��=\�:@�\�w�\�\'�(\�\�h�:@/\\sG\�\'���&\Z:@w�E\�\'��\�2:@\�.Q�5\�\'�\�=yX�:@���\�\�\'�\�G\�:@�w}\�\�\'��+�\�y :@\n��O\�\'�;%�\":@U4\��\�\�\'�Qٰ��$:@ސFN\�\'�[&\��|&:@�j�#�\�\'�4ڪ$�\':@k�)\0\�\'�l�\�F\�(:@���|�\�\'�����Y*:@:\�8\�\'��P29�+:@\�\�B\�\'����j\�,:@�\"ڎ�\�\'��\�\�`-:@�2\�\'�Z�H�s.:@\��\�F�\�\'�Ԝ�\�0:@	��z�\�\'�\'0�\�1:@�\Z3�\�\'�rM�\�\�2:@�\�\��\�\'��M�E3:@���\�\'��3�\�3:@\�7>[\�\'����6T4:@5��\�\�\'�ra�r5:@�\�u�\�\'�\�\�\�P16:@ep��:\�\'�\�k��7:@ҋ\��*\�\'�hwH18:@\�\�\�\�\�\'�\��\�\�b9:@W@��>\�\'�^-wf::@ݘ��\�\�\'��,�cy;:@\�t!V\�\'�\�\"��<:@\"��gx\�\'�\�)�n�=:@o\�\n\��\�\'���\�8>:@��mē\�\'�\\v�\�>:@�Swe\�\'��W\�\\@:@��\�\'����T�I:@\��\���\�\'�hX��\�J:@�Eж\�\'�x�a��K:@�Դ\�\'����4`L:@RcB\�%\�\'�\�.PR`M:@l=C8f\�\'�\\\�#��N:@Yl��\�\�\'��\��O:@oH�\'\�\'��9�\�P:@\�P�[\�\'�9}=_S:@R�h\�\'�J�GWU:@n\�b~n\�\'��:\0\�V:@�>�\'I\�\'�L�\�\�\�W:@z�I|\�\'�G�\���X:@\�f��\�\'�5C�(^Y:@\�����\�\'�t&mZ:@��\\��\�\'���9��[:@ٴR\�\�\'��\�Y\�h]:@0b�\0�\�\'�K\��`^:@\r\�-�\�\'�g\�;p_:@.\0�ҥ\�\'�z4Փ�_:@_�vj.\�\'��{�Y�`:@S%\�\�R\�\'����a:@\�\�Ȯ�\�\'����2c:@h\�K6\�\'��\��\r\�c:@���\��\�\'�J\�\�\�ne:@ӥI*\�\'�m�g:@��?�\�\'�\�ECƣh:@ܽ\�\'G\�\'�τ&�%i:@_y��\"\�\'�\�S���j:@�\�C?\�\'�ԁ��Vk:@��g\�\�\'�7��\�Nl:@�J\"� \�\'�-%\�I(m:@FCƣT\�\'�^�\�n:@�\�LM\�\'�\�\�Udtp:@jM�\�\'��4-�r:@l	��g\�\'�H¾�t:@[{\�\'�w\��\�v:@l!\�A	\�\'�lMK�x:@�={.S\�\'����z:@�\�ם\�\�\'�hz��L{:@PU��X\�\'���X|:@F\�@\�\'�a2U0*}:@g&\�5\�\'�M�-�~:@p\�\�;\�\'���m5:@2<��X\�\'��Yg|_�:@��8�\�\'�\�\�X��:@)����\�\'��\��y�:@\�`6\�\'����:@`W���\�\'�\�@�]��:@Rf`\�\'��/g��:@_�\�\�\'�\�R��:@\�j{\�\'�\Z���:@�J[\\\�\�\'��\�щ:@k�MG\0\�\'��}8H��:@�\��\�\'���\�T��:@LQ.�_�\'�36t�?�:@\�GĔH�\'�m�s��:@�A�F��\'�؛���:@/\�\�0�\'�\�\�=\�:@��Tl�\'�\�\�H��:@��,\�\��\'�C��A|�:@ܻ}\��\'�#�k$�:@׆�q�\'�\�$�:@Rb\���\'���Os�:@k���#�\'�ߌ����:@�	Q�\'�\0t�//�:@�P��9�\'��v����:@is�ۄ�\'��W\�\\�:@\��B�\'��x\��:@���\'�w\��\�:@��\�,\�\�\'�f���~�:@�1>\�^\�\'���z\�\"�:@I.�!�\�\'��uʛ:@��F\��\'���E\�n�:@ڪ$��\'��f��}�:@\'�%\�\��\'�V�@\�)�:@Zd;\�O�\'�̘�5Ξ:@\0�&��\'��\r����:@��\��k�\'�,�\��:@��\r� �\'���a���:@��lXS�\'�S�[Ƣ:@	q\�\��\'��\�Z�:@����O�\'��~�nئ:@�\�<�\'�q:\�V��:@0\�70��\'�=+i\�7�:@X\�\���\'�/�4\'/�:@�	�s\r�\'�;��T޲:@c����\'��6�X�:@(CUL��\'�ke\�/��:@4w�\��\'��\���Ҵ:@-\\Va3\0(�p#e���:@�\���\0(�\��\�H�:@��$W\0(�]���ʷ:@��u�|�\'�\r\�GĔ�:@\�y�t�\'��R\�\�%�:@-\�\�;��\'�\�\����:@�.�\�|�\'��\�}�u�:@\��/�\'�\�V�\�,�:@�**�\'�\�s���:@�\�G\Z�\'�\���P��:@.q\�\��\'�h\�\�?��:@зKu�\'����O��:@\�\�\�\�>�\'�I\�v|�:@쉮?�\'�A�m�:@,.�\�M\�\'��\�Li��:@Q�\�\�\�\�\'��\�\��\�:@-]�6\�\'���,\'�\�:@�K�b\�\'�[\��\�:@$��t�\�\'�H�m��\�:@\\X7\�\�\'�D��)X\�:@/�:\�\'��\�H�\�:@�!r�z\�\'�\�\'�$\�\�:@�7k�\'�\�y�ؘ\�:@c\�\�K�\'�A.q\�\�:@\�I����\'�PoF\�W\�:@�5x_��\'��˸��\�:@W=`2�\'�f/\�N[\�:@�?ޫV�\'�9��\0n\�:@\�q�	\��\'�\�\�nI\�:@�&\Z��\'�2�=B\�\�:@�mR\��\'�-�\\o�\�:@��I\��\'�\�\�I�?\�:@\��}8H�\'�fk}�\�\�:@Bv\�\�f�\'�\\�-\�\�\�:@��CR�\'�\"\�{�\�:@\�g@��\'�u�BY\�:@I���\'�C�+\�:@�\�\�a��\'�.v��2\�:@�W歺�\'�GXT\�\�\�:@%w\�Df�\'��\�\�\�:@��CR�\'�Υ��\�\�:@\�e�\�\'��\�\"[\�:@�B\�5v\�\'��o(|�\�:@N�t\"\�\'�?\ZN��\�:@\�C�|\�\'�H����\�:@�\�M~�\�\'��B:<�\�:@�\\��u\�\'��\�NG\�:@�9>Z�\�\'��#d \�:@f�2�}\�\'��\�\�J\�\�:@A C\�\�\'���I\�\�:@\�]���\�\'�7��\�:@LK\�\'�\�cw��\�:@5a�\�\�\'���\���:@�\�~\�\�\�\'��sѐ��:@�ɍ\"k\�\'��`�:@ٳ\�25\�\'�� \"5\��:@�\�$\\\�\'�]6:\��:@s��P�\�\'��u���:@{JΉ=\�\'�WBwI��:@Ը7�a\�\'��\�:TS�:@\�w��D\�\'�\�\�!���:@ {��\�\�\'�8\�q\�\��:@��\n\�\'�\�x�ߢ�:@�*�\�\�\'�v�\�\r�:@�DeÚ\�\'�/�\�Q��:@\�z�G�\'�/�\��:@�\�\�G�\'��S\�{F�:@z���\'�AgҦ\��:@eo)狽\'�\Z\�\���:@���N@�\'�\�N\�`��:@A\�+��\'�V��Ά�:@/R(_�\'�W\n�\\\��:@PP�V\�\'�ު\�PM�:@�\����\'��\�K�:@@�Ŋ\Z�\'��Q��m\0;@GW\�\�\'�g*;@���H�\'�֧�\�;@���p��\'�Gq�::;@\�>V�۠\'���ek};@\�\�Ȯ��\'�uV\�1;@�z��9�\'� \�E\ne;@��,�\'���eN�;@�]��a�\'������;@\�X�;ۓ\'��#D;@�Dg�E�\'�V\�\�\�4;@�\n)?��\'�E/�Xn;@�)[$�\'�\n�_\�;@�)ʥ�\'��\�\�;@h\�,{�\'�p\��;@2\�	\�\�\'�ظ�]�;@vS\�k%�\'�b,\�/;@J+�~\'���D��;@6\"�~\'�@mT�;@\�&�\�0~\'�\�(\�\r;@q\�GR\�{\'��V횐;@\�0\'h�{\'�CY��Z;@�\�\�~�x\'�\0\�4;@:@0G�w\'��>s֧;@�Uס�r\'�؁sF�\n;@׆�qn\'�=ڨN;@\�L\�Tm\'�i\�G5\�;@t\'\��k\'�\� ��;@c|��lc\'�!?�n\n;@ػ?ޫ^\'�Qk�w�\n;@��[\'���\�Y�\n;@Ϡ�Z\'��z\�\�	;@\�!p$X\'�\�º�\�;@j�~�^W\'���o\�4;@��\�\�\�V\'�!\�\�*�;@�\�\�L0T\'��im\Z\�;@\�$\�\�R\'�ٴR\�;@5}v�uM\'�j\��\�;@�mI\'��YKi;@�\�\�N�G\'�\�$��;@ƾd\��F\'�\�\n\�r;@�,�\�oD\'����\��;@�\�CB\'�_\�\�,�;@r��A\'�VDM��;@i�\0�w9\'�;�s\�\�;@��\�p<7\'��\0�6q;@�T\�:6\'��	\�y;@\�<�E~5\'�{L�4�;@A�\n�4\'�\�nf��	;@q�J[\\3\'�!\"5\�b\n;@\�����1\'��ܶ\�Q;@��Ր�/\'�8���;@��L�N/\'���3��;@�۽\�\'/\'�p��1=\r;@2˞6/\'�o\�KS;@\�\�\�\�1\'��i4�;@����%2\'��\�8\rQ;@�\Z�$�2\'�a���;@M!u;3\'� |(ђ;@�\��R4\'�j����;@dϞ\�\�4\'�z\�\�;@\�\n~b4\'��u8�J;@X���<3\'�o�1;@��\�#b2\'�Ks+�\�;@B��1\'���ص�;@v�U�0\'�֋��h;@\�_\��/\'���q\�;@�0~\Z�.\'�\�c\�;@g\n�\�\�-\'��/��� ;@c\�\�l�.\'�:#/k\";@9\�\�/\'�^�o%#;@\"9��U0\'�Oʤ�6$;@%t�\�Y1\'�A�Ρ%;@�\��x1\'��\�\�\�%;@�%jj1\'�\0X9\�);@\�&�O:1\'���\�#b*;@U���N0\'�\�<\�!7+;@j�\�h\�-\'�\�W)�+;@Vc	kc,\'�\�B;�Y,;@�Y��\�*\'��Hm\�,;@3�`��)\'��4`��-;@8�0�(\'�N�M\�g/;@\�~�d\�(\'���\�+1;@n���(\'�Χ�U2;@�<�;k\'\'�W#�2;@Քd�&\'�:3P3;@N�f�%\'��\��\�3;@�P�f$\'�\�+I�\�3;@˼Uס\"\'��\�\riT4;@��> \'�%\�\�\�4;@�\�v��\'�B{��\�7;@�\�\�5\'�S	O\��7;@�y�7\'����I~8;@�\"\�:\'�w;S\�8;@\�Fx<\'�� %\�8;@\�ikD0>\'��\�\�f9;@����\'B\'��۞ �9;@X\Z�Q\rC\'�\�g\\8:;@歺\�D\'��%:\�,:;@\�(\�QGG\'�n\�\�S:;@�-\�H\'�\�|\\*:;@\"�\n�lK\'�0�\�L�:;@� \�\�M\'��3���:;@v\�~kO\'�w�\r�g:;@H\��QQ\'��R%\�\�:;@P�s\�R\'���%VF;;@ˠ\�\�DT\'�d*\�\�;;@v�;O<W\'�f��!<;@k���X\'�\Z1�\�c<;@\�_�\�[\'�J]2��<;@�\�:��\\\'��\�\�W<;@iSu�l^\'�\�\�:;;@\�\�H/j_\'�\�pt�\�:;@�\�<�`\'�\�S���:;@x�ܙa\'�W\�f�:;@�H0\�\�b\'�6\�e�s:;@T7\�c\'��\�n�:;@����.e\'��\�\�\�:;@i\�ai\�g\'��x];;@�(^emk\'�\�\�52;;@�j\�\�m\'��խ��:;@\�҇.�o\'����\�;:;@��zq\'�(F�\�9;@Ӿ��r\'�\�n-�9;@#�-\�Rt\'� \�E\ne9;@&U\�M�u\'�|��l;9;@N��;Pw\'�¢\"N\'9;@jܛ\�0y\'�7\�\r��8;@{�\�{\�z\'�\�\'G�8;@�ʆ5�}\'�*\�#��8;@R�y9\�~\'�@N�0�9;@\r�x#�\'�ͫ:�:;@\�(�\�P�\'��õ\�\�:;@:��\�`�\'���u�|;;@A-ӎ\'�b���4;;@���碑\'�\nL�u<;@\�	F��\'�82���<;@l	��g�\'�q���>;@�@�ȓ�\'��\�\�\�>;@���V�\'�,���d?;@�ْU�\'�ҫJCA;@�\���,�\'���w�GC;@�++MJ�\'����d�C;@�\�j�=�\'�)��RJ;@%X\���\'�}]��tS;@��\Zh>�\'��\�A�pT;@\�\�fG��\'�ڨN�V;@B���\�\'�ͮ{+W;@MeQ\�E�\'�Q\�E\�W;@\�\�c�\'���f\�V;@\�\n���\'�(֩�=W;@f�\�S9�\'�,F]k\�W;@�_\�(�\'��X;@��,`�\'�<�ݭ,Y;@(�\�\'��ԱJ\�Y;@\�8\n�\'�b�o[;@���D��\'�\�#F\�-\\;@(��\Z�\'�F��0];@\�_w��\'�ΎT\��];@\��`R�\'��\�\�̯^;@����\'��y\�0_;@WBwI��\'���\�\0`;@\�%\�ɶ\'�V\�\�\�`;@���&��\'���b��a;@A�\�ǘ�\'��30�b;@���@�\'�0�\��c;@�Z\�̼\'�/\�$�e;@u�V�\'�K�R\�\�e;@\�E�S�\'�\�)\�\�Ff;@\�ܵ�|�\'��\�ypwf;@�\��_w\�\'���j�f;@\ZS�\�\�\�\'����;g;@} y\�P\�\'���\�`�h;@l\�\��\�\'��\�K7�i;@f\�-�\�\'�t\�\�q5j;@f\�-�\�\'���0E�l;@u\�\�l\�\'��O�Dm;@_�2\�\�\'�\�\�\�=n;@�h:;\�\'�L3\�\�n;@\�	��b\�\'�q�J[\\o;@�F\�\'�e4�y\�o;@�8�~\�\�\'��%Tp;@Qj/�\�\�\'���ʆ5q;@x�\�\�\'�+i\�7r;@K\�3�\�\'���9\�\�w;@FaE\�\'���A\�\"x;@\�˙\�\n\�\'����\�tx;@ߨ�\�\�\'�c섗\�x;@�]�\�N\�\'�iUK:\�y;@�\�\�O\�\'�|a2U0z;@:\�ؗl\�\'��\'�\�y;@\"ĕ�w\�\'�\�Df.py;@�\�\�T\�\'�F\'K��w;@�*���\'�5��\�w;@1\�Z{��\'�h\�4�w;@\�͌~4�\'�_����w;@˾+���\'��\���w;@��-$�\'�c�dU�w;@9)\�{��\'�Й���w;@P\�2�\��\'��\�\�uw;@�EИI�\'�Ug��w;@�5�U��\'�-]�6v;@<g��\'�ę_\�v;@\�\�\�\\Q(�]�@�v;@4iSu�(�\�E��(v;@\r���(�\� \�\�^v;@;:�Fv\r(��!�\Z�v;@|_\\�\�(�oe�\�2w;@\"�\� >(�\�E�Sw;@\�8EGr(�^\�/\�\rw;@iQ�\�(�mscz\�v;@y@ٔ+(�\�E��w;@n½2o(�\��M(x;@*��%\0(���-$x;@�M�(�Tb.x;@�E\�n�(��	�5�x;@7U�\�\�\Z(���Ũky;@���9�\Z(�P8��Lz;@+\�3�(��C�3{;@��F\�(��\��QF|;@�}\�\�(�\�S\�*};@BȗP(��+d�~;@ގpZ�\Z(����1v~;@&7��5(����^~;@�Q�d(�����a~;@\�H�+ (�g_y��~;@\"p$\�`#(�\�;�(A;@4�9A�$(�aE|�;@f\���%(��Hh˹�;@�i\�q�&(�7�ُ�;@^����\'(�O$�jf�;@�\�%\�)(��\rN�;@/3l��+(�������;@�G�R-(��g\�ej�;@*9\'�\�.(�x\�\�e�;@ƅ!Y0(�2q� �;@Ɔn�2(��Cl�p�;@r \nf4(�\�\�Χ�;@���i�5(�4\�i���;@�\�6(��\�}���;@�\'��\�7(��w�7N�;@��\�I:(�T�^\rP�;@w��\Z/=(����;@KXc?(�B[Υ��;@�mR\�@(�LK�;@&P6\�B(��tu\�b�;@IJzZE(���\�G�;@�\'-\\VI(���`�;@:\��lL(��8\�Z��;@\'�|�O(�|E��;@��֪U(�\�\�H/j�;@��\r\�\�W(�)YNB\�;@`\��Y(�3�&c�;@[{��B[(�B���;@��-</](���c�M�;@v7Ou\�](�OZ��;@P\�\�@^(��qS�;@�X\��\�^(�$0�܋;@<J%<�_(�a�ri�;@�?Û5`(���N]�;@ĔH��a(�\\\�\�.��;@V(\���b(�ND��~�;@٘\��d(�\�}\�֤�;@||Bv\�f(��N\\�W�;@\"�\� >h(�G�J���;@J}Yکi(�&�\�:��;@�Ѭlj(�Iط���;@\��\�\r�i(��{�\�˕;@+���}i(�q��]�;@WZF\�=m(��\Z�4Ԙ;@	5C�(n(�)�����;@�ۄ{en(�\�A	3m�;@�\�r��n(�\�\���j�;@_����o(��\Zٕ��;@�\�\�~�p(�Y��ѝ;@)z\�c�r(��\�\���;@m\06 Bt(�%!���;@̘�5\�v(��|�͍�;@�\���\�x(�<3�p��;@\�Tkaz(�\�SUh �;@ҍ���{(�CB��;@[%X\�|(����߃�;@ȳ˷~(�A��Lj�;@��M+��(�\�hV��;@�w�7N�(��Wy�;@��죃(��	\�OƠ;@^��ᰄ(��\�\'c|�;@r2q� �(�ۇ�\�\�;@g\�R@ڇ(��P�f�;@�8�~߇(��QI���;@J\rm\06�(�\'�y�3�;@\�v�4E�(��g\�,�;@\�\�ID��(�H4�\"�;@\�\\�(����3��;@_(`;�(�[\�a/�;@%\\\�#��(�B\�\�\�D�;@	2*�(�;]���;@\�3h蟈(�����%�;@?�\�\�ʇ(�6Vb���;@\��\�\r��(�5s���;@\��|zl�(�R�r��;@*�=%\�(����);�;@%\�s}�(�#�Ƥ�;@�d\0�\�(��L��~�;@\Z�!���(����$�;@�{��c�(�5�u�;@\�!\�Q�(�\�2��;@�_x%ɓ(��s�څ;@�\�=Δ(��+�`p�;@�����(�~��7�;@?q\0��(�A.q䁄;@\�WXp�(��Ϲ\���;@Z�\�\�И(�M��(#�;@�`\���(���:�;@.q\�Ț(�D3O�)�;@3\��(�Xr�;@��ݒ�(���\��~;@�0e\�(��F\�g\�};@\�\\�mO�(�|\�o\�^};@�0\���(���|;@/�\�w�(�!��\�{;@��kC�(�{��\�`|;@�q���(��\�\0�};@�\���(�\�C��<~;@m�\�<+�(���)x~;@\��V	�(�GW#;@��w�\'�(�\� >�\�;@����(��릀;@\�6S!�(�`���\�;@�\�AB��(��ݰmQ~;@�:9Cq�(�y<-?p};@F\�=�ӎ(�߈\�Y\�|;@P�<��(�Q�_�z;@�\�z�ю(�\��3�Iz;@ۈ\'��(��U�@\�y;@R<���(�ծ	i�y;@}?q\0�(����\�tx;@\�F��(��\�\�\�w;@q�;�(�иp $w;@\�SrN\�(�QL\�\03w;@\�[[%�(�hz��Lw;@�\�w��(�A�ȓ�w;@\��`R|�(���\�߽w;@�={.S�(�.W?6\�w;@-�\\o��(�@�ϝ`w;@^\�Y-��(�E\���Ju;@��E\�(��C\�Ht;@H¾��(�B\�L��r;@��x軋(�v\�ݑ�r;@�X����(��!s;@F�G��(�\�ȳs;@`��-�(��\�s��t;@�����(���aMeu;@\�	��(�5Sv;@\�\�e6�(�,e\�Xw;@i��(�~\Z�\�7x;@ |(�(��|гYy;@� L��(��>U�z;@z��L��(���켍y;@0��ā(��mē\�x;@J�%r��(�Tn��\�v;@\�P1\�߄(�h\�\�5v;@�\��9�(�{��v;@[A\��(�M��(#v;@\"���(�\�ikD0v;@�s\�^(��߆�u;@\�^}<�}(�W�\���t;@\r5\nIf}(�l$	\�t;@�@�~(�8h�>r;@qTn��~(���i��q;@Qf�L2�(��O\�\�\�p;@N�\�\�P�(�+P��\�p;@\�-��ą(�<p\��o;@2\�3/��(�Ҩ�\�n;@׉\��\n�(��\05�lm;@��\�K\Z�(�@3�\�l;@���\�}�(��7�\�wl;@��\r��(�$���k;@\�.\��(�h��d;@kGq�:�(�5Lk\�\\;@+�\�	�(�r�d�P[;@Mg\'���(�0+\�~Z;@a\\:\�(���\�V;@\�\Z-z�(�W\�f�N;@��o\�4�(�d�\r1N;@�\�B���(�9)\�{�M;@&P6\�(�\��}VM;@:�\0U�(� 	�vM;@ F�6�(�\�4�OL;@0�[w�(��ϸp L;@M�\�\�ƴ(�o��\�K;@����(�J\�o	�K;@]P\�2�(�DkE�K;@����\\�(�\�\�!��J;@�\�\�uS�(�S�1�#J;@	\�\���(�=Fy\�\�H;@{Cr2�(�@0G�\�G;@k�j�Ҹ(�����\�F;@�\�;jL�(�\�CVD;@\�\��\�(�o�$\�B;@\�\�\���(�\�je\�?;@�\���(�J\rm\068;@��rf�(�oض(�1;@�|A	�(�\�xy;@�ƈD�(�υ�^\�;@x\�\�!�(�$�\�;\�;@毐��(�x\�\�!;@�>���(��\�\��;@����(�\�\��;@I�Vѷ(�\'�\�Q;@����ܹ(�\���\\�;@33333�(�)H4;@���QI�(���w\�;@\'�_[�(�\�(\�\';@�~l��(�R�b�;@\"6X8I\�(�Ӄ�R�;@#K\�X\�\�(���\�z�;@KXc\�(�K��F>;@��};\�(�:vP�;@^�\�(���S\�\0;@mW\�e\�(�@���;@DOʤ�\�(�\n�s\r3;@Է\�\�\�(����;@E\�[\��\�(�;�ʃ�;@~p>u\�(�(\r5\n;@)\�\�\�(�W\n�\\\�;@+�\�	\�(��\�I��;@G�˵h\�(�\�4�O;@�$@M-\�(���D\�\�;@\�7i\Z\�(��\��\nD;@\��.�\�(��ʅʿ;@�\�\�-\�\�(�\Z2�;@\�\�\�d\�(��辜;@�l ]l\�(�� ;@>	l\��\�(�\�\�\�\�\�;@�$��\�(�>\�ɋ;@|�\�˙\�(�qs*;@&�\�[X\�(�=�\�\��;@b�qm�\�(��}\�\�;@ū�m\�(�\�\�}U.;@G�`\�\�(�7��\�N;@�X\��\�\�(�\�dT;@�	�\��(�\��g?R;@�\�-I�(�`;�O;@\\:\�<�(�\�T�];@�9\�ؗ�(�.rOWw;@r��	�(�\���;@���G6�(�ڬ�\\m;@\�ֈ`�(��\�E�;@Û5x_�(��j�#�;@��\�S�(�[\��Ye;@5��-<�(�ٴR\�;@X:�%\0)�\�2�g;@\�=\�4)��.�.;@Um7�7)�#�3��;@\�J̳�)���}\�A;@��\�\�)��lV}�;@sd\��)�\�R\��F;@!˂�?\n)���:r�;@�N�o)��{H�\�;@Ӿ��z)��\�Fu:;@�G\�z)�\�qo~;@-&6\�)�dZ�\��;@7߈\�Y)�\�%ǝ\�;@_y��\")�����+;@��)����Hh;@�|$%\r)�x��\��;@\�bb�q\r)�ĵ\�\�^;@���r\�)�b��\�\�;@=ڨN)��Ov3;@����)��`�un;@6�\�)�&\�`6\r;@�:\�э)�\�Đ�L;@F�6�)�-\�\�a;@��-)��\�}��\n;@�Ѭl)�\�\�\��r	;@\'�y�)���D\�\�;@(�r)��`8\�0;@�>+)����&�;@�\�m�)�\�B�i\�;@\�Ȓ9�)�\�뤾,;@U0*�)�<p\��;@A\�)V\r\Z)�\�-c};@�։\��\Z)�\�#�&\�;@�\0��)��7�\�d;@��E\�n)�0b�\0�;@��]L3)�\�#0�\0;@�Y\�>\�)�\�8F�G\0;@\�A�p\�)�\�A	3m�:@�ْU)��\�n�U�:@\�0C\� )�x{��:@\�2nj�!)���\�\�X�:@\�\�,z�\")�W\�Y\��:@~\�*O $)��\�S�:@�^Cp\\&)��\�o\�\��:@�����()��`�.\��:@8�{\�5*)�\�ó�:@\��|\�+)���E;�:@B\�<�E.)�\�\�m��:@�7�\00)��kЗ\��:@b�A\n�2)�\��/\��:@&\��p4)�\�(\��:@#�~�\r6)�^���:@*�-98)�\�\�(]�:@&:\�,B9)��X\�E\��:@���e:)�*�TPQ�:@\�8�j�;)�GXT\�\��:@\�o\�^}<)��\�\�K�:@ڨN�>)�%Z�x�:@~Q��B?)�P����:@���\�?)��\�J�:@Y���\�@)�H6W\�s�:@$\n-\��A)�(��\Z\�:@衶\rC)�SB��^\�:@�KKC)����\�\�:@�H�\�\�B)�� \\�\�:@Y�_\"\�B)����߆\�:@Mf���B)�>���\�:@��[�nC)��\�\�O\�:@\�\�\�CG)��z\�\�\�:@��D�I)�7\�\�\�:@u�BY�J)��Z��K\�:@\�n�M)�Y���\�\�:@�~�N)�\��f\�:@:$�P2Q)�\��[�\�:@[{S)��V&�R\�:@�u��U)�%Z�x\�:@Y\"��W)�#\�dT\�:@��L�\�Y)�~��\�\�:@e�<\r\\)���L/1\�:@\�1\0_)�u\�\�p\�:@ŏ1w-a)�\"\�Q*\�\�:@2v\�Kpb)��D\�[\�\�:@��S�c)��\n*�~\�:@�@�ti)�D�;��\�:@�k)�TUh �\�:@��v1\�l)�3�`\�:@q\�\�\�n)��~\�~�\�:@1	�p)�\�z�2Q\�:@}zlˀs)��\�\�;�\�:@\�>rk\�u)����E\�\�:@\�X\�Ux)���\�\�:@OZ��z)�y�	�5\�:@��\�n})�\�!\�k\�:@��߃\�~)���5?�\�:@m\���{�)��X��\�:@�eN�ń)�)<hv\�\�:@�\�j�=�)�Xc\'�\�:@,am���)�\�\Z��\�:@��R{�)��E\�\�:@\\1е�)� _B�\�:@�6\�Nx�)�}\�.PR\�:@�Z	\�%�)��z\�\�\�:@/\�$�)���8�d\�:@7P\��|�)�X�%��\�:@t\�\�gy�)�\�U�Z\�:@\n��a�)�;S\�\�:@��;3�)�<O<g\�:@L\�\�ݜ)�����\�\�:@�3ڪ$�)�\�>�̔\�:@<\�͌~�)�sJ@L\�\�:@+��ݓ�)�?�Q�y\�:@\�\�̯\�)�2\�g@\�:@m\���{�)��`\��\�:@�	�8�)��h���\�:@75\�|έ)��w�\'-\�:@u \�կ)�w�\0ݗ\�:@�x\��)��\�ܴ\�:@~\�*O �)��\Z�\�:@֧�ŵ)���0\�:@�\�\�5�)�\ZQ\�|\�:@\�O\�\�)���g�\�:@�ٮ\��)��ky\�z\�:@��\�\�ý)�=\�[�\�:@��\�!\�)�=��S�\�:@+���ڿ)��:\�\�:@	l\��3�)�\�sD�K\�:@�\�r��\�)�\�<0\�:@�[ A�\�)�ͰQ\�o\�:@u��\�a\�)�\�\��I\'\�:@�t><K\�)�Mi�-\�:@�\�\�\�\�)�h$B#\�\�:@���\�\�\�)����\�%\�:@�5�Ea\�)��Pk�\�:@.\�\�H\�)�\0Uܸ\�\�:@b.�\�)�?\�6�\�:@;ŪA�\�)��P3��\�:@�\�C�\�)�A\�\�\��:@�RB��\�)�Q3��\��:@�0�{�\�)�\�\�)��:@��sE)\�)��fe��;@(�8\'\0*�_�L�\Z;@��I\�\0*�?�\'I\�;@衶\r*���jQ;@Z��m\�*��Qew;@d\�\�A*�\��\�H;@�ю~*���·g;@�S�\Z�	*�����\�;@\�\Z���*�kGq�:;@ڍ>\�*���\�R;@yu�\�*���Gߤ;@�>�\'I*��g͏�;@\�\�*�*\0\�3h;@b.�\�n\Z*���/\�x;@\r\�\�*�	\�Vд;@a5��*�{��;@��v\� *��\�\�`;@�I�2\"*�\�b\�J;@0�[w#*��\Z�4\�;@�3�\�k$*�֫\�\�;@s��\�%*�\�A%�c;@\�\�m��\'*�5z5@i;@���}\�)*�F��_;@k\�C4�+*��\�W\\;@�<�-*�b/�;@>�\�@0*�)<hv\�;@��n\�1*�n�l��;@3d��3*��B�Y�;@	]\�4*��\�\�\�;@EJ�y6*�\�$��;@j2\�m�7*�遏��;@N�E�8*�)[$\�F;@�]M��:*�ʤ�6\0;@/�=*�\�\�\0��;@����?*�JC�B;@vnڌ\�@*���D�;@\�!\�QB*�\�O\�\�;@0��9\\C*�)v4�;@B�D*�V-\�(;@|��8GE*�*8� ;@&7��E*��a�\�\r;@�4�\ZF*�K#f�y;@���\�IF*�M�\�΢;@CV�zF*�u\�\n;@>\�D��F*��=Զ	;@\\W\�G*�z7	;@�ڊ�eG*�o.��\';@\�\�rg&H*�D\�r�c;@�\�(�\�H*�>u�Rz;@]\��\'J*�*\�J=;@<\�b�\�J*�\�\�\�\��;@\�O�Y�K*�\�3�;@Z\�\�M*�߇��(;@\\\0qWO*�l\�\�C;@U��N�Q*�\"\�k^\�;@��C�RS*��\�r;@�^\�T*�E\�Ɵ�\0;@2˞6W*��x\���:@\�º�\�X*�\�<\0;@�t\"�T[*�\�x�\'�:@2\�m�\�^*�LQ.�_�:@�\\p_*��\��\�\��:@X�ۼa*���[��:@\�G\�)sc*����y�:@X�|[�d*�_�2\��:@\�iO\�9i*�ĔH���:@<�\��rl*�+mq�\��:@\n�]�n*�8�*5{�:@�\����p*��� \�>�:@\�\0�&Pt*��\��Z�:@j\���1v*�\�mr�:@�\0\�m\�x*�b�\�A�:@�9]{*�\�i� \��:@\���\�\�|*��\�\�K�:@ɫs\�~*�<�\�~�:@�-\�\�e�*���ᱟ�:@�+g*�\�\r\�e�:@?8�:V�*��\nҌE�:@B\n�B��*�T\�{F\"�:@�\0��*���\�@�:@j�����*��J�(�:@�0��\�*�K�����:@��\�*�zq\��:@�\�\n}��*�Y�\�\0�:@voEb��*�x�ܙ	�:@I�H��*�c{-\��:@�vi\�a�*�Z��U��:@iUM�*��f+/��:@U�=ϟ�*�y7R�:@K��\��*�.</\�:@\�DIH��*�\��E�\�:@3�p�a�*�\��\�\�\�:@�\�C\0�*�P0�A\�:@��cZ�\�*���U�\�:@\��k\�\�*�^=�1\�:@\�L�x$\�*��3iSu\�:@\�\��hq\�*�\"�\�`\�:@\�#�&\�\�*�\�\�\rM\�\�:@��߆\�*�+1\�JZ\�:@mq�\�d\�*�\��X32\�:@i���2\�*�',1607362055,1607362055,NULL,NULL),(9,'Southern',_binary '\�\0\0\0\0\0\0\0\0\0\0\0\0\0\09\0\0�K\�1�i<@\�f\�\�j�0��\�\�\nA<@\�ܵ�|�0���g#<@�{�\�\�\�0��?mT�<@R�U�\�0�8��+\�;@>\�n\�K�0�=\�Ƃ\�\�;@`̖���0��\�Y5\�;@� ˂��0��p\�;@2\�L>1�\r�\'�8�;@�\�k\�U1�`>Y1\\�;@�\n*�~i1�3SZKX;@s�V{ؓ1��+�\�E$;@\�\�\�\�\�1���*�\�\';@O�)�\�\�1�\�\�l#;@\�\�ù\�1�\�u\�\�;@-&�(�1�\0\�	�;@\�\�rg&�1��\� v�\0;@�vi\�a�1�^�zk`�:@\��H�1�\�;�_�:@UN{J\��1�cAaP��:@�i�WV�1�$\�\��:@�1\0\��1��U���:@^���1��Uס��:@�mߣ��1��C3O��:@�(%��1��a�\��:@\�\��m�1��\�\��:@L�K\�1�1��̔\�\��:@+1\�J�1��9A��:@\�uR_��1�J�U\��:@/�u�;�1�\�q\�\��:@:@0G��1�S\�G�:@\�I�\��1�<� \��:@�}\�\��1�{k`�\�:@^����1�*p�\r\�\�:@\�)H�1��-��\�:@M��~\��1�S\�\��\"\�:@E+���1�Zh\�4\�:@��4�1�t)�*�\�:@$(~���1����s\�\�:@���\�\��1�6X8I�\�:@_9\���1��o\�\�:@횐\��1�}=_�\\\�:@h>\�n\��1����V_\�:@\�\�\�C�1�\�\�_Z\�\�:@r3܀�1�\�\�G\�\�:@p\n+T�1��Жs)\�:@�2\��1�\�\�l�\�\�:@U����1�\��j\�:@��\"ڎ�1��<,Ԛ\�:@��Ũk�1��\�\n�|\�:@��o\'�1�є�~P\�:@�t��\��1����\�%\�:@)\"\�*\��1��GG�\�:@Wj1x�1�3\��O\�:@8�Q���1�\�X\�\�:@E-ͭ�1��n��\�:@���sE2�\�\�\n~\�:@p(|�2�)狽\�:@�A&92��0�*\�:@�({K92�	��\rL\�:@5bf�\�2�\�\�TO\�\�:@*�Z^�2�kF�\�:@�x\�2�dT8\�:@5}v�u2�)\�\�\�:@�Q�U�2�]��u�:@\�\'\�>2��f���:@���Q	2��\�\�X�:@\�*�gz\r2��/�\�:@�E�x2�og_y��:@p`r�\�2�<�R�!�:@��=^H2�\�ɧǶ�:@\�$?\�W2�P\�\����:@\�V�\�,2�\�\�,z��:@Ֆ:\�\�2�F�Sw�:@\�%�<2�E�*k��:@���2��֦���:@ס���2�\�1��:@�p\�-2�k�*�:@��m�R\r2�HO�Cę:@�)�\n2�9�#+��:@\�\'\�>2�\�\�0���:@�q4GV2��t&�:@`���2�d;\�O��:@X8I�\�2��EE�N�:@�����1�x^*6\�:@:ZՒ�1�R��/I�:@D�3��1��g͏��:@\0t�//�1�\�-\�|��:@�zO\��1��D���:@?��s(�1�*����:@\0�={.�1���\�G�:@R%�S�1�1\�q��:@��\�f��1��30�:@���\���1�Ԃ}�:@� �1�\�ɧ�:@üǙ&�1�\��\� !�:@\"QhY��1��7�櫀:@�eO��1���S�:@-�\�DJ�1���m�\�}:@5D��1�S\�q�|:@���\��1�]m\���{:@\�Az��1�b�[>�z:@b\�\�!�1���t:@\0�ҥ�1�Wx���r:@\ZPoF\��1�\��w}\�p:@�\�\��g�1��\�Q�n:@�۠�[�1��8�@dm:@\�\�\���1�\�*\�]gk:@it�3�1���ᔹi:@\0\�4�1���.�h:@�Tm7�\�1�9�⪲g:@E�ӻx\�1���y�Cf:@�j-\�B\�1�\�r�c�d:@o�$\�\�1��Zdc:@�`�d\�1���C�`:@����\�\�1�\��Ӻ]:@<1\�\�P\�1��1��\\:@�\�\n\�\�1��!9��Y:@\'�E\'K\�1�-C\�\�V:@.\�+=\�1�\�vL\�U:@�\�a0\�1�\�|?qT:@�b\�\�\�1��aۢ\�R:@�\�uoE\�1�lw\�}Q:@IM��f\�1�=+i\�7P:@��s\�\�1���\�8O:@֪]\�\�1�<1\�\�PN:@`YiR\n\�1��\�(ϼL:@;7m\�i\�1��\�\�NK:@\�$#ga\�1�Z\��cI:@j�\�U�\�1��\�\�G:@|~!<\�1��\�Д�F:@Քd\�1�\�\'c|�E:@)%�\�\�1�L\�Ƽ�D:@�\�\�\�1�7n1?C:@a���\�1�RD�U�A:@<�.9\�1�ؚ��\�?:@/2�F\�1��RςP>:@#K\�X\�\�1���X=:@x��\�\�\�1�rk\�m�<:@j\'�;\�1�\0\�\�<:@M�d�\�\�1�	�/�::@�ݓ��\�1�nnLOX::@�\�#F\�\�1����\�\�9:@���Q\�1�[z4Փ9:@m\�OT6\�1�Y���R9:@\��?\�1��G�`8:@�6\�\�\�1�	\�P�7:@V�F\�\�1���\�Xl3:@8؛�\�1��?2:@\�{,G\�1�	q\�\�1:@�B�\�1�K;5�0:@e\�\�J�\�1��\��\�]/:@\�{F\"4\�1�O\���-:@ȷw\r�\�1��~\�~�,:@\'JB\"m\�1�J_9\�+:@�ެ�\�1��M�d*:@�b�dU\�1�ƈD�e):@,���\�1�7\�\�Z(:@�G,\�1��G��\':@Z��ڊ\�1��\':@\rP\Zj\�1�I\�\0O&:@���\�\�1��\�w)u%:@\��\�:U\�1�6�:$:@�/L�\n\�1��fb�#:@-\�i��\�1��\�3g}\":@</�\�1�k,am�!:@0��\�\�1�<l\"3 :@s0�\0\�\�1�\��&:@��U�\�\�1�OI�:@W�c#\�1�\�Jvl:@���;\�1�B��:@4I,)w\�1�B\�v��:@9{\�\�\�1�%A�\n:@�;\�\�\�1����y:@�\'L\�1��Ov:@V�F\�1��\�+H:@!yv�\�1��s\�^:@Z�N\�\�1��R�1�:@g\�|�|�1��F�q�:@��\�t\��1�q>?�:@u9% &�1�g���:@_(`;�1��)\�\Z:@\��\�\��1��ܶ\�Q:@���\�	�1�h\�\n�:@�mp��1��D��\Z:@:�6U�1��o\�\�:@뭁��1�ya�X:@Q��r��1�%$\�6�:@�����1��I\�:@X\�eS�1���\�N�:@�8�#+�1��z�Fw:@kF��1���\�P:@\\=\'�o�1�\�`\":@��<e5�1��X\"�:@U�3��1�\�{��:@\�.��\"�1�\��ǚ:@M�x$^�1���S:@\�\�)�1��4-�:@�׃I��1��n�\�o:@b\��vK�1�稣\�j:@\rU1�~�1��\�l\�?:@6\�,�1�\�c?�\r:@\�\�\�*\��1�p\�n�\�:@	�L�n�1�&\Z�\�):@@\�ի�1�,g~5:@.8��_�1�d\�\�A%\n:@�\��\��1�b\�\�!	:@Z�!�[�1�.�\�\�:@\�\�bE�1�#k\r��:@\�H\�\"�1�N\��1�:@\�\�\�\Z�1�\�O\�s\':@�7�-:�1�ߌ���:@ŏ1w-�1�x\�\�e:@(�N>�1�d\�\�:@�\���^�1�\�W��\0:@&\�\\R��1��Cn�\0:@�ަ?��1�\�q\�\�r�9@�\\\�wb�1�`�_?\��9@ȷw\r��1��C�b�9@��͎T�1����\���9@\ZPoF\��1�\� \�\��9@\��`R�1�ǁW˝�9@�,&��1��\�R$_�9@�z\�\"0�1��\�V\��9@.Y\�&�1��Z�[!�9@�l\\�1��2\�FY�9@�x]�1�zUg���9@͏����1����e�9@2��\��1�\0\�	��9@�1>\�^�1�$��t��9@\�G\��1�I\�L�\��9@Ωd\0��1��E\�n��9@n���1�l\ndv�9@\�\��!o�1�1\���\�9@U��N��1�\�J#f\�9@+/����1�\��o�\�9@r�#D�1�2w-!\�9@Qk�w��1�9d\�b\�9@}\"O��1�,-#��\�9@�\�AA)�1�t\�\�q5\�9@�\�e1��1�½2o\�\�9@Yk(��1���?Q\�\�9@\��\"�-�1��\�S:\�9@�BY���1�\0֪]\�9@\'�|��1�P8��L\�9@\'�\�d\��1���ŋ�\�9@X�\�0_�1�\�Ѫ�t\�9@����/�1�\�	F�\�9@dyW=`�1�\'\"\�\�9@�5Y��1��~\�٭\�9@#�=�1���\�C\�9@�o`r��1�\�o�[\�9@\�\�~���1���{h\�9@@�#H��1��n�;2\�9@�\\o���1���ݰm\�9@\�=]ݱ�1��J�\�9@�\�(ϼ�1�X\0S\�9@`̖���1�n/�\�9@�\�\�-\��1�\�v�\�9@~�$A��1�E�k\�\�9@�\"\�dT�1�d\�C\�\�9@\�Ɵ�l�1�p]1#\�9@t\n��1�\�S\0�g\�9@[`����1�\�6��\�9@�6\���1��׹i3\�9@\�\�\�D�1�e��~�\�9@^ؚ���1�\�T2\0T\�9@�-�v�\�1��Ɍ��\�9@�~�n\�\�1��D�e\�\�9@n/\�1����X�\�9@�?�J�\�1��\"���\�9@��n�\�1��\0\�\�9@��z\�1���\�\�9@�G�C�\�1��^\�D\�9@\�\�\�\�\�1�t\��\�\�\�9@��q\�\�1�	�c\�9@\�g��\�1�\�\�\�2\�9@�X��\�1�w�\�o\�9@1A\r\�\�\�1��9�\0\�9@h=|�(\�1��K���\�9@P\0\�Ȓ\�1�\�[\��b\�9@wg\��\�1�\�:��T\�9@�{��c\�1�i�\0�w\�9@]\�\�7�\�1��\�镲\�9@/�\�1�\�ދ/\�\�9@�\�ң\�1�^c��\�\�9@\��fH\�1�m;m�\�9@\���c�\�1��G�R\�9@\�o\n+\�1�\�%\�/\�9@����@\�1�\�A��\�9@\�\�J�\�\�1��y�Cn\�9@Ad�&\�\�1�p#e��\�9@��d9\�1�v�uŌ\�9@\�b\�J!\�1�;�\�\�.\�9@aU��N\�1�\�L\�T\�\�9@�N$�j\�1��	0,\�9@ș&l?\�1�����Y\�9@�[�nK\�1�f0F$\n\�9@�:�/K\�1�l$	\�\�9@R\�.��\�1��]P\�\�9@-@\�j\�\�1�I-�LN\�9@\�7i\Z\�1��G��\�9@\�蹅�\�1��J\�^\�9@�,\�}\�1���4)�9@��:ǀ\�1�M�d�ѿ9@�\�D2\�1�׿\�9@ѮB\�O\�1��.o׺9@�E(��\�1�;\Z���9@.9\�\�1��++MJ�9@�\�M~�\�1��\�2�P�9@�\�o\�\�\�1�\�HLP�9@�\�R\�\�1����߳9@\�WWj\�1���y�9@\0A�\�1��8G�9@\�v\�\Z\�1��X���9@�\�ŉ�\�1��H�]�9@\�H�}\�1�|�ڥ\r�9@�-\�l\�1�\�xwd��9@NG\07�\�1��\�+H3�9@��9]\�1�S\�\�%��9@HR\�\�\�\�1���!��9@\��L�\�1���\�T�9@>z\�}\�\�1�衶\r��9@q\�0\'h\�1�q:\�V��9@�\�\�-\�\�1��/\�r�9@;q9^�\�1������9@�W�L�\�1��W}�9@ʇ�j�\�1�h��9@M�\��\�1�s	\���9@�\Zb.\�1��i4��9@\Zn�\�\�1��}V�)�9@�\�bc\�1�(CUL��9@s0�\0\�\�1��?ޫV�9@�&�%\�\�1�+\�3��9@ԙ{H�\�1��\�\r�:�9@\�\�#�\�1�A\�}\0R�9@\�7��\�\�1��\��B�9@\�\�|#�\�1�\�э���9@�\��\r\�\�1���ip�9@m���\�1��\�_Yi�9@><K�\�1�8�{\�5�9@��TN{\�1��-\�R\\�9@��n�;\�1�\0\�4�9@:�w\�\�1����Ft�9@��ƽ�\�1�\�(�\�P�9@	�v\�1�&TpxA�9@^�I\�1�B&9�9@j�{�\�\�1�\�\�Xǉ9@�=\��\�\�1��9��ˈ9@y:W�\�1�\�\rM\�\�9@bI��\�1�Է\�\�9@\�߄B\�1�Χ�U�9@w/�\�Q\�1��\�P���9@^/M\�\�1��ᱟł9@��;\�\�1�=\�!7Á9@�\�\�\�\�1�J/��9@h͏��\�1��3��E�9@^*6\�u\�1�\�bFx9@3\��O\�1�\�LLb}9@W@��\�1���\�i2{9@�j\�\�\�1��R\�\�%y9@|`\��\�1���DKv9@\�L��\Z\�1����U�p9@	�n\�1�����3o9@?\�\�1�k~��Em9@&\�5\�\�1�\�S:Xk9@ׇ�F�\�1���\��5j9@G�`\�\�1�z��Q�f9@�x\�[\�1��̕Ae9@rl=C\�1�F�\r2\�d9@\�\�\�nI\�1�\�\�\�\�Ba9@�&�|�\�1����\�Y9@�HJz\�1�,���X9@�j�#�\�1�o�o�>O9@�Z�\�1�\�\�9\�}K9@���?Q\�1���{hG9@�H�}\�1�p��:\�D9@2W\�\�1����\�B9@\�hr1\�1���@9@N	�I�\�1���\�V?9@H�`\�\�1�\�R\\U�=9@\ZM.\��\�1�fk}�\�69@�IEc\�\�1�2\���59@�$y�\�\�1�\"QhY�39@s\�<G\�\�1��ٲ|19@%\�\�R\�\�1�*Ral!09@/R(_\�1�\�im\Z/9@N�q\Z�\�1�F\�-t%.9@�\�4\�R�1�\��fH-9@]�C�\��1�lA\�!,9@e�\�7i�1�\�ؗl<(9@TUh ��1�34�\�(9@;pΈҶ1�,�\�\�(9@eRC��1��#�\'9@\�^\���1�\�9\"ߥ$9@\��B�1�R\�>\�G#9@�_\"\�:�1�C9ѮB\"9@�����1��W!9@&���1�X�x�!9@M�St�1�-\�\�!9@-AF@��1�Tn��\�\Z9@\n�ʼU�1�O�)�\�9@��ٮг1��>\�9@�����1�/��\�\�9@\\\�M\r4�1��\�+H3\Z9@)B\�v��1�\�\�mU\Z9@~\�Az��1�<f�2�9@��`U�1�\�P�n9@_D\�1u�1�F\�\�\�9@e\ZM�1��r��9@8en��1�/\�\�\�9@~\�Az��1�\Z0H��9@�\�\�i�1���.�9@\�\�\���1�O>=�e9@\r����1�j�֍9@zq\��1�nnLOX9@��o\'�1��m�29@ݗ3۝1�\�ՏM�9@Q��B��1�w�$9@\�Ѫ�t�1�#e��\�9@|ds\�<�1�\�:�\n9@䃞ͪ�1�B\�<�E\n9@\�w���1��]P\�\n9@a\�>�1�}ԛQ9@#�J %�1�ak��9@����ۗ1�{��\�w9@|���1�\�\�R\�9@6Y���1�k\'JB\n9@`\�\�8�1��\�߼8	9@}\�X���1�\�V\�I\�9@\��Y��1�[\��Y9@��c�1�6�\�9@\�{�i1��s\�^9@z�Cn��1��L!9@\rnkϗ1�pC�׼�8@4M\�~2�1�;\��\�R�8@�z2�\�1��\�$���8@c\n\�8��1�\\r\�)�8@��N]�1�EF$a�8@f\�?��1��\�\�\��8@n�2d�1�>\�\Z-�8@E�\n)?�1�\�\���\��8@��Ō1�	O\��\'�8@����1���)\�d�8@\nףp=�1�.\�s`�8@ ��\01�L\�\�\��8@a��\�|�1�Tt$���8@o\��1��i\����8@�%�\"܀1�Oyt#,�8@\�\�@\�S1�^M����8@�/�^|}1��\�\�~��8@��#z1�_\����8@r \nfx1�b��\�\��8@ڨNv1���^~�9@Ý#�t1�\"��gx9@&\�\�\'ds1�M�Nϻ9@\�˻\�q1�\�\�R\��9@�s�p1��\�\�\�9@��H�p1�(\����9@\rĲ�Cn1�ˁj\�9@\�\riT\�l1��=\�\n	9@IH�m�i1�\��E�9@�<\r$i1��׻?\�9@rl=Ch1�(E+�9@�Gp#eg1��*�\�9@)@̘f1�ǃ-v�9@���\�\rf1�n��\ZK9@jܛ\�0e1�=_�\\69@ծ	i�a1�p\�\�s�9@\�C�|`1��V\'g(9@�;ۤ^1�e���\\9@�;Mf�]1�5�;�9@�Y�\�\�\\1��:�p9@�\�Z1�g{�9@עh[Y1�p?\��9@k�MGX1��,�9@x�7N\nW1���)9@��u\�U1�l����9@M��~\�T1��g\�ej9@�]0�\�R1��\��n,9@�\�鲘P1�|V�j	9@IC��O1��\�ǘ�\n9@:=\�\�N1�L���\�9@���	.N1�\�\�cw\r9@��qM1�Q��C�9@\��d\�L1��,_�\�9@��\�L1��/���9@3�f�K1�\��o�9@R�8�\�I1�\�M�q\Z9@Zf��H1�t\�\�\�9@\�\�ùF1��<�;k9@\�C�|D1�q:\�V�9@㊋�rC1�E��S9@7�n�A1��}s9@\��mRA1���-=�9@��B=A1��\�3�\�9@(�.�\�@1��Z�9@\\\�d8�?1�t\�\�9@\�\�\�Qc>1�n\�\�)9@ٳ\�25=1�<0��9@\�x\�@e<1�&����9@ʌ��^;1�\n��\Z9@���\��91�\�r.\�9@\ng��\�81�x��\�\�9@�mR\�X71��Nyt#9@��S�61�I��&\�\Z9@\��c!:41�F�xx\Z9@:�\�H31���,\n�9@\��\�21�-{؜9@�Z	\�%11�*9\'�\�9@\��}8H01�U�=ϟ9@t\�\�q5.1�<\�b�\�9@w��\Z/-1�9\rQ�?9@��\�\�+1��im\Z\�9@�q\�Z|*1�nߣ�z9@H�]\�\'1��~\�\0\Z9@�GW\�&1��#��\Z9@_\�(\�%1�J~įX9@ѭ\���$1�\�PS\�9@\�\�jH\�#1�Кi9@���?Q!1���T\�9@�ɐ1�aQ�� 9@��H�1�/�\�!9@�M�t1��r�9>\"9@�\�V%�1�\�\�\�U#9@g��\�p1��6\0%9@;V)=\�1�H7¢\"&9@FИI\�1��iP4(9@ĕ�wF1�\�(yu�)9@��\�ާ\Z1�w�**9@��u\�1����z*9@PVW1��Y,E*9@1A\r\�\�1�\�m½2+9@�K\�^1�\Z�\��+9@�#��1�D�7�,9@��Rb1���.�,9@\�&���1�z4Փ�+9@��\�N�1�\���s+9@a�ri�1�C7�\�*9@�8\�Z�\r1�Ui�k|*9@/�\�Q�1�\"R\�.�)9@\�7>[1�\�\�z�V(9@\�\�C\n1���v\��\'9@\��q6	1��0�(9@\�xͫ:1�\�\�\��r)9@�ҥI1�s-Z��)9@�2�681�z\�0\�)9@�F�q�1��&c`)9@\��.�1�%\\\�#�)9@/\�$�1�:�w\�*9@&�\"\�d\01�P9&��+9@M��f��0�\��%,9@�)�D/�0�4�\�H,9@�\�>rk�0�\�YL,9@àL�\��0�\�%\�/,9@�@��_�0�\0t�//,9@h�o}X�0�m\�i�*,9@@�P�0�Z.��+9@àL�\��0��w}\�+9@\����T�0��DKO+9@��dV\��0�+���\�*9@�-$`�0�C\Z8\�*9@L<��0�N�0��19@�I\��0�1DN_\�?9@�p̲\'�0���M+A9@\'jin��0�\�\�	L�A9@\�HLP\�0�?6ɏ�A9@�\�2n\�0���H\�B9@\�G�\�0�\ZyYC9@\�>\�-W\�0��5\�D:9@�,�\�o\�0�x\�캷:9@t�\�0����\�:9@\�捓\�\�0���g;9@$0�\�\�0���\\��;9@b�\Z���0�]�\�=9@i�\�+I�0�\0Sh=9@�dU���0�\�J�R\�=9@\�\�\��0��\�[u>9@QhY���0�\�\�!S>9@O�\�\��0�7\�^��>9@f1����0���&3\�>9@�\�7��0����\0?9@\�r�c��0�fKVE�=9@�\�{L�0���\�3.<9@)\�\�q�0�;�� \�:9@#LQ.��0��b\�\�99@ND���0�\�D�k\�79@\�б�J�0���rf79@h\�4��0���Z�69@\�2\�,%�0�=C8f\�39@\��Kį0�\re�f29@\�|��\�0��\'�.�09@,)w�\�0�*�\�D09@�\�\����0�\�xͫ:/9@\�\�����0�öE�\r.9@\�\����0�2\�\��,9@��pY�0�a����\'9@�a��߬0�&\�\�%9@\�L0�k�0��Op��\"9@\�:�v٫0��T\�:9@\��l�0�� 9@�!U��0����	.9@�/�^|�0���ɩ�9@Է\�鲠0�\�\Z\�*�9@�R\�h�0�/i�\�Q9@�g\�,�0�<��f9@}�͍\�0�2k�M9@D�Ö�0�f2\�g9@Y���.�0�l\�\��9@&�R?o�0�ƨk\�}9@3�68�0���,\'�9@ж�uƓ0��}\�\�9@F\\\0\Z��0�\rU1�~\n9@`?\��0��\�:TS\n9@Y�.\��0�?Ȳ`\�9@��-�0���o�9@f����0�a\�\�+e9@���[�0��\�#09@���\�_�0�Ec\�\�l9@Z�1\�	�0�\�\�4}9@��ؙB�0��5Y�9@1x��͉0��^\rP\Z9@��;�B�0��Nyt#9@��Z��0�g��e9@\�\�~���0�U\�\�\Z�9@\�A�\�ނ0�2\0Ǟ9@40�&�0��Fˁ9@�tۀ0��}:39@d�\r1~0��s�p�9@G��t}0��b*�9@ڮ\�\�|0�� L�	9@\��\�e�z0�@\�,\�	9@﮳!�x0����p\n9@{��\�ww0��\�N9@.Ȗ\�\�v0�\�\"0\�79@\�\�Q��v0�\�\"��9@���V_u0�-z�m9@M�J\�t0��h:;9@%\�?�t0��=\��\�9@]\�].\�s0�\� v�\�9@�>�r0�\�\�\�\n9@\�fF?\Zr0�\�\��r-9@\Zi��q0�\�Udt@9@?�mp0�\�4\r�9@��x\�o0��{�P9@LKo0�6\�D.9@�V\'g(n0�Yk(�9@Q\�\�\�m0�K<�l\�9@��|	l0��\�im9@GW\�\�j0�\�8\rQ�9@���V_i0�\�)s�9@\�.Q�5h0�2��\�\Z9@�}V�)e0�S\�k%t9@}w+Kd0���֥F9@��\�\�c0�_���F 9@`V(\��`0�-B�4!9@w\�Df.`0����·#9@�j�j�^0�74e�$9@�b�:\0^0�\��;\�$9@�d�\�]]0���֥&9@\�<0\\0����Y.\'9@}���[0�\"H�*9@A���Z0��Ƥ�/9@n��ŨW0��*�\�19@�1\"QhU0�L\�1�=29@�1\�T0��G7¢29@\�8~T0�E����39@\�9\�}\�S0�$Di69@��gS0�Q�B\�y79@ܹ0ҋR0��\�k\�99@\�%ǝ\�Q0�\�zj�\�99@e5]OtQ0�G��:9@O�s�P0��Į\�\�:9@\0�d\�FP0�ްmQf;9@ׄ�ƠO0����?<9@ c\�ZBN0�\�\�E_=9@|}�K�L0�ԛQ�=9@rm�\�K0�ڨN�>9@\0�={.K0��t{I?9@� \\�J0��/g�?9@���v\�I0�E�@J@9@K\0�)I0�Q��9A9@��0(\�H0�Ș���C9@٘\��H0�6�.6�D9@仔�dH0�k�)\0F9@!��H0�	��g�F9@8i\Z\�G0��^�SG9@�\n\�\�\�G0�0Ie�9H9@�x#�\�G0�\n�i�\�H9@\�\�q5�G0�$%=�J9@��\�\�F0��u\�~K9@��Դ�E0�6u�K9@l?\�\�D0��e�I)L9@�\��<�C0��KTo\rL9@#�tu\�B0�l�`q8K9@��\�\�a?0�\�\�1\�3K9@\�\�B�i>0�G:#/K9@\�/�1\"=0���\�{*K9@צ��<0�6 B\\9K9@5\�b�\�:0��հ\�K9@��B\�\�80��\�l�\�L9@\�9�!70��/Ie�M9@�A{50�(\�hr1N9@cAJ40�q\0��O9@M�T�20��\�=\�P9@xρ\�10���>U�R9@�\�\���.0����CS9@\�o&�-0�� %\�T9@I�2�\�*0��a\�\r�U9@	5C�(*0�%�\�eW9@���j�)0��t�(%X9@\����>)0���!�\ZY9@ADj\�\�(0�1\�Z{�Z9@�(�1\'0��Fw;[9@R_�vj&0�\�U�3\\9@��d9%0�\���{�\\9@���&$0�\�<�E~]9@�h\�V#0�ͰQ\�o^9@:ZՒ\"0�Kr��&_9@�\�-\"0�Ii6�\�`9@ |(!0�\�\�\�na9@m�_u\� 0����\�b9@\�ڦx\\ 0��)\�dqc9@��\��0��xy:Wd9@�[Z\r�0�\��we9@:��KT0����\'f9@QL\�\00����Org9@R\r�=�0�ٵ�ݒh9@Mh�XR0���~Pi9@�I��40�\�u6\�i9@f�\�\n0��\�VCj9@�����0�d\��\�j9@�1�#0�3�}ƅk9@nj���0�T\Z1�\�k9@�ѩ+0��C�\�\�l9@\��3�I\Z0���i�{m9@\�ܴ�0�\�^}<�m9@�0�7P\��|n9@o�[t�0�/��$o9@^*6\�u0���Ƅ�o9@V}��b0�$Din9@�X\"�0��\�5&l9@\�3�\�X0��}ij9@�V$&�0�r\�\�Q�i9@\� �rh0�ڮ\�\�h9@�)x\n0�>�Ӟ�g9@��$\�p0���0Ee9@�n��0�\�!Hc9@\�c\�\�0�f��\�a9@��0B0�m:�Y`9@+�0�T9\�)9_9@��\Z/\�0�!W\�Y^9@�\�\�V0�\�\���]9@֨�ht0�>\�D�]9@gDio�0�����]9@��)0�\�_Z\�\']9@\��E�0���_#I\\9@�@0��\Z�D�Z9@]��0���\�\"Z9@OI�0�4�9A�X9@�\�&��\r0�\�^\��W9@\�1uWv\r0��E\�n�U9@\ne\�\�k\r0�\�Q*\�	U9@�\�\�\�0�\�\�yT�S9@U�\�\�B0�*7QKsS9@Yj�\�h0�H\�c\�CS9@v5y\�\n0�qvk�S9@ѓ2�	0�*s�\�R9@\�b\�J!0�%\�pt�R9@a�HZ0�Ab�{�R9@36t�?0��Жs)R9@}\"O�0�˼UסR9@\�=�>t0��gx�S9@�\n\�b�\00�4����S9@^���\00�3d��S9@�ȭI��/�\�\�nIT9@�\����/��|$%=T9@\"�4��/�\�\�vhXT9@\�\�>�Q�/�\�	��.U9@K;5��/���V9@p[[x^�/���߆W9@Ral!\��/�X���\�W9@|,G\��/��=#\ZY9@-&6\�\�/�<�BusY9@�\�\�l\�\�/������Y9@\�\�o{�\�/��.ȖY9@E\�[\��\�/���W9@\�>�̔\�/�Hj�drV9@3Q�\�\�\�/��d:tzV9@_(`;\�/�dZ�\��V9@�I\rm\0\�/��V	�W9@e6\�$\�/�bI��_9@\�\�1\�\�/��!�\n`9@\�k\�,	�/��g�a9@x�з/��(_\�Bb9@�\r\���/���r�mb9@L\�\�ݴ/�q\�Ws�`9@	Q����/���n�`9@E)!XU�/�U�q7`9@Y�yVҢ/����\�Bd9@�(���/�\�\�\��e9@;\�Ԗ:�/�ݗ3\�e9@e6\�$#�/����$e9@�\�k\��/�� ��qd9@�)��/�3�\�3d9@4�/����!9e9@U�	g�~/��Q�de9@�%P6}/�D�+g\�d9@2w-!|/��oD��c9@_F�\�\�z/�\�T�G\�a9@\�\�8\ry/��S��Y`9@iSu�lv/��^�_9@�&�\�t/��\�ފ\�\\9@V\��D\�m/�\��-\\9@&���n/��GS=�[9@\�+���n/�\�a\�7�W9@t|�8cx/�@��r�V9@�J�({{/����;V9@\�KS8}/��>T9@\�,^,�/����R9@A��h:�/����\�\rR9@\�,\��/��ng_yP9@\�\�\���/�?74e�O9@\�3�\�X�/�2v\�KpN9@k*�/�+O \�K9@^�SH�/�\�\��6�I9@\���\�/��5\�;NI9@5	ސF�/��\��H9@y\\T���/�{\�L�xH9@:�Y��/�\�B;�YH9@\�\'\�>/�lxz�,C9@��M�r/�?�\�VB9@h���p/��*��A9@\\W\�o/�\�\�x\"�?9@��Z�j/�&ǝ\��>9@�E;�i/�Œr�9>9@�@�\�\�h/�g\��\�=9@\\�~l�g/������=9@Pr�Mdf/�k�*>9@�]�9\�c/�ŏ1wA9@8��\n*Z/��1\�	\�D9@28J^�[/�a5��F9@�\�H.�Y/�\\����G9@Ӈ.�oY/���_#IH9@�bG\�PW/�X�vMH9@v��\�/R/��3��EH9@�?Pn\�O/�����H9@s�\�{�M/�d��\�^<9@-�\�o�;/��\��\Z99@\�vhX�:/�֌r99@oH�7/�q�J[\\79@|E�^\�3/�z�3M\�69@\�W�f,2/��*n\�69@\�\�.�u//�\Z��b�<9@\�ej�!/�\�\�\�H�=9@��z2� /�x�\�>9@�S��Y /���\�qn?9@$��\�/�\�u\�\�?9@\� ���/�\�x\�&1@9@܀\�#/��\�;jL@9@~\��\�\�\Z/�\�p\�Ws@9@�r�\�{/�P�\�\�@9@J�i�/��Ӻ\rjC9@�[z/�Z_&F9@\�A�p\�\r/���\�I�F9@�\�7\�/���V\'G9@+N�f	/�\��-�G9@d����/�Ȳ`\�F9@\�@�]�/�Tt$��D9@�d\��/�\�b�T4B9@\�yT�\�/�ལƄ@9@�w\�1/��\� !\�?9@*Wx��\0/�eS��>9@Pqx��.�Y\�&�>9@\0X9\��.�\�2ı.>9@�	ܺ��.�s���=9@C�(^e�.�\Z4�Op=9@3d���.�E�N�\�=9@�X���.���&3\�>9@�\��\�\�.�1DN_\�?9@\�\��hq\�.�z�\�w)A9@\�U��\�.�\�M\�A9@�[ A�\�.�\�b�0\�C9@ˠ\�\�D\�.�ș&l?E9@ʥ��\�.�\�\�׺\�H9@Z+\�\�\�.�H\�\�\�\\I9@_~�Ɍ\�.����\��M9@�\�v�\0\�.����f�P9@z\�΅\�.�\�\�zi�P9@~�4bf\�.�p^��jO9@R<��\�.�N_\�\�,O9@Ȳ`\�\�.��\��\�\�N9@bX9�\�.�\'��\�KN9@�v\�1\�.�t)�*�N9@\�V*��.��ʾ+�S9@�wG\�j�.�\��_T9@�8+�&�.��\�מYV9@����.���&3\�V9@?9\n�.���\�U\�V9@�)���.��v5yV9@)[$\�F�.��s�\�U9@x��\�Ĭ.��@\�)VU9@E�$]3�.�\�K6lQ9@���{�.��R�ZQ9@�\"�ng�.�l\\��9@�P\��.��\��\\4�9@�\�F\��.�\�)��\�9@��\�Y��.�臭���9@��V���.��\�\��:@\�w��D�.�+1\�J\":@�h[͚.�\��i\�[:@�D/�X�.�mY�.\�:@\�AB�/�.��^)˘:@��ŋ��.�\��iܛ�:@�0��.����(	\�:@\�\�[�.�6\�,\�:@A�M�G�.�oe�\�2�:@\�X\�׷.�_�L\0;@*�~��.��@I�\0;@��E\�T�.��֥F\��:@�?����.�%\�\�\��:@�8\'0\�.�$a\�N�:@%\��\�\�.�/PR`\0;@��=\�\�.��W zR2;@\��)\�.��.ȖE;@M����o/����\��E;@\�\'G�p/�\�1�\�lF;@\�ܴ�q/�\�2��F;@���-=r/�QL\�\0G;@\�,	PSs/��7�G;@x�q\�Zt/�+2: 	G;@\�\�\�u/�\�>\�-WG;@*\�t��v/�\npUJ;@IZ\��{/�;n�\�tK;@ۣ7\�G~/�o\�L;@W&�R?/���K\�L;@\�x\"��/�G\�\��M;@�}�\�Ł/�8�-:YN;@AG�Z�/����\�N;@{���/���C�N;@�m��\�~/�q<��N;@\"��u\�|/�m\���{N;@\�9x&4y/��mp�N;@\��w/����[�O;@\�\�\�\"v/�\Z�uT5Q;@�\�(�u/�ϼv\�Q;@��Ƅ�s/��\�.4\�Q;@(F�\�q/�\�.\���Z;@�;P�<R/�\�ƃ-v[;@h�O/�A��\�F\\;@7�~L/���a];@\�\��R�I/�g_y��^;@��RAEE/���)�D_;@�L\�*�A/��-u�\�_;@�\�\"�?/�=HO�C`;@!��=/�\�p>?`;@�a�Q+</�c(\'\�U`;@!yv9/�\��Q�`;@�;2V�7/��B�\�\�`;@�\��o^4/�29�3La;@�\�\�1/�\�O��nb;@$�\�;\�./��zܷZc;@�9�\0-/�zod;@$���~+/����=�d;@U\�z�)/�\�\�~��d;@�x\r%/�2��d;@\�~��#/�\�&��d;@>{.S� /�R�\�\�d;@\r�\'�8/�Z� e;@\\!�\�/��\�&�e;@�_w��/��tF^f;@Z�N\�/��6qr�g;@$\�\�(�/�#�\�Jvh;@\�Χ�/�+\��h;@\��0{\�/�j�WV�h;@f.py�!/�(�bd\�h;@��1��#/�\�س\�2i;@�L2r&/��=	l\�i;@\�*�C3\'/��{\�5Zj;@4`�_\'/���2SZk;@\�\�I\'/��/g�+l;@���2�&/�g��em;@�s\�\�q%/�3�p�an;@,�)$/�\"�4�n;@5_%�#/�x_��o;@�30�&/�l\�<*�o;@�l;m�(/�j���vp;@]�&�*/�jP4`q;@6 B\\9+/�\�0��r;@��\�SV+/�N~�N�r;@:=\�Ƃ*/�~�<�r;@��]/M)/���\�Ĭs;@^emS<&/�%̴�s;@�qo~\�$/�r1\�qt;@\"�\�<#/��\�{\�\�t;@;U�g$\"/�\�AA)Zu;@\�)9\'� /��QF\\\0v;@;��T\�/�\�A\�Ѫv;@�z�\�{/�\�y��w;@M�\rO�/�\\\�	�y;@�,�\�o/�\�\��{�z;@��s\�f/����,\'};@B��	\�\Z/�ǽ�\r};@@��w\�/�<jL��|;@�۽\�\'/�\�/J\�_|;@�_\�\�M/��*\�3};@�`���/�8K\�r~;@�O�\�/�46<�~;@Hū�/�u\�b�T�;@�V\�f/��C\�ͩ�;@\�\�rJ@/�\'3\�Vz�;@\�8\n/�6\�,�;@�k���/��\�\�׃;@���&�/�?Ȳ`\�;@�\�6o�/���G���;@z\��\�3/�ʇ�j�;@��\�Z�/�^M����;@�*4\�/��\�2R\�;@K\�^b/�L�\��\�;@�\�\�\�\�/��F!ɬ�;@��\�/�:�۠��;@\�<c_�/��]h�ӄ;@\�:q9^/�T\�\�$[�;@�Ǚ&l�.�5F\�j�;@_a����.���;@��I~\��.�X\0S�;@;��.R\0/�\�\na5��;@�\�g\�\�\0/�\���k�;@��v\�\0/�\Z\�kA\�;@�b\r��.�p>u�R�;@T\���.�m\�\�]ى;@U4\��\��.��9���;@\�@e���.�ȗP��;@` ���.�@�&M��;@OjM�.��\�\�V\�;@�,���.�G�\����;@	��8��.�\�\�\��h�;@\"��u\��.�&��\��;@P÷�n�.�e\����;@@/ܹ0�.�mo�$�;@�y�3M�.�8\�ܘ��;@C �8��.�j�t��;@\�t����.��\�QcB�;@H��5\\�.�\�v��;@��`U�.����\�;@U/�\�d�.�������;@�Ljh�.�3�}ƅ�;@W�\"��.�\�y�ȏ;@j�WV��.�k\�m�\\�;@F��\\\Z�.�1\�q��;@�\�<�/�i\�V��;@3܀\�/��q6�;@�\0ݗ3/��V\�f�;@���Ա/����\�;@I\�\�\�/�\�&2s��;@y\�ՏM/���\�	��;@�lY�./�<�\��r�;@d�\�3�/�4-�2\Z�;@Ԟ�sb/�Ӥt{�;@Օ\��</����\�{�;@/�HM�/�wf�\�\\�;@Z��\�f/���u�X�;@A��/�4��\�l�;@\�g#\�M	/�a5��6�;@E�>�\'	/�m���;@ͱ��/�m���5�;@�\�P�/�yܝ��;@o��/�c\�tv2�;@�{)<h/��Z}uU�;@�j\�v/��D\�Ɵ�;@4\��`	/�\�\�à;@�\�o\�\�\n/�f�\�(Ϡ;@�N/�1\�����;@p#e��\r/��?�ϝ�;@9\�\�m4/�\0\�]���;@tϺF\�/��mQf��;@��C�R/��|�R��;@6�.6�/�\�аu�;@g\n�\�\�/�P�V\��;@���\�I/�\�	F��;@��\�,\�/�)[$\�F�;@\�\�!�/�\�d�<\r�;@�jIG/�\�T����;@�+�\�\Z/���~31�;@�\�\�L0/��/L�\n�;@\�8b->/�&VF#��;@\�[[% /�\r�\�۟�;@s��\"/�t\\�\�J�;@�M�a�#/���\�t �;@c`\�%/����Q�;@�aۢ\�&/�ӽN\�˦;@LnYk(/�\ZM.\���;@,g*/���\\mŦ;@ۢ\��,/��P�%��;@��B=-/�*:�\��;@\�\�b�,/��tZ�A�;@��a,/��k$	©;@\�n�-/�-Ӿ�;@\��\�o//�O\�\�\�N�;@tϺF\�1/��F\�ҿ�;@ta��3/��z�;@r6\�4/��V`\�\�;@H��\n6/��[\���;@毐�28/�\�\��\�L�;@�W\�:/�TW>\��;@��</�;\�Ԗ:�;@�\��\�q?/�\���P��;@q\�Ws�@/��\�\\\��;@�Z\�7\�A/�j\�\�4ӥ;@��c�\�C/�J&�v�;@.�!��E/�*\�t���;@\�5\�KoG/�\\�nK\�;@���3�H/��6�X��;@/�\�I/��l ]�;@�y\Z0HJ/�\Zn�燩;@5&\�\\J/�\�<��t�;@�h[\�J/����eN�;@\�[��K/��`���;@\�G�L/��\�/-\�;@\�_vON/�^,�ӫ;@A��LjP/�\�t\����;@\�}�R/���|��;@��_�T/�����;@_\�\�WV/�_%��;@\�\�-W/�Q��r��;@N*\ZkW/��衶�;@��ؙBW/�ٲ|]�;@Ϣw*\�V/�[$\�F�;@�Ũk\�U/�4���;@6sHj�T/��\�d�`�;@wf�\�\\S/��}s�;@\��x�ZQ/�\�Xl���;@�g^�O/��m��;@! _BO/��\"\�\�)�;@�Į\�\�N/��-\�R\\�;@F^\�\�O/�\���Ե;@��\��kO/�u��;@C�=�P/�e\��Q�;@\�5�o�Q/�\�\�\�V�;@L7�A`U/�r�\��;@Mg\'��T/�!XU/��;@I\�\"i7R/�\�\�aN�;@� \�P/�[]N	��;@�}iN/��R?o*�;@\�^zoL/�Ts��P�;@�	��I/�z�W�;@�#*T7G/��L�T�;@�����F/���\�\�k\�;@ur�\�G/�BC�\�;@\��ԱJI/�{�p̲\�;@i\�\�IK/��� \�>\�;@�J\�hM/����\�;@J�i�O/�/R(_\�;@Y|EO/�\�[[\�;@\�>rk\�M/�\��R�1\�;@4�y\�SO/�\�t\���\�;@\�_!seP/�N�#E\�;@\���0Q/�� \�\�;@ir1\�Q/�H\�\�\�\\\�;@|�PkR/��\�LL\�;@Y��S/�2\"QhY\�;@3m�\�JS/��r/0+\�;@0עhS/����oa\�;@�I|\�S/���\�\�U\�;@�+�\�R/�FA��\�;@�MG\07S/�3�\�V\�;@�&�\�T/��\�<\�;@\�\�#�V/�˻\�\�;@u \�\�W/�`�E\�\�;@\�i�*�Y/���\�K\Z\�;@����[/��G��\�;@)�	0\\/�{JΉ=\�;@\�o�[\\/�\�v��\�;@#\��~j\\/�?\�\�\�\�;@N\��1�]/��y7\�;@�2p@K_/��\�\�W;\�;@\���pa/�K\�4\�;@�\�`�\�b/�ҌE\�\�;@�M�a�c/���\�n\�;@*�n�Ee/�l�\�F\�\�;@��\�ȑf/�>���4\�;@���?g/���^\n\�;@T5A\�}h/�h$B#\�\�;@\�j�=&j/�\�\n(\�\�;@�0�j/��\0��%\�;@\�M\�\�\�j/�\"m\�OT\�;@-\�\�;�k/��N\�P\�\�;@�\�V\�l/�(\�>�\�;@PU��Xn/��\�s]\�;@+0du�o/�g)YNB\�;@\�L�:q/�;�I/\�;@���P�s/�7�ُ\�;@\�\�\�t/���o\'\�;@I\�L�\�v/�L�\nF%\�;@Ii6�\�x/�xe��\�;@�\\\Z��z/�\0\�Ȓ9\�;@�\�I`{/�\�\�tp\�;@� x|{/��k\��\�;@R�{/�O\�9��\�;@w�4E�{/���)Wx\�;@�:�p{/�\�I�U\�;@h[\�:{/�\��\�O\�;@�O\0\�\�z/�Eb�\Z�\�;@�z��y/� <�\�;@KxB�?y/��聏�\�;@�y�w/�&\�\�\'d\�;@��1>\�v/���\n�H\�;@�.Ȗu/�:�6U�\�;@M��\Z�t/�&�v��\�;@\�Y�Nt/�t�\�)\�;@DkE�s/�<g�\�;@ʋL��q/���E\�n\�;@U[rp/����hW\�;@]�z\�n/�~�{�\�\�;@\�I`sn/��\�\�\��\�;@�\�V\�l/�I�s\n�\�;@r \nfl/����6\�\�;@�r��m/�\�\�w\�;@�^)\�o/�X�L��\�;@*�\�Dp/��	M\�;@\�\�n�n/�\��LM�\�;@n1?74m/�f���8\�;@?\0�M�l/�	\�<��\�;@5�+-#m/�\�.PR`\�;@j�~�^o/�U��N�\�;@��M�p/��n�\�\�;@\�y�]�r/��\�VC\�;@1�{�Ov/�C\�5v�\�;@\�A	3mw/��\�\�\�;@I�Vy/�jl��\�;@\�\�\�U{/�\�G\�;@�~�7|/�wg\��\�;@Ãf׽}/�aR||B\�;@jg�\�R/����eN\�;@�S��Y�/�\�ֈ`\�;@s/0+�/���{�?\�;@�\�-\�|�/�dWZF\�\�;@�jIG�/�h׿\�;@F|\'f��/�x\�\�e�;@��O��/�-`�\��;@q\�q�t�/��(���;@��\�\n�/�)^emS�;@\�	�/�H�\��\��;@\�E\�\�\�~/�|\�o\�^�;@\�;~/�`\�\�V\��;@\�h9\�C}/����;�;@��0a|/�a6�\��;@-�\�Vx/�ƿϸp�;@r7�֊v/���)�;@�\���t/�k�\���;@pC�׼r/��B\�ʠ�;@G�,\�l/�=ڨN�;@� \�\�*j/�]\�].\��;@t\�\�i/�Cus��;@d=��j/�J\�E��;@\�\Z�Nm/�\�V��\0<@���Yn/�Z���<@\�\Z��n/��\'��<@\�+���n/�\�<+i\�<@.\�R\\Un/���Cl<@>?�n/���)<@U�q7�n/� �+\�p<@:@0G�o/��D\�[\�<@bodq/��G\�z<@���\�r/��9w�^<@4d<J%t/��\��\�\r<@�\�z�\�v/�\����<@�rL�w/��\�d<@\r��W\�x/�uV\�1	<@�����y/� <�\n<@Na���z/�=\�[�<@�\nҌE{/�Uj�@+<@!\���{/�\�\�\��6\r<@�\�\�,�{/�����a<@\�NG\�{/�W	�3<@WAt\�{/�vk�\�<@��S�\Z|/�\�.\�<@�\�3K|/�\�OT6�<@�(\�\�=|/����0�<@J�\��|/��Q+L\�<@`[?�g}/�Vc	kc<@�\�\�~/�N�E�<@t\��\�\�~/��?��\"<@YvQ�/�6?�Ң<@]��/���͋<@ٕ���/���H\��<@qt�/�\�&�\�<@B\�\�˄/��a��m<@_���/�!\�hUK\Z<@�\�ypw�/�`\�U,~<@u\�8F��/���\�G�<@�\�ȑΈ/�v�X�<@>\�ͨ�/����r�<@\�a�[>�/�$����<@�BX�%�/���0�:!<@��\"1A�/�#�\�E�\"<@���)�/�Ę��R$<@�\�(�/�z\�΅%<@o�e���/�ɫs\�&<@\�\r�:��/��\�\�jH(<@:\�\�\Z�/�t��%)<@ٖg)�/�̘�5*<@(~��k�/����~�*<@q\�ő/�S<.�E,<@�<i\�/��\�M�\�,<@�ܙ	��/����\�x-<@S$_	��/�-Ӿ-<@S\�\'��/�\rP\Zj.<@���\'��/�\�\��;.<@�ߡ(З/�f�ʉ.<@\�4�\\��/��c��.<@�~1[��/�L\�[\�\�.<@d��\�^�/����)/<@�f\r\�W�/�q\��s/<@5\nIf��/�[y\��\�/<@Z~\�*O�/���\�Q0<@\���0�/�\�����0<@Χ�U�/��SH\�1<@\�&2s��/��bd\�3<@4iSu��/�){K9_4<@\�y��Q�/���sE)5<@0�GQg�/�X;�s\�5<@Q\�\\�m�/��DkE7<@2t\�/�c\�tv28<@ę_\��/�\Z\�.\�8<@�ܚt[�/�\�\"��:<@|V��/��TPQ�;<@l\�,	P�/�c\�=y<<@\�\�\�e�/���h\�=<@��\�-�/�c\r��?<@�\�j,�/��d�P3@<@Z,E�/��V���@<@�B˺�/�0��@<@t@�\��/��WA<@t�?Pn�/��(\r5B<@��\�\�/��?QٰB<@\�\�G��/�f/\�N[C<@\0\�Z�\0�/��S���D<@\�l\�%��/�ddY0E<@�p��/�\�+�z�E<@�<֌�/�U\�z�E<@;��/�u\�\�mF<@m�Yg|�/��H\�\0G<@w�>XƖ/�1\���G<@B�۽ܗ/�\�s]�H<@��kCŘ/�P�i4I<@�K�b�/�2q� J<@\�\�\�O��/�P6\�\n\�J<@E+���/�\�\�y7L<@4f��/�@�\�\�L<@^f\�(�/���M�N<@L�e�%�/�.�\�n�O<@�\�\�vh�/�:\��lP<@_�sa��/�\"O���P<@-`�\�/�x�\�x[Q<@u�/��g\�,S<@�\���/��£�S<@\\*\���/���Z�\�W<@�}s�/�nYk(Y<@\�^\��x�/�#���Z<@�k\�\�/��\"k\r�Z<@I/j���/��N�o[<@�\�V��/��b\�\�]<@HP��/��\'I\�L^<@�CV��/�pa\�xw`<@(�r�w�/�ya�Xa<@i���/��\�6pb<@W\�\�:�/�m��b<@d\��ǒ/�Qic<@̳�V|�/�\�\�\�c<@ge����/�\�Ȯ��d<@�衶�/��\�Ze<@(��я�/�jin��f<@\�%�/�`>Y1\\i<@H�V�/��ܶ\�i<@#��ݯ�/��C�Öj<@�\��\�\'�/���26tk<@�Tl̛/��\��k<@V�j-�/�-Z��\�l<@O\�\�C�/��ӂ}m<@5��Ҟ/�-��\��m<@F\�\�\�\�/�\�\�\�2n<@H��0~�/��\�i2\�m<@HN&n�/�����m<@�\�a0�/��a\�\r�m<@t{Ic��/�?\�\�m<@\np�/�\���JYn<@öE�\r�/����o<@[Υ���/�N\�}�p<@��y�/���|\�rq<@��v�\n�/��_cDr<@�� \�>�/��\�\�Ks<@/j��\0�/�b�{�\�s<@\����/��\0\�m\�t<@�\�Ϸ�/�?rk\�mu<@\�+\�\�f�/�d��S�<@���U�/��a��\�<@�~�nض/�^\�\�-Ɂ<@�#c���/�ca����<@\�1��8�/�\���W�<@�@�m߻/�\�\�u��<@,�,\�/�m\�\�]م<@g\��ͽ/�\�\�a\�7�<@z\Z0H��/�r����<@�W��ͼ/�,G\�@��<@@��r��/�T�^\rP�<@\�\�bg\�/���&���<@��\�0\�/�j���v�<@\n�Ƿw\�/�\��-]�<@�ʾ+�\�/�\��[�<@֩�=#\�/�\�\�ُ<@T�^\rP\�/�\�eM,�<@\�52;\�/�}w+�<@v28J^\�/��+ٱ�<@@�ϝ`\�/��L\�*��<@��I\�\�/�Y�yVҖ<@Tƿϸ\�/�<J%<��<@�RAE\�\�/�!\�A	3�<@S\"�^\�/��CV��<@�J�*\�/��ۼqR�<@\�\�4}\�/�|��c��<@�p $\�/��\�̞<@y\�j��\�/��v����<@�m��\�\�/�yy:W��<@f�\�\\\�\�/�\�\�2��<@%W@�\�/��c\\qq�<@\0\�3h\�\�/��n�Ʃ<@ۤ���\�/�a��\��<@��,AF\�/�D�b*�<@.��\'H\�/�1\\\0q�<@Ϣw*\�\�/�%���<@\����\�/��4\�($�<@З\��\\\�/�!���\'�<@pA�,_\�/�{\�l�<@\�e\�\�\�/�VF#�W�<@��|г\�/�2Ƈ\�˶<@*\�J=\�/�*oG8-�<@���}\�\�/���n��<@�Fw;\�/�A\�+��<@�˸�\�/�\�\� w�<@*\��\�O\�/�\rU1�~�<@}\�\�\�\�/��ܙ	��<@\���=\�/�\Z�K���<@���GS\�/�G\��ǽ<@�z�<\�/��\�\�\��<@2\�L\�/�<\�\r��<@}w+\�/��ZD�\�<@�9A�\�/���v\�\�<@\n��O\�/�p>u�R\�<@t%\�?�/�Z�xZ~\�<@d�w�\�/��Pۆ\�<@P�\�\�b\�/�!%̴\�<@��A{�\�/�|G�	1\�<@��Ơ\�/���\�\�\�<@�m�\�/�\�\��E\�<@ͯ\�\0�\�/�\0��*Q\�<@6sHj�\�/�w�E\�<@�	��\�/��\�Y\�h\�<@t\�\�\�\�/��@gҦ\�<@~\Z�\�7\�/�\�C\�r�\�<@����\�/��Z�\�\�<@�شR\�/��6U�\�\�<@$\�6�D\�/�pΈ\�\�\�<@���\�/�(Hlw\�<@\�`6�\�/�%?\�W�\�<@\�n\�KS\�/�:=\�Ƃ\�<@���\�}\�/�)���\�<@�\�ӀA\�/�|�E{�\�<@S\\U�]\�/��i\�<@D�M\�/�{g�UI\�<@�\�X\�\�\�/�\��̰\�<@�\�H.�\�/��\"1A\r\�<@s�\�h�\�/�jh�\�<@#[A\�\�/�\�\�f*\�\�<@�\�4\�\�/����\�\�<@\��|zl\�/�\r\�\�\�<@\� ���\�/�?9\n\�<@�\�\�i\�/�p�\�\�\�<@9\�\�m4\�/�\�س\�2\�<@\�MF�a\�/��M�#\�<@RG\�\�\�\�/�\\䞮\�\�<@��4F\��/�Mg\'�\�<@\�\�)�\��/�O?��\�<@��H�,�/���oD�\�<@\����/�(�\��\�<@�\�g��/�\�\r�Q\�<@���[�/�v�S\�<@4��E`�/��\�\�<@\�\�#��/����\�<@�ѯ��/�N\�\���\�<@&s,\��/���+f\�<@��k	�\00�Q�v0b\�<@\�\�\�,0��U-\�(\�<@\��\�\�0�F^\�\�\�<@q㊋0�|DL�$\�<@\�R�0���u\�\�\�<@ѕT�0�\�^\�\�<@	��\rL0�LnYk\�<@Ɖ�v0��yVҊ\�<@��Z�\�0�Mf���\�<@\Z\�1˞0�\�\�>�Q\�<@4�c�=	0�MM�7�\�<@�Ƿw\r\n0�fj�!\�<@�l\\0��\�<@ȳ˷>0��v���\�<@E�\n)?\r0�\�b�\�\�<@S=��\r0��C�\�\�\�<@\�8�0�BȗP\�<@�sѐ�0��쟧\�<@�EИ0�\�\��9#\�<@\�\���o0�Vb���\�<@E(b0�N\�g\\\�<@�X�O0��}\�\�\�<@o�[t�0�,�)\�<@��ݰm0�1\\\0q\�<@��n�0�vmo�$\�<@b1\�Z{0�_~�Ɍ\�<@\����\�0�˃�9\�<@ut\\�\�\Z0�\�Y\�h9\�<@0�\�s0�Z~\�*O\�<@s�m�B0�!sePm\�<@\Z���0��\�Bt\�<@����@0�\�S:X\�<@aO;�5!0�=��M\�<@��\�&$0�k�\�t\�<@�9�\�$0�^/M\�\�<@;\��\�R%0�\�@-\�<@{i�\0�\'0�Á�,`\�<@r��>s*0��\�M�q\�<@�=�\�50����\�{\�<@&S�60���\�8\�<@\��}V90�O>=�e\�<@\Z�\��\�:0�pC�׼\�<@k\�C4�?0�М�)\�\�<@\�%\�B0�_9\��\�<@\�\�i��C0��Dh\�<@,�9$�D0�\�\�dp�\�<@g{��H0��R	O\�<@Φ#��I0�N^�\�<@W]�jJJ0�\��j\�<@�\�\�\�J0���|	\�<@\"ĕ�K0��\�8\�<@ƅ!YL0����\�<@\ZQ\�|M0�\n\�F\�<@#\�#\�Q0�S�\�\�t\�<@}˜.�Q0�\0��P\�\�<@؃I��Q0��\��\�<@\�\�mR0��1\0\�\�<@��.R(S0�P)��\�<@�\�\�PT0�Zc\�	�\�<@�}\"W0�Ϡ��\�<@\�\�|#�W0��m5\�\�<@\�ID�Y0���O\�\�\�<@���Z0�\r�\�\n\�<@��\�Y�Z0��z�Fw\�<@\�\�W�[0��\�\��\�\�<@��\ZO\\0���Wt\�\�<@��@g\�^0�.s�\�<@\�\�\n~_0�\�j{�\�<@W\\��`0�W��\�\�<@\�\�F��b0�#�J %\�<@\�\"0\�7h0� ^\�/\�\�<@d���_i0�1\�f\�<@\�\���Wj0�\�g\�u�\�<@��\�Jk0�C�Գ \�<@�\�\��k0�O��e�\�<@\�!p$l0�\�\"R\�\�<@}\�X��l0���i��\�<@�<Lo0�u��OU\�<@+5{�p0�\�\�ne\�<@p\��q0�� \�\�\�<@5��6\�r0�\�\�O=\�<@�f�\�s0�����Q\�<@M�Stt0�I-�L\�<@g,�\�Nv0�OWw,�\�<@v?T\Zy0�\�V^�?\�<@ ����y0�C �8�\�<@�\Z3�z0��\�FXT\�<@\"S>U{0�.:Yj�\�<@�\��[|0�\�\Z.rO\�<@�vMHk|0�\�l��\�<@\\:\�<0���\"\�\�<@Ɗ\ZLÀ0�\�N\�`�\�<@\"\�{��0�v�e�\�\�<@�\�+�z�0�o+�6\�<@�\�\�\��0�@�Z�k\�<@\�ۻ}�0�0��\��<@9\�)9\'�0�U�\�\�B�<@BA)Z��0��g)Y�<@Q0c\n�0�4�Y���<@\�\Z���0��\nb�k�<@�\�܏0��<dʇ�<@�����0��K\�1�i<@\�f\�\�j�0�',1607362055,1607362055,NULL,NULL),(10,'Western',_binary '\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0U\0\0\�H��_�8@;�*�\0,�77�\',�8@V��\��+�=�;k��8@��I���+��(�Ƨ8@?��\�+�H\�z��8@rѬ\�+���O��8@\�%�+�\�a/��8@��a���+�LnYk�8@�f�\\�+��5Y��8@�\�\�\�\�\0,���W�ѹ8@F}�;l,��nض�8@\n�s\r3,�\�(߾8@��\�\��,��f,�ξ8@#/kb�,����E�8@��q�\�,�:��KT�8@�\n\�$,���\�ǵ�8@&�fe�(,��a�1\�8@�\�o\n+-,�v�|\�H�8@��`\�2,�w\��\�8@��<�|3,�\�^zo�8@}>ʈ8,�}\�\�z�\�8@^�\�I�<,�\�%\�8@[]N	�A,�{1�\�\�8@\�n-�A,�6\�\n\�r\�8@bN\�&�G,��\���\�\�8@�u\�K,�\�y�\�8@�\�Q��N,�\�ͩd\0\�8@O�?�L,�EKO\�\�8@��N]�L,�*�~��\�8@鹅�DP,�qTn��\�8@��\���R,�!�lV\�8@ZF\�=�S,�T��7�\�8@oB@�T,�\�6�\�8@f1���V,��p\�GR\�8@-\�(�Y,�\�\�I\�8@�t\�y\�^,�\�N$�\�8@\r��\"\�^,���8�8@̶\�ֈ`,�⏢\�\��8@P�,�c,�\�\�S\��8@\Z\���d,�\�\�}U.�8@\�D�\ni,�ܝ�\��8@D�в\�g,��.\��9@Q/�4\'g,�J@L9@\"� ˂i,�\�l9@1^�\�j,�	Q���9@S���\�o,�\�.\�\�\n9@&7��m,�\�z�G\r9@���U�p,�\�l��9@�|�\��m,�+hZbe9@=�;k�m,���|	9@\�\Z��\�m,�zq\�\Z9@M��~\�t,�\�y�9@�3Lm�{,�.9\�\Z9@/�\�\�{,���W��9@�V$&��,���t�i9@^i���,�3O�)�!9@Su�l��,��C3O�!9@\����,���`�. 9@�J\�h�,��a��\�9@�\�j�=�,�^�zk`9@\�\��m�,��_�n9@?74e��,��h;�\�\Z9@��UJϬ,�6\�\n\�r9@����`�,�o����9@\�\��;�,�֩�=#9@\�\�\'�,�N\�&�O9@\�_Z\�\'�,��\�Pj/9@�l\���\�,�I+���9@\��\"�-\�,�\�C�|9@�&�\�\�,�5\�($�\r9@�\�bb�\�,��7M�9@�0\�\�,��M\�=�	9@�F>�x\�,�\�\�{,9@�N\�6�\�,�\�JZ�\r9@L\�\03\�\�,���9@/0+\�\�,�q��\�\�9@`�o`r�,�M�:�/�8@����]�,�\��k\��8@�/EH�,�N��oD�8@\�v/�-�`tys��8@�y�3M-��=B͐�8@{��\�\r-�\"O����8@p��1=-��f\�|�8@�x#�\�-�\r\�-��8@\�\Z�N-��\���K�8@\��lY�-�x\�1!�8@���5?&-�Y���t�8@y\�&1,-��q�߅�8@a����/-�ᶶ�\09@\�|��\�3-�YO��9@?�g͏7-�dv�S9@@�Z�k:-��yUg�9@�\�->-��m�B<9@ҌE\�\�A-�DOʤ�9@\0\�	�A-�\�;9@�\�9?\�A-��\�V%�9@�\�d\�\�B-�\�{\�ʄ#9@\�\�f*\�C-�\�/��\�%9@a\�N\"\�?-����\�+9@,\��<-�$}ZE09@F��\\\Z?-��5Φ#49@rk\�m�<-�/�\�69@3SZK8-�ڎ���;9@Sz��3-��Σ\��F9@p\��//-���\�RJ9@6<�R.-�Ǻ��N9@2!撪--��v���T9@\�r��+-�0��!X9@g\r\�W\�*-�gC��A\\9@���.\�*-��⪲\�f9@�\�#\rn+-�[{k9@o/i�\�)-�\�b�T4n9@�Gߤi(-�$_	�\�r9@r1\�q$-��ĬCu9@\rP\Zj\"-�\�\�\�C\�y9@\�\�\�%-��\��|9@��\�>\�\Z-�Q��l�9@&r��-�\�cx\�9@��T��-�m�\�J��9@�����-�T\�:Ɖ9@y��\�-��\�\'��9@F\�v-�P����9@.��T-�R�\��9@�߼8�-�\�\��9#�9@j�drj-�%��9@\"��u\�-�>x\�҆�9@1\�f!-�\����9@K���%-�*�\�ŏ9@\�_!se(-�4-�2\Z�9@E/�Xn)-�\�`ũ֊9@�p�a�.-��X32ȉ9@\�\Z��3-�0�&�9@\�\�[\�;-�U/�\�d�9@fJ\�o	@-�ip[[�9@h\\8�E-�Gq�::�9@�\�jeJ-���8G�9@�ng_yP-��\�\�D�9@p\��U-�J\�\�\�n}9@W#�\�2Z-�\nfL�\Z{9@�g%��^-�\�}��y9@$\�6�De-�ʌ��^{9@(-\\Vak-��4�BX}9@�i\���q-��i�WV~9@)yu�y-��dȱ�|9@\�\��/-�Q.�_x}9@M��\Z��-�8�\�L}9@/�ͮ�-��\��|9@>��-��g\�K6z9@]P\�2�-���-@w9@�1��\�-�\0�)U�t9@\�uS\�k�-���\'Hls9@s�=A�-�l\���r9@\�p�{��-�\�^zop9@���:\�-���\n\�\�m9@��K���-�T�4��m9@�@�m\�\�-�ͫ:�n9@K�|%�\�-�ND��n9@Z��U�\�-�f�c]\�r9@Y�\�\0\�-�\�\�]\�w9@\�\�\�\�\�-��?mT�w9@�(�A&�-�/2�Fv9@MK��F�-��\�HK\�u9@yu�\��-��o\�v9@\�$\"��\0.�D\�1uWv9@���n/.�-?p�\'t9@�u7O.�l��o9@,G\�@&.�c��\�\Zl9@D�в\�\'.�Q���Jk9@�/\�x�-.�ݔ�Z	m9@�Ø��2.�\�\�\�\��l9@f0F$\n=.��/�\�l9@��D.�\�y�i9@l|&�\�I.���^�2e9@��W��E.�\�\�\�\�\�`9@}x� #H.�h\���c^9@@x\�=L.�x%\�s}[9@�cyW=P.�z\��W9@nQf�LR.��d�Q9@h�_.�ޓ��ZS9@9�Z\�l.�\�Sr3T9@ԛQ�Ur.���>�T9@7�\���w.�\�h9\�CU9@�zO\�.��4�BT9@�#~\�\Z�.��R�ZQ9@�\"�ng�.�\�K6lQ9@���{�.��@\�)VU9@E�$]3�.��s�\�U9@x��\�Ĭ.��v5yV9@)[$\�F�.���\�U\�V9@�)���.���&3\�V9@?9\n�.��\�מYV9@����.�\��_T9@�8+�&�.��ʾ+�S9@�wG\�j�.�t)�*�N9@\�V*��.�\'��\�KN9@�v\�1\�.��\��\�\�N9@bX9�\�.�N_\�\�,O9@Ȳ`\�\�.�p^��jO9@R<��\�.�\�\�zi�P9@~�4bf\�.����f�P9@z\�΅\�.����\��M9@�\�v�\0\�.�H\�\�\�\\I9@_~�Ɍ\�.�\�\�׺\�H9@Z+\�\�\�.�ș&l?E9@ʥ��\�.�\�b�0\�C9@ˠ\�\�D\�.�\�M\�A9@�[ A�\�.�z�\�w)A9@\�U��\�.�1DN_\�?9@\�\��hq\�.���&3\�>9@�\��\�\�.�E�N�\�=9@�X���.�\Z4�Op=9@3d���.�s���=9@C�(^e�.�\�2ı.>9@�	ܺ��.�Y\�&�>9@\0X9\��.�eS��>9@Pqx��.��\� !\�?9@*Wx��\0/�ལƄ@9@�w\�1/�\�b�T4B9@\�yT�\�/�Tt$��D9@�d\��/�Ȳ`\�F9@\�@�]�/�\��-�G9@d����/���V\'G9@+N�f	/���\�I�F9@�\�7\�/�Z_&F9@\�A�p\�\r/��Ӻ\rjC9@�[z/�P�\�\�@9@J�i�/�\�p\�Ws@9@�r�\�{/��\�;jL@9@~\��\�\�\Z/�\�x\�&1@9@܀\�#/�\�u\�\�?9@\� ���/���\�qn?9@$��\�/�x�\�>9@�S��Y /�\�\�\�H�=9@��z2� /�\Z��b�<9@\�ej�!/��*n\�69@\�\�.�u//�z�3M\�69@\�W�f,2/�q�J[\\79@|E�^\�3/�֌r99@oH�7/��\��\Z99@\�vhX�:/�d��\�^<9@-�\�o�;/�����H9@s�\�{�M/��3��EH9@�?Pn\�O/�X�vMH9@v��\�/R/���_#IH9@�bG\�PW/�\\����G9@Ӈ.�oY/�a5��F9@�\�H.�Y/��1\�	\�D9@28J^�[/�ŏ1wA9@8��\n*Z/�k�*>9@�]�9\�c/������=9@Pr�Mdf/�g\��\�=9@\\�~l�g/�Œr�9>9@�@�\�\�h/�&ǝ\��>9@�E;�i/�\�\�x\"�?9@��Z�j/��*��A9@\\W\�o/�?�\�VB9@h���p/�lxz�,C9@��M�r/�\�B;�YH9@\�\'\�>/�{\�L�xH9@:�Y��/��\��H9@y\\T���/��5\�;NI9@5	ސF�/�\�\��6�I9@\���\�/�+O \�K9@^�SH�/�2v\�KpN9@k*�/�?74e�O9@\�3�\�X�/��ng_yP9@\�\�\���/����\�\rR9@\�,\��/����R9@A��h:�/��>T9@\�,^,�/����;V9@\�KS8}/�@��r�V9@�J�({{/�\�a\�7�W9@t|�8cx/��GS=�[9@\�+���n/�\��-\\9@&���n/��\�ފ\�\\9@V\��D\�m/��^�_9@�&�\�t/��S��Y`9@iSu�lv/�\�T�G\�a9@\�\�8\ry/��oD��c9@_F�\�\�z/�D�+g\�d9@2w-!|/��Q�de9@�%P6}/����!9e9@U�	g�~/�3�\�3d9@4�/�� ��qd9@�)��/����$e9@�\�k\��/�ݗ3\�e9@e6\�$#�/�\�\�\��e9@;\�Ԗ:�/����\�Bd9@�(���/�U�q7`9@Y�yVҢ/���n�`9@E)!XU�/�q\�Ws�`9@	Q����/���r�mb9@L\�\�ݴ/��(_\�Bb9@�\r\���/��g�a9@x�з/��!�\n`9@\�k\�,	�/�bI��_9@\�\�1\�\�/��V	�W9@e6\�$\�/�dZ�\��V9@�I\rm\0\�/��d:tzV9@_(`;\�/�Hj�drV9@3Q�\�\�\�/���W9@\�>�̔\�/��.ȖY9@E\�[\��\�/������Y9@\�\�o{�\�/�<�BusY9@�\�\�l\�\�/��=#\ZY9@-&6\�\�/�X���\�W9@|,G\��/���߆W9@Ral!\��/���V9@p[[x^�/�\�	��.U9@K;5��/�\�\�vhXT9@\�\�>�Q�/��|$%=T9@\"�4��/�\�\�nIT9@�\����/�3d��S9@�ȭI��/�4����S9@^���\00��gx�S9@�\n\�b�\00�˼UסR9@\�=�>t0��Жs)R9@}\"O�0�Ab�{�R9@36t�?0�%\�pt�R9@a�HZ0�*s�\�R9@\�b\�J!0�qvk�S9@ѓ2�	0�H\�c\�CS9@v5y\�\n0�*7QKsS9@Yj�\�h0�\�\�yT�S9@U�\�\�B0�\�Q*\�	U9@�\�\�\�0��E\�n�U9@\ne\�\�k\r0�\�^\��W9@\�1uWv\r0�4�9A�X9@�\�&��\r0���\�\"Z9@OI�0��\Z�D�Z9@]��0���_#I\\9@�@0�\�_Z\�\']9@\��E�0�����]9@��)0�>\�D�]9@gDio�0�\�\���]9@֨�ht0�!W\�Y^9@�\�\�V0�T9\�)9_9@��\Z/\�0�m:�Y`9@+�0�f��\�a9@��0B0�\�!Hc9@\�c\�\�0���0Ee9@�n��0�>�Ӟ�g9@��$\�p0�ڮ\�\�h9@�)x\n0�r\�\�Q�i9@\� �rh0��}ij9@�V$&�0��\�5&l9@\�3�\�X0�$Din9@�X\"�0���Ƅ�o9@V}��b0�/��$o9@^*6\�u0�7P\��|n9@o�[t�0�\�^}<�m9@�0���i�{m9@\�ܴ�0��C�\�\�l9@\��3�I\Z0�T\Z1�\�k9@�ѩ+0�3�}ƅk9@nj���0�d\��\�j9@�1�#0��\�VCj9@�����0�\�u6\�i9@f�\�\n0���~Pi9@�I��40�ٵ�ݒh9@Mh�XR0����Org9@R\r�=�0����\'f9@QL\�\00�\��we9@:��KT0��xy:Wd9@�[Z\r�0��)\�dqc9@��\��0����\�b9@\�ڦx\\ 0�\�\�\�na9@m�_u\� 0�Ii6�\�`9@ |(!0�Kr��&_9@�\�-\"0�ͰQ\�o^9@:ZՒ\"0�\�<�E~]9@�h\�V#0�\���{�\\9@���&$0�\�U�3\\9@��d9%0��Fw;[9@R_�vj&0�1\�Z{�Z9@�(�1\'0���!�\ZY9@ADj\�\�(0��t�(%X9@\����>)0�%�\�eW9@���j�)0��a\�\r�U9@	5C�(*0�� %\�T9@I�2�\�*0����CS9@\�o&�-0���>U�R9@�\�\���.0��\�=\�P9@xρ\�10�q\0��O9@M�T�20�(\�hr1N9@cAJ40��/Ie�M9@�A{50��\�l�\�L9@\�9�!70��հ\�K9@��B\�\�80�6 B\\9K9@5\�b�\�:0���\�{*K9@צ��<0�G:#/K9@\�/�1\"=0�\�\�1\�3K9@\�\�B�i>0�l�`q8K9@��\�\�a?0��KTo\rL9@#�tu\�B0��e�I)L9@�\��<�C0�6u�K9@l?\�\�D0��u\�~K9@��Դ�E0�$%=�J9@��\�\�F0�\n�i�\�H9@\�\�q5�G0�0Ie�9H9@�x#�\�G0��^�SG9@�\n\�\�\�G0�	��g�F9@8i\Z\�G0�k�)\0F9@!��H0�6�.6�D9@仔�dH0�Ș���C9@٘\��H0�Q��9A9@��0(\�H0�E�@J@9@K\0�)I0��/g�?9@���v\�I0��t{I?9@� \\�J0�ڨN�>9@\0�={.K0�ԛQ�=9@rm�\�K0�\�\�E_=9@|}�K�L0����?<9@ c\�ZBN0�ްmQf;9@ׄ�ƠO0��Į\�\�:9@\0�d\�FP0�G��:9@O�s�P0�\�zj�\�99@e5]OtQ0��\�k\�99@\�%ǝ\�Q0�Q�B\�y79@ܹ0ҋR0�$Di69@��gS0�E����39@\�9\�}\�S0��G7¢29@\�8~T0�L\�1�=29@�1\�T0��*�\�19@�1\"QhU0��Ƥ�/9@n��ŨW0�\"H�*9@A���Z0����Y.\'9@}���[0���֥&9@\�<0\\0�\��;\�$9@�d�\�]]0�74e�$9@�b�:\0^0����·#9@�j�j�^0�-B�4!9@w\�Df.`0�_���F 9@`V(\��`0���֥F9@��\�\�c0�S\�k%t9@}w+Kd0�2��\�\Z9@�}V�)e0�\�)s�9@\�.Q�5h0�\�8\rQ�9@���V_i0��\�im9@GW\�\�j0�K<�l\�9@��|	l0�Yk(�9@Q\�\�\�m0�6\�D.9@�V\'g(n0��{�P9@LKo0�\�4\r�9@��x\�o0�\�Udt@9@?�mp0�\�\��r-9@\Zi��q0�\�\�\�\n9@\�fF?\Zr0�\� v�\�9@�>�r0��=\��\�9@]\�].\�s0��h:;9@%\�?�t0�-z�m9@M�J\�t0�\�\"��9@���V_u0�\�\"0\�79@\�\�Q��v0��\�N9@.Ȗ\�\�v0����p\n9@{��\�ww0�@\�,\�	9@﮳!�x0�� L�	9@\��\�e�z0��b*�9@ڮ\�\�|0��s�p�9@G��t}0��}:39@d�\r1~0��Fˁ9@�tۀ0�2\0Ǟ9@40�&�0�U\�\�\Z�9@\�A�\�ނ0�g��e9@\�\�~���0��Nyt#9@��Z��0��^\rP\Z9@��;�B�0��5Y�9@1x��͉0�\�\�4}9@��ؙB�0�Ec\�\�l9@Z�1\�	�0��\�#09@���\�_�0�a\�\�+e9@���[�0���o�9@f����0�?Ȳ`\�9@��-�0��\�:TS\n9@Y�.\��0�\rU1�~\n9@`?\��0��}\�\�9@F\\\0\Z��0���,\'�9@ж�uƓ0�ƨk\�}9@3�68�0�l\�\��9@&�R?o�0�f2\�g9@Y���.�0�2k�M9@D�Ö�0�<��f9@}�͍\�0�/i�\�Q9@�g\�,�0�\�\Z\�*�9@�R\�h�0���ɩ�9@Է\�鲠0����	.9@�/�^|�0�� 9@�!U��0��T\�:9@\��l�0��Op��\"9@\�:�v٫0�&\�\�%9@\�L0�k�0�a����\'9@�a��߬0�2\�\��,9@��pY�0�öE�\r.9@\�\����0�\�xͫ:/9@\�\�����0�*�\�D09@�\�\����0��\'�.�09@,)w�\�0�\re�f29@\�|��\�0�=C8f\�39@\��Kį0���Z�69@\�2\�,%�0���rf79@h\�4��0�\�D�k\�79@\�б�J�0��b\�\�99@ND���0�;�� \�:9@#LQ.��0���\�3.<9@)\�\�q�0�fKVE�=9@�\�{L�0����\0?9@\�r�c��0���&3\�>9@�\�7��0�7\�^��>9@f1����0�\�\�!S>9@O�\�\��0��\�[u>9@QhY���0�\�J�R\�=9@\�\�\��0�\0Sh=9@�dU���0�]�\�=9@i�\�+I�0���\\��;9@b�\Z���0���g;9@$0�\�\�0����\�:9@\�捓\�\�0�x\�캷:9@t�\�0��5\�D:9@�,�\�o\�0�\ZyYC9@\�>\�-W\�0���H\�B9@\�G�\�0�?6ɏ�A9@�\�2n\�0�\�\�	L�A9@\�HLP\�0���M+A9@\'jin��0�1DN_\�?9@�p̲\'�0�N�0��19@�I\��0�C\Z8\�*9@L<��0�+���\�*9@�-$`�0��DKO+9@��dV\��0��w}\�+9@\����T�0�Z.��+9@àL�\��0�m\�i�*,9@@�P�0�\0t�//,9@h�o}X�0�\�%\�/,9@�@��_�0�\�YL,9@àL�\��0�4�\�H,9@�\�>rk�0�\��%,9@�)�D/�0�P9&��+9@M��f��0�:�w\�*9@&�\"\�d\01�%\\\�#�)9@/\�$�1��&c`)9@\��.�1�z\�0\�)9@�F�q�1�s-Z��)9@�2�681�\�\�\��r)9@�ҥI1��0�(9@\�xͫ:1���v\��\'9@\��q6	1�\�\�z�V(9@\�\�C\n1�\"R\�.�)9@\�7>[1�Ui�k|*9@/�\�Q�1�C7�\�*9@�8\�Z�\r1�\���s+9@a�ri�1�z4Փ�+9@��\�N�1���.�,9@\�&���1�D�7�,9@��Rb1�\Z�\��+9@�#��1�\�m½2+9@�K\�^1��Y,E*9@1A\r\�\�1����z*9@PVW1�w�**9@��u\�1�\�(yu�)9@��\�ާ\Z1��iP4(9@ĕ�wF1�H7¢\"&9@FИI\�1��6\0%9@;V)=\�1�\�\�\�U#9@g��\�p1��r�9>\"9@�\�V%�1�/�\�!9@�M�t1�aQ�� 9@��H�1���T\�9@�ɐ1�Кi9@���?Q!1�\�PS\�9@\�\�jH\�#1�J~įX9@ѭ\���$1��#��\Z9@_\�(\�%1��~\�\0\Z9@�GW\�&1�nߣ�z9@H�]\�\'1��im\Z\�9@�q\�Z|*1�9\rQ�?9@��\�\�+1�<\�b�\�9@w��\Z/-1�U�=ϟ9@t\�\�q5.1�*9\'�\�9@\��}8H01�-{؜9@�Z	\�%11���,\n�9@\��\�21�F�xx\Z9@:�\�H31�I��&\�\Z9@\��c!:41��Nyt#9@��S�61�x��\�\�9@�mR\�X71�\�r.\�9@\ng��\�81�\n��\Z9@���\��91�&����9@ʌ��^;1�<0��9@\�x\�@e<1�n\�\�)9@ٳ\�25=1�t\�\�9@\�\�\�Qc>1��Z�9@\\\�d8�?1��\�3�\�9@(�.�\�@1���-=�9@��B=A1��}s9@\��mRA1�E��S9@7�n�A1�q:\�V�9@㊋�rC1��<�;k9@\�C�|D1�t\�\�\�9@\�\�ùF1�\�M�q\Z9@Zf��H1�\��o�9@R�8�\�I1��/���9@3�f�K1��,_�\�9@��\�L1�Q��C�9@\��d\�L1�\�\�cw\r9@��qM1�L���\�9@���	.N1��\�ǘ�\n9@:=\�\�N1�|V�j	9@IC��O1��\��n,9@�\�鲘P1��g\�ej9@�]0�\�R1�l����9@M��~\�T1���)9@��u\�U1��,�9@x�7N\nW1�p?\��9@k�MGX1�g{�9@עh[Y1��:�p9@�\�Z1�5�;�9@�Y�\�\�\\1�e���\\9@�;Mf�]1��V\'g(9@�;ۤ^1�p\�\�s�9@\�C�|`1�=_�\\69@ծ	i�a1�n��\ZK9@jܛ\�0e1�ǃ-v�9@���\�\rf1��*�\�9@)@̘f1�(E+�9@�Gp#eg1��׻?\�9@rl=Ch1�\��E�9@�<\r$i1��=\�\n	9@IH�m�i1�ˁj\�9@\�\riT\�l1�(\����9@\rĲ�Cn1��\�\�\�9@��H�p1�\�\�R\��9@�s�p1�M�Nϻ9@\�˻\�q1�\"��gx9@&\�\�\'ds1���^~�9@Ý#�t1�b��\�\��8@ڨNv1�_\����8@r \nfx1��\�\�~��8@��#z1�^M����8@�/�^|}1�Oyt#,�8@\�\�@\�S1��i\����8@�%�\"܀1�Tt$���8@o\��1�L\�\�\��8@a��\�|�1�.\�s`�8@ ��\01���)\�d�8@\nףp=�1�	O\��\'�8@����1�\�\���\��8@��Ō1���\�s�8@�d\�F �1��uq\r�8@�\�\�aڏ1��\�\���8@.�5#�1�\Z3�z�\�8@��뉮�1��h�hs\�8@\�b\�J�1�D��\�8@�#�1���q\�@\�8@h\�\n��1��g)Y\�8@F\'K���1�J_9\�8@\�6��ֆ1�9�t\�y\�8@i\�\n��1�!��\�\�8@�R��c�1����RA\�8@�ԗ���1�O崧\�\�8@\�d�<\r�1����6\�8@.\�|���1���.�\�8@\���0�1���v\��\�8@�۠�[�1���!��8@��ʅʃ1�\�\��q��8@7P\��|�1��vN�@�8@�%��1�F�6��8@ %vmo1��\�\�a��8@�|%�1�)@̘�8@X9�\�~1�\�b�\�*�8@�\�c?1�G\�g\�u�8@;�� \�~1�G\�\�ҥ8@�~�:p~1�{؜��8@3����1���Or��8@\�\�\�	�1��_\�|x�8@�>eą1�lA\�!�8@w稣�1�\\�v5�8@?8�:V�1��Bە8@Q�?Û�1�\�\�-\��8@\�o_Ή1�\�H�5�8@-�2\Z��1�q\�\�\"�8@�\�(��1�\nMKʉ8@�Sȕz�1�5��6Ɔ8@�N]�,�1�\�	\�݃8@�W�L�1�ɭI�%�8@4�\�1�\�E�S8@.\��:�1�N	�I�|8@~�\n\r\�~1�h�\�Wz8@\�S[\�|1�33333w8@�\��\�\'{1�f`Xr8@��\�C\�z1�z��\�\�m8@�\���z1�	\�\��k8@���\�;z1�C:<��g8@?� ?y1�}$%=e8@#2�\�x1�@�3iSa8@�\�L�^x1�8�k��]8@%\"���y1�\�;\�\r[8@Y�.\�z1���\��W8@\�}�\n\r|1��/EHU8@_�;}1�1�d�\�Q8@��>�\�|1�k���#O8@\�\�\"M|1���\��\�J8@\�\�\�{1�\��\�G8@Ct	|1�\�\Z�NE8@\n��.\�|1����YB8@ zR&5|1�횐\�@8@�\',�z1�\��x�Z=8@N{JΉy1�T�4��98@Fж�y1��! _68@֏M�#z1�0�\�\\\08@_\�(΅1��P�v0n7@H�`��1�(�H0\�l7@\�\�`ob�1�g\�|�|l7@�ÖM�1�-C\�\�j7@߉Y/��1�_ѭ\�h7@wN�@��1�6<�R�e7@s\��A�1�7��\�Nd7@\��M�1��k\ndvb7@\�\�\�O��1��nض(_7@uYLl>�1�\�-\�s\\7@p�\'v�1�;�O\0Y7@��\�&�1�M1AGW7@� L��1��\�\�\�@7@uX\�1�j�\�h\�=7@� ˂��1�sK�!q;7@�	Q�1�m�\�<+97@\��LM��1��\��5\"87@�����1��{�\�\�57@K��q��1�m\�i�*47@�]\�p�1�*1	27@b.�~1�bJ$\�\�07@b���\�{1��I)\��.7@\���z1��شR,7@\�C�|x1��68�&7@Zc\�	�w1�鹅�D$7@HP�w1�@\�ի$7@�,��s1�AI�0!7@\�_YiRr1�\�2��7@��\�n1��pz7@\�t���j1�$�]J]7@Кii1����Kq7@��jQ`1�G��R^7@\�\'c|�U1�\�\�@\�S7@y�Z��W1��+d�\n7@SweT1�z�3M\�7@\�캷\"Q1���\�\�7@|V�N1�\�\�L0�7@\��yrM1�T\0�g\�\07@�cyW=L1�\���7@Υ��\�G1��\�o\�\��6@\\ A�cH1��vۅ\��6@O\�\�\�NE1�J\�o	��6@\�4\r�B1��J�({�6@8gDi?1�Yک�\�\�6@u\�b�T81�\��\�\�\�6@�4F\�21�-y<-?\�6@��\�`�01��o^��\�6@���v�*1�܃�/\�6@\�n-�\�(1�5^�I\�6@	��z�%1�\\Ɏ�@\�6@\�\�m3!1�}w+Kt\�6@\�\�\�1���f�\�6@o��\�1�w�(��6@�Z\�Q1�N\�}��6@裌�\01�{Cr2�6@�(z\�c1��\r�W�6@�0Xr	1���я��6@81$\'1�v\�1<��6@�հ\��0�wR~R�6@\�W�f,�0�\�r��6@\�>\�G��0�(-\\Va�6@3�\�p\��0�ۦx\\T�6@(��\�\�0��;Fz�6@\�\�nf�\�0��7�0�6@��0E\�0�� �6@�t{I\�0��8�t̑6@ڑ\�;�\�0�K=By�6@���8�\�0�>yX�5�6@\��i\�0��\�*�6@��!r�\�0��a�Q+�6@mw�N\�0�\�:TS��6@��\�b\�0�4\�?O�6@��{�Y\�0��\�\�jH�6@\�Z�\0m\�0�)yu�}6@��켍\�0�$\n-\��}6@N�\�\�P\�0��q��>w6@WBwI�\�0��4�BXi6@\�\����0��)��%\\6@�{\�5Z�0�b\��vKV6@\�8+��0�\���jW6@�\�[u�0�o\rl�`U6@��\���0�W�\���P6@�	0,�0�\�]���N6@\�\�}r�0�\�<+i\�G6@Q/�4\'�0��\nb�kC6@z�]�z�0�����y>6@G�J���0�6?�Ң>6@/�h��0�\�%�<<6@-&6ג0�_^�}t26@\�\��0�\�\�bg26@~\�\Z.r�0���%�.6@F��_�0�sL�)6@*���[�0��#~\�\Z&6@Uܸ\���0�p�x�0$6@�L\��0�!���6@E�\0}0�5\r�\�6@L\�Ƽ�|0�\�+\�\�f6@{3j�Jz0��\�g\��6@r4GV~u0�\ng��\�6@vq\r\�q0�qǛ�6@,��26p0�_\�Q\Z6@�\�\'Gn0�\�V\�/�6@GZ*oGh0�\�ފ\�6@�n�\�_0��\r1^6@\'����Z0��`p\�6@%̴�W0��K���6@\�S[\�T0�Di\�6@v�և�R0��\�\�96@�:�*Q0�Y�n\�6@�-\�RN0�+L\�k6@�e�\�aM0�����\�	6@v��ݰI0��\�6@o�UfJG0�|�\�S\n6@���\��E0�\���6@�A\��vB0�k�36@����QB0��Q�y96@CV�z>0�\�s\'\�6@�wԘ;0��\�ۂ��5@��߆;0�i�\'��5@�X\"�70��\��5@�E�\r250�ß\�\�\Z�5@�\�%\�250�\rnk\��5@?�Q�y10�o�\�m�5@�p�Qe\00�&\�\�\'d�5@�I��G\0.�\�	/���5@�jI�+�q\�-\��5@��\�3.l+�gs��5@��cm+�QN����5@��P�vp+��Q\r�=6@�\�\�s+�At\�6@J�\�\�x+�x�\�6@Y�\���|+�\�\�\�+\n6@u \�\�+����6@�x��M�+�\�ƻ#6@{���+�\'L\�\�6@\�d�+��:M�6@\r5\nIf�+��i�{�6@l���P�+�+\�]gC\"6@̷>�7�+�\�/�1\"%6@\r�a���+��a��\�(6@�	g���+�\���s+6@5\'/2�+�ɫs\�.6@}#�g]�+�@�dȱ16@_\�\�W�+���};�46@�KR�b�+�^0�\�66@���߁+�U���*;6@\���\�}+���\�\�\�=6@ސFN~+����WC6@Wzm6V�+�f��\�E6@\�C6��+�7l[�\�H6@?�=x\�+�n��\�K6@=�Е�+�|c\0�M6@\"9��U�+�m���5O6@;TS�u�+�\�\�\�\�R6@�d�\�7�+�\�\�]\�W6@&6׆�+�Z�wgY6@��\Z/ݜ+��|A[6@�Ơ+�\'\���\\6@��+�tD�K�_6@*S\�AЩ+�\��9̗c6@���\��+�ke\�/�g6@�j\�+�u\�\�pj6@��\�Y��+���\�f�k6@\�s���+�!\�\'\�>m6@\�HLP�+��o�>;p6@�t\�yƾ+�˝�`8s6@C �8��+�\�y�\�w6@tB\�K�+�\�\�^(`{6@!\���\�+�A,�9$}6@�\� �r\�+�A\�!\0�6@�ԗ��\�+�$D���6@\�\�6�\�+��ܶ\�Q�6@�G\�z\�+�\�7�{օ6@?�g͏\�+���v1͈6@j� \�\�\�+�\�t\��6@YiR\n�\�+��nض(�6@!�1\�\�+�KW��x�6@G�ŧ\0\�+��e�\��6@9{\�\�\�+�\�DR��6@P\Zj�\�+�$|\�oК6@	\�Vд\�+���@���6@2\�CP5\�+�\�\�g#�6@��T�-\�+�\����6@�%\0��\�+�Ze����6@c\�ZB>�+��\�`�\n�6@�;O<g�+�I�\\߇�6@&U\�M��+�,��ŧ6@\�h\���+��-X��6@�L�\�\��+�^�9\�S�6@(�\���+�#�k$�6@N`:�\�\0,�\�m\�8)�6@~�$A\0,�qx�\��6@\�\�-\�+�\��R\�\�6@f2\�g\�+��a�Q+\�6@�P�%�\�+��i\�6@p�71$\�+����\�6@{��\�w�+�x�\�\�6@��u�X\�+��a���\�6@4d<J%\�+�?6ɏ�\�6@c`\�\�+�Z�wg\�6@1���\�+���-Y\�6@O\�6��\�+�_~�Ɍ\�6@M�Nϻ\�+�n\�\�)�6@\'3\�Vz\�+�z\�(�6@ɭI�%\�+�$��ŋ�6@�5Φ#\�+�\�|x� �6@)_\�B\�+��)ʥ��6@\�\�\"��+���X6s�6@�++MJ�+����\��6@��+�x\�1!7@���\r,��\�_�57@#��ݯ,�E�A�7@%\�s}�+�\�kA\�\r7@x\�W�f�+��6\�\�n7@�\�\"R�+�����S7@\�_w��+�X:�%7@,\�p�{�+�\�\�E_7@�e���+��7h�>\Z7@4�9A�,�j�WV�7@\n���1\n,�t^c��7@LnYk,�L�;��!7@H5\��\�,� a�\�&7@�|ԛ,����)7@d]\�F,�Jy��\�.7@�\��,��\�Y\�h17@�>U�\n,�\�˶\�\�47@MLb�,��`R||67@Fx{,�(\r5\n97@�\��\�Y�+���>U�:7@�oD��,��S��Y<7@ }��A	,�\�+ٱ=7@�;l\"3,���,�>7@!����,���$>w>7@x~Q��\Z,��o�N\\>7@\�J=B!,��M\�=�=7@0�^|\�&,�y@ٔ+<7@��#�,,�\�0\�q67@\��@�m?,�՗���37@o\�\n\��B,�9\n327@K�|%H,��\�$��07@6\�D.P,�2r��/7@��|	U,��n��/7@$�\�\\�[,�\�\�=$|37@�W\�2\�Y,��B\�y�37@�\�>V�S,�M\�*��67@#�ng_Q,�o�[t�87@\�y�T,��Nyt#87@�\"���[,�\�\�b�87@��9\�`,�$a\�N\":7@�u\��e,�\�ݑ�\�<7@\�j+��e,��켍\�>7@4J��%a,�(�\�v@7@\���o\�\\,�@3�\�D7@\��\��],��jf-H7@�U�\�6_,��>��K7@���pZ,�v�L7@j\�L�R,�i�QH2O7@�\�\�uS,���T�R7@_	�ĮU,�>\�ɋT7@\Z�uT5Q,�\�r�V7@��ajKU,�b�\�UY7@��\�+T,�cc^G^7@G\�\��U,�\�2R\�`7@\�\�e6S,��*n\�bb7@Hū�M,���2�6d7@L7�A`E,��?���f7@�f\�=,�nh\�N?h7@��%\�8,�}�;l\"k7@\�\�Li5,���V\'o7@��\�\�3,����t7@/6�1,�5*p�\rx7@d<J%<1,�e���{7@@�t\�_2,�\�\�I�?~7@��|�3,��qS�7@U���1,��ΤMՅ7@P@�\�/,�jM�S�7@\���\�-,�S�!�u�7@��7(,�&7��5�7@�\'֩�%,�Q��C��7@�Ø��\",�_]�Ő7@J+�,���\�ׁ�7@H�V\Z,��DK�7@9�t\�y,�\�x�7@\�\�x\"�,�\�0��B�7@V-��,�\�m\�8�7@2\�m�\�,��(�Ɵ7@��\�\�,��F\�?�7@f/\�,�6u��7@���QI\r,�?\�G�3�7@\����^	,�v\Zi���7@4\�\�yT,�;�O\0�7@,Ԛ\�,�rR��8�7@\�R#�3\r,��D(b�7@	À%W,��E`�o�7@=Y��,����7@��Z`�	,�xF[�D�7@,\r���,�`��i�7@f���\��+�]o��\�7@�\��+�l��+\�7@	O\��\'�+��jQL\�7@w�*�+�\'�Ҩ\�7@\��T\Z�+�EJ�y\�7@�噗�+�|ds\�<\�7@\�\�N\�\�\�+���Hh\�\�7@\�6�\�+��zܷZ\�7@s֧��+�`?\�\�7@\�i����+�5&\�\\R\�7@!sePm\0,�q��0\�7@b��\�\�,�1\n�Ƿ\�7@�\�*�,��xZ~\�\�7@r��>s�+��1��\�7@뫫��+�?�=x\�\�7@o\�KS�+�I��� \�7@\"rl=�+��^)\�\�7@�\�\���+�\�\�\�e\�7@&\�\\R��+��[z4�7@\n��.\��+�;�I�7@��rf�+�L\�\03\��7@`X�|[\0,�OWw,��7@��n\�,�\��l �7@�\�f�,�%�\�1\08@�\�\�,�4.\�8@��QI�\0,�|\�o\�^8@\�\�C\���+�\�o�[8@2:=\��+�t�\�Y	8@��+��=Ab8@\�\��\��+��wJ8@�w*\��\�+�]\�Fx8@�h����+�`\�� 8@u\����+���S\�\08@�\�\Z\�*�+��4\r�\�8@>Y1\\�+�1a4+\�8@xρ\�\�+�*�n�E8@t}\�+�D�+g8@�_�L\�+��[\��\Z8@\�\�\��\�+�\�\�_\�8@\�\�\��\�+��,D��!8@\"\�\�T2�+�\�5Z�$8@�0�\�+�\�^���&8@\n\�\��I\�+���	�\�\'8@���^\�+�n��*8@V�Z\�+����3�,8@�\�Z\�+�h\�u��08@\Z8\�\�+��-</38@\����\�+�\�\�\�;�58@����\�\�+�!\�K�88@Ή=��\�+�\Z��\�;8@\�GR\�\�\�+�kE�\�\�>8@�ĬC\�+�d���_=8@\n�]�\�+����1ZC8@p�\�\�\�+�\�V�\�D8@��\�SV\�+��{\�5ZF8@;q9^�\�+�\���J8@\'g(\�x\�+����)N8@�cϞ\�+�\�\Z�NQ8@\�ͩd\0\�+��(���O8@j� \�\�\�+�\�m�\\pN8@\�d�\�+�\�f\�\�jO8@-`�\�\�+�<K�PQ8@Z��\�+�Ւ�r0S8@~b�\�\�+�J\�>\�U8@m�Yg|\�+�`��V8@:τ&\�+�zȔAU8@kb��\�\�+�|�8c�W8@y\r�\�+�8h�>Z8@��L/1\�+�L\�\�\�\\8@�Qԙ{\�+���\�Q`8@�k$	\�+�q:\�Vc8@ta��\�+�}\\*\�e8@=c_��\�+��jIG9h8@�6\�x\�+�\�\�<�k8@%�c\\q\�+�wLݕ]l8@7\�4D\�+�\�J\�.�o8@�9A�\�+�:\�q8@\"\�Q*\�\�+�GUD\�s8@jK\��\�+�(֩�=w8@\�@1�\�+����S�y8@!:�\�+�<�\\�{8@\�i2\�m\�+��`�d{8@\"ĕ�w\�+�\�\�^z8@\�;\�\r\�+��\�솁8@ǜg\�K\�+���c�҃8@;oc�#\�+�d\��ǆ8@\�\�`\�+�36t�?�8@\�\\\�+��\�u�+�8@~7ݲC\�+�Փ�Gߌ8@�l\\�\�+��h\�^�8@ȗP��+�\�`\�;�8@Ѭl�+�G\�?�8@��g\��+�ձJ陖8@\�9\�}\��+��\�\"�t�8@\��\'��+��\�\'��8@GZ*oG�+�l��\�ڗ8@:\�S�\�\�+�u\0\�]��8@�e�I\�+���\�FX�8@\�\�I�?\�+�e�z�F�8@\�`\"\�+����%:�8@\�\�\�\��+��uŌ�8@EKO\��+���S\�\0�8@�C9\��+�\�H��_�8@;�*�\0,�',1607362055,1607362055,NULL,NULL);
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `right_to_role`
--

DROP TABLE IF EXISTS `right_to_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `right_to_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` int NOT NULL,
  `right` text,
  `active` int DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_right_to_role_1_idx` (`role`),
  CONSTRAINT `fk_right_to_role_1` FOREIGN KEY (`role`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1614 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `right_to_role`
--

LOCK TABLES `right_to_role` WRITE;
/*!40000 ALTER TABLE `right_to_role` DISABLE KEYS */;
INSERT INTO `right_to_role` VALUES (608,4,'View Users',1),(1284,5,'View Roles',1),(1293,10,'Manage Users',1),(1294,10,'Manage Roles',1),(1295,10,'View Roles',1),(1296,10,'View Users',1),(1498,1,'Manage Users',1),(1499,1,'View Users',1),(1500,1,'Manage Roles',1),(1501,1,'View Roles',1),(1502,1,'View profile',1),(1503,1,'View audit trail logs',1),(1504,1,'Manage provinces',1),(1505,1,'Manage districts',1),(1506,1,'Manage camps',1),(1507,1,'Remove provinces',1),(1508,1,'Remove districts',1),(1509,1,'Remove camps',1),(1510,1,'Manage markets',1),(1511,1,'Remove markets',1),(1512,1,'Manage commodity configs',1),(1513,1,'Remove commodity config',1),(1514,1,'View commodity prices',1),(1515,1,'Remove commodity price',1),(1516,1,'Manage interview guide template questions',1),(1517,1,'View interview guide template',1),(1518,1,'Remove interview guide template question',1),(1519,1,'Manage story of change categories',1),(1520,1,'Review Story of change',1),(1521,1,'Attach case study articles',1),(1522,1,'Manage faabs groups',1),(1523,1,'View faabs groups',1),(1524,1,'View category A farmers',1),(1525,1,'View FaaBS training records',1),(1526,1,'Review back to office report',1),(1527,1,'Manage FaaBS training topics',1),(1528,1,'View FaaBS training topics',1),(1529,1,'Remove FaaBS training topics',1),(1530,1,'View facilitation of improved technologies/best practices report',1),(1531,1,'View training attendance cumulative report',1),(1532,1,'View physical tracking table report',1),(1533,1,'View programmes',1),(1534,1,'Manage AWPB activities',1),(1535,1,'View AWPB activities',1),(1536,1,'Manage components',1),(1537,1,'View components',1),(1538,1,'Manage AWPB templates',1),(1539,1,'View AWPB templates',1),(1540,1,'View AWPB activity lines',1),(1541,1,'Manage AWPB activity lines',1),(1542,1,'Submit District AWPB',1),(1543,1,'Approve AWPB - Provincial',1),(1544,1,'Submit programme-wide AWPB',1),(1545,1,'Manage province consolidated AWPB',1),(1546,1,'Approve AWPB - PCO',1),(1547,1,'Manage AWPB funders',1),(1548,1,'Setup AWPB',1),(1549,1,'Approve AWPB - Ministry',1),(1550,1,'Manage programme-wide AWPB',1),(1551,1,'View PW AWPB',1),(1552,1,'View MGF module',1),(1553,1,'View MGF Concept Note',1),(1593,3,'View profile',1),(1594,3,'Collect commodity prices',1),(1595,3,'View commodity prices',1),(1596,3,'Submit story of change',1),(1597,3,'Manage faabs groups',1),(1598,3,'View faabs groups',1),(1599,3,'Remove faabs groups',1),(1600,3,'Manage category A farmers',1),(1601,3,'View category A farmers',1),(1602,3,'Remove category A farmers',1),(1603,3,'Submit FaaBS training records',1),(1604,3,'View FaaBS training records',1),(1605,3,'Remove FaaBS training records',1),(1606,3,'Submit back to office report',1),(1607,3,'Plan camp monthly activities',1),(1608,3,'Remove planned camp monthly activities',1),(1609,3,'View facilitation of improved technologies/best practices report',1),(1610,3,'View training attendance cumulative report',1),(1611,3,'Submit project outreach records',1),(1612,3,'Remove project outreach records',1),(1613,3,'View project outreach reports',1);
/*!40000 ALTER TABLE `right_to_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` text NOT NULL,
  `active` int DEFAULT '1',
  `created_at` int unsigned DEFAULT NULL,
  `updated_at` int unsigned DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrator',1,1222,1603902498,1,1),(3,'User',1,1603902583,1603902583,1,1),(4,'test',1,1614068089,1614068089,1,1),(5,'Test 2',1,1619185146,1619185146,1,1),(10,'Admin',1,1621730405,1621730405,NULL,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` int NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `other_name` varchar(255) DEFAULT '',
  `title` varchar(10) DEFAULT '',
  `sex` varchar(7) DEFAULT 'Male',
  `phone` varchar(45) DEFAULT NULL,
  `nrc` varchar(45) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `status` smallint NOT NULL DEFAULT '10',
  `auth_key` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL DEFAULT '',
  `password_reset_token` varchar(255) DEFAULT NULL,
  `verification_token` varchar(255) DEFAULT NULL,
  `camp_id` int unsigned DEFAULT NULL,
  `district_id` int unsigned DEFAULT NULL,
  `province_id` int unsigned DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned NOT NULL,
  `type_of_user` varchar(45) DEFAULT 'Other user' COMMENT 'Type of user different from role. This is there to ammodate users that belong to camps, districts or province\nAvailable types {Camp user, District user, Provincial user, Other user}',
  PRIMARY KEY (`id`),
  KEY `fk_users_1_idx` (`role`),
  KEY `fk_users_2_idx` (`camp_id`),
  KEY `fk_users_3_idx` (`district_id`),
  KEY `fk_users_4_idx` (`province_id`),
  CONSTRAINT `fk_users_1` FOREIGN KEY (`role`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Francis','Chulu','','Mr.','Male','+260978981234','123454/21/23','chulu1francis@gmail.com','chulu1francis@gmail.com',1,'gB_PJTElMSxW^IfiNmpYT^7qva3?Hy:a','$2y$13$/igl4SBKySwX9QQc352pKef5YX6gRSI8nx/8vkTvyD0RYNDXIjIvO','-GDPDTEgVpbCySh94TqY4hRrma_XkSty_1616662153',NULL,0,0,0,1,NULL,11,1616662153,'Other user'),(5,3,'Chulu','Francis','','Mr.','Male','+260978981345','123454/21/23','francis.chulu@unza.zm','francis.chulu@unza.zm',1,'gB_PJTElMSxW^IfiNmpYT^7qva3?Hy:a','$2y$13$/igl4SBKySwX9QQc352pKef5YX6gRSI8nx/8vkTvyD0RYNDXIjIvO',NULL,NULL,NULL,NULL,NULL,1,1,1604659275,1604660233,'Other user'),(6,1,'test','Test','','','Male','','','francis.chulu1@unza.zm','francis.chulu@unza.zm',2,'gB_PJTElMSxW^IfiNmpYT^7qva3?Hy:a','$2y$13$/igl4SBKySwX9QQc352pKef5YX6gRSI8nx/8vkTvyD0RYNDXIjIvO','LZ-pePN17FJB7Mg1CtyYyRsNH5tohaz6_1607174006',NULL,NULL,NULL,NULL,1,1,1607174006,1607174024,'Other user'),(9,3,'Test','Test','','Mr.','Female','','','test@unza.zm','chulu1francis@gmail.com',1,'gB_PJTElMSxW^IfiNmpYT^7qva3?Hy:a','$2y$13$/igl4SBKySwX9QQc352pKef5YX6gRSI8nx/8vkTvyD0RYNDXIjIvO','PF4j04-lRuOClA4gXY-oTX_95V6Ap-2-_1607181915',NULL,0,0,0,1,1,1607181915,1607186786,'Other user'),(10,3,'test','Test','','Mr.','Female','','','test1@unza.zm','francis.chulu@unza.zm',1,'gB_PJTElMSxW^IfiNmpYT^7qva3?Hy:a','$2y$13$/igl4SBKySwX9QQc352pKef5YX6gRSI8nx/8vkTvyD0RYNDXIjIvO','VlfAXnPz_XY_5s6E7x2Qi_SpPhIEl9I0_1607181970',NULL,NULL,2,1,1,1,1607181970,1616772648,'District user'),(11,3,'test','Test 3','','Mr.','Male','','','test2@unza.zm','francis.chulu@unza.zm',0,'gB_PJTElMSxW^IfiNmpYT^7qva3?Hy:a','$2y$13$/igl4SBKySwX9QQc352pKef5YX6gRSI8nx/8vkTvyD0RYNDXIjIvO','pFOgJWyUKdULYoTNxXctPhB4CEv8LpzB_1607182013',NULL,NULL,NULL,1,1,1,1607182013,1614016783,'Provincial user'),(14,10,'Please','me','delete','','Male',NULL,NULL,'admin@emis.com','admin@emis.com',1,'CpmiIyoNtGGkHX0meoIJU7sGcRqQcXm5','$2y$13$AYj8JnzR1i0DDTQ5OYerHek8g5.Ch9ZrKjpg4ZJtAchchVGwVIWhy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1621730406,1621730406,'Other user');
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

-- Dump completed on 2021-07-08 12:00:00
