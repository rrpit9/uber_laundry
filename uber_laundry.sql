-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 07, 2023 at 05:04 PM
-- Server version: 5.7.23-23
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";
SET foreign_key_checks = 0;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `doorbnig_ul`
--

-- --------------------------------------------------------

--
-- Table structure for table `addon_charges_in_booking`
--

CREATE TABLE `addon_charges_in_booking` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `addon_id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `increase_decrease` enum('plus','minus') COLLATE utf8_unicode_ci NOT NULL,
  `amount_type` enum('Percent','Fixed') COLLATE utf8_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `applicable_on` enum('Overall','Products') COLLATE utf8_unicode_ci NOT NULL,
  `addon_amount` double NOT NULL,
  `added_date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `addon_charges_in_booking`
--

INSERT INTO `addon_charges_in_booking` (`id`, `booking_id`, `addon_id`, `title`, `increase_decrease`, `amount_type`, `amount`, `applicable_on`, `addon_amount`, `added_date_time`) VALUES
(1, 157, 14, 'Other Charge', 'plus', 'Percent', 12, 'Overall', 3, '2022-07-09 16:30:36'),
(2, 158, 14, 'Other Charge', 'plus', 'Percent', 12, 'Overall', 2, '2022-07-11 12:00:30'),
(3, 159, 14, 'Other Charge', 'plus', 'Percent', 12, 'Overall', 69.24, '2022-07-11 07:26:33'),
(4, 160, 14, 'Other Charge', 'plus', 'Percent', 12, 'Overall', 85, '2022-07-20 11:09:43'),
(5, 161, 21, 'Rainy day', 'minus', 'Percent', 10, 'Overall', 64, '2022-07-20 12:59:33'),
(6, 161, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 32, '2022-07-20 12:59:33'),
(7, 162, 21, 'Rainy day', 'minus', 'Percent', 10, 'Overall', 15, '2022-07-20 13:15:19'),
(8, 162, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 8, '2022-07-20 13:15:19'),
(9, 163, 21, 'Rainy day', 'minus', 'Percent', 10, 'Overall', 3, '2022-07-20 16:15:04'),
(10, 163, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 2, '2022-07-20 16:15:04'),
(11, 164, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 47, '2022-07-21 11:04:16'),
(12, 164, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 23, '2022-07-21 11:04:16'),
(13, 165, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 2, '2022-07-21 11:05:07'),
(14, 165, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 1, '2022-07-21 11:05:07'),
(15, 166, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 1, '2022-07-21 11:05:42'),
(16, 166, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 1, '2022-07-21 11:05:42'),
(17, 167, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 3, '2022-07-21 11:21:16'),
(18, 167, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 1, '2022-07-21 11:21:16'),
(19, 168, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 2, '2022-07-21 11:30:38'),
(20, 168, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 1, '2022-07-21 11:30:38'),
(21, 169, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 2, '2022-07-21 11:35:59'),
(22, 169, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 1, '2022-07-21 11:35:59'),
(23, 170, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 2, '2022-07-21 11:51:16'),
(24, 170, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 1, '2022-07-21 11:51:16'),
(25, 171, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 13, '2022-07-21 11:59:43'),
(26, 171, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 7, '2022-07-21 11:59:43'),
(27, 172, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 3, '2022-07-21 12:05:31'),
(28, 172, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 2, '2022-07-21 12:05:31'),
(29, 173, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 2, '2022-07-21 12:08:19'),
(30, 173, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 1, '2022-07-21 12:08:19'),
(31, 174, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 3, '2022-07-21 12:13:13'),
(32, 174, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 2, '2022-07-21 12:13:13'),
(33, 175, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 3, '2022-07-21 13:00:55'),
(34, 175, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 2, '2022-07-21 13:00:55'),
(35, 176, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 2, '2022-07-21 13:52:25'),
(36, 176, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 1, '2022-07-21 13:52:25'),
(37, 177, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 2, '2022-07-21 13:53:48'),
(38, 177, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 1, '2022-07-21 13:53:48'),
(39, 178, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 2, '2022-07-21 14:06:56'),
(40, 178, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 1, '2022-07-21 14:06:56'),
(41, 179, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 13, '2022-07-21 14:11:55'),
(42, 179, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 7, '2022-07-21 14:11:55'),
(43, 180, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 2, '2022-07-21 14:12:29'),
(44, 180, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 1, '2022-07-21 14:12:29'),
(45, 181, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 2, '2022-07-21 14:12:29'),
(46, 181, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 1, '2022-07-21 14:12:29'),
(47, 182, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 37, '2022-07-21 10:01:42'),
(48, 182, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 18.5, '2022-07-21 10:01:42'),
(49, 183, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 2, '2022-07-22 13:57:08'),
(50, 183, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 1, '2022-07-22 13:57:08'),
(51, 184, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 2, '2022-07-22 15:40:36'),
(52, 184, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 1, '2022-07-22 15:40:36'),
(53, 185, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 17, '2022-07-22 15:42:22'),
(54, 185, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 8, '2022-07-22 15:42:22'),
(55, 186, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 49, '2022-07-22 16:05:04'),
(56, 186, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 25, '2022-07-22 16:05:04'),
(57, 187, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 1, '2022-07-22 16:05:36'),
(58, 187, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 1, '2022-07-22 16:05:36'),
(59, 188, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 34, '2022-07-22 16:29:41'),
(60, 188, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 17, '2022-07-22 16:29:41'),
(61, 189, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 3, '2022-07-22 16:32:31'),
(62, 189, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 2, '2022-07-22 16:32:31'),
(63, 190, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 1, '2022-07-22 16:33:11'),
(64, 190, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 1, '2022-07-22 16:33:11'),
(65, 191, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 2, '2022-07-22 16:33:19'),
(66, 191, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 1, '2022-07-22 16:33:19'),
(67, 192, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 58.5, '2022-07-25 09:44:50'),
(68, 192, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 29.25, '2022-07-25 09:44:50'),
(69, 193, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 1, '2022-07-25 12:17:52'),
(70, 193, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 1, '2022-07-25 12:17:52'),
(71, 194, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 2, '2022-07-25 13:29:00'),
(72, 194, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 1, '2022-07-25 13:29:00'),
(73, 195, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 2, '2022-07-25 13:30:51'),
(74, 195, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 1, '2022-07-25 13:30:51'),
(75, 196, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 32.4, '2022-07-25 08:28:29'),
(76, 196, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 16.2, '2022-07-25 08:28:29'),
(77, 197, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 1, '2022-07-25 14:58:28'),
(78, 197, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 1, '2022-07-25 14:58:28'),
(79, 198, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 0, '2022-07-25 15:06:10'),
(80, 198, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 0, '2022-07-25 15:06:10'),
(81, 199, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 1, '2022-07-25 16:45:01'),
(82, 199, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 0, '2022-07-25 16:45:01'),
(83, 199, 28, 'testing', 'plus', '', 22, 'Overall', 22, '2022-07-25 16:45:01'),
(84, 200, 21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', 4, '2022-07-25 17:39:07'),
(85, 200, 22, 'July offer', 'minus', 'Percent', 5, 'Overall', 2, '2022-07-25 17:39:07'),
(86, 200, 28, 'testing', 'plus', '', 22, 'Overall', 22, '2022-07-25 17:39:07');

-- --------------------------------------------------------

--
-- Table structure for table `address_list`
--

CREATE TABLE `address_list` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `google_addres` varchar(100) DEFAULT NULL,
  `long` varchar(200) DEFAULT NULL,
  `lat` varchar(200) DEFAULT NULL,
  `house_no` varchar(100) DEFAULT NULL,
  `street_name` varchar(100) DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `pincode` varchar(100) DEFAULT NULL,
  `landmark` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `date_time` timestamp NULL DEFAULT NULL,
  `status` int(5) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address_list`
--

INSERT INTO `address_list` (`id`, `user_id`, `user_name`, `mobile`, `google_addres`, `long`, `lat`, `house_no`, `street_name`, `area`, `city`, `state`, `pincode`, `landmark`, `date`, `date_time`, `status`) VALUES
(100, 87, 'darling diyan', '9632587413', 'RWWW+MFC, Narpatkhera, Lalbagh, Lucknow, Uttar Pradesh 226001, India', '80.9461492', '26.846688', 'Ugoohib', 'Ubiji', 'Lalbagh', 'Lucknow', 'Uttar Pradesh', '226001', '9h99', '2022-04-28', '2022-04-28 03:03:28', 1),
(3, 34, 'v tyagi', '8860254198', 'abc', '0.457867', '0.8886', '23', 'cxzc', 'cxv', 'xcv', 'xcvx', '201101', 'dxcs', '2022-02-26', '2022-02-26 07:10:47', 1),
(26, 18, 'Shivram Varun', '9415964405', 'B8, Tehri Puliya, Sector 14, Vikas Nagar, Lucknow, Uttar Pradesh 226006, India', '80.9570323', '26.9078331', '201', 'indira nagar', 'Vikas Nagar', 'Lucknow', 'Uttar Pradesh', '226006', 'munshipulia', '2022-04-01', '2022-04-01 08:50:36', 1),
(4, 34, 'Shivram Varun', '9415964405', '19/1367, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', '80.9909439086914', '26.888988494873047', 'vuf', 'yfyf', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'ivi', '2022-03-02', '2022-03-02 04:10:11', 1),
(5, 45, 'Harshit Gupta', '7007629722', 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', '80.99102783203125', '26.889089584350586', 'guf', 'uguf', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'gug', '2022-03-02', '2022-03-02 05:52:58', 1),
(6, 45, 'Harshit Gupta', '7007629722', 'VW3V+MW6, Prem Nagar, Hazratganj, Lucknow, Uttar Pradesh 226001, India', '80.94478269999999', '26.8541536', 'jdjus', 'hwhe', 'Hazratganj', 'Lucknow', 'Uttar Pradesh', '226001', 'jgaih', '2022-03-02', '2022-03-02 05:56:26', 1),
(144, 92, 'sumanta paul', '9988776655', 'P-4, E Block, Kusum Kanan, Baghajatin Colony, Kolkata, West Bengal 742306, India', '88.376654', '22.482024', '43', 'ajanta park', 'colony area', 'lucknow', 'uttar p radesh', '742306', 'market', '2022-05-18', '2022-05-18 02:50:07', 1),
(10, 45, 'Harshit Gupta', '7007629722', 'Call 9415964405/04 Om Plaza Apartment Flat No-201 Sec 19, sec 17, Sabji Mandi, Chandanapur, Indira N', '80.99101257324219', '26.889080047607422', 'ufur', 'ufulf', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'igu', '2022-03-02', '2022-03-02 05:58:20', 1),
(138, 55, 'Jawa Bharath ', '8548878007', 'INSIDE LUCKNOW ZOO, RXW2+3P5, Narhi, Hazratganj, Lucknow, Uttar Pradesh 226001, India', '80.9518626', '26.845149499999998', '', '21', 'Hazratganj', 'Lucknow', 'Uttar Pradesh', '226001', 'yy', '2022-05-17', '2022-05-17 03:37:22', 1),
(14, 45, 'Harshit Gupta', '7007629722', 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', '80.99107599999999', '26.8890858', 'ejdh', 'jfjd', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'jsvs', '2022-03-02', '2022-03-02 06:18:57', 1),
(15, 45, 'Harshit Gupta', '7007629722', 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', '80.99107599999999', '26.8890858', 'nfjt', 'jthr', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'fjrh', '2022-03-02', '2022-03-02 06:20:59', 1),
(16, 45, 'Harshit Gupta', '7007629722', 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', '80.99107599999999', '26.8890858', 'ufufug', 'rufuf', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'utuf', '2022-03-02', '2022-03-02 06:23:42', 1),
(17, 6, 'Harshit Gupta', '7007629722', 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', '80.99107599999999', '26.8890858', 'jdjus', 'hwhe', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'jgaih', '2022-03-02', '2022-03-02 06:26:42', 1),
(18, 34, 'Shivram Varun', '9415964405', '19/1367, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', '80.990972', '26.888835999999998', '201', 'indira nagar', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'munshipulia', '2022-03-03', '2022-03-03 11:08:18', 1),
(99, 34, 'Shivram Varun', '9415964405', 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', '80.99107599999999', '26.8890858', 'fufuf', 'b jc', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'bcjv', '2022-04-28', '2022-04-28 02:39:55', 1),
(97, 87, 'darling diyan', '9632587413', 'RWWW+MFC, Narpatkhera, Lalbagh, Lucknow, Uttar Pradesh 226001, India', '80.9461492', '26.846688', '567', 'Trsty', 'Lalbagh', 'Lucknow', 'Uttar Pradesh', '226001', 'Treatment ', '2022-04-28', '2022-04-28 01:39:53', 1),
(20, 46, 'Valin', '8549857434', '119, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', '77.577108', '12.9307074', 'hsh\nhshjw', 'haiosnd', 'Jayanagar', 'Bengaluru', 'Karnataka', '560070', 'oyyf9', '2022-03-03', '2022-03-03 02:15:49', 1),
(21, 46, 'Valin', '8549857434', '119, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', '77.577108', '12.9307074', '', 'cuz yc9yf\n\n', 'Jayanagar', 'Bengaluru', 'Karnataka', '560070', 'jjsjsj', '2022-03-03', '2022-03-03 02:54:18', 1),
(22, 47, 'trg', '9415964403', 'Call 9415964405/04 Om Plaza Apartment Flat No-201 Sec 19, sec 17, Sabji Mandi, Chandanapur, Indira N', '80.99104059999999', '26.8890373', 'kdid', 'jdjd', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'jdj', '2022-03-04', '2022-03-04 07:47:41', 1),
(23, 47, 'trg', '9415964403', '17, Railway Colony, Dhaka Purwa, Naka Hindola, Kanpur, Uttar Pradesh 226020, India', '80.3318736', '26.449923', '301', 'kandanpur', 'Naka Hindola', 'Kanpur', 'Uttar Pradesh', '226020', 'kakadeo', '2022-03-04', '2022-03-04 08:41:10', 1),
(24, 26, 'Gaurav', 'gauravt2291@gmail.com', '190, Takrohi Market, Chandanapur, Indira Nagar, Lucknow, Uttar Pradesh 226022, India', '80.99892439999999', '26.8967733', '123', 'indra', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226022', 'near mall', '2022-03-05', '2022-03-05 09:39:01', 1),
(25, 10, 'varun', '8860254198', 'xyz', '9.765878', '0.87744', '39', 'vishwas nagar', 'sihani', 'ghaziabad', 'up', '201003', 'vtr', '2022-03-11', '2022-03-11 02:50:26', 1),
(98, 84, 'Anindita Paul', '9038078083', 'Gulista Colony Gate, Kalidas Marg, Hazratganj, Bandariya Bagh, Lucknow, Uttar Pradesh 226001, India', '80.95675659179688', '26.836896896362305', '45', 'market road', 'Bandariya Bagh', 'Lucknow', 'Uttar Pradesh', '226001', 'bakery\n', '2022-04-28', '2022-04-28 02:34:23', 1),
(143, 55, 'Jawa Bharath ', '8548878007', '427, Jawahar Nagar, Qaisar Bagh, Lucknow, Uttar Pradesh 226018, India', '80.9216321', '26.8665408', '', 'yshs', 'Qaisar Bagh', 'Lucknow', 'Uttar Pradesh', '226018', 'sahara shehar', '2022-05-17', '2022-05-17 06:11:11', 1),
(29, 57, 'test', '9087654321', 'RWHJ+JP9, Cantonment, Lucknow, Uttar Pradesh 226005, India', '80.93185129999999', '26.829032599999998', '', 'test', 'Cantonment', 'Lucknow', 'Uttar Pradesh', '226005', 'test', '2022-04-01', '2022-04-01 02:24:09', 1),
(30, 59, 'Shivram Test', '9415964409', 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', '80.99107599999999', '26.8890858', 'ted', 'hchf', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'jvjv', '2022-04-05', '2022-04-05 11:38:52', 1),
(96, 84, 'Anindita Paul', '9038078083', 'RXP4+RJM, Kalidas Marg, Bandariya Bagh, Lucknow, Uttar Pradesh 226001, India', '80.9565314', '26.837076399999997', '#45', 'market chowk', 'Bandariya Bagh', 'Lucknow', 'Uttar Pradesh', '226001', 'cafe', '2022-04-28', '2022-04-28 12:53:22', 1),
(95, 85, 'Sumanta Paul', '8777599548', 'RXP4+RJM, Kalidas Marg, Bandariya Bagh, Lucknow, Uttar Pradesh 226001, India', '80.9565314', '26.837076399999997', '#43 ', 'mg road', 'Bandariya Bagh', 'Lucknow', 'Uttar Pradesh', '226001', 'store', '2022-04-28', '2022-04-28 12:33:06', 1),
(142, 55, 'Jawa Bharath ', '8548878007', 'RWWW+PVX, Tarikhana, Narhi, Hazratganj, Lucknow, Uttar Pradesh 226001, India', '80.9471677', '26.846851299999997', '', 'h', 'Hazratganj', 'Lucknow', 'Uttar Pradesh', '226001', 'bn\n', '2022-05-17', '2022-05-17 05:01:14', 1),
(137, 55, 'Jawa Bharath ', '8548878007', 'INSIDE LUCKNOW ZOO, RXW2+3P5, Narhi, Hazratganj, Lucknow, Uttar Pradesh 226001, India', '80.9518626', '26.845149499999998', '', '6', 'Hazratganj', 'Lucknow', 'Uttar Pradesh', '226001', '6', '2022-05-17', '2022-05-17 03:26:23', 1),
(61, 79, 'dfuduxigdu', '4285658685', 'VW3V+MW6, Prem Nagar, Hazratganj, Lucknow, Uttar Pradesh 226001, India', '80.94478079999999', '26.8541536', 'gcyd', 'gxy', 'Hazratganj', 'Lucknow', 'Uttar Pradesh', '226001', 'hfu', '2022-04-13', '2022-04-13 05:50:09', 1),
(119, 87, 'darling diyan', '9632587413', 'RWJC+MVR, Preeti Nagar, Railway Colony, Charbagh, Lucknow, Uttar Pradesh 226004, India', '80.92213679999999', '26.8317286', 'Nzjaj', 'Nsnns', 'Charbagh', 'Lucknow', 'Uttar Pradesh', '226004', 'Bajaj', '2022-04-29', '2022-04-29 10:21:04', 1),
(58, 80, 'ty', '9415964412', 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', '80.99107599999999', '26.8890858', 'ugg', 'gctc', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'ctxt', '2022-04-13', '2022-04-13 05:45:15', 1),
(57, 55, 'Jawa Bharath ', '8548878007', '00, Viram Khand 5, Gomti Nagar, Lucknow, Uttar Pradesh 226010, India', '81.0072192', '26.849628799999998', '21', 'all', 'Gomti Nagar', 'Lucknow', 'Uttar Pradesh', '226010', 'pan dukhaan', '2022-04-13', '2022-04-13 03:51:59', 1),
(39, 8, 'Harshit Gupta', 'harshitgupta72@gmail.com', 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', '80.99107599999999', '26.8890858', 'h', 's', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'l', '2022-04-06', '2022-04-06 12:34:00', 1),
(40, 8, 'Harshit Gupta', 'harshitgupta72@gmail.com', 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', '80.99107599999999', '26.8890858', 'h', 's', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'l', '2022-04-06', '2022-04-06 12:36:38', 1),
(41, 8, 'Harshit Gupta', 'harshitgupta72@gmail.com', 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', '80.99107599999999', '26.8890858', 'h', 's', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'h', '2022-04-06', '2022-04-06 12:39:46', 1),
(42, 8, 'Harshit Gupta', 'harshitgupta72@gmail.com', 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', '80.99107599999999', '26.8890858', 'h', 's', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'l', '2022-04-06', '2022-04-06 12:44:11', 1),
(43, 8, 'Harshit Gupta', 'harshitgupta72@gmail.com', 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', '80.99107599999999', '26.8890858', 'fghu', 'dyf', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'gyrr', '2022-04-06', '2022-04-06 12:46:05', 1),
(44, 8, 'Harshit Gupta', 'harshitgupta72@gmail.com', 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', '80.99107599999999', '26.8890858', 'j', 'bxbx', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'jfhf', '2022-04-06', '2022-04-06 12:46:35', 1),
(45, 8, 'Harshit Gupta', 'harshitgupta72@gmail.com', 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', '80.99107599999999', '26.8890858', 'v', 'u', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'u', '2022-04-06', '2022-04-06 12:49:50', 1),
(46, 8, 'Harshit Gupta', 'harshitgupta72@gmail.com', 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', '80.99107599999999', '26.8890858', 'jfjc', 'iicc', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'vud', '2022-04-06', '2022-04-06 12:51:06', 1),
(47, 8, 'Harshit Gupta', 'harshitgupta72@gmail.com', 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', '80.99107599999999', '26.8890858', 'jjdd', 'hdbeh', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'jrjrj', '2022-04-06', '2022-04-06 01:00:55', 1),
(48, 8, 'Harshit Gupta', 'harshitgupta72@gmail.com', 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', '80.99107599999999', '26.8890858', 'h', 'h', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'h', '2022-04-06', '2022-04-06 01:01:45', 1),
(49, 8, 'Harshit Gupta', 'harshitgupta72@gmail.com', 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', '80.99107599999999', '26.8890858', 'v', 'gt', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'cuga', '2022-04-06', '2022-04-06 01:05:46', 1),
(50, 8, 'Harshit Gupta', 'harshitgupta72@gmail.com', 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', '80.99107599999999', '26.8890858', 'hh', 'bb', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'hgg', '2022-04-06', '2022-04-06 01:11:24', 1),
(51, 8, 'Harshit Gupta', 'harshitgupta72@gmail.com', 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', '80.99107599999999', '26.8890858', 'vg', 'vg', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'vn', '2022-04-06', '2022-04-06 01:15:39', 1),
(52, 8, 'Harshit Gupta', 'harshitgupta72@gmail.com', 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', '80.99107599999999', '26.8890858', 'zs', 'ss', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'is', '2022-04-06', '2022-04-06 01:20:30', 1),
(53, 61, 'arti', '6394868241', 'adity pal jankipuram secter 2, Sector J, Gaurabagh, Lucknow, Uttar Pradesh 226021, India', '80.96408629999999', '26.923305199999998', 'jankipuran', 'Lucknow ', 'Gaurabagh', 'Lucknow', 'Uttar Pradesh', '226021', 'dhdh', '2022-04-06', '2022-04-06 10:33:07', 1),
(54, 62, 'Raman gupta', '9889043117', 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', '80.99107599999999', '26.8890858', '201', 'test', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'tes', '2022-04-08', '2022-04-08 03:58:01', 1),
(136, 55, 'Jawa Bharath ', '8548878007', 'INSIDE LUCKNOW ZOO, RXW2+3P5, Narhi, Hazratganj, Lucknow, Uttar Pradesh 226001, India', '80.9518626', '26.845149499999998', '', '21', 'Hazratganj', 'Lucknow', 'Uttar Pradesh', '226001', 'landmark', '2022-05-17', '2022-05-17 02:19:55', 1),
(111, 54, 'manoj hegde', '9663028587', 'WHJG+7VJ, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', '77.5771505', '12.9307178', '', 'na', 'Jayanagar', 'Bengaluru', 'Karnataka', '560070', 'dry', '2022-04-28', '2022-04-28 05:53:14', 1),
(116, 54, 'manoj hegde', '9663028587', 'WHJG+7VJ, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', '77.5771505', '12.9307178', 'VC', 'ha', 'Jayanagar', 'Bengaluru', 'Karnataka', '560070', 'VC', '2022-04-28', '2022-04-28 05:59:57', 1),
(109, 54, 'manoj hegde', '9663028587', 'Ground floor suraj center, 235, 12, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070', '77.57722799999999', '12.9306554', '', 'na', 'Jayanagar', 'Bengaluru', 'Karnataka', '560070', 'na', '2022-04-28', '2022-04-28 05:49:39', 1),
(108, 54, 'manoj hegde', '9663028587', 'W65J+WV8, Agra - Lucknow Expy, Khargua, Deeg, Uttar Pradesh 206123, India', '79.23220119999999', '26.9097906', 'hi', 'hi', 'Khargua', 'Deeg', 'Uttar Pradesh', '206123', 'he', '2022-04-28', '2022-04-28 05:49:27', 1),
(107, 54, 'manoj hegde', '9663028587', 'Ground floor suraj center, 235, 12, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070', '77.57722799999999', '12.9306554', 'ks', 'CT', 'Jayanagar', 'Bengaluru', 'Karnataka', '560070', 'he', '2022-04-28', '2022-04-28 05:48:57', 1),
(105, 54, 'manoj hegde', '9663028587', 'WHJG+7VJ, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', '77.5771505', '12.9307178', 'ks', 'call', 'Jayanagar', 'Bengaluru', 'Karnataka', '560070', 'can', '2022-04-28', '2022-04-28 05:35:57', 1),
(174, 8, 'Harshit Gupta', 'harshitgupta72@gmail.com', 'Om Plaza, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', '80.9910355', '26.889142200000002', 'jfjg', 'hfhf', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'igjg', '2022-06-29', '2022-06-29 04:48:21', 1),
(135, 55, 'Jawa Bharath ', '8548878007', 'INSIDE LUCKNOW ZOO, RXW2+3P5, Narhi, Hazratganj, Lucknow, Uttar Pradesh 226001, India', '80.9518626', '26.845149499999998', '', '21\n', 'Hazratganj', 'Lucknow', 'Uttar Pradesh', '226001', 'landmark ', '2022-05-17', '2022-05-17 02:18:37', 1),
(134, 55, 'Jawa Bharath ', '8548878007', 'Plot No. 169, CP, Viraj Khand-4, Viraj Khand, Gomti Nagar, Lucknow, Uttar Pradesh 226010, India', '81.02318199999999', '26.855243299999998', '', '21', 'Gomti Nagar', 'Lucknow', 'Uttar Pradesh', '226010', 'sahara', '2022-05-17', '2022-05-17 01:49:54', 1),
(79, 81, 'Anindita Paul', '9880617669', 'Lucknow, Kanpur - Lucknow Rd, Preeti Nagar, Mawaiyya, Charbagh, Lucknow, Uttar Pradesh 226004, India', '80.9244566', '26.8309535', '', 'aa', 'Charbagh', 'Lucknow', 'Uttar Pradesh', '226004', 'fg', '2022-04-21', '2022-04-21 05:15:35', 1),
(80, 82, 'Avantika Paul', '9038078082', 'Ground floor suraj center, 235, 12, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070', '77.57722799999999', '12.9306554', '234, Gomtinagar', '23rd road', 'Gomtinagar', 'Lucknow', 'uttar pradesh', '226010', 'Jheel', '2022-04-22', '2022-04-22 11:48:51', 1),
(81, 82, 'Avantika Paul', '9038078082', '437, Pandit Rasbihari Tiwari Marg, Moti Jheel Colony, Aishbagh, Lucknow, Uttar Pradesh 226004, India', '80.9101058', '26.8421324', '56 house', 'Jheel road', 'Aishbagh', 'Lucknow', 'Uttar Pradesh', '226004', 'Moti jheel', '2022-04-22', '2022-04-22 11:54:36', 1),
(83, 79, 'dfuduxigdu', '4285658685', 'Jankipuram, 2/354, Sitapur Rd, Sector 2, Jankipuram Vistar, Khargapur Jagir, Uttar Pradesh 226021, I', '80.9370142', '26.93533009999999', '201', 'Jankipuram', 'Jankipuram Vistar', 'Lucknow', 'Uttar Pradesh', '226021', 'munshipulia', '2022-04-25', '2022-04-25 03:45:29', 1),
(84, 34, 'Shivram Varun', '9415964405', 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', '80.99107599999999', '26.8890858', 'test', 'test', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'test', '2022-04-26', '2022-04-26 02:02:48', 1),
(85, 34, 'Shivram Varun', '9415964405', 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', '80.99107599999999', '26.8890858', 'gcfcf', 'yfgv', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'fct', '2022-04-26', '2022-04-26 02:12:23', 1),
(86, 34, 'Shivram Varun', '9415964405', 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', '80.99107599999999', '26.8890858', 'ufhv', 'hvuvuv', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'vhvh', '2022-04-26', '2022-04-26 02:17:57', 1),
(87, 34, 'Shivram Varun', '9415964405', 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', '80.99107599999999', '26.8890858', 'sgcshc', 'hcsucs', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'sjvsjv', '2022-04-26', '2022-04-26 02:21:52', 1),
(88, 34, 'Shivram Varun', '9415964405', 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', '80.99107599999999', '26.8890858', 'gava', 'gava', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'wahababa', '2022-04-26', '2022-04-26 05:24:26', 1),
(89, 34, 'Shivram Varun', '9415964405', 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', '80.99107599999999', '26.8890858', 'vdvx', 'vdvx', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'vxvx', '2022-04-26', '2022-04-26 05:28:46', 1),
(101, 84, 'Anindita Paul', '9038078083', 'RXP4+RJM, Kalidas Marg, Bandariya Bagh, Lucknow, Uttar Pradesh 226001, India', '80.9565314', '26.837076399999997', '45', 'baghajatin', 'Bandariya Bagh', 'Lucknow', 'Uttar Pradesh', '226001', 'ABC cafe', '2022-04-28', '2022-04-28 03:22:46', 1),
(102, 84, 'Anindita Paul', '9038078083', 'RXP4+RJM, Kalidas Marg, Bandariya Bagh, Lucknow, Uttar Pradesh 226001, India', '80.9565314', '26.837076399999997', '45', 'market road', 'Bandariya Bagh', 'Lucknow', 'Uttar Pradesh', '226001', 'store', '2022-04-28', '2022-04-28 03:40:13', 1),
(104, 84, 'Anindita Paul', '9038078083', 'RXP4+RJM, Kalidas Marg, Bandariya Bagh, Lucknow, Uttar Pradesh 226001, India', '80.9565314', '26.837076399999997', 'achena apartment', 'mg road', 'Bandariya Bagh', 'Lucknow', 'Uttar Pradesh', '226001', 'tt', '2022-04-28', '2022-04-28 05:14:39', 1),
(117, 54, 'manoj hegde', '9663028587', 'WHJG+7VJ, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', '77.5771505', '12.9307178', 'test home', 'test home', 'Jayanagar', 'Bengaluru', 'Karnataka', '560070', 'test home', '2022-04-28', '2022-04-28 06:00:42', 1),
(115, 54, 'manoj hegde', '9663028587', 'RWWW+MFC, Narpatkhera, Lalbagh, Lucknow, Uttar Pradesh 226001, India', '80.94616599999999', '26.8466937', 'na', 'ha', 'Lalbagh', 'Lucknow', 'Uttar Pradesh', '226001', 'FB', '2022-04-28', '2022-04-28 05:54:57', 1),
(118, 54, 'manoj hegde', '9663028587', 'WHJG+7VJ, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', '77.5771505', '12.9307178', 'test', 'test', 'Jayanagar', 'Bengaluru', 'Karnataka', '560070', 'test', '2022-04-28', '2022-04-28 06:05:02', 1),
(122, 15, 'harshit gupta', '1234567890', 'indiranagar,lucknow,uttar pradesh', '0.654354525254', '0.452423432532', '23B', '24 backers street', 'arjunganj', 'lucknow', 'uttar pradesh', '226001', 'park', '2022-04-29', '2022-04-29 01:06:00', 1),
(145, 93, 'DJ Tillu', '9900990099', '41/94, Narhi, Hazratganj, Lucknow, Uttar Pradesh 226001, India', '80.95025500000001', '26.8465924', '', 'yyy', 'Hazratganj', 'Lucknow', 'Uttar Pradesh', '226001', 'hhh', '2022-05-18', '2022-05-18 05:25:37', 1),
(141, 55, 'Jawa Bharath ', '8548878007', 'RWWW+PVX, Tarikhana, Narhi, Hazratganj, Lucknow, Uttar Pradesh 226001, India', '80.9471677', '26.846851299999997', '', 'bb', 'Hazratganj', 'Lucknow', 'Uttar Pradesh', '226001', 'hhh', '2022-05-17', '2022-05-17 04:42:46', 1),
(124, 79, 'harshit', '12345624325', 'indiranagar,lucknow,uttar pradesh', '0.654354525254', '0.452423432532', '23B', '24 backers street', 'arjunganj', 'lucknow', 'uttar pradesh', '226001', 'park', '2022-04-29', '2022-04-29 01:08:49', 1),
(125, 84, 'Anindita Paul', '9038078083', 'RXP4+RJM, Kalidas Marg, Bandariya Bagh, Lucknow, Uttar Pradesh 226001, India', '80.9565314', '26.837076399999997', '45', 'market ', 'Bandariya Bagh', 'Lucknow', 'Uttar Pradesh', '226001', 'cafe', '2022-04-29', '2022-04-29 04:05:06', 1),
(126, 84, 'Anindita Paul', '9038078083', 'RXP4+RJM, Kalidas Marg, Bandariya Bagh, Lucknow, Uttar Pradesh 226001, India', '80.9565314', '26.837076399999997', '45', 'market', 'Bandariya Bagh', 'Lucknow', 'Uttar Pradesh', '226001', 'cafe', '2022-04-29', '2022-04-29 04:05:48', 1),
(127, 84, 'Anindita Paul', '9038078083', 'RXP4+RJM, Kalidas Marg, Bandariya Bagh, Lucknow, Uttar Pradesh 226001, India', '80.9565314', '26.837076399999997', '46', 'market', 'Bandariya Bagh', 'Lucknow', 'Uttar Pradesh', '226001', 'cafe', '2022-04-29', '2022-04-29 04:06:18', 1),
(128, 87, 'darling diyan', '9632587413', 'RWWW+MFC, Narpatkhera, Lalbagh, Lucknow, Uttar Pradesh 226001, India', '80.9461492', '26.846688', 'Hugo', 'Hi', 'Lalbagh', 'Lucknow', 'Uttar Pradesh', '226001', 'Hhj', '2022-04-29', '2022-04-29 04:18:24', 1),
(149, 79, 'Anindita Paul\n\n\n', '9880617669', NULL, NULL, NULL, '', 'aa', 'Charbagh111', 'Lucknow', 'Uttar Pradesh', '226004', 'fg', '2022-05-24', '2022-05-24 12:29:04', 1),
(148, 79, 'Anindita Paul\n\n\n', '9880617669', NULL, NULL, NULL, '', 'aabbbb', 'Charbagh', 'Lucknow', 'Uttar Pradesh', '226004', 'fg', '2022-05-24', '2022-05-24 12:28:45', 1),
(150, 15, 'harshit gupta', '1234567890', 'indiranagar,lucknow,uttar pradesh', '0.654354525254', '0.452423432532', '23B', '24 backers street', 'arjunganj', 'lucknow', 'uttar pradesh', '226001', 'park', '2022-06-03', '2022-06-03 12:57:04', 1),
(151, 23, 'Rakesh Patel', '8860254198', 'HG4V+FM8, Dadri, Uttar Pradesh 203207, India', '77.54370189279089', '28.5555419921875', 'e9', 'Mandi road', 'Dadri', 'greater noida', 'Uttar Pradesh', '201310', 'tanaka bagh', '2022-06-03', '2022-06-03 01:20:22', 1),
(152, 23, 'Rakesh Patel', '9154561086', '', '77.3378750224209', '28.55499267578125', '2/3', 'Dadri', 'Om kunj', 'Noida', 'up', '201301', 'school', '2022-06-03', '2022-06-03 07:19:08', 1),
(153, 23, 'Rakesh Patel', '2551551679', '', '77.33837150044491', '28.55523681640625', '3/5', 'kundanbag', 'sector 44', 'Noida', 'up', '201301', 'galaxy ', '2022-06-03', '2022-06-03 07:45:19', 1),
(154, 8, 'Harshit Gupta', 'harshitgupta72@gmail.com', 'HG4V+FM8, Dadri, Uttar Pradesh 203207, India', '77.5441908', '28.556170599999998', '', 'C-88', 'Noida', 'Noida', 'Uttar Pradesh', '201301', 'Near SBI ', '2022-06-04', '2022-06-04 12:17:12', 1),
(155, 23, 'Rakesh Patel', '9880617669', 'F9JG+RMR, E Block, Ajanta Park, Baghajatin Colony, Kolkata, West Bengal 700086, India', '88.3765814274545', '22.482131958007812', 'D1', 'baghajatin', '15 Achena park', 'Kolkata ', 'West Bengal ', '700086', 'Gupta stores', '2022-06-07', '2022-06-07 02:54:37', 1),
(175, 108, 'Manoj Hegde', '9999999999', 'RWWW+MFC, Narpatkhera, Lalbagh, Lucknow, Uttar Pradesh 226001, India', '80.9461492', '26.846688', '', '21', 'Lalbagh', 'Lucknow', 'Uttar Pradesh', '226001', 'Ram Mandir', '2022-07-25', '2022-07-25 12:17:44', 1),
(176, 108, 'Manoj Hegde', '9999999999', 'RWWW+MFC, Narpatkhera, Lalbagh, Lucknow, Uttar Pradesh 226001, India', '80.9461492', '26.846688', '21', 'asdf', 'Lalbagh', 'Lucknow', 'Uttar Pradesh', '226001', 'asdf', '2022-07-25', '2022-07-25 04:44:59', 1),
(177, 108, 'Manoj Hegde', '9999999999', 'RWWW+MFC, Narpatkhera, Lalbagh, Lucknow, Uttar Pradesh 226001, India', '80.9461492', '26.846688', '50', 'pnb', 'Lalbagh', 'Lucknow', 'Uttar Pradesh', '226001', 'metro', '2022-07-25', '2022-07-25 05:38:26', 1),
(178, 108, 'Manoj Hegde', '9999999999', 'Ground floor suraj center, 235, 12, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070', '77.57720184326172', '12.930594444274902', '', 'gh', 'Jayanagar', 'Bengaluru', 'Karnataka', '560070', 'ggg', '2022-07-25', '2022-07-25 06:41:48', 1),
(160, 81, 'Anindita Paul\n\n\n', '9880617669', 'F9JG+RMR, E Block, Ajanta Park, Baghajatin Colony, Kolkata, West Bengal 700086, India', '88.3766436', '22.482108399999998', 'D1', 'baghajatin ', 'Baghajatin Colony', 'Kolkata', 'West Bengal', '700086', 'gupta stores', '2022-06-07', '2022-06-07 05:38:51', 1),
(168, 81, 'Anindita Paul\n\n\n', '9880617669', 'WHJG+5VV, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', '77.5771666', '12.9304825', '43', '37 cross', 'Jayanagar', 'Bengaluru', 'Karnataka', '560070', 'gaames', '2022-06-15', '2022-06-15 05:35:20', 1),
(169, 5, 'Veer bhanu pratap singh', '9415964404', '106 om apartment first floor Sec 17, Chandanapur, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', '80.9910692', '26.889149', '', 'test', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'test', '2022-06-23', '2022-06-23 04:08:42', 1),
(170, 23, 'Rakesh Patel', '1111122222', 'P-1, SPD Block Baghajatin Rd, E Block, Ajanta Park, Baghajatin Colony, Kolkata, West Bengal 700086, ', '88.3765408336182', '22.482162475585938', 'd', 'mg road', 'baghajatin', 'Kolkata ', 'West Bengal', '700086', 'Gupta store', '2022-06-24', '2022-06-24 07:35:21', 1),
(171, 10, 'Varun Tyagi', '7007629729', 'Om Plaza, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', '80.9910355', '26.889142200000002', 'Test', 'tesf', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'tuu', '2022-06-29', '2022-06-29 01:45:07', 1),
(172, 10, 'Varun Tyagi', '7007629729', 'Om Plaza, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', '80.9910355', '26.889142200000002', '', 'hfuf', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'utug', '2022-06-29', '2022-06-29 01:47:27', 1),
(173, 10, 'Varun Tyagi', '7007629729', 'Om Plaza, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', '80.9910355', '26.889142200000002', 'Ted to ', 'rhjh', 'Indira Nagar', 'Lucknow', 'Uttar Pradesh', '226016', 'fhn', '2022-06-29', '2022-06-29 04:33:56', 1),
(167, 23, 'Rakesh Patel', '1112223334', '119, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', '77.57708642906269', '12.930702209472656', '4', 'testing street', 'btm', 'Bangalore ', 'Karnataka ', '560068', 'testing ', '2022-06-15', '2022-06-15 01:07:05', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `all_booking`
-- (See below for the actual view)
--
CREATE TABLE `all_booking` (
`id` int(11)
,`user_id` int(11)
,`user_name` text
,`user_mobile_no` text
,`user_email_id` text
,`delivery_lat` double
,`delivery_long` double
,`delivery_address` text
,`delivery_address_id` int(11)
,`pickup_date` date
,`pickup_time` time
,`pickup_time_slot_label` text
,`pickup_time_org` timestamp
,`placed_time` timestamp
,`confirm_time` timestamp
,`allot_for_pickup_time` timestamp
,`picked_up_time` timestamp
,`received_at_loundry_time` timestamp
,`in_process_time` timestamp
,`order_ready_time` timestamp
,`allot_for_drop_time` timestamp
,`drop_time` timestamp
,`pickup_otp` text
,`drop_otp` text
,`total_item_price` double
,`tax_percent` double
,`tax_amt` double
,`total_amt` double
,`paid_by_promo` double
,`paid_by_wallet` double
,`paid_by_online` double
,`paid_by_cash` double
,`skip_for_pay` double
,`pickup_boy_id` int(11)
,`pickup_boy_name` text
,`pickup_boy_number` text
,`drop_boy_id` int(11)
,`drop_boy_name` varchar(100)
,`drop_boy_number` varchar(100)
,`applied_promocode` text
,`applied_promocode_id` int(11)
,`add_to_wallet_by_promocode` double
,`add_to_wallet_by_promo_status` int(11)
,`invoice_date` date
,`invoice_number` text
,`vendor_id` int(11)
,`vendor_name` text
,`vendor_mobile_no` text
,`vendor_lat` double
,`vendor_long` double
,`vendor_address` text
,`country_id` int(11)
,`country_name` text
,`country_code` text
,`currency_name` text
,`currency_symbol` text
,`vendor_image` text
,`cancellation_reason` text
,`cancelled_by_id` int(11)
,`cancelled_time` timestamp
,`booking_status` int(11)
,`online_transaction_id` text
,`book_status` varchar(19)
);

-- --------------------------------------------------------

--
-- Table structure for table `booking_list`
--

CREATE TABLE `booking_list` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` text COLLATE utf8_unicode_ci NOT NULL,
  `user_mobile_no` text COLLATE utf8_unicode_ci NOT NULL,
  `user_email_id` text COLLATE utf8_unicode_ci NOT NULL,
  `delivery_lat` double NOT NULL,
  `delivery_long` double NOT NULL,
  `delivery_address` text COLLATE utf8_unicode_ci NOT NULL,
  `delivery_address_id` int(11) NOT NULL,
  `pickup_date` date NOT NULL,
  `pickup_time` time NOT NULL,
  `pickup_time_slot_label` text COLLATE utf8_unicode_ci NOT NULL,
  `pickup_time_org` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `drop_slot_date` date NOT NULL,
  `drop_slot_time` time NOT NULL,
  `drop_time_slot_label` text COLLATE utf8_unicode_ci NOT NULL,
  `drop_slot_time_org` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `drop_slot_time_to` time NOT NULL,
  `drop_slot_id` int(11) NOT NULL,
  `placed_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `confirm_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `allot_for_pickup_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `picked_up_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `received_at_loundry_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `in_process_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `order_ready_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `allot_for_drop_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `drop_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pickup_otp` text COLLATE utf8_unicode_ci NOT NULL,
  `drop_otp` text COLLATE utf8_unicode_ci NOT NULL,
  `total_item_price` double NOT NULL,
  `tax_percent` double NOT NULL,
  `tax_amt` double NOT NULL,
  `delivery_charge` double NOT NULL,
  `total_amt` double NOT NULL,
  `paid_by_promo` double NOT NULL,
  `paid_by_wallet` double NOT NULL,
  `paid_by_online` double NOT NULL,
  `paid_by_cash` double NOT NULL,
  `skip_for_pay` double NOT NULL,
  `pickup_boy_id` int(11) DEFAULT NULL,
  `pickup_boy_name` text COLLATE utf8_unicode_ci,
  `pickup_boy_number` text COLLATE utf8_unicode_ci,
  `drop_boy_id` int(11) DEFAULT NULL,
  `drop_boy_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `drop_boy_number` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applied_promocode` text COLLATE utf8_unicode_ci,
  `applied_promocode_id` int(11) DEFAULT NULL,
  `add_to_wallet_by_promocode` double DEFAULT NULL,
  `add_to_wallet_by_promo_status` int(11) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `invoice_number` text COLLATE utf8_unicode_ci,
  `vendor_id` int(11) DEFAULT NULL,
  `vendor_name` text COLLATE utf8_unicode_ci,
  `vendor_mobile_no` text COLLATE utf8_unicode_ci,
  `vendor_lat` double DEFAULT NULL,
  `vendor_long` double DEFAULT NULL,
  `vendor_address` text COLLATE utf8_unicode_ci,
  `country_id` int(11) DEFAULT NULL,
  `country_name` text COLLATE utf8_unicode_ci,
  `country_code` text COLLATE utf8_unicode_ci,
  `currency_name` text COLLATE utf8_unicode_ci,
  `currency_symbol` text COLLATE utf8_unicode_ci,
  `vendor_image` text COLLATE utf8_unicode_ci,
  `cancellation_reason` text COLLATE utf8_unicode_ci,
  `cancelled_by_id` int(11) DEFAULT NULL,
  `cancelled_time` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `booking_status` int(11) NOT NULL COMMENT '0=Placed,1=Confirm,2=Pickup boy_alloted,3=order_picked_up,4=received_at_loundry,5=Inprocess,6=Order Ready,7=Allot For Drop,8=Delivred,9=Cancelled',
  `online_transaction_id` text COLLATE utf8_unicode_ci,
  `time_slot_id` int(11) NOT NULL,
  `pickup_time_to` time NOT NULL,
  `pickup_type` enum('Home Delivery','Self') COLLATE utf8_unicode_ci NOT NULL,
  `service_type` enum('Normal','Express') COLLATE utf8_unicode_ci NOT NULL,
  `total_addon` double NOT NULL,
  `vendor_commission` int(11) NOT NULL,
  `company_commission` int(11) NOT NULL,
  `cash_received_by` enum('vendor','company','rider') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `booking_list`
--

INSERT INTO `booking_list` (`id`, `user_id`, `user_name`, `user_mobile_no`, `user_email_id`, `delivery_lat`, `delivery_long`, `delivery_address`, `delivery_address_id`, `pickup_date`, `pickup_time`, `pickup_time_slot_label`, `pickup_time_org`, `drop_slot_date`, `drop_slot_time`, `drop_time_slot_label`, `drop_slot_time_org`, `drop_slot_time_to`, `drop_slot_id`, `placed_time`, `confirm_time`, `allot_for_pickup_time`, `picked_up_time`, `received_at_loundry_time`, `in_process_time`, `order_ready_time`, `allot_for_drop_time`, `drop_time`, `pickup_otp`, `drop_otp`, `total_item_price`, `tax_percent`, `tax_amt`, `delivery_charge`, `total_amt`, `paid_by_promo`, `paid_by_wallet`, `paid_by_online`, `paid_by_cash`, `skip_for_pay`, `pickup_boy_id`, `pickup_boy_name`, `pickup_boy_number`, `drop_boy_id`, `drop_boy_name`, `drop_boy_number`, `applied_promocode`, `applied_promocode_id`, `add_to_wallet_by_promocode`, `add_to_wallet_by_promo_status`, `invoice_date`, `invoice_number`, `vendor_id`, `vendor_name`, `vendor_mobile_no`, `vendor_lat`, `vendor_long`, `vendor_address`, `country_id`, `country_name`, `country_code`, `currency_name`, `currency_symbol`, `vendor_image`, `cancellation_reason`, `cancelled_by_id`, `cancelled_time`, `booking_status`, `online_transaction_id`, `time_slot_id`, `pickup_time_to`, `pickup_type`, `service_type`, `total_addon`, `vendor_commission`, `company_commission`, `cash_received_by`) VALUES
(1, 79, 'Harshit Gupta', '4285658685', 'gdghgzyfjvysfx', 26.93533009999999, 80.9370142, 'Jankipuram, 2/354, Sitapur Rd, Sector 2, Jankipuram Vistar, Khargapur Jagir, Uttar Pradesh 226021, I', 83, '2022-04-27', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-27 09:00:00', '2022-04-29', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-29 10:00:00', '10:00:00', 17, '2022-04-26 14:01:23', '2022-04-26 02:07:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-04-26 04:57:58', '5134', '2365', 24, 0, 1, 0, 25, 0, 0, 0, 0, 25, 12, 'John', '2222222222', 0, '', '', NULL, NULL, NULL, NULL, '2022-04-26', '9571', 12, 'Mayfair dry cleaners', '1111111111', 26.859655380249023, 80.93719482421875, 'VW5P+QXV, Purana Haidarabad, Hasanganj, Lucknow, Uttar Pradesh 226007, India,Hasanganj,Lucknow,Uttar Pradesh,226007', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 8, '', 1, '10:00:00', 'Self', 'Normal', 0, 23, 2, 'vendor'),
(2, 34, 'Shivram Varun', '9415964405', 'shivramvarunit@gmail.com', 26.8890858, 80.99107599999999, 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', 84, '2022-04-26', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-26 09:00:00', '2022-04-29', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-29 10:00:00', '10:00:00', 17, '2022-04-26 14:02:53', '2022-04-26 02:07:19', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-04-26 17:49:25', '2022-04-26 17:49:31', '2022-04-26 17:49:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0245', '1536', 38, 0, 2.01, 0, 40.01, 0, 0, 0, 0, 40.01, 12, 'John', '2222222222', 0, '', '', NULL, NULL, NULL, NULL, '2022-04-26', '2197', 12, 'Mayfair dry cleaners', '1111111111', 26.859655380249023, 80.93719482421875, 'VW5P+QXV, Purana Haidarabad, Hasanganj, Lucknow, Uttar Pradesh 226007, India,Hasanganj,Lucknow,Uttar Pradesh,226007', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 6, '', 10, '10:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(3, 79, 'Harshit Gupta', '4285658685', 'gdghgzyfjvysfx', 26.93533009999999, 80.9370142, 'Jankipuram, 2/354, Sitapur Rd, Sector 2, Jankipuram Vistar, Khargapur Jagir, Uttar Pradesh 226021, I', 83, '2022-04-26', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-26 09:00:00', '2022-04-29', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-29 10:00:00', '10:00:00', 17, '2022-04-26 14:09:27', '2022-04-26 02:10:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1824', '8729', 31, 0, 1, 10, 42, 0, 0, 0, 0, 42, 12, 'John', '2222222222', 0, '', '', NULL, NULL, NULL, NULL, '2022-04-26', '7951', 12, 'Mayfair dry cleaners', '1111111111', 26.859655380249023, 80.93719482421875, 'VW5P+QXV, Purana Haidarabad, Hasanganj, Lucknow, Uttar Pradesh 226007, India,Hasanganj,Lucknow,Uttar Pradesh,226007', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 2, '', 10, '10:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(4, 34, 'Shivram Varun', '9415964405', 'shivramvarunit@gmail.com', 26.8890858, 80.99107599999999, 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', 85, '2022-04-26', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-26 09:00:00', '2022-04-29', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-29 10:00:00', '10:00:00', 17, '2022-04-26 14:12:31', '2022-04-26 02:13:25', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-04-26 15:37:52', '2022-04-26 15:46:21', '2022-04-26 15:46:27', '0000-00-00 00:00:00', '2022-04-26 05:22:00', '1029', '7025', 10, 0, 1, 0, 11, 0, 0, 0, 0, 11, 12, 'John', '2222222222', 0, '', '', NULL, NULL, NULL, NULL, '2022-04-26', '3592', 12, 'Mayfair dry cleaners', '1111111111', 26.859655380249023, 80.93719482421875, 'VW5P+QXV, Purana Haidarabad, Hasanganj, Lucknow, Uttar Pradesh 226007, India,Hasanganj,Lucknow,Uttar Pradesh,226007', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 8, '', 10, '10:00:00', 'Self', 'Normal', 0, 10, 1, 'vendor'),
(5, 34, 'Shivram Varun', '9415964405', 'shivramvarunit@gmail.com', 26.8890858, 80.99107599999999, 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', 86, '2022-04-26', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-26 09:00:00', '2022-04-29', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-29 10:00:00', '10:00:00', 17, '2022-04-26 14:18:00', '2022-04-26 02:18:19', '0000-00-00 00:00:00', '2022-04-26 03:07:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2876', '5160', 14, 0, 0, 10, 24, 0, 0, 0, 0, 24, 12, 'John', '2222222222', 0, '', '', NULL, NULL, NULL, NULL, '2022-04-26', '5286', 12, 'Mayfair dry cleaners', '1111111111', 26.859655380249023, 80.93719482421875, 'VW5P+QXV, Purana Haidarabad, Hasanganj, Lucknow, Uttar Pradesh 226007, India,Hasanganj,Lucknow,Uttar Pradesh,226007', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 3, '', 10, '10:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(6, 34, 'Shivram Varun', '9415964405', 'shivramvarunit@gmail.com', 26.8890858, 80.99107599999999, 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', 87, '2022-04-26', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-26 09:00:00', '2022-04-29', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-29 10:00:00', '10:00:00', 17, '2022-04-26 14:21:55', '2022-04-26 02:22:11', '0000-00-00 00:00:00', '2022-04-26 02:23:00', '2022-04-26 14:23:29', '2022-04-26 15:40:12', '2022-04-26 15:40:15', '2022-04-26 03:40:30', '0000-00-00 00:00:00', '1458', '4709', 24, 0, 1, 10, 35, 0, 0, 0, 0, 35, 12, 'John', '2222222222', 12, 'John', '2222222222', NULL, NULL, NULL, NULL, '2022-04-26', '6518', 12, 'Mayfair dry cleaners', '1111111111', 26.859655380249023, 80.93719482421875, 'VW5P+QXV, Purana Haidarabad, Hasanganj, Lucknow, Uttar Pradesh 226007, India,Hasanganj,Lucknow,Uttar Pradesh,226007', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', 'busy By rider', 12, '2022-04-28 01:24:17', 9, '', 10, '10:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(7, 34, 'Shivram Varun', '9415964405', 'shivramvarunit@gmail.com', 26.8890858, 80.99107599999999, 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', 88, '2022-04-26', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-26 09:00:00', '2022-04-29', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-29 10:00:00', '10:00:00', 17, '2022-04-26 17:24:31', '2022-04-26 05:28:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '6109', '8940', 65, 0, 2.01, 10, 77.01, 0, 0, 0, 0, 77.01, 12, 'John', '2222222222', 0, '', '', NULL, NULL, NULL, NULL, '2022-04-26', '5164', 12, 'Mayfair dry cleaners', '1111111111', 26.859655380249023, 80.93719482421875, 'VW5P+QXV, Purana Haidarabad, Hasanganj, Lucknow, Uttar Pradesh 226007, India,Hasanganj,Lucknow,Uttar Pradesh,226007', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 2, '', 10, '10:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(8, 34, 'Shivram Varun', '9415964405', 'shivramvarunit@gmail.com', 26.8890858, 80.99107599999999, 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', 89, '2022-04-26', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-26 09:00:00', '2022-04-29', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-29 10:00:00', '10:00:00', 17, '2022-04-26 17:28:50', '2022-04-26 05:29:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-04-26 17:29:09', '2022-04-26 17:29:19', '2022-04-26 17:29:21', '0000-00-00 00:00:00', '2022-04-26 05:30:01', '1208', '1057', 54, 0, 2, 0, 56, 0, 0, 0, 0, 56, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-04-26', '7321', 12, 'Mayfair dry cleaners', '1111111111', 26.859655380249023, 80.93719482421875, 'VW5P+QXV, Purana Haidarabad, Hasanganj, Lucknow, Uttar Pradesh 226007, India,Hasanganj,Lucknow,Uttar Pradesh,226007', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 8, '', 10, '10:00:00', 'Self', 'Normal', 0, 51, 5, 'vendor'),
(9, 79, 'Harshit Gupta', '4285658685', 'gdghgzyfjvysfx', 26.8541536, 80.94478079999999, 'VW3V+MW6, Prem Nagar, Hazratganj, Lucknow, Uttar Pradesh 226001, India', 60, '2022-04-26', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-26 09:00:00', '2022-04-29', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-29 10:00:00', '10:00:00', 17, '2022-04-26 17:53:27', '2022-04-26 06:00:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-04-26 18:00:20', '2022-04-26 18:00:45', '2022-04-26 18:00:50', '0000-00-00 00:00:00', '2022-04-26 06:01:47', '1730', '9084', 14, 0, 0, 0, 14, 0, 0, 0, 0, 14, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-04-26', '7235', 12, 'Mayfair dry cleaners', '1111111111', 26.859655380249023, 80.93719482421875, 'VW5P+QXV, Purana Haidarabad, Hasanganj, Lucknow, Uttar Pradesh 226007, India,Hasanganj,Lucknow,Uttar Pradesh,226007', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 8, '', 10, '10:00:00', 'Self', 'Normal', 0, 13, 1, 'vendor'),
(10, 79, 'Harshit Gupta', '4285658685', 'gdghgzyfjvysfx', 26.8541536, 80.94478079999999, 'VW3V+MW6, Prem Nagar, Hazratganj, Lucknow, Uttar Pradesh 226001, India', 60, '2022-04-27', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-27 09:00:00', '2022-04-29', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-29 10:00:00', '10:00:00', 17, '2022-04-26 17:53:44', '2022-04-26 06:00:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '4632', '7563', 31, 0, 1, 10, 42, 0, 0, 0, 0, 42, 12, 'John', '2222222222', 0, '', '', NULL, NULL, NULL, NULL, '2022-04-26', '5249', 12, 'Mayfair dry cleaners', '1111111111', 26.859655380249023, 80.93719482421875, 'VW5P+QXV, Purana Haidarabad, Hasanganj, Lucknow, Uttar Pradesh 226007, India,Hasanganj,Lucknow,Uttar Pradesh,226007', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 2, '', 1, '10:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(11, 79, 'Harshit Gupta', '4285658685', 'gdghgzyfjvysfx', 26.8541536, 80.94478079999999, 'VW3V+MW6, Prem Nagar, Hazratganj, Lucknow, Uttar Pradesh 226001, India', 60, '2022-04-27', '11:00:00', '11:00 AM To 12:00 PM', '2022-04-27 11:00:00', '2022-04-29', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-29 10:00:00', '10:00:00', 17, '2022-04-27 16:47:16', '2022-04-27 04:52:17', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '9453', '9248', 21, 0, 0, 0, 21, 0, 0, 0, 0, 21, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-04-27', '4892', 12, 'Mayfair dry cleaners', '1111111111', 26.859655380249023, 80.93719482421875, 'VW5P+QXV, Purana Haidarabad, Hasanganj, Lucknow, Uttar Pradesh 226007, India,Hasanganj,Lucknow,Uttar Pradesh,226007', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 1, '', 2, '12:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(12, 79, 'Harshit Gupta', '4285658685', 'gdghgzyfjvysfx', 26.8541536, 80.94478079999999, 'VW3V+MW6, Prem Nagar, Hazratganj, Lucknow, Uttar Pradesh 226001, India', 60, '2022-04-27', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-27 09:00:00', '2022-04-29', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-29 10:00:00', '10:00:00', 17, '2022-04-27 16:49:06', '2022-04-27 06:01:27', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0312', '4609', 45.5, 0, 1, 10, 56.5, 0, 0, 0, 0, 56.5, 12, 'John', '2222222222', 0, '', '', NULL, NULL, NULL, NULL, '2022-04-27', '9047', 12, 'Mayfair dry cleaners', '1111111111', 26.859655380249023, 80.93719482421875, 'VW5P+QXV, Purana Haidarabad, Hasanganj, Lucknow, Uttar Pradesh 226007, India,Hasanganj,Lucknow,Uttar Pradesh,226007', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 2, '', 1, '10:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(13, 79, 'Harshit Gupta ji\n', '6666666666', 'gdghgzyfjvysfx', 26.93533009999999, 80.9370142, 'Jankipuram, 2/354, Sitapur Rd, Sector 2, Jankipuram Vistar, Khargapur Jagir, Uttar Pradesh 226021, I', 83, '2022-04-29', '15:00:00', '3:00 PM To 4:00 PM', '2022-04-29 15:00:00', '2022-04-29', '15:00:00', '3:00 PM To 4:00 PM', '2022-04-29 16:00:00', '16:00:00', 19, '2022-04-27 18:04:21', '2022-04-27 06:05:24', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1570', '6125', 37, 0, 2.02, 10, 49.02, 0, 0, 0, 0, 49.02, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-04-27', '9087', 12, 'Mayfair dry cleaners', '1111111111', 26.859655380249023, 80.93719482421875, 'VW5P+QXV, Purana Haidarabad, Hasanganj, Lucknow, Uttar Pradesh 226007, India,Hasanganj,Lucknow,Uttar Pradesh,226007', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 1, '', 19, '16:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(14, 80, 'ty', '9415964412', 'ty@gmail.com', 26.8890858, 80.99107599999999, 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', 58, '2022-04-27', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-27 09:00:00', '2022-04-29', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-29 10:00:00', '10:00:00', 17, '2022-04-27 18:08:07', '2022-04-28 12:07:01', '0000-00-00 00:00:00', '2022-04-29 08:01:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2054', '1563', 35, 0, 1.03, 10, 46.03, 0, 0, 0, 0, 46.03, 12, 'John', '2222222222', 0, '', '', NULL, NULL, NULL, NULL, '2022-04-27', '4028', 12, 'Mayfair dry cleaners', '1111111111', 26.859655380249023, 80.93719482421875, 'VW5P+QXV, Purana Haidarabad, Hasanganj, Lucknow, Uttar Pradesh 226007, India,Hasanganj,Lucknow,Uttar Pradesh,226007', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 3, '', 1, '10:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(15, 54, 'manoj hegde', '9663028587', 'manoj@smartcricket.com', 26.845513399999998, 80.9462384, 'Food Joint, Mahatma Gandhi Marg, Raj Bhavan Colony, Hazratganj, Lucknow, Uttar Pradesh 226001, India', 70, '2022-04-29', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-29 09:00:00', '2022-05-01', '16:30:00', '4:30 PM To 6:30 PM', '2022-05-01 18:30:00', '18:30:00', 25, '2022-04-28 10:18:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3160', '3768', 10, 0, 1, 0, 11, 0, 0, 0, 0, 11, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-04-28', '0391', 12, 'Mayfair dry cleaners', '1111111111', 26.859655380249023, 80.93719482421875, 'VW5P+QXV, Purana Haidarabad, Hasanganj, Lucknow, Uttar Pradesh 226007, India,Hasanganj,Lucknow,Uttar Pradesh,226007', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, 12, '2022-04-28 11:03:47', 9, '', 17, '10:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(16, 54, 'manoj', '9663028587', 'manoj@smartcricket.com', 12.930745124816895, 77.57721710205078, '119, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', 91, '2022-04-29', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-29 09:00:00', '2022-05-01', '16:30:00', '4:30 PM To 6:30 PM', '2022-05-01 18:30:00', '18:30:00', 25, '2022-04-28 11:34:17', '2022-04-28 01:25:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-05-05 12:31:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '9530', '6792', 10, 0, 1, 0, 11, 0, 0, 0, 0, 11, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-04-28', '6703', 12, 'Mayfair dry cleaners', '1111111111', 26.859655380249023, 80.93719482421875, 'VW5P+QXV, Purana Haidarabad, Hasanganj, Lucknow, Uttar Pradesh 226007, India,Hasanganj,Lucknow,Uttar Pradesh,226007', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 4, '', 17, '10:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(17, 54, 'manoj', '9663028587', 'manoj@smartcricket.com', 12.930745124816895, 77.57721710205078, '119, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', 91, '2022-04-29', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-29 09:00:00', '2022-05-01', '16:30:00', '4:30 PM To 6:30 PM', '2022-05-01 18:30:00', '18:30:00', 25, '2022-04-28 11:36:02', '2022-04-28 01:25:07', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5143', '4532', 10, 0, 1, 0, 11, 0, 0, 0, 0, 11, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-04-28', '0956', 12, 'Mayfair dry cleaners', '1111111111', 26.859655380249023, 80.93719482421875, 'VW5P+QXV, Purana Haidarabad, Hasanganj, Lucknow, Uttar Pradesh 226007, India,Hasanganj,Lucknow,Uttar Pradesh,226007', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 1, '', 17, '10:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(18, 54, 'manoj', '9663028587', 'manoj@smartcricket.com', 12.930745124816895, 77.57721710205078, '119, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', 91, '2022-04-29', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-29 09:00:00', '2022-05-01', '16:30:00', '4:30 PM To 6:30 PM', '2022-05-01 18:30:00', '18:30:00', 25, '2022-04-28 11:36:46', '2022-04-28 01:25:23', '0000-00-00 00:00:00', '2022-04-28 01:50:34', '2022-04-28 13:51:20', '2022-04-28 13:51:41', '2022-04-28 13:53:30', '2022-04-28 01:54:12', '2022-04-28 01:55:11', '8314', '9508', 10, 0, 1, 0, 11, 0, 0, 0, 0, 11, 12, 'John', '2222222222', 12, 'John', '2222222222', NULL, NULL, NULL, NULL, '2022-04-28', '5841', 12, 'Mayfair dry cleaners', '1111111111', 26.859655380249023, 80.93719482421875, 'VW5P+QXV, Purana Haidarabad, Hasanganj, Lucknow, Uttar Pradesh 226007, India,Hasanganj,Lucknow,Uttar Pradesh,226007', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 8, '', 17, '10:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(19, 54, 'manoj', '9663028587', 'manoj@smartcricket.com', 26.845513399999998, 80.9462384, 'Food Joint, Mahatma Gandhi Marg, Raj Bhavan Colony, Hazratganj, Lucknow, Uttar Pradesh 226001, India', 69, '2022-04-29', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-29 09:00:00', '2022-04-30', '16:30:00', '4:30 PM To 6:30 PM', '2022-04-30 18:30:00', '18:30:00', 25, '2022-04-28 11:50:53', '2022-04-28 12:06:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-04-28 12:06:54', '2022-04-28 13:08:48', '2022-04-28 13:08:50', '2022-04-28 01:23:17', '0000-00-00 00:00:00', '7123', '1783', 160, 0, 1, 0, 161, 0, 0, 0, 0, 161, 0, '', '', 12, 'John', '2222222222', NULL, NULL, NULL, NULL, '2022-04-28', '6132', 12, 'Mayfair dry cleaners', '1111111111', 26.859655380249023, 80.93719482421875, 'VW5P+QXV, Purana Haidarabad, Hasanganj, Lucknow, Uttar Pradesh 226007, India,Hasanganj,Lucknow,Uttar Pradesh,226007', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 7, '', 17, '10:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(20, 54, 'manoj', '9663028587', 'manoj@smartcricket.com', 26.845513399999998, 80.9462384, 'Food Joint, Mahatma Gandhi Marg, Raj Bhavan Colony, Hazratganj, Lucknow, Uttar Pradesh 226001, India', 69, '2022-04-29', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-29 09:00:00', '2022-05-01', '16:30:00', '4:30 PM To 6:30 PM', '2022-05-01 18:30:00', '18:30:00', 25, '2022-04-28 13:07:17', '2022-04-28 01:07:38', '0000-00-00 00:00:00', '2022-04-28 01:08:28', '2022-04-28 13:25:18', '2022-04-28 13:25:31', '2022-04-28 13:25:33', '2022-04-28 01:26:21', '2022-04-28 01:26:42', '6970', '8023', 31.5, 0, 1, 10, 42.5, 0, 0, 0, 0, 42.5, 12, 'John', '2222222222', 12, 'John', '2222222222', NULL, NULL, NULL, NULL, '2022-04-28', '4157', 12, 'Mayfair dry cleaners', '1111111111', 26.859655380249023, 80.93719482421875, 'VW5P+QXV, Purana Haidarabad, Hasanganj, Lucknow, Uttar Pradesh 226007, India,Hasanganj,Lucknow,Uttar Pradesh,226007', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 8, '', 17, '10:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(21, 87, 'darling diyan', '9632587413', 'dd1@uber.com', 26.846688, 80.9461492, 'RWWW+MFC, Narpatkhera, Lalbagh, Lucknow, Uttar Pradesh 226001, India', 97, '2022-04-29', '15:00:00', '3:00 PM To 4:00 PM', '2022-04-29 15:00:00', '2022-05-01', '16:30:00', '4:30 PM To 6:30 PM', '2022-05-01 18:30:00', '18:30:00', 25, '2022-04-28 13:40:35', '2022-04-28 01:42:03', '0000-00-00 00:00:00', '2022-04-28 01:45:46', '2022-04-28 13:47:14', '2022-04-28 14:01:29', '2022-04-28 14:01:33', '2022-04-28 02:48:39', '2022-04-28 02:49:51', '3702', '3081', 24, 0, 1, 10, 35, 0, 0, 0, 0, 35, 12, 'John', '2222222222', 12, 'John', '2222222222', NULL, NULL, NULL, NULL, '2022-04-28', '6519', 12, 'Mayfair dry cleaners', '1111111111', 26.859655380249023, 80.93719482421875, 'VW5P+QXV, Purana Haidarabad, Hasanganj, Lucknow, Uttar Pradesh 226007, India,Hasanganj,Lucknow,Uttar Pradesh,226007', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 8, '', 19, '16:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(22, 84, 'Anindita Paul', '9038078083', 'avanpaul2016@gmail.com', 26.836896896362305, 80.95675659179688, 'Gulista Colony Gate, Kalidas Marg, Hazratganj, Bandariya Bagh, Lucknow, Uttar Pradesh 226001, India', 98, '2022-05-01', '16:30:00', '4:30 PM To 6:30 PM', '2022-05-01 16:30:00', '2022-05-01', '16:30:00', '4:30 PM To 6:30 PM', '2022-05-01 18:30:00', '18:30:00', 25, '2022-04-28 14:36:58', '2022-04-28 04:11:09', '0000-00-00 00:00:00', '2022-04-28 04:13:23', '2022-04-28 16:14:01', '2022-04-28 16:14:39', '2022-04-28 16:14:46', '2022-04-28 04:18:12', '2022-04-28 04:21:11', '8634', '2893', 7, 0, 0, 0, 7, 0, 0, 0, 0, 7, 12, 'John', '2222222222', 12, 'John', '2222222222', NULL, NULL, NULL, NULL, '2022-04-28', '5762', 12, 'Mayfair dry cleaners', '1111111111', 26.859655380249023, 80.93719482421875, 'VW5P+QXV, Purana Haidarabad, Hasanganj, Lucknow, Uttar Pradesh 226007, India,Hasanganj,Lucknow,Uttar Pradesh,226007', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 8, '', 25, '18:30:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(23, 34, 'Shivram Varun', '9415964405', 'shivramvarunit@gmail.com', 26.8890858, 80.99107599999999, 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', 99, '2022-04-29', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-29 09:00:00', '2022-05-01', '16:30:00', '4:30 PM To 6:30 PM', '2022-05-01 18:30:00', '18:30:00', 25, '2022-04-28 14:39:59', '2022-04-28 02:40:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-04-28 14:40:24', '2022-04-28 14:40:31', '2022-04-28 14:40:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2453', '3257', 17, 0, 1, 0, 18, 0, 0, 0, 0, 18, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-04-28', '9730', 12, 'Mayfair dry cleaners', '1111111111', 26.859655380249023, 80.93719482421875, 'VW5P+QXV, Purana Haidarabad, Hasanganj, Lucknow, Uttar Pradesh 226007, India,Hasanganj,Lucknow,Uttar Pradesh,226007', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 6, '', 17, '10:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(24, 54, 'manoj', '9663028587', 'manoj@smartcricket.com', 26.845513399999998, 80.9462384, 'Food Joint, Mahatma Gandhi Marg, Raj Bhavan Colony, Hazratganj, Lucknow, Uttar Pradesh 226001, India', 69, '2022-04-29', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-29 09:00:00', '2022-05-01', '16:30:00', '4:30 PM To 6:30 PM', '2022-05-01 18:30:00', '18:30:00', 25, '2022-04-28 14:53:30', '2022-04-28 02:53:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '9186', '9708', 24, 0, 1, 0, 25, 0, 0, 0, 0, 25, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-04-28', '7385', 12, 'Mayfair dry cleaners', '1111111111', 26.859655380249023, 80.93719482421875, 'VW5P+QXV, Purana Haidarabad, Hasanganj, Lucknow, Uttar Pradesh 226007, India,Hasanganj,Lucknow,Uttar Pradesh,226007', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 1, '', 17, '10:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(25, 87, 'darling diyan', '9632587413', 'dd1@uber.com', 26.846688, 80.9461492, 'RWWW+MFC, Narpatkhera, Lalbagh, Lucknow, Uttar Pradesh 226001, India', 100, '2022-04-29', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-29 09:00:00', '2022-05-01', '16:30:00', '4:30 PM To 6:30 PM', '2022-05-01 18:30:00', '18:30:00', 25, '2022-04-28 15:03:33', '2022-05-02 11:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2857', '1368', 17, 0, 1, 0, 18, 0, 0, 0, 0, 18, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-04-28', '3281', 12, 'Mayfair dry cleaners', '1111111111', 26.89413111701976, 81.00114651024342, 'A-9-3, Chandanapur, Indira Nagar, Lucknow, Uttar Pradesh 226022, India,Indira Nagar,Lucknow,Uttar Pradesh,226022', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 1, '', 17, '10:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(26, 54, 'manoj', '9663028587', 'manoj@smartcricket.com', 26.845513399999998, 80.9462384, 'Food Joint, Mahatma Gandhi Marg, Raj Bhavan Colony, Hazratganj, Lucknow, Uttar Pradesh 226001, India', 69, '2022-04-29', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-29 09:00:00', '2022-04-30', '16:30:00', '4:30 PM To 6:30 PM', '2022-04-30 18:30:00', '18:30:00', 25, '2022-04-28 15:04:25', '2022-05-02 11:10:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-05-02 11:31:46', '2022-05-17 16:06:12', '2022-05-17 16:29:52', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2831', '7341', 24, 0, 1, 0, 25, 0, 0, 0, 0, 25, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-04-28', '4917', 12, 'Mayfair dry cleaners', '1111111111', 26.89413111701976, 81.00114651024342, 'A-9-3, Chandanapur, Indira Nagar, Lucknow, Uttar Pradesh 226022, India,Indira Nagar,Lucknow,Uttar Pradesh,226022', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 6, '', 17, '10:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(27, 54, 'manoj', '9663028587', 'manoj@smartcricket.com', 26.845513399999998, 80.9462384, 'Food Joint, Mahatma Gandhi Marg, Raj Bhavan Colony, Hazratganj, Lucknow, Uttar Pradesh 226001, India', 69, '2022-04-29', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-29 09:00:00', '2022-05-01', '16:30:00', '4:30 PM To 6:30 PM', '2022-05-01 18:30:00', '18:30:00', 25, '2022-04-28 15:18:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1652', '8073', 17, 0, 1, 0, 18, 0, 0, 0, 0, 18, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-04-28', '3571', 12, 'Mayfair dry cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, 12, '2022-04-29 03:34:06', 9, '', 17, '10:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(28, 84, 'Anindita Paul', '9038078083', 'avanpaul2016@gmail.com', 26.837076399999997, 80.9565314, 'RXP4+RJM, Kalidas Marg, Bandariya Bagh, Lucknow, Uttar Pradesh 226001, India', 101, '2022-04-29', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-29 09:00:00', '2022-05-01', '16:30:00', '', '2022-05-01 16:30:00', '16:30:00', 25, '2022-04-28 15:23:42', '2022-04-28 03:24:51', '0000-00-00 00:00:00', '2022-04-28 03:26:03', '2022-04-28 16:10:52', '2022-04-28 16:14:33', '2022-04-28 16:14:49', '2022-04-28 04:18:01', '2022-04-28 04:20:30', '8519', '4517', 47, 0, 0, 0, 47, 0, 0, 0, 0, 47, 12, 'John', '2222222222', 12, 'John', '2222222222', NULL, NULL, NULL, NULL, '2022-04-28', '0162', 12, 'Mayfair dry cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 8, '', 17, '10:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(29, 54, 'manoj', '9663028587', 'manoj@smartcricket.com', 26.845513399999998, 80.9462384, 'Food Joint, Mahatma Gandhi Marg, Raj Bhavan Colony, Hazratganj, Lucknow, Uttar Pradesh 226001, India', 69, '2022-04-29', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-29 09:00:00', '2022-04-30', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-30 10:00:00', '10:00:00', 1, '2022-04-28 15:45:18', '2022-04-28 03:45:35', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-04-29 15:35:54', '2022-04-29 15:43:38', '2022-05-05 14:37:47', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '4981', '7593', 6961, 0, 67678726.64, 0, 67685687.64, 0, 0, 0, 0, 67685687.64, 12, 'John', '2222222222', 0, '', '', NULL, NULL, NULL, NULL, '2022-04-28', '2714', 12, 'Mayfair dry cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 6, '', 17, '10:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(30, 54, 'manoj', '9663028587', 'manoj@smartcricket.com', 26.845513399999998, 80.9462384, 'Food Joint, Mahatma Gandhi Marg, Raj Bhavan Colony, Hazratganj, Lucknow, Uttar Pradesh 226001, India', 69, '2022-04-29', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-29 09:00:00', '2022-04-30', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-30 10:00:00', '10:00:00', 1, '2022-04-28 15:46:33', '2022-04-29 03:32:24', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-05-17 15:24:38', '2022-05-17 16:21:29', '2022-05-17 16:21:31', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2519', '4981', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-04-28', '7460', 12, 'Mayfair dry cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 6, '', 17, '10:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(31, 54, 'manoj', '9663028587', 'manoj@smartcricket.com', 26.845513399999998, 80.9462384, 'Food Joint, Mahatma Gandhi Marg, Raj Bhavan Colony, Hazratganj, Lucknow, Uttar Pradesh 226001, India', 69, '2022-04-29', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-29 09:00:00', '2022-04-30', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-30 10:00:00', '10:00:00', 1, '2022-04-28 15:47:01', '2022-04-28 03:47:55', '0000-00-00 00:00:00', '2022-04-28 03:48:39', '2022-04-28 15:49:12', '2022-04-28 15:49:27', '2022-04-28 15:49:31', '2022-04-28 03:50:26', '2022-04-28 03:50:52', '1058', '8932', 603, 0, 20.75, 0, 623.75, 0, 0, 0, 0, 623.75, 12, 'John', '2222222222', 12, 'John', '2222222222', NULL, NULL, NULL, NULL, '2022-04-28', '5281', 12, 'Mayfair dry cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 8, '', 17, '10:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(32, 84, 'Anindita Paul', '9038078083', 'avanpaul2016@gmail.com', 26.837076399999997, 80.9565314, 'RXP4+RJM, Kalidas Marg, Bandariya Bagh, Lucknow, Uttar Pradesh 226001, India', 102, '2022-05-03', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-03 09:00:00', '2022-05-01', '08:00:00', '8:00 AM To 10:00 AM', '2022-05-01 10:00:00', '10:00:00', 26, '2022-04-28 15:54:44', '2022-04-28 04:10:44', '0000-00-00 00:00:00', '2022-04-28 04:12:05', '2022-04-28 16:13:52', '2022-04-28 16:14:25', '2022-04-28 16:14:28', '2022-04-28 04:17:55', '2022-04-28 04:19:24', '1756', '7648', 10, 0, 1, 10, 21, 0, 0, 0, 0, 21, 12, 'John', '2222222222', 12, 'John', '2222222222', NULL, NULL, NULL, NULL, '2022-04-28', '5413', 12, 'Mayfair dry cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 8, '', 10, '10:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(33, 84, 'Anindita Paul', '9038078083', 'avanpaul2016@gmail.com', 26.837076399999997, 80.9565314, 'RXP4+RJM, Kalidas Marg, Bandariya Bagh, Lucknow, Uttar Pradesh 226001, India', 104, '2022-05-01', '08:00:00', '8:00 AM To 10:00 AM', '2022-05-01 08:00:00', '2022-05-03', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-03 10:00:00', '10:00:00', 10, '2022-04-28 17:15:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '9123', '5643', 37.5, 0, 0.75, 10, 48.25, 0, 0, 0, 0, 48.25, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-04-28', '7802', 12, 'Mayfair Dry Cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 1, 'India', '+91', 'INR', 'Rs.', 'mayfair.png', NULL, 12, '2022-04-28 05:16:06', 9, '', 26, '10:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(34, 54, 'manoj hegde', '9663028587', 'manoj@smartcricket.com', 28.6411903, 77.2405826, 'Shop no. 3390 G/F, Delhi Gate, near Jain Mandir, Old Delhi, Delhi, 110002, India', 110, '2022-04-29', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-29 09:00:00', '2022-05-01', '08:00:00', '8:00 AM To 10:00 AM', '2022-05-01 10:00:00', '10:00:00', 26, '2022-04-28 17:52:11', '2022-04-29 11:48:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-04-29 11:48:42', '2022-04-29 11:53:34', '2022-04-29 11:53:40', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '8307', '8037', 17, 0, 1, 0, 18, 0, 0, 0, 0, 18, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-04-28', '8259', 12, 'Mayfair Dry Cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 1, 'India', '+91', 'INR', 'Rs.', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 6, '', 17, '10:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(35, 54, 'manoj hegde', '9663028587', 'manoj@smartcricket.com', 12.9307178, 77.5771505, 'WHJG+7VJ, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', 112, '2022-04-29', '09:00:00', '9:00 AM To 10:00 AM', '2022-04-29 09:00:00', '2022-04-30', '08:00:00', '8:00 AM To 10:00 AM', '2022-04-30 10:00:00', '10:00:00', 26, '2022-04-28 17:57:14', '2022-04-29 11:48:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-04-29 11:53:11', '2022-04-29 11:53:15', '2022-04-29 11:53:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '4238', '5860', 14.5, 0, 0, 0, 14.5, 0, 0, 0, 0, 14.5, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-04-28', '1926', 12, 'Mayfair Dry Cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 1, 'India', '+91', 'INR', 'Rs.', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 6, '', 17, '10:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(36, 81, 'Anindita Paul', '9880617669', 'anindita@smartcricket.com', 26.8309535, 80.9244566, 'Lucknow, Kanpur - Lucknow Rd, Preeti Nagar, Mawaiyya, Charbagh, Lucknow, Uttar Pradesh 226004, India', 79, '2022-05-03', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-03 09:00:00', '2022-05-04', '17:00:00', '5:00 PM To 6:00 PM', '2022-05-04 18:00:00', '18:00:00', 5, '2022-05-02 10:57:10', '2022-05-02 11:18:51', '0000-00-00 00:00:00', '2022-05-02 11:22:28', '2022-05-02 11:26:23', '2022-05-02 11:29:13', '2022-05-02 11:30:30', '2022-05-02 11:32:26', '2022-05-02 01:47:18', '8479', '1206', 0, 0, 0, 30, 30, 0, 0, 0, 0, 30, 14, 'ug8g', '5555555555', 14, 'ug8g', '5555555555', NULL, NULL, NULL, NULL, '2022-05-02', '0276', 12, 'Mayfair Dry Cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 8, '', 10, '10:00:00', 'Home Delivery', 'Express', 0, 30, 0, 'vendor'),
(37, 54, 'manoj hegde', '9663028587', 'manoj@smartcricket.com', 26.9097906, 79.23220119999999, 'W65J+WV8, Agra - Lucknow Expy, Khargua, Deeg, Uttar Pradesh 206123, India', 108, '2022-05-03', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-03 09:00:00', '2022-05-03', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-03 10:00:00', '10:00:00', 10, '2022-05-02 11:11:06', '2022-05-04 01:20:11', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2683', '3497', 17, 0, 1, 30, 48, 0, 0, 0, 0, 48, 14, 'ug8g', '5555555555', 0, '', '', NULL, NULL, NULL, NULL, '2022-05-02', '2498', 12, 'Mayfair Dry Cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 2, '', 10, '10:00:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(38, 81, 'Anindita Paul', '9880617669', 'anindita@smartcricket.com', 22.482108399999998, 88.3766436, 'F9JG+RMR, E Block, Ajanta Park, Baghajatin Colony, Kolkata, West Bengal 700086, India', 131, '2022-05-04', '11:00:00', '11:00 AM To 12:00 PM', '2022-05-04 11:00:00', '2022-05-04', '15:00:00', '3:00 PM To 4:00 PM', '2022-05-04 16:00:00', '16:00:00', 4, '2022-05-02 18:15:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3157', '3295', 30, 0, 3, 0, 33, 0, 0, 0, 0, 33, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-05-02', '4893', 12, 'Mayfair Dry Cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, 12, '2022-05-05 11:14:23', 9, '', 2, '12:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(39, 81, 'Anindita Paul', '9880617669', 'anindita@smartcricket.com', 22.482108399999998, 88.3766436, 'F9JG+RMR, E Block, Ajanta Park, Baghajatin Colony, Kolkata, West Bengal 700086, India', 132, '2022-05-08', '08:00:00', '8:00 AM To 10:00 AM', '2022-05-08 08:00:00', '2022-05-08', '08:00:00', '8:00 AM To 10:00 AM', '2022-05-08 10:00:00', '10:00:00', 26, '2022-05-05 11:42:04', '2022-05-05 12:30:01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-08-28 02:15:19', '0000-00-00 00:00:00', '2493', '6150', 130, 0, 0, 10, 140, 0, 0, 0, 0, 140, 14, 'ug8g', '5555555555', 18, 'John', '7533577533', NULL, NULL, NULL, NULL, '2022-05-05', '7368', 12, 'Mayfair Dry Cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 7, '', 26, '10:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(40, 81, 'Anindita Paul', '9880617669', 'anindita@smartcricket.com', 26.8309535, 80.9244566, 'Lucknow, Kanpur - Lucknow Rd, Preeti Nagar, Mawaiyya, Charbagh, Lucknow, Uttar Pradesh 226004, India', 79, '2022-05-06', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-06 09:00:00', '2022-05-07', '08:00:00', '8:00 AM To 10:00 AM', '2022-05-07 10:00:00', '10:00:00', 26, '2022-05-05 11:43:21', '2022-05-05 12:26:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-05-05 16:55:10', '2022-05-17 16:21:25', '2022-05-17 16:21:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '7851', '3095', 100, 0, 10, 0, 110, 0, 0, 0, 0, 110, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-05-05', '1690', 12, 'Mayfair Dry Cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 6, '', 17, '10:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(41, 81, 'Anindita Paul', '9880617669', 'anindita@smartcricket.com', 26.8309535, 80.9244566, 'Lucknow, Kanpur - Lucknow Rd, Preeti Nagar, Mawaiyya, Charbagh, Lucknow, Uttar Pradesh 226004, India', 79, '2022-05-06', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-06 09:00:00', '2022-05-06', '15:00:00', '3:00 PM To 4:00 PM', '2022-05-06 16:00:00', '16:00:00', 19, '2022-05-05 11:50:19', '2022-05-05 02:16:16', '0000-00-00 00:00:00', '2022-05-05 02:16:48', '2022-05-05 14:20:34', '2022-05-05 14:37:06', '2022-05-05 14:37:15', '2022-05-05 02:38:50', '2022-05-05 06:13:39', '5093', '2573', 27, 0, 1, 30, 58, 0, 0, 0, 0, 58, 18, 'John', '7533577533', 18, 'John', '7533577533', NULL, NULL, NULL, NULL, '2022-05-05', '4682', 12, 'Mayfair Dry Cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 8, '', 17, '10:00:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(42, 81, 'Anindita Paul', '9880617669', 'anindita@smartcricket.com', 26.822953, 80.9570225, '38/1, Nehru Enclave, Lucknow, Cantonment Rd, Neil Lines, Cantonment, Lucknow, Uttar Pradesh 226002, ', 74, '2022-05-06', '15:00:00', '3:00 PM To 4:00 PM', '2022-05-06 15:00:00', '2022-05-08', '08:00:00', '8:00 AM To 10:00 AM', '2022-05-08 10:00:00', '10:00:00', 26, '2022-05-05 12:32:57', '2022-05-05 12:42:47', '0000-00-00 00:00:00', '2022-05-05 02:18:34', '2022-05-05 14:20:26', '2022-05-05 14:36:41', '2022-05-05 14:37:25', '2022-05-05 02:38:36', '0000-00-00 00:00:00', '8941', '9540', 66, 0, 0.12, 10, 76.12, 0, 0, 0, 0, 76.12, 18, 'John', '7533577533', 18, 'John', '7533577533', NULL, NULL, NULL, NULL, '2022-05-05', '4513', 12, 'Mayfair Dry Cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', 'couldn\'t locate the house By rider', 18, '2022-05-05 06:13:21', 9, '', 19, '16:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(43, 54, 'manoj hegde test', '9663028587', 'manoj@smartcricket.com', 26.8466937, 80.94616599999999, 'RWWW+MFC, Narpatkhera, Lalbagh, Lucknow, Uttar Pradesh 226001, India', 115, '2022-05-06', '15:00:00', '3:00 PM To 4:00 PM', '2022-05-06 15:00:00', '2022-05-06', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-06 10:00:00', '10:00:00', 17, '2022-05-05 16:50:00', '2022-07-22 10:49:49', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2816', '1073', 10, 0, 1, 30, 41, 0, 0, 0, 0, 41, 18, 'John', '7533577533', 0, '', '', NULL, NULL, NULL, NULL, '2022-05-05', '4527', 12, 'Mayfair Dry Cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 2, '', 19, '16:00:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(44, 54, 'manoj hegde test', '9663028587', 'manoj@smartcricket.com', 26.8466937, 80.94616599999999, 'RWWW+MFC, Narpatkhera, Lalbagh, Lucknow, Uttar Pradesh 226001, India', 115, '2022-05-06', '15:00:00', '3:00 PM To 4:00 PM', '2022-05-06 15:00:00', '2022-05-06', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-06 10:00:00', '10:00:00', 17, '2022-05-05 16:50:01', '2022-05-05 04:50:58', '0000-00-00 00:00:00', '2022-05-05 04:54:29', '2022-05-05 16:55:05', '2022-05-05 16:56:29', '2022-05-05 16:56:33', '2022-05-05 04:56:40', '2022-05-05 04:57:09', '4170', '5349', 10, 0, 1, 30, 41, 0, 0, 0, 0, 41, 18, 'John', '7533577533', 18, 'John', '7533577533', NULL, NULL, NULL, NULL, '2022-05-05', '1865', 12, 'Mayfair Dry Cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 8, '', 19, '16:00:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(45, 79, 'Harshit Gupta ji\n', '6666666666', 'gdghgzyfjvysfx', 26.8541536, 80.94478079999999, 'VW3V+MW6, Prem Nagar, Hazratganj, Lucknow, Uttar Pradesh 226001, India', 61, '2022-05-13', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-13 09:00:00', '2022-05-15', '08:00:00', '8:00 AM To 10:00 AM', '2022-05-15 10:00:00', '10:00:00', 26, '2022-05-13 10:41:12', '2022-05-17 06:42:51', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-05-17 19:58:25', '2022-05-17 19:58:28', '2022-05-17 19:58:31', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '8512', '6341', 7, 0, 0, 0, 7, 0, 0, 0, 0, 7, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-05-13', '4097', 12, 'Mayfair Dry Cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 6, '', 17, '10:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(46, 8, 'Harshit Gupta', 'harshitgupta72@gmail.com', '7007629729', 26.889108657836914, 80.99108123779297, '103, UGF, Om Plaza, Sec-19, Chandanapur, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', 133, '2022-05-13', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-13 09:00:00', '2022-05-15', '08:00:00', '8:00 AM To 10:00 AM', '2022-05-15 10:00:00', '10:00:00', 26, '2022-05-13 11:28:08', '2022-05-17 03:24:21', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-05-17 15:24:33', '2022-05-17 16:01:37', '2022-05-17 16:21:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '7095', '5284', 7, 0, 0, 0, 7, 0, 0, 0, 0, 7, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-05-13', '6793', 12, 'Mayfair Dry Cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 6, '', 17, '10:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor');
INSERT INTO `booking_list` (`id`, `user_id`, `user_name`, `user_mobile_no`, `user_email_id`, `delivery_lat`, `delivery_long`, `delivery_address`, `delivery_address_id`, `pickup_date`, `pickup_time`, `pickup_time_slot_label`, `pickup_time_org`, `drop_slot_date`, `drop_slot_time`, `drop_time_slot_label`, `drop_slot_time_org`, `drop_slot_time_to`, `drop_slot_id`, `placed_time`, `confirm_time`, `allot_for_pickup_time`, `picked_up_time`, `received_at_loundry_time`, `in_process_time`, `order_ready_time`, `allot_for_drop_time`, `drop_time`, `pickup_otp`, `drop_otp`, `total_item_price`, `tax_percent`, `tax_amt`, `delivery_charge`, `total_amt`, `paid_by_promo`, `paid_by_wallet`, `paid_by_online`, `paid_by_cash`, `skip_for_pay`, `pickup_boy_id`, `pickup_boy_name`, `pickup_boy_number`, `drop_boy_id`, `drop_boy_name`, `drop_boy_number`, `applied_promocode`, `applied_promocode_id`, `add_to_wallet_by_promocode`, `add_to_wallet_by_promo_status`, `invoice_date`, `invoice_number`, `vendor_id`, `vendor_name`, `vendor_mobile_no`, `vendor_lat`, `vendor_long`, `vendor_address`, `country_id`, `country_name`, `country_code`, `currency_name`, `currency_symbol`, `vendor_image`, `cancellation_reason`, `cancelled_by_id`, `cancelled_time`, `booking_status`, `online_transaction_id`, `time_slot_id`, `pickup_time_to`, `pickup_type`, `service_type`, `total_addon`, `vendor_commission`, `company_commission`, `cash_received_by`) VALUES
(47, 55, 'Jawa Bharath ', '8548878007', 'bharath@gaamesunlimited.com', 26.845149499999998, 80.9518626, 'INSIDE LUCKNOW ZOO, RXW2+3P5, Narhi, Hazratganj, Lucknow, Uttar Pradesh 226001, India', 136, '2022-05-17', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-17 09:00:00', '2022-05-20', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-20 10:00:00', '10:00:00', 17, '2022-05-17 14:19:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '4759', '3269', 10, 0, 1, 0, 11, 0, 0, 0, 0, 11, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-05-17', '9480', 12, 'Mayfair Dry Cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, 12, '2022-05-17 02:22:24', 9, '', 10, '10:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(48, 55, 'Jawa Bharath ', '8548878007', 'bharath@gaamesunlimited.com', 26.845149499999998, 80.9518626, 'INSIDE LUCKNOW ZOO, RXW2+3P5, Narhi, Hazratganj, Lucknow, Uttar Pradesh 226001, India', 137, '2022-05-17', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-17 09:00:00', '2022-05-20', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-20 10:00:00', '10:00:00', 17, '2022-05-17 15:26:27', '2022-05-17 03:35:09', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-05-17 15:35:34', '2022-05-17 15:35:55', '2022-05-17 15:36:09', '0000-00-00 00:00:00', '2022-05-17 03:36:55', '9231', '2514', 10, 0, 1, 0, 11, 0, 0, 0, 0, 11, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-05-17', '0916', 12, 'Mayfair Dry Cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 8, '', 10, '10:00:00', 'Self', 'Normal', 0, 10, 1, 'vendor'),
(49, 81, 'Anindita Paul', '9880617669', 'anindita@smartcricket.com', 22.482108399999998, 88.3766436, 'F9JG+RMR, E Block, Ajanta Park, Baghajatin Colony, Kolkata, West Bengal 700086, India', 132, '2022-05-20', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-20 09:00:00', '2022-05-20', '15:00:00', '3:00 PM To 4:00 PM', '2022-05-20 16:00:00', '16:00:00', 19, '2022-05-17 15:35:39', '2022-05-17 04:21:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-05-17 16:32:57', '2022-08-01 22:29:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0187', '6032', 17, 0, 1, 0, 18, 0, 0, 0, 0, 18, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-05-17', '2381', 12, 'Mayfair Dry Cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 5, '', 17, '10:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(50, 55, 'Jawa Bharath ', '8548878007', 'bharath@gaamesunlimited.com', 26.845149499999998, 80.9518626, 'INSIDE LUCKNOW ZOO, RXW2+3P5, Narhi, Hazratganj, Lucknow, Uttar Pradesh 226001, India', 138, '2022-05-17', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-17 09:00:00', '2022-05-20', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-20 10:00:00', '10:00:00', 17, '2022-05-17 15:37:27', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1908', '1503', 10, 0, 1, 0, 11, 0, 0, 0, 0, 11, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-05-17', '0431', 12, 'Mayfair Dry Cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, 12, '2022-05-17 03:38:04', 9, '', 10, '10:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(51, 81, 'Anindita Paul', '9880617669', 'anindita@smartcricket.com', 22.482108399999998, 88.3766436, 'F9JG+RMR, E Block, Ajanta Park, Baghajatin Colony, Kolkata, West Bengal 700086, India', 132, '2022-05-17', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-17 09:00:00', '2022-05-20', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-20 10:00:00', '10:00:00', 17, '2022-05-17 15:38:08', '2022-05-17 03:44:05', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-05-17 15:50:23', '2022-05-17 16:01:33', '2022-05-17 16:01:35', '0000-00-00 00:00:00', '2022-05-17 04:05:28', '9803', '3295', 360, 0, 21, 0, 381, 0, 0, 0, 0, 381, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-05-17', '1385', 12, 'Mayfair Dry Cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 8, '', 10, '10:00:00', 'Self', 'Normal', 0, 345, 36, 'vendor'),
(52, 55, 'Jawa Bharath ', '8548878007', 'bharath@gaamesunlimited.com', 26.845149499999998, 80.9518626, 'INSIDE LUCKNOW ZOO, RXW2+3P5, Narhi, Hazratganj, Lucknow, Uttar Pradesh 226001, India', 139, '2022-05-18', '11:00:00', '11:00 AM To 12:00 PM', '2022-05-18 11:00:00', '2022-05-18', '11:00:00', '11:00 AM To 12:00 PM', '2022-05-18 12:00:00', '12:00:00', 2, '2022-05-17 15:40:14', '2022-05-17 03:54:34', '0000-00-00 00:00:00', '2022-05-17 03:55:36', '2022-05-17 15:58:04', '2022-05-17 15:58:58', '2022-05-17 16:01:13', '2022-05-17 04:02:35', '2022-05-17 04:03:40', '0215', '8963', 35, 0, 0, 30, 65, 0, 0, 0, 0, 65, 18, 'John', '7533577533', 18, 'John', '7533577533', NULL, NULL, NULL, NULL, '2022-05-17', '3278', 12, 'Mayfair Dry Cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 8, '', 2, '12:00:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(53, 81, 'Anindita Paul', '9880617669', 'anindita@smartcricket.com', 22.482108399999998, 88.3766436, 'F9JG+RMR, E Block, Ajanta Park, Baghajatin Colony, Kolkata, West Bengal 700086, India', 132, '2022-05-17', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-17 09:00:00', '2022-05-20', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-20 10:00:00', '10:00:00', 17, '2022-05-17 15:47:20', '2022-05-17 03:48:21', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-05-17 15:49:02', '2022-05-17 15:58:51', '2022-05-17 15:58:56', '0000-00-00 00:00:00', '2022-05-17 04:03:42', '4275', '0871', 210, 0, 21, 0, 231, 0, 0, 0, 0, 231, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-05-17', '5826', 12, 'Mayfair Dry Cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 8, '', 10, '10:00:00', 'Self', 'Normal', 0, 210, 21, 'vendor'),
(54, 81, 'Anindita Paul', '9880617669', 'anindita@smartcricket.com', 22.482108399999998, 88.3766436, 'F9JG+RMR, E Block, Ajanta Park, Baghajatin Colony, Kolkata, West Bengal 700086, India', 132, '2022-05-17', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-17 09:00:00', '2022-05-18', '11:00:00', '11:00 AM To 12:00 PM', '2022-05-18 12:00:00', '12:00:00', 2, '2022-05-17 16:18:59', '2022-05-17 04:19:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-05-17 16:20:05', '2022-05-17 16:20:14', '2022-05-17 16:20:17', '0000-00-00 00:00:00', '2022-05-17 04:25:46', '7134', '5413', 100, 0, 10, 0, 110, 0, 0, 0, 0, 110, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-05-17', '3402', 12, 'Mayfair Dry Cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 8, '', 10, '10:00:00', 'Self', 'Express', 0, 100, 10, 'vendor'),
(55, 55, 'Jawa Bharath ', '8548878007', 'bharath@gaamesunlimited.com', 26.845149499999998, 80.9518626, 'INSIDE LUCKNOW ZOO, RXW2+3P5, Narhi, Hazratganj, Lucknow, Uttar Pradesh 226001, India', 140, '2022-05-18', '17:00:00', '5:00 PM To 6:00 PM', '2022-05-18 17:00:00', '2022-05-22', '08:00:00', '8:00 AM To 10:00 AM', '2022-05-22 10:00:00', '10:00:00', 26, '2022-05-17 16:24:36', '2022-05-17 05:20:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '9302', '7385', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-05-17', '5072', 12, 'Mayfair Dry Cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 1, '', 5, '18:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(56, 81, 'Anindita Paul', '9880617669', 'anindita@smartcricket.com', 22.482108399999998, 88.3766436, 'F9JG+RMR, E Block, Ajanta Park, Baghajatin Colony, Kolkata, West Bengal 700086, India', 132, '2022-05-17', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-17 09:00:00', '2022-05-20', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-20 10:00:00', '10:00:00', 17, '2022-05-17 16:27:01', '2022-05-17 04:28:15', '0000-00-00 00:00:00', '2022-05-17 04:28:42', '2022-05-17 16:29:29', '2022-05-17 16:29:42', '2022-05-17 16:29:46', '2022-05-17 04:30:26', '2022-05-17 04:31:04', '3674', '6813', 0, 0, 0, 10, 10, 0, 0, 0, 0, 10, 14, 'ug8g', '5555555555', 14, 'ug8g', '5555555555', NULL, NULL, NULL, NULL, '2022-05-17', '9402', 12, 'Mayfair Dry Cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 8, '', 10, '10:00:00', 'Home Delivery', 'Normal', 0, 10, 0, 'vendor'),
(57, 81, 'Anindita Paul', '9880617669', 'anindita@smartcricket.com', 22.482108399999998, 88.3766436, 'F9JG+RMR, E Block, Ajanta Park, Baghajatin Colony, Kolkata, West Bengal 700086, India', 132, '2022-05-17', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-17 09:00:00', '2022-05-20', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-20 10:00:00', '10:00:00', 17, '2022-05-17 16:31:50', '2022-05-17 04:32:07', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-05-17 16:32:53', '2022-05-17 16:33:04', '2022-05-17 16:33:13', '0000-00-00 00:00:00', '2022-05-17 04:34:10', '0518', '0917', 250, 0, 10, 0, 260, 0, 0, 0, 0, 260, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-05-17', '8154', 12, 'Mayfair Dry Cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 8, '', 10, '10:00:00', 'Self', 'Normal', 0, 235, 25, 'vendor'),
(58, 55, 'Jawa Bharath ', '8548878007', 'bharath@gaamesunlimited.com', 26.846851299999997, 80.9471677, 'RWWW+PVX, Tarikhana, Narhi, Hazratganj, Lucknow, Uttar Pradesh 226001, India', 141, '2022-05-17', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-17 09:00:00', '2022-05-18', '11:00:00', '11:00 AM To 12:00 PM', '2022-05-18 12:00:00', '12:00:00', 2, '2022-05-17 16:42:48', '2022-05-17 04:55:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-05-17 07:57:52', '0000-00-00 00:00:00', '0176', '8603', 3511, 0, 1, 30, 3542, 0, 0, 0, 0, 3542, 14, 'ug8g', '5555555555', 18, 'John', '7533577533', NULL, NULL, NULL, NULL, '2022-05-17', '0184', 12, 'Mayfair Dry Cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 7, '', 10, '10:00:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(59, 55, 'Jawa Bharath ', '8548878007', 'bharath@gaamesunlimited.com', 26.846851299999997, 80.9471677, 'RWWW+PVX, Tarikhana, Narhi, Hazratganj, Lucknow, Uttar Pradesh 226001, India', 142, '2022-05-17', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-17 09:00:00', '2022-05-18', '11:00:00', '11:00 AM To 12:00 PM', '2022-05-18 12:00:00', '12:00:00', 2, '2022-05-17 17:01:16', '2022-05-17 06:11:45', '0000-00-00 00:00:00', '2022-05-17 06:13:25', '2022-05-17 18:45:17', '2022-05-18 13:14:33', '2022-06-11 23:17:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '7583', '0173', 10, 0, 0, 30, 40, 0, 0, 0, 0, 40, 18, 'John', '7533577533', 0, '', '', NULL, NULL, NULL, NULL, '2022-05-17', '4531', 12, 'Mayfair Dry Cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, NULL, '0000-00-00 00:00:00', 6, '', 10, '10:00:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(60, 81, 'Anindita Paul', '9880617669', 'anindita@smartcricket.com', 22.482108399999998, 88.3766436, 'F9JG+RMR, E Block, Ajanta Park, Baghajatin Colony, Kolkata, West Bengal 700086, India', 132, '2022-05-17', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-17 09:00:00', '2022-05-20', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-20 10:00:00', '10:00:00', 17, '2022-05-17 17:13:17', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '4801', '5643', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-05-17', '7641', 12, 'Mayfair Dry Cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', 'mayfair.png', NULL, 12, '2022-05-17 05:14:08', 9, '', 10, '10:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(61, 55, 'Jawa Bharath ', '8548878007', 'bharath@gaamesunlimited.com', 26.845149499999998, 80.9518626, 'INSIDE LUCKNOW ZOO, RXW2+3P5, Narhi, Hazratganj, Lucknow, Uttar Pradesh 226001, India', 136, '2022-05-17', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-17 09:00:00', '2022-05-20', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-20 10:00:00', '10:00:00', 17, '2022-05-17 18:11:14', '2022-05-17 06:11:30', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-05-17 18:11:38', '2022-05-17 18:50:16', '2022-05-17 18:50:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '6251', '7329', 17, 0, 1, 0, 18, 0, 0, 0, 0, 18, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-05-17', '0639', 12, 'Mayfair Dry Cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 6, '', 10, '10:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(62, 55, 'Jawa Bharath ', '8548878007', 'bharath@gaamesunlimited.com', 26.845149499999998, 80.9518626, 'INSIDE LUCKNOW ZOO, RXW2+3P5, Narhi, Hazratganj, Lucknow, Uttar Pradesh 226001, India', 136, '2022-05-17', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-17 09:00:00', '2022-05-18', '11:00:00', '11:00 AM To 12:00 PM', '2022-05-18 12:00:00', '12:00:00', 2, '2022-05-17 18:28:37', '2022-05-17 06:29:45', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-05-17 18:30:00', '2022-05-17 18:30:03', '2022-05-17 18:30:06', '0000-00-00 00:00:00', '2022-05-17 06:31:12', '6439', '0168', 10, 0, 1, 0, 11, 0, 0, 0, 0, 11, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-05-17', '3187', 12, 'Mayfair Dry Cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 10, '10:00:00', 'Self', 'Express', 0, 10, 1, 'vendor'),
(63, 55, 'Jawa Bharath ', '8548878007', 'bharath@gaamesunlimited.com', 26.845149499999998, 80.9518626, 'INSIDE LUCKNOW ZOO, RXW2+3P5, Narhi, Hazratganj, Lucknow, Uttar Pradesh 226001, India', 136, '2022-05-17', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-17 09:00:00', '2022-05-18', '11:00:00', '11:00 AM To 12:00 PM', '2022-05-18 12:00:00', '12:00:00', 2, '2022-05-17 18:32:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1269', '8670', 10, 0, 1, 30, 41, 0, 0, 0, 0, 41, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-05-17', '8520', 12, 'Mayfair Dry Cleaners', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, 12, '2022-05-17 06:32:47', 9, '', 10, '10:00:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(64, 55, 'Jawa Bharath ', '8548878007', 'bharath@gaamesunlimited.com', 26.845149499999998, 80.9518626, 'INSIDE LUCKNOW ZOO, RXW2+3P5, Narhi, Hazratganj, Lucknow, Uttar Pradesh 226001, India', 136, '2022-05-17', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-17 09:00:00', '2022-05-18', '11:00:00', '11:00 AM To 12:00 PM', '2022-05-18 12:00:00', '12:00:00', 2, '2022-05-17 18:42:41', '2022-05-17 06:43:03', '0000-00-00 00:00:00', '2022-05-17 06:44:18', '2022-05-17 18:44:37', '2022-05-17 18:44:45', '2022-05-17 18:44:46', '2022-05-17 06:44:57', '2022-05-17 06:45:26', '7210', '1956', 0, 0, 0, 30, 30, 0, 0, 0, 0, 30, 18, 'John', '7533577533', 18, 'John', '7533577533', NULL, NULL, NULL, NULL, '2022-05-17', '4276', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 10, '10:00:00', 'Home Delivery', 'Express', 0, 30, 0, 'vendor'),
(65, 55, 'Jawa Bharath ', '8548878007', 'bharath@gaamesunlimited.com', 26.845149499999998, 80.9518626, 'INSIDE LUCKNOW ZOO, RXW2+3P5, Narhi, Hazratganj, Lucknow, Uttar Pradesh 226001, India', 136, '2022-05-17', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-17 09:00:00', '2022-05-20', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-20 10:00:00', '10:00:00', 17, '2022-05-17 18:48:34', '2022-05-17 06:48:49', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-05-17 18:49:35', '2022-05-17 18:50:05', '2022-05-17 18:50:08', '0000-00-00 00:00:00', '2022-05-17 06:50:58', '8596', '1803', 85886, 0, 1, 0, 85887, 0, 0, 0, 0, 85887, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-05-17', '4269', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 10, '10:00:00', 'Self', 'Normal', 0, 85879, 8, 'vendor'),
(66, 55, 'Jawa Bharath ', '8548878007', 'bharath@gaamesunlimited.com', 26.845149499999998, 80.9518626, 'INSIDE LUCKNOW ZOO, RXW2+3P5, Narhi, Hazratganj, Lucknow, Uttar Pradesh 226001, India', 136, '2022-05-17', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-17 09:00:00', '2022-05-20', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-20 10:00:00', '10:00:00', 17, '2022-05-17 19:59:25', '2022-05-17 07:59:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-05-20 13:39:42', '2022-05-20 13:39:51', '2022-06-07 17:21:40', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5793', '4295', 10, 0, 1, 0, 11, 0, 0, 0, 0, 11, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-05-17', '5673', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 6, '', 10, '10:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(67, 55, 'Jawa Bharath ', '8548878007', 'bharath@gaamesunlimited.com', 26.845149499999998, 80.9518626, 'INSIDE LUCKNOW ZOO, RXW2+3P5, Narhi, Hazratganj, Lucknow, Uttar Pradesh 226001, India', 138, '2022-05-18', '17:00:00', '5:00 PM To 6:00 PM', '2022-05-18 17:00:00', '2022-05-22', '08:00:00', '8:00 AM To 10:00 AM', '2022-05-22 10:00:00', '10:00:00', 26, '2022-05-18 12:48:28', '2022-05-18 01:14:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-05-18 13:14:22', '2022-05-18 13:14:30', '2022-05-18 13:14:31', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1729', '7239', 12, 0, 0, 0, 12, 0, 0, 0, 0, 12, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-05-18', '1508', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 6, '', 5, '18:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(68, 93, 'DJ Tillu', '9900990099', 'djtillu@mailinator.com', 26.8465924, 80.95025500000001, '41/94, Narhi, Hazratganj, Lucknow, Uttar Pradesh 226001, India', 145, '2022-05-18', '11:00:00', '11:00 AM To 12:00 PM', '2022-05-18 11:00:00', '2022-05-20', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-20 10:00:00', '10:00:00', 17, '2022-05-18 17:25:39', '2022-07-21 06:14:01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2179', '7083', 22, 0, 0, 65, 87, 0, 0, 0, 0, 87, 18, 'John', '7533577533', 0, '', '', NULL, NULL, NULL, NULL, '2022-05-18', '7963', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 2, '', 2, '12:00:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(69, 51, 'mayttwo', '8401471987', 'madhu@winds.co.in', 26.8421324, 80.9101058, '437, Pandit Rasbihari Tiwari Marg, Moti Jheel Colony, Aishbagh, Lucknow, Uttar Pradesh 226004, India', 146, '2022-05-18', '17:00:00', '5:00 PM To 6:00 PM', '2022-05-18 17:00:00', '2022-05-20', '15:00:00', '3:00 PM To 4:00 PM', '2022-05-20 16:00:00', '16:00:00', 19, '2022-05-18 17:32:08', '2022-05-18 05:34:44', '0000-00-00 00:00:00', '2022-05-18 05:35:47', '2022-05-18 17:37:05', '2022-05-18 17:37:31', '2022-05-18 17:37:52', '2022-05-18 05:38:27', '2022-05-18 05:39:07', '5812', '9458', 69, 0, 0.62, 19, 88.62, 0, 0, 0, 0, 88.62, 18, 'John', '7533577533', 18, 'John', '7533577533', NULL, NULL, NULL, NULL, '2022-05-18', '0243', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 5, '18:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(70, 51, 'mayttwo', '8401471987', 'madhu@winds.co.in', 26.8421324, 80.9101058, '437, Pandit Rasbihari Tiwari Marg, Moti Jheel Colony, Aishbagh, Lucknow, Uttar Pradesh 226004, India', 147, '2022-05-18', '17:00:00', '5:00 PM To 6:00 PM', '2022-05-18 17:00:00', '2022-05-20', '15:00:00', '3:00 PM To 4:00 PM', '2022-05-20 16:00:00', '16:00:00', 19, '2022-05-18 18:17:07', '2022-05-18 06:18:39', '0000-00-00 00:00:00', '2022-05-18 06:19:24', '2022-05-18 18:22:04', '2022-05-18 18:23:34', '2022-05-18 18:23:48', '2022-05-18 06:24:06', '2022-05-18 06:26:37', '7254', '1345', 32, 0, 3.25, 19, 54.25, 0, 0, 0, 0, 54.25, 18, 'John', '7533577533', 18, 'John', '7533577533', NULL, NULL, NULL, NULL, '2022-05-18', '7816', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 5, '18:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(71, 8, 'Harshit Gupta', 'harshitgupta72@gmail.com', '7007629729', 26.8890858, 80.99107599999999, 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', 40, '2022-05-20', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-20 09:00:00', '2022-05-22', '08:00:00', '8:00 AM To 10:00 AM', '2022-05-22 10:00:00', '10:00:00', 26, '2022-05-20 12:53:29', '2022-05-23 03:16:05', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-05-28 13:51:52', '2022-06-07 17:18:29', '2022-06-07 17:18:30', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2340', '7498', 272, 0, 7.44, 0, 279.44, 0, 0, 0, 0, 279.44, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-05-20', '6285', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 6, '', 17, '10:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(72, 81, 'Anindita Paul', '9880617669', 'anindita@smartcricket.com', 26.822953, 80.9570225, '38/1, Nehru Enclave, Lucknow, Cantonment Rd, Neil Lines, Cantonment, Lucknow, Uttar Pradesh 226002, ', 74, '2022-05-20', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-20 09:00:00', '2022-05-22', '08:00:00', '8:00 AM To 10:00 AM', '2022-05-22 10:00:00', '10:00:00', 26, '2022-05-20 13:11:36', '2022-05-20 01:28:45', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-05-28 13:51:49', '2022-05-28 13:51:59', '2022-05-28 13:52:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0791', '3972', 200, 0, 20, 0, 220, 0, 0, 0, 0, 220, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-05-20', '8230', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 6, '', 17, '10:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(73, 81, 'Anindita Paul', '9880617669', 'anindita@smartcricket.com', 26.822953, 80.9570225, '38/1, Nehru Enclave, Lucknow, Cantonment Rd, Neil Lines, Cantonment, Lucknow, Uttar Pradesh 226002, ', 74, '2022-05-20', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-20 09:00:00', '2022-05-22', '08:00:00', '8:00 AM To 10:00 AM', '2022-05-22 10:00:00', '10:00:00', 26, '2022-05-20 13:25:17', '2022-06-08 07:29:21', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-05-23 04:31:05', '0000-00-00 00:00:00', '3418', '1638', 111, 0, 11.12, 65, 187.12, 0, 0, 0, 0, 187.12, 18, 'John', '7533577533', 18, 'John', '7533577533', NULL, NULL, NULL, NULL, '2022-05-20', '9482', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 2, '', 17, '10:00:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(74, 81, 'Anindita Paul\n\n\n', '9880617669', 'anindita@smartcricket.com', 26.822953, 80.9570225, '38/1, Nehru Enclave, Lucknow, Cantonment Rd, Neil Lines, Cantonment, Lucknow, Uttar Pradesh 226002, ', 74, '2022-05-24', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-24 09:00:00', '2022-05-25', '11:00:00', '11:00 AM To 12:00 PM', '2022-05-25 12:00:00', '12:00:00', 2, '2022-05-23 12:10:11', '2022-05-23 03:06:36', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-05-23 15:24:27', '2022-05-23 15:29:06', '2022-05-23 16:18:22', '0000-00-00 00:00:00', '2022-05-23 04:19:29', '3716', '4327', 17, 0, 1, 0, 18, 0, 0, 0, 0, 18, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-05-23', '9801', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 10, '10:00:00', 'Self', 'Normal', 0, 16, 2, 'vendor'),
(75, 34, 'Shivram Varun', '9415964405', 'shivramvarunit@gmail.com', 0.8886, 0.457867, 'abc', 3, '2022-05-28', '08:43:00', '8:43 AM To 9:49 PM', '2022-05-28 08:43:00', '2022-05-29', '08:00:00', '8:00 AM To 10:00 AM', '2022-05-29 10:00:00', '10:00:00', 26, '2022-05-28 13:53:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2806', '1723', 17, 0, 1, 0, 18, 0, 0, 0, 0, 18, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-05-28', '4986', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 28, '21:49:00', 'Self', 'Express', 0, 0, 0, 'vendor'),
(76, 34, 'Shivram Varun', '9415964405', 'shivramvarunit@gmail.com', 26.8890858, 80.99107599999999, 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', 99, '2022-05-28', '08:43:00', '8:43 AM To 9:49 PM', '2022-05-28 08:43:00', '2022-05-29', '08:00:00', '8:00 AM To 10:00 AM', '2022-05-29 10:00:00', '10:00:00', 26, '2022-05-28 13:56:11', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '9476', '4187', 17, 0, 1, 0, 18, 0, 0, 0, 0, 18, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-05-28', '3976', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 28, '21:49:00', 'Self', 'Express', 0, 0, 0, 'vendor'),
(77, 34, 'Shivram Varun', '9415964405', 'shivramvarunit@gmail.com', 26.8890858, 80.99107599999999, 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', 84, '2022-05-28', '08:43:00', '8:43 AM To 9:49 PM', '2022-05-28 08:43:00', '2022-05-29', '08:00:00', '8:00 AM To 10:00 AM', '2022-05-29 10:00:00', '10:00:00', 26, '2022-05-28 13:57:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '7350', '4916', 17, 0, 0, 65, 82, 0, 0, 0, 0, 82, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-05-28', '3108', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 28, '21:49:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(78, 34, 'Shivram Varun', '9415964405', 'shivramvarunit@gmail.com', 26.8890858, 80.99107599999999, 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', 84, '2022-05-28', '08:43:00', '8:43 AM To 9:49 PM', '2022-05-28 08:43:00', '2022-05-31', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-31 10:00:00', '10:00:00', 10, '2022-05-28 13:58:11', '2022-07-21 05:22:49', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '7813', '3492', 12, 0, 0, 19, 31, 0, 0, 0, 0, 31, 18, 'John', '7533577533', 0, '', '', NULL, NULL, NULL, NULL, '2022-05-28', '4071', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 2, '', 28, '21:49:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(79, 34, 'Shivram Varun', '9415964405', 'shivramvarunit@gmail.com', 26.8890858, 80.99107599999999, 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', 84, '2022-05-28', '08:43:00', '8:43 AM To 9:49 PM', '2022-05-28 08:43:00', '2022-05-31', '09:00:00', '9:00 AM To 10:00 AM', '2022-05-31 10:00:00', '10:00:00', 10, '2022-05-28 14:00:03', '2022-05-28 03:19:17', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '4653', '3501', 7, 0, 0, 19, 26, 0, 0, 0, 0, 26, 14, 'ug8g', '5555555555', 0, '', '', NULL, NULL, NULL, NULL, '2022-05-28', '8340', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 2, '', 28, '21:49:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(80, 34, 'Shivram Varun', '9415964405', 'shivramvarunit@gmail.com', 26.888835999999998, 80.990972, '19/1367, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', 18, '2022-03-29', '09:00:00', '9:00 AM To 10:00 AM', '2022-03-29 09:00:00', '2022-03-30', '09:00:00', '', '2022-03-30 09:00:00', '09:00:00', 1, '2022-06-04 00:49:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1043', '7318', 0, 0, 0, 65, 65, 0, 0, 0, 0, 65, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-04', '0715', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 10, '10:00:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(81, 23, 'Rakesh Ji', '8860254190', 'test23456@gmail.com', 28.5555419921875, 77.54370189279089, 'HG4V+FM8, Dadri, Uttar Pradesh 203207, India', 151, '0000-00-00', '08:43:00', '8:43 AM To 9:49 PM', '0000-00-00 00:00:00', '0000-00-00', '09:00:00', '9:00 AM To 10:00 AM', '0000-00-00 00:00:00', '10:00:00', 10, '2022-06-04 09:01:40', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1893', '5098', 0, 0, 0, 65, 65, 0, 0, 0, 0, 65, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-04', '6197', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 28, '21:49:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(82, 23, 'Rakesh Ji', '8860254190', 'test23456@gmail.com', 28.5555419921875, 77.54370189279089, 'HG4V+FM8, Dadri, Uttar Pradesh 203207, India', 151, '0000-00-00', '08:43:00', '8:43 AM To 9:49 PM', '0000-00-00 00:00:00', '0000-00-00', '09:00:00', '9:00 AM To 10:00 AM', '0000-00-00 00:00:00', '10:00:00', 10, '2022-06-04 09:04:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1824', '7386', 0, 0, 0, 65, 65, 0, 0, 0, 0, 65, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-04', '1062', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 28, '21:49:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(83, 23, 'Rakesh Ji', '8860254190', 'test23456@gmail.com', 28.5555419921875, 77.54370189279089, 'HG4V+FM8, Dadri, Uttar Pradesh 203207, India', 151, '0000-00-00', '08:43:00', '8:43 AM To 9:49 PM', '0000-00-00 00:00:00', '0000-00-00', '09:00:00', '9:00 AM To 10:00 AM', '0000-00-00 00:00:00', '10:00:00', 10, '2022-06-04 09:05:39', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1069', '1354', 0, 0, 0, 65, 65, 0, 0, 0, 0, 65, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-04', '1487', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 28, '21:49:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(84, 23, 'Rakesh Ji', '8860254190', 'test23456@gmail.com', 28.5555419921875, 77.54370189279089, 'HG4V+FM8, Dadri, Uttar Pradesh 203207, India', 151, '0000-00-00', '08:43:00', '8:43 AM To 9:49 PM', '0000-00-00 00:00:00', '0000-00-00', '09:00:00', '9:00 AM To 10:00 AM', '0000-00-00 00:00:00', '10:00:00', 10, '2022-06-04 09:09:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '8961', '8069', 0, 0, 0, 65, 65, 0, 0, 0, 0, 65, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-04', '3057', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 28, '21:49:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(85, 23, 'Rakesh Ji', '8860254190', 'test23456@gmail.com', 28.5555419921875, 77.54370189279089, 'HG4V+FM8, Dadri, Uttar Pradesh 203207, India', 151, '0000-00-00', '08:43:00', '8:43 AM To 9:49 PM', '0000-00-00 00:00:00', '0000-00-00', '09:00:00', '9:00 AM To 10:00 AM', '0000-00-00 00:00:00', '10:00:00', 10, '2022-06-04 09:12:21', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '8504', '5791', 0, 0, 0, 65, 65, 0, 0, 0, 0, 65, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-04', '8679', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 28, '21:49:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(86, 23, 'Rakesh Ji', '8860254190', 'test23456@gmail.com', 28.5555419921875, 77.54370189279089, 'HG4V+FM8, Dadri, Uttar Pradesh 203207, India', 151, '0000-00-00', '08:43:00', '8:43 AM To 9:49 PM', '0000-00-00 00:00:00', '0000-00-00', '09:00:00', '9:00 AM To 10:00 AM', '0000-00-00 00:00:00', '10:00:00', 10, '2022-06-04 09:21:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '9710', '5384', 0, 0, 0, 65, 65, 0, 0, 0, 0, 65, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-04', '8375', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 28, '21:49:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(87, 23, 'Rakesh Ji', '8860254190', 'test23456@gmail.com', 28.5555419921875, 77.54370189279089, 'HG4V+FM8, Dadri, Uttar Pradesh 203207, India', 151, '0000-00-00', '08:43:00', '8:43 AM To 9:49 PM', '0000-00-00 00:00:00', '0000-00-00', '09:00:00', '9:00 AM To 10:00 AM', '0000-00-00 00:00:00', '10:00:00', 10, '2022-06-04 09:22:24', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1574', '9715', 0, 0, 0, 65, 65, 0, 0, 0, 0, 65, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-04', '2658', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 28, '21:49:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(88, 23, 'Rakesh Ji', '8860254190', 'test23456@gmail.com', 28.5555419921875, 77.54370189279089, 'HG4V+FM8, Dadri, Uttar Pradesh 203207, India', 151, '0000-00-00', '08:43:00', '8:43 AM To 9:49 PM', '0000-00-00 00:00:00', '0000-00-00', '09:00:00', '9:00 AM To 10:00 AM', '0000-00-00 00:00:00', '10:00:00', 10, '2022-06-04 09:26:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2679', '6189', 0, 0, 0, 65, 65, 0, 0, 0, 0, 65, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-04', '9830', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 28, '21:49:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(89, 23, 'Rakesh Ji', '8860254190', 'test23456@gmail.com', 28.5555419921875, 77.54370189279089, 'HG4V+FM8, Dadri, Uttar Pradesh 203207, India', 151, '0000-00-00', '08:43:00', '8:43 AM To 9:49 PM', '0000-00-00 00:00:00', '0000-00-00', '09:00:00', '9:00 AM To 10:00 AM', '0000-00-00 00:00:00', '10:00:00', 10, '2022-06-04 09:27:48', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '9280', '7162', 0, 0, 0, 65, 65, 0, 0, 0, 0, 65, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-04', '7018', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, 12, '2023-01-14 04:30:42', 9, '', 28, '21:49:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(90, 23, 'Rakesh Ji', '8860254190', 'test23456@gmail.com', 28.5555419921875, 77.54370189279089, 'HG4V+FM8, Dadri, Uttar Pradesh 203207, India', 151, '0000-00-00', '08:43:00', '8:43 AM To 9:49 PM', '0000-00-00 00:00:00', '0000-00-00', '09:00:00', '9:00 AM To 10:00 AM', '0000-00-00 00:00:00', '10:00:00', 10, '2022-06-04 09:34:57', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2936', '2613', 0, 0, 0, 65, 65, 0, 0, 0, 0, 65, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-04', '7648', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 28, '21:49:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(91, 23, 'Rakesh Ji', '8860254190', 'test23456@gmail.com', 28.5555419921875, 77.54370189279089, 'HG4V+FM8, Dadri, Uttar Pradesh 203207, India', 151, '0000-00-00', '09:00:00', '9:00 AM To 10:00 AM', '0000-00-00 00:00:00', '0000-00-00', '11:00:00', '11:00 AM To 12:00 PM', '0000-00-00 00:00:00', '12:00:00', 2, '2022-06-06 11:22:11', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '9175', '7860', 0, 0, 0, 65, 65, 0, 0, 0, 0, 65, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-06', '2684', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 10, '10:00:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor');
INSERT INTO `booking_list` (`id`, `user_id`, `user_name`, `user_mobile_no`, `user_email_id`, `delivery_lat`, `delivery_long`, `delivery_address`, `delivery_address_id`, `pickup_date`, `pickup_time`, `pickup_time_slot_label`, `pickup_time_org`, `drop_slot_date`, `drop_slot_time`, `drop_time_slot_label`, `drop_slot_time_org`, `drop_slot_time_to`, `drop_slot_id`, `placed_time`, `confirm_time`, `allot_for_pickup_time`, `picked_up_time`, `received_at_loundry_time`, `in_process_time`, `order_ready_time`, `allot_for_drop_time`, `drop_time`, `pickup_otp`, `drop_otp`, `total_item_price`, `tax_percent`, `tax_amt`, `delivery_charge`, `total_amt`, `paid_by_promo`, `paid_by_wallet`, `paid_by_online`, `paid_by_cash`, `skip_for_pay`, `pickup_boy_id`, `pickup_boy_name`, `pickup_boy_number`, `drop_boy_id`, `drop_boy_name`, `drop_boy_number`, `applied_promocode`, `applied_promocode_id`, `add_to_wallet_by_promocode`, `add_to_wallet_by_promo_status`, `invoice_date`, `invoice_number`, `vendor_id`, `vendor_name`, `vendor_mobile_no`, `vendor_lat`, `vendor_long`, `vendor_address`, `country_id`, `country_name`, `country_code`, `currency_name`, `currency_symbol`, `vendor_image`, `cancellation_reason`, `cancelled_by_id`, `cancelled_time`, `booking_status`, `online_transaction_id`, `time_slot_id`, `pickup_time_to`, `pickup_type`, `service_type`, `total_addon`, `vendor_commission`, `company_commission`, `cash_received_by`) VALUES
(92, 34, 'Shivram Varun', '9415964405', 'shivramvarunit@gmail.com', 26.888835999999998, 80.990972, '19/1367, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', 18, '2022-03-29', '09:00:00', '9:00 AM To 10:00 AM', '2022-03-29 09:00:00', '2022-03-30', '09:00:00', '', '2022-03-30 09:00:00', '09:00:00', 1, '2022-06-06 11:33:10', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '4851', '7240', 0, 0, 0, 65, 65, 0, 0, 0, 0, 65, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-06', '8145', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 10, '10:00:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(93, 23, 'Rakesh Ji', '8860254190', 'test23456@gmail.com', 26.888835999999998, 80.990972, '19/1367, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', 18, '2022-03-29', '09:00:00', '9:00 AM To 10:00 AM', '2022-03-29 09:00:00', '2022-03-30', '09:00:00', '', '2022-03-30 09:00:00', '09:00:00', 1, '2022-06-06 11:33:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '4526', '7528', 0, 0, 0, 65, 65, 0, 0, 0, 0, 65, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-06', '0578', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 10, '10:00:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(94, 23, 'Rakesh Ji', '8860254190', 'test23456@gmail.com', 28.5555419921875, 77.54370189279089, 'HG4V+FM8, Dadri, Uttar Pradesh 203207, India', 151, '0000-00-00', '09:00:00', '9:00 AM To 10:00 AM', '0000-00-00 00:00:00', '0000-00-00', '11:00:00', '11:00 AM To 12:00 PM', '0000-00-00 00:00:00', '12:00:00', 2, '2022-06-06 11:36:31', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2051', '4980', 0, 0, 0, 65, 65, 0, 0, 0, 0, 65, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-06', '3025', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 10, '10:00:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(95, 23, 'Rakesh Ji', '8860254190', 'test23456@gmail.com', 28.5555419921875, 77.54370189279089, 'HG4V+FM8, Dadri, Uttar Pradesh 203207, India', 151, '0000-00-00', '09:00:00', '9:00 AM To 10:00 AM', '0000-00-00 00:00:00', '0000-00-00', '11:00:00', '11:00 AM To 12:00 PM', '0000-00-00 00:00:00', '12:00:00', 2, '2022-06-06 11:38:18', '2022-07-21 05:22:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5084', '2850', 0, 0, 0, 65, 65, 0, 0, 0, 0, 65, 18, 'John', '7533577533', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-06', '4215', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 2, '', 10, '10:00:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(96, 54, 'manoj hegde test', '9663028587', 'manoj@smartcricket.com', 12.9307178, 77.5771505, 'WHJG+7VJ, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', 111, '2022-06-07', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-07 09:00:00', '2022-06-10', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-10 10:00:00', '10:00:00', 17, '2022-06-07 12:43:06', '2022-06-16 04:11:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '8954', '3692', 17, 0, 1, 0, 18, 0, 0, 0, 0, 18, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-07', '8671', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 1, '', 10, '10:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(97, 54, 'manoj hegde test', '9663028587', 'manoj@smartcricket.com', 12.9307178, 77.5771505, 'WHJG+7VJ, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', 111, '2022-06-07', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-07 09:00:00', '2022-06-10', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-10 10:00:00', '10:00:00', 17, '2022-06-07 12:43:40', '2022-06-07 12:43:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-06-07 12:44:12', '2022-06-07 12:46:56', '2022-06-07 12:46:57', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '6982', '0123', 10, 0, 0, 0, 10, 0, 0, 0, 0, 10, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-07', '9320', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 6, '', 10, '10:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(98, 54, 'manoj hegde test', '9663028587', 'manoj@smartcricket.com', 12.9307178, 77.5771505, 'WHJG+7VJ, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', 111, '2022-06-07', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-07 09:00:00', '2022-06-10', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-10 10:00:00', '10:00:00', 17, '2022-06-07 12:46:07', '2022-06-07 12:46:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-06-07 12:46:38', '2022-06-07 12:46:53', '2022-06-07 12:46:55', '0000-00-00 00:00:00', '2022-06-07 12:47:43', '9356', '8930', 20, 0, 0, 0, 20, 0, 0, 0, 0, 20, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-07', '6571', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 10, '10:00:00', 'Self', 'Normal', 0, 18, 2, 'vendor'),
(99, 23, 'Rakesh Ji', '8860254190', 'test23456@gmail.com', 22.482131958007812, 88.3765814274545, 'F9JG+RMR, E Block, Ajanta Park, Baghajatin Colony, Kolkata, West Bengal 700086, India', 155, '0000-00-00', '15:00:00', '3:00 PM To 4:00 PM', '0000-00-00 00:00:00', '0000-00-00', '08:43:00', '8:43 AM To 9:49 PM', '0000-00-00 00:00:00', '21:49:00', 28, '2022-06-07 14:57:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0349', '8324', 0, 0, 0, 65, 65, 0, 0, 0, 0, 65, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-07', '3068', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 19, '16:00:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(100, 23, 'Rakesh Ji', '8860254190', 'test23456@gmail.com', 22.482131958007812, 88.3765814274545, 'F9JG+RMR, E Block, Ajanta Park, Baghajatin Colony, Kolkata, West Bengal 700086, India', 155, '0000-00-00', '15:00:00', '3:00 PM To 4:00 PM', '0000-00-00 00:00:00', '0000-00-00', '08:43:00', '8:43 AM To 9:49 PM', '0000-00-00 00:00:00', '21:49:00', 28, '2022-06-07 15:00:12', '2022-06-07 03:31:44', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '4396', '7459', 0, 0, 0, 65, 65, 0, 0, 0, 0, 65, 18, 'John', '7533577533', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-07', '0562', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 2, '', 19, '16:00:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(101, 54, 'manoj hegde test', '9663028587', 'manoj@smartcricket.com', 12.9307178, 77.5771505, 'WHJG+7VJ, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', 111, '2022-06-07', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-07 09:00:00', '2022-06-08', '11:00:00', '11:00 AM To 12:00 PM', '2022-06-08 12:00:00', '12:00:00', 2, '2022-06-07 15:05:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3460', '9140', 17, 0, 1, 0, 18, 0, 0, 0, 0, 18, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-07', '8245', 8, 'Kaile loundry System', '9415964403', 26.8798933, 80.9926327, 'Indira Nagar, Lucknow, Uttar Pradesh, India', 2, 'United Kingdom', '+44', 'Pound', '£', 'kaile.jpeg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 10, '10:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(102, 54, 'manoj hegde test', '9663028587', 'manoj@smartcricket.com', 12.9307178, 77.5771505, 'WHJG+7VJ, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', 111, '2022-06-07', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-07 09:00:00', '2022-06-10', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-10 10:00:00', '10:00:00', 17, '2022-06-07 15:05:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '6245', '4078', 95, 0, 0.5, 0, 95.5, 0, 0, 0, 0, 95.5, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-07', '5269', 8, 'Kaile loundry System', '9415964403', 26.8798933, 80.9926327, 'Indira Nagar, Lucknow, Uttar Pradesh, India', 2, 'United Kingdom', '+44', 'Pound', '£', 'kaile.jpeg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 10, '10:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(103, 51, 'mayttwo', '8401471987', 'madhu@winds.co.in', 26.8421324, 80.9101058, '437, Pandit Rasbihari Tiwari Marg, Moti Jheel Colony, Aishbagh, Lucknow, Uttar Pradesh 226004, India', 157, '2022-06-07', '15:00:00', '3:00 PM To 4:00 PM', '2022-06-07 15:00:00', '2022-06-10', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-10 10:00:00', '10:00:00', 17, '2022-06-07 15:24:07', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2741', '5736', 27, 0, 1, 50, 78, 0, 0, 0, 0, 78, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-07', '7640', 8, 'Kaile loundry System', '9415964403', 26.8798933, 80.9926327, 'Indira Nagar, Lucknow, Uttar Pradesh, India', 2, 'United Kingdom', '+44', 'Pound', '£', 'kaile.jpeg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 11, '16:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(104, 51, 'mayttwo', '8401471987', 'madhu@winds.co.in', 26.8421324, 80.9101058, '437, Pandit Rasbihari Tiwari Marg, Moti Jheel Colony, Aishbagh, Lucknow, Uttar Pradesh 226004, India', 159, '2022-06-07', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-07 09:00:00', '2022-06-10', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-10 10:00:00', '10:00:00', 17, '2022-06-07 15:25:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '7698', '1075', 27, 0, 1, 50, 78, 0, 0, 0, 0, 78, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-07', '6798', 8, 'Kaile loundry System', '9415964403', 26.8798933, 80.9926327, 'Indira Nagar, Lucknow, Uttar Pradesh, India', 2, 'United Kingdom', '+44', 'Pound', '£', 'kaile.jpeg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 10, '10:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(105, 54, 'manoj hegde test', '9663028587', 'manoj@smartcricket.com', 12.9307178, 77.5771505, 'WHJG+7VJ, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', 111, '2022-06-07', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-07 09:00:00', '2022-06-10', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-10 10:00:00', '10:00:00', 17, '2022-06-07 15:31:31', '2022-06-08 11:14:36', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1859', '7126', 37, 0, 1, 0, 38, 0, 0, 0, 0, 38, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-07', '5831', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 1, '', 10, '10:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(106, 54, 'manoj hegde test', '9663028587', 'manoj@smartcricket.com', 12.9307178, 77.5771505, 'WHJG+7VJ, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', 111, '2022-06-07', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-07 09:00:00', '2022-06-10', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-10 10:00:00', '10:00:00', 17, '2022-06-07 17:13:23', '2022-06-07 05:18:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-06-07 17:18:09', '2022-06-07 17:18:24', '2022-06-07 17:18:27', '0000-00-00 00:00:00', '2022-06-07 05:18:59', '7619', '5186', 47, 0, 1, 0, 48, 0, 0, 0, 0, 48, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-07', '3670', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 10, '10:00:00', 'Self', 'Normal', 0, 43, 5, 'vendor'),
(107, 54, 'manoj hegde test', '9663028587', 'manoj@smartcricket.com', 12.9307178, 77.5771505, 'WHJG+7VJ, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', 111, '2022-06-07', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-07 09:00:00', '2022-06-08', '11:00:00', '11:00 AM To 12:00 PM', '2022-06-08 12:00:00', '12:00:00', 2, '2022-06-07 17:19:42', '2022-06-07 05:20:01', '0000-00-00 00:00:00', '2022-06-07 05:20:43', '2022-06-07 17:21:20', '2022-06-07 17:21:30', '2022-06-07 17:21:34', '2022-06-07 05:21:52', '2022-06-07 05:22:36', '6340', '2817', 37, 0, 1, 65, 103, 0, 0, 0, 0, 103, 18, 'John', '7533577533', 18, 'John', '7533577533', NULL, NULL, NULL, NULL, '2022-06-07', '1460', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 10, '10:00:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(108, 54, 'manoj hegde test', '9663028587', 'manoj@smartcricket.com', 12.9307178, 77.5771505, 'WHJG+7VJ, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', 111, '2022-06-07', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-07 09:00:00', '2022-06-08', '11:00:00', '11:00 AM To 12:00 PM', '2022-06-08 12:00:00', '12:00:00', 2, '2022-06-07 17:32:19', '2022-06-07 05:32:54', '0000-00-00 00:00:00', '2022-06-07 06:49:04', '2022-06-07 18:50:13', '2022-06-07 18:50:19', '2022-06-07 18:50:23', '2022-06-07 06:50:33', '2022-06-07 06:51:00', '5076', '0752', 20, 0, 1, 65, 86, 0, 0, 0, 0, 86, 18, 'John', '7533577533', 18, 'John', '7533577533', NULL, NULL, NULL, NULL, '2022-06-07', '4952', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 10, '10:00:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(109, 81, 'Anindita Paul\n\n\n', '9880617669', 'anindita@smartcricket.com', 22.482108399999998, 88.3766436, 'F9JG+RMR, E Block, Ajanta Park, Baghajatin Colony, Kolkata, West Bengal 700086, India', 160, '2022-06-11', '08:43:00', '8:43 AM To 9:49 PM', '2022-06-11 08:43:00', '2022-06-10', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-10 10:00:00', '10:00:00', 17, '2022-06-07 17:38:53', '2022-06-08 02:02:42', '0000-00-00 00:00:00', '2022-06-08 02:22:18', '2022-06-08 14:30:43', '2022-06-08 14:33:56', '2022-06-08 14:35:14', '2022-06-08 02:43:59', '2022-06-08 02:51:58', '0718', '8975', 209, 0, 12, 19, 240, 0, 0, 0, 0, 240, 18, 'John', '7533577533', 18, 'John', '7533577533', NULL, NULL, NULL, NULL, '2022-06-07', '5490', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 28, '21:49:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(110, 54, 'manoj hegde test', '9663028587', 'manoj@smartcricket.com', 12.9307178, 77.5771505, 'WHJG+7VJ, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', 111, '2022-06-07', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-07 09:00:00', '2022-06-08', '11:00:00', '11:00 AM To 12:00 PM', '2022-06-08 12:00:00', '12:00:00', 2, '2022-06-07 18:55:51', '2022-06-07 06:56:10', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '6235', '8520', 47, 0, 1, 65, 113, 0, 0, 0, 0, 113, 18, 'John', '7533577533', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-07', '4125', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 2, '', 10, '10:00:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(111, 54, 'manoj hegde test', '9663028587', 'manoj@smartcricket.com', 12.9307178, 77.5771505, 'WHJG+7VJ, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', 111, '2022-06-08', '11:00:00', '11:00 AM To 12:00 PM', '2022-06-08 11:00:00', '2022-06-10', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-10 10:00:00', '10:00:00', 17, '2022-06-08 11:14:52', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1638', '3674', 27, 0, 1, 19, 47, 0, 0, 0, 0, 47, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-08', '5471', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 2, '12:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(112, 54, 'manoj hegde test', '9663028587', 'manoj@smartcricket.com', 12.9307178, 77.5771505, 'WHJG+7VJ, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', 111, '2022-06-08', '11:00:00', '11:00 AM To 12:00 PM', '2022-06-08 11:00:00', '2022-06-10', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-10 10:00:00', '10:00:00', 17, '2022-06-08 11:15:10', '2022-06-08 11:24:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '7695', '0462', 27, 0, 1, 19, 47, 0, 0, 0, 0, 47, 18, 'John', '7533577533', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-08', '8345', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 2, '', 2, '12:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(113, 54, 'manoj hegde test', '9663028587', 'manoj@smartcricket.com', 12.9307178, 77.5771505, 'WHJG+7VJ, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', 111, '2022-06-08', '11:00:00', '11:00 AM To 12:00 PM', '2022-06-08 11:00:00', '2022-06-10', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-10 10:00:00', '10:00:00', 17, '2022-06-08 11:52:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2946', '1457', 37, 0, 1, 19, 57, 0, 0, 0, 0, 57, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-08', '1083', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 2, '12:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(114, 54, 'manoj hegde test', '9663028587', 'manoj@smartcricket.com', 12.9307178, 77.5771505, 'WHJG+7VJ, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', 111, '2022-06-08', '11:00:00', '11:00 AM To 12:00 PM', '2022-06-08 11:00:00', '2022-06-10', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-10 10:00:00', '10:00:00', 17, '2022-06-08 11:53:05', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '7918', '9360', 37, 0, 1, 19, 57, 0, 0, 0, 0, 57, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-08', '4310', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 2, '12:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(115, 54, 'manoj hegde test', '9663028587', 'manoj@smartcricket.com', 12.9307178, 77.5771505, 'WHJG+7VJ, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', 111, '2022-06-08', '11:00:00', '11:00 AM To 12:00 PM', '2022-06-08 11:00:00', '2022-06-10', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-10 10:00:00', '10:00:00', 17, '2022-06-08 11:53:43', '2022-06-08 11:54:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '4529', '5016', 17, 0, 0, 19, 36, 0, 0, 0, 0, 36, 18, 'John', '7533577533', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-08', '8143', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 2, '', 2, '12:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(116, 54, 'manoj hegde test', '9663028587', 'manoj@smartcricket.com', 12.9307178, 77.5771505, 'WHJG+7VJ, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', 111, '2022-06-08', '11:00:00', '11:00 AM To 12:00 PM', '2022-06-08 11:00:00', '2022-06-10', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-10 10:00:00', '10:00:00', 17, '2022-06-08 12:50:28', '2022-07-21 05:23:49', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '7193', '7601', 17, 0, 0, 19, 36, 0, 0, 0, 0, 36, 18, 'John', '7533577533', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-08', '8649', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 2, '', 2, '12:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(117, 54, 'manoj hegde test', '9663028587', 'manoj@smartcricket.com', 12.9307178, 77.5771505, 'WHJG+7VJ, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', 111, '2022-06-08', '11:00:00', '11:00 AM To 12:00 PM', '2022-06-08 11:00:00', '2022-06-10', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-10 10:00:00', '10:00:00', 17, '2022-06-08 12:51:50', '2022-06-08 07:22:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '8152', '9056', 30, 0, 1, 19, 50, 0, 0, 0, 0, 50, 18, 'John', '7533577533', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-08', '2641', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 2, '', 2, '12:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(118, 54, 'manoj hegde test', '9663028587', 'manoj@smartcricket.com', 12.9307178, 77.5771505, 'WHJG+7VJ, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', 111, '2022-06-08', '11:00:00', '11:00 AM To 12:00 PM', '2022-06-08 11:00:00', '2022-06-10', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-10 10:00:00', '10:00:00', 17, '2022-06-08 12:52:13', '2022-06-08 05:21:44', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1579', '7945', 30, 0, 1, 19, 50, 0, 0, 0, 0, 50, 18, 'John', '7533577533', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-08', '4972', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 2, '', 2, '12:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(119, 54, 'manoj hegde test', '9663028587', 'manoj@smartcricket.com', 12.9307178, 77.5771505, 'WHJG+7VJ, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', 111, '2022-06-08', '11:00:00', '11:00 AM To 12:00 PM', '2022-06-08 11:00:00', '2022-06-10', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-10 10:00:00', '10:00:00', 17, '2022-06-08 14:59:21', '2022-06-08 02:59:27', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-06-08 14:59:41', '2022-06-11 23:17:19', '2022-06-11 23:17:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '8197', '2064', 30, 0, 1, 0, 31, 0, 0, 0, 0, 31, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-08', '4516', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 6, '', 2, '12:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(120, 54, 'manoj hegde test', '9663028587', 'manoj@smartcricket.com', 12.9307178, 77.5771505, 'WHJG+7VJ, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', 111, '2022-06-08', '11:00:00', '11:00 AM To 12:00 PM', '2022-06-08 11:00:00', '2022-06-10', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-10 10:00:00', '10:00:00', 17, '2022-06-08 15:14:41', '2022-06-08 03:14:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-06-08 15:15:00', '2022-06-08 15:15:12', '2022-06-08 15:15:17', '0000-00-00 00:00:00', '2022-06-08 03:15:57', '1684', '6435', 17, 0, 1, 0, 18, 0, 0, 0, 0, 18, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-08', '9841', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 2, '12:00:00', 'Self', 'Normal', 0, 16, 2, 'vendor'),
(121, 81, 'Anindita Paul\n\n\n', '9880617669', 'anindita@smartcricket.com', 22.482108399999998, 88.3766436, 'F9JG+RMR, E Block, Ajanta Park, Baghajatin Colony, Kolkata, West Bengal 700086, India', 161, '2022-06-08', '11:00:00', '11:00 AM To 12:00 PM', '2022-06-08 11:00:00', '2022-06-10', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-10 10:00:00', '10:00:00', 17, '2022-06-08 16:44:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1028', '9561', 40, 0, 0.4, 0, 40.4, 0, 0, 0, 0, 40.4, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-08', '8765', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, 12, '2022-06-08 04:45:31', 9, '', 2, '12:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(122, 54, 'manoj hegde test', '9663028587', 'manoj@smartcricket.com', 12.9307178, 77.5771505, 'WHJG+7VJ, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', 111, '2022-06-08', '11:00:00', '11:00 AM To 12:00 PM', '2022-06-08 11:00:00', '2022-06-10', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-10 10:00:00', '10:00:00', 17, '2022-06-08 17:20:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '4328', '4510', 27, 0, 1, 19, 47, 0, 0, 0, 0, 47, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-08', '4231', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, 12, '2022-06-08 05:20:15', 9, '', 2, '12:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(123, 54, 'manoj hegde test', '9663028587', 'manoj@smartcricket.com', 12.9307178, 77.5771505, 'WHJG+7VJ, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', 111, '2022-06-08', '11:00:00', '11:00 AM To 12:00 PM', '2022-06-08 11:00:00', '2022-06-10', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-10 10:00:00', '10:00:00', 17, '2022-06-08 17:22:11', '2022-06-08 05:22:19', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-06-08 17:22:37', '2022-06-08 17:31:48', '2022-06-08 17:31:53', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '8123', '0587', 37, 0, 1, 0, 38, 0, 0, 0, 0, 38, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-08', '8704', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 6, '', 2, '12:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(124, 81, 'Anindita Paul\n\n\n', '9880617669', 'anindita@smartcricket.com', 22.482108399999998, 88.3766436, 'F9JG+RMR, E Block, Ajanta Park, Baghajatin Colony, Kolkata, West Bengal 700086, India', 162, '2022-06-08', '11:00:00', '11:00 AM To 12:00 PM', '2022-06-08 11:00:00', '2022-06-10', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-10 10:00:00', '10:00:00', 17, '2022-06-08 17:26:22', '2022-06-08 05:26:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-06-08 17:26:45', '2022-06-08 17:26:55', '2022-06-08 17:26:59', '0000-00-00 00:00:00', '2022-06-08 05:27:34', '2971', '4269', 150, 0, 0, 0, 150, 0, 0, 0, 0, 150, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-08', '8793', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 2, '12:00:00', 'Self', 'Normal', 0, 135, 15, 'vendor'),
(125, 81, 'Anindita Paul\n\n\n', '9880617669', 'anindita@smartcricket.com', 22.482108399999998, 88.3766436, 'F9JG+RMR, E Block, Ajanta Park, Baghajatin Colony, Kolkata, West Bengal 700086, India', 163, '2022-06-08', '11:00:00', '11:00 AM To 12:00 PM', '2022-06-08 11:00:00', '2022-06-10', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-10 10:00:00', '10:00:00', 17, '2022-06-08 17:28:28', '2022-06-08 05:29:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-06-08 17:29:25', '2022-06-08 17:29:36', '2022-06-08 17:29:40', '0000-00-00 00:00:00', '2022-06-08 05:30:17', '5197', '0268', 100, 0, 10, 0, 110, 0, 0, 0, 0, 110, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-08', '7539', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 2, '12:00:00', 'Self', 'Normal', 0, 100, 10, 'vendor'),
(126, 81, 'Anindita Paul\n\n\n', '9880617669', 'anindita@smartcricket.com', 22.482108399999998, 88.3766436, 'F9JG+RMR, E Block, Ajanta Park, Baghajatin Colony, Kolkata, West Bengal 700086, India', 164, '2022-06-08', '11:00:00', '11:00 AM To 12:00 PM', '2022-06-08 11:00:00', '2022-06-10', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-10 10:00:00', '10:00:00', 17, '2022-06-08 17:31:34', '2022-06-08 05:32:11', '0000-00-00 00:00:00', '2022-06-08 05:33:02', '2022-06-08 17:33:46', '2022-06-08 17:33:49', '2022-06-08 17:33:52', '2022-06-08 05:36:16', '2022-06-08 05:36:40', '3502', '5218', 12, 0, 0.12, 65, 77.12, 0, 0, 0, 0, 77.12, 18, 'John', '7533577533', 18, 'John', '7533577533', NULL, NULL, NULL, NULL, '2022-06-08', '4372', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 2, '12:00:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(127, 81, 'Anindita Paul\n\n\n', '9880617669', 'anindita@smartcricket.com', 22.482108399999998, 88.3766436, 'F9JG+RMR, E Block, Ajanta Park, Baghajatin Colony, Kolkata, West Bengal 700086, India', 165, '2022-06-08', '11:00:00', '11:00 AM To 12:00 PM', '2022-06-08 11:00:00', '2022-06-10', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-10 10:00:00', '10:00:00', 17, '2022-06-08 17:54:08', '2022-06-08 05:54:27', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-06-08 17:54:33', '2022-06-08 17:59:25', '2022-06-08 17:59:35', '0000-00-00 00:00:00', '2022-06-08 06:00:56', '8547', '9108', 12, 0, 0.12, 0, 12.12, 0, 0, 0, 0, 12.12, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-08', '4263', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 2, '12:00:00', 'Self', 'Normal', 0, 11, 1, 'vendor'),
(128, 81, 'Anindita Paul\n\n\n', '9880617669', 'anindita@smartcricket.com', 26.822953, 80.9570225, '38/1, Nehru Enclave, Lucknow, Cantonment Rd, Neil Lines, Cantonment, Lucknow, Uttar Pradesh 226002, ', 74, '2022-06-08', '11:00:00', '11:00 AM To 12:00 PM', '2022-06-08 11:00:00', '2022-06-10', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-10 10:00:00', '10:00:00', 17, '2022-06-08 18:42:12', '2022-06-08 06:43:07', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-06-08 18:43:22', '2022-06-08 18:43:38', '2022-06-08 18:43:40', '0000-00-00 00:00:00', '2022-06-15 06:25:19', '6381', '7258', 100, 0, 10, 0, 110, 0, 0, 0, 0, 110, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-08', '7502', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 2, '12:00:00', 'Self', 'Normal', 0, 100, 10, 'vendor'),
(129, 81, 'Anindita Paul\n\n\n', '9880617669', 'anindita@smartcricket.com', 26.822953, 80.9570225, '38/1, Nehru Enclave, Lucknow, Cantonment Rd, Neil Lines, Cantonment, Lucknow, Uttar Pradesh 226002, ', 74, '2022-06-08', '11:00:00', '11:00 AM To 12:00 PM', '2022-06-08 11:00:00', '2022-06-10', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-10 10:00:00', '10:00:00', 17, '2022-06-08 21:46:11', '2022-06-08 09:46:37', '0000-00-00 00:00:00', '2022-06-08 09:48:45', '2022-06-08 21:49:00', '2022-06-08 21:49:10', '2022-06-08 21:49:24', '2022-06-08 09:49:37', '2022-06-13 10:51:03', '9506', '4072', 260, 0, 10, 19, 289, 0, 0, 0, 0, 289, 18, 'John', '7533577533', 18, 'John', '7533577533', NULL, NULL, NULL, NULL, '2022-06-08', '2943', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 2, '12:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(130, 23, 'Rakesh Ji', '8860254190', 'test23456@gmail.com', 28.5555419921875, 77.54370189279089, 'HG4V+FM8, Dadri, Uttar Pradesh 203207, India', 151, '0000-00-00', '09:00:00', '9:00 AM To 10:00 AM', '0000-00-00 00:00:00', '0000-00-00', '11:00:00', '11:00 AM To 12:00 PM', '0000-00-00 00:00:00', '12:00:00', 2, '2022-06-11 00:05:48', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2469', '1507', 0, 0, 0, 65, 65, 0, 0, 0, 0, 65, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-11', '4018', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 10, '10:00:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(131, 23, 'Rakesh Ji', '8860254190', 'test23456@gmail.com', 28.5555419921875, 77.54370189279089, 'HG4V+FM8, Dadri, Uttar Pradesh 203207, India', 151, '2022-06-11', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-11 09:00:00', '2022-06-12', '11:00:00', '11:00 AM To 12:00 PM', '2022-06-12 12:00:00', '12:00:00', 2, '2022-06-11 00:06:36', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '7145', '2539', 0, 0, 0, 65, 65, 0, 0, 0, 0, 65, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-11', '6483', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 10, '10:00:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(132, 23, 'Rakesh Ji', '8860254190', 'test23456@gmail.com', 28.5555419921875, 77.54370189279089, 'HG4V+FM8, Dadri, Uttar Pradesh 203207, India', 151, '2022-06-11', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-11 09:00:00', '2022-06-12', '11:00:00', '11:00 AM To 12:00 PM', '2022-06-12 12:00:00', '12:00:00', 2, '2022-06-11 00:07:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '7830', '8049', 0, 0, 0, 65, 65, 0, 0, 0, 0, 65, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-11', '8920', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 10, '10:00:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(133, 23, 'Rakesh Ji', '8860254190', 'test23456@gmail.com', 28.5555419921875, 77.54370189279089, 'HG4V+FM8, Dadri, Uttar Pradesh 203207, India', 151, '2022-06-11', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-11 09:00:00', '2022-06-12', '11:00:00', '11:00 AM To 12:00 PM', '2022-06-12 12:00:00', '12:00:00', 2, '2022-06-14 00:00:10', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5910', '1359', 17, 0, 1, 65, 83, 0, 0, 0, 0, 83, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-14', '2486', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 10, '10:00:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(134, 23, 'Rakesh Ji', '8860254190', 'test23456@gmail.com', 28.5555419921875, 77.54370189279089, 'HG4V+FM8, Dadri, Uttar Pradesh 203207, India', 151, '0000-00-00', '09:00:00', '9:00 AM To 10:00 AM', '0000-00-00 00:00:00', '0000-00-00', '09:00:00', '9:00 AM To 10:00 AM', '0000-00-00 00:00:00', '10:00:00', 17, '2022-06-14 12:21:42', '2022-07-21 05:30:09', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1579', '1793', 17, 0, 1, 65, 83, 0, 0, 0, 0, 83, 18, 'John', '7533577533', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-14', '7362', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 2, '', 10, '10:00:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(135, 23, 'Rakesh Ji', '8860254190', 'test23456@gmail.com', 28.5555419921875, 77.54370189279089, 'HG4V+FM8, Dadri, Uttar Pradesh 203207, India', 151, '0000-00-00', '09:00:00', '9:00 AM To 10:00 AM', '0000-00-00 00:00:00', '0000-00-00', '09:00:00', '9:00 AM To 10:00 AM', '0000-00-00 00:00:00', '10:00:00', 17, '2022-06-14 21:10:52', '2022-07-21 05:25:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '9671', '8105', 27, 0, 1, 65, 93, 0, 0, 0, 0, 93, 18, 'John', '7533577533', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-14', '3710', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 2, '', 10, '10:00:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(136, 81, 'Anindita Paul\n\n\n', '9880617669', 'anindita@smartcricket.com', 12.9304825, 77.5771666, 'WHJG+5VV, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', 168, '2022-06-15', '11:00:00', '11:00 AM To 12:00 PM', '2022-06-15 11:00:00', '2022-06-17', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-17 10:00:00', '10:00:00', 17, '2022-06-15 17:36:26', '2022-06-15 05:41:47', '0000-00-00 00:00:00', '2022-06-15 05:42:20', '2022-06-15 17:42:52', '2022-06-15 17:43:27', '2022-06-15 17:43:46', '2022-06-15 05:44:51', '2022-06-15 05:45:43', '9217', '5489', 263, 0, 6.08, 65, 334.08, 0, 0, 0, 0, 334.08, 18, 'John', '7533577533', 18, 'John', '7533577533', NULL, NULL, NULL, NULL, '2022-06-15', '9620', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 2, '12:00:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor');
INSERT INTO `booking_list` (`id`, `user_id`, `user_name`, `user_mobile_no`, `user_email_id`, `delivery_lat`, `delivery_long`, `delivery_address`, `delivery_address_id`, `pickup_date`, `pickup_time`, `pickup_time_slot_label`, `pickup_time_org`, `drop_slot_date`, `drop_slot_time`, `drop_time_slot_label`, `drop_slot_time_org`, `drop_slot_time_to`, `drop_slot_id`, `placed_time`, `confirm_time`, `allot_for_pickup_time`, `picked_up_time`, `received_at_loundry_time`, `in_process_time`, `order_ready_time`, `allot_for_drop_time`, `drop_time`, `pickup_otp`, `drop_otp`, `total_item_price`, `tax_percent`, `tax_amt`, `delivery_charge`, `total_amt`, `paid_by_promo`, `paid_by_wallet`, `paid_by_online`, `paid_by_cash`, `skip_for_pay`, `pickup_boy_id`, `pickup_boy_name`, `pickup_boy_number`, `drop_boy_id`, `drop_boy_name`, `drop_boy_number`, `applied_promocode`, `applied_promocode_id`, `add_to_wallet_by_promocode`, `add_to_wallet_by_promo_status`, `invoice_date`, `invoice_number`, `vendor_id`, `vendor_name`, `vendor_mobile_no`, `vendor_lat`, `vendor_long`, `vendor_address`, `country_id`, `country_name`, `country_code`, `currency_name`, `currency_symbol`, `vendor_image`, `cancellation_reason`, `cancelled_by_id`, `cancelled_time`, `booking_status`, `online_transaction_id`, `time_slot_id`, `pickup_time_to`, `pickup_type`, `service_type`, `total_addon`, `vendor_commission`, `company_commission`, `cash_received_by`) VALUES
(137, 81, 'Anindita Paul\n\n\n', '9880617669', 'anindita@smartcricket.com', 26.8309535, 80.9244566, 'Lucknow, Kanpur - Lucknow Rd, Preeti Nagar, Mawaiyya, Charbagh, Lucknow, Uttar Pradesh 226004, India', 79, '2022-06-17', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-17 09:00:00', '2022-06-18', '08:43:00', '8:43 AM To 9:49 PM', '2022-06-18 21:49:00', '21:49:00', 28, '2022-06-16 10:57:17', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1042', '2697', 151, 0, 0.99, 19, 170.99, 0, 0, 0, 0, 170.99, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-16', '6483', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, 12, '2022-06-16 11:41:39', 9, '', 17, '10:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(138, 81, 'Anindita Paul\n\n\n', '9880617669', 'anindita@smartcricket.com', 26.8309535, 80.9244566, 'Lucknow, Kanpur - Lucknow Rd, Preeti Nagar, Mawaiyya, Charbagh, Lucknow, Uttar Pradesh 226004, India', 79, '2022-06-17', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-17 09:00:00', '2022-06-18', '08:43:00', '8:43 AM To 9:49 PM', '2022-06-18 21:49:00', '21:49:00', 28, '2022-06-16 11:09:42', '2022-06-16 11:35:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-08-28 14:14:36', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2409', '4186', 150, 0, 0, 0, 150, 0, 0, 0, 0, 150, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-16', '6259', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 4, '', 17, '10:00:00', 'Self', 'Express', 0, 0, 0, 'vendor'),
(139, 81, 'Anindita Paul\n\n\n', '9880617669', 'anindita@smartcricket.com', 26.8309535, 80.9244566, 'Lucknow, Kanpur - Lucknow Rd, Preeti Nagar, Mawaiyya, Charbagh, Lucknow, Uttar Pradesh 226004, India', 79, '2022-06-17', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-17 09:00:00', '2022-06-18', '08:43:00', '8:43 AM To 9:49 PM', '2022-06-18 21:49:00', '21:49:00', 28, '2022-06-16 11:46:44', '2022-06-16 11:47:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-06-16 11:47:32', '2022-06-16 11:48:17', '2022-06-16 11:48:21', '0000-00-00 00:00:00', '2022-06-16 11:49:19', '4603', '7604', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-16', '0327', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 17, '10:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(140, 81, 'Anindita Paul\n\n\n', '9880617669', 'anindita@smartcricket.com', 26.8309535, 80.9244566, 'Lucknow, Kanpur - Lucknow Rd, Preeti Nagar, Mawaiyya, Charbagh, Lucknow, Uttar Pradesh 226004, India', 79, '2022-06-17', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-17 09:00:00', '2022-06-17', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-17 10:00:00', '10:00:00', 17, '2022-06-16 11:54:13', '2022-06-16 11:57:33', '0000-00-00 00:00:00', '2022-06-16 12:01:08', '2022-06-16 12:03:19', '2022-06-16 12:04:01', '2022-06-16 12:05:42', '2022-06-16 12:06:29', '2022-06-16 12:09:51', '3769', '7632', 243, 0, 1.11, 65, 309.11, 0, 0, 0, 0, 309.11, 18, 'John', '7533577533', 18, 'John', '7533577533', NULL, NULL, NULL, NULL, '2022-06-16', '5972', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 17, '10:00:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(141, 81, 'Anindita Paul\n\n\n', '9880617669', 'anindita@smartcricket.com', 26.8309535, 80.9244566, 'Lucknow, Kanpur - Lucknow Rd, Preeti Nagar, Mawaiyya, Charbagh, Lucknow, Uttar Pradesh 226004, India', 79, '2022-06-17', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-17 09:00:00', '2022-06-18', '08:43:00', '8:43 AM To 9:49 PM', '2022-06-18 21:49:00', '21:49:00', 28, '2022-06-16 12:13:53', '2022-06-16 12:21:46', '0000-00-00 00:00:00', '2022-06-16 12:22:23', '2022-06-16 12:22:33', '2022-06-16 12:22:51', '2022-06-16 12:22:54', '2022-06-16 12:23:11', '2022-06-16 12:26:57', '5293', '2840', 199, 0, 3.12, 19, 221.12, 0, 0, 0, 0, 221.12, 18, 'John', '7533577533', 18, 'John', '7533577533', NULL, NULL, NULL, NULL, '2022-06-16', '3678', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 17, '10:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(142, 81, 'Anindita Paul\n\n\n', '9880617669', 'anindita@smartcricket.com', 26.8309535, 80.9244566, 'Lucknow, Kanpur - Lucknow Rd, Preeti Nagar, Mawaiyya, Charbagh, Lucknow, Uttar Pradesh 226004, India', 79, '2022-06-17', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-17 09:00:00', '2022-06-17', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-17 10:00:00', '10:00:00', 17, '2022-06-16 12:31:39', '2022-06-16 12:33:26', '0000-00-00 00:00:00', '2022-06-16 12:34:10', '2022-06-16 12:35:17', '2022-06-16 12:35:25', '2022-06-16 12:35:41', '2022-06-16 12:35:50', '2022-06-16 12:36:22', '6597', '4369', 26, 0, 0.12, 65, 91.12, 0, 0, 0, 0, 91.12, 18, 'John', '7533577533', 18, 'John', '7533577533', NULL, NULL, NULL, NULL, '2022-06-16', '7268', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1652788078h1XM3jyqScreenshot_20220419_114542.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 17, '10:00:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(143, 81, 'Anindita Paul\n\n\n', '9880617669', 'anindita@smartcricket.com', 26.8309535, 80.9244566, 'Lucknow, Kanpur - Lucknow Rd, Preeti Nagar, Mawaiyya, Charbagh, Lucknow, Uttar Pradesh 226004, India', 79, '2022-06-17', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-17 09:00:00', '2022-06-17', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-17 10:00:00', '10:00:00', 17, '2022-06-16 14:49:51', '2022-06-16 03:02:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-06-16 15:03:03', '2022-06-16 15:03:15', '2022-06-16 15:16:07', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1470', '5367', 10, 0, 1, 0, 11, 0, 0, 0, 0, 11, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-16', '4592', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 6, '', 17, '10:00:00', 'Self', 'Express', 0, 0, 0, 'vendor'),
(144, 81, 'Anindita Paul\n\n\n', '9880617669', 'anindita@smartcricket.com', 26.8309535, 80.9244566, 'Lucknow, Kanpur - Lucknow Rd, Preeti Nagar, Mawaiyya, Charbagh, Lucknow, Uttar Pradesh 226004, India', 79, '2022-06-17', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-17 09:00:00', '2022-06-20', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-20 10:00:00', '10:00:00', 7, '2022-06-16 15:06:21', '2022-06-16 03:06:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-06-16 15:07:31', '2022-06-16 15:10:31', '2022-06-16 15:11:06', '0000-00-00 00:00:00', '2022-06-16 03:17:04', '6819', '7218', 150, 0, 0, 0, 150, 0, 0, 0, 0, 150, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-16', '0482', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 17, '10:00:00', 'Self', 'Normal', 0, 135, 15, 'vendor'),
(145, 81, 'Anindita Paul\n\n\n', '9880617669', 'anindita@smartcricket.com', 26.8309535, 80.9244566, 'Lucknow, Kanpur - Lucknow Rd, Preeti Nagar, Mawaiyya, Charbagh, Lucknow, Uttar Pradesh 226004, India', 79, '2022-06-17', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-17 09:00:00', '2022-06-18', '11:00:00', '11:00 AM To 10:30 PM', '2022-06-18 22:30:00', '22:30:00', 34, '2022-06-16 15:26:05', '2022-06-16 03:26:26', '0000-00-00 00:00:00', '2022-06-16 03:26:57', '2022-06-16 15:27:05', '2022-06-16 15:27:28', '2022-06-16 15:27:36', '2022-06-16 03:27:48', '2022-06-16 03:28:07', '0284', '9471', 177, 0, 1, 19, 197, 0, 0, 0, 0, 197, 18, 'John', '7533577533', 18, 'John', '7533577533', NULL, NULL, NULL, NULL, '2022-06-16', '4715', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 17, '10:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(146, 81, 'Anindita Paul\n\n\n', '9880617669', 'anindita@smartcricket.com', 26.8309535, 80.9244566, 'Lucknow, Kanpur - Lucknow Rd, Preeti Nagar, Mawaiyya, Charbagh, Lucknow, Uttar Pradesh 226004, India', 79, '2022-06-17', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-17 09:00:00', '2022-06-18', '11:00:00', '11:00 AM To 10:30 PM', '2022-06-18 22:30:00', '22:30:00', 34, '2022-06-16 15:36:46', '2022-06-16 03:37:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-06-16 15:37:04', '2022-06-16 15:37:17', '2022-06-16 15:37:20', '0000-00-00 00:00:00', '2022-06-16 03:37:41', '9826', '3071', 10, 0, 1, 0, 11, 0, 0, 0, 0, 11, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-16', '5340', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 17, '10:00:00', 'Self', 'Normal', 0, 10, 1, 'vendor'),
(147, 81, 'Anindita Paul\n\n\n', '9880617669', 'anindita@smartcricket.com', 26.8309535, 80.9244566, 'Lucknow, Kanpur - Lucknow Rd, Preeti Nagar, Mawaiyya, Charbagh, Lucknow, Uttar Pradesh 226004, India', 79, '2022-06-17', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-17 09:00:00', '2022-06-18', '11:00:00', '11:00 AM To 10:30 PM', '2022-06-18 22:30:00', '22:30:00', 34, '2022-06-16 16:11:39', '2022-06-16 04:11:52', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-06-16 16:15:44', '2022-07-25 15:18:30', '2022-08-28 14:14:55', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '8504', '7965', 10, 0, 1, 0, 11, 0, 0, 0, 0, 11, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-16', '9348', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 6, '', 17, '10:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(148, 81, 'Anindita Paul\n\n\n', '9880617669', 'anindita@smartcricket.com', 26.8309535, 80.9244566, 'Lucknow, Kanpur - Lucknow Rd, Preeti Nagar, Mawaiyya, Charbagh, Lucknow, Uttar Pradesh 226004, India', 79, '2022-06-17', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-17 09:00:00', '2022-06-18', '11:00:00', '11:00 AM To 10:30 PM', '2022-06-18 22:30:00', '22:30:00', 34, '2022-06-16 18:12:58', '2022-06-23 04:10:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '7610', '7845', 10, 0, 1, 19, 30, 0, 0, 0, 0, 30, 14, 'ug8g', '5555555555', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-16', '7630', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 2, '', 17, '10:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(149, 81, 'Anindita Paul\n\n\n', '9880617669', 'anindita@smartcricket.com', 26.8309535, 80.9244566, 'Lucknow, Kanpur - Lucknow Rd, Preeti Nagar, Mawaiyya, Charbagh, Lucknow, Uttar Pradesh 226004, India', 79, '2022-06-17', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-17 09:00:00', '2022-06-20', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-20 10:00:00', '10:00:00', 7, '2022-06-17 13:18:49', '2022-06-17 01:19:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-06-17 13:19:25', '2022-06-17 13:19:40', '2022-06-17 13:19:42', '0000-00-00 00:00:00', '2022-06-17 01:20:16', '7059', '7145', 27, 0, 1, 0, 28, 0, 0, 0, 0, 28, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-17', '1923', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 17, '10:00:00', 'Self', 'Normal', 0, 25, 3, 'vendor'),
(150, 81, 'Anindita Paul\n\n\n', '9880617669', 'anindita@smartcricket.com', 26.8309535, 80.9244566, 'Lucknow, Kanpur - Lucknow Rd, Preeti Nagar, Mawaiyya, Charbagh, Lucknow, Uttar Pradesh 226004, India', 79, '2022-06-17', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-17 09:00:00', '2022-06-20', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-20 10:00:00', '10:00:00', 7, '2022-06-17 13:20:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '7394', '3012', 126, 0, 1, 19, 146, 0, 0, 0, 0, 146, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-17', '4091', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 17, '10:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(151, 5, 'Veer bhanu pratap singh', '9415964404', 'veer11@gmail.com', 26.889149, 80.9910692, '106 om apartment first floor Sec 17, Chandanapur, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', 169, '2022-06-24', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-24 09:00:00', '2022-06-25', '11:00:00', '11:00 AM To 10:30 PM', '2022-06-25 22:30:00', '22:30:00', 34, '2022-06-23 16:08:46', '2022-06-23 04:10:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-06-23 16:10:37', '2022-07-21 16:46:42', '2022-07-21 16:48:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '7325', '4012', 17, 0, 1, 0, 18, 0, 0, 0, 0, 18, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-23', '4376', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 6, '', 17, '10:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(152, 81, 'Anindita Paul\n\n\n', '9880617669', 'anindita@smartcricket.com', 26.8309535, 80.9244566, 'Lucknow, Kanpur - Lucknow Rd, Preeti Nagar, Mawaiyya, Charbagh, Lucknow, Uttar Pradesh 226004, India', 79, '2022-06-28', '09:00:00', '9:00 AM To 10:00 AM', '2022-06-28 09:00:00', '2022-07-01', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-01 10:00:00', '10:00:00', 17, '2022-06-28 13:16:41', '2022-06-28 01:17:39', '0000-00-00 00:00:00', '2022-06-28 01:18:23', '2022-06-28 13:18:47', '2022-06-28 13:19:29', '2022-06-28 13:19:32', '2022-06-28 01:20:34', '2022-06-28 01:21:27', '5078', '1269', 109, 0, 0, 19, 128, 0, 0, 0, 0, 128, 18, 'John', '7533577533', 18, 'John', '7533577533', NULL, NULL, NULL, NULL, '2022-06-28', '1768', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 10, '10:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(153, 10, 'Varun Tyagi', '7007629729', 'harshitgupta72@gmail.com', 26.889142200000002, 80.9910355, 'Om Plaza, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', 173, '2022-07-01', '15:00:00', '3:00 PM To 4:00 PM', '2022-07-01 15:00:00', '2022-07-04', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-04 10:00:00', '10:00:00', 7, '2022-06-29 16:34:04', '2022-06-29 04:34:44', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-07-21 16:59:19', '2022-07-21 16:59:37', '2022-07-21 16:59:51', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '7891', '1729', 17, 0, 1, 0, 18, 0, 0, 0, 0, 18, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-29', '3450', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 6, '', 19, '16:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(154, 8, 'Harshit Gupta', 'harshitgupta72@gmail.com', '7007629729', 26.8890858, 80.99107599999999, 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', 39, '2022-06-29', '11:00:00', '11:00 AM To 12:00 PM', '2022-06-29 11:00:00', '2022-07-01', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-01 10:00:00', '10:00:00', 17, '2022-06-29 16:58:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '6495', '2053', 17, 0, 1, 0, 18, 0, 0, 0, 0, 18, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-29', '2938', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, 12, '2022-06-29 04:59:10', 9, '', 2, '12:00:00', 'Self', 'Normal', 0, 0, 0, 'vendor'),
(155, 80, 'ty', '9415964412', 'ty@gmail.com', 26.8890858, 80.99107599999999, 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', 58, '2022-06-29', '11:00:00', '11:00 AM To 12:00 PM', '2022-06-29 11:00:00', '2022-07-01', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-01 10:00:00', '10:00:00', 17, '2022-06-29 17:05:25', '2022-06-29 05:05:30', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-06-29 17:06:38', '2022-06-29 17:06:48', '2022-06-29 17:07:05', '0000-00-00 00:00:00', '2022-06-29 05:07:33', '4920', '9578', 99, 0, 0, 0, 99, 0, 0, 0, 0, 99, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-29', '4265', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 2, '12:00:00', 'Self', 'Normal', 0, 89, 10, 'vendor'),
(156, 80, 'ty', '9415964412', 'ty@gmail.com', 26.8890858, 80.99107599999999, 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', 58, '2022-06-29', '11:00:00', '11:00 AM To 12:00 PM', '2022-06-29 11:00:00', '2022-07-01', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-01 10:00:00', '10:00:00', 17, '2022-06-29 17:09:55', '2022-06-29 06:00:09', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2941', '1840', 17, 0, 1, 65, 83, 0, 0, 0, 0, 83, 14, 'ug8g', '5555555555', 0, '', '', NULL, NULL, NULL, NULL, '2022-06-29', '3285', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 2, '', 2, '12:00:00', 'Home Delivery', 'Express', 0, 0, 0, 'vendor'),
(157, 55, 'Jawa Bharath ', '8548878007', 'bharath@gaamesunlimited.com', 26.845149499999998, 80.9518626, 'INSIDE LUCKNOW ZOO, RXW2+3P5, Narhi, Hazratganj, Lucknow, Uttar Pradesh 226001, India', 136, '2022-07-09', '11:00:00', '11:00 AM To 10:30 PM', '2022-07-09 11:00:00', '2022-07-11', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-11 10:00:00', '10:00:00', 7, '2022-07-09 16:30:36', '2022-07-09 04:31:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-07-09 16:31:20', '2022-07-09 16:32:07', '2022-07-09 16:33:09', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1649', '9746', 27, 0, 2, 0, 32, 0, 0, 0, 0, 32, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-07-09', '4271', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 6, '', 34, '22:30:00', 'Self', 'Normal', 3, 0, 0, 'vendor'),
(158, 81, 'Anindita Paul\n\n\n', '9880617669', 'anindita@smartcricket.com', 26.8309535, 80.9244566, 'Lucknow, Kanpur - Lucknow Rd, Preeti Nagar, Mawaiyya, Charbagh, Lucknow, Uttar Pradesh 226004, India', 79, '2022-07-12', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-12 09:00:00', '2022-07-13', '11:00:00', '11:00 AM To 12:00 PM', '2022-07-13 12:00:00', '12:00:00', 2, '2022-07-11 12:00:30', '2022-07-11 12:02:51', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-07-11 12:03:01', '2022-07-11 12:04:15', '2022-07-11 12:13:05', '0000-00-00 00:00:00', '2022-07-11 12:30:18', '6302', '9240', 17, 0, 1, 0, 20, 0, 0, 0, 0, 20, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-07-11', '7340', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 10, '10:00:00', 'Self', 'Normal', 2, 18, 2, 'vendor'),
(159, 81, 'Anindita Paul\n\n\n', '9880617669', 'anindita@smartcricket.com', 26.8309535, 80.9244566, 'Lucknow, Kanpur - Lucknow Rd, Preeti Nagar, Mawaiyya, Charbagh, Lucknow, Uttar Pradesh 226004, India', 79, '2022-07-11', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-11 09:00:00', '2022-07-13', '11:00:00', '11:00 AM To 12:00 PM', '2022-07-13 12:00:00', '12:00:00', 2, '2022-07-11 12:44:07', '2022-07-11 12:46:32', '0000-00-00 00:00:00', '2022-07-11 12:48:23', '2022-07-11 12:48:37', '2022-07-11 12:49:11', '2022-07-11 12:53:10', '2022-07-11 01:21:58', '2022-07-11 01:30:23', '2085', '9358', 577, 0, 2, 19, 667.24, 0, 0, 0, 0, 667.24, 18, 'John', '7533577533', 18, 'John', '7533577533', NULL, NULL, NULL, NULL, '2022-07-11', '5672', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 7, '10:00:00', 'Home Delivery', 'Normal', 69.24, 0, 0, 'vendor'),
(160, 34, 'Shivram Varun', '9415964405', 'shivramvarunit@gmail.com', 26.888988494873047, 80.9909439086914, '19/1367, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', 4, '2022-07-20', '11:00:00', '11:00 AM To 12:00 PM', '2022-07-20 11:00:00', '2022-07-22', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-22 10:00:00', '10:00:00', 17, '2022-07-20 11:09:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2610', '0395', 705, 0, 13.35, 0, 803.35, 0, 0, 0, 0, 803.35, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-07-20', '5870', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 2, '12:00:00', 'Self', 'Normal', 85, 0, 0, 'vendor'),
(161, 8, 'Harshit Gupta', 'harshitgupta72@gmail.com', '7007629729', 28.556170599999998, 77.5441908, 'HG4V+FM8, Dadri, Uttar Pradesh 203207, India', 154, '2022-07-20', '11:00:00', '11:00 AM To 12:00 PM', '2022-07-20 11:00:00', '2022-07-22', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-22 10:00:00', '10:00:00', 17, '2022-07-20 12:59:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5739', '7160', 643.2, 0, 32.16, 0, 579.36, 0, 0, 0, 0, 579.36, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-07-20', '7326', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 2, '12:00:00', 'Self', 'Normal', -96, 0, 0, 'vendor'),
(162, 8, 'Harshit Gupta', 'harshitgupta72@gmail.com', '7007629729', 28.556170599999998, 77.5441908, 'HG4V+FM8, Dadri, Uttar Pradesh 203207, India', 154, '2022-07-20', '11:00:00', '11:00 AM To 12:00 PM', '2022-07-20 11:00:00', '2022-07-22', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-22 10:00:00', '10:00:00', 17, '2022-07-20 13:15:19', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2085', '3210', 151.2, 0, 7.56, 19, 154.76, 0, 0, 0, 0, 154.76, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-07-20', '2056', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 2, '12:00:00', 'Home Delivery', 'Normal', -23, 0, 0, 'vendor'),
(163, 34, 'Shivram Varun', '9415964405', 'shivramvarunit@gmail.com', 26.888835999999998, 80.990972, '19/1367, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', 18, '2022-07-20', '11:00:00', '11:00 AM To 12:00 PM', '2022-07-20 11:00:00', '2022-07-22', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-22 10:00:00', '10:00:00', 17, '2022-07-20 16:15:04', '2022-07-20 04:24:32', '0000-00-00 00:00:00', '2022-07-20 04:27:11', '2022-07-20 16:29:39', '2022-07-20 16:30:09', '2022-07-20 16:30:11', '2022-07-20 04:30:22', '2022-07-20 04:40:17', '9186', '3761', 32.4, 0, 1.62, 19, 48.02, 0, 0, 0, 0, 48.02, 18, 'John', '7533577533', 18, 'John', '7533577533', NULL, NULL, NULL, NULL, '2022-07-20', '1946', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 2, '12:00:00', 'Home Delivery', 'Normal', -5, 45, 3, 'vendor'),
(164, 34, 'Shivram Varun', '9415964405', 'shivramvarunit@gmail.com', 26.888988494873047, 80.9909439086914, '19/1367, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', 4, '2022-07-22', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-22 09:00:00', '2022-07-26', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-26 10:00:00', '10:00:00', 10, '2022-07-21 11:04:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1842', '7906', 465.6, 0, 23.28, 19, 531.88, 0, 0, 0, 0, 531.88, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-07-21', '5819', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 17, '10:00:00', 'Home Delivery', 'Normal', 24, 0, 0, 'vendor'),
(165, 34, 'Shivram Varun', '9415964405', 'shivramvarunit@gmail.com', 26.888988494873047, 80.9909439086914, '19/1367, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', 4, '2022-07-22', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-22 09:00:00', '2022-07-25', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-25 10:00:00', '10:00:00', 7, '2022-07-21 11:05:07', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '6490', '4308', 20.4, 0, 1.02, 19, 41.42, 0, 0, 0, 0, 41.42, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-07-21', '0614', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, 12, '2022-07-21 11:11:02', 9, '', 17, '10:00:00', 'Home Delivery', 'Normal', 1, 0, 0, 'vendor'),
(166, 34, 'Shivram Varun', '9415964405', 'shivramvarunit@gmail.com', 26.888988494873047, 80.9909439086914, '19/1367, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', 4, '2022-07-22', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-22 09:00:00', '2022-07-25', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-25 10:00:00', '10:00:00', 7, '2022-07-21 11:05:42', '2022-07-21 05:21:52', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5213', '8762', 12, 0, 0.6, 19, 31.6, 0, 0, 0, 0, 31.6, 18, 'John', '7533577533', 0, '', '', NULL, NULL, NULL, NULL, '2022-07-21', '1925', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 2, '', 17, '10:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(167, 34, 'Shivram Varun', '9415964405', 'shivramvarunit@gmail.com', 26.888988494873047, 80.9909439086914, '19/1367, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', 4, '2022-07-22', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-22 09:00:00', '2022-07-25', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-25 10:00:00', '10:00:00', 7, '2022-07-21 11:21:16', '2022-07-21 11:24:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-07-21 16:26:30', '2022-07-21 16:46:31', '2022-07-21 16:46:53', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '8569', '9762', 26.4, 0, 1.32, 0, 29.72, 0, 0, 0, 0, 29.72, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-07-21', '8215', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 6, '', 17, '10:00:00', 'Self', 'Normal', 2, 0, 0, 'vendor'),
(168, 34, 'Shivram Varun', '9415964405', 'shivramvarunit@gmail.com', 26.888988494873047, 80.9909439086914, '19/1367, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', 4, '2022-07-22', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-22 09:00:00', '2022-07-25', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-25 10:00:00', '10:00:00', 7, '2022-07-21 11:30:38', '2022-07-21 11:34:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-07-21 14:22:30', '2022-07-21 16:26:46', '2022-07-21 16:26:47', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1053', '2056', 20.4, 0, 1.02, 0, 22.42, 0, 0, 0, 0, 22.42, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-07-21', '9754', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 6, '', 17, '10:00:00', 'Self', 'Normal', 1, 0, 0, 'vendor'),
(169, 34, 'Shivram Varun', '9415964405', 'shivramvarunit@gmail.com', 26.888988494873047, 80.9909439086914, '19/1367, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', 4, '2022-07-22', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-22 09:00:00', '2022-07-25', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-25 10:00:00', '10:00:00', 7, '2022-07-21 11:35:59', '2022-07-21 06:03:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '8072', '6932', 20.4, 0, 1.02, 19, 41.42, 0, 0, 0, 0, 41.42, 18, 'John', '7533577533', 0, '', '', NULL, NULL, NULL, NULL, '2022-07-21', '7639', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 2, '', 17, '10:00:00', 'Home Delivery', 'Normal', 1, 0, 0, 'vendor'),
(170, 34, 'Shivram Varun', '9415964405', 'shivramvarunit@gmail.com', 26.888988494873047, 80.9909439086914, '19/1367, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', 4, '2022-07-22', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-22 09:00:00', '2022-07-25', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-25 10:00:00', '10:00:00', 7, '2022-07-21 11:51:16', '2022-07-21 01:06:42', '0000-00-00 00:00:00', '2022-07-21 01:08:53', '2022-07-21 13:11:35', '2022-07-21 13:12:02', '2022-07-21 13:12:06', '2022-07-21 01:12:23', '2022-07-21 01:13:13', '4127', '2603', 20.4, 0, 1.02, 19, 41.42, 0, 0, 0, 0, 41.42, 18, 'John', '7533577533', 18, 'John', '7533577533', NULL, NULL, NULL, NULL, '2022-07-21', '2837', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 17, '10:00:00', 'Home Delivery', 'Normal', 1, 39, 2, 'vendor'),
(171, 8, 'Harshit Gupta', 'harshitgupta72@gmail.com', '7007629729', 28.556170599999998, 77.5441908, 'HG4V+FM8, Dadri, Uttar Pradesh 203207, India', 154, '2022-07-22', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-22 09:00:00', '2022-07-23', '11:00:00', '11:00 AM To 10:30 PM', '2022-07-23 22:30:00', '22:30:00', 34, '2022-07-21 11:59:43', '2022-07-21 12:09:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-07-21 12:36:58', '2022-07-21 12:37:07', '2022-07-21 12:43:07', '0000-00-00 00:00:00', '2022-07-21 12:45:52', '0379', '1469', 130.8, 0, 6.54, 0, 143.34, 0, 0, 0, 0, 143.34, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-07-21', '8163', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 17, '10:00:00', 'Self', 'Normal', 6, 130, 13, 'vendor'),
(172, 34, 'Shivram Varun', '9415964405', 'shivramvarunit@gmail.com', 26.888988494873047, 80.9909439086914, '19/1367, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', 4, '2022-07-22', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-22 09:00:00', '2022-07-25', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-25 10:00:00', '10:00:00', 7, '2022-07-21 12:05:31', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1649', '1568', 32.4, 0, 1.62, 0, 35.02, 0, 0, 0, 0, 35.02, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-07-21', '3264', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, 12, '2022-07-21 12:07:17', 9, '', 17, '10:00:00', 'Self', 'Normal', 1, 0, 0, 'vendor'),
(173, 34, 'Shivram Varun', '9415964405', 'shivramvarunit@gmail.com', 26.888988494873047, 80.9909439086914, '19/1367, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', 4, '2022-07-22', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-22 09:00:00', '2022-07-25', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-25 10:00:00', '10:00:00', 7, '2022-07-21 12:08:19', '2022-07-21 12:08:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-07-21 12:09:11', '2022-07-21 16:26:43', '2022-07-21 16:26:44', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0369', '7406', 20.4, 0, 1.02, 0, 22.42, 0, 0, 0, 0, 22.42, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-07-21', '4073', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 6, '', 17, '10:00:00', 'Self', 'Normal', 1, 0, 0, 'vendor'),
(174, 34, 'Shivram Varun', '9415964405', 'shivramvarunit@gmail.com', 26.888988494873047, 80.9909439086914, '19/1367, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', 4, '2022-07-22', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-22 09:00:00', '2022-07-25', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-25 10:00:00', '10:00:00', 7, '2022-07-21 12:13:13', '2022-07-21 12:15:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-07-21 12:18:07', '2022-07-21 16:26:36', '2022-07-21 16:26:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5418', '1398', 32.4, 0, 1.62, 0, 35.02, 0, 0, 0, 0, 35.02, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-07-21', '8965', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 6, '', 17, '10:00:00', 'Self', 'Normal', 1, 0, 0, 'vendor'),
(175, 34, 'Shivram Varun', '9415964405', 'shivramvarunit@gmail.com', 26.888988494873047, 80.9909439086914, '19/1367, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', 4, '2022-07-22', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-22 09:00:00', '2022-07-25', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-25 10:00:00', '10:00:00', 7, '2022-07-21 13:00:55', '2022-07-21 01:04:17', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-07-21 13:04:23', '2022-07-21 13:04:47', '2022-07-21 13:04:54', '0000-00-00 00:00:00', '2022-07-21 01:05:47', '2753', '2541', 32.4, 0, 1.62, 0, 35.02, 0, 0, 0, 0, 35.02, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-07-21', '1732', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 17, '10:00:00', 'Self', 'Normal', 1, 32, 3, 'vendor'),
(176, 34, 'Shivram Varun', '9415964405', 'shivramvarunit@gmail.com', 26.888988494873047, 80.9909439086914, '19/1367, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', 4, '2022-07-22', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-22 09:00:00', '2022-07-25', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-25 10:00:00', '10:00:00', 7, '2022-07-21 13:52:25', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0314', '1534', 20.4, 0, 1.02, 19, 41.42, 0, 0, 0, 0, 41.42, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-07-21', '1930', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 17, '10:00:00', 'Home Delivery', 'Normal', 1, 0, 0, 'vendor'),
(177, 34, 'Shivram Varun', '9415964405', 'shivramvarunit@gmail.com', 26.888988494873047, 80.9909439086914, '19/1367, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', 4, '2022-07-22', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-22 09:00:00', '2022-07-25', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-25 10:00:00', '10:00:00', 7, '2022-07-21 13:53:48', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3021', '9130', 20.4, 0, 1.02, 19, 41.42, 0, 0, 0, 0, 41.42, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-07-21', '8795', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 17, '10:00:00', 'Home Delivery', 'Normal', 1, 0, 0, 'vendor'),
(178, 34, 'Shivram Varun', '9415964405', 'shivramvarunit@gmail.com', 26.888988494873047, 80.9909439086914, '19/1367, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', 4, '2022-07-22', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-22 09:00:00', '2022-07-25', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-25 10:00:00', '10:00:00', 7, '2022-07-21 14:06:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '7243', '3792', 20.4, 0, 1.02, 19, 41.42, 0, 0, 0, 0, 41.42, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-07-21', '9103', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 17, '10:00:00', 'Home Delivery', 'Normal', 1, 0, 0, 'vendor'),
(179, 34, 'Shivram Varun', '9415964405', 'shivramvarunit@gmail.com', 26.888988494873047, 80.9909439086914, '19/1367, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', 4, '2022-07-22', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-22 09:00:00', '2022-07-25', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-25 10:00:00', '10:00:00', 7, '2022-07-21 14:11:55', '2022-07-21 06:03:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2023-01-14 16:30:05', '2023-01-14 16:30:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '4327', '8135', 130.8, 0, 6.54, 0, 143.34, 0, 0, 0, 0, 143.34, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-07-21', '3192', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 5, '', 17, '10:00:00', 'Self', 'Normal', 6, 0, 0, 'vendor'),
(180, 8, 'Harshit Gupta', 'harshitgupta72@gmail.com', '7007629729', 26.8890858, 80.99107599999999, 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', 42, '2022-07-22', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-22 09:00:00', '2022-07-25', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-25 10:00:00', '10:00:00', 7, '2022-07-21 14:12:29', '2022-07-22 03:50:15', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5798', '6015', 20.4, 0, 1.02, 19, 41.42, 0, 0, 0, 0, 41.42, 18, 'John', '7533577533', 0, '', '', NULL, NULL, NULL, NULL, '2022-07-21', '8539', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 2, '', 17, '10:00:00', 'Home Delivery', 'Normal', 1, 0, 0, 'vendor');
INSERT INTO `booking_list` (`id`, `user_id`, `user_name`, `user_mobile_no`, `user_email_id`, `delivery_lat`, `delivery_long`, `delivery_address`, `delivery_address_id`, `pickup_date`, `pickup_time`, `pickup_time_slot_label`, `pickup_time_org`, `drop_slot_date`, `drop_slot_time`, `drop_time_slot_label`, `drop_slot_time_org`, `drop_slot_time_to`, `drop_slot_id`, `placed_time`, `confirm_time`, `allot_for_pickup_time`, `picked_up_time`, `received_at_loundry_time`, `in_process_time`, `order_ready_time`, `allot_for_drop_time`, `drop_time`, `pickup_otp`, `drop_otp`, `total_item_price`, `tax_percent`, `tax_amt`, `delivery_charge`, `total_amt`, `paid_by_promo`, `paid_by_wallet`, `paid_by_online`, `paid_by_cash`, `skip_for_pay`, `pickup_boy_id`, `pickup_boy_name`, `pickup_boy_number`, `drop_boy_id`, `drop_boy_name`, `drop_boy_number`, `applied_promocode`, `applied_promocode_id`, `add_to_wallet_by_promocode`, `add_to_wallet_by_promo_status`, `invoice_date`, `invoice_number`, `vendor_id`, `vendor_name`, `vendor_mobile_no`, `vendor_lat`, `vendor_long`, `vendor_address`, `country_id`, `country_name`, `country_code`, `currency_name`, `currency_symbol`, `vendor_image`, `cancellation_reason`, `cancelled_by_id`, `cancelled_time`, `booking_status`, `online_transaction_id`, `time_slot_id`, `pickup_time_to`, `pickup_type`, `service_type`, `total_addon`, `vendor_commission`, `company_commission`, `cash_received_by`) VALUES
(181, 34, 'Shivram Varun', '9415964405', 'shivramvarunit@gmail.com', 26.8890858, 80.99107599999999, 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, L', 99, '2022-07-22', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-22 09:00:00', '2022-07-25', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-25 10:00:00', '10:00:00', 7, '2022-07-21 14:12:29', '2022-07-21 04:59:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5837', '9532', 20.4, 0, 1.02, 19, 41.42, 0, 0, 0, 0, 41.42, 18, 'John', '7533577533', 0, '', '', NULL, NULL, NULL, NULL, '2022-07-21', '8473', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 2, '', 17, '10:00:00', 'Home Delivery', 'Normal', 1, 0, 0, 'vendor'),
(182, 34, 'Shivram Varun', '9415964405', 'shivramvarunit@gmail.com', 26.888988494873047, 80.9909439086914, '19/1367, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', 4, '2022-07-22', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-22 09:00:00', '2022-07-25', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-25 10:00:00', '10:00:00', 7, '2022-07-21 14:13:28', '2022-07-25 02:51:15', '0000-00-00 00:00:00', '2022-07-21 02:15:17', '2022-07-21 14:20:34', '2022-07-21 16:26:33', '2022-07-21 16:26:34', '2022-07-22 04:09:22', '0000-00-00 00:00:00', '6231', '2739', 370, 0, 18.42, 19, 462.92, 0, 0, 0, 0, 462.92, 22, 'Shaun Michael', '9990009990', 18, 'John', '7533577533', NULL, NULL, NULL, NULL, '2022-07-21', '3964', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 2, '', 17, '10:00:00', 'Home Delivery', 'Normal', 55.5, 0, 0, 'vendor'),
(183, 81, 'Anindita Paul\n\n\n', '9880617669', 'anindita@smartcricket.com', 26.8309535, 80.9244566, 'Lucknow, Kanpur - Lucknow Rd, Preeti Nagar, Mawaiyya, Charbagh, Lucknow, Uttar Pradesh 226004, India', 79, '2022-07-22', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-22 09:00:00', '2022-07-22', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-22 10:00:00', '10:00:00', 17, '2022-07-22 13:57:08', '2022-07-22 01:57:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-07-22 13:57:49', '2022-07-22 13:59:22', '2022-07-22 13:59:39', '0000-00-00 00:00:00', '2022-07-22 02:00:02', '9458', '3795', 20.4, 0, 1.02, 0, 22.42, 0, 0, 0, 0, 22.42, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-07-22', '8695', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 17, '10:00:00', 'Self', 'Express', 1, 20, 2, 'vendor'),
(184, 54, 'manoj hegde test', '9663028587', 'manoj@smartcricket.com', 12.9307178, 77.5771505, 'WHJG+7VJ, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', 111, '2022-07-27', '15:00:00', '3:00 PM To 4:00 PM', '2022-07-27 15:00:00', '2022-07-25', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-25 10:00:00', '10:00:00', 7, '2022-07-22 15:40:36', '2022-07-22 03:40:48', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-07-22 15:40:52', '2022-07-22 15:40:55', '2022-07-22 15:41:02', '0000-00-00 00:00:00', '2022-07-22 03:41:32', '7846', '0589', 20.4, 0, 1.02, 0, 22.42, 0, 0, 0, 0, 22.42, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-07-22', '3729', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 4, '16:00:00', 'Self', 'Normal', 1, 20, 2, 'vendor'),
(185, 54, 'manoj hegde test', '9663028587', 'manoj@smartcricket.com', 12.9307178, 77.5771505, 'WHJG+7VJ, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', 111, '2022-07-28', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-28 09:00:00', '2022-07-29', '15:00:00', '3:00 PM To 4:00 PM', '2022-07-29 16:00:00', '16:00:00', 19, '2022-07-22 15:42:22', '2022-07-22 03:58:18', '0000-00-00 00:00:00', '2022-07-22 03:58:30', '2022-07-22 15:58:38', '2022-07-22 15:58:46', '2022-07-22 15:59:53', '2022-07-22 04:00:06', '0000-00-00 00:00:00', '2179', '5176', 165.6, 0, 8.28, 19, 201.88, 0, 0, 0, 0, 201.88, 22, 'Shaun Michael', '9990009990', 18, 'John', '7533577533', NULL, NULL, NULL, NULL, '2022-07-22', '5701', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', 'I don\'t know By rider', 22, '2022-07-22 04:06:19', 9, '', 17, '10:00:00', 'Home Delivery', 'Normal', 9, 0, 0, 'vendor'),
(186, 54, 'manoj hegde test', '9663028587', 'manoj@smartcricket.com', 12.9307178, 77.5771505, 'WHJG+7VJ, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', 111, '2022-07-22', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-22 09:00:00', '2022-07-25', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-25 10:00:00', '10:00:00', 7, '2022-07-22 16:05:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1508', '7320', 493.2, 0, 24.66, 0, 541.86, 0, 0, 0, 0, 541.86, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-07-22', '9180', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 17, '10:00:00', 'Self', 'Normal', 24, 0, 0, 'vendor'),
(187, 54, 'manoj hegde test', '9663028587', 'manoj@smartcricket.com', 12.9307178, 77.5771505, 'WHJG+7VJ, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', 111, '2022-07-28', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-28 09:00:00', '2022-07-25', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-25 10:00:00', '10:00:00', 7, '2022-07-22 16:05:36', '2022-07-22 04:07:08', '0000-00-00 00:00:00', '2022-07-22 04:08:11', '2022-07-22 16:08:47', '2022-07-22 16:08:49', '2022-07-22 16:08:59', '2022-07-22 04:09:05', '2022-07-22 04:11:25', '9548', '0732', 12, 0, 0.6, 19, 31.6, 0, 0, 0, 0, 31.6, 22, 'Shaun Michael', '9990009990', 22, 'Shaun Michael', '9990009990', NULL, NULL, NULL, NULL, '2022-07-22', '2694', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 17, '10:00:00', 'Home Delivery', 'Normal', 0, 30, 1, 'vendor'),
(188, 54, 'manoj hegde test', '9663028587', 'manoj@smartcricket.com', 12.9307178, 77.5771505, 'WHJG+7VJ, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', 111, '2022-07-22', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-22 09:00:00', '2022-07-30', '11:00:00', '11:00 AM To 10:30 PM', '2022-07-30 22:30:00', '22:30:00', 34, '2022-07-22 16:29:41', '2023-01-14 04:29:57', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '7985', '9287', 343.2, 0, 17.16, 19, 396.36, 0, 0, 0, 0, 396.36, 18, 'John', '7533577533', 0, '', '', NULL, NULL, NULL, NULL, '2022-07-22', '2704', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, 12, '2022-07-22 04:30:06', 2, '', 17, '10:00:00', 'Home Delivery', 'Normal', 17, 0, 0, 'vendor'),
(189, 54, 'manoj hegde test', '9663028587', 'manoj@smartcricket.com', 12.9307178, 77.5771505, 'WHJG+7VJ, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', 111, '2022-07-22', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-22 09:00:00', '2022-07-25', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-25 10:00:00', '10:00:00', 7, '2022-07-22 16:32:31', '2022-07-26 03:12:47', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '7065', '4169', 32.4, 0, 1.62, 19, 54.02, 0, 0, 0, 0, 54.02, 18, 'John', '7533577533', 0, '', '', NULL, NULL, NULL, NULL, '2022-07-22', '2734', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, 12, '2022-07-22 04:32:41', 2, '', 17, '10:00:00', 'Home Delivery', 'Normal', 1, 0, 0, 'vendor'),
(190, 54, 'manoj hegde test', '9663028587', 'manoj@smartcricket.com', 12.9307178, 77.5771505, 'WHJG+7VJ, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', 111, '2022-07-22', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-22 09:00:00', '2022-07-25', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-25 10:00:00', '10:00:00', 7, '2022-07-22 16:33:11', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '4130', '8915', 12, 0, 0.6, 19, 31.6, 0, 0, 0, 0, 31.6, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-07-22', '5729', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 0, '', 17, '10:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(191, 54, 'manoj hegde test', '9663028587', 'manoj@smartcricket.com', 12.9307178, 77.5771505, 'WHJG+7VJ, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', 111, '2022-07-22', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-22 09:00:00', '2022-07-25', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-25 10:00:00', '10:00:00', 7, '2022-07-22 16:33:19', '2022-07-22 04:33:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5623', '3546', 20.4, 0, 1.02, 19, 41.42, 0, 0, 0, 0, 41.42, 22, 'Shaun Michael', '9990009990', 0, '', '', NULL, NULL, NULL, NULL, '2022-07-22', '6748', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 2, '', 17, '10:00:00', 'Home Delivery', 'Normal', 1, 0, 0, 'vendor'),
(192, 81, 'Anindita Paul\n\n\n', '9880617669', 'anindita@smartcricket.com', 26.8309535, 80.9244566, 'Lucknow, Kanpur - Lucknow Rd, Preeti Nagar, Mawaiyya, Charbagh, Lucknow, Uttar Pradesh 226004, India', 79, '2022-07-22', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-22 09:00:00', '2022-07-25', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-25 10:00:00', '10:00:00', 7, '2022-07-22 16:43:40', '2022-07-22 04:55:22', '0000-00-00 00:00:00', '2022-07-22 04:58:04', '2022-07-25 15:15:51', '2022-07-25 15:15:55', '2022-07-25 15:15:58', '2022-07-25 03:16:14', '2022-07-25 03:20:31', '2183', '6814', 585, 0, 28.86, 19, 720.61, 0, 0, 0, 0, 720.61, 18, 'John', '7533577533', 18, 'John', '7533577533', NULL, NULL, NULL, NULL, '2022-07-22', '2198', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 17, '10:00:00', 'Home Delivery', 'Normal', 87.75, 662, 59, 'vendor'),
(193, 108, 'Manoj Hegde', '9999999999', 'manu@mail.com', 26.846688, 80.9461492, 'RWWW+MFC, Narpatkhera, Lalbagh, Lucknow, Uttar Pradesh 226001, India', 175, '2022-07-26', '19:00:00', '7:00 PM To 8:00 PM', '2022-07-26 19:00:00', '2022-07-27', '20:00:00', '8:00 PM To 9:00 PM', '2022-07-27 21:00:00', '21:00:00', 6, '2022-07-25 12:17:52', '2022-07-25 12:18:57', '0000-00-00 00:00:00', '2022-07-25 12:20:12', '2022-07-25 12:20:51', '2022-07-25 12:23:10', '2022-07-25 12:26:13', '2022-07-25 12:26:29', '2022-07-25 12:27:19', '2794', '5406', 12, 0, 0.6, 65, 77.6, 0, 0, 0, 0, 77.6, 22, 'Shaun Michael', '9990009990', 22, 'Shaun Michael', '9990009990', NULL, NULL, NULL, NULL, '2022-07-25', '3074', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 12, '20:00:00', 'Home Delivery', 'Express', 0, 76, 1, 'vendor'),
(194, 81, 'Anindita Paul\n\n\n', '9880617669', 'anindita@smartcricket.com', 26.8309535, 80.9244566, 'Lucknow, Kanpur - Lucknow Rd, Preeti Nagar, Mawaiyya, Charbagh, Lucknow, Uttar Pradesh 226004, India', 79, '2022-07-25', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-25 09:00:00', '2022-07-27', '11:00:00', '11:00 AM To 12:00 PM', '2022-07-27 12:00:00', '12:00:00', 2, '2022-07-25 13:29:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '7945', '0521', 20.4, 0, 1.02, 0, 22.42, 0, 0, 0, 0, 22.42, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-07-25', '8069', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, 12, '2023-01-14 04:30:48', 9, '', 7, '10:00:00', 'Self', 'Normal', 1, 0, 0, 'vendor'),
(195, 81, 'Anindita Paul\n\n\n', '9880617669', 'anindita@smartcricket.com', 26.8309535, 80.9244566, 'Lucknow, Kanpur - Lucknow Rd, Preeti Nagar, Mawaiyya, Charbagh, Lucknow, Uttar Pradesh 226004, India', 79, '2022-07-25', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-25 09:00:00', '2022-07-27', '11:00:00', '11:00 AM To 12:00 PM', '2022-07-27 12:00:00', '12:00:00', 2, '2022-07-25 13:30:51', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5910', '6295', 20.4, 0, 1.02, 19, 41.42, 0, 0, 0, 0, 41.42, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-07-25', '7356', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, 12, '2022-07-25 01:54:02', 9, '', 7, '10:00:00', 'Home Delivery', 'Normal', 1, 0, 0, 'vendor'),
(196, 81, 'Anindita Paul\n\n\n', '9880617669', 'anindita@smartcricket.com', 26.8309535, 80.9244566, 'Lucknow, Kanpur - Lucknow Rd, Preeti Nagar, Mawaiyya, Charbagh, Lucknow, Uttar Pradesh 226004, India', 79, '2022-07-25', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-25 09:00:00', '2022-07-27', '11:00:00', '11:00 AM To 12:00 PM', '2022-07-27 12:00:00', '12:00:00', 2, '2022-07-25 13:58:01', '2022-07-25 01:59:05', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-07-25 13:59:11', '2022-07-25 13:59:15', '2022-07-25 13:59:50', '0000-00-00 00:00:00', '2022-07-25 02:00:33', '7560', '8602', 324, 0, 15.42, 0, 388.02, 0, 0, 0, 0, 388.02, 0, '', '', 0, '', '', NULL, NULL, NULL, NULL, '2022-07-25', '7432', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 7, '10:00:00', 'Self', 'Normal', 48.6, 356, 32, 'vendor'),
(197, 81, 'Anindita Paul\n\n\n', '9880617669', 'anindita@smartcricket.com', 26.8309535, 80.9244566, 'Lucknow, Kanpur - Lucknow Rd, Preeti Nagar, Mawaiyya, Charbagh, Lucknow, Uttar Pradesh 226004, India', 79, '2022-07-25', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-25 09:00:00', '2022-07-27', '11:00:00', '11:00 AM To 12:00 PM', '2022-07-27 12:00:00', '12:00:00', 2, '2022-07-25 14:58:28', '2022-07-26 01:43:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '4530', '8394', 12, 0, 0.6, 19, 31.6, 0, 0, 0, 0, 31.6, 18, 'John', '7533577533', 0, '', '', NULL, NULL, NULL, NULL, '2022-07-25', '7138', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 2, '', 7, '10:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(198, 81, 'Anindita Paul\n\n\n', '9880617669', 'anindita@smartcricket.com', 26.8309535, 80.9244566, 'Lucknow, Kanpur - Lucknow Rd, Preeti Nagar, Mawaiyya, Charbagh, Lucknow, Uttar Pradesh 226004, India', 79, '2022-07-25', '09:00:00', '9:00 AM To 10:00 AM', '2022-07-25 09:00:00', '2022-07-27', '11:00:00', '11:00 AM To 12:00 PM', '2022-07-27 12:00:00', '12:00:00', 2, '2022-07-25 15:06:10', '2022-07-25 03:07:47', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '8310', '7014', 1.2, 0, 0.06, 19, 20.26, 0, 0, 0, 0, 20.26, 18, 'John', '7533577533', 0, '', '', NULL, NULL, NULL, NULL, '2022-07-25', '5128', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 2, '', 7, '10:00:00', 'Home Delivery', 'Normal', 0, 0, 0, 'vendor'),
(199, 108, 'Manoj Hegde', '9999999999', 'manu@mail.com', 26.846688, 80.9461492, 'RWWW+MFC, Narpatkhera, Lalbagh, Lucknow, Uttar Pradesh 226001, India', 176, '2022-07-26', '19:00:00', '7:00 PM To 8:00 PM', '2022-07-26 19:00:00', '2022-07-27', '15:00:00', '3:00 PM To 4:00 PM', '2022-07-27 16:00:00', '16:00:00', 4, '2022-07-25 16:45:01', '2022-07-25 04:59:46', '0000-00-00 00:00:00', '2022-07-25 05:07:26', '2022-07-25 17:11:30', '2022-07-25 17:14:46', '2022-07-25 17:17:24', '2022-07-25 05:20:36', '2022-07-25 05:24:44', '4235', '8704', 8.4, 0, 0.42, 65, 96.82, 0, 0, 0, 0, 96.82, 22, 'Shaun Michael', '9990009990', 22, 'Shaun Michael', '9990009990', NULL, NULL, NULL, NULL, '2022-07-25', '5860', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 12, '20:00:00', 'Home Delivery', 'Express', 23, 96, 1, 'vendor'),
(200, 108, 'Manoj Hegde', '9999999999', 'manu@mail.com', 26.846688, 80.9461492, 'RWWW+MFC, Narpatkhera, Lalbagh, Lucknow, Uttar Pradesh 226001, India', 177, '2022-07-26', '19:00:00', '7:00 PM To 8:00 PM', '2022-07-26 19:00:00', '2022-07-27', '17:00:00', '5:00 PM To 6:00 PM', '2022-07-27 18:00:00', '18:00:00', 5, '2022-07-25 17:39:07', '2022-07-25 05:41:07', '0000-00-00 00:00:00', '2022-07-25 05:43:07', '2022-07-25 17:44:32', '2022-07-25 17:46:28', '2022-07-25 17:47:14', '2022-07-25 05:49:27', '2022-07-25 05:56:09', '0596', '9460', 42, 0, 2.1, 65, 133.1, 0, 0, 0, 0, 133.1, 22, 'Shaun Michael', '9990009990', 22, 'Shaun Michael', '9990009990', NULL, NULL, NULL, NULL, '2022-07-25', '3280', 12, 'Mayfair Dry Cleaners.', '1111111111', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 2, 'United Kingdom', '+44', 'Pound', '£', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', NULL, NULL, '0000-00-00 00:00:00', 8, '', 12, '20:00:00', 'Home Delivery', 'Express', 24, 129, 4, 'vendor');

-- --------------------------------------------------------

--
-- Table structure for table `booking_list_item`
--

CREATE TABLE `booking_list_item` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_name` text COLLATE utf8_unicode_ci NOT NULL,
  `unit_id` int(11) NOT NULL,
  `unit_name` text COLLATE utf8_unicode_ci NOT NULL,
  `country_id` int(11) NOT NULL,
  `item_description` text COLLATE utf8_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `offer_price` double NOT NULL,
  `qty` double NOT NULL,
  `total_amount` decimal(10,0) NOT NULL,
  `category_name` text COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `added_date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tax_percent` double NOT NULL,
  `tax_amt` double NOT NULL,
  `is_type_bucket` int(11) NOT NULL,
  `bucket_id` int(11) NOT NULL,
  `inc_amount` int(11) NOT NULL,
  `inc_type` text COLLATE utf8_unicode_ci NOT NULL,
  `inc_operation` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `booking_list_item`
--

INSERT INTO `booking_list_item` (`id`, `booking_id`, `item_id`, `item_name`, `unit_id`, `unit_name`, `country_id`, `item_description`, `price`, `offer_price`, `qty`, `total_amount`, `category_name`, `category_id`, `added_date_time`, `tax_percent`, `tax_amt`, `is_type_bucket`, `bucket_id`, `inc_amount`, `inc_type`, `inc_operation`) VALUES
(1, 1, 19, 'Jumper/cardigan', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-04-26 02:01:23', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(2, 1, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-04-26 02:01:23', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(3, 1, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-04-26 02:01:23', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(4, 2, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-04-26 02:02:53', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(5, 2, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-04-26 02:02:53', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(6, 2, 54, 'Jacket', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '11', '1', 1, '2022-04-26 02:02:53', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(7, 2, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-04-26 02:02:53', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(8, 2, 73, 'testing by qa', 1, 'Piece', 1, 'test', 10, 1, 1, '1', '1', 1, '2022-04-26 02:02:53', 1, 0.01, 0, 0, 0, 'Fixed', 'plus'),
(9, 3, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-04-26 02:09:27', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(10, 3, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 3, '21', '1', 1, '2022-04-26 02:09:27', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(11, 4, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-04-26 02:12:31', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(12, 5, 19, 'Jumper/cardigan', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-04-26 02:18:00', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(13, 5, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-04-26 02:18:00', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(14, 6, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-04-26 02:21:55', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(15, 6, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-04-26 02:21:55', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(16, 6, 19, 'Jumper/cardigan', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-04-26 02:21:55', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(17, 7, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-04-26 05:24:31', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(18, 7, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-04-26 05:24:31', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(19, 7, 19, 'Jumper/cardigan', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-04-26 05:24:31', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(20, 7, 54, 'Jacket', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '11', '1', 1, '2022-04-26 05:24:31', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(21, 7, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-04-26 05:24:31', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(22, 7, 57, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-04-26 05:24:31', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(23, 7, 62, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-04-26 05:24:31', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(24, 7, 73, 'testing by qa', 1, 'Piece', 1, 'test', 10, 1, 1, '1', '1', 1, '2022-04-26 05:24:31', 1, 0.01, 0, 0, 0, 'Fixed', 'plus'),
(25, 8, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-04-26 05:28:50', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(26, 8, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-04-26 05:28:50', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(27, 8, 19, 'Jumper/cardigan', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-04-26 05:28:50', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(28, 8, 54, 'Jacket', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '11', '1', 1, '2022-04-26 05:28:50', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(29, 8, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-04-26 05:28:50', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(30, 8, 57, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-04-26 05:28:50', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(31, 9, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-04-26 05:53:27', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(32, 9, 19, 'Jumper/cardigan', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-04-26 05:53:27', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(33, 10, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 2, '14', '1', 1, '2022-04-26 05:53:44', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(34, 10, 19, 'Jumper/cardigan', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-04-26 05:53:44', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(35, 10, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-04-26 05:53:44', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(36, 11, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 3, '21', '1', 1, '2022-04-27 04:47:16', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(37, 11, 42, 'Kids bear Bucket', 3, 'Bucket', 2, 'test ok', 0, 0, 2, '0', '1', 1, '2022-04-27 04:47:16', 10, 0, 1, 0, 0, 'Fixed', 'plus'),
(38, 12, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-04-27 04:49:06', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(39, 12, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 3, '21', '1', 1, '2022-04-27 04:49:06', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(40, 12, 19, 'Jumper/cardigan', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-04-27 04:49:06', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(41, 12, 51, 'Jacket', 1, 'Piece', 2, 'Testing Description', 7.5, 7.5, 1, '8', '1', 1, '2022-04-27 04:49:06', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(42, 13, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-04-27 06:04:21', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(43, 13, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-04-27 06:04:21', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(44, 13, 40, 'test', 3, 'Bucket', 2, 'test', 0, 0, 1, '0', '1', 1, '2022-04-27 06:04:21', 10, 0, 1, 0, 0, 'Fixed', 'plus'),
(45, 13, 41, 'Ladies clothes bucket', 3, 'Bucket', 2, 'gvgvgv h sb theek hai abhi aap', 0, 0, 1, '0', '1', 1, '2022-04-27 06:04:21', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(46, 13, 73, 'testing by qa', 1, 'Piece', 1, 'test', 10, 1, 2, '2', '', 1, '2022-04-27 18:05:47', 1, 0.02, 0, 44, 0, 'Fixed', 'plus'),
(47, 13, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '', 1, '2022-04-27 18:05:51', 0, 0, 0, 44, 0, 'Fixed', 'plus'),
(48, 13, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '10', '', 1, '2022-04-27 18:06:03', 10, 1, 0, 45, 0, 'Fixed', 'plus'),
(49, 14, 40, 'test', 3, 'Bucket', 2, 'test', 0, 0, 1, '0', '1', 1, '2022-04-27 06:08:07', 10, 0, 1, 0, 0, 'Fixed', 'plus'),
(50, 14, 41, 'Ladies clothes bucket', 3, 'Bucket', 2, 'gvgvgv h sb theek hai abhi aap', 0, 0, 1, '0', '1', 1, '2022-04-27 06:08:07', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(51, 14, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-04-27 06:08:07', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(52, 14, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-04-27 06:08:07', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(53, 14, 73, 'testing by qa', 1, 'Piece', 1, 'test', 10, 1, 3, '3', '', 1, '2022-04-27 18:08:38', 1, 0.03, 0, 50, 0, 'Fixed', 'plus'),
(54, 14, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 2, '14', '', 1, '2022-04-27 18:08:48', 0, 0, 0, 49, 0, 'Fixed', 'plus'),
(55, 15, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-04-28 10:18:16', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(56, 15, 40, 'test', 3, 'Bucket', 2, 'test', 0, 0, 1, '0', '1', 1, '2022-04-28 10:18:16', 10, 0, 1, 0, 0, 'Fixed', 'plus'),
(57, 15, 41, 'Ladies clothes bucket', 3, 'Bucket', 2, 'gvgvgv h sb theek hai abhi aap', 0, 0, 1, '0', '1', 1, '2022-04-28 10:18:16', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(58, 15, 42, 'Kids bear Bucket', 3, 'Bucket', 2, 'test ok', 0, 0, 1, '0', '1', 1, '2022-04-28 10:18:16', 10, 0, 1, 0, 0, 'Fixed', 'plus'),
(59, 16, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-04-28 11:34:17', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(60, 16, 40, 'test', 3, 'Bucket', 2, 'test', 0, 0, 1, '0', '1', 1, '2022-04-28 11:34:17', 10, 0, 1, 0, 0, 'Fixed', 'plus'),
(61, 17, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-04-28 11:36:02', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(62, 17, 40, 'test', 3, 'Bucket', 2, 'test', 0, 0, 1, '0', '1', 1, '2022-04-28 11:36:02', 10, 0, 1, 0, 0, 'Fixed', 'plus'),
(63, 18, 40, 'test', 3, 'Bucket', 2, 'test', 0, 0, 1, '0', '1', 1, '2022-04-28 11:36:46', 10, 0, 1, 0, 0, 'Fixed', 'plus'),
(64, 18, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-04-28 11:36:46', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(65, 19, 32, 'test', 1, 'Piece', 2, 'tesg', 200, 150, 1, '150', '2', 1, '2022-04-28 11:50:53', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(66, 19, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-04-28 11:50:53', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(67, 20, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-04-28 01:07:17', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(68, 20, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-04-28 01:07:17', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(69, 20, 19, 'Jumper/cardigan', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-04-28 01:07:17', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(70, 20, 51, 'Jacket', 1, 'Piece', 2, 'Testing Description', 7.5, 7.5, 1, '8', '1', 1, '2022-04-28 01:07:17', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(71, 21, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-04-28 01:40:35', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(72, 21, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-04-28 01:40:35', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(73, 21, 19, 'Jumper/cardigan', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-04-28 01:40:35', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(74, 22, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-04-28 02:36:58', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(75, 23, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-04-28 02:39:59', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(76, 23, 19, 'Jumper/cardigan', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-04-28 02:39:59', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(77, 24, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-04-28 02:53:30', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(78, 24, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-04-28 02:53:30', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(79, 24, 19, 'Jumper/cardigan', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-04-28 02:53:30', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(80, 25, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-04-28 03:03:33', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(81, 25, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-04-28 03:03:33', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(82, 26, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-04-28 03:04:25', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(83, 26, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-04-28 03:04:25', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(84, 26, 19, 'Jumper/cardigan', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-04-28 03:04:25', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(85, 27, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-04-28 03:18:23', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(86, 27, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-04-28 03:18:23', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(87, 28, 21, 'Let Down Plain', 1, 'Piece', 2, 'test', 12, 12, 1, '12', '3', 1, '2022-04-28 03:23:42', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(88, 28, 41, 'Ladies clothes bucket', 3, 'Bucket', 2, 'gvgvgv h sb theek hai abhi aap', 0, 0, 1, '0', '1', 1, '2022-04-28 03:23:42', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(89, 28, 22, 'Shorten Sleeves Bottom', 1, 'Piece', 2, 'Testing', 35, 35, 1, '35', '4', 1, '2022-04-28 03:23:42', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(90, 28, 43, 'Hospital clothes bucket', 3, 'Bucket', 2, 'the mujhe bhi nhi kri ho', 0, 0, 1, '0', '1', 1, '2022-04-28 03:23:42', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(91, 29, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-04-28 03:45:18', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(92, 29, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-04-28 03:45:18', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(93, 29, 30, 'Shorten Sleeves', 1, 'Piece', 2, 'Testing', 25, 25, 1, '25', '8', 1, '2022-04-28 03:45:18', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(94, 29, 31, 'Turn Collar Taper Sides', 1, 'Piece', 2, 'Testing', 20, 20, 1, '20', '8', 1, '2022-04-28 03:45:18', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(95, 29, 50, 'testing qa', 3, 'Bucket', 1, 'ok', 0, 0, 1, '0', '1', 1, '2022-04-28 03:45:18', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(96, 29, 40, 'test', 3, 'Bucket', 2, 'test', 0, 0, 1, '0', '1', 1, '2022-04-28 03:45:18', 10, 0, 1, 0, 0, 'Fixed', 'plus'),
(97, 29, 41, 'Ladies clothes bucket', 3, 'Bucket', 2, 'gvgvgv h sb theek hai abhi aap', 0, 0, 1, '0', '1', 1, '2022-04-28 03:45:18', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(98, 29, 42, 'Kids bear Bucket', 3, 'Bucket', 2, 'test ok', 0, 0, 1, '0', '1', 1, '2022-04-28 03:45:18', 10, 0, 1, 0, 0, 'Fixed', 'plus'),
(99, 30, 40, 'test', 3, 'Bucket', 2, 'test', 0, 0, 1, '0', '1', 1, '2022-04-28 03:46:33', 10, 0, 1, 0, 0, 'Fixed', 'plus'),
(100, 30, 41, 'Ladies clothes bucket', 3, 'Bucket', 2, 'gvgvgv h sb theek hai abhi aap', 0, 0, 1, '0', '1', 1, '2022-04-28 03:46:33', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(101, 30, 42, 'Kids bear Bucket', 3, 'Bucket', 2, 'test ok', 0, 0, 1, '0', '1', 1, '2022-04-28 03:46:33', 10, 0, 1, 0, 0, 'Fixed', 'plus'),
(102, 30, 43, 'Hospital clothes bucket', 3, 'Bucket', 2, 'the mujhe bhi nhi kri ho', 0, 0, 1, '0', '1', 1, '2022-04-28 03:46:33', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(103, 31, 40, 'test', 3, 'Bucket', 2, 'test', 0, 0, 1, '0', '1', 1, '2022-04-28 03:47:01', 10, 0, 1, 0, 0, 'Fixed', 'plus'),
(104, 31, 41, 'Ladies clothes bucket', 3, 'Bucket', 2, 'gvgvgv h sb theek hai abhi aap', 0, 0, 1, '0', '1', 1, '2022-04-28 03:47:01', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(105, 31, 42, 'Kids bear Bucket', 3, 'Bucket', 2, 'test ok', 0, 0, 1, '0', '1', 1, '2022-04-28 03:47:01', 10, 0, 1, 0, 0, 'Fixed', 'plus'),
(106, 31, 51, 'Jacket', 1, 'Piece', 2, 'Testing Description', 7.5, 7.5, 2, '15', '', 1, '2022-04-28 15:49:59', 0, 0, 0, 103, 0, 'Fixed', 'plus'),
(107, 31, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 5, '50', '', 1, '2022-04-28 15:50:03', 10, 5, 0, 103, 0, 'Fixed', 'plus'),
(108, 31, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 22, '220', '', 1, '2022-04-28 15:50:09', 0, 0, 0, 103, 0, 'Fixed', 'plus'),
(109, 31, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 12, '120', '', 1, '2022-04-28 15:51:55', 10, 12, 0, 104, 0, 'Fixed', 'plus'),
(110, 31, 51, 'Jacket', 1, 'Piece', 2, 'Testing Description', 7.5, 7.5, 12, '90', '', 1, '2022-04-28 15:51:59', 0, 0, 0, 104, 0, 'Fixed', 'plus'),
(111, 31, 19, 'Jumper/cardigan', 1, 'Piece', 2, 'Testing', 7, 7, 10, '70', '', 1, '2022-04-28 15:52:11', 0, 0, 0, 105, 0, 'Fixed', 'plus'),
(112, 31, 52, 'Jacket', 1, 'Piece', 2, 'Testing Description', 7.5, 7.5, 5, '38', '', 1, '2022-04-28 15:52:15', 10, 3.75, 0, 105, 0, 'Fixed', 'plus'),
(113, 32, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-04-28 03:54:44', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(114, 33, 52, 'Jacket', 1, 'Piece', 2, 'Testing Description', 7.5, 7.5, 1, '8', '1', 1, '2022-04-28 05:15:22', 10, 0.75, 0, 0, 0, 'Fixed', 'plus'),
(115, 33, 29, 'Elbow Patch', 1, 'Piece', 2, 'Testing', 30, 30, 1, '30', '5', 1, '2022-04-28 05:15:22', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(116, 34, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-04-28 05:52:11', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(117, 34, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-04-28 05:52:11', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(118, 35, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-04-28 05:57:14', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(119, 35, 53, 'Jacket', 1, 'Piece', 2, 'Testing Description', 7.5, 7.5, 1, '8', '1', 1, '2022-04-28 05:57:14', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(120, 29, 82, 'testhcgvfbdhghcgcgcycycycyf', 2, 'KG', 1, 'dggxgx', 688, 6858, 1, '6858', '', 1, '2022-04-29 12:00:44', 986858, 67678721.64, 0, 96, 0, 'Fixed', 'plus'),
(121, 29, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 4, '40', '', 1, '2022-04-29 12:00:50', 10, 4, 0, 96, 0, 'Fixed', 'plus'),
(122, 36, 42, 'Kids bear Bucket', 3, 'Bucket', 2, 'test ok', 0, 0, 1, '0', '1', 1, '2022-05-02 10:57:10', 10, 0, 1, 0, 0, 'Fixed', 'plus'),
(123, 36, 41, 'Ladies clothes bucket', 3, 'Bucket', 2, 'gvgvgv h sb theek hai abhi aap', 0, 0, 1, '0', '1', 1, '2022-05-02 10:57:10', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(124, 37, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-05-02 11:11:06', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(125, 37, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-05-02 11:11:06', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(126, 38, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 3, '33', '1', 1, '2022-05-02 06:15:03', 10, 3, 0, 0, 0, 'Fixed', 'plus'),
(127, 39, 40, 'test', 3, 'Bucket', 2, 'test', 0, 0, 1, '0', '1', 1, '2022-05-05 11:42:04', 10, 0, 1, 0, 0, 'Fixed', 'plus'),
(128, 39, 41, 'Ladies clothes bucket', 3, 'Bucket', 2, 'gvgvgv h sb theek hai abhi aap', 0, 0, 1, '0', '1', 1, '2022-05-05 11:42:04', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(129, 39, 42, 'Kids bear Bucket', 3, 'Bucket', 2, 'test ok', 0, 0, 1, '0', '1', 1, '2022-05-05 11:42:04', 10, 0, 1, 0, 0, 'Fixed', 'plus'),
(130, 39, 28, 'New Lining', 1, 'Piece', 2, 'Testing', 130, 130, 1, '130', '5', 1, '2022-05-05 11:42:04', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(131, 40, 36, 'test', 1, 'Piece', 2, 'test', 0, 100, 1, '110', '2', 1, '2022-05-05 11:43:21', 10, 10, 0, 0, 0, 'Fixed', 'plus'),
(132, 41, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-05-05 11:50:19', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(133, 41, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-05-05 11:50:19', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(134, 41, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-05-05 11:50:19', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(135, 42, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-05-05 12:32:57', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(136, 42, 22, 'Shorten Sleeves Bottom', 1, 'Piece', 1, 'Testing', 35, 35, 1, '35', '4', 1, '2022-05-05 12:32:57', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(137, 42, 21, '12', 1, 'Piece', 1, 'test', 12, 12, 1, '12', '3', 1, '2022-05-05 12:32:57', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(138, 42, 71, 'testing', 1, 'Piece', 2, 'test', 12, 12, 1, '12', '2', 1, '2022-05-05 12:32:57', 1, 0.12, 0, 0, 0, 'Fixed', 'plus'),
(139, 43, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-05-05 04:50:00', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(140, 43, 41, 'Ladies clothes bucket', 3, 'Bucket', 2, 'gvgvgv h sb theek hai abhi aap', 0, 0, 1, '0', '1', 1, '2022-05-05 04:50:00', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(141, 44, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-05-05 04:50:01', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(142, 44, 41, 'Ladies clothes bucket', 3, 'Bucket', 2, 'gvgvgv h sb theek hai abhi aap', 0, 0, 1, '0', '1', 1, '2022-05-05 04:50:01', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(143, 45, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-05-13 10:41:12', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(144, 46, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-05-13 11:28:08', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(145, 47, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-05-17 02:19:58', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(146, 48, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-05-17 03:26:27', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(147, 49, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-05-17 03:35:39', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(148, 49, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-05-17 03:35:39', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(149, 50, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-05-17 03:37:27', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(150, 51, 47, 'test', 1, 'Piece', 2, 'test', 100, 100, 1, '110', '2', 1, '2022-05-17 03:38:08', 10, 10, 0, 0, 0, 'Fixed', 'plus'),
(151, 51, 36, 'test', 1, 'Piece', 2, 'test', 0, 100, 1, '110', '2', 1, '2022-05-17 03:38:08', 10, 10, 0, 0, 0, 'Fixed', 'plus'),
(152, 51, 54, 'Jacket', 1, 'Piece', 1, 'Testing Description', 10, 10, 1, '11', '2', 1, '2022-05-17 03:38:08', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(153, 51, 32, 'test', 1, 'Piece', 2, 'tesg', 200, 150, 1, '150', '2', 1, '2022-05-17 03:38:08', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(154, 52, 22, 'Shorten Sleeves Bottom', 1, 'Piece', 1, 'Testing', 35, 35, 1, '35', '4', 1, '2022-05-17 03:40:14', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(155, 53, 36, 'test', 1, 'Piece', 2, 'test', 0, 100, 1, '110', '2', 1, '2022-05-17 03:47:20', 10, 10, 0, 0, 0, 'Fixed', 'plus'),
(156, 53, 47, 'test', 1, 'Piece', 2, 'test', 100, 100, 1, '110', '2', 1, '2022-05-17 03:47:20', 10, 10, 0, 0, 0, 'Fixed', 'plus'),
(157, 53, 54, 'Jacket', 1, 'Piece', 1, 'Testing Description', 10, 10, 1, '11', '2', 1, '2022-05-17 03:47:20', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(158, 54, 36, 'test', 1, 'Piece', 2, 'test', 0, 100, 1, '110', '2', 1, '2022-05-17 04:18:59', 10, 10, 0, 0, 0, 'Fixed', 'plus'),
(159, 55, 40, 'test', 3, 'Bucket', 2, 'test', 0, 0, 1, '0', '1', 1, '2022-05-17 04:24:36', 10, 0, 1, 0, 0, 'Fixed', 'plus'),
(160, 55, 78, 'test', 3, 'Bucket', 2, 'testing', 0, 0, 1, '0', '2', 1, '2022-05-17 04:24:36', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(161, 56, 78, 'test', 3, 'Bucket', 2, 'testing', 0, 0, 1, '0', '2', 1, '2022-05-17 04:27:01', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(162, 56, 85, 'lucknowi clothing', 3, 'Bucket', 2, 'laundry', 0, 0, 1, '0', '2', 1, '2022-05-17 04:27:01', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(163, 57, 32, 'test', 1, 'Piece', 2, 'tesg', 200, 150, 1, '150', '2', 1, '2022-05-17 04:31:50', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(164, 57, 36, 'test', 1, 'Piece', 2, 'test', 0, 100, 1, '110', '2', 1, '2022-05-17 04:31:50', 10, 10, 0, 0, 0, 'Fixed', 'plus'),
(165, 58, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-05-17 04:42:48', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(166, 58, 41, 'Ladies clothes bucket', 3, 'Bucket', 2, 'gvgvgv h sb theek hai abhi aap', 0, 0, 1, '0', '1', 1, '2022-05-17 04:42:48', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(167, 58, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 500, '3500', '', 1, '2022-05-17 16:54:56', 0, 0, 0, 166, 0, 'Fixed', 'plus'),
(168, 59, 57, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-05-17 05:01:16', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(169, 60, 41, 'Ladies clothes bucket', 3, 'Bucket', 2, 'gvgvgv h sb theek hai abhi aap', 0, 0, 1, '0', '1', 1, '2022-05-17 05:13:17', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(170, 61, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-05-17 06:11:14', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(171, 61, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-05-17 06:11:14', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(172, 62, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-05-17 06:28:37', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(173, 63, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-05-17 06:32:29', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(174, 64, 41, 'Ladies clothes bucket', 3, 'Bucket', 2, 'gvgvgv h sb theek hai abhi aap', 0, 0, 1, '0', '1', 1, '2022-05-17 06:42:41', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(175, 64, 42, 'Kids bear Bucket', 3, 'Bucket', 2, 'test ok', 0, 0, 1, '0', '1', 1, '2022-05-17 06:42:41', 10, 0, 1, 0, 0, 'Fixed', 'plus'),
(176, 64, 43, 'Hospital clothes bucket', 3, 'Bucket', 2, 'the mujhe bhi nhi kri ho', 0, 0, 1, '0', '1', 1, '2022-05-17 06:42:41', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(177, 65, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-05-17 06:48:34', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(178, 65, 42, 'Kids bear Bucket', 3, 'Bucket', 2, 'test ok', 0, 0, 1, '0', '1', 1, '2022-05-17 06:48:34', 10, 0, 1, 0, 0, 'Fixed', 'plus'),
(179, 65, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 5, '35', '', 1, '2022-05-17 18:49:56', 0, 0, 0, 178, 0, 'Fixed', 'plus'),
(180, 65, 57, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 8584, '85840', '', 1, '2022-05-17 18:50:01', 0, 0, 0, 178, 0, 'Fixed', 'plus'),
(181, 66, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-05-17 07:59:25', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(182, 67, 88, 'marvel', 3, 'Bucket', 2, 'wash wash wash', 0, 0, 1, '0', '2', 1, '2022-05-18 12:48:28', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(183, 67, 21, '12', 1, 'Piece', 1, 'test', 12, 12, 1, '12', '3', 1, '2022-05-18 12:48:28', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(184, 68, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-05-18 05:25:39', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(185, 68, 21, '12', 1, 'Piece', 1, 'test', 12, 12, 1, '12', '3', 1, '2022-05-18 05:25:39', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(186, 69, 84, 'Manoj', 1, 'Piece', 1, 'test by choice', 12, 12, 1, '12', '1', 1, '2022-05-18 05:32:08', 1, 0.12, 0, 0, 0, 'Fixed', 'plus'),
(187, 69, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-05-18 05:32:08', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(188, 69, 79, 'trousers', 1, 'Piece', 1, 'testing', 50, 50, 1, '51', '8', 1, '2022-05-18 05:32:08', 1, 0.5, 0, 0, 0, 'Fixed', 'plus'),
(189, 69, 42, 'Kids bear Bucket', 3, 'Bucket', 2, 'test ok', 0, 0, 1, '0', '1', 1, '2022-05-18 05:32:08', 10, 0, 1, 0, 0, 'Fixed', 'plus'),
(190, 70, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-05-18 06:17:07', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(191, 70, 54, 'Jacket', 1, 'Piece', 1, 'Testing Description', 10, 10, 1, '11', '2', 1, '2022-05-18 06:17:07', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(192, 70, 87, 'lungi', 1, 'Piece', 2, 'lungi', 25, 15, 1, '17', '3', 1, '2022-05-18 06:17:07', 15, 2.25, 0, 0, 0, 'Fixed', 'plus'),
(193, 71, 3, 'Product Name1', 1, 'Piece', 2, 'asdfsadf', 10, 10, 1, '11', '1', 1, '2022-05-20 12:53:29', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(194, 71, 12, 'test', 1, 'Piece', 2, 'testingjdvdg vdbdh', 100, 100, 1, '105', '1', 1, '2022-05-20 12:53:29', 5, 5, 0, 0, 0, 'Fixed', 'plus'),
(195, 71, 16, 'iron and clean', 2, 'KG', 1, 'testing perpose', 150, 150, 1, '150', '1', 1, '2022-05-20 12:53:29', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(196, 71, 4, 'asdfsdf', 1, 'Piece', 2, 'asdf', 12, 12, 1, '13', '1', 1, '2022-05-20 12:53:29', 12, 1.44, 0, 0, 0, 'Fixed', 'plus'),
(197, 72, 40, 'test', 3, 'Bucket', 2, 'test', 0, 0, 1, '0', '1', 1, '2022-05-20 01:11:36', 10, 0, 1, 0, 0, 'Fixed', 'plus'),
(198, 72, 41, 'Ladies clothes bucket', 3, 'Bucket', 2, 'gvgvgv h sb theek hai abhi aap', 0, 0, 1, '0', '1', 1, '2022-05-20 01:11:36', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(199, 72, 36, 'test', 1, 'Piece', 2, 'test', 0, 100, 2, '220', '2', 1, '2022-05-20 01:11:36', 10, 20, 0, 0, 0, 'Fixed', 'plus'),
(200, 73, 54, 'Jacket', 1, 'Piece', 1, 'Testing Description', 10, 10, 1, '11', '2', 1, '2022-05-20 01:25:17', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(201, 73, 36, 'test', 1, 'Piece', 2, 'test', 0, 100, 1, '110', '2', 1, '2022-05-20 01:25:17', 10, 10, 0, 0, 0, 'Fixed', 'plus'),
(202, 73, 72, 'qa test', 1, 'Piece', 2, 'test', 10, 1, 1, '1', '2', 1, '2022-05-20 01:25:17', 12, 0.12, 0, 0, 0, 'Fixed', 'plus'),
(203, 74, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-05-23 12:10:11', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(204, 74, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-05-23 12:10:11', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(205, 75, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-05-28 01:53:38', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(206, 75, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-05-28 01:53:38', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(207, 76, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-05-28 01:56:11', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(208, 76, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-05-28 01:56:11', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(209, 77, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-05-28 01:57:18', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(210, 77, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-05-28 01:57:18', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(211, 78, 21, '12', 1, 'Piece', 1, 'test', 12, 12, 1, '12', '3', 1, '2022-05-28 01:58:11', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(212, 79, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-05-28 02:00:03', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(213, 80, 42, 'Kids bear Bucket', 3, 'Bucket', 2, 'test ok', 0, 0, 1, '0', '1', 1, '2022-06-04 12:49:33', 10, 0, 1, 0, 0, 'Fixed', 'plus'),
(214, 80, 43, 'Hospital clothes bucket', 3, 'Bucket', 2, 'the mujhe bhi nhi kri ho', 0, 0, 1, '0', '1', 1, '2022-06-04 12:49:33', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(215, 92, 42, 'Kids bear Bucket', 3, 'Bucket', 2, 'test ok', 0, 0, 1, '0', '1', 1, '2022-06-06 11:33:10', 10, 0, 1, 0, 0, 'Fixed', 'plus'),
(216, 92, 43, 'Hospital clothes bucket', 3, 'Bucket', 2, 'the mujhe bhi nhi kri ho', 0, 0, 1, '0', '1', 1, '2022-06-06 11:33:10', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(217, 93, 42, 'Kids bear Bucket', 3, 'Bucket', 2, 'test ok', 0, 0, 1, '0', '1', 1, '2022-06-06 11:33:18', 10, 0, 1, 0, 0, 'Fixed', 'plus'),
(218, 93, 43, 'Hospital clothes bucket', 3, 'Bucket', 2, 'the mujhe bhi nhi kri ho', 0, 0, 1, '0', '1', 1, '2022-06-06 11:33:18', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(219, 96, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-06-07 12:43:06', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(220, 96, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-06-07 12:43:06', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(221, 97, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-07 12:43:40', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(222, 98, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-07 12:46:07', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(223, 98, 57, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-07 12:46:07', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(224, 101, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-06-07 03:05:03', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(225, 101, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-06-07 03:05:03', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(226, 102, 30, 'Shorten Sleeves', 1, 'Piece', 1, 'Testing', 25, 25, 1, '25', '8', 1, '2022-06-07 03:05:50', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(227, 102, 31, 'Turn Collar Taper Sides', 1, 'Piece', 1, 'Testing', 20, 20, 1, '20', '8', 1, '2022-06-07 03:05:50', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(228, 102, 79, 'trousers', 1, 'Piece', 1, 'testing', 50, 50, 1, '51', '8', 1, '2022-06-07 03:05:50', 1, 0.5, 0, 0, 0, 'Fixed', 'plus'),
(229, 103, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-06-07 03:24:07', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(230, 103, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-06-07 03:24:07', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(231, 103, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-07 03:24:07', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(232, 104, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-06-07 03:25:54', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(233, 104, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-06-07 03:25:54', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(234, 104, 57, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-07 03:25:54', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(235, 105, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-06-07 03:31:31', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(236, 105, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-06-07 03:31:31', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(237, 105, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-07 03:31:31', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(238, 105, 57, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-07 03:31:31', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(239, 106, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-06-07 05:13:23', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(240, 106, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-06-07 05:13:23', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(241, 106, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-07 05:13:23', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(242, 106, 57, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-07 05:13:23', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(243, 106, 62, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-07 05:13:23', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(244, 107, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-06-07 05:19:42', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(245, 107, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-06-07 05:19:42', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(246, 107, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-07 05:19:42', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(247, 107, 57, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-07 05:19:42', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(248, 108, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-06-07 05:32:19', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(249, 108, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-07 05:32:19', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(250, 109, 54, 'Jacket', 1, 'Piece', 1, 'Testing Description', 10, 10, 1, '11', '2', 1, '2022-06-07 05:38:53', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(251, 109, 36, 'test', 1, 'Piece', 2, 'test', 0, 100, 1, '110', '2', 1, '2022-06-07 05:38:53', 10, 10, 0, 0, 0, 'Fixed', 'plus'),
(252, 109, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-06-07 05:38:53', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(253, 109, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-07 05:38:53', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(254, 109, 57, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-07 05:38:53', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(255, 109, 40, 'test', 3, 'Bucket', 2, 'test', 0, 0, 1, '0', '1', 1, '2022-06-07 05:38:53', 10, 0, 1, 0, 0, 'Fixed', 'plus'),
(256, 109, 41, 'Ladies clothes bucket', 3, 'Bucket', 2, 'gvgvgv h sb theek hai abhi aap', 0, 0, 1, '0', '1', 1, '2022-06-07 05:38:53', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(257, 109, 42, 'Kids bear Bucket', 3, 'Bucket', 2, 'test ok', 0, 0, 1, '0', '1', 1, '2022-06-07 05:38:53', 10, 0, 1, 0, 0, 'Fixed', 'plus'),
(258, 110, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-06-07 06:55:51', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(259, 110, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-06-07 06:55:51', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(260, 110, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-07 06:55:51', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(261, 110, 57, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-07 06:55:51', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(262, 110, 62, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-07 06:55:51', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(263, 111, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-06-08 11:14:52', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(264, 111, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-06-08 11:14:52', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(265, 111, 62, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-08 11:14:52', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(266, 112, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-06-08 11:15:10', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(267, 112, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-06-08 11:15:10', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(268, 112, 62, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-08 11:15:10', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(269, 113, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-06-08 11:52:29', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(270, 113, 57, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-08 11:52:29', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(271, 113, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-06-08 11:52:29', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(272, 113, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-08 11:52:29', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(273, 114, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-06-08 11:53:05', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(274, 114, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-06-08 11:53:05', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(275, 114, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-08 11:53:05', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(276, 114, 57, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-08 11:53:05', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(277, 115, 57, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-08 11:53:43', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(278, 115, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-06-08 11:53:43', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(279, 116, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-06-08 12:50:28', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(280, 116, 57, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-08 12:50:28', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(281, 117, 62, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-08 12:51:50', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(282, 117, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-08 12:51:50', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(283, 117, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-06-08 12:51:50', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(284, 118, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-08 12:52:13', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(285, 118, 57, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-08 12:52:13', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(286, 118, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-06-08 12:52:13', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(288, 109, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '', 1, '2022-06-08 13:50:15', 0, 0, 0, 255, 0, 'Fixed', 'plus'),
(289, 109, 57, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 3, '30', '', 1, '2022-06-08 14:25:57', 0, 0, 0, 255, 0, 'Fixed', 'plus'),
(290, 109, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 2, '20', '', 1, '2022-06-08 14:27:25', 0, 0, 0, 255, 0, 'Fixed', 'plus'),
(291, 119, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-06-08 02:59:21', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(292, 119, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-08 02:59:21', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(293, 119, 57, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-08 02:59:21', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(294, 120, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-06-08 03:14:41', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(295, 120, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-06-08 03:14:41', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(296, 121, 91, 'saree', 1, 'Piece', 2, 'test', 50, 40, 1, '40', '6', 1, '2022-06-08 04:44:59', 1, 0.4, 0, 0, 0, 'Fixed', 'plus'),
(297, 122, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-06-08 05:20:06', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(298, 122, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-06-08 05:20:06', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(299, 122, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-08 05:20:06', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(300, 123, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-06-08 05:22:11', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(301, 123, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-06-08 05:22:11', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(302, 123, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-08 05:22:11', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(303, 123, 57, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-08 05:22:11', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(304, 124, 32, 'test', 1, 'Piece', 2, 'tesg', 200, 150, 1, '150', '2', 1, '2022-06-08 05:26:22', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(305, 125, 36, 'test', 1, 'Piece', 2, 'test', 0, 100, 1, '110', '2', 1, '2022-06-08 05:28:28', 10, 10, 0, 0, 0, 'Fixed', 'plus'),
(306, 126, 71, 'testing', 1, 'Piece', 2, 'test', 12, 12, 1, '12', '2', 1, '2022-06-08 05:31:34', 1, 0.12, 0, 0, 0, 'Fixed', 'plus'),
(307, 127, 71, 'testing', 1, 'Piece', 2, 'test', 12, 12, 1, '12', '2', 1, '2022-06-08 05:54:08', 1, 0.12, 0, 0, 0, 'Fixed', 'plus'),
(308, 128, 36, 'test', 1, 'Piece', 2, 'test', 0, 100, 1, '110', '2', 1, '2022-06-08 06:42:12', 10, 10, 0, 0, 0, 'Fixed', 'plus'),
(309, 129, 36, 'test', 1, 'Piece', 2, 'test', 0, 100, 1, '110', '2', 1, '2022-06-08 09:46:11', 10, 10, 0, 0, 0, 'Fixed', 'plus'),
(310, 129, 28, 'New Lining', 1, 'Piece', 2, 'Testing', 130, 130, 1, '130', '5', 1, '2022-06-08 09:46:11', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(311, 129, 29, 'Elbow Patch', 1, 'Piece', 2, 'Testing', 30, 30, 1, '30', '5', 1, '2022-06-08 09:46:11', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(312, 133, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-06-14 12:00:10', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(313, 133, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-06-14 12:00:10', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(314, 134, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-06-14 12:21:42', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(315, 134, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-06-14 12:21:42', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(316, 135, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-06-14 09:10:52', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(317, 135, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-06-14 09:10:52', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(318, 135, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-14 09:10:52', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(319, 136, 32, 'test', 1, 'Piece', 2, 'tesg', 200, 150, 1, '150', '2', 1, '2022-06-15 05:36:26', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(320, 136, 54, 'Jacket', 1, 'Piece', 1, 'Testing Description', 10, 10, 4, '44', '2', 1, '2022-06-15 05:36:26', 10, 4, 0, 0, 0, 'Fixed', 'plus'),
(321, 136, 71, 'testing', 1, 'Piece', 2, 'test', 12, 12, 4, '48', '2', 1, '2022-06-15 05:36:26', 1, 0.48, 0, 0, 0, 'Fixed', 'plus'),
(322, 136, 72, 'qa test', 1, 'Piece', 2, 'test', 10, 1, 5, '6', '2', 1, '2022-06-15 05:36:26', 12, 0.6, 0, 0, 0, 'Fixed', 'plus'),
(323, 136, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-06-15 05:36:26', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(324, 136, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-15 05:36:26', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(325, 136, 40, 'test', 3, 'Bucket', 2, 'test', 0, 0, 1, '0', '1', 1, '2022-06-15 05:36:26', 10, 0, 1, 0, 0, 'Fixed', 'plus'),
(326, 136, 41, 'Ladies clothes bucket', 3, 'Bucket', 2, 'gvgvgv h sb theek hai abhi aap', 0, 0, 1, '0', '1', 1, '2022-06-15 05:36:26', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(327, 136, 42, 'Kids bear Bucket', 3, 'Bucket', 2, 'test ok', 0, 0, 1, '0', '1', 1, '2022-06-15 05:36:26', 10, 0, 1, 0, 0, 'Fixed', 'plus'),
(328, 137, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-06-16 10:57:17', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(329, 137, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-16 10:57:17', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(330, 137, 22, 'Shorten Sleeves Bottom', 1, 'Piece', 1, 'Testing', 35, 35, 1, '35', '4', 1, '2022-06-16 10:57:17', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(331, 137, 92, 'Alteration jackets 1', 1, 'Piece', 2, 'test', 100, 99, 1, '100', '4', 1, '2022-06-16 10:57:17', 1, 0.99, 0, 0, 0, 'Fixed', 'plus'),
(332, 138, 32, 'test', 1, 'Piece', 2, 'tesg', 200, 150, 1, '150', '2', 1, '2022-06-16 11:09:42', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(333, 139, 41, 'Ladies clothes bucket', 3, 'Bucket', 2, 'gvgvgv h sb theek hai abhi aap', 0, 0, 1, '0', '1', 1, '2022-06-16 11:46:44', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(334, 140, 85, 'lucknowi clothing', 3, 'Bucket', 2, 'laundry', 0, 0, 1, '0', '2', 1, '2022-06-16 11:54:13', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(335, 140, 71, 'testing', 1, 'Piece', 2, 'test', 12, 12, 1, '12', '2', 1, '2022-06-16 11:54:13', 1, 0.12, 0, 0, 0, 'Fixed', 'plus'),
(336, 140, 88, 'marvel', 3, 'Bucket', 2, 'wash wash wash', 0, 0, 1, '0', '2', 1, '2022-06-16 11:54:13', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(337, 140, 92, 'Alteration jackets 1', 1, 'Piece', 2, 'test', 100, 99, 1, '100', '4', 1, '2022-06-16 11:54:13', 1, 0.99, 0, 0, 0, 'Fixed', 'plus'),
(338, 140, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '', 1, '2022-06-16 12:08:16', 0, 0, 0, 334, 0, 'Fixed', 'plus'),
(339, 140, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 2, '20', '', 1, '2022-06-16 12:08:20', 0, 0, 0, 334, 0, 'Fixed', 'plus'),
(340, 140, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 5, '50', '', 1, '2022-06-16 12:08:26', 0, 0, 0, 334, 0, 'Fixed', 'plus'),
(341, 140, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 2, '14', '', 1, '2022-06-16 12:08:42', 0, 0, 0, 336, 0, 'Fixed', 'plus'),
(342, 140, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 3, '30', '', 1, '2022-06-16 12:08:46', 0, 0, 0, 336, 0, 'Fixed', 'plus'),
(343, 140, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '', 1, '2022-06-16 12:08:49', 0, 0, 0, 336, 0, 'Fixed', 'plus'),
(344, 141, 71, 'testing', 1, 'Piece', 2, 'test', 12, 12, 1, '12', '2', 1, '2022-06-16 12:13:53', 1, 0.12, 0, 0, 0, 'Fixed', 'plus'),
(345, 141, 78, 'test', 3, 'Bucket', 2, 'testing', 0, 0, 1, '0', '2', 1, '2022-06-16 12:13:53', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(346, 141, 88, 'marvel', 3, 'Bucket', 2, 'wash wash wash', 0, 0, 1, '0', '2', 1, '2022-06-16 12:13:53', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(347, 141, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '10', '', 1, '2022-06-16 12:23:47', 10, 1, 0, 345, 0, 'Fixed', 'plus'),
(348, 141, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 2, '14', '', 1, '2022-06-16 12:23:51', 0, 0, 0, 345, 0, 'Fixed', 'plus'),
(349, 141, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '', 1, '2022-06-16 12:23:54', 0, 0, 0, 345, 0, 'Fixed', 'plus'),
(350, 141, 82, 'test2', 1, 'Piece', 2, 'test', 100, 99, 1, '99', '', 1, '2022-06-16 12:23:57', 0, 0, 0, 345, 0, 'Fixed', 'plus'),
(351, 141, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 2, '20', '', 1, '2022-06-16 12:24:07', 10, 2, 0, 346, 0, 'Fixed', 'plus'),
(352, 141, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 2, '14', '', 1, '2022-06-16 12:24:10', 0, 0, 0, 346, 0, 'Fixed', 'plus'),
(353, 141, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 2, '20', '', 1, '2022-06-16 12:24:13', 0, 0, 0, 346, 0, 'Fixed', 'plus'),
(354, 142, 85, 'lucknowi clothing', 3, 'Bucket', 2, 'laundry', 0, 0, 1, '0', '2', 1, '2022-06-16 12:31:39', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(355, 142, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '', 1, '2022-06-16 12:32:55', 0, 0, 0, 354, 0, 'Fixed', 'plus'),
(356, 142, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '', 1, '2022-06-16 12:32:58', 0, 0, 0, 354, 0, 'Fixed', 'plus'),
(357, 142, 84, 'Manoj', 1, 'Piece', 2, 'test by choice', 12, 12, 1, '12', '', 1, '2022-06-16 12:33:03', 1, 0.12, 0, 354, 0, 'Fixed', 'plus'),
(358, 143, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-06-16 02:49:51', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(359, 144, 32, 'test', 1, 'Piece', 2, 'tesg', 200, 150, 1, '150', '2', 1, '2022-06-16 03:06:21', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(360, 145, 32, 'test', 1, 'Piece', 2, 'tesg', 200, 150, 1, '150', '2', 1, '2022-06-16 03:26:05', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(361, 145, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-06-16 03:26:05', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(362, 145, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-06-16 03:26:05', 0, 0, 0, 0, 0, 'Fixed', 'plus');
INSERT INTO `booking_list_item` (`id`, `booking_id`, `item_id`, `item_name`, `unit_id`, `unit_name`, `country_id`, `item_description`, `price`, `offer_price`, `qty`, `total_amount`, `category_name`, `category_id`, `added_date_time`, `tax_percent`, `tax_amt`, `is_type_bucket`, `bucket_id`, `inc_amount`, `inc_type`, `inc_operation`) VALUES
(363, 145, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-16 03:26:05', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(364, 146, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-06-16 03:36:46', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(365, 147, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-06-16 04:11:39', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(366, 148, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-06-16 06:12:58', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(367, 149, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-06-17 01:18:49', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(368, 149, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-06-17 01:18:49', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(369, 149, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-17 01:18:49', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(370, 150, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-06-17 01:20:46', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(371, 150, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-06-17 01:20:46', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(372, 150, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-17 01:20:46', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(373, 150, 82, 'test2', 1, 'Piece', 2, 'test', 100, 99, 1, '99', '1', 1, '2022-06-17 01:20:46', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(374, 151, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-06-23 04:08:46', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(375, 151, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-06-23 04:08:46', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(376, 152, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-06-28 01:16:41', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(377, 152, 82, 'test2', 1, 'Piece', 2, 'test', 100, 99, 1, '99', '1', 1, '2022-06-28 01:16:41', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(378, 152, 41, 'Ladies clothes bucket', 3, 'Bucket', 2, 'gvgvgv h sb theek hai abhi aap', 0, 0, 1, '0', '1', 1, '2022-06-28 01:16:41', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(379, 152, 42, 'Kids bear Bucket', 3, 'Bucket', 2, 'test ok', 0, 0, 1, '0', '1', 1, '2022-06-28 01:16:41', 10, 0, 1, 0, 0, 'Fixed', 'plus'),
(380, 153, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-06-29 04:34:04', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(381, 153, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-06-29 04:34:04', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(382, 154, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-06-29 04:58:42', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(383, 154, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-06-29 04:58:42', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(384, 155, 82, 'test2', 1, 'Piece', 2, 'test', 100, 99, 1, '99', '1', 1, '2022-06-29 05:05:25', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(385, 156, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-06-29 05:09:55', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(386, 156, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-06-29 05:09:55', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(387, 157, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 2, '22', '1', 1, '2022-07-09 04:30:36', 10, 2, 0, 0, 0, 'Fixed', 'plus'),
(388, 157, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-07-09 04:30:36', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(389, 158, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-07-11 12:00:30', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(390, 158, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-07-11 12:00:30', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(391, 158, 41, 'Ladies clothes bucket', 3, 'Bucket', 2, 'gvgvgv h sb theek hai abhi aap', 0, 0, 1, '0', '1', 1, '2022-07-11 12:00:30', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(392, 159, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-07-11 12:44:07', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(393, 159, 41, 'Ladies clothes bucket', 3, 'Bucket', 2, 'gvgvgv h sb theek hai abhi aap', 0, 0, 1, '0', '1', 1, '2022-07-11 12:44:07', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(394, 159, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 2, '20', '', 1, '2022-07-11 12:55:57', 0, 0, 0, 393, 0, 'Fixed', 'plus'),
(395, 159, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 5, '35', '', 1, '2022-07-11 12:56:01', 0, 0, 0, 393, 0, 'Fixed', 'plus'),
(396, 159, 82, 'test2', 1, 'Piece', 2, 'test', 100, 99, 5, '495', '', 1, '2022-07-11 12:56:14', 0, 0, 0, 393, 0, 'Fixed', 'plus'),
(397, 159, 54, 'Jacket', 1, 'Piece', 1, 'Testing Description', 10, 10, 2, '20', '', 2, '2022-07-11 12:56:33', 10, 2, 0, 393, 0, 'Fixed', 'plus'),
(398, 160, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 10, 10, 1, '11', '1', 1, '2022-07-20 11:09:43', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(399, 160, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 7, 7, 1, '7', '1', 1, '2022-07-20 11:09:43', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(400, 160, 40, 'test', 3, 'Bucket', 2, 'test', 0, 0, 1, '0', '1', 1, '2022-07-20 11:09:43', 10, 0, 1, 0, 0, 'Fixed', 'plus'),
(401, 160, 41, 'Ladies clothes bucket', 3, 'Bucket', 2, 'gvgvgv h sb theek hai abhi aap', 0, 0, 1, '0', '1', 1, '2022-07-20 11:09:43', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(402, 160, 42, 'Kids bear Bucket', 3, 'Bucket', 2, 'test ok', 0, 0, 1, '0', '1', 1, '2022-07-20 11:09:43', 10, 0, 1, 0, 0, 'Fixed', 'plus'),
(403, 160, 43, 'Hospital clothes bucket', 3, 'Bucket', 2, 'the mujhe bhi nhi kri ho', 0, 0, 1, '0', '1', 1, '2022-07-20 11:09:43', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(404, 160, 49, 'Ladies clothes bucket', 3, 'Bucket', 2, 'gvgvgv h sb theek hai abhi aap', 0, 0, 1, '0', '1', 1, '2022-07-20 11:09:43', 0, 0, 1, 0, 0, 'Fixed', 'plus'),
(405, 160, 55, 'test', 1, 'Piece', 2, 'Testing Description', 10, 10, 1, '10', '1', 1, '2022-07-20 11:09:43', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(406, 160, 82, 'test2', 1, 'Piece', 2, 'test', 100, 99, 1, '99', '1', 1, '2022-07-20 11:09:43', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(407, 160, 84, 'Manoj', 1, 'Piece', 2, 'test by choice', 12, 12, 1, '12', '1', 1, '2022-07-20 11:09:43', 1, 0.12, 0, 0, 0, 'Fixed', 'plus'),
(408, 160, 32, 'test', 1, 'Piece', 2, 'tesg', 200, 150, 1, '150', '2', 1, '2022-07-20 11:09:43', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(409, 160, 54, 'Jacket', 1, 'Piece', 1, 'Testing Description', 10, 10, 1, '11', '2', 1, '2022-07-20 11:09:43', 10, 1, 0, 0, 0, 'Fixed', 'plus'),
(410, 160, 36, 'test', 1, 'Piece', 2, 'test', 0, 100, 1, '110', '2', 1, '2022-07-20 11:09:43', 10, 10, 0, 0, 0, 'Fixed', 'plus'),
(411, 160, 71, 'testing', 1, 'Piece', 2, 'test', 12, 12, 1, '12', '2', 1, '2022-07-20 11:09:43', 1, 0.12, 0, 0, 0, 'Fixed', 'plus'),
(412, 160, 72, 'qa test', 1, 'Piece', 2, 'test', 10, 1, 1, '1', '2', 1, '2022-07-20 11:09:43', 12, 0.12, 0, 0, 0, 'Fixed', 'plus'),
(413, 160, 22, 'Shorten Sleeves Bottom', 1, 'Piece', 1, 'Testing', 35, 35, 1, '35', '4', 1, '2022-07-20 11:09:43', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(414, 160, 92, 'Alteration jackets 1', 1, 'Piece', 2, 'test', 100, 99, 1, '100', '4', 1, '2022-07-20 11:09:43', 1, 0.99, 0, 0, 0, 'Fixed', 'plus'),
(415, 160, 28, 'New Lining', 1, 'Piece', 2, 'Testing', 130, 130, 1, '130', '5', 1, '2022-07-20 11:09:43', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(416, 160, 29, 'Elbow Patch', 1, 'Piece', 2, 'Testing', 30, 30, 1, '30', '5', 1, '2022-07-20 11:09:43', 0, 0, 0, 0, 0, 'Fixed', 'plus'),
(417, 161, 49, 'Ladies clothes bucket', 3, 'Bucket', 2, 'gvgvgv h sb theek hai abhi aap', 0, 0, 1, '0', '1', 1, '2022-07-20 12:59:33', 0, 0, 1, 0, 20, 'Percent', 'plus'),
(418, 161, 40, 'test', 3, 'Bucket', 2, 'test', 0, 0, 1, '0', '1', 1, '2022-07-20 12:59:33', 10, 0, 1, 0, 20, 'Percent', 'plus'),
(419, 161, 41, 'Ladies clothes bucket', 3, 'Bucket', 2, 'gvgvgv h sb theek hai abhi aap', 0, 0, 1, '0', '1', 1, '2022-07-20 12:59:33', 0, 0, 1, 0, 20, 'Percent', 'plus'),
(420, 161, 42, 'Kids bear Bucket', 3, 'Bucket', 2, 'test ok', 0, 0, 1, '0', '1', 1, '2022-07-20 12:59:33', 10, 0, 1, 0, 20, 'Percent', 'plus'),
(421, 161, 43, 'Hospital clothes bucket', 3, 'Bucket', 2, 'the mujhe bhi nhi kri ho', 0, 0, 1, '0', '1', 1, '2022-07-20 12:59:33', 0, 0, 1, 0, 20, 'Percent', 'plus'),
(422, 161, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 1, '13', '1', 1, '2022-07-20 12:59:33', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(423, 161, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 8.4, 8.4, 1, '9', '1', 1, '2022-07-20 12:59:33', 5, 0.42, 0, 0, 20, 'Percent', 'plus'),
(424, 161, 82, 'test2', 1, 'Piece', 2, 'test', 120, 118.8, 1, '125', '1', 1, '2022-07-20 12:59:33', 5, 5.94, 0, 0, 20, 'Percent', 'plus'),
(425, 161, 84, 'Manoj', 1, 'Piece', 2, 'test by choice', 14.4, 14.4, 1, '15', '1', 1, '2022-07-20 12:59:33', 5, 0.72, 0, 0, 20, 'Percent', 'plus'),
(426, 161, 32, 'test', 1, 'Piece', 2, 'tesg', 240, 180, 1, '189', '2', 1, '2022-07-20 12:59:33', 5, 9, 0, 0, 20, 'Percent', 'plus'),
(427, 161, 36, 'test', 1, 'Piece', 2, 'test', 0, 120, 1, '126', '2', 1, '2022-07-20 12:59:33', 5, 6, 0, 0, 20, 'Percent', 'plus'),
(428, 161, 54, 'Jacket', 1, 'Piece', 1, 'Testing Description', 12, 12, 1, '13', '2', 1, '2022-07-20 12:59:33', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(429, 161, 71, 'testing', 1, 'Piece', 2, 'test', 14.4, 14.4, 1, '15', '2', 1, '2022-07-20 12:59:33', 5, 0.72, 0, 0, 20, 'Percent', 'plus'),
(430, 161, 72, 'qa test', 1, 'Piece', 2, 'test', 12, 1.2, 1, '1', '2', 1, '2022-07-20 12:59:33', 5, 0.06, 0, 0, 20, 'Percent', 'plus'),
(431, 161, 73, 'testing by qa', 1, 'Piece', 2, 'test', 12, 1.2, 1, '1', '2', 1, '2022-07-20 12:59:33', 5, 0.06, 0, 0, 20, 'Percent', 'plus'),
(432, 161, 22, 'Shorten Sleeves Bottom', 1, 'Piece', 1, 'Testing', 42, 42, 1, '44', '4', 1, '2022-07-20 12:59:33', 5, 2.1, 0, 0, 20, 'Percent', 'plus'),
(433, 161, 92, 'Alteration jackets 1', 1, 'Piece', 2, 'test', 120, 118.8, 1, '125', '4', 1, '2022-07-20 12:59:33', 5, 5.94, 0, 0, 20, 'Percent', 'plus'),
(434, 161, 70, 'jacket and trouser', 3, 'Bucket', 2, 'washing', 0, 0, 1, '0', '1', 1, '2022-07-20 12:59:33', 0, 0, 1, 0, 20, 'Percent', 'plus'),
(435, 162, 82, 'test2', 1, 'Piece', 2, 'test', 120, 118.8, 1, '125', '1', 1, '2022-07-20 01:15:19', 5, 5.94, 0, 0, 20, 'Percent', 'plus'),
(436, 162, 40, 'test', 3, 'Bucket', 2, 'test', 0, 0, 1, '0', '1', 1, '2022-07-20 01:15:19', 10, 0, 1, 0, 20, 'Percent', 'plus'),
(437, 162, 41, 'Ladies clothes bucket', 3, 'Bucket', 2, 'gvgvgv h sb theek hai abhi aap', 0, 0, 1, '0', '1', 1, '2022-07-20 01:15:19', 0, 0, 1, 0, 20, 'Percent', 'plus'),
(438, 162, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 1, '13', '1', 1, '2022-07-20 01:15:19', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(439, 162, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 8.4, 8.4, 1, '9', '1', 1, '2022-07-20 01:15:19', 5, 0.42, 0, 0, 20, 'Percent', 'plus'),
(440, 162, 55, 'test', 1, 'Piece', 2, 'Testing Description', 12, 12, 1, '13', '1', 1, '2022-07-20 01:15:19', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(441, 163, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 1, '13', '1', 1, '2022-07-20 04:15:04', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(442, 163, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 8.4, 8.4, 1, '9', '1', 1, '2022-07-20 04:15:04', 5, 0.42, 0, 0, 20, 'Percent', 'plus'),
(443, 163, 55, 'test', 1, 'Piece', 2, 'Testing Description', 12, 12, 1, '13', '1', 1, '2022-07-20 04:15:04', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(444, 163, 40, 'test', 3, 'Bucket', 2, 'test', 0, 0, 1, '0', '1', 1, '2022-07-20 04:15:04', 10, 0, 1, 0, 20, 'Percent', 'plus'),
(445, 164, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 8.4, 8.4, 1, '9', '1', 1, '2022-07-21 11:04:16', 5, 0.42, 0, 0, 20, 'Percent', 'plus'),
(446, 164, 55, 'test', 1, 'Piece', 2, 'Testing Description', 12, 12, 1, '13', '1', 1, '2022-07-21 11:04:16', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(447, 164, 84, 'Manoj', 1, 'Piece', 2, 'test by choice', 14.4, 14.4, 1, '15', '1', 1, '2022-07-21 11:04:16', 5, 0.72, 0, 0, 20, 'Percent', 'plus'),
(448, 164, 41, 'Ladies clothes bucket', 3, 'Bucket', 2, 'gvgvgv h sb theek hai abhi aap', 0, 0, 1, '0', '1', 1, '2022-07-21 11:04:16', 0, 0, 1, 0, 20, 'Percent', 'plus'),
(449, 164, 32, 'test', 1, 'Piece', 2, 'tesg', 240, 180, 1, '189', '2', 1, '2022-07-21 11:04:16', 5, 9, 0, 0, 20, 'Percent', 'plus'),
(450, 164, 36, 'test', 1, 'Piece', 2, 'test', 0, 120, 1, '126', '2', 1, '2022-07-21 11:04:16', 5, 6, 0, 0, 20, 'Percent', 'plus'),
(451, 164, 54, 'Jacket', 1, 'Piece', 1, 'Testing Description', 12, 12, 1, '13', '2', 1, '2022-07-21 11:04:16', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(452, 164, 40, 'test', 3, 'Bucket', 2, 'test', 0, 0, 1, '0', '1', 1, '2022-07-21 11:04:16', 10, 0, 1, 0, 20, 'Percent', 'plus'),
(453, 164, 82, 'test2', 1, 'Piece', 2, 'test', 120, 118.8, 1, '125', '1', 1, '2022-07-21 11:04:16', 5, 5.94, 0, 0, 20, 'Percent', 'plus'),
(454, 165, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 1, '13', '1', 1, '2022-07-21 11:05:07', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(455, 165, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 8.4, 8.4, 1, '9', '1', 1, '2022-07-21 11:05:07', 5, 0.42, 0, 0, 20, 'Percent', 'plus'),
(456, 166, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 1, '13', '1', 1, '2022-07-21 11:05:42', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(457, 167, 84, 'Manoj', 1, 'Piece', 2, 'test by choice', 14.4, 14.4, 1, '15', '1', 1, '2022-07-21 11:21:16', 5, 0.72, 0, 0, 20, 'Percent', 'plus'),
(458, 167, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 1, '13', '1', 1, '2022-07-21 11:21:16', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(459, 168, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 1, '13', '1', 1, '2022-07-21 11:30:38', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(460, 168, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 8.4, 8.4, 1, '9', '1', 1, '2022-07-21 11:30:38', 5, 0.42, 0, 0, 20, 'Percent', 'plus'),
(461, 169, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 1, '13', '1', 1, '2022-07-21 11:35:59', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(462, 169, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 8.4, 8.4, 1, '9', '1', 1, '2022-07-21 11:35:59', 5, 0.42, 0, 0, 20, 'Percent', 'plus'),
(463, 170, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 1, '13', '1', 1, '2022-07-21 11:51:16', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(464, 170, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 8.4, 8.4, 1, '9', '1', 1, '2022-07-21 11:51:16', 5, 0.42, 0, 0, 20, 'Percent', 'plus'),
(465, 171, 55, 'test', 1, 'Piece', 2, 'Testing Description', 12, 12, 1, '13', '1', 1, '2022-07-21 11:59:43', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(466, 171, 41, 'Ladies clothes bucket', 3, 'Bucket', 2, 'gvgvgv h sb theek hai abhi aap', 0, 0, 1, '0', '1', 1, '2022-07-21 11:59:43', 0, 0, 1, 0, 20, 'Percent', 'plus'),
(467, 171, 40, 'test', 3, 'Bucket', 2, 'test', 0, 0, 1, '0', '1', 1, '2022-07-21 11:59:43', 10, 0, 1, 0, 20, 'Percent', 'plus'),
(468, 171, 82, 'test2', 1, 'Piece', 2, 'test', 120, 118.8, 1, '125', '1', 1, '2022-07-21 11:59:43', 5, 5.94, 0, 0, 20, 'Percent', 'plus'),
(469, 172, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 1, '13', '1', 1, '2022-07-21 12:05:31', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(470, 172, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 8.4, 8.4, 1, '9', '1', 1, '2022-07-21 12:05:31', 5, 0.42, 0, 0, 20, 'Percent', 'plus'),
(471, 172, 55, 'test', 1, 'Piece', 2, 'Testing Description', 12, 12, 1, '13', '1', 1, '2022-07-21 12:05:31', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(472, 173, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 1, '13', '1', 1, '2022-07-21 12:08:19', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(473, 173, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 8.4, 8.4, 1, '9', '1', 1, '2022-07-21 12:08:19', 5, 0.42, 0, 0, 20, 'Percent', 'plus'),
(474, 174, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 1, '13', '1', 1, '2022-07-21 12:13:13', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(475, 174, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 8.4, 8.4, 1, '9', '1', 1, '2022-07-21 12:13:13', 5, 0.42, 0, 0, 20, 'Percent', 'plus'),
(476, 174, 55, 'test', 1, 'Piece', 2, 'Testing Description', 12, 12, 1, '13', '1', 1, '2022-07-21 12:13:13', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(477, 175, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 1, '13', '1', 1, '2022-07-21 01:00:55', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(478, 175, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 8.4, 8.4, 1, '9', '1', 1, '2022-07-21 01:00:55', 5, 0.42, 0, 0, 20, 'Percent', 'plus'),
(479, 175, 55, 'test', 1, 'Piece', 2, 'Testing Description', 12, 12, 1, '13', '1', 1, '2022-07-21 01:00:55', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(480, 176, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 1, '13', '1', 1, '2022-07-21 01:52:25', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(481, 176, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 8.4, 8.4, 1, '9', '1', 1, '2022-07-21 01:52:25', 5, 0.42, 0, 0, 20, 'Percent', 'plus'),
(482, 177, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 1, '13', '1', 1, '2022-07-21 01:53:48', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(483, 177, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 8.4, 8.4, 1, '9', '1', 1, '2022-07-21 01:53:48', 5, 0.42, 0, 0, 20, 'Percent', 'plus'),
(484, 178, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 1, '13', '1', 1, '2022-07-21 02:06:56', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(485, 178, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 8.4, 8.4, 1, '9', '1', 1, '2022-07-21 02:06:56', 5, 0.42, 0, 0, 20, 'Percent', 'plus'),
(486, 179, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 1, '13', '1', 1, '2022-07-21 02:11:55', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(487, 179, 82, 'test2', 1, 'Piece', 2, 'test', 120, 118.8, 1, '125', '1', 1, '2022-07-21 02:11:55', 5, 5.94, 0, 0, 20, 'Percent', 'plus'),
(488, 180, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 1, '13', '1', 1, '2022-07-21 02:12:29', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(489, 180, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 8.4, 8.4, 1, '9', '1', 1, '2022-07-21 02:12:29', 5, 0.42, 0, 0, 20, 'Percent', 'plus'),
(490, 180, 40, 'test', 3, 'Bucket', 2, 'test', 0, 0, 1, '0', '1', 1, '2022-07-21 02:12:29', 10, 0, 1, 0, 20, 'Percent', 'plus'),
(491, 181, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 1, '13', '1', 1, '2022-07-21 02:12:29', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(492, 181, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 8.4, 8.4, 1, '9', '1', 1, '2022-07-21 02:12:29', 5, 0.42, 0, 0, 20, 'Percent', 'plus'),
(493, 182, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 1, '13', '1', 1, '2022-07-21 02:13:28', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(494, 182, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 8.4, 8.4, 1, '9', '1', 1, '2022-07-21 02:13:28', 5, 0.42, 0, 0, 20, 'Percent', 'plus'),
(495, 182, 41, 'Ladies clothes bucket', 3, 'Bucket', 2, 'gvgvgv h sb theek hai abhi aap', 0, 0, 1, '0', '1', 1, '2022-07-21 02:13:28', 0, 0, 1, 0, 20, 'Percent', 'plus'),
(496, 182, 42, 'Kids bear Bucket', 3, 'Bucket', 2, 'test ok', 0, 0, 1, '0', '1', 1, '2022-07-21 02:13:28', 10, 0, 1, 0, 20, 'Percent', 'plus'),
(497, 182, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 8.4, 8.4, 2, '17', '', 1, '2022-07-21 14:15:49', 5, 0.84, 0, 495, 20, 'Percent', 'plus'),
(498, 182, 84, 'Manoj', 1, 'Piece', 2, 'test by choice', 14.4, 14.4, 3, '43', '', 1, '2022-07-21 14:15:56', 5, 2.16, 0, 495, 20, 'Percent', 'plus'),
(499, 182, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 1, '12', '', 1, '2022-07-21 14:16:04', 5, 0.6, 0, 495, 20, 'Percent', 'plus'),
(500, 182, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 2, '24', '', 1, '2022-07-21 14:16:49', 5, 1.2, 0, 496, 20, 'Percent', 'plus'),
(501, 182, 84, 'Manoj', 1, 'Piece', 2, 'test by choice', 14.4, 14.4, 1, '14', '', 1, '2022-07-21 14:16:55', 5, 0.72, 0, 496, 20, 'Percent', 'plus'),
(502, 182, 82, 'test2', 1, 'Piece', 2, 'test', 120, 118.8, 2, '238', '', 1, '2022-07-21 15:31:42', 5, 11.88, 0, 496, 20, 'Percent', 'plus'),
(503, 183, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 1, '13', '1', 1, '2022-07-22 01:57:08', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(504, 183, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 8.4, 8.4, 1, '9', '1', 1, '2022-07-22 01:57:08', 5, 0.42, 0, 0, 20, 'Percent', 'plus'),
(505, 183, 42, 'Kids bear Bucket', 3, 'Bucket', 2, 'test ok', 0, 0, 1, '0', '1', 1, '2022-07-22 01:57:08', 10, 0, 1, 0, 20, 'Percent', 'plus'),
(506, 183, 85, 'lucknowi clothing', 3, 'Bucket', 2, 'laundry', 0, 0, 1, '0', '2', 1, '2022-07-22 01:57:08', 0, 0, 1, 0, 20, 'Percent', 'plus'),
(507, 184, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 1, '13', '1', 1, '2022-07-22 03:40:36', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(508, 184, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 8.4, 8.4, 1, '9', '1', 1, '2022-07-22 03:40:36', 5, 0.42, 0, 0, 20, 'Percent', 'plus'),
(509, 185, 84, 'Manoj', 1, 'Piece', 2, 'test by choice', 14.4, 14.4, 1, '15', '1', 1, '2022-07-22 03:42:22', 5, 0.72, 0, 0, 20, 'Percent', 'plus'),
(510, 185, 82, 'test2', 1, 'Piece', 2, 'test', 120, 118.8, 1, '125', '1', 1, '2022-07-22 03:42:22', 5, 5.94, 0, 0, 20, 'Percent', 'plus'),
(511, 185, 55, 'test', 1, 'Piece', 2, 'Testing Description', 12, 12, 1, '13', '1', 1, '2022-07-22 03:42:22', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(512, 185, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 8.4, 8.4, 1, '9', '1', 1, '2022-07-22 03:42:22', 5, 0.42, 0, 0, 20, 'Percent', 'plus'),
(513, 185, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 1, '13', '1', 1, '2022-07-22 03:42:22', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(514, 186, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 1, '13', '1', 1, '2022-07-22 04:05:04', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(515, 186, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 8.4, 8.4, 1, '9', '1', 1, '2022-07-22 04:05:04', 5, 0.42, 0, 0, 20, 'Percent', 'plus'),
(516, 186, 55, 'test', 1, 'Piece', 2, 'Testing Description', 12, 12, 1, '13', '1', 1, '2022-07-22 04:05:04', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(517, 186, 82, 'test2', 1, 'Piece', 2, 'test', 120, 118.8, 1, '125', '1', 1, '2022-07-22 04:05:04', 5, 5.94, 0, 0, 20, 'Percent', 'plus'),
(518, 186, 84, 'Manoj', 1, 'Piece', 2, 'test by choice', 14.4, 14.4, 1, '15', '1', 1, '2022-07-22 04:05:04', 5, 0.72, 0, 0, 20, 'Percent', 'plus'),
(519, 186, 32, 'test', 1, 'Piece', 2, 'tesg', 240, 180, 1, '189', '2', 1, '2022-07-22 04:05:04', 5, 9, 0, 0, 20, 'Percent', 'plus'),
(520, 186, 54, 'Jacket', 1, 'Piece', 1, 'Testing Description', 12, 12, 1, '13', '2', 1, '2022-07-22 04:05:04', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(521, 186, 36, 'test', 1, 'Piece', 2, 'test', 0, 120, 1, '126', '2', 1, '2022-07-22 04:05:04', 5, 6, 0, 0, 20, 'Percent', 'plus'),
(522, 186, 71, 'testing', 1, 'Piece', 2, 'test', 14.4, 14.4, 1, '15', '2', 1, '2022-07-22 04:05:04', 5, 0.72, 0, 0, 20, 'Percent', 'plus'),
(523, 186, 72, 'qa test', 1, 'Piece', 2, 'test', 12, 1.2, 1, '1', '2', 1, '2022-07-22 04:05:04', 5, 0.06, 0, 0, 20, 'Percent', 'plus'),
(524, 187, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 1, '13', '1', 1, '2022-07-22 04:05:36', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(525, 188, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 1, '13', '1', 1, '2022-07-22 04:29:41', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(526, 188, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 8.4, 8.4, 1, '9', '1', 1, '2022-07-22 04:29:41', 5, 0.42, 0, 0, 20, 'Percent', 'plus'),
(527, 188, 55, 'test', 1, 'Piece', 2, 'Testing Description', 12, 12, 1, '13', '1', 1, '2022-07-22 04:29:41', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(528, 188, 82, 'test2', 1, 'Piece', 2, 'test', 120, 118.8, 1, '125', '1', 1, '2022-07-22 04:29:41', 5, 5.94, 0, 0, 20, 'Percent', 'plus'),
(529, 188, 28, 'New Lining', 1, 'Piece', 2, 'Testing', 156, 156, 1, '164', '5', 1, '2022-07-22 04:29:41', 5, 7.8, 0, 0, 20, 'Percent', 'plus'),
(530, 188, 29, 'Elbow Patch', 1, 'Piece', 2, 'Testing', 36, 36, 1, '38', '5', 1, '2022-07-22 04:29:41', 5, 1.8, 0, 0, 20, 'Percent', 'plus'),
(531, 189, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 1, '13', '1', 1, '2022-07-22 04:32:31', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(532, 189, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 8.4, 8.4, 1, '9', '1', 1, '2022-07-22 04:32:31', 5, 0.42, 0, 0, 20, 'Percent', 'plus'),
(533, 189, 55, 'test', 1, 'Piece', 2, 'Testing Description', 12, 12, 1, '13', '1', 1, '2022-07-22 04:32:31', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(534, 190, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 1, '13', '1', 1, '2022-07-22 04:33:11', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(535, 191, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 1, '13', '1', 1, '2022-07-22 04:33:19', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(536, 191, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 8.4, 8.4, 1, '9', '1', 1, '2022-07-22 04:33:19', 5, 0.42, 0, 0, 20, 'Percent', 'plus'),
(537, 192, 55, 'test', 1, 'Piece', 2, 'Testing Description', 12, 12, 1, '13', '1', 1, '2022-07-22 04:43:40', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(538, 192, 82, 'test2', 1, 'Piece', 2, 'test', 120, 118.8, 1, '125', '1', 1, '2022-07-22 04:43:40', 5, 5.94, 0, 0, 20, 'Percent', 'plus'),
(539, 192, 41, 'Ladies clothes bucket', 3, 'Bucket', 2, 'gvgvgv h sb theek hai abhi aap', 0, 0, 1, '0', '1', 1, '2022-07-22 04:43:40', 0, 0, 1, 0, 20, 'Percent', 'plus'),
(540, 192, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 2, '24', '', 1, '2022-07-22 16:58:57', 5, 1.2, 0, 539, 20, 'Percent', 'plus'),
(541, 192, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 8.4, 8.4, 2, '17', '', 1, '2022-07-22 16:59:01', 5, 0.84, 0, 539, 20, 'Percent', 'plus'),
(542, 192, 55, 'test', 1, 'Piece', 2, 'Testing Description', 12, 12, 1, '12', '', 1, '2022-07-22 16:59:37', 5, 0.6, 0, 539, 20, 'Percent', 'plus'),
(543, 192, 32, 'test', 1, 'Piece', 2, 'tesg', 240, 180, 1, '180', '', 2, '2022-07-22 16:59:46', 5, 9, 0, 539, 20, 'Percent', 'plus'),
(544, 193, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 1, '13', '1', 1, '2022-07-25 12:17:52', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(545, 193, 42, 'Kids bear Bucket', 3, 'Bucket', 2, 'test ok', 0, 0, 1, '0', '1', 1, '2022-07-25 12:17:52', 10, 0, 1, 0, 20, 'Percent', 'plus'),
(546, 194, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 1, '13', '1', 1, '2022-07-25 01:29:00', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(547, 194, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 8.4, 8.4, 1, '9', '1', 1, '2022-07-25 01:29:00', 5, 0.42, 0, 0, 20, 'Percent', 'plus'),
(548, 195, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 1, '13', '1', 1, '2022-07-25 01:30:51', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(549, 195, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 8.4, 8.4, 1, '9', '1', 1, '2022-07-25 01:30:51', 5, 0.42, 0, 0, 20, 'Percent', 'plus'),
(550, 196, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 8.4, 8.4, 1, '9', '1', 1, '2022-07-25 01:58:01', 5, 0.42, 0, 0, 20, 'Percent', 'plus'),
(551, 196, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 1, '13', '1', 1, '2022-07-25 01:58:01', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(552, 196, 78, 'test', 3, 'Bucket', 2, 'testing', 0, 0, 1, '0', '2', 1, '2022-07-25 01:58:01', 0, 0, 1, 0, 20, 'Percent', 'plus'),
(553, 196, 28, 'New Lining', 1, 'Piece', 2, 'Testing', 156, 156, 1, '164', '5', 1, '2022-07-25 01:58:01', 5, 7.8, 0, 0, 20, 'Percent', 'plus'),
(554, 196, 36, 'test', 1, 'Piece', 2, 'test', 0, 120, 1, '126', '2', 1, '2022-07-25 01:58:01', 5, 6, 0, 0, 20, 'Percent', 'plus'),
(555, 196, 55, 'test', 1, 'Piece', 2, 'Testing Description', 12, 12, 1, '12', '', 1, '2022-07-25 13:58:29', 5, 0.6, 0, 552, 20, 'Percent', 'plus'),
(556, 197, 17, 'test', 1, 'Piece', 2, 'Testing Description ok', 12, 12, 1, '13', '1', 1, '2022-07-25 02:58:28', 5, 0.6, 0, 0, 20, 'Percent', 'plus'),
(557, 198, 72, 'qa test', 1, 'Piece', 2, 'test', 12, 1.2, 1, '1', '2', 1, '2022-07-25 03:06:10', 5, 0.06, 0, 0, 20, 'Percent', 'plus'),
(558, 192, 32, 'test', 1, 'Piece', 2, 'tesg', 240, 180, 1, '180', '', 2, '2022-07-25 15:14:03', 5, 9, 0, 539, 20, 'Percent', 'plus'),
(559, 192, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 8.4, 8.4, 4, '34', '', 1, '2022-07-25 15:14:50', 5, 1.68, 0, 539, 20, 'Percent', 'plus'),
(560, 199, 18, 'Trousers', 1, 'Piece', 2, 'Testing', 8.4, 8.4, 1, '9', '1', 1, '2022-07-25 04:45:01', 5, 0.42, 0, 0, 20, 'Percent', 'plus'),
(561, 200, 22, 'Shorten Sleeves Bottom', 1, 'Piece', 1, 'Testing', 42, 42, 1, '44', '4', 1, '2022-07-25 05:39:07', 5, 2.1, 0, 0, 20, 'Percent', 'plus');

-- --------------------------------------------------------

--
-- Table structure for table `booking_status`
--

CREATE TABLE `booking_status` (
  `id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `status` int(5) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking_status`
--

INSERT INTO `booking_status` (`id`, `type_id`, `type`, `status`) VALUES
(1, 0, 'Placed', 1),
(2, 1, 'Confirm', 1),
(3, 2, 'Pickup Boy Alloted', 1),
(4, 3, 'Order Picked Up', 1),
(5, 4, 'Received At Loundry', 1),
(6, 5, 'Inprocess', 1),
(7, 6, 'Order Ready', 1),
(8, 7, 'Allot For Drop', 1),
(9, 8, 'Delivered', 1),
(10, 9, 'Cancelled', 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `icon` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `sno` int(11) NOT NULL,
  `is_display_to_bucket` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `icon`, `status`, `sno`, `is_display_to_bucket`) VALUES
(1, 'DRY CLEANING', 'drywash.png', 1, 0, 1),
(2, 'Laundry', 'washicon.png', 1, 0, 1),
(3, 'Alterations Trousers', 'alteration_trouser.png', 1, 0, 0),
(4, 'Alterations Jackets', 'alterationjacket.png', 1, 0, 0),
(5, 'Alterations Coats', 'Alterations_Coats.png', 1, 0, 0),
(6, 'Alteration Dresses', 'alteration_dresses.png', 1, 0, 0),
(7, 'Alteration Skirt', 'alteration_skirt.png', 1, 0, 0),
(8, 'Alterations shirt', 'Alterations_shirt.png', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `country_list`
--

CREATE TABLE `country_list` (
  `id` int(11) NOT NULL,
  `country_name` text COLLATE utf8_unicode_ci NOT NULL,
  `currency_name` text COLLATE utf8_unicode_ci NOT NULL,
  `currency_symbol` text COLLATE utf8_unicode_ci NOT NULL,
  `country_short_name` text COLLATE utf8_unicode_ci NOT NULL,
  `country_phone_code` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `country_list`
--

INSERT INTO `country_list` (`id`, `country_name`, `currency_name`, `currency_symbol`, `country_short_name`, `country_phone_code`) VALUES
(1, 'India', 'INR', 'Rs.', 'ind', '+91'),
(2, 'United Kingdom', 'Pound', '£', 'uk', '+44');

-- --------------------------------------------------------

--
-- Table structure for table `day_list`
--

CREATE TABLE `day_list` (
  `id` int(11) NOT NULL,
  `day_name` text COLLATE utf8_unicode_ci NOT NULL,
  `day_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `day_list`
--

INSERT INTO `day_list` (`id`, `day_name`, `day_no`) VALUES
(1, 'Sunday', 1),
(2, 'Monday', 2),
(3, 'Tuesday', 3),
(4, 'Wednesday', 4),
(5, 'Thursday', 5),
(6, 'Friday', 6),
(7, 'Saturday', 7);

-- --------------------------------------------------------

--
-- Table structure for table `increase_decrease`
--

CREATE TABLE `increase_decrease` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `increase_decrease` enum('plus','minus') COLLATE utf8_unicode_ci NOT NULL,
  `amount_type` enum('Percent','Fix') COLLATE utf8_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `applicable_on` enum('Overall','Products') COLLATE utf8_unicode_ci NOT NULL,
  `from_date` date NOT NULL,
  `from_time` time NOT NULL,
  `from_date_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `to_date` date NOT NULL,
  `to_time` time NOT NULL,
  `to_date_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(11) NOT NULL,
  `created_date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `vendor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `increase_decrease`
--

INSERT INTO `increase_decrease` (`id`, `title`, `increase_decrease`, `amount_type`, `amount`, `applicable_on`, `from_date`, `from_time`, `from_date_time`, `to_date`, `to_time`, `to_date_time`, `status`, `created_date_time`, `vendor_id`) VALUES
(20, 'Peak time charge', 'plus', 'Percent', 20, 'Products', '2022-07-19', '12:00:00', '2022-07-19 12:00:00', '2022-07-31', '10:00:00', '2022-07-31 10:00:00', 1, '2022-07-20 06:46:53', 12),
(21, 'Rainy day', 'plus', 'Percent', 10, 'Overall', '2022-07-19', '16:53:00', '2022-07-19 16:53:00', '2022-07-31', '13:53:00', '2022-07-31 13:53:00', 1, '2022-07-20 17:59:52', 12),
(22, 'July offer', 'minus', 'Percent', 5, 'Overall', '2022-07-19', '07:59:00', '2022-07-19 07:59:00', '2022-07-31', '11:35:00', '2022-07-31 11:35:00', 0, '2022-07-26 11:44:00', 12),
(25, 'testing perpose', 'plus', 'Percent', 10, 'Products', '2022-07-20', '12:48:00', '2022-07-20 12:48:00', '2022-07-27', '18:00:00', '2022-07-27 18:00:00', 0, '2022-07-20 12:55:28', 12),
(28, 'testing', 'plus', '', 22, 'Overall', '2022-07-25', '16:21:00', '2022-07-25 16:21:00', '2022-07-28', '14:21:00', '2022-07-28 14:21:00', 1, '2022-07-25 16:21:54', 12),
(30, 'test', 'plus', 'Percent', 1, 'Overall', '2022-07-26', '11:54:00', '2022-07-26 11:54:00', '2022-07-27', '05:54:00', '2022-07-27 05:54:00', 1, '2022-07-26 11:54:44', 12);

-- --------------------------------------------------------

--
-- Table structure for table `loundry_banner`
--

CREATE TABLE `loundry_banner` (
  `id` int(11) NOT NULL,
  `banner_image` text COLLATE utf8_unicode_ci NOT NULL,
  `sno` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loundry_banner`
--

INSERT INTO `loundry_banner` (`id`, `banner_image`, `sno`, `vendor_id`) VALUES
(2, 'cheeseburger.jpeg', 2, 1),
(5, 'deliveryboy21.jpeg', 1, 8),
(6, 'deliveryboy1.jpeg', 2, 8),
(8, '1645875288d7Y1LGX3download.jpeg', 3, 4),
(10, '1645880336AyVRT0dcIMG-20220225-WA0004.jpg', 2, 9),
(11, '1646023712aYXwtEiOIMG_20220126_113849.jpg', 33, 4),
(32, '1651141781q4rIKQlt2239313239.png', 2, 12),
(34, '1651141826jkl28yiGimages.jpeg', 1, 12),
(36, '1651225359QjIFRkvXnew2.png', 10, 12),
(40, '1652788338RDekX3mhIMG_20191130_152441.jpg', 5, 12),
(43, '1652792818mHJQSnGyqueen-black-particle-board-fo-upqun02-forzza-black-original-imafn2p2fkxgzfzw.jpeg', 21, 12),
(46, '1654673048DyMJ9TbwScreenshot_20220608-113712.jpg', 23, 12),
(47, '1654694255Lcem3Mv11654694214460.jpg', 1888, 12),
(49, '1655376928sE0pkyv51654695088391.jpg', 6, 12);

-- --------------------------------------------------------

--
-- Table structure for table `loundry_day_list`
--

CREATE TABLE `loundry_day_list` (
  `id` int(11) NOT NULL,
  `day_name` text COLLATE utf8_unicode_ci NOT NULL,
  `day_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `sno` int(11) NOT NULL,
  `open_time` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.00',
  `close_time` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.00',
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loundry_day_list`
--

INSERT INTO `loundry_day_list` (`id`, `day_name`, `day_id`, `vendor_id`, `sno`, `open_time`, `close_time`, `status`) VALUES
(1, 'Sunday', 1, 1, 1, '10:01', '10:00', 1),
(2, 'Monday', 2, 1, 2, '12:00', '21:00', 1),
(3, 'Tuesday', 3, 1, 3, '0.00', '0.00', 1),
(4, 'Sunday', 1, 4, 1, '12:00', '14:00', 1),
(5, 'Wednesday', 4, 1, 4, '10:00', '22:00', 1),
(6, 'Monday', 2, 4, 2, '09:00', '22:00', 1),
(7, 'Saturday', 7, 4, 7, '09:00', '22:00', 1),
(8, 'Thursday', 5, 4, 5, '09:00', '22:00', 1),
(9, 'Friday', 6, 4, 6, '09:00', '20:00', 1),
(10, 'Thursday', 5, 8, 5, '10:00', '20:00', 1),
(11, 'Wednesday', 4, 4, 4, '09:00', '22:00', 1),
(12, 'Friday', 6, 1, 6, '10:00', '10:00', 1),
(13, 'Sunday', 1, 9, 1, '15:47  PM', '04:47  AM', 1),
(14, 'Tuesday', 3, 9, 3, '16:06  PM', '05:06  AM', 1),
(15, 'Monday', 2, 9, 2, '4:50 AM', '00:49 PM', 1),
(16, 'Wednesday', 4, 9, 4, '04:52 PM', '4:52 AM', 1),
(17, 'Tuesday', 3, 4, 3, '09:12 PM', '05:12 PM', 1),
(18, 'Sunday', 1, 12, 1, '08:00', '21:00', 0),
(19, 'Monday', 2, 12, 2, '09:00', '19:00', 1),
(20, 'Tuesday', 3, 12, 3, '09:00', '20:00', 1),
(21, 'Wednesday', 4, 12, 4, '09:00', '21:00', 1),
(22, 'Thursday', 5, 12, 5, '10:20:00', '20:20:00', 0),
(23, 'Friday', 6, 12, 6, '10:00', '20:00', 1),
(24, 'Saturday', 7, 12, 7, '09:00', '20:00', 0),
(25, 'Sunday', 1, 2, 1, '21:08', '21:08', 1),
(26, 'Monday', 2, 13, 2, '12:00', '13:00', 0),
(27, 'Sunday', 1, 15, 1, '07:30 PM', '11:35 PM', 1),
(28, 'Monday', 2, 15, 2, '7:35 AM', '07:35 PM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `loundry_item_list`
--

CREATE TABLE `loundry_item_list` (
  `id` int(11) NOT NULL,
  `item_name` text COLLATE utf8_unicode_ci NOT NULL,
  `item_price` double NOT NULL,
  `tax` double NOT NULL,
  `item_offer_price` double NOT NULL,
  `item_description` text COLLATE utf8_unicode_ci NOT NULL,
  `item_image` text COLLATE utf8_unicode_ci NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `added_date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_date_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sno` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `unit_name` text COLLATE utf8_unicode_ci NOT NULL,
  `is_type_bucket` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loundry_item_list`
--

INSERT INTO `loundry_item_list` (`id`, `item_name`, `item_price`, `tax`, `item_offer_price`, `item_description`, `item_image`, `vendor_id`, `category_id`, `status`, `added_date_time`, `update_date_time`, `sno`, `unit_id`, `country_id`, `unit_name`, `is_type_bucket`) VALUES
(2, 'Product Name', 10, 1, 10, 'Product Name', 'texturebg.jpg', 4, 1, 1, '2022-02-23 08:19:41', '2022-02-01 06:49:46', 0, 1, 2, 'Piece', 0),
(3, 'Product Name1', 10, 10, 10, 'asdfsadf', 'logo_driver1.png', 4, 1, 1, '2022-02-23 08:19:43', '2022-02-03 02:49:15', 0, 1, 2, 'Piece', 0),
(4, 'asdfsdf', 12, 12, 12, 'asdf', 'logo_driver2.png', 4, 1, 1, '2022-02-23 08:19:50', '2022-02-03 02:49:40', 0, 1, 2, 'Piece', 0),
(5, 'Shirt Wash', 120, 18, 110, 'tesing desricption', 'butterpaw.jpeg', 4, 2, 1, '2022-02-23 08:19:55', '2022-02-06 11:25:33', 0, 1, 2, 'Piece', 0),
(6, 'T-Shirt', 100, 18, 80, 'er djfalkdf ', 'report_iconorg.png', 8, 1, 1, '2022-02-17 02:56:21', '2022-02-17 02:56:21', 0, 1, 1, 'Piece', 0),
(8, 'Jeans', 25, 5, 20, 'Testing description', '1646036796Nq03KL8Dtim_logo.png', 4, 3, 1, '2022-02-28 08:44:35', '0000-00-00 00:00:00', 0, 1, 2, 'Piece', 0),
(9, 'Fronk', 25, 5, 20, 'Testing description', '1646037862iXnPlhsvtim_logo.png', 4, 3, 1, '2022-02-28 14:14:22', '0000-00-00 00:00:00', 0, 1, 2, 'Piece', 0),
(12, 'test', 100, 5, 100, 'testingjdvdg vdbdh', '1646117972wF3rVCJcms_ej9rs_512_53748593.jpg', 4, 1, 1, '2022-03-01 12:29:32', '0000-00-00 00:00:00', 0, 1, 2, 'Piece', 0),
(13, 'gfufu', 180, 5, 180, 'gyfufig', '16461180930lHPWmnbms_6xvq4_512_41782530.jpg', 4, 4, 0, '2022-03-01 12:31:33', '0000-00-00 00:00:00', 0, 1, 2, 'Piece', 0),
(16, 'iron and clean', 150, 0, 150, 'testing perpose', '1646155307LXNvtGI6ms_cjkvv_512_46955505_8f1c9b4dd8066_l.jpg', 4, 1, 1, '2022-03-01 22:51:47', '0000-00-00 00:00:00', 0, 2, 1, 'KG', 0),
(17, 'test', 10, 5, 10, 'Testing Description ok', '1648286680ijSeltXgimages.jpeg', 12, 1, 1, '2022-07-20 06:21:26', '2022-03-02 03:47:49', 0, 1, 2, 'Piece', 0),
(18, 'Trousers', 7, 5, 7, 'Testing', 'alteration_trouser1.png', 12, 1, 1, '2022-07-20 06:21:26', '2022-03-02 03:49:11', 0, 1, 2, 'Piece', 0),
(22, 'Shorten Sleeves Bottom', 35, 5, 35, 'Testing', 'alterationjacket2.png', 12, 4, 1, '2022-07-20 06:21:26', '2022-03-02 03:51:53', 0, 1, 1, 'Piece', 0),
(24, 'Shorten/Lengthen', 25, 5, 25, 'Testing', 'alteration_dresses1.png', 12, 6, 1, '2022-07-20 06:21:26', '2022-03-02 03:53:05', 0, 1, 2, 'Piece', 0),
(25, 'New Zip', 25, 5, 25, 'Testing', 'alteration_dresses2.png', 12, 6, 1, '2022-07-20 06:21:26', '2022-03-02 03:53:30', 0, 1, 2, 'Piece', 0),
(26, 'Shorten Plain', 25, 5, 25, 'Testing', 'alteration_skirt1.png', 12, 7, 1, '2022-07-20 06:21:26', '2022-03-02 03:54:06', 0, 1, 2, 'Piece', 0),
(27, 'Take-In Sides', 30, 5, 30, 'Testing', 'alteration_dresses3.png', 12, 6, 1, '2022-07-20 06:21:26', '2022-03-02 03:54:34', 0, 1, 2, 'Piece', 0),
(28, 'New Lining', 130, 5, 130, 'Testing', 'Alterations_Coats2.png', 12, 5, 1, '2022-07-20 06:21:26', '2022-03-02 03:55:45', 0, 1, 2, 'Piece', 0),
(29, 'Elbow Patch', 30, 5, 30, 'Testing', 'Alterations_Coats3.png', 12, 5, 1, '2022-07-20 06:21:26', '2022-03-02 03:56:08', 0, 1, 2, 'Piece', 0),
(30, 'Shorten Sleeves', 25, 5, 25, 'Testing', 'Alterations_shirt1.png', 12, 8, 1, '2022-07-20 06:21:26', '2022-03-02 03:56:35', 0, 1, 1, 'Piece', 0),
(32, 'test', 200, 5, 150, 'tesg', '1646223597KxkWJnIams_wc7vc_512_46955502_8f1c9b4dd8066_l.jpg', 12, 2, 1, '2022-07-20 06:21:26', '0000-00-00 00:00:00', 0, 1, 2, 'Piece', 0),
(34, 'cfhxf', 0, 12, 0, 'gb c n v', '1646493234gix6Jf1Zacmelogo.png', 4, 2, 1, '2022-03-05 20:43:55', '0000-00-00 00:00:00', 0, 1, 1, 'Piece', 0),
(35, 'Fronk ok', 25, 5, 20, 'Testing description', '1648273246nNj8HgKywallet_icon.png', 4, 3, 1, '2022-03-26 11:10:46', '0000-00-00 00:00:00', 0, 1, 1, 'Piece', 0),
(36, 'test', 0, 5, 100, 'test', '', 12, 2, 1, '2022-07-20 06:21:26', '0000-00-00 00:00:00', 0, 1, 2, 'Piece', 0),
(40, 'test', 0, 10, 0, 'test', '1648208780jIAnZvg8IMG_20220316_121522_739.jpg', 12, 1, 1, '2022-03-26 15:19:09', '0000-00-00 00:00:00', 0, 3, 2, 'Bucket', 1),
(41, 'Ladies clothes bucket', 0, 0, 0, 'gvgvgv h sb theek hai abhi aap', '1648283581seJ6FZGzimages.jpeg', 12, 1, 1, '2022-03-26 14:03:01', '0000-00-00 00:00:00', 0, 3, 2, 'Bucket', 1),
(42, 'Kids bear Bucket', 0, 10, 0, 'test ok', '1648283654ram2pCJgIMG_20220316_121529_614.jpg', 12, 1, 1, '2022-03-26 15:19:48', '0000-00-00 00:00:00', 0, 3, 2, 'Bucket', 1),
(43, 'Hospital clothes bucket', 0, 0, 0, 'the mujhe bhi nhi kri ho', '1648211209QRqbMI6PIMG-20220319-WA0004.jpg', 12, 1, 1, '2022-03-25 17:56:49', '0000-00-00 00:00:00', 0, 3, 2, 'Bucket', 1),
(44, 'Fronk', 25, 5, 20, 'Testing description', '1648273220Vwnjmca0wallet_icon.png', 4, 3, 1, '2022-03-26 11:10:20', '0000-00-00 00:00:00', 0, 1, 1, 'Piece', 0),
(45, 'Fronk ok', 25, 5, 20, 'Testing description', '1648273246nNj8HgKywallet_icon.png', 4, 3, 1, '2022-03-26 11:10:46', '0000-00-00 00:00:00', 0, 1, 1, 'Piece', 0),
(46, 'Shirt', 0, 5, 0, 'Testing description', '', 4, 3, 1, '2022-03-26 11:37:03', '0000-00-00 00:00:00', 0, 3, 1, 'Bucket', 1),
(49, 'Ladies clothes bucket', 0, 0, 0, 'gvgvgv h sb theek hai abhi aap', '1648283581seJ6FZGzimages.jpeg', 12, 1, 1, '2022-03-26 14:03:01', '0000-00-00 00:00:00', 0, 3, 2, 'Bucket', 1),
(54, 'Jacket', 10, 5, 10, 'Testing Description', '16482847018zjsFr0MIMG_20220316_121529_614.jpg', 12, 2, 1, '2022-07-20 06:21:26', '0000-00-00 00:00:00', 0, 1, 1, 'Piece', 0),
(55, 'test', 10, 5, 10, 'Testing Description', '1648284750Yi8v530nimages.jpeg', 12, 1, 1, '2022-07-20 06:21:26', '0000-00-00 00:00:00', 0, 1, 2, 'Piece', 0),
(70, 'jacket and trouser', 0, 0, 0, 'washing', '16488201138qL1NybWScreenshot_20220316-092206.jpg', 12, 1, 1, '2022-04-01 19:05:13', '0000-00-00 00:00:00', 0, 3, 2, 'Bucket', 1),
(71, 'testing', 12, 5, 12, 'test', '1650262515Dnv7ja6JScreenshot_20220404-121150.jpg', 12, 2, 1, '2022-07-20 06:21:26', '0000-00-00 00:00:00', 0, 1, 2, 'Piece', 0),
(72, 'qa test', 10, 5, 1, 'test', '1650371674megrdT4ZScreenshot_20220418-185704.jpg', 12, 2, 1, '2022-07-20 06:21:26', '0000-00-00 00:00:00', 0, 1, 2, 'Piece', 0),
(73, 'testing by qa', 10, 5, 1, 'test', '1650372739L9nZgPe7Screenshot_20220413-151019.jpg', 12, 2, 1, '2022-07-20 06:21:26', '0000-00-00 00:00:00', 0, 1, 2, 'Piece', 0),
(74, 'long dress', 15, 5, 12, 'test', '1650628527rEVj9MbASAVE_20220422_161546.jpg', 12, 7, 0, '2022-07-20 06:21:26', '0000-00-00 00:00:00', 0, 1, 1, 'Piece', 0),
(75, 'Long Dress with minamina jathre lights', 15, 5, 12, 'jacket', '1650627991a63ZjJ5YSAVE_20220422_161546.jpg', 12, 3, 0, '2022-07-20 06:21:26', '0000-00-00 00:00:00', 0, 3, 2, 'Bucket', 0),
(77, 'long dress', 10, 5, 10, 'dress', '1659373134SyVlL49wScreenshot_20220801-180145.jpg', 12, 2, 0, '2022-08-01 22:28:54', '0000-00-00 00:00:00', 0, 1, 2, 'Piece', 0),
(78, 'test', 0, 0, 0, 'testing', '', 12, 2, 1, '2022-04-28 15:44:01', '0000-00-00 00:00:00', 0, 3, 2, 'Bucket', 1),
(82, 'test2', 100, 5, 99, 'test', '16511487321SMW6fPdcar-wash.png', 12, 1, 1, '2022-07-20 06:21:26', '0000-00-00 00:00:00', 0, 1, 2, 'Piece', 0),
(83, 'test', 100, 0, 99, 'test', '', 1, 1, 0, '2022-04-29 13:59:31', '0000-00-00 00:00:00', 0, 1, 2, 'Piece', 0),
(84, 'Manoj', 12, 5, 12, 'test by choice', '1653734653XRW9VMZJ91755094.png', 12, 1, 1, '2022-07-20 06:21:26', '0000-00-00 00:00:00', 0, 1, 2, 'Piece', 0),
(85, 'lucknowi clothing', 0, 0, 0, 'laundry', '1651814315IPdXVpAGScreenshot_2022-04-28-21-41-21-476_com.labmoneta.anakindonesia.jpg', 12, 2, 1, '2022-05-06 11:01:02', '0000-00-00 00:00:00', 0, 3, 2, 'Bucket', 1),
(88, 'marvel', 0, 0, 0, 'wash wash wash', '1652794314SYLATzbW1652794293054.jpg', 12, 2, 1, '2022-05-23 14:59:36', '0000-00-00 00:00:00', 0, 3, 2, 'Bucket', 1),
(90, 'Prod1', 250, 12, 230, 'desc', '16535740260aZwiFtQIMG_20220205_164733_928.jpg', 15, 1, 1, '2022-05-26 19:37:06', '0000-00-00 00:00:00', 0, 1, 1, 'Piece', 0),
(92, 'Alteration jackets 1', 100, 5, 99, 'test', '165496958038Jemcrhtest 1.png', 12, 4, 1, '2022-07-20 06:21:26', '0000-00-00 00:00:00', 0, 1, 2, 'Piece', 0),
(93, 'woolen cloth bucket', 0, 0, 0, 'testing', '1655369598WtL2Zgen1654694214460.jpg', 12, 2, 0, '2022-06-16 14:24:07', '0000-00-00 00:00:00', 0, 3, 2, 'Bucket', 1);

-- --------------------------------------------------------

--
-- Table structure for table `loundry_list`
--

CREATE TABLE `loundry_list` (
  `id` int(11) NOT NULL,
  `vendor_name` text COLLATE utf8_unicode_ci NOT NULL,
  `vendor_lat` double NOT NULL,
  `vendor_long` double NOT NULL,
  `vendor_display_address` text COLLATE utf8_unicode_ci NOT NULL,
  `vendor_gps_address` text COLLATE utf8_unicode_ci NOT NULL,
  `vendor_image` text COLLATE utf8_unicode_ci NOT NULL,
  `contact_person_name` text COLLATE utf8_unicode_ci NOT NULL,
  `contact_number` text COLLATE utf8_unicode_ci NOT NULL,
  `contact_password` text COLLATE utf8_unicode_ci NOT NULL,
  `contact_email_id` text COLLATE utf8_unicode_ci NOT NULL,
  `vendor_registration_certificate` text COLLATE utf8_unicode_ci NOT NULL,
  `identity_card` text COLLATE utf8_unicode_ci NOT NULL,
  `identity_card_number` text COLLATE utf8_unicode_ci NOT NULL,
  `wallet_balance` double NOT NULL,
  `device_token` text COLLATE utf8_unicode_ci NOT NULL,
  `loundry_info` text COLLATE utf8_unicode_ci NOT NULL,
  `vendor_status` int(11) NOT NULL,
  `otp_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vendor_otp_status` int(11) NOT NULL,
  `vendor_registration_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `average_rating` double NOT NULL,
  `total_review` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `commission_percent` double NOT NULL,
  `type` text COLLATE utf8_unicode_ci NOT NULL,
  `is_recomended` int(11) NOT NULL,
  `is_verified` int(11) NOT NULL,
  `sno` int(11) NOT NULL,
  `is_normal_delivery` int(11) NOT NULL,
  `normal_delivery_hours` double NOT NULL,
  `normal_delivery_charge` double NOT NULL,
  `is_express_delivery` int(11) NOT NULL,
  `express_delivery_hours` double NOT NULL,
  `express_delivery_charge` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loundry_list`
--

INSERT INTO `loundry_list` (`id`, `vendor_name`, `vendor_lat`, `vendor_long`, `vendor_display_address`, `vendor_gps_address`, `vendor_image`, `contact_person_name`, `contact_number`, `contact_password`, `contact_email_id`, `vendor_registration_certificate`, `identity_card`, `identity_card_number`, `wallet_balance`, `device_token`, `loundry_info`, `vendor_status`, `otp_code`, `vendor_otp_status`, `vendor_registration_date`, `average_rating`, `total_review`, `country_id`, `commission_percent`, `type`, `is_recomended`, `is_verified`, `sno`, `is_normal_delivery`, `normal_delivery_hours`, `normal_delivery_charge`, `is_express_delivery`, `express_delivery_hours`, `express_delivery_charge`) VALUES
(1, 'test', 26.889087677001953, 80.99110412597656, 'om plaza', 'om plaza', 'stebelaundry.jpeg', '', '9415964405', '1234', 'sv@gmail.com', 'loundryimage.jpeg', 'loundryimage.jpeg', '3456789', 0, 'cizKeWtkSRKH8MU7riBmqG:APA91bHMRnYWBZcLRalNRF_ocAnLSAW2JXG24tdR_hYp3kByA-hM9POiACXPAHWP25h2blnSHewRjyjq2ObOQjTAPU051Da8nStED3lH3_HQ25k8MPqPdk8nUQOJ9gCsES4v3bNIlOw2', 'test', 1, NULL, 1, '2022-07-20 09:40:00', 0, 0, 2, 0, 'Loundry', 1, 1, 7, 1, 36, 50, 1, 8, 150),
(2, 'John Loundry House', 26.8935032, 80.9903685, '12 Crystal Palace Parade, Norwood, London SE19 1UA, United Kingdom', '12 Crystal Palace Parade, Norwood, London SE19 1UA, United Kingdom', 'loundryimage.jpeg', '', '9876543210', '1234', 'sv@gmail.com', 'loundryimage.jpeg', 'loundryimage.jpeg', '3498230482093', 0, '', 'Testing', 1, 'ZS4n', 1, '2022-03-26 05:55:14', 0, 0, 2, 0, 'Loundry', 1, 1, 6, 1, 36, 50, 1, 8, 150),
(3, 'UB Admin', 26.8935032, 80.9903685, '12 Crystal Palace Parade, Norwood, London SE19 1UA, United Kingdom', '12 Crystal Palace Parade, Norwood, London SE19 1UA, United Kingdom', 'loundryimage.jpeg', '', 'ADMINUBER', '1234', 'sv@gmail.com', 'loundryimage.jpeg', 'loundryimage.jpeg', '3498230482093', 0, '', '', 1, NULL, 1, '2022-03-26 05:55:14', 0, 0, 1, 0, 'Admin', 1, 1, 5, 1, 36, 50, 1, 8, 150),
(4, 'Demo Loundry Org', 26.94127069135909, 80.99098965525627, 'Unnamed Road, Barkhurdarpur, Uttar Pradesh 226026, India,null,Barkhurdarpur,Uttar Pradesh,226026', 'Unnamed Road, Barkhurdarpur, Uttar Pradesh 226026, India,null,Barkhurdarpur,Uttar Pradesh,226026', 'slider22.jpeg', 'Ramashish chauhan', '9999999999', '1234', 'pk@gmail.com', '1646493161FGsEOvSbIMG_20220304_090516_888.jpg', '16464633078cWpyEbGacmelogo.png', '2463568566', 13, 'dWPWP11WRNKKp-zYa0aCIa:APA91bEoBz94qnIOZvTgwLT4zgZL5WJDlvqAZpAfbPoUt2L8QCjQNHwhOEEpmJr2CEyue_TXMD98rn1bFLRVheNruAb5CCG251hebiTUsI9nVXeoykjOuD8tSQkKfrIECEejdD0BcTNt', 'Service-On-Time Program For Your Business. Call Our Hotline Anytime! View Resources. Dedicated Team. Read Blog. Highlights: On-Request Quote Available, Serving Since 1976, Financing Available.', 1, NULL, 1, '2022-03-26 05:55:14', 0, 0, 1, 0, 'Loundry', 1, 1, 4, 1, 36, 50, 1, 8, 150),
(8, 'Kaile loundry System', 26.8798933, 80.9926327, 'Indira Nagar', 'Indira Nagar, Lucknow, Uttar Pradesh, India', 'kaile.jpeg', '', '9415964403', '1234', 'kaile@gmail.com', '', '', '', 0, '', 'Afjaslk. dfalkjdflk dfajdlk', 1, NULL, 0, '2022-03-26 05:55:14', 0, 0, 2, 0, 'Loundry', 1, 1, 1, 1, 36, 50, 1, 8, 150),
(12, 'Mayfair Dry Cleaners.', 26.886581061322413, 80.98580695688725, '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', '19/48,, Indira nagar, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', '1655370001NDqPYv7MSAVE_20220422_161546.jpg', 'Mayfair', '1111111111', '1234', 'mayfair@gmail.com', '1646464511VN1ximP4IMG-20220305-WA0006.jpg', '1646487570aQM4hGBp1641556536275.jpg', '626464', -5.54, 'cr_9zTlbSyO0UQggRcvCtM:APA91bHqKS2GxQhP7serEf2ktFDJrPr8jIj0jzY5bBUQaessKoic_z_qYSkynK2bNR0e1AJcDbKDtJVh_FnFXQWiOlGjQyPewqMG4FQj0vcHUgT2Dg917eKLII7qw0cX2_c19kSkZAra', 'Located in Mayfair at the heart of Westminster, we have been providing excellent service on the premises since 1967. Staff are SATRA trained and qualified to ensure you?re receiving the very best in laundry and tailoring services. Every item that passes through our doors is inspected, treated for stains, cleaned, hand finished and, if necessary, repaired or altered. We always like to go that extra mile for our customers.', 1, NULL, 0, '2023-02-22 11:53:49', 0, 0, 2, 10, 'Loundry', 1, 1, 0, 1, 42, 19, 1, 12, 65),
(13, 'tedt', 26.88908576965332, 80.99109649658203, 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', 'SHOP NO 107 OM PLAZA SECTOR 19 NEAR SECTOR 17 SABJI MANDI INDIRA NAGAR, Chandanapur, Indira Nagar, Lucknow, Uttar Pradesh 226016, India,Indira Nagar,Lucknow,Uttar Pradesh,226016', '1651216867PFRBKhbOIMG_20220418_220012_790.jpg', 'vhv', '9644061566', '1234', 'chauhanramashish2027@gmail.com', '1651216867pNI8gl5FScreenshot_20220418-172431.jpg', '1651216867gbBkoZ0cScreenshot_20220428-184612.jpg', '55658060', 0, '', 'bj j', 0, '3418', 0, '2022-04-29 07:21:07', 0, 0, 2, 0, 'Loundry', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(14, 'test', 26.889087677001953, 80.99110412597656, 'om plaza', 'om plaza', '1651217087R01PZH7rWhatsApp Image 2022-04-27 at 12.54.19 PM.jpeg', 'test', '9415964407', '1234', 'test@gmail.com', '1651217087Ja4KMlpZtruck-moving.png', '1651217087Y2zKWaDcwatermark.png', '3456789', 0, '', 'test', 0, '4062', 0, '2022-04-29 07:24:47', 0, 0, 2, 0, 'Loundry', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15, 'Demo Rakesh', 28.554973602294922, 77.33773040771484, 'C-254, Chhalera, C Block, Sector 44, Noida, Uttar Pradesh 201303, India,Sector 44,Noida,Uttar Pradesh,201303', 'C-254, Chhalera, C Block, Sector 44, Noida, Uttar Pradesh 201303, India,Sector 44,Noida,Uttar Pradesh,201303', '1653573824TonftBJEIMG_20220205_164733_928.jpg', 'Rakesh', '8860254198', '12345', 'rakesh.iise@gmail.com', '1653573824sjqvGMbgIMG_20220419_125204_672.jpg', '1653573824GaSi45f6IMG_20220419_125214_359.jpg', '12345', 0, 'cWrY3z83QM6NYXkM_R473s:APA91bFDM4-Gne5HWmuz4E8uG4dAXevZ2rL8jn33qMGBgFlOEiVUgKHqt-0SOvG5nL0lB2IqLEjWnX_2_U4wKMyoMBIeY_0L5Ttwe1ig_VVADKMZFBOyswuawIS1R-chUtuDh-5Sm83V', 'laundry info', 1, '8567', 1, '2022-05-26 16:20:41', 0, 0, 1, 0, 'Loundry', 0, 1, 0, 1, 4, 50, 1, 1, 100);

-- --------------------------------------------------------

--
-- Table structure for table `loundry_time_list`
--

CREATE TABLE `loundry_time_list` (
  `id` int(11) NOT NULL,
  `day_name` text COLLATE utf8_unicode_ci NOT NULL,
  `day_id` int(11) NOT NULL,
  `day_sno` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `org_slot_time` time NOT NULL,
  `display_slot_time` text COLLATE utf8_unicode_ci NOT NULL,
  `org_time_slot_to` time NOT NULL,
  `display_time_slot_to` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loundry_time_list`
--

INSERT INTO `loundry_time_list` (`id`, `day_name`, `day_id`, `day_sno`, `vendor_id`, `org_slot_time`, `display_slot_time`, `org_time_slot_to`, `display_time_slot_to`) VALUES
(2, 'Wednesday', 21, 4, 12, '11:00:00', '11:00 AM', '12:00:00', '12:00 PM'),
(3, 'Wednesday', 21, 4, 12, '13:00:00', '1:00 PM', '14:00:00', '2:00 PM'),
(4, 'Wednesday', 21, 4, 12, '15:00:00', '3:00 PM', '16:00:00', '4:00 PM'),
(5, 'Wednesday', 21, 4, 12, '17:00:00', '5:00 PM', '18:00:00', '6:00 PM'),
(6, 'Wednesday', 21, 4, 12, '20:00:00', '8:00 PM', '21:00:00', '9:00 PM'),
(7, 'Monday', 19, 2, 12, '09:00:00', '9:00 AM', '10:00:00', '10:00 AM'),
(8, 'Monday', 19, 2, 12, '11:00:00', '11:00 AM', '12:00:00', '12:00 PM'),
(9, 'Monday', 19, 2, 12, '15:00:00', '3:00 PM', '16:00:00', '4:00 PM'),
(10, 'Tuesday', 20, 3, 12, '09:00:00', '9:00 AM', '10:00:00', '10:00 AM'),
(11, 'Tuesday', 20, 3, 12, '15:00:00', '3:00 PM', '16:00:00', '4:00 PM'),
(12, 'Tuesday', 20, 3, 12, '19:00:00', '7:00 PM', '20:00:00', '8:00 PM'),
(20, 'Sunday', 1, 1, 1, '21:53:00', '9:53 PM', '21:53:00', '9:53 PM'),
(21, 'Thursday', 8, 5, 4, '20:45:00', '8:45 PM', '00:45:00', '12:45 AM'),
(22, 'Monday', 19, 2, 12, '12:00:00', '12:00 PM', '14:00:00', '2:00 PM'),
(26, 'Sunday', 18, 1, 12, '08:00:00', '8:00 AM', '10:00:00', '10:00 AM'),
(27, 'Sunday', 1, 1, 1, '10:00:00', '10:00 AM', '12:00:00', '12:00 PM'),
(29, 'Monday', 28, 2, 15, '09:40:00', '9:40 AM', '19:40:00', '7:40 PM'),
(30, 'Monday', 28, 2, 15, '08:40:00', '8:40 AM', '19:40:00', '7:40 PM'),
(31, 'Monday', 28, 2, 15, '06:41:00', '6:41 AM', '19:41:00', '7:41 PM'),
(33, 'Monday', 19, 2, 12, '20:00:00', '8:00 PM', '22:30:00', '10:30 PM'),
(34, 'Saturday', 24, 7, 12, '11:00:00', '11:00 AM', '22:30:00', '10:30 PM'),
(35, 'Saturday', 24, 7, 12, '14:29:00', '2:29 PM', '02:33:00', '2:33 AM');

-- --------------------------------------------------------

--
-- Table structure for table `other_details`
--

CREATE TABLE `other_details` (
  `id` int(11) NOT NULL,
  `support_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `support_number` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `support_whatsapp_number` varchar(15) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `other_details`
--

INSERT INTO `other_details` (`id`, `support_email`, `support_number`, `support_whatsapp_number`) VALUES
(1, 'support@uberlaundry.com', '+91 9415964405', '+91 9415964405');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `laundry_id` int(11) NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `rating` double NOT NULL,
  `added_date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rider_listing`
--

CREATE TABLE `rider_listing` (
  `id` int(11) NOT NULL,
  `rider_name` text COLLATE utf8_unicode_ci NOT NULL,
  `rider_mobile_no` text COLLATE utf8_unicode_ci NOT NULL,
  `rider_email_id` text COLLATE utf8_unicode_ci NOT NULL,
  `rider_password` text COLLATE utf8_unicode_ci NOT NULL,
  `rider_confirm_password` text COLLATE utf8_unicode_ci NOT NULL,
  `rider_permanant_address` text COLLATE utf8_unicode_ci NOT NULL,
  `rider_identy_card_no` text COLLATE utf8_unicode_ci NOT NULL,
  `rider_identy_card_photo` text COLLATE utf8_unicode_ci NOT NULL,
  `rider_photo` text COLLATE utf8_unicode_ci NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `rider_status` int(11) NOT NULL,
  `rider_added_date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `wallet_balance` double NOT NULL,
  `device_token` text COLLATE utf8_unicode_ci,
  `device_type` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rider_listing`
--

INSERT INTO `rider_listing` (`id`, `rider_name`, `rider_mobile_no`, `rider_email_id`, `rider_password`, `rider_confirm_password`, `rider_permanant_address`, `rider_identy_card_no`, `rider_identy_card_photo`, `rider_photo`, `vendor_id`, `rider_status`, `rider_added_date_time`, `wallet_balance`, `device_token`, `device_type`) VALUES
(1, 'rider name', '7788787878', 'asdp@gmai.com', '1234', '1234', 'asdf', 'asdf', 'logo_driver3.png', 'logo.png', 6, 2, '2022-03-30 07:55:38', 0, 'fLUAOribQLerJQQLizKV7q:APA91bFbFB68pec35pCOjXAViNGaKNRdS7N9Flg5bjtGQIQOxclsbjtOBh_xLhC7CAZEqUQHeuayv1MfzlLuqSp9ScuQ1ZLKxOLurMYuh_-Mr1CQZebkqTnOmYrG2UYKNOXu6-TwEuXx', 'Android'),
(2, 'rider name', '9415964401', 'rajesh@gmail.com', '12341', '12341', 'my gps location', 'ASGDHGHD1545454', 'loundryimage.jpeg', 'eriksha.jpeg', 6, 1, '2022-02-16 10:06:29', 0, NULL, ''),
(3, 'test', '897489754184', 'pk11111@gmail.com', '1234', '1234', 'om plaza sector j', '2345678', '1645005915mYtvN465logo_driver.png', '1645005915wQGAJOhVlogo_driver.png', 1, 1, '2022-04-29 08:20:48', 0, NULL, ''),
(4, 'rider name', '8971489754184', 'pk111111@gmail.com', '12341', '12341', 'my gps location', 'ASGDHGHD1545454', '1645005941S3tCA02Elogo_driver.png', '1645005941zZjoRc6Nlogo_driver.png', 1, 0, '2022-02-16 04:05:41', 0, NULL, ''),
(5, 'Oliver', '7844989891', 'oliver@gmail.com', '1234', '1234', 'Om Plaza, Sector 19, Indira', '34723974928', '1653999260xLWvS05AScreenshot_20220526-232706_YouTube.png', '1653999260YxKW2oOHms_ssamk_512_35079459_8f1c9b4dd8066_l.jpg', 4, 1, '2022-05-31 12:14:20', 110, 'fLUAOribQLerJQQLizKV7q:APA91bFbFB68pec35pCOjXAViNGaKNRdS7N9Flg5bjtGQIQOxclsbjtOBh_xLhC7CAZEqUQHeuayv1MfzlLuqSp9ScuQ1ZLKxOLurMYuh_-Mr1CQZebkqTnOmYrG2UYKNOXu6-TwEuXx', 'Android'),
(6, 'William', '9838169271', 'william@gmail.com', '1234', '1234', 'Demo address william', '34298347923', '', 'deliveryboy3.jpeg', 4, 2, '2022-03-01 07:57:05', 0, NULL, ''),
(7, 'Arti yadav', '9719437885', 'art@gmail.com', '1234', '1234', 'Om Plaza, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', '123654789', '1645512369RTznOjBazao_logo_full.png', '16452670685GmrcQ7SIMG-20220120-WA0008.jpg', 9, 0, '2022-02-22 09:13:05', 0, 'dsfsxfe', ''),
(8, 'RAMASHISH CHAUHAN', '6394868241', 'arti@gmail.com', '12345', '12345', 'Lucknow', '53636373733882', '1653999089fb15AIkJScreenshot_20220526-002327_YouTube.png', '1653999089ARbNg8epms_ssamk_512_35079459_8f1c9b4dd8066_l.jpg', 9, 0, '2022-05-31 12:11:29', 0, 'fLUAOribQLerJQQLizKV7q:APA91bFbFB68pec35pCOjXAViNGaKNRdS7N9Flg5bjtGQIQOxclsbjtOBh_xLhC7CAZEqUQHeuayv1MfzlLuqSp9ScuQ1ZLKxOLurMYuh_-Mr1CQZebkqTnOmYrG2UYKNOXu6-TwEuXx', 'Android'),
(9, 'test', '9415964406', 'arty@gmail.com', '1234', '1234', 'Om Plaza, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', '595868', '1645516383gPZ0vCtams_6xvq4_512_41782530.jpg', '1645516383n2NAPWg0IMG-20220217-WA0001.jpg', 9, 0, '2022-02-22 01:23:03', 0, NULL, ''),
(10, 'test', '9719437882', 'chauhanramahish31@gmail.com', '1234', '1234', 'Om Plaza, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', '1248484646', '1646121555R3klHhr620210531_125817.jpg', '1646121555JnVTw3ML20211011_142332.jpg', 4, 2, '2022-03-01 07:59:23', 0, NULL, ''),
(11, 'Ramashish chauhan', '9415964405', 'chauhanramashish2027@gmail.com', '1234', '1234', 'Om Plaza, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', '123654789', '1646121652Jawy0BmAScreenshot_2021-09-15-14-49-53.png', '1646121652R5AdXgLBIMG_20220126_162224.jpg', 4, 0, '2022-06-23 10:03:31', 112, 'dht0hQ2pSOu8N_OeR20cgR:APA91bFhSCbRQqPuSW1izh85W7fuK628XPmIQlclrOzCo3ALwsCuyZLKHRtgpix2bbEAxw5r9_HQx_fMkNDNcoX1fxQsB9FYxBUA22HsDgTk8FpNoPsrbEkZK_Ehbk8Tgf2OEIBNYled', 'Android'),
(12, 'John yadav', '2222222222', 'john@gmail.com', '1234', '1234', 'lucknow', '394329847982', '16559791504e9YTSl0IMG_20220623_154153.jpg', '1655979150InCAl0DWFV19sUvXoAIwghh.jpeg', 12, 2, '2022-07-21 06:11:57', 4235.94, 'fLUAOribQLerJQQLizKV7q:APA91bFbFB68pec35pCOjXAViNGaKNRdS7N9Flg5bjtGQIQOxclsbjtOBh_xLhC7CAZEqUQHeuayv1MfzlLuqSp9ScuQ1ZLKxOLurMYuh_-Mr1CQZebkqTnOmYrG2UYKNOXu6-TwEuXx', 'Android'),
(13, 'Steb', '3333333333', 'steb@gmail.com', '1234', '1234', 'Testing address', '13454849707070', '1646487871YqOxLNam20220108_091852.jpg', '1646487871LhwkRVpTIMG_20220215_155609.jpg', 12, 2, '2022-04-19 12:54:01', 0, NULL, ''),
(14, 'ug8g', '5555555555', 'test7@gmail.com', '123456', '123456', 'test', '54649487575455457', '16537340833NXj8Dpztwowheeler2.png', '1653734083AjFe2ZH491755094.png', 12, 2, '2022-07-21 09:29:30', 40, 'cLu_hXdARniNJtxcTDyCmS:APA91bHcXyKWH11yfpGzRlTahsM7LVWJ0OpWqXpfBT0Wf9Q0f_rND2y1uofPkh6D2YDitBx_oiVElcQ2PFr0WX2s0SbqMcgt5nu9UnKG-rhPG8Zy3_YgmF0Vel1Rpb0zJ68NR8kkuvMH', 'Android'),
(15, 'test rider', '555555555555', 'test@gmail.com', '1234', '1234', 'sector E, sitapur road lucknow 226024', '123456789012', '', '', 12, 2, '2022-04-22 10:32:53', 0, NULL, ''),
(16, 'test rider', '555555555555555', 'test1@gmail.com', '1234', '1234', 'sector E, sitapur road lucknow - 22604', '123456789012', '', '', 12, 2, '2022-04-28 11:55:10', 0, 'cLu_hXdARniNJtxcTDyCmS:APA91bFlwmlKk-fhD44rGYTc1thAtVgKR8dOqKHF8YU3ri1XWIQxFjoq-QvXWQobkO70CqNihl0hvJwbCzyi4DPRTUrEa5CjT5xl6R1rhLv60sITECJcSCvlol1mggSW_j6O_2fKjL5_', 'Android'),
(17, 'test', '9719437889', 'test15454@gmail.com', '1234', '1234', 'om plaza', '2345678', '', '', 1, 0, '2022-04-29 13:42:00', 0, NULL, ''),
(18, 'John', '7533577533', 'johnrider@gmail.com', '1234', '1234', 'Testing Address', 'bhyg', '1658824140JcLl6dOt1658823525482.jpg', '165882414004ywegAQ1658823516421.jpg', 12, 0, '2022-08-10 13:45:59', 3985.75, 'f0n3SazbRP6e-majmC6cq0:APA91bECQ3fVDXvcXVjR2dFaigSHbKs4J66ZHwA8u0i6ZPorFpYp-HOOVVgYI42dkkP-nhoSV0WxD2WBxCf5Rwb-rJUAaE6bgYz2kr8JXuFlAiI75PaBqmVqvcDuuo0U2J42-tlS_RqF', 'Android'),
(19, 'Rider Jolly', '9038078084', 'test12@gmail.com', '123456', '123456', 'jayanagar', '111122223333', '165537947927yl9YsL1655379464696.jpg', '1655379479RN8yEln21655379250885.jpg', 12, 2, '2022-06-16 11:39:55', 0, 'e45RjDlIT0ehR3_eUEAB6_:APA91bFWYHVLTf5MRqXJCqUrPvJwFWVpBV49INF7jerdxvkaWRzU_uAo3QlyRPFT7ngzBIsIvyu28JZWlzHXWQRE5stxVGY2A6cDWx_8RKK-q6CPELI1QEMdLYaUGl4uv_uzCrgoc79T', 'Android'),
(20, 'Shivay', '3444444444', 'shivay@gmail.com', '1234', '1234', 'tets', '51648484949', '1658396474KVIfSCTqIMG-20220720-WA0002.jpg', '1658396474dyL2YQb01655446286451.jpg', 12, 2, '2022-07-21 09:42:30', 0, 'fLUAOribQLerJQQLizKV7q:APA91bFbFB68pec35pCOjXAViNGaKNRdS7N9Flg5bjtGQIQOxclsbjtOBh_xLhC7CAZEqUQHeuayv1MfzlLuqSp9ScuQ1ZLKxOLurMYuh_-Mr1CQZebkqTnOmYrG2UYKNOXu6-TwEuXx', 'Android'),
(21, 'test', '9713554656', 'arti134yadav@gmail.com', '4321', '4321', 'Om Plaza, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', '5653', '1658397120YVScbOGo512x512.png', '1658397120yJIPlvLX2244375948.png', 12, 2, '2022-07-21 09:53:10', 0, NULL, ''),
(22, 'Shaun Michael', '9990009990', 'testrider@gmail.com', '1234', '1234', 'all FL FL', '1234567890', '1658474109tSpqVHEcScreenshot_20220722-124336.jpg', '16588239386pYCVadl1658823921038.jpg', 12, 0, '2022-07-26 08:25:38', 339.12, 'fLWwtQXwSi-ly51fxHjZSg:APA91bHcofKFIQedDOKR8KARa44UBf-nfrWfuCyp4ryfL0B859JjglzZvgFRTfkLWSARMbFbJn7_aK3CPcskinrAcquOcvTkh--3KypumI-RAsNOrGgPKyEGKVxBkh73wyTjAV5aCeJr', 'Android'),
(23, 'test rider', '8777019409', 'testrider@mailinator.com', 'abcd1234', 'abcd1234', 'lucknow', '1111111111', '165874704954hf6dTw1655379250885.jpg', '', 12, 2, '2022-07-25 11:05:19', 0, 'ck-0K6ncRvim6uf8Jqw4pf:APA91bFbeQUSTh02ynz5L8TZ_QvmEd0s0iMimk8vAvFzN6Fs4jVMVXo9JmtxskFZTNPBLDfB3C1PMmAcHe5VAcMNptRYLyRsUYrXkLrBiVq8BwqyAz6m5WaGo8YxKjk-WGdBX4LgovDl', 'Android');

-- --------------------------------------------------------

--
-- Table structure for table `support`
--

CREATE TABLE `support` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `mobile_number` text COLLATE utf8_unicode_ci NOT NULL,
  `email_id` text COLLATE utf8_unicode_ci NOT NULL,
  `support_remark` text COLLATE utf8_unicode_ci NOT NULL,
  `sender_id` int(11) NOT NULL,
  `sender_type` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `submit_date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `support`
--

INSERT INTO `support` (`id`, `name`, `mobile_number`, `email_id`, `support_remark`, `sender_id`, `sender_type`, `status`, `submit_date_time`) VALUES
(1, 'testing', 'asdfsd', 'sdfsd', 'sdfsdf', 5, '1', 1, '2022-02-11 10:05:58'),
(2, 'testing', 'asdfsd', 'sdfsd', 'sdfsdf', 5, '2', 1, '2022-02-16 10:06:38'),
(3, 'Harshit Gupta', '1234567890', 'test@gmail.com', 'fakjdhfjklj', 6, '1', 1, '2022-02-19 08:22:55'),
(4, 'Testing laundry', '9719437885', 'chauhanramashish2027@gmail.com', 'gcucuf', 9, '2', 1, '2022-02-19 12:30:55'),
(5, 'Varun Tyagi', '8377990404', 'abc@gmail.com', 'test', 10, '1', 1, '2022-03-13 14:37:07'),
(6, 'test', '9719437885', 'chauhanramashish2027@gmail.com', 'test', 34, '1', 1, '2022-04-01 13:46:05'),
(7, 'manoj', '9663028587', 'manoj@smartcricket.com', 'test ', 54, '1', 1, '2022-04-14 05:34:03'),
(8, 'Mayfa', '1111111111', 'mayfair@gmail.com', 'test', 12, '2', 1, '2022-04-19 13:16:46'),
(9, 'Anindita', '9880617669', 'anindita@smartcricket.com', 'testing\n', 81, '1', 1, '2022-04-21 06:46:39'),
(10, 'Anindita Paul', '9880617669', 'anindita@smartcricket.com', 'test\n', 81, '1', 1, '2022-04-21 07:20:47'),
(11, 'Mayfa', '1111111111', 'mayfair@gmail.com', 'test', 12, '2', 1, '2022-04-25 06:57:40'),
(12, 'chfu', 'tufhc', 'fyyd', 'hxhch', 79, '1', 1, '2022-04-25 10:51:03'),
(13, 'Mayfa', '1111111111', 'mayfair@gmail.com', 'testing', 12, '2', 1, '2022-04-25 11:50:12'),
(14, 'manoj hegde', '9663028587', 'manoj@smartcricket.com', 'test', 54, '1', 1, '2022-04-28 05:19:30'),
(15, 'Anindita Paul', '9038078083', 'avanpaul2016@gmail.com', 'testing\n', 84, '1', 1, '2022-04-28 07:15:42'),
(16, 'manoj hegde', '9663028587', 'manoj@smartcricket.com', 'test', 54, '1', 1, '2022-04-28 07:35:38'),
(17, 'harshit gupta', '1234567890', 'harshit@gmail.com', 'akahgsskfhdsagjlkgagnafnjkmgj', 15, '1', 1, '2022-04-28 10:19:42'),
(18, 'Mayfair', '1111111111', 'mayfair@gmail.com', 'test', 12, '2', 1, '2022-04-29 06:39:21'),
(19, 'Ashish', '9719437885', 'chauhanramashish2022@gmail.com', 'testing', 12, '2', 1, '2022-04-29 09:46:43'),
(20, 'Mayfair', '1111111111', 'mayfair@gmail.com', 'good', 12, '2', 1, '2022-05-17 13:45:54'),
(21, 'Mayfair', '1111111111', 'mayfair@gmail.com', 'good', 12, '2', 1, '2022-05-17 13:51:01'),
(22, 'Mayfair', '1111111111', 'mayfair@gmail.com', 'test', 12, '2', 1, '2022-06-16 11:19:46'),
(23, 'Harshit Gupta', '9990058423', '7007629729', 'Add remark', 8, '1', 1, '2022-06-23 13:41:07'),
(24, 'harshit gupta', '1234567890', 'harshit@gmail.com', 'akahgsskfhdsagjlkgagnafnjkmgj', 15, '1', 1, '2022-06-23 17:31:51'),
(25, 'Rakesh Patel', '8860254190', 'test23456@gmail.com', 'Enter Remark Here', 23, '1', 1, '2022-06-23 17:51:01'),
(26, 'Manoj', '8277661659', 'Bharath@smartcricket.com', 'Test', 103, '1', 1, '2022-06-24 11:10:31'),
(27, 'Manoj', '8277661659', 'Bharath@smartcricket.com', 'Test', 103, '1', 1, '2022-06-24 11:10:34'),
(28, 'Manoj', '8277661659', 'Bharath@smartcricket.com', 'Test', 103, '1', 1, '2022-06-24 11:10:35'),
(29, 'Manoj', '8277661659', 'Bharath@smartcricket.com', 'Test', 103, '1', 1, '2022-06-24 11:10:38'),
(30, 'Manoj', '8277661659', 'Bharath@smartcricket.com', 'Test', 103, '1', 1, '2022-06-24 11:10:39'),
(31, 'Varun Tyagi', '7007629729', 'harshitgupta72@gmail.com', 'fgjk', 10, '1', 1, '2022-06-29 11:09:05');

-- --------------------------------------------------------

--
-- Table structure for table `unit_table`
--

CREATE TABLE `unit_table` (
  `id` int(11) NOT NULL,
  `unit_name` text COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `unit_table`
--

INSERT INTO `unit_table` (`id`, `unit_name`, `type`) VALUES
(1, 'Piece', 1),
(2, 'KG', 1),
(3, 'Bucket', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `id` int(11) NOT NULL,
  `full_name` text COLLATE utf8_unicode_ci NOT NULL,
  `email_id` text COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `mobile_number` text COLLATE utf8_unicode_ci NOT NULL,
  `otp_code` text COLLATE utf8_unicode_ci NOT NULL,
  `otp_code_status` int(11) NOT NULL,
  `device_token` text COLLATE utf8_unicode_ci NOT NULL,
  `registration_date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_status` int(11) NOT NULL,
  `wallet_balance` double NOT NULL,
  `gps_address` text COLLATE utf8_unicode_ci NOT NULL,
  `gps_lat` double NOT NULL,
  `gps_long` double NOT NULL,
  `device_type` text COLLATE utf8_unicode_ci NOT NULL,
  `pincode` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_id` int(11) NOT NULL DEFAULT '2',
  `email_status` int(11) NOT NULL,
  `notification_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`id`, `full_name`, `email_id`, `password`, `mobile_number`, `otp_code`, `otp_code_status`, `device_token`, `registration_date_time`, `user_status`, `wallet_balance`, `gps_address`, `gps_lat`, `gps_long`, `device_type`, `pincode`, `photo`, `country_id`, `email_status`, `notification_status`) VALUES
(5, 'Veer bhanu pratap singh', 'veer11@gmail.com', '1234', '9415964404', '', 1, 'c-VLBDkiSFieeNR7lv5KIP:APA91bGhinAF9xsFOiyUlj14dcvxztfSoK8fCwz010Ckoc_nNsr2VTkWxWaV3BDTrxrRwqu48ZT9N6Mn_vIGucgtFQJjBaA_wT_xPg6U2k8K81cH9fnn8soI9GruiXVA3qExLzNM5Ptn', '2022-06-23 10:50:22', 1, 0, '', 0, 0, 'android', NULL, '0', 2, 0, 0),
(6, 'Harshit Gupta', 'veer1@gmail.com', '321654987', '94159644041', '', 1, '1', '2022-04-25 11:44:08', 1, 100, 'this is adddress of gps', 0.54484465778, 0.54484465778, 'Android', '2378343', '0', 2, 0, 0),
(7, 'Veer bhanu pratap singh', 'veer111@gmail.com', '12341', '941596440411', '6CA2', 0, '', '2022-07-20 05:49:32', 0, 0, '', 0, 0, '', NULL, '0', 2, 1, 1),
(8, 'Harshit Gupta', '7007629729', '12345678', 'harshitgupta72@gmail.com', 'R7yH', 1, 'encWQizFQZWK18kI7kKEVm:APA91bGbBlj3i2oU_2epFoE6B8rS22_8mPkVKwpVrmITEYYAgLqYNSuI3QrqoJFXVDxxWm1xnRgGrU5Rk4lpA1elByBG9emBthDfAbSvyB8P8S7mkujz8EgnUE06TnZbs3ekcejOrW8O', '2022-11-15 11:52:01', 1, 10, '4th Block, Jayanagar, Bengaluru, Karnataka 560041, India', 12.9259401, 77.5830419, 'android', NULL, '0', 2, 0, 1),
(9, 'Shivram ji', 'shivramvarunti@gmail.com', '1234', '7844989891', 'Vd2i', 0, '', '2022-02-25 18:31:15', 0, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(10, 'Varun Tyagi', 'harshitgupta72@gmail.com', '1234', '7007629729', 'FXoZ', 1, 'cHL28W6DQWag6A6mPs-UJ6:APA91bFXNgyCdNLEjKbaz97G_nYZZS6KFxKuwH23XyBYTUTC_CFOIrS8Q7bu93fHkpvZ3rZIHj167Tyoh7GXZhcLTFOvY_dDebJ8h5UryMcQdVK-FffTTrPG7AkPJEdfJgLMbiOb-q-6', '2022-05-13 08:49:18', 1, 50, 'Om Plaza, Sector 19, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', 26.889066696166992, 80.99103546142578, 'android', NULL, '0', 2, 0, 0),
(11, 'harshit', 'harshigupta72@gmail.com', '12345678', '7047629729', 'vH2r', 0, '', '2022-02-25 18:31:15', 0, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(12, 'Veer bhanu pratap singh', 'veer1111@gmail.com', '12341', '9415961440411', '5chK', 0, '', '2022-02-25 18:31:15', 0, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(13, 'RAhul ray', 'rahul@gmail.com', '1234', '7844989893', 'QM6W', 0, '', '2022-02-25 18:31:15', 0, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(14, 'Rakesh Chacha', 'rakeshchacha@gmaill.com', '1234', '9415964406', 'dZGI', 0, '', '2022-02-09 06:51:18', 0, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(15, 'Harshit Gupta', 'test@gmail.com', '12345678', '1234567890', 'iEWL', 0, '', '2022-06-24 07:18:25', 0, 400, '', 0, 0, '', NULL, '0', 2, 0, 0),
(16, 'Rakesh patel ji', 'rakeshtest@gmail.com', '1234', '9415964411', '7wjH', 0, '', '2022-02-11 16:49:58', 0, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(17, 'Sowmya potluri', 'potlurisowmya579@gmail.com', 'Welcome200!', '9885535037', 'ckNx', 0, '', '2022-02-11 16:52:34', 0, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(18, 'Rakesh', 'test234@gmail.com', '123', '8860254198', 'z51r', 0, '', '2022-03-11 09:09:57', 0, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(19, 'Rakesh Patel', 'rakesh@gmail.com', '123', '8860254197', 'SBim', 0, '', '2022-02-25 18:31:15', 0, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(20, 'Rakesh Ji', 'test2345@gmail.com', 'Welcome200!', '8860254199', '3XZD', 0, '', '2022-02-25 18:31:15', 0, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(21, 'Rakesh Patel', 'rakesttest@gmail.com', '12345', '9876543456', 'Jtb1', 0, '', '2022-02-25 18:31:15', 0, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(22, 'Rakesh Patel', 'rakesttest21@gmail.com', '12345', '9876543454', 'xQVk', 0, '', '2022-02-25 18:31:15', 0, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(23, 'Rakesh Patel', 'test23456@gmail.com', 'Welcome200!', '8860254190', 'aQw3', 1, '123', '2023-02-20 04:55:21', 1, 84, 'HG4V+FM8, Dadri, Uttar Pradesh 203207, India', 28.55548095703125, 77.5436101947702, 'IOS', NULL, '1663740731d4HLelXnfile.png', 2, 0, 0),
(25, 'Harshit', '7007629720', '12345678', 'hg140400@gmail.com', '7291', 1, 'android', '2022-07-13 07:37:25', 1, 0, 'Call 9415964405/04 Om Plaza Apartment Flat No-201 Sec 19, sec 17, Sabji Mandi, Chandanapur, Indira Nagar, Lucknow, Uttar Pradesh 226016, India', 26.889114379882812, 80.99104309082031, '', NULL, '0', 2, 0, 0),
(26, 'Gaurav', '9886038755', 'gaurav', 'gauravt2291@gmail.com', '7289', 1, 'emh_3BBASvG0Yodql2Dt8Z:APA91bE3zQM9Z74QHbGvFd9wcomEAzP2lSBsscwLwe9vJKrYpXVjtKof-l3ZeGs3cjCkfKJtscLjpTQR8W0pRYTJhLKxs-mVXPeXHrDZoMwGLu4agUN9gnZ-FKBqHdIddbNhDxK9HgJY', '2022-04-19 06:13:26', 1, 0, '119, 27th Cross Rd, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India', 12.930704116821289, 77.57716369628906, 'android', NULL, '0', 2, 0, 0),
(27, 'test', 'testing@gmail.com', '123456', '1254251243', '9068', 0, '', '2022-02-25 18:31:15', 0, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(28, 'test', 'testing1@gmail.com', '12345', '5462134521', '9527', 0, '', '2022-02-25 18:31:15', 0, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(29, 'test', 'john@gmail.com', '12345', '5421345124', '1054', 0, '', '2022-02-25 18:31:15', 0, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(30, 'test', 'johny@gmail.com', '1234', '5461237894', '7049', 0, '', '2022-02-25 18:31:15', 0, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(31, 'gehen', 'just@gmail.com', '12345', '8546795423', '0249', 0, '', '2022-02-25 18:31:15', 0, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(32, 'Rahul ', 'rah@gmail.com', 'weer', '5487964254', '9521', 0, '', '2022-02-25 18:31:15', 0, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(33, 'Rakesh Patel', '8860254198', '123456', 'rakesh.iise@gmail.com', '9260', 1, '', '2022-02-25 18:31:15', 1, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(34, 'Shivram Varun', 'shivramvarunit@gmail.com', '123456', '9415964405', '0174', 1, 'cJDQwLw8TKSF2LLZ6ncOqz:APA91bHq9jZqvbdgtqS41mpnGGPoQpnN7x3o-EyYD9xlZjOUNU2DlYRDAk3qrvlFptZ-FEDvpUOyo6Dmx4zW_ztzxaiOMY5aMIhuJiVaPaEOvKUqM47qklsT0mtNuFoMhRMI_rEcdSAw', '2022-11-28 06:59:42', 1, 0, '', 0, 0, 'android', NULL, '0', 2, 0, 0),
(35, 'Harshit Gupta', 'hg140400@gmail.com', '12345678', '9170076297', '0937', 0, '', '2022-02-26 11:27:23', 0, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(36, 'ficjc', 'cjfhf', '12345678', '5658686568', '9124', 0, '', '2022-02-26 11:27:23', 0, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(37, 'bdudhd', 'fufifuf', '123456', '3538656565', '3654', 0, '', '2022-02-26 11:27:23', 0, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(38, 'xvxjgxkgxgc', 'chcohchchchchch', '12345678', '3868686853', '3726', 0, '', '2022-02-26 11:27:23', 0, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(39, 'dhfjfjf', 'firjfufudgahfsf', '1234567', '5465454945', '4856', 0, '', '2022-02-26 11:27:23', 0, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(40, 'xnxhcmx', 'hg@gmail.com', 'qwerty', '6565656867', '0251', 1, '', '2022-02-26 11:27:23', 1, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(41, 'Harshit Gupta', 'harshit@gmail.com', '123456', '7070707070', '1086', 1, '', '2022-02-26 11:27:23', 1, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(42, 'Stephen', 'stephin@gmail.com', '123456', '7844989881', '2367', 1, '1234', '2022-02-26 11:27:44', 1, 0, '', 0, 0, 'android', NULL, '0', 2, 0, 0),
(43, 'Rakesh Ji', 'test23454@gmail.com', 'Welcome200!', '8860254191', '6351', 1, '123', '2022-02-28 17:53:30', 1, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(44, 'Rohan', 'rohan@gmail.com', '123456', '9415962301', '5960', 1, 'e23OATW0SnWUZrKExuoYGl:APA91bEtn7h9CzI6kPvULhL3YUKffhXO0nCFwMveqh8rULoiuFUFVIsK0G-GzpzzBLJy9SHSnfmC5JU0yHIW2o8FPKJJikXoegMzU9RD9yyo2t50SlQ8fwZo5_vON6m2TLCKF3UbrA4h', '2022-03-02 11:43:33', 1, 0, '', 0, 0, 'android', NULL, '0', 2, 0, 0),
(45, 'Harshit Gupta', 'hg1404@gmail.com', '12345678', '7007629722', '1345', 1, 'fdKH9c_GSjmYeiHHE0-UvT:APA91bHmA-s_N3bLo6E2rjx3E5VRZ2Ymnc8dTquYEk3OC03KQVNng41RvZQnNhUP0Y2-vP0pL4FSGx3odFHHVQNxLliR2fRpVD6uyKYIIYWmbmuCLWaR0pOw-dATvOyt3syl3_1dRz1_', '2022-03-02 12:21:33', 1, 0, '', 0, 0, 'android', NULL, '0', 2, 0, 0),
(46, 'Valin', 'valin@gmail.com', '12345678', '8549857434', '8965', 1, 'fD3Ws6pHRV6WjvvgtYpVx1:APA91bHmYFpxJKEPGy00hCE0GMjQXARdNO5TNI6IWuYXhbJszsLgPe-Xyr1JSAo6kpJZ20L-sWj7vFd2LrBMNfeSgqnsT2XTxK24Yh6acRieIyq6MzlRUPmh9G9-sU_LopnejYiDciK9', '2022-03-31 12:27:04', 1, 0, '', 0, 0, 'android', NULL, '0', 2, 0, 0),
(47, 'trg', 'hfhf', '123456', '9415964403', '1264', 1, 'fjDnVk1sQ6iuqCLF4JiJU8:APA91bHeWmTWGbrR8pWU51cP6zZy9lKDSRMkV-75k8s8SueIxYGz6L3EOhjZnKjq7DgFZZTAysUD_CJlQO0681AkHsedU9UPqb1AjJsByI0FS0KQesu-ojNI1Z7oWKRqxs0oR8-Tt7f5', '2022-03-04 14:11:41', 1, 0, '', 0, 0, 'android', NULL, '0', 2, 0, 0),
(48, 'Gaurav', 'gauravt2291@gmail.com', 'gaurav', '9886038755', '7564', 1, 'eK5OqFNNSneirXFU3Y0HGt:APA91bHUKOWPiY8JeS0t1XMuLugn-oyvHDRzGHYt2V69HlWzyGcjzQEXiXNUme-lbGgKsZSo9Cm5wP1-YHUECTPjdslSjetPymGoAYTk2oEPMnnkU3VOWV6LjMgXffwhHCGHXUBv0SZN', '2022-03-05 04:06:17', 1, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(49, 'Shah Talib ', 'shahtalib@gmail.com ', 'gold00', '9793440621', '0275', 0, 'dg3HNV_FS56PdkId1MkyT8:APA91bGQtrGSVOrYHdKAekEnHEtJNPxvZvX9KWiVDp1cHxXQAkrujtDCGCbwpt4NPMpLGpoRotHhMq7o_eTxehaNjCWfHatTzUWobXI4NFnK5-LA1dmoXeZI-Mtd5oJy3bKWaOfFWjwg', '2022-03-05 08:39:09', 0, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(50, 'ashish', 'chauhanramashish2027@gmail.com', '123456', '9719437885', '8136', 0, 'd-1iZ8fZTc-aIi2UPqYk6B:APA91bHXBOzlERly8Rgpwe8O-TWdvo26n5QVvO816g-zwdvJe78kLhm_LGJpTdIrxToDGHD7_kRVJupAokDI6IEsdmDuGIa-3n-qeEJdS8ZB8Wvg6G3uFiv7x1dT8eaU5sL6mSr0v3oQ', '2022-04-06 10:23:38', 0, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(51, 'mayttwo', 'madhu@winds.co.in', 'madhu123#', '8401471987', '1386', 1, 'eglq9bRLR9mp122o29i-_j:APA91bHtiee5lHsW_ofjUOwN1ZK4BHxVekyVO-4fg6OR1eWROtM-FUuWJLey5k_u37odcj1D-nTmdiovdwetshrTRrgJ9wtl0QA-P17oOb7OjoUnzlX1pQ-RWQx5iP7oKGu-BSYPOfrT', '2022-06-17 05:15:44', 1, 0, '', 0, 0, 'android', NULL, '0', 2, 0, 0),
(52, 'Shivtest', 'shivtest@gmail.com', '123456', '9415964407', '3574', 0, 'cXCyufE3TaaS_BqsV_DEnI:APA91bHfKTYNVwHqJneE8XnJFk7vokbfqYGb2nz5mP5ppyh9YhwO1HWLP3zeLQ1V5mpkWP33mT51R2qnxpTlKfcsElt10tqBUECIiP6IINyHc_guDsQ8l2m_OuLm9m-VWB63i8uEUOSF', '2022-03-31 12:59:39', 0, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(53, 'S. Varun Ezeonsoft', 's8@gmail.com', '123456', '9415964408', '5326', 1, 'cXCyufE3TaaS_BqsV_DEnI:APA91bHfKTYNVwHqJneE8XnJFk7vokbfqYGb2nz5mP5ppyh9YhwO1HWLP3zeLQ1V5mpkWP33mT51R2qnxpTlKfcsElt10tqBUECIiP6IINyHc_guDsQ8l2m_OuLm9m-VWB63i8uEUOSF', '2022-03-31 13:06:02', 1, 0, '', 0, 0, 'android', NULL, '0', 2, 0, 0),
(54, 'manoj hegde test', 'manoj@smartcricket.com', 'test@1234', '9663028587', '6857', 1, 'cpmr9xCqTqiXer0XjlP5XK:APA91bG-j3FwB8ow0CI39GVJC3Do0_Pe9SpfgkdHFj2s-fkaW1B4JOsL7doR-R0RSkX9w7JzhoDwPkMLNOy_XMcnT68Voa5tr2J9PHHoUVV_IF12n9NaSwPJ50NKILlJoZb1wqqcI-GY', '2022-06-07 09:35:58', 1, 2.368808e42, '', 0, 0, 'android', NULL, '16511233454brDVAXPScreenshot_20220427-125934.jpg', 2, 0, 0),
(55, 'Jawa Bharath ', 'bharath@gaamesunlimited.com', '10dulka', '8548878007', '9248', 1, 'c7b7RcvLTru_LKCrZMm1-t:APA91bHsJbwDpcowybUljdygh78wqvKFchsxTFOrD2MoYL6_rhDpKrzx1cdIPxPFN3OwcfMNbTohjZY8lhM1dmBANZxJ1YmTdhQlHw4qsmaBsv6m_-cp-kxs4pW1_MTpQuJ8itq-_WF8', '2022-05-21 09:06:47', 1, 123, '', 0, 0, 'android', NULL, '1652785616vlpOi6xaIMG_20191130_165218.jpg', 2, 0, 0),
(56, 'Smart Nord', 'labsamsungm31@gmail.com', 'test@1234', '9012345678', '5278', 1, 'feTXUg-9TaOoaqlDvN0rnc:APA91bH_ZdRp_w__lCQiN7rWspKGrA55x6tf5dSakcagLiGkz21ArYB_dpYd8BQV6Yn3Nzv4GCXysdk58pyIwdEazFAbeMsm5Fq0zycOoMoJDnt6KX_q_5-W45DHCw-uc2nRQdMIh2DI', '2022-04-01 08:49:16', 1, 0, '', 0, 0, 'android', NULL, '0', 2, 0, 0),
(57, 'test', 'smartnord21@gmail.com', 'test1234', '9087654321', '5630', 1, 'c9wsX44MR12uLoDMIsBLAQ:APA91bGsK3K19raogkXINhLd1FWNaJZl_WsWJjv8dZeEcJRrOkENVEMClCuzoce05Ob3jobupnTNtxtT4B4HTIZIPROr87H4LPeROCrGFAjuQ07cNpHuvpDv8s0pQ1SjcDcU0uw5vaL0', '2022-04-01 08:52:22', 1, 0, '', 0, 0, 'android', NULL, '0', 2, 0, 0),
(58, 'Smart Nord', 'test@1234', '12345678', '0123456789', '7912', 1, 'c9wsX44MR12uLoDMIsBLAQ:APA91bGsK3K19raogkXINhLd1FWNaJZl_WsWJjv8dZeEcJRrOkENVEMClCuzoce05Ob3jobupnTNtxtT4B4HTIZIPROr87H4LPeROCrGFAjuQ07cNpHuvpDv8s0pQ1SjcDcU0uw5vaL0', '2022-04-01 10:01:28', 1, 0, '', 0, 0, 'android', NULL, '0', 2, 0, 0),
(59, 'Shivram Test', 'shivramtest@gmail.com', '123556', '9415964409', '2469', 1, 'cXCyufE3TaaS_BqsV_DEnI:APA91bHfKTYNVwHqJneE8XnJFk7vokbfqYGb2nz5mP5ppyh9YhwO1HWLP3zeLQ1V5mpkWP33mT51R2qnxpTlKfcsElt10tqBUECIiP6IINyHc_guDsQ8l2m_OuLm9m-VWB63i8uEUOSF', '2022-04-02 07:49:44', 1, 0, '', 0, 0, 'android', NULL, '0', 2, 0, 0),
(60, 'Harshit Gupta', 'tewst@gmail.com', '12345678', '1234567490', '2950', 1, '1', '2022-04-05 06:37:14', 1, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(61, 'arti', 'arti@gmail.com ', '654321', '6394868241', '6537', 1, 'd-1iZ8fZTc-aIi2UPqYk6B:APA91bHXBOzlERly8Rgpwe8O-TWdvo26n5QVvO816g-zwdvJe78kLhm_LGJpTdIrxToDGHD7_kRVJupAokDI6IEsdmDuGIa-3n-qeEJdS8ZB8Wvg6G3uFiv7x1dT8eaU5sL6mSr0v3oQ', '2022-04-06 16:54:34', 1, 0, '', 0, 0, 'android', NULL, '0', 2, 0, 0),
(62, 'Raman gupta', 'raman@gmail.com', '123456', '9889043117', '3687', 1, 'foCAfxy8RrCioGSVlO9Vtj:APA91bHV7Hx9yHsOz0G6X9RZGrjDeAHjbd9NMq1vuSlkgWxyjqKjrjhgXa5PzoYNg1YkzJuoWnAGC3vroLzQfezZcbUPBnXUbsoANlaZL46-_yxE8WX92FzlzflSDw9_3vpipfOsX77U', '2022-04-08 07:22:27', 1, 0, '', 0, 0, 'android', NULL, '0', 2, 0, 0),
(63, 'newtest', 'tes1t@gmail.com', 'qwertyui', '2580258025', '1596', 1, 'fjDnVk1sQ6iuqCLF4JiJU8:APA91bHeWmTWGbrR8pWU51cP6zZy9lKDSRMkV-75k8s8SueIxYGz6L3EOhjZnKjq7DgFZZTAysUD_CJlQO0681AkHsedU9UPqb1AjJsByI0FS0KQesu-ojNI1Z7oWKRqxs0oR8-Tt7f5', '2022-04-09 09:34:36', 1, 0, '', 0, 0, 'android', NULL, '0', 2, 0, 0),
(64, 'test', 't12@gmail.com', '123456', '9415964415', '6184', 1, 'foCAfxy8RrCioGSVlO9Vtj:APA91bHV7Hx9yHsOz0G6X9RZGrjDeAHjbd9NMq1vuSlkgWxyjqKjrjhgXa5PzoYNg1YkzJuoWnAGC3vroLzQfezZcbUPBnXUbsoANlaZL46-_yxE8WX92FzlzflSDw9_3vpipfOsX77U', '2022-04-13 07:19:39', 1, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(65, 'harshitregtest', 'reg@gmail.com', '12345678', '7007007007', '9673', 1, 'fjDnVk1sQ6iuqCLF4JiJU8:APA91bHeWmTWGbrR8pWU51cP6zZy9lKDSRMkV-75k8s8SueIxYGz6L3EOhjZnKjq7DgFZZTAysUD_CJlQO0681AkHsedU9UPqb1AjJsByI0FS0KQesu-ojNI1Z7oWKRqxs0oR8-Tt7f5', '2022-04-13 07:21:44', 1, 0, '', 0, 0, 'android', NULL, '0', 2, 0, 0),
(66, 'nxhd', 'xhjfxhjy', '12345678', '9775468679', '7541', 1, 'foCAfxy8RrCioGSVlO9Vtj:APA91bHV7Hx9yHsOz0G6X9RZGrjDeAHjbd9NMq1vuSlkgWxyjqKjrjhgXa5PzoYNg1YkzJuoWnAGC3vroLzQfezZcbUPBnXUbsoANlaZL46-_yxE8WX92FzlzflSDw9_3vpipfOsX77U', '2022-04-13 07:51:34', 1, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(67, 'zgxhzf96e', 'rwjtektwi5', '12345678', '9854254464', '9852', 1, 'foCAfxy8RrCioGSVlO9Vtj:APA91bHV7Hx9yHsOz0G6X9RZGrjDeAHjbd9NMq1vuSlkgWxyjqKjrjhgXa5PzoYNg1YkzJuoWnAGC3vroLzQfezZcbUPBnXUbsoANlaZL46-_yxE8WX92FzlzflSDw9_3vpipfOsX77U', '2022-04-13 07:54:04', 1, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(68, 'uz zBs', 'sbgshs', '12345678', '9494946464', '1759', 1, 'foCAfxy8RrCioGSVlO9Vtj:APA91bHV7Hx9yHsOz0G6X9RZGrjDeAHjbd9NMq1vuSlkgWxyjqKjrjhgXa5PzoYNg1YkzJuoWnAGC3vroLzQfezZcbUPBnXUbsoANlaZL46-_yxE8WX92FzlzflSDw9_3vpipfOsX77U', '2022-04-13 07:56:56', 1, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(69, 'hBshaba', 'zjussKsjshsa', '12345678', '7749497679', '3847', 1, 'foCAfxy8RrCioGSVlO9Vtj:APA91bHV7Hx9yHsOz0G6X9RZGrjDeAHjbd9NMq1vuSlkgWxyjqKjrjhgXa5PzoYNg1YkzJuoWnAGC3vroLzQfezZcbUPBnXUbsoANlaZL46-_yxE8WX92FzlzflSDw9_3vpipfOsX77U', '2022-04-13 07:59:52', 1, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(70, 'jjjsjs', 'jshsejdhdd', '12345678', '7464849976', '1863', 1, 'foCAfxy8RrCioGSVlO9Vtj:APA91bHV7Hx9yHsOz0G6X9RZGrjDeAHjbd9NMq1vuSlkgWxyjqKjrjhgXa5PzoYNg1YkzJuoWnAGC3vroLzQfezZcbUPBnXUbsoANlaZL46-_yxE8WX92FzlzflSDw9_3vpipfOsX77U', '2022-04-13 08:02:42', 1, 0, '', 0, 0, 'android', NULL, '0', 2, 0, 0),
(71, 'urutifzi', 'jrytxir', '12345678', '5567989806', '1368', 1, 'foCAfxy8RrCioGSVlO9Vtj:APA91bHV7Hx9yHsOz0G6X9RZGrjDeAHjbd9NMq1vuSlkgWxyjqKjrjhgXa5PzoYNg1YkzJuoWnAGC3vroLzQfezZcbUPBnXUbsoANlaZL46-_yxE8WX92FzlzflSDw9_3vpipfOsX77U', '2022-04-13 08:07:03', 1, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(72, 'drjfv', 'fefacejge', '12345678', '8495512265', '1098', 1, 'foCAfxy8RrCioGSVlO9Vtj:APA91bHV7Hx9yHsOz0G6X9RZGrjDeAHjbd9NMq1vuSlkgWxyjqKjrjhgXa5PzoYNg1YkzJuoWnAGC3vroLzQfezZcbUPBnXUbsoANlaZL46-_yxE8WX92FzlzflSDw9_3vpipfOsX77U', '2022-04-13 08:10:25', 1, 0, '', 0, 0, 'android', NULL, '0', 2, 0, 0),
(73, 'hehdhdBeh', 'uskaBs8erjke', '12345678', '6648769434', '2047', 1, 'foCAfxy8RrCioGSVlO9Vtj:APA91bHV7Hx9yHsOz0G6X9RZGrjDeAHjbd9NMq1vuSlkgWxyjqKjrjhgXa5PzoYNg1YkzJuoWnAGC3vroLzQfezZcbUPBnXUbsoANlaZL46-_yxE8WX92FzlzflSDw9_3vpipfOsX77U', '2022-04-13 08:18:07', 1, 0, '', 0, 0, 'android', NULL, '0', 2, 0, 0),
(74, 'hvzbbzhsbsh', 'wywhwowj', '12345678', '6473400000', '2986', 1, 'foCAfxy8RrCioGSVlO9Vtj:APA91bHV7Hx9yHsOz0G6X9RZGrjDeAHjbd9NMq1vuSlkgWxyjqKjrjhgXa5PzoYNg1YkzJuoWnAGC3vroLzQfezZcbUPBnXUbsoANlaZL46-_yxE8WX92FzlzflSDw9_3vpipfOsX77U', '2022-04-13 08:19:12', 1, 0, '', 0, 0, 'android', NULL, '0', 2, 0, 0),
(75, 'xjysysd', 'wwywsud', '12345678', '9434949994', '4572', 0, 'foCAfxy8RrCioGSVlO9Vtj:APA91bHV7Hx9yHsOz0G6X9RZGrjDeAHjbd9NMq1vuSlkgWxyjqKjrjhgXa5PzoYNg1YkzJuoWnAGC3vroLzQfezZcbUPBnXUbsoANlaZL46-_yxE8WX92FzlzflSDw9_3vpipfOsX77U', '2022-04-13 08:29:06', 0, 0, '', 0, 0, '', NULL, '0', 2, 0, 0),
(76, 'hahwhwhah', 'sjjshshshs', '12345678', '6421256649', '2913', 1, 'foCAfxy8RrCioGSVlO9Vtj:APA91bHV7Hx9yHsOz0G6X9RZGrjDeAHjbd9NMq1vuSlkgWxyjqKjrjhgXa5PzoYNg1YkzJuoWnAGC3vroLzQfezZcbUPBnXUbsoANlaZL46-_yxE8WX92FzlzflSDw9_3vpipfOsX77U', '2022-04-13 08:30:22', 1, 0, '', 0, 0, 'android', NULL, '0', 2, 0, 0),
(77, 'nhajhssusu', 'ajhsjshshsshsh', '12345678', '6454545485', '6829', 1, 'fjDnVk1sQ6iuqCLF4JiJU8:APA91bHeWmTWGbrR8pWU51cP6zZy9lKDSRMkV-75k8s8SueIxYGz6L3EOhjZnKjq7DgFZZTAysUD_CJlQO0681AkHsedU9UPqb1AjJsByI0FS0KQesu-ojNI1Z7oWKRqxs0oR8-Tt7f5', '2022-04-13 08:35:37', 1, 0, '', 0, 0, 'android', NULL, '0', 2, 0, 0),
(78, 'babehsnsjsn hhs', 'suahshsah', '12345678', '6494548454', '8560', 1, 'fPV0EschT-Cr77EubTFSVJ:APA91bHSPfK55jSagLrX3JI69dtbr5DtJP_7xwGUhU0k1yAqxVyzqsxtou65Db-3c-nTrOQOj0Hdbg0OLxdC3RtWDdAXBbNmN5SKX4NYZHT0FOuJohCzElC6LIEUTIV6fcGm4D4u5X0B', '2022-04-13 08:38:59', 1, 0, '', 0, 0, 'android', NULL, '0', 2, 0, 0),
(79, 'Harshit Gupta(test)\n', 'gdghgzyfjvysfx', '123456', '6666666666', '7901', 1, 'cHL28W6DQWag6A6mPs-UJ6:APA91bFXNgyCdNLEjKbaz97G_nYZZS6KFxKuwH23XyBYTUTC_CFOIrS8Q7bu93fHkpvZ3rZIHj167Tyoh7GXZhcLTFOvY_dDebJ8h5UryMcQdVK-FffTTrPG7AkPJEdfJgLMbiOb-q-6', '2022-05-13 05:17:10', 1, 1400, '', 0, 0, 'android', NULL, '16524190304GqjMH5oIMG_20211203_212555.jpg', 2, 0, 0),
(80, 'ty', 'ty@gmail.com', '123456', '9415964412', '2510', 1, 'foCAfxy8RrCioGSVlO9Vtj:APA91bHV7Hx9yHsOz0G6X9RZGrjDeAHjbd9NMq1vuSlkgWxyjqKjrjhgXa5PzoYNg1YkzJuoWnAGC3vroLzQfezZcbUPBnXUbsoANlaZL46-_yxE8WX92FzlzflSDw9_3vpipfOsX77U', '2022-07-20 05:27:51', 1, 0, '', 0, 0, 'android', NULL, '0', 2, 0, 0),
(81, 'Anindita Paul\n\n\n', 'anindita@smartcricket.com', 'abcd1234', '9880617669', '3127', 1, 'c3baMANPSLyx0EvFHK5GeA:APA91bGNcwwIFrfDOn-0L0kKQQEmvKYRTEq34evOMvwSlxgQPm0VnXiuoLbI0fXbglwjznwOaJVtw8nquZVFCBRae_jl1hsYVRdcsAQiIy5p5u-VJmqx88PgSE-v_AvLorv447NNaZBy', '2022-10-31 06:40:44', 1, 435, '', 0, 0, 'android', NULL, '1651481387jKt5czGNSAVE_20220422_161546.jpg', 2, 0, 0),
(82, 'Avantika Paul', 'aninpaul2013@gmail.com', 'abcdefg', '9038078082', '3756', 1, 'eWjQgKglQSubSFEoarakoT:APA91bEPk1BCbIw4qwGimoyra3moenmmNGr06vnS5mIr4e7sDWFA10DI91-jCeGDo3cn6ksmWC6LAWe9g-67qsHgdzstBcatu4kVkD-uxUMagIua7cRp31ZPyPxyJHILOOUj5te3uZWv', '2022-04-22 13:05:25', 1, 0, '', 0, 0, 'android', NULL, '0', 2, 0, 0),
(83, 'Anindita Paul', 'aninpaul2017@gmail.com', '1234', '8777019409', '7415', 0, 'd1hEjeuJSN-Gw5nJ4NPeNC:APA91bFUAhFdYNJtuM426UIrtHmKRxxB829mZncVXmmv2zjmSVjLq-77mmDU5xir4ppjoM3nlOxm1HmHolnaAgaoHAdST40SA67jW64zSRuZIwbeV9Nv4np8w-PEZOfgGJKAv3DlQhqJ', '2022-05-02 10:31:53', 0, 0, '', 0, 0, '', NULL, NULL, 2, 0, 0),
(84, 'Anindita Paul', 'avanpaul2016@gmail.com', '123456', '9038078083', '7358', 1, 'd1hEjeuJSN-Gw5nJ4NPeNC:APA91bFUAhFdYNJtuM426UIrtHmKRxxB829mZncVXmmv2zjmSVjLq-77mmDU5xir4ppjoM3nlOxm1HmHolnaAgaoHAdST40SA67jW64zSRuZIwbeV9Nv4np8w-PEZOfgGJKAv3DlQhqJ', '2022-04-29 11:06:10', 1, 1, '', 0, 0, 'android', NULL, NULL, 2, 0, 0),
(85, 'Sumanta Paul', 'paulsumanta62@gmail.com', '123456', '8777599548', '5463', 1, 'd1hEjeuJSN-Gw5nJ4NPeNC:APA91bFUAhFdYNJtuM426UIrtHmKRxxB829mZncVXmmv2zjmSVjLq-77mmDU5xir4ppjoM3nlOxm1HmHolnaAgaoHAdST40SA67jW64zSRuZIwbeV9Nv4np8w-PEZOfgGJKAv3DlQhqJ', '2022-04-28 06:55:10', 1, 0, '', 0, 0, 'android', NULL, '16511289100MolD6EvSAVE_20220422_161546.jpg', 2, 0, 0),
(86, 'Darling Diyan', 'dd@uber.com', 'madhu123#', '9632587412', '9186', 0, 'fJJDcakPRgyRmiKSdpNxtL:APA91bGr93dm4t71XfTbldMEkrEwVpx7EgNc-f3tIUAIldokzOH-h8UKIAZj9nMR-vQC9UOzCAhpA6Ft0D1GK9JfzNxceZSVRKvETL7iBr5IrkTAbciLKTm7_xWOUOO8FOmpFDt5w1-R', '2022-04-28 06:23:25', 0, 0, '', 0, 0, '', NULL, NULL, 2, 0, 0),
(87, 'darling diyan', 'dd1@uber.com', 'Madhu123', '9632587413', '7214', 1, 'fJJDcakPRgyRmiKSdpNxtL:APA91bGr93dm4t71XfTbldMEkrEwVpx7EgNc-f3tIUAIldokzOH-h8UKIAZj9nMR-vQC9UOzCAhpA6Ft0D1GK9JfzNxceZSVRKvETL7iBr5IrkTAbciLKTm7_xWOUOO8FOmpFDt5w1-R', '2022-05-05 06:03:58', 1, 100, '', 0, 0, 'android', NULL, NULL, 2, 0, 0),
(88, '2', '2', '123456', '1236547890', '9681', 1, 'cBWedJPRR7C8qXhXNhXXlN:APA91bGO3caI_c0g_t0QhNdGniM_347D8lBuGoo_zjgMHZIYlSTVHyhWrMa-aIKL4avwZZfrtmH23fbi5gAKSXD3X6JaPnE1QK8zsDiL3h0EhllUDvajj02NMK9aisTV85Lzk6nUQ4EH', '2022-04-28 06:34:49', 1, 0, '', 0, 0, 'android', NULL, NULL, 2, 0, 0),
(89, 'chfj', 'hg140400gmail.com', '12345678', '2582582582', '5421', 0, 'cHL28W6DQWag6A6mPs-UJ6:APA91bFXNgyCdNLEjKbaz97G_nYZZS6KFxKuwH23XyBYTUTC_CFOIrS8Q7bu93fHkpvZ3rZIHj167Tyoh7GXZhcLTFOvY_dDebJ8h5UryMcQdVK-FffTTrPG7AkPJEdfJgLMbiOb-q-6', '2022-05-13 05:38:12', 0, 0, '', 0, 0, '', NULL, NULL, 2, 0, 0),
(90, 'jasw', 'bharath21st@gmail.com', '10dulkar', '8548878008', '4293', 1, 'c7b7RcvLTru_LKCrZMm1-t:APA91bHsJbwDpcowybUljdygh78wqvKFchsxTFOrD2MoYL6_rhDpKrzx1cdIPxPFN3OwcfMNbTohjZY8lhM1dmBANZxJ1YmTdhQlHw4qsmaBsv6m_-cp-kxs4pW1_MTpQuJ8itq-_WF8', '2022-05-17 11:00:05', 1, 0, '', 0, 0, 'android', NULL, NULL, 2, 0, 0),
(91, 'Anindita', 'spaul@kpcmedicalcollege.com', '1234567', '9038078084', '8491', 1, 'cFO4FJ34RzifLY1y6zHHqv:APA91bFv0N1eIu9JsW2kZY_wNxZ9V2snn2ZeeiOjLX3hd-CEdfY3oBduU9Lkf7Xz0dGUIVJkXkUh8LcrwxlfF9YDqh0-N0UupwbiGjXqHvjKiTpQkqxHolFs1FiycFrtvON9hUymJky6', '2022-05-18 07:44:43', 1, 10, '', 0, 0, 'Android', NULL, '1652793446zKyBHiSVSAVE_20220422_161546.jpg', 2, 0, 0),
(92, 'sumanta paul', 'abc@gmail.com', '1234567', '9988776655', '5934', 1, 'cFO4FJ34RzifLY1y6zHHqv:APA91bFv0N1eIu9JsW2kZY_wNxZ9V2snn2ZeeiOjLX3hd-CEdfY3oBduU9Lkf7Xz0dGUIVJkXkUh8LcrwxlfF9YDqh0-N0UupwbiGjXqHvjKiTpQkqxHolFs1FiycFrtvON9hUymJky6', '2022-05-18 08:01:10', 1, 0, '', 0, 0, 'android', NULL, NULL, 2, 0, 0),
(93, 'DJ Tillu', 'djtillu@mailinator.com', 'asd123@', '9900990099', '8014', 1, 'eanbEofjTJyT5ycPobbXTG:APA91bG11sHsrqSIUwsFl9bbEDjVt18WB7QOwN9rxeIO86GZBM4NZ0Dv_i_8kafEQ_g8YVSx__8o-r72j6FfWqsn5-CSMIAvsHhlA2zZtsYmmGqIv9ebYcM-1OIL6gQeB_bW8FUsFQty', '2022-05-18 11:55:43', 1, 0, '', 0, 0, 'android', NULL, NULL, 2, 0, 0),
(94, 'Brazil Chutia', 'brazil@smartcricket.com', 'brazil123', '6361368878', '2153', 1, 'eglq9bRLR9mp122o29i-_j:APA91bHtiee5lHsW_ofjUOwN1ZK4BHxVekyVO-4fg6OR1eWROtM-FUuWJLey5k_u37odcj1D-nTmdiovdwetshrTRrgJ9wtl0QA-P17oOb7OjoUnzlX1pQ-RWQx5iP7oKGu-BSYPOfrT', '2022-06-01 05:52:12', 1, 50, '', 0, 0, 'android', NULL, NULL, 2, 0, 0),
(95, 'Manoj ', 'test121212@gmail.com', 'test@1234', '966308587', '9548', 0, '12345', '2022-06-07 06:53:00', 0, 0, '', 0, 0, '', NULL, NULL, 2, 0, 0),
(96, 'madhu', 'madhu@smartcricket.com', 'madhu123#', '8401471986', '5386', 0, '12345', '2022-06-07 06:53:26', 0, 0, '', 0, 0, '', NULL, NULL, 2, 0, 0),
(97, 'manoj', 'test12121212@gmail.com', 'test@1234', '966389028587', '9583', 0, '12345', '2022-06-07 06:55:33', 0, 0, '', 0, 0, '', NULL, NULL, 2, 0, 0),
(98, 'Anindita Paul', 'ani.x@winds.co.in', 'test', '9632921729', '1950', 0, '12345', '2022-06-07 07:28:51', 0, 0, '', 0, 0, '', NULL, NULL, 2, 0, 0),
(99, 'Veer bhanu pratap singh', 'veer12@gmail.com', '1234', '91159644041', '8604', 0, 'ashfjshjfkhsjhfdsjhfjkshdfjsdhfjsdhf', '2022-06-09 10:26:45', 0, 0, '', 0, 0, '', NULL, NULL, 2, 0, 0),
(100, 'Rajesh', 'raj@gmail.com', '123', '8897564184', '9710', 1, '123', '2022-06-09 11:14:29', 1, 0, '', 0, 0, 'IOS', NULL, NULL, 2, 0, 0),
(101, 'New Rajesh', 'Rakesh11@gmail.com', '123', '8877667767', '5063', 0, '12345', '2022-06-09 11:05:27', 0, 0, '', 0, 0, '', NULL, NULL, 2, 0, 0),
(102, 'iOS Customer Uber laundry App', 'test11@gmail.com', 'abcdefg', '1122448844', '2697', 1, '12345', '2022-06-15 06:38:58', 1, 0, '', 0, 0, '', NULL, NULL, 2, 0, 0),
(103, 'Manoj', 'Bharath@smartcricket.com', 'test@1234', '8277661659', '7689', 1, '123', '2022-06-24 10:40:05', 1, 123, '', 0, 0, 'IOS', NULL, NULL, 2, 0, 0),
(104, 'Anindita Paul', 'aninpaul20171@gmail.com', 'abcd1234', '8777599547', '8917', 1, '123', '2022-06-24 11:32:18', 1, 0, 'P/16, SPD Block Baghajatin Rd, E Block, Ajanta Park, Baghajatin Colony, Kolkata, West Bengal 700086, India', 22.482177734375, 88.37658911145084, 'IOS', NULL, NULL, 2, 0, 0),
(105, 'test', 'test@fgmail.com', 'test@1234', '9663028586', '4869', 1, '12345', '2022-06-24 11:36:07', 1, 0, '', 0, 0, '', NULL, NULL, 2, 0, 0),
(106, 'Paul', 'test123@gmail.com', 'test123', '9880617667', '1489', 1, '123', '2022-06-24 11:52:32', 1, 0, 'P-4, E Block, Kusum Kanan, Baghajatin Colony, Kolkata, West Bengal 742306, India', 22.482101440429688, 88.37657714541514, 'IOS', NULL, NULL, 2, 0, 0),
(107, 'testing ', 'test23@gmail.com', 'ab12', '1234567892', '4263', 1, '12345', '2022-06-24 13:03:55', 1, 0, '', 0, 0, '', NULL, NULL, 2, 0, 0),
(108, 'Manoj Hegde', 'manu@mail.com', 'ul@1234', '9999999999', '4328', 1, 'fYzxugZETJSgbexnMEBkHA:APA91bHEFpiYTLmooBl53FpPBZjJ9bAaIPooJN5n1qt-PYhJcs0NKDmoSmemrigkegsDnHW_Pl_DhnhIvihe0SC7ucStKTm9cDFIXPtg84Eh6cZuyrHihCkeKR-wr2jO_9kOHZjdc3SE', '2022-07-25 05:57:42', 1, 0, '', 0, 0, 'android', NULL, NULL, 2, 0, 0),
(109, 'Shivtest', 'shivtest@gmqil.com', '1234', '9415967721', '1067', 0, '12345678', '2022-09-21 05:59:48', 0, 0, '', 0, 0, '', NULL, NULL, 2, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transaction_partner`
--

CREATE TABLE `wallet_transaction_partner` (
  `id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `amt` double NOT NULL,
  `transaction_operation` text COLLATE utf8_unicode_ci NOT NULL,
  `remark` text COLLATE utf8_unicode_ci NOT NULL,
  `added_date` date NOT NULL,
  `added_date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `booking_id` int(11) NOT NULL,
  `type` int(5) DEFAULT '0' COMMENT '1->Add, 0->Remove',
  `status` int(11) NOT NULL,
  `is_send_to_bank` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wallet_transaction_partner`
--

INSERT INTO `wallet_transaction_partner` (`id`, `vendor_id`, `amt`, `transaction_operation`, `remark`, `added_date`, `added_date_time`, `booking_id`, `type`, `status`, `is_send_to_bank`) VALUES
(1, 1, 10, '', '', '2022-02-08', '2022-02-08 09:17:19', 0, 1, 1, 0),
(2, 1, 20, '', '', '2022-02-08', '2022-02-08 09:17:55', 0, 1, 1, 0),
(3, 1, 15, '', '', '2022-02-08', '2022-02-08 09:18:16', 0, 0, 1, 0),
(4, 4, 10, 'Trancection', 'Remark', '2022-02-08', '2022-02-08 07:01:48', 0, 1, 1, 0),
(5, 4, 5, 'adf', 'asdf', '2022-02-08', '2022-02-08 07:23:31', 0, 0, 1, 0),
(6, 4, 10, 'Testing credit', 'test', '2022-02-09', '2022-02-09 02:04:20', 0, 1, 1, 0),
(7, 4, 2, 'Testing debit', 'test', '2022-02-09', '2022-02-09 02:04:42', 0, 0, 1, 0),
(8, 12, 2.4, '', 'You received cash £25, from order id : #1 and Your commission in this booking is : £22.6 and Extra amount £2.4 deducted from your wallet.', '2022-04-26', '2022-04-26 16:52:40', 1, 0, 1, 0),
(9, 12, 2.4, '', 'You received cash £25, from order id : #1 and Your commission in this booking is : £22.6 and Extra amount £2.4 deducted from your wallet.', '2022-04-26', '2022-04-26 16:54:52', 1, 0, 1, 0),
(10, 12, 2.4, '', 'You received cash £25, from order id : #1 and Your commission in this booking is : £22.6 and Extra amount £2.4 deducted from your wallet.', '2022-04-26', '2022-04-26 16:57:21', 1, 0, 1, 0),
(11, 12, 2.4, '', 'You received cash £25, from order id : #1 and Your commission in this booking is : £22.6 and Extra amount £2.4 deducted from your wallet.', '2022-04-26', '2022-04-26 16:57:58', 1, 0, 1, 0),
(12, 12, 1, '', 'You received cash £11, from order id : #4 and Your commission in this booking is : £10 and Extra amount £1 deducted from your wallet.', '2022-04-26', '2022-04-26 17:22:00', 4, 0, 1, 0),
(13, 12, 5.4, '', 'You received cash £56, from order id : #8 and Your commission in this booking is : £50.6 and Extra amount £5.4 deducted from your wallet.', '2022-04-26', '2022-04-26 17:30:01', 8, 0, 1, 0),
(14, 12, 1.4, '', 'You received cash £14, from order id : #9 and Your commission in this booking is : £12.6 and Extra amount £1.4 deducted from your wallet.', '2022-04-26', '2022-04-26 18:01:47', 9, 0, 1, 0),
(15, 12, 1, '', 'You received cash £11, from order id : #48 and Your commission in this booking is : £10 and Extra amount £1 deducted from your wallet.', '2022-05-17', '2022-05-17 15:36:55', 48, 0, 1, 0),
(16, 12, 21, '', 'You received cash £231, from order id : #53 and Your commission in this booking is : £210 and Extra amount £21 deducted from your wallet.', '2022-05-17', '2022-05-17 16:03:42', 53, 0, 1, 0),
(17, 12, 36, '', 'You received cash £381, from order id : #51 and Your commission in this booking is : £345 and Extra amount £36 deducted from your wallet.', '2022-05-17', '2022-05-17 16:05:28', 51, 0, 1, 0),
(18, 12, 10, '', 'You received cash £110, from order id : #54 and Your commission in this booking is : £100 and Extra amount £10 deducted from your wallet.', '2022-05-17', '2022-05-17 16:25:46', 54, 0, 1, 0),
(19, 12, 25, '', 'You received cash £260, from order id : #57 and Your commission in this booking is : £235 and Extra amount £25 deducted from your wallet.', '2022-05-17', '2022-05-17 16:34:10', 57, 0, 1, 0),
(20, 12, 1, '', 'You received cash £11, from order id : #62 and Your commission in this booking is : £10 and Extra amount £1 deducted from your wallet.', '2022-05-17', '2022-05-17 18:31:12', 62, 0, 1, 0),
(21, 12, 8, '', 'You received cash £85887, from order id : #65 and Your commission in this booking is : £85879 and Extra amount £8 deducted from your wallet.', '2022-05-17', '2022-05-17 18:50:58', 65, 0, 1, 0),
(22, 12, 1.7, '', 'You received cash £18, from order id : #74 and Your commission in this booking is : £16.3 and Extra amount £1.7 deducted from your wallet.', '2022-05-23', '2022-05-23 16:19:29', 74, 0, 1, 0),
(23, 12, 2, '', 'You received cash £20, from order id : #98 and Your commission in this booking is : £18 and Extra amount £2 deducted from your wallet.', '2022-06-07', '2022-06-07 12:47:43', 98, 0, 1, 0),
(24, 12, 4.7, '', 'You received cash £48, from order id : #106 and Your commission in this booking is : £43.3 and Extra amount £4.7 deducted from your wallet.', '2022-06-07', '2022-06-07 17:18:59', 106, 0, 1, 0),
(25, 12, 1.7, '', 'You received cash £18, from order id : #120 and Your commission in this booking is : £16.3 and Extra amount £1.7 deducted from your wallet.', '2022-06-08', '2022-06-08 15:15:57', 120, 0, 1, 0),
(26, 12, 15, '', 'You received cash £150, from order id : #124 and Your commission in this booking is : £135 and Extra amount £15 deducted from your wallet.', '2022-06-08', '2022-06-08 17:27:34', 124, 0, 1, 0),
(27, 12, 10, '', 'You received cash £110, from order id : #125 and Your commission in this booking is : £100 and Extra amount £10 deducted from your wallet.', '2022-06-08', '2022-06-08 17:30:17', 125, 0, 1, 0),
(28, 12, 1.2, '', 'You received cash £12.12, from order id : #127 and Your commission in this booking is : £10.92 and Extra amount £1.2 deducted from your wallet.', '2022-06-08', '2022-06-08 18:00:56', 127, 0, 1, 0),
(29, 12, 10, '', 'You received cash £110, from order id : #128 and Your commission in this booking is : £100 and Extra amount £10 deducted from your wallet.', '2022-06-15', '2022-06-15 18:25:19', 128, 0, 1, 0),
(30, 12, 0, '', 'You commission £0, from order id : #139 has been credited to your wallet.', '2022-06-16', '2022-06-16 11:49:19', 139, 1, 1, 0),
(31, 12, 15, '', 'You received cash £150, from order id : #144 and Your commission in this booking is : £135 and Extra amount £15 deducted from your wallet.', '2022-06-16', '2022-06-16 15:17:04', 144, 0, 1, 0),
(32, 12, 1, '', 'You received cash £11, from order id : #146 and Your commission in this booking is : £10 and Extra amount £1 deducted from your wallet.', '2022-06-16', '2022-06-16 15:37:41', 146, 0, 1, 0),
(33, 12, 2.7, '', 'You received cash £28, from order id : #149 and Your commission in this booking is : £25.3 and Extra amount £2.7 deducted from your wallet.', '2022-06-17', '2022-06-17 13:20:16', 149, 0, 1, 0),
(34, 12, 9.9, '', 'You received cash £99, from order id : #155 and Your commission in this booking is : £89.1 and Extra amount £9.9 deducted from your wallet.', '2022-06-29', '2022-06-29 17:07:33', 155, 0, 1, 0),
(35, 12, 1.7, '', 'You received cash £20, from order id : #158 and Your commission in this booking is : £18.3 and Extra amount £1.7 deducted from your wallet.', '2022-07-11', '2022-07-11 12:30:18', 158, 0, 1, 0),
(36, 12, 300, 'Admin', 'Credit by Admin', '2022-07-20', '2022-07-20 03:16:32', 0, 1, 1, 0),
(37, 12, 100, 'Add by admin', 'Added for testing', '2022-07-20', '2022-07-20 04:13:34', 0, 1, 1, 0),
(38, 12, 50, '', 'Send to bank £50.', '2022-07-20', '2022-07-20 10:50:06', 0, 0, 1, 1),
(39, 12, 10, '', 'Send to bank £10.', '2022-07-20', '2022-07-20 16:19:31', 0, 0, 1, 1),
(40, 12, 15, '', 'Send to bank £15.', '2022-07-20', '2022-07-20 16:20:31', 0, 0, 1, 1),
(41, 12, 3.24, '', 'You received cash £48.02, from order id : #163 and Your commission in this booking is : £44.78 and Extra amount £3.24 deducted from your wallet.', '2022-07-20', '2022-07-20 16:40:17', 163, 0, 1, 0),
(42, 12, 1, '', 'Send to bank £1.', '2022-07-20', '2022-07-20 18:10:23', 0, 0, 1, 1),
(43, 12, 13.08, '', 'You received cash £143.34, from order id : #171 and Your commission in this booking is : £130.26 and Extra amount £13.08 deducted from your wallet.', '2022-07-21', '2022-07-21 12:45:52', 171, 0, 1, 0),
(44, 12, 3.24, '', 'You received cash £35.02, from order id : #175 and Your commission in this booking is : £31.78 and Extra amount £3.24 deducted from your wallet.', '2022-07-21', '2022-07-21 13:05:47', 175, 0, 1, 0),
(45, 12, 2.04, '', 'You received cash £41.42, from order id : #170 and Your commission in this booking is : £39.38 and Extra amount £2.04 deducted from your wallet.', '2022-07-21', '2022-07-21 13:13:13', 170, 0, 1, 0),
(46, 12, 2.04, '', 'You received cash £22.42, from order id : #183 and Your commission in this booking is : £20.38 and Extra amount £2.04 deducted from your wallet.', '2022-07-22', '2022-07-22 14:00:02', 183, 0, 1, 0),
(47, 12, 2.04, '', 'You received cash £22.42, from order id : #184 and Your commission in this booking is : £20.38 and Extra amount £2.04 deducted from your wallet.', '2022-07-22', '2022-07-22 15:41:32', 184, 0, 1, 0),
(48, 12, 1.2, '', 'You received cash £31.6, from order id : #187 and Your commission in this booking is : £30.4 and Extra amount £1.2 deducted from your wallet.', '2022-07-22', '2022-07-22 16:11:25', 187, 0, 1, 0),
(49, 12, 1.2, '', 'You received cash £77.6, from order id : #193 and Your commission in this booking is : £76.4 and Extra amount £1.2 deducted from your wallet.', '2022-07-25', '2022-07-25 12:27:19', 193, 0, 1, 0),
(50, 12, 32.4, '', 'You received cash £388.02, from order id : #196 and Your commission in this booking is : £355.62 and Extra amount £32.4 deducted from your wallet.', '2022-07-25', '2022-07-25 14:00:33', 196, 0, 1, 0),
(51, 12, 1, '', 'Send to bank £1.', '2022-07-25', '2022-07-25 14:18:02', 0, 0, 1, 1),
(52, 12, 1, '', 'Send to bank £1.', '2022-07-25', '2022-07-25 14:18:14', 0, 0, 1, 1),
(53, 12, 1, '', 'Send to bank £1.', '2022-07-25', '2022-07-25 14:18:30', 0, 0, 1, 1),
(54, 12, 58.5, '', 'You received cash £720.61, from order id : #192 and Your commission in this booking is : £662.11 and Extra amount £58.5 deducted from your wallet.', '2022-07-25', '2022-07-25 15:20:31', 192, 0, 1, 0),
(55, 12, 0.84, '', 'You received cash £96.82, from order id : #199 and Your commission in this booking is : £95.98 and Extra amount £0.84 deducted from your wallet.', '2022-07-25', '2022-07-25 17:24:44', 199, 0, 1, 0),
(56, 12, 4.2, '', 'You received cash £133.1, from order id : #200 and Your commission in this booking is : £128.9 and Extra amount £4.2 deducted from your wallet.', '2022-07-25', '2022-07-25 17:56:09', 200, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transaction_rider`
--

CREATE TABLE `wallet_transaction_rider` (
  `id` int(11) NOT NULL,
  `rider_id` int(11) NOT NULL,
  `amt` double NOT NULL,
  `transaction_operation` enum('plus','minus') COLLATE utf8_unicode_ci NOT NULL,
  `remark` text COLLATE utf8_unicode_ci NOT NULL,
  `added_date` date NOT NULL,
  `added_date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `booking_id` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wallet_transaction_rider`
--

INSERT INTO `wallet_transaction_rider` (`id`, `rider_id`, `amt`, `transaction_operation`, `remark`, `added_date`, `added_date_time`, `booking_id`, `status`) VALUES
(1, 5, 50, 'plus', 'Credit by laundry', '2022-02-28', '2022-02-28 06:32:38', 0, 1),
(2, 5, 40, 'plus', 'Credit by laundry', '2022-02-28', '2022-02-28 06:32:46', 0, 1),
(3, 5, 10, 'minus', 'Debit by laundry', '2022-02-28', '2022-02-28 06:33:07', 0, 1),
(4, 5, 40, 'plus', 'Testing credit', '2022-03-02', '2022-03-02 14:23:57', 0, 1),
(5, 5, 10, 'minus', 'Testing credit', '2022-03-02', '2022-03-02 14:25:43', 0, 1),
(6, 11, 100, 'plus', 'test', '2022-03-02', '2022-03-02 15:38:45', 0, 1),
(7, 11, 10, 'plus', 'test', '2022-03-02', '2022-03-02 15:40:18', 0, 1),
(8, 11, 90, 'minus', 'test', '2022-03-02', '2022-03-02 15:40:42', 0, 1),
(9, 11, 10, 'plus', 'tedting', '2022-03-02', '2022-03-02 15:45:24', 0, 1),
(10, 11, 50, 'plus', 'testing perpose', '2022-03-02', '2022-03-02 15:52:33', 0, 1),
(11, 11, 20, 'plus', 'test', '2022-03-02', '2022-03-02 15:58:54', 0, 1),
(12, 11, 12, 'plus', 'test', '2022-03-02', '2022-03-02 16:10:22', 0, 1),
(13, 12, 26.5, 'minus', 'You Received cash £26.5, from order id : #16', '2022-03-02', '2022-03-05 03:45:39', 0, 1),
(14, 12, 14.5, 'minus', 'You Received cash £14.5, from order id : #18', '2022-03-02', '2022-03-05 03:45:53', 0, 1),
(15, 12, 14.5, 'minus', 'You Received cash  £14.5, from order id : #20', '2022-03-03', '2022-03-05 03:46:08', 0, 1),
(16, 12, 20, 'plus', 'Received cash at laundry', '2022-03-03', '2022-03-03 11:55:47', 0, 1),
(17, 12, 26.5, 'minus', 'You Received cash  £26.5, from order id : #22', '2022-03-03', '2022-03-05 03:46:20', 0, 1),
(18, 12, 1461.5, 'minus', 'You Received cash  £1461.5, from order id : #24', '2022-03-03', '2022-03-05 03:46:43', 0, 1),
(19, 12, 14.5, 'minus', 'You received cash £14.5, from order id : #42', '2022-03-05', '2022-03-05 13:00:54', 0, 1),
(20, 12, 33.5, 'minus', 'You received cash £33.5, from order id : #44', '2022-03-05', '2022-03-05 21:18:39', 0, 1),
(21, 12, 2153.88, 'minus', 'You received cash £2153.88, from order id : #62', '2022-04-01', '2022-04-01 16:47:48', 0, 1),
(22, 12, 500, 'minus', 'test', '2022-04-13', '2022-04-13 17:12:48', 0, 1),
(23, 12, 285.5, 'minus', 'You received cash £285.5, from order id : #72', '2022-04-14', '2022-04-14 11:47:39', 0, 1),
(24, 12, 3724, 'minus', 'You received cash £3724, from order id : #74', '2022-04-14', '2022-04-14 18:20:48', 0, 1),
(25, 12, 7000, 'minus', 'test', '2022-04-19', '2022-04-19 18:23:07', 0, 1),
(26, 12, 1000, 'plus', 'test', '2022-04-19', '2022-04-19 18:23:39', 0, 1),
(27, 12, 28, 'minus', 'You received cash Rs.28, from order id : #80', '2022-04-22', '2022-04-22 19:15:16', 0, 1),
(28, 12, 54, 'minus', 'You received cash Rs.54, from order id : #77', '2022-04-25', '2022-04-25 17:30:26', 0, 1),
(29, 12, 238.5, 'minus', 'You received cash Rs.238.5, from order id : #79', '2022-04-26', '2022-04-26 12:43:57', 0, 1),
(30, 12, 2227.06, 'minus', 'You received cash £2227.06, from order id : #52', '2022-04-26', '2022-04-26 13:51:11', 0, 1),
(31, 12, 42.5, 'minus', 'You received cash £42.5, from order id : #20', '2022-04-28', '2022-04-28 13:26:42', 0, 1),
(32, 12, 11, 'minus', 'You received cash £11, from order id : #18', '2022-04-28', '2022-04-28 13:55:11', 0, 1),
(33, 12, 35, 'minus', 'You received cash £35, from order id : #21', '2022-04-28', '2022-04-28 14:49:51', 0, 1),
(34, 12, 290, 'minus', 'You received cash £290, from order id : #31', '2022-04-28', '2022-04-28 15:50:52', 0, 1),
(35, 12, 21, 'minus', 'You received cash Rs.21, from order id : #32', '2022-04-28', '2022-04-28 16:19:24', 0, 1),
(36, 12, 47, 'minus', 'You received cash Rs.47, from order id : #28', '2022-04-28', '2022-04-28 16:20:30', 0, 1),
(37, 12, 7, 'minus', 'You received cash Rs.7, from order id : #22', '2022-04-28', '2022-04-28 16:21:11', 0, 1),
(38, 14, 30, 'minus', 'You received cash £30, from order id : #36', '2022-05-02', '2022-05-02 13:47:18', 0, 1),
(39, 18, 41, 'minus', 'You received cash £41, from order id : #44', '2022-05-05', '2022-05-05 16:57:09', 0, 1),
(40, 18, 58, 'minus', 'You received cash £58, from order id : #41', '2022-05-05', '2022-05-05 18:13:39', 0, 1),
(41, 18, 65, 'minus', 'You received cash £65, from order id : #52', '2022-05-17', '2022-05-17 16:03:40', 0, 1),
(42, 14, 10, 'minus', 'You received cash £10, from order id : #56', '2022-05-17', '2022-05-17 16:31:04', 0, 1),
(43, 18, 30, 'minus', 'You received cash £30, from order id : #64', '2022-05-17', '2022-05-17 18:45:26', 0, 1),
(44, 18, 88.62, 'minus', 'You received cash £88.62, from order id : #69', '2022-05-18', '2022-05-18 17:39:07', 0, 1),
(45, 18, 54.25, 'minus', 'You received cash £54.25, from order id : #70', '2022-05-18', '2022-05-18 18:26:37', 0, 1),
(46, 18, 103, 'minus', 'You received cash £103, from order id : #107', '2022-06-07', '2022-06-07 17:22:36', 0, 1),
(47, 18, 86, 'minus', 'You received cash £86, from order id : #108', '2022-06-07', '2022-06-07 18:51:00', 0, 1),
(48, 18, 240, 'minus', 'You received cash £240, from order id : #109', '2022-06-08', '2022-06-08 14:51:58', 0, 1),
(49, 18, 77.12, 'minus', 'You received cash £77.12, from order id : #126', '2022-06-08', '2022-06-08 17:36:40', 0, 1),
(50, 18, 289, 'minus', 'You received cash £289, from order id : #129', '2022-06-13', '2022-06-13 10:51:03', 0, 1),
(51, 18, 334.08, 'minus', 'You received cash £334.08, from order id : #136', '2022-06-15', '2022-06-15 17:45:43', 0, 1),
(52, 18, 309.11, 'minus', 'You received cash £309.11, from order id : #140', '2022-06-16', '2022-06-16 12:09:51', 0, 1),
(53, 18, 221.12, 'minus', 'You received cash £221.12, from order id : #141', '2022-06-16', '2022-06-16 12:26:57', 0, 1),
(54, 18, 91.12, 'minus', 'You received cash £91.12, from order id : #142', '2022-06-16', '2022-06-16 12:36:22', 0, 1),
(55, 18, 197, 'minus', 'You received cash £197, from order id : #145', '2022-06-16', '2022-06-16 15:28:07', 0, 1),
(56, 18, 128, 'minus', 'You received cash £128, from order id : #152', '2022-06-28', '2022-06-28 13:21:27', 0, 1),
(57, 18, 667.24, 'minus', 'You received cash £667.24, from order id : #159', '2022-07-11', '2022-07-11 13:30:23', 0, 1),
(58, 18, 48.02, 'minus', 'You received cash £48.02, from order id : #163', '2022-07-20', '2022-07-20 16:31:22', 0, 1),
(59, 18, 48.02, 'minus', 'You received cash £48.02, from order id : #163', '2022-07-20', '2022-07-20 16:35:31', 0, 1),
(60, 18, 48.02, 'minus', 'You received cash £48.02, from order id : #163', '2022-07-20', '2022-07-20 16:40:17', 0, 1),
(61, 18, 41.42, 'minus', 'You received cash £41.42, from order id : #170', '2022-07-21', '2022-07-21 13:13:13', 0, 1),
(62, 22, 31.6, 'minus', 'You received cash £31.6, from order id : #187', '2022-07-22', '2022-07-22 16:11:25', 0, 1),
(63, 22, 77.6, 'minus', 'You received cash £77.6, from order id : #193', '2022-07-25', '2022-07-25 12:27:19', 0, 1),
(64, 18, 720.61, 'minus', 'You received cash £720.61, from order id : #192', '2022-07-25', '2022-07-25 15:20:31', 0, 1),
(65, 22, 96.82, 'minus', 'You received cash £96.82, from order id : #199', '2022-07-25', '2022-07-25 17:24:44', 0, 1),
(66, 22, 133.1, 'minus', 'You received cash £133.1, from order id : #200', '2022-07-25', '2022-07-25 17:56:09', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transaction_user`
--

CREATE TABLE `wallet_transaction_user` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amt` double NOT NULL,
  `transaction_operation` text COLLATE utf8_unicode_ci NOT NULL,
  `remark` text COLLATE utf8_unicode_ci NOT NULL,
  `added_date` date NOT NULL,
  `added_date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `booking_id` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wallet_transaction_user`
--

INSERT INTO `wallet_transaction_user` (`id`, `user_id`, `amt`, `transaction_operation`, `remark`, `added_date`, `added_date_time`, `booking_id`, `status`) VALUES
(1, 6, 100, 'plus', 'Wallet recharged successfully', '2022-04-25', '2022-04-25 16:40:58', 0, 1),
(2, 79, 200, 'plus', 'Wallet recharged successfully', '2022-04-25', '2022-04-25 17:43:52', 0, 1),
(3, 79, 1200, 'plus', 'Wallet recharged successfully', '2022-04-27', '2022-04-27 17:45:07', 0, 1),
(4, 54, 200, 'plus', 'Wallet recharged successfully', '2022-04-28', '2022-04-28 10:52:55', 0, 1),
(5, 84, 1, 'plus', 'Wallet recharged successfully', '2022-04-28', '2022-04-28 12:46:49', 0, 1),
(6, 87, 100, 'plus', 'Wallet recharged successfully', '2022-04-28', '2022-04-28 13:06:19', 0, 1),
(7, 54, 100, 'plus', 'Wallet recharged successfully', '2022-04-28', '2022-04-28 13:06:21', 0, 1),
(8, 15, 200, 'plus', 'Wallet recharged successfully', '2022-04-28', '2022-04-28 15:52:46', 0, 1),
(9, 54, 90000000000, 'plus', 'Wallet recharged successfully', '2022-04-29', '2022-04-29 16:56:38', 0, 1),
(10, 54, 2.368808e42, 'plus', 'Wallet recharged successfully', '2022-05-02', '2022-05-02 14:31:14', 0, 1),
(11, 81, 1, 'plus', 'Wallet recharged successfully', '2022-05-02', '2022-05-02 18:30:36', 0, 1),
(12, 54, 123456, 'plus', 'Wallet recharged successfully', '2022-05-05', '2022-05-05 18:43:36', 0, 1),
(13, 54, 9.123369875471608e16, 'plus', 'Wallet recharged successfully', '2022-05-05', '2022-05-05 18:47:18', 0, 1),
(14, 54, 0, 'plus', 'Wallet recharged successfully', '2022-05-05', '2022-05-05 18:47:36', 0, 1),
(15, 54, 0, 'plus', 'Wallet recharged successfully', '2022-05-05', '2022-05-05 18:47:47', 0, 1),
(16, 81, 12, 'plus', 'Wallet recharged successfully', '2022-05-05', '2022-05-05 18:59:40', 0, 1),
(17, 55, 123, 'plus', 'Wallet recharged successfully', '2022-05-17', '2022-05-17 16:37:29', 0, 1),
(18, 55, 0, 'plus', 'Wallet recharged successfully', '2022-05-17', '2022-05-17 16:37:37', 0, 1),
(19, 55, 0, 'plus', 'Wallet recharged successfully', '2022-05-17', '2022-05-17 16:37:53', 0, 1),
(20, 91, 10, 'plus', 'Wallet recharged successfully', '2022-05-17', '2022-05-17 18:04:30', 0, 1),
(21, 94, 50, 'plus', 'Wallet recharged successfully', '2022-05-30', '2022-05-30 17:41:35', 0, 1),
(22, 81, 222, 'plus', 'Wallet recharged successfully', '2022-06-08', '2022-06-08 19:44:39', 0, 1),
(23, 8, 10, 'plus', 'Wallet recharged successfully', '2022-06-21', '2022-06-21 07:45:51', 0, 1),
(24, 15, 200, 'plus', 'Wallet recharged successfully', '2022-06-24', '2022-06-24 12:48:25', 0, 1),
(25, 23, 10, 'plus', 'Wallet recharged successfully', '2022-06-24', '2022-06-24 12:54:22', 0, 1),
(26, 23, 10, 'plus', 'Wallet recharged successfully', '2022-06-24', '2022-06-24 12:54:25', 0, 1),
(27, 23, 10, 'plus', 'Wallet recharged successfully', '2022-06-24', '2022-06-24 12:54:31', 0, 1),
(28, 23, 10, 'plus', 'Wallet recharged successfully', '2022-06-24', '2022-06-24 12:55:18', 0, 1),
(29, 23, 20, 'plus', 'Wallet recharged successfully', '2022-06-24', '2022-06-24 13:11:30', 0, 1),
(30, 103, 123, 'plus', 'Wallet recharged successfully', '2022-06-24', '2022-06-24 16:10:05', 0, 1),
(31, 23, 22, 'plus', 'Wallet recharged successfully', '2022-06-24', '2022-06-24 16:37:24', 0, 1),
(32, 23, 2, 'plus', 'Wallet recharged successfully', '2022-06-27', '2022-06-27 14:38:00', 0, 1),
(33, 81, 200, 'plus', 'Wallet recharged successfully', '2022-07-25', '2022-07-25 17:45:20', 0, 1);

-- --------------------------------------------------------

--
-- Structure for view `all_booking`
--
DROP TABLE IF EXISTS `all_booking`;

-- CREATE ALGORITHM=UNDEFINED DEFINER=`uber_laundry`@`%` SQL SECURITY DEFINER VIEW `all_booking`  AS  (select `booking_list`.`id` AS `id`,`booking_list`.`user_id` AS `user_id`,`booking_list`.`user_name` AS `user_name`,`booking_list`.`user_mobile_no` AS `user_mobile_no`,`booking_list`.`user_email_id` AS `user_email_id`,`booking_list`.`delivery_lat` AS `delivery_lat`,`booking_list`.`delivery_long` AS `delivery_long`,`booking_list`.`delivery_address` AS `delivery_address`,`booking_list`.`delivery_address_id` AS `delivery_address_id`,`booking_list`.`pickup_date` AS `pickup_date`,`booking_list`.`pickup_time` AS `pickup_time`,`booking_list`.`pickup_time_slot_label` AS `pickup_time_slot_label`,`booking_list`.`pickup_time_org` AS `pickup_time_org`,`booking_list`.`placed_time` AS `placed_time`,`booking_list`.`confirm_time` AS `confirm_time`,`booking_list`.`allot_for_pickup_time` AS `allot_for_pickup_time`,`booking_list`.`picked_up_time` AS `picked_up_time`,`booking_list`.`received_at_loundry_time` AS `received_at_loundry_time`,`booking_list`.`in_process_time` AS `in_process_time`,`booking_list`.`order_ready_time` AS `order_ready_time`,`booking_list`.`allot_for_drop_time` AS `allot_for_drop_time`,`booking_list`.`drop_time` AS `drop_time`,`booking_list`.`pickup_otp` AS `pickup_otp`,`booking_list`.`drop_otp` AS `drop_otp`,`booking_list`.`total_item_price` AS `total_item_price`,`booking_list`.`tax_percent` AS `tax_percent`,`booking_list`.`tax_amt` AS `tax_amt`,`booking_list`.`total_amt` AS `total_amt`,`booking_list`.`paid_by_promo` AS `paid_by_promo`,`booking_list`.`paid_by_wallet` AS `paid_by_wallet`,`booking_list`.`paid_by_online` AS `paid_by_online`,`booking_list`.`paid_by_cash` AS `paid_by_cash`,`booking_list`.`skip_for_pay` AS `skip_for_pay`,`booking_list`.`pickup_boy_id` AS `pickup_boy_id`,`booking_list`.`pickup_boy_name` AS `pickup_boy_name`,`booking_list`.`pickup_boy_number` AS `pickup_boy_number`,`booking_list`.`drop_boy_id` AS `drop_boy_id`,`booking_list`.`drop_boy_name` AS `drop_boy_name`,`booking_list`.`drop_boy_number` AS `drop_boy_number`,`booking_list`.`applied_promocode` AS `applied_promocode`,`booking_list`.`applied_promocode_id` AS `applied_promocode_id`,`booking_list`.`add_to_wallet_by_promocode` AS `add_to_wallet_by_promocode`,`booking_list`.`add_to_wallet_by_promo_status` AS `add_to_wallet_by_promo_status`,`booking_list`.`invoice_date` AS `invoice_date`,`booking_list`.`invoice_number` AS `invoice_number`,`booking_list`.`vendor_id` AS `vendor_id`,`booking_list`.`vendor_name` AS `vendor_name`,`booking_list`.`vendor_mobile_no` AS `vendor_mobile_no`,`booking_list`.`vendor_lat` AS `vendor_lat`,`booking_list`.`vendor_long` AS `vendor_long`,`booking_list`.`vendor_address` AS `vendor_address`,`booking_list`.`country_id` AS `country_id`,`booking_list`.`country_name` AS `country_name`,`booking_list`.`country_code` AS `country_code`,`booking_list`.`currency_name` AS `currency_name`,`booking_list`.`currency_symbol` AS `currency_symbol`,`booking_list`.`vendor_image` AS `vendor_image`,`booking_list`.`cancellation_reason` AS `cancellation_reason`,`booking_list`.`cancelled_by_id` AS `cancelled_by_id`,`booking_list`.`cancelled_time` AS `cancelled_time`,`booking_list`.`booking_status` AS `booking_status`,`booking_list`.`online_transaction_id` AS `online_transaction_id`,(case when (`booking_list`.`booking_status` = 0) then 'Placed' when (`booking_list`.`booking_status` = 1) then 'Confirm' when (`booking_list`.`booking_status` = 2) then 'Pickup Boy Alloted' when (`booking_list`.`booking_status` = 3) then 'Order Picked Up' when (`booking_list`.`booking_status` = 4) then 'Received At Loundry' when (`booking_list`.`booking_status` = 5) then 'Inprocess' when (`booking_list`.`booking_status` = 6) then 'Order Ready' when (`booking_list`.`booking_status` = 7) then 'Allot For Drop' when (`booking_list`.`booking_status` = 8) then 'Delivred' when (`booking_list`.`booking_status` = 9) then 'Cancelled' else 'None' end) AS `book_status` from `booking_list`) ;
-- Updated above query to Below Query By Rajeev Gupta
CREATE VIEW `all_booking`  AS  (select `booking_list`.`id` AS `id`,`booking_list`.`user_id` AS `user_id`,`booking_list`.`user_name` AS `user_name`,`booking_list`.`user_mobile_no` AS `user_mobile_no`,`booking_list`.`user_email_id` AS `user_email_id`,`booking_list`.`delivery_lat` AS `delivery_lat`,`booking_list`.`delivery_long` AS `delivery_long`,`booking_list`.`delivery_address` AS `delivery_address`,`booking_list`.`delivery_address_id` AS `delivery_address_id`,`booking_list`.`pickup_date` AS `pickup_date`,`booking_list`.`pickup_time` AS `pickup_time`,`booking_list`.`pickup_time_slot_label` AS `pickup_time_slot_label`,`booking_list`.`pickup_time_org` AS `pickup_time_org`,`booking_list`.`placed_time` AS `placed_time`,`booking_list`.`confirm_time` AS `confirm_time`,`booking_list`.`allot_for_pickup_time` AS `allot_for_pickup_time`,`booking_list`.`picked_up_time` AS `picked_up_time`,`booking_list`.`received_at_loundry_time` AS `received_at_loundry_time`,`booking_list`.`in_process_time` AS `in_process_time`,`booking_list`.`order_ready_time` AS `order_ready_time`,`booking_list`.`allot_for_drop_time` AS `allot_for_drop_time`,`booking_list`.`drop_time` AS `drop_time`,`booking_list`.`pickup_otp` AS `pickup_otp`,`booking_list`.`drop_otp` AS `drop_otp`,`booking_list`.`total_item_price` AS `total_item_price`,`booking_list`.`tax_percent` AS `tax_percent`,`booking_list`.`tax_amt` AS `tax_amt`,`booking_list`.`total_amt` AS `total_amt`,`booking_list`.`paid_by_promo` AS `paid_by_promo`,`booking_list`.`paid_by_wallet` AS `paid_by_wallet`,`booking_list`.`paid_by_online` AS `paid_by_online`,`booking_list`.`paid_by_cash` AS `paid_by_cash`,`booking_list`.`skip_for_pay` AS `skip_for_pay`,`booking_list`.`pickup_boy_id` AS `pickup_boy_id`,`booking_list`.`pickup_boy_name` AS `pickup_boy_name`,`booking_list`.`pickup_boy_number` AS `pickup_boy_number`,`booking_list`.`drop_boy_id` AS `drop_boy_id`,`booking_list`.`drop_boy_name` AS `drop_boy_name`,`booking_list`.`drop_boy_number` AS `drop_boy_number`,`booking_list`.`applied_promocode` AS `applied_promocode`,`booking_list`.`applied_promocode_id` AS `applied_promocode_id`,`booking_list`.`add_to_wallet_by_promocode` AS `add_to_wallet_by_promocode`,`booking_list`.`add_to_wallet_by_promo_status` AS `add_to_wallet_by_promo_status`,`booking_list`.`invoice_date` AS `invoice_date`,`booking_list`.`invoice_number` AS `invoice_number`,`booking_list`.`vendor_id` AS `vendor_id`,`booking_list`.`vendor_name` AS `vendor_name`,`booking_list`.`vendor_mobile_no` AS `vendor_mobile_no`,`booking_list`.`vendor_lat` AS `vendor_lat`,`booking_list`.`vendor_long` AS `vendor_long`,`booking_list`.`vendor_address` AS `vendor_address`,`booking_list`.`country_id` AS `country_id`,`booking_list`.`country_name` AS `country_name`,`booking_list`.`country_code` AS `country_code`,`booking_list`.`currency_name` AS `currency_name`,`booking_list`.`currency_symbol` AS `currency_symbol`,`booking_list`.`vendor_image` AS `vendor_image`,`booking_list`.`cancellation_reason` AS `cancellation_reason`,`booking_list`.`cancelled_by_id` AS `cancelled_by_id`,`booking_list`.`cancelled_time` AS `cancelled_time`,`booking_list`.`booking_status` AS `booking_status`,`booking_list`.`online_transaction_id` AS `online_transaction_id`,(case when (`booking_list`.`booking_status` = 0) then 'Placed' when (`booking_list`.`booking_status` = 1) then 'Confirm' when (`booking_list`.`booking_status` = 2) then 'Pickup Boy Alloted' when (`booking_list`.`booking_status` = 3) then 'Order Picked Up' when (`booking_list`.`booking_status` = 4) then 'Received At Loundry' when (`booking_list`.`booking_status` = 5) then 'Inprocess' when (`booking_list`.`booking_status` = 6) then 'Order Ready' when (`booking_list`.`booking_status` = 7) then 'Allot For Drop' when (`booking_list`.`booking_status` = 8) then 'Delivred' when (`booking_list`.`booking_status` = 9) then 'Cancelled' else 'None' end) AS `book_status` from `booking_list`) ;
--
-- Indexes for dumped tables
--

--
-- Indexes for table `addon_charges_in_booking`
--
ALTER TABLE `addon_charges_in_booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `address_list`
--
ALTER TABLE `address_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_list`
--
ALTER TABLE `booking_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_booking` (`user_id`),
  ADD KEY `vendor_id_booking` (`vendor_id`),
  ADD KEY `pickup_boy_id_booking` (`pickup_boy_id`),
  ADD KEY `drop_boy_id_booking` (`drop_boy_id`);

--
-- Indexes for table `booking_list_item`
--
ALTER TABLE `booking_list_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_id_item_list` (`booking_id`),
  ADD KEY `category_id_bk_item_list` (`category_id`),
  ADD KEY `item_id_bk_item_list` (`item_id`),
  ADD KEY `unit_id_bk_item_list` (`unit_id`),
  ADD KEY `country_id_bk_item_list` (`country_id`);

--
-- Indexes for table `booking_status`
--
ALTER TABLE `booking_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country_list`
--
ALTER TABLE `country_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `day_list`
--
ALTER TABLE `day_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `increase_decrease`
--
ALTER TABLE `increase_decrease`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loundry_banner`
--
ALTER TABLE `loundry_banner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id_banner` (`vendor_id`);

--
-- Indexes for table `loundry_day_list`
--
ALTER TABLE `loundry_day_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `day_id` (`day_id`),
  ADD KEY `vendor_id_day_list` (`vendor_id`);

--
-- Indexes for table `loundry_item_list`
--
ALTER TABLE `loundry_item_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id_item_list` (`vendor_id`),
  ADD KEY `category_id_item_list` (`category_id`),
  ADD KEY `unit_id_item_list` (`unit_id`),
  ADD KEY `country_id_item_list` (`country_id`);

--
-- Indexes for table `loundry_list`
--
ALTER TABLE `loundry_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_Id_loundry_list` (`country_id`);

--
-- Indexes for table `loundry_time_list`
--
ALTER TABLE `loundry_time_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`),
  ADD KEY `loundry_day_id` (`day_id`);

--
-- Indexes for table `other_details`
--
ALTER TABLE `other_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rider_listing`
--
ALTER TABLE `rider_listing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rider_listing_vendor_id` (`vendor_id`);

--
-- Indexes for table `support`
--
ALTER TABLE `support`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unit_table`
--
ALTER TABLE `unit_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_transaction_partner`
--
ALTER TABLE `wallet_transaction_partner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id_w_t_p` (`vendor_id`);

--
-- Indexes for table `wallet_transaction_rider`
--
ALTER TABLE `wallet_transaction_rider`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rider_id_w_t_r` (`rider_id`);

--
-- Indexes for table `wallet_transaction_user`
--
ALTER TABLE `wallet_transaction_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_wt` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addon_charges_in_booking`
--
ALTER TABLE `addon_charges_in_booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `address_list`
--
ALTER TABLE `address_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT for table `booking_list`
--
ALTER TABLE `booking_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `booking_list_item`
--
ALTER TABLE `booking_list_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=562;

--
-- AUTO_INCREMENT for table `booking_status`
--
ALTER TABLE `booking_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `country_list`
--
ALTER TABLE `country_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `day_list`
--
ALTER TABLE `day_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `increase_decrease`
--
ALTER TABLE `increase_decrease`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `loundry_banner`
--
ALTER TABLE `loundry_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `loundry_day_list`
--
ALTER TABLE `loundry_day_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `loundry_item_list`
--
ALTER TABLE `loundry_item_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `loundry_list`
--
ALTER TABLE `loundry_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `loundry_time_list`
--
ALTER TABLE `loundry_time_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `other_details`
--
ALTER TABLE `other_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rider_listing`
--
ALTER TABLE `rider_listing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `support`
--
ALTER TABLE `support`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `unit_table`
--
ALTER TABLE `unit_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `wallet_transaction_partner`
--
ALTER TABLE `wallet_transaction_partner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `wallet_transaction_rider`
--
ALTER TABLE `wallet_transaction_rider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `wallet_transaction_user`
--
ALTER TABLE `wallet_transaction_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking_list`
--
ALTER TABLE `booking_list`
  ADD CONSTRAINT `user_id_booking` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`id`),
  ADD CONSTRAINT `vendor_id_booking` FOREIGN KEY (`vendor_id`) REFERENCES `loundry_list` (`id`);

--
-- Constraints for table `booking_list_item`
--
ALTER TABLE `booking_list_item`
  ADD CONSTRAINT `booking_id_item_list` FOREIGN KEY (`booking_id`) REFERENCES `booking_list` (`id`),
  ADD CONSTRAINT `category_id_bk_item_list` FOREIGN KEY (`category_id`) REFERENCES `country_list` (`id`),
  ADD CONSTRAINT `country_id_bk_item_list` FOREIGN KEY (`country_id`) REFERENCES `unit_table` (`id`),
  ADD CONSTRAINT `item_id_bk_item_list` FOREIGN KEY (`item_id`) REFERENCES `loundry_item_list` (`id`),
  ADD CONSTRAINT `unit_id_bk_item_list` FOREIGN KEY (`unit_id`) REFERENCES `unit_table` (`id`);

--
-- Constraints for table `loundry_banner`
--
ALTER TABLE `loundry_banner`
  ADD CONSTRAINT `vendor_id_banner` FOREIGN KEY (`vendor_id`) REFERENCES `loundry_list` (`id`);

--
-- Constraints for table `loundry_day_list`
--
ALTER TABLE `loundry_day_list`
  ADD CONSTRAINT `day_id` FOREIGN KEY (`day_id`) REFERENCES `day_list` (`id`),
  ADD CONSTRAINT `loundry_day_list_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `loundry_list` (`id`),
  ADD CONSTRAINT `vendor_id` FOREIGN KEY (`vendor_id`) REFERENCES `loundry_list` (`id`),
  ADD CONSTRAINT `vendor_id_day_list` FOREIGN KEY (`vendor_id`) REFERENCES `loundry_list` (`id`);

--
-- Constraints for table `loundry_item_list`
--
ALTER TABLE `loundry_item_list`
  ADD CONSTRAINT `category_id_item_list` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `country_id_item_list` FOREIGN KEY (`country_id`) REFERENCES `country_list` (`id`),
  ADD CONSTRAINT `unit_id_item_list` FOREIGN KEY (`unit_id`) REFERENCES `unit_table` (`id`),
  ADD CONSTRAINT `vendor_id_item_list` FOREIGN KEY (`vendor_id`) REFERENCES `loundry_list` (`id`);

--
-- Constraints for table `loundry_list`
--
ALTER TABLE `loundry_list`
  ADD CONSTRAINT `country_Id_loundry_list` FOREIGN KEY (`country_id`) REFERENCES `country_list` (`id`);

--
-- Constraints for table `loundry_time_list`
--
ALTER TABLE `loundry_time_list`
  ADD CONSTRAINT `loundry_day_id` FOREIGN KEY (`day_id`) REFERENCES `loundry_day_list` (`id`),
  ADD CONSTRAINT `loundry_time_list_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `loundry_list` (`id`);

--
-- Constraints for table `rider_listing`
--
ALTER TABLE `rider_listing`
  ADD CONSTRAINT `rider_listing_vendor_id` FOREIGN KEY (`vendor_id`) REFERENCES `loundry_list` (`id`);

--
-- Constraints for table `wallet_transaction_partner`
--
ALTER TABLE `wallet_transaction_partner`
  ADD CONSTRAINT `vendor_id_w_t_p` FOREIGN KEY (`vendor_id`) REFERENCES `loundry_list` (`id`);

--
-- Constraints for table `wallet_transaction_rider`
--
ALTER TABLE `wallet_transaction_rider`
  ADD CONSTRAINT `rider_id_w_t_r` FOREIGN KEY (`rider_id`) REFERENCES `rider_listing` (`id`);

--
-- Constraints for table `wallet_transaction_user`
--
ALTER TABLE `wallet_transaction_user`
  ADD CONSTRAINT `user_id_wt` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`id`);
COMMIT;
SET foreign_key_checks = 0;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
