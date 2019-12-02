-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th9 04, 2019 lúc 10:24 PM
-- Phiên bản máy phục vụ: 5.7.27-0ubuntu0.18.04.1
-- Phiên bản PHP: 7.2.19-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `appchat`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chat_message`
--

CREATE TABLE `chat_message` (
  `chat_message_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `chat_message` text COLLATE utf8_unicode_ci NOT NULL,
  `timestamp_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status_` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chat_message`
--

INSERT INTO `chat_message` (`chat_message_id`, `to_user_id`, `from_user_id`, `chat_message`, `timestamp_`, `status_`) VALUES
(212, 2, 1, 'a', '2019-09-04 14:52:58', 1),
(213, 2, 1, '\n', '2019-09-04 14:53:03', 1),
(214, 2, 1, 'a', '2019-09-04 14:53:57', 1),
(215, 2, 1, 'thoi e khong biet dau', '2019-09-04 14:54:02', 1),
(216, 1, 2, 'gi the o oi', '2019-09-04 15:05:49', 1),
(217, 1, 2, 'a oi', '2019-09-04 15:07:31', 1),
(218, 1, 2, 'a oi                ', '2019-09-04 15:07:42', 1),
(219, 1, 2, '                           a oi', '2019-09-04 15:07:49', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `login`
--

CREATE TABLE `login` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `profile` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `login`
--

INSERT INTO `login` (`user_id`, `username`, `password`, `profile`) VALUES
(1, 'tungduong', '5bfc4acc26ee1cf7a1cbcd74a0a70426', 'duong.jpg'),
(2, 'thuyhuong', '202cb962ac59075b964b07152d234b70', 'huong.jpg'),
(3, 'vanduong', '202cb962ac59075b964b07152d234b70', NULL),
(4, 'baduong', '202cb962ac59075b964b07152d234b70', NULL),
(5, 'dungmanh', '202cb962ac59075b964b07152d234b70', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `login_details`
--

CREATE TABLE `login_details` (
  `login_details_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `last_activity` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_type` enum('no','yes') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `login_details`
--

INSERT INTO `login_details` (`login_details_id`, `user_id`, `last_activity`, `is_type`) VALUES
(2, 1, '2019-08-29 09:38:20', 'no'),
(3, 1, '2019-08-29 10:29:22', 'no'),
(4, 1, '2019-08-29 11:04:46', 'no'),
(5, 2, '2019-08-29 11:05:01', 'no'),
(6, 1, '2019-08-30 02:41:01', 'no'),
(7, 1, '2019-08-30 03:46:50', 'no'),
(8, 1, '2019-08-30 03:48:03', 'no'),
(9, 1, '2019-08-30 03:50:00', 'no'),
(10, 1, '2019-08-30 04:06:47', 'no'),
(11, 2, '2019-08-30 04:09:48', 'no'),
(12, 2, '2019-08-30 04:21:27', 'no'),
(13, 2, '2019-08-30 04:53:07', 'no'),
(14, 1, '2019-08-30 12:42:49', 'no'),
(15, 2, '2019-08-30 12:43:17', 'no'),
(16, 1, '2019-08-30 13:40:48', 'no'),
(17, 1, '2019-08-30 18:04:53', 'no'),
(18, 2, '2019-08-30 13:50:42', 'no'),
(19, 2, '2019-08-30 13:52:10', 'no'),
(20, 2, '2019-08-30 17:43:18', 'no'),
(21, 5, '2019-08-30 18:05:02', 'no'),
(22, 1, '2019-08-31 09:12:54', 'no'),
(23, 2, '2019-08-31 09:12:56', 'no'),
(24, 1, '2019-09-01 07:44:12', 'no'),
(25, 2, '2019-09-01 08:14:29', 'no'),
(26, 1, '2019-09-01 08:42:26', 'no'),
(27, 3, '2019-09-01 10:37:23', 'no'),
(28, 1, '2019-09-01 11:29:39', 'no'),
(29, 2, '2019-09-01 11:30:06', 'no'),
(30, 2, '2019-09-01 11:31:35', 'no'),
(31, 1, '2019-09-01 16:24:38', 'no'),
(32, 2, '2019-09-01 15:16:05', 'no'),
(33, 2, '2019-09-01 15:33:32', 'no'),
(34, 3, '2019-09-01 15:42:17', 'no'),
(35, 2, '2019-09-01 16:21:59', 'no'),
(36, 3, '2019-09-01 16:22:34', 'no'),
(37, 4, '2019-09-01 16:22:48', 'no'),
(38, 5, '2019-09-01 16:24:45', 'no'),
(39, 1, '2019-09-02 17:03:13', 'no'),
(40, 1, '2019-09-03 01:59:01', 'no'),
(41, 2, '2019-09-03 01:57:41', 'no'),
(42, 1, '2019-09-03 08:13:38', 'no'),
(43, 5, '2019-09-03 08:14:41', 'no'),
(44, 1, '2019-09-03 16:21:14', 'no'),
(45, 2, '2019-09-03 16:22:54', 'no'),
(46, 1, '2019-09-03 16:23:17', 'no'),
(47, 1, '2019-09-04 11:30:56', 'no'),
(48, 2, '2019-09-04 11:39:56', 'no'),
(49, 2, '2019-09-04 13:54:12', 'no'),
(50, 1, '2019-09-04 11:40:20', 'no'),
(51, 1, '2019-09-04 15:24:56', 'no'),
(52, 2, '2019-09-04 15:24:56', 'no');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chat_message`
--
ALTER TABLE `chat_message`
  ADD PRIMARY KEY (`chat_message_id`);

--
-- Chỉ mục cho bảng `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`user_id`);

--
-- Chỉ mục cho bảng `login_details`
--
ALTER TABLE `login_details`
  ADD PRIMARY KEY (`login_details_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `chat_message`
--
ALTER TABLE `chat_message`
  MODIFY `chat_message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;
--
-- AUTO_INCREMENT cho bảng `login`
--
ALTER TABLE `login`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT cho bảng `login_details`
--
ALTER TABLE `login_details`
  MODIFY `login_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
