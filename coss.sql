-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2018 at 08:11 PM
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
(1, 'LALA World', 'LALA', 'LALA', NULL),
(2, 'Aditus', 'ADI', 'ADI', NULL),
(3, 'Bitcoin Cash', 'BCH', 'BCH', NULL),
(4, 'Bluzelle', 'BLZ', 'BLZ', NULL),
(5, 'Bancor', 'BNT', 'BNT', NULL),
(6, 'Blockpool', 'BPL', 'BPL', NULL),
(7, 'Bitcoin', 'BTC', 'BTC', NULL),
(8, '', 'BWT', 'BWT', NULL),
(9, 'CanYaCoin', 'CAN', 'CAN', NULL),
(10, 'COSS', 'COSS', 'COSS', NULL),
(11, 'Verify', 'CRED', 'CRED-VERIFY', NULL),
(12, 'Credits', 'CS', 'CREDITS', NULL),
(13, 'Civic', 'CVC', 'CVC', NULL),
(14, 'Dash', 'DASH', 'DASH', NULL),
(15, 'Datum', 'DAT', 'DAT', NULL),
(16, 'Enjin Coin', 'ENJ', 'ENJ', NULL),
(17, 'EOS', 'EOS', 'EOS', NULL),
(18, 'Ethereum', 'ETH', 'ETH', NULL),
(19, 'FidentiaX', 'FDX', 'FDX', NULL),
(20, 'Fitrova', 'FRV', 'FRV', NULL),
(21, 'FuzeX', 'FXT', 'FXT', NULL),
(22, 'FundYourselfNow', 'FYN', 'FYN', NULL),
(23, 'Gatcoin', 'GAT', 'GAT', NULL),
(24, '', 'H2O', 'H2O', NULL),
(25, 'HelloGold', 'HGT', 'HGT', NULL),
(26, 'ICON', 'ICX', 'ICX', NULL),
(27, 'Indorse Token', 'IND', 'IND', NULL),
(28, 'Intelligent Trading Foundation', 'ITT', 'ITT', NULL),
(29, 'Jetcoin', 'JET', 'JET', NULL),
(30, 'Kin', 'KIN', 'KIN', NULL),
(31, 'Kyber Network', 'KNC', 'KNC', NULL),
(32, '', 'LA', 'LA', NULL),
(33, 'Ark', 'ARK', 'ARK', NULL),
(34, '', 'LAN', 'LAN', NULL),
(35, 'ChainLink', 'LINK', 'LINK', NULL),
(36, 'Lisk', 'LSK', 'LSK', NULL),
(37, 'Litecoin', 'LTC', 'LTC', NULL),
(38, 'MARK.SPACE', 'MRK', 'MRK', NULL),
(39, 'Nitro', 'NOX', 'NOX', NULL),
(40, 'OmiseGO', 'OMG', 'OMG', NULL),
(41, 'TenX', 'PAY', 'PAY', NULL),
(42, '', 'PGT', 'PGT', NULL),
(43, 'Lampix', 'PIX', 'PIX', NULL),
(44, 'Po.et', 'POE', 'POE', NULL),
(45, 'Privatix', 'PRIX', 'PRIX', NULL),
(46, 'Request Network', 'REQ', 'REQ', NULL),
(47, 'Sentinel Chain', 'SENC', 'SENC', NULL),
(48, '', 'SMDX', 'SMDX', NULL),
(49, 'SONM', 'SNM', 'SNM', NULL),
(50, 'Stox', 'STX', 'STX', NULL),
(51, 'Substratum', 'SUB', 'SUB', NULL),
(52, '', 'TEU', 'TEU', NULL),
(53, 'Tigereum', 'TIG', 'TIG', NULL),
(54, 'TrakInvest', 'TRAK', 'TRAK', NULL),
(55, 'Upfiring', 'UFR', 'UFR', NULL),
(56, 'United States Dollar', 'USD', 'USD', NULL),
(57, 'VeChain', 'VEN', 'VEN', NULL),
(58, 'Vezt', 'VZT', 'VZT', NULL),
(59, 'Waves', 'WAVES', 'WAVES', NULL),
(60, 'MyWish', 'WISH', 'WISH', NULL),
(61, 'Waltonchain', 'WTC', 'WTC', NULL),
(62, 'XinFin Network', 'XDCE', 'XDCE', NULL),
(63, 'NEM', 'XEM', 'XEM', NULL),
(64, 'Ink Protocol', 'XNK', 'XNK', NULL),
(65, 'ZenCash', 'ZEN', 'ZEN', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `value`
--
ALTER TABLE `value`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `value`
--
ALTER TABLE `value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
