-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 14, 2019 at 06:11 PM
-- Server version: 5.7.27-0ubuntu0.18.04.1
-- PHP Version: 7.2.19-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `appchat`
--

-- --------------------------------------------------------

--
-- Table structure for table `chat_message`
--

CREATE TABLE `chat_message` (
  `chat_message_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `chat_message` mediumtext COLLATE utf8mb4_bin NOT NULL,
  `timestamp_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status_` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `chat_message`
--

INSERT INTO `chat_message` (`chat_message_id`, `to_user_id`, `from_user_id`, `chat_message`, `timestamp_`, `status_`) VALUES
(212, 2, 1, 'a', '2019-09-04 14:52:58', 1),
(213, 2, 1, '\n', '2019-09-04 14:53:03', 1),
(214, 2, 1, 'a', '2019-09-04 14:53:57', 1),
(215, 2, 1, 'thoi e khong biet dau', '2019-09-04 14:54:02', 1),
(216, 1, 2, 'gi the o oi', '2019-09-04 15:05:49', 1),
(217, 1, 2, 'a oi', '2019-09-04 15:07:31', 1),
(218, 1, 2, 'a oi                ', '2019-09-04 15:07:42', 1),
(219, 1, 2, '                           a oi', '2019-09-04 15:07:49', 1),
(220, 1, 2, 'hello', '2019-09-05 02:39:15', 1),
(221, 2, 1, 'hello baby😅😅', '2019-09-05 16:20:27', 1),
(222, 2, 1, 'hello baby 😅😅\n\n', '2019-09-05 16:21:01', 1),
(223, 2, 1, '😜', '2019-09-05 16:22:42', 1),
(224, 1, 2, '', '2019-09-05 16:23:57', 1),
(225, 1, 2, 'a', '2019-09-05 16:25:00', 1),
(226, 1, 2, '', '2019-09-05 16:25:08', 1),
(227, 2, 1, 'nhà bao việc😂😂', '2019-09-05 16:34:42', 1),
(228, 2, 1, 'thoi di ong oi\n', '2019-09-05 17:05:54', 1);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `profile` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`user_id`, `username`, `password`, `profile`) VALUES
(1, 'tungduong', '5bfc4acc26ee1cf7a1cbcd74a0a70426', 'duong.jpg'),
(2, 'thuyhuong', '202cb962ac59075b964b07152d234b70', 'huong.jpg'),
(3, 'vanduong', '202cb962ac59075b964b07152d234b70', NULL),
(4, 'baduong', '202cb962ac59075b964b07152d234b70', NULL),
(5, 'dungmanh', '202cb962ac59075b964b07152d234b70', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `login_details`
--

CREATE TABLE `login_details` (
  `login_details_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `last_activity` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_type` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `login_details`
--

INSERT INTO `login_details` (`login_details_id`, `user_id`, `last_activity`, `is_type`) VALUES
(56, 2, '2019-09-05 03:13:49', 1),
(57, 1, '2019-09-05 03:13:20', 0),
(58, 2, '2019-09-05 03:18:03', 0),
(59, 1, '2019-09-05 03:15:14', 0),
(60, 2, '2019-09-05 03:23:14', 0),
(61, 2, '2019-09-05 03:25:55', 0),
(62, 2, '2019-09-05 03:26:38', 0),
(63, 2, '2019-09-05 03:26:41', 0),
(64, 2, '2019-09-05 03:27:10', 0),
(65, 2, '2019-09-05 03:28:35', 0),
(66, 2, '2019-09-05 03:28:42', 0),
(67, 2, '2019-09-05 03:40:32', 0),
(68, 2, '2019-09-05 03:54:02', 0),
(69, 2, '2019-09-05 03:58:14', 0),
(70, 2, '2019-09-05 04:03:16', 0),
(71, 2, '2019-09-05 04:05:04', 0),
(72, 2, '2019-09-05 04:07:50', 0),
(73, 2, '2019-09-05 04:09:57', 0),
(74, 2, '2019-09-05 04:10:09', 0),
(75, 2, '2019-09-05 04:13:17', 0),
(76, 2, '2019-09-05 04:14:52', 0),
(77, 2, '2019-09-05 04:15:46', 0),
(78, 2, '2019-09-05 04:18:37', 0),
(79, 2, '2019-09-05 04:19:18', 0),
(80, 2, '2019-09-05 04:20:44', 0),
(81, 1, '2019-09-05 15:37:55', 0),
(82, 2, '2019-09-05 15:37:54', 0),
(83, 1, '2019-09-05 16:41:30', 1),
(84, 2, '2019-09-05 17:05:09', 0),
(85, 2, '2019-09-05 17:06:24', 0),
(86, 1, '2019-09-05 17:06:20', 0),
(87, 1, '2019-10-04 03:14:37', 0),
(88, 1, '2019-10-04 04:38:55', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chat_message`
--
ALTER TABLE `chat_message`
  ADD PRIMARY KEY (`chat_message_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `login_details`
--
ALTER TABLE `login_details`
  ADD PRIMARY KEY (`login_details_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chat_message`
--
ALTER TABLE `chat_message`
  MODIFY `chat_message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=229;
--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `login_details`
--
ALTER TABLE `login_details`
  MODIFY `login_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
