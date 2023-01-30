-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 30, 2023 at 07:21 AM
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tms_job_status`
--
ALTER TABLE `tms_job_status`
  ADD PRIMARY KEY (`jb_status_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tms_job_status`
--
ALTER TABLE `tms_job_status`
  MODIFY `jb_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
