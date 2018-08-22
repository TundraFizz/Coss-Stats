-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2018 at 07:38 PM
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
-- Table structure for table `access_log`
--

CREATE TABLE `access_log` (
  `id` int(11) NOT NULL,
  `ip` varchar(15) COLLATE latin1_general_ci NOT NULL,
  `hits` int(11) NOT NULL,
  `last_seen` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `access_log`
--

INSERT INTO `access_log` (`id`, `ip`, `hits`, `last_seen`) VALUES
(1, '98.148.224.226', 62, '2018-06-25 06:29:14'),
(3, '71.6.146.186', 2, '2018-06-21 08:15:35'),
(4, '93.170.4.67', 1, '2018-06-21 15:05:45'),
(5, '89.176.31.24', 2, '2018-06-21 15:06:01'),
(6, '184.105.139.67', 1, '2018-06-21 15:09:07'),
(7, '12.181.50.5', 332, '2018-06-25 20:24:10'),
(8, '185.35.63.133', 1, '2018-06-21 18:43:40'),
(9, '42.225.171.134', 1, '2018-06-21 20:50:28'),
(10, '139.55.31.102', 1, '2018-06-21 20:54:28'),
(11, '79.181.42.126', 1, '2018-06-21 21:19:52'),
(12, '158.85.81.117', 1, '2018-06-22 12:48:10'),
(13, '107.77.229.215', 1, '2018-06-22 18:55:56'),
(14, '174.233.133.183', 1, '2018-06-22 21:10:30'),
(15, '2.29.6.110', 1, '2018-06-22 23:34:36'),
(16, '138.246.253.5', 1, '2018-06-23 00:11:24'),
(17, '139.162.116.133', 1, '2018-06-23 07:13:25'),
(18, '139.162.78.135', 1, '2018-06-23 11:46:09'),
(19, '192.241.196.208', 1, '2018-06-23 22:33:50'),
(20, '71.84.169.90', 1, '2018-06-24 01:14:24'),
(21, '185.35.63.234', 1, '2018-06-25 02:13:38'),
(22, 'testing', 116, '2018-06-28 09:32:49');

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `question` text COLLATE latin1_general_ci NOT NULL,
  `answer` text COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `question`, `answer`) VALUES
(1, 'Is this website affiliated with the official COSS website or company?', 'No, this is just a fan-made tool I wanted to make and sure with others.'),
(2, 'How often will this website be updated?', 'Sporadically, whenever I find time to do so.'),
(3, 'Why does the countdown on the first page go to negative days/hours/mins/secs?', 'The exact ETH block that the FSA occurs isn\'t automatically retrieved, so it\'s something I need to do manually. I plan on automating this in a future update.'),
(4, 'This website is confusing, how does everything work?', 'A full guide and explanation can be found at the <a href=\"https://google.com\" target=\"_blank\">Reddit thread</a>'),
(5, 'Why doesn\'t the \"show math\" button on the Calculators page doesn\'t do anything?', 'That feature isn\'t completed yet.');

-- --------------------------------------------------------

--
-- Table structure for table `feedback_ip`
--

CREATE TABLE `feedback_ip` (
  `id` int(11) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `feedback_ip`
--

INSERT INTO `feedback_ip` (`id`, `ip`, `date`) VALUES
(6, '12.181.50.5', '2018-06-21 17:05:34'),
(7, '107.77.229.215', '2018-06-22 18:56:45');

-- --------------------------------------------------------

--
-- Table structure for table `next_eth_block`
--

CREATE TABLE `next_eth_block` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `next_eth_block`
--

INSERT INTO `next_eth_block` (`id`, `date`) VALUES
(1, '2018-06-25 08:00:00');

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
(1, 'Aditus', 'ADI', 'ADI', '0.0182694', '1'),
(2, 'Ark', 'ARK', 'ARK', '1.27391', '0'),
(3, 'Bitcoin Cash', 'BCH', 'BCH', '703.954', '0'),
(4, 'Bluzelle', 'BLZ', 'BLZ', '0.227609', '1'),
(5, 'Bancor', 'BNT', 'BNT', '2.84892', '1'),
(6, 'Blockpool', 'BPL', 'BPL', '0.0774909', 'DISABLED'),
(7, 'Bitcoin', 'BTC', 'BTC', '6115.08', '0'),
(8, '', 'BWT', 'BWT', NULL, '1'),
(9, 'CanYaCoin', 'CAN', 'CAN', '0.112913', '1'),
(10, 'COSS', 'COSS', 'COSS', '0.115621', '1'),
(11, 'Verify', 'CRED', 'CRED', '0.068845', '0'),
(12, 'Credits', 'CS', 'CS', '0.284698', '0'),
(13, 'Civic', 'CVC', 'CVC', '0.174455', '1'),
(14, 'Dash', 'DASH', 'DASH', '222.343', '0'),
(15, 'Datum', 'DAT', 'DAT', '0.0172447', '1'),
(16, 'Enjin Coin', 'ENJ', 'ENJ', '0.0536161', '1'),
(17, 'EOS', 'EOS', 'EOS', '7.89043', '1'),
(18, 'Ethereum', 'ETH', 'ETH', '437.708', 'ETH'),
(19, 'FidentiaX', 'FDX', 'FDX', '0.0256556', '1'),
(20, 'Fitrova', 'FRV', 'FRV', '0.0000269399', '1'),
(21, 'FuzeX', 'FXT', 'FXT', '0.0295401', '1'),
(22, 'FundYourselfNow', 'FYN', 'FYN', '0.665791', '1'),
(23, 'Gatcoin', 'GAT', 'GAT', '0.00416403', '1'),
(24, '', 'H2O', 'H2O', NULL, '1'),
(25, 'HelloGold', 'HGT', 'HGT', '0.00875044', '1'),
(26, 'ICON', 'ICX', 'ICX', '1.51697', '1'),
(27, 'Indorse Token', 'IND', 'IND', '0.0606994', '1'),
(28, 'Intelligent Trading Foundation', 'ITT', 'ITT', '0.0462197', '1'),
(29, 'Jetcoin', 'JET', 'JET', '0.0632364', '1'),
(30, 'Kin', 'KIN', 'KIN', '0.000141135', '1'),
(31, 'Kyber Network', 'KNC', 'KNC', '0.823715', '1'),
(32, '', 'LA', 'LA', NULL, '1'),
(33, 'LALA World', 'LALA', 'LALA', '0.0246024', '1'),
(34, '', 'LAN', 'LAN', NULL, '1'),
(35, 'ChainLink', 'LINK', 'LINK', '0.174652', '1'),
(36, 'Lisk', 'LSK', 'LSK', '5.28751', '0'),
(37, 'Litecoin', 'LTC', 'LTC', '80.4195', '0'),
(38, 'MARK.SPACE', 'MRK', 'MRK', '0.0269706', '1'),
(39, 'Nitro', 'NOX', 'NOX', '0.0757727', '1'),
(40, 'OmiseGO', 'OMG', 'OMG', '7.25311', '1'),
(41, 'TenX', 'PAY', 'PAY', '0.487703', '1'),
(42, '', 'PGT', 'PGT', NULL, '1'),
(43, 'Lampix', 'PIX', 'PIX', '0.012552', '1'),
(44, 'Po.et', 'POE', 'POE', '0.013216', '1'),
(45, 'Privatix', 'PRIX', 'PRIX', '3.09892', '1'),
(46, 'Request Network', 'REQ', 'REQ', '0.0711789', '1'),
(47, 'Sentinel Chain', 'SENC', 'SENC', '0.0301416', '1'),
(48, '', 'SMDX', 'SMDX', NULL, '1'),
(49, 'SONM', 'SNM', 'SNM', '0.169261', '1'),
(50, 'Stox', 'STX', 'STX', '0.189406', '1'),
(51, 'Substratum', 'SUB', 'SUB', '0.194928', '1'),
(52, '', 'TEU', 'TEU', NULL, '1'),
(53, 'Tigereum', 'TIG', 'TIG', '0.0385623', '1'),
(54, 'TrakInvest', 'TRAK', 'TRAK', '0.0170186', '1'),
(55, 'Upfiring', 'UFR', 'UFR', '0.119318', '0'),
(56, 'United States Dollar', 'USD', 'USD', NULL, '0'),
(57, 'VeChain', 'VEN', 'VEN', '2.56699', '1'),
(58, 'Vezt', 'VZT', 'VZT', '0.039996', '1'),
(59, 'Waves', 'WAVES', 'WAVES', '2.68267', '0'),
(60, 'MyWish', 'WISH', 'WISH', '0.0967068', '1'),
(61, 'Waltonchain', 'WTC', 'WTC', '6.01495', '1'),
(62, 'XinFin Network', 'XDCE', 'XDCE', '0.00398262', '1'),
(63, 'NEM', 'XEM', 'XEM', '0.150521', '0'),
(64, 'Ink Protocol', 'XNK', 'XNK', '0.0214188', '0'),
(65, 'ZenCash', 'ZEN', 'ZEN', '17.3093', 'DISABLED');

-- --------------------------------------------------------

--
-- Table structure for table `volume`
--

CREATE TABLE `volume` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `volume` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `volume`
--

INSERT INTO `volume` (`id`, `date`, `volume`) VALUES
(184, '2018-06-18 00:00:00', 1377138),
(186, '2018-06-18 01:00:00', 1418065),
(188, '2018-06-18 02:00:00', 1392611),
(190, '2018-06-18 03:00:00', 1408977),
(192, '2018-06-18 04:00:00', 1405075),
(194, '2018-06-18 05:00:00', 1414463),
(196, '2018-06-18 06:00:00', 1458762),
(198, '2018-06-18 07:00:00', 1472373),
(200, '2018-06-18 08:00:00', 1648793),
(202, '2018-06-18 09:00:00', 1723640),
(204, '2018-06-18 10:00:00', 1675757),
(206, '2018-06-18 11:00:00', 1404883),
(208, '2018-06-18 12:00:00', 1415697),
(210, '2018-06-18 13:00:00', 1443659),
(212, '2018-06-18 14:00:00', 1410723),
(214, '2018-06-18 15:00:00', 1538553),
(216, '2018-06-18 16:00:00', 1534163),
(218, '2018-06-18 17:00:00', 1507955),
(220, '2018-06-18 18:00:00', 1389788),
(222, '2018-06-18 19:00:00', 1196505),
(224, '2018-06-18 20:00:00', 1193877),
(226, '2018-06-18 21:00:00', 1256888),
(228, '2018-06-18 22:00:00', 1285490),
(230, '2018-06-18 23:00:00', 1286156),
(231, '2018-06-20 00:00:00', 1300000),
(232, '2018-06-20 01:00:00', 1500000),
(233, '2018-06-20 02:00:00', 1700000),
(242, '2018-06-20 03:00:00', 1996513),
(244, '2018-06-20 04:00:00', 2044210),
(246, '2018-06-20 05:00:00', 2001845),
(248, '2018-06-20 06:00:00', 2025511),
(250, '2018-06-20 07:00:00', 1981846),
(254, '2018-06-20 08:00:00', 2045237),
(258, '2018-06-20 09:00:00', 1733047),
(262, '2018-06-20 10:00:00', 1645177),
(266, '2018-06-20 11:00:00', 1418182),
(270, '2018-06-20 12:00:00', 1144214),
(274, '2018-06-20 13:00:00', 971451),
(278, '2018-06-20 14:00:00', 995162),
(282, '2018-06-20 15:00:00', 1103442),
(286, '2018-06-20 16:00:00', 1245782),
(290, '2018-06-20 17:00:00', 1331164),
(294, '2018-06-20 18:00:00', 1249199),
(298, '2018-06-20 19:00:00', 1193351),
(302, '2018-06-20 20:00:00', 1229078),
(306, '2018-06-20 21:00:00', 1515483),
(310, '2018-06-20 22:00:00', 1545857),
(314, '2018-06-20 23:00:00', 1482190),
(318, '2018-06-21 00:00:00', 1508704),
(322, '2018-06-21 01:00:00', 1605677),
(324, '2018-06-21 02:00:00', 1592322),
(326, '2018-06-21 03:00:00', 1566352),
(328, '2018-06-21 04:00:00', 1624124),
(330, '2018-06-21 05:00:00', 1583084),
(332, '2018-06-21 06:00:00', 1560706),
(334, '2018-06-21 07:00:00', 1582379),
(336, '2018-06-21 08:00:00', 1678290),
(338, '2018-06-21 09:00:00', 1542077),
(340, '2018-06-21 10:00:00', 1520473),
(342, '2018-06-21 11:00:00', 1468845),
(344, '2018-06-21 12:00:00', 1507367),
(346, '2018-06-21 13:00:00', 1458691),
(348, '2018-06-21 14:00:00', 1611836),
(350, '2018-06-21 15:00:00', 1707069),
(352, '2018-06-21 16:00:00', 1622038),
(354, '2018-06-21 17:00:00', 1544674),
(356, '2018-06-21 18:00:00', 1571588),
(358, '2018-06-21 19:00:00', 1661307),
(360, '2018-06-21 20:00:00', 1620542),
(362, '2018-06-21 21:00:00', 1856373),
(364, '2018-06-21 22:00:00', 1723820),
(366, '2018-06-21 23:00:00', 1641205),
(368, '2018-06-22 00:00:00', 1690107),
(370, '2018-06-22 01:00:00', 1680512),
(372, '2018-06-22 02:00:00', 1606951),
(374, '2018-06-22 03:00:00', 1612481),
(376, '2018-06-22 04:00:00', 1624113),
(378, '2018-06-22 05:00:00', 1577282),
(380, '2018-06-22 06:00:00', 1582373),
(382, '2018-06-22 07:00:00', 1591568),
(384, '2018-06-22 08:00:00', 1515582),
(386, '2018-06-22 09:00:00', 1496092),
(388, '2018-06-22 10:00:00', 1543673),
(390, '2018-06-22 11:00:00', 1607233),
(392, '2018-06-22 12:00:00', 1604258),
(394, '2018-06-22 13:00:00', 1733055),
(396, '2018-06-22 14:00:00', 1688044),
(398, '2018-06-22 15:00:00', 1685996),
(400, '2018-06-22 16:00:00', 1550644),
(402, '2018-06-22 17:00:00', 1518544),
(404, '2018-06-22 18:00:00', 1608433),
(406, '2018-06-22 19:00:00', 1525379),
(408, '2018-06-22 20:00:00', 1411906),
(410, '2018-06-22 21:00:00', 1296567),
(412, '2018-06-22 22:00:00', 1159765),
(414, '2018-06-22 23:00:00', 1133802),
(416, '2018-06-23 00:00:00', 1129087),
(418, '2018-06-23 01:00:00', 1139047),
(420, '2018-06-23 02:00:00', 1118528),
(422, '2018-06-23 03:00:00', 1109734),
(424, '2018-06-23 04:00:00', 1091295),
(426, '2018-06-23 05:00:00', 1092563),
(428, '2018-06-23 06:00:00', 1142385),
(430, '2018-06-23 07:00:00', 1094709),
(432, '2018-06-23 08:00:00', 1079106),
(434, '2018-06-23 09:00:00', 1134918),
(436, '2018-06-23 10:00:00', 1082760),
(438, '2018-06-23 11:00:00', 1174233),
(440, '2018-06-23 12:00:00', 1115498),
(442, '2018-06-23 13:00:00', 1261033),
(444, '2018-06-23 14:00:00', 1257892),
(446, '2018-06-23 15:00:00', 1282226),
(448, '2018-06-23 16:00:00', 1210964),
(450, '2018-06-23 17:00:00', 1180749),
(452, '2018-06-23 18:00:00', 1183207),
(454, '2018-06-23 19:00:00', 1054677),
(456, '2018-06-23 20:00:00', 1100751),
(458, '2018-06-23 21:00:00', 1057178),
(460, '2018-06-23 22:00:00', 1091657),
(462, '2018-06-23 23:00:00', 1120299),
(464, '2018-06-24 00:00:00', 1116363),
(466, '2018-06-24 01:00:00', 1098987),
(468, '2018-06-24 02:00:00', 1095348),
(470, '2018-06-24 03:00:00', 1127983),
(472, '2018-06-24 04:00:00', 1120382),
(474, '2018-06-24 05:00:00', 1094406),
(476, '2018-06-24 06:00:00', 1074837),
(478, '2018-06-24 07:00:00', 1032196),
(480, '2018-06-24 22:00:00', 1178652),
(482, '2018-06-24 23:00:00', 1210817),
(484, '2018-06-25 00:00:00', 1266811),
(486, '2018-06-25 01:00:00', 1305463),
(488, '2018-06-25 02:00:00', 1353649),
(490, '2018-06-25 03:00:00', 1354666),
(492, '2018-06-25 04:00:00', 1396674),
(494, '2018-06-25 05:00:00', 1491089),
(496, '2018-06-25 06:00:00', 1522424),
(498, '2018-06-25 07:00:00', 1515018),
(500, '2018-06-25 08:00:00', 1478389),
(502, '2018-06-25 09:00:00', 1399576),
(504, '2018-06-25 10:00:00', 1441759),
(506, '2018-06-25 11:00:00', 1449901),
(508, '2018-06-25 12:00:00', 1582548),
(510, '2018-06-25 13:00:00', 1815321),
(512, '2018-06-25 14:00:00', 2080852),
(514, '2018-06-25 18:00:00', 2714876),
(516, '2018-06-25 19:00:00', 2729746),
(518, '2018-06-25 20:00:00', 2979881),
(522, '2018-06-25 15:00:00', 3430274),
(524, '2018-06-25 16:00:00', 3379130);

-- --------------------------------------------------------

--
-- Table structure for table `weekly_rewards`
--

CREATE TABLE `weekly_rewards` (
  `id` int(11) NOT NULL,
  `eth_block` varchar(20) NOT NULL,
  `date` datetime NOT NULL,
  `volume` bigint(20) NOT NULL,
  `value` varchar(20) NOT NULL,
  `Fee` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `weekly_rewards`
--

INSERT INTO `weekly_rewards` (`id`, `eth_block`, `date`, `volume`, `value`, `Fee`) VALUES
(1, '5729716', '2018-06-04 08:00:00', 1600000, '0.000096634311', ''),
(2, '5769166', '2018-06-11 08:00:00', 2558000, '0.000096634311', ''),
(3, '5809771', '2018-06-18 08:00:00', 1290000, '0.000096634311', ''),
(4, '5850709', '2018-06-25 08:00:00', 1418000, '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_log`
--
ALTER TABLE `access_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback_ip`
--
ALTER TABLE `feedback_ip`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ip` (`ip`);

--
-- Indexes for table `next_eth_block`
--
ALTER TABLE `next_eth_block`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `access_log`
--
ALTER TABLE `access_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `feedback_ip`
--
ALTER TABLE `feedback_ip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `next_eth_block`
--
ALTER TABLE `next_eth_block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `value`
--
ALTER TABLE `value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `volume`
--
ALTER TABLE `volume`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=525;

--
-- AUTO_INCREMENT for table `weekly_rewards`
--
ALTER TABLE `weekly_rewards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
