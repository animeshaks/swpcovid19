-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2021 at 05:01 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `swpcovid19`
--

-- --------------------------------------------------------

--
-- Table structure for table `donation`
--

CREATE TABLE `donation` (
  `id` int(11) NOT NULL,
  `donation_id` varchar(50) NOT NULL,
  `doner_name` varchar(150) NOT NULL,
  `doner_mobile` varchar(20) NOT NULL,
  `doner_pincode` int(10) NOT NULL,
  `doner_landmark` varchar(250) NOT NULL,
  `doner_area` varchar(250) NOT NULL,
  `doner_district` varchar(50) NOT NULL,
  `doner_region` varchar(50) NOT NULL,
  `doner_state` varchar(50) NOT NULL,
  `donation_stuff` varchar(150) NOT NULL,
  `donation_type` varchar(20) NOT NULL,
  `donation_charge` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `isVerified` int(5) NOT NULL,
  `verification_code` int(10) NOT NULL,
  `create_date` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `donation_statistics`
--

CREATE TABLE `donation_statistics` (
  `id` int(11) NOT NULL,
  `donation_id` varchar(50) NOT NULL,
  `upvote` int(20) NOT NULL,
  `downvote` int(20) NOT NULL,
  `last_updated` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `id` int(11) NOT NULL,
  `request_id` varchar(50) NOT NULL,
  `seeker_name` varchar(150) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `pincode` int(10) NOT NULL,
  `landmark` varchar(250) NOT NULL,
  `area` varchar(250) NOT NULL,
  `district` varchar(50) NOT NULL,
  `region` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `required_stuff` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `isVerified` int(5) NOT NULL,
  `verification_code` int(10) NOT NULL,
  `last_updated` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `request_statistics`
--

CREATE TABLE `request_statistics` (
  `id` int(11) NOT NULL,
  `request_id` varchar(50) NOT NULL,
  `upvote` int(20) NOT NULL,
  `downvote` int(20) NOT NULL,
  `last_updated` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `donation`
--
ALTER TABLE `donation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donation_statistics`
--
ALTER TABLE `donation_statistics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_statistics`
--
ALTER TABLE `request_statistics`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `donation`
--
ALTER TABLE `donation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donation_statistics`
--
ALTER TABLE `donation_statistics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request_statistics`
--
ALTER TABLE `request_statistics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
