-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 30, 2023 at 07:20 AM
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
(1, 'Bank Transfer', 'Revolut Bank UAB', 'Konstitucijos pr. 21b, 08130 Vilnius, Lithuania', 'SpellUp AS', 'EUR,€', 'LT73 3250 0792 0252 8674', 'REVOLT21', '-', '-', 1, '2022-03-23 17:12:07', '2022-12-15 18:33:23'),
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
(78, 11, 'Hour(s) Testing', '', '1.00', '', 'Hours', '', 1, '2022-12-04 01:53:18', '2022-12-04 01:53:18'),
(79, 2, 'Unit(s) Proofreading', '', '0', '', 'Units', '', 1, '2022-12-15 23:49:35', '2022-12-15 23:49:35');

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
  `invoice_no_of_days` int(111) NOT NULL,
  `created_id` int(11) NOT NULL,
  `modified_id` int(255) NOT NULL,
  `iEditedBy` int(11) NOT NULL,
  `dtCreatedDate` datetime NOT NULL,
  `dtUpdatedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_client`
--

INSERT INTO `tms_client` (`iClientId`, `vUserName`, `vCodeInvoice`, `vCodeRights`, `vEmailAddress`, `vPhone`, `vSkype`, `vLogo`, `vWebsite`, `vAddress1`, `vAddress2`, `address1Detail`, `address2Detail`, `iBussinessDeveloper`, `vProjectCoordinator`, `vProjectManager`, `vQASpecialist`, `vCustomerType`, `company_branch_project`, `company_branch_invoice`, `vStatus`, `iSaleId`, `vTextType`, `vClientNumber`, `dtCreationDate`, `iTemplate`, `vVatNumber`, `tMemo`, `tPoInfo`, `tPofor`, `Invoice`, `customer_group`, `project_branch`, `client_currency`, `invoice_no_of_days`, `created_id`, `modified_id`, `iEditedBy`, `dtCreatedDate`, `dtUpdatedDate`) VALUES
(1, 'Capita', '', 'SPE_', '', '{\"countryTitle\":\"Afghanistan (‫افغانستان‬‎): +93\",\"countryFlagClass\":\"iti-flag af\",\"mobileNumber\":\"01618801966\"}', '', '1667227384.jpg', 'https://www.capitatranslationinterpreting.com/', 'Riverside Court, Huddersfield Road', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"United Kingdom\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"Oldham\"},{\"id\":\"address1_locality\",\"value\":\"Delph\"},{\"id\":\"address1_postal_code\",\"value\":\"OL3 5FZ\"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 09.42) America/Chicago\"}]', '[]', 0, '', '', '', '', '', '', '11', 0, '', '1', '2022-10-31 00:00:00', 0, '', '', 'capita-001', '', '', '', 'Norway', 'EUR,€', 0, 1, 1, 0, '2022-11-17 21:46:58', '2022-11-17 21:46:58'),
(2, 'Berba Translations S.L.', '', 'SPE_', '', '{\"countryTitle\":\"Spain (España): +34\",\"countryFlagClass\":\"iti-flag es\",\"mobileNumber\":\"+3434946780202\"}', '', '1667227538.png', 'www.berba.com', 'Buenos Aires Kalea 12', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Spain\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"N/A\"},{\"id\":\"address1_locality\",\"value\":\"Bilbao\"},{\"id\":\"address1_postal_code\",\"value\":\"48001\"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 15.45) Europe/Madrid\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '2', '2022-10-31 00:00:00', 0, '', '', 'berba-translations-s.l.-002', '', '', '', 'Norway', 'EUR,€', 0, 1, 1, 0, '2022-11-11 23:38:47', '2022-11-11 23:38:47'),
(3, 'Datawords Datasia SARL', '', 'SPEU_', '', '{\"countryTitle\":\"Spain (España): +34\",\"countryFlagClass\":\"iti-flag es\",\"mobileNumber\":\"645 65 94 11\"}', '', '1667910596.png', 'https://www.datawords.com', 'Gran Via de les Corts Catalanes 641', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Spain\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"N/A\"},{\"id\":\"address1_locality\",\"value\":\"Entresuelo, Barcelona\"},{\"id\":\"address1_postal_code\",\"value\":\"08010\"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 15.50) Europe/Madrid\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '3', '2022-10-31 00:00:00', 0, '', '', 'datawords-datasia-sarl-003', '', '', '', 'Norway', 'EUR,€', 0, 1, 7, 0, '2023-01-13 13:55:01', '2023-01-13 13:55:01'),
(4, 'Kanhasoft Test Client', '', 'KNH16', '', '{\"countryTitle\":\"India (भारत): +91\",\"countryFlagClass\":\"iti-flag in\",\"mobileNumber\":\"097376 36754\"}', '', '1667288037.png', 'kanhasoft.com', 'Kanhasoft', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Norway\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Ahmedabad\"},{\"id\":\"address1_postal_code\",\"value\":\"380058\"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 13.03) Asia/Kolkata\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '4', '2022-11-01 00:00:00', 0, '', '', 'kanhasoft-test-008888', '', '', '', 'Norway', 'EUR,€', 0, 1, 1, 0, '2022-12-01 10:38:15', '2022-12-01 10:38:15'),
(5, 'ICS Translate', '', 'SPE_', '', '{\"countryTitle\":\"United Kingdom: +44\",\"countryFlagClass\":\"iti-flag gb\",\"mobileNumber\":\"0113 430 1272\"}', '', '1667486314.png', 'https://www.ics-translate.com/', '2 Park Lane', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"United Kingdom\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"N/A\"},{\"id\":\"address1_locality\",\"value\":\"Leeds\"},{\"id\":\"address1_postal_code\",\"value\":\"LS3 1ES\"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 14.35) Europe/London\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '5', '2022-11-03 00:00:00', 0, '', '', 'ics-translate-005', '', '', '', 'Norway', 'GBP,£', 0, 1, 1, 0, '2022-11-17 14:54:39', '2022-11-17 14:54:39'),
(8, 'JT Language Solutions', '', 'SPE22', '', '{\"countryTitle\":\"United Kingdom: +44\",\"countryFlagClass\":\"iti-flag gb\",\"mobileNumber\":\"07748 777267\"}', '', '1668075764.jpg', 'https://jt-languagesolutions.com', 'Bornholmerstr. 93', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Germany\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Berlin\"},{\"id\":\"address1_postal_code\",\"value\":\"10439\"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 11.22) Europe/Berlin\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '6', '2022-11-10 00:00:00', 0, '', '', '', '', '', '', 'Norway', 'EUR,€', 0, 1, 1, 0, '2022-11-11 16:58:22', '2022-11-11 16:58:22'),
(9, 'Scorewarrior Limited', '', 'SPEU_', '', '{\"countryTitle\":\"Cyprus (Κύπρος): +357\",\"countryFlagClass\":\"iti-flag cy\",\"mobileNumber\":\"25 211945\"}', '', '1668162959.png', 'https://scorewarrior.com/', '16 Spyrou Kyprianou, Divine Clock Tower, 1st floor', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Cyprus\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Limassol\"},{\"id\":\"address1_postal_code\",\"value\":\"3070\"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 12.33) Asia/Nicosia\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '7', '2022-11-11 00:00:00', 0, '', '', '', '', '', '', 'Norway', 'EUR,€', 0, 7, 1, 1, '2022-12-20 12:07:01', '2022-12-20 12:07:01'),
(10, 'Maxsun International (HK) LTD', '', 'SPE_', '', '{\"countryTitle\":\"Norway (Norge): +47\",\"countryFlagClass\":\"iti-flag no\",\"mobileNumber\":\"960 19 485\"}', '', '1668597374.png', 'https://maxsuntranslation.com/', '12th-F, R&F To-Win Building,No.30 Huaxia, Road, Tianhe District, Guangzho', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"China\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"Guangzhou\"},{\"id\":\"address1_locality\",\"value\":\"Guangdong Province\"},{\"id\":\"address1_postal_code\",\"value\":\"\"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 16.30) Asia/Shanghai\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '8', '2022-11-16 00:00:00', 0, '', '', '', '', '', '', 'Norway', 'EUR,€', 0, 1, 7, 0, '2023-01-13 14:00:15', '2023-01-13 14:00:15'),
(11, 'Intrawelt', '', 'SPEU_', '', '{\"countryTitle\":\"Italy (Italia): +39\",\"countryFlagClass\":\"iti-flag it\",\"mobileNumber\":\"06 4543 7779\"}', '', '1668598148.jpg', 'https://intrawelt.com', 'Old Broad St 25', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"United Kingdom\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"London\"},{\"id\":\"address1_postal_code\",\"value\":\"EC2N 1HN\"},{\"id\":\"address1_vTimezone\",\"value\":\"\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '9', '2022-11-16 00:00:00', 0, '', '', '', '', '', '', 'Norway', 'EUR,€', 0, 1, 7, 0, '2023-01-13 14:01:27', '2023-01-13 14:01:27'),
(14, 'Lingsoft Language Services Oy', '', 'SPE_', '', '{\"countryTitle\":\"Finland (Suomi): +358\",\"countryFlagClass\":\"iti-flag fi\",\"mobileNumber\":\"02 2793300\"}', '', '1669894396.png', 'https://www.lingsoft.fi', 'Kauppiaskatu 5 A', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Finland\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Turku\"},{\"id\":\"address1_postal_code\",\"value\":\"FI-20100\"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 13.33) Europe/Helsinki\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '10', '2022-12-01 00:00:00', 0, '', '', 'lingsoft-010', '', '', '', 'Norway', 'EUR,€', 45, 1, 7, 0, '2023-01-13 21:17:57', '2023-01-13 21:18:33'),
(15, 'Intertranslations', '', 'SPE_', '', '{\"countryTitle\":\"Greece (Ελλάδα): +30\",\"countryFlagClass\":\"iti-flag gr\",\"mobileNumber\":\"21 0922 5000\"}', '', '1669904131.png', 'https://www.intertranslations.gr/', 'El. Venizelou 4', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Greece\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Kallithea\"},{\"id\":\"address1_postal_code\",\"value\":\"17676\"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 16.15) Europe/Athens\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '10', '2022-12-01 19:45:31', 0, '', '', 'intertranslations-010', '', '', '', 'Norway', 'EUR,€', 0, 1, 0, 0, '2022-12-01 19:45:31', '2022-12-01 19:45:31'),
(16, 'Qontent Group', '', 'SPE_', '', '{\"countryTitle\":\"Italy (Italia): +39\",\"countryFlagClass\":\"iti-flag it\",\"mobileNumber\":\"+39 080 472 2864\"}', '', '1669905148.png', 'https://www.qontentgroup.com', 'via Achille Salvucci n. 6 – 6/A – 6/B', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Italy\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Molfetta (BA)\"},{\"id\":\"address1_postal_code\",\"value\":\"70056\"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 15.32) Europe/Rome\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '10', '2022-12-01 20:02:28', 0, '', '', 'qontent-group-010', '', '', '', 'Norway', 'EUR,€', 0, 1, 0, 0, '2022-12-01 20:02:28', '2022-12-01 20:02:28'),
(17, 'Snelvertaler BV', '', 'SPEU_', '', '{\"countryTitle\":\"Sweden (Sverige): +46\",\"countryFlagClass\":\"iti-flag se\",\"mobileNumber\":\"01146858097877\"}', '', '1670253144.png', 'https://www.fasttranslator.com', 'Rooseveltweg 11E', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Netherlands\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Almere\"},{\"id\":\"address1_postal_code\",\"value\":\"1314 SJ\"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 12.19) Europe/Amsterdam\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '10', '2022-12-05 00:00:00', 0, '', '', 'fasttranslator-010', '', '', '', 'Norway', 'EUR,€', 0, 1, 14, 0, '2023-01-05 16:49:58', '2023-01-05 16:49:58'),
(18, 'Supertext AG', '', 'SPEU_', '', '{\"countryTitle\":\"Switzerland (Schweiz): +41\",\"countryFlagClass\":\"iti-flag ch\",\"mobileNumber\":\"+41 43 500 33 80\"}', '', '1670428343.png', 'https://www.supertext.ch/', 'Hardturmstrasse 253', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Switzerland\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Zurich\"},{\"id\":\"address1_postal_code\",\"value\":\"8005 \"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 16.52) Europe/Zurich\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '10', '2022-12-07 21:22:23', 0, '', '', 'supertext-ag-010', '', '', '', 'Norway', 'EUR,€', 0, 14, 0, 0, '2022-12-07 21:22:23', '2022-12-07 21:22:23'),
(19, 'MSS Cape Town The Language Agency', '', 'SPEU_', '', '{\"countryTitle\":\"Germany (Deutschland): +49\",\"countryFlagClass\":\"iti-flag de\",\"mobileNumber\":\"0531 224593040\"}', '', '1671127458.png', 'https://msskapstadt.de/', 'Unit 28, Roeland Square, Roeland St, Gardens', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"South Africa\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Cape Town\"},{\"id\":\"address1_postal_code\",\"value\":\"8001\"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 10.34) Africa/Johannesburg\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '10', '2022-12-15 00:00:00', 0, '', '', 'mss-cape-town-the-language-agency-010', '', '', '', 'Norway', 'EUR,€', 0, 14, 7, 7, '2023-01-13 14:04:38', '2023-01-13 14:04:38'),
(20, 'GTH Translation', '', 'SPEU_', '', '{\"countryTitle\":\"United Kingdom: +44\",\"countryFlagClass\":\"iti-flag gb\",\"mobileNumber\":\"+44 7308 577353\"}', '', '1671129625.jpg', 'https://gthtranslation.com/', '86 Athinon str. Nora Court, 6th Floor', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Cyprus\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Limassol\"},{\"id\":\"address1_postal_code\",\"value\":\"Limassol\"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 20.40) Asia/Nicosia\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '10', '2022-12-16 00:10:25', 0, '', '', 'gth-translation-010', '', '', '', 'Norway', 'EUR,€', 0, 14, 0, 0, '2022-12-16 00:10:25', '2022-12-16 00:10:25'),
(21, 'RWS Moravia', '', 'SPEU_', '', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', '1671130380.png', 'https://www.rws.com/legal/copyright/', 'Prikop 15', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Czech Republic\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Brno\"},{\"id\":\"address1_postal_code\",\"value\":\"602 00\"},{\"id\":\"address1_vTimezone\",\"value\":\"\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '10', '2022-12-16 00:00:00', 0, '', '', 'rws-moravia-010', '', '', '', 'Norway', 'EUR,€', 0, 14, 7, 0, '2023-01-13 14:05:41', '2023-01-13 14:05:41'),
(22, 'Mars Translation', '', 'SPEU_', '', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"(248) 579-0856\"}', '', '1672066494.png', 'https://www.marstranslation.com/', '34556 Bunker Hill Dr', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"United States\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"Michigan\"},{\"id\":\"address1_locality\",\"value\":\"Farmington Hills\"},{\"id\":\"address1_postal_code\",\"value\":\"48331\"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 09.54) America/Detroit\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '10', '2022-12-26 20:24:54', 0, '', '', 'mars-translation-010', '', '', '', 'Norway', 'USD,$', 0, 7, 0, 0, '2022-12-26 20:24:54', '2022-12-26 20:24:54'),
(23, 'GSL Shenzhen (Glodom Language Solutions)', '', 'SPEU_', '', '{\"countryTitle\":\"China (中国): +86\",\"countryFlagClass\":\"iti-flag cn\",\"mobileNumber\":\"186 8201 3327\"}', '', '1672129588.png', 'https://www.glodomtec.com/', 'Room 1510, Chinese Overseas Scholars Venture Building, Shenzhen Hi-tech Industry Park, Nanshan District', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"China\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"Guangdong\"},{\"id\":\"address1_locality\",\"value\":\"Shenzhen \"},{\"id\":\"address1_postal_code\",\"value\":\"\"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 23.09) Asia/Shanghai\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '10', '2022-12-26 00:00:00', 0, '', '', 'gsl-shenzhen-(glodom-language-solutions)-010', '', '', '', 'Norway', 'EUR,€', 0, 7, 7, 0, '2022-12-27 13:56:28', '2022-12-27 13:56:28'),
(24, 'Attached - Language Intelligence', '', 'SPEU_', '', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', '1672747560.png', 'https://attachedglobal.com/en/', 'WTC The Hague (Tower C, 12th Floor), Prinses Beatrixlaan 582', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Netherlands\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"BM The Hague\"},{\"id\":\"address1_postal_code\",\"value\":\"2595\"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 13.05) Europe/Amsterdam\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '10', '2023-01-03 17:36:00', 0, '', '', 'attached---language-intelligence-010', '', '', '', 'Norway', 'EUR,€', 45, 7, 0, 0, '2023-01-03 17:36:00', '2023-01-13 14:20:40'),
(25, 'SDL Norway', '', 'SPEU_', '', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', '1672907787.png', '', 'Munkedamsveien 45A', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Norway\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Oslo\"},{\"id\":\"address1_postal_code\",\"value\":\"0250\"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 09.36) Europe/Oslo\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '10', '2023-01-05 14:06:27', 0, '', '', 'sdl-norway-010', '', '', '', 'Norway', 'EUR,€', 45, 7, 0, 0, '2023-01-05 14:06:27', '2023-01-05 16:41:03'),
(26, 'SDL Limited | United Kingdom - Maidenhead', '', 'SPEU_', '', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', '1672913451.png', 'https://www.rws.com/', 'New Globe House Vanwall Business Park Vanwall Road', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"United Kingdom\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Maidenhead\"},{\"id\":\"address1_postal_code\",\"value\":\"SL6 4UB\"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 10.10) Europe/London\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '10', '2023-01-05 15:40:51', 0, '', '', 'sdl-limited-|-united-kingdom---maidenhead-010', '', '', '', 'Norway', 'EUR,€', 45, 7, 0, 0, '2023-01-05 15:40:51', '2023-01-05 15:43:18'),
(27, 'Jonckers', '', 'SPEU_', '', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', '', 'https://www.jonckers.com', 'Westfalendamm 98', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Germany\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Dortmund\"},{\"id\":\"address1_postal_code\",\"value\":\"44141 \"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 19.50) Europe/Berlin\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '10', '2023-01-25 00:20:57', 0, '', '', 'jonckers-010', '', '', '', 'Norway', 'EUR,€', 0, 14, 0, 0, '2023-01-25 00:20:57', '2023-01-25 00:20:57'),
(28, 'Summa Linguae Technologies Canada Inc.', '', 'SPEU_', '', '{\"countryTitle\":\"Canada: +1\",\"countryFlagClass\":\"iti-flag ca\",\"mobileNumber\":\"1 855-438-5106\"}', '', '', 'https://summalinguae.com', '16-135 595 Burrard Street', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Canada\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Vancouver\"},{\"id\":\"address1_postal_code\",\"value\":\"BC V7X 1L4\"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 11.12) America/Vancouver\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '10', '2023-01-25 00:42:20', 0, '', '', 'summa-linguae-technologies-canada-inc.-010', '', '', '', 'Norway', 'EUR,€', 0, 14, 0, 0, '2023-01-25 00:42:20', '2023-01-25 00:42:20'),
(29, 'Lingospell Srl', '', 'SPEU_', '', '{\"countryTitle\":\"Italy (Italia): +39\",\"countryFlagClass\":\"iti-flag it\",\"mobileNumber\":\"+39 348 408 4783\"}', '', '', 'https://lingospell.com', 'Via Teodosio, 44', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Italy\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Milan \"},{\"id\":\"address1_postal_code\",\"value\":\"20131\"},{\"id\":\"address1_vTimezone\",\"value\":\"\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '10', '2023-01-29 23:42:31', 0, '', '', 'lingospell-srl-010', '', '', '', 'Norway', 'EUR,€', 0, 14, 0, 0, '2023-01-29 23:42:31', '2023-01-29 23:42:31');

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
(19, 15, 0, 'Artemisia', 'Kseinou', 'a.kseinou@intertranslations.com', '', 'Junior Vendor Manager', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2022-12-01 19:46:07', '2022-12-01 19:46:07'),
(20, 16, 0, 'Silvia', 'Capobianco', 's.capobianco@qontentgroup.com', '', 'Senior Project Manager', '{\"countryTitle\":\"Italy (Italia): +39\",\"countryFlagClass\":\"iti-flag it\",\"mobileNumber\":\"+39 080 472 2864\"}', '', 'active', '', '2022-12-01 20:03:03', '2022-12-01 20:03:03'),
(21, 3, 0, 'Laura', 'Sounalath', 'lasounalath@datawords.com', '', '', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2022-12-01 22:11:50', '2022-12-01 22:11:50'),
(22, 3, 0, 'Katia', 'Stamati', 'kastamati@datawords.com', '', 'Project Manager', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2022-12-02 14:52:28', '2022-12-02 14:52:28'),
(23, 17, 0, 'Odd', 'Hedmyr', 'odd.hedmyr@fasttranslator.com', '', 'Project Manager', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2022-12-05 20:42:59', '2022-12-05 20:42:59'),
(24, 3, 0, 'Morgane', 'Jarrin', 'mjarrin@datawords.com', '', '', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2022-12-05 20:58:27', '2022-12-05 20:58:27'),
(25, 18, 0, 'Silvia', 'Ramos', 'ramos@supertext.de', '', 'Project Manager', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2022-12-07 21:22:50', '2022-12-07 21:22:50'),
(26, 19, 0, 'Laura', 'Wieland', 'laura.wieland@msskapstadt.de', '', 'Project Manager', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2022-12-15 23:34:49', '2022-12-15 23:34:49'),
(27, 20, 0, 'Ildiko', 'Gyimesi', 'ildiko@gthtranslation.com', '', 'Solutions Architect', '{\"countryTitle\":\"Cyprus (??????): +357\",\"countryFlagClass\":\"iti-flag cy\",\"mobileNumber\":\"+357 25 544210\"}', '', 'active', '', '2022-12-16 00:11:13', '2022-12-16 00:11:13'),
(28, 21, 0, 'Solveig', 'Sandaas', 'ssandaas@beconnected.no', '', '', '{\"countryTitle\":\"Norway (Norge): +47\",\"countryFlagClass\":\"iti-flag no\",\"mobileNumber\":\"+47 960 19 485\"}', '', 'active', '', '2022-12-16 00:23:27', '2022-12-16 00:23:27'),
(29, 14, 0, 'Katerina', 'Nývltová', 'katerina.nyvltova@lingsoft.fi', '', 'Service Coordinator', '{\"countryTitle\":\"Finland (Suomi): +358\",\"countryFlagClass\":\"iti-flag fi\",\"mobileNumber\":\"+358 40 6810697\"}', '', 'active', '', '2022-12-16 13:50:49', '2022-12-16 13:50:49'),
(30, 22, 0, 'Mars Online', 'Platform', 'notification@marstranslation.com', '', '', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2022-12-26 20:25:24', '2022-12-26 20:25:24'),
(31, 23, 0, 'Ling', 'Zhaoxiao', 'zhaoxiaoling@glodomtec.com', '', '', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2022-12-26 20:40:31', '2022-12-26 20:40:31'),
(32, 23, 0, 'Alice', 'Han', 'alicehan@hkgsl.com', '', '', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2022-12-26 20:46:35', '2022-12-26 20:46:35'),
(33, 5, 0, 'Lena', 'Wiedemann', 'lena.wiedemann@ics-translate.com', '', '', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2022-12-27 14:02:53', '2022-12-27 14:02:53'),
(34, 24, 0, 'Silvia', 'Carli', 'silviacarli@attachedglobal.com', '', '', '{\"countryTitle\":\"Netherlands (Nederland): +31\",\"countryFlagClass\":\"iti-flag nl\",\"mobileNumber\":\"+31 70 345 9401\"}', '', 'active', '', '2023-01-03 17:36:22', '2023-01-03 17:36:22'),
(35, 14, 0, 'Lingsoft', 'Team', 'noreply@lingsoft.fi', '', '', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2023-01-03 18:31:14', '2023-01-03 18:31:14'),
(36, 24, 0, 'Nilab', 'Mohammad', 'nilabmohammad@attachedglobal.com', '', '', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2023-01-04 20:41:11', '2023-01-04 20:41:11'),
(37, 24, 0, 'Seleytin', 'Dzhelilov', 'seleytindzhelilov@attachedglobal.com', '', '', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2023-01-04 20:41:29', '2023-01-04 20:41:29'),
(38, 14, 0, 'Liisa', 'Nykopp', 'liisa.nykopp@lingsoft.fi', '', '', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2023-01-05 14:00:46', '2023-01-05 14:00:46'),
(39, 25, 0, 'Sindre', 'Svanes', 'ssvanes@rws.com', '', '', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2023-01-05 14:06:48', '2023-01-05 14:06:48'),
(40, 25, 0, 'Ole Kristian', 'Sørensen', 'osorensen@rws.com', '', '', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2023-01-05 14:07:07', '2023-01-05 14:07:07'),
(41, 25, 0, 'Anne', 'Sandvik Hedlund', 'ashedlund@rws.com', '', '', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2023-01-05 14:07:29', '2023-01-05 14:07:29'),
(42, 25, 0, 'Oxana', 'Vasilchikova', 'ovasilchikova@rws.com', '', '', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2023-01-05 14:24:28', '2023-01-05 14:24:28'),
(43, 26, 0, 'Violeta', 'Lacroze', 'vlacroze@sdl.com', '', '', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2023-01-05 15:41:26', '2023-01-05 15:41:26'),
(44, 17, 0, 'Thomas', 'Vink', 'thomas.vink@fasttranslator.com', '', '', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2023-01-12 15:17:14', '2023-01-12 15:17:14'),
(45, 16, 0, 'Linda', 'Andriani', 'l.andriani@qontentgroup.com', '', 'Vendor Manager', '{\"countryTitle\":\"Italy (Italia): +39\",\"countryFlagClass\":\"iti-flag it\",\"mobileNumber\":\"+39 080 472 2864\"}', '', 'active', '', '2023-01-12 17:44:47', '2023-01-12 17:44:47'),
(46, 16, 0, 'Qontent', 'Accounting', 'a.salierno@qontentgroup.com', '', '', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2023-01-13 21:28:03', '2023-01-13 21:28:03'),
(47, 25, 0, 'SDL Norway', 'Team', 'noreply@rws.com', '', '', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2023-01-15 16:29:44', '2023-01-15 16:29:44'),
(48, 20, 0, 'GTH', 'Accounting', 'vm-invoices@gthtranslation.com', '', '', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2023-01-18 13:53:15', '2023-01-18 13:53:15'),
(49, 19, 0, 'MSS', 'Accounting', 'billing@msskapstadt.de', '', '', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2023-01-18 13:56:09', '2023-01-18 13:56:09'),
(50, 27, 0, 'Michaela', 'Vargova', 'Michaela.Vargova@jonckers.com', '', 'Regional Community Manager', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2023-01-25 00:21:35', '2023-01-25 00:21:35'),
(51, 27, 0, 'Michaela', 'Vargova', 'Michaela.Vargova@jonckers.com', '', 'Regional Community Manager', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2023-01-25 00:23:46', '2023-01-25 00:23:46'),
(52, 28, 0, 'Summa Linguae Technologies Canada', 'Team', 'sysadmin@globalme.net', '', '', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2023-01-25 00:42:51', '2023-01-25 00:42:51'),
(53, 29, 0, 'Chiara', 'Benzoni', 'chiara@lingospell.com', '', 'Junior Project Manager', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2023-01-29 23:43:02', '2023-01-29 23:43:02');

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
(19, 'Tesla', 19, 'https://www.tesla.com/', '', '', 0, '2022-12-12 17:45:05', '2022-12-12 17:45:05'),
(20, 'Resorba', 20, 'https://resorba.com/', '', '', 0, '2022-12-15 23:37:07', '2022-12-15 23:37:07'),
(21, 'Shopify', 21, 'https://www.shopify.com/', '', '', 0, '2022-12-15 23:53:23', '2022-12-15 23:53:23'),
(22, 'Derivco', 22, 'https://derivco.com/', '', '', 0, '2022-12-15 23:54:55', '2022-12-15 23:54:55'),
(23, 'Cartier', 23, 'https://www.cartier.com/en-us/home', '', '', 0, '2022-12-26 19:33:51', '2022-12-26 19:33:51'),
(24, 'Kiko Cosmetics', 24, 'https://www.kikocosmetics.com/en-no/', '', '', 0, '2022-12-26 19:43:38', '2022-12-26 19:43:38'),
(25, 'Fujifilm', 25, 'https://global.fujifilm.com/en/', '', '', 0, '2022-12-26 20:47:31', '2022-12-26 20:47:31'),
(26, 'XGIMI', 26, 'https://global.xgimi.com/', '', '', 0, '2022-12-27 14:13:21', '2022-12-27 14:13:21'),
(27, 'Clarins', 27, 'https://www.clarins.es/', '', '', 0, '2023-01-03 17:24:38', '2023-01-03 17:24:38'),
(28, 'Norwegian Air', 28, 'https://www.norwegian.no/', '', '', 0, '2023-01-03 17:38:44', '2023-01-03 17:38:44'),
(29, 'LG', 29, 'https://www.lg.com/', '', '', 0, '2023-01-03 18:31:44', '2023-01-03 18:31:44'),
(30, 'PayPal', 30, 'https://www.paypal.com/', '', '', 0, '2023-01-03 18:43:57', '2023-01-03 18:43:57'),
(31, 'Yahoo', 31, 'yahoo.com', '', '', 0, '2023-01-03 18:45:56', '2023-01-03 18:45:56'),
(32, 'Google', 32, 'www.google.com', '', '', 0, '2023-01-04 20:26:22', '2023-01-04 20:26:22'),
(33, 'KLM (KLM Royal Dutch Airlines)', 33, 'https://www.klm.com/', '', '', 0, '2023-01-15 17:09:29', '2023-01-15 17:09:29'),
(34, 'MGR', 34, 'https://www.mgr.no/', '', '', 0, '2023-01-05 14:13:04', '2023-01-05 14:13:04'),
(35, 'Canon', 35, 'https://global.canon/en/index.html', '', '', 0, '2023-01-05 14:13:50', '2023-01-05 14:13:50'),
(36, 'Lindex', 36, 'https://www.lindex.com/', '', '', 0, '2023-01-05 14:14:20', '2023-01-05 14:14:20'),
(38, 'BMS', 38, 'https://www.bms.com/', '', '', 0, '2023-01-05 14:15:32', '2023-01-05 14:15:32'),
(39, 'Man Group', 39, 'https://www.man.com/', '', '', 0, '2023-01-05 14:16:10', '2023-01-05 14:16:10'),
(40, 'Tussitaikurit', 40, 'https://tussitaikurit.fi/', '', '', 0, '2023-01-25 00:57:16', '2023-01-25 00:57:16'),
(41, 'Foreo', 41, 'https://www.foreo.com', '', '', 0, '2023-01-29 23:44:02', '2023-01-29 23:44:02');

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
(9, 27, 5, '4', 3, '2', '1', '3', 0, 0, 0, '', '2022-11-03 21:58:05', '2022-12-26 17:40:32'),
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
(23, 55, 9, '10', 7, '2', '7', '3', 0, 0, 0, '', '2022-11-11 16:23:15', '2023-01-30 10:57:02'),
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
(73, 129, 14, '18', 13, '14', '1', '3', 0, 0, 0, '', '2022-12-12 18:02:45', '2022-12-12 18:02:45'),
(74, 132, 19, '26', 20, '14', '1', '3', 0, 0, 0, '', '2022-12-15 23:38:21', '2022-12-15 23:38:21'),
(75, 133, 16, '20', 3, '14', '1', '3', 0, 0, 0, '', '2022-12-15 23:42:41', '2022-12-15 23:42:41'),
(76, 134, 16, '20', 22, '14', '1', '3', 0, 0, 0, '', '2022-12-15 23:56:21', '2022-12-15 23:56:21'),
(77, 135, 20, '27', 3, '14', '1', '3', 0, 0, 0, '', '2022-12-16 00:14:10', '2022-12-16 00:14:10'),
(78, 136, 3, '8', 5, '14', '1', '3', 0, 0, 0, '', '2022-12-16 00:17:49', '2022-12-16 00:17:49'),
(79, 137, 21, '28', 21, '14', '1', '3', 0, 0, 0, '', '2022-12-16 00:24:49', '2022-12-16 00:24:49'),
(80, 138, 16, '20', 3, '14', '1', '3', 0, 0, 0, '', '2022-12-16 00:39:49', '2022-12-16 00:39:49'),
(81, 140, 14, '29', 3, '14', '1', '3', 0, 0, 0, '', '2022-12-16 13:51:45', '2022-12-16 13:51:45'),
(82, 142, 3, '21', 23, '14', '7', '3', 0, 0, 0, '', '2022-12-26 19:34:32', '2022-12-26 19:34:32'),
(83, 143, 3, '17', 5, '14', '7', '3', 0, 0, 0, '', '2022-12-26 19:37:38', '2022-12-26 19:37:38'),
(84, 144, 3, '21', 24, '14', '7', '3', 0, 0, 0, '', '2022-12-26 19:44:19', '2022-12-26 19:44:19'),
(85, 145, 3, '21', 23, '14', '7', '3', 0, 0, 0, '', '2022-12-26 19:52:14', '2022-12-26 19:52:14'),
(86, 146, 22, '30', 3, '14', '7', '3', 0, 0, 0, '', '2022-12-26 20:31:17', '2022-12-26 20:31:17'),
(87, 149, 23, '32', 25, '14', '7', '3', 0, 0, 0, '', '2022-12-26 20:48:07', '2022-12-26 20:48:15'),
(88, 150, 5, '33', 8, '14', '7', '3', 0, 0, 0, '', '2022-12-27 14:01:11', '2022-12-27 14:03:05'),
(89, 151, 23, '31', 26, '14', '7', '3', 0, 0, 0, '', '2022-12-27 14:13:47', '2022-12-27 14:13:54'),
(90, 152, 16, '20', 22, '14', '7', '3', 0, 0, 0, '', '2022-12-27 14:20:47', '2022-12-27 14:20:47'),
(91, 153, 3, '21', 23, '14', '7', '3', 0, 0, 0, '', '2022-12-27 14:34:08', '2022-12-27 14:34:08'),
(92, 154, 23, '32', 25, '14', '7', '3', 0, 0, 0, '', '2022-12-27 14:37:20', '2022-12-27 14:37:20'),
(93, 155, 5, '33', 3, '14', '1', '3', 0, 0, 0, '', '2022-12-29 12:21:40', '2022-12-29 12:21:40'),
(94, 156, 3, '24', 27, '14', '7', '3', 0, 0, 0, '', '2023-01-03 17:25:12', '2023-01-03 17:25:21'),
(95, 157, 3, '8', 5, '14', '7', '3', 0, 0, 0, '', '2023-01-03 17:27:48', '2023-01-03 17:27:48'),
(96, 158, 24, '34', 28, '14', '7', '3', 0, 0, 0, '', '2023-01-03 17:39:21', '2023-01-03 17:39:21'),
(97, 159, 24, '34', 28, '14', '7', '3', 0, 0, 0, '', '2023-01-03 17:46:36', '2023-01-03 17:46:36'),
(98, 160, 24, '34', 28, '14', '7', '3', 0, 0, 0, '', '2023-01-03 17:49:01', '2023-01-03 17:49:01'),
(99, 161, 14, '29', 3, '14', '7', '3', 0, 0, 0, '', '2023-01-03 18:26:48', '2023-01-03 18:26:48'),
(100, 162, 14, '29', 13, '14', '7', '3', 0, 0, 0, '', '2023-01-03 18:28:38', '2023-01-03 18:28:38'),
(101, 164, 14, '35', 29, '14', '7', '3', 0, 0, 0, '', '2023-01-03 18:32:21', '2023-01-03 18:32:21'),
(102, 166, 14, '35', 29, '14', '7', '3', 0, 0, 0, '', '2023-01-03 18:40:45', '2023-01-03 18:40:45'),
(103, 167, 14, '35', 29, '14', '7', '3', 0, 0, 0, '', '2023-01-03 18:42:44', '2023-01-03 18:42:44'),
(104, 168, 14, '35', 30, '14', '7', '3', 0, 0, 0, '', '2023-01-03 18:44:29', '2023-01-03 18:44:29'),
(105, 169, 14, '35', 31, '14', '7', '3', 0, 0, 0, '', '2023-01-03 18:46:31', '2023-01-03 18:46:31'),
(106, 170, 23, '32', 3, '14', '1', '3', 0, 0, 0, '', '2023-01-04 19:54:58', '2023-01-04 19:54:58'),
(107, 171, 5, '33', 3, '14', '1', '3', 0, 0, 0, '', '2023-01-04 20:01:08', '2023-01-04 20:01:08'),
(108, 172, 23, '32', 3, '14', '1', '3', 0, 0, 0, '', '2023-01-04 20:05:02', '2023-01-04 20:05:02'),
(109, 173, 21, '28', 32, '14', '1', '3', 0, 0, 0, '', '2023-01-04 20:27:21', '2023-01-04 20:27:21'),
(110, 174, 23, '32', 25, '14', '7', '3', 0, 0, 0, '', '2023-01-04 20:30:41', '2023-01-05 15:53:20'),
(111, 176, 24, '36', 3, '14', '7', '3', 0, 0, 0, '', '2023-01-04 20:42:32', '2023-01-04 20:42:32'),
(112, 176, 24, '36', 3, '', '', '', 0, 0, 0, '', '2023-01-04 20:42:33', '2023-01-04 20:42:33'),
(113, 177, 24, '34', 28, '14', '7', '3', 0, 0, 0, '', '2023-01-05 13:37:18', '2023-01-05 13:37:18'),
(114, 178, 24, '36', 33, '14', '7', '3', 0, 0, 0, '', '2023-01-05 13:47:29', '2023-01-05 13:47:29'),
(115, 179, 23, '32', 25, '14', '7', '3', 0, 0, 0, '', '2023-01-05 13:50:17', '2023-01-05 13:50:17'),
(116, 180, 23, '31', 26, '14', '7', '3', 0, 0, 0, '', '2023-01-05 13:54:00', '2023-01-05 13:54:00'),
(117, 181, 16, '20', 22, '14', '7', '3', 0, 0, 0, '', '2023-01-05 13:56:22', '2023-01-05 13:56:22'),
(118, 182, 14, '35', 29, '14', '7', '3', 0, 0, 0, '', '2023-01-05 13:58:41', '2023-01-05 13:58:41'),
(119, 184, 14, '38', 30, '14', '7', '3', 0, 0, 0, '', '2023-01-05 14:01:26', '2023-01-05 14:01:26'),
(120, 185, 9, '10', 7, '14', '7', '3', 0, 0, 0, '', '2023-01-05 14:03:06', '2023-01-05 14:03:06'),
(121, 186, 25, '39', 34, '14', '7', '3', 0, 0, 0, '', '2023-01-05 14:17:21', '2023-01-05 14:17:21'),
(122, 187, 25, '40', 35, '14', '7', '3', 0, 0, 0, '', '2023-01-05 14:20:52', '2023-01-05 14:20:52'),
(123, 189, 25, '42', 36, '14', '7', '3', 0, 0, 0, '', '2023-01-05 14:25:10', '2023-01-05 14:25:10'),
(124, 192, 25, '42', 32, '14', '7', '3', 0, 0, 0, '', '2023-01-05 14:34:53', '2023-01-05 14:34:53'),
(125, 193, 25, '42', 35, '14', '7', '3', 0, 0, 0, '', '2023-01-05 14:38:19', '2023-01-05 14:38:19'),
(126, 194, 25, '42', 39, '14', '7', '3', 0, 0, 0, '', '2023-01-05 14:45:35', '2023-01-05 14:45:35'),
(127, 195, 25, '42', 32, '14', '7', '3', 0, 0, 0, '', '2023-01-05 14:54:04', '2023-01-05 14:54:04'),
(128, 197, 26, '43', 38, '14', '7', '3', 0, 0, 0, '', '2023-01-05 15:43:59', '2023-01-05 15:43:59'),
(129, 198, 9, '10', 7, '14', '7', '3', 0, 0, 0, '', '2023-01-05 16:32:19', '2023-01-05 16:32:19'),
(130, 199, 14, '35', 14, '14', '7', '3', 0, 0, 0, '', '2023-01-10 23:59:11', '2023-01-10 23:59:11'),
(131, 200, 17, '23', 3, '14', '7', '3', 0, 0, 0, '', '2023-01-12 15:13:54', '2023-01-12 15:13:54'),
(132, 201, 16, '45', 3, '14', '7', '3', 0, 0, 0, '', '2023-01-12 17:45:57', '2023-01-12 17:45:57'),
(133, 203, 25, '47', 32, '14', '7', '3', 0, 0, 0, '', '2023-01-15 16:30:17', '2023-01-15 16:30:17'),
(134, 204, 24, '36', 33, '14', '7', '3', 0, 0, 0, '', '2023-01-15 17:10:19', '2023-01-15 17:10:19'),
(135, 205, 25, '47', 32, '14', '7', '3', 0, 0, 0, '', '2023-01-17 01:24:22', '2023-01-17 01:24:22'),
(136, 207, 9, '10', 7, '14', '7', '3', 0, 0, 0, '', '2023-01-17 01:36:03', '2023-01-17 01:36:03'),
(137, 208, 14, '35', 30, '14', '7', '3', 0, 0, 0, '', '2023-01-18 13:40:55', '2023-01-18 13:40:55'),
(138, 209, 23, '32', 3, '14', '7', '3', 0, 0, 0, '', '2023-01-18 13:57:27', '2023-01-18 13:57:27'),
(139, 210, 8, '9', 3, '14', '7', '3', 0, 0, 0, '', '2023-01-18 13:59:34', '2023-01-18 13:59:34'),
(140, 211, 3, '22', 16, '14', '7', '3', 0, 0, 0, '', '2023-01-18 14:01:59', '2023-01-18 14:01:59'),
(141, 212, 21, '28', 21, '14', '7', '3', 0, 0, 0, '', '2023-01-24 00:58:34', '2023-01-24 00:58:34'),
(142, 214, 27, '50', 3, '14', '7', '3', 0, 0, 0, '', '2023-01-25 00:24:31', '2023-01-25 00:24:31'),
(143, 215, 27, '50', 3, '14', '7', '3', 0, 0, 0, '', '2023-01-25 00:26:25', '2023-01-25 00:26:25'),
(144, 217, 27, '50', 3, '14', '7', '3', 0, 0, 0, '', '2023-01-25 00:29:13', '2023-01-25 00:29:13'),
(145, 218, 14, '35', 13, '14', '7', '3', 0, 0, 0, '', '2023-01-25 00:30:59', '2023-01-25 00:30:59'),
(146, 219, 24, '36', 3, '14', '7', '3', 0, 0, 0, '', '2023-01-25 00:37:34', '2023-01-25 00:37:34'),
(147, 220, 28, '52', 3, '14', '7', '3', 0, 0, 0, '', '2023-01-25 00:43:54', '2023-01-25 00:43:54'),
(148, 221, 5, '33', 8, '14', '7', '3', 0, 0, 0, '', '2023-01-25 00:46:36', '2023-01-25 00:46:36'),
(149, 222, 23, '32', 3, '14', '7', '3', 0, 0, 0, '', '2023-01-25 00:48:44', '2023-01-25 00:48:44'),
(150, 223, 14, '35', 13, '14', '7', '3', 0, 0, 0, '', '2023-01-25 00:50:24', '2023-01-25 00:50:24'),
(151, 224, 26, '43', 3, '14', '7', '3', 0, 0, 0, '', '2023-01-25 00:54:11', '2023-01-25 00:54:11'),
(152, 225, 23, '32', 3, '14', '7', '2', 0, 0, 0, '', '2023-01-25 00:55:59', '2023-01-25 00:55:59'),
(153, 226, 14, '35', 40, '14', '7', '3', 0, 0, 0, '', '2023-01-25 00:58:10', '2023-01-25 00:58:10'),
(154, 227, 21, '28', 32, '14', '7', '3', 0, 0, 0, '', '2023-01-25 23:25:08', '2023-01-25 23:25:08'),
(155, 228, 14, '35', 40, '14', '7', '3', 0, 0, 0, '', '2023-01-25 23:31:19', '2023-01-25 23:31:19'),
(156, 229, 21, '28', 21, '14', '7', '3', 0, 0, 0, '', '2023-01-25 23:34:21', '2023-01-25 23:34:21'),
(157, 230, 24, '34', 3, '14', '7', '3', 0, 0, 0, '', '2023-01-25 23:47:28', '2023-01-25 23:47:28'),
(158, 231, 14, '35', 3, '14', '7', '3', 0, 0, 0, '', '2023-01-25 23:49:30', '2023-01-25 23:49:30'),
(159, 232, 16, '20', 3, '14', '7', '3', 0, 0, 0, '', '2023-01-25 23:51:49', '2023-01-25 23:51:49'),
(160, 233, 9, '10', 7, '14', '7', '3', 0, 0, 0, '', '2023-01-25 23:53:52', '2023-01-25 23:53:52'),
(161, 234, 27, '50', 3, '14', '7', '3', 0, 0, 0, '', '2023-01-25 23:57:10', '2023-01-25 23:57:10'),
(162, 235, 14, '38', 30, '14', '7', '3', 0, 0, 0, '', '2023-01-25 23:59:01', '2023-01-25 23:59:01'),
(163, 236, 27, '50', 3, '14', '7', '3', 0, 0, 0, '', '2023-01-26 00:02:12', '2023-01-26 00:02:12'),
(164, 237, 14, '35', 12, '14', '7', '3', 0, 0, 0, '', '2023-01-26 00:09:50', '2023-01-26 00:09:50'),
(165, 238, 9, '10', 7, '14', '7', '3', 0, 0, 0, '', '2023-01-26 00:11:47', '2023-01-26 00:11:47'),
(166, 239, 14, '35', 29, '14', '7', '3', 0, 0, 0, '', '2023-01-26 00:14:18', '2023-01-26 00:14:18'),
(167, 240, 16, '20', 3, '14', '7', '3', 0, 0, 0, '', '2023-01-26 00:18:37', '2023-01-26 00:18:37'),
(168, 241, 16, '20', 3, '14', '7', '3', 0, 0, 0, '', '2023-01-26 00:25:13', '2023-01-26 00:25:13'),
(169, 242, 21, '28', 21, '14', '7', '3', 0, 0, 0, '', '2023-01-26 00:27:47', '2023-01-26 00:27:47'),
(170, 243, 21, '28', 32, '14', '7', '3', 0, 0, 0, '', '2023-01-26 00:30:13', '2023-01-26 00:30:13'),
(171, 244, 3, '21', 23, '14', '7', '3', 0, 0, 0, '', '2023-01-26 00:40:15', '2023-01-26 00:40:15'),
(172, 245, 27, '50', 3, '14', '7', '3', 0, 0, 0, '', '2023-01-29 23:22:10', '2023-01-29 23:22:10'),
(173, 246, 16, '20', 3, '14', '7', '3', 0, 0, 0, '', '2023-01-29 23:24:45', '2023-01-29 23:24:45'),
(174, 247, 21, '28', 32, '14', '7', '3', 0, 0, 0, '', '2023-01-29 23:29:47', '2023-01-29 23:29:47'),
(175, 248, 21, '28', 21, '14', '7', '3', 0, 0, 0, '', '2023-01-29 23:37:08', '2023-01-29 23:37:08'),
(176, 249, 29, '53', 41, '14', '7', '3', 0, 0, 0, '', '2023-01-29 23:44:59', '2023-01-29 23:44:59'),
(177, 250, 21, '28', 21, '14', '7', '3', 0, 0, 0, '', '2023-01-29 23:47:12', '2023-01-29 23:47:12');

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
(3, 1, 4, 'Kanhasoft Test | ENG>ENG | General', 'NOK,kr', '', '', '6', '4', '[{\"languagePrice\":\"English (UK) > English (US)\"}]', '[{\"baseQuentity\":\"10\",\"basePricecheck\":1,\"basePriceUnit\":\"Minimum Fee\",\"basePrice\":\"0.45\",\"standardTime\":\"\",\"childPriceId\":\"12\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"100\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"1.45\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"150\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 85-94% Match\",\"basePrice\":\"1.00\",\"standardTime\":\"\",\"childPriceId\":\"4\",\"masterPriceId\":\"1\"}]', '', '2022-12-27 14:23:41', '2022-12-27 14:23:41'),
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
(24, 1, 4, 'Kanhasoft Test | ENG>NOR | IT', 'NOK,kr', '', '', '3', '1,2,3,4,5,6,7,8,9,10,11,12,13,14', '[{\"languagePrice\":\"Danish > Estonian\"},{\"languagePrice\":\"English (US) > Norwegian (nynorsk)\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"0.084\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 50-74% Match\",\"basePrice\":\"0.50\",\"standardTime\":\"\",\"childPriceId\":\"2\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Minimum Fee\",\"basePrice\":\"3.08\",\"standardTime\":\"\",\"childPriceId\":\"12\",\"masterPriceId\":\"1\"}]', '', '2022-12-21 19:04:29', '2022-12-21 19:04:29'),
(25, 1, 14, 'Lingsoft | ENG>NOR | Finance', 'EUR,€', '', '', '0', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79', '[{\"languagePrice\":\"English > Norwegian (bokmal)\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Hour(s) Proofreading\",\"basePrice\":\"40.00\",\"standardTime\":\"\",\"childPriceId\":\"22\",\"masterPriceId\":\"2\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"0.11\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 50-74% Match\",\"basePrice\":\"0.11\",\"standardTime\":\"\",\"childPriceId\":\"2\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 75-84% Match\",\"basePrice\":\"0.044\",\"standardTime\":\"\",\"childPriceId\":\"3\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 85-94% Match\",\"basePrice\":\"0.027\",\"standardTime\":\"\",\"childPriceId\":\"4\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 95-99% Match\",\"basePrice\":\"0.027\",\"standardTime\":\"\",\"childPriceId\":\"5\",\"masterPriceId\":\"1\"}]', '', '2022-12-01 18:04:43', '2022-12-01 18:04:43'),
(26, 1, 5, 'ICS Translate | ENG>NOR | Finance', 'GBP,£', '', '', '0', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79', '[{\"languagePrice\":\"English > Norwegian (bokmal)\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Proofreading (New)\",\"basePrice\":\"0.03\",\"standardTime\":\"\",\"childPriceId\":\"14\",\"masterPriceId\":\"2\"}]', '', '2022-12-01 17:47:18', '2022-12-01 17:47:18'),
(27, 1, 11, 'Intrawelt | ENG>NOR | Finance', 'EUR,€', '', '', '0', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79', '[{\"languagePrice\":\"English > Norwegian (bokmal)\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"0.11\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation Fuzzy Match\",\"basePrice\":\"0.06\",\"standardTime\":\"\",\"childPriceId\":\"9\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation Repetitions\",\"basePrice\":\"0.015\",\"standardTime\":\"\",\"childPriceId\":\"8\",\"masterPriceId\":\"1\"}]', '', '2022-12-05 21:31:34', '2022-12-05 21:31:34'),
(28, 1, 3, 'DATAWORDS DATASIA SARL | ENG>NOR | Finance', 'EUR,€', '', '', '0', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79', '[{\"languagePrice\":\"English > Norwegian (bokmal)\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Hour(s) Proofreading\",\"basePrice\":\"40.00\",\"standardTime\":\"\",\"childPriceId\":\"22\",\"masterPriceId\":\"2\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"0.10\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"}]', '', '2022-12-05 15:15:09', '2022-12-05 15:15:09'),
(29, 1, 17, 'Fasttranslator | ENG>NOR | Automotive', 'EUR,€', '', '', '0', '1,2,3,4,5,6,7,8,9,10,11,12,13,14', '[{\"languagePrice\":\"English > Norwegian (bokmal)\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"0.11\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"}]', '', '2022-12-05 20:48:36', '2022-12-05 20:48:36'),
(30, 1, 4, 'Kanhasoft Test Client | ENG>RUS | General-it-legal', 'EUR,€', '', '', '1', '5,6,7', '[{\"languagePrice\":\"English (UK) > Russian\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Subtitling without Time Coding\",\"basePrice\":\"1.00\",\"standardTime\":\"\",\"childPriceId\":\"44\",\"masterPriceId\":\"8\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Minute(s) Subtitling with Time Coding\",\"basePrice\":\"1.00\",\"standardTime\":\"\",\"childPriceId\":\"43\",\"masterPriceId\":\"8\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Minute(s) Subtitling without Time Coding\",\"basePrice\":\"1.00\",\"standardTime\":\"\",\"childPriceId\":\"42\",\"masterPriceId\":\"8\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Subtitling with Time Coding\",\"basePrice\":\"1.00\",\"standardTime\":\"\",\"childPriceId\":\"45\",\"masterPriceId\":\"8\"}]', '', '2022-12-12 19:12:45', '2022-12-12 19:12:45'),
(31, 1, 19, 'MSS Cape Town The Language Agency | ENG>NOR | Automotive', 'EUR,€', '', '', '0', '1,2,3,4,5,6,7,8,9,10,11,12,13,14', '[{\"languagePrice\":\"English > Norwegian (bokmal)\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"0.09\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation Repetitions\",\"basePrice\":\"0.009\",\"standardTime\":\"\",\"childPriceId\":\"8\",\"masterPriceId\":\"1\"}]', '', '2022-12-15 23:35:55', '2022-12-15 23:35:55'),
(32, 1, 16, 'Qontent Group | ENG>NOR | Automotive', 'EUR,€', '', '', '0', '1,2,3,4,5,6,7,8,9,10,11,12,13,14', '[{\"languagePrice\":\"English > Norwegian (bokmal)\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"0.095\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Unit(s) Proofreading\",\"basePrice\":\"2.5\",\"standardTime\":\"\",\"childPriceId\":\"79\",\"masterPriceId\":\"2\"}]', '', '2022-12-15 23:49:59', '2022-12-15 23:49:59'),
(33, 1, 20, 'GTH Translation | ENG>NOR |', 'EUR,€', '', '', '0', '1,2,3,4,5,6,7,8,9,10,11,12,13,14', '[{\"languagePrice\":\"English > Norwegian (bokmal)\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"0.11\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Machine Translation Editing (New)\",\"basePrice\":\"0.09\",\"standardTime\":\"\",\"childPriceId\":\"32\",\"masterPriceId\":\"5\"}]', '', '2022-12-16 00:13:02', '2022-12-16 00:13:02'),
(34, 1, 22, 'Mars Translation | ENG>NOR |', 'USD,$', '', '', '', '1,2,3,4,5,6,7,8,9,10,11,12,13,14', '[{\"languagePrice\":\"English > Norwegian (bokmal)\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"0.09\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"}]', '', '2022-12-26 20:26:21', '2022-12-26 20:26:21'),
(35, 1, 23, 'GSL Shenzhen (Glodom Language Solutions) | ENG>NOR |', 'EUR,€', '', '', '', '5', '[{\"languagePrice\":\"English > Norwegian (bokmal)\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"0.1\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 50-74% Match\",\"basePrice\":\"0.1\",\"standardTime\":\"\",\"childPriceId\":\"2\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 75-84% Match\",\"basePrice\":\"0.04\",\"standardTime\":\"\",\"childPriceId\":\"3\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 85-94% Match\",\"basePrice\":\"0.04\",\"standardTime\":\"\",\"childPriceId\":\"4\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 95-99% Match\",\"basePrice\":\"0.02\",\"standardTime\":\"\",\"childPriceId\":\"5\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 100% Match\",\"basePrice\":\"0.02\",\"standardTime\":\"\",\"childPriceId\":\"6\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation Repetitions\",\"basePrice\":\"0.02\",\"standardTime\":\"\",\"childPriceId\":\"8\",\"masterPriceId\":\"1\"}]', '', '2022-12-26 20:43:43', '2022-12-26 20:43:43'),
(36, 1, 25, 'SDL Norway | ENG>NOR | Machine Translation Editing', 'EUR,€', '', '', '', '1,2,3,4,5,6,7,8,9,10,11,12,13,14', '[{\"languagePrice\":\"English > Norwegian (bokmal)\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Machine Translation Editing (New)\",\"basePrice\":\"0.08\",\"standardTime\":\"\",\"childPriceId\":\"32\",\"masterPriceId\":\"5\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 75-84% Match\",\"basePrice\":\"0.066\",\"standardTime\":\"\",\"childPriceId\":\"3\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 85-94% Match\",\"basePrice\":\"0.033\",\"standardTime\":\"\",\"childPriceId\":\"4\",\"masterPriceId\":\"1\"}]', '', '2023-01-05 14:09:58', '2023-01-05 14:09:58'),
(37, 1, 25, 'SDL Norway | ENG>NOR | Automotive', 'EUR,€', '', '', '', '1,2,3,4,5,6,7,8,9,10,11,12,13,14', '[{\"languagePrice\":\"English > Norwegian (bokmal)\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"0.11\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 75-84% Match\",\"basePrice\":\"0.066\",\"standardTime\":\"\",\"childPriceId\":\"3\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 85-94% Match\",\"basePrice\":\"0.033\",\"standardTime\":\"\",\"childPriceId\":\"4\",\"masterPriceId\":\"1\"}]', '', '2023-01-05 14:11:15', '2023-01-05 14:11:15'),
(38, 1, 26, 'SDL Limited | United Kingdom - Maidenhead | ENG>NOR | Automotive', 'EUR,€', '', '', '', '1,2,3,4,5,6,7,8,9,10,11,12,13,14', '[{\"languagePrice\":\"English > Norwegian (bokmal)\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"0.11\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 75-84% Match\",\"basePrice\":\"0.066\",\"standardTime\":\"\",\"childPriceId\":\"3\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 85-94% Match\",\"basePrice\":\"0.033\",\"standardTime\":\"\",\"childPriceId\":\"4\",\"masterPriceId\":\"1\"}]', '', '2023-01-05 15:46:29', '2023-01-05 15:46:29'),
(39, 2, 22, 'Åse Mari Lislegård | ENG>NOR | Automotive', 'EUR,€', '', '', '', '1,2,3,4,5,6,7,8,9,10,11,12,13,14', '[{\"languagePrice\":\"English > Norwegian (bokmal)\"},{\"languagePrice\":\"English (US) > Norwegian (bokmal)\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"0.06\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 50-74% Match\",\"basePrice\":\"0.03\",\"standardTime\":\"\",\"childPriceId\":\"2\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 75-84% Match\",\"basePrice\":\"0.03\",\"standardTime\":\"\",\"childPriceId\":\"3\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 85-94% Match\",\"basePrice\":\"0.03\",\"standardTime\":\"\",\"childPriceId\":\"4\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 95-99% Match\",\"basePrice\":\"0.009\",\"standardTime\":\"\",\"childPriceId\":\"5\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Hour(s) Proofreading\",\"basePrice\":\"25.00\",\"standardTime\":\"\",\"childPriceId\":\"22\",\"masterPriceId\":\"2\"}]', '', '2023-01-30 11:36:56', '2023-01-30 11:36:56'),
(40, 2, 23, 'Julianne Aga | ENG>NOR | Automotive', 'EUR,€', '', '', '', '1,2,3,4,5,6,7,8,9,10,11,12,13,14', '[{\"languagePrice\":\"English > Norwegian (bokmal)\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"0.06\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 50-74% Match\",\"basePrice\":\"0.03\",\"standardTime\":\"\",\"childPriceId\":\"2\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 75-84% Match\",\"basePrice\":\"0.03\",\"standardTime\":\"\",\"childPriceId\":\"3\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 95-99% Match\",\"basePrice\":\"0.03\",\"standardTime\":\"\",\"childPriceId\":\"5\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 85-94% Match\",\"basePrice\":\"0.009\",\"standardTime\":\"\",\"childPriceId\":\"4\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Hour(s) Proofreading\",\"basePrice\":\"25.00\",\"standardTime\":\"\",\"childPriceId\":\"22\",\"masterPriceId\":\"2\"}]', '', '2023-01-05 16:05:13', '2023-01-05 16:05:13'),
(41, 2, 24, 'Yngve Homlong | ENG>NOR | Automotive', 'EUR,€', '', '', '', '1,2,3,4,5,6,7,8,9,10,11,12,13,14', '[{\"languagePrice\":\"English > Norwegian (bokmal)\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"0.065\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 50-74% Match\",\"basePrice\":\"0.0325\",\"standardTime\":\"\",\"childPriceId\":\"2\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 75-84% Match\",\"basePrice\":\"0.0325\",\"standardTime\":\"\",\"childPriceId\":\"3\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 85-94% Match\",\"basePrice\":\"0.0325\",\"standardTime\":\"\",\"childPriceId\":\"4\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 95-99% Match\",\"basePrice\":\"0.009\",\"standardTime\":\"\",\"childPriceId\":\"5\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Hour(s) Proofreading\",\"basePrice\":\"20.00\",\"standardTime\":\"\",\"childPriceId\":\"22\",\"masterPriceId\":\"2\"}]', '', '2023-01-05 16:10:46', '2023-01-05 16:10:46');

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
  `decimal_number` int(11) NOT NULL DEFAULT '1',
  `iUserId` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `updated_date` datetime NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_decimal_separator`
--

INSERT INTO `tms_decimal_separator` (`separator_id`, `separatorChar`, `decimal_number`, `iUserId`, `is_active`, `updated_date`, `created_date`) VALUES
(4, '.', 1, 1, 0, '2021-10-22 13:58:52', '2018-07-19 12:16:28'),
(6, ',', 4, 1, 1, '2022-12-21 14:46:58', '2018-09-28 14:25:33');

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
(3, 2, 'marthe.kristoff@gmail.com', 'Vinter2022!', '03a9d12a7c64f9dc533847de7955ca0d', 'https://app.berba.com/translator/profile', 'Client Website', '2023-01-13 13:54:08', '2023-01-13 13:54:08'),
(4, 3, 'marika.s.l@hotmail.no', 'DZRr39Flh#dr', '3002951a37228a2dc26bf6eb02389227', 'https://5100693.app.netsuite.com/app/login/secure/enterpriselogin.nl?c=5100693&redirect=%2Fapp%2Faccounting%2Ftransactions%2Ftransactionlist.nl%3Fsearchtype%3DTransaction%26Transaction_TYPE%3DPurchOrd%26searchid%3D1218%26whence%3D%26whence%3D&whence=', 'Client Website', '2023-01-13 13:55:48', '2023-01-13 13:55:48'),
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
(22, 17, '-', '-', '336d5ebc5436534e61d16e63ddfca327', '', '', '2022-12-05 20:44:06', '2022-12-05 20:44:06'),
(23, 20, '-', '-', '336d5ebc5436534e61d16e63ddfca327', '', '', '2022-12-16 00:13:21', '2022-12-16 00:13:21'),
(24, 22, 'marthe.kristoff@gmail.com', 'RU4vLi$scpH4', '49f09223f2f21e0431ac8b52ee4ec662', 'https://www.marstranslation.com/translator/dashboard', 'Job Platofmr', '2022-12-26 20:29:26', '2022-12-26 20:29:26'),
(25, 17, 'N/A', 'N/A', '382b0f5185773fa0f67a8ed8056c7759', 'https://work.fasttranslator.com/', 'Invoicing', '2023-01-05 16:51:58', '2023-01-05 16:51:58'),
(26, 2, 'MartheKristoffersen', '7Pe!RxsMPAV%', '4a3792c936911d852588df0a5d430d9b', '', 'Memsource', '2023-01-13 13:53:42', '2023-01-13 13:53:42'),
(27, 3, 'mkristoffersen@spellup.no', 'L$iY$%szCZ17', 'f387811c20fbb0bad5dfae1760287e33', 'https://5100693.app.netsuite.com/app/accounting/transactions/transactionlist.nl?searchtype=Transaction&Transaction_TYPE=PurchOrd&searchid=1218&whence=&whence=', 'Client Website', '2023-01-13 13:55:39', '2023-01-13 13:55:39'),
(28, 3, 'no_translator_6', 'v0!gDG4D9#mu', 'a952b13839a569683eac859bc21fa617', 'https://colgate.wezen.com/translate/project/10/tasks?sort=name&order=desc&items=150&labels=2022_SEO_GAPS_Batch_E&targetLanguage=nb-NO', 'Datawords Marika: Wezen Hill\'s Pet', '2023-01-13 13:56:10', '2023-01-13 13:56:10'),
(29, 3, 'projects@spellup.no', 'Vinter2022!', '03a9d12a7c64f9dc533847de7955ca0d', 'https://5100693.app.netsuite.com/app/accounting/transactions/transactionlist.nl?searchtype=Transaction&Transaction_TYPE=PurchOrd&searchid=1218&whence=&whence=', 'Datawords Marika', '2023-01-13 13:56:29', '2023-01-13 13:56:29'),
(30, 9, 'marthe.kristoff@gmail.com', 'VDajp3p9Z$Vf', '178a6e3dcdd8430b7673820f8117fef5', 'https://scorewarrior.crowdin.com/u/', 'Crowdin', '2023-01-13 13:58:27', '2023-01-13 13:58:27'),
(31, 21, 'mkristoffersen@spellup.no', 'Vinter2022!', '03a9d12a7c64f9dc533847de7955ca0d', 'https://attachedlanguage.s.xtrf.eu/vendors/#/sign-in', 'XTRF', '2023-01-13 14:10:51', '2023-01-13 14:10:51');

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
(1, '', 0x3c6469763e3c7370616e3e426573742052656761726473202f2056656e6e6c69672068696c73656e3c2f7370616e3e3c2f6469763e0a3c6469763e266e6273703b3c2f6469763e0a3c6469763e3c7370616e207374796c653d22666f6e742d66616d696c793a207072697374696e613b20666f6e742d73697a653a206c617267653b20223e496e6776696c642053756e646c616e643c2f7370616e3e3c2f6469763e0a3c6469763e3c7370616e3e436f2d466f756e6465722026616d703b20427573696e65737320446576656c6f7065723c2f7370616e3e3c62723e3c7370616e3e3c610a090909687265663d226d61696c746f3a6973756e646c616e64407370656c6c75702e6e6f253230223e6973756e646c616e64407370656c6c75702e6e6f3c2f613e3c2f7370616e3e3c62723e3c2f6469763e0a3c6469763e3c7370616e3e5765623a203c6120687265663d22687474703a2f2f7777772e7370656c6c75702e6e6f223e7777772e7370656c6c75702e6e6f3c2f613e3c2f7370616e3e3c2f6469763e0a3c6469763e3c7370616e3e3c696d6720636c6173733d2266722d6469622066722d647261676761626c652066722d66696c220a0909097372633d22687474703a2f2f746d732e7370656c6c75702e6e6f2f75706c6f6164732f75706c6f61645f696d6167652f653539643139353461656639623365643161356533633463386534336137663038316366613965392e676966220a0909097374796c653d2277696474683a2031353070783b223e3c2f6469763e0a3c6469763e3c7370616e3e264f736c6173683b646567266172696e673b726473766569656e2034334a2c203139313120466c61746562792c204e6f727761793c2f7370616e3e3c2f6469763e0a, '1541049277.gif', 0x646174613a696d6167652f6769663b6261736536342c52306c474f446c6857514c5441504541414141414144424a525732467141414141434835424145414141414149663473654849365a44704551555a504d6c4274554749784e446f344d5378714f6a4d334f5449324f4459334d6a677a4c4851364d6a49784d44457a4d5463414966384c535731685a32564e595764705932734e5a324674625745394d4334304e5451314e5141682f77745954564167524746305956684e5544772f654842685932746c644342695a576470626a306e3737752f4a7942705a44306e567a564e4d4531775132566f61556836636d5654656b355559337072597a6c6b4a7a382b436a78344f6e68746347316c6447456765473173626e4d366544306e59575276596d5536626e4d36625756305953386e4948673665473177644773394a306c745957646c4f6a704665476c6d56473976624341784d6934304d43632b436a78795a475936556b5247494868746247357a4f6e4a6b5a6a306e6148523063446f764c336433647935334d793576636d63764d546b354f5338774d6938794d6931795a47597463336c75644746344c57357a4979632b43676f6750484a6b5a6a70455a584e6a636d6c7764476c76626942795a47593659574a76645851394a79634b4943423462577875637a703061575a6d5053646f644852774f693876626e4d7559575276596d5575593239744c3352705a6d59764d5334774c79632b43694167504852705a6d593654334a705a573530595852706232342b4d54777664476c6d5a6a7050636d6c6c626e526864476c76626a344b49447776636d526d4f6b526c63324e79615842306157397550676f384c334a6b5a6a70535245592b436a777665447034625842745a58526850676f674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674369416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943414b49434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749416f674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674369416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943414b49434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749416f674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674369416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943414b49434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749416f674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674369416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943414b49434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749416f674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674369416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943414b49434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749416f674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674369416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943414b49434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749416f674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674369416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943414b49434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749416f674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674369416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943414b49434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749416f385033687759574e725a5851675a57356b505364334a7a382b41662f2b2f667a372b766e34392f6231395050793866447637753373362b7270364f666d3565546a3475486733393764334e766132646a583174585530394c52304d2f4f7a637a4c79736e4978386246784d50437763432f7672323875377135754c65327462537a7372477772363674724b75717161696e7071576b6f364b686f4a2b656e5a79626d706d596c3561566c4a4f536b5a43506a6f324d6934714a6949654768595344676f4741663335396648743665586833646e563063334a786347397562577872616d6c6f5a325a6c5a474e6959574266586c31635731705a5746645756565254556c46515430354e5445744b53556848526b564551304a425144382b505477374f6a6b344e7a59314e444d794d5441764c6930734b796f704b43636d4a53516a4969456748783464484273614752675846685555457849524541384f4451774c43676b494277594642414d43415141414c4141414141425a41744d4141414c2b68492b70792b30506f357930326f757a33727a3744346269534a626d696162717972627543386679544e66326a6566367a76662b4477774b683853693859684d4b70664d70764d4a6a55716e314b723169733171743979753977734f6938666b73766d4d54717658374c613749346a4c352f5436334750503677587676762f7674536459787a466f47416559714c6a596447685936436a494f456c5a32524d70755947355a396e702b646d7971516370536768366970717138706a4371766f4b47357668656b49726534756265324262777176376d31434b694d454833446934696d79384c44776163626538354473794464457354484b644759326758553348725651644d75376776556c396e68634f6f4f3634414d352b565035427a2b442b4c6f4a7679747a633772384c6d7277693975416f7337437659495745416f464657766a776e357942526852714f6769526f54502b6368714c2f636f33717852466768684e57455234364965646b64314f6d6b5048556f684c596955357a6d53784d75624e423568697971795a445769396c4435795569536144716e506f6b4c314e5457344d316d3867557144506c317149796f4672547972366a41716a3673457356684e586832364c656e5a475744446b52326274757a587456413539664b616f32323074785069797358423936566645434235364457474634586476334d4871393334654c4668667477433934584d2b49626c6533527062695a4d7556396e7034637a7378327434624f42776a744b3631494e4e375270477242624f736154574c50736a375774755a37396f76647131426d4a6839723957726a6771634270473738416d33586a686f69564c352f5976496279364c6d7a4973636c336358763743753250343939586970313374617665795166772f7a7475764f3166373856586a787a2b4d482b30322f3133315637304e306e53333748726363665467436968356c4e4335713148337350586f526767756f31614a566b70453259495861696352685368525971426d494433416d49556f544a6f51695069694f5357423961476a6f5934326b75676d65676768362b5746364a6e4e55596f6f2b67335968666a6a337579474d725169707734704b3445566c6752444a4171524b56516179546c354f327a54696b6c7153494f41534267456d3553453958697549636b4639694b4b4f614d497a5847706e546456656c4e73574a464b633362336f356e4a737038706d616d4333612b52394163374a49487a594d58715062507672354753536254774961365442334b76714d4f6f63695369476a766a6b365a5566767763686c5a48414779756d696f36714b357166346a416b54456565344375716a3439445a4a70616b53706f6f722f5a5a796153654153594571356d79456d722b6f7169326c766f6a73376d65327175676c6671614a706a75745a7073523433472b6b525453486d714a4b5239557473707564454336786d6c36534c5a70613742486753756a6467655536717a41526c376c3768626d6a7567766e2f7932362b3641625037724976326a6d766b6864784b4d3569377242364d4b7353304f6c777775755653334b374538556b373847455944347472754a694b307a44487763695a4d62535a2b6e7574795245442f4b2f4765317038365734716e35797779495969555a504c673334476f6d58797952777a7a4d74617569484650722b623672334956685458306a2b58364350566744624a73733549303969573145774c334f7a545961626c3964525a34327a307739595758586168524e663838625945542b707532326944625861385a307047383852765a2f7533326e4f76477a66584e374e392b4e47725672786a337943665462657765322f2b354c6a66616564647565426258357734345a3166317254662b564b2b647365424a3631706e6152767a6e6a6d2b78612b35755759752b36323743766a585476726b664e5475756577363168726e73375133764c766a332b654f2f4a664733397537373472722f586975386444504f4334682b334f5a4859352f337a6276623031744f325751372b7237733050773733707a42394a624a593563793637634348664c6a376f70394e2f662f536a662f382b384d46584b372f357a53353933534d673973696e4f656c4e443445514d6d4143485167334268727556514345485034754a3843583151396836344e6639617958762f49704d485968664f41493563555146467077664a304c3377596c5573494c327131344d327a6734456a345168625763482f2f3839384b6457684146336151686a644d325134482b4545656e6c43444d5a536842473359772b674e30594d2b7979442b45786b6f78434d754c3463644d68384f6e776a454968617266657a375952693965454177676e434b61557a693862523474795a3263596e54596d4d643156674c6a6669516932644534786278694551784a6c4268674f51674831464878774a4355483132564f477343466e494e586251696e6573595262642b4d6449396b714a6d67796b494c564877547943725838776c434d52462f6d3654686f536a716c734a43453579636f3371684b4b6b6f4d6c4a70316f4d6b6f79636f6558524b5573592f6b73572f6f53636344636f3934514f637457336b7958455a52674c7a2b7053476a4f624a6874764755666f5a41395955707a6752776a355336502b45772f586a475a6e744f6d4f436449546b6a4f4335335562436136764a6d384834597a6b64453835386173755570382f6c4b666a6c786e362b7870524a5564303452676e43637458616d2f4f525a546b756b304a72372b4174724f65444a50564b48384a7a32707545313352745255357577504d332b794d34743674434155665351792b616e4d6a6362786b496272714f4a59366a34385154536a3341525753554e36557056576b3662324d794d6958667253686f3530596563443645783764394f484868536c546f4e705068644b517141653648704244527275336f6456654a6f4b716b2f6c71516c563539557754744f6e54434571526f317130584e71465167474e5364617078725766623631714847466d6c6b72576464364a6e4b745945566f542f313679727a5355716f4f585368544353725972733731692b2f3861466c4e795643644e685779584675715a4d395950752b67624a79586c6173392b667059703636306d4a75563230574a6d56694e4c7661767070586e56525543326b74637a556d6c315778714d396e5a774a3632593631644959763646317451696a616c743858745953762b5a646e6934704b7058503272622f4547584d664b6c717965464356564a3562633165493174365863625861542b467342426c6434773532734a73664c772b384f6c624a786a4f6d457767746239493452734d7656376a576e71317a7a4e6e65306e5252715a486b4a5866484b743766487263324155616665716a4a33762f56744a337a39644f4266736465343976567368656559594c695774377665646575464f6378672f626f73776857637059464a6e436a7262706a434837365765357634594b4b684f4654555a6245493659766744426557757943656277356a444c5061386d79324e525a7869466d72347a4a75474d64302f6242305555765447592b567959473973582b50702b495647356e48505359776741576d53796d7631385238656e4a6b72487a634c6563336b31364f714a6b6c366b41784b376a4656555a7a6d7048383351357656382b4961334e71332b7a2b584b2f4a656364302f6d2b6850586c6f4a7470357a54744e394f7873363170316658545153695a7a6b596e4c614e347532744749726e536d76357057507175577333666574447135544f6c465354475a375a6b776e4465616171326b656b74484658576743777a6f71473661302f7a6c636c644c584e426331356e55767436585346667436316d3735395334767252782b776c4849662b7a707358753772464e7a657871487a44625042366c7333576255366943543044674461436b6856303054314f35756872324c3770425046774f786272635a535a333031677462636279757448375a6e6534536576546435757431725a75634d46667257337a45707166722f57326b4f3561314b324b47354d43373757326c5733496474653434656465457354503674597373375062514e5a79786a584f337573705665494d2f37676938337a774c66363733785733634d77744e32662b4e564c563566724f7445776a6e75564436727a6d697632306f59322b626f4f44383975367861656352305a73646273526a30386e757331762f7363706f2f6536705954333071337539596e34466378695358712b7a357077544f765535425a48784e695a446a4931312f58733143344742674f3845364776764f366c526a51313257356a65456354306d30504974337233737052332f4d6b4a52516273626c65644b6e422f65694a527a6a57792b563345663263323733474c4c41644136436b6e6c4430334859573242766365517537392b686b52446d4355756a6a69753435646177334b624c31364f66467758373156782b6f3141655854664c53767565794c337a77667a3938534d66742b4447312f4f61315469444843782b6e6147652b385a4f2f384f6372667a7a5378326233463238756e6b2f2f3943767966657874756e6373514e367a36704f43713565796673582b772b31466f557353634f6f2f45767a62507a503670307238392f38582f5263572f7765415a53474137484341426567544356675a424b6941432b6941626847424435682f45376758466b6942417a68356a4d47414761694237396363486569424572694241596942493369424a536758496f694348774a344b3369434c6567514d5367684c796944574d47434d3669434e77682f4e46682b4e7369444f754744755a43445156676b4f39694451326945716b422b48466945532f674b5457694353676946707943464d4569465666674a563269415436694656756946523469455835694359386753474565474452694773484234615a6767626169413665654750434b484875685063306948346b642f6f6e6435654c694666476768664e687666716749677469485033685468436945674d6766687169495a796949676369496a3367556b30694a6c34694a6d61694a6d386a2b695a336f695a38496971456f69714e496971566f6971654969716d6f697176496971336f697138496937456f69374e496937566f6937654969376d6f693776496937336f693738496a4d456f6a4d4e496a4d566f6a4d65496a4d6d6f6a4d76496a4d336f6a4d38496a64456f6a644e496a64566f6a6465496a646d6f6a6476496a64336f6a6438496a746359414f4e496a7556496a6731676a7557594151457741657134414f5949416641596a2f4a3441756c6f6a2b69596a75336f6a764d346a6778416a2f68346a7546344241455a6b4142516b4f2f596a7764776b424b516b417a5a6b4172776b416a4a6a676f5a6b5169704152554a6b415a516b41755a41427a706a772f706b524b4a6a7650596b5267706b4433516b4164706b686f5a6b5348356b5250706b4361356b69774a6b54434a6a7864706b772b516b69435a6b79585a6b78594a6c4471356b6a2b4a41426a2b4f5a4d6e6d514d32715a4a45795a4939655a512b53514837574a494f494a4d6b69514653535a5646795a4e552b5a5168365a4955575a5663365939494b51524b325a4a63365a5250435a5a4d435a4547615a5273365a4673535a4e58365a594d715a5535435a64646d5a6678364a592f4b5a6468535a592f594a5a34695a59314b5a634b4f5a63524d4a45634f5a4e664b5a595830493971615a4233325a4746615a6b76715a4e4e325a6158475a684b344a68514f5a5632325a65694f5a70614b5a5348475a5156734a6953535a6e362b4a654e655a5177755a4376795a716479514f66325a7067535a7031715a6935795a746f695a716d435a6b5561514734715a7563615a695a715a6c4679592b31615a7334594a7a4c575a71374b5a6d444b5a796e615a7a4f715a472b715a6931365a68662b5a322b475a7a2f2b4a7842454a326c655a3654655a7a4b755a3673535a372b487a6d6331786d5455526d6273506d586f4b6d654d616d6435516b4435376d52376d6d50714a6d5771366d616e366d644152716336396d6474496d636d396d61436271572f416b452f726d5675796d6449356d636a516d66516c6d6379656d61394d6d67475a6d5650736d4f454b716745726f444647716456686d6149327159476971536a316d5a474e7169437771694c4a716159356d6837466d6a4b4b6f444b74716a4f6c715466436d524d4f71684e2b6d67536371644463716b51537166516b71695050716b5067716433746d5358596d5a4c7671694d6a716c512b716b32376d684e7671684f4e716c5372716b4d2b716c5650716a566a71675770716d5548716b4d5871694f6671625a6b7163387a6d6d5a46716e6276716c6431716d61696f443934696453386d59574e6d5863576d6f694a6d56676771634156716b5255716269557169754d6d6f6778716d6a626f576e344371715a764b715a3371715a384b7171457171714e4b71706c52414141370a, 1, '2017-10-14 13:27:43', '2022-06-03 11:29:21'),
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
(5, 'For reset password', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\r\n<meta name=\"format-detection\" content=\"telephone=no\"> <!-- disable auto telephone linking in iOS -->\r\n<title></title>\r\n<link href=\"https://fonts.googleapis.com/css?family=Roboto\" rel=\"stylesheet\">\r\n<style>\r\n	html,\r\n	body,\r\n	p {\r\n		font-family: \'Roboto\', sans-serif;\r\n		font-size: 14px;\r\n	}\r\n</style>\r\n<table style=\"display: table;border-collapse: separate;box-sizing: border-box;\" border=\"0\" width=\"100%\" align=\"center\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table\r\n					style=\"border: 1px solid #c9d6df;border-radius:20px;box-sizing: border-box;border-collapse: collapse; border: 1px solid #d1c7c7 !important;background-color: #fff;\"\r\n					border=\"1\" width=\"600\" align=\"center\">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table\r\n									style=\"display: table;border-collapse: separate;box-sizing: border-box;box-sizing: border-box;border-collapse: collapse;\"\r\n									border=\"0\" align=\"center\" width=\"100%\">\r\n									<tbody>\r\n										<tr>\r\n											<td\r\n												style=\"padding: 15px;/* height: 50px; */background-color: #efefef;border-bottom: 1px solid #bfbfbf;\">\r\n												<center> <img src=\"http://tms.spellup.no/assets/img/logo.png\"\r\n														class=\"img-full\" alt=\"...\"\r\n														style=\"max-height: 50px;width: 250px;\"> </center>\r\n											</td>\r\n										</tr>\r\n										<!--<tr>-->\r\n										<!--<td><span style=\"height: 1px;width: 100%;background-color: #d1c7c7;display: block;\">&nbsp;</span></td>-->\r\n										<!--</tr>-->\r\n										<tr>\r\n											<td style=\"padding: 15px;\">\r\n												<p>Hi [USERNAME],</p>\r\n												<hr>\r\n												<p>You recently requested to reset your password for SpellUp\r\n													account.Please click on&nbsp;</p>\r\n												<p>the below link to reset it : </p>\r\n												[RESETPASSWORDLINK]<br><br>If you did not requested for reset, please\r\n												ignore this email.<br><br>Kind regards,<br>TMS Team.\r\n											</td>\r\n										</tr>\r\n										<tr>\r\n											<td\r\n												style=\"padding: 5px;background-color: #efefef;border-top: 1px solid #b5b5b5;\">\r\n												<center>\r\n													<div style=\"text-align: left;\">\r\n														<span><em>For more information, visit us\r\n																at <a style=\"color: #000000;\"\r\n																	href=\"https://www.spellup.no\"><u>www.spellup.no</u></a>\r\n																<em></span>\r\n													</div>\r\n													<div> </div><br>\r\n													<div style=\"text-align: left;\"><span\r\n															style=\"/* color: #000000; */\"><em>This email and any\r\n																attachments to it may be confidential and are intended\r\n																solely for the use of the individual to whom it is\r\n																addressed. If you are not the intended recipient of this\r\n																email, you must neither take any action based upon its\r\n																contents, nor copy or show it to anyone. If you have\r\n																received this transmission in error, please use the\r\n																reply function to tell us and then permanently delete\r\n																what you have received.</em></span></div>\r\n													<div> </div>\r\n													<div> </div>\r\n												</center>\r\n											</td>\r\n										</tr>\r\n									</tbody>\r\n								</table>\r\n							</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 'Reset Password', 3, 1, 1, '2018-09-08 14:57:11', '2019-01-01 15:30:13'),
(6, 'For Accepted job by resource', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\r\n<meta name=\"format-detection\" content=\"telephone=no\"> <!-- disable auto telephone linking in iOS -->\r\n<title></title>\r\n<link href=\"https://fonts.googleapis.com/css?family=Roboto\" rel=\"stylesheet\">\r\n<style>\r\n	html,\r\n	body,\r\n	p {\r\n		font-family: \'Roboto\', sans-serif;\r\n		font-size: 14px;\r\n	}\r\n</style>\r\n<table style=\"display: table;border-collapse: separate;box-sizing: border-box;\" border=\"0\" width=\"100%\" align=\"center\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table\r\n					style=\"border: 1px solid #c9d6df;border-radius:20px;box-sizing: border-box;border-collapse: collapse; border: 1px solid #d1c7c7 !important;background-color: #fff;\"\r\n					border=\"1\" width=\"600\" align=\"center\">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table\r\n									style=\"display: table;border-collapse: separate;box-sizing: border-box;box-sizing: border-box;border-collapse: collapse;\"\r\n									border=\"0\" align=\"center\" width=\"100%\">\r\n									<tbody>\r\n										<tr>\r\n											<td\r\n												style=\"padding: 15px;/* height: 50px; */background-color: #efefef;border-bottom: 1px solid #bfbfbf;\">\r\n												<center> <img src=\"http://tms.spellup.no/assets/img/logo.png\"\r\n														class=\"img-full\" alt=\"...\"\r\n														style=\"max-height: 50px;width: 250px;\"> </center>\r\n											</td>\r\n										</tr>\r\n										<tr>\r\n											<td style=\"padding: 15px;\">\r\n												<p><span>Hi!<br></span></p>\r\n\r\n												<div><span>I would like to let you know that I\'m happy to accept the\r\n														job.</span></div>\r\n												<div><span> </span></div>\r\n												<div>\r\n													<span><b>JOB</b></span><br><span>[JOBNO]</span><br><br><span><b>LANGUAGES</b></span><br><span>[LANGUAGES]</span><br><br><span><b>RESOURCE</b></span><br><span>[RESOURCENAME]</span>\r\n												</div>\r\n												<div><span> </span></div>\r\n												<div><span>[JOBREQUESTCOMMENT]</span></div>\r\n											</td>\r\n										</tr>\r\n										<tr>\r\n											<td\r\n												style=\"padding: 5px;background-color: #efefef;border-top: 1px solid #b5b5b5;\">\r\n												<center>\r\n													<div style=\"text-align: left;\">\r\n														<span><em>For more information, visit us at <a style=\"color: #000000;\" href=\"https://www.spellup.no\"><u>www.spellup.no</u></a> </em></span>\r\n													</div>\r\n													<div> </div><br>\r\n													<div style=\"text-align: left;\"><span><em>This email and any\r\n																attachments to it may be confidential and are intended\r\n																solely for the use of the individual to whom it is\r\n																addressed. If you are not the intended recipient of this\r\n																email, you must neither take any action based upon its\r\n																contents, nor copy or show it to anyone. If you have\r\n																received this transmission in error, please use the\r\n																reply function to tell us and then permanently delete\r\n																what you have received.</em></span></div>\r\n													<div> </div>\r\n													<div> </div>\r\n												</center>\r\n											</td>\r\n										</tr>\r\n									</tbody>\r\n								</table>\r\n							</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 'Job accepted by resource', 1, 1, 1, '2018-10-26 18:10:31', '2018-10-29 19:24:21'),
(7, 'For job rejected by resource', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\r\n<meta name=\"format-detection\" content=\"telephone=no\"> <!-- disable auto telephone linking in iOS -->\r\n<title></title>\r\n\r\n<link href=\"https://fonts.googleapis.com/css?family=Roboto\" rel=\"stylesheet\">\r\n<style>\r\n	html,\r\n	body,\r\n	p {\r\n		font-family: \'Roboto\', sans-serif;\r\n		font-size: 14px;\r\n	}\r\n</style>\r\n\r\n<table style=\"display: table;border-collapse: separate;box-sizing: border-box;\" border=\"0\" width=\"100%\" align=\"center\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table\r\n					style=\"border: 1px solid #c9d6df;border-radius:20px;box-sizing: border-box;border-collapse: collapse; border: 1px solid #d1c7c7 !important;background-color: #fff;\"\r\n					border=\"1\" width=\"600\" align=\"center\">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table\r\n									style=\"display: table;border-collapse: separate;box-sizing: border-box;box-sizing: border-box;border-collapse: collapse;\"\r\n									border=\"0\" align=\"center\" width=\"100%\">\r\n									<tbody>\r\n										<tr>\r\n											<td\r\n												style=\"padding: 15px;/* height: 50px; */background-color: #efefef;border-bottom: 1px solid #bfbfbf;\">\r\n												<center>\r\n													<img src=\"http://tms.spellup.no/assets/img/logo.png\"\r\n														class=\"img-full\" alt=\"...\"\r\n														style=\"max-height: 50px;width: 250px;\">\r\n												</center>\r\n											</td>\r\n										</tr>\r\n										<tr>\r\n											<td style=\"padding: 15px;\">\r\n												<div>\r\n													<p><span>Hi!<br></span></p>\r\n												</div>\r\n\r\n												<div><span>I regret to inform you that the following job has been\r\n														assigned to another resource.<br></span></div>\r\n												<div> </div>\r\n												<span><b><br>JOB:</b></span><br>\r\n												<font face=\"khmer ui, geneva\">[JOBNO]</font>\r\n												<br><br><span><b>SUBJECT:</b></span><br>\r\n												<font face=\"khmer ui, geneva\">[PROJECTNAME]</font>\r\n												<br><br><span><b>LANGUAGES:</b></span><br>\r\n												<font face=\"khmer ui, geneva\">[LANGUAGES]</font>\r\n												<br><br><span><b>DEADLINE:</b></span><br>\r\n												<font face=\"khmer ui, geneva\">[DEADLINE]</font><br><br><span><b>REJECT\r\n														REASON:</b></span><br>[REJECTREASON]<br><br>\r\n\r\n											</td>\r\n										</tr>\r\n										<tr>\r\n											<td\r\n												style=\"padding: 5px;background-color: #efefef;border-top: 1px solid #b5b5b5;\">\r\n												<center>\r\n													<div style=\"text-align: left;\">\r\n														<span> <em>For more information, visit us at <a style=\"color: #000000;\" href=\"https://www.spellup.no\"><u>www.spellup.no</u></a> </em></span>\r\n													</div>\r\n													<div> </div>\r\n													<br>\r\n													<div style=\"text-align: left;\"><span><em>This email and any\r\n																attachments to it may be confidential and are intended\r\n																solely for the use of the individual to whom it is\r\n																addressed. If you are not the intended recipient of this\r\n																email, you must neither take any action based upon its\r\n																contents, nor copy or show it to anyone. If you have\r\n																received this transmission in error, please use the\r\n																reply function to tell us and then permanently delete\r\n																what you have received.</em></span></div>\r\n													<div> </div>\r\n													<div> </div>\r\n\r\n												</center>\r\n											</td>\r\n										</tr>\r\n									</tbody>\r\n								</table>\r\n							</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 'Job rejected by resource', 2, 1, 1, '2018-10-29 14:56:26', '2018-10-30 15:19:40'),
(8, 'For registration email', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\r\n<meta name=\"format-detection\" content=\"telephone=no\"> <!-- disable auto telephone linking in iOS -->\r\n<title></title>\r\n\r\n<link href=\"https://fonts.googleapis.com/css?family=Roboto\" rel=\"stylesheet\">\r\n<style>\r\n	html,\r\n	body,\r\n	p {\r\n		font-family: \'Roboto\', sans-serif;\r\n		font-size: 14px;\r\n	}\r\n</style>\r\n\r\n\r\n\r\n<table style=\"display: table;border-collapse: separate;box-sizing: border-box;\" border=\"0\" width=\"100%\" align=\"center\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table\r\n					style=\"border: 1px solid #c9d6df;border-radius:20px;box-sizing: border-box;border-collapse: collapse; border: 1px solid #d1c7c7 !important;background-color: #fff;\"\r\n					border=\"1\" width=\"600\" align=\"center\">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table\r\n									style=\"display: table;border-collapse: separate;box-sizing: border-box;box-sizing: border-box;border-collapse: collapse;\"\r\n									border=\"0\" align=\"center\" width=\"100%\">\r\n									<tbody>\r\n										<tr>\r\n											<td\r\n												style=\"padding: 15px;/* height: 50px; */background-color: #efefef;border-bottom: 1px solid #bfbfbf;\">\r\n												<center>\r\n													<img src=\"http://tms.spellup.no/assets/img/logo.png\"\r\n														class=\"img-full\" alt=\"...\"\r\n														style=\"max-height: 50px;width: 250px;\">\r\n												</center>\r\n											</td>\r\n										</tr>\r\n										<tr>\r\n											<td style=\"padding: 15px;\">\r\n												<div><span>Hi [USERNAME]!</span></div>\r\n												<div> </div><br><br>\r\n												<div><span>Thank you so much for registering with SpellUp!</span><br>\r\n													<span>We are delighted to have you onboard &#128522;</span>\r\n												</div>\r\n												<div> </div><br><br>\r\n												<div><span>Please confirm your registration by clicking on the link\r\n														below:<br><br>\r\n														[REGISTRATIONLINK]<br><br>\r\n														Your login details\r\n														are:<br><br>Email:<br>[USEREMAIL]<br><br>Password:<br>[USERPASSWORD]<br><br>\r\n														Please remember to change your password on first login.<br><br>\r\n												</div>\r\n												<div> </div>\r\n												<div><span>If you have any questions, please do not hesitate to contact\r\n														us.</span></div><br>\r\n												<div>\r\n													<div>\r\n														<div><span>We are looking forward to work with you!\r\n																&#128522;</span></div><br><br>\r\n\r\n														<div><span>Best Regards</span></div>\r\n														<div> </div>\r\n														<div><span>The SpellUp Team</span></div>\r\n													</div>\r\n												</div>\r\n											</td>\r\n										</tr>\r\n										<tr>\r\n											<td\r\n												style=\"padding: 5px;background-color: #efefef;border-top: 1px solid #b5b5b5;\">\r\n												<center>\r\n													<div style=\"text-align: left;\">\r\n														<span>\r\n															<em>For more information, visit us at\r\n																<a style=\"color: #000000;\"\r\n																	href=\"https://www.spellup.no\"><u>www.spellup.no</u></a>\r\n															</em>\r\n														</span>\r\n													</div>\r\n													<div> </div><br>\r\n													<div style=\"text-align:left;\"><span><em>This email and any\r\n																attachments to it may be confidential and are intended\r\n																solely for the use of the individual to whom it is\r\n																addressed.\r\n																If you are not the intended recipient of this email, you\r\n																must neither take any action based upon its contents,\r\n																nor copy or show it to anyone.\r\n																If you have received this transmission in error, please\r\n																use the reply function to tell us and then permanently\r\n																delete what you have received.</em></span></div>\r\n													<div> </div>\r\n												</center>\r\n											</td>\r\n										</tr>\r\n									</tbody>\r\n								</table>\r\n							</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 'Registration email', 4, 1, 1, '2018-10-29 15:31:46', '2022-11-16 12:59:13'),
(9, 'For overdue job', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\r\n<meta name=\"format-detection\" content=\"telephone=no\"> <!-- disable auto telephone linking in iOS -->\r\n<title></title>\r\n\r\n<link href=\"https://fonts.googleapis.com/css?family=Roboto\" rel=\"stylesheet\">\r\n<style>\r\n	html,\r\n	body,\r\n	p {\r\n		font-family: \'Roboto\', sans-serif;\r\n		font-size: 14px;\r\n	}\r\n</style>\r\n\r\n\r\n\r\n<table style=\"display: table;border-collapse: separate;box-sizing: border-box;\" border=\"0\" width=\"100%\" align=\"center\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table\r\n					style=\"border: 1px solid #c9d6df;border-radius:20px;box-sizing: border-box;border-collapse: collapse; border: 1px solid #d1c7c7 !important;background-color: #fff;\"\r\n					border=\"1\" width=\"600\" align=\"center\">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table\r\n									style=\"display: table;border-collapse: separate;box-sizing: border-box;box-sizing: border-box;border-collapse: collapse;\"\r\n									border=\"0\" align=\"center\" width=\"100%\">\r\n									<tbody>\r\n										<tr>\r\n											<td\r\n												style=\"padding: 15px;/* height: 50px; */background-color: #efefef;border-bottom: 1px solid #bfbfbf;\">\r\n												<center>\r\n													<img src=\"http://tms.spellup.no/assets/img/logo.png\"\r\n														class=\"img-full\" alt=\"...\"\r\n														style=\"max-height: 50px;width: 250px;\">\r\n												</center>\r\n											</td>\r\n										</tr>\r\n										<tr>\r\n											<td style=\"padding: 15px;\">\r\n												<div>\r\n													<div>\r\n														<div><span>Hi there!</span></div>\r\n														<div> </div>\r\n														<div><span>IMPORTANT!</span></div>\r\n														<div> </div>\r\n														<div><span>This job is overdue - and you need to take action\r\n																immediately - so this project is delivered on\r\n																time.</span></div>\r\n														<div> </div>\r\n														<div><span>This is some information about the overdue\r\n																job:</span></div>\r\n														<div> </div>\r\n													</div>\r\n												</div>\r\n												<div>\r\n													<span><b>JOB:</b></span><br><span>[JOBNO]</span><br><br><span><b>RESOURCE:</b></span><br><span>[NAMEJOBRECEIVER]</span><br><br><span><b>CUSTOMER:</b></span><br><span>[CUSTOMERNAME]</span>\r\n												</div>\r\n												<div><span><br></span></div>\r\n												<div> </div>\r\n												<div>\r\n													<div>\r\n														<div><span><b>PROJECT:</b></span></div>\r\n														<span>[PROJECTNAME]</span>\r\n													</div>\r\n													<div><span><br></span></div>\r\n													<div><span> </span></div>\r\n													<div><span><b>TASK:</b></span><br><span>[JOBSERVICE]</span></div>\r\n													<div><span><br></span></div>\r\n													<div><span> </span></div>\r\n													<div><span><b>DEADLINE:</b></span><br><span>[DEADLINE]</span></div>\r\n													<div> </div>\r\n												</div>\r\n											</td>\r\n										</tr>\r\n										<tr>\r\n											<td\r\n												style=\"padding: 5px;background-color: #efefef;border-top: 1px solid #b5b5b5;\">\r\n												<center>\r\n													<div style=\"text-align: left;\"><span\r\n															style=\"/* color: #060606; */\">For more information, visit us\r\n															at <a style=\"color: #000000;\"\r\n																href=\"https://www.spellup.no\"><u>www.spellup.no</u></a></span>\r\n													</div>\r\n													<div style=\"text-align: left;\"><span style=\"color: #ffffff;\"><u\r\n																style=\"color: rgb(255, 255, 255);\"><br></u></span></div>\r\n													<div> </div><br>\r\n													<div style=\"text-align: left;\"><span><em>This email and any\r\n																attachments to it may be confidential and are intended\r\n																solely for the use of the individual to whom it is\r\n																addressed. If you are not the intended recipient of this\r\n																email, you must neither take any action based upon its\r\n																contents, nor copy or show it to anyone. If you have\r\n																received this transmission in error, please use the\r\n																reply function to tell us and then permanently delete\r\n																what you have received.</em></span></div>\r\n													<div> </div>\r\n													<div> </div>\r\n												</center>\r\n											</td>\r\n										</tr>\r\n									</tbody>\r\n								</table>\r\n							</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 'Overdue job', 5, 1, 1, '2018-10-29 16:02:02', '2018-10-29 18:25:34'),
(10, 'For job Delivery', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\r\n<meta name=\"format-detection\" content=\"telephone=no\"> <!-- disable auto telephone linking in iOS -->\r\n<title></title>\r\n\r\n<link href=\"https://fonts.googleapis.com/css?family=Roboto\" rel=\"stylesheet\">\r\n<style>\r\n	html,\r\n	body,\r\n	p {\r\n		font-family: \'Roboto\', sans-serif;\r\n		font-size: 14px;\r\n	}\r\n</style>\r\n\r\n\r\n\r\n<table style=\"display: table;border-collapse: separate;box-sizing: border-box;\" border=\"0\" width=\"100%\" align=\"center\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table\r\n					style=\"border: 1px solid #c9d6df;border-radius:20px;box-sizing: border-box;border-collapse: collapse; border: 1px solid #d1c7c7 !important;background-color: #fff;\"\r\n					border=\"1\" width=\"600\" align=\"center\">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table\r\n									style=\"display: table;border-collapse: separate;box-sizing: border-box;box-sizing: border-box;border-collapse: collapse;\"\r\n									border=\"0\" align=\"center\" width=\"100%\">\r\n									<tbody>\r\n										<tr>\r\n											<td\r\n												style=\"padding: 15px;/* height: 50px; */background-color: #efefef;border-bottom: 1px solid #bfbfbf;\">\r\n												<center>\r\n													<img src=\"http://tms.spellup.no/assets/img/logo.png\"\r\n														class=\"img-full\" alt=\"...\"\r\n														style=\"max-height: 50px;width: 250px;\">\r\n												</center>\r\n											</td>\r\n										</tr>\r\n										<tr>\r\n											<td style=\"padding: 15px;\">\r\n												<div>\r\n													<div><span>Hi there!</span></div>\r\n													<div> </div>\r\n													<div><span>The following job has been delivered :</span></div>\r\n												</div>\r\n												<div> </div>\r\n												<div><span><b>JOB:</b></span></div>\r\n												<div><span>[JOBNO]</span>\r\n													<p><span><b>DESCRIPTION:</b></span><br><span>[JOBDESCRIPTION]</span>\r\n													</p>\r\n													<span><b>COMMENT:</b></span><br><span>[DELIVERYNOTE]</span>\r\n												</div>\r\n											</td>\r\n										</tr>\r\n										<tr>\r\n											<td\r\n												style=\"padding: 5px;background-color: #efefef;border-top: 1px solid #b5b5b5;\">\r\n												<center>\r\n													<div style=\"text-align: left;\"><span><em>For more information, visit\r\n																us\r\n																at <a style=\"color: #000000;\"\r\n																	href=\"https://www.spellup.no\"><u>www.spellup.no</u></a>\r\n															</em></span>\r\n													</div>\r\n													<div> </div><br>\r\n													<div style=\"text-align: left;\"><span><em>This email and any\r\n																attachments to it may be confidential and are intended\r\n																solely for the use of the individual to whom it is\r\n																addressed. If you are not the intended recipient of this\r\n																email, you must neither take any action based upon its\r\n																contents nor copy or show it to anyone. If you have\r\n																received this transmission in error, please use the\r\n																reply function to tell us and then permanently delete\r\n																what you have received.</em></span></div>\r\n													<div> </div>\r\n													<div> </div>\r\n\r\n												</center>\r\n											</td>\r\n										</tr>\r\n									</tbody>\r\n								</table>\r\n							</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\r\n        <meta name=\"format-detection\" content=\"telephone=no\"> <!-- disable auto telephone linking in iOS -->\r\n        <title></title>\r\n\r\n		<link href=\"https://fonts.googleapis.com/css?family=Roboto\" rel=\"stylesheet\">\r\n		<style>\r\n			html, body, p {\r\n				font-family: \'Roboto\', sans-serif;\r\n				font-size: 14px;\r\n			}\r\n		</style>\r\n\r\n	\r\n    \r\n       <table style=\"display: table;border-collapse: separate;box-sizing: border-box;\" border=\"0\" width=\"100%\" align=\"center\">\r\n		<tbody><tr>\r\n			<td>\r\n				<table style=\"border: 1px solid #c9d6df;border-radius:20px;box-sizing: border-box;border-collapse: collapse; border: 1px solid #d1c7c7 !important;background-color: #fff;\" border=\"1\" width=\"600\" align=\"center\">\r\n					<tbody><tr>\r\n						<td>\r\n							<table style=\"display: table;border-collapse: separate;box-sizing: border-box;box-sizing: border-box;border-collapse: collapse;\" border=\"0\" align=\"center\" width=\"100%\">\r\n						    	<tbody>\r\n									<tr>\r\n										<td style=\"padding: 15px;/* height: 50px; */background-color: #efefef;border-bottom: 1px solid #bfbfbf;\">\r\n											<center>\r\n												<img src=\"http://103.239.146.251:898/tmsNew/assets/img/BeConnected_Logo.gif\" class=\"img-full\" alt=\"...\" style=\"max-height: 50px;width: 250px;\">\r\n											</center>\r\n										</td>  \r\n									</tr>\r\n									<!--<tr>-->\r\n										<!--<td><span style=\"height: 1px;width: 100%;background-color: #d1c7c7;display: block;\">&nbsp;</span></td>-->\r\n									<!--</tr>-->\r\n									<tr> \r\n										<td style=\"padding: 15px;\">\r\n											<div>\r\n    <div><span>Hi there!</span></div>\r\n    <div> </div>\r\n    <div><span>The following job has been delivered :</span></div>\r\n</div>\r\n<div> </div>\r\n<div><span><b>JOB:</b></span></div>\r\n<div><span>[JOBNO]</span>\r\n    <p><span><b>DESCRIPTION:</b></span><br><span>[JOBDESCRIPTION]</span></p>\r\n    <span><b>COMMENT:</b></span><br><span>[DELIVERYNOTE]</span></div></td> \r\n									</tr>\r\n									<tr>\r\n										<td style=\"padding: 5px;background-color: #efefef;border-top: 1px solid #b5b5b5;\">\r\n											<center>\r\n												<div style=\"text-align: left;\"><span style=\"/* color: #060606; */\">For more information, visit us at <a style=\"color: #000000;\" href=\"http://www.beconnected.no\"><u>www.beconnected.no</u></a> or <u style=\"color: rgb(255, 255, 255);\"><a style=\"color: #000000;\" href=\"http://www.beconnected.bg\">www.beconnected.bg</a>.</u></span></div><div style=\"text-align: left;\"><span style=\"color: #ffffff;\"><u style=\"color: rgb(255, 255, 255);\"><br></u></span></div>\r\n<div> </div>\r\n<div style=\"text-align: left;\"><span style=\"/* color: #000000; */\"><em>This email and any attachments to it may be confidential and are intended solely for the use of the individual to whom it is addressed. If you are not the intended recipient of this email, you must neither take any action based upon its contents, nor copy or show it to anyone. If you have received this transmission in error, please use the reply function to tell us and then permanently delete what you have received.</em></span></div>\r\n<div> </div>\r\n<div> </div>\r\n<div>\r\n<div><a href=\"https://www.facebook.com/beconnectedbulgaria?_rdr=p\" target=\"_blank\" rel=\"noopener\"><img src=\"http://i.imgur.com/EgYFhb9.png\" alt=\"\" width=\"39\" height=\"38\"></a>   <img src=\"http://i.imgur.com/pG5yZd6.png//www.dropbox.com/preview/BeConnected%20AS/IT/E-post/Ikoner/BeConnected_zps34203a72.PNG\" alt=\"\" width=\"84\" height=\"37\">    <img src=\"http://i.imgur.com/wQ9lihL.png\" alt=\"\" width=\"75\" height=\"27\">      </div>\r\n</div>\r\n\r\n											</center>\r\n										</td>\r\n									</tr>\r\n								</tbody>\r\n							</table>\r\n						</td>\r\n					</tr>\r\n				</tbody></table>\r\n			</td>\r\n		</tr>\r\n	</tbody></table>', 'Job Delivery', 6, 1, 1, '2018-10-29 18:29:14', '2018-10-31 19:16:07');

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
(342, 0, 'Data', 341, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-11-18 00:12:21', '2022-11-18 00:12:21'),
(343, 0, 'Projects', 341, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-11-18 00:12:21', '2022-11-18 00:12:21'),
(344, 0, 'Invoice', 341, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-11-18 00:12:21', '2022-11-18 00:12:21'),
(345, 0, 'SPE_0003', 343, '72', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(346, 0, 'Jobs', 345, '72', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
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
(400, 0, 'Data', 399, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(401, 0, 'Projects', 399, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(402, 0, 'Invoice', 399, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
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
(495, 0, 'SPE220019', 11, '97', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(496, 0, 'Jobs', 495, '97', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(501, 0, 'loxam-015', 0, '', '', 0, 15, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 20:50:12', '2022-12-01 20:50:12'),
(502, 0, 'SPE220020', 11, '98', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(503, 0, 'Jobs', 502, '98', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(504, 0, 'Item001', 502, '98', '', 0, 0, 0, 68, 0, 0, 0, 0, '', '', '2022-12-01 20:51:03', '2022-12-01 20:51:03'),
(505, 0, 'PRF001', 503, '98', '66', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 20:53:50', '2022-12-01 20:53:50'),
(506, 0, '_in', 505, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 20:53:50', '2022-12-01 20:53:50'),
(507, 0, '_out', 505, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-01 20:53:50', '2022-12-01 20:53:50'),
(508, 0, 'SPE220021', 11, '99', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(509, 0, 'Jobs', 508, '99', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
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
(527, 0, 'Jobs', 526, '104', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(532, 0, 'SPE220025', 11, '105', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(533, 0, 'Jobs', 532, '105', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(538, 0, 'SPE22,SPE_0005', 54, '106', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(539, 0, 'Jobs', 538, '106', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(540, 0, 'Item001', 538, '106', '', 0, 0, 0, 74, 0, 0, 0, 0, '', '', '2022-12-02 14:28:36', '2022-12-02 14:28:36'),
(541, 0, 'PRF001', 539, '106', '72', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-02 14:29:35', '2022-12-02 14:29:35'),
(542, 0, '_in', 541, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-02 14:29:35', '2022-12-02 14:29:35'),
(543, 0, '_out', 541, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-02 14:29:35', '2022-12-02 14:29:35'),
(544, 0, 'SPE220026', 11, '107', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(545, 0, 'Jobs', 544, '107', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(550, 0, 'SPE220027', 11, '108', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(551, 0, 'Jobs', 550, '108', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(556, 0, 'd&g(dolcegabbana)-016', 0, '', '', 0, 16, 0, 0, 0, 0, 0, 0, '', '', '2022-12-02 14:51:29', '2022-12-02 14:51:29'),
(557, 0, 'SPE220028', 11, '109', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(558, 0, 'Jobs', 557, '109', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(559, 0, 'Item001', 557, '109', '', 0, 0, 0, 77, 0, 0, 0, 0, '', '', '2022-12-02 14:53:42', '2022-12-02 14:53:42'),
(560, 0, 'TRA001', 558, '109', '75', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-02 14:54:37', '2022-12-02 14:54:37'),
(561, 0, '_in', 560, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-02 14:54:37', '2022-12-02 14:54:37'),
(562, 0, '_out', 560, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-02 14:54:37', '2022-12-02 14:54:37'),
(579, 0, 'SPE22,SPE_0006', 3, '110', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(580, 0, 'Jobs', 579, '110', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(586, 0, 'Data', 585, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(587, 0, 'Projects', 585, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(588, 0, 'Invoice', 585, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(589, 0, 'fasttranslator-010', 0, '', '', 17, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-05 20:42:24', '2022-12-05 20:42:24'),
(590, 0, 'Data', 589, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-12-05 20:42:24', '2022-12-05 20:42:24'),
(591, 0, 'Projects', 589, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-12-05 20:42:24', '2022-12-05 20:42:24'),
(592, 0, 'Invoice', 589, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-12-05 20:42:24', '2022-12-05 20:42:24'),
(593, 0, 'SPEU_0002', 591, '111', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(594, 0, 'Jobs', 593, '111', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tms_filemanager` (`fmanager_id`, `role_id`, `name`, `parent_id`, `order_id`, `job_id`, `client_id`, `in_client_id`, `user_id`, `item_id`, `is_default_folder`, `is_project_folder`, `is_ex_project_folder`, `f_id`, `ext`, `size`, `created_date`, `updated_date`) VALUES
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
(677, 0, '_out', 675, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-12 18:04:13', '2022-12-12 18:04:13'),
(686, 0, 'Data', 685, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(687, 0, 'Projects', 685, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(688, 0, 'Invoice', 685, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(689, 0, 'msscapetownthelanguageagency-010', 0, '', '', 19, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-15 23:34:18', '2022-12-15 23:34:18'),
(690, 0, 'Data', 689, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-12-15 23:34:18', '2022-12-15 23:34:18'),
(691, 0, 'Projects', 689, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-12-15 23:34:18', '2022-12-15 23:34:18'),
(692, 0, 'Invoice', 689, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-12-15 23:34:18', '2022-12-15 23:34:18'),
(693, 0, 'resorba-020', 0, '', '', 0, 20, 0, 0, 0, 0, 0, 0, '', '', '2022-12-15 23:37:07', '2022-12-15 23:37:07'),
(694, 0, 'SPEU_0008', 691, '132', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(695, 0, 'Jobs', 694, '132', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(696, 0, 'Item001', 694, '132', '', 0, 0, 0, 97, 0, 0, 0, 0, '', '', '2022-12-15 23:38:26', '2022-12-15 23:38:26'),
(697, 0, 'TRA001', 695, '132', '96', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-15 23:39:10', '2022-12-15 23:39:10'),
(698, 0, '_in', 697, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-15 23:39:10', '2022-12-15 23:39:10'),
(699, 0, '_out', 697, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-15 23:39:10', '2022-12-15 23:39:10'),
(700, 0, 'SPE_0014', 469, '133', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(701, 0, 'Jobs', 700, '133', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(706, 0, 'shopify-021', 0, '', '', 0, 21, 0, 0, 0, 0, 0, 0, '', '', '2022-12-15 23:53:23', '2022-12-15 23:53:23'),
(707, 0, 'derivco-022', 0, '', '', 0, 22, 0, 0, 0, 0, 0, 0, '', '', '2022-12-15 23:54:55', '2022-12-15 23:54:55'),
(708, 0, 'SPE_0015', 469, '134', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(709, 0, 'Jobs', 708, '134', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(710, 0, 'Item001', 708, '134', '', 0, 0, 0, 99, 0, 0, 0, 0, '', '', '2022-12-15 23:56:26', '2022-12-15 23:56:26'),
(711, 0, 'TRA001', 709, '134', '98', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-15 23:57:03', '2022-12-15 23:57:03'),
(712, 0, '_in', 711, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-15 23:57:03', '2022-12-15 23:57:03'),
(713, 0, '_out', 711, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-15 23:57:03', '2022-12-15 23:57:03'),
(714, 1, '731_R_Derivco_first_tasks_in_memoQ_-_NO.msg', 710, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'msg', '1.15 MB', '2022-12-15 23:57:50', '2022-12-15 23:57:50'),
(715, 1, '646_R_Derivco_first_tasks_in_memoQ_-_NO.msg', 710, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'msg', '1.15 MB', '2022-12-15 23:58:22', '2022-12-15 23:58:22'),
(716, 1, '590_R_Derivco_first_tasks_in_memoQ_-_NO.msg', 710, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'msg', '1.15 MB', '2022-12-15 23:58:33', '2022-12-15 23:58:33'),
(717, 1, '380_INSPO.docx', 710, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '0 bytes', '2022-12-16 00:01:23', '2022-12-16 00:01:23'),
(718, 0, 'gthtranslation-010', 0, '', '', 20, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-16 00:10:25', '2022-12-16 00:10:25'),
(719, 0, 'Data', 718, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-12-16 00:10:25', '2022-12-16 00:10:25'),
(720, 0, 'Projects', 718, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-12-16 00:10:25', '2022-12-16 00:10:25'),
(721, 0, 'Invoice', 718, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-12-16 00:10:25', '2022-12-16 00:10:25'),
(722, 0, 'SPEU_0009', 720, '135', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(723, 0, 'Jobs', 722, '135', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(724, 0, 'Item001', 722, '135', '', 0, 0, 0, 100, 0, 0, 0, 0, '', '', '2022-12-16 00:14:14', '2022-12-16 00:14:14'),
(725, 0, 'PRF001', 723, '135', '99', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-16 00:14:50', '2022-12-16 00:14:50'),
(726, 0, '_in', 725, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-16 00:14:50', '2022-12-16 00:14:50'),
(727, 0, '_out', 725, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-16 00:14:50', '2022-12-16 00:14:50'),
(728, 0, 'SPEU_0010', 11, '136', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(729, 0, 'Jobs', 728, '136', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(730, 0, 'Item001', 728, '136', '', 0, 0, 0, 101, 0, 0, 0, 0, '', '', '2022-12-16 00:17:53', '2022-12-16 00:17:53'),
(731, 0, 'PRF001', 729, '136', '100', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-16 00:18:59', '2022-12-16 00:18:59'),
(732, 0, '_in', 731, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-16 00:18:59', '2022-12-16 00:18:59'),
(733, 0, '_out', 731, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-16 00:18:59', '2022-12-16 00:18:59'),
(734, 1, '140_DATAWORDS__CHANEL__PRJ-01371__PIM__INTERSTELLAR__PROOFREADING__391_WORDS__NO.rar', 730, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'rar', '271.64 KB', '2022-12-16 00:19:48', '2022-12-16 00:19:48'),
(735, 0, 'rwsmoravia-010', 0, '', '', 21, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-16 00:23:00', '2022-12-16 00:23:00'),
(736, 0, 'Data', 735, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-12-16 00:23:00', '2022-12-16 00:23:00'),
(737, 0, 'Projects', 735, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-12-16 00:23:00', '2022-12-16 00:23:00'),
(738, 0, 'Invoice', 735, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-12-16 00:23:00', '2022-12-16 00:23:00'),
(739, 0, 'SPEU_0011', 737, '137', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(740, 0, 'Jobs', 739, '137', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(741, 0, 'Item001', 739, '137', '', 0, 0, 0, 102, 0, 0, 0, 0, '', '', '2022-12-16 00:24:53', '2022-12-16 00:24:53'),
(742, 0, 'PRF001', 740, '137', '101', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-16 00:25:41', '2022-12-16 00:25:41'),
(743, 0, '_in', 742, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-16 00:25:41', '2022-12-16 00:25:41'),
(744, 0, '_out', 742, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-16 00:25:41', '2022-12-16 00:25:41'),
(745, 0, 'SPE_0016', 469, '138', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(746, 0, 'Jobs', 745, '138', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(751, 1, '891_English_[EN]___Norwegian_(Bokmaal)_[NB]-2022_1500_EN___NB_1_7-NO_Proof_(1)_(1).pdf', 724, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '107.70 KB', '2022-12-16 13:48:28', '2022-12-16 13:48:28'),
(752, 0, 'SPE_0017', 428, '140', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(753, 0, 'Jobs', 752, '140', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(754, 0, 'Item001', 752, '140', '', 0, 0, 0, 104, 0, 0, 0, 0, '', '', '2022-12-16 13:51:49', '2022-12-16 13:51:49'),
(755, 0, 'PRF001', 753, '140', '103', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-16 13:52:40', '2022-12-16 13:52:40'),
(756, 0, '_in', 755, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-16 13:52:40', '2022-12-16 13:52:40'),
(757, 0, '_out', 755, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-16 13:52:40', '2022-12-16 13:52:40'),
(758, 1, '627_Norwegian_(computational)_linguisttranslator.rar', 754, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'rar', '525.02 KB', '2022-12-16 13:53:44', '2022-12-16 13:53:44'),
(760, 1, '733_TMS_Feedback_-_11.11.2022_-_Scoops_and_Clients.docx', 27, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '683.42 KB', '2022-12-23 18:37:37', '2022-12-23 18:37:37'),
(761, 0, 'cartier-023', 0, '', '', 0, 23, 0, 0, 0, 0, 0, 0, '', '', '2022-12-26 19:33:51', '2022-12-26 19:33:51'),
(762, 0, 'SPEU_0012', 11, '142', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(763, 0, 'Jobs', 762, '142', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(764, 0, 'Item001', 762, '142', '', 0, 0, 0, 105, 0, 0, 0, 0, '', '', '2022-12-26 19:34:38', '2022-12-26 19:34:38'),
(765, 0, 'SPEU_0013', 11, '143', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(766, 0, 'Jobs', 765, '143', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(767, 0, 'Item001', 765, '143', '', 0, 0, 0, 106, 0, 0, 0, 0, '', '', '2022-12-26 19:37:42', '2022-12-26 19:37:42'),
(768, 0, 'TRA001', 766, '143', '104', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-26 19:40:18', '2022-12-26 19:40:18'),
(769, 0, '_in', 768, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-26 19:40:18', '2022-12-26 19:40:18'),
(770, 0, '_out', 768, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-26 19:40:18', '2022-12-26 19:40:18'),
(771, 0, 'TRA001', 763, '142', '105', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-26 19:42:15', '2022-12-26 19:42:15'),
(772, 0, '_in', 771, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-26 19:42:15', '2022-12-26 19:42:15'),
(773, 0, '_out', 771, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-26 19:42:15', '2022-12-26 19:42:15'),
(774, 0, 'kikocosmetics-024', 0, '', '', 0, 24, 0, 0, 0, 0, 0, 0, '', '', '2022-12-26 19:43:38', '2022-12-26 19:43:38'),
(775, 0, 'SPEU_0014', 11, '144', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(776, 0, 'Jobs', 775, '144', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(777, 0, 'Item001', 775, '144', '', 0, 0, 0, 107, 0, 0, 0, 0, '', '', '2022-12-26 19:44:23', '2022-12-26 19:44:23'),
(778, 0, 'TRA001', 776, '144', '106', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-26 19:45:11', '2022-12-26 19:45:11'),
(779, 0, '_in', 778, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-26 19:45:11', '2022-12-26 19:45:11'),
(780, 0, '_out', 778, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-26 19:45:11', '2022-12-26 19:45:11'),
(781, 0, 'SPEU_0015', 11, '145', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(782, 0, 'Jobs', 781, '145', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(783, 0, 'Item001', 781, '145', '', 0, 0, 0, 108, 0, 0, 0, 0, '', '', '2022-12-26 19:52:18', '2022-12-26 19:52:18'),
(784, 0, 'TRA001', 782, '145', '107', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-26 19:53:34', '2022-12-26 19:53:34'),
(785, 0, '_in', 784, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-26 19:53:34', '2022-12-26 19:53:34'),
(786, 0, '_out', 784, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-26 19:53:34', '2022-12-26 19:53:34'),
(787, 0, 'marstranslation-010', 0, '', '', 22, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-26 20:24:54', '2022-12-26 20:24:54'),
(788, 0, 'Data', 787, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-12-26 20:24:54', '2022-12-26 20:24:54'),
(789, 0, 'Projects', 787, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-12-26 20:24:54', '2022-12-26 20:24:54'),
(790, 0, 'Invoice', 787, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-12-26 20:24:54', '2022-12-26 20:24:54'),
(791, 0, 'SPEU_0016', 789, '146', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(792, 0, 'Jobs', 791, '146', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(793, 0, 'Item001', 791, '146', '', 0, 0, 0, 109, 0, 0, 0, 0, '', '', '2022-12-26 20:31:23', '2022-12-26 20:31:23'),
(794, 0, 'Item002', 791, '146', '', 0, 0, 0, 110, 0, 0, 0, 0, '', '', '2022-12-26 20:31:23', '2022-12-26 20:31:23'),
(795, 0, 'TRA001', 792, '146', '108', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-26 20:32:15', '2022-12-26 20:32:15'),
(796, 0, '_in', 795, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-26 20:32:15', '2022-12-26 20:32:15'),
(797, 0, '_out', 795, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-26 20:32:15', '2022-12-26 20:32:15'),
(798, 0, 'TRA002', 792, '146', '109', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-26 20:33:06', '2022-12-26 20:33:06'),
(799, 0, '_in', 798, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-26 20:33:06', '2022-12-26 20:33:06'),
(800, 0, '_out', 798, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-26 20:33:06', '2022-12-26 20:33:06'),
(801, 0, 'gslshenzhen(glodomlanguagesolutions)-010', 0, '', '', 23, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-26 20:39:52', '2022-12-26 20:39:52'),
(802, 0, 'Data', 801, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-12-26 20:39:52', '2022-12-26 20:39:52'),
(803, 0, 'Projects', 801, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-12-26 20:39:52', '2022-12-26 20:39:52'),
(804, 0, 'Invoice', 801, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2022-12-26 20:39:52', '2022-12-26 20:39:52'),
(805, 0, 'fujifilm-025', 0, '', '', 0, 25, 0, 0, 0, 0, 0, 0, '', '', '2022-12-26 20:47:31', '2022-12-26 20:47:31'),
(806, 0, 'SPEU_0017', 803, '149', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(807, 0, 'Jobs', 806, '149', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(809, 0, 'Item002', 806, '149', '', 0, 0, 0, 112, 0, 0, 0, 0, '', '', '2022-12-26 20:48:19', '2022-12-26 20:48:19'),
(813, 0, 'TRA002', 807, '149', '111', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-26 20:49:49', '2022-12-26 20:49:49'),
(814, 0, '_in', 813, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-26 20:49:49', '2022-12-26 20:49:49'),
(815, 0, '_out', 813, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-26 20:49:49', '2022-12-26 20:49:49'),
(816, 1, '598_PO-2768_NO_JIRA.pdf', 710, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '24.51 KB', '2022-12-27 13:58:52', '2022-12-27 13:58:52'),
(817, 0, 'SPE_0018', 54, '150', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(818, 0, 'Jobs', 817, '150', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(819, 0, 'Item001', 817, '150', '', 0, 0, 0, 113, 0, 0, 0, 0, '', '', '2022-12-27 14:01:21', '2022-12-27 14:01:21'),
(820, 0, 'TRA001', 818, '150', '112', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-27 14:02:04', '2022-12-27 14:02:04'),
(821, 0, '_in', 820, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-27 14:02:04', '2022-12-27 14:02:04'),
(822, 0, '_out', 820, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-27 14:02:04', '2022-12-27 14:02:04'),
(823, 0, 'xgimi-026', 0, '', '', 0, 26, 0, 0, 0, 0, 0, 0, '', '', '2022-12-27 14:13:21', '2022-12-27 14:13:21'),
(824, 0, 'SPEU_0018', 803, '151', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(825, 0, 'Jobs', 824, '151', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(826, 0, 'Item001', 824, '151', '', 0, 0, 0, 114, 0, 0, 0, 0, '', '', '2022-12-27 14:13:57', '2022-12-27 14:13:57'),
(827, 0, 'TRA001', 825, '151', '113', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-27 14:14:51', '2022-12-27 14:14:51'),
(828, 0, '_in', 827, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-27 14:14:51', '2022-12-27 14:14:51'),
(829, 0, '_out', 827, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-27 14:14:51', '2022-12-27 14:14:51'),
(830, 0, 'SPE_0019', 469, '152', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(831, 0, 'Jobs', 830, '152', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(836, 0, 'SPEU_0019', 11, '153', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(837, 0, 'Jobs', 836, '153', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(838, 0, 'Item001', 836, '153', '', 0, 0, 0, 116, 0, 0, 0, 0, '', '', '2022-12-27 14:34:12', '2022-12-27 14:34:12'),
(839, 0, 'TRA001', 837, '153', '115', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-27 14:34:51', '2022-12-27 14:34:51'),
(840, 0, '_in', 839, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-27 14:34:51', '2022-12-27 14:34:51'),
(841, 0, '_out', 839, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-27 14:34:51', '2022-12-27 14:34:51'),
(842, 1, '420_Datawords___Cartier___Social_Media___VDAY_&_BRIDAL___916_words___Proofreading___PRJ-01474___NO.msg', 838, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'msg', '801.50 KB', '2022-12-27 14:35:20', '2022-12-27 14:35:20'),
(843, 0, 'SPEU_0020', 803, '154', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(844, 0, 'Jobs', 843, '154', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(845, 0, 'Item001', 843, '154', '', 0, 0, 0, 117, 0, 0, 0, 0, '', '', '2022-12-27 14:37:23', '2022-12-27 14:37:23'),
(846, 0, 'TRA001', 844, '154', '116', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-27 14:37:47', '2022-12-27 14:37:47'),
(847, 0, '_in', 846, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-27 14:37:47', '2022-12-27 14:37:47'),
(848, 0, '_out', 846, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-12-27 14:37:47', '2022-12-27 14:37:47'),
(849, 1, '767_SO-2022-12-0005——_FY22_186__DR_Support_Translation_-_EN-_DA_NB_PTPT_RU_SV.msg', 845, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'msg', '939.50 KB', '2022-12-27 14:38:22', '2022-12-27 14:38:22'),
(850, 0, 'SPE_0020', 54, '155', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(851, 0, 'Jobs', 850, '155', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(860, 0, 'clarins-027', 0, '', '', 0, 27, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 17:24:38', '2023-01-03 17:24:38'),
(861, 0, 'SPEU_0021', 11, '156', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(862, 0, 'Jobs', 861, '156', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(863, 0, 'Item001', 861, '156', '', 0, 0, 0, 120, 0, 0, 0, 0, '', '', '2023-01-03 17:25:25', '2023-01-03 17:25:25'),
(864, 0, 'TRA001', 862, '156', '119', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 17:26:49', '2023-01-03 17:26:49'),
(865, 0, '_in', 864, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 17:26:49', '2023-01-03 17:26:49'),
(866, 0, '_out', 864, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 17:26:49', '2023-01-03 17:26:49'),
(867, 0, 'SPEU_0022', 11, '157', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(868, 0, 'Jobs', 867, '157', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(869, 0, 'Item001', 867, '157', '', 0, 0, 0, 121, 0, 0, 0, 0, '', '', '2023-01-03 17:27:51', '2023-01-03 17:27:51'),
(870, 0, 'TRA001', 868, '157', '120', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 17:28:27', '2023-01-03 17:28:27'),
(871, 0, '_in', 870, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 17:28:27', '2023-01-03 17:28:27'),
(872, 0, '_out', 870, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 17:28:27', '2023-01-03 17:28:27'),
(873, 0, 'attached-languageintelligence-010', 0, '', '', 24, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 17:36:00', '2023-01-03 17:36:00'),
(874, 0, 'Data', 873, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2023-01-03 17:36:00', '2023-01-03 17:36:00'),
(875, 0, 'Projects', 873, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2023-01-03 17:36:00', '2023-01-03 17:36:00'),
(876, 0, 'Invoice', 873, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2023-01-03 17:36:00', '2023-01-03 17:36:00'),
(877, 0, 'norwegianair-028', 0, '', '', 0, 28, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 17:38:44', '2023-01-03 17:38:44'),
(878, 0, 'SPEU_0023', 875, '158', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(879, 0, 'Jobs', 878, '158', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(880, 0, 'Item001', 878, '158', '', 0, 0, 0, 122, 0, 0, 0, 0, '', '', '2023-01-03 17:39:24', '2023-01-03 17:39:24'),
(881, 0, 'TRA001', 879, '158', '121', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 17:40:29', '2023-01-03 17:40:29'),
(882, 0, '_in', 881, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 17:40:30', '2023-01-03 17:40:30'),
(883, 0, '_out', 881, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 17:40:30', '2023-01-03 17:40:30'),
(884, 1, '836_English_(United_Kingdom)_[EN-GB]___Norwegian_(Bokmaal)_[NB]-2022_3971_03_4-Marthe_Kristoffersen.pdf', 880, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '313.41 KB', '2023-01-03 17:40:52', '2023-01-03 17:40:52'),
(885, 0, 'SPEU_0024', 875, '159', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(886, 0, 'Jobs', 885, '159', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(887, 0, 'Item001', 885, '159', '', 0, 0, 0, 123, 0, 0, 0, 0, '', '', '2023-01-03 17:46:39', '2023-01-03 17:46:39'),
(888, 0, 'TRA001', 886, '159', '122', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 17:47:32', '2023-01-03 17:47:32'),
(889, 0, '_in', 888, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 17:47:32', '2023-01-03 17:47:32'),
(890, 0, '_out', 888, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 17:47:32', '2023-01-03 17:47:32'),
(891, 1, '863_English_(United_Kingdom)_[EN-GB]___Norwegian_(Bokmaal)_[NB]-2022_3957_03_4-Marthe_Kristoffersen.pdf', 887, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '314.10 KB', '2023-01-03 17:47:42', '2023-01-03 17:47:42'),
(892, 0, 'SPEU_0025', 875, '160', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(893, 0, 'Jobs', 892, '160', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(894, 0, 'Item001', 892, '160', '', 0, 0, 0, 124, 0, 0, 0, 0, '', '', '2023-01-03 17:49:04', '2023-01-03 17:49:04'),
(895, 0, 'TRA001', 893, '160', '123', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 17:49:46', '2023-01-03 17:49:46'),
(896, 0, '_in', 895, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 17:49:46', '2023-01-03 17:49:46'),
(897, 0, '_out', 895, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 17:49:46', '2023-01-03 17:49:46'),
(898, 1, '725_English_(United_Kingdom)_[EN-GB]___Norwegian_(Bokmaal)_[NB]-2022_3991_04_4-Marthe_Kristoffersen.pdf', 894, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '310.32 KB', '2023-01-03 17:50:06', '2023-01-03 17:50:06'),
(899, 0, 'SPE_0021', 428, '161', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(900, 0, 'Jobs', 899, '161', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(901, 0, 'Item001', 899, '161', '', 0, 0, 0, 125, 0, 0, 0, 0, '', '', '2023-01-03 18:26:51', '2023-01-03 18:26:51'),
(902, 0, 'TRA001', 900, '161', '124', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 18:27:35', '2023-01-03 18:27:35'),
(903, 0, '_in', 902, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 18:27:35', '2023-01-03 18:27:35'),
(904, 0, '_out', 902, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 18:27:35', '2023-01-03 18:27:35'),
(905, 0, 'SPE_0022', 428, '162', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(906, 0, 'Jobs', 905, '162', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(907, 0, 'Item001', 905, '162', '', 0, 0, 0, 126, 0, 0, 0, 0, '', '', '2023-01-03 18:28:42', '2023-01-03 18:28:42'),
(908, 0, 'TRA001', 906, '162', '125', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 18:29:27', '2023-01-03 18:29:27'),
(909, 0, '_in', 908, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 18:29:27', '2023-01-03 18:29:27'),
(910, 0, '_out', 908, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 18:29:27', '2023-01-03 18:29:27'),
(911, 0, 'lg-029', 0, '', '', 0, 29, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 18:31:44', '2023-01-03 18:31:44'),
(912, 0, 'SPE_0023', 428, '164', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(913, 0, 'Jobs', 912, '164', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(914, 0, 'Item001', 912, '164', '', 0, 0, 0, 127, 0, 0, 0, 0, '', '', '2023-01-03 18:32:24', '2023-01-03 18:32:24'),
(915, 0, 'TRA001', 913, '164', '126', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 18:32:53', '2023-01-03 18:32:53'),
(916, 0, '_in', 915, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 18:32:53', '2023-01-03 18:32:53'),
(917, 0, '_out', 915, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 18:32:53', '2023-01-03 18:32:53'),
(918, 0, 'SPE_0024', 428, '166', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(919, 0, 'Jobs', 918, '166', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(920, 0, 'Item001', 918, '166', '', 0, 0, 0, 128, 0, 0, 0, 0, '', '', '2023-01-03 18:40:49', '2023-01-03 18:40:49'),
(921, 0, 'TRA001', 919, '166', '127', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 18:41:26', '2023-01-03 18:41:26'),
(922, 0, '_in', 921, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 18:41:26', '2023-01-03 18:41:26'),
(923, 0, '_out', 921, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 18:41:26', '2023-01-03 18:41:26'),
(924, 0, 'SPE_0025', 428, '167', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(925, 0, 'Jobs', 924, '167', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(926, 0, 'Item001', 924, '167', '', 0, 0, 0, 129, 0, 0, 0, 0, '', '', '2023-01-03 18:42:48', '2023-01-03 18:42:48'),
(927, 0, 'TRA001', 925, '167', '128', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 18:43:21', '2023-01-03 18:43:21'),
(928, 0, '_in', 927, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 18:43:21', '2023-01-03 18:43:21'),
(929, 0, '_out', 927, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 18:43:21', '2023-01-03 18:43:21'),
(930, 0, 'paypal-030', 0, '', '', 0, 30, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 18:43:57', '2023-01-03 18:43:57'),
(931, 0, 'SPE_0026', 428, '168', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(932, 0, 'Jobs', 931, '168', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(933, 0, 'Item001', 931, '168', '', 0, 0, 0, 130, 0, 0, 0, 0, '', '', '2023-01-03 18:44:32', '2023-01-03 18:44:32'),
(934, 0, 'TRA001', 932, '168', '129', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 18:45:05', '2023-01-03 18:45:05'),
(935, 0, '_in', 934, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 18:45:05', '2023-01-03 18:45:05'),
(936, 0, '_out', 934, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 18:45:05', '2023-01-03 18:45:05'),
(937, 0, 'yahoo-031', 0, '', '', 0, 31, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 18:45:56', '2023-01-03 18:45:56'),
(938, 0, 'SPE_0027', 428, '169', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(939, 0, 'Jobs', 938, '169', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(940, 0, 'Item001', 938, '169', '', 0, 0, 0, 131, 0, 0, 0, 0, '', '', '2023-01-03 18:46:35', '2023-01-03 18:46:35'),
(941, 0, 'TRA001', 939, '169', '130', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 18:47:08', '2023-01-03 18:47:08'),
(942, 0, '_in', 941, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 18:47:08', '2023-01-03 18:47:08'),
(943, 0, '_out', 941, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-03 18:47:08', '2023-01-03 18:47:08'),
(944, 0, 'SPEU_0026', 803, '170', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(945, 0, 'Jobs', 944, '170', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(946, 0, 'Item001', 944, '170', '', 0, 0, 0, 132, 0, 0, 0, 0, '', '', '2023-01-04 19:55:04', '2023-01-04 19:55:04'),
(947, 0, 'TRA001', 945, '170', '131', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-04 19:56:06', '2023-01-04 19:56:06'),
(948, 0, '_in', 947, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-04 19:56:06', '2023-01-04 19:56:06'),
(949, 0, '_out', 947, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-04 19:56:06', '2023-01-04 19:56:06'),
(950, 0, 'SPE_0028', 54, '171', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(951, 0, 'Jobs', 950, '171', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(952, 0, 'Item001', 950, '171', '', 0, 0, 0, 133, 0, 0, 0, 0, '', '', '2023-01-04 20:01:11', '2023-01-04 20:01:11'),
(953, 0, 'PRF001', 951, '171', '132', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-04 20:01:50', '2023-01-04 20:01:50'),
(954, 0, '_in', 953, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-04 20:01:50', '2023-01-04 20:01:50'),
(955, 0, '_out', 953, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-04 20:01:50', '2023-01-04 20:01:50'),
(956, 0, 'SPEU_0027', 803, '172', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(957, 0, 'Jobs', 956, '172', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(958, 0, 'Item001', 956, '172', '', 0, 0, 0, 134, 0, 0, 0, 0, '', '', '2023-01-04 20:05:06', '2023-01-04 20:05:06'),
(959, 0, 'TRA001', 957, '172', '133', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-04 20:05:50', '2023-01-04 20:05:50'),
(960, 0, '_in', 959, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-04 20:05:50', '2023-01-04 20:05:50'),
(961, 0, '_out', 959, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-04 20:05:50', '2023-01-04 20:05:50'),
(962, 0, 'google-032', 0, '', '', 0, 32, 0, 0, 0, 0, 0, 0, '', '', '2023-01-04 20:26:22', '2023-01-04 20:26:22'),
(963, 0, 'SPEU_0028', 737, '173', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(964, 0, 'Jobs', 963, '173', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(965, 0, 'Item001', 963, '173', '', 0, 0, 0, 135, 0, 0, 0, 0, '', '', '2023-01-04 20:27:27', '2023-01-04 20:27:27'),
(966, 0, 'MTP001', 964, '173', '134', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-04 20:28:02', '2023-01-04 20:28:02'),
(967, 0, '_in', 966, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-04 20:28:02', '2023-01-04 20:28:02'),
(968, 0, '_out', 966, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-04 20:28:02', '2023-01-04 20:28:02'),
(969, 0, 'SPEU_0029', 803, '174', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(970, 0, 'Jobs', 969, '174', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(971, 0, 'Item001', 969, '174', '', 0, 0, 0, 136, 0, 0, 0, 0, '', '', '2023-01-04 20:30:45', '2023-01-04 20:30:45'),
(972, 0, 'TRA001', 970, '174', '135', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-04 20:31:28', '2023-01-04 20:31:28'),
(973, 0, '_in', 972, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-04 20:31:28', '2023-01-04 20:31:28'),
(974, 0, '_out', 972, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-04 20:31:28', '2023-01-04 20:31:28'),
(975, 0, 'SPEU_0030', 875, '176', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(976, 0, 'Jobs', 975, '176', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(977, 0, 'SPEU_0030', 875, '176', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(978, 0, 'Jobs', 975, '176', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(983, 0, 'TRA001', 976, '176', '137', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-04 20:45:11', '2023-01-04 20:45:11'),
(984, 0, '_in', 983, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-04 20:45:11', '2023-01-04 20:45:11'),
(985, 0, '_out', 983, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-04 20:45:11', '2023-01-04 20:45:11'),
(986, 0, 'SPEU_0031', 875, '177', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(987, 0, 'Jobs', 986, '177', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1009, 0, 'klm-033', 0, '', '', 0, 33, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 13:46:36', '2023-01-05 13:46:36'),
(1010, 0, 'SPEU_0032', 875, '178', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1011, 0, 'Jobs', 1010, '178', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1012, 0, 'Item001', 1010, '178', '', 0, 0, 0, 144, 0, 0, 0, 0, '', '', '2023-01-05 13:47:32', '2023-01-05 13:47:32'),
(1013, 0, 'TRA001', 1011, '178', '143', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 13:48:18', '2023-01-05 13:48:18'),
(1014, 0, '_in', 1013, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 13:48:18', '2023-01-05 13:48:18'),
(1015, 0, '_out', 1013, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 13:48:19', '2023-01-05 13:48:19'),
(1016, 0, 'SPEU_0033', 803, '179', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1017, 0, 'Jobs', 1016, '179', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1018, 0, 'Item001', 1016, '179', '', 0, 0, 0, 145, 0, 0, 0, 0, '', '', '2023-01-05 13:50:21', '2023-01-05 13:50:21'),
(1019, 0, 'TRA001', 1017, '179', '144', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 13:51:13', '2023-01-05 13:51:13'),
(1020, 0, '_in', 1019, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 13:51:13', '2023-01-05 13:51:13'),
(1021, 0, '_out', 1019, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 13:51:13', '2023-01-05 13:51:13'),
(1022, 0, 'Item002', 1016, '179', '', 0, 0, 0, 146, 0, 0, 0, 0, '', '', '2023-01-05 13:52:04', '2023-01-05 13:52:04'),
(1023, 0, 'TRA002', 1017, '179', '145', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 13:52:50', '2023-01-05 13:52:50'),
(1024, 0, '_in', 1023, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 13:52:50', '2023-01-05 13:52:50'),
(1025, 0, '_out', 1023, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 13:52:50', '2023-01-05 13:52:50'),
(1026, 0, 'SPEU_0034', 803, '180', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1027, 0, 'Jobs', 1026, '180', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1028, 0, 'Item001', 1026, '180', '', 0, 0, 0, 147, 0, 0, 0, 0, '', '', '2023-01-05 13:54:03', '2023-01-05 13:54:03'),
(1029, 0, 'TRA001', 1027, '180', '146', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 13:55:11', '2023-01-05 13:55:11'),
(1030, 0, '_in', 1029, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 13:55:11', '2023-01-05 13:55:11'),
(1031, 0, '_out', 1029, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 13:55:11', '2023-01-05 13:55:11'),
(1032, 0, 'SPE_0029', 469, '181', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1033, 0, 'Jobs', 1032, '181', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1034, 0, 'Item001', 1032, '181', '', 0, 0, 0, 148, 0, 0, 0, 0, '', '', '2023-01-05 13:56:26', '2023-01-05 13:56:26'),
(1035, 0, 'TRA001', 1033, '181', '147', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 13:57:23', '2023-01-05 13:57:23'),
(1036, 0, '_in', 1035, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 13:57:23', '2023-01-05 13:57:23'),
(1037, 0, '_out', 1035, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 13:57:23', '2023-01-05 13:57:23'),
(1038, 0, 'SPE_0030', 428, '182', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1039, 0, 'Jobs', 1038, '182', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1040, 0, 'Item001', 1038, '182', '', 0, 0, 0, 149, 0, 0, 0, 0, '', '', '2023-01-05 13:58:45', '2023-01-05 13:58:45'),
(1041, 0, 'TRA001', 1039, '182', '148', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 13:59:29', '2023-01-05 13:59:29'),
(1042, 0, '_in', 1041, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 13:59:29', '2023-01-05 13:59:29'),
(1043, 0, '_out', 1041, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 13:59:29', '2023-01-05 13:59:29'),
(1044, 0, 'SPE_0031', 428, '184', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1045, 0, 'Jobs', 1044, '184', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1046, 0, 'Item001', 1044, '184', '', 0, 0, 0, 150, 0, 0, 0, 0, '', '', '2023-01-05 14:01:30', '2023-01-05 14:01:30'),
(1047, 0, 'TRA001', 1045, '184', '149', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:02:01', '2023-01-05 14:02:01'),
(1048, 0, '_in', 1047, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:02:01', '2023-01-05 14:02:01'),
(1049, 0, '_out', 1047, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:02:01', '2023-01-05 14:02:01'),
(1050, 0, 'SPEU_0035', 207, '185', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1051, 0, 'Jobs', 1050, '185', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1052, 0, 'Item001', 1050, '185', '', 0, 0, 0, 151, 0, 0, 0, 0, '', '', '2023-01-05 14:03:09', '2023-01-05 14:03:09'),
(1053, 0, 'TRA001', 1051, '185', '150', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:03:40', '2023-01-05 14:03:40'),
(1054, 0, '_in', 1053, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:03:40', '2023-01-05 14:03:40'),
(1055, 0, '_out', 1053, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:03:40', '2023-01-05 14:03:40'),
(1056, 0, 'sdlnorway-010', 0, '', '', 25, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:06:27', '2023-01-05 14:06:27'),
(1057, 0, 'Data', 1056, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2023-01-05 14:06:27', '2023-01-05 14:06:27'),
(1058, 0, 'Projects', 1056, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2023-01-05 14:06:27', '2023-01-05 14:06:27'),
(1059, 0, 'Invoice', 1056, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2023-01-05 14:06:27', '2023-01-05 14:06:27'),
(1060, 0, 'mgr-034', 0, '', '', 0, 34, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:13:04', '2023-01-05 14:13:04'),
(1061, 0, 'canon-035', 0, '', '', 0, 35, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:13:50', '2023-01-05 14:13:50'),
(1062, 0, 'lindex-036', 0, '', '', 0, 36, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:14:20', '2023-01-05 14:14:20'),
(1064, 0, 'bms-038', 0, '', '', 0, 38, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:15:32', '2023-01-05 14:15:32'),
(1065, 0, 'mangroup-039', 0, '', '', 0, 39, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:16:10', '2023-01-05 14:16:10'),
(1066, 0, 'SPEU_0036', 1058, '186', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1067, 0, 'Jobs', 1066, '186', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1072, 0, 'SPEU_0037', 1058, '187', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1073, 0, 'Jobs', 1072, '187', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1074, 0, 'Item001', 1072, '187', '', 0, 0, 0, 153, 0, 0, 0, 0, '', '', '2023-01-05 14:20:57', '2023-01-05 14:20:57'),
(1075, 0, 'Item002', 1072, '187', '', 0, 0, 0, 154, 0, 0, 0, 0, '', '', '2023-01-05 14:20:57', '2023-01-05 14:20:57'),
(1076, 0, 'MTP001', 1073, '187', '152', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:21:36', '2023-01-05 14:21:36'),
(1077, 0, '_in', 1076, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:21:36', '2023-01-05 14:21:36'),
(1078, 0, '_out', 1076, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:21:36', '2023-01-05 14:21:36'),
(1079, 0, 'MTP002', 1073, '187', '153', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:22:28', '2023-01-05 14:22:28'),
(1080, 0, '_in', 1079, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:22:28', '2023-01-05 14:22:28'),
(1081, 0, '_out', 1079, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:22:28', '2023-01-05 14:22:28'),
(1082, 0, 'SPEU_0038', 1058, '189', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1083, 0, 'Jobs', 1082, '189', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1084, 0, 'Item001', 1082, '189', '', 0, 0, 0, 155, 0, 0, 0, 0, '', '', '2023-01-05 14:25:15', '2023-01-05 14:25:15'),
(1085, 0, 'MTP001', 1083, '189', '154', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:26:12', '2023-01-05 14:26:12'),
(1086, 0, '_in', 1085, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:26:12', '2023-01-05 14:26:12'),
(1087, 0, '_out', 1085, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:26:12', '2023-01-05 14:26:12'),
(1088, 0, 'Item002', 1082, '189', '', 0, 0, 0, 156, 0, 0, 0, 0, '', '', '2023-01-05 14:26:59', '2023-01-05 14:26:59'),
(1089, 0, 'MTP002', 1083, '189', '155', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:27:45', '2023-01-05 14:27:45'),
(1090, 0, '_in', 1089, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:27:45', '2023-01-05 14:27:45'),
(1091, 0, '_out', 1089, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:27:45', '2023-01-05 14:27:45'),
(1092, 0, 'Item003', 1082, '189', '', 0, 0, 0, 157, 0, 0, 0, 0, '', '', '2023-01-05 14:28:45', '2023-01-05 14:28:45'),
(1093, 0, 'MTP003', 1083, '189', '156', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:29:25', '2023-01-05 14:29:25'),
(1094, 0, '_in', 1093, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:29:25', '2023-01-05 14:29:25'),
(1095, 0, '_out', 1093, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:29:25', '2023-01-05 14:29:25'),
(1096, 0, 'SPEU_0039', 1058, '192', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1097, 0, 'Jobs', 1096, '192', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tms_filemanager` (`fmanager_id`, `role_id`, `name`, `parent_id`, `order_id`, `job_id`, `client_id`, `in_client_id`, `user_id`, `item_id`, `is_default_folder`, `is_project_folder`, `is_ex_project_folder`, `f_id`, `ext`, `size`, `created_date`, `updated_date`) VALUES
(1098, 0, 'Item001', 1096, '192', '', 0, 0, 0, 158, 0, 0, 0, 0, '', '', '2023-01-05 14:34:57', '2023-01-05 14:34:57'),
(1099, 0, 'TRA001', 1097, '192', '157', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:35:35', '2023-01-05 14:35:35'),
(1100, 0, '_in', 1099, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:35:35', '2023-01-05 14:35:35'),
(1101, 0, '_out', 1099, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:35:35', '2023-01-05 14:35:35'),
(1102, 0, 'Item002', 1096, '192', '', 0, 0, 0, 159, 0, 0, 0, 0, '', '', '2023-01-05 14:36:12', '2023-01-05 14:36:12'),
(1103, 0, 'MTP002', 1097, '192', '158', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:36:50', '2023-01-05 14:36:50'),
(1104, 0, '_in', 1103, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:36:50', '2023-01-05 14:36:50'),
(1105, 0, '_out', 1103, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:36:50', '2023-01-05 14:36:50'),
(1106, 0, 'SPEU_0040', 1058, '193', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1107, 0, 'Jobs', 1106, '193', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1108, 0, 'Item001', 1106, '193', '', 0, 0, 0, 160, 0, 0, 0, 0, '', '', '2023-01-05 14:41:30', '2023-01-05 14:41:30'),
(1109, 0, 'TRA001', 1107, '193', '159', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:42:21', '2023-01-05 14:42:21'),
(1110, 0, '_in', 1109, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:42:21', '2023-01-05 14:42:21'),
(1111, 0, '_out', 1109, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:42:21', '2023-01-05 14:42:21'),
(1112, 0, 'Item002', 1106, '193', '', 0, 0, 0, 161, 0, 0, 0, 0, '', '', '2023-01-05 14:43:03', '2023-01-05 14:43:03'),
(1113, 0, 'TRA002', 1107, '193', '160', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:43:49', '2023-01-05 14:43:49'),
(1114, 0, '_in', 1113, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:43:49', '2023-01-05 14:43:49'),
(1115, 0, '_out', 1113, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:43:49', '2023-01-05 14:43:49'),
(1116, 0, 'SPEU_0041', 1058, '194', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1117, 0, 'Jobs', 1116, '194', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1118, 0, 'Item001', 1116, '194', '', 0, 0, 0, 162, 0, 0, 0, 0, '', '', '2023-01-05 14:45:39', '2023-01-05 14:45:39'),
(1119, 0, 'TRA001', 1117, '194', '161', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:46:11', '2023-01-05 14:46:11'),
(1120, 0, '_in', 1119, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:46:11', '2023-01-05 14:46:11'),
(1121, 0, '_out', 1119, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 14:46:11', '2023-01-05 14:46:11'),
(1122, 0, 'SPEU_0042', 1058, '195', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1123, 0, 'Jobs', 1122, '195', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1132, 0, 'sdllimited|unitedkingdom-maidenhead-010', 0, '', '', 26, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 15:40:51', '2023-01-05 15:40:51'),
(1133, 0, 'Data', 1132, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2023-01-05 15:40:51', '2023-01-05 15:40:51'),
(1134, 0, 'Projects', 1132, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2023-01-05 15:40:51', '2023-01-05 15:40:51'),
(1135, 0, 'Invoice', 1132, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2023-01-05 15:40:51', '2023-01-05 15:40:51'),
(1136, 0, 'SPEU_0043', 1134, '197', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1137, 0, 'Jobs', 1136, '197', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1138, 0, 'Item001', 1136, '197', '', 0, 0, 0, 165, 0, 0, 0, 0, '', '', '2023-01-05 15:44:03', '2023-01-05 15:44:03'),
(1139, 0, 'TRA001', 1137, '197', '164', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 15:44:43', '2023-01-05 15:44:43'),
(1140, 0, '_in', 1139, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 15:44:43', '2023-01-05 15:44:43'),
(1141, 0, '_out', 1139, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 15:44:43', '2023-01-05 15:44:43'),
(1142, 0, 'external-0006', 0, '', '', 0, 0, 22, 0, 0, 0, 0, 0, '', '', '2023-01-05 15:59:13', '2023-01-05 15:59:13'),
(1143, 0, 'Data', 1142, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1144, 0, 'Projects', 1142, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1145, 0, 'Invoice', 1142, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1146, 0, 'external-0007', 0, '', '', 0, 0, 23, 0, 0, 0, 0, 0, '', '', '2023-01-05 16:04:04', '2023-01-05 16:04:04'),
(1147, 0, 'Data', 1146, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1148, 0, 'Projects', 1146, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1149, 0, 'Invoice', 1146, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1150, 0, 'external-0008', 0, '', '', 0, 0, 24, 0, 0, 0, 0, 0, '', '', '2023-01-05 16:09:36', '2023-01-05 16:09:36'),
(1151, 0, 'Data', 1150, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1152, 0, 'Projects', 1150, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1153, 0, 'Invoice', 1150, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1154, 0, 'Item002', 93, '33', '', 0, 0, 0, 166, 0, 0, 0, 0, '', '', '2023-01-05 16:22:20', '2023-01-05 16:22:20'),
(1155, 0, 'TRA002', 94, '33', '165', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 16:22:53', '2023-01-05 16:22:53'),
(1156, 0, '_in', 1155, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 16:22:53', '2023-01-05 16:22:53'),
(1157, 0, '_out', 1155, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 16:22:53', '2023-01-05 16:22:53'),
(1158, 0, 'Item003', 93, '33', '', 0, 0, 0, 167, 0, 0, 0, 0, '', '', '2023-01-05 16:23:13', '2023-01-05 16:23:13'),
(1159, 0, 'TRA003', 94, '33', '166', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 16:23:38', '2023-01-05 16:23:38'),
(1160, 0, '_in', 1159, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 16:23:38', '2023-01-05 16:23:38'),
(1161, 0, '_out', 1159, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 16:23:38', '2023-01-05 16:23:38'),
(1162, 0, 'SPEU_0044', 207, '198', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1163, 0, 'Jobs', 1162, '198', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1164, 0, 'Item001', 1162, '198', '', 0, 0, 0, 168, 0, 0, 0, 0, '', '', '2023-01-05 16:32:23', '2023-01-05 16:32:23'),
(1165, 0, 'PRF001', 1163, '198', '167', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 16:32:50', '2023-01-05 16:32:50'),
(1166, 0, '_in', 1165, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 16:32:50', '2023-01-05 16:32:50'),
(1167, 0, '_out', 1165, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-05 16:32:50', '2023-01-05 16:32:50'),
(1170, 1, '734_test1.msg', 27, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'msg', '11.00 KB', '2023-01-10 16:48:41', '2023-01-10 16:48:41'),
(1171, 0, 'SPE_0032', 428, '199', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1172, 0, 'Jobs', 1171, '199', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1173, 0, 'Item001', 1171, '199', '', 0, 0, 0, 169, 0, 0, 0, 0, '', '', '2023-01-10 23:59:20', '2023-01-10 23:59:20'),
(1174, 0, 'TRA001', 1172, '199', '168', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-11 00:01:03', '2023-01-11 00:01:03'),
(1175, 0, '_in', 1174, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-11 00:01:03', '2023-01-11 00:01:03'),
(1176, 0, '_out', 1174, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-11 00:01:03', '2023-01-11 00:01:03'),
(1178, 0, 'Data', 1177, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1179, 0, 'Projects', 1177, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1180, 0, 'Invoice', 1177, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1181, 0, 'SPEU_0045', 591, '200', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1182, 0, 'Jobs', 1181, '200', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1183, 0, 'Item001', 1181, '200', '', 0, 0, 0, 170, 0, 0, 0, 0, '', '', '2023-01-12 15:14:00', '2023-01-12 15:14:00'),
(1184, 0, 'TRA001', 1182, '200', '169', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-12 15:15:32', '2023-01-12 15:15:32'),
(1185, 0, '_in', 1184, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-12 15:15:32', '2023-01-12 15:15:32'),
(1186, 0, '_out', 1184, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-12 15:15:32', '2023-01-12 15:15:32'),
(1187, 0, 'SPE_0033', 469, '201', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1188, 0, 'Jobs', 1187, '201', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1189, 0, 'Item001', 1187, '201', '', 0, 0, 0, 171, 0, 0, 0, 0, '', '', '2023-01-12 17:46:02', '2023-01-12 17:46:02'),
(1190, 0, 'TRA001', 1188, '201', '170', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-12 17:46:27', '2023-01-12 17:46:27'),
(1191, 0, '_in', 1190, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-12 17:46:27', '2023-01-12 17:46:27'),
(1192, 0, '_out', 1190, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-12 17:46:27', '2023-01-12 17:46:27'),
(1194, 0, 'Data', 1193, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1195, 0, 'Projects', 1193, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1196, 0, 'Invoice', 1193, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1198, 0, 'Data', 1197, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1199, 0, 'Projects', 1197, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1200, 0, 'Invoice', 1197, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1202, 0, 'Data', 1201, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1203, 0, 'Projects', 1201, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1204, 0, 'Invoice', 1201, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1205, 0, 'Item002', 1010, '178', '', 0, 0, 0, 172, 0, 0, 0, 0, '', '', '2023-01-13 14:17:56', '2023-01-13 14:17:56'),
(1206, 0, 'TRA002', 1011, '178', '171', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-13 14:18:48', '2023-01-13 14:18:48'),
(1207, 0, '_in', 1206, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-13 14:18:48', '2023-01-13 14:18:48'),
(1208, 0, '_out', 1206, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-13 14:18:48', '2023-01-13 14:18:48'),
(1210, 0, 'Data', 1209, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1211, 0, 'Projects', 1209, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1212, 0, 'Invoice', 1209, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1214, 0, 'Data', 1213, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1215, 0, 'Projects', 1213, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1216, 0, 'Invoice', 1213, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1217, 0, 'external-0010', 0, '', '', 0, 0, 31, 0, 0, 0, 0, 0, '', '', '2023-01-13 22:18:40', '2023-01-13 22:18:40'),
(1218, 0, 'Data', 1217, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1219, 0, 'Projects', 1217, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1220, 0, 'Invoice', 1217, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1221, 0, 'SPEU_0046', 1058, '203', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1222, 0, 'Jobs', 1221, '203', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1223, 0, 'Item001', 1221, '203', '', 0, 0, 0, 173, 0, 0, 0, 0, '', '', '2023-01-15 16:30:29', '2023-01-15 16:30:29'),
(1224, 0, 'MTP001', 1222, '203', '172', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 16:31:06', '2023-01-15 16:31:06'),
(1225, 0, '_in', 1224, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 16:31:06', '2023-01-15 16:31:06'),
(1226, 0, '_out', 1224, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 16:31:06', '2023-01-15 16:31:06'),
(1227, 0, 'Item002', 1221, '203', '', 0, 0, 0, 174, 0, 0, 0, 0, '', '', '2023-01-15 16:35:40', '2023-01-15 16:35:40'),
(1228, 0, 'MTP002', 1222, '203', '173', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 16:36:19', '2023-01-15 16:36:19'),
(1229, 0, '_in', 1228, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 16:36:19', '2023-01-15 16:36:19'),
(1230, 0, '_out', 1228, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 16:36:19', '2023-01-15 16:36:19'),
(1231, 0, 'Item003', 1221, '203', '', 0, 0, 0, 175, 0, 0, 0, 0, '', '', '2023-01-15 16:38:38', '2023-01-15 16:38:38'),
(1232, 0, 'MTP003', 1222, '203', '174', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 16:40:06', '2023-01-15 16:40:06'),
(1233, 0, '_in', 1232, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 16:40:06', '2023-01-15 16:40:06'),
(1234, 0, '_out', 1232, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 16:40:06', '2023-01-15 16:40:06'),
(1235, 0, 'Item004', 1221, '203', '', 0, 0, 0, 176, 0, 0, 0, 0, '', '', '2023-01-15 16:41:13', '2023-01-15 16:41:13'),
(1236, 0, 'MTP004', 1222, '203', '175', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 16:41:48', '2023-01-15 16:41:48'),
(1237, 0, '_in', 1236, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 16:41:48', '2023-01-15 16:41:48'),
(1238, 0, '_out', 1236, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 16:41:48', '2023-01-15 16:41:48'),
(1239, 0, 'Item005', 1221, '203', '', 0, 0, 0, 177, 0, 0, 0, 0, '', '', '2023-01-15 16:43:31', '2023-01-15 16:43:31'),
(1240, 0, 'MTP005', 1222, '203', '176', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 16:44:10', '2023-01-15 16:44:10'),
(1241, 0, '_in', 1240, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 16:44:10', '2023-01-15 16:44:10'),
(1242, 0, '_out', 1240, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 16:44:10', '2023-01-15 16:44:10'),
(1243, 0, 'Item002', 1187, '201', '', 0, 0, 0, 178, 0, 0, 0, 0, '', '', '2023-01-15 16:55:33', '2023-01-15 16:55:33'),
(1244, 0, 'Item003', 1187, '201', '', 0, 0, 0, 179, 0, 0, 0, 0, '', '', '2023-01-15 16:55:33', '2023-01-15 16:55:33'),
(1245, 0, 'Item004', 1187, '201', '', 0, 0, 0, 180, 0, 0, 0, 0, '', '', '2023-01-15 16:55:33', '2023-01-15 16:55:33'),
(1246, 0, 'Item005', 1187, '201', '', 0, 0, 0, 181, 0, 0, 0, 0, '', '', '2023-01-15 16:55:33', '2023-01-15 16:55:33'),
(1247, 0, 'Item006', 1187, '201', '', 0, 0, 0, 182, 0, 0, 0, 0, '', '', '2023-01-15 16:55:33', '2023-01-15 16:55:33'),
(1248, 0, 'Item007', 1187, '201', '', 0, 0, 0, 183, 0, 0, 0, 0, '', '', '2023-01-15 16:55:39', '2023-01-15 16:55:39'),
(1249, 0, 'Item008', 1187, '201', '', 0, 0, 0, 184, 0, 0, 0, 0, '', '', '2023-01-15 16:55:39', '2023-01-15 16:55:39'),
(1250, 0, 'TRA002', 1188, '201', '177', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 16:56:20', '2023-01-15 16:56:20'),
(1251, 0, '_in', 1250, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 16:56:20', '2023-01-15 16:56:20'),
(1252, 0, '_out', 1250, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 16:56:20', '2023-01-15 16:56:20'),
(1253, 0, 'TRA003', 1188, '201', '178', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 16:56:45', '2023-01-15 16:56:45'),
(1254, 0, '_in', 1253, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 16:56:45', '2023-01-15 16:56:45'),
(1255, 0, '_out', 1253, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 16:56:45', '2023-01-15 16:56:45'),
(1256, 0, 'TRA004', 1188, '201', '179', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 16:57:09', '2023-01-15 16:57:09'),
(1257, 0, '_in', 1256, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 16:57:09', '2023-01-15 16:57:09'),
(1258, 0, '_out', 1256, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 16:57:09', '2023-01-15 16:57:09'),
(1259, 0, 'TRA005', 1188, '201', '180', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 16:57:33', '2023-01-15 16:57:33'),
(1260, 0, '_in', 1259, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 16:57:33', '2023-01-15 16:57:33'),
(1261, 0, '_out', 1259, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 16:57:33', '2023-01-15 16:57:33'),
(1262, 0, 'TRA006', 1188, '201', '181', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 16:57:54', '2023-01-15 16:57:54'),
(1263, 0, '_in', 1262, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 16:57:54', '2023-01-15 16:57:54'),
(1264, 0, '_out', 1262, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 16:57:54', '2023-01-15 16:57:54'),
(1265, 0, 'TRA007', 1188, '201', '182', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 16:58:18', '2023-01-15 16:58:18'),
(1266, 0, '_in', 1265, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 16:58:18', '2023-01-15 16:58:18'),
(1267, 0, '_out', 1265, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 16:58:18', '2023-01-15 16:58:18'),
(1268, 0, 'TRA008', 1188, '201', '183', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 16:58:43', '2023-01-15 16:58:43'),
(1269, 0, '_in', 1268, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 16:58:43', '2023-01-15 16:58:43'),
(1270, 0, '_out', 1268, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 16:58:43', '2023-01-15 16:58:43'),
(1271, 0, 'SPEU_0047', 875, '204', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1272, 0, 'Jobs', 1271, '204', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1273, 0, 'Item001', 1271, '204', '', 0, 0, 0, 185, 0, 0, 0, 0, '', '', '2023-01-15 17:10:25', '2023-01-15 17:10:25'),
(1274, 0, 'MTP001', 1272, '204', '184', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 17:10:59', '2023-01-15 17:10:59'),
(1275, 0, '_in', 1274, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 17:10:59', '2023-01-15 17:10:59'),
(1276, 0, '_out', 1274, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-15 17:10:59', '2023-01-15 17:10:59'),
(1278, 0, 'Data', 1277, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1279, 0, 'Projects', 1277, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1280, 0, 'Invoice', 1277, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1282, 0, 'Data', 1281, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1283, 0, 'Projects', 1281, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1284, 0, 'Invoice', 1281, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1286, 0, 'Data', 1285, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1287, 0, 'Projects', 1285, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1288, 0, 'Invoice', 1285, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1289, 0, 'SPEU_0048', 1058, '205', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1290, 0, 'Jobs', 1289, '205', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1291, 0, 'Item001', 1289, '205', '', 0, 0, 0, 186, 0, 0, 0, 0, '', '', '2023-01-17 01:24:36', '2023-01-17 01:24:36'),
(1292, 0, 'MTP001', 1290, '205', '185', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-17 01:25:21', '2023-01-17 01:25:21'),
(1293, 0, '_in', 1292, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-17 01:25:21', '2023-01-17 01:25:21'),
(1294, 0, '_out', 1292, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-17 01:25:21', '2023-01-17 01:25:21'),
(1295, 0, 'SPEU_0049', 207, '207', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1296, 0, 'Jobs', 1295, '207', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1297, 0, 'Item001', 1295, '207', '', 0, 0, 0, 187, 0, 0, 0, 0, '', '', '2023-01-17 01:36:08', '2023-01-17 01:36:08'),
(1298, 0, 'TRA001', 1296, '207', '186', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-17 01:37:03', '2023-01-17 01:37:03'),
(1299, 0, '_in', 1298, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-17 01:37:03', '2023-01-17 01:37:03'),
(1300, 0, '_out', 1298, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-17 01:37:03', '2023-01-17 01:37:03'),
(1301, 0, 'SPE_0034', 428, '208', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1302, 0, 'Jobs', 1301, '208', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1303, 0, 'Item001', 1301, '208', '', 0, 0, 0, 188, 0, 0, 0, 0, '', '', '2023-01-18 13:40:59', '2023-01-18 13:40:59'),
(1304, 0, 'TRA001', 1302, '208', '187', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-18 13:41:35', '2023-01-18 13:41:35'),
(1305, 0, '_in', 1304, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-18 13:41:35', '2023-01-18 13:41:35'),
(1306, 0, '_out', 1304, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-18 13:41:35', '2023-01-18 13:41:35'),
(1307, 0, 'Item009', 1187, '201', '', 0, 0, 0, 189, 0, 0, 0, 0, '', '', '2023-01-18 13:46:50', '2023-01-18 13:46:50'),
(1308, 0, 'Item010', 1187, '201', '', 0, 0, 0, 190, 0, 0, 0, 0, '', '', '2023-01-18 13:46:50', '2023-01-18 13:46:50'),
(1309, 0, 'Item011', 1187, '201', '', 0, 0, 0, 191, 0, 0, 0, 0, '', '', '2023-01-18 13:46:50', '2023-01-18 13:46:50'),
(1310, 0, 'Item012', 1187, '201', '', 0, 0, 0, 192, 0, 0, 0, 0, '', '', '2023-01-18 13:46:50', '2023-01-18 13:46:50'),
(1311, 0, 'Item013', 1187, '201', '', 0, 0, 0, 193, 0, 0, 0, 0, '', '', '2023-01-18 13:46:50', '2023-01-18 13:46:50'),
(1312, 0, 'TRA009', 1188, '201', '188', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-18 13:47:55', '2023-01-18 13:47:55'),
(1313, 0, '_in', 1312, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-18 13:47:55', '2023-01-18 13:47:55'),
(1314, 0, '_out', 1312, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-18 13:47:55', '2023-01-18 13:47:55'),
(1315, 0, 'TRA010', 1188, '201', '189', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-18 13:49:12', '2023-01-18 13:49:12'),
(1316, 0, '_in', 1315, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-18 13:49:12', '2023-01-18 13:49:12'),
(1317, 0, '_out', 1315, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-18 13:49:12', '2023-01-18 13:49:12'),
(1318, 0, 'TRA011', 1188, '201', '190', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-18 13:50:08', '2023-01-18 13:50:08'),
(1319, 0, '_in', 1318, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-18 13:50:08', '2023-01-18 13:50:08'),
(1320, 0, '_out', 1318, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-18 13:50:08', '2023-01-18 13:50:08'),
(1321, 0, 'TRA012', 1188, '201', '191', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-18 13:50:58', '2023-01-18 13:50:58'),
(1322, 0, '_in', 1321, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-18 13:50:58', '2023-01-18 13:50:58'),
(1323, 0, '_out', 1321, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-18 13:50:58', '2023-01-18 13:50:58'),
(1324, 0, 'TRA013', 1188, '201', '192', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-18 13:52:56', '2023-01-18 13:52:56'),
(1325, 0, '_in', 1324, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-18 13:52:56', '2023-01-18 13:52:56'),
(1326, 0, '_out', 1324, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-18 13:52:56', '2023-01-18 13:52:56'),
(1327, 0, 'Item014', 1187, '201', '', 0, 0, 0, 194, 0, 0, 0, 0, '', '', '2023-01-18 13:54:22', '2023-01-18 13:54:22'),
(1328, 0, 'TRA014', 1188, '201', '193', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-18 13:55:00', '2023-01-18 13:55:00'),
(1329, 0, '_in', 1328, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-18 13:55:00', '2023-01-18 13:55:00'),
(1330, 0, '_out', 1328, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-18 13:55:00', '2023-01-18 13:55:00'),
(1331, 0, 'SPEU_0050', 803, '209', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1332, 0, 'Jobs', 1331, '209', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1333, 0, 'Item001', 1331, '209', '', 0, 0, 0, 195, 0, 0, 0, 0, '', '', '2023-01-18 13:57:36', '2023-01-18 13:57:36'),
(1334, 0, 'TRA001', 1332, '209', '194', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-18 13:58:03', '2023-01-18 13:58:03'),
(1335, 0, '_in', 1334, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-18 13:58:03', '2023-01-18 13:58:03'),
(1336, 0, '_out', 1334, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-18 13:58:03', '2023-01-18 13:58:03'),
(1337, 0, 'SPE220029', 181, '210', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1338, 0, 'Jobs', 1337, '210', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1339, 0, 'Item001', 1337, '210', '', 0, 0, 0, 196, 0, 0, 0, 0, '', '', '2023-01-18 13:59:38', '2023-01-18 13:59:38'),
(1340, 0, 'TRA001', 1338, '210', '195', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-18 14:00:09', '2023-01-18 14:00:09'),
(1341, 0, '_in', 1340, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-18 14:00:09', '2023-01-18 14:00:09'),
(1342, 0, '_out', 1340, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-18 14:00:09', '2023-01-18 14:00:09'),
(1343, 0, 'SPEU_0051', 11, '211', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1344, 0, 'Jobs', 1343, '211', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1345, 0, 'Item001', 1343, '211', '', 0, 0, 0, 197, 0, 0, 0, 0, '', '', '2023-01-18 14:02:03', '2023-01-18 14:02:03'),
(1346, 0, 'TRA001', 1344, '211', '196', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-18 14:02:32', '2023-01-18 14:02:32'),
(1347, 0, '_in', 1346, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-18 14:02:32', '2023-01-18 14:02:32'),
(1348, 0, '_out', 1346, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-18 14:02:32', '2023-01-18 14:02:32'),
(1349, 0, 'SPEU_0052', 737, '212', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1350, 0, 'Jobs', 1349, '212', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1351, 0, 'Item001', 1349, '212', '', 0, 0, 0, 198, 0, 0, 0, 0, '', '', '2023-01-24 00:58:37', '2023-01-24 00:58:37'),
(1352, 0, 'MTP001', 1350, '212', '197', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-24 00:59:07', '2023-01-24 00:59:07'),
(1353, 0, '_in', 1352, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-24 00:59:07', '2023-01-24 00:59:07'),
(1354, 0, '_out', 1352, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-24 00:59:07', '2023-01-24 00:59:07'),
(1355, 0, 'jonckers-010', 0, '', '', 27, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:20:57', '2023-01-25 00:20:57'),
(1356, 0, 'Data', 1355, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2023-01-25 00:20:57', '2023-01-25 00:20:57'),
(1357, 0, 'Projects', 1355, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2023-01-25 00:20:57', '2023-01-25 00:20:57'),
(1358, 0, 'Invoice', 1355, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2023-01-25 00:20:57', '2023-01-25 00:20:57'),
(1359, 0, 'SPEU_0053', 1357, '214', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1360, 0, 'Jobs', 1359, '214', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1361, 0, 'Item001', 1359, '214', '', 0, 0, 0, 199, 0, 0, 0, 0, '', '', '2023-01-25 00:24:35', '2023-01-25 00:24:35'),
(1362, 0, 'PRF001', 1360, '214', '198', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:25:07', '2023-01-25 00:25:07'),
(1363, 0, '_in', 1362, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:25:07', '2023-01-25 00:25:07'),
(1364, 0, '_out', 1362, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:25:07', '2023-01-25 00:25:07'),
(1365, 0, 'SPEU_0054', 1357, '215', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1366, 0, 'Jobs', 1365, '215', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1367, 0, 'Item001', 1365, '215', '', 0, 0, 0, 200, 0, 0, 0, 0, '', '', '2023-01-25 00:26:30', '2023-01-25 00:26:30'),
(1368, 0, 'PRF001', 1366, '215', '199', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:26:56', '2023-01-25 00:26:56'),
(1369, 0, '_in', 1368, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:26:56', '2023-01-25 00:26:56'),
(1370, 0, '_out', 1368, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:26:56', '2023-01-25 00:26:56'),
(1371, 0, 'SPEU_0055', 1357, '217', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1372, 0, 'Jobs', 1371, '217', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1373, 0, 'Item001', 1371, '217', '', 0, 0, 0, 201, 0, 0, 0, 0, '', '', '2023-01-25 00:29:20', '2023-01-25 00:29:20'),
(1374, 0, 'PRF001', 1372, '217', '200', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:29:49', '2023-01-25 00:29:49'),
(1375, 0, '_in', 1374, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:29:49', '2023-01-25 00:29:49'),
(1376, 0, '_out', 1374, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:29:49', '2023-01-25 00:29:49'),
(1377, 0, 'SPE_0035', 428, '218', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1378, 0, 'Jobs', 1377, '218', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1379, 0, 'Item001', 1377, '218', '', 0, 0, 0, 202, 0, 0, 0, 0, '', '', '2023-01-25 00:31:04', '2023-01-25 00:31:04'),
(1380, 0, 'TRA001', 1378, '218', '201', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:31:35', '2023-01-25 00:31:35'),
(1381, 0, '_in', 1380, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:31:35', '2023-01-25 00:31:35'),
(1382, 0, '_out', 1380, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:31:35', '2023-01-25 00:31:35'),
(1383, 0, 'SPEU_0056', 875, '219', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1384, 0, 'Jobs', 1383, '219', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1385, 0, 'Item001', 1383, '219', '', 0, 0, 0, 203, 0, 0, 0, 0, '', '', '2023-01-25 00:37:38', '2023-01-25 00:37:38'),
(1386, 0, 'MTP001', 1384, '219', '202', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:38:07', '2023-01-25 00:38:07'),
(1387, 0, '_in', 1386, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:38:07', '2023-01-25 00:38:07'),
(1388, 0, '_out', 1386, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:38:07', '2023-01-25 00:38:07'),
(1389, 0, 'summalinguaetechnologiescanadainc.-010', 0, '', '', 28, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:42:20', '2023-01-25 00:42:20'),
(1390, 0, 'Data', 1389, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2023-01-25 00:42:20', '2023-01-25 00:42:20'),
(1391, 0, 'Projects', 1389, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2023-01-25 00:42:20', '2023-01-25 00:42:20'),
(1392, 0, 'Invoice', 1389, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2023-01-25 00:42:20', '2023-01-25 00:42:20'),
(1393, 0, 'SPEU_0057', 1391, '220', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1394, 0, 'Jobs', 1393, '220', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1395, 0, 'Item001', 1393, '220', '', 0, 0, 0, 204, 0, 0, 0, 0, '', '', '2023-01-25 00:43:59', '2023-01-25 00:43:59'),
(1396, 0, 'PRF001', 1394, '220', '203', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:44:52', '2023-01-25 00:44:52'),
(1397, 0, '_in', 1396, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:44:52', '2023-01-25 00:44:52'),
(1398, 0, '_out', 1396, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:44:52', '2023-01-25 00:44:52'),
(1399, 0, 'SPE_0036', 54, '221', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1400, 0, 'Jobs', 1399, '221', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1401, 0, 'Item001', 1399, '221', '', 0, 0, 0, 205, 0, 0, 0, 0, '', '', '2023-01-25 00:46:43', '2023-01-25 00:46:43'),
(1402, 0, 'PRF001', 1400, '221', '204', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:47:39', '2023-01-25 00:47:39'),
(1403, 0, '_in', 1402, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:47:39', '2023-01-25 00:47:39'),
(1404, 0, '_out', 1402, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:47:39', '2023-01-25 00:47:39'),
(1405, 0, 'SPEU_0058', 803, '222', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1406, 0, 'Jobs', 1405, '222', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1407, 0, 'Item001', 1405, '222', '', 0, 0, 0, 206, 0, 0, 0, 0, '', '', '2023-01-25 00:48:49', '2023-01-25 00:48:49'),
(1408, 0, 'TRA001', 1406, '222', '205', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:49:22', '2023-01-25 00:49:22'),
(1409, 0, '_in', 1408, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:49:22', '2023-01-25 00:49:22'),
(1410, 0, '_out', 1408, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:49:22', '2023-01-25 00:49:22'),
(1411, 0, 'SPE_0037', 428, '223', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1412, 0, 'Jobs', 1411, '223', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1413, 0, 'Item001', 1411, '223', '', 0, 0, 0, 207, 0, 0, 0, 0, '', '', '2023-01-25 00:50:28', '2023-01-25 00:50:28'),
(1414, 0, 'TRA001', 1412, '223', '206', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:51:09', '2023-01-25 00:51:09'),
(1415, 0, '_in', 1414, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:51:09', '2023-01-25 00:51:09'),
(1416, 0, '_out', 1414, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:51:09', '2023-01-25 00:51:09'),
(1417, 0, 'SPEU_0059', 1134, '224', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1418, 0, 'Jobs', 1417, '224', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1419, 0, 'Item001', 1417, '224', '', 0, 0, 0, 208, 0, 0, 0, 0, '', '', '2023-01-25 00:54:15', '2023-01-25 00:54:15'),
(1420, 0, 'TRA001', 1418, '224', '207', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:55:00', '2023-01-25 00:55:00'),
(1421, 0, '_in', 1420, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:55:00', '2023-01-25 00:55:00'),
(1422, 0, '_out', 1420, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:55:00', '2023-01-25 00:55:00'),
(1423, 0, 'SPEU_0060', 803, '225', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1424, 0, 'Jobs', 1423, '225', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1425, 0, 'Item001', 1423, '225', '', 0, 0, 0, 209, 0, 0, 0, 0, '', '', '2023-01-25 00:56:05', '2023-01-25 00:56:05'),
(1426, 0, 'TRA001', 1424, '225', '208', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:56:34', '2023-01-25 00:56:34'),
(1427, 0, '_in', 1426, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:56:34', '2023-01-25 00:56:34'),
(1428, 0, '_out', 1426, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:56:34', '2023-01-25 00:56:34'),
(1429, 0, 'tussitaikurit-040', 0, '', '', 0, 40, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:57:16', '2023-01-25 00:57:16'),
(1430, 0, 'SPE_0038', 428, '226', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1431, 0, 'Jobs', 1430, '226', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1432, 0, 'Item001', 1430, '226', '', 0, 0, 0, 210, 0, 0, 0, 0, '', '', '2023-01-25 00:58:13', '2023-01-25 00:58:13'),
(1433, 0, 'TRA001', 1431, '226', '209', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:59:00', '2023-01-25 00:59:00'),
(1434, 0, '_in', 1433, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:59:00', '2023-01-25 00:59:00'),
(1435, 0, '_out', 1433, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 00:59:00', '2023-01-25 00:59:00'),
(1436, 0, 'SPEU_0061', 737, '227', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1437, 0, 'Jobs', 1436, '227', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1438, 0, 'Item001', 1436, '227', '', 0, 0, 0, 211, 0, 0, 0, 0, '', '', '2023-01-25 23:25:12', '2023-01-25 23:25:12'),
(1439, 0, 'Item002', 1436, '227', '', 0, 0, 0, 212, 0, 0, 0, 0, '', '', '2023-01-25 23:25:12', '2023-01-25 23:25:12'),
(1440, 0, 'MTP001', 1437, '227', '210', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:25:55', '2023-01-25 23:25:55'),
(1441, 0, '_in', 1440, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:25:55', '2023-01-25 23:25:55'),
(1442, 0, '_out', 1440, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:25:55', '2023-01-25 23:25:55'),
(1443, 0, 'MTP002', 1437, '227', '211', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:26:33', '2023-01-25 23:26:33'),
(1444, 0, '_in', 1443, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:26:33', '2023-01-25 23:26:33'),
(1445, 0, '_out', 1443, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:26:33', '2023-01-25 23:26:33'),
(1446, 0, 'SPE_0039', 428, '228', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1447, 0, 'Jobs', 1446, '228', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1448, 0, 'Item001', 1446, '228', '', 0, 0, 0, 213, 0, 0, 0, 0, '', '', '2023-01-25 23:31:24', '2023-01-25 23:31:24'),
(1449, 0, 'TRA001', 1447, '228', '212', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:32:08', '2023-01-25 23:32:08'),
(1450, 0, '_in', 1449, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:32:08', '2023-01-25 23:32:08'),
(1451, 0, '_out', 1449, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:32:08', '2023-01-25 23:32:08'),
(1452, 0, 'SPEU_0062', 737, '229', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1453, 0, 'Jobs', 1452, '229', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1454, 0, 'Item001', 1452, '229', '', 0, 0, 0, 214, 0, 0, 0, 0, '', '', '2023-01-25 23:34:28', '2023-01-25 23:34:28'),
(1455, 0, 'Item002', 1452, '229', '', 0, 0, 0, 215, 0, 0, 0, 0, '', '', '2023-01-25 23:34:28', '2023-01-25 23:34:28'),
(1456, 0, 'Item003', 1452, '229', '', 0, 0, 0, 216, 0, 0, 0, 0, '', '', '2023-01-25 23:34:28', '2023-01-25 23:34:28'),
(1457, 0, 'Item004', 1452, '229', '', 0, 0, 0, 217, 0, 0, 0, 0, '', '', '2023-01-25 23:34:28', '2023-01-25 23:34:28'),
(1458, 0, 'Item005', 1452, '229', '', 0, 0, 0, 218, 0, 0, 0, 0, '', '', '2023-01-25 23:34:28', '2023-01-25 23:34:28'),
(1459, 0, 'MTP001', 1453, '229', '213', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:35:04', '2023-01-25 23:35:04'),
(1460, 0, '_in', 1459, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:35:04', '2023-01-25 23:35:04'),
(1461, 0, '_out', 1459, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:35:04', '2023-01-25 23:35:04'),
(1462, 0, 'MTP002', 1453, '229', '214', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:35:50', '2023-01-25 23:35:50'),
(1463, 0, '_in', 1462, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:35:50', '2023-01-25 23:35:50'),
(1464, 0, '_out', 1462, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:35:50', '2023-01-25 23:35:50'),
(1465, 0, 'MTP003', 1453, '229', '215', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:36:30', '2023-01-25 23:36:30'),
(1466, 0, '_in', 1465, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:36:30', '2023-01-25 23:36:30'),
(1467, 0, '_out', 1465, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:36:30', '2023-01-25 23:36:30'),
(1468, 0, 'MTP004', 1453, '229', '216', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:37:09', '2023-01-25 23:37:09'),
(1469, 0, '_in', 1468, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:37:09', '2023-01-25 23:37:09'),
(1470, 0, '_out', 1468, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:37:09', '2023-01-25 23:37:09'),
(1471, 0, 'MTP005', 1453, '229', '217', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:37:52', '2023-01-25 23:37:52'),
(1472, 0, '_in', 1471, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:37:52', '2023-01-25 23:37:52'),
(1473, 0, '_out', 1471, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:37:52', '2023-01-25 23:37:52'),
(1474, 0, 'SPEU_0063', 875, '230', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1475, 0, 'Jobs', 1474, '230', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1476, 0, 'Item001', 1474, '230', '', 0, 0, 0, 219, 0, 0, 0, 0, '', '', '2023-01-25 23:47:32', '2023-01-25 23:47:32'),
(1477, 0, 'TRA001', 1475, '230', '218', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:47:57', '2023-01-25 23:47:57'),
(1478, 0, '_in', 1477, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:47:57', '2023-01-25 23:47:57'),
(1479, 0, '_out', 1477, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:47:58', '2023-01-25 23:47:58'),
(1480, 0, 'SPE_0040', 428, '231', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1481, 0, 'Jobs', 1480, '231', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1482, 0, 'Item001', 1480, '231', '', 0, 0, 0, 220, 0, 0, 0, 0, '', '', '2023-01-25 23:49:36', '2023-01-25 23:49:36'),
(1483, 0, 'PRF001', 1481, '231', '219', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:50:17', '2023-01-25 23:50:17'),
(1484, 0, '_in', 1483, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:50:17', '2023-01-25 23:50:17'),
(1485, 0, '_out', 1483, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:50:17', '2023-01-25 23:50:17'),
(1486, 0, 'SPE_0041', 469, '232', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1487, 0, 'Jobs', 1486, '232', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1488, 0, 'Item001', 1486, '232', '', 0, 0, 0, 221, 0, 0, 0, 0, '', '', '2023-01-25 23:51:53', '2023-01-25 23:51:53'),
(1489, 0, 'PRF001', 1487, '232', '220', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:52:26', '2023-01-25 23:52:26'),
(1490, 0, '_in', 1489, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:52:26', '2023-01-25 23:52:26'),
(1491, 0, '_out', 1489, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:52:26', '2023-01-25 23:52:26'),
(1492, 0, 'SPEU_0064', 207, '233', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1493, 0, 'Jobs', 1492, '233', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1494, 0, 'Item001', 1492, '233', '', 0, 0, 0, 222, 0, 0, 0, 0, '', '', '2023-01-25 23:53:56', '2023-01-25 23:53:56'),
(1495, 0, 'TRA001', 1493, '233', '221', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:54:22', '2023-01-25 23:54:22'),
(1496, 0, '_in', 1495, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:54:22', '2023-01-25 23:54:22'),
(1497, 0, '_out', 1495, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:54:22', '2023-01-25 23:54:22'),
(1498, 0, 'SPEU_0065', 1357, '234', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1499, 0, 'Jobs', 1498, '234', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1500, 0, 'Item001', 1498, '234', '', 0, 0, 0, 223, 0, 0, 0, 0, '', '', '2023-01-25 23:57:14', '2023-01-25 23:57:14'),
(1501, 0, 'PRF001', 1499, '234', '222', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:57:39', '2023-01-25 23:57:39'),
(1502, 0, '_in', 1501, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:57:39', '2023-01-25 23:57:39'),
(1503, 0, '_out', 1501, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:57:39', '2023-01-25 23:57:39'),
(1504, 0, 'SPE_0042', 428, '235', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1505, 0, 'Jobs', 1504, '235', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1506, 0, 'Item001', 1504, '235', '', 0, 0, 0, 224, 0, 0, 0, 0, '', '', '2023-01-25 23:59:06', '2023-01-25 23:59:06'),
(1507, 0, 'PRF001', 1505, '235', '223', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:59:43', '2023-01-25 23:59:43'),
(1508, 0, '_in', 1507, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:59:43', '2023-01-25 23:59:43'),
(1509, 0, '_out', 1507, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-25 23:59:43', '2023-01-25 23:59:43'),
(1510, 0, 'SPEU_0066', 1357, '236', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1511, 0, 'Jobs', 1510, '236', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1512, 0, 'Item001', 1510, '236', '', 0, 0, 0, 225, 0, 0, 0, 0, '', '', '2023-01-26 00:02:17', '2023-01-26 00:02:17'),
(1513, 0, 'PRF001', 1511, '236', '224', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:02:40', '2023-01-26 00:02:40'),
(1514, 0, '_in', 1513, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:02:40', '2023-01-26 00:02:40'),
(1515, 0, '_out', 1513, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:02:40', '2023-01-26 00:02:40'),
(1516, 0, 'SPE_0043', 428, '237', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1517, 0, 'Jobs', 1516, '237', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1518, 0, 'Item001', 1516, '237', '', 0, 0, 0, 226, 0, 0, 0, 0, '', '', '2023-01-26 00:09:54', '2023-01-26 00:09:54'),
(1519, 0, 'PRF001', 1517, '237', '225', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:10:34', '2023-01-26 00:10:34'),
(1520, 0, '_in', 1519, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:10:34', '2023-01-26 00:10:34'),
(1521, 0, '_out', 1519, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:10:34', '2023-01-26 00:10:34'),
(1522, 0, 'SPEU_0067', 207, '238', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1523, 0, 'Jobs', 1522, '238', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1524, 0, 'Item001', 1522, '238', '', 0, 0, 0, 227, 0, 0, 0, 0, '', '', '2023-01-26 00:11:52', '2023-01-26 00:11:52'),
(1525, 0, 'TRA001', 1523, '238', '226', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:12:35', '2023-01-26 00:12:35'),
(1526, 0, '_in', 1525, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:12:35', '2023-01-26 00:12:35'),
(1527, 0, '_out', 1525, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:12:35', '2023-01-26 00:12:35'),
(1528, 0, 'SPE_0044', 428, '239', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1529, 0, 'Jobs', 1528, '239', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1530, 0, 'Item001', 1528, '239', '', 0, 0, 0, 228, 0, 0, 0, 0, '', '', '2023-01-26 00:14:23', '2023-01-26 00:14:23'),
(1531, 0, 'TRA001', 1529, '239', '227', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:14:52', '2023-01-26 00:14:52'),
(1532, 0, '_in', 1531, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:14:52', '2023-01-26 00:14:52'),
(1533, 0, '_out', 1531, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:14:52', '2023-01-26 00:14:52'),
(1534, 0, 'SPE_0045', 469, '240', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1535, 0, 'Jobs', 1534, '240', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1536, 0, 'Item001', 1534, '240', '', 0, 0, 0, 229, 0, 0, 0, 0, '', '', '2023-01-26 00:18:43', '2023-01-26 00:18:43'),
(1537, 0, 'Item002', 1534, '240', '', 0, 0, 0, 230, 0, 0, 0, 0, '', '', '2023-01-26 00:18:43', '2023-01-26 00:18:43'),
(1538, 0, 'Item003', 1534, '240', '', 0, 0, 0, 231, 0, 0, 0, 0, '', '', '2023-01-26 00:18:43', '2023-01-26 00:18:43'),
(1539, 0, 'Item004', 1534, '240', '', 0, 0, 0, 232, 0, 0, 0, 0, '', '', '2023-01-26 00:18:43', '2023-01-26 00:18:43'),
(1540, 0, 'Item005', 1534, '240', '', 0, 0, 0, 233, 0, 0, 0, 0, '', '', '2023-01-26 00:18:43', '2023-01-26 00:18:43'),
(1541, 0, 'TRA001', 1535, '240', '228', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:19:15', '2023-01-26 00:19:15'),
(1542, 0, '_in', 1541, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:19:15', '2023-01-26 00:19:15'),
(1543, 0, '_out', 1541, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:19:15', '2023-01-26 00:19:15'),
(1544, 0, 'TRA002', 1535, '240', '229', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:19:48', '2023-01-26 00:19:48'),
(1545, 0, '_in', 1544, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:19:48', '2023-01-26 00:19:48'),
(1546, 0, '_out', 1544, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:19:48', '2023-01-26 00:19:48'),
(1547, 0, 'TRA003', 1535, '240', '230', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:20:24', '2023-01-26 00:20:24'),
(1548, 0, '_in', 1547, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:20:24', '2023-01-26 00:20:24'),
(1549, 0, '_out', 1547, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:20:24', '2023-01-26 00:20:24'),
(1550, 0, 'TRA004', 1535, '240', '231', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:21:01', '2023-01-26 00:21:01'),
(1551, 0, '_in', 1550, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:21:01', '2023-01-26 00:21:01'),
(1552, 0, '_out', 1550, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:21:01', '2023-01-26 00:21:01'),
(1553, 0, 'TRA005', 1535, '240', '232', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:21:38', '2023-01-26 00:21:38'),
(1554, 0, '_in', 1553, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:21:38', '2023-01-26 00:21:38'),
(1555, 0, '_out', 1553, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:21:38', '2023-01-26 00:21:38');
INSERT INTO `tms_filemanager` (`fmanager_id`, `role_id`, `name`, `parent_id`, `order_id`, `job_id`, `client_id`, `in_client_id`, `user_id`, `item_id`, `is_default_folder`, `is_project_folder`, `is_ex_project_folder`, `f_id`, `ext`, `size`, `created_date`, `updated_date`) VALUES
(1556, 0, 'SPE_0046', 469, '241', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1557, 0, 'Jobs', 1556, '241', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1558, 0, 'Item001', 1556, '241', '', 0, 0, 0, 234, 0, 0, 0, 0, '', '', '2023-01-26 00:25:16', '2023-01-26 00:25:16'),
(1559, 0, 'Item002', 1556, '241', '', 0, 0, 0, 235, 0, 0, 0, 0, '', '', '2023-01-26 00:25:16', '2023-01-26 00:25:16'),
(1560, 0, 'TRA001', 1557, '241', '233', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:25:40', '2023-01-26 00:25:40'),
(1561, 0, '_in', 1560, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:25:40', '2023-01-26 00:25:40'),
(1562, 0, '_out', 1560, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:25:40', '2023-01-26 00:25:40'),
(1563, 0, 'TRA002', 1557, '241', '234', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:26:12', '2023-01-26 00:26:12'),
(1564, 0, '_in', 1563, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:26:12', '2023-01-26 00:26:12'),
(1565, 0, '_out', 1563, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:26:12', '2023-01-26 00:26:12'),
(1566, 0, 'SPEU_0068', 737, '242', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1567, 0, 'Jobs', 1566, '242', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1568, 0, 'Item001', 1566, '242', '', 0, 0, 0, 236, 0, 0, 0, 0, '', '', '2023-01-26 00:27:51', '2023-01-26 00:27:51'),
(1569, 0, 'Item002', 1566, '242', '', 0, 0, 0, 237, 0, 0, 0, 0, '', '', '2023-01-26 00:27:51', '2023-01-26 00:27:51'),
(1570, 0, 'MTP001', 1567, '242', '235', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:28:16', '2023-01-26 00:28:16'),
(1571, 0, '_in', 1570, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:28:16', '2023-01-26 00:28:16'),
(1572, 0, '_out', 1570, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:28:16', '2023-01-26 00:28:16'),
(1573, 0, 'MTP002', 1567, '242', '236', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:28:48', '2023-01-26 00:28:48'),
(1574, 0, '_in', 1573, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:28:48', '2023-01-26 00:28:48'),
(1575, 0, '_out', 1573, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:28:48', '2023-01-26 00:28:48'),
(1576, 0, 'SPEU_0069', 737, '243', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1577, 0, 'Jobs', 1576, '243', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1578, 0, 'Item001', 1576, '243', '', 0, 0, 0, 238, 0, 0, 0, 0, '', '', '2023-01-26 00:30:17', '2023-01-26 00:30:17'),
(1579, 0, 'Item002', 1576, '243', '', 0, 0, 0, 239, 0, 0, 0, 0, '', '', '2023-01-26 00:30:17', '2023-01-26 00:30:17'),
(1580, 0, 'MTP001', 1577, '243', '237', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:30:38', '2023-01-26 00:30:38'),
(1581, 0, '_in', 1580, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:30:38', '2023-01-26 00:30:38'),
(1582, 0, '_out', 1580, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:30:38', '2023-01-26 00:30:38'),
(1583, 0, 'MTP002', 1577, '243', '238', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:31:08', '2023-01-26 00:31:08'),
(1584, 0, '_in', 1583, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:31:08', '2023-01-26 00:31:08'),
(1585, 0, '_out', 1583, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:31:08', '2023-01-26 00:31:08'),
(1586, 0, 'SPEU_0070', 11, '244', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1587, 0, 'Jobs', 1586, '244', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1588, 0, 'Item001', 1586, '244', '', 0, 0, 0, 240, 0, 0, 0, 0, '', '', '2023-01-26 00:40:20', '2023-01-26 00:40:20'),
(1589, 0, 'TRA001', 1587, '244', '239', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:40:49', '2023-01-26 00:40:49'),
(1590, 0, '_in', 1589, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:40:49', '2023-01-26 00:40:49'),
(1591, 0, '_out', 1589, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-26 00:40:49', '2023-01-26 00:40:49'),
(1592, 0, 'SPEU_0071', 1357, '245', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1593, 0, 'Jobs', 1592, '245', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1594, 0, 'Item001', 1592, '245', '', 0, 0, 0, 241, 0, 0, 0, 0, '', '', '2023-01-29 23:22:22', '2023-01-29 23:22:22'),
(1595, 0, 'PRF001', 1593, '245', '240', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:22:54', '2023-01-29 23:22:54'),
(1596, 0, '_in', 1595, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:22:54', '2023-01-29 23:22:54'),
(1597, 0, '_out', 1595, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:22:54', '2023-01-29 23:22:54'),
(1598, 0, 'SPE_0047', 469, '246', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1599, 0, 'Jobs', 1598, '246', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1600, 0, 'Item001', 1598, '246', '', 0, 0, 0, 242, 0, 0, 0, 0, '', '', '2023-01-29 23:24:51', '2023-01-29 23:24:51'),
(1601, 0, 'Item002', 1598, '246', '', 0, 0, 0, 243, 0, 0, 0, 0, '', '', '2023-01-29 23:24:51', '2023-01-29 23:24:51'),
(1602, 0, 'Item003', 1598, '246', '', 0, 0, 0, 244, 0, 0, 0, 0, '', '', '2023-01-29 23:24:51', '2023-01-29 23:24:51'),
(1603, 0, 'Item004', 1598, '246', '', 0, 0, 0, 245, 0, 0, 0, 0, '', '', '2023-01-29 23:24:51', '2023-01-29 23:24:51'),
(1604, 0, 'TRA001', 1599, '246', '241', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:25:24', '2023-01-29 23:25:24'),
(1605, 0, '_in', 1604, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:25:24', '2023-01-29 23:25:24'),
(1606, 0, '_out', 1604, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:25:24', '2023-01-29 23:25:24'),
(1607, 0, 'TRA002', 1599, '246', '242', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:26:01', '2023-01-29 23:26:01'),
(1608, 0, '_in', 1607, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:26:01', '2023-01-29 23:26:01'),
(1609, 0, '_out', 1607, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:26:01', '2023-01-29 23:26:01'),
(1610, 0, 'TRA003', 1599, '246', '243', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:26:38', '2023-01-29 23:26:38'),
(1611, 0, '_in', 1610, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:26:38', '2023-01-29 23:26:38'),
(1612, 0, '_out', 1610, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:26:38', '2023-01-29 23:26:38'),
(1613, 0, 'TRA004', 1599, '246', '244', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:27:12', '2023-01-29 23:27:12'),
(1614, 0, '_in', 1613, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:27:12', '2023-01-29 23:27:12'),
(1615, 0, '_out', 1613, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:27:12', '2023-01-29 23:27:12'),
(1616, 0, 'SPEU_0072', 737, '247', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1617, 0, 'Jobs', 1616, '247', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1618, 0, 'Item001', 1616, '247', '', 0, 0, 0, 246, 0, 0, 0, 0, '', '', '2023-01-29 23:29:56', '2023-01-29 23:29:56'),
(1619, 0, 'Item002', 1616, '247', '', 0, 0, 0, 247, 0, 0, 0, 0, '', '', '2023-01-29 23:29:56', '2023-01-29 23:29:56'),
(1620, 0, 'Item003', 1616, '247', '', 0, 0, 0, 248, 0, 0, 0, 0, '', '', '2023-01-29 23:29:56', '2023-01-29 23:29:56'),
(1621, 0, 'Item004', 1616, '247', '', 0, 0, 0, 249, 0, 0, 0, 0, '', '', '2023-01-29 23:29:56', '2023-01-29 23:29:56'),
(1622, 0, 'MTP001', 1617, '247', '245', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:30:22', '2023-01-29 23:30:22'),
(1623, 0, '_in', 1622, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:30:22', '2023-01-29 23:30:22'),
(1624, 0, '_out', 1622, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:30:22', '2023-01-29 23:30:22'),
(1625, 0, 'MTP002', 1617, '247', '246', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:31:24', '2023-01-29 23:31:24'),
(1626, 0, '_in', 1625, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:31:24', '2023-01-29 23:31:24'),
(1627, 0, '_out', 1625, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:31:24', '2023-01-29 23:31:24'),
(1628, 0, 'MTP003', 1617, '247', '247', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:32:04', '2023-01-29 23:32:04'),
(1629, 0, '_in', 1628, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:32:04', '2023-01-29 23:32:04'),
(1630, 0, '_out', 1628, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:32:04', '2023-01-29 23:32:04'),
(1631, 0, 'MTP004', 1617, '247', '248', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:32:39', '2023-01-29 23:32:39'),
(1632, 0, '_in', 1631, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:32:39', '2023-01-29 23:32:39'),
(1633, 0, '_out', 1631, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:32:39', '2023-01-29 23:32:39'),
(1634, 0, 'SPEU_0073', 737, '248', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1635, 0, 'Jobs', 1634, '248', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1636, 0, 'Item001', 1634, '248', '', 0, 0, 0, 250, 0, 0, 0, 0, '', '', '2023-01-29 23:37:13', '2023-01-29 23:37:13'),
(1637, 0, 'Item002', 1634, '248', '', 0, 0, 0, 251, 0, 0, 0, 0, '', '', '2023-01-29 23:37:13', '2023-01-29 23:37:13'),
(1638, 0, 'Item003', 1634, '248', '', 0, 0, 0, 252, 0, 0, 0, 0, '', '', '2023-01-29 23:37:13', '2023-01-29 23:37:13'),
(1639, 0, 'Item004', 1634, '248', '', 0, 0, 0, 253, 0, 0, 0, 0, '', '', '2023-01-29 23:37:13', '2023-01-29 23:37:13'),
(1640, 0, 'PRF001', 1635, '248', '249', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:37:43', '2023-01-29 23:37:43'),
(1641, 0, '_in', 1640, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:37:43', '2023-01-29 23:37:43'),
(1642, 0, '_out', 1640, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:37:43', '2023-01-29 23:37:43'),
(1643, 0, 'PRF002', 1635, '248', '250', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:38:20', '2023-01-29 23:38:20'),
(1644, 0, '_in', 1643, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:38:20', '2023-01-29 23:38:20'),
(1645, 0, '_out', 1643, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:38:20', '2023-01-29 23:38:20'),
(1646, 0, 'PRF003', 1635, '248', '251', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:38:56', '2023-01-29 23:38:56'),
(1647, 0, '_in', 1646, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:38:56', '2023-01-29 23:38:56'),
(1648, 0, '_out', 1646, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:38:56', '2023-01-29 23:38:56'),
(1649, 0, 'PRF004', 1635, '248', '252', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:39:37', '2023-01-29 23:39:37'),
(1650, 0, '_in', 1649, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:39:37', '2023-01-29 23:39:37'),
(1651, 0, '_out', 1649, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:39:37', '2023-01-29 23:39:37'),
(1652, 0, 'lingospellsrl-010', 0, '', '', 29, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:42:31', '2023-01-29 23:42:31'),
(1653, 0, 'Data', 1652, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2023-01-29 23:42:31', '2023-01-29 23:42:31'),
(1654, 0, 'Projects', 1652, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2023-01-29 23:42:31', '2023-01-29 23:42:31'),
(1655, 0, 'Invoice', 1652, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2023-01-29 23:42:31', '2023-01-29 23:42:31'),
(1656, 0, 'foreo-041', 0, '', '', 0, 41, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:44:02', '2023-01-29 23:44:02'),
(1657, 0, 'SPEU_0074', 1654, '249', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1658, 0, 'Jobs', 1657, '249', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1659, 0, 'Item001', 1657, '249', '', 0, 0, 0, 254, 0, 0, 0, 0, '', '', '2023-01-29 23:45:05', '2023-01-29 23:45:05'),
(1660, 0, 'TRA001', 1658, '249', '253', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:45:33', '2023-01-29 23:45:33'),
(1661, 0, '_in', 1660, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:45:33', '2023-01-29 23:45:33'),
(1662, 0, '_out', 1660, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:45:33', '2023-01-29 23:45:33'),
(1663, 0, 'SPEU_0075', 737, '250', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1664, 0, 'Jobs', 1663, '250', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1665, 0, 'Item001', 1663, '250', '', 0, 0, 0, 255, 0, 0, 0, 0, '', '', '2023-01-29 23:47:18', '2023-01-29 23:47:18'),
(1666, 0, 'PRF001', 1664, '250', '254', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:47:41', '2023-01-29 23:47:41'),
(1667, 0, '_in', 1666, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:47:41', '2023-01-29 23:47:41'),
(1668, 0, '_out', 1666, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-01-29 23:47:41', '2023-01-29 23:47:41');

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
(1, 3, 'KNH160001', '2022-11-01 14:17:00', '', 'Kanhasoft test proj1', 0, 1, '2022-11-04 14:17', '1', '', '4', 0, 0, NULL, 0, 0, '2022-11-01 14:18:00', '2022-12-06 18:30:23'),
(2, 10, 'KNH160002', '2022-11-03 10:27:00', '', 'Test_Project', 0, 1, '2022-11-04 10:27', '39', '', '4', 0, 1, '2022-11-03 10:28:00', 0, 0, '2022-11-03 10:28:30', '2022-11-03 10:29:05'),
(3, 11, 'KNH160003', '2022-11-03 10:33:00', '', 'Testing_New_Project', 0, 1, '2022-11-08 12:34', '39', '', '4', 0, 0, NULL, 0, 0, '2022-11-03 10:34:20', '2022-11-03 10:34:35'),
(4, 12, 'KNH160004', '2022-11-03 10:46:00', '', 'Testing_one_demo', 0, 1, '2022-11-11 11:47', '40', '', '4', 0, 0, NULL, 0, 0, '2022-11-03 10:47:45', '2022-11-03 18:01:24'),
(5, 20, 'KNH160005', '2022-11-03 18:08:00', '', 'test0310', 0, 1, '2022-11-04 18:09', '7', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-03 18:07:32', '2022-11-03 18:07:32'),
(6, 21, 'KNH160006', '2022-11-03 18:12:00', '', 'tet', 0, 1, '2022-11-03 18:12', '7', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-03 18:11:02', '2022-11-03 18:11:02'),
(7, 24, 'SPE220001', '2022-11-03 16:30:00', '', 'SpellUp PROOF English - Norwegian', 0, 1, '2022-10-31 16:00', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-03 21:02:45', '2022-11-03 21:02:45'),
(8, 25, 'SPE220002', '2022-11-03 16:40:00', '', 'SpellUp PROOF EN-NO', 0, 1, '2022-10-31 16:00', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-03 21:10:39', '2022-11-03 21:10:39'),
(9, 27, 'SPE220003', '2022-11-03 17:27:00', '', 'SpellUp Proof EN-NO', 0, 1, '2022-11-03 17:00', '4', '', '4', 0, 0, NULL, 0, 0, '2022-11-03 21:58:05', '2022-12-26 17:40:32'),
(10, 29, 'SPE220004', '2022-11-04 11:57:00', '', 'SpellUp PRF EN-NO 145 GIMM00013', 0, 1, '2022-11-04 17:00', '4', '', '4', 0, 0, NULL, 0, 0, '2022-11-04 16:28:21', '2022-11-04 16:31:10'),
(11, 31, 'SPE220005', '2022-11-04 12:09:00', '', 'Spellup TRA EN-NO PRJ-06425 RODIAL : Nip+Fab Extreme4 Multi-Blur', 0, 1, '2022-11-03 12:00', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-04 16:40:56', '2022-11-04 16:40:56'),
(12, 33, 'SPE220006', '2022-11-04 12:18:00', '', 'Spellup TRA EN-NO PRJ-00862 DOLCE E G A B B A N A S R L : P21121522 - Progetti di Traduzione 2022', 0, 1, '2022-11-03 12:00', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-04 16:48:54', '2022-11-04 16:48:54'),
(13, 36, 'KNH160007', '2022-11-07 15:19:00', '', 'New_Demo_Test', 0, 1, '2022-11-07 16:19', '39', '', '4', 0, 0, NULL, 0, 0, '2022-11-07 15:20:07', '2022-11-07 15:26:55'),
(14, 37, 'SPE220007', '2022-11-08 09:12:00', '', 'SpellUp proof EN-NO 145 GIMM00013', 0, 1, '2022-11-04 09:00', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-08 13:44:35', '2022-11-08 13:44:35'),
(15, 38, 'SPE220008', '2022-11-08 09:18:00', '', 'TruePartners PRF EN-NO 1211 TPMM00129', 0, 1, '2022-11-04 09:00', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-08 13:49:03', '2022-11-08 13:49:03'),
(16, 39, 'KNH160008', '2022-11-08 10:02:00', '', 'Test email subject', 0, 1, '2022-11-08 10:00', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-08 14:37:24', '2022-11-08 14:37:24'),
(17, 40, 'KNH160009', '2022-11-08 10:14:00', '', 'Test email subject', 0, 1, '2022-11-08 10:00', '1', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-08 14:44:55', '2022-11-08 14:44:55'),
(18, 41, 'KNH160010', '2022-11-08 10:37:00', '', 'Test email subject', 0, 1, '2022-12-04 20:00', '1', '', '4', 0, 0, NULL, 0, 0, '2022-11-08 15:08:27', '2022-12-05 14:56:30'),
(19, 43, 'KNH160011', '2022-11-08 17:08:00', '', 'test', 0, 1, '2022-11-09 17:09', '7', '', '4', 0, 1, '2022-11-11 10:53:00', 0, 0, '2022-11-08 17:07:53', '2022-11-09 11:11:33'),
(20, 46, 'SPE220009', '2022-11-08 13:32:00', '', 'CHANEL PRF EN-NO PRJ-01371', 0, 1, '2022-11-08 17:00', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-08 18:03:13', '2022-11-08 18:03:13'),
(21, 49, 'SPE220010', '2022-11-10 11:30:00', '', 'Spellup PRF EN-NO', 0, 1, '2022-11-09 11:00', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-10 16:00:49', '2022-11-10 16:00:49'),
(22, 51, 'SPE220011', '2022-11-10 12:06:00', '', 'Hills Pet PRF EN-NOP22012642', 0, 1, '2022-11-16 12:00', '4', '', '4', NULL, NULL, NULL, 0, 0, '2022-11-10 16:36:38', '2022-11-10 16:36:38'),
(23, 55, 'SPEU_0001', '2022-11-11 11:51:00', '', 'Scorewarrior - Total Battle', 0, 7, '2022-12-19 17:00', '4', '', '4', 0, 0, NULL, 0, 0, '2022-11-11 16:23:15', '2023-01-30 10:57:00'),
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
(36, 80, 'KNH160015', '2022-11-24 15:02:00', '', 'To test the feasibility of applicataion', 0, 1, '2022-11-30 18:03', '37', '', '4', 0, 0, NULL, 0, 0, '2022-11-24 15:03:37', '2022-11-30 18:13:22'),
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
(60, 110, 'SPE_0006', '2022-12-03 22:07:00', '', 'Test', 0, 1, '2022-12-10 22:08', '1', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-04 02:38:13', '2022-12-04 02:38:13'),
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
(73, 129, 'SPE_0013', '2022-12-12 13:31:00', '', 'iLOQ 984422 TRA EN-NO 228', 0, 14, '2022-12-09 17:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-12 18:02:45', '2022-12-12 18:02:45'),
(74, 132, 'SPEU_0008', '2022-12-15 19:07:00', '', 'Resorba TRA EN-NO 13445', 0, 14, '2022-12-12 13:00', '10', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-15 23:38:21', '2022-12-15 23:38:21'),
(75, 133, 'SPE_0014', '2022-12-15 19:11:00', '', 'Spellup PRF EN-NO 18 SCREENSHOTS', 0, 14, '2022-12-12 19:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-15 23:42:41', '2022-12-15 23:42:41'),
(76, 134, 'SPE_0015', '2022-12-15 19:25:00', '', 'Derivco TRA EN-NO', 0, 14, '2022-12-15 10:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-15 23:56:21', '2022-12-15 23:56:21'),
(77, 135, 'SPEU_0009', '2022-12-15 19:43:00', '', 'SpellUp PEF EN-NO', 0, 14, '2022-12-12 19:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-16 00:14:09', '2022-12-16 00:14:09'),
(78, 136, 'SPEU_0010', '2022-12-15 19:47:00', '', 'CHANEL PRJ-01371 PRF EN-NO 391', 0, 14, '2022-12-15 15:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-16 00:17:49', '2022-12-16 00:17:49'),
(79, 137, 'SPEU_0011', '2022-12-15 19:53:00', '', 'Shopify 24842533 PRF EN-NO', 0, 14, '2022-12-13 13:30', '5', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-16 00:24:49', '2022-12-16 00:24:49'),
(80, 138, 'SPE_0016', '2022-12-15 19:57:00', '', 'SpellUp TRA EN-NO December', 0, 14, '2022-12-31 18:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-16 00:39:49', '2022-12-16 00:39:49'),
(81, 140, 'SPE_0017', '2022-12-16 09:21:00', '', 'SpellUp PRF EN-NONN', 0, 14, '2022-12-14 17:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-16 13:51:45', '2022-12-16 13:51:45'),
(82, 142, 'SPEU_0012', '2022-12-26 15:03:00', '', 'Cartier / Social Media / Paid Tank Française / 576 words / PROOFREADING / PRJ-01474 / NO', 0, 7, '2022-12-26 15:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-26 19:34:32', '2022-12-26 19:34:32'),
(83, 143, 'SPEU_0013', '2022-12-26 15:07:00', '', 'CHANEL ONE/ PRJ-01985/ BATCH 58', 0, 7, '2022-12-26 15:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-26 19:37:38', '2022-12-26 19:37:38'),
(84, 144, 'SPEU_0014', '2022-12-26 15:13:00', '', 'Kiko / Packaging / Skin Trainer Cream Eyes P2 / 24 words / P21121651 / NO', 0, 7, '2022-12-27 14:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-26 19:44:19', '2022-12-26 19:44:19'),
(85, 145, 'SPEU_0015', '2022-12-26 15:21:00', '', 'Cartier / Social Media / VDAY & BRIDAL / 916 words / Proofreading / PRJ-01474 / NO', 0, 7, '2022-12-22 15:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-26 19:52:14', '2022-12-26 19:52:14'),
(86, 146, 'SPEU_0016', '2022-12-26 15:59:00', '', 'Business and Marketing - 540902 - 379 words', 0, 7, '2022-12-19 17:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-26 20:31:17', '2022-12-26 20:31:17'),
(87, 149, 'SPEU_0017', '2022-12-26 16:16:00', '', 'SO-2022-12-0005——[FY22_186] DR translation (EN -> PTBR/DA/NB/PTPT/RU/SV)', 0, 7, '2022-12-16 17:00', '5', '', '4', 0, 0, NULL, 0, 0, '2022-12-26 20:48:07', '2022-12-26 20:48:15'),
(88, 150, 'SPE_0018', '2022-12-27 09:30:00', '', 'GILW00001 PR', 0, 7, '2022-12-21 15:00', '5', '', '4', 0, 0, NULL, 0, 0, '2022-12-27 14:01:11', '2022-12-27 14:03:05'),
(89, 151, 'SPEU_0018', '2022-12-27 09:42:00', '', 'hand off- ZXL202212018_XGIMI_UI_EN - Norwegian', 0, 7, '2022-12-19 17:00', '6', '', '4', 0, 0, NULL, 0, 0, '2022-12-27 14:13:47', '2022-12-27 14:13:54'),
(90, 152, 'SPE_0019', '2022-12-27 09:50:00', '', 'NO Glossary - Credits - DERIVCO', 0, 7, '2022-12-16 17:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-27 14:20:47', '2022-12-27 14:20:47'),
(91, 153, 'SPEU_0019', '2022-12-27 10:03:00', '', 'Cartier / Social Media / VDAY & BRIDAL', 0, 7, '2022-12-22 15:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-27 14:34:08', '2022-12-27 14:34:08'),
(92, 154, 'SPEU_0020', '2022-12-27 10:05:00', '', '[FY22_186] DR Support Translation - EN->DA/NB/PTPT/RU/SV', 0, 7, '2022-12-22 17:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-27 14:37:20', '2022-12-27 14:37:20'),
(93, 155, 'SPE_0020', '2022-12-29 12:21:00', '', 'DSJ ISFIGDK TESIDGZKD', 0, 1, '2022-12-29 12:21', '1', '', '4', NULL, NULL, NULL, 0, 0, '2022-12-29 12:21:40', '2022-12-29 12:21:40'),
(94, 156, 'SPEU_0021', '2023-01-03 11:53:00', '', 'CLARINS / PRJ-07607 / Batch 66 / 2022 / Trust App _ JSON UPDATE DEC / HQ BUDGET / 121 WORDS / NO', 0, 7, '2022-12-28 17:00', '5', '', '4', 0, 0, NULL, 0, 0, '2023-01-03 17:25:12', '2023-01-03 17:25:21'),
(95, 157, 'SPEU_0022', '2023-01-03 11:57:00', '', 'CHANEL / PRJ-01371 / PIM / INTERSTELLAR / UPDATE / 154 WORDS / NO', 0, 7, '2022-12-27 18:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-03 17:27:48', '2023-01-03 17:27:48'),
(96, 158, 'SPEU_0023', '2023-01-03 12:08:00', '', 'Corporate website', 0, 7, '2022-12-22 16:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-03 17:39:21', '2023-01-03 17:39:21'),
(97, 159, 'SPEU_0024', '2023-01-03 12:15:00', '', 'Car rental sale Jan 23', 0, 7, '2022-12-22 11:30', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-03 17:46:36', '2023-01-03 17:46:36'),
(98, 160, 'SPEU_0025', '2023-01-03 12:18:00', '', 'CHOOOSE climate compensation - New request!', 0, 7, '2022-12-28 16:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-03 17:49:01', '2023-01-03 17:49:01'),
(99, 161, 'SPE_0021', '2023-01-03 12:56:00', '', 'Acolad Translation Request: Project 10362649 - Robar Translations 12-14', 0, 7, '2022-12-16 15:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-03 18:26:48', '2023-01-03 18:26:48'),
(100, 162, 'SPE_0022', '2023-01-03 12:57:00', '', 'iLOQ during power outages EN-SV/ES/FR/DE/DA/NL/NO/PL', 0, 7, '2022-12-19 16:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-03 18:28:38', '2023-01-03 18:28:38'),
(101, 164, 'SPE_0023', '2023-01-03 13:01:00', '', 'LG_l12_24', 0, 7, '2022-12-21 10:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-03 18:32:21', '2023-01-03 18:32:21'),
(102, 166, 'SPE_0024', '2023-01-03 13:10:00', '', 'LG_l12_25', 0, 7, '2022-12-23 10:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-03 18:40:45', '2023-01-03 18:40:45'),
(103, 167, 'SPE_0025', '2023-01-03 13:12:00', '', 'LG_l12_35', 0, 7, '2022-12-28 10:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-03 18:42:44', '2023-01-03 18:42:44'),
(104, 168, 'SPE_0026', '2023-01-03 13:14:00', '', 'C827 PayPal HO2677_PP-87813_Misc_Urgent_CustomerRecovery - HiChew non-US comms', 0, 7, '2022-12-29 15:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-03 18:44:29', '2023-01-03 18:44:29'),
(105, 169, 'SPE_0027', '2023-01-03 13:16:00', '', '[24994162] Yahoo L10N 2023 / GDPR Privacy Dashboard: Review and implementation', 0, 7, '2022-12-28 17:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-03 18:46:31', '2023-01-03 18:46:31'),
(106, 170, 'SPEU_0026', '2023-01-04 15:23:00', '', 'SpellUp  SO-2022-12-0005——[FY22_195] TRA EN-NO 14318', 0, 14, '2022-12-27 17:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-04 19:54:58', '2023-01-04 19:54:58'),
(107, 171, 'SPE_0028', '2023-01-04 15:30:00', '', 'SpellUp GILW00001 PRF EN-NO  394', 0, 14, '2022-12-21 15:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-04 20:01:08', '2023-01-04 20:01:08'),
(108, 172, 'SPEU_0027', '2023-01-04 15:33:00', '', 'SpellUp ZXL202212018 TRA EN-NO 4000', 0, 14, '2022-12-09 15:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-04 20:05:01', '2023-01-04 20:05:01'),
(109, 173, 'SPEU_0028', '2023-01-04 15:56:00', '', 'Google holiday batch TRA en-no', 0, 14, '2022-12-31 15:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-04 20:27:21', '2023-01-04 20:27:21'),
(110, 174, 'SPEU_0029', '2023-01-04 15:59:00', '', 'SpellUp  SO-2022-12-0005——[FY22_186] TRA EN-NO 618', 0, 14, '2022-12-23 16:00', '5', '', '4', 0, 0, NULL, 0, 0, '2023-01-04 20:30:41', '2023-01-05 15:53:20'),
(111, 176, 'SPEU_0030', '2023-01-04 15:11:00', '', '2022/4019/20/15 / EN-GB » NB / PRDS-11244-AncillaryAPI-ALL + eConvergence-INSPAPI-2493-KLAF (20221222)', 0, 7, '2022-12-28 15:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-04 20:42:32', '2023-01-04 20:42:32'),
(112, 176, 'SPEU_0030', '2023-01-04 00:00:00', '', '2022/4019/20/15 / EN-GB » NB / PRDS-11244-AncillaryAPI-ALL + eConvergence-INSPAPI-2493-KLAF (20221222)', 0, 7, '2022-12-28 15:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-04 20:42:33', '2023-01-04 20:42:33'),
(113, 177, 'SPEU_0031', '2023-01-05 08:06:00', '', 'Car rental sale Jan 23 - New request!', 0, 7, '2022-12-22 10:30', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-05 13:37:18', '2023-01-05 13:37:18'),
(114, 178, 'SPEU_0032', '2023-01-05 08:16:00', '', 'SDL Tridion - KLMM - Mert - 38394878 - Rent a Car - Card + Offers Business Class (20221228)', 0, 7, '2022-12-30 12:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-05 13:47:28', '2023-01-05 13:47:28'),
(115, 179, 'SPEU_0033', '2023-01-05 08:19:00', '', 'DR Support Translation - EN->DA/NB/PTPT/RU/SV', 0, 7, '2022-12-28 17:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-05 13:50:17', '2023-01-05 13:50:17'),
(116, 180, 'SPEU_0034', '2023-01-05 08:23:00', '', 'ZXL202212027 XGIMI UI string EN to - nb-NO', 0, 7, '2022-12-28 17:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-05 13:54:00', '2023-01-05 13:54:00'),
(117, 181, 'SPE_0029', '2023-01-05 08:25:00', '', 'Derivco in MemoQ', 0, 7, '2022-12-31 17:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-05 13:56:22', '2023-01-05 13:56:22'),
(118, 182, 'SPE_0030', '2023-01-05 08:27:00', '', 'LG_l01_02', 0, 7, '2023-01-03 17:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-05 13:58:41', '2023-01-05 13:58:41'),
(119, 184, 'SPE_0031', '2023-01-05 08:30:00', '', 'C827 PayPal HO2680_PP-87899_Misc_Urgent_CustomerRecovery_Zettle VAT issue', 0, 7, '2023-01-04 16:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-05 14:01:26', '2023-01-05 14:01:26'),
(120, 185, 'SPEU_0035', '2023-01-05 08:32:00', '', 'Triumph/Total Battle  - Translate Mobile store (Android).docx', 0, 7, '2023-01-05 17:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-05 14:03:06', '2023-01-05 14:03:06'),
(121, 186, 'SPEU_0036', '2023-01-05 08:46:00', '', 'MGR-finansjobb 30.12', 0, 7, '2022-12-30 17:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-05 14:17:21', '2023-01-05 14:17:21'),
(122, 187, 'SPEU_0037', '2023-01-05 08:50:00', '', 'Canon-jobber til 30.12', 0, 7, '2022-12-30 17:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-05 14:20:52', '2023-01-05 14:20:52'),
(123, 189, 'SPEU_0038', '2023-01-05 08:54:00', '', 'Stockmann plc', 0, 7, '2022-12-29 17:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-05 14:25:10', '2023-01-05 14:25:10'),
(124, 192, 'SPEU_0039', '2023-01-05 09:04:00', '', 'Google Jobs December', 0, 7, '2023-01-05 17:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-05 14:34:53', '2023-01-05 14:34:53'),
(125, 193, 'SPEU_0040', '2023-01-05 09:07:00', '', 'Canon-jobber', 0, 7, '2022-12-29 17:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-05 14:38:19', '2023-01-05 14:38:19'),
(126, 194, 'SPEU_0041', '2023-01-05 09:15:00', '', 'SFDR translations_multi (459287_1904383)', 0, 7, '2022-12-30 17:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-05 14:45:35', '2023-01-05 14:45:35'),
(127, 195, 'SPEU_0042', '2023-01-05 09:23:00', '', 'Google Jobs', 0, 7, '2023-01-05 17:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-05 14:54:04', '2023-01-05 14:54:04'),
(128, 197, 'SPEU_0043', '2023-01-05 10:13:00', '', 'BMS_ELMAQM_003 ¦ 009_SOTYKTU-H-5755-MAA-PI', 0, 7, '2023-01-02 17:00', '11', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-05 15:43:59', '2023-01-05 15:43:59'),
(129, 198, 'SPEU_0044', '2023-01-05 11:01:00', '', 'Guide', 0, 7, '2022-12-28 12:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-05 16:32:18', '2023-01-05 16:32:18'),
(130, 199, 'SPE_0032', '2023-01-10 19:27:00', '', 'Ecolab 992290 TRA EN-NO 4', 0, 14, '2023-01-10 15:00', '11', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-10 23:59:11', '2023-01-10 23:59:11'),
(131, 200, 'SPEU_0045', '2023-01-12 10:42:00', '', 'SpellUp TRA EN-NO 557282 4651', 0, 14, '2023-01-17 13:00', '10', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-12 15:13:54', '2023-01-12 15:13:54'),
(132, 201, 'SPE_0033', '2023-01-12 13:14:00', '', 'SpellUp TRA EN-NO  REALD-0090 -SPINP-0069-MAHI-0086', 0, 14, '2023-01-12 13:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-12 17:45:57', '2023-01-12 17:45:57'),
(133, 203, 'SPEU_0046', '2023-01-15 11:59:00', '', 'Google January 2023', 0, 14, '2023-01-31 12:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-15 16:30:17', '2023-01-15 16:30:17'),
(134, 204, 'SPEU_0047', '2023-01-15 12:39:00', '', 'KLM MTP EN-NO  39232878', 0, 14, '2023-01-13 12:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-15 17:10:19', '2023-01-15 17:10:19'),
(135, 205, 'SPEU_0048', '2023-01-16 20:53:00', '', 'Google MTPE EN-NO PNOOC028066 GGL_ZGLATO_104 978', 0, 14, '2023-01-16 20:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-17 01:24:21', '2023-01-17 01:24:21'),
(136, 207, 'SPEU_0049', '2023-01-16 21:05:00', '', 'Scorewarrior  TRA EN-NO 447', 0, 14, '2023-01-16 21:00', '4', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-17 01:36:03', '2023-01-17 01:36:03'),
(137, 208, 'SPE_0034', '2023-01-18 09:10:00', '', 'PayPal TRA EN-NO 994705  689', 0, 14, '2023-01-16 09:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-18 13:40:55', '2023-01-18 13:40:55'),
(138, 209, 'SPEU_0050', '2023-01-18 09:26:00', '', 'TRA SPELLUP EN-NO O-0100-00106——[FY22_248] 171', 0, 14, '2023-01-17 09:30', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-18 13:57:27', '2023-01-18 13:57:27'),
(139, 210, 'SPE220029', '2023-01-18 09:28:00', '', 'SpellUp TRA EN-NO', 0, 14, '2023-01-17 09:30', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-18 13:59:34', '2023-01-18 13:59:34'),
(140, 211, 'SPEU_0051', '2023-01-18 09:31:00', '', 'D&G TRA EN-NO 15', 0, 14, '2023-01-13 09:30', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-18 14:01:59', '2023-01-18 14:01:59'),
(141, 212, 'SPEU_0052', '2023-01-23 20:27:00', '', 'Shopify  PE 25188933 EN-NO', 0, 14, '2023-01-20 20:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-24 00:58:34', '2023-01-24 00:58:34'),
(142, 214, 'SPEU_0053', '2023-01-24 19:53:00', '', 'Spellup 668_20230112 QA EN-NO', 0, 14, '2023-01-20 19:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-25 00:24:31', '2023-01-25 00:24:31'),
(143, 215, 'SPEU_0054', '2023-01-24 19:55:00', '', 'SpellUp CRM_13_7363 QA EN-NO', 0, 14, '2023-01-20 19:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-25 00:26:25', '2023-01-25 00:26:25'),
(144, 217, 'SPEU_0055', '2023-01-24 19:58:00', '', 'SpellUp CRM_17_7386 QA EN-NO', 0, 14, '2023-01-20 19:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-25 00:29:13', '2023-01-25 00:29:13'),
(145, 218, 'SPE_0035', '2023-01-24 20:00:00', '', 'iLOQ 996009 TRA EN-NO 375', 0, 14, '2023-01-20 20:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-25 00:30:59', '2023-01-25 00:30:59'),
(146, 219, 'SPEU_0056', '2023-01-24 20:06:00', '', 'SpellUp 2023/0205/02/15 PE EN-NO 138', 0, 14, '2023-01-20 20:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-25 00:37:34', '2023-01-25 00:37:34'),
(147, 220, 'SPEU_0057', '2023-01-24 20:13:00', '', 'SpellUp P2023 000869 PRF EN-NO', 0, 14, '2023-01-19 20:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-25 00:43:54', '2023-01-25 00:43:54'),
(148, 221, 'SPE_0036', '2023-01-24 20:15:00', '', 'GIG GILW00021  PRF EN-NO 1062', 0, 14, '2023-01-18 20:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-25 00:46:36', '2023-01-25 00:46:36'),
(149, 222, 'SPEU_0058', '2023-01-24 20:18:00', '', 'SpellUp O-0100-00106 TRA EN-NO 17', 0, 14, '2023-01-18 20:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-25 00:48:44', '2023-01-25 00:48:44'),
(150, 223, 'SPE_0037', '2023-01-24 20:19:00', '', 'iLOQ  995047 TRA EN-NO 1136', 0, 14, '2023-01-18 20:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-25 00:50:23', '2023-01-25 00:50:23'),
(151, 224, 'SPEU_0059', '2023-01-24 20:23:00', '', 'SpellUp BMS_ELMAQM_003 TRA EN-NO 236', 0, 14, '2023-01-18 20:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-25 00:54:11', '2023-01-25 00:54:11'),
(152, 225, 'SPEU_0060', '2023-01-24 20:25:00', '', 'SpellUp O-0100-00106 TRA EN-NO 3520', 0, 14, '2023-01-18 20:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-25 00:55:59', '2023-01-25 00:55:59'),
(153, 226, 'SPE_0038', '2023-01-24 20:27:00', '', 'Tussitaikurit 995692  TRA EN-NO 312', 0, 14, '2023-01-18 20:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-25 00:58:09', '2023-01-25 00:58:09'),
(154, 227, 'SPEU_0061', '2023-01-25 18:54:00', '', 'Google  1468883 + 1468234', 0, 14, '2023-01-18 18:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-25 23:25:08', '2023-01-25 23:25:08'),
(155, 228, 'SPE_0039', '2023-01-25 19:00:00', '', 'Tussitaikurit 996081 TRA EN-NO 4', 0, 14, '2023-01-19 19:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-25 23:31:19', '2023-01-25 23:31:19'),
(156, 229, 'SPEU_0062', '2023-01-25 19:03:00', '', 'Shopify  25212404+25184458+25184486+25145262+25163884 PE EN-NO', 0, 14, '2023-01-20 19:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-25 23:34:21', '2023-01-25 23:34:21'),
(157, 230, 'SPEU_0063', '2023-01-25 19:16:00', '', 'SpellUp 2023/0210/03/4 TRA EN-NO 359', 0, 14, '2023-01-23 19:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-25 23:47:28', '2023-01-25 23:47:28'),
(158, 231, 'SPE_0040', '2023-01-25 19:18:00', '', 'SpellUp Nynorsk grammar checker PRF EN-NO', 0, 14, '2023-01-23 19:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-25 23:49:30', '2023-01-25 23:49:30'),
(159, 232, 'SPE_0041', '2023-01-25 19:21:00', '', 'SpellUp 4 SCREENSHOTS STOP-281 PRF EN-NO', 0, 14, '2023-01-23 19:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-25 23:51:49', '2023-01-25 23:51:49'),
(160, 233, 'SPEU_0064', '2023-01-25 19:23:00', '', 'Scorewarrior Translate marketing_template.csv  TRA EN-NO 57', 0, 14, '2023-01-23 19:00', '4', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-25 23:53:52', '2023-01-25 23:53:52'),
(161, 234, 'SPEU_0065', '2023-01-25 19:26:00', '', 'SpellUp 672_20230116_P2_xbox QA EN-NO', 0, 14, '2023-01-24 19:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-25 23:57:10', '2023-01-25 23:57:10'),
(162, 235, 'SPE_0042', '2023-01-25 19:28:00', '', 'PayPal January 2023 EN-NO', 0, 14, '2023-01-31 19:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-25 23:59:01', '2023-01-25 23:59:01'),
(163, 236, 'SPEU_0066', '2023-01-25 19:31:00', '', 'SpellUp 20230118 QA EN-NO', 0, 14, '2023-01-24 19:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-26 00:02:12', '2023-01-26 00:02:12'),
(164, 237, 'SPE_0043', '2023-01-25 19:39:00', '', 'Parker Hannifin 997285 PRF EN-NO', 0, 14, '2023-01-25 19:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-26 00:09:50', '2023-01-26 00:09:50'),
(165, 238, 'SPEU_0067', '2023-01-25 19:41:00', '', 'Scorewarrior  Translate 4 files  TRA EN-NO 354', 0, 14, '2023-01-25 19:00', '4', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-26 00:11:47', '2023-01-26 00:11:47'),
(166, 239, 'SPE_0044', '2023-01-25 19:43:00', '', 'LG 997810  TRA EN-NO 185', 0, 14, '2023-01-25 19:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-26 00:14:18', '2023-01-26 00:14:18'),
(167, 240, 'SPE_0045', '2023-01-25 19:46:00', '', 'SpellUP NORTHL-0036+REALD-0095+WB-0008+MAHI-0092+NORTHL-0038+', 0, 14, '2023-01-20 19:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-26 00:18:37', '2023-01-26 00:18:37'),
(168, 241, 'SPE_0046', '2023-01-25 19:54:00', '', 'SpellUp RABCAT-0023+GPORT-0163', 0, 14, '2023-01-25 19:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-26 00:25:12', '2023-01-26 00:25:12'),
(169, 242, 'SPEU_0068', '2023-01-25 19:57:00', '', 'Shopify 25228367+25245080 PE EN-NO', 0, 14, '2023-01-25 19:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-26 00:27:47', '2023-01-26 00:27:47'),
(170, 243, 'SPEU_0069', '2023-01-25 19:59:00', '', 'Google 3202119 +3201651', 0, 14, '2023-01-25 20:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-26 00:30:13', '2023-01-26 00:30:13'),
(171, 244, 'SPEU_0070', '2023-01-25 20:09:00', '', 'Cartier Social Media Translation TRA EN-NO', 0, 14, '2023-01-20 20:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-26 00:40:15', '2023-01-26 00:40:15'),
(172, 245, 'SPEU_0071', '2023-01-29 18:51:00', '', 'SpellUp 673_20230119 QA EN-NO', 0, 14, '2023-01-25 18:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-29 23:22:10', '2023-01-29 23:22:10'),
(173, 246, 'SPE_0047', '2023-01-29 18:54:00', '', 'SpellUp STOP-821/STOP-857/STOP-903/STOP-880 TRA EN-NO', 0, 14, '2023-01-25 18:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-29 23:24:45', '2023-01-29 23:24:45'),
(174, 247, 'SPEU_0072', '2023-01-29 18:58:00', '', 'Google 3201843+3201540+320168+ 3201868 PE EN-NO', 0, 14, '2023-01-25 18:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-29 23:29:47', '2023-01-29 23:29:47'),
(175, 248, 'SPEU_0073', '2023-01-29 19:06:00', '', 'Shopify 25258416, 25258356, 25262306, 25277117 PRF EN-NO', 0, 14, '2023-01-26 19:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-29 23:37:08', '2023-01-29 23:37:08'),
(176, 249, 'SPEU_0074', '2023-01-29 19:14:00', '', 'Foreo O-10965-TRA-016 TRA EN-NO 1085', 0, 14, '2023-01-26 19:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-29 23:44:59', '2023-01-29 23:44:59'),
(177, 250, 'SPEU_0075', '2023-01-29 19:16:00', '', 'Shopify  25280986 PRF EN-NO', 0, 14, '2023-01-27 19:00', '5', '', '4', NULL, NULL, NULL, 0, 0, '2023-01-29 23:47:12', '2023-01-29 23:47:12');

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

--
-- Dumping data for table `tms_invoice_client`
--

INSERT INTO `tms_invoice_client` (`invoice_id`, `invoice_number`, `freelance_id`, `customer_id`, `scoop_id`, `value_date`, `invoice_date`, `payment_date`, `paid_date`, `payment_type`, `paid_amount`, `item_total`, `vat`, `Invoice_cost`, `invoice_type`, `invoice_status`, `is_invoice_sent`, `reminder_sent`, `created_date`, `modified_date`) VALUES
(1, 'S-000001', 0, 9, '[{\"id\":23},{\"id\":24},{\"id\":25},{\"id\":37}]', '2023-01-05 00:00:00', '2023-01-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0.00', '481.53', '0', '481.53', 'save', 'Open', 0, 0, '2023-01-05 00:00:00', '2023-01-05 00:00:00'),
(2, 'S-000002', 0, 5, '[{\"id\":5},{\"id\":6},{\"id\":13},{\"id\":14},{\"id\":43},{\"id\":55},{\"id\":56},{\"id\":59},{\"id\":74}]', '2023-01-05 00:00:00', '2023-01-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0.00', '177.50', '0', '177.50', 'save', 'Open', 0, 0, '2023-01-05 00:00:00', '2023-01-05 00:00:00'),
(3, 'S-000003', 8, 8, '[{\"id\":21}]', '2023-01-05 00:00:00', '2023-01-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0.00', '16.92', '0', '16.92', 'save', 'Open', 0, 0, '2023-01-05 00:00:00', '2023-01-05 00:00:00'),
(4, 'S-000004', 0, 10, '[{\"id\":44}]', '2023-01-05 00:00:00', '2023-01-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0.00', '27.07', '0', '27.07', 'save', 'Open', 0, 0, '2023-01-05 00:00:00', '2023-01-05 00:00:00'),
(5, 'S-000005', 0, 9, '[{\"id\":26}]', '2023-01-05 00:00:00', '2023-01-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0.00', '7296.72', '0', '7296.72', 'save', 'Open', 0, 0, '2023-01-05 00:00:00', '2023-01-05 00:00:00'),
(6, 'S-000006', 3, 3, '[{\"id\":7},{\"id\":8},{\"id\":166},{\"id\":167},{\"id\":20},{\"id\":22},{\"id\":46},{\"id\":51},{\"id\":52},{\"id\":68},{\"id\":70},{\"id\":71},{\"id\":77},{\"id\":85}]', '2023-01-05 00:00:00', '2023-01-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0.00', '371.13', '0', '371.13', 'save', 'Open', 0, 0, '2023-01-05 00:00:00', '2023-01-05 00:00:00'),
(7, 'S-000007', 0, 9, '[{\"id\":27},{\"id\":28},{\"id\":29},{\"id\":30},{\"id\":31},{\"id\":32},{\"id\":33},{\"id\":34},{\"id\":35},{\"id\":36},{\"id\":168}]', '2023-01-05 00:00:00', '2023-01-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0.00', '2938.57', '0', '2938.57', 'save', 'Open', 0, 0, '2023-01-05 00:00:00', '2023-01-05 00:00:00'),
(8, 'S-000008', 0, 25, '[{\"id\":154},{\"id\":155},{\"id\":156},{\"id\":157},{\"id\":158},{\"id\":159},{\"id\":160},{\"id\":161},{\"id\":162}]', '2023-01-12 23:26:00', '2023-01-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0.00', '2791.98', '25', '2791.98', 'save', 'Open', 0, 0, '2023-01-05 00:00:00', '2023-01-05 00:00:00'),
(9, 'S-000009', 2, 2, '[{\"id\":4}]', '2023-01-05 00:00:00', '2023-01-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0.00', '9.77', '0', '9.77', 'save', 'Open', 0, 0, '2023-01-05 00:00:00', '2023-01-05 00:00:00'),
(10, 'S-000010', 0, 18, '[{\"id\":90},{\"id\":94}]', '2023-01-05 00:00:00', '2023-01-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0.00', '13.00', '0', '13.00', 'save', 'Open', 0, 0, '2023-01-05 00:00:00', '2023-01-05 00:00:00'),
(11, 'S-000011', 0, 26, '[{\"id\":165}]', '2023-01-05 00:00:00', '2023-01-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0.00', '48.68', '0', '48.68', 'save', 'Open', 0, 0, '2023-01-05 00:00:00', '2023-01-05 00:00:00'),
(12, 'S-000012', 0, 11, '[{\"id\":45},{\"id\":57}]', '2023-01-05 00:00:00', '2023-01-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0.00', '725.95', '0', '725.95', 'save', 'Open', 0, 0, '2023-01-05 00:00:00', '2023-01-05 00:00:00'),
(13, 'S-000013', 0, 5, '[{\"id\":65},{\"id\":113}]', '2023-01-05 16:59:00', '2023-01-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0.00', '37.23', '0', '37.23', 'save', 'Open', 0, 0, '2023-01-05 00:00:00', '2023-01-05 00:00:00'),
(14, 'S-000014', 24, 24, '[{\"id\":122},{\"id\":123},{\"id\":124},{\"id\":144},{\"id\":172}]', '2023-01-13 00:00:00', '2023-01-13 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0.00', '161.13', '0', '161.13', 'save', 'Open', 0, 0, '2023-01-13 00:00:00', '2023-01-13 00:00:00'),
(15, 'S-000015', 23, 23, '[{\"id\":112},{\"id\":114},{\"id\":147}]', '2023-01-13 00:00:00', '2023-01-13 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0.00', '356.09', '0', '356.09', 'save', 'Open', 0, 0, '2023-01-13 00:00:00', '2023-01-13 00:00:00'),
(16, 'S-000016', 0, 15, '[{\"id\":62}]', '2023-01-13 00:00:00', '2023-01-13 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0.00', '10.00', '0', '10.00', 'save', 'Open', 0, 0, '2023-01-13 00:00:00', '2023-01-13 00:00:00'),
(17, 'S-000017', 14, 14, '[{\"id\":58},{\"id\":60},{\"id\":61},{\"id\":87},{\"id\":91},{\"id\":92},{\"id\":93},{\"id\":95},{\"id\":125},{\"id\":126},{\"id\":127},{\"id\":128},{\"id\":129},{\"id\":130},{\"id\":131},{\"id\":149},{\"id\":150}]', '2023-01-13 00:00:00', '2023-01-13 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0.00', '1105.14', '0', '1105.14', 'save', 'Open', 0, 0, '2023-01-13 00:00:00', '2023-01-13 00:00:00'),
(18, 'S-000018', 14, 14, '[{\"id\":104}]', '2023-01-13 00:00:00', '2023-01-13 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0.00', '1680.00', '0', '1680.00', 'save', 'Open', 0, 0, '2023-01-13 00:00:00', '2023-01-13 00:00:00'),
(19, 'S-000019', 22, 22, '[{\"id\":109},{\"id\":110}]', '2023-01-13 00:00:00', '2023-01-13 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0.00', '644.31', '0', '644.31', 'save', 'Open', 0, 0, '2023-01-13 00:00:00', '2023-01-13 00:00:00'),
(20, 'S-000020', 16, 16, '[{\"id\":99},{\"id\":148}]', '2023-01-13 00:00:00', '2023-01-13 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0.00', '364.89', '0', '364.89', 'save', 'Open', 0, 0, '2023-01-13 00:00:00', '2023-01-13 00:00:00'),
(21, 'S-000021', 0, 17, '[{\"id\":83},{\"id\":89}]', '2023-01-13 00:00:00', '2023-01-13 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0.00', '993.00', '0', '993.00', 'save', 'Open', 0, 0, '2023-01-13 00:00:00', '2023-01-13 00:00:00'),
(22, 'S-000022', 0, 11, '[{\"id\":64},{\"id\":86}]', '2023-01-18 00:00:00', '2023-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0.00', '25.01', '0', '25.01', 'save', 'Open', 0, 0, '2023-01-18 00:00:00', '2023-01-18 00:00:00'),
(23, 'S-000023', 0, 20, '[{\"id\":100}]', '2023-01-18 00:00:00', '2023-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0.00', '165.96', '0', '165.96', 'save', 'Open', 0, 0, '2023-01-18 00:00:00', '2023-01-18 00:00:00'),
(24, 'S-000024', 0, 19, '[{\"id\":97}]', '2023-01-18 00:00:00', '2023-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0.00', '639.57', '0', '639.57', 'save', 'Open', 0, 0, '2023-01-18 00:00:00', '2023-01-18 00:00:00');

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
  `total_price` float NOT NULL,
  `project_pricelist` int(11) NOT NULL,
  `project_type` varchar(50) NOT NULL,
  `tax` int(11) NOT NULL,
  `contact_person` varchar(255) NOT NULL,
  `manager` varchar(255) NOT NULL,
  `coordinator` varchar(255) NOT NULL,
  `heads_up` tinyint(2) NOT NULL,
  `upcomingDate` datetime NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `q_date` varchar(255) NOT NULL,
  `item_language` varchar(255) NOT NULL,
  `source_lang` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `target_lang` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `item_status` varchar(255) NOT NULL DEFAULT 'To be Assigned',
  `item_email_subject` varchar(50) NOT NULL,
  `place_of_delivery` varchar(255) NOT NULL,
  `amount` longtext NOT NULL,
  `total_amount` float NOT NULL,
  `auto_status` enum('Auto','Manual') NOT NULL DEFAULT 'Auto',
  `po_number` varchar(255) NOT NULL,
  `attached_workflow` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_items`
--

INSERT INTO `tms_items` (`itemId`, `order_id`, `item_number`, `item_name`, `description`, `price`, `total_price`, `project_pricelist`, `project_type`, `tax`, `contact_person`, `manager`, `coordinator`, `heads_up`, `upcomingDate`, `start_date`, `due_date`, `q_date`, `item_language`, `source_lang`, `target_lang`, `item_status`, `item_email_subject`, `place_of_delivery`, `amount`, `total_amount`, `auto_status`, `po_number`, `attached_workflow`, `created_date`, `updated_date`) VALUES
(4, 25, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"9,77\",\"itemTotal\":\"9.77\",\"amtSum\":9.77}]', 9.77, 0, '5', 0, '2,3', '1', '2', 0, '0000-00-00 00:00:00', '2022-11-03 21:10:00', '2022-10-31 16:00:00', '10-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'Proz job - Norwegian linguist', '', '', 9.77, 'Auto', '# 2022/3461/EN-GB » NO/1/3', 'jobChain -', '2022-11-03 21:10:55', '2023-01-05 16:46:35'),
(5, 27, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"650\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"0,03\",\"itemTotal\":\"19.52\",\"amtSum\":19.5}]', 19.52, 0, '5', 0, '5,4', '1', '2', 0, '0000-00-00 00:00:00', '2022-11-03 21:58:00', '2022-11-03 17:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'A new proofreading task has been assigned to you.', '', '', 19.52, 'Auto', 'GIMM00012 - Daily Drops TnC', 'SingleJob -Batch Delivery (BAD)', '2022-11-03 21:58:10', '2023-01-05 16:19:27'),
(6, 29, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"145\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"0,03\",\"itemTotal\":\"4.5\",\"amtSum\":4.35}]', 4.5, 0, '5', 0, '5,4', '1', '2', 0, '0000-00-00 00:00:00', '2022-11-04 16:28:00', '2022-11-04 17:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'A new proofreading task has been assigned to you.', '', '', 4.5, 'Auto', 'GIMM00013 - WowPots', 'SingleJob -Proofreading (PRF)', '2022-11-04 16:28:26', '2023-01-05 16:19:27'),
(7, 31, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"51\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"5.61\",\"amtSum\":5.61}]', 5.61, 0, '1', 0, '3,5', '1', '2', 0, '0000-00-00 00:00:00', '2022-11-04 16:41:00', '2022-11-03 12:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'Purchase Order n°PO-DWFR-2022-21665', '', '', 5.61, 'Auto', 'PO-DWFR-2022-21665', 'SingleJob -Proofreading (PRF)', '2022-11-04 16:41:18', '2023-01-05 16:29:10'),
(8, 33, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"185\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"20.35\",\"amtSum\":20.35},{\"quantity\":\"1934\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":\"0,01099794\",\"itemTotal\":\"21.27\",\"amtSum\":21.27001596}]', 41.62, 0, '1', 0, '3,6', '1', '2', 0, '0000-00-00 00:00:00', '2022-11-04 16:48:00', '2022-11-03 12:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'Purchase Order n°PO-DWFR-2022-21692', '', '', 41.62, 'Auto', 'PO-DWFR-2022-21692', 'SingleJob -Translation (TRA)', '2022-11-04 16:48:58', '2023-01-05 16:29:10'),
(13, 37, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"4,74\",\"itemTotal\":\"4.74\",\"amtSum\":4.74}]', 4.74, 0, '5', 0, '5,4', '1', '2', 0, '0000-00-00 00:00:00', '2022-11-08 13:44:00', '2022-11-04 09:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'A new proofreading task has been assigned to you.', '', '', 4.74, 'Auto', 'GIMM00013 - WowPots', 'SingleJob -Proofreading (PRF)', '2022-11-08 13:44:43', '2023-01-05 16:19:27'),
(14, 38, '1', 'TruePartners | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1211\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"0,03\",\"itemTotal\":\"38.49\",\"amtSum\":36.33}]', 38.49, 0, '5', 0, '5,4', '1', '2', 0, '0000-00-00 00:00:00', '2022-11-08 13:49:00', '2022-11-04 09:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'A new proofreading task has been assigned to you.', '', '', 38.49, 'Auto', 'TPMM00129 Email for translation', 'SingleJob -Proofreading (PRF)', '2022-11-08 13:49:08', '2023-01-05 16:19:27'),
(20, 46, '1', 'Chanel | \n                                                               -Norwegian (bokmal)', '', '[{\"quantity\":1,\"pricelist\":\"Project Price PRF\",\"itemPrice\":\"30\",\"itemTotal\":\"30.00\",\"amtSum\":30}]', 30, 0, '5', 0, '3,8', '1', '2', 0, '0000-00-00 00:00:00', '2022-11-08 18:03:00', '2022-11-08 17:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'DATAWORDS / CHANEL / PRJ-01371 / PIM / PDPs HJ / P', '', '', 30, 'Auto', 'PO-DWFR-2022-23606', 'SingleJob -Proofreading (PRF)', '2022-11-08 18:03:17', '2023-01-05 16:29:10'),
(21, 49, '1', 'SpellUp | \n                                                               -Norwegian (bokmal)', '', '[{\"quantity\":\"188\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,09\",\"itemTotal\":\"1691.00\",\"amtSum\":16.919999999999998}]', 16.92, 0, '1', 0, '8,9', '1', '2', 0, '0000-00-00 00:00:00', '2022-11-10 16:00:00', '2022-11-09 11:45:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'EN-NORWEGIAN freelance translator', '', '', 16.92, 'Auto', 'Copy of Templates', 'SingleJob -Translation (TRA)', '2022-11-10 16:00:54', '2023-01-05 16:19:57'),
(22, 51, '1', 'Hill´s Pet | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":1,\"pricelist\":\"Project Price PRF\",\"itemPrice\":\"20\",\"itemTotal\":\"20.00\",\"amtSum\":20}]', 20, 0, '5', 0, '3,8', '1', '2', 0, '0000-00-00 00:00:00', '2022-11-10 16:36:00', '2022-11-09 12:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'DATAWORDS / HILL\'S PET / P22012642 / METADATA Q&A', '', '', 20, 'Auto', 'PO-DWFR-2022-24138', 'SingleJob -Proofreading (PRF)', '2022-11-10 16:36:42', '2023-01-05 16:29:10'),
(23, 55, '1', 'Scorewarrior | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"4\",\"pricelist\":\"Hour(s) Translation\",\"itemPrice\":\"45\",\"itemTotal\":\"180\",\"amtSum\":180}]', 180, 0, '1', 0, '9,10', '7,1', '2', 0, '0000-00-00 00:00:00', '2022-11-11 16:23:00', '2022-11-09 17:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'Glossary file', '', '', 180, 'Auto', 'Glossary file', 'SingleJob -Translation (TRA)', '2022-11-11 16:23:38', '2023-01-05 16:17:10'),
(24, 55, '2', 'Scorewarrior | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"336\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"36.96\",\"amtSum\":36.96},{\"quantity\":\"358\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":\"0,011\",\"itemTotal\":\"3.93\",\"amtSum\":3.9379999999999997},{\"quantity\":\"2\",\"pricelist\":\"Words Translation 95-99% Match\",\"itemPrice\":\"0,05\",\"itemTotal\":\"0.1\",\"amtSum\":0.1},{\"quantity\":\"25\",\"pricelist\":\"Words Translation 75-84% Match\",\"itemPrice\":\"0,085\",\"itemTotal\":\"2.12\",\"amtSum\":2.125}]', 43.12, 0, '1', 0, '9,10', '7,1', '2', 0, '0000-00-00 00:00:00', '2022-11-11 16:23:00', '2022-11-10 17:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', '/Web_common', '', '', 43.12, 'Auto', '/Web_common', 'SingleJob -Translation (TRA)', '2022-11-11 16:23:38', '2023-01-05 16:17:10'),
(25, 55, '3', 'Scorewarrior | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1192\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"131.12\",\"amtSum\":131.12},{\"quantity\":\"179\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":\"0,011\",\"itemTotal\":\"1.96\",\"amtSum\":1.9689999999999999},{\"quantity\":\"778\",\"pricelist\":\"Words Translation ICE Match\",\"itemPrice\":\"0,011\",\"itemTotal\":\"8.55\",\"amtSum\":8.558},{\"quantity\":\"190\",\"pricelist\":\"Words Translation 95-99% Match\",\"itemPrice\":\"0,05\",\"itemTotal\":\"9.5\",\"amtSum\":9.5},{\"quantity\":\"116\",\"pricelist\":\"Words Translation 85-94% Match\",\"itemPrice\":\"0,075\",\"itemTotal\":\"8.7\",\"amtSum\":8.7},{\"quantity\":\"211\",\"pricelist\":\"Words Translation 75-84% Match\",\"itemPrice\":\"0,085\",\"itemTotal\":\"17.95\",\"amtSum\":17.935}]', 177.78, 0, '1', 0, '9,10', '7', '2', 0, '0000-00-00 00:00:00', '2022-11-11 16:23:00', '2022-11-14 17:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', '/web_site', '', '', 177.78, 'Auto', '/web_site', 'SingleJob -Translation (TRA)', '2022-11-11 16:23:38', '2023-01-05 16:17:10'),
(26, 55, '4', 'Scorewarrior | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"49677\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"5464.47\",\"amtSum\":5464.47},{\"quantity\":\"30740\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":\"0,011\",\"itemTotal\":\"338.14\",\"amtSum\":338.14},{\"quantity\":\"6209\",\"pricelist\":\"Words Translation 95-99% Match\",\"itemPrice\":\"0,05\",\"itemTotal\":\"310.45\",\"amtSum\":310.45000000000005},{\"quantity\":\"6236\",\"pricelist\":\"Words Translation 85-94% Match\",\"itemPrice\":\"0,075\",\"itemTotal\":\"467.7\",\"amtSum\":467.7},{\"quantity\":\"8423\",\"pricelist\":\"Words Translation 75-84% Match\",\"itemPrice\":\"0,085\",\"itemTotal\":\"715.96\",\"amtSum\":715.955}]', 7296.72, 0, '1', 0, '9,10', '7', '2', 0, '0000-00-00 00:00:00', '2022-11-11 16:23:00', '2022-11-28 17:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', '/game_archive', '', '', 7296.72, 'Auto', '/game_archive', 'SingleJob -Translation (TRA)', '2022-11-11 16:23:38', '2023-01-05 16:20:54'),
(27, 55, '5', 'Scorewarrior | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"17193\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"1891.23\",\"amtSum\":1891.23},{\"quantity\":\"7905\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":\"0,011\",\"itemTotal\":\"86.95\",\"amtSum\":86.955},{\"quantity\":\"1507\",\"pricelist\":\"Words Translation 95-99% Match\",\"itemPrice\":\"0,05\",\"itemTotal\":\"75.35\",\"amtSum\":75.35000000000001},{\"quantity\":\"2267\",\"pricelist\":\"Words Translation 85-94% Match\",\"itemPrice\":\"0,075\",\"itemTotal\":\"170.02\",\"amtSum\":170.025},{\"quantity\":\"3020\",\"pricelist\":\"Words Translation 75-84% Match\",\"itemPrice\":\"0,085\",\"itemTotal\":\"256.70\",\"amtSum\":256.70000000000005}]', 2480.26, 0, '1', 0, '9,10', '7', '2', 0, '0000-00-00 00:00:00', '2022-11-11 16:23:00', '2022-12-19 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', '/game', '', '', 2480.26, 'Auto', '/game', 'SingleJob -Translation (TRA)', '2022-11-11 16:23:38', '2023-01-05 16:33:35'),
(28, 55, '6', 'Scorewarrior | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1240\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"136.4\",\"amtSum\":136.4},{\"quantity\":\"1851\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":\"0,011\",\"itemTotal\":\"20.36\",\"amtSum\":20.360999999999997},{\"quantity\":\"398\",\"pricelist\":\"Words Translation 95-99% Match\",\"itemPrice\":\"0,05\",\"itemTotal\":\"19.90\",\"amtSum\":19.900000000000002},{\"quantity\":\"272\",\"pricelist\":\"Words Translation 85-94% Match\",\"itemPrice\":\"0,075\",\"itemTotal\":\"20.4\",\"amtSum\":20.4},{\"quantity\":\"528\",\"pricelist\":\"Words Translation 75-84% Match\",\"itemPrice\":\"0,085\",\"itemTotal\":\"44.88\",\"amtSum\":44.88}]', 241.94, 0, '1', 0, '9,10', '7', '2', 0, '0000-00-00 00:00:00', '2022-11-11 16:49:00', '2022-12-19 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', '/S1', '', '', 241.94, 'Auto', '/S2', 'SingleJob -Translation (TRA)', '2022-11-11 16:49:38', '2023-01-05 16:33:35'),
(29, 55, '7', 'Scorewarrior | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"148\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"16.28\",\"amtSum\":16.28},{\"quantity\":\"77\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":\"0,011\",\"itemTotal\":\"0.85\",\"amtSum\":0.847},{\"quantity\":\"16\",\"pricelist\":\"Words Translation 95-99% Match\",\"itemPrice\":\"0,05\",\"itemTotal\":\"0.8\",\"amtSum\":0.8},{\"quantity\":\"6\",\"pricelist\":\"Words Translation 85-94% Match\",\"itemPrice\":\"0,075\",\"itemTotal\":\"0.45\",\"amtSum\":0.45},{\"quantity\":\"58\",\"pricelist\":\"Words Translation 75-84% Match\",\"itemPrice\":\"0,085\",\"itemTotal\":\"4.93\",\"amtSum\":4.93}]', 23.31, 0, '1', 0, '9,10', '7', '2', 0, '0000-00-00 00:00:00', '2022-11-11 16:49:00', '2022-12-19 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', '/S2', '', '', 23.31, 'Auto', '/S1', 'SingleJob -Translation (TRA)', '2022-11-11 16:49:38', '2023-01-05 16:33:35'),
(30, 55, '8', 'Scorewarrior | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"452\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"49.72\",\"amtSum\":49.72},{\"quantity\":\"68\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":\"0,011\",\"itemTotal\":\"0.74\",\"amtSum\":0.748},{\"quantity\":\"11\",\"pricelist\":\"Words Translation 95-99% Match\",\"itemPrice\":\"0,05\",\"itemTotal\":\"0.55\",\"amtSum\":0.55},{\"quantity\":\"10\",\"pricelist\":\"Words Translation 85-94% Match\",\"itemPrice\":\"0,075\",\"itemTotal\":\"0.75\",\"amtSum\":0.75},{\"quantity\":\"73\",\"pricelist\":\"Words Translation 75-84% Match\",\"itemPrice\":\"0,085\",\"itemTotal\":\"6.20\",\"amtSum\":6.205}]', 57.97, 0, '1', 0, '9,10', '7', '2', 0, '0000-00-00 00:00:00', '2022-11-11 16:49:00', '2022-12-19 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', '/marketing_regular', '', '', 57.97, 'Auto', '/marketing_regular', 'SingleJob -Translation (TRA)', '2022-11-11 16:49:38', '2023-01-05 16:33:35'),
(31, 55, '9', 'Scorewarrior | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"392\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"43.12\",\"amtSum\":43.12}]', 43.12, 0, '1', 0, '9,10', '7', '2', 0, '0000-00-00 00:00:00', '2022-11-11 16:49:00', '2022-12-19 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', '/Android description.doc', '', '', 43.12, 'Auto', '/Android description.doc', 'SingleJob -Translation (TRA)', '2022-11-11 16:49:38', '2023-01-05 16:33:35'),
(32, 55, '10', 'Scorewarrior | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"367\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"40.37\",\"amtSum\":40.37}]', 40.37, 0, '1', 0, '9,10', '7,1', '2', 0, '0000-00-00 00:00:00', '2022-11-11 16:49:00', '2022-12-19 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', '/description', '', '', 40.37, 'Auto', '/description', 'SingleJob -Translation (TRA)', '2022-11-11 16:49:38', '2023-01-05 16:33:35'),
(33, 55, '11', 'Scorewarrior | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"27\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"2.97\",\"amtSum\":2.97}]', 2.97, 0, '1', 0, '9,10', '7,1', '2', 0, '0000-00-00 00:00:00', '2022-11-11 17:19:00', '2022-12-19 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', '/promotional', '', '', 2.97, 'Auto', '/promotional', 'SingleJob -Translation (TRA)', '2022-11-11 17:19:05', '2023-01-05 16:33:35'),
(34, 55, '12', 'Scorewarrior | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"5\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"0.55\",\"amtSum\":0.55}]', 0.55, 0, '1', 0, '9,10', '7,1', '2', 0, '0000-00-00 00:00:00', '2022-11-11 17:19:00', '2022-12-19 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', '/whatsnew_bugfix', '', '', 0.55, 'Auto', '/whatsnew_bugfix', 'SingleJob -Translation (TRA)', '2022-11-11 17:19:05', '2023-01-05 16:33:35'),
(35, 55, '13', 'Scorewarrior | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"17\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"1.87\",\"amtSum\":1.87}]', 1.87, 0, '1', 0, '9,10', '7,1', '2', 0, '0000-00-00 00:00:00', '2022-11-11 17:19:00', '2022-12-19 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', '/translation.xlsx', '', '', 1.87, 'Auto', '/translation.xlsx', 'SingleJob -Translation (TRA)', '2022-11-11 17:19:05', '2023-01-05 16:33:35'),
(36, 55, '14', 'Scorewarrior | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"11\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"1.21\",\"amtSum\":1.21}]', 1.21, 0, '1', 0, '9,10', '7,1', '2', 0, '0000-00-00 00:00:00', '2022-11-11 17:19:00', '2022-12-19 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', '/InfoPlist.strings', '', '', 1.21, 'Auto', '/InfoPlist.strings', 'SingleJob -Translation (TRA)', '2022-11-11 17:19:05', '2023-01-05 16:33:35'),
(37, 55, '15', 'Scorewarrior | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"668\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"73.48\",\"amtSum\":73.48},{\"quantity\":\"153\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":\"0,011\",\"itemTotal\":\"1.68\",\"amtSum\":1.6829999999999998},{\"quantity\":\"44\",\"pricelist\":\"Words Translation 95-99% Match\",\"itemPrice\":\"0,05\",\"itemTotal\":\"2.2\",\"amtSum\":2.2},{\"quantity\":\"5\",\"pricelist\":\"Words Translation 85-94% Match\",\"itemPrice\":\"0,075\",\"itemTotal\":\"0.37\",\"amtSum\":0.375},{\"quantity\":\"34\",\"pricelist\":\"Words Translation 75-84% Match\",\"itemPrice\":\"0,085\",\"itemTotal\":\"2.89\",\"amtSum\":2.89}]', 80.63, 0, '1', 0, '9,10', '7', '2', 0, '0000-00-00 00:00:00', '2022-11-11 18:59:00', '2022-11-10 17:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', '/web_hub', '', '', 80.63, 'Auto', '/web_hub', 'SingleJob -Translation (TRA)', '2022-11-11 18:59:01', '2023-01-05 16:17:10'),
(42, 59, '1', 'Gaming Innovation Group (GiG) | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"158\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"0,03\",\"itemTotal\":\"4.74\",\"amtSum\":4.74}]', 4.74, 0, '5', 0, '5,4', '1', '2', 0, '0000-00-00 00:00:00', '2022-11-16 16:27:00', '2022-11-14 11:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'A new proofreading task has been assigned to you.', '', '', 4.74, 'Auto', 'GIMM00015 - Ramses & Santa', 'SingleJob -Proofreading (PRF)', '2022-11-16 16:27:05', '2023-01-05 17:00:17'),
(43, 61, '1', 'Uniclub | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"2180\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"0,031\",\"itemTotal\":\"67.68\",\"amtSum\":67.58}]', 67.68, 0, '5', 0, '5,11', '1', '2', 0, '0000-00-00 00:00:00', '2022-11-16 16:34:00', '2022-11-15 12:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'A new proofreading task has been assigned to you.', '', '', 67.68, 'Auto', 'UNRA00002 Welcome Chain and Support Tags', 'SingleJob -Proofreading (PRF)', '2022-11-16 16:34:49', '2023-01-05 16:19:27'),
(44, 62, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"285\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,095\",\"itemTotal\":\"27.07\",\"amtSum\":27.075}]', 27.07, 0, '1', 0, '10,12', '1', '2', 0, '0000-00-00 00:00:00', '2022-11-16 16:50:00', '2022-11-16 12:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'Hikvision2211039-Translation-English-Norwegian-(28', '', '', 27.07, 'Auto', 'Hikvision2211039', 'SingleJob -Translation (TRA)', '2022-11-16 16:50:37', '2023-01-05 16:20:21'),
(45, 63, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":1,\"pricelist\":\"Project Price TRA\",\"itemPrice\":\"695,19\",\"itemTotal\":\"695.19\",\"amtSum\":695.19}]', 695.19, 0, '1', 0, '11,13', '1', '2', 0, '0000-00-00 00:00:00', '2022-11-16 17:01:00', '2022-11-15 12:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', '[T/36975/22] Translation en > no', '', '', 695.19, 'Auto', 'PO/08039/22', 'SingleJob -Translation (TRA)', '2022-11-16 17:01:17', '2023-01-05 16:57:14'),
(46, 64, '1', 'SkinCeuticals | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":1,\"pricelist\":\"Words Proofreading\",\"itemPrice\":\"40\",\"itemTotal\":\"40.00\",\"amtSum\":40}]', 40, 0, '5', 0, '3,14', '1', '2', 0, '0000-00-00 00:00:00', '2022-11-16 17:06:00', '2022-11-15 12:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'DATAWORDS / SkinCeuticals / Nordics / Content Libr', '', '', 40, 'Auto', 'PO-DWFR-2022-23370', 'SingleJob -Proofreading (PRF)', '2022-11-16 17:06:02', '2023-01-05 16:29:10'),
(51, 74, '1', 'Hill´s Pet | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"2\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"40\",\"itemTotal\":\"80.00\",\"amtSum\":80}]', 80, 0, '5', 0, '3,8', '7', '2', 0, '0000-00-00 00:00:00', '2022-11-18 23:52:00', '2022-11-17 19:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'DATAWORDS / HILL\'S PET / P22012642 / 2022 SEO GAPS', '', '', 80, 'Auto', 'PO-DWFR-2022-24469', 'SingleJob -Proofreading (PRF)', '2022-11-18 23:52:38', '2023-01-05 16:29:10'),
(52, 76, '1', 'Chanel | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":1,\"pricelist\":\"Project Price PRF\",\"itemPrice\":\"15\",\"itemTotal\":\"15.00\",\"amtSum\":15}]', 15, 0, '5', 0, '3,17', '7', '2', 0, '0000-00-00 00:00:00', '2022-11-18 23:57:00', '2022-11-18 19:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'DATAWORDS/ CHANEL/ PRJ-06351/ COCO CRUSH 2023/ Moo', '', '', 15, 'Auto', 'PO-DWFR-2022-23769', 'SingleJob -Proofreading (PRF)', '2022-11-18 23:57:33', '2023-01-05 16:29:10'),
(55, 83, '1', 'Gaming Innovation Group (GiG) | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"23,6\",\"itemTotal\":\"23.6\",\"amtSum\":23.6}]', 23.6, 0, '5', 0, '5,4', '1', '2', 0, '0000-00-00 00:00:00', '2022-12-01 16:00:00', '2022-11-21 13:06:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '6', 'A new proofreading task has been assigned to you.', '', '', 23.6, 'Auto', 'GIMM00016 - Daily Drops Live Casino', 'SingleJob -Proofreading (PRF)', '2022-12-01 16:00:51', '2023-01-05 16:19:27'),
(56, 84, '1', 'Gaming Innovation Group (GiG) | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"145\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"0,03\",\"itemTotal\":\"4.35\",\"amtSum\":4.35}]', 4.35, 0, '5', 0, '5,4', '1', '2', 0, '0000-00-00 00:00:00', '2022-12-01 16:09:00', '2022-11-22 11:40:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'A new proofreading task has been assigned to you.', '', '', 4.35, 'Auto', 'GIMM00017 - Megarush', 'SingleJob -Proofreading (PRF)', '2022-12-01 16:09:36', '2023-01-05 16:19:27'),
(57, 86, '1', 'TechnoAlpin | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"31\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"3.41\",\"amtSum\":3.41},{\"quantity\":\"185\",\"pricelist\":\"Words Translation 75-84% Match\",\"itemPrice\":\"0,06\",\"itemTotal\":\"11.1\",\"amtSum\":11.1},{\"quantity\":\"1083\",\"pricelist\":\"Words Translation Repetitions\",\"itemPrice\":\"0,015\",\"itemTotal\":\"16.245\",\"amtSum\":16.245}]', 30.76, 0, '1', 0, '11,13', '1', '2', 0, '0000-00-00 00:00:00', '2022-12-01 16:28:00', '2022-11-24 11:59:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'SO/6541/22 | T/38784/22  (PURCHASE ORDER PO/08404/', '', '', 30.76, 'Auto', 'PO/08404/22', 'SingleJob -Translation (TRA)', '2022-12-01 16:28:46', '2023-01-05 16:57:14'),
(58, 87, '1', 'Parker Hannifin | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"0,5\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"40,00\",\"itemTotal\":\"20.00\",\"amtSum\":20}]', 20, 0, '5', 0, '14', '1', '2', 0, '0000-00-00 00:00:00', '2022-12-01 17:14:00', '2022-11-25 12:45:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'Lingsoft project 977427 / PARKCH_2211_P0117 nb-NO', '', '', 20, 'Auto', '977427', 'SingleJob -Proofreading (PRF)', '2022-12-01 17:14:47', '2023-01-13 21:10:54'),
(59, 88, '1', 'Gaming Innovation Group (GiG) | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"256\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"0,03\",\"itemTotal\":\"8.51\",\"amtSum\":7.68}]', 8.51, 0, '5', 0, '5,4', '1', '2', 0, '0000-00-00 00:00:00', '2022-12-01 17:51:00', '2022-11-25 13:21:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'A new proofreading task has been assigned to you.', '', '', 8.51, 'Auto', 'GIMM00019 - Megarush Weekend Tournament', 'SingleJob -Proofreading (PRF)', '2022-12-01 17:51:16', '2023-01-05 16:19:27'),
(60, 89, '1', 'ILOQ | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"93\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"10.23\",\"amtSum\":10.23},{\"quantity\":\"2\",\"pricelist\":\"Words Translation 75-84% Match\",\"itemPrice\":\"0,044\",\"itemTotal\":\"0.088\",\"amtSum\":0.088}]', 10.32, 0, '1', 0, '14', '1', '2', 0, '0000-00-00 00:00:00', '2022-12-01 18:07:00', '2022-11-25 13:37:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'Lingsoft project 978325 / iLOQ Manager UI EN-CA/SV', '', '', 10.32, 'Auto', '978325', 'SingleJob -Translation (TRA)', '2022-12-01 18:07:40', '2023-01-13 21:10:54'),
(61, 91, '1', 'Ecolab | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Machine Translation Editing\",\"itemPrice\":\"11,89\",\"itemTotal\":\"11.89\",\"amtSum\":11.89}]', 11.89, 0, '9', 0, '14', '1', '2', 0, '0000-00-00 00:00:00', '2022-12-01 19:18:00', '2022-11-28 14:51:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'Lingsoft project 977913 / Acolad Translation Reque', '', '', 11.89, 'Auto', '977913', 'SingleJob -Translation (TRA)', '2022-12-01 19:18:15', '2023-01-13 21:10:54'),
(62, 92, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price PRF\",\"itemPrice\":\"10\",\"itemTotal\":\"10.00\",\"amtSum\":10}]', 10, 0, '5', 0, '15,19', '1', '2', 0, '0000-00-00 00:00:00', '2022-12-01 19:47:00', '2022-11-28 15:17:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'Useful guides + training material', '', '', 10, 'Auto', 'SMR_EN_SMA-TRA_Steisu', 'jobChain -', '2022-12-01 19:47:46', '2023-01-13 15:00:36'),
(64, 94, '1', 'TechnoAlpin | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"70\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"7.7\",\"amtSum\":7.7}]', 7.7, 0, '1', 0, '11,13', '1', '2', 0, '0000-00-00 00:00:00', '2022-12-01 20:16:00', '2022-11-30 15:46:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'SO/6683/22 | T/39586/22  (PURCHASE ORDER PO/08507/', '', '', 7.7, 'Auto', 'PO/08507/22', 'SingleJob -Translation (TRA)', '2022-12-01 20:16:22', '2023-01-18 13:50:31'),
(65, 95, '1', 'GiG (Gaming Innovation Group) | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"826\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"0,03\",\"itemTotal\":\"25.35\",\"amtSum\":24.78}]', 25.35, 0, '5', 0, '5,4', '1', '2', 0, '0000-00-00 00:00:00', '2022-12-01 20:25:00', '2022-12-01 15:55:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'A new proofreading task has been assigned to you.', '', '', 25.35, 'Auto', 'GIMM00020 GMS 1849', 'SingleJob -Proofreading (PRF)', '2022-12-01 20:25:28', '2023-01-05 16:59:14'),
(68, 98, '1', 'Loxam | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"10\",\"itemTotal\":\"10.00\",\"amtSum\":10}]', 10, 0, '5', 0, '3,8', '1', '2', 0, '0000-00-00 00:00:00', '2022-12-01 20:51:00', '2022-11-18 16:21:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'DATAWORDS / LOXAM / PRJ-04792 / DECOUVREZ LOXAM IR', '', '', 10, 'Auto', 'PO-DWFR-2022-24140', 'SingleJob -Proofreading (PRF)', '2022-12-01 20:51:03', '2023-01-05 16:29:10'),
(70, 101, '1', 'Loxam | \n                                                               -Norwegian (bokmal)', '', '[{\"quantity\":\"0,5\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"40,00\",\"itemTotal\":\"20.00\",\"amtSum\":20}]', 20, 0, '5', 0, '3,21', '1', '2', 0, '0000-00-00 00:00:00', '2022-12-01 22:12:00', '2022-11-21 17:42:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'DATAWORDS / LOXAM / PRJ-04792 / A la rencontre de', '', '', 20, 'Auto', 'PO-DWFR-2022-23948', 'SingleJob -Proofreading (PRF)', '2022-12-01 22:12:44', '2023-01-05 16:29:10'),
(71, 102, '1', 'Chanel | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"40,00\",\"itemTotal\":\"40.00\"}]', 40, 0, '5', 0, '3,17', '1', '2', 0, '0000-00-00 00:00:00', '2022-12-01 22:20:00', '2022-11-21 17:50:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'DATAWORDS/ CHANEL/ PRJ-06115/ COCO CRUSH 2023/ Cam', '', '', 40, 'Auto', 'PO-DWFR-2022-23962', 'SingleJob -Proofreading (PRF)', '2022-12-01 22:20:12', '2023-01-05 16:29:10'),
(74, 106, '1', 'GiG (Gaming Innovation Group) | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"189\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"0,03\",\"itemTotal\":\"6.11\",\"amtSum\":5.67}]', 6.11, 0, '5', 0, '5,4', '1', '2', 0, '0000-00-00 00:00:00', '2022-12-02 14:28:00', '2022-11-23 14:00:00', '11-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'A new proofreading task has been assigned to you.', '', '', 6.11, 'Auto', 'GIMM00018 - GMS 1902', 'SingleJob -Proofreading (PRF)', '2022-12-02 14:28:36', '2023-01-05 16:19:27'),
(77, 109, '1', 'D&G (Dolce Gabbana) | Norwegian (bokmal)-English (US)', '', '[{\"quantity\":\"64\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,1\",\"itemTotal\":\"6.4\",\"amtSum\":6.4}]', 6.4, 0, '1', 0, '3,22', '1', '2', 0, '0000-00-00 00:00:00', '2022-12-02 14:53:00', '2022-11-25 11:00:00', '11-2022', '', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '6', 'DW TRANSLATION // D&G // P21121522 // Sitelink //', '', '', 6.4, 'Auto', 'PO-DWFR-2022-24419', 'SingleJob -Translation (TRA)', '2022-12-02 14:53:42', '2023-01-05 16:29:10'),
(83, 111, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"43\",\"itemTotal\":\"43.00\",\"amtSum\":43}]', 43, 0, '1', 0, '17,23', '1', '2', 0, '0000-00-00 00:00:00', '2022-12-05 20:45:00', '2022-12-02 16:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'Fasttranslator Purchase Order [#555959]', '', '', 43, 'Auto', '555959', 'SingleJob -Translation (TRA)', '2022-12-05 20:45:58', '2023-01-13 21:35:44'),
(84, 112, '1', 'Pierre Fabre | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"28,48\",\"itemTotal\":\"28.48\",\"amtSum\":28.48}]', 28.48, 28, '9', 0, '3,24', '1', '2', 0, '0000-00-00 00:00:00', '2022-12-05 20:59:00', '2022-12-02 16:30:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '5', 'DATAWORDS / PFDC / PRJ-02384 / DEPLOY / CMS / EAU', '', '', 28.48, 'Auto', 'PO-DWFR-2022-27349', 'SingleJob -Translation (TRA)', '2022-12-05 20:59:31', '2022-12-27 14:09:11'),
(85, 113, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"10\",\"itemTotal\":\"10.00\",\"amtSum\":10}]', 10, 28, '5', 0, '3,21', '1', '2', 0, '0000-00-00 00:00:00', '2022-12-05 21:25:00', '2022-12-05 11:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'Datawords / Cartier Social Media / EOY Toolbox W2', '', '', 10, 'Auto', 'PO-DWFR-2022-25302', 'SingleJob -Proofreading (PRF)', '2022-12-05 21:25:46', '2023-01-05 16:29:10'),
(86, 114, '1', 'TechnoAlpin | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"21\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"2.31\",\"amtSum\":2.31},{\"quantity\":\"49\",\"pricelist\":\"Words Translation 75-84% Match\",\"itemPrice\":\"0,06\",\"itemTotal\":\"2.94\",\"amtSum\":2.94},{\"quantity\":\"804\",\"pricelist\":\"Words Translation Repetitions\",\"itemPrice\":\"0,015\",\"itemTotal\":\"12.06\",\"amtSum\":12.06}]', 17.31, 27, '1', 0, '11,13', '1', '2', 0, '0000-00-00 00:00:00', '2022-12-05 21:29:00', '2022-12-07 11:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'SO/6764/22 | T/40044/22  (PURCHASE ORDER PO/08580/', '', '', 17.31, 'Auto', 'PO/08580/22', 'SingleJob -Translation (TRA)', '2022-12-05 21:29:08', '2023-01-18 13:50:31'),
(87, 116, '1', 'ILOQ | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"2559\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"281.49\",\"amtSum\":281.49},{\"quantity\":\"14\",\"pricelist\":\"Words Translation 50-74% Match\",\"itemPrice\":\"0,11\",\"itemTotal\":\"1.54\",\"amtSum\":1.54},{\"quantity\":\"65\",\"pricelist\":\"Words Translation 75-84% Match\",\"itemPrice\":\"0,044\",\"itemTotal\":\"2.86\",\"amtSum\":2.86},{\"quantity\":\"37\",\"pricelist\":\"Words Translation 85-94% Match\",\"itemPrice\":\"0,027\",\"itemTotal\":\"0.999\",\"amtSum\":0.999},{\"quantity\":\"26\",\"pricelist\":\"Words Translation 95-99% Match\",\"itemPrice\":\"0,027\",\"itemTotal\":\"0.702\",\"amtSum\":0.702},{\"quantity\":\"65\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":\"0,013\",\"itemTotal\":\"0.845\",\"amtSum\":0.845}]', 288.39, 25, '1', 0, '14,18', '1', '2', 0, '0000-00-00 00:00:00', '2022-12-06 17:29:00', '2022-12-09 12:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'PO: Lingsoft project 978975 / iLOQ sustainability', '', '', 288.39, 'Auto', '978975', 'SingleJob -Translation (TRA)', '2022-12-06 17:29:24', '2023-01-13 21:10:54'),
(89, 118, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"950\",\"itemTotal\":\"950.00\",\"amtSum\":950}]', 950, 29, '1', 0, '17,23', '1', '2', 0, '0000-00-00 00:00:00', '2022-12-07 21:18:00', '2022-12-12 07:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'Fasttranslator Purchase Order [#555870]', '', '', 950, 'Auto', '555870', 'SingleJob -Translation (TRA)', '2022-12-07 21:18:53', '2023-01-13 21:35:44'),
(90, 120, '1', 'Twitch Interactive | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"3\",\"itemTotal\":\"3.00\",\"amtSum\":3}]', 3, 0, '5', 0, '18,25', '1', '2', 0, '0000-00-00 00:00:00', '2022-12-07 21:25:00', '2022-12-07 13:30:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'Attention Work - Deadline: Wednesday, 12/7/2022 |', '', '', 3, 'Auto', '458310', 'SingleJob -Proofreading (PRF)', '2022-12-07 21:25:25', '2023-01-05 16:49:10'),
(91, 125, '1', 'Parker Hannifin | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"0,75\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"40\",\"itemTotal\":\"30.00\",\"amtSum\":30}]', 30, 25, '5', 0, '14,18', '1', '14', 0, '0000-00-00 00:00:00', '2022-12-12 17:39:00', '2022-12-07 14:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'PO: Lingsoft project 983550 / PARKCH_2211_P0119 nb', '', '', 30, 'Auto', '983550', 'SingleJob -Proofreading (PRF)', '2022-12-12 17:39:42', '2023-01-13 21:10:54');
INSERT INTO `tms_items` (`itemId`, `order_id`, `item_number`, `item_name`, `description`, `price`, `total_price`, `project_pricelist`, `project_type`, `tax`, `contact_person`, `manager`, `coordinator`, `heads_up`, `upcomingDate`, `start_date`, `due_date`, `q_date`, `item_language`, `source_lang`, `target_lang`, `item_status`, `item_email_subject`, `place_of_delivery`, `amount`, `total_amount`, `auto_status`, `po_number`, `attached_workflow`, `created_date`, `updated_date`) VALUES
(92, 126, '1', 'Tesla | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"93\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"10.23\",\"amtSum\":10.23},{\"quantity\":\"73\",\"pricelist\":\"Words Translation 50-74% Match\",\"itemPrice\":\"0,09\",\"itemTotal\":\"6.86\",\"amtSum\":6.57},{\"quantity\":\"3\",\"pricelist\":\"Words Translation 95-99% Match\",\"itemPrice\":\"0,027\",\"itemTotal\":\"0.08\",\"amtSum\":0.081},{\"quantity\":\"112\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":\"0\",\"itemTotal\":\"\",\"amtSum\":0}]', 17.17, 25, '1', 0, '14,18', '1', '14', 0, '0000-00-00 00:00:00', '2022-12-12 17:46:00', '2022-12-08 11:45:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'PO: Lingsoft project 984030 / Tesla World Server P', '', '', 17.17, 'Auto', '984030', 'SingleJob -Translation (TRA)', '2022-12-12 17:46:10', '2023-01-13 21:10:54'),
(93, 127, '1', 'Tesla | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"544\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"59.84\",\"amtSum\":59.84},{\"quantity\":\"336\",\"pricelist\":\"Words Translation 50-74% Match\",\"itemPrice\":\"0,08\",\"itemTotal\":\"26.88\",\"amtSum\":26.88},{\"quantity\":\"71\",\"pricelist\":\"Words Translation 75-84% Match\",\"itemPrice\":\"0,044\",\"itemTotal\":\"3.67\",\"amtSum\":3.124},{\"quantity\":\"22\",\"pricelist\":\"Words Translation 85-94% Match\",\"itemPrice\":\"0,027\",\"itemTotal\":\"0.59\",\"amtSum\":0.594},{\"quantity\":\"51\",\"pricelist\":\"Words Translation 95-99% Match\",\"itemPrice\":\"0,027\",\"itemTotal\":\"1.37\",\"amtSum\":1.377},{\"quantity\":\"120\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":\"0\",\"itemTotal\":\"\",\"amtSum\":0}]', 92.35, 25, '1', 0, '14,18', '1', '14', 0, '0000-00-00 00:00:00', '2022-12-12 17:54:00', '2022-12-08 16:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'PO: Lingsoft project 984032 / Tesla World Server P', '', '', 92.35, 'Auto', '984032', 'SingleJob -Translation (TRA)', '2022-12-12 17:54:45', '2023-01-13 21:10:54'),
(94, 128, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"10\",\"itemTotal\":\"10.00\",\"amtSum\":10}]', 10, 0, '5', 0, '18,25', '1', '14', 0, '0000-00-00 00:00:00', '2022-12-12 17:59:00', '2022-12-09 12:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'Get started – the job is ready - Internet 458977', '', '', 10, 'Auto', '458977', 'SingleJob -Proofreading (PRF)', '2022-12-12 17:59:55', '2023-01-05 16:49:10'),
(95, 129, '1', 'ILOQ | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"212\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"23.32\",\"amtSum\":23.32},{\"quantity\":\"6\",\"pricelist\":\"Words Translation 85-94% Match\",\"itemPrice\":\"0,027\",\"itemTotal\":\"0.19\",\"amtSum\":0.162},{\"quantity\":\"6\",\"pricelist\":\"Words Translation 95-99% Match\",\"itemPrice\":\"0,027\",\"itemTotal\":\"0.18\",\"amtSum\":0.162},{\"quantity\":\"4\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":\"0\",\"itemTotal\":\"\",\"amtSum\":0}]', 23.69, 25, '1', 0, '14,18', '1', '14', 0, '0000-00-00 00:00:00', '2022-12-12 18:02:00', '2022-12-09 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'PO: Lingsoft project 984422 / 5 Series Manager D.2', '', '', 23.69, 'Auto', '984422', 'SingleJob -Translation (TRA)', '2022-12-12 18:02:49', '2023-01-13 21:10:54'),
(97, 132, '1', 'Resorba | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"6402\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,09\",\"itemTotal\":\"576.18\",\"amtSum\":576.18},{\"quantity\":\"7043\",\"pricelist\":\"Words Translation Repetitions\",\"itemPrice\":\"0,009\",\"itemTotal\":\"63.387\",\"amtSum\":63.387}]', 639.57, 31, '1', 0, '19,26', '1', '14', 0, '0000-00-00 00:00:00', '2022-12-15 23:38:00', '2022-12-15 13:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'CONFIRMATION medical translation EN>NO (8 files', '', '', 639.57, 'Auto', 'Medical translation EN>NO (8 files)', 'SingleJob -Translation (TRA)', '2022-12-15 23:38:26', '2023-01-18 13:56:46'),
(99, 134, '1', 'Derivco | Norwegian (bokmal)-English (US)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"12,5\",\"itemTotal\":\"12.5\",\"amtSum\":12.5},{\"quantity\":\"1\",\"pricelist\":\"Unit(s) Screenshot Review\",\"itemPrice\":\"45\",\"itemTotal\":\"45.00\",\"amtSum\":45},{\"quantity\":\"1\",\"pricelist\":\"Hour(s) Screenshot Review\",\"itemPrice\":\"5\",\"itemTotal\":\"5.00\",\"amtSum\":5}]', 62.5, 32, '1', 0, '16,20', '1', '14', 0, '0000-00-00 00:00:00', '2022-12-15 23:56:00', '2022-12-15 10:00:00', '12-2022', '', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '6', 'R: Derivco: first tasks in memoQ - NO', '', '', 62.5, 'Auto', 'PO/2.768', 'SingleJob -Translation (TRA)', '2022-12-15 23:56:26', '2023-01-13 21:27:06'),
(100, 135, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1383\",\"pricelist\":\"Word(s) Proofreading\",\"itemPrice\":\"0,12\",\"itemTotal\":\"165.96\",\"amtSum\":165.96}]', 165.96, 33, '5', 0, '20,27', '1', '14', 0, '0000-00-00 00:00:00', '2022-12-16 00:14:00', '2022-12-12 19:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'Potential collaboration', '', '', 165.96, 'Auto', '# 2022/1500/EN » NB/1/7', 'SingleJob -Proofreading (PRF)', '2022-12-16 00:14:14', '2023-01-18 13:53:35'),
(101, 136, '1', 'Chanel | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"13,3\",\"itemTotal\":\"13.3\",\"amtSum\":13.3}]', 13.3, 28, '5', 0, '3,8', '1', '14', 0, '0000-00-00 00:00:00', '2022-12-16 00:17:00', '2022-12-15 15:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '1', 'DATAWORDS / CHANEL / PRJ-01371 / PIM / INTERSTELLA', '', '', 13.3, 'Auto', '', 'SingleJob -Proofreading (PRF)', '2022-12-16 00:17:53', '2022-12-29 12:14:28'),
(102, 137, '1', 'Shopify | Norwegian (bokmal)-English (US)', '', '[{\"quantity\":\"0,2\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"35\",\"itemTotal\":\"7.00\",\"amtSum\":7}]', 7, 0, '5', 0, '21,28', '1', '14', 0, '0000-00-00 00:00:00', '2022-12-16 00:24:00', '2022-12-13 15:30:00', '12-2022', '', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '5', 'Task [Comment] :: New comment :: [#24842533] Marke', '', '', 7, 'Auto', 'Z1723031164', 'SingleJob -Proofreading (PRF)', '2022-12-16 00:24:53', '2022-12-26 18:06:12'),
(104, 140, '1', 'SpellUp | English (US)-Norwegian (nynorsk) - Nynorsk grammar checker part 1', '', '[{\"quantity\":\"40\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"40\",\"itemTotal\":\"1680.00\",\"amtSum\":1600}]', 1680, 25, '5', 0, '14,29', '1', '14', 0, '0000-00-00 00:00:00', '2022-12-16 13:51:00', '2022-12-15 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (nynorsk)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'Norwegian (computational) linguist/translator', '', '', 1680, 'Auto', '1238-P0025', 'SingleJob -Proofreading (PRF)', '2022-12-16 13:51:49', '2023-01-13 21:16:32'),
(105, 142, '1', 'Cartier | English (US) - English (US)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"20\",\"itemTotal\":\"20.00\",\"amtSum\":20}]', 20, 28, '5', 0, '3,21', '7', '14', 0, '0000-00-00 00:00:00', '2022-12-26 19:34:00', '2022-12-26 15:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '5', 'Datawords / Cartier / Social Media / Paid Tank Fra', 'Email', '', 20, 'Auto', 'PO-DWFR-2022-27535', 'SingleJob -Translation (TRA)', '2022-12-26 19:34:38', '2023-01-03 17:29:59'),
(106, 143, '1', 'Chanel | English (US) - English (US)', '', '[{\"quantity\":\"145\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,10\",\"itemTotal\":\"145.00\"},{\"quantity\":\"2\",\"pricelist\":\"Words Translation 50-74% Match\",\"itemPrice\":\"0,10\",\"itemTotal\":\"02.00\",\"amtSum\":0.2},{\"quantity\":\"4\",\"pricelist\":\"Words Translation 75-84% Match\",\"itemPrice\":\"0,07\",\"itemTotal\":\"028.00\",\"amtSum\":0.28},{\"quantity\":\"12\",\"pricelist\":\"Words Translation 95-99% Match\",\"itemPrice\":\"0,03\",\"itemTotal\":\"036.00\",\"amtSum\":0.36},{\"quantity\":\"50\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":\"0,022\",\"itemTotal\":\"11.00\",\"amtSum\":1.1},{\"quantity\":\"16\",\"pricelist\":\"Words Translation Repetitions\",\"itemPrice\":\"0,010\",\"itemTotal\":\"016.00\",\"amtSum\":0.16}]', 16.6, 28, '1', 0, '3,17', '7', '14', 0, '0000-00-00 00:00:00', '2022-12-26 19:37:00', '2022-12-26 15:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '5', 'DATAWORDS/ CHANEL ONE/ PRJ-01985/ BATCH 58', 'Email', '', 16.6, 'Auto', 'PO-DWFR-2022-27549', 'SingleJob -Translation (TRA)', '2022-12-26 19:37:42', '2023-01-03 17:30:43'),
(107, 144, '1', 'Kiko Cosmetics | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"9\",\"itemTotal\":\"9.00\",\"amtSum\":9}]', 9, 28, '1', 0, '3,21', '7', '14', 0, '0000-00-00 00:00:00', '2022-12-26 19:44:00', '2022-12-27 15:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '5', 'Datawords / Kiko / Packaging / Skin Trainer Cream', 'Email', '', 9, 'Auto', 'PO-DWFR-2022-27351', 'SingleJob -Translation (TRA)', '2022-12-26 19:44:23', '2022-12-27 14:10:15'),
(108, 145, '1', 'Cartier | English (US) - English (US)', '', '[{\"quantity\":\"916\",\"pricelist\":\"Word(s) Proofreading\",\"itemPrice\":\"0,04366812\",\"itemTotal\":\"40.00\",\"amtSum\":39.9376}]', 40, 28, '5', 0, '3,21', '7', '14', 0, '0000-00-00 00:00:00', '2022-12-26 19:52:00', '2022-12-22 15:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '5', 'Datawords / Cartier / Social Media / VDAY & BRIDAL', 'Email', '', 40, 'Auto', 'PO-DWFR-2022-27239', 'SingleJob -Translation (TRA)', '2022-12-26 19:52:18', '2022-12-26 19:53:41'),
(109, 146, '1', 'SpellUp | English (US) - English (US)', '', '[{\"quantity\":\"379\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,09\",\"itemTotal\":\"34.11\"}]', 34.11, 34, '1', 0, '22,30', '7', '14', 0, '0000-00-00 00:00:00', '2022-12-26 20:31:00', '2022-12-19 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '6', 'Task ID : 540902', '', '', 34.11, 'Auto', '540902', 'SingleJob -Translation (TRA)', '2022-12-26 20:31:23', '2023-01-13 21:25:40'),
(110, 146, '2', 'SpellUp | English (US) - English (US)', '', '[{\"quantity\":\"6.780\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,09\",\"itemTotal\":\"610.2\"}]', 610.2, 34, '1', 0, '22,30', '7', '14', 0, '0000-00-00 00:00:00', '2022-12-26 20:31:00', '2022-12-21 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '6', 'Task ID : 538414', 'Platform', '', 610.2, 'Auto', '538414', 'SingleJob -Translation (TRA)', '2022-12-26 20:31:23', '2023-01-13 21:25:40'),
(112, 149, '2', 'Fujifilm | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1982\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,1\",\"itemTotal\":\"198.2\",\"amtSum\":198.2}]', 198.2, 35, '1', 0, '23,32', '7', '14', 0, '0000-00-00 00:00:00', '2022-12-26 20:48:00', '2022-12-19 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'SO-2022-12-0005——[FY22_186] DR translation (EN ->', 'Memsource', '', 198.2, 'Auto', 'SO-2022-12-0005', 'SingleJob -Translation (TRA)', '2022-12-26 20:48:19', '2023-01-13 14:51:23'),
(113, 150, '1', 'GiG (Gaming Innovation Group) | English (US) - English (US)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"11,88\",\"itemTotal\":\"11.88\",\"amtSum\":11.88}]', 11.88, 26, '5', 0, '5,33', '7', '14', 0, '0000-00-00 00:00:00', '2022-12-27 14:01:00', '2022-12-21 15:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '6', 'A proofreading task assigned by you has now been s', 'Email', '', 11.88, 'Auto', 'GILW00001 PR', 'SingleJob -Translation (TRA)', '2022-12-27 14:01:21', '2023-01-05 16:59:14'),
(114, 151, '1', 'XGIMI | English (US) - English (US)', '', '[{\"quantity\":\"1.496\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,1\",\"itemTotal\":\"148.69\",\"amtSum\":149.6},{\"quantity\":\"99\",\"pricelist\":\"Words Translation Repetitions\",\"itemPrice\":\"0,02\",\"itemTotal\":\"1.9\",\"amtSum\":1.98}]', 150.59, 35, '1', 0, '23,31', '7', '14', 0, '0000-00-00 00:00:00', '2022-12-27 14:13:00', '2022-12-19 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '6', 'hand off- ZXL202212018_XGIMI_UI_EN - Norwegian', 'Email', '', 150.59, 'Auto', 'PO-ZXL202212018', 'SingleJob -Translation (TRA)', '2022-12-27 14:13:57', '2023-01-13 14:51:23'),
(116, 153, '1', 'Cartier | English (US) - English (US)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"40,00\",\"itemTotal\":\"40.00\"}]', 40, 28, '5', 0, '3,21', '7', '14', 0, '0000-00-00 00:00:00', '2022-12-27 14:34:00', '2022-12-22 15:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '4', 'Datawords / Cartier / Social Media / VDAY & BRIDAL', 'Email', '', 40, 'Auto', '', 'SingleJob -Translation (TRA)', '2022-12-27 14:34:12', '2022-12-27 14:35:30'),
(117, 154, '1', 'Fujifilm | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"618\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,1\",\"itemTotal\":\"61.8\",\"amtSum\":61.8}]', 61.8, 35, '1', 0, '23,32', '7', '14', 0, '0000-00-00 00:00:00', '2022-12-27 14:37:00', '2022-12-22 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'SO-2022-12-0005——[FY22_186] DR Support Translation', 'Memsource', '', 61.8, 'Auto', '', 'SingleJob -Translation (TRA)', '2022-12-27 14:37:23', '2022-12-27 14:38:12'),
(120, 156, '1', 'Clarins | English (US) - English (US)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"17,98\",\"itemTotal\":\"17.98\",\"amtSum\":17.98}]', 17.98, 28, '1', 0, '3,24', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-03 17:25:00', '2022-12-28 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '5', 'DATAWORDS / CLARINS / PRJ-07607 / Batch 66 / 2022', 'Email', '', 17.98, 'Auto', 'PO-DWFR-2022-27658', 'SingleJob -Translation (TRA)', '2023-01-03 17:25:25', '2023-01-03 17:33:11'),
(121, 157, '1', 'Chanel | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"10,69\",\"itemTotal\":\"10.69\",\"amtSum\":10.69}]', 10.69, 28, '1', 0, '3,8', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-03 17:27:00', '2022-12-27 18:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'DATAWORDS / CHANEL / PRJ-01371 / PIM / INTERSTELLA', 'Email', '', 10.69, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-03 17:27:51', '2023-01-03 17:28:45'),
(122, 158, '1', 'Norwegian Air | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"7,71\",\"itemTotal\":\"7.71\",\"amtSum\":7.71}]', 7.71, 0, '1', 0, '24,34', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-03 17:39:00', '2022-12-22 16:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'New job: 2022/3971/03/4', 'Platform', '', 7.71, 'Auto', '2022/3971/03/4', 'SingleJob -Translation (TRA)', '2023-01-03 17:39:24', '2023-01-13 14:19:20'),
(123, 159, '1', 'Norwegian Air | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"8,69\",\"itemTotal\":\"8.69\",\"amtSum\":8.69}]', 8.69, 0, '1', 0, '24,34', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-03 17:46:00', '2022-12-22 11:30:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', '2022/3957/03/4 / EN-GB » NB / Car rental sale Jan', 'Platform', '', 8.69, 'Auto', '2022/3957/03/4', 'SingleJob -Translation (TRA)', '2023-01-03 17:46:39', '2023-01-13 14:19:20'),
(124, 160, '1', 'Norwegian Air | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"140,73\",\"itemTotal\":\"140.73\",\"amtSum\":140.73}]', 140.73, 0, '1', 0, '24,34', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-03 17:49:00', '2022-12-28 16:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', '2022/3991/04/4 / EN-GB » NB / CHOOOSE climate comp', 'Platform', '', 140.73, 'Auto', '2022/3991/04/4', 'SingleJob -Translation (TRA)', '2023-01-03 17:49:04', '2023-01-13 14:19:20'),
(125, 161, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"20\",\"itemTotal\":\"20.00\",\"amtSum\":20}]', 20, 0, '9', 0, '14,29', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-03 18:26:00', '2022-12-16 15:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'PO: Lingsoft project 987389 / Acolad Translation R', 'Email', '', 20, 'Auto', '987389', 'SingleJob -Translation (TRA)', '2023-01-03 18:26:51', '2023-01-13 21:10:54'),
(126, 162, '1', 'ILOQ | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"38,23\",\"itemTotal\":\"38.23\",\"amtSum\":38.23}]', 38.23, 0, '1', 0, '14,29', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-03 18:28:00', '2022-12-19 16:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'PO: Lingsoft project 987354 / iLOQ during power ou', 'Email', '', 38.23, 'Auto', '987354', 'SingleJob -Translation (TRA)', '2023-01-03 18:28:42', '2023-01-13 21:10:54'),
(127, 164, '1', 'LG | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"31,46\",\"itemTotal\":\"31.46\",\"amtSum\":31.46}]', 31.46, 0, '1', 0, '14,35', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-03 18:32:00', '2022-12-21 10:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'PO: Lingsoft project 987839 / LG_l12_24', 'Email', '', 31.46, 'Auto', '987839', 'SingleJob -Translation (TRA)', '2023-01-03 18:32:24', '2023-01-13 21:10:54'),
(128, 166, '1', 'LG | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"101,81\",\"itemTotal\":\"101.81\",\"amtSum\":101.81}]', 101.81, 0, '1', 0, '14,35', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-03 18:40:00', '2022-12-23 10:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'PO: Lingsoft project 988235 / LG_l12_25', 'Email', '', 101.81, 'Auto', '988235', 'SingleJob -Translation (TRA)', '2023-01-03 18:40:49', '2023-01-13 21:10:54'),
(129, 167, '1', 'LG | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"121,32\",\"itemTotal\":\"121.32\",\"amtSum\":121.32}]', 121.32, 0, '1', 0, '14,35', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-03 18:42:00', '2022-12-28 10:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'PO: Lingsoft project 989811 / LG_l12_35', 'Email', '', 121.32, 'Auto', '989811', 'SingleJob -Translation (TRA)', '2023-01-03 18:42:48', '2023-01-13 21:10:54'),
(130, 168, '1', 'PayPal | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"176,65\",\"itemTotal\":\"176.65\",\"amtSum\":176.65}]', 176.65, 0, '1', 0, '14,35', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-03 18:44:00', '2022-12-29 15:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'PO: Lingsoft project 990016 / [Heads up] C827 PayP', 'Email', '', 176.65, 'Auto', '990016', 'SingleJob -Translation (TRA)', '2023-01-03 18:44:32', '2023-01-13 21:10:54'),
(131, 169, '1', 'Yahoo | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"10,34\",\"itemTotal\":\"10.34\",\"amtSum\":10.34}]', 10.34, 0, '1', 0, '14,35', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-03 18:46:00', '2022-12-28 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'PO: Lingsoft project 990035 / [24994162] Yahoo L10', 'Email', '', 10.34, 'Auto', '990035', 'SingleJob -Translation (TRA)', '2023-01-03 18:46:35', '2023-01-13 21:10:54'),
(132, 170, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"14318\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,1\",\"itemTotal\":\"1431.8\",\"amtSum\":1431.8}]', 1431.8, 35, '1', 0, '23,32', '1', '14', 0, '0000-00-00 00:00:00', '2023-01-04 19:55:00', '2022-12-27 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'SO-2022-12-0005——[FY22_195] Client DR translation', '', '', 1431.8, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-04 19:55:04', '2023-01-04 19:56:15'),
(133, 171, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"394\",\"pricelist\":\"Word(s) Proofreading\",\"itemPrice\":\"0,03\",\"itemTotal\":\"11.82\",\"amtSum\":11.82}]', 11.82, 26, '5', 0, '5', '1', '14', 0, '0000-00-00 00:00:00', '2023-01-04 20:01:00', '2022-12-21 15:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '1', 'A new proofreading task has been assigned to you.', '', '', 11.82, 'Auto', '', 'SingleJob -Proofreading (PRF)', '2023-01-04 20:01:11', '2023-01-04 20:02:31'),
(134, 172, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"4000\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,1\",\"itemTotal\":\"400.00\",\"amtSum\":400}]', 400, 35, '1', 0, '23', '1', '14', 0, '0000-00-00 00:00:00', '2023-01-04 20:05:00', '2022-12-09 15:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'ZXL202212018', '', '', 400, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-04 20:05:06', '2023-01-04 20:05:54'),
(135, 173, '1', 'Google | English (US)-Norwegian (bokmal)', '', '', 0, 0, '9', 0, '21', '1', '14', 0, '0000-00-00 00:00:00', '2023-01-04 20:27:00', '2022-12-31 15:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'SOW | Google Inc. | Apps and Others | 2989223 | Au', '', '', 0, 'Auto', '', 'SingleJob -Machine Translation Post-Editing (MTP)', '2023-01-04 20:27:27', '2023-01-04 20:28:08'),
(136, 174, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"618\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,1\",\"itemTotal\":\"61.8\",\"amtSum\":61.8}]', 61.8, 35, '1', 0, '23,32', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-04 20:30:00', '2022-12-25 16:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'SO-2022-12-0005——[FY22_186] DR Support Translation', '', '', 61.8, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-04 20:30:45', '2023-01-04 20:31:50'),
(144, 178, '1', 'KLM | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"2\",\"itemTotal\":\"2.00\",\"amtSum\":2}]', 2, 0, '1', 0, '24,36', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-05 13:47:00', '2022-12-30 12:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', '2022/4027/16/15 / EN-GB » NB / SDL Tridion - KLMM', 'Platform', '', 2, 'Auto', '2022/4027/16/15', 'SingleJob -Translation (TRA)', '2023-01-05 13:47:32', '2023-01-13 14:19:20'),
(145, 179, '1', 'Fujifilm | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"2.068\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,1\",\"itemTotal\":\"206.8\"}]', 206.8, 35, '1', 0, '23,32', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-05 13:50:00', '2022-12-28 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'SO-2022-12-0005——[FY22_186] DR Support Translation', 'Email', '', 206.8, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-05 13:50:21', '2023-01-05 13:51:18'),
(146, 179, '2', 'Fujifilm | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"3.012\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,1\",\"itemTotal\":\"301.2\"}]', 301.2, 35, '1', 0, '23,32', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-05 13:52:00', '2022-12-31 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'Re: Re: SO-2022-12-0005——[FY22_229] DR Support (EN', 'Email', '', 301.2, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-05 13:52:04', '2023-01-05 13:52:55'),
(147, 180, '1', 'XGIMI | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"73\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,1\",\"itemTotal\":\"7.3\"}]', 7.3, 35, '1', 0, '23,32', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-05 13:54:00', '2022-12-28 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'ZXL202212027 XGIMI UI string EN to - nb-NO', 'Email', '', 7.3, 'Auto', 'PO-ZXL202212027', 'SingleJob -Translation (TRA)', '2023-01-05 13:54:03', '2023-01-13 14:51:23'),
(148, 181, '1', 'Derivco | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"302,39\",\"itemTotal\":\"302.39\",\"amtSum\":302.39}]', 302.39, 32, '1', 0, '16,20', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-05 13:56:00', '2022-12-31 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'R: DERIVCO JOBS: PO', 'MemoQ', '', 302.39, 'Auto', 'PO/2.875', 'SingleJob -Translation (TRA)', '2023-01-05 13:56:26', '2023-01-13 21:27:06'),
(149, 182, '1', 'LG | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"93.92\",\"itemTotal\":\"93.92\",\"amtSum\":9392}]', 93.92, 25, '1', 0, '14,35', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-05 13:58:00', '2023-01-03 17:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'PO: Lingsoft project 990807 / LG_l01_02', 'Platform', '', 93.92, 'Auto', '990807', 'SingleJob -Translation (TRA)', '2023-01-05 13:58:45', '2023-01-13 21:10:54'),
(150, 184, '1', 'PayPal | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"160\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"17.6\"}]', 17.6, 25, '1', 0, '14,38', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-05 14:01:00', '2023-01-04 16:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'Lingsoft project 991124 / [Handoff] C827 PayPal HO', 'Email', '', 17.6, 'Auto', '991124', 'SingleJob -Translation (TRA)', '2023-01-05 14:01:30', '2023-01-13 21:10:54'),
(151, 185, '1', 'Scorewarrior | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"18\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"1.98\"}]', 1.98, 15, '1', 0, '9,10', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-05 14:03:00', '2023-01-05 17:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'Vladislav Solntsev assigned a task to you in the T', 'Crowdin', '', 1.98, 'Auto', 'Translate Mobile store (Android).docx', 'SingleJob -Translation (TRA)', '2023-01-05 14:03:09', '2023-01-05 14:03:54'),
(153, 187, '1', 'Canon | English (US)-Norwegian (bokmal) - B2B - DS - NCC Article - MSPUB-13993', '', '[{\"quantity\":\"1.277\",\"pricelist\":\"Machine Translation Editing (New)\",\"itemPrice\":\"0,08\",\"itemTotal\":\"102.16\"},{\"quantity\":\"27\",\"pricelist\":\"Words Translation 85-94% Match\",\"itemPrice\":\"0,033\",\"itemTotal\":\"0.891\"}]', 103.051, 36, '9', 0, '25,40', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-05 14:20:00', '2022-12-30 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '5', 'Canon-jobber til 30.12', 'Email', '', 103.051, 'Auto', 'PNOOC027887 | CAN_QHOAJM_144', 'SingleJob -Machine Translation Post-Editing (MTP)', '2023-01-05 14:20:57', '2023-01-05 14:31:35'),
(154, 187, '2', 'Canon | English (US)-Norwegian (bokmal) | PIM EC-18259 NORDIC Delta', '', '[{\"quantity\":\"1.071\",\"pricelist\":\"Machine Translation Editing (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"117.81\",\"amtSum\":117.81},{\"quantity\":\"87\",\"pricelist\":\"Words Translation 75-84% Match\",\"itemPrice\":\"0,066\",\"itemTotal\":\"5.742\"},{\"quantity\":\"834\",\"pricelist\":\"Words Translation 85-94% Match\",\"itemPrice\":\"0,033\",\"itemTotal\":\"27.522\"}]', 151.07, 36, '9', 0, '25,40', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-05 14:20:00', '2022-12-30 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'Canon-jobber til 30.12', 'Email', '', 151.07, 'Auto', 'PNOOC027897 | CAN_THOAJM_147', 'SingleJob -Machine Translation Post-Editing (MTP)', '2023-01-05 14:20:57', '2023-01-12 23:26:48'),
(155, 189, '1', 'Lindex | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"3.251\",\"pricelist\":\"Machine Translation Editing (New)\",\"itemPrice\":\"0,08\",\"itemTotal\":\"260.08\"},{\"quantity\":\"313\",\"pricelist\":\"Words Translation 75-84% Match\",\"itemPrice\":\"0,066\",\"itemTotal\":\"20.658\"},{\"quantity\":\"613\",\"pricelist\":\"Words Translation 85-94% Match\",\"itemPrice\":\"0,033\",\"itemTotal\":\"20.229\"}]', 300.97, 36, '9', 0, '25,42', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-05 14:25:00', '2022-12-29 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'RWS - Purchase Order #PNOOC027872', 'Email', '', 300.97, 'Auto', 'PNOOC027872 | SKN_RSMAXX_005', 'SingleJob -Machine Translation Post-Editing (MTP)', '2023-01-05 14:25:15', '2023-01-12 23:26:48'),
(156, 189, '2', 'Lindex | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"3.583\",\"pricelist\":\"Machine Translation Editing (New)\",\"itemPrice\":\"0,08\",\"itemTotal\":\"286.64\"},{\"quantity\":\"465\",\"pricelist\":\"Words Translation 75-84% Match\",\"itemPrice\":\"0,066\",\"itemTotal\":\"30.69\"},{\"quantity\":\"566\",\"pricelist\":\"Words Translation 85-94% Match\",\"itemPrice\":\"0,033\",\"itemTotal\":\"18.678\"}]', 336.01, 36, '9', 0, '25,42', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-05 14:26:00', '2022-12-27 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'RWS - Purchase Order #PNOOC027874', 'Email', '', 336.01, 'Auto', 'PNOOC027874 | SKN_RSMAXX_005', 'SingleJob -Machine Translation Post-Editing (MTP)', '2023-01-05 14:26:59', '2023-01-12 23:26:48'),
(157, 189, '3', 'Lindex | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"2.147\",\"pricelist\":\"Machine Translation Editing (New)\",\"itemPrice\":\"0,08\",\"itemTotal\":\"171.76\"},{\"quantity\":\"157\",\"pricelist\":\"Words Translation 75-84% Match\",\"itemPrice\":\"0,066\",\"itemTotal\":\"10.362\"},{\"quantity\":\"269\",\"pricelist\":\"Words Translation 85-94% Match\",\"itemPrice\":\"0,033\",\"itemTotal\":\"8.877\"}]', 191, 36, '9', 0, '25,42', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-05 14:28:00', '2022-12-29 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'RWS - Purchase Order #PNOOC027875', 'Email', '', 191, 'Auto', 'PNOOC027875 | SKN_RSMAXX_005', 'SingleJob -Machine Translation Post-Editing (MTP)', '2023-01-05 14:28:45', '2023-01-12 23:26:48'),
(158, 192, '1', 'Google | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"257\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"28.27\"},{\"quantity\":\"269\",\"pricelist\":\"Words Translation 85-94% Match\",\"itemPrice\":\"0,033\",\"itemTotal\":\"8.877\"}]', 37.15, 37, '1', 0, '25,42', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-05 14:34:00', '2023-01-05 17:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'RWS - Purchase Order #PNOOC027883', 'Email', '', 37.15, 'Auto', 'PNOOC027883 | GGL_ZGLATO_104', 'SingleJob -Translation (TRA)', '2023-01-05 14:34:57', '2023-01-12 23:26:48'),
(159, 192, '2', 'Google | English (US) - English (US)', '', '[{\"quantity\":\"425\",\"pricelist\":\"Machine Translation Editing (New)\",\"itemPrice\":\"0,08\",\"itemTotal\":\"34.00\"},{\"quantity\":\"431\",\"pricelist\":\"Words Translation 85-94% Match\",\"itemPrice\":\"0,033\",\"itemTotal\":\"14.223\"}]', 48.22, 36, '9', 0, '25,42', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-05 14:36:00', '2023-01-05 17:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '6', 'RWS - Purchase Order #PNOOC027882', 'Email', '', 48.22, 'Auto', 'PNOOC027882 | GGL_ZGLATO_104', 'SingleJob -Machine Translation Post-Editing (MTP)', '2023-01-05 14:36:12', '2023-01-12 23:26:48'),
(160, 193, '1', 'Canon | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"3.044\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"334.84\"},{\"quantity\":\"387\",\"pricelist\":\"Words Translation 75-84% Match\",\"itemPrice\":\"0,066\",\"itemTotal\":\"25.542\"},{\"quantity\":\"1.037\",\"pricelist\":\"Words Translation 85-94% Match\",\"itemPrice\":\"0,033\",\"itemTotal\":\"34.221\"}]', 394.6, 37, '1', 0, '25,42', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-05 14:41:00', '2022-12-29 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'RWS - Purchase Order #PNOOC027899', 'Email', '', 394.6, 'Auto', 'PNOOC027899 | CAN_THOAJM_147', 'SingleJob -Translation (TRA)', '2023-01-05 14:41:30', '2023-01-12 23:26:48'),
(161, 193, '2', 'Canon | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"2.844\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"312.84\"},{\"quantity\":\"435\",\"pricelist\":\"Words Translation 75-84% Match\",\"itemPrice\":\"0,066\",\"itemTotal\":\"28.71\"},{\"quantity\":\"1.758\",\"pricelist\":\"Words Translation 85-94% Match\",\"itemPrice\":\"0,033\",\"itemTotal\":\"58.014\"}]', 399.56, 37, '1', 0, '25,42', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-05 14:43:00', '2022-12-30 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'RWS - Purchase Order #PNOOC027900', 'Email', '', 399.56, 'Auto', 'PNOOC027900 | CAN_THOAJM_147', 'SingleJob -Translation (TRA)', '2023-01-05 14:43:03', '2023-01-12 23:26:48'),
(162, 194, '1', 'Man Group | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"2.882\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"317.03\",\"amtSum\":317.02},{\"quantity\":\"231\",\"pricelist\":\"Words Translation 75-84% Match\",\"itemPrice\":\"0,066\",\"itemTotal\":\"15.246\"},{\"quantity\":\"1.295\",\"pricelist\":\"Words Translation 85-94% Match\",\"itemPrice\":\"0,033\",\"itemTotal\":\"42.735\"}]', 375.01, 37, '1', 0, '25,42', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-05 14:45:00', '2022-12-30 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'RWS - Purchase Order #PNOOC027925', 'Email', '', 375.01, 'Auto', 'PNOOC027925 | MGR_EZCAMZ_001', 'SingleJob -Translation (TRA)', '2023-01-05 14:45:39', '2023-01-12 23:26:48');
INSERT INTO `tms_items` (`itemId`, `order_id`, `item_number`, `item_name`, `description`, `price`, `total_price`, `project_pricelist`, `project_type`, `tax`, `contact_person`, `manager`, `coordinator`, `heads_up`, `upcomingDate`, `start_date`, `due_date`, `q_date`, `item_language`, `source_lang`, `target_lang`, `item_status`, `item_email_subject`, `place_of_delivery`, `amount`, `total_amount`, `auto_status`, `po_number`, `attached_workflow`, `created_date`, `updated_date`) VALUES
(165, 197, '1', 'BMS | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"303\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"33.33\",\"amtSum\":33.33},{\"quantity\":\"121\",\"pricelist\":\"Words Translation 75-84% Match\",\"itemPrice\":\"0,066\",\"itemTotal\":\"7.986\",\"amtSum\":7.986},{\"quantity\":\"223\",\"pricelist\":\"Words Translation 85-94% Match\",\"itemPrice\":\"0,033\",\"itemTotal\":\"7.359\",\"amtSum\":7.359}]', 48.68, 38, '1', 0, '26,43', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-05 15:44:00', '2023-01-02 17:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'SDL Vendor Purchase Order - PGBMC274888 - Marthe K', 'Mail', '', 48.68, 'Auto', 'PGBMC274888 | BMS_ELMAQM_003', 'SingleJob -Translation (TRA)', '2023-01-05 15:44:03', '2023-01-05 16:51:04'),
(166, 33, '2', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"17,5\",\"itemTotal\":\"17.5\",\"amtSum\":17.5}]', 17.5, 0, '1', 0, '3,5', '1', '2', 0, '0000-00-00 00:00:00', '2023-01-05 16:22:00', '2022-12-20 12:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '6', 'PO-DWFR-2022-21256', 'Email', '', 17.5, 'Auto', 'PO-DWFR-2022-21256', 'SingleJob -Translation (TRA)', '2023-01-05 16:22:20', '2023-01-05 16:29:10'),
(167, 33, '3', 'SpellUp | English (US) - English (US)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"35\",\"itemTotal\":\"35.00\",\"amtSum\":35}]', 35, 0, '1', 0, '3,5', '1', '2', 0, '0000-00-00 00:00:00', '2023-01-05 16:23:00', '2022-12-21 17:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '6', 'PO-DWFR-2022-21254', 'Email', '', 35, 'Auto', 'PO-DWFR-2022-21254', 'SingleJob -Translation (TRA)', '2023-01-05 16:23:13', '2023-01-05 16:29:10'),
(168, 198, '1', 'Scorewarrior | English (US) - English (US)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"40\",\"itemTotal\":\"40.00\",\"amtSum\":40}]', 45, 0, '5', 0, '9,10', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-05 16:32:00', '2022-12-20 12:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '6', 'Guide', 'Mail', '', 45, 'Auto', 'Guide', 'SingleJob -Proofreading (PRF)', '2023-01-05 16:32:23', '2023-01-05 16:33:35'),
(169, 199, '1', 'Ecolab | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"20\",\"itemTotal\":\"20.00\",\"amtSum\":20}]', 20, 25, '1', 0, '14,35', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-10 23:59:00', '2023-01-10 15:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'PO: Lingsoft project 992290 / Acolad Translation R', '', '', 20, 'Auto', '992290', 'SingleJob -Translation (TRA)', '2023-01-10 23:59:20', '2023-01-11 00:01:19'),
(170, 200, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"455,93\",\"itemTotal\":\"455.93\",\"amtSum\":455.93}]', 455.93, 29, '1', 0, '17,23', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-12 15:14:00', '2023-01-17 13:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '1', 'Fasttranslator Purchase Order [#557282]', '', '', 455.93, 'Auto', '557282', 'SingleJob -Translation (TRA)', '2023-01-12 15:14:00', '2023-01-12 15:15:32'),
(171, 201, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '', 0, 32, '1', 0, '16,45', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-12 17:46:00', '2023-01-12 13:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'Derivco: tasns in MemoQ - delivery', '', '', 0, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-12 17:46:02', '2023-01-15 17:00:10'),
(172, 178, '2', 'KLM | English (US) - English (US)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"2\",\"itemTotal\":\"20000.00\",\"amtSum\":2}]', 2, 0, '1', 0, '24,36', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-13 14:17:00', '2022-12-28 15:00:00', '12-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '6', '2022/4019/20/15', 'Portal', '', 2, 'Auto', '2022/4019/20/15', 'SingleJob -Translation (TRA)', '2023-01-13 14:17:56', '2023-01-13 14:19:20'),
(173, 203, '1', 'Google | English (US)-Norwegian (bokmal) 3190002', '', '[{\"quantity\":\"0309\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":\"0\",\"itemTotal\":\"\",\"amtSum\":0},{\"quantity\":\"17\",\"pricelist\":\"Words Translation 85-94% Match\",\"itemPrice\":\"0,033\",\"itemTotal\":\"0.561\",\"amtSum\":0.561},{\"quantity\":\"25\",\"pricelist\":\"Machine Translation Editing (New)\",\"itemPrice\":\"0,08\",\"itemTotal\":\"2.00\",\"amtSum\":2}]', 2.561, 36, '9', 0, '25,47', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-15 16:30:00', '2023-01-12 12:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'SOW | Google Inc. | YouTube | 3190002 | gkms YouTu', '', '', 2.561, 'Auto', '', 'SingleJob -Machine Translation Post-Editing (MTP)', '2023-01-15 16:30:29', '2023-01-15 16:37:38'),
(174, 203, '2', 'Google | English (US)-Norwegian (bokmal)  3192731', '', '[{\"quantity\":\"763\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":0,\"itemTotal\":\"\",\"amtSum\":0},{\"quantity\":\"12\",\"pricelist\":\"Words Translation 85-94% Match\",\"itemPrice\":\"0,033\",\"itemTotal\":\"0.396\",\"amtSum\":0.396},{\"quantity\":\"12\",\"pricelist\":\"Machine Translation Editing (New)\",\"itemPrice\":\"0,08\",\"itemTotal\":\"0.96\",\"amtSum\":0.96}]', 1.356, 36, '9', 0, '25,47', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-15 16:35:00', '2023-01-12 12:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'SOW | Google Inc. | YouTube | 3192731 | gkms YouTu', '', '', 1.356, 'Auto', '', 'SingleJob -Machine Translation Post-Editing (MTP)', '2023-01-15 16:35:40', '2023-01-15 16:38:33'),
(175, 203, '3', 'Google | English (US)-Norwegian (bokmal) 1468485', '', '[{\"quantity\":\"509\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":\"0\",\"itemTotal\":\"\",\"amtSum\":0},{\"quantity\":\"26\",\"pricelist\":\"Words Translation Repetitions\",\"itemPrice\":\"0\",\"itemTotal\":\"\",\"amtSum\":0},{\"quantity\":\"056\",\"pricelist\":\"Machine Translation Editing (New)\",\"itemPrice\":\"0,08\",\"itemTotal\":\"4.48\",\"amtSum\":4.48}]', 4.48, 36, '9', 0, '25,47', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-15 16:38:00', '2023-01-12 12:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'SOW | Google Inc. | YouTube | 1468485 | gkms YouTu', '', '', 4.48, 'Auto', '', 'SingleJob -Machine Translation Post-Editing (MTP)', '2023-01-15 16:38:38', '2023-01-15 16:45:54'),
(176, 203, '4', 'Google | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"34\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":\"0\",\"itemTotal\":\"\",\"amtSum\":0},{\"quantity\":\"13\",\"pricelist\":\"Words Translation Repetitions\",\"itemPrice\":\"0\",\"itemTotal\":\"\",\"amtSum\":0},{\"quantity\":\"16\",\"pricelist\":\"Words Translation 85-94% Match\",\"itemPrice\":\"0,033\",\"itemTotal\":\"0.528\",\"amtSum\":0.528},{\"quantity\":\"19\",\"pricelist\":\"Machine Translation Editing (New)\",\"itemPrice\":\"0,08\",\"itemTotal\":\"1.52\",\"amtSum\":1.52}]', 2.048, 36, '9', 0, '25,47', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-15 16:41:00', '2023-01-12 12:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'SOW | Google Inc. | YouTube | 3192512 | Automatic', '', '', 2.048, 'Auto', '', 'SingleJob -Machine Translation Post-Editing (MTP)', '2023-01-15 16:41:13', '2023-01-15 16:42:55'),
(177, 203, '5', 'Google | English (US)-Norwegian (bokmal) 3192313', '', '[{\"quantity\":\"184\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":\"0\",\"itemTotal\":\"\",\"amtSum\":0},{\"quantity\":\"56\",\"pricelist\":\"Machine Translation Editing (New)\",\"itemPrice\":\"0,08\",\"itemTotal\":\"4.48\",\"amtSum\":4.48}]', 4.48, 36, '9', 0, '25,47', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-15 16:43:00', '2023-01-12 12:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'SOW | Google Inc. | YouTube | 3192313 | gkms YouTu', '', '', 4.48, 'Auto', '', 'SingleJob -Machine Translation Post-Editing (MTP)', '2023-01-15 16:43:31', '2023-01-15 16:46:10'),
(178, 201, '2', 'SpellUp | English (US)-Norwegian (bokmal) -	PEARF-0079', '', '', 0, 32, '1', 0, '16,45', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-15 16:55:00', '2023-01-12 12:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'R: Derivco: tasks in MemoQ - delivery', '', '', 0, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-15 16:55:33', '2023-01-15 17:06:59'),
(179, 201, '3', 'SpellUp | English (US)-Norwegian (bokmal) -	SWITCH 0053', '', '', 0, 32, '1', 0, '16,45', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-15 16:55:00', '2023-01-12 12:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'R: Derivco: tasks in MemoQ - delivery', '', '', 0, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-15 16:55:33', '2023-01-15 17:07:10'),
(180, 201, '4', 'SpellUp | English (US)-Norwegian (bokmal)-	NEW PROD 0026', '', '', 0, 32, '1', 0, '16,45', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-15 16:55:00', '2023-01-12 12:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'R: Derivco: tasks in MemoQ - delivery', '', '', 0, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-15 16:55:33', '2023-01-15 17:07:19'),
(181, 201, '5', 'SpellUp | English (US)-Norwegian (bokmal) -	AURUM 0060', '', '', 0, 32, '1', 0, '16,45', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-15 16:55:00', '2023-01-12 12:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'R: Derivco: tasks in MemoQ - delivery', '', '', 0, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-15 16:55:33', '2023-01-15 17:07:29'),
(182, 201, '6', 'SpellUp | English (US)-Norwegian (bokmal) -	AURUM 0060 2', '', '', 0, 32, '1', 0, '16,45', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-15 16:55:00', '2023-01-12 12:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'R: Derivco: tasks in MemoQ - delivery', '', '', 0, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-15 16:55:33', '2023-01-15 17:07:50'),
(183, 201, '7', 'SpellUp | English (US)-Norwegian (bokmal) -	LIVE5 0010', '', '', 0, 32, '1', 0, '16,45', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-15 16:55:00', '2023-01-12 12:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'R: Derivco: tasks in MemoQ - delivery', '', '', 0, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-15 16:55:39', '2023-01-15 17:07:59'),
(184, 201, '8', 'SpellUp | English (US)-Norwegian (bokmal) -	LIVE5 0011', '', '', 0, 32, '1', 0, '16,45', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-15 16:55:00', '2023-01-12 12:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'R: Derivco: tasks in MemoQ - delivery', '', '', 0, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-15 16:55:39', '2023-01-15 16:59:44'),
(185, 204, '1', 'KLM (KLM Royal Dutch Airlines) | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"20\",\"pricelist\":\"Machine Translation Editing (New)\",\"itemPrice\":\"0\",\"itemTotal\":\"\",\"amtSum\":0}]', 0, 0, '9', 0, '24,36', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-15 17:10:00', '2023-01-13 12:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', '2023/0125/03/15 / EN-GB » NB / SDL Tridion - KLMM', '', '', 0, 'Auto', '', 'SingleJob -Machine Translation Post-Editing (MTP)', '2023-01-15 17:10:25', '2023-01-15 17:11:33'),
(186, 205, '1', 'Google | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"700\",\"pricelist\":\"Machine Translation Editing (New)\",\"itemPrice\":\"0,08\",\"itemTotal\":\"56.00\",\"amtSum\":56},{\"quantity\":\"278\",\"pricelist\":\"Words Translation 95-99% Match\",\"itemPrice\":\"0,033\",\"itemTotal\":\"9.174\",\"amtSum\":9.174}]', 65.174, 36, '9', 0, '25,47', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-17 01:24:00', '2023-01-16 20:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'RWS - Purchase Order #PNOOC028066', '', '', 65.174, 'Auto', 'PNOOC028066', 'SingleJob -Machine Translation Post-Editing (MTP)', '2023-01-17 01:24:36', '2023-01-17 01:26:08'),
(187, 207, '1', 'Scorewarrior | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"447\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"49.17\",\"amtSum\":49.17}]', 49.17, 15, '1', 0, '9,10', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-17 01:36:00', '2023-01-16 21:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'Vladislav Solntsev assigned a task to you in the T', '', '', 49.17, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-17 01:36:08', '2023-01-17 01:37:07'),
(188, 208, '1', 'PayPal | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"69,01\",\"itemTotal\":\"69.01\",\"amtSum\":69.01}]', 69.01, 25, '1', 0, '14,35', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-18 13:40:00', '2023-01-16 09:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'PO: Lingsoft project 994705 / [Handoff] C827 PayPa', '', '', 69.01, 'Auto', '994705', 'SingleJob -Translation (TRA)', '2023-01-18 13:40:59', '2023-01-18 13:42:32'),
(189, 201, '9', 'SpellUp | English (US)-Norwegian (bokmal) OROS-0024', '', '', 0, 32, '9', 0, '16,20', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-18 13:46:00', '2023-01-17 09:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'DERIVCO - NEW ASSIGNMENT THREAD: JANUARY', '', '', 0, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-18 13:46:50', '2023-01-18 13:48:15'),
(190, 201, '10', 'SpellUp | English (US)-Norwegian (bokmal)OROS-0025', '', '', 0, 32, '1', 0, '16,20', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-18 13:46:00', '2023-01-17 09:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'DERIVCO - NEW ASSIGNMENT THREAD: JANUARY', '', '', 0, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-18 13:46:50', '2023-01-18 13:49:26'),
(191, 201, '11', 'SpellUp | English (US)-Norwegian (bokmal) REALD-0092', '', '', 0, 32, '1', 0, '16,20', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-18 13:46:00', '2023-01-17 09:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'DERIVCO - NEW ASSIGNMENT THREAD: JANUARY', '', '', 0, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-18 13:46:50', '2023-01-18 13:50:18'),
(192, 201, '12', 'SpellUp | English (US)-Norwegian (bokmal) SLINGS-0044', '', '', 0, 32, '1', 0, '16,20', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-18 13:46:00', '2023-01-17 09:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'DERIVCO - NEW ASSIGNMENT THREAD: JANUARY', '', '', 0, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-18 13:46:50', '2023-01-18 13:51:09'),
(193, 201, '13', 'SpellUp | English (US)-Norwegian (bokmal) DER-0125', '', '', 0, 32, '1', 0, '16,20', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-18 13:46:00', '2023-01-17 09:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'DERIVCO - NEW ASSIGNMENT THREAD: JANUARY', '', '', 0, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-18 13:46:50', '2023-01-18 13:53:50'),
(194, 201, '14', 'SpellUp | English (US)-Norwegian (bokmal) JFTW-0103', '', '', 0, 32, '1', 0, '16,20', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-18 13:54:00', '2023-01-17 09:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'DERIVCO - NEW ASSIGNMENT THREAD: JANUARY', '', '', 0, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-18 13:54:22', '2023-01-18 13:55:15'),
(195, 209, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"171\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,1\",\"itemTotal\":\"17.1\",\"amtSum\":17.1}]', 17.1, 35, '1', 0, '23,32', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-18 13:57:00', '2023-01-17 09:30:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'O-0100-00106——[FY22_248] CS Translation Request (E', '', '', 17.1, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-18 13:57:36', '2023-01-18 13:58:12'),
(196, 210, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"8,01\",\"itemTotal\":\"8.01\",\"amtSum\":8.01}]', 8.01, 0, '1', 0, '8,9', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-18 13:59:00', '2023-01-17 09:30:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'Re: SV: SV: SV: EN-NORWEGIAN freelance translator', '', '', 8.01, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-18 13:59:38', '2023-01-18 14:00:19'),
(197, 211, '1', 'D&G (Dolce Gabbana) | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"5\",\"itemTotal\":\"5.00\",\"amtSum\":5}]', 5, 28, '1', 0, '3,22', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-18 14:02:00', '2023-01-13 09:30:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'DW TRANSLATION // D&G // PRJ-07694 // Sitelink San', '', '', 5, 'Auto', 'PO-DWFR-2023-01142', 'SingleJob -Translation (TRA)', '2023-01-18 14:02:03', '2023-01-18 14:05:11'),
(198, 212, '1', 'Shopify | English (US)-Norwegian (bokmal)', '', '', 0, 0, '9', 0, '21,28', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-24 00:58:00', '2023-01-20 20:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'Order :: [#25188933] Marketing Edit - NB-NO :: Loc', '', '', 0, 'Auto', '', 'SingleJob -Machine Translation Post-Editing (MTP)', '2023-01-24 00:58:37', '2023-01-24 00:59:07'),
(199, 214, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '', 0, 0, '5', 0, '27,50', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-25 00:24:00', '2023-01-20 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', '668_20230112_xbox_P1', '', '', 0, 'Auto', '', 'SingleJob -Proofreading (PRF)', '2023-01-25 00:24:35', '2023-01-25 00:25:08'),
(200, 215, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '', 0, 0, '5', 0, '27,50', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-25 00:26:00', '2023-01-20 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'ASG- Spark Digital Other Silo // CRM_13_7363_Minec', '', '', 0, 'Auto', '', 'SingleJob -Proofreading (PRF)', '2023-01-25 00:26:30', '2023-01-25 00:26:56'),
(201, 217, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '', 0, 0, '5', 0, '27,50', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-25 00:29:00', '2023-01-20 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'ASG- Spark Digital Other Silo // CRM_17_7386_Minec', '', '', 0, 'Auto', '', 'SingleJob -Proofreading (PRF)', '2023-01-25 00:29:20', '2023-01-25 00:29:49'),
(202, 218, '1', 'ILOQ | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"31,7\",\"itemTotal\":\"31.7\",\"amtSum\":31.7}]', 31.7, 25, '1', 0, '14,35', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-25 00:31:00', '2023-01-20 20:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'PO: Lingsoft project 996009 / Heads up! Issue 3 EN', '', '', 31.7, 'Auto', '996009', 'SingleJob -Translation (TRA)', '2023-01-25 00:31:04', '2023-01-25 00:31:53'),
(203, 219, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '', 0, 0, '9', 0, '24,36', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-25 00:37:00', '2023-01-20 20:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'New job: 2023/0205/02/15', '', '', 0, 'Auto', '', 'SingleJob -Machine Translation Post-Editing (MTP)', '2023-01-25 00:37:38', '2023-01-25 00:38:07'),
(204, 220, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"0,5\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"43\",\"itemTotal\":\"21.5\",\"amtSum\":21.5}]', 21.5, 0, '5', 0, '52', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-25 00:43:00', '2023-01-19 20:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'READY FOR | 2210_007_016_RST_HSA_20.0_L10N | 0.50 ', '', '', 21.5, 'Auto', 'P2023 000869', 'SingleJob -Proofreading (PRF)', '2023-01-25 00:43:59', '2023-01-25 23:30:14'),
(205, 221, '1', 'GiG (Gaming Innovation Group) | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"32,85\",\"itemTotal\":\"32.85\",\"amtSum\":32.85}]', 32.85, 26, '5', 0, '5,33', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-25 00:46:00', '2023-01-18 20:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'A new proofreading task has been assigned to you. ', '', '', 32.85, 'Auto', 'GILW00021 - GMS 1986 PR', 'SingleJob -Proofreading (PRF)', '2023-01-25 00:46:43', '2023-01-25 00:47:38'),
(206, 222, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '', 0, 0, '1', 0, '23,32', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-25 00:48:00', '2023-01-18 20:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'O-0100-00106——[FY22_229] DR Translation - EN->VI/I', '', '', 0, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-25 00:48:49', '2023-01-25 00:49:31'),
(207, 223, '1', 'ILOQ | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"59,08\",\"itemTotal\":\"59.08\",\"amtSum\":59.08}]', 59.08, 25, '1', 0, '14,35', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-25 00:50:00', '2023-01-18 20:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'PO: Lingsoft project 995047 / G50S User guide EN-F', '', '', 59.08, 'Auto', '995047', 'SingleJob -Translation (TRA)', '2023-01-25 00:50:28', '2023-01-25 00:51:09'),
(208, 224, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"13,40\",\"itemTotal\":\"13.4\",\"amtSum\":13.4}]', 13.4, 38, '1', 0, '26,43', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-25 00:54:00', '2023-01-18 20:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'SDL Vendor Purchase Order - PGBMC278178 - Marthe K', '', '', 13.4, 'Auto', 'PGBMC278178', 'SingleJob -Translation (TRA)', '2023-01-25 00:54:15', '2023-01-25 00:55:00'),
(209, 225, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '', 0, 35, '1', 0, '23,32', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-25 00:56:00', '2023-01-18 20:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'O-0100-00106——[FY22_229] DR Translation - EN->DA/N', '', '', 0, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-25 00:56:05', '2023-01-25 00:56:34'),
(210, 226, '1', 'Tussitaikurit | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"33,99\",\"itemTotal\":\"33.99\",\"amtSum\":33.99}]', 33.99, 25, '1', 0, '14,35', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-25 00:58:00', '2023-01-18 20:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '4', 'PO: Lingsoft project 995692 / T-SCHNELFI-01 voiceo', '', '', 33.99, 'Auto', '995692', 'SingleJob -Translation (TRA)', '2023-01-25 00:58:13', '2023-01-25 00:59:00'),
(211, 227, '1', 'Google | English (US)-Norwegian (bokmal) 1468234', '', '', 0, 0, '9', 0, '28', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-25 23:25:00', '2023-01-18 18:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'SOW | Google Inc. | YouTube | 1468234 | gkms YouTu', '', '', 0, 'Auto', '', 'SingleJob -Machine Translation Post-Editing (MTP)', '2023-01-25 23:25:12', '2023-01-25 23:29:15'),
(212, 227, '2', 'Google | English (US)-Norwegian (bokmal) 1468883', '', '', 0, 0, '9', 0, '28', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-25 23:25:00', '2023-01-18 18:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'SOW | Google Inc. | YouTube | 1468883 | gkms YouTu', '', '', 0, 'Auto', '', 'SingleJob -Machine Translation Post-Editing (MTP)', '2023-01-25 23:25:12', '2023-01-25 23:26:42'),
(213, 228, '1', 'Tussitaikurit | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"0,44\",\"itemTotal\":\"044.00\",\"amtSum\":0.44}]', 0.44, 0, '1', 0, '35', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-25 23:31:00', '2023-01-18 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'PO: Lingsoft project 996081 / T-SCHNELFI-01 illust', '', '', 0.44, 'Auto', '996081', 'SingleJob -Translation (TRA)', '2023-01-25 23:31:24', '2023-01-25 23:32:08'),
(214, 229, '1', 'Shopify | English (US)-Norwegian (bokmal) 25163884', '', '', 0, 0, '9', 0, '28', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-25 23:34:00', '2023-01-20 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'Task [Comment] :: New comment :: [#25163884] Marke', '', '', 0, 'Auto', '', 'SingleJob -Machine Translation Post-Editing (MTP)', '2023-01-25 23:34:28', '2023-01-25 23:35:15'),
(215, 229, '2', 'Shopify | English (US)-Norwegian (bokmal) 25145262', '', '', 0, 0, '9', 0, '28', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-25 23:34:00', '2023-01-20 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'Task [Comment] :: New comment :: [#25145262] Marke', '', '', 0, 'Auto', '', 'SingleJob -Machine Translation Post-Editing (MTP)', '2023-01-25 23:34:28', '2023-01-25 23:35:58'),
(216, 229, '3', 'Shopify | English (US)-Norwegian (bokmal) 25184486', '', '', 0, 0, '9', 0, '28', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-25 23:34:00', '2023-01-20 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'Order :: [#25184486] Marketing Edit - NB-NO :: Loc', '', '', 0, 'Auto', '', 'SingleJob -Machine Translation Post-Editing (MTP)', '2023-01-25 23:34:28', '2023-01-25 23:36:36'),
(217, 229, '4', 'Shopify | English (US)-Norwegian (bokmal) 25184458', '', '', 0, 0, '9', 0, '28', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-25 23:34:00', '2023-01-20 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'Order :: [#25184458] Marketing Edit - NB-NO :: Loc', '', '', 0, 'Auto', '', 'SingleJob -Machine Translation Post-Editing (MTP)', '2023-01-25 23:34:28', '2023-01-25 23:37:17'),
(218, 229, '5', 'Shopify | English (US)-Norwegian (bokmal) 25212404', '', '', 0, 0, '9', 0, '28', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-25 23:34:00', '2023-01-20 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'Order :: [#25212404] Marketing Edit - NB-NO :: Loc', '', '', 0, 'Auto', '', 'SingleJob -Machine Translation Post-Editing (MTP)', '2023-01-25 23:34:28', '2023-01-25 23:38:00'),
(219, 230, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '', 0, 0, '1', 0, '24', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-25 23:47:00', '2023-01-23 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', '2023/0210/03/4 / EN-GB » NB / 1 feb email copy dra', '', '', 0, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-25 23:47:32', '2023-01-25 23:47:57'),
(220, 231, '1', 'SpellUp | English (US)-Norwegian (nynorsk)', '', '[{\"quantity\":\"6\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"40\",\"itemTotal\":\"240.00\",\"amtSum\":240}]', 240, 0, '5', 0, '35', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-25 23:49:00', '2023-01-23 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (nynorsk)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'Nynorsk grammar checker task 2 + lexicalisation', '', '', 240, 'Auto', '1248', 'SingleJob -Proofreading (PRF)', '2023-01-25 23:49:36', '2023-01-25 23:50:17'),
(221, 232, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"4\",\"pricelist\":\"Unit(s) Proofreading\",\"itemPrice\":\"2,5\",\"itemTotal\":\"10.00\",\"amtSum\":10}]', 10, 0, '5', 0, '20', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-25 23:51:00', '2023-01-23 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'STOP-281: CONTEXTUALISATION 4 SCREENSHOTS', '', '', 10, 'Auto', '', 'SingleJob -Proofreading (PRF)', '2023-01-25 23:51:53', '2023-01-25 23:52:26'),
(222, 233, '1', 'Scorewarrior | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"57\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"6.27\",\"amtSum\":6.27}]', 6.27, 15, '1', 0, '10', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-25 23:53:00', '2023-01-23 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'Vladislav Solntsev assigned a task to you in the T', '', '', 6.27, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-25 23:53:56', '2023-01-25 23:54:33'),
(223, 234, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '', 0, 0, '5', 0, '50', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-25 23:57:00', '2023-01-24 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', '672_20230116_P2_xbox', '', '', 0, 'Auto', '', 'SingleJob -Proofreading (PRF)', '2023-01-25 23:57:14', '2023-01-25 23:57:39'),
(224, 235, '1', 'PayPal | English (US)-Norwegian (bokmal) onboarding', '', '', 0, 0, '5', 0, '38', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-25 23:59:00', '2023-01-24 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'Re: PayPal LL: Start of the projectRe: PayPal LL:', '', '', 0, 'Auto', '', 'SingleJob -Proofreading (PRF)', '2023-01-25 23:59:06', '2023-01-26 00:00:17'),
(225, 236, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '', 0, 0, '5', 0, '50', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-26 00:02:00', '2023-01-24 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'PFConcept_20230118_february_product_launch.xlsx //', '', '', 0, 'Auto', '', 'SingleJob -Proofreading (PRF)', '2023-01-26 00:02:17', '2023-01-26 00:02:41'),
(226, 237, '1', 'Parker Hannifin | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"40,00\",\"itemTotal\":\"40.00\"}]', 40, 25, '5', 0, '35', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-26 00:09:00', '2023-01-25 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'PO: Lingsoft project 997285 / ParkHQ_2301_P0119', '', '', 40, 'Auto', '997285', 'SingleJob -Proofreading (PRF)', '2023-01-26 00:09:54', '2023-01-26 00:10:34'),
(227, 238, '1', 'Scorewarrior | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"354\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,11\",\"itemTotal\":\"38.94\",\"amtSum\":38.94}]', 38.94, 15, '1', 0, '10', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-26 00:11:00', '2023-01-25 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'Vladislav Solntsev assigned a task to you in the T', '', '', 38.94, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-26 00:11:52', '2023-01-26 00:12:35'),
(228, 239, '1', 'LG | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"9,84\",\"itemTotal\":\"9.84\",\"amtSum\":9.84}]', 9.84, 25, '1', 0, '35', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-26 00:14:00', '2023-01-25 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'PO: Lingsoft project 997810 / LG_l01_25', '', '', 9.84, 'Auto', '997810', 'SingleJob -Translation (TRA)', '2023-01-26 00:14:23', '2023-01-26 00:15:05'),
(229, 240, '1', 'SpellUp | English (US)-Norwegian (bokmal) NORTHL-0036', '', '', 0, 0, '1', 0, '20', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-26 00:18:00', '2023-01-20 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'R: DERIVCO - NEW ASSIGNMENT THREAD: JANUARY', '', '', 0, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-26 00:18:43', '2023-01-26 00:19:23'),
(230, 240, '2', 'SpellUp | English (US)-Norwegian (bokmal) REALD-0095', '', '', 0, 0, '1', 0, '20', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-26 00:18:00', '2023-01-20 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'R: DERIVCO - NEW ASSIGNMENT THREAD: JANUARY', '', '', 0, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-26 00:18:43', '2023-01-26 00:19:57');
INSERT INTO `tms_items` (`itemId`, `order_id`, `item_number`, `item_name`, `description`, `price`, `total_price`, `project_pricelist`, `project_type`, `tax`, `contact_person`, `manager`, `coordinator`, `heads_up`, `upcomingDate`, `start_date`, `due_date`, `q_date`, `item_language`, `source_lang`, `target_lang`, `item_status`, `item_email_subject`, `place_of_delivery`, `amount`, `total_amount`, `auto_status`, `po_number`, `attached_workflow`, `created_date`, `updated_date`) VALUES
(231, 240, '3', 'SpellUp | English (US)-Norwegian (bokmal) WB-0008', '', '', 0, 0, '1', 0, '20', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-26 00:18:00', '2023-01-20 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'R: DERIVCO - NEW ASSIGNMENT THREAD: JANUARY', '', '', 0, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-26 00:18:43', '2023-01-26 00:20:36'),
(232, 240, '4', 'SpellUp | English (US)-Norwegian (bokmal) MAHI-0092', '', '', 0, 0, '1', 0, '20', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-26 00:18:00', '2023-01-20 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'R: DERIVCO - NEW ASSIGNMENT THREAD: JANUARY', '', '', 0, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-26 00:18:43', '2023-01-26 00:21:11'),
(233, 240, '5', 'SpellUp | English (US)-Norwegian (bokmal) NORTHL-0038', '', '', 0, 0, '1', 0, '20', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-26 00:18:00', '2023-01-20 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'R: DERIVCO - NEW ASSIGNMENT THREAD: JANUARY', '', '', 0, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-26 00:18:43', '2023-01-26 00:21:48'),
(234, 241, '1', 'SpellUp | English (US)-Norwegian (bokmal) RABCAT-0023', '', '', 0, 0, '1', 0, '20', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-26 00:25:00', '2023-01-25 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'R: DERIVCO - NEW ASSIGNMENT THREAD: JANUARY', '', '', 0, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-26 00:25:16', '2023-01-26 00:25:49'),
(235, 241, '2', 'SpellUp | English (US)-Norwegian (bokmal) GPORT-0163', '', '', 0, 0, '1', 0, '20', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-26 00:25:00', '2023-01-25 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'R: DERIVCO - NEW ASSIGNMENT THREAD: JANUARY', '', '', 0, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-26 00:25:16', '2023-01-26 00:26:21'),
(236, 242, '1', 'Shopify | English (US)-Norwegian (bokmal) 25245080', '', '', 0, 0, '9', 0, '28', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-26 00:27:00', '2023-01-25 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'Order :: [#25245080] Marketing Edit - NB-NO :: Loc', '', '', 0, 'Auto', '', 'SingleJob -Machine Translation Post-Editing (MTP)', '2023-01-26 00:27:51', '2023-01-26 00:28:24'),
(237, 242, '2', 'Shopify | English (US)-Norwegian (bokmal) 25228367', '', '', 0, 0, '9', 0, '28', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-26 00:27:00', '2023-01-25 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'Order :: [#25228367] Marketing Edit - NB-NO :: Loc', '', '', 0, 'Auto', '', 'SingleJob -Machine Translation Post-Editing (MTP)', '2023-01-26 00:27:51', '2023-01-26 00:28:57'),
(238, 243, '1', 'Google | English (US)-Norwegian (bokmal) 3201651', '', '', 0, 0, '9', 0, '28', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-26 00:30:00', '2023-01-25 20:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'SOW | Google Inc. | Apps and Others | 3201651 | gk', '', '', 0, 'Auto', '', 'SingleJob -Machine Translation Post-Editing (MTP)', '2023-01-26 00:30:17', '2023-01-26 00:30:45'),
(239, 243, '2', 'Google | English (US)-Norwegian (bokmal) 3202119', '', '', 0, 0, '9', 0, '28', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-26 00:30:00', '2023-01-25 20:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'SOW | Google Inc. | Apps and Others | 3202119 | gk', '', '', 0, 'Auto', '', 'SingleJob -Machine Translation Post-Editing (MTP)', '2023-01-26 00:30:17', '2023-01-26 00:31:17'),
(240, 244, '1', 'Cartier | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"5\",\"itemTotal\":\"5.00\",\"amtSum\":5}]', 5, 0, '1', 0, '21', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-26 00:40:00', '2023-01-20 20:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'Datawords / Cartier / Social Media Translation / P', '', '', 5, 'Auto', 'PO-DWFR-2023-01670', 'SingleJob -Translation (TRA)', '2023-01-26 00:40:20', '2023-01-26 00:43:00'),
(241, 245, '1', 'SpellUp | English (US)-Norwegian (bokmal)', '', '', 0, 0, '5', 0, '50', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-29 23:22:00', '2023-01-25 18:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', '673_20230119_xbox', '', '', 0, 'Auto', '', 'SingleJob -Proofreading (PRF)', '2023-01-29 23:22:22', '2023-01-29 23:22:54'),
(242, 246, '1', 'SpellUp | English (US)-Norwegian (bokmal) 1)	STOP-821', '', '', 0, 0, '1', 0, '20', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-29 23:24:00', '2023-01-25 18:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'JOBS IN JIRA: STOP-821/STOP-857/STOP-903/STOP-880', '', '', 0, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-29 23:24:51', '2023-01-29 23:25:35'),
(243, 246, '2', 'SpellUp | English (US)-Norwegian (bokmal) 2)	STOP-857', '', '', 0, 0, '1', 0, '20', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-29 23:24:00', '2023-01-25 18:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'JOBS IN JIRA: STOP-821/STOP-857/STOP-903/STOP-880', '', '', 0, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-29 23:24:51', '2023-01-29 23:26:13'),
(244, 246, '3', 'SpellUp | English (US)-Norwegian (bokmal) 3)	STOP-903', '', '', 0, 0, '1', 0, '20', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-29 23:24:00', '2023-01-25 18:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'JOBS IN JIRA: STOP-821/STOP-857/STOP-903/STOP-880', '', '', 0, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-29 23:24:51', '2023-01-29 23:26:50'),
(245, 246, '4', 'SpellUp | English (US)-Norwegian (bokmal) 4)	STOP-880', '', '', 0, 0, '1', 0, '20', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-29 23:24:00', '2023-01-25 18:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'JOBS IN JIRA: STOP-821/STOP-857/STOP-903/STOP-880', '', '', 0, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-01-29 23:24:51', '2023-01-29 23:27:23'),
(246, 247, '1', 'Google | English (US)-Norwegian (bokmal) 3201843', '', '', 0, 0, '9', 0, '28', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-29 23:29:00', '2023-01-25 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'SOW | Google Inc. | Apps and Others | 3201843 | gk', '', '', 0, 'Auto', '', 'SingleJob -Machine Translation Post-Editing (MTP)', '2023-01-29 23:29:56', '2023-01-29 23:30:52'),
(247, 247, '2', 'Google | English (US)-Norwegian (bokmal) 3201540', '', '', 0, 0, '9', 0, '28', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-29 23:29:00', '2023-01-25 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'SOW | Google Inc. | Apps and Others | 3201540 | gk', '', '', 0, 'Auto', '', 'SingleJob -Machine Translation Post-Editing (MTP)', '2023-01-29 23:29:56', '2023-01-29 23:31:33'),
(248, 247, '3', 'Google | English (US)-Norwegian (bokmal) 3201686', '', '', 0, 0, '9', 0, '28', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-29 23:29:00', '2023-01-25 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'SOW | Google Inc. | Apps and Others | 3201686 | gk', '', '', 0, 'Auto', '', 'SingleJob -Machine Translation Post-Editing (MTP)', '2023-01-29 23:29:56', '2023-01-29 23:32:10'),
(249, 247, '4', 'Google | English (US)-Norwegian (bokmal) 3201868', '', '', 0, 0, '9', 0, '28', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-29 23:29:00', '2023-01-25 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'SOW | Google Inc. | Apps and Others | 3201868 | gk', '', '', 0, 'Auto', '', 'SingleJob -Machine Translation Post-Editing (MTP)', '2023-01-29 23:29:56', '2023-01-29 23:32:46'),
(250, 248, '1', 'Shopify | English (US)-Norwegian (bokmal) 25258416', '', '', 0, 0, '5', 0, '28', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-29 23:37:00', '2023-01-26 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'Order :: [#25258416] Marketing Edit - NB-NO :: Loc', '', '', 0, 'Auto', '', 'SingleJob -Proofreading (PRF)', '2023-01-29 23:37:13', '2023-01-29 23:37:51'),
(251, 248, '2', 'Shopify | English (US)-Norwegian (bokmal) 25258356', '', '', 0, 0, '5', 0, '28', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-29 23:37:00', '2023-01-26 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'Order :: [#25258356] Marketing Edit - NB-NO :: Loc', '', '', 0, 'Auto', '', 'SingleJob -Proofreading (PRF)', '2023-01-29 23:37:13', '2023-01-29 23:38:28'),
(252, 248, '3', 'Shopify | English (US)-Norwegian (bokmal) 25262306', '', '', 0, 0, '5', 0, '28', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-29 23:37:00', '2023-01-26 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'Order :: [#25262306] Marketing Edit - NB-NO :: Loc', '', '', 0, 'Auto', '', 'SingleJob -Proofreading (PRF)', '2023-01-29 23:37:13', '2023-01-29 23:39:07'),
(253, 248, '4', 'Shopify | English (US)-Norwegian (bokmal) 25277117', '', '', 0, 0, '5', 0, '28', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-29 23:37:00', '2023-01-26 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'Order :: [#25277117] Marketing Edit - NB-NO :: Loc', '', '', 0, 'Auto', '', 'SingleJob -Proofreading (PRF)', '2023-01-29 23:37:13', '2023-01-29 23:39:48'),
(254, 249, '1', 'Foreo | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"108,5\",\"itemTotal\":\"108.5\",\"amtSum\":108.5}]', 108.5, 0, '1', 0, '53', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-29 23:45:00', '2023-01-26 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'New LingoSpell assignment with project code O-1096', '', '', 108.5, 'Auto', 'O-10965-TRA-016', 'SingleJob -Translation (TRA)', '2023-01-29 23:45:04', '2023-01-29 23:45:45'),
(255, 250, '1', 'Shopify | English (US)-Norwegian (bokmal)', '', '', 0, 0, '5', 0, '28', '7', '14', 0, '0000-00-00 00:00:00', '2023-01-29 23:47:00', '2023-01-27 19:00:00', '01-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned,3', 'Order :: [#25280986] Marketing Edit - NB-NO :: Loc', '', '', 0, 'Auto', '', 'SingleJob -Proofreading (PRF)', '2023-01-29 23:47:18', '2023-01-29 23:47:41');

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
(1, 'Assign', 1, '2016-01-06 16:24:22', '2016-01-06 16:24:22'),
(2, 'Ongoing', 1, '2016-01-06 16:24:29', '2016-01-06 16:24:29'),
(3, 'Delivery', 1, '2016-01-20 15:04:03', '2016-01-20 15:04:03'),
(4, 'Completed', 1, '2016-01-20 15:04:07', '2016-01-20 15:04:07'),
(5, 'Approved', 1, '2016-01-20 15:04:12', '2016-01-20 15:04:12'),
(6, 'Invoiced', 1, '2016-01-20 15:04:19', '2016-01-20 15:04:19'),
(7, 'Paid', 1, '2016-01-20 15:04:24', '2016-01-20 15:04:24'),
(8, 'Non-payable', 1, '2016-01-20 15:04:30', '2016-01-20 15:04:30'),
(9, 'Cancelled', 1, '2016-01-20 15:04:34', '2016-01-20 15:04:34'),
(10, 'QA Ready', 1, '2016-01-20 15:04:34', '2016-01-20 15:04:34'),
(11, 'Overdue', 1, '2023-01-18 15:01:39', '2023-01-18 15:02:00');

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
-- Table structure for table `tms_job_status`
--

CREATE TABLE `tms_job_status` (
  `jb_status_id` int(11) NOT NULL,
  `job_status_name` varchar(255) NOT NULL,
  `status_color` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `default_added` tinyint(1) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_job_status`
--

INSERT INTO `tms_job_status` (`jb_status_id`, `job_status_name`, `status_color`, `is_active`, `is_default`, `default_added`, `created_date`, `modified_date`) VALUES
(1, 'In preparation', '', 1, 0, 0, '2022-12-20 00:00:00', '2022-12-20 00:00:00'),
(2, 'Requested', '', 1, 0, 0, '2022-12-20 00:00:00', '2022-12-20 00:00:00'),
(3, 'Assigned-waiting', '', 1, 0, 0, '2022-12-20 00:00:00', '2022-12-20 00:00:00'),
(4, 'In-progress', '', 1, 0, 0, '2022-12-20 00:00:00', '2022-12-20 00:00:00'),
(5, 'Overdue', '', 1, 0, 0, '2022-12-20 00:00:00', '2022-12-20 00:00:00'),
(6, 'Delivered', '', 1, 0, 0, '2022-12-20 00:00:00', '2022-12-20 00:00:00'),
(7, 'Approved', '', 1, 0, 0, '2022-12-20 00:00:00', '2022-12-20 00:00:00'),
(8, 'Invoice Accepted', '', 1, 0, 0, '2022-12-20 00:00:00', '2022-12-20 00:00:00'),
(9, 'Paid', '', 1, 0, 0, '2022-12-20 00:00:00', '2022-12-20 00:00:00'),
(10, 'Canceled', '', 1, 0, 0, '2022-12-20 00:00:00', '2022-12-20 00:00:00'),
(11, 'Without invoice', '', 1, 0, 0, '2022-12-20 00:00:00', '2022-12-20 00:00:00'),
(12, 'Pending', '', 1, 0, 0, '2022-12-20 00:00:00', '2022-12-20 00:00:00'),
(13, 'New', '', 1, 1, 0, '2022-12-20 00:00:00', '2022-12-20 00:00:00'),
(14, 'Ready to be Delivered', '', 1, 0, 0, '2022-12-20 00:00:00', '2022-12-20 00:00:00'),
(15, 'Completed', '', 1, 0, 0, '2022-12-20 00:00:00', '2022-12-20 00:00:00');

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
(5, 1, 0, 'TMS Admin', 'update', 'internal_res', 1, '2022-11-01 10:04:49', '2023-01-02 19:11:14'),
(6, 2, 0, 'Anil Nadiya', 'add', 'internal_res', 1, '2022-11-01 12:40:07', '2022-11-01 12:40:07'),
(7, 2, 0, 'Anil Nadiya', 'update', 'internal_res', 1, '2022-11-01 12:41:23', '2023-01-03 19:24:01'),
(8, 3, 0, 'QA Kanhasoft', 'add', 'internal_res', 1, '2022-11-01 12:50:43', '2022-11-01 12:50:43'),
(9, 4, 0, 'Linguist Kanhasoft', 'add', 'external_res', 1, '2022-11-01 12:57:31', '2022-11-01 12:57:31'),
(10, 4, 0, 'Kanhasoft', 'add', 'direct_cli', 1, '2022-11-01 13:03:57', '2022-11-01 13:03:57'),
(11, 4, 0, 'Kanhasoft Test Client', 'update', 'direct_cli', 1, '2022-11-01 13:05:02', '2022-12-27 18:33:35'),
(12, 1, 0, 'Acc Kanhasoft', 'add', 'indirect_cli', 1, '2022-11-01 13:17:59', '2022-11-01 13:17:59'),
(13, 4, 0, 'Linguist Kanhasoft', 'update', 'external_res', 1, '2022-11-01 13:22:19', '2023-01-05 15:38:42'),
(14, 3, 0, 'KNH160001', 'add', 'project', 1, '2022-11-01 14:18:01', '2022-11-01 14:18:01'),
(15, 3, 0, 'KNH160001', 'update', 'project', 1, '2022-11-01 14:18:58', '2023-01-02 19:14:12'),
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
(43, 27, 0, 'SPE220003', 'update', 'project', 1, '2022-11-03 22:00:58', '2022-12-26 17:40:32'),
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
(90, 3, 0, 'QA Kanhasoft', 'update', 'internal_res', 1, '2022-11-09 11:19:28', '2023-01-03 19:13:02'),
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
(117, 9, 0, '', 'create', 'direct_cli', 7, '2022-11-11 16:16:15', '2023-01-13 13:58:27'),
(118, 7, 0, 'Scorewarrior', 'add', 'indirect_cli', 7, '2022-11-11 16:21:37', '2022-11-11 16:21:37'),
(119, 55, 0, 'SPEU_0001', 'add', 'project', 7, '2022-11-11 16:23:15', '2022-11-11 16:23:15'),
(120, 55, 0, 'SPEU_0001', 'update', 'project', 7, '2022-11-11 16:35:00', '2022-12-26 17:09:00'),
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
(139, 11, 0, 'Intrawelt', 'update', 'direct_cli', 1, '2022-11-16 16:59:44', '2022-12-15 10:15:02'),
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
(151, 9, 0, 'Scorewarrior Limited', 'update', 'direct_cli', 1, '2022-11-17 14:55:14', '2022-12-20 12:07:01'),
(152, 66, 0, 'KNH160013', 'update', 'project', 1, '2022-11-17 21:17:14', '2022-11-17 22:10:47'),
(153, 66, 42, 'KNH160013_TRA002', 'update', 'task', 1, '2022-11-17 22:12:26', '2022-11-17 22:15:37'),
(154, 4, 0, '', 'create', 'direct_cli', 7, '2022-11-17 23:41:56', '2022-11-17 23:41:56'),
(155, 12, 0, 'Ingvild Test Client', 'add', 'direct_cli', 7, '2022-11-18 00:12:21', '2022-11-18 00:12:21'),
(156, 12, 0, 'Ingvild Test Client', 'update', 'direct_cli', 7, '2022-11-18 00:16:00', '2022-11-18 00:32:35'),
(157, 12, 0, '', 'create', 'direct_cli', 7, '2022-11-18 00:31:25', '2022-11-18 00:32:17'),
(158, 72, 0, 'SPE_0003', 'add', 'project', 7, '2022-11-18 00:52:04', '2022-11-18 00:52:04'),
(159, 72, 0, 'SPE_0003', 'update', 'project', 7, '2022-11-18 00:57:53', '2022-12-26 18:07:47'),
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
(173, 72, 0, 'SPE_0003', 'update', 'project', 1, '2022-11-21 12:00:18', '2022-12-21 15:28:47'),
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
(349, 129, 93, 'SPE_0013_TRA001', 'update', 'task', 14, '2022-12-12 18:04:30', '2022-12-12 18:04:30'),
(350, 14, 0, 'Solveig T. Sandaas', 'update', 'internal_res', 14, '2022-12-12 20:21:53', '2022-12-12 20:21:53'),
(351, 3, 0, 'KNH160001', 'update', 'project', 14, '2022-12-13 19:16:29', '2022-12-13 19:16:29'),
(352, 56, 0, '', 'update', 'project', 14, '2022-12-13 19:18:43', '2022-12-13 19:19:04'),
(353, 72, 0, 'SPE_0003', 'update', 'project', 14, '2022-12-13 19:27:35', '2022-12-13 19:27:35'),
(354, 72, 95, 'SPE_0003_TRA002', 'update', 'task', 14, '2022-12-13 19:27:54', '2022-12-13 19:29:02'),
(355, 21, 0, 'Test Testeseb', 'add', 'external_res', 14, '2022-12-13 19:34:03', '2022-12-13 19:34:03'),
(356, 21, 0, 'Test Testeseb', 'update', 'external_res', 14, '2022-12-13 19:39:48', '2022-12-13 19:39:48'),
(357, 19, 0, 'MSS Cape Town The Language Agency', 'add', 'direct_cli', 14, '2022-12-15 23:34:18', '2022-12-15 23:34:18'),
(358, 19, 0, 'MSS Cape Town The Language Agency', 'update', 'direct_cli', 14, '2022-12-15 23:34:49', '2022-12-15 23:34:49'),
(359, 20, 0, 'Resorba', 'add', 'indirect_cli', 14, '2022-12-15 23:37:07', '2022-12-15 23:37:07'),
(360, 132, 0, 'SPEU_0008', 'add', 'project', 14, '2022-12-15 23:38:21', '2022-12-15 23:38:21'),
(361, 132, 0, 'SPEU_0008', 'update', 'project', 14, '2022-12-15 23:39:10', '2022-12-15 23:40:41'),
(362, 132, 96, 'SPEU_0008_TRA001', 'update', 'task', 14, '2022-12-15 23:41:02', '2022-12-15 23:41:02'),
(363, 133, 0, 'SPE_0014', 'add', 'project', 14, '2022-12-15 23:42:41', '2022-12-15 23:42:41'),
(364, 133, 0, 'SPE_0014', 'update', 'project', 14, '2022-12-15 23:45:07', '2022-12-15 23:46:41'),
(365, 133, 97, 'SPE_0014_PRF001', 'update', 'task', 14, '2022-12-15 23:45:26', '2022-12-15 23:45:26'),
(366, 21, 0, 'Shopify', 'add', 'indirect_cli', 14, '2022-12-15 23:53:23', '2022-12-15 23:53:23'),
(367, 22, 0, 'Derivco', 'add', 'indirect_cli', 14, '2022-12-15 23:54:55', '2022-12-15 23:54:55'),
(368, 134, 0, 'SPE_0015', 'add', 'project', 14, '2022-12-15 23:56:21', '2022-12-15 23:56:21'),
(369, 134, 0, 'SPE_0015', 'update', 'project', 14, '2022-12-15 23:57:03', '2022-12-15 23:59:58'),
(370, 134, 98, 'SPE_0015_TRA001', 'update', 'task', 14, '2022-12-15 23:57:22', '2022-12-15 23:57:22'),
(371, 117, 0, 'SPE_0009', 'update', 'project', 7, '2022-12-16 00:01:11', '2022-12-16 00:01:27'),
(372, 20, 0, 'GTH Translation', 'add', 'direct_cli', 14, '2022-12-16 00:10:25', '2022-12-16 00:10:25'),
(373, 20, 0, 'GTH Translation', 'update', 'direct_cli', 14, '2022-12-16 00:11:13', '2022-12-16 00:11:13'),
(374, 20, 0, '', 'create', 'direct_cli', 14, '2022-12-16 00:13:21', '2022-12-16 00:13:21'),
(375, 135, 0, 'SPEU_0009', 'add', 'project', 14, '2022-12-16 00:14:10', '2022-12-16 00:14:10'),
(376, 135, 0, 'SPEU_0009', 'update', 'project', 14, '2022-12-16 00:14:50', '2022-12-16 13:48:00'),
(377, 135, 99, 'SPEU_0009_PRF001', 'update', 'task', 14, '2022-12-16 00:15:07', '2022-12-16 13:48:44'),
(378, 136, 0, 'SPEU_0010', 'add', 'project', 14, '2022-12-16 00:17:49', '2022-12-16 00:17:49'),
(379, 136, 0, 'SPEU_0010', 'update', 'project', 14, '2022-12-16 00:18:59', '2022-12-16 00:18:59'),
(380, 136, 100, 'SPEU_0010_PRF001', 'update', 'task', 14, '2022-12-16 00:20:14', '2022-12-16 00:20:14'),
(381, 21, 0, 'RWS Moravia', 'add', 'direct_cli', 14, '2022-12-16 00:23:00', '2022-12-16 00:23:00'),
(382, 21, 0, 'RWS Moravia', 'update', 'direct_cli', 14, '2022-12-16 00:23:27', '2022-12-16 00:23:27'),
(383, 137, 0, 'SPEU_0011', 'add', 'project', 14, '2022-12-16 00:24:49', '2022-12-16 00:24:49'),
(384, 137, 0, 'SPEU_0011', 'update', 'project', 14, '2022-12-16 00:25:41', '2022-12-16 00:26:18'),
(385, 137, 101, 'SPEU_0011_PRF001', 'update', 'task', 14, '2022-12-16 00:26:09', '2022-12-16 00:26:09'),
(386, 138, 0, 'SPE_0016', 'add', 'project', 14, '2022-12-16 00:39:49', '2022-12-16 00:39:49'),
(387, 138, 0, 'SPE_0016', 'update', 'project', 14, '2022-12-16 00:42:30', '2022-12-16 00:42:44'),
(388, 138, 102, 'SPE_0016_TRA001', 'update', 'task', 14, '2022-12-16 00:43:05', '2022-12-16 00:43:05'),
(389, 14, 0, 'Lingsoft', 'update', 'direct_cli', 14, '2022-12-16 13:50:49', '2022-12-16 13:50:49'),
(390, 140, 0, 'SPE_0017', 'add', 'project', 14, '2022-12-16 13:51:45', '2022-12-16 13:51:45'),
(391, 140, 0, 'SPE_0017', 'update', 'project', 14, '2022-12-16 13:52:40', '2022-12-16 13:52:44'),
(392, 140, 103, 'SPE_0017_PRF001', 'update', 'task', 14, '2022-12-16 13:53:11', '2022-12-16 13:53:11'),
(393, 19, 0, 'Romeo Kanhasoft', 'delete', 'external_res', 1, '2022-12-22 17:01:50', '2022-12-22 17:01:50'),
(394, 20, 0, 'Test Account', 'update', 'external_res', 1, '2022-12-22 19:29:26', '2022-12-22 19:29:47'),
(395, 55, 0, 'SPEU_0001', 'update', 'project', 1, '2022-12-23 18:56:40', '2023-01-30 10:57:01'),
(396, 25, 0, 'SPE220002', 'update', 'project', 7, '2022-12-26 16:50:02', '2022-12-26 16:50:02'),
(397, 27, 0, 'SPE220003', 'update', 'project', 7, '2022-12-26 16:56:01', '2022-12-26 16:57:50'),
(398, 29, 0, 'SPE220004', 'update', 'project', 7, '2022-12-26 16:56:39', '2022-12-26 16:57:05'),
(399, 38, 0, 'SPE220008', 'update', 'project', 7, '2022-12-26 16:59:15', '2022-12-26 16:59:26'),
(400, 49, 0, 'SPE220010', 'update', 'project', 7, '2022-12-26 17:11:57', '2022-12-26 17:11:57'),
(401, 63, 0, 'SPE_0002', 'update', 'project', 7, '2022-12-26 17:16:54', '2022-12-26 17:16:54'),
(402, 86, 0, 'SPE_0004', 'update', 'project', 7, '2022-12-26 17:19:31', '2022-12-26 17:19:31'),
(403, 94, 0, 'SPE_0010', 'update', 'project', 7, '2022-12-26 17:21:13', '2022-12-26 17:21:13'),
(404, 114, 0, 'SPE_0007', 'update', 'project', 7, '2022-12-26 17:25:54', '2022-12-26 17:25:54'),
(405, 59, 0, 'SPE220013', 'update', 'project', 7, '2022-12-26 17:27:22', '2023-01-05 17:00:17'),
(406, 61, 0, 'SPE220014', 'update', 'project', 7, '2022-12-26 17:28:27', '2022-12-26 17:28:27'),
(407, 62, 0, 'SPE_0001', 'update', 'project', 7, '2022-12-26 17:30:03', '2022-12-26 17:30:03'),
(408, 84, 0, 'SPE_0002', 'update', 'project', 7, '2022-12-26 17:33:40', '2022-12-26 17:33:40'),
(409, 83, 0, 'SPE_0001', 'update', 'project', 7, '2022-12-26 17:36:16', '2022-12-26 17:36:16'),
(410, 89, 0, 'SPE_0006', 'update', 'project', 7, '2022-12-26 17:38:35', '2022-12-26 17:38:35'),
(411, 91, 0, 'SPE_0007', 'update', 'project', 7, '2022-12-26 17:39:32', '2022-12-26 17:39:32'),
(412, 92, 0, 'SPE_0008', 'update', 'project', 7, '2022-12-26 17:40:42', '2022-12-26 17:40:42'),
(413, 116, 0, 'SPE_0008', 'update', 'project', 7, '2022-12-26 17:41:35', '2022-12-26 17:41:35'),
(414, 111, 0, 'SPEU_0002', 'update', 'project', 7, '2022-12-26 17:43:23', '2022-12-26 17:43:23'),
(415, 118, 0, 'SPEU_0005', 'update', 'project', 7, '2022-12-26 17:44:34', '2022-12-26 17:44:34'),
(416, 132, 0, 'SPEU_0008', 'update', 'project', 7, '2022-12-26 17:45:58', '2022-12-26 17:45:58'),
(417, 113, 0, 'SPEU_0004', 'update', 'project', 7, '2022-12-26 17:46:53', '2022-12-26 17:46:53'),
(418, 120, 0, 'SPEU_0006', 'update', 'project', 7, '2022-12-26 17:47:55', '2022-12-26 17:47:55'),
(419, 125, 0, 'SPE_0010', 'update', 'project', 7, '2022-12-26 17:48:45', '2022-12-26 17:48:45'),
(420, 128, 0, 'SPEU_0007', 'update', 'project', 7, '2022-12-26 17:49:43', '2022-12-26 17:49:50'),
(421, 126, 0, 'SPE_0011', 'update', 'project', 7, '2022-12-26 17:55:51', '2022-12-26 17:58:38'),
(422, 127, 0, 'SPE_0012', 'update', 'project', 7, '2022-12-26 17:56:36', '2022-12-26 17:59:48'),
(423, 129, 0, 'SPE_0013', 'update', 'project', 7, '2022-12-26 18:02:05', '2022-12-26 18:02:05'),
(424, 137, 0, 'SPEU_0011', 'update', 'project', 7, '2022-12-26 18:06:12', '2022-12-26 18:06:12'),
(425, 33, 0, 'SPE220006', 'update', 'project', 7, '2022-12-26 18:14:36', '2023-01-05 16:23:51'),
(426, 31, 0, 'SPE220005', 'update', 'project', 7, '2022-12-26 18:15:10', '2022-12-26 18:15:10'),
(427, 64, 0, 'SPE220015', 'update', 'project', 7, '2022-12-26 18:16:02', '2022-12-26 18:16:02'),
(428, 97, 0, 'SPE220019', 'update', 'project', 7, '2022-12-26 18:16:42', '2022-12-26 18:16:42'),
(429, 76, 0, 'SPE220017', 'update', 'project', 7, '2022-12-26 18:17:23', '2022-12-26 18:17:23'),
(430, 101, 0, 'SPE220022', 'update', 'project', 7, '2022-12-26 18:18:23', '2022-12-26 18:18:23'),
(431, 102, 0, 'SPE220023', 'update', 'project', 7, '2022-12-26 18:18:58', '2022-12-26 18:18:58'),
(432, 107, 0, 'SPE220026', 'update', 'project', 7, '2022-12-26 18:19:33', '2022-12-26 18:19:33'),
(433, 108, 0, 'SPE220027', 'update', 'project', 7, '2022-12-26 18:20:07', '2022-12-26 18:20:07'),
(434, 109, 0, 'SPE220028', 'update', 'project', 7, '2022-12-26 18:20:36', '2022-12-26 18:20:36'),
(435, 37, 0, 'SPE220007', 'update', 'project', 7, '2022-12-26 18:22:33', '2023-01-05 16:18:24'),
(436, 88, 0, 'SPE_0003', 'update', 'project', 7, '2022-12-26 19:02:40', '2022-12-26 19:02:40'),
(437, 95, 0, 'SPE_0004', 'update', 'project', 7, '2022-12-26 19:03:27', '2022-12-26 19:03:34'),
(438, 106, 0, 'SPE_0005', 'update', 'project', 7, '2022-12-26 19:04:11', '2022-12-26 19:04:11'),
(439, 87, 0, 'SPE_0005', 'update', 'project', 7, '2022-12-26 19:08:00', '2022-12-26 19:08:00'),
(440, 140, 0, 'SPE_0017', 'update', 'project', 7, '2022-12-26 19:09:03', '2022-12-27 14:22:25'),
(441, 96, 0, 'SPE220018', 'update', 'project', 7, '2022-12-26 19:16:32', '2022-12-26 19:16:32'),
(442, 104, 0, 'SPE220024', 'update', 'project', 7, '2022-12-26 19:17:30', '2022-12-26 19:17:49'),
(443, 105, 0, 'SPE220025', 'update', 'project', 7, '2022-12-26 19:18:21', '2022-12-26 19:18:21'),
(444, 74, 0, 'SPE220016', 'update', 'project', 7, '2022-12-26 19:19:37', '2022-12-26 19:19:37'),
(445, 99, 0, 'SPE220021', 'update', 'project', 7, '2022-12-26 19:20:22', '2022-12-26 19:20:22'),
(446, 23, 0, 'Cartier', 'add', 'indirect_cli', 7, '2022-12-26 19:33:51', '2022-12-26 19:33:51'),
(447, 142, 0, 'SPEU_0012', 'add', 'project', 7, '2022-12-26 19:34:32', '2022-12-26 19:34:32'),
(448, 143, 0, 'SPEU_0013', 'add', 'project', 7, '2022-12-26 19:37:38', '2022-12-26 19:37:38'),
(449, 143, 0, 'SPEU_0013', 'update', 'project', 7, '2022-12-26 19:40:18', '2023-01-03 17:30:43'),
(450, 142, 0, 'SPEU_0012', 'update', 'project', 7, '2022-12-26 19:42:15', '2023-01-03 17:29:59'),
(451, 24, 0, 'Kiko Cosmetics', 'add', 'indirect_cli', 7, '2022-12-26 19:43:38', '2022-12-26 19:43:38'),
(452, 144, 0, 'SPEU_0014', 'add', 'project', 7, '2022-12-26 19:44:19', '2022-12-26 19:44:19'),
(453, 144, 0, 'SPEU_0014', 'update', 'project', 7, '2022-12-26 19:45:11', '2022-12-27 14:10:15'),
(454, 145, 0, 'SPEU_0015', 'add', 'project', 7, '2022-12-26 19:52:14', '2022-12-26 19:52:14'),
(455, 145, 0, 'SPEU_0015', 'update', 'project', 7, '2022-12-26 19:53:34', '2022-12-26 19:53:41'),
(456, 46, 0, 'SPE220009', 'update', 'project', 7, '2022-12-26 19:57:12', '2022-12-26 19:57:12'),
(457, 51, 0, 'SPE220011', 'update', 'project', 7, '2022-12-26 19:57:41', '2022-12-26 19:57:41'),
(458, 98, 0, 'SPE220020', 'update', 'project', 7, '2022-12-26 19:58:23', '2022-12-26 19:58:29'),
(459, 22, 0, 'Mars Translation', 'add', 'direct_cli', 7, '2022-12-26 20:24:54', '2022-12-26 20:24:54'),
(460, 22, 0, 'Mars Translation', 'update', 'direct_cli', 7, '2022-12-26 20:25:24', '2022-12-26 20:25:24'),
(461, 22, 0, '', 'create', 'direct_cli', 7, '2022-12-26 20:29:26', '2022-12-26 20:29:26'),
(462, 146, 0, 'SPEU_0016', 'add', 'project', 7, '2022-12-26 20:31:17', '2022-12-26 20:31:17'),
(463, 146, 0, 'SPEU_0016', 'update', 'project', 7, '2022-12-26 20:32:15', '2022-12-26 20:33:29'),
(464, 12, 0, 'Ingvild Test Client', 'delete', 'direct_cli', 7, '2022-12-26 20:36:13', '2022-12-26 20:36:13'),
(465, 23, 0, 'GSL Shenzhen (Glodom Language Solutions)', 'add', 'direct_cli', 7, '2022-12-26 20:39:52', '2022-12-26 20:39:52'),
(466, 23, 0, 'GSL Shenzhen (Glodom Language Solutions)', 'update', 'direct_cli', 7, '2022-12-26 20:40:32', '2023-01-13 14:51:03'),
(467, 25, 0, 'Fujifilm', 'add', 'indirect_cli', 7, '2022-12-26 20:47:31', '2022-12-26 20:47:31'),
(468, 149, 0, 'SPEU_0017', 'add', 'project', 7, '2022-12-26 20:48:07', '2022-12-26 20:48:07'),
(469, 149, 0, 'SPEU_0017', 'update', 'project', 7, '2022-12-26 20:48:15', '2022-12-27 14:18:31'),
(470, 134, 0, 'SPE_0015', 'update', 'project', 7, '2022-12-27 13:57:52', '2023-01-03 18:38:34'),
(471, 150, 0, 'SPE_0018', 'add', 'project', 7, '2022-12-27 14:01:11', '2022-12-27 14:01:11'),
(472, 150, 0, 'SPE_0018', 'update', 'project', 7, '2022-12-27 14:02:04', '2022-12-27 14:03:13'),
(473, 5, 0, 'ICS Translate', 'update', 'direct_cli', 7, '2022-12-27 14:02:53', '2022-12-27 14:02:53'),
(474, 112, 0, 'SPEU_0003', 'update', 'project', 7, '2022-12-27 14:09:11', '2022-12-27 14:09:11'),
(475, 26, 0, 'XGIMI', 'add', 'indirect_cli', 7, '2022-12-27 14:13:21', '2022-12-27 14:13:21'),
(476, 151, 0, 'SPEU_0018', 'add', 'project', 7, '2022-12-27 14:13:47', '2022-12-27 14:13:47'),
(477, 151, 0, 'SPEU_0018', 'update', 'project', 7, '2022-12-27 14:13:54', '2022-12-27 14:16:16'),
(478, 152, 0, 'SPE_0019', 'add', 'project', 7, '2022-12-27 14:20:47', '2022-12-27 14:20:47'),
(479, 152, 0, 'SPE_0019', 'update', 'project', 7, '2022-12-27 14:21:35', '2022-12-27 14:21:39'),
(480, 153, 0, 'SPEU_0019', 'add', 'project', 7, '2022-12-27 14:34:08', '2022-12-27 14:34:08'),
(481, 153, 0, 'SPEU_0019', 'update', 'project', 7, '2022-12-27 14:34:51', '2022-12-27 14:35:30'),
(482, 154, 0, 'SPEU_0020', 'add', 'project', 7, '2022-12-27 14:37:20', '2022-12-27 14:37:20'),
(483, 154, 0, 'SPEU_0020', 'update', 'project', 7, '2022-12-27 14:37:47', '2022-12-27 14:38:12'),
(484, 136, 0, 'SPEU_0010', 'update', 'project', 1, '2022-12-29 12:14:28', '2022-12-29 12:14:28'),
(485, 155, 0, 'SPE_0020', 'add', 'project', 1, '2022-12-29 12:21:40', '2022-12-29 12:21:40'),
(486, 155, 0, 'SPE_0020', 'update', 'project', 1, '2022-12-29 12:22:30', '2022-12-29 12:25:31'),
(487, 155, 117, 'SPE_0020_TRA001', 'delete', 'task', 1, '2022-12-29 12:31:25', '2022-12-29 12:31:25'),
(488, 155, 118, 'SPE_0020_PRF002', 'delete', 'task', 1, '2022-12-29 12:31:30', '2022-12-29 12:31:30'),
(489, 27, 0, 'Clarins', 'add', 'indirect_cli', 7, '2023-01-03 17:24:38', '2023-01-03 17:24:38'),
(490, 156, 0, 'SPEU_0021', 'add', 'project', 7, '2023-01-03 17:25:12', '2023-01-03 17:25:12'),
(491, 156, 0, 'SPEU_0021', 'update', 'project', 7, '2023-01-03 17:25:21', '2023-01-03 17:33:11'),
(492, 157, 0, 'SPEU_0022', 'add', 'project', 7, '2023-01-03 17:27:48', '2023-01-03 17:27:48'),
(493, 157, 0, 'SPEU_0022', 'update', 'project', 7, '2023-01-03 17:28:27', '2023-01-03 17:28:45'),
(494, 24, 0, 'Attached - Language Intelligence', 'add', 'direct_cli', 7, '2023-01-03 17:36:00', '2023-01-03 17:36:00'),
(495, 24, 0, 'Attached - Language Intelligence', 'update', 'direct_cli', 7, '2023-01-03 17:36:22', '2023-01-13 14:20:40'),
(496, 28, 0, 'Norwegian Air', 'add', 'indirect_cli', 7, '2023-01-03 17:38:45', '2023-01-03 17:38:45'),
(497, 158, 0, 'SPEU_0023', 'add', 'project', 7, '2023-01-03 17:39:21', '2023-01-03 17:39:21'),
(498, 158, 0, 'SPEU_0023', 'update', 'project', 7, '2023-01-03 17:40:29', '2023-01-03 17:40:41'),
(499, 159, 0, 'SPEU_0024', 'add', 'project', 7, '2023-01-03 17:46:36', '2023-01-03 17:46:36'),
(500, 159, 0, 'SPEU_0024', 'update', 'project', 7, '2023-01-03 17:47:32', '2023-01-03 17:48:17'),
(501, 160, 0, 'SPEU_0025', 'add', 'project', 7, '2023-01-03 17:49:01', '2023-01-03 17:49:01'),
(502, 160, 0, 'SPEU_0025', 'update', 'project', 7, '2023-01-03 17:49:45', '2023-01-03 17:49:54'),
(503, 161, 0, 'SPE_0021', 'add', 'project', 7, '2023-01-03 18:26:48', '2023-01-03 18:26:48'),
(504, 161, 0, 'SPE_0021', 'update', 'project', 7, '2023-01-03 18:27:35', '2023-01-03 18:27:47'),
(505, 162, 0, 'SPE_0022', 'add', 'project', 7, '2023-01-03 18:28:38', '2023-01-03 18:28:38'),
(506, 162, 0, 'SPE_0022', 'update', 'project', 7, '2023-01-03 18:29:27', '2023-01-03 18:30:47'),
(507, 14, 0, 'Lingsoft Language Services Oy', 'update', 'direct_cli', 7, '2023-01-03 18:31:14', '2023-01-13 21:18:33'),
(508, 29, 0, 'LG', 'add', 'indirect_cli', 7, '2023-01-03 18:31:44', '2023-01-03 18:31:44'),
(509, 164, 0, 'SPE_0023', 'add', 'project', 7, '2023-01-03 18:32:21', '2023-01-03 18:32:21'),
(510, 164, 0, 'SPE_0023', 'update', 'project', 7, '2023-01-03 18:32:53', '2023-01-03 18:33:15'),
(511, 166, 0, 'SPE_0024', 'add', 'project', 7, '2023-01-03 18:40:46', '2023-01-03 18:40:46');
INSERT INTO `tms_log_master` (`log_id`, `log_type_id`, `task_id`, `log_title`, `log_type`, `log_status`, `created_by`, `created_date`, `modified_date`) VALUES
(512, 166, 0, 'SPE_0024', 'update', 'project', 7, '2023-01-03 18:41:26', '2023-01-03 18:41:35'),
(513, 167, 0, 'SPE_0025', 'add', 'project', 7, '2023-01-03 18:42:44', '2023-01-03 18:42:44'),
(514, 167, 0, 'SPE_0025', 'update', 'project', 7, '2023-01-03 18:43:21', '2023-01-03 18:43:27'),
(515, 30, 0, 'PayPal', 'add', 'indirect_cli', 7, '2023-01-03 18:43:57', '2023-01-03 18:43:57'),
(516, 168, 0, 'SPE_0026', 'add', 'project', 7, '2023-01-03 18:44:29', '2023-01-03 18:44:29'),
(517, 168, 0, 'SPE_0026', 'update', 'project', 7, '2023-01-03 18:45:05', '2023-01-03 18:45:11'),
(518, 31, 0, 'Yahoo', 'add', 'indirect_cli', 7, '2023-01-03 18:45:56', '2023-01-03 18:45:56'),
(519, 169, 0, 'SPE_0027', 'add', 'project', 7, '2023-01-03 18:46:31', '2023-01-03 18:46:31'),
(520, 169, 0, 'SPE_0027', 'update', 'project', 7, '2023-01-03 18:47:08', '2023-01-03 18:47:14'),
(521, 170, 0, 'SPEU_0026', 'add', 'project', 14, '2023-01-04 19:54:58', '2023-01-04 19:54:58'),
(522, 170, 0, 'SPEU_0026', 'update', 'project', 14, '2023-01-04 19:56:06', '2023-01-04 19:56:15'),
(523, 170, 131, 'SPEU_0026_TRA001', 'update', 'task', 14, '2023-01-04 19:56:33', '2023-01-04 19:56:33'),
(524, 171, 0, 'SPE_0028', 'add', 'project', 14, '2023-01-04 20:01:08', '2023-01-04 20:01:08'),
(525, 171, 0, 'SPE_0028', 'update', 'project', 14, '2023-01-04 20:01:50', '2023-01-04 20:02:31'),
(526, 171, 132, 'SPE_0028_PRF001', 'update', 'task', 14, '2023-01-04 20:02:57', '2023-01-04 20:02:57'),
(527, 172, 0, 'SPEU_0027', 'add', 'project', 14, '2023-01-04 20:05:02', '2023-01-04 20:05:02'),
(528, 172, 0, 'SPEU_0027', 'update', 'project', 14, '2023-01-04 20:05:50', '2023-01-04 20:05:55'),
(529, 172, 133, 'SPEU_0027_TRA001', 'update', 'task', 14, '2023-01-04 20:06:19', '2023-01-04 20:06:19'),
(530, 32, 0, 'Google', 'add', 'indirect_cli', 14, '2023-01-04 20:26:22', '2023-01-04 20:26:22'),
(531, 173, 0, 'SPEU_0028', 'add', 'project', 14, '2023-01-04 20:27:21', '2023-01-04 20:27:21'),
(532, 173, 0, 'SPEU_0028', 'update', 'project', 14, '2023-01-04 20:28:02', '2023-01-04 20:28:08'),
(533, 173, 134, 'SPEU_0028_MTP001', 'update', 'task', 14, '2023-01-04 20:28:32', '2023-01-04 20:28:32'),
(534, 174, 0, 'SPEU_0029', 'add', 'project', 14, '2023-01-04 20:30:41', '2023-01-04 20:30:41'),
(535, 174, 0, 'SPEU_0029', 'update', 'project', 14, '2023-01-04 20:31:28', '2023-01-04 20:31:51'),
(536, 174, 135, 'SPEU_0029_TRA001', 'update', 'task', 14, '2023-01-04 20:32:13', '2023-01-04 20:32:13'),
(537, 176, 0, 'SPEU_0030', 'add', 'project', 7, '2023-01-04 20:42:32', '2023-01-04 20:42:33'),
(538, 176, 0, 'SPEU_0030', 'update', 'project', 7, '2023-01-04 20:43:39', '2023-01-04 20:43:39'),
(539, 177, 0, 'SPEU_0031', 'add', 'project', 7, '2023-01-05 13:37:18', '2023-01-05 13:37:18'),
(540, 177, 0, 'SPEU_0031', 'update', 'project', 7, '2023-01-05 13:38:14', '2023-01-05 13:45:41'),
(541, 33, 0, 'KLM', 'add', 'indirect_cli', 7, '2023-01-05 13:46:36', '2023-01-05 13:46:36'),
(542, 178, 0, 'SPEU_0032', 'add', 'project', 7, '2023-01-05 13:47:29', '2023-01-05 13:47:29'),
(543, 178, 0, 'SPEU_0032', 'update', 'project', 7, '2023-01-05 13:48:18', '2023-01-13 14:18:48'),
(544, 179, 0, 'SPEU_0033', 'add', 'project', 7, '2023-01-05 13:50:17', '2023-01-05 13:50:17'),
(545, 179, 0, 'SPEU_0033', 'update', 'project', 7, '2023-01-05 13:51:13', '2023-01-05 13:52:55'),
(546, 180, 0, 'SPEU_0034', 'add', 'project', 7, '2023-01-05 13:54:00', '2023-01-05 13:54:00'),
(547, 180, 0, 'SPEU_0034', 'update', 'project', 7, '2023-01-05 13:55:11', '2023-01-05 13:55:11'),
(548, 181, 0, 'SPE_0029', 'add', 'project', 7, '2023-01-05 13:56:22', '2023-01-05 13:56:22'),
(549, 181, 0, 'SPE_0029', 'update', 'project', 7, '2023-01-05 13:57:23', '2023-01-05 13:57:30'),
(550, 182, 0, 'SPE_0030', 'add', 'project', 7, '2023-01-05 13:58:41', '2023-01-05 13:58:41'),
(551, 182, 0, 'SPE_0030', 'update', 'project', 7, '2023-01-05 13:59:29', '2023-01-13 21:08:58'),
(552, 184, 0, 'SPE_0031', 'add', 'project', 7, '2023-01-05 14:01:26', '2023-01-05 14:01:26'),
(553, 184, 0, 'SPE_0031', 'update', 'project', 7, '2023-01-05 14:02:01', '2023-01-13 21:09:25'),
(554, 185, 0, 'SPEU_0035', 'add', 'project', 7, '2023-01-05 14:03:06', '2023-01-05 14:03:06'),
(555, 185, 0, 'SPEU_0035', 'update', 'project', 7, '2023-01-05 14:03:40', '2023-01-05 14:03:55'),
(556, 25, 0, 'SDL Norway', 'add', 'direct_cli', 7, '2023-01-05 14:06:27', '2023-01-05 14:06:27'),
(557, 25, 0, 'SDL Norway', 'update', 'direct_cli', 7, '2023-01-05 14:06:49', '2023-01-05 16:41:03'),
(558, 34, 0, 'MGR', 'add', 'indirect_cli', 7, '2023-01-05 14:13:04', '2023-01-05 14:13:04'),
(559, 35, 0, 'Canon', 'add', 'indirect_cli', 7, '2023-01-05 14:13:50', '2023-01-05 14:13:50'),
(560, 36, 0, 'Lindex', 'add', 'indirect_cli', 7, '2023-01-05 14:14:20', '2023-01-05 14:14:20'),
(561, 37, 0, 'Google', 'add', 'indirect_cli', 7, '2023-01-05 14:14:47', '2023-01-05 14:14:47'),
(562, 38, 0, 'BMS', 'add', 'indirect_cli', 7, '2023-01-05 14:15:32', '2023-01-05 14:15:32'),
(563, 39, 0, 'Man Group', 'add', 'indirect_cli', 7, '2023-01-05 14:16:10', '2023-01-05 14:16:10'),
(564, 186, 0, 'SPEU_0036', 'add', 'project', 7, '2023-01-05 14:17:21', '2023-01-05 14:17:21'),
(565, 186, 0, 'SPEU_0036', 'update', 'project', 7, '2023-01-05 14:19:18', '2023-01-05 14:20:03'),
(566, 187, 0, 'SPEU_0037', 'add', 'project', 7, '2023-01-05 14:20:52', '2023-01-05 14:20:52'),
(567, 187, 0, 'SPEU_0037', 'update', 'project', 7, '2023-01-05 14:21:35', '2023-01-05 14:32:42'),
(568, 189, 0, 'SPEU_0038', 'add', 'project', 7, '2023-01-05 14:25:10', '2023-01-05 14:25:10'),
(569, 189, 0, 'SPEU_0038', 'update', 'project', 7, '2023-01-05 14:26:11', '2023-01-05 14:29:54'),
(570, 37, 0, 'Google', 'delete', 'indirect_cli', 7, '2023-01-05 14:34:10', '2023-01-05 14:34:10'),
(571, 192, 0, 'SPEU_0039', 'add', 'project', 7, '2023-01-05 14:34:53', '2023-01-05 14:34:53'),
(572, 192, 0, 'SPEU_0039', 'update', 'project', 7, '2023-01-05 14:35:35', '2023-01-05 14:37:14'),
(573, 193, 0, 'SPEU_0040', 'add', 'project', 7, '2023-01-05 14:38:19', '2023-01-05 14:38:19'),
(574, 193, 0, 'SPEU_0040', 'update', 'project', 7, '2023-01-05 14:42:20', '2023-01-05 14:44:20'),
(575, 194, 0, 'SPEU_0041', 'add', 'project', 7, '2023-01-05 14:45:35', '2023-01-05 14:45:35'),
(576, 194, 0, 'SPEU_0041', 'update', 'project', 7, '2023-01-05 14:46:11', '2023-01-05 14:53:31'),
(577, 195, 0, 'SPEU_0042', 'add', 'project', 7, '2023-01-05 14:54:04', '2023-01-05 14:54:04'),
(578, 195, 0, 'SPEU_0042', 'update', 'project', 7, '2023-01-05 15:37:25', '2023-01-05 15:38:52'),
(579, 26, 0, 'SDL Limited | United Kingdom - Maidenhead', 'add', 'direct_cli', 7, '2023-01-05 15:40:51', '2023-01-05 15:40:51'),
(580, 26, 0, 'SDL Limited | United Kingdom - Maidenhead', 'update', 'direct_cli', 7, '2023-01-05 15:41:26', '2023-01-05 15:43:18'),
(581, 197, 0, 'SPEU_0043', 'add', 'project', 7, '2023-01-05 15:43:59', '2023-01-05 15:43:59'),
(582, 197, 0, 'SPEU_0043', 'update', 'project', 7, '2023-01-05 15:44:43', '2023-01-05 15:45:44'),
(583, 174, 0, 'SPEU_0029', 'update', 'project', 7, '2023-01-05 15:53:20', '2023-01-05 15:53:20'),
(584, 21, 0, 'Test Testeseb', 'delete', 'external_res', 7, '2023-01-05 15:55:17', '2023-01-05 15:55:17'),
(585, 18, 0, 'Aayush KD_KANHASOFT', 'delete', 'external_res', 7, '2023-01-05 15:55:26', '2023-01-05 15:55:26'),
(586, 10, 0, 'Testkanha Points', 'delete', 'external_res', 7, '2023-01-05 15:55:32', '2023-01-05 15:55:32'),
(587, 4, 0, 'Linguist Kanhasoft', 'delete', 'external_res', 7, '2023-01-05 15:55:37', '2023-01-05 15:55:37'),
(588, 20, 0, 'Test Account', 'delete', 'external_res', 7, '2023-01-05 15:55:59', '2023-01-05 15:55:59'),
(589, 22, 0, 'Åse Mari Lislegård', 'add', 'external_res', 7, '2023-01-05 15:59:13', '2023-01-05 15:59:13'),
(590, 23, 0, 'Julianne Aga', 'add', 'external_res', 7, '2023-01-05 16:04:04', '2023-01-05 16:04:04'),
(591, 24, 0, 'Yngve Homlong', 'add', 'external_res', 7, '2023-01-05 16:09:36', '2023-01-05 16:09:36'),
(592, 198, 0, 'SPEU_0044', 'add', 'project', 7, '2023-01-05 16:32:19', '2023-01-05 16:32:19'),
(593, 198, 0, 'SPEU_0044', 'update', 'project', 7, '2023-01-05 16:32:50', '2023-01-05 16:32:55'),
(594, 17, 0, 'Snelvertaler BV', 'update', 'direct_cli', 14, '2023-01-05 16:49:58', '2023-01-12 15:17:14'),
(595, 17, 0, '', 'create', 'direct_cli', 14, '2023-01-05 16:51:04', '2023-01-05 16:51:58'),
(596, 199, 0, 'SPE_0032', 'add', 'project', 14, '2023-01-10 23:59:11', '2023-01-10 23:59:11'),
(597, 199, 0, 'SPE_0032', 'update', 'project', 14, '2023-01-11 00:01:03', '2023-01-11 00:01:19'),
(598, 199, 168, 'SPE_0032_TRA001', 'update', 'task', 14, '2023-01-11 00:01:56', '2023-01-11 00:05:01'),
(599, 25, 0, 'Anil Dev', 'delete', 'external_res', 1, '2023-01-12 14:17:51', '2023-01-12 14:17:51'),
(600, 200, 0, 'SPEU_0045', 'add', 'project', 14, '2023-01-12 15:13:54', '2023-01-12 15:13:54'),
(601, 200, 0, 'SPEU_0045', 'update', 'project', 14, '2023-01-12 15:15:32', '2023-01-12 15:15:32'),
(602, 200, 169, 'SPEU_0045_TRA001', 'update', 'task', 14, '2023-01-12 15:16:03', '2023-01-12 15:16:21'),
(603, 16, 0, 'Qontent Group', 'update', 'direct_cli', 14, '2023-01-12 17:44:47', '2023-01-12 17:44:47'),
(604, 201, 0, 'SPE_0033', 'add', 'project', 14, '2023-01-12 17:45:57', '2023-01-12 17:45:57'),
(605, 201, 0, 'SPE_0033', 'update', 'project', 14, '2023-01-12 17:46:27', '2023-01-18 13:55:15'),
(606, 201, 170, 'SPE_0033_TRA001', 'update', 'task', 14, '2023-01-12 17:46:52', '2023-01-12 17:46:52'),
(607, 26, 0, 'Anil-Nadiya', 'delete', 'external_res', 1, '2023-01-13 12:46:06', '2023-01-13 12:46:06'),
(608, 27, 0, 'Anil Outlook', 'delete', 'external_res', 1, '2023-01-13 12:46:14', '2023-01-13 12:46:14'),
(609, 28, 0, 'Anil Outlook', 'delete', 'external_res', 1, '2023-01-13 12:54:09', '2023-01-13 12:54:09'),
(610, 2, 0, '', 'create', 'direct_cli', 7, '2023-01-13 13:53:42', '2023-01-13 13:53:42'),
(611, 2, 0, '', 'update', 'direct_cli', 7, '2023-01-13 13:53:57', '2023-01-13 13:54:08'),
(612, 3, 0, 'Datawords Datasia SARL', 'update', 'direct_cli', 7, '2023-01-13 13:55:01', '2023-01-13 13:55:48'),
(613, 3, 0, '', 'create', 'direct_cli', 7, '2023-01-13 13:55:39', '2023-01-13 13:56:29'),
(614, 10, 0, 'Maxsun International (HK) LTD', 'update', 'direct_cli', 7, '2023-01-13 13:59:18', '2023-01-13 14:00:15'),
(615, 11, 0, 'Intrawelt', 'update', 'direct_cli', 7, '2023-01-13 14:01:08', '2023-01-13 14:01:28'),
(616, 19, 0, 'MSS Cape Town The Language Agency', 'update', 'direct_cli', 7, '2023-01-13 14:04:38', '2023-01-18 13:56:09'),
(617, 21, 0, 'RWS Moravia', 'update', 'direct_cli', 7, '2023-01-13 14:05:41', '2023-01-13 14:05:41'),
(618, 21, 0, '', 'create', 'direct_cli', 7, '2023-01-13 14:10:51', '2023-01-13 14:10:51'),
(619, 29, 0, 'Anil Spellup', 'delete', 'external_res', 1, '2023-01-13 16:34:26', '2023-01-13 16:34:26'),
(620, 16, 0, 'Qontent Group', 'update', 'direct_cli', 7, '2023-01-13 21:28:03', '2023-01-13 21:28:03'),
(621, 31, 0, 'Ingvild Freelancer', 'add', 'external_res', 7, '2023-01-13 22:18:41', '2023-01-13 22:18:41'),
(622, 25, 0, 'SDL Norway', 'update', 'direct_cli', 14, '2023-01-15 16:29:44', '2023-01-15 16:29:44'),
(623, 203, 0, 'SPEU_0046', 'add', 'project', 14, '2023-01-15 16:30:17', '2023-01-15 16:30:17'),
(624, 203, 0, 'SPEU_0046', 'update', 'project', 14, '2023-01-15 16:31:06', '2023-01-15 16:46:10'),
(625, 203, 172, 'SPEU_0046_MTP001', 'update', 'task', 14, '2023-01-15 16:32:31', '2023-01-15 16:32:31'),
(626, 203, 173, 'SPEU_0046_MTP002', 'update', 'task', 14, '2023-01-15 16:38:23', '2023-01-15 16:38:23'),
(627, 203, 174, 'SPEU_0046_MTP003', 'update', 'task', 14, '2023-01-15 16:40:32', '2023-01-15 16:40:32'),
(628, 203, 175, 'SPEU_0046_MTP004', 'update', 'task', 14, '2023-01-15 16:43:12', '2023-01-15 16:43:12'),
(629, 203, 176, 'SPEU_0046_MTP005', 'update', 'task', 14, '2023-01-15 16:45:31', '2023-01-15 16:45:31'),
(630, 201, 177, 'SPE_0033_TRA002', 'update', 'task', 14, '2023-01-15 17:04:36', '2023-01-15 17:04:36'),
(631, 201, 178, 'SPE_0033_TRA003', 'update', 'task', 14, '2023-01-15 17:04:52', '2023-01-15 17:04:52'),
(632, 201, 179, 'SPE_0033_TRA004', 'update', 'task', 14, '2023-01-15 17:05:08', '2023-01-15 17:05:08'),
(633, 201, 180, 'SPE_0033_TRA005', 'update', 'task', 14, '2023-01-15 17:05:22', '2023-01-15 17:05:22'),
(634, 201, 181, 'SPE_0033_TRA006', 'update', 'task', 14, '2023-01-15 17:05:36', '2023-01-15 17:05:36'),
(635, 201, 182, 'SPE_0033_TRA007', 'update', 'task', 14, '2023-01-15 17:05:53', '2023-01-15 17:05:53'),
(636, 201, 183, 'SPE_0033_TRA008', 'update', 'task', 14, '2023-01-15 17:06:08', '2023-01-15 17:06:08'),
(637, 33, 0, 'KLM (KLM Royal Dutch Airlines)', 'update', 'indirect_cli', 14, '2023-01-15 17:09:29', '2023-01-15 17:09:29'),
(638, 204, 0, 'SPEU_0047', 'add', 'project', 14, '2023-01-15 17:10:19', '2023-01-15 17:10:19'),
(639, 204, 0, 'SPEU_0047', 'update', 'project', 14, '2023-01-15 17:10:58', '2023-01-15 17:11:33'),
(640, 204, 184, 'SPEU_0047_MTP001', 'update', 'task', 14, '2023-01-15 17:11:18', '2023-01-15 17:11:18'),
(641, 32, 0, 'Vivek Singh', 'delete', 'external_res', 1, '2023-01-16 15:24:14', '2023-01-16 15:24:14'),
(642, 33, 0, 'Vivek Kanhasoft', 'delete', 'external_res', 1, '2023-01-16 15:24:24', '2023-01-16 15:24:24'),
(643, 34, 0, 'Anil Spellup', 'delete', 'external_res', 1, '2023-01-16 15:24:41', '2023-01-16 15:24:41'),
(644, 205, 0, 'SPEU_0048', 'add', 'project', 14, '2023-01-17 01:24:21', '2023-01-17 01:24:21'),
(645, 205, 0, 'SPEU_0048', 'update', 'project', 14, '2023-01-17 01:25:21', '2023-01-17 01:26:08'),
(646, 207, 0, 'SPEU_0049', 'add', 'project', 14, '2023-01-17 01:36:03', '2023-01-17 01:36:03'),
(647, 207, 0, 'SPEU_0049', 'update', 'project', 14, '2023-01-17 01:37:03', '2023-01-17 01:37:07'),
(648, 208, 0, 'SPE_0034', 'add', 'project', 14, '2023-01-18 13:40:55', '2023-01-18 13:40:55'),
(649, 208, 0, 'SPE_0034', 'update', 'project', 14, '2023-01-18 13:41:35', '2023-01-18 13:42:32'),
(650, 20, 0, 'GTH Translation', 'update', 'direct_cli', 7, '2023-01-18 13:53:15', '2023-01-18 13:53:15'),
(651, 209, 0, 'SPEU_0050', 'add', 'project', 14, '2023-01-18 13:57:27', '2023-01-18 13:57:27'),
(652, 209, 0, 'SPEU_0050', 'update', 'project', 14, '2023-01-18 13:58:03', '2023-01-18 13:58:12'),
(653, 210, 0, 'SPE220029', 'add', 'project', 14, '2023-01-18 13:59:34', '2023-01-18 13:59:34'),
(654, 210, 0, 'SPE220029', 'update', 'project', 14, '2023-01-18 14:00:09', '2023-01-18 14:00:19'),
(655, 211, 0, 'SPEU_0051', 'add', 'project', 14, '2023-01-18 14:01:59', '2023-01-18 14:01:59'),
(656, 211, 0, 'SPEU_0051', 'update', 'project', 14, '2023-01-18 14:02:32', '2023-01-18 14:05:11'),
(657, 205, 185, 'SPEU_0048_MTP001', 'update', 'task', 1, '2023-01-19 14:52:49', '2023-01-19 14:52:49'),
(658, 30, 0, 'Anil S2', 'delete', 'external_res', 1, '2023-01-19 18:24:43', '2023-01-19 18:24:43'),
(659, 212, 0, 'SPEU_0052', 'add', 'project', 14, '2023-01-24 00:58:34', '2023-01-24 00:58:34'),
(660, 212, 0, 'SPEU_0052', 'update', 'project', 14, '2023-01-24 00:59:07', '2023-01-24 00:59:07'),
(661, 27, 0, 'Jonckers', 'add', 'direct_cli', 14, '2023-01-25 00:20:57', '2023-01-25 00:20:57'),
(662, 27, 0, 'Jonckers', 'update', 'direct_cli', 14, '2023-01-25 00:21:35', '2023-01-25 00:23:46'),
(663, 214, 0, 'SPEU_0053', 'add', 'project', 14, '2023-01-25 00:24:31', '2023-01-25 00:24:31'),
(664, 214, 0, 'SPEU_0053', 'update', 'project', 14, '2023-01-25 00:25:06', '2023-01-25 00:25:08'),
(665, 215, 0, 'SPEU_0054', 'add', 'project', 14, '2023-01-25 00:26:25', '2023-01-25 00:26:25'),
(666, 215, 0, 'SPEU_0054', 'update', 'project', 14, '2023-01-25 00:26:56', '2023-01-25 00:26:56'),
(667, 217, 0, 'SPEU_0055', 'add', 'project', 14, '2023-01-25 00:29:13', '2023-01-25 00:29:13'),
(668, 217, 0, 'SPEU_0055', 'update', 'project', 14, '2023-01-25 00:29:49', '2023-01-25 00:29:49'),
(669, 218, 0, 'SPE_0035', 'add', 'project', 14, '2023-01-25 00:30:59', '2023-01-25 00:30:59'),
(670, 218, 0, 'SPE_0035', 'update', 'project', 14, '2023-01-25 00:31:35', '2023-01-25 00:31:53'),
(671, 219, 0, 'SPEU_0056', 'add', 'project', 14, '2023-01-25 00:37:34', '2023-01-25 00:37:34'),
(672, 219, 0, 'SPEU_0056', 'update', 'project', 14, '2023-01-25 00:38:07', '2023-01-25 00:38:07'),
(673, 28, 0, 'Summa Linguae Technologies Canada Inc.', 'add', 'direct_cli', 14, '2023-01-25 00:42:20', '2023-01-25 00:42:20'),
(674, 28, 0, 'Summa Linguae Technologies Canada Inc.', 'update', 'direct_cli', 14, '2023-01-25 00:42:51', '2023-01-25 00:42:51'),
(675, 220, 0, 'SPEU_0057', 'add', 'project', 14, '2023-01-25 00:43:54', '2023-01-25 00:43:54'),
(676, 220, 0, 'SPEU_0057', 'update', 'project', 14, '2023-01-25 00:44:52', '2023-01-25 23:30:14'),
(677, 221, 0, 'SPE_0036', 'add', 'project', 14, '2023-01-25 00:46:36', '2023-01-25 00:46:36'),
(678, 221, 0, 'SPE_0036', 'update', 'project', 14, '2023-01-25 00:47:39', '2023-01-25 00:47:39'),
(679, 222, 0, 'SPEU_0058', 'add', 'project', 14, '2023-01-25 00:48:44', '2023-01-25 00:48:44'),
(680, 222, 0, 'SPEU_0058', 'update', 'project', 14, '2023-01-25 00:49:22', '2023-01-25 00:49:32'),
(681, 223, 0, 'SPE_0037', 'add', 'project', 14, '2023-01-25 00:50:24', '2023-01-25 00:50:24'),
(682, 223, 0, 'SPE_0037', 'update', 'project', 14, '2023-01-25 00:51:09', '2023-01-25 00:51:09'),
(683, 224, 0, 'SPEU_0059', 'add', 'project', 14, '2023-01-25 00:54:11', '2023-01-25 00:54:11'),
(684, 224, 0, 'SPEU_0059', 'update', 'project', 14, '2023-01-25 00:55:00', '2023-01-25 00:55:00'),
(685, 225, 0, 'SPEU_0060', 'add', 'project', 14, '2023-01-25 00:55:59', '2023-01-25 00:55:59'),
(686, 225, 0, 'SPEU_0060', 'update', 'project', 14, '2023-01-25 00:56:34', '2023-01-25 00:56:34'),
(687, 40, 0, 'Tussitaikurit', 'add', 'indirect_cli', 14, '2023-01-25 00:57:16', '2023-01-25 00:57:16'),
(688, 226, 0, 'SPE_0038', 'add', 'project', 14, '2023-01-25 00:58:10', '2023-01-25 00:58:10'),
(689, 226, 0, 'SPE_0038', 'update', 'project', 14, '2023-01-25 00:59:00', '2023-01-25 00:59:00'),
(690, 227, 0, 'SPEU_0061', 'add', 'project', 14, '2023-01-25 23:25:08', '2023-01-25 23:25:08'),
(691, 227, 0, 'SPEU_0061', 'update', 'project', 14, '2023-01-25 23:25:55', '2023-01-25 23:29:15'),
(692, 227, 210, 'SPEU_0061_MTP001', 'update', 'task', 14, '2023-01-25 23:26:59', '2023-01-25 23:26:59'),
(693, 227, 211, 'SPEU_0061_MTP002', 'update', 'task', 14, '2023-01-25 23:27:14', '2023-01-25 23:27:14'),
(694, 228, 0, 'SPE_0039', 'add', 'project', 14, '2023-01-25 23:31:19', '2023-01-25 23:31:19'),
(695, 228, 0, 'SPE_0039', 'update', 'project', 14, '2023-01-25 23:32:08', '2023-01-25 23:32:08'),
(696, 228, 212, 'SPE_0039_TRA001', 'update', 'task', 14, '2023-01-25 23:32:36', '2023-01-25 23:32:36'),
(697, 229, 0, 'SPEU_0062', 'add', 'project', 14, '2023-01-25 23:34:21', '2023-01-25 23:34:21'),
(698, 229, 0, 'SPEU_0062', 'update', 'project', 14, '2023-01-25 23:35:04', '2023-01-25 23:38:00'),
(699, 229, 213, 'SPEU_0062_MTP001', 'update', 'task', 14, '2023-01-25 23:38:23', '2023-01-25 23:38:23'),
(700, 229, 214, 'SPEU_0062_MTP002', 'update', 'task', 14, '2023-01-25 23:39:13', '2023-01-25 23:39:13'),
(701, 229, 215, 'SPEU_0062_MTP003', 'update', 'task', 14, '2023-01-25 23:39:34', '2023-01-25 23:39:34'),
(702, 229, 216, 'SPEU_0062_MTP004', 'update', 'task', 14, '2023-01-25 23:39:49', '2023-01-25 23:39:49'),
(703, 229, 217, 'SPEU_0062_MTP005', 'update', 'task', 14, '2023-01-25 23:40:05', '2023-01-25 23:40:05'),
(704, 230, 0, 'SPEU_0063', 'add', 'project', 14, '2023-01-25 23:47:28', '2023-01-25 23:47:28'),
(705, 230, 0, 'SPEU_0063', 'update', 'project', 14, '2023-01-25 23:47:57', '2023-01-25 23:47:57'),
(706, 230, 218, 'SPEU_0063_TRA001', 'update', 'task', 14, '2023-01-25 23:48:14', '2023-01-25 23:48:14'),
(707, 231, 0, 'SPE_0040', 'add', 'project', 14, '2023-01-25 23:49:30', '2023-01-25 23:49:30'),
(708, 231, 0, 'SPE_0040', 'update', 'project', 14, '2023-01-25 23:50:17', '2023-01-25 23:50:17'),
(709, 231, 219, 'SPE_0040_PRF001', 'update', 'task', 14, '2023-01-25 23:50:33', '2023-01-25 23:50:33'),
(710, 232, 0, 'SPE_0041', 'add', 'project', 14, '2023-01-25 23:51:49', '2023-01-25 23:51:49'),
(711, 232, 0, 'SPE_0041', 'update', 'project', 14, '2023-01-25 23:52:26', '2023-01-25 23:52:26'),
(712, 232, 220, 'SPE_0041_PRF001', 'update', 'task', 14, '2023-01-25 23:52:46', '2023-01-25 23:52:46'),
(713, 233, 0, 'SPEU_0064', 'add', 'project', 14, '2023-01-25 23:53:52', '2023-01-25 23:53:52'),
(714, 233, 0, 'SPEU_0064', 'update', 'project', 14, '2023-01-25 23:54:22', '2023-01-25 23:54:33'),
(715, 233, 221, 'SPEU_0064_TRA001', 'update', 'task', 14, '2023-01-25 23:54:50', '2023-01-25 23:54:50'),
(716, 234, 0, 'SPEU_0065', 'add', 'project', 14, '2023-01-25 23:57:10', '2023-01-25 23:57:10'),
(717, 234, 0, 'SPEU_0065', 'update', 'project', 14, '2023-01-25 23:57:39', '2023-01-25 23:57:39'),
(718, 234, 222, 'SPEU_0065_PRF001', 'update', 'task', 14, '2023-01-25 23:57:56', '2023-01-25 23:57:56'),
(719, 235, 0, 'SPE_0042', 'add', 'project', 14, '2023-01-25 23:59:01', '2023-01-25 23:59:01'),
(720, 235, 0, 'SPE_0042', 'update', 'project', 14, '2023-01-25 23:59:43', '2023-01-26 00:00:17'),
(721, 235, 223, 'SPE_0042_PRF001', 'update', 'task', 14, '2023-01-26 00:00:36', '2023-01-26 00:00:36'),
(722, 236, 0, 'SPEU_0066', 'add', 'project', 14, '2023-01-26 00:02:12', '2023-01-26 00:02:12'),
(723, 236, 0, 'SPEU_0066', 'update', 'project', 14, '2023-01-26 00:02:40', '2023-01-26 00:02:42'),
(724, 236, 224, 'SPEU_0066_PRF001', 'update', 'task', 14, '2023-01-26 00:02:59', '2023-01-26 00:02:59'),
(725, 237, 0, 'SPE_0043', 'add', 'project', 14, '2023-01-26 00:09:50', '2023-01-26 00:09:50'),
(726, 237, 0, 'SPE_0043', 'update', 'project', 14, '2023-01-26 00:10:34', '2023-01-26 00:10:34'),
(727, 237, 225, 'SPE_0043_PRF001', 'update', 'task', 14, '2023-01-26 00:10:51', '2023-01-26 00:10:51'),
(728, 238, 0, 'SPEU_0067', 'add', 'project', 14, '2023-01-26 00:11:47', '2023-01-26 00:11:47'),
(729, 238, 0, 'SPEU_0067', 'update', 'project', 14, '2023-01-26 00:12:35', '2023-01-26 00:12:35'),
(730, 238, 226, 'SPEU_0067_TRA001', 'update', 'task', 14, '2023-01-26 00:12:53', '2023-01-26 00:12:53'),
(731, 239, 0, 'SPE_0044', 'add', 'project', 14, '2023-01-26 00:14:18', '2023-01-26 00:14:18'),
(732, 239, 0, 'SPE_0044', 'update', 'project', 14, '2023-01-26 00:14:52', '2023-01-26 00:15:06'),
(733, 239, 227, 'SPE_0044_TRA001', 'update', 'task', 14, '2023-01-26 00:15:21', '2023-01-26 00:15:21'),
(734, 240, 0, 'SPE_0045', 'add', 'project', 14, '2023-01-26 00:18:37', '2023-01-26 00:18:37'),
(735, 240, 0, 'SPE_0045', 'update', 'project', 14, '2023-01-26 00:19:14', '2023-01-26 00:21:48'),
(736, 240, 228, 'SPE_0045_TRA001', 'update', 'task', 14, '2023-01-26 00:22:05', '2023-01-26 00:22:05'),
(737, 240, 229, 'SPE_0045_TRA002', 'update', 'task', 14, '2023-01-26 00:22:24', '2023-01-26 00:22:24'),
(738, 240, 230, 'SPE_0045_TRA003', 'update', 'task', 14, '2023-01-26 00:22:38', '2023-01-26 00:22:38'),
(739, 240, 231, 'SPE_0045_TRA004', 'update', 'task', 14, '2023-01-26 00:22:55', '2023-01-26 00:22:55'),
(740, 240, 232, 'SPE_0045_TRA005', 'update', 'task', 14, '2023-01-26 00:23:08', '2023-01-26 00:23:08'),
(741, 241, 0, 'SPE_0046', 'add', 'project', 14, '2023-01-26 00:25:12', '2023-01-26 00:25:12'),
(742, 241, 0, 'SPE_0046', 'update', 'project', 14, '2023-01-26 00:25:40', '2023-01-26 00:26:21'),
(743, 241, 233, 'SPE_0046_TRA001', 'update', 'task', 14, '2023-01-26 00:26:37', '2023-01-26 00:26:37'),
(744, 241, 234, 'SPE_0046_TRA002', 'update', 'task', 14, '2023-01-26 00:26:51', '2023-01-26 00:26:51'),
(745, 242, 0, 'SPEU_0068', 'add', 'project', 14, '2023-01-26 00:27:47', '2023-01-26 00:27:47'),
(746, 242, 0, 'SPEU_0068', 'update', 'project', 14, '2023-01-26 00:28:16', '2023-01-26 00:28:57'),
(747, 242, 235, 'SPEU_0068_MTP001', 'update', 'task', 14, '2023-01-26 00:29:12', '2023-01-26 00:29:12'),
(748, 242, 236, 'SPEU_0068_MTP002', 'update', 'task', 14, '2023-01-26 00:29:26', '2023-01-26 00:29:26'),
(749, 243, 0, 'SPEU_0069', 'add', 'project', 14, '2023-01-26 00:30:13', '2023-01-26 00:30:13'),
(750, 243, 0, 'SPEU_0069', 'update', 'project', 14, '2023-01-26 00:30:38', '2023-01-26 00:31:17'),
(751, 243, 237, 'SPEU_0069_MTP001', 'update', 'task', 14, '2023-01-26 00:31:33', '2023-01-26 00:31:33'),
(752, 243, 238, 'SPEU_0069_MTP002', 'update', 'task', 14, '2023-01-26 00:31:46', '2023-01-26 00:31:46'),
(753, 244, 0, 'SPEU_0070', 'add', 'project', 14, '2023-01-26 00:40:15', '2023-01-26 00:40:15'),
(754, 244, 0, 'SPEU_0070', 'update', 'project', 14, '2023-01-26 00:40:49', '2023-01-26 00:43:00'),
(755, 244, 239, 'SPEU_0070_TRA001', 'update', 'task', 14, '2023-01-26 00:41:08', '2023-01-26 00:41:08'),
(756, 55, 22, 'SPEU_0001_TRA003', 'update', 'task', 7, '2023-01-27 23:21:01', '2023-01-27 23:21:01'),
(757, 245, 0, 'SPEU_0071', 'add', 'project', 14, '2023-01-29 23:22:10', '2023-01-29 23:22:10'),
(758, 245, 0, 'SPEU_0071', 'update', 'project', 14, '2023-01-29 23:22:54', '2023-01-29 23:22:54'),
(759, 245, 240, 'SPEU_0071_PRF001', 'update', 'task', 14, '2023-01-29 23:23:12', '2023-01-29 23:23:12'),
(760, 246, 0, 'SPE_0047', 'add', 'project', 14, '2023-01-29 23:24:46', '2023-01-29 23:24:46'),
(761, 246, 0, 'SPE_0047', 'update', 'project', 14, '2023-01-29 23:25:23', '2023-01-29 23:27:23'),
(762, 246, 241, 'SPE_0047_TRA001', 'update', 'task', 14, '2023-01-29 23:27:39', '2023-01-29 23:27:39'),
(763, 246, 242, 'SPE_0047_TRA002', 'update', 'task', 14, '2023-01-29 23:27:54', '2023-01-29 23:27:54'),
(764, 246, 243, 'SPE_0047_TRA003', 'update', 'task', 14, '2023-01-29 23:28:10', '2023-01-29 23:28:10'),
(765, 246, 244, 'SPE_0047_TRA004', 'update', 'task', 14, '2023-01-29 23:28:24', '2023-01-29 23:28:24'),
(766, 247, 0, 'SPEU_0072', 'add', 'project', 14, '2023-01-29 23:29:47', '2023-01-29 23:29:47'),
(767, 247, 0, 'SPEU_0072', 'update', 'project', 14, '2023-01-29 23:30:22', '2023-01-29 23:32:46'),
(768, 247, 245, 'SPEU_0072_MTP001', 'update', 'task', 14, '2023-01-29 23:33:12', '2023-01-29 23:33:12'),
(769, 247, 246, 'SPEU_0072_MTP002', 'update', 'task', 14, '2023-01-29 23:33:25', '2023-01-29 23:33:25'),
(770, 247, 247, 'SPEU_0072_MTP003', 'update', 'task', 14, '2023-01-29 23:33:47', '2023-01-29 23:33:56'),
(771, 247, 248, 'SPEU_0072_MTP004', 'update', 'task', 14, '2023-01-29 23:34:16', '2023-01-29 23:34:16'),
(772, 248, 0, 'SPEU_0073', 'add', 'project', 14, '2023-01-29 23:37:08', '2023-01-29 23:37:08'),
(773, 248, 0, 'SPEU_0073', 'update', 'project', 14, '2023-01-29 23:37:43', '2023-01-29 23:39:49'),
(774, 248, 249, 'SPEU_0073_PRF001', 'update', 'task', 14, '2023-01-29 23:40:15', '2023-01-29 23:40:15'),
(775, 248, 250, 'SPEU_0073_PRF002', 'update', 'task', 14, '2023-01-29 23:40:27', '2023-01-29 23:40:27'),
(776, 248, 251, 'SPEU_0073_PRF003', 'update', 'task', 14, '2023-01-29 23:40:44', '2023-01-29 23:40:44'),
(777, 248, 252, 'SPEU_0073_PRF004', 'update', 'task', 14, '2023-01-29 23:40:59', '2023-01-29 23:40:59'),
(778, 29, 0, 'Lingospell Srl', 'add', 'direct_cli', 14, '2023-01-29 23:42:31', '2023-01-29 23:42:31'),
(779, 29, 0, 'Lingospell Srl', 'update', 'direct_cli', 14, '2023-01-29 23:43:02', '2023-01-29 23:43:19'),
(780, 41, 0, 'Foreo', 'add', 'indirect_cli', 14, '2023-01-29 23:44:02', '2023-01-29 23:44:02'),
(781, 249, 0, 'SPEU_0074', 'add', 'project', 14, '2023-01-29 23:44:59', '2023-01-29 23:44:59'),
(782, 249, 0, 'SPEU_0074', 'update', 'project', 14, '2023-01-29 23:45:33', '2023-01-29 23:45:45'),
(783, 249, 253, 'SPEU_0074_TRA001', 'update', 'task', 14, '2023-01-29 23:46:01', '2023-01-29 23:46:01'),
(784, 250, 0, 'SPEU_0075', 'add', 'project', 14, '2023-01-29 23:47:12', '2023-01-29 23:47:12'),
(785, 250, 0, 'SPEU_0075', 'update', 'project', 14, '2023-01-29 23:47:41', '2023-01-29 23:47:41'),
(786, 250, 254, 'SPEU_0075_PRF001', 'update', 'task', 14, '2023-01-29 23:47:57', '2023-01-29 23:47:57');

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
(37, 7, 'SPE22', '', '', 7, 1, '2022-11-08 13:42:50', '2022-12-26 00:00:00'),
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
(59, 13, 'SPE22', '', '', 7, 1, '2022-11-16 16:25:40', '2022-12-26 00:00:00'),
(61, 14, 'SPE22', '', '', 1, 1, '2022-11-16 16:33:49', '2022-11-21 00:00:00'),
(62, 1, 'SPE_', '', '', 1, 1, '2022-11-16 16:49:45', '2022-11-21 00:00:00'),
(63, 2, 'SPE_', '', '', 1, 1, '2022-11-16 17:00:20', '2022-11-21 00:00:00'),
(64, 15, 'SPE22', '', '', 7, 1, '2022-11-16 17:05:02', '2022-12-26 00:00:00'),
(66, 13, 'KNH16', '', '', 7, 1, '2022-11-16 20:52:20', '2022-11-17 00:00:00'),
(67, 14, 'KNH16', '', '', 1, 1, '2022-11-16 20:59:58', '2022-12-06 00:00:00'),
(72, 3, 'SPE_', '', '', 1, 1, '2022-11-18 00:45:42', '2022-11-21 00:00:00'),
(74, 16, 'SPE22', '', '', 1, 1, '2022-11-18 23:51:16', '2022-12-02 00:00:00'),
(76, 17, 'SPE22', '', '', 7, 1, '2022-11-18 23:56:42', '2022-12-26 00:00:00'),
(80, 15, 'KNH16', '', '', 1, 1, '2022-11-24 15:02:49', '2022-11-24 00:00:00'),
(83, 1, 'SPE_', '', '', 1, 1, '2022-12-01 15:59:45', '2022-12-01 00:00:00'),
(84, 2, 'SPE_', '', '', 1, 1, '2022-12-01 16:08:35', '2022-12-01 00:00:00'),
(86, 4, 'SPE_', '', '', 7, 1, '2022-12-01 16:27:33', '2022-12-26 00:00:00'),
(87, 5, 'SPE_', '', '', 7, 1, '2022-12-01 17:12:53', '2022-12-26 00:00:00'),
(88, 3, 'SPE_', '', '', 7, 1, '2022-12-01 17:47:30', '2022-12-04 00:00:00'),
(89, 6, 'SPE_', '', '', 7, 1, '2022-12-01 18:06:43', '2022-12-26 00:00:00'),
(91, 7, 'SPE_', '', '', 1, 1, '2022-12-01 19:17:23', '2022-12-01 00:00:00'),
(92, 8, 'SPE_', '', '', 7, 1, '2022-12-01 19:46:52', '2022-12-26 00:00:00'),
(93, 9, 'SPE_', '', '', 1, 1, '2022-12-01 20:04:21', '2022-12-01 00:00:00'),
(94, 10, 'SPE_', '', '', 1, 1, '2022-12-01 20:15:24', '2022-12-01 00:00:00'),
(95, 4, 'SPE_', '', '', 7, 1, '2022-12-01 20:23:55', '2022-12-26 00:00:00'),
(96, 18, 'SPE22', '', '', 7, 1, '2022-12-01 20:40:17', '2022-12-26 00:00:00'),
(97, 19, 'SPE22', '', '', 7, 1, '2022-12-01 20:45:20', '2022-12-26 00:00:00'),
(98, 20, 'SPE22', '', '', 7, 1, '2022-12-01 20:50:22', '2022-12-26 00:00:00'),
(99, 21, 'SPE22', '', '', 7, 1, '2022-12-01 22:02:15', '2022-12-26 00:00:00'),
(101, 22, 'SPE22', '', '', 7, 1, '2022-12-01 22:11:56', '2022-12-26 00:00:00'),
(102, 23, 'SPE22', '', '', 7, 1, '2022-12-01 22:18:19', '2022-12-26 00:00:00'),
(104, 24, 'SPE22', '', '', 7, 1, '2022-12-01 22:41:20', '2022-12-26 00:00:00'),
(105, 25, 'SPE22', '', '', 7, 1, '2022-12-01 22:59:49', '2022-12-26 00:00:00'),
(106, 5, 'SPE_', '', '', 7, 1, '2022-12-02 14:27:17', '2022-12-26 00:00:00'),
(107, 26, 'SPE22', '', '', 7, 1, '2022-12-02 14:35:08', '2022-12-26 00:00:00'),
(108, 27, 'SPE22', '', '', 1, 1, '2022-12-02 14:44:59', '2022-12-09 00:00:00'),
(109, 28, 'SPE22', '', '', 1, 1, '2022-12-02 14:52:33', '2022-12-02 00:00:00'),
(110, 6, 'SPE_', '', '', 0, 0, '2022-12-04 02:37:56', '2022-12-04 02:38:13'),
(111, 2, 'SPEU_', '', '', 1, 1, '2022-12-05 20:44:18', '2022-12-23 00:00:00'),
(112, 3, 'SPEU_', '', '', 1, 1, '2022-12-05 20:58:32', '2022-12-05 00:00:00'),
(113, 4, 'SPEU_', '', '', 14, 1, '2022-12-05 21:25:00', '2022-12-06 00:00:00'),
(114, 7, 'SPE_', '', '', 7, 1, '2022-12-05 21:27:51', '2022-12-26 00:00:00'),
(116, 8, 'SPE_', '', '', 7, 1, '2022-12-06 17:28:28', '2022-12-26 00:00:00'),
(117, 9, 'SPE_', '', '', 7, 1, '2022-12-06 17:39:33', '2022-12-16 00:00:00'),
(118, 5, 'SPEU_', '', '', 7, 1, '2022-12-07 21:17:59', '2022-12-26 00:00:00'),
(120, 6, 'SPEU_', '', '', 7, 1, '2022-12-07 21:24:39', '2022-12-26 00:00:00'),
(125, 10, 'SPE_', '', '', 0, 0, '2022-12-12 17:38:23', '2022-12-12 17:39:39'),
(126, 11, 'SPE_', '', '', 7, 1, '2022-12-12 17:45:11', '2022-12-26 00:00:00'),
(127, 12, 'SPE_', '', '', 1, 1, '2022-12-12 17:52:20', '2022-12-19 00:00:00'),
(128, 7, 'SPEU_', '', '', 7, 1, '2022-12-12 17:59:00', '2022-12-26 00:00:00'),
(129, 13, 'SPE_', '', '', 7, 1, '2022-12-12 18:01:25', '2022-12-26 00:00:00'),
(132, 8, 'SPEU_', '', '', 7, 1, '2022-12-15 23:37:11', '2022-12-26 00:00:00'),
(133, 14, 'SPE_', '', '', 7, 1, '2022-12-15 23:41:46', '2023-01-03 00:00:00'),
(134, 15, 'SPE_', '', '', 7, 1, '2022-12-15 23:55:02', '2022-12-16 00:00:00'),
(135, 9, 'SPEU_', '', '', 14, 1, '2022-12-16 00:13:26', '2022-12-16 00:00:00'),
(136, 10, 'SPEU_', '', '', 1, 1, '2022-12-16 00:17:01', '2022-12-27 00:00:00'),
(137, 11, 'SPEU_', '', '', 7, 1, '2022-12-16 00:23:43', '2022-12-26 00:00:00'),
(138, 16, 'SPE_', '', '', 7, 1, '2022-12-16 00:27:23', '2022-12-27 00:00:00'),
(140, 17, 'SPE_', '', '', 1, 1, '2022-12-16 13:51:00', '2022-12-19 00:00:00'),
(142, 12, 'SPEU_', '', '', 7, 1, '2022-12-26 19:33:56', '2022-12-26 00:00:00'),
(143, 13, 'SPEU_', '', '', 7, 1, '2022-12-26 19:37:02', '2023-01-03 00:00:00'),
(144, 14, 'SPEU_', '', '', 7, 1, '2022-12-26 19:43:42', '2022-12-27 00:00:00'),
(145, 15, 'SPEU_', '', '', 0, 0, '2022-12-26 19:51:30', '2022-12-26 19:52:14'),
(146, 16, 'SPEU_', '', '', 7, 1, '2022-12-26 20:29:37', '2022-12-27 00:00:00'),
(149, 17, 'SPEU_', '', '', 7, 1, '2022-12-26 20:46:39', '2022-12-27 00:00:00'),
(150, 18, 'SPE_', '', '', 0, 0, '2022-12-27 14:00:21', '2022-12-27 14:01:11'),
(151, 18, 'SPEU_', '', '', 0, 0, '2022-12-27 14:12:33', '2022-12-27 14:13:47'),
(152, 19, 'SPE_', '', '', 7, 1, '2022-12-27 14:20:15', '2023-01-05 00:00:00'),
(153, 19, 'SPEU_', '', '', 0, 0, '2022-12-27 14:33:29', '2022-12-27 14:34:08'),
(154, 20, 'SPEU_', '', '', 0, 0, '2022-12-27 14:35:54', '2022-12-27 14:37:20'),
(155, 20, 'SPE_', '', '', 1, 1, '2022-12-29 12:21:02', '2023-01-12 00:00:00'),
(156, 21, 'SPEU_', '', '', 7, 1, '2023-01-03 17:23:43', '2023-01-03 00:00:00'),
(157, 22, 'SPEU_', '', '', 0, 0, '2023-01-03 17:27:10', '2023-01-03 17:27:48'),
(158, 23, 'SPEU_', '', '', 0, 0, '2023-01-03 17:38:47', '2023-01-03 17:39:21'),
(159, 24, 'SPEU_', '', '', 0, 0, '2023-01-03 17:45:51', '2023-01-03 17:46:36'),
(160, 25, 'SPEU_', '', '', 0, 0, '2023-01-03 17:48:21', '2023-01-03 17:49:01'),
(161, 21, 'SPE_', '', '', 0, 0, '2023-01-03 18:26:12', '2023-01-03 18:26:48'),
(162, 22, 'SPE_', '', '', 0, 0, '2023-01-03 18:27:57', '2023-01-03 18:28:38'),
(164, 23, 'SPE_', '', '', 0, 0, '2023-01-03 18:31:48', '2023-01-03 18:32:21'),
(166, 24, 'SPE_', '', '', 0, 0, '2023-01-03 18:40:16', '2023-01-03 18:40:46'),
(167, 25, 'SPE_', '', '', 0, 0, '2023-01-03 18:42:13', '2023-01-03 18:42:44'),
(168, 26, 'SPE_', '', '', 0, 0, '2023-01-03 18:44:01', '2023-01-03 18:44:29'),
(169, 27, 'SPE_', '', '', 0, 0, '2023-01-03 18:46:02', '2023-01-03 18:46:31'),
(170, 26, 'SPEU_', '', '', 0, 0, '2023-01-04 19:53:38', '2023-01-04 19:54:58'),
(171, 28, 'SPE_', '', '', 1, 1, '2023-01-04 20:00:04', '2023-01-13 00:00:00'),
(172, 27, 'SPEU_', '', '', 0, 0, '2023-01-04 20:03:43', '2023-01-04 20:05:02'),
(173, 28, 'SPEU_', '', '', 14, 1, '2023-01-04 20:26:35', '2023-01-15 00:00:00'),
(174, 29, 'SPEU_', '', '', 7, 1, '2023-01-04 20:29:42', '2023-01-05 00:00:00'),
(176, 30, 'SPEU_', '', '', 0, 0, '2023-01-04 20:41:55', '2023-01-04 20:42:32'),
(177, 31, 'SPEU_', '', '', 7, 1, '2023-01-05 13:36:32', '2023-01-13 00:00:00'),
(178, 32, 'SPEU_', '', '', 7, 1, '2023-01-05 13:46:40', '2023-01-13 00:00:00'),
(179, 33, 'SPEU_', '', '', 0, 0, '2023-01-05 13:49:34', '2023-01-05 13:50:17'),
(180, 34, 'SPEU_', '', '', 0, 0, '2023-01-05 13:53:19', '2023-01-05 13:54:00'),
(181, 29, 'SPE_', '', '', 0, 0, '2023-01-05 13:55:51', '2023-01-05 13:56:22'),
(182, 30, 'SPE_', '', '', 7, 1, '2023-01-05 13:57:51', '2023-01-13 00:00:00'),
(184, 31, 'SPE_', '', '', 0, 0, '2023-01-05 14:00:51', '2023-01-05 14:01:26'),
(185, 35, 'SPEU_', '', '', 0, 0, '2023-01-05 14:02:31', '2023-01-05 14:03:06'),
(186, 36, 'SPEU_', '', '', 7, 1, '2023-01-05 14:16:43', '2023-01-05 00:00:00'),
(187, 37, 'SPEU_', '', '', 7, 1, '2023-01-05 14:20:25', '2023-01-05 00:00:00'),
(189, 38, 'SPEU_', '', '', 0, 0, '2023-01-05 14:24:33', '2023-01-05 14:25:10'),
(192, 39, 'SPEU_', '', '', 14, 1, '2023-01-05 14:34:15', '2023-01-15 00:00:00'),
(193, 40, 'SPEU_', '', '', 0, 0, '2023-01-05 14:37:41', '2023-01-05 14:38:19'),
(194, 41, 'SPEU_', '', '', 0, 0, '2023-01-05 14:45:04', '2023-01-05 14:45:35'),
(195, 42, 'SPEU_', '', '', 7, 1, '2023-01-05 14:53:37', '2023-01-05 00:00:00'),
(197, 43, 'SPEU_', '', '', 14, 1, '2023-01-05 15:43:23', '2023-01-25 00:00:00'),
(198, 44, 'SPEU_', '', '', 0, 0, '2023-01-05 16:31:56', '2023-01-05 16:32:19'),
(199, 32, 'SPE_', '', '', 0, 0, '2023-01-10 23:57:19', '2023-01-10 23:59:11'),
(200, 45, 'SPEU_', '', '', 0, 0, '2023-01-12 15:12:12', '2023-01-12 15:13:54'),
(201, 33, 'SPE_', '', '', 14, 1, '2023-01-12 17:44:51', '2023-01-15 00:00:00'),
(203, 46, 'SPEU_', '', '', 14, 1, '2023-01-15 16:29:48', '2023-01-25 00:00:00'),
(204, 47, 'SPEU_', '', '', 0, 0, '2023-01-15 17:09:35', '2023-01-15 17:10:19'),
(205, 48, 'SPEU_', '', '', 1, 1, '2023-01-17 01:23:17', '2023-01-19 00:00:00'),
(207, 49, 'SPEU_', '', '', 0, 0, '2023-01-17 01:35:27', '2023-01-17 01:36:03'),
(208, 34, 'SPE_', '', '', 0, 0, '2023-01-18 13:40:06', '2023-01-18 13:40:55'),
(209, 50, 'SPEU_', '', '', 0, 0, '2023-01-18 13:56:28', '2023-01-18 13:57:27'),
(210, 29, 'SPE22', '', '', 0, 0, '2023-01-18 13:58:47', '2023-01-18 13:59:34'),
(211, 51, 'SPEU_', '', '', 0, 0, '2023-01-18 14:01:12', '2023-01-18 14:01:59'),
(212, 52, 'SPEU_', '', '', 0, 0, '2023-01-24 00:57:42', '2023-01-24 00:58:34'),
(214, 53, 'SPEU_', '', '', 0, 0, '2023-01-25 00:23:55', '2023-01-25 00:24:31'),
(215, 54, 'SPEU_', '', '', 0, 0, '2023-01-25 00:25:46', '2023-01-25 00:26:25'),
(217, 55, 'SPEU_', '', '', 0, 0, '2023-01-25 00:28:27', '2023-01-25 00:29:13'),
(218, 35, 'SPE_', '', '', 0, 0, '2023-01-25 00:30:11', '2023-01-25 00:30:59'),
(219, 56, 'SPEU_', '', '', 0, 0, '2023-01-25 00:36:41', '2023-01-25 00:37:34'),
(220, 57, 'SPEU_', '', '', 14, 1, '2023-01-25 00:43:09', '2023-01-25 00:00:00'),
(221, 36, 'SPE_', '', '', 0, 0, '2023-01-25 00:45:36', '2023-01-25 00:46:36'),
(222, 58, 'SPEU_', '', '', 0, 0, '2023-01-25 00:48:03', '2023-01-25 00:48:44'),
(223, 37, 'SPE_', '', '', 0, 0, '2023-01-25 00:49:44', '2023-01-25 00:50:24'),
(224, 59, 'SPEU_', '', '', 0, 0, '2023-01-25 00:53:13', '2023-01-25 00:54:11'),
(225, 60, 'SPEU_', '', '', 0, 0, '2023-01-25 00:55:19', '2023-01-25 00:55:59'),
(226, 38, 'SPE_', '', '', 0, 0, '2023-01-25 00:57:22', '2023-01-25 00:58:10'),
(227, 61, 'SPEU_', '', '', 0, 0, '2023-01-25 23:24:06', '2023-01-25 23:25:08'),
(228, 39, 'SPE_', '', '', 0, 0, '2023-01-25 23:30:38', '2023-01-25 23:31:20'),
(229, 62, 'SPEU_', '', '', 0, 0, '2023-01-25 23:33:11', '2023-01-25 23:34:21'),
(230, 63, 'SPEU_', '', '', 0, 0, '2023-01-25 23:46:44', '2023-01-25 23:47:28'),
(231, 40, 'SPE_', '', '', 0, 0, '2023-01-25 23:48:53', '2023-01-25 23:49:30'),
(232, 41, 'SPE_', '', '', 0, 0, '2023-01-25 23:51:03', '2023-01-25 23:51:49'),
(233, 64, 'SPEU_', '', '', 0, 0, '2023-01-25 23:53:04', '2023-01-25 23:53:52'),
(234, 65, 'SPEU_', '', '', 0, 0, '2023-01-25 23:56:36', '2023-01-25 23:57:10'),
(235, 42, 'SPE_', '', '', 0, 0, '2023-01-25 23:58:28', '2023-01-25 23:59:01'),
(236, 66, 'SPEU_', '', '', 0, 0, '2023-01-26 00:01:43', '2023-01-26 00:02:12'),
(237, 43, 'SPE_', '', '', 0, 0, '2023-01-26 00:09:09', '2023-01-26 00:09:50'),
(238, 67, 'SPEU_', '', '', 0, 0, '2023-01-26 00:11:07', '2023-01-26 00:11:47'),
(239, 44, 'SPE_', '', '', 0, 0, '2023-01-26 00:13:38', '2023-01-26 00:14:18'),
(240, 45, 'SPE_', '', '', 0, 0, '2023-01-26 00:16:45', '2023-01-26 00:18:37'),
(241, 46, 'SPE_', '', '', 0, 0, '2023-01-26 00:24:33', '2023-01-26 00:25:13'),
(242, 68, 'SPEU_', '', '', 0, 0, '2023-01-26 00:27:12', '2023-01-26 00:27:47'),
(243, 69, 'SPEU_', '', '', 0, 0, '2023-01-26 00:29:44', '2023-01-26 00:30:13'),
(244, 70, 'SPEU_', '', '', 0, 0, '2023-01-26 00:39:22', '2023-01-26 00:40:15'),
(245, 71, 'SPEU_', '', '', 0, 0, '2023-01-29 23:21:23', '2023-01-29 23:22:10'),
(246, 47, 'SPE_', '', '', 0, 0, '2023-01-29 23:24:11', '2023-01-29 23:24:45'),
(247, 72, 'SPEU_', '', '', 0, 0, '2023-01-29 23:28:49', '2023-01-29 23:29:47'),
(248, 73, 'SPEU_', '', '', 0, 0, '2023-01-29 23:36:05', '2023-01-29 23:37:08'),
(249, 74, 'SPEU_', '', '', 0, 0, '2023-01-29 23:44:11', '2023-01-29 23:44:59'),
(250, 75, 'SPEU_', '', '', 0, 0, '2023-01-29 23:46:31', '2023-01-29 23:47:12');

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
  `tax_rate` float NOT NULL DEFAULT '0',
  `dtCreatedDate` datetime NOT NULL,
  `dtUpdatedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_payment`
--

INSERT INTO `tms_payment` (`iPaymentId`, `iUserId`, `iClientId`, `iType`, `vPaymentInfo`, `vBankInfo`, `tax_rate`, `dtCreatedDate`, `dtUpdatedDate`) VALUES
(1, 0, 2, 2, '{\"tax_id\":\"B95969887\",\"country_code\":\"B9\"}', '{}', 0, '2022-11-02 18:30:39', '2022-11-11 23:39:08'),
(2, 0, 5, 2, '{\"tax_id\":\"00\",\"country_code\":\"00\"}', '{}', 0, '2022-11-03 20:22:04', '2022-11-03 20:22:04'),
(3, 0, 2, 2, '{\"tax_id\":\"B95969887\",\"country_code\":\"B9\"}', '{}', 0, '2022-11-03 20:57:51', '2022-11-11 23:39:08'),
(4, 0, 6, 2, '{\"tax_id\":\"NO921813201\",\"country_code\":\"NO\"}', '{}', 0, '2022-11-04 11:32:17', '2022-11-04 11:32:17'),
(6, 0, 4, 2, '{\"tax_id\":\"NO813998262\",\"country_code\":\"NO\",\"memos\":\"Test client number\"}', '{}', 0, '2022-11-08 16:34:32', '2022-12-27 18:33:34'),
(7, 0, 4, 2, '{\"tax_id\":\"NO813998262\",\"country_code\":\"NO\",\"memos\":\"Test client number\"}', '{}', 0, '2022-11-09 10:05:51', '2022-12-27 18:33:34'),
(8, 0, 8, 2, '{\"tax_id\":\"12345678\",\"country_code\":\"12\"}', '{}', 0, '2022-11-10 15:56:02', '2022-11-10 15:56:02'),
(10, 0, 9, 2, '{\"tax_id\":\"HE348535\",\"country_code\":\"HE\",\"memos\":\"5 days after invoice issued.\"}', '{}', 0, '2022-11-11 16:15:16', '2022-11-11 16:15:16'),
(12, 0, 10, 2, '{\"tax_id\":\"123456789\",\"country_code\":\"12\"}', '{}', 0, '2022-11-16 16:48:28', '2022-11-16 16:48:28'),
(13, 0, 11, 2, '{\"tax_id\":\"IT01287540445\",\"country_code\":\"IT\"}', '{}', 0, '2022-11-16 16:59:57', '2022-12-15 10:14:41'),
(15, 0, 12, 2, '{\"tax_id\":\"NO930090581\",\"country_code\":\"NO\"}', '{}', 0, '2022-11-18 00:31:22', '2022-11-18 00:31:22'),
(16, 0, 13, 2, '{\"tax_id\":\"NO813998262\",\"country_code\":\"NO\"}', '{}', 0, '2022-11-18 15:55:15', '2022-11-18 15:55:15'),
(18, 0, 14, 2, '{\"tax_id\":\"FIFI24937682\",\"country_code\":\"FI\",\"memos\":\"Nynorsk Projects to be invoiced to: lingsoftlanguageservices@heeros-invoices-fi.com\"}', '{}', 0, '2022-12-01 17:08:08', '2023-01-13 21:18:33'),
(19, 0, 16, 2, '{\"tax_id\":\"ITIT07550840727\",\"country_code\":\"IT\"}', '{}', 0, '2022-12-01 20:03:34', '2022-12-01 20:03:34'),
(21, 0, 11, 2, '{\"tax_id\":\"IT01287540445\",\"country_code\":\"IT\"}', '{}', 0, '2022-12-15 10:15:02', '2022-12-15 10:15:02'),
(22, 0, 24, 2, '{\"tax_id\":\"NL819140223B01\",\"country_code\":\"NL\",\"memos\":\"Invoice via XTRF\"}', '{}', 0, '2023-01-03 17:37:22', '2023-01-13 14:20:40'),
(23, 0, 25, 2, '{\"tax_id\":\"NO985538921\",\"country_code\":\"NO\",\"memos\":\"Vendor ID: P003GTO\"}', '{}', 6, '2023-01-05 14:12:20', '2023-01-05 16:41:03'),
(24, 0, 26, 2, '{\"tax_id\":\"GB900548841\",\"country_code\":\"GB\",\"memos\":\"Vendor ID: P003GTO\"}', '{}', 0, '2023-01-05 15:43:02', '2023-01-05 15:43:18'),
(25, 0, 17, 2, '{\"tax_id\":\"NL814152016B01\",\"country_code\":\"NL\"}', '{}', 0, '2023-01-05 16:50:36', '2023-01-05 16:50:36'),
(26, 0, 23, 2, '{\"memos\":\"Send invoice to invoice@hkgsl.com\",\"tax_id\":\"NO930090581\",\"country_code\":\"NO\"}', '{}', 0, '2023-01-13 14:51:03', '2023-01-13 14:51:03'),
(27, 0, 14, 2, '{\"tax_id\":\"FIFI24937682\",\"country_code\":\"FI\",\"memos\":\"Nynorsk Projects to be invoiced to: lingsoftlanguageservices@heeros-invoices-fi.com\"}', '{}', 0, '2023-01-13 21:18:25', '2023-01-13 21:18:33'),
(28, 0, 29, 2, '{\"tax_id\":\"IT10818950965\",\"country_code\":\"IT\"}', '{}', 0, '2023-01-29 23:43:19', '2023-01-29 23:43:19');

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
(7, 'Update', 'UPD', 1, 0, '2021-07-22 14:01:29', '2022-12-13 19:00:39'),
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
  `total_price` float NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_summmery_view`
--

INSERT INTO `tms_summmery_view` (`job_summmeryId`, `per_id`, `order_id`, `item_id`, `job_id`, `job_chain_id`, `appr_id`, `master_job_id`, `job_no`, `job_code`, `order_no`, `po_number`, `tmp_po_number`, `description`, `resource`, `due_date`, `contact_person`, `item_status`, `company_code`, `work_instruction`, `ItemLanguage`, `specialization`, `negative_feedback`, `late_delivery`, `auto_job`, `auto_status`, `rejection`, `price`, `total_price`, `created_date`, `updated_date`) VALUES
(4, 0, 25, 1, 7, 17, 0, 7, '1', 'SEO', '', 'SPE220002_SEO001', 'SPE220002_SEO001', 'test', '4', '2022-10-31 16:00:00', '1', 'Completed', 'SPE220002', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-11-03 21:14:51', '2022-11-10 14:40:32'),
(5, 0, 25, 1, 4, 17, 0, 4, '2', 'DTC', '', 'SPE220002_DTC002', 'SPE220002_DTC002', '', '4', '2022-10-31 16:00:00', '1', 'Completed', 'SPE220002', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-11-03 21:14:51', '2022-11-03 21:44:36'),
(6, 0, 25, 1, 3, 0, 0, 3, '3', 'DTP', '', 'SPE220002_DTP003', 'SPE220002_DTP003', '', '4', '2022-10-31 16:00:00', '1', 'Completed', 'SPE220002', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-11-03 21:14:51', '2022-11-03 21:44:49'),
(7, 0, 27, 1, 1, 0, 0, 1, '1', 'BAD', '', 'SPE220003_BAD001', 'SPE220003_BAD001', '', '4', '2022-11-03 17:00:00', '1', 'Completed', 'SPE220003', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-11-03 22:00:58', '2022-11-03 22:02:18'),
(8, 0, 29, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE220004_PRF001', 'SPE220004_PRF001', '', '4', '2022-11-04 17:00:00', '1', 'Completed', 'SPE220004', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-11-04 16:29:47', '2022-11-04 16:30:28'),
(9, 0, 31, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE220005_PRF001', 'SPE220005_PRF001', '', '4', '2022-11-03 12:00:00', '1', 'Delivered', 'SPE220005', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-11-04 16:43:32', '2022-11-04 16:43:51'),
(10, 0, 33, 1, 0, 0, 0, 9, '1', 'TRA', '', 'SPE220006_TRA001', 'SPE220006_TRA001', '', '4', '2022-11-03 12:00:00', '1', 'Delivered', 'SPE220006', '[]', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', 0, '2022-11-04 16:54:14', '2022-11-04 16:55:20'),
(13, 0, 37, 1, 0, 0, 0, 10, '1', 'PRF', '', 'SPE220007_PRF001', 'SPE220007_PRF001', '', '4', '2022-11-04 09:00:00', '1', 'Delivered', 'SPE220007', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-11-08 13:46:03', '2022-11-08 13:46:37'),
(14, 0, 38, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE220008_PRF001', 'SPE220008_PRF001', '', '4', '2022-11-04 09:00:00', '1', 'Delivered', 'SPE220008', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-11-08 13:50:31', '2022-11-08 13:50:49'),
(16, 0, 46, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE220009_PRF001', 'SPE220009_PRF001', '', '4', '2022-11-08 17:00:00', '1', 'Delivered', 'SPE220009', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-11-08 18:07:08', '2022-11-08 18:07:32'),
(18, 0, 49, 1, 0, 0, 0, 9, '1', 'TRA', '', 'SPE220010_TRA001', 'SPE220010_TRA001', '', '8', '2022-11-09 11:00:00', '1', 'Delivered', 'SPE220010', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-11-10 16:01:37', '2022-11-10 16:02:23'),
(19, 0, 51, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE220011_PRF001', 'SPE220011_PRF001', '', '8', '2022-11-09 12:00:00', '1', 'Delivered', 'SPE220011', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-11-10 16:38:34', '2022-11-10 16:38:46'),
(20, 0, 55, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPEU_0001_TRA001', 'SPEU_0001_TRA001', '', '', '2022-11-09 17:00:00', '1', 'New', '', '', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', 0, '2022-11-11 16:35:00', '2022-11-11 16:35:00'),
(21, 0, 55, 2, 9, NULL, 0, 9, '2', 'TRA', '', 'SPEU_0001_TRA002', 'SPEU_0001_TRA002', '', '', '2022-11-10 17:00:00', '1', 'New', '', '', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', 0, '2022-11-11 16:35:36', '2022-11-11 16:35:36'),
(22, 0, 55, 4, 9, 0, 0, 9, '3', 'TRA', '', 'SPEU_0001_TRA003', 'SPEU_0001_TRA003', '', '22', '2022-11-14 17:00:00', '1', 'In-progress', 'SPEU_0001', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '[]', 0, '2022-11-11 16:36:49', '2023-01-27 23:21:01'),
(23, 0, 55, 3, 9, NULL, 0, 9, '4', 'TRA', '', 'SPEU_0001_TRA004', 'SPEU_0001_TRA004', '', '', '2022-11-14 17:00:00', '1', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-11-11 16:38:58', '2022-11-11 16:38:58'),
(24, 0, 55, 5, 0, NULL, 0, 9, '5', 'TRA', '', 'SPEU_0001_TRA005', 'SPEU_0001_TRA005', '', '', '2022-12-19 17:00:00', '1', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-11-11 16:39:52', '2022-11-11 16:39:52'),
(25, 0, 55, 6, 9, NULL, 0, 9, '6', 'TRA', '', 'SPEU_0001_TRA006', 'SPEU_0001_TRA006', '', '', '2022-12-19 17:00:00', '1', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-11-11 16:50:29', '2022-11-11 16:50:29'),
(26, 0, 55, 7, 9, NULL, 0, 9, '7', 'TRA', '', 'SPEU_0001_TRA007', 'SPEU_0001_TRA007', '', '', '2022-12-19 17:00:00', '1', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-11-11 17:15:13', '2022-11-11 17:15:13'),
(27, 0, 55, 8, 9, NULL, 0, 9, '8', 'TRA', '', 'SPEU_0001_TRA008', 'SPEU_0001_TRA008', '', '', '2022-12-19 17:00:00', '1', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-11-11 17:16:35', '2022-11-11 17:16:35'),
(28, 0, 55, 9, 9, NULL, 0, 9, '9', 'TRA', '', 'SPEU_0001_TRA009', 'SPEU_0001_TRA009', '', '', '2022-12-19 17:00:00', '1', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-11-11 17:18:03', '2022-11-11 17:18:03'),
(29, 0, 55, 10, 0, NULL, 0, 9, '10', 'TRA', '', 'SPEU_0001_TRA010', 'SPEU_0001_TRA010', '', '', '2022-12-19 17:00:00', '1', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-11-11 17:18:42', '2022-11-11 17:18:42'),
(30, 0, 55, 11, 9, NULL, 0, 9, '11', 'TRA', '', 'SPEU_0001_TRA011', 'SPEU_0001_TRA011', '', '', '2022-12-19 17:00:00', '1', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-11-11 17:20:40', '2022-11-11 17:20:40'),
(31, 0, 55, 12, 0, NULL, 0, 9, '12', 'TRA', '', 'SPEU_0001_TRA012', 'SPEU_0001_TRA012', '', '', '2022-12-19 17:00:00', '1', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-11-11 17:21:22', '2022-11-11 17:21:22'),
(32, 0, 55, 13, 9, NULL, 0, 9, '13', 'TRA', '', 'SPEU_0001_TRA013', 'SPEU_0001_TRA013', '', '', '2022-12-19 17:00:00', '1', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-11-11 17:21:55', '2022-11-11 17:21:55'),
(33, 0, 55, 14, 9, NULL, 0, 9, '14', 'TRA', '', 'SPEU_0001_TRA014', 'SPEU_0001_TRA014', '', '', '2022-12-19 17:00:00', '1', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-11-11 17:22:31', '2022-11-11 17:22:31'),
(34, 0, 55, 15, 9, NULL, 0, 9, '15', 'TRA', '', 'SPEU_0001_TRA015', 'SPEU_0001_TRA015', '', '', '2022-11-10 17:00:00', '1', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-11-11 19:00:30', '2022-11-11 19:00:30'),
(36, 0, 59, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE220013_PRF001', 'SPE220013_PRF001', '', '8', '2022-11-14 11:00:00', '1', 'Delivered', 'SPE220013', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-11-16 16:27:56', '2022-11-16 16:30:24'),
(37, 0, 61, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE220014_PRF001', 'SPE220014_PRF001', '', '8', '2022-11-15 12:00:00', '1', 'Delivered', 'SPE220014', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-11-16 16:36:00', '2022-11-16 16:36:22'),
(38, 0, 62, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPE_0001_TRA001', 'SPE_0001_TRA001', '', '8', '2022-11-16 12:00:00', '1', 'Delivered', 'SPE_0001', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-11-16 16:51:34', '2022-11-16 16:51:59'),
(39, 0, 63, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPE_0002_TRA001', 'SPE_0002_TRA001', '', '8', '2022-11-15 12:00:00', '1', 'Delivered', 'SPE_0002', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-11-16 17:02:28', '2022-11-16 17:02:43'),
(40, 0, 64, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE220015_PRF001', 'SPE220015_PRF001', '', '8', '2022-11-15 12:00:00', '1', 'Delivered', 'SPE220015', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-11-16 17:06:41', '2022-11-16 17:07:02'),
(44, 0, 74, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE220016_PRF001', 'SPE220016_PRF001', '', '8', '2022-11-17 19:00:00', '7', 'Delivered', 'SPE220016', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-11-18 23:53:36', '2022-11-18 23:54:00'),
(45, 0, 76, 1, 0, 0, 0, 10, '1', 'PRF', '', 'SPE220017_PRF001', 'SPE220017_PRF001', '', '8', '2022-11-18 19:00:00', '7', 'Delivered', 'SPE220017', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-11-18 23:58:25', '2022-11-18 23:58:40'),
(53, 0, 83, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE22,SPE_0001_PRF001', 'SPE22,SPE_0001_PRF001', '', '8', '1970-01-01 05:30:00', '1', 'Delivered', 'SPE22,SPE_0001', '[]', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-01 16:01:48', '2022-12-01 16:02:13'),
(54, 0, 84, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE22,SPE_0002_PRF001', 'SPE22,SPE_0002_PRF001', '', '8', '2022-11-22 11:40:00', '1', 'Delivered', 'SPE22,SPE_0002', '[]', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-01 16:10:13', '2022-12-01 16:10:39'),
(55, 0, 86, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPE_0004_TRA001', 'SPE_0004_TRA001', '', '8', '2022-11-24 12:01:00', '1', 'Delivered', 'SPE_0004', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-01 16:31:39', '2022-12-01 16:32:01'),
(56, 0, 87, 1, 0, 0, 0, 10, '1', 'PRF', '', 'SPE_0005_PRF001', 'SPE_0005_PRF001', '', '8', '2022-11-25 12:46:00', '1', 'Delivered', 'SPE_0005', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-01 17:16:22', '2022-12-01 17:16:52'),
(57, 0, 88, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE22,SPE_0003_PRF001', 'SPE22,SPE_0003_PRF001', '', '8', '1970-01-01 05:30:00', '1', 'Delivered', 'SPE22,SPE_0003', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-01 17:51:58', '2022-12-01 17:52:10'),
(58, 0, 89, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPE_0006_TRA001', 'SPE_0006_TRA001', '', '8', '1970-01-01 05:30:00', '1', 'Delivered', 'SPE_0006', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-01 18:09:54', '2022-12-01 18:10:11'),
(59, 0, 91, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPE_0007_TRA001', 'SPE_0007_TRA001', '', '8', '2022-11-28 15:02:00', '1', 'Delivered', 'SPE_0007', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-01 19:22:01', '2022-12-01 19:33:00'),
(60, 0, 92, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE_0008_PRF001', 'SPE_0008_PRF001', '', '8', '1970-01-01 05:30:00', '1', 'Delivered', 'SPE_0008', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-01 19:48:20', '2022-12-01 19:48:38'),
(62, 0, 94, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPE_0010_TRA001', 'SPE_0010_TRA001', '', '8', '2022-11-30 15:47:00', '1', 'Delivered', 'SPE_0010', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-01 20:17:27', '2022-12-01 20:17:52'),
(63, 0, 95, 1, 0, 0, 0, 10, '1', 'PRF', '', 'SPE22,SPE_0004_PRF001', 'SPE22,SPE_0004_PRF001', '', '8', '2022-12-01 15:57:00', '1', 'Delivered', 'SPE22,SPE_0004', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-01 20:27:04', '2022-12-01 20:27:26'),
(66, 0, 98, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE220020_PRF001', 'SPE220020_PRF001', '', '8', '2022-11-18 16:24:00', '1', 'Delivered', 'SPE220020', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-01 20:53:50', '2022-12-01 20:54:10'),
(68, 0, 101, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE220022_PRF001', 'SPE220022_PRF001', '', '8', '2022-11-21 05:30:00', '1', 'Delivered', 'SPE220022', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-01 22:13:23', '2022-12-01 22:14:18'),
(69, 0, 102, 1, 0, 0, 0, 10, '1', 'PRF', '', 'SPE220023_PRF001', 'SPE220023_PRF001', '', '8', '2022-11-21 17:51:00', '1', 'Delivered', 'SPE220023', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-01 22:20:35', '2022-12-01 22:21:06'),
(72, 0, 106, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE22,SPE_0005_PRF001', 'SPE22,SPE_0005_PRF001', '', '8', '1970-01-01 05:30:00', '1', 'Delivered', 'SPE22,SPE_0005', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-02 14:29:35', '2022-12-02 14:29:59'),
(75, 0, 109, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPE220028_TRA001', 'SPE220028_TRA001', '', '8', '1970-01-01 05:30:00', '1', 'Delivered', 'SPE220028', '[]', 'Norwegian (bokmal) > English (US)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-02 14:54:37', '2022-12-02 14:54:47'),
(81, 0, 111, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPEU_0002_TRA001', 'SPEU_0002_TRA001', '', '8', '2022-12-02 15:00:00', '1', 'Delivered', 'SPEU_0002', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-05 20:47:07', '2022-12-05 20:47:40'),
(82, 0, 112, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPEU_0003_TRA001', 'SPEU_0003_TRA001', '', '8', '2022-12-02 16:00:00', '1', 'Delivered', 'SPEU_0003', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-05 21:00:00', '2022-12-05 21:23:47'),
(83, 0, 113, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPEU_0004_PRF001', 'SPEU_0004_PRF001', '', '8', '2022-12-05 08:00:00', '1', 'Delivered', 'SPEU_0004', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-05 21:26:40', '2022-12-05 21:27:10'),
(84, 0, 114, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPE_0007_TRA001', 'SPE_0007_TRA001', '', '8', '2022-12-06 17:00:00', '1', 'Delivered', 'SPE_0007', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-05 21:29:49', '2022-12-05 21:31:02'),
(85, 0, 116, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPE_0008_TRA001', 'SPE_0008_TRA001', '', '8', '2022-12-06 13:00:00', '1', 'Delivered', 'SPE_0008', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-06 17:31:59', '2022-12-06 17:32:55'),
(87, 0, 118, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPEU_0005_TRA001', 'SPEU_0005_TRA001', '', '8', '2022-12-11 16:00:00', '1', 'Delivered', 'SPEU_0005', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-07 21:19:36', '2022-12-07 21:20:00'),
(88, 0, 120, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPEU_0006_PRF001', 'SPEU_0006_PRF001', '', '8', '2022-12-07 09:00:00', '1', 'Delivered', 'SPEU_0006', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-07 21:26:05', '2022-12-07 21:26:27'),
(89, 0, 125, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE_0010_PRF001', 'SPE_0010_PRF001', '', '8', '2022-12-07 14:00:00', '1', 'Delivered', 'SPE_0010', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-12 17:42:26', '2022-12-12 17:43:05'),
(90, 0, 126, 1, 0, 0, 0, 9, '1', 'TRA', '', 'SPE_0011_TRA001', 'SPE_0011_TRA001', '', '8', '2022-12-08 11:45:00', '1', 'Delivered', 'SPE_0011', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-12 17:50:51', '2022-12-12 17:51:51'),
(91, 0, 127, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPE_0012_TRA001', 'SPE_0012_TRA001', '', '8', '2022-12-08 16:00:00', '1', 'Delivered', 'SPE_0012', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-12 17:56:24', '2022-12-12 17:58:14'),
(92, 0, 128, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPEU_0007_PRF001', 'SPEU_0007_PRF001', '', '8', '2022-12-09 12:00:00', '1', 'Delivered', 'SPEU_0007', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-12 18:00:43', '2022-12-12 18:01:03'),
(93, 0, 129, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPE_0013_TRA001', 'SPE_0013_TRA001', '', '8', '2022-12-09 17:00:00', '1', 'Delivered', 'SPE_0013', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-12 18:04:13', '2022-12-12 18:04:30'),
(96, 0, 132, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPEU_0008_TRA001', 'SPEU_0008_TRA001', '', '8', '2022-12-12 13:00:00', '1', 'Delivered', 'SPEU_0008', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-15 23:39:10', '2022-12-15 23:41:02'),
(98, 0, 134, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPE_0015_TRA001', 'SPE_0015_TRA001', '', '8', '2022-12-12 10:00:00', '1', 'Delivered', 'SPE_0015', '[]', 'Norwegian (bokmal) > English (US)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-15 23:57:03', '2022-12-15 23:57:22'),
(99, 0, 135, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPEU_0009_PRF001', 'SPEU_0009_PRF001', '', '8', '2022-12-12 19:00:00', '1', 'Without invoice', 'SPEU_0009', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-16 00:14:50', '2022-12-16 13:48:44'),
(100, 0, 136, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPEU_0010_PRF001', 'SPEU_0010_PRF001', '', '8', '2022-12-12 13:00:00', '1', 'Delivered', 'SPEU_0010', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-16 00:18:59', '2022-12-16 00:20:14'),
(101, 0, 137, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPEU_0011_PRF001', 'SPEU_0011_PRF001', '', '8', '2022-12-13 15:00:00', '1', 'Delivered', 'SPEU_0011', '[]', 'Norwegian (bokmal) > English (US)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-16 00:25:41', '2022-12-16 00:26:09'),
(103, 0, 140, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE_0017_PRF001', 'SPE_0017_PRF001', '', '8', '2022-12-14 10:00:00', '1', 'Without invoice', 'SPE_0017', '[]', 'English (US) > Norwegian (nynorsk)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-16 13:52:40', '2022-12-16 13:53:11'),
(104, 0, 143, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPEU_0013_TRA001', 'SPEU_0013_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-26 19:40:18', '2022-12-26 19:40:18'),
(105, 0, 142, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPEU_0012_TRA001', 'SPEU_0012_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-26 19:42:15', '2022-12-26 19:42:15'),
(106, 0, 144, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPEU_0014_TRA001', 'SPEU_0014_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-26 19:45:11', '2022-12-26 19:45:11'),
(107, 0, 145, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPEU_0015_TRA001', 'SPEU_0015_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-26 19:53:34', '2022-12-26 19:53:34'),
(108, 0, 146, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPEU_0016_TRA001', 'SPEU_0016_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-26 20:32:15', '2022-12-26 20:32:15'),
(109, 0, 146, 2, 9, NULL, 0, 9, '2', 'TRA', '', 'SPEU_0016_TRA002', 'SPEU_0016_TRA002', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-26 20:33:06', '2022-12-26 20:33:06'),
(111, 0, 149, 2, 9, NULL, 0, 9, '2', 'TRA', '', 'SPEU_0017_TRA002', 'SPEU_0017_TRA002', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-26 20:49:49', '2022-12-26 20:49:49'),
(112, 0, 150, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPE_0018_TRA001', 'SPE_0018_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-27 14:02:04', '2022-12-27 14:02:04'),
(113, 0, 151, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPEU_0018_TRA001', 'SPEU_0018_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-27 14:14:51', '2022-12-27 14:14:51'),
(115, 0, 153, 1, 0, NULL, 0, 9, '1', 'TRA', '', 'SPEU_0019_TRA001', 'SPEU_0019_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-27 14:34:51', '2022-12-27 14:34:51'),
(116, 0, 154, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPEU_0020_TRA001', 'SPEU_0020_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', 0, '2022-12-27 14:37:47', '2022-12-27 14:37:47'),
(119, 0, 156, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPEU_0021_TRA001', 'SPEU_0021_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-03 17:26:49', '2023-01-03 17:26:49'),
(120, 0, 157, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPEU_0022_TRA001', 'SPEU_0022_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-03 17:28:27', '2023-01-03 17:28:27'),
(121, 0, 158, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPEU_0023_TRA001', 'SPEU_0023_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-03 17:40:29', '2023-01-03 17:40:29'),
(122, 0, 159, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPEU_0024_TRA001', 'SPEU_0024_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-03 17:47:32', '2023-01-03 17:47:32'),
(123, 0, 160, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPEU_0025_TRA001', 'SPEU_0025_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-03 17:49:46', '2023-01-03 17:49:46'),
(124, 0, 161, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPE_0021_TRA001', 'SPE_0021_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-03 18:27:35', '2023-01-03 18:27:35'),
(125, 0, 162, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPE_0022_TRA001', 'SPE_0022_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-03 18:29:27', '2023-01-03 18:29:27'),
(126, 0, 164, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPE_0023_TRA001', 'SPE_0023_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-03 18:32:53', '2023-01-03 18:32:53'),
(127, 0, 166, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPE_0024_TRA001', 'SPE_0024_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-03 18:41:26', '2023-01-03 18:41:26'),
(128, 0, 167, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPE_0025_TRA001', 'SPE_0025_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-03 18:43:21', '2023-01-03 18:43:21'),
(129, 0, 168, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPE_0026_TRA001', 'SPE_0026_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-03 18:45:05', '2023-01-03 18:45:05'),
(130, 0, 169, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPE_0027_TRA001', 'SPE_0027_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-03 18:47:08', '2023-01-03 18:47:08'),
(131, 0, 170, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPEU_0026_TRA001', 'SPEU_0026_TRA001', '', '8', '2022-12-26 15:26:00', '1', 'Delivered', 'SPEU_0026', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-04 19:56:06', '2023-01-04 19:56:33'),
(132, 0, 171, 1, 0, 0, 0, 10, '1', 'PRF', '', 'SPE_0028_PRF001', 'SPE_0028_PRF001', '', '8', '2022-12-21 15:00:00', '1', 'Delivered', 'SPE_0028', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-04 20:01:50', '2023-01-04 20:02:57'),
(133, 0, 172, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPEU_0027_TRA001', 'SPEU_0027_TRA001', '', '8', '2022-12-09 15:00:00', '1', 'Delivered', 'SPEU_0027', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-04 20:05:50', '2023-01-04 20:06:19'),
(134, 0, 173, 1, 12, 0, 0, 12, '1', 'MTP', '', 'SPEU_0028_MTP001', 'SPEU_0028_MTP001', '', '8', '2022-12-31 15:00:00', '1', 'Delivered', 'SPEU_0028', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-04 20:28:02', '2023-01-04 20:28:32'),
(135, 0, 174, 1, 0, 0, 0, 9, '1', 'TRA', '', 'SPEU_0029_TRA001', 'SPEU_0029_TRA001', '', '8', '2022-12-23 16:00:00', '7', 'Delivered', 'SPEU_0029', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-04 20:31:28', '2023-01-04 20:32:13'),
(137, 0, 176, 1, 9, NULL, 0, 9, '1', 'TRA', '', '', '', '', '', '0000-00-00 00:00:00', '', 'New', '', '', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-04 20:45:11', '2023-01-04 20:45:11'),
(143, 0, 178, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPEU_0032_TRA001', 'SPEU_0032_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-05 13:48:18', '2023-01-05 13:48:18'),
(144, 0, 179, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPEU_0033_TRA001', 'SPEU_0033_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-05 13:51:13', '2023-01-05 13:51:13'),
(145, 0, 179, 2, 9, NULL, 0, 9, '2', 'TRA', '', 'SPEU_0033_TRA002', 'SPEU_0033_TRA002', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-05 13:52:50', '2023-01-05 13:52:50'),
(146, 0, 180, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPEU_0034_TRA001', 'SPEU_0034_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-05 13:55:11', '2023-01-05 13:55:11'),
(147, 0, 181, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPE_0029_TRA001', 'SPE_0029_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-05 13:57:23', '2023-01-05 13:57:23'),
(148, 0, 182, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPE_0030_TRA001', 'SPE_0030_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-05 13:59:29', '2023-01-05 13:59:29'),
(149, 0, 184, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPE_0031_TRA001', 'SPE_0031_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-05 14:02:01', '2023-01-05 14:02:01'),
(150, 0, 185, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPEU_0035_TRA001', 'SPEU_0035_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-05 14:03:40', '2023-01-05 14:03:40'),
(152, 0, 187, 1, 0, NULL, 0, 12, '1', 'MTP', '', 'SPEU_0037_MTP001', 'SPEU_0037_MTP001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-05 14:21:36', '2023-01-05 14:21:36'),
(153, 0, 187, 2, 12, NULL, 0, 12, '2', 'MTP', '', 'SPEU_0037_MTP002', 'SPEU_0037_MTP002', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-05 14:22:28', '2023-01-05 14:22:28'),
(154, 0, 189, 1, 12, NULL, 0, 12, '1', 'MTP', '', 'SPEU_0038_MTP001', 'SPEU_0038_MTP001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-05 14:26:12', '2023-01-05 14:26:12'),
(155, 0, 189, 2, 0, NULL, 0, 12, '2', 'MTP', '', 'SPEU_0038_MTP002', 'SPEU_0038_MTP002', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-05 14:27:45', '2023-01-05 14:27:45'),
(156, 0, 189, 3, 0, NULL, 0, 12, '3', 'MTP', '', 'SPEU_0038_MTP003', 'SPEU_0038_MTP003', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-05 14:29:25', '2023-01-05 14:29:25'),
(157, 0, 192, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPEU_0039_TRA001', 'SPEU_0039_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-05 14:35:35', '2023-01-05 14:35:35'),
(158, 0, 192, 2, 12, NULL, 0, 12, '2', 'MTP', '', 'SPEU_0039_MTP002', 'SPEU_0039_MTP002', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-05 14:36:50', '2023-01-05 14:36:50'),
(159, 0, 193, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPEU_0040_TRA001', 'SPEU_0040_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-05 14:42:21', '2023-01-05 14:42:21'),
(160, 0, 193, 2, 9, NULL, 0, 9, '2', 'TRA', '', 'SPEU_0040_TRA002', 'SPEU_0040_TRA002', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-05 14:43:49', '2023-01-05 14:43:49'),
(161, 0, 194, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPEU_0041_TRA001', 'SPEU_0041_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-05 14:46:11', '2023-01-05 14:46:11'),
(164, 0, 197, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPEU_0043_TRA001', 'SPEU_0043_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-05 15:44:43', '2023-01-05 15:44:43'),
(165, 0, 33, 2, 9, NULL, 0, 9, '2', 'TRA', '', 'SPE220006_TRA002', 'SPE220006_TRA002', '', '', '0000-00-00 00:00:00', '1', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-05 16:22:53', '2023-01-05 16:22:53'),
(166, 0, 33, 3, 9, NULL, 0, 9, '3', 'TRA', '', 'SPE220006_TRA003', 'SPE220006_TRA003', '', '', '0000-00-00 00:00:00', '1', 'New', '', '', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-05 16:23:38', '2023-01-05 16:23:38'),
(167, 0, 198, 1, 10, NULL, 0, 10, '1', 'PRF', '', 'SPEU_0044_PRF001', 'SPEU_0044_PRF001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-05 16:32:50', '2023-01-05 16:32:50'),
(168, 0, 199, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPE_0032_TRA001', 'SPE_0032_TRA001', '', '8', '2023-01-10 15:00:00', '7', 'Delivered', 'SPE_0032', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-11 00:01:03', '2023-01-11 00:05:01'),
(169, 0, 200, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPEU_0045_TRA001', 'SPEU_0045_TRA001', '', '8', '2023-01-16 10:00:00', '7', 'Delivered', 'SPEU_0045', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-12 15:15:32', '2023-01-12 15:16:21'),
(170, 0, 201, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPE_0033_TRA001', 'SPE_0033_TRA001', '', '8', '2023-01-12 12:00:00', '7', 'Delivered', 'SPE_0033', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-12 17:46:27', '2023-01-12 17:46:52'),
(171, 0, 178, 2, 9, NULL, 0, 9, '2', 'TRA', '', 'SPEU_0032_TRA002', 'SPEU_0032_TRA002', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-13 14:18:48', '2023-01-13 14:18:48'),
(172, 0, 203, 1, 12, 0, 0, 12, '1', 'MTP', '', 'SPEU_0046_MTP001', 'SPEU_0046_MTP001', '', '8', '2023-01-12 12:00:00', '7', 'Delivered', 'SPEU_0046', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-15 16:31:06', '2023-01-15 16:32:31'),
(173, 0, 203, 2, 12, 0, 0, 12, '2', 'MTP', '', 'SPEU_0046_MTP002', 'SPEU_0046_MTP002', '', '8', '2023-01-12 12:00:00', '7', 'Delivered', 'SPEU_0046', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-15 16:36:19', '2023-01-15 16:38:23'),
(174, 0, 203, 3, 12, 0, 0, 12, '3', 'MTP', '', 'SPEU_0046_MTP003', 'SPEU_0046_MTP003', '', '8', '2023-01-12 12:00:00', '7', 'Delivered', 'SPEU_0046', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-15 16:40:06', '2023-01-15 16:40:32'),
(175, 0, 203, 4, 12, 0, 0, 12, '4', 'MTP', '', 'SPEU_0046_MTP004', 'SPEU_0046_MTP004', '', '8', '2023-01-12 12:00:00', '7', 'Delivered', 'SPEU_0046', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-15 16:41:48', '2023-01-15 16:43:12'),
(176, 0, 203, 5, 12, 0, 0, 12, '5', 'MTP', '', 'SPEU_0046_MTP005', 'SPEU_0046_MTP005', '', '8', '2023-01-12 12:00:00', '7', 'Delivered', 'SPEU_0046', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-15 16:44:10', '2023-01-15 16:45:31'),
(177, 0, 201, 2, 9, 0, 0, 9, '2', 'TRA', '', 'SPE_0033_TRA002', 'SPE_0033_TRA002', '', '8', '2023-01-12 12:00:00', '7', 'Delivered', 'SPE_0033', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-15 16:56:20', '2023-01-15 17:04:36'),
(178, 0, 201, 3, 9, 0, 0, 9, '3', 'TRA', '', 'SPE_0033_TRA003', 'SPE_0033_TRA003', '', '8', '2023-01-12 12:00:00', '7', 'Delivered', 'SPE_0033', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-15 16:56:45', '2023-01-15 17:04:52'),
(179, 0, 201, 4, 9, 0, 0, 9, '4', 'TRA', '', 'SPE_0033_TRA004', 'SPE_0033_TRA004', '', '8', '2023-01-12 12:00:00', '7', 'Delivered', 'SPE_0033', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-15 16:57:09', '2023-01-15 17:05:08'),
(180, 0, 201, 5, 9, 0, 0, 9, '5', 'TRA', '', 'SPE_0033_TRA005', 'SPE_0033_TRA005', '', '8', '2023-01-12 12:00:00', '7', 'Delivered', 'SPE_0033', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-15 16:57:33', '2023-01-15 17:05:22'),
(181, 0, 201, 6, 9, 0, 0, 9, '6', 'TRA', '', 'SPE_0033_TRA006', 'SPE_0033_TRA006', '', '8', '2023-01-12 12:00:00', '7', 'Delivered', 'SPE_0033', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-15 16:57:54', '2023-01-15 17:05:36'),
(182, 0, 201, 7, 0, 0, 0, 9, '7', 'TRA', '', 'SPE_0033_TRA007', 'SPE_0033_TRA007', '', '8', '2023-01-12 12:00:00', '7', 'Delivered', 'SPE_0033', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-15 16:58:18', '2023-01-15 17:05:53'),
(183, 0, 201, 8, 0, 0, 0, 9, '8', 'TRA', '', 'SPE_0033_TRA008', 'SPE_0033_TRA008', '', '8', '2023-01-12 12:00:00', '7', 'Delivered', 'SPE_0033', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-15 16:58:43', '2023-01-15 17:06:08'),
(184, 0, 204, 1, 0, 0, 0, 12, '1', 'MTP', '', 'SPEU_0047_MTP001', 'SPEU_0047_MTP001', '', '8', '2023-01-13 12:00:00', '7', 'Delivered', 'SPEU_0047', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-15 17:10:59', '2023-01-15 17:11:18'),
(185, 0, 205, 1, 0, 0, 0, 12, '1', 'MTP', '', 'SPEU_0048_MTP001', 'SPEU_0048_MTP001', '', '', '2023-01-15 14:51:00', '7', 'New', 'SPEU_0048', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-17 01:25:21', '2023-01-19 14:52:49'),
(186, 0, 207, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPEU_0049_TRA001', 'SPEU_0049_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-17 01:37:03', '2023-01-17 01:37:03'),
(187, 0, 208, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPE_0034_TRA001', 'SPE_0034_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-18 13:41:35', '2023-01-18 13:41:35'),
(188, 0, 201, 9, 9, NULL, 0, 9, '9', 'TRA', '', 'SPE_0033_TRA009', 'SPE_0033_TRA009', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-18 13:47:55', '2023-01-18 13:47:55'),
(189, 0, 201, 10, 0, NULL, 0, 9, '10', 'TRA', '', 'SPE_0033_TRA010', 'SPE_0033_TRA010', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-18 13:49:12', '2023-01-18 13:49:12'),
(190, 0, 201, 11, 9, NULL, 0, 9, '11', 'TRA', '', 'SPE_0033_TRA011', 'SPE_0033_TRA011', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-18 13:50:08', '2023-01-18 13:50:08'),
(191, 0, 201, 12, 9, NULL, 0, 9, '12', 'TRA', '', 'SPE_0033_TRA012', 'SPE_0033_TRA012', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-18 13:50:58', '2023-01-18 13:50:58'),
(192, 0, 201, 13, 9, NULL, 0, 9, '13', 'TRA', '', 'SPE_0033_TRA013', 'SPE_0033_TRA013', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-18 13:52:56', '2023-01-18 13:52:56'),
(193, 0, 201, 14, 9, NULL, 0, 9, '14', 'TRA', '', 'SPE_0033_TRA014', 'SPE_0033_TRA014', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-18 13:55:00', '2023-01-18 13:55:00'),
(194, 0, 209, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPEU_0050_TRA001', 'SPEU_0050_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-18 13:58:03', '2023-01-18 13:58:03'),
(195, 0, 210, 1, 0, NULL, 0, 9, '1', 'TRA', '', 'SPE220029_TRA001', 'SPE220029_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-18 14:00:09', '2023-01-18 14:00:09'),
(196, 0, 211, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPEU_0051_TRA001', 'SPEU_0051_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-18 14:02:32', '2023-01-18 14:02:32'),
(197, 0, 212, 1, 12, NULL, 0, 12, '1', 'MTP', '', 'SPEU_0052_MTP001', 'SPEU_0052_MTP001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-24 00:59:07', '2023-01-24 00:59:07'),
(198, 0, 214, 1, 10, NULL, 0, 10, '1', 'PRF', '', 'SPEU_0053_PRF001', 'SPEU_0053_PRF001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-25 00:25:07', '2023-01-25 00:25:07'),
(199, 0, 215, 1, 10, NULL, 0, 10, '1', 'PRF', '', 'SPEU_0054_PRF001', 'SPEU_0054_PRF001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-25 00:26:56', '2023-01-25 00:26:56'),
(200, 0, 217, 1, 10, NULL, 0, 10, '1', 'PRF', '', 'SPEU_0055_PRF001', 'SPEU_0055_PRF001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-25 00:29:49', '2023-01-25 00:29:49'),
(201, 0, 218, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPE_0035_TRA001', 'SPE_0035_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-25 00:31:35', '2023-01-25 00:31:35'),
(202, 0, 219, 1, 12, NULL, 0, 12, '1', 'MTP', '', 'SPEU_0056_MTP001', 'SPEU_0056_MTP001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-25 00:38:07', '2023-01-25 00:38:07'),
(203, 0, 220, 1, 10, NULL, 0, 10, '1', 'PRF', '', 'SPEU_0057_PRF001', 'SPEU_0057_PRF001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-25 00:44:52', '2023-01-25 00:44:52'),
(204, 0, 221, 1, 10, NULL, 0, 10, '1', 'PRF', '', 'SPE_0036_PRF001', 'SPE_0036_PRF001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-25 00:47:39', '2023-01-25 00:47:39'),
(205, 0, 222, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPEU_0058_TRA001', 'SPEU_0058_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-25 00:49:22', '2023-01-25 00:49:22'),
(206, 0, 223, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPE_0037_TRA001', 'SPE_0037_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-25 00:51:09', '2023-01-25 00:51:09'),
(207, 0, 224, 1, 9, NULL, 0, 9, '1', 'TRA', '', 'SPEU_0059_TRA001', 'SPEU_0059_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-25 00:55:00', '2023-01-25 00:55:00'),
(208, 0, 225, 1, 0, NULL, 0, 9, '1', 'TRA', '', 'SPEU_0060_TRA001', 'SPEU_0060_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-25 00:56:34', '2023-01-25 00:56:34'),
(209, 0, 226, 1, 0, NULL, 0, 9, '1', 'TRA', '', 'SPE_0038_TRA001', 'SPE_0038_TRA001', '', '', '0000-00-00 00:00:00', '7', 'New', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-25 00:59:00', '2023-01-25 00:59:00'),
(210, 0, 227, 1, 12, 0, 0, 12, '1', 'MTP', '', 'SPEU_0061_MTP001', 'SPEU_0061_MTP001', '', '8', '2023-01-18 18:00:00', '7', 'Delivered', 'SPEU_0061', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-25 23:25:55', '2023-01-25 23:26:59'),
(211, 0, 227, 2, 12, 0, 0, 12, '2', 'MTP', '', 'SPEU_0061_MTP002', 'SPEU_0061_MTP002', '', '8', '2023-01-18 18:00:00', '7', 'Delivered', 'SPEU_0061', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-25 23:26:33', '2023-01-25 23:27:14'),
(212, 0, 228, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPE_0039_TRA001', 'SPE_0039_TRA001', '', '8', '2023-01-19 19:00:00', '7', 'Delivered', 'SPE_0039', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-25 23:32:08', '2023-01-25 23:32:36'),
(213, 0, 229, 1, 12, 0, 0, 12, '1', 'MTP', '', 'SPEU_0062_MTP001', 'SPEU_0062_MTP001', '', '8', '2023-01-20 19:00:00', '7', 'Delivered', 'SPEU_0062', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-25 23:35:04', '2023-01-25 23:38:23'),
(214, 0, 229, 2, 12, 0, 0, 12, '2', 'MTP', '', 'SPEU_0062_MTP002', 'SPEU_0062_MTP002', '', '8', '2023-01-20 19:00:00', '7', 'Requested', 'SPEU_0062', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-25 23:35:50', '2023-01-25 23:39:13'),
(215, 0, 229, 3, 12, 0, 0, 12, '3', 'MTP', '', 'SPEU_0062_MTP003', 'SPEU_0062_MTP003', '', '8', '2023-01-20 19:00:00', '7', 'Delivered', 'SPEU_0062', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-25 23:36:30', '2023-01-25 23:39:34'),
(216, 0, 229, 4, 12, 0, 0, 12, '4', 'MTP', '', 'SPEU_0062_MTP004', 'SPEU_0062_MTP004', '', '8', '2023-01-20 19:00:00', '7', 'Delivered', 'SPEU_0062', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-25 23:37:09', '2023-01-25 23:39:49'),
(217, 0, 229, 5, 12, 0, 0, 12, '5', 'MTP', '', 'SPEU_0062_MTP005', 'SPEU_0062_MTP005', '', '8', '2023-01-20 19:00:00', '7', 'Delivered', 'SPEU_0062', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-25 23:37:52', '2023-01-25 23:40:05'),
(218, 0, 230, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPEU_0063_TRA001', 'SPEU_0063_TRA001', '', '8', '2023-01-23 19:00:00', '7', 'Delivered', 'SPEU_0063', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-25 23:47:57', '2023-01-25 23:48:14'),
(219, 0, 231, 1, 0, 0, 0, 10, '1', 'PRF', '', 'SPE_0040_PRF001', 'SPE_0040_PRF001', '', '8', '2023-01-23 19:00:00', '7', 'Delivered', 'SPE_0040', '[]', 'English (US) > Norwegian (nynorsk)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-25 23:50:17', '2023-01-25 23:50:33'),
(220, 0, 232, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE_0041_PRF001', 'SPE_0041_PRF001', '', '8', '2023-01-23 19:00:00', '7', 'Delivered', 'SPE_0041', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-25 23:52:26', '2023-01-25 23:52:46'),
(221, 0, 233, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPEU_0064_TRA001', 'SPEU_0064_TRA001', '', '8', '2023-01-23 19:00:00', '7', 'Delivered', 'SPEU_0064', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-25 23:54:22', '2023-01-25 23:54:50'),
(222, 0, 234, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPEU_0065_PRF001', 'SPEU_0065_PRF001', '', '8', '2023-01-24 19:00:00', '7', 'Delivered', 'SPEU_0065', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-25 23:57:39', '2023-01-25 23:57:56'),
(223, 0, 235, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE_0042_PRF001', 'SPE_0042_PRF001', '', '8', '2023-01-24 19:00:00', '7', 'Delivered', 'SPE_0042', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-25 23:59:43', '2023-01-26 00:00:36'),
(224, 0, 236, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPEU_0066_PRF001', 'SPEU_0066_PRF001', '', '8', '2023-01-24 19:00:00', '7', 'Delivered', 'SPEU_0066', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-26 00:02:40', '2023-01-26 00:02:59'),
(225, 0, 237, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPE_0043_PRF001', 'SPE_0043_PRF001', '', '8', '2023-01-25 19:00:00', '7', 'Delivered', 'SPE_0043', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-26 00:10:34', '2023-01-26 00:10:51'),
(226, 0, 238, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPEU_0067_TRA001', 'SPEU_0067_TRA001', '', '8', '2023-01-25 19:00:00', '7', 'Delivered', 'SPEU_0067', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-26 00:12:35', '2023-01-26 00:12:53'),
(227, 0, 239, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPE_0044_TRA001', 'SPE_0044_TRA001', '', '8', '2023-01-25 19:00:00', '7', 'Delivered', 'SPE_0044', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-26 00:14:52', '2023-01-26 00:15:21'),
(228, 0, 240, 1, 0, 0, 0, 9, '1', 'TRA', '', 'SPE_0045_TRA001', 'SPE_0045_TRA001', '', '8', '2023-01-20 19:00:00', '7', 'Delivered', 'SPE_0045', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-26 00:19:15', '2023-01-26 00:22:05'),
(229, 0, 240, 2, 9, 0, 0, 9, '2', 'TRA', '', 'SPE_0045_TRA002', 'SPE_0045_TRA002', '', '8', '2023-01-20 19:00:00', '7', 'Delivered', 'SPE_0045', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-26 00:19:48', '2023-01-26 00:22:24'),
(230, 0, 240, 3, 9, 0, 0, 9, '3', 'TRA', '', 'SPE_0045_TRA003', 'SPE_0045_TRA003', '', '8', '2023-01-20 19:00:00', '7', 'Delivered', 'SPE_0045', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-26 00:20:24', '2023-01-26 00:22:38'),
(231, 0, 240, 4, 9, 0, 0, 9, '4', 'TRA', '', 'SPE_0045_TRA004', 'SPE_0045_TRA004', '', '8', '2023-01-20 19:00:00', '7', 'Delivered', 'SPE_0045', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-26 00:21:01', '2023-01-26 00:22:54'),
(232, 0, 240, 5, 9, 0, 0, 9, '5', 'TRA', '', 'SPE_0045_TRA005', 'SPE_0045_TRA005', '', '8', '2023-01-20 19:00:00', '7', 'Delivered', 'SPE_0045', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-26 00:21:38', '2023-01-26 00:23:08'),
(233, 0, 241, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPE_0046_TRA001', 'SPE_0046_TRA001', '', '8', '2023-01-25 19:00:00', '7', 'Delivered', 'SPE_0046', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-26 00:25:40', '2023-01-26 00:26:37'),
(234, 0, 241, 2, 9, 0, 0, 9, '2', 'TRA', '', 'SPE_0046_TRA002', 'SPE_0046_TRA002', '', '8', '2023-01-25 19:00:00', '7', 'Delivered', 'SPE_0046', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-26 00:26:12', '2023-01-26 00:26:51'),
(235, 0, 242, 1, 12, 0, 0, 12, '1', 'MTP', '', 'SPEU_0068_MTP001', 'SPEU_0068_MTP001', '', 'mar,8', '2023-01-25 19:00:00', '7', 'Delivered', 'SPEU_0068', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-26 00:28:16', '2023-01-26 00:29:12'),
(236, 0, 242, 2, 0, 0, 0, 12, '2', 'MTP', '', 'SPEU_0068_MTP002', 'SPEU_0068_MTP002', '', '8', '2023-01-25 19:00:00', '7', 'Delivered', 'SPEU_0068', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-26 00:28:48', '2023-01-26 00:29:26');
INSERT INTO `tms_summmery_view` (`job_summmeryId`, `per_id`, `order_id`, `item_id`, `job_id`, `job_chain_id`, `appr_id`, `master_job_id`, `job_no`, `job_code`, `order_no`, `po_number`, `tmp_po_number`, `description`, `resource`, `due_date`, `contact_person`, `item_status`, `company_code`, `work_instruction`, `ItemLanguage`, `specialization`, `negative_feedback`, `late_delivery`, `auto_job`, `auto_status`, `rejection`, `price`, `total_price`, `created_date`, `updated_date`) VALUES
(237, 0, 243, 1, 12, 0, 0, 12, '1', 'MTP', '', 'SPEU_0069_MTP001', 'SPEU_0069_MTP001', '', '8', '2023-01-25 20:00:00', '7', 'Delivered', 'SPEU_0069', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-26 00:30:38', '2023-01-26 00:31:33'),
(238, 0, 243, 2, 12, 0, 0, 12, '2', 'MTP', '', 'SPEU_0069_MTP002', 'SPEU_0069_MTP002', '', '8', '2023-01-25 20:00:00', '7', 'Delivered', 'SPEU_0069', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-26 00:31:08', '2023-01-26 00:31:46'),
(239, 0, 244, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPEU_0070_TRA001', 'SPEU_0070_TRA001', '', '8', '2023-01-20 20:00:00', '7', 'Delivered', 'SPEU_0070', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-26 00:40:49', '2023-01-26 00:41:08'),
(240, 0, 245, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPEU_0071_PRF001', 'SPEU_0071_PRF001', '', '8', '2023-01-25 18:00:00', '7', 'Delivered', 'SPEU_0071', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-29 23:22:54', '2023-01-29 23:23:12'),
(241, 0, 246, 1, 0, 0, 0, 9, '1', 'TRA', '', 'SPE_0047_TRA001', 'SPE_0047_TRA001', '', '8', '2023-01-25 18:00:00', '7', 'Delivered', 'SPE_0047', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-29 23:25:24', '2023-01-29 23:27:39'),
(242, 0, 246, 2, 9, 0, 0, 9, '2', 'TRA', '', 'SPE_0047_TRA002', 'SPE_0047_TRA002', '', '8', '2023-01-25 18:00:00', '7', 'Delivered', 'SPE_0047', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-29 23:26:01', '2023-01-29 23:27:54'),
(243, 0, 246, 3, 9, 0, 0, 9, '3', 'TRA', '', 'SPE_0047_TRA003', 'SPE_0047_TRA003', '', '8', '2023-01-25 18:00:00', '7', 'Delivered', 'SPE_0047', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-29 23:26:38', '2023-01-29 23:28:09'),
(244, 0, 246, 4, 9, 0, 0, 9, '4', 'TRA', '', 'SPE_0047_TRA004', 'SPE_0047_TRA004', '', '8', '2023-01-25 18:00:00', '7', 'Delivered', 'SPE_0047', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-29 23:27:12', '2023-01-29 23:28:24'),
(245, 0, 247, 1, 12, 0, 0, 12, '1', 'MTP', '', 'SPEU_0072_MTP001', 'SPEU_0072_MTP001', '', '8', '2023-01-25 19:00:00', '7', 'New,Delivered', 'SPEU_0072', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-29 23:30:22', '2023-01-29 23:33:11'),
(246, 0, 247, 2, 12, 0, 0, 12, '2', 'MTP', '', 'SPEU_0072_MTP002', 'SPEU_0072_MTP002', '', '8', '2023-01-25 19:00:00', '7', 'Delivered', 'SPEU_0072', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-29 23:31:24', '2023-01-29 23:33:25'),
(247, 0, 247, 3, 0, 0, 0, 12, '3', 'MTP', '', 'SPEU_0072_MTP003', 'SPEU_0072_MTP003', '', 'mari,8', '2023-01-25 19:00:00', '7', 'Delivered', 'SPEU_0072', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-29 23:32:04', '2023-01-29 23:33:56'),
(248, 0, 247, 4, 0, 0, 0, 12, '4', 'MTP', '', 'SPEU_0072_MTP004', 'SPEU_0072_MTP004', '', '8', '2023-01-25 19:00:00', '7', 'Delivered', 'SPEU_0072', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-29 23:32:39', '2023-01-29 23:34:16'),
(249, 0, 248, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPEU_0073_PRF001', 'SPEU_0073_PRF001', '', '8', '2023-01-26 19:00:00', '7', 'Delivered', 'SPEU_0073', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-29 23:37:43', '2023-01-29 23:40:15'),
(250, 0, 248, 2, 0, 0, 0, 10, '2', 'PRF', '', 'SPEU_0073_PRF002', 'SPEU_0073_PRF002', '', '8', '2023-01-26 19:00:00', '7', 'Delivered', 'SPEU_0073', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-29 23:38:20', '2023-01-29 23:40:27'),
(251, 0, 248, 3, 10, 0, 0, 10, '3', 'PRF', '', 'SPEU_0073_PRF003', 'SPEU_0073_PRF003', '', '8', '2023-01-26 19:00:00', '7', 'Delivered', 'SPEU_0073', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-29 23:38:56', '2023-01-29 23:40:44'),
(252, 0, 248, 4, 10, 0, 0, 10, '4', 'PRF', '', 'SPEU_0073_PRF004', 'SPEU_0073_PRF004', '', '8', '2023-01-26 19:00:00', '7', 'Delivered', 'SPEU_0073', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-29 23:39:37', '2023-01-29 23:40:59'),
(253, 0, 249, 1, 9, 0, 0, 9, '1', 'TRA', '', 'SPEU_0074_TRA001', 'SPEU_0074_TRA001', '', '8', '2023-01-26 19:00:00', '7', 'Delivered', 'SPEU_0074', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-29 23:45:33', '2023-01-29 23:46:01'),
(254, 0, 250, 1, 10, 0, 0, 10, '1', 'PRF', '', 'SPEU_0075_PRF001', 'SPEU_0075_PRF001', '', '8', '2023-01-27 19:00:00', '7', 'Delivered', 'SPEU_0075', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', 0, '2023-01-29 23:47:41', '2023-01-29 23:47:57');

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
(5, 80, '[[{\"job_summmeryId\":51,\"per_id\":0,\"order_id\":80,\"item_id\":1,\"job_id\":1,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":1,\"job_no\":1,\"job_code\":\"BAD\",\"order_no\":\"\",\"po_number\":\"KNH160015_BAD001\",\"tmp_po_number\":\"KNH160015_BAD001\",\"description\":\"\",\"resource\":4,\"due_date\":\"2022-11-26 00:00:00\",\"contact_person\":1,\"item_status\":\"In-progress\",\"company_code\":\"KNH160015\",\"work_instruction\":\"[]\",\"ItemLanguage\":\"English (US) > English (US)\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2022-11-24 15:04:25\",\"updated_date\":\"2022-11-29 15:28:51\",\"vUserName\":\"Linguist Kanhasoft\",\"resourcePic\":\"1667454966.png\",\"iUserId\":4,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}]]', '2022-11-29 12:45:26', '2022-11-29 18:15:26'),
(6, 55, '[[{\"job_summmeryId\":20,\"per_id\":0,\"order_id\":55,\"item_id\":1,\"job_id\":9,\"job_chain_id\":null,\"appr_id\":0,\"master_job_id\":9,\"job_no\":1,\"job_code\":\"TRA\",\"order_no\":\"\",\"po_number\":\"SPEU_0001_TRA001\",\"tmp_po_number\":\"SPEU_0001_TRA001\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2022-11-09 17:00:00\",\"contact_person\":1,\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"English (US) > English (US)\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2022-11-11 16:35:00\",\"updated_date\":\"2022-11-11 16:35:00\",\"vUserName\":null,\"resourcePic\":null,\"iUserId\":null,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}],[{\"job_summmeryId\":21,\"per_id\":0,\"order_id\":55,\"item_id\":2,\"job_id\":9,\"job_chain_id\":null,\"appr_id\":0,\"master_job_id\":9,\"job_no\":2,\"job_code\":\"TRA\",\"order_no\":\"\",\"po_number\":\"SPEU_0001_TRA002\",\"tmp_po_number\":\"SPEU_0001_TRA002\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2022-11-10 17:00:00\",\"contact_person\":1,\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"English (US) > English (US)\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2022-11-11 16:35:36\",\"updated_date\":\"2022-11-11 16:35:36\",\"vUserName\":null,\"resourcePic\":null,\"iUserId\":null,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}],[{\"job_summmeryId\":23,\"per_id\":0,\"order_id\":55,\"item_id\":3,\"job_id\":9,\"job_chain_id\":null,\"appr_id\":0,\"master_job_id\":9,\"job_no\":4,\"job_code\":\"TRA\",\"order_no\":\"\",\"po_number\":\"SPEU_0001_TRA004\",\"tmp_po_number\":\"SPEU_0001_TRA004\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2022-11-14 17:00:00\",\"contact_person\":1,\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"English (US) > Norwegian (bokmal)\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2022-11-11 16:38:58\",\"updated_date\":\"2022-11-11 16:38:58\",\"vUserName\":null,\"resourcePic\":null,\"iUserId\":null,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}],[{\"job_summmeryId\":22,\"per_id\":0,\"order_id\":55,\"item_id\":4,\"job_id\":9,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":9,\"job_no\":3,\"job_code\":\"TRA\",\"order_no\":\"\",\"po_number\":\"SPEU_0001_TRA003\",\"tmp_po_number\":\"SPEU_0001_TRA003\",\"description\":\"\",\"resource\":22,\"due_date\":\"2022-11-14 17:00:00\",\"contact_person\":1,\"item_status\":\"In-progress\",\"company_code\":\"SPEU_0001\",\"work_instruction\":\"[]\",\"ItemLanguage\":\"English (US) > Norwegian (bokmal)\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"[]\",\"total_price\":0,\"created_date\":\"2022-11-11 16:36:49\",\"updated_date\":\"2023-01-27 23:21:01\",\"vUserName\":\"\\u00c5se Mari Lisleg\\u00e5rd\",\"resourcePic\":\"\",\"iUserId\":22,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}],[{\"job_summmeryId\":24,\"per_id\":0,\"order_id\":55,\"item_id\":5,\"job_id\":0,\"job_chain_id\":null,\"appr_id\":0,\"master_job_id\":9,\"job_no\":5,\"job_code\":\"TRA\",\"order_no\":\"\",\"po_number\":\"SPEU_0001_TRA005\",\"tmp_po_number\":\"SPEU_0001_TRA005\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2022-12-19 17:00:00\",\"contact_person\":1,\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"English (US) > Norwegian (bokmal)\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2022-11-11 16:39:52\",\"updated_date\":\"2022-11-11 16:39:52\",\"vUserName\":null,\"resourcePic\":null,\"iUserId\":null,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}],[{\"job_summmeryId\":25,\"per_id\":0,\"order_id\":55,\"item_id\":6,\"job_id\":9,\"job_chain_id\":null,\"appr_id\":0,\"master_job_id\":9,\"job_no\":6,\"job_code\":\"TRA\",\"order_no\":\"\",\"po_number\":\"SPEU_0001_TRA006\",\"tmp_po_number\":\"SPEU_0001_TRA006\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2022-12-19 17:00:00\",\"contact_person\":1,\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"English (US) > Norwegian (bokmal)\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2022-11-11 16:50:29\",\"updated_date\":\"2022-11-11 16:50:29\",\"vUserName\":null,\"resourcePic\":null,\"iUserId\":null,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}],[{\"job_summmeryId\":26,\"per_id\":0,\"order_id\":55,\"item_id\":7,\"job_id\":9,\"job_chain_id\":null,\"appr_id\":0,\"master_job_id\":9,\"job_no\":7,\"job_code\":\"TRA\",\"order_no\":\"\",\"po_number\":\"SPEU_0001_TRA007\",\"tmp_po_number\":\"SPEU_0001_TRA007\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2022-12-19 17:00:00\",\"contact_person\":1,\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"English (US) > Norwegian (bokmal)\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2022-11-11 17:15:13\",\"updated_date\":\"2022-11-11 17:15:13\",\"vUserName\":null,\"resourcePic\":null,\"iUserId\":null,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}],[{\"job_summmeryId\":27,\"per_id\":0,\"order_id\":55,\"item_id\":8,\"job_id\":9,\"job_chain_id\":null,\"appr_id\":0,\"master_job_id\":9,\"job_no\":8,\"job_code\":\"TRA\",\"order_no\":\"\",\"po_number\":\"SPEU_0001_TRA008\",\"tmp_po_number\":\"SPEU_0001_TRA008\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2022-12-19 17:00:00\",\"contact_person\":1,\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"English (US) > Norwegian (bokmal)\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2022-11-11 17:16:35\",\"updated_date\":\"2022-11-11 17:16:35\",\"vUserName\":null,\"resourcePic\":null,\"iUserId\":null,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}],[{\"job_summmeryId\":28,\"per_id\":0,\"order_id\":55,\"item_id\":9,\"job_id\":9,\"job_chain_id\":null,\"appr_id\":0,\"master_job_id\":9,\"job_no\":9,\"job_code\":\"TRA\",\"order_no\":\"\",\"po_number\":\"SPEU_0001_TRA009\",\"tmp_po_number\":\"SPEU_0001_TRA009\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2022-12-19 17:00:00\",\"contact_person\":1,\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"English (US) > Norwegian (bokmal)\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2022-11-11 17:18:03\",\"updated_date\":\"2022-11-11 17:18:03\",\"vUserName\":null,\"resourcePic\":null,\"iUserId\":null,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}],[{\"job_summmeryId\":29,\"per_id\":0,\"order_id\":55,\"item_id\":10,\"job_id\":0,\"job_chain_id\":null,\"appr_id\":0,\"master_job_id\":9,\"job_no\":10,\"job_code\":\"TRA\",\"order_no\":\"\",\"po_number\":\"SPEU_0001_TRA010\",\"tmp_po_number\":\"SPEU_0001_TRA010\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2022-12-19 17:00:00\",\"contact_person\":1,\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"English (US) > Norwegian (bokmal)\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2022-11-11 17:18:42\",\"updated_date\":\"2022-11-11 17:18:42\",\"vUserName\":null,\"resourcePic\":null,\"iUserId\":null,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}],[{\"job_summmeryId\":30,\"per_id\":0,\"order_id\":55,\"item_id\":11,\"job_id\":9,\"job_chain_id\":null,\"appr_id\":0,\"master_job_id\":9,\"job_no\":11,\"job_code\":\"TRA\",\"order_no\":\"\",\"po_number\":\"SPEU_0001_TRA011\",\"tmp_po_number\":\"SPEU_0001_TRA011\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2022-12-19 17:00:00\",\"contact_person\":1,\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"English (US) > Norwegian (bokmal)\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2022-11-11 17:20:40\",\"updated_date\":\"2022-11-11 17:20:40\",\"vUserName\":null,\"resourcePic\":null,\"iUserId\":null,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}],[{\"job_summmeryId\":31,\"per_id\":0,\"order_id\":55,\"item_id\":12,\"job_id\":0,\"job_chain_id\":null,\"appr_id\":0,\"master_job_id\":9,\"job_no\":12,\"job_code\":\"TRA\",\"order_no\":\"\",\"po_number\":\"SPEU_0001_TRA012\",\"tmp_po_number\":\"SPEU_0001_TRA012\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2022-12-19 17:00:00\",\"contact_person\":1,\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"English (US) > Norwegian (bokmal)\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2022-11-11 17:21:22\",\"updated_date\":\"2022-11-11 17:21:22\",\"vUserName\":null,\"resourcePic\":null,\"iUserId\":null,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}],[{\"job_summmeryId\":32,\"per_id\":0,\"order_id\":55,\"item_id\":13,\"job_id\":9,\"job_chain_id\":null,\"appr_id\":0,\"master_job_id\":9,\"job_no\":13,\"job_code\":\"TRA\",\"order_no\":\"\",\"po_number\":\"SPEU_0001_TRA013\",\"tmp_po_number\":\"SPEU_0001_TRA013\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2022-12-19 17:00:00\",\"contact_person\":1,\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"English (US) > Norwegian (bokmal)\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2022-11-11 17:21:55\",\"updated_date\":\"2022-11-11 17:21:55\",\"vUserName\":null,\"resourcePic\":null,\"iUserId\":null,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}],[{\"job_summmeryId\":33,\"per_id\":0,\"order_id\":55,\"item_id\":14,\"job_id\":9,\"job_chain_id\":null,\"appr_id\":0,\"master_job_id\":9,\"job_no\":14,\"job_code\":\"TRA\",\"order_no\":\"\",\"po_number\":\"SPEU_0001_TRA014\",\"tmp_po_number\":\"SPEU_0001_TRA014\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2022-12-19 17:00:00\",\"contact_person\":1,\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"English (US) > Norwegian (bokmal)\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2022-11-11 17:22:31\",\"updated_date\":\"2022-11-11 17:22:31\",\"vUserName\":null,\"resourcePic\":null,\"iUserId\":null,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}],[{\"job_summmeryId\":34,\"per_id\":0,\"order_id\":55,\"item_id\":15,\"job_id\":9,\"job_chain_id\":null,\"appr_id\":0,\"master_job_id\":9,\"job_no\":15,\"job_code\":\"TRA\",\"order_no\":\"\",\"po_number\":\"SPEU_0001_TRA015\",\"tmp_po_number\":\"SPEU_0001_TRA015\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2022-11-10 17:00:00\",\"contact_person\":1,\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"English (US) > Norwegian (bokmal)\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2022-11-11 19:00:30\",\"updated_date\":\"2022-11-11 19:00:30\",\"vUserName\":null,\"resourcePic\":null,\"iUserId\":null,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}]]', '2023-01-27 17:51:07', '2023-01-27 23:21:07');

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
(9, 'GST', '10', 1, '2018-04-19 15:01:19', '2018-04-19 15:01:28');

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
  `vResourcePosition` varchar(255) NOT NULL,
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
  `freelance_currency` varchar(255) NOT NULL,
  `tabPermission` text NOT NULL,
  `activation_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=not activated,1=activated',
  `is_available` text NOT NULL COMMENT '1=available,0=un-available(Linguist)',
  `menu_access` text NOT NULL,
  `super_admin` tinyint(2) NOT NULL,
  `activation_token` varchar(50) NOT NULL,
  `dtCreatedDate` datetime NOT NULL,
  `dtUpdatedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_users`
--

INSERT INTO `tms_users` (`iUserId`, `vUserName`, `freelancer`, `vEmailAddress`, `vSecondaryEmailAddress`, `vPassword`, `org_pass`, `eUserStatus`, `vResourceType`, `vResourcePosition`, `iFkUserTypeId`, `iResourceNumber`, `dtCreationDate`, `vTimeZone`, `vTimeZoneCity`, `vUTC`, `vFirstName`, `vLastName`, `dtBirthDate`, `companyName`, `vFacebook_id`, `vTwitter_id`, `vGoogle_plus_id`, `iGender`, `iMobile`, `vPhoneNumber`, `vWebsite`, `vSkypeName`, `vFileManage`, `vEmailTemplate`, `tMemo`, `vAddress1`, `vAddress2`, `address1Detail`, `address2Detail`, `vSalesId`, `vComapanyCode`, `vholiday_country`, `vProfilePic`, `enableDisbaleLoginStatus`, `created_by`, `created_by_name`, `modified_by`, `iEditedBy`, `dtLast_job`, `specialization`, `csv_import`, `freelance_currency`, `tabPermission`, `activation_status`, `is_available`, `menu_access`, `super_admin`, `activation_token`, `dtCreatedDate`, `dtUpdatedDate`) VALUES
(1, 'TMS Admin', 'freelancer', 'admin@tmse.com', 'anils7016@gmail.com', '0e7517141fb53f21ee439b355b5a1d0a', 'Admin@123', 3, 2, '2', 1, '1', '2016-01-02 14:59:21', '', '', '', 'TMS', 'Admin', '1991-08-24', '', 'Https://www.google.co.in/?gfe_rd=cr&ei=VRKxWK2GM9e', 'https://www.google.co.in/?gfe_rd=cr&ei=VRKxWK2GM9e', 'https://www.google.co.in/?gfe_rd=cr&ei=VRKxWK2GM9e', 1, '{\"countryTitle\":\"India (भारत): +91\",\"countryFlagClass\":\"iti-flag in\",\"placeHolder\":\"091234 56789\",\"mobileNumber\":\"097128 11223\"}', '', 'http://www.kifuvazejys.com.au/', 'krunal.kanhasoft', '', '', '', '', '', '', '', '', '', '[{\"Cname\":\"Argentina\"},{\"Cname\":\"Australia\"},{\"Cname\":\"Aruba\"}]', '1545300029.jpg', 1, 1, '', 0, 0, '0000-00-00', '', 0, '', '{\"due_today\":true,\"to_be_assigned\":true,\"in_progress\":true,\"qa_ready\":true,\"to_be_delivered\":true,\"due_tomorrow\":true,\"delivered\":true,\"my_projects\":true}', 1, '', '{\"reports\":true,\"invoice\":true,\"statement\":true,\"knowledge-base\":true,\"resources\":true,\"clients\":true,\"admin\":true,\"favourite\":true,\"activity\":true,\"dashboard\":true}', 1, '', '2016-01-02 15:00:40', '2023-01-02 19:11:14'),
(2, 'Anil Nadiya', 'freelancer', 'anil.kanhasoft@gmail.com', '', '202cb962ac59075b964b07152d234b70', '123', 3, 4, '3,2,4', 1, '2', '0000-00-00 00:00:00', '', '', '', 'Anil', 'Nadiya', '1991-08-24', '', '', '', '', 1, '{\"countryTitle\":\"India (भारत): +91\",\"countryFlagClass\":\"iti-flag in\",\"placeHolder\":\"091234 56789\",\"mobileNumber\":\"097376 36750\"}', '', '', 'anil.kanhasoft', '', '', '', '', '', '', '', '', '', '', '1667286682.jpg', 1, 1, '', 0, 0, '0000-00-00', '', 0, '', '{\"due_today\":true,\"in_progress\":true,\"to_be_assigned\":true,\"to_be_delivered\":true,\"qa_ready\":true,\"due_tomorrow\":true,\"delivered\":true,\"my_projects\":true}', 1, '', '{\"dashboard\":true,\"reports\":true,\"invoice\":true,\"statement\":true,\"knowledge-base\":true,\"resources\":true,\"clients\":true,\"admin\":true,\"favourite\":true,\"activity\":true}', 0, 'ce361e6629ac56d775a0d792422bca7fbfb8c6d2', '2022-11-01 12:40:07', '2023-01-03 19:24:01'),
(3, 'QA Kanhasoft', 'freelancer', 'qa.kanhasoft@yopmail.com', '', '202cb962ac59075b964b07152d234b70', '123', 3, 3, '4', 1, '3', '0000-00-00 00:00:00', '', '', '', 'QA', 'Kanhasoft', '1991-02-26', '', '', '', '', 1, '{\"countryTitle\":\"India (भारत): +91\",\"countryFlagClass\":\"iti-flag in\",\"placeHolder\":\"091234 56789\",\"mobileNumber\":\"097376 36752\"}', '', '', 'qa.kanhasoft', '', '', '', '', '', '', '', '', '', '', '1667287243.jpg', 1, 1, '', 0, 0, '0000-00-00', '', 0, '', '{\"due_today\":true,\"to_be_assigned\":true,\"qa_ready\":true,\"in_progress\":true}', 1, '', '{\"dashboard\":true,\"reports\":true,\"invoice\":true,\"statement\":true,\"knowledge-base\":true,\"resources\":true,\"clients\":true,\"admin\":true,\"favourite\":true,\"activity\":true}', 0, 'a7830e84ad6adb69e39a3703d633187b237c5419', '2022-11-01 12:50:43', '2023-01-03 19:13:02'),
(7, 'Ingvild Sundland', 'freelancer', 'isundland@spellup.no', '', 'fa8a0e73c8342838e150870983e5016e', 'W7Hzs33#f', 3, 2, '2', 1, '5', '0000-00-00 00:00:00', '', '', '', 'Ingvild', 'Sundland', '1987-12-30', '', '', '', '', 2, '{\"countryTitle\":\"Norway (Norge): +47\",\"countryFlagClass\":\"iti-flag no\",\"placeHolder\":\"406 12 345\",\"mobileNumber\":\"940 53 446\"}', '', '', 'isundland', '', '', '', '', '', '', '', '', '', '', '1667905481.png', 1, 1, '', 0, 0, '0000-00-00', '', 0, '', '{\"due_today\":true,\"to_be_assigned\":true,\"in_progress\":true,\"qa_ready\":true,\"to_be_delivered\":true,\"delivered\":true,\"my_projects\":true,\"due_tomorrow\":true}', 1, '', '{\"dashboard\":true,\"reports\":true,\"invoice\":true,\"statement\":true,\"knowledge-base\":true,\"resources\":true,\"clients\":true,\"admin\":true,\"favourite\":true,\"activity\":true}', 1, '81a9b3b1564fee69c4b790ecd52ebe8448091f9f', '2022-11-08 16:34:41', '2022-11-18 01:34:57'),
(8, 'Marika Sundland Lehtimäki', 'freelancer', 'msundland@spellup.no', '', 'be211dbb2fbef790a6284c3f10c2e19f', 'M@3Est-w1k', 3, 2, '0', 2, '2', '2022-11-09 15:23:55', '(GMT 10.46) Europe/Oslo', 'Flateby', '', 'Marika', 'Sundland Lehtimäki', '1995-04-10', 'Marika Sundland Lehtimäki', '', '', '', 2, '{\"countryTitle\":\"Norway (Norge): +47\",\"countryFlagClass\":\"iti-flag no\",\"mobileNumber\":\"467 63 747\"}', '', '', '', '', '', '', 'Odegaardsveien 43J', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Norway\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Flateby\"},{\"id\":\"address1_postal_code\",\"value\":\"1911\"}]', '[]', '', '', '', '1667987635.jpg', 1, 1, '', 1, 8, '0000-00-00', '', 0, 'EUR,€', '', 1, '', '', 0, '2c787ec7319f0b76690bb452df849e7c8d0b085d', '2022-11-09 15:23:55', '2022-11-17 21:41:56'),
(14, 'Solveig T. Sandaas', 'freelancer', 'ssandaas@spellup.no', '', 'cc8e78ba3b51adcfd32e45cdd22ea507', '963963MilK_', 3, 1, '3', 1, '6', '0000-00-00 00:00:00', '', '', '', 'Solveig', 'Sandaas', '1987-01-23', '', '', '', '', 2, '{\"countryTitle\":\"Norway (Norge): +47\",\"countryFlagClass\":\"iti-flag no\",\"placeHolder\":\"406 12 345\",\"mobileNumber\":\"960 19 485\"}', '', '', 'ssandaas', '', '', '', '', '', '', '', '', '', '', '1670256886.jpg', 1, 7, '', 0, 0, '0000-00-00', '', 0, '', '{\"due_today\":true,\"to_be_assigned\":true,\"in_progress\":true,\"qa_ready\":true,\"to_be_delivered\":true,\"due_tomorrow\":true,\"delivered\":true,\"my_projects\":true}', 1, '', '{\"dashboard\":true,\"reports\":true,\"invoice\":true,\"statement\":true,\"knowledge-base\":true,\"resources\":true,\"clients\":true,\"admin\":true,\"favourite\":true,\"activity\":true}', 0, 'fe9f098edc3f4c2802e3069e564e5e7c4402a0ff', '2022-11-18 01:13:56', '2022-12-12 20:21:53'),
(16, 'Marthe Kristoffersen', 'freelancer', 'mkristoffersen@spellup.no', '', 'a906449d5769fa7361d7ecc6aa3f6d28', '123abc', 2, 0, '0', 2, '0005', '2022-11-26 18:24:31', '(GMT 13.54) Europe/Oslo', 'Flateby', '', 'Marthe', 'Kristoffersen', '2000-01-04', 'SpellUp', '', '', '', 2, '{\"countryTitle\":\"Norway (Norge): +47\",\"countryFlagClass\":\"iti-flag no\",\"mobileNumber\":\"940 53 446\"}', '', '', '', '', '', '', 'Ødegaårdsveien 43J', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Norway\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Flateby\"},{\"id\":\"address1_postal_code\",\"value\":\"1911\"}]', '[]', '', '', '', 'user-icon.png', 1, 0, '', 0, 0, '0000-00-00', '', 0, 'EUR,€', '', 1, '', '', 0, '39540bbd8d133da420bf22b73f7eab8869c33a3f', '2022-11-26 18:24:31', '2022-11-26 18:24:31'),
(22, 'Åse Mari Lislegård', 'freelancer', 'aam.lislegaard@gmail.com', '', 'cc08eef85696ffccfdb1ab30c36cbf98', ')Io*+B94&y', 3, 0, '', 2, '0006', '2023-01-05 15:59:13', '(GMT 11.29) Europe/Oslo', 'Nesbyen', '', 'Åse Mari', 'Lislegård', '1994-12-01', 'Aam Lislegaard', '', '', '', 2, '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', '', '', '', '', '', 'Gjerdingvegen 74', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Nesbyen\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Norway\"},{\"id\":\"address1_postal_code\",\"value\":\"3540\"}]', '[]', '', '', '', '', 1, 7, '', 0, 7, '0000-00-00', '', 0, 'EUR,€', '', 1, '', '', 0, '6850bc8ba6f624330f10291bdff57bbadc136dbb', '2023-01-05 15:59:13', '2023-01-05 15:59:13'),
(23, 'Julianne Aga', 'freelancer', 'julianne_aga@hotmail.com', '', 'fb7ea7cdc353df30b780c4ecf445373b', 'b33n$)FmuF', 3, 0, '', 2, '0007', '2023-01-05 16:04:04', '(GMT 11.33) Europe/Oslo', 'Porsgrunn', '', 'Julianne', 'Aga', '1984-07-31', 'Julianne Aga', '', '', '', 2, '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', '', '', '', '', '', 'Håvundvegen 443', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Porsgrunn\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Norway\"},{\"id\":\"address1_postal_code\",\"value\":\"3911\"}]', '[]', '', '', '', '', 1, 7, '', 0, 0, '0000-00-00', '', 0, 'EUR,€', '', 1, '', '', 0, '1b117ceb06014f33c27a62efaab29684c1636105', '2023-01-05 16:04:04', '2023-01-05 16:04:04'),
(24, 'Yngve Homlong', 'freelancer', 'yngveee@hotmail.com', '', '7ef2b501cf784d554d86e803fd40465b', '^HtPn9rPqs', 3, 0, '', 2, '0008', '2023-01-05 16:09:36', '(GMT 11.39) Europe/Oslo', 'Tønsberg', '', 'Yngve', 'Homlong', '1996-12-16', 'Homlong', '', '', '', 1, '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', '', '', '', '', '', 'Herdis vei 11A', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Tønsberg\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Norway\"},{\"id\":\"address1_postal_code\",\"value\":\"3122\"}]', '[]', '', '', '', '', 1, 7, '', 0, 0, '0000-00-00', '', 0, 'EUR,€', '', 1, '', '', 0, 'e1edba258ec38ebbb7c4547e8f04cb210b24df4b', '2023-01-05 16:09:36', '2023-01-05 16:09:36'),
(31, 'Ingvild Freelancer', 'freelancer', 'isundland@beconnected.no', '', 'cc8e78ba3b51adcfd32e45cdd22ea507', '963963MilK_', 3, 0, '', 2, '0010', '2023-01-13 22:18:40', '', '', '', 'Ingvild', 'Freelancer', '0000-00-00', '', '', '', '', 1, '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', '', '', '', '', '', '', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Norway\"},{\"id\":\"address1_postal_code\",\"value\":\"\"}]', '[]', '', '', '', '', 1, 7, '', 0, 0, '0000-00-00', '', 0, 'EUR,€', '', 1, '', '', 0, '9fcf27fc177783300620ce47d277481a2464acbe', '2023-01-13 22:18:40', '2023-01-13 22:18:40');

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
(12, 4, 1, 11, '34,73', '2022-11-25 19:10:59', '2023-01-05 15:38:42');

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
-- Indexes for table `tms_job_status`
--
ALTER TABLE `tms_job_status`
  ADD PRIMARY KEY (`jb_status_id`);

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
  MODIFY `child_price_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `tms_client`
--
ALTER TABLE `tms_client`
  MODIFY `iClientId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tms_client_contact`
--
ALTER TABLE `tms_client_contact`
  MODIFY `iContactId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `tms_client_indirect`
--
ALTER TABLE `tms_client_indirect`
  MODIFY `iClientId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

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
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT for table `tms_customer_group`
--
ALTER TABLE `tms_customer_group`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tms_customer_price_list`
--
ALTER TABLE `tms_customer_price_list`
  MODIFY `price_list_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

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
  MODIFY `iClientId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

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
  MODIFY `fmanager_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1669;

--
-- AUTO_INCREMENT for table `tms_general`
--
ALTER TABLE `tms_general`
  MODIFY `general_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT for table `tms_invoice`
--
ALTER TABLE `tms_invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tms_invoice_client`
--
ALTER TABLE `tms_invoice_client`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
  MODIFY `itemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT for table `tms_item_status`
--
ALTER TABLE `tms_item_status`
  MODIFY `item_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
-- AUTO_INCREMENT for table `tms_job_status`
--
ALTER TABLE `tms_job_status`
  MODIFY `jb_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=787;

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
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `tms_passwordreset_tbl`
--
ALTER TABLE `tms_passwordreset_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tms_payment`
--
ALTER TABLE `tms_payment`
  MODIFY `iPaymentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

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
  MODIFY `job_summmeryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=255;

--
-- AUTO_INCREMENT for table `tms_summmery_view_sorting`
--
ALTER TABLE `tms_summmery_view_sorting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `iUserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

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
