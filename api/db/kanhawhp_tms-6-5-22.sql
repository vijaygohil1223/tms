-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 05, 2022 at 12:22 PM
-- Server version: 5.7.26-0ubuntu0.19.04.1
-- PHP Version: 7.2.18-1+ubuntu19.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
(7, 'Kanhasoft', 'KNH', '1', '[{\"id\":\"numberFormate\",\"value\":\"KNH16___\"}]', '2016-02-16 10:45:05', '2017-01-16 16:05:07'),
(9, 'Logiciel', 'LOG', '1', '[{\"id\":\"numberFormate\",\"value\":\"LOG18___\"}]', '2018-09-26 12:01:27', '2018-10-03 14:36:49'),
(11, 'Global Info Media', 'GIM', '1', '[{\"id\":\"numberFormate\",\"value\":\"GIM18___\"}]', '2018-12-04 10:25:09', '2018-12-04 10:25:09');

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
(7, 1, 'Words Translation ICE Match', '', '1', '', 'Words', '', 1, '2021-11-24 19:14:06', '2021-11-24 19:14:06'),
(8, 1, 'Words Translation Repetitions', '', '1', '', 'Words', '', 1, '2021-11-24 19:14:28', '2021-11-24 19:14:28'),
(9, 1, 'Words Translation Fuzzy Match', '', '1', '', 'Words', '', 1, '2021-11-24 19:14:52', '2021-11-24 19:14:52'),
(10, 1, 'Machine Translation Editing', '', '1', '', 'Words', '', 1, '2021-11-24 19:15:18', '2021-11-24 19:15:18'),
(11, 1, 'Hour(s) Translation', '', '1', '', 'Words', '', 1, '2021-11-24 19:15:43', '2021-11-24 19:15:43'),
(12, 1, 'Minimum Fee', '', '1', '', 'Words', '', 1, '2021-11-24 19:16:17', '2021-11-24 19:16:17'),
(13, 1, 'Project Price TRA', '', '1', '', 'Words', '', 1, '2021-11-24 19:16:38', '2021-11-24 19:16:38'),
(14, 2, 'Words Proofreading (New)', '', '1', '', 'Words', '', 1, '2021-11-24 16:57:14', '2021-11-24 16:57:14'),
(15, 2, 'Words Proofreading 50-74% Match', '', '0.6', '', 'Words', '', 1, '2021-11-24 16:57:48', '2021-11-24 17:08:58'),
(16, 2, 'Words Proofreading 75-84% Match', '', '0.8', '', 'Words', '', 1, '2021-11-24 17:09:18', '2021-11-24 17:09:18'),
(17, 2, 'Words Proofreading 85-94% Match', '', '0.9', '', 'Words', '', 1, '2021-11-24 17:11:55', '2021-11-24 17:11:55'),
(18, 2, 'Words Proofreading 95-99% Match', '', '3', '', 'Words', '', 1, '2021-11-24 17:12:29', '2021-11-24 17:12:29'),
(19, 2, 'Words Proofreading 100% Match', '', '0.8', '', 'Words', '', 1, '2021-11-24 17:13:30', '2021-11-24 17:13:30'),
(20, 2, 'Words Proofreading Repetitions', '', '1', '', 'Words', '', 1, '2021-11-24 19:51:53', '2021-11-24 19:51:53'),
(21, 2, 'Words Proofreading', '', '1', '', 'Words', '', 1, '2021-11-24 19:52:12', '2021-11-24 19:52:12'),
(22, 2, 'Hour(s) Proofreading', '', '1', '', 'Words', '', 1, '2021-11-24 19:52:30', '2021-11-24 19:52:30'),
(23, 2, 'Minimum Fee', '', '1', '', 'Words', '', 1, '2021-11-24 19:54:35', '2021-11-24 19:54:35'),
(24, 2, 'Project Price PRF', '', '1', '', 'Words', '', 1, '2021-11-24 19:55:02', '2021-11-24 19:55:02'),
(25, 3, 'Words Editing', '', '1', '', 'Words', '', 1, '2021-11-25 10:43:56', '2021-11-25 10:43:56'),
(26, 3, 'Hour(s) Editing', '', '1', '', 'Hours', '', 1, '2021-11-25 10:44:25', '2021-11-25 10:44:25'),
(27, 3, 'Minimum Fee', '', '1', '', 'Minimum price', '', 1, '2021-11-25 10:44:48', '2021-11-25 10:44:48'),
(28, 10, 'Hour(s) Transcreation', '', '1', '', 'Hours', '', 1, '2021-11-25 10:45:23', '2021-11-25 10:45:23'),
(29, 10, 'Word target Transcription', '', '1', '', 'Words', '', 1, '2021-11-25 10:45:39', '2021-11-25 10:45:39'),
(30, 4, 'Hour(s) DTP', '', '1', '', 'Hours', '', 1, '2021-11-25 10:46:12', '2021-11-25 10:46:12'),
(31, 4, 'Minimum Fee', '', '1', '', 'Minimum price', '', 1, '2021-11-25 10:47:24', '2021-11-25 10:47:24'),
(32, 5, 'Machine Translation Editing', '', '1', '', 'Words', '', 1, '2021-11-25 10:52:24', '2021-11-25 10:52:24'),
(33, 5, 'Minimum Fee', '', '1', '', 'Minimum price', '', 1, '2021-11-25 10:54:10', '2021-11-25 10:55:09'),
(34, 6, '1-10 QA errors', '', '1', '', 'Words', '', 1, '2021-11-25 10:55:41', '2021-11-25 10:55:41'),
(35, 6, '11-20 QA errors', '', '1', '', 'Words', '', 1, '2021-11-25 10:58:31', '2021-11-25 10:58:31'),
(36, 6, '21-30 QA errors', '', '1', '', 'Words', '', 1, '2021-11-25 10:59:05', '2021-11-25 10:59:05'),
(37, 6, '31-40 QA errors', '', '1', '', 'Words', '', 1, '2021-11-25 10:59:25', '2021-11-25 10:59:25'),
(38, 6, 'Hour(s) QA', '', '1', '', 'Words', '', 1, '2021-11-25 10:59:47', '2021-11-25 10:59:47'),
(39, 6, 'Minimum Fee', '', '1', '', 'Words', '', 1, '2021-11-25 11:00:05', '2021-11-25 11:00:05'),
(40, 7, 'Hour(s) Search Engine Optimization (SEO)', '', '1', '', 'Hours', '', 1, '2021-11-25 11:01:01', '2021-11-25 11:01:01'),
(41, 7, 'Minimum Fee', '', '1', '', 'Minimum price', '', 1, '2021-11-25 11:02:18', '2021-11-25 11:02:18'),
(42, 8, 'Minute(s) subtitling without timecoding', '', '1', '', 'Minutes', '', 1, '2021-11-25 11:04:45', '2021-11-25 11:04:45'),
(43, 8, 'Minute(s) subtitling with timecoding', '', '1', '', 'Minutes', '', 1, '2021-11-25 11:05:02', '2021-11-25 11:05:02'),
(44, 8, 'Words Subtitling without timecoding', '', '1', '', 'Words', '', 1, '2021-11-25 11:05:21', '2021-11-25 11:05:21'),
(45, 8, 'Words Subtitling with timecoding', '', '1', '', 'Words', '', 1, '2021-11-25 11:06:53', '2021-11-25 11:06:53'),
(46, 8, 'Minimum Fee', '', '1', '', 'Minimum price', '', 1, '2021-11-25 11:07:56', '2021-11-25 11:07:56'),
(47, 9, 'Words TEP (New)', '', '1', '', 'Words', '', 1, '2021-11-25 11:15:49', '2021-11-25 11:15:49'),
(48, 9, 'Words TEP 50-74% Match', '', '1', '', 'Words', '', 1, '2021-11-25 11:16:14', '2021-11-25 11:16:14'),
(49, 9, 'Words TEP 75-84% Match', '', '1', '', 'Words', '', 1, '2021-11-25 11:17:01', '2021-11-25 11:17:01'),
(50, 9, 'Words TEP 85-94% Match', '', '1', '', 'Words', '', 1, '2021-11-25 11:17:17', '2021-11-25 11:17:17'),
(51, 9, 'Words TEP 95-99% Match', '', '1', '', 'Words', '', 1, '2021-11-25 11:17:31', '2021-11-25 11:17:31'),
(52, 9, 'Words TEP 100% Match', '', '1', '', 'Words', '', 1, '2021-11-25 11:17:48', '2021-11-25 11:17:48'),
(53, 9, 'Words TEP Perfect Match', '', '1', '', 'Words', '', 1, '2021-11-25 11:18:29', '2021-11-25 11:18:29'),
(54, 9, 'Words TEP Repetitions', '', '1', '', 'Words', '', 1, '2021-11-25 11:18:47', '2021-11-25 11:18:47'),
(55, 9, 'Words TEP Fuzzy Match', '', '1', '', 'Words', '', 1, '2021-11-25 11:19:02', '2021-11-25 11:19:02'),
(56, 9, 'Project Price TEP', '', '1', '', 'Words', '', 1, '2021-11-25 11:19:21', '2021-11-25 11:19:21'),
(57, 9, 'Minimum Fee', '', '1', '', 'Minimum price', '', 1, '2021-11-25 11:20:29', '2021-11-25 11:20:29'),
(58, 11, 'Hour(s) Testing', '', '1', '', 'Hours', '', 1, '2021-11-25 11:20:52', '2021-11-25 11:20:52'),
(59, 12, 'Hour(s) LQA', '', '1', '', 'Units', '', 1, '2021-11-25 11:21:20', '2021-11-26 18:36:00'),
(60, 13, 'Hour(s) Copywriting', '', '1', '', 'Hours', '', 1, '2021-11-25 11:21:44', '2021-11-25 11:21:44'),
(62, 4, 'Page(s) DTP', '', '1', '', 'Pages', '', 1, '2021-12-13 17:30:37', '2021-12-13 17:30:37');

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

INSERT INTO `tms_client` (`iClientId`, `vUserName`, `vCodeInvoice`, `vCodeRights`, `vEmailAddress`, `vPhone`, `vSkype`, `vLogo`, `vWebsite`, `vAddress1`, `vAddress2`, `address1Detail`, `address2Detail`, `iBussinessDeveloper`, `vProjectCoordinator`, `vProjectManager`, `vQASpecialist`, `vCustomerType`, `company_branch_project`, `company_branch_invoice`, `vStatus`, `iSaleId`, `vTextType`, `vClientNumber`, `dtCreationDate`, `iTemplate`, `vVatNumber`, `tMemo`, `tPoInfo`, `tPofor`, `Invoice`, `customer_group`, `client_currency`, `created_id`, `modified_id`, `iEditedBy`, `dtCreatedDate`, `dtUpdatedDate`) VALUES
(1, 'Kanhasoft', '', 'LOG18', '', '{\"countryTitle\":\"India (भारत): +91\",\"countryFlagClass\":\"iti-flag in\",\"mobileNumber\":\"099989 69874\"}', '', '1614684985.jpg', 'www.google.com', 'bodakdev', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"ahmedabad\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"Gujarat\"},{\"id\":\"address1_country\",\"value\":\"india\"},{\"id\":\"address1_postal_code\",\"value\":\"380054\"},{\"id\":\"address1_vTimezone\",\"value\":\"\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '1', '2018-12-12 00:00:00', 0, '', '', 'kanhasoft-001', '', '', '', 'EUR', 1, 3, 0, '2021-10-19 12:01:00', '2021-10-19 12:01:00'),
(2, 'Infosys', '', 'LOG18', '', '{\"countryTitle\":\"India (भारत): +91\",\"countryFlagClass\":\"iti-flag in\",\"mobileNumber\":\"099989 69871\"}', '', '1614690187.png', 'http://192.168.1.111:898/tmsNew/#/client-profile', 'bodakdev', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Ahmedabad\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"gujarat\"},{\"id\":\"address1_country\",\"value\":\"india\"},{\"id\":\"address1_postal_code\",\"value\":\"380054\"},{\"id\":\"address1_vTimezone\",\"value\":\"\"}]', '[]', 0, '', '', '', '', '', '', '8', 0, '', '2', '2019-01-08 00:00:00', 0, '', '', 'infosys-002', '', '', '', 'EUR', 1, 1, 0, '2021-03-02 18:33:07', '2021-03-02 18:33:07');

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
(1, 1, 0, 'Vijay', 'Gohil', 'er.vpgohil@gmail.com', '', 'testAccount', '{\"countryTitle\":\"India (????): +91\",\"countryFlagClass\":\"iti-flag in\",\"mobileNumber\":\"78749 34808\"}', 'vijaygohil', 'active', '', '2018-12-12 16:56:20', '2018-12-12 16:56:20'),
(2, 2, 0, 'Amit', 'Jivani', 'Amit@gmail.com', '', 'testdept', '{\"countryTitle\":\"India (????): +91\",\"countryFlagClass\":\"iti-flag in\",\"mobileNumber\":\"90337 10466\"}', 'Amit23', 'active', '', '2019-01-08 12:10:43', '2019-01-08 12:10:43');

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
(1, 'Test Account', 1, 'www.google.com', '', 'notes goes here..', 0, '2018-12-13 10:55:02', '2018-12-19 10:48:46'),
(2, 'Inx', 2, 'https://data.brreg.no/enhetsregisteret/enhet/', '', 'desc', 0, '2019-01-08 12:20:36', '2019-01-08 06:50:36');

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
(14, 'CAD', 'CAD,$', 'Canadian Dollar', '', '', 5, 1.5605, 0, 0, '', 1, 1, '2018-03-28 19:28:42', '2019-01-01 11:57:11'),
(17, 'BGN', 'BGN,лв', 'Bulgarian Lev', '', '', 0, 1.9558, 0, 0, '', 1, 1, '2018-04-02 14:41:08', '2019-01-01 11:57:25'),
(18, 'GBP', 'GBP,£', 'British Pound', '', '', 0, 0.89453, 0, 0, '', 1, 1, '2018-04-17 16:56:43', '2019-01-01 11:57:38'),
(19, 'NOK', 'NOK,kr', 'Norwegian Kroner', '', '', 0, 9.9483, 0, 0, '', 1, 1, '2018-05-04 18:30:43', '2019-01-01 11:44:37'),
(22, 'USD', 'USD,$', 'US Dollar', '', '', 0, 1.1891, 0, 0, '', 1, 0, '2019-01-01 12:10:35', '2021-06-22 14:14:55');

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
  `memo` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_customer`
--

INSERT INTO `tms_customer` (`c_id`, `order_id`, `client`, `contact`, `indirect_customer`, `project_coordinator`, `project_manager`, `QA_specialist`, `memo`, `created_date`, `modified_date`) VALUES
(1, 2, 1, '1', 1, '3', '5', '4', '', '2018-12-12 17:01:08', '2022-04-12 16:39:12'),
(2, 28, 2, '2', 2, '3', '1', '4', '', '2019-01-08 12:29:25', '2021-06-09 08:59:14'),
(3, 29, 2, '2', 2, '3', '1', '4', '', '2021-02-24 17:53:43', '2021-06-23 18:50:13'),
(4, 34, 2, '2', 2, '3', '5', '4', '', '2021-03-03 11:37:59', '2021-03-03 11:52:43'),
(5, 35, 1, '1', 1, '3', '1', '4', '', '2021-03-03 11:56:53', '2021-06-22 11:29:35'),
(6, 36, 1, '1', 2, '3', '1', '4', '', '2021-03-03 12:49:57', '2021-07-19 21:08:52'),
(7, 37, 2, '2', 2, '3', '5', '4', '', '2021-03-03 12:55:56', '2021-07-16 18:14:36'),
(8, 38, 2, '2', 2, '3', '5', '4', '', '2021-03-03 13:01:04', '2021-06-22 14:45:20'),
(9, 40, 1, '1', 1, '3', '5', '4', '', '2021-03-03 13:08:56', '2021-10-11 14:34:06'),
(10, 41, 2, '2', 2, '3', '5', '4', '', '2021-03-03 14:36:18', '2021-03-03 14:39:47'),
(11, 42, 1, '1', 1, '3', '5', '4', '', '2021-04-15 23:17:03', '2021-04-15 23:17:03'),
(12, 44, 2, '2', 1, '3', '1', '4', '', '2021-05-10 12:40:30', '2021-05-10 12:42:12'),
(13, 46, 1, '1', 1, '3', '1', '4', '', '2021-06-02 19:19:06', '2021-06-23 17:26:16'),
(14, 49, 2, '2', 2, '3', '5', '4', '', '2021-06-04 16:06:14', '2021-06-04 16:06:14'),
(15, 51, 2, '2', 2, '3', '5', '4', '', '2021-06-04 17:38:17', '2021-06-04 17:38:17'),
(16, 54, 1, '1', 1, '3', '5', '4', '', '2021-06-21 17:16:40', '2021-09-20 19:19:53'),
(17, 55, 2, '2', 2, '3', '5', '4', '', '2021-06-22 11:44:22', '2021-06-22 14:29:14'),
(18, 56, 1, '1', 1, '3', '1', '4', '', '2021-06-29 14:03:54', '2021-06-29 14:03:54'),
(19, 57, 1, '1', 2, '3', '1', '4', '', '2021-06-29 15:48:23', '2021-07-02 19:28:29'),
(20, 58, 2, '2', 1, '3', '5', '4', '', '2021-07-05 10:39:27', '2021-07-05 10:39:27'),
(21, 59, 1, '1', 2, '3', '5', '4', '', '2021-07-06 09:47:53', '2021-08-09 10:32:02'),
(22, 60, 2, '2', 2, '3', '5', '4', '', '2021-07-06 12:36:38', '2021-08-09 16:48:32'),
(23, 61, 2, '2', 1, '3', '5', '4', '', '2021-07-06 12:55:55', '2021-09-20 19:18:00'),
(24, 62, 2, '2', 2, '3', '5', '4', '', '2021-07-06 18:20:52', '2021-07-06 20:32:06'),
(25, 63, 2, '2', 2, '3', '5', '4', '', '2021-07-12 21:26:58', '2021-09-20 19:19:04'),
(26, 64, 2, '2', 2, '3', '5', '4', '', '2021-07-13 20:41:23', '2021-07-13 20:41:23'),
(27, 65, 2, '2', 2, '3', '5', '4', '', '2021-07-14 10:28:28', '2021-07-14 10:28:28'),
(28, 66, 2, '2', 2, '3', '5', '4', '', '2021-07-15 12:21:04', '2021-07-19 19:52:25'),
(29, 67, 2, '2', 1, '3', '5', '4', '', '2021-07-15 13:09:33', '2021-07-15 13:09:33'),
(30, 68, 2, '2', 1, '3', '5', '4', '', '2021-07-19 09:29:14', '2021-07-19 09:29:14'),
(31, 69, 1, '1', 1, '3', '1', '4', '', '2021-07-22 13:55:12', '2021-07-22 13:55:12'),
(32, 70, 2, '2', 2, '3', '1', '4', '', '2021-07-22 16:57:27', '2021-07-22 16:57:27'),
(33, 71, 2, '2', 1, '3', '1', '4', '', '2021-07-22 17:05:16', '2021-07-22 17:05:16'),
(34, 72, 2, '2', 2, '3', '5', '4', '', '2021-07-22 18:09:44', '2021-07-22 18:09:44'),
(35, 73, 1, '1', 1, '3', '5', '4', '', '2021-07-27 11:13:30', '2021-07-29 17:27:18'),
(36, 74, 1, '1', 1, '3', '1', '4', '', '2021-07-29 16:29:32', '2021-09-21 11:35:13'),
(37, 75, 2, '2', 2, '3', '5', '4', '', '2021-07-29 18:48:34', '2021-07-29 18:48:34'),
(38, 76, 2, '2', 2, '3', '5', '4', '', '2021-07-29 19:00:17', '2021-07-29 19:00:17'),
(39, 77, 1, '1', 1, '3', '5', '4', '', '2021-07-29 19:36:48', '2021-07-29 19:36:48'),
(40, 79, 1, '1', 1, '3', '5', '4', '', '2021-07-30 09:30:49', '2021-07-30 09:30:49'),
(41, 80, 2, '2', 2, '3', '1', '4', '', '2021-07-30 11:09:07', '2021-07-30 11:09:07'),
(42, 81, 1, '1', 2, '3', '5', '4', '', '2021-07-30 11:27:40', '2021-07-30 11:27:40'),
(43, 82, 1, '1', 2, '3', '5', '4', '', '2021-07-30 12:33:52', '2021-07-30 12:33:52'),
(44, 83, 1, '1', 1, '3', '1', '4', '', '2021-07-30 12:38:56', '2021-07-30 12:38:56'),
(45, 84, 2, '2', 2, '3', '1', '4', '', '2021-07-30 12:56:27', '2021-07-30 12:56:27'),
(46, 86, 1, '1', 2, '3', '5', '4', '', '2021-07-30 13:39:37', '2021-08-02 19:00:57'),
(47, 87, 2, '2', 1, '3', '1', '4', '', '2021-08-09 10:39:16', '2021-08-09 10:39:16'),
(48, 88, 1, '1', 1, '3', '5', '4', '', '2021-08-09 10:47:27', '2021-09-15 11:12:28'),
(49, 100, 1, '1', 1, '3', '1', '4', '', '2021-08-27 10:30:33', '2021-08-27 10:30:33'),
(50, 102, 1, '1', 1, '3', '5', '4', '', '2021-09-02 17:33:31', '2021-09-15 10:14:55'),
(51, 103, 1, '1', 2, '3', '5', '4', '', '2021-09-06 11:16:59', '2021-09-06 12:14:48'),
(52, 107, 1, '1', 1, '3', '1', '4', '', '2021-09-08 13:43:22', '2021-09-13 10:28:03'),
(53, 111, 1, '1', 1, '3', '5', '4', '', '2021-09-13 09:41:17', '2021-09-13 09:41:17'),
(54, 113, 1, '1', 1, '3', '1', '4', '', '2021-09-15 10:46:11', '2021-09-15 10:46:11'),
(55, 114, 2, '2', 2, '3', '5', '4', '', '2021-09-16 16:34:38', '2021-09-17 20:11:57'),
(56, 115, 1, '1', 2, '3', '5', '4', '', '2021-09-17 10:24:31', '2021-09-20 18:46:23'),
(57, 117, 2, '2', 1, '3', '5', '4', '', '2021-09-17 16:27:19', '2021-09-20 10:36:13'),
(58, 119, 2, '2', 2, '3', '1', '4', '', '2021-09-20 10:43:13', '2021-09-20 18:04:03'),
(59, 120, 1, '1', 1, '3', '5', '4', '', '2021-09-20 10:49:42', '2021-09-20 18:32:34'),
(60, 123, 1, '1', 2, '3', '1', '4', '', '2021-09-20 18:28:31', '2021-09-20 18:28:31'),
(61, 124, 2, '2', 1, '3', '5', '4', '', '2021-09-20 18:48:32', '2021-09-20 18:49:58'),
(62, 125, 2, '2', 1, '3', '1', '4', '', '2021-09-20 18:51:50', '2021-11-18 11:44:05'),
(63, 126, 2, '2', 2, '3', '5', '4', '', '2021-09-20 19:00:26', '2021-09-20 19:00:26'),
(64, 127, 1, '1', 1, '3', '1', '4', '', '2021-09-20 19:15:24', '2021-09-20 19:16:47'),
(65, 128, 1, '1', 1, '3', '1', '4', '', '2021-09-21 11:11:51', '2021-09-21 11:11:51'),
(66, 130, 2, '2', 2, '3', '5', '4', '', '2021-09-23 18:13:04', '2021-10-07 14:18:35'),
(67, 131, 2, '2', 1, '3', '5', '4', '', '2021-09-24 10:26:56', '2021-09-24 10:26:56'),
(68, 135, 2, '2', 2, '3', '5', '4', '', '2021-10-01 11:33:46', '2021-10-01 11:33:46'),
(69, 136, 2, '2', 1, '3', '5', '4', '', '2021-10-07 15:19:39', '2021-10-07 15:19:39'),
(70, 137, 2, '2', 1, '3', '5', '4', '', '2021-10-07 18:18:10', '2021-10-07 18:18:10'),
(71, 138, 1, '1', 1, '1,3', '1', '4', '', '2021-10-08 10:33:09', '2021-10-08 10:33:09'),
(72, 139, 2, '2', 2, '1,3', '5', '4', '', '2021-10-11 18:22:43', '2021-10-11 18:22:43'),
(73, 140, 1, '1', 2, '1,3', '5', '4', '', '2021-10-14 10:58:05', '2021-10-14 10:58:05'),
(74, 141, 1, '1', 2, '3', '1', '4', '', '2021-10-14 15:20:14', '2021-10-14 15:20:14'),
(75, 142, 2, '2', 2, '3', '1', '4', '', '2021-10-18 14:36:59', '2021-10-18 14:36:59'),
(76, 143, 2, '2', 1, '3', '5', '4', '', '2021-10-19 14:59:57', '2021-10-19 14:59:57'),
(77, 144, 2, '2', 1, '1,3', '5', '4', '', '2021-10-19 15:41:00', '2021-10-19 15:41:00'),
(78, 145, 1, '1', 1, '3', '1', '4', '', '2021-10-19 16:58:49', '2021-11-17 16:06:06'),
(79, 146, 1, '1', 1, '3', '1', '4', '', '2021-10-19 18:34:35', '2021-10-19 18:34:35'),
(80, 147, 1, '1', 1, '3', '1', '4', '', '2021-10-20 10:46:22', '2021-11-18 11:02:36'),
(81, 148, 1, '1', 2, '3', '5', '4', '', '2021-11-10 11:28:34', '2021-11-10 11:28:34'),
(82, 149, 1, '1', 2, '3', '1', '4', '', '2021-11-17 15:26:05', '2021-11-17 15:33:20'),
(83, 151, 1, '1', 1, '3', '1', '4', '', '2021-11-17 17:27:08', '2021-11-17 18:21:09'),
(84, 152, 1, '1', 1, '1,3', '1', '4', '', '2021-11-17 18:43:22', '2021-11-17 18:45:46'),
(85, 155, 1, '1', 1, '3', '1', '4', '', '2021-11-18 14:36:07', '2021-11-18 14:36:07'),
(86, 157, 1, '1', 1, '11', '1', '4', '', '2021-12-08 18:59:20', '2021-12-15 16:33:37'),
(87, 160, 1, '1', 1, '1,3', '5', '4', '', '2021-12-14 18:40:39', '2021-12-15 12:00:27'),
(88, 161, 1, '1', 1, '3', '1', '4', '', '2021-12-15 12:08:06', '2021-12-15 13:11:54'),
(89, 163, 1, '1', 1, '3', '1', '4', '', '2021-12-15 15:59:26', '2021-12-15 15:59:26'),
(90, 165, 1, '1', 1, '3', '1', '4', '', '2022-01-10 16:58:16', '2022-01-10 17:24:21'),
(91, 166, 1, '1', 1, '3', '5', '4', '', '2022-02-11 15:54:05', '2022-02-11 15:54:05'),
(92, 167, 1, '1', 1, '3', '1', '4', '', '2022-03-21 18:05:35', '2022-03-21 18:05:35'),
(93, 168, 1, '1', 1, '3', '1', '4', '', '2022-03-28 12:33:41', '2022-03-28 12:33:41');

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

--
-- Dumping data for table `tms_customer_group`
--

INSERT INTO `tms_customer_group` (`group_id`, `group_name`, `is_active`, `created_date`, `updated_date`) VALUES
(1, 'group', 1, '2016-01-30 11:03:37', '2017-01-18 15:45:08'),
(3, 'group1', 1, '2016-01-30 12:34:21', '2017-01-18 15:45:19'),
(4, 'group2', 1, '2016-01-30 12:34:26', '2016-01-30 12:34:26'),
(5, 'group4', 1, '2016-02-02 17:31:39', '2017-02-03 17:06:02'),
(8, 'Testing', 1, '2017-03-24 16:30:50', '2018-02-12 14:48:55');

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
(1, 2, 2, 'T Admin | ENG>DAN | Technical', 'EUR,€', '', '', '500', '17', '[{\"languagePrice\":\"English > Albanian\"},{\"languagePrice\":\"English (UK) > Portuguese (Portugal)\"},{\"languagePrice\":\"English (US) > Norwegian (bokmal)\"},{\"languagePrice\":\"English (US) > Hindi\"},{\"languagePrice\":\"Danish > English (UK)\"},{\"languagePrice\":\"Danish > Estonian\"},{\"languagePrice\":\"English (UK) > Danish\"},{\"languagePrice\":\"English (US) > Danish\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation (New)\",\"basePrice\":\"1.00\",\"standardTime\":\"\",\"childPriceId\":\"1\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Editing\",\"basePrice\":\"0.60\",\"standardTime\":\"\",\"childPriceId\":\"25\",\"masterPriceId\":\"3\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 100% Match\",\"basePrice\":\"0.80\",\"standardTime\":\"\",\"childPriceId\":\"6\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 95-99% Match\",\"basePrice\":\"0.12\",\"standardTime\":\"\",\"childPriceId\":\"5\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Translation 50-74% Match\",\"basePrice\":\"0.60\",\"standardTime\":\"\",\"childPriceId\":\"2\",\"masterPriceId\":\"1\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Proofreading 50-74% Match\",\"basePrice\":\"0.60\",\"standardTime\":\"\",\"childPriceId\":\"15\",\"masterPriceId\":\"2\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words Proofreading 95-99% Match\",\"basePrice\":\"3.00\",\"standardTime\":\"\",\"childPriceId\":\"18\",\"masterPriceId\":\"2\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words TEP 95-99% Match\",\"basePrice\":\"1.00\",\"standardTime\":\"\",\"childPriceId\":\"51\",\"masterPriceId\":\"9\"}]', '', '2021-12-22 14:12:18', '2021-12-22 14:12:18'),
(2, 1, 1, 'Kanhasoft | ENG>DUT | General-Agricalture', 'CAD,$', '', '', '500', '2', '[{\"languagePrice\":\"English (UK) > Dutch (Belgium)\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Page(s) DTP\",\"basePrice\":\"300.00\",\"standardTime\":\"\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Words subtitling with timecoding\",\"basePrice\":\"0.07\",\"standardTime\":\"\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"21-30 QA errors\",\"basePrice\":\"1.00\",\"standardTime\":\"\"}]', '', '2021-10-26 12:39:17', '2021-10-26 12:39:17'),
(3, 1, 2, 'Infosys | HIN>ENG | General-Beauty-Fashion-Make-up', 'BGN,лв', '', '', '45', '4', '[{\"languagePrice\":\"English (UK) > Hungarian\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Page(s) DTP\",\"basePrice\":\"300\",\"standardTime\":\"\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Available price unit\",\"basePrice\":\"2\",\"standardTime\":\"\"}]', '', '2021-10-12 14:48:57', '2021-10-12 14:48:57'),
(4, 2, 10, 'Diyal Info | ENG>NOR | Technical', 'EUR,€', '', '', '10', '17', '[{\"languagePrice\":\"English (US) > Norwegian (bokmal)\"},{\"languagePrice\":\"Estonian > Danish\"},{\"languagePrice\":\"English (US) > Portuguese (Brazil)\"}]', '[{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Translation - 100%\",\"basePrice\":\"2.00\",\"standardTime\":\"\",\"childPriceId\":\"57\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Translation - 95%-99%\",\"basePrice\":\"4.00\",\"standardTime\":\"\",\"childPriceId\":\"58\"},{\"baseQuentity\":\"1\",\"basePricecheck\":1,\"basePriceUnit\":\"Translation - 85%-94%\",\"basePrice\":\"3.00\",\"standardTime\":\"\",\"childPriceId\":\"59\"}]', '', '2021-11-18 11:09:25', '2021-11-18 11:09:25');

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
(16, 'DD/MM/YYYY', '.', 1, 1, 1, '2021-04-22 12:08:33', '2018-07-19 13:29:58');

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
  `dtCreatedDate` datetime NOT NULL,
  `dtUpdatedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_directclientlogin`
--

INSERT INTO `tms_directclientlogin` (`iClientId`, `iUserId`, `vEmail`, `vPassword`, `v_pass`, `vWebsite`, `dtCreatedDate`, `dtUpdatedDate`) VALUES
(1, 1, 'nirav patel', '123', '202cb962ac59075b964b07152d234b70', 'https://data.brreg.no/enhetsregisteret/enhet/', '2018-12-12 17:00:14', '2018-12-12 17:00:14'),
(2, 2, 'uname1', '123456', 'e10adc3949ba59abbe56e057f20f883e', 'https://data.brreg.no/enhetsregisteret/enhet/', '2019-01-08 12:19:50', '2019-01-08 12:19:50');

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
(1, 34, 1, 0, 0, 'GGGGG', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-15T07:20:40.763Z', '2021-03-15T07:20:40.763Z'),
(2, 2, 1, 0, 0, 'test', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,11,2,2,', 0, '2021-03-15T07:21:53.849Z', '2021-03-15T07:21:53.849Z'),
(3, 2, 1, 0, 0, 'test ', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,11,2,2,', 0, '2021-03-15T14:45:34.625Z', '2021-03-15T14:45:34.625Z'),
(4, 29, 1, 0, 0, '@Rajesh Mudaliar  please check documents', '', '', '', 'TMS Admin', '4', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-17T14:52:16.602Z', '2021-03-17T14:52:16.602Z'),
(5, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/personalize_service_1615992766325.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-17T14:52:46.324Z', '2021-03-17T14:52:46.324Z'),
(6, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/640px-GOLD_METALLIC_TEXTURE_(7241678418)_1615992830153.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-17T14:53:50.152Z', '2021-03-17T14:53:50.152Z'),
(7, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/AnyDesk_1615992923512.x-msdownload', 'application/x-msdownload', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-17T14:55:23.511Z', '2021-03-17T14:55:23.511Z'),
(8, 34, 1, 0, 0, 'Please check document', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-19T14:51:07.389Z', '2021-03-19T14:51:07.389Z'),
(9, 34, 1, 0, NULL, '', '', 'uploads/discussionfile/art_1616165494685.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-19T14:51:34.685Z', '2021-03-19T14:51:34.685Z'),
(10, 34, 3, 0, 0, 'I have check the documments.\nand i am working on it. \nPlease check @TMS Admin', '', '', '', 'Vijay Gohil', '1', '', 'uploads/profilePic/1544614850.png', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-19T14:54:06.241Z', '2021-03-19T14:54:06.241Z'),
(11, 34, 3, 0, NULL, '', '', 'uploads/discussionfile/mask_1616165717485.jpeg', 'image/jpeg', 'Vijay Gohil', '', '', 'uploads/profilePic/1544614850.png', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-19T14:55:17.484Z', '2021-03-19T14:55:17.484Z'),
(12, 34, 3, 0, NULL, '', '', 'uploads/discussionfile/download (2)_1616165730768.jpeg', 'image/jpeg', 'Vijay Gohil', '', '', 'uploads/profilePic/1544614850.png', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-19T14:55:30.768Z', '2021-03-19T14:55:30.768Z'),
(13, 2, 1, 0, 0, 'test 1', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,11,2,2,', 0, '2021-03-19T14:59:13.515Z', '2021-03-19T14:59:13.515Z'),
(14, 2, 1, 0, 0, 'adf', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,11,2,2,', 0, '2021-03-19T15:00:32.862Z', '2021-03-19T15:00:32.862Z'),
(15, 2, 1, 0, 0, 'adfad', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,11,2,2,', 0, '2021-03-19T15:00:49.263Z', '2021-03-19T15:00:49.263Z'),
(16, 2, 1, 0, 0, 'adfadfasd', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,11,2,2,', 0, '2021-03-19T15:00:55.924Z', '2021-03-19T15:00:55.924Z'),
(17, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/art_1616389601230.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-22T05:06:41.229Z', '2021-03-22T05:06:41.229Z'),
(18, 29, 1, 0, 0, 'yes i have check the documents and send the changes', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-22T05:14:39.261Z', '2021-03-22T05:14:39.261Z'),
(19, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/download (2)_1616390119740.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-22T05:15:19.739Z', '2021-03-22T05:15:19.739Z'),
(20, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/painting-15_1616390866053.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-22T05:27:46.052Z', '2021-03-22T05:27:46.052Z'),
(21, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/eye - Copy eye2 eye_1616390941980.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-22T05:29:01.979Z', '2021-03-22T05:29:01.979Z'),
(22, 29, 1, 0, 0, 'hi', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-22T10:03:06.406Z', '2021-03-22T10:03:06.406Z'),
(23, 29, 1, 0, 0, 'need some changes', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-22T10:03:32.674Z', '2021-03-22T10:03:32.674Z'),
(24, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/eye_-_(2)_Copy_eye2_eye_1616407431914.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-22T10:03:51.913Z', '2021-03-22T10:03:51.913Z'),
(25, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/download_(2)_1616407697030.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-22T10:08:17.030Z', '2021-03-22T10:08:17.030Z'),
(26, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/eye_1616407749662.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-22T10:09:09.661Z', '2021-03-22T10:09:09.661Z'),
(27, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/tatoo_three_(1)_1616407841723.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-22T10:10:41.723Z', '2021-03-22T10:10:41.723Z'),
(28, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/Moeraki-Boulders-New-Zealand-960x640_1616408162647.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-22T10:16:02.645Z', '2021-03-22T10:16:02.645Z'),
(29, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/tiger_forest_(3)_1616408175136.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-22T10:16:15.135Z', '2021-03-22T10:16:15.135Z'),
(30, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/Moeraki-Boulders-New-Zealand-960x640_1616408228657.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-22T10:17:08.657Z', '2021-03-22T10:17:08.657Z'),
(31, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/tiger_forest_(3)_1616408740527.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-22T10:25:40.526Z', '2021-03-22T10:25:40.526Z'),
(32, 29, 1, 0, 0, 'hello', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-22T11:32:02.046Z', '2021-03-22T11:32:02.046Z'),
(33, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/eye_-_(2)_Copy_eye2_eye_1616412759999.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-22T11:32:39.998Z', '2021-03-22T11:32:39.998Z'),
(34, 34, 1, 0, NULL, '', '', 'uploads/discussionfile/tiger_forest_(3)_1616482511672.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-23T06:55:11.671Z', '2021-03-23T06:55:11.671Z'),
(35, 34, 1, 0, NULL, '', '', 'uploads/discussionfile/Moeraki-Boulders-New-Zealand-960x640_1616483025035.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-23T07:03:45.034Z', '2021-03-23T07:03:45.034Z'),
(36, 34, 1, 0, NULL, '', '', 'uploads/discussionfile/art_1616483037597.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-23T07:03:57.597Z', '2021-03-23T07:03:57.597Z'),
(37, 34, 1, 0, NULL, '', '', 'uploads/discussionfile/myfile_1616483502688.undefined', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-23T07:11:42.686Z', '2021-03-23T07:11:42.686Z'),
(38, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/tiger_forest_(3)_1616483670272.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-23T07:14:30.271Z', '2021-03-23T07:14:30.271Z'),
(39, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/newzlnd_1616483697057.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-23T07:14:57.056Z', '2021-03-23T07:14:57.056Z'),
(40, 34, 1, 0, NULL, '', '', 'uploads/discussionfile/newzlnd_1616485669051.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-23T07:47:49.051Z', '2021-03-23T07:47:49.051Z'),
(41, 34, 1, 0, NULL, '', '', 'uploads/discussionfile/tiger_forest_(3)_1616485885697.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-23T07:51:25.696Z', '2021-03-23T07:51:25.696Z'),
(42, 34, 1, 0, NULL, '', '', 'uploads/discussionfile/tiger_forest_1616486019323.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-23T07:53:39.319Z', '2021-03-23T07:53:39.319Z'),
(43, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/tms_-_changes_-19-3-21_-_Copy_1616489905573.plain', 'text/plain', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-23T08:58:25.572Z', '2021-03-23T08:58:25.572Z'),
(44, 29, 1, 0, 0, 'test', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-24T14:04:57.015Z', '2021-03-24T14:04:57.015Z'),
(45, 29, 1, 0, 0, 'te2', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-24T14:06:06.902Z', '2021-03-24T14:06:06.902Z'),
(46, 29, 1, 0, 0, 'please check msg', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-24T14:57:58.137Z', '2021-03-24T14:57:58.137Z'),
(47, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/user-icon_1616597890841.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-24T14:58:10.840Z', '2021-03-24T14:58:10.840Z'),
(48, 37, 1, 0, NULL, '', '', 'uploads/discussionfile/Moeraki-Boulders-New-Zealand-960x640_1616647177495.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-25T04:39:37.495Z', '2021-03-25T04:39:37.495Z'),
(49, 37, 1, 0, NULL, '', '', 'uploads/discussionfile/newzlnd_1616647191587.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-25T04:39:51.584Z', '2021-03-25T04:39:51.584Z'),
(50, 37, 1, 0, NULL, '', '', 'uploads/discussionfile/tiger_forest_(3)_1616647203543.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-25T04:40:03.543Z', '2021-03-25T04:40:03.543Z'),
(51, 37, 1, 0, NULL, '', '', 'uploads/discussionfile/d__art_(1)_1616647224277.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-25T04:40:24.277Z', '2021-03-25T04:40:24.277Z'),
(52, 37, 1, 0, NULL, '', '', 'uploads/discussionfile/eye_-_(2)_Copy_eye2_eye_1616647239154.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-25T04:40:39.154Z', '2021-03-25T04:40:39.154Z'),
(53, 37, 1, 0, NULL, '', '', 'uploads/discussionfile/newzlnd_1616647335556.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-25T04:42:15.556Z', '2021-03-25T04:42:15.556Z'),
(54, 37, 1, 0, 0, 'hello', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-25T05:00:00.018Z', '2021-03-25T05:00:00.018Z'),
(55, 37, 1, 0, NULL, '', '', 'uploads/discussionfile/eye_-_(2)_Copy_eye2_eye_1616648414650.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-25T05:00:14.649Z', '2021-03-25T05:00:14.649Z'),
(56, 37, 1, 0, NULL, '', '', 'uploads/discussionfile/d__art_(1)_1616648891677.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-25T05:08:11.677Z', '2021-03-25T05:08:11.677Z'),
(57, 37, 1, 0, NULL, '', '', 'uploads/discussionfile/eye_-_(2)_Copy_eye2_eye_1616649071481.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-25T05:11:11.480Z', '2021-03-25T05:11:11.480Z'),
(58, 37, 1, 0, NULL, '', '', 'uploads/discussionfile/mask_-_Copy_(2)_1616649140156.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-25T05:12:20.156Z', '2021-03-25T05:12:20.156Z'),
(59, 37, 1, 0, NULL, '', '', 'uploads/discussionfile/d__art_(1)_1616649262983.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-25T05:14:22.982Z', '2021-03-25T05:14:22.982Z'),
(60, 2, 1, 0, NULL, '', '', 'uploads/discussionfile/windowkey_1616651593010.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,11,2,2,', 0, '2021-03-25T05:53:13.010Z', '2021-03-25T05:53:13.010Z'),
(61, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/d__art_(1)_1616651816917.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-25T05:56:56.916Z', '2021-03-25T05:56:56.916Z'),
(62, 37, 1, 0, NULL, '', '', 'uploads/discussionfile/abc_pepsi_pepsi2_1616661921783.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-25T08:45:21.782Z', '2021-03-25T08:45:21.782Z'),
(63, 37, 1, 0, NULL, '', '', 'uploads/discussionfile/art_1616663928429.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-25T09:18:48.429Z', '2021-03-25T09:18:48.429Z'),
(64, 37, 1, 0, NULL, '', '', 'uploads/discussionfile/eye_1616663992491.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-25T09:19:52.491Z', '2021-03-25T09:19:52.491Z'),
(65, 37, 1, 0, NULL, '', '', 'uploads/discussionfile/tiger_forest_1616664580697.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-25T09:29:40.697Z', '2021-03-25T09:29:40.697Z'),
(66, 37, 1, 0, NULL, '', '', 'uploads/discussionfile/newzlnd_1616664659801.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-25T09:30:59.800Z', '2021-03-25T09:30:59.800Z'),
(67, 37, 1, 0, NULL, '', '', 'uploads/discussionfile/art_1616666980107.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-25T10:09:40.106Z', '2021-03-25T10:09:40.106Z'),
(68, 37, 1, 0, NULL, '', '', 'uploads/discussionfile/tiger_forest_1616666997837.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-25T10:09:57.836Z', '2021-03-25T10:09:57.836Z'),
(69, 37, 1, 0, NULL, '', '', 'uploads/discussionfile/eye_-_(2)_Copy_eye2_eye_1616667268497.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-25T10:14:28.496Z', '2021-03-25T10:14:28.496Z'),
(70, 37, 1, 0, NULL, '', '', 'uploads/discussionfile/newzlnd_1616670187703.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-25T11:03:07.702Z', '2021-03-25T11:03:07.702Z'),
(71, 37, 1, 0, NULL, '', '', 'uploads/discussionfile/art_1616670232603.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-25T11:03:52.603Z', '2021-03-25T11:03:52.603Z'),
(72, 37, 1, 0, NULL, '', '', 'uploads/discussionfile/globalsport-clr_1616670267429.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-25T11:04:27.429Z', '2021-03-25T11:04:27.429Z'),
(73, 37, 1, 0, NULL, '', '', 'uploads/discussionfile/investae-platform-1_1616670283842.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-25T11:04:43.841Z', '2021-03-25T11:04:43.841Z'),
(74, 37, 1, 0, NULL, '', '', 'uploads/discussionfile/cross_sell_1616670354227.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-25T11:05:54.226Z', '2021-03-25T11:05:54.226Z'),
(75, 37, 1, 0, NULL, '', '', 'uploads/discussionfile/d__art_(1)_1616672575341.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-25T11:42:55.340Z', '2021-03-25T11:42:55.340Z'),
(76, 37, 1, 0, NULL, '', '', 'uploads/discussionfile/Group_238_(1)_1616673169740.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-25T11:52:49.739Z', '2021-03-25T11:52:49.739Z'),
(77, 37, 1, 0, NULL, '', '', 'uploads/discussionfile/Moeraki-Boulders-New-Zealand-960x640_1616673261420.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-25T11:54:21.419Z', '2021-03-25T11:54:21.419Z'),
(78, 37, 1, 0, NULL, '', '', 'uploads/discussionfile/d__art_(1)_1616674985890.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-25T12:23:05.890Z', '2021-03-25T12:23:05.890Z'),
(79, 37, 1, 0, NULL, '', '', 'uploads/discussionfile/download_(2)_1616675158237.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-25T12:25:58.236Z', '2021-03-25T12:25:58.236Z'),
(80, 37, 1, 0, NULL, '', '', 'uploads/discussionfile/eye_1616675180036.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-25T12:26:20.036Z', '2021-03-25T12:26:20.036Z'),
(81, 37, 1, 0, NULL, '', '', 'uploads/discussionfile/book-3998252__340_1616675538601.webp', 'image/webp', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-25T12:32:18.601Z', '2021-03-25T12:32:18.601Z'),
(82, 37, 1, 0, NULL, '', '', 'uploads/discussionfile/filw_1616675552354.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-25T12:32:32.353Z', '2021-03-25T12:32:32.353Z'),
(83, 37, 1, 0, NULL, '', '', 'uploads/discussionfile/983794168_1616675558787.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-25T12:32:38.786Z', '2021-03-25T12:32:38.786Z'),
(84, 37, 1, 0, NULL, '', '', 'uploads/discussionfile/art_1616684659234.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-25T15:04:19.233Z', '2021-03-25T15:04:19.233Z'),
(85, 37, 1, 0, NULL, '', '', 'uploads/discussionfile/filw_1616733926291.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-26T04:45:26.288Z', '2021-03-26T04:45:26.288Z'),
(86, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/983794168_1616766986646.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-26T13:56:26.645Z', '2021-03-26T13:56:26.645Z'),
(87, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/filw_1616767129749.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-26T13:58:49.749Z', '2021-03-26T13:58:49.749Z'),
(88, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/book-3998252__340_1616767209089.webp', 'image/webp', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-26T14:00:09.088Z', '2021-03-26T14:00:09.088Z'),
(89, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/art_1616767738643.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-26T14:08:58.642Z', '2021-03-26T14:08:58.642Z'),
(90, 37, 1, 0, NULL, '', '', 'uploads/discussionfile/art_1616768566552.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-26T14:22:46.552Z', '2021-03-26T14:22:46.552Z'),
(91, 2, 1, 0, 0, 'this is test msg @Vijay Gohil', '', '', '', 'TMS Admin', '3', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,11,2,2,', 0, '2021-03-26T14:24:47.480Z', '2021-03-26T14:24:47.480Z'),
(92, 2, 1, 0, NULL, '', '', 'uploads/discussionfile/TITANIUM_HULL_01_1616768724614.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,11,2,2,', 0, '2021-03-26T14:25:24.613Z', '2021-03-26T14:25:24.613Z'),
(93, 40, 1, 0, NULL, '', '', 'uploads/discussionfile/book-3998252__340_1616769094414.webp', 'image/webp', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-26T14:31:34.414Z', '2021-03-26T14:31:34.414Z'),
(94, 40, 1, 0, NULL, '', '', 'uploads/discussionfile/filw_1616769183792.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-26T14:33:03.790Z', '2021-03-26T14:33:03.790Z'),
(95, 2, 1, 0, NULL, '', '', 'uploads/discussionfile/983794168_1616772471665.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,11,2,2,', 0, '2021-03-26T15:27:51.663Z', '2021-03-26T15:27:51.663Z'),
(96, 40, 1, 0, NULL, '', '', 'uploads/discussionfile/983794168_1616930959712.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-28T11:29:19.711Z', '2021-03-28T11:29:19.711Z'),
(97, 40, 1, 0, NULL, '', '', 'uploads/discussionfile/img5_1616934112213.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-28T12:21:52.213Z', '2021-03-28T12:21:52.213Z'),
(98, 40, 1, 0, NULL, '', '', 'uploads/discussionfile/img2_1616934138958.webp', 'image/webp', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-28T12:22:18.957Z', '2021-03-28T12:22:18.957Z'),
(99, 40, 1, 0, NULL, '', '', 'uploads/discussionfile/img4_1616938590112.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-28T13:36:30.111Z', '2021-03-28T13:36:30.111Z'),
(100, 40, 1, 0, NULL, '', '', 'uploads/discussionfile/img3_1616938614559.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-28T13:36:54.559Z', '2021-03-28T13:36:54.559Z'),
(101, 40, 1, 0, NULL, '', '', 'uploads/discussionfile/983794168_1616939084240.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-28T13:44:44.240Z', '2021-03-28T13:44:44.240Z'),
(102, 40, 1, 0, NULL, '', '', 'uploads/discussionfile/book-3998252__340_1616941524052.webp', 'image/webp', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-28T14:25:24.051Z', '2021-03-28T14:25:24.051Z'),
(103, 40, 1, 0, NULL, '', '', 'uploads/discussionfile/img3_1616941545402.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-28T14:25:45.402Z', '2021-03-28T14:25:45.402Z'),
(104, 40, 1, 0, NULL, '', '', 'uploads/discussionfile/img1_1616941557007.webp', 'image/webp', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-28T14:25:57.006Z', '2021-03-28T14:25:57.006Z'),
(105, 40, 1, 0, NULL, '', '', 'uploads/discussionfile/img5_1616941574980.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-28T14:26:14.979Z', '2021-03-28T14:26:14.979Z'),
(106, 40, 1, 0, NULL, '', '', 'uploads/discussionfile/img1_1616941597647.webp', 'image/webp', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-28T14:26:37.647Z', '2021-03-28T14:26:37.647Z'),
(107, 36, 1, 0, NULL, '', '', 'uploads/discussionfile/img4_1616942093484.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-28T14:34:53.483Z', '2021-03-28T14:34:53.483Z'),
(108, 36, 1, 0, NULL, '', '', 'uploads/discussionfile/img2_1616942105819.webp', 'image/webp', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-28T14:35:05.817Z', '2021-03-28T14:35:05.817Z'),
(109, 36, 1, 0, NULL, '', '', 'uploads/discussionfile/983794168_1616942138010.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-28T14:35:38.009Z', '2021-03-28T14:35:38.009Z'),
(110, 36, 1, 0, NULL, '', '', 'uploads/discussionfile/art_1616942209172.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-03-28T14:36:49.172Z', '2021-03-28T14:36:49.172Z'),
(111, 40, 1, 0, NULL, '', '', 'uploads/discussionfile/img2_1616998007197.webp', 'image/webp', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-29T06:06:47.196Z', '2021-03-29T06:06:47.196Z'),
(112, 40, 1, 0, NULL, '', '', 'uploads/discussionfile/img2_1616998526762.webp', 'image/webp', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-29T06:15:26.761Z', '2021-03-29T06:15:26.761Z'),
(113, 40, 1, 0, NULL, '', '', 'uploads/discussionfile/art_1616998552003.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-29T06:15:52.003Z', '2021-03-29T06:15:52.003Z'),
(114, 40, 1, 0, NULL, '', '', 'uploads/discussionfile/d__art_(1)_1616998588960.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-29T06:16:28.959Z', '2021-03-29T06:16:28.959Z'),
(115, 40, 1, 0, NULL, '', '', 'uploads/discussionfile/art_1617081424265.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-30T05:17:04.264Z', '2021-03-30T05:17:04.264Z'),
(116, 2, 1, 0, NULL, '', '', 'uploads/discussionfile/art_1617085710860.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,11,2,2,', 0, '2021-03-30T06:28:30.858Z', '2021-03-30T06:28:30.858Z'),
(117, 40, 1, 0, NULL, '', '', 'uploads/discussionfile/img3_1617086480924.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-30T06:41:20.923Z', '2021-03-30T06:41:20.923Z'),
(118, 40, 1, 0, NULL, '', '', 'uploads/discussionfile/eye_-_(2)_Copy_eye2_eye_1617086509938.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-30T06:41:49.937Z', '2021-03-30T06:41:49.937Z'),
(119, 40, 1, 0, NULL, '', '', 'uploads/discussionfile/d__art_(1)_1617086588014.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-30T06:43:08.013Z', '2021-03-30T06:43:08.013Z'),
(120, 40, 1, 0, NULL, '', '', 'uploads/discussionfile/art_1617086718561.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-30T06:45:18.560Z', '2021-03-30T06:45:18.560Z'),
(121, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/img1_1617090042012.webp', 'image/webp', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-30T07:40:42.011Z', '2021-03-30T07:40:42.011Z'),
(122, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/d__art_(1)_1617090065757.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-30T07:41:05.755Z', '2021-03-30T07:41:05.755Z'),
(123, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/img3_1617090344427.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-30T07:45:44.425Z', '2021-03-30T07:45:44.425Z'),
(124, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/img4_1617090374041.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-30T07:46:14.041Z', '2021-03-30T07:46:14.041Z'),
(125, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/img3_1617090397585.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-30T07:46:37.584Z', '2021-03-30T07:46:37.584Z'),
(126, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/book-3998252__340_1617090423294.webp', 'image/webp', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-30T07:47:03.291Z', '2021-03-30T07:47:03.291Z'),
(127, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/983794168_1617090460649.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-30T07:47:40.648Z', '2021-03-30T07:47:40.648Z'),
(128, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/eye_-_(2)_Copy_eye2_eye_1617090496145.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-30T07:48:16.144Z', '2021-03-30T07:48:16.144Z'),
(129, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/art_1617090516556.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-30T07:48:36.556Z', '2021-03-30T07:48:36.556Z'),
(130, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/imgpnn_1617090710779.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-30T07:51:50.779Z', '2021-03-30T07:51:50.779Z'),
(131, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/sea-wave-photo-transparent-png-stickpng-0_1617090724594.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-30T07:52:04.593Z', '2021-03-30T07:52:04.593Z'),
(132, 29, 1, 0, NULL, '', '', 'uploads/discussionfile/images_1617090807306.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-30T07:53:27.305Z', '2021-03-30T07:53:27.305Z'),
(133, 2, 1, 0, NULL, '', '', 'uploads/discussionfile/d__art_(1)_1617092384900.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,11,2,2,', 0, '2021-03-30T08:19:44.899Z', '2021-03-30T08:19:44.899Z'),
(134, 28, 1, 0, NULL, '', '', 'uploads/discussionfile/imgpnn_1617093986927.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T08:46:26.927Z', '2021-03-30T08:46:26.927Z'),
(135, 28, 1, 0, NULL, '', '', 'uploads/discussionfile/art_1617094006606.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T08:46:46.605Z', '2021-03-30T08:46:46.605Z'),
(136, 28, 1, 0, NULL, '', '', 'uploads/discussionfile/sea-wave-photo-transparent-png-stickpng-0_1617094052858.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T08:47:32.857Z', '2021-03-30T08:47:32.857Z'),
(137, 28, 1, 0, NULL, '', '', 'uploads/discussionfile/art_1617094155694.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T08:49:15.693Z', '2021-03-30T08:49:15.693Z'),
(138, 28, 1, 0, NULL, '', '', 'uploads/discussionfile/d__art_(1)_1617094177779.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T08:49:37.779Z', '2021-03-30T08:49:37.779Z'),
(139, 28, 1, 0, NULL, '', '', 'uploads/discussionfile/sea-wave-photo-transparent-png-stickpng-0_1617094227766.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T08:50:27.766Z', '2021-03-30T08:50:27.766Z'),
(140, 28, 1, 0, NULL, '', '', 'uploads/discussionfile/imgpnn_1617094423641.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T08:53:43.640Z', '2021-03-30T08:53:43.640Z'),
(141, 28, 1, 0, NULL, '', '', 'uploads/discussionfile/art_1617094480503.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T08:54:40.502Z', '2021-03-30T08:54:40.502Z'),
(142, 28, 1, 0, NULL, '', '', 'uploads/discussionfile/imgpnn_1617094580538.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T08:56:20.537Z', '2021-03-30T08:56:20.537Z'),
(143, 28, 1, 0, NULL, '', '', 'uploads/discussionfile/art_1617094647181.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T08:57:27.180Z', '2021-03-30T08:57:27.180Z'),
(144, 28, 1, 0, NULL, '', '', 'uploads/discussionfile/images_1617094767532.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T08:59:27.531Z', '2021-03-30T08:59:27.531Z'),
(145, 28, 1, 0, NULL, '', '', 'uploads/discussionfile/art_1617096173648.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T09:22:53.646Z', '2021-03-30T09:22:53.646Z'),
(146, 28, 1, 0, NULL, '', '', 'uploads/discussionfile/images_1617096280388.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T09:24:40.386Z', '2021-03-30T09:24:40.386Z'),
(147, 28, 1, 0, NULL, '', '', 'uploads/discussionfile/imgpnn_1617096302193.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T09:25:02.193Z', '2021-03-30T09:25:02.193Z'),
(148, 28, 1, 0, NULL, '', '', 'uploads/discussionfile/msg-1-fc-40_1617096792952.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T09:33:12.951Z', '2021-03-30T09:33:12.951Z'),
(149, 28, 1, 0, NULL, '', '', 'uploads/discussionfile/sea-wave-photo-transparent-png-stickpng-0_1617097578195.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T09:46:18.194Z', '2021-03-30T09:46:18.194Z'),
(150, 28, 1, 0, NULL, '', '', 'uploads/discussionfile/art_1617097612822.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T09:46:52.821Z', '2021-03-30T09:46:52.821Z'),
(151, 28, 1, 0, NULL, '', '', 'uploads/discussionfile/msg-1-fc-40_1617097630735.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T09:47:10.735Z', '2021-03-30T09:47:10.735Z'),
(152, 28, 1, 0, NULL, '', '', 'uploads/discussionfile/ban-sairee_small_barn-external-500kb_1617097856319.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T09:50:56.318Z', '2021-03-30T09:50:56.318Z'),
(153, 28, 1, 0, NULL, '', '', 'uploads/discussionfile/sea-wave-photo-transparent-png-stickpng-0_1617101596894.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T10:53:16.893Z', '2021-03-30T10:53:16.893Z'),
(154, 28, 1, 0, NULL, '', '', 'uploads/discussionfile/sea-wave-photo-transparent-png-stickpng-0_1617103936731.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T11:32:16.730Z', '2021-03-30T11:32:16.730Z'),
(155, 28, 1, 0, NULL, '', '', 'uploads/discussionfile/art_1617104065953.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T11:34:25.953Z', '2021-03-30T11:34:25.953Z'),
(156, 28, 1, 0, NULL, '', '', 'uploads/discussionfile/sea-wave-photo-transparent-png-stickpng-0_1617104079093.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T11:34:39.093Z', '2021-03-30T11:34:39.093Z'),
(157, 28, 1, 0, NULL, '', '', 'uploads/discussionfile/ban-sairee_small-barn-500kb_1617104669718.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T11:44:29.717Z', '2021-03-30T11:44:29.717Z'),
(158, 28, 1, 0, NULL, '', '', 'uploads/discussionfile/imgpnn_1617104749744.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T11:45:49.744Z', '2021-03-30T11:45:49.744Z'),
(159, 28, 1, 0, NULL, '', '', 'uploads/discussionfile/ban-sairee_small-barn-500kb_1617107911903.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T12:38:31.902Z', '2021-03-30T12:38:31.902Z'),
(160, 28, 1, 0, NULL, '', '', 'uploads/discussionfile/sea-wave-photo-transparent-png-stickpng-0_1617107933492.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T12:38:53.491Z', '2021-03-30T12:38:53.491Z'),
(161, 28, 1, 0, NULL, '', '', 'uploads/discussionfile/imgpnn_1617108031149.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T12:40:31.148Z', '2021-03-30T12:40:31.148Z'),
(162, 28, 1, 0, NULL, '', '', 'uploads/discussionfile/ban-sairee_small-barn-500kb_1617108204562.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T12:43:24.561Z', '2021-03-30T12:43:24.561Z'),
(163, 28, 1, 0, NULL, '', '', 'uploads/discussionfile/ban-sairee_small_barn-external-500kb_1617108374794.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T12:46:14.794Z', '2021-03-30T12:46:14.794Z'),
(164, 28, 1, 0, NULL, '', '', 'uploads/discussionfile/sea-wave-photo-transparent-png-stickpng-0_1617108396700.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T12:46:36.700Z', '2021-03-30T12:46:36.700Z'),
(165, 28, 1, 0, 0, 'hello', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T12:56:38.084Z', '2021-03-30T12:56:38.084Z'),
(166, 28, 1, 0, 0, 'How are you @Vijay Gohil ?', '', '', '', 'TMS Admin', '3', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T13:05:32.875Z', '2021-03-30T13:05:32.875Z'),
(167, 28, 1, 0, NULL, '', '', 'uploads/discussionfile/sample_1617109666468.pdf', 'application/pdf', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T13:07:46.467Z', '2021-03-30T13:07:46.467Z'),
(168, 28, 1, 0, NULL, '', '', 'uploads/discussionfile/ban-sairee_small_barn-external-500kb_1617109686673.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T13:08:06.672Z', '2021-03-30T13:08:06.672Z'),
(169, 28, 1, 0, NULL, '', '', 'uploads/discussionfile/sea-wave-photo-transparent-png-stickpng-0_1617109700479.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T13:08:20.478Z', '2021-03-30T13:08:20.478Z'),
(170, 28, 1, 0, NULL, '', '', 'uploads/discussionfile/sample_1617115265576.pdf', 'application/pdf', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T14:41:05.574Z', '2021-03-30T14:41:05.574Z'),
(171, 28, 1, 0, NULL, '', '', 'uploads/discussionfile/sea-wave-photo-transparent-png-stickpng-0_1617115301106.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-03-30T14:41:41.105Z', '2021-03-30T14:41:41.105Z'),
(172, 2, 1, 0, 0, 'hello', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,11,2,2,', 0, '2021-03-30T14:45:02.954Z', '2021-03-30T14:45:02.954Z'),
(173, 40, 1, 0, NULL, '', '', 'uploads/discussionfile/msg-1-fc-40_1617167428920.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-31T05:10:28.919Z', '2021-03-31T05:10:28.919Z'),
(174, 40, 1, 0, NULL, '', '', 'uploads/discussionfile/imgpnn_1617169021754.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-31T05:37:01.753Z', '2021-03-31T05:37:01.753Z'),
(175, 40, 1, 0, 0, 'hello how are you?', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-31T14:12:15.630Z', '2021-03-31T14:12:15.630Z'),
(176, 40, 1, 0, NULL, '', '', 'uploads/discussionfile/ban-sairee_small-barn-500kb_1617199947370.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-31T14:12:27.370Z', '2021-03-31T14:12:27.370Z'),
(177, 40, 1, 0, NULL, '', '', 'uploads/discussionfile/msg-1-fc-40_1617200025541.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-03-31T14:13:45.540Z', '2021-03-31T14:13:45.540Z'),
(178, 2, 1, 0, 0, '@Vijay Gohil  Hi, what are you doing? :)', '', '', '', 'TMS Admin', '3', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,5,11,2,2,', 0, '2021-04-01T10:45:59.984Z', '2021-04-01T10:45:59.984Z'),
(179, 34, 1, 0, NULL, '', '', 'uploads/discussionfile/art_1617275625681.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-04-01T11:13:45.680Z', '2021-04-01T11:13:45.680Z'),
(180, 34, 1, 0, NULL, '', '', 'uploads/discussionfile/ban-sairee_small_barn-external-500kb_1617276112124.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-04-01T11:21:52.122Z', '2021-04-01T11:21:52.122Z'),
(181, 34, 1, 0, NULL, '', '', 'uploads/discussionfile/msg-1-fc-40_1617276135230.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-04-01T11:22:15.229Z', '2021-04-01T11:22:15.229Z'),
(182, 34, 1, 0, 0, 'please check document @Mayank Vadiya', '', '', '', 'TMS Admin', '5', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-04-01T11:30:58.002Z', '2021-04-01T11:30:58.002Z'),
(183, 34, 1, 0, NULL, '', '', 'uploads/discussionfile/sea-wave-photo-transparent-png-stickpng-0_1617276675666.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-04-01T11:31:15.666Z', '2021-04-01T11:31:15.666Z'),
(184, 34, 1, 0, NULL, '', '', 'uploads/discussionfile/art_1617276790832.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '3,1,', 0, '2021-04-01T11:33:10.831Z', '2021-04-01T11:33:10.831Z'),
(185, 29, 1, 0, 0, '? nice pic', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-04-12T06:34:32.875Z', '2021-04-12T06:34:32.875Z'),
(186, 29, 1, 0, 0, '😇', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-04-12T06:56:56.592Z', '2021-04-12T06:56:56.592Z'),
(187, 29, 1, 0, 0, 'i have check all the pics. it\'s nice 😊🤩😍', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-04-12T06:58:51.567Z', '2021-04-12T06:58:51.567Z'),
(188, 2, 1, 0, 0, 'hi this is testing 😀', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,5,11,2,2,', 0, '2021-04-12T08:02:14.787Z', '2021-04-12T08:02:14.787Z'),
(189, 2, 3, 0, 0, 'hello😅', '', '', '', 'Vijay Gohil', '', '', 'uploads/profilePic/1544614850.png', NULL, 'true', '0', 'false', '3,1,5,11,2,2,', 0, '2021-04-14T12:24:33.242Z', '2021-04-14T12:24:33.242Z'),
(190, 2, 1, 0, 0, 'Test :D', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,5,11,2,2,', 0, '2021-04-15T17:37:26.131Z', '2021-04-15T17:37:26.131Z'),
(191, 29, 1, 0, 0, 'emoji typing text 😃 emoji 😛', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-04-29T13:40:42.591Z', '2021-04-29T13:40:42.591Z'),
(192, 2, 1, 0, 0, '😃 😀😉', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,5,11,2,2,', 0, '2021-04-30T11:45:57.546Z', '2021-04-30T11:45:57.546Z'),
(193, 38, 1, 0, 0, 'hi', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-05-04T04:16:10.383Z', '2021-05-04T04:16:10.383Z'),
(194, 38, 1, 0, NULL, NULL, '', 'uploads/discussionfile/images_1620101793532.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-05-04T04:16:33.531Z', '2021-05-04T04:16:33.531Z'),
(195, 40, 1, 0, NULL, NULL, '', 'uploads/discussionfile/images_1620210628837.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-05-05T10:30:28.834Z', '2021-05-05T10:30:28.834Z'),
(196, 2, 1, 0, 0, 'please check document 😃', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,5,11,2,2,', 0, '2021-05-06T14:37:54.159Z', '2021-05-06T14:37:54.159Z'),
(197, 2, 1, 0, NULL, NULL, '', 'uploads/discussionfile/TMS-15_1620312213984.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,5,11,2,2,', 0, '2021-05-06T14:43:33.984Z', '2021-05-06T14:43:33.984Z'),
(198, 2, 1, 0, 0, 'hi 😉', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,5,11,2,2,', 0, '2021-05-07T07:14:14.330Z', '2021-05-07T07:14:14.330Z'),
(199, 28, 1, 0, 0, 'Great :)', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-05-07T15:03:23.014Z', '2021-05-07T15:03:23.014Z'),
(200, 28, 1, 0, 0, 'Great, thank you :)', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-05-07T15:03:40.504Z', '2021-05-07T15:03:40.504Z'),
(201, 2, 1, 0, 0, 'emoji typing text 😃', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,5,11,2,2,', 0, '2021-05-12T05:25:28.424Z', '2021-05-12T05:25:28.424Z'),
(202, 2, 1, 0, 0, 'please check it @Mayank Vadiya  😊', '', '', '', 'TMS Admin', '5', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,5,11,2,2,', 0, '2021-05-12T05:26:19.605Z', '2021-05-12T05:26:19.605Z');
INSERT INTO `tms_discussion` (`id`, `order_id`, `user_id`, `iFkUserTypeId`, `parent`, `content`, `file`, `fileURL`, `fileMimeType`, `fullname`, `pings`, `profileURL`, `profile_picture_url`, `created_by_admin`, `created_by_current_user`, `upvote_count`, `user_has_upvoted`, `read_id`, `job_id`, `created`, `modified`) VALUES
(203, 2, 1, 0, 0, 'Have you complete your work 😃', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,5,11,2,2,', 0, '2021-05-26T09:42:41.994Z', '2021-05-26T09:42:41.994Z'),
(204, 38, 1, 0, NULL, NULL, '', 'uploads/discussionfile/msg-1-fc-40_1622175571502.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-05-28T04:19:31.497Z', '2021-05-28T04:19:31.497Z'),
(205, 37, 1, 0, NULL, NULL, '', 'uploads/discussionfile/TMS_Feedback_-_07_1622555630367.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-06-01T13:53:50.366Z', '2021-06-01T13:53:50.366Z'),
(206, 29, 1, 0, 0, 'Test 😃', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-06-02T13:45:59.325Z', '2021-06-02T13:45:59.325Z'),
(207, 28, 1, 0, NULL, NULL, '', 'uploads/discussionfile/download_1623211419509.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-06-09T04:03:39.508Z', '2021-06-09T04:03:39.508Z'),
(208, 2, 1, 0, 0, '😄', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,5,11,2,2,', 0, '2021-06-22T14:11:58.472Z', '2021-06-22T14:11:58.472Z'),
(209, 2, 1, 0, 0, '🍕', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,5,11,2,2,', 0, '2021-06-22T14:12:09.810Z', '2021-06-22T14:12:09.810Z'),
(210, 59, 1, 0, 0, 'hello', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '', 0, '2021-07-06T04:58:01.527Z', '2021-07-06T04:58:01.527Z'),
(211, 61, 1, 0, 0, ':)', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-07-06T12:15:55.787Z', '2021-07-06T12:15:55.787Z'),
(212, 61, 1, 0, NULL, NULL, '', 'uploads/discussionfile/download_1625573955562.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-07-06T12:19:15.561Z', '2021-07-06T12:19:15.561Z'),
(213, 62, 3, 0, 0, '😃', '', '', '', 'Vijay Gohil', '', '', 'uploads/profilePic/1544614850.png', NULL, 'true', '0', 'false', '3,1,', 0, '2021-07-07T04:20:51.047Z', '2021-07-07T04:20:51.047Z'),
(214, 62, 3, 0, 0, '😃', '', '', '', 'Vijay Gohil', '', '', 'uploads/profilePic/1544614850.png', NULL, 'true', '0', 'false', '3,1,', 0, '2021-07-07T04:21:02.268Z', '2021-07-07T04:21:02.268Z'),
(215, 62, 1, 0, 0, '😆😆😆😆😆😆😆😆😆😆😆😆😆😆', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-07-07T04:22:19.701Z', '2021-07-07T04:22:19.701Z'),
(216, 62, 3, 0, 0, 'hello from job23', '', '', '', 'Vijay Gohil', '', '', 'uploads/profilePic/1544614850.png', NULL, 'true', '0', 'false', '1,', 0, '2021-07-07T04:23:47.949Z', '2021-07-07T04:23:47.949Z'),
(217, 62, 3, 0, 0, 'juygugikhkihik', '', '', '', 'Vijay Gohil', '', '', 'uploads/profilePic/1544614850.png', NULL, 'true', '0', 'false', '1,', 0, '2021-07-07T04:30:11.832Z', '2021-07-07T04:30:11.832Z'),
(218, 64, 1, 0, 0, '787887', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '5,', 0, '2021-07-13T15:41:09.439Z', '2021-07-13T15:41:09.439Z'),
(219, 64, 1, 0, 0, 'khkhkh', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '5,', 0, '2021-07-13T15:41:42.112Z', '2021-07-13T15:41:42.112Z'),
(220, 68, 1, 0, 0, 'okoko', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '', 0, '2021-07-19T04:14:48.473Z', '2021-07-19T04:14:48.473Z'),
(221, 2, 1, 0, NULL, NULL, '', 'uploads/discussionfile/img2_1628508604852.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,5,11,2,2,', 0, '2021-08-09T11:30:04.852Z', '2021-08-09T11:30:04.852Z'),
(222, 2, 1, 0, NULL, NULL, '', 'uploads/discussionfile/DigitalGlobe_WorldView1_50cm_8bit_BW_DRA_Bangkok_Thailand_2009JAN06_8bits_sub_r_1_1628508613803.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,5,11,2,2,', 0, '2021-08-09T11:30:13.802Z', '2021-08-09T11:30:13.802Z'),
(223, 88, 1, 0, NULL, NULL, '', 'uploads/discussionfile/DigitalGlobe_WorldView1_50cm_8bit_BW_DRA_Bangkok_Thailand_2009JAN06_8bits_sub_r_1_1628508855766.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,4,', 0, '2021-08-09T11:34:15.765Z', '2021-08-09T11:34:15.765Z'),
(224, 88, 1, 0, NULL, NULL, '', 'uploads/discussionfile/tms-12m-5_1628508885940.zip', 'application/zip', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,4,', 0, '2021-08-09T11:34:45.939Z', '2021-08-09T11:34:45.939Z'),
(225, 28, 1, 0, 0, 'hi working', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-08-10T07:01:29.546Z', '2021-08-10T07:01:29.546Z'),
(226, 28, 1, 0, NULL, NULL, '', 'uploads/discussionfile/DigitalGlobe_WorldView1_50cm_8bit_BW_DRA_Bangkok_Thailand_2009JAN06_8bits_sub_r_1_1628578901838.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-08-10T07:01:41.838Z', '2021-08-10T07:01:41.838Z'),
(227, 28, 1, 0, NULL, NULL, '', 'uploads/discussionfile/tms-12m-5_1628578968049.zip', 'application/zip', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-08-10T07:02:48.048Z', '2021-08-10T07:02:48.048Z'),
(228, 28, 1, 0, NULL, NULL, '', 'uploads/discussionfile/big_ben_clockface_190677_1628668051939.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-08-11T07:47:31.938Z', '2021-08-11T07:47:31.938Z'),
(229, 28, 1, 0, NULL, NULL, '', 'uploads/discussionfile/tms-12m-5_1628668051942.zip', 'application/zip', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-08-11T07:47:31.942Z', '2021-08-11T07:47:31.942Z'),
(230, 28, 1, 0, NULL, NULL, '', 'uploads/discussionfile/img2_1628668110035.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-08-11T07:48:30.035Z', '2021-08-11T07:48:30.035Z'),
(231, 28, 1, 0, NULL, NULL, '', 'uploads/discussionfile/tms-12m_1628668143792.zip', 'application/zip', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-08-11T07:49:03.791Z', '2021-08-11T07:49:03.791Z'),
(232, 28, 1, 0, NULL, NULL, '', 'uploads/discussionfile/big_ben_at_night_190497_1628668143790.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-08-11T07:49:03.790Z', '2021-08-11T07:49:03.790Z'),
(233, 29, 1, 0, NULL, NULL, '', 'uploads/discussionfile/DigitalGlobe_WorldView1_50cm_8bit_BW_DRA_Bangkok_Thailand_2009JAN06_8bits_sub_r_1_1628685131049.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-08-11T12:32:11.048Z', '2021-08-11T12:32:11.048Z'),
(234, 29, 1, 0, NULL, NULL, '', 'uploads/discussionfile/big_ben_clockface_190677_1628685183093.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-08-11T12:33:03.092Z', '2021-08-11T12:33:03.092Z'),
(235, 29, 1, 0, NULL, NULL, '', 'uploads/discussionfile/img2_1628685183091.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-08-11T12:33:03.091Z', '2021-08-11T12:33:03.091Z'),
(236, 35, 1, 0, NULL, NULL, '', 'uploads/discussionfile/tms-upld_1628666482069_1629877233646.zip', 'application/zip', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-08-25T07:40:33.646Z', '2021-08-25T07:40:33.646Z'),
(237, 35, 1, 0, NULL, NULL, '', 'uploads/discussionfile/tms-upld_1628666482069_1629877377273.zip', 'application/zip', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-08-25T07:42:57.272Z', '2021-08-25T07:42:57.272Z'),
(238, 35, 1, 0, 0, 'test', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-08-25T07:44:18.454Z', '2021-08-25T07:44:18.454Z'),
(239, 35, 1, 0, 0, 'ryeytyr', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-08-25T07:44:23.001Z', '2021-08-25T07:44:23.001Z'),
(240, 35, 1, 0, NULL, NULL, '', 'uploads/discussionfile/tms-upld_1628666482069_1629877470528.zip', 'application/zip', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-08-25T07:44:30.528Z', '2021-08-25T07:44:30.528Z'),
(241, 2, 1, 0, NULL, NULL, '', 'uploads/discussionfile/navicat150_premium_en_x64_1629877936643.exe', 'application/x-msdownload', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,5,11,2,2,', 0, '2021-08-25T07:52:16.640Z', '2021-08-25T07:52:16.640Z'),
(242, 29, 1, 0, NULL, NULL, '', 'uploads/discussionfile/tms-upld_1628666482069_1629986327609.zip', 'application/zip', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-08-26T13:58:47.609Z', '2021-08-26T13:58:47.609Z'),
(243, 2, 1, 0, 0, 'hello', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,5,11,2,2,', 0, '2021-08-26T14:20:58.243Z', '2021-08-26T14:20:58.243Z'),
(244, 2, 1, 0, 0, 'hi', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,5,11,2,2,', 0, '2021-08-26T14:21:04.882Z', '2021-08-26T14:21:04.882Z'),
(245, 29, 1, 0, 0, 'ABC', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-08-26T14:25:35.384Z', '2021-08-26T14:25:35.384Z'),
(246, 29, 1, 0, 0, '😄😄', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-08-26T14:25:59.413Z', '2021-08-26T14:25:59.413Z'),
(247, 2, 1, 0, NULL, NULL, '', 'uploads/discussionfile/cloud-based-banner-img_1630038987766.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,5,11,2,2,', 0, '2021-08-27T04:36:27.765Z', '2021-08-27T04:36:27.765Z'),
(248, 88, 1, 0, 0, '😀😀😀😀😀😀😀😀😀😀', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,4,', 0, '2021-08-27T05:18:52.135Z', '2021-08-27T05:18:52.135Z'),
(249, 88, 1, 0, NULL, NULL, '', 'uploads/discussionfile/butterfly_1630041566970.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,4,', 0, '2021-08-27T05:19:26.969Z', '2021-08-27T05:19:26.969Z'),
(250, 88, 1, 0, NULL, NULL, '', 'uploads/discussionfile/test3_carrierStatementDetailList_(1)_1630041580054.csv', 'application/vnd.ms-excel', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,4,', 0, '2021-08-27T05:19:40.053Z', '2021-08-27T05:19:40.053Z'),
(251, 88, 3, 0, 0, 'okoko', '', '', '', 'Vijay Gohil', '', '', 'uploads/profilePic/1544614850.png', NULL, 'true', '0', 'false', '3,1,4,', 0, '2021-08-27T05:34:04.170Z', '2021-08-27T05:34:04.170Z'),
(252, 88, 3, 0, 0, 'from vijay g', '', '', '', 'Vijay Gohil', '', '', 'uploads/profilePic/1544614850.png', NULL, 'true', '0', 'false', '3,1,4,', 0, '2021-08-27T05:34:20.846Z', '2021-08-27T05:34:20.846Z'),
(253, 88, 3, 0, NULL, NULL, '', 'uploads/discussionfile/Project2008_Campaign2_(1)_1630042482083.pdf', 'application/pdf', 'Vijay Gohil', '', '', 'uploads/profilePic/1544614850.png', NULL, 'true', '0', 'false', '3,1,4,', 0, '2021-08-27T05:34:42.082Z', '2021-08-27T05:34:42.082Z'),
(254, 88, 4, 0, 0, 'From rajesh murlidhar\n\n\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking, which allows designers to consider the form of a webpage or publication, without the meaning of the text influencing the design.\nLorem ipsum is typically a corrupted version of \'De finibus bonorum et malorum\', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.\nVersions of the Lorem ipsum text have been used in typesetting at least since the 1960s, when it was popularized by advertisements for Letraset transfer sheets.[1] Lorem ipsum was introduced to the digital world in the mid-1980s, when Aldus employed it in graphic and word-processing templates for its desktop publishing program PageMaker. Other popular word processors, including Pages and Microsoft Word, have since adopted Lorem ipsum,[2] as have many LaTeX packages,[3][4][5] web content managers such as Joomla! and WordPress, and CSS libraries such as Semantic UI.[6]', '', '', '', 'Rajesh Mudaliar', '', '', 'uploads/profilePic/1545201247.jpg', NULL, 'true', '0', 'false', '4,1,', 0, '2021-08-27T05:48:40.052Z', '2021-08-27T05:48:40.052Z'),
(255, 88, 4, 0, 0, 'ABC\n\n\nxyz', '', '', '', 'Rajesh Mudaliar', '', '', 'uploads/profilePic/1545201247.jpg', NULL, 'true', '0', 'false', '4,1,', 0, '2021-08-27T05:48:55.372Z', '2021-08-27T05:48:55.372Z'),
(256, 88, 1, 0, NULL, NULL, '', 'uploads/discussionfile/horse_1630043978176.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-08-27T05:59:38.175Z', '2021-08-27T05:59:38.175Z'),
(257, 88, 1, 0, NULL, NULL, '', 'uploads/discussionfile/animal1_1630043978062.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-08-27T05:59:38.059Z', '2021-08-27T05:59:38.059Z'),
(258, 88, 1, 0, NULL, NULL, '', 'uploads/discussionfile/cat1_1630043978173.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-08-27T05:59:38.171Z', '2021-08-27T05:59:38.171Z'),
(259, 88, 1, 0, NULL, NULL, '', 'uploads/discussionfile/butterfly_1630043978168.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-08-27T05:59:38.165Z', '2021-08-27T05:59:38.165Z'),
(260, 2, 1, 0, 0, '😁😃😄', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,5,11,2,2,', 0, '2021-09-02T04:52:52.577Z', '2021-09-02T04:52:52.577Z'),
(261, 2, 1, 0, 0, 'hi', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,5,11,2,2,', 0, '2021-09-02T05:39:47.950Z', '2021-09-02T05:39:47.950Z'),
(264, 2, 1, 0, 0, 'Hello', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,5,11,2,2,', 0, '2021-09-02T05:42:33.716Z', '2021-09-02T05:42:33.716Z'),
(268, 102, 1, 0, 0, 'test123', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,5,', 0, '2021-09-02T12:50:16.864Z', '2021-09-02T12:50:16.864Z'),
(269, 102, 1, 0, 0, '😄😄😄😄😄😄', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,5,', 0, '2021-09-02T12:51:15.098Z', '2021-09-02T12:51:15.098Z'),
(270, 2, 1, 0, NULL, NULL, '', 'uploads/discussionfile/Untitled__Jun_22,_2021_12_38_PM_1630573443139_1630588448076.webm', 'video/webm', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,5,11,2,2,', 0, '2021-09-02T13:14:08.076Z', '2021-09-02T13:14:08.076Z'),
(272, 102, 1, 0, NULL, NULL, '', 'uploads/discussionfile/butterfly_1630595340811.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,5,', 0, '2021-09-02T15:09:00.810Z', '2021-09-02T15:09:00.810Z'),
(273, 102, 1, 0, NULL, NULL, '', 'uploads/discussionfile/cat1_1630595340916.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,5,', 0, '2021-09-02T15:09:00.916Z', '2021-09-02T15:09:00.916Z'),
(274, 102, 1, 0, 0, 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,5,', 0, '2021-09-02T15:10:16.327Z', '2021-09-02T15:10:16.327Z'),
(275, 102, 3, 0, 0, 'Test Test Trio', '', '', '', 'Vijay Gohil', '', '', 'uploads/profilePic/1544614850.png', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-09-02T15:15:57.980Z', '2021-09-02T15:15:57.980Z'),
(276, 102, 3, 0, 0, '😄😄😄😄😄😄😄😄', '', '', '', 'Vijay Gohil', '', '', 'uploads/profilePic/1544614850.png', NULL, 'true', '0', 'false', '3,1,5,', 0, '2021-09-02T15:17:59.341Z', '2021-09-02T15:17:59.341Z'),
(277, 102, 1, 0, 0, 'okokokok', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-09-02T15:18:42.919Z', '2021-09-02T15:18:42.919Z'),
(278, 102, 1, 0, 0, '🚀🚎🚙🚗🚕🚂🚂🚂🚂🚂🚂🚂🚂🚂🚂🚂🚂🚂🚂', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-09-02T15:19:03.782Z', '2021-09-02T15:19:03.782Z'),
(279, 102, 1, 0, 0, '🕎💜', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-09-02T15:19:17.379Z', '2021-09-02T15:19:17.379Z'),
(280, 102, 1, 0, 0, '🇮🇳🇮🇳🇮🇳🇮🇳🇮🇳🇮🇳🇮🇳🇮🇳🇮🇳🇮🇳🇮🇳🇮🇳🇮🇳🇮🇳🇮🇳🇮🇸🇭🇰🇬🇷🇪🇷🇬🇫🇬🇮🇬🇷🖥️🖨️🚡🚠🚟🥝🍠🥑🍊', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-09-02T15:21:30.387Z', '2021-09-02T15:21:30.387Z'),
(281, 102, 1, 0, 0, '🇦🇫🇦🇽🇦🇱🇩🇿🚩🏁🏳️🇦🇩🇦🇹🇦🇿🇧🇴🇧🇼🇧🇷🇮🇴🇮🇨🇨🇦🇨🇲🇰🇭🇨🇱🇨🇳🇨🇽', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-09-02T15:22:33.653Z', '2021-09-02T15:22:33.653Z'),
(282, 102, 1, 0, NULL, NULL, '', 'uploads/discussionfile/import_probing_sheet_en_1630596269364.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-09-02T15:24:29.364Z', '2021-09-02T15:24:29.364Z'),
(283, 102, 1, 0, NULL, NULL, '', 'uploads/discussionfile/first_1630596269360.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-09-02T15:24:29.359Z', '2021-09-02T15:24:29.359Z'),
(284, 2, 1, 0, 0, 'Hello this is test message', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,5,11,2,2,', 0, '2021-09-03T04:51:51.513Z', '2021-09-03T04:51:51.513Z'),
(285, 2, 1, 0, 0, 'Testthbkjhkhkjhkhkh', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,5,11,2,2,', 0, '2021-09-03T04:53:25.930Z', '2021-09-03T04:53:25.930Z'),
(286, 2, 1, 0, 0, 'test please check&nbsp;&nbsp;<img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f1e7-1f1e6.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f1e8-1f1e9.png\">', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,5,11,2,2,', 0, '2021-09-06T05:11:37.707Z', '2021-09-06T05:11:37.707Z'),
(287, 102, 1, 0, 0, 'ok<img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f1e7-1f1e9.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f1e7-1f1e7.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f1e7-1f1fe.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f1ee-1f1f3.png\">', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-09-06T05:37:06.003Z', '2021-09-06T05:37:06.003Z'),
(288, 102, 1, 0, 0, 'okokokok\n<br>', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-09-06T05:37:17.840Z', '2021-09-06T05:37:17.840Z'),
(289, 102, 1, 0, NULL, NULL, '', 'uploads/discussionfile/butterfly_1630906735249.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-09-06T05:38:55.247Z', '2021-09-06T05:38:55.247Z'),
(290, 102, 1, 0, NULL, NULL, '', 'uploads/discussionfile/cat1_1630906735253.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-09-06T05:38:55.251Z', '2021-09-06T05:38:55.251Z'),
(291, 102, 1, 0, NULL, NULL, '', 'uploads/discussionfile/cutetiger_1630906735308.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-09-06T05:38:55.307Z', '2021-09-06T05:38:55.307Z'),
(292, 102, 1, 0, NULL, NULL, '', 'uploads/discussionfile/contact_template1_(1)_1630906735255.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-09-06T05:38:55.255Z', '2021-09-06T05:38:55.255Z'),
(293, 102, 1, 0, NULL, NULL, '', 'uploads/discussionfile/Boostshop_1630906735242.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-09-06T05:38:55.242Z', '2021-09-06T05:38:55.242Z'),
(294, 2, 1, 0, 0, 'hi i am live now&nbsp;<img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f642.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f60d.png\">', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,5,11,2,2,', 0, '2021-09-06T06:10:51.168Z', '2021-09-06T06:10:51.168Z'),
(295, 103, 1, 0, NULL, NULL, '', 'uploads/discussionfile/contact_template1_1630908698236.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-09-06T06:11:38.235Z', '2021-09-06T06:11:38.235Z'),
(296, 103, 1, 0, NULL, NULL, '', 'uploads/discussionfile/kmlfile_1630908698239.kml', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-09-06T06:11:38.238Z', '2021-09-06T06:11:38.238Z'),
(297, 103, 1, 0, NULL, NULL, '', 'uploads/discussionfile/complementary_information_(1)_1630908698228.pdf', 'application/pdf', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-09-06T06:11:38.227Z', '2021-09-06T06:11:38.227Z'),
(298, 103, 1, 0, NULL, NULL, '', 'uploads/discussionfile/butterfly_1630908698219.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-09-06T06:11:38.219Z', '2021-09-06T06:11:38.219Z'),
(299, 103, 1, 0, NULL, NULL, '', 'uploads/discussionfile/contact_template1_(1)_1630908698233.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-09-06T06:11:38.231Z', '2021-09-06T06:11:38.231Z'),
(300, 103, 1, 0, NULL, NULL, '', 'uploads/discussionfile/cat1_1630908698225.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-09-06T06:11:38.224Z', '2021-09-06T06:11:38.224Z'),
(301, 2, 3, 0, 0, 'tested form live hi @TMS Admin&nbsp;&nbsp;<img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f3f3-1f308.png\">', '', '', '', 'Vijay Gohil', '1', '', 'uploads/profilePic/1544614850.png', NULL, 'true', '0', 'false', '3,1,5,11,2,2,', 0, '2021-09-06T06:12:18.713Z', '2021-09-06T06:12:18.713Z'),
(302, 103, 1, 0, 0, 'From TMS admin\n<br>\n<br>', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-09-06T07:25:43.027Z', '2021-09-06T07:25:43.027Z'),
(303, 103, 5, 0, 0, 'hello @Jaimini Kanhasoft&nbsp; please check it', '', '', '', 'Mayank Vadiya', '9', '', 'uploads/profilePic/1546238296.jpg', NULL, 'true', '0', 'false', '5,1,', 0, '2021-09-06T09:19:04.940Z', '2021-09-06T09:19:04.940Z'),
(304, 103, 5, 0, NULL, NULL, '', 'uploads/discussionfile/big_ben_clockface_190677_1630920060048.jpeg', 'image/jpeg', 'Mayank Vadiya', '', '', 'uploads/profilePic/1546238296.jpg', NULL, 'true', '0', 'false', '5,1,', 0, '2021-09-06T09:21:00.046Z', '2021-09-06T09:21:00.046Z'),
(305, 28, 1, 0, 0, 'hi&nbsp;<img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f600.png\">', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-09-06T10:35:37.217Z', '2021-09-06T10:35:37.217Z'),
(306, 29, 1, 0, 0, 'hello how are you?&nbsp;<img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f60a.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f929.png\">', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-09-06T13:09:19.688Z', '2021-09-06T13:09:19.688Z'),
(307, 2, 1, 0, 0, 'Test 🙂', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,11,3,3,3,2,2,', 0, '2021-09-08T07:45:58.305Z', '2021-09-08T07:45:58.305Z'),
(308, 66, 1, 0, 0, 'Hello\n<br>', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-09-08T09:11:56.308Z', '2021-09-08T09:11:56.308Z'),
(309, 66, 1, 0, 0, 'hi', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-09-08T09:12:38.107Z', '2021-09-08T09:12:38.107Z'),
(310, 66, 1, 0, 0, 'test', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-09-08T09:12:58.373Z', '2021-09-08T09:12:58.373Z'),
(311, 103, 1, 0, 0, 'okay done\n<br>', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-09-09T12:19:09.391Z', '2021-09-09T12:19:09.391Z'),
(312, 103, 1, 0, 0, '<br>\n<br>\n<br>\n<br>\n<br>', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-09-09T12:21:54.639Z', '2021-09-09T12:21:54.639Z'),
(313, 2, 1, 0, 0, 'hello', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,11,3,3,3,2,2,', 0, '2021-09-10T05:48:07.727Z', '2021-09-10T05:48:07.727Z'),
(314, 2, 1, 0, 0, 'how are you?&nbsp;<img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/263a.png\">', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,11,3,3,3,2,2,', 0, '2021-09-10T05:48:36.070Z', '2021-09-10T05:48:36.070Z'),
(315, 2, 1, 0, 0, 'Hello&nbsp;\n<br>', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,11,3,3,3,2,2,', 0, '2021-09-13T05:04:23.556Z', '2021-09-13T05:04:23.556Z'),
(316, 2, 1, 0, 0, 'Yes testing&nbsp;', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,11,3,3,3,2,2,', 0, '2021-09-13T05:04:44.855Z', '2021-09-13T05:04:44.855Z'),
(317, 113, 1, 0, NULL, NULL, '', 'uploads/discussionfile/Screenshotfrom3_1631787377334.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-09-16T10:16:17.333Z', '2021-09-16T10:16:17.333Z'),
(318, 113, 1, 0, NULL, NULL, '', 'uploads/discussionfile/Screenshot_from__1631787377337.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-09-16T10:16:17.337Z', '2021-09-16T10:16:17.337Z'),
(319, 113, 1, 0, NULL, NULL, '', 'uploads/discussionfile/Screenshotfrom2_1631787377335.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-09-16T10:16:17.334Z', '2021-09-16T10:16:17.334Z'),
(320, 113, 1, 0, NULL, NULL, '', 'uploads/discussionfile/Screenshot_from4_1631787377332.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-09-16T10:16:17.331Z', '2021-09-16T10:16:17.331Z'),
(321, 113, 1, 0, NULL, NULL, '', 'uploads/discussionfile/Screenshotfrom1_1631787377336.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-09-16T10:16:17.335Z', '2021-09-16T10:16:17.335Z'),
(322, 113, 1, 0, 0, 'In&nbsp;<a href=\"https://en.wikipedia.org/wiki/Publishing\" title=\"Publishing\" style=\"color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">publishing</a>&nbsp;and&nbsp;<a href=\"https://en.wikipedia.org/wiki/Graphic_design\" title=\"Graphic design\" style=\"color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">graphic design</a>,&nbsp;<i><b>Lorem ipsum</b></i>&nbsp;is a&nbsp;<a href=\"https://en.wikipedia.org/wiki/Placeholder_text\" class=\"mw-redirect\" title=\"Placeholder text\" style=\"color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">placeholder text</a>&nbsp;commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.&nbsp;<i>Lorem ipsum</i>&nbsp;may be used as a placeholder before final&nbsp;<a href=\"https://en.wikipedia.org/wiki/Copy_(written)\" title=\"Copy (written)\" style=\"color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">copy</a>&nbsp;is available. It is also used to temporarily replace text in a process called&nbsp;<a href=\"https://en.wikipedia.org/wiki/Greeking\" title=\"Greeking\" style=\"color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">greeking</a>, which allows designers to consider the form of a webpage or publication, without the meaning of the text influencing the design.\n<i>Lorem ipsum</i>&nbsp;is typically a corrupted version of&nbsp;<i lang=\"la\" title=\"Latin-language text\">\'<a href=\"https://en.wikipedia.org/wiki/De_finibus_bonorum_et_malorum\" title=\"De finibus bonorum et malorum\" style=\"color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">De finibus bonorum et malorum</a>\'</i>, a 1st century BC text by the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Roman_Republic\" title=\"Roman Republic\" style=\"color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">Roman</a>&nbsp;statesman and philosopher&nbsp;<a href=\"https://en.wikipedia.org/wiki/Cicero\" title=\"Cicero\" style=\"color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">Cicero</a>, with words altered, added, and removed to make it nonsensical and improper&nbsp;<a href=\"https://en.wikipedia.org/wiki/Latin\" title=\"Latin\" style=\"color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">Latin</a>.\nVersions of the&nbsp;<i>Lorem ipsum</i>&nbsp;text have been used in&nbsp;<a href=\"https://en.wikipedia.org/wiki/Typesetting\" title=\"Typesetting\" style=\"color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">typesetting</a>&nbsp;at least since the 1960s, when it was popularized by advertisements for&nbsp;<a href=\"https://en.wikipedia.org/wiki/Letraset\" title=\"Letraset\" style=\"color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">Letraset</a>&nbsp;transfer sheets.<sup id=\"cite_ref-Cibois_1-0\" class=\"reference\" style=\"line-height: 1; unicode-bidi: isolate; white-space: nowrap; font-size: 11.2px;\"><a href=\"https://en.wikipedia.org/wiki/Lorem_ipsum#cite_note-Cibois-1\" style=\"color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">[1]</a></sup>&nbsp;<i>Lorem ipsum</i>&nbsp;was introduced to the digital world in the mid-1980s, when&nbsp;<a href=\"https://en.wikipedia.org/wiki/Aldus_Corporation\" title=\"Aldus Corporation\" style=\"color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">Aldus</a>&nbsp;employed it in graphic and word-processing templates for its desktop publishing program&nbsp;<a href=\"https://en.wikipedia.org/wiki/Adobe_PageMaker\" title=\"Adobe PageMaker\" style=\"color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">PageMaker</a>. Other popular&nbsp;<a href=\"https://en.wikipedia.org/wiki/Word_processor_(electronic_device)\" title=\"Word processor (electronic device)\" style=\"color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">word processors</a>, including&nbsp;<a href=\"https://en.wikipedia.org/wiki/Pages_(word_processor)\" title=\"Pages (word processor)\" style=\"color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">Pages</a>&nbsp;and&nbsp;<a href=\"https://en.wikipedia.org/wiki/Microsoft_Word\" title=\"Microsoft Word\" style=\"color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">Microsoft Word</a>, have since adopted&nbsp;<i>Lorem ipsum</i>,<sup id=\"cite_ref-SDop_2-0\" class=\"reference\" style=\"line-height: 1; unicode-bidi: isolate; white-space: nowrap; font-size: 11.2px;\"><a href=\"https://en.wikipedia.org/wiki/Lorem_ipsum#cite_note-SDop-2\" style=\"color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">[2]</a></sup>&nbsp;as have many&nbsp;<a href=\"https://en.wikipedia.org/wiki/LaTeX\" title=\"LaTeX\" style=\"color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">LaTeX</a>&nbsp😜ackages,<sup id=\"cite_ref-3\" class=\"reference\" style=\"line-height: 1; unicode-bidi: isolate; white-space: nowrap; font-size: 11.2px;\"><a href=\"https://en.wikipedia.org/wiki/Lorem_ipsum#cite_note-3\" style=\"color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">[3]</a></sup><sup id=\"cite_ref-4\" class=\"reference\" style=\"line-height: 1; unicode-bidi: isolate; white-space: nowrap; font-size: 11.2px;\"><a href=\"https://en.wikipedia.org/wiki/Lorem_ipsum#cite_note-4\" style=\"color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">[4]</a></sup><sup id=\"cite_ref-ms-212251_5-0\" class=\"reference\" style=\"line-height: 1; unicode-bidi: isolate; white-space: nowrap; font-size: 11.2px;\"><a href=\"https://en.wikipedia.org/wiki/Lorem_ipsum#cite_note-ms-212251-5\" style=\"color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">[5]</a></sup>&nbsp;web content managers such as&nbsp;<a href=\"https://en.wikipedia.org/wiki/Joomla!\" class=\"mw-redirect\" title=\"Joomla!\" style=\"color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">Joomla!</a>&nbsp;and&nbsp;<a href=\"https://en.wikipedia.org/wiki/WordPress\" title=\"WordPress\" style=\"color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">WordPress</a>, and&nbsp;<a href=\"https://en.wikipedia.org/wiki/CSS\" title=\"CSS\" style=\"color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">CSS</a>&nbsp;libraries such as Semantic UI.<sup id=\"cite_ref-6\" class=\"reference\" style=\"line-height: 1; unicode-bidi: isolate; white-space: nowrap; font-size: 11.2px;\"><a href=\"https://en.wikipedia.org/wiki/Lorem_ipsum#cite_note-6\" style=\"color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">[6]</a></sup>\n<br>\n<br>\n<br>', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-09-16T10:16:58.179Z', '2021-09-16T10:16:58.179Z'),
(323, 113, 1, 0, 0, 'okkkk\n<br><div><br></div>', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-09-16T10:17:23.300Z', '2021-09-16T10:17:23.300Z'),
(324, 113, 1, 0, 0, '<img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f601.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f606.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f606.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f606.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f606.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f606.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f606.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f606.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f606.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f606.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f606.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f606.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f1f8-1f1f2.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f1f8-1f1f9.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f1f8-1f1e6.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f1f8-1f1f3.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f1f1-1f1f0.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f1f8-1f1f0.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f1f8-1f1ec.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f1f8-1f1e7.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f1f8-1f1e7.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f1f0-1f1f3.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f1f1-1f1e8.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f1ff-1f1e6.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f1f0-1f1f7.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f1f9-1f1ff.png\">', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-09-16T10:17:50.288Z', '2021-09-16T10:17:50.288Z'),
(325, 61, 1, 0, NULL, NULL, '', 'uploads/discussionfile/Screen_Shot_2021-07-15_at_1_1631789907618.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-09-16T10:58:27.617Z', '2021-09-16T10:58:27.617Z'),
(326, 114, 1, 0, 0, '<img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f602.png\">', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-09-17T05:04:52.699Z', '2021-09-17T05:04:52.699Z'),
(327, 115, 1, 0, 0, 'testdfhff\n<br>', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-09-17T10:06:52.142Z', '2021-09-17T10:06:52.142Z'),
(328, 115, 1, 0, 0, 'loream ipsumhgg uuugjghg fyufyfyf uggjgjgyufufg ugugu', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-09-17T10:07:23.806Z', '2021-09-17T10:07:23.806Z'),
(329, 115, 1, 0, NULL, NULL, '', 'uploads/discussionfile/Screenshot_from_2021-08-10_15-20-53_1631873260896.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-09-17T10:07:40.895Z', '2021-09-17T10:07:40.895Z'),
(330, 115, 3, 0, 0, 'okokobjgub\n<br>', '', '', '', 'Vijay Gohil', '', '', 'uploads/profilePic/1544614850.png', NULL, 'true', '0', 'false', '3,1,', 0, '2021-09-17T10:11:54.137Z', '2021-09-17T10:11:54.137Z'),
(331, 115, 3, 0, 0, 'drgeregetett wret&nbsp; regte egt tfrgr y\n<br>', '', '', '', 'Vijay Gohil', '', '', 'uploads/profilePic/1544614850.png', NULL, 'true', '0', 'false', '3,1,', 0, '2021-09-17T10:12:07.112Z', '2021-09-17T10:12:07.112Z'),
(332, 115, 3, 0, 0, 'ertetet', '', '', '', 'Vijay Gohil', '', '', 'uploads/profilePic/1544614850.png', NULL, 'true', '0', 'false', '3,1,', 0, '2021-09-17T10:12:12.288Z', '2021-09-17T10:12:12.288Z'),
(333, 115, 1, 0, NULL, NULL, '', 'uploads/discussionfile/Screenshot_from_2021-08-06_17-41-00_1631873651027.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-09-17T10:14:11.026Z', '2021-09-17T10:14:11.026Z'),
(334, 117, 1, 0, NULL, NULL, '', 'uploads/discussionfile/PHYSICAL-XX-AUNRMAUD-REWC122652_1632113235199.PDF', 'application/pdf', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-09-20T04:47:15.197Z', '2021-09-20T04:47:15.197Z'),
(335, 117, 1, 0, NULL, NULL, '', 'uploads/discussionfile/PHYSICAL-XX-AUNRMAUD-OVWC107745_1632113235193.PDF', 'application/pdf', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-09-20T04:47:15.190Z', '2021-09-20T04:47:15.190Z'),
(336, 117, 1, 0, NULL, NULL, '', 'uploads/discussionfile/PHYSICAL-XX-AUNRMAUD-HAWC116209_(1)_1632113235180.PDF', 'application/pdf', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-09-20T04:47:15.178Z', '2021-09-20T04:47:15.178Z'),
(337, 117, 1, 0, NULL, NULL, '', 'uploads/discussionfile/PHYSICAL-XX-AUNRMAUD-PRWC126270_1632113235196.PDF', 'application/pdf', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-09-20T04:47:15.194Z', '2021-09-20T04:47:15.194Z'),
(338, 117, 1, 0, NULL, NULL, '', 'uploads/discussionfile/PHYSICAL-XX-AUNRMAUD-GUWC119022_(1)_1632113235188.PDF', 'application/pdf', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-09-20T04:47:15.186Z', '2021-09-20T04:47:15.186Z'),
(339, 117, 1, 0, 0, '<img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f3c1.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f6a9.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f3f3-1f308.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f1e6-1f1f2.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f1f0-1f1ed.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f1e6-1f1e9.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f1e7-1f1e7.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f1e7-1f1f9.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f1e7-1f1f2.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f1e7-1f1e7.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f1ea-1f1ea.png\">', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-09-20T04:47:40.424Z', '2021-09-20T04:47:40.424Z'),
(340, 117, 1, 0, 0, 'dregt', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-09-20T04:48:21.104Z', '2021-09-20T04:48:21.104Z'),
(341, 117, 1, 0, 0, 'gtyyh', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-09-20T04:57:05.084Z', '2021-09-20T04:57:05.084Z'),
(342, 117, 1, 0, 0, 'df sdfsf regyhu6 jju', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-09-20T05:02:41.601Z', '2021-09-20T05:02:41.601Z'),
(343, 117, 1, 0, 0, 'ettt', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-09-20T05:02:48.879Z', '2021-09-20T05:02:48.879Z'),
(344, 117, 1, 0, 0, 'rwsdt3b r5dw4ey', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-09-20T05:03:33.864Z', '2021-09-20T05:03:33.864Z'),
(345, 117, 1, 0, 0, 'etttv t<img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f602.png\">', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-09-20T05:03:46.198Z', '2021-09-20T05:03:46.198Z'),
(346, 117, 1, 0, 0, 'i698698', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-09-20T11:27:53.201Z', '2021-09-20T11:27:53.201Z'),
(347, 119, 1, 0, 0, 'okokok', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-09-20T11:30:02.945Z', '2021-09-20T11:30:02.945Z');
INSERT INTO `tms_discussion` (`id`, `order_id`, `user_id`, `iFkUserTypeId`, `parent`, `content`, `file`, `fileURL`, `fileMimeType`, `fullname`, `pings`, `profileURL`, `profile_picture_url`, `created_by_admin`, `created_by_current_user`, `upvote_count`, `user_has_upvoted`, `read_id`, `job_id`, `created`, `modified`) VALUES
(348, 117, 1, 0, 0, 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. Wikipedia', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-09-20T11:49:53.637Z', '2021-09-20T11:49:53.637Z'),
(349, 119, 5, 0, 0, 'froom mayank vadiya loginnn', '', '', '', 'Mayank Vadiya', '', '', 'uploads/profilePic/1546238296.jpg', NULL, 'true', '0', 'false', '5,1,', 0, '2021-09-20T12:14:15.301Z', '2021-09-20T12:14:15.301Z'),
(350, 119, 1, 0, 0, 'okokre from master admin', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,5,', 0, '2021-09-20T12:15:05.949Z', '2021-09-20T12:15:05.949Z'),
(351, 119, 5, 0, NULL, NULL, '', 'uploads/discussionfile/4TH_Quarter_2020_1632140165646.PDF', 'application/pdf', 'Mayank Vadiya', '', '', 'uploads/profilePic/1546238296.jpg', NULL, 'true', '0', 'false', '5,1,', 0, '2021-09-20T12:16:05.645Z', '2021-09-20T12:16:05.645Z'),
(352, 119, 5, 0, 0, '<img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f605.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f605.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f605.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f605.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f605.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f605.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f605.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f605.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f605.png\">\n<br>', '', '', '', 'Mayank Vadiya', '', '', 'uploads/profilePic/1546238296.jpg', NULL, 'true', '0', 'false', '5,1,', 0, '2021-09-20T12:26:06.047Z', '2021-09-20T12:26:06.047Z'),
(353, 119, 5, 0, 0, '7978', '', '', '', 'Mayank Vadiya', '', '', 'uploads/profilePic/1546238296.jpg', NULL, 'true', '0', 'false', '5,1,', 0, '2021-09-20T12:26:49.670Z', '2021-09-20T12:26:49.670Z'),
(354, 119, 5, 0, NULL, NULL, '', 'uploads/discussionfile/Screenshot_from__(1)_1632140993149.png', 'image/png', 'Mayank Vadiya', '', '', 'uploads/profilePic/1546238296.jpg', NULL, 'true', '0', 'false', '5,1,', 0, '2021-09-20T12:29:53.147Z', '2021-09-20T12:29:53.147Z'),
(355, 119, 5, 0, NULL, NULL, '', 'uploads/discussionfile/image_1632141084556.png', 'image/png', 'Mayank Vadiya', '', '', 'uploads/profilePic/1546238296.jpg', NULL, 'true', '0', 'false', '5,', 0, '2021-09-20T12:31:24.554Z', '2021-09-20T12:31:24.554Z'),
(356, 64, 5, 0, 0, 'oui       786tvt785v              ttttututtutt ttutttuu ttddyyttttttti687yuyyou', '', '', '', 'Mayank Vadiya', '', '', 'uploads/profilePic/1546238296.jpg', NULL, 'true', '0', 'false', '5,', 0, '2021-09-20T12:42:36.686Z', '2021-09-20T12:42:36.686Z'),
(357, 2, 1, 0, 0, 'h', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,3,3,5,2,2,', 0, '2021-09-24T05:28:27.818Z', '2021-09-24T05:28:27.818Z'),
(358, 2, 1, 0, NULL, NULL, '', 'uploads/discussionfile/Daco_2081339_1632461389929.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,3,3,5,2,2,', 0, '2021-09-24T05:29:49.926Z', '2021-09-24T05:29:49.926Z'),
(359, 2, 1, 0, NULL, NULL, '', 'uploads/discussionfile/Developers_India_2021_1632461428483.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,3,3,5,2,2,', 0, '2021-09-24T05:30:28.479Z', '2021-09-24T05:30:28.479Z'),
(360, 2, 1, 0, 0, 'hello', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,3,3,5,2,2,', 0, '2021-09-24T14:01:02.741Z', '2021-09-24T14:01:02.741Z'),
(361, 2, 3, 0, 0, 'can you here me?&nbsp;<img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f602.png\">', '', '', '', 'Vijay Gohil', '', '', 'uploads/profilePic/1544614850.png', NULL, 'true', '0', 'false', '3,1,5,2,2,', 0, '2021-09-24T14:07:26.050Z', '2021-09-24T14:07:26.050Z'),
(362, 2, 1, 0, 0, 'have test latest feedback<img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f60a.png\">', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,5,2,2,', 0, '2021-09-24T14:08:10.089Z', '2021-09-24T14:08:10.089Z'),
(363, 2, 3, 0, NULL, NULL, '', 'uploads/discussionfile/big_ben_clockface_190677_1632492580533.jpeg', 'image/jpeg', 'Vijay Gohil', '', '', 'uploads/profilePic/1544614850.png', NULL, 'true', '0', 'false', '3,1,5,2,2,', 0, '2021-09-24T14:09:40.532Z', '2021-09-24T14:09:40.532Z'),
(364, 2, 1, 0, NULL, NULL, '', 'uploads/discussionfile/img2_1632493225007.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,5,2,2,', 0, '2021-09-24T14:20:25.005Z', '2021-09-24T14:20:25.005Z'),
(365, 2, 1, 0, 0, 'hello', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,3,5,2,2,', 0, '2021-09-24T14:38:54.483Z', '2021-09-24T14:38:54.483Z'),
(366, 2, 1, 0, 0, 'hi @Vijay Gohil', '', '', '', 'TMS Admin', '3', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,3,5,2,2,', 0, '2021-09-25T13:57:57.406Z', '2021-09-25T13:57:57.406Z'),
(367, 2, 1, 0, NULL, NULL, '', 'uploads/discussionfile/singer-step3_1632578517469.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,3,5,2,2,', 0, '2021-09-25T14:01:57.466Z', '2021-09-25T14:01:57.466Z'),
(368, 2, 1, 0, 0, 'test', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,3,5,2,2,', 0, '2021-09-25T14:49:03.875Z', '2021-09-25T14:49:03.875Z'),
(369, 2, 1, 0, NULL, NULL, '', 'uploads/discussionfile/singer-net_1632581368814.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,3,5,2,2,', 0, '2021-09-25T14:49:28.813Z', '2021-09-25T14:49:28.813Z'),
(370, 2, 1, 0, 0, 'hello', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,3,5,2,2,', 0, '2021-09-25T14:56:16.392Z', '2021-09-25T14:56:16.392Z'),
(371, 2, 3, 0, 0, 'test hi', '', '', '', 'Vijay Gohil', '', '', 'uploads/profilePic/1544614850.png', NULL, 'true', '0', 'false', '3,1,5,2,2,', 0, '2021-09-25T14:57:36.833Z', '2021-09-25T14:57:36.833Z'),
(372, 2, 3, 0, 0, 'hiii', '', '', '', 'Vijay Gohil', '', '', 'uploads/profilePic/1544614850.png', NULL, 'true', '0', 'false', '3,1,5,2,2,', 0, '2021-09-25T14:57:58.224Z', '2021-09-25T14:57:58.224Z'),
(373, 2, 1, 0, 0, 'working fine', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,5,2,2,', 0, '2021-09-25T14:58:10.904Z', '2021-09-25T14:58:10.904Z'),
(374, 2, 3, 0, NULL, NULL, '', 'uploads/discussionfile/yt1_1632581924579.jpeg', 'image/jpeg', 'Vijay Gohil', '', '', 'uploads/profilePic/1544614850.png', NULL, 'true', '0', 'false', '3,1,5,2,2,', 0, '2021-09-25T14:58:44.578Z', '2021-09-25T14:58:44.578Z'),
(375, 2, 5, 0, 0, 'hi!&nbsp; how are you?<img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/263a.png\">', '', '', '', 'Mayank Vadiya', '', '', 'uploads/profilePic/1546238296.jpg', NULL, 'true', '0', 'false', '5,1,3,3,2,2,', 0, '2021-09-27T05:40:05.958Z', '2021-09-27T05:40:05.958Z'),
(376, 2, 5, 0, NULL, NULL, '', 'uploads/discussionfile/big_ben_at_night_190497_1632721237202.jpeg', 'image/jpeg', 'Mayank Vadiya', '', '', 'uploads/profilePic/1546238296.jpg', NULL, 'true', '0', 'false', '5,1,3,3,2,2,', 0, '2021-09-27T05:40:37.201Z', '2021-09-27T05:40:37.201Z'),
(377, 135, 1, 0, 0, '<img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f606.png\">', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,', 0, '2021-10-01T06:40:52.119Z', '2021-10-01T06:40:52.119Z'),
(378, 130, 1, 0, 0, 'from master admin', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-10-01T07:48:18.800Z', '2021-10-01T07:48:18.800Z'),
(379, 130, 3, 0, NULL, NULL, '', 'uploads/discussionfile/1940441_1633005059_1633074513398.pdf', 'application/pdf', 'Vijay Gohil', '', '', 'uploads/profilePic/1544614850.png', NULL, 'true', '0', 'false', '3,1,', 0, '2021-10-01T07:48:33.397Z', '2021-10-01T07:48:33.397Z'),
(380, 130, 1, 0, 0, 'hi', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-10-01T07:59:42.250Z', '2021-10-01T07:59:42.250Z'),
(381, 130, 3, 0, 0, 'hello', '', '', '', 'Vijay Gohil', '', '', 'uploads/profilePic/1544614850.png', NULL, 'true', '0', 'false', '3,1,1,1,', 0, '2021-10-01T08:57:39.272Z', '2021-10-01T08:57:39.272Z'),
(382, 2, 3, 0, NULL, NULL, '', 'uploads/discussionfile/194044_(1)_1633080405623.pdf', 'application/pdf', 'Vijay Gohil', '', '', 'uploads/profilePic/1544614850.png', NULL, 'true', '0', 'false', '3,1,1,2,2,5,', 0, '2021-10-01T09:26:45.622Z', '2021-10-01T09:26:45.622Z'),
(383, 2, 3, 0, NULL, NULL, '', 'uploads/discussionfile/194044_1633080405626.pdf', 'application/pdf', 'Vijay Gohil', '', '', 'uploads/profilePic/1544614850.png', NULL, 'true', '0', 'false', '3,1,1,2,2,5,', 0, '2021-10-01T09:26:45.626Z', '2021-10-01T09:26:45.626Z'),
(384, 2, 3, 0, NULL, NULL, '', 'uploads/discussionfile/image_(1)_1633080405609.png', 'image/png', 'Vijay Gohil', '', '', 'uploads/profilePic/1544614850.png', NULL, 'true', '0', 'false', '3,1,1,2,2,5,', 0, '2021-10-01T09:26:45.607Z', '2021-10-01T09:26:45.607Z'),
(385, 2, 3, 0, NULL, NULL, '', 'uploads/discussionfile/941_(1)_1633080405631.pdf', 'application/pdf', 'Vijay Gohil', '', '', 'uploads/profilePic/1544614850.png', NULL, 'true', '0', 'false', '3,1,1,2,2,5,', 0, '2021-10-01T09:26:45.631Z', '2021-10-01T09:26:45.631Z'),
(386, 2, 3, 0, NULL, NULL, '', 'uploads/discussionfile/941_(3)_1633080405629.pdf', 'application/pdf', 'Vijay Gohil', '', '', 'uploads/profilePic/1544614850.png', NULL, 'true', '0', 'false', '3,1,1,2,2,5,', 0, '2021-10-01T09:26:45.628Z', '2021-10-01T09:26:45.628Z'),
(387, 2, 3, 0, NULL, NULL, '', 'uploads/discussionfile/941_(2)_1633080405630.pdf', 'application/pdf', 'Vijay Gohil', '', '', 'uploads/profilePic/1544614850.png', NULL, 'true', '0', 'false', '3,1,1,2,2,5,', 0, '2021-10-01T09:26:45.629Z', '2021-10-01T09:26:45.629Z'),
(388, 2, 1, 0, NULL, NULL, '', 'uploads/discussionfile/download1_1633080458279.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,2,2,5,', 0, '2021-10-01T09:27:38.279Z', '2021-10-01T09:27:38.279Z'),
(389, 2, 1, 0, NULL, NULL, '', 'uploads/discussionfile/Natureimage2_1633080458274.jpeg', 'image/jpeg', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,2,2,5,', 0, '2021-10-01T09:27:38.272Z', '2021-10-01T09:27:38.272Z'),
(390, 2, 1, 0, NULL, NULL, '', 'uploads/discussionfile/Kavisha_Atria_Brochure__(1)_1633080458281.pdf', 'application/pdf', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,2,2,5,', 0, '2021-10-01T09:27:38.280Z', '2021-10-01T09:27:38.280Z'),
(393, 2, 3, 0, 0, 'hello', '', '', '', 'Vijay Gohil', '', '', 'uploads/profilePic/1544614850.png', NULL, 'true', '0', 'false', '3,1,2,2,5,', 0, '2021-10-04T07:36:31.092Z', '2021-10-04T07:36:31.092Z'),
(394, 2, 1, 0, 0, 'hi', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,2,2,5,', 0, '2021-10-04T07:36:54.491Z', '2021-10-04T07:36:54.491Z'),
(395, 2, 3, 0, 0, 'we are working on it<img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/263a.png\">', '', '', '', 'Vijay Gohil', '', '', 'uploads/profilePic/1544614850.png', NULL, 'true', '0', 'false', '3,1,2,2,5,', 0, '2021-10-04T07:37:45.521Z', '2021-10-04T07:37:45.521Z'),
(396, 2, 1, 0, 0, 'ok, please check some new functionality', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,2,2,5,', 0, '2021-10-04T07:38:58.284Z', '2021-10-04T07:38:58.284Z'),
(399, 135, 3, 0, 0, 'ok  from vfhdg', '', '', '', 'Vijay Gohil', '', '', 'uploads/profilePic/1544614850.png', NULL, 'true', '0', 'false', '3,1,', 0, '2021-10-05T09:40:04.617Z', '2021-10-05T09:40:04.617Z'),
(400, 135, 1, 0, NULL, NULL, '', 'uploads/discussionfile/newplot_1633426814561.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-10-05T09:40:14.560Z', '2021-10-05T09:40:14.560Z'),
(401, 135, 1, 0, 0, '<img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f60a.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f60a.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f60a.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f60a.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f607.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f642.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f643.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f609.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f60c.png\">', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-10-05T09:40:46.784Z', '2021-10-05T09:40:46.784Z'),
(402, 135, 1, 0, 0, 'tuoe yg fff yfyfdresrxefdgfytgjhiu iyhubtyrtfh gyugtbm,', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,3,', 0, '2021-10-05T09:41:25.150Z', '2021-10-05T09:41:25.150Z'),
(403, 135, 3, 0, 0, '<img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f699.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f68c.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f68e.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f6a0.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f696.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f698.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f687.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f307.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f3d9.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f386.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f386.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f320.png\">', '', '', '', 'Vijay Gohil', '', '', 'uploads/profilePic/1544614850.png', NULL, 'true', '0', 'false', '3,1,', 0, '2021-10-05T09:41:58.550Z', '2021-10-05T09:41:58.550Z'),
(404, 1, 1, 0, NULL, NULL, '', 'uploads/discussionfile/newplot_(5)_1633599920400.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-10-07T09:45:20.400Z', '2021-10-07T09:45:20.400Z'),
(405, 131, 1, 0, 0, '<img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f643.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f643.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f643.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f643.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f643.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f643.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f642.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f642.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f642.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f642.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f643.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f642.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f643.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f643.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f643.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f643.png\"><img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f642.png\">', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-10-07T13:06:16.133Z', '2021-10-07T13:06:16.133Z'),
(406, 131, 1, 0, 0, 'Test test test test', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-10-07T13:06:40.234Z', '2021-10-07T13:06:40.234Z'),
(407, 131, 1, 0, NULL, NULL, '', 'uploads/discussionfile/newplot_1633612009526.png', 'image/png', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-10-07T13:06:49.525Z', '2021-10-07T13:06:49.525Z'),
(408, 152, 1, 0, 0, 'dgdg', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,2,2,', 0, '2021-10-19T11:22:26.757Z', '2021-10-19T11:22:26.757Z'),
(409, 2, 3, 0, 0, 'hmm I have checked it and it works fine<img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f60a.png\">&nbsp; so<img class=\"emojiImg\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f60e.png\">', '', '', '', 'Vijay Gohil', '', '', 'uploads/profilePic/1544614850.png', NULL, 'true', '0', 'false', '3,1,2,2,5,', 0, '2021-10-29T06:23:50.731Z', '2021-10-29T06:23:50.731Z'),
(410, 2, 1, 0, 0, 'test', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,2,2,5,', 0, '2021-11-01T06:38:23.171Z', '2021-11-01T06:38:23.171Z'),
(411, 2, 1, 0, 0, 'testttt', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,2,2,5,', 0, '2021-11-01T06:44:32.213Z', '2021-11-01T06:44:32.213Z'),
(412, 35, 1, 0, 0, 'Hi', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,', 0, '2021-11-02T06:09:48.170Z', '2021-11-02T06:09:48.170Z'),
(413, 2, 1, 0, 0, 'Testing', '', '', '', 'TMS Admin', '', '', 'uploads/profilePic/1545300029.jpg', NULL, 'true', '0', 'false', '1,2,2,5,', 0, '2022-03-07T08:15:07.810Z', '2022-03-07T08:15:07.810Z'),
(414, 2, 2, 0, 0, '@Mayank Vadiya  Please explain in brief.', '', '', '', 'T Admin', '5', '', 'uploads/profilePic/1545299996.jpg', NULL, 'true', '0', 'false', '2,5,', 1, '2022-04-26T07:13:26.462Z', '2022-04-26T07:13:26.462Z'),
(415, 2, 5, 0, 0, '@T Admin  Please wait. I will send document with explanation.', '', '', '', 'Mayank Vadiya', '2', '', 'uploads/profilePic/1546238296.jpg', NULL, 'true', '0', 'false', '5,2,', 0, '2022-04-26T07:19:07.847Z', '2022-04-26T07:19:07.847Z');

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
(1, '', 0x3c6469763e3c7370616e20233830383038303b3d222220636f6c6f723a3d222220666f6e742d73697a653a3d222220782d736d616c6c3b223d22223e426573742052656761726473202f2056656e6e6c69672068696c73656e3c2f7370616e3e3c2f6469763e3c6469763e266e6273703b3c2f6469763e3c6469763e3c7370616e207374796c653d22666f6e742d66616d696c793a207072697374696e613b20666f6e742d73697a653a206c617267653b223e496e6776696c642053756e646c616e643c2f7370616e3e3c2f6469763e3c6469763e3c7370616e20236666303030303b223d222220636f6c6f723a3d222220666f6e742d73697a653a3d222220782d736d616c6c3b3d22223e436f2d466f756e6465722026616d703b20427573696e65737320446576656c6f7065723c2f7370616e3e3c62723e3c7370616e20666f6e742d73697a653a3d222220782d736d616c6c3b223d22223e3c6120687265663d226d61696c746f3a6973756e646c616e64406265636f6e6e65637465642e6e6f223e6973756e646c616e64406265636f6e6e65637465642e6e6f3c2f613e3c2f7370616e3e3c62723e3c7370616e20233830383038303b3d222220636f6c6f723a3d222220666f6e742d73697a653a3d222220782d736d616c6c3b223d22223e536b7970653a206973756e646c616e64406265636f6e6e65637465642e6e6f3c2f7370616e3e3c2f6469763e3c6469763e3c7370616e20233830383038303b3d222220636f6c6f723a3d222220666f6e742d73697a653a3d222220782d736d616c6c3b223d22223e4f66666963652050686f6e653a202b33353932203431323220343434202842756c67617269616e204f6666696365293c2f7370616e3e3c2f6469763e3c6469763e3c7370616e20233830383038303b3d222220636f6c6f723a3d222220666f6e742d73697a653a3d222220782d736d616c6c3b223d22223e4d6f62696c653a202b343720393430203533203434363c2f7370616e3e3c2f6469763e3c6469763e3c7370616e20233830383038303b3d222220636f6c6f723a3d222220666f6e742d73697a653a3d222220782d736d616c6c3b223d22223e5765623a203c6120687265663d22687474703a2f2f7777772e6265636f6e6e65637465642e6e6f223e7777772e6265636f6e6e65637465642e6e6f3c2f613e3c2f7370616e3e3c2f6469763e3c6469763e3c7370616e20233830383038303b3d222220636f6c6f723a3d222220666f6e742d73697a653a3d222220782d736d616c6c3b223d22223e3c696d6720636c6173733d2266722d6469622066722d647261676761626c652066722d66696c22207372633d222f746d734e65772f75706c6f6164732f75706c6f61645f696d6167652f653539643139353461656639623365643161356533633463386534336137663038316366613965392e67696622207374796c653d2277696474683a2031353070783b223e3c2f7370616e3e3c7370616e20233830383038303b3d222220636f6c6f723a3d222220666f6e742d73697a653a3d22222078782d736d616c6c3b223d22223e536869706368656e736b692070726f686f6420426c76642e2031382c20536f66696120313131332c2042756c6761726961266e6273703b3c2f7370616e3e3c2f6469763e3c6469763e3c7370616e20233830383038303b3d222220636f6c6f723a3d222220666f6e742d73697a653a3d22222078782d736d616c6c3b223d22223e264f736c6173683b76726520536f6c266172696e673b73656e20392c2031343539204e65736f6464656e2c204e6f727761793c2f7370616e3e3c2f6469763e, '1541049277.gif', 0x646174613a696d6167652f6769663b6261736536342c52306c474f446c684251635641666341414f4d654a4f55734c65456d4a4f392f4775357a472b46594a4f3176632b7054566335515251435952676561534243625369696f59303230655536744e62536e49664342484f702f472f43474a764b534f2f474e4d3836464a72444c48362f4a4837504f4c4a58454b764f59522f4f655576536a576657715a2f613065665776634f4b4f5a736e635a71797056414267716752697241746e72686475736968327369795475466536694848476d41434e30674b4f30775350307775533141615130784f573168755a31795364325369663254795479793268326a536b3344756f3351436734774f683541796b354269703554477936524b6b7a552b5378555372336b6d7533334b6e3055793035464f79345675323430797634474f36354775393558472f356d4f6479337a46364854423533444b38466a423766474f6b6665376876617673652b686e3544537271546276666a466c2f692b6a746a6c6a2f765975506e4f714f54747374336e7049753332597a4d3634544936704c50374a72533770485738364c5737367a6138616259386250643872444f35627669394b3368397133617a66725679767a69792f3370324f2f307a38546c39637670393958732b4e33782b746674352f3330366554302b2b76322f4f37342b2f54362f662f2f2f2f372f2f2f332b2f7676392f66333539506273364d6a6b347575367437353466514141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414143483542414541414941414c414141414141464278554241416a2f4141454a484569776f4d474443424d71584d69776f634f4845434e4b6e4569786f73574c47444e71334d69786f38655049454f4b48456e79497834376465724d69634f796a307330614b62496c454a54696f71624e31506f624d437a41594f665142756f69464f79714e476a534a4d715863713071644f6e554b4e4b6e55713171745772574c4e713363713171396576594d4f4b4855737944386f364c46763267526c7a5a6b32634b6e547535416e3035344b3743684c6f3363753372392b2f6750756d6d454f32734f484469424d7258737934736550486b434e4c6e6b79357375584c6d422f714f5a7657355671594d71665574496c54626b2b666466486d446379367465765873463076514a4f35747533627548507233733237742b2f6677494d4c4830343554782b334e4f4761376c6d5867657259304b4e4c6e303564756f4970784c4e7233383639752f6676344d4f4c2f78395076727a594f436f5756462f5076723337393631706d353950763737392b2f6a7a36392f507637392f50464b6f42392b4142425a6f4947414c454f586667677732364f43444545596f34595155377164484367646d714f4747374457515234556768696a6969435357614f4b4a4b4b5a345542345963756a69697a41434a6f574b4e4e5a6f3434303435716a6a6a6a784770554b4d5141627034674a3139476a6b6b55676d71655353544459354878704352696c6c67544d366165575657476170355a5a63646c6d554851784d4b656159315332676835646f70716e6d6d6d79323665614950354970353579765966666d6e586a6d716565656650594a5752304330696e6f6f487331344f656869436171364b4b4d4e6970526e4952475371634352547071366157595a717270706a33714561696b6f4935704a36656b6c6d72717161696d436836556f625971706771717876387136367930316d717257433236716d7551444e7a7136362f41426976737342486c38656d75794c706f4237484d4e75767373394261326b6579314c3759523754595a717674747477794b55573134476f346172666b6c6d767575656a366c327534374d4a585a6272777869767676505475466d61372b4c6f486137333839757676767742336457792b42456558517341494a367a77776778725645664245453933634d4d5556327a78785148484562477543747a5633476c7935635441616f455a6976484a4b4b65734d725454626b786478777438334650494f49306d68557873655a6257484858596f5163654539557878634346726d7a30305866614d636362625a4178786864634b4b4845456b754941545453382b55425278746a5247334545442f594d454d4d4d4d44676767737778424344444450634141515252796a427852686d7748476d684b784b4372504d504e482f664e4e6f6f6558733073343933373156434136517a4a664a574466754f493935304147484732614d345955535278415264677775724f44353536422f3373586a33756e687868644c4643484443364733377672726e374d5177773948654745474851336d585a30435034477345317941347779547a697a7837444e77576c69517763434d6b2b373838784c616b666f5050397851677779637377443739713750414c3177634952786841327363322f2b2b6148484d455158625379376e2b37534e5943472b77757959594879696966512f50663839352b664565674c6f4f746334442f643047454d52704342414266497742666351416c742b4e4239344265624259794c5158664177503079304a6465466643444943515044426a4951414c6559513158534b454b56386a434b366a686854434d6f517a56734959613276434763736968446e6559777a333438496441394745652f3459347844754530434677344d494e744566434a6a4951426b4d59412f334d513848584d454242454172422f537a67414c353438496867444b4e77374f42454162706744524d5967427258794d59327576474e6349796a484f636f52776a59385935326c4941654b544142445779414178337777424f6f34454935534e426f645044434573764953424b2b49497054464538565733504643576e78666863673251494f4b635a4f6576493264576a6b2b567967415471613870536f544b557154516b42436d7a4141345355677845726c676379464b45466f73776c43563167424465515a354b42556343314a6d53464c584a784c7776517769655879557a4c68464b58734850424b71644a7a57706145343453324d41547269414868644768437a4741706a684a61494d76524a49374c59764e757952557a43316d5569384c7741416e6d306e5065694b476a4f4e734851797579662f5066766f546c5254344142613632533834484b467a2b55796f41474851426478354a3531574e4a79456b6d664d4c695a6741526249676a30337974477834464f686e74766e5030644b3070494f41414961654949615a676d764e7841426c79434e4b667063734153486267656972726c67684369365251356531414968364b685168366f56504d68304253493171564b58616b304b5047454e364a714445574236314b70797a77564b4f476477634d6f61426c794e516c6b77357633556731454c3749476f61453172564b69713042677739613177586155477148425762746c424365577a716c363542344d767a424d34476f504e4f6963555672463273617761566174694633735568494c557258474e7247546c4b41455051425662654168444f50664b576650566f413345436178724b425769776871546732554e4b6d4e58793971506a44436d4d7069736247664c52676a2f6445414e304872444454724c572f4f787741695641697873396b64597359355641666644514775587939794c6242616b736157746447664c6763734f5377393437613132755263444d675248744b33527159524d5731486b336f2b677a55327665686569774a6a4f594c72776e537745506f4465583733424274764e4c2f654d6f465863674a6331574b7751656265597543306d64723049547242416169445447735433775a47564142582b4b697338634347762b733177363254677939374d3454554c474e47414e3569414c567042775368654c33356a61674d497578697547724475724f6741424133622b4855762b454a7648755961346b37496673613951496e7670396f5547376d3175343370445344773469597246514a56594b6d71335044634731735a6445546f4c325a34334a703968516a49786c33414259683835452f69595134324c584e446171786b4a6a76352f38306b35554239542f554644462f357a6975774157467977325857444a5a43594462736d4947715a6a4843676345726349454e6a4e41464d734342776f5565676b782f49414534572f7166464d447471664b4142447837476e517865454e75375041612b587a5a7550647a774b4356572b676a356748524137514245526f4e68362b576d51677942554b6c4c38337261307267437161795178452b5465795167765932656e6a4e4d4b31796b7156523767786841454d586d4d43454a67684243447a6767524361774151777443473458776c305256666436694f4b77597979356f4b6a62593167414d61304342546f74627972435145716b496f4f4b793432735633675864766b34545542486b6d7a4a326347614575623274624f396735306b414d634f507a6845492b3478485041417961306764315a4558645079563175454f4c6169596f324168664d734f6630646a716d512f2b4939377858766b703761776f4f37645633735673676874734176434944663361307031317462504e6734513258754e4348547653694f33774858536835786c47747641776b742b4d677248496a595843444933774244737456676b794a6b456157657832564c722f554736517538302f54334462352b307541375341356e522b38357772665164434e547665363239336f4f6d42436d7132693851303633514b73686e722f3673444563624a4143613374676b794e305057764f33364f574244376138737538374e6e4a75312b73634850355837337a6e762b3835376677526d794967656d4b322b4c6776656647324a36624d5a3651615a484b4f586a5a7739484341433755572b59504f566c2f67497a4845595062532f34474d4441425954376641647966303050514d2f38356a7466364579513646524b7a2f5242577944312f544e445445653332692f4946416b626f4c332f2b4e306f41526b6a4b7665375437384c4f69775634452b7544576359667647726e58446b7a2f3375796e2b2b2f76662f65534649507972555a33723349325859527a706a45464f497431706849464e4c4548376a393442714e414631685368775148627070323877674856485151646d45416254566e2b63783339456c3338695749496d4b48464e674846504559414343476b466944546542314c6378316a6e686f4163414945342b41474a51676378643447374e77506742684a3155415a4c38414d7963494b6468336c39735878493249516c43415a5673516343754555542b494b5045344d4b4e594f4c525159793151556467494d346548743959676635356f5070427751716d42463651415a474d414e4f36486c4b7942644d2b495a30324877366f4852514959565461465a573644797642314a637746726146314e63384958784a5146383945636430414566344147432f2f51456b42694a6b4f69494876414248634142484c414245304142757a5a3746464346655a4948773261475a686949486145485838414464516948726a4748712f694b64386345564b47485577694b665169444d61566a713955474d75554648794262464e41425659414661694148746f6752655341486136414757454146487441424774434a764f594266584a79704f69444c3643424759454859374144734a69457266694e346b68334f30415665724348466a426e74336730574a6851596342617135654c4868425a45304146366f67556373434d4868434e634159423576636d3758694e467a674547674548716a694f64686548652b474b434e6d514436654e554a4548364869503636677941546c4f4e62646138516853597a4350634c5542782b675565614147564d414230766867484b416e6257426e41726c374c4c4233457a45474f75435164616551657347514e502b4a6b4c346e465863776b52585a4f426370546a764a5742757055474c7742484556646c65784231665141536335585a72324a6e4e676758676d4f7a637742456177424633414256377742562f6742567a51425575674f545867574d54576278584242546c5a6b2b47346c673435426c54686b7a2b4a4e417349557132335747386755325251425845566556797842315451654e4f566b6d2b6942306e6d6154425142456f77426d2b675a5168785a6d62674255545167315a326c784942426d354a647a615a41446770676a6d67417a75516264764762563041426d4677426d6267426d3877423269324e4a5844424549776b3238496c314d686c334e704e41634955714b32576e6b5a55325a414258333546586d4142594935572f37344a6b65415a79347742463777426d6c4945584d77426b5367652f6f46417937494547317766356b70644a765a6d5550336d6147706255332f514a716d695a7171795450502b52423530415a4d34493149434956546f5546547941613365545335715642347146613943564a75414a7877355a6643575156504b566e5532435a6b5548676142674e475141614f75593174674154553256734a4f424632344a3762535854644b5a72637867536c655a7170755a70316b4a346a6b51646e634a4250534258794b594430575a387255344d4b31614164745a384b39515a59454a78694951634f4f467353454a4a624d676352716c307338414e68414b4f6e61457349796c6b756b4a385030515558436e486771614833776872696452563463415957756e2f774b525570616e6f72797149707734554b31514b744a614d4a42516331436c646947425a33554156754a6c734169695a3438414d6139674a457748354c3851594878567449554245562b6f70504b7037553171486d755a70326748454e6b464e675551644e49494a5a2f786f56573870305865716c4a774f6d435155445979705463334146635a576d596e4546412f7057684a6b6d584a42684c574145454f6b55644c41455a6e6c554d414354447945477a6765614768716f35666d686331436f4748476f7266466e57344548544d422f7071696c657869706b6e6f786735685133734e615a4a7050644b4370634257565a4b45476e377055454d436a567749487138706252624362564445485238425768476752534842334f5641444e6b41444b4841434a654144534b4772666a59577636702f576767566a3470717846717346634f4c436e55446c78705464714147635157743064716d6b635770576f494868396c624d6f435756364662527a55442f776352516d423035556f444a3041434935437847737575523745754d6a4957655443787a79654c38546d732b486f792b707051514e4376437355436541437763505750593345464241745842662f614a582f59577978774245543646486a7742646b71546777374553597163545641417961677355713773556a6873582f4271313042423972356553517272504e35736868546c4f4e454243796255415330426e456c73324f426c4a49314156347942304672565445776c464762734f4b30736864527441366e41786137744861627352787246453772463144624659767166465872714874345946684c4d63734b545875717244466c7158495156785170466e6b676535483175453069616233314136363646586e514265417153693577716b5472704568377436524c41303372476e334c4657637773696736754956724d596572532f4f71574c4772537a45414349304c56395961466d70517330786c73465a79724a3246424e653546575a416c5534307536487263446151744b5262757166625a59564242367737465a636b67495437756773444279436c69377a70586f442f73416478566278683859755256515662386d713878514c655778687a5549614d56414d524b784771534c66506537386f67425351456868654a685a34494a764d317752556362326d6c3733616d7a427a4146495a2b6230675a514f416b4164774251474e4951652b713151647343553575316376734d43485951636678306773594a6b5677514d31344c7a3353376f6e6f4c2b7530623969636157664a38445736376f487a444230594a64646d302f38436767565046495334426a6d4331646d6d795632384b4d7935514a73697868346f48574d5a4151625151515965384c506d384a4873622b4177634a6834634b6542384e535163424d5a38417a444444506c464463796c69316d30732f49424454366b385534426777473845453243534b6836524872426866304c6b4246414e426142452b414d58334b3856475163562f5963566767635764703856527763576f357356662f2b777648355650537070575a53784b525341514b7264555164775978626c556c48736b644a4332494e56376b5545474c496b2b4849775265387a484b4b7a43306c735968487833516a44416536684d6935777765644379383474576b647849584173496d557853477641595a50757357474b4e567355433779675a5a75444a73454f514848484b714779334a71444b72434849587947336e76664b4d547946736a7a4c43484f6b756b52414e7a784f544177496b717455472f415962667857774a736b6444444b3231635a6261444d2b7053354665484d7a36793030547a464b32775931747835324c7a4673637a4e4365504f6a5853373453784f695a756a35767759655a44472f2f536d544b4c456572584c6c654547524f77367838775253584450646c734353504574725445785a4e485064386344734b7a4e416f3077387578454e6242637563784943586944544257716a662b6830457546766b355342797374546a5851733470683065637a7952367830527974744235394643444e4769493946695274647961647a514a3459696b4e4d42664e53476438304e4445665961345642663847423735566b39674a584673565a3962472b6933505446417a785a4231455764735354773061367831474c52314858333141413968564939316635533157556b31496f4c556c346745443973775a44686e3239317330756942386962554c527031736a4c416e4f7345554851316b6f4c3179467447434c4c66485a39794875593133724e4c3474645268544e7741716c69312b7456447234474d3536324535796e3155313272554263362b5475423878325a53647362663845556b644748496446706b4e6570734e46596873584a373932665153326b353042433464553752353269614632497742746a624c4748754151733334424a573469494445694235514256542f514979477042687547314e346245446a62514f35665247326664732b6e5247374452672b3968562f79337a6c434e576d56397a474c532f493355515453746f4a31572f4272465451765269357939714663554a5934414562514145375045636f315146556f4161376d7855764455326c66427432594c6b68396369536664735a6d3863693864352f456439654d642b6756393953305535526e642f3851706d7975397767745a4f47725652682f526a694331633148685a725141564f5756496f70564c6b5378584a6156584d7a4274343441576441774e322b684662344f456a6f4e59654d5155395a68676d2f6e6b6f4868557166743873376a427551415a6845445649634152475141524759415248734152633841566b34415a51666839345541634552775a694d415a684d415a695141617043516534716855756e6b76425368356159775a6934415664454f5a6c54755a482f3441455865414664504e6f62464c68546e52734d3235534f6434594e2f35574f4e3056643641475439444c4a695542485841464577345664724454755a536b77444548586743364874486b487337684879486c7255486966687572564a486c544966665739345164744147586d41454e73445872364e6f52444279375a3064654141485a4e4146526d4345424e30364c794144507942795a4144725339486e6f68545934494548627a4147536741454d6d4448334e4d434d6c4145537841477248346c6b4e354575336d6d533158706a4148422f396b56636c41466e67355845764142416c7356726931542f513068726e37623651345373733461744d3456566535354f6e44726e623372446d45485a4c41454e794475547351434e58414544426f656455414753764144706835414d41414558574147787734534d35425137617364623841465179447354385363413938646576384142783349425576774e554251505465773832397a4246337742585554354265783769536b6761744e3435427836622b72465a764f4151302b5752714142554b66464778325644465138765952384a5139786952523843566a4750484b66446e4138464e595a4e714242335477426d3751426d7a764275653535795a69422b2f48396d32676d6e4251422b6e6447335477425558773857586b416b44774253442b47336a67426b717753444c31416a2f41425679504643656654786b3948486867426b694137654d30413072512b4d517842324b6742454d67413934385534754737694242394179305a306450365a42523445776c746c42784231647737394e46415852464658524138654f5538674476354a6f66456c3450474638457238386e6f6b69423636686d396f542f426c2b41424f442b374373513756657042474867426c68764868766642555151374b45664f7a442f55414e416341547146764f5a6f5164694d41544f6e3141765541526b4d50575834515a4c734e384a4a514e4b734f524638666a6a46506e4138515a4b41502b584478426436414169574e44675159514a4653356b324e44685134687a7768435273634c695259775a4e5736384b4f4d494754305149623768574e496b527a73453151786732644c6c53356778597a34525764506d545a45725a65376b4b565043485a7842613936354d71486e5561524a5a564c416b6b666f55345665546b366c326a456b564b785a74573631755758455637426878593739366f6172517a514a314b356c713562425762674f6d65436757396675586278307239374a73326550484d4272424b7368724f624b3453745946474f685573574167514f52447868776f73616d4651755a4e572f4f48434c755a3941493333677034714b71795259316a49534245397231613631327943437077654a302f306b59503553307551726264383035536d4c634a6e3437687344667958485734544b6a2b504f714e62674d2f4630522b736b76797255487a53506d78335877476c3851616250642f454d3458577a59446b385668704532654c4b5362472f534b5343645376577a3948442b4e5a623941687841412f3857556b4d4441524e556b4b554a726969776f4276717179714d42797373734179794d737977764e2f5361757644742f7a6a79792f41354242736a63494d513277784b6c723849345555524a42785268706e724f42474843754951414949494669517051494145484a4949514f495169544d4f4650534d77736664454d4a357954556141596c7a4772795371487347474d4930365445794955687771674453396665494f49464c2b747a59596b3579457a7544534f36544c4d3946347977307255383545787a4354663973384d4c362b59453777637a2b76794e4469357345502b5571687138534f6b702b685a396f614131666a797150304f6838734453533747556f774d664f5255567151376b4b4a414f396862464b4962654d6e55564b7777316c425573446e337a38454f3247436a7878425152533079784668757234676c695066446767773836364941445a6a665951414d4e4a70435741676f6b3444485555624d564d414169757931676a5965535648497a4a736e5534773079764f6a6930632f71384b494756616563377457673647676a6a43344b4461304e4976534d647a777a354b4e584b44694d61434865384e5963632b437432696769565951484a634f314e6c534e67563247502f747a75496976752b484f6a4c46794938364f54344a6858614569465253476775545146695a4d51345949775a6466637444434f3743516f476165583549414336444d2b364c6b466269512b57694859703156566e336a79754f4b4a7a707756674d526347332f6134476573395a6151514b363756594150787a53596c7a4f796932776a6e75564b454b4767792f79346a4d346a7643335a42654f6141317067764b41677777756a4c6742686c58764f3075504d42516c47714d617868416337345471514b4c7477352b44675976464758666f4453416962382b4769543872496c3467327251634b7a454331667732466f6134652f53487a506a75644e79346146556b6c65654d6f5757745932626449446d7735526b435579755559344f74742b5967654f302b373967466a48632f57756d6c4d79776a72707770674b6b4371396e43756e6a7575393870534b2b4a444a756873636e577a4f7a6b356a444469794e2b344c696b496542795977694954322f68434f726f5056634d4a59616f41553254764f4573647544432b32433367686c30626e64342b414c6744766963476f444d6551615a4178487139304469334b42575773474445694c572f774962414b454949795268435531345168536d63416865714e794433764136444e374742624b6259454c4d594c6759626b514743715264764752516b44316f37514d314c41675674725942433131685a393772475155736f7877377a47315252794169307141587662464d37797a446b776e3273716557375446526a4e3454515069474a4142774c61523835724d412b6a36446837333137572f4573514658334a43354846724542563451474a62733449597739453847467a774a443646435141666d38516572593977624970524834724141436333625852363449455649556956316f6f4e4b486353417730794768304957306f4d534142684b526b6e516557395148696f7a4d67524f5071523261617042516537677535634e6b5968334d49725771504367505878676a466d44514257433568737945453241565a515a4762436f49533175525136396a496b5876786a475966396d733266674d794d41416e424d684b7a526647374d7976363651495161595049305038784b42516b5a77787377306a78304d4d4d586b4f432b6435356d6c4644425178674d434d6b394d6934505854696c4b366b79413156617a6733774d6d6878584e434646694c45445630347768474d59415169444145494e78686b5138505442517374314b4e55655146454a32694878343055497a41595177395664514f444c4a466e48616a694662594776414c4a675762616e4f6b6566724f456b7347556d54497a777a4f6c783556703873536132634d6d54353071717135315530676755434d624f314e4f51505a76427043546b417636474251374b4547644f5953424956387a423737354c5a46534d6870553267424b567736426b76536177794e564f705557744856307065547158616c69673167654241353239537462483453484c765331734272355166347352345a2f2b74582f43484d565462782b454e4f73306253476561426d7a7a68514944565937366b3830774479584d50516947566e714346726731484a456b327335494634537630694745643757303578303477434d4b3142736d44564e6d49467368467a3745334d594c7147736b4376727245442f5242477853775a495a2b5a7245466758305747745334576670526c324276677174325431474232424b46445a4d46376e5832615a773477504f3947597244426f396e42434f32315341336b6d5a425a65716b49426845747a7a356277796f553732626d7751497563547571436651324c716a7132417357746c714774646131596f457456414c636b36566172616b48356e42536f69705641796a6b7431596c5a3033776b4e31464a665168656c6a4364464770424e68776f57503744596f626b44765347437a7a5652313063587674697a63786a4a572b474945765154773435504130625474752f7a41766b6c6677417455657a513152476e494d564679512f456f7066675870374d762b367a77314750686c4649696f623667673567356269674a704249305953725a6c4344504d44524d5779786130736759307579544475464a416d7632636c444a4b5651412b52636949325668696b6542427942495341303767384e323777746731586568594c572b4342793455314b387875432b5a6d75746b6b31685a5a6e70414171696e6f6d4f44514e7255564f6d3062384b673656566252416c6648646758594e3165467a523649566d576b42454d73744f61665a6c3163756876316e35706e69663875575a72446b32704f3562654f4c2f714458514f6935327a3067476b37506c4466565a3274324f69577a4d364953474748696457324b73716b4e706b4449747536484c6a596f594730396f68644d446a6557565158437a4e416257787a6f674c7a4a71704f707962337864687766396355547a776b724267764c4470494d4931516f534639306b50522b41334339366d4546375842376f456d61312f6e5a665572556d41304d7135773661387253316d663062566157724267364d74625771447864705177584f32613675576b2b65634a522f755a674847445678456934545345534e435465534c5a42596f4753353675505763577130514d7a53357344386f7377756c7a75385836507056634b4379777a7553454474346e53713330303465356974326a425168346c69714132466a6a51523541794c6a37654654515470654d79537962673164376c6b56746c4e796e614f637a567868657363752b2f4b427753486d58356e3555345270383573485075645348644c6743554a75736d45414b2f434f57423148306e583677734336584848376f7636646b44776f6f63655264704d6244753531466b4337396139484f4a774e4d6e6530437a5535646d676c32692f2f38675075576b6a66597064725a56556c61594a774947743574357753755366793753526238746c4b4d467771316a46334939355163316a3843426f666c44336b2b5358612f6c414570743974626c4765716764684133413166306a467a736b465654664946396a7431782f4558537448526c693647314c5856574f42496975514e72692f57474f426c6a49554d7a4241554d732b514c672b332b4f496f7473396759744149466737712f4f3947334135755973582f774d45624f735a356b4f615058674338644f5759314d4f497a712f624e47416b644d4b716569594b394f2b4b3647443776732b6e414351704969416d30734138324e4250774f3338504535396e4f2f724667354c30453173434f43675973797545696d694c45396863417566704d424446534f416f7a416a576942303373514d6d42415545736f4e3950436a554143436952446a5267432b6a75504e3769362f3169727274754c6c34736a694d666a6d5247556d614c776e676c597737676f4d43444d6c6734414a3677344f3453424166326a77537570672b344c417178517668337377522f38517734545171384a674d70705036743650366741716f695250594f774d59534441513763696a7059766642674a3456495056505572672f30447a634151367762774149686736627a4f686949714b46427734786f786444516733725478597367676b4d306a7a5a4577787a44736e687851704d6a4c6152526737766a6e6748376a53733451556e6344357259436954554d6b523846547459524b6a5941356b36436836387555697378747669755735366f6f4c4152446253784b6541777564614346767a4f75534469333162464262414e3449415149647a675648556a6a656750544b45415355736b4155455268704469426745526f7477774c6a41677946675349326f78776542417a634d5266384f63594e345361396c72426b43795a696e655562754554626657494e774e4d63666759426f66496f38365a6735334d592b79514e766649723851497078724b3179524d6d6e436a537075735a314e454b73594443453862794473414d6d4644742f2f41794b6935682f6f304b786f306a746d494f4c314d4a3773354173424d61584e41675a6b3869693859326c35457143383854746f494d6230384b7341345178694265744177547034356b4a594a673165494a693878344a5544445841446d643542514a734c796767494f536d55475972424153574c776b67496f56664d53627134433876433265374b62312b386c4d314971795a4c6e6d65515051637a686531496f773642694b564558666734486759363537424d735675494572684932416c4d69434a4969686b306948504976574a45324c65414841684130377945613059774868694263657572436538594158784a4c2f50626743442b41374a7349436b6e504578655155446542446878684468486d423077784d2f796742776f534b4546534b486c544d35585371394a4f7141796a43794d794b694977594a5673334c5977423537774a334b735033514d454f7168416838764b3338694433704e4e697a42442f79424c695552466849684e594d7a4d73784344565578506666774e504c68502f4a77544a54764d6e704541443767437539534f4f316744714e45416169776544684445312f444e377251556e78514b414630556f71524f4e37484f6d43764d70774132704e6a4f442b557053765157385778487264684b684a4530557450464c6d524a5743794f463367554a6b5044456b304f546c78516a456a413762684e72747734684c4252686f544b73336944487458413959774c2f6a4e5351646b6742395561434b4141446e67434b7267434e5a43444b73574a4f35414477366943443943412f354e304b677159554e414973327943414133344144443146537851557a5a314b6768517836416778486a784e52507445784f3454714734677a6274435156497a4266567068676c6b67435955664e7878366667764b45454248354551796e63697449546c496d5a523131635464644953797a396b71647a6a614f5579433530556d43737533615a54507755304e635967774974316473414752326355776d6767416e594141376f674138776c69656f67696f496c735534566d42706b53633446716e524141724955473371552b55674e6a474367413267416a5867777a78516779706755536161674f433043666c4d452f6f6356417370314a6a7a676164776d663159314e72697a6b59646f3063396f344f51412b4379414b306f785968686765454378682b4e433264374c6b42465179674e44536d315659793467544b745562426b486e6b45532f3138534158463068615152662b446e564b4550516c55793956343754446b564937733542344b7141493462596934544e546943644762674655765554707a5064664655316568714a54395741424737646962676742726f5a5a35485a4c4673566667326771577a566a6951464b75324579697259385a324c3352504a77592b49456a3649497643494d7843414e31556173636b7458506149503449384f4554416a6f5a4568426a5174576a52775873414569554149766f4e6f782b41497551494b31715656426b594851484b436d545672775943534f78646e62556c6e59324675746d51436777596f396f414b554a53612b68496738364e6f30476232584c5a415469466d61444243626656644a6a41444d7a5a45637152484f465946684c6459574f565a664b5977544b524535384973573867504b4535495842467172577469464b452b384259384a6a4e4c5a62593954505975424c5a6e33474150484e516a2f504867444c766742755a575346784456425a744b73584e436849424168717a6473334144786c5756467667424c6e4144507151444d544143675979596949574e336233643634676c6d2b4a6233506f414472334c773057357764324b456f54575553464a6b66444c6950477178385753794533587961335a6d78575148746c5a58705557614845575a766c5659413157447943577a77336478526864776a69524e53675276394344764b6a67436d594330464464315733646535334f687868523854304e5134534c504b6a464544364a636f304c6543795a466867434d344264544f3043355a3054473444685335745953474942474a43424772694247374342475969423653574f466a68516771426669647a55724c43447930535947664143493259495053414449436a65396d43423274534b4651346c463469424772434248363642474d445950484b35386a5866702f6f412f78742b69704474475167417a73395941322f566d705745434f6456465575373379624a5832716a676633566a3872394969746f594d52496b644946444e524e332b334941517475354c7241344d394967395546414e50616733734e3136414932784f2b316269343230303243535747692f49696d686334677438564363495a326b564a346250497852793267535077416a4f41677a4c44412f587841694e6f34744d347649566f7953534f69362f736d427367673245634365654b6e42702b6a547159346672566a5446776733386b727a623467694f6f446533436d444e47593233794145554f6a5778756f6a6f2b697a7a6f794b325a67473565434531654643445134797668597a704467543957696b444f6e6a3677484231775a45647541744351354e586c41344f775a4f44435a4a786f5431654b6753465167693851417a49514136745641694d41676f374b49565a2b697639555861775775494659486f4f466274737551494968734145793970495252745753595145697946326230494e4c696878526449303543476b7065513879714675466d414d76494e37696d47694336465174584f657a4d414d724c67345a574d7573634150636e42506d6a59754b5069415a324130505067673643494d694d4f464d57707961314f5a715463486b344b776a4b6c6d75304a6e752b646961634f56415a65636d515948464f344634546f7035747070365a707837786d634c317564496e6d522f42714a4c316f6f535869776234414c6b4e5167374d494d757549476772672f6f33516f516271673645594f3668614d774d414a6d4670532f7a6f6f745668555a63466d746d494e663742676d6a59764e5068324157654f446d414d5a506f30574f4758573545706531676f393047575755774b61767253564a7071574267314c685a303673566962514252567871442f466a694971386271377047416349614e4c61305a447844746d77677437746c446d306a734e4e46617330344f476b6a727455614b747359564e4c4363485a44727564376e53523438506268587236344a5438366b75706e73686141444c334274685048507255686e67374b424d496a74673841444d7a67543242484c324f6a7439706973304d413071766153466b42706f554461413349424a5542743776414f71766a6168594344496661363163364b4b3758734c495955393536546769326e44592b5868347069376869444430397734425a754d6471413876344d4f56686654764537375669447565775a7359614959466156704a3775376641423635355a797232353757616337766275764b4472754f426e796875384f7944767256687156496f424c6f686d45784f44383159564b552b5a6b574b42497442746b5a69446c4971633734574c43786355462b4476733269442f2b37316b735065436a754962433935675357346371324145784d6d366f55596379313854367941677746766a2b4a376a552b6a4778455855646870675467506a54786f4946646947594f675752517648676967676e4e3244584c576c6b672f443272646d6f3855435363584644765863653367385a685461782f66447759416375346d386949486a54575935445134434362584375694f6f636d78373465774a4a676d44737947697230324b434449634e726861565770634b37676334515274642f6775704a576235776f557330704167626e436a6f6f62593241676164754134622b41692f774169376f3969373464694f6f63676c68415264346763492b6a62456c543454527a574c6d436a7749574f3964734677766a6839673971796767303748494c4b6a6c4563766e676c49334e2f6f48574d7245426b76486a3931694d2f4f556c41764546476e4e684e34436b64504376384f4f505861436e4b3847584a56747773685948565868335867576e47496b4f3859556e426272346b333847384a30656d674b48484e7351457546777250354633516b4e31466b514544507773364f477244686f73336d5043562b5854594942793436764355475664474b34673873414d366d414d3463494d32574769333759496c4f4149694b49496245474d476e49466f742b4e317a2f48586d4855766359464276346b625878342b5567347853484f6e50596949372f6561365143422f6f314b7a785959427930583578544e6767686854384b4639342b4770374f4846777032545172676f666776736e696b3459474d7634754e6a2b4f4f4e77674d414334323241714e7a435354336e71686f414e786c354c4f31676f635071415943494e3268776f764f50666247507562614150544e346b615148323471414f6444342f54506775614a356f6677487a51344a65446751482f317a657832673937356461444f6f43444e3267444d784344747556324c766832575835716838434432482b4f466a426135536a6252534636522b747a4c35454259442b4c52344d6b2b42353874332b5a445a6a30317842346e74476441766e6d6d734570694e6a3839734439766a2b4c76352b777741384b38652b55427269354b514149514149484569786f3843444368416f5846755342347948456942496e3475444238434a435067413263757a494d55314244425a476b6977356b6733476933565773477a703869584d6d444a6e78717a524a69584f6733526b304f7a70382b57506e4269502f4378716447614c4a5861454d675845355368556d4465624b7677523965674d4f6c533344717854343270554a46774c756d45423969774c4a586e477368553452776d5a7467667277446a624d366a6376417a463250584a596f78656f563336466f5778564b3452776c422f2f39514a6a4e4e4f4563574b617853554d2b4179357379614e33507537506b7a364e4369523550325045474f59357850537250657344593155772b735a772b676b704b6e5a4a714e596650753752746a6b68484368784d76626e78456961325752304e4133534142394f6a536f552f357a647368786577544c61625736504537414a4145525a6f736a314a753364786e5858445259313367477866715a3870772f48512b324274763367736b676c396d474947313856394c4d637a4248304a7a784543675334624a425153444d72305149494956476b5455663064594f425965587a48347859594659526a68436943324255634c4a4c356b78477368416f4c48694372535a454e6c744e6c3449343435366a674142566545754963454f334a4741576f754772544842454b616c6c4a364a4c5a6f4a4a525247685463635655616c78785665354457675544505466646c6456493268662b64646d5657424a73633448336e52306a6c6d5a655844544c3264414d634674354859677450746b57476e44533534415565466461786f4970644247595667533773463655623870464934566875394d6d53433261497956385942487078615570384d6169456c486b674769474e6263576f34684b42526f6e484570504b564f704179796b354b3632316c765a426b51685359657341454b6a4271554271514d41725a6d7467354769454c5143376249685557766e73434352737065566f50674c69355a665368636e7352554b5961535a336a753268706b64736a75656d536565314e5953724c2f3270616f56367a43446a675871393065354c644961597159704736445567675378594b7559584b74367737715175544d5574624759514b4162444363564a34424477516b6b486f524736775259644c2f5335424c4249344f76537751544a53697a4b4b63387141525636396e622f52354b325073487442796e5066424779444c6f514d632b39425145743043366e6c4d646f45727947626262515364477a5174352b713132346759314c4c6b666d446b51657569666c316572494e5379367234774c7932584879437530304958464665614257345241364d557567595a79436e65456458494668316c794b73793059354c2b4a7a625444684d34773246696d70453367324b4e4e5a696352715339616d4a6c347a555174537062666a6d4f452f78716e52713854724148743349455365774547486c4d34733538713937577a30412f3631355464347a47775542494a373330366755352f5452464f384357423955635164466d316c724c5654432b527851656f68345a4d7768785945314f4767506747337168496d567934553367443439664c50312f636d386c73707774444a78375733376a5a3766716b6633337774655852733567444e376a6c49667a455259682f335355656f7a6172747349556a6e4d456243416f6f47414230446e6d773777796c72635767334b63715551784445494275693749464e6135376f714c55386f7777714e625153536771524a4233635962414c7673754f37314e77686542735a33726d4b5a77463173595650727071516d4c67576f5530465a6d4b542b6f46576f6b53484645556f426c736a45417a7142617a7252576747584c45442b4349454b5178795258337a36534450747663664c6a434c446c47637a2f6d61596b50735966465364574362713470516b4145617349317531497a6d65724f4844394b4b646847544178317446554b46354546474671516949426d69775130614a34684e79614e6e4e676549455a4a516159424559516f6e73734c55754241414d4c7961444765594679763673586f75416c6945784a63584345334b434c435430762f2b30774c37435555505831534d695a615668336c464b50392b517547586a45415679436f5369482f6355674b42624f424c4b4e324a5149716a43743069424150326353732b2b4272434774386f7a576e324367753877514b76464d6b7742684b4c537776706f34705374387478466d514c684b795345706b79757339415149474c624b516a71516a4a53455a6b6b6f344a674173764b5243735a53304c655a6e443947774a4a547a6b447a2f487a4d763863736e4b445345765172735a6936667763344f4651696d69424f4969565734674a79414d6b35774c3461526b6c4b55362f5032484252766a56764d6956422b71644578464c49684c7a3341354b57674b6b4a6f3264654d543770416144746a4b6a6a793741736f6f6f4e4f4655444252486a3071494d783554754d7755796a7239417746434d4c495270727767764f6b35304e30774274384269384b424c6c444a69336754376e6b6f616a30613671552f424d68496a67476d484c2f3069576e344b4169744461466c504d7861635477674562385445346f576952524441794a564a7941556a33695a4e6f59352b4f766942587a50774a4e43524e4a644643654a564e4f624b337054544e4c774135306c436c34744a5544493561487039624b57417335586249475330366c4c7055346a30304a42554b7a41616e434d7746565252385473426f5272634b477131547a4b7558434f6c61354650512f696d4a5751776d6b7873416b4e304b4c58565a7831584e5372677a78507a526c624c4c4b654248476b5568677168564b5958507a52373556566a49766f43756e3670417a2f5043514b526f6c3051784f32544f36754f71796c4e4d7366692f4841586532425a753145697266754d6b726179356b7651535337336376794e72574375653147496b74614c777045425855566757417a4b317548354b4472626f5175414a6867334431346b4d477662535a4a4f71722f3177537936416249506853355a32504a34555332666c4d6c3248565a56415963654968456d6b6f775954397a3368375a6763444b2b61354558747862713662457a7159396134315a7070465a57526667624178763161754651633669784d427a2b706d544e735673547a4145434c6a3536452b52742b4347657a67693854734d3249654349586861574571596a6a444f4e42795533784c4c6963514a4173687a6f76374974526a5a756b4274662b423153624469563470755a56424d4f584b652b6544596f616c636a357778596c6356525144375a3735494f47566a4248354e6f615372766c53555a34504443694b6b4f5a6d36494b56646d3430727978725733316771474d5a7261314d7937544f4555734444486e6c664e4c5a6164563567634845695446473275795a4e302b347768653238304e614c42633971346e50413748436e78464449676378624d662f795a35654150394b496c45753639547a676435576d50776677444274786e786c536d4d664e6d794d4347342b6f576161577564544d694562476a2b6c526b69676b57686d31623242694449794d694371504f754635386a4c584f45317251444d4e34557253514b32526b6830352f507665514f72444d596544724c5a4842706d41794c4f6a5a777a427575635955365035514175744c5a41516842574c6568466833476a72456f64517a5a6c736a784b39346f5175376369552f464b6d316b2f5435537144664a7153585038497656577a3070376c6764673232574b504976306636782b455432514f5463597657424353595277696a4f38374c4d684d466641544b735035493630744a4c6751627a4e6f4a413376654d664630346674714b426b525045354352452b51573741473063434659764c6738657a5050417a367a5250432f634c616d776c32567a2f4e78624c2f31574c4d39327a69442f7251736c332b704265463637727068464938514f6c33647933526679394e78456e5765665673774c426836787963396e73686435765870695548536d7a6548302f304834796377752f4e6c49514e645534576d74304d363376524d72744166422b764e537a7a5350332f33525447472b6d2f767562437079596643467a38766871515a7a454d39634c36794765732f6362652f555a4677786e41635731516b547936626749663567515466546f442b666f4e4e6252557157766b476f6d47513445644d306d6e704d5773514d6e62344a6851482b52337468304b6b77794b414a52504252457752517741524d67415a6f77415a7341416477514165455941643841416d5749416d4b4941647367415a4d4141564941434c4e32756473785232343359356f45394e73414d727345554c595659544d48774179432f563958426c734251364342736e355864494148767141776542462f353563684e2b65585674595755446a795957353563612b4d637756536b61513559586367564850664b46362b4b4251484a31367349447352597a6e3463656c585551442f7365542f654241434f426b3849332b4b516135755a34794363585363574850396378664356714e454a41456145414865454156594d4556714d4561794d456534466c4f35494563724945615941455665454148544d414c32685462556355613841702f4d51337938597244485153537a5563657975476c424b477844534656464f466e644b4a4153454674705141674d5347306b523558514b4761474942414b4e3455566d4662724237543657454670635964356762646f64494f6359583631654871764b4636544e6c464a474e75494b417130694668674676456d4e3766724936344d5567614a6b516569423568744345476e614a3654434167564743745141414855494561774a3252334d4561585039424658414144627152382b4545554e574b424f514f6b71434d4c434a4532424549364b6d696d4a4442335932414b7a62464b48704751644969504e6b69466547696e656e69567641696550676949506a5a46467142586f44554166614d47654a4846387046774f48484d6b614a4f684c47417a4c4653344a46516d49586779416151785161696543665167724546746f46546e494c37765546432f776870326765676353685170426b627243415267614f6a4c446a4a78494c424652424b444b4c50564c42426d77694156484156574945424e464b3666434e484641426842484c62436d454e4f4c486376556b70375242517a346b5530526b5a3067594946426b49316b6b426d466b686d31635533446b6433696b7a49566b754555494e6e4a4b4f414a5a6168796b6572516b6c44426d6273536b554c54665758776433357966654f454555784b6457784c455435354655444c2f792b4f7848766f305757377748304e67706d51635a753651464938567846547943736d524a52566758787556596b7251705a436b4a6266735153563667415a777056677578445069427a64325a7054413564334a7056446f356d62594a5636536b4635655542674d6e6c4b324257423668432b434a47486d78556f774347754b43564b695a4770455947503244506c6f53726f5269505578546278645555716f706d5459586b392b5a6e34777a557865525143706a683259706d52594a6b4f595a32363833775852486e35494a6372677075716f515163494a38704167504842566b2b4a79523349515356575151646f77466c3235554c5970324b34514e49687033573451554e4b35706146686b2f645a533043306868594a3277596741735a674234736e67794a5a46376f6757464b5852476c786c704b686d4d6153592f43306c59516f3252634a37505967526559493245382f36564143476875474b6b636a7070454d63316553555a4e636f7362574f4e38346f5357396b554c6a4f4d4662575a7549427a457955776772514758595935645973516354576946564b6761584d456c63734145374b4d42426152434447577769616955764546446273465770436c6e704768304a6b3044414e495a444e36504367574d426f3842594e73556a6f534e356f5842765676502b436468564a376a526369696873686f7a67635a347352374b6f5954636b6f65764d4558444947534b7361503971466931412b66416f49434b6b5957636b742f2f6763364c6773646b4d455330424b4a554b4e433142393448685642695631426c476d744b436a365849477957593676354552735274785874735565554b4b63506b45486249416d4c7477775a5a714b35466973576f696633683267556b584e6745614b546b467448536f564a537130676174634e4372564845436b6b762f45704d7246716f4a466549714a37796c47362b58467150706f7a3379716568446f5255416d59594270694e42424734534245684342446552726276436b516c426d583179704b73726e5764517173346970586153696b646a424735414246786a42443168734d56354559754948674f3453776c72707353596f4f6533427557494f62324c45502f595550563745486b78696e4672694532436968746f7077303272514e79716970686f7550494848507a70567453735a3979737573495475324b5147517765764c6146764a4a4c416453727041594779756f723030687356507a72385842717a7753735971426d546e54705752676c624f4442484a694277304b732f616d4977524945306849493237716c7874346e7a3067707978704a4862694247484442455a77737073704961434b456e6849476c46365134434a6b516553736d586f55466a686f72646a67517667587230442f77415a3477424e5577524f556274423677416545594171756f41734f3332775972554345376355757259764d67644e5368577941687453754b7942644c62536477597536554e643637623232525a566534396779434145477871777159397047434d5869784e316552616b47686837414164313251654c4b514c2b577a516f6f725546344c4746556238622b78373547436345715271343642683751676546367752494d6751314d723673734c304d3037346547714f70344b2b5553684f556d4b314a646765624f79706f75524257344c674a7278733453684e737152755053376d2f51776530325265352b6871384e784e5132557456655542734d4876436d7874617179664457612f4779685269755a76495379484661496472796a4e6f53526e732b426f4f416a467a6f775277593768636f775245557766777572766643424d6747344936476133483278666c437952726d2f305a67795558377667486463674553454d454e634f38504834576d7175577744706273586758432f532b744b4373674366446c4e45644b51473043752b3443443051534778636b517242334e6d51516245554665385946433051476b3941476f343862654842653345456537454850686a42346a48436b6c7642594e4c445939677a3952735544633455324371774c5230674d7038524a7a7363516d494632355945647a414563764945626d49455968414558644545554134454e7941445a566a464e724b39422f4b31642f42397946724664484c475275477066794d41587749483334494564304d4563654849626b454559654545584b494552444d454e7a41414d564b6f716730564b4a73544c3967554e4939564b59683542654f376c4970586171517759473453676e72485a77533467424b6c307558474632414563623056594c736c416f4546744d51416737544730546639424674527a466d6942466c69425075397a4350537a502f737a42675330514a6448425169763131714149554e614676504d496b4d467877356a4339736b6757537430386d494338414152734f41433767414d7a657a69724279515a427a583443304b723577496b664d386337484332533052727641432f69775232636d526c547a61617157534e7346776d457a414b76574e39754b784445454c494b7a3845484178523345355061674f534f494871517a5661787a5a34796c514c677a504d477a6864794248674379484d674247327a315674767a5065507a50764f7a507739654178783070425a30384154415153663056746a794c444e4e517838464c6563456b546f767a38677959585171516542765450653158557a7a516b527a582f5374573661764566644d4b76753159732f4559533345694e475961764531595344634e752f30594f334268714a4d50794b456251722f64646c4264554a554d6f454161314c7a4268347764564d634d476941746c5133456c554c6846583362465a7a645666624d7a376e6331686277542f76746b415074466d6a5377615139572b48465670546a566f5437364573644d544574564873353739454e4d506764563945726b4b5939474a6664302b513945446b35316c5139773861396c743349336150393155384d38614a6f326f39626c39515932562f63594c704e4c4555704549307132637658496f696842353039482b5962576e7a42676e6358524a736857702f526c514e52427a5531674c34396e41764f494d484e37536c41494d5854334754697741637444433242512b6d3748497a5346732b3939796c6e385a51785532544e346d7a524241586846766242666d71496e696678567876794d715775497a447842556e52474958786e66784c3335513434426e383244645157667a697356645247625839367a702f3242432b43714a4d476c2f6a30554a415068577450646d464c6841314546744b5543455a2f6d434f376964516269574537514c56626a584470644b4b6a66446244465577484c3651446533534c64642b4f56424f4f6d4d79336a654473526a6e324562313932495134567a473932632f2f6c4c4e444a423441464d5834583948745865376e68424f4c56374a3567585a784f5247376e5a52536843634c66384e666c7650506e4842546856534c6c6d344f6c414c454274586343586c33716b636e6d4765626d706a38534571346d593179734e7451564e6f3344506f506c526b445a62694b3964364c574675504a5a774c6c42724447676c37686a4b6a6d7130613642456b61664c347436442f746934377042664f642f504451353358685255434f6a64356d50355547522b336843454b326b3339544e4b6b534c4a786d6d2b34594a334a305052486c6f674c70414d4542745a662f41717339373171433662716e3671726336654c7836704f34654d706b3574396936555541374c3330347a2f6736574443355156693673337430433842745376737273762f4873674e4c58546338646f4e7651635234626e513455676e3874526645484676326432563772597737516f4237754650545a682f4578632b484338447475546446756e2f63756c4d466647384742425445564a4751764e4d37304a63454267776576707536766e384876346356426a6747777938473034443854324473566f69325855634d776c4d76566377367869383274523845315076456f59746f657170487858504b49322b395976756c6a6b396a676b55385966796647546436676948723533615779712f3847393233517452426f6350777a4d504743616a37567553385a7579383973475441775339346c76414252413930422b39527952394a6f554130774d3873376a3937446f473155502f63674a4779496f725249616a2f5856726645463866552b734d484c4b2b566d552f615763766568374e4f6f6a784f5a50646f4b6473474c385830384c535465503077786144756361524c666a50545552435534594f344e492f643954526544622f4f434c787357314e676b6c2f75494466654d2f2b4f4e5830706858507664517151536d78757a6e645578467950656c5249712f76766536674d4b57506f5045766c734b746e37796a496561762f6547717578332f33665a2f74735868484d71796534444243434241776b574e48675159554b464378467947504151596b534a45796c57484943464951574c477a6c32395067525a4569524879576f59566951794171564b316d3264506b53706b6f59656b375774486b545a3036644f33476547504554614643685130665134416e6f69736338424f4d6b63506f5571744d464671685774586f566131617457376c3276596f442f3278597357504a676b33684661335743674459746e58624e6d31564f556354446f6c35462b2f4b4833543532707952467a424d4a48305076676c3875475562776f73526a6b4838654555646e6a386756375a3847584e6d764631757874416363775a6a30614e3347766e734567687030574a4f7433623957724d4d6d6a554e77315a70524856756e44567371787853304f46496b45393046372f35525068493467736e4a48662b484872303542545735507a532b79555a34397535632f644a465078516f7a7954647478546b45465539517269746e662f2f6d714f7376504c6e6f5750647531622f5141757841326832713765397572754b4e353647347930326e70546a4d4364574d504f4470364b77493743436d3272596261615a4d424f686759393543736c32464c37384359794c447752526378594d4f4d6d425748446a6354744e757974694949326b4d366935574c6b4476384c48446e696743454e6642795379434a42366d43756e4f4249386263646e587a796f4f2f436d334945464934716a36507a434570425066557975412f4d4d4c4f536a3734797a524b54712f7a326336752f744c5141454c73426f567a49514e7557554d304e43686d634d3645486534747770774254484a5451753243414136652f656f4f427a30594a4376473145523074794978434c6232554a6335755772493349695a6c7a4c50654a42564953434d6630764854786451775653494e474c71523156686c68513443446b7a694b56514c5836416a3156364c6f34464b4b6b2b3430714d6b4235716979366763514a4e5a4d48737730307a376d7233716754586661744d72444c516362554942665358494275795577465050627758793037616c417357553355466863434f6e634874724151397a647854557456465472625464666930634679644f62645058337074637745372f332b5a59526256676e6553596451414a47416f4f346f6f746e676943435471676f6a7136494c575169345a4635676e59594d4d626c7164564f7a4a576f446f55535061705a6165644f61316e6f61565057706f74714e626174724474796f72637572564e7a6d2f6c7451336730664c45626b39665463547571492f396e626f314778444e69544c73356869355158786249336a534e716765757a55587674427044757875344e6f6d4f7967734768434e466d5937707a3067686b4464684436346d4f39594a5a694141772b6f75474b4e7650734b4938555a36715762385952384d506e6b6f31546d69475742476f425a4b7030313338726d6d38744359664f64652f595a4c5177715a32786f324f447539576a594e46573658484f66747132466f343467472f664c584f67695135793866673365786f744c2f57747a586377642b63434175446f6e7433754c51586946424361362f79414a596d5534656f547971506a30676a7a6f47337a6e2f7437676779634758364e3730655a674955587473732f2b6363694a516e6d6e795466716d4341304d486671793944397436427a6e68734c36446248733945394143314279773051346c53774732446e64614a5a326f4c7378532f62764f416f536b6a6542764569677937776969656d7763345933716361426f724958476e6a34417064346f49684e45306e4c656a4e43785a58776f47495457304667634431624a69514f3342764956514933784178396a634f6c473977616c6a44746a375575677174726f636969352f386847494379586b456677504a51336f774a37502f625336414167774c4154566e774a3468734376613073304a71576576422f596d676f7a424951584e5a554859754f416f584741684231316741794a30515178623434734749526846786d517455755a79336836523177495a4647454a582f3977512b3934416750734d4b2b48694d76685148374951304d57704a4f7a79754a42656b54457534327641344c4477685855494166444e616f4c677772654a365649786146596b536472774f4a426b49553542667a73697a4d4c6f786878514561646d644661614f514b47347144534e55567a4a6d7643526c70356d6762474f344c4f336a6b7958555932533457774d4147525467434638546742736d4d786773556168497436524c4e3034444e55586834515466623551495a2f4d414953766943476544775373496f796a62756979496865374f3267646a4e6b2b774542454a46755244376d664935715053412b62436752446e63675733487131434e464671774a4e6979696b66525a556475565241396342466d5867796d4d496b35774e41686330334b314d71626d746c4165376d7a4e644d6354545668633831503864513132747a4a374f684a4958762b6741684c344d4c2f474e6f4142304274683669776756354865664c47524a6f7256305764567778734d41516a644f454c5a484144434c6d44303950457359532f6334304e43504b77684c4b546f624961705546474374474e51494143453968414b717441685657697a352f766d39474a5744424c717662716f79414653676c4536704753467151502b35764b536d6d476770614b785a6730672b6c2b5a496f5642646255572f5a69493278304b686f3739745265514333625553616f5664334a34415a46794b6358784e4455702b366f746259523547467859745638756447314b6f4a42445a4371314443496c513431334a4855584c504f486737574e6d77645346314e68543144756e565736645069446f634967623970344967555a6555534d637062676978685542773137366353713967526b4f416f324e334959777569677633316a374c4e7375786c77644b446c34364f4c5a3231436b324e2f2b50623130447855364f56706d704f2b787166546971335154324b436f4d4c6b322f4f34415a444f49495361477462526249504f324659373032632b453537716258434b72466e4f50504a685443597751317a434b796a6b494364716661514469447554513049516c306a65594371506d6156646765694d434e3564774c674c563856566d6e5247592f344942477545497567334b67677542636f38585673517644414a5a6774414a6a3542644e2b2b6576664167495941414b325141695979523044757762426b794b656130724c6d4161373573474f6b764a70684b7154504d79546e742b45725663355041597a7647454f6c475262566c3955355a4f552b445077644e547469756f4372674b42434567414b786b384c4c7830586a4b4b5559564e614162793043494275614e596b68555447324b71776a6d614d4855366b513255432b735958526e4c49314330546552726b6638724b455150396b32706d4a6c463573756157584d5851444d434d644473454669687a64313563327669374b673574776174684245316e75323135382f305753634170646f4c596b42634452663630496e7571466c5041344d6e32317257785450587038636d364e676151616c6864594e544f37727431707974687a576d554963476f756f6655375755736f4c41535a426a4a5072616569657848425441495634514d686a6874726e424e5a597a66704f342b706f68553168417368534158324c667839677452545a576d74317944495141356a47507552566f586e4d746143454c576b437a4835344536644e557531456f2f6b79322b2b4c76302b53355564375744416150636d304b6b5276446848617857506b4e6355706a68386f564c346934356630746f2f644730446241744b612f554e7333304f486468353065624e5262776e6a44687541434d6669707164707757556e2f6a43467a78784556744834554f4f6a345244416761385878304158322f5744586f746d3465382b706b343958354e634d71594d5555416f564d4a2b38644335336473714a75514d3279414830653968444873704c467a6e73764f63324e5a66514e554e30766e78644d306a6e6b305a6277335365434277324e6d6a786366647468317233765343617841364d67433851727076596549764b4e466a4e6a76626949305150674c356734375033397772644742414a4e395548714e6f42694533674a454c47455a43656a7a564345522f6965766759455834766d69336b6567534478386e324f684c356b2b4168446c4a6f674150347a332b545a30767a5a4534416e36336d724f446d6343344c4570414e466e41425155384f524f2f4a6d6f432f77474948636d4d50554d394a336f3761436f62314d73503136414a6455437635356f5575364f303150724438436f4c326771726a2f796f4f7572724f56364c504e72417642656d45516b537368457877555168432b3479452b7a724b79474b462f4262694471796e534351673757715149454c51516c616b347572416e5643514c393476313359724a304a70497a41694a2f4b4144584c7535684a5141526e7738304a76394b424541696451427977517a61446753545477357771477562424e4e5a6951323062514e6c69414c6c54724d35784c4362586e59436945346f4476425a4850584e78514d2b537644773069446a657768487a4f4e52686c4949516f566a71676f2f61417532546c42312f46564f777645524d6944786a4e516d4b412b714273446a53514251534b4e4b6751797a41704a793752497253517438365176394a514e664a67445a2f6b2b426a52584262784d354a474e4279446165786c4254384444342f43446743764e576977457775433355366a42747250316b4178306770476847424444502b57455348304344745934413365782f6f71704d2b715146596f556148307a6b69716f43624530556a49455273526771425378464d63445134476353554f4a546455306232366b53646373534a673862435959414a784941643034786164684237663046353455544e386b5447457a3572735a653165417872396f6a66307352304a5175496f4242573154686f31513949635251646234776775736944305543546642373073704d2f737a6c53476b4a5a594d6c62385553464d44556367674d69576351366b4c30554330627a656f434e586f675a6173432f77556245735569654d634350347a7277414d694231517741416a41304e5576572b5253457a677945587779464638467369306a575363434771386a4b6b55416c4e736d6f6d73736f7343595653717a646b77437a3730413530386f34516b5776734143307270426746346e7545734b4e4b5a565965446945733056542f304a456b44614961553851466a504b77327141753779496552344d6f51637177636749704c554970655973704a7a44782b6949414143774b6e75516e4e51506f2b4151734c2b4d7143594f62364767724b53517a612b493058304f3642684d51394f41504b65516167573878646646625a50416859524d5148504530376b523457724e43386d5a76596d554446456f4f2b4e46554949445646494a69694551436d704d6b3377415a54305147526c4768794741323834496e43614d4d34452f32466b4a756b6e4b394c704f2f6846497a4f644d7a70394a5852744d7967484d30684e5042494a4a43304a4d3273434d794c37494450304d326747383763664e627075307a3049386b557a4b62724a42723875416762654f7076433957584957644a484657774d386d4a4c5249424a4d3342634c706e6d67316257674d344249765869412f2b65493763793038465749384c514a442f772b72437749534237427a4d545a7a644472545354347a4d304a7a5474797a4d68416b506d4d6e4e5347454c7644674e6c7544514338794b2b4849503233446f4f7a6c48594d4b527066787a6c366a534556475075747a494a3754534344306b2b3467434366784a735150527954674a6a75524c436c6b537150493843446a4f6b576a524c45733633536953796c6952616d7152514e534c676c44526e7647435a356b53414730563351554d6e68554e454b79446e2b304e3537304a7662544d6c344151647552446d5149484245543176377a4e46367a6a676f4a4e742f534c6b665558757a41526c2b447247434656536a306b387a525343717a4a754c5552317a536b506241723071504e4a7152517544546b504b674d422b4444306b552f7372674b4652564971794c6e63444152527331526746735435326b547846794637466a4a456d445546766a524a2b454b317344556639746f6b70506f316c6855315a50347761386b71704139444e497a56356b6331477174512b3356544d7768473079456b56326979394e6856514e53565437456966553056526b306f62576f4654776c5448636f44705252437a5a686737513953363867444861314c31346c5364384e534b416c5a61454e53425a6b54454f7746696668464c394e4655413954477956545330455456395a52672f34303576596e316d53464b7838556952744f4c2b56544f55305663553954313538316c506b4776673447497068486b59466b636f674a5a6f636a6d6c557948414e457a6e4b6e765541436b704147674a59304e424a6f726559454550513051584132455653324633346c3072417456344332496e5547495867324a48353168333547592f413065684247597234307a35776d4e3338317443566a4f494e56375973783374594778646f775769566146594e6a5041375675753954502f5875426b4f37466b4b3651464f4c5658434e59314c444a466a59526e612f56716a564d6e486e64494a6d424d5234594b2b48464f52594d364d55554a326c4a6b7771427545554d4737504d6d7a4742586a304a794a534a72443274722b5374772b2b4a723966524a7746565a762b567349534e7436594a6474524a6b4b51527563574a3358364d376257674f62674147444859304e505979594f423344777350734b4e44472b565273634d47764a567443733846626f423064554a4158324e4e43385a764b6351694a394e493843364b4c485257554c56435a57554472506462397141344a554a4d64654e577a79393646656e7154714d78382f423065574a6573586139777342465835637659746461776a5a47494c574e566d2f3456434e34433956586c4f35742b2b496262654d7750366b4e517355466d6e636e796e537474706564394542725245624258714d307338634f2f77516c594739695a6c2b6a43447758536d7a57556d5a4a4f6148546b4e6167686c6d4661426c69443869335344724166564e6c445268326455646a446b4c336955613232334a524d3459334a3971676633666966796b694577397244467a556341735977417a67536651574e41746d61544e6a66786e6a67614731323343574d48777a585546345a4c35414a386334316c494543494c59686b54345938306c5a56764443587349446d527467305744446d67584e6b3634556578416a594d52454f677656686175682f5a415a34736b586e4569666c6b4669426e6e44693733726e61594d4e6257556d51676933736c443770416b50655767477643446542764334344353366c347663344169335044674e65456933666b65655532565571344e6543594d4a703050733346677a476a6133576968666351686776474475713373486f55486f73356968594a4e6b696f59656f416966387834344a4c694179474e48665868624277734666714e30576f3750474d4246616a5a772b6d574659636c694745646b673449476c395251374d65534c596b54543034476c5035415738674a6d687841304f4f54505539536a65414a56567553506b6d6170634f5344784e6964696554396d4f5562734f4c544d425845684931643332556439355a63766f35527451706f72524641623577336338434e336769344878516a79755953633259524878707464497759347547443059416e2b74515579476964677a7a56653445306470597852784831367a56546f474a52586d5635355171694c52414d716c302f796741703875434967514a4f4c7a6c2b4b774b57687841365151494570704b4e7a4171427a4c5a574a657142623255567a656d4b3332456c512b7341634344736d7569384d6c4731394a55705067365a7259715664673541623567767156717a355971643777776a2f674670347a4c6f31314c70584a4468636c52676966564f7764304a4244664f545353514d764e6843616c4f646661536452575950696a7057496a6b6e664c5a494b4d41765030554e55746369574456352f63554638426d557679425a3733416a4179616765634a424e344b3046636f4d776a6f3344494373647753774d665a542b4e6b79326f3478634b2b746538576d4d614f7862654b6972644b6b2b59514f396e4e4a46324f6a42325549324c6945366f4244754d61334d574d4770767054384f437538534b5a47594f544b2b52644845554d727470536348437963615379433261497755643949376469494942664730554f4f6943484f654b7a43594d4f567074516241436875514d50786f434a4b535147444673683575433164794b3252337539616a73677a2b4332637a7447724e75576578746856454f3465626458364c41316a74736d757463312b7070727873432f2f316d69746657365547344177516c45443553677a686a44776e7544752f6b6b6a31386a42754b36556541416c31386970484d69756c484542514a634e3859417653304634446837534a4336562b344143356836566d79534c3553385344694179516c4544703441796a33694f497438624941417849306a44384b67774331456c32754344685a634a796135496d61626e647241525356634e5842376441374153656a6762517247454431534e664b587731504677342b4f4d597162624d3131783373634a7035524e45616155474b41794657444450376942594b5a4c2f41634f357934562f54675537387478564d6c443768676d6c66693052574372552f454257725453627741736c4545655531317952746e4465415a597170596f43314741757162524c4a387930466976355732336f41677237756a447269676e6b2b6b307955502f6f4c674b4e69634972716374397a4152662b686d54546f764766736645636f6249472f706467766f32787a5971342f59395162354d62426e5448776f4d786477354d5653516c436e5356516654474765596134594c6e373162646f6c544573585653344274355067775736594e346278417a32484361367653614f6d4644362f642f37496738326e46326d79645639354d6f625a5133776d3468362f55767a757957666d6a765777414d77506953635854586f594e502f3277734d76647a6277416a5976554a6b414b6a744150365334436a7963694e416e717167505343356554536f33567173505561772f5a6e735a65517234376b5a3439746a7a313743312b675a41786a7457643439505179437669566d774b38546770347635515a3076462b4c41426c6a494f455641742f766b4e4a5478564e54354164713345506549497a7649746835777339527041686166445147646d7730356546784a4f4b665a412b77514e622f4c59626d36594c5a6f397744376c3768723441445048346b4f4a45307a4744564c655546686d414d7148736e336b414a747031517770377134573838646b4c6d4c554a4c442b734e5842514d4a727a4f6e575261613964585468777a686e34786c4263787770314139763079316e346e3845446744387a7950515150784f446338774c6e74513154586b414a494a38753345447259534c4d53625a4373766c54594c2f64704a315034494149466a386d614f33655654345a6a7833536f663545414b5948586131673541414c4f6d44584c3862696355494f787439554a43447775324d4e6e6d427866555144786e6b304748357358674149754d414e70743467366f414d414f4a496a42554543786f3869444368776f554d563854414179696978496b554b5936346944476a786f30585364537043444b6b6877456b53356f6b7153476b79705573573770383252494f6a706b302f32766176446b54444d7964455130412b416b30364d3844504976476249693034512b6a544a7447684a45304b6b4962546c63536b597131594a757158463979795a72565446654b5a4d43614e65694353353678566657456d5848326f4177396243554f6959753359497776644f745762464f4542554d6c6669504f79597555786462436a4358716b594534613545356a597536495349594d526d2f53694b664a554b3573735135567a3262586f456b4970575472467537666b3253417055316430517a7a624d476934634a454744372f673263395962435749496250773668673572616a4f2b6f65544c687550535356327a72735845364f396f6653384b342b62687a6a686b76526d5a6b316d373653314d53484e753333394c307965384a747573586c596b7a503036646a5a30492f5138415566617039415a364253303159465575474c674356597a647865426943544c5642662b444b327857324138574b6c534457424e535245635841356e6d5257467a4c4c6868517a467741563564646f5278513149334d486259686a485138534658597153496b41744b324a476a52486d5138634e35694e554145567432514d566a516935304157526a646e534259704e5947614861644671574a4945474854784242525a587243484848737a5a74736361616d44785241653862516e6e63576f55646763486364345a3278504c6458564862683149674b647847707a5a4742784d57686b5a4444594151515153536e544268526463644b4845456b594155634f68694d5a3151354a476c65426571426d5a674b4e5238766c4758354371416f4b666671376d564a6c2f4141596c344b6f464d6f6a67716a415a6d56304e6a55466f6f4953367474515a67786a363955594c6d784c306737443244556e45433972464547566458697a724a42466b72465656486d59596f576e2f517939557931614e47395a51616d463677474647474a4e36305664564769344c4178666b32676548457042704e345a66595742724541784b684d5a5748563245432f424352455255526143425169414242524e6f73414548485854777751636565504445453156382f444556496f384d63736365664e4442426871383658444c734858516d4279417572776c42523167736359654f2b3278706763627a45777a634e585a5a67617643522b4e4e454578454779554361492b505949506e7537554d4b7244546a6a48466b6d387976555a7363354b36374275574a6a7231537670596147766a4256686f624e6d6731537367574930746b54434e346a42625756357449484569415a795552676538796139416778456841454854336938385155524343666c4e6c64304e436d444732504e49595953513868674e47466376534574746a423077585368584e786774476b7a354e30562f78347849763343454754456535735a5246524a75454a4452485271304c372f44767964454b7852575848425477664242427877484359575749686378636b636141443038622b6c56462b4675572b2f37417552372b5130314b494759565456734648774e6d4e34304e4747316964635241505872365a626d4b7867417843413247536e7635496446733751474343306a58387151594b462b7355594f2b774c594446517768734b513463786749744831436f4d484843584f786a383441686345454d62336a43484f644142446d396f6778693863495166504134725853684d48617a5567694f55376956314d454d58687543336863796f4b3348445675786d353565394b63454771644e4f47507a69426d55527a6e434934386b634a4c68433768306f49694f786e685776694d556e324f5944574f7969462b646b477a77415334706b4e42414c356c615638496b7656456d676e66394c56754d62394246774a58697741776e62554959796547454c57776843456e7a67417871637741547332556a38354a6366486f6a47666d444c6e363761734c3835566d5279444a4a42597761486e7538523841674872457a526b6c59444a5a6a68586a765267787643554a34694d67687768526c444752473175794371456a3278477750394b6f49484f4a436843305467484659637842553931434270544a7868654d6967684239674d4557723477775a4e59694544707242445738676f52744d3649556c4643474872307a494471766f7858434b4d303454304a6c6f39684364636171545a6a43726a7832773038313452715a4558486e66476b574667676643424936776b594375366a694845755a786a3333385979414843617037746b6347694d77504176747a76353834636c5751784a556b4b324975394669534d5a6a556a6962355a77514c486245796e4d7a6443327a2f634151766d4f454e645a676149414471426a4a3851584d31434233415945444b726f52556e68614b41574f5779534d57794b4149526e69554570426768422f49414b685341535a5833474454704d6c67434630516778766d774c71493243476737657143455734517853614e6c433136674174507a796f56745846786e5778746132736741456262724b463662713272635467776f446c77453631385855674c75324a506862714842454734705572342b52702f736757674173306a482f3049534547616f415346464b786c4c334b4368754b454279373153785169697239686d53475346355549484872616d4e6346713751544b59324231464d5a4f3569316a4332416757316834494a5a486f3265667248444d50756148634e795a59484158556a5a754b4b394d724c4142626431515653356879516b4b72473431463342526a7467312b797530774d4a756b4a76744174652f39634d4c30467643477431355a6d6173515432736877705152492b4768486a775159434c4e6c715938767757494d4b637043565a61392f6f5659447a646f6b423559547a57636a4f6c46566a6461697249334972517a6b5538616f4e704d4e6a7367597451506279727942716564646c6779794f685a44645467764871724c6845644d6b434c5542513843524448536a735757354c71597078473255336876624c3179546769784f415976424c44776f545a77654d62634f304a6e6d374c652f32376b4245456f677a454249642b53524b4143564b364143455351337a2f756c35424b37724b585233424941644f455077594762594b44744741444866656959324d5144426f447a3956576d47304d796e426c2f6b566b674d47334b5a2f4d73315259575a6564456e6c686461484458763263496b4b76754b4f493570344c496d4c6a486b76615a6550394544676e625663716f502f357559306d6e42474f3342515566446c554a714342443549516846542f385153736e75796f587731726a70776742324b6d7956397441775851416d42595a574677673974736f44637a4a733455726e434c44635262305a533030796c79675844483868566d4d30545262496b326b644e62467a634d57647165535861357a4d7474524c454149687641744c6e78704f6b633357477435325a724656596c68756d47473242473967734e596f3376664f746266436651516131786b414d793431725876435974617974716f456350653441565a765270764e3259504468383370463561474d4d53484744414e417676536279726573694274316d4843772f41504659327344706b534d4b5342706f7438756c38344656335147374c78666e753355566235556a61676d67646f6f50396733306f4f2b62427636753951354b584a39636739626b4364715272316d625a76516f7644442f7635567a67302b63485544627067367a31546c65504363614d65716342546c3143683145336c633731305847586a2f4c444a34396c692b3050534646364870324b4e50796d7576394e526f777036727951504f395777384336655a31797564756d6f2f585a51744362377a6a6c5679434d4975354358426e6a4e496a367663674f56334e46515a4578365865474c746e5a38396d49375a327447346276534c654c5056323538536c58654336694c37444d463778736c637646526b6b7a6a61336e3775526535696442365a54384d51664141586b634c563146783934503036664762614e2b367930514f31316563506a72343939714a4741426a76344e7739493778632f3644727a4f584c6c30307637656532384950514d6233445630614e34323551332b6c483564494c73674856756a355574474a39783741506e57765448454447776537615242335132642f61485a2b68682f7a6b55734879434a774845597a5a3363476b502b4442446b7a357441473443324241755548754663572f5a4a34496a47486b4d4a5759354941526d30484f694958366768587972596e3663563247626878347330426a45355647644e33754a39794675734947345a3338545567656d7832316778785a5268324a504e685a35634745636142414565482f35523346456b43524965427069345941572b484953454664765177586670595678516746646d44357667494e4f4742557838482b4e3051596a3649615064774a456434493841415a4b61423874474646386f43734c694235724a6b6c3869423433324836736459616e45582f3134594e6f6542424973494b564d59515a463074316b51632f79464d747748526b3159524f714873665167667642346c35383244614d54643046596153786f57536441576b574972426f5145764b456c305149534b71454e325742644238502b47743468766b63643941725944517341455a314235435a49477571614871774b49326547486333534d3258474a546e466f7067462b772f4b4d6e6d47453544574e713863436833682f722b646e472b635864654e6945576141416569454e68434d6a5445484f38687351304137475a55643671474b71776865456f434263375147777965507750454235446448646b434f73706751527542476f7045485034654c422b6c66635567444d3042724d3545444f724144504d414451744145544d41455851414759584147307751485a6163727777686145716771636e642b4630575344444b515858474e6942474e75724b536556474e43514948366a683330336331646f4341307559436a57675563494232504c5644395945482f636542502b43523954454868646870524a425661504d33674243502b566858703868616578423455756b614567426b6e5163495843427641466e2f45433541666657684277614a6b47665a58695951687a345142456a51425269706b644d45516e62416b3677466b68456c6b6b46796b6e3359656464694955665a46432b4a467932354b70526f466a475a494858416a546f484130696e4b336e51653531326a6b62786a3951566966626842562b35656b6a516a50597842353759616131484559654847495142686c695a585253516c3679464256475a6a7871776d685857426f495a66544f67547a6d43423176515832674a644357676c696741534b6a475231755152783845423358516d56774a4533643550326d674b33757048636c495148374a4949444a4649594a466f53704b744348463075674b336f67614b7458417758344e6c7a776b2b6531686d4f524c43694762514e434274775a626938776c6b46534231493459396d6f4574677046556341434b674a586876676970306e422b586d6e774d41415657516e4b39342f32774161515457615274754947713861566d2b65514c4165577170786b664657553349715a7842777078673435797251703138575748575a69414f576854366952586147535477655262654f537866514a7054694b496651675971796c63664f425a45575633614b427077414a6f7146774d73476c755a3647497659484556515a746773544146616c6637324b455263516574695a6f62454a736469676465344b4a4371714e426767646c6b475334534b4557696d70426b4b466c304163626d71425271697434324a79364d714c5232586c737078303175684d34476856452b69457a696867774b6a5a4b47573569795670774549737a6c71524b4171686f74582f33463534714e7751746b6a35346f41546e69565a447968493069526441304a394f796c5a617961595449516366634a70615341465951436966366d44324f586445414b6c7630775a4a6f456178526749557976397144644141662f414856315942614f4147634541484b596d716e33703562797169426c6461644a6f6472546f5765416f356e556570594e4765756d49486a5470764e6e4362705457746e546166586445476d746c5858576f6659734373314f5543586c4358716a4947577970504e30434c6746436f6944456a6e4c704f73426d734536454742477142455041452f466976576171757a4359446a6b6c4165374d465068436d47304772706c616d5a387152644d414841664162395669764577734942785a5249616f716359714d63376f6879746f562f3771694659594847784b74764c616b492f59435862436d5a6e4f6a694b616e4c674764774a5765574a4f543350594435486c526278436b774d554353674373464c47596357464a3869704f456b4146707a7178563542337841634248684367464473526332436b4766634350394b6836344a486556514763766d725043482f427749517356414c74543442576e36674b79597170785547664e6f786d555542736c4c7873674f534279524c51485677424d3961584464777256784a42314e4c5853706d4732764c567a69726553644c58544477426564366b336437586a45677343726874336a785a6b546252636e7874474a37423163516156766f74474b37456d617773397a47416b4e41754a3737456e73414141546747784a72756c4636414c706d747175437468757274687653746a7a78746e6c615955374a49507735523236677168305741324f6775484d6b426f6237536b42677030306875447746413855625730764170395846416b647775383658714e316b424236724574547147537951423552375252744168713062455772774161344a58685251425a647276684b4242324741764231324133457274716862414b763776703861414c423774735a36556331724774634c45376e62724133472f3773473472747a68416469674b6e413553504c4b306c32494c336e6c5259727978575a325663657944397767426c3539674d7a79355632674154652b6b6f42577851436a426830494c37485137373747784a375141564c65324d5177414658674d4765717764654d4c2f415a51506743734d716b5163416b4c2b77735a564233486c726f4773414141582f57354b53704d4b5251634176596342495962396b7553454c4c456c353841585a6531597573415254504b6766764d46686e434f7a6556616a573770583477614267574c3143375676454c524a4538464745624f6d38515974374473533841465869735153735162516f5630516f414655344c352f544246323441566558463033384c694976424941414c5a47444d6b4e5a7245523163537943384353684b796e496359745563554e636356685a4d4b656f6355586c51646a384b37794a444474697170754d415234692f38744d74414633477366645741457374776b4c6d4145657a744862324145303674635150444977556f47713377304c4141616642596865747779454c4142574d43766c54775261304146477a43715867544e686b7a4e4c70484b776474584c54414549747a4e494345417155764a355478485a4174616d617771793267616c316c614d5869696a4d48496365484c6b76544133636d5665474137777077374d7541464573796d77417a5139474945625143396a65454743306f344c50414458304451716a494849734a58764a7a50554e7641794c777079707a524d45464a3643454732657a4d787945424e335049366b7752653341465666417a567951424736416e30367a53494f45475268444b52394e41726c7a542f567645726c46344e5830316533444f7575624f515549484f6130514550654b537030513376694e6270624471674b4f426e4b6f4455594858424336684d502f7977704e7a5258647778714642473077315967594c5567544134667a7956637a4a455067314f687841784b4e7947595179306a6a416b6677305479783158684242757a6d4f7841414d5251674d524f6a415956743249633941596b74324251674159304e324737564a522b414d30677231437a524a327a43415377544b42537750446854316b4c39496b5853567a2f303264546376784437476b4664326174797952455642614a6c4177666456424f644932515131677a684173566346644d4b4137713845456736776b4d6732314a52424b55394c472b67424875394b53347742474e413278514c4c572b4e4654417742462b777876785442312f77413657734853357741306351426d2b7730426631496b556733586c6841313251312f734c423131777a396b784179785346374d626c6a4a67417a395142443967417a484170793777413247414233767742425141324158652f39694354646756597a4561347a4569347a78586f415a7173415a6b7367646d496f6b564c67635a5075455272675a58344f465834447a4f517a4a56304446507344456e6b7a45586f2b4972726a465645435a7149416555766470476b51647973435a553841516f6f7a4954734e6752672b4155677a4650494359354d2b4e644d516465734e337839414a4638415732584f515430622f6f444e525072697033384c704c2f4e7076677764356f416432344f5631514164304545496b39415a763441625831415a6d6f4f5a6b774f5a6949415a6b514e5a737575566437755632414f59684e41646b62755a6f72755a6d774f5a6b344f5a6959415a4f766c686358756431634f64357275646f6e755a2b33755a75546759385455427a6675686850755a6b66755a74304f694f44756951547334644f6764665541546a6968637959415269384e797461776469344467385174316334503847347a30736453414753484144622b30434e5641454843514762324463465759485a484145356745774c674145586e44646c637733373430584d5841456f357a49534855455375414659374253486d6c666166376e5a484256736b376c3377377577566f485964447132784d447035377136687a6c503830614e786675412b4b6d6f4a586c3730377639663774654f414758724135766830564c464144526d44643959377658514145704734512f6737773469323275545165536d41452b5730444e5441444d3141444e5741444e6e41444e2f414451304145523741455866414648735253516b3048745837724b524944526441466266437a4e66304758444145426d38514c33414453684472396f377a4f612f7a72664d472b6e37627a543445587144774f3038525554374a72654875524d38576558446c532b774553672f3155512f4464744147586f4145525341447734332f454330674130434142462f5142756c657a6f7354426b734142444c413355356941306241425745763957502f426d4f6742455267413653754b456251425753513746524f396b6a77417a4741747930774130544142615030396f65502b46412f4237733042444f51396e4842416a454142456f67426e752f383033503769624258596e664649796b61302f502b6145762b76314d427a486c4c6b646c4245517742454e51424558413855597737567751386c6631362b4765422b7779426c3667424565512b717a5038573735425759414239342b2b6c4272523232512b355279424553672b7237502f4562676c74562b3761467642322f514c6c7a67384d7a762f456177424c49762f4c56662f4f45762f7161724232394142746c45424463774137307446533051417a55414248672f426d3467397544653945642f456a45332f69325242674168414d42416767554e446e51432f306a68516f594e485436454746486952496f564c5637456d46486a526f34645058344547564c6b534a496c545a35456d564c6c53705974586236454756506d544a6f31626437456d56506e54703439582b4b70412b654e6d7a5a6d7a4a41783273624e6d7a6c32385069454b764a417751494472463464734348713170463841687745617a416856374a6c7a5a35466d31627457725a743362364647316675584c7031376437466d31666c314949457346716c6f4a637248373568445938566e466a785973614e48542b4748466e795a4d71564c562f47444c6e775141462f423044596b396d6c6e362b4754534d576e5672316174617458622b4748567632624e713162567663504443415a7a57334e2b5a4a5938443063414147664239486e6c7a356375624e6e542b48486c3036793979632f56366c63766d4f6e6a31373550446873325a4e47764c6b2f5a79486b68354b46502f325474792f4e7842662f6f4853784530626e3535662f33372b2f66332f427a4241415164387144714371724b4b41357532362b3637384d59724c34337a2f4642767666626563302b2b2b5137677345503641674152524948734937464545776e436a3041565632537852526466684446474757653053446a5443696941414455656a4642434374566a3730494d4e597a5051773944444848454535646b736b6b6e5455534e52696d6e704c4a4b4b362f454d6b737465374c7853532b2f42444e4d4d622b4d636b737a7a30517a545458585a4c504e35726f634d3034353536537a79536a6378444e505066666b7330382f2f377a4a69546f484a625251517630414e46464646325730555563666e564a515179656c744e496c313441305530303335625254547a2b464441704c52795731564e3379414456565656646c745656585878557044564e6e70585851413244464e56662f5858666c7456633939366731574748424c4e4e58593439464e6c6c6c6c31584f7747476668545973524a6d6c746c707272385532323772676a4c5a62627745494944527478795733584850505258636b5562396c4e396f5530345533586e6e6e7054645a4f64724664396870362b573358332f2f425468525a2f4d6c324e414155413034595955585a726868463963744f474a4b37335334596f7376786a6a6a3266616f54324b5036517858593546484a726c6b6b2b325339474f56343454695a4a6466686a6c6d6d575879616d5762776278315a70313335726c6e6e78394b2b576168547779416a352b50526a70707053766d6547696e535177676a61576e707270717138755639576d747734723661712b2f426a7473584b5059756d794344734255624c58585a72767452494d32572b67446f6b445962627676786a74764b2b474f6531596b515453795179494e63434b4b587a5475304474787852646e48454453746862673777414335334277444e304c4d6f6f4b7a2b745250504434364534507842736e765854545477647744796336626a4c7976796b2f77504c4c673979633877673935304f4f30456448765866666677662b7a4476577144433943547466417a7a6439784139654f6566747a67674144733d, 1, '2017-10-14 13:27:43', '2019-01-10 17:08:10');

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
(8, 'For registration email', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\n        <meta name=\"format-detection\" content=\"telephone=no\"> <!-- disable auto telephone linking in iOS -->\n        <title></title>\n\n		<link href=\"https://fonts.googleapis.com/css?family=Roboto\" rel=\"stylesheet\">\n		<style>\n			html, body, p {\n				font-family: \'Roboto\', sans-serif;\n				font-size: 14px;\n			}\n		</style>\n\n	\n    \n       <table style=\"display: table;border-collapse: separate;box-sizing: border-box;\" border=\"0\" width=\"100%\" align=\"center\">\n		<tbody><tr>\n			<td>\n				<table style=\"border: 1px solid #c9d6df;border-radius:20px;box-sizing: border-box;border-collapse: collapse; border: 1px solid #d1c7c7 !important;background-color: #fff;\" border=\"1\" width=\"600\" align=\"center\">\n					<tbody><tr>\n						<td>\n							<table style=\"display: table;border-collapse: separate;box-sizing: border-box;box-sizing: border-box;border-collapse: collapse;\" border=\"0\" align=\"center\" width=\"100%\">\n						    	<tbody>\n									<tr>\n										<td style=\"padding: 15px;/* height: 50px; */background-color: #efefef;border-bottom: 1px solid #bfbfbf;\">\n											<center>\n												<img src=\"http://103.239.146.251:898/tmsNew/assets/img/BeConnected_Logo.gif\" class=\"img-full\" alt=\"...\" style=\"max-height: 50px;width: 250px;\">\n											</center>\n										</td>  \n									</tr>\n									<!--<tr>-->\n										<!--<td><span style=\"height: 1px;width: 100%;background-color: #d1c7c7;display: block;\">&nbsp;</span></td>-->\n									<!--</tr>-->\n									<tr> \n										<td style=\"padding: 15px;\">\n											<div><span>Hi [USERNAME]!</span></div>\n<div> </div>\n<div><span>Thank you so much for registering with BeConnected!</span></div>\n<div> </div>\n<div><span>Please confirm your registration with a click on the link below:<br><br>[REGISTRATIONLINK]<br><br>Your Login Details are:<br><br>Email:<br>[USEREMAIL]<br><br>Password:<br>[USERPASSWORD]<br><br>Please remember to change your password on first login.<br><br>For future login please use the following link:<br><br>[BUSINESSMANAGERLINK]</span></div>\n<div> </div>\n<div><span>If you have any questions, please contact work@beconnected.no</span></div>\n<div>\n    <div>\n        <div> </div>\n        <div><span>We are looking forward to be working with you! :)</span></div>\n        <div> </div>\n        <div><span>Best Regards</span></div>\n        <div> </div>\n        <div><span>BeConnected Resource Team</span></div>\n    </div>\n</div>\n										</td> \n									</tr>\n									<tr>\n										<td style=\"padding: 5px;background-color: #efefef;border-top: 1px solid #b5b5b5;\">\n											<center>\n												<div style=\"text-align: left;\"><span style=\"/* color: #060606; */\">For more information, visit us at <a style=\"color: #000000;\" href=\"http://www.beconnected.no\"><u>www.beconnected.no</u></a> or <u style=\"color: rgb(255, 255, 255);\"><a style=\"color: #000000;\" href=\"http://www.beconnected.bg\">www.beconnected.bg</a>.</u></span></div><div style=\"text-align: left;\"><span style=\"color: #ffffff;\"><u style=\"color: rgb(255, 255, 255);\"><br></u></span></div>\n<div> </div>\n<div style=\"text-align: left;\"><span style=\"/* color: #000000; */\"><em>This email and any attachments to it may be confidential and are intended solely for the use of the individual to whom it is addressed. If you are not the intended recipient of this email, you must neither take any action based upon its contents, nor copy or show it to anyone. If you have received this transmission in error, please use the reply function to tell us and then permanently delete what you have received.</em></span></div>\n<div> </div>\n<div> </div>\n<div>\n<div><a href=\"https://www.facebook.com/beconnectedbulgaria?_rdr=p\" target=\"_blank\" rel=\"noopener\"><img src=\"http://i.imgur.com/EgYFhb9.png\" alt=\"\" width=\"39\" height=\"38\"></a>   <img src=\"http://i.imgur.com/pG5yZd6.png//www.dropbox.com/preview/BeConnected%20AS/IT/E-post/Ikoner/BeConnected_zps34203a72.PNG\" alt=\"\" width=\"84\" height=\"37\">    <img src=\"http://i.imgur.com/wQ9lihL.png\" alt=\"\" width=\"75\" height=\"27\">      </div>\n</div>\n\n											</center>\n										</td>\n									</tr>\n								</tbody>\n							</table>\n						</td>\n					</tr>\n				</tbody></table>\n			</td>\n		</tr>\n	</tbody></table>', 'Registration email', 4, 1, 1, '2018-10-29 15:31:46', '2018-11-24 11:39:00'),
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
(1, 1, '[{\"fvMenuUrl\":\"#/invoice-data\",\"fvMenuName\":\"Invoices\"},{\"fvMenuUrl\":\"#/dashboard1\",\"fvMenuName\":\"Dashboard\"},{\"fvMenuUrl\":\"#/Order-status-report\",\"fvMenuName\":\"Status Report - Orders\"},{\"fvMenuUrl\":\"#/resources\",\"fvMenuName\":\"Resources\"},{\"fvMenuUrl\":\"#/user/1\",\"fvMenuName\":\"Internal Resource\"},{\"fvMenuUrl\":\"#/Jobs-status-report\",\"fvMenuName\":\"Status Report - Jobs\"},{\"fvMenuUrl\":\"#/customer-status\",\"fvMenuName\":\"Client Status\"},{\"fvMenuUrl\":\"#/currency\",\"fvMenuName\":\"Currency\"},{\"fvMenuUrl\":\"#/statement\",\"fvMenuName\":\"Statement Page\"}]', '2018-12-20 18:17:50', '2022-04-12 16:39:47');

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
(1, 0, 're0001', 0, '', '', 0, 0, 1, 0, 0, 0, 0, 0, '', '', '2017-10-06 00:00:00', '2017-10-06 00:00:00'),
(2, 0, 'external-0001', 0, '', '', 0, 0, 2, 0, 0, 0, 0, 0, '', '', '2018-12-11 12:48:41', '2018-12-11 12:48:41'),
(4, 0, 'Projects', 2, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 0, 'Invoice', 2, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 0, 'kanhasoft-001', 0, '', '', 1, 0, 0, 0, 0, 0, 0, 0, '', '', '2018-12-12 16:55:13', '2018-12-12 16:55:13'),
(8, 0, 'Projects', 6, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2018-12-12 16:55:13', '2018-12-12 16:55:13'),
(9, 0, 'Invoice', 6, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2018-12-12 16:55:13', '2018-12-12 16:55:13'),
(10, 0, 'LOG180001', 8, '2', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 0, 'Jobs', 10, '2', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 0, 'internal-0002', 0, '', '', 0, 0, 3, 0, 0, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 0, 'internal-0003', 0, '', '', 0, 0, 4, 0, 0, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 0, 'Indirect client', 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2018-12-13 00:00:00', '2018-12-13 00:00:00'),
(15, 0, 'testaccount-001', 0, '', '', 0, 1, 0, 0, 0, 0, 0, 0, '', '', '2018-12-13 10:55:02', '2018-12-13 10:55:02'),
(16, 0, 'Item001', 10, '2', '', 0, 0, 0, 1, 0, 0, 0, 0, '', '', '2018-12-13 11:01:30', '2018-12-13 11:01:30'),
(17, 0, 'BAD001', 11, '2', '1', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2018-12-13 11:02:21', '2018-12-13 11:02:21'),
(18, 0, '_in', 17, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2018-12-13 11:02:21', '2018-12-13 11:02:21'),
(19, 0, '_out', 17, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2018-12-13 11:02:21', '2018-12-13 11:02:21'),
(21, 0, 'internal-0004', 0, '', '', 0, 0, 5, 0, 0, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 0, 'DTP002', 11, '2', '2', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2018-12-13 18:53:36', '2018-12-13 18:53:36'),
(23, 0, '_in', 22, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2018-12-13 18:53:36', '2018-12-13 18:53:36'),
(24, 0, '_out', 22, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2018-12-13 18:53:36', '2018-12-13 18:53:36'),
(25, 1, '687_697057-facebook-512.png', 15, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '23.96 KB', '2018-12-21 15:35:54', '2018-12-21 15:35:54'),
(33, 1, '163_img.png', 2, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '6.53 KB', '2019-01-04 18:42:27', '2019-01-04 18:42:27'),
(34, 1, '53_456.png', 2, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '357.46 KB', '2019-01-04 18:42:27', '2019-01-04 18:42:27'),
(35, 1, '160_Prey-logo-1-icon.png', 2, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '58.50 KB', '2019-01-04 18:42:28', '2019-01-04 18:42:28'),
(50, 1, '220_target.jpg', 19, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '178.60 KB', '2019-01-08 11:45:07', '2019-01-08 11:45:07'),
(51, 0, 'infosys-002', 0, '', '', 2, 0, 0, 0, 0, 0, 0, 0, '', '', '2019-01-08 12:08:27', '2019-01-08 12:08:27'),
(52, 0, 'Data', 51, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2019-01-08 12:08:27', '2019-01-08 12:08:27'),
(53, 0, 'Projects', 51, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2019-01-08 12:08:27', '2019-01-08 12:08:27'),
(54, 0, 'Invoice', 51, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '2019-01-08 12:08:27', '2019-01-08 12:08:27'),
(55, 0, 'inx-002', 0, '', '', 0, 2, 0, 0, 0, 0, 0, 0, '', '', '2019-01-08 12:20:36', '2019-01-08 12:20:36'),
(57, 0, 'Jobs', 56, '28', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 0, 'Item001', 56, '28', '', 0, 0, 0, 6, 0, 0, 0, 0, '', '', '2019-01-08 12:33:25', '2019-01-08 12:33:25'),
(80, 0, 'Item002', 56, '28', '', 0, 0, 0, 7, 0, 0, 0, 0, '', '', '2019-01-09 15:37:29', '2019-01-09 15:37:29'),
(93, 0, 'COP003', 57, '28', '17', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2019-01-09 15:56:33', '2019-01-09 15:56:33'),
(94, 0, '_in', 93, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2019-01-09 15:56:33', '2019-01-09 15:56:33'),
(95, 0, '_out', 93, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2019-01-09 15:56:33', '2019-01-09 15:56:33'),
(96, 0, 'DTP004', 57, '28', '18', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2019-01-09 17:11:04', '2019-01-09 17:11:04'),
(97, 0, '_in', 96, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2019-01-09 17:11:04', '2019-01-09 17:11:04'),
(98, 0, '_out', 96, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2019-01-09 17:11:04', '2019-01-09 17:11:04'),
(102, 1, 'asdsad', 1, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2019-04-04 19:48:38', '2019-04-04 19:48:38'),
(103, 1, '391_Capture1.PNG', 102, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'PNG', '93.71 KB', '2019-04-04 19:48:49', '2019-04-04 19:48:49'),
(104, 1, '108_City_scrapper_-_Copy.xlsx', 102, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '19.66 KB', '2019-04-04 19:48:49', '2019-04-04 19:48:49'),
(105, 1, '736_City_scrapper.xlsx', 102, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '17.17 KB', '2019-04-04 19:48:49', '2019-04-04 19:48:49'),
(107, 0, 'Jobs', 106, '29', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 0, 'Item001', 106, '29', '', 0, 0, 0, 9, 0, 0, 0, 0, '', '', '2021-03-01 17:36:30', '2021-03-01 17:36:30'),
(113, 0, 'SEO001', 107, '29', '21', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-03-01 17:38:10', '2021-03-01 17:38:10'),
(114, 0, '_in', 113, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-03-01 17:38:10', '2021-03-01 17:38:10'),
(115, 0, '_out', 113, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-03-01 17:38:10', '2021-03-01 17:38:10'),
(116, 0, 'DTP002', 107, '29', '22', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-03-01 17:38:10', '2021-03-01 17:38:10'),
(117, 0, '_in', 116, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-03-01 17:38:10', '2021-03-01 17:38:10'),
(118, 0, '_out', 116, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-03-01 17:38:10', '2021-03-01 17:38:10'),
(119, 0, 'DTC004', 107, '29', '23', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-03-01 17:38:10', '2021-03-01 17:38:10'),
(120, 0, '_in', 119, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-03-01 17:38:10', '2021-03-01 17:38:10'),
(121, 0, '_out', 119, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-03-01 17:38:11', '2021-03-01 17:38:11'),
(123, 0, 'Jobs', 122, '34', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, 0, 'Jobs', 124, '35', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 0, 'Jobs', 126, '36', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, 0, 'Jobs', 128, '37', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 0, 'Jobs', 130, '38', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, 0, 'Jobs', 132, '40', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 0, 'Jobs', 134, '41', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, 0, 'Jobs', 136, '42', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, 0, 'Item001', 136, '42', '', 0, 0, 0, 10, 0, 0, 0, 0, '', '', '2021-04-15 23:17:14', '2021-04-15 23:17:14'),
(139, 0, 'Item002', 136, '42', '', 0, 0, 0, 11, 0, 0, 0, 0, '', '', '2021-04-15 23:17:14', '2021-04-15 23:17:14'),
(140, 0, 'SEO001', 137, '42', '24', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-05-03 16:51:51', '2021-05-03 16:51:51'),
(141, 0, '_in', 140, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-05-03 16:51:51', '2021-05-03 16:51:51'),
(142, 0, '_out', 140, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-05-03 16:51:51', '2021-05-03 16:51:51'),
(143, 0, 'DTP002', 137, '42', '25', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-05-03 16:51:51', '2021-05-03 16:51:51'),
(144, 0, '_in', 143, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-05-03 16:51:51', '2021-05-03 16:51:51'),
(145, 0, '_out', 143, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-05-03 16:51:51', '2021-05-03 16:51:51'),
(146, 0, 'DTC004', 137, '42', '26', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-05-03 16:51:52', '2021-05-03 16:51:52'),
(147, 0, '_in', 146, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-05-03 16:51:52', '2021-05-03 16:51:52'),
(148, 0, '_out', 146, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-05-03 16:51:52', '2021-05-03 16:51:52'),
(149, 0, 'DTC005', 137, '42', '27', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-05-04 12:10:51', '2021-05-04 12:10:51'),
(150, 0, '_in', 149, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-05-04 12:10:51', '2021-05-04 12:10:51'),
(151, 0, '_out', 149, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-05-04 12:10:51', '2021-05-04 12:10:51'),
(152, 0, 'Item001', 134, '41', '', 0, 0, 0, 12, 0, 0, 0, 0, '', '', '2021-05-04 14:33:44', '2021-05-04 14:33:44'),
(153, 0, 'SEO001', 135, '41', '28', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-05-04 14:35:02', '2021-05-04 14:35:02'),
(154, 0, '_in', 153, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-05-04 14:35:02', '2021-05-04 14:35:02'),
(155, 0, '_out', 153, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-05-04 14:35:02', '2021-05-04 14:35:02'),
(156, 0, 'DTP002', 135, '41', '29', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-05-04 14:35:03', '2021-05-04 14:35:03'),
(157, 0, '_in', 156, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-05-04 14:35:03', '2021-05-04 14:35:03'),
(158, 0, '_out', 156, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-05-04 14:35:03', '2021-05-04 14:35:03'),
(159, 0, 'DTC004', 135, '41', '30', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-05-04 14:35:04', '2021-05-04 14:35:04'),
(160, 0, '_in', 159, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-05-04 14:35:04', '2021-05-04 14:35:04'),
(161, 0, '_out', 159, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-05-04 14:35:04', '2021-05-04 14:35:04'),
(166, 1, '759_sea-wave-photo-transparent-png-stickpng-0.png', 112, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '605.42 KB', '2021-05-05 18:59:38', '2021-05-05 18:59:38'),
(167, 1, '316_imgpnn.png', 112, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '199.29 KB', '2021-05-05 19:17:32', '2021-05-05 19:17:32'),
(207, 0, 'Jobs', 206, '44', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(208, 0, 'Item001', 206, '44', '', 0, 0, 0, 13, 0, 0, 0, 0, '', '', '2021-05-10 12:42:21', '2021-05-10 12:42:21'),
(211, 1, 'Abc', 16, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-05-26 14:58:57', '2021-05-24 17:32:37'),
(214, 1, '85_TMS_Feedback_-_07.05.2021.docx', 108, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '437.77 KB', '2021-06-01 19:18:57', '2021-06-01 19:18:57'),
(218, 0, 'Jobs', 217, '46', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(219, 0, 'Item001', 217, '46', '', 0, 0, 0, 14, 0, 0, 0, 0, '', '', '2021-06-02 19:20:16', '2021-06-02 19:20:16'),
(220, 0, 'FED001', 218, '46', '31', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-02 19:33:07', '2021-06-02 19:33:07'),
(221, 0, '_in', 220, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-02 19:33:07', '2021-06-02 19:33:07'),
(222, 0, '_out', 220, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-02 19:33:07', '2021-06-02 19:33:07'),
(223, 1, '773_INV70-235-064-2033111-postproc.pdf', 219, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '230.08 KB', '2021-06-02 19:41:37', '2021-06-02 19:41:37'),
(227, 0, 'DTC002', 218, '46', '32', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-02 19:48:43', '2021-06-02 19:48:43'),
(228, 0, '_in', 227, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-02 19:48:43', '2021-06-02 19:48:43'),
(229, 0, '_out', 227, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-02 19:48:43', '2021-06-02 19:48:43'),
(231, 0, 'Jobs', 230, '49', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(232, 0, 'Item001', 230, '49', '', 0, 0, 0, 15, 0, 0, 0, 0, '', '', '2021-06-04 16:06:27', '2021-06-04 16:06:27'),
(233, 0, 'DTC001', 231, '49', '33', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-04 16:21:40', '2021-06-04 16:21:40'),
(234, 0, '_in', 233, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-04 16:21:40', '2021-06-04 16:21:40'),
(235, 0, '_out', 233, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-04 16:21:40', '2021-06-04 16:21:40'),
(237, 0, 'Jobs', 236, '51', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(238, 0, 'Item001', 236, '51', '', 0, 0, 0, 16, 0, 0, 0, 0, '', '', '2021-06-04 17:38:25', '2021-06-04 17:38:25'),
(239, 0, 'Item002', 236, '51', '', 0, 0, 0, 17, 0, 0, 0, 0, '', '', '2021-06-04 17:38:25', '2021-06-04 17:38:25'),
(240, 0, 'Item003', 236, '51', '', 0, 0, 0, 18, 0, 0, 0, 0, '', '', '2021-06-04 17:38:25', '2021-06-04 17:38:25'),
(241, 0, 'Item002', 217, '46', '', 0, 0, 0, 19, 0, 0, 0, 0, '', '', '2021-06-04 18:09:31', '2021-06-04 18:09:31'),
(242, 1, '127_people_(3).xlsx', 58, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '5.51 KB', '2021-06-04 18:36:22', '2021-06-04 18:36:22'),
(243, 0, 'DTC004', 11, '2', '34', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-09 09:50:46', '2021-06-09 09:50:46'),
(244, 0, '_in', 243, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-09 09:50:46', '2021-06-09 09:50:46'),
(245, 0, '_out', 243, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-09 09:50:46', '2021-06-09 09:50:46'),
(246, 1, '381_freshpath.jpeg', 232, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpeg', '49.82 KB', '2021-06-10 17:04:56', '2021-06-10 17:04:56'),
(249, 1, '869_sample.pdf', 211, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '2.96 KB', '2021-06-18 19:07:49', '2021-06-18 19:07:49'),
(250, 1, '816_earth.jpg', 211, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '11.96 KB', '2021-06-18 19:10:22', '2021-06-18 19:10:22'),
(251, 1, 'Parents folder', 18, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-21 11:18:37', '2021-06-21 11:18:37'),
(254, 1, 'abc2', 211, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-21 11:28:49', '2021-06-21 11:28:49'),
(261, 0, 'Jobs', 260, '54', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(262, 0, 'Item001', 260, '54', '', 0, 0, 0, 20, 0, 0, 0, 0, '', '', '2021-06-21 17:16:52', '2021-06-21 17:16:52'),
(263, 0, 'Item002', 260, '54', '', 0, 0, 0, 21, 0, 0, 0, 0, '', '', '2021-06-21 17:16:52', '2021-06-21 17:16:52'),
(266, 0, 'BAD001', 261, '54', '36', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-21 17:19:35', '2021-06-21 17:19:35'),
(267, 0, '_in', 266, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-21 17:19:35', '2021-06-21 17:19:35'),
(268, 0, '_out', 266, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-21 17:19:35', '2021-06-21 17:19:35'),
(272, 0, 'DTP002', 261, '54', '38', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-21 17:38:27', '2021-06-21 17:38:27'),
(273, 0, '_in', 272, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-21 17:38:27', '2021-06-21 17:38:27'),
(274, 0, '_out', 272, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-21 17:38:27', '2021-06-21 17:38:27'),
(275, 0, 'Item002', 106, '29', '', 0, 0, 0, 24, 0, 0, 0, 0, '', '', '2021-06-21 17:55:32', '2021-06-21 17:55:32'),
(276, 0, 'Item003', 106, '29', '', 0, 0, 0, 25, 0, 0, 0, 0, '', '', '2021-06-21 18:00:06', '2021-06-21 18:00:06'),
(277, 0, 'COP005', 107, '29', '39', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-21 18:01:28', '2021-06-21 18:01:28'),
(278, 0, '_in', 277, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-21 18:01:28', '2021-06-21 18:01:28'),
(279, 0, '_out', 277, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-21 18:01:28', '2021-06-21 18:01:28'),
(280, 0, 'Item001', 124, '35', '', 0, 0, 0, 26, 0, 0, 0, 0, '', '', '2021-06-21 18:06:39', '2021-06-21 18:06:39'),
(281, 0, 'Item002', 124, '35', '', 0, 0, 0, 27, 0, 0, 0, 0, '', '', '2021-06-21 18:06:39', '2021-06-21 18:06:39'),
(282, 0, 'BAD001', 125, '35', '40', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-21 18:08:02', '2021-06-21 18:08:02'),
(283, 0, '_in', 282, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-21 18:08:02', '2021-06-21 18:08:02'),
(284, 0, '_out', 282, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-21 18:08:02', '2021-06-21 18:08:02'),
(285, 0, 'BAD002', 125, '35', '41', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-21 19:15:46', '2021-06-21 19:15:46'),
(286, 0, '_in', 285, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-21 19:15:46', '2021-06-21 19:15:46'),
(287, 0, '_out', 285, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-21 19:15:46', '2021-06-21 19:15:46'),
(289, 0, 'Jobs', 288, '55', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(290, 0, 'Item001', 288, '55', '', 0, 0, 0, 28, 0, 0, 0, 0, '', '', '2021-06-22 11:44:32', '2021-06-22 11:44:32'),
(291, 0, 'COP001', 289, '55', '42', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-22 11:47:02', '2021-06-22 11:47:02'),
(292, 0, '_in', 291, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-22 11:47:02', '2021-06-22 11:47:02'),
(293, 0, '_out', 291, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-22 11:47:02', '2021-06-22 11:47:02'),
(294, 1, '640_import_probing_sheet_en_(1).xlsx', 112, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '11.25 KB', '2021-06-22 12:27:58', '2021-06-22 12:27:58'),
(295, 1, '487_import_probing_sheet_en.xlsx', 112, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '8.62 KB', '2021-06-22 12:27:58', '2021-06-22 12:27:58'),
(296, 1, '180_WhatsApp_Image_2021-06-20_at_10.05.51_AM.jpeg', 112, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpeg', '100.65 KB', '2021-06-22 12:28:04', '2021-06-22 12:28:04'),
(297, 1, '313_tabula-LOGs.xlsx', 112, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '136.58 KB', '2021-06-22 12:28:05', '2021-06-22 12:28:05'),
(298, 1, '1_import.xlsx', 112, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '398.54 KB', '2021-06-22 12:28:22', '2021-06-22 12:28:22'),
(299, 1, 'Jaimini', 112, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-22 12:29:23', '2021-06-22 12:29:23'),
(300, 1, '626_nationaltestserver_extra_billing.csv', 299, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '0.18 KB', '2021-06-22 12:29:55', '2021-06-22 12:29:55'),
(301, 1, '170_download.jfif', 299, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jfif', '4.16 KB', '2021-06-22 12:33:14', '2021-06-22 12:33:14'),
(302, 1, '499_RPTID1105.pdf', 299, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '123.56 KB', '2021-06-22 12:35:02', '2021-06-22 12:35:02'),
(303, 1, '686_file_example_XLSX_5000.xlsx', 299, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '184.46 KB', '2021-06-22 12:35:57', '2021-06-22 12:35:57'),
(304, 1, '767_download.jfif', 299, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jfif', '4.16 KB', '2021-06-22 12:36:55', '2021-06-22 12:36:55'),
(305, 1, '726_Clipboard_-_September_23,_2020_3_17_PM.png', 299, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '159.95 KB', '2021-06-22 12:40:17', '2021-06-22 12:40:17'),
(306, 0, 'Item001', 130, '38', '', 0, 0, 0, 29, 0, 0, 0, 0, '', '', '2021-06-22 13:17:31', '2021-06-22 13:17:31'),
(309, 0, 'SEO001', 131, '38', '43', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-22 13:18:31', '2021-06-22 13:18:31'),
(310, 0, '_in', 309, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-22 13:18:31', '2021-06-22 13:18:31'),
(311, 0, '_out', 309, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-22 13:18:31', '2021-06-22 13:18:31'),
(312, 1, 'Test', 306, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-22 13:19:16', '2021-06-22 13:19:16'),
(313, 1, 'Test432', 306, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-22 13:27:13', '2021-06-22 13:27:13'),
(314, 1, '704_726_Clipboard_-_September_23,_2020_3_17_PM.png', 312, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '159.95 KB', '2021-06-22 13:31:55', '2021-06-22 13:31:55'),
(316, 1, '525_24947.pdf', 313, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '73.70 KB', '2021-06-22 13:33:33', '2021-06-22 13:33:33'),
(317, 1, '870_83_Detailed_Advt_19012021.pdf', 313, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '198.62 KB', '2021-06-22 13:33:43', '2021-06-22 13:33:43'),
(318, 1, '21_gsync_EIG297075700_(1).pdf', 313, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '262.38 KB', '2021-06-22 13:33:45', '2021-06-22 13:33:45'),
(319, 1, '6_gsync_EIG297075700.pdf', 313, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '262.38 KB', '2021-06-22 13:33:46', '2021-06-22 13:33:46'),
(320, 1, '312_nationaltestserver_policyList_(1).csv', 313, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '14.12 KB', '2021-06-22 13:34:37', '2021-06-22 13:34:37'),
(321, 1, '593_import_probing_sheet_en_(1).xlsx', 288, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '11.25 KB', '2021-06-22 14:33:56', '2021-06-22 14:33:56'),
(322, 1, '610_Dashboard_Feedback_-_10.03.2021.docx', 306, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '13.92 KB', '2021-06-22 14:39:07', '2021-06-22 14:39:07'),
(323, 0, 'Item001', 128, '37', '', 0, 0, 0, 32, 0, 0, 0, 0, '', '', '2021-06-22 17:51:13', '2021-06-22 17:51:13'),
(324, 0, 'DTP001', 129, '37', '44', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-22 17:53:23', '2021-06-22 17:53:23'),
(325, 0, '_in', 324, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-22 17:53:23', '2021-06-22 17:53:23'),
(326, 0, '_out', 324, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-22 17:53:23', '2021-06-22 17:53:23'),
(327, 1, '294_nationaltestserver_extra_billing.csv', 290, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '0.18 KB', '2021-06-23 14:36:39', '2021-06-23 14:36:39'),
(328, 1, '834_newplot_(1).png', 290, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '51.93 KB', '2021-06-23 14:37:25', '2021-06-23 14:37:25'),
(329, 1, '605_TMS_Feedback_-_02.06.2021_-_updated.docx', 290, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '770.48 KB', '2021-06-23 14:37:41', '2021-06-23 14:37:41'),
(330, 1, '661_Jaimini16921692_noon-coop.pdf', 290, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '53.60 KB', '2021-06-23 14:38:02', '2021-06-23 14:38:02'),
(331, 1, '986_ABC14781478_noon-coop.pdf', 290, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '133.73 KB', '2021-06-23 14:38:02', '2021-06-23 14:38:02'),
(332, 1, '61_KWC1195459_noon-coop.pdf', 290, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '133.73 KB', '2021-06-23 14:38:10', '2021-06-23 14:38:10'),
(335, 1, '825_Localization_probings.csv', 312, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '7.16 KB', '2021-06-23 16:40:24', '2021-06-23 16:40:24'),
(336, 1, '503_Explanation_Samples.csv', 312, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '10.33 KB', '2021-06-23 16:40:25', '2021-06-23 16:40:25'),
(337, 1, '752_newplot.png', 312, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '51.93 KB', '2021-06-23 16:40:26', '2021-06-23 16:40:26'),
(338, 1, '245_newplot_(1).png', 312, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '51.93 KB', '2021-06-23 16:40:29', '2021-06-23 16:40:29'),
(339, 1, '343_import_probing_sheet_en.xlsx', 312, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '8.62 KB', '2021-06-23 16:41:26', '2021-06-23 16:41:26'),
(340, 1, '517_import_probing_sheet_en_(1)_(1).xlsx', 312, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '8.47 KB', '2021-06-23 16:41:26', '2021-06-23 16:41:26'),
(341, 1, '209_lead-1619700589_(2).xlsx', 306, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '9.55 KB', '2021-06-23 16:44:07', '2021-06-23 16:44:07'),
(342, 1, '30_lead-1619700589_(2).xlsx', 306, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '9.55 KB', '2021-06-23 16:44:07', '2021-06-23 16:44:07'),
(343, 1, '468_Financial_Sample_(1).xlsx', 306, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '89.78 KB', '2021-06-23 16:44:14', '2021-06-23 16:44:14'),
(344, 1, '285_file_example_XLSX_5000_(1).xlsx', 306, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '184.46 KB', '2021-06-23 16:44:26', '2021-06-23 16:44:26'),
(345, 1, '279_C_D_waste_Processing_Details_AMC.pdf', 306, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '565.01 KB', '2021-06-23 16:47:11', '2021-06-23 16:47:11'),
(346, 1, '977_file_example_XLSX_5000_(1).xlsx', 221, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '184.46 KB', '2021-06-23 17:27:41', '2021-06-23 17:27:41'),
(347, 1, 'Jimi1', 221, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-23 17:27:55', '2021-06-23 17:27:55'),
(348, 1, '688_file_example_XLSX_5000.xlsx', 228, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '184.46 KB', '2021-06-23 17:29:22', '2021-06-23 17:29:22'),
(349, 1, '942_file_example_XLSX_5000.xlsx', 241, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '184.46 KB', '2021-06-23 17:30:30', '2021-06-23 17:30:30'),
(350, 1, 'test1', 241, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-23 17:30:38', '2021-06-23 17:30:38'),
(351, 1, '745_nationaltestserver_policyList_(2).csv', 350, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '0.97 KB', '2021-06-23 17:32:13', '2021-06-23 17:32:13'),
(352, 1, '358_vijay2_gohil_excel.xlsx', 350, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '25.05 KB', '2021-06-23 17:32:15', '2021-06-23 17:32:15'),
(353, 1, '920_Park_Towers_East_LLC_-_KWC1160911.xls', 350, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xls', '472.50 KB', '2021-06-23 17:33:00', '2021-06-23 17:33:00'),
(354, 0, 'Item001', 132, '40', '', 0, 0, 0, 33, 0, 0, 0, 0, '', '', '2021-06-23 18:16:38', '2021-06-23 18:16:38'),
(355, 1, '8_tabula-LOGs.xlsx', 354, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '136.58 KB', '2021-06-23 18:17:37', '2021-06-23 18:17:37'),
(356, 1, '10', 354, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-23 18:17:59', '2021-06-23 18:17:59'),
(357, 1, 'abc', 354, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-23 18:18:11', '2021-06-23 18:18:11'),
(358, 1, 'arya123', 354, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-23 18:20:31', '2021-06-23 18:20:31'),
(359, 1, '123333333', 354, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-23 18:20:49', '2021-06-23 18:20:49'),
(360, 1, '668_Localization_probings.csv', 280, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '7.16 KB', '2021-06-23 18:36:08', '2021-06-23 18:36:08'),
(362, 1, '23_127_people_(3).xlsx', 280, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '5.51 KB', '2021-06-23 18:36:09', '2021-06-23 18:36:09'),
(364, 1, '578_newplot_(1).png', 280, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '51.93 KB', '2021-06-23 18:36:13', '2021-06-23 18:36:13'),
(395, 1, '251_668_Localization_probings.csv', 18, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '7.16 KB', '2021-06-29 10:06:50', '2021-06-29 10:06:50'),
(412, 0, 'Jobs', 411, '56', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(413, 0, 'Item001', 411, '56', '', 0, 0, 0, 34, 0, 0, 0, 0, '', '', '2021-06-29 14:04:02', '2021-06-29 14:04:02'),
(414, 1, '325_TMS_Feedback_-_02.06.2021.docx', 413, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '770.28 KB', '2021-06-29 14:07:49', '2021-06-29 14:07:49'),
(415, 1, 'Original files', 413, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-29 14:09:19', '2021-06-29 14:09:19'),
(416, 1, 'Client Files', 413, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-29 14:09:28', '2021-06-29 14:09:28'),
(417, 1, '208_TMS_Feedback_-_02.06.2021.docx', 415, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '770.28 KB', '2021-06-29 14:09:42', '2021-06-29 14:09:42'),
(418, 1, '353_joined-P12737-J9-10-en_gb-fi_fi-T.docx', 415, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '42.18 KB', '2021-06-29 14:10:06', '2021-06-29 14:10:06'),
(419, 0, 'FED001', 412, '56', '45', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-29 14:13:12', '2021-06-29 14:13:12'),
(420, 0, '_in', 419, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-29 14:13:12', '2021-06-29 14:13:12'),
(421, 0, '_out', 419, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-29 14:13:12', '2021-06-29 14:13:12'),
(423, 0, 'Item001', 422, '57', '', 0, 0, 0, 35, 0, 0, 0, 0, '', '', '2021-06-29 15:48:50', '2021-06-29 15:48:50'),
(438, 0, 'DTC005', 57, '28', '49', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-30 09:21:07', '2021-06-30 09:21:07'),
(439, 0, '_in', 438, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-30 09:21:07', '2021-06-30 09:21:07'),
(440, 0, '_out', 438, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-30 09:21:07', '2021-06-30 09:21:07'),
(441, 0, 'FED006', 107, '29', '50', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-30 11:10:47', '2021-06-30 11:10:47'),
(442, 0, '_in', 441, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-30 11:10:47', '2021-06-30 11:10:47'),
(443, 0, '_out', 441, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-06-30 11:10:47', '2021-06-30 11:10:47'),
(444, 0, 'DTC001', 0, '57', '51', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-02 19:37:19', '2021-07-02 19:37:19'),
(445, 0, '_in', 444, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-02 19:37:19', '2021-07-02 19:37:19'),
(446, 0, '_out', 444, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-02 19:37:19', '2021-07-02 19:37:19'),
(448, 0, 'Jobs', 447, '58', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(449, 0, 'Item001', 447, '58', '', 0, 0, 0, 39, 0, 0, 0, 0, '', '', '2021-07-05 10:39:41', '2021-07-05 10:39:41'),
(450, 0, 'COP001', 448, '58', '52', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-05 10:40:59', '2021-07-05 10:40:59'),
(451, 0, '_in', 450, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-05 10:40:59', '2021-07-05 10:40:59'),
(452, 0, '_out', 450, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-05 10:40:59', '2021-07-05 10:40:59'),
(453, 0, 'Item002', 447, '58', '', 0, 0, 0, 40, 0, 0, 0, 0, '', '', '2021-07-05 10:42:51', '2021-07-05 10:42:51'),
(454, 0, 'DTP002', 448, '58', '53', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-05 10:44:03', '2021-07-05 10:44:03'),
(455, 0, '_in', 454, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-05 10:44:03', '2021-07-05 10:44:03'),
(456, 0, '_out', 454, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-05 10:44:03', '2021-07-05 10:44:03'),
(457, 0, 'external-0002', 0, '', '', 0, 0, 6, 0, 0, 0, 0, 0, '', '', '2021-07-05 12:10:35', '2021-07-05 12:10:35'),
(458, 0, 'Data', 457, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(459, 0, 'Projects', 457, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(460, 0, 'Invoice', 457, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(461, 0, 'external-0003', 0, '', '', 0, 0, 7, 0, 0, 0, 0, 0, '', '', '2021-07-05 13:05:39', '2021-07-05 13:05:39'),
(462, 0, 'Data', 461, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(463, 0, 'Projects', 461, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(464, 0, 'Invoice', 461, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(465, 0, 'external-0004', 0, '', '', 0, 0, 8, 0, 0, 0, 0, 0, '', '', '2021-07-05 13:17:30', '2021-07-05 13:17:30'),
(466, 0, 'Data', 465, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(467, 0, 'Projects', 465, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(468, 0, 'Invoice', 465, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(469, 0, 'internal-0005', 0, '', '', 0, 0, 9, 0, 0, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(471, 0, 'Jobs', 470, '59', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(472, 0, 'Item001', 470, '59', '', 0, 0, 0, 41, 0, 0, 0, 0, '', '', '2021-07-06 09:48:04', '2021-07-06 09:48:04'),
(473, 0, 'Item002', 470, '59', '', 0, 0, 0, 42, 0, 0, 0, 0, '', '', '2021-07-06 09:48:04', '2021-07-06 09:48:04'),
(474, 0, 'COP001', 471, '59', '54', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-06 09:53:09', '2021-07-06 09:53:09'),
(475, 0, '_in', 474, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-06 09:53:09', '2021-07-06 09:53:09'),
(476, 0, '_out', 474, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-06 09:53:09', '2021-07-06 09:53:09'),
(477, 0, 'FED002', 471, '59', '55', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-06 09:54:40', '2021-07-06 09:54:40'),
(478, 0, '_in', 477, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-06 09:54:40', '2021-07-06 09:54:40'),
(479, 0, '_out', 477, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-06 09:54:40', '2021-07-06 09:54:40'),
(480, 1, 'Testnewdoc', 475, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-06 09:56:51', '2021-07-06 09:56:51'),
(481, 1, '5_chatlist1.png', 480, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '583.84 KB', '2021-07-06 09:58:41', '2021-07-06 09:58:41'),
(482, 1, '771_10701200243.pdf', 478, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '380.04 KB', '2021-07-06 10:20:27', '2021-07-06 10:20:27'),
(483, 1, '57_From16_20-21.pdf', 478, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '209.64 KB', '2021-07-06 10:20:28', '2021-07-06 10:20:28'),
(484, 1, '717_Blank.pdf', 478, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '355.54 KB', '2021-07-06 10:20:32', '2021-07-06 10:20:32'),
(485, 2, '153_10701200243.pdf', 476, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '380.04 KB', '2021-07-06 10:30:42', '2021-07-06 10:30:42'),
(486, 0, 'external-0005', 0, '', '', 0, 0, 10, 0, 0, 0, 0, 0, '', '', '2021-07-06 12:28:51', '2021-07-06 12:28:51'),
(487, 0, 'Data', 486, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(488, 0, 'Projects', 486, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(489, 0, 'Invoice', 486, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(491, 0, 'Jobs', 490, '60', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(492, 0, 'Item001', 490, '60', '', 0, 0, 0, 43, 0, 0, 0, 0, '', '', '2021-07-06 12:37:24', '2021-07-06 12:37:24'),
(494, 0, 'TEST001', 491, '60', '56', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-06 12:40:20', '2021-07-06 12:40:20'),
(495, 0, '_in', 494, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-06 12:40:20', '2021-07-06 12:40:20'),
(496, 0, '_out', 494, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-06 12:40:20', '2021-07-06 12:40:20'),
(498, 0, 'Jobs', 497, '61', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(499, 0, 'Item001', 497, '61', '', 0, 0, 0, 44, 0, 0, 0, 0, '', '', '2021-07-06 12:56:18', '2021-07-06 12:56:18'),
(500, 0, 'TEST001', 498, '61', '57', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-06 12:57:30', '2021-07-06 12:57:30'),
(501, 0, '_in', 500, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-06 12:57:30', '2021-07-06 12:57:30'),
(502, 0, '_out', 500, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-06 12:57:30', '2021-07-06 12:57:30'),
(503, 2, 'test44', 502, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-06 18:00:26', '2021-07-06 18:00:26'),
(504, 2, '461_today.pdf', 503, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '11.00 KB', '2021-07-06 18:01:02', '2021-07-06 18:01:02'),
(505, 2, '723_Blank.pdf', 503, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '355.54 KB', '2021-07-06 18:01:05', '2021-07-06 18:01:05'),
(506, 2, '60_From16_20-21.pdf', 503, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '209.64 KB', '2021-07-06 18:01:07', '2021-07-06 18:01:07'),
(507, 2, '386_027c3454-4307-45d7-b0e3-3b16cbd9321d.pdf', 503, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '117.16 KB', '2021-07-06 18:01:07', '2021-07-06 18:01:07'),
(518, 2, '999_test3_status_time_service_(4).csv', 517, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '3.76 KB', '2021-07-06 18:15:19', '2021-07-06 18:15:19'),
(519, 2, '824_test3_status_time_service_(3).csv', 517, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '0.23 KB', '2021-07-06 18:15:19', '2021-07-06 18:15:19'),
(520, 2, '974_test3_status_time_service.csv', 517, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '0.13 KB', '2021-07-06 18:15:19', '2021-07-06 18:15:19'),
(521, 2, '463_test3_status_time_service.csv', 517, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '0.13 KB', '2021-07-06 18:15:19', '2021-07-06 18:15:19'),
(523, 0, 'Jobs', 522, '62', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(524, 0, 'Item001', 522, '62', '', 0, 0, 0, 45, 0, 0, 0, 0, '', '', '2021-07-06 18:23:54', '2021-07-06 18:23:54'),
(525, 0, 'FED001', 523, '62', '58', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-06 20:34:52', '2021-07-06 20:34:52'),
(526, 0, '_in', 525, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-06 20:34:52', '2021-07-06 20:34:52'),
(527, 0, '_out', 525, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-06 20:34:52', '2021-07-06 20:34:52'),
(529, 1, '380_currency.png', 527, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '94.28 KB', '2021-07-06 20:41:09', '2021-07-06 20:41:09'),
(530, 1, '344_today.pdf', 527, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '11.00 KB', '2021-07-06 20:41:09', '2021-07-06 20:41:09'),
(531, 1, '582_axedo.png', 527, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '133.15 KB', '2021-07-06 20:41:26', '2021-07-06 20:41:26'),
(532, 1, '33_10701200243.pdf', 527, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '380.04 KB', '2021-07-06 20:41:43', '2021-07-06 20:41:43'),
(533, 1, '569_currency.png', 526, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '94.28 KB', '2021-07-07 10:07:09', '2021-07-07 10:07:09'),
(534, 1, '406_10701200243.pdf', 526, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '380.04 KB', '2021-07-07 10:07:25', '2021-07-07 10:07:25'),
(535, 1, '307_Blank.pdf', 526, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '355.54 KB', '2021-07-07 10:07:28', '2021-07-07 10:07:28'),
(536, 2, 'Pro111', 284, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-07 10:21:23', '2021-07-07 10:21:23'),
(537, 2, '667_project-Jobs-status-report.xls', 284, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xls', '13.61 KB', '2021-07-07 10:22:49', '2021-07-07 10:22:49'),
(538, 2, '29_currency.png', 284, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '94.28 KB', '2021-07-07 10:22:56', '2021-07-07 10:22:56'),
(539, 2, '479_axedo.png', 284, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '133.15 KB', '2021-07-07 10:23:13', '2021-07-07 10:23:13'),
(540, 2, '966_10701200243.pdf', 284, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '380.04 KB', '2021-07-07 10:23:22', '2021-07-07 10:23:22'),
(541, 2, '997_10701200253.pdf', 284, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '377.46 KB', '2021-07-07 10:23:31', '2021-07-07 10:23:31'),
(542, 2, '980_currency.png', 536, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '94.28 KB', '2021-07-07 10:23:46', '2021-07-07 10:23:46'),
(543, 2, '646_today.pdf', 536, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '11.00 KB', '2021-07-07 10:24:45', '2021-07-07 10:24:45'),
(544, 2, '208_a529052d-79df-4bc7-87ec-4b744fbaeadf.pdf', 536, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '118.16 KB', '2021-07-07 10:24:46', '2021-07-07 10:24:46'),
(545, 1, '486_test3_policyList_(11).csv', 499, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '0.92 KB', '2021-07-12 10:44:03', '2021-07-12 10:44:03'),
(546, 1, '334_project-Jobs-status-report.xls', 499, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xls', '13.61 KB', '2021-07-12 10:44:03', '2021-07-12 10:44:03'),
(547, 1, '402_currency.png', 499, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '94.28 KB', '2021-07-12 10:44:04', '2021-07-12 10:44:04'),
(548, 1, '478_db7aaf24-187e-4c6e-b6b4-df3a5cd43082.pdf', 499, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '5.19 MB', '2021-07-12 10:44:16', '2021-07-12 10:44:16'),
(549, 1, 'bkjbkbkbk', 499, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-12 10:46:51', '2021-07-12 10:44:34'),
(550, 1, '814_invoice_(1).pdf', 549, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '7.04 KB', '2021-07-12 10:45:39', '2021-07-12 10:45:39'),
(551, 1, '444_V_&_R_BETHPAGE_PIZZERIA_CORP_EIG242846401_excel_(1).xlsx', 549, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '167.86 KB', '2021-07-12 10:45:41', '2021-07-12 10:45:41'),
(552, 1, '618_GR88_Food_Inc._KWC1147920_excel.xlsx', 549, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '167.89 KB', '2021-07-12 10:45:42', '2021-07-12 10:45:42'),
(553, 1, '602_expmap.png', 549, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '633.82 KB', '2021-07-12 10:45:43', '2021-07-12 10:45:43'),
(554, 1, '629_1._Leadership_Survey_Kim_White.pdf', 549, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '1.71 MB', '2021-07-12 10:45:49', '2021-07-12 10:45:49'),
(558, 1, '293_currency.png', 524, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '94.28 KB', '2021-07-12 11:14:25', '2021-07-12 11:14:25'),
(559, 1, '902_From16_20-21.pdf', 524, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '209.64 KB', '2021-07-12 11:14:33', '2021-07-12 11:14:33'),
(560, 1, '519_10701200243.pdf', 524, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '380.04 KB', '2021-07-12 11:14:56', '2021-07-12 11:14:56'),
(562, 0, 'Item001', 122, '34', '', 0, 0, 0, 46, 0, 0, 0, 0, '', '', '2021-07-12 21:24:17', '2021-07-12 21:24:17'),
(564, 0, 'Item001', 563, '63', '', 0, 0, 0, 47, 0, 0, 0, 0, '', '', '2021-07-12 21:27:29', '2021-07-12 21:27:29'),
(570, 1, '62_RULE_NO_2_1_(1).pdf', 569, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '12.61 KB', '2021-07-12 21:43:35', '2021-07-12 21:43:35'),
(571, 1, '304_RULE_No_2_2_(1).pdf', 569, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '24.23 KB', '2021-07-12 21:43:40', '2021-07-12 21:43:40'),
(572, 1, '440_Sublime_Text_Build_3211_x64_Setup.zip', 112, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'zip', '10.35 MB', '2021-07-13 12:27:58', '2021-07-13 12:27:58'),
(573, 1, '913_small-dwayne-johnson-in-action-2_1621244870.jpg', 112, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '2.81 KB', '2021-07-13 12:29:19', '2021-07-13 12:29:19'),
(574, 2, 'targetf1', 121, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-13 12:40:49', '2021-07-13 12:40:49'),
(575, 2, '114_Reference-1.pdf', 574, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '71.00 KB', '2021-07-13 12:42:13', '2021-07-13 12:42:13'),
(576, 2, '642_Reference_-_3.pdf', 574, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '70.85 KB', '2021-07-13 12:42:13', '2021-07-13 12:42:13'),
(577, 1, 'test2', 120, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-13 12:47:15', '2021-07-13 12:47:15'),
(578, 1, '355_62_RULE_NO_2_1_(1).pdf', 577, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '12.61 KB', '2021-07-13 12:48:20', '2021-07-13 12:48:20'),
(579, 1, '312_54120413-758d-44ef-bbfc-b5d3fb2fce34_(1).pdf', 577, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '23.58 KB', '2021-07-13 12:48:21', '2021-07-13 12:48:21'),
(580, 1, '947_62_RULE_NO_2_1_(1).pdf', 577, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '12.61 KB', '2021-07-13 12:48:22', '2021-07-13 12:48:22'),
(581, 1, '530_Reference_-_3.pdf', 577, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '70.85 KB', '2021-07-13 12:48:22', '2021-07-13 12:48:22'),
(582, 1, '933_CHECKTHIS.pdf', 577, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '26.83 KB', '2021-07-13 12:48:22', '2021-07-13 12:48:22'),
(593, 0, 'Jobs', 592, '64', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(594, 0, 'Item001', 592, '64', '', 0, 0, 0, 48, 0, 0, 0, 0, '', '', '2021-07-13 20:42:23', '2021-07-13 20:42:23'),
(595, 0, 'COP001', 593, '64', '59', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-13 20:45:25', '2021-07-13 20:45:25'),
(596, 0, '_in', 595, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-13 20:45:25', '2021-07-13 20:45:25'),
(597, 0, '_out', 595, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-13 20:45:25', '2021-07-13 20:45:25'),
(601, 1, '74_CHECKTHIS.pdf', 600, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '26.83 KB', '2021-07-13 20:48:08', '2021-07-13 20:48:08'),
(602, 1, '894_abc-3-layer-column-chart.png', 600, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '50.83 KB', '2021-07-13 20:48:08', '2021-07-13 20:48:08'),
(603, 1, '51_abc-3-layer-column-chart.jpeg', 600, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpeg', '70.65 KB', '2021-07-13 20:48:11', '2021-07-13 20:48:11'),
(606, 1, '638_abc-3-layer-column-chart.xls', 16, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xls', '2.22 KB', '2021-07-13 21:17:54', '2021-07-13 21:17:54'),
(608, 0, 'Jobs', 607, '65', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(609, 0, 'Item001', 607, '65', '', 0, 0, 0, 49, 0, 0, 0, 0, '', '', '2021-07-14 10:28:38', '2021-07-14 10:28:38'),
(621, 1, '828_abc-2-layer-column-chart.xls', 354, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xls', '1.90 KB', '2021-07-14 11:02:19', '2021-07-14 11:02:19'),
(622, 1, '244_abc-2-layer-column-chart.xls', 354, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xls', '1.90 KB', '2021-07-14 11:02:19', '2021-07-14 11:02:19'),
(623, 1, '657_object.csv', 354, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '3.12 KB', '2021-07-14 11:02:20', '2021-07-14 11:02:20'),
(624, 1, '2_probing.png', 354, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '8.38 KB', '2021-07-14 11:02:20', '2021-07-14 11:02:20'),
(625, 1, '378_abc-3-layer-column-chart.pdf', 354, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '18.58 KB', '2021-07-14 11:02:20', '2021-07-14 11:02:20'),
(626, 1, '737_abc-2-layer-column-chart_(1).xls', 356, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xls', '1.90 KB', '2021-07-14 11:03:10', '2021-07-14 11:03:10'),
(627, 1, '938_object.csv', 356, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '3.12 KB', '2021-07-14 11:03:11', '2021-07-14 11:03:11'),
(628, 1, '483_abc-2-layer-column-chart.svg', 356, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'svg', '14.23 KB', '2021-07-14 11:03:12', '2021-07-14 11:03:12'),
(629, 1, '873_abc-3-layer-column-chart.pdf', 356, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '18.58 KB', '2021-07-14 11:03:12', '2021-07-14 11:03:12'),
(630, 1, '843_abc-2-layer-column-chart.png', 356, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '54.08 KB', '2021-07-14 11:03:12', '2021-07-14 11:03:12'),
(636, 1, '797_file_example_XLS_50.xls', 211, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xls', '13.50 KB', '2021-07-14 16:22:35', '2021-07-14 16:22:35'),
(638, 1, '326_file_example_XLS_50.xls', 251, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xls', '13.50 KB', '2021-07-14 16:27:39', '2021-07-14 16:27:39'),
(640, 0, 'Item001', 639, '66', '', 0, 0, 0, 50, 0, 0, 0, 0, '', '', '2021-07-15 12:21:29', '2021-07-15 12:21:29'),
(642, 0, 'Jobs', 641, '67', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(643, 0, 'Item001', 641, '67', '', 0, 0, 0, 51, 0, 0, 0, 0, '', '', '2021-07-15 13:10:18', '2021-07-15 13:10:18'),
(644, 0, 'COP001', 642, '67', '60', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-15 13:11:26', '2021-07-15 13:11:26'),
(645, 0, '_in', 644, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-15 13:11:26', '2021-07-15 13:11:26'),
(646, 0, '_out', 644, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-15 13:11:26', '2021-07-15 13:11:26'),
(647, 1, '32_TMS_Feedback_-_29.06.2021.docx', 16, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '507.05 KB', '2021-07-16 17:48:04', '2021-07-16 17:48:04'),
(649, 1, '608_94aa61cf-8445-4174-96fa-c0664b5920a7_(1).pdf', 152, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '17.30 KB', '2021-07-16 19:06:13', '2021-07-16 19:06:13'),
(650, 1, '813_newplot_(3).png', 152, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '37.32 KB', '2021-07-16 19:06:15', '2021-07-16 19:06:15'),
(651, 1, '224_newplot_(2).png', 152, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '37.32 KB', '2021-07-16 19:06:15', '2021-07-16 19:06:15'),
(652, 1, 'Folder1', 152, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-16 19:06:44', '2021-07-16 19:06:44'),
(653, 1, 'jhgjggjgj.png', 652, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '29.49 KB', '2021-07-16 19:10:04', '2021-07-16 19:07:59'),
(654, 1, '253_download.pdf', 652, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '43.08 KB', '2021-07-16 19:08:01', '2021-07-16 19:08:01'),
(655, 1, '373_NrmCRM_(14).png', 652, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '117.42 KB', '2021-07-16 19:08:10', '2021-07-16 19:08:10'),
(656, 1, '595_Jaimini17011701_Jaimini17011701_excel.xlsx', 652, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '167.85 KB', '2021-07-16 19:08:15', '2021-07-16 19:08:15'),
(657, 1, '654_869_sample.pdf', 16, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '2.96 KB', '2021-07-16 19:09:04', '2021-07-16 19:09:04'),
(658, 1, '595_Jaimini17011701_Jaimini17011701_excel_copy.xlsx', 152, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '167.85 KB', '2021-07-16 19:08:15', '2021-07-16 19:08:15'),
(659, 1, '950_6fdc186d-68ea-4246-b507-876d6cb05051.pdf', 152, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '15.23 KB', '2021-07-16 19:11:30', '2021-07-16 19:11:30'),
(660, 1, '808_869_sample.pdf', 16, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '2.96 KB', '2021-07-16 19:16:56', '2021-07-16 19:16:56'),
(661, 1, '297_94aa61cf-8445-4174-96fa-c0664b5920a7.pdf', 238, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '17.30 KB', '2021-07-16 19:45:19', '2021-07-16 19:45:19'),
(662, 1, '953_94aa61cf-8445-4174-96fa-c0664b5920a7.pdf', 238, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '17.30 KB', '2021-07-16 19:45:21', '2021-07-16 19:45:21'),
(666, 0, 'DTP001', 237, '51', '61', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-16 19:51:02', '2021-07-16 19:51:02'),
(667, 0, '_in', 666, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-16 19:51:02', '2021-07-16 19:51:02'),
(668, 0, '_out', 666, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-16 19:51:02', '2021-07-16 19:51:02'),
(672, 1, '155_jhgjggjgj.png', 667, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '29.49 KB', '2021-07-16 20:14:09', '2021-07-16 20:14:09'),
(673, 1, '720_566_probing.png', 667, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '29.49 KB', '2021-07-16 20:14:10', '2021-07-16 20:14:10'),
(674, 1, '105_396_download.pdf', 667, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '43.08 KB', '2021-07-16 20:14:17', '2021-07-16 20:14:17'),
(675, 2, '606_abc-2-layer-column-chart__1___1_.xls', 668, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xls', '1.90 KB', '2021-07-16 20:17:53', '2021-07-16 20:17:53'),
(676, 2, '210_566_probing.png', 668, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '29.49 KB', '2021-07-16 20:17:54', '2021-07-16 20:17:54'),
(677, 2, '59_newplot_(3).png', 668, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '37.32 KB', '2021-07-16 20:17:54', '2021-07-16 20:17:54'),
(679, 2, '444_210_566_probing.png', 668, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '29.49 KB', '2021-07-16 20:29:59', '2021-07-16 20:29:59'),
(680, 1, '311_396_download.pdf', 238, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '43.08 KB', '2021-07-16 20:33:48', '2021-07-16 20:33:48'),
(681, 1, '106_gpxfile_origin.gpx', 238, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'gpx', '12.61 KB', '2021-07-16 20:34:37', '2021-07-16 20:34:37'),
(682, 1, '275_nationaltestserver_policyList_(2).csv', 238, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '0.97 KB', '2021-07-16 20:36:10', '2021-07-16 20:36:10'),
(683, 1, '387_vijay2_gohil_excel.xlsx', 238, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '25.05 KB', '2021-07-16 20:36:11', '2021-07-16 20:36:11'),
(684, 1, '485_download.jfif', 238, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jfif', '4.16 KB', '2021-07-16 20:36:11', '2021-07-16 20:36:11'),
(689, 0, 'Jobs', 688, '68', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(690, 0, 'Item001', 688, '68', '', 0, 0, 0, 52, 0, 0, 0, 0, '', '', '2021-07-19 09:29:31', '2021-07-19 09:29:31'),
(691, 0, 'DTP001', 689, '68', '62', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-19 09:31:20', '2021-07-19 09:31:20'),
(692, 0, '_in', 691, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-19 09:31:20', '2021-07-19 09:31:20'),
(693, 0, '_out', 691, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-19 09:31:20', '2021-07-19 09:31:20'),
(694, 1, 'New1', 692, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-19 09:33:28', '2021-07-19 09:33:28');
INSERT INTO `tms_filemanager` (`fmanager_id`, `role_id`, `name`, `parent_id`, `order_id`, `job_id`, `client_id`, `in_client_id`, `user_id`, `item_id`, `is_default_folder`, `is_project_folder`, `is_ex_project_folder`, `f_id`, `ext`, `size`, `created_date`, `updated_date`) VALUES
(695, 1, '945_abc-2-layer-column-chart__1___1_.xls', 694, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xls', '1.90 KB', '2021-07-19 09:35:38', '2021-07-19 09:35:38'),
(696, 1, '95_jhgjggjgj.png', 694, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '29.49 KB', '2021-07-19 09:35:38', '2021-07-19 09:35:38'),
(697, 1, '406_566_probing.png', 694, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '29.49 KB', '2021-07-19 09:35:39', '2021-07-19 09:35:39'),
(698, 1, '763_abc-2-layer-column-chart__1__(1).xls', 692, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xls', '1.90 KB', '2021-07-19 09:39:32', '2021-07-19 09:39:32'),
(699, 1, '244_94aa61cf-8445-4174-96fa-c0664b5920a7_(1).pdf', 692, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '17.30 KB', '2021-07-19 09:39:32', '2021-07-19 09:39:32'),
(700, 1, '615_newplot_(3).png', 692, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '37.32 KB', '2021-07-19 09:39:32', '2021-07-19 09:39:32'),
(701, 1, '428_566_probing.png', 692, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '29.49 KB', '2021-07-19 09:39:32', '2021-07-19 09:39:32'),
(702, 1, '459_jhgjggjgj.png', 692, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '29.49 KB', '2021-07-19 09:39:33', '2021-07-19 09:39:33'),
(709, 1, '938_210_566_probing.png', 708, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '29.49 KB', '2021-07-19 10:15:35', '2021-07-19 10:15:35'),
(710, 1, '959_94aa61cf-8445-4174-96fa-c0664b5920a7.pdf', 708, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '17.30 KB', '2021-07-19 10:15:37', '2021-07-19 10:15:37'),
(711, 1, '60_396_download.pdf', 708, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '43.08 KB', '2021-07-19 10:15:39', '2021-07-19 10:15:39'),
(712, 0, 'Item002', 688, '68', '', 0, 0, 0, 53, 0, 0, 0, 0, '', '', '2021-07-19 10:28:58', '2021-07-19 10:28:58'),
(714, 0, 'COP002', 689, '68', '63', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-19 10:35:55', '2021-07-19 10:35:55'),
(715, 0, '_in', 714, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-19 10:35:55', '2021-07-19 10:35:55'),
(716, 0, '_out', 714, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-19 10:35:55', '2021-07-19 10:35:55'),
(717, 1, 'newfolder1', 58, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-19 17:48:21', '2021-07-19 17:48:21'),
(718, 1, '944_qDFCWVnb.jpg', 717, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '6.34 KB', '2021-07-19 17:48:51', '2021-07-19 17:48:51'),
(723, 1, '937_nrm.png', 717, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '117.42 KB', '2021-07-19 17:51:51', '2021-07-19 17:51:51'),
(727, 1, '910_youtube.jpg', 726, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '77.14 KB', '2021-07-19 19:47:40', '2021-07-19 19:47:40'),
(728, 1, '416_TMS_Feedback_-_29.06.2021.docx', 726, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '507.05 KB', '2021-07-19 19:48:17', '2021-07-19 19:48:17'),
(729, 1, '598_Group_240.zip', 726, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'zip', '642.75 KB', '2021-07-19 19:49:30', '2021-07-19 19:49:30'),
(730, 1, '244_WhatsApp_Image_2021-06-20_at_9.40.43_AM.jpeg', 640, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpeg', '38.55 KB', '2021-07-19 19:54:00', '2021-07-19 19:54:00'),
(731, 1, '224_WhatsApp_Image_2021-06-20_at_10.05.51_AM.jpeg', 640, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpeg', '100.65 KB', '2021-07-19 19:54:07', '2021-07-19 19:54:07'),
(732, 1, 'test1', 640, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-19 19:54:14', '2021-07-19 19:54:14'),
(733, 1, '35_94aa61cf-8445-4174-96fa-c0664b5920a7_(1).pdf', 732, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '17.30 KB', '2021-07-19 19:54:41', '2021-07-19 19:54:41'),
(734, 1, '768_94aa61cf-8445-4174-96fa-c0664b5920a7.pdf', 732, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '17.30 KB', '2021-07-19 19:54:41', '2021-07-19 19:54:41'),
(735, 1, '868_43f10cdb-5835-45e2-bac2-709f42d98d42.pdf', 732, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '28.39 KB', '2021-07-19 19:54:41', '2021-07-19 19:54:41'),
(736, 1, '52_027c3454-4307-45d7-b0e3-3b16cbd9321d.pdf', 732, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '117.16 KB', '2021-07-19 19:54:52', '2021-07-19 19:54:52'),
(740, 0, 'SEO001', 0, '66', '64', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-19 20:02:03', '2021-07-19 20:02:03'),
(742, 0, '_out', 740, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-19 20:02:03', '2021-07-19 20:02:03'),
(743, 0, 'DTP002', 0, '66', '65', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-19 20:02:04', '2021-07-19 20:02:04'),
(744, 0, '_in', 743, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-19 20:02:04', '2021-07-19 20:02:04'),
(745, 0, '_out', 743, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-19 20:02:04', '2021-07-19 20:02:04'),
(746, 0, 'DTC004', 0, '66', '66', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-19 20:02:04', '2021-07-19 20:02:04'),
(747, 0, '_in', 746, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-19 20:02:04', '2021-07-19 20:02:04'),
(748, 0, '_out', 746, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-19 20:02:04', '2021-07-19 20:02:04'),
(750, 1, '823_TMS_Feedback_-_29.06.2021.docx', 749, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '506.76 KB', '2021-07-19 20:04:29', '2021-07-19 20:04:29'),
(751, 1, 'two', 749, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-19 20:04:38', '2021-07-19 20:04:38'),
(752, 1, '382_360_contact_template.xlsx', 751, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '15.43 KB', '2021-07-19 20:05:06', '2021-07-19 20:05:06'),
(753, 1, '903_210_566_probing.png', 751, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '29.49 KB', '2021-07-19 20:05:09', '2021-07-19 20:05:09'),
(754, 1, '227_TMS_Feedback_-_02.06.2021.docx', 749, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '770.28 KB', '2021-07-19 20:05:15', '2021-07-19 20:05:15'),
(758, 1, 'jaimini1', 208, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-19 21:00:31', '2021-07-19 21:00:31'),
(759, 1, '12_210_566_probing.png', 758, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '29.49 KB', '2021-07-19 21:01:02', '2021-07-19 21:01:02'),
(760, 1, '14_360_contact_template.xlsx', 758, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '15.43 KB', '2021-07-19 21:01:02', '2021-07-19 21:01:02'),
(761, 1, '689_24947.pdf', 758, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '73.70 KB', '2021-07-19 21:01:03', '2021-07-19 21:01:03'),
(765, 1, 'A1', 94, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-19 21:03:16', '2021-07-19 21:03:16'),
(766, 1, '527_360_contact_template.xlsx', 765, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '15.43 KB', '2021-07-19 21:03:59', '2021-07-19 21:03:59'),
(767, 1, '591_210_566_probing.png', 765, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '29.49 KB', '2021-07-19 21:03:59', '2021-07-19 21:03:59'),
(768, 0, 'Item001', 126, '36', '', 0, 0, 0, 55, 0, 0, 0, 0, '', '', '2021-07-19 21:09:04', '2021-07-19 21:09:04'),
(769, 1, 'F1', 768, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-19 21:10:01', '2021-07-19 21:10:01'),
(770, 1, '147_1613546918.csv', 769, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '2.28 KB', '2021-07-19 21:10:41', '2021-07-19 21:10:41'),
(771, 1, '491_1612340435727invoice.pdf', 769, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '41.67 KB', '2021-07-19 21:10:42', '2021-07-19 21:10:42'),
(772, 1, '133_1612340435727invoice.pdf', 769, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '41.67 KB', '2021-07-19 21:10:42', '2021-07-19 21:10:42'),
(773, 1, '887_Bergen_Dermatology__LLC_-_PWC1008282.xls', 769, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xls', '489.50 KB', '2021-07-19 21:11:45', '2021-07-19 21:11:45'),
(774, 1, 'new1', 208, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-21 19:52:38', '2021-07-21 19:52:38'),
(775, 1, '832_0c127fa8-541d-4eac-ac2b-939a1c7ec05adownload.jfif', 774, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jfif', '4.16 KB', '2021-07-21 19:54:09', '2021-07-21 19:54:09'),
(776, 1, '919__78A2474.jpg', 774, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '75.64 KB', '2021-07-21 19:54:16', '2021-07-21 19:54:16'),
(777, 1, 'ch-1', 251, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-21 20:43:40', '2021-07-21 20:43:40'),
(778, 1, '689_youtube.jpg', 777, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '77.14 KB', '2021-07-21 20:44:35', '2021-07-21 20:44:35'),
(781, 0, 'Item001', 0, '69', '', 0, 0, 0, 56, 0, 0, 0, 0, '', '', '2021-07-22 13:55:19', '2021-07-22 13:55:19'),
(782, 0, 'SEO001', 0, '69', '67', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-22 14:06:00', '2021-07-22 14:06:00'),
(783, 0, '_in', 782, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-22 14:06:00', '2021-07-22 14:06:00'),
(784, 0, '_out', 782, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-22 14:06:00', '2021-07-22 14:06:00'),
(785, 0, 'DTP002', 0, '69', '68', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-22 14:06:00', '2021-07-22 14:06:00'),
(786, 0, '_in', 785, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-22 14:06:00', '2021-07-22 14:06:00'),
(787, 0, '_out', 785, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-22 14:06:00', '2021-07-22 14:06:00'),
(788, 0, 'DTC004', 0, '69', '69', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-22 14:06:00', '2021-07-22 14:06:00'),
(789, 0, '_in', 788, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-22 14:06:00', '2021-07-22 14:06:00'),
(790, 0, '_out', 788, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-22 14:06:00', '2021-07-22 14:06:00'),
(791, 1, '777_Purchase_Order_-_Office_Edition_xD.docx', 781, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '13.41 KB', '2021-07-22 14:06:36', '2021-07-22 14:06:36'),
(792, 1, '634_F1_-_Innsigelser_til_nabovarsel_-Fra_nr_17[4477].pdf', 781, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '509.34 KB', '2021-07-22 14:06:38', '2021-07-22 14:06:38'),
(793, 1, 'Original files', 781, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-22 14:07:47', '2021-07-22 14:07:47'),
(794, 1, '950_Purchase_Order_-_Office_Edition_xD.docx', 793, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '13.41 KB', '2021-07-22 14:07:59', '2021-07-22 14:07:59'),
(795, 1, '364_TMS_Feedback_-_22-07-2021.docx', 793, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '509.34 KB', '2021-07-22 14:08:01', '2021-07-22 14:08:01'),
(796, 0, 'FED005', 0, '69', '70', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-22 14:15:31', '2021-07-22 14:15:31'),
(797, 0, '_in', 796, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-22 14:15:31', '2021-07-22 14:15:31'),
(798, 0, '_out', 796, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-22 14:15:31', '2021-07-22 14:15:31'),
(799, 1, '491__78A2474.jpg', 562, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '75.64 KB', '2021-07-22 16:29:24', '2021-07-22 16:29:24'),
(800, 0, 'TEST001', 123, '34', '71', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-22 16:31:35', '2021-07-22 16:31:35'),
(801, 0, '_in', 800, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-22 16:31:35', '2021-07-22 16:31:35'),
(802, 0, '_out', 800, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-22 16:31:35', '2021-07-22 16:31:35'),
(803, 1, 'source', 801, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-22 16:32:29', '2021-07-22 16:32:29'),
(804, 1, '493_0c127fa8-541d-4eac-ac2b-939a1c7ec05adownload.jfif', 803, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jfif', '4.16 KB', '2021-07-22 16:32:56', '2021-07-22 16:32:56'),
(805, 1, '888_12_210_566_probing.png', 803, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '29.49 KB', '2021-07-22 16:33:03', '2021-07-22 16:33:03'),
(806, 1, 'source_2', 803, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-22 16:35:08', '2021-07-22 16:35:08'),
(807, 1, '449_210_566_probing.png', 806, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '29.49 KB', '2021-07-22 16:35:49', '2021-07-22 16:35:49'),
(808, 1, '850_127_people_(3).xlsx', 806, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '5.51 KB', '2021-07-22 16:35:50', '2021-07-22 16:35:50'),
(809, 1, 'targetfromadmin', 802, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-22 16:36:38', '2021-07-22 16:36:38'),
(810, 1, '343_excel_empty_(1).xlsx', 809, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '8.79 KB', '2021-07-22 16:37:01', '2021-07-22 16:37:01'),
(811, 1, '579__78A2474.jpg', 802, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '75.64 KB', '2021-07-22 16:39:07', '2021-07-22 16:39:07'),
(812, 1, 's2', 801, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-22 16:41:52', '2021-07-22 16:41:52'),
(813, 1, '550_12_210_566_probing.png', 812, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '29.49 KB', '2021-07-22 16:42:12', '2021-07-22 16:42:12'),
(814, 1, '174_566_probing.png', 802, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '29.49 KB', '2021-07-22 16:42:47', '2021-07-22 16:42:47'),
(815, 2, 'fromlinguist', 801, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-22 16:45:39', '2021-07-22 16:45:39'),
(816, 2, '710__78A2474.jpg', 815, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '75.64 KB', '2021-07-22 16:45:51', '2021-07-22 16:45:51'),
(817, 2, 'frotargetling', 802, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-22 16:46:14', '2021-07-22 16:46:14'),
(818, 2, '292_24970.pdf', 817, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '76.67 KB', '2021-07-22 16:47:06', '2021-07-22 16:47:06'),
(819, 2, '808_566_probing.png', 817, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '29.49 KB', '2021-07-22 16:47:06', '2021-07-22 16:47:06'),
(820, 2, '942_43f10cdb-5835-45e2-bac2-709f42d98d42.pdf', 802, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '28.39 KB', '2021-07-22 16:47:30', '2021-07-22 16:47:30'),
(821, 0, 'Item002', 0, '34', '', 0, 0, 0, 57, 0, 0, 0, 0, '', '', '2021-07-22 16:55:50', '2021-07-22 16:55:50'),
(824, 0, 'Item006', 0, '2', '', 0, 0, 0, 60, 0, 0, 0, 0, '', '', '2021-07-22 17:05:26', '2021-07-22 17:05:26'),
(825, 0, 'Item001', 0, '71', '', 0, 0, 0, 61, 0, 0, 0, 0, '', '', '2021-07-22 17:05:26', '2021-07-22 17:05:26'),
(829, 0, 'COP010', 0, '2', '73', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-22 17:23:44', '2021-07-22 17:23:44'),
(830, 0, '_in', 829, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-22 17:23:44', '2021-07-22 17:23:44'),
(831, 0, '_out', 829, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-22 17:23:44', '2021-07-22 17:23:44'),
(842, 0, 'COP001', 0, '71', '74', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-22 17:55:31', '2021-07-22 17:55:31'),
(843, 0, '_in', 842, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-22 17:55:31', '2021-07-22 17:55:31'),
(844, 0, '_out', 842, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-22 17:55:31', '2021-07-22 17:55:31'),
(845, 0, 'Item002', 0, '71', '', 0, 0, 0, 72, 0, 0, 0, 0, '', '', '2021-07-22 18:03:22', '2021-07-22 18:03:22'),
(846, 0, 'Item001', 0, '70', '', 0, 0, 0, 73, 0, 0, 0, 0, '', '', '2021-07-22 18:03:54', '2021-07-22 18:03:54'),
(847, 0, 'DTP002', 0, '71', '75', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-22 18:04:03', '2021-07-22 18:04:03'),
(848, 0, '_in', 847, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-22 18:04:03', '2021-07-22 18:04:03'),
(849, 0, '_out', 847, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-22 18:04:03', '2021-07-22 18:04:03'),
(850, 0, 'COP001', 0, '70', '76', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-22 18:05:11', '2021-07-22 18:05:11'),
(851, 0, '_in', 850, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-22 18:05:11', '2021-07-22 18:05:11'),
(852, 0, '_out', 850, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-22 18:05:11', '2021-07-22 18:05:11'),
(853, 0, 'Item001', 0, '73', '', 0, 0, 0, 74, 0, 0, 0, 0, '', '', '2021-07-27 11:16:38', '2021-07-27 11:16:38'),
(854, 0, 'DTP001', 0, '73', '77', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-27 11:20:31', '2021-07-27 11:20:31'),
(855, 0, '_in', 854, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-27 11:20:31', '2021-07-27 11:20:31'),
(856, 0, '_out', 854, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-27 11:20:31', '2021-07-27 11:20:31'),
(857, 1, 'Triangle@123', 853, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-27 11:52:53', '2021-07-27 11:52:53'),
(858, 1, '855_freshpath.svg', 857, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'svg', '8.78 KB', '2021-07-27 11:54:28', '2021-07-27 11:54:28'),
(859, 1, '788_freshpath.xls', 857, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xls', '1.18 KB', '2021-07-27 11:54:28', '2021-07-27 11:54:28'),
(860, 1, '212_freshpath.png', 857, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '28.75 KB', '2021-07-27 11:54:29', '2021-07-27 11:54:29'),
(861, 1, '474_freshpath.jpeg', 857, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpeg', '49.82 KB', '2021-07-27 11:54:29', '2021-07-27 11:54:29'),
(862, 1, 'test321', 857, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-27 12:03:54', '2021-07-27 12:03:54'),
(863, 1, '541_test3_auditor_time_service_(1).csv', 862, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '0.66 KB', '2021-07-27 12:07:12', '2021-07-27 12:07:12'),
(864, 1, '600_State_Forms.xlsx', 862, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '41.87 KB', '2021-07-27 12:07:13', '2021-07-27 12:07:13'),
(865, 1, 'source1', 855, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-27 12:08:58', '2021-07-27 12:08:58'),
(866, 1, '17_Flow_Chart.docx', 865, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '15.19 KB', '2021-07-27 12:09:23', '2021-07-27 12:09:23'),
(867, 1, '562_freshpath_(1).csv', 865, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '0.08 KB', '2021-07-27 12:09:23', '2021-07-27 12:09:23'),
(868, 1, 'target', 856, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-27 12:15:09', '2021-07-27 12:15:09'),
(869, 1, '835_562_freshpath_(1).csv', 868, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '0.08 KB', '2021-07-27 12:15:27', '2021-07-27 12:15:27'),
(870, 1, '767_788_freshpath.xls', 868, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xls', '1.18 KB', '2021-07-27 12:15:27', '2021-07-27 12:15:27'),
(871, 2, 'f2', 23, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-28 12:29:11', '2021-07-28 12:29:11'),
(872, 2, '974_sample.pdf', 871, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '2.96 KB', '2021-07-28 12:29:59', '2021-07-28 12:29:59'),
(873, 0, 'Item001', 0, '74', '', 0, 0, 0, 75, 0, 0, 0, 0, '', '', '2021-07-29 16:29:51', '2021-07-29 16:29:51'),
(874, 0, 'DTP001', 0, '74', '78', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-29 16:32:26', '2021-07-29 16:32:26'),
(875, 0, '_in', 874, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-29 16:32:26', '2021-07-29 16:32:26'),
(876, 0, '_out', 874, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-29 16:32:26', '2021-07-29 16:32:26'),
(877, 0, 'Item002', 0, '74', '', 0, 0, 0, 76, 0, 0, 0, 0, '', '', '2021-07-29 17:09:36', '2021-07-29 17:09:36'),
(878, 0, 'Item003', 0, '74', '', 0, 0, 0, 77, 0, 0, 0, 0, '', '', '2021-07-29 17:09:36', '2021-07-29 17:09:36'),
(879, 0, 'COP002', 0, '74', '79', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-29 17:11:11', '2021-07-29 17:11:11'),
(880, 0, '_in', 879, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-29 17:11:11', '2021-07-29 17:11:11'),
(881, 0, '_out', 879, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-29 17:11:11', '2021-07-29 17:11:11'),
(882, 0, 'FED001', 0, '63', '80', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-29 17:58:01', '2021-07-29 17:58:01'),
(883, 0, '_in', 882, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-29 17:58:01', '2021-07-29 17:58:01'),
(884, 0, '_out', 882, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-29 17:58:01', '2021-07-29 17:58:01'),
(885, 0, 'Item002', 0, '63', '', 0, 0, 0, 78, 0, 0, 0, 0, '', '', '2021-07-29 18:20:08', '2021-07-29 18:20:08'),
(886, 0, 'BAD002', 0, '63', '81', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-29 18:25:14', '2021-07-29 18:25:14'),
(887, 0, '_in', 886, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-29 18:25:14', '2021-07-29 18:25:14'),
(888, 0, '_out', 886, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-29 18:25:14', '2021-07-29 18:25:14'),
(889, 1, 'trivago', 883, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-29 18:39:01', '2021-07-29 18:39:01'),
(890, 1, '834_freshpath__1_.jpeg', 889, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpeg', '49.82 KB', '2021-07-29 18:39:31', '2021-07-29 18:39:31'),
(891, 1, '472_newplot_(3).png', 889, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '37.32 KB', '2021-07-29 18:40:59', '2021-07-29 18:40:59'),
(892, 1, '367_94aa61cf-8445-4174-96fa-c0664b5920a7_(1).pdf', 889, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '17.30 KB', '2021-07-29 18:41:02', '2021-07-29 18:41:02'),
(893, 1, '887_NrmCRM_(14).png', 889, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '117.42 KB', '2021-07-29 18:41:13', '2021-07-29 18:41:13'),
(894, 0, 'LOG180043', 8, '82', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(895, 0, 'Jobs', 894, '82', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(896, 0, 'LOG180044', 8, '83', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(897, 0, 'Jobs', 896, '83', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(898, 0, 'LOG180045', 53, '84', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(899, 0, 'Jobs', 898, '84', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(900, 0, 'Item001', 898, '84', '', 0, 0, 0, 79, 0, 0, 0, 0, '', '', '2021-07-30 12:57:23', '2021-07-30 12:57:23'),
(901, 0, 'LOG180046', 8, '86', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(902, 0, 'Jobs', 901, '86', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(903, 0, 'Item001', 901, '86', '', 0, 0, 0, 80, 0, 0, 0, 0, '', '', '2021-07-30 13:39:53', '2021-07-30 13:39:53'),
(904, 0, 'COP001', 902, '86', '82', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-30 13:40:40', '2021-07-30 13:40:40'),
(905, 0, '_in', 904, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-30 13:40:40', '2021-07-30 13:40:40'),
(906, 0, '_out', 904, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-07-30 13:40:40', '2021-07-30 13:40:40'),
(907, 1, 'newA1', 717, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-02 15:12:40', '2021-08-02 15:12:40'),
(908, 1, 'newA2', 717, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-02 15:12:51', '2021-08-02 15:12:51'),
(909, 1, 'newb1', 908, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-02 15:13:14', '2021-08-02 15:13:14'),
(910, 1, 'newc1', 909, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-02 15:13:25', '2021-08-02 15:13:25'),
(911, 1, '148_sample.pdf', 909, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '2.96 KB', '2021-08-02 15:13:58', '2021-08-02 15:13:58'),
(912, 1, '658_LOG180001_Kanhasoft_xyz.zip', 910, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'zip', '0.19 KB', '2021-08-02 15:14:21', '2021-08-02 15:14:21'),
(913, 1, '974_people.xlsx', 908, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '5.51 KB', '2021-08-02 15:15:02', '2021-08-02 15:15:02'),
(914, 1, 'projxyz', 58, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-02 17:53:31', '2021-08-02 17:53:31'),
(915, 1, 'projA1', 914, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-02 17:53:46', '2021-08-02 17:53:46'),
(916, 1, '16_filw.jpg', 915, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '48.60 KB', '2021-08-02 17:55:23', '2021-08-02 17:55:23'),
(917, 1, '242_download.jpg', 903, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '10.72 KB', '2021-08-02 19:02:05', '2021-08-02 19:02:05'),
(918, 1, '415_file_example_XLS_50.xls', 903, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xls', '27.50 KB', '2021-08-02 19:02:07', '2021-08-02 19:02:07'),
(919, 1, '937_EMPIRE_CITY_LABORATORIES_INC_EIG260634201_-_test_1.xlsx', 903, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '287.36 KB', '2021-08-02 19:02:21', '2021-08-02 19:02:21'),
(920, 1, '171_F54_-_Samples.pptx', 903, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pptx', '290.52 KB', '2021-08-02 19:02:23', '2021-08-02 19:02:23'),
(921, 1, 'folder1 with 1 file', 903, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-02 19:03:11', '2021-08-02 19:03:11'),
(922, 1, '558_562_freshpath_(1).csv', 921, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '0.08 KB', '2021-08-02 19:03:28', '2021-08-02 19:03:28'),
(923, 1, 'Folder2 with 2 files', 921, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-02 19:04:04', '2021-08-02 19:04:04'),
(924, 1, '89_abc-2-histogramme-des-co.csv', 923, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '0.12 KB', '2021-08-02 19:04:22', '2021-08-02 19:04:22'),
(925, 1, '577_abc-2-histogramme-des-co.jpeg', 923, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpeg', '389.50 KB', '2021-08-02 19:04:30', '2021-08-02 19:04:30'),
(926, 1, 'folder3 with 3 files', 923, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-02 19:06:12', '2021-08-02 19:06:12'),
(927, 1, '514_freshpath_(1).csv', 926, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '0.08 KB', '2021-08-02 19:06:49', '2021-08-02 19:06:49'),
(928, 1, '903_Flow_Chart.docx', 926, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '15.19 KB', '2021-08-02 19:06:50', '2021-08-02 19:06:50'),
(929, 1, '833_Specifications_for_the_September_release.docx', 926, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '932.89 KB', '2021-08-02 19:07:02', '2021-08-02 19:07:02'),
(930, 1, 'F1', 905, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-02 19:14:57', '2021-08-02 19:14:57'),
(931, 1, '574_download_(1).jpg', 930, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '12.38 KB', '2021-08-02 19:16:02', '2021-08-02 19:16:02'),
(932, 1, '698_913_test.docx', 930, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '11.13 KB', '2021-08-02 19:16:02', '2021-08-02 19:16:02'),
(933, 1, 'F2', 930, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-02 19:17:20', '2021-08-02 19:17:20'),
(934, 1, '172_download_(1).jpg', 933, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '12.38 KB', '2021-08-02 19:17:46', '2021-08-02 19:17:46'),
(935, 1, '940_download.jpg', 933, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '10.72 KB', '2021-08-02 19:17:46', '2021-08-02 19:17:46'),
(936, 2, 'target1', 906, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-03 11:30:27', '2021-08-03 11:30:27'),
(937, 2, '165_17_Flow_Chart-1627538580197.docx', 936, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '15.19 KB', '2021-08-03 11:30:41', '2021-08-03 11:30:41'),
(938, 2, '664_17_Flow_Chart.docx', 936, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '15.19 KB', '2021-08-03 11:30:41', '2021-08-03 11:30:41'),
(939, 2, 'target2', 936, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-03 11:30:53', '2021-08-03 11:30:53'),
(940, 2, '733_1627487409558.JPEG', 939, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'JPEG', '26.95 KB', '2021-08-03 11:31:18', '2021-08-03 11:31:18'),
(941, 2, '368_freshpath_(1).csv', 939, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '0.08 KB', '2021-08-03 11:31:18', '2021-08-03 11:31:18'),
(942, 2, '948_Flow_Chart.docx', 939, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '15.19 KB', '2021-08-03 11:31:18', '2021-08-03 11:31:18'),
(943, 2, 'target3', 939, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-03 11:31:27', '2021-08-03 11:31:27'),
(944, 2, '248_freshpath_(1).csv', 943, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '0.08 KB', '2021-08-03 11:31:50', '2021-08-03 11:31:50'),
(945, 2, '298_Flow_Chart.docx', 943, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '15.19 KB', '2021-08-03 11:31:50', '2021-08-03 11:31:50'),
(946, 2, '193_TMS_Feedback_-_22-07-2021.docx', 943, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '450.78 KB', '2021-08-03 11:31:54', '2021-08-03 11:31:54'),
(947, 2, 'f3', 933, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-03 11:32:41', '2021-08-03 11:32:41'),
(948, 2, '873_abc-2-histogramme-des-co.csv', 947, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '0.12 KB', '2021-08-03 11:32:58', '2021-08-03 11:32:58'),
(949, 2, '287_abc-2-histogramme-des-co.pdf', 947, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '13.72 KB', '2021-08-03 11:32:58', '2021-08-03 11:32:58'),
(950, 2, '16_1627487409558.JPEG', 947, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'JPEG', '26.95 KB', '2021-08-03 11:32:58', '2021-08-03 11:32:58'),
(951, 2, '954_abc-2-histogramme-des-co.jpeg', 947, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpeg', '389.50 KB', '2021-08-03 11:33:00', '2021-08-03 11:33:00'),
(952, 1, 'A2', 765, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-03 12:16:40', '2021-08-03 12:16:40'),
(953, 1, 'B1', 952, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-03 12:16:54', '2021-08-03 12:16:54'),
(954, 1, 'B2', 952, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-03 12:17:01', '2021-08-03 12:17:01'),
(955, 1, 'C1', 954, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-03 12:17:11', '2021-08-03 12:17:11'),
(956, 1, 'C2', 954, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-03 12:17:16', '2021-08-03 12:17:16'),
(957, 1, '709_623_836_images.jpg', 956, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '8.54 KB', '2021-08-03 12:17:53', '2021-08-03 12:17:53'),
(958, 1, '483_imgpnn.png', 956, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '199.29 KB', '2021-08-03 12:17:54', '2021-08-03 12:17:54'),
(959, 1, 'Target', 95, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-03 12:19:42', '2021-08-03 12:19:42'),
(960, 1, 't1', 959, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-03 12:19:49', '2021-08-03 12:19:49'),
(961, 1, 't2', 960, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-03 12:19:59', '2021-08-03 12:19:59'),
(962, 1, '689_yt1.jpg', 961, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '106.09 KB', '2021-08-03 12:20:29', '2021-08-03 12:20:29'),
(963, 2, 'targ2', 95, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-03 12:23:13', '2021-08-03 12:23:13'),
(966, 2, 'b2', 965, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-03 12:24:24', '2021-08-03 12:24:24'),
(967, 2, 'b3', 966, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-03 12:24:31', '2021-08-03 12:24:31'),
(968, 2, '996_370_msg-1-fc-40.jpg', 967, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '4.06 MB', '2021-08-03 12:24:59', '2021-08-03 12:24:59'),
(977, 2, 'target2_2', 936, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-04 09:37:15', '2021-08-04 09:37:15'),
(978, 2, '745_788_freshpath_(1).xls', 977, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xls', '1.18 KB', '2021-08-04 09:38:04', '2021-08-04 09:38:04'),
(979, 2, '817_788_freshpath.xls', 977, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xls', '1.18 KB', '2021-08-04 09:38:04', '2021-08-04 09:38:04'),
(980, 2, '462_788_freshpath_(1).xls', 977, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xls', '1.18 KB', '2021-08-04 09:38:04', '2021-08-04 09:38:04'),
(981, 2, '186_788_freshpath.xls', 977, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xls', '1.18 KB', '2021-08-04 09:38:04', '2021-08-04 09:38:04'),
(982, 2, '643_1627487409558.JPEG', 977, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'JPEG', '26.95 KB', '2021-08-04 09:38:04', '2021-08-04 09:38:04'),
(983, 2, '557_17_Flow_Chart-1627538580197.docx', 977, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '15.19 KB', '2021-08-04 09:38:04', '2021-08-04 09:38:04'),
(984, 2, '683_1627487409558.JPEG', 977, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'JPEG', '26.95 KB', '2021-08-04 09:38:05', '2021-08-04 09:38:05'),
(985, 2, 'target_3_3', 977, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-04 09:38:29', '2021-08-04 09:38:29'),
(986, 2, '196_788_freshpath_(1).xls', 985, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xls', '1.18 KB', '2021-08-04 09:39:29', '2021-08-04 09:39:29'),
(987, 2, '858_788_freshpath.xls', 985, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xls', '1.18 KB', '2021-08-04 09:39:29', '2021-08-04 09:39:29'),
(988, 2, '616_1627487409558.JPEG', 985, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'JPEG', '26.95 KB', '2021-08-04 09:39:30', '2021-08-04 09:39:30'),
(989, 1, 'f2_2', 930, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-04 09:42:17', '2021-08-04 09:42:17'),
(990, 1, '455_562_freshpath__1_.csv', 989, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '0.08 KB', '2021-08-04 09:42:48', '2021-08-04 09:42:48'),
(991, 1, '434_788_freshpath_(1).xls', 989, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xls', '1.18 KB', '2021-08-04 09:42:48', '2021-08-04 09:42:48'),
(992, 1, '583_788_freshpath.xls', 989, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xls', '1.18 KB', '2021-08-04 09:42:48', '2021-08-04 09:42:48'),
(993, 1, 'f3_3', 989, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-04 09:47:03', '2021-08-04 09:47:03'),
(994, 1, '656_562_freshpath_(1).csv', 993, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '0.08 KB', '2021-08-04 09:52:43', '2021-08-04 09:52:43'),
(995, 1, '205_17_Flow_Chart.docx', 993, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '15.19 KB', '2021-08-04 09:52:43', '2021-08-04 09:52:43'),
(996, 1, '528_17_Flow_Chart-1627538580197.docx', 993, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '15.19 KB', '2021-08-04 09:52:43', '2021-08-04 09:52:43'),
(1088, 1, '197_562_freshpath_(1).csv', 472, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '84 bytes', '2021-08-09 10:34:05', '2021-08-09 10:34:05'),
(1089, 1, '559_17_Flow_Chart.docx', 472, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '15.19 KB', '2021-08-09 10:34:05', '2021-08-09 10:34:05'),
(1090, 1, '456_17_Flow_Chart-1627538580197.docx', 472, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '15.19 KB', '2021-08-09 10:34:05', '2021-08-09 10:34:05'),
(1091, 1, '877_1627487409558.JPEG', 472, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'JPEG', '26.95 KB', '2021-08-09 10:34:05', '2021-08-09 10:34:05'),
(1092, 0, 'LOG180047', 53, '87', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1093, 0, 'Jobs', 1092, '87', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1094, 0, 'Item001', 1092, '87', '', 0, 0, 0, 81, 0, 0, 0, 0, '', '', '2021-08-09 10:40:13', '2021-08-09 10:40:13'),
(1095, 1, '263_abc-2-histogramme-des-co_(1).csv', 1094, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '118 bytes', '2021-08-09 10:41:10', '2021-08-09 10:41:10'),
(1096, 1, '610_788_freshpath_(1).xls', 1094, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xls', '1.18 KB', '2021-08-09 10:41:10', '2021-08-09 10:41:10'),
(1097, 1, '949_Flow_Chart.docx', 1094, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '15.19 KB', '2021-08-09 10:41:10', '2021-08-09 10:41:10'),
(1098, 1, '225_abc-2-histogramme-des-co.pdf', 1094, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '13.72 KB', '2021-08-09 10:41:10', '2021-08-09 10:41:10'),
(1099, 1, '237_Boostshop.png', 1094, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '58.45 KB', '2021-08-09 10:41:10', '2021-08-09 10:41:10'),
(1101, 1, 'test', 1094, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-09 10:42:53', '2021-08-09 10:42:53'),
(1102, 1, '914_562_freshpath_(1).csv', 1101, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '84 bytes', '2021-08-09 10:43:41', '2021-08-09 10:43:41'),
(1103, 1, '846_788_freshpath_(1).xls', 1101, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xls', '1.18 KB', '2021-08-09 10:43:41', '2021-08-09 10:43:41'),
(1104, 1, '604_abc-2-histogramme-des-co.csv', 1101, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '118 bytes', '2021-08-09 10:43:41', '2021-08-09 10:43:41'),
(1105, 1, '571_1627487409558.JPEG', 1101, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'JPEG', '26.95 KB', '2021-08-09 10:43:41', '2021-08-09 10:43:41'),
(1106, 1, '855_abc-2-histogramme-des-co.pdf', 1101, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '13.72 KB', '2021-08-09 10:43:41', '2021-08-09 10:43:41'),
(1107, 0, 'LOG180048', 8, '88', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1108, 0, 'Jobs', 1107, '88', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1109, 0, 'Item001', 1107, '88', '', 0, 0, 0, 82, 0, 0, 0, 0, '', '', '2021-08-09 10:50:31', '2021-08-09 10:50:31'),
(1110, 0, 'Item002', 1107, '88', '', 0, 0, 0, 83, 0, 0, 0, 0, '', '', '2021-08-09 10:50:31', '2021-08-09 10:50:31'),
(1111, 0, 'Item003', 1107, '88', '', 0, 0, 0, 84, 0, 0, 0, 0, '', '', '2021-08-09 10:50:31', '2021-08-09 10:50:31'),
(1112, 0, 'Item004', 1107, '88', '', 0, 0, 0, 85, 0, 0, 0, 0, '', '', '2021-08-09 10:50:31', '2021-08-09 10:50:31'),
(1113, 1, '802_abc-2-histogramme-des-co_(1).csv', 1109, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '118 bytes', '2021-08-09 10:51:30', '2021-08-09 10:51:30'),
(1114, 1, '428_562_freshpath_(1).csv', 1109, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '84 bytes', '2021-08-09 10:51:30', '2021-08-09 10:51:30'),
(1115, 1, '876_788_freshpath.xls', 1109, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xls', '1.18 KB', '2021-08-09 10:51:30', '2021-08-09 10:51:30'),
(1116, 1, '724_17_Flow_Chart.docx', 1109, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '15.19 KB', '2021-08-09 10:51:30', '2021-08-09 10:51:30'),
(1117, 1, '352_Boostshop.png', 1109, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '58.45 KB', '2021-08-09 10:51:30', '2021-08-09 10:51:30'),
(1118, 1, '788_1627487409558.JPEG', 262, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'JPEG', '26.95 KB', '2021-08-09 11:01:50', '2021-08-09 11:01:50'),
(1119, 1, '247_abc-2-histogramme-des-co.pdf', 262, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '13.72 KB', '2021-08-09 11:01:50', '2021-08-09 11:01:50'),
(1120, 1, '125_abc-2-histogramme-des-co.jpeg', 262, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpeg', '389.50 KB', '2021-08-09 11:01:50', '2021-08-09 11:01:50'),
(1121, 1, '612_Blank.pdf', 262, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '355.54 KB', '2021-08-09 11:01:50', '2021-08-09 11:01:50'),
(1126, 1, '159_1627487409558.JPEG', 58, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'JPEG', '26.95 KB', '2021-08-09 11:52:52', '2021-08-09 11:52:52'),
(1157, 1, 'Test543', 768, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-09 16:44:04', '2021-08-09 16:44:04'),
(1158, 1, '566_562_freshpath_(1).csv', 1157, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '84 bytes', '2021-08-09 16:47:01', '2021-08-09 16:47:01'),
(1159, 1, '419_788_freshpath_(1).xls', 1157, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xls', '1.18 KB', '2021-08-09 16:47:01', '2021-08-09 16:47:01'),
(1160, 1, '107_17_Flow_Chart.docx', 1157, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '15.19 KB', '2021-08-09 16:47:01', '2021-08-09 16:47:01'),
(1161, 1, '518_Boostshop.png', 1157, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '58.45 KB', '2021-08-09 16:47:01', '2021-08-09 16:47:01'),
(1162, 1, '185_abc-2-histogramme-des-co.jpeg', 1157, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpeg', '389.50 KB', '2021-08-09 16:47:01', '2021-08-09 16:47:01'),
(1163, 1, '548_562_freshpath_(1).csv', 492, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '84 bytes', '2021-08-09 16:49:59', '2021-08-09 16:49:59'),
(1164, 1, '63_Boostshop.png', 492, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '58.45 KB', '2021-08-09 16:49:59', '2021-08-09 16:49:59'),
(1165, 1, '459_17_Flow_Chart.docx', 492, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '15.19 KB', '2021-08-09 16:49:59', '2021-08-09 16:49:59'),
(1166, 1, '366_1627487409558.JPEG', 492, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'JPEG', '26.95 KB', '2021-08-09 16:49:59', '2021-08-09 16:49:59'),
(1167, 1, '734_Aexdo.pdf', 492, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '7.00 MB', '2021-08-09 16:49:59', '2021-08-09 16:49:59'),
(1168, 1, '467_at-14-layer-column-chart.xls', 495, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xls', '1.23 KB', '2021-08-09 16:56:37', '2021-08-09 16:56:37'),
(1169, 1, '219_562_freshpath__1_.csv', 495, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '84 bytes', '2021-08-09 16:56:37', '2021-08-09 16:56:37'),
(1170, 1, '365_abc-4-histogramme-des-co.png', 495, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '61.20 KB', '2021-08-09 16:56:37', '2021-08-09 16:56:37'),
(1171, 1, '614_import_probing_sheet_fr.xlsx', 495, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '17.30 KB', '2021-08-09 16:56:37', '2021-08-09 16:56:37'),
(1172, 1, '622_Boostshop.png', 495, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '58.45 KB', '2021-08-09 16:56:37', '2021-08-09 16:56:37'),
(1173, 1, '241_at-14-layer-column-chart.xls', 496, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xls', '1.23 KB', '2021-08-09 17:00:59', '2021-08-09 17:00:59'),
(1174, 1, '749_import_probing_sheet_fr.xlsx', 496, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '17.30 KB', '2021-08-09 17:00:59', '2021-08-09 17:00:59'),
(1175, 1, '877_abc-4-histogramme-des-co.png', 496, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '61.20 KB', '2021-08-09 17:00:59', '2021-08-09 17:00:59'),
(1176, 1, '553_17_Flow_Chart.docx', 496, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '15.19 KB', '2021-08-09 17:00:59', '2021-08-09 17:00:59'),
(1177, 1, '833_Boostshop.png', 496, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '58.45 KB', '2021-08-09 17:00:59', '2021-08-09 17:00:59'),
(1178, 2, '713_at-14-layer-column-chart.xls', 843, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xls', '1.23 KB', '2021-08-09 17:06:13', '2021-08-09 17:06:13'),
(1179, 2, '707_788_freshpath_(1).xls', 843, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xls', '1.18 KB', '2021-08-09 17:06:13', '2021-08-09 17:06:13'),
(1180, 2, '765_import_probing_sheet_fr.xlsx', 843, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '17.30 KB', '2021-08-09 17:06:13', '2021-08-09 17:06:13'),
(1181, 2, '534_abc-4-histogramme-des-co.png', 843, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '61.20 KB', '2021-08-09 17:06:13', '2021-08-09 17:06:13'),
(1182, 2, '362_Boostshop.png', 843, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '58.45 KB', '2021-08-09 17:06:13', '2021-08-09 17:06:13'),
(1183, 2, 'test3', 843, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-09 17:06:57', '2021-08-09 17:06:57'),
(1184, 2, '338_Flow_Chart.docx', 1183, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '15.19 KB', '2021-08-09 17:07:37', '2021-08-09 17:07:37'),
(1185, 2, '182_freshpath.csv', 1183, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '84 bytes', '2021-08-09 17:07:37', '2021-08-09 17:07:37'),
(1186, 2, '484_freshpath.pdf', 1183, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '9.94 KB', '2021-08-09 17:07:37', '2021-08-09 17:07:37'),
(1187, 2, '187_Financial_Sample.xlsx', 1183, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '89.78 KB', '2021-08-09 17:07:37', '2021-08-09 17:07:37'),
(1188, 2, 'f1', 844, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-09 17:12:11', '2021-08-09 17:12:11'),
(1189, 2, '191_at-14-layer-column-chart.xls', 1188, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xls', '1.23 KB', '2021-08-09 17:12:52', '2021-08-09 17:12:52'),
(1190, 2, '61_abc-4-histogramme-des-co.png', 1188, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '61.20 KB', '2021-08-09 17:12:52', '2021-08-09 17:12:52'),
(1191, 2, '122_import_probing_sheet_fr.xlsx', 1188, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '17.30 KB', '2021-08-09 17:12:52', '2021-08-09 17:12:52'),
(1192, 2, '56_Boostshop.png', 1188, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '58.45 KB', '2021-08-09 17:12:52', '2021-08-09 17:12:52'),
(1193, 2, 'f1', 1188, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-09 17:13:42', '2021-08-09 17:13:42'),
(1194, 2, '172_import_probing_sheet_fr.xlsx', 1193, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '17.30 KB', '2021-08-09 17:15:07', '2021-08-09 17:15:07'),
(1195, 2, '725_latest.csv', 1193, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '1.18 KB', '2021-08-09 17:15:07', '2021-08-09 17:15:07'),
(1196, 2, '591_missing.csv', 1193, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '444 bytes', '2021-08-09 17:15:07', '2021-08-09 17:15:07'),
(1197, 2, '419_abc-4-histogramme-des-co.png', 1193, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '61.20 KB', '2021-08-09 17:15:07', '2021-08-09 17:15:07'),
(1198, 2, 'F2', 1193, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-09 17:16:28', '2021-08-09 17:16:28'),
(1199, 2, '884_Untitled.csv', 1198, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '1.18 KB', '2021-08-09 17:24:26', '2021-08-09 17:24:26'),
(1200, 2, '497_users_data1.csv', 1198, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '462 bytes', '2021-08-09 17:24:26', '2021-08-09 17:24:26'),
(1201, 2, '205_State_Forms.xlsx', 1198, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '41.87 KB', '2021-08-09 17:24:26', '2021-08-09 17:24:26'),
(1202, 2, '424_TMS_-_Dashboard_-_Layout.docx', 1198, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '424.76 KB', '2021-08-09 17:24:26', '2021-08-09 17:24:26'),
(1203, 2, '437_sample_5184×3456.jpeg', 1198, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpeg', '5.30 MB', '2021-08-09 17:24:26', '2021-08-09 17:24:26'),
(1204, 1, '111_big_ben_at_night_190497.jpg', 16, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '67.11 KB', '2021-08-11 19:22:03', '2021-08-11 19:22:03'),
(1206, 1, '205_tms-12m.zip', 824, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'zip', '11.43 MB', '2021-08-12 11:32:15', '2021-08-12 11:32:15'),
(1207, 0, 'Item007', 10, '2', '', 0, 0, 0, 86, 0, 0, 0, 0, '', '', '2021-08-25 18:01:56', '2021-08-25 18:01:56'),
(1208, 0, 'COP011', 11, '2', '83', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-26 19:12:54', '2021-08-26 19:12:54'),
(1209, 0, '_in', 1208, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-26 19:12:54', '2021-08-26 19:12:54'),
(1210, 0, '_out', 1208, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-08-26 19:12:54', '2021-08-26 19:12:54'),
(1211, 0, 'LOG180049', 8, '100', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1212, 0, 'Jobs', 1211, '100', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1213, 0, 'LOG180050', 8, '102', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1214, 0, 'Jobs', 1213, '102', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1215, 0, 'Item001', 1213, '102', '', 0, 0, 0, 87, 0, 0, 0, 0, '', '', '2021-09-02 17:38:08', '2021-09-02 17:38:08'),
(1216, 0, 'Item002', 1213, '102', '', 0, 0, 0, 88, 0, 0, 0, 0, '', '', '2021-09-02 17:38:08', '2021-09-02 17:38:08'),
(1217, 0, 'COP001', 1214, '102', '84', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-02 17:40:13', '2021-09-02 17:40:13'),
(1218, 0, '_in', 1217, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-02 17:40:13', '2021-09-02 17:40:13'),
(1219, 0, '_out', 1217, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-02 17:40:13', '2021-09-02 17:40:13'),
(1220, 0, 'FED002', 1214, '102', '85', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-02 17:42:02', '2021-09-02 17:42:02'),
(1221, 0, '_in', 1220, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-02 17:42:02', '2021-09-02 17:42:02'),
(1222, 0, '_out', 1220, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-02 17:42:02', '2021-09-02 17:42:02'),
(1223, 1, '468_horse.jpg', 1218, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '8.98 KB', '2021-09-02 17:45:50', '2021-09-02 17:45:50'),
(1224, 1, '793_cat1.jpg', 1219, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '10.40 KB', '2021-09-02 17:46:41', '2021-09-02 17:46:41'),
(1225, 0, 'Item003', 1213, '102', '', 0, 0, 0, 89, 0, 0, 0, 0, '', '', '2021-09-02 18:38:19', '2021-09-02 18:38:19'),
(1226, 0, 'COP003', 1214, '102', '86', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-02 18:40:28', '2021-09-02 18:40:28'),
(1227, 0, '_in', 1226, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-02 18:40:28', '2021-09-02 18:40:28'),
(1228, 0, '_out', 1226, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-02 18:40:28', '2021-09-02 18:40:28'),
(1229, 0, 'LOG180051', 8, '103', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1230, 0, 'Jobs', 1229, '103', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1231, 0, 'Item001', 1229, '103', '', 0, 0, 0, 90, 0, 0, 0, 0, '', '', '2021-09-06 11:17:08', '2021-09-06 11:17:08'),
(1232, 1, '251_butterfly.jpg', 1231, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '9.83 KB', '2021-09-06 11:24:39', '2021-09-06 11:24:39'),
(1233, 1, '728_cat1.jpg', 1231, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '10.40 KB', '2021-09-06 11:24:39', '2021-09-06 11:24:39'),
(1234, 1, '586_cutetiger.jpg', 1231, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '11.89 KB', '2021-09-06 11:24:39', '2021-09-06 11:24:39'),
(1235, 1, '520_download__1_.jpg', 1231, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '12.38 KB', '2021-09-06 11:24:39', '2021-09-06 11:24:39'),
(1236, 1, '70_filesample_100kB-1629376714445.doc', 1231, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'doc', '98.00 KB', '2021-09-06 11:24:39', '2021-09-06 11:24:39'),
(1237, 0, 'BAD001', 1230, '103', '87', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-06 11:28:45', '2021-09-06 11:28:45'),
(1238, 0, '_in', 1237, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-06 11:28:45', '2021-09-06 11:28:45'),
(1239, 0, '_out', 1237, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-06 11:28:45', '2021-09-06 11:28:45'),
(1240, 0, 'Item002', 1229, '103', '', 0, 0, 0, 91, 0, 0, 0, 0, '', '', '2021-09-06 16:29:42', '2021-09-06 16:29:42'),
(1241, 0, 'Item003', 1229, '103', '', 0, 0, 0, 92, 0, 0, 0, 0, '', '', '2021-09-06 16:29:42', '2021-09-06 16:29:42'),
(1242, 0, 'Item004', 1229, '103', '', 0, 0, 0, 93, 0, 0, 0, 0, '', '', '2021-09-06 16:29:42', '2021-09-06 16:29:42'),
(1243, 0, 'Item005', 1229, '103', '', 0, 0, 0, 94, 0, 0, 0, 0, '', '', '2021-09-06 16:29:42', '2021-09-06 16:29:42'),
(1244, 0, 'Item006', 1229, '103', '', 0, 0, 0, 95, 0, 0, 0, 0, '', '', '2021-09-06 16:29:42', '2021-09-06 16:29:42'),
(1245, 0, 'Item007', 1229, '103', '', 0, 0, 0, 96, 0, 0, 0, 0, '', '', '2021-09-06 16:29:42', '2021-09-06 16:29:42'),
(1246, 0, 'Item008', 1229, '103', '', 0, 0, 0, 97, 0, 0, 0, 0, '', '', '2021-09-06 16:29:42', '2021-09-06 16:29:42'),
(1247, 0, 'Item009', 1229, '103', '', 0, 0, 0, 98, 0, 0, 0, 0, '', '', '2021-09-06 16:29:42', '2021-09-06 16:29:42'),
(1248, 0, 'Item010', 1229, '103', '', 0, 0, 0, 99, 0, 0, 0, 0, '', '', '2021-09-06 16:29:42', '2021-09-06 16:29:42'),
(1249, 0, 'Item011', 1229, '103', '', 0, 0, 0, 100, 0, 0, 0, 0, '', '', '2021-09-06 16:29:42', '2021-09-06 16:29:42'),
(1250, 0, 'COP002', 1230, '103', '88', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-06 16:31:08', '2021-09-06 16:31:08'),
(1251, 0, '_in', 1250, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-06 16:31:08', '2021-09-06 16:31:08'),
(1252, 0, '_out', 1250, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-06 16:31:08', '2021-09-06 16:31:08'),
(1253, 0, 'SEO003', 1230, '103', '89', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-06 16:33:23', '2021-09-06 16:33:23'),
(1254, 0, '_in', 1253, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-06 16:33:23', '2021-09-06 16:33:23'),
(1255, 0, '_out', 1253, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-06 16:33:23', '2021-09-06 16:33:23'),
(1256, 0, 'BAD004', 1230, '103', '90', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-06 16:36:11', '2021-09-06 16:36:11'),
(1257, 0, '_in', 1256, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-06 16:36:11', '2021-09-06 16:36:11'),
(1258, 0, '_out', 1256, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-06 16:36:11', '2021-09-06 16:36:11'),
(1259, 0, 'FED005', 1230, '103', '91', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-06 16:38:09', '2021-09-06 16:38:09'),
(1260, 0, '_in', 1259, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-06 16:38:09', '2021-09-06 16:38:09'),
(1261, 0, '_out', 1259, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-06 16:38:09', '2021-09-06 16:38:09'),
(1262, 0, 'TEST006', 1230, '103', '92', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-06 16:39:24', '2021-09-06 16:39:24'),
(1263, 0, '_in', 1262, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-06 16:39:24', '2021-09-06 16:39:24'),
(1264, 0, '_out', 1262, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-06 16:39:24', '2021-09-06 16:39:24'),
(1265, 0, 'SEO007', 1230, '103', '93', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-06 16:40:48', '2021-09-06 16:40:48'),
(1266, 0, '_in', 1265, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-06 16:40:48', '2021-09-06 16:40:48'),
(1267, 0, '_out', 1265, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-06 16:40:48', '2021-09-06 16:40:48'),
(1268, 0, 'TEST008', 1230, '103', '94', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-06 16:42:21', '2021-09-06 16:42:21'),
(1269, 0, '_in', 1268, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-06 16:42:21', '2021-09-06 16:42:21'),
(1270, 0, '_out', 1268, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-06 16:42:21', '2021-09-06 16:42:21');
INSERT INTO `tms_filemanager` (`fmanager_id`, `role_id`, `name`, `parent_id`, `order_id`, `job_id`, `client_id`, `in_client_id`, `user_id`, `item_id`, `is_default_folder`, `is_project_folder`, `is_ex_project_folder`, `f_id`, `ext`, `size`, `created_date`, `updated_date`) VALUES
(1271, 0, 'DTC009', 1230, '103', '95', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-06 16:43:27', '2021-09-06 16:43:27'),
(1272, 0, '_in', 1271, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-06 16:43:27', '2021-09-06 16:43:27'),
(1273, 0, '_out', 1271, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-06 16:43:27', '2021-09-06 16:43:27'),
(1274, 0, 'FED010', 1230, '103', '96', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-06 16:44:27', '2021-09-06 16:44:27'),
(1275, 0, '_in', 1274, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-06 16:44:27', '2021-09-06 16:44:27'),
(1276, 0, '_out', 1274, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-06 16:44:27', '2021-09-06 16:44:27'),
(1277, 0, 'LOG180052', 8, '107', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1278, 0, 'Jobs', 1277, '107', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1279, 0, 'Item001', 1277, '107', '', 0, 0, 0, 101, 0, 0, 0, 0, '', '', '2021-09-08 13:46:42', '2021-09-08 13:46:42'),
(1280, 0, 'Item002', 1277, '107', '', 0, 0, 0, 102, 0, 0, 0, 0, '', '', '2021-09-08 13:46:42', '2021-09-08 13:46:42'),
(1281, 0, 'LOG180053', 8, '111', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1282, 0, 'Jobs', 1281, '111', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1283, 1, '581_freshpath.svg', 1279, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'svg', '8.78 KB', '2021-09-13 09:51:24', '2021-09-13 09:51:24'),
(1284, 0, 'BAD001', 1278, '107', '97', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-13 10:36:27', '2021-09-13 10:36:27'),
(1285, 0, '_in', 1284, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-13 10:36:27', '2021-09-13 10:36:27'),
(1286, 0, '_out', 1284, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-13 10:36:27', '2021-09-13 10:36:27'),
(1287, 1, '873_Signature.jpg', 1280, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '203.22 KB', '2021-09-13 10:44:30', '2021-09-13 10:44:30'),
(1288, 0, 'COP002', 1278, '107', '98', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-13 10:46:31', '2021-09-13 10:46:31'),
(1289, 0, '_in', 1288, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-13 10:46:31', '2021-09-13 10:46:31'),
(1290, 0, '_out', 1288, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-13 10:46:31', '2021-09-13 10:46:31'),
(1291, 1, 'test54', 1285, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-13 10:50:33', '2021-09-13 10:50:33'),
(1292, 1, '330_butterfly.jpg', 1291, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '9.83 KB', '2021-09-13 10:51:13', '2021-09-13 10:51:13'),
(1293, 1, '983_cat1.jpg', 1291, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '10.40 KB', '2021-09-13 10:51:13', '2021-09-13 10:51:13'),
(1294, 1, '364_Boostshop.png', 1291, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '58.45 KB', '2021-09-13 10:51:13', '2021-09-13 10:51:13'),
(1295, 0, 'LOG180054', 8, '113', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1296, 0, 'Jobs', 1295, '113', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1297, 0, 'Item001', 1295, '113', '', 0, 0, 0, 103, 0, 0, 0, 0, '', '', '2021-09-15 10:46:24', '2021-09-15 10:46:24'),
(1298, 0, 'Item002', 1295, '113', '', 0, 0, 0, 104, 0, 0, 0, 0, '', '', '2021-09-15 10:46:24', '2021-09-15 10:46:24'),
(1299, 0, 'BAD001', 1296, '113', '99', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-15 10:48:12', '2021-09-15 10:48:12'),
(1300, 0, '_in', 1299, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-15 10:48:12', '2021-09-15 10:48:12'),
(1301, 0, '_out', 1299, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-15 10:48:12', '2021-09-15 10:48:12'),
(1302, 0, 'BAD002', 1296, '113', '100', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-15 10:50:39', '2021-09-15 10:50:39'),
(1303, 0, '_in', 1302, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-15 10:50:39', '2021-09-15 10:50:39'),
(1304, 0, '_out', 1302, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-15 10:50:39', '2021-09-15 10:50:39'),
(1305, 1, '934_flower.jpg', 1297, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '10.52 KB', '2021-09-15 10:52:07', '2021-09-15 10:52:07'),
(1306, 1, '215_Fower2.jpg', 1297, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '8.99 KB', '2021-09-15 10:52:07', '2021-09-15 10:52:07'),
(1307, 1, '3_hd-wallpaper1.png', 1298, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '684.84 KB', '2021-09-15 10:55:05', '2021-09-15 10:55:05'),
(1308, 0, 'COP002', 498, '61', '101', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-16 16:15:17', '2021-09-16 16:15:17'),
(1309, 0, '_in', 1308, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-16 16:15:17', '2021-09-16 16:15:17'),
(1310, 0, '_out', 1308, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-16 16:15:17', '2021-09-16 16:15:17'),
(1311, 0, 'Item002', 0, '61', '', 0, 0, 0, 105, 0, 0, 0, 0, '', '', '2021-09-16 16:18:38', '2021-09-16 16:18:38'),
(1312, 0, 'Item003', 0, '61', '', 0, 0, 0, 106, 0, 0, 0, 0, '', '', '2021-09-16 16:18:38', '2021-09-16 16:18:38'),
(1313, 0, 'Item004', 0, '61', '', 0, 0, 0, 107, 0, 0, 0, 0, '', '', '2021-09-16 16:18:38', '2021-09-16 16:18:38'),
(1314, 0, 'DTP003', 498, '61', '102', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-16 16:23:57', '2021-09-16 16:23:57'),
(1315, 0, '_in', 1314, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-16 16:23:57', '2021-09-16 16:23:57'),
(1316, 0, '_out', 1314, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-16 16:23:57', '2021-09-16 16:23:57'),
(1317, 0, 'LOG180055', 53, '114', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1318, 0, 'Jobs', 1317, '114', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1319, 0, 'Item001', 1317, '114', '', 0, 0, 0, 108, 0, 0, 0, 0, '', '', '2021-09-16 16:34:46', '2021-09-16 16:34:46'),
(1320, 0, 'DTC001', 1318, '114', '103', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-16 16:35:34', '2021-09-16 16:35:34'),
(1321, 0, '_in', 1320, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-16 16:35:34', '2021-09-16 16:35:34'),
(1322, 0, '_out', 1320, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-16 16:35:34', '2021-09-16 16:35:34'),
(1323, 0, 'Item002', 1317, '114', '', 0, 0, 0, 109, 0, 0, 0, 0, '', '', '2021-09-16 17:09:43', '2021-09-16 17:09:43'),
(1327, 0, 'LOG180056', 8, '115', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1328, 0, 'Jobs', 1327, '115', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1332, 0, 'Item001', 1327, '115', '', 0, 0, 0, 116, 0, 0, 0, 0, '', '', '2021-09-17 10:28:14', '2021-09-17 10:28:14'),
(1337, 0, 'SEO001', 1328, '115', '104', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-17 10:30:56', '2021-09-17 10:30:56'),
(1338, 0, '_in', 1337, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-17 10:30:56', '2021-09-17 10:30:56'),
(1339, 0, '_out', 1337, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-17 10:30:56', '2021-09-17 10:30:56'),
(1340, 0, 'DTP002', 1328, '115', '105', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-17 10:30:57', '2021-09-17 10:30:57'),
(1341, 0, '_in', 1340, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-17 10:30:57', '2021-09-17 10:30:57'),
(1342, 0, '_out', 1340, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-17 10:30:57', '2021-09-17 10:30:57'),
(1343, 0, 'DTC004', 1328, '115', '106', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-17 10:30:58', '2021-09-17 10:30:58'),
(1344, 0, '_in', 1343, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-17 10:30:58', '2021-09-17 10:30:58'),
(1345, 0, '_out', 1343, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-17 10:30:58', '2021-09-17 10:30:58'),
(1346, 2, '375_Screenshotfrom1.png', 18, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '132.70 KB', '2021-09-17 10:44:45', '2021-09-17 10:44:45'),
(1347, 0, 'DTC002', 1318, '114', '107', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-17 11:22:28', '2021-09-17 11:22:28'),
(1348, 0, '_in', 1347, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-17 11:22:28', '2021-09-17 11:22:28'),
(1349, 0, '_out', 1347, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-17 11:22:28', '2021-09-17 11:22:28'),
(1350, 0, 'Item003', 1317, '114', '', 0, 0, 0, 121, 0, 0, 0, 0, '', '', '2021-09-17 15:20:04', '2021-09-17 15:20:04'),
(1351, 0, 'Item004', 1317, '114', '', 0, 0, 0, 122, 0, 0, 0, 0, '', '', '2021-09-17 15:20:04', '2021-09-17 15:20:04'),
(1352, 0, 'LOG180057', 53, '117', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1353, 0, 'Jobs', 1352, '117', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1354, 0, 'Item001', 1352, '117', '', 0, 0, 0, 123, 0, 0, 0, 0, '', '', '2021-09-17 16:28:00', '2021-09-17 16:28:00'),
(1355, 0, 'Item002', 1352, '117', '', 0, 0, 0, 124, 0, 0, 0, 0, '', '', '2021-09-17 16:28:00', '2021-09-17 16:28:00'),
(1356, 0, 'DTC001', 1353, '117', '108', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-17 16:29:16', '2021-09-17 16:29:16'),
(1357, 0, '_in', 1356, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-17 16:29:16', '2021-09-17 16:29:16'),
(1358, 0, '_out', 1356, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-17 16:29:16', '2021-09-17 16:29:16'),
(1359, 0, 'COP002', 1353, '117', '109', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-17 16:30:18', '2021-09-17 16:30:18'),
(1360, 0, '_in', 1359, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-17 16:30:18', '2021-09-17 16:30:18'),
(1361, 0, '_out', 1359, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-17 16:30:18', '2021-09-17 16:30:18'),
(1362, 1, '358_TMS_Dashboard_Layout_-_08.09.2021_(1).docx', 1360, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '1.09 MB', '2021-09-17 16:32:13', '2021-09-17 16:32:13'),
(1363, 0, 'LOG180058', 53, '119', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1364, 0, 'Jobs', 1363, '119', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1365, 0, 'Item001', 1363, '119', '', 0, 0, 0, 125, 0, 0, 0, 0, '', '', '2021-09-20 10:43:24', '2021-09-20 10:43:24'),
(1367, 0, 'COP001', 1364, '119', '110', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-20 10:45:18', '2021-09-20 10:45:18'),
(1368, 0, '_in', 1367, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-20 10:45:18', '2021-09-20 10:45:18'),
(1369, 0, '_out', 1367, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-20 10:45:18', '2021-09-20 10:45:18'),
(1370, 0, 'LOG180059', 8, '120', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1371, 0, 'Jobs', 1370, '120', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1372, 0, 'Item001', 1370, '120', '', 0, 0, 0, 127, 0, 0, 0, 0, '', '', '2021-09-20 10:49:48', '2021-09-20 10:49:48'),
(1373, 0, 'COP001', 1371, '120', '111', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-20 10:50:18', '2021-09-20 10:50:18'),
(1374, 0, '_in', 1373, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-20 10:50:18', '2021-09-20 10:50:18'),
(1375, 0, '_out', 1373, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-20 10:50:18', '2021-09-20 10:50:18'),
(1376, 0, 'LOG180060', 8, '123', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1377, 0, 'Jobs', 1376, '123', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1378, 0, 'Item001', 1376, '123', '', 0, 0, 0, 128, 0, 0, 0, 0, '', '', '2021-09-20 18:28:39', '2021-09-20 18:28:39'),
(1379, 0, 'FED001', 1377, '123', '112', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-20 18:30:27', '2021-09-20 18:30:27'),
(1380, 0, '_in', 1379, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-20 18:30:27', '2021-09-20 18:30:27'),
(1381, 0, '_out', 1379, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-20 18:30:27', '2021-09-20 18:30:27'),
(1382, 0, 'LOG180061', 53, '124', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1383, 0, 'Jobs', 1382, '124', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1384, 0, 'Item001', 1382, '124', '', 0, 0, 0, 129, 0, 0, 0, 0, '', '', '2021-09-20 18:48:36', '2021-09-20 18:48:36'),
(1385, 0, 'DTC001', 1383, '124', '113', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-20 18:49:04', '2021-09-20 18:49:04'),
(1386, 0, '_in', 1385, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-20 18:49:04', '2021-09-20 18:49:04'),
(1387, 0, '_out', 1385, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-20 18:49:04', '2021-09-20 18:49:04'),
(1388, 0, 'LOG180062', 53, '125', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1389, 0, 'Jobs', 1388, '125', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1390, 0, 'Item001', 1388, '125', '', 0, 0, 0, 130, 0, 0, 0, 0, '', '', '2021-09-20 18:52:04', '2021-09-20 18:52:04'),
(1391, 0, 'SEO001', 1389, '125', '114', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-20 18:52:25', '2021-09-20 18:52:25'),
(1392, 0, '_in', 1391, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-20 18:52:25', '2021-09-20 18:52:25'),
(1393, 0, '_out', 1391, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-20 18:52:25', '2021-09-20 18:52:25'),
(1394, 0, 'DTP002', 1389, '125', '115', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-20 18:52:25', '2021-09-20 18:52:25'),
(1395, 0, '_in', 1394, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-20 18:52:25', '2021-09-20 18:52:25'),
(1396, 0, '_out', 1394, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-20 18:52:25', '2021-09-20 18:52:25'),
(1397, 0, 'DTC004', 1389, '125', '116', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-20 18:52:26', '2021-09-20 18:52:26'),
(1398, 0, '_in', 1397, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-20 18:52:26', '2021-09-20 18:52:26'),
(1399, 0, '_out', 1397, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-20 18:52:26', '2021-09-20 18:52:26'),
(1400, 0, 'LOG180063', 53, '126', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1401, 0, 'Jobs', 1400, '126', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1402, 0, 'Item001', 1400, '126', '', 0, 0, 0, 131, 0, 0, 0, 0, '', '', '2021-09-20 19:00:31', '2021-09-20 19:00:31'),
(1403, 0, 'DTP001', 1401, '126', '117', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-20 19:01:08', '2021-09-20 19:01:08'),
(1404, 0, '_in', 1403, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-20 19:01:08', '2021-09-20 19:01:08'),
(1405, 0, '_out', 1403, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-20 19:01:08', '2021-09-20 19:01:08'),
(1406, 0, 'LOG180064', 8, '127', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1407, 0, 'Jobs', 1406, '127', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1408, 0, 'Item001', 1406, '127', '', 0, 0, 0, 132, 0, 0, 0, 0, '', '', '2021-09-20 19:15:38', '2021-09-20 19:15:38'),
(1409, 0, 'Item002', 1406, '127', '', 0, 0, 0, 133, 0, 0, 0, 0, '', '', '2021-09-20 19:15:38', '2021-09-20 19:15:38'),
(1410, 0, 'FED001', 1407, '127', '118', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-20 19:15:59', '2021-09-20 19:15:59'),
(1411, 0, '_in', 1410, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-20 19:15:59', '2021-09-20 19:15:59'),
(1412, 0, '_out', 1410, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-20 19:15:59', '2021-09-20 19:15:59'),
(1413, 0, 'LOG180065', 8, '128', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1414, 0, 'Jobs', 1413, '128', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1415, 0, 'Item001', 1413, '128', '', 0, 0, 0, 134, 0, 0, 0, 0, '', '', '2021-09-21 11:11:57', '2021-09-21 11:11:57'),
(1416, 0, 'FED001', 1414, '128', '119', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-21 11:12:41', '2021-09-21 11:12:41'),
(1417, 0, '_in', 1416, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-21 11:12:41', '2021-09-21 11:12:41'),
(1418, 0, '_out', 1416, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-21 11:12:41', '2021-09-21 11:12:41'),
(1419, 0, 'internal-0006', 0, '', '', 0, 0, 11, 0, 0, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1420, 0, 'LOG180066', 53, '130', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1421, 0, 'Jobs', 1420, '130', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1422, 0, 'Item001', 1420, '130', '', 0, 0, 0, 135, 0, 0, 0, 0, '', '', '2021-09-23 18:13:08', '2021-09-23 18:13:08'),
(1423, 0, 'Item002', 1420, '130', '', 0, 0, 0, 136, 0, 0, 0, 0, '', '', '2021-09-23 18:13:08', '2021-09-23 18:13:08'),
(1428, 0, 'LOG180067', 53, '131', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1429, 0, 'Jobs', 1428, '131', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1430, 0, 'Item001', 1428, '131', '', 0, 0, 0, 141, 0, 0, 0, 0, '', '', '2021-09-24 10:27:01', '2021-09-24 10:27:01'),
(1436, 0, 'DTC001', 1429, '131', '120', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-24 10:30:43', '2021-09-24 10:30:43'),
(1437, 0, '_in', 1436, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-24 10:30:43', '2021-09-24 10:30:43'),
(1438, 0, '_out', 1436, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-09-24 10:30:43', '2021-09-24 10:30:43'),
(1447, 0, '', 53, '135', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1448, 0, 'Item001', 1447, '135', '', 0, 0, 0, 152, 0, 0, 0, 0, '', '', '2021-10-01 11:34:53', '2021-10-01 11:34:53'),
(1449, 0, 'Item002', 1447, '135', '', 0, 0, 0, 153, 0, 0, 0, 0, '', '', '2021-10-01 11:34:53', '2021-10-01 11:34:53'),
(1450, 0, 'DTC001', 0, '135', '122', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-01 11:44:35', '2021-10-01 11:44:35'),
(1451, 0, '_in', 1450, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-01 11:44:35', '2021-10-01 11:44:35'),
(1452, 0, '_out', 1450, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-01 11:44:35', '2021-10-01 11:44:35'),
(1453, 1, '138_1940441_1633005059.pdf', 1448, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '69.84 KB', '2021-10-01 11:49:05', '2021-10-01 11:49:05'),
(1454, 1, '232_download1.jpg', 1448, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '105.67 KB', '2021-10-01 11:49:05', '2021-10-01 11:49:05'),
(1455, 1, '135_Natureimage2.jpg', 1448, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '650.34 KB', '2021-10-01 11:49:05', '2021-10-01 11:49:05'),
(1456, 0, 'DTP001', 1421, '130', '123', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-01 12:01:35', '2021-10-01 12:01:35'),
(1457, 0, '_in', 1456, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-01 12:01:35', '2021-10-01 12:01:35'),
(1458, 0, '_out', 1456, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-01 12:01:35', '2021-10-01 12:01:35'),
(1459, 0, 'COP002', 1421, '130', '124', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-01 12:02:07', '2021-10-01 12:02:07'),
(1460, 0, '_in', 1459, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-01 12:02:07', '2021-10-01 12:02:07'),
(1461, 0, '_out', 1459, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-01 12:02:07', '2021-10-01 12:02:07'),
(1464, 1, '794_sample_640×426.bmp', 19, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'bmp', '798.88 KB', '2021-10-04 16:29:02', '2021-10-04 16:29:02'),
(1465, 0, 'SEO002', 0, '135', '125', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-05 16:22:11', '2021-10-05 16:22:11'),
(1466, 0, '_in', 1465, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-05 16:22:11', '2021-10-05 16:22:11'),
(1467, 0, '_out', 1465, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-05 16:22:11', '2021-10-05 16:22:11'),
(1477, 1, '351_Localization_probings.csv', 1457, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '6.35 KB', '2021-10-07 10:47:24', '2021-10-07 10:47:24'),
(1478, 1, '94_newplot_(7).png', 1457, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '25.06 KB', '2021-10-07 10:47:24', '2021-10-07 10:47:24'),
(1479, 1, '10_83604388-0003-41d1-a91d-054218c45332.pdf', 1457, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '189.60 KB', '2021-10-07 10:47:24', '2021-10-07 10:47:24'),
(1480, 1, 'F1', 1457, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-07 10:47:55', '2021-10-07 10:47:55'),
(1481, 1, '379_1940441_1633005059.pdf', 1480, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '69.84 KB', '2021-10-07 10:48:24', '2021-10-07 10:48:24'),
(1482, 1, '815_download11_1633008605.jpg', 1480, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '105.67 KB', '2021-10-07 10:48:24', '2021-10-07 10:48:24'),
(1483, 1, '422_download1_(1).jpg', 1480, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '105.67 KB', '2021-10-07 10:48:24', '2021-10-07 10:48:24'),
(1484, 1, '389_image_(1).png', 1480, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '723.00 KB', '2021-10-07 10:48:24', '2021-10-07 10:48:24'),
(1485, 1, '193_94_newplot_(7).png', 1458, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '25.06 KB', '2021-10-07 10:52:39', '2021-10-07 10:52:39'),
(1486, 1, '825_download1_(1).jpg', 1458, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '105.67 KB', '2021-10-07 10:52:39', '2021-10-07 10:52:39'),
(1487, 1, '173_941_(2).pdf', 1458, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '5.16 MB', '2021-10-07 10:52:39', '2021-10-07 10:52:39'),
(1488, 1, '162_941_(3).pdf', 1458, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '5.16 MB', '2021-10-07 10:52:39', '2021-10-07 10:52:39'),
(1489, 1, '281_941_(1).pdf', 1458, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '5.16 MB', '2021-10-07 10:52:39', '2021-10-07 10:52:39'),
(1490, 1, '733_contact_template__9__(19).xlsx', 1458, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '66.56 KB', '2021-10-07 10:53:56', '2021-10-07 10:53:56'),
(1491, 1, '977_94_newplot_(7).png', 1458, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '25.06 KB', '2021-10-07 10:53:56', '2021-10-07 10:53:56'),
(1492, 1, '879_contact_template__9__(17).xlsx', 1458, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '66.56 KB', '2021-10-07 10:53:56', '2021-10-07 10:53:56'),
(1493, 1, '705_contact_template__9__(15).xlsx', 1458, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '66.56 KB', '2021-10-07 10:53:56', '2021-10-07 10:53:56'),
(1494, 1, '85_4th_Quarter_2020_1847.pdf', 1458, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '397.08 KB', '2021-10-07 10:53:56', '2021-10-07 10:53:56'),
(1495, 2, '346_94_newplot_(7).png', 1387, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '25.06 KB', '2021-10-07 11:04:36', '2021-10-07 11:04:36'),
(1496, 2, '772_Contracted_Provider_List.xls', 1387, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xls', '108.50 KB', '2021-10-07 11:04:36', '2021-10-07 11:04:36'),
(1497, 2, '648_DOC_WR30_Qtr01_2021.pdf', 1387, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '2.15 MB', '2021-10-07 11:04:36', '2021-10-07 11:04:36'),
(1498, 2, '545_94_newplot_(7).png', 1386, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '25.06 KB', '2021-10-07 11:07:06', '2021-10-07 11:07:06'),
(1499, 2, '51_Test376376_Test376376_excel.xlsx', 1386, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '325.05 KB', '2021-10-07 11:07:06', '2021-10-07 11:07:06'),
(1500, 2, '108_sample_640×426.bmp', 1386, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'bmp', '798.88 KB', '2021-10-07 11:07:06', '2021-10-07 11:07:06'),
(1501, 2, '393_sample_1280×853.bmp', 1386, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'bmp', '3.12 MB', '2021-10-07 11:07:06', '2021-10-07 11:07:06'),
(1502, 0, 'LOG180069', 53, '136', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1503, 0, 'Jobs', 1502, '136', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1504, 0, 'Item001', 1502, '136', '', 0, 0, 0, 163, 0, 0, 0, 0, '', '', '2021-10-07 15:19:58', '2021-10-07 15:19:58'),
(1505, 0, 'Item002', 1502, '136', '', 0, 0, 0, 164, 0, 0, 0, 0, '', '', '2021-10-07 15:19:58', '2021-10-07 15:19:58'),
(1506, 0, 'Item003', 1502, '136', '', 0, 0, 0, 165, 0, 0, 0, 0, '', '', '2021-10-07 15:19:58', '2021-10-07 15:19:58'),
(1507, 0, 'COP001', 1503, '136', '126', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-07 15:21:29', '2021-10-07 15:21:29'),
(1508, 0, '_in', 1507, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-07 15:21:29', '2021-10-07 15:21:29'),
(1509, 0, '_out', 1507, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-07 15:21:29', '2021-10-07 15:21:29'),
(1510, 0, 'SEO002', 1503, '136', '127', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-07 15:22:37', '2021-10-07 15:22:37'),
(1511, 0, '_in', 1510, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-07 15:22:37', '2021-10-07 15:22:37'),
(1512, 0, '_out', 1510, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-07 15:22:37', '2021-10-07 15:22:37'),
(1519, 0, 'DTP006', 1503, '136', '130', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-07 15:23:16', '2021-10-07 15:23:16'),
(1520, 0, '_in', 1519, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-07 15:23:16', '2021-10-07 15:23:16'),
(1521, 0, '_out', 1519, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-07 15:23:16', '2021-10-07 15:23:16'),
(1522, 0, 'LOG180070', 53, '137', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1523, 0, 'Jobs', 1522, '137', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1524, 0, 'Item001', 1522, '137', '', 0, 0, 0, 166, 0, 0, 0, 0, '', '', '2021-10-07 18:18:16', '2021-10-07 18:18:16'),
(1525, 0, 'Item002', 1522, '137', '', 0, 0, 0, 167, 0, 0, 0, 0, '', '', '2021-10-07 18:18:16', '2021-10-07 18:18:16'),
(1528, 0, 'COP001', 1523, '137', '131', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-07 18:19:01', '2021-10-07 18:19:01'),
(1529, 0, '_in', 1528, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-07 18:19:01', '2021-10-07 18:19:01'),
(1530, 0, '_out', 1528, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-07 18:19:01', '2021-10-07 18:19:01'),
(1531, 0, 'DTP002', 1523, '137', '132', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-07 18:19:39', '2021-10-07 18:19:39'),
(1532, 0, '_in', 1531, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-07 18:19:39', '2021-10-07 18:19:39'),
(1533, 0, '_out', 1531, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-07 18:19:39', '2021-10-07 18:19:39'),
(1537, 1, '887_image_(1).png', 1529, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '723.00 KB', '2021-10-07 18:29:40', '2021-10-07 18:29:40'),
(1539, 1, '742_94_newplot_(7).png', 1530, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '25.06 KB', '2021-10-07 18:33:49', '2021-10-07 18:33:49'),
(1540, 1, '601_newplot_(7).png', 1530, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '25.06 KB', '2021-10-07 18:33:49', '2021-10-07 18:33:49'),
(1541, 0, 'LOG180071', 8, '138', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1542, 0, 'Jobs', 1541, '138', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1543, 0, 'Item001', 1541, '138', '', 0, 0, 0, 168, 0, 0, 0, 0, '', '', '2021-10-08 10:33:18', '2021-10-08 10:33:18'),
(1544, 1, '644_tms_language.pdf', 1543, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '101.83 KB', '2021-10-08 10:33:34', '2021-10-08 10:33:34'),
(1545, 1, '535_1625554731.jpg', 1543, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '4.16 KB', '2021-10-08 10:40:09', '2021-10-08 10:40:09'),
(1546, 0, 'DTC001', 1542, '138', '133', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-08 12:23:47', '2021-10-08 12:23:47'),
(1547, 0, '_in', 1546, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-08 12:23:47', '2021-10-08 12:23:47'),
(1548, 0, '_out', 1546, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-08 12:23:47', '2021-10-08 12:23:47'),
(1549, 1, '462_394_newplot_(5).png', 0, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '25.06 KB', '2021-10-08 12:34:35', '2021-10-08 12:34:35'),
(1550, 1, '687_94_newplot_(7).png', 0, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '25.06 KB', '2021-10-08 12:34:35', '2021-10-08 12:34:35'),
(1551, 1, '223_TMS_Dashboard_Layout_-_24.09.2021_(1).docx', 0, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '527.18 KB', '2021-10-08 12:34:35', '2021-10-08 12:34:35'),
(1552, 1, '567_83604388-0003-41d1-a91d-054218c45332.pdf', 0, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '189.60 KB', '2021-10-08 12:34:35', '2021-10-08 12:34:35'),
(1553, 1, '87_gfdfgdggt.bmp', 0, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'bmp', '3.12 MB', '2021-10-08 12:34:35', '2021-10-08 12:34:35'),
(1554, 1, '701_394_newplot_(5).png', 1543, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '25.06 KB', '2021-10-08 12:36:01', '2021-10-08 12:36:01'),
(1555, 1, '204_94_newplot_(7).png', 1543, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '25.06 KB', '2021-10-08 12:36:01', '2021-10-08 12:36:01'),
(1556, 1, '124_TMS_Dashboard_Layout_-_24.09.2021_(1).docx', 1543, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '527.18 KB', '2021-10-08 12:36:01', '2021-10-08 12:36:01'),
(1557, 1, '496_BLTR_ENT_LLC__-_EIG287679301.xlsx', 1543, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '274.28 KB', '2021-10-08 12:36:01', '2021-10-08 12:36:01'),
(1558, 1, '361_gfdfgdggt.bmp', 1543, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'bmp', '3.12 MB', '2021-10-08 12:36:01', '2021-10-08 12:36:01'),
(1559, 1, 'NNT', 1543, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-08 12:37:21', '2021-10-08 12:36:17'),
(1560, 1, '983_Sample-Spreadsheet-10-rows.csv', 1559, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '1.07 KB', '2021-10-08 12:36:44', '2021-10-08 12:36:44'),
(1561, 1, '979_TMS_Dashboard_Layout_-_24.09.2021_(1).docx', 1559, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '527.18 KB', '2021-10-08 12:36:44', '2021-10-08 12:36:44'),
(1562, 1, '210_sample_640×426.bmp', 1559, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'bmp', '798.88 KB', '2021-10-08 12:36:44', '2021-10-08 12:36:44'),
(1563, 1, '528_image_(1).png', 1559, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '723.00 KB', '2021-10-08 12:36:44', '2021-10-08 12:36:44'),
(1564, 1, '39_sample_1280×853.bmp', 1559, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'bmp', '3.12 MB', '2021-10-08 12:36:44', '2021-10-08 12:36:44'),
(1565, 1, '644_tms_language_copy.pdf', 1543, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '101.83 KB', '2021-10-08 10:33:34', '2021-10-08 10:33:34'),
(1566, 1, '535_1625554731_copy.jpg', 1543, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '4.16 KB', '2021-10-08 10:40:09', '2021-10-08 10:40:09'),
(1568, 1, '126_94_newplot_(7).png', 1547, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '25.06 KB', '2021-10-08 12:42:30', '2021-10-08 12:42:30'),
(1570, 1, '963_BLTR_ENT_LLC__-_EIG287679301.xlsx', 1547, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '274.28 KB', '2021-10-08 12:42:30', '2021-10-08 12:42:30'),
(1571, 1, '912_gfdfgdggt.bmp', 1547, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'bmp', '3.12 MB', '2021-10-08 12:42:30', '2021-10-08 12:42:30'),
(1574, 1, '851_contact_template1-1629980300027.xlsx', 1548, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '8.79 KB', '2021-10-08 12:44:30', '2021-10-08 12:44:30'),
(1575, 1, '9_194044_(1).pdf', 1548, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '69.84 KB', '2021-10-08 12:44:30', '2021-10-08 12:44:30'),
(1576, 1, '298_TMS_Dashboard_Layout_-_08.09.2021-updated.odt', 1548, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'odt', '1.16 MB', '2021-10-08 12:44:30', '2021-10-08 12:44:30'),
(1577, 1, '2_966_394_newplot_(5).png', 1548, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '25.06 KB', '2021-10-08 12:53:27', '2021-10-08 12:53:27'),
(1578, 1, '114_DOC_WR30_Qtr02_2021.pdf', 1548, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '79.65 KB', '2021-10-08 12:53:27', '2021-10-08 12:53:27'),
(1579, 1, '492_Contracted_Provider_List.xls', 1548, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xls', '108.50 KB', '2021-10-08 12:53:27', '2021-10-08 12:53:27'),
(1580, 1, '232_DOC_WR30_Qtr01_2021.pdf', 1548, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '2.15 MB', '2021-10-08 12:53:27', '2021-10-08 12:53:27'),
(1581, 1, '470_941.pdf', 1548, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '5.16 MB', '2021-10-08 12:53:27', '2021-10-08 12:53:27'),
(1582, 2, '872_394_newplot_(5).png', 1357, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '25.06 KB', '2021-10-08 12:58:38', '2021-10-08 12:58:38'),
(1583, 2, '872_94_newplot_(7).png', 1357, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '25.06 KB', '2021-10-08 12:58:38', '2021-10-08 12:58:38'),
(1584, 2, '204_TMS_Dashboard_Layout_-_24.09.2021_(1).docx', 1357, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '527.18 KB', '2021-10-08 12:58:38', '2021-10-08 12:58:38'),
(1585, 2, 'Fdemo765', 1357, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-08 12:59:01', '2021-10-08 12:59:01'),
(1586, 2, '20_966_394_newplot_(5).png', 1585, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '25.06 KB', '2021-10-08 12:59:30', '2021-10-08 12:59:30'),
(1587, 2, '860_gsync_WYOMISSING_OPTOMETRIC_CENTER,.pdf', 1585, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '12.18 KB', '2021-10-08 12:59:30', '2021-10-08 12:59:30'),
(1588, 2, '854_194044_(1).pdf', 1585, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '69.84 KB', '2021-10-08 12:59:30', '2021-10-08 12:59:30'),
(1589, 2, '470_194044.pdf', 1585, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '69.84 KB', '2021-10-08 12:59:30', '2021-10-08 12:59:30'),
(1590, 2, '843_TMS_Dashboard_Layout_-_08.09.2021-updated.odt', 1585, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'odt', '1.16 MB', '2021-10-08 12:59:30', '2021-10-08 12:59:30'),
(1591, 2, '875_966_394_newplot_(5).png', 1358, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '25.06 KB', '2021-10-08 13:01:14', '2021-10-08 13:01:14'),
(1592, 2, '127_TMS_Dashboard_Layout_-_08.09.2021_(1).docx', 1358, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '1.09 MB', '2021-10-08 13:01:14', '2021-10-08 13:01:14'),
(1593, 2, '754_TMS_Dashboard_Layout_-_08.09.2021.docx', 1358, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '1.09 MB', '2021-10-08 13:01:14', '2021-10-08 13:01:14'),
(1594, 0, 'Item002', 1541, '138', '', 0, 0, 0, 169, 0, 0, 0, 0, '', '', '2021-10-08 17:46:32', '2021-10-08 17:46:32'),
(1595, 0, 'COP001', 133, '40', '134', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-11 14:36:21', '2021-10-11 14:36:21'),
(1596, 0, '_in', 1595, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-11 14:36:21', '2021-10-11 14:36:21'),
(1597, 0, '_out', 1595, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-11 14:36:21', '2021-10-11 14:36:21'),
(1610, 0, 'Item002', 0, '40', '', 0, 0, 0, 182, 0, 0, 0, 0, '', '', '2021-10-11 14:39:47', '2021-10-11 14:39:47'),
(1611, 0, 'Item003', 0, '40', '', 0, 0, 0, 183, 0, 0, 0, 0, '', '', '2021-10-11 14:39:47', '2021-10-11 14:39:47'),
(1613, 0, 'Item005', 0, '40', '', 0, 0, 0, 185, 0, 0, 0, 0, '', '', '2021-10-11 14:40:01', '2021-10-11 14:40:01'),
(1618, 1, '245_New_update_formula_NRM_GL_template_2021.xlsx', 1, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '223.09 KB', '2021-10-11 16:14:55', '2021-10-11 16:14:55'),
(1621, 0, 'Item010', 10, '2', '', 0, 0, 0, 192, 0, 0, 0, 0, '', '', '2021-10-11 16:20:43', '2021-10-11 16:20:43'),
(1633, 0, 'Item022', 10, '2', '', 0, 0, 0, 204, 0, 0, 0, 0, '', '', '2021-10-11 16:21:29', '2021-10-11 16:21:29'),
(1635, 0, 'LOG180072', 53, '139', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1636, 0, 'Jobs', 1635, '139', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1637, 0, 'Item001', 1635, '139', '', 0, 0, 0, 206, 0, 0, 0, 0, '', '', '2021-10-11 18:22:54', '2021-10-11 18:22:54'),
(1638, 0, 'Item002', 1635, '139', '', 0, 0, 0, 207, 0, 0, 0, 0, '', '', '2021-10-11 18:22:54', '2021-10-11 18:22:54'),
(1639, 0, 'SEO001', 1636, '139', '135', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-11 18:23:52', '2021-10-11 18:23:52'),
(1640, 0, '_in', 1639, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-11 18:23:52', '2021-10-11 18:23:52'),
(1641, 0, '_out', 1639, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-11 18:23:52', '2021-10-11 18:23:52'),
(1642, 0, 'DTP002', 1636, '139', '136', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-11 18:23:53', '2021-10-11 18:23:53'),
(1643, 0, '_in', 1642, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-11 18:23:53', '2021-10-11 18:23:53'),
(1644, 0, '_out', 1642, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-11 18:23:53', '2021-10-11 18:23:53'),
(1645, 0, 'DTC004', 1636, '139', '137', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-11 18:23:53', '2021-10-11 18:23:53'),
(1646, 0, '_in', 1645, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-11 18:23:53', '2021-10-11 18:23:53'),
(1647, 0, '_out', 1645, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-11 18:23:53', '2021-10-11 18:23:53'),
(1648, 0, 'DTP005', 1636, '139', '138', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-11 18:24:26', '2021-10-11 18:24:26'),
(1649, 0, '_in', 1648, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-11 18:24:26', '2021-10-11 18:24:26'),
(1650, 0, '_out', 1648, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-11 18:24:26', '2021-10-11 18:24:26'),
(1651, 0, 'DTC003', 0, '135', '139', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-11 18:30:03', '2021-10-11 18:30:03'),
(1652, 0, '_in', 1651, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-11 18:30:03', '2021-10-11 18:30:03'),
(1653, 0, '_out', 1651, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-11 18:30:03', '2021-10-11 18:30:03'),
(1654, 0, 'SEO006', 1636, '139', '140', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-11 18:30:32', '2021-10-11 18:30:32'),
(1655, 0, '_in', 1654, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-11 18:30:32', '2021-10-11 18:30:32'),
(1656, 0, '_out', 1654, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-11 18:30:32', '2021-10-11 18:30:32'),
(1657, 0, 'Item003', 0, '46', '', 0, 0, 0, 208, 0, 0, 0, 0, '', '', '2021-10-12 15:58:42', '2021-10-12 15:58:42'),
(1658, 0, 'COP003', 218, '46', '141', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-12 15:59:43', '2021-10-12 15:59:43'),
(1659, 0, '_in', 1658, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-12 15:59:43', '2021-10-12 15:59:43'),
(1660, 0, '_out', 1658, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-12 15:59:43', '2021-10-12 15:59:43'),
(1661, 0, 'LOG180073', 8, '140', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1662, 0, 'Jobs', 1661, '140', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1663, 0, 'Item001', 1661, '140', '', 0, 0, 0, 209, 0, 0, 0, 0, '', '', '2021-10-14 10:58:15', '2021-10-14 10:58:15'),
(1664, 0, 'Item002', 1661, '140', '', 0, 0, 0, 210, 0, 0, 0, 0, '', '', '2021-10-14 10:58:15', '2021-10-14 10:58:15'),
(1665, 0, 'COP001', 1662, '140', '142', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-14 10:59:29', '2021-10-14 10:59:29'),
(1666, 0, '_in', 1665, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-14 10:59:29', '2021-10-14 10:59:29'),
(1667, 0, '_out', 1665, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-14 10:59:29', '2021-10-14 10:59:29'),
(1668, 0, 'DTP002', 1662, '140', '143', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-14 11:04:49', '2021-10-14 11:04:49'),
(1669, 0, '_in', 1668, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-14 11:04:49', '2021-10-14 11:04:49'),
(1670, 0, '_out', 1668, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-14 11:04:49', '2021-10-14 11:04:49'),
(1671, 1, '842_Day_wise_Test_Plan_kanhacrm.docx', 1666, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '9.89 KB', '2021-10-14 12:01:14', '2021-10-14 12:01:14'),
(1672, 1, '291_sample-2.csv', 1667, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '99 bytes', '2021-10-14 12:02:32', '2021-10-14 12:02:32'),
(1673, 0, 'LOG180074', 8, '141', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1674, 0, 'Jobs', 1673, '141', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1675, 0, 'Item001', 1673, '141', '', 0, 0, 0, 211, 0, 0, 0, 0, '', '', '2021-10-14 15:20:24', '2021-10-14 15:20:24'),
(1676, 0, 'Item002', 1673, '141', '', 0, 0, 0, 212, 0, 0, 0, 0, '', '', '2021-10-14 15:20:24', '2021-10-14 15:20:24'),
(1677, 0, 'FED001', 1674, '141', '144', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-14 15:21:25', '2021-10-14 15:21:25'),
(1678, 0, '_in', 1677, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-14 15:21:25', '2021-10-14 15:21:25'),
(1679, 0, '_out', 1677, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-14 15:21:25', '2021-10-14 15:21:25'),
(1680, 0, 'DTC002', 1674, '141', '145', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-14 15:25:20', '2021-10-14 15:25:20'),
(1681, 0, '_in', 1680, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-14 15:25:20', '2021-10-14 15:25:20'),
(1682, 0, '_out', 1680, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-14 15:25:20', '2021-10-14 15:25:20'),
(1683, 0, 'LOG180075', 53, '142', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1684, 0, 'Jobs', 1683, '142', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1685, 0, 'Item001', 1683, '142', '', 0, 0, 0, 213, 0, 0, 0, 0, '', '', '2021-10-18 14:37:06', '2021-10-18 14:37:06'),
(1686, 0, 'BAD001', 1684, '142', '146', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-18 14:37:51', '2021-10-18 14:37:51'),
(1687, 0, '_in', 1686, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-18 14:37:51', '2021-10-18 14:37:51'),
(1688, 0, '_out', 1686, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-18 14:37:51', '2021-10-18 14:37:51'),
(1700, 0, 'LOG180076', 53, '143', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1701, 0, 'Jobs', 1700, '143', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1702, 0, 'Item001', 1700, '143', '', 0, 0, 0, 216, 0, 0, 0, 0, '', '', '2021-10-19 15:00:10', '2021-10-19 15:00:10'),
(1703, 0, 'Item002', 1700, '143', '', 0, 0, 0, 217, 0, 0, 0, 0, '', '', '2021-10-19 15:00:10', '2021-10-19 15:00:10'),
(1704, 0, 'FED001', 1701, '143', '150', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-19 15:03:31', '2021-10-19 15:03:31'),
(1705, 0, '_in', 1704, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-19 15:03:31', '2021-10-19 15:03:31'),
(1706, 0, '_out', 1704, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-19 15:03:31', '2021-10-19 15:03:31'),
(1707, 0, 'FED002', 1701, '143', '151', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-19 15:05:16', '2021-10-19 15:05:16'),
(1708, 0, '_in', 1707, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-19 15:05:16', '2021-10-19 15:05:16'),
(1709, 0, '_out', 1707, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-19 15:05:16', '2021-10-19 15:05:16'),
(1710, 1, '483_TMS_Dashboard_Layout_-_24.09.2021_(1).docx', 1705, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '407.15 KB', '2021-10-19 15:15:58', '2021-10-19 15:15:58'),
(1711, 1, '875_DOC_WR30_Qtr02_2021.pdf', 1705, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '79.65 KB', '2021-10-19 15:17:04', '2021-10-19 15:17:04'),
(1712, 1, '853_BLTRENT.LLC__E-+IG287679.301.excel.xlsx', 1705, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '325.28 KB', '2021-10-19 15:17:04', '2021-10-19 15:17:04'),
(1713, 1, '477_import_probing_sheet_(6).xlsx', 1706, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '5.23 KB', '2021-10-19 15:18:24', '2021-10-19 15:18:24'),
(1714, 1, '833_import_probing_sheet_(5).xlsx', 1706, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '17.25 KB', '2021-10-19 15:18:24', '2021-10-19 15:18:24'),
(1715, 1, '441_import_probing_sheet_(4).xlsx', 1706, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '17.25 KB', '2021-10-19 15:18:24', '2021-10-19 15:18:24'),
(1716, 0, 'LOG180077', 53, '144', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1717, 0, 'Jobs', 1716, '144', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1718, 0, 'Item001', 1716, '144', '', 0, 0, 0, 218, 0, 0, 0, 0, '', '', '2021-10-19 15:41:07', '2021-10-19 15:41:07'),
(1719, 0, 'FED001', 1717, '144', '152', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-19 15:41:48', '2021-10-19 15:41:48'),
(1720, 0, '_in', 1719, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-19 15:41:48', '2021-10-19 15:41:48'),
(1721, 0, '_out', 1719, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-19 15:41:48', '2021-10-19 15:41:48'),
(1722, 1, '316_import_probing_sheet_(6).xlsx', 1720, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '5.23 KB', '2021-10-19 16:50:29', '2021-10-19 16:50:29'),
(1723, 1, '444_newimportprobing-multi-sample.xlsx', 1720, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '9.20 KB', '2021-10-19 16:50:29', '2021-10-19 16:50:29'),
(1724, 1, '99_import_probing_sheet_(5).xlsx', 1720, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '17.25 KB', '2021-10-19 16:50:29', '2021-10-19 16:50:29'),
(1725, 1, '703_BLTR_ENT_LLC__-_EIG287679301__5__1183.xlsx', 1720, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '274.28 KB', '2021-10-19 16:50:29', '2021-10-19 16:50:29'),
(1726, 1, '382_DONE_POINTS.TXT', 1721, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'TXT', '8.09 KB', '2021-10-19 16:51:10', '2021-10-19 16:51:10'),
(1727, 1, '439_darshan_testdone_points.txt', 1721, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'txt', '2.28 KB', '2021-10-19 16:51:10', '2021-10-19 16:51:10'),
(1728, 1, '505_newcsv_1708.1', 1721, '', '', 0, 0, 0, 0, 0, 0, 0, 1, '1', '79 bytes', '2021-10-19 16:51:10', '2021-10-19 16:51:10'),
(1729, 1, '247_THE_BARN_INC_EIG234898502.zip', 1721, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'zip', '1.17 MB', '2021-10-19 16:51:10', '2021-10-19 16:51:10'),
(1730, 0, 'LOG180078', 8, '145', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1731, 0, 'Jobs', 1730, '145', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1732, 0, 'Item001', 1730, '145', '', 0, 0, 0, 219, 0, 0, 0, 0, '', '', '2021-10-19 16:59:30', '2021-10-19 16:59:30'),
(1733, 0, 'Item002', 1730, '145', '', 0, 0, 0, 220, 0, 0, 0, 0, '', '', '2021-10-19 16:59:30', '2021-10-19 16:59:30'),
(1734, 0, 'SEO001', 1731, '145', '153', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-19 17:00:19', '2021-10-19 17:00:19'),
(1735, 0, '_in', 1734, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-19 17:00:19', '2021-10-19 17:00:19'),
(1736, 0, '_out', 1734, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-19 17:00:19', '2021-10-19 17:00:19'),
(1737, 0, 'SEO002', 1731, '145', '154', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-19 17:00:49', '2021-10-19 17:00:49'),
(1738, 0, '_in', 1737, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-19 17:00:49', '2021-10-19 17:00:49'),
(1739, 0, '_out', 1737, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-19 17:00:49', '2021-10-19 17:00:49'),
(1740, 0, 'Item003', 1730, '145', '', 0, 0, 0, 221, 0, 0, 0, 0, '', '', '2021-10-19 17:12:44', '2021-10-19 17:12:44'),
(1741, 0, 'SEO003', 1731, '145', '155', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-19 17:13:55', '2021-10-19 17:13:55'),
(1742, 0, '_in', 1741, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-19 17:13:55', '2021-10-19 17:13:55'),
(1743, 0, '_out', 1741, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-19 17:13:55', '2021-10-19 17:13:55'),
(1744, 0, 'Item004', 1730, '145', '', 0, 0, 0, 222, 0, 0, 0, 0, '', '', '2021-10-19 17:21:05', '2021-10-19 17:21:05'),
(1745, 0, 'SEO004', 1731, '145', '156', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-19 17:21:36', '2021-10-19 17:21:36'),
(1746, 0, '_in', 1745, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-19 17:21:36', '2021-10-19 17:21:36'),
(1747, 0, '_out', 1745, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-19 17:21:36', '2021-10-19 17:21:36'),
(1748, 0, 'LOG180079', 8, '146', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1749, 0, 'Jobs', 1748, '146', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1750, 0, 'Item001', 1748, '146', '', 0, 0, 0, 223, 0, 0, 0, 0, '', '', '2021-10-19 18:34:46', '2021-10-19 18:34:46'),
(1751, 0, 'DTC001', 1749, '146', '157', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-19 18:35:12', '2021-10-19 18:35:12'),
(1752, 0, '_in', 1751, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-19 18:35:12', '2021-10-19 18:35:12'),
(1753, 0, '_out', 1751, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-19 18:35:12', '2021-10-19 18:35:12'),
(1754, 0, 'BAD001', 0, '99', '158', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-19 20:12:07', '2021-10-19 20:12:07'),
(1755, 0, '_in', 1754, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-19 20:12:07', '2021-10-19 20:12:07'),
(1756, 0, '_out', 1754, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-19 20:12:07', '2021-10-19 20:12:07'),
(1757, 0, 'COP003', 1296, '113', '159', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-19 20:12:31', '2021-10-19 20:12:31'),
(1758, 0, '_in', 1757, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-19 20:12:31', '2021-10-19 20:12:31'),
(1759, 0, '_out', 1757, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-19 20:12:31', '2021-10-19 20:12:31'),
(1760, 0, 'LOG180080', 8, '147', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1761, 0, 'Jobs', 1760, '147', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1762, 0, 'Item001', 1760, '147', '', 0, 0, 0, 224, 0, 0, 0, 0, '', '', '2021-10-20 10:46:28', '2021-10-20 10:46:28'),
(1763, 0, 'Item002', 1760, '147', '', 0, 0, 0, 225, 0, 0, 0, 0, '', '', '2021-10-20 10:46:28', '2021-10-20 10:46:28'),
(1764, 0, 'TEST001', 1761, '147', '160', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-20 10:48:39', '2021-10-20 10:48:39'),
(1765, 0, '_in', 1764, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-20 10:48:39', '2021-10-20 10:48:39'),
(1766, 0, '_out', 1764, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-20 10:48:39', '2021-10-20 10:48:39'),
(1767, 0, 'SEO002', 1761, '147', '161', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-20 10:49:23', '2021-10-20 10:49:23'),
(1768, 0, '_in', 1767, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-20 10:49:23', '2021-10-20 10:49:23'),
(1769, 0, '_out', 1767, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-20 10:49:23', '2021-10-20 10:49:23'),
(1770, 1, '502_TMS_Dashboard_Layout_-_24.09.2021_(1).docx', 1768, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'docx', '407.15 KB', '2021-10-20 10:58:30', '2021-10-20 10:58:30'),
(1771, 1, '752_CHARTWELL_OPERATIONS_34.5646.6.pdf', 1769, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '12.97 KB', '2021-10-20 10:58:54', '2021-10-20 10:58:54'),
(1772, 1, '629_gsync_MANFREDI_CHEVROLET,_LLC.pdf', 1769, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '18.52 KB', '2021-10-20 10:58:54', '2021-10-20 10:58:54'),
(1773, 1, '765_gsync_GRIMM_ALES_LLC.pdf', 1769, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '15.37 KB', '2021-10-20 10:58:54', '2021-10-20 10:58:54'),
(1774, 2, '912_newfile.csv', 1752, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '79 bytes', '2021-10-20 11:37:34', '2021-10-20 11:37:34'),
(1775, 2, '82_sample-comma.csv', 1753, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '66 bytes', '2021-10-20 11:42:43', '2021-10-20 11:42:43'),
(1776, 2, '965_newfile.csv', 1753, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '79 bytes', '2021-10-20 11:42:43', '2021-10-20 11:42:43'),
(1777, 2, '825_newcsv.csv', 1753, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '79 bytes', '2021-10-20 11:42:43', '2021-10-20 11:42:43'),
(1778, 0, 'Item003', 1760, '147', '', 0, 0, 0, 226, 0, 0, 0, 0, '', '', '2021-10-20 14:26:20', '2021-10-20 14:26:20'),
(1779, 0, 'FED003', 1761, '147', '162', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-20 14:29:08', '2021-10-20 14:29:08');
INSERT INTO `tms_filemanager` (`fmanager_id`, `role_id`, `name`, `parent_id`, `order_id`, `job_id`, `client_id`, `in_client_id`, `user_id`, `item_id`, `is_default_folder`, `is_project_folder`, `is_ex_project_folder`, `f_id`, `ext`, `size`, `created_date`, `updated_date`) VALUES
(1780, 0, '_in', 1779, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-20 14:29:08', '2021-10-20 14:29:08'),
(1781, 0, '_out', 1779, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-20 14:29:08', '2021-10-20 14:29:08'),
(1783, 0, 'Item005', 1760, '147', '', 0, 0, 0, 228, 0, 0, 0, 0, '', '', '2021-10-20 14:42:27', '2021-10-20 14:42:27'),
(1784, 0, 'BAD004', 1761, '147', '163', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-22 14:04:27', '2021-10-22 14:04:27'),
(1785, 0, '_in', 1784, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-22 14:04:27', '2021-10-22 14:04:27'),
(1786, 0, '_out', 1784, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-10-22 14:04:27', '2021-10-22 14:04:27'),
(1787, 0, 'LOG180081', 8, '148', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1788, 0, 'Jobs', 1787, '148', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1789, 0, 'Item001', 1787, '148', '', 0, 0, 0, 229, 0, 0, 0, 0, '', '', '2021-11-10 11:28:42', '2021-11-10 11:28:42'),
(1790, 0, 'Item002', 1787, '148', '', 0, 0, 0, 230, 0, 0, 0, 0, '', '', '2021-11-10 11:28:42', '2021-11-10 11:28:42'),
(1793, 0, 'COP001', 1788, '148', '164', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-11-10 11:32:19', '2021-11-10 11:32:19'),
(1794, 0, '_in', 1793, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-11-10 11:32:19', '2021-11-10 11:32:19'),
(1795, 0, '_out', 1793, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-11-10 11:32:19', '2021-11-10 11:32:19'),
(1796, 0, 'DTP002', 1788, '148', '165', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-11-10 11:35:11', '2021-11-10 11:35:11'),
(1797, 0, '_in', 1796, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-11-10 11:35:11', '2021-11-10 11:35:11'),
(1798, 0, '_out', 1796, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-11-10 11:35:11', '2021-11-10 11:35:11'),
(1799, 0, 'LOG180082', 8, '149', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1800, 0, 'Jobs', 1799, '149', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1801, 0, 'Item001', 1799, '149', '', 0, 0, 0, 233, 0, 0, 0, 0, '', '', '2021-11-17 15:26:10', '2021-11-17 15:26:10'),
(1802, 0, 'BAD001', 1800, '149', '166', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-11-17 15:28:22', '2021-11-17 15:28:22'),
(1803, 0, '_in', 1802, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-11-17 15:28:22', '2021-11-17 15:28:22'),
(1804, 0, '_out', 1802, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-11-17 15:28:22', '2021-11-17 15:28:22'),
(1805, 0, 'LOG180083', 8, '151', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1806, 0, 'Jobs', 1805, '151', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1807, 0, 'Item001', 1805, '151', '', 0, 0, 0, 234, 0, 0, 0, 0, '', '', '2021-11-17 17:27:16', '2021-11-17 17:27:16'),
(1808, 0, 'Item002', 1805, '151', '', 0, 0, 0, 235, 0, 0, 0, 0, '', '', '2021-11-17 17:27:16', '2021-11-17 17:27:16'),
(1809, 0, 'DTP001', 1806, '151', '167', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-11-17 17:28:39', '2021-11-17 17:28:39'),
(1810, 0, '_in', 1809, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-11-17 17:28:39', '2021-11-17 17:28:39'),
(1811, 0, '_out', 1809, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-11-17 17:28:39', '2021-11-17 17:28:39'),
(1812, 0, 'FED002', 1806, '151', '168', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-11-17 17:29:22', '2021-11-17 17:29:22'),
(1813, 0, '_in', 1812, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-11-17 17:29:22', '2021-11-17 17:29:22'),
(1814, 0, '_out', 1812, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-11-17 17:29:22', '2021-11-17 17:29:22'),
(1815, 0, 'LOG180084', 8, '152', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1816, 0, 'Jobs', 1815, '152', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1817, 0, 'Item001', 1815, '152', '', 0, 0, 0, 236, 0, 0, 0, 0, '', '', '2021-11-17 18:43:32', '2021-11-17 18:43:32'),
(1818, 0, 'DTP001', 1816, '152', '169', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-11-17 18:44:16', '2021-11-17 18:44:16'),
(1819, 0, '_in', 1818, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-11-17 18:44:16', '2021-11-17 18:44:16'),
(1820, 0, '_out', 1818, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-11-17 18:44:16', '2021-11-17 18:44:16'),
(1821, 0, 'LOG180085', 8, '155', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1822, 0, 'Jobs', 1821, '155', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1823, 0, 'Item001', 1821, '155', '', 0, 0, 0, 237, 0, 0, 0, 0, '', '', '2021-11-18 14:36:11', '2021-11-18 14:36:11'),
(1825, 0, 'DTP001', 1822, '155', '170', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-11-18 14:37:03', '2021-11-18 14:37:03'),
(1826, 0, '_in', 1825, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-11-18 14:37:03', '2021-11-18 14:37:03'),
(1827, 0, '_out', 1825, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-11-18 14:37:03', '2021-11-18 14:37:03'),
(1828, 0, 'LOG180086', 8, '157', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1829, 0, 'Jobs', 1828, '157', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1830, 0, 'Item001', 1828, '157', '', 0, 0, 0, 238, 0, 0, 0, 0, '', '', '2021-12-08 18:59:27', '2021-12-08 18:59:27'),
(1831, 0, 'FED001', 1829, '157', '171', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-12-08 19:00:00', '2021-12-08 19:00:00'),
(1832, 0, '_in', 1831, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-12-08 19:00:00', '2021-12-08 19:00:00'),
(1833, 0, '_out', 1831, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-12-08 19:00:00', '2021-12-08 19:00:00'),
(1834, 0, 'LOG180087', 8, '160', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1835, 0, 'Jobs', 1834, '160', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1836, 0, 'Item001', 1834, '160', '', 0, 0, 0, 239, 0, 0, 0, 0, '', '', '2021-12-14 18:41:12', '2021-12-14 18:41:12'),
(1837, 0, 'SEO001', 1835, '160', '172', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-12-14 18:41:51', '2021-12-14 18:41:51'),
(1838, 0, '_in', 1837, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-12-14 18:41:51', '2021-12-14 18:41:51'),
(1839, 0, '_out', 1837, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-12-14 18:41:51', '2021-12-14 18:41:51'),
(1846, 0, 'LOG180088', 8, '161', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1847, 0, 'Jobs', 1846, '161', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1848, 0, 'Item001', 1846, '161', '', 0, 0, 0, 240, 0, 0, 0, 0, '', '', '2021-12-15 12:08:13', '2021-12-15 12:08:13'),
(1849, 0, 'COP001', 1847, '161', '175', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-12-15 12:08:49', '2021-12-15 12:08:49'),
(1850, 0, '_in', 1849, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-12-15 12:08:49', '2021-12-15 12:08:49'),
(1851, 0, '_out', 1849, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-12-15 12:08:49', '2021-12-15 12:08:49'),
(1852, 0, 'LOG180089', 8, '163', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1853, 0, 'Jobs', 1852, '163', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1854, 0, 'Item001', 1852, '163', '', 0, 0, 0, 241, 0, 0, 0, 0, '', '', '2021-12-15 15:59:46', '2021-12-15 15:59:46'),
(1855, 0, 'BAD001', 1853, '163', '176', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-12-15 16:00:44', '2021-12-15 16:00:44'),
(1856, 0, '_in', 1855, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-12-15 16:00:44', '2021-12-15 16:00:44'),
(1857, 0, '_out', 1855, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2021-12-15 16:00:44', '2021-12-15 16:00:44'),
(1858, 0, 'LOG180090', 8, '165', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1859, 0, 'Jobs', 1858, '165', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1860, 0, 'Item001', 1858, '165', '', 0, 0, 0, 242, 0, 0, 0, 0, '', '', '2022-01-10 16:58:24', '2022-01-10 16:58:24'),
(1861, 0, 'Item002', 1858, '165', '', 0, 0, 0, 243, 0, 0, 0, 0, '', '', '2022-01-10 16:58:24', '2022-01-10 16:58:24'),
(1862, 0, 'Item003', 1858, '165', '', 0, 0, 0, 244, 0, 0, 0, 0, '', '', '2022-01-10 16:58:24', '2022-01-10 16:58:24'),
(1863, 0, 'BAD001', 1859, '165', '177', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-01-10 16:58:59', '2022-01-10 16:58:59'),
(1864, 0, '_in', 1863, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-01-10 16:58:59', '2022-01-10 16:58:59'),
(1865, 0, '_out', 1863, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-01-10 16:58:59', '2022-01-10 16:58:59'),
(1866, 0, 'DTP002', 1859, '165', '178', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-01-10 16:59:31', '2022-01-10 16:59:31'),
(1867, 0, '_in', 1866, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-01-10 16:59:31', '2022-01-10 16:59:31'),
(1868, 0, '_out', 1866, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-01-10 16:59:31', '2022-01-10 16:59:31'),
(1869, 0, 'FED003', 1859, '165', '179', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-01-10 16:59:52', '2022-01-10 16:59:52'),
(1870, 0, '_in', 1869, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-01-10 16:59:52', '2022-01-10 16:59:52'),
(1871, 0, '_out', 1869, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-01-10 16:59:52', '2022-01-10 16:59:52'),
(1872, 2, '73_singer-net.jpg', 19, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '49.32 KB', '2022-02-07 11:41:58', '2022-02-07 11:41:58'),
(1873, 1, 'groupA', 19, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-02-07 11:51:42', '2022-02-07 11:51:42'),
(1874, 1, '897_work.png', 1873, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'png', '16.32 KB', '2022-02-07 11:53:18', '2022-02-07 11:53:18'),
(1875, 2, '634_opportunities_template.xlsx', 1868, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'xlsx', '5.42 KB', '2022-02-11 15:49:52', '2022-02-11 15:49:52'),
(1876, 2, '645_689_youtube.jpg', 1868, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '77.14 KB', '2022-02-11 15:49:52', '2022-02-11 15:49:52'),
(1877, 2, '757_220_target.jpg', 1868, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'jpg', '178.60 KB', '2022-02-11 15:49:52', '2022-02-11 15:49:52'),
(1878, 0, 'LOG180091', 8, '166', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1879, 0, 'Jobs', 1878, '166', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1880, 0, 'Item001', 1878, '166', '', 0, 0, 0, 245, 0, 0, 0, 0, '', '', '2022-02-11 15:55:16', '2022-02-11 15:55:16'),
(1881, 0, 'DTP001', 1879, '166', '180', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-02-11 15:55:43', '2022-02-11 15:55:43'),
(1882, 0, '_in', 1881, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-02-11 15:55:43', '2022-02-11 15:55:43'),
(1883, 0, '_out', 1881, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-02-11 15:55:43', '2022-02-11 15:55:43'),
(1884, 1, '46_csv_(7).csv', 1882, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '102 bytes', '2022-02-11 15:59:31', '2022-02-11 15:59:31'),
(1885, 1, '645_csv_(6).csv', 1882, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'csv', '174 bytes', '2022-02-11 15:59:31', '2022-02-11 15:59:31'),
(1886, 1, '436_gsync_AMICI_FOOD_GROUP_LLC.pdf', 1882, '', '', 0, 0, 0, 0, 0, 0, 0, 1, 'pdf', '16.17 KB', '2022-02-11 15:59:31', '2022-02-11 15:59:31'),
(1887, 0, 'LOG180092', 8, '167', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1888, 0, 'Jobs', 1887, '167', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1889, 0, 'Item001', 1887, '167', '', 0, 0, 0, 246, 0, 0, 0, 0, '', '', '2022-03-21 18:05:40', '2022-03-21 18:05:40'),
(1890, 0, 'SEO001', 1888, '167', '181', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-03-21 18:06:14', '2022-03-21 18:06:14'),
(1891, 0, '_in', 1890, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-03-21 18:06:14', '2022-03-21 18:06:14'),
(1892, 0, '_out', 1890, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-03-21 18:06:14', '2022-03-21 18:06:14'),
(1893, 0, 'DTP002', 1888, '167', '182', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-03-21 18:06:14', '2022-03-21 18:06:14'),
(1894, 0, '_in', 1893, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-03-21 18:06:14', '2022-03-21 18:06:14'),
(1895, 0, '_out', 1893, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-03-21 18:06:14', '2022-03-21 18:06:14'),
(1896, 0, 'DTC004', 1888, '167', '183', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-03-21 18:06:15', '2022-03-21 18:06:15'),
(1897, 0, '_in', 1896, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-03-21 18:06:15', '2022-03-21 18:06:15'),
(1898, 0, '_out', 1896, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-03-21 18:06:15', '2022-03-21 18:06:15'),
(1899, 0, 'LOG180093', 8, '168', '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1900, 0, 'Jobs', 1899, '168', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1901, 0, 'Item001', 1899, '168', '', 0, 0, 0, 247, 0, 0, 0, 0, '', '', '2022-03-28 12:33:46', '2022-03-28 12:33:46'),
(1902, 0, 'BAD001', 1900, '168', '184', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-03-28 12:34:13', '2022-03-28 12:34:13'),
(1903, 0, '_in', 1902, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-03-28 12:34:13', '2022-03-28 12:34:13'),
(1904, 0, '_out', 1902, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '2022-03-28 12:34:13', '2022-03-28 12:34:13'),
(1905, 0, 'external-0006', 0, '', '', 0, 0, 12, 0, 0, 0, 0, 0, '', '', '2022-04-12 16:13:33', '2022-04-12 16:13:33'),
(1906, 0, 'Data', 1905, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1907, 0, 'Projects', 1905, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1908, 0, 'Invoice', 1905, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1909, 0, 'external-0006', 0, '', '', 0, 0, 13, 0, 0, 0, 0, 0, '', '', '2022-04-12 16:16:16', '2022-04-12 16:16:16'),
(1910, 0, 'Data', 1909, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1911, 0, 'Projects', 1909, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1912, 0, 'Invoice', 1909, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1913, 0, 'external-0006', 0, '', '', 0, 0, 14, 0, 0, 0, 0, 0, '', '', '2022-04-12 16:18:14', '2022-04-12 16:18:14'),
(1914, 0, 'Data', 1913, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1915, 0, 'Projects', 1913, '', '', 0, 0, 0, 0, 1, 0, 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1916, 0, 'Invoice', 1913, '', '', 0, 0, 0, 0, 1, 0, 0, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

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
(1, 2, 'LOG180001', '2018-12-12 17:00:00', '', 'proj1', 0, 1, '2021-03-25 10:51', '6,5,17', '', '13', 0, 1, '2018-12-20 17:00:00', 0, 0, '2018-12-12 17:01:08', '2022-04-12 16:39:12'),
(2, 28, 'LOG180002', '2019-01-08 12:28:00', '', 'proj002', 0, 1, '2021-03-02 15:46', '0,3', '', '4', 0, 1, '2019-01-09 12:29:00', 5875.66, 0, '2019-01-08 12:29:24', '2021-06-09 08:59:13'),
(3, 29, 'LOG180003', '2021-02-24 17:52:00', '', 'KAnhapro', 0, 1, '2021-02-26 17:43', '1,6', '', '12', 0, 1, '2021-02-24 17:53:00', 400, 1, '2021-02-24 17:53:43', '2021-06-23 18:50:12'),
(4, 34, 'LOG180004', '2021-03-03 11:36:00', '', 'Project3', 0, 1, '2021-03-04 11:50', '17', '', '12', 0, 0, NULL, 655.4, 0, '2021-03-03 11:37:59', '2021-03-03 11:52:43'),
(5, 35, 'LOG180005', '2021-03-03 11:55:00', '', 'Project5', 0, 1, '2021-03-18 19:21', '17,14,13', '', '13', 0, 1, '2021-03-03 11:56:00', 800.55, 0, '2021-03-03 11:56:53', '2021-06-22 11:29:35'),
(6, 36, 'LOG180006', '2021-03-03 12:49:00', '', 'Project6', 0, 1, '2021-03-03 12:49', '3', '', '4', 0, 0, NULL, 45605, 0, '2021-03-03 12:49:57', '2021-07-19 21:08:51'),
(7, 37, 'LOG180007', '2021-03-03 12:55:00', '', 'Project7', 0, 1, '2021-03-10 12:55', '4', '', '14', 0, 0, NULL, 980, 0, '2021-03-03 12:55:56', '2021-07-16 18:14:35'),
(8, 38, 'LOG180008', '2021-03-03 13:00:00', '', 'Project8', 0, 1, '2021-03-16 13:00', '5', '', '4', 0, 1, '2021-03-03 13:11:00', 750.7, 0, '2021-03-03 13:01:04', '2021-06-22 14:45:19'),
(9, 40, 'LOG180009', '2021-03-03 13:08:00', '', 'Project9', 0, 1, '2021-03-03 13:26', '4,5', '', '15', 0, 0, NULL, 0, 0, '2021-03-03 13:08:56', '2021-10-11 14:34:06'),
(10, 41, 'LOG180010', '2021-03-03 14:35:00', '', 'project10', 0, 1, '2021-03-04 14:39:00', '3', '', '4', 0, 0, NULL, 5646, 0, '2021-03-03 14:36:18', '2021-03-03 14:39:47'),
(11, 42, 'LOG180011', '2021-04-15 19:42:00', '', 'Ingvild\'s Test Project', 0, 1, '2021-04-15 19:42:00', '0', '', '4', NULL, NULL, NULL, 500, 0, '2021-04-15 23:17:03', '2021-04-15 23:17:03'),
(12, 44, 'LOG180012', '2021-05-10 09:06:00', '', 'Ingvild\'s Test Project 2', 0, 1, '2021-05-10 00:00', '1', '', '4', 0, 0, NULL, 500, 0, '2021-05-10 12:40:30', '2021-05-10 12:42:12'),
(13, 46, 'LOG180013', '2021-06-02 15:46:00', '', 'Ingvild\'s Test Project 02.06.2021', 0, 1, '2021-06-09 15:00', '1', '', '4', 0, 0, NULL, 0, 0, '2021-06-02 19:19:06', '2021-06-23 17:26:15'),
(14, 49, 'LOG180014', '2021-06-04 15:59:00', '', 'TEST321', 0, 1, '2021-06-07 00:00:00', '1,3,5', '', '4', NULL, NULL, NULL, 500000, 0, '2021-06-04 16:06:14', '2021-06-04 16:06:14'),
(15, 51, 'LOG180015', '2021-06-04 17:37:00', '', 'Testscoop', 0, 1, '2020-01-01 00:00:00', '3,5', '', '4', NULL, NULL, NULL, 1000, 0, '2021-06-04 17:38:17', '2021-06-04 17:38:17'),
(16, 54, 'LOG180016', '2021-06-21 17:15:00', '', 'ABC', 0, 1, '2021-06-21 17:16', '2,4', '', '4', 0, 1, '2021-07-12 21:25:00', 0, 0, '2021-06-21 17:16:40', '2021-09-20 19:19:53'),
(17, 55, 'LOG180017', '2021-06-22 11:43:00', '', 'KAnhaprooo', 0, 1, '2021-06-24 11:44', '1', '', '4', 0, 0, NULL, 6000, 0, '2021-06-22 11:44:22', '2021-06-22 14:29:13'),
(18, 56, 'LOG180018', '2021-06-29 10:33:00', '', 'Ingvild\'s Test Project 29.06.2021', 0, 1, '2021-06-30 15:00', '0', '', '4', NULL, NULL, NULL, 0, 0, '2021-06-29 14:03:54', '2021-06-29 14:03:54'),
(19, 57, 'LOG180019', '2021-06-29 15:47:00', '', 'log55', 0, 1, '2021-06-02 15:48', '1', '', '4', 0, 0, NULL, 2131310, 0, '2021-06-29 15:48:23', '2021-07-02 19:28:28'),
(20, 58, 'LOG180020', '2021-07-05 10:37:00', '', 'Newtestpro', 0, 1, '2021-07-08 10:39', '2', '', '4', NULL, NULL, NULL, 50000, 0, '2021-07-05 10:39:27', '2021-07-05 10:39:27'),
(21, 59, 'LOG180021', '2021-07-06 09:42:00', '', 'Test0604', 0, 1, '2021-07-08 09:47', '4,6,8', '', '4', 0, 0, NULL, 0, 0, '2021-07-06 09:47:53', '2021-08-09 10:32:02'),
(22, 60, 'LOG180022', '2021-07-06 12:33:00', '', 'ABC', 0, 1, '2021-07-15 15:00', '3,4', '', '4', 0, 0, NULL, 0, 0, '2021-07-06 12:36:38', '2021-08-09 16:48:32'),
(23, 61, 'LOG180023', '2021-07-06 12:54:00', '', 'from vijay', 0, 3, '2021-07-09 12:55', '3,6', '', '4', 0, 1, '2021-07-06 12:54:00', 0, 0, '2021-07-06 12:55:55', '2021-09-20 19:17:59'),
(24, 62, 'LOG180024', '2021-07-06 18:17:00', '', 'ABC', 0, 1, '2021-07-08 18:20', '2,3', '', '4', 0, 0, NULL, 800, 0, '2021-07-06 18:20:52', '2021-07-06 20:32:05'),
(25, 63, 'LOG180025', '2021-07-12 21:25:00', '', 'Abc', 0, 1, '2021-07-15 21:26', '1,2', '', '4', 0, 1, '2021-07-12 21:25:00', 0, 0, '2021-07-12 21:26:58', '2021-09-20 19:19:03'),
(26, 64, 'LOG180026', '2021-07-13 20:39:00', '', 'PRO0987', 0, 1, '2021-07-24 20:41', '5,7', '', '4', NULL, NULL, NULL, 8, 0, '2021-07-13 20:41:23', '2021-07-13 20:41:23'),
(27, 65, 'LOG180027', '2021-07-14 10:24:00', '', 'Jimitest1406', 0, 1, '2021-07-14 10:28', '1,2', '', '4', NULL, NULL, NULL, 9000, 0, '2021-07-14 10:28:28', '2021-07-14 10:28:28'),
(28, 66, 'LOG180028', '2021-07-15 12:18:00', '', 'Pro432', 0, 1, '2021-07-24 12:20', '5,8,10,19,15', '', '4', 0, 0, NULL, 9000, 0, '2021-07-15 12:21:05', '2021-07-19 19:52:25'),
(29, 67, 'LOG180029', '2021-07-15 13:07:00', '', 'TRIO', 0, 1, '2021-07-16 13:09', '6,4', '', '4', NULL, NULL, NULL, 100, 0, '2021-07-15 13:09:33', '2021-07-15 13:09:33'),
(30, 68, 'LOG180030', '2021-07-19 09:27:00', '', 'Test432', 0, 1, '2021-07-24 09:28', '3,5,2', '', '4', NULL, NULL, NULL, 8000, 0, '2021-07-19 09:29:14', '2021-07-19 09:29:14'),
(31, 69, 'LOG180031', '2021-07-22 10:22:00', '', 'Ingvild\'s Test Project 22.07.2021', 0, 1, '2021-07-21 15:00', '0', '', '4', NULL, NULL, NULL, 0, 0, '2021-07-22 13:55:12', '2021-07-22 13:55:12'),
(32, 70, 'LOG180032', '2021-07-22 16:56:00', '', 'proewfwf', 0, 1, '2021-07-22 16:57', '3,2', '', '4', NULL, NULL, NULL, 700, 0, '2021-07-22 16:57:27', '2021-07-22 16:57:27'),
(33, 71, 'LOG180033', '2021-07-22 17:03:00', '', 'abc', 0, 1, '2021-07-22 17:05', '4', '', '4', NULL, NULL, NULL, 50, 0, '2021-07-22 17:05:16', '2021-07-22 17:05:16'),
(34, 72, 'LOG180034', '2021-07-22 18:09:00', '', 'PT5', 0, 1, '2021-07-22 18:09', '1', '', '4', NULL, NULL, NULL, 800, 0, '2021-07-22 18:09:44', '2021-07-22 18:09:44'),
(35, 73, 'LOG180035', '2021-07-27 11:12:00', '', 'ABC', 0, 1, '2021-07-30 11:13', '3,2', '', '4', 0, 0, NULL, 0, 0, '2021-07-27 11:13:30', '2021-07-29 17:27:17'),
(36, 74, 'LOG180036', '2021-07-29 16:27:00', '', 'Test2907', 0, 1, '2021-07-31 16:29', '2,4', '', '4', 0, 1, '2021-09-25 11:35:00', 0, 0, '2021-07-29 16:29:32', '2021-09-21 11:35:13'),
(37, 75, 'LOG180037', '2021-07-29 18:47:00', '', 'Project43', 0, 1, '2021-07-29 18:48', '2', '', '4', NULL, NULL, NULL, 0, 0, '2021-07-29 18:48:34', '2021-07-29 18:48:34'),
(38, 76, 'LOG180038', '2021-07-29 18:56:00', '', 'Data translate', 0, 1, '2021-07-29 19:00', '6,3', '', '4', NULL, NULL, NULL, 0, 0, '2021-07-29 19:00:17', '2021-07-29 19:00:17'),
(39, 77, 'LOG180039', '2021-07-29 19:34:00', '', 'vcare', 0, 1, '2021-07-29 19:36', '7,6', '', '4', NULL, NULL, NULL, 0, 0, '2021-07-29 19:36:48', '2021-07-29 19:36:48'),
(40, 79, 'LOG180040', '2021-07-30 09:29:00', '', 'Test43', 0, 1, '2021-07-09 09:30', '2,4', '', '4', NULL, NULL, NULL, 0, 0, '2021-07-30 09:30:49', '2021-07-30 09:30:49'),
(41, 80, 'LOG180041', '2021-07-30 11:07:00', '', 'Proj11 gen case', 0, 1, '2021-07-30 11:08', '5,6', '', '4', NULL, NULL, NULL, 0, 0, '2021-07-30 11:09:07', '2021-07-30 11:09:07'),
(42, 81, 'LOG180042', '2021-07-30 11:26:00', '', 'proj30 1127', 0, 1, '2021-07-30 11:27', '6', '', '4', NULL, NULL, NULL, 0, 0, '2021-07-30 11:27:40', '2021-07-30 11:27:40'),
(43, 82, 'LOG180043', '2021-07-30 12:32:00', '', 'Proj thu1233', 0, 1, '2021-07-30 12:33', '2,7', '', '4', NULL, NULL, NULL, 0, 0, '2021-07-30 12:33:52', '2021-07-30 12:33:52'),
(44, 83, 'LOG180044', '2021-07-30 12:34:00', '', 'Proj Thu 1238', 0, 1, '2021-07-30 12:38', '5', '', '4', NULL, NULL, NULL, 0, 0, '2021-07-30 12:38:56', '2021-07-30 12:38:56'),
(45, 84, 'LOG180045', '2021-07-30 12:53:00', '', 'Proj Translate thu1255', 0, 1, '2021-07-30 12:56', '21,17', '', '4', NULL, NULL, NULL, 0, 0, '2021-07-30 12:56:27', '2021-07-30 12:56:27'),
(46, 86, 'LOG180046', '2021-07-30 13:37:00', '', 'ABC', 0, 1, '2021-06-30 13:39', '2,5', '', '4', 0, 0, NULL, 0, 0, '2021-07-30 13:39:37', '2021-08-02 19:00:57'),
(47, 87, 'LOG180047', '2021-08-09 01:08:00', '', 'testtrio0908', 0, 1, '2021-08-09 01:09', '5', '', '4', NULL, NULL, NULL, 0, 0, '2021-08-09 10:39:15', '2021-08-09 10:39:15'),
(48, 88, 'LOG180048', '2021-08-09 01:16:00', '', 'IO', 0, 1, '2021-08-09 01:17', '3,4', '', '4', 0, 0, NULL, 0, 0, '2021-08-09 10:47:27', '2021-09-15 11:12:27'),
(49, 100, 'LOG180049', '2021-08-27 10:26:00', '', 'Test2708', 0, 1, '2021-08-02 10:27', '2', '', '4', NULL, NULL, NULL, 0, 0, '2021-08-27 10:30:33', '2021-08-27 10:30:33'),
(50, 102, 'LOG180050', '2021-09-02 17:32:00', '', 'Test123', 0, 1, '2021-09-15 17:40', '0,2', '', '4', 0, 0, NULL, 0, 0, '2021-09-02 17:33:31', '2021-09-15 10:14:54'),
(51, 103, 'LOG180051', '2021-09-06 11:09:00', '', 'Test432', 0, 1, '2021-09-09 11:16', '2,4,6', '', '4', 0, 0, NULL, 0, 0, '2021-09-06 11:16:59', '2021-09-06 12:14:47'),
(52, 107, 'LOG180052', '2021-09-08 09:52:00', '', 'Ingvild\'s Test Project', 0, 1, '2021-09-08 12:14', '0', '', '4', 0, 0, NULL, 0, 0, '2021-09-08 13:43:22', '2021-09-13 10:28:03'),
(53, 111, 'LOG180053', '2021-09-13 09:34:00', '', 'PR123', 0, 1, '2021-09-13 09:41', '1,2,0', '', '4', NULL, NULL, NULL, 0, 0, '2021-09-13 09:41:17', '2021-09-13 09:41:17'),
(54, 113, 'LOG180054', '2021-09-15 10:44:00', '', 'ABC', 0, 1, '2021-09-01 10:45', '1,3', '', '4', NULL, NULL, NULL, 0, 0, '2021-09-15 10:46:11', '2021-09-15 10:46:11'),
(55, 114, 'LOG180055', '2021-09-16 16:33:00', '', 'Test1609', 0, 1, '2021-09-17 06:00', '5,7,4,2,1', '', '4', 0, 0, NULL, 0, 0, '2021-09-16 16:34:38', '2021-09-17 20:11:57'),
(56, 115, 'LOG180056', '2021-09-17 10:23:00', '', 'Test 1709', 0, 1, '2021-09-24 10:24', '1,2,4,5', '', '4', 0, 1, '0000-00-00 00:00:00', 0, 0, '2021-09-17 10:24:30', '2021-09-20 18:46:23'),
(57, 117, 'LOG180057', '2021-09-17 16:26:00', '', 'Test 1709', 0, 1, '2021-09-20 06:30', '2,7,17,15', '', '4', 0, 0, NULL, 0, 0, '2021-09-17 16:27:19', '2021-09-20 10:36:13'),
(58, 119, 'LOG180058', '2021-09-20 10:40:00', '', 'Test 2009', 0, 1, '2021-09-22 11:00', '3,5,4', '', '4', 0, 0, NULL, 0, 0, '2021-09-20 10:43:13', '2021-09-20 18:04:03'),
(59, 120, 'LOG180059', '2021-09-20 10:49:00', '', 'testttt', 0, 1, '2021-09-25 13:00', '2', '', '4', 0, 1, '0000-00-00 00:00:00', 0, 0, '2021-09-20 10:49:41', '2021-09-20 18:32:33'),
(60, 123, 'LOG180060', '2021-09-20 18:27:00', '', 'test2009', 0, 1, '2021-09-20 18:49', '2,6,4', '', '4', NULL, 1, '0000-00-00 00:00:00', 0, 0, '2021-09-20 18:28:31', '2021-09-20 18:28:31'),
(61, 124, 'LOG180061', '2021-09-20 18:48:00', '', 'Test 1709', 0, 1, '2021-09-26 18:48', '2,1,5,7', '', '4', 0, 1, '0000-00-00 00:00:00', 0, 0, '2021-09-20 18:48:32', '2021-09-20 18:49:58'),
(62, 125, 'LOG180062', '2021-09-20 18:51:00', '', 'Test 1709', 0, 1, '2021-09-20 18:51', '1,3,17', '', '4', 0, 1, '0000-00-00 00:00:00', 0, 0, '2021-09-20 18:51:50', '2021-11-18 11:44:05'),
(63, 126, 'LOG180063', '2021-09-20 18:59:00', '', 'New sso', 0, 1, '2021-09-20 19:00', '4,3', '', '4', NULL, NULL, NULL, 0, 0, '2021-09-20 19:00:26', '2021-09-20 19:00:26'),
(64, 127, 'LOG180064', '2021-09-20 19:15:00', '', 'tedt5443', 0, 1, '2021-09-20 19:15', '5', '', '4', 0, 1, '0000-00-00 00:00:00', 0, 0, '2021-09-20 19:15:23', '2021-09-20 19:16:47'),
(65, 128, 'LOG180065', '2021-09-21 11:11:00', '', 'New sso Vcare', 0, 1, '2021-09-21 11:11', '7,3', '', '4', NULL, 1, '2021-09-22 11:11:00', 0, 0, '2021-09-21 11:11:51', '2021-09-21 11:11:51'),
(66, 130, 'LOG180066', '2021-09-23 18:12:00', '', 'Test 1709', 0, 1, '2021-09-23 18:13', '4,6,3', '', '4', 0, 0, NULL, 0, 0, '2021-09-23 18:13:04', '2021-10-07 14:18:35'),
(67, 131, 'LOG180067', '2021-09-24 10:26:00', '', 'Test 1709', 0, 1, '2021-09-27 12:30', '1,3,5,6', '', '4', NULL, NULL, NULL, 0, 0, '2021-09-24 10:26:56', '2021-09-24 10:26:56'),
(68, 135, 'LOG180068', '2021-10-01 11:32:00', '', 'Test 0110', 0, 1, '2021-10-02 11:33', '2,5,7', '', '4', NULL, NULL, NULL, 0, 0, '2021-10-01 11:33:46', '2021-10-01 11:33:46'),
(69, 136, 'LOG180069', '2021-10-07 15:18:00', '', 'Test0710', 0, 1, '2021-10-07 15:19', '2,4', '', '4', NULL, NULL, NULL, 0, 0, '2021-10-07 15:19:39', '2021-10-07 15:19:39'),
(70, 137, 'LOG180070', '2021-10-07 18:16:00', '', 'Test180070', 0, 1, '2021-10-07 18:18', '2,4', '', '4', NULL, NULL, NULL, 0, 0, '2021-10-07 18:18:10', '2021-10-07 18:18:10'),
(71, 138, 'LOG180071', '2021-10-08 10:32:00', '', 'Worls glass doors', 0, 1, '2021-10-08 18:33', '2,8', '', '4', NULL, NULL, NULL, 0, 0, '2021-10-08 10:33:09', '2021-10-08 10:33:09'),
(72, 139, 'LOG180072', '2021-10-11 18:21:00', '', 'Test 0110', 0, 1, '2021-10-11 18:22', '2', '', '4', NULL, NULL, NULL, 0, 0, '2021-10-11 18:22:43', '2021-10-11 18:22:43'),
(73, 140, 'LOG180073', '2021-10-14 10:55:00', '', 'Test123', 0, 1, '2021-10-14 10:58', '2', '', '4', NULL, NULL, NULL, 0, 0, '2021-10-14 10:58:05', '2021-10-14 10:58:05'),
(74, 141, 'LOG180074', '2021-10-14 15:01:00', '', 'Prt', 0, 1, '2021-10-14 15:20', '2,4', '', '4', NULL, NULL, NULL, 0, 0, '2021-10-14 15:20:14', '2021-10-14 15:20:14'),
(75, 142, 'LOG180075', '2021-10-18 14:34:00', '', 'test2009', 0, 1, '2021-10-18 14:36', '1', '', '4', NULL, NULL, NULL, 0, 0, '2021-10-18 14:36:59', '2021-10-18 14:36:59'),
(76, 143, 'LOG180076', '2021-10-19 14:58:00', '', 'Test 1910', 0, 1, '2021-10-19 14:59', '2', '', '4', NULL, NULL, NULL, 0, 0, '2021-10-19 14:59:57', '2021-10-19 14:59:57'),
(77, 144, 'LOG180077', '2021-10-19 15:39:00', '', 'test', 0, 1, '2021-10-19 15:40', '2', '', '4', NULL, NULL, NULL, 0, 0, '2021-10-19 15:41:00', '2021-10-19 15:41:00'),
(78, 145, 'LOG180078', '2021-10-19 16:52:00', '', 'test19910', 0, 1, '2021-10-19 16:58', '5', '', '4', 0, 0, NULL, 0, 0, '2021-10-19 16:58:49', '2021-11-17 16:06:06'),
(79, 146, 'LOG180079', '2021-10-19 18:34:00', '', 'test', 0, 1, '2021-10-19 18:34', '2', '', '4', NULL, NULL, NULL, 0, 0, '2021-10-19 18:34:35', '2021-10-19 18:34:35'),
(80, 147, 'LOG180080', '2021-10-20 10:45:00', '', 'test2009', 0, 1, '2021-10-20 10:46', '1,3,17', '', '4', 0, 0, NULL, 0, 0, '2021-10-20 10:46:21', '2021-11-18 11:02:36'),
(81, 148, 'LOG180081', '2021-11-10 11:27:00', '', 'Test1011', 0, 1, '2021-11-11 11:28', '2', '', '4', NULL, NULL, NULL, 0, 0, '2021-11-10 11:28:34', '2021-11-10 11:28:34'),
(82, 149, 'LOG180082', '2021-11-17 15:23:00', '', 'Test1711', 0, 1, '2021-11-17 15:26', '13', '', '4', 0, 0, NULL, 0, 0, '2021-11-17 15:26:05', '2021-11-17 15:33:19'),
(83, 151, 'LOG180083', '2021-11-17 17:25:00', '', 'test1611', 0, 1, '2021-11-17 17:27', '13,17', '', '4', 0, 0, NULL, 0, 0, '2021-11-17 17:27:08', '2021-11-17 18:21:09'),
(84, 152, 'LOG180084', '2021-11-17 05:07:00', '', 'Test1511', 0, 1, '2021-11-17 05:13', '13,17', '', '4', 0, 0, NULL, 0, 0, '2021-11-17 18:43:22', '2021-11-17 18:45:46'),
(85, 155, 'LOG180085', '2021-11-18 14:35:00', '', 'test', 0, 1, '2021-11-18 14:36', '17,0,3,5', '', '4', NULL, NULL, NULL, 0, 0, '2021-11-18 14:36:06', '2021-11-18 14:36:06'),
(86, 157, 'LOG180086', '2021-12-08 00:00:00', '', 'Resource Vijay', 0, 1, '2021-12-15 19:00', '1', '', '4', 0, 0, NULL, 0, 0, '2021-12-08 18:59:20', '2021-12-15 16:33:37'),
(87, 160, 'LOG180087', '2021-12-14 18:40:00', '', 'Test1412', 0, 1, '2021-12-14 18:40', '0', '', '4', 0, 0, NULL, 0, 0, '2021-12-14 18:40:39', '2021-12-15 12:00:26'),
(88, 161, 'LOG180088', '2021-12-15 12:06:00', '', 'Test1512', 0, 1, '2021-12-15 12:06', '2,17', '', '4', 0, 0, NULL, 0, 0, '2021-12-15 12:08:06', '2021-12-15 13:11:54'),
(89, 163, 'LOG180089', '2021-12-15 15:59:00', '', 'test', 0, 3, '2021-12-15 15:59', '17', '', '4', NULL, NULL, NULL, 0, 0, '2021-12-15 15:59:26', '2021-12-15 15:59:26'),
(90, 165, 'LOG180090', '2022-01-10 16:57:00', '', 'Test1001', 0, 1, '2022-01-15 16:58', '17', '', '4', 0, 0, NULL, 0, 0, '2022-01-10 16:58:16', '2022-01-10 17:24:20'),
(91, 166, 'LOG180091', '2022-02-11 15:51:00', '', 'test', 0, 1, '2022-02-11 15:54', '1', '', '4', NULL, NULL, NULL, 0, 0, '2022-02-11 15:54:05', '2022-02-11 15:54:05'),
(92, 167, 'LOG180092', '2022-03-21 18:05:00', '', 'Test2103', 0, 1, '2022-03-21 18:05', '0', '', '4', NULL, NULL, NULL, 0, 0, '2022-03-21 18:05:35', '2022-03-21 18:05:35'),
(93, 168, 'LOG180093', '2022-03-28 12:32:00', '', 'Test2803', 0, 1, '2022-03-29 12:33', '1', '', '4', NULL, NULL, NULL, 0, 0, '2022-03-28 12:33:41', '2022-03-28 12:33:41');

-- --------------------------------------------------------

--
-- Table structure for table `tms_invoice`
--

CREATE TABLE `tms_invoice` (
  `invoice_id` int(11) NOT NULL,
  `invoice_number` varchar(255) NOT NULL,
  `freelance_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `job_id` varchar(255) NOT NULL,
  `vat` varchar(255) NOT NULL,
  `value_date` datetime NOT NULL,
  `invoice_date` datetime NOT NULL,
  `payment_date` datetime NOT NULL,
  `paid_date` datetime NOT NULL,
  `payment_type` enum('Bank','Paypal') NOT NULL,
  `paid_amount` decimal(10,2) NOT NULL,
  `Invoice_cost` decimal(10,2) NOT NULL,
  `invoice_type` varchar(255) NOT NULL,
  `invoice_status` varchar(255) NOT NULL DEFAULT 'Open',
  `is_approved` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1 - Approved, 0 - UnApproved',
  `reminder_sent` tinyint(2) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_invoice`
--

INSERT INTO `tms_invoice` (`invoice_id`, `invoice_number`, `freelance_id`, `customer_id`, `job_id`, `vat`, `value_date`, `invoice_date`, `payment_date`, `paid_date`, `payment_type`, `paid_amount`, `Invoice_cost`, `invoice_type`, `invoice_status`, `is_approved`, `reminder_sent`, `created_date`, `modified_date`) VALUES
(1, 'LOG180001_BAD_001', 2, 1, '[{\"id\":1}]', '', '2018-12-21 00:00:00', '2018-12-21 00:00:00', '0000-00-00 00:00:00', '2018-12-21 00:00:00', '', '336.42', '336.42', 'save', 'Paid', 1, 0, '2018-12-21 00:00:00', '2022-03-24 00:00:00'),
(2, 'LOG180092_SEO_002', 2, 1, '[{\"id\":181}]', '', '2022-03-21 00:00:00', '2022-03-21 00:00:00', '0000-00-00 00:00:00', '2022-03-21 00:00:00', '', '2005.00', '2005.00', 'save', 'Cancel', 1, 1, '2022-01-21 00:00:00', '2022-03-29 00:00:00'),
(3, 'LOG180092_DTP_003', 2, 1, '[{\"id\":182}]', '', '2022-03-22 00:00:00', '2022-03-22 00:00:00', '0000-00-00 00:00:00', '2022-03-29 00:00:00', '', '16.00', '16.00', 'save', 'Complete', 1, 0, '2022-03-22 00:00:00', '2022-03-29 00:00:00'),
(4, 'LOG180091_DTP_004', 2, 1, '[{\"id\":180}]', '', '2022-03-24 00:00:00', '2022-03-24 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0.00', '0.00', 'save', 'Cancel', 0, 0, '2022-03-24 00:00:00', '2022-03-29 00:00:00'),
(5, 'LOG180051_FED_005', 2, 1, '[{\"id\":96}]', '', '2022-03-24 00:00:00', '2022-03-24 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0.00', '200.00', 'save', 'Cancel', 0, 0, '2022-03-24 00:00:00', '2022-03-24 00:00:00'),
(6, 'LOG180001_COP_006', 2, 1, '[{\"id\":73}]', '', '2022-03-24 00:00:00', '2022-03-24 00:00:00', '0000-00-00 00:00:00', '2022-03-24 00:00:00', '', '11.60', '11.60', 'save', 'Complete', 1, 0, '2022-03-24 00:00:00', '2022-03-24 00:00:00'),
(7, 'LOG180001_COP_007', 2, 1, '[{\"id\":83}]', '', '2022-03-28 00:00:00', '2022-03-28 00:00:00', '0000-00-00 00:00:00', '2022-03-29 00:00:00', '', '1500.00', '1500.00', 'save', 'Complete', 1, 0, '2022-03-28 00:00:00', '2022-03-29 00:00:00'),
(8, 'LOG180093_BAD_008', 2, 1, '[{\"id\":184}]', '', '2022-03-28 00:00:00', '2022-03-28 00:00:00', '0000-00-00 00:00:00', '2022-03-28 00:00:00', '', '10.00', '10.00', 'save', 'Complete', 1, 0, '2022-03-28 00:00:00', '2022-03-28 00:00:00'),
(9, 'LOG180089_BAD_009', 2, 1, '[{\"id\":176}]', '', '2022-03-28 00:00:00', '2022-03-28 00:00:00', '0000-00-00 00:00:00', '2022-03-28 00:00:00', '', '14952.00', '14952.00', 'save', 'Complete', 1, 0, '2022-03-28 00:00:00', '2022-03-28 00:00:00');

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
  `vat` varchar(255) NOT NULL,
  `value_date` datetime NOT NULL,
  `invoice_date` datetime NOT NULL,
  `payment_date` datetime NOT NULL,
  `paid_date` datetime NOT NULL,
  `payment_type` enum('Bank','Paypal') NOT NULL,
  `paid_amount` decimal(10,2) NOT NULL,
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

INSERT INTO `tms_invoice_client` (`invoice_id`, `invoice_number`, `freelance_id`, `customer_id`, `scoop_id`, `vat`, `value_date`, `invoice_date`, `payment_date`, `paid_date`, `payment_type`, `paid_amount`, `Invoice_cost`, `invoice_type`, `invoice_status`, `is_invoice_sent`, `reminder_sent`, `created_date`, `modified_date`) VALUES
(1, 'LOG180051_001', 1, 1, '[{\"id\":95}]', '', '2022-03-21 00:00:00', '2022-03-21 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0.00', '200.00', 'save', 'Open', 1, 0, '2022-03-21 00:00:00', '2022-03-21 00:00:00'),
(2, 'LOG180001_002', 1, 1, '[{\"id\":1}]', '', '2022-03-24 00:00:00', '2022-03-24 00:00:00', '0000-00-00 00:00:00', '2022-03-24 00:00:00', '', '25400.00', '25400.00', 'save', 'Complete', 1, 0, '2022-03-24 00:00:00', '2022-03-24 00:00:00'),
(3, 'LOG180054_003', 1, 1, '[{\"id\":104}]', '', '2022-03-24 00:00:00', '2022-03-24 00:00:00', '0000-00-00 00:00:00', '2022-03-24 00:00:00', '', '50.00', '100.00', 'save', 'Part Paid', 1, 0, '2022-03-24 00:00:00', '2022-03-24 00:00:00'),
(4, 'LOG180054_004', 1, 1, '[{\"id\":103}]', '', '2022-03-24 00:00:00', '2022-03-24 00:00:00', '0000-00-00 00:00:00', '2022-03-25 00:00:00', '', '1.00', '1.00', 'save', 'Complete', 1, 0, '2022-03-24 00:00:00', '2022-03-25 00:00:00'),
(5, 'LOG180062_005', 2, 2, '[{\"id\":130}]', '', '2022-03-25 00:00:00', '2022-03-25 00:00:00', '0000-00-00 00:00:00', '2022-03-25 00:00:00', '', '1200.00', '1200.00', 'save', 'Complete', 0, 0, '2022-03-25 00:00:00', '2022-03-25 00:00:00'),
(6, 'LOG180093_006', 1, 1, '[{\"id\":247}]', '', '2022-03-28 00:00:00', '2022-03-28 00:00:00', '0000-00-00 00:00:00', '2022-03-28 00:00:00', '', '200.00', '500.00', 'save', 'Part Paid', 0, 0, '2022-03-28 00:00:00', '2022-03-28 00:00:00');

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

--
-- Dumping data for table `tms_invoice_client_payments`
--

INSERT INTO `tms_invoice_client_payments` (`partial_payment_id`, `invoice_id`, `invoice_partial_paid_amount`, `created_date`) VALUES
(1, 3, '50', '2022-03-24 16:10:25'),
(3, 2, '25400', '2022-03-24 16:42:43'),
(4, 4, '1', '2022-03-25 19:26:01'),
(5, 5, '600', '2022-03-25 19:40:17'),
(6, 5, '600', '2022-03-25 19:42:03'),
(7, 6, '200', '2022-03-28 15:56:11');

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
(1, 30, 1, 1, '2016-11-30 00:00:00', '2016-11-30 00:00:00');

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
(1, 1, '392', '2018-12-21 12:53:42'),
(2, 1, '25000', '2018-12-21 12:53:54'),
(3, 2, '2005', '2022-03-21 19:16:54'),
(4, 3, '10', '2022-03-23 11:02:12'),
(5, 6, '11.6', '2022-03-24 14:59:26'),
(6, 8, '10', '2022-03-28 12:45:02'),
(7, 9, '10000', '2022-03-28 15:34:51'),
(8, 9, '4952', '2022-03-28 15:35:25'),
(9, 3, '3', '2022-03-28 17:47:13'),
(10, 3, '3', '2022-03-28 17:48:22'),
(11, 3, '3', '2022-03-29 10:56:23'),
(12, 7, '1500', '2022-03-29 10:59:22'),
(13, 7, '1500', '2022-03-29 10:59:22');

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

INSERT INTO `tms_items` (`itemId`, `order_id`, `item_number`, `item_name`, `description`, `price`, `total_price`, `project_type`, `tax`, `contact_person`, `manager`, `coordinator`, `start_date`, `due_date`, `q_date`, `item_language`, `source_lang`, `target_lang`, `item_status`, `item_email_subject`, `amount`, `total_amount`, `auto_status`, `po_number`, `attached_workflow`, `created_date`, `updated_date`) VALUES
(1, 2, '1', 'Test Account | English (US)-Hindi', '', '[{\"quantity\":\"234\",\"pricelist\":\"Hour(s) Editing\",\"itemPrice\":\"44\",\"itemTotal\":\"10296\",\"amtSum\":\"8\"},{\"quantity\":\"444\",\"pricelist\":\"31-40 QA errors\",\"itemPrice\":\"34\",\"itemTotal\":\"15096\",\"amtSum\":\"15096\"},{\"quantity\":\"1\",\"pricelist\":\"% Partial payment\",\"itemPrice\":\"3.25\",\"itemTotal\":\"8\",\"amtSum\":\"8\"}]', '25400.00', '1', 0, '1', '5', '3', '2018-12-13 11:01:00', '2019-02-27 11:44:00', '02-2019', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Hindi\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/in.png\",\"alt\":\"India\"}', 'Approved', 'test', '', '25400.00', 'Auto', 'PO5464FDK', 'SingleJob -Batch Delivery (BAD)', '2018-12-13 11:01:30', '2022-03-22 14:41:28'),
(6, 28, '1', 'Inx | French (Canada)-Romanian', '', '[{\"quantity\":\"22\",\"pricelist\":\"Page(s) DTP\",\"itemPrice\":\"30\",\"itemTotal\":\"660\",\"amtSum\":660},{\"quantity\":\"10\",\"pricelist\":\"% Partial payment\",\"itemPrice\":\"3,25\",\"itemTotal\":\"32.5\"},{\"quantity\":\"20\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"1\",\"itemTotal\":\"20\"},{\"quantity\":\"30\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"20\",\"itemTotal\":\"600\",\"amtSum\":600},{\"quantity\":\"40\",\"pricelist\":\"31-40 QA errors\",\"itemPrice\":\"1\",\"itemTotal\":\"40\"},{\"quantity\":\"50\",\"pricelist\":\"Hour(s) Glossary Creation\",\"itemPrice\":\"1\",\"itemTotal\":\"50\"},{\"quantity\":\"60\",\"pricelist\":\"Image Approval\",\"itemPrice\":\"1\",\"itemTotal\":\"60\"}]', '1462.50', '1', 0, '2', '1', '3', '2019-01-08 12:33:00', '2019-02-02 12:33:00', '02-2019', '', '{\"sourceLang\":\"French (Canada)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/ca.png\",\"alt\":\"Canada\"}', '{\"sourceLang\":\"Romanian\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/ro.png\",\"alt\":\"Romania\"}', 'To be Assigned', '222', '', '1462.50', 'Auto', '700', 'SingleJob -Batch Delivery (BAD)', '2019-01-08 12:33:25', '2021-11-12 16:44:31'),
(7, 28, '2', 'Inx | Magyar-Dansk', '', '[{\"quantity\":\"123\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"122\",\"itemTotal\":15006,\"amtSum\":\"15006\"}]', '15006.00', '3', 0, '2', '5', '3', '2019-01-09 15:37:00', '2019-02-02 15:37:00', '02-2019', '', '{\"sourceLang\":\"Magyar\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/hu.png\",\"alt\":\"Hungary\"}', '{\"sourceLang\":\"Dansk\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/dk.png\",\"alt\":\"Denmark\"}', 'To be Assigned', 'ewewe', '', '15006.00', 'Auto', '', 'SingleJob -Copy writing (COP)', '2019-01-09 15:37:28', '2019-01-09 15:40:10'),
(9, 29, '1', 'Inx | English (US)-Português (Brasil)', '', '[{\"quantity\":\"10\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"1\",\"itemTotal\":\"10\"},{\"quantity\":\"20\",\"pricelist\":\"Page(s) DTP\",\"itemPrice\":\"300\",\"itemTotal\":\"6000\"},{\"quantity\":\"100\",\"pricelist\":\"1-10 QA errors\",\"itemPrice\":\"1\",\"itemTotal\":\"100\"},{\"quantity\":\"200\",\"pricelist\":\"11-20 QA errors\",\"itemPrice\":\"12\",\"itemTotal\":\"2400\",\"amtSum\":2400}]', '8510.00', '1', 0, '2', '1', '3', '2021-03-01 17:36:00', '2021-11-20 17:36:00', '11-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Português (Brasil)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/br.png\",\"alt\":\"Brazil\"}', 'To be Assigned', 'Language Check', '', '8510.00', 'Auto', '868686868', 'jobChain -', '2021-03-01 17:36:30', '2021-07-14 19:04:08'),
(10, 42, '1', 'Test Account | English (US)-Português (Brasil)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Hour(s) DTP\",\"itemPrice\":\"1\",\"itemTotal\":\"1\"},{\"quantity\":\"2\",\"pricelist\":\"21-30 QA errors\",\"itemPrice\":\"1\",\"itemTotal\":\"2\"},{\"quantity\":\"4\",\"pricelist\":\"Hour(s) Glossary Creation\",\"itemPrice\":\"1\",\"itemTotal\":\"4\"}]', '7.00', '1', 0, '1', '5', '3', '2021-04-15 23:17:00', '2021-05-05 16:50:00', '05-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Português (Brasil)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/br.png\",\"alt\":\"Brazil\"}', 'To be Assigned', 'lang check', '', '7.00', 'Auto', '', 'jobChain -', '2021-04-15 23:17:14', '2021-07-13 16:48:52'),
(11, 42, '2', 'Test Account | English (US) - English (US)', '', '', '0.00', '1', 0, '1', '5', '3', '2021-04-15 23:17:00', '2021-05-12 12:10:00', '05-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'To be Assigned', 'test- may', '', '0.00', 'Auto', '', 'SingleJob -Delivery to client (DTC)', '2021-04-15 23:17:14', '2021-05-04 12:10:48'),
(12, 41, '1', 'Inx | English (US) - English (US)', '', '', '0.00', '4', 0, '2', '5', '3', '2021-05-04 14:33:00', '2021-05-07 14:33:00', '05-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'To be Assigned', 'write-test', '', '0.00', 'Auto', '', 'jobChain -', '2021-05-04 14:33:44', '2021-05-04 14:35:00'),
(13, 44, '1', 'Test Account | English (US) - English (US)', '', '', '0.00', '', 0, '2', '', '', '2021-05-10 12:42:21', NULL, '', '', '', '', 'To be Assigned', '', '', '0.00', 'Auto', '', '', '2021-05-10 12:42:21', '2021-05-10 12:42:21'),
(14, 46, '1', 'Test Account | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"100000\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0.1\",\"itemTotal\":\"10000\",\"amtSum\":10000}]', '10000.00', '1', 0, '1', '1', '3', '2021-06-02 19:20:00', '2021-06-02 15:00:00', '06-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned', 'Test Project - 02.06.2021', '', '10000.00', 'Auto', '', 'SingleJob -Feedback (FED)', '2021-06-02 19:20:16', '2021-10-12 14:03:37'),
(15, 49, '1', 'Inx | English (US) - English (US)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"1\",\"itemTotal\":\"1\"}]', '1.00', '1', 0, '2', '5', '3', '2021-06-04 16:06:00', '2021-06-04 16:21:00', '06-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'To be Assigned', 'test project', '', '1.00', 'Auto', '', 'SingleJob -Delivery to client (DTC)', '2021-06-04 16:06:27', '2021-06-04 16:21:39'),
(16, 51, '1', 'Inx | English (US) - English (US)', '', '[{\"quantity\":\"1\",\"pricelist\":\"31-40 QA errors\",\"itemPrice\":\"10\",\"itemTotal\":\"10\",\"amtSum\":10}]', '10.00', '2', 0, '2', '5', '3', '2021-06-04 17:38:00', '2021-07-17 19:50:00', '07-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'To be Assigned', 'jkjhk', '', '10.00', 'Auto', 'ABC555', 'SingleJob -Desktop Publishing (DTP)', '2021-06-04 17:38:25', '2021-07-16 19:51:00'),
(17, 51, '2', 'Inx | English (US) - English (US)', '', '', '0.00', '', 0, '2', '', '', '2021-06-04 17:38:25', NULL, '', '', '', '', 'To be Assigned', '', '', '0.00', 'Auto', '', '', '2021-06-04 17:38:25', '2021-06-04 17:38:25'),
(18, 51, '3', 'Inx | English (US) - English (US)', '', '', '0.00', '', 0, '2', '', '', '2021-06-04 17:38:25', NULL, '', '', '', '', 'To be Assigned', '', '', '0.00', 'Auto', '', '', '2021-06-04 17:38:25', '2021-06-04 17:38:25'),
(19, 46, '2', 'Test Account | English (US)-Norwegian (bokmal)', '', '', '0.00', '6', 0, '1', '1', '3', '2021-06-04 18:09:00', '2021-10-12 15:59:00', '10-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned', 'ytyr rr gfd', '', '0.00', 'Auto', 'GHtr 56', 'SingleJob -Copy writing (COP)', '2021-06-04 18:09:31', '2021-10-12 15:59:43'),
(20, 54, '1', 'Test Account | Català-Polski', '', '[{\"quantity\":\"50\",\"pricelist\":\"Hour(s) DTP\",\"itemPrice\":\"1\",\"itemTotal\":\"50\"},{\"quantity\":\"80\",\"pricelist\":\"Batch Delivery\",\"itemPrice\":\"1\",\"itemTotal\":\"80\"}]', '130.00', '2', 0, '1', '5', '3', '2021-06-21 17:16:00', '2021-06-01 17:18:00', '06-2021', '', '{\"sourceLang\":\"Català\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/catalonia.png\",\"alt\":\"Catalonia\"}', '{\"sourceLang\":\"Polski\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/pl.png\",\"alt\":\"Poland\"}', 'To be Assigned', 'ABC', '', '130.00', 'Auto', '70', 'SingleJob -Batch Delivery (BAD)', '2021-06-21 17:16:52', '2021-06-22 15:48:46'),
(21, 54, '2', 'Test Account | English (US) - English (US)', '', '[{\"quantity\":\"10\",\"pricelist\":\"% Partial payment\",\"itemPrice\":\"3,25\",\"itemTotal\":\"325\"},{\"quantity\":\"20\",\"pricelist\":\"Discount - Quality\",\"itemPrice\":\"1\",\"itemTotal\":\"20\"}]', '52.50', '2', 0, '1', '5', '3', '2021-06-21 17:16:00', '2021-06-02 17:38:00', '06-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'To be Assigned', 'jaimini.kanhasoft@gmail.com', '', '52.50', 'Auto', '8786', 'SingleJob -Desktop Publishing (DTP)', '2021-06-21 17:16:52', '2021-06-22 15:47:46'),
(24, 29, '2', 'Inx | English (US) - English (US)', '', '', '0.00', '', 0, '2', '', '', '2021-06-21 17:55:32', NULL, '', '', '', '', 'To be Assigned', '', '', '0.00', 'Auto', '', '', '2021-06-21 17:55:32', '2021-06-21 17:55:32'),
(25, 29, '3', 'Inx | English (US) - English (US)', '', '[{\"quantity\":\"10\",\"pricelist\":\"Page(s) DTP\",\"itemPrice\":\"300\",\"itemTotal\":\"3000\"}]', '3000.00', '2', 0, '2', '1', '3', '2021-06-21 18:00:00', '2021-06-22 18:01:00', '06-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'To be Assigned', 'jaimini.kanhasoft@gmail.com', '', '3000.00', 'Auto', 'ABC5', 'SingleJob -Copy writing (COP)', '2021-06-21 18:00:06', '2021-06-21 18:01:27'),
(26, 35, '1', 'Test Account | English (US)-Norwegian (bokmal)', '', '[{\"quantity\":\"10\",\"pricelist\":\"Page(s) DTP\",\"itemPrice\":\"300\",\"itemTotal\":\"3000\"},{\"quantity\":\"20\",\"pricelist\":\"Available price unit 2\",\"itemPrice\":\"1\",\"itemTotal\":\"20\"}]', '3020.00', '1', 0, '1', '1', '3', '2021-06-21 18:06:00', '2021-06-21 19:13:00', '06-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned', 'jaimini.kanhasoft@gmail.com', '', '3020.00', 'Auto', '6866', 'SingleJob -Batch Delivery (BAD)', '2021-06-21 18:06:39', '2021-11-17 11:49:59'),
(27, 35, '2', 'Test Account | English (US)-Hindi', '', '[{\"quantity\":\"10\",\"pricelist\":\"1-10 QA errors\",\"itemPrice\":\"1\",\"itemTotal\":\"10\"},{\"quantity\":\"200\",\"pricelist\":\"Available price unit 2\",\"itemPrice\":\"1\",\"itemTotal\":\"200\"}]', '210.00', '1', 0, '1', '1', '3', '2021-06-21 18:06:00', '2021-06-14 18:07:00', '06-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Hindi\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/in.png\",\"alt\":\"India\"}', 'To be Assigned', 'jaimini.kanhasoft@gmail.com', '', '210.00', 'Auto', '897979', 'SingleJob -Batch Delivery (BAD)', '2021-06-21 18:06:39', '2021-11-17 11:46:23'),
(28, 55, '1', 'Inx | English (US) - English (US)', '', '[{\"quantity\":\"10\",\"pricelist\":\"% Partial payment\",\"itemPrice\":\"3,25\",\"itemTotal\":\"32.5\"},{\"quantity\":\"30\",\"pricelist\":\"Rush fee\",\"itemPrice\":\"200\",\"itemTotal\":\"6000\"},{\"quantity\":\"40\",\"pricelist\":\"% Surcharge\",\"itemPrice\":\"09\",\"itemTotal\":\"360\",\"amtSum\":360},{\"quantity\":\"10\",\"pricelist\":\"Available price unit 2\",\"itemPrice\":\"1\",\"itemTotal\":\"10\"}]', '6402.50', '2', 0, '2', '5', '3', '2021-06-22 11:44:00', '2021-06-25 11:46:00', '06-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'To be Assigned', 'jaimini.kanhasoft@gmail.com', '', '6402.50', 'Auto', '76868', 'SingleJob -Copy writing (COP)', '2021-06-22 11:44:32', '2021-06-22 11:47:01'),
(29, 38, '1', 'Inx | English (US) - English (US)', '', '[{\"quantity\":\"2\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"300\",\"itemTotal\":\"600\"}]', '600.00', '2', 0, '2', '5', '3', '2021-06-22 13:17:00', '2021-06-24 00:20:00', '06-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'To be Assigned', 'khkhk', '', '600.00', 'Auto', '677bsdjbjdy8', 'SingleJob -Search Engine Optimization (SEO)', '2021-06-22 13:17:31', '2021-06-22 13:18:27'),
(32, 37, '1', 'Inx | English (US)-Eesti', '', '[{\"quantity\":\"10\",\"pricelist\":\"Page(s) DTP\",\"itemPrice\":\"300\",\"itemTotal\":\"3000\"},{\"quantity\":\"20\",\"pricelist\":\"Words subtitling with timecoding\",\"itemPrice\":\"100\",\"itemTotal\":\"2000\",\"amtSum\":2000},{\"quantity\":\"40\",\"pricelist\":\"Hour(s) DTP\",\"itemPrice\":\"1\",\"itemTotal\":\"40\"},{\"quantity\":\"2\",\"pricelist\":\"Discount - Quality\",\"itemPrice\":\"1\",\"itemTotal\":\"2\"}]', '5042.00', '3', 0, '2', '5', '3', '2021-06-22 17:51:00', '2021-06-24 02:52:00', '06-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/dk.png\",\"alt\":\"Denmark\"}', '{\"sourceLang\":\"Eesti\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/ee.png\",\"alt\":\"Estonia\"}', 'To be Assigned', 'jaimini.kanhasoft@gmail.com', '', '5042.00', 'Auto', '8686886', 'SingleJob -Desktop Publishing (DTP)', '2021-06-22 17:51:13', '2021-07-13 13:42:37'),
(33, 40, '1', 'Test Account | English (US) - English (US)', '', '[{\"quantity\":1,\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"1\",\"itemTotal\":\"1\"},{\"quantity\":1,\"pricelist\":\"Words subtitling with timecoding\",\"itemPrice\":\"1\",\"itemTotal\":\"1\"}]', '2.00', '6', 0, '1', '5', '3', '2021-06-23 18:16:00', '2021-10-20 14:34:00', '10-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'Delivered', '98888888888888888888', '', '2.00', 'Auto', '989', 'SingleJob -Copy writing (COP)', '2021-06-23 18:16:38', '2021-10-11 14:36:20'),
(34, 56, '1', 'Test Account | English (US) - English (US)', '', '[{\"quantity\":\"500\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,1\",\"itemTotal\":\"50\",\"amtSum\":50},{\"quantity\":\"200\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"0,05\",\"itemTotal\":\"10\",\"amtSum\":10}]', '60.00', '1', 0, '1', '1', '3', '2021-06-29 14:04:00', '2021-06-30 15:00:00', '06-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/cz.png\",\"alt\":\"Czech Republic\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'To be Assigned', 'jikldfjkldjfklsdjfkl', '', '60.00', 'Auto', '456578', 'SingleJob -Feedback (FED)', '2021-06-29 14:04:02', '2021-06-29 15:55:23'),
(35, 57, '1', 'Inx | English (US) - English (US)', '', '[{\"quantity\":\"7\",\"pricelist\":\"Page(s) DTP\",\"itemPrice\":\"300\",\"itemTotal\":\"2100\"},{\"quantity\":\"2\",\"pricelist\":\"Batch Delivery\",\"itemPrice\":\"1\",\"itemTotal\":\"2\"}]', '2102.00', '2', 0, '1', '1', '3', '2021-06-29 15:48:00', '2021-07-03 19:36:00', '07-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'To be Assigned', 'jajd', '', '2102.00', 'Auto', '78787', 'SingleJob -Delivery to client (DTC)', '2021-06-29 15:48:50', '2021-07-02 19:37:18'),
(39, 58, '1', 'Test Account | English (US)-Polski', '', '[{\"quantity\":\"2\",\"pricelist\":\"Page(s) DTP\",\"itemPrice\":\"300\",\"itemTotal\":\"600\"},{\"quantity\":\"5\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"10\",\"itemTotal\":\"50\",\"amtSum\":50},{\"quantity\":\"4\",\"pricelist\":\"Words subtitling without timecoding\",\"itemPrice\":\"25\",\"itemTotal\":\"100\"},{\"quantity\":\"5\",\"pricelist\":\"Hour(s) DTP\",\"itemPrice\":\"1\",\"itemTotal\":\"5\"}]', '755.00', '2', 0, '2', '5', '3', '2021-07-05 10:39:00', '2021-07-07 10:40:00', '07-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Polski\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/pl.png\",\"alt\":\"Poland\"}', 'To be Assigned', 'test', '', '755.00', 'Auto', '4000', 'SingleJob -Copy writing (COP)', '2021-07-05 10:39:41', '2021-07-05 10:40:57'),
(40, 58, '2', 'Test Account | English (US)-Norsk (nynorsk)', '', '[{\"quantity\":\"1\",\"pricelist\":\"1-10 QA errors\",\"itemPrice\":\"1\",\"itemTotal\":\"1\"},{\"quantity\":\"2\",\"pricelist\":\"Hour(s) Glossary Creation\",\"itemPrice\":\"1\",\"itemTotal\":\"2\"},{\"quantity\":\"3\",\"pricelist\":\"Page(s) DTP\",\"itemPrice\":\"300\",\"itemTotal\":\"900\"},{\"quantity\":\"4\",\"pricelist\":\"Hour(s) Translation\",\"itemPrice\":\"1\",\"itemTotal\":\"4\"}]', '907.00', '3', 0, '2', '5', '3', '2021-07-05 10:42:00', '2021-07-06 10:43:00', '07-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norsk (nynorsk)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned', 'Test@', '', '907.00', 'Auto', 'ABC', 'SingleJob -Desktop Publishing (DTP)', '2021-07-05 10:42:51', '2021-07-05 10:44:01'),
(41, 59, '1', 'Inx | Eesti-Norsk (nynorsk)', '', '[{\"quantity\":\"3\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"1\",\"itemTotal\":\"3\"},{\"quantity\":\"1\",\"pricelist\":\"Words subtitling with timecoding\",\"itemPrice\":\"1\",\"itemTotal\":\"1\"},{\"quantity\":\"5\",\"pricelist\":\"Discount - Quality\",\"itemPrice\":\"1\",\"itemTotal\":\"5\"}]', '9.00', '2', 0, '1', '5', '3', '2021-07-06 09:48:00', '2021-07-07 09:52:00', '07-2021', '', '{\"sourceLang\":\"Eesti\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/ee.png\",\"alt\":\"Estonia\"}', '{\"sourceLang\":\"Norsk (nynorsk)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned', 'jaimini.kanhasoft', '', '9.00', 'Auto', '7667686', 'SingleJob -Copy writing (COP)', '2021-07-06 09:48:04', '2021-07-06 09:53:07'),
(42, 59, '2', 'Inx | English (US) - English (US)', '', '[{\"quantity\":\"6\",\"pricelist\":\"Hour(s) Glossary Creation\",\"itemPrice\":\"1\",\"itemTotal\":\"6\"}]', '6.00', '3', 0, '1', '5', '3', '2021-07-06 09:48:00', '2021-07-09 09:49:00', '07-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'To be Assigned', 'ABC', '', '6.00', 'Auto', 'UIIU89', 'SingleJob -Feedback (FED)', '2021-07-06 09:48:04', '2021-07-06 09:54:37'),
(43, 60, '1', 'Inx | English (US) - English (US)', '', '[{\"quantity\":\"8\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"90\",\"itemTotal\":\"720\",\"amtSum\":720},{\"quantity\":\"7\",\"pricelist\":\"11-20 QA errors\",\"itemPrice\":\"1\",\"itemTotal\":\"7\"},{\"quantity\":\"7\",\"pricelist\":\"Hour(s) Editing\",\"itemPrice\":\"1\",\"itemTotal\":\"7\"},{\"quantity\":\"3\",\"pricelist\":\"Hour(s) Glossary Creation\",\"itemPrice\":\"1\",\"itemTotal\":\"3\"},{\"quantity\":\"8\",\"pricelist\":\"Discount - Quality\",\"itemPrice\":\"1\",\"itemTotal\":\"8\"}]', '745.00', '3', 0, '2', '5', '3', '2021-07-06 12:37:00', '2021-07-10 10:00:00', '07-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'To be Assigned', 'jug', '', '745.00', 'Auto', 'u88', 'SingleJob -test 123 (TEST)', '2021-07-06 12:37:24', '2021-07-06 12:40:17'),
(44, 61, '1', 'Test Account | Dansk-English (US)', '', '[{\"quantity\":\"5\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"1\",\"itemTotal\":\"5\"},{\"quantity\":\"8\",\"pricelist\":\"Available price unit\",\"itemPrice\":\"2\",\"itemTotal\":\"16\"}]', '21.00', '6', 0, '2', '5', '3', '2021-07-06 12:56:00', '2021-07-07 12:57:00', '07-2021', '', '{\"sourceLang\":\"Dansk\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/dk.png\",\"alt\":\"Denmark\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'To be Assigned', 'jh', '', '21.00', 'Auto', '7889', 'SingleJob -test 123 (TEST)', '2021-07-06 12:56:18', '2021-09-16 16:25:14'),
(45, 62, '1', 'Inx | English (US) - English (US)', '', '[{\"quantity\":\"5\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"1\",\"itemTotal\":\"5\"},{\"quantity\":\"6\",\"pricelist\":\"11-20 QA errors\",\"itemPrice\":\"1\",\"itemTotal\":\"6\"}]', '11.00', '2', 0, '2', '5', '3', '2021-07-06 18:23:00', '2021-07-14 20:34:00', '07-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'To be Assigned', 'jhbv', '', '11.00', 'Auto', 'ABC455', 'SingleJob -Feedback (FED)', '2021-07-06 18:23:54', '2021-07-06 20:35:34'),
(46, 34, '1', 'Inx | English (US) - English (US)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Page(s) DTP\",\"itemPrice\":\"300\",\"itemTotal\":\"300\"}]', '300.00', '5', 0, '2', '5', '3', '2021-07-12 21:24:00', '2021-07-23 16:31:00', '07-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'To be Assigned', 'jj', '', '300.00', 'Auto', '9i99', 'SingleJob -test 123 (TEST)', '2021-07-12 21:24:17', '2021-07-22 16:32:00'),
(47, 63, '1', 'Inx | English (US) - English (US)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Hour(s) Editing\",\"itemPrice\":\"1100\",\"itemTotal\":\"1100\",\"amtSum\":1100},{\"quantity\":\"2\",\"pricelist\":\"Hour(s) Glossary Creation\",\"itemPrice\":\"10\",\"itemTotal\":\"20\",\"amtSum\":20}]', '1120.00', '5', 0, '2', '5', '3', '2021-07-12 21:27:00', '2021-07-30 17:57:00', '07-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'To be Assigned', 'kjn', '', '1120.00', 'Auto', '877', 'SingleJob -Feedback (FED)', '2021-07-12 21:27:29', '2021-07-29 18:11:04'),
(48, 64, '1', 'Inx | English (US) - English (US)', '', '[{\"quantity\":\"80\",\"pricelist\":\"Words Proofreading\",\"itemPrice\":\"1\",\"itemTotal\":\"80\"},{\"quantity\":\"6\",\"pricelist\":\"Discount - Quality\",\"itemPrice\":\"1\",\"itemTotal\":\"6\"},{\"quantity\":\"50\",\"pricelist\":\"Available price unit\",\"itemPrice\":\"2\",\"itemTotal\":\"100\"}]', '186.00', '2', 0, '2', '5', '3', '2021-07-13 20:42:00', '2021-07-13 20:44:00', '07-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'To be Assigned', 'ffwff', '', '186.00', 'Auto', '23434', 'SingleJob -Copy writing (COP)', '2021-07-13 20:42:23', '2021-07-13 21:08:21'),
(49, 65, '1', 'Inx | English (US) - English (US)', '', '', '0.00', '', 0, '2', '', '', '2021-07-14 10:28:38', NULL, '', '', '', '', 'To be Assigned', '', '', '0.00', 'Auto', '', '', '2021-07-14 10:28:38', '2021-07-14 10:28:38'),
(50, 66, '1', 'Inx | Català-‏Íslenska', '', '[{\"quantity\":\"10\",\"pricelist\":\"1-10 QA errors\",\"itemPrice\":\"1\",\"itemTotal\":\"10\"}]', '10.00', '2', 0, '2', '5', '3', '2021-07-15 12:21:00', '2021-07-21 20:01:00', '07-2021', '', '{\"sourceLang\":\"Català\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/catalonia.png\",\"alt\":\"Catalonia\"}', '{\"sourceLang\":\"‏Íslenska\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/is.png\",\"alt\":\"Iceland\"}', 'To be Assigned', 'asd', '', '10.00', 'Auto', 'asd', 'jobChain -', '2021-07-15 12:21:29', '2021-07-19 20:02:02'),
(51, 67, '1', 'Test Account | English (US) - English (US)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"1,5\",\"itemTotal\":\"1.5\",\"amtSum\":1.5},{\"quantity\":\"20\",\"pricelist\":\"Discount - Quality\",\"itemPrice\":\"1\",\"itemTotal\":\"20\"},{\"quantity\":\"200\",\"pricelist\":\"1-10 QA errors\",\"itemPrice\":\"8,5\",\"itemTotal\":\"1700\",\"amtSum\":1700}]', '1721.50', '4', 0, '2', '5', '3', '2021-07-15 13:10:00', '2021-07-15 13:10:00', '07-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'To be Assigned', 'Test@tms', '', '1721.50', 'Auto', '899', 'SingleJob -Copy writing (COP)', '2021-07-15 13:10:18', '2021-07-15 13:12:49'),
(52, 68, '1', 'Test Account | ‏Íslenska-Suomi', '', '[{\"quantity\":\"10\",\"pricelist\":\"% Partial payment\",\"itemPrice\":\"3,25\",\"itemTotal\":\"32.5\"},{\"quantity\":\"15\",\"pricelist\":\"Page(s) DTP\",\"itemPrice\":\"300\",\"itemTotal\":\"4500\"},{\"quantity\":\"60\",\"pricelist\":\"11-20 QA errors\",\"itemPrice\":\"1\",\"itemTotal\":\"60\"}]', '4592.50', '2', 0, '2', '5', '3', '2021-07-19 09:29:00', '2021-07-26 09:30:00', '07-2021', '', '{\"sourceLang\":\"‏Íslenska\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/is.png\",\"alt\":\"Iceland\"}', '{\"sourceLang\":\"Suomi\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/fi.png\",\"alt\":\"Finland\"}', 'To be Assigned', 'jio', '', '4592.50', 'Auto', '89099', 'SingleJob -Desktop Publishing (DTP)', '2021-07-19 09:29:31', '2021-07-19 09:31:19'),
(53, 68, '2', 'Test Account | Eesti-‏Íslenska', '', '[{\"quantity\":\"10\",\"pricelist\":\"Words subtitling with timecoding\",\"itemPrice\":\"1\",\"itemTotal\":\"10\"},{\"quantity\":\"30\",\"pricelist\":\"31-40 QA errors\",\"itemPrice\":\"1\",\"itemTotal\":\"30\"}]', '40.00', '2', 0, '2', '5', '3', '2021-07-19 10:28:00', '2021-07-21 10:34:00', '07-2021', '', '{\"sourceLang\":\"Eesti\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/ee.png\",\"alt\":\"Estonia\"}', '{\"sourceLang\":\"‏Íslenska\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/is.png\",\"alt\":\"Iceland\"}', 'To be Assigned', 'tenjkbh', '', '40.00', 'Auto', '56464', 'SingleJob -Copy writing (COP)', '2021-07-19 10:28:58', '2021-07-19 10:35:54'),
(55, 36, '1', 'Inx | English (US) - English (US)', '', '', '0.00', '', 0, '1', '', '', '2021-07-19 21:09:04', NULL, '', '', '', '', 'To be Assigned', '', '', '0.00', 'Auto', '', '', '2021-07-19 21:09:04', '2021-07-19 21:09:04'),
(56, 69, '1', 'Test Account | English (US)-Norsk (bokmål)', '', '[{\"quantity\":\"500\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,1\",\"itemTotal\":\"50\",\"amtSum\":50}]', '50.00', '1', 0, '1', '1', '3', '2021-07-22 13:55:00', '2021-07-22 15:00:00', '07-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Norsk (bokmål)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned', 'Test Project Ingvild - 22.07.2021', '', '50.00', 'Auto', '#TR45789', 'jobChain -', '2021-07-22 13:55:19', '2021-07-22 14:12:53'),
(57, 34, '2', 'Inx | English (US) - English (US)', '', '', '0.00', '', 0, '2', '', '', '2021-07-22 16:55:50', NULL, '', '', '', '', 'To be Assigned', '', '', '0.00', 'Auto', '', '', '2021-07-22 16:55:50', '2021-07-22 16:55:50'),
(60, 2, '6', 'Test Account | Hindi-', '', '[{\"quantity\":1,\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"1\",\"itemTotal\":\"100\",\"amtSum\":\"100\"},{\"quantity\":1,\"pricelist\":\"% Partial payment\",\"itemPrice\":\"3,25\",\"itemTotal\":\"3.25\"},{\"quantity\":1,\"pricelist\":\"Available price unit\",\"itemPrice\":\"2\",\"itemTotal\":\"2\"}]', '105.25', '5', 0, '1', '5', '3', '2021-07-22 17:05:00', '2021-07-23 12:22:00', '07-2021', '', '{\"sourceLang\":\"Hindi\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/in.png\",\"alt\":\"India\"}', '{\"sourceLang\":\"Suomi\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/fi.png\",\"alt\":\"Finland\"}', 'In Progress', 'afdf@adf', '', '105.25', 'Auto', '123', 'SingleJob -Copy writing (COP)', '2021-07-22 17:05:26', '2021-10-26 11:25:29'),
(61, 71, '1', 'Test Account | ‏Íslenska-Suomi', '', '[{\"quantity\":\"10\",\"pricelist\":\"% Surcharge\",\"itemPrice\":\"10\",\"itemTotal\":\"100\",\"amtSum\":100},{\"quantity\":\"30\",\"pricelist\":\"11-20 QA errors\",\"itemPrice\":\"1\",\"itemTotal\":\"30\"}]', '130.00', '5', 0, '2', '1', '3', '2021-07-22 17:05:00', '2021-07-24 17:55:00', '07-2021', '', '{\"sourceLang\":\"‏Íslenska\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/is.png\",\"alt\":\"Iceland\"}', '{\"sourceLang\":\"Suomi\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/fi.png\",\"alt\":\"Finland\"}', 'To be Assigned', 'ABC', '', '130.00', 'Auto', '9898', 'SingleJob -Copy writing (COP)', '2021-07-22 17:05:26', '2021-07-22 17:55:31'),
(72, 71, '2', 'Test Account | Dansk-‏Íslenska', '', '[{\"quantity\":\"10\",\"pricelist\":\"Words subtitling with timecoding\",\"itemPrice\":\"1\",\"itemTotal\":\"10\"}]', '10.00', '5', 0, '2', '1', '3', '2021-07-22 18:03:00', '2021-07-25 18:03:00', '07-2021', '', '{\"sourceLang\":\"Dansk\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/dk.png\",\"alt\":\"Denmark\"}', '{\"sourceLang\":\"‏Íslenska\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/is.png\",\"alt\":\"Iceland\"}', 'To be Assigned', 'sfd', '', '10.00', 'Auto', '3224', 'SingleJob -Desktop Publishing (DTP)', '2021-07-22 18:03:22', '2021-07-22 18:04:00'),
(73, 70, '1', 'Inx | Suomi-Svenska', '', '[{\"quantity\":\"1\",\"pricelist\":\"Hour(s) Editing\",\"itemPrice\":\"1\",\"itemTotal\":\"1\"}]', '1.00', '1', 0, '2', '1', '3', '2021-07-22 18:03:00', '2021-06-29 18:04:00', '06-2021', '', '{\"sourceLang\":\"Suomi\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/fi.png\",\"alt\":\"Finland\"}', '{\"sourceLang\":\"Svenska\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/se.png\",\"alt\":\"Sweden\"}', 'To be Assigned', 'fghf@dg', '', '1.00', 'Auto', '555', 'SingleJob -Copy writing (COP)', '2021-07-22 18:03:54', '2021-07-22 18:05:10'),
(74, 73, '1', 'Test Account | Estonian-English (US)', '', '[{\"quantity\":\"10\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"10\",\"itemTotal\":\"100\",\"amtSum\":100},{\"quantity\":\"20\",\"pricelist\":\"% Surcharge\",\"itemPrice\":\"100\",\"itemTotal\":\"2000\",\"amtSum\":2000}]', '2100.00', '5', 0, '1', '5', '3', '2021-07-27 11:16:00', '2021-07-30 11:19:00', '07-2021', '', '{\"sourceLang\":\"Estonian\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/ee.png\",\"alt\":\"Estonia\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned', 'ABC', '', '2100.00', 'Auto', 'ABC4500', 'SingleJob -Desktop Publishing (DTP)', '2021-07-27 11:16:38', '2021-07-29 17:28:20'),
(75, 74, '1', 'Test Account | Catalan-English (US)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"10\",\"itemTotal\":\"10\",\"amtSum\":10},{\"quantity\":\"3\",\"pricelist\":\"11-20 QA errors\",\"itemPrice\":\"10\",\"itemTotal\":\"30\",\"amtSum\":30}]', '40.00', '5', 0, '1', '1', '3', '2021-07-29 16:29:00', '2021-07-29 16:32:00', '07-2021', '', '{\"sourceLang\":\"Catalan\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/catalonia.png\",\"alt\":\"Catalonia\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'To be Assigned', 'jiya', '', '40.00', 'Auto', '87878', 'SingleJob -Desktop Publishing (DTP)', '2021-07-29 16:29:51', '2021-09-21 11:40:40'),
(76, 74, '2', 'Test Account | English (US) - English (US)', '', '[{\"quantity\":\"10\",\"pricelist\":\"Available price unit\",\"itemPrice\":\"2\",\"itemTotal\":\"20\"},{\"quantity\":\"5\",\"pricelist\":\"Hour(s) QA\",\"itemPrice\":\"10\",\"itemTotal\":\"50\",\"amtSum\":50}]', '70.00', '5', 0, '1', '1', '3', '2021-07-29 17:09:00', '2021-07-31 17:10:00', '07-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'To be Assigned', 'lkj', '', '70.00', 'Auto', '5646', 'SingleJob -Copy writing (COP)', '2021-07-29 17:09:36', '2021-09-21 11:40:44'),
(77, 74, '3', 'Test Account | English (US) - English (US)', '', '', '0.00', '', 0, '1', '', '', '2021-07-29 17:09:36', NULL, '', '', '', '', 'To be Assigned', '', '', '0.00', 'Auto', '', '', '2021-07-29 17:09:36', '2021-07-29 17:09:36'),
(78, 63, '2', 'Inx | English (US) - English (US)', '', '[{\"quantity\":\"5\",\"pricelist\":\"Batch Delivery\",\"itemPrice\":\"1.2\",\"itemTotal\":\"60\",\"amtSum\":60},{\"quantity\":\"5\",\"pricelist\":\"Hour(s) LQA\",\"itemPrice\":\"100\",\"itemTotal\":\"500\",\"amtSum\":500},{\"quantity\":\"10\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"100\",\"itemTotal\":\"1000\",\"amtSum\":1000}]', '1560.00', '5', 0, '2', '5', '3', '2021-07-29 18:20:00', '2021-08-05 18:24:00', '08-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'To be Assigned', 'jaimini', '', '1560.00', 'Auto', '879779', 'SingleJob -Batch Delivery (BAD)', '2021-07-29 18:20:08', '2021-07-29 18:31:41'),
(79, 84, '1', 'Inx | English (US) - English (US)', '', '', '0.00', '', 0, '2', '', '', '2021-07-30 12:57:23', NULL, '', '', '', '', 'To be Assigned', '', '', '0.00', 'Auto', '', '', '2021-07-30 12:57:23', '2021-07-30 12:57:23'),
(80, 86, '1', 'Inx | Danish-English (US)', '', '[{\"quantity\":\"5\",\"pricelist\":\"% Surcharge\",\"itemPrice\":\"10\",\"itemTotal\":\"50\",\"amtSum\":50}]', '50.00', '5', 0, '1', '5', '3', '2021-07-30 13:39:00', '2021-07-01 13:40:00', '07-2021', '', '{\"sourceLang\":\"Danish\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/dk.png\",\"alt\":\"Denmark\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'To be Assigned', 'jh', '', '50.00', 'Auto', '87', 'SingleJob -Copy writing (COP)', '2021-07-30 13:39:53', '2021-08-02 19:13:30'),
(81, 87, '1', 'Test Account | English (US) - English (US)', '', '', '0.00', '', 0, '2', '', '', '2021-08-09 10:40:13', NULL, '', '', '', '', 'To be Assigned', '', '', '0.00', 'Auto', '', '', '2021-08-09 10:40:13', '2021-08-09 10:40:13'),
(82, 88, '1', 'Test Account | English (US) - English (US)', '', '', '0.00', '', 0, '1', '', '', '2021-08-09 10:50:31', NULL, '', '', '', '', 'To be Assigned', '', '', '0.00', 'Auto', '', '', '2021-08-09 10:50:31', '2021-08-09 10:50:31'),
(83, 88, '2', 'Test Account | English (US) - English (US)', '', '', '0.00', '', 0, '1', '', '', '2021-08-09 10:50:31', NULL, '', '', '', '', 'To be Assigned', '', '', '0.00', 'Auto', '', '', '2021-08-09 10:50:31', '2021-08-09 10:50:31'),
(84, 88, '3', 'Test Account | English (US) - English (US)', '', '', '0.00', '', 0, '1', '', '', '2021-08-09 10:50:31', NULL, '', '', '', '', 'To be Assigned', '', '', '0.00', 'Auto', '', '', '2021-08-09 10:50:31', '2021-08-09 10:50:31'),
(85, 88, '4', 'Test Account | English (US) - English (US)', '', '', '0.00', '', 0, '1', '', '', '2021-08-09 10:50:31', NULL, '', '', '', '', 'To be Assigned', '', '', '0.00', 'Auto', '', '', '2021-08-09 10:50:31', '2021-08-09 10:50:31'),
(86, 2, '7', 'Test Account | Hindi-Hindi', '', '', '0.00', '1', 0, '1', '5', '3', '2021-08-25 18:01:00', '2021-08-26 19:11:00', '08-2021', '', '{\"sourceLang\":\"Hindi\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/in.png\",\"alt\":\"India\"}', '{\"sourceLang\":\"Hindi\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/in.png\",\"alt\":\"India\"}', 'To be Assigned', 'walmart', '', '0.00', 'Auto', 'Walmart documents', 'SingleJob -Copy writing (COP)', '2021-08-25 18:01:56', '2021-10-19 14:19:47'),
(87, 102, '1', 'Test Account | English (US)-Hindi', '', '[{\"quantity\":\"2\",\"pricelist\":\"% Partial payment\",\"itemPrice\":\"3,25\",\"itemTotal\":\"6.5\"},{\"quantity\":\"3\",\"pricelist\":\"% Surcharge\",\"itemPrice\":\"2\",\"itemTotal\":\"6\",\"amtSum\":6}]', '12.50', '5', 0, '1', '5', '3', '2021-09-02 17:38:00', '2021-09-02 17:39:00', '09-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/dk.png\",\"alt\":\"Denmark\"}', '{\"sourceLang\":\"Hindi\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/in.png\",\"alt\":\"India\"}', 'In Progress', 'Jaimini.Kanhasoft@gmail.com', '', '12.50', 'Auto', 'ABC', 'SingleJob -Copy writing (COP)', '2021-09-02 17:38:08', '2021-10-20 11:11:44'),
(88, 102, '2', 'Test Account | English (US)-Icelandic', '', '[{\"quantity\":\"3\",\"pricelist\":\"Words subtitling with timecoding\",\"itemPrice\":\"100\",\"itemTotal\":\"300\",\"amtSum\":300},{\"quantity\":\"2\",\"pricelist\":\"Minute(s) subtitling without timecoding\",\"itemPrice\":\"6\",\"itemTotal\":\"12\",\"amtSum\":12}]', '312.00', '1', 0, '1', '5', '3', '2021-09-02 17:38:00', '2021-09-02 17:41:00', '09-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Icelandic\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/is.png\",\"alt\":\"Iceland\"}', 'In Progress', 'jaimini', '', '312.00', 'Auto', 'ABC56', 'SingleJob -Feedback (FED)', '2021-09-02 17:38:08', '2021-09-15 10:16:57'),
(89, 102, '3', 'Test Account | English (US)-French (France)', '', '[{\"quantity\":\"100\",\"pricelist\":\"% Partial payment\",\"itemPrice\":\"3,25\",\"itemTotal\":\"325\"}]', '325.00', '1', 0, '1', '5', '3', '2021-09-02 18:38:00', '2021-09-02 18:39:00', '09-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"French (France)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/fr.png\",\"alt\":\"France\"}', 'To be Assigned', 'test54', '', '325.00', 'Auto', 'ABC6546', 'SingleJob -Copy writing (COP)', '2021-09-02 18:38:19', '2021-09-02 18:41:09'),
(90, 103, '1', 'Inx | Danish-Estonian', '', '[{\"quantity\":\"10\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"1000\",\"itemTotal\":\"10000\",\"amtSum\":10000}]', '10000.00', '5', 0, '1', '5', '3', '2021-09-06 11:17:00', '2021-09-06 11:28:00', '09-2021', '', '{\"sourceLang\":\"Danish\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/dk.png\",\"alt\":\"Denmark\"}', '{\"sourceLang\":\"Estonian\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/ee.png\",\"alt\":\"Estonia\"}', 'To be Delivered', 'Jaimini.Kanhasoft@gmail.com', '', '10000.00', 'Auto', 'ABC466', 'SingleJob -Batch Delivery (BAD)', '2021-09-06 11:17:08', '2021-10-19 18:37:22'),
(91, 103, '2', 'Inx | Estonian-French (France)', '', '[{\"quantity\":\"2\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"10\",\"itemTotal\":\"20\",\"amtSum\":20}]', '20.00', '1', 0, '1', '5', '3', '2021-09-06 16:29:00', '2021-09-06 16:30:00', '09-2021', '', '{\"sourceLang\":\"Estonian\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/ee.png\",\"alt\":\"Estonia\"}', '{\"sourceLang\":\"French (France)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/fr.png\",\"alt\":\"France\"}', 'In Progress', 'test2', '', '20.00', 'Auto', 'PO6868', 'SingleJob -Copy writing (COP)', '2021-09-06 16:29:42', '2021-09-06 16:31:29'),
(92, 103, '3', 'Inx | English (US)-Swedish', '', '[{\"quantity\":\"20\",\"pricelist\":\"Available price unit\",\"itemPrice\":\"20\",\"itemTotal\":\"400\",\"amtSum\":400}]', '400.00', '5', 0, '1', '5', '3', '2021-09-06 16:29:00', '2021-09-08 16:29:00', '09-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Swedish\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/se.png\",\"alt\":\"Sweden\"}', 'Completed by linguist', 'test', '', '400.00', 'Auto', 'PO98', 'SingleJob -Search Engine Optimization (SEO)', '2021-09-06 16:29:42', '2021-09-06 16:33:17'),
(93, 103, '4', 'Inx | English (US)-Turkish', '', '[{\"quantity\":\"20\",\"pricelist\":\"% Surcharge\",\"itemPrice\":\"100\",\"itemTotal\":\"2000\",\"amtSum\":2000}]', '2000.00', '7', 0, '1', '5', '3', '2021-09-06 16:29:00', '2021-09-16 16:34:00', '09-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Turkish\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/tr.png\",\"alt\":\"Turkey\"}', 'Delivered', 'test6', '', '2000.00', 'Auto', '6757', 'SingleJob -Batch Delivery (BAD)', '2021-09-06 16:29:42', '2021-09-15 10:36:58'),
(94, 103, '5', 'Inx | English (US) - English (US)', '', '', '0.00', '', 0, '1', '', '', '2021-09-06 16:29:42', NULL, '', '', '', '', 'To be Assigned', '', '', '0.00', 'Auto', '', '', '2021-09-06 16:29:42', '2021-09-06 16:29:42'),
(95, 103, '6', 'Inx | English (US)-Finnish', '', '[{\"quantity\":\"200\",\"pricelist\":\"Batch Delivery\",\"itemPrice\":\"1\",\"itemTotal\":\"200\"}]', '200.00', '5', 0, '1', '5', '3', '2021-09-06 16:29:00', '2021-09-06 16:37:00', '09-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Finnish\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/fi.png\",\"alt\":\"Finland\"}', 'Approved', 'Test43', '', '200.00', 'Auto', 'PO890', 'SingleJob -Feedback (FED)', '2021-09-06 16:29:42', '2021-09-06 16:38:02'),
(96, 103, '7', 'Inx | English (US)-Slovenian', '', '[{\"quantity\":\"80\",\"pricelist\":\"Batch Delivery\",\"itemPrice\":\"100\",\"itemTotal\":\"8000\",\"amtSum\":8000}]', '8000.00', '6', 0, '1', '5', '3', '2021-09-06 16:29:00', '2021-09-06 16:38:00', '09-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Slovenian\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/si.png\",\"alt\":\"Slovenia\"}', 'Invoiced', 'Test', '', '8000.00', 'Auto', 'test543', 'SingleJob -test 123 (TEST)', '2021-09-06 16:29:42', '2021-09-06 16:39:23'),
(97, 103, '8', 'Inx | Estonian-English (US)', '', '[{\"quantity\":\"70\",\"pricelist\":\"Batch Delivery\",\"itemPrice\":\"16\",\"itemTotal\":\"1120\",\"amtSum\":1120}]', '1120.00', '5', 0, '1', '5', '3', '2021-09-06 16:29:00', '2021-09-06 16:40:00', '09-2021', '', '{\"sourceLang\":\"Estonian\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/ee.png\",\"alt\":\"Estonia\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'Paid', 'Test', '', '1120.00', 'Auto', 'PO89', 'SingleJob -Search Engine Optimization (SEO)', '2021-09-06 16:29:42', '2021-09-06 16:40:47'),
(98, 103, '9', 'Inx | Icelandic-English (US)', '', '[{\"quantity\":\"100\",\"pricelist\":\"Hour(s) Editing\",\"itemPrice\":\"15\",\"itemTotal\":\"1500\",\"amtSum\":1500}]', '1500.00', '5', 0, '1', '5', '3', '2021-09-06 16:29:00', '2021-09-06 16:41:00', '09-2021', '', '{\"sourceLang\":\"Icelandic\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/is.png\",\"alt\":\"Iceland\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'Without invoice', 'Test', '', '1500.00', 'Auto', 'Test543', 'SingleJob -test 123 (TEST)', '2021-09-06 16:29:42', '2021-09-06 16:42:15');
INSERT INTO `tms_items` (`itemId`, `order_id`, `item_number`, `item_name`, `description`, `price`, `total_price`, `project_type`, `tax`, `contact_person`, `manager`, `coordinator`, `start_date`, `due_date`, `q_date`, `item_language`, `source_lang`, `target_lang`, `item_status`, `item_email_subject`, `amount`, `total_amount`, `auto_status`, `po_number`, `attached_workflow`, `created_date`, `updated_date`) VALUES
(99, 103, '10', 'Inx | English (US)-Slovenian', '', '[{\"quantity\":\"60\",\"pricelist\":\"Page(s) Proofreading\",\"itemPrice\":\"1\",\"itemTotal\":\"60\"}]', '60.00', '6', 0, '1', '5', '3', '2021-09-06 16:29:00', '2021-09-06 16:42:00', '09-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Slovenian\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/si.png\",\"alt\":\"Slovenia\"}', 'Cancelled', 'Tes54', '', '60.00', 'Auto', 'Po868', 'SingleJob -Delivery to client (DTC)', '2021-09-06 16:29:42', '2021-09-06 16:43:21'),
(100, 103, '11', 'Inx | English (US)-Slovenian', '', '[{\"quantity\":\"100\",\"pricelist\":\"Batch Delivery\",\"itemPrice\":\"13.30\",\"itemTotal\":\"133000\",\"amtSum\":133000}]', '133000.00', '6', 0, '1', '5', '3', '2021-09-06 16:29:00', '2021-09-06 16:44:00', '09-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Slovenian\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/si.png\",\"alt\":\"Slovenia\"}', 'Paid', 'Test', '', '133000.00', 'Auto', 'PO', 'SingleJob -Feedback (FED)', '2021-09-06 16:29:42', '2021-09-06 16:44:22'),
(101, 107, '1', 'Test Account | Danish-Estonian', '', '[{\"quantity\":\"10\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"1\",\"itemTotal\":\"10\"},{\"quantity\":\"15\",\"pricelist\":\"Hour(s) Editing\",\"itemPrice\":\"10\",\"itemTotal\":\"150\",\"amtSum\":150}]', '160.00', '5', 0, '1', '1', '3', '2021-09-08 13:46:00', '2021-09-13 10:34:00', '09-2021', '', '{\"sourceLang\":\"Danish\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/dk.png\",\"alt\":\"Denmark\"}', '{\"sourceLang\":\"Estonian\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/ee.png\",\"alt\":\"Estonia\"}', 'To be Delivered', 'test test', '', '160.00', 'Auto', 'PO575', 'SingleJob -Batch Delivery (BAD)', '2021-09-08 13:46:42', '2021-10-18 10:48:54'),
(102, 107, '2', 'Test Account | French (Canada)-Estonian', '', '[{\"quantity\":\"10\",\"pricelist\":\"Page(s) DTP\",\"itemPrice\":\"300\",\"itemTotal\":\"3000\"},{\"quantity\":\"13\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"30\",\"itemTotal\":\"390\",\"amtSum\":390}]', '3390.00', '5', 0, '1', '1', '3', '2021-09-08 13:46:00', '2021-09-13 09:43:00', '09-2021', '', '{\"sourceLang\":\"French (Canada)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/ca.png\",\"alt\":\"Canada\"}', '{\"sourceLang\":\"Estonian\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/ee.png\",\"alt\":\"Estonia\"}', 'To be Delivered', 'At@gmail.com', '', '3390.00', 'Auto', 'PO776868', 'SingleJob -Copy writing (COP)', '2021-09-08 13:46:42', '2021-09-16 13:18:33'),
(103, 113, '1', 'Test Account | English (US)-', '', '[{\"quantity\":\"1\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"1\",\"itemTotal\":\"1\"}]', '1.00', '5', 0, '1', '1', '3', '2021-09-15 10:46:00', '2021-09-15 05:47:00', '09-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/in.png\",\"alt\":\"India\"}', '{\"sourceLang\":\"Hindi\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/in.png\",\"alt\":\"India\"}', 'Approved', 'Test', '', '1.00', 'Auto', 'PO65575', 'SingleJob -Batch Delivery (BAD)', '2021-09-15 10:46:24', '2022-03-24 15:35:20'),
(104, 113, '2', 'Test Account | Danish-', '', '[{\"quantity\":\"10\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"10\",\"itemTotal\":\"100\",\"amtSum\":100}]', '100.00', '5', 0, '1', '1', '3', '2021-09-15 10:46:00', '2021-09-15 05:49:00', '09-2021', '', '{\"sourceLang\":\"Danish\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/dk.png\",\"alt\":\"Denmark\"}', '{\"sourceLang\":\"Hindi\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/in.png\",\"alt\":\"India\"}', 'Approved', 'Test54@gmail.com', '', '100.00', 'Auto', 'PO7686', 'SingleJob -Batch Delivery (BAD)', '2021-09-15 10:46:24', '2022-03-24 15:19:06'),
(105, 61, '2', 'Test Account | English (US) - English (US)', '', '', '0.00', '', 0, '2', '', '', '2021-09-16 16:18:38', NULL, '', '', '', '', 'To be Assigned', '', '', '0.00', 'Auto', '', '', '2021-09-16 16:18:38', '2021-09-16 16:18:38'),
(106, 61, '3', 'Test Account | English (US) - English (US)', '', '', '0.00', '', 0, '2', '', '', '2021-09-16 16:18:38', NULL, '', '', '', '', 'To be Assigned', '', '', '0.00', 'Auto', '', '', '2021-09-16 16:18:38', '2021-09-16 16:18:38'),
(107, 61, '4', 'Test Account | Danish-French (Canada)', '', '[{\"quantity\":\"10\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"1\",\"itemTotal\":\"10\"},{\"quantity\":\"12\",\"pricelist\":\"11-20 QA errors\",\"itemPrice\":\"1\",\"itemTotal\":\"12\"},{\"quantity\":\"100\",\"pricelist\":\"Available price unit 2\",\"itemPrice\":\"1\",\"itemTotal\":\"100\"}]', '122.00', '1', 0, 'aj', '5', '3', '2021-09-16 16:18:00', '2021-09-16 16:23:00', '09-2021', '', '{\"sourceLang\":\"Danish\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/dk.png\",\"alt\":\"Denmark\"}', '{\"sourceLang\":\"French (Canada)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/ca.png\",\"alt\":\"Canada\"}', 'To be Assigned', 'N@gmail.com', '', '122.00', 'Auto', 'Axis8797979', 'SingleJob -Desktop Publishing (DTP)', '2021-09-16 16:18:38', '2021-09-16 16:23:56'),
(108, 114, '1', 'Inx | Estonian-English (US)', '', '[{\"quantity\":\"10\",\"pricelist\":\"Page(s) DTP\",\"itemPrice\":\"300\",\"itemTotal\":\"3000\"},{\"quantity\":\"4\",\"pricelist\":\"Discount - Quality\",\"itemPrice\":\"1\",\"itemTotal\":\"4\"},{\"quantity\":\"15\",\"pricelist\":\"Hour(s) Research\",\"itemPrice\":\"1\",\"itemTotal\":\"15\"}]', '3019.00', '6', 0, '2', '5', '3', '2021-09-16 16:34:00', '2021-09-18 16:35:00', '09-2021', '', '{\"sourceLang\":\"Estonian\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/ee.png\",\"alt\":\"Estonia\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'Delivered', 'N@gmail.com', '', '3019.00', 'Auto', 'PO999', 'SingleJob -Delivery to client (DTC)', '2021-09-16 16:34:46', '2021-09-17 11:24:41'),
(109, 114, '2', 'Inx | English (US) - English (US)', '', '', '0.00', '5', 0, '2', '5', '3', '2021-09-16 17:09:00', '2021-09-17 11:22:00', '09-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'To be Assigned', 'gf', '', '0.00', 'Auto', 'PO686', 'SingleJob -Delivery to client (DTC)', '2021-09-16 17:09:43', '2021-09-17 11:22:28'),
(116, 115, '1', 'Inx | Danish-Hindi', '', '[{\"quantity\":\"10\",\"pricelist\":\"Batch Delivery\",\"itemPrice\":\"1\",\"itemTotal\":\"10\"},{\"quantity\":\"15\",\"pricelist\":\"1-10 QA errors\",\"itemPrice\":\"1\",\"itemTotal\":\"15\"}]', '25.00', '5', 0, '1', '5', '3', '2021-09-17 10:28:00', '2021-09-17 10:30:00', '09-2021', '', '{\"sourceLang\":\"Danish\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/dk.png\",\"alt\":\"Denmark\"}', '{\"sourceLang\":\"Hindi\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/in.png\",\"alt\":\"India\"}', 'To be Assigned', 'N@gmail.com', '', '25.00', 'Auto', 'PO', 'jobChain -', '2021-09-17 10:28:14', '2021-09-20 18:46:32'),
(121, 114, '3', 'Inx | English (US) - English (US)', '', '', '0.00', '', 0, '2', '', '', '2021-09-17 15:20:04', NULL, '', '', '', '', 'To be Assigned', '', '', '0.00', 'Auto', '', '', '2021-09-17 15:20:04', '2021-09-17 15:20:04'),
(122, 114, '4', 'Inx | English (US) - English (US)', '', '', '0.00', '', 0, '2', '', '', '2021-09-17 15:20:04', NULL, '', '', '', '', 'To be Assigned', '', '', '0.00', 'Auto', '', '', '2021-09-17 15:20:04', '2021-09-17 15:20:04'),
(123, 117, '1', 'Test Account | Estonian-French (France)', '', '[{\"quantity\":\"2\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"01\",\"itemTotal\":\"2\",\"amtSum\":2},{\"quantity\":\"23\",\"pricelist\":\"% Surcharge\",\"itemPrice\":\"02\",\"itemTotal\":\"46\",\"amtSum\":46},{\"quantity\":\"5\",\"pricelist\":\"Hour(s) Editing\",\"itemPrice\":\"1\",\"itemTotal\":\"5\"},{\"quantity\":1,\"pricelist\":\"Available price unit 2\",\"itemPrice\":\"1\",\"itemTotal\":\"1\"}]', '54.00', '5', 0, '2', '5', '3', '2021-09-17 16:28:00', '2021-09-22 05:30:00', '09-2021', '', '{\"sourceLang\":\"Estonian\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/ee.png\",\"alt\":\"Estonia\"}', '{\"sourceLang\":\"French (France)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/fr.png\",\"alt\":\"France\"}', 'To be Delivered', 'g', '', '54.00', 'Auto', '21', 'SingleJob -Delivery to client (DTC)', '2021-09-17 16:28:00', '2021-09-20 10:35:18'),
(124, 117, '2', 'Test Account | Catalan-Polish', '', '[{\"quantity\":\"4\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"1\",\"itemTotal\":\"4\"},{\"quantity\":\"7\",\"pricelist\":\"31-40 QA errors\",\"itemPrice\":\"1\",\"itemTotal\":\"7\"}]', '11.00', '1', 0, '2', '5', '3', '2021-09-17 16:28:00', '2021-09-17 16:30:00', '09-2021', '', '{\"sourceLang\":\"Catalan\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/catalonia.png\",\"alt\":\"Catalonia\"}', '{\"sourceLang\":\"Polish\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/pl.png\",\"alt\":\"Poland\"}', 'To be Assigned', 'r', '', '11.00', 'Auto', '786', 'SingleJob -Copy writing (COP)', '2021-09-17 16:28:00', '2021-09-17 16:30:18'),
(125, 119, '1', 'Inx | English (US)-Icelandic', '', '[{\"quantity\":\"4\",\"pricelist\":\"31-40 QA errors\",\"itemPrice\":\"10\",\"itemTotal\":\"40\",\"amtSum\":40},{\"quantity\":\"5\",\"pricelist\":\"Discount - Quality\",\"itemPrice\":\"7\",\"itemTotal\":\"35\",\"amtSum\":35},{\"quantity\":\"20\",\"pricelist\":\"Hour(s) Glossary Creation\",\"itemPrice\":\"1\",\"itemTotal\":\"20\"}]', '95.00', '5', 0, '2', '1', '3', '2021-09-20 10:43:00', '2021-09-20 10:44:00', '09-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Icelandic\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/is.png\",\"alt\":\"Iceland\"}', 'Delivered', 'jaimini test', '', '95.00', 'Auto', 'PO876868', 'SingleJob -Copy writing (COP)', '2021-09-20 10:43:24', '2021-09-20 18:10:09'),
(127, 120, '1', 'Test Account | English (US)-French (France)', '', '[{\"quantity\":\"2\",\"pricelist\":\"Page(s) DTP\",\"itemPrice\":\"300\",\"itemTotal\":\"600\"}]', '600.00', '5', 0, '1', '5', '3', '2021-09-20 10:49:00', '2021-09-20 10:55:00', '09-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"French (France)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/fr.png\",\"alt\":\"France\"}', 'To be Assigned', 'wr', '', '600.00', 'Auto', 'wr', 'SingleJob -Copy writing (COP)', '2021-09-20 10:49:48', '2021-09-20 18:32:39'),
(128, 123, '1', 'Inx | Danish-Icelandic', '', '[{\"quantity\":\"6\",\"pricelist\":\"Page(s) DTP\",\"itemPrice\":\"300\",\"itemTotal\":\"1800\"}]', '1800.00', '5', 0, '1', '1', '3', '2021-09-20 18:28:00', '2021-09-01 18:29:00', '09-2021', '', '{\"sourceLang\":\"Danish\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/dk.png\",\"alt\":\"Denmark\"}', '{\"sourceLang\":\"Icelandic\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/is.png\",\"alt\":\"Iceland\"}', 'To be Assigned', 'jaimini.kanhasoft', '', '1800.00', 'Auto', 'u546546', 'SingleJob -Feedback (FED)', '2021-09-20 18:28:39', '2021-09-20 18:30:26'),
(129, 124, '1', 'Test Account | Danish-French (Canada)', '', '[{\"quantity\":\"2\",\"pricelist\":\"Page(s) DTP\",\"itemPrice\":\"300\",\"itemTotal\":\"600\"}]', '600.00', '5', 0, '2', '5', '3', '2021-09-20 18:48:00', '2021-09-20 18:48:00', '09-2021', '', '{\"sourceLang\":\"Danish\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/dk.png\",\"alt\":\"Denmark\"}', '{\"sourceLang\":\"French (Canada)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/ca.png\",\"alt\":\"Canada\"}', 'To be Assigned', 'test', '', '600.00', 'Auto', 'PO78', 'SingleJob -Delivery to client (DTC)', '2021-09-20 18:48:36', '2021-09-20 18:50:03'),
(130, 125, '1', 'Test Account | English (US)-Hindi', '', '[{\"quantity\":\"4\",\"pricelist\":\"Page(s) DTP\",\"itemPrice\":\"300\",\"itemTotal\":\"1200\"}]', '1200.00', '5', 0, '2', '1', '3', '2021-09-20 18:52:00', '2021-09-20 18:52:00', '09-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/ee.png\",\"alt\":\"Estonia\"}', '{\"sourceLang\":\"Hindi\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/in.png\",\"alt\":\"India\"}', 'Approved', 'dg', '', '1200.00', 'Auto', 'dfg', 'jobChain -', '2021-09-20 18:52:04', '2022-03-25 19:35:34'),
(131, 126, '1', 'Inx | English (US)-French (France)', '', '[{\"quantity\":1,\"pricelist\":\"Page(s) DTP\",\"itemPrice\":\"300\",\"itemTotal\":\"300\"}]', '300.00', '6', 0, '2', '5', '3', '2021-09-20 19:00:00', '2021-09-20 19:00:00', '09-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"French (France)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/fr.png\",\"alt\":\"France\"}', 'To be Assigned', 'sso', '', '300.00', 'Auto', 'Sop sso', 'SingleJob -Desktop Publishing (DTP)', '2021-09-20 19:00:31', '2021-09-20 19:01:07'),
(132, 127, '1', 'Test Account | English (US) - English (US)', '', '[{\"quantity\":\"4\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"1\",\"itemTotal\":\"4\"}]', '4.00', '1', 0, '1', '1', '3', '2021-09-20 19:15:00', '2021-09-20 19:15:00', '09-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'To be Assigned', 'et', '', '4.00', 'Auto', 're', 'SingleJob -Feedback (FED)', '2021-09-20 19:15:38', '2021-09-20 19:15:58'),
(133, 127, '2', 'Test Account | English (US) - English (US)', '', '', '0.00', '', 0, '1', '', '', '2021-09-20 19:15:38', NULL, '', '', '', '', 'To be Assigned', '', '', '0.00', 'Auto', '', '', '2021-09-20 19:15:38', '2021-09-20 19:15:38'),
(134, 128, '1', 'Test Account | English (US) - English (US)', '', '[{\"quantity\":1,\"pricelist\":\"Page(s) DTP\",\"itemPrice\":\"300\",\"itemTotal\":\"300\"}]', '300.00', '5', 0, '1', '1', '3', '2021-09-21 11:11:00', '2021-09-21 11:12:00', '09-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'To be Assigned', 'vcare', '', '300.00', 'Auto', 'Vcare mater1', 'SingleJob -Feedback (FED)', '2021-09-21 11:11:57', '2021-09-21 11:12:40'),
(135, 130, '1', 'Test Account | English (US) - English (US)', '', '[{\"quantity\":\"10\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"01\",\"itemTotal\":\"10\",\"amtSum\":10}]', '10.00', '5', 0, '2', '1', '3', '2021-09-23 18:13:00', '2021-10-01 12:01:00', '10-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'To be Assigned', 'test', '', '10.00', 'Auto', 'PO98', 'SingleJob -Desktop Publishing (DTP)', '2021-09-23 18:13:08', '2021-10-01 12:01:34'),
(136, 130, '2', 'Test Account | English (US) - English (US)', '', '[{\"quantity\":\"5\",\"pricelist\":\"Hour(s) Glossary Creation\",\"itemPrice\":\"10000\",\"itemTotal\":\"50000\",\"amtSum\":50000},{\"quantity\":\"6\",\"pricelist\":\"11-20 QA errors\",\"itemPrice\":\"1\",\"itemTotal\":\"6\"}]', '50006.00', '5', 0, '2', '1', '3', '2021-09-23 18:13:00', '2021-10-01 12:01:00', '10-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'To be Assigned', 'jhi', '', '50006.00', 'Auto', 'pojo', 'SingleJob -Copy writing (COP)', '2021-09-23 18:13:08', '2021-10-01 12:02:06'),
(141, 131, '1', 'Test Account | Estonian-Catalan', '', '[{\"quantity\":\"9\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"10\",\"itemTotal\":\"90\",\"amtSum\":90}]', '90.00', '5', 0, '2', '5', '3', '2021-09-24 10:27:00', '2021-09-24 10:30:00', '09-2021', '', '{\"sourceLang\":\"Estonian\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/ee.png\",\"alt\":\"Estonia\"}', '{\"sourceLang\":\"Catalan\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/catalonia.png\",\"alt\":\"Catalonia\"}', 'To be Assigned', 'Test43', '', '90.00', 'Auto', 'PO5464', 'SingleJob -Delivery to client (DTC)', '2021-09-24 10:27:01', '2021-09-24 10:30:43'),
(152, 135, '1', 'Inx | Estonian-Icelandic', '', '[{\"quantity\":\"5\",\"pricelist\":\"21-30 QA errors\",\"itemPrice\":\"1\",\"itemTotal\":\"5\"},{\"quantity\":\"9\",\"pricelist\":\"Hour(s) Glossary Creation\",\"itemPrice\":\"1\",\"itemTotal\":\"9\"}]', '14.00', '5', 0, '2', '5', '3', '2021-10-01 11:34:00', '2021-10-01 11:44:00', '10-2021', '', '{\"sourceLang\":\"Estonian\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/ee.png\",\"alt\":\"Estonia\"}', '{\"sourceLang\":\"Icelandic\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/is.png\",\"alt\":\"Iceland\"}', 'To be Assigned', 'test', '', '14.00', 'Auto', 'PO768', 'SingleJob -Delivery to client (DTC)', '2021-10-01 11:34:53', '2021-10-01 11:48:13'),
(153, 135, '2', 'Inx | English (US)-Catalan', '', '[{\"quantity\":1,\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"50\",\"itemTotal\":\"50\",\"amtSum\":50},{\"quantity\":\"5\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"300\",\"itemTotal\":\"1500\"}]', '1550.00', '5', 0, '2', '5', '3', '2021-10-01 11:34:00', '2021-10-05 16:21:00', '10-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Catalan\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/catalonia.png\",\"alt\":\"Catalonia\"}', 'To be Assigned', 'test', '', '1550.00', 'Auto', 'PO4564', 'SingleJob -Search Engine Optimization (SEO)', '2021-10-01 11:34:53', '2021-10-05 16:22:09'),
(163, 136, '1', 'Test Account | Danish-English (US)', '', '[{\"quantity\":\"10\",\"pricelist\":\"% Partial payment\",\"itemPrice\":\"3,25\",\"itemTotal\":\"32.5\"},{\"quantity\":\"30\",\"pricelist\":\"Words subtitling with timecoding\",\"itemPrice\":\"1\",\"itemTotal\":\"30\"}]', '62.50', '5', 0, '2', '5', '3', '2021-10-07 15:19:00', '2021-10-09 20:00:00', '10-2021', '', '{\"sourceLang\":\"Danish\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/dk.png\",\"alt\":\"Denmark\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'To be Assigned', 'test', '', '62.50', 'Auto', 'PO987979', 'SingleJob -Copy writing (COP)', '2021-10-07 15:19:58', '2021-10-07 15:21:28'),
(164, 136, '2', 'Test Account | Estonian-Icelandic', '', '[{\"quantity\":\"60\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"60\",\"itemTotal\":\"3600\",\"amtSum\":3600}]', '3600.00', '6', 0, '2', '5', '3', '2021-10-07 15:19:00', '2021-10-08 15:22:00', '10-2021', '', '{\"sourceLang\":\"Estonian\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/ee.png\",\"alt\":\"Estonia\"}', '{\"sourceLang\":\"Icelandic\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/is.png\",\"alt\":\"Iceland\"}', 'To be Assigned', 'Test543', '', '3600.00', 'Auto', 'PO8797', 'jobChain -', '2021-10-07 15:19:58', '2021-10-07 15:22:36'),
(165, 136, '3', 'Test Account | Danish-Norwegian (nynorsk)', '', '[{\"quantity\":\"60\",\"pricelist\":\"Minimum order value\",\"itemPrice\":\"1\",\"itemTotal\":\"60\"}]', '60.00', '7', 0, '2', '5', '3', '2021-10-07 15:19:00', '2021-10-07 15:22:00', '10-2021', '', '{\"sourceLang\":\"Danish\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/dk.png\",\"alt\":\"Denmark\"}', '{\"sourceLang\":\"Norwegian (nynorsk)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned', 'test432', '', '60.00', 'Auto', 'PO98', 'SingleJob -Desktop Publishing (DTP)', '2021-10-07 15:19:58', '2021-10-07 15:23:15'),
(166, 137, '1', 'Test Account | Estonian-French (France)', '', '[{\"quantity\":\"2\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"10\",\"itemTotal\":\"20\",\"amtSum\":20}]', '20.00', '5', 0, '2', '5', '3', '2021-10-07 18:18:00', '2021-10-07 18:18:00', '10-2021', '', '{\"sourceLang\":\"Estonian\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/ee.png\",\"alt\":\"Estonia\"}', '{\"sourceLang\":\"French (France)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/fr.png\",\"alt\":\"France\"}', 'To be Assigned', 'test', '', '20.00', 'Auto', 'PO87', 'SingleJob -Copy writing (COP)', '2021-10-07 18:18:16', '2021-10-07 18:19:00'),
(167, 137, '2', 'Test Account | English (US)-Dutch (Belgium)', '', '[{\"quantity\":\"2\",\"pricelist\":\"% Surcharge\",\"itemPrice\":\"10\",\"itemTotal\":\"20\",\"amtSum\":20}]', '20.00', '6', 0, '2', '5', '3', '2021-10-07 18:18:00', '2021-10-07 18:19:00', '10-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Dutch (Belgium)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/be.png\",\"alt\":\"Belgium\"}', 'To be Assigned', '987', '', '20.00', 'Auto', 'PO', 'SingleJob -Desktop Publishing (DTP)', '2021-10-07 18:18:16', '2021-10-07 18:21:39'),
(168, 138, '1', 'Test Account | English (US) - English (US)', '', '[{\"quantity\":1,\"pricelist\":\"Page(s) DTP\",\"itemPrice\":\"300\",\"itemTotal\":\"300\"},{\"quantity\":1,\"pricelist\":\"Words subtitling with timecoding\",\"itemPrice\":\"1\",\"itemTotal\":\"1\"}]', '301.00', '5', 0, '1', '1', '1,3', '2021-10-08 10:33:00', '2021-10-08 12:22:00', '10-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'Delivered', 'Test54', '', '301.00', 'Auto', 'PO879', 'SingleJob -Delivery to client (DTC)', '2021-10-08 10:33:18', '2021-10-08 12:23:46'),
(169, 138, '2', 'Test Account | English (US) - English (US)', '', '', '0.00', '', 0, '1', '', '', '2021-10-08 17:46:32', NULL, '', '', '', '', 'To be Assigned', '', '', '0.00', 'Auto', '', '', '2021-10-08 17:46:32', '2021-10-08 17:46:32'),
(182, 40, '2', 'Test Account | English (US) - English (US)', '', '', '0.00', '', 0, '1', '', '', '2021-10-11 14:39:47', NULL, '', '', '', '', 'To be Assigned', '', '', '0.00', 'Auto', '', '', '2021-10-11 14:39:47', '2021-10-11 14:39:47'),
(183, 40, '3', 'Test Account | English (US) - English (US)', '', '', '0.00', '', 0, '1', '', '', '2021-10-11 14:39:47', NULL, '', '', '', '', 'To be Assigned', '', '', '0.00', 'Auto', '', '', '2021-10-11 14:39:47', '2021-10-11 14:39:47'),
(185, 40, '5', 'Test Account | English (US) - English (US)', '', '', '0.00', '', 0, '1', '', '', '2021-10-11 14:40:01', NULL, '', '', '', '', 'To be Assigned', '', '', '0.00', 'Auto', '', '', '2021-10-11 14:40:01', '2021-10-11 14:40:01'),
(192, 2, '10', 'Test Account | English (US) - English (US)', '', '', '0.00', '', 0, '1', '', '', '2021-10-11 16:20:43', NULL, '', '', '', '', 'To be Assigned', '', '', '0.00', 'Auto', '', '', '2021-10-11 16:20:43', '2021-10-11 16:20:43'),
(204, 2, '22', 'Test Account | English (US) - English (US)', '', '', '0.00', '', 0, '1', '', '', '2021-10-11 16:21:29', NULL, '', '', '', '', 'To be Assigned', '', '', '0.00', 'Auto', '', '', '2021-10-11 16:21:29', '2021-10-11 16:21:29'),
(206, 139, '1', 'Inx | Estonian-French (Canada)', '', '[{\"quantity\":\"20\",\"pricelist\":\"Hour(s) Style Guide Creation\",\"itemPrice\":\"1\",\"itemTotal\":\"20\"}]', '20.00', '5', 0, '2', '5', '1,3', '2021-10-11 18:22:00', '2021-10-11 18:23:00', '10-2021', '', '{\"sourceLang\":\"Estonian\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/ee.png\",\"alt\":\"Estonia\"}', '{\"sourceLang\":\"French (Canada)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/ca.png\",\"alt\":\"Canada\"}', 'To be Assigned', 'tyyyy', '', '20.00', 'Auto', 'po89', 'jobChain -', '2021-10-11 18:22:54', '2021-10-11 18:23:51'),
(207, 139, '2', 'Inx | French (France)-Swedish', '', '[{\"quantity\":\"60\",\"pricelist\":\"Page(s) DTP\",\"itemPrice\":\"300\",\"itemTotal\":\"18000\"}]', '18000.00', '5', 0, '2', '5', '1,3', '2021-10-11 18:22:00', '2021-10-11 18:24:00', '10-2021', '', '{\"sourceLang\":\"French (France)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/fr.png\",\"alt\":\"France\"}', '{\"sourceLang\":\"Swedish\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/se.png\",\"alt\":\"Sweden\"}', 'To be Assigned', 'test', '', '18000.00', 'Auto', 'PO8979', 'SingleJob -Desktop Publishing (DTP)', '2021-10-11 18:22:54', '2021-10-11 18:24:25'),
(208, 46, '3', 'Test Account | English (US) - English (US)', '', '', '0.00', '', 0, '1', '', '', '2021-10-12 15:58:42', NULL, '', '', '', '', 'To be Assigned', '', '', '0.00', 'Auto', '', '', '2021-10-12 15:58:42', '2021-10-12 15:58:42'),
(209, 140, '1', 'Inx | English (US)-', '', '[{\"quantity\":\"10\",\"pricelist\":\"% Surcharge\",\"itemPrice\":\"10\",\"itemTotal\":\"100\",\"amtSum\":100},{\"quantity\":\"20\",\"pricelist\":\"Discount - Quality\",\"itemPrice\":\"1\",\"itemTotal\":\"20\"}]', '120.00', '5', 0, '1', '5', '1,3', '2021-10-14 10:58:00', '2021-10-14 10:59:00', '10-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/dk.png\",\"alt\":\"Denmark\"}', '{\"sourceLang\":\"Hindi\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/in.png\",\"alt\":\"India\"}', 'To be Assigned', 'test', '', '120.00', 'Auto', 'Po908', 'SingleJob -Copy writing (COP)', '2021-10-14 10:58:15', '2021-10-14 11:58:22'),
(210, 140, '2', 'Inx | Estonian-Norwegian (bokmal)', '', '[{\"quantity\":\"10\",\"pricelist\":\"Page(s) DTP\",\"itemPrice\":\"300\",\"itemTotal\":\"3000\"}]', '3000.00', '5', 0, '1', '5', '1,3', '2021-10-14 10:58:00', '2021-10-14 11:04:00', '10-2021', '', '{\"sourceLang\":\"Estonian\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/ee.png\",\"alt\":\"Estonia\"}', '{\"sourceLang\":\"Norwegian (bokmal)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/no.png\",\"alt\":\"Norway\"}', 'To be Assigned', 'email test', '', '3000.00', 'Auto', 'PO7668', 'SingleJob -Desktop Publishing (DTP)', '2021-10-14 10:58:15', '2021-10-14 11:04:48'),
(211, 141, '1', 'Inx | English (US)-Hindi', '', '[{\"quantity\":\"10\",\"pricelist\":\"11-20 QA errors\",\"itemPrice\":\"1\",\"itemTotal\":\"10\"}]', '10.00', '5', 0, '1', '1', '3', '2021-10-14 15:20:00', '2021-10-14 15:21:00', '10-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Hindi\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/in.png\",\"alt\":\"India\"}', 'To be Assigned', 'test', '', '10.00', 'Auto', 'po', 'SingleJob -Feedback (FED)', '2021-10-14 15:20:24', '2021-10-14 15:24:20'),
(212, 141, '2', 'Inx | English (US)-Hindi', '', '[{\"quantity\":\"90\",\"pricelist\":\"% Surcharge\",\"itemPrice\":\"50\",\"itemTotal\":\"4500\",\"amtSum\":4500}]', '4500.00', '6', 0, '1', '1', '3', '2021-10-14 15:20:00', '2021-10-14 15:25:00', '10-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Hindi\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/in.png\",\"alt\":\"India\"}', 'To be Assigned', 'test', '', '4500.00', 'Auto', 'PO', 'SingleJob -Delivery to client (DTC)', '2021-10-14 15:20:24', '2021-10-14 15:26:37'),
(213, 142, '1', 'Inx | English (US)-Hindi', '', '[{\"quantity\":\"2\",\"pricelist\":\"Page(s) DTP\",\"itemPrice\":\"300\",\"itemTotal\":\"600\"}]', '600.00', '6', 0, '2', '1', '3', '2021-10-18 14:37:00', '2021-10-18 14:37:00', '10-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Hindi\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/in.png\",\"alt\":\"India\"}', 'To be Assigned', 'test65', '', '600.00', 'Auto', 'PO86', 'SingleJob -Batch Delivery (BAD)', '2021-10-18 14:37:06', '2021-10-18 15:10:00'),
(216, 143, '1', 'Test Account | English (US)-Hindi', '', '[{\"quantity\":\"1\",\"pricelist\":\"Words subtitling with timecoding\",\"itemPrice\":\"1\",\"itemTotal\":\"1\"},{\"quantity\":\"2\",\"pricelist\":\"Hour(s) DTP\",\"itemPrice\":\"1\",\"itemTotal\":\"2\"}]', '3.00', '5', 0, '2', '5', '3', '2021-10-19 15:00:00', '2021-10-19 15:01:00', '10-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Hindi\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/in.png\",\"alt\":\"India\"}', 'To be Assigned', 'test', '', '3.00', 'Auto', 'PO', 'SingleJob -Feedback (FED)', '2021-10-19 15:00:10', '2021-10-19 15:03:31'),
(217, 143, '2', 'Test Account | Danish-English (UK)', '', '[{\"quantity\":\"3\",\"pricelist\":\"Page(s) DTP\",\"itemPrice\":\"300\",\"itemTotal\":\"900\"},{\"quantity\":\"4\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"01\",\"itemTotal\":\"4\",\"amtSum\":4}]', '904.00', '7', 0, '2', '5', '3', '2021-10-19 15:00:00', '2021-10-21 15:04:00', '10-2021', '', '{\"sourceLang\":\"Danish\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/dk.png\",\"alt\":\"Denmark\"}', '{\"sourceLang\":\"English (UK)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/gb.png\",\"alt\":\"United Kingdom\"}', 'To be Assigned', 'test', '', '904.00', 'Auto', 'PO98', 'SingleJob -Feedback (FED)', '2021-10-19 15:00:10', '2021-10-19 15:05:15'),
(218, 144, '1', 'Test Account | Danish-Estonian', '', '[{\"quantity\":\"2\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"1\",\"itemTotal\":\"2\"}]', '2.00', '5', 0, '2', '5', '1,3', '2021-10-19 15:41:00', '2021-10-19 15:41:00', '10-2021', '', '{\"sourceLang\":\"Danish\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/dk.png\",\"alt\":\"Denmark\"}', '{\"sourceLang\":\"Estonian\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/ee.png\",\"alt\":\"Estonia\"}', 'To be Assigned', 'test', '', '2.00', 'Auto', 'Test544', 'SingleJob -Feedback (FED)', '2021-10-19 15:41:07', '2021-10-19 15:41:47'),
(219, 145, '1', 'Test Account | English (US)-Hindi', '', '[{\"quantity\":\"2\",\"pricelist\":\"Page(s) DTP\",\"itemPrice\":\"300\",\"itemTotal\":\"600\"},{\"quantity\":\"67\",\"pricelist\":\"Hour(s) Editing\",\"itemPrice\":\"1\",\"itemTotal\":\"67\"}]', '667.00', '5', 0, '1', '1', '3', '2021-10-19 16:59:00', '2021-10-19 17:00:00', '10-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Hindi\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/in.png\",\"alt\":\"India\"}', 'To be Assigned', 'test', '', '667.00', 'Auto', 'PO8979', 'SingleJob -Search Engine Optimization (SEO)', '2021-10-19 16:59:30', '2021-10-19 17:01:27'),
(220, 145, '2', 'Test Account | Danish-Estonian', '', '[{\"quantity\":\"5\",\"pricelist\":\"11-20 QA errors\",\"itemPrice\":\"1\",\"itemTotal\":\"5\"}]', '5.00', '6', 0, '1', '1', '3', '2021-10-19 16:59:00', '2021-10-19 17:00:00', '10-2021', '', '{\"sourceLang\":\"Danish\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/dk.png\",\"alt\":\"Denmark\"}', '{\"sourceLang\":\"Estonian\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/ee.png\",\"alt\":\"Estonia\"}', 'To be Assigned', 'test535', '', '5.00', 'Auto', 'PO9879', 'SingleJob -Search Engine Optimization (SEO)', '2021-10-19 16:59:30', '2021-10-19 17:00:48'),
(221, 145, '3', 'Test Account | Danish-English (UK)', '', '[{\"quantity\":\"20\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"05\",\"itemTotal\":\"100\",\"amtSum\":100},{\"quantity\":\"20\",\"pricelist\":\"11-20 QA errors\",\"itemPrice\":\"1\",\"itemTotal\":\"20\"}]', '120.00', '5', 0, '1', '1', '3', '2021-10-19 17:12:00', '2021-10-19 17:13:00', '10-2021', '', '{\"sourceLang\":\"Danish\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/dk.png\",\"alt\":\"Denmark\"}', '{\"sourceLang\":\"English (UK)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/gb.png\",\"alt\":\"United Kingdom\"}', 'To be Assigned', 'test', '', '120.00', 'Auto', 'PO87', 'SingleJob -Search Engine Optimization (SEO)', '2021-10-19 17:12:44', '2021-10-19 17:13:53'),
(222, 145, '4', 'Test Account | English (US)-Hindi', '', '[{\"quantity\":\"3\",\"pricelist\":\"Page(s) DTP\",\"itemPrice\":\"300\",\"itemTotal\":\"900\"}]', '900.00', '5', 0, '1', '1', '3', '2021-10-19 17:21:00', '2021-10-19 17:21:00', '10-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Hindi\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/in.png\",\"alt\":\"India\"}', 'To be Assigned', '57', '', '900.00', 'Auto', '567', 'SingleJob -Search Engine Optimization (SEO)', '2021-10-19 17:21:05', '2021-10-19 17:21:33'),
(223, 146, '1', 'Test Account | English (US)-Hindi', '', '[{\"quantity\":\"1\",\"pricelist\":\"% Surcharge\",\"itemPrice\":\"10\",\"itemTotal\":\"10\",\"amtSum\":10}]', '10.00', '5', 0, '1', '1', '3', '2021-10-19 18:34:00', '2021-10-19 18:35:00', '10-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Hindi\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/in.png\",\"alt\":\"India\"}', 'To be Assigned', 'sf', '', '10.00', 'Auto', 'test', 'SingleJob -Delivery to client (DTC)', '2021-10-19 18:34:46', '2021-10-19 18:35:11'),
(224, 147, '1', 'Test Account | English (US)-Hindi', '', '[{\"quantity\":\"1\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"506\",\"itemTotal\":\"506\",\"amtSum\":506}]', '506.00', '1', 0, '1', '1', '3', '2021-10-20 10:46:00', '2021-10-20 10:48:00', '10-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Hindi\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/in.png\",\"alt\":\"India\"}', 'To be Assigned', 'test', '', '506.00', 'Auto', 'Po', 'SingleJob -test 123w (TEST)', '2021-10-20 10:46:28', '2021-10-20 14:38:37'),
(225, 147, '2', 'Test Account | Danish-Estonian', '', '[{\"quantity\":\"7\",\"pricelist\":\"Words subtitling with timecoding\",\"itemPrice\":\"1\",\"itemTotal\":\"7\"},{\"quantity\":\"6\",\"pricelist\":\"11-20 QA errors\",\"itemPrice\":\"1\",\"itemTotal\":\"6\"},{\"quantity\":\"4\",\"pricelist\":\"Hour(s) Editing\",\"itemPrice\":\"1\",\"itemTotal\":\"4\"},{\"quantity\":\"8\",\"pricelist\":\"Hour(s) QA\",\"itemPrice\":\"1\",\"itemTotal\":\"8\"}]', '25.00', '1', 0, '1', '1', '3', '2021-10-20 10:46:00', '2021-10-28 10:49:00', '10-2021', '', '{\"sourceLang\":\"Danish\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/dk.png\",\"alt\":\"Denmark\"}', '{\"sourceLang\":\"Estonian\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/ee.png\",\"alt\":\"Estonia\"}', 'To be Assigned', 'test', '', '25.00', 'Auto', 'op', 'SingleJob -Search Engine Optimization (SEO)', '2021-10-20 10:46:28', '2021-10-20 10:49:22'),
(226, 147, '3', 'Test Account | German-', '', '[{\"quantity\":\"1\",\"pricelist\":\"Page(s) DTP\",\"itemPrice\":\"300\",\"itemTotal\":\"300\"}]', '300.00', '5', 0, '1', '1', '3', '2021-10-20 14:26:00', '2021-10-20 14:28:00', '10-2021', '', '{\"sourceLang\":\"German\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/de.png\",\"alt\":\"Germany\"}', '{\"sourceLang\":\"Turkish\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/tr.png\",\"alt\":\"Turkey\"}', 'To be Assigned', 'test', '', '300.00', 'Auto', 'test', 'SingleJob -Feedback (FED)', '2021-10-20 14:26:20', '2021-10-22 14:06:08'),
(228, 147, '5', 'Test Account | English (US) - English (US)', '', '', '0.00', '', 0, '1', '', '', '2021-10-20 14:42:27', NULL, '', '', '', '', 'To be Assigned', '', '', '0.00', 'Auto', '', '', '2021-10-20 14:42:27', '2021-10-20 14:42:27'),
(229, 148, '1', 'Inx | English (US)-Hindi', '', '[{\"quantity\":\"10\",\"pricelist\":\"Page(s) DTP\",\"itemPrice\":\"300\",\"itemTotal\":\"3000\"}]', '3000.00', '1', 0, '1', '5', '3', '2021-11-10 11:28:00', '2021-11-10 11:29:00', '11-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Hindi\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/in.png\",\"alt\":\"India\"}', 'To be Assigned', 'Test Subject', '', '3000.00', 'Auto', 'PO', 'SingleJob -Copy writing (COP)', '2021-11-10 11:28:42', '2021-11-10 11:32:19'),
(230, 148, '2', 'Inx | English (US)-Dutch', '', '[{\"quantity\":\"5\",\"pricelist\":\"% Surcharge\",\"itemPrice\":\"0\",\"itemTotal\":\"\"},{\"quantity\":\"2\",\"pricelist\":\"% Partial payment\",\"itemPrice\":\"3,25\",\"itemTotal\":\"6.5\"}]', '6.50', '5', 0, '1', '5', '3', '2021-11-10 11:28:00', '2021-11-03 11:34:00', '11-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Dutch\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/nl.png\",\"alt\":\"Netherlands\"}', 'To be Assigned', 'test', '', '6.50', 'Auto', 'test', 'SingleJob -Desktop Publishing (DTP)', '2021-11-10 11:28:42', '2021-11-10 11:35:24'),
(233, 149, '1', 'Inx | English (US)-Hindi', '', '[{\"quantity\":\"1\",\"pricelist\":\"% Discount Hour(s) Proofreading\",\"itemPrice\":\"10\",\"itemTotal\":\"10\",\"amtSum\":10}]', '10.00', '1', 0, '1', '1', '3', '2021-11-17 15:26:00', '2021-11-17 15:28:00', '11-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Hindi\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/in.png\",\"alt\":\"India\"}', 'To be Assigned', 'test', '', '10.00', 'Auto', 'test', 'SingleJob -Batch Delivery (BAD)', '2021-11-17 15:26:10', '2021-11-17 15:28:21'),
(234, 151, '1', 'Test Account | English (US)-Hindi', '', '[{\"quantity\":\"1\",\"pricelist\":\"% Discount Page(s) DTP\",\"itemPrice\":\"300\",\"itemTotal\":\"300\"},{\"quantity\":\"2\",\"pricelist\":\"% Discount 11-20 QA errors\",\"itemPrice\":\"1\",\"itemTotal\":\"2\"}]', '302.00', '1', 0, '1', '1', '3', '2021-11-17 17:27:00', '2021-11-17 17:28:00', '11-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Hindi\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/in.png\",\"alt\":\"India\"}', 'To be Assigned', 'test', '', '302.00', 'Auto', 'Test333332', 'SingleJob -Desktop Publishing (DTP)', '2021-11-17 17:27:16', '2021-11-17 17:28:38'),
(235, 151, '2', 'Test Account | English (US)-Dutch', '', '[{\"quantity\":\"2\",\"pricelist\":\"% Discount 31-40 QA errors\",\"itemPrice\":\"1\",\"itemTotal\":\"2\"}]', '2.00', '1', 0, '1', '1', '3', '2021-11-17 17:27:00', '2021-11-17 17:29:00', '11-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Dutch\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/nl.png\",\"alt\":\"Netherlands\"}', 'To be Assigned', '5646', '', '2.00', 'Auto', 'Test', 'SingleJob -Feedback (FED)', '2021-11-17 17:27:16', '2021-11-17 18:12:22'),
(236, 152, '1', 'Test Account | English (US)-Hindi', '', '[{\"quantity\":\"1\",\"pricelist\":\"% Discount 11-20 QA errors\",\"itemPrice\":\"10\",\"itemTotal\":\"10\",\"amtSum\":10}]', '10.00', '1', 0, '1', '1', '1,3', '2021-11-17 18:43:00', '2021-11-17 05:14:00', '11-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Hindi\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/in.png\",\"alt\":\"India\"}', 'To be Assigned', 'test', '', '10.00', 'Auto', 'test', 'SingleJob -Desktop Publishing (DTP)', '2021-11-17 18:43:32', '2021-11-17 18:46:05'),
(237, 155, '1', 'Test Account | English (US)-Hindi', '', '[{\"quantity\":\"2\",\"pricelist\":\"% Discount Available price unit 2\",\"itemPrice\":\"1\",\"itemTotal\":\"2\"}]', '2.00', '1', 0, '1', '1', '3', '2021-11-18 14:36:00', '2021-11-18 14:36:00', '11-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Hindi\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/in.png\",\"alt\":\"India\"}', 'To be Assigned', '45', '', '2.00', 'Auto', '45', 'SingleJob -Desktop Publishing (DTP)', '2021-11-18 14:36:11', '2021-11-18 14:37:02'),
(238, 157, '1', 'Test Account | English (US)-Hindi', '', '[{\"quantity\":\"1\",\"pricelist\":\"Translation Words Translation Repetitions\",\"itemPrice\":\"1\",\"itemTotal\":\"1\"}]', '1.00', '1', 0, '1', '1', '3', '2021-12-08 18:59:00', '2021-12-29 18:59:00', '12-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Hindi\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/in.png\",\"alt\":\"India\"}', 'To be Assigned', 'test', '', '1.00', 'Auto', 'POe45', 'SingleJob -Feedback (FED)', '2021-12-08 18:59:27', '2021-12-13 12:52:16'),
(239, 160, '1', 'Test Account | English (US)-Danish', '', '[{\"quantity\":\"10\",\"pricelist\":\"Translation Words Translation Fuzzy Match\",\"itemPrice\":\"1\",\"itemTotal\":\"10\"},{\"quantity\":\"20\",\"pricelist\":\"Proofreading Words Proofreading 75-84% Match\",\"itemPrice\":\"0,8\",\"itemTotal\":\"16\"}]', '26.00', '1', 0, '1', '5', '1,3', '2021-12-14 18:41:00', '2022-02-05 18:41:00', '02-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Danish\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/dk.png\",\"alt\":\"Denmark\"}', 'To be Assigned', 'fret', '', '26.00', 'Auto', 'PO786', 'jobChain -', '2021-12-14 18:41:12', '2021-12-15 12:23:03'),
(240, 161, '1', 'Test Account | English (US)-Danish', '', '[{\"quantity\":\"1\",\"pricelist\":\"Translation Machine Translation Editing\",\"itemPrice\":\"10\",\"itemTotal\":\"10\",\"amtSum\":10},{\"quantity\":\"2\",\"pricelist\":\"Proofreading Words Proofreading 85-94% Match\",\"itemPrice\":\"0,9\",\"itemTotal\":\"1.8\"}]', '11.80', '1', 0, '1', '1', '3', '2021-12-15 12:08:00', '2021-12-15 12:08:00', '12-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Danish\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/dk.png\",\"alt\":\"Denmark\"}', 'To be Assigned', 'test', '', '11.80', 'Auto', 'Po', 'SingleJob -Copy writing (COP)', '2021-12-15 12:08:13', '2021-12-15 12:08:49'),
(241, 163, '1', 'Test Account | English (US)-Danish', '', '[{\"quantity\":1,\"pricelist\":\"Proofreading Words Proofreading 95-99% Match\",\"itemPrice\":\"3\",\"itemTotal\":\"3\"},{\"quantity\":1,\"pricelist\":\"Proofreading Words Proofreading 100% Match\",\"itemPrice\":\"0,8\",\"itemTotal\":\"0.8\"},{\"quantity\":1,\"pricelist\":\"Proofreading Words Proofreading 50-74% Match\",\"itemPrice\":\"0,6\",\"itemTotal\":\"0.6\"},{\"quantity\":1,\"pricelist\":\"Translation Words Translation 100% Match\",\"itemPrice\":\"0,8\",\"itemTotal\":\"0.8\"}]', '5.20', '5', 0, '1', '1', '3', '2021-12-15 15:59:00', '2021-12-16 16:00:00', '12-2021', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Danish\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/dk.png\",\"alt\":\"Denmark\"}', 'To be Assigned', 'test', '', '5.20', 'Auto', 'Test7567', 'SingleJob -Batch Delivery (BAD)', '2021-12-15 15:59:46', '2021-12-15 16:01:32'),
(242, 165, '1', 'Test Account | English (US)-Hindi', '', '[{\"quantity\":\"1\",\"pricelist\":\"Translation Words Translation 75-84% Match\",\"itemPrice\":\"0,8\",\"itemTotal\":\"0.8\"},{\"quantity\":\"2\",\"pricelist\":\"Translation Words Translation Fuzzy Match\",\"itemPrice\":\"1\",\"itemTotal\":\"2\"}]', '2.80', '1', 0, '1', '1', '3', '2022-01-10 16:58:00', '2022-01-11 23:52:00', '01-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Hindi\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/in.png\",\"alt\":\"India\"}', 'To be Assigned', '22', '', '2.80', 'Auto', '12', 'SingleJob -Batch Delivery (BAD)', '2022-01-10 16:58:24', '2022-01-10 17:07:26'),
(243, 165, '2', 'Test Account | Hindi-English (US)', '', '[{\"quantity\":\"3\",\"pricelist\":\"Proofreading Words Proofreading 85-94% Match\",\"itemPrice\":\"0,9\",\"itemTotal\":\"2.7\"}]', '2.70', '5', 0, '1', '1', '3', '2022-01-10 16:58:00', '2022-01-11 22:59:00', '01-2022', '', '{\"sourceLang\":\"Hindi\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/in.png\",\"alt\":\"India\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'To be Assigned', 'ww', '', '2.70', 'Auto', '12', 'SingleJob -Desktop Publishing (DTP)', '2022-01-10 16:58:24', '2022-01-10 17:26:50');
INSERT INTO `tms_items` (`itemId`, `order_id`, `item_number`, `item_name`, `description`, `price`, `total_price`, `project_type`, `tax`, `contact_person`, `manager`, `coordinator`, `start_date`, `due_date`, `q_date`, `item_language`, `source_lang`, `target_lang`, `item_status`, `item_email_subject`, `amount`, `total_amount`, `auto_status`, `po_number`, `attached_workflow`, `created_date`, `updated_date`) VALUES
(244, 165, '3', 'Test Account | English (US)-Hindi', '', '[{\"quantity\":\"5\",\"pricelist\":\"Translation Minimum Fee\",\"itemPrice\":\"1\",\"itemTotal\":\"5\"}]', '5.00', '5', 0, '1', '1', '3', '2022-01-10 16:58:00', '2022-01-10 16:59:00', '01-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"Hindi\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/in.png\",\"alt\":\"India\"}', 'To be Assigned', 'test', '', '5.00', 'Auto', 'abc', 'SingleJob -Feedback (FED)', '2022-01-10 16:58:24', '2022-01-10 16:59:51'),
(245, 166, '1', 'Test Account | English (US) - English (US)', '', '[{\"quantity\":\"1\",\"pricelist\":\"Translation Words Translation 75-84% Match\",\"itemPrice\":\"0,8\",\"itemTotal\":\"0.8\"}]', '0.80', '1', 0, '1', '5', '3', '2022-02-11 15:55:00', '2022-02-12 15:55:00', '02-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'To be Assigned', 'wada', '', '0.80', 'Auto', 'r', 'SingleJob -Desktop Publishing (DTP)', '2022-02-11 15:55:16', '2022-02-11 15:55:41'),
(246, 167, '1', 'Test Account | English (US) - English (US)', '', '[{\"quantity\":\"10\",\"pricelist\":\"Translation Words Translation 50-74% Match\",\"itemPrice\":\"0,6\",\"itemTotal\":\"6\"},{\"quantity\":\"20\",\"pricelist\":\"Proofreading Words Proofreading 75-84% Match\",\"itemPrice\":\"0,8\",\"itemTotal\":\"16\"}]', '22.00', '1', 0, '1', '1', '3', '2022-03-21 18:05:00', '2022-03-21 18:05:00', '03-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'To be Assigned', 'dfg', '', '22.00', 'Auto', '3424', 'jobChain -', '2022-03-21 18:05:40', '2022-03-21 18:06:13'),
(247, 168, '1', 'Test Account | English (US) - English (US)', '', '[{\"quantity\":\"500\",\"pricelist\":\"Translation Machine Translation Editing\",\"itemPrice\":\"1\",\"itemTotal\":\"500\"}]', '500.00', '5', 0, '1', '1', '3', '2022-03-28 12:33:00', '2022-03-28 12:33:00', '03-2022', '', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', '{\"sourceLang\":\"English (US)\",\"dataNgSrc\":\"assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/us.png\",\"alt\":\"United States\"}', 'Approved', 'test', '', '500.00', 'Auto', 'test', 'SingleJob -Batch Delivery (BAD)', '2022-03-28 12:33:46', '2022-03-28 15:52:28');

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
(13, 'Completed by linguist', 1, '2016-01-20 15:04:34', '2016-01-20 15:04:34'),
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
(2, 'Copy writing', 'COP', 'default', 'assadsad', '2016-01-30 13:01:28', '2018-01-02 17:11:37'),
(3, 'Desktop Publishing', 'DTP', 'project management', 'a', '2016-01-30 13:02:06', '2018-03-01 12:11:09'),
(4, 'Delivery to client', 'DTC', 'automatic', 'hello', '2016-02-02 11:15:16', '2018-01-02 17:11:54'),
(6, 'Feedback', 'FED', 'default', 'test', '2017-03-07 16:25:41', '2018-01-02 17:12:13'),
(7, 'Search Engine Optimization', 'SEO', 'default', 'Start', '2017-08-02 12:55:50', '2018-01-02 17:12:32'),
(8, 'test 123w', 'TEST', '', '', '2021-06-29 16:35:05', '2021-10-08 14:29:58');

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
  `description` varchar(255) NOT NULL,
  `workfolw_status` varchar(255) NOT NULL COMMENT 'workflowcomplete="2,4",unknown="1,3"',
  `sortedJobsJson` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_job_chain`
--

INSERT INTO `tms_job_chain` (`job_chain_id`, `job_name`, `job_status`, `project_type`, `creator`, `customer`, `description`, `workfolw_status`, `sortedJobsJson`, `created_date`, `updated_date`) VALUES
(12, 'Unknown', '', 0, 'TMS Admin', '[]', '', '', '[{\"id\":2}]', '2019-01-02 15:51:55', '2019-01-02 15:53:52'),
(17, 'testChain', '1', 1, 'TMS Admin', '[{\"Cuscode\":\"c\",\"Cusid\":\"1\",\"Cusname\":\"Kanhasoft\"},{\"Cuscode\":\"c\",\"Cusid\":\"2\",\"Cusname\":\"Infosys\"}]', '', '', '[{\"id\":7},{\"id\":8}]', '2019-01-02 19:13:59', '2019-01-10 19:00:18'),
(18, 'test xyz', '1', 2, 'TMS Admin', '[]', '', '', '[]', '2021-06-29 16:32:00', '2021-06-29 16:32:50');

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
(27, 'New year', '2019-01-01 00:00:00', '2019-01-01 23:59:59', '', '2018-07-16 18:28:33', '2018-12-20 16:24:03'),
(28, 'Christmas', '2018-12-25 00:00:00', '2018-12-31 23:59:59', '', '2018-12-20 16:00:25', '2018-12-20 16:21:19');

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

--
-- Dumping data for table `tms_knowledge_news`
--

INSERT INTO `tms_knowledge_news` (`k_news_id`, `k_news_title`, `news_sort_des`, `k_news_description`, `created_user`, `created_date`, `modified_date`) VALUES
(3, 'first News', 'We are delighted that you are interested in work with us – and we are looking forward to welcome you on-board!\nBefore we proceed with registering you in our database, you will need to pass at least one translation test.\nYou will do the translation tests i', 0x3c7461626c6520626f726465723d2230223e3c74626f64792076616c69676e3d22746f70223e3c74723e3c74642076616c69676e3d226d6964646c65223e57656c636f6d6520746f204265436f6e6e656374656421203c696d67207372633d22687474703a2f2f696e7472616e65742e6265636f6e6e65637465642e6e6f2f77702d636f6e74656e742f75706c6f6164732f323031362f30332f3033323231365f313731365f57656c636f6d65312e706e672220616c743d222220636c6173733d2266722d6469692066722d647261676761626c65223e3c62723e266e6273703b3c62723e5765206172652064656c696768746564207468617420796f752061726520696e746572657374656420696e20776f726b207769746820757320266e646173683b20616e6420776520617265206c6f6f6b696e6720666f727761726420746f2077656c636f6d6520796f75206f6e2d626f617264213c62723e4265666f72652077652070726f636565642077697468207265676973746572696e6720796f7520696e206f75722064617461626173652c20796f752077696c6c206e65656420746f2070617373206174206c65617374206f6e65207472616e736c6174696f6e20746573742e3c62723e596f752077696c6c20646f20746865207472616e736c6174696f6e20746573747320696e204d656d6f5120266e646173683b206f7572207365727665722d6261736564207472616e736c6174696f6e20736f6674776172652e3c62723e3c62723e5468697320646f63756d656e742070726f766964657320796f7520776974682067656e6572616c20696e666f726d6174696f6e2061626f7574204d656d6f512c20686f7720746f2075736520616e6420646f776e6c6f61642074686520736f6674776172652c20616e64206f746865722066756e6374696f6e732e3c62723e3c62723e266e6273703b3c62723e3c7374726f6e673e47657474696e6720737461727465642077697468204d656d6f513c2f7374726f6e673e3c62723e496620796f75207061737320796f7572207472616e736c6174696f6e20746573742c20796f752077696c6c206265207265676973746572656420696e206f757220646174616261736520616e642077652077696c6c20737461727420746f2061737369676e206c696e677569737469632070726f6a656374732066726f6d206f757220776f726c647769646520706f7274666f6c696f206f6620636c69656e747320746f20796f752e3c62723e576520757365204d656d6f5120666f7220746865206d616a6f72697479206f66206f75722070726f6a6563747320616e64207468657265666f7265207765207468696e6b20697420697320696d706f7274616e74207468617420796f75206765742066616d696c6961722077697468207468697320736f6674776172652066726f6d2074686520626567696e6e696e672e3c62723e576520616c736f2070726f76696465206d6f62696c65206c6963656e73657320666f72206c696e6775697374732077686f20646f6573206e6f7420686f6c64207468656972206f776e204d656d6f51206c6963656e73652e3c62723e546865206669727374207468696e6720796f75206e65656420746f20646f2c20697320646f776e6c6f6164204d656d6f512c20616e64207468617420796f752063616e20646f2066726f6d203c6120687265663d2268747470733a2f2f7777772e6d656d6f712e636f6d2f646f776e6c6f61647322207461726765743d225f626c616e6b223e686572653c2f613e2e3c62723e596f752073686f756c642063686f6f7365207468652076657273696f6e204d656d6f51205472616e736c61746f722070726f20287768696368206973207468652066697273742076657273696f6e292e20436c69636b206f6e20746865206c696e6b20446f776e6c6f61642e3c62723e5768656e2074686520696e7374616c6c6174696f6e207061636b61676520697320646f776e6c6f616465642c20646f75626c6520636c69636b206f6e207468652066696c6520616e6420666f6c6c6f7720746865206f6e73637265656e20696e737472756374696f6e732e3c656d3e3c62723e3c2f656d3e3c62723e3c656d3e496620796f752068617665204d616320776974686f757420612057696e646f777320646f6e676c6520266e646173683b20706c6561736520696e666f726d20796f7572205265736f75726365207465616d20266e646173683b796f752063616e20776f726b20696e20746865206f6e6c696e652076657273696f6e206f66204d656d6f5120285765625472616e73292e3c62723e3c2f656d3e3c62723e266e6273703b3c62723e3c7374726f6e673e446f776e6c6f6164696e672074686520746573742070726f6a6563743c2f7374726f6e673e3c62723e596f752073686f756c64206861766520726563656976656420616e20656d61696c2066726f6d204d656d6f51204265436f6e6e6563746564207769746820696e666f726d6174696f6e2061626f757420746865207465737420646f63756d656e747320746861742068617665206265656e2061737369676e656420746f20796f752e3c62723e49742073686f756c64206c6f6f6b2073696d696c617220746f20746869733a3c62723e266e6273703b3c62723e3c696d67207372633d22687474703a2f2f696e7472616e65742e6265636f6e6e65637465642e6e6f2f77702d636f6e74656e742f75706c6f6164732f323031362f30332f3033323231365f313731365f57656c636f6d65322e706e672220616c743d222220636c6173733d2266722d6469692066722d647261676761626c65223e3c62723e266e6273703b3c62723e4865726520796f752077696c6c207365652074686520646f63756d656e747320746861742068617665206265656e2061737369676e656420746f20796f752c20746865205365727665722055524c2c20796f757220757365726e616d6520616e6420746865206e616d65206f66207468652070726f6a6563742028546573742050726f6a65637420266e646173683b204265436f6e6e6563746564292e3c62723e596f752077696c6c20616c736f207365652074686520646561646c696e652028746865206461746520616e642074696d6520746865207472616e736c6174696f6e2073686f756c6420626520636f6d706c657465642062792920696e207265642e3c62723e596f752077696c6c2066696e642061206c696e6b20746f207472616e736c617465206469726563746c7920696e20796f7572207765622062726f777365722077697468205765625472616e732c20696e206361736520796f752070726566657220746f207472616e736c617465206f6e6c696e65206f7220796f7520686176652061204d41432e20506c65617365206e6f74652074686174207765207374726f6e676c792061647669736520796f75206e6f7420746f20776f726b206f6e6c696e652061732074686520514120636865636b65727320696e20746865207765622076657273696f6e20617265206c696d697465642e3c62723e266e6273703b3c62723e3c7374726f6e673e486f7720746f20776f726b206f6e20616e206f6e6c696e652070726f6a65637420776974682073657276657220646f63756d656e74733c62723e3c2f7374726f6e673e3c62723e3c2f74643e3c2f74723e3c74723e3c74643e596f75722070726f6a656374206d616e616765722077696c6c2073657420757020616e206f6e6c696e652070726f6a65637420776865726520796f75207061727469636970617465206173206569746865722061207472616e736c61746f72206f7220612070726f6f667265616465722e20546869732061727469636c652064657363726962657320686f7720746f2067657420737461727465642c20706572666f726d2c20616e642064656c6976657220796f757220776f726b20696e20616e206f6e6c696e652070726f6a6563742073657474696e672e3c62723e3c62723e266e6273703b3c62723e3c6120687265663d226a617661736372697074253341484d546f67676c652827746f67676c65272c27544f47474c453031383641312729223e3c7374726f6e673e5374617274696e672074686520776f726b3a20436865636b696e67206f757420616e206f6e6c696e652070726f6a6563743c2f7374726f6e673e3c2f613e3c7374726f6e673e3c62723e3c2f7374726f6e673e3c62723e3c62723e3c62723e3c7461626c6520626f726465723d2230223e3c74626f64792076616c69676e3d22746f70223e3c74723e3c74643e546f2061636365737320616e206f6e6c696e652070726f6a6563742c20796f75206e65656420746865204d656d6f51207472616e736c61746f722070726f2065646974696f6e2e20596f7520616c736f206e6565642061206e6574776f726b20636f6e6e656374696f6e20616e6420612075736572206163636f756e7420746f206f7572204d656d6f51207365727665722e3c62723e3c62723e266e6273703b3c62723e5768656e20796f75722070726f6a656374206d616e616765722061737369676e7320796f752061207461736b20696e20616e206f6e6c696e652070726f6a6563742c20796f752077696c6c207265636569766520616e20656d61696c2066726f6d204d656d6f5120776974682074686520666f6c6c6f77696e672064657461696c732e3c62723e3c62723e54686520736572766572206164647265737320746f20746865204d656d6f512073657276657220686f7374696e67207468652070726f6a656374202839312e3233302e3233302e323532292c20796f757220757365726e616d6520616e64207468652070726f6a656374206e616d652e3c62723e3c62723e266e6273703b3c62723e546f20737461727420776f726b696e67207769746820616e206f6e6c696e652070726f6a6563742c20666f6c6c6f77207468652073746570732062656c6f772e3c62723e3c62723e266e6273703b3c62723e3c62723e3c62723e3c7461626c6520626f726465723d2230223e3c74626f64792076616c69676e3d22746f70223e3c74723e3c74642076616c69676e3d22626f74746f6d223e2e3c62723e3c2f74643e3c74642076616c69676e3d22626f74746f6d223e46726f6d207468652050726f6a656374206d656e752c2063686f6f736520436865636b206f75742046726f6d205365727665722e3c62723e3c62723e266e6273703b3c62723e3c696d67207372633d22687474703a2f2f696e7472616e65742e6265636f6e6e65637465642e6e6f2f77702d636f6e74656e742f75706c6f6164732f323031362f30332f3033323231365f313731365f57656c636f6d65332e706e672220616c743d222220636c6173733d2266722d6469692066722d647261676761626c65223e3c62723e3c62723e266e6273703b3c62723e54686520436865636b206f75742066726f6d20736572766572206469616c6f672077696c6c206f70656e2e20547970652074686520736572766572206164647265737320696e20746865205365727665722055524c20626f7820616e6420636c69636b2053656c6563742e3c62723e3c62723e3c696d67207372633d22687474703a2f2f696e7472616e65742e6265636f6e6e65637465642e6e6f2f77702d636f6e74656e742f75706c6f6164732f323031362f30332f3033323231365f313731365f57656c636f6d65342e706e672220616c743d222220636c6173733d2266722d6469692066722d647261676761626c65223e3c62723e3c62723e3c2f74643e3c2f74723e3c74723e3c74642076616c69676e3d22626f74746f6d223e266e6273703b3c2f74643e3c74642076616c69676e3d22626f74746f6d223e266e6273703b3c2f74643e3c2f74723e3c2f74626f64793e3c2f7461626c653e3c7461626c6520626f726465723d2230223e3c74626f64792076616c69676e3d22746f70223e3c74723e3c74642076616c69676e3d22626f74746f6d223e266e6273703b3c2f74643e3c74642076616c69676e3d22626f74746f6d223e5468652066697273742074696d6520796f7520636f6e6e65637420746f206f7572207365727665722c20796f75206861766520746f206c6f6720696e207769746820796f757220757365726e616d6520616e642070617373776f726420746f206765742061636365737320746f2070726f6a656374732e20596f752077696c6c20626520636f6e6e656374656420746f20746865204d656d6f51207365727665722c20616e642061206c697374206f6620746865206f6e6c696e652070726f6a6563747320796f75206172652061737369676e656420746f2077696c6c20646973706c61792e3c62723e3c62723e3c2f74643e3c2f74723e3c74723e3c74642076616c69676e3d22626f74746f6d223e266e6273703b3c2f74643e3c74642076616c69676e3d22626f74746f6d223e496e207468652070726f6a656374206c6973742c20636c69636b206f6e207468652070726f6a65637420796f752077616e7420746f20776f726b206f6e2c20616e64207468656e20436865636b206f75742070726f6a6563742e204d656d6f512077696c6c20646f776e6c6f61642074686520646f63756d656e74732c20616e79206c69676874207265736f75726365732c20636f6e6e65637420746f204c697665446f637320636f72706f72612c207472616e736c6174696f6e206d656d6f726965732c20616e6420746865207465726d20626173657320666f72207468652070726f6a6563742e3c62723e3c62723e266e6273703b3c62723e3c696d67207372633d22687474703a2f2f696e7472616e65742e6265636f6e6e65637465642e6e6f2f77702d636f6e74656e742f75706c6f6164732f323031362f30332f3033323231365f313731365f57656c636f6d65352e706e672220616c743d222220636c6173733d2266722d6469692066722d647261676761626c65223e3c62723e3c2f74643e3c2f74723e3c2f74626f64793e3c2f7461626c653e266e6273703b3c62723e3c7374726f6e673e496d706f7274616e743c2f7374726f6e673e3a205768656e20796f752061726520636865636b696e67206f757420616e206f6e6c696e652070726f6a6563742c204d656d6f512077696c6c206372656174652061206c6f63616c20636f7079206f66207468652070726f6a65637420266e646173683b2070726163746963616c6c792c2061206c6f63616c2070726f6a65637420266e646173683b206f6e20796f757220636f6d70757465722e20546865206c6f63616c20636f70792077696c6c2073796e6368726f6e697a65207769746820746865206d617374657220636f7079206f6e20746865207365727665722e204d656d6f512077696c6c206f6e6c7920646f776e6c6f616420646f63756d656e74732074686174206172652061737369676e656420746f20796f752e3c62723e266e6273703b3c62723e3c7374726f6e673e5469703c2f7374726f6e673e3a20596f752063616e2072656e616d6520746865206c6f63616c20636f7079206f66207468652070726f6a6563743a2061667465722073656c656374696e6720746865206f6e6c696e652070726f6a65637420696e20746865206c6973742c206368616e676520746865206e616d65206f6620746865206c6f63616c2070726f6a6563742061742074686520626f74746f6d206f662074686520266c6471756f3b436865636b206f7574206f6e6c696e652070726f6a65637426726471756f3b206469616c6f672e2054686973206d696768742062652075736566756c207768656e20796f75206e65656420746f20636865636b206f757420616e206f6e6c696e652070726f6a656374206d756c7469706c652074696d65732e3c62723e3c2f74643e3c2f74723e3c2f74626f64793e3c2f7461626c653e266e6273703b3c62723e3c6120687265663d226a617661736372697074253341484d546f67676c652827746f67676c65272c27544f47474c453031383641322729223e3c7374726f6e673e576f726b696e67206f6e206120646f63756d656e7420696e20616e206f6e6c696e652070726f6a6563743c2f7374726f6e673e3c2f613e3c7374726f6e673e3c62723e3c2f7374726f6e673e3c62723e3c62723e3c62723e3c7461626c6520626f726465723d2230223e3c74626f64792076616c69676e3d22746f70223e3c74723e3c74643e266e6273703b3c62723e596f752068617665206a75737420636865636b6564206f757420796f7572204d656d6f512070726f6a6563742c20616e6420796f752073686f756c64206e6f772073656520612077696e646f772077697468207468652070726f6a65637420616e6420616c6c2066696c65732061737369676e656420746f20796f752e3c62723e266e6273703b3c62723e3c696d67207372633d22687474703a2f2f696e7472616e65742e6265636f6e6e65637465642e6e6f2f77702d636f6e74656e742f75706c6f6164732f323031362f30332f3033323231365f313731365f57656c636f6d65362e706e672220616c743d222220636c6173733d2266722d6469692066722d647261676761626c65223e3c62723e266e6273703b3c62723e496e20746865205472616e736c6174696f6e207461622c20796f75207365652074686520646f63756d656e74732061737369676e656420746f20796f7520266e646173683b20746865736520617265207468652066696c657320796f752061726520676f696e6720746f207472616e736c6174652e3c62723e266e6273703b3c62723e446f75626c6520636c69636b20746f206f70656e2074686520646f63756d656e7420796f752077616e7420746f207472616e736c6174652e3c62723e49742077696c6c206f70656e20696e20612073657061726174652077696e646f772e3c62723e417320796f752063616e207365652c20697426727371756f3b73206469766964656420696e207365676d656e747320616e642065616368207365676d656e74206861732061206e756d6265722e3c62723e4f6e20746865206c65667420736964652c20776520686176652074686520736f7572636520616e64206f6e2074686520726967687420736964652c2077652068617665207468652074617267657420287472616e736c6174696f6e2920266e646173683b203c656d3e7365652073637265656e73686f742062656c6f773c2f656d3e2e3c62723e3c696d67207372633d22687474703a2f2f696e7472616e65742e6265636f6e6e65637465642e6e6f2f77702d636f6e74656e742f75706c6f6164732f323031362f30332f3033323231365f313731365f57656c636f6d65372e706e672220616c743d222220636c6173733d2266722d6469692066722d647261676761626c65223e3c62723e266e6273703b3c62723e53686f7274206578706c616e6174696f6e20746f2074686520706963747572652061626f76653a3c62723e4c6566743a20536f7572636520746578743c62723e52696768743a20546172676574207465787420287472616e736c6174696f6e293c62723e30253a20546865206d61746368202520696e20746865205472616e736c6174696f6e204d656d6f72792028544d293c62723e5479706520796f7572207472616e736c6174696f6e20696e20746865207269676874207365676d656e7420616e6420636c69636b204354524c202b20454e54455220746f20636f6e6669726d20746865207472616e736c6174696f6e2e3c62723e54686520677265792077696e646f772077696c6c207468656e207475726e20696e746f20677265656e20616e6420746865207472616e736c6174696f6e20696e20746865207365676d656e7420697320636f6e6669726d65642e3c62723e266e6273703b3c62723e3c696d67207372633d22687474703a2f2f696e7472616e65742e6265636f6e6e65637465642e6e6f2f77702d636f6e74656e742f75706c6f6164732f323031362f30332f3033323231365f313731365f57656c636f6d65382e706e672220616c743d222220636c6173733d2266722d6469692066722d647261676761626c65223e3c7374726f6e673e2d2667743b3c2f7374726f6e673e3c62723e3c696d67207372633d22687474703a2f2f696e7472616e65742e6265636f6e6e65637465642e6e6f2f77702d636f6e74656e742f75706c6f6164732f323031362f30332f3033323231365f313731365f57656c636f6d65392e706e672220616c743d222220636c6173733d2266722d6469692066722d647261676761626c65223e3c62723e266e6273703b3c62723e4d656d6f512077696c6c206175746f6d61746963616c6c79206a756d7020746f20746865206e657874207365676d656e74207768656e20796f7520636f6e6669726d2061207365676d656e742e3c62723e496620796f7520636f6d65206163726f737320612066757a7a79206d61746368202877686572652074686572652061726520736f6d652073696d696c6172697469657320746f20746865205472616e736c6174696f6e204d656d6f72792c20746865207365676d656e74207374617475732077696c6c206c6f6f6b206c696b6520746869733a3c62723e266e6273703b3c62723e3c696d67207372633d22687474703a2f2f696e7472616e65742e6265636f6e6e65637465642e6e6f2f77702d636f6e74656e742f75706c6f6164732f323031362f30332f3033323231365f313731365f57656c636f6d6531302e706e672220616c743d222220636c6173733d2266722d6469692066722d647261676761626c65223e3c62723e266e6273703b3c62723e496e207468652077696e646f77206f6e2074686520726967687420736964652c2074686520544d2077696e646f772c20796f752063616e20736565207768617420697320646966666572656e74206265747765656e207468652066757a7a79206d6174636820616e6420746865207472616e736c6174696f6e206d656d6f727920266e646173683b2077686174206e6565647320746f206265206368616e6765642f61646465642f64656c657465642f757064617465642e3c62723e266e6273703b3c62723e3c696d67207372633d22687474703a2f2f696e7472616e65742e6265636f6e6e65637465642e6e6f2f77702d636f6e74656e742f75706c6f6164732f323031362f30332f3033323231365f313731365f57656c636f6d6531312e706e672220616c743d222220636c6173733d2266722d6469692066722d647261676761626c65223e3c62723e266e6273703b3c62723e417320313420697320696e203c7374726f6e673e424c55453c2f7374726f6e673e2c206974206d65616e732074686174207468697320776f726420697320616e206164646974696f6e2e3c62723e49662074686572652061726520776f72647320696e203c7374726f6e673e5245443c2f7374726f6e673e2c206974206d65616e732069742077617320736f6d657468696e6720686173206265656e2072656d6f7665642e3c62723e536f206368616e676520746865207472616e736c6174696f6e206163636f7264696e676c7920616e64206163636f7264696e6720746f207468652070726573656e7420736f7572636520746578742c20616e64207468656e20636f6e6669726d20746865207365676d656e742e3c62723e546865726520617265206f6674656e207461677320696e20646966666572656e74207365676d656e74732e205461677320757375616c6c7920726570726573656e747320666f6e742074797065732c20626f6c642074657874206f72206f7468657220666f726d617474696e672e3c62723e54686573652073686f756c6420616c7761797320626520636f7069656420696e2074686520746172676574207365676d656e7420616e6420706c61636564206163636f7264696e6720746f20776865726520697420697320696e2074686520736f757263652e3c62723e596f752063616e20636f7079207468652077686f6c6520736f75726365207365676d656e7420746f2074686520746172676574207365676d656e7420627920636c69636b696e67206f6e204354524c202b205348494654202b20532e3c62723e496e2074686520626f74746f6d206261722c20796f752063616e20747261636b20796f752070726f67726573732e2054523a2025206973207468652070657263656e7461676520796f75206861766520636f6d706c657465643a3c62723e266e6273703b3c62723e3c696d67207372633d22687474703a2f2f696e7472616e65742e6265636f6e6e65637465642e6e6f2f77702d636f6e74656e742f75706c6f6164732f323031362f30332f3033323231365f313731365f57656c636f6d6531322e706e672220616c743d222220636c6173733d2266722d6469692066722d647261676761626c65223e3c62723e266e6273703b3c62723e436f6d706c6574656420616c6c20746865207365676d656e747320666f72207472616e736c6174696f6e2c20756e74696c207468652070726f677265737320697320313030252e3c62723e266e6273703b3c62723e3c7374726f6e673e5468657265206973206120636f75706c65206f66207468696e677320796f752073686f756c6420646f206265666f726520796f752064656c6976657220796f7572207472616e736c6174696f6e733c62723e3c2f7374726f6e673e3c62723e496e20746865207472616e736c6174696f6e20766965772c20636c69636b206f6e2074686520446f63756d656e7473207461622e2043686f6f7365204578706f727420616e6420636c69636b204578706f727420286469616c6f67292e3c62723e536176652074686520646f63756d656e74206f6e20796f7572206465736b746f702e3c62723e4f70656e2074686520646f63756d656e747320796f75207361766564206f6e20796f7572206465736b746f7020616e6420636865636b20796f7572207472616e736c6174696f6e20696e20746865206f726967696e616c20646f63756d656e742e3c62723e4865726520796f752063616e2070726f6f667265616420796f7572206f776e207472616e736c6174696f6e206173206120636f6d706c65746520746578742e3c62723e496620796f752066696e6420616e797468696e6720746f206368616e67652c2066696e6420746865207365676d656e7420696e204d656d6f512c206d616b6520746865206368616e67657320616e6420636c69636b204354524c202b20454e54455220746f20636f6e6669726d20746865206368616e67652e3c62723e266e6273703b3c62723e486176652061206c6f6f6b206174207468652074776f206e6578742073656374696f6e7320746f2073656520686f7720796f752072756e20514120616e64207370656c6c20636865636b20696e204d656d6f51206265666f726520796f752064656c69766572207468652066696e616c20646f63756d656e742e3c62723e266e6273703b3c62723e496620796f752077616e7420746f20686176652061206c6f6f6b206174204d656d6f5126727371756f3b73206f776e20717569636b2067756964652c20636865636b206974206f7574203c6120687265663d2268747470733a2f2f7777772e6d656d6f712e636f6d2f6c6561726e2f6775696465732d616e642d766964656f732f7472616e736c61746f727322207461726765743d225f626c616e6b223e68657265266e6273703b3c2f613e2e3c62723e3c2f74643e3c2f74723e3c2f74626f64793e3c2f7461626c653e266e6273703b3c62723e3c7374726f6e673e5175616c697479204173737572616e6365202851412920696e204d656d6f513c62723e3c2f7374726f6e673e3c62723e4265666f726520796f752064656c6976657220796f7572207472616e736c6174696f6e20696e204d656d6f512c20796f752073686f756c642072756e20514120636865636b20285175616c697479204173737572616e63652920746f206d616b65207375726520796f752068617665206e6f74206d697373656420616e7920746167732c20737061636573206f72206f74686572206973737565732e3c62723e266e6273703b3c62723e546f2072756e2051412c20646f2074686520666f6c6c6f77696e673a3c62723e496e7369646520746865207472616e736c6174696f6e20766965772c20636c69636b206f6e20746865205072657061726174696f6e3c62723e7461622e3c62723e436c69636b206f6e205175616c697479204173737572616e636520616e642063686f6f73652052756e2051412e3c62723e4d616b65207375726520266c6471756f3b41637469766520646f63756d656e7426726471756f3b2069732063686f73656e2c20616e6420266c6471756f3b4372656174652076696577206f6620696e636f6e73697374656e74207472616e736c6174696f6e7326726471756f3b2061726520636865636b65642c20616e6420636c69636b204f4b2e3c62723e266e6273703b3c62723e54686520266c6471756f3b5265736f6c7665206572726f727320616e64207761726e696e677326726471756f3b206469616c6f67202874686520514120726573756c74292077696c6c206f70656e20696e20612073657061726174652077696e646f772e3c62723e496620746865207265706f727420697320656d7074792c20796f752063616e206a75737420636c6f7365207468652077696e646f772e3c62723e496620746865726520617265206572726f72732f7761726e696e672c20796f752063616e2065697468657220636f7272656374207468656d206f72206d61726b207468656d2061732069676e6f72652e3c62723e596f752063616e20636f727265637420746865206572726f7273206469726563746c7920696e2074686520266c6471756f3b5265736f6c7665206572726f727320616e64207761726e696e677326726471756f3b2077696e646f772c206279206d616b696e6720746865206368616e67657320696e207468652074617267657420626f7820616e6420636c69636b204354524c202b20454e54455220746f20636f6e6669726d20746865206368616e67652e3c62723e5768656e20796f75207468696e6b20796f752061726520646f6e652077697468207468652051412c20636c69636b2074686520627574746f6e205265667265736820646174612c20746f206d616b65207375726520796f7520646964206e6f74206d69737320616e79206572726f72732f7761726e696e67732e3c62723e436c6f736520746865205265736f6c7665206572726f727320616e64207761726e696e67732077696e646f772e3c62723e266e6273703b3c62723e3c7374726f6e673e5370656c6c20636865636b696e6720696e204d656d6f513c62723e3c2f7374726f6e673e3c62723e4c6173742c20627574206e6f74206c656173742c20796f752073686f756c642072756e2061207370656c6c20636865636b20696e204d656d6f51206265666f726520796f752064656c6976657220796f7572207472616e736c6174696f6e2e3c62723e546f2072756e207370656c6c20636865636b206f6e2074686520646f63756d656e74732c20636c69636b2046372f4354524c202b204637207768696c652074686520646f63756d656e74206973206f70656e20666f72207472616e736c6174696f6e2e3c62723e546f206d616b65207375726520796f7572207370656c6c20636865636b657220697320776f726b696e6720636f72726563746c7920696e204d656d6f512c20646f2074686520666f6c6c6f77696e673a3c62723e436c69636b206f6e20746865204d656d6f512074616220616e642063686f6f7365204f7074696f6e732e20596f752077696c6c20676574207468726565206e65772063686f696365732c20616e6420796f752073686f756c642063686f6f736520266c6471756f3b4f7074696f6e7326726471756f3b20756e646572204d656d6f51204f7074696f6e732e3c62723e41206e65772077696e646f772077696c6c206f70656e2e3c62723e476f20746f20266c6471756f3b5370656c6c696e6720616e64206772616d6d617226726471756f3b20616e64206d616b65207375726520266c6471756f3b5370656c6c696e6720617320796f75207479706526726471756f3b20697320636865636b65642e3c62723e496e207468652064726f7020646f776e206c6973742c2063686f6f736520796f757220746172676574206c616e67756167652c206d616b65207375726520746865206f7074696f6e7320666f7220266c6471756f3b4d6963726f736f667420576f726426726471756f3b20697320636865636b656420666f7220626f7468206f7074696f6e732c20616e6420636c69636b204170706c792e3c62723e436c69636b204f4b20616e6420636c6f7365207468652077696e646f772e3c62723e266e6273703b3c62723e3c7374726f6e673e44656c69766572696e672070726f6a65637420696e204d656d6f513c62723e3c2f7374726f6e673e3c62723e5768656e20796f75206861766520636f6d706c6574656420746865207472616e736c6174696f6e2c20514120616e64207370656c6c20636865636b20696e204d656d6f512c2069742069732074696d6520746f2064656c6976657220616e642072657475726e207468652070726f6a6563742e3c62723e266e6273703b3c62723e496e207468652046696c6520766965772c206d61726b2074686520636f6d706c6574656420646f63756d656e74732028757365204354524c20746f206d61726b206d756c7469706c6520646f63756d656e7473292e3c62723e436c69636b206f6e207468652044656c697665722f52657475726e20627574746f6e2e3c62723e266e6273703b3c62723e3c696d67207372633d22687474703a2f2f696e7472616e65742e6265636f6e6e65637465642e6e6f2f77702d636f6e74656e742f75706c6f6164732f323031362f30332f3033323231365f313731365f57656c636f6d6531332e706e672220616c743d222220636c6173733d2266722d6469692066722d647261676761626c65223e3c62723e266e6273703b3c62723e596f752073686f756c64206e6f7720736565206120636865636b206d61726b206e65787420746f207468652066696c65206e616d65732c20776869636820636f6e6669726d732074686174207468652070726f6a6563742069732064656c6976657265642e3c62723e496620796f752067657420616e79206572726f72206d657373616765732c20666f6c6c6f7720746865206f6e73637265656e2068656c7020746f20736f6c7665207468656d2c20616e64207468656e2064656c6976657220616761696e2e3c62723e266e6273703b3c62723e3c7374726f6e673e46696e616c20776f7264732066726f6d204265436f6e6e65637465643c2f7374726f6e673e3c62723e506c65617365206265617220696e206d696e642074686174206e6f20696e737472756374696f6e73206f72207465726d696e6f6c6f67792069732070726f766964656420666f722074657374207472616e736c6174696f6e732c20616e6420796f75206861766520746f2075736520796f75722062657374206a7564676d656e742e3c62723e266e6273703b3c62723e5768656e207468652074657374207472616e736c6174696f6e20697320636f6d706c657465642c206f6e65206f66206f7572207265766965776572732077696c6c206576616c7561746520697420616e642074686520726573756c742077696c6c20626520636f6d6d756e69636174656420746f20796f752077697468696e20612066657720646179732061667465722064656c69766572792e3c62723e266e6273703b3c62723e496620796f75206861766520616e79207175657374696f6e732c20706c6561736520636f6e74616374203c6120687265663d226d61696c746f3a776f726b406265636f6e6e65637465642e6e6f223e776f726b406265636f6e6e65637465642e6e6f3c2f613e206f7220796f7572205265736f7572636520436f6f7264696e61746f722e3c62723e266e6273703b3c62723e3c7374726f6e673e5765207769736820796f75207468652062657374206f66206c75636b213c7370616e3e266e6273703b3c2f7370616e3e4a3c2f7374726f6e673e3c2f74643e3c2f74723e3c2f74626f64793e3c2f7461626c653e, 'TMS Admin', '2016-09-19 16:54:29', '2018-04-30 12:32:57'),
(4, 'TOP TEN MOMENTS OF #LIBERTYFORUM2016', 'Every year Liberty Forum inspires and rejuvenates the individuals in the worldwide freedom movement, and this past weekend was more inspirational than ever. More than anything,', 0x3c703e45766572792079656172204c69626572747920466f72756d20696e73706972657320616e642072656a7576656e617465732074686520696e646976696475616c7320696e2074686520776f726c64776964652066726565646f6d206d6f76656d656e742c20616e6420746869732070617374207765656b656e6420776173206d6f726520696e737069726174696f6e616c207468616e20657665722e204d6f7265207468616e20616e797468696e672c2074686572652077617320612070616c7061626c6520636f6e6e65637465646e65737320616d6f6e67206f757220706172746e6572732c206f757220737570706f72746572732c20616e6420766172696f757320667269656e647320616e642066616d696c79206d656d626572732e205769746820353820636f756e747269657320726570726573656e7465642c204c69626572747920466f72756d20776173206a616d207061636b656420776974682074686520656e65726779206f6620746865204a6f686e20426c756e64656c6c20456c657661746f7220506974636820436f6d7065746974696f6e2c2074686520656d6f74696f6e73206f6620746865204c69676874732c2043616d6572612c204c696265727479212046696c6d20466573746976616c2c2074686520696e737069726174696f6e2066726f6d2074686520627265616b6f75742073657373696f6e732c2074686520636f756e746c65737320706572736f6e616c206d6f6d656e7473206265747765656e206f6c6420667269656e647320616e64206e65772c20616e6420736f206d756368206d6f72652e205468657265206973206e6f2077617920746f207472756c7920636170747572652065766572797468696e6720746861742068617070656e656420696e206f6e652073756d6d6172792c20736f20696e737465616420776520636f6d70696c65642061206c697374206f66206f757220746f70203130206661766f72697465206d6f6d656e747320746f206769766520796f75206120676c696d70736520696e73696465207468697320796561722661706f733b73204c69626572747920466f72756d2e3c2f703e, 'Dhaval Joshi', '2016-09-27 15:46:19', '2016-12-02 17:50:32'),
(5, 'MANHATTAN INSTITUTE WINS 2016 SIR ANTONY FISHER INTERNATIONAL MEMORIAL AWARD', 'The Manhattan Institute has been awarded this year’s $10,000 Sir Antony Fisher International Memorial Award for the book Disinherited:', 0x3c703e3c696d6720636c6173733d2266722d6469622066722d647261676761626c652066722d66696c22207372633d2268747470733a2f2f692e66726f616c612e636f6d2f6173736574732f70686f746f352e6a70672220646174612d69643d22352220646174612d747970653d22696d6167652220646174612d6e616d653d22496d61676520323031372d30312d32342061742030313a30313a35322e6a706722207374796c653d2277696474683a2035313370783b206865696768743a2033343270783b223e3c2f703e3c703e266e6273703b546865204d616e68617474616e20496e7374697475746520686173206265656e20617761726465642074686973207965617226727371756f3b73202431302c3030302053697220416e746f6e792046697368657220496e7465726e6174696f6e616c204d656d6f7269616c20417761726420666f722074686520626f6f6b203c656d3e3c6120687265663d2268747470733a2f2f7777772e61746c61736e6574776f726b2e6f72672f6e6577732f61727469636c652f646973696e686572697465642d73686f77732d64657374727563746976652d656666656374732d6f662d676f7665726e6d656e742d696e74657276656e74696f6e2d6f6e2d796f757468223e446973696e686572697465643a20486f772057617368696e67746f6e20497320426574726179696e6720416d657269636126727371756f3b7320596f756e673c2f613e3c2f656d3e2028456e636f756e74657220426f6f6b732c2032303135292c206279203c6120687265663d2268747470733a2f2f7777772e61746c61736e6574776f726b2e6f72672f706172746e6572732f676c6f62616c2d6469726563746f72792f6d616e68617474616e2d696e737469747574652d666f722d706f6c6963792d7265736561726368223e4d616e68617474616e20496e737469747574653c2f613e207363686f6c617273204469616e6120467572636874676f74742d526f746820616e64204a61726564204d657965722e20546865206177617264207761732070726573656e746564206174203c6120687265663d2268747470733a2f2f7777772e61746c61736e6574776f726b2e6f72672f6576656e74732f6c6962657274792d666f72756d2d66726565646f6d2d64696e6e65722f32303136223e41746c6173204e6574776f726b26727371756f3b732032303136204c69626572747920466f72756d20696e204d69616d693c2f613e2e3c2f703e3c703e266c6471756f3b57652061726520677261746566756c20746f2041746c6173204e6574776f726b20666f722063686f6f73696e6720746f206772616e742074686569722053697220416e746f6e792046697368657220496e7465726e6174696f6e616c204d656d6f7269616c20417761726420746f20446973696e686572697465642c26726471756f3b2073616964204c617772656e6365204d6f6e652c20707265736964656e74206f6620746865204d616e68617474616e20496e737469747574652e20266c6471756f3b4469616e6120467572636874676f74742d526f746820616e64204a61726564204d65796572206861766520626f746820776f726b656420746972656c6573736c79206f6e20626568616c66206f6620416d657269636126727371756f3b7320796f756e6765722067656e65726174696f6e2e20546865697220626f6f6b207075747320696e20636c6561722072656c6965662074686520706c69676874206f6620796f756e6720416d65726963616e732077686f2068617665206265656e2062757264656e6564206279206f757220676f7665726e6d656e7426727371756f3b7320766173742073797374656d206f6620646562742c20656e7469746c656d656e74732c20616e642063726970706c696e6720726567756c6174696f6e732e26726471756f3b3c2f703e3c703e497426727371756f3b73206d6f726520646966666963756c7420746f646179207468616e20697420686173206265656e20696e2067656e65726174696f6e73207061737420666f7220796f756e672070656f706c6520746f20656e7465722074686520776f726b666f72636520616e64206163686965766520737563636573732e2054656e73206f66206d696c6c696f6e73206f6620416d65726963616e73206265747765656e207468652061676573206f6620313820616e6420333020617265207374727567676c696e6720746f2066696e6420746865697220706c6163657320696e2074686520776f726c6420266d646173683b20616e6420706f6c6974696369616e73206174206576657279206c6576656c206f6620676f7665726e6d656e742068617665206d61646520746861742070726f63657373206d6f726520646966666963756c7420666f72207468656d207468616e2069742077617320666f7220746865697220706172656e747320616e64206772616e64706172656e74732e203c656d3e446973696e686572697465643c2f656d3e206578706c61696e7320686f77206d696c6c656e6e69616c7320617265206a75737420617320686172642d776f726b696e672c20656e657267657469632c20616e6420696e6e6f7661746976652061732074686520796f756e672070656f706c65206f662067656e65726174696f6e7320706173742c20627574207468657920617265207374796d696564206174206576657279207475726e20627920726573747269637469766520616e642072617069646c792070726f6c696665726174696e6720726567756c6174696f6e732e3c2f703e, 'Dhaval Joshi', '2016-09-27 18:39:26', '2017-02-28 17:22:50'),
(6, 'THINK TANKS IN ISRAEL, LITHUANIA, SWEDEN, U.S. NAMED 2016 TEMPLETON FREEDOM AWARD FINALISTS', 'Atlas Network is pleased to present the six finalists for the 2016 Templeton Freedom Award. The award is generously supported by Templeton Religion Trust and will be presented during Atlas Network’s Freedom Dinner on Nov. 10 in New York City at the histor', 0x3c703e41746c6173204e6574776f726b20697320706c656173656420746f2070726573656e7420746865207369782066696e616c6973747320666f722074686520323031362054656d706c65746f6e2046726565646f6d2041776172642e205468652061776172642069732067656e65726f75736c7920737570706f727465642062792054656d706c65746f6e2052656c6967696f6e20547275737420616e642077696c6c2062652070726573656e74656420647572696e672041746c6173204e6574776f726b26727371756f3b732046726565646f6d2044696e6e6572206f6e204e6f762e20313020696e204e657720596f726b20436974792061742074686520686973746f726963204361706974616c652e205468652077696e6e696e67206f7267616e697a6174696f6e2077696c6c2072656365697665206120243130302c303030207072697a652c20616e64207468652066697665206164646974696f6e616c2066696e616c697374732077696c6c2072656365697665202432352c303030207072697a65732e3c2f703e3c703e3c7374726f6e673e48657265206172652074686520323031362066696e616c697374733a3c2f7374726f6e673e3c2f703e3c703e3c6120687265663d2268747470733a2f2f7777772e61746c61736e6574776f726b2e6f72672f6e6577732f61727469636c652f6c69746875616e69616e2d667265652d6d61726b65742d696e737469747574652d6e616d65642d66696e616c6973742d666f722d323031362d74656d706c65746f6e2d66726565646f6d223e3c7374726f6e673e4c69746875616e69616e2046726565204d61726b657420496e737469747574653c2f7374726f6e673e3c2f613e3c62723e3c656d3e56696c6e6975732c204c69746875616e69613c2f656d3e3c62723e3c656d3e45636f6e6f6d69637320696e20333120486f7572733c2f656d3e2054657874626f6f6b3c2f703e3c703e496e2068696768207363686f6f6c73206163726f73732074686520776f726c642c206d6f73742073747564656e747320677261647561746520776974686f757420616e79206578706f7375726520746f2074686520636f6e6365707473206f66206d61726b65742065636f6e6f6d6963732e20546865203c6120687265663d2268747470733a2f2f7777772e61746c61736e6574776f726b2e6f72672f706172746e6572732f676c6f62616c2d6469726563746f72792f6c69746875616e69616e2d667265652d6d61726b65742d696e73746974757465223e4c69746875616e69616e2046726565204d61726b657420496e7374697475746520284c464d49293c2f613e2c20626173656420696e2056696c6e6975732c20736f7567687420746f206368616e6765207468617420627920646576656c6f70696e6720697473203c6120687265663d2268747470733a2f2f7777772e61746c61736e6574776f726b2e6f72672f6e6577732f61727469636c652f6e65772d74657874626f6f6b2d70726f76696465732d65636f6e6f6d69632d6c697465726163792d746f2d6c69746875616e69616e2d73747564656e7473223e3c656d3e45636f6e6f6d69637320696e20333120486f7572733c2f656d3e2074657874626f6f6b3c2f613e2e3c656d3e45636f6e6f6d69637320696e20333120486f7572733c2f656d3e207465616368657320686f772070726f7065727479207269676874732c20667265652065786368616e67652c2070726f6669742c20616e6420636f6d7065746974696f6e207368617065206465636973696f6e2d6d616b696e6720696e206576657279646179206c6966652e205468652074657874626f6f6b206861732070726f76656e20746f2062652077696c646c7920706f70756c617220696e2069747320666972737420796561722c20616e64206973206e6f77206265696e672075736564206279206e6561726c792068616c66206f662074686520636f756e7472792661706f733b732039746820616e64203130746820677261646572732e3c2f703e, 'Dhaval Joshi', '2016-09-27 18:40:30', '2016-12-02 17:00:20'),
(8, 'Mumbai: Bombay High Court refuses to lift ban on tree-cutting for metro rail', 'Mumbai: Bombay HighMumbai: Bombay High', 0x3c703e54686520426f6d626179204869676820436f75727420746f646179207265667573656420746f206c696674206974732073746179206f6e2063757474696e67206f6620747265657320666f7220746865206d6574726f207261696c2070726f6a65637420696e204d756d6261692e3c2f703e3c703e546865206869676820636f75727420657874656e646564207468652062616e206f6e20747265652d63757474696e6720666f7220616e6f746865722074776f207765656b73206576656e2074686520636f756e73656c20617070656172696e6720666f7220746865204d4d52444120284d756d626169204d6574726f20526567696f6e20446576656c6f706d656e7420417574686f72697479292074656c6c696e67206974207468617420616c7465726e61746520616c69676e6d656e747320666f7220736176696e6720747265657320776173206e6f7420706f737369626c652e3c2f703e3c703e3c62723e3c2f703e3c703e4d554d424149204d4554524f205241494c3a203130205448494e475320544f204b4e4f573c2f703e3c703e3c62723e3c2f703e3c6f6c3e3c6c693e3c703e5468652062656e6368206f6620426f6d626179204869676820436f7572742069732068656172696e6720766172696f7573207065746974696f6e7320746861742068617665206265656e2066696c656420627920766172696f757320696e646976696475616c7320636f6e6365726e696e67207468652063686f7070696e67206f6620617070726f78696d6174656c792035302c30303020747265657320696e204d756d62616920666f722074686520636f6e737472756374696f6e206f66206d6574726f207261696c2070726f6a656374732e3c2f703e3c2f6c693e3c6c693e3c703e4d4d52444120636f756e73656c204b6972616e2042616761726920736169642c202671756f743b5369782079656172732072657365617263682068617320676f6e6520696e746f206465636964696e672074686520616c69676e6d656e74206f66206d6574726f20726f7574652e205468652063757474696e67206f6620747265657320697320646f6e65206f6e6c792062656361757365206974206973206e656564656420666f7220696e6672617374727563747572652e2671756f743b3c2f703e3c2f6c693e3c6c693e3c703e426f6d626179204869676820436f757274204368696566204a757374696365204d616e6a756c61204368656c6c757220746f6c6420746865204d4d52444120636f756e73656c2074686174202671756f743b736f6d65206c6f737320746f2074686520656e7669726f6e6d656e742077696c6c2068617070656e20666f7220696e66726173747275637475726520646576656c6f706d656e742e20576520756e6465727374616e642074686174206275742074686520646966666572656e63652074686174207765206861766520746f2065737461626c697368206973206966206974206973206d61737361637265206f72206a757374206120736d616c6c206f62737461636c652e2671756f743b3c2f703e3c2f6c693e3c6c693e3c703e4a6974656e6472612050617264657368692c206120666f72657374206f6666696369616c2c206861732066696c656420616e2061666669646176697420736179696e67207468617420746865204d4d5244412077617320646972656374656420746f207472616e73706c616e74206d6f7374206f6620746865207472656573207768696c65206f6e6c792061206665772c20776869636820636f756c64206e6f74206265207472616e73706c616e7465642c207765726520746f206265206375742e3c2f703e3c2f6c693e3c6c693e3c703e436f6d6d656e74696e67206f6e2074686520617070726f616368206f662074686520666f72657374206f6666696369616c732c2073656e696f72206c6177796572204a616e616b20447761726b616461732c20617070656172696e6720666f72206f6e65206f6620746865207065746974696f6e6572732066726f6d20536f757468204d756d62616920746f6c642074686520636f7572742c202671756f743b546f207573652074686520776f72642063616c6c6f75732028666f7220746865206f6666696369616c732920776f756c6420626520616e20756e64657273746174656d656e742e20546865207472656520617574686f7269747920686173206162646963617465642069747320726573706f6e736962696c6974792e2671756f743b3c2f703e3c2f6c693e3c6c693e3c703e546865207065746974696f6e6572732068617665206265656e20616c6c6f7765642062792074686520426f6d626179204869676820436f75727420746f20696e737065637420646f63756d656e747320636f6e6365726e696e67207468652070726f63656475726520666f72206465636964696e6720746865206e756d626572206f6620747265657320746861742061726520726571756972656420746f2062652063757420756e6465722074686520424d432061732077656c6c20617320617420746865204d4d5244412e3c2f703e3c2f6c693e3c6c693e3c703e447572696e67207468652068656172696e672c204a757374696365204368656c6c757220736169642074686174206966207468652074726565732077657265202671756f743b6d617373616372656420616e642074686520656e7669726f6e6d656e742064657374726f796564207468656e2077652077696c6c206861766520746f206c6f6f6b20666f7220616e6f7468657220706c616e65742e20576520617265206f6e6c792064657374726f79696e67206f757273656c7665732e20576861742077652061726520746f6461792069732062656361757365206f66206f7572206f776e20616374696f6e732e2671756f743b3c2f703e3c2f6c693e3c6c693e3c703e5768696c65206f6e65206f6620746865207065746974696f6e657273206d656e74696f6e65642061626f75742061207375727665792077686963682073686f7765642074686174206174204d6f68616d6d656420416c6920526f616420746865726520776173206f6e6c79206f6e65207472656520696e20612074687265652d6b696c6f6d65747265207261696475732c204a757374696365204368656c6c757220726573706f6e64656420627920736179696e672c202671756f743b5765206e65656420746f20707574206120736563757269747920677561726420666f72207468617420747265652e2671756f743b3c2f703e3c2f6c693e3c6c693e3c703e4a757374696365204368656c6c75722061646465642c202671756f743b536f6d6574696d65732049207468696e6b2074686174206966204920676f20736f6d65776865726520616e6420636f6d65206261636b20746f204d756d6261692061667465722032302079656172732e205768656e20746865206165726f706c616e6520636f6d657320646f776e20666f72206c616e64696e67207468656e2070726f6261626c79207768617420492077696c6c20736565206973206a75737420636f6e6372657465206a756e676c652c206e6f7420616e20696e6368206f6620677265656e6572792061726f756e642e205468697320697320776861742069732068617070656e696e6720696e2042656e67616c7572752061732077656c6c2e2671756f743b3c2f703e3c2f6c693e3c6c693e3c703e546865206d61747465722077696c6c20636f6d6520757020666f722068656172696e6720696e2074686520426f6d626179204869676820436f7572742061667465722074776f207765656b732e3c2f703e3c2f6c693e3c2f6f6c3e3c703e3c62723e3c2f703e3c703e3c62723e3c2f703e, 'Dhaval Joshi', '2017-02-24 16:55:12', '2017-03-01 12:51:23'),
(10, 'Breaking News', 'New News', 0x3c703e4c6f72656d20497073756d2069732073696d706c792064756d6d792074657874206f6620746865207072696e74696e6720616e64207479706573657474696e6720696e6475737472792e204c6f72656d20497073756d20686173206265656e2074686520696e6475737472792661706f733b73207374616e646172642064756d6d79207465787420657665722073696e6365207468652031353030732c207768656e20616e20756e6b6e6f776e207072696e74657220746f6f6b20612067616c6c6579206f66207479706520616e6420736372616d626c656420697420746f206d616b65206120747970652073706563696d656e20626f6f6b2e20497420686173207375727669766564206e6f74206f6e6c7920666976652063656e7475726965732c2062757420616c736f20746865206c65617020696e746f20656c656374726f6e6963207479706573657474696e672c2072656d61696e696e6720657373656e7469616c6c7920756e6368616e6765642e2049742077617320706f70756c61726973656420696e207468652031393630732077697468207468652072656c65617365206f66204c657472617365742073686565747320636f6e7461696e696e67204c6f72656d20497073756d2070617373616765732c20616e64206d6f726520726563656e746c792077697468206465736b746f70207075626c697368696e673c2f703e3c703e4c6f72656d20497073756d2069732073696d706c792064756d6d792074657874206f6620746865207072696e74696e6720616e64207479706573657474696e6720696e6475737472792e204c6f72656d20497073756d20686173206265656e2074686520696e6475737472792661706f733b73207374616e646172642064756d6d79207465787420657665722073696e6365207468652031353030732c207768656e20616e20756e6b6e6f776e207072696e74657220746f6f6b20612067616c6c6579206f66207479706520616e6420736372616d626c656420697420746f206d616b65206120747970652073706563696d656e20626f6f6b2e20497420686173207375727669766564206e6f74206f6e6c7920666976652063656e7475726965732c2062757420616c736f20746865206c65617020696e746f20656c656374726f6e6963207479706573657474696e672c2072656d61696e696e6720657373656e7469616c6c7920756e6368616e6765642e2049742077617320706f70756c61726973656420696e207468652031393630732077697468207468652072656c65617365206f66204c657472617365742073686565747320636f6e7461696e696e67204c6f72656d20497073756d2070617373616765732c20616e64206d6f726520726563656e746c792077697468206465736b746f70207075626c697368696e673c2f703e3c703e4c6f72656d20497073756d2069732073696d706c792064756d6d792074657874206f6620746865207072696e74696e6720616e64207479706573657474696e6720696e6475737472792e204c6f72656d20497073756d20686173206265656e2074686520696e6475737472792661706f733b73207374616e646172642064756d6d79207465787420657665722073696e6365207468652031353030732c207768656e20616e20756e6b6e6f776e207072696e74657220746f6f6b20612067616c6c6579206f66207479706520616e6420736372616d626c656420697420746f206d616b65206120747970652073706563696d656e20626f6f6b2e20497420686173207375727669766564206e6f74206f6e6c7920666976652063656e7475726965732c2062757420616c736f20746865206c65617020696e746f20656c656374726f6e6963207479706573657474696e672c2072656d61696e696e6720657373656e7469616c6c7920756e6368616e6765642e2049742077617320706f70756c61726973656420696e207468652031393630732077697468207468652072656c65617365206f66204c657472617365742073686565747320636f6e7461696e696e67204c6f72656d20497073756d2070617373616765732c20616e64206d6f726520726563656e746c792077697468206465736b746f70207075626c697368696e673c2f703e, 'Dhaval Joshi', '2017-02-27 16:50:36', '2017-02-28 12:19:50');
INSERT INTO `tms_knowledge_news` (`k_news_id`, `k_news_title`, `news_sort_des`, `k_news_description`, `created_user`, `created_date`, `modified_date`) VALUES
(12, 'Taza Khabar', 'Testing all admin module to check validation.', 0x3c6865616465723e3c68313e5573696e672074686973207468656d6520796f752063616e3a3c2f68313e3c2f6865616465723e3c756c3e3c6c693e5265647563652074696d6520616e64206d6f6e6579207370656e74206f6e207265706574697469766520737570706f727420717565726965733c2f6c693e3c6c693e50726f76696465206120737570706f72742063656e74657220666f7220637573746f6d65727320746f206c6561726e20616e6420646973636f766572206d6f72652061626f757420796f75722070726f64756374733c2f6c693e3c6c693e5472616e73666f726d206672757374726174656420737570706f727420656d61696c7320696e746f2068617070792c206c6f79616c20637573746f6d6572733c2f6c693e3c2f756c3e3c703e5061636b6167656420776974682075736566756c2073686f7274636f6465733c2f703e3c703e4b6e6f77416c6c20636f6d6573207061636b61676564207769746820616c6c2074686520746f6f6c7320796f75206e65656420746f2073657420757020616e642072756e2061207375636365737366756c20737570706f72742063656e74657220696e636c7564696e672075736566756c2073686f7274636f64657320616e64207374796c696e6720656c656d656e747320746f206d616b6520796f757220636f6e74656e74207374616e64206f75742e3c2f703e3c68313e4b6e6f77416c6c2069732042656175746966756c2e3c2f68313e3c703e4b6e6f77416c6c20686173206265656e20646576656c6f706564206279204865726f5468656d65732c20746865207370656369616c6973747320696e204b6e6f776c65646765204261736520616e6420737570706f72742070726f647563747320666f7220576f726450726573732e2054727573746564206279206f7665722031352c30303020637573746f6d65727320776f726c64776964652c206f757220736f6674776172652073657276657320696e646976696475616c7320616e6420636f6d70616e696573207365656b696e6720746f20696d70726f766520746865697220637573746f6d657220737570706f7274206f7065726174696f6e732e3c2f703e3c68313e5072656d69756d207468656d6520646576656c6f706d656e743c2f68313e3c703e5765206d616465206f7572206e616d652066726f6d2073656c6c696e67206f6e2074686520776f726c6426727371756f3b73206c617267657374207468656d65206d61726b6574706c61636520616e6420656e6a6f79206e756d65726f75732074657374696d6f6e69616c732066726f6d2070656f706c65206c696b6520796f752e204f75722070726f64756374732068617665206265656e206665617475726564206f6e20746f70207468656d65206c697374696e672077656273697465732c206672657175656e746c7920686967686c7920726174656420616e6420726576696577656420627920657870657274732e205765206e6f77206f66666572206f75722070726f6475637473206469726563746c792c206d65616e696e6720796f75207265636569766520657863656c6c656e742073616c657320616e6420737570706f72742066726f6d2070656f706c65207468617420636172652061626f75742064656c69766572696e67207468652062657374206b6e6f776c6564676520626173652070726f647563747320666f7220796f757220627573696e6573732e3c2f703e3c68313e4865726f696320537570706f72743c2f68313e3c703e4f75722070726f6475637473206172652066656174757265207269636820696e20746865207468696e67732074686174206d617474657220776974686f75742074686520756e6e65636573736172792062757264656e206f66207468656d657320746861742074727920746f20706c656173652065766572796f6e652e204b6e6f77416c6c2068617320776173206465766973656420616e6420646576656c6f70656420707572656c792061732061206b6e6f776c656467652062617365207468656d652c206d65616e696e6720697420686173207468652064697374696c6c6564206578706572746973652066726f6d207365766572616c20737570706f7274207468656d657320616e64206120706f77657266756c206b6e6f776c65646765206261736520706c7567696e2062616b656420696e2e3c2f703e3c68313e537570706f72742066726f6d2074686520457870657274732e3c2f68313e3c703e576520757365206f7572206f776e2070726f647563747320746f2070726f76696465204865726f696320737570706f727420746f206f757220637573746f6d6572732c20696e206164646974696f6e20746f206f6e652d746f2d6f6e6520656d61696c20737570706f72742066726f6d2074686520646576656c6f7065727320616e6420737570706f7274207465616d2074686174206275696c742074686520736f6674776172652c206e6f206f6e652069732062657474657220746f2068656c7020796f752067657420746865206d6f73742066726f6d20796f7572206e6577204b6e6f776c6564676520426173652e3c2f703e3c703e4865726f5468656d6573207374616e647320627920656163682073616c65206f66204b6e6f77416c6c2c207768696368206973206261636b6564206279206f75722033302d646179206d6f6e6579206261636b2067756172616e7465652c207768696368206d65616e7320696620796f752063616e2074727920746865207468656d65207269736b2d6672656520666f72203330206461797320616e6420696620796f7520646f6e26727371756f3b7420636f6d706c6574656c79206c6f7665206f7572207468656d65206f7220736572766963652c20796f752077696c6c207265636569766520612066756c6c20726566756e642e3c2f703e3c68313e4d6f72652074686174206a75737420612064656d6f6e7374726174696f6e2668656c6c69703b3c2f68313e3c703e446973636f7665722077686174204b6e6f77416c6c2063616e20646f20666f7220796f7520616e6420796f757220737570706f7274207465616d2c206578706c6f726520746869732064656d6f207369746520746f20657870657269656e6365206a75737420736f6d65206f6620746865206772656174206665617475726573204b6e6f77416c6c2068617320746f206f666665722e3c2f703e, 'Dhaval Joshi', '2017-03-07 16:44:23', '2017-03-07 16:44:23'),
(13, 'who hit out at two Pakistan PMs', 'Reacting sharply to the charge of committing war crimes in the Valley, India on Friday called Pakistan \'terroristan\' and slammed Shahid Khaqan Abbasi for raking up the Kashmir issue at the UN General Assembly.', 0x3c703e5265616374696e672073686172706c7920746f2074686520636861726765206f6620636f6d6d697474696e6720776172206372696d657320696e207468652056616c6c65792c20496e646961206f6e204672696461792063616c6c65642050616b697374616e202661706f733b746572726f72697374616e2661706f733b20616e6420736c616d6d656420536861686964204b686171616e2041626261736920666f72203c6120687265663d22687474703a2f2f7777772e6669727374706f73742e636f6d2f776f726c642f61742d756e2d70616b697374616e2d6272696e67732d75702d6b6173686d69722d616761696e2d6162626173692d616363757365732d696e6469612d6f662d7761722d6372696d65732d736179732d6e65772d64656c68692d756e77696c6c696e672d746f2d726573756d652d70656163652d74616c6b732d343036393030332e68746d6c22207461726765743d225f626c616e6b223e72616b696e6720757020746865204b6173686d69722069737375653c2f613e2061742074686520554e2047656e6572616c20417373656d626c792e3c2f703e3c626c6f636b71756f74653e3c703e2671756f743b496e206974732073686f727420686973746f72792c2050616b697374616e20686173206265636f6d6520612067656f6772617068792073796e6f6e796d6f7573207769746820746572726f722e2054686520717565737420666f722061206c616e64206f662070757265206861732061637475616c6c792070726f6475636564202661706f733b746865206c616e64206f66207075726520746572726f722661706f733b2e2050616b697374616e206973206e6f7720546572726f72697374616e2c2671756f743b203c6120687265663d22687474703a2f2f7777772e6669727374706f73742e636f6d2f696e6469612f70616b697374616e2d69732d6e6f772d746572726f72697374616e2d696e646961732d65656e616d2d67616d626869722d686974732d6261636b2d61742d7368616869642d6b686171616e2d616262617369732d6d616964656e2d756e67612d7370656563682d343036393237372e68746d6c22207461726765743d225f626c616e6b223e496e6469612073616964207768696c652068697474696e67206f75742061742050616b697374616e3c2f613e2e3c2f703e3c2f626c6f636b71756f74653e3c703e546865206469706c6f6d61742077686f20726562757474656420416262617369207761732045656e616d2047616d626869722c20496e6469612661706f733b7320466972737420536563726574617279206f6620746865205065726d616e656e74204d697373696f6e20746f2074686520556e69746564204e6174696f6e732e3c2f703e3c703e47616d62686972206973206120323030352d626174636820496e6469616e20466f726569676e2053657276696365206f6666696365722e204861696c696e672066726f6d2044656c68692c207368652069732061204d617468656d61746963732067726164756174652066726f6d203c6120687265663d22687474703a2f2f7777772e6c6976656d696e742e636f6d2f506f6c69746963732f73635659455633504279436c6179426f6c69494f644a2f45656e616d2d47616d6268692d72656170732d7072616973652d666f722d64656c69766572696e672d612d6d6573736167652d746f2d50616b6973742e68746d6c222072656c3d226e6f666f6c6c6f7722207461726765743d225f626c616e6b223e44656c686920556e69766572736974792661706f733b732048696e647520436f6c6c6567653c2f613e2e204163636f7264696e6720746f20766172696f7573203c6120687265663d22687474703a2f2f7777772e6e6474762e636f6d2f696e6469612d6e6577732f7072616973652d666f722d696e6469616e2d6469706c6f6d61742d77686f2d72656275666665642d6e6177617a2d7368617269662d61742d756e2d31343635373737222072656c3d226e6f666f6c6c6f7722207461726765743d225f626c616e6b223e6d65646961207265706f7274733c2f613e2c2047616d6268697220616c736f206861732061206465677265652066726f6d2074686520556e6976657273697479206f662047656e6576612e3c2f703e3c703e4163636f7264696e6720746f20746865203c656d3e4c6976656d696e743c2f656d3e207265706f72742c2068657220666972737420706f7374696e672077617320696e204d61647269642c20776865726520617320746865207468697264207365637265746172792c20736865206c6561726e74205370616e6973683a2068657220636f6d70756c736f727920666f726569676e206c616e67756167652e2041667465722061207374696e742061732061207365636f6e642073656372657461727920696e20496e6469612661706f733b7320456d626173737920696e20417267656e74696e612c206f6e65206f66207468652074776f2062696767657374206d697373696f6e7320696e20536f75746820416d65726963612c20746865206f74686572206265696e67204272617a696c2c207368652072657475726e656420746f20496e6469612c20746865207265706f72742061646465642e3c2f703e3c703e47616d6268697220776173207468656e2061737369676e656420746f207468652050616b697374616e2d41666768616e697374616e2d4972616e206465736b20696e20746865204d696e6973747279206f662045787465726e616c20416666616972732c203c6120687265663d22687474703a2f2f7777772e68696e64757374616e74696d65732e636f6d2f696e6469612d6e6577732f796f756e672d6469706c6f6d61742d65656e616d2d67616d626869722d64656c69766572732d696e6469612d732d726573706f6e73652d746f2d70616b697374616e2d612d796561722d61667465722d6865722d7374696e67696e672d7269706f7374652d746f2d6e6177617a2d7370656563682f73746f72792d744a397a44636f5845454a444e5749684f594b6d304a2e68746d6c222072656c3d226e6f666f6c6c6f7722207461726765743d225f626c616e6b223e3c656d3e48696e64757374616e2054696d65733c2f656d3e3c2f613e207265706f727465642e3c2f703e3c703e3c696d67207372633d22687474703a2f2f73312e6669727374706f73742e696e2f77702d636f6e74656e742f75706c6f6164732f323031372f30392f65656e616d2d67616d626869722d747769747465722e6a70672220616c743d2246696c6520696d616765206f662045656e616d2047616d626869722e2054776974746572204065656e616d6722206865696768743d223238352220636c6173733d2266722d6469692066722d647261676761626c6522207374796c653d2277696474683a2033383070783b223e3c2f703e3c703e46696c6520696d616765206f662045656e616d2047616d626869722e2054776974746572204065656e616d673c2f703e3c703e3c62723e3c2f703e3c703e41742074686520554e2c2047616d62686972203c6120687265663d2268747470733a2f2f7777772e706d696e6577796f726b2e6f72672f70616765732e7068703f69643d393638222072656c3d226e6f666f6c6c6f7722207461726765743d225f626c616e6b223e697320696e20636861726765206f66207365766572616c20766572746963616c733c2f613e2c20696e636c7564696e672c20536563757269747920436f756e63696c207265666f726d2c20636f756e7465722d746572726f7269736d2c206379626572207365637572697479206973737565732e2053686520697320616c736f20726573706f6e7369626c6520666f7220636f6f7264696e6174696f6e207769746820616c6c205370656369616c204d697373696f6e7320696e636c7564696e672074686f736520617070726f7665642062792074686520554e534320616e64204e414d2e2041732070617274206f6620496e6469612661706f733b73207075626c6963206469706c6f6d6163792c2047616d6268697220697320616c736f206120636f6f7264696e61746f7220666f72206f75747265616368207769746820556e6976657273697469657320616e6420436f6c6c656765732e3c2f703e3c703e5768696c65206669727374207365637265746172792069732061206a756e696f722072616e6b20696e2074686520686965726172636879206f6620496e6469612661706f733b7320666f726569676e20736572766963652c2047616d6268697220726f736520746f2066616d6520616674657220686572203c6120687265663d22687474703a2f2f7777772e6669727374706f73742e636f6d2f776f726c642f70616b697374616e2d69732d746572726f726973742d73746174652d636172726965732d6f75742d7761722d6372696d65732d66756c6c2d746578742d6f662d696e646961732d726573706f6e73652d746f2d736861726966732d7370656563682d61742d756e2d333031343838302e68746d6c22207461726765743d225f626c616e6b223e7374696e67696e6720726562757474616c266e6273703b3c2f613e746f20666f726d65722050616b697374616e207072696d65206d696e6973746572204e6177617a205368617269662c2061667465722068652063616c6c656420736c61696e2048697a62756c20636f6d6d616e6465722042757268616e2057616e692061202661706f733b6d61727479722661706f733b2e3c2f703e3c703e43616c6c696e672050616b697374616e206120686f737420746f2074686520497679204c6561677565206f6620746572726f7269736d2c2047616d626869723c2f703e, 'Dhaval Joshi', '2017-09-22 18:47:46', '2017-09-22 18:47:46'),
(14, 'Apple India\'s net profit surges by 44% and so does its India ambition', 'KOLKATA: Apple grew its India net profit for the year ended March 2017 by 44% at Rs 373.4 crore, according to the Cupertino-based iPhone maker’s latest regulatory filings made to the Registrar of Companies (RoC).\nApple India’s pace of sales growth, howeve', 0x3c703e4b4f4c4b4154413a3c7370616e3e266e6273703b3c2f7370616e3e3c6120687265663d2268747470733a2f2f7777772e676164676574736e6f772e636f6d2f6272616e64732f4170706c65223e4170706c653c2f613e3c7370616e3e266e6273703b3c2f7370616e3e677265772069747320496e646961206e65742070726f66697420666f7220746865207965617220656e646564204d61726368203230313720627920343425206174205273203337332e342063726f72652c206163636f7264696e6720746f2074686520437570657274696e6f2d62617365643c7370616e3e266e6273703b3c2f7370616e3e3c6120687265663d2268747470733a2f2f7777772e676164676574736e6f772e636f6d2f746f7069632f6950686f6e652d382d4c61756e6368223e6950686f6e653c2f613e3c7370616e3e266e6273703b3c2f7370616e3e6d616b657226727371756f3b73206c617465737420726567756c61746f72792066696c696e6773206d61646520746f2074686520526567697374726172206f6620436f6d70616e6965732028526f43292e3c2f703e3c703e3c62723e3c2f703e3c703e4170706c6520496e64696126727371756f3b732070616365206f662073616c65732067726f7774682c20686f77657665722c2063616d6520646f776e207369676e69666963616e746c792066726f6d203430252d706c757320697420686164207265706f7274656420666f722070726576696f757320666976652079656172732073696e63652074686520636f6d70616e7920696e637265617365642069747320666f637573206f6e20496e646961206576656e20617320746865204368696e65736520736d61727470686f6e652062726967616465207374617274656420706f6c61726973696e672074686520496e6469616e206d61726b65742e3c2f703e3c703e3c62723e3c2f703e3c703e3c62723e3c2f703e3c703e4170706c6520496e64696126727371756f3b7320746f74616c20696e636f6d652028696e636c7564696e67206f7468657220696e636f6d652920677265772062792031372520746f20746f7563682052732031312c3730342e352063726f726520696e20465931372c2075702066726f6d20527320392c3939372e362063726f726520696e207468652070726576696f75732066697363616c2e3c62723e3c62723e416e616c797374732062656c69657665204170706c652077696c6c206d61696e7461696e206974732070616365206f662070726f6669742067726f77746820696e20496e64696120696e20323031372d31382064756520746f20686967686c792070726f66697461626c65206d6f64656c7320696e2069747320706f7274666f6c696f2064657370697465204368696e657365206272616e647320696e6372656173696e6720746865697220736861726520746f2061207265636f726420353725206f662074686520746f74616c20496e6469616e20736d61727470686f6e65206d61726b657420696e20746865206a75737420636f6e636c756465642066697363616c2c2075702066726f6d2035332520612079656172206561726c6965722c2061732070657220666967757265732072657665616c656420627920486f6e67204b6f6e672d6261736564207265736561726368657220436f756e746572706f696e742e3c62723e3c62723e3c6120687265663d2268747470733a2f2f7777772e676164676574736e6f772e636f6d2f746f7069632f4170706c652d496e646961223e4170706c6520496e6469613c2f613e2068617320706c6f7567686564206261636b2069747320465931372070726f66697420696e746f20746865206f7065726174696f6e732c207768696368206861642061676772656761746520737572706c7573206f6620527320312c3535362e352063726f7265206173206f66204d6172636820323031372e20412073656e696f7220696e64757374727920657865637574697665207361696420746869732077696c6c206265207573656420666f72206675727468657220657870616e73696f6e206f66206c6f63616c206f7065726174696f6e732e3c62723e3c62723e4170706c6520496e64696126727371756f3b732066696c696e6773206d61646520746f20526f432073616964206e6f206469766964656e6420776173207061696420746f2074686520706172656e7420666f72207468652066697363616c20756e6465722072657669657720746f20636f6e73657276652066696e616e6369616c207265736f75726365732e3c62723e3c62723e54686520636f6d70616e7920696e2074686520526f432066696c696e67207361696420696e636f6d6520616e6420636f6e73657175656e742070726f666974732061726520266c6471756f3b696e6372656173696e67206174206120636f6e73697374656e74207061636526726471756f3b2e3c62723e3c62723e456d61696c65642071756572696573206f6e207468652066696e616e6369616c20706572666f726d616e63652073656e7420746f204170706c6520496e64696120646964206e6f7420656c6963697420616e7920726573706f6e7365206173206f662070726573732074696d652053756e6461792e3c62723e3c62723e416e616c7973747320736179204170706c6520496e64696126727371756f3b732073616c65732067726f7774682077696c6c2072656d61696e20636f6d70617261746976656c79206c6f7720696e20323031372d31382064756520746f2068696768657220636f6d7065746974696f6e2c2077697468204368696e657365206272616e64204f6e652d506c7573206761696e696e67207369676e69666963616e7420736861726520696e20746865207072656d69756d207365676d656e7420616e642064756520746f206869676865722062617365206566666563742e3c62723e3c62723e266c6471756f3b5468652066696e616e6369616c20706572666f726d616e636520666f72204170706c6520496e64696120696e20746865206c6173742066697363616c2077696c6c206e6f74206265206d75636820646966666572656e742077697468206f6e65206f662074686520686967686573742070726f66697461626c65206d6f64656c7320696e2074686520706f7274666f6c696f2c26726471756f3b20436f756e746572706f696e7426727371756f3b73206173736f6369617465206469726563746f7220546172756e2050617468616b20736169642e20266c6471756f3b546865697220696e7374616c6c6564206261736520616e6420617665726167652073656c6c696e6720707269636520746f6f2061726520676f696e6720757020696e20496e6469612c26726471756f3b20686520736169642e3c62723e3c62723e436f756e746572706f696e742068617320616e616c797365642074686174204170706c6526727371756f3b73203c6120687265663d2268747470733a2f2f7777772e676164676574736e6f772e636f6d2f746f7069632f6950686f6e652d382d4c61756e6368223e6950686f6e6520583c2f613e206d6f64656c206e616262656420333525206f662074686520676c6f62616c20736d61727470686f6e65206d61726b657426727371756f3b732070726f66697420647572696e6720746865204f63746f6265722d446563656d62657220717561727465722c206d616b696e6720697420746865206d6f73742070726f66697461626c6520736d61727470686f6e6520666f6c6c6f776564206279206950686f6e6520382c207769746820313925206f662074686520696e64757374727926727371756f3b732070726f6669742c20616e64206950686f6e65203820506c75732077697468203135252070726f6669742073686172652e20496e20666163742c204170706c6520686164206561726e656420393025206f662074686520676c6f62616c20696e64757374727926727371756f3b732070726f6669747320647572696e6720746865207175617274657220776974682069747320656e7469726520706f7274666f6c696f2c206173207065722074686520726573656172636865722e3c62723e3c62723e496e20465931372c203c6120687265663d2268747470733a2f2f7777772e676164676574736e6f772e636f6d2f6272616e64732f5869616f6d69223e5869616f6d693c2f613e2c205669766f20616e64204f70706f20746f6765746865722068616420636f6d62696e65642073616c6573206f662052732032322c3532372063726f72652c2061206e6561722065696768742d666f6c64206a756d702066726f6d20527320322c3931392063726f72652074686579207265706f7274656420696e20465931362c206163636f7264696e6720746f20526f432066696c696e67732e3c62723e3c62723e4f6620746865204368696e65736520627269676164652c206f6e6c79205869616f6d692069732070726f66697461626c6520696e20496e6469612077697468206e65742070726f666974206f66205273203136332e392063726f726520696e20465931372e3c62723e3c62723e496e20746865206a75737420636f6e636c75646564204a616e2d4d6172636820717561727465722c204170706c65206c6f737420697473206c6561646572736869702073746174757320696e207468652052732033302c3030302d706c7573207365676d656e7420746f2053616d73756e6720746861742063617074757265642068616c66206f662074686520746f74616c206d61726b6574207769746820697473206e6577206c61756e636865732c2061732070657220436f756e746572706f696e742e204f6e652d506c75732077617320696e20746865207365636f6e6420706c6163652077697468206f6e652d666f75727468207368617265206f6620746865207072656d69756d206d61726b65742c20746865207265736561726368657220736169642e3c2f703e3c703e3c62723e3c2f703e3c703e466f6c6c6f772047616467657473204e6f77206f6e203c6120687265663d2268747470733a2f2f7777772e66616365626f6f6b2e636f6d2f476164676574734e6f77222072656c3d226e6f666f6c6c6f7722207461726765743d225f626c616e6b223e46616365626f6f6b3c2f613e20616e64203c6120687265663d2268747470733a2f2f747769747465722e636f6d2f676164676574736e6f77222072656c3d226e6f666f6c6c6f7722207461726765743d225f626c616e6b223e547769747465723c2f613e2e20466f7220746865203c6120687265663d2268747470733a2f2f7777772e676164676574736e6f772e636f6d2f6c61746573742d6e65777322207461726765743d225f626c616e6b223e6c6174657374206e6577733c2f613e2c203c6120687265663d2268747470733a2f2f7777772e676164676574736e6f772e636f6d2f746563682d6e65777322207461726765743d225f626c616e6b223e74656368206e6577733c2f613e2c20627265616b696e67206e65777320686561646c696e657320616e64206c697665207570646174657320636865636b6f757420476164676574736e6f772e636f6d3c2f703e, 'TMS Admin', '2018-04-30 12:54:50', '2018-04-30 12:54:50');

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

--
-- Dumping data for table `tms_knowledge_pic`
--

INSERT INTO `tms_knowledge_pic` (`pic_id`, `user_id`, `funny_pic`, `flag_like`, `flag_comment`, `status`, `created_date`, `modified_date`) VALUES
(1, 1, '1508147830.jpeg', 2, 6, '1', '2017-10-16 09:56:45', '2017-10-16 00:00:00'),
(2, 1, '1509003096.png', 2, 9, '1', '2017-10-26 07:31:26', '2017-10-26 00:00:00'),
(3, 1, '1513073552.jpeg', 3, 7, '1', '2017-12-12 10:12:28', '2017-12-12 00:00:00'),
(4, 1, '123.gif', 0, 0, '0', '2018-02-08 04:55:30', '2018-02-08 00:00:00'),
(5, 1, '456.png', 1, 2, '1', '2018-02-15 12:44:07', '2018-02-15 00:00:00'),
(9, 1, '1545281419.jpeg', 2, 0, '1', '2018-12-20 04:50:08', '2018-12-20 00:00:00'),
(10, 3, '1545281493.jpeg', 1, 0, '1', '2018-12-20 04:51:23', '2018-12-20 00:00:00');

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
(1, 'ca_ES', 'Catalan', 'Català', 'catalonia.png', 'Catalonia', 1, 0, '2021-04-20 00:00:00', '2021-07-29 18:46:29'),
(2, 'cz_CZ', 'Czech', 'Čeština', 'cz.png', 'Czech Republic', 1, 0, '2021-04-20 00:00:00', '2021-07-13 12:36:21'),
(3, 'dk_DK', 'Danish', 'Dansk', 'dk.png', 'Denmark', 1, 1, '2021-04-20 00:00:00', '2021-07-22 13:57:08'),
(4, 'de_DE', 'German', 'Deutsch', 'de.png', 'Germany', 1, 0, '2021-04-20 00:00:00', '2021-06-02 19:34:50'),
(5, 'ee_EE', 'Estonian', 'Eesti', 'ee.png', 'Estonia', 1, 1, '2021-04-20 00:00:00', '2021-07-27 18:46:00'),
(6, 'en_UK', 'English (UK)', 'English (UK)', 'gb.png', 'United Kingdom', 1, 0, '2021-04-20 00:00:00', '2021-06-02 19:35:02'),
(7, 'en_US', 'English (US)', 'English (US)', 'us.png', 'United States', 1, 1, '2021-04-20 00:00:00', '2021-06-08 18:15:51'),
(8, 'es_ES', 'Spanish', 'Español', 'es.png', 'Spain', 1, 0, '2021-04-20 00:00:00', '2021-06-04 17:41:59'),
(9, 'fr_CA', 'French (Canada)', 'Français (Canada)', 'ca.png', 'Canada', 1, 1, '2021-04-20 00:00:00', '2021-07-23 20:34:55'),
(10, 'fr_FR', 'French (France)', 'Français (France)', 'fr.png', 'France', 1, 1, '2021-04-20 00:00:00', '2021-07-29 18:46:05'),
(11, 'hr_HR', 'Croatian', 'Hrvatski', 'hr.png', 'Croatia', 1, 0, '2021-04-20 00:00:00', '2021-04-20 00:00:00'),
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
(40, 'ka_JP', 'Japanese (Kansai)', '日本語(関西)', 'jp.png', 'Japan', 1, 0, '2021-04-20 00:00:00', '2021-04-20 00:00:00');

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
(1, 2, 0, 'T Admin', 'add', 'external_res', 1, '2018-12-11 12:48:47', '2018-12-11 12:48:47'),
(2, 2, 0, 'T Admin', 'update', 'external_res', 1, '2018-12-11 12:50:02', '2018-12-31 19:06:53'),
(3, 1, 0, 'Kanhasoft', 'add', 'direct_cli', 1, '2018-12-12 16:55:14', '2018-12-12 16:55:14'),
(4, 1, 0, 'Kanhasoft', 'update', 'direct_cli', 1, '2018-12-12 16:56:20', '2021-03-02 17:06:25'),
(5, 1, 0, '', 'create', 'direct_cli', 1, '2018-12-12 17:00:15', '2018-12-12 17:00:15'),
(6, 2, 0, 'LOG180001', 'add', 'project', 1, '2018-12-12 17:01:10', '2018-12-12 17:01:10'),
(7, 1, 0, 'TMS Admin', 'update', 'internal_res', 1, '2018-12-12 17:04:35', '2021-10-07 16:59:02'),
(8, 3, 0, 'Vijay Gohil', 'add', 'internal_res', 1, '2018-12-12 17:10:57', '2018-12-12 17:10:57'),
(9, 4, 0, 'Rajesh Mudaliar', 'add', 'internal_res', 3, '2018-12-12 17:53:00', '2018-12-12 17:53:00'),
(10, 4, 0, 'Rajesh Mudaliar', 'update', 'internal_res', 3, '2018-12-12 17:56:33', '2018-12-12 17:56:33'),
(11, 4, 0, 'Rajesh Mudaliar', 'update', 'internal_res', 1, '2018-12-12 18:03:56', '2018-12-19 12:08:31'),
(12, 1, 0, 'Test Account', 'add', 'indirect_cli', 1, '2018-12-13 10:55:03', '2018-12-13 10:55:03'),
(13, 2, 0, 'LOG180001', 'update', 'project', 1, '2018-12-13 11:01:03', '2022-04-12 16:39:12'),
(14, 2, 1, 'LOG180001_BAD001', 'update', 'task', 1, '2018-12-13 11:06:42', '2022-03-22 14:44:36'),
(15, 5, 0, 'Mayank Vadiya', 'add', 'internal_res', 1, '2018-12-13 11:17:31', '2018-12-13 11:17:31'),
(16, 3, 0, 'Vijay Gohil', 'update', 'internal_res', 1, '2018-12-29 12:35:38', '2021-10-08 14:16:49'),
(17, 5, 0, 'Mayank Vadiya', 'update', 'internal_res', 1, '2018-12-31 12:08:17', '2018-12-31 12:08:17'),
(18, 2, 3, 'LOG180001_BAD003', 'delete', 'task', 1, '2019-01-08 10:44:37', '2019-01-08 10:44:37'),
(19, 2, 4, 'LOG180001_COP003', 'delete', 'task', 1, '2019-01-08 10:47:46', '2019-01-08 10:47:46'),
(20, 2, 5, 'LOG180001_BAD003', 'delete', 'task', 1, '2019-01-08 11:34:07', '2019-01-08 11:34:07'),
(21, 2, 0, 'Infosys', 'add', 'direct_cli', 1, '2019-01-08 12:08:28', '2019-01-08 12:08:28'),
(22, 2, 0, 'Infosys', 'update', 'direct_cli', 1, '2019-01-08 12:10:44', '2021-03-02 18:33:07'),
(23, 2, 0, '', 'create', 'direct_cli', 1, '2019-01-08 12:19:51', '2019-01-08 12:19:51'),
(24, 2, 0, 'Inx', 'add', 'indirect_cli', 1, '2019-01-08 12:20:37', '2019-01-08 12:20:37'),
(25, 28, 0, 'LOG180002', 'add', 'project', 1, '2019-01-08 12:29:28', '2019-01-08 12:29:28'),
(26, 28, 0, 'LOG180002', 'update', 'project', 1, '2019-01-08 12:34:04', '2021-11-12 16:44:31'),
(27, 28, 6, 'LOG180002_BAD001', 'update', 'task', 1, '2019-01-08 12:35:45', '2019-01-08 12:35:45'),
(28, 28, 13, 'LOG180002_COP004', 'delete', 'task', 1, '2019-01-09 15:53:04', '2019-01-09 15:53:04'),
(29, 2, 2, 'LOG180001_DTP002', 'update', 'task', 1, '2019-01-10 10:09:15', '2021-10-18 10:28:03'),
(30, 29, 0, 'LOG180003', 'add', 'project', 1, '2021-02-24 17:53:43', '2021-02-24 17:53:43'),
(31, 29, 0, 'LOG180003', 'update', 'project', 1, '2021-02-26 17:43:25', '2021-07-14 19:04:09'),
(32, 34, 0, 'LOG180004', 'add', 'project', 1, '2021-03-03 11:37:59', '2021-03-03 11:37:59'),
(33, 34, 0, 'LOG180004', 'update', 'project', 1, '2021-03-03 11:49:48', '2021-07-22 16:32:00'),
(34, 35, 0, 'LOG180005', 'add', 'project', 1, '2021-03-03 11:56:53', '2021-03-03 11:56:53'),
(35, 35, 0, 'LOG180005', 'update', 'project', 1, '2021-03-03 12:41:05', '2021-11-17 11:50:00'),
(36, 36, 0, 'LOG180006', 'add', 'project', 1, '2021-03-03 12:49:57', '2021-03-03 12:49:57'),
(37, 36, 0, 'LOG180006', 'update', 'project', 1, '2021-03-03 12:50:45', '2021-07-19 21:08:52'),
(38, 37, 0, 'LOG180007', 'add', 'project', 1, '2021-03-03 12:55:56', '2021-03-03 12:55:56'),
(39, 37, 0, 'LOG180007', 'update', 'project', 1, '2021-03-03 12:56:16', '2021-07-16 18:14:36'),
(40, 38, 0, 'LOG180008', 'add', 'project', 1, '2021-03-03 13:01:04', '2021-03-03 13:01:04'),
(41, 40, 0, 'LOG180009', 'add', 'project', 1, '2021-03-03 13:08:56', '2021-03-03 13:08:56'),
(42, 38, 0, 'LOG180008', 'update', 'project', 1, '2021-03-03 13:12:24', '2021-06-22 14:45:20'),
(43, 40, 0, 'LOG180009', 'update', 'project', 1, '2021-03-03 13:26:52', '2021-10-11 14:36:20'),
(44, 41, 0, 'LOG180010', 'add', 'project', 1, '2021-03-03 14:36:18', '2021-03-03 14:36:18'),
(45, 41, 0, 'LOG180010', 'update', 'project', 1, '2021-03-03 14:38:00', '2021-05-04 14:35:01'),
(46, 42, 0, 'LOG180011', 'add', 'project', 1, '2021-04-15 23:17:03', '2021-04-15 23:17:03'),
(47, 42, 0, 'LOG180011', 'update', 'project', 1, '2021-05-03 16:51:50', '2021-07-13 16:48:52'),
(48, 44, 0, 'LOG180012', 'add', 'project', 1, '2021-05-10 12:40:30', '2021-05-10 12:40:30'),
(49, 44, 0, 'LOG180012', 'update', 'project', 1, '2021-05-10 12:42:12', '2021-05-10 12:42:12'),
(50, 46, 0, 'LOG180013', 'add', 'project', 1, '2021-06-02 19:19:06', '2021-06-02 19:19:06'),
(51, 46, 0, 'LOG180013', 'update', 'project', 1, '2021-06-02 19:20:05', '2021-10-12 15:59:43'),
(52, 49, 0, 'LOG180014', 'add', 'project', 1, '2021-06-04 16:06:14', '2021-06-04 16:06:14'),
(53, 49, 0, 'LOG180014', 'update', 'project', 1, '2021-06-04 16:21:39', '2021-06-04 16:21:39'),
(54, 51, 0, 'LOG180015', 'add', 'project', 1, '2021-06-04 17:38:18', '2021-06-04 17:38:18'),
(55, 28, 19, 'LOG180002_SEO005', 'delete', 'task', 1, '2021-06-09 09:37:14', '2021-06-09 09:37:14'),
(56, 54, 0, 'LOG180016', 'add', 'project', 1, '2021-06-21 17:16:41', '2021-06-21 17:16:41'),
(57, 54, 0, 'LOG180016', 'update', 'project', 1, '2021-06-21 17:19:35', '2021-09-20 19:19:53'),
(58, 54, 37, 'LOG180016_DTP002', 'update', 'task', 1, '2021-06-21 17:31:17', '2021-06-21 17:31:17'),
(59, 54, 37, 'LOG180016_DTP002', 'delete', 'task', 1, '2021-06-21 17:35:24', '2021-06-21 17:35:24'),
(60, 35, 41, 'LOG180005_BAD002', 'update', 'task', 1, '2021-06-21 19:20:46', '2021-11-17 12:13:00'),
(61, 35, 40, 'LOG180005_BAD001', 'update', 'task', 1, '2021-06-21 19:21:50', '2021-11-09 11:58:10'),
(62, 55, 0, 'LOG180017', 'add', 'project', 1, '2021-06-22 11:44:24', '2021-06-22 11:44:24'),
(63, 55, 0, 'LOG180017', 'update', 'project', 1, '2021-06-22 11:47:02', '2021-06-22 14:29:13'),
(64, 29, 23, 'LOG180003_DTC004', 'update', 'task', 1, '2021-06-22 12:11:04', '2022-03-29 17:50:25'),
(65, 56, 0, 'LOG180018', 'add', 'project', 1, '2021-06-29 14:03:54', '2021-06-29 14:03:54'),
(66, 56, 0, 'LOG180018', 'update', 'project', 1, '2021-06-29 14:13:12', '2021-06-29 15:55:24'),
(67, 57, 0, 'LOG180019', 'add', 'project', 1, '2021-06-29 15:48:24', '2021-06-29 15:48:24'),
(68, 57, 0, 'LOG180019', 'update', 'project', 1, '2021-06-29 15:48:39', '2021-07-02 19:37:18'),
(69, 57, 51, 'LOG180019_DTC001', 'update', 'task', 1, '2021-07-02 19:40:30', '2021-07-02 19:40:30'),
(70, 58, 0, 'LOG180020', 'add', 'project', 1, '2021-07-05 10:39:28', '2021-07-05 10:39:28'),
(71, 58, 0, 'LOG180020', 'update', 'project', 1, '2021-07-05 10:40:58', '2021-07-05 10:44:01'),
(72, 58, 52, 'LOG180020_COP001', 'update', 'task', 1, '2021-07-05 10:53:19', '2021-07-05 10:53:19'),
(73, 59, 0, 'LOG180021', 'add', 'project', 1, '2021-07-06 09:47:54', '2021-07-06 09:47:54'),
(74, 59, 0, 'LOG180021', 'update', 'project', 1, '2021-07-06 09:53:08', '2021-08-09 10:32:02'),
(75, 59, 54, 'LOG180021_COP001', 'update', 'task', 1, '2021-07-06 10:05:18', '2021-07-06 10:05:18'),
(76, 59, 55, 'LOG180021_FED002', 'update', 'task', 1, '2021-07-06 10:27:51', '2021-07-06 10:27:51'),
(77, 60, 0, 'LOG180022', 'add', 'project', 1, '2021-07-06 12:36:39', '2021-07-06 12:36:39'),
(78, 60, 0, 'LOG180022', 'update', 'project', 1, '2021-07-06 12:40:18', '2021-08-09 16:48:32'),
(79, 28, 17, 'LOG180002_COP003', 'update', 'task', 1, '2021-07-06 12:46:14', '2021-10-25 13:16:34'),
(80, 61, 0, 'LOG180023', 'add', 'project', 3, '2021-07-06 12:55:55', '2021-07-06 12:55:55'),
(81, 61, 0, 'LOG180023', 'update', 'project', 3, '2021-07-06 12:57:29', '2021-07-06 12:58:41'),
(82, 61, 57, 'LOG180023_TEST001', 'update', 'task', 3, '2021-07-06 13:11:27', '2021-07-06 13:14:52'),
(83, 61, 0, 'LOG180023', 'update', 'project', 1, '2021-07-06 16:31:20', '2021-09-20 19:18:00'),
(84, 61, 57, 'LOG180023_TEST001', 'update', 'task', 1, '2021-07-06 16:33:20', '2021-07-06 16:33:20'),
(85, 62, 0, 'LOG180024', 'add', 'project', 1, '2021-07-06 18:20:53', '2021-07-06 18:20:53'),
(86, 62, 0, 'LOG180024', 'update', 'project', 1, '2021-07-06 20:32:06', '2021-07-06 20:35:34'),
(87, 62, 58, 'LOG180024_FED001', 'update', 'task', 1, '2021-07-06 20:37:56', '2021-07-06 20:37:56'),
(88, 63, 0, 'LOG180025', 'add', 'project', 1, '2021-07-12 21:27:00', '2021-07-12 21:27:00'),
(89, 64, 0, 'LOG180026', 'add', 'project', 1, '2021-07-13 20:41:24', '2021-07-13 20:41:24'),
(90, 64, 0, 'LOG180026', 'update', 'project', 1, '2021-07-13 20:45:23', '2021-07-13 21:08:21'),
(91, 64, 59, 'LOG180026_COP001', 'update', 'task', 1, '2021-07-13 21:03:56', '2021-07-13 21:03:56'),
(92, 65, 0, 'LOG180027', 'add', 'project', 1, '2021-07-14 10:28:28', '2021-07-14 10:28:28'),
(93, 66, 0, 'LOG180028', 'add', 'project', 1, '2021-07-15 12:21:06', '2021-07-15 12:21:06'),
(94, 67, 0, 'LOG180029', 'add', 'project', 1, '2021-07-15 13:09:35', '2021-07-15 13:09:35'),
(95, 67, 0, 'LOG180029', 'update', 'project', 1, '2021-07-15 13:11:27', '2021-07-15 13:12:49'),
(96, 67, 60, 'LOG180029_COP001', 'update', 'task', 1, '2021-07-15 13:16:53', '2021-07-15 13:39:01'),
(97, 51, 0, 'LOG180015', 'update', 'project', 1, '2021-07-16 19:51:00', '2021-07-16 19:51:00'),
(98, 51, 61, 'LOG180015_DTP001', 'update', 'task', 1, '2021-07-16 20:15:57', '2021-07-16 20:15:57'),
(99, 68, 0, 'LOG180030', 'add', 'project', 1, '2021-07-19 09:29:15', '2021-07-19 09:29:15'),
(100, 68, 0, 'LOG180030', 'update', 'project', 1, '2021-07-19 09:31:19', '2021-07-19 10:35:54'),
(101, 68, 62, 'LOG180030_DTP001', 'update', 'task', 1, '2021-07-19 09:42:28', '2021-07-19 09:42:28'),
(102, 66, 0, 'LOG180028', 'update', 'project', 1, '2021-07-19 19:52:26', '2021-07-19 20:02:02'),
(103, 66, 64, 'LOG180028_SEO001', 'update', 'task', 1, '2021-07-19 20:05:37', '2021-07-19 20:05:37'),
(104, 69, 0, 'LOG180031', 'add', 'project', 1, '2021-07-22 13:55:13', '2021-07-22 13:55:13'),
(105, 69, 0, 'LOG180031', 'update', 'project', 1, '2021-07-22 14:05:59', '2021-07-22 14:12:53'),
(106, 69, 70, 'LOG180031_FED005', 'update', 'task', 1, '2021-07-22 14:18:56', '2021-07-22 14:18:56'),
(107, 34, 71, 'LOG180004_TEST001', 'update', 'task', 1, '2021-07-22 16:43:19', '2021-07-22 16:43:19'),
(108, 70, 0, 'LOG180032', 'add', 'project', 1, '2021-07-22 16:57:29', '2021-07-22 16:57:29'),
(109, 71, 0, 'LOG180033', 'add', 'project', 1, '2021-07-22 17:05:18', '2021-07-22 17:05:18'),
(110, 71, 0, 'LOG180033', 'update', 'project', 1, '2021-07-22 17:55:32', '2021-07-22 18:04:01'),
(111, 71, 74, 'LOG180033_COP001', 'update', 'task', 1, '2021-07-22 18:00:55', '2021-07-22 18:00:55'),
(112, 70, 0, 'LOG180032', 'update', 'project', 1, '2021-07-22 18:05:10', '2021-07-22 18:05:10'),
(113, 72, 0, 'LOG180034', 'add', 'project', 1, '2021-07-22 18:09:45', '2021-07-22 18:09:45'),
(114, 73, 0, 'LOG180035', 'add', 'project', 1, '2021-07-27 11:13:30', '2021-07-27 11:13:30'),
(115, 73, 0, 'LOG180035', 'update', 'project', 1, '2021-07-27 11:20:30', '2021-07-29 17:28:21'),
(116, 73, 77, 'LOG180035_DTP001', 'update', 'task', 1, '2021-07-27 11:25:40', '2021-07-29 17:31:00'),
(117, 28, 18, 'LOG180002_DTP004', 'update', 'task', 1, '2021-07-29 14:53:14', '2021-09-06 17:44:28'),
(118, 2, 73, 'LOG180001_COP010', 'update', 'task', 1, '2021-07-29 15:34:09', '2022-03-22 10:53:20'),
(119, 74, 0, 'LOG180036', 'add', 'project', 1, '2021-07-29 16:29:33', '2021-07-29 16:29:33'),
(120, 74, 0, 'LOG180036', 'update', 'project', 1, '2021-07-29 16:32:25', '2021-09-21 11:40:45'),
(121, 74, 78, 'LOG180036_DTP001', 'update', 'task', 1, '2021-07-29 16:37:45', '2021-07-29 17:07:06'),
(122, 74, 79, 'LOG180036_COP002', 'update', 'task', 1, '2021-07-29 17:12:50', '2021-07-29 17:14:57'),
(123, 63, 0, 'LOG180025', 'update', 'project', 1, '2021-07-29 17:57:01', '2021-09-20 19:19:04'),
(124, 63, 80, 'LOG180025_FED001', 'update', 'task', 1, '2021-07-29 17:58:57', '2021-07-29 18:07:53'),
(125, 63, 81, 'LOG180025_BAD002', 'update', 'task', 1, '2021-07-29 18:27:34', '2021-07-29 18:27:34'),
(126, 75, 0, 'LOG180037', 'add', 'project', 1, '2021-07-29 18:48:35', '2021-07-29 18:48:35'),
(127, 76, 0, 'LOG180038', 'add', 'project', 1, '2021-07-29 19:00:17', '2021-07-29 19:00:17'),
(128, 77, 0, 'LOG180039', 'add', 'project', 1, '2021-07-29 19:36:49', '2021-07-29 19:36:49'),
(129, 79, 0, 'LOG180040', 'add', 'project', 1, '2021-07-30 09:30:50', '2021-07-30 09:30:50'),
(130, 80, 0, 'LOG180041', 'add', 'project', 1, '2021-07-30 11:09:07', '2021-07-30 11:09:07'),
(131, 81, 0, 'LOG180042', 'add', 'project', 1, '2021-07-30 11:27:41', '2021-07-30 11:27:41'),
(132, 82, 0, 'LOG180043', 'add', 'project', 1, '2021-07-30 12:33:53', '2021-07-30 12:33:53'),
(133, 83, 0, 'LOG180044', 'add', 'project', 1, '2021-07-30 12:38:57', '2021-07-30 12:38:57'),
(134, 84, 0, 'LOG180045', 'add', 'project', 1, '2021-07-30 12:56:27', '2021-07-30 12:56:27'),
(135, 86, 0, 'LOG180046', 'add', 'project', 1, '2021-07-30 13:39:38', '2021-07-30 13:39:38'),
(136, 86, 0, 'LOG180046', 'update', 'project', 1, '2021-07-30 13:40:39', '2021-08-02 19:13:30'),
(137, 86, 82, 'LOG180046_COP001', 'update', 'task', 1, '2021-07-30 13:43:11', '2021-07-30 13:43:11'),
(138, 87, 0, 'LOG180047', 'add', 'project', 1, '2021-08-09 10:39:17', '2021-08-09 10:39:17'),
(139, 88, 0, 'LOG180048', 'add', 'project', 1, '2021-08-09 10:47:29', '2021-08-09 10:47:29'),
(140, 2, 72, 'LOG180001_DTP009', 'delete', 'task', 1, '2021-08-12 11:23:18', '2021-08-12 11:23:18'),
(141, 2, 48, 'LOG180001_FED008', 'delete', 'task', 1, '2021-08-12 11:24:50', '2021-08-12 11:24:50'),
(142, 2, 46, 'LOG180001_DTP006', 'delete', 'task', 1, '2021-08-12 11:25:08', '2021-08-12 11:25:08'),
(143, 2, 47, 'LOG180001_COP007', 'delete', 'task', 1, '2021-08-12 11:25:21', '2021-08-12 11:25:21'),
(144, 2, 20, 'LOG180001_BAD003', 'delete', 'task', 1, '2021-08-12 11:25:39', '2021-08-12 11:25:39'),
(145, 2, 35, 'LOG180001_DTP005', 'delete', 'task', 1, '2021-08-12 11:25:55', '2021-08-12 11:25:55'),
(146, 100, 0, 'LOG180049', 'add', 'project', 1, '2021-08-27 10:30:33', '2021-08-27 10:30:33'),
(147, 102, 0, 'LOG180050', 'add', 'project', 1, '2021-09-02 17:33:31', '2021-09-02 17:33:31'),
(148, 102, 0, 'LOG180050', 'update', 'project', 1, '2021-09-02 17:40:12', '2021-10-20 11:11:44'),
(149, 102, 84, 'LOG180050_COP001', 'update', 'task', 1, '2021-09-02 17:51:10', '2021-10-20 11:12:18'),
(150, 102, 85, 'LOG180050_FED002', 'update', 'task', 1, '2021-09-02 17:53:17', '2021-10-20 11:12:39'),
(151, 102, 86, 'LOG180050_COP003', 'update', 'task', 1, '2021-09-02 18:42:46', '2021-09-03 14:30:59'),
(152, 103, 0, 'LOG180051', 'add', 'project', 1, '2021-09-06 11:16:59', '2021-09-06 11:16:59'),
(153, 103, 0, 'LOG180051', 'update', 'project', 1, '2021-09-06 11:28:45', '2021-10-19 18:37:22'),
(154, 103, 87, 'LOG180051_BAD001', 'update', 'task', 1, '2021-09-06 11:29:53', '2021-11-11 14:44:01'),
(155, 107, 0, 'LOG180052', 'add', 'project', 1, '2021-09-08 13:43:22', '2021-09-08 13:43:22'),
(156, 111, 0, 'LOG180053', 'add', 'project', 1, '2021-09-13 09:41:18', '2021-09-13 09:41:18'),
(157, 107, 0, 'LOG180052', 'update', 'project', 1, '2021-09-13 09:45:08', '2021-10-18 10:48:55'),
(158, 107, 97, 'LOG180052_BAD001', 'update', 'task', 1, '2021-09-13 10:56:49', '2021-10-18 10:44:34'),
(159, 113, 0, 'LOG180054', 'add', 'project', 1, '2021-09-15 10:46:12', '2021-09-15 10:46:12'),
(160, 113, 0, 'LOG180054', 'update', 'project', 1, '2021-09-15 10:48:10', '2022-03-24 15:35:20'),
(161, 88, 0, 'LOG180048', 'update', 'project', 1, '2021-09-15 11:12:28', '2021-09-15 11:12:28'),
(162, 107, 98, 'LOG180052_COP002', 'update', 'task', 1, '2021-09-16 13:05:11', '2021-09-16 13:05:11'),
(163, 114, 0, 'LOG180055', 'add', 'project', 1, '2021-09-16 16:34:39', '2021-09-16 16:34:39'),
(164, 114, 0, 'LOG180055', 'update', 'project', 1, '2021-09-16 16:35:33', '2021-09-17 20:11:57'),
(165, 114, 103, 'LOG180055_DTC001', 'update', 'task', 1, '2021-09-16 16:36:00', '2021-09-16 16:36:00'),
(166, 115, 0, 'LOG180056', 'add', 'project', 1, '2021-09-17 10:24:31', '2021-09-17 10:24:31'),
(167, 115, 0, 'LOG180056', 'update', 'project', 1, '2021-09-17 10:30:56', '2021-09-20 18:46:32'),
(168, 114, 0, 'LOG180055', 'update', 'project', 3, '2021-09-17 11:20:23', '2021-09-17 11:24:41'),
(169, 115, 0, 'LOG180056', 'update', 'project', 3, '2021-09-17 11:29:18', '2021-09-17 11:44:28'),
(170, 115, 104, 'LOG180056_SEO001', 'update', 'task', 1, '2021-09-17 15:49:36', '2021-09-17 15:49:36'),
(171, 115, 105, 'LOG180056_DTP002', 'update', 'task', 1, '2021-09-17 15:50:00', '2021-09-17 15:50:00'),
(172, 115, 106, 'LOG180056_DTC004', 'update', 'task', 1, '2021-09-17 15:50:19', '2021-09-17 15:50:19'),
(173, 117, 0, 'LOG180057', 'add', 'project', 1, '2021-09-17 16:27:20', '2021-09-17 16:27:20'),
(174, 117, 0, 'LOG180057', 'update', 'project', 1, '2021-09-17 16:29:16', '2021-09-20 10:36:13'),
(175, 117, 108, 'LOG180057_DTC001', 'update', 'task', 1, '2021-09-17 16:31:22', '2021-09-17 16:31:22'),
(176, 117, 109, 'LOG180057_COP002', 'update', 'task', 1, '2021-09-17 16:34:24', '2021-09-17 16:34:24'),
(177, 119, 0, 'LOG180058', 'add', 'project', 1, '2021-09-20 10:43:14', '2021-09-20 10:43:14'),
(178, 119, 0, 'LOG180058', 'update', 'project', 1, '2021-09-20 10:45:17', '2021-09-20 10:47:39'),
(179, 119, 110, 'LOG180058_COP001', 'update', 'task', 1, '2021-09-20 10:48:01', '2021-09-20 10:48:01'),
(180, 120, 0, 'LOG180059', 'add', 'project', 1, '2021-09-20 10:49:42', '2021-09-20 10:49:42'),
(181, 120, 0, 'LOG180059', 'update', 'project', 1, '2021-09-20 10:50:17', '2021-09-20 18:32:39'),
(182, 119, 0, 'LOG180058', 'update', 'project', 5, '2021-09-20 18:03:24', '2021-09-20 18:10:09'),
(183, 119, 110, 'LOG180058_COP001', 'update', 'task', 5, '2021-09-20 18:04:51', '2021-09-20 18:08:54'),
(184, 123, 0, 'LOG180060', 'add', 'project', 1, '2021-09-20 18:28:31', '2021-09-20 18:28:31'),
(185, 123, 0, 'LOG180060', 'update', 'project', 1, '2021-09-20 18:30:27', '2021-09-20 18:30:27'),
(186, 123, 112, 'LOG180060_FED001', 'update', 'task', 1, '2021-09-20 18:30:55', '2021-09-20 18:30:55'),
(187, 124, 0, 'LOG180061', 'add', 'project', 1, '2021-09-20 18:48:33', '2021-09-20 18:48:33'),
(188, 124, 0, 'LOG180061', 'update', 'project', 1, '2021-09-20 18:49:03', '2021-09-20 18:50:03'),
(189, 124, 113, 'LOG180061_DTC001', 'update', 'task', 1, '2021-09-20 18:49:33', '2021-09-20 18:49:33'),
(190, 125, 0, 'LOG180062', 'add', 'project', 1, '2021-09-20 18:51:50', '2021-09-20 18:51:50'),
(191, 125, 0, 'LOG180062', 'update', 'project', 1, '2021-09-20 18:52:24', '2022-03-25 19:35:34'),
(192, 126, 0, 'LOG180063', 'add', 'project', 1, '2021-09-20 19:00:26', '2021-09-20 19:00:26'),
(193, 126, 0, 'LOG180063', 'update', 'project', 1, '2021-09-20 19:01:08', '2021-09-20 19:01:08'),
(194, 127, 0, 'LOG180064', 'add', 'project', 1, '2021-09-20 19:15:24', '2021-09-20 19:15:24'),
(195, 127, 0, 'LOG180064', 'update', 'project', 1, '2021-09-20 19:15:58', '2021-09-20 19:16:47'),
(196, 128, 0, 'LOG180065', 'add', 'project', 1, '2021-09-21 11:11:51', '2021-09-21 11:11:51'),
(197, 128, 0, 'LOG180065', 'update', 'project', 1, '2021-09-21 11:12:40', '2021-09-21 11:12:40'),
(198, 11, 0, 'Anil Nadiya', 'add', 'internal_res', 1, '2021-09-21 12:33:43', '2021-09-21 12:33:43'),
(199, 130, 0, 'LOG180066', 'add', 'project', 1, '2021-09-23 18:13:04', '2021-09-23 18:13:04'),
(200, 131, 0, 'LOG180067', 'add', 'project', 1, '2021-09-24 10:26:56', '2021-09-24 10:26:56'),
(201, 131, 0, 'LOG180067', 'update', 'project', 1, '2021-09-24 10:30:43', '2021-09-24 10:30:43'),
(202, 35, 121, 'LOG180005_FED003', 'delete', 'task', 1, '2021-09-27 11:55:16', '2021-09-27 11:55:16'),
(203, 2, 83, 'LOG180001_COP011', 'update', 'task', 1, '2021-10-01 11:20:57', '2022-03-28 12:10:10'),
(204, 135, 0, 'LOG180068', 'add', 'project', 1, '2021-10-01 11:33:52', '2021-10-01 11:33:52'),
(205, 135, 0, 'LOG180068', 'update', 'project', 1, '2021-10-01 11:44:35', '2021-10-05 16:22:11'),
(206, 130, 0, 'LOG180066', 'update', 'project', 1, '2021-10-01 12:01:35', '2021-10-07 14:18:35'),
(207, 136, 0, 'LOG180069', 'add', 'project', 1, '2021-10-07 15:19:41', '2021-10-07 15:19:41'),
(208, 136, 0, 'LOG180069', 'update', 'project', 1, '2021-10-07 15:21:29', '2021-10-07 15:23:16'),
(209, 136, 128, 'LOG180069_DTP003', 'delete', 'task', 1, '2021-10-07 15:33:19', '2021-10-07 15:33:19'),
(210, 136, 129, 'LOG180069_DTC005', 'delete', 'task', 1, '2021-10-07 15:33:45', '2021-10-07 15:33:45'),
(211, 137, 0, 'LOG180070', 'add', 'project', 1, '2021-10-07 18:18:10', '2021-10-07 18:18:10'),
(212, 137, 0, 'LOG180070', 'update', 'project', 1, '2021-10-07 18:19:01', '2021-10-07 18:21:39'),
(213, 138, 0, 'LOG180071', 'add', 'project', 1, '2021-10-08 10:33:10', '2021-10-08 10:33:10'),
(214, 138, 0, 'LOG180071', 'update', 'project', 1, '2021-10-08 12:23:46', '2021-10-08 12:23:46'),
(215, 139, 0, 'LOG180072', 'add', 'project', 1, '2021-10-11 18:22:43', '2021-10-11 18:22:43'),
(216, 139, 0, 'LOG180072', 'update', 'project', 1, '2021-10-11 18:23:51', '2021-10-11 18:24:26'),
(217, 46, 32, 'LOG180013_DTC002', 'update', 'task', 1, '2021-10-12 12:12:19', '2021-10-14 17:30:19'),
(218, 140, 0, 'LOG180073', 'add', 'project', 1, '2021-10-14 10:58:05', '2021-10-14 10:58:05'),
(219, 140, 0, 'LOG180073', 'update', 'project', 1, '2021-10-14 10:59:29', '2021-10-14 11:58:22'),
(220, 140, 142, 'LOG180073_COP001', 'update', 'task', 1, '2021-10-14 11:11:01', '2021-10-14 12:03:41'),
(221, 141, 0, 'LOG180074', 'add', 'project', 1, '2021-10-14 15:20:15', '2021-10-14 15:20:15'),
(222, 141, 0, 'LOG180074', 'update', 'project', 1, '2021-10-14 15:21:25', '2021-10-14 15:26:38'),
(223, 142, 0, 'LOG180075', 'add', 'project', 1, '2021-10-18 14:36:59', '2021-10-18 14:36:59'),
(224, 142, 0, 'LOG180075', 'update', 'project', 1, '2021-10-18 14:37:50', '2021-10-18 15:10:00'),
(225, 142, 146, 'LOG180075_BAD001', 'update', 'task', 1, '2021-10-18 14:39:33', '2021-10-18 15:53:21'),
(226, 1, 0, 'Kanhasoft', 'update', 'direct_cli', 3, '2021-10-19 12:00:39', '2021-10-19 12:01:03'),
(227, 2, 147, 'LOG180001_SEO012', 'delete', 'task', 1, '2021-10-19 14:24:55', '2021-10-19 14:24:55'),
(228, 2, 148, 'LOG180001_DTP013', 'delete', 'task', 1, '2021-10-19 14:25:10', '2021-10-19 14:25:10'),
(229, 2, 149, 'LOG180001_DTC015', 'delete', 'task', 1, '2021-10-19 14:25:29', '2021-10-19 14:25:29'),
(230, 143, 0, 'LOG180076', 'add', 'project', 1, '2021-10-19 14:59:58', '2021-10-19 14:59:58'),
(231, 143, 0, 'LOG180076', 'update', 'project', 1, '2021-10-19 15:03:31', '2021-10-19 15:05:16'),
(232, 143, 150, 'LOG180076_FED001', 'update', 'task', 1, '2021-10-19 15:06:37', '2021-10-19 16:44:54'),
(233, 143, 151, 'LOG180076_FED002', 'update', 'task', 1, '2021-10-19 15:29:36', '2021-10-19 16:33:14'),
(234, 144, 0, 'LOG180077', 'add', 'project', 1, '2021-10-19 15:41:01', '2021-10-19 15:41:01'),
(235, 144, 0, 'LOG180077', 'update', 'project', 1, '2021-10-19 15:41:48', '2021-10-19 15:41:48'),
(236, 144, 152, 'LOG180077_FED001', 'update', 'task', 1, '2021-10-19 15:44:03', '2021-10-19 16:49:19'),
(237, 145, 0, 'LOG180078', 'add', 'project', 1, '2021-10-19 16:58:49', '2021-10-19 16:58:49'),
(238, 145, 0, 'LOG180078', 'update', 'project', 1, '2021-10-19 17:00:19', '2021-11-17 16:06:06'),
(239, 145, 153, 'LOG180078_SEO001', 'update', 'task', 1, '2021-10-19 17:02:58', '2021-10-19 17:03:40'),
(240, 145, 154, 'LOG180078_SEO002', 'update', 'task', 1, '2021-10-19 17:09:19', '2021-10-19 17:10:00'),
(241, 145, 155, 'LOG180078_SEO003', 'update', 'task', 1, '2021-10-19 17:15:25', '2021-10-19 17:15:25'),
(242, 145, 156, 'LOG180078_SEO004', 'update', 'task', 1, '2021-10-19 17:23:09', '2021-10-19 17:27:09'),
(243, 146, 0, 'LOG180079', 'add', 'project', 1, '2021-10-19 18:34:35', '2021-10-19 18:34:35'),
(244, 146, 0, 'LOG180079', 'update', 'project', 1, '2021-10-19 18:35:12', '2021-10-19 18:35:12'),
(245, 146, 157, 'LOG180079_DTC001', 'update', 'task', 1, '2021-10-19 18:35:36', '2021-10-19 18:36:24'),
(246, 113, 99, 'LOG180054_BAD001', 'update', 'task', 1, '2021-10-19 18:39:42', '2021-10-19 18:39:42'),
(247, 113, 159, 'LOG180054_COP003', 'update', 'task', 1, '2021-10-19 20:13:19', '2021-10-19 20:13:19'),
(248, 147, 0, 'LOG180080', 'add', 'project', 1, '2021-10-20 10:46:22', '2021-10-20 10:46:22'),
(249, 147, 0, 'LOG180080', 'update', 'project', 1, '2021-10-20 10:48:39', '2021-11-18 11:02:36'),
(250, 147, 160, 'LOG180080_TEST001', 'update', 'task', 1, '2021-10-20 10:50:52', '2021-10-20 10:50:52'),
(251, 147, 161, 'LOG180080_SEO002', 'update', 'task', 1, '2021-10-20 10:51:56', '2021-10-20 10:59:06'),
(252, 147, 162, 'LOG180080_FED003', 'update', 'task', 1, '2021-10-20 14:31:51', '2021-10-20 14:37:48'),
(253, 148, 0, 'LOG180081', 'add', 'project', 1, '2021-11-10 11:28:35', '2021-11-10 11:28:35'),
(254, 148, 0, 'LOG180081', 'update', 'project', 1, '2021-11-10 11:32:19', '2021-11-10 11:35:25'),
(255, 148, 165, 'LOG180081_DTP002', 'update', 'task', 1, '2021-11-10 17:27:45', '2021-11-10 17:27:45'),
(256, 149, 0, 'LOG180082', 'add', 'project', 1, '2021-11-17 15:26:05', '2021-11-17 15:26:05'),
(257, 149, 0, 'LOG180082', 'update', 'project', 1, '2021-11-17 15:28:21', '2021-11-17 15:33:20'),
(258, 149, 166, 'LOG180082_BAD001', 'update', 'task', 1, '2021-11-17 15:44:52', '2021-11-17 15:44:52'),
(259, 151, 0, 'LOG180083', 'add', 'project', 1, '2021-11-17 17:27:08', '2021-11-17 17:27:08'),
(260, 151, 0, 'LOG180083', 'update', 'project', 1, '2021-11-17 17:28:39', '2021-11-17 18:21:09'),
(261, 151, 167, 'LOG180083_DTP001', 'update', 'task', 1, '2021-11-17 17:46:17', '2021-11-17 17:46:17'),
(262, 151, 168, 'LOG180083_FED002', 'update', 'task', 1, '2021-11-17 18:18:08', '2021-11-17 18:18:08'),
(263, 152, 0, 'LOG180084', 'add', 'project', 1, '2021-11-17 18:43:23', '2021-11-17 18:43:23'),
(264, 152, 0, 'LOG180084', 'update', 'project', 1, '2021-11-17 18:44:16', '2021-11-17 18:46:06'),
(265, 152, 169, 'LOG180084_DTP001', 'update', 'task', 1, '2021-11-17 18:47:07', '2021-11-17 18:49:43'),
(266, 155, 0, 'LOG180085', 'add', 'project', 1, '2021-11-18 14:36:07', '2021-11-18 14:36:07'),
(267, 155, 0, 'LOG180085', 'update', 'project', 1, '2021-11-18 14:37:03', '2021-11-18 14:37:03'),
(268, 155, 170, 'LOG180085_DTP001', 'update', 'task', 1, '2021-11-18 14:37:50', '2022-03-24 14:28:22'),
(269, 157, 0, 'LOG180086', 'add', 'project', 1, '2021-12-08 18:59:21', '2021-12-08 18:59:21'),
(270, 157, 0, 'LOG180086', 'update', 'project', 1, '2021-12-08 19:00:00', '2021-12-15 16:33:37'),
(271, 157, 171, 'LOG180086_FED001', 'update', 'task', 1, '2021-12-08 19:00:45', '2021-12-13 15:24:28'),
(272, 160, 0, 'LOG180087', 'add', 'project', 1, '2021-12-14 18:40:39', '2021-12-14 18:40:39'),
(273, 160, 0, 'LOG180087', 'update', 'project', 1, '2021-12-14 18:41:50', '2021-12-15 12:23:03'),
(274, 10, 0, 'Diyal Info', 'update', 'external_res', 1, '2021-12-14 18:46:23', '2021-12-14 18:46:23'),
(275, 160, 172, 'LOG180087_SEO001', 'update', 'task', 1, '2021-12-14 19:33:44', '2021-12-15 12:18:19'),
(276, 161, 0, 'LOG180088', 'add', 'project', 1, '2021-12-15 12:08:07', '2021-12-15 12:08:07'),
(277, 161, 0, 'LOG180088', 'update', 'project', 1, '2021-12-15 12:08:49', '2021-12-15 13:11:54'),
(278, 161, 175, 'LOG180088_COP001', 'update', 'task', 1, '2021-12-15 12:10:51', '2021-12-15 15:10:15'),
(279, 160, 174, 'LOG180087_DTC004', 'delete', 'task', 1, '2021-12-15 12:12:20', '2021-12-15 12:12:20'),
(280, 160, 173, 'LOG180087_DTP002', 'delete', 'task', 1, '2021-12-15 12:12:26', '2021-12-15 12:12:26'),
(281, 163, 0, 'LOG180089', 'add', 'project', 3, '2021-12-15 15:59:26', '2021-12-15 15:59:26'),
(282, 163, 0, 'LOG180089', 'update', 'project', 3, '2021-12-15 16:00:44', '2021-12-15 16:01:32'),
(283, 163, 176, 'LOG180089_BAD001', 'update', 'task', 3, '2021-12-15 16:02:39', '2021-12-15 16:03:14'),
(284, 11, 0, 'Anil Nadiya', 'update', 'internal_res', 1, '2021-12-15 16:31:20', '2021-12-15 16:31:20'),
(285, 163, 176, 'LOG180089_BAD001', 'update', 'task', 1, '2021-12-15 18:41:11', '2022-03-28 15:32:29'),
(286, 165, 0, 'LOG180090', 'add', 'project', 1, '2022-01-10 16:58:16', '2022-01-10 16:58:16'),
(287, 165, 0, 'LOG180090', 'update', 'project', 1, '2022-01-10 16:58:59', '2022-01-10 17:26:51'),
(288, 165, 177, 'LOG180090_BAD001', 'update', 'task', 1, '2022-01-10 17:01:01', '2022-01-10 17:08:04'),
(289, 165, 178, 'LOG180090_DTP002', 'update', 'task', 1, '2022-01-10 17:01:33', '2022-01-10 17:29:10'),
(290, 165, 179, 'LOG180090_FED003', 'update', 'task', 1, '2022-01-10 17:01:55', '2022-01-10 17:30:10'),
(291, 103, 96, 'LOG180051_FED010', 'update', 'task', 1, '2022-01-11 18:25:22', '2022-03-24 14:44:07'),
(292, 166, 0, 'LOG180091', 'add', 'project', 1, '2022-02-11 15:54:06', '2022-02-11 15:54:06'),
(293, 166, 0, 'LOG180091', 'update', 'project', 1, '2022-02-11 15:55:42', '2022-02-11 15:55:42'),
(294, 166, 180, 'LOG180091_DTP001', 'update', 'task', 1, '2022-02-11 15:57:25', '2022-03-24 14:34:02'),
(295, 167, 0, 'LOG180092', 'add', 'project', 1, '2022-03-21 18:05:35', '2022-03-21 18:05:35'),
(296, 167, 0, 'LOG180092', 'update', 'project', 1, '2022-03-21 18:06:13', '2022-03-21 18:06:13'),
(297, 167, 181, 'LOG180092_SEO001', 'update', 'task', 1, '2022-03-21 18:06:41', '2022-03-21 19:13:05'),
(298, 167, 182, 'LOG180092_DTP002', 'update', 'task', 1, '2022-03-21 18:47:59', '2022-03-21 18:47:59'),
(299, 168, 0, 'LOG180093', 'add', 'project', 1, '2022-03-28 12:33:41', '2022-03-28 12:33:41'),
(300, 168, 0, 'LOG180093', 'update', 'project', 1, '2022-03-28 12:34:12', '2022-03-28 15:52:29'),
(301, 168, 184, 'LOG180093_BAD001', 'update', 'task', 1, '2022-03-28 12:35:19', '2022-03-28 12:37:48');

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
(1, 'Translation', 'TRA', 1, '2021-11-24 12:50:40', '2021-11-24 13:10:44'),
(2, 'Proofreading', 'PRF', 1, '2021-11-24 12:51:24', '2021-11-24 13:10:33'),
(3, 'Editing', 'EDT', 1, '2021-11-24 12:51:44', '2021-11-24 13:10:17'),
(4, 'Desktop Publishing', 'DTP', 1, '2021-11-24 12:52:26', '2021-11-24 13:08:57'),
(5, 'Machine Translation Editing', 'MTE', 1, '2021-11-24 12:52:45', '2021-11-24 13:08:45'),
(6, 'QA Correction', 'QAC', 1, '2021-11-24 12:53:08', '2021-11-24 13:08:35'),
(7, 'Search Engine Optimization', 'SEO', 1, '2021-11-24 12:53:30', '2021-11-24 13:08:27'),
(8, 'Subtitling', 'SUB', 1, '2021-11-24 12:54:05', '2021-11-24 13:08:14'),
(9, 'Translation + Proofreading', 'TEP', 1, '2021-11-24 12:54:29', '2021-11-24 13:07:57'),
(10, 'Transcreation', 'TRC', 1, '2021-11-24 12:56:03', '2021-11-24 13:07:43'),
(11, 'Testing', 'TES', 1, '2021-11-24 12:56:36', '2021-11-24 13:07:29'),
(12, 'LQA', 'LQA', 1, '2021-11-24 12:57:30', '2021-11-24 13:07:17'),
(13, 'Copywriting', 'COP', 1, '2021-11-24 12:57:42', '2021-11-24 13:07:09');

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
(8, 17, 4, '5', 'Delivery to client', 'DTC', '', '', '2019-01-10 19:00:18', '2019-01-10 19:00:18');

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
(2, 1, 'LOG18', '', '', 3, 1, '2018-12-12 17:00:48', '2018-12-12 00:00:00'),
(28, 2, 'LOG18', '', '', 1, 1, '2019-01-08 12:28:38', '2019-01-09 00:00:00'),
(29, 3, 'LOG18', '', '', 1, 1, '2021-02-24 17:52:54', '2021-02-24 00:00:00'),
(34, 4, 'LOG18', '', '', 1, 1, '2021-03-03 11:13:35', '2021-03-03 00:00:00'),
(35, 5, 'LOG18', '', '', 1, 1, '2021-03-03 11:55:41', '2021-05-04 00:00:00'),
(36, 6, 'LOG18', '', '', 1, 1, '2021-03-03 12:49:09', '2021-07-19 00:00:00'),
(37, 7, 'LOG18', '', '', 1, 1, '2021-03-03 12:55:09', '2021-06-22 00:00:00'),
(38, 8, 'LOG18', '', '', 1, 1, '2021-03-03 13:00:18', '2021-03-03 00:00:00'),
(40, 9, 'LOG18', '', '', 1, 1, '2021-03-03 13:08:00', '2021-03-03 00:00:00'),
(41, 10, 'LOG18', '', '', 1, 1, '2021-03-03 14:35:34', '2021-03-03 00:00:00'),
(42, 11, 'LOG18', '', '', 1, 1, '2021-04-15 23:12:53', '2021-05-03 00:00:00'),
(44, 12, 'LOG18', '', '', 1, 1, '2021-05-10 12:36:07', '2021-05-10 00:00:00'),
(46, 13, 'LOG18', '', '', 1, 1, '2021-06-02 19:16:40', '2021-06-02 00:00:00'),
(49, 14, 'LOG18', '', '', 1, 1, '2021-06-04 15:59:06', '2021-06-04 00:00:00'),
(51, 15, 'LOG18', '', '', 1, 1, '2021-06-04 17:37:26', '2021-06-04 00:00:00'),
(54, 16, 'LOG18', '', '', 1, 1, '2021-06-21 17:15:51', '2021-06-22 00:00:00'),
(55, 17, 'LOG18', '', '', 1, 1, '2021-06-22 11:43:33', '2021-06-22 00:00:00'),
(56, 18, 'LOG18', '', '', 1, 1, '2021-06-29 14:03:01', '2021-06-29 00:00:00'),
(57, 19, 'LOG18', '', '', 1, 1, '2021-06-29 15:47:40', '2021-07-02 00:00:00'),
(58, 20, 'LOG18', '', '', 1, 1, '2021-07-05 10:37:50', '2021-07-21 00:00:00'),
(59, 21, 'LOG18', '', '', 1, 1, '2021-07-06 09:43:00', '2021-07-06 00:00:00'),
(60, 22, 'LOG18', '', '', 1, 1, '2021-07-06 12:33:30', '2021-07-06 00:00:00'),
(61, 23, 'LOG18', '', '', 3, 1, '2021-07-06 12:51:38', '2021-07-06 00:00:00'),
(62, 24, 'LOG18', '', '', 1, 1, '2021-07-06 18:17:33', '2021-07-06 00:00:00'),
(63, 25, 'LOG18', '', '', 1, 1, '2021-07-12 21:25:37', '2021-07-21 00:00:00'),
(64, 26, 'LOG18', '', '', 1, 1, '2021-07-13 20:39:17', '2021-07-21 00:00:00'),
(65, 27, 'LOG18', '', '', 1, 1, '2021-07-14 10:24:59', '2021-07-14 00:00:00'),
(66, 28, 'LOG18', '', '', 1, 1, '2021-07-15 12:18:47', '2021-07-19 00:00:00'),
(67, 29, 'LOG18', '', '', 1, 1, '2021-07-15 13:07:42', '2021-07-16 00:00:00'),
(68, 30, 'LOG18', '', '', 1, 1, '2021-07-19 09:27:28', '2021-07-21 00:00:00'),
(69, 31, 'LOG18', '', '', 0, 0, '2021-07-22 13:52:25', '2021-07-22 13:55:12'),
(70, 32, 'LOG18', '', '', 1, 1, '2021-07-22 16:56:43', '2021-07-22 00:00:00'),
(71, 33, 'LOG18', '', '', 1, 1, '2021-07-22 17:03:23', '2021-07-22 00:00:00'),
(72, 34, 'LOG18', '', '', 0, 0, '2021-07-22 18:09:08', '2021-07-22 18:09:44'),
(73, 35, 'LOG18', '', '', 1, 1, '2021-07-27 11:11:31', '2021-07-27 00:00:00'),
(74, 36, 'LOG18', '', '', 1, 1, '2021-07-29 16:27:47', '2021-07-29 00:00:00'),
(75, 37, 'LOG18', '', '', 0, 0, '2021-07-29 18:47:17', '2021-07-29 18:48:34'),
(76, 38, 'LOG18', '', '', 0, 0, '2021-07-29 18:56:42', '2021-07-29 19:00:17'),
(77, 39, 'LOG18', '', '', 0, 0, '2021-07-29 19:34:52', '2021-07-29 19:36:48'),
(79, 40, 'LOG18', '', '', 0, 0, '2021-07-30 09:29:20', '2021-07-30 09:30:49'),
(80, 41, 'LOG18', '', '', 0, 0, '2021-07-30 11:07:02', '2021-07-30 11:09:07'),
(81, 42, 'LOG18', '', '', 0, 0, '2021-07-30 11:26:36', '2021-07-30 11:27:40'),
(82, 43, 'LOG18', '', '', 0, 0, '2021-07-30 12:32:40', '2021-07-30 12:33:52'),
(83, 44, 'LOG18', '', '', 0, 0, '2021-07-30 12:34:47', '2021-07-30 12:38:56'),
(84, 45, 'LOG18', '', '', 0, 0, '2021-07-30 12:54:00', '2021-07-30 12:56:27'),
(86, 46, 'LOG18', '', '', 1, 1, '2021-07-30 13:37:43', '2021-08-02 00:00:00'),
(87, 47, 'LOG18', '', '', 1, 1, '2021-08-09 10:38:13', '2021-09-15 00:00:00'),
(88, 48, 'LOG18', '', '', 1, 1, '2021-08-09 10:46:41', '2021-08-27 00:00:00'),
(100, 49, 'LOG18', '', '', 0, 0, '2021-08-27 10:26:38', '2021-08-27 10:30:33'),
(102, 50, 'LOG18', '', '', 1, 1, '2021-09-02 17:32:14', '2021-09-02 00:00:00'),
(103, 51, 'LOG18', '', '', 1, 1, '2021-09-06 11:09:32', '2021-09-06 00:00:00'),
(107, 52, 'LOG18', '', '', 1, 1, '2021-09-08 13:22:48', '2021-09-10 00:00:00'),
(111, 53, 'LOG18', '', '', 0, 0, '2021-09-13 09:34:33', '2021-09-13 09:41:17'),
(113, 54, 'LOG18', '', '', 1, 1, '2021-09-15 10:44:43', '2021-09-16 00:00:00'),
(114, 55, 'LOG18', '', '', 1, 1, '2021-09-16 16:33:20', '2021-09-17 00:00:00'),
(115, 56, 'LOG18', '', '', 3, 1, '2021-09-17 10:23:13', '2021-09-17 00:00:00'),
(117, 57, 'LOG18', '', '', 1, 1, '2021-09-17 16:26:25', '2021-09-20 00:00:00'),
(119, 58, 'LOG18', '', '', 1, 1, '2021-09-20 10:39:53', '2021-09-20 00:00:00'),
(120, 59, 'LOG18', '', '', 1, 1, '2021-09-20 10:49:03', '2021-09-20 00:00:00'),
(123, 60, 'LOG18', '', '', 1, 1, '2021-09-20 18:27:20', '2021-09-20 00:00:00'),
(124, 61, 'LOG18', '', '', 0, 0, '2021-09-20 18:48:06', '2021-09-20 18:48:32'),
(125, 62, 'LOG18', '', '', 1, 1, '2021-09-20 18:51:31', '2021-09-20 00:00:00'),
(126, 63, 'LOG18', '', '', 1, 1, '2021-09-20 18:59:42', '2021-09-20 00:00:00'),
(127, 64, 'LOG18', '', '', 1, 1, '2021-09-20 19:15:01', '2021-09-20 00:00:00'),
(128, 65, 'LOG18', '', '', 1, 1, '2021-09-21 11:11:03', '2021-10-07 00:00:00'),
(130, 66, 'LOG18', '', '', 1, 1, '2021-09-23 18:12:44', '2021-09-23 00:00:00'),
(131, 67, 'LOG18', '', '', 1, 1, '2021-09-24 10:26:05', '2021-10-19 00:00:00'),
(135, 68, 'LOG18', '', '', 1, 1, '2021-10-01 11:32:49', '2021-10-01 00:00:00'),
(136, 69, 'LOG18', '', '', 1, 1, '2021-10-07 15:18:56', '2021-10-07 00:00:00'),
(137, 70, 'LOG18', '', '', 0, 0, '2021-10-07 18:16:24', '2021-10-07 18:18:10'),
(138, 71, 'LOG18', '', '', 1, 1, '2021-10-08 10:32:00', '2021-10-08 00:00:00'),
(139, 72, 'LOG18', '', '', 1, 1, '2021-10-11 18:21:43', '2021-11-17 00:00:00'),
(140, 73, 'LOG18', '', '', 1, 1, '2021-10-14 10:55:00', '2021-10-14 00:00:00'),
(141, 74, 'LOG18', '', '', 0, 0, '2021-10-14 15:01:46', '2021-10-14 15:20:14'),
(142, 75, 'LOG18', '', '', 1, 1, '2021-10-18 14:34:13', '2021-10-18 00:00:00'),
(143, 76, 'LOG18', '', '', 1, 1, '2021-10-19 14:58:55', '2021-10-19 00:00:00'),
(144, 77, 'LOG18', '', '', 1, 1, '2021-10-19 15:39:45', '2021-10-19 00:00:00'),
(145, 78, 'LOG18', '', '', 1, 1, '2021-10-19 16:52:46', '2021-10-19 00:00:00'),
(146, 79, 'LOG18', '', '', 0, 0, '2021-10-19 18:34:13', '2021-10-19 18:34:35'),
(147, 80, 'LOG18', '', '', 1, 1, '2021-10-20 10:45:28', '2021-10-20 00:00:00'),
(148, 81, 'LOG18', '', '', 1, 1, '2021-11-10 11:27:48', '2021-11-10 00:00:00'),
(149, 82, 'LOG18', '', '', 1, 1, '2021-11-17 15:23:40', '2021-11-17 00:00:00'),
(151, 83, 'LOG18', '', '', 1, 1, '2021-11-17 17:25:53', '2021-11-17 00:00:00'),
(152, 84, 'LOG18', '', '', 0, 0, '2021-11-17 18:37:34', '2021-11-17 18:43:22'),
(155, 85, 'LOG18', '', '', 1, 1, '2021-11-18 14:35:29', '2021-11-18 00:00:00'),
(157, 86, 'LOG18', '', '', 1, 1, '2021-12-08 18:58:07', '2021-12-13 00:00:00'),
(160, 87, 'LOG18', '', '', 1, 1, '2021-12-14 18:40:14', '2021-12-14 00:00:00'),
(161, 88, 'LOG18', '', '', 1, 1, '2021-12-15 12:06:20', '2021-12-15 00:00:00'),
(163, 89, 'LOG18', '', '', 1, 1, '2021-12-15 15:59:01', '2021-12-15 00:00:00'),
(165, 90, 'LOG18', '', '', 1, 1, '2022-01-10 16:57:06', '2022-01-10 00:00:00'),
(166, 91, 'LOG18', '', '', 0, 0, '2022-02-11 15:51:11', '2022-02-11 15:54:05'),
(167, 92, 'LOG18', '', '', 1, 1, '2022-03-21 18:05:05', '2022-03-21 00:00:00'),
(168, 93, 'LOG18', '', '', 1, 1, '2022-03-28 12:32:45', '2022-03-28 00:00:00');

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

--
-- Dumping data for table `tms_passwordreset_tbl`
--

INSERT INTO `tms_passwordreset_tbl` (`id`, `iUserId`, `reset_password_token`, `created_date`, `updated_date`) VALUES
(1, 3, 'e7a1d7dd598de3e2bebe0be2b9cd48b2a99425ef', '2018-12-12 17:12:34', '2018-12-12 17:12:34');

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
(1, 2, 0, 1, '{\"tax_id\":\"NO921813201\",\"country_code\":\"NO\",\"tax_type\":\"EU without VAT\"}', '{\"payment_method\":\"Bank Transfer\",\"bank_name\":\"SBI\",\"address\":\"Bodakdev ahmedabad\",\"holder_name\":\"vijay gohil\",\"currency_code\":\"GBP,£\",\"iban\":\"123456\",\"bic\":\"123456\",\"bank_code\":\"123456\",\"paypal_address\":\"\"}', '2018-12-12 16:44:34', '2018-12-31 19:06:52'),
(2, 0, 1, 2, '{\"tax_id\":\"LU26375245\",\"country_code\":\"LU\",\"memos\":\"notes\"}', '', '2018-12-12 16:59:50', '2018-12-12 16:59:50'),
(3, 0, 2, 2, '{\"tax_id\":\"NO921990022\",\"country_code\":\"NO\",\"memos\":\"dfasdasdasd\"}', '', '2019-01-08 12:18:30', '2019-01-08 12:18:30');

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
(1, 'In prepare', '', 1, 0, 1, '2017-10-14 15:19:53', '2021-10-11 15:41:16'),
(2, 'running', '', 1, 0, 1, '2017-10-14 15:20:03', '2017-10-14 15:20:03'),
(3, 'start project', '', 1, 0, 1, '2017-10-14 15:20:13', '2017-11-23 12:54:25'),
(4, 'In Progress', '#FF9719', 1, 1, 1, '2017-10-14 15:20:24', '2018-04-26 14:31:43'),
(5, 'Working', '', 1, 0, 1, '2017-10-14 15:20:30', '2017-11-22 16:32:19'),
(8, 'New', '', 1, 0, 1, '2018-04-18 14:44:43', '2018-04-18 18:05:08'),
(11, 'Delivered', '', 1, 0, 1, '2018-05-10 17:51:38', '2018-05-10 17:51:38'),
(12, 'To be Assigned', '#F9ED1A', 1, 0, 0, '2021-03-01 10:37:52', '2021-03-01 10:37:52'),
(13, 'Completed by linguist', '#008989', 1, 0, 0, '2021-03-01 10:38:12', '2021-03-01 10:38:50'),
(14, 'QA Ready', '#4848CC', 1, 0, 0, '2021-03-01 10:38:26', '2021-03-01 10:38:26'),
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
(6, 'TEP', 'TEP', 1, 0, '2021-07-22 14:01:17', '2021-07-22 14:02:05'),
(7, 'Client Update', 'CLU', 1, 0, '2021-07-22 14:01:29', '2021-07-22 14:01:59');

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
(1, 'software', '0,2,3,4', 'software description', 1, 1, 1, 0, 0, 0, 0, '2015-10-16 14:47:14', '2018-10-03 14:35:03'),
(4, 'Language', '0,2,3', 'asd', 1, 1, 1, 1, 0, 0, 0, '2015-10-16 14:55:31', '2019-01-04 17:14:12'),
(9, 'New', '2', 'new properties', 1, 1, 0, 0, 0, 0, 0, '2015-10-24 20:02:57', '2018-05-04 15:40:32'),
(10, 'Hardware', '33,86', 'Hardware required', 1, 1, 0, 0, 1, 1, 1, '2018-04-17 18:32:28', '2021-02-23 18:11:55');

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
(1, 1, 'Oracle', 'Oracle', '2017-10-14 14:28:37', '2017-10-14 14:28:37'),
(2, 1, 'Java', 'Java', '2017-10-14 14:28:37', '2017-10-14 14:28:37'),
(4, 10, 'asas', 'asasas', '2018-03-31 15:31:47', '2018-03-31 15:31:47'),
(5, 10, '10', 'Per piece', '2018-04-17 18:32:54', '2018-04-17 18:32:54'),
(6, 10, 'keyboard', 'keyboard.', '2018-04-17 18:33:25', '2018-04-17 18:33:25'),
(7, 11, 'Khaitan', '1000', '2018-04-18 11:43:49', '2018-04-18 11:47:34'),
(8, 12, 'add', 'aadasd', '2018-04-18 16:14:47', '2018-04-18 16:14:47'),
(9, 14, 'D1', 'T1', '2018-09-28 11:01:01', '2018-09-28 11:01:01'),
(10, 14, 'D2', 'T2', '2018-09-28 11:01:49', '2018-09-28 11:01:49'),
(11, 4, 'asdasdasd', 'asdasdasdasd', '2019-01-04 17:14:51', '2019-01-04 17:14:51');

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

--
-- Dumping data for table `tms_resource_assets`
--

INSERT INTO `tms_resource_assets` (`resourceId`, `iUserId`, `job_id`, `period`, `language`, `specialist`, `technical`, `deadlines`, `flexibility`, `carryOut`, `review_memo`, `assestment`, `totalRate`, `is_active`, `created_date`, `modified_date`) VALUES
(1, 2, 1, '2018-12-27^2018-12-28', '4.5', '4', '4.5', '3.5', '4.5', '1', 'kas;dlkas;dl', '', '84', 0, '2018-12-27 10:27:56', '2018-12-27 10:27:56');

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
(6, 'Master', 'Master price rounding', 1, '2018-04-23 11:07:29', '2018-04-23 11:07:29');

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
  `csv_price` longtext NOT NULL,
  `price` longtext NOT NULL,
  `total_price` float(10,2) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_summmery_view`
--

INSERT INTO `tms_summmery_view` (`job_summmeryId`, `per_id`, `order_id`, `item_id`, `job_id`, `job_chain_id`, `appr_id`, `master_job_id`, `job_no`, `job_code`, `order_no`, `po_number`, `tmp_po_number`, `description`, `resource`, `due_date`, `contact_person`, `item_status`, `company_code`, `work_instruction`, `ItemLanguage`, `specialization`, `negative_feedback`, `late_delivery`, `auto_job`, `auto_status`, `rejection`, `csv_price`, `price`, `total_price`, `created_date`, `updated_date`) VALUES
(1, 0, 2, 1, 1, 0, 1, 1, '1', 'BAD', '', 'LOG180001_BAD001', 'LOG180001_BAD001', 'ertrtrtrt', '2', '2018-12-18 11:19:00', '5', 'Approved', 'LOG180001', '[{\"work_id\":0,\"work_name\":\"I have uploaded new document\"},{\"work_id\":1,\"work_name\":\"change layout\"},{\"work_id\":2,\"work_name\":\"Run spell check\"}]', 'English (US) > Hindi', '', '', '', '1', 'Auto', 'fgdfgsdfgsdfgdfg', '', '[{\"quantity\":\"213\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":\"0,80\",\"itemTotal\":\"170.4\"},{\"id\":null,\"quantity\":\"1277\",\"pricelist\":\"Words Translation 95-99% Match\",\"itemPrice\":\"0,13\",\"itemTotal\":\"166.01\",\"amtSum\":166.01000000000002}]', 336.42, '2018-12-13 11:02:21', '2022-03-22 14:44:35'),
(2, 0, 2, 1, 3, 0, 0, 3, '2', 'DTP', '', 'LOG180001_DTP002', 'LOG180001_DTP002', 'sadasdasdasd', '2', '2018-11-01 11:01:00', '5', 'Assigned-waiting', 'LOG180001', '[]', 'English (US) > Hindi', '', '', '', '1', 'Auto', '', '', '[{\"id\":0,\"quantity\":\"20\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,15\",\"itemTotal\":\"3\"},{\"id\":1,\"quantity\":\"50\",\"pricelist\":\"31-40 QA errors\",\"itemPrice\":\"0111\",\"itemTotal\":\"5550\",\"amtSum\":5550},{\"id\":1,\"quantity\":\"20\",\"pricelist\":\"31-40 QA errors\",\"itemPrice\":\"01\",\"itemTotal\":\"20\",\"amtSum\":20}]', 5573.00, '2018-12-13 18:53:36', '2021-10-18 10:28:03'),
(17, 0, 28, 1, 2, 0, 0, 2, '3', 'COP', '', 'LOG180002_COP003', 'LOG180002_COP003', '', '2', '2019-01-14 16:08:00', '1', 'Assigned-waiting', 'LOG180002', '[{\"work_id\":0,\"work_name\":\"changes , work instruction, please check, each point\"},{\"work_id\":1,\"work_name\":\"work done\"}]', 'Français (Canada) > Română', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":1,\"pricelist\":\"Page(s) DTP\",\"itemPrice\":\"300\",\"itemTotal\":\"300\"},{\"quantity\":\"2\",\"pricelist\":\"Discount - Quality\",\"itemPrice\":\"10\",\"itemTotal\":\"20\",\"amtSum\":20}]', 320.00, '2019-01-09 15:56:33', '2021-10-25 13:16:34'),
(18, 0, 28, 1, 3, 0, 0, 3, '4', 'DTP', '', 'LOG180002_DTP004', 'LOG180002_DTP004', '', '2', '2019-02-02 12:33:00', '5', 'In-progress', 'LOG180002', '[{\"work_id\":0,\"work_name\":\"first\"},{\"work_id\":1,\"work_name\":\"abccctestt\"}]', 'Français (Canada) > Română', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":1,\"pricelist\":\"Hour(s) Glossary Creation\",\"itemPrice\":\"100\",\"itemTotal\":\"100\",\"amtSum\":100}]', 100.00, '2019-01-09 17:11:04', '2021-09-06 17:44:27'),
(21, 0, 29, 1, 7, 17, 0, 7, '1', 'SEO', '', 'LOG180003_SEO001', 'LOG180003_SEO001', '', '', '2021-11-20 17:36:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-03-01 17:38:10', '2021-03-01 17:38:10'),
(22, 0, 29, 1, 3, 17, 0, 3, '2', 'DTP', '', 'LOG180003_DTP002', 'LOG180003_DTP002', '', '', '2021-11-20 17:36:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-03-01 17:38:10', '2021-03-01 17:38:10'),
(23, 0, 29, 1, 4, 0, 0, 4, '4', 'DTC', '', 'LOG180003_DTC004', 'LOG180003_DTC004', 'ABC', '2', '2021-11-20 17:36:00', '5', 'Approved', 'LOG180003', '[{\"work_id\":0,\"work_name\":\"ABC\"},{\"work_id\":1,\"work_name\":\"Run Qa in MemoQ\"}]', 'English (US) > Português (Brasil)', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"1\",\"pricelist\":\"Page(s) DTP\",\"itemPrice\":\"300\",\"itemTotal\":\"400.53\",\"amtSum\":\"400.53\"},{\"quantity\":\"1\",\"pricelist\":\"1-10 QA errors\",\"itemPrice\":\"1\",\"itemTotal\":\"1000\",\"amtSum\":\"1000\"},{\"quantity\":\"12\",\"pricelist\":\"Hour(s) Editing\",\"itemPrice\":\"1\",\"itemTotal\":\"12\"},{\"quantity\":\"200\",\"pricelist\":\"11-20 QA errors\",\"itemPrice\":\"12\",\"itemTotal\":\"2400\",\"amtSum\":2400}]', 3812.53, '2021-03-01 17:38:10', '2022-03-29 17:50:25'),
(24, 0, 42, 1, 7, 0, 0, 7, '1', 'SEO', '', 'LOG180011_SEO001', 'LOG180011_SEO001', '', '', '2021-05-05 16:50:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-05-03 16:51:51', '2021-05-03 16:51:51'),
(25, 0, 42, 1, 3, 0, 0, 3, '2', 'DTP', '', 'LOG180011_DTP002', 'LOG180011_DTP002', '', '', '2021-05-05 16:50:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-05-03 16:51:51', '2021-05-03 16:51:51'),
(26, 0, 42, 1, 4, 0, 0, 4, '4', 'DTC', '', 'LOG180011_DTC004', 'LOG180011_DTC004', '', '', '2021-05-05 16:50:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-05-03 16:51:52', '2021-05-03 16:51:52'),
(27, 0, 42, 2, 0, NULL, 0, 4, '5', 'DTC', '', 'LOG180011_DTC005', 'LOG180011_DTC005', '', '', '2021-05-12 12:10:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-05-04 12:10:51', '2021-05-04 12:10:51'),
(28, 0, 41, 1, 7, 17, 0, 7, '1', 'SEO', '', 'LOG180010_SEO001', 'LOG180010_SEO001', '', '', '2021-05-07 14:33:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-05-04 14:35:02', '2021-05-04 14:35:02'),
(29, 0, 41, 1, 3, 0, 0, 3, '2', 'DTP', '', 'LOG180010_DTP002', 'LOG180010_DTP002', '', '', '2021-05-07 14:33:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-05-04 14:35:03', '2021-05-04 14:35:03'),
(30, 0, 41, 1, 4, 0, 0, 4, '4', 'DTC', '', 'LOG180010_DTC004', 'LOG180010_DTC004', '', '', '2021-05-07 14:33:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-05-04 14:35:04', '2021-05-04 14:35:04'),
(31, 0, 46, 1, 0, NULL, 0, 6, '1', 'FED', '', 'LOG180013_FED001', 'LOG180013_FED001', '', '', '2021-06-02 15:00:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-06-02 19:33:07', '2021-06-02 19:33:07'),
(32, 0, 46, 1, 4, 0, 0, 4, '2', 'DTC', '', 'LOG180013_DTC002', 'LOG180013_DTC002', 'new data trans', '10', '2021-06-02 15:00:00', '5', 'Assigned-waiting', 'LOG180013', '[]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":1,\"pricelist\":\"% Surcharge\",\"itemPrice\":\"0,5\",\"itemTotal\":\"0.5\",\"amtSum\":0.5}]', 0.50, '2021-06-02 19:48:43', '2021-10-14 17:30:19'),
(33, 0, 49, 1, 4, NULL, 0, 4, '1', 'DTC', '', 'LOG180014_DTC001', 'LOG180014_DTC001', '', '', '2021-06-04 16:21:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-06-04 16:21:40', '2021-06-04 16:21:40'),
(34, 0, 2, 1, 4, 17, 0, 4, '4', 'DTC', '', 'LOG180001_DTC004', 'LOG180001_DTC004', '', '', '2019-02-09 11:44:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-06-09 09:50:46', '2021-06-09 09:50:46'),
(36, 0, 54, 1, 1, NULL, 0, 1, '1', 'BAD', '', 'LOG180016_BAD001', 'LOG180016_BAD001', '', '', '2021-06-01 17:18:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-06-21 17:19:35', '2021-06-21 17:19:35'),
(38, 0, 54, 2, 3, NULL, 0, 3, '2', 'DTP', '', 'LOG180016_DTP002', 'LOG180016_DTP002', '', '', '2021-06-02 17:38:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-06-21 17:38:27', '2021-06-21 17:38:27'),
(39, 0, 29, 3, 2, NULL, 0, 2, '5', 'COP', '', 'LOG180003_COP005', 'LOG180003_COP005', '', '', '2021-06-22 18:01:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-06-21 18:01:28', '2021-06-21 18:01:28'),
(40, 0, 35, 2, 1, 0, 0, 1, '1', 'BAD', '', 'LOG180005_BAD001', 'LOG180005_BAD001', 'ok', '2', '2021-06-14 18:07:00', '5', 'In-progress', 'LOG180005', '[{\"work_id\":0,\"work_name\":\"Run Qa in MemoQ\"},{\"work_id\":1,\"work_name\":\"Translate file(s)\"},{\"work_id\":2,\"work_name\":\"Run spell check\"}]', 'English (US) > Hindi', '', '', '', '1', 'Auto', '', '', '[{\"id\":0,\"quantity\":\"20\",\"pricelist\":\"Words Proofreading 100% Match\",\"itemPrice\":\"0,20\",\"itemTotal\":\"4\"},{\"id\":1,\"quantity\":\"50\",\"pricelist\":\"1-10 QA errors\",\"itemPrice\":\"1,08\",\"itemTotal\":\"54\"}]', 58.00, '2021-06-21 18:08:02', '2021-11-09 11:58:09'),
(41, 0, 35, 1, 0, 0, 0, 1, '2', 'BAD', '', 'LOG180005_BAD002', 'LOG180005_BAD002', 'opk', '2', '2021-06-21 19:13:00', '5', 'In-progress', 'LOG180005', '[{\"work_id\":0,\"work_name\":\"Run spell check\"},{\"work_id\":1,\"work_name\":\"Testing\"}]', 'English (US) > Norwegian (bokmal)', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"1160\",\"pricelist\":\"Words Translation Repetition Match\",\"itemPrice\":0,\"itemTotal\":0},{\"id\":null,\"quantity\":\"0\",\"pricelist\":\"Words Translation 101% Match\",\"itemPrice\":0,\"itemTotal\":0},{\"id\":null,\"quantity\":\"213\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":\"2,00\",\"itemTotal\":\"138\"},{\"id\":null,\"quantity\":\"1277\",\"pricelist\":\"Words Translation 95%-99% Match\",\"itemPrice\":\"0,12\",\"itemTotal\":\"11.87\"},{\"id\":null,\"quantity\":\"1190\",\"pricelist\":\"Words Translation 85%-94% Match\",\"itemPrice\":\"0,25\",\"itemTotal\":\"14.75\"},{\"id\":null,\"quantity\":\"2046\",\"pricelist\":\"Words Translation 75%-84% Match\",\"itemPrice\":0,\"itemTotal\":0},{\"id\":null,\"quantity\":\"6075\",\"pricelist\":\"Words Translation 50%-74% Match\",\"itemPrice\":0,\"itemTotal\":0},{\"id\":null,\"quantity\":\"10205\",\"pricelist\":\"Words Translation No match\",\"itemPrice\":0,\"itemTotal\":0}]', 164.63, '2021-06-21 19:15:46', '2021-11-17 12:12:59'),
(42, 0, 55, 1, 2, NULL, 0, 2, '1', 'COP', '', 'LOG180017_COP001', 'LOG180017_COP001', '', '', '2021-06-25 11:46:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-06-22 11:47:02', '2021-06-22 11:47:02'),
(43, 0, 38, 1, 0, NULL, 0, 7, '1', 'SEO', '', 'LOG180008_SEO001', 'LOG180008_SEO001', '', '', '2021-06-24 00:20:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-06-22 13:18:31', '2021-06-22 13:18:31'),
(44, 0, 37, 1, 0, NULL, 0, 3, '1', 'DTP', '', 'LOG180007_DTP001', 'LOG180007_DTP001', '', '', '2021-06-24 02:52:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-06-22 17:53:23', '2021-06-22 17:53:23'),
(45, 0, 56, 1, 0, NULL, 0, 6, '1', 'FED', '', 'LOG180018_FED001', 'LOG180018_FED001', '', '', '2021-06-30 15:00:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-06-29 14:13:12', '2021-06-29 14:13:12'),
(49, 0, 28, 2, 4, 17, 0, 4, '5', 'DTC', '', 'LOG180002_DTC005', 'LOG180002_DTC005', '', '', '2019-02-02 15:37:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-06-30 09:21:07', '2021-06-30 09:21:07'),
(50, 0, 29, 3, 6, NULL, 0, 6, '6', 'FED', '', 'LOG180003_FED006', 'LOG180003_FED006', '', '', '2021-06-22 18:01:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-06-30 11:10:47', '2021-06-30 11:10:47'),
(51, 0, 57, 1, 4, 0, 0, 4, '1', 'DTC', '', 'LOG180019_DTC001', 'LOG180019_DTC001', 'ABC', '2', '1970-01-01 05:30:00', '5', 'In-progress', 'LOG180019', '[]', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"1\",\"pricelist\":\"11-20 QA errors\",\"itemPrice\":\"1\",\"itemTotal\":\"1\"},{\"quantity\":\"2\",\"pricelist\":\"Available price unit 2\",\"itemPrice\":\"1\",\"itemTotal\":\"2\"}]', 3.00, '2021-07-02 19:37:19', '2021-07-02 19:40:29'),
(52, 0, 58, 1, 0, 0, 0, 2, '1', 'COP', '', 'LOG180020_COP001', 'LOG180020_COP001', 'ABC', '2', '2021-07-07 10:40:00', '5', 'In-progress', 'LOG180020', '[{\"work_id\":\"\",\"work_name\":\"\"},{\"work_id\":\"1\",\"work_name\":\"Run Qa in MemoQ\"},{\"work_id\":\"2\",\"work_name\":\"Use test@gmial.com email to collect data\"}]', 'English (US) > Polski', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"1\",\"pricelist\":\"% Partial payment\",\"itemPrice\":\"3,25\",\"itemTotal\":\"3.25\"},{\"quantity\":\"2\",\"pricelist\":\"11-20 QA errors\",\"itemPrice\":\"1\",\"itemTotal\":\"2\"},{\"quantity\":\"3\",\"pricelist\":\"Page(s) DTP\",\"itemPrice\":\"300\",\"itemTotal\":\"900\"}]', 905.25, '2021-07-05 10:40:59', '2021-07-05 10:53:18'),
(53, 0, 58, 2, 0, NULL, 0, 3, '2', 'DTP', '', 'LOG180020_DTP002', 'LOG180020_DTP002', '', '', '2021-07-06 10:43:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-07-05 10:44:03', '2021-07-05 10:44:03'),
(54, 0, 59, 1, 0, 0, 0, 2, '1', 'COP', '', 'LOG180021_COP001', 'LOG180021_COP001', 'Test321 hbdubx', '2', '2021-07-17 09:52:00', '1', 'In-progress', 'LOG180021', '[]', 'Eesti > Norsk (nynorsk)', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"7\",\"pricelist\":\"Hour(s) DTP\",\"itemPrice\":\"1\",\"itemTotal\":\"7\"}]', 7.00, '2021-07-06 09:53:09', '2021-07-06 10:05:17'),
(55, 0, 59, 2, 0, 0, 0, 6, '2', 'FED', '', 'LOG180021_FED002', 'LOG180021_FED002', 'test22222', '2', '2021-07-09 09:49:00', '5', 'Delivered', 'LOG180021', '[]', 'Eesti > Norsk (nynorsk)', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"3\",\"pricelist\":\"31-40 QA errors\",\"itemPrice\":\"1\",\"itemTotal\":\"3\"},{\"quantity\":\"4\",\"pricelist\":\"Batch Delivery\",\"itemPrice\":\"1\",\"itemTotal\":\"4\"},{\"quantity\":\"7\",\"pricelist\":\"Words subtitling with timecoding\",\"itemPrice\":\"1\",\"itemTotal\":\"7\"}]', 14.00, '2021-07-06 09:54:40', '2021-07-06 11:37:35'),
(56, 0, 60, 1, 0, NULL, 0, 8, '1', 'TEST', '', 'LOG180022_TEST001', 'LOG180022_TEST001', '', '', '2021-07-10 10:00:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-07-06 12:40:20', '2021-07-06 12:40:20'),
(57, 0, 61, 1, 8, 0, 0, 8, '1', 'TEST', '', 'LOG180023_TEST001', 'LOG180023_TEST001', 'ABC', '2', '2021-07-07 12:57:00', '5', 'In-progress', 'LOG180023', '[{\"work_id\":0,\"work_name\":\"test apart, test2eqkdnkqd\"},{\"work_id\":1,\"work_name\":\"Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.\"},{\"work_id\":2,\"work_name\":\"newwsbjhiuhss\"},{\"work_id\":3,\"work_name\":\"asmjbkahskHsIHlszhLSHls\"},{\"work_id\":4,\"work_name\":\"after comma part\"}]', 'Dansk > English (US)', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"76\",\"pricelist\":\"Batch Delivery\",\"itemPrice\":\"18\",\"itemTotal\":\"1368\",\"amtSum\":1368}]', 1368.00, '2021-07-06 12:57:30', '2021-07-06 16:33:20'),
(58, 0, 62, 1, 6, 0, 0, 6, '1', 'FED', '', 'LOG180024_FED001', 'LOG180024_FED001', 'jkhk', '2', '2021-07-08 23:59:00', '5', 'In-progress', 'LOG180024', '[{\"work_id\":0,\"work_name\":\"jnknjnknknknkn, jknknkm\"},{\"work_id\":1,\"work_name\":\"jnkn\"}]', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"6\",\"pricelist\":\"Available price unit\",\"itemPrice\":\"2\",\"itemTotal\":\"12\"},{\"quantity\":\"9\",\"pricelist\":\"Words subtitling with timecoding\",\"itemPrice\":\"1\",\"itemTotal\":\"9\"}]', 21.00, '2021-07-06 20:34:52', '2021-07-06 20:37:55'),
(59, 0, 64, 1, 0, 0, 0, 2, '1', 'COP', '', 'LOG180026_COP001', 'LOG180026_COP001', 'Abc', '2', '2021-07-13 20:44:00', '1', 'In-progress', 'LOG180026', '[{\"work_id\":0,\"work_name\":\"TUHIHI\"},{\"work_id\":1,\"work_name\":\"ABC\"},{\"work_id\":2,\"work_name\":\"nnklklm;m;m;m;m;m;m;m;m;\"},{\"work_id\":3,\"work_name\":\"fcceb bb\"}]', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"6\",\"pricelist\":\"Words Proofreading (New)\",\"itemPrice\":\"7\",\"itemTotal\":\"42\",\"amtSum\":42},{\"quantity\":\"676\",\"pricelist\":\"1-10 QA errors\",\"itemPrice\":\"1\",\"itemTotal\":\"676\"},{\"quantity\":\"90\",\"pricelist\":\"Minute(s) subtitling without timecoding\",\"itemPrice\":\"1\",\"itemTotal\":\"90\"},{\"quantity\":\"70\",\"pricelist\":\"Available price unit 2\",\"itemPrice\":\"1\",\"itemTotal\":\"70\"}]', 878.00, '2021-07-13 20:45:25', '2021-07-13 21:03:56'),
(60, 0, 67, 1, 2, 0, 0, 2, '1', 'COP', '', 'LOG180029_COP001', 'LOG180029_COP001', 'ABC', '2', '2021-07-15 13:10:00', '5', 'In-progress', 'LOG180029', '[{\"work_id\":0,\"work_name\":\"Instruction 2wefdewcwecfecf\"},{\"work_id\":1,\"work_name\":\"Instruction 2\"},{\"work_id\":2,\"work_name\":\"Innjnk\"}]', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"1\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"1,5\",\"itemTotal\":\"1.5\",\"amtSum\":1.5},{\"quantity\":\"20\",\"pricelist\":\"Discount - Quality\",\"itemPrice\":\"1\",\"itemTotal\":\"20\"},{\"quantity\":\"200\",\"pricelist\":\"1-10 QA errors\",\"itemPrice\":\"8,5\",\"itemTotal\":\"1700\",\"amtSum\":1700}]', 1721.50, '2021-07-15 13:11:26', '2021-07-15 13:39:00'),
(61, 0, 51, 1, 0, 0, 0, 3, '1', 'DTP', '', 'LOG180015_DTP001', 'LOG180015_DTP001', 'jk', '2', '2021-07-17 19:50:00', '1', 'In-progress', 'LOG180015', '[]', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-07-16 19:51:02', '2021-07-16 20:15:56'),
(62, 0, 68, 1, 3, 0, 0, 3, '1', 'DTP', '', 'LOG180030_DTP001', 'LOG180030_DTP001', 'ABC', '2', '2021-07-26 09:30:00', '5', 'In-progress', 'LOG180030', '[{\"work_id\":0,\"work_name\":\"try this hguhhoj;k;k;kk\'k\' ,n;km\' case\"},{\"work_id\":1,\"work_name\":\"try this second case\"},{\"work_id\":2,\"work_name\":\"test this first case\"}]', '‏Íslenska > Suomi', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"10\",\"pricelist\":\"1-10 QA errors\",\"itemPrice\":\"10\",\"itemTotal\":\"100\",\"amtSum\":100},{\"quantity\":\"15\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"1\",\"itemTotal\":\"15\"},{\"quantity\":\"20\",\"pricelist\":\"Batch Delivery\",\"itemPrice\":\"1\",\"itemTotal\":\"20\"}]', 135.00, '2021-07-19 09:31:20', '2021-07-19 09:42:27'),
(63, 0, 68, 2, 2, NULL, 0, 2, '2', 'COP', '', 'LOG180030_COP002', 'LOG180030_COP002', '', '', '2021-07-21 10:34:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-07-19 10:35:55', '2021-07-19 10:35:55'),
(64, 0, 66, 1, 7, 17, 0, 7, '1', 'SEO', '', 'LOG180028_SEO001', 'LOG180028_SEO001', 'lkj', '2', '2021-07-21 20:01:00', '5', 'In-progress', 'LOG180028', '[{\"work_id\":0,\"work_name\":\"lajsl\"}]', 'Català > ‏Íslenska', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"10\",\"pricelist\":\"Available price unit\",\"itemPrice\":\"2\",\"itemTotal\":\"20\"}]', 20.00, '2021-07-19 20:02:03', '2021-07-19 20:05:36'),
(65, 0, 66, 1, 3, 0, 0, 3, '2', 'DTP', '', 'LOG180028_DTP002', 'LOG180028_DTP002', '', '', '2021-07-21 20:01:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-07-19 20:02:04', '2021-07-19 20:02:04'),
(66, 0, 66, 1, 4, 0, 0, 4, '4', 'DTC', '', 'LOG180028_DTC004', 'LOG180028_DTC004', '', '', '2021-07-21 20:01:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-07-19 20:02:04', '2021-07-19 20:02:04'),
(67, 0, 69, 1, 7, 0, 0, 7, '1', 'SEO', '', 'LOG180031_SEO001', 'LOG180031_SEO001', '', '', '2021-07-22 15:00:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-07-22 14:06:00', '2021-07-22 14:06:00'),
(68, 0, 69, 1, 3, 0, 0, 3, '2', 'DTP', '', 'LOG180031_DTP002', 'LOG180031_DTP002', '', '', '2021-07-22 15:00:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-07-22 14:06:00', '2021-07-22 14:06:00'),
(69, 0, 69, 1, 4, 0, 0, 4, '4', 'DTC', '', 'LOG180031_DTC004', 'LOG180031_DTC004', '', '', '2021-07-22 15:00:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-07-22 14:06:00', '2021-07-22 14:06:00'),
(70, 0, 69, 1, 6, 0, 0, 6, '5', 'FED', '', 'LOG180031_FED005', 'LOG180031_FED005', '', '2', '2021-07-22 15:00:00', '1', 'In-progress', 'LOG180031', '[{\"work_id\":0,\"work_name\":\"Read and follow uploaded Word document\"}]', 'English (US) > Norsk (bokmål)', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"500\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,08\",\"itemTotal\":\"40\",\"amtSum\":40}]', 40.00, '2021-07-22 14:15:31', '2021-07-22 14:18:56'),
(71, 0, 34, 1, 0, 0, 0, 8, '1', 'TEST', '', 'LOG180004_TEST001', 'LOG180004_TEST001', 'uju', '2', '2021-07-23 16:31:00', '1', 'Delivered', 'LOG180004', '[]', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-07-22 16:31:35', '2021-09-17 10:45:09'),
(73, 0, 2, 6, 2, 0, 0, 2, '10', 'COP', '', 'LOG180001_COP010', 'LOG180001_COP010', '', '2', '2021-07-23 12:22:00', '5', 'Approved', 'LOG180001', '[]', 'Hindi > Suomi', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":1,\"pricelist\":\"Page(s) DTP\",\"itemPrice\":\"5\",\"itemTotal\":\"5\",\"amtSum\":5},{\"quantity\":\"11\",\"pricelist\":\"Words Translation 50-74% Match\",\"itemPrice\":\"0,6\",\"itemTotal\":\"6.6\",\"amtSum\":6.6}]', 11.60, '2021-07-22 17:23:44', '2022-03-22 10:53:46'),
(74, 0, 71, 1, 2, 0, 0, 2, '1', 'COP', '', 'LOG180033_COP001', 'LOG180033_COP001', 'asd', '2', '2021-07-24 23:59:00', '5', 'In-progress', 'LOG180033', '[{\"work_id\":0,\"work_name\":\"sad\"}]', '‏Íslenska > Suomi', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-07-22 17:55:31', '2021-07-22 18:00:54'),
(75, 0, 71, 2, 0, NULL, 0, 3, '2', 'DTP', '', 'LOG180033_DTP002', 'LOG180033_DTP002', '', '', '2021-07-25 18:03:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-07-22 18:04:03', '2021-07-22 18:04:03'),
(76, 0, 70, 1, 2, NULL, 0, 2, '1', 'COP', '', 'LOG180032_COP001', 'LOG180032_COP001', '', '', '2021-06-29 18:04:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-07-22 18:05:11', '2021-07-22 18:05:11'),
(77, 0, 73, 1, 3, 0, 0, 3, '1', 'DTP', '', 'LOG180035_DTP001', 'LOG180035_DTP001', 'ABC', '2', '2021-07-30 11:19:00', '5', 'Delivered', 'LOG180035', '[{\"work_id\":0,\"work_name\":\"ABC\"}]', 'Estonian > English (US)', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"30\",\"pricelist\":\"Hour(s) DTP\",\"itemPrice\":\"1\",\"itemTotal\":\"30\"},{\"quantity\":\"1000\",\"pricelist\":\"Page(s) Proofreading\",\"itemPrice\":\"1\",\"itemTotal\":\"1000\"}]', 1030.00, '2021-07-27 11:20:31', '2021-07-29 17:30:59'),
(78, 0, 74, 1, 0, 0, 0, 3, '1', 'DTP', '', 'LOG180036_DTP001', 'LOG180036_DTP001', 'Test', '2', '2021-07-29 16:32:00', '5', 'In-progress', 'LOG180036', '[{\"work_id\":0,\"work_name\":\"7686\"}]', 'Catalan > English (US)', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"1\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"10\",\"itemTotal\":\"10\",\"amtSum\":10}]', 10.00, '2021-07-29 16:32:26', '2021-07-29 17:07:06'),
(79, 0, 74, 2, 0, 0, 0, 2, '2', 'COP', '', 'LOG180036_COP002', 'LOG180036_COP002', 'kjhk', '2', '2021-07-31 17:10:00', '5', 'In-progress', 'LOG180036', '[]', 'Catalan > English (US)', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"70\",\"pricelist\":\"Page(s) Proofreading\",\"itemPrice\":\"1\",\"itemTotal\":\"70\"},{\"quantity\":\"10\",\"pricelist\":\"Batch Delivery\",\"itemPrice\":\"1\",\"itemTotal\":\"10\",\"amtSum\":10}]', 80.00, '2021-07-29 17:11:11', '2021-07-29 17:14:56'),
(80, 0, 63, 1, 0, 0, 0, 6, '1', 'FED', '', 'LOG180025_FED001', 'LOG180025_FED001', 'kj', '2', '2021-07-30 17:57:00', '5', 'In-progress', 'LOG180025', '[{\"work_id\":0,\"work_name\":\"879898\"},{\"work_id\":1,\"work_name\":\"knknlkn\"}]', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"1\",\"pricelist\":\"Hour(s) Editing\",\"itemPrice\":\"30\",\"itemTotal\":\"30\",\"amtSum\":30}]', 30.00, '2021-07-29 17:58:01', '2021-07-29 18:07:53'),
(81, 0, 63, 2, 0, 0, 0, 1, '2', 'BAD', '', 'LOG180025_BAD002', 'LOG180025_BAD002', 'ABC', '2', '2021-08-05 18:24:00', '1', 'In-progress', 'LOG180025', '[{\"work_id\":0,\"work_name\":\"abc768768\"}]', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"10\",\"pricelist\":\"Rush fee\",\"itemPrice\":\"200\",\"itemTotal\":\"2000\"}]', 2000.00, '2021-07-29 18:25:14', '2021-07-29 18:27:33'),
(82, 0, 86, 1, 0, 0, 0, 2, '1', 'COP', '', 'LOG180046_COP001', 'LOG180046_COP001', 'ABC', '2', '2021-07-01 13:40:00', '5', 'In-progress', 'LOG180046', '[{\"work_id\":0,\"work_name\":\"8789797\"},{\"work_id\":1,\"work_name\":\"jhihih\"},{\"work_id\":2,\"work_name\":\"khk\"}]', 'Danish > English (US)', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"2\",\"pricelist\":\"% Surcharge\",\"itemPrice\":\"10\",\"itemTotal\":\"20\",\"amtSum\":20}]', 20.00, '2021-07-30 13:40:40', '2021-07-30 13:43:11'),
(83, 0, 2, 7, 2, 0, 0, 2, '11', 'COP', '', 'LOG180001_COP011', 'LOG180001_COP011', 'ok', '2', '2021-08-26 19:11:00', '5', 'Approved', 'LOG180001', '[]', 'Hindi > Hindi', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"50\",\"pricelist\":\"Words Translation 95-99% Match\",\"itemPrice\":\"30\",\"itemTotal\":\"1500\",\"amtSum\":1500}]', 1500.00, '2021-08-26 19:12:54', '2022-03-28 12:10:09'),
(84, 0, 102, 1, 2, 0, 0, 2, '1', 'COP', '', 'LOG180050_COP001', 'LOG180050_COP001', 'Test job 1', '2', '2021-09-02 17:48:00', '1', 'In-progress', 'LOG180050', '[{\"work_id\":0,\"work_name\":\"Test\"},{\"work_id\":1,\"work_name\":\"ABC\"}]', 'English (US) > Hindi', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"1\",\"pricelist\":\"Batch Delivery\",\"itemPrice\":\"100\",\"itemTotal\":\"100\",\"amtSum\":100},{\"id\":0,\"quantity\":\"1\",\"pricelist\":\"Words Proofreading 100% Match\",\"itemPrice\":\"0,2\",\"itemTotal\":\"0.2\"},{\"id\":1,\"quantity\":\"2\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,20\",\"itemTotal\":\"0.4\"}]', 100.60, '2021-09-02 17:40:13', '2021-10-20 11:12:18'),
(85, 0, 102, 2, 0, 0, 0, 6, '2', 'FED', '', 'LOG180050_FED002', 'LOG180050_FED002', 'ABC', '2', '2021-09-02 17:41:00', '5', 'Without invoice', 'LOG180050', '[{\"work_id\":0,\"work_name\":\"Check First Doc\"},{\"work_id\":1,\"work_name\":\"Test first\"}]', 'English (US) > Icelandic', '', '', '', '1', 'Auto', '', '', '[{\"id\":0,\"quantity\":\"1\",\"pricelist\":\"Words Proofreading 100% Match\",\"itemPrice\":0,\"itemTotal\":0},{\"id\":1,\"quantity\":\"2\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":0,\"itemTotal\":0}]', 0.00, '2021-09-02 17:42:02', '2021-10-20 11:12:38'),
(86, 0, 102, 3, 0, 0, 0, 2, '3', 'COP', '', 'LOG180050_COP003', 'LOG180050_COP003', 'OKTEST', '2', '2021-09-02 18:39:00', '1', 'Delivered', 'LOG180050', '[]', 'Danish > English (US)', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"2\",\"pricelist\":\"Hour(s) Proofreading\",\"itemPrice\":\"17\",\"itemTotal\":\"34\",\"amtSum\":34},{\"quantity\":\"5\",\"pricelist\":\"Batch Delivery\",\"itemPrice\":\"10\",\"itemTotal\":\"50\",\"amtSum\":50}]', 84.00, '2021-09-02 18:40:28', '2021-09-03 14:30:58'),
(87, 0, 103, 1, 1, 0, 0, 1, '1', 'BAD', '', 'LOG180051_BAD001', 'LOG180051_BAD001', 'uyiuy', '2', '2021-09-06 11:28:00', '1', 'In-progress', 'LOG180051', '[{\"work_id\":0,\"work_name\":\"ABBBC\"}]', 'Danish > Estonian', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"10\",\"pricelist\":\"Hour(s) Editing\",\"itemPrice\":\"188\",\"itemTotal\":\"1880\",\"amtSum\":1880},{\"id\":0,\"quantity\":\"20\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,15\",\"itemTotal\":\"3\"},{\"id\":1,\"quantity\":\"50\",\"pricelist\":\"31-40 QA errors\",\"itemPrice\":0,\"itemTotal\":0},{\"id\":0,\"quantity\":\"1\",\"pricelist\":\"Words Proofreading 100% Match\",\"itemPrice\":\"0,2\",\"itemTotal\":\"0.2\"},{\"id\":1,\"quantity\":\"2\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,20\",\"itemTotal\":\"0.4\"}]', 1883.60, '2021-09-06 11:28:45', '2021-11-11 14:44:01'),
(88, 0, 103, 2, 0, NULL, 0, 2, '2', 'COP', '', 'LOG180051_COP002', 'LOG180051_COP002', '', '', '2021-09-06 16:30:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-09-06 16:31:08', '2021-09-06 16:31:08'),
(89, 0, 103, 3, 0, NULL, 0, 7, '3', 'SEO', '', 'LOG180051_SEO003', 'LOG180051_SEO003', '', '', '2021-09-08 16:29:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-09-06 16:33:23', '2021-09-06 16:33:23'),
(90, 0, 103, 4, 0, NULL, 0, 1, '4', 'BAD', '', 'LOG180051_BAD004', 'LOG180051_BAD004', '', '', '2021-09-16 16:34:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-09-06 16:36:11', '2021-09-06 16:36:11'),
(91, 0, 103, 6, 0, NULL, 0, 6, '5', 'FED', '', 'LOG180051_FED005', 'LOG180051_FED005', '', '', '2021-09-06 16:37:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-09-06 16:38:09', '2021-09-06 16:38:09'),
(92, 0, 103, 7, 8, NULL, 0, 8, '6', 'TEST', '', 'LOG180051_TEST006', 'LOG180051_TEST006', '', '', '2021-09-06 16:38:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-09-06 16:39:24', '2021-09-06 16:39:24'),
(93, 0, 103, 8, 7, NULL, 0, 7, '7', 'SEO', '', 'LOG180051_SEO007', 'LOG180051_SEO007', '', '', '2021-09-06 16:40:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-09-06 16:40:48', '2021-09-06 16:40:48'),
(94, 0, 103, 9, 0, NULL, 0, 8, '8', 'TEST', '', 'LOG180051_TEST008', 'LOG180051_TEST008', '', '', '2021-09-06 16:41:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-09-06 16:42:21', '2021-09-06 16:42:21'),
(95, 0, 103, 10, 0, NULL, 0, 4, '9', 'DTC', '', 'LOG180051_DTC009', 'LOG180051_DTC009', '', '', '2021-09-06 16:42:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-09-06 16:43:27', '2021-09-06 16:43:27'),
(96, 0, 103, 11, 0, 0, 0, 6, '10', 'FED', '', 'LOG180051_FED010', 'LOG180051_FED010', '', '2', '2022-01-11 19:44:00', '5', 'Approved', 'LOG180051', '[]', 'English (US) > Slovenian', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"200\",\"pricelist\":\"Hour(s) Translation\",\"itemPrice\":\"1\",\"itemTotal\":\"200\"}]', 200.00, '2021-09-06 16:44:27', '2022-03-24 14:44:07'),
(97, 0, 107, 1, 0, 0, 0, 1, '1', 'BAD', '', 'LOG180052_BAD001', 'LOG180052_BAD001', 'test script', '2', '2021-09-13 10:34:00', '5', 'Ready to be Delivered', 'LOG180052', '[{\"work_id\":0,\"work_name\":\"test54\"}]', 'English (US) > Hindi', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"1000\",\"pricelist\":\"Discount - Quality\",\"itemPrice\":\"1\",\"itemTotal\":\"1000\",\"amtSum\":1000},{\"quantity\":\"20\",\"pricelist\":\"Available price unit 2\",\"itemPrice\":\"6\",\"itemTotal\":\"120\",\"amtSum\":120},{\"id\":0,\"quantity\":\"1\",\"pricelist\":\"Words Proofreading 100% Match\",\"itemPrice\":\"0,5\",\"itemTotal\":\"0.5\"},{\"id\":1,\"quantity\":\"2\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,15\",\"itemTotal\":\"0.3\"}]', 1120.80, '2021-09-13 10:36:27', '2021-10-18 10:44:34'),
(98, 0, 107, 2, 0, 0, 0, 2, '2', 'COP', '', 'LOG180052_COP002', 'LOG180052_COP002', '', '', '2021-09-13 09:43:00', '1', 'Delivered', 'LOG180052', '[]', 'Estonian > Icelandic', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-09-13 10:46:31', '2021-09-16 13:05:11'),
(99, 0, 113, 1, 0, 0, 0, 1, '1', 'BAD', '', 'LOG180054_BAD001', 'LOG180054_BAD001', '', '2', '2021-09-15 05:47:00', '1', 'In-progress', 'LOG180054', '[]', 'English (US) > Hindi', '', '', '', '1', 'Auto', '', '', '[]', 0.00, '2021-09-15 10:48:12', '2021-10-19 18:39:42'),
(100, 0, 113, 2, 0, NULL, 0, 1, '2', 'BAD', '', 'LOG180054_BAD002', 'LOG180054_BAD002', '', '', '2021-09-15 05:49:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-09-15 10:50:39', '2021-09-15 10:50:39'),
(101, 0, 61, 1, 2, NULL, 0, 2, '2', 'COP', '', 'LOG180023_COP002', 'LOG180023_COP002', '', '', '2021-07-07 12:57:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-09-16 16:15:17', '2021-09-16 16:15:17'),
(102, 0, 61, 4, 3, NULL, 0, 3, '3', 'DTP', '', 'LOG180023_DTP003', 'LOG180023_DTP003', '', '', '2021-09-16 16:23:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-09-16 16:23:57', '2021-09-16 16:23:57'),
(103, 0, 114, 1, 4, 0, 0, 4, '1', 'DTC', '', 'LOG180055_DTC001', 'LOG180055_DTC001', 'tyyry', '2', '2021-09-18 16:35:00', '5', 'In-progress', 'LOG180055', '[{\"work_id\":0,\"work_name\":\"tyty\"}]', 'Estonian > English (US)', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"6\",\"pricelist\":\"Hour(s) Editing\",\"itemPrice\":\"1\",\"itemTotal\":\"6\"}]', 6.00, '2021-09-16 16:35:34', '2021-09-16 16:35:59'),
(104, 0, 115, 1, 7, 17, 0, 7, '1', 'SEO', '', 'LOG180056_SEO001', 'LOG180056_SEO001', 'fdgdg', '2', '2021-09-17 10:30:00', '1', 'In-progress', 'LOG180056', '[]', 'Danish > Hindi', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"2\",\"pricelist\":\"Discount - Quality\",\"itemPrice\":\"1\",\"itemTotal\":\"2\"}]', 2.00, '2021-09-17 10:30:56', '2021-09-17 15:49:36'),
(105, 0, 115, 1, 3, 0, 0, 3, '2', 'DTP', '', 'LOG180056_DTP002', 'LOG180056_DTP002', 'werwr', '2', '2021-09-17 10:30:00', '5', 'In-progress', 'LOG180056', '[]', 'Danish > Hindi', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"4\",\"pricelist\":\"Hour(s) DTP\",\"itemPrice\":\"1\",\"itemTotal\":\"4\"}]', 4.00, '2021-09-17 10:30:57', '2021-09-17 15:50:00'),
(106, 0, 115, 1, 4, 0, 0, 4, '4', 'DTC', '', 'LOG180056_DTC004', 'LOG180056_DTC004', 'ewr', '2', '2021-09-17 10:30:00', '5', 'In-progress', 'LOG180056', '[]', 'Danish > Hindi', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"4\",\"pricelist\":\"Hour(s) Editing\",\"itemPrice\":\"1\",\"itemTotal\":\"4\"}]', 4.00, '2021-09-17 10:30:58', '2021-09-17 15:50:19'),
(107, 0, 114, 2, 4, NULL, 0, 4, '2', 'DTC', '', 'LOG180055_DTC002', 'LOG180055_DTC002', '', '', '2021-09-17 11:22:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-09-17 11:22:28', '2021-09-17 11:22:28'),
(108, 0, 117, 1, 4, 0, 0, 4, '1', 'DTC', '', 'LOG180057_DTC001', 'LOG180057_DTC001', 'test54', '2', '2021-09-20 05:28:00', '5', 'In-progress', 'LOG180057', '[]', 'Estonian > French (France)', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"56\",\"pricelist\":\"Hour(s) Editing\",\"itemPrice\":\"1\",\"itemTotal\":\"56\"}]', 56.00, '2021-09-17 16:29:16', '2021-09-17 16:31:22'),
(109, 0, 117, 2, 2, 0, 0, 2, '2', 'COP', '', 'LOG180057_COP002', 'LOG180057_COP002', 'ABC', '2', '2021-09-17 16:30:00', '1', 'In-progress', 'LOG180057', '[]', 'Estonian > French (France)', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"60\",\"pricelist\":\"Batch Delivery\",\"itemPrice\":\"1\",\"itemTotal\":\"60\"}]', 60.00, '2021-09-17 16:30:18', '2021-09-17 16:34:24'),
(110, 0, 119, 1, 2, 0, 0, 2, '1', 'COP', '', 'LOG180058_COP001', 'LOG180058_COP001', 'fgh', '2', '2021-09-20 10:44:00', '1', 'Delivered', 'LOG180058', '[]', 'English (US) > Icelandic', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-09-20 10:45:18', '2021-09-20 18:09:29'),
(111, 0, 120, 1, 2, NULL, 0, 2, '1', 'COP', '', 'LOG180059_COP001', 'LOG180059_COP001', '', '', '2021-09-20 10:55:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-09-20 10:50:18', '2021-09-20 10:50:18'),
(112, 0, 123, 1, 6, 0, 0, 6, '1', 'FED', '', 'LOG180060_FED001', 'LOG180060_FED001', 'okokoko', '2', '2021-09-01 18:29:00', '1', 'In-progress', 'LOG180060', '[{\"work_id\":0,\"work_name\":\"ui7\"}]', 'Danish > Icelandic', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"2\",\"pricelist\":\"Discount - Quality\",\"itemPrice\":\"1\",\"itemTotal\":\"2\"}]', 2.00, '2021-09-20 18:30:27', '2021-09-20 18:30:55'),
(113, 0, 124, 1, 0, 0, 0, 4, '1', 'DTC', '', 'LOG180061_DTC001', 'LOG180061_DTC001', 'dsefs', '2', '2021-09-20 18:48:00', '5', 'In-progress', 'LOG180061', '[]', 'Danish > French (Canada)', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"20\",\"pricelist\":\"Discount - Quality\",\"itemPrice\":\"1\",\"itemTotal\":\"20\"}]', 20.00, '2021-09-20 18:49:04', '2021-09-20 18:49:33'),
(114, 0, 125, 1, 7, 17, 0, 7, '1', 'SEO', '', 'LOG180062_SEO001', 'LOG180062_SEO001', '', '', '2021-09-20 18:52:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-09-20 18:52:25', '2021-09-20 18:52:25'),
(115, 0, 125, 1, 3, 0, 0, 3, '2', 'DTP', '', 'LOG180062_DTP002', 'LOG180062_DTP002', '', '', '2021-09-20 18:52:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-09-20 18:52:25', '2021-09-20 18:52:25'),
(116, 0, 125, 1, 4, 0, 0, 4, '4', 'DTC', '', 'LOG180062_DTC004', 'LOG180062_DTC004', '', '', '2021-09-20 18:52:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-09-20 18:52:26', '2021-09-20 18:52:26'),
(117, 0, 126, 1, 3, NULL, 0, 3, '1', 'DTP', '', 'LOG180063_DTP001', 'LOG180063_DTP001', '', '', '2021-09-20 19:00:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-09-20 19:01:08', '2021-09-20 19:01:08'),
(118, 0, 127, 1, 6, NULL, 0, 6, '1', 'FED', '', 'LOG180064_FED001', 'LOG180064_FED001', '', '', '2021-09-20 19:15:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-09-20 19:15:59', '2021-09-20 19:15:59'),
(119, 0, 128, 1, 6, NULL, 0, 6, '1', 'FED', '', 'LOG180065_FED001', 'LOG180065_FED001', '', '', '2021-09-21 11:12:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-09-21 11:12:41', '2021-09-21 11:12:41'),
(120, 0, 131, 1, 4, NULL, 0, 4, '1', 'DTC', '', 'LOG180067_DTC001', 'LOG180067_DTC001', '', '', '2021-09-24 10:30:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-09-24 10:30:43', '2021-09-24 10:30:43'),
(122, 0, 135, 1, 4, NULL, 0, 4, '1', 'DTC', '', 'LOG180068_DTC001', 'LOG180068_DTC001', '', '', '2021-10-01 11:44:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-10-01 11:44:35', '2021-10-01 11:44:35'),
(123, 0, 130, 1, 3, NULL, 0, 3, '1', 'DTP', '', 'LOG180066_DTP001', 'LOG180066_DTP001', '', '', '2021-10-01 12:01:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-10-01 12:01:35', '2021-10-01 12:01:35'),
(124, 0, 130, 2, 2, NULL, 0, 2, '2', 'COP', '', 'LOG180066_COP002', 'LOG180066_COP002', '', '', '2021-10-01 12:01:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-10-01 12:02:07', '2021-10-01 12:02:07'),
(125, 0, 135, 2, 7, NULL, 0, 7, '2', 'SEO', '', 'LOG180068_SEO002', 'LOG180068_SEO002', '', '', '2021-10-05 16:21:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-10-05 16:22:11', '2021-10-05 16:22:11'),
(126, 0, 136, 1, 2, NULL, 0, 2, '1', 'COP', '', 'LOG180069_COP001', 'LOG180069_COP001', '', '', '2021-10-09 20:00:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-10-07 15:21:29', '2021-10-07 15:21:29'),
(127, 0, 136, 2, 7, 17, 0, 7, '2', 'SEO', '', 'LOG180069_SEO002', 'LOG180069_SEO002', '', '', '2021-10-08 15:22:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-10-07 15:22:37', '2021-10-07 15:22:37'),
(130, 0, 136, 3, 3, NULL, 0, 3, '6', 'DTP', '', 'LOG180069_DTP006', 'LOG180069_DTP006', '', '', '2021-10-07 15:22:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-10-07 15:23:16', '2021-10-07 15:23:16'),
(131, 0, 137, 1, 2, NULL, 0, 2, '1', 'COP', '', 'LOG180070_COP001', 'LOG180070_COP001', '', '', '2021-10-07 18:18:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-10-07 18:19:01', '2021-10-07 18:19:01'),
(132, 0, 137, 2, 3, NULL, 0, 3, '2', 'DTP', '', 'LOG180070_DTP002', 'LOG180070_DTP002', '', '', '2021-10-07 18:19:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-10-07 18:19:39', '2021-10-07 18:19:39'),
(133, 0, 138, 1, 4, NULL, 0, 4, '1', 'DTC', '', 'LOG180071_DTC001', 'LOG180071_DTC001', '', '', '2021-10-08 12:22:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-10-08 12:23:47', '2021-10-08 12:23:47'),
(134, 0, 40, 1, 2, NULL, 0, 2, '1', 'COP', '', 'LOG180009_COP001', 'LOG180009_COP001', '', '', '2021-10-20 14:34:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-10-11 14:36:21', '2021-10-11 14:36:21'),
(135, 0, 139, 1, 7, 17, 0, 7, '1', 'SEO', '', 'LOG180072_SEO001', 'LOG180072_SEO001', '', '', '2021-10-11 18:23:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-10-11 18:23:52', '2021-10-11 18:23:52'),
(136, 0, 139, 1, 3, 0, 0, 3, '2', 'DTP', '', 'LOG180072_DTP002', 'LOG180072_DTP002', '', '', '2021-10-11 18:23:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-10-11 18:23:53', '2021-10-11 18:23:53'),
(137, 0, 139, 1, 4, 0, 0, 4, '4', 'DTC', '', 'LOG180072_DTC004', 'LOG180072_DTC004', '', '', '2021-10-11 18:23:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-10-11 18:23:53', '2021-10-11 18:23:53'),
(138, 0, 139, 2, 3, NULL, 0, 3, '5', 'DTP', '', 'LOG180072_DTP005', 'LOG180072_DTP005', '', '', '2021-10-11 18:24:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-10-11 18:24:26', '2021-10-11 18:24:26'),
(139, 0, 135, 2, 4, 17, 0, 4, '3', 'DTC', '', 'LOG180068_DTC003', 'LOG180068_DTC003', '', '', '2021-10-05 16:21:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-10-11 18:30:03', '2021-10-11 18:30:03'),
(140, 0, 139, 2, 7, NULL, 0, 7, '6', 'SEO', '', 'LOG180072_SEO006', 'LOG180072_SEO006', '', '', '2021-10-11 18:24:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-10-11 18:30:32', '2021-10-11 18:30:32'),
(141, 0, 46, 2, 2, NULL, 0, 2, '3', 'COP', '', 'LOG180013_COP003', 'LOG180013_COP003', '', '', '2021-10-12 15:59:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-10-12 15:59:43', '2021-10-12 15:59:43'),
(142, 0, 140, 1, 2, 0, 0, 2, '1', 'COP', '', 'LOG180073_COP001', 'LOG180073_COP001', 'test', '2', '2021-10-14 10:59:00', '5', 'In-progress', 'LOG180073', '[{\"work_id\":0,\"work_name\":\"test54\"}]', 'English (US) > Hindi', '', '', '', '1', 'Auto', '', '', '[{\"id\":0,\"quantity\":\"10\",\"pricelist\":\"% Partial payment\",\"itemPrice\":\"3,25\",\"itemTotal\":\"32.5\"},{\"id\":1,\"quantity\":\"50\",\"pricelist\":\"85% - 94%\",\"itemPrice\":\"\",\"itemTotal\":\"\",\"amtSum\":0},{\"id\":3,\"quantity\":\"10\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,15\",\"itemTotal\":\"1.5\"},{\"quantity\":1,\"pricelist\":\"Batch Delivery\",\"itemPrice\":\"1\",\"itemTotal\":\"1\"}]', 35.00, '2021-10-14 10:59:29', '2021-10-14 12:03:41'),
(143, 0, 140, 2, 3, NULL, 0, 3, '2', 'DTP', '', 'LOG180073_DTP002', 'LOG180073_DTP002', '', '', '2021-10-14 11:04:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-10-14 11:04:49', '2021-10-14 11:04:49'),
(144, 0, 141, 1, 6, NULL, 0, 6, '1', 'FED', '', 'LOG180074_FED001', 'LOG180074_FED001', '', '', '2021-10-14 15:21:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-10-14 15:21:25', '2021-10-14 15:21:25'),
(145, 0, 141, 2, 0, NULL, 0, 4, '2', 'DTC', '', 'LOG180074_DTC002', 'LOG180074_DTC002', '', '', '2021-10-14 15:25:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-10-14 15:25:20', '2021-10-14 15:25:20'),
(146, 0, 142, 1, 0, 0, 0, 1, '1', 'BAD', '', 'LOG180075_BAD001', 'LOG180075_BAD001', '', '2', '2021-10-18 14:37:00', '5', 'In-progress', 'LOG180075', '[{\"work_id\":0,\"work_name\":\"hfhfhfh\"}]', 'English (US) > Hindi', '', '', '', '1', 'Auto', '', '', '[]', 0.00, '2021-10-18 14:37:51', '2021-10-18 15:53:20'),
(150, 0, 143, 1, 6, 0, 0, 6, '1', 'FED', '', 'LOG180076_FED001', 'LOG180076_FED001', '', '2', '2021-10-19 15:01:00', '5', 'In-progress', 'LOG180076', '[{\"work_id\":0,\"work_name\":\"dfdgdg\"}]', 'English (US) > Hindi', '', '', '', '1', 'Auto', '', '', '[{\"id\":0,\"quantity\":\"1\",\"pricelist\":\"Words Proofreading 100% Match\",\"itemPrice\":0,\"itemTotal\":0},{\"id\":1,\"quantity\":\"2\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":0,\"itemTotal\":0}]', 0.00, '2021-10-19 15:03:31', '2021-10-19 16:44:54'),
(151, 0, 143, 2, 6, 0, 0, 6, '2', 'FED', '', 'LOG180076_FED002', 'LOG180076_FED002', 'test', '2', '2021-10-21 15:04:00', '1', 'In preparation', 'LOG180076', '[{\"work_id\":0,\"work_name\":\"dfdgdg\"}]', 'Danish > English (UK)', '', '', '', '1', 'Auto', '', '', '[{\"id\":0,\"quantity\":\"1\",\"pricelist\":\"Words Proofreading 100% Match\",\"itemPrice\":\"0,2\",\"itemTotal\":\"0.2\"},{\"id\":1,\"quantity\":\"2\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,20\",\"itemTotal\":\"0.4\"}]', 0.60, '2021-10-19 15:05:16', '2021-10-19 16:33:14'),
(152, 0, 144, 1, 6, 0, 0, 6, '1', 'FED', '', 'LOG180077_FED001', 'LOG180077_FED001', 'test3', '2', '2021-10-19 15:41:00', '1', 'Assigned-waiting', 'LOG180077', '[{\"work_id\":0,\"work_name\":\"weqe\"},{\"work_id\":1,\"work_name\":\"dfg56466\"}]', 'Danish > Estonian', '', '', '', '1', 'Auto', '', '', '[{\"id\":0,\"quantity\":\"1\",\"pricelist\":\"Words Proofreading 100% Match\",\"itemPrice\":\"0,2\",\"itemTotal\":\"0.2\"},{\"id\":1,\"quantity\":\"2\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,20\",\"itemTotal\":\"0.4\"}]', 0.60, '2021-10-19 15:41:48', '2021-10-19 16:49:18'),
(153, 0, 145, 1, 7, 0, 0, 7, '1', 'SEO', '', 'LOG180078_SEO001', 'LOG180078_SEO001', 'fdr', '2', '2021-10-19 17:00:00', '1', 'In-progress', 'LOG180078', '[{\"work_id\":0,\"work_name\":\"342424\"}]', 'English (US) > Hindi', '', '', '', '1', 'Auto', '', '', '[{\"id\":0,\"quantity\":\"1\",\"pricelist\":\"Words Proofreading 100% Match\",\"itemPrice\":\"0,2\",\"itemTotal\":\"0.2\"},{\"id\":1,\"quantity\":\"2\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,20\",\"itemTotal\":\"0.4\"}]', 0.60, '2021-10-19 17:00:19', '2021-10-19 17:03:40'),
(154, 0, 145, 2, 0, 0, 0, 7, '2', 'SEO', '', 'LOG180078_SEO002', 'LOG180078_SEO002', '', '2', '2021-10-19 17:00:00', '1', 'In-progress', 'LOG180078', '[]', 'Danish > Estonian', '', '', '', '1', 'Auto', '', '', '[]', 0.00, '2021-10-19 17:00:49', '2021-10-19 17:10:00'),
(155, 0, 145, 3, 7, 0, 0, 7, '3', 'SEO', '', 'LOG180078_SEO003', 'LOG180078_SEO003', '', '2', '2021-10-19 17:13:00', '1', 'In-progress', 'LOG180078', '[]', 'Danish > English (UK)', '', '', '', '1', 'Auto', '', '', '[{\"id\":0,\"quantity\":\"1\",\"pricelist\":\"Words Proofreading 100% Match\",\"itemPrice\":0,\"itemTotal\":0},{\"id\":1,\"quantity\":\"2\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":0,\"itemTotal\":0}]', 0.00, '2021-10-19 17:13:55', '2021-10-19 17:15:24'),
(156, 0, 145, 4, 7, 0, 0, 7, '4', 'SEO', '', 'LOG180078_SEO004', 'LOG180078_SEO004', '', '2', '2021-10-19 17:21:00', '1', 'In-progress', 'LOG180078', '[{\"work_id\":0,\"work_name\":\"dfdgdg\"}]', 'English (US) > Hindi', '', '', '', '1', 'Auto', '', '', '[{\"id\":0,\"quantity\":\"1\",\"pricelist\":\"Words Proofreading 100% Match\",\"itemPrice\":0,\"itemTotal\":0},{\"id\":1,\"quantity\":\"2\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":0,\"itemTotal\":0}]', 0.00, '2021-10-19 17:21:36', '2021-10-19 17:27:08'),
(157, 0, 146, 1, 4, 0, 0, 4, '1', 'DTC', '', 'LOG180079_DTC001', 'LOG180079_DTC001', 'sf', '2', '2021-10-19 18:35:00', '1', 'In-progress', 'LOG180079', '[{\"work_id\":0,\"work_name\":\"ssfsf\"}]', 'English (US) > Hindi', '', '', '', '1', 'Auto', '', '', '[{\"id\":0,\"quantity\":\"1\",\"pricelist\":\"Words Proofreading 100% Match\",\"itemPrice\":\"0,2\",\"itemTotal\":\"0.2\"},{\"id\":1,\"quantity\":\"2\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,20\",\"itemTotal\":\"0.4\"}]', 0.60, '2021-10-19 18:35:12', '2021-10-19 18:36:24'),
(158, 0, 99, 1, 1, NULL, 0, 1, '1', 'BAD', '', '', '', '', '', '0000-00-00 00:00:00', '', 'New', '', '', '', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-10-19 20:12:07', '2021-10-19 20:12:07'),
(159, 0, 113, 1, 2, 0, 0, 2, '3', 'COP', '', 'LOG180054_COP003', 'LOG180054_COP003', '', '2', '2021-09-15 05:47:00', '5', 'In-progress', 'LOG180054', '[]', 'English (US) > Hindi', '', '', '', '1', 'Auto', '', '', '[{\"id\":0,\"quantity\":\"1\",\"pricelist\":\"Words Proofreading 100% Match\",\"itemPrice\":\"0,2\",\"itemTotal\":\"0.2\"},{\"id\":1,\"quantity\":\"2\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,20\",\"itemTotal\":\"0.4\"}]', 0.60, '2021-10-19 20:12:31', '2021-10-19 20:13:19'),
(160, 0, 147, 1, 8, 0, 0, 8, '1', 'TEST', '', 'LOG180080_TEST001', 'LOG180080_TEST001', '', '2', '2021-10-20 10:48:00', '1', 'In-progress', 'LOG180080', '[]', 'English (US) > Hindi', '', '', '', '1', 'Auto', '', '', '[{\"id\":0,\"quantity\":\"1\",\"pricelist\":\"Words Proofreading 100% Match\",\"itemPrice\":\"0,2\",\"itemTotal\":\"0.2\"},{\"id\":1,\"quantity\":\"2\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,20\",\"itemTotal\":\"0.4\"}]', 0.60, '2021-10-20 10:48:39', '2021-10-20 10:50:51'),
(161, 0, 147, 2, 7, 0, 0, 7, '2', 'SEO', '', 'LOG180080_SEO002', 'LOG180080_SEO002', 'test', '2', '2021-10-28 10:49:00', '1', 'Delivered', 'LOG180080', '[{\"work_id\":0,\"work_name\":\"35\"}]', 'Danish > Estonian', '', '', '', '1', 'Auto', '', '', '[{\"id\":0,\"quantity\":\"1\",\"pricelist\":\"Words Proofreading 100% Match\",\"itemPrice\":\"0,2\",\"itemTotal\":\"0.2\"},{\"id\":1,\"quantity\":\"2\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,20\",\"itemTotal\":\"0.4\"},{\"quantity\":\"4\",\"pricelist\":\"Available price unit\",\"itemPrice\":\"20\",\"itemTotal\":\"80\",\"amtSum\":80},{\"quantity\":\"5\",\"pricelist\":\"Hour(s) Editing\",\"itemPrice\":\"17\",\"itemTotal\":\"85\",\"amtSum\":85}]', 165.60, '2021-10-20 10:49:23', '2021-10-20 10:59:06'),
(162, 0, 147, 3, 6, 0, 0, 6, '3', 'FED', '', 'LOG180080_FED003', 'LOG180080_FED003', '', '10', '2021-10-20 14:28:00', '1', 'In-progress', 'LOG180080', '[]', 'Estonian > Danish', '', '', '', '1', 'Auto', '', '', '[{\"id\":0,\"quantity\":\"1\",\"pricelist\":\"Words Proofreading 100% Match\",\"itemPrice\":\"50\",\"itemTotal\":\"506\",\"amtSum\":\"506\"},{\"id\":1,\"quantity\":\"2\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"0,12\",\"itemTotal\":\"0.24\"},{\"id\":2,\"quantity\":\"3\",\"pricelist\":\"11-20 QA errors\",\"itemPrice\":\"1\",\"itemTotal\":\"3\"}]', 509.24, '2021-10-20 14:29:08', '2021-10-20 14:37:48'),
(163, 0, 147, 3, 1, NULL, 0, 1, '4', 'BAD', '', 'LOG180080_BAD004', 'LOG180080_BAD004', '', '', '2021-10-20 14:28:00', '', 'New', '', '', 'German > Turkish', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-10-22 14:04:27', '2021-10-22 14:04:27'),
(164, 0, 148, 1, 2, NULL, 0, 2, '1', 'COP', '', 'LOG180081_COP001', 'LOG180081_COP001', '', '', '2021-11-10 11:29:00', '', 'New', '', '', 'English (US) > Hindi', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-11-10 11:32:19', '2021-11-10 11:32:19');
INSERT INTO `tms_summmery_view` (`job_summmeryId`, `per_id`, `order_id`, `item_id`, `job_id`, `job_chain_id`, `appr_id`, `master_job_id`, `job_no`, `job_code`, `order_no`, `po_number`, `tmp_po_number`, `description`, `resource`, `due_date`, `contact_person`, `item_status`, `company_code`, `work_instruction`, `ItemLanguage`, `specialization`, `negative_feedback`, `late_delivery`, `auto_job`, `auto_status`, `rejection`, `csv_price`, `price`, `total_price`, `created_date`, `updated_date`) VALUES
(165, 0, 148, 2, 3, 0, 0, 3, '2', 'DTP', '', 'LOG180081_DTP002', 'LOG180081_DTP002', '', '2', '2021-11-03 11:34:00', '1', 'In-progress', 'LOG180081', '[]', 'English (US) > Dutch', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-11-10 11:35:11', '2021-11-10 17:27:45'),
(166, 0, 149, 1, 1, 0, 0, 1, '1', 'BAD', '', 'LOG180082_BAD001', 'LOG180082_BAD001', '', '2', '2021-11-17 15:28:00', '1', 'In-progress', 'LOG180082', '[]', 'English (US) > Hindi', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-11-17 15:28:22', '2021-11-17 15:44:52'),
(167, 0, 151, 1, 3, 0, 0, 3, '1', 'DTP', '', 'LOG180083_DTP001', 'LOG180083_DTP001', '', '2', '2021-11-17 17:28:00', '1', 'In-progress', 'LOG180083', '[]', 'English (US) > Hindi', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"1160\",\"pricelist\":\"Words Translation Repetition Match\",\"itemPrice\":0,\"itemTotal\":0},{\"id\":null,\"quantity\":\"0\",\"pricelist\":\"Words Translation 101% Match\",\"itemPrice\":0,\"itemTotal\":0},{\"id\":null,\"quantity\":\"213\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":0,\"itemTotal\":0},{\"id\":null,\"quantity\":\"1277\",\"pricelist\":\"Words Translation 95%-99% Match\",\"itemPrice\":0,\"itemTotal\":0},{\"id\":null,\"quantity\":\"1190\",\"pricelist\":\"Words Translation 85%-94% Match\",\"itemPrice\":0,\"itemTotal\":0},{\"id\":null,\"quantity\":\"2046\",\"pricelist\":\"Words Translation 75%-84% Match\",\"itemPrice\":0,\"itemTotal\":0},{\"id\":null,\"quantity\":\"324\",\"pricelist\":\"Words Translation 50%-74% Match\",\"itemPrice\":0,\"itemTotal\":0},{\"id\":null,\"quantity\":\"10205\",\"pricelist\":\"Words Translation No match\",\"itemPrice\":0,\"itemTotal\":0}]', 0.00, '2021-11-17 17:28:39', '2021-11-17 17:46:17'),
(168, 0, 151, 2, 6, 0, 0, 6, '2', 'FED', '', 'LOG180083_FED002', 'LOG180083_FED002', '', '10', '2021-11-17 17:29:00', '1', 'In-progress', 'LOG180083', '[]', 'English (US) > Dutch', '', '', '', '1', 'Auto', '', '', '[]', 0.00, '2021-11-17 17:29:22', '2021-11-17 18:18:08'),
(169, 0, 152, 1, 3, 0, 0, 3, '1', 'DTP', '', 'LOG180084_DTP001', 'LOG180084_DTP001', '', '2', '2021-11-17 05:14:00', '1', 'In-progress', 'LOG180084', '[]', 'English (US) > Hindi', '', '', '', '1', 'Auto', '', '', '[{\"id\":null,\"quantity\":\"213\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":\"2,00\",\"itemTotal\":\"426\"},{\"id\":null,\"quantity\":\"1277\",\"pricelist\":\"Words Translation 95%-99% Match\",\"itemPrice\":\"0,12\",\"itemTotal\":\"153.23\"},{\"id\":null,\"quantity\":\"1190\",\"pricelist\":\"Words Translation 85%-94% Match\",\"itemPrice\":\"0,25\",\"itemTotal\":\"297.5\"},{\"id\":null,\"quantity\":\"2046\",\"pricelist\":\"Words Translation 75%-84% Match\",\"itemPrice\":0,\"itemTotal\":0},{\"id\":null,\"quantity\":\"324\",\"pricelist\":\"Words Translation 50%-74% Match\",\"itemPrice\":\"0,08\",\"itemTotal\":\"25.92\"},{\"id\":null,\"quantity\":\"10205\",\"pricelist\":\"Words Translation No match\",\"itemPrice\":0,\"itemTotal\":0}]', 902.66, '2021-11-17 18:44:16', '2021-11-17 18:49:43'),
(170, 0, 155, 1, 3, 0, 0, 3, '1', 'DTP', '', 'LOG180085_DTP001', 'LOG180085_DTP001', '', '2', '2021-11-18 14:36:00', '1', 'Approved', 'LOG180085', '[]', 'English (US) > Hindi', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"1160\",\"pricelist\":\"Words Translation Repetition Match\",\"itemPrice\":0,\"itemTotal\":0},{\"id\":null,\"quantity\":\"0\",\"pricelist\":\"Words Translation 101% Match\",\"itemPrice\":0,\"itemTotal\":0},{\"id\":null,\"quantity\":\"213\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":\"2,00\",\"itemTotal\":\"426\"},{\"id\":null,\"quantity\":\"1277\",\"pricelist\":\"Words Translation 95%-99% Match\",\"itemPrice\":\"0,12\",\"itemTotal\":\"153.23\"},{\"id\":null,\"quantity\":\"1190\",\"pricelist\":\"Words Translation 85%-94% Match\",\"itemPrice\":\"0,25\",\"itemTotal\":\"297.5\"},{\"id\":null,\"quantity\":\"2046\",\"pricelist\":\"Words Translation 75%-84% Match\",\"itemPrice\":0,\"itemTotal\":0},{\"id\":null,\"quantity\":\"324\",\"pricelist\":\"Words Translation 50%-74% Match\",\"itemPrice\":\"10,00\",\"itemTotal\":\"3240\"},{\"id\":null,\"quantity\":\"10205\",\"pricelist\":\"Words Translation No match\",\"itemPrice\":0,\"itemTotal\":0}]', 4116.74, '2021-11-18 14:37:03', '2022-03-24 14:28:22'),
(171, 0, 157, 1, 6, 0, 0, 6, '1', 'FED', '', 'LOG180086_FED001', 'LOG180086_FED001', 'ok', '10', '2021-12-29 18:59:00', '1', 'In-progress', 'LOG180086', '[]', 'English (US) > Hindi', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-12-08 19:00:00', '2021-12-13 15:24:28'),
(172, 0, 160, 1, 7, 17, 0, 7, '1', 'SEO', '', 'LOG180087_SEO001', 'LOG180087_SEO001', '', '10', '2022-01-06 18:41:00', '5', 'In-progress', 'LOG180087', '[]', 'English (US) > Danish', '', '', '', '1', 'Auto', '', '', '', 0.00, '2021-12-14 18:41:51', '2021-12-15 12:18:19'),
(175, 0, 161, 1, 2, 0, 0, 2, '1', 'COP', '', 'LOG180088_COP001', 'LOG180088_COP001', 'test', '2', '2021-12-15 12:08:00', '1', 'In-progress', 'LOG180088', '[{\"work_id\":0,\"work_name\":\"test7668\"}]', 'English (US) > Danish', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"213\",\"pricelist\":\"Words Translation 100% Match\",\"itemPrice\":\"0,80\",\"itemTotal\":\"170.4\"},{\"id\":null,\"quantity\":\"1277\",\"pricelist\":\"Words Translation 95-99% Match\",\"itemPrice\":\"0,12\",\"itemTotal\":\"153.23\"},{\"id\":null,\"quantity\":\"10205\",\"pricelist\":\"Words Translation (New)\",\"itemPrice\":\"1,00\",\"itemTotal\":\"10205\"}]', 10528.64, '2021-12-15 12:08:49', '2021-12-15 15:10:15'),
(176, 0, 163, 1, 1, 0, 0, 1, '1', 'BAD', '', 'LOG180089_BAD001', 'LOG180089_BAD001', '', '2', '2021-12-16 16:00:00', '5', 'Approved', 'LOG180089', '[]', 'English (US) > Danish', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"1277\",\"pricelist\":\"Words Proofreading 95-99% Match\",\"itemPrice\":\"3,00\",\"itemTotal\":\"3831\"},{\"id\":null,\"quantity\":\"6075\",\"pricelist\":\"Words Proofreading 50-74% Match\",\"itemPrice\":\"0,60\",\"itemTotal\":\"3645\"},{\"quantity\":\"1277\",\"pricelist\":\"Words Proofreading 95-99% Match\",\"itemPrice\":\"3,00\",\"itemTotal\":\"3831\"},{\"id\":null,\"quantity\":\"6075\",\"pricelist\":\"Words Proofreading 50-74% Match\",\"itemPrice\":\"0,60\",\"itemTotal\":\"3645\"}]', 14952.00, '2021-12-15 16:00:44', '2022-03-28 15:32:29'),
(177, 0, 165, 1, 1, 0, 0, 1, '1', 'BAD', '', 'LOG180090_BAD001', 'LOG180090_BAD001', 'test', '2', '2022-01-11 22:59:00', '1', 'New,Requested', 'LOG180090', '[]', 'English (US) > Hindi', '', '', '', '1', 'Auto', '', '', '', 0.00, '2022-01-10 16:58:59', '2022-01-10 17:08:03'),
(178, 0, 165, 2, 0, 0, 0, 3, '2', 'DTP', '', 'LOG180090_DTP002', 'LOG180090_DTP002', 'test', '2', '2022-01-10 20:00:00', '1', 'In-progress', 'LOG180090', '[]', 'Hindi > English (US)', '', '', '', '1', 'Auto', '', '', '', 0.00, '2022-01-10 16:59:31', '2022-01-10 17:29:09'),
(179, 0, 165, 3, 6, 0, 0, 6, '3', 'FED', '', 'LOG180090_FED003', 'LOG180090_FED003', 't', '2', '2022-01-10 19:00:00', '1', 'New,Assigned-waiting', 'LOG180090', '[]', 'English (US) > Hindi', '', '', '', '1', 'Auto', '', '', '', 0.00, '2022-01-10 16:59:52', '2022-01-10 17:30:10'),
(180, 0, 166, 1, 0, 0, 0, 3, '1', 'DTP', '', 'LOG180091_DTP001', 'LOG180091_DTP001', 'test', '2', '2022-02-12 15:55:00', '1', 'Approved', 'LOG180091', '[]', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', '', 0.00, '2022-02-11 15:55:43', '2022-03-24 14:34:01'),
(181, 0, 167, 1, 7, 17, 0, 7, '1', 'SEO', '', 'LOG180092_SEO001', 'LOG180092_SEO001', '', '2', '2022-03-21 18:05:00', '1', 'Approved', 'LOG180092', '[]', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"200\",\"pricelist\":\"Minimum Fee\",\"itemPrice\":\"1\",\"itemTotal\":\"2005\",\"amtSum\":\"2005\"}]', 2005.00, '2022-03-21 18:06:14', '2022-03-21 19:13:05'),
(182, 0, 167, 1, 3, 0, 0, 3, '2', 'DTP', '', 'LOG180092_DTP002', 'LOG180092_DTP002', '', '2', '2022-03-21 18:05:00', '1', 'Approved', 'LOG180092', '[]', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"20\",\"pricelist\":\"Words Proofreading 75-84% Match\",\"itemPrice\":\"0,8\",\"itemTotal\":\"16\"}]', 16.00, '2022-03-21 18:06:14', '2022-03-22 19:40:16'),
(183, 0, 167, 1, 4, 0, 0, 4, '4', 'DTC', '', 'LOG180092_DTC004', 'LOG180092_DTC004', '', '', '2022-03-21 18:05:00', '', 'New', '', '', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', '', 0.00, '2022-03-21 18:06:15', '2022-03-21 18:06:15'),
(184, 0, 168, 1, 0, 0, 0, 1, '1', 'BAD', '', 'LOG180093_BAD001', 'LOG180093_BAD001', 'test', '2', '2022-03-28 12:33:00', '1', 'Approved', 'LOG180093', '[{\"work_id\":0,\"work_name\":\"testtt\"}]', 'English (US) > English (US)', '', '', '', '1', 'Auto', '', '', '[{\"quantity\":\"10\",\"pricelist\":\"Words Translation Fuzzy Match\",\"itemPrice\":\"1\",\"itemTotal\":\"10\"}]', 10.00, '2022-03-28 12:34:13', '2022-03-28 12:37:47');

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
(1, 2, '[[{\"job_summmeryId\":1,\"per_id\":0,\"order_id\":2,\"item_id\":1,\"job_id\":1,\"job_chain_id\":0,\"appr_id\":1,\"master_job_id\":1,\"job_no\":1,\"job_code\":\"BAD\",\"order_no\":\"\",\"po_number\":\"LOG180001_BAD001\",\"tmp_po_number\":\"LOG180001_BAD001\",\"description\":\"ertrtrtrt\",\"resource\":2,\"due_date\":\"2018-12-18 11:19:00\",\"contact_person\":5,\"item_status\":\"Approved\",\"company_code\":\"LOG180001\",\"work_instruction\":\"[{\\\"work_id\\\":0,\\\"work_name\\\":\\\"change layout\\\"},{\\\"work_id\\\":1,\\\"work_name\\\":\\\"Run spell check\\\"}]\",\"ItemLanguage\":\"English (US) > Hindi\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"fgdfgsdfgsdfgdfg\",\"csv_price\":\"\",\"price\":\"[{\\\"quantity\\\":1,\\\"pricelist\\\":\\\"Page(s) DTP\\\",\\\"itemPrice\\\":\\\"300\\\",\\\"itemTotal\\\":\\\"400.54\\\",\\\"amtSum\\\":\\\"400.54\\\"},{\\\"quantity\\\":1,\\\"pricelist\\\":\\\"1-10 QA errors\\\",\\\"itemPrice\\\":\\\"1\\\",\\\"itemTotal\\\":\\\"1000\\\",\\\"amtSum\\\":\\\"1000\\\"},{\\\"quantity\\\":1,\\\"pricelist\\\":\\\"Hour(s) LQA\\\",\\\"itemPrice\\\":\\\"1\\\",\\\"itemTotal\\\":\\\"1\\\"},{\\\"quantity\\\":1,\\\"pricelist\\\":\\\"Hour(s) Editing\\\",\\\"itemPrice\\\":\\\"1\\\",\\\"itemTotal\\\":\\\"1\\\"}]\",\"total_price\":1402.54,\"created_date\":\"2018-12-13 11:02:21\",\"updated_date\":\"2021-10-18 10:25:37\",\"vUserName\":\"T Admin\",\"iUserId\":2,\"contactPerson\":\"Mayank Vadiya\",\"contactPersonId\":5},{\"job_summmeryId\":2,\"per_id\":0,\"order_id\":2,\"item_id\":1,\"job_id\":3,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":3,\"job_no\":2,\"job_code\":\"DTP\",\"order_no\":\"\",\"po_number\":\"LOG180001_DTP002\",\"tmp_po_number\":\"LOG180001_DTP002\",\"description\":\"sadasdasdasd\",\"resource\":2,\"due_date\":\"2018-11-01 11:01:00\",\"contact_person\":5,\"item_status\":\"Assigned-waiting\",\"company_code\":\"LOG180001\",\"work_instruction\":\"[]\",\"ItemLanguage\":\"English (US) > English (US)\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"csv_price\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2018-12-13 18:53:36\",\"updated_date\":\"2021-10-07 18:42:40\",\"vUserName\":\"T Admin\",\"iUserId\":2,\"contactPerson\":\"Mayank Vadiya\",\"contactPersonId\":5},{\"job_summmeryId\":34,\"per_id\":0,\"order_id\":2,\"item_id\":1,\"job_id\":4,\"job_chain_id\":17,\"appr_id\":0,\"master_job_id\":4,\"job_no\":4,\"job_code\":\"DTC\",\"order_no\":\"\",\"po_number\":\"LOG180001_DTC004\",\"tmp_po_number\":\"LOG180001_DTC004\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2019-02-09 11:44:00\",\"contact_person\":\"\",\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"csv_price\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2021-06-09 09:50:46\",\"updated_date\":\"2021-06-09 09:50:46\",\"vUserName\":null,\"iUserId\":null,\"contactPerson\":null,\"contactPersonId\":null}],[{\"job_summmeryId\":73,\"per_id\":0,\"order_id\":2,\"item_id\":6,\"job_id\":2,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":2,\"job_no\":10,\"job_code\":\"COP\",\"order_no\":\"\",\"po_number\":\"LOG180001_COP010\",\"tmp_po_number\":\"LOG180001_COP010\",\"description\":\"\",\"resource\":2,\"due_date\":\"2021-07-23 12:22:00\",\"contact_person\":5,\"item_status\":\"In-progress\",\"company_code\":\"LOG180001\",\"work_instruction\":\"[]\",\"ItemLanguage\":\"English (US) > Deutsch\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"csv_price\":\"\",\"price\":\"[{\\\"quantity\\\":1,\\\"pricelist\\\":\\\"Page(s) DTP\\\",\\\"itemPrice\\\":\\\"300\\\",\\\"itemTotal\\\":\\\"300\\\"}]\",\"total_price\":300,\"created_date\":\"2021-07-22 17:23:44\",\"updated_date\":\"2021-07-29 15:34:09\",\"vUserName\":\"T Admin\",\"iUserId\":2,\"contactPerson\":\"Mayank Vadiya\",\"contactPersonId\":5}],[{\"job_summmeryId\":83,\"per_id\":0,\"order_id\":2,\"item_id\":7,\"job_id\":2,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":2,\"job_no\":11,\"job_code\":\"COP\",\"order_no\":\"\",\"po_number\":\"LOG180001_COP011\",\"tmp_po_number\":\"LOG180001_COP011\",\"description\":\"ok\",\"resource\":2,\"due_date\":\"2021-08-26 19:11:00\",\"contact_person\":5,\"item_status\":\"In-progress\",\"company_code\":\"LOG180001\",\"work_instruction\":\"[]\",\"ItemLanguage\":\"English (US) > Hindi\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"csv_price\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2021-08-26 19:12:54\",\"updated_date\":\"2021-10-01 11:20:57\",\"vUserName\":\"T Admin\",\"iUserId\":2,\"contactPerson\":\"Mayank Vadiya\",\"contactPersonId\":5}],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]]', '2021-10-18 04:55:45', '2018-12-14 13:02:10'),
(2, 28, '[[{\"job_summmeryId\":17,\"per_id\":0,\"order_id\":28,\"item_id\":1,\"job_id\":2,\"job_chain_id\":null,\"appr_id\":0,\"master_job_id\":2,\"job_no\":3,\"job_code\":\"COP\",\"order_no\":\"\",\"po_number\":\"LOG180002_COP003\",\"tmp_po_number\":\"LOG180002_COP003\",\"description\":\"\",\"resource\":2,\"due_date\":\"2019-01-14 16:08:18\",\"contact_person\":5,\"item_status\":\"Requested\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"created_date\":\"2019-01-09 15:56:33\",\"updated_date\":\"2019-01-09 16:17:55\",\"vUserName\":\"T Admin\",\"iUserId\":2,\"contactPerson\":\"Mayank Vadiya\",\"contactPersonId\":5}],[]]', '2019-01-09 11:17:41', '2019-01-08 12:34:39'),
(3, 51, '[[{\"job_summmeryId\":61,\"per_id\":0,\"order_id\":51,\"item_id\":1,\"job_id\":0,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":3,\"job_no\":1,\"job_code\":\"DTP\",\"order_no\":\"\",\"po_number\":\"LOG180015_DTP001\",\"tmp_po_number\":\"LOG180015_DTP001\",\"description\":\"jk\",\"resource\":2,\"due_date\":\"2021-07-17 19:50:00\",\"contact_person\":1,\"item_status\":\"In-progress\",\"company_code\":\"LOG180015\",\"work_instruction\":\"[]\",\"ItemLanguage\":\"English (US) > English (US)\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2021-07-16 19:51:02\",\"updated_date\":\"2021-07-16 20:15:56\",\"vUserName\":\"T Admin\",\"iUserId\":2,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}],[],[]]', '2021-07-21 14:01:39', '2021-07-21 19:31:39'),
(4, 69, '[[{\"job_summmeryId\":67,\"per_id\":0,\"order_id\":69,\"item_id\":1,\"job_id\":7,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":7,\"job_no\":1,\"job_code\":\"SEO\",\"order_no\":\"\",\"po_number\":\"LOG180031_SEO001\",\"tmp_po_number\":\"LOG180031_SEO001\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2021-07-22 15:00:00\",\"contact_person\":\"\",\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2021-07-22 14:06:00\",\"updated_date\":\"2021-07-22 14:06:00\",\"vUserName\":null,\"iUserId\":null,\"contactPerson\":null,\"contactPersonId\":null},{\"job_summmeryId\":68,\"per_id\":0,\"order_id\":69,\"item_id\":1,\"job_id\":3,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":3,\"job_no\":2,\"job_code\":\"DTP\",\"order_no\":\"\",\"po_number\":\"LOG180031_DTP002\",\"tmp_po_number\":\"LOG180031_DTP002\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2021-07-22 15:00:00\",\"contact_person\":\"\",\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2021-07-22 14:06:00\",\"updated_date\":\"2021-07-22 14:06:00\",\"vUserName\":null,\"iUserId\":null,\"contactPerson\":null,\"contactPersonId\":null},{\"job_summmeryId\":69,\"per_id\":0,\"order_id\":69,\"item_id\":1,\"job_id\":4,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":4,\"job_no\":4,\"job_code\":\"DTC\",\"order_no\":\"\",\"po_number\":\"LOG180031_DTC004\",\"tmp_po_number\":\"LOG180031_DTC004\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2021-07-22 15:00:00\",\"contact_person\":\"\",\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2021-07-22 14:06:00\",\"updated_date\":\"2021-07-22 14:06:00\",\"vUserName\":null,\"iUserId\":null,\"contactPerson\":null,\"contactPersonId\":null},{\"job_summmeryId\":70,\"per_id\":0,\"order_id\":69,\"item_id\":1,\"job_id\":6,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":6,\"job_no\":5,\"job_code\":\"FED\",\"order_no\":\"\",\"po_number\":\"LOG180031_FED005\",\"tmp_po_number\":\"LOG180031_FED005\",\"description\":\"\",\"resource\":2,\"due_date\":\"2021-07-22 15:00:00\",\"contact_person\":1,\"item_status\":\"In-progress\",\"company_code\":\"LOG180031\",\"work_instruction\":\"[{\\\"work_id\\\":0,\\\"work_name\\\":\\\"Read and follow uploaded Word document\\\"}]\",\"ItemLanguage\":\"English (US) > Norsk (bokm\\u00e5l)\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"[{\\\"quantity\\\":\\\"500\\\",\\\"pricelist\\\":\\\"Words Translation (New)\\\",\\\"itemPrice\\\":\\\"0,08\\\",\\\"itemTotal\\\":\\\"40\\\",\\\"amtSum\\\":40}]\",\"total_price\":40,\"created_date\":\"2021-07-22 14:15:31\",\"updated_date\":\"2021-07-22 14:18:56\",\"vUserName\":\"T Admin\",\"iUserId\":2,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}]]', '2021-07-22 08:51:37', '2021-07-22 14:21:37'),
(5, 130, '[[{\"job_summmeryId\":123,\"per_id\":0,\"order_id\":130,\"item_id\":1,\"job_id\":3,\"job_chain_id\":null,\"appr_id\":0,\"master_job_id\":3,\"job_no\":1,\"job_code\":\"DTP\",\"order_no\":\"\",\"po_number\":\"LOG180066_DTP001\",\"tmp_po_number\":\"LOG180066_DTP001\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2021-10-01 12:01:00\",\"contact_person\":\"\",\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2021-10-01 12:01:35\",\"updated_date\":\"2021-10-01 12:01:35\",\"vUserName\":null,\"resourcePic\":null,\"iUserId\":null,\"contactPerson\":null,\"contactPersonId\":null}],[{\"job_summmeryId\":124,\"per_id\":0,\"order_id\":130,\"item_id\":2,\"job_id\":2,\"job_chain_id\":null,\"appr_id\":0,\"master_job_id\":2,\"job_no\":2,\"job_code\":\"COP\",\"order_no\":\"\",\"po_number\":\"LOG180066_COP002\",\"tmp_po_number\":\"LOG180066_COP002\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2021-10-01 12:01:00\",\"contact_person\":\"\",\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2021-10-01 12:02:07\",\"updated_date\":\"2021-10-01 12:02:07\",\"vUserName\":null,\"resourcePic\":null,\"iUserId\":null,\"contactPerson\":null,\"contactPersonId\":null}]]', '2021-10-01 10:15:15', '2021-10-01 15:45:15'),
(6, 103, '[[{\"job_summmeryId\":87,\"per_id\":0,\"order_id\":103,\"item_id\":1,\"job_id\":1,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":1,\"job_no\":1,\"job_code\":\"BAD\",\"order_no\":\"\",\"po_number\":\"LOG180051_BAD001\",\"tmp_po_number\":\"LOG180051_BAD001\",\"description\":\"uyiuy\",\"resource\":2,\"due_date\":\"2021-09-06 11:28:00\",\"contact_person\":1,\"item_status\":\"In-progress\",\"company_code\":\"LOG180051\",\"work_instruction\":\"[{\\\"work_id\\\":0,\\\"work_name\\\":\\\"ABBBC\\\"}]\",\"ItemLanguage\":\"Danish > Estonian\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"csv_price\":\"\",\"price\":\"[{\\\"quantity\\\":\\\"10\\\",\\\"pricelist\\\":\\\"Hour(s) Editing\\\",\\\"itemPrice\\\":\\\"188\\\",\\\"itemTotal\\\":\\\"1880\\\",\\\"amtSum\\\":1880},{\\\"id\\\":0,\\\"quantity\\\":\\\"20\\\",\\\"pricelist\\\":\\\"Words Translation (New)\\\",\\\"itemPrice\\\":\\\"0,15\\\",\\\"itemTotal\\\":\\\"3\\\"},{\\\"id\\\":1,\\\"quantity\\\":\\\"50\\\",\\\"pricelist\\\":\\\"31-40 QA errors\\\",\\\"itemPrice\\\":0,\\\"itemTotal\\\":0},{\\\"id\\\":0,\\\"quantity\\\":\\\"1\\\",\\\"pricelist\\\":\\\"Words Proofreading 100% Match\\\",\\\"itemPrice\\\":\\\"0,2\\\",\\\"itemTotal\\\":\\\"0.2\\\"},{\\\"id\\\":1,\\\"quantity\\\":\\\"2\\\",\\\"pricelist\\\":\\\"Words Translation (New)\\\",\\\"itemPrice\\\":\\\"0,20\\\",\\\"itemTotal\\\":\\\"0.4\\\"}]\",\"total_price\":1883.6,\"created_date\":\"2021-09-06 11:28:45\",\"updated_date\":\"2021-11-11 14:44:01\",\"vUserName\":\"T Admin\",\"iUserId\":2,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}],[{\"job_summmeryId\":88,\"per_id\":0,\"order_id\":103,\"item_id\":2,\"job_id\":0,\"job_chain_id\":null,\"appr_id\":0,\"master_job_id\":2,\"job_no\":2,\"job_code\":\"COP\",\"order_no\":\"\",\"po_number\":\"LOG180051_COP002\",\"tmp_po_number\":\"LOG180051_COP002\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2021-09-06 16:30:00\",\"contact_person\":\"\",\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"csv_price\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2021-09-06 16:31:08\",\"updated_date\":\"2021-09-06 16:31:08\",\"vUserName\":null,\"iUserId\":null,\"contactPerson\":null,\"contactPersonId\":null}],[{\"job_summmeryId\":89,\"per_id\":0,\"order_id\":103,\"item_id\":3,\"job_id\":0,\"job_chain_id\":null,\"appr_id\":0,\"master_job_id\":7,\"job_no\":3,\"job_code\":\"SEO\",\"order_no\":\"\",\"po_number\":\"LOG180051_SEO003\",\"tmp_po_number\":\"LOG180051_SEO003\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2021-09-08 16:29:00\",\"contact_person\":\"\",\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"csv_price\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2021-09-06 16:33:23\",\"updated_date\":\"2021-09-06 16:33:23\",\"vUserName\":null,\"iUserId\":null,\"contactPerson\":null,\"contactPersonId\":null}],[{\"job_summmeryId\":90,\"per_id\":0,\"order_id\":103,\"item_id\":4,\"job_id\":0,\"job_chain_id\":null,\"appr_id\":0,\"master_job_id\":1,\"job_no\":4,\"job_code\":\"BAD\",\"order_no\":\"\",\"po_number\":\"LOG180051_BAD004\",\"tmp_po_number\":\"LOG180051_BAD004\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2021-09-16 16:34:00\",\"contact_person\":\"\",\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"csv_price\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2021-09-06 16:36:11\",\"updated_date\":\"2021-09-06 16:36:11\",\"vUserName\":null,\"iUserId\":null,\"contactPerson\":null,\"contactPersonId\":null}],[],[{\"job_summmeryId\":91,\"per_id\":0,\"order_id\":103,\"item_id\":6,\"job_id\":0,\"job_chain_id\":null,\"appr_id\":0,\"master_job_id\":6,\"job_no\":5,\"job_code\":\"FED\",\"order_no\":\"\",\"po_number\":\"LOG180051_FED005\",\"tmp_po_number\":\"LOG180051_FED005\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2021-09-06 16:37:00\",\"contact_person\":\"\",\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"csv_price\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2021-09-06 16:38:09\",\"updated_date\":\"2021-09-06 16:38:09\",\"vUserName\":null,\"iUserId\":null,\"contactPerson\":null,\"contactPersonId\":null}],[{\"job_summmeryId\":92,\"per_id\":0,\"order_id\":103,\"item_id\":7,\"job_id\":8,\"job_chain_id\":null,\"appr_id\":0,\"master_job_id\":8,\"job_no\":6,\"job_code\":\"TEST\",\"order_no\":\"\",\"po_number\":\"LOG180051_TEST006\",\"tmp_po_number\":\"LOG180051_TEST006\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2021-09-06 16:38:00\",\"contact_person\":\"\",\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"csv_price\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2021-09-06 16:39:24\",\"updated_date\":\"2021-09-06 16:39:24\",\"vUserName\":null,\"iUserId\":null,\"contactPerson\":null,\"contactPersonId\":null}],[{\"job_summmeryId\":93,\"per_id\":0,\"order_id\":103,\"item_id\":8,\"job_id\":7,\"job_chain_id\":null,\"appr_id\":0,\"master_job_id\":7,\"job_no\":7,\"job_code\":\"SEO\",\"order_no\":\"\",\"po_number\":\"LOG180051_SEO007\",\"tmp_po_number\":\"LOG180051_SEO007\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2021-09-06 16:40:00\",\"contact_person\":\"\",\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"csv_price\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2021-09-06 16:40:48\",\"updated_date\":\"2021-09-06 16:40:48\",\"vUserName\":null,\"iUserId\":null,\"contactPerson\":null,\"contactPersonId\":null}],[{\"job_summmeryId\":94,\"per_id\":0,\"order_id\":103,\"item_id\":9,\"job_id\":0,\"job_chain_id\":null,\"appr_id\":0,\"master_job_id\":8,\"job_no\":8,\"job_code\":\"TEST\",\"order_no\":\"\",\"po_number\":\"LOG180051_TEST008\",\"tmp_po_number\":\"LOG180051_TEST008\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2021-09-06 16:41:00\",\"contact_person\":\"\",\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"csv_price\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2021-09-06 16:42:21\",\"updated_date\":\"2021-09-06 16:42:21\",\"vUserName\":null,\"iUserId\":null,\"contactPerson\":null,\"contactPersonId\":null}],[{\"job_summmeryId\":95,\"per_id\":0,\"order_id\":103,\"item_id\":10,\"job_id\":0,\"job_chain_id\":null,\"appr_id\":0,\"master_job_id\":4,\"job_no\":9,\"job_code\":\"DTC\",\"order_no\":\"\",\"po_number\":\"LOG180051_DTC009\",\"tmp_po_number\":\"LOG180051_DTC009\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2021-09-06 16:42:00\",\"contact_person\":\"\",\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"csv_price\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2021-09-06 16:43:27\",\"updated_date\":\"2021-09-06 16:43:27\",\"vUserName\":null,\"iUserId\":null,\"contactPerson\":null,\"contactPersonId\":null}],[{\"job_summmeryId\":96,\"per_id\":0,\"order_id\":103,\"item_id\":11,\"job_id\":0,\"job_chain_id\":null,\"appr_id\":0,\"master_job_id\":6,\"job_no\":10,\"job_code\":\"FED\",\"order_no\":\"\",\"po_number\":\"LOG180051_FED010\",\"tmp_po_number\":\"LOG180051_FED010\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2021-09-06 16:44:00\",\"contact_person\":\"\",\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"csv_price\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2021-09-06 16:44:27\",\"updated_date\":\"2021-09-06 16:44:27\",\"vUserName\":null,\"iUserId\":null,\"contactPerson\":null,\"contactPersonId\":null}]]', '2021-11-17 10:28:59', '2021-10-05 15:21:48'),
(7, 136, '[[{\"job_summmeryId\":126,\"per_id\":0,\"order_id\":136,\"item_id\":1,\"job_id\":2,\"job_chain_id\":null,\"appr_id\":0,\"master_job_id\":2,\"job_no\":1,\"job_code\":\"COP\",\"order_no\":\"\",\"po_number\":\"LOG180069_COP001\",\"tmp_po_number\":\"LOG180069_COP001\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2021-10-09 20:00:00\",\"contact_person\":\"\",\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2021-10-07 15:21:29\",\"updated_date\":\"2021-10-07 15:21:29\",\"vUserName\":null,\"resourcePic\":null,\"iUserId\":null,\"contactPerson\":null,\"contactPersonId\":null}],[{\"job_summmeryId\":127,\"per_id\":0,\"order_id\":136,\"item_id\":2,\"job_id\":7,\"job_chain_id\":17,\"appr_id\":0,\"master_job_id\":7,\"job_no\":2,\"job_code\":\"SEO\",\"order_no\":\"\",\"po_number\":\"LOG180069_SEO002\",\"tmp_po_number\":\"LOG180069_SEO002\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2021-10-08 15:22:00\",\"contact_person\":\"\",\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2021-10-07 15:22:37\",\"updated_date\":\"2021-10-07 15:22:37\",\"vUserName\":null,\"resourcePic\":null,\"iUserId\":null,\"contactPerson\":null,\"contactPersonId\":null},{\"job_summmeryId\":128,\"per_id\":0,\"order_id\":136,\"item_id\":2,\"job_id\":3,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":3,\"job_no\":3,\"job_code\":\"DTP\",\"order_no\":\"\",\"po_number\":\"LOG180069_DTP003\",\"tmp_po_number\":\"LOG180069_DTP003\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2021-10-08 15:22:00\",\"contact_person\":\"\",\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2021-10-07 15:22:38\",\"updated_date\":\"2021-10-07 15:22:38\",\"vUserName\":null,\"resourcePic\":null,\"iUserId\":null,\"contactPerson\":null,\"contactPersonId\":null},{\"job_summmeryId\":129,\"per_id\":0,\"order_id\":136,\"item_id\":2,\"job_id\":4,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":4,\"job_no\":5,\"job_code\":\"DTC\",\"order_no\":\"\",\"po_number\":\"LOG180069_DTC005\",\"tmp_po_number\":\"LOG180069_DTC005\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2021-10-08 15:22:00\",\"contact_person\":\"\",\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2021-10-07 15:22:39\",\"updated_date\":\"2021-10-07 15:22:39\",\"vUserName\":null,\"resourcePic\":null,\"iUserId\":null,\"contactPerson\":null,\"contactPersonId\":null}],[{\"job_summmeryId\":130,\"per_id\":0,\"order_id\":136,\"item_id\":3,\"job_id\":3,\"job_chain_id\":null,\"appr_id\":0,\"master_job_id\":3,\"job_no\":6,\"job_code\":\"DTP\",\"order_no\":\"\",\"po_number\":\"LOG180069_DTP006\",\"tmp_po_number\":\"LOG180069_DTP006\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2021-10-07 15:22:00\",\"contact_person\":\"\",\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2021-10-07 15:23:16\",\"updated_date\":\"2021-10-07 15:23:16\",\"vUserName\":null,\"resourcePic\":null,\"iUserId\":null,\"contactPerson\":null,\"contactPersonId\":null}]]', '2021-10-07 10:01:32', '2021-10-07 15:31:32'),
(8, 107, '[[{\"job_summmeryId\":97,\"per_id\":0,\"order_id\":107,\"item_id\":1,\"job_id\":0,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":1,\"job_no\":1,\"job_code\":\"BAD\",\"order_no\":\"\",\"po_number\":\"LOG180052_BAD001\",\"tmp_po_number\":\"LOG180052_BAD001\",\"description\":\"test script\",\"resource\":2,\"due_date\":\"2021-09-13 10:34:00\",\"contact_person\":5,\"item_status\":\"Ready to be Delivered\",\"company_code\":\"LOG180052\",\"work_instruction\":\"[{\\\"work_id\\\":0,\\\"work_name\\\":\\\"test54\\\"}]\",\"ItemLanguage\":\"English (US) > Hindi\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"csv_price\":\"\",\"price\":\"[{\\\"quantity\\\":\\\"1000\\\",\\\"pricelist\\\":\\\"Discount - Quality\\\",\\\"itemPrice\\\":\\\"1\\\",\\\"itemTotal\\\":\\\"1000\\\",\\\"amtSum\\\":1000},{\\\"quantity\\\":\\\"20\\\",\\\"pricelist\\\":\\\"Available price unit 2\\\",\\\"itemPrice\\\":\\\"6\\\",\\\"itemTotal\\\":\\\"120\\\",\\\"amtSum\\\":120},{\\\"id\\\":0,\\\"quantity\\\":\\\"1\\\",\\\"pricelist\\\":\\\"Words Proofreading 100% Match\\\",\\\"itemPrice\\\":\\\"0,5\\\",\\\"itemTotal\\\":\\\"0.5\\\"},{\\\"id\\\":1,\\\"quantity\\\":\\\"2\\\",\\\"pricelist\\\":\\\"Words Translation (New)\\\",\\\"itemPrice\\\":\\\"0,15\\\",\\\"itemTotal\\\":\\\"0.3\\\"}]\",\"total_price\":1120.8,\"created_date\":\"2021-09-13 10:36:27\",\"updated_date\":\"2021-10-18 10:44:34\",\"vUserName\":\"T Admin\",\"iUserId\":2,\"contactPerson\":\"Mayank Vadiya\",\"contactPersonId\":5}],[{\"job_summmeryId\":98,\"per_id\":0,\"order_id\":107,\"item_id\":2,\"job_id\":0,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":2,\"job_no\":2,\"job_code\":\"COP\",\"order_no\":\"\",\"po_number\":\"LOG180052_COP002\",\"tmp_po_number\":\"LOG180052_COP002\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2021-09-13 09:43:00\",\"contact_person\":1,\"item_status\":\"Delivered\",\"company_code\":\"LOG180052\",\"work_instruction\":\"[]\",\"ItemLanguage\":\"Estonian > Icelandic\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"csv_price\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2021-09-13 10:46:31\",\"updated_date\":\"2021-09-16 13:05:11\",\"vUserName\":null,\"iUserId\":null,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}]]', '2021-10-18 05:15:02', '2021-10-18 10:41:51'),
(9, 142, '[[{\"job_summmeryId\":146,\"per_id\":0,\"order_id\":142,\"item_id\":1,\"job_id\":0,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":1,\"job_no\":1,\"job_code\":\"BAD\",\"order_no\":\"\",\"po_number\":\"LOG180075_BAD001\",\"tmp_po_number\":\"LOG180075_BAD001\",\"description\":\"\",\"resource\":2,\"due_date\":\"2021-10-18 14:37:00\",\"contact_person\":5,\"item_status\":\"In-progress\",\"company_code\":\"LOG180075\",\"work_instruction\":\"[{\\\"work_id\\\":0,\\\"work_name\\\":\\\"hfhfhfh\\\"}]\",\"ItemLanguage\":\"English (US) > Hindi\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"csv_price\":\"\",\"price\":\"[]\",\"total_price\":0,\"created_date\":\"2021-10-18 14:37:51\",\"updated_date\":\"2021-10-18 15:53:20\",\"vUserName\":\"T Admin\",\"iUserId\":2,\"contactPerson\":\"Mayank Vadiya\",\"contactPersonId\":5}]]', '2021-10-18 10:30:23', '2021-10-18 15:10:40'),
(10, 143, '[[{\"job_summmeryId\":150,\"per_id\":0,\"order_id\":143,\"item_id\":1,\"job_id\":6,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":6,\"job_no\":1,\"job_code\":\"FED\",\"order_no\":\"\",\"po_number\":\"LOG180076_FED001\",\"tmp_po_number\":\"LOG180076_FED001\",\"description\":\"\",\"resource\":2,\"due_date\":\"2021-10-19 15:01:00\",\"contact_person\":5,\"item_status\":\"In preparation\",\"company_code\":\"LOG180076\",\"work_instruction\":\"[{\\\"work_id\\\":0,\\\"work_name\\\":\\\"dfdgdg\\\"}]\",\"ItemLanguage\":\"English (US) > Hindi\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"csv_price\":\"\",\"price\":\"[{\\\"id\\\":0,\\\"quantity\\\":\\\"1\\\",\\\"pricelist\\\":\\\"Words Proofreading 100% Match\\\",\\\"itemPrice\\\":0,\\\"itemTotal\\\":0},{\\\"id\\\":1,\\\"quantity\\\":\\\"2\\\",\\\"pricelist\\\":\\\"Words Translation (New)\\\",\\\"itemPrice\\\":0,\\\"itemTotal\\\":0}]\",\"total_price\":0,\"created_date\":\"2021-10-19 15:03:31\",\"updated_date\":\"2021-10-19 15:22:46\",\"vUserName\":\"T Admin\",\"resourcePic\":\"1545299996.jpg\",\"iUserId\":2,\"contactPerson\":\"Mayank Vadiya\",\"contactPersonId\":5}],[{\"job_summmeryId\":151,\"per_id\":0,\"order_id\":143,\"item_id\":2,\"job_id\":6,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":6,\"job_no\":2,\"job_code\":\"FED\",\"order_no\":\"\",\"po_number\":\"LOG180076_FED002\",\"tmp_po_number\":\"LOG180076_FED002\",\"description\":\"test\",\"resource\":2,\"due_date\":\"2021-10-21 15:04:00\",\"contact_person\":1,\"item_status\":\"Assigned-waiting\",\"company_code\":\"LOG180076\",\"work_instruction\":\"[{\\\"work_id\\\":0,\\\"work_name\\\":\\\"dfdgdg\\\"}]\",\"ItemLanguage\":\"Danish > English (UK)\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"csv_price\":\"\",\"price\":\"[{\\\"id\\\":0,\\\"quantity\\\":\\\"1\\\",\\\"pricelist\\\":\\\"Words Proofreading 100% Match\\\",\\\"itemPrice\\\":0,\\\"itemTotal\\\":0},{\\\"id\\\":1,\\\"quantity\\\":\\\"2\\\",\\\"pricelist\\\":\\\"Words Translation (New)\\\",\\\"itemPrice\\\":0,\\\"itemTotal\\\":0}]\",\"total_price\":0,\"created_date\":\"2021-10-19 15:05:16\",\"updated_date\":\"2021-10-19 15:29:35\",\"vUserName\":\"T Admin\",\"resourcePic\":\"1545299996.jpg\",\"iUserId\":2,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}]]', '2021-10-19 10:42:44', '2021-10-19 16:12:44'),
(11, 146, '[[{\"job_summmeryId\":157,\"per_id\":0,\"order_id\":146,\"item_id\":1,\"job_id\":4,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":4,\"job_no\":1,\"job_code\":\"DTC\",\"order_no\":\"\",\"po_number\":\"LOG180079_DTC001\",\"tmp_po_number\":\"LOG180079_DTC001\",\"description\":\"sf\",\"resource\":2,\"due_date\":\"2021-10-19 18:35:00\",\"contact_person\":1,\"item_status\":\"In-progress\",\"company_code\":\"LOG180079\",\"work_instruction\":\"[{\\\"work_id\\\":0,\\\"work_name\\\":\\\"ssfsf\\\"}]\",\"ItemLanguage\":\"English (US) > Hindi\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"csv_price\":\"\",\"price\":\"[{\\\"id\\\":0,\\\"quantity\\\":\\\"1\\\",\\\"pricelist\\\":\\\"Words Proofreading 100% Match\\\",\\\"itemPrice\\\":\\\"0,2\\\",\\\"itemTotal\\\":\\\"0.2\\\"},{\\\"id\\\":1,\\\"quantity\\\":\\\"2\\\",\\\"pricelist\\\":\\\"Words Translation (New)\\\",\\\"itemPrice\\\":\\\"0,20\\\",\\\"itemTotal\\\":\\\"0.4\\\"}]\",\"total_price\":0.6,\"created_date\":\"2021-10-19 18:35:12\",\"updated_date\":\"2021-10-19 18:36:24\",\"vUserName\":\"T Admin\",\"resourcePic\":\"1545299996.jpg\",\"iUserId\":2,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}]]', '2021-10-19 13:06:28', '2021-10-19 18:36:28'),
(12, 147, '[[{\"job_summmeryId\":160,\"per_id\":0,\"order_id\":147,\"item_id\":1,\"job_id\":8,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":8,\"job_no\":1,\"job_code\":\"TEST\",\"order_no\":\"\",\"po_number\":\"LOG180080_TEST001\",\"tmp_po_number\":\"LOG180080_TEST001\",\"description\":\"\",\"resource\":2,\"due_date\":\"2021-10-20 10:48:00\",\"contact_person\":1,\"item_status\":\"In-progress\",\"company_code\":\"LOG180080\",\"work_instruction\":\"[]\",\"ItemLanguage\":\"English (US) > Hindi\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"csv_price\":\"\",\"price\":\"[{\\\"id\\\":0,\\\"quantity\\\":\\\"1\\\",\\\"pricelist\\\":\\\"Words Proofreading 100% Match\\\",\\\"itemPrice\\\":\\\"0,2\\\",\\\"itemTotal\\\":\\\"0.2\\\"},{\\\"id\\\":1,\\\"quantity\\\":\\\"2\\\",\\\"pricelist\\\":\\\"Words Translation (New)\\\",\\\"itemPrice\\\":\\\"0,20\\\",\\\"itemTotal\\\":\\\"0.4\\\"}]\",\"total_price\":0.6,\"created_date\":\"2021-10-20 10:48:39\",\"updated_date\":\"2021-10-20 10:50:51\",\"vUserName\":\"T Admin\",\"resourcePic\":\"1545299996.jpg\",\"iUserId\":2,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}],[{\"job_summmeryId\":161,\"per_id\":0,\"order_id\":147,\"item_id\":2,\"job_id\":7,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":7,\"job_no\":2,\"job_code\":\"SEO\",\"order_no\":\"\",\"po_number\":\"LOG180080_SEO002\",\"tmp_po_number\":\"LOG180080_SEO002\",\"description\":\"test\",\"resource\":2,\"due_date\":\"2021-10-28 10:49:00\",\"contact_person\":1,\"item_status\":\"Delivered\",\"company_code\":\"LOG180080\",\"work_instruction\":\"[{\\\"work_id\\\":0,\\\"work_name\\\":\\\"35\\\"}]\",\"ItemLanguage\":\"Danish > Estonian\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"csv_price\":\"\",\"price\":\"[{\\\"id\\\":0,\\\"quantity\\\":\\\"1\\\",\\\"pricelist\\\":\\\"Words Proofreading 100% Match\\\",\\\"itemPrice\\\":\\\"0,2\\\",\\\"itemTotal\\\":\\\"0.2\\\"},{\\\"id\\\":1,\\\"quantity\\\":\\\"2\\\",\\\"pricelist\\\":\\\"Words Translation (New)\\\",\\\"itemPrice\\\":\\\"0,20\\\",\\\"itemTotal\\\":\\\"0.4\\\"},{\\\"quantity\\\":\\\"4\\\",\\\"pricelist\\\":\\\"Available price unit\\\",\\\"itemPrice\\\":\\\"20\\\",\\\"itemTotal\\\":\\\"80\\\",\\\"amtSum\\\":80},{\\\"quantity\\\":\\\"5\\\",\\\"pricelist\\\":\\\"Hour(s) Editing\\\",\\\"itemPrice\\\":\\\"17\\\",\\\"itemTotal\\\":\\\"85\\\",\\\"amtSum\\\":85}]\",\"total_price\":165.6,\"created_date\":\"2021-10-20 10:49:23\",\"updated_date\":\"2021-10-20 10:59:06\",\"vUserName\":\"T Admin\",\"resourcePic\":\"1545299996.jpg\",\"iUserId\":2,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}]]', '2021-10-20 05:29:14', '2021-10-20 10:59:14'),
(13, 102, '[[{\"job_summmeryId\":84,\"per_id\":0,\"order_id\":102,\"item_id\":1,\"job_id\":2,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":2,\"job_no\":1,\"job_code\":\"COP\",\"order_no\":\"\",\"po_number\":\"LOG180050_COP001\",\"tmp_po_number\":\"LOG180050_COP001\",\"description\":\"Test job 1\",\"resource\":2,\"due_date\":\"2021-09-02 17:48:00\",\"contact_person\":1,\"item_status\":\"In-progress\",\"company_code\":\"LOG180050\",\"work_instruction\":\"[{\\\"work_id\\\":0,\\\"work_name\\\":\\\"Test\\\"},{\\\"work_id\\\":1,\\\"work_name\\\":\\\"ABC\\\"}]\",\"ItemLanguage\":\"English (US) > Hindi\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"csv_price\":\"\",\"price\":\"[{\\\"quantity\\\":\\\"1\\\",\\\"pricelist\\\":\\\"Batch Delivery\\\",\\\"itemPrice\\\":\\\"100\\\",\\\"itemTotal\\\":\\\"100\\\",\\\"amtSum\\\":100},{\\\"id\\\":0,\\\"quantity\\\":\\\"1\\\",\\\"pricelist\\\":\\\"Words Proofreading 100% Match\\\",\\\"itemPrice\\\":\\\"0,2\\\",\\\"itemTotal\\\":\\\"0.2\\\"},{\\\"id\\\":1,\\\"quantity\\\":\\\"2\\\",\\\"pricelist\\\":\\\"Words Translation (New)\\\",\\\"itemPrice\\\":\\\"0,20\\\",\\\"itemTotal\\\":\\\"0.4\\\"}]\",\"total_price\":100.6,\"created_date\":\"2021-09-02 17:40:13\",\"updated_date\":\"2021-10-20 11:12:18\",\"vUserName\":\"T Admin\",\"resourcePic\":\"1545299996.jpg\",\"iUserId\":2,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}],[{\"job_summmeryId\":85,\"per_id\":0,\"order_id\":102,\"item_id\":2,\"job_id\":0,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":6,\"job_no\":2,\"job_code\":\"FED\",\"order_no\":\"\",\"po_number\":\"LOG180050_FED002\",\"tmp_po_number\":\"LOG180050_FED002\",\"description\":\"ABC\",\"resource\":2,\"due_date\":\"2021-09-02 17:41:00\",\"contact_person\":5,\"item_status\":\"Without invoice\",\"company_code\":\"LOG180050\",\"work_instruction\":\"[{\\\"work_id\\\":0,\\\"work_name\\\":\\\"Check First Doc\\\"},{\\\"work_id\\\":1,\\\"work_name\\\":\\\"Test first\\\"}]\",\"ItemLanguage\":\"English (US) > Icelandic\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"csv_price\":\"\",\"price\":\"[{\\\"id\\\":0,\\\"quantity\\\":\\\"1\\\",\\\"pricelist\\\":\\\"Words Proofreading 100% Match\\\",\\\"itemPrice\\\":0,\\\"itemTotal\\\":0},{\\\"id\\\":1,\\\"quantity\\\":\\\"2\\\",\\\"pricelist\\\":\\\"Words Translation (New)\\\",\\\"itemPrice\\\":0,\\\"itemTotal\\\":0}]\",\"total_price\":0,\"created_date\":\"2021-09-02 17:42:02\",\"updated_date\":\"2021-10-20 11:12:38\",\"vUserName\":\"T Admin\",\"resourcePic\":\"1545299996.jpg\",\"iUserId\":2,\"contactPerson\":\"Mayank Vadiya\",\"contactPersonId\":5}],[{\"job_summmeryId\":86,\"per_id\":0,\"order_id\":102,\"item_id\":3,\"job_id\":0,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":2,\"job_no\":3,\"job_code\":\"COP\",\"order_no\":\"\",\"po_number\":\"LOG180050_COP003\",\"tmp_po_number\":\"LOG180050_COP003\",\"description\":\"OKTEST\",\"resource\":2,\"due_date\":\"2021-09-02 18:39:00\",\"contact_person\":1,\"item_status\":\"Delivered\",\"company_code\":\"LOG180050\",\"work_instruction\":\"[]\",\"ItemLanguage\":\"Danish > English (US)\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"csv_price\":\"\",\"price\":\"[{\\\"quantity\\\":\\\"2\\\",\\\"pricelist\\\":\\\"Hour(s) Proofreading\\\",\\\"itemPrice\\\":\\\"17\\\",\\\"itemTotal\\\":\\\"34\\\",\\\"amtSum\\\":34},{\\\"quantity\\\":\\\"5\\\",\\\"pricelist\\\":\\\"Batch Delivery\\\",\\\"itemPrice\\\":\\\"10\\\",\\\"itemTotal\\\":\\\"50\\\",\\\"amtSum\\\":50}]\",\"total_price\":84,\"created_date\":\"2021-09-02 18:40:28\",\"updated_date\":\"2021-09-03 14:30:58\",\"vUserName\":\"T Admin\",\"resourcePic\":\"1545299996.jpg\",\"iUserId\":2,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}]]', '2021-10-20 05:53:22', '2021-10-20 11:23:22'),
(14, 35, '[[{\"job_summmeryId\":41,\"per_id\":0,\"order_id\":35,\"item_id\":1,\"job_id\":0,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":1,\"job_no\":2,\"job_code\":\"BAD\",\"order_no\":\"\",\"po_number\":\"LOG180005_BAD002\",\"tmp_po_number\":\"LOG180005_BAD002\",\"description\":\"opk\",\"resource\":2,\"due_date\":\"2021-06-21 19:13:00\",\"contact_person\":5,\"item_status\":\"In-progress\",\"company_code\":\"LOG180005\",\"work_instruction\":\"[{\\\"work_id\\\":\\\"2\\\",\\\"work_name\\\":\\\"Run spell check\\\"},{\\\"work_id\\\":\\\"8\\\",\\\"work_name\\\":\\\"Testing\\\"}]\",\"ItemLanguage\":\"English (US) > English (US)\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"csv_price\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2021-06-21 19:15:46\",\"updated_date\":\"2021-06-22 11:40:02\",\"vUserName\":\"T Admin\",\"iUserId\":2,\"contactPerson\":\"Mayank Vadiya\",\"contactPersonId\":5}],[{\"job_summmeryId\":40,\"per_id\":0,\"order_id\":35,\"item_id\":2,\"job_id\":1,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":1,\"job_no\":1,\"job_code\":\"BAD\",\"order_no\":\"\",\"po_number\":\"LOG180005_BAD001\",\"tmp_po_number\":\"LOG180005_BAD001\",\"description\":\"ok\",\"resource\":2,\"due_date\":\"2021-06-14 18:07:00\",\"contact_person\":5,\"item_status\":\"In-progress\",\"company_code\":\"LOG180005\",\"work_instruction\":\"[{\\\"work_id\\\":0,\\\"work_name\\\":\\\"Run Qa in MemoQ\\\"},{\\\"work_id\\\":1,\\\"work_name\\\":\\\"Translate file(s)\\\"},{\\\"work_id\\\":2,\\\"work_name\\\":\\\"Run spell check\\\"}]\",\"ItemLanguage\":\"English (US) > Hindi\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"csv_price\":\"\",\"price\":\"[{\\\"id\\\":0,\\\"quantity\\\":\\\"20\\\",\\\"pricelist\\\":\\\"Words Proofreading 100% Match\\\",\\\"itemPrice\\\":\\\"0,20\\\",\\\"itemTotal\\\":\\\"4\\\"},{\\\"id\\\":1,\\\"quantity\\\":\\\"50\\\",\\\"pricelist\\\":\\\"1-10 QA errors\\\",\\\"itemPrice\\\":\\\"1,08\\\",\\\"itemTotal\\\":\\\"54\\\"}]\",\"total_price\":58,\"created_date\":\"2021-06-21 18:08:02\",\"updated_date\":\"2021-11-09 11:58:09\",\"vUserName\":\"T Admin\",\"iUserId\":2,\"contactPerson\":\"Mayank Vadiya\",\"contactPersonId\":5}]]', '2021-11-17 06:32:40', '2021-11-09 11:49:53'),
(15, 151, '[[{\"job_summmeryId\":167,\"per_id\":0,\"order_id\":151,\"item_id\":1,\"job_id\":3,\"job_chain_id\":null,\"appr_id\":0,\"master_job_id\":3,\"job_no\":1,\"job_code\":\"DTP\",\"order_no\":\"\",\"po_number\":\"LOG180083_DTP001\",\"tmp_po_number\":\"LOG180083_DTP001\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2021-11-17 17:28:00\",\"contact_person\":\"\",\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"English (US) > Hindi\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"csv_price\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2021-11-17 17:28:39\",\"updated_date\":\"2021-11-17 17:28:39\",\"vUserName\":null,\"resourcePic\":null,\"iUserId\":null,\"contactPerson\":null,\"contactPersonId\":null}],[{\"job_summmeryId\":168,\"per_id\":0,\"order_id\":151,\"item_id\":2,\"job_id\":6,\"job_chain_id\":null,\"appr_id\":0,\"master_job_id\":6,\"job_no\":2,\"job_code\":\"FED\",\"order_no\":\"\",\"po_number\":\"LOG180083_FED002\",\"tmp_po_number\":\"LOG180083_FED002\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2021-11-17 17:29:00\",\"contact_person\":\"\",\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"English (US) > Dutch\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"csv_price\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2021-11-17 17:29:22\",\"updated_date\":\"2021-11-17 17:29:22\",\"vUserName\":null,\"resourcePic\":null,\"iUserId\":null,\"contactPerson\":null,\"contactPersonId\":null}]]', '2021-11-17 12:03:18', '2021-11-17 17:33:18'),
(16, 152, '[[{\"job_summmeryId\":169,\"per_id\":0,\"order_id\":152,\"item_id\":1,\"job_id\":3,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":3,\"job_no\":1,\"job_code\":\"DTP\",\"order_no\":\"\",\"po_number\":\"LOG180084_DTP001\",\"tmp_po_number\":\"LOG180084_DTP001\",\"description\":\"\",\"resource\":2,\"due_date\":\"2021-11-17 05:14:00\",\"contact_person\":1,\"item_status\":\"In-progress\",\"company_code\":\"LOG180084\",\"work_instruction\":\"[]\",\"ItemLanguage\":\"English (US) > Hindi\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"csv_price\":\"\",\"price\":\"[{\\\"quantity\\\":\\\"1160\\\",\\\"pricelist\\\":\\\"Words Translation Repetition Match\\\",\\\"itemPrice\\\":\\\"01\\\",\\\"itemTotal\\\":\\\"1160\\\",\\\"amtSum\\\":1160},{\\\"id\\\":null,\\\"quantity\\\":\\\"10\\\",\\\"pricelist\\\":\\\"Words Translation 101% Match\\\",\\\"itemPrice\\\":\\\"10\\\",\\\"itemTotal\\\":\\\"100\\\",\\\"amtSum\\\":100},{\\\"id\\\":null,\\\"quantity\\\":\\\"213\\\",\\\"pricelist\\\":\\\"Words Translation 100% Match\\\",\\\"itemPrice\\\":\\\"2,00\\\",\\\"itemTotal\\\":\\\"426\\\"},{\\\"id\\\":null,\\\"quantity\\\":\\\"1277\\\",\\\"pricelist\\\":\\\"Words Translation 95%-99% Match\\\",\\\"itemPrice\\\":\\\"0,12\\\",\\\"itemTotal\\\":\\\"153.23\\\"},{\\\"id\\\":null,\\\"quantity\\\":\\\"1190\\\",\\\"pricelist\\\":\\\"Words Translation 85%-94% Match\\\",\\\"itemPrice\\\":\\\"0,25\\\",\\\"itemTotal\\\":\\\"297.5\\\"},{\\\"id\\\":null,\\\"quantity\\\":\\\"2046\\\",\\\"pricelist\\\":\\\"Words Translation 75%-84% Match\\\",\\\"itemPrice\\\":0,\\\"itemTotal\\\":0},{\\\"id\\\":null,\\\"quantity\\\":\\\"324\\\",\\\"pricelist\\\":\\\"Words Translation 50%-74% Match\\\",\\\"itemPrice\\\":\\\"0,08\\\",\\\"itemTotal\\\":\\\"25.92\\\"},{\\\"id\\\":null,\\\"quantity\\\":\\\"10205\\\",\\\"pricelist\\\":\\\"Words Translation No match\\\",\\\"itemPrice\\\":0,\\\"itemTotal\\\":0}]\",\"total_price\":2162.66,\"created_date\":\"2021-11-17 18:44:16\",\"updated_date\":\"2021-11-17 18:47:07\",\"vUserName\":\"T Admin\",\"resourcePic\":\"1545299996.jpg\",\"iUserId\":2,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}]]', '2021-11-17 13:18:30', '2021-11-17 18:48:30'),
(17, 161, '[[{\"job_summmeryId\":175,\"per_id\":0,\"order_id\":161,\"item_id\":1,\"job_id\":2,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":2,\"job_no\":1,\"job_code\":\"COP\",\"order_no\":\"\",\"po_number\":\"LOG180088_COP001\",\"tmp_po_number\":\"LOG180088_COP001\",\"description\":\"test\",\"resource\":2,\"due_date\":\"2021-12-15 12:08:00\",\"contact_person\":1,\"item_status\":\"In-progress\",\"company_code\":\"LOG180088\",\"work_instruction\":\"[{\\\"work_id\\\":0,\\\"work_name\\\":\\\"test7668\\\"}]\",\"ItemLanguage\":\"English (US) > Danish\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"csv_price\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2021-12-15 12:08:49\",\"updated_date\":\"2021-12-15 12:44:24\",\"vUserName\":\"T Admin\",\"iUserId\":2,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}]]', '2021-12-15 07:22:50', '2021-12-15 12:45:03'),
(18, 163, '[[{\"job_summmeryId\":176,\"per_id\":0,\"order_id\":163,\"item_id\":1,\"job_id\":1,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":1,\"job_no\":1,\"job_code\":\"BAD\",\"order_no\":\"\",\"po_number\":\"LOG180089_BAD001\",\"tmp_po_number\":\"LOG180089_BAD001\",\"description\":\"\",\"resource\":2,\"due_date\":\"2021-12-16 16:00:00\",\"contact_person\":5,\"item_status\":\"In-progress\",\"company_code\":\"LOG180089\",\"work_instruction\":\"[]\",\"ItemLanguage\":\"English (US) > Danish\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"csv_price\":\"\",\"price\":\"[{\\\"quantity\\\":\\\"1277\\\",\\\"pricelist\\\":\\\"Words Proofreading 95-99% Match\\\",\\\"itemPrice\\\":\\\"3,00\\\",\\\"itemTotal\\\":\\\"3831\\\"},{\\\"id\\\":null,\\\"quantity\\\":\\\"6075\\\",\\\"pricelist\\\":\\\"Words Proofreading 50-74% Match\\\",\\\"itemPrice\\\":\\\"0,60\\\",\\\"itemTotal\\\":\\\"3645\\\"}]\",\"total_price\":7476,\"created_date\":\"2021-12-15 16:00:44\",\"updated_date\":\"2021-12-15 16:03:14\",\"vUserName\":\"T Admin\",\"resourcePic\":\"1545299996.jpg\",\"iUserId\":2,\"contactPerson\":\"Mayank Vadiya\",\"contactPersonId\":5}]]', '2021-12-15 10:33:19', '2021-12-15 16:03:19');
INSERT INTO `tms_summmery_view_sorting` (`id`, `order_id`, `sorted_json`, `updated_date`, `created_date`) VALUES
(19, 165, '[[{\"job_summmeryId\":177,\"per_id\":0,\"order_id\":165,\"item_id\":1,\"job_id\":1,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":1,\"job_no\":1,\"job_code\":\"BAD\",\"order_no\":\"\",\"po_number\":\"LOG180090_BAD001\",\"tmp_po_number\":\"LOG180090_BAD001\",\"description\":\"test\",\"resource\":2,\"due_date\":\"2022-01-12 22:59:00\",\"contact_person\":1,\"item_status\":\"New,Requested\",\"company_code\":\"LOG180090\",\"work_instruction\":\"[]\",\"ItemLanguage\":\"English (US) > Hindi\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"csv_price\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2022-01-10 16:58:59\",\"updated_date\":\"2022-01-10 17:01:01\",\"vUserName\":\"T Admin\",\"resourcePic\":\"1545299996.jpg\",\"iUserId\":2,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}],[{\"job_summmeryId\":178,\"per_id\":0,\"order_id\":165,\"item_id\":2,\"job_id\":0,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":3,\"job_no\":2,\"job_code\":\"DTP\",\"order_no\":\"\",\"po_number\":\"LOG180090_DTP002\",\"tmp_po_number\":\"LOG180090_DTP002\",\"description\":\"test\",\"resource\":2,\"due_date\":\"2022-01-10 16:59:00\",\"contact_person\":1,\"item_status\":\"In-progress\",\"company_code\":\"LOG180090\",\"work_instruction\":\"[]\",\"ItemLanguage\":\"Hindi > English (US)\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"csv_price\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2022-01-10 16:59:31\",\"updated_date\":\"2022-01-10 17:01:32\",\"vUserName\":\"T Admin\",\"resourcePic\":\"1545299996.jpg\",\"iUserId\":2,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}],[{\"job_summmeryId\":179,\"per_id\":0,\"order_id\":165,\"item_id\":3,\"job_id\":6,\"job_chain_id\":0,\"appr_id\":0,\"master_job_id\":6,\"job_no\":3,\"job_code\":\"FED\",\"order_no\":\"\",\"po_number\":\"LOG180090_FED003\",\"tmp_po_number\":\"LOG180090_FED003\",\"description\":\"t\",\"resource\":2,\"due_date\":\"2022-01-10 16:59:00\",\"contact_person\":1,\"item_status\":\"New,Assigned-waiting\",\"company_code\":\"LOG180090\",\"work_instruction\":\"[]\",\"ItemLanguage\":\"English (US) > Hindi\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"csv_price\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2022-01-10 16:59:52\",\"updated_date\":\"2022-01-10 17:01:54\",\"vUserName\":\"T Admin\",\"resourcePic\":\"1545299996.jpg\",\"iUserId\":2,\"contactPerson\":\"TMS Admin\",\"contactPersonId\":1}]]', '2022-01-10 11:37:47', '2022-01-10 17:07:47'),
(20, 166, '[[{\"job_summmeryId\":180,\"per_id\":0,\"order_id\":166,\"item_id\":1,\"job_id\":0,\"job_chain_id\":null,\"appr_id\":0,\"master_job_id\":3,\"job_no\":1,\"job_code\":\"DTP\",\"order_no\":\"\",\"po_number\":\"LOG180091_DTP001\",\"tmp_po_number\":\"LOG180091_DTP001\",\"description\":\"\",\"resource\":\"\",\"due_date\":\"2022-02-12 15:55:00\",\"contact_person\":\"\",\"item_status\":\"New\",\"company_code\":\"\",\"work_instruction\":\"\",\"ItemLanguage\":\"English (US) > English (US)\",\"specialization\":\"\",\"negative_feedback\":\"\",\"late_delivery\":\"\",\"auto_job\":1,\"auto_status\":\"Auto\",\"rejection\":\"\",\"csv_price\":\"\",\"price\":\"\",\"total_price\":0,\"created_date\":\"2022-02-11 15:55:43\",\"updated_date\":\"2022-02-11 15:55:43\",\"vUserName\":null,\"resourcePic\":null,\"iUserId\":null,\"contactPerson\":null,\"contactPersonId\":null}]]', '2022-02-11 10:26:04', '2022-02-11 15:56:04');

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
  `activation_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=not activated,1=activated',
  `is_available` int(11) NOT NULL DEFAULT '1' COMMENT '1=available,0=un-available(Linguist)',
  `activation_token` varchar(50) NOT NULL,
  `dtCreatedDate` datetime NOT NULL,
  `dtUpdatedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_users`
--

INSERT INTO `tms_users` (`iUserId`, `vUserName`, `freelancer`, `vEmailAddress`, `vSecondaryEmailAddress`, `vPassword`, `org_pass`, `eUserStatus`, `vResourceType`, `vResourcePosition`, `iFkUserTypeId`, `iResourceNumber`, `dtCreationDate`, `vTimeZone`, `vTimeZoneCity`, `vUTC`, `vFirstName`, `vLastName`, `dtBirthDate`, `companyName`, `vFacebook_id`, `vTwitter_id`, `vGoogle_plus_id`, `iGender`, `iMobile`, `vPhoneNumber`, `vWebsite`, `vSkypeName`, `vFileManage`, `vEmailTemplate`, `tMemo`, `vAddress1`, `vAddress2`, `address1Detail`, `address2Detail`, `vSalesId`, `vComapanyCode`, `vholiday_country`, `vProfilePic`, `enableDisbaleLoginStatus`, `created_by`, `created_by_name`, `modified_by`, `iEditedBy`, `dtLast_job`, `specialization`, `csv_import`, `activation_status`, `is_available`, `activation_token`, `dtCreatedDate`, `dtUpdatedDate`) VALUES
(1, 'TMS Admin', 'freelancer', 'admin@tms.com', 'anil.kanhasoft@gmail.com', '0e7517141fb53f21ee439b355b5a1d0a', 'Admin@123', 3, 1, 2, 1, '1', '2016-01-02 14:59:21', '', '', '', 'TMS', 'Admin', '1991-10-24', '', 'Https://www.google.co.in/?gfe_rd=cr&ei=VRKxWK2GM9e', 'https://www.google.co.in/?gfe_rd=cr&ei=VRKxWK2GM9e', 'https://www.google.co.in/?gfe_rd=cr&ei=VRKxWK2GM9e', 2, '{\"countryTitle\":\"India (भारत): +91\",\"countryFlagClass\":\"iti-flag in\",\"placeHolder\":\"091234 56789\",\"mobileNumber\":\"097128 11223\"}', '', 'http://www.kifuvazejys.com.au/', 'krunal.kanhasoft', '', '', '', '', '', '', '', '', '', '[{\"Cname\":\"Argentina\"},{\"Cname\":\"Australia\"},{\"Cname\":\"Aruba\"}]', '1545300029.jpg', 1, 1, '', 0, 5, '0000-00-00', '', 0, 1, 1, '', '2016-01-02 15:00:40', '2021-10-07 16:59:02'),
(2, 'T Admin', 'translation', 'tadmin@tms.com', 'v.ijayg.kanhasoft@gmail.com', '202cb962ac59075b964b07152d234b70', '123', 3, 4, 0, 2, '1', '2018-12-11 12:48:41', '', 'palitana', '', 'T', 'Admin', '1991-10-25', 'beconnected', '', '', '', 1, '{\"countryTitle\":\"India (भारत): +91\",\"countryFlagClass\":\"iti-flag in\",\"mobileNumber\":\"078749 34808\"}', '', 'http://192.168.1.111:898/', 'vijaygohil', '', '', '', 'Palitana-Gariyadhar Highway, Chomal, Gujarat, India', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"Chomal\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"GJ\"},{\"id\":\"address1_country\",\"value\":\"India\"},{\"id\":\"address1_postal_code\",\"value\":\"364270\"}]', '[]', '', '', '', '1545299996.jpg', 1, 1, '', 1, 2, '0000-00-00', '', 0, 1, 1, 'c5fca49343b2fe604512da6521c823c31dcd85eb', '2018-12-11 12:48:41', '2018-12-25 17:48:51'),
(3, 'Vijay Gohil', 'freelancer', 'v.ij.ayg.kanhasoft@gmail.com', '', '202cb962ac59075b964b07152d234b70', '123', 3, 1, 3, 1, '2', '0000-00-00 00:00:00', '', '', '', 'Vijay', 'Gohil', '1983-08-20', '', '', '', '', 1, '{\"countryTitle\":\"India (भारत): +91\",\"countryFlagClass\":\"iti-flag in\",\"placeHolder\":\"091234 56789\",\"mobileNumber\":\"099999 55555\"}', '', '', 'VJds', '', '', '', '', '', '', '', '', '', '', '1544614850.png', 1, 1, '', 0, 0, '0000-00-00', '', 0, 1, 1, '2a981b84afb27b9d7186b1fc044da49968ccfa87', '2018-12-12 17:10:50', '2021-10-08 14:16:49'),
(4, 'Rajesh Mudaliar', 'freelancer', 'rajeshmudaliar.kanhasoft@gmail.com', '', '202cb962ac59075b964b07152d234b70', '123', 3, 3, 4, 1, '3', '0000-00-00 00:00:00', '', '', '', 'Rajesh', 'Mudaliar', '1981-12-21', '', '', '', '', 2, '{\"countryTitle\":\"India (भारत): +91\",\"countryFlagClass\":\"iti-flag in\",\"placeHolder\":\"091234 56789\",\"mobileNumber\":\"099989 69871\"}', '', '', 'Rajesh Mudaliar', '', '', '', '', '', '', '', '', '', '', '1545201247.jpg', 1, 3, '', 0, 0, '0000-00-00', '', 0, 1, 1, '0a62dabbd8855a7e034cc2710d5a7b35aeec699f', '2018-12-12 17:52:54', '2018-12-19 12:08:31'),
(5, 'Mayank Vadiya', 'freelancer', 'vi.j.ayg.kanhasoft@gmail.com', '', '202cb962ac59075b964b07152d234b70', '123', 3, 2, 2, 1, '4', '0000-00-00 00:00:00', '', '', '', 'Mayank', 'Vadiya', '1991-01-22', '', '', '', '', 2, '{\"countryTitle\":\"India (भारत): +91\",\"countryFlagClass\":\"iti-flag in\",\"placeHolder\":\"091234 56789\",\"mobileNumber\":\"099989 69871\"}', '', '', 'mayank', '', '', '', '', '', '', '', '', '', '', '1546238296.jpg', 1, 1, '', 0, 0, '0000-00-00', '', 0, 1, 1, '5f08f15f694996bc0184edbed4fc65324ecde1dc', '2018-12-13 11:17:24', '2018-12-31 12:08:16'),
(6, 'Jaimini Test', 'freelancer', 'Jimikanhasoft@gmail.com', 'mahikanhasoft@gmail.com', '50b05da6c45629beaa0f610b8dea6eb7', 'Jaimini@205', 4, 3, 0, 2, '0002', '2021-07-05 12:10:35', '', 'tvh', '', 'Jaimini', 'Test', '2021-06-30', 'ABC', '', '', '', 2, '{\"countryTitle\":\"India (भारत): +91\",\"countryFlagClass\":\"iti-flag in\",\"mobileNumber\":\"87676 87687\"}', '', 'ABC.com', 'jimi', '', '', '', '', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"\"},{\"id\":\"address1_postal_code\",\"value\":\"\"}]', '[]', '', '', '', '1625467235.jpg', 1, 1, '', 0, 0, '0000-00-00', '', 0, 0, 1, '4cbed8ac6b45a3f4bb73ebc7626904b6a6b362b3', '2021-07-05 12:10:35', '2021-07-05 12:10:35'),
(7, 'Mahi Kanhasoft', 'freelancer', 'mahikanhasoft@gmail.com', 'rahikanhasoft@gmail.com', '0e7517141fb53f21ee439b355b5a1d0a', 'Admin@123', 4, 3, 0, 2, '0003', '2021-07-05 13:05:39', '', 'Ahmedabad', '', 'Mahi', 'Kanhasoft', '2021-01-01', 'ABC', '', '', '', 2, '{\"countryTitle\":\"India (भारत): +91\",\"countryFlagClass\":\"iti-flag in\",\"mobileNumber\":\"76766 76666\"}', '', 'abc.com', 'mahi', '', '', '', '', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"\"},{\"id\":\"address1_postal_code\",\"value\":\"\"}]', '[]', '', '', '', '1625470539.jpg', 1, 1, '', 0, 0, '0000-00-00', '', 0, 0, 1, '5021e2fdc0d97bb2ceba42a6b30e8ebc511a1398', '2021-07-05 13:05:39', '2021-07-05 13:05:39'),
(8, 'Angel Kanhasoft', 'freelancer', 'Angel.kanhasoft@gmail.com', 'angelkanhasoft@gmail.com', '0e7517141fb53f21ee439b355b5a1d0a', 'Admin@123', 4, 2, 0, 2, '0004', '2021-07-05 13:17:30', '', 'ahmedabad', '', 'Angel', 'Kanhasoft', '2021-06-29', 'ABC', '', '', '', 2, '{\"countryTitle\":\"India (भारत): +91\",\"countryFlagClass\":\"iti-flag in\",\"mobileNumber\":\"076767 67776\"}', '', 'abc.com', 'abc', '', '', '', '123 ,sdchac', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"\"},{\"id\":\"address1_postal_code\",\"value\":\"\"}]', '[]', '', '', '', '1625471250.jpg', 1, 1, '', 0, 0, '0000-00-00', '', 0, 0, 1, '142ebfab87a521e8859d8ec385caa20c0a278f95', '2021-07-05 13:17:30', '2021-07-05 13:17:30'),
(9, 'Jaimini Kanhasoft', 'freelancer', 'Jaimini.kanhasoft@gmail.com', '', '72d78a175bd8f5ed88c299ac2abdda80', 'Jaimini@123', 3, 2, 3, 1, '0005', '0000-00-00 00:00:00', '', '', '', 'Jaimini', 'Kanhasoft', '2021-01-01', '', '', '', '', 2, '{\"countryTitle\":\"India (भारत): +91\",\"countryFlagClass\":\"iti-flag in\",\"mobileNumber\":\"3453 553 533\"}', '', '', 'select', '', '', '', '', '', '', '', '', '', '', '1625471499.jpg', 1, 1, '', 0, 0, '0000-00-00', '', 0, 0, 1, '6d520bec59448080e50db754a8399b05a49f9e5c', '2021-07-05 13:21:39', '2021-07-05 13:21:39'),
(10, 'Diyal Info', 'translation', 'Test0507@pokemail.net', 'Diya@gmail.com', '9badac667c5c63f6ecc56dd022af723f', 'Diya@123', 3, 2, 0, 2, '5', '2021-07-06 12:28:51', '', 'AHmedabad', '', 'Diyal', 'Info', '2021-07-01', 'jhg', '', '', '', 2, '{\"countryTitle\":\"India (भारत): +91\",\"countryFlagClass\":\"iti-flag in\",\"mobileNumber\":\"076876 86868\"}', '', 'web.com', 'hg', '', '', '', 'mumbai', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"\"},{\"id\":\"address1_postal_code\",\"value\":\"\"}]', '[]', '', '', '', '1633614848.jpg', 1, 1, '', 1, 0, '0000-00-00', '', 0, 1, 0, '2ea349b59fafa75046a7ed1959c0a7e23d85aed2', '2021-07-06 12:28:51', '2021-12-14 18:46:23'),
(11, 'Anil Nadiya', 'freelancer', 'anil.kanhasoft@gmail.com', '', '202cb962ac59075b964b07152d234b70', '123', 3, 1, 3, 1, '6', '0000-00-00 00:00:00', '', '', '', 'Anil', 'Nadiya', '1993-08-24', '', '', '', '', 1, '{\"countryTitle\":\"India (भारत): +91\",\"countryFlagClass\":\"iti-flag in\",\"placeHolder\":\"091234 56789\",\"mobileNumber\":\"097376 36755\"}', '', '', 'anil.al', '', '', '', '', '', '', '', '', '', '', '1632207821.jpg', 1, 1, '', 0, 0, '0000-00-00', '', 0, 1, 1, 'ed23279c5a82428be66083c8073d9234bbdae043', '2021-09-21 12:33:41', '2021-12-15 16:31:19'),
(12, 'Aleksandra Test', 'freelancer', 'akrustevabeconnected@gmail.com', 'test@beconnected.no', '5b4a90d67040396a2787f30a9abd2153', 'yt&itq85Jt', 5, 4, 0, 2, '0006', '2022-04-12 16:13:33', '', 'Si', '', 'Aleksandra', 'Test', '1992-05-26', 'Test', '', '', '', 2, '{\"countryTitle\":\"Bulgaria (България): +359\",\"countryFlagClass\":\"iti-flag bg\",\"mobileNumber\":\"887392424\"}', '', 'test', 'test', '', '', '', '', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"\"},{\"id\":\"address1_postal_code\",\"value\":\"\"}]', '[]', '', '', '', '1649760213.jpg', 1, 1, '', 0, 0, '0000-00-00', '', 0, 0, 1, 'b56971613373fed9ff2fad684c650445f240d852', '2022-04-12 16:13:33', '2022-04-12 16:13:33'),
(13, 'Aleksandra Test2', 'freelancer', 'vlavla845@gmail.com', 'akrusteva@beconnected.no', '5b4a90d67040396a2787f30a9abd2153', 'yt&itq85Jt', 5, 4, 0, 2, '0006', '2022-04-12 16:16:16', '', 'Si', '', 'Aleksandra', 'Test2', '1992-05-26', 'Test', '', '', '', 2, '{\"countryTitle\":\"Bulgaria (България): +359\",\"countryFlagClass\":\"iti-flag bg\",\"mobileNumber\":\"088 739 2424\"}', '', 'test', 'test', '', '', '', '', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"\"},{\"id\":\"address1_postal_code\",\"value\":\"\"}]', '[]', '', '', '', '1649760376.jpg', 1, 1, '', 0, 0, '0000-00-00', '', 0, 0, 1, 'b11b4bfc2564fe56a7bc1dc9884f62e5e14b3003', '2022-04-12 16:16:16', '2022-04-12 16:16:16'),
(14, 'TestTestTestTest', 'freelancer', 'testtesttest@gmail.com', 'testtest@abv.bg', '5b4a90d67040396a2787f30a9abd2153', 'yt&itq85Jt', 5, 4, 0, 2, '0006', '2022-04-12 16:18:14', '', 'Si', '', 'Aleksandra', 'Test2', '1992-05-26', 'Test', '', '', '', 2, '{\"countryTitle\":\"Bulgaria (България): +359\",\"countryFlagClass\":\"iti-flag bg\",\"mobileNumber\":\"088 739 2424\"}', '', 'test', 'test', '', '', '', '', '', '[{\"id\":\"address1_street_number\",\"value\":\"\"},{\"id\":\"address1_locality\",\"value\":\"\"},{\"id\":\"address1_administrative_area_level_1\",\"value\":\"\"},{\"id\":\"address1_country\",\"value\":\"\"},{\"id\":\"address1_postal_code\",\"value\":\"\"}]', '[]', '', '', '', '1649760494.jpg', 1, 1, '', 0, 0, '0000-00-00', '', 0, 0, 1, '2a8a5498b0374e1b13d0f2fcf26fec0faba215bb', '2022-04-12 16:18:14', '2022-04-12 16:18:14');

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

--
-- Dumping data for table `tms_user_contact`
--

INSERT INTO `tms_user_contact` (`iContactId`, `iUserId`, `vFirstName`, `vLastName`, `vEmail`, `vSkype`, `vDepartment`, `vJobTitle`, `vPhone`, `status`, `dtCreatedDate`, `dtUpdatedDate`) VALUES
(1, 2, 'Jayesh', 'Vala', 'jayesh@gmail.com', 'jayesh234', 'test', 'jobtest', '{\"countryTitle\":\"India (????): +91\",\"countryFlagClass\":\"iti-flag in\",\"mobileNumber\":\"99989 69871\"}', '', '2018-12-11 12:49:51', '2018-12-11 12:49:51'),
(2, 0, 'Ffhg', 'J', 'test0507@pokemail.net', 'asd', 'ABC', 'Manager', '{\"countryTitle\":\"India (????): +91\",\"countryFlagClass\":\"iti-flag in\",\"mobileNumber\":\"3453 535 355\"}', '', '2021-07-06 12:30:03', '2021-07-06 12:30:03');

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
(1, 'Business Manager', '1', '2017-03-27 17:12:39', '2017-09-28 16:04:38'),
(2, 'Project Manager', '1', '2017-03-27 17:12:44', '2017-09-28 16:04:45'),
(3, 'Project Co-Ordinator', '1', '2017-03-27 17:12:48', '2018-02-19 15:46:07'),
(4, 'QA/Tester', '1', '2017-08-02 12:46:17', '2018-04-18 15:46:39'),
(5, 'Finance', '1', '2018-04-17 16:18:08', '2018-04-30 13:00:16'),
(15, 'New', '0', '2018-04-18 16:12:43', '2018-09-27 18:06:59');

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
(1, 2, 1, 1, '1', '2018-12-11 12:50:02', '2018-12-11 12:50:02');

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
(5, 1, 'Under testing', 'New freelancer currently being tested', 1, '2015-10-29 17:44:19', '2017-02-08 13:15:56'),
(7, 2, 'InActive', 'inactive status', 1, '2015-11-24 13:34:45', '2016-12-15 16:17:56'),
(8, 2, 'Active', 'Active status', 1, '2015-11-24 14:38:06', '2016-11-28 15:59:12'),
(9, 2, 'Blacklisted', 'blacklisted status', 1, '2015-11-24 14:38:53', '2018-02-20 14:28:41'),
(10, 2, 'New', 'New status', 1, '2015-11-24 14:39:10', '2016-07-12 15:19:24'),
(11, 2, 'Prospect', 'Prospect status', 1, '2015-11-24 14:39:43', '2016-07-19 14:50:45'),
(15, 1, 'Working', 'test', 1, '2017-03-07 16:21:16', '2017-03-28 16:25:39'),
(18, 2, 'Added1', 'New added', 1, '2018-04-18 11:28:53', '2018-10-03 13:30:19'),
(20, 1, 'Add', '', 1, '2018-04-18 16:13:44', '2018-04-18 16:13:50');

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
(1, 2, 'Project Coordinator', 1, 'Active', '2015-10-24 18:30:16', '2015-10-24 18:30:16'),
(2, 2, 'Project Manager', 1, 'Active', '2015-10-24 18:30:25', '2015-10-24 18:30:25'),
(3, 2, 'QA Specialist', 1, 'Active', '2015-10-24 18:30:36', '2015-10-24 18:30:36'),
(4, 2, 'Resource Coordinator', 1, 'Active', '2015-10-29 17:43:49', '2015-10-29 17:43:49');

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
  MODIFY `bank_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tms_centers`
--
ALTER TABLE `tms_centers`
  MODIFY `center_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tms_child_price_unit`
--
ALTER TABLE `tms_child_price_unit`
  MODIFY `child_price_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `tms_client`
--
ALTER TABLE `tms_client`
  MODIFY `iClientId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tms_client_contact`
--
ALTER TABLE `tms_client_contact`
  MODIFY `iContactId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `tms_customer`
--
ALTER TABLE `tms_customer`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;
--
-- AUTO_INCREMENT for table `tms_customer_group`
--
ALTER TABLE `tms_customer_group`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tms_customer_price_list`
--
ALTER TABLE `tms_customer_price_list`
  MODIFY `price_list_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
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
  MODIFY `iClientId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tms_directiory`
--
ALTER TABLE `tms_directiory`
  MODIFY `id` int(7) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tms_discussion`
--
ALTER TABLE `tms_discussion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=416;
--
-- AUTO_INCREMENT for table `tms_email_sign`
--
ALTER TABLE `tms_email_sign`
  MODIFY `sign_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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
  MODIFY `fmanager_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1917;
--
-- AUTO_INCREMENT for table `tms_general`
--
ALTER TABLE `tms_general`
  MODIFY `general_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;
--
-- AUTO_INCREMENT for table `tms_invoice`
--
ALTER TABLE `tms_invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tms_invoice_client`
--
ALTER TABLE `tms_invoice_client`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tms_invoice_client_payments`
--
ALTER TABLE `tms_invoice_client_payments`
  MODIFY `partial_payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tms_invoice_due_period`
--
ALTER TABLE `tms_invoice_due_period`
  MODIFY `invoice_due_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tms_invoice_payments`
--
ALTER TABLE `tms_invoice_payments`
  MODIFY `partial_payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `tms_items`
--
ALTER TABLE `tms_items`
  MODIFY `itemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=248;
--
-- AUTO_INCREMENT for table `tms_item_status`
--
ALTER TABLE `tms_item_status`
  MODIFY `item_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `tms_jobs`
--
ALTER TABLE `tms_jobs`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tms_job_chain`
--
ALTER TABLE `tms_job_chain`
  MODIFY `job_chain_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
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
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `tms_knowledge_news`
--
ALTER TABLE `tms_knowledge_news`
  MODIFY `k_news_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `tms_knowledge_pic`
--
ALTER TABLE `tms_knowledge_pic`
  MODIFY `pic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
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
  MODIFY `lang_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `tms_log_master`
--
ALTER TABLE `tms_log_master`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=302;
--
-- AUTO_INCREMENT for table `tms_mail_format`
--
ALTER TABLE `tms_mail_format`
  MODIFY `mail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tms_master_price`
--
ALTER TABLE `tms_master_price`
  MODIFY `master_price_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `tms_new_job`
--
ALTER TABLE `tms_new_job`
  MODIFY `new_job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tms_order`
--
ALTER TABLE `tms_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;
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
  MODIFY `pr_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tms_proj_language`
--
ALTER TABLE `tms_proj_language`
  MODIFY `pl_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tms_property`
--
ALTER TABLE `tms_property`
  MODIFY `property_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tms_property_values`
--
ALTER TABLE `tms_property_values`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tms_report_image`
--
ALTER TABLE `tms_report_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tms_resource_assets`
--
ALTER TABLE `tms_resource_assets`
  MODIFY `resourceId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tms_rounding`
--
ALTER TABLE `tms_rounding`
  MODIFY `rounding_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tms_service`
--
ALTER TABLE `tms_service`
  MODIFY `sId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tms_summmery_view`
--
ALTER TABLE `tms_summmery_view`
  MODIFY `job_summmeryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;
--
-- AUTO_INCREMENT for table `tms_summmery_view_sorting`
--
ALTER TABLE `tms_summmery_view_sorting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
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
  MODIFY `tax_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
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
  MODIFY `iUserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `tms_user_contact`
--
ALTER TABLE `tms_user_contact`
  MODIFY `iContactId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tms_user_position`
--
ALTER TABLE `tms_user_position`
  MODIFY `position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `tms_user_property`
--
ALTER TABLE `tms_user_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tms_user_status`
--
ALTER TABLE `tms_user_status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
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
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
