-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 05, 2022 at 09:16 AM
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
-- Table structure for table `tms_specialization`
--

CREATE TABLE `tms_specialization` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(2) NOT NULL DEFAULT '1',
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_specialization`
--

INSERT INTO `tms_specialization` (`id`, `name`, `is_active`, `created_date`, `updated_date`) VALUES
(1, 'Finance', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(2, 'Finance - Accounting', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(3, 'Finance - Insurance', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(4, 'General', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(5, 'General - Advertising', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(6, 'General - Agriculture', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(7, 'General - Arts and Culture', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(8, 'General - Beauty, Fashion, Cosmetics', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(9, 'General - Business', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(10, 'General - Casino & Poker', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(11, 'General - Cinema, Film, TV, Drama', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(12, 'General - Entertainment', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(13, 'General - Environment', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(14, 'General - European Union (EU)', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(15, 'General - Food and Beverages', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(16, 'General - Games and Toys', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(17, 'General - Health & Nutrition', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(18, 'General - History', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(19, 'General - Human Resources (HR)', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(20, 'General - Human Sciences', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(21, 'General - Interior Design', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(22, 'General - Internet and E-commerce', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(23, 'General - Journalism', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(24, 'General - Literature', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(25, 'General - Market Research', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(26, 'General - Marketing', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(27, 'General - Media', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(28, 'General - Music', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(29, 'General - Online Betting', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(30, 'General - Photography', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(31, 'General - Politics', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(32, 'General - Public Relations (PR)', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(33, 'General - Sports', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(34, 'General - Telecommunications', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(35, 'General - Tourism and Travel', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(36, 'General - Video Games', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(37, 'IT', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(38, 'IT - Hardware', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(39, 'IT - Software', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(40, 'IT - Software (UI)', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(41, 'Legal', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(42, 'Legal - Contracts', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(43, 'Legal - Terms and Conditions', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(44, 'Medical', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(45, 'Medical - IFU', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(46, 'Medical - Biochemistry', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(47, 'Medical - Chemistry', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(48, 'Medical - Clinical Trials', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(49, 'Medical - Consent Forms', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(50, 'Medical - Dentistry', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(51, 'Medical - General', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(52, 'Medical - Health Care', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(53, 'Medical - Instruments', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(54, 'Medical - Life Science', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(55, 'Medical - Molecular Biology', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(56, 'Medical - Patents', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(57, 'Medical - Patient Questionnaires', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(58, 'Medical - Patient-facing Material', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(59, 'Medical - Pharmaceuticals', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(60, 'Medical - Psychology', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(61, 'Medical - Science', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(62, 'Social Sciences - Ecology', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(63, 'Social Sciences - Philosophy', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(64, 'Social Sciences - Psychology', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(65, 'Social Sciences - Religion', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(66, 'Technical', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(67, 'Technical - Automotive', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(68, 'Technical - Chemistry', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(69, 'Technical - Construction', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(70, 'Technical - Electrical', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(71, 'Technical - Electronics', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(72, 'Technical - Engineering', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(73, 'Technical - General', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(74, 'Technical - Industry', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(75, 'Technical - Manuals for household appliances', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(76, 'Technical - Mathematical', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(77, 'Technical - Mechanical', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(78, 'Technical - Oil & Gas', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00'),
(79, 'Technical - Patents', 1, '2022-05-04 07:53:00', '2022-05-04 07:53:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tms_specialization`
--
ALTER TABLE `tms_specialization`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
