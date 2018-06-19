-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Generation Time: Jun 19, 2018 at 04:12 AM
-- Server version: 8.0.11
-- PHP Version: 7.2.5

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
-- Table structure for table `next_eth_block`
--

CREATE TABLE `next_eth_block` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `next_eth_block`
--

INSERT INTO `next_eth_block` (`id`, `date`) VALUES
(1, '2018-06-18 01:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'coss', 'volume', '{\"sorted_col\":\"`volume`.`id`  DESC\"}', '2018-06-17 17:07:05');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2018-06-17 22:29:22', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

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
(1, 'Aditus', 'ADI', 'ADI', '0.01732', '1'),
(2, 'Ark', 'ARK', 'ARK', '1.57131', '0'),
(3, 'Bitcoin Cash', 'BCH', 'BCH', '881.802', '0'),
(4, 'Bluzelle', 'BLZ', 'BLZ', '0.296864', '1'),
(5, 'Bancor', 'BNT', 'BNT', '3.41746', '1'),
(6, 'Blockpool', 'BPL', 'BPL', '0.0823731', 'DISABLED'),
(7, 'Bitcoin', 'BTC', 'BTC', '6723.74', '0'),
(8, '', 'BWT', 'BWT', NULL, '1'),
(9, 'CanYaCoin', 'CAN', 'CAN', '0.122942', '1'),
(10, 'COSS', 'COSS', 'COSS', '0.145142', '1'),
(11, 'Verify', 'CRED', 'CRED-VERIFY', '0.118802', '0'),
(12, 'Credits', 'CS', 'CREDITS', '0.333463', '0'),
(13, 'Civic', 'CVC', 'CVC', '0.202647', '1'),
(14, 'Dash', 'DASH', 'DASH', '268.646', '0'),
(15, 'Datum', 'DAT', 'DAT', '0.0175236', '1'),
(16, 'Enjin Coin', 'ENJ', 'ENJ', '0.0725545', '1'),
(17, 'EOS', 'EOS', 'EOS', '10.5695', '1'),
(18, 'Ethereum', 'ETH', 'ETH', '516.312', 'ETH'),
(19, 'FidentiaX', 'FDX', 'FDX', '0.0326132', '1'),
(20, 'Fitrova', 'FRV', 'FRV', '0.0000741459', '1'),
(21, 'FuzeX', 'FXT', 'FXT', '0.0321424', '1'),
(22, 'FundYourselfNow', 'FYN', 'FYN', '0.738172', '1'),
(23, 'Gatcoin', 'GAT', 'GAT', '0.00465741', '1'),
(24, '', 'H2O', 'H2O', NULL, '1'),
(25, 'HelloGold', 'HGT', 'HGT', '0.0108565', '1'),
(26, 'ICON', 'ICX', 'ICX', '2.06716', '1'),
(27, 'Indorse Token', 'IND', 'IND', '0.0570487', '1'),
(28, 'Intelligent Trading Foundation', 'ITT', 'ITT', '0.0358476', '1'),
(29, 'Jetcoin', 'JET', 'JET', '0.0593265', '1'),
(30, 'Kin', 'KIN', 'KIN', '0.000152063', '1'),
(31, 'Kyber Network', 'KNC', 'KNC', '1.01111', '1'),
(32, '', 'LA', 'LA', NULL, '1'),
(33, 'LALA World', 'LALA', 'LALA', '0.0339583', '1'),
(34, '', 'LAN', 'LAN', NULL, '1'),
(35, 'ChainLink', 'LINK', 'LINK', '0.209103', '1'),
(36, 'Lisk', 'LSK', 'LSK', '6.40025', '0'),
(37, 'Litecoin', 'LTC', 'LTC', '97.8452', '0'),
(38, 'MARK.SPACE', 'MRK', 'MRK', '0.0359946', '1'),
(39, 'Nitro', 'NOX', 'NOX', '0.160383', '1'),
(40, 'OmiseGO', 'OMG', 'OMG', '9.33463', '1'),
(41, 'TenX', 'PAY', 'PAY', '0.620504', '1'),
(42, '', 'PGT', 'PGT', NULL, '1'),
(43, 'Lampix', 'PIX', 'PIX', '0.0169505', '1'),
(44, 'Po.et', 'POE', 'POE', '0.0177777', '1'),
(45, 'Privatix', 'PRIX', 'PRIX', '3.7135', '1'),
(46, 'Request Network', 'REQ', 'REQ', '0.104627', '1'),
(47, 'Sentinel Chain', 'SENC', 'SENC', '0.0479305', '1'),
(48, '', 'SMDX', 'SMDX', NULL, '1'),
(49, 'SONM', 'SNM', 'SNM', '0.197226', '1'),
(50, 'Stox', 'STX', 'STX', '0.260823', '1'),
(51, 'Substratum', 'SUB', 'SUB', '0.278298', '1'),
(52, '', 'TEU', 'TEU', NULL, '1'),
(53, 'Tigereum', 'TIG', 'TIG', '0.0599552', '1'),
(54, 'TrakInvest', 'TRAK', 'TRAK', '0.0175388', '1'),
(55, 'Upfiring', 'UFR', 'UFR', '0.170601', '0'),
(56, 'United States Dollar', 'USD', 'USD', NULL, '0'),
(57, 'VeChain', 'VEN', 'VEN', '3.15641', '1'),
(58, 'Vezt', 'VZT', 'VZT', '0.0402206', '1'),
(59, 'Waves', 'WAVES', 'WAVES', '3.68621', '0'),
(60, 'MyWish', 'WISH', 'WISH', '0.137729', '1'),
(61, 'Waltonchain', 'WTC', 'WTC', '8.66169', '1'),
(62, 'XinFin Network', 'XDCE', 'XDCE', '0.00480801', '1'),
(63, 'NEM', 'XEM', 'XEM', '0.195757', '0'),
(64, 'Ink Protocol', 'XNK', 'XNK', '0.0305441', '0'),
(65, 'ZenCash', 'ZEN', 'ZEN', '19.614', 'DISABLED');

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
(1, '2018-06-11 23:00:00', 1190000),
(2, '2018-06-12 23:00:00', 1530000),
(3, '2018-06-13 23:00:00', 1330000),
(4, '2018-06-14 00:00:00', 978654),
(5, '2018-06-14 04:00:00', 1048520),
(6, '2018-06-14 05:00:00', 994460),
(8, '2018-06-14 06:00:00', 917210),
(10, '2018-06-14 07:00:00', 925169),
(12, '2018-06-14 08:00:00', 932480),
(14, '2018-06-14 09:00:00', 1014527),
(16, '2018-06-14 10:00:00', 979453),
(18, '2018-06-14 11:00:00', 932386),
(20, '2018-06-14 12:00:00', 1092398),
(22, '2018-06-14 13:00:00', 1019819),
(23, '2018-06-14 14:00:00', 1041028),
(25, '2018-06-14 15:00:00', 1109777),
(27, '2018-06-14 16:00:00', 1017597),
(29, '2018-06-14 17:00:00', 1093247),
(31, '2018-06-14 18:00:00', 1147083),
(33, '2018-06-14 19:00:00', 1180805),
(35, '2018-06-14 20:00:00', 1232766),
(37, '2018-06-14 21:00:00', 1235480),
(39, '2018-06-14 22:00:00', 1232383),
(41, '2018-06-14 23:00:00', 1228964),
(43, '2018-06-15 00:00:00', 1158071),
(45, '2018-06-15 01:00:00', 1108940),
(47, '2018-06-15 02:00:00', 1115099),
(49, '2018-06-15 03:00:00', 1086512),
(51, '2018-06-15 04:00:00', 1008285),
(53, '2018-06-15 05:00:00', 966306),
(55, '2018-06-15 06:00:00', 943985),
(57, '2018-06-15 07:00:00', 940086),
(59, '2018-06-15 08:00:00', 963150),
(61, '2018-06-15 09:00:00', 968460),
(63, '2018-06-15 10:00:00', 876118),
(65, '2018-06-15 11:00:00', 906969),
(67, '2018-06-15 12:00:00', 1025749),
(69, '2018-06-15 13:00:00', 1011294),
(71, '2018-06-15 14:00:00', 1116364),
(73, '2018-06-15 15:00:00', 1085892),
(75, '2018-06-15 16:00:00', 1030626),
(77, '2018-06-15 17:00:00', 1060195),
(79, '2018-06-15 18:00:00', 1018719),
(81, '2018-06-15 19:00:00', 919393),
(83, '2018-06-15 20:00:00', 891014),
(85, '2018-06-15 21:00:00', 856166),
(87, '2018-06-15 22:00:00', 859578),
(89, '2018-06-15 23:00:00', 870205),
(91, '2018-06-16 00:00:00', 985242),
(93, '2018-06-16 01:00:00', 977136),
(94, '2018-06-16 02:00:00', 900557),
(96, '2018-06-16 03:00:00', 901278),
(98, '2018-06-16 04:00:00', 903205),
(100, '2018-06-16 05:00:00', 927162),
(102, '2018-06-16 06:00:00', 948456),
(104, '2018-06-16 07:00:00', 985754),
(106, '2018-06-16 08:00:00', 1219604),
(108, '2018-06-16 09:00:00', 1624024),
(110, '2018-06-16 10:00:00', 1700255),
(112, '2018-06-16 11:00:00', 1686680),
(114, '2018-06-16 12:00:00', 1662022),
(116, '2018-06-16 13:00:00', 1465334),
(118, '2018-06-16 14:00:00', 1589731),
(120, '2018-06-16 15:00:00', 1547569),
(122, '2018-06-16 16:00:00', 1508377),
(124, '2018-06-16 17:00:00', 1591974),
(126, '2018-06-16 18:00:00', 1577995),
(128, '2018-06-16 19:00:00', 1556851),
(130, '2018-06-16 20:00:00', 1526098),
(131, '2018-06-16 21:00:00', 1594064),
(133, '2018-06-16 22:00:00', 1605620),
(135, '2018-06-16 23:00:00', 1611981),
(137, '2018-06-17 00:00:00', 1565902),
(139, '2018-06-17 01:00:00', 1494858),
(141, '2018-06-17 02:00:00', 1471408),
(143, '2018-06-17 03:00:00', 1477715),
(145, '2018-06-17 04:00:00', 1482079),
(147, '2018-06-17 05:00:00', 1486105),
(149, '2018-06-17 06:00:00', 1507066),
(150, '2018-06-17 07:00:00', 1735181),
(152, '2018-06-17 08:00:00', 1687252),
(154, '2018-06-17 09:00:00', 1344528),
(156, '2018-06-17 10:00:00', 1331006),
(158, '2018-06-17 11:00:00', 1326549),
(160, '2018-06-17 12:00:00', 1256062),
(162, '2018-06-17 13:00:00', 1274794),
(164, '2018-06-17 14:00:00', 1325020),
(166, '2018-06-17 15:00:00', 1253784),
(168, '2018-06-17 16:00:00', 1264228),
(170, '2018-06-17 17:00:00', 1509119),
(172, '2018-06-17 18:00:00', 1549880),
(174, '2018-06-17 19:00:00', 1613118),
(176, '2018-06-17 20:00:00', 1514457),
(178, '2018-06-17 21:00:00', 1459120),
(180, '2018-06-17 22:00:00', 1424552),
(182, '2018-06-17 23:00:00', 1393436),
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
(232, '2018-06-19 00:00:00', 1285005),
(234, '2018-06-19 01:00:00', 1415715),
(236, '2018-06-19 02:00:00', 1388164),
(238, '2018-06-19 03:00:00', 1349495),
(240, '2018-06-19 04:00:00', 1354270);

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
(1, '5729716', '2018-06-04 01:00:00', 1600000, '0.000096634311', ''),
(2, '5769166', '2018-06-11 16:00:00', 2558000, '0.000096634311', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `next_eth_block`
--
ALTER TABLE `next_eth_block`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

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
-- AUTO_INCREMENT for table `next_eth_block`
--
ALTER TABLE `next_eth_block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `value`
--
ALTER TABLE `value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `volume`
--
ALTER TABLE `volume`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=242;

--
-- AUTO_INCREMENT for table `weekly_rewards`
--
ALTER TABLE `weekly_rewards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
