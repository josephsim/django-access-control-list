-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2020 at 08:58 AM
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
(1, 1, 'josephsim', '[]', '[]', '[\'byPass\']', '[]', '[]', '[]', '[]'),
(2, 2, 'chooth', '[\'listing\', \'delete\']', '[]', '[]', '[]', '[]', '[\'listing\', \'create\', \'edit\', \'delete\']', '[\'accessLog\']');

-- --------------------------------------------------------

--
-- Table structure for table `aclapp_userdetail`
--

CREATE TABLE `aclapp_userdetail` (
  `id` int(11) NOT NULL,
  `user_id` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `roles` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `email` varchar(200) NOT NULL,
  `section` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `aclapp_userdetail`
--

INSERT INTO `aclapp_userdetail` (`id`, `user_id`, `name`, `roles`, `status`, `email`, `section`) VALUES
(1, 'josephsim', 'Joseph Sim', 'Normal User', 0, 'josephsim@sains.com.my', 'Internal Audit'),
(2, 'chooth', 'Choo TH', 'Admin', 1, 'chooth@sains.com.my', 'Cyber Security & Digital Infrastructure (CSI)');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add user detail', 1, 'add_userdetail'),
(2, 'Can change user detail', 1, 'change_userdetail'),
(3, 'Can delete user detail', 1, 'delete_userdetail'),
(4, 'Can view user detail', 1, 'view_userdetail'),
(5, 'Can add access control', 2, 'add_accesscontrol'),
(6, 'Can change access control', 2, 'change_accesscontrol'),
(7, 'Can delete access control', 2, 'delete_accesscontrol'),
(8, 'Can view access control', 2, 'view_accesscontrol'),
(9, 'Can add log entry', 3, 'add_logentry'),
(10, 'Can change log entry', 3, 'change_logentry'),
(11, 'Can delete log entry', 3, 'delete_logentry'),
(12, 'Can view log entry', 3, 'view_logentry'),
(13, 'Can add permission', 4, 'add_permission'),
(14, 'Can change permission', 4, 'change_permission'),
(15, 'Can delete permission', 4, 'delete_permission'),
(16, 'Can view permission', 4, 'view_permission'),
(17, 'Can add group', 5, 'add_group'),
(18, 'Can change group', 5, 'change_group'),
(19, 'Can delete group', 5, 'delete_group'),
(20, 'Can view group', 5, 'view_group'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add content type', 7, 'add_contenttype'),
(26, 'Can change content type', 7, 'change_contenttype'),
(27, 'Can delete content type', 7, 'delete_contenttype'),
(28, 'Can view content type', 7, 'view_contenttype'),
(29, 'Can add session', 8, 'add_session'),
(30, 'Can change session', 8, 'change_session'),
(31, 'Can delete session', 8, 'delete_session'),
(32, 'Can view session', 8, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(2, 'aclapp', 'accesscontrol'),
(1, 'aclapp', 'userdetail'),
(3, 'admin', 'logentry'),
(5, 'auth', 'group'),
(4, 'auth', 'permission'),
(6, 'auth', 'user'),
(7, 'contenttypes', 'contenttype'),
(8, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'aclapp', '0001_initial', '2020-01-09 02:01:43.863120'),
(2, 'contenttypes', '0001_initial', '2020-01-09 02:01:45.183353'),
(3, 'auth', '0001_initial', '2020-01-09 02:01:47.585194'),
(4, 'admin', '0001_initial', '2020-01-09 02:01:57.721656'),
(5, 'admin', '0002_logentry_remove_auto_add', '2020-01-09 02:02:00.102990'),
(6, 'admin', '0003_logentry_add_action_flag_choices', '2020-01-09 02:02:00.205556'),
(7, 'contenttypes', '0002_remove_content_type_name', '2020-01-09 02:02:01.046636'),
(8, 'auth', '0002_alter_permission_name_max_length', '2020-01-09 02:02:02.076334'),
(9, 'auth', '0003_alter_user_email_max_length', '2020-01-09 02:02:02.197333'),
(10, 'auth', '0004_alter_user_username_opts', '2020-01-09 02:02:02.246366'),
(11, 'auth', '0005_alter_user_last_login_null', '2020-01-09 02:02:03.117029'),
(12, 'auth', '0006_require_contenttypes_0002', '2020-01-09 02:02:03.161032'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2020-01-09 02:02:03.201034'),
(14, 'auth', '0008_alter_user_username_max_length', '2020-01-09 02:02:03.366875'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2020-01-09 02:02:03.485020'),
(16, 'auth', '0010_alter_group_name_max_length', '2020-01-09 02:02:03.661764'),
(17, 'auth', '0011_update_proxy_permissions', '2020-01-09 02:02:03.761209'),
(18, 'sessions', '0001_initial', '2020-01-09 02:02:04.440658'),
(19, 'aclapp', '0002_accesscontrol_uname', '2020-01-09 02:07:45.912130'),
(20, 'aclapp', '0003_auto_20200109_1014', '2020-01-09 02:14:16.953527'),
(21, 'aclapp', '0004_auto_20200109_1016', '2020-01-09 02:16:27.963074'),
(22, 'aclapp', '0005_auto_20200109_1018', '2020-01-09 02:18:41.748986'),
(23, 'aclapp', '0006_auto_20200109_1023', '2020-01-09 02:23:19.875815'),
(24, 'aclapp', '0007_auto_20200109_1032', '2020-01-09 02:32:13.963317'),
(25, 'aclapp', '0008_auto_20200109_1039', '2020-01-09 02:39:31.552088');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Indexes for table `aclapp_userdetail`
--
ALTER TABLE `aclapp_userdetail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aclapp_accesscontrol`
--
ALTER TABLE `aclapp_accesscontrol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `aclapp_userdetail`
--
ALTER TABLE `aclapp_userdetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aclapp_accesscontrol`
--
ALTER TABLE `aclapp_accesscontrol`
  ADD CONSTRAINT `aclapp_accesscontrol_uid_index_id_e09c3916_fk_aclapp_us` FOREIGN KEY (`uid_index_id`) REFERENCES `aclapp_userdetail` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
