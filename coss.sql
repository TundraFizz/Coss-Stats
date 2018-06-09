-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2018 at 12:44 AM
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
  `value` varchar(20) DEFAULT NULL,
  `fee` varchar(10) DEFAULT NULL COMMENT '0 = No fee; 1 = 0.001 ETH'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `value`
--

INSERT INTO `value` (`id`, `name`, `symbol_cmc`, `symbol_coss`, `value`, `fee`) VALUES
(1, 'Aditus', 'ADI', 'ADI', '0.0197484', '1'),
(2, 'Ark', 'ARK', 'ARK', '2.35142', '0'),
(3, 'Bitcoin Cash', 'BCH', 'BCH', '1123.22', '0'),
(4, 'Bluzelle', 'BLZ', 'BLZ', '0.432765', '1'),
(5, 'Bancor', 'BNT', 'BNT', '4.08834', '1'),
(6, 'Blockpool', 'BPL', 'BPL', '0.150681', 'DISABLED'),
(7, 'Bitcoin', 'BTC', 'BTC', '7647.31', '0'),
(8, '', 'BWT', 'BWT', NULL, '1'),
(9, 'CanYaCoin', 'CAN', 'CAN', '0.149076', '1'),
(10, 'COSS', 'COSS', 'COSS', '0.172245', '1'),
(11, 'Verify', 'CRED', 'CRED-VERIFY', '0.138526', '0'),
(12, 'Credits', 'CS', 'CREDITS', '0.462913', '0'),
(13, 'Civic', 'CVC', 'CVC', '0.29405', '1'),
(14, 'Dash', 'DASH', 'DASH', '310.638', '0'),
(15, 'Datum', 'DAT', 'DAT', '0.0224621', '1'),
(16, 'Enjin Coin', 'ENJ', 'ENJ', '0.105668', '1'),
(17, 'EOS', 'EOS', 'EOS', '14.1334', '1'),
(18, 'Ethereum', 'ETH', 'ETH', '602.817', 'ETH'),
(19, 'FidentiaX', 'FDX', 'FDX', '0.0453518', '1'),
(20, 'Fitrova', 'FRV', 'FRV', '0.000138848', '1'),
(21, 'FuzeX', 'FXT', 'FXT', '0.0541771', '1'),
(22, 'FundYourselfNow', 'FYN', 'FYN', '0.932561', '1'),
(23, 'Gatcoin', 'GAT', 'GAT', '0.00652539', '1'),
(24, '', 'H2O', 'H2O', NULL, '1'),
(25, 'HelloGold', 'HGT', 'HGT', '0.0143368', '1'),
(26, 'ICON', 'ICX', 'ICX', '2.59525', '1'),
(27, 'Indorse Token', 'IND', 'IND', '0.0616057', '1'),
(28, 'Intelligent Trading Foundation', 'ITT', 'ITT', '0.0466632', '1'),
(29, 'Jetcoin', 'JET', 'JET', '0.0604579', '1'),
(30, 'Kin', 'KIN', 'KIN', '0.000184293', '1'),
(31, 'Kyber Network', 'KNC', 'KNC', '1.37133', '1'),
(32, '', 'LA', 'LA', NULL, '1'),
(33, 'LALA World', 'LALA', 'LALA', '0.0749307', '1'),
(34, '', 'LAN', 'LAN', NULL, '1'),
(35, 'ChainLink', 'LINK', 'LINK', '0.301931', '1'),
(36, 'Lisk', 'LSK', 'LSK', '8.63477', '0'),
(37, 'Litecoin', 'LTC', 'LTC', '120.282', '0'),
(38, 'MARK.SPACE', 'MRK', 'MRK', '0.0472353', '1'),
(39, 'Nitro', 'NOX', 'NOX', '0.187005', '1'),
(40, 'OmiseGO', 'OMG', 'OMG', '11.1214', '1'),
(41, 'TenX', 'PAY', 'PAY', '0.886979', '1'),
(42, '', 'PGT', 'PGT', NULL, '1'),
(43, 'Lampix', 'PIX', 'PIX', '0.0191143', '1'),
(44, 'Po.et', 'POE', 'POE', '0.0267202', '1'),
(45, 'Privatix', 'PRIX', 'PRIX', '4.65908', '1'),
(46, 'Request Network', 'REQ', 'REQ', '0.125029', '1'),
(47, 'Sentinel Chain', 'SENC', 'SENC', '0.0693899', '1'),
(48, '', 'SMDX', 'SMDX', NULL, '1'),
(49, 'SONM', 'SNM', 'SNM', '0.178579', '1'),
(50, 'Stox', 'STX', 'STX', '0.363352', '1'),
(51, 'Substratum', 'SUB', 'SUB', '0.378528', '1'),
(52, '', 'TEU', 'TEU', NULL, '1'),
(53, 'Tigereum', 'TIG', 'TIG', '0.0755313', '1'),
(54, 'TrakInvest', 'TRAK', 'TRAK', '0.0208794', '1'),
(55, 'Upfiring', 'UFR', 'UFR', '0.169846', '0'),
(56, 'United States Dollar', 'USD', 'USD', NULL, '0'),
(57, 'VeChain', 'VEN', 'VEN', '4.04029', '1'),
(58, 'Vezt', 'VZT', 'VZT', '0.053768', '1'),
(59, 'Waves', 'WAVES', 'WAVES', '4.64231', '0'),
(60, 'MyWish', 'WISH', 'WISH', '0.149112', '1'),
(61, 'Waltonchain', 'WTC', 'WTC', '11.9966', '1'),
(62, 'XinFin Network', 'XDCE', 'XDCE', '0.00563064', '1'),
(63, 'NEM', 'XEM', 'XEM', '0.253237', '0'),
(64, 'Ink Protocol', 'XNK', 'XNK', '0.0363587', '0'),
(65, 'ZenCash', 'ZEN', 'ZEN', '22.6124', 'DISABLED');

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
(10, '2018-06-08 16:00:00', 2648784);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `weekly_rewards`
--
ALTER TABLE `weekly_rewards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
