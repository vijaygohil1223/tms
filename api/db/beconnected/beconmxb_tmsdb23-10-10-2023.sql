-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 10, 2023 at 02:54 PM
-- Server version: 10.3.39-MariaDB-cll-lve
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `beconmxb_tmsdb23`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
  `is_default` tinyint(2) NOT NULL DEFAULT 0,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tms_banking_info`
--

INSERT INTO `tms_banking_info` (`bank_id`, `payment_method`, `bank_name`, `address`, `holder_name`, `currency_code`, `iban`, `swift_bic`, `bank_code`, `routing_number`, `is_default`, `created_date`, `updated_date`) VALUES
(1, 'Bank Transfer', 'United Bulgarian Bank', 'Millennium center, vitosha blvd. 89b', 'BeConnected', 'BGN,лв', 'UBB540697', 'UBBSBGSF', 'UBBS', '657049', 1, '2022-03-23 17:23:04', '2022-03-23 17:23:56');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tms_centers`
--

INSERT INTO `tms_centers` (`center_id`, `name`, `abbrivation`, `is_active`, `order_number`, `created_date`, `updated_date`) VALUES
(13, 'BeConnected Bulgaria', 'BB', '1', '[{\"id\":\"numberFormate\",\"value\":\"BB23_\"}]', '2023-05-26 22:41:29', '2023-06-26 17:47:42'),
(14, 'BeConnected Norway', 'BN', '1', '[{\"id\":\"numberFormate\",\"value\":\"BN23_\"}]', '2023-05-26 22:41:45', '2023-06-26 16:39:09');

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
  `is_active` int(11) NOT NULL DEFAULT 1 COMMENT 'active="1",inactive="0"',
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
  `vCenterid` varchar(200) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tms_client`
--

INSERT INTO `tms_client` (`iClientId`, `vUserName`, `vCodeInvoice`, `vCodeRights`, `vCenterid`, `vEmailAddress`, `vPhone`, `vSkype`, `vLogo`, `vWebsite`, `vAddress1`, `vAddress2`, `address1Detail`, `address2Detail`, `iBussinessDeveloper`, `vProjectCoordinator`, `vProjectManager`, `vQASpecialist`, `vCustomerType`, `company_branch_project`, `company_branch_invoice`, `vStatus`, `iSaleId`, `vTextType`, `vClientNumber`, `dtCreationDate`, `iTemplate`, `vVatNumber`, `tMemo`, `tPoInfo`, `tPofor`, `Invoice`, `customer_group`, `project_branch`, `client_currency`, `invoice_no_of_days`, `created_id`, `modified_id`, `iEditedBy`, `dtCreatedDate`, `dtUpdatedDate`) VALUES
(1, 'Test Client', '', 'BeConnected AS', '14', '', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"94053446\"}', '', '', '', 'Frennings vei 20', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Norway\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Oslo\"},{\"id\":\"address1_postal_code\",\"value\":\"0588\"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 13.28) Europe/Oslo\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '1', '2023-06-02 16:58:06', 0, '', '', 'test-client-001', '', '', '', 'Norway', 'EUR,€', 0, 1, 0, 6, '2023-06-02 16:58:06', '2023-06-02 16:58:06'),
(2, 'Acolad, Inc.', '', 'BBBB', '13', '', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', '', 'https://www.acolad.com/', '2365 Willis Miller Drive', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"United States\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"Wisconsin\"},{\"id\":\"address1_locality\",\"value\":\"Hudson\"},{\"id\":\"address1_postal_code\",\"value\":\"54016\"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 03.16) America/Rankin_Inlet\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '2', '2023-06-19 00:00:00', 0, '', '', 'acolad,-inc.-002', '', '', '', 'Norway', 'USD,$', 30, 12, 12, 12, '2023-06-19 13:47:05', '2023-06-19 14:05:55'),
(3, 'Kanhasoft BG-Test', '', 'BBBB', '13', '', '{\"countryTitle\":\"India (भारत): +91\",\"countryFlagClass\":\"iti-flag in\",\"mobileNumber\":\"97376 36750\"}', '', '', 'kanhasoft.com', 'Kanhasoft', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"India\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"Gujarat\"},{\"id\":\"address1_locality\",\"value\":\"Ahmedabad\"},{\"id\":\"address1_postal_code\",\"value\":\"382424\"},{\"id\":\"address1_vTimezone\",\"value\":\"(GMT 16.25) Asia/Kolkata\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '3', '2023-06-22 00:00:00', 0, '', '', 'kanhasoft-bn-test-003', '', '', '', 'Norway', 'EUR,€', 0, 1, 1, 0, '2023-06-26 17:48:35', '2023-06-26 17:48:35');

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
  `is_client_invoice` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'default Invoice email',
  `vDepartment` varchar(255) NOT NULL,
  `vJobTitle` varchar(255) NOT NULL,
  `vPhone` varchar(255) NOT NULL,
  `vSkype` varchar(255) NOT NULL,
  `vActive` enum('active','inactive','Not Contacted') NOT NULL,
  `tMemo` text NOT NULL,
  `dtCreatedDate` datetime NOT NULL,
  `dtUpdatedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tms_client_contact`
--

INSERT INTO `tms_client_contact` (`iContactId`, `iClientId`, `iUserId`, `vFirstName`, `vLastName`, `vEmail`, `is_client_invoice`, `vDepartment`, `vJobTitle`, `vPhone`, `vSkype`, `vActive`, `tMemo`, `dtCreatedDate`, `dtUpdatedDate`) VALUES
(1, 1, 0, 'Ingvild', 'Sundland', 'isundland@beconnected.no', 0, '', '', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2023-06-02 17:02:17', '2023-06-02 17:02:17'),
(2, 2, 0, 'Amplexor, Inc.', 'Accounting', 'accountingsajan@acolad.com', 1, '', 'Accounting', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2023-06-19 13:50:35', '2023-06-19 13:50:35'),
(3, 2, 0, 'Hatchery', 'Production', 'smt_production@acolad.com', 0, '', '', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2023-06-19 14:12:42', '2023-06-19 14:12:42'),
(4, 3, 0, 'Mayur', 'Kanhasoft', 'anil.kanhasoft@gmail.com', 0, '', 'Developer', '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'active', '', '2023-06-22 16:26:43', '2023-06-22 16:52:42');

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
  `dtUpdatedDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tms_client_indirect`
--

INSERT INTO `tms_client_indirect` (`iClientId`, `vUserName`, `vClientNumber`, `vWebsite`, `po`, `notes`, `iEditedBy`, `dtCreationDate`, `dtUpdatedDate`) VALUES
(1, 'Google', 1, 'www.beconnected.no', '', '', 0, '2023-06-02 17:01:30', '2023-06-02 11:50:57'),
(2, 'Ecolab', 2, 'www.ecolab.com', '', '', 0, '2023-06-19 14:13:27', '2023-06-19 12:13:27');

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
  `phonecode` int(5) NOT NULL,
  `is_european_country` tinyint(2) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tms_country`
--

INSERT INTO `tms_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`, `is_european_country`) VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4, 93, 0),
(2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8, 355, 1),
(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12, 213, 0),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16, 1684, 0),
(5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20, 376, 1),
(6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24, 244, 0),
(7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660, 1264, 0),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL, 672, 0),
(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28, 1268, 0),
(10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32, 54, 0),
(11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51, 374, 0),
(12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533, 297, 0),
(13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36, 61, 0),
(14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40, 43, 1),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31, 994, 0),
(16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44, 1242, 0),
(17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48, 973, 0),
(18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50, 880, 0),
(19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52, 1246, 0),
(20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112, 375, 1),
(21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56, 32, 1),
(22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84, 501, 0),
(23, 'BJ', 'BENIN', 'Benin', 'BEN', 204, 229, 0),
(24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60, 1441, 0),
(25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64, 975, 0),
(26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68, 591, 0),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70, 387, 1),
(28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72, 267, 0),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL, 0, 0),
(30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76, 55, 0),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL, 246, 0),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96, 673, 0),
(33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100, 359, 1),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854, 226, 0),
(35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108, 257, 0),
(36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116, 855, 0),
(37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120, 237, 0),
(38, 'CA', 'CANADA', 'Canada', 'CAN', 124, 1, 0),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132, 238, 0),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136, 1345, 0),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140, 236, 0),
(42, 'TD', 'CHAD', 'Chad', 'TCD', 148, 235, 0),
(43, 'CL', 'CHILE', 'Chile', 'CHL', 152, 56, 0),
(44, 'CN', 'CHINA', 'China', 'CHN', 156, 86, 0),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL, 61, 0),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL, 672, 0),
(47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170, 57, 0),
(48, 'KM', 'COMOROS', 'Comoros', 'COM', 174, 269, 0),
(49, 'CG', 'CONGO', 'Congo', 'COG', 178, 242, 0),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180, 242, 0),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184, 682, 0),
(52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188, 506, 0),
(53, 'CI', 'COTE D\'IVOIRE', 'Cote D\'Ivoire', 'CIV', 384, 225, 0),
(54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191, 385, 1),
(55, 'CU', 'CUBA', 'Cuba', 'CUB', 192, 53, 0),
(56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196, 357, 1),
(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203, 420, 0),
(58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208, 45, 1),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262, 253, 0),
(60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212, 1767, 0),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214, 1809, 0),
(62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218, 593, 0),
(63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818, 20, 0),
(64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222, 503, 0),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226, 240, 0),
(66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232, 291, 0),
(67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233, 372, 1),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231, 251, 0),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238, 500, 0),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234, 298, 1),
(71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242, 679, 0),
(72, 'FI', 'FINLAND', 'Finland', 'FIN', 246, 358, 1),
(73, 'FR', 'FRANCE', 'France', 'FRA', 250, 33, 1),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254, 594, 0),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258, 689, 0),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL, 0, 0),
(77, 'GA', 'GABON', 'Gabon', 'GAB', 266, 241, 0),
(78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270, 220, 0),
(79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268, 995, 0),
(80, 'DE', 'GERMANY', 'Germany', 'DEU', 276, 49, 1),
(81, 'GH', 'GHANA', 'Ghana', 'GHA', 288, 233, 0),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292, 350, 1),
(83, 'GR', 'GREECE', 'Greece', 'GRC', 300, 30, 0),
(84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304, 299, 0),
(85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308, 1473, 0),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312, 590, 0),
(87, 'GU', 'GUAM', 'Guam', 'GUM', 316, 1671, 0),
(88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320, 502, 0),
(89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324, 224, 0),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624, 245, 0),
(91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328, 592, 0),
(92, 'HT', 'HAITI', 'Haiti', 'HTI', 332, 509, 0),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL, 0, 0),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336, 39, 0),
(95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340, 504, 0),
(96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344, 852, 0),
(97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348, 36, 1),
(98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352, 354, 1),
(99, 'IN', 'INDIA', 'India', 'IND', 356, 91, 0),
(100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360, 62, 0),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364, 98, 0),
(102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368, 964, 0),
(103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372, 353, 1),
(104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376, 972, 0),
(105, 'IT', 'ITALY', 'Italy', 'ITA', 380, 39, 1),
(106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388, 1876, 0),
(107, 'JP', 'JAPAN', 'Japan', 'JPN', 392, 81, 0),
(108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400, 962, 0),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398, 7, 0),
(110, 'KE', 'KENYA', 'Kenya', 'KEN', 404, 254, 0),
(111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296, 686, 0),
(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF', 'Korea, Democratic People\'s Republic of', 'PRK', 408, 850, 0),
(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410, 82, 0),
(114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414, 965, 0),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417, 996, 0),
(116, 'LA', 'LAO PEOPLE\'S DEMOCRATIC REPUBLIC', 'Lao People\'s Democratic Republic', 'LAO', 418, 856, 0),
(117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428, 371, 1),
(118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422, 961, 0),
(119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426, 266, 0),
(120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430, 231, 0),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434, 218, 0),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438, 423, 1),
(123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440, 370, 1),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442, 352, 1),
(125, 'MO', 'MACAO', 'Macao', 'MAC', 446, 853, 0),
(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807, 389, 0),
(127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450, 261, 0),
(128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454, 265, 0),
(129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458, 60, 0),
(130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462, 960, 0),
(131, 'ML', 'MALI', 'Mali', 'MLI', 466, 223, 0),
(132, 'MT', 'MALTA', 'Malta', 'MLT', 470, 356, 1),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584, 692, 0),
(134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474, 596, 0),
(135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478, 222, 0),
(136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480, 230, 0),
(137, 'YT', 'MAYOTTE', 'Mayotte', NULL, NULL, 269, 0),
(138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484, 52, 0),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583, 691, 0),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498, 373, 0),
(141, 'MC', 'MONACO', 'Monaco', 'MCO', 492, 377, 1),
(142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496, 976, 0),
(143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500, 1664, 0),
(144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504, 212, 0),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508, 258, 0),
(146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104, 95, 0),
(147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516, 264, 0),
(148, 'NR', 'NAURU', 'Nauru', 'NRU', 520, 674, 0),
(149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524, 977, 0),
(150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528, 31, 1),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530, 599, 0),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540, 687, 0),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554, 64, 0),
(154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558, 505, 0),
(155, 'NE', 'NIGER', 'Niger', 'NER', 562, 227, 0),
(156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566, 234, 0),
(157, 'NU', 'NIUE', 'Niue', 'NIU', 570, 683, 0),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574, 672, 0),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580, 1670, 0),
(160, 'NO', 'NORWAY', 'Norway', 'NOR', 578, 47, 1),
(161, 'OM', 'OMAN', 'Oman', 'OMN', 512, 968, 0),
(162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586, 92, 0),
(163, 'PW', 'PALAU', 'Palau', 'PLW', 585, 680, 0),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL, 970, 0),
(165, 'PA', 'PANAMA', 'Panama', 'PAN', 591, 507, 0),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598, 675, 0),
(167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600, 595, 0),
(168, 'PE', 'PERU', 'Peru', 'PER', 604, 51, 0),
(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608, 63, 0),
(170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612, 0, 0),
(171, 'PL', 'POLAND', 'Poland', 'POL', 616, 48, 1),
(172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620, 351, 1),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630, 1787, 0),
(174, 'QA', 'QATAR', 'Qatar', 'QAT', 634, 974, 0),
(175, 'RE', 'REUNION', 'Reunion', 'REU', 638, 262, 0),
(176, 'RO', 'ROMANIA', 'Romania', 'ROM', 642, 40, 1),
(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643, 70, 0),
(178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646, 250, 0),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654, 290, 0),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659, 1869, 0),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662, 1758, 0),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666, 508, 0),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670, 1784, 0),
(184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882, 684, 0),
(185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674, 378, 1),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678, 239, 0),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682, 966, 0),
(188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686, 221, 0),
(189, 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL, 381, 0),
(190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690, 248, 0),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694, 232, 0),
(192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702, 65, 0),
(193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703, 421, 1),
(194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705, 386, 1),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90, 677, 0),
(196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706, 252, 0),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710, 27, 0),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL, 0, 0),
(199, 'ES', 'SPAIN', 'Spain', 'ESP', 724, 34, 1),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144, 94, 0),
(201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736, 249, 0),
(202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740, 597, 0),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744, 47, 1),
(204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748, 268, 0),
(205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752, 46, 1),
(206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756, 41, 1),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760, 963, 0),
(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158, 886, 0),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762, 992, 0),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834, 255, 0),
(211, 'TH', 'THAILAND', 'Thailand', 'THA', 764, 66, 0),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL, 670, 0),
(213, 'TG', 'TOGO', 'Togo', 'TGO', 768, 228, 0),
(214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772, 690, 0),
(215, 'TO', 'TONGA', 'Tonga', 'TON', 776, 676, 0),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780, 1868, 0),
(217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788, 216, 0),
(218, 'TR', 'TURKEY', 'Turkey', 'TUR', 792, 90, 0),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795, 7370, 0),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796, 1649, 0),
(221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798, 688, 0),
(222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800, 256, 0),
(223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804, 380, 1),
(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784, 971, 0),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826, 44, 1),
(226, 'US', 'UNITED STATES', 'United States', 'USA', 840, 1, 0),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL, 1, 0),
(228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858, 598, 0),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860, 998, 0),
(230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548, 678, 0),
(231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862, 58, 0),
(232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', 704, 84, 0),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92, 1284, 0),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850, 1340, 0),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876, 681, 0),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732, 212, 0),
(237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887, 967, 0),
(238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894, 260, 0),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716, 263, 0);

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
  `ob_exchange_rate_auto` int(11) NOT NULL DEFAULT 1,
  `is_active` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tms_currency`
--

INSERT INTO `tms_currency` (`currency_id`, `country_name`, `currency_code`, `currency_name`, `c_current`, `c_default`, `rate`, `current_curency_rate`, `default_front`, `currency_front`, `date`, `ob_exchange_rate_auto`, `is_active`, `created_date`, `updated_date`) VALUES
(1, 'EUR', 'EUR,€', 'European Union (Euro)', '', '', 0, 0, 1, 0, '17.06.2016', 1, 1, '2016-06-17 16:14:17', '2016-06-20 12:02:13'),
(17, 'BGN', 'BGN,лв', 'Bulgarian Lev', '', '', 0, 1.9558, 0, 0, '', 1, 1, '2018-04-02 14:41:08', '2022-11-09 13:12:15'),
(18, 'GBP', 'GBP,£', 'British Pound', '', '', 0, 0.8652, 0, 0, '', 1, 1, '2018-04-17 16:56:43', '2023-10-10 18:13:08'),
(19, 'NOK', 'NOK,kr', 'Norwegian Kroner', '', '', 0, 11.4828, 0, 0, '', 1, 1, '2018-05-04 18:30:43', '2023-10-10 18:13:08'),
(22, 'USD', 'USD,$', 'US Dollar', '', '', 0, 1.0531, 0, 0, '', 1, 1, '2019-01-01 12:10:35', '2023-10-10 18:13:08'),
(23, 'CAD', 'CAD,$', 'Canadian Dollar', '', '', 0, 1.438, 0, 0, '', 1, 1, '2022-10-27 11:25:04', '2023-10-10 18:13:08');

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
  `sub_pm` int(11) NOT NULL DEFAULT 0,
  `sub_pc` int(11) NOT NULL DEFAULT 0,
  `sub_qa` int(11) NOT NULL DEFAULT 0,
  `memo` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tms_customer`
--

INSERT INTO `tms_customer` (`c_id`, `order_id`, `client`, `contact`, `indirect_customer`, `project_coordinator`, `project_manager`, `QA_specialist`, `sub_pm`, `sub_pc`, `sub_qa`, `memo`, `created_date`, `modified_date`) VALUES
(1, 2, 1, '1', 1, '4', '1', '', 0, 0, 0, '', '2023-06-02 17:03:59', '2023-08-22 14:59:19'),
(2, 4, 1, '1', 1, '4', '1', '11', 0, 0, 0, '', '2023-06-06 13:06:05', '2023-06-06 13:06:05'),
(3, 5, 2, '3', 2, '6', '8', '11', 0, 0, 0, '', '2023-06-19 14:18:31', '2023-06-19 17:48:32'),
(4, 6, 2, '3', 2, '6', '8', '', 0, 0, 0, '', '2023-06-20 14:24:25', '2023-06-20 14:24:25'),
(5, 7, 1, '1', 1, '4', '1', '13', 0, 0, 0, '', '2023-06-22 13:08:40', '2023-06-22 13:08:40'),
(6, 8, 3, '4', 2, '4', '1', '13', 0, 0, 0, '', '2023-06-22 16:28:32', '2023-06-22 16:28:32'),
(7, 9, 3, '4', 1, '2', '1', '', 0, 0, 0, '', '2023-07-21 17:52:24', '2023-07-21 17:52:24');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tms_customer_price_list`
--

INSERT INTO `tms_customer_price_list` (`price_list_id`, `price_id`, `resource_id`, `price_name`, `price_currency`, `calculation_basis`, `rounding_proc`, `min_price_item`, `specialization`, `price_language`, `price_basis`, `memo`, `created_date`, `modified_date`) VALUES
(1, 1, 2, 'Acolad, Inc. | TEP - eng>nor|dan|swe|fin', 'USD,$', '', '', '10', '2,3,5,4,6,9,14,7,1', '[{\"languagePrice\":\"English (UK) > Swedish\"},{\"languagePrice\":\"English (UK) > Danish\"},{\"languagePrice\":\"English (UK) > Norwegian (bokmal)\"},{\"languagePrice\":\"English (US) > Finnish\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words TEP Repetitions\",\"basePrice\":\"0.028\",\"standardTime\":\"\",\"childPriceId\":\"54\",\"masterPriceId\":\"9\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words TEP (New)\",\"basePrice\":\"0.14\",\"standardTime\":\"\",\"childPriceId\":\"47\",\"masterPriceId\":\"9\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words TEP 100% Match\",\"basePrice\":\"0.0141\",\"standardTime\":\"\",\"childPriceId\":\"52\",\"masterPriceId\":\"9\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words TEP 95-99% Match\",\"basePrice\":\"0.049\",\"standardTime\":\"\",\"childPriceId\":\"51\",\"masterPriceId\":\"9\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words TEP 75-84% Match\",\"basePrice\":\"0.049\",\"standardTime\":\"\",\"childPriceId\":\"49\",\"masterPriceId\":\"9\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words TEP 85-94% Match\",\"basePrice\":\"0.049\",\"standardTime\":\"\",\"childPriceId\":\"50\",\"masterPriceId\":\"9\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words TEP 50-74% Match\",\"basePrice\":\"0.14\",\"standardTime\":\"\",\"childPriceId\":\"48\",\"masterPriceId\":\"9\"}]', '', '2023-06-19 14:01:32', '2023-06-19 14:01:32'),
(2, 2, 16, 'Anil Nadiya | ENG>HIN', 'EUR,€', '', '', '', '6,5,4', '[{\"languagePrice\":\"English (US) > Hindi\"},{\"languagePrice\":\"English (US) > Norwegian (nynorsk)\"},{\"languagePrice\":\"English (US) > Norwegian (bokmal)\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"0.012\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 50-74% Match\",\"basePrice\":\"0.04\",\"standardTime\":\"\",\"childPriceId\":\"2\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Project Price\",\"basePrice\":\"105.00\",\"standardTime\":\"\",\"childPriceId\":\"13\",\"masterPriceId\":\"1\"}]', '', '2023-06-22 16:40:23', '2023-06-22 16:40:23');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
  `decimal_number` int(11) NOT NULL DEFAULT 1,
  `iUserId` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `updated_date` datetime NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tms_decimal_separator`
--

INSERT INTO `tms_decimal_separator` (`separator_id`, `separatorChar`, `decimal_number`, `iUserId`, `is_active`, `updated_date`, `created_date`) VALUES
(4, '.', 1, 1, 0, '2021-10-22 13:58:52', '2018-07-19 12:16:28'),
(6, ',', 2, 1, 1, '2023-05-30 17:37:06', '2018-09-28 14:25:33');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tms_directclientlogin`
--

INSERT INTO `tms_directclientlogin` (`iClientId`, `iUserId`, `vEmail`, `vPassword`, `v_pass`, `vWebsite`, `vDescription`, `dtCreatedDate`, `dtUpdatedDate`) VALUES
(1, 1, 'Test', 'Test123', '68eacb97d86f0c4621fa2b0e17cabd8c', 'www.beconnected.no', 'Plunet', '2023-06-02 16:59:22', '2023-06-02 16:59:22'),
(2, 2, 'beconnected', 'pisnamiii445!97!', 'f9096cbe3ce4b6e8cb7abccbb2fe848d', 'https://gcms.sajan.com', 'Client\'s system:', '2023-06-19 14:07:07', '2023-06-19 14:07:07'),
(4, 2, '-', '-', '336d5ebc5436534e61d16e63ddfca327', '', '', '2023-06-19 17:19:36', '2023-06-19 17:19:36');

-- --------------------------------------------------------

--
-- Table structure for table `tms_directiory`
--

CREATE TABLE `tms_directiory` (
  `id` int(7) UNSIGNED NOT NULL,
  `par_id` int(7) UNSIGNED NOT NULL,
  `name` varchar(256) NOT NULL,
  `content` longblob NOT NULL,
  `size` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mtime` int(10) UNSIGNED NOT NULL,
  `mime` varchar(256) NOT NULL DEFAULT 'unknown',
  `width` int(5) NOT NULL,
  `height` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
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
  `job_id` int(11) NOT NULL DEFAULT 0,
  `created` varchar(255) NOT NULL,
  `modified` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tms_discussion`
--

INSERT INTO `tms_discussion` (`id`, `order_id`, `user_id`, `iFkUserTypeId`, `parent`, `content`, `file`, `fileURL`, `fileMimeType`, `fullname`, `pings`, `profileURL`, `profile_picture_url`, `created_by_admin`, `created_by_current_user`, `upvote_count`, `user_has_upvoted`, `read_id`, `job_id`, `created`, `modified`) VALUES
(1, 2, 7, 0, 0, 'Hi team, could you please check the PO here as it is for a lower amount?', '', '', '', 'Stefaniya Koleva', '', '', 'uploads/profilePic/user-icon.png', NULL, 'true', '0', 'false', '7,1,11,', 0, '2023-06-05T12:09:17.256Z', '2023-06-05T12:09:17.256Z'),
(2, 5, 6, 0, 0, 'ready', '', '', '', 'Nadya Sekalova', '', '', 'uploads/profilePic/', NULL, 'true', '0', 'false', '6,8,8,8,8,11,13,7,', 0, '2023-06-19T09:15:39.455Z', '2023-06-19T09:15:39.455Z'),
(3, 5, 8, 0, 0, 'it`s not ready', '', '', '', 'Plamena Serafimova', '', '', 'uploads/profilePic/user-icon.png', NULL, 'true', '0', 'false', '8,13,6,11,6,7,', 0, '2023-06-19T09:56:50.468Z', '2023-06-19T09:56:50.468Z'),
(4, 5, 6, 0, 0, '<img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f605.png\">', '', '', '', 'Nadya Sekalova', '', '', 'uploads/profilePic/', NULL, 'true', '0', 'false', '6,13,8,8,11,7,', 0, '2023-06-19T09:58:04.733Z', '2023-06-19T09:58:04.733Z'),
(5, 5, 13, 0, 0, 'change color', '', '', '', 'Maria Eftimova', '', '', 'uploads/profilePic/user-icon.png', NULL, 'true', '0', 'false', '13,6,8,8,11,7,', 0, '2023-06-19T09:59:03.879Z', '2023-06-19T09:59:03.879Z'),
(6, 5, 8, 0, 0, '<img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f439.png\">', '', '', '', 'Plamena Serafimova', '', '', 'uploads/profilePic/user-icon.png', NULL, 'true', '0', 'false', '8,13,6,11,7,', 0, '2023-06-19T10:01:33.001Z', '2023-06-19T10:01:33.001Z');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tms_email_sign`
--

INSERT INTO `tms_email_sign` (`sign_id`, `sign_name`, `sign_detail`, `sign_picture`, `sign_image`, `is_active`, `created`, `updated`) VALUES
(1, '', 0x3c6469763e3c7370616e3e426573742052656761726473202f2056656e6e6c69672068696c73656e3c2f7370616e3e3c2f6469763e3c6469763e266e6273703b3c2f6469763e3c6469763e3c7370616e207374796c653d22666f6e742d66616d696c793a207072697374696e613b20666f6e742d73697a653a206c617267653b20223e4265636f6e6e65637465643c2f7370616e3e3c2f6469763e3c6469763e3c7370616e3e436f2d466f756e6465722026616d703b20427573696e65737320446576656c6f7065723c2f7370616e3e3c62723e3c7370616e3e3c6120687265663d226d61696c746f3a6973756e646c616e64407370656c6c75702e6e6f253230223e746d73406265636f6e6e65637465642e6e6f3c2f613e3c2f7370616e3e3c2f6469763e3c6469763e3c7370616e3e5765623a203c6120687265663d22687474703a2f2f7777772e7370656c6c75702e6e6f223e7777772e6265636f6e6e65637465642e6e6f3c2f613e3c2f7370616e3e3c2f6469763e3c6469763e3c7370616e3e3c6120687265663d2268747470733a2f2f746d732e6265636f6e6e65637465642e6e6f2f6173736574732f696d672f4265436f6e6e65637465645f4c6f676f2e706e67223e3c696d6720636c6173733d2266722d6469622066722d647261676761626c652066722d66696c22207372633d222f75706c6f6164732f75706c6f61645f696d6167652f343062393466656238616664306335663331386630386438316538316237343433313530323532642e706e6722207374796c653d2277696474683a2031353070783b223e3c2f613e3c2f7370616e3e3c2f6469763e3c6469763e3c7370616e3e53616e64616b6572766569656e203133382030343834204f736c6f204e6f727761793c2f7370616e3e3c2f6469763e, '1541049277.gif', 0x646174613a696d6167652f6769663b6261736536342c52306c474f446c6857514c5441504541414141414144424a525732467141414141434835424145414141414149663473654849365a44704551555a504d6c4274554749784e446f344d5378714f6a4d334f5449324f4459334d6a677a4c4851364d6a49784d44457a4d5463414966384c535731685a32564e595764705932734e5a324674625745394d4334304e5451314e5141682f77745954564167524746305956684e5544772f654842685932746c644342695a576470626a306e3737752f4a7942705a44306e567a564e4d4531775132566f61556836636d5654656b355559337072597a6c6b4a7a382b436a78344f6e68746347316c6447456765473173626e4d366544306e59575276596d5536626e4d36625756305953386e4948673665473177644773394a306c745957646c4f6a704665476c6d56473976624341784d6934304d43632b436a78795a475936556b5247494868746247357a4f6e4a6b5a6a306e6148523063446f764c336433647935334d793576636d63764d546b354f5338774d6938794d6931795a47597463336c75644746344c57357a4979632b43676f6750484a6b5a6a70455a584e6a636d6c7764476c76626942795a47593659574a76645851394a79634b4943423462577875637a703061575a6d5053646f644852774f693876626e4d7559575276596d5575593239744c3352705a6d59764d5334774c79632b43694167504852705a6d593654334a705a573530595852706232342b4d54777664476c6d5a6a7050636d6c6c626e526864476c76626a344b49447776636d526d4f6b526c63324e79615842306157397550676f384c334a6b5a6a70535245592b436a777665447034625842745a58526850676f674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674369416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943414b49434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749416f674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674369416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943414b49434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749416f674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674369416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943414b49434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749416f674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674369416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943414b49434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749416f674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674369416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943414b49434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749416f674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674369416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943414b49434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749416f674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674369416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943414b49434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749416f674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674369416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943414b49434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749416f385033687759574e725a5851675a57356b505364334a7a382b41662f2b2f667a372b766e34392f6231395050793866447637753373362b7270364f666d3565546a3475486733393764334e766132646a583174585530394c52304d2f4f7a637a4c79736e4978386246784d50437763432f7672323875377135754c65327462537a7372477772363674724b75717161696e7071576b6f364b686f4a2b656e5a79626d706d596c3561566c4a4f536b5a43506a6f324d6934714a6949654768595344676f4741663335396648743665586833646e563063334a786347397562577872616d6c6f5a325a6c5a474e6959574266586c31635731705a5746645756565254556c46515430354e5445744b53556848526b564551304a425144382b505477374f6a6b344e7a59314e444d794d5441764c6930734b796f704b43636d4a53516a4969456748783464484273614752675846685555457849524541384f4451774c43676b494277594642414d43415141414c4141414141425a41744d4141414c2b68492b70792b30506f357930326f757a33727a3744346269534a626d696162717972627543386679544e66326a6566367a76662b4477774b683853693859684d4b70664d70764d4a6a55716e314b723169733171743979753977734f6938666b73766d4d54717658374c613749346a4c352f5436334750503677587676762f7674536459787a466f47416559714c6a596447685936436a494f456c5a32524d70755947355a396e702b646d7971516370536768366970717138706a4371766f4b47357668656b49726534756265324262777176376d31434b694d454833446934696d79384c44776163626538354473794464457354484b644759326758553348725651644d75376776556c396e68634f6f4f3634414d352b565035427a2b442b4c6f4a7679747a633772384c6d7277693975416f7337437659495745416f464657766a776e357942526852714f6769526f54502b6368714c2f636f33717852466768684e57455234364965646b64314f6d6b5048556f684c596955357a6d53784d75624e423568697971795a445769396c4435795569536144716e506f6b4c314e5457344d316d3867557144506c317149796f4672547972366a41716a3673457356684e586832364c656e5a475744446b52326274757a587456413539664b616f32323074785069797358423936566645434235364457474634586476334d4871393334654c4668667477433934584d2b49626c6533527062695a4d7556396e7034637a7378327434624f42776a744b3631494e4e375270477242624f736154574c50736a375774755a37396f76647131426d4a6839723957726a6771634270473738416d33586a686f69564c352f5976496279364c6d7a4973636c336358763743753250343939586970313374617665795166772f7a7475764f3166373856586a787a2b4d482b30322f3133315637304e306e53333748726363665467436968356c4e4335713148337350586f526767756f31614a566b70453259495861696352685368525971426d494433416d49556f544a6f51695069694f5357423961476a6f5934326b75676d65676768362b5746364a6e4e55596f6f2b67335968666a6a337579474d725169707734704b3445566c6752444a4171524b56516179546c354f327a54696b6c7153494f41534267456d3553453958697549636b4639694b4b4f614d497a5847706e546456656c4e73574a464b633362336f356e4a737038706d616d4333612b52394163374a49487a594d58715062507672354753536254774961365442334b76714d4f6f63695369476a766a6b365a5566767763686c5a48414779756d696f36714b357166346a416b54456565344375716a3439445a4a70616b53706f6f722f5a5a796153654153594571356d79456d722b6f7169326c766f6a73376d65327175676c6671614a706a75745a7073523433472b6b525453486d714a4b5239557473707564454336786d6c36534c5a70613742486753756a6467655536717a41526c376c3768626d6a7567766e2f7932362b3641625037724976326a6d766b6864784b4d3569377242364d4b7353304f6c777775755653334b374538556b373847455944347472754a694b307a44487763695a4d62535a2b6e7574795245442f4b2f4765317038365734716e35797779495969555a504c673334476f6d58797952777a7a4d74617569484650722b623672334956685458306a2b58364350566744624a73733549303969573145774c334f7a545961626c3964525a34327a307739595758586168524e663838625945542b707532326944625861385a307047383852765a2f7533326e4f76477a66584e374e392b4e47725672786a337943665462657765322f2b354c6a66616564647565426258357734345a3166317254662b564b2b647365424a3631706e6152767a6e6a6d2b78612b35755759752b36323743766a585476726b664e5475756577363168726e73375133764c766a332b654f2f4a664733397537373472722f586975386444504f4334682b334f5a4859352f337a6276623031744f325751372b7237733050773733707a42394a624a593563793637634348664c6a376f70394e2f662f536a662f382b384d46584b372f357a53353933534d673973696e4f656c4e443445514d6d4143485167334268727556514345485034754a3843583151396836344e6639617958762f49704d485968664f41493563555146467077664a304c3377596c5573494c327131344d327a6734456a345168625763482f2f3839384b6457684146336151686a644d325134482b4545656e6c43444d5a536842473359772b674e30594d2b7979442b45786b6f78434d754c3463644d68384f6e776a454968617266657a375952693965454177676e434b61557a693862523474795a3263596e54596d4d643156674c6a6669516932644534786278694551784a6c4268674f51674831464878774a4355483132564f477343466e494e586251696e6573595262642b4d6449396b714a6d67796b494c564877547943725838776c434d52462f6d3654686f536a716c734a43453579636f3371684b4b6b6f4d6c4a70316f4d6b6f79636f6558524b5573592f6b73572f6f53636344636f3934514f637457336b7958455a52674c7a2b7053476a4f624a6874764755666f5a41395955707a6752776a355336502b45772f586a475a6e744f6d4f436449546b6a4f4335335562436136764a6d384834597a6b64453835386173755570382f6c4b666a6c786e362b7870524a5564303452676e43637458616d2f4f525a546b756b304a72372b4174724f65444a50564b48384a7a32707545313352745255357577504d332b794d34743674434155665351792b616e4d6a6362786b496272714f4a59366a34385154536a3341525753554e36557056576b3662324d794d6958667253686f3530596563443645783764394f484868536c546f4e705068644b517141653648704244527275336f6456654a6f4b716b2f6c71516c563539557754744f6e54434571526f317130584e71465167474e5364617078725766623631714847466d6c6b72576464364a6e4b745945566f542f313679727a5355716f4f585368544353725972733731692b2f3861466c4e795643644e685779584675715a4d395950752b67624a79586c6173392b667059703636306d4a75563230574a6d56694e4c7661767070586e56525543326b74637a556d6c315778714d396e5a774a3632593631644959763646317451696a616c743858745953762b5a646e6934704b7058503272622f4547584d664b6c717965464356564a3562633165493174365863625861542b467342426c6434773532734a73664c772b384f6c624a786a4f6d457767746239493452734d7656376a576e71317a7a4e6e65306e5252715a486b4a5866484b743766487263324155616665716a4a33762f56744a337a39644f4266736465343976567368656559594c695774377665646575464f6378672f626f73776857637059464a6e436a7262706a434837365765357634594b4b684f4654555a6245493659766744426557757943656277356a444c5061386d79324e525a7869466d72347a4a75474d64302f6242305555765447592b567959473973582b50702b495647356e48505359776741576d53796d7631385238656e4a6b72487a634c6563336b31364f714a6b6c366b41784b376a4656555a7a6d7048383351357656382b4961334e71332b7a2b584b2f4a656364302f6d2b6850586c6f4a7470357a54744e394f7873363170316658545153695a7a6b596e4c614e347532744749726e536d76357057507175577333666574447135544f6c465354475a375a6b776e4465616171326b656b74484658576743777a6f71473661302f7a6c636c644c584e426331356e55767436585346667436316d3735395334767252782b776c4849662b7a707358753772464e7a657871487a44625042366c7333576255366943543044674461436b6856303054314f35756872324c3770425046774f786272635a535a333031677462636279757448375a6e6534536576546435757431725a75634d46667257337a45707166722f57326b4f3561314b324b47354d43373757326c5733496474653434656465457354503674597373375062514e5a79786a584f337573705665494d2f37676938337a774c66363733785733634d77744e32662b4e564c563566724f7445776a6e75564436727a6d697632306f59322b626f4f44383975367861656352305a73646273526a30386e757331762f7363706f2f6536705954333071337539596e34466378695358712b7a357077544f765535425a48784e695a446a4931312f58733143344742674f3845364776764f366c526a51313257356a65456354306d30504974337233737052332f4d6b4a52516273626c65644b6e422f65694a527a6a57792b563345663263323733474c4c41644136436b6e6c4430334859573242766365517537392b686b52446d4355756a6a69753435646177334b624c31364f66467758373156782b6f3141655854664c53767565794c337a77667a3938534d66742b4447312f4f61315469444843782b6e6147652b385a4f2f384f6372667a7a5378326233463238756e6b2f2f3943767966657874756e6373514e367a36704f43713565796673582b772b31466f557353634f6f2f45767a62507a503670307238392f38582f5263572f7765415a53474137484341426567544356675a424b6941432b6941626847424435682f45376758466b6942417a68356a4d47414761694237396363486569424572694241596942493369424a536758496f694348774a344b3369434c6567514d5367684c796944574d47434d3669434e77682f4e46682b4e7369444f754744755a43445156676b4f39694451326945716b422b48466945532f674b5457694353676946707943464d4569465666674a563269415436694656756946523469455835694359386753474565474452694773484234615a6767626169413665654750434b484875685063306948346b642f6f6e6435654c694666476768664e687666716749677469485033685468436945674d6766687169495a796949676369496a3367556b30694a6c34694a6d61694a6d386a2b695a336f695a38496971456f69714e496971566f6971654969716d6f697176496971336f697138496937456f69374e496937566f6937654969376d6f693776496937336f693738496a4d456f6a4d4e496a4d566f6a4d65496a4d6d6f6a4d76496a4d336f6a4d38496a64456f6a644e496a64566f6a6465496a646d6f6a6476496a64336f6a6438496a746359414f4e496a7556496a6731676a7557594151457741657134414f5949416641596a2f4a3441756c6f6a2b69596a75336f6a764d346a6778416a2f68346a7546344241455a6b4142516b4f2f596a7764776b424b516b417a5a6b4172776b416a4a6a676f5a6b5169704152554a6b415a516b41755a41427a706a772f706b524b4a6a7650596b5267706b4433516b4164706b686f5a6b5348356b5250706b4361356b69774a6b54434a6a7864706b772b516b69435a6b79585a6b78594a6c4471356b6a2b4a41426a2b4f5a4d6e6d514d32715a4a45795a4939655a512b53514837574a494f494a4d6b69514653535a5646795a4e552b5a5168365a4955575a5663365939494b51524b325a4a63365a5250435a5a4d435a4547615a5273365a4673535a4e58365a594d715a5535435a64646d5a6678364a592f4b5a6468535a592f594a5a34695a59314b5a634b4f5a63524d4a45634f5a4e664b5a595830493971615a4233325a4746615a6b76715a4e4e325a6158475a684b344a68514f5a5632325a65694f5a70614b5a5348475a5156734a6953535a6e362b4a654e655a5177755a4376795a716479514f66325a7067535a7031715a6935795a746f695a716d435a6b5561514734715a7563615a695a715a6c4679592b31615a7334594a7a4c575a71374b5a6d444b5a796e615a7a4f715a472b715a6931365a68662b5a322b475a7a2f2b4a7842454a326c655a3654655a7a4b755a3673535a372b487a6d6331786d5455526d6273506d586f4b6d654d616d6435516b4435376d52376d6d50714a6d5771366d616e366d644152716336396d6474496d636d396d61436271572f416b452f726d5675796d6449356d636a516d66516c6d6379656d61394d6d67475a6d5650736d4f454b716745726f444647716456686d6149327159476971536a316d5a474e7169437771694c4a716159356d6837466d6a4b4b6f444b74716a4f6c715466436d524d4f71684e2b6d67536371644463716b51537166516b71695050716b5067716433746d5358596d5a4c7671694d6a716c512b716b32376d684e7671684f4e716c5372716b4d2b716c5650716a566a71675770716d5548716b4d5871694f6671625a6b7163387a6d6d5a46716e6276716c6431716d61696f443934696453386d59574e6d5863576d6f694a6d56676771634156716b5255716269557169754d6d6f6778716d6a626f576e344371715a764b715a3371715a384b7171457171714e4b71706c5241414137, 1, '2017-10-14 13:27:43', '2023-07-04 15:51:47'),
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
  `center_unit_id` varchar(255) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tms_email_templates`
--

INSERT INTO `tms_email_templates` (`template_id`, `template_name`, `template_content`, `template_subject`, `template_category`, `center_unit_id`, `is_active`, `created_by`, `created_date`, `updated_date`) VALUES
(5, 'For reset password', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\n<meta name=\"format-detection\" content=\"telephone=no\"> <!-- disable auto telephone linking in iOS -->\n<title></title>\n<link href=\"https://fonts.googleapis.com/css?family=Roboto\" rel=\"stylesheet\">\n<style>\n	html,\n	body,\n	p {\n		font-family: \'Roboto\', sans-serif;\n		font-size: 14px;\n	}\n</style>\n<table style=\"display: table;border-collapse: separate;box-sizing: border-box;\" border=\"0\" width=\"100%\" align=\"center\">\n	<tbody>\n		<tr>\n			<td>\n				<table\n					style=\"border: 1px solid #c9d6df;border-radius:20px;box-sizing: border-box;border-collapse: collapse; border: 1px solid #d1c7c7 !important;background-color: #fff;\"\n					border=\"1\" width=\"600\" align=\"center\">\n					<tbody>\n						<tr>\n							<td>\n								<table\n									style=\"display: table;border-collapse: separate;box-sizing: border-box;box-sizing: border-box;border-collapse: collapse;\"\n									border=\"0\" align=\"center\" width=\"100%\">\n									<tbody>\n										<tr>\n											<td\n												style=\"padding: 15px;/* height: 50px; */background-color: #efefef;border-bottom: 1px solid #bfbfbf;\">\n												<center> <img src=\"https://tms.beconnected.no/assets/img/logo.png\"\n														class=\"img-full\" alt=\"...\"\n														style=\"max-height: initial;width: 250px;\"> </center>\n											</td>\n										</tr>\n										<!--<tr>-->\n										<!--<td><span style=\"height: 1px;width: 100%;background-color: #d1c7c7;display: block;\">&nbsp;</span></td>-->\n										<!--</tr>-->\n										<tr>\n											<td style=\"padding: 15px;\">\n												<p>Hi [USERNAME],</p>\n												<hr>\n												<p>You recently requested to reset your password for SpellUp\n													account.Please click on&nbsp;</p>\n												<p>the below link to reset it : </p>\n												[RESETPASSWORDLINK]<br><br>If you did not requested for reset, please\n												ignore this email.<br><br>Kind regards,<br>TMS Team.\n											</td>\n										</tr>\n										<tr>\n											<td\n												style=\"padding: 5px;background-color: #efefef;border-top: 1px solid #b5b5b5;\">\n												<center>\n													<div style=\"text-align: left;\">\n														<span><em>For more information, visit us\n																at <a style=\"color: #000000;\"\n																	href=\"https://www.beconnected.no\"><u>www.beconnected.no</u></a>\n																<em></span>\n													</div>\n													<div> </div><br>\n													<div style=\"text-align: left;\"><span\n															style=\"/* color: #000000; */\"><em>This email and any\n																attachments to it may be confidential and are intended\n																solely for the use of the individual to whom it is\n																addressed. If you are not the intended recipient of this\n																email, you must neither take any action based upon its\n																contents, nor copy or show it to anyone. If you have\n																received this transmission in error, please use the\n																reply function to tell us and then permanently delete\n																what you have received.</em></span></div>\n													<div> </div>\n													<div> </div>\n												</center>\n											</td>\n										</tr>\n									</tbody>\n								</table>\n							</td>\n						</tr>\n					</tbody>\n				</table>\n			</td>\n		</tr>\n	</tbody>\n</table>', 'Reset Password', 3, '', 1, 1, '2018-09-08 14:57:11', '2023-05-31 12:49:30'),
(6, 'For Accepted job by resource', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\n<meta name=\"format-detection\" content=\"telephone=no\"> <!-- disable auto telephone linking in iOS -->\n<title></title>\n<link href=\"https://fonts.googleapis.com/css?family=Roboto\" rel=\"stylesheet\">\n<style>\n	html,\n	body,\n	p {\n		font-family: \'Roboto\', sans-serif;\n		font-size: 14px;\n	}\n</style>\n<table style=\"display: table;border-collapse: separate;box-sizing: border-box;\" border=\"0\" width=\"100%\" align=\"center\">\n	<tbody>\n		<tr>\n			<td>\n				<table\n					style=\"border: 1px solid #c9d6df;border-radius:20px;box-sizing: border-box;border-collapse: collapse; border: 1px solid #d1c7c7 !important;background-color: #fff;\"\n					border=\"1\" width=\"600\" align=\"center\">\n					<tbody>\n						<tr>\n							<td>\n								<table\n									style=\"display: table;border-collapse: separate;box-sizing: border-box;box-sizing: border-box;border-collapse: collapse;\"\n									border=\"0\" align=\"center\" width=\"100%\">\n									<tbody>\n										<tr>\n											<td\n												style=\"padding: 15px;/* height: 50px; */background-color: #efefef;border-bottom: 1px solid #bfbfbf;\">\n												<center> <img src=\"https://tms.beconnected.no/assets/img/logo.png\"\n														class=\"img-full\" alt=\"...\"\n														style=\"max-height: initial;width: 250px;\"> </center>\n											</td>\n										</tr>\n										<tr>\n											<td style=\"padding: 15px;\">\n												<p><span>Hi!<br></span></p>\n\n												<div><span>I would like to let you know that I\'m happy to accept the\n														job.</span></div>\n												<div><span> </span></div>\n												<div>\n													<span><b>JOB</b></span><br><span>[JOBNO]</span><br><br><span><b>LANGUAGES</b></span><br><span>[LANGUAGES]</span><br><br><span><b>RESOURCE</b></span><br><span>[RESOURCENAME]</span>\n												</div>\n												<div><span> </span></div>\n												<div><span>[JOBREQUESTCOMMENT]</span></div>\n											</td>\n										</tr>\n										<tr>\n											<td\n												style=\"padding: 5px;background-color: #efefef;border-top: 1px solid #b5b5b5;\">\n												<center>\n													<div style=\"text-align: left;\">\n														<span><em>For more information, visit us at <a style=\"color: #000000;\" href=\"https://www.beconnected.no\"><u>www.beconnected.no</u></a> </em></span>\n													</div>\n													<div> </div><br>\n													<div style=\"text-align: left;\"><span><em>This email and any\n																attachments to it may be confidential and are intended\n																solely for the use of the individual to whom it is\n																addressed. If you are not the intended recipient of this\n																email, you must neither take any action based upon its\n																contents, nor copy or show it to anyone. If you have\n																received this transmission in error, please use the\n																reply function to tell us and then permanently delete\n																what you have received.</em></span></div>\n													<div> </div>\n													<div> </div>\n												</center>\n											</td>\n										</tr>\n									</tbody>\n								</table>\n							</td>\n						</tr>\n					</tbody>\n				</table>\n			</td>\n		</tr>\n	</tbody>\n</table>', 'Job accepted by resource', 1, '', 1, 1, '2018-10-26 18:10:31', '2023-05-31 12:48:47'),
(7, 'For job rejected by resource', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\n<meta name=\"format-detection\" content=\"telephone=no\"> <!-- disable auto telephone linking in iOS -->\n<title></title>\n\n<link href=\"https://fonts.googleapis.com/css?family=Roboto\" rel=\"stylesheet\">\n<style>\n	html,\n	body,\n	p {\n		font-family: \'Roboto\', sans-serif;\n		font-size: 14px;\n	}\n</style>\n\n<table style=\"display: table;border-collapse: separate;box-sizing: border-box;\" border=\"0\" width=\"100%\" align=\"center\">\n	<tbody>\n		<tr>\n			<td>\n				<table\n					style=\"border: 1px solid #c9d6df;border-radius:20px;box-sizing: border-box;border-collapse: collapse; border: 1px solid #d1c7c7 !important;background-color: #fff;\"\n					border=\"1\" width=\"600\" align=\"center\">\n					<tbody>\n						<tr>\n							<td>\n								<table\n									style=\"display: table;border-collapse: separate;box-sizing: border-box;box-sizing: border-box;border-collapse: collapse;\"\n									border=\"0\" align=\"center\" width=\"100%\">\n									<tbody>\n										<tr>\n											<td\n												style=\"padding: 15px;/* height: 50px; */background-color: #efefef;border-bottom: 1px solid #bfbfbf;\">\n												<center>\n													<img src=\"https://tms.beconnected.no/assets/img/logo.png\"\n														class=\"img-full\" alt=\"...\"\n														style=\"max-height: initial;width: 250px;\">\n												</center>\n											</td>\n										</tr>\n										<tr>\n											<td style=\"padding: 15px;\">\n												<div>\n													<p><span>Hi!<br></span></p>\n												</div>\n\n												<div><span>I regret to inform you that the following job has been\n														assigned to another resource.<br></span></div>\n												<div> </div>\n												<span><b><br>JOB:</b></span><br>\n												<font face=\"khmer ui, geneva\">[JOBNO]</font>\n												<br><br><span><b>SUBJECT:</b></span><br>\n												<font face=\"khmer ui, geneva\">[PROJECTNAME]</font>\n												<br><br><span><b>LANGUAGES:</b></span><br>\n												<font face=\"khmer ui, geneva\">[LANGUAGES]</font>\n												<br><br><span><b>DEADLINE:</b></span><br>\n												<font face=\"khmer ui, geneva\">[DEADLINE]</font><br><br><span><b>REJECT\n														REASON:</b></span><br>[REJECTREASON]<br><br>\n\n											</td>\n										</tr>\n										<tr>\n											<td\n												style=\"padding: 5px;background-color: #efefef;border-top: 1px solid #b5b5b5;\">\n												<center>\n													<div style=\"text-align: left;\">\n														<span> <em>For more information, visit us at <a style=\"color: #000000;\" href=\"https://www.beconnected.no\"><u>www.beconnected.no</u></a> </em></span>\n													</div>\n													<div> </div>\n													<br>\n													<div style=\"text-align: left;\"><span><em>This email and any\n																attachments to it may be confidential and are intended\n																solely for the use of the individual to whom it is\n																addressed. If you are not the intended recipient of this\n																email, you must neither take any action based upon its\n																contents, nor copy or show it to anyone. If you have\n																received this transmission in error, please use the\n																reply function to tell us and then permanently delete\n																what you have received.</em></span></div>\n													<div> </div>\n													<div> </div>\n\n												</center>\n											</td>\n										</tr>\n									</tbody>\n								</table>\n							</td>\n						</tr>\n					</tbody>\n				</table>\n			</td>\n		</tr>\n	</tbody>\n</table>', 'Job rejected by resource', 2, '', 1, 1, '2018-10-29 14:56:26', '2023-05-31 12:48:00'),
(8, 'For registration email', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\n<meta name=\"format-detection\" content=\"telephone=no\"> <!-- disable auto telephone linking in iOS -->\n<title></title>\n\n<link href=\"https://fonts.googleapis.com/css?family=Roboto\" rel=\"stylesheet\">\n<style>\n	html,\n	body,\n	p {\n		font-family: \'Roboto\', sans-serif;\n		font-size: 14px;\n	}\n</style>\n\n<table style=\"display: table;border-collapse: separate;box-sizing: border-box;\" border=\"0\" width=\"100%\" align=\"center\">\n	<tbody>\n		<tr>\n			<td>\n				<table style=\"border: 1px solid #c9d6df;border-radius:20px;box-sizing: border-box;border-collapse: collapse; border: 1px solid #d1c7c7 !important;background-color: #fff;\" border=\"1\" width=\"600\" align=\"center\">\n					<tbody>\n						<tr>\n							<td>\n								<table style=\"display: table;border-collapse: separate;box-sizing: border-box;box-sizing: border-box;border-collapse: collapse;\" border=\"0\" align=\"center\" width=\"100%\">\n									<tbody>\n										<tr>\n											<td style=\"padding: 15px;/* height: 50px; */background-color: #efefef;border-bottom: 1px solid #bfbfbf;\">\n												<center>\n													<img src=\"https://tms.beconnected.no/assets/img/logo.png\" class=\"img-full\" alt=\"...\" style=\"max-height: initial;width: 250px;\">\n												</center>\n											</td>\n										</tr>\n										<tr>\n											<td style=\"padding: 15px;\">\n												<div><span>Hi [USERNAME],</span></div>\n												<div> </div><br><br>\n												<div><span>Thank you so much for registering with Beconnected!</span><br>\n													<span>We are delighted to have you onboard ?</span>\n												</div>\n												<div> </div><br><br>\n												<div><span>Please confirm your registration by clicking on the link\n														below:<br><br>\n														[REGISTRATIONLINK]<br><br>\n														Your login details\n														are:<br><br>Email:<br>[USEREMAIL]<br><br>Password:<br>[USERPASSWORD]<br><br>\n														Please remember to change your password on first login.<br><br>\n												</span></div>\n												<div> </div>\n												<div><span>If you have any questions, please do not hesitate to contact\n														us.</span></div><br>\n												<div>\n													<div>\n														<div><span>We are looking forward to work with you!\n																?</span></div><br><br>\n\n														<div><span>Best Regards</span></div>\n														<div> </div>\n														<div><span>The Beconnected Team</span></div>\n													</div>\n												</div>\n											</td>\n										</tr>\n										<tr>\n											<td style=\"padding: 5px;background-color: #efefef;border-top: 1px solid #b5b5b5;\">\n												<center>\n													<div style=\"text-align: left;\">\n														<span>\n															<em>For more information, visit us at\n																<a style=\"color: #000000;\" href=\"https://www.beconnected.no\"><u>www.beconnected.no</u></a>\n															</em>\n														</span>\n													</div>\n													<div> </div><br>\n													<div style=\"text-align:left;\"><span><em>This email and any\n																attachments to it may be confidential and are intended\n																solely for the use of the individual to whom it is\n																addressed.\n																If you are not the intended recipient of this email, you\n																must neither take any action based upon its contents,\n																nor copy or show it to anyone.\n																If you have received this transmission in error, please\n																use the reply function to tell us and then permanently\n																delete what you have received.</em></span></div>\n													<div> </div>\n												</center>\n											</td>\n										</tr>\n									</tbody>\n								</table>\n							</td>\n						</tr>\n					</tbody>\n				</table>\n			</td>\n		</tr>\n	</tbody>\n</table>', 'Welcome to BeConnected | TMS', 4, '', 1, 1, '2018-10-29 15:31:46', '2023-10-04 18:56:59'),
(9, 'For overdue job', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\n<meta name=\"format-detection\" content=\"telephone=no\"> <!-- disable auto telephone linking in iOS -->\n<title></title>\n\n<link href=\"https://fonts.googleapis.com/css?family=Roboto\" rel=\"stylesheet\">\n<style>\n	html,\n	body,\n	p {\n		font-family: \'Roboto\', sans-serif;\n		font-size: 14px;\n	}\n</style>\n\n\n\n<table style=\"display: table;border-collapse: separate;box-sizing: border-box;\" border=\"0\" width=\"100%\" align=\"center\">\n	<tbody>\n		<tr>\n			<td>\n				<table style=\"border: 1px solid #c9d6df;border-radius:20px;box-sizing: border-box;border-collapse: collapse; border: 1px solid #d1c7c7 !important;background-color: #fff;\" border=\"1\" width=\"600\" align=\"center\">\n					<tbody>\n						<tr>\n							<td>\n								<table style=\"display: table;border-collapse: separate;box-sizing: border-box;box-sizing: border-box;border-collapse: collapse;\" border=\"0\" align=\"center\" width=\"100%\">\n									<tbody>\n										<tr>\n											<td style=\"padding: 15px;/* height: 50px; */background-color: #efefef;border-bottom: 1px solid #bfbfbf;\">\n												<center>\n													<img src=\"https://tms.beconnected.no/assets/img/logo.png\" class=\"img-full\" alt=\"...\" style=\"max-height: initial;;width: 250px;\">\n												</center>\n											</td>\n										</tr>\n										<tr>\n											<td style=\"padding: 15px;\">\n												<div>\n													<div>\n														<div><span>Hi there!</span></div>\n														<div> </div>\n														<div><span>IMPORTANT!</span></div>\n														<div> </div>\n														<div><span>This job is overdue - and you need to take action\n																immediately - so this project is delivered on\n																time.</span></div>\n														<div> </div>\n														<div><span>This is some information about the overdue\n																job:</span></div>\n														<div> </div>\n													</div>\n												</div>\n												<div>\n													<span><b>JOB:</b></span><br><span>[JOBNO]</span><br><br><span><b>RESOURCE:</b></span><br><span>[NAMEJOBRECEIVER]</span><br><br><span><b>CUSTOMER:</b></span><br><span>[CUSTOMERNAME]</span>\n												</div>\n												<div><span><br></span></div>\n												<div> </div>\n												<div>\n													<div>\n														<div><span><b>PROJECT:</b></span></div>\n														<span>[PROJECTNAME]</span>\n													</div>\n													<div><span><br></span></div>\n													<div><span> </span></div>\n													<div><span><b>TASK:</b></span><br><span>[JOBSERVICE]</span></div>\n													<div><span><br></span></div>\n													<div><span> </span></div>\n													<div><span><b>DEADLINE:</b></span><br><span>[DEADLINE]</span></div>\n													<div> </div>\n												</div>\n											</td>\n										</tr>\n										<tr>\n											<td style=\"padding: 5px;background-color: #efefef;border-top: 1px solid #b5b5b5;\">\n												<center>\n													<div style=\"text-align: left;\"><span style=\"/* color: #060606; */\">For more information, visit us\n															at <a style=\"color: #000000;\" href=\"https://www.beconnected.no\"><u>www.beconnected.no</u></a></span>\n													</div>\n													<div style=\"text-align: left;\"><span style=\"color: #ffffff;\"><u style=\"color: rgb(255, 255, 255);\"><br></u></span></div>\n													<div> </div><br>\n													<div style=\"text-align: left;\"><span><em>This email and any\n																attachments to it may be confidential and are intended\n																solely for the use of the individual to whom it is\n																addressed. If you are not the intended recipient of this\n																email, you must neither take any action based upon its\n																contents, nor copy or show it to anyone. If you have\n																received this transmission in error, please use the\n																reply function to tell us and then permanently delete\n																what you have received.</em></span></div>\n													<div> </div>\n													<div> </div>\n												</center>\n											</td>\n										</tr>\n									</tbody>\n								</table>\n							</td>\n						</tr>\n					</tbody>\n				</table>\n			</td>\n		</tr>\n	</tbody>\n</table>', 'Overdue job', 5, '', 1, 1, '2018-10-29 16:02:02', '2023-05-31 12:46:00'),
(10, 'For job Delivery', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\n<meta name=\"format-detection\" content=\"telephone=no\"> <!-- disable auto telephone linking in iOS -->\n<title></title>\n\n<link href=\"https://fonts.googleapis.com/css?family=Roboto\" rel=\"stylesheet\">\n<style>\n	html,\n	body,\n	p {\n		font-family: \'Roboto\', sans-serif;\n		font-size: 14px;\n	}\n</style>\n\n\n\n<table style=\"display: table;border-collapse: separate;box-sizing: border-box;\" border=\"0\" width=\"100%\" align=\"center\">\n	<tbody>\n		<tr>\n			<td>\n				<table\n					style=\"border: 1px solid #c9d6df;border-radius:20px;box-sizing: border-box;border-collapse: collapse; border: 1px solid #d1c7c7 !important;background-color: #fff;\"\n					border=\"1\" width=\"600\" align=\"center\">\n					<tbody>\n						<tr>\n							<td>\n								<table\n									style=\"display: table;border-collapse: separate;box-sizing: border-box;box-sizing: border-box;border-collapse: collapse;\"\n									border=\"0\" align=\"center\" width=\"100%\">\n									<tbody>\n										<tr>\n											<td\n												style=\"padding: 15px;/* height: 50px; */background-color: #efefef;border-bottom: 1px solid #bfbfbf;\">\n												<center>\n													<img src=\"http://tms.beconnected.no/assets/img/logo.png\"\n														class=\"img-full\" alt=\"...\"\n														style=\"max-height: initial;width: 250px;\">\n												</center>\n											</td>\n										</tr>\n										<tr>\n											<td style=\"padding: 15px;\">\n												<div>\n													<div><span>Hi there!</span></div>\n													<div> </div>\n													<div><span>The following job has been delivered :</span></div>\n												</div>\n												<div> </div>\n												<div><span><b>JOB:</b></span></div>\n												<div><span>[JOBNO]</span>\n													<p><span><b>DESCRIPTION:</b></span><br><span>[JOBDESCRIPTION]</span>\n													</p>\n													<span><b>COMMENT:</b></span><br><span>[DELIVERYNOTE]</span>\n												</div>\n											</td>\n										</tr>\n										<tr>\n											<td\n												style=\"padding: 5px;background-color: #efefef;border-top: 1px solid #b5b5b5;\">\n												<center>\n													<div style=\"text-align: left;\"><span><em>For more information, visit\n																us\n																at <a style=\"color: #000000;\"\n																	href=\"https://www.beconnected.no\"><u>www.beconnected.no</u></a>\n															</em></span>\n													</div>\n													<div> </div><br>\n													<div style=\"text-align: left;\"><span><em>This email and any\n																attachments to it may be confidential and are intended\n																solely for the use of the individual to whom it is\n																addressed. If you are not the intended recipient of this\n																email, you must neither take any action based upon its\n																contents nor copy or show it to anyone. If you have\n																received this transmission in error, please use the\n																reply function to tell us and then permanently delete\n																what you have received.</em></span></div>\n													<div> </div>\n													<div> </div>\n\n												</center>\n											</td>\n										</tr>\n									</tbody>\n								</table>\n							</td>\n						</tr>\n					</tbody>\n				</table>\n			</td>\n		</tr>\n	</tbody>\n</table>        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\n        <meta name=\"format-detection\" content=\"telephone=no\"> <!-- disable auto telephone linking in iOS -->\n        <title></title>\n\n		<link href=\"https://fonts.googleapis.com/css?family=Roboto\" rel=\"stylesheet\">\n		<style>\n			html, body, p {\n				font-family: \'Roboto\', sans-serif;\n				font-size: 14px;\n			}\n		</style>\n\n	\n    \n       <table style=\"display: table;border-collapse: separate;box-sizing: border-box;\" border=\"0\" width=\"100%\" align=\"center\">\n		<tbody><tr>\n			<td>\n				<table style=\"border: 1px solid #c9d6df;border-radius:20px;box-sizing: border-box;border-collapse: collapse; border: 1px solid #d1c7c7 !important;background-color: #fff;\" border=\"1\" width=\"600\" align=\"center\">\n					<tbody><tr>\n						<td>\n							<table style=\"display: table;border-collapse: separate;box-sizing: border-box;box-sizing: border-box;border-collapse: collapse;\" border=\"0\" align=\"center\" width=\"100%\">\n						    	<tbody>\n									<tr>\n										<td style=\"padding: 15px;/* height: 50px; */background-color: #efefef;border-bottom: 1px solid #bfbfbf;\">\n											<center>\n												<img src=\"http://103.239.146.251:898/tmsNew/assets/img/BeConnected_Logo.gif\" class=\"img-full\" alt=\"...\" style=\"max-height: 50px;width: 250px;\">\n											</center>\n										</td>  \n									</tr>\n									<!--<tr>-->\n										<!--<td><span style=\"height: 1px;width: 100%;background-color: #d1c7c7;display: block;\">&nbsp;</span></td>-->\n									<!--</tr>-->\n									<tr> \n										<td style=\"padding: 15px;\">\n											<div>\n    <div><span>Hi there!</span></div>\n    <div> </div>\n    <div><span>The following job has been delivered :</span></div>\n</div>\n<div> </div>\n<div><span><b>JOB:</b></span></div>\n<div><span>[JOBNO]</span>\n    <p><span><b>DESCRIPTION:</b></span><br><span>[JOBDESCRIPTION]</span></p>\n    <span><b>COMMENT:</b></span><br><span>[DELIVERYNOTE]</span></div></td> \n									</tr>\n									<tr>\n										<td style=\"padding: 5px;background-color: #efefef;border-top: 1px solid #b5b5b5;\">\n											<center>\n												<div style=\"text-align: left;\"><span style=\"/* color: #060606; */\">For more information, visit us at <a style=\"color: #000000;\" href=\"http://www.beconnected.no\"><u>www.beconnected.no</u></a> or <u style=\"color: rgb(255, 255, 255);\"><a style=\"color: #000000;\" href=\"http://www.beconnected.bg\">www.beconnected.bg</a>.</u></span></div><div style=\"text-align: left;\"><span style=\"color: #ffffff;\"><u style=\"color: rgb(255, 255, 255);\"><br></u></span></div>\n<div> </div>\n<div style=\"text-align: left;\"><span style=\"/* color: #000000; */\"><em>This email and any attachments to it may be confidential and are intended solely for the use of the individual to whom it is addressed. If you are not the intended recipient of this email, you must neither take any action based upon its contents, nor copy or show it to anyone. If you have received this transmission in error, please use the reply function to tell us and then permanently delete what you have received.</em></span></div>\n<div> </div>\n<div> </div>\n<div>\n<div><a href=\"https://www.facebook.com/beconnectedbulgaria?_rdr=p\" target=\"_blank\" rel=\"noopener\"><img src=\"http://i.imgur.com/EgYFhb9.png\" alt=\"\" width=\"39\" height=\"38\"></a>   <img src=\"http://i.imgur.com/pG5yZd6.png//www.dropbox.com/preview/BeConnected%20AS/IT/E-post/Ikoner/BeConnected_zps34203a72.PNG\" alt=\"\" width=\"84\" height=\"37\">    <img src=\"http://i.imgur.com/wQ9lihL.png\" alt=\"\" width=\"75\" height=\"27\">      </div>\n</div>\n\n											</center>\n										</td>\n									</tr>\n								</tbody>\n							</table>\n						</td>\n					</tr>\n				</tbody></table>\n			</td>\n		</tr>\n	</tbody></table>', 'Job Delivery', 6, '', 1, 1, '2018-10-29 18:29:14', '2023-05-31 12:33:51'),
(11, 'For Send Job Request to Linguist', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\n<meta name=\"format-detection\" content=\"telephone=no\"> <!-- disable auto telephone linking in iOS -->\n<title></title>\n<link href=\"https://fonts.googleapis.com/css?family=Roboto\" rel=\"stylesheet\">\n<style>\n	html,\n	body,\n	p {\n		font-family: \'Roboto\', sans-serif;\n		font-size: 14px;\n	}\n</style>\n<table style=\"display: table;border-collapse: separate;box-sizing: border-box;\" border=\"0\" width=\"100%\" align=\"center\">\n	<tbody>\n		<tr>\n			<td>\n				<table style=\"border: 1px solid #c9d6df;border-radius:20px;box-sizing: border-box;border-collapse: collapse; border: 1px solid #d1c7c7 !important;background-color: #fff;\" border=\"1\" width=\"600\" align=\"center\">\n					<tbody>\n						<tr>\n							<td>\n								<table style=\"display: table;border-collapse: separate;box-sizing: border-box;box-sizing: border-box;border-collapse: collapse;\" border=\"0\" align=\"center\" width=\"100%\">\n									<tbody>\n										<tr>\n											<td style=\"padding: 15px;/* height: 50px; */background-color: #efefef;border-bottom: 1px solid #bfbfbf;\">\n												<center> <img src=\"https://tms.beconnected.no/assets/img/logo.png\" class=\"img-full\" alt=\"...\" style=\"max-height: initial;width: 250px;\"> </center>\n											</td>\n										</tr>\n										<tr>\n											<td style=\"padding: 15px;\">\n												<p><span>Hi!<br></span></p>\n\n												<div><span>Please log in to accept the job or click on the below link.</span><br><br></div>\n												<div><span> </span></div>\n												<div>\n													<span><b>JOB</b></span><br><span>[JOBNO]</span><br><br><span><b>LANGUAGES</b></span><br><span>[LANGUAGES]</span><br><br><span><b>Job Status </b></span><br><span>[JOBSTATUS]</span><br><br><span><b>Due Date</b></span><br><span>[DUEDATE]</span><br><br>\n												</div>\n												<div>\n													<span><b>Click here to accept the job</b></span><br><br>\n													<span>[ACCEPTLINK]</span><br><br>\n													<span><b>Click here to reject the job</b></span><br><br>\n													<span>[REJECTLINK]</span><br><br>\n												</div>\n												<div><span> </span></div>\n												\n											</td>\n										</tr>\n										<tr>\n											<td style=\"padding: 5px;background-color: #efefef;border-top: 1px solid #b5b5b5;\">\n												<center>\n													<div style=\"text-align: left;\"><span>For more information, visit us\n															at <a style=\"color: #000000;\" href=\"https://www.beconnected.no\"><u>www.beconnected.no</u></a></span>\n													</div>\n													<div style=\"text-align: left;\"><span style=\"color: #ffffff;\"><u style=\"color: rgb(255, 255, 255);\"><br></u></span></div>\n													<div> </div>\n													<div style=\"text-align: left;\"><span><em>This email and any attachments to it may be confidential and are intended solely for the use of the individual to whom it is addressed. If you are not the intended recipient of this email, you must neither take any action based upon its\n																contents, nor copy or show it to anyone. If you have received this transmission in error, please use the reply function to tell us and then permanently delete what you have received.</em></span></div>\n													<div> </div>\n													<div> </div>\n												</center>\n											</td>\n										</tr>\n									</tbody>\n								</table>\n							</td>\n						</tr>\n					</tbody>\n				</table>\n			</td>\n		</tr>\n	</tbody>\n</table>', 'Job Request', 8, '', 1, 1, '2018-10-29 18:29:14', '2023-05-31 12:32:55'),
(12, 'Invoice to client', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\n<meta name=\"format-detection\" content=\"telephone=no\"> <!-- disable auto telephone linking in iOS -->\n<title></title>\n<div><span style=\"font-family: Khmer UI,geneva;\">Hi!</span></div>\n<div>&nbsp;</div>\n<div><span style=\"font-family: Khmer UI,geneva;\">We are hereby sending our invoice [INVOICENO].</span><br><br></div>\n<div><span style=\"font-family: Khmer UI,geneva;\">Payment for this invoice is due by [PAYDUE].</span><br><br><span style=\"font-family: Khmer UI,geneva;\">Thank you!</span></div>\n<div>&nbsp;</div>', 'Invoice', 9, '', 1, 1, '2023-06-02 16:57:05', '2023-06-02 17:14:52'),
(13, 'Purchase Order (Email Content)', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\r\n<meta name=\"format-detection\" content=\"telephone=no\"> <!-- disable auto telephone linking in iOS -->\r\n<title></title>\r\n\r\n<div><span style=\"font-family: khmer ui,geneva; font-size: x-small;\">Hi [Name2]!</span></div>\r\n<div><span style=\"font-family: khmer ui,geneva; font-size: x-small;\"> </span></div>\r\n<div><span style=\"font-family: khmer ui,geneva; font-size: x-small;\">Thank you so much for helping us with this\r\n        project!</span></div>\r\n<div><span style=\"font-family: khmer ui,geneva; font-size: x-small;\"> </span></div>\r\n<div><span style=\"font-family: khmer ui,geneva; font-size: x-small;\">Download the files you need for the project\r\n        directly</span>:<br style=\"font-family: khmer ui,geneva; font-size: x-small;\" /><span\r\n        style=\"font-family: khmer ui,geneva; font-size: x-small;\">[DownloadURL]<br /></span></div>\r\n<div> </div>\r\n<div><span style=\"font-family: khmer ui,geneva; font-size: x-small;\">Here is an overview of the project:</span></div>\r\n<div><span style=\"font-family: khmer ui,geneva; font-size: x-small;\"> </span></div>\r\n<div><span style=\"font-family: khmer ui,geneva; font-size: x-small;\">CLIENT:</span></div>\r\n<div><span style=\"font-family: khmer ui,geneva; font-size: x-small;\">[IndirectCustomer]</span></div>\r\n<div><span style=\"font-family: khmer ui,geneva; font-size: x-small;\"> </span></div>\r\n<div>\r\n    <div><span style=\"font-family: khmer ui,geneva; font-size: x-small;\">PROJECT:</span></div>\r\n    <span style=\"font-family: khmer ui,geneva; font-size: x-small;\">[Item]</span>\r\n</div>\r\n<div><span style=\"font-family: khmer ui,geneva; font-size: x-small;\"> </span></div>\r\n<div><span style=\"font-family: khmer ui,geneva; font-size: x-small;\">TASK:</span><br /><span\r\n        style=\"font-family: khmer ui,geneva; font-size: x-small;\">[JobService]</span></div>\r\n<div><span style=\"font-family: khmer ui,geneva; font-size: x-small;\"> </span></div>\r\n<div><span style=\"font-family: khmer ui,geneva; font-size: x-small;\">DEADLINE:</span><br /><span\r\n        style=\"color: #ff0000; font-family: khmer ui,geneva; font-size: x-small;\">[DelivDeadline]</span></div>\r\n<div><span style=\"font-family: khmer ui,geneva; font-size: x-small;\"> </span></div>\r\n<div><span style=\"font-family: khmer ui,geneva; font-size: x-small;\">INSTRUCTIONS:</span></div>\r\n<div><span style=\"background-color: #ffff00; font-family: khmer ui,geneva; font-size: x-small;\">[JobComment]</span>\r\n</div>\r\n<div>\r\n    <div> </div>\r\n    <div><span style=\"font-family: khmer ui,geneva; font-size: x-small;\"><span\r\n                style=\"font-family: khmer ui,geneva; font-size: x-small;\">COMPANY TO INVOICE</span></span></div>\r\n    <span style=\"font-family: khmer ui,geneva; font-size: x-small;\">BeConnected </span><span\r\n        style=\"font-family: khmer ui,geneva; font-size: x-small;\"><span\r\n            style=\"font-family: khmer ui,geneva; font-size: x-small;\">[CompanyCodeShort]</span></span>\r\n    <div><span style=\"font-family: khmer ui,geneva; font-size: x-small;\"> </span></div>\r\n    <span style=\"font-family: khmer ui,geneva; font-size: x-small;\">PAYMENT</span>\r\n</div>\r\n<div><span style=\"font-family: khmer ui,geneva; font-size: x-small;\">[Total]</span>\r\n    <div> </div>\r\n    <div>\r\n        <div><span style=\"font-family: khmer ui,geneva; font-size: x-small;\">You can log into the job in Plunet by\r\n                following the link below:</span></div>\r\n        <div><span style=\"font-family: khmer ui,geneva; font-size: x-small;\">[QuickJobLink]</span></div>\r\n    </div>\r\n    <div><span style=\"font-family: khmer ui,geneva; font-size: x-small;\"> </span></div>\r\n</div>\r\n<div><span style=\"font-family: khmer ui,geneva; font-size: x-small;\">Thank you!</span></div>\r\n<div> </div>', 'Purchase Order', 10, '', 1, 1, '2023-06-15 16:57:05', '2023-06-15 17:14:52'),
(15, 'Purchase Order (Attachment)', '<style>\r\n    .invoiceheader{\r\n    padding: 0 15px;;\r\n    }\r\n    .panel-heading-img{\r\n    float: right;\r\n    }\r\n    .address-title{\r\n    color: #808080;\r\n    }\r\n    .header-tr-border{\r\n    background-color: #bebebe;\r\n    }\r\n    table.table.table-bordered.table-condensed-second {\r\n    margin: 0px;\r\n    margin-top: 10px;\r\n    background-color: #d9d9d9 !important;\r\n    }\r\n    table.table.table-bordered.table-condensed-second tbody tr:nth-of-type(odd) td {\r\n    background: #d9d9d9 !important;\r\n    }\r\n    .table-condensed-second tbody tr {\r\n    background: #d9d9d9 !important;\r\n    }\r\n    .invoice {\r\n    width: 816px !important;\r\n    margin: 10px auto;\r\n    font-family: Khmer UI, serif;\r\n    margin-left: -15px;\r\n    }\r\n    .invoice .panel-heading {\r\n    background-color: #fff !important;\r\n    border-color: #fff !important;\r\n    }\r\n    .invoice .invoice-header {\r\n    padding: 25px 25px 15px;\r\n    }\r\n    .invoice .invoice-header h1 {\r\n    margin: 0;\r\n    }\r\n    .invoice .invoice-header .media .media-body {\r\n    font-size: 0.9em;\r\n    margin: 0;\r\n    }\r\n    .invoice .invoice-body {\r\n    border-radius: 10px;\r\n    padding-top: 25px;\r\n    padding-bottom: 25px;\r\n    background: #fff;\r\n    }\r\n    .invoice-content{\r\n    padding-left: 60px;\r\n    padding-right: 60px;\r\n    }\r\n    .dl-horizontal {\r\n    margin: 0;\r\n    line-height: 1.2;\r\n    padding: 12px;\r\n    } \r\n    .panel-body-image{\r\n    text-align: center;\r\n    }\r\n    .panel-body-image img {\r\n    width: 200px;\r\n    height: 100px;\r\n    }\r\n    .invoice-heading{\r\n    font-size: 18px;\r\n    }\r\n    .invoice-purchase-side dd {\r\n    display: flex;\r\n    justify-content: space-between;\r\n    padding: 5px;\r\n    }\r\n    .table-data-txt {\r\n    font-size: 14px;\r\n    }\r\n    tbody, td, tfoot, th, thead, tr {\r\n    border-style: unset !important;\r\n    }\r\n    .panel-body.table-payment-title {\r\n    margin-top: 50px;\r\n    }\r\n    .list-unstyled li a {\r\n    font-weight: 600;\r\n    text-decoration: none;\r\n    color: #000082;\r\n    }\r\n    .list-unstyled-one p , .list-unstyled-two {\r\n    list-style-type: none;\r\n    margin: 0px;\r\n    }\r\n    .list-unstyled-one a{\r\n    font-size:18px;\r\n    text-decoration: none;\r\n    }\r\n    .list-unstyled-two a {\r\n    font-size: 18px;\r\n    color: #000;\r\n    }\r\n    p.panel-title-footer-end {\r\n    text-align: end;\r\n    }\r\n    p.panel-titlefooter-start ,p.panel-title-footer-end {\r\n    padding-top: 10px;\r\n    }\r\n    .panel-default-btn{\r\n    float: right;\r\n    }\r\n    a.invoice-print-btn {\r\n    padding: 8px 20px;\r\n    border:1px solid #dee2e6;\r\n    border-radius: 6px;\r\n    text-transform: uppercase;\r\n    background: #fff;\r\n    color: #000;\r\n    text-decoration: none;\r\n    }\r\n    a.invoice-download-btn {\r\n    text-transform: uppercase;\r\n    padding: 8px 20px;\r\n    border: none ;\r\n    border-radius: 6px;\r\n    background: #000082;\r\n    color: #fff;\r\n    text-decoration: none;\r\n    }\r\n    .invoice-header-total {\r\n    margin-bottom: 20px;\r\n    border-bottom: 1px solid #dee2e6;\r\n    }\r\n    td.table-data-text {\r\n    padding:0px 10px !important;\r\n    }\r\n    .dl-horizontal dd {\r\n    margin-left: auto;\r\n    }\r\n    .invoice .panel{\r\n    margin-bottom: initial !important;\r\n    }\r\n    .invoice .panel-body {\r\n    padding-left: initial !important;\r\n    } \r\n    .invoice .panel > .panel-body + .table{\r\n    border-top: none;\r\n    }\r\n    .inv-footer .table-data-text, .fontszsm, .copytext{\r\n    font-size: 12px;\r\n    color: #808080;\r\n    }\r\n    .copytext{\r\n    text-align: center;\r\n    margin-top: 10px;\r\n    }\r\n    .pb-0{ padding-bottom: 0px; }\r\n    .mb-d{margin-bottom: 2px;}\r\n    .txtalign {text-align: right !important;}\r\n    .txtcenter {text-align: center !important;}\r\n    .tbldd dd {margin-bottom: 5px;}\r\n    .table-condensed-second > tbody > tr > td { padding-bottom: 3px !important; padding-bottom: 3px !important; }\r\n    .line1{ border-top: 1px solid #ea7227; width: 25%;}\r\n    .line2{ border-top: 1px solid #e63132; width: 25%;}\r\n    .line3{ border-top: 1px solid #4c9acc; width: 25%;}\r\n    .line4{ border-top: 1px solid #5fc752; width: 25%;}\r\n    </style>\r\n<div class=\"container invoice invoiceContent\" id=\"invoiceContent\">\r\n    <div class=\"invoice-body\">\r\n        <div class=\"invoiceheader\">\r\n            <div class=\"row\">\r\n                <div class=\"col-lg-12 col-md-12 col-sm-12\">\r\n                    <div class=\"panel panel-default \">\r\n                        <div class=\"panel-heading-img\"> <img src=\"assets/img/invoice_logo.png\" alt=\"Logo\" srcset=\"\"> </div>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n        <div class=\"invoice-content\">\r\n            <div class=\"row\">\r\n                <div class=\"col-sm-12\" style=\"padding-left:0px;\">\r\n                    <div class=\"panel panel-default\">\r\n                        <div class=\"panel-heading\">\r\n                            <p class=\"address-title\"> <span>[COMPANY_NAME] &middot; </span> <span>[COMPANY_ADDRESS] &middot; </span> <span>[COMPANY_CITY] [COMPANY_POSTCODE] &middot; </span>  <span>[COMPANY_COUNTRY]</span> </p>\r\n                        </div>\r\n\r\n                        <div class=\"panel-body\" style=\"padding-top: 0px;\">\r\n                            <dl class=\"dl-horizontal\">\r\n                                <dd style=\"margin-bottom: 8px;\"><strong> [NAME2]  [NAME1] </strong></dd>\r\n                                <dd> [STREET1][STREET2] </dd>\r\n                                <dd> [POSTCODE] <span>[CITY]</span></dd>\r\n                                <dd> [COUNTRY] </dd>\r\n                        </div>\r\n                        <div class=\"panel-body\" style=\"padding-top: 0px;\">\r\n                            <!-- <div class=\"col-sm-4\">\r\n                                <p class=\"mb-d\"><strong>Project Manager</strong></p>\r\n                                [PROJECT_MANAGER]\r\n                            </div>\r\n                            <div class=\"col-sm-4\">\r\n                                <p class=\"mb-d\"><strong>Email</strong></p> [EMAIL]\r\n                            </div> -->\r\n                            <div class=\"col-sm-4\">\r\n                                <p class=\"mb-d\"><strong>Date</strong></p> \r\n                                [ORDERDATE]\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n            <div class=\"row\">\r\n                <div class=\"panel panel-default invoice-header-height\">\r\n                    <div class=\"panel-body\">\r\n                        <dl class=\"dl-horizontal\" style=\"padding: 0 15px;\">\r\n                            <dd class=\"invoice-heading\"><strong>Purchase Order | [JOBNO] </strong></dd>\r\n                    </div>\r\n                </div>\r\n            </div>        \r\n            <div class=\"row\">\r\n                <div class=\"panel panel-default invoice-header-height\">\r\n                    <div class=\"row\">\r\n                        <div class=\"col-lg-12 col-md-12 col-sm-12\">\r\n                            <div class=\"panel panel-default\">\r\n                                <div class=\"panel-body\">\r\n                                    <div class=\"col-sm-12\" style=\"margin-bottom: 10px;font-size:16px;\">\r\n                                        <p>Thank you so much for helping us with the following project:</p>\r\n                                    </div>\r\n\r\n                                    <dl class=\"dl-horizontal tbldd\">\r\n                                        <dd> <strong> Project: </strong> [PROJECTNAME] </dd>\r\n                                        <dd> <strong> Client: </strong> [INDIRECT_CUSTOMER] </dd>\r\n                                        <dd> <strong> Task: </strong> [JOBSERVICE] </dd>\r\n                                        <dd> <strong> Languages: </strong> [LANGUAGES] </dd>\r\n                                        <dd> <strong> Instructions: </strong> [INSTRUCTIONS] </dd>\r\n                                        <dd> <strong> Deadline: </strong> <span style=\"color:red\"> [DEADLINE] </span> </dd>\r\n                                        <dd> <strong> Company to invoice: </strong> BeConnected AS [CompanyCodeShort]</dd>\r\n                                        <!-- <dd> <strong> Word Count: </strong> [WORDCOUNT] </dd> -->\r\n                                        <!-- <dd> <strong> Total: </strong> [TOTALPRICE] </dd> -->\r\n                                        <dd> <strong> Total Amount: </strong> [TOTALAMOUNT] </dd>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n            </div>        \r\n            <div class=\"row\">\r\n                <div class=\"panel panel-default invoice-header-height\" style=\"text-align:center;\">\r\n                    <p class=\"fontszsm\"> \r\n                        Please make sure to state the following project number [JobNo] on your invoice and remember to invoice the following company: BeConnected [CompanyCodeShort].\r\n                        Please send all invoices to accounting@beconnected.no.\r\n                    </p>\r\n                </div>\r\n            </div>  \r\n        </div> \r\n        <div class=\"invoicefooter\">\r\n            <div class=\"row\">\r\n                <div class=\"panel panel-default invoice-header-height\" style=\"margin: 0 15px;\">        \r\n                    <div class=\"d-flex\">\r\n                    <div class=\"line1\"> </div>\r\n                    <div class=\"line2\"> </div>\r\n                    <div class=\"line3\"> </div>\r\n                    <div class=\"line4\"> </div>\r\n                    </div>\r\n                    <table class=\"table table-bordered table-condensed inv-footer\" style=\"margin-top: 10px;\">\r\n                        <tbody>\r\n                            <tr>\r\n                                <td class=\"table-data-text\"> <strong> [COMPANY_NAME] </strong> </td>\r\n                                <td class=\"table-data-text\"> </td>\r\n                                <td class=\"table-data-text txtalign\"> <strong> VAT NUMBER:</strong> </td>\r\n                            </tr>\r\n                            <tr>\r\n                                <td class=\"table-data-text\"> [COMPANY_ADDRESS] </td>\r\n                                <td class=\"table-data-text txtcenter\"> Email:<a href=\"mailto:Email: [COMPANY_EMAIL]\"> [COMPANY_EMAIL] </a> </td>\r\n                                <td class=\"table-data-text txtalign\">Foretaksregisteret: </td>\r\n                            </tr>\r\n                            <tr>\r\n                                <td class=\"table-data-text\"> [COMPANY_CITY] [COMPANY_POSTCODE] </td>\r\n                                <td class=\"table-data-text txtcenter\"> [COMPANY_WEB] </td>\r\n                                <td class=\"table-data-text txtalign\">[COMPANY_VAT_NUMBER]</td>\r\n                            </tr>\r\n                            <tr>\r\n                                <td class=\"table-data-text\"> [COMPANY_COUNTRY] </td>\r\n                                <td class=\"table-data-text\"> </td>\r\n                                <td class=\"table-data-text\"> </td>\r\n                            </tr>\r\n                        </tbody>\r\n                    </table>\r\n                    <div>\r\n                        <p class=\"copytext\" > <spam style=\"font-family:Arial;\"> &copy; </spam> [COMPANY_COPYRIGHT_TEXT] </p>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>    \r\n    </div>\r\n</div>', 'Purchase Order PDF', 10, '', 1, 1, '2023-06-05 15:40:00', '2023-06-13 16:33:33');

-- --------------------------------------------------------

--
-- Table structure for table `tms_emojitext`
--

CREATE TABLE `tms_emojitext` (
  `id` int(11) NOT NULL,
  `emojiname` varchar(200) NOT NULL,
  `emojipic` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tms_favourite_menu`
--

INSERT INTO `tms_favourite_menu` (`fvrt_menu_id`, `iUserId`, `menu_json`, `created_date`, `updated_date`) VALUES
(1, 1, '[{\"fvMenuUrl\":\"#/dashboard1\",\"fvMenuName\":\"Dashboard\"}]', '2018-12-20 18:17:50', '2023-06-20 19:05:55'),
(2, 7, '[{\"fvMenuUrl\":\"#/user/1\",\"fvMenuName\":\"Internal Resource\"}]', '2023-06-02 17:48:08', '2023-06-02 17:48:08'),
(3, 6, '[{\"fvMenuUrl\":\"#/newjob\",\"fvMenuName\":\"Job Chain\"},{\"fvMenuUrl\":\"#/dashboard1\",\"fvMenuName\":\"Dashboard\"}]', '2023-06-19 14:42:38', '2023-06-19 15:25:16');

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
  `is_default_folder` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = false,1 = true',
  `is_project_folder` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = false,1 = true',
  `is_ex_project_folder` tinyint(4) NOT NULL DEFAULT 0 COMMENT '	0 = false,1 = true	',
  `f_id` int(11) NOT NULL,
  `ext` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tms_filemanager`
--

INSERT INTO `tms_filemanager` (`fmanager_id`, `role_id`, `name`, `parent_id`, `order_id`, `job_id`, `client_id`, `in_client_id`, `user_id`, `item_id`, `is_default_folder`, `is_project_folder`, `is_ex_project_folder`, `f_id`, `ext`, `size`, `created_date`, `updated_date`) VALUES
(1, 0, 'internal-0002', 0, '', '', 0, 0, 2, 0, 0, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 0, 'internal-0002', 0, '', '', 0, 0, 2, 0, 0, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 0, 'internal-0003', 0, '', '', 0, 0, 4, 0, 0, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 0, 'testclient-001', 0, '', '', 1, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-02 16:58:06', '2023-06-02 16:58:06'),
(7, 0, 'Data', 6, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2023-06-02 16:58:06', '2023-06-02 16:58:06'),
(8, 0, 'Projects', 6, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2023-06-02 16:58:06', '2023-06-02 16:58:06'),
(9, 0, 'Invoice', 6, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2023-06-02 16:58:06', '2023-06-02 16:58:06'),
(10, 0, 'Indirect client', 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-02 00:00:00', '2023-06-02 00:00:00'),
(11, 0, 'google-001', 0, '', '', 0, 1, 0, 0, 0, 0, 0, 0, '', '', '2023-06-02 17:01:30', '2023-06-02 17:01:30'),
(12, 0, 'BeConnected AS0001', 8, '2', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 0, 'Jobs', 12, '2', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 0, 'Item001', 12, '2', '', 0, 0, 0, 1, 0, 0, 0, 0, '', '', '2023-06-02 17:04:27', '2023-06-02 17:04:27'),
(15, 0, 'TRA001', 13, '2', '1', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-02 17:06:44', '2023-06-02 17:06:44'),
(16, 0, '_in', 15, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-02 17:06:44', '2023-06-02 17:06:44'),
(17, 0, '_out', 15, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-02 17:06:44', '2023-06-02 17:06:44'),
(18, 0, 'Item002', 12, '2', '', 0, 0, 0, 2, 0, 0, 0, 0, '', '', '2023-06-02 17:06:54', '2023-06-02 17:06:54'),
(19, 0, 'TRA002', 13, '2', '2', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-02 17:07:01', '2023-06-02 17:07:01'),
(20, 0, '_in', 19, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-02 17:07:01', '2023-06-02 17:07:01'),
(21, 0, '_out', 19, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-02 17:07:01', '2023-06-02 17:07:01'),
(22, 0, 'external-0001', 0, '', '', 0, 0, 5, 0, 0, 0, 0, 0, '', '', '2023-06-02 17:17:06', '2023-06-02 17:17:06'),
(23, 0, 'Data', 22, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 0, 'Projects', 22, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 0, 'Invoice', 22, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 0, 'internal-0004', 0, '', '', 0, 0, 6, 0, 0, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 0, 'internal-0005', 0, '', '', 0, 0, 7, 0, 0, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 0, 'internal-0006', 0, '', '', 0, 0, 8, 0, 0, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 0, 'internal-0007', 0, '', '', 0, 0, 9, 0, 0, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 0, 'internal-0008', 0, '', '', 0, 0, 10, 0, 0, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 0, 'internal-0009', 0, '', '', 0, 0, 11, 0, 0, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 0, 'BeConnected AS0002', 8, '4', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 0, 'Jobs', 32, '4', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 0, 'Item001', 32, '4', '', 0, 0, 0, 3, 0, 0, 0, 0, '', '', '2023-06-06 13:06:12', '2023-06-06 13:06:12'),
(35, 0, 'Item002', 32, '4', '', 0, 0, 0, 4, 0, 0, 0, 0, '', '', '2023-06-06 13:06:12', '2023-06-06 13:06:12'),
(36, 0, 'TER001', 33, '4', '3', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-06 13:07:27', '2023-06-06 13:07:27'),
(37, 0, '_in', 36, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-06 13:07:27', '2023-06-06 13:07:27'),
(38, 0, '_out', 36, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-06 13:07:27', '2023-06-06 13:07:27'),
(39, 0, 'internal-0010', 0, '', '', 0, 0, 12, 0, 0, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 0, 'internal-0011', 0, '', '', 0, 0, 13, 0, 0, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 0, 'acolad,inc.-002', 0, '', '', 2, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-19 13:46:49', '2023-06-19 13:46:49'),
(42, 0, 'Data', 41, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2023-06-19 13:46:49', '2023-06-19 13:46:49'),
(43, 0, 'Projects', 41, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2023-06-19 13:46:49', '2023-06-19 13:46:49'),
(44, 0, 'Invoice', 41, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2023-06-19 13:46:49', '2023-06-19 13:46:49'),
(45, 0, 'ecolab-002', 0, '', '', 0, 2, 0, 0, 0, 0, 0, 0, '', '', '2023-06-19 14:13:27', '2023-06-19 14:13:27'),
(46, 0, 'BBBB0001', 43, '5', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 0, 'Jobs', 46, '5', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 0, 'Item001', 46, '5', '', 0, 0, 0, 5, 0, 0, 0, 0, '', '', '2023-06-19 14:18:43', '2023-06-19 14:18:43'),
(49, 0, 'Item002', 46, '5', '', 0, 0, 0, 6, 0, 0, 0, 0, '', '', '2023-06-19 14:18:43', '2023-06-19 14:18:43'),
(50, 0, 'Item003', 46, '5', '', 0, 0, 0, 7, 0, 0, 0, 0, '', '', '2023-06-19 14:18:43', '2023-06-19 14:18:43'),
(54, 0, 'TEP002', 47, '5', '5', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-19 14:44:33', '2023-06-19 14:44:33'),
(55, 0, '_in', 54, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-19 14:44:33', '2023-06-19 14:44:33'),
(56, 0, '_out', 54, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-19 14:44:33', '2023-06-19 14:44:33'),
(57, 0, 'TEP003', 47, '5', '6', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-19 14:44:45', '2023-06-19 14:44:45'),
(58, 0, '_in', 57, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-19 14:44:45', '2023-06-19 14:44:45'),
(59, 0, '_out', 57, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-19 14:44:45', '2023-06-19 14:44:45'),
(60, 1, '270_Ecolab_10390324.zip', 48, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'zip', '602.34 KB', '2023-06-19 15:03:42', '2023-06-19 15:03:42'),
(61, 0, 'PMP004', 47, '5', '7', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-19 15:39:28', '2023-06-19 15:39:28'),
(62, 0, '_in', 61, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-19 15:39:28', '2023-06-19 15:39:28'),
(63, 0, '_out', 61, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-19 15:39:28', '2023-06-19 15:39:28'),
(64, 0, 'TRA005', 47, '5', '8', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-19 15:39:28', '2023-06-19 15:39:28'),
(65, 0, '_in', 64, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-19 15:39:28', '2023-06-19 15:39:28'),
(66, 0, '_out', 64, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-19 15:39:28', '2023-06-19 15:39:28'),
(70, 0, 'QA007', 47, '5', '10', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-19 15:39:29', '2023-06-19 15:39:29'),
(71, 0, '_in', 70, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-19 15:39:29', '2023-06-19 15:39:29'),
(72, 0, '_out', 70, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-19 15:39:29', '2023-06-19 15:39:29'),
(73, 0, 'PMD008', 47, '5', '11', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-19 15:39:29', '2023-06-19 15:39:29'),
(74, 0, '_in', 73, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-19 15:39:29', '2023-06-19 15:39:29'),
(75, 0, '_out', 73, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-19 15:39:29', '2023-06-19 15:39:29'),
(79, 1, '629_For_TP_CH_Addition_Project_Class_1_NS_sheet_1.xlsx.sdlxliff', 71, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'sdlxliff', '1.85 KB', '2023-06-19 16:30:51', '2023-06-19 16:30:51'),
(80, 1, '43_For_TP_CH_Addition_Project_Class_1_NS_sheet_1.xlsx.sdlxliff', 71, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'sdlxliff', '1.85 KB', '2023-06-19 16:56:13', '2023-06-19 16:56:13'),
(81, 1, '981_For_TP_CH_Addition_Project_Class_1_NS_sheet_1.xlsx.sdlxliff', 71, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'sdlxliff', '1.85 KB', '2023-06-19 16:57:19', '2023-06-19 16:57:19'),
(83, 1, '745_For_TP_CH_Addition_Project_Class_1_NS_sheet_1.xlsx.sdlxliff', 65, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'sdlxliff', '1.85 KB', '2023-06-19 17:09:27', '2023-06-19 17:09:27'),
(84, 1, '879_test_Ecolab.docx', 74, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '0 bytes', '2023-06-19 17:19:16', '2023-06-19 17:19:16'),
(85, 1, '871_For_TP_CH_Addition_Project_Class_1_NS_sheet_1.xlsx.sdlxliff', 74, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'sdlxliff', '1.85 KB', '2023-06-19 17:20:05', '2023-06-19 17:20:05'),
(86, 1, '5_For_TP_CH_Addition_Project_Class_1_NS_sheet_1.xlsx.zip', 74, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'zip', '1.08 KB', '2023-06-19 17:20:41', '2023-06-19 17:20:41'),
(87, 1, '77_BlitzladerHD_8seiter_SV-SE.txlf_merged-TXLF-sv-SE#PR_CLMDNT#.txlf_swe-SE.mqxliff', 71, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'mqxliff', '121.99 KB', '2023-06-19 17:24:34', '2023-06-19 17:24:34'),
(88, 1, '955_FW__AppleCare_Gutenberg_CMS_Migration_Projects_-_!!DELAYED_START_DATE!!.msg', 74, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'msg', '208.50 KB', '2023-06-19 17:25:55', '2023-06-19 17:25:55'),
(89, 0, 'Item004', 46, '5', '', 0, 0, 0, 8, 0, 0, 0, 0, '', '', '2023-06-20 14:14:10', '2023-06-20 14:14:10'),
(90, 0, 'TEP009', 47, '5', '13', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:14:20', '2023-06-20 14:14:20'),
(91, 0, '_in', 90, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:14:20', '2023-06-20 14:14:20'),
(92, 0, '_out', 90, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:14:20', '2023-06-20 14:14:20'),
(93, 0, 'TRA010', 47, '5', '14', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:14:20', '2023-06-20 14:14:20'),
(94, 0, '_in', 93, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:14:20', '2023-06-20 14:14:20'),
(95, 0, '_out', 93, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:14:20', '2023-06-20 14:14:20'),
(96, 0, 'PMP011', 47, '5', '15', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:14:21', '2023-06-20 14:14:21'),
(97, 0, '_in', 96, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:14:21', '2023-06-20 14:14:21'),
(98, 0, '_out', 96, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:14:21', '2023-06-20 14:14:21'),
(99, 0, 'PRF012', 47, '5', '16', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:14:21', '2023-06-20 14:14:21'),
(100, 0, '_in', 99, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:14:21', '2023-06-20 14:14:21'),
(101, 0, '_out', 99, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:14:21', '2023-06-20 14:14:21'),
(102, 0, 'PMD013', 47, '5', '17', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:14:21', '2023-06-20 14:14:21'),
(103, 0, '_in', 102, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:14:21', '2023-06-20 14:14:21'),
(104, 0, '_out', 102, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:14:21', '2023-06-20 14:14:21'),
(105, 0, 'QA014', 47, '5', '18', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:14:22', '2023-06-20 14:14:22'),
(106, 0, '_in', 105, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:14:22', '2023-06-20 14:14:22'),
(107, 0, '_out', 105, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:14:22', '2023-06-20 14:14:22'),
(108, 0, 'BBBB0002', 43, '6', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 0, 'Jobs', 108, '6', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 0, 'Item001', 108, '6', '', 0, 0, 0, 9, 0, 0, 0, 0, '', '', '2023-06-20 14:24:35', '2023-06-20 14:24:35'),
(111, 0, 'Item002', 108, '6', '', 0, 0, 0, 10, 0, 0, 0, 0, '', '', '2023-06-20 14:24:35', '2023-06-20 14:24:35'),
(112, 0, 'Item003', 108, '6', '', 0, 0, 0, 11, 0, 0, 0, 0, '', '', '2023-06-20 14:24:35', '2023-06-20 14:24:35'),
(113, 0, 'PMD001', 109, '6', '19', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:35:20', '2023-06-20 14:35:20'),
(114, 0, '_in', 113, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:35:20', '2023-06-20 14:35:20'),
(115, 0, '_out', 113, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:35:20', '2023-06-20 14:35:20'),
(128, 0, 'TEP003', 109, '6', '24', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:36:00', '2023-06-20 14:36:00'),
(129, 0, '_in', 128, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:36:00', '2023-06-20 14:36:00'),
(130, 0, '_out', 128, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:36:00', '2023-06-20 14:36:00'),
(131, 0, 'TRA004', 109, '6', '25', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:36:01', '2023-06-20 14:36:01'),
(132, 0, '_in', 131, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:36:01', '2023-06-20 14:36:01'),
(133, 0, '_out', 131, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:36:01', '2023-06-20 14:36:01'),
(134, 0, 'PMP005', 109, '6', '26', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:36:01', '2023-06-20 14:36:01'),
(135, 0, '_in', 134, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:36:01', '2023-06-20 14:36:01'),
(136, 0, '_out', 134, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:36:01', '2023-06-20 14:36:01'),
(137, 0, 'QA008', 109, '6', '27', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:36:01', '2023-06-20 14:36:01'),
(138, 0, 'PMD007', 109, '6', '28', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:36:01', '2023-06-20 14:36:01'),
(139, 0, 'PRF006', 109, '6', '29', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:36:01', '2023-06-20 14:36:01'),
(140, 0, '_in', 137, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:36:01', '2023-06-20 14:36:01'),
(141, 0, '_in', 138, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:36:01', '2023-06-20 14:36:01'),
(142, 0, '_out', 137, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:36:01', '2023-06-20 14:36:01'),
(143, 0, '_in', 139, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:36:01', '2023-06-20 14:36:01'),
(144, 0, '_out', 138, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:36:01', '2023-06-20 14:36:01'),
(145, 0, '_out', 139, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-20 14:36:01', '2023-06-20 14:36:01'),
(146, 1, '218_dummy_file.docx', 110, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '0 bytes', '2023-06-20 14:36:20', '2023-06-20 14:36:20'),
(147, 1, '158_dummy_file.docx', 111, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '0 bytes', '2023-06-20 14:36:37', '2023-06-20 14:36:37'),
(148, 1, '545_dummy_file.docx', 114, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '0 bytes', '2023-06-20 14:51:00', '2023-06-20 14:51:00'),
(149, 1, '959_For_TP_CH_Addition_Project_Class_1_NS_sheet_1.xlsx.sdlxliff', 114, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'sdlxliff', '1.85 KB', '2023-06-20 14:51:42', '2023-06-20 14:51:42'),
(150, 1, '238_sv-SE;4K120p-2023-06-09-01.pactXliff', 114, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pactXliff', '1.40 KB', '2023-06-20 14:52:14', '2023-06-20 14:52:14'),
(151, 0, 'internal-0012', 0, '', '', 0, 0, 14, 0, 0, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, 0, 'internal-0013', 0, '', '', 0, 0, 15, 0, 0, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, 0, 'TRA008', 109, '6', '31', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-21 17:53:35', '2023-06-21 17:53:35'),
(157, 0, '_in', 156, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-21 17:53:35', '2023-06-21 17:53:35'),
(158, 0, '_out', 156, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-21 17:53:35', '2023-06-21 17:53:35'),
(159, 0, 'PRF009', 109, '6', '32', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-21 17:53:37', '2023-06-21 17:53:37'),
(160, 0, '_in', 159, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-21 17:53:37', '2023-06-21 17:53:37'),
(161, 0, '_out', 159, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-21 17:53:37', '2023-06-21 17:53:37'),
(168, 0, 'BeConnected AS0003', 8, '7', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(169, 0, 'Jobs', 168, '7', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, 0, 'Item001', 168, '7', '', 0, 0, 0, 12, 0, 0, 0, 0, '', '', '2023-06-22 13:08:44', '2023-06-22 13:08:44'),
(171, 0, 'TRA001', 169, '7', '35', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-22 13:11:00', '2023-06-22 13:11:00'),
(172, 0, '_in', 171, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-22 13:11:00', '2023-06-22 13:11:00'),
(173, 0, '_out', 171, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-22 13:11:00', '2023-06-22 13:11:00'),
(174, 0, 'kanhasoftbn-test-003', 0, '', '', 3, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-22 16:26:04', '2023-06-22 16:26:04'),
(175, 0, 'Data', 174, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2023-06-22 16:26:04', '2023-06-22 16:26:04'),
(176, 0, 'Projects', 174, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2023-06-22 16:26:04', '2023-06-22 16:26:04'),
(177, 0, 'Invoice', 174, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2023-06-22 16:26:04', '2023-06-22 16:26:04'),
(178, 0, 'BNBN0001', 176, '8', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, 0, 'Jobs', 178, '8', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, 0, 'Item001', 178, '8', '', 0, 0, 0, 13, 0, 0, 0, 0, '', '', '2023-06-22 16:28:35', '2023-06-22 16:28:35'),
(181, 0, 'TRA001', 179, '8', '36', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-22 16:29:59', '2023-06-22 16:29:59'),
(182, 0, '_in', 181, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-22 16:29:59', '2023-06-22 16:29:59'),
(183, 0, '_out', 181, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-22 16:29:59', '2023-06-22 16:29:59'),
(184, 0, 'external-0002', 0, '', '', 0, 0, 16, 0, 0, 0, 0, 0, '', '', '2023-06-22 16:32:31', '2023-06-22 16:32:31'),
(185, 0, 'Data', 184, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(186, 0, 'Projects', 184, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(187, 0, 'Invoice', 184, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, 0, 'Item002', 178, '8', '', 0, 0, 0, 14, 0, 0, 0, 0, '', '', '2023-06-26 16:40:25', '2023-06-26 16:40:25'),
(189, 0, 'TRA002', 179, '8', '37', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-26 16:40:37', '2023-06-26 16:40:37'),
(190, 0, '_in', 189, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-26 16:40:37', '2023-06-26 16:40:37'),
(191, 0, '_out', 189, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2023-06-26 16:40:37', '2023-06-26 16:40:37'),
(195, 1, '809_image_(8).png', 182, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '284.46 KB', '2023-06-28 19:34:30', '2023-06-28 19:34:30'),
(196, 1, '161_tms-old-pc.zip', 182, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'zip', '192.86 MB', '2023-06-29 13:16:23', '2023-06-29 13:16:23'),
(202, 0, 'BBBB0003', 176, '9', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(203, 0, 'Jobs', 202, '9', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

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
  `project_price` float NOT NULL DEFAULT 0,
  `project_start_status` tinyint(1) NOT NULL COMMENT '1 for started,0 for not started ',
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tms_general`
--

INSERT INTO `tms_general` (`general_id`, `order_id`, `order_no`, `order_date`, `company_code`, `project_name`, `project_type`, `project_createdBy`, `due_date`, `specialization`, `email_subj`, `project_status`, `no_of_items`, `heads_up`, `expected_start_date`, `project_price`, `project_start_status`, `created_date`, `modified_date`) VALUES
(1, 2, 'BeConnected AS0001', '2023-06-02 13:33:00', '', 'Test Project', 0, 1, '2023-06-02 17:00', '5', '', '4', 0, 0, NULL, 0, 0, '2023-06-02 17:03:59', '2023-08-22 14:59:19'),
(2, 4, 'BeConnected AS0002', '2023-06-06 10:35:00', '', 'Beconnected Test review', 0, 7, '2023-06-06 18:35', '1', '', '4', NULL, NULL, NULL, 0, 0, '2023-06-06 13:06:05', '2023-06-06 13:06:05'),
(3, 5, 'BBBB0001', '2023-06-19 11:41:00', '', 'Ecolab_10390324 TEP EN-Fi,NO,SV', 0, 6, '2023-06-19 14:00', '8', '', '4', 0, 0, NULL, 0, 0, '2023-06-19 14:18:31', '2023-06-19 17:48:32'),
(4, 6, 'BBBB0002', '2023-06-20 11:52:00', '', 'Ecolab_dummuy TEP EN-Fi,NO,SV', 0, 6, '2023-06-20 13:54', '8', '', '4', NULL, NULL, NULL, 0, 0, '2023-06-20 14:24:25', '2023-06-20 14:24:25'),
(5, 7, 'BeConnected AS0003', '2023-06-22 13:07:00', '', 'Netflix Imdb Database New series', 0, 1, '2023-06-22 13:08', '6', '', '4', NULL, NULL, NULL, 0, 0, '2023-06-22 13:08:40', '2023-06-22 13:08:40'),
(6, 8, 'BNBN0001', '2023-06-22 16:27:00', '', 'UPI technology Easy Transfer', 0, 1, '2023-06-22 16:28', '6', '', '4', NULL, NULL, NULL, 0, 0, '2023-06-22 16:28:32', '2023-06-22 16:28:32'),
(7, 9, 'BBBB0003', '2023-07-21 17:51:00', '', 'ProjectTest', 0, 1, '2023-09-01 18:00', '1', '', '4', NULL, NULL, NULL, 0, 0, '2023-07-21 17:52:24', '2023-07-21 17:52:24');

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
  `vat2` varchar(200) NOT NULL,
  `Invoice_cost` decimal(10,2) NOT NULL,
  `Invoice_cost2` varchar(200) NOT NULL COMMENT 'For second Currency',
  `invoice_type` varchar(255) NOT NULL,
  `invoice_status` varchar(255) NOT NULL DEFAULT 'Open',
  `is_approved` tinyint(2) NOT NULL DEFAULT 0 COMMENT '1 - Approved, 0 - UnApproved',
  `is_invoice_sent` tinyint(2) NOT NULL DEFAULT 0,
  `reminder_sent` tinyint(2) NOT NULL DEFAULT 0,
  `currency_rate` varchar(200) NOT NULL COMMENT '1 Eur = ?',
  `is_excel_download` tinyint(11) NOT NULL DEFAULT 0 COMMENT ' = dowloaded excel file',
  `createdBy` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tms_invoice_client`
--

CREATE TABLE `tms_invoice_client` (
  `invoice_id` int(11) NOT NULL,
  `invoice_number` varchar(255) NOT NULL,
  `custom_invoice_number` varchar(255) NOT NULL,
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
  `is_invoice_sent` tinyint(2) NOT NULL DEFAULT 0 COMMENT '1 - Sent, 0 - Not Sent',
  `currency_rate` varchar(200) NOT NULL COMMENT '1 EUR = ?',
  `reminder_sent` tinyint(2) NOT NULL DEFAULT 0,
  `is_excel_download` tinyint(11) NOT NULL DEFAULT 0 COMMENT ' = dowloaded excel file',
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tms_invoice_client`
--

INSERT INTO `tms_invoice_client` (`invoice_id`, `invoice_number`, `custom_invoice_number`, `freelance_id`, `customer_id`, `scoop_id`, `value_date`, `invoice_date`, `payment_date`, `paid_date`, `payment_type`, `paid_amount`, `item_total`, `vat`, `Invoice_cost`, `invoice_type`, `invoice_status`, `is_invoice_sent`, `currency_rate`, `reminder_sent`, `is_excel_download`, `created_date`, `modified_date`) VALUES
(1, 'S-000001', 'S-000001', 1, 1, '[{\"id\":1}]', '2023-06-21 19:52:00', '2023-06-02 00:00:00', '0000-00-00 00:00:00', '2023-06-05 00:00:00', '', 400.00, 400.00, '0', 400.00, 'save', 'Overdue', 1, '', 0, 0, '2023-06-02 00:00:00', '2023-06-05 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tms_invoice_client_payments`
--

CREATE TABLE `tms_invoice_client_payments` (
  `partial_payment_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `invoice_partial_paid_amount` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tms_invoice_client_payments`
--

INSERT INTO `tms_invoice_client_payments` (`partial_payment_id`, `invoice_id`, `invoice_partial_paid_amount`, `created_date`) VALUES
(1, 1, '400', '2023-06-05 18:04:50');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tms_invoice_setting`
--

CREATE TABLE `tms_invoice_setting` (
  `id` int(11) NOT NULL,
  `branch_center_id` varchar(200) NOT NULL,
  `company_short_code` varchar(200) NOT NULL,
  `company_name` varchar(200) NOT NULL,
  `address1` varchar(200) NOT NULL,
  `address2` varchar(200) NOT NULL,
  `city` varchar(200) NOT NULL,
  `country` varchar(200) NOT NULL,
  `postcode` varchar(200) NOT NULL,
  `vat_number` varchar(200) NOT NULL,
  `work_email` varchar(200) NOT NULL,
  `invoice_receive_email` varchar(255) NOT NULL COMMENT 'Linguist Invoice Receive Email',
  `web_address` varchar(255) NOT NULL,
  `copyright_text` varchar(255) NOT NULL,
  `logo_url` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `server_no` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=spellUp, 2=Beconnected, 3=Dosina',
  `invoice_design` tinyint(1) NOT NULL DEFAULT 2,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `dtCreatedDate` datetime DEFAULT NULL,
  `dtUpdatedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tms_invoice_setting`
--

INSERT INTO `tms_invoice_setting` (`id`, `branch_center_id`, `company_short_code`, `company_name`, `address1`, `address2`, `city`, `country`, `postcode`, `vat_number`, `work_email`, `invoice_receive_email`, `web_address`, `copyright_text`, `logo_url`, `description`, `server_no`, `invoice_design`, `is_default`, `dtCreatedDate`, `dtUpdatedDate`) VALUES
(1, '14', 'BN', 'BeConnected AS', 'Sandakerveien 138', '', 'Oslo', 'Norway', '0484', 'NO918883010 MVA', 'info@beconnected.no', 'accounting@beconnected.no', 'www.beconnected.no', 'BeConnected 2011 - 2023. All rights reserved', 'assets/img/invoice_logo.png', '', 2, 2, 1, '2023-06-09 11:22:17', '2023-06-09 11:22:17'),
(2, '13', 'BG', 'BeConnected Bulgaria LTD', 'Dobrudzha str. 5, fl. 1, ap. 1', '', 'Sofia', 'Bulgaria', '1000', 'BG202240829', 'info@beconnected.no', 'accounting@beconnected.no', 'www.beconnected.no', 'BeConnected 2011 - 2023. All rights reserved', 'assets/img/invoice_logo.png', '', 2, 2, 0, '2023-06-09 11:22:17', '2023-06-09 11:22:17');

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
  `qaSpecialist` varchar(200) NOT NULL,
  `subPm` varchar(200) NOT NULL,
  `subPc` varchar(200) NOT NULL,
  `subQa` varchar(200) NOT NULL,
  `heads_up` tinyint(2) NOT NULL,
  `upcomingDate` datetime NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `q_date` varchar(255) NOT NULL,
  `item_language` varchar(255) NOT NULL,
  `source_lang` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `target_lang` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `item_status` varchar(255) NOT NULL DEFAULT '1',
  `item_email_subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `place_of_delivery` varchar(255) NOT NULL,
  `amount` longtext NOT NULL,
  `total_amount` float NOT NULL,
  `auto_status` enum('Auto','Manual') NOT NULL DEFAULT 'Auto',
  `po_number` varchar(255) NOT NULL,
  `attached_workflow` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tms_items`
--

INSERT INTO `tms_items` (`itemId`, `order_id`, `item_number`, `item_name`, `description`, `price`, `total_price`, `project_pricelist`, `project_type`, `tax`, `contact_person`, `manager`, `coordinator`, `qaSpecialist`, `subPm`, `subPc`, `subQa`, `heads_up`, `upcomingDate`, `start_date`, `due_date`, `q_date`, `item_language`, `source_lang`, `target_lang`, `item_status`, `item_email_subject`, `place_of_delivery`, `amount`, `total_amount`, `auto_status`, `po_number`, `attached_workflow`, `created_date`, `updated_date`) VALUES
(1, 2, '1', 'Google | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"20\",\"pricelist\":\"Project Price\",\"itemPrice\":\"20\",\"itemTotal\":\"400.00\",\"amtSum\":400}]', 400, 0, '1', 0, '1', '1', '4', '', '', '', '', 0, '0000-00-00 00:00:00', '2023-06-02 17:04:00', '2023-06-02 17:00:00', '06-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '5', 'Test', 'Email', '', 400, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-06-02 17:04:27', '2023-06-21 19:52:17'),
(2, 2, '2', 'Google | English (US)-Swedish', '', '', 0, 0, '1', 0, '1', '1', '4', '', '', '', '', 0, '0000-00-00 00:00:00', '2023-06-02 17:06:00', '2023-06-02 17:00:00', '06-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Swedish\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/se.png\",\"alt\":\"Sweden\"}', '1', 'Test', 'Email', '', 0, 'Auto', '', 'SingleJob -Translation (TRA)', '2023-06-02 17:06:54', '2023-06-02 17:09:41'),
(3, 4, '1', 'Google', '', '', 0, 0, '', 0, '1', '', '', '11', '', '', '', 0, '0000-00-00 00:00:00', '2023-06-06 13:06:12', '2023-06-06 18:35:00', '', '', '', '', '1', '', '', '', 0, 'Auto', '', '', '2023-06-06 13:06:12', '2023-06-06 13:06:12'),
(4, 4, '2', 'Google', '', '', 0, 0, '', 0, '1', '', '', '11', '', '', '', 0, '0000-00-00 00:00:00', '2023-06-06 13:06:12', '2023-06-06 18:35:00', '', '', '', '', '1', '', '', '', 0, 'Auto', '', '', '2023-06-06 13:06:12', '2023-06-06 13:06:12'),
(5, 5, '1', 'Ecolab | English (US)-Finnish', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"11\",\"itemTotal\":\"11.00\",\"amtSum\":11}]', 11, 1, '6', 0, '3', '8', '6', '13', '', '', '', 0, '0000-00-00 00:00:00', '2023-06-19 14:18:00', '2023-06-19 14:00:00', '06-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Finnish\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/fi.png\",\"alt\":\"Finland\"}', '13', 'Acolad Translation Request: Project 10390324 - NS_Class1&Group2', 'gcms', '', 11, 'Auto', '', 'jobChain -TEP', '2023-06-19 14:18:43', '2023-06-21 18:08:05'),
(6, 5, '2', 'Ecolab | English (US)-Finnish', '', '', 0, 1, '6', 0, '3', '8', '6', '11', '', '', '', 0, '0000-00-00 00:00:00', '2023-06-19 14:18:00', '2023-06-19 14:00:00', '06-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Finnish\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/fi.png\",\"alt\":\"Finland\"}', '4', 'Acolad Translation Request: Project 10390324 - NS_Class1&Group2', 'gcms', '', 0, 'Auto', '', 'jobChain -TEP', '2023-06-19 14:18:43', '2023-06-20 14:14:19'),
(7, 5, '3', 'Ecolab | English (US)-Finnish', '', '', 0, 1, '6', 0, '3', '8', '6', '11', '', '', '', 0, '0000-00-00 00:00:00', '2023-06-19 14:18:00', '2023-06-19 14:00:00', '06-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Finnish\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/fi.png\",\"alt\":\"Finland\"}', '4', 'Acolad Translation Request: Project 10390324 - NS_Class1&Group2', 'gcms', '', 0, 'Auto', '', 'jobChain -TEP', '2023-06-19 14:18:43', '2023-06-20 14:14:19'),
(8, 5, '4', 'Ecolab | English (US)-Finnish', '', '', 0, 1, '6', 0, '3', '8', '6', '11', '', '', '', 0, '0000-00-00 00:00:00', '2023-06-20 14:14:00', '0000-00-00 00:00:00', '01-1970', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Finnish\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/fi.png\",\"alt\":\"Finland\"}', '4', 'Acolad Translation Request: Project 10390324 - NS_Class1&Group2', 'gcms', '', 0, 'Auto', '', 'jobChain -TEP', '2023-06-20 14:14:10', '2023-06-20 14:16:31'),
(9, 6, '1', 'Ecolab | English (US)-Finnish', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"10\",\"itemTotal\":\"10.00\",\"amtSum\":10},{\"quantity\":\"6000\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0\",\"itemTotal\":\"\",\"amtSum\":0}]', 10, 0, '6', 0, '3', '8', '6', '', '', '', '', 0, '0000-00-00 00:00:00', '2023-06-20 14:24:00', '2023-06-20 13:54:00', '06-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Finnish\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/fi.png\",\"alt\":\"Finland\"}', '2', 'subject', 'gcms', '', 10, 'Auto', '', 'jobChain -TEP v2', '2023-06-20 14:24:35', '2023-06-21 17:41:13'),
(10, 6, '2', 'Ecolab | English (US)-Norwegian (bokmal)', '', '', 0, 0, '6', 0, '3', '8', '6', '', '', '', '', 0, '0000-00-00 00:00:00', '2023-06-20 14:24:00', '2023-06-20 13:54:00', '06-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '1', 'subject', '', '', 0, 'Auto', '', 'jobChain -TEP', '2023-06-20 14:24:35', '2023-06-20 14:36:45'),
(11, 6, '3', 'Ecolab', '', '', 0, 0, '', 0, '3', '', '', '', '', '', '', 0, '0000-00-00 00:00:00', '2023-06-20 14:24:35', '2023-06-20 13:54:00', '', '', '', '', '1', '', '', '', 0, 'Auto', '', '', '2023-06-20 14:24:35', '2023-06-20 14:24:35'),
(12, 7, '1', 'Google | English (US)-Norwegian (nynorsk)', '', '[{\"quantity\":\"1500\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,012\",\"itemTotal\":\"18.00\",\"amtSum\":18},{\"quantity\":\"1800\",\"pricelist\":\"Words Translation 50-74% Match\",\"itemPrice\":\"0,33\",\"itemTotal\":\"594.00\",\"amtSum\":594}]', 612, 0, '1', 0, '1', '1', '4', '13', '', '', '', 0, '0000-00-00 00:00:00', '2023-06-22 13:08:00', '2023-06-22 13:08:00', '06-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (nynorsk)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', '2', 'Netflix Check Po', '', '', 612, 'Auto', 'Netflix-62223110', 'SingleJob -Translation (TRA)', '2023-06-22 13:08:44', '2023-06-22 13:10:59'),
(13, 8, '1', 'Ecolab | English (US)-Hindi', '', '[{\"quantity\":\"1\",\"pricelist\":\"Project Price\",\"itemPrice\":\"546\",\"itemTotal\":\"546.00\",\"amtSum\":546}]', 546, 0, '1', 0, '4', '1', '4', '13', '', '', '', 0, '0000-00-00 00:00:00', '2023-06-22 16:28:00', '2023-06-23 16:28:00', '06-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Hindi\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/in.png\",\"alt\":\"India\"}', '3', 'UPI-429', '', '', 546, 'Auto', '22623-429', 'SingleJob -Translation (TRA)', '2023-06-22 16:28:35', '2023-07-25 16:04:09'),
(14, 8, '2', 'Ecolab | English (US)-Hindi', '', '', 0, 0, '1', 0, '4', '1', '4', '13', '', '', '', 0, '0000-00-00 00:00:00', '2023-06-26 16:40:00', '2023-06-23 16:28:00', '06-2023', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Hindi\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/in.png\",\"alt\":\"India\"}', '5', 'UPI-429', '', '', 0, 'Auto', 'X-po-257023', 'SingleJob -Translation (TRA)', '2023-06-26 16:40:25', '2023-07-25 16:04:35');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
(11, 'Overdue', 1, '2023-01-18 15:01:39', '2023-01-18 15:02:00'),
(12, 'PM Ready', 1, '2023-01-18 15:01:39', '2023-01-18 15:02:00'),
(13, 'QA Issues', 1, '2023-06-14 15:01:39', '2023-06-14 15:02:00');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
(22, 'Testing', 'TES', '', '', '2022-12-04 01:28:24', '2022-12-04 01:28:24'),
(23, 'Translation + Proofreading', 'TEP', '', '', '2023-06-19 14:42:34', '2023-06-19 14:42:34'),
(24, 'PM Preparation', 'PMP', '', '', '2023-06-19 14:52:52', '2023-06-19 14:52:52'),
(25, 'PM Delivery', 'PMD', '', '', '2023-06-19 14:53:57', '2023-06-19 14:53:57'),
(26, 'Quality Assurances', 'QA', '', '', '2023-06-19 14:54:57', '2023-06-19 14:54:57');

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
  `all_customer` tinyint(2) NOT NULL DEFAULT 1 COMMENT '1 for All customer',
  `description` varchar(255) NOT NULL,
  `workfolw_status` varchar(255) NOT NULL COMMENT 'workflowcomplete="2,4",unknown="1,3"',
  `sortedJobsJson` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tms_job_chain`
--

INSERT INTO `tms_job_chain` (`job_chain_id`, `job_name`, `job_status`, `project_type`, `creator`, `customer`, `all_customer`, `description`, `workfolw_status`, `sortedJobsJson`, `created_date`, `updated_date`) VALUES
(2, 'TEP', '2', 6, 'Plamena Serafimova', '[]', 1, '', '', '[{\"id\":20},{\"id\":19},{\"id\":21},{\"id\":23},{\"id\":22},{\"id\":18}]', '2023-06-19 14:23:16', '2023-06-19 15:00:43'),
(3, 'TEP v2', '2', 6, 'Nadya Sekalova', '[]', 1, '', '', '[{\"id\":24},{\"id\":25},{\"id\":26},{\"id\":27},{\"id\":28}]', '2023-06-20 14:21:12', '2023-06-20 14:22:36');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tms_job_status`
--

INSERT INTO `tms_job_status` (`jb_status_id`, `job_status_name`, `status_color`, `is_active`, `is_default`, `default_added`, `created_date`, `modified_date`) VALUES
(1, 'In preparation', '', 1, 1, 0, '2022-12-20 00:00:00', '2022-12-20 00:00:00'),
(2, 'Requested', '', 1, 0, 0, '2022-12-20 00:00:00', '2022-12-20 00:00:00'),
(3, 'Waiting', '', 1, 0, 0, '2022-12-20 00:00:00', '2022-12-20 00:00:00'),
(4, 'Ongoing', '', 1, 0, 0, '2022-12-20 00:00:00', '2022-12-20 00:00:00'),
(5, 'Overdue', '', 1, 0, 0, '2022-12-20 00:00:00', '2022-12-20 00:00:00'),
(6, 'Completed', '', 1, 0, 0, '2022-12-20 00:00:00', '2022-12-20 00:00:00'),
(7, 'Invoice Ready', '', 1, 0, 0, '2022-12-20 00:00:00', '2022-12-20 00:00:00'),
(8, 'Invoiced', '', 1, 0, 0, '2022-12-20 00:00:00', '2022-12-20 00:00:00'),
(9, 'Paid', '', 1, 0, 0, '2022-12-20 00:00:00', '2022-12-20 00:00:00'),
(10, 'Cancelled', '', 1, 0, 0, '2022-12-20 00:00:00', '2022-12-20 00:00:00');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tms_knowledge_pic`
--

CREATE TABLE `tms_knowledge_pic` (
  `pic_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `funny_pic` varchar(255) NOT NULL,
  `flag_like` int(11) NOT NULL,
  `flag_comment` int(11) NOT NULL DEFAULT 0,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0=deactive, 1=active',
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tms_know_pic_like`
--

CREATE TABLE `tms_know_pic_like` (
  `like_pic_id` int(11) NOT NULL,
  `pic_id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `pic_like` int(11) NOT NULL DEFAULT 0,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
  `id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `flagImg` varchar(255) NOT NULL,
  `flagTitle` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
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
(41, 'en_GEN', 'English', 'English', 'noflag.png', 'General', 0, 0, '2021-04-20 00:00:00', '2021-06-08 18:15:51');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tms_log_master`
--

INSERT INTO `tms_log_master` (`log_id`, `log_type_id`, `task_id`, `log_title`, `log_type`, `log_status`, `created_by`, `created_date`, `modified_date`) VALUES
(1, 2, 0, 'Anil Kanhasoft', 'add', 'internal_res', 1, '2023-05-27 13:38:11', '2023-05-29 15:28:53'),
(2, 3, 0, 'Jason Butler Test', 'add', 'internal_res', 1, '2023-05-29 15:24:36', '2023-06-02 15:40:42'),
(3, 2, 0, 'Anil Kanhasoft', 'update', 'internal_res', 1, '2023-05-29 16:20:53', '2023-07-03 13:24:04'),
(4, 3, 0, 'Jason Butler Test', 'update', 'internal_res', 1, '2023-06-02 15:42:34', '2023-06-02 15:42:34'),
(5, 3, 0, 'Jason Butler Test', 'delete', 'internal_res', 1, '2023-06-02 15:42:46', '2023-06-02 15:42:46'),
(6, 4, 0, 'Ingvild Sundland', 'add', 'internal_res', 1, '2023-06-02 16:49:46', '2023-06-02 16:49:46'),
(7, 1, 0, 'Test Client', 'add', 'direct_cli', 1, '2023-06-02 16:58:06', '2023-06-02 16:58:06'),
(8, 1, 0, '', 'update', 'direct_cli', 1, '2023-06-02 16:58:55', '2023-06-02 16:58:55'),
(9, 1, 0, '', 'create', 'direct_cli', 1, '2023-06-02 16:59:22', '2023-06-02 16:59:22'),
(10, 1, 0, 'Google', 'add', 'indirect_cli', 1, '2023-06-02 17:01:30', '2023-06-02 17:01:30'),
(11, 1, 0, 'Test Client', 'update - contact created', 'direct_cli', 1, '2023-06-02 17:02:17', '2023-06-02 17:02:17'),
(12, 4, 0, 'Ingvild Sundland', 'update', 'internal_res', 1, '2023-06-02 17:03:35', '2023-06-02 17:03:35'),
(13, 2, 0, 'BeConnected AS0001', 'add', 'project', 1, '2023-06-02 17:03:59', '2023-06-02 17:03:59'),
(14, 2, 1, 'BeConnected AS0001-001', 'update', 'project_scoop', 1, '2023-06-02 17:06:44', '2023-06-02 17:07:01'),
(15, 2, 2, 'BeConnected AS0001-002', 'update', 'project_scoop', 1, '2023-06-02 17:07:01', '2023-06-02 17:09:41'),
(16, 5, 0, 'Ingvild Freelancer', 'add', 'external_res', 1, '2023-06-02 17:17:06', '2023-06-02 17:17:06'),
(17, 6, 0, 'Nadya Sekalova', 'add', 'internal_res', 1, '2023-06-02 17:42:54', '2023-06-02 17:42:54'),
(18, 7, 0, 'Stefaniya Koleva', 'add', 'internal_res', 1, '2023-06-02 17:43:42', '2023-06-02 17:43:42'),
(19, 8, 0, 'Plamena Serafimova', 'add', 'internal_res', 1, '2023-06-02 17:44:19', '2023-06-02 17:44:19'),
(20, 9, 0, 'Aleksandra Dimitrova', 'add', 'internal_res', 7, '2023-06-02 17:48:57', '2023-06-02 17:48:57'),
(21, 9, 0, 'Aleksandra Dimitrova', 'update', 'internal_res', 7, '2023-06-02 17:49:20', '2023-06-02 17:49:20'),
(22, 2, 1, 'BeConnected AS0001-001', 'update', 'project_scoop', 7, '2023-06-02 17:57:19', '2023-06-05 18:08:25'),
(23, 10, 0, 'Sevdalina Demireva', 'add', 'internal_res', 7, '2023-06-05 13:29:50', '2023-06-05 13:29:50'),
(24, 11, 0, 'Kris Utev', 'add', 'internal_res', 1, '2023-06-05 18:02:29', '2023-06-05 18:02:29'),
(25, 4, 0, 'BeConnected AS0002', 'add', 'project', 7, '2023-06-06 13:06:05', '2023-06-06 13:06:05'),
(26, 2, 0, 'BeConnected AS0001', 'update', 'project', 1, '2023-06-08 12:05:09', '2023-08-22 14:59:19'),
(27, 12, 0, 'Hristo Taushanov', 'add', 'internal_res', 1, '2023-06-19 13:17:49', '2023-06-19 13:17:49'),
(28, 13, 0, 'Maria Eftimova', 'add', 'internal_res', 1, '2023-06-19 13:18:46', '2023-06-19 13:18:46'),
(29, 2, 0, 'Acolad, Inc.', 'add', 'direct_cli', 12, '2023-06-19 13:46:49', '2023-06-19 13:46:49'),
(30, 2, 0, 'Acolad, Inc.', 'update', 'direct_cli', 12, '2023-06-19 13:47:05', '2023-06-19 14:05:55'),
(31, 2, 0, '', 'create', 'direct_cli', 12, '2023-06-19 14:07:07', '2023-06-19 17:19:36'),
(32, 2, 0, 'Acolad, Inc.', 'update - contact created', 'direct_cli', 6, '2023-06-19 14:12:42', '2023-06-19 14:12:42'),
(33, 2, 0, 'Ecolab', 'add', 'indirect_cli', 6, '2023-06-19 14:13:27', '2023-06-19 14:13:27'),
(34, 5, 0, 'BBBB0001', 'add', 'project', 6, '2023-06-19 14:18:31', '2023-06-19 14:18:31'),
(35, 5, 7, 'BBBB0001-003', 'update', 'project_scoop', 6, '2023-06-19 14:26:42', '2023-06-20 14:14:20'),
(36, 5, 5, 'BBBB0001-001', 'update', 'project_scoop', 6, '2023-06-19 14:33:38', '2023-06-20 14:14:19'),
(37, 5, 6, 'BBBB0001-002', 'update', 'project_scoop', 6, '2023-06-19 14:34:17', '2023-06-20 14:14:19'),
(38, 5, 4, 'BBBB0001_TEP001', 'update', 'task', 8, '2023-06-19 15:16:11', '2023-06-19 15:16:11'),
(39, 5, 0, 'BBBB0001', 'update', 'project', 8, '2023-06-19 15:17:19', '2023-06-19 15:17:19'),
(40, 5, 5, 'BBBB0001-001', 'update', 'project_scoop', 8, '2023-06-19 15:29:53', '2023-06-21 18:08:05'),
(41, 5, 12, 'BBBB0001_TEP009', 'delete', 'task', 8, '2023-06-19 15:40:39', '2023-06-19 15:40:39'),
(42, 5, 4, 'BBBB0001_TEP001', 'delete', 'task', 8, '2023-06-19 15:41:13', '2023-06-19 15:41:13'),
(43, 5, 8, 'BBBB0001_TRA005', 'update', 'task', 8, '2023-06-19 15:51:18', '2023-06-19 16:30:34'),
(44, 5, 9, 'BBBB0001_PRF006', 'delete', 'task', 8, '2023-06-19 15:58:49', '2023-06-19 15:58:49'),
(45, 5, 7, 'BBBB0001_PMP004', 'update', 'task', 8, '2023-06-19 16:30:15', '2023-06-19 16:30:15'),
(46, 5, 10, 'BBBB0001_QA007', 'update', 'task', 8, '2023-06-19 16:31:28', '2023-06-19 16:31:28'),
(47, 5, 11, 'BBBB0001_PMD008', 'update', 'task', 8, '2023-06-19 16:31:53', '2023-06-19 17:25:06'),
(48, 5, 5, 'BBBB0001-001', 'update', 'project_scoop', 13, '2023-06-19 16:35:02', '2023-06-19 16:35:02'),
(49, 6, 0, 'Nadya Sekalova', 'update', 'internal_res', 6, '2023-06-19 17:02:39', '2023-06-19 17:38:18'),
(50, 5, 0, 'BBBB0001', 'update', 'project', 11, '2023-06-19 17:04:52', '2023-06-19 17:48:32'),
(51, 5, 5, 'BBBB0001-001', 'update', 'project_scoop', 11, '2023-06-19 17:05:21', '2023-06-19 17:05:37'),
(52, 5, 10, 'BBBB0001_QA007', 'update', 'task', 11, '2023-06-19 17:07:36', '2023-06-19 17:07:36'),
(53, 6, 0, 'Nadya Sekalova', 'update', 'internal_res', 1, '2023-06-20 13:15:37', '2023-06-20 13:15:37'),
(54, 5, 8, 'BBBB0001-004', 'update', 'project_scoop', 6, '2023-06-20 14:14:19', '2023-06-20 14:16:31'),
(55, 6, 0, 'BBBB0002', 'add', 'project', 6, '2023-06-20 14:24:25', '2023-06-20 14:24:25'),
(56, 6, 9, 'BBBB0002-001', 'update', 'project_scoop', 6, '2023-06-20 14:35:19', '2023-06-20 14:35:19'),
(57, 6, 10, 'BBBB0002-002', 'update', 'project_scoop', 6, '2023-06-20 14:35:59', '2023-06-20 14:36:45'),
(58, 6, 20, 'BBBB0002_PRF003', 'delete', 'task', 6, '2023-06-20 14:44:08', '2023-06-20 14:44:08'),
(59, 6, 19, 'BBBB0002_PMD001', 'update', 'task', 6, '2023-06-20 14:47:06', '2023-06-20 14:47:06'),
(60, 6, 9, 'BBBB0002-001', 'update', 'project_scoop', 8, '2023-06-20 16:20:17', '2023-06-21 17:41:13'),
(61, 14, 0, 'Gergana Midileva', 'add', 'internal_res', 1, '2023-06-20 19:09:12', '2023-06-20 19:09:12'),
(62, 15, 0, 'Slavka Zlatkova', 'add', 'internal_res', 1, '2023-06-20 19:11:07', '2023-06-20 19:11:07'),
(63, 6, 30, 'BBBB0002_PMD007', 'delete', 'task', 8, '2023-06-21 17:54:09', '2023-06-21 17:54:09'),
(64, 6, 33, 'BBBB0002_QA010', 'delete', 'task', 8, '2023-06-21 17:54:26', '2023-06-21 17:54:26'),
(65, 6, 34, 'BBBB0002_PMD011', 'delete', 'task', 8, '2023-06-21 17:54:46', '2023-06-21 17:54:46'),
(66, 6, 31, 'BBBB0002_TRA008', 'update', 'task', 8, '2023-06-21 17:57:28', '2023-06-21 18:00:12'),
(67, 6, 32, 'BBBB0002_PRF009', 'update', 'task', 8, '2023-06-21 17:59:08', '2023-06-21 18:02:23'),
(68, 7, 0, 'BeConnected AS0003', 'add', 'project', 1, '2023-06-22 13:08:40', '2023-06-22 13:08:40'),
(69, 7, 12, 'BeConnected AS0003-001', 'update', 'project_scoop', 1, '2023-06-22 13:10:59', '2023-06-22 13:10:59'),
(70, 7, 35, 'BeConnected AS0003_TRA001', 'update', 'task', 1, '2023-06-22 13:12:12', '2023-06-22 13:12:12'),
(71, 3, 0, 'Kanhasoft BN-Test', 'add', 'direct_cli', 1, '2023-06-22 16:26:05', '2023-06-22 16:26:05'),
(72, 3, 0, 'Kanhasoft BG-Test', 'update', 'direct_cli', 1, '2023-06-22 16:26:43', '2023-06-26 17:48:35'),
(73, 8, 0, 'BNBN0001', 'add', 'project', 1, '2023-06-22 16:28:32', '2023-06-22 16:28:32'),
(74, 8, 13, 'BNBN0001-001', 'update', 'project_scoop', 1, '2023-06-22 16:29:58', '2023-07-25 16:04:10'),
(75, 16, 0, 'Anil Nadiya', 'add', 'external_res', 1, '2023-06-22 16:32:31', '2023-06-22 16:32:31'),
(76, 16, 0, 'Anil Nadiya', 'update', 'external_res', 1, '2023-06-22 16:34:14', '2023-08-08 14:53:49'),
(77, 8, 36, 'BNBN0001_TRA001', 'update', 'task', 1, '2023-06-22 17:02:19', '2023-06-22 17:02:19'),
(78, 8, 14, 'BNBN0001-002', 'update', 'project_scoop', 1, '2023-06-26 16:40:36', '2023-07-25 16:04:35'),
(79, 7, 15, 'BeConnected AS0003-002', 'update', 'project_scoop', 1, '2023-07-21 17:51:15', '2023-07-21 17:51:15'),
(80, 9, 0, 'BBBB0003', 'add', 'project', 1, '2023-07-21 17:52:25', '2023-07-21 17:52:25'),
(81, 9, 16, 'BBBB0003-001', 'update', 'project_scoop', 1, '2023-07-21 17:53:30', '2023-07-21 17:53:54'),
(82, 8, 37, 'BNBN0001_TRA002', 'update', 'task', 1, '2023-07-25 16:03:13', '2023-08-25 17:54:12');

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
  `is_active` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_by` double NOT NULL,
  `modified_by` double NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `is_active` int(11) NOT NULL DEFAULT 1 COMMENT 'active="1",inactive="0"',
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
(17, 26, 10, '1', 'Proofreading', 'PRF', '', '', '2022-12-04 00:43:18', '2022-12-04 00:43:18'),
(18, 2, 23, '1', 'Translation + Proofreading', 'TEP', '', '', '2023-06-19 14:43:30', '2023-06-19 14:43:30'),
(19, 2, 9, '2', 'Translation', 'TRA', '', '', '2023-06-19 14:47:19', '2023-06-19 14:47:19'),
(20, 2, 24, '3', 'PM Preparation', 'PMP', '', '', '2023-06-19 14:55:19', '2023-06-19 14:55:19'),
(21, 2, 10, '3', 'Proofreading', 'PRF', '', '', '2023-06-19 14:55:28', '2023-06-19 14:55:28'),
(22, 2, 25, '3', 'PM Delivery', 'PMD', '', '', '2023-06-19 14:56:25', '2023-06-19 14:56:25'),
(23, 2, 26, '3', 'Quality Assurances', 'QA', '', '', '2023-06-19 14:57:43', '2023-06-19 14:57:43'),
(24, 3, 25, '1', 'PM Delivery', 'PMD', '', '', '2023-06-20 14:22:11', '2023-06-20 14:22:11'),
(25, 3, 9, '1', 'Translation', 'TRA', '', '', '2023-06-20 14:22:19', '2023-06-20 14:22:19'),
(26, 3, 10, '1', 'Proofreading', 'PRF', '', '', '2023-06-20 14:22:25', '2023-06-20 14:22:25'),
(27, 3, 26, '1', 'Quality Assurances', 'QA', '', '', '2023-06-20 14:22:30', '2023-06-20 14:22:30'),
(28, 3, 25, '1', 'PM Delivery', 'PMD', '', '', '2023-06-20 14:22:35', '2023-06-20 14:22:35');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tms_order`
--

INSERT INTO `tms_order` (`order_id`, `order_number`, `abbrivation`, `currency`, `project_status`, `edited_by`, `edited_id`, `created_date`, `modified_date`) VALUES
(2, 1, 'BeConnected AS', '', '', 1, 1, '2023-06-02 17:03:41', '2023-06-02 00:00:00'),
(4, 2, 'BeConnected AS', '', '', 1, 1, '2023-06-06 13:05:27', '2023-06-08 00:00:00'),
(5, 1, 'BBBB', '', '', 8, 1, '2023-06-19 14:11:54', '2023-06-19 00:00:00'),
(6, 2, 'BBBB', '', '', 1, 1, '2023-06-20 14:22:47', '2023-06-20 00:00:00'),
(7, 3, 'BeConnected AS', '', '', 1, 1, '2023-06-22 13:07:42', '2023-06-22 00:00:00'),
(8, 1, 'BNBN', '', '', 1, 1, '2023-06-22 16:27:17', '2023-06-22 00:00:00'),
(9, 3, 'BBBB', '', '', 0, 0, '2023-07-21 17:51:35', '2023-07-21 17:52:24');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tms_passwordreset_tbl`
--

INSERT INTO `tms_passwordreset_tbl` (`id`, `iUserId`, `reset_password_token`, `created_date`, `updated_date`) VALUES
(1, 5, '', '2023-06-20 14:55:04', '2023-06-20 14:55:04');

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
  `tax_rate` float NOT NULL DEFAULT 0,
  `dtCreatedDate` datetime NOT NULL,
  `dtUpdatedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tms_payment`
--

INSERT INTO `tms_payment` (`iPaymentId`, `iUserId`, `iClientId`, `iType`, `vPaymentInfo`, `vBankInfo`, `tax_rate`, `dtCreatedDate`, `dtUpdatedDate`) VALUES
(1, 0, 1, 2, '{\"country_code\":\"\",\"tax_id\":\"\"}', '{}', 0, '2023-06-02 16:58:55', '2023-06-02 16:58:55'),
(2, 0, 2, 2, '{\"tax_id\":\"411881957\",\"memos\":\"Payment terms: 30 days after the invoice date\\n\\n\\nClient\'s system:\\nhttps://gcms.sajan.com \\nusername: beconnected\\npassword: pisnamiii445!97! /as of 19.05.2023/\\n\\n\\n\\nWe issue an invoice once the amount of 1000 USD (approved items) is reached. All invoices have to be sent to accountingsajan@acolad.com. Invoices must be received within 45 days of project completion. \\n\\nHIGHLY IMPORTANT: All invoices should contain both project numbers and PO numbers as otherwise the invoice will be rejected. Both numbers could be found on their online portal (2 instances - both should be checked), Toolbox-Purchase orders section. \\nPaypal:\\n°Payment Total <$1000 = 2% of total fee\\n°Payment Total >$1000 = $20.00 fee\\n\\n\\n\\nThey have a transfer fee of 15 USD.\\n\\nSometimes they have also chragebacks for failed projects for bigger mounts.\",\"country_code\":\"41\"}', '{}', 0, '2023-06-19 14:05:46', '2023-06-19 14:05:46'),
(3, 0, 2, 2, '{\"tax_id\":\"411881957\",\"memos\":\"Payment terms: 30 days after the invoice date\\n\\n\\nClient\'s system:\\nhttps://gcms.sajan.com \\nusername: beconnected\\npassword: pisnamiii445!97! /as of 19.05.2023/\\n\\n\\n\\nWe issue an invoice once the amount of 1000 USD (approved items) is reached. All invoices have to be sent to accountingsajan@acolad.com. Invoices must be received within 45 days of project completion. \\n\\nHIGHLY IMPORTANT: All invoices should contain both project numbers and PO numbers as otherwise the invoice will be rejected. Both numbers could be found on their online portal (2 instances - both should be checked), Toolbox-Purchase orders section. \\nPaypal:\\n°Payment Total <$1000 = 2% of total fee\\n°Payment Total >$1000 = $20.00 fee\\n\\n\\n\\nThey have a transfer fee of 15 USD.\\n\\nSometimes they have also chragebacks for failed projects for bigger mounts.\",\"country_code\":\"41\"}', '{}', 0, '2023-06-19 14:05:55', '2023-06-19 14:05:55');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tms_price_unit`
--

CREATE TABLE `tms_price_unit` (
  `id` int(11) NOT NULL,
  `unit_name` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
  `is_active` tinyint(1) DEFAULT 1,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `default_added` int(11) NOT NULL COMMENT 'Nobady can delete this statuses',
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
  `is_active` tinyint(2) NOT NULL DEFAULT 1,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
(14, 'Technical', 1, '2022-12-05 02:53:00', '2023-03-29 18:31:02');

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
  `send_request` varchar(255) NOT NULL,
  `accept` int(111) NOT NULL,
  `rejection` varchar(255) NOT NULL,
  `price` longtext NOT NULL,
  `total_price` float NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tms_summmery_view`
--

INSERT INTO `tms_summmery_view` (`job_summmeryId`, `per_id`, `order_id`, `item_id`, `job_id`, `job_chain_id`, `appr_id`, `master_job_id`, `job_no`, `job_code`, `order_no`, `po_number`, `tmp_po_number`, `description`, `resource`, `due_date`, `contact_person`, `item_status`, `company_code`, `work_instruction`, `ItemLanguage`, `specialization`, `negative_feedback`, `late_delivery`, `auto_job`, `auto_status`, `send_request`, `accept`, `rejection`, `price`, `total_price`, `created_date`, `updated_date`) VALUES
(1, 0, 2, 1, 0, NULL, 0, 9, '1', 'TRA', '', 'BeConnected AS0001_TRA001', 'BeConnected AS0001_TRA001', '', '', '0000-00-00 00:00:00', '1', 'Invoice Ready', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', 0, '', '', 0, '2023-06-02 17:06:44', '2023-06-02 17:06:44'),
(2, 0, 2, 2, 9, NULL, 0, 9, '2', 'TRA', '', 'BeConnected AS0001_TRA002', 'BeConnected AS0001_TRA002', '', '', '0000-00-00 00:00:00', '1', 'In preparation', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', 0, '', '', 0, '2023-06-02 17:07:01', '2023-06-02 17:07:01'),
(3, 0, 4, 1, 15, NULL, 0, 15, '1', 'TER', '', 'BeConnected AS0002_TER001', 'BeConnected AS0002_TER001', '', '', '0000-00-00 00:00:00', '', 'In preparation', '', '', '>', '', '', '', '1', 'Auto', '', 0, '', '', 0, '2023-06-06 13:07:27', '2023-06-06 13:07:27'),
(5, 0, 5, 2, 23, 2, 0, 23, '2', 'TEP', '', 'BBBB0001_TEP002', 'BBBB0001_TEP002', '', '', '0000-00-00 00:00:00', '8', 'In preparation', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', 0, '', '', 0, '2023-06-19 14:44:33', '2023-06-19 14:44:33'),
(6, 0, 5, 3, 23, 2, 0, 23, '3', 'TEP', '', 'BBBB0001_TEP003', 'BBBB0001_TEP003', '', '', '0000-00-00 00:00:00', '8', 'In preparation', '', '', 'English (US) > Swedish', '', '', '', '1', 'Auto', '', 0, '', '', 0, '2023-06-19 14:44:45', '2023-06-19 14:44:45'),
(7, 0, 5, 1, 24, 2, 0, 24, '4', 'PMP', '', 'BBBB0001_PMP004', 'BBBB0001_PMP004', '', '', '2023-06-19 13:00:00', '8', 'Completed', 'BBBB0001', '[]', 'English (US) > Finnish', '', '', '', '1', 'Auto', '', 0, '', '', 0, '2023-06-19 15:39:28', '2023-06-19 16:30:15'),
(8, 0, 5, 1, 9, 2, 0, 9, '5', 'TRA', '', 'BBBB0001_TRA005', 'BBBB0001_TRA005', '', '5', '2023-06-19 13:40:00', '8', 'Completed', 'BBBB0001', '[]', 'English (US) > Finnish', '', '', '', '1', 'Auto', '', 0, '', '', 0, '2023-06-19 15:39:28', '2023-06-19 16:30:34'),
(10, 0, 5, 1, 26, 2, 0, 26, '7', 'QA', '', 'BBBB0001_QA007', 'BBBB0001_QA007', '', '', '2023-06-19 14:20:00', '8', 'Completed', 'BBBB0001', '[]', 'English (US) > Finnish', '', '', '', '1', 'Auto', '', 0, '', '', 0, '2023-06-19 15:39:29', '2023-06-19 17:07:36'),
(11, 0, 5, 1, 25, 2, 0, 25, '8', 'PMD', '', 'BBBB0001_PMD008', 'BBBB0001_PMD008', '', '', '2023-06-19 13:40:00', '8', 'Completed', 'BBBB0001', '[]', 'English (US) > Finnish', '', '', '', '1', 'Auto', '', 0, '', '', 0, '2023-06-19 15:39:29', '2023-06-19 17:25:06'),
(13, 0, 5, 4, 23, 2, 0, 23, '9', 'TEP', '', 'BBBB0001_TEP009', 'BBBB0001_TEP009', '', '', '0000-00-00 00:00:00', '8', 'In preparation', '', '', 'English (US) > Finnish', '', '', '', '1', 'Auto', '', 0, '', '', 0, '2023-06-20 14:14:20', '2023-06-20 14:14:20'),
(14, 0, 5, 4, 9, 2, 0, 9, '10', 'TRA', '', 'BBBB0001_TRA010', 'BBBB0001_TRA010', '', '', '0000-00-00 00:00:00', '8', 'In preparation', '', '', 'English (US) > Finnish', '', '', '', '1', 'Auto', '', 0, '', '', 0, '2023-06-20 14:14:20', '2023-06-20 14:14:20'),
(15, 0, 5, 4, 24, 2, 0, 24, '11', 'PMP', '', 'BBBB0001_PMP011', 'BBBB0001_PMP011', '', '', '0000-00-00 00:00:00', '8', 'In preparation', '', '', 'English (US) > Finnish', '', '', '', '1', 'Auto', '', 0, '', '', 0, '2023-06-20 14:14:21', '2023-06-20 14:14:21'),
(16, 0, 5, 4, 10, 2, 0, 10, '12', 'PRF', '', 'BBBB0001_PRF012', 'BBBB0001_PRF012', '', '', '0000-00-00 00:00:00', '8', 'In preparation', '', '', 'English (US) > Finnish', '', '', '', '1', 'Auto', '', 0, '', '', 0, '2023-06-20 14:14:21', '2023-06-20 14:14:21'),
(17, 0, 5, 4, 25, 2, 0, 25, '13', 'PMD', '', 'BBBB0001_PMD013', 'BBBB0001_PMD013', '', '', '0000-00-00 00:00:00', '8', 'In preparation', '', '', 'English (US) > Finnish', '', '', '', '1', 'Auto', '', 0, '', '', 0, '2023-06-20 14:14:21', '2023-06-20 14:14:21'),
(18, 0, 5, 4, 26, 2, 0, 26, '14', 'QA', '', 'BBBB0001_QA014', 'BBBB0001_QA014', '', '', '0000-00-00 00:00:00', '8', 'In preparation', '', '', 'English (US) > Finnish', '', '', '', '1', 'Auto', '', 0, '', '', 0, '2023-06-20 14:14:22', '2023-06-20 14:14:22'),
(19, 0, 6, 1, 25, 0, 0, 25, '1', 'PMD', '', 'BBBB0002_PMD001', 'BBBB0002_PMD001', '', '5', '2023-06-20 12:16:00', '8', 'Completed', 'BBBB0002', '[]', 'English (US) > Finnish', '', '', '', '1', 'Auto', '', 0, '', '', 0, '2023-06-20 14:35:20', '2023-06-20 14:57:52'),
(24, 0, 6, 2, 23, 2, 0, 23, '3', 'TEP', '', 'BBBB0002_TEP003', 'BBBB0002_TEP003', '', '', '0000-00-00 00:00:00', '8', 'In preparation', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', 0, '', '', 0, '2023-06-20 14:36:00', '2023-06-20 14:36:00'),
(25, 0, 6, 2, 9, 0, 0, 9, '4', 'TRA', '', 'BBBB0002_TRA004', 'BBBB0002_TRA004', '', '', '0000-00-00 00:00:00', '8', 'In preparation', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', 0, '', '', 0, '2023-06-20 14:36:01', '2023-06-20 14:36:01'),
(26, 0, 6, 2, 24, 0, 0, 24, '5', 'PMP', '', 'BBBB0002_PMP005', 'BBBB0002_PMP005', '', '', '0000-00-00 00:00:00', '8', 'In preparation', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', 0, '', '', 0, '2023-06-20 14:36:01', '2023-06-20 14:36:01'),
(27, 0, 6, 2, 26, 0, 0, 26, '8', 'QA', '', 'BBBB0002_QA008', 'BBBB0002_QA008', '', '', '0000-00-00 00:00:00', '8', 'In preparation', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', 0, '', '', 0, '2023-06-20 14:36:01', '2023-06-20 14:36:01'),
(28, 0, 6, 2, 25, 0, 0, 25, '7', 'PMD', '', 'BBBB0002_PMD007', 'BBBB0002_PMD007', '', '', '0000-00-00 00:00:00', '8', 'In preparation', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', 0, '', '', 0, '2023-06-20 14:36:01', '2023-06-20 14:36:01'),
(29, 0, 6, 2, 10, 0, 0, 10, '6', 'PRF', '', 'BBBB0002_PRF006', 'BBBB0002_PRF006', '', '', '0000-00-00 00:00:00', '8', 'In preparation', '', '', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', 0, '', '', 0, '2023-06-20 14:36:01', '2023-06-20 14:36:01'),
(31, 0, 6, 1, 9, 3, 0, 9, '8', 'TRA', '', 'BBBB0002_TRA008', 'BBBB0002_TRA008', '', '5', '2023-06-21 15:45:00', '8', 'Completed', 'BBBB0002', '[]', 'English (US) > Finnish', '', '', '', '1', 'Auto', '', 0, '', '', 0, '2023-06-21 17:53:35', '2023-06-21 18:00:38'),
(32, 0, 6, 1, 10, 3, 0, 10, '9', 'PRF', '', 'BBBB0002_PRF009', 'BBBB0002_PRF009', '', '5', '2023-06-21 16:29:00', '8', 'Completed', 'BBBB0002', '[]', 'English (US) > Finnish', '', '', '', '1', 'Auto', '', 0, '', '', 0, '2023-06-21 17:53:37', '2023-06-21 18:03:22'),
(35, 0, 7, 1, 0, 0, 0, 9, '1', 'TRA', '', 'BeConnected AS0003_TRA001', 'BeConnected AS0003_TRA001', '', '5', '2023-06-22 13:11:00', '1', 'Requested', 'BeConnected AS0003', '[]', 'English (US) > Norwegian (nynorsk)', '', '', '', '1', 'Auto', '', 0, '', '[{\"quantity\":\"1500\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,090\",\"itemTotal\":\"135.00\",\"amtSum\":135},{\"quantity\":\"1800\",\"pricelist\":\"Words Translation 50-74% Match\",\"itemPrice\":\"0,080\",\"itemTotal\":\"144.00\",\"amtSum\":144}]', 279, '2023-06-22 13:11:00', '2023-06-22 13:14:59'),
(36, 0, 8, 1, 0, 0, 0, 9, '1', 'TRA', '', 'BNBN0001_TRA001', 'BNBN0001_TRA001', 'Please check PO and start working on it.', '16', '2023-06-22 17:01:00', '1', 'Completed', 'BNBN0001', '[]', 'English (US) > Hindi', '', '', '', '1', 'Auto', '', 0, '', '[{\"quantity\":1,\"pricelist\":\"Project Price\",\"itemPrice\":\"105,00\",\"itemTotal\":\"105.00\"}]', 105, '2023-06-22 16:29:59', '2023-06-26 16:43:00'),
(37, 0, 8, 2, 9, 0, 0, 9, '2', 'TRA', '', 'BNBN0001_TRA002', 'BNBN0001_TRA002', 'Translation project', '16', '2023-07-25 16:02:00', '1', 'Invoice Ready', 'BNBN0001', '[]', 'English (US) > Hindi', '', '', '', '1', 'Auto', '', 0, '', '[{\"quantity\":1,\"pricelist\":\"Project Price\",\"itemPrice\":\"30,75\",\"itemTotal\":\"30.75\",\"amtSum\":30.75}]', 30.75, '2023-06-26 16:40:37', '2023-08-25 17:54:24');

-- --------------------------------------------------------

--
-- Table structure for table `tms_summmery_view_sorting`
--

CREATE TABLE `tms_summmery_view_sorting` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `sorted_json` mediumtext NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tms_summmery_view_sorting`
--

INSERT INTO `tms_summmery_view_sorting` (`id`, `order_id`, `sorted_json`, `updated_date`, `created_date`) VALUES
(1, 5, '[[{\"job_summmeryId\":7,\"per_id\":0,\"order_id\":5,\"item_id\":1,\"job_id\":24,\"job_chain_id\":2,\"appr_id\":0,\"master_job_id\":24,\"job_no\":4,\"job_code\":\"PMP\",\"order_no\":\"\",\"po_number\":\"BBBB0001_PMP004\",\"tmp_po_number\":\"BBBB0001_PMP004\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2023-06-19 13:00:00\",\"contact_person\":8,\"item_status\":\"Completed\",\"company_code\":\"BBBB0001\",\"work_instruction\":\"[]\",\"ItemLanguage\":\"English (US) > Finnish\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"send_request\":\"\",\"accept\":0,\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2023-06-19 15:39:28\",\"updated_date\":\"2023-06-19 16:30:15\",\"vUserName\":null,\"vEmailAddress\":null,\"iUserId\":null,\"contactPerson\":\"Plamena Serafimova\",\"contactPersonId\":8},{\"job_summmeryId\":8,\"per_id\":0,\"order_id\":5,\"item_id\":1,\"job_id\":9,\"job_chain_id\":2,\"appr_id\":0,\"master_job_id\":9,\"job_no\":5,\"job_code\":\"TRA\",\"order_no\":\"\",\"po_number\":\"BBBB0001_TRA005\",\"tmp_po_number\":\"BBBB0001_TRA005\",\"description\":\"\",\"resource\":5,\"due_date\":\"2023-06-19 13:40:00\",\"contact_person\":8,\"item_status\":\"Completed\",\"company_code\":\"BBBB0001\",\"work_instruction\":\"[]\",\"ItemLanguage\":\"English (US) > Finnish\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"send_request\":\"\",\"accept\":0,\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2023-06-19 15:39:28\",\"updated_date\":\"2023-06-19 16:30:34\",\"vUserName\":\"Ingvild Freelancer\",\"vEmailAddress\":\"info@beconnected.no\",\"iUserId\":5,\"contactPerson\":\"Plamena Serafimova\",\"contactPersonId\":8},{\"job_summmeryId\":10,\"per_id\":0,\"order_id\":5,\"item_id\":1,\"job_id\":26,\"job_chain_id\":2,\"appr_id\":0,\"master_job_id\":26,\"job_no\":7,\"job_code\":\"QA\",\"order_no\":\"\",\"po_number\":\"BBBB0001_QA007\",\"tmp_po_number\":\"BBBB0001_QA007\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2023-06-19 14:20:00\",\"contact_person\":8,\"item_status\":\"Completed\",\"company_code\":\"BBBB0001\",\"work_instruction\":\"[]\",\"ItemLanguage\":\"English (US) > Finnish\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"send_request\":\"\",\"accept\":0,\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2023-06-19 15:39:29\",\"updated_date\":\"2023-06-19 17:07:36\",\"vUserName\":null,\"vEmailAddress\":null,\"iUserId\":null,\"contactPerson\":\"Plamena Serafimova\",\"contactPersonId\":8},{\"job_summmeryId\":11,\"per_id\":0,\"order_id\":5,\"item_id\":1,\"job_id\":25,\"job_chain_id\":2,\"appr_id\":0,\"master_job_id\":25,\"job_no\":8,\"job_code\":\"PMD\",\"order_no\":\"\",\"po_number\":\"BBBB0001_PMD008\",\"tmp_po_number\":\"BBBB0001_PMD008\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2023-06-19 13:40:00\",\"contact_person\":8,\"item_status\":\"In preparation\",\"company_code\":\"BBBB0001\",\"work_instruction\":\"[]\",\"ItemLanguage\":\"English (US) > Finnish\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"send_request\":\"\",\"accept\":0,\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2023-06-19 15:39:29\",\"updated_date\":\"2023-06-19 16:31:53\",\"vUserName\":null,\"vEmailAddress\":null,\"iUserId\":null,\"contactPerson\":\"Plamena Serafimova\",\"contactPersonId\":8}],[{\"job_summmeryId\":5,\"per_id\":0,\"order_id\":5,\"item_id\":2,\"job_id\":23,\"job_chain_id\":2,\"appr_id\":0,\"master_job_id\":23,\"job_no\":2,\"job_code\":\"TEP\",\"order_no\":\"\",\"po_number\":\"BBBB0001_TEP002\",\"tmp_po_number\":\"BBBB0001_TEP002\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"0000-00-00 00:00:00\",\"contact_person\":8,\"item_status\":\"In preparation\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"English (US) > Norwegian (bokmal)\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"send_request\":\"\",\"accept\":0,\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2023-06-19 14:44:33\",\"updated_date\":\"2023-06-19 14:44:33\",\"vUserName\":null,\"vEmailAddress\":null,\"iUserId\":null,\"contactPerson\":\"Plamena Serafimova\",\"contactPersonId\":8}],[{\"job_summmeryId\":6,\"per_id\":0,\"order_id\":5,\"item_id\":3,\"job_id\":23,\"job_chain_id\":2,\"appr_id\":0,\"master_job_id\":23,\"job_no\":3,\"job_code\":\"TEP\",\"order_no\":\"\",\"po_number\":\"BBBB0001_TEP003\",\"tmp_po_number\":\"BBBB0001_TEP003\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"0000-00-00 00:00:00\",\"contact_person\":8,\"item_status\":\"In preparation\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"English (US) > Swedish\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"send_request\":\"\",\"accept\":0,\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2023-06-19 14:44:45\",\"updated_date\":\"2023-06-19 14:44:45\",\"vUserName\":null,\"vEmailAddress\":null,\"iUserId\":null,\"contactPerson\":\"Plamena Serafimova\",\"contactPersonId\":8}]]', '2023-06-19 11:38:01', '2023-06-19 17:06:15');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tms_tree_menu`
--

CREATE TABLE `tms_tree_menu` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `checked` tinyint(1) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tms_tree_menu`
--

INSERT INTO `tms_tree_menu` (`id`, `parent_id`, `name`, `checked`, `created_date`, `updated_date`) VALUES
(1, 0, 'Dashboard', 1, '2022-12-30 16:32:15', '2022-12-30 12:32:21'),
(2, 0, 'Resources', 1, '2022-12-30 16:32:15', '2022-12-30 12:15:17'),
(3, 2, 'Internal Resource', 1, '2022-12-30 16:32:15', '2022-12-30 12:15:17'),
(4, 2, 'External Resource', 1, '2022-12-30 16:32:15', '2022-12-30 12:15:17'),
(5, 0, 'Clients', 1, '2022-12-30 16:46:33', '2022-12-30 12:15:17'),
(6, 5, 'Client List', 1, '2022-12-30 16:46:49', '2022-12-30 12:15:17'),
(7, 5, 'Account', 1, '2022-12-30 16:46:54', '2022-12-30 12:15:17'),
(8, 0, 'Reports', 1, '2022-12-30 16:47:23', '2022-12-30 12:15:17'),
(9, 8, 'Overview Reports', 1, '2022-12-30 16:48:38', '2022-12-30 12:15:17'),
(10, 8, 'Internal Statistic', 1, '2022-12-30 16:48:40', '2022-12-30 12:15:17'),
(11, 8, 'Scoop Reports', 1, '2022-12-30 16:48:42', '2022-12-30 12:15:17'),
(12, 8, 'Job Reports', 1, '2022-12-30 16:48:44', '2022-12-30 12:15:17'),
(13, 0, 'Invoice', 1, '2022-12-30 16:52:43', '2022-12-30 12:15:17'),
(14, 13, 'Client Invoice', 1, '2022-12-30 16:50:04', '2022-12-30 12:15:17'),
(15, 13, 'Linguist Invoice', 1, '2022-12-30 16:50:07', '2022-12-30 12:15:17'),
(16, 0, 'Statement', 1, '2022-12-30 16:52:58', '2022-12-30 12:15:17'),
(17, 16, 'Client Statement', 1, '2022-12-30 16:51:17', '2022-12-30 12:15:17'),
(18, 16, 'Linguist Statement', 1, '2022-12-30 16:51:20', '2022-12-30 12:15:17'),
(19, 40, 'Admin System', 1, '2022-12-30 16:52:58', '2023-01-02 09:50:35'),
(20, 19, 'Currency', 1, '2022-12-30 16:54:07', '2022-12-30 12:15:17'),
(21, 19, 'Properties', 1, '2022-12-30 16:54:11', '2022-12-30 12:15:17'),
(22, 19, 'Languages', 1, '2022-12-30 16:54:07', '2022-12-30 12:15:17'),
(23, 19, 'Languages-Translate', 1, '2022-12-30 16:54:11', '2022-12-30 12:15:17'),
(24, 19, 'Specialisation', 1, '2022-12-30 16:54:07', '2022-12-30 12:15:17'),
(25, 19, 'Business Unit', 1, '2022-12-30 16:54:11', '2022-12-30 12:15:17'),
(26, 19, 'Languages', 1, '2022-12-30 16:54:07', '2022-12-30 12:15:17'),
(27, 19, 'Templates', 1, '2022-12-30 16:54:11', '2022-12-30 12:15:17'),
(28, 19, 'Date Format', 1, '2022-12-30 16:54:07', '2022-12-30 12:15:17'),
(29, 19, 'Decimal Seperator', 1, '2022-12-30 16:54:11', '2022-12-30 12:15:17'),
(30, 40, 'Admin Projects', 1, '2022-12-30 16:52:58', '2023-01-02 09:53:11'),
(31, 30, 'Project Types', 1, '2022-12-30 16:54:07', '2022-12-30 12:15:17'),
(32, 30, 'Project Status', 1, '2022-12-30 17:00:05', '2022-12-30 12:15:17'),
(33, 30, 'Job status', 1, '2022-12-30 17:00:08', '2022-12-30 12:15:17'),
(34, 30, 'Jobs', 1, '2022-12-30 17:00:10', '2022-12-30 12:15:17'),
(35, 30, 'Job Chain', 1, '2022-12-30 17:00:12', '2022-12-30 12:32:23'),
(36, 30, 'Price Unit', 1, '2022-12-30 17:00:14', '2022-12-30 12:15:17'),
(37, 30, 'Invoice Due', 1, '2022-12-30 17:00:18', '2022-12-30 12:15:17'),
(38, 30, 'Banking Info', 1, '2022-12-30 17:00:21', '2022-12-30 12:15:17'),
(39, 40, 'Taxation', 1, '2022-12-30 17:00:49', '2022-12-30 13:06:50'),
(40, 0, 'Admin', 1, '2022-12-30 18:26:18', '2022-12-30 13:05:03'),
(41, 47, 'Category', 1, '2022-12-30 17:02:14', '2022-12-30 13:08:01'),
(42, 47, 'Articles', 1, '2022-12-30 17:02:14', '2022-12-30 13:08:01'),
(43, 47, 'News', 1, '2022-12-30 17:02:14', '2022-12-30 13:08:01'),
(44, 47, 'Calander Events', 1, '2022-12-30 17:02:14', '2022-12-30 13:07:44'),
(45, 47, 'Funny Picture', 1, '2022-12-30 17:02:14', '2022-12-30 13:08:01'),
(46, 47, 'Reported Image', 1, '2022-12-30 17:02:14', '2022-12-30 13:08:01'),
(47, 0, 'Knowledge Base', 1, '2022-12-30 17:01:55', '2022-12-30 13:07:24'),
(48, 40, 'Resource', 1, '2022-12-30 18:30:35', '2022-12-30 13:07:08'),
(49, 40, 'Client Status', 1, '2022-12-30 18:30:35', '2022-12-30 13:07:08');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
  `enableDisbaleLoginStatus` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 for enable ,0 for disbale',
  `created_by` int(11) NOT NULL,
  `created_by_name` varchar(255) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `iEditedBy` int(11) NOT NULL,
  `dtLast_job` date NOT NULL,
  `specialization` varchar(255) NOT NULL,
  `csv_import` tinyint(2) NOT NULL DEFAULT 0,
  `freelance_currency` varchar(255) NOT NULL,
  `second_currency` varchar(255) NOT NULL COMMENT 'For Norway Linguist (NOK)',
  `tabPermission` text NOT NULL,
  `activation_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=not activated,1=activated',
  `is_available` text NOT NULL COMMENT '1=available,0=un-available(Linguist)',
  `menu_access` text NOT NULL,
  `super_admin` tinyint(2) NOT NULL,
  `activation_token` varchar(50) NOT NULL,
  `dtCreatedDate` datetime NOT NULL,
  `dtUpdatedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tms_users`
--

INSERT INTO `tms_users` (`iUserId`, `vUserName`, `freelancer`, `vEmailAddress`, `vSecondaryEmailAddress`, `vPassword`, `org_pass`, `eUserStatus`, `vResourceType`, `vResourcePosition`, `iFkUserTypeId`, `iResourceNumber`, `dtCreationDate`, `vTimeZone`, `vTimeZoneCity`, `vUTC`, `vFirstName`, `vLastName`, `dtBirthDate`, `companyName`, `vFacebook_id`, `vTwitter_id`, `vGoogle_plus_id`, `iGender`, `iMobile`, `vPhoneNumber`, `vWebsite`, `vSkypeName`, `vFileManage`, `vEmailTemplate`, `tMemo`, `vAddress1`, `vAddress2`, `address1Detail`, `address2Detail`, `vSalesId`, `vComapanyCode`, `vholiday_country`, `vProfilePic`, `enableDisbaleLoginStatus`, `created_by`, `created_by_name`, `modified_by`, `iEditedBy`, `dtLast_job`, `specialization`, `csv_import`, `freelance_currency`, `second_currency`, `tabPermission`, `activation_status`, `is_available`, `menu_access`, `super_admin`, `activation_token`, `dtCreatedDate`, `dtUpdatedDate`) VALUES
(1, 'TMS Admin', 'freelancer', 'admin@tmse.com', 'anils7016@gmail.com', '0e7517141fb53f21ee439b355b5a1d0a', 'Admin@123', 3, 2, '2', 1, '1', '2016-01-02 14:59:21', '', '', '', 'TMS', 'Admin', '1991-08-24', '', 'Https://www.google.co.in/?gfe_rd=cr&ei=VRKxWK2GM9e', 'https://www.google.co.in/?gfe_rd=cr&ei=VRKxWK2GM9e', 'https://www.google.co.in/?gfe_rd=cr&ei=VRKxWK2GM9e', 1, '{\"countryTitle\":\"India (भारत): +91\",\"countryFlagClass\":\"iti-flag in\",\"placeHolder\":\"091234 56789\",\"mobileNumber\":\"97370 00050\"}', '', 'http://www.tms.com', 'TMS', '', '', '', '', '', '', '', '', '', '[{\"Cname\":\"Argentina\"},{\"Cname\":\"Australia\"},{\"Cname\":\"Aruba\"}]', '1545300029.jpg', 1, 1, '', 0, 0, '0000-00-00', '', 0, '', '', '{\"due_today\":true,\"assigned\":true,\"ongoing\":true,\"qa_ready\":true,\"qa_issue\":true,\"pm_ready\":true,\"delivery\":true,\"completed\":true,\"overdue\":true,\"due_tomorrow\":true,\"my_project\":true,\"upcoming\":true,\"approved\":true,\"all\":true}', 1, '', '{\"reports\":true,\"invoice\":true,\"statement\":true,\"knowledge-base\":true,\"resources\":true,\"clients\":true,\"admin\":true,\"favourite\":true,\"activity\":true,\"dashboard\":true}', 1, '', '2016-01-02 15:00:40', '2023-04-28 11:15:32'),
(2, 'Anil Kanhasoft', 'freelancer', 'anil@kanhasoft.com', '', '202cb962ac59075b964b07152d234b70', '123', 3, 0, '3', 1, '2', '0000-00-00 00:00:00', '', '', '', 'Anil', 'Kanhasoft', '0000-00-00', '', '', '', '', 1, '{\"countryTitle\":\"India (भारत): +91\",\"countryFlagClass\":\"iti-flag in\",\"placeHolder\":\"091234 56789\",\"mobileNumber\":\"97376 36750\"}', '', '', 'anil.kanhasoft', '', '', '', '', '', '', '', '', '', '', '1685357453.png', 1, 1, '', 0, 0, '0000-00-00', '', 0, '', '', '{\"due_today\":true,\"assigned\":true,\"ongoing\":true,\"qa_ready\":true,\"qa_issue\":true,\"delivery\":true,\"pm_ready\":true,\"overdue\":true,\"completed\":true,\"approved\":true,\"all\":true,\"my_project\":true,\"due_tomorrow\":true,\"upcoming\":true}', 1, '', '{\"dashboard\":true,\"resources\":true,\"clients\":true,\"invoice\":true,\"knowledge-base\":true,\"statement\":true,\"reports\":true,\"admin\":true,\"favourite\":true,\"activity\":true}', 0, '891f70f107d68ba922efb85a84a35a31eeb1701e', '2023-05-29 15:28:53', '2023-07-03 13:24:03'),
(4, 'Ingvild Sundland', 'freelancer', 'isundland@beconnected.no', '', '37e51feaea3a9face1cb66e2bd04ba75', '@ya#o-x3pu', 3, 0, '3', 1, '3', '2023-06-02 16:49:46', '', '', '', 'Ingvild', 'Sundland', '0000-00-00', '', '', '', '', 2, '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"placeHolder\":\"(201) 555-5555\",\"mobileNumber\":\"\"}', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', 0, 0, '0000-00-00', '', 0, '', '', '{\"qa_issue\":true,\"pm_ready\":true,\"delivery\":true,\"completed\":true,\"qa_ready\":true,\"overdue\":true,\"due_tomorrow\":true,\"my_project\":true,\"upcoming\":true,\"approved\":true,\"ongoing\":true,\"assigned\":true}', 1, '', '{\"dashboard\":true,\"resources\":true,\"clients\":true,\"reports\":true,\"invoice\":true,\"statement\":true,\"admin\":true,\"knowledge-base\":true,\"favourite\":true,\"activity\":true}', 0, '000430665cbef43ae6b91123464257d0c05d5e5b', '2023-06-02 16:49:46', '2023-06-02 17:03:35'),
(5, 'Ingvild Freelancer', 'freelancer', 'info@beconnected.no', 'isundland@beconnected.no', 'cc8e78ba3b51adcfd32e45cdd22ea507', '963963MilK_', 3, 0, '', 2, '0001', '2023-06-02 17:17:06', '', 'Oslo', '', 'Ingvild', 'Freelancer', '0000-00-00', '', '', '', '', 2, '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"94053446\"}', '', '', '', '', '', '', 'Frennings vei 20', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Oslo\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"Norway\"},{\"id\":\"address1_postal_code\",\"value\":\"0588\"}]', '[]', '', '', '', '', 1, 1, '', 0, 5, '0000-00-00', '', 0, 'EUR,€', '', '', 1, '', '', 0, '2a32d67b88eec350c05091c3c787394e6052f8a5', '2023-06-02 17:17:06', '2023-06-02 17:17:06'),
(6, 'Nadya Sekalova', 'freelancer', 'nsekalova@beconnected.no', '', 'a0a3e9f47a168fa0d4d5853a212e2477', '%>w0k2hhp3', 3, 0, '3', 1, '4', '2023-06-02 17:42:53', '', '', '', 'Nadya', 'Sekalova', '0000-00-00', '', '', '', '', 2, '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"placeHolder\":\"(201) 555-5555\",\"mobileNumber\":\"\"}', '', '', 'Nasekalova', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', 0, 0, '0000-00-00', '', 0, '', '', '{\"due_today\":true,\"assigned\":true,\"ongoing\":true,\"qa_ready\":true,\"qa_issue\":true,\"pm_ready\":true,\"delivery\":true,\"completed\":true,\"overdue\":true,\"due_tomorrow\":true,\"my_project\":true,\"upcoming\":true,\"approved\":true,\"all\":true}', 1, '', '{\"dashboard\":true,\"resources\":true,\"clients\":true,\"reports\":true,\"invoice\":true,\"statement\":true,\"admin\":true,\"knowledge-base\":true,\"favourite\":true,\"activity\":true}', 0, '3c035737cb52ec290002f4ba3b61ae6cadfc57a6', '2023-06-02 17:42:53', '2023-06-20 13:15:37'),
(7, 'Stefaniya Koleva', 'freelancer', 'skoleva@beconnected.no', '', 'f7d40cab010d5afc738ea488143cf779', '$0%Owh(Ii+', 3, 0, '5', 1, '0005', '2023-06-02 17:43:42', '', '', '', 'Stefaniya', 'Koleva', '0000-00-00', '', '', '', '', 2, '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', 0, 0, '0000-00-00', '', 0, '', '', '{\"due_today\":true,\"assigned\":true,\"ongoing\":true,\"qa_ready\":true,\"qa_issue\":true,\"pm_ready\":true,\"delivery\":true,\"completed\":true,\"overdue\":true,\"due_tomorrow\":true,\"my_project\":true,\"upcoming\":true,\"approved\":true,\"all\":true}', 1, '', '{\"dashboard\":true,\"resources\":true,\"clients\":true,\"reports\":true,\"invoice\":true,\"statement\":true,\"admin\":true,\"knowledge-base\":true,\"favourite\":true,\"activity\":true}', 0, 'c4e6cd1c1eaa09fe77123bb7291151f75b81f3a5', '2023-06-02 17:43:42', '2023-06-02 17:43:42'),
(8, 'Plamena Serafimova', 'freelancer', 'piordanova@beconnected.no', '', '8b87fe5b262aec69117fdd5f938489fd', '6f6H5)g7at', 3, 0, '2', 1, '0006', '2023-06-02 17:44:19', '', '', '', 'Plamena', 'Serafimova', '0000-00-00', '', '', '', '', 2, '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', 0, 0, '0000-00-00', '', 0, '', '', '{\"due_today\":true,\"assigned\":true,\"ongoing\":true,\"qa_ready\":true,\"qa_issue\":true,\"pm_ready\":true,\"delivery\":true,\"completed\":true,\"overdue\":true,\"due_tomorrow\":true,\"my_project\":true,\"upcoming\":true,\"approved\":true,\"all\":true}', 1, '', '{\"dashboard\":true,\"resources\":true,\"clients\":true,\"reports\":true,\"invoice\":true,\"statement\":true,\"admin\":true,\"knowledge-base\":true,\"favourite\":true,\"activity\":true}', 0, 'c377cedbfc7e1a2a20c6ea05d2975c097c18d06e', '2023-06-02 17:44:19', '2023-06-02 17:44:19'),
(9, 'Aleksandra Dimitrova', 'freelancer', 'adimitrova@beconnected.no', '', '1175a9c6d9a223a6e434fbc0b74bb626', '+!7N#G43d*', 3, 0, '1,17', 1, '7', '2023-06-02 17:48:57', '', '', '', 'Aleksandra', 'Dimitrova', '0000-00-00', '', '', '', '', 2, '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"placeHolder\":\"(201) 555-5555\",\"mobileNumber\":\"\"}', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 7, '', 0, 0, '0000-00-00', '', 0, '', '', '{}', 1, '', '{}', 0, '052a969ebcc0e06bdd0ff794d1403b12a491913f', '2023-06-02 17:48:57', '2023-06-02 17:49:19'),
(10, 'Sevdalina Demireva', 'freelancer', 'sdemireva@beconnected.no', '', '597f8dd6fb34ceaac07fa8538665dfc2', 's-pl2xrP$x', 3, 0, '5', 1, '0008', '2023-06-05 13:29:50', '', '', '', 'Sevdalina', 'Demireva', '0000-00-00', '', '', '', '', 2, '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 7, '', 0, 10, '0000-00-00', '', 0, '', '', '{}', 1, '', '{}', 0, '5c00de911104e5b445c94db954a535840ce4edcd', '2023-06-05 13:29:50', '2023-06-05 13:29:50'),
(11, 'Kris Utev', 'freelancer', 'kutev@beconnected.no', '', '2081c1de505eab90beffe16f1c43a3a2', '<m(s4ifIwr', 3, 0, '4', 1, '0009', '2023-06-05 18:02:29', '', '', '', 'Kris', 'Utev', '0000-00-00', '', '', '', '', 1, '{\"countryTitle\":\"Norway (Norge): +47\",\"countryFlagClass\":\"iti-flag no\",\"mobileNumber\":\"940 53 446\"}', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', 0, 0, '0000-00-00', '', 0, '', '', '{\"qa_ready\":true,\"qa_issue\":true,\"pm_ready\":true,\"delivery\":true,\"completed\":true,\"overdue\":true,\"due_tomorrow\":true,\"my_project\":true,\"upcoming\":true,\"approved\":true,\"all\":true,\"ongoing\":true,\"assigned\":true}', 1, '', '{\"resources\":true,\"clients\":true,\"reports\":true,\"invoice\":true,\"statement\":true,\"admin\":true,\"knowledge-base\":true,\"favourite\":true,\"activity\":true,\"dashboard\":true}', 0, 'a4f428729a45e2cad10a43b61d584be9fb6037f1', '2023-06-05 18:02:29', '2023-06-05 18:02:29'),
(12, 'Hristo Taushanov', 'freelancer', 'htaushanov@beconnected.no', '', '680e918ad42241b966d527037d747a24', '>0coec)qAi', 3, 0, '16', 1, '0010', '2023-06-19 13:17:48', '', '', '', 'Hristo', 'Taushanov', '0000-00-00', '', '', '', '', 1, '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', '', 'Hrtaushanov', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', 0, 12, '0000-00-00', '', 0, '', '', '{\"due_today\":true,\"assigned\":true,\"ongoing\":true,\"qa_ready\":true,\"qa_issue\":true,\"pm_ready\":true,\"delivery\":true,\"completed\":true,\"overdue\":true,\"due_tomorrow\":true,\"my_project\":true,\"upcoming\":true,\"approved\":true,\"all\":true}', 1, '', '{\"dashboard\":true,\"resources\":true,\"clients\":true,\"reports\":true,\"invoice\":true,\"statement\":true,\"admin\":true,\"knowledge-base\":true,\"favourite\":true,\"activity\":true}', 0, '13371498590050675323d97bd9338834fc93ad11', '2023-06-19 13:17:48', '2023-06-19 13:17:48'),
(13, 'Maria Eftimova', 'freelancer', 'meftimova@beconnected.no', '', '7c57399c18ae4fbdaa7a37e010e68571', 'y+<M1oaPea', 3, 0, '4', 1, '0011', '2023-06-19 13:18:46', '', '', '', 'Maria', 'Eftimova', '0000-00-00', '', '', '', '', 2, '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', 0, 13, '0000-00-00', '', 0, '', '', '{\"due_today\":true,\"assigned\":true,\"ongoing\":true,\"qa_ready\":true,\"qa_issue\":true,\"pm_ready\":true,\"delivery\":true,\"completed\":true,\"overdue\":true,\"due_tomorrow\":true,\"my_project\":true,\"upcoming\":true,\"approved\":true,\"all\":true}', 1, '', '{\"dashboard\":true,\"resources\":true,\"clients\":true,\"reports\":true,\"invoice\":true,\"statement\":true,\"admin\":true,\"knowledge-base\":true,\"favourite\":true,\"activity\":true}', 0, 'ae42526b5eb2e03052a6eaf03ba2105271017521', '2023-06-19 13:18:46', '2023-06-19 13:18:46'),
(14, 'Gergana Midileva', 'freelancer', 'gmidileva@beconnected.no', '', 'ee50e7a8f0ec473d9c9cd9688148582a', 'wnpfJJPqsC', 3, 0, '3', 1, '0012', '2023-06-20 19:09:12', '', '', '', 'Gergana', 'Midileva', '0000-00-00', '', '', '', '', 2, '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', 0, 0, '0000-00-00', '', 0, '', '', '{\"due_today\":true,\"assigned\":true,\"ongoing\":true,\"qa_ready\":true,\"qa_issue\":true,\"pm_ready\":true,\"delivery\":true,\"completed\":true,\"overdue\":true,\"due_tomorrow\":true,\"my_project\":true,\"upcoming\":true,\"approved\":true,\"all\":true}', 1, '', '{\"dashboard\":true,\"resources\":true,\"clients\":true,\"reports\":true,\"invoice\":true,\"statement\":true,\"knowledge-base\":true,\"admin\":true,\"favourite\":true,\"activity\":true}', 0, '2f3e4d32d0fe9eef8bc7afcc43f62501017e0359', '2023-06-20 19:09:12', '2023-06-20 19:09:12'),
(15, 'Slavka Zlatkova', 'freelancer', 'szlatkova@beconnected.no', '', 'f4640894cd0581e9e18f1e3776be5c19', '5wq%cCJ0h@', 3, 0, '2', 1, '0013', '2023-06-20 19:11:07', '', '', '', 'Slavka', 'Zlatkova', '0000-00-00', '', '', '', '', 2, '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', 0, 0, '0000-00-00', '', 0, '', '', '{\"all\":true}', 1, '', '{\"dashboard\":true,\"resources\":true,\"clients\":true,\"reports\":true,\"invoice\":true,\"statement\":true,\"admin\":true,\"knowledge-base\":true,\"favourite\":true}', 0, '338e716125dd0ac5e55786ea28fb145c270c4712', '2023-06-20 19:11:07', '2023-06-20 19:11:07'),
(16, 'Anil Nadiya', 'freelancer', 'anil.kanhasoft@gmail.com', '', '202cb962ac59075b964b07152d234b70', '123', 3, 0, '', 2, '2', '2023-06-22 16:32:31', '(GMT 16.32) Asia/Kolkata', 'Ahmedabad', '', 'Anil', 'Nadiya', '1991-08-24', 'Kanhasoft', '', '', '', 1, '{\"countryTitle\":\"United States: +1\",\"countryFlagClass\":\"iti-flag us\",\"mobileNumber\":\"\"}', '', 'kanhasoft.com', '', '', '', '', 'shivalik, Kanhasoft', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Ahmedabad\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"Gujarat\"},{\"id\":\"address1_country\",\"value\":\"India\"},{\"id\":\"address1_postal_code\",\"value\":\"382424\"}]', '[]', '', '', '', '', 1, 1, '', 1, 0, '0000-00-00', '', 0, 'EUR,€', '', '', 1, '', '', 0, '70f1226b13823ad78e8b10a724ab4d2386aaa305', '2023-06-22 16:32:31', '2023-06-22 17:31:31');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tms_user_property`
--

INSERT INTO `tms_user_property` (`id`, `user_id`, `type`, `property_id`, `value_id`, `created_date`, `updated_date`) VALUES
(1, 16, 1, 10, '12,13', '2023-08-08 14:53:22', '2023-08-08 14:53:22');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tms_work_instructs`
--

CREATE TABLE `tms_work_instructs` (
  `id` int(11) NOT NULL,
  `instruct_name` text NOT NULL,
  `is_active` tinyint(11) NOT NULL DEFAULT 0,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tms_work_instructs`
--

INSERT INTO `tms_work_instructs` (`id`, `instruct_name`, `is_active`, `created_date`, `modified_date`) VALUES
(1, 'Translate file(s).', 1, '2021-06-11 14:20:07', '2021-06-22 11:31:47'),
(2, 'Run spell check', 1, '2021-06-11 14:20:07', '2021-06-22 17:32:48'),
(3, 'Run Qa in MemoQ', 1, '2021-06-11 14:20:07', '2021-06-11 14:20:07');

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
-- Indexes for table `tms_invoice_setting`
--
ALTER TABLE `tms_invoice_setting`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `tms_tree_menu`
--
ALTER TABLE `tms_tree_menu`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `bank_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tms_centers`
--
ALTER TABLE `tms_centers`
  MODIFY `center_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tms_child_price_unit`
--
ALTER TABLE `tms_child_price_unit`
  MODIFY `child_price_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `tms_client`
--
ALTER TABLE `tms_client`
  MODIFY `iClientId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tms_client_contact`
--
ALTER TABLE `tms_client_contact`
  MODIFY `iContactId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tms_client_indirect`
--
ALTER TABLE `tms_client_indirect`
  MODIFY `iClientId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tms_customer_group`
--
ALTER TABLE `tms_customer_group`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tms_customer_price_list`
--
ALTER TABLE `tms_customer_price_list`
  MODIFY `price_list_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tms_dateformat`
--
ALTER TABLE `tms_dateformat`
  MODIFY `dateformat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tms_decimal_separator`
--
ALTER TABLE `tms_decimal_separator`
  MODIFY `separator_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tms_directclientlogin`
--
ALTER TABLE `tms_directclientlogin`
  MODIFY `iClientId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tms_directiory`
--
ALTER TABLE `tms_directiory`
  MODIFY `id` int(7) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tms_discussion`
--
ALTER TABLE `tms_discussion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tms_email_sign`
--
ALTER TABLE `tms_email_sign`
  MODIFY `sign_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tms_email_templates`
--
ALTER TABLE `tms_email_templates`
  MODIFY `template_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
  MODIFY `fvrt_menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tms_filemanager`
--
ALTER TABLE `tms_filemanager`
  MODIFY `fmanager_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT for table `tms_general`
--
ALTER TABLE `tms_general`
  MODIFY `general_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tms_invoice`
--
ALTER TABLE `tms_invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tms_invoice_client`
--
ALTER TABLE `tms_invoice_client`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tms_invoice_client_payments`
--
ALTER TABLE `tms_invoice_client_payments`
  MODIFY `partial_payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tms_invoice_due_period`
--
ALTER TABLE `tms_invoice_due_period`
  MODIFY `invoice_due_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tms_invoice_payments`
--
ALTER TABLE `tms_invoice_payments`
  MODIFY `partial_payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tms_invoice_setting`
--
ALTER TABLE `tms_invoice_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tms_items`
--
ALTER TABLE `tms_items`
  MODIFY `itemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tms_item_status`
--
ALTER TABLE `tms_item_status`
  MODIFY `item_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tms_jobs`
--
ALTER TABLE `tms_jobs`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tms_job_chain`
--
ALTER TABLE `tms_job_chain`
  MODIFY `job_chain_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tms_job_events`
--
ALTER TABLE `tms_job_events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tms_job_status`
--
ALTER TABLE `tms_job_status`
  MODIFY `jb_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

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
  MODIFY `new_job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tms_order`
--
ALTER TABLE `tms_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tms_passwordreset_tbl`
--
ALTER TABLE `tms_passwordreset_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tms_payment`
--
ALTER TABLE `tms_payment`
  MODIFY `iPaymentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `job_summmeryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `tms_summmery_view_sorting`
--
ALTER TABLE `tms_summmery_view_sorting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `tax_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tms_team`
--
ALTER TABLE `tms_team`
  MODIFY `team_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tms_tree_menu`
--
ALTER TABLE `tms_tree_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `tms_userprice_list`
--
ALTER TABLE `tms_userprice_list`
  MODIFY `price_listId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tms_users`
--
ALTER TABLE `tms_users`
  MODIFY `iUserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `w_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tms_work_instructs`
--
ALTER TABLE `tms_work_instructs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
