-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2021 at 02:08 PM
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

--
-- Dumping data for table `donation`
--

INSERT INTO `donation` (`id`, `donation_id`, `doner_name`, `doner_mobile`, `doner_pincode`, `doner_landmark`, `doner_area`, `doner_district`, `doner_region`, `doner_state`, `donation_stuff`, `donation_type`, `donation_charge`, `description`, `isVerified`, `verification_code`, `create_date`) VALUES
(2, 'NSD00001', 'Shubham Sahu', '9999555566', 496001, 'near pahadi mandir', 'Bangursiya', 'Raigarh', 'Raipur', 'Chattisgarh', 'Oxygen Cylinder', 'Unpaid', '0', 'Ham hai to kya gam h. chahiye to le jao', 1, 676225, 1621163015),
(3, 'NSD00003', 'Abhilash shah', '7775556661', 490011, 'badi wali pani tanki k paas', 'Khursipar Bhilai', 'Durg', 'Raipur', 'Chattisgarh', 'Mask Sanitizer PPE kits', 'Unpaid', '0', 'Aa k le jao yar', 1, 467023, 1621163075),
(4, 'NSD00004', 'Animesh kumar sharma', '2233355666', 490011, 'nehru hospital k paas', 'Khursipar Bhilai', 'Durg', 'Raipur', 'Chattisgarh', 'Plasma', 'Unpaid', '0', 'Bahut khoon h yrr aa k le jao', 1, 168576, 1621163134),
(5, 'NSD00005', 'Ashish dubey', '1111111111', 496001, 'near railway station', 'Bangursiya', 'Raigarh', 'Raipur', 'Chattisgarh', 'Groceries', 'Paid', '1000', 'I am a shopkeeper and if you want please contact.', 1, 750249, 1621163206);

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

--
-- Dumping data for table `donation_statistics`
--

INSERT INTO `donation_statistics` (`id`, `donation_id`, `upvote`, `downvote`, `last_updated`) VALUES
(1, 'NSD00001', 2, 0, 1621159977),
(2, 'NSD00001', 2, 0, 1621163015),
(3, 'NSD00003', 0, 2, 1621163075),
(4, 'NSD00004', 0, 0, 1621163134),
(5, 'NSD00005', 2, 0, 1621163206);

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

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`id`, `request_id`, `seeker_name`, `mobile`, `pincode`, `landmark`, `area`, `district`, `region`, `state`, `required_stuff`, `description`, `isVerified`, `verification_code`, `last_updated`) VALUES
(6, 'NSR00001', 'Aman Mahobia', '6655221133', 496001, 'Near Water Tank', 'Bangursiya', 'Raigarh', 'Raipur', 'Chattisgarh', 'Plasma', 'I am in urgent need of Plasma. Be a hero... save a life', 1, 242912, 1621162537),
(7, 'NSR00007', 'ankit', '854864646', 490011, '651616', 'Khursipar Bhilai', 'Durg', 'Raipur', 'Chattisgarh', 'Groceries', 'Please provide ASAP', 1, 421306, 1621162700),
(8, 'NSR00008', 'Abhishek Kumar', '7805969406', 496001, 'near play groun', 'Bangursiya', 'Raigarh', 'Raipur', 'Chattisgarh', 'Remedesivir', 'I am in urgent need of this medicine. Please contact me if you have.', 1, 452664, 1621162834),
(9, 'NSR00009', 'Shrey Deshpande', '4466227788', 490011, 'Near jinal colony', 'Khursipar Bhilai', 'Durg', 'Raipur', 'Chattisgarh', 'MSPPE', 'I am a doctor and in need PPE kit. if you have please contact.', 1, 189223, 1621162911);

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
-- Dumping data for table `request_statistics`
--

INSERT INTO `request_statistics` (`id`, `request_id`, `upvote`, `downvote`, `last_updated`) VALUES
(1, 'NSR00001', 0, 0, 1621159647),
(2, 'NSR00001', 0, 0, 1621160223),
(3, 'NSR00003', 0, 0, 1621160306),
(4, 'NSR00004', 0, 0, 1621160428),
(5, 'NSR00005', 0, 0, 1621160569),
(6, 'NSR00001', 0, 0, 1621162531),
(7, 'NSR00007', 0, 1, 1621162695),
(8, 'NSR00008', 1, 0, 1621162830),
(9, 'NSR00009', 2, 0, 1621162907);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `donation_statistics`
--
ALTER TABLE `donation_statistics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `request_statistics`
--
ALTER TABLE `request_statistics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
