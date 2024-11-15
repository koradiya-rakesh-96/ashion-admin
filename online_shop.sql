-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 22, 2024 at 11:40 AM
-- Server version: 5.7.40
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
CREATE TABLE IF NOT EXISTS `brands` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Puma', 'puma', 1, '2024-02-15 10:20:50', '2024-02-15 10:20:50'),
(2, 'Boat', 'boat', 1, '2024-02-15 10:21:02', '2024-02-15 10:21:02'),
(3, 'Dell', 'dell', 1, '2024-02-19 10:55:58', '2024-02-19 10:55:58'),
(4, 'HP', 'hp', 1, '2024-02-19 10:56:11', '2024-02-19 10:56:11'),
(5, 'Nike', 'nike', 1, '2024-02-20 08:35:12', '2024-02-20 08:35:12');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `showHome` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `status`, `showHome`, `created_at`, `updated_at`) VALUES
(1, 'Shoes', 'shoes', '1.jpg', 1, 'Yes', '2024-02-15 10:19:11', '2024-02-19 08:11:16'),
(2, 'Watch', 'watch', '2-1710822108.jpg', 1, 'Yes', '2024-02-15 10:19:34', '2024-03-19 04:21:48'),
(3, 'Men\'s', 'mens', '3.png', 1, 'Yes', '2024-02-16 11:13:52', '2024-02-16 11:13:52'),
(4, 'Women\'s', 'womens', '4.jpg', 1, 'Yes', '2024-02-19 07:52:27', '2024-02-19 07:52:27'),
(5, 'Laptop', 'laptop', '5-1708338444.jpg', 1, 'Yes', '2024-02-19 10:10:05', '2024-02-19 10:27:24'),
(6, 'Home Decorate', 'home-decorate', '6.jpg', 1, 'No', '2024-04-11 07:46:24', '2024-04-11 07:46:24');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(1, 'Rupesh Jadhav', 'rupesh@user.com', 'Test Subject', 'This is test message by Rupesh Jadhav Please ignore it.', '2024-03-08 05:19:01', '2024-03-08 05:19:01');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=243 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'United States', 'US', NULL, NULL),
(2, 'Canada', 'CA', NULL, NULL),
(3, 'Afghanistan', 'AF', NULL, NULL),
(4, 'Albania', 'AL', NULL, NULL),
(5, 'Algeria', 'DZ', NULL, NULL),
(6, 'American Samoa', 'AS', NULL, NULL),
(7, 'Andorra', 'AD', NULL, NULL),
(8, 'Angola', 'AO', NULL, NULL),
(9, 'Anguilla', 'AI', NULL, NULL),
(10, 'Antarctica', 'AQ', NULL, NULL),
(11, 'Antigua and/or Barbuda', 'AG', NULL, NULL),
(12, 'Argentina', 'AR', NULL, NULL),
(13, 'Armenia', 'AM', NULL, NULL),
(14, 'Aruba', 'AW', NULL, NULL),
(15, 'Australia', 'AU', NULL, NULL),
(16, 'Austria', 'AT', NULL, NULL),
(17, 'Azerbaijan', 'AZ', NULL, NULL),
(18, 'Bahamas', 'BS', NULL, NULL),
(19, 'Bahrain', 'BH', NULL, NULL),
(20, 'Bangladesh', 'BD', NULL, NULL),
(21, 'Barbados', 'BB', NULL, NULL),
(22, 'Belarus', 'BY', NULL, NULL),
(23, 'Belgium', 'BE', NULL, NULL),
(24, 'Belize', 'BZ', NULL, NULL),
(25, 'Benin', 'BJ', NULL, NULL),
(26, 'Bermuda', 'BM', NULL, NULL),
(27, 'Bhutan', 'BT', NULL, NULL),
(28, 'Bolivia', 'BO', NULL, NULL),
(29, 'Bosnia and Herzegovina', 'BA', NULL, NULL),
(30, 'Botswana', 'BW', NULL, NULL),
(31, 'Bouvet Island', 'BV', NULL, NULL),
(32, 'Brazil', 'BR', NULL, NULL),
(33, 'British lndian Ocean Territory', 'IO', NULL, NULL),
(34, 'Brunei Darussalam', 'BN', NULL, NULL),
(35, 'Bulgaria', 'BG', NULL, NULL),
(36, 'Burkina Faso', 'BF', NULL, NULL),
(37, 'Burundi', 'BI', NULL, NULL),
(38, 'Cambodia', 'KH', NULL, NULL),
(39, 'Cameroon', 'CM', NULL, NULL),
(40, 'Cape Verde', 'CV', NULL, NULL),
(41, 'Cayman Islands', 'KY', NULL, NULL),
(42, 'Central African Republic', 'CF', NULL, NULL),
(43, 'Chad', 'TD', NULL, NULL),
(44, 'Chile', 'CL', NULL, NULL),
(45, 'China', 'CN', NULL, NULL),
(46, 'Christmas Island', 'CX', NULL, NULL),
(47, 'Cocos (Keeling) Islands', 'CC', NULL, NULL),
(48, 'Colombia', 'CO', NULL, NULL),
(49, 'Comoros', 'KM', NULL, NULL),
(50, 'Congo', 'CG', NULL, NULL),
(51, 'Cook Islands', 'CK', NULL, NULL),
(52, 'Costa Rica', 'CR', NULL, NULL),
(53, 'Croatia (Hrvatska)', 'HR', NULL, NULL),
(54, 'Cuba', 'CU', NULL, NULL),
(55, 'Cyprus', 'CY', NULL, NULL),
(56, 'Czech Republic', 'CZ', NULL, NULL),
(57, 'Democratic Republic of Congo', 'CD', NULL, NULL),
(58, 'Denmark', 'DK', NULL, NULL),
(59, 'Djibouti', 'DJ', NULL, NULL),
(60, 'Dominica', 'DM', NULL, NULL),
(61, 'Dominican Republic', 'DO', NULL, NULL),
(62, 'East Timor', 'TP', NULL, NULL),
(63, 'Ecudaor', 'EC', NULL, NULL),
(64, 'Egypt', 'EG', NULL, NULL),
(65, 'El Salvador', 'SV', NULL, NULL),
(66, 'Equatorial Guinea', 'GQ', NULL, NULL),
(67, 'Eritrea', 'ER', NULL, NULL),
(68, 'Estonia', 'EE', NULL, NULL),
(69, 'Ethiopia', 'ET', NULL, NULL),
(70, 'Falkland Islands (Malvinas)', 'FK', NULL, NULL),
(71, 'Faroe Islands', 'FO', NULL, NULL),
(72, 'Fiji', 'FJ', NULL, NULL),
(73, 'Finland', 'FI', NULL, NULL),
(74, 'France', 'FR', NULL, NULL),
(75, 'France, Metropolitan', 'FX', NULL, NULL),
(76, 'French Guiana', 'GF', NULL, NULL),
(77, 'French Polynesia', 'PF', NULL, NULL),
(78, 'French Southern Territories', 'TF', NULL, NULL),
(79, 'Gabon', 'GA', NULL, NULL),
(80, 'Gambia', 'GM', NULL, NULL),
(81, 'Georgia', 'GE', NULL, NULL),
(82, 'Germany', 'DE', NULL, NULL),
(83, 'Ghana', 'GH', NULL, NULL),
(84, 'Gibraltar', 'GI', NULL, NULL),
(85, 'Greece', 'GR', NULL, NULL),
(86, 'Greenland', 'GL', NULL, NULL),
(87, 'Grenada', 'GD', NULL, NULL),
(88, 'Guadeloupe', 'GP', NULL, NULL),
(89, 'Guam', 'GU', NULL, NULL),
(90, 'Guatemala', 'GT', NULL, NULL),
(91, 'Guinea', 'GN', NULL, NULL),
(92, 'Guinea-Bissau', 'GW', NULL, NULL),
(93, 'Guyana', 'GY', NULL, NULL),
(94, 'Haiti', 'HT', NULL, NULL),
(95, 'Heard and Mc Donald Islands', 'HM', NULL, NULL),
(96, 'Honduras', 'HN', NULL, NULL),
(97, 'Hong Kong', 'HK', NULL, NULL),
(98, 'Hungary', 'HU', NULL, NULL),
(99, 'Iceland', 'IS', NULL, NULL),
(100, 'India', 'IN', NULL, NULL),
(101, 'Indonesia', 'ID', NULL, NULL),
(102, 'Iran (Islamic Republic of)', 'IR', NULL, NULL),
(103, 'Iraq', 'IQ', NULL, NULL),
(104, 'Ireland', 'IE', NULL, NULL),
(105, 'Israel', 'IL', NULL, NULL),
(106, 'Italy', 'IT', NULL, NULL),
(107, 'Ivory Coast', 'CI', NULL, NULL),
(108, 'Jamaica', 'JM', NULL, NULL),
(109, 'Japan', 'JP', NULL, NULL),
(110, 'Jordan', 'JO', NULL, NULL),
(111, 'Kazakhstan', 'KZ', NULL, NULL),
(112, 'Kenya', 'KE', NULL, NULL),
(113, 'Kiribati', 'KI', NULL, NULL),
(114, 'Korea, Democratic People\'s Republic of', 'KP', NULL, NULL),
(115, 'Korea, Republic of', 'KR', NULL, NULL),
(116, 'Kuwait', 'KW', NULL, NULL),
(117, 'Kyrgyzstan', 'KG', NULL, NULL),
(118, 'Lao People\'s Democratic Republic', 'LA', NULL, NULL),
(119, 'Latvia', 'LV', NULL, NULL),
(120, 'Lebanon', 'LB', NULL, NULL),
(121, 'Lesotho', 'LS', NULL, NULL),
(122, 'Liberia', 'LR', NULL, NULL),
(123, 'Libyan Arab Jamahiriya', 'LY', NULL, NULL),
(124, 'Liechtenstein', 'LI', NULL, NULL),
(125, 'Lithuania', 'LT', NULL, NULL),
(126, 'Luxembourg', 'LU', NULL, NULL),
(127, 'Macau', 'MO', NULL, NULL),
(128, 'Macedonia', 'MK', NULL, NULL),
(129, 'Madagascar', 'MG', NULL, NULL),
(130, 'Malawi', 'MW', NULL, NULL),
(131, 'Malaysia', 'MY', NULL, NULL),
(132, 'Maldives', 'MV', NULL, NULL),
(133, 'Mali', 'ML', NULL, NULL),
(134, 'Malta', 'MT', NULL, NULL),
(135, 'Marshall Islands', 'MH', NULL, NULL),
(136, 'Martinique', 'MQ', NULL, NULL),
(137, 'Mauritania', 'MR', NULL, NULL),
(138, 'Mauritius', 'MU', NULL, NULL),
(139, 'Mayotte', 'TY', NULL, NULL),
(140, 'Mexico', 'MX', NULL, NULL),
(141, 'Micronesia, Federated States of', 'FM', NULL, NULL),
(142, 'Moldova, Republic of', 'MD', NULL, NULL),
(143, 'Monaco', 'MC', NULL, NULL),
(144, 'Mongolia', 'MN', NULL, NULL),
(145, 'Montserrat', 'MS', NULL, NULL),
(146, 'Morocco', 'MA', NULL, NULL),
(147, 'Mozambique', 'MZ', NULL, NULL),
(148, 'Myanmar', 'MM', NULL, NULL),
(149, 'Namibia', 'NA', NULL, NULL),
(150, 'Nauru', 'NR', NULL, NULL),
(151, 'Nepal', 'NP', NULL, NULL),
(152, 'Netherlands', 'NL', NULL, NULL),
(153, 'Netherlands Antilles', 'AN', NULL, NULL),
(154, 'New Caledonia', 'NC', NULL, NULL),
(155, 'New Zealand', 'NZ', NULL, NULL),
(156, 'Nicaragua', 'NI', NULL, NULL),
(157, 'Niger', 'NE', NULL, NULL),
(158, 'Nigeria', 'NG', NULL, NULL),
(159, 'Niue', 'NU', NULL, NULL),
(160, 'Norfork Island', 'NF', NULL, NULL),
(161, 'Northern Mariana Islands', 'MP', NULL, NULL),
(162, 'Norway', 'NO', NULL, NULL),
(163, 'Oman', 'OM', NULL, NULL),
(164, 'Pakistan', 'PK', NULL, NULL),
(165, 'Palau', 'PW', NULL, NULL),
(166, 'Panama', 'PA', NULL, NULL),
(167, 'Papua New Guinea', 'PG', NULL, NULL),
(168, 'Paraguay', 'PY', NULL, NULL),
(169, 'Peru', 'PE', NULL, NULL),
(170, 'Philippines', 'PH', NULL, NULL),
(171, 'Pitcairn', 'PN', NULL, NULL),
(172, 'Poland', 'PL', NULL, NULL),
(173, 'Portugal', 'PT', NULL, NULL),
(174, 'Puerto Rico', 'PR', NULL, NULL),
(175, 'Qatar', 'QA', NULL, NULL),
(176, 'Republic of South Sudan', 'SS', NULL, NULL),
(177, 'Reunion', 'RE', NULL, NULL),
(178, 'Romania', 'RO', NULL, NULL),
(179, 'Russian Federation', 'RU', NULL, NULL),
(180, 'Rwanda', 'RW', NULL, NULL),
(181, 'Saint Kitts and Nevis', 'KN', NULL, NULL),
(182, 'Saint Lucia', 'LC', NULL, NULL),
(183, 'Saint Vincent and the Grenadines', 'VC', NULL, NULL),
(184, 'Samoa', 'WS', NULL, NULL),
(185, 'San Marino', 'SM', NULL, NULL),
(186, 'Sao Tome and Principe', 'ST', NULL, NULL),
(187, 'Saudi Arabia', 'SA', NULL, NULL),
(188, 'Senegal', 'SN', NULL, NULL),
(189, 'Serbia', 'RS', NULL, NULL),
(190, 'Seychelles', 'SC', NULL, NULL),
(191, 'Sierra Leone', 'SL', NULL, NULL),
(192, 'Singapore', 'SG', NULL, NULL),
(193, 'Slovakia', 'SK', NULL, NULL),
(194, 'Slovenia', 'SI', NULL, NULL),
(195, 'Solomon Islands', 'SB', NULL, NULL),
(196, 'Somalia', 'SO', NULL, NULL),
(197, 'South Africa', 'ZA', NULL, NULL),
(198, 'South Georgia South Sandwich Islands', 'GS', NULL, NULL),
(199, 'Spain', 'ES', NULL, NULL),
(200, 'Sri Lanka', 'LK', NULL, NULL),
(201, 'St. Helena', 'SH', NULL, NULL),
(202, 'St. Pierre and Miquelon', 'PM', NULL, NULL),
(203, 'Sudan', 'SD', NULL, NULL),
(204, 'Suriname', 'SR', NULL, NULL),
(205, 'Svalbarn and Jan Mayen Islands', 'SJ', NULL, NULL),
(206, 'Swaziland', 'SZ', NULL, NULL),
(207, 'Sweden', 'SE', NULL, NULL),
(208, 'Switzerland', 'CH', NULL, NULL),
(209, 'Syrian Arab Republic', 'SY', NULL, NULL),
(210, 'Taiwan', 'TW', NULL, NULL),
(211, 'Tajikistan', 'TJ', NULL, NULL),
(212, 'Tanzania, United Republic of', 'TZ', NULL, NULL),
(213, 'Thailand', 'TH', NULL, NULL),
(214, 'Togo', 'TG', NULL, NULL),
(215, 'Tokelau', 'TK', NULL, NULL),
(216, 'Tonga', 'TO', NULL, NULL),
(217, 'Trinidad and Tobago', 'TT', NULL, NULL),
(218, 'Tunisia', 'TN', NULL, NULL),
(219, 'Turkey', 'TR', NULL, NULL),
(220, 'Turkmenistan', 'TM', NULL, NULL),
(221, 'Turks and Caicos Islands', 'TC', NULL, NULL),
(222, 'Tuvalu', 'TV', NULL, NULL),
(223, 'Uganda', 'UG', NULL, NULL),
(224, 'Ukraine', 'UA', NULL, NULL),
(225, 'United Arab Emirates', 'AE', NULL, NULL),
(226, 'United Kingdom', 'GB', NULL, NULL),
(227, 'United States minor outlying islands', 'UM', NULL, NULL),
(228, 'Uruguay', 'UY', NULL, NULL),
(229, 'Uzbekistan', 'UZ', NULL, NULL),
(230, 'Vanuatu', 'VU', NULL, NULL),
(231, 'Vatican City State', 'VA', NULL, NULL),
(232, 'Venezuela', 'VE', NULL, NULL),
(233, 'Vietnam', 'VN', NULL, NULL),
(234, 'Virgin Islands (British)', 'VG', NULL, NULL),
(235, 'Virgin Islands (U.S.)', 'VI', NULL, NULL),
(236, 'Wallis and Futuna Islands', 'WF', NULL, NULL),
(237, 'Western Sahara', 'EH', NULL, NULL),
(238, 'Yemen', 'YE', NULL, NULL),
(239, 'Yugoslavia', 'YU', NULL, NULL),
(240, 'Zaire', 'ZR', NULL, NULL),
(241, 'Zambia', 'ZM', NULL, NULL),
(242, 'Zimbabwe', 'ZW', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_addresses`
--

DROP TABLE IF EXISTS `customer_addresses`;
CREATE TABLE IF NOT EXISTS `customer_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `apartment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_addresses_user_id_foreign` (`user_id`),
  KEY `customer_addresses_country_id_foreign` (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_addresses`
--

INSERT INTO `customer_addresses` (`id`, `user_id`, `first_name`, `last_name`, `email`, `mobile`, `country_id`, `address`, `apartment`, `city`, `state`, `zip`, `notes`, `created_at`, `updated_at`) VALUES
(1, 3, 'Rupesh', 'Jadhav', 'rupesh@test.com', '7803124569', 100, 'Ahmedabad Gujarat', '2363', 'Ahmedabad', 'Gujarat', '380001', NULL, '2024-02-23 07:45:45', '2024-02-23 07:45:45'),
(2, 2, 'Ashish', 'Patel', 'rupesh@user.com', '7803245169', 100, 'Mumbai , India', '14/08', 'Mumbai', 'Maharastra', '2002', NULL, '2024-02-26 07:37:06', '2024-04-15 06:03:12'),
(3, 4, 'Mr.', 'Jadhav', 'test@yop.com', '7530142689', 100, 'Shahibaug, Ahmedabad', NULL, 'Ahmedabad', 'Gujarat', '380014', NULL, '2024-02-28 07:43:15', '2024-03-11 11:01:41'),
(5, 6, 'Test', 'yomail', 'test@yomail.com', '4023516978', 226, '49 Featherstone Street', NULL, 'LONDON', 'England', 'EC1A 1AL', NULL, '2024-03-07 03:39:11', '2024-03-07 03:39:11');

-- --------------------------------------------------------

--
-- Table structure for table `discount_coupons`
--

DROP TABLE IF EXISTS `discount_coupons`;
CREATE TABLE IF NOT EXISTS `discount_coupons` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `max_uses` int(11) DEFAULT NULL,
  `max_uses_user` int(11) DEFAULT NULL,
  `type` enum('percent','fixed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `discount_amount` double(10,2) NOT NULL,
  `min_amount` double(10,2) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `starts_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discount_coupons`
--

INSERT INTO `discount_coupons` (`id`, `code`, `name`, `description`, `max_uses`, `max_uses_user`, `type`, `discount_amount`, `min_amount`, `status`, `starts_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'IND50', '250 RS Discount Code', '250 Rupees Discount Coupon Code', 20, 1, 'fixed', 250.00, 600.00, 1, '2024-02-27 09:23:28', '2024-06-30 09:23:35', '2024-02-26 09:24:16', '2024-04-11 08:04:23'),
(2, 'IND30', '20% Discount', '20% Discount Amount', 10, 2, 'percent', 20.00, 800.00, 1, '2024-02-26 09:44:51', '2024-06-28 09:44:57', '2024-02-26 09:45:17', '2024-04-08 05:48:08');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_02_06_081923_alter_users_table', 2),
(6, '2024_02_06_103818_create_categories_table', 3),
(7, '2024_02_07_092519_create_temp_images_table', 4),
(8, '2024_02_08_090414_create_sub_categories_table', 5),
(9, '2024_02_09_074202_create_brands_table', 6),
(10, '2024_02_09_095813_create_products_table', 7),
(11, '2024_02_09_095904_create_products_images_table', 7),
(12, '2024_02_16_163351_alter_categories_table', 8),
(13, '2024_02_19_125941_alter_products_table', 9),
(14, '2024_02_19_131014_alter_sub_categories_table', 10),
(15, '2024_02_20_152136_alter_products_table', 11),
(16, '2024_02_22_125402_alter_users_table', 12),
(17, '2024_02_22_151500_create_countries_table', 13),
(18, '2024_02_22_154814_create_orders_table', 14),
(19, '2024_02_22_154840_create_orders_items_table', 14),
(20, '2024_02_22_154925_create_customer_addresses_table', 14),
(21, '2024_02_22_160559_alter_customer_addresses_table', 15),
(22, '2024_02_22_161031_create_customer_addresses_table', 16),
(23, '2024_02_23_131929_create_shipping_charges_table', 17),
(24, '2024_02_26_130855_create_discount_coupons_table', 18),
(25, '2024_02_27_154426_alter_orders_table', 19),
(26, '2024_02_28_101329_alter_orders_table', 20),
(27, '2024_02_28_141644_create_wishlists_table', 21),
(28, '2024_02_29_112827_alter_users_table', 22),
(29, '2024_02_29_140956_create_pages_table', 23),
(30, '2024_03_01_152746_create_product_ratings_table', 24),
(31, '2024_03_08_103906_create_contact_table', 25);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subtotal` double(10,2) NOT NULL,
  `shipping` double(10,2) NOT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code_id` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` double(10,2) DEFAULT NULL,
  `grand_total` double(10,2) NOT NULL,
  `payment_status` enum('paid','not paid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'not paid',
  `payment_mode` enum('cod','card') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','shipped','delivered','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `shipped_date` timestamp NULL DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `apartment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_country_id_foreign` (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `subtotal`, `shipping`, `coupon_code`, `coupon_code_id`, `discount`, `grand_total`, `payment_status`, `payment_mode`, `status`, `shipped_date`, `first_name`, `last_name`, `email`, `mobile`, `country_id`, `address`, `apartment`, `city`, `state`, `zip`, `notes`, `created_at`, `updated_at`) VALUES
(1, 3, 2700.00, 0.00, NULL, NULL, NULL, 2700.00, 'not paid', 'cod', 'cancelled', NULL, 'Rupesh', 'Jadhav', 'rupesh@test.com', '7803124569', 100, 'Ahmedabad Gujarat', '2363', 'Ahmedabad', 'Gujarat', '380001', 'Please make order as soon as possible', '2024-02-23 07:45:45', '2024-02-28 05:32:04'),
(2, 3, 600.00, 300.00, NULL, NULL, NULL, 900.00, 'paid', 'cod', 'delivered', '2024-03-05 10:35:03', 'Rupesh', 'Jadhav', 'rupesh@test.com', '7803124569', 100, 'Ahmedabad Gujarat', '2363', 'Ahmedabad', 'Gujarat', '380001', 'I Hope I Receive This Order Quickly', '2024-02-26 07:22:33', '2024-03-07 10:35:09'),
(3, 2, 2500.00, 300.00, NULL, NULL, NULL, 2800.00, 'paid', 'cod', 'delivered', NULL, 'User', 'Name', 'rupesh@user.com', '7803245169', 100, 'Mumbai , India', '14/08', 'Mumbai', 'Maharastra', '2002', NULL, '2024-02-26 07:37:06', '2024-02-26 07:37:06'),
(4, 2, 1300.00, 300.00, NULL, NULL, NULL, 1600.00, 'paid', 'cod', 'delivered', NULL, 'User', 'Name', 'rupesh@user.com', '7803245169', 100, 'Mumbai , India', '14/08', 'Mumbai', 'Maharastra', '2002', NULL, '2024-02-26 11:00:10', '2024-03-07 10:35:31'),
(5, 2, 600.00, 70.00, 'IND30', '2', 120.00, 550.00, 'paid', 'cod', 'delivered', '2024-02-29 09:54:58', 'User', 'Name', 'rupesh@user.com', '7803245169', 100, 'Mumbai , India', '14/08', 'Mumbai', 'Maharastra', '2002', NULL, '2024-02-27 08:31:20', '2024-03-01 09:55:08'),
(6, 2, 3500.00, 70.00, '', '', 0.00, 3570.00, 'paid', 'cod', 'delivered', '2024-02-28 05:13:18', 'User', 'Name', 'rupesh@user.com', '7803245169', 100, 'Mumbai , India', '14/08', 'Mumbai', 'Maharastra', '2002', NULL, '2024-02-27 08:43:13', '2024-03-07 09:07:41'),
(7, 3, 2700.00, 70.00, 'IND30', '2', 540.00, 2230.00, 'not paid', 'cod', 'shipped', '2024-03-07 09:07:17', 'Rupesh', 'Jadhav', 'rupesh@test.com', '7803124569', 100, 'Ahmedabad Gujarat', '2363', 'Ahmedabad', 'Gujarat', '380001', NULL, '2024-02-28 04:13:47', '2024-03-07 09:07:21'),
(8, 4, 3400.00, 70.00, 'IND30', '2', 680.00, 2790.00, 'paid', 'cod', 'delivered', '2024-03-01 09:55:31', 'Mr.', 'Jadhav', 'rcjadhav@gmail', '7530142689', 100, 'Shahibaug, Ahmedabad', NULL, 'Ahmedabad', 'Gujarat', '380014', 'Call Me When You Reach Shahibaug.', '2024-02-28 07:43:15', '2024-03-07 09:08:03'),
(9, 2, 3500.00, 70.00, 'IND30', '2', 700.00, 2870.00, 'paid', 'cod', 'delivered', '2024-03-06 10:21:34', 'User', 'Name', 'rupesh@user.com', '7803245169', 100, 'Mumbai , India', '14/08', 'Mumbai', 'Maharastra', '2002', NULL, '2024-02-28 11:16:05', '2024-03-06 10:26:28'),
(10, 4, 600.00, 70.00, 'IND50', '1', 250.00, 420.00, 'paid', 'card', 'cancelled', NULL, 'Mr.', 'Jadhav', 'rcjadhav@gmail', '7530142689', 100, 'Shahibaug, Ahmedabad', NULL, 'Ahmedabad', 'Gujarat', '380014', NULL, '2024-03-06 06:28:37', '2024-03-11 10:59:18'),
(11, 4, 850.00, 70.00, '', '', 0.00, 920.00, 'not paid', 'cod', 'cancelled', NULL, 'Mr.', 'Jadhav', 'rcjadhav@gmail', '7530142689', 100, 'Shahibaug, Ahmedabad', NULL, 'Ahmedabad', 'Gujarat', '380014', NULL, '2024-03-06 08:08:07', '2024-03-06 10:07:56'),
(12, 4, 500.00, 70.00, '', '', 0.00, 570.00, 'paid', 'card', 'pending', NULL, 'Mr.', 'Jadhav', 'rcjadhav@gmail', '7530142689', 100, 'Shahibaug, Ahmedabad', NULL, 'Ahmedabad', 'Gujarat', '380014', NULL, '2024-03-06 08:24:23', '2024-03-06 08:24:23'),
(13, 6, 1600.00, 150.00, 'IND30', '2', 320.00, 1430.00, 'not paid', 'cod', 'pending', NULL, 'Test', 'yomail', 'test@yomail.com', '4023516978', 15, 'NSW, Australia', '007', 'NSW', 'Sydney', '2002', NULL, '2024-03-07 03:27:45', '2024-03-07 03:27:45'),
(14, 6, 999.00, 150.00, 'IND30', '2', 199.80, 949.20, 'paid', 'card', 'pending', NULL, 'Test', 'yomail', 'test@yomail.com', '4023516978', 226, '49 Featherstone Street', NULL, 'LONDON', 'England', 'EC1A 1AL', NULL, '2024-03-07 03:39:13', '2024-03-07 03:39:13'),
(15, 2, 2700.00, 70.00, '', '', 0.00, 2770.00, 'not paid', 'cod', 'pending', NULL, 'Ashish', 'Patel', 'rupesh@user.com', '7803245169', 100, 'Mumbai , India', '14/08', 'Mumbai', 'Maharastra', '2002', NULL, '2024-04-15 06:03:12', '2024-04-15 06:03:12');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `price` double(10,2) NOT NULL,
  `total` double(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_items_order_id_foreign` (`order_id`),
  KEY `orders_items_product_id_foreign` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `name`, `qty`, `price`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 19, 'Sport shoes by woodland', 1, 2700.00, 2700.00, '2024-02-23 07:45:46', '2024-02-23 07:45:46'),
(2, 2, 11, 'Casual shoes', 1, 600.00, 600.00, '2024-02-26 07:22:33', '2024-02-26 07:22:33'),
(3, 3, 2, 'Boat Smart Watch', 1, 2500.00, 2500.00, '2024-02-26 07:37:06', '2024-02-26 07:37:06'),
(4, 4, 13, 'White Hill Top Shoes', 1, 1300.00, 1300.00, '2024-02-26 11:00:10', '2024-02-26 11:00:10'),
(5, 5, 11, 'Casual shoes', 1, 600.00, 600.00, '2024-02-27 08:31:20', '2024-02-27 08:31:20'),
(6, 6, 3, 'Rado Watch', 1, 3500.00, 3500.00, '2024-02-27 08:43:13', '2024-02-27 08:43:13'),
(7, 7, 11, 'Casual shoes', 2, 600.00, 1200.00, '2024-02-28 04:13:47', '2024-02-28 04:13:47'),
(8, 7, 10, 'Black Jeans', 2, 750.00, 1500.00, '2024-02-28 04:13:47', '2024-02-28 04:13:47'),
(9, 8, 13, 'White Hill Top Shoes', 1, 1300.00, 1300.00, '2024-02-28 07:43:15', '2024-02-28 07:43:15'),
(10, 8, 12, 'Nike Air Jordar', 1, 2100.00, 2100.00, '2024-02-28 07:43:15', '2024-02-28 07:43:15'),
(11, 9, 3, 'Rado Watch', 1, 3500.00, 3500.00, '2024-02-28 11:16:05', '2024-02-28 11:16:05'),
(12, 10, 11, 'Casual shoes', 1, 600.00, 600.00, '2024-03-06 06:28:37', '2024-03-06 06:28:37'),
(13, 11, 15, 'Blue sport shoes', 1, 850.00, 850.00, '2024-03-06 08:08:07', '2024-03-06 08:08:07'),
(14, 12, 20, 'Pink Sneakers', 1, 500.00, 500.00, '2024-03-06 08:24:23', '2024-03-06 08:24:23'),
(15, 13, 20, 'Pink Sneakers', 2, 500.00, 1000.00, '2024-03-07 03:27:45', '2024-03-07 03:27:45'),
(16, 13, 11, 'Casual shoes', 1, 600.00, 600.00, '2024-03-07 03:27:45', '2024-03-07 03:27:45'),
(17, 14, 16, 'Green Sneakers', 1, 999.00, 999.00, '2024-03-07 03:39:13', '2024-03-07 03:39:13'),
(18, 15, 19, 'Sport shoes by woodland', 1, 2700.00, 2700.00, '2024-04-15 06:03:12', '2024-04-15 06:03:12');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `content`, `created_at`, `updated_at`) VALUES
(1, 'Contact Us', 'contact-us', '<p></p><p><strong>AmazingOnlineShop</strong> is an e-commerce brand that sells clothing, electronics, accessories, footwear, and home decor items.</p><p>The company is famous for its optimism and fun. They reflect their personality on every page of their website</p><p><b>For Discount Coupons Get In Touch with us via this Contact Form. </b>Enter your valid email address we will send coupon codes on your email</p><address>Rupesh Jadhav <br>14/08 Ahmedabad.<br> Gujarat India 380001</address><p></p><p></p><address><a href=\"tel:0123456789\">+91 0123456897</a><br><a href=\"mailto:rcjadhav@gmail.com\">rcjadhav@gmail.com</a></address><p></p>', '2024-02-29 10:16:06', '2024-03-08 06:20:19'),
(2, 'About Us', 'about-us', '<p>About Us Content By Rupesh Jadhav</p><p><span style=\"font-weight: bolder;\">AmazingOnlineShop</span>&nbsp;is an e-commerce brand that sells clothing, electronics, accessories, footwear, and home decor items.</p><p>The company is famous for its optimism and fun. They reflect their personality on every page of their website</p><p><span style=\"font-size: 1rem;\">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quas assumenda aliquam deserunt aspernatur numquam animi sit veniam distinctio voluptatem nihil ratione possimus ex eligendi molestias, similique earum? Ut accusamus exercitationem illo porro quis doloribus quasi atque, inventore dignissimos. Vel molestias quos maiores sequi explicabo numquam doloribus labore qui facilis rem.</span><br></p><p><span style=\"font-size: 1rem;\">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quas assumenda aliquam deserunt aspernatur numquam animi sit veniam distinctio voluptatem nihil ratione possimus ex eligendi molestias, similique earum? Ut accusamus exercitationem illo porro quis doloribus quasi atque, inventore dignissimos. Vel molestias quos maiores sequi explicabo numquam doloribus labore qui facilis rem.</span></p><p><span style=\"font-size: 1rem;\"><br></span><span style=\"font-size: 1rem;\">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quas assumenda aliquam deserunt aspernatur numquam animi sit veniam distinctio voluptatem nihil ratione possimus ex eligendi molestias, similique earum? Ut accusamus exercitationem illo porro quis doloribus quasi atque, inventore dignissimos. Vel molestias quos maiores sequi explicabo numquam doloribus labore qui facilis rem.</span></p><p><span style=\"font-size: 1rem;\">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quas assumenda aliquam deserunt aspernatur numquam animi sit veniam distinctio voluptatem nihil ratione possimus ex eligendi molestias, similique earum? Ut accusamus exercitationem illo porro quis doloribus quasi atque, inventore dignissimos. Vel molestias quos maiores sequi explicabo numquam doloribus labore qui facilis rem.</span></p>', '2024-02-29 10:16:32', '2024-04-11 08:14:59'),
(3, 'Terms & Conditions', 'terms-conditions', '<h2 id=\"store-name-terms-and-conditions-policy\" style=\"font-weight: 600;margin-bottom:1rem\">AmazingOnlineShop Terms and Conditions Policy</h2><p>Welcome to AmazingOnlineShop These terms and conditions outline the rules and regulations for the use of AmazingOnlieShop’s Website.</p><p> AmazingOnlineShop is located at: Ahmedabad.</p><p>By accessing this website we assume you accept these terms and conditions in full. Do not continue to use  AmazingOnlieShop’s website if you do not accept all of the terms and conditions stated on this page.</p><p>The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and any or all Agreements: <b>Client</b>, <b>You</b> and <b>Your</b> refers to you, the person accessing this website and accepting the Company’s terms and conditions. <b>The Company</b>, <b>Ourselves</b>, <b>We</b>, <b>Our</b> and <b>Us</b>, refers to our Company. <b>Party</b>, <b>Parties</b>, or <b>Us</b>, refers to both the Client and ourselves, or either the Client or ourselves.</p><p>All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner, whether by formal meetings of a fixed duration, or any other means, for the express purpose of meeting the Client’s needs in respect of provision of the Company’s stated services/products, in accordance with and subject to, prevailing law of (Address).</p><p>Any use of the above terminology or other words in the singular, plural, capitalisation and/or he/she or they, are taken as interchangeable and therefore as referring to same.</p>', '2024-02-29 10:17:51', '2024-03-11 09:06:07');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('rupesh@user.com', 'ewoLbBApTf74Yo6MFP8L65tgGcTk1hOv8IQASs4LlUVYgfocjFzvfe1DYPW0', '2024-03-15 06:34:58');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `shipping_returns` text COLLATE utf8mb4_unicode_ci,
  `related_products` text COLLATE utf8mb4_unicode_ci,
  `price` double(10,2) NOT NULL,
  `compare_price` double(10,2) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `sub_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_featured` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `track_qty` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Yes',
  `qty` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_sub_category_id_foreign` (`sub_category_id`),
  KEY `products_brand_id_foreign` (`brand_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `description`, `short_description`, `shipping_returns`, `related_products`, `price`, `compare_price`, `category_id`, `sub_category_id`, `brand_id`, `is_featured`, `sku`, `barcode`, `track_qty`, `qty`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Puma Sport Shoes', 'puma-sport-shoes', 'Description Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi.', '<p>Puma Sports Shoes</p>', 'Having a Refund Policy can be a great asset to win over customers from your competition, it gives them security and increases trust in your brand. However, it should be a balanced policy, as you do not want your customers to take advantage of you.\n\nTo help you get started, we have created a sample Refund Policy that you can use by inserting your relevant details and publishing it on your Website.', NULL, 1250.00, NULL, 1, 1, 1, 'Yes', '1254', '21212', 'Yes', 12, 1, '2024-02-15 10:36:33', '2024-02-19 09:21:55'),
(2, 'Boat Smart Watch', 'boat-smart-watch', 'Description Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi.', '<p>Boat Smart Watch</p>', 'Having a Refund Policy can be a great asset to win over customers from your competition, it gives them security and increases trust in your brand. However, it should be a balanced policy, as you do not want your customers to take advantage of you.\r\n\r\nTo help you get started, we have created a sample Refund Policy that you can use by inserting your relevant details and publishing it on your Website.', '3,21', 2500.00, NULL, 2, 2, 2, 'Yes', '1235', '11111', 'Yes', 20, 1, '2024-02-15 10:37:41', '2024-03-07 11:04:44'),
(3, 'Rado Watch', 'rado-watch', 'Description Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi.', '<p>Rado Watch</p>', 'Having a Refund Policy can be a great asset to win over customers from your competition, it gives them security and increases trust in your brand. However, it should be a balanced policy, as you do not want your customers to take advantage of you.\r\n\r\nTo help you get started, we have created a sample Refund Policy that you can use by inserting your relevant details and publishing it on your Website.', NULL, 3500.00, 3700.00, 2, NULL, NULL, 'No', '1234', '11111', 'Yes', 0, 1, '2024-02-15 11:10:04', '2024-03-07 10:15:05'),
(6, 'Lather Jacket Men\'s', 'lather-jacket', 'Description Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi.', '<p>Lather Jacket For&nbsp; Men\'s<br></p>', 'Having a Refund Policy can be a great asset to win over customers from your competition, it gives them security and increases trust in your brand. However, it should be a balanced policy, as you do not want your customers to take advantage of you.\r\n\r\nTo help you get started, we have created a sample Refund Policy that you can use by inserting your relevant details and publishing it on your Website.', '', 2500.00, NULL, 3, 3, NULL, 'No', '12355', NULL, 'Yes', 8, 1, '2024-02-19 08:43:56', '2024-04-11 10:23:55'),
(7, 'lather Jacket Women\'s', 'lather-jacket-women', 'Description Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi.', '<p>Lather Jacket for Women\'s<br></p>', 'Having a Refund Policy can be a great asset to win over customers from your competition, it gives them security and increases trust in your brand. However, it should be a balanced policy, as you do not want your customers to take advantage of you.\r\n\r\nTo help you get started, we have created a sample Refund Policy that you can use by inserting your relevant details and publishing it on your Website.', '', 2500.00, NULL, 4, 6, NULL, 'No', '12345', NULL, 'Yes', 5, 1, '2024-02-19 08:45:47', '2024-04-11 10:23:19'),
(8, 'Dell Laptop', 'dell-laptop', 'Description Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi.', '<p>Dell Laptop Description</p>', 'Having a Refund Policy can be a great asset to win over customers from your competition, it gives them security and increases trust in your brand. However, it should be a balanced policy, as you do not want your customers to take advantage of you.\r\n\r\nTo help you get started, we have created a sample Refund Policy that you can use by inserting your relevant details and publishing it on your Website.', NULL, 55000.00, 60000.00, 5, NULL, 3, 'Yes', '12435', NULL, 'Yes', 15, 1, '2024-02-19 10:59:42', '2024-02-19 10:59:42'),
(9, 'HP Laptop', 'hp-laptop', 'Description Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi.', '<p>HP Laptop Description</p>', 'Having a Refund Policy can be a great asset to win over customers from your competition, it gives them security and increases trust in your brand. However, it should be a balanced policy, as you do not want your customers to take advantage of you.\r\n\r\nTo help you get started, we have created a sample Refund Policy that you can use by inserting your relevant details and publishing it on your Website.', NULL, 59000.00, 60000.00, 5, NULL, 4, 'Yes', '13245', NULL, 'Yes', 17, 1, '2024-02-19 11:00:53', '2024-02-19 11:00:53'),
(10, 'Black Jeans', 'black-jeans', 'Description Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi.', '<p>Black Jeans For Men\'s</p>', 'Having a Refund Policy can be a great asset to win over customers from your competition, it gives them security and increases trust in your brand. However, it should be a balanced policy, as you do not want your customers to take advantage of you.\r\n\r\nTo help you get started, we have created a sample Refund Policy that you can use by inserting your relevant details and publishing it on your Website.', NULL, 750.00, NULL, 3, 4, NULL, 'Yes', '21345', NULL, 'Yes', 23, 1, '2024-02-20 07:25:10', '2024-02-20 07:25:10'),
(11, 'Casual shoes', 'casual-shoes', 'Description Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi.', '<p>Casual shoes for men\'s</p>', 'Having a Refund Policy can be a great asset to win over customers from your competition, it gives them security and increases trust in your brand. However, it should be a balanced policy, as you do not want your customers to take advantage of you.\r\n\r\nTo help you get started, we have created a sample Refund Policy that you can use by inserting your relevant details and publishing it on your Website.', '', 600.00, 650.00, 1, 8, NULL, 'Yes', '23145', NULL, 'Yes', 2, 1, '2024-02-20 08:32:27', '2024-03-07 03:27:45'),
(12, 'Nike Air Jordan', 'nike-air-jordan', 'Description Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi.', '<p>Nike Air Jordan Retro Collection for all</p>', 'Having a Refund Policy can be a great asset to win over customers from your competition, it gives them security and increases trust in your brand. However, it should be a balanced policy, as you do not want your customers to take advantage of you.\r\n\r\nTo help you get started, we have created a sample Refund Policy that you can use by inserting your relevant details and publishing it on your Website.', '17,13', 2100.00, NULL, 1, 1, 5, 'Yes', 'sku-123', NULL, 'Yes', 13, 1, '2024-02-20 08:35:34', '2024-02-23 09:44:55'),
(13, 'White Hill Top Shoes', 'white-hill-top-shoes', 'Description Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi.', '<p>White Hill Top Shoes for all<br></p>', 'Having a Refund Policy can be a great asset to win over customers from your competition, it gives them security and increases trust in your brand. However, it should be a balanced policy, as you do not want your customers to take advantage of you.\r\n\r\nTo help you get started, we have created a sample Refund Policy that you can use by inserting your relevant details and publishing it on your Website.', '14,12', 1300.00, 1500.00, 1, 1, 5, 'Yes', 'sku-321', NULL, 'Yes', 6, 1, '2024-02-20 08:39:31', '2024-03-08 03:17:31'),
(14, 'Blue Hill top', 'blue-hill-top', 'Description Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi.', '<p>Blue hill Top shoes for Women\'s</p>', 'Having a Refund Policy can be a great asset to win over customers from your competition, it gives them security and increases trust in your brand. However, it should be a balanced policy, as you do not want your customers to take advantage of you.\r\n\r\nTo help you get started, we have created a sample Refund Policy that you can use by inserting your relevant details and publishing it on your Website.', '13,12', 1250.00, NULL, 1, 1, NULL, 'Yes', 'sku-231', NULL, 'Yes', 7, 1, '2024-02-20 08:40:49', '2024-03-08 03:17:04'),
(15, 'Blue sport shoes', 'blue-sport-shoes', 'Description Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi.', '<p>Blue sport shoes for men\'s<br></p>', 'Having a Refund Policy can be a great asset to win over customers from your competition, it gives them security and increases trust in your brand. However, it should be a balanced policy, as you do not want your customers to take advantage of you.\r\n\r\nTo help you get started, we have created a sample Refund Policy that you can use by inserting your relevant details and publishing it on your Website.', NULL, 850.00, NULL, 1, 1, NULL, 'No', 'sku-213', NULL, 'Yes', 8, 1, '2024-02-20 08:42:17', '2024-03-06 08:08:07'),
(16, 'Green Sneakers', 'green-sneakers', 'Description Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi.', '<p>Green Sneakers For All<br></p>', 'Having a Refund Policy can be a great asset to win over customers from your competition, it gives them security and increases trust in your brand. However, it should be a balanced policy, as you do not want your customers to take advantage of you.\r\n\r\nTo help you get started, we have created a sample Refund Policy that you can use by inserting your relevant details and publishing it on your Website.', NULL, 999.00, 1000.00, 1, 1, NULL, 'No', 'sku-312', NULL, 'Yes', 5, 1, '2024-02-20 08:43:32', '2024-03-07 03:39:13'),
(17, 'Nike Running shoes', 'nike-running-shoes', 'Description Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi.', '<p>Nike Running shoes for athlete&nbsp;<br></p>', 'Having a Refund Policy can be a great asset to win over customers from your competition, it gives them security and increases trust in your brand. However, it should be a balanced policy, as you do not want your customers to take advantage of you.\r\n\r\nTo help you get started, we have created a sample Refund Policy that you can use by inserting your relevant details and publishing it on your Website.', NULL, 3500.00, NULL, 1, 1, 5, 'Yes', 'sku-432', NULL, 'Yes', 18, 1, '2024-02-20 08:44:51', '2024-02-20 08:44:51'),
(18, 'Woodland Shoes', 'woodland-shoes', 'Description Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi.', '<p>Woodland Shoes For Men\'s<br></p>', 'Having a Refund Policy can be a great asset to win over customers from your competition, it gives them security and increases trust in your brand. However, it should be a balanced policy, as you do not want your customers to take advantage of you.\r\n\r\nTo help you get started, we have created a sample Refund Policy that you can use by inserting your relevant details and publishing it on your Website.', NULL, 1700.00, NULL, 1, 1, NULL, 'No', 'sku-421', NULL, 'Yes', 21, 1, '2024-02-20 08:46:27', '2024-02-20 08:46:27'),
(19, 'Sport shoes by woodland', 'sport-shoes-by-woodland', 'Description Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi.', '<p>Sport shoes by woodland for men\'s<br></p>', 'Having a Refund Policy can be a great asset to win over customers from your competition, it gives them security and increases trust in your brand. However, it should be a balanced policy, as you do not want your customers to take advantage of you.\r\n\r\nTo help you get started, we have created a sample Refund Policy that you can use by inserting your relevant details and publishing it on your Website.', '18,12,17', 2700.00, NULL, 1, 1, NULL, 'Yes', 'sku-431', NULL, 'Yes', 18, 1, '2024-02-20 08:48:25', '2024-04-15 06:03:12'),
(20, 'Pink Sneakers', 'pink-sneakers', 'This shoe is a classic with a runway inspired look. It has been designed by one of our most famous designers and brings back the shape that defined the era. The large Air element ensures long lasting comfort and gives the shoe a casual look. The upper material is made of calfskin in a chic light brown color. The sole is made of natural rubber, which is flexible but still robust.', '<p>Pink Sneakers For Women\'s&nbsp;</p>', '<p>Having a Refund Policy can be a great asset to win over customers from your competition, it gives them security and increases trust in your brand. However, it should be a balanced policy, as you do not want your customers to take advantage of you.</p><p>To help you get started, we have created a sample Refund Policy that you can use by inserting your relevant details and publishing it on your Website.</p>', '15', 500.00, NULL, 1, NULL, 1, 'Yes', 'SKU-789', NULL, 'Yes', 2, 1, '2024-03-06 08:18:15', '2024-03-07 04:32:10'),
(21, 'Fire Bolt Smart Watch', 'fire-bolt-smart-watch', '<p>Description Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit, incidunt blanditiis suscipit quidem magnam doloribus earum hic exercitationem. Distinctio dicta veritatis alias delectus quaerat, quam sint ab nulla aperiam commodi.<br></p>', '<p>Smart Watch By FireBolt</p>', '<p>Having a Refund Policy can be a great asset to win over customers from your competition, it gives them security and increases trust in your brand. However, it should be a balanced policy, as you do not want your customers to take advantage of you.</p><p><span style=\"font-size: 1rem;\">To help you get started, we have created a sample Refund Policy that you can use by inserting your relevant details and publishing it on your Website.</span></p>', '2', 1199.00, NULL, 2, 2, NULL, 'Yes', 'SKU-731', NULL, 'Yes', 25, 1, '2024-03-07 09:27:46', '2024-03-07 09:27:46'),
(22, 'ROMANTIC DOVES', 'romantic-doves', '<p>Romantic Doves is a Wall Art .‎White lacquered wood frame with two pigeons with a bouquet of pink and white flowers for home decoration.‎</p><ul><li>Finishes: Gloss</li><li>Sculptor: Joan Coderch</li><li>Porcelain Type: Gloss</li><li>Limited Serie: No<br></li></ul>', '<p>Romantic Doves is a Wall Art .‎White lacquered wood frame with two pigeons with a bouquet of pink and white flowers for home decoration.</p>', '<p>Having a Refund Policy can be a great asset to win over customers from your competition, it gives them security and increases trust in your brand. However, it should be a balanced policy, as you do not want your customers to take advantage of you.</p><p>To help you get started, we have created a sample Refund Policy that you can use by inserting your relevant details and publishing it on your Website.</p>', '', 450.00, NULL, 6, 9, NULL, 'No', 'SKU-1431', NULL, 'Yes', 20, 1, '2024-04-11 07:54:45', '2024-04-11 07:54:45'),
(23, 'Gardeco Objects', 'gardeco-objects', '<p>Prato de parede is Regina Medeiros\' line of luxurious wall decoration in glass.‎ Each design characterized by its own colour pattern and size, these beautiful glass wall discs will be the eyecatcher in any space.‎ The prato de parede are handmade at the artisanal glass manufacturing studio Keramos located in Brazil.‎ They are coloured with precious materials such as mica minerals and gold components.‎</p>', '<p>Glass wall decor item</p>', '<p>Having a Refund Policy can be a great asset to win over customers from your competition, it gives them security and increases trust in your brand. However, it should be a balanced policy, as you do not want your customers to take advantage of you.</p><p>To help you get started, we have created a sample Refund Policy that you can use by inserting your relevant details and publishing it on your Website.</p>', '22', 399.00, NULL, 6, 9, NULL, 'No', 'SKU-691', NULL, 'Yes', 25, 1, '2024-04-11 07:59:23', '2024-04-11 07:59:23');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
CREATE TABLE IF NOT EXISTS `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_images_product_id_foreign` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 1, '1-1-1707993393.jpg', NULL, '2024-02-15 10:36:33', '2024-02-15 10:36:33'),
(2, 1, '1-2-1707993393.jpg', NULL, '2024-02-15 10:36:33', '2024-02-15 10:36:33'),
(3, 2, '2-3-1707993461.jpg', NULL, '2024-02-15 10:37:41', '2024-02-15 10:37:41'),
(4, 2, '2-4-1708071887.jpg', NULL, '2024-02-16 08:24:47', '2024-02-16 08:24:47'),
(6, 6, '6-6-1708332251.jpg', NULL, '2024-02-19 08:44:11', '2024-02-19 08:44:11'),
(7, 7, '7-7-1708332347.jpg', NULL, '2024-02-19 08:45:47', '2024-02-19 08:45:47'),
(8, 8, '8-8-1708340382.jpg', NULL, '2024-02-19 10:59:42', '2024-02-19 10:59:42'),
(9, 8, '8-9-1708340382.jpg', NULL, '2024-02-19 10:59:42', '2024-02-19 10:59:42'),
(10, 9, '9-10-1708340453.jpg', NULL, '2024-02-19 11:00:53', '2024-02-19 11:00:53'),
(11, 9, '9-11-1708340453.jpg', NULL, '2024-02-19 11:00:53', '2024-02-19 11:00:53'),
(12, 10, '10-12-1708413910.jpg', NULL, '2024-02-20 07:25:10', '2024-02-20 07:25:10'),
(13, 11, '11-13-1708417947.jpg', NULL, '2024-02-20 08:32:27', '2024-02-20 08:32:27'),
(14, 11, '11-14-1708417947.jpg', NULL, '2024-02-20 08:32:27', '2024-02-20 08:32:27'),
(15, 12, '12-15-1708418134.jpg', NULL, '2024-02-20 08:35:34', '2024-02-20 08:35:34'),
(16, 12, '12-16-1708418135.jpg', NULL, '2024-02-20 08:35:35', '2024-02-20 08:35:35'),
(17, 13, '13-17-1708418371.jpg', NULL, '2024-02-20 08:39:31', '2024-02-20 08:39:31'),
(18, 14, '14-18-1708418449.jpg', NULL, '2024-02-20 08:40:49', '2024-02-20 08:40:49'),
(19, 15, '15-19-1708418537.jpg', NULL, '2024-02-20 08:42:17', '2024-02-20 08:42:17'),
(20, 16, '16-20-1708418612.jpg', NULL, '2024-02-20 08:43:32', '2024-02-20 08:43:32'),
(21, 17, '17-24-1708418811.jpg', NULL, '2024-02-20 08:44:51', '2024-02-20 08:44:51'),
(22, 18, '18-22-1708418787.jpg', NULL, '2024-02-20 08:46:27', '2024-02-20 08:46:27'),
(23, 18, '18-23-1708418788.jpg', NULL, '2024-02-20 08:46:28', '2024-02-20 08:46:28'),
(24, 17, '17-21-1708418691.jpg', NULL, '2024-02-20 08:46:51', '2024-02-20 08:46:51'),
(25, 19, '19-25-1708418905.jpg', NULL, '2024-02-20 08:48:25', '2024-02-20 08:48:25'),
(26, 20, '20-26-1709713095.jpg', NULL, '2024-03-06 08:18:15', '2024-03-06 08:18:15'),
(27, 21, '21-27-1709803666.jpg', NULL, '2024-03-07 09:27:46', '2024-03-07 09:27:46'),
(28, 22, '22-28-1712822085.jpg', NULL, '2024-04-11 07:54:45', '2024-04-11 07:54:45'),
(29, 23, '23-29-1712822363.png', NULL, '2024-04-11 07:59:23', '2024-04-11 07:59:23');

-- --------------------------------------------------------

--
-- Table structure for table `product_ratings`
--

DROP TABLE IF EXISTS `product_ratings`;
CREATE TABLE IF NOT EXISTS `product_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` double(3,2) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_ratings_product_id_foreign` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_ratings`
--

INSERT INTO `product_ratings` (`id`, `product_id`, `username`, `email`, `comment`, `rating`, `status`, `created_at`, `updated_at`) VALUES
(1, 12, 'Rupesh', 'rupesh@user.com', 'This Nike Air Jordan Collection is the Best I am happy with the quality and services by AmazingOnlineShop.', 5.00, 1, '2024-03-01 11:24:45', '2024-03-01 11:24:45'),
(2, 12, 'Jadhav', 'rupesh@test.com', 'Awesome Shoes ', 5.00, 1, '2024-03-04 11:24:45', '2024-03-04 08:37:41'),
(3, 17, 'Rupesh', 'rupesh@user.com', 'This Nike Running Shoes is the Best nike shoes that  i received & i am happy with the quality and services by AmazingOnlineShop.', 5.00, 1, '2024-04-09 11:24:45', '2024-04-09 11:24:45'),
(4, 21, 'Ashish', 'ashish@gmail.com', 'Very nice smart watch square dial make it more beautiful.\r\nDisplay is good.\r\nHealth data is almost accurate.\r\nOverall good package.', 5.00, 1, '2024-04-09 03:30:05', '2024-04-09 03:30:32');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_charges`
--

DROP TABLE IF EXISTS `shipping_charges`;
CREATE TABLE IF NOT EXISTS `shipping_charges` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `country_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_charges`
--

INSERT INTO `shipping_charges` (`id`, `country_id`, `amount`, `created_at`, `updated_at`) VALUES
(1, '100', 70.00, '2024-02-23 08:26:40', '2024-02-27 07:13:13'),
(2, 'rest_of_world', 150.00, '2024-02-23 08:48:41', '2024-02-27 08:17:00');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

DROP TABLE IF EXISTS `sub_categories`;
CREATE TABLE IF NOT EXISTS `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `showHome` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_categories_category_id_foreign` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `name`, `slug`, `status`, `showHome`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Sports Shoes', 'sports-shoes', 1, 'Yes', 1, '2024-02-15 10:20:15', '2024-02-15 10:20:15'),
(2, 'Smart Watch', 'smart-watch', 1, 'No', 2, '2024-02-15 10:20:32', '2024-02-15 10:20:32'),
(3, 'Jackets', 'jackets', 1, 'Yes', 3, '2024-02-19 07:47:34', '2024-02-19 07:47:34'),
(4, 'Jeans', 'jeans', 1, 'Yes', 3, '2024-02-19 07:53:02', '2024-02-19 07:53:02'),
(5, 'Jeans', 'jeans-women', 1, 'Yes', 4, '2024-02-19 07:53:44', '2024-02-19 07:53:44'),
(6, 'Jackets', 'jackets-women', 1, 'Yes', 4, '2024-02-19 08:41:52', '2024-02-19 08:41:52'),
(7, 'Shirt', 'shirt', 1, 'Yes', 3, '2024-02-20 08:19:58', '2024-02-20 08:19:58'),
(8, 'Casual Shoes', 'casual-shoes', 1, 'Yes', 1, '2024-02-20 08:21:35', '2024-02-20 08:21:35'),
(9, 'Wall decor items', 'wall-decor-items', 1, 'Yes', 6, '2024-04-11 07:49:22', '2024-04-11 07:49:22');

-- --------------------------------------------------------

--
-- Table structure for table `temp_images`
--

DROP TABLE IF EXISTS `temp_images`;
CREATE TABLE IF NOT EXISTS `temp_images` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `temp_images`
--

INSERT INTO `temp_images` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, '1707300007.jpg', '2024-02-07 04:30:08', '2024-02-07 04:30:08'),
(2, '1707301075.jpg', '2024-02-07 04:47:55', '2024-02-07 04:47:55'),
(3, '1707301276.jpg', '2024-02-07 04:51:16', '2024-02-07 04:51:16'),
(4, '1707302876.png', '2024-02-07 05:17:56', '2024-02-07 05:17:56'),
(5, '1707302991.png', '2024-02-07 05:19:51', '2024-02-07 05:19:51'),
(6, '1707303185.png', '2024-02-07 05:23:05', '2024-02-07 05:23:05'),
(7, '1707303271.png', '2024-02-07 05:24:31', '2024-02-07 05:24:31'),
(8, '1707303465.png', '2024-02-07 05:27:45', '2024-02-07 05:27:45'),
(9, '1707378794.jpg', '2024-02-08 02:23:14', '2024-02-08 02:23:14'),
(10, '1707378835.jpg', '2024-02-08 02:23:55', '2024-02-08 02:23:55'),
(11, '1707817063.png', '2024-02-13 04:07:43', '2024-02-13 04:07:43'),
(12, '1707817747.png', '2024-02-13 04:19:07', '2024-02-13 04:19:07'),
(13, '1707817819.png', '2024-02-13 04:20:19', '2024-02-13 04:20:19'),
(14, '1707818217.png', '2024-02-13 04:26:57', '2024-02-13 04:26:57'),
(15, '1707818230.png', '2024-02-13 04:27:10', '2024-02-13 04:27:10'),
(16, '1707818265.png', '2024-02-13 04:27:45', '2024-02-13 04:27:45'),
(17, '1707818775.png', '2024-02-13 04:36:15', '2024-02-13 04:36:15'),
(18, '1707819058.png', '2024-02-13 04:40:58', '2024-02-13 04:40:58'),
(19, '1707819192.png', '2024-02-13 04:43:12', '2024-02-13 04:43:12'),
(20, '1707819222.png', '2024-02-13 04:43:42', '2024-02-13 04:43:42'),
(21, '1707819267.png', '2024-02-13 04:44:27', '2024-02-13 04:44:27'),
(22, '1707819744.png', '2024-02-13 04:52:24', '2024-02-13 04:52:24'),
(23, '1707819744.png', '2024-02-13 04:52:24', '2024-02-13 04:52:24'),
(24, '1707819800.png', '2024-02-13 04:53:20', '2024-02-13 04:53:20'),
(25, '1707819800.png', '2024-02-13 04:53:20', '2024-02-13 04:53:20'),
(26, '1707819929.png', '2024-02-13 04:55:29', '2024-02-13 04:55:29'),
(27, '1707819930.png', '2024-02-13 04:55:30', '2024-02-13 04:55:30'),
(28, '1707820503.png', '2024-02-13 05:05:03', '2024-02-13 05:05:03'),
(29, '1707820503.png', '2024-02-13 05:05:03', '2024-02-13 05:05:03'),
(30, '1707820764.jpg', '2024-02-13 05:09:24', '2024-02-13 05:09:24'),
(31, '1707820764.jpeg', '2024-02-13 05:09:24', '2024-02-13 05:09:24'),
(32, '1707823324.jfif', '2024-02-13 05:52:04', '2024-02-13 05:52:04'),
(33, '1707823743.jpg', '2024-02-13 05:59:03', '2024-02-13 05:59:03'),
(34, '1707823743.jpg', '2024-02-13 05:59:03', '2024-02-13 05:59:03'),
(35, '1707824213C:\\wamp64\\tmp\\php8C83.tmp.jpg', '2024-02-13 06:06:53', '2024-02-13 06:06:53'),
(36, '1707824213C:\\wamp64\\tmp\\php8D5F.tmp.jpg', '2024-02-13 06:06:53', '2024-02-13 06:06:53'),
(37, '1707981356.jpg', '2024-02-15 01:45:56', '2024-02-15 01:45:56'),
(38, '1707981356.jpg', '2024-02-15 01:45:56', '2024-02-15 01:45:56'),
(39, '1707981579-dog.jpg.jpg', '2024-02-15 01:49:39', '2024-02-15 01:49:39'),
(40, '1707981580-whitedog.jpg.jpg', '2024-02-15 01:49:40', '2024-02-15 01:49:40'),
(41, '1707981660-dog.jpg', '2024-02-15 01:51:00', '2024-02-15 01:51:00'),
(42, '1707981661-whitedog.jpg', '2024-02-15 01:51:01', '2024-02-15 01:51:01'),
(43, '1707982126-dog.jpg', '2024-02-15 01:58:46', '2024-02-15 01:58:46'),
(44, '1707982127-whitedog.jpg', '2024-02-15 01:58:47', '2024-02-15 01:58:47'),
(45, '1707983207-dog.jpg', '2024-02-15 02:16:47', '2024-02-15 02:16:47'),
(46, '1707983207-whitedog.jpg', '2024-02-15 02:16:47', '2024-02-15 02:16:47'),
(47, '1707983604.jpg', '2024-02-15 07:53:24', '2024-02-15 07:53:24'),
(48, '1707983604.jpg', '2024-02-15 07:53:24', '2024-02-15 07:53:24'),
(49, '1707983761.jpg', '2024-02-15 07:56:01', '2024-02-15 07:56:01'),
(50, '1707983761.jpg', '2024-02-15 07:56:01', '2024-02-15 07:56:01'),
(51, '1707984777-dog.jpg', '2024-02-15 08:12:57', '2024-02-15 08:12:57'),
(52, '1707984777-whitedog.jpg', '2024-02-15 08:12:57', '2024-02-15 08:12:57'),
(53, '1707986191-sync.png', '2024-02-15 08:36:31', '2024-02-15 08:36:31'),
(54, '1707986191-puma.png', '2024-02-15 08:36:31', '2024-02-15 08:36:31'),
(55, '1707990157-prod-2.jpg', '2024-02-15 09:42:37', '2024-02-15 09:42:37'),
(56, '1707990157-prod-1.jpg', '2024-02-15 09:42:37', '2024-02-15 09:42:37'),
(57, '1707990953-product-1.jpg', '2024-02-15 09:55:53', '2024-02-15 09:55:53'),
(58, '1707992348-prod-5.jpg', '2024-02-15 10:19:08', '2024-02-15 10:19:08'),
(59, '1707992372-product-1.jpg', '2024-02-15 10:19:32', '2024-02-15 10:19:32'),
(60, '1707992499-product-1.jpg', '2024-02-15 10:21:39', '2024-02-15 10:21:39'),
(61, '1707992566-prod-2.jpg', '2024-02-15 10:22:46', '2024-02-15 10:22:46'),
(62, '1707992566-prod-1.jpg', '2024-02-15 10:22:46', '2024-02-15 10:22:46'),
(63, '1707993383-prod-2.jpg', '2024-02-15 10:36:23', '2024-02-15 10:36:23'),
(64, '1707993383-prod-1.jpg', '2024-02-15 10:36:23', '2024-02-15 10:36:23'),
(65, '1707993449-product-1.jpg', '2024-02-15 10:37:29', '2024-02-15 10:37:29'),
(66, '1708082023-hoodie.png', '2024-02-16 11:13:43', '2024-02-16 11:13:43'),
(67, '1708329141-cat-111.jpg', '2024-02-19 07:52:21', '2024-02-19 07:52:21'),
(68, '1708332326-product-3.jpg', '2024-02-19 08:45:26', '2024-02-19 08:45:26'),
(69, '1708338443-laptop.jpg', '2024-02-19 10:27:23', '2024-02-19 10:27:23'),
(70, '1708340377-dell.jpg', '2024-02-19 10:59:37', '2024-02-19 10:59:37'),
(71, '1708340377-laptop.jpg', '2024-02-19 10:59:37', '2024-02-19 10:59:37'),
(72, '1708340421-hp.jpg', '2024-02-19 11:00:21', '2024-02-19 11:00:21'),
(73, '1708340421-laptop.jpg', '2024-02-19 11:00:21', '2024-02-19 11:00:21'),
(74, '1708413882-black-jeans.jpg', '2024-02-20 07:24:42', '2024-02-20 07:24:42'),
(75, '1708417907-img_bg_1.jpg', '2024-02-20 08:31:47', '2024-02-20 08:31:47'),
(76, '1708417908-img_bg_3.jpg', '2024-02-20 08:31:48', '2024-02-20 08:31:48'),
(77, '1708418035-item-11.jpg', '2024-02-20 08:33:55', '2024-02-20 08:33:55'),
(78, '1708418035-item-13.jpg', '2024-02-20 08:33:55', '2024-02-20 08:33:55'),
(79, '1708418319-about.jpg', '2024-02-20 08:38:39', '2024-02-20 08:38:39'),
(80, '1708418397-item-1.jpg', '2024-02-20 08:39:57', '2024-02-20 08:39:57'),
(81, '1708418487-item-4.jpg', '2024-02-20 08:41:27', '2024-02-20 08:41:27'),
(82, '1708418567-item-16.jpg', '2024-02-20 08:42:47', '2024-02-20 08:42:47'),
(83, '1708418629-cover-img-1.jpg', '2024-02-20 08:43:49', '2024-02-20 08:43:49'),
(84, '1708418741-item-8.jpg', '2024-02-20 08:45:41', '2024-02-20 08:45:41'),
(85, '1708418741-item-7.jpg', '2024-02-20 08:45:41', '2024-02-20 08:45:41'),
(86, '1708418837-item-9.jpg', '2024-02-20 08:47:17', '2024-02-20 08:47:17'),
(87, '1709713018-product-2.jpg', '2024-03-06 08:16:58', '2024-03-06 08:16:58'),
(88, '1709803422-smart-watch.jpg', '2024-03-07 09:23:42', '2024-03-07 09:23:42'),
(89, '1710822105-watch.jpg', '2024-03-19 04:21:45', '2024-03-19 04:21:45'),
(90, '1712821577-home-decorate.jpg', '2024-04-11 07:46:17', '2024-04-11 07:46:17'),
(91, '1712822008-h_romantic-doves.jpg', '2024-04-11 07:53:28', '2024-04-11 07:53:28'),
(92, '1712822300-GardecoObjects.png', '2024-04-11 07:58:20', '2024-04-11 07:58:20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '1',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `role`, `status`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'rupesh@admin.com', NULL, 2, 1, NULL, '$2y$10$nSnGSywlZCD/rB/7sTpXWOssrXM5kA2wS05pU/ELF2ciPMuIvQDGC', NULL, '2024-02-06 02:59:43', '2024-03-01 04:22:50'),
(2, 'Rupesh', 'rupesh@user.com', NULL, 1, 1, NULL, '$2y$10$7lZdR/hqTQ7bQGRdPP1HousGvqg9H5GXup8T4hOXUKPaRMjZZoW4O', NULL, '2024-02-06 03:01:31', '2024-03-01 08:38:12'),
(3, 'Rupesh', 'rupesh@test.com', '1230456879', 1, 1, NULL, '$2y$10$5PNK6NtwcyKrbZIilvvDSOtDRvAwzab8V3gx55hmEP0zbQNf.koyq', NULL, '2024-02-22 07:44:57', '2024-02-29 11:49:42'),
(4, 'Rupesh Jadhav', 'test@yop.com', '1230456879', 1, 1, NULL, '$2y$10$EbvAXCdfENX8iYvcsyNI7e0u5KDnFWnpMuJSLZml1wVJYdrkNCm2.', NULL, '2024-02-22 07:46:52', '2024-02-22 07:46:52'),
(6, 'Test', 'test@yomail.com', NULL, 1, 0, NULL, '$2y$10$EbvAXCdfENX8iYvcsyNI7e0u5KDnFWnpMuJSLZml1wVJYdrkNCm2.', NULL, '2024-02-22 07:46:52', '2024-03-18 04:58:45');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

DROP TABLE IF EXISTS `wishlists`;
CREATE TABLE IF NOT EXISTS `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlists_user_id_foreign` (`user_id`),
  KEY `wishlists_product_id_foreign` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(8, 4, 20, '2024-03-06 08:32:24', '2024-03-06 08:32:24'),
(9, 6, 3, '2024-03-07 10:14:26', '2024-03-07 10:14:26');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
