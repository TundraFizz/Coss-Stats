-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2018 at 09:09 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

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
  `value` varchar(20) DEFAULT NULL,
  `fee` varchar(10) DEFAULT NULL COMMENT '0 = No fee; 1 = 0.001 ETH'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `value`
--

INSERT INTO `value` (`id`, `name`, `symbol_cmc`, `symbol_coss`, `value`, `fee`) VALUES
(1, 'Aditus', 'ADI', 'ADI', '0.0203015', '1'),
(2, 'Ark', 'ARK', 'ARK', '2.17574', '0'),
(3, 'Bitcoin Cash', 'BCH', 'BCH', '1046.59', '0'),
(4, 'Bluzelle', 'BLZ', 'BLZ', '0.385867', '1'),
(5, 'Bancor', 'BNT', 'BNT', '3.88309', '1'),
(6, 'Blockpool', 'BPL', 'BPL', '0.135209', 'DISABLED'),
(7, 'Bitcoin', 'BTC', 'BTC', '7337.87', '0'),
(8, '', 'BWT', 'BWT', NULL, '1'),
(9, 'CanYaCoin', 'CAN', 'CAN', '0.133152', '1'),
(10, 'COSS', 'COSS', 'COSS', '0.162375', '1'),
(11, 'Verify', 'CRED', 'CRED-VERIFY', '0.151505', '0'),
(12, 'Credits', 'CS', 'CREDITS', '0.413678', '0'),
(13, 'Civic', 'CVC', 'CVC', '0.257966', '1'),
(14, 'Dash', 'DASH', 'DASH', '290.024', '0'),
(15, 'Datum', 'DAT', 'DAT', '0.0205813', '1'),
(16, 'Enjin Coin', 'ENJ', 'ENJ', '0.0965338', '1'),
(17, 'EOS', 'EOS', 'EOS', '13.3279', '1'),
(18, 'Ethereum', 'ETH', 'ETH', '576.232', 'ETH'),
(19, 'FidentiaX', 'FDX', 'FDX', '0.0459919', '1'),
(20, 'Fitrova', 'FRV', 'FRV', '0.000110353', '1'),
(21, 'FuzeX', 'FXT', 'FXT', '0.0496399', '1'),
(22, 'FundYourselfNow', 'FYN', 'FYN', '0.837298', '1'),
(23, 'Gatcoin', 'GAT', 'GAT', '0.00593689', '1'),
(24, '', 'H2O', 'H2O', NULL, '1'),
(25, 'HelloGold', 'HGT', 'HGT', '0.0109769', '1'),
(26, 'ICON', 'ICX', 'ICX', '2.37961', '1'),
(27, 'Indorse Token', 'IND', 'IND', '0.057885', '1'),
(28, 'Intelligent Trading Foundation', 'ITT', 'ITT', '0.0445324', '1'),
(29, 'Jetcoin', 'JET', 'JET', '0.0593306', '1'),
(30, 'Kin', 'KIN', 'KIN', '0.000186128', '1'),
(31, 'Kyber Network', 'KNC', 'KNC', '1.23674', '1'),
(32, '', 'LA', 'LA', NULL, '1'),
(33, 'LALA World', 'LALA', 'LALA', '0.0699524', '1'),
(34, '', 'LAN', 'LAN', NULL, '1'),
(35, 'ChainLink', 'LINK', 'LINK', '0.279357', '1'),
(36, 'Lisk', 'LSK', 'LSK', '8.03661', '0'),
(37, 'Litecoin', 'LTC', 'LTC', '114.904', '0'),
(38, 'MARK.SPACE', 'MRK', 'MRK', '0.0406495', '1'),
(39, 'Nitro', 'NOX', 'NOX', '0.16327', '1'),
(40, 'OmiseGO', 'OMG', 'OMG', '10.2854', '1'),
(41, 'TenX', 'PAY', 'PAY', '0.800137', '1'),
(42, '', 'PGT', 'PGT', NULL, '1'),
(43, 'Lampix', 'PIX', 'PIX', '0.0219817', '1'),
(44, 'Po.et', 'POE', 'POE', '0.0244656', '1'),
(45, 'Privatix', 'PRIX', 'PRIX', '4.50437', '1'),
(46, 'Request Network', 'REQ', 'REQ', '0.115092', '1'),
(47, 'Sentinel Chain', 'SENC', 'SENC', '0.0595098', '1'),
(48, '', 'SMDX', 'SMDX', NULL, '1'),
(49, 'SONM', 'SNM', 'SNM', '0.16867', '1'),
(50, 'Stox', 'STX', 'STX', '0.344159', '1'),
(51, 'Substratum', 'SUB', 'SUB', '0.343376', '1'),
(52, '', 'TEU', 'TEU', NULL, '1'),
(53, 'Tigereum', 'TIG', 'TIG', '0.0708333', '1'),
(54, 'TrakInvest', 'TRAK', 'TRAK', '0.0195545', '1'),
(55, 'Upfiring', 'UFR', 'UFR', '0.166073', '0'),
(56, 'United States Dollar', 'USD', 'USD', NULL, '0'),
(57, 'VeChain', 'VEN', 'VEN', '3.72536', '1'),
(58, 'Vezt', 'VZT', 'VZT', '0.0573812', '1'),
(59, 'Waves', 'WAVES', 'WAVES', '4.0975', '0'),
(60, 'MyWish', 'WISH', 'WISH', '0.145225', '1'),
(61, 'Waltonchain', 'WTC', 'WTC', '10.9666', '1'),
(62, 'XinFin Network', 'XDCE', 'XDCE', '0.00559579', '1'),
(63, 'NEM', 'XEM', 'XEM', '0.241268', '0'),
(64, 'Ink Protocol', 'XNK', 'XNK', '0.0336418', '0'),
(65, 'ZenCash', 'ZEN', 'ZEN', '20.3048', 'DISABLED');

-- --------------------------------------------------------

--
-- Table structure for table `volume`
--

CREATE TABLE `volume` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `volume` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `volume`
--

INSERT INTO `volume` (`id`, `date`, `volume`) VALUES
(1, '2018-06-08 11:00:00', 2827844),
(2, '2018-06-08 12:00:00', 2865812),
(4, '2018-06-08 13:00:00', 2905478),
(6, '2018-06-08 14:00:00', 2835281),
(8, '2018-06-08 15:00:00', 2882813),
(10, '2018-06-08 16:00:00', 2648784),
(11, '2018-06-09 15:00:00', 1114470),
(12, '2018-06-09 16:00:00', 1114220),
(14, '2018-06-09 17:00:00', 1139819),
(16, '2018-06-09 18:00:00', 1176959),
(18, '2018-06-09 19:00:00', 1151870),
(20, '2018-06-09 20:00:00', 1123616),
(22, '2018-06-09 21:00:00', 1962627),
(24, '2018-06-09 22:00:00', 1589455),
(26, '2018-06-09 23:00:00', 1532301),
(28, '2018-06-10 00:00:00', 1534627);

-- --------------------------------------------------------

--
-- Table structure for table `weekly_rewards`
--

CREATE TABLE `weekly_rewards` (
  `id` int(11) NOT NULL,
  `eth_block` varchar(20) NOT NULL,
  `date` datetime NOT NULL,
  `volume` bigint(20) NOT NULL,
  `value` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `weekly_rewards`
--

INSERT INTO `weekly_rewards` (`id`, `eth_block`, `date`, `volume`, `value`) VALUES
(1, '5729716', '2018-06-04 01:00:00', 2500000, '0.000096634311');

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
-- Indexes for table `weekly_rewards`
--
ALTER TABLE `weekly_rewards`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `weekly_rewards`
--
ALTER TABLE `weekly_rewards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
