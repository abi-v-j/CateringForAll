-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 28, 2024 at 12:26 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `miniproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(60) NOT NULL,
  `admin_email` varchar(60) NOT NULL,
  `admin_password` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(5, 'Ashin', 'ashinjoseph808@gmail.com', '1234567890'),
(8, 'Ashin', 'ashinjoseph6238@gmail.com', '$2y$10$aI0u6Bqe/eTqy7YYV3dnou/dMu9lo8V.lyavb8i6XTkXNYXkvC1VK');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_booking`
--

CREATE TABLE `tbl_booking` (
  `booking_id` int(11) NOT NULL,
  `booking_fordate` varchar(50) NOT NULL,
  `booking_fortime` time NOT NULL,
  `booking_address` varchar(150) NOT NULL,
  `booking_amount` int(11) NOT NULL,
  `packagehead_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `booking_details` varchar(60) NOT NULL,
  `place_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `booking_status` varchar(11) NOT NULL,
  `booking_count` int(11) NOT NULL,
  `booking_service` int(11) NOT NULL,
  `booking_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_booking`
--

INSERT INTO `tbl_booking` (`booking_id`, `booking_fordate`, `booking_fortime`, `booking_address`, `booking_amount`, `packagehead_id`, `user_id`, `booking_details`, `place_id`, `district_id`, `booking_status`, `booking_count`, `booking_service`, `booking_date`) VALUES
(91, '2024-10-25', '20:00:00', 'kolenchery central auditorium', 4000, 10, 13, 'reach by 3 pm ', 32, 7, '1', 100, 1, '0000-00-00'),
(92, '2024-10-25', '04:12:00', 'Nellad St.Marys auditorium ', 0, 68, 22, 'reach by 3 pm ', 35, 7, '1', 100, 1, '0000-00-00'),
(93, '2024-10-25', '04:15:00', 'Nellad St.Marys auditorium ', 0, 72, 22, 'reach by 3 pm ', 35, 7, '1', 100, 1, '0000-00-00'),
(94, '2024-10-25', '04:16:00', 'Nellad St.Marys auditorium ', 0, 72, 22, 'reach by 3 pm ', 35, 7, '3', 100, 1, '2024-10-25'),
(95, '2024-10-25', '04:22:00', 'Nellad St.Marys auditorium ', 0, 11, 22, 'reach by 3 pm ', 38, 7, '', 100, 1, '2024-10-25'),
(96, '2024-10-25', '04:26:00', 'Nellad St.Marys auditorium ', 0, 10, 22, 'reach by 3 pm ', 35, 7, '', 100, 1, '2024-10-25'),
(97, '2024-10-25', '04:32:00', 'Nellad St.Marys auditorium ', 0, 73, 22, 'reach by 3 pm ', 35, 7, '', 100, 1, '2024-10-25'),
(98, '2024-10-29', '13:32:00', 'kolenchery central auditorium', 0, 74, 22, 'reach by 3 pm ', 28, 7, '', 150, 1, '2024-10-28'),
(99, '2024-10-29', '18:30:00', 'kolenchery central auditorium', 34000, 79, 27, 'reach by 3 pm ', 22, 7, '3', 150, 1, '2024-10-28');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`category_id`, `category_name`) VALUES
(1, 'Drinks'),
(2, 'Starters'),
(3, 'Veg-Main'),
(4, 'Non-Main'),
(5, 'Desserts');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_complaint`
--

CREATE TABLE `tbl_complaint` (
  `complaint_id` int(11) NOT NULL,
  `complaint_title` varchar(300) NOT NULL,
  `complaint_content` varchar(300) NOT NULL,
  `complaint_reply` varchar(300) NOT NULL,
  `complaint_date` date DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_complaint`
--

INSERT INTO `tbl_complaint` (`complaint_id`, `complaint_title`, `complaint_content`, `complaint_reply`, `complaint_date`, `user_id`) VALUES
(16, 'not on time ', 'the delivery was late by 30 mins', '', '2024-10-28', 22);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_district`
--

CREATE TABLE `tbl_district` (
  `district_id` int(11) NOT NULL,
  `district_name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_district`
--

INSERT INTO `tbl_district` (`district_id`, `district_name`) VALUES
(7, 'Ernakulam');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_feedback`
--

CREATE TABLE `tbl_feedback` (
  `feedback_id` int(11) NOT NULL,
  `feedback_content` varchar(300) NOT NULL,
  `user_id` int(11) NOT NULL,
  `feedback_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_feedback`
--

INSERT INTO `tbl_feedback` (`feedback_id`, `feedback_content`, `user_id`, `feedback_date`) VALUES
(24, 'I had an excellent experience with the catering service. The food was delicious, and the staff was very professional. They went above and beyond to accommodate our needs. I highly recommend them for any event, and I will definitely use their services again in the future!', 22, '2024-10-25'),
(25, 'I am extremely satisfied with the catering service provided. The food was fresh, delicious, and presented beautifully. The team was punctual, attentive, and ensured everything ran smoothly throughout the event. I appreciate their professionalism and willingness to accommodate our special requests. O', 21, '2024-10-25'),
(29, 'I recently used this catering service for a family event, and I could not be happier with the experience. The food was delicious, fresh, and beautifully presented. The staff was friendly, professional, and attentive to our needs. Everything was handled smoothly, making the event stress-free. I highl', 25, '2024-10-26'),
(30, 'ashin', 22, '2024-10-28'),
(31, 'fsddfsdf\'s\r\n', 22, '2024-10-28'),
(32, 'fsdfsdfs\'s', 22, '2024-10-28');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_food`
--

CREATE TABLE `tbl_food` (
  `food_id` int(11) NOT NULL,
  `food_name` varchar(60) NOT NULL,
  `food_photo` varchar(300) NOT NULL,
  `food_price` varchar(60) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_food`
--

INSERT INTO `tbl_food` (`food_id`, `food_name`, `food_photo`, `food_price`, `category_id`) VALUES
(11, 'pineapple juice', 'Featured-Hero_-Fresh-Pineapple-Juice-Recipe-Without-a-Juicer.jpg', '10', 1),
(12, 'Chilli Chicken', 'download.jpeg', '30', 4),
(13, 'Chicken Biriyani', 'chickenbiriyani.jpeg', '80', 4),
(14, 'Veg Biriyani', 'vegbiriyani.jpg', '60', 3),
(16, 'Beef Fry', 'beeffry.jpeg', '40', 4),
(17, 'Chilli Gobi', 'chilligobi.jpeg', '40', 4),
(18, 'Chicken Lollipop', 'lolipop.jpeg', '40', 2),
(19, 'Chicken Nuggets', 'nuggets.jpeg', '30', 2),
(20, 'Ginger Lime', 'ginger Lime.jpeg', '10', 1),
(23, 'chilli gobi', 'chilligobi.jpeg', '23', 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_packagebody`
--

CREATE TABLE `tbl_packagebody` (
  `packagebody_id` int(11) NOT NULL,
  `food_id` int(11) NOT NULL,
  `packagehead_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_packagebody`
--

INSERT INTO `tbl_packagebody` (`packagebody_id`, `food_id`, `packagehead_id`) VALUES
(39, 14, 9),
(40, 17, 9),
(43, 12, 11),
(44, 14, 11),
(45, 16, 11),
(46, 17, 11),
(48, 19, 26),
(49, 20, 31),
(57, 16, 0),
(58, 12, 0),
(59, 13, 0),
(60, 12, 0),
(61, 13, 50),
(62, 11, 50),
(63, 12, 50),
(64, 17, 50),
(65, 18, 50),
(66, 20, 50),
(67, 12, 51),
(68, 14, 51),
(69, 19, 51),
(70, 13, 52),
(71, 18, 52),
(72, 12, 52),
(73, 13, 52),
(74, 16, 53),
(75, 19, 53),
(76, 19, 53),
(77, 13, 53),
(78, 11, 54),
(79, 14, 54),
(80, 18, 54),
(81, 19, 54),
(82, 11, 56),
(83, 20, 56),
(84, 19, 56),
(85, 21, 56),
(86, 22, 56),
(87, 11, 57),
(89, 21, 57),
(90, 11, 58),
(91, 20, 58),
(92, 21, 58),
(93, 12, 59),
(94, 14, 59),
(95, 21, 59),
(96, 20, 60),
(97, 21, 60),
(98, 20, 60),
(99, 20, 61),
(100, 21, 61),
(101, 22, 61),
(104, 22, 61),
(106, 11, 62),
(107, 11, 62),
(108, 12, 62),
(109, 11, 62),
(110, 14, 62),
(111, 11, 61),
(112, 11, 63),
(113, 16, 63),
(114, 18, 63),
(116, 11, 64),
(117, 12, 64),
(118, 13, 64),
(119, 14, 64),
(120, 14, 64),
(121, 12, 65),
(122, 14, 65),
(123, 19, 65),
(124, 17, 65),
(125, 11, 0),
(126, 11, 0),
(127, 11, 10),
(128, 12, 10),
(131, 13, 66),
(132, 11, 66),
(134, 16, 66),
(135, 12, 66),
(136, 12, 66),
(137, 12, 66),
(138, 12, 66),
(139, 11, 66),
(140, 11, 66),
(141, 11, 66),
(142, 16, 66),
(143, 16, 66),
(144, 12, 66),
(145, 12, 66),
(146, 12, 66),
(147, 12, 66),
(149, 19, 66),
(150, 11, 66),
(151, 11, 66),
(152, 12, 67),
(153, 12, 68),
(154, 11, 68),
(155, 14, 68),
(156, 17, 68),
(157, 18, 68),
(159, 14, 69),
(160, 16, 69),
(161, 18, 69),
(162, 13, 70),
(163, 12, 70),
(164, 17, 70),
(165, 18, 70),
(166, 19, 70),
(167, 14, 71),
(168, 12, 71),
(169, 13, 71),
(170, 17, 71),
(171, 19, 71),
(172, 13, 72),
(173, 17, 72),
(174, 17, 72),
(175, 19, 72),
(176, 18, 72),
(177, 18, 72),
(178, 17, 72),
(179, 20, 72),
(180, 13, 73),
(181, 16, 73),
(182, 13, 73),
(183, 17, 73),
(184, 16, 73),
(185, 13, 73),
(186, 19, 73),
(187, 16, 73),
(188, 12, 73),
(189, 20, 73),
(190, 0, 75),
(192, 0, 75),
(193, 0, 75),
(194, 0, 75),
(195, 11, 75),
(196, 20, 75),
(197, 18, 75),
(198, 19, 75),
(199, 13, 75),
(200, 17, 75),
(201, 12, 75),
(202, 16, 75),
(203, 18, 76),
(204, 19, 76),
(205, 12, 76),
(206, 13, 76),
(207, 17, 76),
(209, 0, 76),
(210, 0, 76),
(211, 0, 76),
(212, 0, 76),
(214, 18, 74),
(215, 19, 74),
(216, 11, 79),
(217, 18, 79),
(218, 19, 79),
(219, 12, 79),
(220, 13, 79),
(221, 16, 79);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_packagehead`
--

CREATE TABLE `tbl_packagehead` (
  `packagehead_id` int(11) NOT NULL,
  `packagehead_date` varchar(150) NOT NULL,
  `packagehead_status` int(11) NOT NULL DEFAULT 0,
  `packagehead_details` varchar(150) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_packagehead`
--

INSERT INTO `tbl_packagehead` (`packagehead_id`, `packagehead_date`, `packagehead_status`, `packagehead_details`, `user_id`, `type_id`) VALUES
(9, '', 0, 'consist of varieties of vegitarian foods', 0, 1),
(10, '', 0, 'consists of varietis of non veg foods', 0, 2),
(11, '', 0, 'combo of both non-veg and veg', 0, 4),
(26, '', 0, 'basic starters ', 0, 6),
(57, '', 0, 'Custom Package', 13, 2),
(58, '', 0, 'Custom Package', 13, 6),
(59, '', 0, 'Custom Package', 14, 2),
(60, '', 0, 'Custom Package', 13, 7),
(61, '', 0, 'Refreshments', 0, 9),
(62, '', 0, 'Custom Package', 15, 1),
(63, '', 0, 'Custom Package', 16, 2),
(64, '', 0, 'Custom Package', 13, 2),
(65, '', 0, 'Custom Package', 13, 2),
(66, '', 0, 'Custom Package', 18, 2),
(67, '', 0, 'Custom Package', 18, 4),
(68, '', 0, 'consists of variesties of veg fooda', 0, 10),
(70, '', 0, 'Wedding Events', 0, 11),
(71, '', 0, 'Party Events', 0, 12),
(72, '', 0, 'Birthday Events', 0, 13),
(73, '', 0, 'Custom Package', 22, 13),
(76, '', 0, 'Custom Package', 26, 12),
(77, '', 0, 'Custom Package', 25, 11),
(79, '', 0, 'Custom Package', 27, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_place`
--

CREATE TABLE `tbl_place` (
  `place_id` int(11) NOT NULL,
  `place_name` varchar(60) NOT NULL,
  `district_id` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_place`
--

INSERT INTO `tbl_place` (`place_id`, `place_name`, `district_id`) VALUES
(12, 'PONANI', '2'),
(13, 'MANJERI', '2'),
(14, 'BEYPORE', '3'),
(15, 'BALUSSERY', '3'),
(16, 'OTTAPALAM', '4'),
(17, 'PATTAMBI', '4'),
(22, 'Muvattupuzha', '7'),
(23, 'Piravom', '7'),
(24, 'Kothamangalam', '7'),
(25, 'Perumbavoor', '7'),
(26, 'Vazhakulam', '7'),
(27, 'Kalamassery', '7'),
(28, 'Aluva', '7'),
(29, 'Thripunithara', '7'),
(30, 'North Parvoor', '7'),
(31, 'Angamaly', '7'),
(32, 'Kolenchery', '7'),
(33, 'Kalady', '7'),
(34, 'Mallayatoor', '7'),
(35, 'Nellad', '7'),
(36, 'Pothanikad', '7'),
(37, 'Ramamangalam', '7'),
(38, 'kadathi', '7'),
(39, 'Veloorkunnam', '7');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_review`
--

CREATE TABLE `tbl_review` (
  `review_id` int(11) NOT NULL,
  `packagehead_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `review_rating` int(11) NOT NULL,
  `review_text` varchar(120) NOT NULL,
  `review_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_review`
--

INSERT INTO `tbl_review` (`review_id`, `packagehead_id`, `user_id`, `review_rating`, `review_text`, `review_date`) VALUES
(5, 26, 13, 4, 'The food was good .Overall trhe package was nice', '2024-10-07 16:53:52'),
(6, 10, 13, 5, 'Nice Food! I would recomend that you should choose this package', '2024-10-13 07:43:52');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_type`
--

CREATE TABLE `tbl_type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_type`
--

INSERT INTO `tbl_type` (`type_id`, `type_name`) VALUES
(2, 'Non Veg'),
(4, 'Combined'),
(10, 'Veg'),
(11, 'Wedding'),
(12, 'Party'),
(13, 'Birthday');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(60) NOT NULL,
  `user_email` varchar(60) NOT NULL,
  `user_password` varchar(200) NOT NULL,
  `user_phone` varchar(11) NOT NULL,
  `user_photo` varchar(200) NOT NULL,
  `user_proof` varchar(200) NOT NULL,
  `place_id` varchar(60) NOT NULL,
  `user_status` int(11) NOT NULL DEFAULT 0,
  `user_date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_name`, `user_email`, `user_password`, `user_phone`, `user_photo`, `user_proof`, `place_id`, `user_status`, `user_date`) VALUES
(21, 'Basil', 'basil@gmail.com', '$2y$10$.chcJHu/HiQrNTY.JgKImeWOO69x2mxg0sbk0hs0KKdpaC55rchpy', '2147483647', 'ginger Lime.jpeg', 'grapejuice.jpeg', '32', 0, '2024-10-25 07:23:54'),
(22, 'sara', 'sara@gmail.com', '$2y$10$wLBZOsSNUi7coOJtTclaLeFsxapeZfg8Vb07xVG8iADPrFZyUVYG6', '2147483647', 'watermelon.jpeg', 'grapejuice.jpeg', '36', 0, '2024-10-25 07:40:43'),
(25, 'Ashin Joseph', 'ashin@gmail.com', '$2y$10$0ZAhz.4SPGYmo5Gb4IpMHuQFTFmKnw3NcacdDrLf/UX//.Hubm60O', '6238124486', 'Featured-Hero_-Fresh-Pineapple-Juice-Recipe-Without-a-Juicer.jpg', 'lolipop.jpeg', '32', 0, '2024-10-26 09:06:46'),
(26, 'Vishnu', 'vishnu@gmail.com', '$2y$10$jWVvrjvZkukAzi11GCXJJO/gN25hdgk8O3XTorGk5Ss85b1YwIrsy', '2147483647', 'FULL VIEW ZOOM IN-OUT Sasuke Uchiha from Naruto.Follow @instapetai——————————————————  ...ist the allure of anime magic!---Don’t let the excitement fade away – hit that notification bell   for.jpg', 'Featured-Hero_-Fresh-Pineapple-Juice-Recipe-Without-a-Juicer.jpg', '22', 0, '2024-10-27 16:14:41'),
(27, 'ibru', 'ibru@gmail.com', '$2y$10$0Z5.v5qQ.M65ariUyjOlAevXjqN75tH.aFzxoECeH87KxQrUun28y', '7994408924', 'wp12950217-porsche-pc-wallpapers.jpg', 'wp12610196-black-bmw-4k-wallpapers.jpg', '22', 0, '2024-10-28 16:29:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `tbl_booking`
--
ALTER TABLE `tbl_booking`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `tbl_complaint`
--
ALTER TABLE `tbl_complaint`
  ADD PRIMARY KEY (`complaint_id`);

--
-- Indexes for table `tbl_district`
--
ALTER TABLE `tbl_district`
  ADD PRIMARY KEY (`district_id`);

--
-- Indexes for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `tbl_food`
--
ALTER TABLE `tbl_food`
  ADD PRIMARY KEY (`food_id`);

--
-- Indexes for table `tbl_packagebody`
--
ALTER TABLE `tbl_packagebody`
  ADD PRIMARY KEY (`packagebody_id`);

--
-- Indexes for table `tbl_packagehead`
--
ALTER TABLE `tbl_packagehead`
  ADD PRIMARY KEY (`packagehead_id`);

--
-- Indexes for table `tbl_place`
--
ALTER TABLE `tbl_place`
  ADD PRIMARY KEY (`place_id`);

--
-- Indexes for table `tbl_review`
--
ALTER TABLE `tbl_review`
  ADD PRIMARY KEY (`review_id`);

--
-- Indexes for table `tbl_type`
--
ALTER TABLE `tbl_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_booking`
--
ALTER TABLE `tbl_booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_complaint`
--
ALTER TABLE `tbl_complaint`
  MODIFY `complaint_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_district`
--
ALTER TABLE `tbl_district`
  MODIFY `district_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tbl_food`
--
ALTER TABLE `tbl_food`
  MODIFY `food_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tbl_packagebody`
--
ALTER TABLE `tbl_packagebody`
  MODIFY `packagebody_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222;

--
-- AUTO_INCREMENT for table `tbl_packagehead`
--
ALTER TABLE `tbl_packagehead`
  MODIFY `packagehead_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `tbl_place`
--
ALTER TABLE `tbl_place`
  MODIFY `place_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `tbl_review`
--
ALTER TABLE `tbl_review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_type`
--
ALTER TABLE `tbl_type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
