-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 20, 2022 at 03:31 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inery_whitelists_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `round_names`
--

CREATE TABLE `round_names` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `round_names`
--

INSERT INTO `round_names` (`id`, `name`) VALUES
(1, 'Strategic Vesting'),
(2, 'PreSeed Vesting'),
(3, 'Seed Vesting'),
(4, 'Private A Vesting'),
(5, 'Public Vesting'),
(6, 'Team Vesting'),
(7, 'Advisor Vesting'),
(8, 'Marketing Vesting'),
(9, 'Development Vesting');

-- --------------------------------------------------------

--
-- Table structure for table `whitelists`
--

CREATE TABLE `whitelists` (
  `id` int(11) NOT NULL,
  `wallet_address` varchar(42) NOT NULL,
  `amount` double NOT NULL,
  `round_name_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `whitelists`
--

INSERT INTO `whitelists` (`id`, `wallet_address`, `amount`, `round_name_id`, `created_at`) VALUES
(1, '0xe347a118aF478cF43DdBcc152E87e8f1A8c3A237', 10000, 4, '2022-01-20 14:10:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `round_names`
--
ALTER TABLE `round_names`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `whitelists`
--
ALTER TABLE `whitelists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `round_name_id` (`round_name_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `round_names`
--
ALTER TABLE `round_names`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `whitelists`
--
ALTER TABLE `whitelists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `whitelists`
--
ALTER TABLE `whitelists`
  ADD CONSTRAINT `whitelists_ibfk_1` FOREIGN KEY (`round_name_id`) REFERENCES `round_names` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
