-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 26, 2024 at 08:44 AM
-- Server version: 10.6.17-MariaDB-cll-lve
-- PHP Version: 8.1.27

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
  `invoiceNoPrefix` varchar(200) NOT NULL,
  `server_no` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=spellUp, 2=Beconnected, 3=Dosina',
  `invoice_design` tinyint(1) NOT NULL DEFAULT 2,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `dtCreatedDate` datetime DEFAULT NULL,
  `dtUpdatedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tms_invoice_setting`
--

INSERT INTO `tms_invoice_setting` (`id`, `branch_center_id`, `company_short_code`, `company_name`, `address1`, `address2`, `city`, `country`, `postcode`, `vat_number`, `work_email`, `invoice_receive_email`, `web_address`, `copyright_text`, `logo_url`, `description`, `invoiceNoPrefix`, `server_no`, `invoice_design`, `is_default`, `dtCreatedDate`, `dtUpdatedDate`) VALUES
(1, '14', 'BN', 'BeConnected AS', 'Sandakerveien 138', '', 'Oslo', 'Norway', '0484', 'NO918883010 MVA', 'info@beconnected.no', 'accounting@beconnected.no', 'www.beconnected.no', 'BeConnected 2011 - 2023. All rights reserved', 'https://tms.beconnected.no/assets/img/invoice_logo.png', '', 'N-', 2, 2, 1, '2023-06-09 11:22:17', '2023-06-09 11:22:17'),
(2, '13', 'BG', 'BeConnected Bulgaria LTD', 'Dobrudzha str. 5, fl. 1, ap. 1', '', 'Sofia', 'Bulgaria', '1000', 'BG202240829', 'info@beconnected.no', 'accounting@beconnected.no', 'www.beconnected.no', 'BeConnected 2011 - 2023. All rights reserved', 'https://tms.beconnected.no/assets/img/invoice_logo.png', '', 'N-', 2, 2, 0, '2023-06-09 11:22:17', '2023-06-09 11:22:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tms_invoice_setting`
--
ALTER TABLE `tms_invoice_setting`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tms_invoice_setting`
--
ALTER TABLE `tms_invoice_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
