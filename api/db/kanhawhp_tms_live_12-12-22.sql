-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 12, 2022 at 12:50 PM
-- Server version: 5.7.40
-- PHP Version: 7.2.34-35+ubuntu20.04.1+deb.sury.org+2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kanhawhp_tms`
--

-- --------------------------------------------------------

--
-- Table structure for table `tms_additional_info`
--

CREATE TABLE `tms_additional_info` (
  `add_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_type` int(11) NOT NULL COMMENT '1=user, 2=client',
  `comments` text NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tms_banking_info`
--

CREATE TABLE `tms_banking_info` (
  `bank_id` int(11) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `holder_name` varchar(255) NOT NULL,
  `currency_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `iban` varchar(255) NOT NULL,
  `swift_bic` varchar(255) NOT NULL,
  `bank_code` varchar(255) NOT NULL,
  `routing_number` varchar(255) NOT NULL,
  `is_default` tinyint(2) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_banking_info`
--

INSERT INTO `tms_banking_info` (`bank_id`, `payment_method`, `bank_name`, `address`, `holder_name`, `currency_code`, `iban`, `swift_bic`, `bank_code`, `routing_number`, `is_default`, `created_date`, `updated_date`) VALUES
(1, 'Bank Transfer', 'European Central Bank', 'Frankfurt am Main, Nrv', 'TMS BeConnected', 'EUR,€', 'EGT5340', 'ECBFDEFF', 'FIM', 'GF547890', 1, '2022-03-23 17:12:07', '2022-03-23 17:21:49'),
(2, 'Bank Transfer', 'United Bulgarian Bank', 'Millennium center, vitosha blvd. 89b', 'TMS BeConnected', 'BGN,лв', 'UBB540697', 'UBBSBGSF', 'UBBS', '657049', 0, '2022-03-23 17:23:04', '2022-03-23 17:23:56');

-- --------------------------------------------------------

--
-- Table structure for table `tms_centers`
--

CREATE TABLE `tms_centers` (
  `center_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `abbrivation` varchar(255) NOT NULL,
  `is_active` varchar(255) NOT NULL COMMENT 'active=''1'',inactive=''0''',
  `order_number` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_centers`
--

INSERT INTO `tms_centers` (`center_id`, `name`, `abbrivation`, `is_active`, `order_number`, `created_date`, `updated_date`) VALUES
(7, 'Kanhasoft', 'KNH', '1', '[{\"id\":\"numberFormate\",\"value\":\"KNH16___\"}]', '2016-02-16 10:45:05', '2022-10-18 15:20:33'),
(12, 'SpellUp', 'SPE', '1', '[{\"id\":\"numberFormate\",\"value\":\"SU_\"}]', '2022-10-11 14:42:14', '2022-12-05 00:04:48');

-- --------------------------------------------------------

--
-- Table structure for table `tms_child_price_unit`
--

CREATE TABLE `tms_child_price_unit` (
  `child_price_id` int(11) NOT NULL,
  `master_price_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `rate` varchar(255) NOT NULL,
  `hours` varchar(255) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `service` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1' COMMENT 'active="1",inactive="0"',
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_child_price_unit`
--

INSERT INTO `tms_child_price_unit` (`child_price_id`, `master_price_id`, `name`, `code`, `rate`, `hours`, `unit`, `service`, `is_active`, `created_date`, `updated_date`) VALUES
(1, 1, 'Words Translation (New)', '', '1', '', 'Words', '', 1, '2021-11-24 16:57:14', '2021-11-24 16:57:14'),
(2, 1, 'Words Translation 50-74% Match', '', '0.6', '', 'Words', '', 1, '2021-11-24 16:57:48', '2021-11-24 17:08:58'),
(3, 1, 'Words Translation 75-84% Match', '', '0.8', '', 'Words', '', 1, '2021-11-24 17:09:18', '2021-11-24 17:09:18'),
(4, 1, 'Words Translation 85-94% Match', '', '0.9', '', 'Words', '', 1, '2021-11-24 17:11:55', '2021-11-24 17:11:55'),
(5, 1, 'Words Translation 95-99% Match', '', '3', '', 'Words', '', 1, '2021-11-24 17:12:29', '2021-11-24 17:12:29'),
(6, 1, 'Words Translation 100% Match', '', '0.8', '', 'Words', '', 1, '2021-11-24 17:13:30', '2021-11-24 17:13:30'),
(8, 1, 'Words Translation Repetitions', '', '1', '', 'Words', '', 1, '2021-11-24 19:14:28', '2021-11-24 19:14:28'),
(13, 1, 'Project Price', '', '1.00', '', 'Words', '', 1, '2021-11-24 19:16:38', '2022-12-04 01:38:21'),
(21, 2, 'Word(s) Proofreading', '', '1.00', '', 'Words', '', 1, '2021-11-24 19:52:12', '2022-12-04 01:37:41'),
(22, 2, 'Hour(s) Proofreading', '', '1', '', 'Words', '', 1, '2021-11-24 19:52:30', '2021-11-24 19:52:30'),
(24, 2, 'Project Price', '', '1.00', '', 'Words', '', 1, '2021-11-24 19:55:02', '2022-12-04 01:34:38'),
(25, 3, 'Words Editing', '', '1', '', 'Words', '', 1, '2021-11-25 10:43:56', '2021-11-25 10:43:56'),
(26, 3, 'Hour(s) Editing', '', '1', '', 'Hours', '', 1, '2021-11-25 10:44:25', '2021-11-25 10:44:25'),
(27, 3, 'Minimum Fee', '', '1', '', 'Minimum price', '', 1, '2021-11-25 10:44:48', '2021-11-25 10:44:48'),
(28, 20, 'Hour(s) Transcreation', '', '1.00', '', 'Hours', '', 1, '2021-11-25 10:45:23', '2022-12-04 01:34:09'),
(29, 20, 'Minute(s) Transcription', '', '1.00', '', 'Minutes', '', 1, '2021-11-25 10:45:39', '2022-12-04 01:33:47'),
(30, 4, 'Hour(s) Desktop Publishing', '', '1.00', '', 'Hours', '', 1, '2021-11-25 10:46:12', '2022-12-04 01:22:15'),
(32, 5, 'Machine Translation Editing (New)', '', '1.00', '', 'Words', '', 1, '2021-11-25 10:52:24', '2022-12-04 01:21:33'),
(40, 7, 'Hour(s) Search Engine Optimization', '', '1.00', '', 'Hours', '', 1, '2021-11-25 11:01:01', '2022-12-04 01:18:40'),
(42, 8, 'Minute(s) Subtitling without Time Coding', '', '1.00', '', 'Minutes', '', 1, '2021-11-25 11:04:45', '2022-12-04 01:17:16'),
(43, 8, 'Minute(s) Subtitling with Time Coding', '', '1.00', '', 'Minutes', '', 1, '2021-11-25 11:05:02', '2022-12-04 01:16:54'),
(44, 8, 'Words Subtitling without Time Coding', '', '1.00', '', 'Words', '', 1, '2021-11-25 11:05:21', '2022-12-04 01:15:50'),
(45, 8, 'Words Subtitling with Time Coding', '', '1.00', '', 'Words', '', 1, '2021-11-25 11:06:53', '2022-12-04 01:15:59'),
(47, 9, 'Words TEP (New)', '', '1', '', 'Words', '', 1, '2021-11-25 11:15:49', '2021-11-25 11:15:49'),
(48, 9, 'Words TEP 50-74% Match', '', '1', '', 'Words', '', 1, '2021-11-25 11:16:14', '2021-11-25 11:16:14'),
(49, 9, 'Words TEP 75-84% Match', '', '1', '', 'Words', '', 1, '2021-11-25 11:17:01', '2021-11-25 11:17:01'),
(50, 9, 'Words TEP 85-94% Match', '', '1', '', 'Words', '', 1, '2021-11-25 11:17:17', '2021-11-25 11:17:17'),
(51, 9, 'Words TEP 95-99% Match', '', '1', '', 'Words', '', 1, '2021-11-25 11:17:31', '2021-11-25 11:17:31'),
(52, 9, 'Words TEP 100% Match', '', '1', '', 'Words', '', 1, '2021-11-25 11:17:48', '2021-11-25 11:17:48'),
(54, 9, 'Words TEP Repetitions', '', '1', '', 'Words', '', 1, '2021-11-25 11:18:47', '2021-11-25 11:18:47'),
(65, 5, 'Hour(s) Machine Translation Editing', '', '1.00', '', 'Hours', '', 1, '2022-12-04 01:24:01', '2022-12-04 01:24:22'),
(66, 12, 'Hour(s) Linguistic Quality Assurance', '', '1.00', '', 'Hours', '', 1, '2022-12-04 01:44:40', '2022-12-04 01:44:40'),
(67, 22, 'Hour(s) Term & Style Guide Creation', '', '1.00', '', 'Hours', '', 1, '2022-12-04 01:45:13', '2022-12-04 01:45:13'),
(68, 14, 'Hour(s) Linguistic Sign-Off', '', '1.00', '', 'Hours', '', 1, '2022-12-04 01:45:36', '2022-12-04 01:45:36'),
(69, 21, 'Hour(s) Test Review', '', '1.00', '', 'Hours', '', 1, '2022-12-04 01:45:57', '2022-12-04 01:45:57'),
(70, 10, 'Word(s) Transcreation', '', '1.00', '', 'Words', '', 1, '2022-12-04 01:46:37', '2022-12-04 01:46:37'),
(71, 10, 'Hour(s) Transcreation', '', '1.00', '', 'Hours', '', 1, '2022-12-04 01:47:02', '2022-12-04 01:47:02'),
(72, 19, 'Hour(s) Screenshot Review', '', '1.00', '', 'Hours', '', 1, '2022-12-04 01:47:24', '2022-12-04 01:47:24'),
(73, 19, 'Unit(s) Screenshot Review', '', '1.00', '', 'Units', '', 1, '2022-12-04 01:48:19', '2022-12-04 01:48:19'),
(74, 18, 'Hour(s) Migration', '', '1.00', '', 'Hours', '', 1, '2022-12-04 01:49:14', '2022-12-04 01:49:14'),
(75, 17, 'Hour(s) Reconciliation', '', '1.00', '', 'Hours', '', 1, '2022-12-04 01:49:33', '2022-12-04 01:49:33'),
(76, 16, 'Hour(s) Cognitive Debriefing', '', '1.00', '', 'Hours', '', 1, '2022-12-04 01:50:01', '2022-12-04 01:50:01'),
(77, 9, 'Project Price', '', '1.00', '', 'Fixed rate', '', 1, '2022-12-04 01:51:13', '2022-12-04 01:51:13'),
(78, 11, 'Hour(s) Testing', '', '1.00', '', 'Hours', '', 1, '2022-12-04 01:53:18', '2022-12-04 01:53:18');

-- --------------------------------------------------------

--
-- Table structure for table `tms_client`
--

CREATE TABLE `tms_client` (
  `iClientId` int(11) NOT NULL,
  `vUserName` varchar(255) NOT NULL,
  `vCodeInvoice` varchar(255) NOT NULL,
  `vCodeRights` varchar(255) NOT NULL,
  `vEmailAddress` varchar(255) NOT NULL,
  `vPhone` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `vSkype` varchar(255) NOT NULL,
  `vLogo` varchar(255) NOT NULL,
  `vWebsite` varchar(255) NOT NULL,
  `vAddress1` varchar(255) NOT NULL,
  `vAddress2` varchar(255) NOT NULL,
  `address1Detail` text NOT NULL,
  `address2Detail` text NOT NULL,
  `iBussinessDeveloper` int(11) NOT NULL,
  `vProjectCoordinator` varchar(255) NOT NULL,
  `vProjectManager` varchar(255) NOT NULL,
  `vQASpecialist` varchar(255) NOT NULL,
  `vCustomerType` varchar(255) NOT NULL,
  `company_branch_project` varchar(255) NOT NULL,
  `company_branch_invoice` varchar(255) NOT NULL,
  `vStatus` varchar(255) NOT NULL,
  `iSaleId` int(11) NOT NULL,
  `vTextType` varchar(255) NOT NULL COMMENT 'This is Taxation field.',
  `vClientNumber` varchar(255) NOT NULL,
  `dtCreationDate` datetime NOT NULL,
  `iTemplate` int(11) NOT NULL,
  `vVatNumber` varchar(255) NOT NULL,
  `tMemo` text NOT NULL,
  `tPoInfo` text NOT NULL,
  `tPofor` text NOT NULL,
  `Invoice` longtext NOT NULL,
  `customer_group` varchar(255) NOT NULL,
  `project_branch` varchar(111) NOT NULL DEFAULT 'Norway',
  `client_currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_id` int(11) NOT NULL,
  `modified_id` int(255) NOT NULL,
  `iEditedBy` int(11) NOT NULL,
  `dtCreatedDate` datetime NOT NULL,
  `dtUpdatedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_client`
--

INSERT INTO `tms_client` (`iClientId`, `vUserName`, `vCodeInvoice`, `vCodeRights`, `vEmailAddress`, `vPhone`, `vSkype`, `vLogo`, `vWebsite`, `vAddress1`, `vAddress2`, `address1Detail`, `address2Detail`, `iBussinessDeveloper`, `vProjectCoordinator`, `vProjectManager`, `vQASpecialist`, `vCustomerType`, `company_branch_project`, `company_branch_invoice`, `vStatus`, `iSaleId`, `vTextType`, `vClientNumber`, `dtCreationDate`, `iTemplate`, `vVatNumber`, `tMemo`, `tPoInfo`, `tPofor`, `Invoice`, `customer_group`, `project_branch`, `client_currency`, `created_id`, `modified_id`, `iEditedBy`, `dtCreatedDate`, `dtUpdatedDate`) VALUES
(1, 'Capita', '', 'SPE_', '', '{\"countryTitle\":\"Afghanistan (‫افغانستان‬‎): +93\",\"countryFlagClass\":\"iti-flag af\",\"mobileNumber\":\"01618801966\"}', '', '1667227384.jpg', 'https://www.capitatranslationinterpreting.com/', 'Riverside Court, Huddersfield Road', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"United Kingdom\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"Oldham\"},{\"id\":\"address1_locality\",\"value\":\"Delph\"},{\"id\":\"address1_postal_code\",\"value\":\"OL3 5FZ\"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 09.42) America/Chicago\"}]', '[]', 0, '', '', '', '', '', '', '11', 0, '', '1', '2022-10-31 00:00:00', 0, '', '', 'capita-001', '', '', '', 'Norway', '', 1, 1, 0, '2022-11-17 21:46:58', '2022-11-17 21:46:58'),
(2, 'Berba Translations S.L.', '', 'SPE_', '', '{\"countryTitle\":\"Spain (España): +34\",\"countryFlagClass\":\"iti-flag es\",\"mobileNumber\":\"+3434946780202\"}', '', '1667227538.png', 'www.berba.com', 'Buenos Aires Kalea 12', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Spain\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"N/A\"},{\"id\":\"address1_locality\",\"value\":\"Bilbao\"},{\"id\":\"address1_postal_code\",\"value\":\"48001\"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 15.45) Europe/Madrid\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '2', '2022-10-31 00:00:00', 0, '', '', 'berba-translations-s.l.-002', '', '', '', 'Norway', '', 1, 1, 0, '2022-11-11 23:38:47', '2022-11-11 23:38:47'),
(3, 'DATAWORDS DATASIA SARL', '', 'SPEU_', '', '{\"countryTitle\":\"Spain (España): +34\",\"countryFlagClass\":\"iti-flag es\",\"mobileNumber\":\"645 65 94 11\"}', '', '1667910596.png', 'https://www.datawords.com', 'Gran Via de les Corts Catalanes 641', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Spain\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"N/A\"},{\"id\":\"address1_locality\",\"value\":\"Entresuelo, Barcelona\"},{\"id\":\"address1_postal_code\",\"value\":\"08010\"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 15.50) Europe/Madrid\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '3', '2022-10-31 00:00:00', 0, '', '', 'datawords-datasia-sarl-003', '', '', '', 'Norway', '', 1, 1, 0, '2022-12-05 15:15:25', '2022-12-05 15:15:25'),
(4, 'Kanhasoft Test Client', '', 'KNH16', '', '{\"countryTitle\":\"India (भारत): +91\",\"countryFlagClass\":\"iti-flag in\",\"mobileNumber\":\"097376 36754\"}', '', '1667288037.png', 'kanhasoft.com', 'Kanhasoft', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Norway\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Ahmedabad\"},{\"id\":\"address1_postal_code\",\"value\":\"380058\"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 13.03) Asia/Kolkata\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '4', '2022-11-01 00:00:00', 0, '', '', 'kanhasoft-test-008888', '', '', '', 'Norway', '', 1, 1, 1, '2022-12-01 10:38:15', '2022-12-01 10:38:15'),
(5, 'ICS Translate', '', 'SPE_', '', '{\"countryTitle\":\"United Kingdom: +44\",\"countryFlagClass\":\"iti-flag gb\",\"mobileNumber\":\"0113 430 1272\"}', '', '1667486314.png', 'https://www.ics-translate.com/', '2 Park Lane', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"United Kingdom\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"N/A\"},{\"id\":\"address1_locality\",\"value\":\"Leeds\"},{\"id\":\"address1_postal_code\",\"value\":\"LS3 1ES\"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 14.35) Europe/London\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '5', '2022-11-03 00:00:00', 0, '', '', 'ics-translate-005', '', '', '', 'Norway', '', 1, 1, 0, '2022-11-17 14:54:39', '2022-11-17 14:54:39'),
(8, 'JT Language Solutions', '', 'SPE22', '', '{\"countryTitle\":\"United Kingdom: +44\",\"countryFlagClass\":\"iti-flag gb\",\"mobileNumber\":\"07748 777267\"}', '', '1668075764.jpg', 'https://jt-languagesolutions.com', 'Bornholmerstr. 93', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Germany\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Berlin\"},{\"id\":\"address1_postal_code\",\"value\":\"10439\"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 11.22) Europe/Berlin\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '6', '2022-11-10 00:00:00', 0, '', '', '', '', '', '', 'Norway', '', 1, 1, 0, '2022-11-11 16:58:22', '2022-11-11 16:58:22'),
(9, 'Scorewarrior Limited', '', 'SPE_', '', '{\"countryTitle\":\"Cyprus (Κύπρος): +357\",\"countryFlagClass\":\"iti-flag cy\",\"mobileNumber\":\"25 211945\"}', '', '1668162959.png', 'https://scorewarrior.com/', '16 Spyrou Kyprianou, Divine Clock Tower, 1st floor', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Cyprus\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Limassol\"},{\"id\":\"address1_postal_code\",\"value\":\"3070\"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 12.33) Asia/Nicosia\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '7', '2022-11-11 00:00:00', 0, '', '', '', '', '', '', 'Norway', '', 7, 1, 0, '2022-11-17 14:55:14', '2022-11-17 14:55:14'),
(10, 'MAXSUN INTERNATIONAL (HK) LTD', '', 'SPE_', '', '{\"countryTitle\":\"Norway (Norge): +47\",\"countryFlagClass\":\"iti-flag no\",\"mobileNumber\":\"960 19 485\"}', '', '1668597374.png', 'https://maxsuntranslation.com/', 'Landgangen 2', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"China\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"Shenzhen\"},{\"id\":\"address1_locality\",\"value\":\"Oslo\"},{\"id\":\"address1_postal_code\",\"value\":\"0252\"},{\"id\":\"address1_vTimezone\",\"value\":\"china \"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '8', '2022-11-16 16:46:14', 0, '', '', '', '', '', '', 'Norway', '', 1, 0, 0, '2022-11-16 16:46:14', '2022-11-16 16:46:14'),
(11, 'Intrawelt', '', 'SPE_', '', '{\"countryTitle\":\"Italy (Italia): +39\",\"countryFlagClass\":\"iti-flag it\",\"mobileNumber\":\"+39 06 4543 7779\"}', '', '1668598148.jpg', 'https://intrawelt.com', 'Landgangen 2', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Norway\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Oslo\"},{\"id\":\"address1_postal_code\",\"value\":\"0252\"},{\"id\":\"address1_vTimezone\",\"value\":\"\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '9', '2022-11-16 16:59:08', 0, '', '', '', '', '', '', 'Norway', '', 1, 0, 0, '2022-11-16 16:59:08', '2022-11-16 16:59:08'),
(12, 'Ingvild Test Client', '', 'SPE_', '', '{\"countryTitle\":\"China (中国): +86\",\"countryFlagClass\":\"iti-flag cn\",\"mobileNumber\":\"9405 3446\"}', '', '1668710541.jpg', 'www.isundland.no', 'Lettvintveien 33B', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Norway\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Oslo\"},{\"id\":\"address1_postal_code\",\"value\":\"0487\"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 19.13) Europe/Oslo\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '10', '2022-11-18 00:00:00', 0, '', '', '', '', '', '', 'Norway', '', 7, 7, 7, '2022-11-18 00:16:05', '2022-11-18 00:16:05'),
(14, 'Lingsoft', '', 'SPE_', '', '{\"countryTitle\":\"Finland (Suomi): +358\",\"countryFlagClass\":\"iti-flag fi\",\"mobileNumber\":\"+358 2 2793300\"}', '', '1669894396.png', 'https://www.lingsoft.fi', 'Kauppiaskatu 5 A', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Finland\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Turku\"},{\"id\":\"address1_postal_code\",\"value\":\"FI-20100\"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 13.33) Europe/Helsinki\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '10', '2022-12-01 17:03:16', 0, '', '', 'lingsoft-010', '', '', '', 'Norway', '', 1, 0, 14, '2022-12-01 17:03:16', '2022-12-01 17:03:16'),
(15, 'Intertranslations', '', 'SPE_', '', '{\"countryTitle\":\"Greece (Ελλάδα): +30\",\"countryFlagClass\":\"iti-flag gr\",\"mobileNumber\":\"21 0922 5000\"}', '', '1669904131.png', 'https://www.intertranslations.gr/', 'El. Venizelou 4', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Greece\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Kallithea\"},{\"id\":\"address1_postal_code\",\"value\":\"17676\"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 16.15) Europe/Athens\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '10', '2022-12-01 19:45:31', 0, '', '', 'intertranslations-010', '', '', '', 'Norway', '', 1, 0, 0, '2022-12-01 19:45:31', '2022-12-01 19:45:31'),
(16, 'Qontent Group', '', 'SPE_', '', '{\"countryTitle\":\"Italy (Italia): +39\",\"countryFlagClass\":\"iti-flag it\",\"mobileNumber\":\"+39 080 472 2864\"}', '', '1669905148.png', 'https://www.qontentgroup.com', 'via Achille Salvucci n. 6 – 6/A – 6/B', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Italy\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Molfetta (BA)\"},{\"id\":\"address1_postal_code\",\"value\":\"70056\"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 15.32) Europe/Rome\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '10', '2022-12-01 20:02:28', 0, '', '', 'qontent-group-010', '', '', '', 'Norway', '', 1, 0, 0, '2022-12-01 20:02:28', '2022-12-01 20:02:28'),
(17, 'Fasttranslator', '', 'SPEU_', '', '{\"countryTitle\":\"Sweden (Sverige): +46\",\"countryFlagClass\":\"iti-flag se\",\"mobileNumber\":\"01146858097877\"}', '', '1670253144.png', 'https://www.fasttranslator.com', 'World Trade Center, Klarabergsviadukten 70', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Sweden\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Stockholm\"},{\"id\":\"address1_postal_code\",\"value\":\"SE-111 24 \"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 16.12) Europe/Stockholm\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '10', '2022-12-05 20:42:24', 0, '', '', 'fasttranslator-010', '', '', '', 'Norway', '', 1, 0, 0, '2022-12-05 20:42:24', '2022-12-05 20:42:24'),
(18, 'Supertext AG', '', 'SPEU_', '', '{\"countryTitle\":\"Switzerland (Schweiz): +41\",\"countryFlagClass\":\"iti-flag ch\",\"mobileNumber\":\"+41 43 500 33 80\"}', '', '1670428343.png', 'https://www.supertext.ch/', 'Hardturmstrasse 253', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Switzerland\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Zurich\"},{\"id\":\"address1_postal_code\",\"value\":\"8005 \"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 16.52) Europe/Zurich\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '10', '2022-12-07 21:22:23', 0, '', '', 'supertext-ag-010', '', '', '', 'Norway', '', 14, 0, 0, '2022-12-07 21:22:23', '2022-12-07 21:22:23');

-- --------------------------------------------------------

--
-- Table structure for table `tms_client_contact`
--

CREATE TABLE `tms_client_contact` (
  `iContactId` int(11) NOT NULL,
  `iClientId` int(11) NOT NULL,
  `iUserId` int(11) NOT NULL,
  `vFirstName` varchar(255) NOT NULL,
  `vLastName` varchar(255) NOT NULL,
  `vEmail` varchar(255) NOT NULL,
  `vDepartment` varchar(255) NOT NULL,
  `vJobTitle` varchar(255) NOT NULL,
  `vPhone` varchar(255) NOT NULL,
  `vSkype` varchar(255) NOT NULL,
  `vActive` enum('active','inactive','Not Contacted') NOT NULL,
  `tMemo` text NOT NULL,
  `dtCreatedDate` datetime NOT NULL,
  `dtUpdatedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_client_contact`
--

INSERT INTO `tms_client_contact` (`iContactId`, `iClientId`, `iUserId`, `vFirstName`, `vLastName`, `vEmail`, `vDepartment`, `vJobTitle`, `vPhone`, `vSkype`, `vActive`, `tMemo`, `dtCreatedDate`, `dtUpdatedDate`) VALUES
(1, 1, 0, 'Graciano', 'Constantino', 'GRACIANO.Constantino@capita.com', '', 'Vendor Coordinator', '{\"countryTitle\":\"United Kingdom: +44\",\"countryFlagClass\":\"iti-flag gb\",\"mobileNumber\":\"+4401618801966\"}', '', 'active', '', '2022-10-31 20:14:04', '2022-11-01 17:29:13'),
(2, 4, 0, 'Contact', 'At Kanhasoft', 'kanhasoft@yopmail.com', '', 'Vendor Coordinator', '{\"countryTitle\":\"India (????): +91\",\"countryFlagClass\":\"iti-flag in\",\"mobileNumber\":\"097376 36759\"}', 'kanhasoft', 'active', '', '2022-11-01 13:31:19', '2022-11-07 12:25:56'),
(3, 2, 0, 'Cristina', 'Rabre', 'projects@berba.com', '', '', '{\"countryTitle\":\"Norway (Norge): +47\",\"countryFlagClass\":\"iti-flag no\",\"mobileNumber\":\"960 19 485\"}', '', 'active', '', '2022-11-03 21:00:21', '2022-11-03 21:00:21'),
(4, 5, 0, 'Mélanie', 'Matteoni', 'melanie.matteoni@ics-translate.com', '', '', '{\"countryTitle\":\"Norway (Norge): +47\",\"countryFlagClass\":\"iti-flag no\",\"mobileNumber\":\"960 19 485\"}', '', 'active', '', '2022-11-03 21:56:55', '2022-11-03 21:56:55'),
(5, 3, 0, 'Virginia', 'Martinez Tudela', 'vtudela@datawords.com', '', '', '{\"countryTitle\":\"Norway (Norge): +47\",\"countryFlagClass\":\"iti-flag no\",\"mobileNumber\":\"960 19 485\"}', '', 'active', '', '2022-11-04 16:39:29', '2022-11-04 16:39:29'),
(6, 3, 0, 'Marianna', 'Setini', 'msetini@datawords.com', '', '', '{\"countryTitle\":\"Norway (Norge): +47\",\"countryFlagClass\":\"iti-flag no\",\"mobileNumber\":\"960 19 485\"}', '', 'active', '', '2022-11-04 16:47:31', '2022-11-04 16:47:31'),
(7, 7, 0, 'Tetst', 'Tettd', 'jaimini.kanhasoft@gmail.com', '', 'managrr', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"(201) 555-5555\"}', 'test.com', 'active', '', '2022-11-08 17:50:48', '2022-11-08 17:50:48'),
(8, 3, 0, 'Maha', 'El Berd', 'melberd@datawords.com', '', '', '{\"countryTitle\":\"Norway (Norge): +47\",\"countryFlagClass\":\"iti-flag no\",\"mobileNumber\":\"960 19 485\"}', '', 'active', '', '2022-11-08 18:01:48', '2022-11-08 18:01:48'),
(9, 8, 0, 'Jonathan', 'Tsang', 'jonathan@jt-languagesolutions.com', '', '', '{\"countryTitle\":\"United Kingdom: +44\",\"countryFlagClass\":\"iti-flag gb\",\"mobileNumber\":\"+44 7748 777267\"}', '', 'active', '', '2022-11-10 15:54:30', '2022-11-10 15:54:30'),
(10, 9, 0, 'Vladislav', 'Solntsev', 'vsolntsev@scorewarrior.com', '', '', '{\"countryTitle\":\"Cyprus (??????): +357\",\"countryFlagClass\":\"iti-flag cy\",\"mobileNumber\":\"25 211945\"}', 'live:solntseffv_1', 'active', '', '2022-11-11 16:20:48', '2022-11-11 16:20:48'),
(11, 5, 0, 'Rebeka', 'Angstmann', 'rebeka.angstmann@ics-translate.com', '', '', '{\"countryTitle\":\"Norway (Norge): +47\",\"countryFlagClass\":\"iti-flag no\",\"mobileNumber\":\"960 19 485\"}', '', 'active', '', '2022-11-16 16:33:44', '2022-11-16 16:33:44'),
(12, 10, 0, 'Stephy', 'Maxsun', 'RM03@translation.link', '', '', '{\"countryTitle\":\"Norway (Norge): +47\",\"countryFlagClass\":\"iti-flag no\",\"mobileNumber\":\"960 19 485\"}', '', 'active', '', '2022-11-16 16:46:58', '2022-11-16 16:46:58'),
(13, 11, 0, 'Ulrike', 'Stratmann', 'ustratmann@intrawelt.com', '', 'Senior Project Manager', '{\"countryTitle\":\"Italy (Italia): +39\",\"countryFlagClass\":\"iti-flag it\",\"mobileNumber\":\"+39 0734 993744\"}', '', 'active', '', '2022-11-16 16:59:44', '2022-11-16 16:59:44'),
(14, 3, 0, 'Polina', 'RYAZANTSEVA', 'pryazantseva@datawords.com', '', '', '{\"countryTitle\":\"Norway (Norge): +47\",\"countryFlagClass\":\"iti-flag no\",\"mobileNumber\":\"960 19 485\"}', '', 'active', '', '2022-11-16 17:04:22', '2022-11-16 17:04:22'),
(15, 12, 0, 'Ingvild', 'Sundland', 'isundland@spellup.no', '', '', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2022-11-18 00:16:52', '2022-11-18 00:16:52'),
(16, 13, 0, 'Kanha', 'Matry', 'qa.kanhasoft@yopmail.com', '', '', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2022-11-18 15:52:47', '2022-11-18 15:52:47'),
(17, 3, 0, 'Alexandra', 'BIROVESCU', 'abirovescu@datawords.com', '', '', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2022-11-18 23:56:36', '2022-11-18 23:56:36'),
(18, 14, 0, 'Solveig', 'Sandaas', 'ssandaas@beconnected.no', '', '', '{\"countryTitle\":\"Norway (Norge): +47\",\"countryFlagClass\":\"iti-flag no\",\"mobileNumber\":\"960 19 485\"}', '', 'active', '', '2022-12-01 17:04:49', '2022-12-01 17:04:49'),
(19, 15, 0, 'Artemisia', 'Kseinou', 'a.kseinou@intertranslations.com', '', 'Junior Vendor Manager', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2022-12-01 19:46:07', '2022-12-01 19:46:07'),
(20, 16, 0, 'Silvia', 'Capobianco', 's.capobianco@qontentgroup.com', '', 'Senior Project Manager', '{\"countryTitle\":\"Italy (Italia): +39\",\"countryFlagClass\":\"iti-flag it\",\"mobileNumber\":\"+39 080 472 2864\"}', '', 'active', '', '2022-12-01 20:03:03', '2022-12-01 20:03:03'),
(21, 3, 0, 'Laura', 'Sounalath', 'lasounalath@datawords.com', '', '', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2022-12-01 22:11:50', '2022-12-01 22:11:50'),
(22, 3, 0, 'Katia', 'Stamati', 'kastamati@datawords.com', '', 'Project Manager', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2022-12-02 14:52:28', '2022-12-02 14:52:28'),
(23, 17, 0, 'Odd', 'Hedmyr', 'odd.hedmyr@fasttranslator.com', '', 'Project Manager', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2022-12-05 20:42:59', '2022-12-05 20:42:59'),
(24, 3, 0, 'Morgane', 'Jarrin', 'mjarrin@datawords.com', '', '', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2022-12-05 20:58:27', '2022-12-05 20:58:27'),
(25, 18, 0, 'Silvia', 'Ramos', 'ramos@supertext.de', '', 'Project Manager', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2022-12-07 21:22:50', '2022-12-07 21:22:50');

-- --------------------------------------------------------

--
-- Table structure for table `tms_client_indirect`
--

CREATE TABLE `tms_client_indirect` (
  `iClientId` int(11) NOT NULL,
  `vUserName` varchar(255) NOT NULL,
  `vClientNumber` int(11) NOT NULL,
  `vWebsite` varchar(255) NOT NULL,
  `po` varchar(255) NOT NULL,
  `notes` longtext NOT NULL,
  `iEditedBy` int(11) NOT NULL,
  `dtCreationDate` datetime NOT NULL,
  `dtUpdatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_client_indirect`
--

INSERT INTO `tms_client_indirect` (`iClientId`, `vUserName`, `vClientNumber`, `vWebsite`, `po`, `notes`, `iEditedBy`, `dtCreationDate`, `dtUpdatedDate`) VALUES
(1, 'Acc Kanhasoft', 1, 'kanhasoft.com', '', 'just for testing project', 0, '2022-11-07 12:28:31', '2022-11-09 05:11:15'),
(2, 'Microsoft', 2, 'https://www.microsoft.com', '', '', 0, '2022-11-02 18:09:16', '2022-11-02 18:09:16'),
(3, 'SpellUp', 3, 'www.spellup.no', '', '', 0, '2022-11-02 18:33:07', '2022-11-02 18:33:07'),
(4, 'TruePartners', 4, 'https://truepartners.io/', '', '', 0, '2022-11-08 13:47:59', '2022-11-08 13:47:59'),
(5, 'Chanel', 5, 'https://www.chanel.com/no/', '', '', 0, '2022-11-08 18:02:37', '2022-11-08 18:02:37'),
(6, 'Hill´s Pet', 6, 'https://www.hillspet.no/', '', '', 0, '2022-11-10 16:35:55', '2022-11-10 16:35:55'),
(7, 'Scorewarrior', 7, 'https://scorewarrior.com/', '', '', 0, '2022-11-11 16:21:36', '2022-11-11 16:21:36'),
(8, 'GiG (Gaming Innovation Group)', 8, 'https://www.gig.com/', '', '', 0, '2022-12-01 19:17:16', '2022-12-05 15:27:19'),
(9, 'Uniclub', 9, 'https://uniclub.lt/', '', '', 0, '2022-11-16 16:31:57', '2022-11-16 16:31:57'),
(10, 'SkinCeuticals', 10, 'https://www.skinceuticals.com/', '', '', 0, '2022-11-16 17:04:59', '2022-11-16 17:04:59'),
(11, 'TechnoAlpin', 11, 'https://www.technoalpin.com/en/', '', '', 0, '2022-12-01 16:26:55', '2022-12-01 16:26:55'),
(12, 'Parker Hannifin', 12, 'https://www.parker.com', '', '', 0, '2022-12-01 17:12:37', '2022-12-01 17:12:37'),
(13, 'ILOQ', 13, 'https://www.iloq.com', '', '', 0, '2022-12-01 18:06:20', '2022-12-01 18:06:20'),
(14, 'Ecolab', 14, 'https://www.ecolab.com', '', '', 0, '2022-12-01 19:16:54', '2022-12-01 19:16:54'),
(15, 'Loxam', 15, 'https://loxam.com/', '', '', 0, '2022-12-01 20:50:12', '2022-12-01 20:50:12'),
(16, 'D&G (Dolce Gabbana)', 16, 'https://www.dolcegabbana.com', '', '', 0, '2022-12-02 14:51:29', '2022-12-02 14:51:29'),
(17, 'Pierre Fabre', 17, 'https://www.pierre-fabre.com', '', '', 0, '2022-12-05 20:57:46', '2022-12-05 20:57:46'),
(18, 'Twitch Interactive', 18, 'https://www.twitch.tv/', '', '', 0, '2022-12-07 21:24:35', '2022-12-07 21:24:35'),
(19, 'Tesla', 19, 'https://www.tesla.com/', '', '', 0, '2022-12-12 17:45:05', '2022-12-12 17:45:05');

-- --------------------------------------------------------

--
-- Table structure for table `tms_country`
--

CREATE TABLE `tms_country` (
  `id` int(11) NOT NULL,
  `iso` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  `nicename` varchar(80) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  `phonecode` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_country`
--

INSERT INTO `tms_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4, 93),
(2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8, 355),
(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12, 213),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16, 1684),
(5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20, 376),
(6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24, 244),
(7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660, 1264),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL, 0),
(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28, 1268),
(10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32, 54),
(11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51, 374),
(12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533, 297),
(13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36, 61),
(14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40, 43),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31, 994),
(16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44, 1242),
(17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48, 973),
(18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50, 880),
(19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52, 1246),
(20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112, 375),
(21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56, 32),
(22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84, 501),
(23, 'BJ', 'BENIN', 'Benin', 'BEN', 204, 229),
(24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60, 1441),
(25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64, 975),
(26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68, 591),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70, 387),
(28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72, 267),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL, 0),
(30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76, 55),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL, 246),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96, 673),
(33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100, 359),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854, 226),
(35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108, 257),
(36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116, 855),
(37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120, 237),
(38, 'CA', 'CANADA', 'Canada', 'CAN', 124, 1),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132, 238),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136, 1345),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140, 236),
(42, 'TD', 'CHAD', 'Chad', 'TCD', 148, 235),
(43, 'CL', 'CHILE', 'Chile', 'CHL', 152, 56),
(44, 'CN', 'CHINA', 'China', 'CHN', 156, 86),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL, 61),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL, 672),
(47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170, 57),
(48, 'KM', 'COMOROS', 'Comoros', 'COM', 174, 269),
(49, 'CG', 'CONGO', 'Congo', 'COG', 178, 242),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180, 242),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184, 682),
(52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188, 506),
(53, 'CI', 'COTE D\'IVOIRE', 'Cote D\'Ivoire', 'CIV', 384, 225),
(54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191, 385),
(55, 'CU', 'CUBA', 'Cuba', 'CUB', 192, 53),
(56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196, 357),
(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203, 420),
(58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208, 45),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262, 253),
(60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212, 1767),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214, 1809),
(62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218, 593),
(63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818, 20),
(64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222, 503),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226, 240),
(66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232, 291),
(67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233, 372),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231, 251),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238, 500),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234, 298),
(71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242, 679),
(72, 'FI', 'FINLAND', 'Finland', 'FIN', 246, 358),
(73, 'FR', 'FRANCE', 'France', 'FRA', 250, 33),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254, 594),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258, 689),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL, 0),
(77, 'GA', 'GABON', 'Gabon', 'GAB', 266, 241),
(78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270, 220),
(79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268, 995),
(80, 'DE', 'GERMANY', 'Germany', 'DEU', 276, 49),
(81, 'GH', 'GHANA', 'Ghana', 'GHA', 288, 233),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292, 350),
(83, 'GR', 'GREECE', 'Greece', 'GRC', 300, 30),
(84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304, 299),
(85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308, 1473),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312, 590),
(87, 'GU', 'GUAM', 'Guam', 'GUM', 316, 1671),
(88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320, 502),
(89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324, 224),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624, 245),
(91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328, 592),
(92, 'HT', 'HAITI', 'Haiti', 'HTI', 332, 509),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL, 0),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336, 39),
(95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340, 504),
(96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344, 852),
(97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348, 36),
(98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352, 354),
(99, 'IN', 'INDIA', 'India', 'IND', 356, 91),
(100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360, 62),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364, 98),
(102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368, 964),
(103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372, 353),
(104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376, 972),
(105, 'IT', 'ITALY', 'Italy', 'ITA', 380, 39),
(106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388, 1876),
(107, 'JP', 'JAPAN', 'Japan', 'JPN', 392, 81),
(108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400, 962),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398, 7),
(110, 'KE', 'KENYA', 'Kenya', 'KEN', 404, 254),
(111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296, 686),
(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF', 'Korea, Democratic People\'s Republic of', 'PRK', 408, 850),
(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410, 82),
(114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414, 965),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417, 996),
(116, 'LA', 'LAO PEOPLE\'S DEMOCRATIC REPUBLIC', 'Lao People\'s Democratic Republic', 'LAO', 418, 856),
(117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428, 371),
(118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422, 961),
(119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426, 266),
(120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430, 231),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434, 218),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438, 423),
(123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440, 370),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442, 352),
(125, 'MO', 'MACAO', 'Macao', 'MAC', 446, 853),
(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807, 389),
(127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450, 261),
(128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454, 265),
(129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458, 60),
(130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462, 960),
(131, 'ML', 'MALI', 'Mali', 'MLI', 466, 223),
(132, 'MT', 'MALTA', 'Malta', 'MLT', 470, 356),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584, 692),
(134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474, 596),
(135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478, 222),
(136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480, 230),
(137, 'YT', 'MAYOTTE', 'Mayotte', NULL, NULL, 269),
(138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484, 52),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583, 691),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498, 373),
(141, 'MC', 'MONACO', 'Monaco', 'MCO', 492, 377),
(142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496, 976),
(143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500, 1664),
(144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504, 212),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508, 258),
(146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104, 95),
(147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516, 264),
(148, 'NR', 'NAURU', 'Nauru', 'NRU', 520, 674),
(149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524, 977),
(150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528, 31),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530, 599),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540, 687),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554, 64),
(154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558, 505),
(155, 'NE', 'NIGER', 'Niger', 'NER', 562, 227),
(156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566, 234),
(157, 'NU', 'NIUE', 'Niue', 'NIU', 570, 683),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574, 672),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580, 1670),
(160, 'NO', 'NORWAY', 'Norway', 'NOR', 578, 47),
(161, 'OM', 'OMAN', 'Oman', 'OMN', 512, 968),
(162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586, 92),
(163, 'PW', 'PALAU', 'Palau', 'PLW', 585, 680),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL, 970),
(165, 'PA', 'PANAMA', 'Panama', 'PAN', 591, 507),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598, 675),
(167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600, 595),
(168, 'PE', 'PERU', 'Peru', 'PER', 604, 51),
(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608, 63),
(170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612, 0),
(171, 'PL', 'POLAND', 'Poland', 'POL', 616, 48),
(172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620, 351),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630, 1787),
(174, 'QA', 'QATAR', 'Qatar', 'QAT', 634, 974),
(175, 'RE', 'REUNION', 'Reunion', 'REU', 638, 262),
(176, 'RO', 'ROMANIA', 'Romania', 'ROM', 642, 40),
(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643, 70),
(178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646, 250),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654, 290),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659, 1869),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662, 1758),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666, 508),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670, 1784),
(184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882, 684),
(185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674, 378),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678, 239),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682, 966),
(188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686, 221),
(189, 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL, 381),
(190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690, 248),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694, 232),
(192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702, 65),
(193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703, 421),
(194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705, 386),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90, 677),
(196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706, 252),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710, 27),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL, 0),
(199, 'ES', 'SPAIN', 'Spain', 'ESP', 724, 34),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144, 94),
(201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736, 249),
(202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740, 597),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744, 47),
(204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748, 268),
(205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752, 46),
(206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756, 41),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760, 963),
(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158, 886),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762, 992),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834, 255),
(211, 'TH', 'THAILAND', 'Thailand', 'THA', 764, 66),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL, 670),
(213, 'TG', 'TOGO', 'Togo', 'TGO', 768, 228),
(214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772, 690),
(215, 'TO', 'TONGA', 'Tonga', 'TON', 776, 676),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780, 1868),
(217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788, 216),
(218, 'TR', 'TURKEY', 'Turkey', 'TUR', 792, 90),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795, 7370),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796, 1649),
(221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798, 688),
(222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800, 256),
(223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804, 380),
(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784, 971),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826, 44),
(226, 'US', 'UNITED STATES', 'United States', 'USA', 840, 1),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL, 1),
(228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858, 598),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860, 998),
(230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548, 678),
(231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862, 58),
(232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', 704, 84),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92, 1284),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850, 1340),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876, 681),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732, 212),
(237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887, 967),
(238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894, 260),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716, 263);

-- --------------------------------------------------------

--
-- Table structure for table `tms_currency`
--

CREATE TABLE `tms_currency` (
  `currency_id` int(11) NOT NULL,
  `country_name` varchar(255) NOT NULL,
  `currency_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `currency_name` varchar(50) NOT NULL,
  `c_current` varchar(255) NOT NULL,
  `c_default` varchar(255) NOT NULL,
  `rate` float NOT NULL,
  `current_curency_rate` float NOT NULL,
  `default_front` int(11) NOT NULL,
  `currency_front` int(11) NOT NULL,
  `date` varchar(255) NOT NULL,
  `ob_exchange_rate_auto` int(11) NOT NULL DEFAULT '1',
  `is_active` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_currency`
--

INSERT INTO `tms_currency` (`currency_id`, `country_name`, `currency_code`, `currency_name`, `c_current`, `c_default`, `rate`, `current_curency_rate`, `default_front`, `currency_front`, `date`, `ob_exchange_rate_auto`, `is_active`, `created_date`, `updated_date`) VALUES
(1, 'EUR', 'EUR,€', 'European Union (Euro)', '', '', 0, 0, 1, 0, '17.06.2016', 1, 1, '2016-06-17 16:14:17', '2016-06-20 12:02:13'),
(17, 'BGN', 'BGN,лв', 'Bulgarian Lev', '', '', 0, 1.9558, 0, 0, '', 1, 1, '2018-04-02 14:41:08', '2022-11-09 13:12:15'),
(18, 'GBP', 'GBP,£', 'British Pound', '', '', 0, 0.89453, 0, 0, '', 1, 1, '2018-04-17 16:56:43', '2019-01-01 11:57:38'),
(19, 'NOK', 'NOK,kr', 'Norwegian Kroner', '', '', 0, 9.9483, 0, 0, '', 1, 1, '2018-05-04 18:30:43', '2019-01-01 11:44:37'),
(22, 'USD', 'USD,$', 'US Dollar', '', '', 0, 1.1891, 0, 0, '', 1, 0, '2019-01-01 12:10:35', '2021-06-22 14:14:55'),
(23, 'CAD', 'CAD,$', 'Canadian Dollar', '', '', 0, 1.3568, 0, 0, '', 1, 0, '2022-10-27 11:25:04', '2022-10-27 11:25:04');

-- --------------------------------------------------------

--
-- Table structure for table `tms_customer`
--

CREATE TABLE `tms_customer` (
  `c_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `client` int(11) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `indirect_customer` int(11) NOT NULL,
  `project_coordinator` varchar(255) NOT NULL,
  `project_manager` varchar(255) NOT NULL,
  `QA_specialist` varchar(255) NOT NULL,
  `sub_pm` int(11) NOT NULL DEFAULT '0',
  `sub_pc` int(11) NOT NULL DEFAULT '0',
  `sub_qa` int(11) NOT NULL DEFAULT '0',
  `memo` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_customer`
--

INSERT INTO `tms_customer` (`c_id`, `order_id`, `client`, `contact`, `indirect_customer`, `project_coordinator`, `project_manager`, `QA_specialist`, `sub_pm`, `sub_pc`, `sub_qa`, `memo`, `created_date`, `modified_date`) VALUES
(1, 3, 4, '2', 1, '2', '1', '3', 7, 0, 0, '', '2022-11-01 14:18:00', '2022-12-06 18:30:23'),
(2, 10, 4, '2', 1, '2', '1', '3', 0, 0, 0, '', '2022-11-03 10:28:30', '2022-11-03 10:29:05'),
(3, 11, 4, '2', 1, '2', '1', '3', 0, 0, 0, '', '2022-11-03 10:34:20', '2022-11-03 10:34:35'),
(4, 12, 4, '2', 1, '2', '1', '3', 0, 0, 0, '', '2022-11-03 10:47:45', '2022-11-03 18:01:25'),
(5, 20, 4, '2', 1, '2', '1', '3', 0, 0, 0, '', '2022-11-03 18:07:32', '2022-11-03 18:07:32'),
(6, 21, 4, '2', 1, '2', '1', '3', 0, 0, 0, '', '2022-11-03 18:11:02', '2022-11-03 18:11:02'),
(7, 24, 2, '3', 3, '2', '1', '3', 0, 0, 0, '', '2022-11-03 21:02:45', '2022-11-03 21:02:45'),
(8, 25, 2, '3', 3, '2', '1', '3', 0, 0, 0, '', '2022-11-03 21:10:39', '2022-11-03 21:10:39'),
(9, 27, 5, '4', 3, '2', '1', '3', 0, 0, 0, '', '2022-11-03 21:58:05', '2022-11-03 21:58:05'),
(10, 29, 5, '4', 3, '2', '1', '3', 0, 0, 0, '', '2022-11-04 16:28:21', '2022-11-04 16:31:10'),
(11, 31, 3, '5', 3, '2', '1', '3', 0, 0, 0, '', '2022-11-04 16:40:56', '2022-11-04 16:40:56'),
(12, 33, 3, '6', 3, '2', '1', '3', 0, 0, 0, '', '2022-11-04 16:48:54', '2022-11-04 16:48:54'),
(13, 36, 4, '2', 1, '2', '1', '3', 0, 0, 0, '', '2022-11-07 15:20:08', '2022-11-07 15:26:55'),
(14, 37, 5, '4', 3, '2', '1', '3', 0, 0, 0, '', '2022-11-08 13:44:35', '2022-11-08 13:44:35'),
(15, 38, 5, '4', 4, '2', '1', '3', 0, 0, 0, '', '2022-11-08 13:49:03', '2022-11-08 13:49:03'),
(16, 39, 4, '2', 1, '2', '1', '3', 0, 0, 0, '', '2022-11-08 14:37:24', '2022-11-08 14:37:24'),
(17, 40, 4, '2', 1, '2', '1', '3', 0, 0, 0, '', '2022-11-08 14:44:55', '2022-11-08 14:44:55'),
(18, 41, 4, '2', 1, '2', '1', '3', 0, 0, 0, '', '2022-11-08 15:08:27', '2022-12-05 14:56:30'),
(19, 43, 4, '2', 1, '2', '1', '3', 0, 0, 0, '', '2022-11-08 17:07:53', '2022-11-09 11:11:34'),
(20, 46, 3, '8', 5, '2', '1', '3', 0, 0, 0, '', '2022-11-08 18:03:14', '2022-11-08 18:03:14'),
(21, 49, 8, '9', 3, '2', '1', '3', 0, 0, 0, '', '2022-11-10 16:00:49', '2022-11-10 16:00:49'),
(22, 51, 3, '8', 6, '2', '1', '3', 0, 0, 0, '', '2022-11-10 16:36:38', '2022-11-10 16:36:38'),
(23, 55, 9, '10', 7, '2', '7', '3', 0, 0, 0, '', '2022-11-11 16:23:15', '2022-11-23 10:20:06'),
(25, 57, 4, '2', 1, '2', '1', '3', 0, 0, 0, '', '2022-11-14 14:26:32', '2022-11-14 14:26:32'),
(26, 59, 5, '4', 8, '2', '1', '3', 0, 0, 0, '', '2022-11-16 16:27:00', '2022-11-16 16:27:00'),
(27, 61, 5, '11', 9, '2', '1', '3', 0, 0, 0, '', '2022-11-16 16:34:45', '2022-11-16 16:34:45'),
(28, 62, 10, '12', 3, '2', '1', '3', 0, 0, 0, '', '2022-11-16 16:50:32', '2022-11-16 16:50:32'),
(29, 63, 11, '13', 3, '2', '1', '3', 0, 0, 0, '', '2022-11-16 17:01:14', '2022-11-16 17:01:14'),
(30, 64, 3, '14', 10, '2', '1', '3', 0, 0, 0, '', '2022-11-16 17:05:58', '2022-11-16 17:05:58'),
(31, 66, 4, '2', 1, '2', '1', '3', 0, 0, 0, '', '2022-11-16 20:54:14', '2022-11-16 20:54:14'),
(32, 67, 4, '2', 1, '2', '1', '3', 0, 0, 0, '', '2022-11-16 21:00:23', '2022-11-16 21:00:23'),
(33, 72, 12, '15', 3, '2', '7', '3', 1, 0, 0, '', '2022-11-18 00:52:04', '2022-11-22 13:45:17'),
(34, 74, 3, '8', 6, '2', '7', '3', 0, 0, 0, '', '2022-11-18 23:52:34', '2022-11-18 23:52:34'),
(35, 76, 3, '17', 5, '2', '7', '3', 0, 0, 0, '', '2022-11-18 23:57:30', '2022-11-18 23:57:30'),
(36, 80, 4, '2', 1, '2', '1', '3', 0, 0, 0, '', '2022-11-24 15:03:37', '2022-11-30 18:13:22'),
(37, 83, 5, '4', 8, '2', '1', '3', 0, 0, 0, '', '2022-12-01 16:00:46', '2022-12-01 16:00:46'),
(38, 84, 5, '4', 8, '2', '1', '3', 0, 0, 0, '', '2022-12-01 16:09:32', '2022-12-01 16:09:32'),
(39, 86, 11, '13', 11, '2', '1', '3', 0, 0, 0, '', '2022-12-01 16:28:38', '2022-12-01 16:28:38'),
(40, 87, 14, '18', 12, '2', '1', '3', 0, 0, 0, '', '2022-12-01 17:14:43', '2022-12-01 17:14:43'),
(41, 88, 5, '4', 8, '2', '1', '3', 0, 0, 0, '', '2022-12-01 17:51:12', '2022-12-01 17:51:12'),
(42, 89, 14, '18', 13, '2', '1', '3', 0, 0, 0, '', '2022-12-01 18:07:37', '2022-12-01 18:07:37'),
(43, 91, 14, '18', 14, '2', '1', '3', 0, 0, 0, '', '2022-12-01 19:18:12', '2022-12-01 19:18:12'),
(44, 92, 15, '19', 3, '2', '1', '3', 0, 0, 0, '', '2022-12-01 19:47:42', '2022-12-01 19:47:42'),
(45, 93, 16, '20', 3, '2', '1', '3', 0, 0, 0, '', '2022-12-01 20:04:55', '2022-12-01 20:04:55'),
(46, 94, 11, '13', 11, '2', '1', '3', 0, 0, 0, '', '2022-12-01 20:16:19', '2022-12-01 20:16:19'),
(47, 95, 5, '4', 8, '2', '1', '3', 0, 0, 0, '', '2022-12-01 20:25:23', '2022-12-01 20:25:23'),
(48, 96, 3, '5', 3, '2', '1', '3', 0, 0, 0, '', '2022-12-01 20:40:59', '2022-12-01 20:40:59'),
(49, 97, 3, '5', 5, '2', '1', '3', 0, 0, 0, '', '2022-12-01 20:46:05', '2022-12-01 20:46:05'),
(50, 98, 3, '8', 15, '2', '1', '3', 0, 0, 0, '', '2022-12-01 20:50:59', '2022-12-01 20:50:59'),
(51, 99, 3, '17', 5, '2', '1', '3', 0, 0, 0, '', '2022-12-01 22:03:26', '2022-12-01 22:03:26'),
(52, 101, 3, '21', 15, '2', '1', '3', 0, 0, 0, '', '2022-12-01 22:12:41', '2022-12-01 22:12:41'),
(53, 102, 3, '17', 5, '2', '1', '3', 0, 0, 0, '', '2022-12-01 22:20:08', '2022-12-01 22:20:08'),
(54, 104, 3, '5', 15, '2', '1', '3', 0, 0, 0, '', '2022-12-01 22:42:17', '2022-12-01 22:42:17'),
(55, 105, 3, '17', 5, '2', '1', '3', 0, 0, 0, '', '2022-12-01 23:00:41', '2022-12-01 23:00:41'),
(56, 106, 5, '4', 8, '2', '1', '3', 0, 0, 0, '', '2022-12-02 14:28:29', '2022-12-02 14:28:29'),
(57, 107, 3, '8', 6, '2', '1', '3', 0, 0, 0, '', '2022-12-02 14:36:22', '2022-12-02 14:36:22'),
(58, 108, 3, '8', 15, '2', '1', '3', 0, 0, 0, '', '2022-12-02 14:46:05', '2022-12-02 14:46:05'),
(59, 109, 3, '22', 16, '2', '1', '3', 0, 0, 0, '', '2022-12-02 14:53:38', '2022-12-02 14:53:38'),
(61, 111, 17, '23', 3, '2', '1', '3', 0, 0, 0, '', '2022-12-05 20:45:52', '2022-12-05 20:45:52'),
(62, 112, 3, '24', 17, '2', '1', '3', 0, 0, 0, '', '2022-12-05 20:59:27', '2022-12-05 20:59:27'),
(63, 113, 3, '21', 3, '2', '1', '3', 0, 0, 0, '', '2022-12-05 21:25:41', '2022-12-05 21:25:41'),
(64, 114, 11, '13', 11, '2', '1', '3', 0, 0, 0, '', '2022-12-05 21:29:03', '2022-12-05 21:29:03'),
(65, 116, 14, '18', 13, '2', '1', '3', 0, 0, 0, '', '2022-12-06 17:29:20', '2022-12-06 17:29:20'),
(66, 117, 16, '20', 3, '2', '1', '3', 0, 0, 0, '', '2022-12-06 17:40:43', '2022-12-06 17:40:43'),
(67, 118, 17, '23', 3, '2', '1', '3', 0, 0, 0, '', '2022-12-07 21:18:49', '2022-12-07 21:18:49'),
(68, 120, 18, '25', 18, '2', '1', '3', 0, 0, 0, '', '2022-12-07 21:25:22', '2022-12-07 21:25:22'),
(69, 125, 14, '18', 12, '14', '1', '3', 0, 0, 0, '', '2022-12-12 17:39:39', '2022-12-12 17:39:39'),
(70, 126, 14, '18', 19, '14', '1', '3', 0, 0, 0, '', '2022-12-12 17:46:06', '2022-12-12 17:46:06'),
(71, 127, 14, '18', 19, '14', '1', '3', 0, 0, 0, '', '2022-12-12 17:54:41', '2022-12-12 17:54:41'),
(72, 128, 18, '25', 3, '14', '1', '3', 0, 0, 0, '', '2022-12-12 17:59:51', '2022-12-12 17:59:51'),
(73, 129, 14, '18', 13, '14', '1', '3', 0, 0, 0, '', '2022-12-12 18:02:45', '2022-12-12 18:02:45');

-- --------------------------------------------------------

--
-- Table structure for table `tms_customer_group`
--

CREATE TABLE `tms_customer_group` (
  `group_id` int(11) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL COMMENT 'active="1",inactive="0"',
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tms_customer_price_list`
--

CREATE TABLE `tms_customer_price_list` (
  `price_list_id` int(11) NOT NULL,
  `price_id` int(11) NOT NULL,
  `resource_id` int(111) NOT NULL,
  `price_name` varchar(255) NOT NULL,
  `price_currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `calculation_basis` varchar(255) NOT NULL,
  `rounding_proc` varchar(255) NOT NULL,
  `min_price_item` varchar(255) NOT NULL,
  `specialization` varchar(255) NOT NULL,
  `price_language` longtext NOT NULL,
  `price_basis` longtext NOT NULL,
  `memo` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_customer_price_list`
--

INSERT INTO `tms_customer_price_list` (`price_list_id`, `price_id`, `resource_id`, `price_name`, `price_currency`, `calculation_basis`, `rounding_proc`, `min_price_item`, `specialization`, `price_language`, `price_basis`, `memo`, `created_date`, `modified_date`) VALUES
(1, 2, 4, 'Linguist Kanhasoft | ENG>NOR | Automotive', 'USD,$', '', '', '7', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79', '[{\"languagePrice\":\"Czech > Czech\"},{\"languagePrice\":\"English (US) > Norwegian (nynorsk)\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"0.45\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 50-74% Match\",\"basePrice\":\"0.60\",\"standardTime\":\"\",\"childPriceId\":\"2\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 75-84% Match\",\"basePrice\":\"0.80\",\"standardTime\":\"\",\"childPriceId\":\"3\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 85-94% Match\",\"basePrice\":\"0.90\",\"standardTime\":\"\",\"childPriceId\":\"4\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 100% Match\",\"basePrice\":\"0.80\",\"standardTime\":\"\",\"childPriceId\":\"6\",\"masterPriceId\":\"1\"}]', '', '2022-12-06 18:29:57', '2022-12-06 18:29:57'),
(2, 2, 4, 'Linguist Kanhasoft | ENG>NOR | Finance - Insurance', 'EUR,€', '', '', '2', '3,15,24', '[{\"languagePrice\":\"English (US) > Norwegian (bokmal)\"},{\"languagePrice\":\"English (UK) > Norwegian (nynorsk)\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"0.45\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 50-74% Match\",\"basePrice\":\"0.603\",\"standardTime\":\"\",\"childPriceId\":\"2\",\"masterPriceId\":\"1\"}]', '', '2022-11-09 15:46:19', '2022-11-09 15:46:19'),
(3, 1, 4, 'Kanhasoft Test | ENG>ENG | General', 'USD,$', '', '', '6', '4', '[{\"languagePrice\":\"English (UK) > English (US)\"}]', '[{\"baseQuentity\":\"10\",\"basePricecheck\":1,\"basePriceUnit\":\"Minimum Fee\",\"basePrice\":\"0.45\",\"standardTime\":\"\",\"childPriceId\":\"12\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"100\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"1.45\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"150\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 85-94% Match\",\"basePrice\":\"1.00\",\"standardTime\":\"\",\"childPriceId\":\"4\",\"masterPriceId\":\"1\"}]', '', '2022-11-21 11:40:37', '2022-11-21 11:40:37'),
(4, 2, 4, 'Linguist Kanhasoft | ENG>LIT | Finance - Accounting', 'EUR,€', '', '', '2', '3,12,23', '[{\"languagePrice\":\"English (UK) > Danish\"},{\"languagePrice\":\"English (US) > Lithuanian\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"1.00\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 50-74% Match\",\"basePrice\":\"0.60\",\"standardTime\":\"\",\"childPriceId\":\"2\",\"masterPriceId\":\"1\"}]', '', '2022-11-11 16:15:27', '2022-11-11 16:15:27'),
(5, 1, 4, 'Kanhasoft Test | GER>ENG | General - Arts and Culture', 'GBP,£', '', '', '5', '7', '[{\"languagePrice\":\"German > English (UK)\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"1\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"140\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 50-74% Match\",\"basePrice\":\"0.60\",\"standardTime\":\"\",\"childPriceId\":\"2\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Minimum Fee\",\"basePrice\":\"1\",\"standardTime\":\"\",\"childPriceId\":\"12\",\"masterPriceId\":\"1\"}]', '', '2022-11-21 16:51:26', '2022-11-21 16:51:26'),
(6, 1, 4, 'Kanhasoft Test | ENG>ENG | General - Arts and Culture', 'USD,$', '', '', '20', '7', '[{\"languagePrice\":\"English (UK) > English (US)\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Proofreading (New)\",\"basePrice\":\"1.00\",\"standardTime\":\"\",\"childPriceId\":\"14\",\"masterPriceId\":\"2\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 50-74% Match\",\"basePrice\":\"0.60\",\"standardTime\":\"\",\"childPriceId\":\"2\",\"masterPriceId\":\"1\"}]', '', '2022-11-21 12:20:29', '2022-11-21 12:20:29'),
(7, 1, 7, 'Kanaatest | ENG>ENG | General - Arts and Culture', 'USD,$', '', '', '70', '7', '[]', '[]', '', '2022-11-08 17:53:41', '2022-11-08 17:53:41'),
(8, 1, 7, 'Kanaatest |', 'USD,$', '', '', '5', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79', '[]', '[]', '', '2022-11-08 17:56:47', '2022-11-08 17:56:47'),
(9, 1, 7, 'Kanaatest | ENG>ENG | General - Arts and Culture', 'USD,$', '', '', '6', '7', '[{\"languagePrice\":\"English (US) > English (UK)\"}]', '[]', '', '2022-11-08 18:01:26', '2022-11-08 18:01:26'),
(10, 2, 9, 'Testkanhasoft Client | ENG>ENG | Finance', 'USD,$', '', '', '77', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79', '[{\"languagePrice\":\"English (UK) > English (US)\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 85-94% Match\",\"basePrice\":\"0.90\",\"standardTime\":\"\",\"childPriceId\":\"4\",\"masterPriceId\":\"1\"}]', '', '2022-11-09 17:57:18', '2022-11-09 17:57:18'),
(11, 2, 12, 'Kanhasoft Extres1111 | ENG>HIN | General - Arts and Culture', 'BGN,лв', '', '', '6', '7', '[{\"languagePrice\":\"English (US) > Hindi\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"1.00\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"}]', '', '2022-11-11 15:38:35', '2022-11-11 15:38:35'),
(12, 2, 4, 'Linguist Kanhasoft | EST>LAT | Finance - Accounting', 'CAD,$', '', '', '14', '2', '[{\"languagePrice\":\"Czech > German\"},{\"languagePrice\":\"Estonian > Latvian\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 95-99% Match\",\"basePrice\":\"3.00\",\"standardTime\":\"\",\"childPriceId\":\"5\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 85-94% Match\",\"basePrice\":\"2.00\",\"standardTime\":\"\",\"childPriceId\":\"4\",\"masterPriceId\":\"1\"}]', '', '2022-11-16 12:52:50', '2022-11-16 12:52:50'),
(13, 2, 12, 'tests | ENG>EST | Finance', 'EUR,€', '', '', '44', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79', '[{\"languagePrice\":\"English (US) > Estonian\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"1.00\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"}]', '', '2022-11-11 15:40:17', '2022-11-11 15:40:17'),
(14, 2, 12, 'Kanhasoft 1-01| ENG>E| Technical - Mathematical', 'USD,$', '', '', '7', '76,79', '[{\"languagePrice\":\"English (UK) > Estonian\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"1.00\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 50-74% Match\",\"basePrice\":\"0.60\",\"standardTime\":\"\",\"childPriceId\":\"2\",\"masterPriceId\":\"1\"}]', '', '2022-11-16 18:14:30', '2022-11-16 18:14:30'),
(15, 1, 9, 'Scorewarrior Limited | ENG>NOR | General', 'EUR,€', '', '', '', '36', '[{\"languagePrice\":\"English > Norwegian (bokmal)\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"0.11\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 75-84% Match\",\"basePrice\":\"0.085\",\"standardTime\":\"\",\"childPriceId\":\"3\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 85-94% Match\",\"basePrice\":\"0.075\",\"standardTime\":\"\",\"childPriceId\":\"4\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 95-99% Match\",\"basePrice\":\"0.05\",\"standardTime\":\"\",\"childPriceId\":\"5\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 100% Match\",\"basePrice\":\"0.011\",\"standardTime\":\"\",\"childPriceId\":\"6\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Hour(s) Translation\",\"basePrice\":\"45.00\",\"standardTime\":\"\",\"childPriceId\":\"11\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Hour(s) Proofreading\",\"basePrice\":\"45.00\",\"standardTime\":\"\",\"childPriceId\":\"22\",\"masterPriceId\":\"2\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Proofreading (New)\",\"basePrice\":\"0.045\",\"standardTime\":\"\",\"childPriceId\":\"14\",\"masterPriceId\":\"2\"}]', '', '2022-11-11 16:31:47', '2022-11-11 16:31:47'),
(16, 2, 10, 'Testkanha Points | ENG>ENG | General - Arts and Culture', 'USD,$', '', '', '600', '7,3,2', '[{\"languagePrice\":\"English (UK) > English (US)\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Project Price TRA\",\"basePrice\":\"1.00\",\"standardTime\":\"\",\"childPriceId\":\"13\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"0.60\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 50-74% Match\",\"basePrice\":\"1.00\",\"standardTime\":\"\",\"childPriceId\":\"2\",\"masterPriceId\":\"1\"}]', '', '2022-11-21 10:39:25', '2022-11-21 10:39:25'),
(17, 2, 4, 'Linguist Kanhasoft | ENG>ENG | Finance- Copy', 'USD,$', '', '', '7', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79', '[{\"languagePrice\":\"Czech > Czech\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"0.45\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"}]', '', '2022-11-16 13:15:17', '2022-11-16 13:15:17'),
(18, 2, 4, 'Linguist Kanhasoft | ENG>ENG | Finance- Copy', 'USD,$', '', '', '7', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79', '[{\"languagePrice\":\"Czech > Czech\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"0.45\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"}]', '', '2022-11-16 13:15:40', '2022-11-16 13:15:40'),
(19, 2, 12, 'Kanhasoft 1-01| ENG>E| Technical - Mathematical- Copy', 'USD,$', '', '', '7', '76,79', '[{\"languagePrice\":\"English (UK) > Estonian\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"1.00\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 50-74% Match\",\"basePrice\":\"0.60\",\"standardTime\":\"\",\"childPriceId\":\"2\",\"masterPriceId\":\"1\"}]', '', '2022-11-16 18:17:34', '2022-11-16 18:17:34'),
(20, 2, 12, 'KH_S | CZE>GER | Finance - Insurance', 'CAD,$', '', '', '10', '3,5', '[{\"languagePrice\":\"Czech > German\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 95-99% Match\",\"basePrice\":\"3.00\",\"standardTime\":\"\",\"childPriceId\":\"5\",\"masterPriceId\":\"1\"}]', '', '2022-11-16 18:53:49', '2022-11-16 18:53:49'),
(21, 2, 8, 'Marika Sundland Lehtimäki | ENG>EST | Finance', 'EUR,€', '', '', '5', '4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79', '[{\"languagePrice\":\"English > Estonian\"},{\"languagePrice\":\"English (US) > Norwegian (nynorsk)\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"0.05\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"}]', '', '2022-12-06 18:59:56', '2022-12-06 18:59:56'),
(22, 1, 12, 'Ingvild Test Client | ENG>NOR | ENG>NOR | ENG>NOR | ENG>NOR | Finance', 'EUR,€', '', '', '5', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79', '[{\"languagePrice\":\"English > Norwegian (bokmal)\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"0.11\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 95-99% Match\",\"basePrice\":\"0.03\",\"standardTime\":\"\",\"childPriceId\":\"5\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 85-94% Match\",\"basePrice\":\"0.05\",\"standardTime\":\"\",\"childPriceId\":\"4\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 100% Match\",\"basePrice\":\"0.02\",\"standardTime\":\"\",\"childPriceId\":\"6\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 50-74% Match\",\"basePrice\":\"0.11\",\"standardTime\":\"\",\"childPriceId\":\"2\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 75-84% Match\",\"basePrice\":\"0.09\",\"standardTime\":\"\",\"childPriceId\":\"3\",\"masterPriceId\":\"1\"}]', '', '2022-11-18 00:28:57', '2022-11-18 00:28:57'),
(23, 1, 13, 'Shivalik_kanhasoft | DAN>CZE | Finance - Insurance', 'EUR,€', '', '', '7', '3,6', '[{\"languagePrice\":\"Danish > Czech\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 95-99% Match\",\"basePrice\":\"3.00\",\"standardTime\":\"\",\"childPriceId\":\"5\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 75-84% Match\",\"basePrice\":\"0.80\",\"standardTime\":\"\",\"childPriceId\":\"3\",\"masterPriceId\":\"1\"}]', '', '2022-11-18 15:55:05', '2022-11-18 15:55:05'),
(24, 1, 4, 'Kanhasoft Test | DAN>EST | General - Agriculture', 'NOK,kr', '', '', '3', '6,13', '[{\"languagePrice\":\"Danish > Estonian\"},{\"languagePrice\":\"English (US) > Norwegian (nynorsk)\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"1.00\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 50-74% Match\",\"basePrice\":\"0.50\",\"standardTime\":\"\",\"childPriceId\":\"2\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Minimum Fee\",\"basePrice\":\"3.08\",\"standardTime\":\"\",\"childPriceId\":\"12\",\"masterPriceId\":\"1\"}]', '', '2022-12-01 10:43:08', '2022-12-01 10:43:08'),
(25, 1, 14, 'Lingsoft | ENG>NOR | Finance', 'EUR,€', '', '', '0', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79', '[{\"languagePrice\":\"English > Norwegian (bokmal)\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Hour(s) Proofreading\",\"basePrice\":\"40.00\",\"standardTime\":\"\",\"childPriceId\":\"22\",\"masterPriceId\":\"2\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"0.11\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 50-74% Match\",\"basePrice\":\"0.11\",\"standardTime\":\"\",\"childPriceId\":\"2\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 75-84% Match\",\"basePrice\":\"0.044\",\"standardTime\":\"\",\"childPriceId\":\"3\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 85-94% Match\",\"basePrice\":\"0.027\",\"standardTime\":\"\",\"childPriceId\":\"4\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 95-99% Match\",\"basePrice\":\"0.027\",\"standardTime\":\"\",\"childPriceId\":\"5\",\"masterPriceId\":\"1\"}]', '', '2022-12-01 18:04:43', '2022-12-01 18:04:43'),
(26, 1, 5, 'ICS Translate | ENG>NOR | Finance', 'GBP,£', '', '', '0', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79', '[{\"languagePrice\":\"English > Norwegian (bokmal)\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Proofreading (New)\",\"basePrice\":\"0.03\",\"standardTime\":\"\",\"childPriceId\":\"14\",\"masterPriceId\":\"2\"}]', '', '2022-12-01 17:47:18', '2022-12-01 17:47:18'),
(27, 1, 11, 'Intrawelt | ENG>NOR | Finance', 'EUR,€', '', '', '0', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79', '[{\"languagePrice\":\"English > Norwegian (bokmal)\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"0.11\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation Fuzzy Match\",\"basePrice\":\"0.06\",\"standardTime\":\"\",\"childPriceId\":\"9\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation Repetitions\",\"basePrice\":\"0.015\",\"standardTime\":\"\",\"childPriceId\":\"8\",\"masterPriceId\":\"1\"}]', '', '2022-12-05 21:31:34', '2022-12-05 21:31:34'),
(28, 1, 3, 'DATAWORDS DATASIA SARL | ENG>NOR | Finance', 'EUR,€', '', '', '0', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79', '[{\"languagePrice\":\"English > Norwegian (bokmal)\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Hour(s) Proofreading\",\"basePrice\":\"40.00\",\"standardTime\":\"\",\"childPriceId\":\"22\",\"masterPriceId\":\"2\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"0.10\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"}]', '', '2022-12-05 15:15:09', '2022-12-05 15:15:09'),
(29, 1, 17, 'Fasttranslator | ENG>NOR | Automotive', 'EUR,€', '', '', '0', '1,2,3,4,5,6,7,8,9,10,11,12,13,14', '[{\"languagePrice\":\"English > Norwegian (bokmal)\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"0.11\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"}]', '', '2022-12-05 20:48:36', '2022-12-05 20:48:36');

-- --------------------------------------------------------

--
-- Table structure for table `tms_dateformat`
--

CREATE TABLE `tms_dateformat` (
  `dateformat_id` int(11) NOT NULL,
  `dateformat` varchar(50) NOT NULL,
  `dateSeparator` varchar(15) NOT NULL,
  `select2_val` int(11) NOT NULL,
  `iUserId` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL COMMENT '0 for deactive, 1 for active',
  `updated_date` datetime NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_dateformat`
--

INSERT INTO `tms_dateformat` (`dateformat_id`, `dateformat`, `dateSeparator`, `select2_val`, `iUserId`, `is_active`, `updated_date`, `created_date`) VALUES
(8, 'YYYY/MM/DD', '/', 0, 1, 0, '2021-04-22 12:05:02', '2018-07-11 14:17:44'),
(16, 'DD/MM/YYYY', '.', 1, 1, 1, '2022-10-28 14:44:20', '2018-07-19 13:29:58');

-- --------------------------------------------------------

--
-- Table structure for table `tms_decimal_separator`
--

CREATE TABLE `tms_decimal_separator` (
  `separator_id` int(11) NOT NULL,
  `separatorChar` char(1) NOT NULL,
  `iUserId` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `updated_date` datetime NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_decimal_separator`
--

INSERT INTO `tms_decimal_separator` (`separator_id`, `separatorChar`, `iUserId`, `is_active`, `updated_date`, `created_date`) VALUES
(4, '.', 1, 0, '2021-10-22 13:58:52', '2018-07-19 12:16:28'),
(6, ',', 1, 1, '2021-10-22 13:59:01', '2018-09-28 14:25:33');

-- --------------------------------------------------------

--
-- Table structure for table `tms_directclientlogin`
--

CREATE TABLE `tms_directclientlogin` (
  `iClientId` int(11) NOT NULL,
  `iUserId` int(11) NOT NULL,
  `vEmail` varchar(255) NOT NULL,
  `vPassword` varchar(255) NOT NULL,
  `v_pass` varchar(255) NOT NULL,
  `vWebsite` varchar(255) NOT NULL,
  `vDescription` text NOT NULL,
  `dtCreatedDate` datetime NOT NULL,
  `dtUpdatedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_directclientlogin`
--

INSERT INTO `tms_directclientlogin` (`iClientId`, `iUserId`, `vEmail`, `vPassword`, `v_pass`, `vWebsite`, `vDescription`, `dtCreatedDate`, `dtUpdatedDate`) VALUES
(3, 2, 'marthe.kristoff@gmail.com', 'Vinter2022!', '03a9d12a7c64f9dc533847de7955ca0d', 'https://app.berba.com/translator/profile', '', '2022-10-26 21:08:07', '2022-10-26 21:08:07'),
(4, 3, 'marika.s.l@hotmail.no', 'DZRr39Flh#dr', '3002951a37228a2dc26bf6eb02389227', 'https://5100693.app.netsuite.com/app/login/secure/enterpriselogin.nl?c=5100693&redirect=%2Fapp%2Faccounting%2Ftransactions%2Ftransactionlist.nl%3Fsearchtype%3DTransaction%26Transaction_TYPE%3DPurchOrd%26searchid%3D1218%26whence%3D%26whence%3D&whence=', '', '2022-10-27 23:16:11', '2022-10-27 23:16:11'),
(7, 5, 'marthe.kristoff@gmail.com', 'Translation2022!', '9f1cb43f61f9d9430269d2cf79da2f1b', 'https://cms.ics-translate.com/', '', '2022-11-03 20:23:09', '2022-11-03 20:23:09'),
(8, 6, '-', '-', '336d5ebc5436534e61d16e63ddfca327', '', '', '2022-11-04 11:32:22', '2022-11-04 11:32:22'),
(9, 7, 'testkanha@yopmail.com', 'Admin@123', '0e7517141fb53f21ee439b355b5a1d0a', 'https://www.testkanha.com/', 'test', '2022-11-08 18:44:55', '2022-11-08 18:44:55'),
(10, 7, '-', '-', '336d5ebc5436534e61d16e63ddfca327', '', '', '2022-11-08 18:45:00', '2022-11-08 18:45:00'),
(11, 8, '-', '-', '336d5ebc5436534e61d16e63ddfca327', '', '', '2022-11-10 15:56:06', '2022-11-10 15:56:06'),
(12, 9, 'Marthe.kristoff', 'VDajp3p9Z$Vf', '178a6e3dcdd8430b7673820f8117fef5', 'https://scorewarrior.crowdin.com/u/', 'Crowdin', '2022-11-11 16:16:14', '2022-11-11 16:16:14'),
(13, 10, '-', '-', '336d5ebc5436534e61d16e63ddfca327', '', '', '2022-11-16 16:48:33', '2022-11-16 16:48:33'),
(14, 4, '-', '-', '336d5ebc5436534e61d16e63ddfca327', '', '', '2022-11-17 23:41:56', '2022-11-17 23:41:56'),
(16, 12, 'isundland', '7894562', '6ba3eacd392bf84867785d775bf3313a', 'www.isundland.no', 'Plunet', '2022-11-18 00:32:35', '2022-11-18 00:32:35'),
(17, 13, 'tresmay@yopmail.com', 'Admin@123', '0e7517141fb53f21ee439b355b5a1d0a', 'www.kanhasoft.com', 'this test is going to be successfull', '2022-11-18 15:55:45', '2022-11-18 15:55:45'),
(18, 13, '-', '-', '336d5ebc5436534e61d16e63ddfca327', '', '', '2022-11-18 15:55:49', '2022-11-18 15:55:49'),
(20, 15, '-', '-', '336d5ebc5436534e61d16e63ddfca327', '', '', '2022-12-01 19:46:43', '2022-12-01 19:46:43'),
(21, 16, '-', '-', '336d5ebc5436534e61d16e63ddfca327', '', '', '2022-12-01 20:03:36', '2022-12-01 20:03:36'),
(22, 17, '-', '-', '336d5ebc5436534e61d16e63ddfca327', '', '', '2022-12-05 20:44:06', '2022-12-05 20:44:06');

-- --------------------------------------------------------

--
-- Table structure for table `tms_directiory`
--

CREATE TABLE `tms_directiory` (
  `id` int(7) UNSIGNED NOT NULL,
  `par_id` int(7) UNSIGNED NOT NULL,
  `name` varchar(256) NOT NULL,
  `content` longblob NOT NULL,
  `size` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `mtime` int(10) UNSIGNED NOT NULL,
  `mime` varchar(256) NOT NULL DEFAULT 'unknown',
  `width` int(5) NOT NULL,
  `height` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tms_discussion`
--

CREATE TABLE `tms_discussion` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `iFkUserTypeId` int(11) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4,
  `file` varchar(255) NOT NULL,
  `fileURL` varchar(255) NOT NULL,
  `fileMimeType` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `pings` varchar(200) NOT NULL,
  `profileURL` varchar(255) NOT NULL,
  `profile_picture_url` varchar(255) NOT NULL,
  `created_by_admin` enum('false','true') DEFAULT NULL,
  `created_by_current_user` varchar(255) NOT NULL,
  `upvote_count` varchar(255) NOT NULL,
  `user_has_upvoted` varchar(255) NOT NULL,
  `read_id` varchar(100) NOT NULL,
  `job_id` int(11) NOT NULL DEFAULT '0',
  `created` varchar(255) NOT NULL,
  `modified` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_discussion`
--

INSERT INTO `tms_discussion` (`id`, `order_id`, `user_id`, `iFkUserTypeId`, `parent`, `content`, `file`, `fileURL`, `fileMimeType`, `fullname`, `pings`, `profileURL`, `profile_picture_url`, `created_by_admin`, `created_by_current_user`, `upvote_count`, `user_has_upvoted`, `read_id`, `job_id`, `created`, `modified`) VALUES
(1, 20, 1, 0, 0, 'test', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,4,', 0, '2022-11-03T12:41:12.953Z', '2022-11-03T12:41:12.953Z'),
(2, 24, 1, 0, 0, 'Test', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2022-11-03T15:35:30.686Z', '2022-11-03T15:35:30.686Z'),
(3, 2, 1, 0, 0, 'Hi', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2022-11-11T05:16:34.578Z', '2022-11-11T05:16:34.578Z'),
(4, 66, 1, 0, 0, 'test test', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,7,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,', 0, '2022-11-17T15:38:37.483Z', '2022-11-17T15:38:37.483Z'),
(5, 66, 7, 0, 0, 'Test test', '', '', '', 'Ingvild Sundland', '', '', 'uploads/profilePic/1667905481.png', NULL, 'true', '0', 'false', '7,1,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,', 0, '2022-11-17T15:39:14.697Z', '2022-11-17T15:39:14.697Z'),
(6, 66, 8, 0, 0, 'Marika', '', '', '', 'Marika Sundland Lehtimäki', '', '', 'uploads/profilePic/1667987635.jpg', NULL, 'true', '0', 'false', '8,1,', 42, '2022-11-17T16:46:43.992Z', '2022-11-17T16:46:43.992Z'),
(7, 3, 1, 0, 0, 'Hello\nNamaste 🙂', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2022-11-22T14:28:17.012Z', '2022-11-22T14:28:17.012Z'),
(8, 25, 2, 0, 0, 'Hi \nNamaste! 🙂', '', '', '', 'Anil Nadiya', '', '', 'uploads/profilePic/1667286682.jpg', NULL, 'true', '0', 'false', '2,1,', 0, '2022-11-23T04:37:50.307Z', '2022-11-23T04:37:50.307Z'),
(9, 25, 2, 0, 0, 'I am a project coordinator', '', '', '', 'Anil Nadiya', '', '', 'uploads/profilePic/1667286682.jpg', NULL, 'true', '0', 'false', '2,1,', 0, '2022-11-23T04:38:27.913Z', '2022-11-23T04:38:27.913Z'),
(10, 55, 2, 0, 0, 'Hey \nNamaste! 🙂', '', '', '', 'Anil Nadiya', '', '', 'uploads/profilePic/1667286682.jpg', NULL, 'true', '0', 'false', '2,7,', 0, '2022-11-23T04:51:25.859Z', '2022-11-23T04:51:25.859Z'),
(11, 55, 2, 0, 0, 'just testing message', '', '', '', 'Anil Nadiya', '', '', 'uploads/profilePic/1667286682.jpg', NULL, 'true', '0', 'false', '2,7,', 0, '2022-11-23T04:51:36.355Z', '2022-11-23T04:51:36.355Z'),
(12, 55, 7, 0, 0, 'I see it 🙂', '', '', '', 'Ingvild Sundland', '', '', 'uploads/profilePic/1667905481.png', NULL, 'true', '0', 'false', '7,', 0, '2022-11-24T17:55:02.816Z', '2022-11-24T17:55:02.816Z');

-- --------------------------------------------------------

--
-- Table structure for table `tms_email_sign`
--

CREATE TABLE `tms_email_sign` (
  `sign_id` int(11) NOT NULL,
  `sign_name` varchar(255) NOT NULL,
  `sign_detail` longblob NOT NULL,
  `sign_picture` varchar(255) NOT NULL,
  `sign_image` longblob NOT NULL,
  `is_active` int(11) NOT NULL COMMENT 'active="0",inactive="1"',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_email_sign`
--

INSERT INTO `tms_email_sign` (`sign_id`, `sign_name`, `sign_detail`, `sign_picture`, `sign_image`, `is_active`, `created`, `updated`) VALUES
(1, '', 0x3c6469763e3c7370616e3e426573742052656761726473202f2056656e6e6c69672068696c73656e3c2f7370616e3e3c2f6469763e3c6469763e266e6273703b3c2f6469763e3c6469763e3c7370616e207374796c653d22666f6e742d66616d696c793a207072697374696e613b20666f6e742d73697a653a206c617267653b20223e496e6776696c642053756e646c616e643c2f7370616e3e3c2f6469763e3c6469763e3c7370616e3e436f2d466f756e6465722026616d703b20427573696e65737320446576656c6f7065723c2f7370616e3e3c62723e3c7370616e3e3c6120687265663d226d61696c746f3a6973756e646c616e64406265636f6e6e65637465642e6e6f253230223e6973756e646c616e64406265636f6e6e65637465642e6e6f3c2f613e3c2f7370616e3e3c62723e3c7370616e3e536b7970653a206973756e646c616e64406265636f6e6e65637465642e6e6f3c2f7370616e3e3c2f6469763e3c6469763e3c7370616e3e4f66666963652050686f6e653a202b33353932203431323220343434202842756c67617269616e204f6666696365293c2f7370616e3e3c2f6469763e3c6469763e3c7370616e3e4d6f62696c653a202b343720393430203533203434363c2f7370616e3e3c2f6469763e3c6469763e3c7370616e3e5765623a203c6120687265663d22687474703a2f2f7777772e6265636f6e6e65637465642e6e6f20223e7777772e6265636f6e6e65637465642e6e6f3c2f613e3c2f7370616e3e3c2f6469763e3c6469763e3c7370616e3e3c696d6720636c6173733d2266722d6469622066722d647261676761626c652066722d66696c22207372633d22687474703a2f2f746d732e6b616e6861736f66746465762e636f6d2f75706c6f6164732f75706c6f61645f696d6167652f653539643139353461656639623365643161356533633463386534336137663038316366613965392e67696622207374796c653d2277696474683a2031353070783b223e3c2f7370616e3e3c7370616e3e536869706368656e736b692070726f686f6420426c76642e2031382c20536f66696120313131332c2042756c6761726961266e6273703b3c2f7370616e3e3c2f6469763e3c6469763e3c7370616e3e264f736c6173683b76726520536f6c266172696e673b73656e20392c2031343539204e65736f6464656e2c204e6f727761793c2f7370616e3e3c2f6469763e0a, '1541049277.gif', 0x646174613a696d6167652f6769663b6261736536342c52306c474f446c684251635641666341414f4d654a4f55734c65456d4a4f392f4775357a472b46594a4f3176632b7054566335515251435952676561534243625369696f59303230655536744e62536e49664342484f702f472f43474a764b534f2f474e4d3836464a72444c48362f4a4837504f4c4a58454b764f59522f4f655576536a576657715a2f613065665776634f4b4f5a736e635a71797056414267716752697241746e72686475736968327369795475466536694848476d41434e30674b4f30775350307775533141615130784f573168755a31795364325369663254795479793268326a536b3344756f3351436734774f683541796b354269703554477936524b6b7a552b5378555372336b6d7533334b6e3055793035464f79345675323430797634474f36354775393558472f356d4f6479337a46364854423533444b38466a423766474f6b6665376876617673652b686e3544537271546276666a466c2f692b6a746a6c6a2f765975506e4f714f54747374336e7049753332597a4d3634544936704c50374a72533770485738364c5737367a6138616259386250643872444f35627669394b3368397133617a66725679767a69792f3370324f2f307a38546c39637670393958732b4e33782b746674352f3330366554302b2b76322f4f37342b2f54362f662f2f2f2f372f2f2f332b2f7676392f66333539506273364d6a6b347575367437353466514141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414143483542414541414941414c414141414141464278554241416a2f4141454a484569776f4d474443424d71584d69776f634f4845434e4b6e4569786f73574c47444e71334d69786f38655049454f4b48456e79497834376465724d69634f796a307330614b62496c454a54696f71624e31506f624d437a41594f665142756f69464f79714e476a534a4d715863713071644f6e554b4e4b6e55713171745772574c4e713363713171396576594d4f4b4855737944386f364c46763267526c7a5a6b32634b6e547535416e3035344b3743684c6f3363753372392b2f6750756d6d454f32734f484469424d7258737934736550486b434e4c6e6b79357375584c6d422f714f5a7657355671594d71665574496c54626b2b666466486d446379367465765873463076514a4f35747533627548507233733237742b2f6677494d4c4830343554782b334e4f4761376c6d5867657259304b4e4c6e303564756f4970784c4e7233383639752f6676344d4f4c2f78395076727a594f436f5756462f5076723337393631706d353950763737392b2f6a7a36392f507637392f50464b6f42392b4142425a6f4947414c454f586667677732364f43444545596f34595155377164484367646d714f4747374457515234556768696a6969435357614f4b4a4b4b5a345542345963756a69697a41434a6f574b4e4e5a6f3434303435716a6a6a6a784770554b4d5141627034674a3139476a6b6b55676d71655353544459354878704352696c6c67544d366165575657476170355a5a63646c6d554851784d4b656159315332676835646f70716e6d6d6d79323665614950354970353579765966666d6e586a6d716565656650594a5752304330696e6f6f487331344f656869436171364b4b4d4e6970526e4952475371634352547071366157595a717270706a33714561696b6f4935704a36656b6c6d72717161696d436836556f625971706771717876387136367930316d717257433236716d7551444e7a7136362f41426976737342486c38656d75794c706f4237484d4e75767373394261326b6579314c3759523754595a717674747477794b55573134476f346172666b6c6d767575656a366c327534374d4a585a6272777869767676505475466d61372b4c6f486137333839757676767742336457792b42456558517341494a367a77776778725645664245453933634d4d5556327a78785148484562477543747a5633476c7935635441616f455a6976484a4b4b65734d725454626b786478777438334650494f49306d68557873655a6257484858596f5163654539557878634346726d7a30305866614d636362625a4178786864634b4b4845456b754941545453382b55425278746a5247334545442f594d454d4d4d4d44676767737778424344444450634141515252796a427852686d7748476d684b784b4372504d504e482f664e4e6f6f6558733073343933373156434136517a4a664a574466754f493935304147484732614d345955535278415264677775724f44353536422f3373586a33756e687868644c4643484443364733377672726e374d5177773948654745474851336d585a30435034477345317941347779547a697a7837444e77576c69517763434d6b2b373838784c616b666f5050397851677779637377443739713750414c3177634952786841327363322f2b2b6148484d455158625379376e2b37534e5943472b77757959594879696966512f50663839352b664565674c6f4f746334442f643047454d52704342414266497742666351416c742b4e4239344265624259794c5158664177503079304a6465466643444943515044426a4951414c6559513158534b454b56386a434b366a686854434d6f517a56734959613276434763736968446e6559777a333438496441394745652f3459347844754530434677344d494e744566434a6a4951426b4d59412f334d513848584d454242454172422f537a67414c353438496867444b4e77374f42454162706744524d5967427258794d59327576474e6349796a484f636f52776a59385935326c4941654b544142445779414178337777424f6f34454935534e426f645044434573764953424b2b49497054464538565733504643576e78666863673251494f4b635a4f6576493264576a6b2b567967415471613870536f544b557154516b42436d7a4141345355677845726c676379464b45466f73776c43563167424465515a354b42556343314a6d53464c584a784c7776517769655879557a4c68464b58734850424b71644a7a57706145343453324d41547269414868644768437a4741706a684a61494d76524a49374c59764e757952557a43316d5569384c7741416e6d306e5065694b476a4f4e734851797579662f5066766f546c5254344142613632533834484b467a2b55796f41474851426478354a3531574e4a79456b6d664d4c695a6741526249676a30337974477834464f686e74766e5030644b3070494f41414961654949615a676d764e7841426c79434e4b667063734153486267656972726c67684369365251356531414968364b685168366f56504d68304253493171564b58616b304b5047454e364a714445574236314b70797a77564b4f476477634d6f61426c794e516c6b77357633556731454c3749476f61453172564b69713042677739613177586155477148425762746c424365577a716c363542344d767a424d34476f504e4f6963555672463273617761566174694633735568494c557258474e7247546c4b41455051425662654168444f50664b576650566f413345436178724b425769776871546732554e4b6d4e58793971506a44436d4d7069736247664c52676a2f6445414e304872444454724c572f4f787741695641697873396b64597359355641666644514775587939794c6242616b736157746447664c6763734f5377393437613132755263444d675248744b33527159524d5731486b336f2b677a55327665686569774a6a4f594c72776e537745506f4465583733424274764e4c2f654d6f465863674a6331574b7751656265597543306d64723049547242416169445447735433775a47564142582b4b697338634347762b733177363254677939374d3454554c474e47414e3569414c567042775368654c33356a61674d497578697547724475724f6741424133622b4855762b454a7648755961346b37496673613951496e7670396f5547376d3175343370445344773469597246514a56594b6d71335044634731735a6445546f4c325a34334a703968516a49786c33414259683835452f69595134324c584e446171786b4a6a76352f38306b35554239542f554644462f357a6975774157467977325857444a5a43594462736d4947715a6a4843676345726349454e6a4e41464d734342776f5565676b782f49414534572f7166464d447471664b4142447837476e517865454e75375041612b587a5a7550647a774b4356572b676a356748524137514245526f4e68362b576d51677942554b6c4c38337261307267437161795178452b5465795167765932656e6a4e4d4b31796b7156523767786841454d586d4d43454a67684243447a6767524361774151777443473458776c305256666436694f4b77597979356f4b6a62593167414d61304342546f74627972435145716b496f4f4b793432735633675864766b34545542486b6d7a4a326347614575623274624f396735306b414d634f507a6845492b3478485041417961306764315a4558645079563175454f4c6169596f324168664d734f6630646a716d512f2b4939377858766b703761776f4f37645633735673676874734176434944663361307031317462504e6734513258754e4348547653694f33774858536835786c47747641776b742b4d677248496a595843444933774244737456676b794a6b456157657832564c722f554736517538302f54334462352b307541375341356e522b38357772665164434e547665363239336f4f6d42436d7132693851303633514b73686e722f3673444563624a4143613374676b794e305057764f33364f574244376138737538374e6e4a75312b73634850355837337a6e762b3835376677526d794967656d4b322b4c6776656647324a36624d5a3651615a484b4f586a5a7739484341433755572b59504f566c2f67497a4845595062532f34474d4441425954376641647966303050514d2f38356a7466364579513646524b7a2f5242577944312f544e445445653332692f4946416b626f4c332f2b4e306f41526b6a4b7665375437384c4f69775634452b7544576359667647726e58446b7a2f3375796e2b2b2f76662f65534649507972555a33723349325859527a706a45464f497431706849464e4c4548376a393442714e414631685368775148627070323877674856485151646d45416254566e2b63783339456c3338695749496d4b48464e674846504559414343476b466944546542314c6378316a6e686f4163414945342b41474a51676378643447374e77506742684a3155415a4c38414d7963494b6468336c39735878493249516c43415a5673516343754555542b494b5045344d4b4e594f4c525159793151556467494d346548743959676635356f5070427751716d42463651415a474d414e4f36486c4b7942644d2b495a30324877366f4852514959565461465a573644797642314a637746726146314e63384958784a5146383945636430414566344147432f2f51456b42694a6b4f69494876414248634142484c414245304142757a5a3746464346655a4948773261475a686949486145485838414464516948726a4748712f694b64386345564b47485577694b665169444d61566a713955474d75554648794262464e41425659414661694148746f6752655341486136414757454146487441424774434a764f594266584a79704f69444c3643424759454859374144734a69457266694e346b68334f30415665724348466a426e74336730574a6851596342617135654c4868425a45304146366f67556373434d4868434e634159423576636d3758694e467a674547674548716a694f64686548652b474b434e6d514436654e554a4548364869503636677941546c4f4e62646138516853597a4350634c5542782b675565614147564d414230766867484b416e6257426e41726c374c4c4233457a45474f75435164616551657347514e502b4a6b4c346e465863776b52585a4f426370546a764a5742757055474c7742484556646c65784231665141536335585a72324a6e4e676758676d4f7a637742456177424633414256377742562f6742567a51425575674f545867574d54576278584242546c5a6b2b47346c673435426c54686b7a2b4a4e417349557132335747386755325251425845566556797842315451654e4f566b6d2b6942306e6d6154425142456f77426d2b675a5168785a6d62674255545167315a326c784942426d354a647a615a41446770676a6d67417a75516264764762563041426d4677426d6267426d3877423269324e4a5844424549776b3238496c314d686c334e704e41634955714b32576e6b5a55325a414258333546586d4142594935572f37344a6b65415a79347742463777426d6c4945584d77426b5367652f6f46417937494547317766356b70644a765a6d5550336d6147706255332f514a716d695a7171795450502b52423530415a4d34493149434956546f5546547941613365545335715642347146613943564a75414a7877355a6643575156504b566e5532435a6b5548676142674e475141614f75593174674154553256734a4f424632344a3762535854644b5a72637867536c655a7170755a70316b4a346a6b51646e634a4250534258794b594430575a387255344d4b31614164745a384b39515a59454a78694951634f4f467353454a4a624d676352716c307338414e68414b4f6e61457349796c6b756b4a385030515558436e486771614833776872696452563463415957756e2f774b525570616e6f72797149707734554b31514b744a614d4a42516331436c646947425a33554156754a6c734169695a3438414d6139674a457748354c3851594878567449554245562b6f70504b7037553171486d755a70326748454e6b464e675551644e49494a5a2f786f56573870305865716c4a774f6d435155445979705463334146635a576d596e4546412f7057684a6b6d584a42684c574145454f6b55644c41455a6e6c554d414354447945477a6765614768716f35666d686331436f4748476f7266466e57344548544d422f7071696c657869706b6e6f786735685133734e615a4a7050644b4370634257565a4b45476e377055454d436a567749487138706252624362564445485238425768476752534842334f5641444e6b41444b4841434a654144534b4772666a59577636702f576767566a3470717846717346634f4c436e55446c78705464714147635157743064716d6b635770576f494868396c624d6f435756364662527a55442f776352516d423035556f444a3041434935437847737575523745754d6a4957655443787a79654c38546d732b486f792b707051514e4376437355436541437763505750593345464241745842662f614a582f59577978774245543646486a7742646b71546777374553597163545641417961677355713773556a6873582f4271313042423972356553517272504e35736868546c4f4e454243796255415330426e456c73324f426c4a49314156347942304672565445776c464762734f4b30736864527441366e41786137744861627352787246453772463144624659767166465872714874345946684c4d63734b545875717244466c7158495156785170466e6b676535483175453069616233314136363646586e514265417153693577716b5472704568377436524c41303372476e334c4657637773696736754956724d596572532f4f71574c4772537a45414349304c56395961466d70517330786c73465a79724a3246424e653546575a416c5534307536487263446151744b5262757166625a59564242367737465a636b67495437756773444279436c69377a70586f442f73416478566278683859755256515662386d713878514c655778687a5549614d56414d524b784771534c66506537386f67425351456868654a685a34494a764d317752556362326d6c3733616d7a427a4146495a2b6230675a514f416b4164774251474e4951652b713151647343553575316376734d43485951636678306773594a6b5677514d31344c7a3353376f6e6f4c2b7530623969636157664a38445736376f487a444230594a64646d302f38436767565046495334426a6d4331646d6d795632384b4d7935514a73697868346f48574d5a4151625151515965384c506d384a4873622b4177634a6834634b6542384e535163424d5a38417a444444506c464463796c69316d30732f49424454366b385534426777473845453243534b6836524872426866304c6b4246414e426142452b414d58334b3856475163562f5963566767635764703856527763576f357356662f2b777648355650537070575a53784b525341514b7264555164775978626c556c48736b644a4332494e56376b5545474c496b2b4849775265387a484b4b7a43306c735968487833516a44416536684d6935777765644379383474576b647849584173496d557853477641595a50757357474b4e567355433779675a5a75444a73454f514848484b714779334a71444b72434849587947336e76664b4d547946736a7a4c43484f6b756b52414e7a784f544177496b717455472f415962667857774a736b6444444b3231635a6261444d2b7053354665484d7a36793030547a464b32775931747835324c7a4673637a4e4365504f6a5853373453784f695a756a35767759655a44472f2f536d544b4c456572584c6c654547524f77367838775253584450646c734353504574725445785a4e485064386344734b7a4e416f3077387578454e6242637563784943586944544257716a662b6830457546766b355342797374546a5851733470683065637a7952367830527974744235394643444e4769493946695274647961647a514a3459696b4e4d42664e53476438304e4445665961345642663847423735566b39674a584673565a3962472b6933505446417a785a4231455764735354773061367831474c52314858333141413968564939316635533157556b31496f4c556c346745443973775a44686e3239317330756942386962554c527031736a4c416e4f7345554851316b6f4c3179467447434c4c66485a39794875593133724e4c3474645268544e7741716c69312b7456447234474d3536324535796e3155313272554263362b5475423878325a53647362663845556b644748496446706b4e6570734e46596873584a373932665153326b353042433464553752353269614632497742746a624c4748754151733334424a573469494445694235514256542f514979477042687547314e346245446a62514f35665247326664732b6e5247374452672b3968562f79337a6c434e576d56397a474c532f493355515453746f4a31572f4272465451765269357939714663554a5934414562514145375045636f315146556f4161376d7855764455326c66427432594c6b68396369536664735a6d3863693864352f456439654d642b6756393953305535526e642f3851706d7975397767745a4f47725652682f526a694331633148685a725141564f5756496f70564c6b5378584a6156584d7a4274343441576441774e322b684662344f456a6f4e59654d5155395a68676d2f6e6b6f4868557166743873376a427551415a6845445649634152475141524759415248734152633841566b34415a51666839345541634552775a694d415a684d415a695141617043516534716855756e6b76425368356159775a6934415664454f5a6c54755a482f3441455865414664504e6f62464c68546e52734d3235534f6434594e2f35574f4e3056643641475439444c4a695542485841464577345664724454755a536b77444548586743364874486b487337684879486c7255486966687572564a486c544966665739345164744147586d41454e73445872364e6f52444279375a3064654141485a4e4146526d4345424e30364c794144507942795a4144725339486e6f68545934494548627a4147536741454d6d4448334e4d434d6c4145537841477248346c6b4e354575336d6d533158706a4148422f396b56636c41466e67355845764142416c7356726931542f513068726e37623651345373733461744d3456566535354f6e44726e623372446d45485a4c41454e794475547351434e58414544426f656455414753764144706835414d41414558574147787734534d35425137617364623841465179447354385363413938646576384142783349425576774e554251505465773832397a4246337742585554354265783769536b6761744e3435427836622b72465a764f4151302b5752714142554b66464778325644465138765952384a5139786952523843566a4750484b66446e4138464e595a4e714242335477426d3751426d7a764275653535795a69422b2f48396d32676d6e4251422b6e6447335477425558773857586b416b44774253442b47336a67426b717753444c31416a2f41425679504643656654786b3948486867426b694137654d30413072512b4d517842324b6742454d67413934385534754737694242394179305a306450365a42523445776c746c42784231647737394e46415852464658524138654f5538674476354a6f66456c3450474638457238386e6f6b69423636686d396f542f426c2b41424f442b374373513756657042474867426c68764868766642555151374b45664f7a442f55414e416341547146764f5a6f5164694d41544f6e3141765541526b4d50575834515a4c734e384a4a514e4b734f524638666a6a46506e4138515a4b41502b584478426436414169574e44675159514a4653356b324e44685134687a7768435273634c695259775a4e5736384b4f4d494754305149623768574e496b527a73453151786732644c6c53356778597a34525764506d545a45725a65376b4b565043485a7842613936354d71486e5561524a5a564c416b6b666f55345665546b366c326a456b564b785a74573631755758455637426878593739366f6172517a514a314b356c713562425762674f6d65436757396675586278307239374a73326550484d4272424b7368724f624b3453745946474f685573574167514f52447868776f73616d4651755a4e572f4f48434c755a3941493333677034714b71795259316a49534245397231613631327943437077654a302f306b59503553307551726264383035536d4c634a6e3437687344667958485734544b6a2b504f714e62674d2f4630522b736b76797255487a53506d78335877476c3851616250642f454d3458577a59446b385668704532654c4b5362472f534b5343645376577a3948442b4e5a623941687841412f3857556b4d4441524e556b4b554a726969776f4276717179714d42797373734179794d737977764e2f5361757644742f7a6a79792f41354242736a63494d513277784b6c723849345555524a42785268706e724f42474843754951414949494669517051494145484a4949514f495169544d4f4650534d77736664454d4a357954556141596c7a4772795371487347474d4930365445794955687771674453396665494f49464c2b747a59596b3579457a7544534f36544c4d3946347977307255383545787a4354663973384d4c362b59453777637a2b76794e4469357345502b5571687138534f6b702b685a396f614131666a797150304f6838734453533747556f774d664f5255567151376b4b4a414f396862464b4962654d6e55564b7777316c425573446e337a38454f3247436a7878425152533079784668757234676c695066446767773836364941445a6a665951414d4e4a70435741676f6b3444485555624d564d414169757931676a5965535648497a4a736e5534773079764f6a6930632f71384b494756616563377457673647676a6a43344b4461304e4976534d647a777a354b4e584b44694d61434865384e5963632b437432696769565951484a634f314e6c534e67563247502f747a75496976752b484f6a4c46794938364f54344a6858614569465253476775545146695a4d51345949775a6466637444434f3743516f476165583549414336444d2b364c6b466269512b57694859703156566e336a79754f4b4a7a707756674d526347332f6134476573395a6151514b363756594150787a53596c7a4f796932776a6e75564b454b4767792f79346a4d346a7643335a42654f6141317067764b41677777756a4c6742686c58764f3075504d42516c47714d617868416337345471514b4c7477352b44675976464758666f4453416962382b4769543872496c3467327251634b7a454331667732466f6134652f53487a506a75644e79346146556b6c65654d6f5757745932626449446d7735526b435579755559344f74742b5967654f302b373967466a48632f57756d6c4d79776a72707770674b6b4371396e43756e6a7575393870534b2b4a444a756873636e577a4f7a6b356a444469794e2b344c696b496542795977694954322f68434f726f5056634d4a59616f41553254764f4573647544432b32433367686c30626e64342b414c6744766963476f444d6551615a4178487139304469334b42575773474445694c572f774962414b454949795268435531345168536d63416865714e794433764136444e374742624b6259454c4d594c6759626b514743715264764752516b44316f37514d314c41675674725942433131685a393772475155736f7877377a47315252794169307141587662464d37797a446b776e3273716557375446526a4e3454515069474a4142774c61523835724d412b6a36446837333137572f4573514658334a43354846724542563451474a62733449597739453847467a774a443646435141666d38516572593977624970524834724141436333625852363449455649556956316f6f4e4b486353417730794768304957306f4d534142684b526b6e516557395148696f7a4d67524f5071523261617042516537677535634e6b5968334d49725771504367505878676a466d44514257433568737945453241565a515a4762436f49533175525136396a496b5876786a475966396d733266674d794d41416e424d684b7a526647374d7976363651495161595049305038784b42516b5a77787377306a78304d4d4d586b4f432b6435356d6c4644425178674d434d6b394d6934505854696c4b366b79413156617a6733774d6d6878584e434646694c45445630347768474d59415169444145494e78686b5138505442517374314b4e55655146454a32694878343055497a41595177395664514f444c4a466e48616a694662594776414c4a675762616e4f6b6566724f456b7347556d54497a777a4f6c783556703873536132634d6d54353071717135315530676755434d624f314e4f51505a76427043546b417636474251374b4547644f5953424956387a423737354c5a46534d6870553267424b567736426b76536177794e564f705557744856307065547158616c69673167654241353239537462483453484c765331734272355166347352345a2f2b74582f43484d565462782b454e4f73306253476561426d7a7a68514944565937366b3830774479584d50516947566e714346726731484a456b327335494634537630694745643757303578303477434d4b3142736d44564e6d49467368467a3745334d594c7147736b4376727245442f5242477853775a495a2b5a7245466758305747745334576670526c324276677174325431474232424b46445a4d46376e5832615a773477504f3947597244426f396e42434f32315341336b6d5a425a65716b49426845747a7a356277796f553732626d7751497563547571436651324c716a7132417357746c714774646131596f457456414c636b36566172616b48356e42536f69705641796a6b7431596c5a3033776b4e31464a665168656c6a4364464770424e68776f57503744596f626b44765347437a7a5652313063587674697a63786a4a572b474945765154773435504130625474752f7a41766b6c6677417455657a513152476e494d564679512f456f7066675870374d762b367a77314750686c4649696f623667673567356269674a704249305953725a6c4344504d44524d5779786130736759307579544475464a416d7632636c444a4b5651412b52636949325668696b6542427942495341303767384e323777746731586568594c572b4342793455314b387875432b5a6d75746b6b31685a5a6e70414171696e6f6d4f44514e7255564f6d3062384b673656566252416c6648646758594e3165467a523649566d576b42454d73744f61665a6c3163756876316e35706e69663875575a72446b32704f3562654f4c2f714458514f6935327a3067476b37506c4466565a3274324f69577a4d364953474748696457324b73716b4e706b4449747536484c6a596f594730396f68644d446a6557565158437a4e416257787a6f674c7a4a71704f707962337864687766396355547a776b724267764c4470494d4931516f534639306b50522b41334339366d4546375842376f456d61312f6e5a665572556d41304d7135773661387253316d663062566157724267364d74625771447864705177584f32613675576b2b65634a522f755a674847445678456934545345534e435465534c5a42596f4753353675505763577130514d7a53357344386f7377756c7a75385836507056634b4379777a7553454474346e53713330303465356974326a425168346c69714132466a6a51523541794c6a37654654515470654d79537962673164376c6b56746c4e796e614f637a567868657363752b2f4b427753486d58356e3555345270383573485075645348644c6743554a75736d45414b2f434f57423148306e583677734336584848376f7636646b44776f6f63655264704d6244753531466b4337396139484f4a774e4d6e6530437a5535646d676c32692f2f38675075576b6a66597064725a56556c61594a774947743574357753755366793753526238746c4b4d467771316a46334939355163316a3843426f666c44336b2b5358612f6c414570743974626c4765716764684133413166306a467a736b465654664946396a7431782f4558537448526c693647314c5856574f42496975514e72692f57474f426c6a49554d7a4241554d732b514c672b332b4f496f7473396759744149466737712f4f3947334135755973582f774d45624f735a356b4f615058674338644f5759314d4f497a712f624e47416b644d4b716569594b394f2b4b3647443776732b6e414351704969416d30734138324e4250774f3338504535396e4f2f724667354c30453173434f43675973797545696d694c45396863417566704d424446534f416f7a416a576942303373514d6d42415545736f4e3950436a554143436952446a5267432b6a75504e3769362f3169727274754c6c34736a694d666a6d5247556d614c776e676c597737676f4d43444d6c6734414a3677344f3453424166326a77537570672b344c417178517668337377522f38517734545171384a674d70705036743650366741716f695250594f774d59534441513763696a7059766642674a3456495056505572672f30447a634151367762774149686736627a4f686949714b46427734786f786444516733725478597367676b4d306a7a5a4577787a44736e687851704d6a4c6152526737766a6e6748376a53733451556e6344357259436954554d6b523846547459524b6a5941356b36436836387555697378747669755735366f6f4c4152446253784b6541777564614346767a4f75534469333162464262414e3449415149647a675648556a6a656750544b45415355736b4155455268704469426745526f7477774c6a41677946675349326f78776542417a634d5266384f63594e345361396c72426b43795a696e655562754554626657494e774e4d63666759426f66496f38365a6735334d592b79514e766649723851497078724b3179524d6d6e436a537075735a314e454b73594443453862794473414d6d4644742f2f41794b6935682f6f304b786f306a746d494f4c314d4a3773354173424d61584e41675a6b3869693859326c35457143383854746f494d6230384b7341345178694265744177547034356b4a594a673165494a693878344a5544445841446d643542514a734c796767494f536d55475972424153574c776b67496f56664d53627134433876433265374b62312b386c4d314971795a4c6e6d65515051637a686531496f773642694b564558666734486759363537424d735675494572684932416c4d69434a4969686b306948504976574a45324c65414841684130377945613059774868694263657572436538594158784a4c2f50626743442b41374a7349436b6e504578655155446542446878684468486d423077784d2f796742776f534b4546534b486c544d35585371394a4f7141796a43794d794b694977594a5673334c5977423537774a334b735033514d454f7168416838764b3338694433704e4e697a42442f79424c695552466849684e594d7a4d73784344565578506666774e504c68502f4a77544a54764d6e704541443767437539534f4f316744714e45416169776544684445312f444e377251556e78514b414630556f71524f4e37484f6d43764d70774132704e6a4f442b557053765157385778487264684b684a4530557450464c6d524a5743794f463367554a6b5044456b304f546c78516a456a413762684e72747734684c4252686f544b73336944487458413959774c2f6a4e5351646b6742395561434b4141446e67434b7267434e5a43444b73574a4f35414477366943443943412f354e304b677159554e414973327943414133344144443146537851557a5a314b6768517836416778486a784e52507445784f3454714734677a6274435156497a4266567068676c6b67435955664e7878366667764b45454248354551796e63697449546c496d5a523131635464644953797a396b71647a6a614f5579433530556d43737533615a54507755304e635967774974316473414752326355776d6767416e594141376f674138776c69656f67696f496c735534566d42706b53633446716e524141724955473371552b55674e6a474367413267416a5867777a78516779706755536161674f433043666c4d452f6f6356417370314a6a7a676164776d663159314e72697a6b59646f3063396f344f51412b4379414b306f785968686765454378682b4e433264374c6b42465179674e44536d315659793467544b745562426b486e6b45532f3138534158463068615152662b446e564b4550516c55793956343754446b564937733542344b7141493462596934544e546943644762674655765554707a5064664655316568714a54395741424737646962676742726f5a5a35485a4c4673566667326771577a566a6951464b75324579697259385a324c3352504a77592b49456a3649497643494d7843414e31556173636b7458506149503449384f4554416a6f5a4568426a5174576a52775873414569554149766f4e6f782b41497551494b31715656426b594851484b436d545672775943534f78646e62556c6e59324675746d51436777596f396f414b554a53612b68496738364e6f30476232584c5a415469466d61444243626656644a6a41444d7a5a45637152484f465946684c6459574f565a664b5977544b524535384973573867504b4535495842467172577469464b452b384259384a6a4e4c5a62593954505975424c5a6e33474150484e516a2f504867444c766742755a575346784456425a744b73584e436849424168717a6473334144786c5756467667424c6e4144507151444d544143675979596949574e336233643634676c6d2b4a6233506f414472334c773057357764324b456f54575553464a6b66444c6950477178385753794533587961335a6d78575148746c5a58705557614845575a766c5659413157447943577a77336478526864776a69524e53675276394344764b6a67436d594330464464315733646535334f687868523854304e5134534c504b6a464544364a636f304c6543795a466867434d344264544f3043355a3054473444685335745953474942474a43424772694247374342475969423653574f466a68516771426669647a55724c43447930535947664143493259495053414449436a65396d43423274534b4651346c463469424772434248363642474d445950484b35386a5866702f6f412f78742b69704474475167417a73395941322f566d705745434f6456465575373379624a5832716a676633566a3872394969746f594d52496b644946444e524e332b334941517475354c7241344d394967395546414e50616733734e3136414932784f2b316269343230303243535747692f49696d686334677438564363495a326b564a346250497852793267535077416a4f41677a4c44412f587841694e6f34744d347649566f7953534f69362f736d427367673245634365654b6e42702b6a547159346672566a5446776733386b727a623467694f6f446533436d444e47593233794145554f6a5778756f6a6f2b697a7a6f794b325a67473565434531654643445134797668597a704467543957696b444f6e6a3677484231775a45647541744351354e586c41344f775a4f44435a4a786f5431654b6753465167693851417a49514136745641694d41676f374b49565a2b697639555861775775494659486f4f466274737551494968734145793970495252745753595145697946326230494e4c696878526449303543476b7065513879714675466d414d76494e37696d47694336465174584f657a4d414d724c67345a574d7573634150636e42506d6a59754b5069415a324130505067673643494d694d4f464d57707961314f5a715463486b344b776a4b6c6d75304a6e752b646961634f56415a65636d515948464f344634546f7035747070365a707837786d634c317564496e6d522f42714a4c316f6f535869776234414c6b4e5167374d494d757549476772672f6f33516f516271673645594f3668614d774d414a6d4670532f7a6f6f745668555a63466d746d494e663742676d6a59764e5068324157654f446d414d5a506f30574f4758573545706531676f393047575755774b61767253564a7071574267314c685a303673566962514252567871442f466a694971386271377047416349614e4c61305a447844746d77677437746c446d306a734e4e46617330344f476b6a727455614b747359564e4c4363485a44727564376e53523438506268587236344a5438366b75706e73686141444c334274685048507255686e67374b424d496a74673841444d7a67543242484c324f6a7439706973304d413071766153466b42706f554461413349424a5542743776414f71766a6168594344496661363163364b4b3758734c495955393536546769326e44592b5868347069376869444430397734425a754d6471413876344d4f56686654764537375669447565775a7359614959466156704a3775376641423635355a797232353757616337766275764b4472754f426e796875384f7944767256687156496f424c6f686d45784f44383159564b552b5a6b574b42497442746b5a69446c4971633734574c43786355462b4476733269442f2b37316b735065436a754962433935675357346371324145784d6d366f55596379313854367941677746766a2b4a376a552b6a4778455855646870675467506a54786f4946646947594f675752517648676967676e4e3244584c576c6b672f443272646d6f3855435363584644765863653367385a685461782f66447759416375346d386949486a54575935445134434362584375694f6f636d78373465774a4a676d44737947697230324b434449634e726861565770634b37676334515274642f6775704a576235776f557330704167626e436a6f6f62593241676164754134622b41692f774169376f3969373464694f6f63676c68415264346763492b6a62456c543454527a574c6d436a7749574f3964734677766a6839673971796767303748494c4b6a6c4563766e676c49334e2f6f48574d7245426b76486a3931694d2f4f556c41764546476e4e684e34436b64504376384f4f505861436e4b3847584a56747773685948565868335867576e47496b4f3859556e426272346b333847384a30656d674b48484e7351457546777250354633516b4e31466b514544507773364f477244686f73336d5043562b5854594942793436764355475664474b34673873414d366d414d3463494d32574769333759496c4f4149694b49496245474d476e49466f742b4e317a2f48586d4855766359464276346b625878342b5567347853484f6e50596949372f6561365143422f6f314b7a785959427930583578544e6767686854384b4639342b4770374f4846777032545172676f666776736e696b3459474d7634754e6a2b4f4f4e77674d414334323241714e7a435354336e71686f414e786c354c4f31676f635071415943494e3268776f764f50666247507562614150544e346b615148323471414f6444342f54506775614a356f6677487a51344a65446751482f317a657832673937356461444f6f43444e3267444d784344747556324c766832575835716838434432482b4f466a426135536a6252534636522b747a4c35454259442b4c52344d6b2b42353874332b5a445a6a30317842346e74476441766e6d6d734570694e6a3839734439766a2b4c76352b777741384b38652b55427269354b514149514149484569786f3843444368416f5846755342347948456942496e3475444238434a435067413263757a494d55314244425a476b6977356b6733476933565773477a703869584d6d444a6e78717a524a69584f6733526b304f7a70382b57506e4269502f4378716447614c4a5861454d675845355368556d4465624b7677523965674d4f6c533344717854343270554a46774c756d45423969774c4a586e477368553452776d5a7467667277446a624d366a6376417a463250584a596f78656f563336466f5778564b3452776c422f2f39514a6a4e4e4f4563574b617853554d2b4179357379614e33507537506b7a364e4369523550325045474f59357850537250657344593155772b735a772b676b704b6e5a4a714e596650753752746a6b68484368784d76626e78456961325752304e4133534142394f6a536f552f357a647368786577544c61625736504537414a4145525a6f736a314a753364786e5858445259313367477866715a3870772f48512b324274763367736b676c396d474947313856394c4d637a4248304a7a784543675334624a425153444d72305149494956476b5455663064594f425965587a48347859594659526a68436943324255634c4a4c356b78477368416f4c48694372535a454e6c744e6c3449343435366a674142566545754963454f334a4741576f754772544842454b616c6c4a364a4c5a6f4a4a525247685463635655616c78785665354457675544505466646c6456493268662b64646d5657424a73633448336e52306a6c6d5a655844544c3264414d634674354859677450746b57476e44533534415565466461786f4970644247595667533773463655623870464934566875394d6d53433261497956385942487078615570384d6169456c486b674769474e6263576f34684b42526f6e484570504b564f704179796b354b3632316c765a426b51685359657341454b6a4271554271514d41725a6d7467354769454c5143376249685557766e73434352737065566f50674c69355a665368636e7352554b5961535a336a753268706b64736a75656d536565314e5953724c2f3270616f56367a43446a675871393065354c644961597159704736445567675378594b7559584b74367737715175544d5574624759514b4162444363564a34424477516b6b486f524736775259644c2f5335424c4249344f76537751544a53697a4b4b63387141525636396e622f52354b325073487442796e5066424779444c6f514d632b39425145743043366e6c4d646f45727947626262515364477a5174352b713132346759314c4c6b666d446b51657569666c316572494e5379367234774c7932584879437530304958464665614257345241364d557567595a79436e65456458494668316c794b73793059354c2b4a7a625444684d34773246696d70453367324b4e4e5a696352715339616d4a6c347a555174537062666a6d4f452f78716e52713854724148743349455365774547486c4d34733538713937577a30412f3631355464347a47775542494a373330366755352f5452464f384357423955635164466d316c724c5654432b527851656f68345a4d7768785945314f4767506747337168496d567934553367443439664c50312f636d386c73707774444a78375733376a5a3766716b6633337774655852733567444e376a6c49667a455259682f335355656f7a6172747349556a6e4d456243416f6f47414230446e6d773777796c72635767334b63715551784445494275693749464e6135376f714c55386f7777714e625153536771524a4233635962414c7673754f37314e77686542735a33726d4b5a77463173595650727071516d4c67576f5530465a6d4b542b6f46576f6b53484645556f426c736a45417a7142617a7252576747584c45442b4349454b5178795258337a36534450747663664c6a434c446c47637a2f6d61596b50735966465364574362713470516b4145617349317531497a6d65724f4844394b4b646847544178317446554b46354546474671516949426d69775130614a34684e79614e6e4e676549455a4a516159424559516f6e73734c55754241414d4c7961444765594679763673586f75416c6945784a63584345334b434c435430762f2b30774c37435555505831534d695a615668336c464b50392b517547586a45415679436f5369482f6355674b42624f424c4b4e324a5149716a43743069424150326353732b2b4272434774386f7a576e324367753877514b76464d6b7742684b4c537776706f34705374387478466d514c684b795345706b79757339415149474c624b516a71516a4a53455a6b6b6f344a674173764b5243735a53304c655a6e443947774a4a547a6b447a2f487a4d763863736e4b445345765172735a6936667763344f4651696d69424f4969565734674a79414d6b35774c3461526b6c4b55362f5032484252766a56764d6956422b71644578464c49684c7a3341354b57674b6b4a6f3264654d543770416144746a4b6a6a793741736f6f6f4e4f4655444252486a3071494d783554754d7755796a7239417746434d4c495270727767764f6b35304e30774274384269384b424c6c444a69336754376e6b6f616a30613671552f424d68496a67476d484c2f3069576e344b4169744461466c504d7861635477674562385445346f576952524441794a564a7941556a33695a4e6f59352b4f766942587a50774a4e43524e4a644643654a564e4f624b337054544e4c774135306c436c34744a5544493561487039624b57417335586249475330366c4c7055346a30304a42554b7a41616e434d7746565252385473426f5272634b477131547a4b7558434f6c61354650512f696d4a5751776d6b7873416b4e304b4c58565a7831584e5372677a78507a526c624c4c4b654248476b5568677168564b5958507a52373556566a49766f43756e3670417a2f5043514b526f6c3051784f32544f36754f71796c4e4d7366692f4841586532425a753145697266754d6b726179356b7651535337336376794e72574375653147496b74614c777045425855566757417a4b317548354b4472626f5175414a6867334431346b4d477662535a4a4f71722f3177537936416249506853355a32504a34555332666c4d6c3248565a56415963654968456d6b6f775954397a3368375a6763444b2b61354558747862713662457a7159396134315a7070465a57526667624178763161754651633669784d427a2b706d544e735673547a4145434c6a3536452b52742b4347657a67693854734d3249654349586861574571596a6a444f4e42795533784c4c6963514a4173687a6f76374974526a5a756b4274662b423153624469563470755a56424d4f584b652b6544596f616c636a357778596c6356525144375a3735494f47566a4248354e6f615372766c53555a34504443694b6b4f5a6d36494b56646d3430727978725733316771474d5a7261314d7937544f4555734444486e6c664e4c5a6164563567634845695446473275795a4e302b347768653238304e614c42633971346e50413748436e78464449676378624d662f795a35654150394b496c45753639547a676435576d50776677444274786e786c536d4d664e6d794d4347342b6f576161577564544d694562476a2b6c526b69676b57686d31623242694449794d694371504f754635386a4c584f45317251444d4e34557253514b32526b6830352f507665514f72444d596544724c5a4842706d41794c4f6a5a777a427575635955365035514175744c5a41516842574c6568466833476a72456f64517a5a6c736a784b39346f5175376369552f464b6d316b2f5435537144664a7153585038497656577a3070376c6764673232574b504976306636782b455432514f5463597657424353595277696a4f38374c4d684d466641544b735035493630744a4c6751627a4e6f4a413376654d664630346674714b426b525045354352452b51573741473063434659764c6738657a5050417a367a5250432f634c616d776c32567a2f4e78624c2f31574c4d39327a69442f7251736c332b704265463637727068464938514f6c33647933526679394e78456e5765665673774c426836787963396e73686435765870695548536d7a6548302f304834796377752f4e6c49514e645534576d74304d363376524d72744166422b764e537a7a5350332f33525447472b6d2f767562437079596643467a38766871515a7a454d39634c36794765732f6362652f555a4677786e41635731516b547936626749663567515466546f442b666f4e4e6252557157766b476f6d47513445644d306d6e704d5773514d6e62344a6851482b52337468304b6b77794b414a52504252457752517741524d67415a6f77415a7341416477514165455941643841416d5749416d4b4941647367415a4d4141564941434c4e32756473785232343359356f45394e73414d727345554c595659544d48774179432f563958426c734251364342736e355864494148767141776542462f353563684e2b65585674595755446a795957353563612b4d637756536b61513559586367564850664b46362b4b4251484a31367349447352597a6e3463656c585551442f7365542f654241434f426b3849332b4b516135755a34794363585363574850396378664356714e454a41456145414865454156594d4556714d4561794d456534466c4f35494563724945615941455665454148544d414c32685462556355613841702f4d51337938597244485153537a5563657975476c424b477844534656464f466e644b4a4153454674705141674d5347306b523558514b4761474942414b4e3455566d4662724237543657454670635964356762646f64494f6359583631654871764b4636544e6c464a474e75494b417130694668674676456d4e3766724936344d5567614a6b516569423568744345476e614a3654434167564743745141414855494561774a3252334d4561585039424658414144627152382b4545554e574b424f514f6b71434d4c434a4532424549364b6d696d4a4442335932414b7a62464b48704751644969504e6b69466547696e656e69567641696550676949506a5a46467142586f44554166614d47654a4846387046774f48484d6b614a4f684c47417a4c4653344a46516d49586779416151785161696543665167724546746f46546e494c37765546432f776870326765676353685170426b627243415267614f6a4c446a4a78494c424652424b444b4c50564c42426d77694156484156574945424e464b3666434e484641426842484c62436d454e4f4c486376556b70375242517a346b5530526b5a3067594946426b49316b6b426d466b686d31635533446b6433696b7a49566b754555494e6e4a4b4f414a5a6168796b6572516b6c44426d6273536b554c54665758776433357966654f454555784b6457784c455435354655444c2f792b4f7848766f305757377748304e67706d51635a753651464938567846547943736d524a52566758787556596b7251705a436b4a6266735153563667415a777056677578445069427a64325a7054413564334a7056446f356d62594a5636536b4635655542674d6e6c4b324257423668432b434a47486d78556f774347754b43564b695a4770455947503244506c6f53726f5269505578546278645555716f706d5459586b392b5a6e34777a557865525143706a683259706d52594a6b4f595a32363833775852486e35494a6372677075716f515163494a38704167504842566b2b4a79523349515356575151646f77466c3235554c5970324b34514e49687033573451554e4b35706146686b2f645a533043306868594a3277596741735a674234736e67794a5a46376f6757464b5852476c786c704b686d4d6153592f43306c59516f3252634a37505967526559493245382f36564143476875474b6b636a7070454d63316553555a4e636f7362574f4e38346f5357396b554c6a4f4d4662575a7549427a457955776772514758595935645973516354576946564b6761584d456c63734145374b4d42426152434447577769616955764546446273465770436c6e704768304a6b3044414e495a444e36504367574d426f3842594e73556a6f534e356f5842765676502b436468564a376a526369696873686f7a67635a347352374b6f5954636b6f65764d4558444947534b7361503971466931412b66416f49434b6b5957636b742f2f6763364c6773646b4d455330424b4a554b4e433142393448685642695631426c476d744b436a365849477957593676354552735274785874735565554b4b63506b45486249416d4c7477775a5a714b35466973576f696633683267556b584e6745614b546b467448536f564a537130676174634e4372564845436b6b762f45704d7246716f4a466549714a37796c47362b58467150706f7a3379716568446f5255416d59594270694e42424734534245684342446552726276436b516c426d583179704b73726e5764517173346970586153696b646a424735414246786a42443168734d56354559754948674f3453776c72707353596f4f6533427557494f62324c45502f595550563745486b78696e4672694532436968746f7077303272514e79716970686f7550494848507a70567453735a3979737573495475324b5147517765764c6146764a4a4c416453727041594779756f723030687356507a72385842717a7753735971426d546e54705752676c624f4442484a694277304b732f616d4977524945306849493237716c7874346e7a3067707978704a4862694247484442455a77737073704961434b456e6849476c46365134434a6b516553736d586f55466a686f72646a67517667587230442f77415a3477424e5577524f556274423677416545594171756f41734f3332775972554345376355757259764d67644e5368577941687453754b7942644c62536477597536554e643637623232525a566534396779434145477871777159397047434d5869784e316552616b47686837414164313251654c4b514c2b577a516f6f725546344c4746556238622b78373547436345715271343642683751676546367752494d6751314d723673734c304d3037346547714f70344b2b5553684f556d4b314a646765624f79706f75524257344c674a7278733453684e737152755053376d2f51776530325265352b6871384e784e5132557456655542734d4876436d7874617179664457612f4779685269755a76495379484661496472796a4e6f53526e732b426f4f416a467a6f775277593768636f775245557766777572766643424d6747344936476133483278666c437952726d2f305a67795558377667486463674553454d454e634f38504834576d7175577744706273586758432f532b744b4373674366446c4e45644b51473043752b3443443051534778636b517242334e6d51516245554665385946433051476b3941476f343862654842653345456537454850686a42346a48436b6c7642594e4c445939677a3952735544633455324371774c5230674d7038524a7a7363516d494632355945647a414563764945626d49455968414558644545554134454e7941445a566a464e724b39422f4b31642f42397946724664484c475275477066794d41587749483334494564304d4563654849626b454559654545584b494552444d454e7a41414d564b6f716730564b4a73544c3967554e4939564b59683542654f376c4970586171517759473453676e72485a77533467424b6c307558474632414563623056594c736c416f4546744d51416737544730546639424674527a466d6942466c69425075397a4350537a502f737a42675330514a6448425169763131714149554e614676504d496b4d467877356a4339736b6757537430386d494338414152734f41433767414d7a657a69724279515a427a583443304b723577496b664d386337484332533052727641432f69775232636d526c547a61617157534e7346776d457a414b76574e39754b784445454c494b7a3845484178523345355061674f534f494871517a5661787a5a34796c514c677a504d477a6864794248674379484d674247327a315674767a5065507a50764f7a507739654178783070425a30384154415153663056746a794c444e4e517838464c6563456b546f767a38677959585171516542765450653158557a7a516b527a582f5374573661764566644d4b76753159732f4559533345694e475961764531595344634e752f30594f334268714a4d50794b456251722f64646c4264554a554d6f454161314c7a4268347764564d634d476941746c5133456c554c6846583362465a7a645666624d7a376e6331686277542f76746b415074466d6a5377615139572b48465670546a566f5437364573644d544574564873353739454e4d506764563945726b4b5939474a6664302b513945446b35316c5139773861396c743349336150393155384d38614a6f326f39626c39515932562f63594c704e4c4555704549307132637658496f696842353039482b5962576e7a42676e6358524a736857702f526c514e52427a5531674c34396e41764f494d484e37536c41494d5854334754697741637444433242512b6d3748497a5346732b3939796c6e385a51785532544e346d7a524241586846766242666d71496e696678567876794d715775497a447842556e52474958786e66784c3335513434426e383244645157667a697356645247625839367a702f3242432b43714a4d476c2f6a30554a415068577450646d464c6841314546744b5543455a2f6d434f376964516269574537514c56626a584470644b4b6a66446244465577484c3651446533534c64642b4f56424f4f6d4d79336a654473526a6e324562313932495134567a473932632f2f6c4c4e444a423441464d5834583948745865376e68424f4c56374a3567585a784f5247376e5a52536843634c66384e666c7650506e4842546856534c6c6d344f6c414c454274586343586c33716b636e6d4765626d706a38534571346d593179734e7451564e6f3344506f506c526b445a62694b3964364c574675504a5a774c6c42724447676c37686a4b6a6d7130613642456b61664c347436442f746934377042664f642f504451353358685255434f6a64356d50355547522b336843454b326b3339544e4b6b534c4a786d6d2b34594a334a305052486c6f674c70414d4542745a662f41717339373171433662716e3671726336654c7836704f34654d706b3574396936555541374c3330347a2f6736574443355156693673337430433842745376737273762f4873674e4c58546338646f4e7651635234626e513455676e3874526645484676326432563772597737516f4237754650545a682f4578632b484338447475546446756e2f63756c4d466647384742425445564a4751764e4d37304a63454267776576707536766e384876346356426a6747777938473034443854324473566f69325855634d776c4d76566377367869383274523845315076456f59746f657170487858504b49322b395976756c6a6b396a676b55385966796647546436676948723533615779712f3847393233517452426f6350777a4d504743616a37567553385a7579383973475441775339346c76414252413930422b39527952394a6f554130774d3873376a3937446f473155502f63674a4779496f725249616a2f5856726645463866552b734d484c4b2b566d552f615763766568374e4f6f6a784f5a50646f4b6473474c385830384c535465503077786144756361524c666a50545552435534594f344e492f643954526544622f4f434c787357314e676b6c2f75494466654d2f2b4f4e5830706858507664517151536d78757a6e645578467950656c5249712f76766536674d4b57506f5045766c734b746e37796a496561762f6547717578332f33665a2f74735868484d71796534444243434241776b574e48675159554b464378467947504151596b534a45796c57484943464951574c477a6c32395067525a4569524879576f59566951794171564b316d3264506b53706b6f59656b375774486b545a3036644f33476547504554614643685130665134416e6f69736338424f4d6b63506f5571744d464671685774586f566131617457376c3276596f442f3278597357504a676b33684661335743674459746e58624e6d31564f556354446f6c35462b2f4b4833543532707952467a424d4a48305076676c3875475562776f73526a6b4838654555646e6a386756375a3847584e6d764631757874416363775a6a30614e3347766e734567687030574a4f7433623957724d4d6d6a554e77315a70524856756e44567371787853304f46496b45393046372f35525068493467736e4a48662b484872303542545735507a532b79555a34397535632f644a465078516f7a7954647478546b45465539517269746e662f2f6d714f7376504c6e6f5750647531622f5141757841326832713765397572754b4e353647347930326e70546a4d4364574d504f4470364b77493743436d3272596261615a4d424f686759393543736c32464c37384359794c447752526378594d4f4d6d425748446a6354744e757974694949326b4d366935574c6b4476384c48446e696743454e6642795379434a42366d43756e4f4249386263646e587a796f4f2f436d334945464934716a36507a434570425066557975412f4d4d4c4f536a3734797a524b54712f7a326336752f744c5141454c73426f567a49514e7557554d304e43686d634d3645486534747770774254484a5451753243414136652f656f4f427a30594a4376473145523074794978434c6232554a6335755772493349695a6c7a4c50654a42564953434d6630764854786451775653494e474c71523156686c68513443446b7a694b56514c5836416a3156364c6f34464b4b6b2b3430714d6b4235716979366763514a4e5a4d48737730307a376d7233716754586661744d72444c516362554942665358494275795577465050627758793037616c417357553355466863434f6e634874724151397a647854557456465472625464666930634679644f62645058337074637745372f332b5a59526256676e6553596451414a47416f4f346f6f746e676943435471676f6a7136494c575169345a4635676e59594d4d626c7164564f7a4a576f446f55535061705a6165644f61316e6f61565057706f74714e626174724474796f72637572564e7a6d2f6c7451336730664c45626b39665463547571492f396e626f314778444e69544c73356869355158786249336a534e716765757a55587674427044757875344e6f6d4f7967734768434e466d5937707a3067686b4464684436346d4f39594a5a694141772b6f75474b4e7650734b4938555a36715762385952384d506e6b6f31546d69475742476f425a4b7030313338726d6d38744359664f64652f595a4c5177715a32786f324f447539576a594e46573658484f66747132466f343467472f664c584f67695135793866673365786f744c2f57747a586377642b63434175446f6e7433754c51586946424361362f79414a596d5534656f547971506a30676a7a6f47337a6e2f7437676779634758364e3730655a674955587473732f2b6363694a516e6d6e795466716d4341304d486671793944397436427a6e68734c36446248733945394143314279773051346c53774732446e64614a5a326f4c7378532f62764f416f536b6a6542764569677937776969656d7763345933716361426f724958476e6a34417064346f49684e45306e4c656a4e43785a58776f47495457304667634431624a69514f3342764956514933784178396a634f6c473977616c6a44746a375575677174726f636969352f386847494379586b456677504a51336f774a37502f625336414167774c4154566e774a3468734376613073304a71576576422f596d676f7a424951584e5a554859754f416f584741684231316741794a30515178623434734749526846786d517455755a79336836523177495a4647454a582f3977512b3934416750734d4b2b48694d76685148374951304d57704a4f7a79754a42656b54457534327641344c4477685855494166444e616f4c677772654a365649786146596b536472774f4a426b49553542667a73697a4d4c6f786878514561646d644661614f514b47347144534e55567a4a6d7643526c70356d6762474f344c4f336a6b7958555932533457774d4147525467434638546742736d4d786773556168497436524c4e3034444e55586834515466623551495a2f4d414953766943476544775373496f796a62756979496865374f3267646a4e6b2b774542454a46755244376d664935715053412b62436752446e63675733487131434e464671774a4e6979696b66525a556475565241396342466d5867796d4d496b35774e41686330334b314d71626d746c4165376d7a4e644d6354545668633831503864513132747a4a374f684a4958762b6741684c344d4c2f474e6f4142304274683669776756354865664c47524a6f7256305764567778734d41516a644f454c5a484144434c6d44303950457359532f6334304e43504b77684c4b546f624961705546474374474e51494143453968414b717441685657697a352f766d39474a5744424c717662716f79414653676c4536704753467151502b35764b536d6d476770614b785a6730672b6c2b5a496f5642646255572f5a69493278304b686f3739745265514333625553616f5664334a34415a46794b6358784e4455702b366f746259523547467859745638756447314b6f4a42445a4371314443496c513431334a4855584c504f486737574e6d77645346314e68543144756e565736645069446f634967623970344967555a6555534d637062676978685542773137366353713967526b4f416f324e334959777569677633316a374c4e7375786c77644b446c34364f4c5a3231436b324e2f2b50623130447855364f56706d704f2b787166546971335154324b436f4d4c6b322f4f34415a444f49495361477462526249504f324659373032632b453537716258434b72466e4f50504a685443597751317a434b796a6b494364716661514469447554513049516c306a65594371506d6156646765694d434e3564774c674c563856566d6e5247592f344942477545497567334b67677542636f38585673517644414a5a6774414a6a3542644e2b2b6576664167495941414b325141695979523044757762426b794b656130724c6d4161373573474f6b764a70684b7154504d79546e742b45725663355041597a7647454f6c475262566c3955355a4f552b445077644e547469756f4372674b42434567414b786b384c4c7830586a4b4b5559564e614162793043494275614e596b68555447324b71776a6d614d4855366b513255432b735958526e4c49314330546552726b6638724b455150396b32706d4a6c463573756157584d5851444d434d644473454669687a64313563327669374b673574776174684245316e75323135382f305753634170646f4c596b42634452663630496e7571466c5041344d6e32317257785450587038636d364e676151616c6864594e544f37727431707974687a576d554963476f756f6655375755736f4c41535a426a4a5072616569657848425441495634514d686a6874726e424e5a597a66704f342b706f68553168417368534158324c667839677452545a576d74317944495141356a47507552566f586e4d746143454c576b437a4835344536644e557531456f2f6b79322b2b4c76302b53355564375744416150636d304b6b5276446848617857506b4e6355706a68386f564c346934356630746f2f644730446241744b612f554e7333304f486468353065624e5262776e6a44687541434d6669707164707757556e2f6a43467a78784556744834554f4f6a345244416761385878304158322f5744586f746d3465382b706b343958354e634d71594d5555416f564d4a2b38644335336473714a75514d3279414830653968444873704c467a6e73764f63324e5a66514e554e30766e78644d306a6e6b305a6277335365434277324e6d6a786366647468317233765343617841364d67433851727076596549764b4e466a4e6a76626949305150674c356734375033397772644742414a4e395548714e6f42694533674a454c47455a43656a7a564345522f6965766759455834766d69336b6567534478386e324f684c356b2b4168446c4a6f674150347a332b545a30767a5a4534416e36336d724f446d6343344c4570414e466e41425155384f524f2f4a6d6f432f77474948636d4d50554d394a336f3761436f62314d73503136414a6455437635356f5575364f303150724438436f4c326771726a2f796f4f7572724f56364c504e72417642656d45516b537368457877555168432b3479452b7a724b79474b462f4262694471796e534351673757715149454c51516c616b347572416e5643514c393476313359724a304a70497a41694a2f4b4144584c7535684a5141526e7738304a76394b424541696451427977517a61446753545477357771477562424e4e5a6951323062514e6c69414c6c54724d35784c4362586e59436945346f4476425a4850584e78514d2b537644773069446a657768487a4f4e52686c4949516f566a71676f2f61417532546c42312f46564f777645524d6944786a4e516d4b412b714273446a53514251534b4e4b6751797a41704a793752497253517438365176394a514e664a67445a2f6b2b426a52584262784d354a474e4279446165786c4254384444342f43446743764e576977457775433355366a42747250316b4178306770476847424444502b57455348304344745934413365782f6f71704d2b715146596f556148307a6b69716f43624530556a49455273526771425378464d63445134476353554f4a546455306232366b53646373534a673862435959414a784941643034786164684237663046353455544e386b5447457a3572735a653165417872396f6a66307352304a5175496f4242573154686f31513949635251646234776775736944305543546642373073704d2f737a6c53476b4a5a594d6c62385553464d44556367674d69576351366b4c30554330627a656f434e586f675a6173432f77556245735569654d634350347a7277414d694231517741416a41304e5576572b5253457a677945587779464638467369306a575363434771386a4b6b55416c4e736d6f6d73736f7343595653717a646b77437a3730413530386f34516b5776734143307270426746346e7545734b4e4b5a565965446945733056542f304a456b44614961553851466a504b77327141753779496552344d6f51637177636749704c554970655973704a7a44782b6949414143774b6e75516e4e51506f2b4151734c2b4d7143594f62364767724b53517a612b493058304f3642684d51394f41504b65516167573878646646625a50416859524d5148504530376b523457724e43386d5a76596d554446456f4f2b4e46554949445646494a69694551436d704d6b3377415a54305147526c4768794741323834496e43614d4d34452f32466b4a756b6e4b394c704f2f6846497a4f644d7a70394a5852744d7967484d30684e5042494a4a43304a4d3273434d794c37494450304d326747383763664e627075307a3049386b557a4b62724a42723875416762654f7076433957584957644a484657774d386d4a4c5249424a4d3342634c706e6d67316257674d344249765869412f2b65493763793038465749384c514a442f772b72437749534237427a4d545a7a644472545354347a4d304a7a5474797a4d68416b506d4d6e4e5347454c7644674e6c7544514338794b2b4849503233446f4f7a6c48594d4b527066787a6c366a534556475075747a494a3754534344306b2b3467434366784a735150527954674a6a75524c436c6b537150493843446a4f6b576a524c45733633536953796c6952616d7152514e534c676c44526e7647435a356b53414730563351554d6e68554e454b79446e2b304e3537304a7662544d6c344151647552446d5149484245543176377a4e46367a6a676f4a4e742f534c6b665558757a41526c2b447247434656536a306b387a525343717a4a754c5552317a536b506241723071504e4a7152517544546b504b674d422b4444306b552f7372674b4652564971794c6e63444152527331526746735435326b547846794637466a4a456d445546766a524a2b454b317344556639746f6b70506f316c6855315a50347761386b71704139444e497a56356b6331477174512b3356544d7768473079456b56326979394e6856514e53565437456966553056526b306f62576f4654776c5448636f44705252437a5a686737513953363867444861314c31346c5364384e534b416c5a61454e53425a6b54454f7746696668464c394e4655413954477956545330455456395a52672f34303576596e316d53464b7838556952744f4c2b56544f55305663553954313538316c506b4776673447497068486b59466b636f674a5a6f636a6d6c557948414e457a6e4b6e765541436b704147674a59304e424a6f726559454550513051584132455653324633346c3072417456344332496e5547495867324a48353168333547592f413065684247597234307a35776d4e3338317443566a4f494e56375973783374594778646f775769566146594e6a5041375675753954502f5875426b4f37466b4b3651464f4c5658434e59314c444a466a59526e612f56716a564d6e486e64494a6d424d5234594b2b48464f52594d364d55554a326c4a6b7771427545554d4737504d6d7a4742586a304a794a534a72443274722b5374772b2b4a723966524a7746565a762b567349534e7436594a6474524a6b4b51527563574a3358364d376257674f62674147444859304e505979594f423344777350734b4e44472b565273634d47764a567443733846626f423064554a4158324e4e43385a764b6351694a394e493843364b4c485257554c56435a57554472506462397141344a554a4d64654e577a79393646656e7154714d78382f423065574a6573586139777342465835637659746461776a5a47494c574e566d2f3456434e34433956586c4f35742b2b496262654d7750366b4e517355466d6e636e796e537474706564394542725245624258714d307338634f2f77516c594739695a6c2b6a43447758536d7a57556d5a4a4f6148546b4e6167686c6d4661426c69443869335344724166564e6c445268326455646a446b4c336955613232334a524d3459334a3971676633666966796b694577397244467a556341735977417a67536651574e41746d61544e6a66786e6a67614731323343574d48777a585546345a4c35414a386334316c494543494c59686b54345938306c5a56764443587349446d527467305744446d67584e6b3634556578416a594d52454f677656686175682f5a415a34736b586e4569666c6b4669426e6e44693733726e61594d4e6257556d51676933736c443770416b50655767477643446542764334344353366c347663344169335044674e65456933666b65655532565571344e6543594d4a703050733346677a476a6133576968666351686776474475713373486f55486f73356968594a4e6b696f59656f416966387834344a4c694179474e48665868624277734666714e30576f3750474d4246616a5a772b6d574659636c694745646b673449476c395251374d65534c596b54543034476c5035415738674a6d687841304f4f54505539536a65414a56567553506b6d6170634f5344784e6964696554396d4f5562734f4c544d425845684931643332556439355a63766f35527451706f72524641623577336338434e336769344878516a79755953633259524878707464497759347547443059416e2b74515579476964677a7a56653445306470597852784831367a56546f474a52586d5635355171694c52414d716c302f796741703875434967514a4f4c7a6c2b4b774b57687841365151494570704b4e7a4171427a4c5a574a657142623255567a656d4b3332456c512b7341634344736d7569384d6c4731394a55705067365a7259715664673541623567767156717a355971643777776a2f674670347a4c6f31314c70584a4468636c52676966564f7764304a4244664f545353514d764e6843616c4f646661536452575950696a7057496a6b6e664c5a494b4d41765030554e55746369574456352f63554638426d557679425a3733416a4179616765634a424e344b3046636f4d776a6f3344494373647753774d665a542b4e6b79326f3478634b2b746538576d4d614f7862654b6972644b6b2b59514f396e4e4a46324f6a42325549324c6945366f4244754d61334d574d4770767054384f437538534b5a47594f544b2b52644845554d727470536348437963615379433261497755643949376469494942664730554f4f6943484f654b7a43594d4f567074516241436875514d50786f434a4b535147444673683575433164794b3252337539616a73677a2b4332637a7447724e75576578746856454f3465626458364c41316a74736d757463312b7070727873432f2f316d69746657365547344177516c45443553677a686a44776e7544752f6b6b6a31386a42754b36556541416c31386970484d69756c484542514a634e3859417653304634446837534a4336562b344143356836566d79534c3553385344694179516c4544703441796a33694f497438624941417849306a44384b67774331456c32754344685a634a796135496d61626e647241525356634e5842376441374153656a6762517247454431534e664b587731504677342b4f4d597162624d3131783373634a7035524e45616155474b41794657444450376942594b5a4c2f41634f357934562f54675537387478564d6c443768676d6c66693052574372552f454257725453627741736c4545655531317952746e4465415a597170596f43314741757162524c4a387930466976355732336f41677237756a447269676e6b2b6b307955502f6f4c674b4e69634972716374397a4152662b686d54546f764766736645636f6249472f706467766f32787a5971342f59395162354d62426e5448776f4d786477354d5653516c436e5356516654474765596134594c6e373162646f6c544573585653344274355067775736594e346278417a32484361367653614f6d4644362f642f37496738326e46326d79645639354d6f625a5133776d3468362f55767a757957666d6a765777414d77506953635854586f594e502f3277734d76647a6277416a5976554a6b414b6a744150365334436a7963694e416e717167505343356554536f33567173505561772f5a6e735a65517234376b5a3439746a7a313743312b675a41786a7457643439505179437669566d774b38546770347635515a3076462b4c41426c6a494f455641742f766b4e4a5478564e54354164713345506549497a7649746835777339527041686166445147646d7730356546784a4f4b665a412b77514e622f4c59626d36594c5a6f397744376c3768723441445048346b4f4a45307a4744564c655546686d414d7148736e336b414a747031517770377134573838646b4c6d4c554a4c442b734e5842514d4a727a4f6e575261613964585468777a686e34786c4263787770314139763079316e346e3845446744387a7950515150784f446338774c6e74513154586b414a494a38753345447259534c4d53625a4373766c54594c2f64704a315034494149466a386d614f33655654345a6a7833536f663545414b5948586131673541414c4f6d44584c3862696355494f787439554a43447775324d4e6e6d427866555144786e6b304748357358674149754d414e70743467366f414d414f4a496a42554543786f3869444368776f554d563854414179696978496b554b5936346944476a786f30585364537043444b6b6877456b53356f6b7153476b79705573573770383252494f6a706b302f32766176446b54444d7964455130412b416b30364d3844504976476249693034512b6a544a7447684a45304b6b4962546c63536b597131594a757158463979795a72565446654b5a4d43614e65694353353678566657456d5848326f4177396243554f6959753359497776644f745762464f4542554d6c6669504f79597555786462436a4358716b594534613545356a597536495349594d526d2f53694b664a554b3573735135567a3262586f456b4970575472467537666b3253417055316430517a7a624d476934634a454744372f673263395962435749496250773668673572616a4f2b6f65544c687550535356327a72735845364f396f6653384b342b62687a6a686b76526d5a6b316d373653314d53484e753333394c307965384a747573586c596b7a503036646a5a30492f5138415566617039415a364253303159465575474c674356597a647865426943544c5642662b444b327857324138574b6c534457424e535245635841356e6d5257467a4c4c6868517a467741563564646f5278513149334d486259686a485138534658597153496b41744b324a476a52486d5138634e35694e554145567432514d566a516935304157526a646e534259704e5947614861644671574a4945474854784242525a587243484848737a5a74736361616d44785241653862516e6e63576f55646763486364345a3278504c6458564862683149674b647847707a5a4742784d57686b5a4444594151515153536e544268526463644b4845456b594155634f68694d5a3151354a476c65426571426d5a674b4e5238766c4758354371416f4b666671376d564a6c2f4141596c344b6f464d6f6a67716a415a6d56304e6a55466f6f4953367474515a67786a363955594c6d784c306737443244556e45433972464547566458697a724a42466b72465656486d59596f576e2f517939557931614e47395a51616d463677474647474a4e36305664564769344c4178666b32676548457042704e345a66595742724541784b684d5a5748563245432f424352455255526143425169414242524e6f73414548485854777751636565504445453156382f444556496f384d63736365664e4442426871383658444c734858516d4279417572776c42523167736359654f2b3278706763627a45777a634e585a5a67617643522b4e4e454578454779554361492b505949506e7537554d4b7244546a6a48466b6d387976555a7363354b36374275574a6a7231537670596147766a4256686f624e6d6731537367574930746b54434e346a42625756357449484569415a795552676538796139416778456841454854336938385155524343666c4e6c64304e436d444732504e49595953513868674e47466376534574746a423077585368584e786774476b7a354e30562f78347849763343454754456535735a5246524a75454a4452485271304c372f44767964454b7852575848425477664242427877484359575749686378636b636141443038622b6c56462b4675572b2f37417552372b5130314b494759565456734648774e6d4e34304e4747316964635241505872365a626d4b7867417843413247536e7635496446733751474343306a58387151594b462b7355594f2b774c594446517768734b513463786749744831436f4d484843584f786a383441686345454d62336a43484f644142446d396f6778693863495166504134725853684d48617a5567694f55376956314d454d58687543336863796f4b3348445675786d353565394b63454771644e4f47507a69426d55527a6e434934386b634a4c68433768306f49694f786e685776694d556e324f5944574f7969462b646b477a77415334706b4e42414c356c615638496b7656456d676e66394c56754d62394246774a58697741776e62554959796547454c57776843456e7a67417871637741547332556a38354a6366486f6a47666d444c6e363761734c3835566d5279444a4a42597761486e7538523841674872457a526b6c59444a5a6a68586a765267787643554a34694d67687768526c444752473175794371456a3278477750394b6f49484f4a436843305467484659637842553931434270544a7868654d6967684239674d4557723477775a4e59694544707242445738676f52744d3649556c4643474872307a494471766f7858434b4d303454304a6c6f39684364636171545a6a43726a7832773038313452715a4558486e66476b574667676643424936776b594375366a694845755a786a3333385979414843617037746b6347694d77504176747a76353834636c5751784a556b4b324975394669534d5a6a556a6962355a77514c486245796e4d7a6443327a2f634151766d4f454e645a676149414471426a4a3851584d31434233415945444b726f52556e68614b41574f5779534d57794b4149526e69554570426768422f49414b685341535a5833474454704d6c67434630516778766d774c71493243476737657143455734517853614e6c433136674174507a796f56745846786e5778746132736741456262724b463662713272635467776f446c77453631385855674c75324a506862714842454734705572342b52702f736757674173306a482f3049534547616f415346464b786c4c334b4368754b454279373153785169697239686d53475346355549484872616d4e6346713751544b59324231464d5a4f3569316a4332416757316834494a5a486f3265667248444d50756148634e795a59484158556a5a754b4b394d724c4142626431515653356879516b4b72473431463342526a7467312b797530774d4a756b4a76744174652f39634d4c30467643477431355a6d6173515432736877705152492b4768486a775159434c4e6c715938767757494d4b637043565a61392f6f5659447a646f6b423559547a57636a4f6c46566a6461697249334972517a6b5538616f4e704d4e6a7367597451506279727942716564646c6779794f685a44645467764871724c6845644d6b434c5542513843524448536a735757354c71597078473255336876624c3179546769784f415976424c44776f545a77654d62634f304a6e6d374c652f32376b4245456f677a454249642b53524b4143564b364143455351337a2f756c35424b37724b585233424941644f455077594762594b44744741444866656959324d5144426f447a3956576d47304d796e426c2f6b566b674d47334b5a2f4d73315259575a6564456e6c686461484458763263496b4b76754b4f493570344c496d4c6a486b76615a6550394544676e625663716f502f357559306d6e42474f3342515566446c554a714342443549516846542f385153736e75796f587731726a70776742324b6d7956397441775851416d42595a574677673974736f44637a4a733455726e434c44635262305a533030796c79675844483868566d4d30545262496b326b644e62467a634d57647165535861357a4d7474524c454149687641744c6e78704f6b633357477435325a724656596c68756d47473242473967734e596f3376664f746266436651516131786b414d793431725876435974617974716f456350653441565a765270764e3259504468383370463561474d4d53484744414e417676536279726573694274316d4843772f41504659327344706b534d4b5342706f7438756c38344656335147374c78666e753355566235556a61676d67646f6f50396733306f4f2b62427636753951354b584a39636739626b4364715272316d625a76516f7644442f7635567a67302b63485544627067367a31546c65504363614d65716342546c3143683145336c633731305847586a2f4c444a34396c692b3050534646364870324b4e50796d7576394e526f777036727951504f395777384336655a31797564756d6f2f585a51744362377a6a6c5679434d4975354358426e6a4e496a367663674f56334e46515a4578365865474c746e5a38396d49375a327447346276534c654c5056323538536c58654336694c37444d463778736c637646526b6b7a6a61336e3775526535696442365a54384d51664141586b634c563146783934503036664762614e2b367930514f31316563506a72343939714a4741426a76344e7739493778632f3644727a4f584c6c30307637656532384950514d6233445630614e34323551332b6c483564494c73674856756a355574474a39783741506e57765448454447776537615242335132642f61485a2b68682f7a6b55734879434a774845597a5a3363476b502b4442446b7a357441473443324241755548754663572f5a4a34496a47486b4d4a5759354941526d30484f694958366768587972596e3663563247626878347330426a45355647644e33754a39794675734947345a3338545567656d7832316778785a5268324a504e685a35634745636142414565482f35523346456b43524965427069345941572b484953454664765177586670595678516746646d44357667494e4f4742557838482b4e3051596a3649615064774a456434493841415a4b61423874474646386f43734c694235724a6b6c3869423433324836736459616e45582f3134594e6f6542424973494b564d59515a463074316b51632f79464d747748526b3159524f714873665167667642346c35383244614d54643046596153786f57536441576b574972426f5145764b456c305149534b71454e325742644238502b47743468766b63643941725944517341455a314235435a49477571614871774b49326547486333534d3258474a546e466f7067462b772f4b4d6e6d47453544574e713863436833682f722b646e472b635864654e6945576141416569454e68434d6a5445484f38687351304137475a55643671474b71776865456f434263375147777965507750454235446448646b434f73706751527542476f7045485034654c422b6c66635567444d3042724d3545444f724144504d414451744145544d41455851414759584147307751485a6163727777686145716771636e642b4630575344444b515858474e6942474e75724b536556474e43514948366a683330336331646f4341307559436a57675563494232504c5644395945482f636542502b43523954454868646870524a425661504d33674243502b566858703868616578423455756b614567426b6e5163495843427641466e2f45433541666657684277614a6b47665a58695951687a345142456a51425269706b644d45516e62416b3677466b68456c6b6b46796b6e3359656464694955665a46432b4a467932354b70526f466a475a494858416a546f484130696e4b336e51653531326a6b62786a3951566966626842562b35656b6a516a50597842353759616131484559654847495142686c695a585253516c3679464256475a6a7871776d685857426f495a66544f67547a6d43423176515832674a644357676c696741534b6a475231755152783845423358516d56774a4533643550326d674b33757048636c495148374a4949444a4649594a466f53704b744348463075674b336f67614b7458417758344e6c7a776b2b6531686d4f524c43694762514e434274775a626938776c6b46534231493459396d6f4574677046556341434b674a586876676970306e422b586d6e774d41415657516e4b39342f32774161515457615274754947713861566d2b65514c4165577170786b664657553349715a7842777078673435797251703138575748575a69414f576854366952586147535477655262654f537866514a7054694b496651675971796c63664f425a45575633614b427077414a6f7146774d73476c755a3647497659484556515a746773544146616c6637324b455263516574695a6f62454a736469676465344b4a4371714e426767646c6b475334534b4557696d70426b4b466c304163626d71425271697434324a79364d714c5232586c737078303175684d34476856452b69457a696867774b6a5a4b47573569795670774549737a6c71524b4171686f74582f33463534714e7751746b6a35346f41546e69565a447968493069526441304a394f796c5a617961595449516366634a70615341465951436966366d44324f586445414b6c7630775a4a6f456178526749557976397144644141662f414856315942614f4147634541484b596d716e33703562797169426c6461644a6f6472546f5765416f356e556570594e4765756d49486a5470764e6e4362705457746e546166586445476d746c5858576f6659734373314f5543586c4358716a4947577970504e30434c6746436f6944456a6e4c704f73426d734536454742477142455041452f466976576171757a4359446a6b6c4165374d465068436d47304772706c616d5a387152644d414841664162395669764577734942785a5249616f716359714d63376f6879746f562f3771694659594847784b74764c616b492f59435862436d5a6e4f6a694b616e4c674764774a5765574a4f543350594435486c526278436b774d554353674373464c47596357464a3869704f456b4146707a7178563542337841634248684367464473526332436b4766634350394b6836344a486556514763766d725043482f427749517356414c74543442576e36674b79597170785547664e6f786d555542736c4c7873674f534279524c51485677424d3961584464777256784a42314e4c5853706d4732764c567a69726553644c58544477426564366b336437586a45677343726874336a785a6b546252636e7874474a37423163516156766f74474b37456d617773397a47416b4e41754a3737456e73414141546747784a72756c4636414c706d747175437468757274687653746a7a78746e6c615955374a49507735523236677168305741324f6775484d6b426f6237536b42677030306875447746413855625730764170395846416b647775383658714e316b424236724574547147537951423552375252744168713062455772774161344a58685251425a647276684b4242324741764231324133457274716862414b763776703861414c423774735a36556331724774634c45376e62724133472f3773473472747a68416469674b6e413553504c4b306c32494c336e6c5259727978575a325663657944397767426c3539674d7a79355632674154652b6b6f42577851436a426830494c37485137373747784a375141564c65324d5177414658674d4765717764654d4c2f415a51506743734d716b5163416b4c2b77735a564233486c726f4773414141582f57354b53704d4b5251634176596342495962396b7553454c4c456c353841585a6531597573415254504b6766764d46686e434f7a6556616a573770583477614267574c3143375676454c524a4538464745624f6d38515974374473533841465869735153735162516f5630516f414655344c352f544246323441566558463033384c694976424941414c5a47444d6b4e5a7245523163537943384353684b796e496359745563554e636356685a4d4b656f6355586c51646a384b37794a444474697170754d415234692f38744d74414633477366645741457374776b4c6d4145657a744862324145303674635150444977556f47713377304c4141616642596865747779454c4142574d43766c54775261304146477a43715867544e686b7a4e4c70484b776474584c54414549747a4e494345417155764a355478485a4174616d617771793267616c316c614d5869696a4d48496365484c6b76544133636d5665474137777077374d7541464573796d77417a5139474945625143396a65454743306f344c50414458304451716a494849734a58764a7a50554e7641794c777079707a524d45464a3643454732657a4d787945424e335049366b7752653341465666417a567951424736416e30367a53494f45475268444b52394e41726c7a542f567645726c46344e5830316533444f7575624f515549484f6130514550654b537030513376694e6270624471674b4f426e4b6f4455594858424336684d502f7977704e7a5258647778714642473077315967594c5567544134667a7956637a4a455067314f687841784b4e7947595179306a6a416b6677305479783158684242757a6d4f7841414d5251674d524f6a415956743249633941596b74324251674159304e324737564a522b414d30677231437a524a327a43415377544b42537750446854316b4c39496b5853567a2f303264546376784437476b4664326174797952455642614a6c4177666456424f644932515131677a684173566346644d4b4137713845456736776b4d6732314a52424b55394c472b67424875394b53347742474e413278514c4c572b4e4654417742462b777876785442312f77413657734853357741306351426d2b7730426631496b556733586c6841313251312f734c423131777a396b784179785346374d626c6a4a67417a395142443967417a484170793777413247414233767742425141324158652f39694354646756597a4561347a4569347a78586f415a7173415a6b7367646d496f6b564c67635a5075455272675a58344f465834447a4f517a4a56304446507344456e6b7a45586f2b4972726a465645435a7149416555766470476b51647973435a553841516f6f7a4954734e6752672b4155677a4650494359354d2b4e644d516465734e337839414a4638415732584f515430622f6f444e525072697033384c704c2f4e7076677764356f416432344f5631514164304545496b39415a763441625831415a6d6f4f5a6b774f5a6949415a6b514e5a737575566437755632414f59684e41646b62755a6f72755a6d774f5a6b344f5a6959415a4f766c686358756431634f64357275646f6e755a2b33755a75546759385455427a6675686850755a6b66755a74304f694f44756951547334644f6764665541546a6968637959415269384e797461776469344467385174316334503847347a30736453414753484144622b30434e5641454843514762324463465759485a484145356745774c674145586e44646c637733373430584d5841456f357a49534855455375414659374253486d6c666166376e5a484256736b376c3377377577566f485964447132784d447035377136687a6c503830614e786675412b4b6d6f4a586c3730377639663774654f414758724135766830564c464144526d44643959377658514145704734512f6737773469323275545165536d41452b5730444e5441444d3141444e5741444e6e41444e2f414451304145523741455866414648735253516b3048745837724b524944526441466266437a4e66304758444145426d38514c33414453684472396f377a4f612f7a72664d472b6e37627a543445587144774f3038525554374a72654875524d38576558446c532b774553672f3155512f4464744147586f4145525341447734332f454330674130434142462f5142756c657a6f7354426b734142444c413355356941306241425745763957502f426d4f6742455267413653754b456251425753513746524f396b6a77417a4741747930774130544142615030396f65502b46412f4237733042444f51396e4842416a454142456f67426e752f383033503769624258596e664649796b61302f502b6145762b76314d427a486c4c6b646c4245517742454e51424558413855597737567751386c6631362b4765422b7779426c3667424565512b717a5038573735425759414239342b2b6c4272523232512b355279424553672b7237502f4562676c74562b3761467642322f514c6c7a67384d7a762f456177424c49762f4c56662f4f45762f7161724232394142746c45424463774137307446533051417a55414248672f426d3467397544653945642f456a45332f69325242674168414d42416767554e446e51432f306a68516f594e485436454746486952496f564c5637456d46486a526f34645058344547564c6b534a496c545a35456d564c6c53705974586236454756506d544a6f31626437456d56506e54703439582b4b70412b654e6d7a5a6d7a4a41783273624e6d7a6c32385069454b764a417751494472463464734348713170463841687745617a416856374a6c7a5a35466d31627457725a743362364647316675584c7031376437466d31666c314949457346716c6f4a637248373568445938566e466a785973614e48542b4748466e795a4d71564c562f47444c6e775141462f423044596b396d6c6e362b4754534d576e5672316174617458622b4748567632624e713162567663504443415a7a57334e2b5a4a5938443063414147664239486e6c7a356375624e6e542b48486c3036793979632f56366c63766d4f6e6a31373550446873325a4e47764c6b2f5a79486b68354b46502f325474792f4e7842662f6f4853784530626e3535662f33372b2f66332f427a4241415164387144714371724b4b41357532362b3637384d59724c34337a2f4642767666626563302b2b2b5137677345503641674152524948734937464545776e436a3041565632537852526466684446474757653053446a5443696941414455656a4642434374566a3730494d4e597a5051773944444848454535646b736b6b6e5455534e52696d6e704c4a4b4b362f454d6b737465374c7853532b2f42444e4d4d622b4d636b737a7a30517a545458585a4c504e35726f634d3034353536537a79536a6378444e505066666b7330382f2f377a4a69546f484a625251517630414e46464646325730555563666e564a515179656c744e496c313441305530303335625254547a2b464441704c52795731564e3379414456565656646c745656585878557044564e6e70585851413244464e56662f5858666c7456633939366731574748424c4e4e58593439464e6c6c6c6c31584f7747476668545973524a6d6c746c707272385532323772676a4c5a62627745494944527478795733584850505258636b5562396c4e396f5530345533586e6e6e7054645a4f64724664396870362b573358332f2f425468525a2f4d6c324e414155413034595955585a726868463963744f474a4b37335334596f7376786a6a6a3266616f54324b5036517858593546484a726c6b6b2b325339474f56343454695a4a6466686a6c6d6d575879616d5762776278315a70313335726c6e6e78394b2b576168547779416a352b50526a70707053766d6547696e535177676a61576e707270717138755639576d747734723661712b2f426a7473584b5059756d794344734255624c58585a72767452494d32572b67446f6b445962627676786a74764b2b474f6531596b515453795179494e63434b4b587a5475304474787852646e48454453746862673777414335334277444e304c4d6f6f4b7a2b745250504434364534507842736e765854545477647744796336626a4c7976796b2f77504c4c673979633877673935304f4f30456448765866666677662b7a4476577144433943547466417a7a6439784139654f6566747a67674144733d, 1, '2017-10-14 13:27:43', '2022-06-03 11:29:21');
INSERT INTO `tms_email_sign` (`sign_id`, `sign_name`, `sign_detail`, `sign_picture`, `sign_image`, `is_active`, `created`, `updated`) VALUES
(2, '', 0x3c703e746573743132333c2f703e, '', '', 0, '2022-10-04 17:26:45', '2022-10-04 17:26:45');

-- --------------------------------------------------------

--
-- Table structure for table `tms_email_templates`
--

CREATE TABLE `tms_email_templates` (
  `template_id` int(11) NOT NULL,
  `template_name` varchar(50) NOT NULL,
  `template_content` text NOT NULL,
  `template_subject` varchar(255) NOT NULL,
  `template_category` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_email_templates`
--

INSERT INTO `tms_email_templates` (`template_id`, `template_name`, `template_content`, `template_subject`, `template_category`, `is_active`, `created_by`, `created_date`, `updated_date`) VALUES
(5, 'For reset password', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\n<meta name=\"format-detection\" content=\"telephone=no\"> <!-- disable auto telephone linking in iOS -->\n<title></title>\n<link href=\"https://fonts.googleapis.com/css?family=Roboto\" rel=\"stylesheet\">\n<style>\nhtml,\nbody,\np {\n    font-family: \'Roboto\', sans-serif;\n    font-size: 14px;\n}\n</style>\n<table style=\"display: table;border-collapse: separate;box-sizing: border-box;\" border=\"0\" width=\"100%\" align=\"center\">\n    <tbody>\n        <tr>\n            <td>\n                <table style=\"border: 1px solid #c9d6df;border-radius:20px;box-sizing: border-box;border-collapse: collapse; border: 1px solid #d1c7c7 !important;background-color: #fff;\" border=\"1\" width=\"600\" align=\"center\">\n                    <tbody>\n                        <tr>\n                            <td>\n                                <table style=\"display: table;border-collapse: separate;box-sizing: border-box;box-sizing: border-box;border-collapse: collapse;\" border=\"0\" align=\"center\" width=\"100%\">\n                                    <tbody>\n                                        <tr>\n                                            <td style=\"padding: 15px;/* height: 50px; */background-color: #efefef;border-bottom: 1px solid #bfbfbf;\">\n                                                <center> <img src=\"http://103.239.146.251:898/tmsNew/assets/img/BeConnected_Logo.gif\" class=\"img-full\" alt=\"...\" style=\"max-height: 50px;width: 250px;\"> </center>\n                                            </td>\n                                        </tr>\n                                        <!--<tr>-->\n                                        <!--<td><span style=\"height: 1px;width: 100%;background-color: #d1c7c7;display: block;\">&nbsp;</span></td>-->\n                                        <!--</tr>-->\n                                        <tr>\n                                            <td style=\"padding: 15px;\">\n											<p>Hi [USERNAME],</p>\n											<hr>\n											<p>You recently requested to reset your password for beconnected account.Please click on&nbsp;</p>\n											<p>the below link to reset it : </p>\n											[RESETPASSWORDLINK]<br><br>If you did not requested for reset, please ignore this email.<br><br>Kind regards,<br>TMS Team.</td>\n                                        </tr>\n                                        <tr>\n                                            <td style=\"padding: 5px;background-color: #efefef;border-top: 1px solid #b5b5b5;\">\n                                                <center>\n                                                    <div style=\"text-align: left;\"><span style=\"/* color: #060606; */\">For more information, visit us at <a style=\"color: #000000;\" href=\"http://www.beconnected.no\"><u>www.beconnected.no</u></a> or <u style=\"color: rgb(255, 255, 255);\"><a style=\"color: #000000;\" href=\"http://www.beconnected.bg\">www.beconnected.bg</a>.</u></span></div>\n                                                    <div style=\"text-align: left;\"><span style=\"color: #ffffff;\"><u style=\"color: rgb(255, 255, 255);\"><br></u></span></div>\n                                                    <div> </div>\n                                                    <div style=\"text-align: left;\"><span style=\"/* color: #000000; */\"><em>This email and any attachments to it may be confidential and are intended solely for the use of the individual to whom it is addressed. If you are not the intended recipient of this email, you must neither take any action based upon its contents, nor copy or show it to anyone. If you have received this transmission in error, please use the reply function to tell us and then permanently delete what you have received.</em></span></div>\n                                                    <div> </div>\n                                                    <div> </div>\n                                                    <div>\n                                                        <div><a href=\"https://www.facebook.com/beconnectedbulgaria?_rdr=p\" target=\"_blank\" rel=\"noopener\"><img src=\"http://i.imgur.com/EgYFhb9.png\" alt=\"\" width=\"39\" height=\"38\"></a> <img src=\"http://i.imgur.com/pG5yZd6.png//www.dropbox.com/preview/BeConnected%20AS/IT/E-post/Ikoner/BeConnected_zps34203a72.PNG\" alt=\"\" width=\"84\" height=\"37\"> <img src=\"http://i.imgur.com/wQ9lihL.png\" alt=\"\" width=\"75\" height=\"27\"> </div>\n                                                        </div>\n                                                </center>\n                                            </td>\n                                        </tr>\n                                    </tbody>\n                                </table>\n                            </td>\n                        </tr>\n                    </tbody>\n                </table>\n            </td>\n        </tr>\n    </tbody>\n</table>', 'Reset Password', 3, 1, 1, '2018-09-08 14:57:11', '2019-01-01 15:30:13'),
(6, 'For Accepted job by resource', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\n<meta name=\"format-detection\" content=\"telephone=no\"> <!-- disable auto telephone linking in iOS -->\n<title></title>\n<link href=\"https://fonts.googleapis.com/css?family=Roboto\" rel=\"stylesheet\">\n<style>\nhtml,\nbody,\np {\n    font-family: \'Roboto\', sans-serif;\n    font-size: 14px;\n}\n</style>\n<table style=\"display: table;border-collapse: separate;box-sizing: border-box;\" border=\"0\" width=\"100%\" align=\"center\">\n    <tbody>\n        <tr>\n            <td>\n                <table style=\"border: 1px solid #c9d6df;border-radius:20px;box-sizing: border-box;border-collapse: collapse; border: 1px solid #d1c7c7 !important;background-color: #fff;\" border=\"1\" width=\"600\" align=\"center\">\n                    <tbody>\n                        <tr>\n                            <td>\n                                <table style=\"display: table;border-collapse: separate;box-sizing: border-box;box-sizing: border-box;border-collapse: collapse;\" border=\"0\" align=\"center\" width=\"100%\">\n                                    <tbody>\n                                        <tr>\n                                            <td style=\"padding: 15px;/* height: 50px; */background-color: #efefef;border-bottom: 1px solid #bfbfbf;\">\n                                                <center> <img src=\"http://103.239.146.251:898/tmsNew/assets/img/BeConnected_Logo.gif\" class=\"img-full\" alt=\"...\" style=\"max-height: 50px;width: 250px;\"> </center>\n                                            </td>\n                                        </tr>\n                                        <!--<tr>-->\n                                        <!--<td><span style=\"height: 1px;width: 100%;background-color: #d1c7c7;display: block;\">&nbsp;</span></td>-->\n                                        <!--</tr>-->\n                                        <tr>\n                                            <td style=\"padding: 15px;\">\n											<p><span>Hi!<br></span></p>\n                                            \n                                            <div><span>I would like to let you know that I\'m happy to accept the job.</span></div>\n                                            <div><span> </span></div>\n                                            <div><span><b>JOB</b></span><br><span>[JOBNO]</span><br><br><span><b>LANGUAGES</b></span><br><span>[LANGUAGES]</span><br><br><span><b>RESOURCE</b></span><br><span>[RESOURCENAME]</span></div>\n                                            <div><span> </span></div>\n                                            <div><span>[JOBREQUESTCOMMENT]</span></div>\n                                            \n\n                                            </td>\n                                        </tr>\n                                        <tr>\n                                            <td style=\"padding: 5px;background-color: #efefef;border-top: 1px solid #b5b5b5;\">\n                                                <center>\n                                                    <div style=\"text-align: left;\"><span style=\"/* color: #060606; */\">For more information, visit us at <a style=\"color: #000000;\" href=\"http://www.beconnected.no\"><u>www.beconnected.no</u></a> or <u style=\"color: rgb(255, 255, 255);\"><a style=\"color: #000000;\" href=\"http://www.beconnected.bg\">www.beconnected.bg</a>.</u></span></div>\n                                                    <div style=\"text-align: left;\"><span style=\"color: #ffffff;\"><u style=\"color: rgb(255, 255, 255);\"><br></u></span></div>\n                                                    <div> </div>\n                                                    <div style=\"text-align: left;\"><span style=\"/* color: #000000; */\"><em>This email and any attachments to it may be confidential and are intended solely for the use of the individual to whom it is addressed. If you are not the intended recipient of this email, you must neither take any action based upon its contents, nor copy or show it to anyone. If you have received this transmission in error, please use the reply function to tell us and then permanently delete what you have received.</em></span></div>\n                                                    <div> </div>\n                                                    <div> </div>\n                                                    <div>\n                                                        <div><a href=\"https://www.facebook.com/beconnectedbulgaria?_rdr=p\" target=\"_blank\" rel=\"noopener\"><img  src=\"http://i.imgur.com/EgYFhb9.png\" alt=\"\" width=\"39\" height=\"38\"></a> <img src=\"http://i.imgur.com/pG5yZd6.png//www.dropbox.com/preview/BeConnected%20AS/IT/E-post/Ikoner/BeConnected_zps34203a72.PNG\" alt=\"\" width=\"84\" height=\"37\"> <img src=\"http://i.imgur.com/wQ9lihL.png\" alt=\"\" width=\"75\" height=\"27\"> </div>\n                                                        </div>\n                                                </center>\n                                            </td>\n                                        </tr>\n                                    </tbody>\n                                </table>\n                            </td>\n                        </tr>\n                    </tbody>\n                </table>\n            </td>\n        </tr>\n    </tbody>\n</table>', 'Job accepted by resource', 1, 1, 1, '2018-10-26 18:10:31', '2018-10-29 19:24:21'),
(7, 'For job rejected by resource', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\n        <meta name=\"format-detection\" content=\"telephone=no\"> <!-- disable auto telephone linking in iOS -->\n        <title></title>\n\n		<link href=\"https://fonts.googleapis.com/css?family=Roboto\" rel=\"stylesheet\">\n		<style>\n			html, body, p {\n				font-family: \'Roboto\', sans-serif;\n				font-size: 14px;\n			}\n		</style>\n\n	\n    \n       <table style=\"display: table;border-collapse: separate;box-sizing: border-box;\" border=\"0\" width=\"100%\" align=\"center\">\n		<tbody><tr>\n			<td>\n				<table style=\"border: 1px solid #c9d6df;border-radius:20px;box-sizing: border-box;border-collapse: collapse; border: 1px solid #d1c7c7 !important;background-color: #fff;\" border=\"1\" width=\"600\" align=\"center\">\n					<tbody><tr>\n						<td>\n							<table style=\"display: table;border-collapse: separate;box-sizing: border-box;box-sizing: border-box;border-collapse: collapse;\" border=\"0\" align=\"center\" width=\"100%\">\n						    	<tbody>\n									<tr>\n										<td style=\"padding: 15px;/* height: 50px; */background-color: #efefef;border-bottom: 1px solid #bfbfbf;\">\n											<center>\n												<img src=\"http://103.239.146.251:898/tmsNew/assets/img/BeConnected_Logo.gif\" class=\"img-full\" alt=\"...\" style=\"max-height: 50px;width: 250px;\">\n											</center>\n										</td>  \n									</tr>\n									<!--<tr>-->\n										<!--<td><span style=\"height: 1px;width: 100%;background-color: #d1c7c7;display: block;\">&nbsp;</span></td>-->\n									<!--</tr>-->\n									<tr> \n										<td style=\"padding: 15px;\">\n<div>\n<p><span>Hi!<br></span></p>\n</div>\n\n											<div><span>I regret to inform you that the following job has been assigned to another resource.<br></span></div>\n<div> </div>\n<span><b><br>JOB:</b></span><br><font face=\"khmer ui, geneva\">[JOBNO]</font><br><br><span><b>SUBJECT:</b></span><br><font face=\"khmer ui, geneva\">[PROJECTNAME]</font><br><br><span><b>LANGUAGES:</b></span><br><font face=\"khmer ui, geneva\">[LANGUAGES]</font><br><br><span><b>DEADLINE:</b></span><br><font face=\"khmer ui, geneva\">[DEADLINE]</font><br><br><span><b>REJECT REASON:</b></span><br>[REJECTREASON]<br><br>\n\n										</td> \n									</tr>\n									<tr>\n										<td style=\"padding: 5px;background-color: #efefef;border-top: 1px solid #b5b5b5;\">\n											<center>\n												<div style=\"text-align: left;\"><span style=\"/* color: #060606; */\">For more information, visit us at <a style=\"color: #000000;\" href=\"http://www.beconnected.no\"><u>www.beconnected.no</u></a> or <u style=\"color: rgb(255, 255, 255);\"><a style=\"color: #000000;\" href=\"http://www.beconnected.bg\">www.beconnected.bg</a>.</u></span></div><div style=\"text-align: left;\"><span style=\"color: #ffffff;\"><u style=\"color: rgb(255, 255, 255);\"><br></u></span></div>\n<div> </div>\n<div style=\"text-align: left;\"><span style=\"/* color: #000000; */\"><em>This email and any attachments to it may be confidential and are intended solely for the use of the individual to whom it is addressed. If you are not the intended recipient of this email, you must neither take any action based upon its contents, nor copy or show it to anyone. If you have received this transmission in error, please use the reply function to tell us and then permanently delete what you have received.</em></span></div>\n<div> </div>\n<div> </div>\n<div>\n<div><a href=\"https://www.facebook.com/beconnectedbulgaria?_rdr=p\" target=\"_blank\" rel=\"noopener\"><img src=\"http://i.imgur.com/EgYFhb9.png\" alt=\"\" width=\"39\" height=\"38\"></a>   <img src=\"http://i.imgur.com/pG5yZd6.png//www.dropbox.com/preview/BeConnected%20AS/IT/E-post/Ikoner/BeConnected_zps34203a72.PNG\" alt=\"\" width=\"84\" height=\"37\">    <img src=\"http://i.imgur.com/wQ9lihL.png\" alt=\"\" width=\"75\" height=\"27\">      </div>\n</div>\n\n											</center>\n										</td>\n									</tr>\n								</tbody>\n							</table>\n						</td>\n					</tr>\n				</tbody></table>\n			</td>\n		</tr>\n	</tbody></table>', 'Job rejected by resource', 2, 1, 1, '2018-10-29 14:56:26', '2018-10-30 15:19:40'),
(8, 'For registration email', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\n        <meta name=\"format-detection\" content=\"telephone=no\"> <!-- disable auto telephone linking in iOS -->\n        <title></title>\n\n		<link href=\"https://fonts.googleapis.com/css?family=Roboto\" rel=\"stylesheet\">\n		<style>\n			html, body, p {\n				font-family: \'Roboto\', sans-serif;\n				font-size: 14px;\n			}\n		</style>\n\n	\n    \n       <table style=\"display: table;border-collapse: separate;box-sizing: border-box;\" border=\"0\" width=\"100%\" align=\"center\">\n		<tbody><tr>\n			<td>\n				<table style=\"border: 1px solid #c9d6df;border-radius:20px;box-sizing: border-box;border-collapse: collapse; border: 1px solid #d1c7c7 !important;background-color: #fff;\" border=\"1\" width=\"600\" align=\"center\">\n					<tbody><tr>\n						<td>\n							<table style=\"display: table;border-collapse: separate;box-sizing: border-box;box-sizing: border-box;border-collapse: collapse;\" border=\"0\" align=\"center\" width=\"100%\">\n						    	<tbody>\n									<tr>\n										<td style=\"padding: 15px;/* height: 50px; */background-color: #efefef;border-bottom: 1px solid #bfbfbf;\">\n											<center>\n												<img src=\"http://3.123.233.162/assets/img/BeConnected_Logo.png\" class=\"img-full\" alt=\"...\" style=\"max-height: 50px;width: 250px;\">\n											</center>\n										</td>  \n									</tr>\n									<!--<tr>-->\n										<!--<td><span style=\"height: 1px;width: 100%;background-color: #d1c7c7;display: block;\">&nbsp;</span></td>-->\n									<!--</tr>-->\n									<tr> \n										<td style=\"padding: 15px;\">\n											<div><span>Hi [USERNAME]!</span></div>\n<div> </div>\n<div><span>Thank you so much for registering with BeConnected!</span></div>\n<div> </div>\n<div><span>Please confirm your registration with a click on the link below:<br><br>[REGISTRATIONLINK]<br><br>Your Login Details are:<br><br>Email:<br>[USEREMAIL]<br><br>Password:<br>[USERPASSWORD]<br><br>Please remember to change your password on first login.<br><br>For future login please use the following link:<br><br>[BUSINESSMANAGERLINK]</span></div>\n<div> </div>\n<div><span>If you have any questions, please contact work@beconnected.no</span></div>\n<div>\n    <div>\n        <div> </div>\n        <div><span>We are looking forward to be working with you! :)</span></div>\n        <div> </div>\n        <div><span>Best Regards</span></div>\n        <div> </div>\n        <div><span>BeConnected Resource Team</span></div>\n    </div>\n</div>\n										</td> \n									</tr>\n									<tr>\n										<td style=\"padding: 5px;background-color: #efefef;border-top: 1px solid #b5b5b5;\">\n											<center>\n												<div style=\"text-align: left;\"><span style=\"/* color: #060606; */\">For more information, visit us at <a style=\"color: #000000;\" href=\"http://www.beconnected.no\"><u>www.beconnected.no</u></a> or <u style=\"color: rgb(255, 255, 255);\"><a style=\"color: #000000;\" href=\"http://www.beconnected.bg\">www.beconnected.bg</a>.</u></span></div><div style=\"text-align: left;\"><span style=\"color: #ffffff;\"><u style=\"color: rgb(255, 255, 255);\"><br></u></span></div>\n<div> </div>\n<div style=\"text-align: left;\"><span style=\"/* color: #000000; */\"><em>This email and any attachments to it may be confidential and are intended solely for the use of the individual to whom it is addressed. If you are not the intended recipient of this email, you must neither take any action based upon its contents, nor copy or show it to anyone. If you have received this transmission in error, please use the reply function to tell us and then permanently delete what you have received.</em></span></div>\n<div> </div>\n<div> </div>\n<div>\n<div><a href=\"https://www.facebook.com/beconnectedbulgaria?_rdr=p\" target=\"_blank\" rel=\"noopener\"><img src=\"http://i.imgur.com/EgYFhb9.png\" alt=\"\" width=\"39\" height=\"38\"></a>   <img src=\"http://i.imgur.com/pG5yZd6.png//www.dropbox.com/preview/BeConnected%20AS/IT/E-post/Ikoner/BeConnected_zps34203a72.PNG\" alt=\"\" width=\"84\" height=\"37\">    <img src=\"http://i.imgur.com/wQ9lihL.png\" alt=\"\" width=\"75\" height=\"27\">      </div>\n</div>\n\n											</center>\n										</td>\n									</tr>\n								</tbody>\n							</table>\n						</td>\n					</tr>\n				</tbody></table>\n			</td>\n		</tr>\n	</tbody></table>', 'Registration email', 4, 1, 1, '2018-10-29 15:31:46', '2022-11-16 12:59:13'),
(9, 'For overdue job', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\n        <meta name=\"format-detection\" content=\"telephone=no\"> <!-- disable auto telephone linking in iOS -->\n        <title></title>\n\n		<link href=\"https://fonts.googleapis.com/css?family=Roboto\" rel=\"stylesheet\">\n		<style>\n			html, body, p {\n				font-family: \'Roboto\', sans-serif;\n				font-size: 14px;\n			}\n		</style>\n\n	\n    \n       <table style=\"display: table;border-collapse: separate;box-sizing: border-box;\" border=\"0\" width=\"100%\" align=\"center\">\n		<tbody><tr>\n			<td>\n				<table style=\"border: 1px solid #c9d6df;border-radius:20px;box-sizing: border-box;border-collapse: collapse; border: 1px solid #d1c7c7 !important;background-color: #fff;\" border=\"1\" width=\"600\" align=\"center\">\n					<tbody><tr>\n						<td>\n							<table style=\"display: table;border-collapse: separate;box-sizing: border-box;box-sizing: border-box;border-collapse: collapse;\" border=\"0\" align=\"center\" width=\"100%\">\n						    	<tbody>\n									<tr>\n										<td style=\"padding: 15px;/* height: 50px; */background-color: #efefef;border-bottom: 1px solid #bfbfbf;\">\n											<center>\n												<img src=\"http://103.239.146.251:898/tmsNew/assets/img/BeConnected_Logo.gif\" class=\"img-full\" alt=\"...\" style=\"max-height: 50px;width: 250px;\">\n											</center>\n										</td>  \n									</tr>\n									<!--<tr>-->\n										<!--<td><span style=\"height: 1px;width: 100%;background-color: #d1c7c7;display: block;\">&nbsp;</span></td>-->\n									<!--</tr>-->\n									<tr> \n										<td style=\"padding: 15px;\">\n											<div>\n    <div>\n        <div><span>Hi there!</span></div>\n        <div> </div>\n        <div><span>IMPORTANT!</span></div>\n        <div> </div>\n        <div><span>This job is overdue - and you need to take action immediately - so this project is delivered on time.</span></div>\n        <div> </div>\n        <div><span>This is some information about the overdue job:</span></div>\n        <div> </div>\n    </div>\n</div>\n<div><span><b>JOB:</b></span><br><span>[JOBNO]</span><br><br><span><b>RESOURCE:</b></span><br><span>[NAMEJOBRECEIVER]</span><br><br><span><b>CUSTOMER:</b></span><br><span>[CUSTOMERNAME]</span></div><div><span><br></span></div>\n<div> </div>\n<div>\n    <div>\n        <div><span><b>PROJECT:</b></span></div>\n        <span>[PROJECTNAME]</span>\n    </div><div><span><br></span></div>\n    <div><span> </span></div>\n    <div><span><b>TASK:</b></span><br><span>[JOBSERVICE]</span></div><div><span><br></span></div>\n    <div><span> </span></div>\n    <div><span><b>DEADLINE:</b></span><br><span>[DEADLINE]</span></div>\n    <div> </div>\n</div>\n										</td> \n									</tr>\n									<tr>\n										<td style=\"padding: 5px;background-color: #efefef;border-top: 1px solid #b5b5b5;\">\n											<center>\n												<div style=\"text-align: left;\"><span style=\"/* color: #060606; */\">For more information, visit us at <a style=\"color: #000000;\" href=\"http://www.beconnected.no\"><u>www.beconnected.no</u></a> or <u style=\"color: rgb(255, 255, 255);\"><a style=\"color: #000000;\" href=\"http://www.beconnected.bg\">www.beconnected.bg</a>.</u></span></div><div style=\"text-align: left;\"><span style=\"color: #ffffff;\"><u style=\"color: rgb(255, 255, 255);\"><br></u></span></div>\n<div> </div>\n<div style=\"text-align: left;\"><span style=\"/* color: #000000; */\"><em>This email and any attachments to it may be confidential and are intended solely for the use of the individual to whom it is addressed. If you are not the intended recipient of this email, you must neither take any action based upon its contents, nor copy or show it to anyone. If you have received this transmission in error, please use the reply function to tell us and then permanently delete what you have received.</em></span></div>\n<div> </div>\n<div> </div>\n<div>\n<div><a href=\"https://www.facebook.com/beconnectedbulgaria?_rdr=p\" target=\"_blank\" rel=\"noopener\"><img src=\"http://i.imgur.com/EgYFhb9.png\" alt=\"\" width=\"39\" height=\"38\"></a>   <img src=\"http://i.imgur.com/pG5yZd6.png//www.dropbox.com/preview/BeConnected%20AS/IT/E-post/Ikoner/BeConnected_zps34203a72.PNG\" alt=\"\" width=\"84\" height=\"37\">    <img src=\"http://i.imgur.com/wQ9lihL.png\" alt=\"\" width=\"75\" height=\"27\">      </div>\n</div>\n\n											</center>\n										</td>\n									</tr>\n								</tbody>\n							</table>\n						</td>\n					</tr>\n				</tbody></table>\n			</td>\n		</tr>\n	</tbody></table>', 'Overdue job', 5, 1, 1, '2018-10-29 16:02:02', '2018-10-29 18:25:34'),
(10, 'For job Delivery', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\n        <meta name=\"format-detection\" content=\"telephone=no\"> <!-- disable auto telephone linking in iOS -->\n        <title></title>\n\n		<link href=\"https://fonts.googleapis.com/css?family=Roboto\" rel=\"stylesheet\">\n		<style>\n			html, body, p {\n				font-family: \'Roboto\', sans-serif;\n				font-size: 14px;\n			}\n		</style>\n\n	\n    \n       <table style=\"display: table;border-collapse: separate;box-sizing: border-box;\" border=\"0\" width=\"100%\" align=\"center\">\n		<tbody><tr>\n			<td>\n				<table style=\"border: 1px solid #c9d6df;border-radius:20px;box-sizing: border-box;border-collapse: collapse; border: 1px solid #d1c7c7 !important;background-color: #fff;\" border=\"1\" width=\"600\" align=\"center\">\n					<tbody><tr>\n						<td>\n							<table style=\"display: table;border-collapse: separate;box-sizing: border-box;box-sizing: border-box;border-collapse: collapse;\" border=\"0\" align=\"center\" width=\"100%\">\n						    	<tbody>\n									<tr>\n										<td style=\"padding: 15px;/* height: 50px; */background-color: #efefef;border-bottom: 1px solid #bfbfbf;\">\n											<center>\n												<img src=\"http://103.239.146.251:898/tmsNew/assets/img/BeConnected_Logo.gif\" class=\"img-full\" alt=\"...\" style=\"max-height: 50px;width: 250px;\">\n											</center>\n										</td>  \n									</tr>\n									<!--<tr>-->\n										<!--<td><span style=\"height: 1px;width: 100%;background-color: #d1c7c7;display: block;\">&nbsp;</span></td>-->\n									<!--</tr>-->\n									<tr> \n										<td style=\"padding: 15px;\">\n											<div>\n    <div><span>Hi there!</span></div>\n    <div> </div>\n    <div><span>The following job has been delivered :</span></div>\n</div>\n<div> </div>\n<div><span><b>JOB:</b></span></div>\n<div><span>[JOBNO]</span>\n    <p><span><b>DESCRIPTION:</b></span><br><span>[JOBDESCRIPTION]</span></p>\n    <span><b>COMMENT:</b></span><br><span>[DELIVERYNOTE]</span></div></td> \n									</tr>\n									<tr>\n										<td style=\"padding: 5px;background-color: #efefef;border-top: 1px solid #b5b5b5;\">\n											<center>\n												<div style=\"text-align: left;\"><span style=\"/* color: #060606; */\">For more information, visit us at <a style=\"color: #000000;\" href=\"http://www.beconnected.no\"><u>www.beconnected.no</u></a> or <u style=\"color: rgb(255, 255, 255);\"><a style=\"color: #000000;\" href=\"http://www.beconnected.bg\">www.beconnected.bg</a>.</u></span></div><div style=\"text-align: left;\"><span style=\"color: #ffffff;\"><u style=\"color: rgb(255, 255, 255);\"><br></u></span></div>\n<div> </div>\n<div style=\"text-align: left;\"><span style=\"/* color: #000000; */\"><em>This email and any attachments to it may be confidential and are intended solely for the use of the individual to whom it is addressed. If you are not the intended recipient of this email, you must neither take any action based upon its contents, nor copy or show it to anyone. If you have received this transmission in error, please use the reply function to tell us and then permanently delete what you have received.</em></span></div>\n<div> </div>\n<div> </div>\n<div>\n<div><a href=\"https://www.facebook.com/beconnectedbulgaria?_rdr=p\" target=\"_blank\" rel=\"noopener\"><img src=\"http://i.imgur.com/EgYFhb9.png\" alt=\"\" width=\"39\" height=\"38\"></a>   <img src=\"http://i.imgur.com/pG5yZd6.png//www.dropbox.com/preview/BeConnected%20AS/IT/E-post/Ikoner/BeConnected_zps34203a72.PNG\" alt=\"\" width=\"84\" height=\"37\">    <img src=\"http://i.imgur.com/wQ9lihL.png\" alt=\"\" width=\"75\" height=\"27\">      </div>\n</div>\n\n											</center>\n										</td>\n									</tr>\n								</tbody>\n							</table>\n						</td>\n					</tr>\n				</tbody></table>\n			</td>\n		</tr>\n	</tbody></table>', 'Job Delivery', 6, 1, 1, '2018-10-29 18:29:14', '2018-10-31 19:16:07');

-- --------------------------------------------------------

--
-- Table structure for table `tms_emojitext`
--

CREATE TABLE `tms_emojitext` (
  `id` int(11) NOT NULL,
  `emojiname` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emojipic` text CHARACTER SET utf8mb4,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tms_emojitext`
--

INSERT INTO `tms_emojitext` (`id`, `emojiname`, `emojipic`, `created_date`) VALUES
(1, ':)', '😃', '2021-05-07 13:11:29'),
(2, ':p', '😛', '2021-05-07 13:15:26'),
(3, ':blush', '😊', '2021-05-07 13:15:49'),
(4, ':o', '😮', '2021-05-07 13:16:40'),
(5, ';)', '😉', '2021-05-07 13:17:32'),
(6, ':(', '😒', '2021-05-07 13:20:59'),
(7, ';p', '😜', '2021-05-07 13:21:22'),
(8, ':\'(', '😢', '2021-05-07 13:21:42'),
(9, ':o)', '😮', '2021-05-07 13:22:02'),
(10, ':*', '💋', '2021-05-07 13:23:00'),
(11, '</3', '💔', '2021-05-07 13:25:38'),
(12, ':>', '😆', '2021-05-07 13:26:08'),
(13, '>:(', '😠', '2021-05-07 13:27:39'),
(14, ':-)', '🙂', '2021-05-07 13:28:31'),
(15, ':\'(', '😢', '2021-05-07 13:30:56'),
(16, '):', '😞', '2021-05-07 13:31:34'),
(17, ':-\\\\\\\\', '😕', '2021-05-07 13:32:08'),
(18, '<\\\\/3', '💔', '2021-05-07 13:32:54'),
(19, '8)', '😎', '2021-05-07 13:33:18'),
(20, ':|', '😐', '2021-05-07 13:33:41'),
(21, '<3', '❤️', '2021-05-07 13:34:04');

-- --------------------------------------------------------

--
-- Table structure for table `tms_events`
--

CREATE TABLE `tms_events` (
  `event_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `start` varchar(255) NOT NULL,
  `end` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tms_favourite_menu`
--

CREATE TABLE `tms_favourite_menu` (
  `fvrt_menu_id` int(11) NOT NULL,
  `iUserId` int(11) NOT NULL,
  `menu_json` text NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_favourite_menu`
--

INSERT INTO `tms_favourite_menu` (`fvrt_menu_id`, `iUserId`, `menu_json`, `created_date`, `updated_date`) VALUES
(1, 1, '[{\"fvMenuUrl\":\"#/dashboard1\",\"fvMenuName\":\"Dashboard\"},{\"fvMenuUrl\":\"#/Order-status-report\",\"fvMenuName\":\"Status Report - Orders\"},{\"fvMenuUrl\":\"#/user/2\",\"fvMenuName\":\"External Resource\"},{\"fvMenuUrl\":\"knowledge/#/\",\"fvMenuName\":\"Knowledge Base\"},{\"fvMenuUrl\":\"#/overview-report\",\"fvMenuName\":\"Overview Reports\"}]', '2018-12-20 18:17:50', '2022-11-17 22:32:58');

-- --------------------------------------------------------

--
-- Table structure for table `tms_filemanager`
--

CREATE TABLE `tms_filemanager` (
  `fmanager_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `job_id` varchar(255) NOT NULL,
  `client_id` int(11) NOT NULL,
  `in_client_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `is_default_folder` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = false,1 = true',
  `is_project_folder` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 = false,1 = true',
  `is_ex_project_folder` tinyint(4) NOT NULL DEFAULT '0' COMMENT '	0 = false,1 = true	',
  `f_id` int(11) NOT NULL,
  `ext` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_filemanager`
--

INSERT INTO `tms_filemanager` (`fmanager_id`, `role_id`, `name`, `parent_id`, `order_id`, `job_id`, `client_id`, `in_client_id`, `user_id`, `item_id`, `is_default_folder`, `is_project_folder`, `is_ex_project_folder`, `f_id`, `ext`, `size`, `created_date`, `updated_date`) VALUES
(1, 0, 'capita-001', 0, '', '', 1, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-10-31 20:13:04', '2022-10-31 20:13:04'),
(2, 0, 'Data', 1, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-10-31 20:13:04', '2022-10-31 20:13:04'),
(3, 0, 'Projects', 1, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-10-31 20:13:04', '2022-10-31 20:13:04'),
(4, 0, 'Invoice', 1, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-10-31 20:13:04', '2022-10-31 20:13:04'),
(5, 0, 'berbatranslationss.l.-002', 0, '', '', 2, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-10-31 20:15:38', '2022-10-31 20:15:38'),
(6, 0, 'Data', 5, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-10-31 20:15:38', '2022-10-31 20:15:38'),
(7, 0, 'Projects', 5, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-10-31 20:15:38', '2022-10-31 20:15:38'),
(8, 0, 'Invoice', 5, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-10-31 20:15:38', '2022-10-31 20:15:38'),
(9, 0, 'datawordsdatasiasarl-003', 0, '', '', 3, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-10-31 20:24:51', '2022-10-31 20:24:51'),
(10, 0, 'Data', 9, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-10-31 20:24:51', '2022-10-31 20:24:51'),
(11, 0, 'Projects', 9, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-10-31 20:24:51', '2022-10-31 20:24:51'),
(12, 0, 'Invoice', 9, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-10-31 20:24:51', '2022-10-31 20:24:51'),
(13, 0, 'internal-0002', 0, '', '', 0, 0, 2, 0, 0, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 0, 'internal-0003', 0, '', '', 0, 0, 3, 0, 0, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 0, 'external-0001', 0, '', '', 0, 0, 4, 0, 0, 0, 0, 0, '', '', '2022-11-01 12:57:31', '2022-11-01 12:57:31'),
(16, 0, 'Data', 15, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 0, 'Projects', 15, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 0, 'Invoice', 15, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 0, 'kanhasoft-004', 0, '', '', 4, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-01 13:03:57', '2022-11-01 13:03:57'),
(20, 0, 'Data', 19, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-11-01 13:03:57', '2022-11-01 13:03:57'),
(21, 0, 'Projects', 19, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-11-01 13:03:57', '2022-11-01 13:03:57'),
(22, 0, 'Invoice', 19, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-11-01 13:03:57', '2022-11-01 13:03:57'),
(23, 0, 'Indirect client', 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-01 00:00:00', '2022-11-01 00:00:00'),
(24, 0, 'acckanhasoft-001', 0, '', '', 0, 1, 0, 0, 0, 0, 0, 0, '', '', '2022-11-01 13:17:59', '2022-11-01 13:17:59'),
(25, 0, 'KNH160001', 21, '3', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 0, 'Jobs', 25, '3', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 0, 'Item001', 25, '3', '', 0, 0, 0, 1, 0, 0, 0, 0, '', '', '2022-11-01 14:18:06', '2022-11-01 14:18:06'),
(28, 0, 'BAD001', 26, '3', '1', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-01 14:18:58', '2022-11-01 14:18:58'),
(29, 0, '_in', 28, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-01 14:18:58', '2022-11-01 14:18:58'),
(30, 0, '_out', 28, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-01 14:18:58', '2022-11-01 14:18:58'),
(31, 0, 'microsoft-002', 0, '', '', 0, 2, 0, 0, 0, 0, 0, 0, '', '', '2022-11-02 18:09:16', '2022-11-02 18:09:16'),
(33, 0, 'spellup-003', 0, '', '', 0, 3, 0, 0, 0, 0, 0, 0, '', '', '2022-11-02 18:33:07', '2022-11-02 18:33:07'),
(34, 0, 'KNH160002', 21, '10', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 0, 'Jobs', 34, '10', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 0, 'KNH160003', 21, '11', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 0, 'Jobs', 36, '11', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 0, 'KNH160004', 21, '12', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 0, 'Jobs', 38, '12', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 0, 'KNH160005', 21, '20', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 0, 'Jobs', 44, '20', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 0, 'KNH160006', 21, '21', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 0, 'Jobs', 50, '21', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 0, 'icstranslate-005', 0, '', '', 5, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-03 20:08:34', '2022-11-03 20:08:34'),
(53, 0, 'Data', 52, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-11-03 20:08:34', '2022-11-03 20:08:34'),
(54, 0, 'Projects', 52, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-11-03 20:08:34', '2022-11-03 20:08:34'),
(55, 0, 'Invoice', 52, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-11-03 20:08:34', '2022-11-03 20:08:34'),
(56, 0, 'SPE220001', 7, '24', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 0, 'Jobs', 56, '24', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 0, 'SPE220002', 7, '25', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 0, 'Jobs', 58, '25', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 0, 'Item001', 58, '25', '', 0, 0, 0, 4, 0, 0, 0, 0, '', '', '2022-11-03 21:10:55', '2022-11-03 21:10:55'),
(61, 0, 'SEO001', 59, '25', '4', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-03 21:14:51', '2022-11-03 21:14:51'),
(62, 0, '_in', 61, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-03 21:14:51', '2022-11-03 21:14:51'),
(63, 0, '_out', 61, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-03 21:14:51', '2022-11-03 21:14:51'),
(64, 0, 'DTC002', 59, '25', '5', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-03 21:14:51', '2022-11-03 21:14:51'),
(65, 0, '_in', 64, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-03 21:14:51', '2022-11-03 21:14:51'),
(66, 0, '_out', 64, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-03 21:14:51', '2022-11-03 21:14:51'),
(67, 0, 'DTP003', 59, '25', '6', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-03 21:14:51', '2022-11-03 21:14:51'),
(68, 0, '_in', 67, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-03 21:14:51', '2022-11-03 21:14:51'),
(69, 0, '_out', 67, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-03 21:14:51', '2022-11-03 21:14:51'),
(70, 0, 'SPE220003', 54, '27', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 0, 'Jobs', 70, '27', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 0, 'Item001', 70, '27', '', 0, 0, 0, 5, 0, 0, 0, 0, '', '', '2022-11-03 21:58:10', '2022-11-03 21:58:10'),
(73, 0, 'BAD001', 71, '27', '7', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-03 22:00:58', '2022-11-03 22:00:58'),
(74, 0, '_in', 73, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-03 22:00:58', '2022-11-03 22:00:58'),
(75, 0, '_out', 73, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-03 22:00:58', '2022-11-03 22:00:58'),
(77, 0, 'Data', 76, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-11-04 11:26:31', '2022-11-04 11:26:31'),
(78, 0, 'Projects', 76, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-11-04 11:26:31', '2022-11-04 11:26:31'),
(79, 0, 'Invoice', 76, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-11-04 11:26:31', '2022-11-04 11:26:31'),
(80, 0, 'SPE220004', 54, '29', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 0, 'Jobs', 80, '29', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 0, 'Item001', 80, '29', '', 0, 0, 0, 6, 0, 0, 0, 0, '', '', '2022-11-04 16:28:26', '2022-11-04 16:28:26'),
(83, 0, 'PRF001', 81, '29', '8', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-04 16:29:47', '2022-11-04 16:29:47'),
(84, 0, '_in', 83, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-04 16:29:47', '2022-11-04 16:29:47'),
(85, 0, '_out', 83, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-04 16:29:47', '2022-11-04 16:29:47'),
(86, 0, 'SPE220005', 11, '31', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 0, 'Jobs', 86, '31', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 0, 'Item001', 86, '31', '', 0, 0, 0, 7, 0, 0, 0, 0, '', '', '2022-11-04 16:41:18', '2022-11-04 16:41:18'),
(89, 1, '341_Purchase_Order_PO-DWFR-2022-21665.pdf', 88, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '132.68 KB', '2022-11-04 16:43:08', '2022-11-04 16:43:08'),
(90, 0, 'PRF001', 87, '31', '9', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-04 16:43:32', '2022-11-04 16:43:32'),
(91, 0, '_in', 90, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-04 16:43:32', '2022-11-04 16:43:32'),
(92, 0, '_out', 90, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-04 16:43:32', '2022-11-04 16:43:32'),
(93, 0, 'SPE220006', 11, '33', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 0, 'Jobs', 93, '33', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 0, 'Item001', 93, '33', '', 0, 0, 0, 8, 0, 0, 0, 0, '', '', '2022-11-04 16:48:58', '2022-11-04 16:48:58'),
(96, 1, '419_Purchase_Order_PO-DWFR-2022-21692.pdf', 95, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '132.80 KB', '2022-11-04 16:52:34', '2022-11-04 16:52:34'),
(97, 0, 'TRA001', 94, '33', '10', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-04 16:54:14', '2022-11-04 16:54:14'),
(98, 0, '_in', 97, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-04 16:54:14', '2022-11-04 16:54:14'),
(99, 0, '_out', 97, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-04 16:54:14', '2022-11-04 16:54:14'),
(102, 1, '210_ds_notes', 24, '', '', 0, 0, 0, 0, 0, 0, 0, 1, '210_ds_notes', '235 bytes', '2022-11-07 12:27:18', '2022-11-07 12:27:18'),
(103, 1, '740_ds_notes', 24, '', '', 0, 0, 0, 0, 0, 0, 0, 1, '740_ds_notes', '235 bytes', '2022-11-07 12:29:05', '2022-11-07 12:29:05'),
(104, 1, '594_ds_notes', 24, '', '', 0, 0, 0, 0, 0, 0, 0, 1, '594_ds_notes', '235 bytes', '2022-11-07 12:30:06', '2022-11-07 12:30:06'),
(105, 1, '673_sample1.txt', 24, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'txt', '607 bytes', '2022-11-07 12:51:47', '2022-11-07 12:51:47'),
(106, 0, 'KNH160007', 21, '36', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 0, 'Jobs', 106, '36', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, 0, 'SPE220007', 54, '37', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, 0, 'Jobs', 118, '37', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, 0, 'Item001', 118, '37', '', 0, 0, 0, 13, 0, 0, 0, 0, '', '', '2022-11-08 13:44:43', '2022-11-08 13:44:43'),
(121, 0, 'PRF001', 119, '37', '13', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-08 13:46:03', '2022-11-08 13:46:03'),
(122, 0, '_in', 121, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-08 13:46:03', '2022-11-08 13:46:03'),
(123, 0, '_out', 121, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-08 13:46:03', '2022-11-08 13:46:03'),
(124, 0, 'truepartners-004', 0, '', '', 0, 4, 0, 0, 0, 0, 0, 0, '', '', '2022-11-08 13:47:59', '2022-11-08 13:47:59'),
(125, 0, 'SPE220008', 54, '38', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 0, 'Jobs', 125, '38', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 0, 'Item001', 125, '38', '', 0, 0, 0, 14, 0, 0, 0, 0, '', '', '2022-11-08 13:49:08', '2022-11-08 13:49:08'),
(128, 0, 'PRF001', 126, '38', '14', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-08 13:50:31', '2022-11-08 13:50:31'),
(129, 0, '_in', 128, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-08 13:50:31', '2022-11-08 13:50:31'),
(130, 0, '_out', 128, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-08 13:50:31', '2022-11-08 13:50:31'),
(131, 0, 'KNH160008', 21, '39', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, 0, 'Jobs', 131, '39', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, 0, 'KNH160009', 21, '40', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 0, 'Jobs', 134, '40', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, 0, 'KNH160010', 21, '41', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, 0, 'Jobs', 138, '41', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, 0, 'internal-0005', 0, '', '', 0, 0, 7, 0, 0, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, 0, 'KNH160011', 21, '43', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, 0, 'Jobs', 145, '43', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, 0, 'Data', 148, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-11-08 17:50:04', '2022-11-08 17:50:04'),
(150, 0, 'Projects', 148, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-11-08 17:50:04', '2022-11-08 17:50:04'),
(151, 0, 'Invoice', 148, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-11-08 17:50:04', '2022-11-08 17:50:04'),
(152, 0, 'chanel-005', 0, '', '', 0, 5, 0, 0, 0, 0, 0, 0, '', '', '2022-11-08 18:02:37', '2022-11-08 18:02:37'),
(153, 0, 'SPE220009', 11, '46', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, 0, 'Jobs', 153, '46', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, 0, 'Item001', 153, '46', '', 0, 0, 0, 20, 0, 0, 0, 0, '', '', '2022-11-08 18:03:17', '2022-11-08 18:03:17'),
(156, 0, 'PRF001', 154, '46', '16', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-08 18:07:08', '2022-11-08 18:07:08'),
(157, 0, '_in', 156, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-08 18:07:08', '2022-11-08 18:07:08'),
(158, 0, '_out', 156, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-08 18:07:08', '2022-11-08 18:07:08'),
(162, 1, '714_ds_notes', 14, '', '', 0, 0, 0, 0, 0, 0, 0, 1, '714_ds_notes', '235 bytes', '2022-11-09 11:29:19', '2022-11-09 11:29:19'),
(163, 0, 'external-0002', 0, '', '', 0, 0, 8, 0, 0, 0, 0, 0, '', '', '2022-11-09 15:23:55', '2022-11-09 15:23:55'),
(164, 0, 'Data', 163, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(165, 0, 'Projects', 163, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(166, 0, 'Invoice', 163, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(168, 0, 'Data', 167, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(169, 0, 'Projects', 167, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, 0, 'Invoice', 167, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(171, 0, 'external-0004', 0, '', '', 0, 0, 10, 0, 0, 0, 0, 0, '', '', '2022-11-09 18:36:52', '2022-11-09 18:36:52'),
(172, 0, 'Data', 171, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(173, 0, 'Projects', 171, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(174, 0, 'Invoice', 171, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(176, 0, 'Data', 175, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, 0, 'Projects', 175, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(178, 0, 'Invoice', 175, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, 0, 'jtlanguagesolutions-006', 0, '', '', 8, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-10 15:52:44', '2022-11-10 15:52:44'),
(180, 0, 'Data', 179, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-11-10 15:52:44', '2022-11-10 15:52:44'),
(181, 0, 'Projects', 179, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-11-10 15:52:44', '2022-11-10 15:52:44'),
(182, 0, 'Invoice', 179, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-11-10 15:52:44', '2022-11-10 15:52:44'),
(183, 0, 'SPE220010', 181, '49', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(184, 0, 'Jobs', 183, '49', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, 0, 'Item001', 183, '49', '', 0, 0, 0, 21, 0, 0, 0, 0, '', '', '2022-11-10 16:00:54', '2022-11-10 16:00:54'),
(186, 0, 'TRA001', 184, '49', '18', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-10 16:01:37', '2022-11-10 16:01:37'),
(187, 0, '_in', 186, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-10 16:01:37', '2022-11-10 16:01:37'),
(188, 0, '_out', 186, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-10 16:01:37', '2022-11-10 16:01:37'),
(189, 0, 'hill´spet-006', 0, '', '', 0, 6, 0, 0, 0, 0, 0, 0, '', '', '2022-11-10 16:35:55', '2022-11-10 16:35:55'),
(190, 0, 'SPE220011', 11, '51', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(191, 0, 'Jobs', 190, '51', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(192, 0, 'Item001', 190, '51', '', 0, 0, 0, 22, 0, 0, 0, 0, '', '', '2022-11-10 16:36:42', '2022-11-10 16:36:42'),
(193, 0, 'PRF001', 191, '51', '19', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-10 16:38:34', '2022-11-10 16:38:34'),
(194, 0, '_in', 193, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-10 16:38:34', '2022-11-10 16:38:34'),
(195, 0, '_out', 193, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-10 16:38:34', '2022-11-10 16:38:34'),
(197, 0, 'Data', 196, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198, 0, 'Projects', 196, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(199, 0, 'Invoice', 196, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(200, 1, '58_ds_notes', 14, '', '', 0, 0, 0, 0, 0, 0, 0, 1, '58_ds_notes', '235 bytes', '2022-11-11 14:57:04', '2022-11-11 14:57:04'),
(201, 1, '1000_ds_notes', 0, '', '', 0, 0, 0, 0, 0, 0, 0, 1, '1000_ds_notes', '235 bytes', '2022-11-11 14:57:47', '2022-11-11 14:57:47'),
(202, 1, '37_ds_notes', 0, '', '', 0, 0, 0, 0, 0, 0, 0, 1, '37_ds_notes', '235 bytes', '2022-11-11 14:58:38', '2022-11-11 14:58:38'),
(203, 1, '557_ds_notes', 0, '', '', 0, 0, 0, 0, 0, 0, 0, 1, '557_ds_notes', '235 bytes', '2022-11-11 15:08:48', '2022-11-11 15:08:48'),
(205, 0, 'scorewarriorlimited-007', 0, '', '', 9, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 16:05:59', '2022-11-11 16:05:59'),
(206, 0, 'Data', 205, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-11-11 16:05:59', '2022-11-11 16:05:59'),
(207, 0, 'Projects', 205, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-11-11 16:05:59', '2022-11-11 16:05:59'),
(208, 0, 'Invoice', 205, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-11-11 16:05:59', '2022-11-11 16:05:59'),
(209, 0, 'scorewarrior-007', 0, '', '', 0, 7, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 16:21:36', '2022-11-11 16:21:36'),
(210, 0, 'SPEU_0001', 207, '55', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(211, 0, 'Jobs', 210, '55', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(212, 0, 'Item001', 210, '55', '', 0, 0, 0, 23, 0, 0, 0, 0, '', '', '2022-11-11 16:23:38', '2022-11-11 16:23:38'),
(213, 0, 'Item002', 210, '55', '', 0, 0, 0, 24, 0, 0, 0, 0, '', '', '2022-11-11 16:23:38', '2022-11-11 16:23:38'),
(214, 0, 'Item003', 210, '55', '', 0, 0, 0, 25, 0, 0, 0, 0, '', '', '2022-11-11 16:23:38', '2022-11-11 16:23:38'),
(215, 0, 'Item004', 210, '55', '', 0, 0, 0, 26, 0, 0, 0, 0, '', '', '2022-11-11 16:23:38', '2022-11-11 16:23:38'),
(216, 0, 'Item005', 210, '55', '', 0, 0, 0, 27, 0, 0, 0, 0, '', '', '2022-11-11 16:23:38', '2022-11-11 16:23:38'),
(217, 0, 'TRA001', 211, '55', '20', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 16:35:00', '2022-11-11 16:35:00'),
(218, 0, '_in', 217, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 16:35:00', '2022-11-11 16:35:00'),
(219, 0, '_out', 217, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 16:35:00', '2022-11-11 16:35:00'),
(220, 0, 'TRA002', 211, '55', '21', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 16:35:36', '2022-11-11 16:35:36'),
(221, 0, '_in', 220, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 16:35:36', '2022-11-11 16:35:36'),
(222, 0, '_out', 220, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 16:35:36', '2022-11-11 16:35:36'),
(223, 0, 'TRA003', 211, '55', '22', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 16:36:49', '2022-11-11 16:36:49'),
(224, 0, '_in', 223, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 16:36:49', '2022-11-11 16:36:49'),
(225, 0, '_out', 223, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 16:36:49', '2022-11-11 16:36:49'),
(226, 0, 'TRA004', 211, '55', '23', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 16:38:58', '2022-11-11 16:38:58'),
(227, 0, '_in', 226, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 16:38:58', '2022-11-11 16:38:58'),
(228, 0, '_out', 226, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 16:38:58', '2022-11-11 16:38:58'),
(229, 0, 'TRA005', 211, '55', '24', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 16:39:52', '2022-11-11 16:39:52'),
(230, 0, '_in', 229, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 16:39:52', '2022-11-11 16:39:52'),
(231, 0, '_out', 229, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 16:39:52', '2022-11-11 16:39:52'),
(232, 0, 'Item006', 210, '55', '', 0, 0, 0, 28, 0, 0, 0, 0, '', '', '2022-11-11 16:49:38', '2022-11-11 16:49:38'),
(233, 0, 'Item007', 210, '55', '', 0, 0, 0, 29, 0, 0, 0, 0, '', '', '2022-11-11 16:49:38', '2022-11-11 16:49:38'),
(234, 0, 'Item008', 210, '55', '', 0, 0, 0, 30, 0, 0, 0, 0, '', '', '2022-11-11 16:49:38', '2022-11-11 16:49:38'),
(235, 0, 'Item009', 210, '55', '', 0, 0, 0, 31, 0, 0, 0, 0, '', '', '2022-11-11 16:49:38', '2022-11-11 16:49:38'),
(236, 0, 'Item010', 210, '55', '', 0, 0, 0, 32, 0, 0, 0, 0, '', '', '2022-11-11 16:49:38', '2022-11-11 16:49:38'),
(237, 0, 'TRA006', 211, '55', '25', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 16:50:29', '2022-11-11 16:50:29'),
(238, 0, '_in', 237, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 16:50:29', '2022-11-11 16:50:29'),
(239, 0, '_out', 237, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 16:50:29', '2022-11-11 16:50:29'),
(240, 0, 'TRA007', 211, '55', '26', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 17:15:13', '2022-11-11 17:15:13'),
(241, 0, '_in', 240, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 17:15:13', '2022-11-11 17:15:13'),
(242, 0, '_out', 240, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 17:15:13', '2022-11-11 17:15:13'),
(243, 0, 'TRA008', 211, '55', '27', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 17:16:35', '2022-11-11 17:16:35'),
(244, 0, '_in', 243, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 17:16:35', '2022-11-11 17:16:35'),
(245, 0, '_out', 243, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 17:16:35', '2022-11-11 17:16:35'),
(246, 0, 'TRA009', 211, '55', '28', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 17:18:03', '2022-11-11 17:18:03'),
(247, 0, '_in', 246, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 17:18:03', '2022-11-11 17:18:03'),
(248, 0, '_out', 246, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 17:18:03', '2022-11-11 17:18:03'),
(249, 0, 'TRA010', 211, '55', '29', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 17:18:42', '2022-11-11 17:18:42'),
(250, 0, '_in', 249, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 17:18:42', '2022-11-11 17:18:42'),
(251, 0, '_out', 249, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 17:18:42', '2022-11-11 17:18:42'),
(252, 0, 'Item011', 210, '55', '', 0, 0, 0, 33, 0, 0, 0, 0, '', '', '2022-11-11 17:19:05', '2022-11-11 17:19:05'),
(253, 0, 'Item012', 210, '55', '', 0, 0, 0, 34, 0, 0, 0, 0, '', '', '2022-11-11 17:19:05', '2022-11-11 17:19:05'),
(254, 0, 'Item013', 210, '55', '', 0, 0, 0, 35, 0, 0, 0, 0, '', '', '2022-11-11 17:19:05', '2022-11-11 17:19:05'),
(255, 0, 'Item014', 210, '55', '', 0, 0, 0, 36, 0, 0, 0, 0, '', '', '2022-11-11 17:19:05', '2022-11-11 17:19:05'),
(256, 0, 'TRA011', 211, '55', '30', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 17:20:40', '2022-11-11 17:20:40'),
(257, 0, '_in', 256, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 17:20:40', '2022-11-11 17:20:40'),
(258, 0, '_out', 256, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 17:20:40', '2022-11-11 17:20:40'),
(259, 0, 'TRA012', 211, '55', '31', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 17:21:22', '2022-11-11 17:21:22'),
(260, 0, '_in', 259, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 17:21:22', '2022-11-11 17:21:22'),
(261, 0, '_out', 259, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 17:21:22', '2022-11-11 17:21:22'),
(262, 0, 'TRA013', 211, '55', '32', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 17:21:55', '2022-11-11 17:21:55'),
(263, 0, '_in', 262, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 17:21:55', '2022-11-11 17:21:55'),
(264, 0, '_out', 262, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 17:21:55', '2022-11-11 17:21:55'),
(265, 0, 'TRA014', 211, '55', '33', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 17:22:31', '2022-11-11 17:22:31'),
(266, 0, '_in', 265, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 17:22:31', '2022-11-11 17:22:31'),
(267, 0, '_out', 265, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 17:22:31', '2022-11-11 17:22:31'),
(268, 0, 'Item015', 210, '55', '', 0, 0, 0, 37, 0, 0, 0, 0, '', '', '2022-11-11 18:59:01', '2022-11-11 18:59:01'),
(269, 0, 'TRA015', 211, '55', '34', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 19:00:30', '2022-11-11 19:00:30'),
(270, 0, '_in', 269, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 19:00:30', '2022-11-11 19:00:30'),
(271, 0, '_out', 269, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-11 19:00:30', '2022-11-11 19:00:30'),
(272, 0, 'SPE220012', 3, '56', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(273, 0, 'Jobs', 272, '56', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(274, 0, 'Item001', 272, '56', '', 0, 0, 0, 38, 0, 0, 0, 0, '', '', '2022-11-11 21:02:49', '2022-11-11 21:02:49'),
(275, 0, 'Item002', 272, '56', '', 0, 0, 0, 39, 0, 0, 0, 0, '', '', '2022-11-11 21:02:49', '2022-11-11 21:02:49'),
(276, 0, 'KNH160012', 21, '57', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(277, 0, 'Jobs', 276, '57', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(283, 0, 'gaminginnovationgroup(gig)-008', 0, '', '', 0, 8, 0, 0, 0, 0, 0, 0, '', '', '2022-11-16 16:25:32', '2022-11-16 16:25:32'),
(284, 0, 'SPE220013', 54, '59', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(285, 0, 'Jobs', 284, '59', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(286, 0, 'Item001', 284, '59', '', 0, 0, 0, 42, 0, 0, 0, 0, '', '', '2022-11-16 16:27:05', '2022-11-16 16:27:05'),
(287, 0, 'PRF001', 285, '59', '36', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-16 16:27:56', '2022-11-16 16:27:56'),
(288, 0, '_in', 287, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-16 16:27:56', '2022-11-16 16:27:56'),
(289, 0, '_out', 287, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-16 16:27:56', '2022-11-16 16:27:56'),
(290, 0, 'uniclub-009', 0, '', '', 0, 9, 0, 0, 0, 0, 0, 0, '', '', '2022-11-16 16:31:57', '2022-11-16 16:31:57'),
(291, 0, 'SPE220014', 54, '61', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(292, 0, 'Jobs', 291, '61', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(293, 0, 'Item001', 291, '61', '', 0, 0, 0, 43, 0, 0, 0, 0, '', '', '2022-11-16 16:34:49', '2022-11-16 16:34:49'),
(294, 0, 'PRF001', 292, '61', '37', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-16 16:36:00', '2022-11-16 16:36:00'),
(295, 0, '_in', 294, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-16 16:36:00', '2022-11-16 16:36:00'),
(296, 0, '_out', 294, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-16 16:36:00', '2022-11-16 16:36:00'),
(297, 0, 'maxsuninternational(hk)ltd-008', 0, '', '', 10, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-16 16:46:14', '2022-11-16 16:46:14'),
(298, 0, 'Data', 297, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-11-16 16:46:14', '2022-11-16 16:46:14'),
(299, 0, 'Projects', 297, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-11-16 16:46:14', '2022-11-16 16:46:14'),
(300, 0, 'Invoice', 297, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-11-16 16:46:14', '2022-11-16 16:46:14'),
(301, 0, 'SPE_0001', 299, '62', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(302, 0, 'Jobs', 301, '62', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(303, 0, 'Item001', 301, '62', '', 0, 0, 0, 44, 0, 0, 0, 0, '', '', '2022-11-16 16:50:37', '2022-11-16 16:50:37'),
(304, 0, 'TRA001', 302, '62', '38', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-16 16:51:34', '2022-11-16 16:51:34'),
(305, 0, '_in', 304, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-16 16:51:34', '2022-11-16 16:51:34'),
(306, 0, '_out', 304, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-16 16:51:34', '2022-11-16 16:51:34'),
(307, 0, 'intrawelt-009', 0, '', '', 11, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-16 16:59:08', '2022-11-16 16:59:08'),
(308, 0, 'Data', 307, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-11-16 16:59:08', '2022-11-16 16:59:08'),
(309, 0, 'Projects', 307, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-11-16 16:59:08', '2022-11-16 16:59:08'),
(310, 0, 'Invoice', 307, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-11-16 16:59:08', '2022-11-16 16:59:08'),
(311, 0, 'SPE_0002', 309, '63', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(312, 0, 'Jobs', 311, '63', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(313, 0, 'Item001', 311, '63', '', 0, 0, 0, 45, 0, 0, 0, 0, '', '', '2022-11-16 17:01:17', '2022-11-16 17:01:17'),
(314, 0, 'TRA001', 312, '63', '39', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-16 17:02:28', '2022-11-16 17:02:28'),
(315, 0, '_in', 314, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-16 17:02:28', '2022-11-16 17:02:28'),
(316, 0, '_out', 314, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-16 17:02:28', '2022-11-16 17:02:28'),
(317, 0, 'skinceuticals-010', 0, '', '', 0, 10, 0, 0, 0, 0, 0, 0, '', '', '2022-11-16 17:04:59', '2022-11-16 17:04:59'),
(318, 0, 'SPE220015', 11, '64', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(319, 0, 'Jobs', 318, '64', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(320, 0, 'Item001', 318, '64', '', 0, 0, 0, 46, 0, 0, 0, 0, '', '', '2022-11-16 17:06:02', '2022-11-16 17:06:02'),
(321, 0, 'PRF001', 319, '64', '40', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-16 17:06:41', '2022-11-16 17:06:41'),
(322, 0, '_in', 321, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-16 17:06:41', '2022-11-16 17:06:41'),
(323, 0, '_out', 321, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-16 17:06:41', '2022-11-16 17:06:41'),
(325, 0, 'Data', 324, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(326, 0, 'Projects', 324, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(327, 0, 'Invoice', 324, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(328, 0, 'KNH160013', 21, '66', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(329, 0, 'Jobs', 328, '66', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(331, 0, 'KNH160014', 21, '67', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(332, 0, 'Jobs', 331, '67', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(341, 0, 'ingvildtestclient-010', 0, '', '', 12, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-18 00:12:21', '2022-11-18 00:12:21'),
(342, 0, 'Data', 341, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-11-18 00:12:21', '2022-11-18 00:12:21'),
(343, 0, 'Projects', 341, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-11-18 00:12:21', '2022-11-18 00:12:21'),
(344, 0, 'Invoice', 341, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-11-18 00:12:21', '2022-11-18 00:12:21'),
(345, 0, 'SPE_0003', 343, '72', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(346, 0, 'Jobs', 345, '72', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(347, 0, 'Item001', 345, '72', '', 0, 0, 0, 50, 0, 0, 0, 0, '', '', '2022-11-18 00:52:10', '2022-11-18 00:52:10'),
(348, 0, 'TRA001', 346, '72', '43', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-18 00:57:53', '2022-11-18 00:57:53'),
(349, 0, '_in', 348, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-18 00:57:53', '2022-11-18 00:57:53'),
(350, 0, '_out', 348, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-18 00:57:54', '2022-11-18 00:57:54'),
(351, 0, 'internal-0006', 0, '', '', 0, 0, 14, 0, 0, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(353, 0, 'Data', 352, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-11-18 15:52:06', '2022-11-18 15:52:06'),
(354, 0, 'Projects', 352, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-11-18 15:52:06', '2022-11-18 15:52:06'),
(355, 0, 'Invoice', 352, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-11-18 15:52:06', '2022-11-18 15:52:06'),
(356, 0, 'SPE220016', 11, '74', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(357, 0, 'Jobs', 356, '74', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(358, 0, 'Item001', 356, '74', '', 0, 0, 0, 51, 0, 0, 0, 0, '', '', '2022-11-18 23:52:38', '2022-11-18 23:52:38'),
(359, 0, 'PRF001', 357, '74', '44', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-18 23:53:36', '2022-11-18 23:53:36'),
(360, 0, '_in', 359, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-18 23:53:36', '2022-11-18 23:53:36'),
(361, 0, '_out', 359, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-18 23:53:36', '2022-11-18 23:53:36'),
(362, 0, 'SPE220017', 11, '76', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(363, 0, 'Jobs', 362, '76', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(364, 0, 'Item001', 362, '76', '', 0, 0, 0, 52, 0, 0, 0, 0, '', '', '2022-11-18 23:57:33', '2022-11-18 23:57:33'),
(365, 0, 'PRF001', 363, '76', '45', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-18 23:58:25', '2022-11-18 23:58:25'),
(366, 0, '_in', 365, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-18 23:58:25', '2022-11-18 23:58:25'),
(367, 0, '_out', 365, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-11-18 23:58:25', '2022-11-18 23:58:25'),
(384, 0, 'KNH160015', 21, '80', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(385, 0, 'Jobs', 384, '80', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(394, 0, 'external-0005', 0, '', '', 0, 0, 16, 0, 0, 0, 0, 0, '', '', '2022-11-26 18:24:31', '2022-11-26 18:24:31'),
(395, 0, 'Data', 394, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(396, 0, 'Projects', 394, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(397, 0, 'Invoice', 394, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(399, 0, 'external-0006', 0, '', '', 0, 0, 18, 0, 0, 0, 0, 0, '', '', '2022-11-29 13:11:08', '2022-11-29 13:11:08'),
(400, 0, 'Data', 399, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(401, 0, 'Projects', 399, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(402, 0, 'Invoice', 399, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(403, 0, 'external-0007', 0, '', '', 0, 0, 19, 0, 0, 0, 0, 0, '', '', '2022-11-30 17:41:51', '2022-11-30 17:41:51'),
(404, 0, 'Data', 403, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(405, 0, 'Projects', 403, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(406, 0, 'Invoice', 403, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(407, 0, 'SPE22,SPE_0001', 54, '83', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(408, 0, 'Jobs', 407, '83', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(409, 0, 'Item001', 407, '83', '', 0, 0, 0, 55, 0, 0, 0, 0, '', '', '2022-12-01 16:00:51', '2022-12-01 16:00:51'),
(410, 0, 'PRF001', 408, '83', '53', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 16:01:48', '2022-12-01 16:01:48'),
(411, 0, '_in', 410, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 16:01:48', '2022-12-01 16:01:48'),
(412, 0, '_out', 410, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 16:01:48', '2022-12-01 16:01:48'),
(413, 0, 'SPE22,SPE_0002', 54, '84', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(414, 0, 'Jobs', 413, '84', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(415, 0, 'Item001', 413, '84', '', 0, 0, 0, 56, 0, 0, 0, 0, '', '', '2022-12-01 16:09:36', '2022-12-01 16:09:36'),
(416, 0, 'PRF001', 414, '84', '54', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 16:10:13', '2022-12-01 16:10:13'),
(417, 0, '_in', 416, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 16:10:13', '2022-12-01 16:10:13'),
(418, 0, '_out', 416, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 16:10:13', '2022-12-01 16:10:13'),
(419, 0, 'technoalpin-011', 0, '', '', 0, 11, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 16:26:55', '2022-12-01 16:26:55'),
(420, 0, 'SPE_0004', 309, '86', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(421, 0, 'Jobs', 420, '86', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(422, 0, 'Item001', 420, '86', '', 0, 0, 0, 57, 0, 0, 0, 0, '', '', '2022-12-01 16:28:46', '2022-12-01 16:28:46'),
(423, 0, 'TRA001', 421, '86', '55', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 16:31:39', '2022-12-01 16:31:39'),
(424, 0, '_in', 423, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 16:31:39', '2022-12-01 16:31:39'),
(425, 0, '_out', 423, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 16:31:39', '2022-12-01 16:31:39'),
(426, 0, 'lingsoft-010', 0, '', '', 14, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 17:03:16', '2022-12-01 17:03:16'),
(427, 0, 'Data', 426, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-12-01 17:03:16', '2022-12-01 17:03:16'),
(428, 0, 'Projects', 426, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-12-01 17:03:16', '2022-12-01 17:03:16'),
(429, 0, 'Invoice', 426, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-12-01 17:03:16', '2022-12-01 17:03:16'),
(430, 0, 'parkerhannifin-012', 0, '', '', 0, 12, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 17:12:37', '2022-12-01 17:12:37'),
(431, 0, 'SPE_0005', 428, '87', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(432, 0, 'Jobs', 431, '87', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(433, 0, 'Item001', 431, '87', '', 0, 0, 0, 58, 0, 0, 0, 0, '', '', '2022-12-01 17:14:47', '2022-12-01 17:14:47'),
(434, 0, 'PRF001', 432, '87', '56', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 17:16:22', '2022-12-01 17:16:22'),
(435, 0, '_in', 434, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 17:16:22', '2022-12-01 17:16:22'),
(436, 0, '_out', 434, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 17:16:22', '2022-12-01 17:16:22'),
(437, 0, 'SPE22,SPE_0003', 54, '88', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(438, 0, 'Jobs', 437, '88', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(439, 0, 'Item001', 437, '88', '', 0, 0, 0, 59, 0, 0, 0, 0, '', '', '2022-12-01 17:51:16', '2022-12-01 17:51:16'),
(440, 0, 'PRF001', 438, '88', '57', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 17:51:58', '2022-12-01 17:51:58'),
(441, 0, '_in', 440, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 17:51:58', '2022-12-01 17:51:58'),
(442, 0, '_out', 440, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 17:51:58', '2022-12-01 17:51:58'),
(443, 0, 'iloq-013', 0, '', '', 0, 13, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 18:06:20', '2022-12-01 18:06:20'),
(444, 0, 'SPE_0006', 428, '89', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(445, 0, 'Jobs', 444, '89', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(446, 0, 'Item001', 444, '89', '', 0, 0, 0, 60, 0, 0, 0, 0, '', '', '2022-12-01 18:07:40', '2022-12-01 18:07:40'),
(447, 0, 'TRA001', 445, '89', '58', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 18:09:54', '2022-12-01 18:09:54'),
(448, 0, '_in', 447, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 18:09:54', '2022-12-01 18:09:54'),
(449, 0, '_out', 447, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 18:09:54', '2022-12-01 18:09:54'),
(450, 0, 'ecolab-014', 0, '', '', 0, 14, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 19:16:54', '2022-12-01 19:16:54'),
(451, 0, 'SPE_0007', 428, '91', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(452, 0, 'Jobs', 451, '91', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(453, 0, 'Item001', 451, '91', '', 0, 0, 0, 61, 0, 0, 0, 0, '', '', '2022-12-01 19:18:15', '2022-12-01 19:18:15'),
(454, 0, 'TRA001', 452, '91', '59', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 19:22:01', '2022-12-01 19:22:01'),
(455, 0, '_in', 454, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 19:22:01', '2022-12-01 19:22:01'),
(456, 0, '_out', 454, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 19:22:01', '2022-12-01 19:22:01'),
(457, 0, 'intertranslations-010', 0, '', '', 15, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 19:45:31', '2022-12-01 19:45:31'),
(458, 0, 'Data', 457, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-12-01 19:45:31', '2022-12-01 19:45:31'),
(459, 0, 'Projects', 457, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-12-01 19:45:31', '2022-12-01 19:45:31'),
(460, 0, 'Invoice', 457, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-12-01 19:45:31', '2022-12-01 19:45:31'),
(461, 0, 'SPE_0008', 459, '92', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(462, 0, 'Jobs', 461, '92', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(463, 0, 'Item001', 461, '92', '', 0, 0, 0, 62, 0, 0, 0, 0, '', '', '2022-12-01 19:47:46', '2022-12-01 19:47:46'),
(464, 0, 'PRF001', 462, '92', '60', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 19:48:20', '2022-12-01 19:48:20'),
(465, 0, '_in', 464, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 19:48:20', '2022-12-01 19:48:20'),
(466, 0, '_out', 464, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 19:48:20', '2022-12-01 19:48:20'),
(467, 0, 'qontentgroup-010', 0, '', '', 16, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 20:02:28', '2022-12-01 20:02:28'),
(468, 0, 'Data', 467, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-12-01 20:02:28', '2022-12-01 20:02:28'),
(469, 0, 'Projects', 467, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-12-01 20:02:28', '2022-12-01 20:02:28'),
(470, 0, 'Invoice', 467, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-12-01 20:02:29', '2022-12-01 20:02:29'),
(471, 0, 'SPE_0009', 469, '93', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(472, 0, 'Jobs', 471, '93', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(473, 0, 'Item001', 471, '93', '', 0, 0, 0, 63, 0, 0, 0, 0, '', '', '2022-12-01 20:04:59', '2022-12-01 20:04:59'),
(474, 0, 'PRF001', 472, '93', '61', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 20:05:20', '2022-12-01 20:05:20'),
(475, 0, '_in', 474, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 20:05:20', '2022-12-01 20:05:20'),
(476, 0, '_out', 474, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 20:05:20', '2022-12-01 20:05:20'),
(477, 0, 'SPE_0010', 309, '94', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(478, 0, 'Jobs', 477, '94', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(479, 0, 'Item001', 477, '94', '', 0, 0, 0, 64, 0, 0, 0, 0, '', '', '2022-12-01 20:16:22', '2022-12-01 20:16:22'),
(480, 0, 'TRA001', 478, '94', '62', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 20:17:27', '2022-12-01 20:17:27'),
(481, 0, '_in', 480, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 20:17:27', '2022-12-01 20:17:27'),
(482, 0, '_out', 480, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 20:17:27', '2022-12-01 20:17:27'),
(483, 0, 'SPE22,SPE_0004', 54, '95', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(484, 0, 'Jobs', 483, '95', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(485, 0, 'Item001', 483, '95', '', 0, 0, 0, 65, 0, 0, 0, 0, '', '', '2022-12-01 20:25:28', '2022-12-01 20:25:28'),
(486, 0, 'PRF001', 484, '95', '63', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 20:27:04', '2022-12-01 20:27:04'),
(487, 0, '_in', 486, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 20:27:04', '2022-12-01 20:27:04'),
(488, 0, '_out', 486, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 20:27:04', '2022-12-01 20:27:04'),
(489, 0, 'SPE220018', 11, '96', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(490, 0, 'Jobs', 489, '96', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(491, 0, 'Item001', 489, '96', '', 0, 0, 0, 66, 0, 0, 0, 0, '', '', '2022-12-01 20:41:04', '2022-12-01 20:41:04'),
(492, 0, 'PRF001', 490, '96', '64', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 20:41:51', '2022-12-01 20:41:51'),
(493, 0, '_in', 492, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 20:41:51', '2022-12-01 20:41:51'),
(494, 0, '_out', 492, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 20:41:51', '2022-12-01 20:41:51'),
(495, 0, 'SPE220019', 11, '97', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(496, 0, 'Jobs', 495, '97', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(497, 0, 'Item001', 495, '97', '', 0, 0, 0, 67, 0, 0, 0, 0, '', '', '2022-12-01 20:46:09', '2022-12-01 20:46:09'),
(498, 0, 'PRF001', 496, '97', '65', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 20:46:54', '2022-12-01 20:46:54'),
(499, 0, '_in', 498, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 20:46:54', '2022-12-01 20:46:54'),
(500, 0, '_out', 498, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 20:46:54', '2022-12-01 20:46:54'),
(501, 0, 'loxam-015', 0, '', '', 0, 15, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 20:50:12', '2022-12-01 20:50:12'),
(502, 0, 'SPE220020', 11, '98', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(503, 0, 'Jobs', 502, '98', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(504, 0, 'Item001', 502, '98', '', 0, 0, 0, 68, 0, 0, 0, 0, '', '', '2022-12-01 20:51:03', '2022-12-01 20:51:03'),
(505, 0, 'PRF001', 503, '98', '66', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 20:53:50', '2022-12-01 20:53:50'),
(506, 0, '_in', 505, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 20:53:50', '2022-12-01 20:53:50'),
(507, 0, '_out', 505, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 20:53:50', '2022-12-01 20:53:50'),
(508, 0, 'SPE220021', 11, '99', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(509, 0, 'Jobs', 508, '99', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(510, 0, 'Item001', 508, '99', '', 0, 0, 0, 69, 0, 0, 0, 0, '', '', '2022-12-01 22:03:30', '2022-12-01 22:03:30'),
(511, 0, 'PRF001', 509, '99', '67', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 22:04:08', '2022-12-01 22:04:08'),
(512, 0, '_in', 511, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 22:04:08', '2022-12-01 22:04:08'),
(513, 0, '_out', 511, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 22:04:08', '2022-12-01 22:04:08'),
(514, 0, 'SPE220022', 11, '101', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(515, 0, 'Jobs', 514, '101', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(516, 0, 'Item001', 514, '101', '', 0, 0, 0, 70, 0, 0, 0, 0, '', '', '2022-12-01 22:12:44', '2022-12-01 22:12:44'),
(517, 0, 'PRF001', 515, '101', '68', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 22:13:23', '2022-12-01 22:13:23'),
(518, 0, '_in', 517, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 22:13:23', '2022-12-01 22:13:23'),
(519, 0, '_out', 517, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 22:13:23', '2022-12-01 22:13:23'),
(520, 0, 'SPE220023', 11, '102', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(521, 0, 'Jobs', 520, '102', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(522, 0, 'Item001', 520, '102', '', 0, 0, 0, 71, 0, 0, 0, 0, '', '', '2022-12-01 22:20:12', '2022-12-01 22:20:12'),
(523, 0, 'PRF001', 521, '102', '69', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 22:20:35', '2022-12-01 22:20:35'),
(524, 0, '_in', 523, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 22:20:35', '2022-12-01 22:20:35'),
(525, 0, '_out', 523, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 22:20:35', '2022-12-01 22:20:35'),
(526, 0, 'SPE220024', 11, '104', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(527, 0, 'Jobs', 526, '104', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tms_filemanager` (`fmanager_id`, `role_id`, `name`, `parent_id`, `order_id`, `job_id`, `client_id`, `in_client_id`, `user_id`, `item_id`, `is_default_folder`, `is_project_folder`, `is_ex_project_folder`, `f_id`, `ext`, `size`, `created_date`, `updated_date`) VALUES
(528, 0, 'Item001', 526, '104', '', 0, 0, 0, 72, 0, 0, 0, 0, '', '', '2022-12-01 22:42:21', '2022-12-01 22:42:21'),
(529, 0, 'PRF001', 527, '104', '70', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 22:43:02', '2022-12-01 22:43:02'),
(530, 0, '_in', 529, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 22:43:02', '2022-12-01 22:43:02'),
(531, 0, '_out', 529, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 22:43:02', '2022-12-01 22:43:02'),
(532, 0, 'SPE220025', 11, '105', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(533, 0, 'Jobs', 532, '105', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(534, 0, 'Item001', 532, '105', '', 0, 0, 0, 73, 0, 0, 0, 0, '', '', '2022-12-01 23:00:45', '2022-12-01 23:00:45'),
(535, 0, 'PRF001', 533, '105', '71', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 23:01:40', '2022-12-01 23:01:40'),
(536, 0, '_in', 535, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 23:01:40', '2022-12-01 23:01:40'),
(537, 0, '_out', 535, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 23:01:40', '2022-12-01 23:01:40'),
(538, 0, 'SPE22,SPE_0005', 54, '106', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(539, 0, 'Jobs', 538, '106', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(540, 0, 'Item001', 538, '106', '', 0, 0, 0, 74, 0, 0, 0, 0, '', '', '2022-12-02 14:28:36', '2022-12-02 14:28:36'),
(541, 0, 'PRF001', 539, '106', '72', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-02 14:29:35', '2022-12-02 14:29:35'),
(542, 0, '_in', 541, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-02 14:29:35', '2022-12-02 14:29:35'),
(543, 0, '_out', 541, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-02 14:29:35', '2022-12-02 14:29:35'),
(544, 0, 'SPE220026', 11, '107', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(545, 0, 'Jobs', 544, '107', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(546, 0, 'Item001', 544, '107', '', 0, 0, 0, 75, 0, 0, 0, 0, '', '', '2022-12-02 14:36:33', '2022-12-02 14:36:33'),
(547, 0, 'PRF001', 545, '107', '73', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-02 14:37:26', '2022-12-02 14:37:26'),
(548, 0, '_in', 547, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-02 14:37:26', '2022-12-02 14:37:26'),
(549, 0, '_out', 547, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-02 14:37:26', '2022-12-02 14:37:26'),
(550, 0, 'SPE220027', 11, '108', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(551, 0, 'Jobs', 550, '108', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(552, 0, 'Item001', 550, '108', '', 0, 0, 0, 76, 0, 0, 0, 0, '', '', '2022-12-02 14:46:08', '2022-12-02 14:46:08'),
(553, 0, 'PRF001', 551, '108', '74', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-02 14:47:14', '2022-12-02 14:47:14'),
(554, 0, '_in', 553, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-02 14:47:14', '2022-12-02 14:47:14'),
(555, 0, '_out', 553, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-02 14:47:14', '2022-12-02 14:47:14'),
(556, 0, 'd&g(dolcegabbana)-016', 0, '', '', 0, 16, 0, 0, 0, 0, 0, 0, '', '', '2022-12-02 14:51:29', '2022-12-02 14:51:29'),
(557, 0, 'SPE220028', 11, '109', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(558, 0, 'Jobs', 557, '109', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(559, 0, 'Item001', 557, '109', '', 0, 0, 0, 77, 0, 0, 0, 0, '', '', '2022-12-02 14:53:42', '2022-12-02 14:53:42'),
(560, 0, 'TRA001', 558, '109', '75', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-02 14:54:37', '2022-12-02 14:54:37'),
(561, 0, '_in', 560, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-02 14:54:37', '2022-12-02 14:54:37'),
(562, 0, '_out', 560, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-02 14:54:37', '2022-12-02 14:54:37'),
(579, 0, 'SPE22,SPE_0006', 3, '110', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(580, 0, 'Jobs', 579, '110', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(585, 0, 'external-0008', 0, '', '', 0, 0, 20, 0, 0, 0, 0, 0, '', '', '2022-12-04 23:01:46', '2022-12-04 23:01:46'),
(586, 0, 'Data', 585, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(587, 0, 'Projects', 585, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(588, 0, 'Invoice', 585, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(589, 0, 'fasttranslator-010', 0, '', '', 17, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-05 20:42:24', '2022-12-05 20:42:24'),
(590, 0, 'Data', 589, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-12-05 20:42:24', '2022-12-05 20:42:24'),
(591, 0, 'Projects', 589, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-12-05 20:42:24', '2022-12-05 20:42:24'),
(592, 0, 'Invoice', 589, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-12-05 20:42:24', '2022-12-05 20:42:24'),
(593, 0, 'SPEU_0002', 591, '111', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(594, 0, 'Jobs', 593, '111', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(595, 0, 'Item001', 593, '111', '', 0, 0, 0, 83, 0, 0, 0, 0, '', '', '2022-12-05 20:45:58', '2022-12-05 20:45:58'),
(596, 0, 'TRA001', 594, '111', '81', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-05 20:47:07', '2022-12-05 20:47:07'),
(597, 0, '_in', 596, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-05 20:47:07', '2022-12-05 20:47:07'),
(598, 0, '_out', 596, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-05 20:47:07', '2022-12-05 20:47:07'),
(599, 0, 'pierrefabre-017', 0, '', '', 0, 17, 0, 0, 0, 0, 0, 0, '', '', '2022-12-05 20:57:46', '2022-12-05 20:57:46'),
(600, 0, 'SPEU_0003', 11, '112', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(601, 0, 'Jobs', 600, '112', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(602, 0, 'Item001', 600, '112', '', 0, 0, 0, 84, 0, 0, 0, 0, '', '', '2022-12-05 20:59:31', '2022-12-05 20:59:31'),
(603, 0, 'TRA001', 601, '112', '82', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-05 21:00:00', '2022-12-05 21:00:00'),
(604, 0, '_in', 603, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-05 21:00:00', '2022-12-05 21:00:00'),
(605, 0, '_out', 603, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-05 21:00:00', '2022-12-05 21:00:00'),
(606, 0, 'SPEU_0004', 11, '113', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(607, 0, 'Jobs', 606, '113', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(608, 0, 'Item001', 606, '113', '', 0, 0, 0, 85, 0, 0, 0, 0, '', '', '2022-12-05 21:25:46', '2022-12-05 21:25:46'),
(609, 0, 'PRF001', 607, '113', '83', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-05 21:26:40', '2022-12-05 21:26:40'),
(610, 0, '_in', 609, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-05 21:26:40', '2022-12-05 21:26:40'),
(611, 0, '_out', 609, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-05 21:26:40', '2022-12-05 21:26:40'),
(612, 0, 'SPE_0007', 309, '114', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(613, 0, 'Jobs', 612, '114', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(614, 0, 'Item001', 612, '114', '', 0, 0, 0, 86, 0, 0, 0, 0, '', '', '2022-12-05 21:29:08', '2022-12-05 21:29:08'),
(615, 0, 'TRA001', 613, '114', '84', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-05 21:29:49', '2022-12-05 21:29:49'),
(616, 0, '_in', 615, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-05 21:29:49', '2022-12-05 21:29:49'),
(617, 0, '_out', 615, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-05 21:29:49', '2022-12-05 21:29:49'),
(618, 0, 'SPE_0008', 428, '116', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(619, 0, 'Jobs', 618, '116', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(620, 0, 'Item001', 618, '116', '', 0, 0, 0, 87, 0, 0, 0, 0, '', '', '2022-12-06 17:29:24', '2022-12-06 17:29:24'),
(621, 0, 'TRA001', 619, '116', '85', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-06 17:31:59', '2022-12-06 17:31:59'),
(622, 0, '_in', 621, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-06 17:31:59', '2022-12-06 17:31:59'),
(623, 0, '_out', 621, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-06 17:31:59', '2022-12-06 17:31:59'),
(624, 0, 'SPE_0009', 469, '117', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(625, 0, 'Jobs', 624, '117', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(626, 0, 'Item001', 624, '117', '', 0, 0, 0, 88, 0, 0, 0, 0, '', '', '2022-12-06 17:40:46', '2022-12-06 17:40:46'),
(627, 0, 'TRA001', 625, '117', '86', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-06 17:41:21', '2022-12-06 17:41:21'),
(628, 0, '_in', 627, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-06 17:41:21', '2022-12-06 17:41:21'),
(629, 0, '_out', 627, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-06 17:41:21', '2022-12-06 17:41:21'),
(630, 0, 'SPEU_0005', 591, '118', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(631, 0, 'Jobs', 630, '118', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(632, 0, 'Item001', 630, '118', '', 0, 0, 0, 89, 0, 0, 0, 0, '', '', '2022-12-07 21:18:53', '2022-12-07 21:18:53'),
(633, 0, 'TRA001', 631, '118', '87', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-07 21:19:36', '2022-12-07 21:19:36'),
(634, 0, '_in', 633, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-07 21:19:36', '2022-12-07 21:19:36'),
(635, 0, '_out', 633, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-07 21:19:36', '2022-12-07 21:19:36'),
(636, 0, 'supertextag-010', 0, '', '', 18, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-07 21:22:23', '2022-12-07 21:22:23'),
(637, 0, 'Data', 636, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-12-07 21:22:23', '2022-12-07 21:22:23'),
(638, 0, 'Projects', 636, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-12-07 21:22:23', '2022-12-07 21:22:23'),
(639, 0, 'Invoice', 636, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-12-07 21:22:23', '2022-12-07 21:22:23'),
(640, 0, 'twitchinteractive-018', 0, '', '', 0, 18, 0, 0, 0, 0, 0, 0, '', '', '2022-12-07 21:24:35', '2022-12-07 21:24:35'),
(641, 0, 'SPEU_0006', 638, '120', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(642, 0, 'Jobs', 641, '120', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(643, 0, 'Item001', 641, '120', '', 0, 0, 0, 90, 0, 0, 0, 0, '', '', '2022-12-07 21:25:25', '2022-12-07 21:25:25'),
(644, 0, 'PRF001', 642, '120', '88', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-07 21:26:05', '2022-12-07 21:26:05'),
(645, 0, '_in', 644, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-07 21:26:05', '2022-12-07 21:26:05'),
(646, 0, '_out', 644, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-07 21:26:05', '2022-12-07 21:26:05'),
(647, 0, 'SPE_0010', 428, '125', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(648, 0, 'Jobs', 647, '125', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(649, 0, 'Item001', 647, '125', '', 0, 0, 0, 91, 0, 0, 0, 0, '', '', '2022-12-12 17:39:42', '2022-12-12 17:39:42'),
(650, 0, 'PRF001', 648, '125', '89', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-12 17:42:26', '2022-12-12 17:42:26'),
(651, 0, '_in', 650, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-12 17:42:26', '2022-12-12 17:42:26'),
(652, 0, '_out', 650, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-12 17:42:26', '2022-12-12 17:42:26'),
(653, 0, 'tesla-019', 0, '', '', 0, 19, 0, 0, 0, 0, 0, 0, '', '', '2022-12-12 17:45:05', '2022-12-12 17:45:05'),
(654, 0, 'SPE_0011', 428, '126', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(655, 0, 'Jobs', 654, '126', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(656, 0, 'Item001', 654, '126', '', 0, 0, 0, 92, 0, 0, 0, 0, '', '', '2022-12-12 17:46:10', '2022-12-12 17:46:10'),
(657, 0, 'TRA001', 655, '126', '90', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-12 17:50:51', '2022-12-12 17:50:51'),
(658, 0, '_in', 657, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-12 17:50:51', '2022-12-12 17:50:51'),
(659, 0, '_out', 657, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-12 17:50:51', '2022-12-12 17:50:51'),
(660, 0, 'SPE_0012', 428, '127', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(661, 0, 'Jobs', 660, '127', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(662, 0, 'Item001', 660, '127', '', 0, 0, 0, 93, 0, 0, 0, 0, '', '', '2022-12-12 17:54:45', '2022-12-12 17:54:45'),
(663, 0, 'TRA001', 661, '127', '91', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-12 17:56:24', '2022-12-12 17:56:24'),
(664, 0, '_in', 663, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-12 17:56:24', '2022-12-12 17:56:24'),
(665, 0, '_out', 663, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-12 17:56:24', '2022-12-12 17:56:24'),
(666, 0, 'SPEU_0007', 638, '128', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(667, 0, 'Jobs', 666, '128', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(668, 0, 'Item001', 666, '128', '', 0, 0, 0, 94, 0, 0, 0, 0, '', '', '2022-12-12 17:59:55', '2022-12-12 17:59:55'),
(669, 0, 'PRF001', 667, '128', '92', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-12 18:00:43', '2022-12-12 18:00:43'),
(670, 0, '_in', 669, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-12 18:00:43', '2022-12-12 18:00:43'),
(671, 0, '_out', 669, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-12 18:00:43', '2022-12-12 18:00:43'),
(672, 0, 'SPE_0013', 428, '129', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(673, 0, 'Jobs', 672, '129', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(674, 0, 'Item001', 672, '129', '', 0, 0, 0, 95, 0, 0, 0, 0, '', '', '2022-12-12 18:02:49', '2022-12-12 18:02:49'),
(675, 0, 'TRA001', 673, '129', '93', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-12 18:04:13', '2022-12-12 18:04:13'),
(676, 0, '_in', 675, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-12 18:04:13', '2022-12-12 18:04:13'),
(677, 0, '_out', 675, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-12 18:04:13', '2022-12-12 18:04:13');

-- --------------------------------------------------------

--
-- Table structure for table `tms_general`
--

CREATE TABLE `tms_general` (
  `general_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_no` varchar(255) NOT NULL,
  `order_date` datetime NOT NULL,
  `company_code` varchar(255) NOT NULL,
  `project_name` varchar(255) NOT NULL,
  `project_type` int(11) NOT NULL,
  `project_createdBy` int(255) DEFAULT NULL,
  `due_date` varchar(255) NOT NULL,
  `specialization` varchar(255) NOT NULL,
  `email_subj` varchar(255) NOT NULL,
  `project_status` varchar(255) NOT NULL,
  `no_of_items` int(11) DEFAULT NULL COMMENT 'No of Items in Item section',
  `heads_up` tinyint(1) DEFAULT NULL,
  `expected_start_date` datetime DEFAULT NULL,
  `project_price` float NOT NULL DEFAULT '0',
  `project_start_status` tinyint(1) NOT NULL COMMENT '1 for started,0 for not started ',
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_general`
--

INSERT INTO `tms_general` (`general_id`, `order_id`, `order_no`, `order_date`, `company_code`, `project_name`, `project_type`, `project_createdBy`, `due_date`, `specialization`, `email_subj`, `project_status`, `no_of_items`, `heads_up`, `expected_start_date`, `project_price`, `project_start_status`, `created_date`, `modified_date`) VALUES
(1, 3, 'KNH160001', '2022-11-01 14:17:00', '', 'Kanhasoft test proj1', 0, 1, '2022-11-04 14:17', '1,16,27,5', '', '4', 0, 0, NULL, 0, 0, '2022-11-01 14:18:00', '2022-12-06 18:30:23'),
(2, 10, 'KNH160002', '2022-11-03 10:27:00', '', 'Test_Project', 0, 1, '2022-11-04 10:27', '39', '', '4', 0, 1, '2022-11-03 10:28:00', 0, 0, '2022-11-03 10:28:30', '2022-11-03 10:29:05'),
(3, 11, 'KNH160003', '2022-11-03 10:33:00', '', 'Testing_New_Project', 0, 1, '2022-11-08 12:34', '39,40', '', '4', 0, 0, NULL, 0, 0, '2022-11-03 10:34:20', '2022-11-03 10:34:35'),
(4, 12, 'KNH160004', '2022-11-03 10:46:00', '', 'Testing_one_demo', 0, 1, '2022-11-11 11:47', '40', '', '4', 0, 0, NULL, 0, 0, '2022-11-03 10:47:45', '2022-11-03 18:01:24'),
(5, 20, 'KNH160005', '2022-11-03 18:08:00', '', 'test0310', 0, 1, '2022-11-04 18:09', '7', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-03 18:07:32', '2022-11-03 18:07:32'),
(6, 21, 'KNH160006', '2022-11-03 18:12:00', '', 'tet', 0, 1, '2022-11-03 18:12', '7', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-03 18:11:02', '2022-11-03 18:11:02'),
(7, 24, 'SPE220001', '2022-11-03 16:30:00', '', 'SpellUp PROOF English - Norwegian', 0, 1, '2022-10-31 16:00', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-03 21:02:45', '2022-11-03 21:02:45'),
(8, 25, 'SPE220002', '2022-11-03 16:40:00', '', 'SpellUp PROOF EN-NO', 0, 1, '2022-10-31 16:00', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-03 21:10:39', '2022-11-03 21:10:39'),
(9, 27, 'SPE220003', '2022-11-03 17:27:00', '', 'SpellUp Proof EN-NO', 0, 1, '2022-11-03 17:00', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-03 21:58:05', '2022-11-03 21:58:05'),
(10, 29, 'SPE220004', '2022-11-04 11:57:00', '', 'SpellUp PRF EN-NO 145 GIMM00013', 0, 1, '2022-11-04 17:00', '4', '', '4', 0, 0, NULL, 0, 0, '2022-11-04 16:28:21', '2022-11-04 16:31:10'),
(11, 31, 'SPE220005', '2022-11-04 12:09:00', '', 'Spellup TRA EN-NO PRJ-06425 RODIAL : Nip+Fab Extreme4 Multi-Blur', 0, 1, '2022-11-03 12:00', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-04 16:40:56', '2022-11-04 16:40:56'),
(12, 33, 'SPE220006', '2022-11-04 12:18:00', '', 'Spellup TRA EN-NO PRJ-00862 DOLCE E G A B B A N A S R L : P21121522 - Progetti di Traduzione 2022', 0, 1, '2022-11-03 12:00', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-04 16:48:54', '2022-11-04 16:48:54'),
(13, 36, 'KNH160007', '2022-11-07 15:19:00', '', 'New_Demo_Test', 0, 1, '2022-11-07 16:19', '39,40', '', '4', 0, 0, NULL, 0, 0, '2022-11-07 15:20:07', '2022-11-07 15:26:55'),
(14, 37, 'SPE220007', '2022-11-08 09:12:00', '', 'SpellUp proof EN-NO 145 GIMM00013', 0, 1, '2022-11-04 09:00', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-08 13:44:35', '2022-11-08 13:44:35'),
(15, 38, 'SPE220008', '2022-11-08 09:18:00', '', 'TruePartners PRF EN-NO 1211 TPMM00129', 0, 1, '2022-11-04 09:00', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-08 13:49:03', '2022-11-08 13:49:03'),
(16, 39, 'KNH160008', '2022-11-08 10:02:00', '', 'Test email subject', 0, 1, '2022-11-08 10:00', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-08 14:37:24', '2022-11-08 14:37:24'),
(17, 40, 'KNH160009', '2022-11-08 10:14:00', '', 'Test email subject', 0, 1, '2022-11-08 10:00', '1', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-08 14:44:55', '2022-11-08 14:44:55'),
(18, 41, 'KNH160010', '2022-11-08 10:37:00', '', 'Test email subject', 0, 1, '2022-12-04 20:00', '1,3', '', '4', 0, 0, NULL, 0, 0, '2022-11-08 15:08:27', '2022-12-05 14:56:30'),
(19, 43, 'KNH160011', '2022-11-08 17:08:00', '', 'test', 0, 1, '2022-11-09 17:09', '7', '', '4', 0, 1, '2022-11-11 10:53:00', 0, 0, '2022-11-08 17:07:53', '2022-11-09 11:11:33'),
(20, 46, 'SPE220009', '2022-11-08 13:32:00', '', 'CHANEL PRF EN-NO PRJ-01371', 0, 1, '2022-11-08 17:00', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-08 18:03:13', '2022-11-08 18:03:13'),
(21, 49, 'SPE220010', '2022-11-10 11:30:00', '', 'Spellup PRF EN-NO', 0, 1, '2022-11-09 11:00', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-10 16:00:49', '2022-11-10 16:00:49'),
(22, 51, 'SPE220011', '2022-11-10 12:06:00', '', 'Hills Pet PRF EN-NOP22012642', 0, 1, '2022-11-16 12:00', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-10 16:36:38', '2022-11-10 16:36:38'),
(23, 55, 'SPEU_0001', '2022-11-11 11:51:00', '', 'Scorewarrior - Total Battle', 0, 7, '2022-12-19 17:00', '36', '', '4', 0, 0, NULL, 0, 0, '2022-11-11 16:23:15', '2022-11-23 10:20:05'),
(24, 56, 'SPE220012', '2022-11-11 17:30:00', '', 'Test_lifecycle_BeCon', 0, 1, '2022-11-14 17:00', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-11 21:02:41', '2022-11-11 21:02:41'),
(25, 57, 'KNH160012', '2022-11-14 14:27:00', '', 'test1411', 0, 1, '2022-11-14 14:28', '7', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-14 14:26:31', '2022-11-14 14:26:31'),
(26, 59, 'SPE220013', '2022-11-16 11:55:00', '', 'GiG  GIMM00015 - Ramses & Santa PRF EN-NO 158', 0, 1, '2022-11-14 11:00', '16', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-16 16:27:00', '2022-11-16 16:27:00'),
(27, 61, 'SPE220014', '2022-11-16 12:03:00', '', 'Uniclub UNRA00002 Welcome Chain and Support Tags (PR)  PRF EN-NO', 0, 1, '2022-11-15 12:00', '16', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-16 16:34:45', '2022-11-16 16:34:45'),
(28, 62, 'SPE_0001', '2022-11-16 12:19:00', '', 'SpellUp Hikvision2211039 TRA EN-NO 285', 0, 1, '2022-11-16 12:00', '37', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-16 16:50:32', '2022-11-16 16:50:32'),
(29, 63, 'SPE_0002', '2022-11-16 12:30:00', '', 'SpellUp PO/08039/22 TRA EN-NO 10K', 0, 1, '2022-11-15 12:00', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-16 17:01:14', '2022-11-16 17:01:14'),
(30, 64, 'SPE220015', '2022-11-16 12:35:00', '', 'SkinCeuticals P15010694 PRF EN-NO 1100', 0, 1, '2022-11-15 12:00', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-16 17:05:58', '2022-11-16 17:05:58'),
(31, 66, 'KNH160013', '2022-11-16 16:22:00', '', 'Test project name', 0, 1, '2022-11-17 16:00', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-16 20:54:13', '2022-11-16 20:54:13'),
(32, 67, 'KNH160014', '2022-11-16 16:29:00', '', 'TEST PROJECT NAME', 0, 1, '2022-11-17 16:00', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-16 21:00:23', '2022-11-16 21:00:23'),
(33, 72, 'SPE_0003', '2022-11-17 20:15:00', '', 'Ingvild Test Project', 0, 7, '2022-11-20 20:22', '4', '', '4', 0, 0, NULL, 0, 0, '2022-11-18 00:52:04', '2022-11-22 13:45:17'),
(34, 74, 'SPE220016', '2022-11-18 19:21:00', '', 'Hills pet P22012642  PRF EN-NO', 0, 1, '2022-11-17 19:00', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-18 23:52:34', '2022-11-18 23:52:34'),
(35, 76, 'SPE220017', '2022-11-18 19:26:00', '', 'CHANEL COCO CRUSH 2023 PRF EN-NO', 0, 1, '2022-11-18 19:00', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-18 23:57:29', '2022-11-18 23:57:29'),
(36, 80, 'KNH160015', '2022-11-24 15:02:00', '', 'To test the feasibility of applicataion', 0, 1, '2022-11-30 18:03', '37,39', '', '4', 0, 0, NULL, 0, 0, '2022-11-24 15:03:37', '2022-11-30 18:13:22'),
(37, 83, 'SPE_0001', '2022-12-01 11:29:00', '', 'GIG GIMM00016  Proof En-No 769', 0, 1, '2022-11-21 11:30', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-01 16:00:46', '2022-12-01 16:00:46'),
(38, 84, 'SPE_0002', '2022-12-01 11:38:00', '', 'GIG GIMM00017 - Megarush Footer Proof En-No 145', 0, 1, '2022-11-22 11:39', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-01 16:09:32', '2022-12-01 16:09:32'),
(39, 86, 'SPE_0004', '2022-12-01 11:57:00', '', 'TECHNO ALPIN  TRA EN-NO SO/6541/22 | T/38784/22', 0, 1, '2022-11-24 11:58', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-01 16:28:38', '2022-12-01 16:28:38'),
(40, 87, 'SPE_0005', '2022-12-01 12:42:00', '', 'Parker Hannifin 977427 / PARKCH_2211_P0117 PRF EN-NO', 0, 1, '2022-11-25 12:43', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-01 17:14:43', '2022-12-01 17:14:43'),
(41, 88, 'SPE_0003', '2022-12-01 13:17:00', '', 'GiG GIMM00019 - Megarush Weekend Tournament (proofreading NO) proof EN-NO 256', 0, 1, '2022-11-25 13:21', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-01 17:51:12', '2022-12-01 17:51:12'),
(42, 89, 'SPE_0006', '2022-12-01 13:36:00', '', 'iLOQ Manager 978325 TRA EN-NO 95', 0, 1, '2022-11-28 13:37', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-01 18:07:36', '2022-12-01 18:07:36'),
(43, 91, 'SPE_0007', '2022-12-01 14:47:00', '', 'Ecolab 977913 PE EN-NO 157', 0, 1, '2022-11-28 14:48', '44', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-01 19:18:12', '2022-12-01 19:18:12'),
(44, 92, 'SPE_0008', '2022-12-01 15:16:00', '', 'Test evaluation En-No', 0, 1, '2022-11-28 15:17', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-01 19:47:42', '2022-12-01 19:47:42'),
(45, 93, 'SPE_0009', '2022-12-01 15:34:00', '', 'SSR En-No', 0, 1, '2022-11-29 15:34', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-01 20:04:55', '2022-12-01 20:04:55'),
(46, 94, 'SPE_0010', '2022-12-01 15:45:00', '', 'TECHNO ALPIN  Registrierungsmail TRA EN-NO', 0, 1, '2022-11-30 15:46', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-01 20:16:19', '2022-12-01 20:16:19'),
(47, 95, 'SPE_0004', '2022-12-01 15:53:00', '', 'GiG GIMM00020 GMS 1849 Proof En-No 826', 0, 1, '2022-12-01 15:55', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-01 20:25:23', '2022-12-01 20:25:23'),
(48, 96, 'SPE220018', '2022-12-01 16:10:00', '', 'SpellUp DWFR-2022-23370 proof EN-NO', 0, 1, '2022-11-16 16:10', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-01 20:40:59', '2022-12-01 20:40:59'),
(49, 97, 'SPE220019', '2022-12-01 16:15:00', '', 'Chanel DWFR-2022-23606 PRF EN-NO', 0, 1, '2022-11-18 16:16', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-01 20:46:05', '2022-12-01 20:46:05'),
(50, 98, 'SPE220020', '2022-12-01 16:20:00', '', 'Loxam PRJ-04792  PRF EN-NO 107', 0, 1, '2022-11-18 16:20', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-01 20:50:59', '2022-12-01 20:50:59'),
(51, 99, 'SPE220021', '2022-12-01 17:32:00', '', 'Chanel 2022-23769 PRF EN-NO 296', 0, 1, '2022-11-21 17:33', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-01 22:03:26', '2022-12-01 22:03:26'),
(52, 101, 'SPE220022', '2022-12-01 17:41:00', '', 'LOXAM PRJ-04792 PRF EN-NO 626', 0, 1, '2022-11-21 17:42', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-01 22:12:41', '2022-12-01 22:12:41'),
(53, 102, 'SPE220023', '2022-12-01 17:48:00', '', 'Chanel PRJ-06115 PRF EN-NO', 0, 1, '2022-11-21 17:50', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-01 22:20:08', '2022-12-01 22:20:08'),
(54, 104, 'SPE220024', '2022-12-01 18:11:00', '', 'Loxam DWFR-2022-23948 PRF EN-NO 626', 0, 1, '2022-11-22 18:12', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-01 22:42:17', '2022-12-01 22:42:17'),
(55, 105, 'SPE220025', '2022-12-01 18:29:00', '', 'Chanel DWFR-2022-23962 PRF EN-NO1299', 0, 1, '2022-11-22 18:30', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-01 23:00:41', '2022-12-01 23:00:41'),
(56, 106, 'SPE_0005', '2022-12-02 09:57:00', '', 'Gig GIMM00018 - GMS 1902 proof En-No 189', 0, 1, '2022-11-23 14:00', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-02 14:28:29', '2022-12-02 14:28:29'),
(57, 107, 'SPE220026', '2022-12-02 10:05:00', '', 'HILLS PET -2022-24138  PRF EN-NO', 0, 1, '2022-11-24 10:00', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-02 14:36:22', '2022-12-02 14:36:22'),
(58, 108, 'SPE220027', '2022-12-02 10:14:00', '', 'Loxam 2022-24140 PRF EN-NO', 0, 1, '2022-11-24 12:00', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-02 14:46:05', '2022-12-02 14:46:05'),
(59, 109, 'SPE220028', '2022-12-02 10:22:00', '', 'DG P21121522 TRA EN-NO', 0, 1, '2022-11-25 11:00', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-02 14:53:38', '2022-12-02 14:53:38'),
(60, 110, 'SPE_0006', '2022-12-03 22:07:00', '', 'Test', 0, 1, '2022-12-10 22:08', '1,3,4', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-04 02:38:13', '2022-12-04 02:38:13'),
(61, 111, 'SPEU_0002', '2022-12-05 16:14:00', '', 'Spellup 555959 TRA EN-NO', 0, 1, '2022-12-02 16:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-05 20:45:52', '2022-12-05 20:45:52'),
(62, 112, 'SPEU_0003', '2022-12-05 16:28:00', '', 'Pierre Fabre PRJ-02384  TRA EN-NO', 0, 1, '2022-12-02 16:30', '5', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-05 20:59:27', '2022-12-05 20:59:27'),
(63, 113, 'SPEU_0004', '2022-12-05 16:55:00', '', 'Spellup PRJ-01474 PRF EN-NO 266', 0, 1, '2022-12-05 11:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-05 21:25:41', '2022-12-05 21:25:41'),
(64, 114, 'SPE_0007', '2022-12-05 16:57:00', '', 'TECHNO ALPIN  T/40044/22  TRA EN-NO', 0, 1, '2022-12-07 11:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-05 21:29:03', '2022-12-05 21:29:03'),
(65, 116, 'SPE_0008', '2022-12-06 12:58:00', '', 'iLOQ sustainability materials and report  978975 TRA EN-NO', 0, 14, '2022-12-09 12:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-06 17:29:20', '2022-12-06 17:29:20'),
(66, 117, 'SPE_0009', '2022-12-06 13:09:00', '', 'SpellUp RABCAT0019 TRA EN-NO', 0, 14, '2022-12-06 17:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-06 17:40:43', '2022-12-06 17:40:43'),
(67, 118, 'SPEU_0005', '2022-12-07 16:48:00', '', 'SpellUp 555870 TRA EN-NO', 0, 14, '2022-12-12 07:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-07 21:18:49', '2022-12-07 21:18:49'),
(68, 120, 'SPEU_0006', '2022-12-07 16:54:00', '', 'Twitch Interactive Inc 458310 PRF EN-NO 27', 0, 14, '2022-12-07 13:30', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-07 21:25:22', '2022-12-07 21:25:22'),
(69, 125, 'SPE_0010', '2022-12-12 13:08:00', '', 'Parker Hannifin 983550 PRF EN-NO', 0, 14, '2022-12-07 14:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-12 17:39:39', '2022-12-12 17:39:39'),
(70, 126, 'SPE_0011', '2022-12-12 13:15:00', '', 'Tesla 984030 TRA EN-NO 281', 0, 14, '2022-12-08 11:45', '5', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-12 17:46:06', '2022-12-12 17:46:06'),
(71, 127, 'SPE_0012', '2022-12-12 13:22:00', '', 'Tesla 984032 TRA EN-NO 1161', 0, 14, '2022-12-08 16:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-12 17:54:41', '2022-12-12 17:54:41'),
(72, 128, 'SPEU_0007', '2022-12-12 13:29:00', '', 'SpellUp 458977 PRF EN-NO 227', 0, 14, '2022-12-09 12:00', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-12 17:59:51', '2022-12-12 17:59:51'),
(73, 129, 'SPE_0013', '2022-12-12 13:31:00', '', 'iLOQ 984422 TRA EN-NO 228', 0, 14, '2022-12-09 17:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-12 18:02:45', '2022-12-12 18:02:45');

-- --------------------------------------------------------

--
-- Table structure for table `tms_invoice`
--

CREATE TABLE `tms_invoice` (
  `invoice_id` int(11) NOT NULL,
  `invoice_number` varchar(255) NOT NULL,
  `custom_invoice_no` varchar(255) NOT NULL,
  `freelance_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `job_id` varchar(255) NOT NULL,
  `value_date` datetime NOT NULL,
  `invoice_date` datetime NOT NULL,
  `payment_date` datetime NOT NULL,
  `paid_date` datetime NOT NULL,
  `payment_type` enum('Bank','Paypal') NOT NULL,
  `paid_amount` decimal(10,2) NOT NULL,
  `job_total` decimal(10,2) NOT NULL,
  `vat` varchar(255) NOT NULL,
  `Invoice_cost` decimal(10,2) NOT NULL,
  `invoice_type` varchar(255) NOT NULL,
  `invoice_status` varchar(255) NOT NULL DEFAULT 'Open',
  `is_approved` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1 - Approved, 0 - UnApproved',
  `reminder_sent` tinyint(2) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tms_invoice_client`
--

CREATE TABLE `tms_invoice_client` (
  `invoice_id` int(11) NOT NULL,
  `invoice_number` varchar(255) NOT NULL,
  `freelance_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `scoop_id` varchar(255) NOT NULL,
  `value_date` datetime NOT NULL,
  `invoice_date` datetime NOT NULL,
  `payment_date` datetime NOT NULL,
  `paid_date` datetime NOT NULL,
  `payment_type` enum('Bank','Paypal') NOT NULL,
  `paid_amount` decimal(10,2) NOT NULL,
  `item_total` decimal(10,2) NOT NULL,
  `vat` varchar(255) NOT NULL,
  `Invoice_cost` decimal(10,2) NOT NULL,
  `invoice_type` varchar(255) NOT NULL,
  `invoice_status` varchar(255) NOT NULL DEFAULT 'Open',
  `is_invoice_sent` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1 - Sent, 0 - Not Sent',
  `reminder_sent` tinyint(2) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tms_invoice_client_payments`
--

CREATE TABLE `tms_invoice_client_payments` (
  `partial_payment_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `invoice_partial_paid_amount` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tms_invoice_due_period`
--

CREATE TABLE `tms_invoice_due_period` (
  `invoice_due_id` int(11) NOT NULL,
  `number_of_days` int(11) NOT NULL,
  `due` int(11) NOT NULL,
  `not_paid` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_invoice_due_period`
--

INSERT INTO `tms_invoice_due_period` (`invoice_due_id`, `number_of_days`, `due`, `not_paid`, `created_date`, `modified_date`) VALUES
(1, 31, 1, 1, '2016-11-30 00:00:00', '2016-11-30 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tms_invoice_payments`
--

CREATE TABLE `tms_invoice_payments` (
  `partial_payment_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `invoice_partial_paid_amount` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_invoice_payments`
--

INSERT INTO `tms_invoice_payments` (`partial_payment_id`, `invoice_id`, `invoice_partial_paid_amount`, `created_date`) VALUES
(1, 1, '30', '2022-11-07 17:37:03'),
(2, 2, '50', '2022-11-07 17:37:23'),
(3, 1, '20', '2022-11-07 17:38:12'),
(4, 2, '50', '2022-11-07 17:38:28'),
(5, 4, '10', '2022-11-11 10:43:21');

-- --------------------------------------------------------

--
-- Table structure for table `tms_items`
--

CREATE TABLE `tms_items` (
  `itemId` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_number` varchar(255) NOT NULL,
  `item_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext NOT NULL,
  `price` longtext NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `project_pricelist` int(11) NOT NULL,
  `project_type` varchar(50) NOT NULL,
  `tax` int(11) NOT NULL,
  `contact_person` varchar(255) NOT NULL,
  `manager` varchar(255) NOT NULL,
  `coordinator` varchar(255) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `q_date` varchar(255) NOT NULL,
  `item_language` varchar(255) NOT NULL,
  `source_lang` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `target_lang` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `item_status` varchar(255) NOT NULL DEFAULT 'To be Assigned',
  `item_email_subject` varchar(50) NOT NULL,
  `amount` longtext NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `auto_status` enum('Auto','Manual') NOT NULL DEFAULT 'Auto',
  `po_number` varchar(255) NOT NULL,
  `attached_workflow` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_items`
--

INSERT INTO `tms_items` (`itemId`, `order_id`, `item_number`, `item_name`, `description`, `price`, `total_price`, `project_pricelist`, `project_type`, `tax`, `contact_person`, `manager`, `coordinator`, `start_date`, `due_date`, `q_date`, `item_language`, `source_lang`, `target_lang`, `item_status`, `item_email_subject`, `amount`, `total_amount`, `auto_status`, `po_number`, `attached_workflow`, `created_date`, `updated_date`) VALUES
(1, 3, '1', 'Acc Kanhasoft | English (US)-Norwegian (nynorsk)', '', '[{\"quantity\":1,\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"1\",\"itemTotal\":\"1.00\"},{\"quantity\":1,\"pricelist\":\"Words Translation 50-74% Match\",\"itemPrice\":\"0,6\",\"itemTotal\":\"0.60\",\"amtSum\":\"0.600\"}]', '1.60', 0, '7', 0, '4,2', '1', '2', '2022-11-01 14:18:00', '2022-11-01 14:18:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (nynorsk)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned', 'Proj test', '', '1.60', 'Auto', 'FSFKD65', 'SingleJob -Batch Delivery (BAD)', '2022-11-01 14:18:06', '2022-11-28 12:18:59'),
(4, 25, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"217\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"0,045\",\"itemTotal\":\"9.76\",\"amtSum\":9.764999999999999}]', '9.77', 0, '5', 0, '2,3', '1', '2', '2022-11-03 21:10:00', '2022-10-31 16:00:00', '10-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Approved', 'Proz job - Norwegian linguist', '', '9.77', 'Auto', '# 2022/3461/EN-GB » NO/1/3', 'jobChain -', '2022-11-03 21:10:55', '2022-11-17 21:32:22'),
(5, 27, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"650\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"0,03\",\"itemTotal\":\"19.5\",\"amtSum\":19.5}]', '19.51', 0, '5', 0, '5,4', '1', '2', '2022-11-03 21:58:00', '2022-11-03 17:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'A new proofreading task has been assigned to you.', '', '19.51', 'Auto', '', 'SingleJob -Batch Delivery (BAD)', '2022-11-03 21:58:10', '2022-11-03 22:02:49'),
(6, 29, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"145\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"0,03\",\"itemTotal\":\"4.35\",\"amtSum\":4.35}]', '4.35', 0, '5', 0, '5', '1', '2', '2022-11-04 16:28:00', '2022-11-04 17:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'A new proofreading task has been assigned to you.', '', '4.35', 'Auto', '', 'SingleJob -Proofreading (PRF)', '2022-11-04 16:28:26', '2022-11-04 16:31:30'),
(7, 31, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"51\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"5.61\",\"amtSum\":5.61}]', '5.61', 0, '1', 0, '3,5', '1', '2', '2022-11-04 16:41:00', '2022-11-03 12:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'Purchase Order n°PO-DWFR-2022-21665', '', '5.61', 'Auto', 'PO-DWFR-2022-21665', 'SingleJob -Proofreading (PRF)', '2022-11-04 16:41:18', '2022-11-04 16:43:32'),
(8, 33, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"185\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"1,11\",\"itemTotal\":\"205.35\",\"amtSum\":205.35000000000002},{\"quantity\":\"1934\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":\"0,01099794\",\"itemTotal\":\"21.27\",\"amtSum\":21.27001596}]', '226.64', 0, '1', 0, '3,6', '1', '2', '2022-11-04 16:48:00', '2022-11-03 12:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'Purchase Order n°PO-DWFR-2022-21692', '', '226.64', 'Auto', 'PO-DWFR-2022-21692', 'SingleJob -Translation (TRA)', '2022-11-04 16:48:58', '2022-12-01 16:14:39'),
(13, 37, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"145\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"0,03\",\"itemTotal\":\"435\",\"amtSum\":4.35}]', '4.35', 0, '5', 0, '5,4', '1', '2', '2022-11-08 13:44:00', '2022-11-04 09:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'A new proofreading task has been assigned to you.', '', '4.35', 'Auto', '', 'SingleJob -Proofreading (PRF)', '2022-11-08 13:44:43', '2022-11-08 13:46:11'),
(14, 38, '1', 'TruePartners | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1211\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"0,03\",\"itemTotal\":\"36.33\",\"amtSum\":36.33}]', '36.33', 0, '5', 0, '5,4', '1', '2', '0000-00-00 00:00:00', '2022-11-04 09:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'A new proofreading task has been assigned to you.', '', '36.33', 'Auto', '', 'SingleJob -Proofreading (PRF)', '2022-11-08 13:49:08', '2022-12-01 16:15:04'),
(20, 46, '1', 'Chanel | \n                                                               -Norwegian (bokmal)', '', '[{\"quantity\":1,\"pricelist\":\"Project Price PRF\",\"itemPrice\":\"27\",\"itemTotal\":\"27\",\"amtSum\":27}]', '27.00', 0, '5', 0, '3,8', '', '', '0000-00-00 00:00:00', '2022-11-08 17:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'DATAWORDS / CHANEL / PRJ-01371 / PIM / PDPs HJ / P', '', '27.00', 'Auto', '', 'SingleJob -Proofreading (PRF)', '2022-11-08 18:03:17', '2022-11-08 18:07:08'),
(21, 49, '1', 'SpellUp | \n                                                               -Norwegian (bokmal)', '', '[{\"quantity\":\"188\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,09\",\"itemTotal\":\"1691.00\",\"amtSum\":16.919999999999998}]', '16.92', 0, '1', 0, '8,9', '1', '2', '0000-00-00 00:00:00', '2022-11-09 11:45:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'EN-NORWEGIAN freelance translator', '', '16.92', 'Auto', '', 'SingleJob -Translation (TRA)', '2022-11-10 16:00:54', '2022-12-01 16:15:45'),
(22, 51, '1', 'Hill´s Pet | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":1,\"pricelist\":\"Project Price PRF\",\"itemPrice\":\"20\",\"itemTotal\":\"20\",\"amtSum\":20}]', '20.00', 0, '5', 0, '3,8', '1', '2', '2022-11-10 16:36:00', '2022-11-09 12:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'DATAWORDS / HILL\'S PET / P22012642 / METADATA Q&A ', '', '20.00', 'Auto', '', 'SingleJob -Proofreading (PRF)', '2022-11-10 16:36:42', '2022-11-10 16:38:34'),
(23, 55, '1', 'Scorewarrior | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"4\",\"pricelist\":\"Hour(s) Translation\",\"itemPrice\":\"45\",\"itemTotal\":\"180\",\"amtSum\":180}]', '180.00', 0, '1', 0, '9,10', '7,1', '2', '2022-11-11 16:23:00', '2022-11-09 17:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Approved', 'Glossary file', '', '180.00', 'Auto', 'Glossary file', 'SingleJob -Translation (TRA)', '2022-11-11 16:23:38', '2022-11-11 18:57:48'),
(24, 55, '2', 'Scorewarrior | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"336\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"36.96\",\"amtSum\":36.96},{\"quantity\":\"358\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":\"0,011\",\"itemTotal\":\"3.93\",\"amtSum\":3.9379999999999997},{\"quantity\":\"2\",\"pricelist\":\"Words Translation 95-99% Match\",\"itemPrice\":\"0,05\",\"itemTotal\":\"0.1\",\"amtSum\":0.1},{\"quantity\":\"25\",\"pricelist\":\"Words Translation 75-84% Match\",\"itemPrice\":\"0,085\",\"itemTotal\":\"2.12\",\"amtSum\":2.125}]', '43.12', 0, '1', 0, '9,10', '7,1', '2', '2022-11-11 16:23:00', '2022-11-10 17:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Approved', '/Web_common', '', '43.12', 'Auto', '/Web_common', 'SingleJob -Translation (TRA)', '2022-11-11 16:23:38', '2022-11-11 18:58:02'),
(25, 55, '3', 'Scorewarrior | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1192\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"131.12\",\"amtSum\":131.12},{\"quantity\":\"179\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":\"0,011\",\"itemTotal\":\"1.96\",\"amtSum\":1.9689999999999999},{\"quantity\":\"778\",\"pricelist\":\"Words Translation ICE Match\",\"itemPrice\":\"0,011\",\"itemTotal\":\"8.55\",\"amtSum\":8.558},{\"quantity\":\"190\",\"pricelist\":\"Words Translation 95-99% Match\",\"itemPrice\":\"0,05\",\"itemTotal\":\"9.5\",\"amtSum\":9.5},{\"quantity\":\"116\",\"pricelist\":\"Words Translation 85-94% Match\",\"itemPrice\":\"0,075\",\"itemTotal\":\"8.7\",\"amtSum\":8.7},{\"quantity\":\"211\",\"pricelist\":\"Words Translation 75-84% Match\",\"itemPrice\":\"0,085\",\"itemTotal\":\"17.93\",\"amtSum\":17.935000000000002}]', '0.00', 0, '1', 0, '9,10', '7,1', '2', '2022-11-11 16:23:00', '2022-11-14 17:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Approved', '/web_site', '', '0.00', 'Auto', '/web_site', 'SingleJob -Translation (TRA)', '2022-11-11 16:23:38', '2022-11-11 19:01:13'),
(26, 55, '4', 'Scorewarrior | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"49677\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"5464.47\",\"amtSum\":5464.47},{\"quantity\":\"30740\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":\"0,011\",\"itemTotal\":\"338.14\",\"amtSum\":338.14},{\"quantity\":\"6209\",\"pricelist\":\"Words Translation 95-99% Match\",\"itemPrice\":\"0,05\",\"itemTotal\":\"310.45\",\"amtSum\":310.45000000000005},{\"quantity\":\"6236\",\"pricelist\":\"Words Translation 85-94% Match\",\"itemPrice\":\"0,075\",\"itemTotal\":\"467.7\",\"amtSum\":467.7},{\"quantity\":\"8423\",\"pricelist\":\"Words Translation 75-84% Match\",\"itemPrice\":\"0,085\",\"itemTotal\":\"715.95\",\"amtSum\":715.955}]', '0.00', 0, '1', 0, '9,10', '7,1', '2', '2022-11-11 16:23:00', '2022-11-28 17:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned', '/game_archive', '', '0.00', 'Auto', '/game_archive', 'SingleJob -Translation (TRA)', '2022-11-11 16:23:38', '2022-11-11 16:47:17'),
(27, 55, '5', 'Scorewarrior | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"17193\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"1891.23\",\"amtSum\":1891.23},{\"quantity\":\"7905\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":\"0,011\",\"itemTotal\":\"86.95\",\"amtSum\":86.955},{\"quantity\":\"1507\",\"pricelist\":\"Words Translation 95-99% Match\",\"itemPrice\":\"0,05\",\"itemTotal\":\"75.35\",\"amtSum\":75.35000000000001},{\"quantity\":\"2267\",\"pricelist\":\"Words Translation 85-94% Match\",\"itemPrice\":\"0,075\",\"itemTotal\":\"170.02\",\"amtSum\":170.025},{\"quantity\":\"3020\",\"pricelist\":\"Words Translation 75-84% Match\",\"itemPrice\":\"0,085\",\"itemTotal\":\"256.70\",\"amtSum\":256.70000000000005}]', '2480.26', 0, '1', 0, '9,10', '7,1', '2', '2022-11-11 16:23:00', '2022-12-19 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned', '/game', '', '2480.26', 'Auto', '/game', 'SingleJob -Translation (TRA)', '2022-11-11 16:23:38', '2022-11-11 16:49:13'),
(28, 55, '6', 'Scorewarrior | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1240\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"136.4\",\"amtSum\":136.4},{\"quantity\":\"1851\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":\"0,011\",\"itemTotal\":\"20.36\",\"amtSum\":20.360999999999997},{\"quantity\":\"398\",\"pricelist\":\"Words Translation 95-99% Match\",\"itemPrice\":\"0,05\",\"itemTotal\":\"19.90\",\"amtSum\":19.900000000000002},{\"quantity\":\"272\",\"pricelist\":\"Words Translation 85-94% Match\",\"itemPrice\":\"0,075\",\"itemTotal\":\"20.4\",\"amtSum\":20.4},{\"quantity\":\"528\",\"pricelist\":\"Words Translation 75-84% Match\",\"itemPrice\":\"0,085\",\"itemTotal\":\"44.88\",\"amtSum\":44.88}]', '241.94', 0, '1', 0, '9,10', '7,1', '2', '2022-11-11 16:49:00', '2022-12-19 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Approved', '/S1', '', '241.94', 'Auto', '/S1', 'SingleJob -Translation (TRA)', '2022-11-11 16:49:38', '2022-11-11 19:01:30'),
(29, 55, '7', 'Scorewarrior | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1240\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"136.4\",\"amtSum\":136.4},{\"quantity\":\"1851\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":\"0,011\",\"itemTotal\":\"20.36\",\"amtSum\":20.360999999999997},{\"quantity\":\"398\",\"pricelist\":\"Words Translation 95-99% Match\",\"itemPrice\":\"0,05\",\"itemTotal\":\"19.90\",\"amtSum\":19.900000000000002},{\"quantity\":\"272\",\"pricelist\":\"Words Translation 85-94% Match\",\"itemPrice\":\"0,075\",\"itemTotal\":\"20.4\",\"amtSum\":20.4},{\"quantity\":\"528\",\"pricelist\":\"Words Translation 75-84% Match\",\"itemPrice\":\"0,085\",\"itemTotal\":\"44.88\",\"amtSum\":44.88}]', '241.94', 0, '1', 0, '9,10', '7,1', '2', '2022-11-11 16:49:00', '2022-12-19 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned', '/S2', '', '241.94', 'Auto', '/S2', 'SingleJob -Translation (TRA)', '2022-11-11 16:49:38', '2022-11-11 17:15:13'),
(30, 55, '8', 'Scorewarrior | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"452\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"49.72\",\"amtSum\":49.72},{\"quantity\":\"68\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":\"0,011\",\"itemTotal\":\"0.74\",\"amtSum\":0.748},{\"quantity\":\"11\",\"pricelist\":\"Words Translation 95-99% Match\",\"itemPrice\":\"0,05\",\"itemTotal\":\"0.55\",\"amtSum\":0.55},{\"quantity\":\"10\",\"pricelist\":\"Words Translation 85-94% Match\",\"itemPrice\":\"0,075\",\"itemTotal\":\"0.75\",\"amtSum\":0.75},{\"quantity\":\"73\",\"pricelist\":\"Words Translation 75-84% Match\",\"itemPrice\":\"0,085\",\"itemTotal\":\"6.20\",\"amtSum\":6.205}]', '57.97', 0, '1', 0, '9,10', '7,1', '2', '2022-11-11 16:49:00', '2022-12-19 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned', '/marketing_regular', '', '57.97', 'Auto', '/marketing_regular', 'SingleJob -Translation (TRA)', '2022-11-11 16:49:38', '2022-11-11 17:16:34'),
(31, 55, '9', 'Scorewarrior | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"392\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"43.12\",\"amtSum\":43.12}]', '43.12', 0, '1', 0, '9,10', '7,1', '2', '2022-11-11 16:49:00', '2022-12-19 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned', '/Android description.doc', '', '43.12', 'Auto', '/Android description.doc', 'SingleJob -Translation (TRA)', '2022-11-11 16:49:38', '2022-11-11 17:18:03'),
(32, 55, '10', 'Scorewarrior | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"367\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"40.37\",\"amtSum\":40.37}]', '40.37', 0, '1', 0, '9,10', '7,1', '2', '2022-11-11 16:49:00', '2022-12-19 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Approved', '/description', '', '40.37', 'Auto', '/description', 'SingleJob -Translation (TRA)', '2022-11-11 16:49:38', '2022-11-11 19:01:49'),
(33, 55, '11', 'Scorewarrior | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"27\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"2.97\",\"amtSum\":2.97}]', '2.97', 0, '1', 0, '9,10', '7,1', '2', '2022-11-11 17:19:00', '2022-12-19 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Approved', '/promotional', '', '2.97', 'Auto', '/promotional', 'SingleJob -Translation (TRA)', '2022-11-11 17:19:05', '2022-11-11 19:02:12'),
(34, 55, '12', 'Scorewarrior | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"5\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"0.55\",\"amtSum\":0.55}]', '0.55', 0, '1', 0, '9,10', '7,1', '2', '2022-11-11 17:19:00', '2022-12-19 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Approved', '/whatsnew_bugfix', '', '0.55', 'Auto', '/whatsnew_bugfix', 'SingleJob -Translation (TRA)', '2022-11-11 17:19:05', '2022-11-11 19:07:19'),
(35, 55, '13', 'Scorewarrior | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"17\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"1.87\",\"amtSum\":1.87}]', '1.87', 0, '1', 0, '9,10', '7,1', '2', '2022-11-11 17:19:00', '2022-12-19 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Approved', '/translation.xlsx', '', '1.87', 'Auto', '/translation.xlsx', 'SingleJob -Translation (TRA)', '2022-11-11 17:19:05', '2022-11-11 19:07:37'),
(36, 55, '14', 'Scorewarrior | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"11\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"1.21\",\"amtSum\":1.21}]', '1.21', 0, '1', 0, '9,10', '7,1', '2', '2022-11-11 17:19:00', '2022-12-19 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Approved', '/InfoPlist.strings', '', '1.21', 'Auto', '/InfoPlist.strings', 'SingleJob -Translation (TRA)', '2022-11-11 17:19:05', '2022-11-11 19:07:59'),
(37, 55, '15', 'Scorewarrior | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"668\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"73.48\",\"amtSum\":73.48},{\"quantity\":\"153\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":\"0,011\",\"itemTotal\":\"1.68\",\"amtSum\":1.6829999999999998},{\"quantity\":\"44\",\"pricelist\":\"Words Translation 95-99% Match\",\"itemPrice\":\"0,05\",\"itemTotal\":\"2.2\",\"amtSum\":2.2},{\"quantity\":\"5\",\"pricelist\":\"Words Translation 85-94% Match\",\"itemPrice\":\"0,075\",\"itemTotal\":\"0.37\",\"amtSum\":0.375},{\"quantity\":\"34\",\"pricelist\":\"Words Translation 75-84% Match\",\"itemPrice\":\"0,085\",\"itemTotal\":\"2.89\",\"amtSum\":2.89}]', '80.63', 0, '1', 0, '9,10', '7,1', '2', '2022-11-11 18:59:00', '2022-11-10 17:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned', '/web_hub', '', '80.63', 'Auto', '/web_hub', 'SingleJob -Translation (TRA)', '2022-11-11 18:59:01', '2022-11-11 19:00:30'),
(38, 56, '1', 'Microsoft | English (US) - English (US)', '', '', '0.00', 0, '', 0, '1', '', '', '2022-11-11 21:02:49', NULL, '', '', '', '', 'To be Assigned', '', '', '0.00', 'Auto', '', '', '2022-11-11 21:02:49', '2022-11-11 21:02:49'),
(39, 56, '2', 'Microsoft | English (US) - English (US)', '', '', '0.00', 0, '', 0, '1', '', '', '2022-11-11 21:02:49', NULL, '', '', '', '', 'To be Assigned', '', '', '0.00', 'Auto', '', '', '2022-11-11 21:02:49', '2022-11-11 21:02:49'),
(42, 59, '1', 'Gaming Innovation Group (GiG) | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"158\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"0,03\",\"itemTotal\":\"4.74\",\"amtSum\":4.74}]', '4.74', 0, '5', 0, '5,4', '1', '2', '2022-11-16 16:27:00', '2022-11-14 11:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'A new proofreading task has been assigned to you.', '', '4.74', 'Auto', '', 'SingleJob -Proofreading (PRF)', '2022-11-16 16:27:05', '2022-11-16 16:28:13'),
(43, 61, '1', 'Uniclub | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"2180\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"0,031\",\"itemTotal\":\"67.58\",\"amtSum\":67.58}]', '67.59', 0, '5', 0, '5,11', '1', '2', '2022-11-16 16:34:00', '2022-11-15 12:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'A new proofreading task has been assigned to you.', '', '67.59', 'Auto', '', 'SingleJob -Proofreading (PRF)', '2022-11-16 16:34:49', '2022-11-16 16:38:48'),
(44, 62, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"285\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,095\",\"itemTotal\":\"27.07\",\"amtSum\":27.075}]', '27.11', 0, '1', 0, '10,12', '1', '2', '2022-11-16 16:50:00', '2022-11-16 12:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'Hikvision2211039-Translation-English-Norwegian-(28', '', '27.11', 'Auto', '', 'SingleJob -Translation (TRA)', '2022-11-16 16:50:37', '2022-11-16 16:51:39'),
(45, 63, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":1,\"pricelist\":\"Project Price TRA\",\"itemPrice\":\"848,13\",\"itemTotal\":\"848.13\",\"amtSum\":848.13}]', '848.13', 0, '1', 0, '11,13', '1', '2', '2022-11-16 17:01:00', '2022-11-15 12:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', '[T/36975/22] Translation en > no', '', '848.13', 'Auto', 'PO/08039/22', 'SingleJob -Translation (TRA)', '2022-11-16 17:01:17', '2022-11-16 17:02:28'),
(46, 64, '1', 'SkinCeuticals | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":1,\"pricelist\":\"Words Proofreading\",\"itemPrice\":\"40\",\"itemTotal\":\"40\",\"amtSum\":40}]', '40.00', 0, '5', 0, '3,14', '1', '2', '2022-11-16 17:06:00', '2022-11-15 12:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'DATAWORDS / SkinCeuticals / Nordics / Content Libr', '', '40.00', 'Auto', '', 'SingleJob -Proofreading (PRF)', '2022-11-16 17:06:02', '2022-11-16 17:06:51'),
(50, 72, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"500\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"55\",\"amtSum\":55}]', '55.00', 0, '1', 0, '12,15', '7,1', '2', '2022-11-18 00:52:00', '2022-11-20 20:27:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned', 'Test Project', '', '55.00', 'Auto', 'No_124578', 'SingleJob -Translation (TRA)', '2022-11-18 00:52:10', '2022-11-18 00:58:16'),
(51, 74, '1', 'Hill´s Pet | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"2\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"40\",\"itemTotal\":\"80.00\",\"amtSum\":80}]', '80.00', 0, '5', 0, '3,8', '7', '2', '2022-11-18 23:52:00', '2022-11-17 19:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'DATAWORDS / HILL\'S PET / P22012642 / 2022 SEO GAPS', '', '80.00', 'Auto', 'PO-DWFR-2022-24469', 'SingleJob -Proofreading (PRF)', '2022-11-18 23:52:38', '2022-12-02 15:40:41'),
(52, 76, '1', 'Chanel | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":1,\"pricelist\":\"Project Price PRF\",\"itemPrice\":\"15\",\"itemTotal\":\"15\",\"amtSum\":15}]', '15.00', 0, '5', 0, '3,17', '7', '2', '2022-11-18 23:57:00', '2022-11-18 19:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'DATAWORDS/ CHANEL/ PRJ-06351/ COCO CRUSH 2023/ Moo', '', '15.00', 'Auto', '', 'SingleJob -Proofreading (PRF)', '2022-11-18 23:57:33', '2022-11-18 23:58:30'),
(55, 83, '1', 'Gaming Innovation Group (GiG) | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"769\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"0,03\",\"itemTotal\":\"23.07\",\"amtSum\":23.07}]', '23.07', 0, '5', 0, '5,4', '1', '2', '2022-12-01 16:00:00', '2022-11-21 11:31:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'A new proofreading task has been assigned to you.', '', '23.07', 'Auto', '', 'SingleJob -Proofreading (PRF)', '2022-12-01 16:00:51', '2022-12-01 16:14:02'),
(56, 84, '1', 'Gaming Innovation Group (GiG) | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"145\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"0,03\",\"itemTotal\":\"4.35\",\"amtSum\":4.35}]', '4.35', 0, '5', 0, '5,4', '1', '2', '2022-12-01 16:09:00', '2022-11-22 11:40:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'A new proofreading task has been assigned to you.', '', '4.35', 'Auto', '', 'SingleJob -Proofreading (PRF)', '2022-12-01 16:09:36', '2022-12-01 16:13:41'),
(57, 86, '1', 'TechnoAlpin | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"31\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"3.41\",\"amtSum\":3.41},{\"quantity\":\"185\",\"pricelist\":\"Words Translation 75-84% Match\",\"itemPrice\":\"0,06\",\"itemTotal\":\"11.1\",\"amtSum\":11.1},{\"quantity\":\"1083\",\"pricelist\":\"Words Translation Repetitions\",\"itemPrice\":\"0,015\",\"itemTotal\":\"16.245\",\"amtSum\":16.245}]', '30.76', 0, '1', 0, '11,13', '1', '2', '2022-12-01 16:28:00', '2022-11-24 11:59:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'SO/6541/22 | T/38784/22  (PURCHASE ORDER PO/08404/', '', '30.76', 'Auto', 'SO/6541/22', 'SingleJob -Translation (TRA)', '2022-12-01 16:28:46', '2022-12-01 16:33:38'),
(58, 87, '1', 'Parker Hannifin | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"0,5\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"40,00\",\"itemTotal\":\"20.00\",\"amtSum\":20}]', '20.00', 0, '5', 0, '14', '1', '2', '2022-12-01 17:14:00', '2022-11-25 12:45:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'Lingsoft project 977427 / PARKCH_2211_P0117 nb-NO', '', '20.00', 'Auto', '', 'SingleJob -Proofreading (PRF)', '2022-12-01 17:14:47', '2022-12-01 17:16:31'),
(59, 88, '1', 'Gaming Innovation Group (GiG) | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"256\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"0,03\",\"itemTotal\":\"7.68\",\"amtSum\":7.68}]', '7.68', 0, '5', 0, '5,4', '1', '2', '2022-12-01 17:51:00', '2022-11-25 13:21:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'A new proofreading task has been assigned to you. ', '', '7.68', 'Auto', '', 'SingleJob -Proofreading (PRF)', '2022-12-01 17:51:16', '2022-12-01 17:51:58'),
(60, 89, '1', 'ILOQ | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"93\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"10.23\",\"amtSum\":10.23},{\"quantity\":\"2\",\"pricelist\":\"Words Translation 75-84% Match\",\"itemPrice\":\"0,044\",\"itemTotal\":\"0.088\",\"amtSum\":0.088}]', '10.32', 0, '1', 0, '14', '1', '2', '2022-12-01 18:07:00', '2022-11-25 13:37:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'Lingsoft project 978325 / iLOQ Manager UI EN-CA/SV', '', '10.32', 'Auto', '', 'SingleJob -Translation (TRA)', '2022-12-01 18:07:40', '2022-12-01 18:10:00'),
(61, 91, '1', 'Ecolab | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Machine Translation Editing\",\"itemPrice\":\"11,89\",\"itemTotal\":\"11.89\",\"amtSum\":11.89}]', '11.89', 0, '9', 0, '14', '1', '2', '2022-12-01 19:18:00', '2022-11-28 14:51:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'Lingsoft project 977913 / Acolad Translation Reque', '', '11.89', 'Auto', '', 'SingleJob -Translation (TRA)', '2022-12-01 19:18:15', '2022-12-01 19:32:42'),
(62, 92, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price PRF\",\"itemPrice\":\"10\",\"itemTotal\":\"10.00\",\"amtSum\":10}]', '10.00', 0, '5', 0, '15,19', '1', '2', '2022-12-01 19:47:00', '2022-11-28 15:17:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'Useful guides + training material', '', '10.00', 'Auto', '', 'jobChain -', '2022-12-01 19:47:46', '2022-12-01 19:48:25'),
(63, 93, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price PRF\",\"itemPrice\":\"17,5\",\"itemTotal\":\"17.5\",\"amtSum\":17.5}]', '17.50', 0, '5', 0, '16,20', '1', '2', '2022-12-01 20:04:00', '2022-11-29 15:35:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'Derivco: first tasks in memoQ', '', '17.50', 'Auto', '', 'jobChain -', '2022-12-01 20:04:59', '2022-12-01 20:06:49'),
(64, 94, '1', 'TechnoAlpin | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"70\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"7.7\",\"amtSum\":7.7}]', '7.70', 0, '1', 0, '11,13', '1', '2', '2022-12-01 20:16:00', '2022-11-30 15:46:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'SO/6683/22 | T/39586/22  (PURCHASE ORDER PO/08507/', '', '7.70', 'Auto', 'PO/08507/22', 'SingleJob -Translation (TRA)', '2022-12-01 20:16:22', '2022-12-01 20:18:58'),
(65, 95, '1', 'GiG (Gaming Innovation Group) | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"826\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"0,03\",\"itemTotal\":\"24.78\",\"amtSum\":24.78}]', '24.78', 0, '5', 0, '5,4', '1', '2', '2022-12-01 20:25:00', '2022-12-01 15:55:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'A new proofreading task has been assigned to you.', '', '24.78', 'Auto', '', 'SingleJob -Proofreading (PRF)', '2022-12-01 20:25:28', '2022-12-01 20:27:08'),
(66, 96, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"40,00\",\"itemTotal\":\"40.00\"}]', '40.00', 0, '5', 0, '3', '1', '2', '2022-12-01 20:41:00', '2022-11-16 16:11:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'Purchase Order n°PO-DWFR-2022-23370', '', '40.00', 'Auto', 'PO-DWFR-2022-23370', 'SingleJob -Proofreading (PRF)', '2022-12-01 20:41:04', '2022-12-01 20:41:54'),
(67, 97, '1', 'Chanel | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"0,75\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"40,00\",\"itemTotal\":\"30.00\",\"amtSum\":30}]', '30.00', 0, '5', 0, '3', '1', '2', '2022-12-01 20:46:00', '2022-11-18 16:16:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'Purchase Order n°PO-DWFR-2022-23606', '', '30.00', 'Auto', 'PO-DWFR-2022-23606', 'SingleJob -Proofreading (PRF)', '2022-12-01 20:46:09', '2022-12-01 20:46:58'),
(68, 98, '1', 'Loxam | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"0,165\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"40,00\",\"itemTotal\":\"6.6\",\"amtSum\":6.6}]', '6.60', 0, '5', 0, '3,8', '1', '2', '2022-12-01 20:51:00', '2022-11-18 16:21:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'DATAWORDS / LOXAM / PRJ-04792 / DECOUVREZ LOXAM IR', '', '6.60', 'Auto', '', 'SingleJob -Proofreading (PRF)', '2022-12-01 20:51:03', '2022-12-01 20:53:50'),
(69, 99, '1', 'Chanel | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price PRF\",\"itemPrice\":\"15\",\"itemTotal\":\"15.00\",\"amtSum\":15}]', '15.00', 0, '5', 0, '3,17', '1', '2', '2022-12-01 22:03:00', '2022-11-21 17:33:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'Purchase Order n°PO-DWFR-2022-23769', '', '15.00', 'Auto', 'PO-DWFR-2022-23769', 'SingleJob -Proofreading (PRF)', '2022-12-01 22:03:30', '2022-12-01 22:05:25'),
(70, 101, '1', 'Loxam | \n                                                               -Norwegian (bokmal)', '', '[{\"quantity\":\"0,5\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"40,00\",\"itemTotal\":\"20.00\",\"amtSum\":20}]', '20.00', 0, '5', 0, '3,21', '1', '2', '0000-00-00 00:00:00', '2022-11-21 17:42:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'DATAWORDS / LOXAM / PRJ-04792 / A la rencontre de', '', '20.00', 'Auto', '', 'SingleJob -Proofreading (PRF)', '2022-12-01 22:12:44', '2022-12-01 22:14:33'),
(71, 102, '1', 'Chanel | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"40,00\",\"itemTotal\":\"40.00\"}]', '40.00', 0, '5', 0, '3,17', '1', '2', '2022-12-01 22:20:00', '2022-11-21 17:50:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'DATAWORDS/ CHANEL/ PRJ-06115/ COCO CRUSH 2023/ Cam', '', '40.00', 'Auto', '', 'SingleJob -Proofreading (PRF)', '2022-12-01 22:20:12', '2022-12-01 22:20:47'),
(72, 104, '1', 'Loxam | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"0,5\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"40,00\",\"itemTotal\":\"20.00\",\"amtSum\":20}]', '20.00', 0, '5', 0, '3', '1', '2', '2022-12-01 22:42:00', '2022-11-21 18:12:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'Purchase Order n°PO-DWFR-2022-23948', '', '20.00', 'Auto', 'PO-DWFR-2022-23948', 'SingleJob -Proofreading (PRF)', '2022-12-01 22:42:21', '2022-12-01 22:43:58'),
(73, 105, '1', 'Chanel | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"40,00\",\"itemTotal\":\"40.00\"}]', '40.00', 0, '5', 0, '3,17', '1', '2', '2022-12-01 23:00:00', '2022-11-22 18:30:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'Purchase Order n°PO-DWFR-2022-23962', '', '40.00', 'Auto', 'PO-DWFR-2022-23962', 'SingleJob -Proofreading (PRF)', '2022-12-01 23:00:45', '2022-12-01 23:01:40'),
(74, 106, '1', 'GiG (Gaming Innovation Group) | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"189\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"0,03\",\"itemTotal\":\"5.67\",\"amtSum\":5.67}]', '5.67', 0, '5', 0, '5,4', '1', '2', '2022-12-02 14:28:00', '2022-11-23 14:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'A new proofreading task has been assigned to you.', '', '5.67', 'Auto', '', 'SingleJob -Proofreading (PRF)', '2022-12-02 14:28:36', '2022-12-02 14:29:48'),
(75, 107, '1', 'Hill´s Pet | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"0,5\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"40,00\",\"itemTotal\":\"20.00\",\"amtSum\":20}]', '20.00', 0, '5', 0, '3,8', '1', '2', '2022-12-02 14:36:00', '2022-11-24 10:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'Purchase Order n°PO-DWFR-2022-24138', '', '20.00', 'Auto', 'PO-DWFR-2022-24138', 'SingleJob -Proofreading (PRF)', '2022-12-02 14:36:33', '2022-12-02 14:37:25'),
(76, 108, '1', 'Loxam | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"0,25\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"40,00\",\"itemTotal\":\"10.00\",\"amtSum\":10}]', '10.00', 0, '5', 0, '3,8', '1', '2', '2022-12-02 14:46:00', '2022-11-24 12:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'Purchase Order n°PO-DWFR-2022-24140', '', '10.00', 'Auto', 'PO-DWFR-2022-24140', 'SingleJob -Proofreading (PRF)', '2022-12-02 14:46:08', '2022-12-02 14:47:14'),
(77, 109, '1', 'D&G (Dolce Gabbana) | Norwegian (bokmal)-English (US)', '', '[{\"quantity\":\"64\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,1\",\"itemTotal\":\"6.4\",\"amtSum\":6.4}]', '6.40', 0, '1', 0, '3,22', '1', '2', '2022-12-02 14:53:00', '2022-11-25 11:00:00', '11-2022', '', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'Delivered', 'DW TRANSLATION // D&G // P21121522 // Sitelink //', '', '6.40', 'Auto', 'PO-DWFR-2022-24419', 'SingleJob -Translation (TRA)', '2022-12-02 14:53:42', '2022-12-02 15:37:03');
INSERT INTO `tms_items` (`itemId`, `order_id`, `item_number`, `item_name`, `description`, `price`, `total_price`, `project_pricelist`, `project_type`, `tax`, `contact_person`, `manager`, `coordinator`, `start_date`, `due_date`, `q_date`, `item_language`, `source_lang`, `target_lang`, `item_status`, `item_email_subject`, `amount`, `total_amount`, `auto_status`, `po_number`, `attached_workflow`, `created_date`, `updated_date`) VALUES
(83, 111, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"43\",\"itemTotal\":\"43.00\",\"amtSum\":43}]', '43.00', 0, '1', 0, '17,23', '1', '2', '2022-12-05 20:45:00', '2022-12-02 16:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'Fasttranslator Purchase Order [#555959]', '', '43.00', 'Auto', '', 'SingleJob -Translation (TRA)', '2022-12-05 20:45:58', '2022-12-05 20:47:53'),
(84, 112, '1', 'Pierre Fabre | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"28,48\",\"itemTotal\":\"28.48\",\"amtSum\":28.48}]', '28.48', 28, '9', 0, '3,24', '1', '2', '2022-12-05 20:59:00', '2022-12-02 16:30:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'DATAWORDS / PFDC / PRJ-02384 / DEPLOY / CMS / EAU', '', '28.48', 'Auto', '', 'SingleJob -Translation (TRA)', '2022-12-05 20:59:31', '2022-12-05 21:23:23'),
(85, 113, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"10\",\"itemTotal\":\"10.00\",\"amtSum\":10}]', '10.00', 28, '5', 0, '3,21', '1', '2', '2022-12-05 21:25:00', '2022-12-05 11:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'Datawords / Cartier Social Media / EOY Toolbox W2', '', '10.00', 'Auto', 'PO-DWFR-2022-25302', 'SingleJob -Proofreading (PRF)', '2022-12-05 21:25:46', '2022-12-06 17:50:38'),
(86, 114, '1', 'TechnoAlpin | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"21\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"2.31\",\"amtSum\":2.31},{\"quantity\":\"49\",\"pricelist\":\"Words Translation 75-84% Match\",\"itemPrice\":\"0,06\",\"itemTotal\":\"2.94\",\"amtSum\":2.94},{\"quantity\":\"804\",\"pricelist\":\"Words Translation Repetitions\",\"itemPrice\":\"0,015\",\"itemTotal\":\"12.06\",\"amtSum\":12.06}]', '17.31', 27, '1', 0, '11,13', '1', '2', '2022-12-05 21:29:00', '2022-12-07 11:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'SO/6764/22 | T/40044/22  (PURCHASE ORDER PO/08580/', '', '17.31', 'Auto', 'PO/08580/22', 'SingleJob -Translation (TRA)', '2022-12-05 21:29:08', '2022-12-05 21:30:45'),
(87, 116, '1', 'ILOQ | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"2559\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"281.49\",\"amtSum\":281.49},{\"quantity\":\"14\",\"pricelist\":\"Words Translation 50-74% Match\",\"itemPrice\":\"0,11\",\"itemTotal\":\"1.54\",\"amtSum\":1.54},{\"quantity\":\"65\",\"pricelist\":\"Words Translation 75-84% Match\",\"itemPrice\":\"0,044\",\"itemTotal\":\"2.86\",\"amtSum\":2.86},{\"quantity\":\"37\",\"pricelist\":\"Words Translation 85-94% Match\",\"itemPrice\":\"0,027\",\"itemTotal\":\"0.999\",\"amtSum\":0.999},{\"quantity\":\"26\",\"pricelist\":\"Words Translation 95-99% Match\",\"itemPrice\":\"0,027\",\"itemTotal\":\"0.702\",\"amtSum\":0.702},{\"quantity\":\"65\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":\"0,013\",\"itemTotal\":\"0.845\",\"amtSum\":0.845}]', '288.44', 25, '1', 0, '14,18', '1', '2', '2022-12-06 17:29:00', '2022-12-09 12:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'PO: Lingsoft project 978975 / iLOQ sustainability', '', '288.44', 'Auto', '978975', 'SingleJob -Translation (TRA)', '2022-12-06 17:29:24', '2022-12-06 17:38:40'),
(88, 117, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '', '0.00', 0, '1', 0, '16,20', '1', '2', '2022-12-06 17:40:00', '2022-12-06 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'DERIVCO: MEMOQ ASSIGNMENT - LICENCE', '', '0.00', 'Auto', '', 'SingleJob -Translation (TRA)', '2022-12-06 17:40:46', '2022-12-06 17:41:21'),
(89, 118, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"950\",\"itemTotal\":\"950.00\",\"amtSum\":950}]', '950.00', 29, '1', 0, '17,23', '1', '2', '2022-12-07 21:18:00', '2022-12-12 07:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'Fasttranslator Purchase Order [#555870]', '', '950.00', 'Auto', '555870', 'SingleJob -Translation (TRA)', '2022-12-07 21:18:53', '2022-12-07 21:19:36'),
(90, 120, '1', 'Twitch Interactive | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"3\",\"itemTotal\":\"3.00\",\"amtSum\":3}]', '3.00', 0, '5', 0, '18,25', '1', '2', '2022-12-07 21:25:00', '2022-12-07 13:30:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'Attention Work - Deadline: Wednesday, 12/7/2022 | ', '', '3.00', 'Auto', '', 'SingleJob -Proofreading (PRF)', '2022-12-07 21:25:25', '2022-12-07 21:26:05'),
(91, 125, '1', 'Parker Hannifin | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"0,75\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"40\",\"itemTotal\":\"30.00\",\"amtSum\":30}]', '30.00', 25, '5', 0, '14,18', '1', '14', '2022-12-12 17:39:00', '2022-12-07 14:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'PO: Lingsoft project 983550 / PARKCH_2211_P0119 nb', '', '30.00', 'Auto', '983550', 'SingleJob -Proofreading (PRF)', '2022-12-12 17:39:42', '2022-12-12 17:42:43'),
(92, 126, '1', 'Tesla | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"93\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"10.23\",\"amtSum\":10.23},{\"quantity\":\"73\",\"pricelist\":\"Words Translation 50-74% Match\",\"itemPrice\":\"0,11\",\"itemTotal\":\"8.03\",\"amtSum\":8.03},{\"quantity\":\"3\",\"pricelist\":\"Words Translation 95-99% Match\",\"itemPrice\":\"0,027\",\"itemTotal\":\"0.081\",\"amtSum\":0.081},{\"quantity\":\"112\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":\"0\",\"itemTotal\":\"\",\"amtSum\":0}]', '18.34', 25, '1', 0, '14,18', '1', '14', '2022-12-12 17:46:00', '2022-12-08 11:45:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'PO: Lingsoft project 984030 / Tesla World Server P', '', '18.34', 'Auto', '984030', 'SingleJob -Translation (TRA)', '2022-12-12 17:46:10', '2022-12-12 17:51:28'),
(93, 127, '1', 'Tesla | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"544\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"59.84\",\"amtSum\":59.84},{\"quantity\":\"336\",\"pricelist\":\"Words Translation 50-74% Match\",\"itemPrice\":\"0,11\",\"itemTotal\":\"36.96\",\"amtSum\":36.96},{\"quantity\":\"71\",\"pricelist\":\"Words Translation 75-84% Match\",\"itemPrice\":\"0,044\",\"itemTotal\":\"3.124\",\"amtSum\":3.124},{\"quantity\":\"22\",\"pricelist\":\"Words Translation 85-94% Match\",\"itemPrice\":\"0,027\",\"itemTotal\":\"0.594\",\"amtSum\":0.594},{\"quantity\":\"51\",\"pricelist\":\"Words Translation 95-99% Match\",\"itemPrice\":\"0,027\",\"itemTotal\":\"1.377\",\"amtSum\":1.377},{\"quantity\":\"120\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":\"0\",\"itemTotal\":\"\",\"amtSum\":0}]', '101.90', 25, '1', 0, '14,18', '1', '14', '2022-12-12 17:54:00', '2022-12-08 16:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'PO: Lingsoft project 984032 / Tesla World Server P', '', '101.90', 'Auto', '984032', 'SingleJob -Translation (TRA)', '2022-12-12 17:54:45', '2022-12-12 17:56:23'),
(94, 128, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"10\",\"itemTotal\":\"10.00\",\"amtSum\":10}]', '10.00', 0, '5', 0, '18,25', '1', '14', '2022-12-12 17:59:00', '2022-12-09 12:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'Get started – the job is ready - Internet 458977', '', '10.00', 'Auto', '458977', 'SingleJob -Proofreading (PRF)', '2022-12-12 17:59:55', '2022-12-12 18:00:42'),
(95, 129, '1', 'ILOQ | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"212\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"23.32\",\"amtSum\":23.32},{\"quantity\":\"6\",\"pricelist\":\"Words Translation 85-94% Match\",\"itemPrice\":\"0,027\",\"itemTotal\":\"0.162\",\"amtSum\":0.162},{\"quantity\":\"6\",\"pricelist\":\"Words Translation 95-99% Match\",\"itemPrice\":\"0,027\",\"itemTotal\":\"0.162\",\"amtSum\":0.162},{\"quantity\":\"4\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":\"0\",\"itemTotal\":\"\",\"amtSum\":0}]', '23.64', 25, '1', 0, '14,18', '1', '14', '2022-12-12 18:02:00', '2022-12-09 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'Delivered', 'PO: Lingsoft project 984422 / 5 Series Manager D.2', '', '23.64', 'Auto', '984422', 'SingleJob -Translation (TRA)', '2022-12-12 18:02:49', '2022-12-12 18:04:13');

-- --------------------------------------------------------

--
-- Table structure for table `tms_item_status`
--

CREATE TABLE `tms_item_status` (
  `item_status_id` int(11) NOT NULL,
  `item_status_name` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_item_status`
--

INSERT INTO `tms_item_status` (`item_status_id`, `item_status_name`, `is_active`, `created_date`, `modified_date`) VALUES
(4, 'To be Assigned', 1, '2016-01-06 16:24:22', '2016-01-06 16:24:22'),
(5, 'In Progress', 1, '2016-01-06 16:24:29', '2016-01-06 16:24:29'),
(6, 'To be Delivered', 1, '2016-01-20 15:04:03', '2016-01-20 15:04:03'),
(7, 'Delivered', 1, '2016-01-20 15:04:07', '2016-01-20 15:04:07'),
(8, 'Approved', 1, '2016-01-20 15:04:12', '2016-01-20 15:04:12'),
(9, 'Invoiced', 1, '2016-01-20 15:04:19', '2016-01-20 15:04:19'),
(10, 'Paid', 1, '2016-01-20 15:04:24', '2016-01-20 15:04:24'),
(11, 'Without invoice', 1, '2016-01-20 15:04:30', '2016-01-20 15:04:30'),
(12, 'Cancelled', 1, '2016-01-20 15:04:34', '2016-01-20 15:04:34'),
(13, 'Completed by linguist', 0, '2016-01-20 15:04:34', '2016-01-20 15:04:34'),
(14, 'QA Ready', 1, '2016-01-20 15:04:34', '2016-01-20 15:04:34'),
(15, 'Overdue', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tms_jobs`
--

CREATE TABLE `tms_jobs` (
  `job_id` int(11) NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `job_code` varchar(255) NOT NULL,
  `job_representation` varchar(255) NOT NULL,
  `notes` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_jobs`
--

INSERT INTO `tms_jobs` (`job_id`, `service_name`, `job_code`, `job_representation`, `notes`, `created_date`, `modified_date`) VALUES
(1, 'Batch Delivery', 'BAD', 'default', 'vvvvvv', '2016-01-06 15:48:02', '2018-01-02 17:11:23'),
(2, 'Linguistic Quality Assurance', 'LQA', 'default', 'assadsad', '2016-01-30 13:01:28', '2022-12-04 00:20:59'),
(3, 'Desktop Publishing', 'DTP', 'project management', 'a', '2016-01-30 13:02:06', '2018-03-01 12:11:09'),
(4, 'Term & Style Guide Creation', 'TSC', 'automatic', 'hello', '2016-02-02 11:15:16', '2022-12-04 00:21:48'),
(6, 'Feedback', 'FED', 'default', 'test', '2017-03-07 16:25:41', '2018-01-02 17:12:13'),
(7, 'Search Engine Optimization', 'SEO', 'default', 'Start', '2017-08-02 12:55:50', '2018-01-02 17:12:32'),
(9, 'Translation', 'TRA', '', '', '2022-11-03 22:03:53', '2022-11-03 22:03:53'),
(10, 'Proofreading', 'PRF', '', '', '2022-11-03 22:04:17', '2022-11-03 22:04:17'),
(11, 'External Quality Assurance', 'EQA', '', '', '2022-11-04 16:45:10', '2022-12-04 00:24:01'),
(12, 'Machine Translation Post-Editing', 'MTP', '', '', '2022-12-01 19:23:46', '2022-12-04 00:23:18'),
(13, 'Linguistic Sign-Off', 'LSO', '', '', '2022-12-04 00:24:32', '2022-12-04 00:32:34'),
(14, 'Subtitling', 'SUB', '', '', '2022-12-04 00:25:01', '2022-12-04 00:25:01'),
(15, 'Test Review', 'TER', '', '', '2022-12-04 00:26:17', '2022-12-04 00:26:17'),
(16, 'Transcription', 'TRS', '', '', '2022-12-04 00:27:27', '2022-12-04 00:27:27'),
(17, 'Transcreation', 'TRC', '', '', '2022-12-04 00:27:55', '2022-12-04 00:27:55'),
(18, 'Screenshot Review', 'SSR', '', '', '2022-12-04 00:28:19', '2022-12-04 00:28:19'),
(19, 'Migration', 'MIG', '', '', '2022-12-04 00:29:49', '2022-12-04 00:29:49'),
(20, 'Reconciliation', 'REC', '', '', '2022-12-04 00:31:30', '2022-12-04 00:31:30'),
(21, 'Cognitive Debriefing', 'COG', '', '', '2022-12-04 00:32:09', '2022-12-04 00:32:09'),
(22, 'Testing', 'TES', '', '', '2022-12-04 01:28:24', '2022-12-04 01:28:24');

-- --------------------------------------------------------

--
-- Table structure for table `tms_job_chain`
--

CREATE TABLE `tms_job_chain` (
  `job_chain_id` int(11) NOT NULL,
  `job_name` varchar(255) NOT NULL,
  `job_status` varchar(255) NOT NULL COMMENT 'in-preparation="1",released="2",released-for-selected=customer="3",canceled="4"',
  `project_type` int(11) NOT NULL,
  `creator` varchar(255) NOT NULL,
  `customer` longtext NOT NULL,
  `all_customer` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1 for All customer',
  `description` varchar(255) NOT NULL,
  `workfolw_status` varchar(255) NOT NULL COMMENT 'workflowcomplete="2,4",unknown="1,3"',
  `sortedJobsJson` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_job_chain`
--

INSERT INTO `tms_job_chain` (`job_chain_id`, `job_name`, `job_status`, `project_type`, `creator`, `customer`, `all_customer`, `description`, `workfolw_status`, `sortedJobsJson`, `created_date`, `updated_date`) VALUES
(12, 'Unknown', '', 0, 'TMS Admin', '[]', 1, '', '', '[{\"id\":2}]', '2019-01-02 15:51:55', '2019-01-02 15:53:52'),
(17, 'testChain', '1', 1, 'TMS Admin', '[{\"Cuscode\":\"c\",\"Cusid\":\"9\",\"Cusname\":\"Scorewarrior Limited\"}]', 0, '', '', '[{\"id\":7},{\"id\":8}]', '2019-01-02 19:13:59', '2022-11-28 18:08:33'),
(22, 'Unknown', '', 0, 'TMS Admin', '[]', 1, '', '', '[{\"id\":12},{\"id\":13},{\"id\":14}]', '2022-11-08 15:18:00', '2022-11-08 15:18:29'),
(26, 'Translation & Proofreading', '1', 6, 'TMS Admin', '[]', 1, '', '', '[{\"id\":16},{\"id\":17}]', '2022-12-04 00:41:20', '2022-12-04 00:43:32');

-- --------------------------------------------------------

--
-- Table structure for table `tms_job_events`
--

CREATE TABLE `tms_job_events` (
  `event_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `start` varchar(255) NOT NULL,
  `end` varchar(255) NOT NULL,
  `order_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tms_job_workinghour`
--

CREATE TABLE `tms_job_workinghour` (
  `wh_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `wh_data` text NOT NULL,
  `for_type` int(11) NOT NULL,
  `wh_type_value` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tms_knowledge_articles`
--

CREATE TABLE `tms_knowledge_articles` (
  `article_id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `article_discription` varchar(255) NOT NULL,
  `section` longblob NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_knowledge_articles`
--

INSERT INTO `tms_knowledge_articles` (`article_id`, `category`, `title`, `article_discription`, `section`, `created_date`, `modified_date`) VALUES
(9, 11, 'Signature Pictures', 'The Tab shortcode allows your customers to walk through steps of a tutorial', 0x3c703e486572652061726520746865207069637475726573207573656420666f72207369676e61747572657320696e20506c756e657420616e64204f75746c6f6f6b3c2f703e3c703e3c696d6720636c6173733d2266722d6469622066722d647261676761626c6522207372633d222f746d734e65772f75706c6f6164732f75706c6f61645f696d6167652f373231666335356265393438306164336264613538636264313663383861326464626565306236392e6a706722207374796c653d2277696474683a203130303070783b223e3c2f703e3c703e3c62723e3c2f703e, '2018-07-18 16:13:06', '2018-07-18 16:13:06'),
(10, 13, 'Holiday requests, sickness and overtime work in Breathe HR', 'The Tab shortcode allows your customers to walk through steps of a tutorial', 0x3c703e3c62723e3c2f703e3c68313e3c7374726f6e673e417070726f7665206f722072656a65637420686f6c6964617920726571756573747320696e20427265617468652048523c2f7374726f6e673e3c2f68313e3c703e3c62723e596f752077696c6c20726563656976656420616e20656d61696c206e6f74696669636174696f6e207768656e20616e79206f6620796f757220656d706c6f796565732068617665207265717565737465642061206c656176652e3c2f703e3c703e436c69636b206f6e20746865206c696e6b20696e2074686520656d61696c2c206f72206c6f6720696e20746f20796f75722070726f66696c6520616e64206e6176696761746520746f20796f75722044617368626f6172642e20596f752077696c6c20616c77617973206861766520616e206f76657276696577206f66206c656176657320796f75206e65656420746f20617070726f76652c20616e64206f74686572206f75747374616e64696e67207461736b73206f6e20796f75722044617368626f6172642e3c2f703e3c703e416363657074206f72207265667573652074686520686f6c6964617920726571756573742e3c2f703e3c68363e3c7374726f6e673e446966666572656e74207479706573206f66206c656176653c2f7374726f6e673e3c2f68363e3c703e3c7374726f6e673e486f6c696461793c2f7374726f6e673e3c62723e50616964206c656176652f207661636174696f6e3c2f703e3c703e3c7374726f6e673e4f74686572206c656176653c2f7374726f6e673e3c62723e506c6561736520737065636966792074797065206f66206f74686572206c6561766520617320666f6c6c6f77733a3c2f703e3c703e426f6e75732064617920266e646173683b20646f206e6f74207573653c62723e436f6d70656e7361746f72792074696d65206f666620266e646173683b207768656e20736f6d656f6e652061726520616c6c6f7765642074696d65206f666620746f20636f6d70656e7361746520666f72206f7665722d74696d6520776f726b3c62723e446561746820696e2066616d696c7920266e646173683b206163636f7264696e6720746f207468652042756c67617269616e206c61772070656f706c652061726520656e7469746c656420746f20322064617973206f662070616964206c65617665207768656e206120636c6f73652066616d696c79206d656d62657220646965732c20646f63756d656e746174696f6e2069732072657175697265643c62723e4d617465726e69747920266e646173683b206d617465726e697479206c656176653c62723e4d65646963616c206170706f696e746d656e7420266e646173683b20646f206e6f74207573653c62723e4f7468657220266e646173683b20646f206e6f74207573653c62723e506172656e74616c20266e646173683b20646f206e6f74207573652028666174686572732061726520656e7469746c656420746f2061207369636b206c65617665293c62723e556e70616964206c6561766520266e646173683b20756e636f6d70656e7361746564206c656176653c62723e576f726b696e672066726f6d20686f6d6520266e646173683b20776f726b696e672066726f6d20686f6d652c20776f726b696e67206173206e6f726d616c20616e6420636f6d70656e73617465642061732061206e6f726d616c20776f726b696e67206461793c62723e576f726b696e67206f6e206120636f6d70656e736174696e672064617920266e646173683b207768656e20736f6d656f6e652063686f736520746f20776f726b206f6e2061207075626c696320686f6c6964617920696e7374656164206f66206120636f6d70656e736174696e67206461793c62723e576f726b696e67206f6e20686f6c6964617920266e646173683b207768656e20736f6d656f6e652061726520776f726b696e67206f6e2061207075626c696320686f6c6964617920616e6420697320656e7469746c656420746f20646f75626c65207061796d656e743c2f703e3c703e4f6e6520706572736f6e2063616e20626520676f6e652066726f6d2065616368206465706172746d656e74206174207468652074696d6520666f7220746865206465706172746d656e747320696e766f6c76656420696e20746865206461696c7920776f726b666c6f772e3c62723e4966207468652068656164206f6620746865206465706172746d656e7420697320676f6e652c206e6f206f6e6520656c73652063616e20626520617761792e3c62723e41737369676e20796f7572207461736b73202f2067657420636f766572616765206265666f726520796f75206c656176652e3c62723e5768656e20736f6d656f6e65207468617420776f726b7320746865206c61737420736869667420697320676f6e652c20736f6d656f6e6520656c7365206861766520746f20636f76657220736f20746865206465706172746d656e747320776f726b696e6720686f7572732072656d61696e73207468652073616d652e3c2f703e3c68313e5369636b6e6573733c2f68313e3c703e5768656e2070656f706c6520617265207369636b20616e6420756e61626c6520746f20776f726b2c20746865792061726520726573706f6e7369626c6520666f72207375626d697474696e67207468656972206f776e207369636b206c656176657320696e20427265617468652048522e3c2f703e3c703e596f7572206a6f6220697320746f206d616b6520737572652074686174207468657920646f2c20616e642074686174207468652064617465732061726520636f72726563742e3c2f703e3c703e4d616b65207375726520796f7572207465616d20676574732061207369636b206c656176652070617065722066726f6d2074686520646f63746f7220616e64206272696e6720697420746f204163636f756e74696e672e3c2f703e3c703e3c62723e3c2f703e3c68313e4f76657274696d6520776f726b20696e20746865207765656b656e64733c2f68313e3c703e4966206d656d62657273206f6620796f75722073746166662061726520726571756972656420746f20776f726b20696e20746865207765656b656e642c20746865792077696c6c20626520636f6d70656e7361746564206261736564206f6e20746865206e756d626572206f6620686f75727320776f726b65642e3c2f703e3c703e5768656e204163636f756e74696e67206172652063616c63756c6174696e67207468652073616c61726965732c20746865792077696c6c2073656e6420796f752061207265706f7274207769746820616e206f76657276696577206f66206f76657274696d6520776f726b20666f7220796f7572207465616d2e3c2f703e3c703e52657669657720746865207265706f72742c20616e6420617070726f7665206f722064656e7920746865206f76657274696d6520636f6d70656e736174696f6e2e3c2f703e3c703e4f6e6c7920737461666620746861742061726520726571756972656420746f20776f726b20647572696e67207765656b656e6473206279207468656972206d616e616765722028796f75292061726520656e7469746c656420746f20636f6d70656e736174696f6e20666f72206f76657274696d6520776f726b2e3c2f703e3c703e4f76657274696d6520776f726b20696e20746865207765656b656e6473206172652070616964206f6e20616e20686f75726c792072617465202b3735252e3c2f703e3c703e3c62723e3c2f703e3c703e4c6561766520746861742661637574653b73206e6f74207375626d697474656420696e20427265617468652048522077696c6c206e6f7420626520706169642f636f6d70656e73617465642e20506c65617365206d616b65207375726520616c6c206d656d62657273206f6620796f7572207465616d207375626d697420616e79206b696e64206f66206c656176652c20686f6c696461792c207369636b206c656176652c206574632e20696e20427265617468652048522e3c2f703e3c703e3c62723e3c2f703e, '2016-12-27 16:26:00', '2016-12-27 16:26:00'),
(11, 12, 'Why choose KnowAll?', 'KnowAll turns your WordPress powered site into a help center for your product or service, it organises your content into a Knowledge Base where customers can access support articles 24/7, be that documentation, FAQs or tutorials. Using this theme you can:', 0x3c6865616465723e3c703e3c62723e3c2f703e3c68313e3c696d6720636c6173733d2266722d647261676761626c652066722d66696c2066722d64696222207372633d2268747470733a2f2f692e66726f616c612e636f6d2f6173736574732f70686f746f31302e6a70672220646174612d69643d2231302220646174612d747970653d22696d6167652220646174612d6e616d653d22496d61676520323031362d30382d31342061742030343a30383a35322e6a706722207374796c653d2277696474683a2033303070783b223e3c2f68313e3c68313e486f7720446f65732074686520313420446179204672656520547269616c20576f726b3f3c2f68313e3c2f6865616465723e3c703e3c7374726f6e673e5468697320697320616e206578616d706c652061727469636c652e20497420697320696e74656e64656420746f2064656d6f6e73747261746520736f6d65206f6620746865206b6579207374796c696e6720656c656d656e747320666f72203c6120687265663d22687474703a2f2f6865726f7468656d65732e636f6d2f7468656d65732f6b6e6f77616c6c223e4b6e6f77416c6c2c20746865204b6e6f776c656467652042617365207468656d6520666f7220576f726450726573733c2f613e2e3c2f7374726f6e673e3c2f703e3c68313e5768792063686f6f7365204b6e6f77416c6c3f3c2f68313e3c703e4b6e6f77416c6c207475726e7320796f757220576f7264507265737320706f7765726564207369746520696e746f20612068656c702063656e74657220666f7220796f75722070726f64756374206f7220736572766963652c206974206f7267616e6973657320796f757220636f6e74656e7420696e746f2061204b6e6f776c65646765204261736520776865726520637573746f6d6572732063616e2061636365737320737570706f72742061727469636c65732032342f372c206265207468617420646f63756d656e746174696f6e2c2046415173206f72207475746f7269616c732e205573696e672074686973207468656d6520796f752063616e3a3c2f703e3c756c3e3c6c693e5265647563652074696d6520616e64206d6f6e6579207370656e74206f6e207265706574697469766520737570706f727420717565726965733c2f6c693e3c6c693e50726f76696465206120737570706f72742063656e74657220666f7220637573746f6d65727320746f206c6561726e20616e6420646973636f766572206d6f72652061626f757420796f75722070726f64756374733c2f6c693e3c6c693e5472616e73666f726d206672757374726174656420737570706f727420656d61696c7320696e746f2068617070792c206c6f79616c20637573746f6d6572733c2f6c693e3c2f756c3e3c703e5061636b6167656420776974682075736566756c2073686f7274636f6465733c2f703e3c703e4b6e6f77416c6c20636f6d6573207061636b61676564207769746820616c6c2074686520746f6f6c7320796f75206e65656420746f2073657420757020616e642072756e2061207375636365737366756c20737570706f72742063656e74657220696e636c7564696e672075736566756c2073686f7274636f64657320616e64207374796c696e6720656c656d656e747320746f206d616b6520796f757220636f6e74656e74207374616e64206f75742e3c2f703e3c68313e4b6e6f77416c6c2069732042656175746966756c2e3c2f68313e3c703e436c65616e2c20666f6375737365642064657369676e20656e737572657320637573746f6d6572732063616e2061636365737320696e666f726d6174696f6e20717569636b6c7920616e64206566666563746976656c792c20796f757220636f6e74656e742069732077656c6c2070726573656e74656420616e64206675727468657220737570706f727420776974682061207469636b6574696e672073797374656d206f7220656d61696c20666f726d20697320616c7761797320636c6f73652061742068616e642e3c2f703e3c68323e57686f20617265204865726f5468656d65733f3c2f68323e3c68313e546865204b6e6f776c656467652042617365207370656369616c697374733c2f68313e3c703e4b6e6f77416c6c20686173206265656e20646576656c6f706564206279204865726f5468656d65732c20746865207370656369616c6973747320696e204b6e6f776c65646765204261736520616e6420737570706f72742070726f647563747320666f7220576f726450726573732e2054727573746564206279206f7665722031352c30303020637573746f6d65727320776f726c64776964652c206f757220736f6674776172652073657276657320696e646976696475616c7320616e6420636f6d70616e696573207365656b696e6720746f20696d70726f766520746865697220637573746f6d657220737570706f7274206f7065726174696f6e732e3c2f703e3c68313e5072656d69756d207468656d6520646576656c6f706d656e743c2f68313e3c703e5765206d616465206f7572206e616d652066726f6d2073656c6c696e67206f6e2074686520776f726c6426727371756f3b73206c617267657374207468656d65206d61726b6574706c61636520616e6420656e6a6f79206e756d65726f75732074657374696d6f6e69616c732066726f6d2070656f706c65206c696b6520796f752e204f75722070726f64756374732068617665206265656e206665617475726564206f6e20746f70207468656d65206c697374696e672077656273697465732c206672657175656e746c7920686967686c7920726174656420616e6420726576696577656420627920657870657274732e205765206e6f77206f66666572206f75722070726f6475637473206469726563746c792c206d65616e696e6720796f75207265636569766520657863656c6c656e742073616c657320616e6420737570706f72742066726f6d2070656f706c65207468617420636172652061626f75742064656c69766572696e67207468652062657374206b6e6f776c6564676520626173652070726f647563747320666f7220796f757220627573696e6573732e3c2f703e3c68313e4865726f696320537570706f72743c2f68313e3c703e4f75722070726f6475637473206172652066656174757265207269636820696e20746865207468696e67732074686174206d617474657220776974686f75742074686520756e6e65636573736172792062757264656e206f66207468656d657320746861742074727920746f20706c656173652065766572796f6e652e204b6e6f77416c6c2068617320776173206465766973656420616e6420646576656c6f70656420707572656c792061732061206b6e6f776c656467652062617365207468656d652c206d65616e696e6720697420686173207468652064697374696c6c6564206578706572746973652066726f6d207365766572616c20737570706f7274207468656d657320616e64206120706f77657266756c206b6e6f776c65646765206261736520706c7567696e2062616b656420696e2e3c2f703e3c68313e537570706f72742066726f6d2074686520457870657274732e3c2f68313e3c703e576520757365206f7572206f776e2070726f647563747320746f2070726f76696465204865726f696320737570706f727420746f206f757220637573746f6d6572732c20696e206164646974696f6e20746f206f6e652d746f2d6f6e6520656d61696c20737570706f72742066726f6d2074686520646576656c6f7065727320616e6420737570706f7274207465616d2074686174206275696c742074686520736f6674776172652c206e6f206f6e652069732062657474657220746f2068656c7020796f752067657420746865206d6f73742066726f6d20796f7572206e6577204b6e6f776c6564676520426173652e3c2f703e3c626c6f636b71756f74653e3c703e266c6471756f3b417320616e206167656e6379207468617420776f726b7320616c6d6f7374206578636c75736976656c79207769746820576f7264507265737320492063616e26727371756f3b74207468696e6b206f66206120626574746572206669742e205468652062656e656669747320617265206d6f7265207468616e206a75737420576f726450726573732062617365642074686f7567683a207765207573656420746f207370656e6420243235206576657279206d6f6e7468206f6e2061206b6e6f776c6564676520626173652c20616e6420776520636f756c646e26727371756f3b74206576656e206578706f72742074686520646174612e204e6f7720776520617265206672656520746f20646f20776861742077652077616e742077697468206f757220646174612c20616e64207574696c697365206974206265747465722e20546865206c61636b206f66207265737472696374696f6e732c206f70656e7320736f206d616e7920706f73736962696c69746965732e20492063616e26727371756f3b74207265636f6d6d656e64204865726f6963204b6e6f776c65646765204261736520656e6f7567682c20697426727371756f3b732077656c6c2064657369676e656420616e64206665656c73206c696b652061207472756c79207072656d69756d20576f726450726573732070726f647563742e26726471756f3b20266e646173683b203c656d3e4e617468616e204d6f6e6b2c20534d494c453c2f656d3e3c2f703e3c2f626c6f636b71756f74653e3c703e4865726f5468656d6573207374616e647320627920656163682073616c65206f66204b6e6f77416c6c2c207768696368206973206261636b6564206279206f75722033302d646179206d6f6e6579206261636b2067756172616e7465652c207768696368206d65616e7320696620796f752063616e2074727920746865207468656d65207269736b2d6672656520666f72203330206461797320616e6420696620796f7520646f6e26727371756f3b7420636f6d706c6574656c79206c6f7665206f7572207468656d65206f7220736572766963652c20796f752077696c6c207265636569766520612066756c6c20726566756e642e3c2f703e3c68313e446f776e6c6f616420746f646179213c2f68313e3c703e5769746820796f75722070757263686173652c20796f75207265636569766520696e7374616e742061636365737320746f20646f776e6c6f616420616e6420696e7374616c6c204b6e6f77416c6c2e204275696c6420612066756c6c792066756e6374696f6e616c206b6e6f776c65646765206261736520737570706f72742063656e74657220696e206d696e7574657320746f2062656e656669742066726f6d20666577657220737570706f7274207175657269657320616e64206861707069657220637573746f6d6572732e3c2f703e3c703e496620796f75206861766520616e7920717565726965732c206665656c206672656520746f20636f6e746163742075732e204b6e6f77416c6c20697320617661696c61626c65206578636c75736976656c79206f6e3c6120687265663d22687474703a2f2f6865726f7468656d65732e636f6d2f223e4865726f5468656d65732e636f6d3c2f613e2e20596f752063616e20616363657373207468652066756c6c203c6120687265663d22687474703a2f2f6865726f7468656d65732e636f6d2f7468656d65732f6b6e6f77616c6c223e4b6e6f77416c6c2073616c6573207061676520686572653c2f613e2e3c2f703e3c68323e4d6f72652074686174206a75737420612064656d6f6e7374726174696f6e2668656c6c69703b3c2f68323e3c703e446973636f7665722077686174204b6e6f77416c6c2063616e20646f20666f7220796f7520616e6420796f757220737570706f7274207465616d2c206578706c6f726520746869732064656d6f207369746520746f20657870657269656e6365206a75737420736f6d65206f6620746865206772656174206665617475726573204b6e6f77416c6c2068617320746f206f666665723c2f703e3c703e3c696d6720636c6173733d2266722d6469622066722d647261676761626c6522207372633d2268747470733a2f2f696d616765732e706578656c732e636f6d2f70686f746f732f36373633362f726f73652d626c75652d666c6f7765722d726f73652d626c6f6f6d732d36373633362e6a7065673f6175746f3d636f6d707265737326616d703b63733d74696e797372676226616d703b683d33353022207374796c653d2277696474683a2033303070783b223e3c2f703e, '2018-09-26 17:10:06', '2018-09-26 17:10:06'),
(13, 20, 'Getting started for new users', 'Getting started for new users', 0x3c703e57656c636f6d652061626f617264212057652661706f733b76652070757420746f676574686572207468697320677569646520746f2068656c7020796f7520676574207374617274656420616e64206d616b6520536c61636b20776f726b20666f7220796f752e3c2f703e3c703e266e6273703b3c2f703e3c703e3c62723e3c2f703e3c6831207469746c653d2254616b656177617973223e54616b6561776179733c2f68313e3c756c3e3c6c693e3c6120687265663d2268747470733a2f2f736c61636b2e636f6d2f646f776e6c6f616473223e3c7374726f6e673e446f776e6c6f6164206f757220617070733c2f7374726f6e673e3c2f613e3c7370616e3e266e6273703b3c2f7370616e3e666f72206465736b746f7020616e64206d6f62696c6520746f2067657420746865206265737420536c61636b20657870657269656e63652e3c2f6c693e3c6c693e3c7374726f6e673e557365207075626c6963206368616e6e656c73266e6273703b3c2f7374726f6e673e746f206b65657020796f757220776f726b207472616e73706172656e742e20546865736520636f6e766572736174696f6e7320696e7374616e746c792063726561746520612073656172636861626c652061726368697665206f66206b6e6f776c6564676520266d646173683b206c696b6520796f7572207465616d2661706f733b7320636f6c6c65637469766520627261696e2e3c2f6c693e3c6c693e3c7374726f6e673e437573746f6d697a6520796f7572206e6f74696669636174696f6e733c2f7374726f6e673e3c7370616e3e266e6273703b3c2f7370616e3e736f20796f7520646f6e26727371756f3b74206d69737320616e797468696e6720746861742661706f733b7320696d706f7274616e7420746f20796f752e3c2f6c693e3c6c693e3c7374726f6e673e53686172652066696c65733c2f7374726f6e673e3c7370616e3e266e6273703b3c2f7370616e3e696e20536c61636b20616e64206f74686572732063616e206769766520796f7520666565646261636b2c20616c6c20696e206f6e6520706c6163652e3c2f6c693e3c6c693e3c7374726f6e673e4578706c6f7265206f7572266e6273703b3c2f7374726f6e673e3c6120687265663d2268747470733a2f2f736c61636b2e636f6d2f61707073223e3c7374726f6e673e4170703c2f7374726f6e673e203c7374726f6e673e4469726563746f72793c2f7374726f6e673e3c2f613e3c7370616e3e266e6273703b3c2f7370616e3e746f20737461727420696e746567726174696e672074686520746f6f6c7320796f7520616c726561647920757365206469726563746c7920696e746f20536c61636b20266d646173683b20616e6420646973636f766572206e6577206170707320616c6f6e6720746865207761792e3c2f6c693e3c2f756c3e3c703e3c62723e3c2f703e3c6831207469746c653d225369676e205570223e5369676e2075703c2f68313e3c703e496d6167696e6520616c6c20796f7572207465616d20636f6d6d756e69636174696f6e20696e206f6e6520706c6163652c20696e7374616e746c792073656172636861626c652c20617661696c61626c6520776865726576657220796f7520676f2e205468617426727371756f3b7320536c61636b2e204f6e636520796f7572206f7267616e697a6174696f6e20686173203c6120687265663d223230363834353331372d4372656174696e672d612d536c61636b2d7465616d2e68746d6c223e637265617465642061207465616d3c2f613e20666f7220796f752c20796f752063616e203c6120687265663d223231323637353235372d4372656174696e672d612d536c61636b2d6163636f756e742e68746d6c223e6a6f696e2074686520636f6e766572736174696f6e3c2f613e2068657265207573696e6720796f757220776f726b20656d61696c20616464726573733a203c6120687265663d2268747470733a2f2f6d792e736c61636b2e636f6d2f223e3c2f613e3c6120687265663d2268747470733a2f2f6d792e736c61636b2e636f6d223e68747470733a2f2f6d792e736c61636b2e636f6d3c2f613e2e3c2f703e3c703e4f722c20636c69636b203c7374726f6e673e4a6f696e207465616d3c2f7374726f6e673e20696620796f75207265636569766520616e20656d61696c20696e7669746174696f6e20746f206a6f696e20796f7572206f7267616e697a6174696f6e2661706f733b7320536c61636b207465616d2e3c2f703e3c703e3c62723e3c2f703e3c703e576520616c736f207265636f6d6d656e6420796f7520646f776e6c6f6164206f7572206170707320666f7220694f532c20416e64726f69642c2057696e646f77732c20616e64204d6163206174203c6120687265663d2268747470733a2f2f736c61636b2e636f6d2f646f776e6c6f616473223e3c2f613e3c6120687265663d2268747470733a2f2f736c61636b2e636f6d2f646f776e6c6f616473223e68747470733a2f2f736c61636b2e636f6d2f646f776e6c6f6164733c2f613e2e3c2f703e3c6831207469746c653d224368616e6e656c73223e4368616e6e656c733a20776865726520746865206d616769632068617070656e733c2f68313e3c703e3c7374726f6e673e4d6f737420636f6e766572736174696f6e7320696e20536c61636b20617265206f7267616e697a656420696e746f207075626c6963206368616e6e656c7320776869636820616e796f6e65206f6e20796f7572207465616d2063616e206a6f696e2e3c2f7374726f6e673e20596f752063616e20616c736f2073656e64206d6573736167657320707269766174656c792c2062757420746865207472756520706f776572206f6620536c61636b20636f6d65732066726f6d20686176696e6720636f6e766572736174696f6e732065766572796f6e65206f6e20746865207465616d2063616e207365652e2054686973207472616e73706172656e6379206d65616e7320697426727371756f3b7320717569636b20746f2066696e64206f7574207768617426727371756f3b7320676f696e67206f6e20616c6c206163726f737320746865207465616d2c20616e64207768656e20736f6d656f6e65206e6577206a6f696e732c20616c6c2074686520696e666f726d6174696f6e2074686579206e656564206973206c616964206f75742c20726561647920666f72207468656d20746f2072656164207570206f6e2e3c2f703e3c703e546f207072696f726974697a6520746865207468696e677320746861742061726520696d706f7274616e7420746f20796f752c20747279203c7374726f6e673e3c6120687265663d223230313333313031362d5573696e672d73746172732e68746d6c223e7374617272696e673c2f613e20612068616e6466756c206f6620796f7572206661766f72697465206368616e6e656c733c2f7374726f6e673e2e204a757374206d6f757365206f76657220746865206368616e6e656c206e616d6520616e6420636c69636b2074686520737461722069636f6e203c656d3e266e6273703b3c2f656d3e20746f2061646420697420746f20796f75722053746172726564206c6973742e3c2f703e3c703e5765207265636f6d6d656e64207374617272696e67206368616e6e656c73207468617420617265206d6f737420657373656e7469616c20796f757220776f726b3a20796f7572207465616d2c20796f75722070726f6a656374732c206f72207570636f6d696e67206576656e747320796f75206e65656420746f206b65657020616e20657965206f6e2e204e6f7720796f752063616e20656173696c7920636865636b207468657365206368616e6e656c73206d6f7265206672657175656e746c792c207768696c65207363616e6e696e67206f7468657273206f6e6c79206f6e6365206f722074776963652061206461792e3c2f703e3c703e3c62723e3c2f703e3c703e42657369646573207075626c6963206368616e6e656c7320616e6420646972656374206d657373616765732c20796f752063616e20616c736f203c6120687265663d223230313430323239372d4372656174696e672d612d6368616e6e656c2e68746d6c223e637265617465203c7374726f6e673e70726976617465206368616e6e656c733c2f7374726f6e673e3c2f613e666f72207375626a656374732074686174206172652073656e7369746976652c20636f6e666964656e7469616c2c206f722073686f756c64206265206f7468657277697365206c696d697465642e20596f752063616e20616c736f2063726561746520612067726f7570206d657373616765206f6620757020746f206569676874206f746865722070656f706c6520696620796f752068617665206120636f75706c65206f66207465616d6d61746573207468617420796f7520636f6c6c61626f72617465207769746820696e20612073686f72742d7465726d2c206c696768747765696768742062617369732e2050726976617465206368616e6e656c7320616e642067726f7570206d657373616765732077696c6c206f6e6c792062652076697369626c6520746f2074686f736520696e20746865206368616e6e656c206f722067726f75702e3c2f703e3c703e5768656e20696e20646f7562742c203c6120687265663d223230313430323239372d4372656174696e672d612d6368616e6e656c2e68746d6c223e3c7374726f6e673e6372656174652061207075626c6963206368616e6e656c3c2f7374726f6e673e3c2f613e2e205075626c696320636f6e766572736174696f6e732061726520686f7720796f75203c7374726f6e673e6275696c642061206461746162617365206f66206f7267616e697a6174696f6e616c206b6e6f776c656467652077697468207a65726f206566666f72743c2f7374726f6e673e266d646173683b616e642061206b65792077617920746f206472617720796f7572207465616d20696e746f20536c61636b2e3c2f703e3c703e5768696c65203c6120687265663d223230313435373130372d53656e64696e672d616e642d72656164696e672d6d657373616765732e68746d6c223e73656e64696e67206d657373616765733c2f613e20696e20536c61636b206973207072657474792073656c662d6578706c616e61746f72792c20746865726520617265206120666577206d617474657273206f662065746971756574746520776f72746820706f696e74696e67206f75742e203c7374726f6e673e3c6120687265663d223230353234303132372d5573696e672d6d656e74696f6e732e68746d6c223e55736520406d656e74696f6e733c2f613e20746f2067657420736f6d656f6e6526727371756f3b7320617474656e74696f6e20696e2061206368616e6e656c3c2f7374726f6e673e2e3c7374726f6e673e266e6273703b54797065204020666f6c6c6f77656420627920746865697220757365726e616d652c20652e672e20406a646f653c2f7374726f6e673e2e205468657926727371756f3b6c6c20736565206120726564206261646765206f6e20746865206368616e6e656c20616e64206265206e6f7469666965642076696120656d61696c206f72207468656972206d6f62696c6520646576696365206966207468657926727371756f3b7265206e6f742061637469766520696e20536c61636b2e203c7374726f6e673e596f752063616e20616c736f206e6f746966792065766572796f6e6520696e2061206368616e6e656c20627920747970696e6720406368616e6e656c2c2062757420706c656173652075736520746869732073706172696e676c79213c2f7374726f6e673e205768696c6520697426727371756f3b732075736566756c20666f7220696d706f7274616e74203c6120687265663d223230323030393634362d4d616b696e672d616e6e6f756e63656d656e74732e68746d6c223e616e6e6f756e63656d656e74733c2f613e2c2069742063616e20717569636b6c79206265206469737472616374696e67206966206162757365642e266e6273703b3c2f703e3c6831207469746c653d22536c61636b20746f20796f7572206e65656473223e536c61636b20746f20796f7572206e656564733c2f68313e3c703e546865205465616d204d656e75206973206c6f6361746564206e65787420746f20796f7572206e616d6520696e20746865207570706572206c65667420636f726e65722e20486572652c20796f7526727371756f3b6c6c2066696e64206f7074696f6e7320746f2073657420757020536c61636b20696e206120776179207468617420737569747320796f752e3c2f703e3c7020616c69676e3d2263656e746572223e3c62723e3c2f703e3c6831207469746c653d2253657474696e67207570206e6f74696669636174696f6e73223e53657474696e67207570206e6f74696669636174696f6e733c2f68313e3c703e556e646572203c7374726f6e673e507265666572656e6365733c2f7374726f6e673e2c20796f7526727371756f3b6c6c2066696e6420686967686c7920636f6e666967757261626c65203c6120687265663d223230313839353133382d556e6465727374616e64696e672d536c61636b2d6e6f74696669636174696f6e732e68746d6c223e6e6f74696669636174696f6e733c2f613e20746f206d616b65207375726520796f75207365652074686520696d706f7274616e7420737475666620617320736f6f6e20617320796f75206e65656420746f20776974686f7574206265696e6720646973747261637465642062792074686520726573742e20496e20636f6d70617469626c652062726f777365727320616e64206f7572206465736b746f70206170702c20536c61636b2077696c6c2073686f77203c6120687265663d223230313335353135362d4465736b746f702d6e6f74696669636174696f6e732e68746d6c223e3c7374726f6e673e6465736b746f70206e6f74696669636174696f6e733c2f7374726f6e673e3c2f613e207768656e20796f7526727371756f3b7265206d656e74696f6e656420696e2061206368616e6e656c2e205768656e6576657220796f7526727371756f3b7265206e6f7420616374697665206f6e20536c61636b2c206166746572206120666577206d696e7574657320776526727371756f3b6c6c2073656e64206569746865722061203c6120687265663d223230313339383435372d4d6f62696c652d707573682d6e6f74696669636174696f6e732e68746d6c223e3c7374726f6e673e6d6f62696c652070757368206e6f74696669636174696f6e3c2f7374726f6e673e3c2f613e206f72203c6120687265663d223230313634393237332d456d61696c2d6e6f74696669636174696f6e732e68746d6c223e3c7374726f6e673e656d61696c206e6f74696669636174696f6e3c2f7374726f6e673e3c2f613e20646570656e64696e67206f6e20796f757220707265666572656e63657320616e64207768657468657220796f75206861766520746865206d6f62696c652061707020696e7374616c6c65642e3c2f703e3c703e596f752063616e20616c736f20637573746f6d697a6520796f7572203c6120687265663d223230313634393332332d4368616e6e656c2d6e6f74696669636174696f6e2d707265666572656e6365732e68746d6c223e6e6f74696669636174696f6e2073657474696e677320666f7220616e79206368616e6e656c3c2f613e2c20646570656e64696e67206f6e20686f77206163746976656c7920796f752077616e7420746f206b6565702075702077697468207468617420636f6e766572736174696f6e2e2054686174207761792c20796f752063616e203c6120687265663d223230343431313433332d4d7574696e672d612d6368616e6e656c2e68746d6c223e3c7374726f6e673e6d757465206368616e6e656c733c2f7374726f6e673e3c2f613e206c696b6520796f7572207465616d26727371756f3b7320696e646563697369766520236c756e6368206368616e6e656c2c206275742063686f6f736520746f20676574203c7374726f6e673e6e6f746966696564206f66206576657279206d6573736167653c2f7374726f6e673e20736f20796f75206e65766572206d69737320612063757465206b697474656e207069637475726520696e20236361747320616761696e2e3c2f703e3c703e3c62723e3c2f703e3c703e466f72206368616e6e656c7320796f752077616e7420746f20626520612070617274206f66206275742063616e26727371756f3b74206b65657020757020776974682c203c6120687265663d223230313339383436372d486967686c696768742d776f72642d6e6f74696669636174696f6e732e68746d6c223e3c7374726f6e673e686967686c6967687420776f7264733c2f7374726f6e673e3c2f613e2061726520766572792075736566756c2e203c7374726f6e673e416e792074696d6520736f6d656f6e65206d656e74696f6e73206f6e65206f6620796f757220686967686c6967687420776f726473206f7220706872617365732c20796f7526727371756f3b6c6c206265206e6f7469666965642e3c2f7374726f6e673e2055736520697420666f7220796f7572206e616d652c20796f7572206e69636b6e616d65732c20796f75722070726f6a656374732c20637573746f6d6572732c207465616d732c206172656173206f6620696e7465726573742c206574632e20496620796f75207265636569766520746f6f206d616e79206e6f74696669636174696f6e732c20796f752063616e20616c77617973207472696d207468656d206261636b2c20627574207468697320697320616e20656666696369656e742077617920746f207374617920706c756767656420696e746f20636f6e766572736174696f6e73206163726f7373206d616e79206368616e6e656c732e3c2f703e3c703e3c62723e3c2f703e3c703e5475726e206f6e203c6120687265663d223231343930383338382d5573696e672d446f2d4e6f742d446973747572622d696e2d536c61636b2e68746d6c223e3c7374726f6e673e446f204e6f7420446973747572623c2f7374726f6e673e3c2f613e206d6f646520746f20736e6f6f7a6520616c6c20536c61636b206e6f74696669636174696f6e732028696e636c7564696e6720736f756e647329206f6e20616e7920646576696365266d646173683b7768657468657220796f75206a757374206e65656420616e20686f757220746f20617474656e642061206d656574696e67206f72206e6565642074696d6520746f20796f757273656c6620616674657220776f726b2e204d65616e7768696c652c20796f7572207465616d6d617465732063616e20636f6e74696e756520746f2073656e6420796f75206d6573736167657320776974686f757420776f727279696e672061626f757420626f74686572696e6720796f752e3c2f703e3c703e436c69636b207468652062656c6c2069636f6e203c656d3e266e6273703b3c2f656d3e206e65787420746f20796f7572207465616d206e616d6520696e20746865207369646562617220746f207475726e206f6e20446f204e6f7420446973747572622e20596f752063616e20616c736f20766973697420796f7572206e6f74696669636174696f6e20707265666572656e63657320746f203c6120687265663d223231343838383431382d53657474696e672d64656661756c742d446f2d4e6f742d446973747572622d686f7572732e68746d6c223e7363686564756c6520612064656661756c7420736574206f6620446f204e6f74204469737475726220686f7572733c2f613e20666f72207768656e20796f7526727371756f3b7265206f66662074686520636c6f636b2e3c2f703e3c703e3c62723e3c2f703e3c703e4f6e636520796f75207369676e2075702c20796f752063616e2066696e6420616c6c206f662074686573652073657474696e677320696e206f6e6520706c6163653a203c6120687265663d2268747470733a2f2f6d792e736c61636b2e636f6d2f6163636f756e742f6e6f74696669636174696f6e73223e3c2f613e3c6120687265663d2268747470733a2f2f6d792e736c61636b2e636f6d2f6163636f756e742f6e6f74696669636174696f6e73223e68747470733a2f2f6d792e736c61636b2e636f6d2f6163636f756e742f6e6f74696669636174696f6e733c2f613e2e3c2f703e3c6831207469746c653d2246696c65732c20506f7374732c20616e6420536e697070657473223e55706c6f6164696e672066696c657320616e64206372656174696e6720706f7374732f736e6970706574733c2f68313e3c703e596f752063616e203c6120687265663d223230313333303733362d55706c6f6164696e672d616e642d73686172696e672d66696c65732e68746d6c223e75706c6f61642066696c65733c2f613e20266d646173683b206c696b6520612070686f746f2c206120646f63756d656e742c206f7220612050444620266d646173683b20696e206120666577206561737920776179733a3c2f703e3c756c3e3c6c693e436c69636b2074686520706c75732069636f6e203c656d3e266e6273703b3c2f656d3e206f6e20746865206c6566742068616e642073696465206f6620746865206d65737361676520626f782e3c2f6c693e3c6c693e4472616720616e642064726f7020796f75722066696c6520696e746f2061206368616e6e656c2e3c2f6c693e3c6c693e54616b6520612073637265656e677261622c207468656e20757365204374726c2f436d64202b205620746f20706173746520697420696e2e3c2f6c693e3c2f756c3e3c703e3c7374726f6e673e457863656c6c656e74205469703a3c2f7374726f6e673e204769766520796f75722066696c6573206120676f6f642c2073656e7369626c65207469746c65207768656e20796f752075706c6f6164207468656d20266d646173683b206974206d616b65732026727371756f3b656d2065617369657220746f2066696e64206c61746572213c2f703e3c703e3c6120687265663d223230333935303431382d436f6d706f73696e672d612d506f73742d322e68746d6c223e506f7374733c2f613e20616e64203c6120687265663d223230343134353635382d4372656174696e672d612d536e69707065742d322e68746d6c223e736e6970706574733c2f613e206172652074776f207479706573206f662066696c6573207465616d206d656d626572732063616e2063726561746520616e642073686172652077697468696e20536c61636b2e20546f206765742073746172746564207769746820656974686572206f662074686573652066696c652074797065732c20636c69636b206f6e20746865206e65787420746f2074686520696e70757420626f782e3c2f703e3c756c3e3c6c693e506f7374732061726520676f6f6420666f722073686172696e67206e6f74657320616e64206c6f6e67657220706965636573206f662077726974696e67207769746820796f7572207465616d2e3c2f6c693e3c6c693e536e69707065747320617265206265737420666f722073686172696e6720636f6465206f722072656372656174696e67206120707265666f726d617474656420626c6f636b206f6620746578742e3c2f6c693e3c2f756c3e3c703e3c62723e3c2f703e3c6831207469746c653d22456d6f6a69223e456d6f6a69213c2f68313e3c703e536c61636b2066756c6c7920737570706f727473203c6120687265663d223230323933313334382d456d6f6a692d616e642d656d6f7469636f6e732e68746d6c223e656d6f6a693c2f613e3a20496e20666163742c207765206b696e64206f66206c6f7665207468656d2e204a75737420636c69636b2074686520736d696c65792066616365206f6e207468652072696768742068616e64206f6620746865206d65737361676520626f78207369646520746f206f70656e2074686520656d6f6a69206d656e752c206f722074797065203a20616e64206869742054616220746f207365652061206c697374206f6620717569636b20656d6f6a6920636f6465732e20546865726520617265206d616e7920646966666572656e74207374796c6573206f6620656d6f6a6920746f2063686f6f73652066726f6d3b20666f72206d6f7265206f7074696f6e732c206f70656e20746865203c7374726f6e673e5465616d204d656e753c2f7374726f6e673e2c2063686f6f7365203c7374726f6e673e507265666572656e6365733c2f7374726f6e673e2c20616e642073656c65637420746865203c7374726f6e673e4d657373616765732026616d703b204d656469613c2f7374726f6e673e207461622e3c2f703e3c703e3c62723e3c2f703e3c6831207469746c653d22536561726368223e5365617263683c2f68313e3c703e3c6120687265663d223230323532383830382d536561726368696e672d696e2d536c61636b2e68746d6c223e5365617263683c2f613e206973206f6e65206f6620536c61636b2661706f733b7320636f72652066656174757265733a204d6573736167657320616e642066696c657320796f752061646420746f20536c61636b2061726520696e7374616e746c792073656172636861626c652c20736f20796f752063616e20717569636b6c7920636f6d65206261636b20746f20646f63756d656e747320616e642064697363757373696f6e73207768656e20796f75206e656564207468656d2e3c2f703e3c703e596f752063616e20757365207370656369616c206d6f6469666965727320286c696b6520266c7371756f3b696e3a26727371756f3b2c20266c7371756f3b66726f6d3a26727371756f3b2c206574632e2920746f20666f63757320726573756c7473206261736564206f6e2061206368616e6e656c2c20706572736f6e2c206f7220646174652e20526573756c74732063616e2062652066696c746572656420627920726563656e63792c2072656c6576616e63792c20616e642066696c65207479706520736f20796f752063616e20656173696c792066696e64207768617420796f75206e6565642e3c2f703e3c703e45766572792066696c6520796f7520736861726520696e20536c61636b2028776865746865722075706c6f61646564206469726563746c792c206f7220696d706f72746564207769746820616e20696e746567726174696f6e2920697320696e646578656420696e207365617263682e20596f752063616e20656173696c792073656172636820666f7220616e792066696c6520266d646173683b20616e6420736561726368207468652066696c6526727371756f3b7320636f6e74656e747320266d646173683b206469726563746c792077697468696e20536c61636b2e3c2f703e, '2017-01-23 18:53:20', '2017-01-23 18:53:20');
INSERT INTO `tms_knowledge_articles` (`article_id`, `category`, `title`, `article_discription`, `section`, `created_date`, `modified_date`) VALUES
(14, 15, 'Tips for team creators and admins', 'Tips for team creators and admins', 0x3c703e576526727371756f3b76652070757420746f67657468657220746865736520706f696e7465727320746f2068656c7020796f75206d616b6520536c61636b20776f726b20666f7220796f7572207465616d2e3c2f703e3c703e266e6273703b3c2f703e3c703e3c62723e3c2f703e3c6831207469746c653d2254616b656177617973223e54616b6561776179733c2f68313e3c756c3e3c6c693e3c7374726f6e673e54616b652061206d6f6d656e7420746f20676574207365742075703c2f7374726f6e673e3c7370616e3e266e6273703b3c2f7370616e3e6265666f726520796f7520696e74726f6475636520536c61636b20746f20796f7572207465616d2e3c2f6c693e3c6c693e3c7374726f6e673e537461727420627920696e766974696e67206120736d616c6c2070696c6f74207465616d3c2f7374726f6e673e3c7370616e3e266e6273703b3c2f7370616e3e746f206769766520536c61636b2061207472792e3c2f6c693e3c6c693e3c7374726f6e673e43686f6f736520686f77206e6577206d656d626572732077696c6c207369676e2075703c2f7374726f6e673e3c7370616e3e266e6273703b3c2f7370616e3e266d646173683b20796f752063616e20616c6c6f77206163636f756e74206372656174696f6e2077697468206120636f6d70616e7920656d61696c20616464726573732c206f7220627920696e7669746174696f6e206f6e6c792e3c2f6c693e3c6c693e3c7374726f6e673e50726f6d6f746520747275737465642041646d696e7320616e64204f776e6572733c2f7374726f6e673e3c7370616e3e266e6273703b3c2f7370616e3e746f2068656c70206d61696e7461696e20796f7572207465616d2e3c2f6c693e3c6c693e3c7374726f6e673e4372656174652c206f7267616e697a652c20616e6420706f70756c617465206120666577206368616e6e656c733c2f7374726f6e673e3c7370616e3e266e6273703b3c2f7370616e3e666f72206e6577207465616d206d656d6265727320746f206a6f696e20736f2074686579206172656e26727371756f3b74206772656574656420627920616e20656d7074792073706163652e3c2f6c693e3c6c693e3c7374726f6e673e4d69677261746520796f757220646174613c2f7374726f6e673e3c7370616e3e266e6273703b3c2f7370616e3e696620796f7526727371756f3b726520737769746368696e672066726f6d206120646966666572656e74207465616d20636f6d6d756e69636174696f6e20746f6f6c2e3c2f6c693e3c2f756c3e3c703e3c62723e3c2f703e3c6831207469746c653d2257656c636f6d6520746f20536c61636b223e57656c636f6d6520746f20536c61636b3c2f68313e3c703e536c61636b20697320616e20656173792d746f2d757365206d6573736167696e672061707020666f72207465616d732074686174206272696e677320616c6c20796f757220636f6d6d756e69636174696f6e20696e746f206f6e6520706c61636520616e6420696e7465677261746573207769746820796f7572206578697374696e6720746f6f6c732e20576861746576657220697420697320796f7520646f2c207468657265206172652061206665772073696d706c6520737465707320796f752063616e2074616b65207768696c652073657474696e6720536c61636b20757020666f7220796f7572207465616d20746f2068656c702065766572796f6e6520676574207374617274656420617320717569636b6c7920616e642070726f647563746976656c7920617320706f737369626c652e20486f706520746869732067756964652068656c70732e20576526727371756f3b726520676c616420796f7526727371756f3b726520686572652e3c2f703e3c703e3c62723e3c2f703e3c6831207469746c653d225374617274207769746820612070696c6f74207465616d223e5374617274207769746820612070696c6f74207465616d3c2f68313e3c703e3c7374726f6e673e43686f6f73652061207370656369666963207765656b20746f2074727920536c61636b2077697468206120666577207465616d206d656d626572732e3c2f7374726f6e673e204f7267616e697a65206120736d616c6c2067726f7570206f662070656f706c6520796f7520776f726b207769746820636c6f73656c792c20616e6420696e7374656164206f662073656e64696e6720656d61696c7320286f7220494d732c206f7220536b797065206d65737361676573292c20747279206a757374207573696e6720536c61636b2e205765207265636f6d6d656e6420747279696e6720746f2075736520536c61636b206578636c75736976656c7920666f72206120646179206f722074776f2c20736f20796f7572207465616d2063616e207265616c697a65207468652062656e65666974732e3c2f703e3c703e3c7374726f6e673e4b65657020796f7572207374617274696e6720736574206f66206368616e6e656c7320736d616c6c2e3c2f7374726f6e673e20446f6e2661706f733b7420776f7272792061626f7574206372656174696e672061206c6f74206f66206368616e6e656c73206265666f726520796f752067657420737461727465642e205765207265636f6d6d656e6420796f75206c657420636f6e766572736174696f6e732068617070656e20616e6420637265617465206368616e6e656c7320617320746865206e656564206172697365732e205768656e20636f6e766572736174696f6e7320656d657267652061626f75742061206365727461696e207375626a65637420266d646173683b206c696b652064697363757373696e6720612070726f6a6563742c206f7220726567756c617220746f70696373206c696b6520236c756e636820266d646173683b206372656174652061206e6577206368616e6e656c2e20596f752661706f733b6c6c20736f6f6e20666967757265206f757420746865207269676874206368616e6e656c7320666f7220796f7572207465616d2e3c2f703e3c703e3c7374726f6e673e436f6d6d756e696361746520696e207075626c6963206368616e6e656c733c2f7374726f6e673e207768656e6576657220706f737369626c652e205768656e20796f7520646f206e65656420746f2068617665206120636f6e666964656e7469616c20636f6e766572736174696f6e2c2063726561746520612070726976617465206368616e6e656c20666f72206c6f6e672d7465726d2064697363757373696f6e7320746861742077696c6c20696e766f6c7665206d6f72652070656f706c6520696e20746865206675747572652e20496620697426727371756f3b73206120646972656374206f72206c6967687477656967687420636f6e766572736174696f6e2c20796f752063616e2073656e642061203c6120687265663d223231323238313436382d4469726563742d6d657373616765732d616e642d67726f75702d444d732e68746d6c223e67726f7570206f7220646972656374206d6573736167653c2f613e2e20427574206279206b656570696e67206d6f7374206f6620796f757220636f6e766572736174696f6e73206f70656e20746f20616c6c207465616d206d656d626572732c20796f753a3c2f703e3c756c3e3c6c693e4275696c642061206461746162617365206f66206f7267616e697a6174696f6e616c206b6e6f776c656467652077697468207a65726f206566666f72742e3c2f6c693e3c6c693e4472617720796f7572207465616d20696e746f20536c61636b2e20284e6f206f6e652077616e747320746f206d697373206f7574206f6e20637269746963616c20636f6e766572736174696f6e7321293c2f6c693e3c6c693e4761696e207669736962696c69747920696e746f2065766572797468696e672068617070656e696e6720696e20796f7572207465616d2e3c2f6c693e3c2f756c3e3c703e3c7374726f6e673e496e746567726174652077697468206173206d616e792065787465726e616c20746f6f6c7320617320796f75206e65656420746f2067657420776f726b20646f6e652e3c2f7374726f6e673e204272696e67696e6720757064617465732066726f6d2065787465726e616c207365727669636573206469726563746c7920696e746f20536c61636b206b6565707320612066696e676572206f6e207468652070756c7365206f6620796f7572207465616d2e20596f7526727371756f3b6c6c206e6f206c6f6e676572206e65656420656d61696c206e6f74696669636174696f6e732066726f6d2074686573652073657276696365732c20616e642062657374206f6620616c6c2c2065766572797468696e672077696c6c2062652073656172636861626c6520616e6420696e206f6e6520706c6163652e2054616b652061206c6f6f6b206174203c6120687265663d2268747470733a2f2f736c61636b2e636f6d2f61707073223e61206c697374206f66206170707320617661696c61626c6520696e206f757220417070204469726563746f72792e3c2f613e3c2f703e3c703e3c7374726f6e673e456e636f757261676520796f7572207465616d20746f20646f776e6c6f6164206f757220617070732e3c2f7374726f6e673e205573696e67206f7572203c6120687265663d2268747470733a2f2f736c61636b2e636f6d2f646f776e6c6f616473223e6465736b746f7020616e64206d6f62696c6520617070733c2f613e2069732061206d7563682062657474657220657870657269656e636520616c6c2061726f756e642c20736f207765207265636f6d6d656e6420796f7520616e6420796f7572207465616d20646f20736f2e3c2f703e3c703e3c656d3e4f6e636520796f75722070696c6f74207465616d2069732072756e6e696e6720736d6f6f74686c792c20697426727371756f3b732074696d6520746f207468696e6b20616865616420666f7220686f7720746f20736574207570207468652072657374206f6620796f7572206f7267616e697a6174696f6e20666f7220737563636573732e3c2f656d3e3c2f703e3c6831207469746c653d22536574207570205465616d20507265666572656e636573223e536574207570205465616d20507265666572656e6365733c2f68313e3c703e43686f6f73696e672074686520726967687420707265666572656e6365732068656c70732065766572796f6e65206f6e20796f7572207465616d2067657420746865206265737420706f737369626c6520657870657269656e63652e20576526727371756f3b6c6c20676f206f76657220736f6d65206f66207468657365206b657920707265666572656e6365732062656c6f772c20627574206d6f726520696e666f726d6174696f6e2063616e20616c736f20626520666f756e6420696e20746865203c6120687265663d222e2e2f73656374696f6e732f3230303332303036372d5465616d2d53657474696e67732e68746d6c223e5465616d2053657474696e67733c2f613e2073656374696f6e206f66206f75722048656c702043656e7465722e3c2f703e3c703e3c62723e3c2f703e3c68343e5465616d205369676e75703c2f68343e3c703e3c7374726f6e673e53534f3c2f7374726f6e673e20266d646173683b203c6120687265663d223230333737323231362d5573696e672d73696e676c652d7369676e2d6f6e2d776974682d536c61636b2e68746d6c223e456e61626c696e672053696e676c65205369676e2d4f6e202853534f293c2f613e206d616b657320536c61636b207365616d6c657373207769746820796f7572206f746865722073657276696365732e20576520737570706f727420476f6f676c6520417070732c20417a7572652c204f6b74612c20616e64204f6e654c6f67696e2c20696e636c7564696e6720637573746f6d2053414d4c20696d706c656d656e746174696f6e732e2053534f20697320617661696c61626c6520666f7220616c6c207465616d73206f6e20746865205374616e6461726420706c616e206f722061626f7665207768696c652053414d4c2d62617365642053534f20697320617661696c61626c6520666f722074686520506c757320706c616e2e3c2f703e3c703e3c7374726f6e673e456d61696c207369676e75703c2f7374726f6e673e20266d646173683b20496620796f7520646f6e26727371756f3b74206861766520616e2053534f20736f6c7574696f6e20696e20706c6163652c20796f752063616e20616c6c6f77207465616d206d656d6265727320746f207369676e207570207573696e67206f6e65206f72206d6f726520636f6d70616e7920656d61696c20646f6d61696e732e3c2f703e3c703e3c7374726f6e673e496e7669746174696f6e733c2f7374726f6e673e20266d646173683b205465616d2041646d696e7320616e64204f776e6572732063616e203c6120687265663d223230313333303235362d496e766974696e672d6e65772d6d656d626572732d746f2d796f75722d536c61636b2d7465616d2e68746d6c223e696e76697465206e6577207465616d206d656d626572733c2f613e20746f20536c61636b2066726f6d2074686520496e7669746174696f6e7320706167652e3c2f703e3c703e3c62723e3c2f703e3c68343e44656661756c74206368616e6e656c7320666f72206e65772075736572733c2f68343e3c703e546f2068656c7020796f7572207465616d206d656d626572732067657420737461727465642c20796f752063616e207365742061206c697374206f66203c7374726f6e673e3c6120687265663d223230313839383939382d53657474696e672d64656661756c742d6368616e6e656c732d666f722d6e65772d75736572732e68746d6c223e64656661756c74206368616e6e656c733c2f613e266e6273703b3c2f7374726f6e673e746865792077696c6c206175746f6d61746963616c6c79206a6f696e2e20416e64207768656e20796f7520696e766974652070656f706c652c20796f752063616e20616c736f20616464206368616e6e656c73206f6e2061207065722d706572736f6e2062617369732c20736f2074686174207468657926727371756f3b6c6c206a6f696e206368616e6e656c7320737065636966696320746f20746865697220726f6c65206f722077686f207468657926727371756f3b6c6c20626520776f726b696e6720776974682e3c2f703e3c68343e456e636f7572616765206368616e6e656c206372656174696f6e20616e6420696e746567726174696f6e733c2f68343e3c703e5768696c65206974206d61792062652074656d7074696e6720746f206f6e6c79206c65742041646d696e73203c6120687265663d223230313430323239372d4372656174696e672d612d6368616e6e656c2e68746d6c223e637265617465206368616e6e656c733c2f613e206f7220696e746567726174696f6e732c207765206164766f63617465206c657474696e6720616c6c207465616d206d656d626572732068656c70206d6f6c6420536c61636b20696e746f2074686520746f6f6c2074686579206e65656420746f2067657420776f726b20646f6e652e2041732061205465616d2041646d696e2c20796f7526727371756f3b6c6c2062656e656669742066726f6d2073686172696e67207468697320776f726b2c20616e64206265666f726520796f75206b6e6f772069742c20536c61636b2077696c6c206d65657420746865206e65656473206f662065766572796f6e65206f6e20796f7572207465616d2e3c2f703e3c703e3c62723e3c2f703e3c68343e52657175697265204020666f72206d656e74696f6e733c2f68343e3c703e416e792035302b20706572736f6e207465616d2077696c6c2077616e7420746f2072657175697265207573696e6720616e2040757365726e616d6520746f206d656e74696f6e206f74686572732e204f74686572776973652c207465616d206d656d626572732077696c6c206265206e6f7469666965642061626f757420616e79206d656e74696f6e206f66207468656972206e616d652c206576656e20776974686f757420746865204020266d646173683b20616e642074686f73652077686f2063686f6f736520636f6d6d6f6e20776f726473206f72206e616d657320666f7220746865697220757365726e616d6573206d6179207265636569766520756e696e74656e646564206d656e74696f6e732e205465616d204f776e6572732063616e20636f6e66696775726520746869732073657474696e672e3c2f703e3c68343e52657374726963742077686f2063616e20706f737420696e202367656e6572616c3c2f68343e3c703e5765207265636f6d6d656e642074686174207465616d732077697468203130302b20757365727320726573747269637420706f7374696e6720696e20746865202367656e6572616c206368616e6e656c20746f2041646d696e73206f6e6c792e20546865202367656e6572616c206368616e6e656c20697320746865206f6e6c79206f6e65206576657279207465616d206d656d62657220697320696e2c20736f20697426727371756f3b73207065726665637420666f7220706f7374696e6720616e6e6f756e63656d656e747320616e64206f7468657220696e666f726d6174696f6e20637269746963616c20746f20616c6c207465616d206d656d626572732e2053696e63652065766572796f6e6520697320726571756972656420746f20626520696e202367656e6572616c20286d656d626572732063616e26727371756f3b74206c656176652074686174206368616e6e656c292c2069742063616e206265636f6d65206469737472616374696e6720746f206c61726765207465616d732e20596f752063616e20616c736f2072656e616d65202367656e6572616c20746f20736f6d657468696e67206c696b652023616e6e6f756e63656d656e7473206f722023616c6c2d68616e647320266d646173683b206a75737420666f6c6c6f7720746865207374657073206f75746c696e656420696e206f75722048656c702043656e7465722e3c2f703e3c68343e536e6f6f7a65206e6f74696669636174696f6e73207769746820446f204e6f7420446973747572623c2f68343e3c703e42792064656661756c742c20776526727371756f3b6c6c2077697468686f6c6420616c6c206e6f74696669636174696f6e7320666f7220796f7572207465616d2066726f6d203130706d202d2038616d20696e2065616368207465616d206d656d62657226727371756f3b73206c6f63616c2074696d65207a6f6e652e205465616d204f776e65727320616e642041646d696e732063616e206368616e6765207768657468657220446f204e6f742044697374757262206973206175746f6d61746963616c6c79204f6e2f4f66662c20616e6420616c736f2061646a757374207468652064656661756c7420736e6f6f7a652074696d6520706572696f6420696e207468656972203c6120687265663d2268747470733a2f2f736c61636b2e636f6d2f61646d696e2f73657474696e677323646e645f7363686564756c65223e7465616d2073657474696e67733c2f613e2e204b65657020696e206d696e642c20696e646976696475616c207465616d206d656d626572732063616e207363686564756c65207468656972206f776e20737461727420616e6420656e642074696d65732c206f72206f707420746f207475726e204f6e2f4f6666206175746f6d6174696320446f204e6f74204469737475726220686f75727320616c746f6765746865722e204c6561726e206d6f72652061626f7574203c6120687265663d223231343930383338382d5573696e672d446f2d4e6f742d446973747572622d696e2d536c61636b2e68746d6c223e446f204e6f74204469737475726220696e207468652048656c702043656e7465723c2f613e2e3c2f703e3c703e3c62723e3c2f703e3c68343e416464206d6f7265204f776e65727320616e642041646d696e733c2f68343e3c703e497426727371756f3b73206c6f6e656c79206265696e6720746865206f6e6c792041646d696e206f6e2061207465616d2e203c6120687265663d223231383132343339372d4368616e67696e672d612d7465616d2d6d656d6265722d732d726f6c652e68746d6c223e4170706f696e74206164646974696f6e616c204f776e65727320616e642041646d696e733c2f613e6561726c79206f6e20266d646173683b20697426727371756f3b7320676f6f6420707261637469636520666f72206561636820536c61636b207465616d20746f2068617665206174206c656173742074776f204f776e65727320616e642041646d696e732c2073696e63652074686f736520726f6c657320686176652061636365737320746f207465616d2d7769646520707265666572656e63657320616e64207065726d697373696f6e732c207375636820617320696e76697465732e3c2f703e3c703e546865726520617265206669766520646966666572656e7420726f6c6573206120706572736f6e2063616e2068617665206f6e206120536c61636b207465616d2c20656163682077697468207468656972206f776e206c6576656c206f66207065726d697373696f6e733a3c2f703e3c756c3e3c6c693e3c7374726f6e673e4f776e65723c2f7374726f6e673e20266d646173683b205465616d204f776e65727320636f6e74726f6c2074686520686967686573742d6c6576656c20736563757269747920616e642061646d696e6973747261746976652073657474696e67733a207061796d656e74732c207465616d2061757468656e7469636174696f6e206d6574686f64732c20736563757269747920706f6c69636965732c20616e6420736f206f6e2e3c2f6c693e3c6c693e3c7374726f6e673e41646d696e3c2f7374726f6e673e20266d646173683b2041646d696e6973747261746f7273206172652061626c6520746f206d616e616765206d656d626572732c206d6f646572617465206368616e6e656c732c20696e766974652075736572732c20616e642068616e646c65206f74686572207461736b732e205765207265636f6d6d656e642074686174206576657279207465616d2068617665207365766572616c2041646d696e6973747261746f72732e3c2f6c693e3c6c693e3c7374726f6e673e4d656d6265723c2f7374726f6e673e20266d646173683b205465616d206d656d6265727320686176652061636365737320746f207374616e64617264206665617475726573206c696b65206a6f696e696e6720616e79207075626c6963206368616e6e656c20616e642075706c6f6164696e672066696c65732e2054686973206973207468652064656661756c7420666f72206e65772070656f706c6520616464656420746f20796f7572207465616d2e3c2f6c693e3c6c693e3c7374726f6e673e4d756c74692d4368616e6e656c2047756573743c2f7374726f6e673e20266d646173683b205468657365206163636f756e74732063616e20616363657373206f6e6c792061206c696d6974656420736574206f66206368616e6e656c7320646566696e65642062792074686520696e766974696e672041646d696e2e204d756c74692d4368616e6e656c2047756573747320617265207479706963616c6c792075736564206279207465616d7320746f206c6f6f7020636f6e74726163746f7273206f7220696e7465726e7320696e746f20617070726f70726961746520636f6e766572736174696f6e7320776974686f757420676976696e67207468656d2061636365737320746f2065766572797468696e6720656c73652e3c2f6c693e3c6c693e3c7374726f6e673e53696e676c652d4368616e6e656c2047756573743c2f7374726f6e673e20266d646173683b204775657374732061726520696e766974656420746f206a6f696e20612073696e676c65206368616e6e656c2e2053696e676c652d4368616e6e656c204775657374732063616e20646972656374206d657373616765206f74686572206d656d62657273206f662074686174206368616e6e656c2e204d616e79207465616d73207573652053696e676c652d4368616e6e656c2047756573747320746f20776f726b2077697468206f7574736964652076656e646f727320616e642073657276696365732e3c2f6c693e3c2f756c3e3c703e466f72206d6f72652064657461696c206f6e207465616d20726f6c657320616e642077686174207468656972207065726d697373696f6e7320616c6c6f77207468656d20746f20646f2c20636865636b206f75742074686973203c6120687265663d223230313331343032362d526f6c65732d616e642d7065726d697373696f6e732d696e2d536c61636b2e68746d6c223e61727469636c65206f6e206f75722048656c702043656e7465723c2f613e2e3c2f703e3c6831207469746c653d2245737461626c697368204368616e6e656c20436f6e76656e74696f6e73223e45737461626c697368204368616e6e656c20436f6e76656e74696f6e733c2f68313e3c703e5768696c6520776520646f6e26727371756f3b74207265636f6d6d656e6420747279696e6720746f20736574207570206576657279206368616e6e656c20696e20616476616e63652c2069742063616e2062652075736566756c20746f203c6120687265663d223230313430323239372d4372656174696e672d612d6368616e6e656c2e68746d6c223e637265617465206120666577206368616e6e656c733c2f613e2074686174207265666c6563742074686520737472756374757265206f6620796f7572206f7267616e697a6174696f6e2e3c2f703e3c703e3c62723e3c2f703e3c68343e3c656d3e4865726520617265206120666577206578616d706c65732074686174206861766520776f726b65642077656c6c20666f72206f74686572207465616d733c2f656d3e3c2f68343e3c68343e5465616d206368616e6e656c733c2f68343e3c703e4e6561726c7920657665727920636f6d70616e79206f6e20536c61636b2063726561746573206368616e6e656c7320666f7220656163682064697374696e6374206465706172746d656e742077697468696e207468656972206f7267616e697a6174696f6e2e204f6674656e2c20697426727371756f3b732075736566756c20746f206861766520626f746820612062726f6164206368616e6e656c2028652e672e2023656e67696e656572696e672920616e64206e6172726f77206f6e65732028652e672e2023656e672d73656375726974792c2023656e672d737570706f72742c206574632e292e3c2f703e3c68343e546f706963616c206368616e6e656c733c2f68343e3c703e546f706963616c206368616e6e656c7320617265207479706963616c6c7920736f6369616c206368616e6e656c73202d20746865207669727475616c207761746572636f6f6c65722e2057686574686572207468657926727371756f3b726520666f7220736572696f757320746f70696373206c696b652023706f6c6974696373206f722066756e20746f70696373206c696b652023666f6f7462616c6c2c207468657365206e6f6e2d776f726b206368616e6e656c7320616c6c6f772070656f706c6520746f20736f6369616c697a65206163726f7373207465616d732e20536f6369616c206368616e6e656c73206172652070617274206f662074686520666162726963206f6620536c61636b2c20616e642068656c702070656f706c65206665656c20636f6d666f727461626c652e3c2f703e3c68343e50726f6a656374206368616e6e656c733c2f68343e3c703e50726f6a65637473206f7220636f6d70616e7920696e697469617469766573206f6674656e206e656564207468656972206f776e206368616e6e656c732c20657370656369616c6c7920666f722070726f6a6563747320746861742063726f7373206465706172746d656e74732e2054686573652063616e206272696e6720746f67657468657220696e7465726469736369706c696e617279207465616d7320616e642070726576656e7420746f6f206d75636820636f6e667573696f6e2066726f6d20686176696e672070726f6a65637420636f6e766572736174696f6e7320696e207465616d206368616e6e656c732e3c2f703e3c68343e4c6f636174696f6e2d6261736564206368616e6e656c733c2f68343e3c703e4d616e79206f662074686520636f6d70616e69657320746861742075736520536c61636b2061726520776f726b696e67206163726f737320646966666572656e74206c6f636174696f6e732e20436f6e7369646572206d616b696e67206368616e6e656c7320666f72206561636820636f6d70616e79206f66666963652028652e672e202373662c20236e79632c20237379642920746f2068656c702070656f706c65207368617265206c6f63616c206c756e636865732c20686170707920686f7572732c20616e64206e6577732e3c2f703e3c68343e496e746567726174696f6e2d6261736564206368616e6e656c733c2f68343e3c703e5768696c65206d6f7374206368616e6e656c732074656e6420746f20626520646f6d696e61746564206279207265616c206c6976652061637475616c2070656f706c652c20736f6d6574696d65732074686520666f637573206e6565647320746f206265206f6e20646174612e20547769747465722073747265616d732c20737570706f7274207469636b6574732c20627567206461746162617365733a20616c6c2074686f7365207468696e677320746861742061726520696d706f7274616e7420746f206b65657020616e20657965206f6e202862757420636f756c64206f7665727768656c6d20636f6e766572736174696f6e20696e2061206e6f726d616c206368616e6e656c293c2f703e3c6831207469746c653d22576f726b696e672057697468696e20536c61636b223e576f726b696e672057697468696e20536c61636b3c2f68313e3c68343e46696c657320616e64204c696e6b733c2f68343e3c703e497426727371756f3b73206561737920746f203c6120687265663d223230313333303733362d55706c6f6164696e672d616e642d73686172696e672d66696c65732e68746d6c223e736861726520612066696c653c2f613e2077697468696e20536c61636b202d20796f752063616e206472616720616e642064726f702066726f6d20796f757220636f6d70757465722c2075706c6f616420612066696c652c206f72207061737465206c696e6b732066726f6d207365727669636573206c696b65203c6120687265663d223230353837353035382d53686172696e672d476f6f676c652d44726976652d66696c65732d696e2d536c61636b2e68746d6c223e476f6f676c652044726976653c2f613e206f72203c6120687265663d223230363531333137372d53686172696e672d44726f70626f782d66696c65732d696e2d536c61636b2e68746d6c223e44726f70626f783c2f613e2e2053696d696c61726c792c207765206d616b65206974206561737920746f203c6120687265663d223230343339393334332d53686172696e672d6c696e6b732d696e2d536c61636b2e68746d6c223e73686172652077656220636f6e74656e743c2f613e206c696b652061727469636c65732c203c6120687265663d223230353334363232372d416464696e672d547769747465722d746f2d536c61636b2e68746d6c223e7477656574733c2f613e2c20696d616765732c20616e6420766964656f2e204a75737420706173746520746865206c696e6b20616e6420536c61636b2077696c6c206175746f6d61746963616c6c7920657870616e6420746865206c696e6b20746f20646973706c617920616e20696e6c696e6520707265766965772e3c2f703e3c68343e5365617263683c2f68343e3c703e576520776f726b206861726420746f20656e73757265207468617420776861746576657220796f75206e65656420746f2066696e6420696e20536c61636b2063616e20626520666f756e6420696e207365636f6e64732e2054686520616476616e636564203c6120687265663d223230323532383830382d536561726368696e672d696e2d536c61636b2e68746d6c223e7365617263683c2f613e20696e6465786573206576657279206c6974746c6520626974206f66207468652066696c65732061646465642c20616e642073656172636865732077697468696e2073686172656420646f63756d656e747320616e64206d657461646174612c206e6f74206a757374207469746c65732e3c2f703e3c703e4e6172726f7720796f757220736561726368207573696e67207370656369616c206d6f64696669657273206c696b653c2f703e3c756c3e3c6c693e696e3a2061207370656369666963206368616e6e656c3c2f6c693e3c6c693e66726f6d3a206120706172746963756c617220706572736f6e3c2f6c693e3c6c693e647572696e673a2061206365727461696e2074696d6520706572696f643c2f6c693e3c2f756c3e3c703e416e6420616c736f2066696c74657220726573756c747320627920726563656e63792c2072656c6576616e63792c20616e642066696c65207479706520746f20717569636b6c792067657420746f207768617420796f75206e6565642e20285765206576656e20686176652066696c652062726f7773696e6720696620796f75206e65656420746f20676f20776164696e67207468726f75676820746865206d616e792066696c657320796f7526727371756f3b766520736861726564207769746820796f7572207465616d21293c2f703e3c703e3c62723e3c2f703e3c6831207469746c653d2247657420546f204b6e6f7720536c61636b626f74223e47657420546f204b6e6f7720536c61636b626f743c2f68313e3c703e3c6120687265663d223230323032363033382d536c61636b626f742d796f75722d617373697374616e742d6e6f74657061642d70726f6772616d6d61626c652d626f742e68746d6c223e536c61636b626f743c2f613e20697320536c61636b2661706f733b73206275696c742d696e20726f626f742e2045766572796f6e6520656e636f756e7465727320536c61636b626f742073686f72746c7920616674657220796f75207374617274206f6e20536c61636b20266d646173683b2077697468206a7573742061206665772073696d706c65207175657374696f6e732c20536c61636b626f742077696c6c2068656c7020796f7572207465616d206d656d626572732066696c6c206f7574207468656972206163636f756e742070726f66696c65732e3c2f703e3c703e536c61636b626f742063616e20616c736f20626520612075736566756c2028616e64206d6f7469766174696f6e616c29206d656d626572206f6620796f7572207465616d2e3c2f703e3c68343e4175746f6d6174696320726573706f6e7365733c2f68343e3c703e596f752063616e20636f6e66696775726520536c61636b626f7420746f20726573706f6e6420746f20796f7572207465616d206d656d62657273206174203c6120687265663d2268747470733a2f2f6d792e736c61636b2e636f6d2f637573746f6d697a652f736c61636b626f74223e6d792e736c61636b2e636f6d2f637573746f6d697a652f736c61636b626f743c2f613e2e205768696c652074686572652061726520706c656e7479206f6620776f726b2d72656c61746564207573657320666f7220746869732c206d6f7374207465616d73206a7573742075736520746865206665617475726520666f722066756e3a3c2f703e3c703e3c62723e3c2f703e3c703e456e7465722061207472696767657220776f7264206f72207068726173652c20616e64207468656e20536c61636b626f7426727371756f3b7320726573706f6e73652e20496620796f752077616e7420746f206d616b652069742072616e646f6d2c20656e746572206d6f7265207468616e206f6e6520726573706f6e7365206f6e206e6577206c696e65732e2054612d64612120596f75722076657279206f776e207465616d20726f626f742e3c2f703e3c703e55736520536c61636b626f7420746f2077656c636f6d65206e6577207465616d206d656d626572732c2061737369676e20612072616e646f6d20706572736f6e20746f206d616b65206120636f666665652072756e2c206f722064656369646520776865726520796f7572207465616d2073686f756c642068617665206c756e63682e3c2f703e3c703e3c7374726f6e673e4e6f74653a3c2f7374726f6e673e20536c61636b626f7420726573706f6e736573206f6e6c79206f6363757220696e206368616e6e656c7320266d646173683b206e6f7420696e20646972656374206d65737361676573202862656361757365207468617420776f756c64206265207275646521293c2f703e3c68343e50726f6772616d6d696e6720536c61636b626f743c2f68343e3c703e596f7572207465616d2063616e2073657420757020536c61636b626f7420746f20736179207468696e67732070726f6772616d6d61746963616c6c79206279206372656174696e672061206e657720536c61636b626f7420696e746567726174696f6e206174203c6120687265663d2268747470733a2f2f6d792e736c61636b2e636f6d2f73657276696365732f6e65772f736c61636b626f74223e6d792e736c61636b2e636f6d2f73657276696365732f6e65772f736c61636b626f743c2f613e2e20546869732077696c6c206769766520796f7572207465616d206120756e697175652055524c20666f7220706f7374696e67206d6573736167657320617320536c61636b626f7420766961204854545020504f53542e3c2f703e3c6831207469746c653d2253686f727463757473223e53686f7274637574733c2f68313e3c703e536c61636b206f666665727320796f75206b6579626f6172642073686f72746375747320746f2068656c7020796f75207370656564207269676874207468726f75676820776861746576657220697420697320796f75206e65656420746f20646f2e20596f752063616e203c6120687265663d223230313337343533362d536c61636b2d6b6579626f6172642d73686f7274637574732e68746d6c223e736565206120636f6d706c657465206c6973743c2f613e206f72207479706520266c6471756f3be28c98202f26726471756f3b206f7220266c6471756f3b4374726c202f26726471756f3b20696e2061206d65737361676520626f782e3c2f703e3c703e596f752063616e20616c736f2075736520612076617269657479206f66203c6120687265663d223230313235393335362d5573696e672d736c6173682d636f6d6d616e64732e68746d6c223e536c61736820436f6d6d616e64733c2f613e206469726563746c792066726f6d20746865206d65737361676520626f782e205479706520266c6471756f3b2f26726471756f3b20746f2073656520612066756c6c206c697374206f662074686f736520636f6d6d616e64732e20426574746572207374696c6c2c20796f752063616e2063726561746520796f7572206f776e20637573746f6d20536c61736820436f6d6d616e6473206174203c6120687265663d2268747470733a2f2f6d792e736c61636b2e636f6d2f73657276696365732f6e65772f736c6173682d636f6d6d616e6473223e6d792e736c61636b2e636f6d2f73657276696365732f6e65772f736c6173682d636f6d6d616e64733c2f613e2c20666f722070756c6c696e6720736572766963657320616e6420736974657320776520646f6e26727371756f3b7420616c726561647920696e746567726174652077697468202874686579206578697374212920696e746f20536c61636b2e3c2f703e3c703e466f72207468652076657279206e657720746f20616c6c20746869732c20646f6e26727371756f3b7420626520696e74696d6964617465642c20796f752063616e20656e61626c6520796f7572207465616d2077697468206120677265617420626567696e6e657226727371756f3b7320677569646520746f206372656174696e6720796f7572207665727920666972737420626f7420266d646173683b20616e64206578616d706c6573206f6620776861742063616e20626520646f6e65207769746820536c61736820436f6d6d616e647320266d646173683b203c6120687265663d22687474703a2f2f736c61636b68712e636f6d2f706f73742f3131373732343436303931352f612d626567696e6e6572732d67756964652d746f2d796f75722d66697273742d626f74223e617661696c61626c65207468726f756768206f757220626c6f673c2f613e2e3c2f703e3c6831207469746c653d224d69677261746520596f75722044617461223e4d69677261746520596f757220446174613c2f68313e3c703e536c61636b20737570706f72747320696d706f7274696e6720646174612066726f6d20612076617269657479206f66206f7468657220636f6d6d756e69636174696f6e20746f6f6c732c20696e636c7564696e6720486970436861742c20466c6f77646f636b2c2043616d70666972652c20616e64206f7468657220536c61636b207465616d732e20576526727371756f3b6c6c206d617020696d706f7274656420757365727320746f206e6577206f6e6573206261736564206f6e20746865697220656d61696c20616464726573732c20736f20697426727371756f3b73206265737420746f20646f20746865206461746120696d706f727420616674657220796f7572207465616d2068617320616c7265616479207369676e65642075702e20466f722068656c70206f6e20696d706f7274696e6720646174612c20706c65617365203c6120687265663d223230313734383730332d496d706f7274696e672d6d6573736167652d686973746f72792e68746d6c223e73656520746869732068656c706465736b2061727469636c653c2f613e2e3c2f703e, '2016-12-27 16:26:16', '2016-12-27 16:26:16'),
(15, 16, 'Editing your profile', 'Editing your profile', 0x3c703e436f6d706c6574696e6720796f757220536c61636b2070726f66696c652068656c707320796f7572207465616d206d656d62657273206c6561726e206d6f72652061626f757420796f752e20486572652661706f733b7320686f7720746f206164642064657461696c732061626f757420796f757273656c662c2075706c6f616420612070686f746f2c20616e642073657420796f75722074696d65207a6f6e652e3c2f703e3c703e3c62723e3c7374726f6e673e46696c6c696e67206f757420796f75722070726f66696c6520696e666f726d6174696f6e3c2f7374726f6e673e3c2f703e3c703e596f752063616e206564697420796f75722070726f66696c6520616e6420616464206e65772064657461696c732072696768742077697468696e20536c61636b3a3c2f703e3c70207469746c653d227461625f6f6e65223e4465736b746f703c2f703e3c70207469746c653d227461625f74776f223e694f533c2f703e3c70207469746c653d227461625f7468726565223e416e64726f69643c2f703e3c70207469746c653d227461625f666f7572223e57696e646f77732050686f6e653c2f703e3c73656374696f6e207469746c653d227461625f6f6e65223e3c6f6c3e3c6c693e436c69636b20796f7572207465616d206e616d6520746f206f70656e207468653c7370616e3e266e6273703b3c2f7370616e3e3c7374726f6e673e5465616d204d656e753c2f7374726f6e673e2e3c62723e3c62723e3c2f6c693e3c6c693e53656c6563743c7370616e3e266e6273703b3c2f7370616e3e3c7374726f6e673e50726f66696c652026616d703b206163636f756e743c2f7374726f6e673e2e20546869732077696c6c206f70656e20796f75722070726f66696c6520696e2074686520746865205465616d204469726563746f727920736964656261722e3c2f6c693e3c6c693e436c69636b3c7370616e3e266e6273703b3c2f7370616e3e3c7374726f6e673e456469743c2f7374726f6e673e3c7370616e3e266e6273703b3c2f7370616e3e746f206f70656e207468652070726f66696c6520656469746f722e3c2f6c693e3c6c693e4d616b6520796f757220656469747320616e6420636c69636b3c7370616e3e266e6273703b3c2f7370616e3e3c7374726f6e673e53617665204368616e6765733c2f7374726f6e673e3c7370616e3e266e6273703b3c2f7370616e3e7768656e20796f7526727371756f3b726520646f6e65213c2f6c693e3c2f6f6c3e3c2f73656374696f6e3e3c703e3c7374726f6e673e4e6f74653a3c2f7374726f6e673e205468652064656661756c742070726f66696c65206669656c647320666f7220616c6c207465616d73206172653a3c2f703e3c756c3e3c6c693e466972737420616e64204c617374204e616d653c2f6c693e3c6c693e57686174204920446f3c2f6c693e3c6c693e50686f6e65204e756d6265723c2f6c693e3c2f756c3e3c703e5465616d73206f6e20746865205374616e6461726420706c616e20616e642061626f76652063616e20616c736f3c7370616e3e266e6273703b3c2f7370616e3e6164643c7370616e3e266e6273703b3c2f7370616e3e3c6120687265663d223231323238313437382d437573746f6d697a696e672d796f75722d7465616d2d732d70726f66696c65732e68746d6c223e637573746f6d206669656c64733c2f613e3c7370616e3e266e6273703b3c2f7370616e3e746f207468656972207465616d26727371756f3b732070726f66696c65732e3c2f703e3c703e3c62723e3c7374726f6e673e55706c6f6164696e6720612070726f66696c652070686f746f3c2f7374726f6e673e3c2f703e3c703e596f752063616e20616c736f2075706c6f6164206f72206368616e676520796f757220536c61636b2070726f66696c652070686f746f2066726f6d2072696768742077697468696e20536c61636b2e20486572652661706f733b7320686f773a3c2f703e3c70207469746c653d227461625f6f6e65223e4465736b746f703c2f703e3c70207469746c653d227461625f74776f223e694f533c2f703e3c70207469746c653d227461625f7468726565223e416e64726f69643c2f703e3c70207469746c653d227461625f666f7572223e57696e646f77732050686f6e653c2f703e3c73656374696f6e207469746c653d227461625f6f6e65223e3c6f6c3e3c6c693e436c69636b20796f7572207465616d206e616d6520746f206f70656e207468653c7370616e3e266e6273703b3c2f7370616e3e3c7374726f6e673e5465616d204d656e753c2f7374726f6e673e2e3c2f6c693e3c6c693e3c7370616e3e53656c6563743c7370616e3e266e6273703b3c2f7370616e3e3c2f7370616e3e3c7374726f6e673e50726f66696c652026616d703b206163636f756e743c2f7374726f6e673e3c7370616e3e2e20546869732077696c6c206f70656e20746865205465616d204469726563746f727920736964656261723c2f7370616e3e2e3c2f6c693e3c6c693e3c7370616e3e436c69636b3c7370616e3e266e6273703b3c2f7370616e3e3c2f7370616e3e3c7374726f6e673e456469743c2f7374726f6e673e3c7370616e3e3c7370616e3e266e6273703b3c2f7370616e3e746f206f70656e207468652070726f66696c6520656469746f723c2f7370616e3e2e3c2f6c693e3c6c693e556e6465723c7370616e3e266e6273703b3c2f7370616e3e3c7374726f6e673e50726f66696c652050686f746f3c2f7374726f6e673e2c20636c69636b2074686520696d61676520746f3c7370616e3e266e6273703b3c2f7370616e3e3c7374726f6e673e4368616e676520796f75722070726f66696c652070686f746f3c2f7374726f6e673e2c207468656e2073656c6563743c7370616e3e266e6273703b3c2f7370616e3e3c7374726f6e673e55706c6f616420616e20696d6167653c2f7374726f6e673e2c20616e642063686f6f736520616e20696d61676520746f2075706c6f61642e3c62723e3c62723e3c2f6c693e3c6c693e41646a757374207468652063726f7020666f7220796f75722070686f746f2c207468656e20636c69636b3c7370616e3e266e6273703b3c2f7370616e3e3c7374726f6e673e536176652070726f66696c6520706963747572653c2f7374726f6e673e2e3c2f6c693e3c6c693e436c69636b203c7374726f6e673e53617665204368616e6765733c2f7374726f6e673e20746f2066696e697368207570213c2f6c693e3c2f6f6c3e3c2f73656374696f6e3e3c703e3c62723e546861742661706f733b732069742120596f7520686176652061207368696e79206e65772070726f66696c652070686f746f2e3c2f703e, '2016-12-27 16:26:28', '2016-12-27 16:26:28'),
(16, 33, 'Galaxy', 'A group of Indian astronomers have discovered a massive supercluster of galaxies, and have named it Saraswati.', 0x3c703e3c696d6720636c6173733d2266722d6469622066722d647261676761626c6522207372633d222f746d734e65772f75706c6f6164732f75706c6f61645f696d6167652f633866656431383061616264663839353730383339333163303630623934663364656365333239392e6a706722207374796c653d2277696474683a2034393470783b206865696768743a203332362e303470783b223e3c2f703e3c703e412067726f7570206f6620496e6469616e20617374726f6e6f6d657273206861766520646973636f76657265642061206d617373697665207375706572636c7573746572206f662067616c61786965732c20616e642068617665206e616d6564206974205361726173776174692e20546865207375706572636c75737465722069732061626f757420342062696c6c696f6e206c69676874207965617273206177617920616e642073707265616473206f766572206120266c6471756f3b67726561742077616c6c26726471756f3b2061626f757420363030206d696c6c696f6e206c69676874207965617273206163726f73732e2054686973206d616b6573206974206f6e65206f6620746865206c617267657374207375706572636c75737465727320746f20626520646973636f766572656420616e6420616c736f207468652066757274686573742e3c2f703e3c703e54686520617374726f6e6f6d6572732062656c6f6e6720746f20496e7465722d556e69766572736974792043656e74726520666f7220417374726f6e6f6d7920616e6420417374726f70687973696373202849554341412920616e6420496e6469616e20496e7374697475746573206f6620536369656e636520456475636174696f6e20616e64205265736561726368202849495345522920696e2050756e652c2062657369646573204e49542c204a616d7368656470757220616e64204e65776d616e20436f6c6c6567652c2054686f647570757a68612e3c2f703e3c703e546865206669727374207375706572636c7573746572206f662067616c61786965732c2074686520536861706c6579205375706572636c75737465722c2077617320646973636f766572656420696e20313938392c20616e6420746865207365636f6e642c2074686520536c6f616e2047726561742057616c6c20696e20323030332e20546865204d696c6b79205761792067616c6178792069732070617274206f6620746865204c616e69616b6561205375706572636c75737465722c2077686963682077617320646973636f766572656420696e20323031342e3c2f703e3c703e266c6471756f3b4974206973207468652066697273742074696d6520746861742077652068617665207365656e2061207375706572636c7573746572207468617420697320736f2066617220617761792e204576656e2074686520536861706c65792069732061626f757420382d31302074696d657320636c6f7365722c26726471756f3b207361797320536f6d616b205261796368617564687572792c204469726563746f72206f6620495543414120616e64206f6e65206f662074686520617574686f7273206f6620746865207061706572206265696e67207075626c697368656420696e20746865206c6174657374206973737565206f66203c656d3e54686520417374726f706879736963616c204a6f75726e616c3c2f656d3e266e6273703b2e3c2f703e, '2018-04-19 16:37:56', '2018-04-19 16:37:56'),
(17, 33, 'Marsm', 'Mars is a planet. It is the fourth planet from the sun.', 0x3c703e4d617273206973206120706c616e65742e2049742069732074686520666f7572746820706c616e65742066726f6d207468652073756e2e20497420697320746865206e65787420706c616e6574206265796f6e642045617274682e204d617273206973206d6f7265207468616e20313432206d696c6c696f6e206d696c65732066726f6d207468652073756e2e2054686520706c616e65742069732061626f7574206f6e652d7369787468207468652073697a65206f662045617274682e204d617273206973206b6e6f776e206173207468652052656420506c616e65742e2049742067657473206974732072656420636f6c6f722066726f6d207468652069726f6e20696e2069747320736f696c2e204d617273206861732074776f20736d616c6c206d6f6f6e732e205468656972206e616d6573206172652050686f626f7320616e64204465696d6f732e3c2f703e3c703e3c62723e3c7374726f6e673e57686174204973204d617273204c696b653f3c2f7374726f6e673e3c62723e4d617273206973207665727920636f6c642e2054686520617665726167652074656d7065726174757265206f6e204d617273206973206d696e757320383020646567726565732046616872656e68656974202d2d207761792062656c6f7720667265657a696e67213c2f703e3c703e4d61727320697320726f636b7920776974682063616e796f6e732c20766f6c63616e6f657320616e64206372617465727320616c6c206f7665722069742e20526564206475737420636f7665727320616c6d6f737420616c6c206f66204d6172732e2049742068617320636c6f75647320616e642077696e642c206a75737420617320456172746820646f65732e20536f6d6574696d6573207468652077696e6420626c6f77732074686520726564206475737420696e746f206120647573742073746f726d2e2054696e7920647573742073746f726d732063616e206c6f6f6b206c696b6520746f726e61646f732c20616e64206c61726765206f6e65732063616e20636f766572207468652077686f6c6520706c616e6574213c2f703e3c703e4d617273206861732061626f7574206f6e652d7468697264207468652067726176697479206f662045617274682e204120726f636b2064726f70706564206f6e204d61727320776f756c642066616c6c20736c6f776572207468616e206120726f636b2064726f70706564206f6e2045617274682e205468696e6773207765696768206c657373206f6e204d617273207468616e2074686579207765696768206f6e2045617274682e204120706572736f6e2077686f207765696768732031303020706f756e6473206f6e20456172746820776f756c64206f6e6c792077656967682061626f757420333720706f756e6473206f6e204d6172732062656361757365206f66206c65737320677261766974792e3c2f703e3c703e3c62723e3c2f703e3c703e3c696d6720636c6173733d2266722d6469622066722d647261676761626c6522207372633d222f746d734e65772f75706c6f6164732f75706c6f61645f696d6167652f623162373733313565653162646335303731633732313165363637613030336161376633623963622e6a706722207374796c653d2277696474683a2039303170783b206865696768743a203333332e333770783b223e3c2f703e3c703e3c7374726f6e673e5768617420486173204e415341204c6561726e65642041626f7574204d6172733f3c2f7374726f6e673e3c2f703e3c703e4e41534120686173207573656420626f746820737061636563722061667420616e6420726f626f747320746f206c6561726e206d6f72652061626f7574204d6172732e20496e20313936352c204d6172696e657220342077617320746865206669727374204e415341207370616365637261667420746f20676574206120636c6f7365206c6f6f6b2061742074686520706c616e65742e20496e20313937362c2056696b696e67203120616e642056696b696e672032207765726520746865206669727374204e415341207370616365637261667420746f206c616e64206f6e204d6172732e205468657920746f6f6b20706963747572657320616e64206578706c6f7265642074686520706c616e657426727371756f3b7320737572666163652e2053696e6365207468656e2c206d6f72652073706163656372616674206861766520666c6f776e206e656172206f72206c616e646564206f6e204d6172732e2667743b3c2f703e3c703e4e4153412661706f733b732053706972697420616e64204f70706f7274756e69747920726f76657273206c616e646564206f6e204d61727320696e204a616e7561727920323030342e205468657920666f756e642065766964656e63652074686174207761746572206f6e636520666c6f776564206f6e204d6172732e204c6976696e67207468696e6773206e65656420776174657220746f20737572766976652e20536f2c20616e79207369676e206f66207761746572206f6e204d61727320776f756c64206d65616e207468617420746865726520636f756c642062652c206f7220636f756c642068617665206265656e2c206c696665206f6e2074686520706c616e65742e3c2f703e3c703e3c62723e3c7374726f6e673e486f77204973204e415341204578706c6f72696e67204d61727320546f6461793f3c2f7374726f6e673e3c62723e546f6461792c20746872656520737061636563726166742061726520636972636c696e672061626f76652c206f72206f72626974696e672c204d6172732e20546865207370616365637261667420617265207573696e6720736369656e746966696320746f6f6c7320746f206d6561737572652074686520766f6c63616e6f65732c2063616e796f6e732c20637261746572732c2074656d706572617475726520616e6420746865206b696e6473206f66206d696e6572616c73206f6e204d6172732e205468657920616c736f206172652074616b696e6720706963747572657320616e6420736561726368696e6720666f722077617465722e3c2f703e3c703e54776f20726f626f74732074686174206d6f76652c2063616c6c656420726f766572732c20617265206578706c6f72696e67204d61727326727371756f3b20737572666163652e205468656972206e616d657320617265204f70706f7274756e69747920616e6420437572696f736974792e2054686520726f766572732074726176656c2061726f756e642074616b696e6720706963747572657320616e64206c6f6f6b696e6720636c6f73656c792061742074686520706c616e657426727371756f3b7320736f696c20616e6420726f636b732e204e415341207573657320706963747572657320616e6420696e666f726d6174696f6e2066726f6d20746865207370616365637261667420616e642074686520726f7665727320746f206c6561726e206d6f72652061626f7574204d6172732e3c2f703e3c703e3c62723e3c7374726f6e673e486f772057696c6c204e415341204578706c6f7265204d61727320696e20746865204675747572653f3c2f7374726f6e673e3c62723e4e41534120706c616e7320746f2073656e64206d6f726520726f626f747320746f204d6172732e204e4153412077616e747320726f626f747320746f20736f6d6564617920636f6c6c656374204d61727469616e20736f696c20616e6420726f636b7320616e64206272696e67207468656d206261636b20746f20456172746820746f20626520737475646965642e20546865204d4156454e20737061636563726166742073746172746564206f72626974696e67204d61727320696e2053657074656d62657220323031342e204d4156454e2073747564696573204d61727326727371756f3b2061746d6f7370686572652e204e41534120706c616e7320746f2073656e642061206c616e64657220746f204d61727320696e20323031362e20416e642061206e6577204d61727320726f76657220697320706c616e6e656420666f72206c61756e636820696e20323032302e3c2f703e3c703e4e41534120616c736f2077616e747320746f2073656e6420617374726f6e6175747320746f204d61727320736f6d656461792e20546f2067657420726561647920746f2073656e642068756d616e7320746f204d6172732c204e415341206973207374756479696e67206e6577206b696e6473206f6620686f6d657320776865726520617374726f6e617574732063616e206c6976652e20536369656e746973747320617265207374756479696e6720686f772070656f706c6520696e20737061636520636f756c642067726f7720706c616e747320666f7220666f6f642e204279207761746368696e6720776861742068617070656e7320746f20617374726f6e61757473206f6e2074686520496e7465726e6174696f6e616c2053706163652053746174696f6e2c20736369656e7469737473206172652066696e64696e67206f757420686f77206c6976696e6720696e20737061636520616666656374732068756d616e732e3c2f703e, '2019-01-01 14:57:32', '2019-01-01 14:57:32'),
(18, 0, 'sadasd', '', '', '2019-01-07 14:32:56', '2019-01-07 14:32:56');

-- --------------------------------------------------------

--
-- Table structure for table `tms_knowledge_category`
--

CREATE TABLE `tms_knowledge_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `icon` longtext NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_knowledge_category`
--

INSERT INTO `tms_knowledge_category` (`category_id`, `category_name`, `description`, `icon`, `created_date`, `modified_date`) VALUES
(11, 'IT', 'Articles to get you up and running, quick and easy.', 'https://cdn3.iconfinder.com/data/icons/ballicons-reloaded-vol-1/512/icon-84-512.png', '2016-12-14 18:52:21', '2016-12-14 18:52:21'),
(12, 'Line Managers', 'Articles to get you up and running, quick and easy.', 'https://cdn1.iconfinder.com/data/icons/game-development-2/128/cb-403-512.png', '2017-07-24 15:51:03', '2017-07-24 15:51:03'),
(13, 'Project Teams', 'Articles to get you up and running, quick and easy', 'https://cdn4.iconfinder.com/data/icons/alphabet-3/500/ABC_alphabet_letter_font_graphic_language_text_Q-512.png', '2018-02-20 15:39:57', '2018-02-20 15:39:57'),
(14, 'Stuff for the staff', 'Articles to get you up and running, quick and easy', 'https://cdn2.iconfinder.com/data/icons/the-politics/350/Candidates-512.png', '2016-11-25 18:52:31', '2016-11-25 18:52:31'),
(15, 'MemoQ', 'Articles to get you up and running, quick and easy', 'https://cdn3.iconfinder.com/data/icons/shopping-and-ecommerce-1-1/128/23-512.png', '2016-11-25 18:52:34', '2016-11-25 18:52:34'),
(16, 'Plunet', 'Articles to get you up and running, quick and easy', 'https://cdn2.iconfinder.com/data/icons/circle-icons-1/64/globe-512.png', '2016-12-14 18:52:17', '2016-12-14 18:52:17'),
(19, 'Office Management', 'Articles to get you up and running, quick and easy', 'https://cdn1.iconfinder.com/data/icons/system-icons-4/1024/Admin-512.png', '2016-11-28 15:58:38', '2016-11-28 15:58:38'),
(20, 'Getting started', 'Getting started', 'https://cdn4.iconfinder.com/data/icons/iconza-poker-playing-cards/64/hearts-Q-512.png', '2018-02-20 15:40:39', '2018-02-20 15:40:39'),
(21, 'Tranlation', 'Lorem ipsum has become the industry standard for design mockups and prototypes.', 'https://cdn4.iconfinder.com/data/icons/outline-seo-icons/48/translation-and-localization-512.png', '2018-04-19 15:27:06', '2018-04-19 15:27:06'),
(24, 'Home', 'Home description', 'https://cdn2.iconfinder.com/data/icons/line-color-mix-vol-5/128/Line_Mix_Vol.7-99-512.png', '2018-04-19 15:40:49', '2018-04-19 15:40:49'),
(33, 'star', 'star', 'https://cdn3.iconfinder.com/data/icons/famous-city-skyline/48/Sed-49-512.png', '2018-04-19 16:20:01', '2018-04-19 16:20:01'),
(38, 'New', 'New added', 'https://cdn0.iconfinder.com/data/icons/social-messaging-ui-color-shapes/128/add-circle-green-512.png', '2018-10-03 15:34:26', '2018-10-03 15:34:26');

-- --------------------------------------------------------

--
-- Table structure for table `tms_knowledge_events`
--

CREATE TABLE `tms_knowledge_events` (
  `event_id` int(11) NOT NULL,
  `event_title` varchar(255) NOT NULL,
  `event_startdate` datetime NOT NULL,
  `event_enddate` datetime NOT NULL,
  `event_allday` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_knowledge_events`
--

INSERT INTO `tms_knowledge_events` (`event_id`, `event_title`, `event_startdate`, `event_enddate`, `event_allday`, `created_date`, `modified_date`) VALUES
(27, 'New year', '2023-01-01 00:00:00', '2023-01-01 23:59:59', '', '2018-07-16 18:28:33', '2022-11-01 13:20:31'),
(28, 'Christmas', '2018-12-25 00:00:00', '2018-12-31 23:59:59', '', '2018-12-20 16:00:25', '2018-12-20 16:21:19'),
(29, 'celebration', '2022-07-23 00:00:00', '2022-07-23 23:59:59', '', '2022-07-22 16:33:30', '2022-07-22 16:34:12');

-- --------------------------------------------------------

--
-- Table structure for table `tms_knowledge_news`
--

CREATE TABLE `tms_knowledge_news` (
  `k_news_id` int(11) NOT NULL,
  `k_news_title` varchar(255) NOT NULL,
  `news_sort_des` varchar(255) NOT NULL,
  `k_news_description` blob NOT NULL,
  `created_user` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tms_knowledge_pic`
--

CREATE TABLE `tms_knowledge_pic` (
  `pic_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `funny_pic` varchar(255) NOT NULL,
  `flag_like` int(11) NOT NULL,
  `flag_comment` int(11) NOT NULL DEFAULT '0',
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0=deactive, 1=active',
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tms_know_pic_comment`
--

CREATE TABLE `tms_know_pic_comment` (
  `comment_id` int(11) NOT NULL,
  `pic_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `created_date` varchar(50) NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tms_know_pic_like`
--

CREATE TABLE `tms_know_pic_like` (
  `like_pic_id` int(11) NOT NULL,
  `pic_id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `pic_like` int(11) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_know_pic_like`
--

INSERT INTO `tms_know_pic_like` (`like_pic_id`, `pic_id`, `userId`, `pic_like`, `created_date`, `modified_date`) VALUES
(1, 9, 3, 1, '2018-12-20 00:00:00', '2018-12-20 00:00:00'),
(4, 1, 1, 1, '2018-12-28 00:00:00', '2018-12-28 00:00:00'),
(5, 10, 1, 1, '2021-10-05 00:00:00', '2021-10-05 00:00:00'),
(6, 9, 1, 1, '2021-10-05 00:00:00', '2021-10-05 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tms_language`
--

CREATE TABLE `tms_language` (
  `lang_id` int(11) NOT NULL,
  `lang_name` varchar(255) NOT NULL,
  `lang_description` text NOT NULL,
  `is_active` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_language`
--

INSERT INTO `tms_language` (`lang_id`, `lang_name`, `lang_description`, `is_active`, `created_date`, `modified_date`) VALUES
(2, 'English', 'British English language', 1, '2015-11-07 11:54:49', '2017-02-03 17:48:33'),
(3, 'Albanian', 'Albanian', 1, '2015-11-07 11:55:13', '2018-01-02 17:23:42'),
(4, 'Arabic', 'Arabic', 1, '2015-11-07 11:55:36', '2018-01-02 17:23:51'),
(5, 'Bosnian', 'Bosnian', 1, '2015-11-16 16:53:34', '2018-01-02 17:23:59'),
(6, 'Norwegian', 'norwegian', 1, '2015-11-18 12:15:07', '2017-03-22 20:12:17'),
(7, 'Chinese (PRC)', 'Chinese (PRC)', 1, '2018-01-02 17:24:12', '2018-01-02 17:24:12'),
(8, 'Chinese (Taiwan)', 'Chinese (Taiwan)', 1, '2018-01-02 17:24:18', '2018-01-02 17:24:18'),
(9, 'Croatian', 'Croatian', 1, '2018-01-02 17:24:23', '2018-01-02 17:24:23'),
(10, 'English (GB)', 'English (GB)', 1, '2018-01-02 17:24:34', '2018-01-02 17:24:34'),
(11, 'Hindi', 'Hindi required', 1, '2018-04-17 18:34:59', '2018-04-17 18:34:59'),
(12, 'india', 'india', 1, '2018-04-17 18:35:41', '2018-04-17 18:35:41'),
(13, 'INR', 'india', 1, '2018-04-17 18:36:35', '2018-04-17 18:36:35'),
(14, 'Chinese', 'chinese', 1, '2018-04-18 12:07:49', '2018-04-18 12:07:49');

-- --------------------------------------------------------

--
-- Table structure for table `tms_languages`
--

CREATE TABLE `tms_languages` (
  `lang_id` int(111) NOT NULL,
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flagImg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flagTitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `is_favourite` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tms_languages`
--

INSERT INTO `tms_languages` (`lang_id`, `id`, `title`, `name`, `flagImg`, `flagTitle`, `is_active`, `is_favourite`, `created_date`, `modified_date`) VALUES
(1, 'ca_ES', 'Catalan', 'Català', 'catalonia.png', 'Catalonia', 1, 0, '2021-04-20 00:00:00', '2022-11-09 13:36:28'),
(2, 'cz_CZ', 'Czech', 'Čeština', 'cz.png', 'Czech Republic', 1, 0, '2021-04-20 00:00:00', '2021-07-13 12:36:21'),
(3, 'dk_DK', 'Danish', 'Dansk', 'dk.png', 'Denmark', 1, 1, '2021-04-20 00:00:00', '2021-07-22 13:57:08'),
(4, 'de_DE', 'German', 'Deutsch', 'de.png', 'Germany', 1, 0, '2021-04-20 00:00:00', '2021-06-02 19:34:50'),
(5, 'ee_EE', 'Estonian', 'Eesti', 'ee.png', 'Estonia', 1, 1, '2021-04-20 00:00:00', '2022-10-27 11:42:55'),
(6, 'en_UK', 'English (UK)', 'English (UK)', 'gb.png', 'United Kingdom', 1, 0, '2021-04-20 00:00:00', '2021-06-02 19:35:02'),
(7, 'en_US', 'English (US)', 'English (US)', 'us.png', 'United States', 1, 1, '2021-04-20 00:00:00', '2021-06-08 18:15:51'),
(8, 'es_ES', 'Spanish', 'Español', 'es.png', 'Spain', 1, 0, '2021-04-20 00:00:00', '2021-06-04 17:41:59'),
(9, 'fr_CA', 'French (Canada)', 'Français (Canada)', 'ca.png', 'Canada', 1, 1, '2021-04-20 00:00:00', '2022-10-28 15:03:17'),
(10, 'fr_FR', 'French (France)', 'Français (France)', 'fr.png', 'France', 1, 1, '2021-04-20 00:00:00', '2021-07-29 18:46:05'),
(11, 'hr_HR', 'Croatian', 'Hrvatski', 'hr.png', 'Croatia', 1, 0, '2021-04-20 00:00:00', '2022-10-18 15:12:49'),
(12, 'is_IS', 'Icelandic', '‏Íslenska', 'is.png', 'Iceland', 1, 1, '2021-04-20 00:00:00', '2021-06-29 15:53:55'),
(13, 'it_IT', 'Italian', 'Italiano', 'it.png', 'Italy', 1, 0, '2021-04-20 00:00:00', '2021-04-20 00:00:00'),
(14, 'lv_LV', 'Latvian', 'Latviešu', 'lv.png', 'Latvia', 1, 0, '2021-04-20 00:00:00', '2021-04-20 00:00:00'),
(15, 'lt_LT', 'Lithuanian', 'Lietuvių', 'lt.png', 'Lithuania', 1, 0, '2021-04-20 00:00:00', '2021-04-20 00:00:00'),
(16, 'hu_HU', 'Hungarian', 'Magyar', 'hu.png', 'Hungary', 1, 0, '2021-04-20 00:00:00', '2021-04-20 00:00:00'),
(17, 'nl_NL', 'Dutch', 'Nederlands', 'nl.png', 'Netherlands', 1, 0, '2021-04-20 00:00:00', '2021-04-20 00:00:00'),
(18, 'nl_BE', 'Dutch (Belgium)', 'Nederlands (België)', 'be.png', 'Belgium', 1, 0, '2021-04-20 00:00:00', '2021-04-20 00:00:00'),
(19, 'no_NO', 'Norwegian (bokmal)', 'Norsk (bokmål)', 'no.png', 'Norway', 1, 1, '2021-04-20 00:00:00', '2021-06-02 19:35:44'),
(20, 'ny_NO', 'Norwegian (nynorsk)', 'Norsk (nynorsk)', 'no.png', 'Norway', 1, 0, '2021-04-20 00:00:00', '2021-04-20 00:00:00'),
(21, 'pl_PL', 'Polish', 'Polski', 'pl.png', 'Poland', 1, 0, '2021-04-20 00:00:00', '2021-04-20 00:00:00'),
(22, 'pt_BR', 'Portuguese (Brazil)', 'Português (Brasil)', 'br.png', 'Brazil', 1, 0, '2021-04-20 00:00:00', '2021-04-20 00:00:00'),
(23, 'pt_PT', 'Portuguese (Portugal)', 'Português (Portugal)', 'pg.png', 'Portugal', 1, 0, '2021-04-20 00:00:00', '2021-04-20 00:00:00'),
(24, 'ro_RO', 'Romanian', 'Română', 'ro.png', 'Romania', 1, 0, '2021-04-20 00:00:00', '2021-04-20 00:00:00'),
(25, 'sk_SK', 'Slovak', 'Slovenčina', 'sk.png', 'Slovakia', 1, 0, '2021-04-20 00:00:00', '2021-04-20 00:00:00'),
(26, 'si_SI', 'Slovenian', 'Slovenščina', 'si.png', 'Slovenia', 1, 0, '2021-04-20 00:00:00', '2021-04-20 00:00:00'),
(27, 'fi_FI', 'Finnish', 'Suomi', 'fi.png', 'Finland', 1, 1, '2021-04-20 00:00:00', '2021-06-02 19:36:01'),
(28, 'se_SE', 'Swedish', 'Svenska', 'se.png', 'Sweden', 1, 1, '2021-04-20 00:00:00', '2021-06-02 19:36:14'),
(29, 'tr_TR', 'Turkish', 'Türkçe', 'tr.png', 'Turkey', 1, 0, '2021-04-20 00:00:00', '2021-04-20 00:00:00'),
(30, 'gr_GR', 'Greek', 'Ελληνικά', 'gr.png', 'Greece', 1, 0, '2021-04-20 00:00:00', '2021-04-20 00:00:00'),
(31, 'bg_BG', 'Bulgarian', 'Български', 'br.png', 'Bulgaria', 1, 0, '2021-04-20 00:00:00', '2021-04-20 00:00:00'),
(32, 'ru_RU', 'Russian', 'Русский', 'ru.png', 'Russia', 1, 0, '2021-04-20 00:00:00', '2021-04-20 00:00:00'),
(33, 'ua_UA', 'Ukrainian', 'Українська', 'ua.png', 'Ukraine', 1, 0, '2021-04-20 00:00:00', '2021-04-20 00:00:00'),
(34, 'hi_IN', 'Hindi', 'हिन्दी', 'in.png', 'India', 1, 1, '2021-04-20 00:00:00', '2021-09-16 15:26:51'),
(35, 'kr_KR', 'Korean', '한국어', 'kr.png', 'South Korea', 1, 0, '2021-04-20 00:00:00', '2021-04-20 00:00:00'),
(36, 'cn_TW', 'Traditional Chinese (Taiwan)', '中文(台灣)', 'tw.png', 'Taiwan', 1, 0, '2021-04-20 00:00:00', '2021-04-20 00:00:00'),
(37, 'cn_CN', 'Simplified Chinese (China)', '中文(简体)', 'cn.png', 'China', 1, 0, '2021-04-20 00:00:00', '2021-04-20 00:00:00'),
(38, 'cn_HK', 'Traditional Chinese (Hong Kong)', '中文(香港)', 'hk.png', 'Hong Kong', 1, 0, '2021-04-20 00:00:00', '2021-04-20 00:00:00'),
(39, 'jp_JP', 'Japanese', '日本語', 'jp.png', 'Japan', 1, 0, '2021-04-20 00:00:00', '2021-04-20 00:00:00'),
(40, 'ka_JP', 'Japanese (Kansai)', '日本語(関西)', 'jp.png', 'Japan', 1, 0, '2021-04-20 00:00:00', '2021-04-20 00:00:00'),
(41, 'en_GEN', 'English', 'English', 'noflag.png', 'General', 1, 1, '2021-04-20 00:00:00', '2021-06-08 18:15:51');

-- --------------------------------------------------------

--
-- Table structure for table `tms_log_master`
--

CREATE TABLE `tms_log_master` (
  `log_id` int(11) NOT NULL,
  `log_type_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `log_title` varchar(255) NOT NULL,
  `log_type` varchar(255) NOT NULL,
  `log_status` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_log_master`
--

INSERT INTO `tms_log_master` (`log_id`, `log_type_id`, `task_id`, `log_title`, `log_type`, `log_status`, `created_by`, `created_date`, `modified_date`) VALUES
(1, 1, 0, 'Capita', 'add', 'direct_cli', 1, '2022-10-31 20:13:04', '2022-10-31 20:13:04'),
(2, 1, 0, 'Capita', 'update', 'direct_cli', 1, '2022-10-31 20:14:04', '2022-11-17 21:46:58'),
(3, 2, 0, 'Berba Translations S.L.', 'add', 'direct_cli', 1, '2022-10-31 20:15:38', '2022-10-31 20:15:38'),
(4, 3, 0, 'DATAWORDS DATASIA SARL', 'add', 'direct_cli', 1, '2022-10-31 20:24:52', '2022-10-31 20:24:52'),
(5, 1, 0, 'TMS Admin', 'update', 'internal_res', 1, '2022-11-01 10:04:49', '2022-11-11 21:06:24'),
(6, 2, 0, 'Anil Nadiya', 'add', 'internal_res', 1, '2022-11-01 12:40:07', '2022-11-01 12:40:07'),
(7, 2, 0, 'Anil Nadiya', 'update', 'internal_res', 1, '2022-11-01 12:41:23', '2022-12-09 16:45:52'),
(8, 3, 0, 'QA Kanhasoft', 'add', 'internal_res', 1, '2022-11-01 12:50:43', '2022-11-01 12:50:43'),
(9, 4, 0, 'Linguist Kanhasoft', 'add', 'external_res', 1, '2022-11-01 12:57:31', '2022-11-01 12:57:31'),
(10, 4, 0, 'Kanhasoft', 'add', 'direct_cli', 1, '2022-11-01 13:03:57', '2022-11-01 13:03:57'),
(11, 4, 0, 'Kanhasoft Test Client', 'update', 'direct_cli', 1, '2022-11-01 13:05:02', '2022-12-01 10:38:15'),
(12, 1, 0, 'Acc Kanhasoft', 'add', 'indirect_cli', 1, '2022-11-01 13:17:59', '2022-11-01 13:17:59'),
(13, 4, 0, 'Linguist Kanhasoft', 'update', 'external_res', 1, '2022-11-01 13:22:19', '2022-12-12 17:40:44'),
(14, 3, 0, 'KNH160001', 'add', 'project', 1, '2022-11-01 14:18:01', '2022-11-01 14:18:01'),
(15, 3, 0, 'KNH160001', 'update', 'project', 1, '2022-11-01 14:18:58', '2022-12-06 18:30:23'),
(16, 3, 1, 'KNH160001_BAD001', 'update', 'task', 1, '2022-11-01 14:20:05', '2022-12-08 18:38:25'),
(17, 2, 0, 'Microsoft', 'add', 'indirect_cli', 1, '2022-11-02 18:09:16', '2022-11-02 18:09:16'),
(18, 5, 0, 'Solveig Sandaas', 'add', 'internal_res', 1, '2022-11-02 18:16:19', '2022-11-02 18:16:19'),
(19, 2, 0, 'Berba Translations S.L.', 'update', 'direct_cli', 1, '2022-11-02 18:24:09', '2022-11-11 23:39:08'),
(20, 3, 0, 'SpellUp', 'add', 'indirect_cli', 1, '2022-11-02 18:33:07', '2022-11-02 18:33:07'),
(21, 10, 0, 'KNH160002', 'add', 'project', 1, '2022-11-03 10:28:30', '2022-11-03 10:28:30'),
(22, 10, 0, 'KNH160002', 'update', 'project', 1, '2022-11-03 10:29:05', '2022-11-03 10:29:05'),
(23, 11, 0, 'KNH160003', 'add', 'project', 1, '2022-11-03 10:34:20', '2022-11-03 10:34:20'),
(24, 11, 0, 'KNH160003', 'update', 'project', 1, '2022-11-03 10:34:35', '2022-11-03 10:34:35'),
(25, 12, 0, 'KNH160004', 'add', 'project', 1, '2022-11-03 10:47:45', '2022-11-03 10:47:45'),
(26, 12, 0, 'KNH160004', 'update', 'project', 1, '2022-11-03 11:21:05', '2022-11-03 18:01:25'),
(27, 4, 0, 'Linguist Kanhasoft', 'update', 'external_res', 4, '2022-11-03 17:27:10', '2022-11-10 11:15:09'),
(28, 20, 0, 'KNH160005', 'add', 'project', 1, '2022-11-03 18:07:32', '2022-11-03 18:07:32'),
(29, 20, 0, 'KNH160005', 'update', 'project', 1, '2022-11-03 18:08:21', '2022-11-09 10:26:04'),
(30, 20, 3, 'KNH160005_BAD001', 'update', 'task', 1, '2022-11-03 18:09:05', '2022-11-21 19:26:19'),
(31, 21, 0, 'KNH160006', 'add', 'project', 1, '2022-11-03 18:11:02', '2022-11-03 18:11:02'),
(32, 4, 0, '', 'create', 'direct_cli', 1, '2022-11-03 18:50:49', '2022-11-09 10:05:55'),
(33, 5, 0, 'ICS Translate', 'add', 'direct_cli', 1, '2022-11-03 20:08:34', '2022-11-03 20:08:34'),
(34, 5, 0, 'ICS Translate', 'update', 'direct_cli', 1, '2022-11-03 20:22:04', '2022-11-17 14:54:39'),
(35, 5, 0, '', 'create', 'direct_cli', 1, '2022-11-03 20:23:09', '2022-11-03 20:23:09'),
(36, 24, 0, 'SPE220001', 'add', 'project', 1, '2022-11-03 21:02:45', '2022-11-03 21:02:45'),
(37, 25, 0, 'SPE220002', 'add', 'project', 1, '2022-11-03 21:10:39', '2022-11-03 21:10:39'),
(38, 25, 0, 'SPE220002', 'update', 'project', 1, '2022-11-03 21:14:51', '2022-11-17 21:32:22'),
(39, 25, 4, 'SPE220002_SEO001', 'update', 'task', 1, '2022-11-03 21:16:05', '2022-11-10 14:40:33'),
(40, 25, 5, 'SPE220002_DTC002', 'update', 'task', 1, '2022-11-03 21:16:15', '2022-11-03 21:44:36'),
(41, 25, 6, 'SPE220002_DTP003', 'update', 'task', 1, '2022-11-03 21:16:23', '2022-11-03 21:44:49'),
(42, 27, 0, 'SPE220003', 'add', 'project', 1, '2022-11-03 21:58:05', '2022-11-03 21:58:05'),
(43, 27, 0, 'SPE220003', 'update', 'project', 1, '2022-11-03 22:00:58', '2022-11-03 22:02:49'),
(44, 27, 7, 'SPE220003_BAD001', 'update', 'task', 1, '2022-11-03 22:01:29', '2022-11-03 22:02:18'),
(45, 6, 0, 'Test Kanhasoft', 'add', 'direct_cli', 3, '2022-11-04 11:26:31', '2022-11-04 11:26:31'),
(46, 6, 0, 'Test Kanhasoft', 'update', 'direct_cli', 3, '2022-11-04 11:27:45', '2022-11-04 11:32:18'),
(47, 6, 0, '', 'create', 'direct_cli', 3, '2022-11-04 11:32:22', '2022-11-04 11:32:22'),
(48, 6, 0, '', 'delete', 'direct_cli', 3, '2022-11-04 11:33:53', '2022-11-04 11:33:53'),
(49, 29, 0, 'SPE220004', 'add', 'project', 1, '2022-11-04 16:28:21', '2022-11-04 16:28:21'),
(50, 29, 0, 'SPE220004', 'update', 'project', 1, '2022-11-04 16:29:47', '2022-11-04 16:31:30'),
(51, 29, 8, 'SPE220004_PRF001', 'update', 'task', 1, '2022-11-04 16:30:28', '2022-11-04 16:30:28'),
(52, 3, 0, 'DATAWORDS DATASIA SARL', 'update', 'direct_cli', 1, '2022-11-04 16:39:29', '2022-12-05 20:58:27'),
(53, 31, 0, 'SPE220005', 'add', 'project', 1, '2022-11-04 16:40:56', '2022-11-04 16:40:56'),
(54, 31, 0, 'SPE220005', 'update', 'project', 1, '2022-11-04 16:43:32', '2022-11-04 16:43:32'),
(55, 31, 9, 'SPE220005_PRF001', 'update', 'task', 1, '2022-11-04 16:43:51', '2022-11-04 16:43:51'),
(56, 33, 0, 'SPE220006', 'add', 'project', 1, '2022-11-04 16:48:54', '2022-11-04 16:48:54'),
(57, 33, 0, 'SPE220006', 'update', 'project', 1, '2022-11-04 16:54:14', '2022-12-01 16:14:39'),
(58, 33, 10, 'SPE220006_TRA001', 'update', 'task', 1, '2022-11-04 16:55:20', '2022-11-04 16:55:20'),
(59, 6, 0, 'Kanhsoftinternal Resourcelongname', 'add', 'internal_res', 1, '2022-11-04 17:46:09', '2022-11-04 17:46:09'),
(60, 6, 0, 'Kanhsoftinternal Resourcelongname', 'delete', 'internal_res', 1, '2022-11-04 18:10:16', '2022-11-04 18:10:16'),
(61, 1, 0, 'Acc Kanhasoft', 'update', 'indirect_cli', 1, '2022-11-07 12:28:31', '2022-11-07 12:28:31'),
(62, 36, 0, 'KNH160007', 'add', 'project', 1, '2022-11-07 15:20:08', '2022-11-07 15:20:08'),
(63, 36, 0, 'KNH160007', 'update', 'project', 1, '2022-11-07 15:26:55', '2022-11-07 18:05:40'),
(64, 36, 11, 'KNH160007_TRA001', 'update', 'task', 1, '2022-11-07 16:23:39', '2022-11-10 16:03:11'),
(65, 36, 12, 'KNH160007_TRA002', 'update', 'task', 1, '2022-11-07 16:24:36', '2022-11-07 17:36:29'),
(66, 37, 0, 'SPE220007', 'add', 'project', 1, '2022-11-08 13:44:35', '2022-11-08 13:44:35'),
(67, 37, 0, 'SPE220007', 'update', 'project', 1, '2022-11-08 13:46:03', '2022-11-08 13:46:11'),
(68, 37, 13, 'SPE220007_PRF001', 'update', 'task', 1, '2022-11-08 13:46:37', '2022-11-08 13:46:37'),
(69, 4, 0, 'TruePartners', 'add', 'indirect_cli', 1, '2022-11-08 13:47:59', '2022-11-08 13:47:59'),
(70, 38, 0, 'SPE220008', 'add', 'project', 1, '2022-11-08 13:49:03', '2022-11-08 13:49:03'),
(71, 38, 0, 'SPE220008', 'update', 'project', 1, '2022-11-08 13:50:31', '2022-12-01 16:15:04'),
(72, 38, 14, 'SPE220008_PRF001', 'update', 'task', 1, '2022-11-08 13:50:50', '2022-11-08 13:50:50'),
(73, 39, 0, 'KNH160008', 'add', 'project', 1, '2022-11-08 14:37:24', '2022-11-08 14:37:24'),
(74, 40, 0, 'KNH160009', 'add', 'project', 1, '2022-11-08 14:44:55', '2022-11-08 14:44:55'),
(75, 41, 0, 'KNH160010', 'add', 'project', 1, '2022-11-08 15:08:27', '2022-11-08 15:08:27'),
(76, 41, 0, 'KNH160010', 'update', 'project', 1, '2022-11-08 15:10:55', '2022-12-05 14:56:30'),
(77, 41, 15, 'KNH160010_BAD001', 'update', 'task', 1, '2022-11-08 15:11:35', '2022-11-21 17:43:17'),
(78, 7, 0, 'Ingvild Sundland', 'add', 'internal_res', 1, '2022-11-08 16:34:42', '2022-11-08 16:34:42'),
(79, 7, 0, 'Ingvild Sundland', 'update', 'internal_res', 1, '2022-11-08 16:34:47', '2022-11-18 01:34:57'),
(80, 7, 0, 'Ingvild Sundland', 'update', 'internal_res', 7, '2022-11-08 16:40:18', '2022-11-08 16:40:18'),
(81, 43, 0, 'KNH160011', 'add', 'project', 1, '2022-11-08 17:07:53', '2022-11-08 17:07:53'),
(82, 7, 0, 'Kanaatest', 'add', 'direct_cli', 1, '2022-11-08 17:50:05', '2022-11-08 17:50:05'),
(83, 7, 0, 'Kanaatest', 'update', 'direct_cli', 1, '2022-11-08 17:50:48', '2022-11-09 12:52:30'),
(84, 5, 0, 'Chanel', 'add', 'indirect_cli', 1, '2022-11-08 18:02:37', '2022-11-08 18:02:37'),
(85, 46, 0, 'SPE220009', 'add', 'project', 1, '2022-11-08 18:03:13', '2022-11-08 18:03:13'),
(86, 46, 0, 'SPE220009', 'update', 'project', 1, '2022-11-08 18:07:08', '2022-11-08 18:07:08'),
(87, 46, 16, 'SPE220009_PRF001', 'update', 'task', 1, '2022-11-08 18:07:32', '2022-11-08 18:07:32'),
(88, 7, 0, '', 'create', 'direct_cli', 1, '2022-11-08 18:44:55', '2022-11-08 18:45:03'),
(89, 43, 0, 'KNH160011', 'update', 'project', 1, '2022-11-09 10:21:34', '2022-11-09 14:52:43'),
(90, 3, 0, 'QA Kanhasoft', 'update', 'internal_res', 1, '2022-11-09 11:19:28', '2022-11-11 14:55:04'),
(91, 8, 0, 'Marika Sundland Lehtimäki', 'add', 'external_res', 1, '2022-11-09 15:23:55', '2022-11-09 15:23:55'),
(92, 8, 0, 'Marika Sundland Lehtimäki', 'update', 'external_res', 1, '2022-11-09 15:25:12', '2022-11-17 21:41:56'),
(93, 43, 17, 'KNH160011_TRA001', 'update', 'task', 1, '2022-11-09 16:57:34', '2022-11-09 16:57:47'),
(94, 9, 0, 'Testkanhasoft Client', 'add', 'external_res', 1, '2022-11-09 17:56:24', '2022-11-09 17:56:24'),
(95, 9, 0, 'TestDt kanhasoft', 'update', 'external_res', 1, '2022-11-09 17:56:38', '2022-11-09 20:12:31'),
(96, 10, 0, 'Testkanha 0911', 'add', 'external_res', 1, '2022-11-09 18:36:53', '2022-11-09 18:36:53'),
(97, 10, 0, 'Testkanha Points', 'update', 'external_res', 1, '2022-11-09 18:37:11', '2022-11-11 18:48:17'),
(98, 11, 0, 'Test No Active', 'add', 'external_res', 1, '2022-11-09 20:11:33', '2022-11-09 20:11:33'),
(99, 11, 0, 'Test No Active', 'delete', 'external_res', 1, '2022-11-09 20:11:51', '2022-11-09 20:11:51'),
(100, 7, 0, '', 'delete', 'direct_cli', 1, '2022-11-10 15:36:56', '2022-11-10 15:36:56'),
(101, 8, 0, 'JT Language Solutions', 'add', 'direct_cli', 1, '2022-11-10 15:52:44', '2022-11-10 15:52:44'),
(102, 8, 0, 'JT Language Solutions', 'update', 'direct_cli', 1, '2022-11-10 15:54:31', '2022-11-11 16:58:22'),
(103, 8, 0, '', 'create', 'direct_cli', 1, '2022-11-10 15:56:06', '2022-11-10 15:56:06'),
(104, 49, 0, 'SPE220010', 'add', 'project', 1, '2022-11-10 16:00:49', '2022-11-10 16:00:49'),
(105, 49, 0, 'SPE220010', 'update', 'project', 1, '2022-11-10 16:01:37', '2022-12-01 16:15:45'),
(106, 49, 18, 'SPE220010_TRA001', 'update', 'task', 1, '2022-11-10 16:02:23', '2022-11-10 16:02:23'),
(107, 6, 0, 'Hill´s Pet', 'add', 'indirect_cli', 1, '2022-11-10 16:35:55', '2022-11-10 16:35:55'),
(108, 51, 0, 'SPE220011', 'add', 'project', 1, '2022-11-10 16:36:38', '2022-11-10 16:36:38'),
(109, 51, 0, 'SPE220011', 'update', 'project', 1, '2022-11-10 16:38:34', '2022-11-10 16:38:34'),
(110, 51, 19, 'SPE220011_PRF001', 'update', 'task', 1, '2022-11-10 16:38:46', '2022-11-10 16:38:46'),
(111, 12, 2, 'KNH160004_COP001', 'update', 'task', 1, '2022-11-11 10:39:31', '2022-11-11 10:49:14'),
(112, 9, 0, 'TestDt kanhasoft', 'delete', 'external_res', 1, '2022-11-11 11:34:46', '2022-11-11 11:34:46'),
(113, 12, 0, 'Kanhasoft extres1111', 'add', 'external_res', 1, '2022-11-11 13:10:15', '2022-11-11 13:10:15'),
(114, 12, 0, 'Kanhasoft Test2', 'update', 'external_res', 1, '2022-11-11 13:10:41', '2022-11-16 19:13:21'),
(115, 9, 0, 'Scorewarrior Limited', 'add', 'direct_cli', 7, '2022-11-11 16:05:59', '2022-11-11 16:05:59'),
(116, 9, 0, 'Scorewarrior Limited', 'update', 'direct_cli', 7, '2022-11-11 16:15:17', '2022-11-11 16:20:48'),
(117, 9, 0, '', 'create', 'direct_cli', 7, '2022-11-11 16:16:15', '2022-11-11 16:16:15'),
(118, 7, 0, 'Scorewarrior', 'add', 'indirect_cli', 7, '2022-11-11 16:21:37', '2022-11-11 16:21:37'),
(119, 55, 0, 'SPEU_0001', 'add', 'project', 7, '2022-11-11 16:23:15', '2022-11-11 16:23:15'),
(120, 55, 0, 'SPEU_0001', 'update', 'project', 7, '2022-11-11 16:35:00', '2022-11-23 10:20:06'),
(121, 56, 0, 'SPE220012', 'add', 'project', 1, '2022-11-11 21:02:41', '2022-11-11 21:02:41'),
(122, 57, 0, 'KNH160012', 'add', 'project', 1, '2022-11-14 14:26:32', '2022-11-14 14:26:32'),
(123, 57, 0, 'KNH160012', 'update', 'project', 1, '2022-11-14 14:28:11', '2022-11-14 14:28:11'),
(124, 8, 0, 'Gaming Innovation Group (GiG)', 'add', 'indirect_cli', 1, '2022-11-16 16:25:32', '2022-11-16 16:25:32'),
(125, 59, 0, 'SPE220013', 'add', 'project', 1, '2022-11-16 16:27:00', '2022-11-16 16:27:00'),
(126, 59, 0, 'SPE220013', 'update', 'project', 1, '2022-11-16 16:27:56', '2022-11-16 16:28:13'),
(127, 59, 36, 'SPE220013_PRF001', 'update', 'task', 1, '2022-11-16 16:29:58', '2022-11-16 16:30:24'),
(128, 9, 0, 'Uniclub', 'add', 'indirect_cli', 1, '2022-11-16 16:31:57', '2022-11-16 16:31:57'),
(129, 61, 0, 'SPE220014', 'add', 'project', 1, '2022-11-16 16:34:45', '2022-11-16 16:34:45'),
(130, 61, 0, 'SPE220014', 'update', 'project', 1, '2022-11-16 16:36:00', '2022-11-16 16:38:48'),
(131, 61, 37, 'SPE220014_PRF001', 'update', 'task', 1, '2022-11-16 16:36:22', '2022-11-16 16:36:22'),
(132, 10, 0, 'MAXSUN INTERNATIONAL (HK) LTD', 'add', 'direct_cli', 1, '2022-11-16 16:46:14', '2022-11-16 16:46:14'),
(133, 10, 0, 'MAXSUN INTERNATIONAL (HK) LTD', 'update', 'direct_cli', 1, '2022-11-16 16:46:58', '2022-11-16 16:48:29'),
(134, 10, 0, '', 'create', 'direct_cli', 1, '2022-11-16 16:48:33', '2022-11-16 16:48:33'),
(135, 62, 0, 'SPE_0001', 'add', 'project', 1, '2022-11-16 16:50:32', '2022-11-16 16:50:32'),
(136, 62, 0, 'SPE_0001', 'update', 'project', 1, '2022-11-16 16:51:34', '2022-11-16 16:51:39'),
(137, 62, 38, 'SPE_0001_TRA001', 'update', 'task', 1, '2022-11-16 16:51:51', '2022-11-16 16:51:59'),
(138, 11, 0, 'Intrawelt', 'add', 'direct_cli', 1, '2022-11-16 16:59:08', '2022-11-16 16:59:08'),
(139, 11, 0, 'Intrawelt', 'update', 'direct_cli', 1, '2022-11-16 16:59:44', '2022-12-01 19:53:53'),
(140, 63, 0, 'SPE_0002', 'add', 'project', 1, '2022-11-16 17:01:14', '2022-11-16 17:01:14'),
(141, 63, 0, 'SPE_0002', 'update', 'project', 1, '2022-11-16 17:02:28', '2022-11-16 17:02:28'),
(142, 63, 39, 'SPE_0002_TRA001', 'update', 'task', 1, '2022-11-16 17:02:43', '2022-11-16 17:02:43'),
(143, 10, 0, 'SkinCeuticals', 'add', 'indirect_cli', 1, '2022-11-16 17:04:59', '2022-11-16 17:04:59'),
(144, 64, 0, 'SPE220015', 'add', 'project', 1, '2022-11-16 17:05:58', '2022-11-16 17:05:58'),
(145, 64, 0, 'SPE220015', 'update', 'project', 1, '2022-11-16 17:06:41', '2022-11-16 17:06:51'),
(146, 64, 40, 'SPE220015_PRF001', 'update', 'task', 1, '2022-11-16 17:07:02', '2022-11-16 17:07:02'),
(147, 13, 0, 'Kanha_BPl', 'delete', 'external_res', 1, '2022-11-16 18:10:55', '2022-11-16 18:10:55'),
(148, 66, 0, 'KNH160013', 'add', 'project', 1, '2022-11-16 20:54:13', '2022-11-16 20:54:13'),
(149, 67, 0, 'KNH160014', 'add', 'project', 1, '2022-11-16 21:00:23', '2022-11-16 21:00:23'),
(150, 8, 0, 'Marika Sundland Lehtimäki', 'update', 'external_res', 8, '2022-11-16 21:42:04', '2022-11-16 21:42:04'),
(151, 9, 0, 'Scorewarrior Limited', 'update', 'direct_cli', 1, '2022-11-17 14:55:14', '2022-11-17 14:55:14'),
(152, 66, 0, 'KNH160013', 'update', 'project', 1, '2022-11-17 21:17:14', '2022-11-17 22:10:47'),
(153, 66, 42, 'KNH160013_TRA002', 'update', 'task', 1, '2022-11-17 22:12:26', '2022-11-17 22:15:37'),
(154, 4, 0, '', 'create', 'direct_cli', 7, '2022-11-17 23:41:56', '2022-11-17 23:41:56'),
(155, 12, 0, 'Ingvild Test Client', 'add', 'direct_cli', 7, '2022-11-18 00:12:21', '2022-11-18 00:12:21'),
(156, 12, 0, 'Ingvild Test Client', 'update', 'direct_cli', 7, '2022-11-18 00:16:00', '2022-11-18 00:32:35'),
(157, 12, 0, '', 'create', 'direct_cli', 7, '2022-11-18 00:31:25', '2022-11-18 00:32:17'),
(158, 72, 0, 'SPE_0003', 'add', 'project', 7, '2022-11-18 00:52:04', '2022-11-18 00:52:04'),
(159, 72, 0, 'SPE_0003', 'update', 'project', 7, '2022-11-18 00:57:53', '2022-11-22 13:45:17'),
(160, 72, 43, 'SPE_0003_TRA001', 'update', 'task', 7, '2022-11-18 01:01:03', '2022-11-18 01:01:49'),
(161, 14, 0, 'Solveig T. Sandaas', 'add', 'internal_res', 7, '2022-11-18 01:13:56', '2022-11-18 01:13:56'),
(162, 14, 0, 'Solveig T. Sandaas', 'update', 'internal_res', 7, '2022-11-18 01:14:04', '2022-12-08 16:14:21'),
(163, 13, 0, 'Shivalik_kanhasoft', 'add', 'direct_cli', 1, '2022-11-18 15:52:06', '2022-11-18 15:52:06'),
(164, 13, 0, 'Shivalik_kanhasoft', 'update', 'direct_cli', 1, '2022-11-18 15:52:47', '2022-11-18 16:21:06'),
(165, 13, 0, '', 'create', 'direct_cli', 1, '2022-11-18 15:55:45', '2022-11-18 15:55:49'),
(166, 74, 0, 'SPE220016', 'add', 'project', 1, '2022-11-18 23:52:34', '2022-11-18 23:52:34'),
(167, 74, 0, 'SPE220016', 'update', 'project', 1, '2022-11-18 23:53:36', '2022-12-02 15:40:41'),
(168, 74, 44, 'SPE220016_PRF001', 'update', 'task', 1, '2022-11-18 23:54:00', '2022-11-18 23:54:00'),
(169, 76, 0, 'SPE220017', 'add', 'project', 1, '2022-11-18 23:57:30', '2022-11-18 23:57:30'),
(170, 76, 0, 'SPE220017', 'update', 'project', 1, '2022-11-18 23:58:25', '2022-11-18 23:58:30'),
(171, 76, 45, 'SPE220017_PRF001', 'update', 'task', 1, '2022-11-18 23:58:40', '2022-11-18 23:58:40'),
(172, 12, 0, 'Kanhasoft Test2', 'delete', 'external_res', 1, '2022-11-21 10:38:48', '2022-11-21 10:38:48'),
(173, 72, 0, 'SPE_0003', 'update', 'project', 1, '2022-11-21 12:00:18', '2022-11-21 12:00:18'),
(174, 41, 46, 'KNH160010_DTP002', 'update', 'task', 1, '2022-11-21 17:55:56', '2022-11-21 18:01:22'),
(175, 12, 0, 'KNH160004', 'update', 'project', 7, '2022-11-23 14:36:21', '2022-11-23 14:36:21'),
(176, 41, 48, 'KNH160010_QAA003', 'update', 'task', 7, '2022-11-23 19:37:49', '2022-11-23 19:37:49'),
(177, 41, 0, 'KNH160010', 'update', 'project', 7, '2022-11-23 19:48:25', '2022-12-04 22:53:53'),
(178, 3, 0, 'KNH160001', 'update', 'project', 7, '2022-11-24 13:00:55', '2022-11-24 13:01:59'),
(179, 80, 0, 'KNH160015', 'add', 'project', 1, '2022-11-24 15:03:37', '2022-11-24 15:03:37'),
(180, 80, 0, 'KNH160015', 'update', 'project', 1, '2022-11-24 15:04:25', '2022-11-30 18:13:22'),
(181, 1, 0, '', 'create', 'direct_cli', 7, '2022-11-26 18:14:50', '2022-11-26 18:14:50'),
(182, 15, 0, 'Solveig_Sandaas', 'add', 'internal_res', 7, '2022-11-26 18:19:29', '2022-11-26 18:19:29'),
(183, 17, 0, 'Vivek Kan', 'add', 'internal_res', 1, '2022-11-29 12:47:34', '2022-11-29 12:47:34'),
(184, 17, 0, 'Vivek_Kan', 'update', 'internal_res', 1, '2022-11-29 12:48:12', '2022-11-29 12:53:05'),
(185, 18, 0, 'Aayush KD', 'add', 'external_res', 1, '2022-11-29 13:11:09', '2022-11-29 13:11:09'),
(186, 18, 0, 'Aayush KD_KANHASOFT', 'update', 'external_res', 1, '2022-11-29 13:11:30', '2022-11-29 14:35:31'),
(187, 80, 51, 'KNH160015_BAD001', 'update', 'task', 1, '2022-11-29 15:28:51', '2022-11-29 15:28:51'),
(188, 19, 0, 'Romeo Kanhasoft', 'add', 'external_res', 1, '2022-11-30 17:41:52', '2022-11-30 17:41:52'),
(189, 19, 0, 'Romeo Kanhasoft', 'update', 'external_res', 1, '2022-11-30 17:42:04', '2022-11-30 18:10:09'),
(190, 83, 0, 'SPE22,SPE_0001', 'add', 'project', 1, '2022-12-01 16:00:46', '2022-12-01 16:00:46'),
(191, 83, 0, 'SPE22,SPE_0001', 'update', 'project', 1, '2022-12-01 16:01:48', '2022-12-01 16:14:02'),
(192, 83, 53, 'SPE22,SPE_0001_PRF001', 'update', 'task', 1, '2022-12-01 16:02:13', '2022-12-01 16:02:13'),
(193, 84, 0, 'SPE22,SPE_0002', 'add', 'project', 1, '2022-12-01 16:09:32', '2022-12-01 16:09:32'),
(194, 84, 0, 'SPE22,SPE_0002', 'update', 'project', 1, '2022-12-01 16:10:13', '2022-12-01 16:13:41'),
(195, 84, 54, 'SPE22,SPE_0002_PRF001', 'update', 'task', 1, '2022-12-01 16:10:39', '2022-12-01 16:10:39'),
(196, 11, 0, 'TechnoAlpin', 'add', 'indirect_cli', 1, '2022-12-01 16:26:55', '2022-12-01 16:26:55'),
(197, 86, 0, 'SPE_0004', 'add', 'project', 1, '2022-12-01 16:28:38', '2022-12-01 16:28:38'),
(198, 86, 0, 'SPE_0004', 'update', 'project', 1, '2022-12-01 16:31:39', '2022-12-01 16:33:38'),
(199, 86, 55, 'SPE_0004_TRA001', 'update', 'task', 1, '2022-12-01 16:32:01', '2022-12-01 16:32:01'),
(200, 14, 0, 'Lingsoft', 'add', 'direct_cli', 1, '2022-12-01 17:03:16', '2022-12-01 17:03:16'),
(201, 14, 0, 'Lingsoft', 'update', 'direct_cli', 1, '2022-12-01 17:04:49', '2022-12-01 17:08:08'),
(202, 12, 0, 'Parker Hannifin', 'add', 'indirect_cli', 1, '2022-12-01 17:12:37', '2022-12-01 17:12:37'),
(203, 87, 0, 'SPE_0005', 'add', 'project', 1, '2022-12-01 17:14:43', '2022-12-01 17:14:43'),
(204, 87, 0, 'SPE_0005', 'update', 'project', 1, '2022-12-01 17:16:22', '2022-12-01 17:16:31'),
(205, 87, 56, 'SPE_0005_PRF001', 'update', 'task', 1, '2022-12-01 17:16:52', '2022-12-01 17:16:52'),
(206, 88, 0, 'SPE22,SPE_0003', 'add', 'project', 1, '2022-12-01 17:51:12', '2022-12-01 17:51:12'),
(207, 88, 0, 'SPE22,SPE_0003', 'update', 'project', 1, '2022-12-01 17:51:58', '2022-12-01 17:51:58'),
(208, 88, 57, 'SPE22,SPE_0003_PRF001', 'update', 'task', 1, '2022-12-01 17:52:10', '2022-12-01 17:52:10'),
(209, 13, 0, 'ILOQ', 'add', 'indirect_cli', 1, '2022-12-01 18:06:20', '2022-12-01 18:06:20'),
(210, 89, 0, 'SPE_0006', 'add', 'project', 1, '2022-12-01 18:07:37', '2022-12-01 18:07:37'),
(211, 89, 0, 'SPE_0006', 'update', 'project', 1, '2022-12-01 18:09:54', '2022-12-01 18:10:00'),
(212, 89, 58, 'SPE_0006_TRA001', 'update', 'task', 1, '2022-12-01 18:10:11', '2022-12-01 18:10:11'),
(213, 14, 0, 'Ecolab', 'add', 'indirect_cli', 1, '2022-12-01 19:16:54', '2022-12-01 19:16:54'),
(214, 8, 0, 'GiG (Gaming Innovation Group)', 'update', 'indirect_cli', 1, '2022-12-01 19:17:16', '2022-12-01 19:17:16'),
(215, 91, 0, 'SPE_0007', 'add', 'project', 1, '2022-12-01 19:18:12', '2022-12-01 19:18:12'),
(216, 91, 0, 'SPE_0007', 'update', 'project', 1, '2022-12-01 19:22:01', '2022-12-01 19:32:42'),
(217, 91, 59, 'SPE_0007_TRA001', 'update', 'task', 1, '2022-12-01 19:33:00', '2022-12-01 19:33:00'),
(218, 15, 0, 'Intertranslations', 'add', 'direct_cli', 1, '2022-12-01 19:45:31', '2022-12-01 19:45:31'),
(219, 15, 0, 'Intertranslations', 'update', 'direct_cli', 1, '2022-12-01 19:46:07', '2022-12-01 19:46:07'),
(220, 15, 0, '', 'create', 'direct_cli', 1, '2022-12-01 19:46:43', '2022-12-01 19:46:43'),
(221, 92, 0, 'SPE_0008', 'add', 'project', 1, '2022-12-01 19:47:42', '2022-12-01 19:47:42'),
(222, 92, 0, 'SPE_0008', 'update', 'project', 1, '2022-12-01 19:48:20', '2022-12-01 19:48:25'),
(223, 92, 60, 'SPE_0008_PRF001', 'update', 'task', 1, '2022-12-01 19:48:38', '2022-12-01 19:48:38'),
(224, 16, 0, 'Qontent Group', 'add', 'direct_cli', 1, '2022-12-01 20:02:29', '2022-12-01 20:02:29'),
(225, 16, 0, 'Qontent Group', 'update', 'direct_cli', 1, '2022-12-01 20:03:03', '2022-12-01 20:03:34'),
(226, 16, 0, '', 'create', 'direct_cli', 1, '2022-12-01 20:03:36', '2022-12-01 20:03:36'),
(227, 93, 0, 'SPE_0009', 'add', 'project', 1, '2022-12-01 20:04:55', '2022-12-01 20:04:55'),
(228, 93, 0, 'SPE_0009', 'update', 'project', 1, '2022-12-01 20:05:20', '2022-12-01 20:06:49'),
(229, 93, 61, 'SPE_0009_PRF001', 'update', 'task', 1, '2022-12-01 20:06:00', '2022-12-01 20:06:16'),
(230, 94, 0, 'SPE_0010', 'add', 'project', 1, '2022-12-01 20:16:19', '2022-12-01 20:16:19'),
(231, 94, 0, 'SPE_0010', 'update', 'project', 1, '2022-12-01 20:17:27', '2022-12-01 20:18:58'),
(232, 94, 62, 'SPE_0010_TRA001', 'update', 'task', 1, '2022-12-01 20:17:52', '2022-12-01 20:17:52'),
(233, 95, 0, 'SPE22,SPE_0004', 'add', 'project', 1, '2022-12-01 20:25:23', '2022-12-01 20:25:23'),
(234, 95, 0, 'SPE22,SPE_0004', 'update', 'project', 1, '2022-12-01 20:27:03', '2022-12-01 20:27:08'),
(235, 95, 63, 'SPE22,SPE_0004_PRF001', 'update', 'task', 1, '2022-12-01 20:27:27', '2022-12-01 20:27:27'),
(236, 96, 0, 'SPE220018', 'add', 'project', 1, '2022-12-01 20:40:59', '2022-12-01 20:40:59'),
(237, 96, 0, 'SPE220018', 'update', 'project', 1, '2022-12-01 20:41:51', '2022-12-01 20:41:54'),
(238, 96, 64, 'SPE220018_PRF001', 'update', 'task', 1, '2022-12-01 20:42:04', '2022-12-01 20:42:04'),
(239, 97, 0, 'SPE220019', 'add', 'project', 1, '2022-12-01 20:46:05', '2022-12-01 20:46:05'),
(240, 97, 0, 'SPE220019', 'update', 'project', 1, '2022-12-01 20:46:54', '2022-12-01 20:46:58'),
(241, 97, 65, 'SPE220019_PRF001', 'update', 'task', 1, '2022-12-01 20:47:10', '2022-12-01 20:47:10'),
(242, 15, 0, 'Loxam', 'add', 'indirect_cli', 1, '2022-12-01 20:50:13', '2022-12-01 20:50:13'),
(243, 98, 0, 'SPE220020', 'add', 'project', 1, '2022-12-01 20:50:59', '2022-12-01 20:50:59'),
(244, 98, 0, 'SPE220020', 'update', 'project', 1, '2022-12-01 20:53:50', '2022-12-01 20:53:50'),
(245, 98, 66, 'SPE220020_PRF001', 'update', 'task', 1, '2022-12-01 20:54:11', '2022-12-01 20:54:11'),
(246, 99, 0, 'SPE220021', 'add', 'project', 1, '2022-12-01 22:03:26', '2022-12-01 22:03:26'),
(247, 99, 0, 'SPE220021', 'update', 'project', 1, '2022-12-01 22:04:08', '2022-12-01 22:05:25'),
(248, 99, 67, 'SPE220021_PRF001', 'update', 'task', 1, '2022-12-01 22:05:45', '2022-12-01 22:05:45'),
(249, 101, 0, 'SPE220022', 'add', 'project', 1, '2022-12-01 22:12:41', '2022-12-01 22:12:41'),
(250, 101, 0, 'SPE220022', 'update', 'project', 1, '2022-12-01 22:13:23', '2022-12-01 22:14:34'),
(251, 101, 68, 'SPE220022_PRF001', 'update', 'task', 1, '2022-12-01 22:13:43', '2022-12-01 22:14:18'),
(252, 102, 0, 'SPE220023', 'add', 'project', 1, '2022-12-01 22:20:08', '2022-12-01 22:20:08'),
(253, 102, 0, 'SPE220023', 'update', 'project', 1, '2022-12-01 22:20:35', '2022-12-01 22:20:47'),
(254, 102, 69, 'SPE220023_PRF001', 'update', 'task', 1, '2022-12-01 22:21:07', '2022-12-01 22:21:07'),
(255, 104, 0, 'SPE220024', 'add', 'project', 1, '2022-12-01 22:42:17', '2022-12-01 22:42:17'),
(256, 104, 0, 'SPE220024', 'update', 'project', 1, '2022-12-01 22:43:02', '2022-12-01 22:43:59'),
(257, 104, 70, 'SPE220024_PRF001', 'update', 'task', 1, '2022-12-01 22:43:49', '2022-12-01 22:43:49'),
(258, 105, 0, 'SPE220025', 'add', 'project', 1, '2022-12-01 23:00:41', '2022-12-01 23:00:41'),
(259, 105, 0, 'SPE220025', 'update', 'project', 1, '2022-12-01 23:01:40', '2022-12-01 23:01:40'),
(260, 105, 71, 'SPE220025_PRF001', 'update', 'task', 1, '2022-12-01 23:01:56', '2022-12-01 23:01:56'),
(261, 106, 0, 'SPE22,SPE_0005', 'add', 'project', 1, '2022-12-02 14:28:29', '2022-12-02 14:28:29'),
(262, 106, 0, 'SPE22,SPE_0005', 'update', 'project', 1, '2022-12-02 14:29:35', '2022-12-02 14:29:48'),
(263, 106, 72, 'SPE22,SPE_0005_PRF001', 'update', 'task', 1, '2022-12-02 14:29:59', '2022-12-02 14:29:59'),
(264, 107, 0, 'SPE220026', 'add', 'project', 1, '2022-12-02 14:36:22', '2022-12-02 14:36:22'),
(265, 107, 0, 'SPE220026', 'update', 'project', 1, '2022-12-02 14:37:25', '2022-12-02 14:37:25'),
(266, 107, 73, 'SPE220026_PRF001', 'update', 'task', 1, '2022-12-02 14:38:00', '2022-12-02 14:38:00'),
(267, 108, 0, 'SPE220027', 'add', 'project', 1, '2022-12-02 14:46:05', '2022-12-02 14:46:05'),
(268, 108, 0, 'SPE220027', 'update', 'project', 1, '2022-12-02 14:47:14', '2022-12-02 14:47:14'),
(269, 108, 74, 'SPE220027_PRF001', 'update', 'task', 1, '2022-12-02 14:47:25', '2022-12-02 14:47:25'),
(270, 16, 0, 'D&G (Dolce Gabbana)', 'add', 'indirect_cli', 1, '2022-12-02 14:51:29', '2022-12-02 14:51:29'),
(271, 109, 0, 'SPE220028', 'add', 'project', 1, '2022-12-02 14:53:38', '2022-12-02 14:53:38'),
(272, 109, 0, 'SPE220028', 'update', 'project', 1, '2022-12-02 14:54:36', '2022-12-02 15:37:03'),
(273, 109, 75, 'SPE220028_TRA001', 'update', 'task', 1, '2022-12-02 14:54:47', '2022-12-02 14:54:47'),
(274, 41, 76, 'KNH160010_PRF007', 'delete', 'task', 1, '2022-12-04 00:44:03', '2022-12-04 00:44:03'),
(275, 110, 0, 'SPE22,SPE_0006', 'add', 'project', 1, '2022-12-04 02:38:13', '2022-12-04 02:38:13'),
(276, 41, 79, 'KNH160010_FED009', 'delete', 'task', 7, '2022-12-04 23:18:18', '2022-12-04 23:18:18'),
(277, 41, 80, 'KNH160010_TRA010', 'update', 'task', 7, '2022-12-04 23:18:41', '2022-12-04 23:18:41'),
(278, 13, 0, '', 'delete', 'direct_cli', 1, '2022-12-05 15:19:42', '2022-12-05 15:19:42'),
(279, 17, 0, 'Fasttranslator', 'add', 'direct_cli', 1, '2022-12-05 20:42:24', '2022-12-05 20:42:24'),
(280, 17, 0, 'Fasttranslator', 'update', 'direct_cli', 1, '2022-12-05 20:42:59', '2022-12-05 20:42:59'),
(281, 17, 0, '', 'create', 'direct_cli', 1, '2022-12-05 20:44:06', '2022-12-05 20:44:06'),
(282, 111, 0, 'SPEU_0002', 'add', 'project', 1, '2022-12-05 20:45:52', '2022-12-05 20:45:52'),
(283, 111, 0, 'SPEU_0002', 'update', 'project', 1, '2022-12-05 20:47:07', '2022-12-05 20:47:53'),
(284, 111, 81, 'SPEU_0002_TRA001', 'update', 'task', 1, '2022-12-05 20:47:40', '2022-12-05 20:47:40'),
(285, 17, 0, 'Pierre Fabre', 'add', 'indirect_cli', 1, '2022-12-05 20:57:46', '2022-12-05 20:57:46'),
(286, 112, 0, 'SPEU_0003', 'add', 'project', 1, '2022-12-05 20:59:27', '2022-12-05 20:59:27'),
(287, 112, 0, 'SPEU_0003', 'update', 'project', 1, '2022-12-05 21:00:00', '2022-12-05 21:23:23'),
(288, 112, 82, 'SPEU_0003_TRA001', 'update', 'task', 1, '2022-12-05 21:23:47', '2022-12-05 21:23:47'),
(289, 113, 0, 'SPEU_0004', 'add', 'project', 1, '2022-12-05 21:25:41', '2022-12-05 21:25:41'),
(290, 113, 0, 'SPEU_0004', 'update', 'project', 1, '2022-12-05 21:26:40', '2022-12-05 21:26:48'),
(291, 113, 83, 'SPEU_0004_PRF001', 'update', 'task', 1, '2022-12-05 21:27:10', '2022-12-05 21:27:10'),
(292, 114, 0, 'SPE_0007', 'add', 'project', 1, '2022-12-05 21:29:03', '2022-12-05 21:29:03'),
(293, 114, 0, 'SPE_0007', 'update', 'project', 1, '2022-12-05 21:29:49', '2022-12-05 21:30:45'),
(294, 114, 84, 'SPE_0007_TRA001', 'update', 'task', 1, '2022-12-05 21:31:02', '2022-12-05 21:31:02'),
(295, 14, 0, 'Solveig T. Sandaas', 'update', 'internal_res', 1, '2022-12-05 21:41:50', '2022-12-05 21:44:46'),
(296, 20, 3, 'KNH160005_BAD001', 'delete', 'task', 1, '2022-12-06 10:14:26', '2022-12-06 10:14:26'),
(297, 41, 78, 'KNH160010_PRF008', 'delete', 'task', 1, '2022-12-06 10:15:29', '2022-12-06 10:15:29'),
(298, 41, 77, 'KNH160010_TRA007', 'delete', 'task', 1, '2022-12-06 10:15:39', '2022-12-06 10:15:39'),
(299, 41, 80, 'KNH160010_TRA010', 'delete', 'task', 1, '2022-12-06 10:15:51', '2022-12-06 10:15:51'),
(300, 41, 52, 'KNH160010_TRA006', 'delete', 'task', 1, '2022-12-06 10:16:00', '2022-12-06 10:16:00'),
(301, 41, 50, 'KNH160010_QAA005', 'delete', 'task', 1, '2022-12-06 10:16:10', '2022-12-06 10:16:10'),
(302, 41, 49, 'KNH160010_TRA004', 'delete', 'task', 1, '2022-12-06 10:16:18', '2022-12-06 10:16:18'),
(303, 41, 48, 'KNH160010_QAA003', 'delete', 'task', 1, '2022-12-06 10:16:26', '2022-12-06 10:16:26'),
(304, 41, 46, 'KNH160010_DTP002', 'delete', 'task', 1, '2022-12-06 10:16:33', '2022-12-06 10:16:33'),
(305, 41, 15, 'KNH160010_BAD001', 'delete', 'task', 1, '2022-12-06 10:16:39', '2022-12-06 10:16:39'),
(306, 57, 35, 'KNH160012_SEO001', 'delete', 'task', 1, '2022-12-06 10:17:40', '2022-12-06 10:17:40'),
(307, 80, 51, 'KNH160015_BAD001', 'delete', 'task', 1, '2022-12-06 10:20:44', '2022-12-06 10:20:44'),
(308, 66, 42, 'KNH160013_TRA002', 'delete', 'task', 1, '2022-12-06 10:21:40', '2022-12-06 10:21:40'),
(309, 66, 41, 'KNH160013_TRA001', 'delete', 'task', 1, '2022-12-06 10:21:45', '2022-12-06 10:21:45'),
(310, 43, 17, 'KNH160011_TRA001', 'delete', 'task', 1, '2022-12-06 10:28:36', '2022-12-06 10:28:36'),
(311, 36, 12, 'KNH160007_TRA002', 'delete', 'task', 1, '2022-12-06 10:29:42', '2022-12-06 10:29:42'),
(312, 36, 11, 'KNH160007_TRA001', 'delete', 'task', 1, '2022-12-06 10:29:47', '2022-12-06 10:29:47'),
(313, 12, 2, 'KNH160004_COP001', 'delete', 'task', 1, '2022-12-06 10:33:22', '2022-12-06 10:33:22'),
(314, 12, 47, 'KNH160004_QAA002', 'delete', 'task', 1, '2022-12-06 10:33:28', '2022-12-06 10:33:28'),
(315, 116, 0, 'SPE_0008', 'add', 'project', 14, '2022-12-06 17:29:20', '2022-12-06 17:29:20'),
(316, 116, 0, 'SPE_0008', 'update', 'project', 14, '2022-12-06 17:31:59', '2022-12-06 17:38:40'),
(317, 116, 85, 'SPE_0008_TRA001', 'update', 'task', 14, '2022-12-06 17:32:55', '2022-12-06 17:32:55'),
(318, 117, 0, 'SPE_0009', 'add', 'project', 14, '2022-12-06 17:40:43', '2022-12-06 17:40:43'),
(319, 117, 0, 'SPE_0009', 'update', 'project', 14, '2022-12-06 17:41:21', '2022-12-06 17:41:21'),
(320, 117, 86, 'SPE_0009_TRA001', 'update', 'task', 14, '2022-12-06 17:41:46', '2022-12-06 17:41:46'),
(321, 113, 0, 'SPEU_0004', 'update', 'project', 14, '2022-12-06 17:50:37', '2022-12-06 17:50:38'),
(322, 118, 0, 'SPEU_0005', 'add', 'project', 14, '2022-12-07 21:18:49', '2022-12-07 21:18:49'),
(323, 118, 0, 'SPEU_0005', 'update', 'project', 14, '2022-12-07 21:19:36', '2022-12-07 21:19:36'),
(324, 118, 87, 'SPEU_0005_TRA001', 'update', 'task', 14, '2022-12-07 21:20:00', '2022-12-07 21:20:00'),
(325, 18, 0, 'Supertext AG', 'add', 'direct_cli', 14, '2022-12-07 21:22:23', '2022-12-07 21:22:23'),
(326, 18, 0, 'Supertext AG', 'update', 'direct_cli', 14, '2022-12-07 21:22:50', '2022-12-07 21:22:50'),
(327, 18, 0, 'Twitch Interactive', 'add', 'indirect_cli', 14, '2022-12-07 21:24:35', '2022-12-07 21:24:35'),
(328, 120, 0, 'SPEU_0006', 'add', 'project', 14, '2022-12-07 21:25:22', '2022-12-07 21:25:22'),
(329, 120, 0, 'SPEU_0006', 'update', 'project', 14, '2022-12-07 21:26:05', '2022-12-07 21:26:05'),
(330, 120, 88, 'SPEU_0006_PRF001', 'update', 'task', 14, '2022-12-07 21:26:27', '2022-12-07 21:26:27'),
(331, 5, 0, 'Solveig Sandaas', 'delete', 'internal_res', 7, '2022-12-08 16:13:49', '2022-12-08 16:13:49'),
(332, 15, 0, 'Solveig_Sandaas', 'delete', 'internal_res', 7, '2022-12-08 16:13:59', '2022-12-08 16:13:59'),
(333, 17, 0, 'Vivek_Kan', 'delete', 'internal_res', 7, '2022-12-08 16:14:08', '2022-12-08 16:14:08'),
(334, 125, 0, 'SPE_0010', 'add', 'project', 14, '2022-12-12 17:39:39', '2022-12-12 17:39:39'),
(335, 125, 0, 'SPE_0010', 'update', 'project', 14, '2022-12-12 17:42:26', '2022-12-12 17:42:43'),
(336, 125, 89, 'SPE_0010_PRF001', 'update', 'task', 14, '2022-12-12 17:43:05', '2022-12-12 17:43:05'),
(337, 19, 0, 'Tesla', 'add', 'indirect_cli', 14, '2022-12-12 17:45:05', '2022-12-12 17:45:05'),
(338, 126, 0, 'SPE_0011', 'add', 'project', 14, '2022-12-12 17:46:06', '2022-12-12 17:46:06'),
(339, 126, 0, 'SPE_0011', 'update', 'project', 14, '2022-12-12 17:50:50', '2022-12-12 17:51:28'),
(340, 126, 90, 'SPE_0011_TRA001', 'update', 'task', 14, '2022-12-12 17:51:51', '2022-12-12 17:51:51'),
(341, 127, 0, 'SPE_0012', 'add', 'project', 14, '2022-12-12 17:54:41', '2022-12-12 17:54:41'),
(342, 127, 0, 'SPE_0012', 'update', 'project', 14, '2022-12-12 17:56:23', '2022-12-12 17:56:23'),
(343, 127, 91, 'SPE_0012_TRA001', 'update', 'task', 14, '2022-12-12 17:58:14', '2022-12-12 17:58:14'),
(344, 128, 0, 'SPEU_0007', 'add', 'project', 14, '2022-12-12 17:59:51', '2022-12-12 17:59:51'),
(345, 128, 0, 'SPEU_0007', 'update', 'project', 14, '2022-12-12 18:00:43', '2022-12-12 18:00:43'),
(346, 128, 92, 'SPEU_0007_PRF001', 'update', 'task', 14, '2022-12-12 18:01:03', '2022-12-12 18:01:03'),
(347, 129, 0, 'SPE_0013', 'add', 'project', 14, '2022-12-12 18:02:45', '2022-12-12 18:02:45'),
(348, 129, 0, 'SPE_0013', 'update', 'project', 14, '2022-12-12 18:04:13', '2022-12-12 18:04:13'),
(349, 129, 93, 'SPE_0013_TRA001', 'update', 'task', 14, '2022-12-12 18:04:30', '2022-12-12 18:04:30');

-- --------------------------------------------------------

--
-- Table structure for table `tms_mail_format`
--

CREATE TABLE `tms_mail_format` (
  `mail_id` int(11) NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `placeholder` varchar(200) NOT NULL,
  `is_active` varchar(2) CHARACTER SET latin1 NOT NULL,
  `created_by` double NOT NULL,
  `modified_by` double NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tms_mail_format`
--

INSERT INTO `tms_mail_format` (`mail_id`, `name`, `description`, `subject`, `message`, `placeholder`, `is_active`, `created_by`, `modified_by`, `created_date`, `modified_date`) VALUES
(1, 'REGISTRATION', 'Registration at COMPANY_NAME', 'Thank you for choosing to subscribe to COMPANY_NAME', 'Dear FIRST_NAME LAST_NAME,<br><br>Thank you for choosing to subscribe to COMPANY_NAME!<br><br>Please use following information to log in to the system.<br><br>Username : EMAIL<br>\nPassword : PASSWORD<br><br>\nPlease <a href=\"LINK_FORWARD\" target=\"_blank\" rel=\"nofollow\">click Here</a> to login.\n<br><br>Kind regards,\n<br><br>\n Noel Wilson <br>\n General Manager <br>\n Ph: (02) 80034451 <br>\nadmin@checkthemplease.com.au <br>\nwww.checkthemplease.com.au <br>\n', 'FIRST_NAME,LAST_NAME,EMAIL,PASSWORD,PHONE,COMPANY_NAME,LINK_FORWARD', '1', 1, 1, '2014-07-17 00:00:00', '2014-08-07 00:00:00'),
(2, ' LINK_FORWARD', 'Reset Password', 'Reset Password', '<html><body><table width=\'100%\' bgcolor=\'#e0e0e0\' cellpadding=\'0\' cellspacing=\'0\' border=\'0\'>\n     \n     <tr>\n     <td>\n     \n     <table align=\'center\' width=\'100%\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' style=\'max-width:650px; background-color:#fff; font-family:Verdana, Geneva, sans-serif;\'>\n      \n     <thead>\n        <tr height=\'80\'>\n         <th colspan=\'4\' style=\'background-color:#cbff84; border-bottom:solid 1px #bdbdbd; font-family:Verdana, Geneva, sans-serif; color:#333; font-size:34px;\' ><img src=\"http://103.239.146.251:898/tms/assets/img/BeConnected_Logo.gif\" width=\"500\"></th>\n        </tr>\n        </thead>\n      \n     <tbody>\n       <tr>\n         <td colspan=\'4\' style=\'padding:15px;\'>\n          <p style=\'font-size:20px;\'>Hi USERNAME,</p>\n          <hr />\n          Your password has been sucessfully reseted. <br />Please Use below \n\ncredential to Login <br />\nemail : EMAIL<br/>\nPassword : PASSWORD\n<br />\n<br /><br>Kind regards, <br>\n TMS Team <br>\n         </td>\n        </tr>\n        <tr height=\'80\'>\n         <td colspan=\'4\' align=\'center\' style=\'background-color:#cbff84; border-top:dashed #00a2d1 2px; font-size:24px; \'>\n         <label>\n         Translation Management System\n         </label>\n         </td>\n        </tr>\n        </tbody>\n      \n     </table>\n     \n     </td></tr>\n     </table>\n     \n     </body></html>', 'USERNAME,EMAIL,PASSWORD', '1', 1, 1, '2014-07-17 00:00:00', '2014-08-26 00:00:00'),
(3, ' LINK_FORWARD', 'resend Link', 'Applicant Feedback Form', 'Hi FIRST_NAME LAST_NAME,<br /><br/>We know you are very busy. This is just a friendly reminder.  Could you please assist the Job  <br />Applicant by clicking on the link below & completing the survey? It is designed to be very quick and <br />only takes about 1 to 2 minutes to complete<br /><a href=\"LINK_FORWARD\" target=\"_blank\" rel=\"nofollow\">click it</a> <br /><br />Kind regards,<br /><br />Noel Wilson<br />General Manager<br />Ph: (02) 80034451<br /><a href=\"noel@checkthemplease.com.au\">noel@checkthemplease.com.au</a><br /><a href=\"www.checkthemplease.com.au\">www.checkthemplease.com.au</a><br />', 'LINK_FORWARD,FIRST_NAME,LAST_NAME', '1', 1, 1, '2014-07-17 00:00:00', '2014-08-26 00:00:00'),
(4, 'REGISTRATION_EFT', 'This format will be used when company register through EFT Patment', 'Thank you for choosing to subscribe to COMPANY_NAME', 'Dear FIRST_NAME LAST_NAME,<br><br>Thank you for choosing to subscribe to COMPANY_NAME!<br><br>Here are the <b>next steps</b> to complete your purchase and to start setting up your complex:<br><br><ol><li>Make the payment of <b>R </b>TOTAL_AMOUNT\ninto our bank account.<br><br>Bank:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FIRST\nNATIONAL BANK&nbsp;<br>Account\nName: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;IAM BUSINESS\nMANAGEMENT <br>CONCEPTS\n\nAccount\nNumber: &nbsp; &nbsp; 62420305543\n\n<br>Branch: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Greenstone\n\n<br>Branch\nCode: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 00201510\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>&nbsp;&nbsp;\n<br>*Reference: <i>Please use the complex name you registered\nas the transaction reference.<br><br></i></li><li><span>As soon as we pick up the payment on our bank statement, we will initiate your account.<br></span></li><li><span>As soon as your account has been initiated, we will send you an eMail with the necessary login details as well as instructions on how to setup your complex.<br></span></li></ol>You can then setup your complex and enjoy all the benefits of&nbsp;COMPANY_NAME!<br><br>Regards,<br>COMPANY_NAME<br>', 'FIRST_NAME,LAST_NAME,COMPANY_NAME,TOTAL_AMOUNT', '1', 1, 1, '2014-07-17 00:00:00', '2014-07-31 00:00:00'),
(5, 'NEW_REFEREE', 'New Referee Submited', 'An applicant has just submitted a reference for your approval', 'Dear FIRST_NAME LAST_NAME,<br>An applicant has just submitted a reference. Can you please login & approve by selecting the survey type relevant to the position & payment method? <br><br>\n<a href=\"LINK_FORWARD\" target=\"_blank\" rel=\"nofollow\">click Here</a> <br /><br>\nRegards,\n<br/><br>\n<b>Check Them Please<b><br>\nPh: (02) 80034451<br> \nadmin@checkthemplease.com.au<br>\nwww.checkthemplease.com.au<br>\n', 'FIRST_NAME,LAST_NAME,LINK_FORWARD', '1', 1, 1, '2014-07-17 00:00:00', '2014-08-26 00:00:00'),
(6, ' OWNER_COMPLAINTS', 'Change Owner of Complaint', 'Change Owner of Complaint', 'Dear FIRST_NAME LAST_NAME,<br>&nbsp;You have been assigned as a owner of Complaint&nbsp;COMPLAINT_NUMBER<br>&nbsp;&nbsp;<br>', 'FIRST_NAME,LAST_NAME,COMPANY_NAME,COMPLAINT_NUMBER', '1', 1, 1, '2014-07-17 00:00:00', '2014-08-26 00:00:00'),
(7, 'ESCALATE_COMPLAINTS', 'Escalate Complaint', 'Escalate Complaint', 'Dear FIRST_NAME LAST_NAME,<br>&nbsp;Complaint &nbsp;COMPLAINT_NUMBER has been escalated &nbsp;to &nbsp;you<br>&nbsp;&nbsp;<br>', 'FIRST_NAME,LAST_NAME,COMPANY_NAME,COMPLAINT_NUMBER', '1', 1, 1, '2014-07-17 00:00:00', '2014-08-27 00:00:00'),
(8, 'Referee Check Completed', 'Referee Check Completed', 'Referee Check Completed', 'To FIRST_NAME LAST_NAME,<br><br>\nPlease find attached a completed reference report for one of your applicants. Please remember you can contact the referee (s) for further clarification should you require it.\n<br><br>\nRegards,\n<br><br>\n<b>\nCheck Them Please<b><br>\nPh: (02) 80034451<br>\nadmin@checkthemplease.com.au<br>\nwww.checkthemplease.com.au\n', 'FIRST_NAME,LAST_NAME', '1', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tms_master_price`
--

CREATE TABLE `tms_master_price` (
  `master_price_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1' COMMENT 'active="1",inactive="0"',
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_master_price`
--

INSERT INTO `tms_master_price` (`master_price_id`, `name`, `code`, `is_active`, `created_date`, `updated_date`) VALUES
(1, 'Translation', 'TRA', 1, '2021-11-24 12:50:40', '2022-12-04 01:05:53'),
(2, 'Proofreading', 'PRF', 1, '2021-11-24 12:51:24', '2021-11-24 13:10:33'),
(4, 'Desktop Publishing', 'DTP', 1, '2021-11-24 12:52:26', '2021-11-24 13:08:57'),
(5, 'Machine Translation Post-Editing', 'MTP', 1, '2021-11-24 12:52:45', '2022-12-04 01:27:20'),
(7, 'Search Engine Optimization', 'SEO', 1, '2021-11-24 12:53:30', '2021-11-24 13:08:27'),
(8, 'Subtitling', 'SUB', 1, '2021-11-24 12:54:05', '2021-11-24 13:08:14'),
(9, 'Translation & Proofreading', 'TEP', 1, '2021-11-24 12:54:29', '2022-12-04 01:28:41'),
(10, 'Transcreation', 'TRC', 1, '2021-11-24 12:56:03', '2021-11-24 13:07:43'),
(11, 'Testing', 'TES', 1, '2021-11-24 12:56:36', '2021-11-24 13:07:29'),
(12, 'Linguistic Quality Assurance', 'LQA', 1, '2021-11-24 12:57:30', '2022-12-04 01:28:00'),
(14, 'Linguistic Sign-Off', 'LSO', 1, '2022-08-25 22:23:41', '2022-12-04 01:27:36'),
(16, 'Cognitive Debriefing', 'COG', 1, '2022-12-04 01:29:06', '2022-12-04 01:29:06'),
(17, 'Reconciliation', 'REC', 1, '2022-12-04 01:29:19', '2022-12-04 01:29:19'),
(18, 'Migration', 'MIG', 1, '2022-12-04 01:29:27', '2022-12-04 01:29:27'),
(19, 'Screenshot Review', 'SSR', 1, '2022-12-04 01:29:35', '2022-12-04 01:29:35'),
(20, 'Transcription', 'TRS', 1, '2022-12-04 01:29:54', '2022-12-04 01:29:54'),
(21, 'Test Review', 'TER', 1, '2022-12-04 01:30:08', '2022-12-04 01:30:08'),
(22, 'Term & Style Guide Creation', 'TSC', 1, '2022-12-04 01:30:30', '2022-12-04 01:30:30');

-- --------------------------------------------------------

--
-- Table structure for table `tms_new_job`
--

CREATE TABLE `tms_new_job` (
  `new_job_id` int(11) NOT NULL,
  `job_chain_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `new_job_number` varchar(255) NOT NULL,
  `jobs` varchar(255) NOT NULL,
  `job_code` varchar(255) NOT NULL,
  `insert_job` varchar(255) NOT NULL,
  `insert_job_chain` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_new_job`
--

INSERT INTO `tms_new_job` (`new_job_id`, `job_chain_id`, `job_id`, `new_job_number`, `jobs`, `job_code`, `insert_job`, `insert_job_chain`, `created_date`, `updated_date`) VALUES
(4, 17, 7, '1', 'Search Engine Optimization', 'SEO', '', '', '2019-01-02 19:16:18', '2019-01-02 19:16:18'),
(5, 17, 3, '2', 'Desktop Publishing', 'DTP', '', '', '2019-01-10 18:33:36', '2019-01-10 18:33:36'),
(6, 17, 7, '3', 'Search Engine Optimization', 'SEO', '', '', '2019-01-10 18:39:56', '2019-01-10 18:39:56'),
(7, 17, 4, '4', 'Delivery to client', 'DTC', '', '', '2019-01-10 18:40:27', '2019-01-10 18:40:27'),
(8, 17, 4, '5', 'Delivery to client', 'DTC', '', '', '2019-01-10 19:00:18', '2019-01-10 19:00:18'),
(12, 22, 11, '1', 'Quaity Assurance', 'QAA', '', '', '2022-11-08 15:18:20', '2022-11-08 15:18:20'),
(13, 22, 9, '1', 'Translation', 'TRA', '', '', '2022-11-08 15:18:25', '2022-11-08 15:18:25'),
(14, 22, 7, '1', 'Search Engine Optimization', 'SEO', '', '', '2022-11-08 15:18:29', '2022-11-08 15:18:29'),
(16, 26, 9, '1', 'Translation', 'TRA', '', '', '2022-12-04 00:43:12', '2022-12-04 00:43:12'),
(17, 26, 10, '1', 'Proofreading', 'PRF', '', '', '2022-12-04 00:43:18', '2022-12-04 00:43:18');

-- --------------------------------------------------------

--
-- Table structure for table `tms_order`
--

CREATE TABLE `tms_order` (
  `order_id` int(11) NOT NULL,
  `order_number` int(11) NOT NULL,
  `abbrivation` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `project_status` enum('Approved','Reject','Send','','Save','Cancel') DEFAULT '' COMMENT '''Approved=1'',''Reject=2'',''Send=3'',''Save=4'',''Cancel=5''',
  `edited_by` int(11) NOT NULL,
  `edited_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_order`
--

INSERT INTO `tms_order` (`order_id`, `order_number`, `abbrivation`, `currency`, `project_status`, `edited_by`, `edited_id`, `created_date`, `modified_date`) VALUES
(3, 1, 'KNH16', '', '', 1, 1, '2022-11-01 14:17:12', '2022-11-01 00:00:00'),
(10, 2, 'KNH16', '', '', 0, 0, '2022-11-03 10:27:40', '2022-11-03 10:28:30'),
(11, 3, 'KNH16', '', '', 0, 0, '2022-11-03 10:33:26', '2022-11-03 10:34:20'),
(12, 4, 'KNH16', '', '', 1, 1, '2022-11-03 10:46:09', '2022-11-03 00:00:00'),
(20, 5, 'KNH16', '', '', 1, 1, '2022-11-03 18:06:47', '2022-11-04 00:00:00'),
(21, 6, 'KNH16', '', '', 0, 0, '2022-11-03 18:10:36', '2022-11-03 18:11:02'),
(24, 1, 'SPE22', '', '', 0, 0, '2022-11-03 21:00:38', '2022-11-03 21:02:45'),
(25, 2, 'SPE22', '', '', 1, 1, '2022-11-03 21:10:14', '2022-11-04 00:00:00'),
(27, 3, 'SPE22', '', '', 1, 1, '2022-11-03 21:57:01', '2022-11-03 00:00:00'),
(29, 4, 'SPE22', '', '', 1, 1, '2022-11-04 16:27:11', '2022-11-04 00:00:00'),
(31, 5, 'SPE22', '', '', 1, 1, '2022-11-04 16:39:46', '2022-11-17 00:00:00'),
(33, 6, 'SPE22', '', '', 1, 1, '2022-11-04 16:48:04', '2022-11-04 00:00:00'),
(36, 7, 'KNH16', '', '', 1, 1, '2022-11-07 15:19:14', '2022-11-07 00:00:00'),
(37, 7, 'SPE22', '', '', 0, 0, '2022-11-08 13:42:50', '2022-11-08 13:44:35'),
(38, 8, 'SPE22', '', '', 1, 1, '2022-11-08 13:48:10', '2022-12-01 00:00:00'),
(39, 8, 'KNH16', '', '', 0, 0, '2022-11-08 14:32:24', '2022-11-08 14:37:24'),
(40, 9, 'KNH16', '', '', 0, 0, '2022-11-08 14:44:27', '2022-11-08 14:44:55'),
(41, 10, 'KNH16', '', '', 1, 1, '2022-11-08 15:07:37', '2022-11-08 00:00:00'),
(43, 11, 'KNH16', '', '', 1, 1, '2022-11-08 17:06:00', '2022-11-09 00:00:00'),
(46, 9, 'SPE22', '', '', 1, 1, '2022-11-08 18:02:41', '2022-11-08 00:00:00'),
(49, 10, 'SPE22', '', '', 1, 1, '2022-11-10 16:00:06', '2022-12-01 00:00:00'),
(51, 11, 'SPE22', '', '', 1, 1, '2022-11-10 16:36:01', '2022-11-16 00:00:00'),
(55, 1, 'SPEU_', '', '', 7, 1, '2022-11-11 16:21:46', '2022-11-11 00:00:00'),
(56, 12, 'SPE22', '', '', 1, 1, '2022-11-11 21:00:08', '2022-12-06 00:00:00'),
(57, 12, 'KNH16', '', '', 1, 1, '2022-11-14 14:25:29', '2022-11-18 00:00:00'),
(59, 13, 'SPE22', '', '', 0, 0, '2022-11-16 16:25:40', '2022-11-16 16:27:00'),
(61, 14, 'SPE22', '', '', 1, 1, '2022-11-16 16:33:49', '2022-11-21 00:00:00'),
(62, 1, 'SPE_', '', '', 1, 1, '2022-11-16 16:49:45', '2022-11-21 00:00:00'),
(63, 2, 'SPE_', '', '', 1, 1, '2022-11-16 17:00:20', '2022-11-21 00:00:00'),
(64, 15, 'SPE22', '', '', 0, 0, '2022-11-16 17:05:02', '2022-11-16 17:05:58'),
(66, 13, 'KNH16', '', '', 7, 1, '2022-11-16 20:52:20', '2022-11-17 00:00:00'),
(67, 14, 'KNH16', '', '', 1, 1, '2022-11-16 20:59:58', '2022-12-06 00:00:00'),
(72, 3, 'SPE_', '', '', 1, 1, '2022-11-18 00:45:42', '2022-11-21 00:00:00'),
(74, 16, 'SPE22', '', '', 1, 1, '2022-11-18 23:51:16', '2022-12-02 00:00:00'),
(76, 17, 'SPE22', '', '', 0, 0, '2022-11-18 23:56:42', '2022-11-18 23:57:30'),
(80, 15, 'KNH16', '', '', 1, 1, '2022-11-24 15:02:49', '2022-11-24 00:00:00'),
(83, 1, 'SPE_', '', '', 1, 1, '2022-12-01 15:59:45', '2022-12-01 00:00:00'),
(84, 2, 'SPE_', '', '', 1, 1, '2022-12-01 16:08:35', '2022-12-01 00:00:00'),
(86, 4, 'SPE_', '', '', 0, 0, '2022-12-01 16:27:33', '2022-12-01 16:28:38'),
(87, 5, 'SPE_', '', '', 0, 0, '2022-12-01 17:12:53', '2022-12-01 17:14:43'),
(88, 3, 'SPE_', '', '', 7, 1, '2022-12-01 17:47:30', '2022-12-04 00:00:00'),
(89, 6, 'SPE_', '', '', 0, 0, '2022-12-01 18:06:43', '2022-12-01 18:07:37'),
(91, 7, 'SPE_', '', '', 1, 1, '2022-12-01 19:17:23', '2022-12-01 00:00:00'),
(92, 8, 'SPE_', '', '', 0, 0, '2022-12-01 19:46:52', '2022-12-01 19:47:42'),
(93, 9, 'SPE_', '', '', 1, 1, '2022-12-01 20:04:21', '2022-12-01 00:00:00'),
(94, 10, 'SPE_', '', '', 1, 1, '2022-12-01 20:15:24', '2022-12-01 00:00:00'),
(95, 4, 'SPE_', '', '', 0, 0, '2022-12-01 20:23:55', '2022-12-01 20:25:23'),
(96, 18, 'SPE22', '', '', 0, 0, '2022-12-01 20:40:17', '2022-12-01 20:40:59'),
(97, 19, 'SPE22', '', '', 0, 0, '2022-12-01 20:45:20', '2022-12-01 20:46:05'),
(98, 20, 'SPE22', '', '', 0, 0, '2022-12-01 20:50:22', '2022-12-01 20:50:59'),
(99, 21, 'SPE22', '', '', 0, 0, '2022-12-01 22:02:15', '2022-12-01 22:03:26'),
(101, 22, 'SPE22', '', '', 0, 0, '2022-12-01 22:11:56', '2022-12-01 22:12:41'),
(102, 23, 'SPE22', '', '', 0, 0, '2022-12-01 22:18:19', '2022-12-01 22:20:08'),
(104, 24, 'SPE22', '', '', 0, 0, '2022-12-01 22:41:20', '2022-12-01 22:42:17'),
(105, 25, 'SPE22', '', '', 0, 0, '2022-12-01 22:59:49', '2022-12-01 23:00:41'),
(106, 5, 'SPE_', '', '', 0, 0, '2022-12-02 14:27:17', '2022-12-02 14:28:29'),
(107, 26, 'SPE22', '', '', 0, 0, '2022-12-02 14:35:08', '2022-12-02 14:36:22'),
(108, 27, 'SPE22', '', '', 1, 1, '2022-12-02 14:44:59', '2022-12-09 00:00:00'),
(109, 28, 'SPE22', '', '', 1, 1, '2022-12-02 14:52:33', '2022-12-02 00:00:00'),
(110, 6, 'SPE_', '', '', 0, 0, '2022-12-04 02:37:56', '2022-12-04 02:38:13'),
(111, 2, 'SPEU_', '', '', 0, 0, '2022-12-05 20:44:18', '2022-12-05 20:45:53'),
(112, 3, 'SPEU_', '', '', 1, 1, '2022-12-05 20:58:32', '2022-12-05 00:00:00'),
(113, 4, 'SPEU_', '', '', 14, 1, '2022-12-05 21:25:00', '2022-12-06 00:00:00'),
(114, 7, 'SPE_', '', '', 0, 0, '2022-12-05 21:27:51', '2022-12-05 21:29:03'),
(116, 8, 'SPE_', '', '', 0, 0, '2022-12-06 17:28:28', '2022-12-06 17:29:20'),
(117, 9, 'SPE_', '', '', 0, 0, '2022-12-06 17:39:33', '2022-12-06 17:40:43'),
(118, 5, 'SPEU_', '', '', 0, 0, '2022-12-07 21:17:59', '2022-12-07 21:18:49'),
(120, 6, 'SPEU_', '', '', 0, 0, '2022-12-07 21:24:39', '2022-12-07 21:25:22'),
(125, 10, 'SPE_', '', '', 0, 0, '2022-12-12 17:38:23', '2022-12-12 17:39:39'),
(126, 11, 'SPE_', '', '', 0, 0, '2022-12-12 17:45:11', '2022-12-12 17:46:06'),
(127, 12, 'SPE_', '', '', 0, 0, '2022-12-12 17:52:20', '2022-12-12 17:54:41'),
(128, 7, 'SPEU_', '', '', 0, 0, '2022-12-12 17:59:00', '2022-12-12 17:59:51'),
(129, 13, 'SPE_', '', '', 0, 0, '2022-12-12 18:01:25', '2022-12-12 18:02:45');

-- --------------------------------------------------------

--
-- Table structure for table `tms_passwordreset_tbl`
--

CREATE TABLE `tms_passwordreset_tbl` (
  `id` int(11) NOT NULL,
  `iUserId` int(11) NOT NULL,
  `reset_password_token` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tms_payment`
--

CREATE TABLE `tms_payment` (
  `iPaymentId` int(11) NOT NULL,
  `iUserId` int(11) NOT NULL,
  `iClientId` int(11) NOT NULL,
  `iType` int(11) NOT NULL COMMENT '1=user,2=client',
  `vPaymentInfo` text NOT NULL,
  `vBankInfo` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dtCreatedDate` datetime NOT NULL,
  `dtUpdatedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_payment`
--

INSERT INTO `tms_payment` (`iPaymentId`, `iUserId`, `iClientId`, `iType`, `vPaymentInfo`, `vBankInfo`, `dtCreatedDate`, `dtUpdatedDate`) VALUES
(1, 0, 2, 2, '{\"tax_id\":\"B95969887\",\"country_code\":\"B9\"}', '{}', '2022-11-02 18:30:39', '2022-11-11 23:39:08'),
(2, 0, 5, 2, '{\"tax_id\":\"00\",\"country_code\":\"00\"}', '{}', '2022-11-03 20:22:04', '2022-11-03 20:22:04'),
(3, 0, 2, 2, '{\"tax_id\":\"B95969887\",\"country_code\":\"B9\"}', '{}', '2022-11-03 20:57:51', '2022-11-11 23:39:08'),
(4, 0, 6, 2, '{\"tax_id\":\"NO921813201\",\"country_code\":\"NO\"}', '{}', '2022-11-04 11:32:17', '2022-11-04 11:32:17'),
(5, 4, 0, 1, '{\"tax_id\":\"NO911637715\",\"country_code\":\"NO\",\"tax_type\":\"non-taxable\"}', '{\"payment_method\":\"Paypal\",\"paypal_address\":\"yokta@yopmail.com\",\"bank_name\":\"\",\"address\":\"\",\"holder_name\":\"\",\"currency_code\":\"\",\"iban\":\"\",\"bic\":\"\",\"bank_code\":\"\"}', '2022-11-07 17:24:12', '2022-12-06 19:11:59'),
(6, 0, 4, 2, '{\"tax_id\":\"NO813998262\",\"country_code\":\"NO\",\"memos\":\"Test client number\"}', '{}', '2022-11-08 16:34:32', '2022-11-08 16:51:34'),
(7, 0, 4, 2, '{\"country_code\":\"NO\",\"tax_id\":\"NO813998262\"}', '{}', '2022-11-09 10:05:51', '2022-11-09 10:05:51'),
(8, 0, 8, 2, '{\"tax_id\":\"12345678\",\"country_code\":\"12\"}', '{}', '2022-11-10 15:56:02', '2022-11-10 15:56:02'),
(10, 0, 9, 2, '{\"tax_id\":\"HE348535\",\"country_code\":\"HE\",\"memos\":\"5 days after invoice issued.\"}', '{}', '2022-11-11 16:15:16', '2022-11-11 16:15:16'),
(11, 10, 0, 1, '{\"tax_id\":\"NO813998262\",\"country_code\":\"NO\",\"tax_type\":\"EU with VAT\"}', '{\"payment_method\":\"Paypal\",\"paypal_address\":\"Test@yopmail.com\",\"bank_name\":\"\",\"address\":\"\",\"holder_name\":\"\",\"currency_code\":\"\",\"iban\":\"\",\"bic\":\"\",\"bank_code\":\"\"}', '2022-11-11 18:44:49', '2022-11-11 18:44:49'),
(12, 0, 10, 2, '{\"tax_id\":\"123456789\",\"country_code\":\"12\"}', '{}', '2022-11-16 16:48:28', '2022-11-16 16:48:28'),
(13, 0, 11, 2, '{\"tax_id\":\"ITIT01287540445\",\"country_code\":\"IT\"}', '{}', '2022-11-16 16:59:57', '2022-12-01 19:53:53'),
(15, 0, 12, 2, '{\"tax_id\":\"NO930090581\",\"country_code\":\"NO\"}', '{}', '2022-11-18 00:31:22', '2022-11-18 00:31:22'),
(16, 0, 13, 2, '{\"tax_id\":\"NO813998262\",\"country_code\":\"NO\"}', '{}', '2022-11-18 15:55:15', '2022-11-18 15:55:15'),
(17, 18, 0, 1, '{\"tax_id\":\"NO813998262\",\"tax_type\":\"EU with VAT\",\"country_code\":\"NO\"}', '{\"payment_method\":\"Paypal\",\"paypal_address\":\"ayushahm@yopmail.com\",\"bank_name\":\"\",\"address\":\"\",\"holder_name\":\"\",\"currency_code\":\"\",\"iban\":\"\",\"bic\":\"\",\"bank_code\":\"\"}', '2022-11-29 13:11:30', '2022-11-29 13:12:47'),
(18, 0, 14, 2, '{\"tax_id\":\"FIFI24937682\",\"country_code\":\"FI\"}', '{}', '2022-12-01 17:08:08', '2022-12-01 17:08:08'),
(19, 0, 16, 2, '{\"tax_id\":\"ITIT07550840727\",\"country_code\":\"IT\"}', '{}', '2022-12-01 20:03:34', '2022-12-01 20:03:34');

-- --------------------------------------------------------

--
-- Table structure for table `tms_price_list`
--

CREATE TABLE `tms_price_list` (
  `price_listId` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `currancy_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `rate_per_words` int(11) NOT NULL,
  `hourly_rate` int(11) NOT NULL,
  `minimum_rate` int(11) NOT NULL,
  `project_price` int(11) NOT NULL,
  `rush_free` int(11) NOT NULL,
  `tp_no_match` int(11) NOT NULL,
  `proofreading_no_match` int(11) NOT NULL,
  `translation_no_match` int(11) NOT NULL,
  `translation` longtext NOT NULL,
  `proofreading` longtext NOT NULL,
  `tep` longtext NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tms_price_unit`
--

CREATE TABLE `tms_price_unit` (
  `id` int(11) NOT NULL,
  `unit_name` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_price_unit`
--

INSERT INTO `tms_price_unit` (`id`, `unit_name`, `is_active`, `created_date`, `modified_date`) VALUES
(1, 'Characters', 1, '2021-11-24 13:27:29', '2021-11-26 12:05:06'),
(2, 'Days', 0, '2021-11-24 13:27:29', '2021-12-08 13:06:32'),
(3, 'Document', 0, '2021-11-24 13:23:04', '2021-11-26 12:05:22'),
(4, 'Fixed rate', 1, '2021-11-24 13:23:04', '0000-00-00 00:00:00'),
(5, 'Hours', 1, '2021-11-24 13:23:04', '2021-11-24 13:29:13'),
(6, 'Lines', 0, '2021-11-24 13:23:04', '2021-11-26 12:05:32'),
(7, 'Minimum price', 1, '2021-11-24 13:23:04', '2021-11-24 13:29:37'),
(8, 'Minutes', 1, '2021-11-24 13:23:04', '2021-11-24 13:30:48'),
(9, 'Months', 0, '2021-11-24 13:23:04', '2021-11-26 12:05:37'),
(10, 'Pages', 1, '2021-11-24 13:23:04', '2021-11-24 13:31:12'),
(11, 'Paragraphs', 0, '2021-11-24 13:23:04', '2021-11-26 12:05:49'),
(12, 'Segments', 0, '2021-11-24 13:23:04', '2021-11-26 12:05:53'),
(13, 'Percentage', 1, '2021-11-24 13:23:04', '2021-12-08 13:11:03'),
(14, 'Units', 1, '2021-11-24 13:23:04', '2021-11-24 13:32:01'),
(15, 'Words', 1, '2021-11-24 13:23:04', '2021-11-24 13:32:17'),
(16, 'Years', 0, '2021-11-24 13:23:04', '2021-11-26 12:06:08'),
(17, 'Terms', 0, '2021-12-08 13:06:50', '2021-12-08 13:10:58');

-- --------------------------------------------------------

--
-- Table structure for table `tms_project_status`
--

CREATE TABLE `tms_project_status` (
  `pr_status_id` int(11) NOT NULL,
  `project_status_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status_color` varchar(255) NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `default_added` int(11) NOT NULL COMMENT 'Nobady can delete this statuses',
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_project_status`
--

INSERT INTO `tms_project_status` (`pr_status_id`, `project_status_name`, `status_color`, `is_active`, `is_default`, `default_added`, `created_date`, `modified_date`) VALUES
(1, 'In preparation', '', 1, 0, 1, '2017-10-14 15:19:53', '2022-11-03 21:52:06'),
(2, 'Ongoing', '', 1, 0, 1, '2017-10-14 15:20:03', '2022-11-03 21:52:15'),
(3, 'start project', '', 1, 0, 1, '2017-10-14 15:20:13', '2017-11-23 12:54:25'),
(4, 'In Progress', '#FF9719', 1, 1, 1, '2017-10-14 15:20:24', '2018-04-26 14:31:43'),
(5, 'Working', '', 1, 0, 1, '2017-10-14 15:20:30', '2017-11-22 16:32:19'),
(8, 'New', '', 1, 0, 1, '2018-04-18 14:44:43', '2018-04-18 18:05:08'),
(11, 'Delivered', '', 1, 0, 1, '2018-05-10 17:51:38', '2018-05-10 17:51:38'),
(12, 'To be Assigned', '#F9ED1A', 1, 0, 0, '2021-03-01 10:37:52', '2021-03-01 10:37:52'),
(13, 'Ready for delivery', '#008989', 1, 0, 0, '2021-03-01 10:38:12', '2022-11-03 21:53:37'),
(14, 'Ready for QA', '#4848CC', 1, 0, 0, '2021-03-01 10:38:26', '2022-11-03 21:53:22'),
(15, 'To be Delivered', '#8B008B', 1, 0, 0, '2021-03-01 10:38:43', '2021-03-01 10:38:43');

-- --------------------------------------------------------

--
-- Table structure for table `tms_project_type`
--

CREATE TABLE `tms_project_type` (
  `pr_type_id` int(11) NOT NULL,
  `project_name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL,
  `isdefault` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_project_type`
--

INSERT INTO `tms_project_type` (`pr_type_id`, `project_name`, `code`, `is_active`, `isdefault`, `created_date`, `modified_date`) VALUES
(1, 'Translation', 'TRA', 1, 0, '2017-10-14 15:19:11', '2021-07-22 14:01:09'),
(5, 'Proofreading', 'PRF', 1, 0, '2021-07-22 14:00:58', '2021-07-22 14:00:58'),
(6, 'Translation + proofreading', 'TEP', 1, 0, '2021-07-22 14:01:17', '2022-11-03 21:50:46'),
(7, 'Update', 'UPD', 1, 0, '2021-07-22 14:01:29', '2022-12-12 18:08:38'),
(9, 'Machine translation post editing', 'MTP', 1, 0, '2022-12-01 19:21:06', '2022-12-01 19:21:06');

-- --------------------------------------------------------

--
-- Table structure for table `tms_proj_language`
--

CREATE TABLE `tms_proj_language` (
  `pl_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `source_lang` varchar(255) NOT NULL,
  `target_lang` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tms_property`
--

CREATE TABLE `tms_property` (
  `property_id` int(11) NOT NULL,
  `property_name` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `is_active` int(11) NOT NULL,
  `resource` int(11) NOT NULL,
  `customer` int(11) NOT NULL,
  `mi_contact` int(11) NOT NULL,
  `request` int(11) NOT NULL,
  `project` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_property`
--

INSERT INTO `tms_property` (`property_id`, `property_name`, `language`, `description`, `is_active`, `resource`, `customer`, `mi_contact`, `request`, `project`, `item`, `created_date`, `updated_date`) VALUES
(1, 'Software', '0,2,3,4', 'software description', 1, 1, 1, 0, 0, 0, 0, '2015-10-16 14:47:14', '2022-12-04 02:50:13'),
(4, 'Language', '0,2,3', 'asd', 1, 1, 1, 1, 0, 0, 0, '2015-10-16 14:55:31', '2022-10-28 14:59:24'),
(10, 'Hardware', '33,86', 'Hardware required', 1, 1, 0, 0, 1, 1, 1, '2018-04-17 18:32:28', '2021-02-23 18:11:55'),
(11, 'CAT Tool', '0,1,81,33,83', 'CAT Tool', 1, 1, 0, 0, 0, 0, 1, '2022-05-10 17:19:28', '2022-12-04 02:37:32'),
(15, 'Certified', '0', 'State Authorized', 1, 0, 0, 0, 0, 0, 0, '2022-12-04 02:51:09', '2022-12-04 02:52:21');

-- --------------------------------------------------------

--
-- Table structure for table `tms_property_values`
--

CREATE TABLE `tms_property_values` (
  `value_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `value_name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_property_values`
--

INSERT INTO `tms_property_values` (`value_id`, `property_id`, `value_name`, `description`, `created_date`, `updated_date`) VALUES
(8, 12, 'add', 'aadasd', '2018-04-18 16:14:47', '2018-04-18 16:14:47'),
(11, 4, 'asdasdasd', 'asdasdasdasd', '2019-01-04 17:14:51', '2019-01-04 17:14:51'),
(12, 10, 'PC', 'PC', '2022-05-04 12:57:44', '2022-05-04 12:57:44'),
(13, 10, 'Mac', 'Mac', '2022-05-04 12:58:22', '2022-05-04 12:58:22'),
(14, 1, 'Adobe Acrobat', 'Adobe Acrobat', '2022-05-04 13:00:12', '2022-05-04 13:00:12'),
(15, 1, 'Adobe Illustrator', 'Adobe Illustrator', '2022-05-04 13:00:12', '2022-05-04 13:00:12'),
(16, 1, 'Adobe Indesign', 'Adobe Indesign', '2022-05-04 13:00:12', '2022-05-04 13:00:12'),
(17, 1, 'Adobe Dreamweaver', 'Adobe Dreamweaver', '2022-05-04 13:00:12', '2022-05-04 13:00:12'),
(18, 1, 'Adobe Photoshop', 'Adobe Photoshop', '2022-05-04 13:02:04', '2022-05-04 13:02:04'),
(19, 1, 'AutoCAD', 'AutoCAD', '2022-05-04 13:02:04', '2022-05-04 13:02:04'),
(20, 1, 'Adobe Reader', 'Adobe Reader', '2022-05-04 13:02:04', '2022-05-04 13:02:04'),
(21, 1, 'Microsoft Excel', 'Microsoft Excel', '2022-05-04 13:02:04', '2022-05-04 13:02:04'),
(22, 1, 'Linguistic Tool Box (LTB)', 'Linguistic Tool Box (LTB)', '2022-05-04 13:02:04', '2022-05-04 13:02:04'),
(23, 1, 'Microsoft PowerPoint', 'Microsoft PowerPoint', '2022-05-04 13:02:04', '2022-05-04 13:02:04'),
(24, 1, 'SnellSpell', 'SnellSpell', '2022-05-04 13:02:04', '2022-05-04 13:02:04'),
(25, 1, 'QA Distiller', 'QA Distiller', '2022-05-04 13:02:04', '2022-05-04 13:02:04'),
(26, 1, 'Microsoft Word', 'Microsoft Word', '2022-05-04 13:02:04', '2022-05-04 13:02:04'),
(27, 1, 'WordFinder', 'WordFinder', '2022-05-04 13:02:04', '2022-05-04 13:02:04'),
(28, 1, 'Xbench', 'Xbench', '2022-05-04 13:02:04', '2022-05-04 13:02:04'),
(30, 11, 'Across', 'Across', '2022-05-10 17:22:49', '2022-05-10 17:33:53'),
(31, 11, 'Passolo', 'Passolo', '2022-05-10 17:22:49', '2022-05-10 17:33:53'),
(34, 11, 'MemSource', 'MemSource', '2022-05-10 17:22:49', '2022-05-10 17:33:53'),
(35, 11, 'Smartling', 'Smartling', '2022-05-10 17:22:49', '2022-05-10 17:33:53'),
(37, 11, 'XTM', 'XTM', '2022-05-10 17:22:49', '2022-05-10 17:33:53'),
(39, 11, 'Idiom WorldServer', 'Idiom WorldServer', '2022-05-10 17:22:49', '2022-05-10 17:33:53'),
(42, 11, 'SDL Studio', 'SDL Studio', '2022-05-10 17:33:53', '2022-05-10 17:33:53'),
(43, 11, 'Medtronic TM Tool', 'Medtronic TM Tool', '2022-05-10 17:33:53', '2022-05-10 17:33:53'),
(44, 11, 'Alchemy Catalyst', 'Alchemy Catalyst', '2022-05-10 17:33:53', '2022-05-10 17:33:53'),
(48, 11, 'Wordfast', 'Wordfast', '2022-05-10 17:33:54', '2022-05-10 17:33:54'),
(49, 11, 'Wordbee', 'Wordbee', '2022-05-10 17:36:54', '2022-05-10 17:36:54'),
(57, 11, 'Coach', 'Coach', '2022-05-10 17:40:35', '2022-05-10 17:40:35'),
(68, 11, 'ATMS', 'ATMS', '2022-12-04 02:33:22', '2022-12-04 02:33:22'),
(69, 11, 'Crowdin', 'Crowdin', '2022-12-04 02:33:34', '2022-12-04 02:33:34'),
(70, 11, 'Déjà Vu', 'Déjà Vu', '2022-12-04 02:33:49', '2022-12-04 02:33:49'),
(71, 11, 'Lokalise', 'Lokalise', '2022-12-04 02:34:01', '2022-12-04 02:34:01'),
(72, 11, 'MemoQ', 'MemoQ', '2022-12-04 02:34:12', '2022-12-04 02:34:12'),
(73, 11, 'Smartcat', 'Smartcat', '2022-12-04 02:34:22', '2022-12-04 02:34:22'),
(74, 11, 'Transifex', 'Transifex', '2022-12-04 02:34:34', '2022-12-04 02:34:34'),
(75, 11, 'Translation Workspace', 'Translation Workspace', '2022-12-04 02:34:46', '2022-12-04 02:34:46'),
(76, 15, 'Yes', '', '2022-12-04 02:51:21', '2022-12-04 02:51:21'),
(77, 15, 'No', '', '2022-12-04 02:51:32', '2022-12-04 02:51:32');

-- --------------------------------------------------------

--
-- Table structure for table `tms_report_image`
--

CREATE TABLE `tms_report_image` (
  `id` int(11) NOT NULL,
  `uploadedUserName` varchar(50) NOT NULL,
  `reportedUserName` varchar(50) NOT NULL,
  `reportedUserId` int(11) NOT NULL,
  `reported_image` varchar(255) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tms_resource_assets`
--

CREATE TABLE `tms_resource_assets` (
  `resourceId` int(11) NOT NULL,
  `iUserId` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `period` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `specialist` varchar(255) NOT NULL,
  `technical` varchar(255) NOT NULL,
  `deadlines` varchar(255) NOT NULL,
  `flexibility` varchar(255) NOT NULL,
  `carryOut` varchar(255) NOT NULL,
  `review_memo` varchar(255) NOT NULL,
  `assestment` varchar(255) NOT NULL,
  `totalRate` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tms_rounding`
--

CREATE TABLE `tms_rounding` (
  `rounding_id` int(11) NOT NULL,
  `rounding_name` varchar(255) NOT NULL,
  `rounding_desc` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_rounding`
--

INSERT INTO `tms_rounding` (`rounding_id`, `rounding_name`, `rounding_desc`, `is_active`, `created_date`, `modified_date`) VALUES
(2, 'price21', 'round(round down to 0.5 - round up from 0.5)', 0, '2018-04-20 16:51:01', '2018-04-20 16:51:01'),
(3, 'Price23', 'round', 1, '2018-04-23 11:07:19', '2018-04-23 11:07:19'),
(4, 'Test RP', 'tests', 1, '2018-04-20 16:52:24', '2018-04-20 16:52:24'),
(5, 'Round', 'Rounding pricing', 1, '2018-04-23 11:07:14', '2018-04-23 11:07:14'),
(6, 'Master', 'Master price rounding', 1, '2018-04-23 11:07:29', '2018-04-23 11:07:29'),
(7, 'travelling', 'Travelling to goa', 1, '2022-10-18 15:58:41', '2022-10-18 15:58:41');

-- --------------------------------------------------------

--
-- Table structure for table `tms_service`
--

CREATE TABLE `tms_service` (
  `sId` int(11) NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `short_code` varchar(255) NOT NULL,
  `abbrevation` varchar(255) NOT NULL,
  `job_representation` varchar(255) NOT NULL,
  `properties` varchar(255) NOT NULL,
  `due_date_mandatory` int(11) NOT NULL,
  `quantity_mandatory` int(11) NOT NULL,
  `is_active` int(11) NOT NULL COMMENT 'active=''1'',inactive=''0''',
  `isdefault` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_service`
--

INSERT INTO `tms_service` (`sId`, `service_name`, `short_code`, `abbrevation`, `job_representation`, `properties`, `due_date_mandatory`, `quantity_mandatory`, `is_active`, `isdefault`, `created_date`, `updated_date`) VALUES
(1, 'Editing', '123', 'EDI', '1', '9', 0, 1, 1, 1, '2016-04-11 11:10:12', '2018-07-12 14:55:59'),
(3, 'Project Management', '456', 'PMT', '2', '4', 0, 0, 1, 0, '2016-02-02 14:33:58', '2018-01-02 17:32:11'),
(5, 'Proofreading', '123', 'PR', '3', '4', 0, 0, 1, 0, '2016-04-11 11:10:38', '2018-01-02 17:32:22'),
(7, 'QA', '', 'QA', '1', '4', 1, 1, 1, 0, '2017-03-07 16:27:51', '2018-01-03 14:34:35'),
(9, 'TEP', '', 'TEP', '1', '4', 0, 0, 1, 0, '2018-01-02 17:32:48', '2018-01-03 14:34:27'),
(10, 'Neww', '', 'neww', '3', '12', 1, 0, 1, 0, '2018-04-19 12:53:24', '2018-10-03 15:16:13');

-- --------------------------------------------------------

--
-- Table structure for table `tms_specialization`
--

CREATE TABLE `tms_specialization` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(2) NOT NULL DEFAULT '1',
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_specialization`
--

INSERT INTO `tms_specialization` (`id`, `name`, `is_active`, `created_date`, `updated_date`) VALUES
(1, 'Automotive', 1, '2022-12-05 02:53:00', '2022-12-05 02:53:00'),
(2, 'Betting', 1, '2022-12-05 02:53:00', '2022-12-05 02:53:00'),
(3, 'Finance', 1, '2022-12-05 02:53:00', '2022-12-05 02:53:00'),
(4, 'Games', 1, '2022-12-05 02:53:00', '2022-12-05 02:53:00'),
(5, 'General', 1, '2022-12-05 02:53:00', '2022-12-05 02:53:00'),
(6, 'IT', 1, '2022-12-05 02:53:00', '2022-12-05 02:53:00'),
(7, 'Legal', 1, '2022-12-05 02:53:00', '2022-12-05 02:53:00'),
(8, 'Life-Science', 1, '2022-12-05 02:53:00', '2022-12-05 02:53:00'),
(9, 'Marketing', 1, '2022-12-05 02:53:00', '2022-12-05 02:53:00'),
(10, 'Medical – Patient Facing', 1, '2022-12-05 02:53:00', '2022-12-05 02:53:00'),
(11, 'Medical – Specialist Facing', 1, '2022-12-05 02:53:00', '2022-12-05 02:53:00'),
(12, 'Patents', 1, '2022-12-05 02:53:00', '2022-12-05 02:53:00'),
(13, 'QRD Templates', 1, '2022-12-05 02:53:00', '2022-12-05 02:53:00'),
(14, 'Technical', 1, '2022-12-05 02:53:00', '2022-12-08 17:01:21');

-- --------------------------------------------------------

--
-- Table structure for table `tms_summmery_view`
--

CREATE TABLE `tms_summmery_view` (
  `job_summmeryId` int(11) NOT NULL,
  `per_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `job_chain_id` int(11) DEFAULT NULL,
  `appr_id` int(11) NOT NULL,
  `master_job_id` int(11) NOT NULL,
  `job_no` varchar(255) NOT NULL,
  `job_code` varchar(255) NOT NULL,
  `order_no` varchar(255) NOT NULL,
  `po_number` varchar(255) NOT NULL,
  `tmp_po_number` varchar(255) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `resource` varchar(255) NOT NULL,
  `due_date` datetime NOT NULL,
  `contact_person` varchar(255) NOT NULL,
  `item_status` varchar(255) NOT NULL DEFAULT 'In preparation',
  `company_code` varchar(255) NOT NULL,
  `work_instruction` longtext NOT NULL,
  `ItemLanguage` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `specialization` varchar(255) NOT NULL,
  `negative_feedback` varchar(255) NOT NULL,
  `late_delivery` varchar(255) NOT NULL,
  `auto_job` enum('0','1','2','3','4') NOT NULL DEFAULT '1' COMMENT '''Partial delivery''=''1'',''Final delivery''=''2'',''Approved''=''3'',''Approved/Without invoice''=''4''',
  `auto_status` enum('Auto','Manual') NOT NULL DEFAULT 'Auto',
  `rejection` varchar(255) NOT NULL,
  `price` longtext NOT NULL,
  `total_price` float(10,2) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_summmery_view`
--

INSERT INTO `tms_summmery_view` (`job_summmeryId`, `per_id`, `order_id`, `item_id`, `job_id`, `job_chain_id`, `appr_id`, `master_job_id`, `job_no`, `job_code`, `order_no`, `po_number`, `tmp_po_number`, `description`, `resource`, `due_date`, `contact_person`, `item_status`, `company_code`, `work_instruction`, `ItemLanguage`, `specialization`, `negative_feedback`, `late_delivery`, `auto_job`, `auto_status`, `rejection`, `price`, `total_price`, `created_date`, `updated_date`) VALUES
(1, 0, 3, 1, 0, 0, 0, 1, '1', 'BAD', '', 'KNH160001_BAD001', 'KNH160001_BAD001', 'test job', '4', '2022-11-01 14:18:00', '1', 'Completed', 'KNH160001', '[{\"work_id\":0,\"work_name\":\"Please start job\"}]', 'English (US) > Norwegian (nynorsk)', '', '', '', '1', 'Auto', '', '[{\"quantity\":\"1\",\"pricelist\":\"Words Translation Fuzzy Match\",\"itemPrice\":\"0.1\",\"itemTotal\":\"1.00\",\"amtSum\":1}]', 1.00, '2022-11-01 14:18:58', '2022-12-08 18:38:25'),
(4, 0, 25, 1, 7, 17, 0, 7, '1', 'SEO', '', 'SPE220002_SEO001', 'SPE220002_SEO001', 'test', '4', '2022-10-31 16:00:00', '1', 'Completed', 'SPE220002', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-11-03 21:14:51', '2022-11-10 14:40:32'),
(5, 0, 25, 1, 4, 17, 0, 4, '2', 'DTC', '', 'SPE220002_DTC002', 'SPE220002_DTC002', '', '4', '2022-10-31 16:00:00', '1', 'Completed', 'SPE220002', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-11-03 21:14:51', '2022-11-03 21:44:36'),
(6, 0, 25, 1, 3, 0, 0, 3, '3', 'DTP', '', 'SPE220002_DTP003', 'SPE220002_DTP003', '', '4', '2022-10-31 16:00:00', '1', 'Completed', 'SPE220002', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-11-03 21:14:51', '2022-11-03 21:44:49'),
(7, 0, 27, 1, 1, 0, 0, 1, '1', 'BAD', '', 'SPE220003_BAD001', 'SPE220003_BAD001', '', '4', '2022-11-03 17:00:00', '1', 'Completed', 'SPE220003', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-11-03 22:00:58', '2022-11-03 22:02:18'),
(8, 0, 29, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE220004_PRF001', 'SPE220004_PRF001', '', '4', '2022-11-04 17:00:00', '1', 'Completed', 'SPE220004', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-11-04 16:29:47', '2022-11-04 16:30:28'),
(9, 0, 31, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE220005_PRF001', 'SPE220005_PRF001', '', '4', '2022-11-03 12:00:00', '1', 'Delivered', 'SPE220005', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-11-04 16:43:32', '2022-11-04 16:43:51'),
(10, 0, 33, 1, 0, 0, 0, 9, '1', 'TRA', '', 'SPE220006_TRA001', 'SPE220006_TRA001', '', '4', '2022-11-03 12:00:00', '1', 'Delivered', 'SPE220006', '[]', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-11-04 16:54:14', '2022-11-04 16:55:20'),
(13, 0, 37, 1, 0, 0, 0, 10, '1', 'PRF', '', 'SPE220007_PRF001', 'SPE220007_PRF001', '', '4', '2022-11-04 09:00:00', '1', 'Delivered', 'SPE220007', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-11-08 13:46:03', '2022-11-08 13:46:37'),
(14, 0, 38, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE220008_PRF001', 'SPE220008_PRF001', '', '4', '2022-11-04 09:00:00', '1', 'Delivered', 'SPE220008', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-11-08 13:50:31', '2022-11-08 13:50:49'),
(16, 0, 46, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE220009_PRF001', 'SPE220009_PRF001', '', '4', '2022-11-08 17:00:00', '1', 'Delivered', 'SPE220009', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-11-08 18:07:08', '2022-11-08 18:07:32'),
(18, 0, 49, 1, 0, 0, 0, 9, '1', 'TRA', '', 'SPE220010_TRA001', 'SPE220010_TRA001', '', '8', '2022-11-09 11:00:00', '1', 'Delivered', 'SPE220010', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-11-10 16:01:37', '2022-11-10 16:02:23'),
(19, 0, 51, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE220011_PRF001', 'SPE220011_PRF001', '', '8', '2022-11-09 12:00:00', '1', 'Delivered', 'SPE220011', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-11-10 16:38:34', '2022-11-10 16:38:46'),
(20, 0, 55, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPEU_0001_TRA001', 'SPEU_0001_TRA001', '', '', '2022-11-09 17:00:00', '1', 'New', '', '', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-11-11 16:35:00', '2022-11-11 16:35:00'),
(21, 0, 55, 2, 9, NULL, 0, 9, '2', 'TRA', '', 'SPEU_0001_TRA002', 'SPEU_0001_TRA002', '', '', '2022-11-10 17:00:00', '1', 'New', '', '', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-11-11 16:35:36', '2022-11-11 16:35:36'),
(22, 0, 55, 4, 9, NULL, 0, 9, '3', 'TRA', '', 'SPEU_0001_TRA003', 'SPEU_0001_TRA003', '', '', '2022-11-14 17:00:00', '1', 'New', '', '', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-11-11 16:36:49', '2022-11-11 16:36:49'),
(23, 0, 55, 3, 9, NULL, 0, 9, '4', 'TRA', '', 'SPEU_0001_TRA004', 'SPEU_0001_TRA004', '', '', '2022-11-14 17:00:00', '1', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-11-11 16:38:58', '2022-11-11 16:38:58'),
(24, 0, 55, 5, 0, NULL, 0, 9, '5', 'TRA', '', 'SPEU_0001_TRA005', 'SPEU_0001_TRA005', '', '', '2022-12-19 17:00:00', '1', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-11-11 16:39:52', '2022-11-11 16:39:52'),
(25, 0, 55, 6, 9, NULL, 0, 9, '6', 'TRA', '', 'SPEU_0001_TRA006', 'SPEU_0001_TRA006', '', '', '2022-12-19 17:00:00', '1', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-11-11 16:50:29', '2022-11-11 16:50:29'),
(26, 0, 55, 7, 9, NULL, 0, 9, '7', 'TRA', '', 'SPEU_0001_TRA007', 'SPEU_0001_TRA007', '', '', '2022-12-19 17:00:00', '1', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-11-11 17:15:13', '2022-11-11 17:15:13'),
(27, 0, 55, 8, 9, NULL, 0, 9, '8', 'TRA', '', 'SPEU_0001_TRA008', 'SPEU_0001_TRA008', '', '', '2022-12-19 17:00:00', '1', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-11-11 17:16:35', '2022-11-11 17:16:35'),
(28, 0, 55, 9, 9, NULL, 0, 9, '9', 'TRA', '', 'SPEU_0001_TRA009', 'SPEU_0001_TRA009', '', '', '2022-12-19 17:00:00', '1', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-11-11 17:18:03', '2022-11-11 17:18:03'),
(29, 0, 55, 10, 0, NULL, 0, 9, '10', 'TRA', '', 'SPEU_0001_TRA010', 'SPEU_0001_TRA010', '', '', '2022-12-19 17:00:00', '1', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-11-11 17:18:42', '2022-11-11 17:18:42'),
(30, 0, 55, 11, 9, NULL, 0, 9, '11', 'TRA', '', 'SPEU_0001_TRA011', 'SPEU_0001_TRA011', '', '', '2022-12-19 17:00:00', '1', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-11-11 17:20:40', '2022-11-11 17:20:40'),
(31, 0, 55, 12, 0, NULL, 0, 9, '12', 'TRA', '', 'SPEU_0001_TRA012', 'SPEU_0001_TRA012', '', '', '2022-12-19 17:00:00', '1', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-11-11 17:21:22', '2022-11-11 17:21:22'),
(32, 0, 55, 13, 9, NULL, 0, 9, '13', 'TRA', '', 'SPEU_0001_TRA013', 'SPEU_0001_TRA013', '', '', '2022-12-19 17:00:00', '1', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-11-11 17:21:55', '2022-11-11 17:21:55'),
(33, 0, 55, 14, 9, NULL, 0, 9, '14', 'TRA', '', 'SPEU_0001_TRA014', 'SPEU_0001_TRA014', '', '', '2022-12-19 17:00:00', '1', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-11-11 17:22:31', '2022-11-11 17:22:31'),
(34, 0, 55, 15, 9, NULL, 0, 9, '15', 'TRA', '', 'SPEU_0001_TRA015', 'SPEU_0001_TRA015', '', '', '2022-11-10 17:00:00', '1', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-11-11 19:00:30', '2022-11-11 19:00:30'),
(36, 0, 59, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE220013_PRF001', 'SPE220013_PRF001', '', '8', '2022-11-14 11:00:00', '1', 'Delivered', 'SPE220013', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-11-16 16:27:56', '2022-11-16 16:30:24'),
(37, 0, 61, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE220014_PRF001', 'SPE220014_PRF001', '', '8', '2022-11-15 12:00:00', '1', 'Delivered', 'SPE220014', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-11-16 16:36:00', '2022-11-16 16:36:22'),
(38, 0, 62, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPE_0001_TRA001', 'SPE_0001_TRA001', '', '8', '2022-11-16 12:00:00', '1', 'Delivered', 'SPE_0001', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-11-16 16:51:34', '2022-11-16 16:51:59'),
(39, 0, 63, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPE_0002_TRA001', 'SPE_0002_TRA001', '', '8', '2022-11-15 12:00:00', '1', 'Delivered', 'SPE_0002', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-11-16 17:02:28', '2022-11-16 17:02:43'),
(40, 0, 64, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE220015_PRF001', 'SPE220015_PRF001', '', '8', '2022-11-15 12:00:00', '1', 'Delivered', 'SPE220015', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-11-16 17:06:41', '2022-11-16 17:07:02'),
(43, 0, 72, 1, 0, 0, 0, 9, '1', 'TRA', '', 'SPE_0003_TRA001', 'SPE_0003_TRA001', '', '8', '2022-11-19 09:27:00', '1', 'In-progress', 'SPE_0003', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '[{\"quantity\":\"500\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,08\",\"itemTotal\":\"40\",\"amtSum\":40}]', 40.00, '2022-11-18 00:57:53', '2022-11-18 01:01:49'),
(44, 0, 74, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE220016_PRF001', 'SPE220016_PRF001', '', '8', '2022-11-17 19:00:00', '7', 'Delivered', 'SPE220016', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-11-18 23:53:36', '2022-11-18 23:54:00'),
(45, 0, 76, 1, 0, 0, 0, 10, '1', 'PRF', '', 'SPE220017_PRF001', 'SPE220017_PRF001', '', '8', '2022-11-18 19:00:00', '7', 'Delivered', 'SPE220017', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-11-18 23:58:25', '2022-11-18 23:58:40'),
(53, 0, 83, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE22,SPE_0001_PRF001', 'SPE22,SPE_0001_PRF001', '', '8', '1970-01-01 05:30:00', '1', 'Delivered', 'SPE22,SPE_0001', '[]', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-12-01 16:01:48', '2022-12-01 16:02:13'),
(54, 0, 84, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE22,SPE_0002_PRF001', 'SPE22,SPE_0002_PRF001', '', '8', '2022-11-22 11:40:00', '1', 'Delivered', 'SPE22,SPE_0002', '[]', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-12-01 16:10:13', '2022-12-01 16:10:39'),
(55, 0, 86, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPE_0004_TRA001', 'SPE_0004_TRA001', '', '8', '2022-11-24 12:01:00', '1', 'Delivered', 'SPE_0004', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-12-01 16:31:39', '2022-12-01 16:32:01'),
(56, 0, 87, 1, 0, 0, 0, 10, '1', 'PRF', '', 'SPE_0005_PRF001', 'SPE_0005_PRF001', '', '8', '2022-11-25 12:46:00', '1', 'Delivered', 'SPE_0005', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-12-01 17:16:22', '2022-12-01 17:16:52'),
(57, 0, 88, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE22,SPE_0003_PRF001', 'SPE22,SPE_0003_PRF001', '', '8', '1970-01-01 05:30:00', '1', 'Delivered', 'SPE22,SPE_0003', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-12-01 17:51:58', '2022-12-01 17:52:10'),
(58, 0, 89, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPE_0006_TRA001', 'SPE_0006_TRA001', '', '8', '1970-01-01 05:30:00', '1', 'Delivered', 'SPE_0006', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-12-01 18:09:54', '2022-12-01 18:10:11'),
(59, 0, 91, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPE_0007_TRA001', 'SPE_0007_TRA001', '', '8', '2022-11-28 15:02:00', '1', 'Delivered', 'SPE_0007', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-12-01 19:22:01', '2022-12-01 19:33:00'),
(60, 0, 92, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE_0008_PRF001', 'SPE_0008_PRF001', '', '8', '1970-01-01 05:30:00', '1', 'Delivered', 'SPE_0008', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-12-01 19:48:20', '2022-12-01 19:48:38'),
(61, 0, 93, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE_0009_PRF001', 'SPE_0009_PRF001', '', '8', '2022-11-29 15:35:00', '1', 'Delivered', 'SPE_0009', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-12-01 20:05:20', '2022-12-01 20:06:16'),
(62, 0, 94, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPE_0010_TRA001', 'SPE_0010_TRA001', '', '8', '2022-11-30 15:47:00', '1', 'Delivered', 'SPE_0010', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-12-01 20:17:27', '2022-12-01 20:17:52'),
(63, 0, 95, 1, 0, 0, 0, 10, '1', 'PRF', '', 'SPE22,SPE_0004_PRF001', 'SPE22,SPE_0004_PRF001', '', '8', '2022-12-01 15:57:00', '1', 'Delivered', 'SPE22,SPE_0004', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-12-01 20:27:04', '2022-12-01 20:27:26'),
(64, 0, 96, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE220018_PRF001', 'SPE220018_PRF001', '', '8', '1970-01-01 05:30:00', '1', 'Delivered', 'SPE220018', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-12-01 20:41:51', '2022-12-01 20:42:04'),
(65, 0, 97, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE220019_PRF001', 'SPE220019_PRF001', '', '8', '1970-01-01 05:30:00', '1', 'Delivered', 'SPE220019', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-12-01 20:46:54', '2022-12-01 20:47:09'),
(66, 0, 98, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE220020_PRF001', 'SPE220020_PRF001', '', '8', '2022-11-18 16:24:00', '1', 'Delivered', 'SPE220020', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-12-01 20:53:50', '2022-12-01 20:54:10'),
(67, 0, 99, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE220021_PRF001', 'SPE220021_PRF001', '', '8', '2022-11-21 17:35:00', '1', 'Delivered', 'SPE220021', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-12-01 22:04:08', '2022-12-01 22:05:45'),
(68, 0, 101, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE220022_PRF001', 'SPE220022_PRF001', '', '8', '2022-11-21 05:30:00', '1', 'Delivered', 'SPE220022', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-12-01 22:13:23', '2022-12-01 22:14:18'),
(69, 0, 102, 1, 0, 0, 0, 10, '1', 'PRF', '', 'SPE220023_PRF001', 'SPE220023_PRF001', '', '8', '2022-11-21 17:51:00', '1', 'Delivered', 'SPE220023', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-12-01 22:20:35', '2022-12-01 22:21:06'),
(70, 0, 104, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE220024_PRF001', 'SPE220024_PRF001', '', '8', '2022-11-21 18:13:00', '1', 'Delivered', 'SPE220024', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-12-01 22:43:02', '2022-12-01 22:43:49'),
(71, 0, 105, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE220025_PRF001', 'SPE220025_PRF001', '', '8', '1970-01-01 05:30:00', '1', 'Delivered', 'SPE220025', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-12-01 23:01:40', '2022-12-01 23:01:56'),
(72, 0, 106, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE22,SPE_0005_PRF001', 'SPE22,SPE_0005_PRF001', '', '8', '1970-01-01 05:30:00', '1', 'Delivered', 'SPE22,SPE_0005', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-12-02 14:29:35', '2022-12-02 14:29:59'),
(73, 0, 107, 1, 0, 0, 0, 10, '1', 'PRF', '', 'SPE220026_PRF001', 'SPE220026_PRF001', '', '8', '2022-11-24 10:00:00', '1', 'Delivered', 'SPE220026', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-12-02 14:37:26', '2022-12-02 14:38:00'),
(74, 0, 108, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE220027_PRF001', 'SPE220027_PRF001', '', '8', '1970-01-01 05:30:00', '1', 'Delivered', 'SPE220027', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-12-02 14:47:14', '2022-12-02 14:47:25'),
(75, 0, 109, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPE220028_TRA001', 'SPE220028_TRA001', '', '8', '1970-01-01 05:30:00', '1', 'Delivered', 'SPE220028', '[]', 'Norwegian (bokmal) > English (US)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-12-02 14:54:37', '2022-12-02 14:54:47'),
(81, 0, 111, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPEU_0002_TRA001', 'SPEU_0002_TRA001', '', '8', '2022-12-02 15:00:00', '1', 'Delivered', 'SPEU_0002', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-12-05 20:47:07', '2022-12-05 20:47:40'),
(82, 0, 112, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPEU_0003_TRA001', 'SPEU_0003_TRA001', '', '8', '2022-12-02 16:00:00', '1', 'Delivered', 'SPEU_0003', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-12-05 21:00:00', '2022-12-05 21:23:47'),
(83, 0, 113, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPEU_0004_PRF001', 'SPEU_0004_PRF001', '', '8', '2022-12-05 08:00:00', '1', 'Delivered', 'SPEU_0004', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-12-05 21:26:40', '2022-12-05 21:27:10'),
(84, 0, 114, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPE_0007_TRA001', 'SPE_0007_TRA001', '', '8', '2022-12-06 17:00:00', '1', 'Delivered', 'SPE_0007', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-12-05 21:29:49', '2022-12-05 21:31:02'),
(85, 0, 116, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPE_0008_TRA001', 'SPE_0008_TRA001', '', '8', '2022-12-06 13:00:00', '1', 'Delivered', 'SPE_0008', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-12-06 17:31:59', '2022-12-06 17:32:55'),
(86, 0, 117, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPE_0009_TRA001', 'SPE_0009_TRA001', '', '8', '2022-12-06 13:00:00', '1', 'Delivered', 'SPE_0009', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-12-06 17:41:21', '2022-12-06 17:41:46'),
(87, 0, 118, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPEU_0005_TRA001', 'SPEU_0005_TRA001', '', '8', '2022-12-11 16:00:00', '1', 'Delivered', 'SPEU_0005', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-12-07 21:19:36', '2022-12-07 21:20:00'),
(88, 0, 120, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPEU_0006_PRF001', 'SPEU_0006_PRF001', '', '8', '2022-12-07 09:00:00', '1', 'Delivered', 'SPEU_0006', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-12-07 21:26:05', '2022-12-07 21:26:27'),
(89, 0, 125, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE_0010_PRF001', 'SPE_0010_PRF001', '', '8', '2022-12-07 14:00:00', '1', 'Delivered', 'SPE_0010', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-12-12 17:42:26', '2022-12-12 17:43:05'),
(90, 0, 126, 1, 0, 0, 0, 9, '1', 'TRA', '', 'SPE_0011_TRA001', 'SPE_0011_TRA001', '', '8', '2022-12-08 11:45:00', '1', 'Delivered', 'SPE_0011', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-12-12 17:50:51', '2022-12-12 17:51:51'),
(91, 0, 127, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPE_0012_TRA001', 'SPE_0012_TRA001', '', '8', '2022-12-08 16:00:00', '1', 'Delivered', 'SPE_0012', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-12-12 17:56:24', '2022-12-12 17:58:14'),
(92, 0, 128, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPEU_0007_PRF001', 'SPEU_0007_PRF001', '', '8', '2022-12-09 12:00:00', '1', 'Delivered', 'SPEU_0007', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-12-12 18:00:43', '2022-12-12 18:01:03'),
(93, 0, 129, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPE_0013_TRA001', 'SPE_0013_TRA001', '', '8', '2022-12-09 17:00:00', '1', 'Delivered', 'SPE_0013', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0.00, '2022-12-12 18:04:13', '2022-12-12 18:04:30');

-- --------------------------------------------------------

--
-- Table structure for table `tms_summmery_view_sorting`
--

CREATE TABLE `tms_summmery_view_sorting` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `sorted_json` mediumtext NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_summmery_view_sorting`
--

INSERT INTO `tms_summmery_view_sorting` (`id`, `order_id`, `sorted_json`, `updated_date`, `created_date`) VALUES
(1, 3, '[[{\"job_summmeryId\":1,\"per_id\":0,\"order_id\":3,\"item_id\":1,\"job_id\":0,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":1,\"job_no\":1,\"job_code\":\"BAD\",\"order_no\":\"\",\"po_number\":\"KNH160001_BAD001\",\"tmp_po_number\":\"KNH160001_BAD001\",\"description\":\"test job\",\"resource\":4,\"due_date\":\"2022-11-01 14:18:00\",\"contact_person\":1,\"item_status\":\"Paid\",\"company_code\":\"KNH160001\",\"work_instruction\":\"[{\\\"work_id\\\":0,\\\"work_name\\\":\\\"Please start job\\\"}]\",\"ItemLanguage\":\"English (US) > Norwegian (nynorsk)\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2022-11-01 14:18:58\",\"updated_date\":\"2022-11-01 15:11:50\",\"vUserName\":\"Linguist Kanhasoft\",\"iUserId\":4,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}]]', '2022-11-01 10:06:07', '2022-11-01 15:03:20'),
(2, 20, '[[{\"job_summmeryId\":3,\"per_id\":0,\"order_id\":20,\"item_id\":1,\"job_id\":1,\"job_chain_id\":null,\"appr_id\":0,\"master_job_id\":1,\"job_no\":1,\"job_code\":\"BAD\",\"order_no\":\"\",\"po_number\":\"KNH160005_BAD001\",\"tmp_po_number\":\"KNH160005_BAD001\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2022-11-04 18:10:00\",\"contact_person\":1,\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"English (UK) > English (US)\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2022-11-03 18:08:21\",\"updated_date\":\"2022-11-03 18:08:21\",\"vUserName\":null,\"resourcePic\":null,\"iUserId\":null,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}]]', '2022-11-03 12:38:41', '2022-11-03 18:08:41'),
(3, 36, '[[{\"job_summmeryId\":11,\"per_id\":0,\"order_id\":36,\"item_id\":1,\"job_id\":9,\"job_chain_id\":0,\"appr_id\":1,\"master_job_id\":9,\"job_no\":1,\"job_code\":\"TRA\",\"order_no\":\"\",\"po_number\":\"KNH160007_TRA001\",\"tmp_po_number\":\"KNH160007_TRA001\",\"description\":\"\",\"resource\":4,\"due_date\":\"2022-11-10 16:39:00\",\"contact_person\":1,\"item_status\":\"Approved\",\"company_code\":\"KNH160007\",\"work_instruction\":\"[]\",\"ItemLanguage\":\"English (US) > English (US)\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"[{\\\"quantity\\\":\\\"10\\\",\\\"pricelist\\\":\\\"Words Translation 50-74% Match\\\",\\\"itemPrice\\\":\\\"5\\\",\\\"itemTotal\\\":\\\"50\\\",\\\"amtSum\\\":50}]\",\"total_price\":50,\"created_date\":\"2022-11-07 15:41:26\",\"updated_date\":\"2022-11-07 16:47:32\",\"vUserName\":\"Linguist Kanhasoft\",\"iUserId\":4,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}],[{\"job_summmeryId\":12,\"per_id\":0,\"order_id\":36,\"item_id\":2,\"job_id\":9,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":9,\"job_no\":2,\"job_code\":\"TRA\",\"order_no\":\"\",\"po_number\":\"KNH160007_TRA002\",\"tmp_po_number\":\"KNH160007_TRA002\",\"description\":\"\",\"resource\":4,\"due_date\":\"2022-11-10 17:16:00\",\"contact_person\":1,\"item_status\":\"Approved\",\"company_code\":\"KNH160007\",\"work_instruction\":\"[]\",\"ItemLanguage\":\"English (US) > English (US)\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"[{\\\"quantity\\\":\\\"5\\\",\\\"pricelist\\\":\\\"Words Translation 50-74% Match\\\",\\\"itemPrice\\\":\\\"20\\\",\\\"itemTotal\\\":\\\"100\\\",\\\"amtSum\\\":100}]\",\"total_price\":100,\"created_date\":\"2022-11-07 16:17:14\",\"updated_date\":\"2022-11-07 17:35:00\",\"vUserName\":\"Linguist Kanhasoft\",\"iUserId\":4,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}]]', '2022-11-07 12:05:19', '2022-11-07 16:26:01'),
(4, 41, '[[{\"job_summmeryId\":15,\"per_id\":0,\"order_id\":41,\"item_id\":1,\"job_id\":1,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":1,\"job_no\":1,\"job_code\":\"BAD\",\"order_no\":\"\",\"po_number\":\"KNH160010_BAD001\",\"tmp_po_number\":\"KNH160010_BAD001\",\"description\":\"\",\"resource\":4,\"due_date\":\"2022-11-08 17:00:00\",\"contact_person\":1,\"item_status\":\"In-progress\",\"company_code\":\"KNH160010\",\"work_instruction\":\"[]\",\"ItemLanguage\":\"English (US) > Bulgarian\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2022-11-08 15:10:55\",\"updated_date\":\"2022-11-21 17:43:17\",\"vUserName\":\"Linguist Kanhasoft\",\"iUserId\":4,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1},{\"job_summmeryId\":46,\"per_id\":0,\"order_id\":41,\"item_id\":1,\"job_id\":3,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":3,\"job_no\":2,\"job_code\":\"DTP\",\"order_no\":\"\",\"po_number\":\"KNH160010_DTP002\",\"tmp_po_number\":\"KNH160010_DTP002\",\"description\":\"\",\"resource\":4,\"due_date\":\"2022-11-08 17:00:00\",\"contact_person\":1,\"item_status\":\"In-progress\",\"company_code\":\"KNH160010\",\"work_instruction\":\"[]\",\"ItemLanguage\":\"English (US) > Bulgarian\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2022-11-21 17:43:05\",\"updated_date\":\"2022-11-21 18:01:22\",\"vUserName\":\"Linguist Kanhasoft\",\"iUserId\":4,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1},{\"job_summmeryId\":48,\"per_id\":0,\"order_id\":41,\"item_id\":1,\"job_id\":11,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":11,\"job_no\":3,\"job_code\":\"QAA\",\"order_no\":\"\",\"po_number\":\"KNH160010_QAA003\",\"tmp_po_number\":\"KNH160010_QAA003\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2022-11-08 17:00:00\",\"contact_person\":7,\"item_status\":\"New\",\"company_code\":\"KNH160010\",\"work_instruction\":\"[]\",\"ItemLanguage\":\"English (US) > Bulgarian\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2022-11-23 19:11:21\",\"updated_date\":\"2022-11-23 19:37:49\",\"vUserName\":null,\"iUserId\":null,\"contactPerson\":\"Ingvild Sundland\",\"contactPersonId\":7},{\"job_summmeryId\":49,\"per_id\":0,\"order_id\":41,\"item_id\":1,\"job_id\":9,\"job_chain_id\":null,\"appr_id\":0,\"master_job_id\":9,\"job_no\":4,\"job_code\":\"TRA\",\"order_no\":\"\",\"po_number\":\"KNH160010_TRA004\",\"tmp_po_number\":\"KNH160010_TRA004\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"0000-00-00 00:00:00\",\"contact_person\":1,\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"English (US) > Bulgarian\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2022-11-23 19:12:01\",\"updated_date\":\"2022-11-23 19:12:01\",\"vUserName\":null,\"iUserId\":null,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}],[{\"job_summmeryId\":50,\"per_id\":0,\"order_id\":41,\"item_id\":2,\"job_id\":11,\"job_chain_id\":null,\"appr_id\":0,\"master_job_id\":11,\"job_no\":5,\"job_code\":\"QAA\",\"order_no\":\"\",\"po_number\":\"KNH160010_QAA005\",\"tmp_po_number\":\"KNH160010_QAA005\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"0000-00-00 00:00:00\",\"contact_person\":1,\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"English (US) > German\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2022-11-23 19:48:25\",\"updated_date\":\"2022-11-23 19:48:25\",\"vUserName\":null,\"iUserId\":null,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1},{\"job_summmeryId\":52,\"per_id\":0,\"order_id\":41,\"item_id\":2,\"job_id\":9,\"job_chain_id\":null,\"appr_id\":0,\"master_job_id\":9,\"job_no\":6,\"job_code\":\"TRA\",\"order_no\":\"\",\"po_number\":\"KNH160010_TRA006\",\"tmp_po_number\":\"KNH160010_TRA006\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"0000-00-00 00:00:00\",\"contact_person\":1,\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"English (US) > German\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2022-11-24 17:03:13\",\"updated_date\":\"2022-11-24 17:03:13\",\"vUserName\":null,\"iUserId\":null,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}],[{\"job_summmeryId\":80,\"per_id\":0,\"order_id\":41,\"item_id\":3,\"job_id\":9,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":9,\"job_no\":10,\"job_code\":\"TRA\",\"order_no\":\"\",\"po_number\":\"KNH160010_TRA010\",\"tmp_po_number\":\"KNH160010_TRA010\",\"description\":\"\",\"resource\":4,\"due_date\":\"2022-12-04 20:48:00\",\"contact_person\":1,\"item_status\":\"Delivered\",\"company_code\":\"KNH160010\",\"work_instruction\":\"[]\",\"ItemLanguage\":\"English (US) > English (US)\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2022-12-04 22:59:32\",\"updated_date\":\"2022-12-04 23:18:41\",\"vUserName\":\"Linguist Kanhasoft\",\"iUserId\":4,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}],[]]', '2022-12-06 04:45:47', '2022-11-24 16:59:59'),
(5, 80, '[[{\"job_summmeryId\":51,\"per_id\":0,\"order_id\":80,\"item_id\":1,\"job_id\":1,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":1,\"job_no\":1,\"job_code\":\"BAD\",\"order_no\":\"\",\"po_number\":\"KNH160015_BAD001\",\"tmp_po_number\":\"KNH160015_BAD001\",\"description\":\"\",\"resource\":4,\"due_date\":\"2022-11-26 00:00:00\",\"contact_person\":1,\"item_status\":\"In-progress\",\"company_code\":\"KNH160015\",\"work_instruction\":\"[]\",\"ItemLanguage\":\"English (US) > English (US)\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2022-11-24 15:04:25\",\"updated_date\":\"2022-11-29 15:28:51\",\"vUserName\":\"Linguist Kanhasoft\",\"resourcePic\":\"1667454966.png\",\"iUserId\":4,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}]]', '2022-11-29 12:45:26', '2022-11-29 18:15:26');

-- --------------------------------------------------------

--
-- Table structure for table `tms_task`
--

CREATE TABLE `tms_task` (
  `iTaskId` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `iUserId` int(11) NOT NULL,
  `iClientId` int(11) NOT NULL,
  `iType` int(11) NOT NULL COMMENT '1=user, 2=client,3=order',
  `iStatus` varchar(255) NOT NULL,
  `orderno` varchar(255) NOT NULL,
  `vDue` varchar(255) NOT NULL,
  `vTaskType` varchar(255) NOT NULL,
  `iContact` varchar(255) NOT NULL,
  `iPersonResponsible` int(11) NOT NULL,
  `vPriority` varchar(255) NOT NULL,
  `tMemo` text NOT NULL,
  `dtCreatedDate` datetime NOT NULL,
  `dtUpdatedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tms_task_type`
--

CREATE TABLE `tms_task_type` (
  `task_id` int(11) NOT NULL,
  `task_type` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tms_tax`
--

CREATE TABLE `tms_tax` (
  `tax_id` int(11) NOT NULL,
  `tax_name` varchar(255) NOT NULL,
  `tax_percentage` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_tax`
--

INSERT INTO `tms_tax` (`tax_id`, `tax_name`, `tax_percentage`, `is_active`, `created_date`, `modified_date`) VALUES
(3, 'Legal Tax', '10.35', 1, '2017-03-24 16:35:25', '2018-08-27 19:03:02'),
(4, 'Tax1', '15', 1, '2017-04-07 14:17:13', '2017-04-07 14:17:13'),
(5, 'Tax Rate', '7', 1, '2017-08-02 15:09:58', '2017-08-18 18:19:11'),
(6, 'Norsk MVA', '25', 1, '2018-01-18 19:02:25', '2018-01-18 19:02:34'),
(9, 'GST', '10', 1, '2018-04-19 15:01:19', '2018-04-19 15:01:28'),
(10, 'long', '3', 1, '2022-07-25 16:39:32', '2022-07-25 16:39:32');

-- --------------------------------------------------------

--
-- Table structure for table `tms_team`
--

CREATE TABLE `tms_team` (
  `team_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `project_coordinator` varchar(255) NOT NULL,
  `project_manager` varchar(255) NOT NULL,
  `QA_specialist` varchar(255) NOT NULL,
  `memo` text NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tms_userprice_list`
--

CREATE TABLE `tms_userprice_list` (
  `price_listId` int(11) NOT NULL,
  `iuserId` int(11) NOT NULL,
  `currancy_id` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `rate_per_words` int(11) NOT NULL,
  `hourly_rate` int(11) NOT NULL,
  `minimum_rate` int(11) NOT NULL,
  `project_price` int(11) NOT NULL,
  `rush_free` int(11) NOT NULL,
  `tp_no_match` int(11) NOT NULL,
  `proofreading_no_match` int(11) NOT NULL,
  `translation_no_match` int(11) NOT NULL,
  `translation` longtext NOT NULL,
  `proofreading` longtext NOT NULL,
  `tep` longtext NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tms_users`
--

CREATE TABLE `tms_users` (
  `iUserId` int(11) NOT NULL,
  `vUserName` varchar(255) NOT NULL,
  `freelancer` enum('freelancer','translation') NOT NULL COMMENT '1=checked,0=unchecked',
  `vEmailAddress` varchar(255) NOT NULL,
  `vSecondaryEmailAddress` varchar(255) NOT NULL,
  `vPassword` varchar(50) NOT NULL,
  `org_pass` varchar(255) NOT NULL,
  `eUserStatus` int(11) NOT NULL,
  `vResourceType` int(11) NOT NULL,
  `vResourcePosition` int(11) NOT NULL,
  `iFkUserTypeId` int(11) NOT NULL,
  `iResourceNumber` varchar(255) NOT NULL,
  `dtCreationDate` datetime NOT NULL,
  `vTimeZone` varchar(50) NOT NULL,
  `vTimeZoneCity` varchar(255) NOT NULL,
  `vUTC` varchar(50) NOT NULL,
  `vFirstName` varchar(50) NOT NULL,
  `vLastName` varchar(50) NOT NULL,
  `dtBirthDate` date NOT NULL,
  `companyName` varchar(50) NOT NULL,
  `vFacebook_id` varchar(50) NOT NULL,
  `vTwitter_id` varchar(50) NOT NULL,
  `vGoogle_plus_id` varchar(50) NOT NULL,
  `iGender` int(11) NOT NULL COMMENT '1=male,2=female,3=other',
  `iMobile` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `vPhoneNumber` varchar(50) NOT NULL,
  `vWebsite` varchar(500) NOT NULL,
  `vSkypeName` varchar(255) NOT NULL,
  `vFileManage` varchar(500) NOT NULL,
  `vEmailTemplate` varchar(255) NOT NULL,
  `tMemo` text NOT NULL,
  `vAddress1` varchar(255) NOT NULL,
  `vAddress2` varchar(255) NOT NULL,
  `address1Detail` longtext NOT NULL,
  `address2Detail` longtext NOT NULL,
  `vSalesId` varchar(255) NOT NULL,
  `vComapanyCode` varchar(255) NOT NULL,
  `vholiday_country` varchar(255) NOT NULL,
  `vProfilePic` varchar(255) NOT NULL,
  `enableDisbaleLoginStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 for enable ,0 for disbale',
  `created_by` int(11) NOT NULL,
  `created_by_name` varchar(255) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `iEditedBy` int(11) NOT NULL,
  `dtLast_job` date NOT NULL,
  `specialization` varchar(255) NOT NULL,
  `csv_import` tinyint(2) NOT NULL DEFAULT '0',
  `tabPermission` text NOT NULL,
  `activation_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=not activated,1=activated',
  `is_available` text NOT NULL COMMENT '1=available,0=un-available(Linguist)',
  `activation_token` varchar(50) NOT NULL,
  `dtCreatedDate` datetime NOT NULL,
  `dtUpdatedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_users`
--

INSERT INTO `tms_users` (`iUserId`, `vUserName`, `freelancer`, `vEmailAddress`, `vSecondaryEmailAddress`, `vPassword`, `org_pass`, `eUserStatus`, `vResourceType`, `vResourcePosition`, `iFkUserTypeId`, `iResourceNumber`, `dtCreationDate`, `vTimeZone`, `vTimeZoneCity`, `vUTC`, `vFirstName`, `vLastName`, `dtBirthDate`, `companyName`, `vFacebook_id`, `vTwitter_id`, `vGoogle_plus_id`, `iGender`, `iMobile`, `vPhoneNumber`, `vWebsite`, `vSkypeName`, `vFileManage`, `vEmailTemplate`, `tMemo`, `vAddress1`, `vAddress2`, `address1Detail`, `address2Detail`, `vSalesId`, `vComapanyCode`, `vholiday_country`, `vProfilePic`, `enableDisbaleLoginStatus`, `created_by`, `created_by_name`, `modified_by`, `iEditedBy`, `dtLast_job`, `specialization`, `csv_import`, `tabPermission`, `activation_status`, `is_available`, `activation_token`, `dtCreatedDate`, `dtUpdatedDate`) VALUES
(1, 'TMS Admin', 'freelancer', 'admin@tmse.com', 'anils7016@gmail.com', '0e7517141fb53f21ee439b355b5a1d0a', 'Admin@123', 3, 2, 2, 1, '1', '2016-01-02 14:59:21', '', '', '', 'TMS', 'Admin', '1991-08-24', '', 'Https://www.google.co.in/?gfe_rd=cr&ei=VRKxWK2GM9e', 'https://www.google.co.in/?gfe_rd=cr&ei=VRKxWK2GM9e', 'https://www.google.co.in/?gfe_rd=cr&ei=VRKxWK2GM9e', 1, '{\"countryTitle\":\"India (भारत): +91\",\"countryFlagClass\":\"iti-flag in\",\"placeHolder\":\"091234 56789\",\"mobileNumber\":\"097128 11223\"}', '', 'http://www.kifuvazejys.com.au/', 'krunal.kanhasoft', '', '', '', '', '', '', '', '', '', '[{\"Cname\":\"Argentina\"},{\"Cname\":\"Australia\"},{\"Cname\":\"Aruba\"}]', '1545300029.jpg', 1, 1, '', 0, 0, '0000-00-00', '', 0, '{\"due_today\":true,\"to_be_assigned\":true,\"in_progress\":true,\"qa_ready\":true,\"to_be_delivered\":true,\"due_tomorrow\":true,\"delivered\":true,\"my_projects\":true}', 1, '', '', '2016-01-02 15:00:40', '2022-11-11 21:06:24'),
(2, 'Anil Nadiya', 'freelancer', 'anil.kanhasoft@gmail.com', '', '202cb962ac59075b964b07152d234b70', '123', 3, 4, 3, 1, '2', '0000-00-00 00:00:00', '', '', '', 'Anil', 'Nadiya', '1991-08-24', '', '', '', '', 1, '{\"countryTitle\":\"India (भारत): +91\",\"countryFlagClass\":\"iti-flag in\",\"placeHolder\":\"091234 56789\",\"mobileNumber\":\"097376 36750\"}', '', '', 'anil.kanhasoft', '', '', '', '', '', '', '', '', '', '', '1667286682.jpg', 1, 1, '', 0, 0, '0000-00-00', '', 0, '{\"due_today\":true,\"in_progress\":true,\"to_be_assigned\":true,\"to_be_delivered\":true,\"qa_ready\":true,\"due_tomorrow\":true,\"delivered\":true,\"my_projects\":true}', 1, '', 'ce361e6629ac56d775a0d792422bca7fbfb8c6d2', '2022-11-01 12:40:07', '2022-12-09 16:45:51'),
(3, 'QA Kanhasoft', 'freelancer', 'qa.kanhasoft@yopmail.com', '', '202cb962ac59075b964b07152d234b70', '123', 3, 3, 4, 1, '3', '0000-00-00 00:00:00', '', '', '', 'QA', 'Kanhasoft', '1991-02-26', '', '', '', '', 1, '{\"countryTitle\":\"India (भारत): +91\",\"countryFlagClass\":\"iti-flag in\",\"placeHolder\":\"091234 56789\",\"mobileNumber\":\"097376 36752\"}', '', '', 'qa.kanhasoft', '', '', '', '', '', '', '', '', '', '', '1667287243.jpg', 1, 1, '', 0, 0, '0000-00-00', '', 0, '{\"due_today\":true,\"to_be_assigned\":true,\"qa_ready\":true,\"in_progress\":true}', 1, '', 'a7830e84ad6adb69e39a3703d633187b237c5419', '2022-11-01 12:50:43', '2022-11-11 14:55:04'),
(4, 'Linguist Kanhasoft', 'freelancer', 'freelance.kanhasoft@yopmail.com', 'anil.kanhasoft@gmail.com', '202cb962ac59075b964b07152d234b70', '123', 3, 4, 0, 2, '1', '2022-11-01 12:57:31', '(GMT 11.25) Asia/Kolkata', 'Ahmedabad', '', 'Linguist', 'Kanhasoft', '1982-06-04', 'Kanhasoft', '', '', '', 1, '{\"countryTitle\":\"India (भारत): +91\",\"countryFlagClass\":\"iti-flag in\",\"mobileNumber\":\"099983 00594\"}', '', 'https://www.kanhasoft.com', 'kanhasoft', '', '', '', 'Kanhasoft', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Ahmedabad\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Norway\"},{\"id\":\"address1_postal_code\",\"value\":\"380015\"}]', '[]', '', '', '', '1667454966.png', 1, 1, '', 1, 4, '2008-11-20', '1,11,21', 0, '', 1, '', '0a18e4856a43d568f57ea07311578b9115343d18', '2022-11-01 12:57:31', '2022-12-12 17:40:44'),
(7, 'Ingvild Sundland', 'freelancer', 'isundland@spellup.no', '', 'fa8a0e73c8342838e150870983e5016e', 'W7Hzs33#f', 3, 2, 2, 1, '5', '0000-00-00 00:00:00', '', '', '', 'Ingvild', 'Sundland', '1987-12-30', '', '', '', '', 2, '{\"countryTitle\":\"Norway (Norge): +47\",\"countryFlagClass\":\"iti-flag no\",\"placeHolder\":\"406 12 345\",\"mobileNumber\":\"940 53 446\"}', '', '', 'isundland', '', '', '', '', '', '', '', '', '', '', '1667905481.png', 1, 1, '', 0, 0, '0000-00-00', '', 0, '{\"due_today\":true,\"to_be_assigned\":true,\"in_progress\":true,\"qa_ready\":true,\"to_be_delivered\":true,\"delivered\":true,\"my_projects\":true,\"due_tomorrow\":true}', 1, '', '81a9b3b1564fee69c4b790ecd52ebe8448091f9f', '2022-11-08 16:34:41', '2022-11-18 01:34:57'),
(8, 'Marika Sundland Lehtimäki', 'freelancer', 'msundland@spellup.no', '', 'be211dbb2fbef790a6284c3f10c2e19f', 'M@3Est-w1k', 3, 2, 0, 2, '2', '2022-11-09 15:23:55', '(GMT 10.46) Europe/Oslo', 'Flateby', '', 'Marika', 'Sundland Lehtimäki', '1995-04-10', 'Marika Sundland Lehtimäki', '', '', '', 2, '{\"countryTitle\":\"Norway (Norge): +47\",\"countryFlagClass\":\"iti-flag no\",\"mobileNumber\":\"467 63 747\"}', '', '', '', '', '', '', 'Odegaardsveien 43J', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Norway\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Flateby\"},{\"id\":\"address1_postal_code\",\"value\":\"1911\"}]', '[]', '', '', '', '1667987635.jpg', 1, 1, '', 1, 8, '0000-00-00', '', 0, '', 1, '', '2c787ec7319f0b76690bb452df849e7c8d0b085d', '2022-11-09 15:23:55', '2022-11-17 21:41:56'),
(10, 'Testkanha Points', 'freelancer', 'Testkaanha0911@yopmail.com', '', '202cb962ac59075b964b07152d234b70', '123', 2, 1, 0, 2, '4', '2022-11-09 18:36:52', '(GMT 18.34) Asia/Kolkata', 'test', '', 'Testkanha', 'Points', '1994-05-20', 'test', '', '', '', 1, '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"(201) 555-5555\"}', '', 'web.com', 'test.comm', '', '', '', 'test', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"United States\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"Florida\"},{\"id\":\"address1_locality\",\"value\":\"test\"},{\"id\":\"address1_postal_code\",\"value\":\"TEST\"}]', '[]', '', '', '', '1667999212.jpg', 1, 1, '', 1, 8, '2020-11-20', '', 0, '', 0, '[\"2022-11-16\"]', 'c7106e6a95a78708c39356816dd24a9a896865a0', '2022-11-09 18:36:52', '2022-11-11 18:48:17'),
(14, 'Solveig T. Sandaas', 'freelancer', 'ssandaas@spellup.no', '', 'cc8e78ba3b51adcfd32e45cdd22ea507', '963963MilK_', 3, 1, 3, 1, '6', '0000-00-00 00:00:00', '', '', '', 'Solveig', 'Sandaas', '1987-01-23', '', '', '', '', 2, '{\"countryTitle\":\"Norway (Norge): +47\",\"countryFlagClass\":\"iti-flag no\",\"placeHolder\":\"406 12 345\",\"mobileNumber\":\"960 19 485\"}', '', '', 'ssandaas', '', '', '', '', '', '', '', '', '', '', '1670256886.jpg', 1, 7, '', 0, 0, '0000-00-00', '', 0, '{\"due_today\":true,\"to_be_assigned\":true,\"in_progress\":true,\"qa_ready\":true,\"to_be_delivered\":true,\"due_tomorrow\":true,\"delivered\":true,\"my_projects\":true}', 1, '', 'fe9f098edc3f4c2802e3069e564e5e7c4402a0ff', '2022-11-18 01:13:56', '2022-12-08 16:14:21'),
(16, 'Marthe Kristoffersen', 'freelancer', 'mkristoffersen@spellup.no', '', 'a906449d5769fa7361d7ecc6aa3f6d28', '123abc', 2, 0, 0, 2, '0005', '2022-11-26 18:24:31', '(GMT 13.54) Europe/Oslo', 'Flateby', '', 'Marthe', 'Kristoffersen', '2000-01-04', 'SpellUp', '', '', '', 2, '{\"countryTitle\":\"Norway (Norge): +47\",\"countryFlagClass\":\"iti-flag no\",\"mobileNumber\":\"940 53 446\"}', '', '', '', '', '', '', 'Ødegaårdsveien 43J', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Norway\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Flateby\"},{\"id\":\"address1_postal_code\",\"value\":\"1911\"}]', '[]', '', '', '', 'user-icon.png', 1, 0, '', 0, 0, '0000-00-00', '', 0, '', 1, '', '39540bbd8d133da420bf22b73f7eab8869c33a3f', '2022-11-26 18:24:31', '2022-11-26 18:24:31'),
(18, 'Aayush KD_KANHASOFT', 'freelancer', 'ayushahm@yopmail.com', '', '4baa51424fde3d9e83b79091622ac3bd', 'm2@I9hNk#k', 3, 0, 0, 2, '6', '2022-11-29 13:11:08', '(GMT 13.11) Asia/Kolkata', 'Mumbai', '', 'Aayush', 'KD_KANHASOFT', '2000-01-10', 'Kanhsoft', '', '', '', 1, '{\"countryTitle\":\"India (भारत): +91\",\"countryFlagClass\":\"iti-flag in\",\"mobileNumber\":\"99934 08740\"}', '', 'www.kanhasoft.com', 'ayush_nd', '', '', '', '257 , Nirnay Nagar', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"India\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"Maharashtra\"},{\"id\":\"address1_locality\",\"value\":\"Mumbai\"},{\"id\":\"address1_postal_code\",\"value\":\"380029\"}]', '[]', '', '', '', '', 1, 1, '', 1, 0, '2020-11-20', '', 0, '', 0, '[\"2022-11-09\"]', 'e82bfd10316f33847b8e3efcae45f3234c83f60d', '2022-11-29 13:11:08', '2022-11-29 14:35:30'),
(19, 'Romeo Kanhasoft', 'freelancer', 'tresmay@yopmail.com', 'trozan@yopmail.com', 'b93cf845fa1a8590baf6045d26a7fb7e', 'eN$pbA^PG5', 3, 0, 0, 2, '7', '2022-11-30 17:41:51', '', '', '', 'Romeo', 'Kanhasoft', '2022-11-01', 'Kanhsoft', '', '', '', 1, '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'craddle.com', '', '', '', '', '', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"\"},{\"id\":\"address1_postal_code\",\"value\":\"\"}]', '[]', '', '', '', '', 1, 1, '', 1, 0, '0000-00-00', '', 0, '', 0, '[\"2022-11-23\"]', '497e03efe6fecb477c9240d5a6e819fdee2f7540', '2022-11-30 17:41:51', '2022-11-30 18:10:09'),
(20, 'Test Account', 'freelancer', 'info@beconnected.no', '', '78a5d28e2d60eef44690ae12f5cb64b8', 'Bhifgi#)C3', 2, 0, 0, 2, '0008', '2022-12-04 23:01:46', '(GMT 18.31) Europe/Oslo', 'Oslo', '', 'Test', 'Account', '1987-12-30', '', '', '', '', 2, '{\"countryTitle\":\"Norway (Norge): +47\",\"countryFlagClass\":\"iti-flag no\",\"mobileNumber\":\"940 53 446\"}', '', '', '', '', '', '', 'Lettvintveien 33B', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Norway\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Oslo\"},{\"id\":\"address1_postal_code\",\"value\":\"0487\"}]', '[]', '', '', '', 'user-icon.png', 1, 0, '', 0, 0, '0000-00-00', '', 0, '', 1, '', 'e45301df27bb5e3860f828afd712a745f5dee625', '2022-12-04 23:01:46', '2022-12-04 23:01:46');

-- --------------------------------------------------------

--
-- Table structure for table `tms_user_contact`
--

CREATE TABLE `tms_user_contact` (
  `iContactId` int(11) NOT NULL,
  `iUserId` int(11) NOT NULL,
  `vFirstName` varchar(255) NOT NULL,
  `vLastName` varchar(255) NOT NULL,
  `vEmail` varchar(255) NOT NULL,
  `vSkype` varchar(255) NOT NULL,
  `vDepartment` varchar(255) NOT NULL,
  `vJobTitle` varchar(255) NOT NULL,
  `vPhone` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `dtCreatedDate` datetime NOT NULL,
  `dtUpdatedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tms_user_position`
--

CREATE TABLE `tms_user_position` (
  `position_id` int(11) NOT NULL,
  `position_name` varchar(50) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_user_position`
--

INSERT INTO `tms_user_position` (`position_id`, `position_name`, `status`, `created_date`, `updated_date`) VALUES
(1, 'Administrator', '1', '2017-03-27 17:12:39', '2022-12-04 00:56:13'),
(2, 'Project Manager', '1', '2017-03-27 17:12:44', '2017-09-28 16:04:45'),
(3, 'Project Coordinator', '1', '2017-03-27 17:12:48', '2022-12-04 00:55:05'),
(4, 'Quality Assurance Specialist', '1', '2017-08-02 12:46:17', '2022-12-04 00:55:27'),
(5, 'Accounting', '1', '2018-04-17 16:18:08', '2022-12-04 00:56:28'),
(15, 'Resource Coordinator', '1', '2018-04-18 16:12:43', '2022-12-04 00:57:22'),
(16, 'Business Developer', '1', '2022-12-04 00:58:06', '2022-12-04 00:58:06'),
(17, 'Office Assistant', '1', '2022-12-04 00:58:43', '2022-12-04 00:58:49');

-- --------------------------------------------------------

--
-- Table structure for table `tms_user_property`
--

CREATE TABLE `tms_user_property` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '1=user, 2=client',
  `property_id` int(11) NOT NULL,
  `value_id` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_user_property`
--

INSERT INTO `tms_user_property` (`id`, `user_id`, `type`, `property_id`, `value_id`, `created_date`, `updated_date`) VALUES
(3, 8, 1, 1, '17', '2022-11-09 15:25:12', '2022-11-09 15:25:12'),
(4, 8, 1, 4, '11', '2022-11-09 15:25:24', '2022-11-09 15:25:24'),
(6, 9, 1, 4, '11', '2022-11-09 17:56:38', '2022-11-09 17:56:38'),
(7, 10, 1, 1, '15', '2022-11-09 18:37:36', '2022-11-09 18:37:36'),
(9, 12, 1, 1, '15,17', '2022-11-11 13:10:41', '2022-11-11 13:10:54'),
(10, 10, 1, 4, '11', '2022-11-11 18:40:22', '2022-11-11 18:40:22'),
(12, 4, 1, 1, '15,16', '2022-11-25 19:10:59', '2022-11-25 19:10:59');

-- --------------------------------------------------------

--
-- Table structure for table `tms_user_status`
--

CREATE TABLE `tms_user_status` (
  `status_id` int(11) NOT NULL,
  `status_type` int(11) NOT NULL COMMENT '1=user, 2=client',
  `status_name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `is_active` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_user_status`
--

INSERT INTO `tms_user_status` (`status_id`, `status_type`, `status_name`, `description`, `is_active`, `created_date`, `updated_date`) VALUES
(2, 1, 'New', 'old', 1, '2015-10-15 12:28:14', '2017-02-08 13:15:11'),
(3, 1, 'Active', 'Active User', 1, '2015-10-15 18:06:28', '2016-07-18 14:48:52'),
(4, 1, 'Inactive', 'Inactive User', 1, '2015-10-15 18:06:46', '2016-07-12 15:15:39'),
(5, 1, 'In Testing', 'New freelancer currently being tested', 1, '2015-10-29 17:44:19', '2022-12-04 01:00:01'),
(8, 2, 'Active', 'Active status', 1, '2015-11-24 14:38:06', '2016-11-28 15:59:12'),
(9, 2, 'Non-Payer', 'Non-Payer', 1, '2015-11-24 14:38:53', '2022-12-04 00:52:05'),
(11, 2, 'Prospect', 'Prospect status', 1, '2015-11-24 14:39:43', '2016-07-19 14:50:45'),
(15, 1, 'Blacklisted', 'test', 1, '2017-03-07 16:21:16', '2022-12-04 01:00:13'),
(26, 1, 'Signup', '', 1, '2022-12-04 01:01:53', '2022-12-04 01:01:53');

-- --------------------------------------------------------

--
-- Table structure for table `tms_user_type`
--

CREATE TABLE `tms_user_type` (
  `iTypeId` int(11) NOT NULL,
  `iResourceType` int(11) NOT NULL COMMENT '1=External, 2=internal',
  `vType` varchar(255) NOT NULL,
  `iDefault` int(11) NOT NULL,
  `eTypeStatus` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `dtCreatedDate` datetime NOT NULL,
  `dtUpdatedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_user_type`
--

INSERT INTO `tms_user_type` (`iTypeId`, `iResourceType`, `vType`, `iDefault`, `eTypeStatus`, `dtCreatedDate`, `dtUpdatedDate`) VALUES
(1, 2, 'Project Coordination', 1, 'Active', '2015-10-24 18:30:16', '2015-10-24 18:30:16'),
(2, 2, 'Project Management', 1, 'Active', '2015-10-24 18:30:25', '2015-10-24 18:30:25'),
(3, 2, 'Quality Assurance', 1, 'Active', '2015-10-24 18:30:36', '2015-10-24 18:30:36'),
(4, 2, 'Resource Department', 1, 'Active', '2015-10-29 17:43:49', '2015-10-29 17:43:49');

-- --------------------------------------------------------

--
-- Table structure for table `tms_workinghour`
--

CREATE TABLE `tms_workinghour` (
  `wh_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `wh_data` text NOT NULL,
  `for_type` int(11) NOT NULL COMMENT '1=current_week,2=for all in month, 3=for current year',
  `wh_type_value` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tms_work_instruction`
--

CREATE TABLE `tms_work_instruction` (
  `w_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `w_source` varchar(255) NOT NULL,
  `w_target` varchar(255) NOT NULL,
  `w_default` int(11) NOT NULL,
  `w_sequence` varchar(255) NOT NULL,
  `w_display` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_work_instruction`
--

INSERT INTO `tms_work_instruction` (`w_id`, `job_id`, `w_source`, `w_target`, `w_default`, `w_sequence`, `w_display`, `created_date`, `modified_date`) VALUES
(2, 9, '', '', 0, '', 0, '2022-11-03 22:04:08', '2022-11-03 22:04:08');

-- --------------------------------------------------------

--
-- Table structure for table `tms_work_instructs`
--

CREATE TABLE `tms_work_instructs` (
  `id` int(11) NOT NULL,
  `instruct_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(11) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tms_work_instructs`
--

INSERT INTO `tms_work_instructs` (`id`, `instruct_name`, `is_active`, `created_date`, `modified_date`) VALUES
(1, 'Translate file(s).', 1, '2021-06-11 14:20:07', '2021-06-22 11:31:47'),
(2, 'Run spell check', 1, '2021-06-11 14:20:07', '2021-06-22 17:32:48'),
(3, 'Run Qa in MemoQ', 1, '2021-06-11 14:20:07', '2021-06-11 14:20:07'),
(9, 'loream', 0, '2021-06-22 17:34:25', '2021-06-22 17:34:25'),
(17, 'ABC, xyz', 1, '2021-06-22 17:45:47', '2021-06-22 17:57:47'),
(18, 'Use test@gmial.com email to collect data', 1, '2021-06-22 19:43:20', '2021-06-22 19:43:20'),
(19, 'test triooo', 1, '2021-06-23 18:47:13', '2021-06-23 18:47:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tms_additional_info`
--
ALTER TABLE `tms_additional_info`
  ADD PRIMARY KEY (`add_id`),
  ADD KEY `iUserId` (`user_id`);

--
-- Indexes for table `tms_banking_info`
--
ALTER TABLE `tms_banking_info`
  ADD PRIMARY KEY (`bank_id`);

--
-- Indexes for table `tms_centers`
--
ALTER TABLE `tms_centers`
  ADD PRIMARY KEY (`center_id`);

--
-- Indexes for table `tms_child_price_unit`
--
ALTER TABLE `tms_child_price_unit`
  ADD PRIMARY KEY (`child_price_id`);

--
-- Indexes for table `tms_client`
--
ALTER TABLE `tms_client`
  ADD PRIMARY KEY (`iClientId`);

--
-- Indexes for table `tms_client_contact`
--
ALTER TABLE `tms_client_contact`
  ADD PRIMARY KEY (`iContactId`);

--
-- Indexes for table `tms_client_indirect`
--
ALTER TABLE `tms_client_indirect`
  ADD PRIMARY KEY (`iClientId`);

--
-- Indexes for table `tms_country`
--
ALTER TABLE `tms_country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tms_currency`
--
ALTER TABLE `tms_currency`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indexes for table `tms_customer`
--
ALTER TABLE `tms_customer`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `tms_customer_group`
--
ALTER TABLE `tms_customer_group`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `tms_customer_price_list`
--
ALTER TABLE `tms_customer_price_list`
  ADD PRIMARY KEY (`price_list_id`);

--
-- Indexes for table `tms_dateformat`
--
ALTER TABLE `tms_dateformat`
  ADD PRIMARY KEY (`dateformat_id`);

--
-- Indexes for table `tms_decimal_separator`
--
ALTER TABLE `tms_decimal_separator`
  ADD PRIMARY KEY (`separator_id`);

--
-- Indexes for table `tms_directclientlogin`
--
ALTER TABLE `tms_directclientlogin`
  ADD PRIMARY KEY (`iClientId`);

--
-- Indexes for table `tms_directiory`
--
ALTER TABLE `tms_directiory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tms_discussion`
--
ALTER TABLE `tms_discussion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tms_email_sign`
--
ALTER TABLE `tms_email_sign`
  ADD PRIMARY KEY (`sign_id`);

--
-- Indexes for table `tms_email_templates`
--
ALTER TABLE `tms_email_templates`
  ADD PRIMARY KEY (`template_id`);

--
-- Indexes for table `tms_emojitext`
--
ALTER TABLE `tms_emojitext`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tms_events`
--
ALTER TABLE `tms_events`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `tms_favourite_menu`
--
ALTER TABLE `tms_favourite_menu`
  ADD PRIMARY KEY (`fvrt_menu_id`);

--
-- Indexes for table `tms_filemanager`
--
ALTER TABLE `tms_filemanager`
  ADD PRIMARY KEY (`fmanager_id`);

--
-- Indexes for table `tms_general`
--
ALTER TABLE `tms_general`
  ADD PRIMARY KEY (`general_id`);

--
-- Indexes for table `tms_invoice`
--
ALTER TABLE `tms_invoice`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `tms_invoice_client`
--
ALTER TABLE `tms_invoice_client`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `tms_invoice_client_payments`
--
ALTER TABLE `tms_invoice_client_payments`
  ADD PRIMARY KEY (`partial_payment_id`);

--
-- Indexes for table `tms_invoice_due_period`
--
ALTER TABLE `tms_invoice_due_period`
  ADD PRIMARY KEY (`invoice_due_id`);

--
-- Indexes for table `tms_invoice_payments`
--
ALTER TABLE `tms_invoice_payments`
  ADD PRIMARY KEY (`partial_payment_id`);

--
-- Indexes for table `tms_items`
--
ALTER TABLE `tms_items`
  ADD PRIMARY KEY (`itemId`);

--
-- Indexes for table `tms_item_status`
--
ALTER TABLE `tms_item_status`
  ADD PRIMARY KEY (`item_status_id`);

--
-- Indexes for table `tms_jobs`
--
ALTER TABLE `tms_jobs`
  ADD PRIMARY KEY (`job_id`);

--
-- Indexes for table `tms_job_chain`
--
ALTER TABLE `tms_job_chain`
  ADD PRIMARY KEY (`job_chain_id`);

--
-- Indexes for table `tms_job_events`
--
ALTER TABLE `tms_job_events`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `tms_job_workinghour`
--
ALTER TABLE `tms_job_workinghour`
  ADD PRIMARY KEY (`wh_id`);

--
-- Indexes for table `tms_knowledge_articles`
--
ALTER TABLE `tms_knowledge_articles`
  ADD PRIMARY KEY (`article_id`);

--
-- Indexes for table `tms_knowledge_category`
--
ALTER TABLE `tms_knowledge_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `tms_knowledge_events`
--
ALTER TABLE `tms_knowledge_events`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `tms_knowledge_news`
--
ALTER TABLE `tms_knowledge_news`
  ADD PRIMARY KEY (`k_news_id`);

--
-- Indexes for table `tms_knowledge_pic`
--
ALTER TABLE `tms_knowledge_pic`
  ADD PRIMARY KEY (`pic_id`);

--
-- Indexes for table `tms_know_pic_comment`
--
ALTER TABLE `tms_know_pic_comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `tms_know_pic_like`
--
ALTER TABLE `tms_know_pic_like`
  ADD PRIMARY KEY (`like_pic_id`);

--
-- Indexes for table `tms_language`
--
ALTER TABLE `tms_language`
  ADD PRIMARY KEY (`lang_id`);

--
-- Indexes for table `tms_languages`
--
ALTER TABLE `tms_languages`
  ADD PRIMARY KEY (`lang_id`);

--
-- Indexes for table `tms_log_master`
--
ALTER TABLE `tms_log_master`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `tms_mail_format`
--
ALTER TABLE `tms_mail_format`
  ADD PRIMARY KEY (`mail_id`);

--
-- Indexes for table `tms_master_price`
--
ALTER TABLE `tms_master_price`
  ADD PRIMARY KEY (`master_price_id`);

--
-- Indexes for table `tms_new_job`
--
ALTER TABLE `tms_new_job`
  ADD PRIMARY KEY (`new_job_id`);

--
-- Indexes for table `tms_order`
--
ALTER TABLE `tms_order`
  ADD PRIMARY KEY (`order_id`);
ALTER TABLE `tms_order` ADD FULLTEXT KEY `abbrivation` (`abbrivation`);

--
-- Indexes for table `tms_passwordreset_tbl`
--
ALTER TABLE `tms_passwordreset_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tms_payment`
--
ALTER TABLE `tms_payment`
  ADD PRIMARY KEY (`iPaymentId`);

--
-- Indexes for table `tms_price_list`
--
ALTER TABLE `tms_price_list`
  ADD PRIMARY KEY (`price_listId`);

--
-- Indexes for table `tms_price_unit`
--
ALTER TABLE `tms_price_unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tms_project_status`
--
ALTER TABLE `tms_project_status`
  ADD PRIMARY KEY (`pr_status_id`);

--
-- Indexes for table `tms_project_type`
--
ALTER TABLE `tms_project_type`
  ADD PRIMARY KEY (`pr_type_id`);

--
-- Indexes for table `tms_proj_language`
--
ALTER TABLE `tms_proj_language`
  ADD PRIMARY KEY (`pl_id`);

--
-- Indexes for table `tms_property`
--
ALTER TABLE `tms_property`
  ADD PRIMARY KEY (`property_id`);

--
-- Indexes for table `tms_property_values`
--
ALTER TABLE `tms_property_values`
  ADD PRIMARY KEY (`value_id`);

--
-- Indexes for table `tms_report_image`
--
ALTER TABLE `tms_report_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tms_resource_assets`
--
ALTER TABLE `tms_resource_assets`
  ADD PRIMARY KEY (`resourceId`);

--
-- Indexes for table `tms_rounding`
--
ALTER TABLE `tms_rounding`
  ADD PRIMARY KEY (`rounding_id`);

--
-- Indexes for table `tms_service`
--
ALTER TABLE `tms_service`
  ADD PRIMARY KEY (`sId`);

--
-- Indexes for table `tms_specialization`
--
ALTER TABLE `tms_specialization`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tms_summmery_view`
--
ALTER TABLE `tms_summmery_view`
  ADD PRIMARY KEY (`job_summmeryId`);

--
-- Indexes for table `tms_summmery_view_sorting`
--
ALTER TABLE `tms_summmery_view_sorting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tms_task`
--
ALTER TABLE `tms_task`
  ADD PRIMARY KEY (`iTaskId`);

--
-- Indexes for table `tms_task_type`
--
ALTER TABLE `tms_task_type`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `tms_tax`
--
ALTER TABLE `tms_tax`
  ADD PRIMARY KEY (`tax_id`);

--
-- Indexes for table `tms_team`
--
ALTER TABLE `tms_team`
  ADD PRIMARY KEY (`team_id`);

--
-- Indexes for table `tms_userprice_list`
--
ALTER TABLE `tms_userprice_list`
  ADD PRIMARY KEY (`price_listId`);

--
-- Indexes for table `tms_users`
--
ALTER TABLE `tms_users`
  ADD PRIMARY KEY (`iUserId`);

--
-- Indexes for table `tms_user_contact`
--
ALTER TABLE `tms_user_contact`
  ADD PRIMARY KEY (`iContactId`);

--
-- Indexes for table `tms_user_position`
--
ALTER TABLE `tms_user_position`
  ADD PRIMARY KEY (`position_id`);

--
-- Indexes for table `tms_user_property`
--
ALTER TABLE `tms_user_property`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tms_user_status`
--
ALTER TABLE `tms_user_status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `tms_user_type`
--
ALTER TABLE `tms_user_type`
  ADD PRIMARY KEY (`iTypeId`);

--
-- Indexes for table `tms_workinghour`
--
ALTER TABLE `tms_workinghour`
  ADD PRIMARY KEY (`wh_id`);

--
-- Indexes for table `tms_work_instruction`
--
ALTER TABLE `tms_work_instruction`
  ADD PRIMARY KEY (`w_id`);

--
-- Indexes for table `tms_work_instructs`
--
ALTER TABLE `tms_work_instructs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tms_additional_info`
--
ALTER TABLE `tms_additional_info`
  MODIFY `add_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tms_banking_info`
--
ALTER TABLE `tms_banking_info`
  MODIFY `bank_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tms_centers`
--
ALTER TABLE `tms_centers`
  MODIFY `center_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tms_child_price_unit`
--
ALTER TABLE `tms_child_price_unit`
  MODIFY `child_price_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `tms_client`
--
ALTER TABLE `tms_client`
  MODIFY `iClientId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tms_client_contact`
--
ALTER TABLE `tms_client_contact`
  MODIFY `iContactId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tms_client_indirect`
--
ALTER TABLE `tms_client_indirect`
  MODIFY `iClientId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tms_country`
--
ALTER TABLE `tms_country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `tms_currency`
--
ALTER TABLE `tms_currency`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tms_customer`
--
ALTER TABLE `tms_customer`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `tms_customer_group`
--
ALTER TABLE `tms_customer_group`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tms_customer_price_list`
--
ALTER TABLE `tms_customer_price_list`
  MODIFY `price_list_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tms_dateformat`
--
ALTER TABLE `tms_dateformat`
  MODIFY `dateformat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tms_decimal_separator`
--
ALTER TABLE `tms_decimal_separator`
  MODIFY `separator_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tms_directclientlogin`
--
ALTER TABLE `tms_directclientlogin`
  MODIFY `iClientId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tms_directiory`
--
ALTER TABLE `tms_directiory`
  MODIFY `id` int(7) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tms_discussion`
--
ALTER TABLE `tms_discussion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tms_email_sign`
--
ALTER TABLE `tms_email_sign`
  MODIFY `sign_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tms_email_templates`
--
ALTER TABLE `tms_email_templates`
  MODIFY `template_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tms_emojitext`
--
ALTER TABLE `tms_emojitext`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tms_events`
--
ALTER TABLE `tms_events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tms_favourite_menu`
--
ALTER TABLE `tms_favourite_menu`
  MODIFY `fvrt_menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tms_filemanager`
--
ALTER TABLE `tms_filemanager`
  MODIFY `fmanager_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=678;

--
-- AUTO_INCREMENT for table `tms_general`
--
ALTER TABLE `tms_general`
  MODIFY `general_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `tms_invoice`
--
ALTER TABLE `tms_invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tms_invoice_client`
--
ALTER TABLE `tms_invoice_client`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tms_invoice_client_payments`
--
ALTER TABLE `tms_invoice_client_payments`
  MODIFY `partial_payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tms_invoice_due_period`
--
ALTER TABLE `tms_invoice_due_period`
  MODIFY `invoice_due_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tms_invoice_payments`
--
ALTER TABLE `tms_invoice_payments`
  MODIFY `partial_payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tms_items`
--
ALTER TABLE `tms_items`
  MODIFY `itemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `tms_item_status`
--
ALTER TABLE `tms_item_status`
  MODIFY `item_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tms_jobs`
--
ALTER TABLE `tms_jobs`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tms_job_chain`
--
ALTER TABLE `tms_job_chain`
  MODIFY `job_chain_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tms_job_events`
--
ALTER TABLE `tms_job_events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tms_job_workinghour`
--
ALTER TABLE `tms_job_workinghour`
  MODIFY `wh_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tms_knowledge_articles`
--
ALTER TABLE `tms_knowledge_articles`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tms_knowledge_category`
--
ALTER TABLE `tms_knowledge_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `tms_knowledge_events`
--
ALTER TABLE `tms_knowledge_events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tms_knowledge_news`
--
ALTER TABLE `tms_knowledge_news`
  MODIFY `k_news_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tms_knowledge_pic`
--
ALTER TABLE `tms_knowledge_pic`
  MODIFY `pic_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tms_know_pic_comment`
--
ALTER TABLE `tms_know_pic_comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tms_know_pic_like`
--
ALTER TABLE `tms_know_pic_like`
  MODIFY `like_pic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tms_language`
--
ALTER TABLE `tms_language`
  MODIFY `lang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tms_languages`
--
ALTER TABLE `tms_languages`
  MODIFY `lang_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `tms_log_master`
--
ALTER TABLE `tms_log_master`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=350;

--
-- AUTO_INCREMENT for table `tms_mail_format`
--
ALTER TABLE `tms_mail_format`
  MODIFY `mail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tms_master_price`
--
ALTER TABLE `tms_master_price`
  MODIFY `master_price_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tms_new_job`
--
ALTER TABLE `tms_new_job`
  MODIFY `new_job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tms_order`
--
ALTER TABLE `tms_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `tms_passwordreset_tbl`
--
ALTER TABLE `tms_passwordreset_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tms_payment`
--
ALTER TABLE `tms_payment`
  MODIFY `iPaymentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tms_price_list`
--
ALTER TABLE `tms_price_list`
  MODIFY `price_listId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tms_price_unit`
--
ALTER TABLE `tms_price_unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tms_project_status`
--
ALTER TABLE `tms_project_status`
  MODIFY `pr_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tms_project_type`
--
ALTER TABLE `tms_project_type`
  MODIFY `pr_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tms_proj_language`
--
ALTER TABLE `tms_proj_language`
  MODIFY `pl_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tms_property`
--
ALTER TABLE `tms_property`
  MODIFY `property_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tms_property_values`
--
ALTER TABLE `tms_property_values`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `tms_report_image`
--
ALTER TABLE `tms_report_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tms_resource_assets`
--
ALTER TABLE `tms_resource_assets`
  MODIFY `resourceId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tms_rounding`
--
ALTER TABLE `tms_rounding`
  MODIFY `rounding_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tms_service`
--
ALTER TABLE `tms_service`
  MODIFY `sId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tms_specialization`
--
ALTER TABLE `tms_specialization`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tms_summmery_view`
--
ALTER TABLE `tms_summmery_view`
  MODIFY `job_summmeryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `tms_summmery_view_sorting`
--
ALTER TABLE `tms_summmery_view_sorting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tms_task`
--
ALTER TABLE `tms_task`
  MODIFY `iTaskId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tms_task_type`
--
ALTER TABLE `tms_task_type`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tms_tax`
--
ALTER TABLE `tms_tax`
  MODIFY `tax_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tms_team`
--
ALTER TABLE `tms_team`
  MODIFY `team_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tms_userprice_list`
--
ALTER TABLE `tms_userprice_list`
  MODIFY `price_listId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tms_users`
--
ALTER TABLE `tms_users`
  MODIFY `iUserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tms_user_contact`
--
ALTER TABLE `tms_user_contact`
  MODIFY `iContactId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tms_user_position`
--
ALTER TABLE `tms_user_position`
  MODIFY `position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tms_user_property`
--
ALTER TABLE `tms_user_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tms_user_status`
--
ALTER TABLE `tms_user_status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tms_user_type`
--
ALTER TABLE `tms_user_type`
  MODIFY `iTypeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tms_workinghour`
--
ALTER TABLE `tms_workinghour`
  MODIFY `wh_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tms_work_instruction`
--
ALTER TABLE `tms_work_instruction`
  MODIFY `w_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tms_work_instructs`
--
ALTER TABLE `tms_work_instructs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
