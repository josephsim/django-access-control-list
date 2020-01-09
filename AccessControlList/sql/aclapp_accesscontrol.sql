-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2020 at 03:47 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `access_control_list`
--

-- --------------------------------------------------------

--
-- Table structure for table `aclapp_accesscontrol`
--

CREATE TABLE `aclapp_accesscontrol` (
  `id` int(11) NOT NULL,
  `uid_index_id` int(11) NOT NULL,
  `uid_uname` varchar(200) NOT NULL,
  `project_mgmt` longtext DEFAULT NULL,
  `engagement_mgmt` longtext DEFAULT NULL,
  `issue_mgmt` longtext DEFAULT NULL,
  `user_mgmt` longtext DEFAULT NULL,
  `reporting_mgmt` longtext DEFAULT NULL,
  `setting` longtext DEFAULT NULL,
  `audit_log` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `aclapp_accesscontrol`
--

INSERT INTO `aclapp_accesscontrol` (`id`, `uid_index_id`, `uid_uname`, `project_mgmt`, `engagement_mgmt`, `issue_mgmt`, `user_mgmt`, `reporting_mgmt`, `setting`, `audit_log`) VALUES
(1, 1, 'josephsim', '[]', '[]', '[]', '[]', '[]', '[]', '[]'),
(2, 2, 'chooth', '[\'edit\']', '[]', '[]', '[]', '[\'listing\']', '[]', '[\'accessLog\']');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aclapp_accesscontrol`
--
ALTER TABLE `aclapp_accesscontrol`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aclapp_accesscontrol_uid_index_id_e09c3916_fk_aclapp_us` (`uid_index_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aclapp_accesscontrol`
--
ALTER TABLE `aclapp_accesscontrol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aclapp_accesscontrol`
--
ALTER TABLE `aclapp_accesscontrol`
  ADD CONSTRAINT `aclapp_accesscontrol_uid_index_id_e09c3916_fk_aclapp_us` FOREIGN KEY (`uid_index_id`) REFERENCES `aclapp_userdetail` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
