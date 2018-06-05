-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2018 at 02:06 AM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coss`
--

-- --------------------------------------------------------

--
-- Table structure for table `value`
--

CREATE TABLE `value` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `symbol_cmc` varchar(20) NOT NULL,
  `symbol_coss` varchar(20) NOT NULL,
  `value` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `value`
--

INSERT INTO `value` (`id`, `name`, `symbol_cmc`, `symbol_coss`, `value`) VALUES
(1, '', 'LALA', 'LALA', '0.0674651'),
(2, '', 'ADI', 'ADI', '0.0175822'),
(3, '', 'BCH', 'BCH', '1105.8'),
(4, '', 'BLZ', 'BLZ', '0.412602'),
(5, '', 'BNT', 'BNT', '4.10917'),
(6, '', 'BPL', 'BPL', '0.13903'),
(7, '', 'BTC', 'BTC', '7514.47'),
(8, '', 'BWT', 'BWT', NULL),
(9, '', 'CAN', 'CAN', '0.153313'),
(10, '', 'COSS', 'COSS', NULL),
(11, '', 'CRED-VERIFY', 'CRED-VERIFY', NULL),
(12, '', 'CREDITS', 'CREDITS', NULL),
(13, '', 'CVC', 'CVC', '0.308849'),
(14, '', 'DASH', 'DASH', '317.026'),
(15, '', 'DAT', 'DAT', '0.0240359'),
(16, '', 'ENJ', 'ENJ', NULL),
(17, '', 'EOS', 'EOS', NULL),
(18, '', 'ETH', 'ETH', NULL),
(19, '', 'FDX', 'FDX', NULL),
(20, '', 'FRV', 'FRV', NULL),
(21, '', 'FXT', 'FXT', NULL),
(22, '', 'FYN', 'FYN', NULL),
(23, '', 'GAT', 'GAT', NULL),
(24, '', 'H2O', 'H2O', NULL),
(25, '', 'HGT', 'HGT', NULL),
(26, '', 'ICX', 'ICX', NULL),
(27, '', 'IND', 'IND', NULL),
(28, '', 'ITT', 'ITT', NULL),
(29, '', 'JET', 'JET', NULL),
(30, '', 'KIN', 'KIN', NULL),
(31, '', 'KNC', 'KNC', NULL),
(32, '', 'LA', 'LA', NULL),
(33, '', 'ARK', 'ARK', NULL),
(34, '', 'LAN', 'LAN', NULL),
(35, '', 'LINK', 'LINK', NULL),
(36, '', 'LSK', 'LSK', NULL),
(37, '', 'LTC', 'LTC', NULL),
(38, '', 'MRK', 'MRK', NULL),
(39, '', 'NOX', 'NOX', NULL),
(40, '', 'OMG', 'OMG', NULL),
(41, '', 'PAY', 'PAY', NULL),
(42, '', 'PGT', 'PGT', NULL),
(43, '', 'PIX', 'PIX', NULL),
(44, '', 'POE', 'POE', NULL),
(45, '', 'PRIX', 'PRIX', NULL),
(46, '', 'REQ', 'REQ', NULL),
(47, '', 'SENC', 'SENC', NULL),
(48, '', 'SMDX', 'SMDX', NULL),
(49, '', 'SNM', 'SNM', NULL),
(50, '', 'STX', 'STX', NULL),
(51, '', 'SUB', 'SUB', NULL),
(52, '', 'TEU', 'TEU', NULL),
(53, '', 'TIG', 'TIG', NULL),
(54, '', 'TRAK', 'TRAK', NULL),
(55, '', 'UFR', 'UFR', NULL),
(56, '', 'USD', 'USD', NULL),
(57, '', 'VEN', 'VEN', NULL),
(58, '', 'VZT', 'VZT', NULL),
(59, '', 'WAVES', 'WAVES', NULL),
(60, '', 'WISH', 'WISH', NULL),
(61, '', 'WTC', 'WTC', NULL),
(62, '', 'XDCE', 'XDCE', NULL),
(63, '', 'XEM', 'XEM', NULL),
(64, '', 'XNK', 'XNK', NULL),
(65, '', 'ZEN', 'ZEN', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `volume`
--

CREATE TABLE `volume` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `value` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `volume`
--

INSERT INTO `volume` (`id`, `date`, `value`) VALUES
(2, '2018-04-24 13:00:00', 1081234),
(9, '2018-04-24 13:44:25', 1081234),
(11, '2018-04-24 13:44:30', 1081234),
(13, '2018-04-24 13:44:35', 1081234),
(15, '2018-04-24 13:44:40', 1081234),
(17, '2018-04-24 13:44:45', 1081234),
(19, '2018-04-24 13:44:50', 1081234);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `value`
--
ALTER TABLE `value`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `volume`
--
ALTER TABLE `volume`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `date` (`date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `value`
--
ALTER TABLE `value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `volume`
--
ALTER TABLE `volume`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
