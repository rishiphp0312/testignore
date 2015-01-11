-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 26, 2012 at 08:27 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pegasa`
--

-- --------------------------------------------------------

--
-- Table structure for table `p_admin`
--

CREATE TABLE IF NOT EXISTS `p_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` enum('Super Admin','Admin','Sme','Data Entry') NOT NULL DEFAULT 'Data Entry',
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(60) NOT NULL,
  `last_login` datetime NOT NULL,
  `last_login_ip` varchar(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `p_admin`
--

INSERT INTO `p_admin` (`id`, `username`, `password`, `user_type`, `first_name`, `last_name`, `email`, `last_login`, `last_login_ip`, `created_on`, `updated_on`, `status`) VALUES
(1, 'Raveesh', '21', 'Super Admin', 'Raveesh', 'Sachan', 'raveesh.sachan@transwill.in', '2012-09-20 00:00:00', '', '2012-11-20 07:48:50', '2012-11-20 07:48:50', 1),
(2, 'Rishi', 'Rishi28', 'Super Admin', 'Rishi', 'Kapoor', 'Rishi.kapoor@transwill.in', '2012-09-27 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(3, 'Ankit', 'dd', 'Admin', 'Ankit', 'pandey', 'ankitpandey09@gmail.com', '2012-09-26 00:00:00', '', '2012-11-09 07:57:05', '2012-11-09 07:57:05', 1),
(6, 'Transwill', 'aaa', 'Super Admin', 'Transwill', 'Transwill', 'Transwill@', '0000-00-00 00:00:00', '', '2012-11-09 07:40:05', '2012-11-09 07:40:05', 1),
(7, 'sir12', '1212', 'Super Admin', 'sir', 'sir012', 'sir12', '0000-00-00 00:00:00', '', '2012-11-19 06:34:31', '2012-11-19 06:34:31', 1),
(9, 'help', '', 'Super Admin', 'help', 'help', 'help', '0000-00-00 00:00:00', '', '2012-11-22 12:52:08', '2012-11-22 12:52:08', 1),
(10, 'nmims', '', 'Super Admin', 'nmims', 'nmims', 'nmims', '0000-00-00 00:00:00', '', '2012-11-23 07:27:45', '2012-11-23 07:27:45', 1);

-- --------------------------------------------------------

--
-- Table structure for table `p_default_bonusmarks`
--

CREATE TABLE IF NOT EXISTS `p_default_bonusmarks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `difficulty_level` int(11) NOT NULL,
  `marks` int(11) NOT NULL,
  `percentagebonus` int(11) NOT NULL,
  `timeinsec` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `p_default_bonusmarks`
--

INSERT INTO `p_default_bonusmarks` (`id`, `difficulty_level`, `marks`, `percentagebonus`, `timeinsec`) VALUES
(1, 1, 1, 50, 20),
(2, 2, 2, 50, 30),
(3, 3, 3, 50, 40),
(4, 4, 4, 50, 50),
(5, 5, 5, 50, 60),
(6, 6, 6, 50, 70),
(7, 8, 8, 50, 90),
(8, 9, 9, 50, 100),
(9, 10, 10, 50, 110),
(10, 11, 11, 50, 120),
(11, 12, 12, 50, 130),
(12, 13, 13, 50, 140),
(13, 14, 14, 50, 150),
(14, 15, 15, 50, 160),
(15, 7, 7, 50, 80);

-- --------------------------------------------------------

--
-- Table structure for table `p_question_master`
--

CREATE TABLE IF NOT EXISTS `p_question_master` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `question` longtext NOT NULL,
  `option_1` text,
  `option_2` text,
  `option_3` text,
  `option_4` text,
  `question_type` enum('objective','subjective') NOT NULL DEFAULT 'objective' COMMENT 'objective => multiple choice',
  `class_standard` tinyint(2) NOT NULL COMMENT '9 or 10',
  `correct_answer` varchar(20) NOT NULL COMMENT 'One of the option will be true (A,B,C or D)',
  `explanatory_answer` longtext NOT NULL,
  `difficulty_level` int(1) NOT NULL DEFAULT '1' COMMENT '1 to 10',
  `source` varchar(255) NOT NULL COMMENT 'the source/book from where the question has taken',
  `additional_information` varchar(256) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL,
  `created_by` int(11) NOT NULL COMMENT 'created by user id',
  `updated_by` int(11) NOT NULL COMMENT 'updated by user id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1135 ;

--
-- Dumping data for table `p_question_master`
--

INSERT INTO `p_question_master` (`id`, `subject_id`, `topic_id`, `question`, `option_1`, `option_2`, `option_3`, `option_4`, `question_type`, `class_standard`, `correct_answer`, `explanatory_answer`, `difficulty_level`, `source`, `additional_information`, `created_on`, `updated_on`, `is_active`, `is_deleted`, `created_by`, `updated_by`) VALUES
(1131, 1, 1, '<p><img align="middle" class="Wirisformula" data-mathml="&laquo;math xmlns=&uml;http://www.w3.org/1998/Math/MathML&uml;&raquo;&laquo;msqrt&raquo;&laquo;mn&raquo;233&laquo;/mn&raquo;&laquo;mfrac&raquo;&laquo;mn&raquo;3&laquo;/mn&raquo;&laquo;msup&raquo;&laquo;mn&raquo;33&laquo;/mn&raquo;&laquo;mrow&raquo;&laquo;mn&raquo;33&laquo;/mn&raquo;&laquo;mfenced&raquo;&laquo;mn&raquo;333&laquo;/mn&raquo;&laquo;/mfenced&raquo;&laquo;/mrow&raquo;&laquo;/msup&raquo;&laquo;/mfrac&raquo;&laquo;/msqrt&raquo;&laquo;/math&raquo;" src="/pegasa_new/public/js/fckeditor/editor/plugins/fckeditor_wiris/integration/showimage.php?formula=0cc5602ca827189a58f0b702e716eabc.png" alt="" />&nbsp;</p>', '<p>&nbsp;<img align="middle" class="Wirisformula" data-mathml="&laquo;math xmlns=&uml;http://www.w3.org/1998/Math/MathML&uml;&raquo;&laquo;mfrac bevelled=&uml;true&uml;&raquo;&laquo;mn&raquo;3&laquo;/mn&raquo;&laquo;mn&raquo;3&laquo;/mn&raquo;&laquo;/mfrac&raquo;&laquo;/math&raquo;" src="/pegasa_new/public/js/fckeditor/editor/plugins/fckeditor_wiris/integration/showimage.php?formula=736f37ec59e3327bd5a17f8276f63f49.png" alt="" /></p>', '<p>&nbsp;<img align="middle" class="Wirisformula" data-mathml="&laquo;math xmlns=&uml;http://www.w3.org/1998/Math/MathML&uml;&raquo;&laquo;mfrac bevelled=&uml;true&uml;&raquo;&laquo;mn&raquo;44&laquo;/mn&raquo;&laquo;mn&raquo;44&laquo;/mn&raquo;&laquo;/mfrac&raquo;&laquo;mn&raquo;44&laquo;/mn&raquo;&laquo;/math&raquo;" src="/pegasa_new/public/js/fckeditor/editor/plugins/fckeditor_wiris/integration/showimage.php?formula=3370bdc437a2596a9400af7136f0a6d4.png" alt="" /></p>', '<p>&nbsp;44</p>', '<p>&nbsp;44</p>', 'subjective', 10, 'option_2', '<p>&nbsp;44</p>', 2, 'Ncrt', 'IIT 2008', '2012-11-21 13:31:34', '2012-11-21 13:31:34', 0, 0, 0, 0),
(1132, 1, 1, '<p><img align="middle" class="Wirisformula" data-mathml="&laquo;math xmlns=&uml;http://www.w3.org/1998/Math/MathML&uml;&raquo;&laquo;mi&raquo;d&laquo;/mi&raquo;&laquo;mi&raquo;d&laquo;/mi&raquo;&laquo;msqrt&raquo;&laquo;mi&raquo;d&laquo;/mi&raquo;&laquo;mi&raquo;d&laquo;/mi&raquo;&laquo;/msqrt&raquo;&laquo;/math&raquo;" src="/pegasa_new/public/js/fckeditor/editor/plugins/fckeditor_wiris/integration/showimage.php?formula=127ad20ee501dd9559b8c042af9d819d.png" alt="" />&nbsp;</p>', '<p>&nbsp;d</p>', '<p>&nbsp;d</p>', '<p>&nbsp;d</p>', '<p>&nbsp;d</p>', 'subjective', 9, 'option_1', '<p>&nbsp;d</p>', 3, 'iit', 'y', '2012-11-23 06:14:52', '2012-11-23 06:14:52', 0, 0, 0, 0),
(1133, 1, 1, '<p>&nbsp;d</p>', '<p>&nbsp;d</p>', '<p>&nbsp;d</p>', '<p>&nbsp;d</p>', '<p>&nbsp;d</p>', 'subjective', 0, 'option_1', '<p>&nbsp;d</p>', 1, 'dd', 'dd', '2012-11-23 06:21:28', '2012-11-23 06:21:28', 0, 0, 0, 0),
(1134, 1, 3, '<p>&nbsp;dd</p>', '<p>&nbsp;dd</p>', '<p>&nbsp;dd</p>', '<p>&nbsp;dd</p>', '<p>&nbsp;dd</p>', 'subjective', 0, 'option_1', '<p>&nbsp;dd</p>', 1, 'dd', 'dd', '2012-11-23 06:50:54', '2012-11-23 06:50:54', 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `p_subject_master`
--

CREATE TABLE IF NOT EXISTS `p_subject_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_title` varchar(255) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `p_subject_master`
--

INSERT INTO `p_subject_master` (`id`, `subject_title`, `created_on`, `updated_on`, `is_active`) VALUES
(1, 'Mathmatics', '2012-08-22 00:00:00', '2012-08-22 07:23:11', 1),
(2, 'Physics', '2012-08-22 00:00:00', '2012-08-22 07:23:11', 1);

-- --------------------------------------------------------

--
-- Table structure for table `p_topic_master`
--

CREATE TABLE IF NOT EXISTS `p_topic_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `topic` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `p_topic_master`
--

INSERT INTO `p_topic_master` (`id`, `subject_id`, `parent_id`, `topic`, `description`, `created_on`, `updated_on`, `is_active`) VALUES
(1, 1, 0, 'Number System', 'hjkehrj erhjhr ejkh kjerh hjerh erjkh kejrhj herjh jehrkh erh her', '2012-08-05 00:00:00', '2012-09-10 11:49:26', 1),
(3, 1, 0, 'Polynomials', 'polynomial questions', '2012-09-10 11:52:08', '2012-09-11 11:38:50', 1),
(4, 1, 0, 'Real Numbers', 'Real Numbers', '2012-09-10 11:54:28', '2012-09-11 11:39:22', 1),
(5, 1, 0, 'Triangles', 'Triangles', '2012-09-10 11:54:48', '2012-09-13 10:22:22', 1),
(6, 1, 0, 'Pair of linear equations in two variables', '', '2012-09-17 18:27:25', '2012-09-18 12:35:29', 1),
(7, 1, 0, 'Quadratic equations', '', '2012-09-18 18:09:33', '2012-09-18 18:09:33', 1),
(8, 1, 0, 'Arithmetic Progressions', '', '2012-09-21 17:07:25', '2012-09-21 17:07:25', 1),
(9, 1, 0, 'Coordinate Geometry', '', '2012-09-28 11:10:48', '2012-09-28 11:10:48', 1),
(10, 1, 0, 'Linear Equations in two variables', '', '2012-09-29 09:54:58', '2012-09-29 09:54:58', 1),
(11, 1, 0, 'Lines and Angles', '', '2012-09-29 10:10:24', '2012-09-29 10:10:24', 1),
(12, 1, 0, 'Probability', '', '2012-09-29 13:01:39', '2012-10-01 09:57:38', 1);

-- --------------------------------------------------------

--
-- Table structure for table `p_users`
--

CREATE TABLE IF NOT EXISTS `p_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `dob` varchar(255) NOT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `occupation` varchar(255) NOT NULL,
  `occupation_value` varchar(255) NOT NULL,
  `testCleared` varchar(255) NOT NULL COMMENT 'null not passed any if practice means practice cleared if level1 that means level1 cleared',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `p_users`
--

INSERT INTO `p_users` (`id`, `username`, `email`, `password`, `firstname`, `lastname`, `dob`, `phone`, `occupation`, `occupation_value`, `testCleared`, `status`, `created`) VALUES
(1, 'john123', 'test1@mail.com', '1a1dc91c907325c69271ddf0c944bc72', 'john ', ' nw', '13-09-1981', NULL, 'student', 'class10', '', 1, '0000-00-00 00:00:00'),
(2, 'rishi123', 'test2@mail.com', '1a1dc91c907325c69271ddf0c944bc72', 'john ', ' raj ', '13-09-1981', NULL, 'student', 'class9', '', 1, '0000-00-00 00:00:00'),
(3, 'ankit', 'test3@mail.com', '1a1dc91c907325c69271ddf0c944bc72', 'ankit', 'pandey', '0-0-0', NULL, '0', '', '', 1, '2012-09-24 13:15:05'),
(4, 'ankit', 'test4@mail.com', '1a1dc91c907325c69271ddf0c944bc72', '', '', '0-0-0', NULL, '0', '', '', 1, '2012-09-24 13:15:06'),
(5, 'ankit', 'test5@mail.com', '1a1dc91c907325c69271ddf0c944bc72', '', '', '0-0-0', NULL, '0', '', '', 1, '2012-09-24 13:15:07'),
(13, 'ankitpandey28', 'ankitpandey09@gmail.com', '1a1dc91c907325c69271ddf0c944bc72', 'Ankit', 'Pandey', '--', NULL, '', '', '', 1, '2012-09-28 15:52:36'),
(14, 'praveen.kapoor2', 'praveen.kapoor1@gmail.com', '1a1dc91c907325c69271ddf0c944bc72', 'Praveen', 'Kapoor', '--', NULL, '', '', '', 1, '2012-09-28 15:57:03'),
(23, 'rishihero', 'loverboyrk@gmail.com', '1a1dc91c907325c69271ddf0c944bc72', 'Rishi', 'Kapoor', '14-01-1981', NULL, '', '', '', 1, '2012-10-01 12:37:21'),
(24, 'DD', 'DD', 'DD', 'DD', 'DD', '', NULL, 'Super Admin', '', '', 0, '0000-00-00 00:00:00'),
(26, 'DDDDANKI', 'DDANKI', 'ANKI', 'ANKI', 'ANKIANKI', '', NULL, 'Super Admin', '', '', 0, '0000-00-00 00:00:00'),
(27, 'test', 'test', 'test', 'test', 'test', '', NULL, 'Super Admin', '', '', 0, '0000-00-00 00:00:00'),
(29, 'sita', 'sita', 'sita', 'sita', 'sita', '', NULL, 'Super Admin', '', '', 0, '0000-00-00 00:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
