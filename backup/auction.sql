-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2024 at 08:46 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `auction`
--

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(255) NOT NULL,
  `name` varchar(30) NOT NULL,
  `image` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `name`, `image`) VALUES
(1, 'Bat', 'images/files/bat.png'),
(2, 'Ball', 'images/files/ball.png'),
(3, 'Bat and Ball', 'images/files/bat_and_ball.png'),
(4, 'Wicket Keeping', 'images/files/wicket_keeping.png'),
(5, 'sold_yellow', 'images/files/sold_yellow.png'),
(6, 'sold red', 'images/files/sold_red.png'),
(7, 'Sold white', 'images/files/sold_white.png'),
(9, 'Unsold red', 'images/files/unsold_red.png'),
(10, 'Search white', 'images/files/search_white.png'),
(18, 'designed_by', 'images/files/designed_by.png'),
(19, 'auction_background', 'images/files/auction_background.jpg'),
(20, 'player', 'images/files/default_player.jpg'),
(22, 'Player_PSD', 'images/files/player_psd.psd'),
(23, 'Team_PSD', 'images/files/team_psd.psd');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` int(255) NOT NULL,
  `date` varchar(30) NOT NULL,
  `name` varchar(50) NOT NULL,
  `role` varchar(20) NOT NULL,
  `batting_style` varchar(20) NOT NULL,
  `bowling_style` varchar(20) NOT NULL,
  `town` varchar(255) NOT NULL,
  `tshirt_size` varchar(255) NOT NULL,
  `tshirt_number` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `status` varchar(20) NOT NULL,
  `price` int(255) NOT NULL DEFAULT 0,
  `team_id` int(255) UNSIGNED NOT NULL DEFAULT 0,
  `position` varchar(20) NOT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `date`, `name`, `role`, `batting_style`, `bowling_style`, `town`, `tshirt_size`, `tshirt_number`, `phone`, `image`, `status`, `price`, `team_id`, `position`, `active`) VALUES
(1, '', 'Adnan isab', 'Batsman', 'Right', '', '', 'XL', '', '7405266168', 'adnan_isab.jpg', 'sold', 500, 2, '', 'Yes'),
(5, '', 'Uzair Isab', 'Batsman', 'Right', '', '', '', '', '45654645', 'uzair_isab.jpg', 'sold', 500, 5, '', 'Yes'),
(16, '', 'Hafiz Fahad Vali', 'Batsman', 'Right', '', 'Mota Taiwad', 'L', '', '1381', 'hafiz_fahad_vali.jpeg', 'sold', 7000, 3, '', 'Yes'),
(25, '', 'Arshil Damanwala', 'All Rounder', 'Left', 'Left', '', '', '', '43534', 'arshil_damanwala.jpg', 'sold', 500, 1, '', 'Yes'),
(27, '', 'Saffan Vali', 'Batsman', 'Right', '', '', '', '', '453543', 'saffan_vali.jpg', 'sold', 1500, 3, '', 'Yes'),
(28, '', 'Juned Nan', 'Bowler', 'Right', 'Right', '', '', '', '', 'Juned_Nan.jpg', '', 0, 0, '', 'Yes'),
(31, '', 'Tabrez Gebi', 'Batsman', 'Right', '', '', '', '', '', 'Tabrez_Gebi.jpeg', 'sold', 9000, 3, '', 'Yes'),
(32, '', 'Saffan Bhindiwala', 'Batsman', 'Right', '', '', '', '', '54645', 'saffan_bhindiwala.jpg', 'sold', 1250, 5, '', 'Yes'),
(33, '', 'Sakib Isab', 'All Rounder', 'Right', 'Right', '', '', '', '4534534', 'sakib_isab.jpg', 'sold', 3500, 3, '', 'Yes'),
(34, '', 'Salim Vali', 'Batsman', 'Right', '', 'Valsad', '', '', '345345345345', 'salim_vali.jpg', 'sold', 500, 5, '', 'Yes'),
(35, '', 'Anjal Gebi', 'Batsman', 'Right', '', '', '', '', '34', 'anjal_gebi.jpeg', 'sold', 1250, 3, '', 'Yes'),
(36, '', 'Abdul Ayaaz Shaikh', 'All Rounder', 'Right', 'Right', '', '', '', '3', 'abdul_ayaaz_shaikh.jpg', 'sold', 1750, 5, '', 'Yes'),
(37, '', 'Ayyan M Shaikh', 'All Rounder', 'Right', 'Right', 'Panchlaai, Valsad', 'L', '', '2323434', 'ayyan_m_shaikh.jpg', '', 0, 0, '', 'Yes'),
(38, '', 'Asfak Nan', 'Wicket Keeper', 'Right', '', '', 'L', '', '34534534', 'Asfak_Nan.jpeg', 'sold', 500, 5, '', 'Yes'),
(43, '', 'Riyaz Kashi', 'Batsman', 'Right', '', 'Mota Taiwad, Valsad', 'XL', '', '1234', 'riyaz_kashi.jpeg', 'sold', 1500, 1, '', 'Yes'),
(44, '', 'Yusuf Maniar', 'Batsman', 'Right', '', 'Valsad', 'L', '', '9932234234234', 'Yusuf_Maniar.jpg', 'sold', 1250, 1, '', 'Yes'),
(45, '', 'Shahbaz Nan', 'All Rounder', 'Right', 'Right', 'Mota Taiwad, Valsad', 'XL', '', '28374983274', 'shahbaz_nan.jpg', 'sold', 1250, 3, '', 'Yes'),
(46, '', 'Moinuddin Nan', 'All Rounder', 'Right', 'Right', 'Valsad', 'L', '', '96987', 'moinuddin_nan.jpeg', 'sold', 1250, 2, '', 'Yes'),
(50, '', 'Abdul Rehman Barafwala', 'All Rounder', 'Right', 'Right', '', '', '', '234', 'abdul_rehman_barafwala.jpg', 'sold', 1250, 5, '', 'Yes'),
(53, '03/02/2023 08:02:42 PM', 'Ahmed Isab', 'Batsman', 'Right', '', '', '', '', '23423', 'ahmed_isab.jpg', 'sold', 500, 1, '', 'Yes'),
(70, '08/02/2023 03:02 PM', 'Mukit Shaikh', 'Batsman', 'Right', '', '', '', '', '7373737383', 'mukit_shaikh.jpg', 'sold', 2500, 5, '', 'Yes'),
(112, '', 'Gulamnabhi Isab', 'All Rounder', 'Right', 'Right', '', '', '', '2342334534', 'gulamnabhi_01032024_064220PM.jpg', 'sold', 1000, 5, '', 'Yes'),
(113, '', 'Lorem Ipsum', 'Batsman', 'Right', '', '', '', '', '8282394923', 'lorem_01032024_071633PM.png', '', 0, 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `base_price` int(255) NOT NULL DEFAULT 500,
  `total_price` int(255) NOT NULL DEFAULT 50000,
  `logo` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `favicon` varchar(50) NOT NULL,
  `sharing_image` varchar(255) NOT NULL,
  `allow_auction_menus` varchar(10) NOT NULL DEFAULT 'visible',
  `registration` varchar(10) NOT NULL DEFAULT 'Yes',
  `reg_message` varchar(255) NOT NULL,
  `refresh` int(255) NOT NULL DEFAULT 60,
  `tshirt_option` varchar(5) NOT NULL,
  `town_option` varchar(255) NOT NULL,
  `photo_quality` int(11) NOT NULL DEFAULT 80,
  `photo_width` int(11) NOT NULL,
  `photo_size` int(11) NOT NULL,
  `always_on_mobile` varchar(10) NOT NULL DEFAULT 'Yes',
  `auto_active` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `base_price`, `total_price`, `logo`, `title`, `favicon`, `sharing_image`, `allow_auction_menus`, `registration`, `reg_message`, `refresh`, `tshirt_option`, `town_option`, `photo_quality`, `photo_width`, `photo_size`, `always_on_mobile`, `auto_active`) VALUES
(1, 500, 50000, 'logo.png', 'Tournament Name', 'favicon.png', 'sharing_image.jpg', 'visible', 'Yes', 'Your registration has been successfully completed. Please contact Adnan if you have made payment.', 35, 'No', 'No', 80, 600, 10485760, 'Yes', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(255) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `owner` varchar(30) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `theme` varchar(20) NOT NULL DEFAULT '#ffffff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `name`, `owner`, `logo`, `theme`) VALUES
(1, 'Ezzy Masala 11', 'Arshad Abuji', 'ezzy_masala.png', '#ea141d'),
(2, 'DARIAI CHALLENGERS', 'Abdul Rehman Dariai', 'dariai_challengers.png', '#1d3b57'),
(3, 'MCC 11', 'Kasim Vazir', 'mcc_11.png', '#252525'),
(5, 'LALA BHAI LIONS', 'Ajmal Sema', 'lala_bhai_lions.png', '#00335e');

-- --------------------------------------------------------

--
-- Table structure for table `updated`
--

CREATE TABLE `updated` (
  `id` int(11) NOT NULL,
  `timestamp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `updated`
--

INSERT INTO `updated` (`id`, `timestamp`) VALUES
(1, '1709408517');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(255) NOT NULL,
  `name` varchar(20) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `role`) VALUES
(1, 'Adnan Isab', 'adnan', '2e189908f94f436fbfd4faad7f3b8257', 2),
(2, 'Asfak Nan Papplu', 'asfak', '3ee13fe34494fb8d8cd0c5b42451c287', 1),
(3, 'Arshad Abuji', 'arshad', '779d79dc24928f4653d5ad84cffc559f', 0),
(4, 'Ayaz Nan', 'ayaz', '0f4230ecc77a76944f708929fa5b3d30', 0),
(5, 'Siddik Memon', 'siddik', 'e06da937a41acc3e174462b3c911d72a', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `updated`
--
ALTER TABLE `updated`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `updated`
--
ALTER TABLE `updated`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
