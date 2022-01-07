-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 30, 2021 at 04:12 PM
-- Server version: 10.3.32-MariaDB-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reports`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateStatusAccount` (IN `acct_idIn` VARCHAR(50))  BEGIN    
     DECLARE  myvar  INT ;

     SELECT `active` into myvar FROM `account` WHERE acct_id = acct_idIn;
     if myvar = 1 then
			UPDATE `account` SET `active` = 0 WHERE `account`.`acct_id` = acct_idIn;
	 elseif myvar = 0 then
	      UPDATE `account` SET `active` = 1 WHERE `account`.`acct_id` = acct_idIn;
	end if;
		
                     
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `acct_id` int(11) NOT NULL,
  `role_group` varchar(50) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `active` int(1) NOT NULL DEFAULT 1,
  `isNew` int(1) NOT NULL DEFAULT 1,
  `last_login` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_created` varchar(255) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_modified` varchar(255) DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`acct_id`, `role_group`, `username`, `password`, `name`, `active`, `isNew`, `last_login`, `user_created`, `date_created`, `user_modified`, `date_modified`) VALUES
(1, 'admin', 'admin', '$2a$08$EUP.RALMB0rkUDUCaU.N..b7XtxnlZmKdRWc/M4xKX35PKw80DmBO', 'Joshua', 1, 1, '2021-09-28 06:51:08', '', '2021-09-18 16:08:50', NULL, '2021-09-27 17:51:08'),
(2, 'Sales Admin', 'sales_admin', '$2a$08$ZyI2UvIiMKFqGtfuTYdlf.7sHiSHKAoXTGXpks3tzGdBdk78FGv6e', 'tonido', 1, 1, '2021-09-28 06:51:22', '', '2021-09-19 01:32:52', NULL, '2021-09-27 17:51:22'),
(29, 'Office Admin', 'office_admin', '$2a$08$msr12R1gyifD3vRown5j9.PPZucoB47.tX1fZwuwuzhG84HBKaKfG', 'office_admin', 1, 1, '2021-10-13 09:08:33', '', '2021-10-12 20:08:33', NULL, '2021-10-12 20:08:33');

-- --------------------------------------------------------

--
-- Table structure for table `column_names`
--

CREATE TABLE `column_names` (
  `col_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `col_name` varchar(50) NOT NULL,
  `isrequired` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `column_names`
--

INSERT INTO `column_names` (`col_id`, `name`, `col_name`, `isrequired`) VALUES
(1, 'Sold To', 'sold_to', 0),
(3, 'Delivered To', 'delivered_to', 0),
(4, 'Ship To', 'ship_to', 0),
(5, 'Address', 'address', 0),
(6, 'TIN', 'tin', 0),
(7, 'Business Style', 'business_style', 0),
(8, 'Account Manager', 'account_man', 0),
(9, 'SO #', 'so_no', 0),
(10, 'Contact Person', 'contact_p', 0),
(11, 'Contact #', 'contact_no', 0),
(12, 'PO #', 'po_no', 0),
(13, 'Terms', 'terms', 0),
(14, 'Date', 'date', 0),
(15, 'Quantity', 'quantity', 0),
(16, 'Item Code', 'item_code', 0),
(17, 'Particulars', 'particulars', 0),
(18, 'Total Sales', 'total_sales', 0),
(19, 'Value-Added Tax', 'added_tax', 0),
(20, 'Total Payment', 'total_payment', 0),
(21, 'Total Due', 'total_due', 0),
(22, 'Unit Price', 'unit_price', 0),
(23, 'Amount', 'amount', 0),
(26, 'Category', 'category', 0),
(27, 'Type', 'type', 0),
(28, 'Brand', 'brand', 0),
(29, 'Model', 'model', 0),
(30, 'Serial no', 'serial_no', 0),
(31, 'License', 'license', 0),
(32, 'Hard Drive', 'hard_drive', 0),
(33, 'Ram', 'ram', 0),
(34, 'Processor', 'processor', 0),
(35, 'Others', 'others', 0),
(36, 'Date Received', 'si_date_received', 0),
(37, 'Date Released', 'si_date_released', 0),
(38, 'Date Paid', 'si_date_paid', 0),
(39, 'Customer', 'customer', 0),
(40, 'Date Release', 'date_release', 0),
(41, 'Date Returned', 'date_returned', 0),
(42, 'Comment', 'comment', 0),
(43, 'Item Code', 'item_code', 0),
(44, 'Status', 'status', 0),
(45, 'Customer ID', 'customer_id', 0),
(46, 'Vendor', 'vendor_detials', 0),
(47, 'Shipping Method', 'shipping_method', 0),
(48, 'Payment Terms', 'payment_terms', 0),
(49, 'Delivery/Pick-Up Date', 'del_pick', 0),
(50, 'SKU #', 'sku', 0),
(51, 'Description', 'description', 0),
(52, 'Vendor/Supplier', 'vendor', 0),
(53, 'Line Total', 'line_total', 0),
(54, 'Subtotal', 'subtotal', 0),
(55, 'eVat', 'evat', 0),
(56, 'Total', 'total', 0);

-- --------------------------------------------------------

--
-- Table structure for table `lib_po_no`
--

CREATE TABLE `lib_po_no` (
  `po_id` int(11) NOT NULL,
  `doc_type` varchar(20) NOT NULL,
  `Doc_name` varchar(255) NOT NULL,
  `po_no` varchar(50) NOT NULL,
  `sequence` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lib_po_no`
--

INSERT INTO `lib_po_no` (`po_id`, `doc_type`, `Doc_name`, `po_no`, `sequence`) VALUES
(1, 'sales_invoice', 'Sales Invoice', '202104', '0000003'),
(2, 'delivery_receipt', 'Delivery Receipt', '100008', '0000007'),
(3, 'purchase_order', 'Purchase Order', '100003', '0');

-- --------------------------------------------------------

--
-- Table structure for table `lib_vendors`
--

CREATE TABLE `lib_vendors` (
  `vendor_id` int(11) NOT NULL,
  `company` varchar(255) NOT NULL,
  `address` varchar(500) NOT NULL,
  `tel_no` varchar(255) NOT NULL,
  `fax_no` varchar(255) NOT NULL,
  `user_created` varchar(255) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_modified` varchar(255) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lib_vendors`
--

INSERT INTO `lib_vendors` (`vendor_id`, `company`, `address`, `tel_no`, `fax_no`, `user_created`, `date_created`, `user_modified`, `date_modified`) VALUES
(1, 'VSTECS PHILS., INC.', 'MSI-ECS -M. Eusebio Ave. San Miguel, Pasig City', '688-3333', '6384932', 'Joshua', '2021-10-22 03:01:01', 'Joshua', '2021-10-22 03:01:01');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `access_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `scope` varchar(4000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`access_token`, `client_id`, `user_id`, `expires`, `scope`) VALUES
('003550764f0715cc9c029420194bcf580c56173f', 'report_api', 'qwerty123', '2021-12-15 12:21:02', NULL),
('00380be5e04e1f5832f4d1e3f043cd957c8878a2', 'report_api', 'qwerty123', '2021-12-14 06:38:38', NULL),
('0053830939b7297428c6a7871f4d8529aa65a327', 'report_api', 'qwerty123', '2021-09-29 00:33:18', NULL),
('013a3defd2749bc9b4d48f7248496aa77d98a4bb', 'report_api', 'qwerty123', '2021-12-21 13:24:11', NULL),
('0142297ff72f26b59bdd303b6e917cbbcae5c4b3', 'report_api', 'qwerty123', '2021-09-29 02:07:54', NULL),
('015b182e58875fd56688a0a0082e178eb4505e75', 'report_api', 'qwerty123', '2021-11-03 08:42:37', NULL),
('018a38853a51434b3a572427e6feb9c901dde8ed', 'report_api', 'qwerty123', '2021-09-22 22:39:45', NULL),
('0253af03e722aeb17df1179ca64cca9e6ca2cf94', 'report_api', 'qwerty123', '2021-10-15 08:32:20', NULL),
('032b8c512bca51cb6e57f61ad059183bd721b2e1', 'report_api', 'qwerty123', '2021-12-13 07:42:39', NULL),
('04526aa486600eccbf0c4b4a023bd3cde42113a9', 'report_api', 'qwerty123', '2021-09-23 16:19:49', NULL),
('0467f0f992377bc4c0de48712076491733f6a6a2', 'report_api', 'qwerty123', '2021-10-03 02:14:39', NULL),
('04c1af58cfda5ddd3714c84568c26b807ce1436f', 'report_api', 'qwerty123', '2021-09-23 16:27:01', NULL),
('057d0fe0689a64898e9d4f4d3d51cef573b450c7', 'report_api', 'qwerty123', '2021-09-28 20:55:55', NULL),
('06ef1d4b1befd0a8c907d95e5ecc3c79303b7ef1', 'report_api', 'qwerty123', '2021-12-22 04:16:34', NULL),
('07c2eaec8ad8ce3be12f5733fbfe6fb98a3beacd', 'report_api', 'qwerty123', '2021-09-25 22:33:19', NULL),
('08860ce7aa5a897e93dc0626fcc2cb7c5c83c54e', 'report_api', 'qwerty123', '2021-10-11 21:29:53', NULL),
('08b9de32661cae378aacd3189febcf09e4488974', 'report_api', 'qwerty123', '2021-10-15 02:50:27', NULL),
('09ae03b78a27186f44cdbb7805e509ffce3fdde3', 'report_api', 'qwerty123', '2021-10-01 23:57:32', NULL),
('0a34447a6f97eb8cfdb7498ed22beed1af589298', 'report_api', 'qwerty123', '2021-10-05 23:43:39', NULL),
('0b0d7dd562746084487b8a00e949a7768a60b2ae', 'report_api', 'qwerty123', '2021-10-11 21:45:08', NULL),
('0c0e611ff184a1da03e240d93104cee32828c9e1', 'report_api', 'qwerty123', '2021-10-15 03:34:18', NULL),
('0ca7d07090ac9fda000e07db9b72d248462b8df2', 'report_api', 'qwerty123', '2021-12-22 14:54:00', NULL),
('0d05b1294d1c438963b569e9f7b855e119136815', 'report_api', 'qwerty123', '2021-10-19 07:26:39', NULL),
('0dba07f7361227830d3aa023e5ccf008d32573b6', 'report_api', 'qwerty123', '2021-10-06 18:33:48', NULL),
('1010338a5b679cd03ea489ac14c66b71c1587676', 'report_api', 'qwerty123', '2021-12-13 08:53:17', NULL),
('104596e8e4fb7cae55338989211f03e473f0326c', 'report_api', 'qwerty123', '2021-09-29 22:00:35', NULL),
('105af8f67b4726d832222d698c46701abb4e6244', 'report_api', 'qwerty123', '2021-12-22 09:38:56', NULL),
('11e775da84cceaa09a118327bac2d43cb8e2c32f', 'report_api', 'qwerty123', '2021-09-21 21:39:40', NULL),
('12ebb468b1a19c95b21c4c13604137768fd4a48c', 'report_api', 'qwerty123', '2021-12-21 14:00:29', NULL),
('13a2d0f408ff9f00fe489af1f8e94657f662ad8a', 'report_api', 'qwerty123', '2021-09-27 20:57:10', NULL),
('147beac2ad33e4a299bc8875b55213cb0511e662', 'report_api', 'qwerty123', '2021-10-13 14:15:34', NULL),
('14a954e9ab0d600353a270a66806e61e78ee3d21', 'report_api', 'qwerty123', '2021-09-18 20:47:09', NULL),
('15a50eff134586aab30c45504c1bd3b793b76a2c', 'report_api', 'qwerty123', '2021-09-19 16:51:19', NULL),
('15b062b02e55a13b19d485c21c7d567dfe87c5de', 'report_api', 'qwerty123', '2021-09-29 02:08:42', NULL),
('16e2a93eaf11d38b8237d8f46801d49ecfad89b2', 'report_api', 'qwerty123', '2021-09-27 20:32:38', NULL),
('16ee0c75b47a187240deabd4789ee829f8b7124b', 'report_api', 'qwerty123', '2021-09-20 01:05:32', NULL),
('17d62a1d5a5a356f12f391b54c32a0630943c2ad', 'report_api', 'qwerty123', '2021-10-07 20:39:44', NULL),
('17e00831d9b6a6109f57e650baf2b00a803ced87', 'report_api', 'qwerty123', '2021-12-21 09:13:41', NULL),
('18686257e17af093cdcefeb1c07f187205d54b53', 'report_api', 'qwerty123', '2021-09-27 20:24:45', NULL),
('1a745899e5fd68588e78b569c2a034c662446991', 'report_api', 'qwerty123', '2021-09-23 16:27:28', NULL),
('1bed66419e9c794f33efef8768edd67a56ccc696', 'report_api', 'qwerty123', '2021-10-06 01:28:50', NULL),
('1c4c8409cd4f12378e669322a0802cd038820f51', 'report_api', 'qwerty123', '2021-10-19 03:16:38', NULL),
('1c719a16c415b39bba6b7c7cda48a9cc5601cc8e', 'report_api', 'qwerty123', '2021-09-19 02:40:43', NULL),
('1c883172e272b3e65c6bbf3b12dfb7598788b5ca', 'report_api', 'qwerty123', '2021-09-27 16:26:15', NULL),
('1cefc996b58e9cfd98b58be20df2bfa41215c987', 'report_api', 'qwerty123', '2021-10-22 04:45:36', NULL),
('1d7030a49148afc853c7ef1becf6d590f299db51', 'report_api', 'qwerty123', '2021-10-27 06:17:08', NULL),
('1e0796fa055e3ec0a62acbf68ae05151dda9a8a1', 'report_api', 'qwerty123', '2021-09-26 19:15:21', NULL),
('1e4c69a3f0cb43ca7e4a6ce64b3177d000068170', 'report_api', 'qwerty123', '2021-12-15 06:31:25', NULL),
('1eaf225914eb31543441e2ada9dfb7723bc7c39b', 'report_api', 'qwerty123', '2021-11-03 04:45:14', NULL),
('1ee1fb26f83206447d9534a778a8f49a65a564ae', 'report_api', 'qwerty123', '2021-12-22 14:57:41', NULL),
('1f15e20664f5aa24afd1524ba04066138afe722c', 'report_api', 'qwerty123', '2021-09-19 17:57:33', NULL),
('1f20dfee5f1dcd27a88b291368a496f1afd7a9e3', 'report_api', 'qwerty123', '2021-09-21 20:30:28', NULL),
('209d5c0ff5d13fb7ee0138baf9fe201f522c8da8', 'report_api', 'qwerty123', '2021-12-21 09:30:43', NULL),
('20a65f19709339cff19bd7ab1baf2f06a1792553', 'report_api', 'qwerty123', '2021-09-27 20:29:53', NULL),
('21dcb806fd0bcb11ec8035b01be63c47b4710e7b', 'report_api', 'qwerty123', '2021-09-20 16:26:16', NULL),
('21e83025f2efaa18a5bdcad2e791becdd36fea49', 'report_api', 'qwerty123', '2021-09-28 20:49:04', NULL),
('22abfd9dc617cd5e1ef4917f52029ec625839eb3', 'report_api', 'qwerty123', '2021-09-20 01:31:23', NULL),
('245a1c8147a0cac6e22ba8149f5c968fcaddf5d8', 'report_api', 'qwerty123', '2021-10-06 17:55:00', NULL),
('25480656c284fbc6c112eabb8831ab7e5fe48392', 'report_api', 'qwerty123', '2021-10-03 20:32:47', NULL),
('28f79799da0815633c40d0fc2faa6ca49b9a6d1c', 'report_api', 'qwerty123', '2021-10-06 01:29:19', NULL),
('29f1ee511b20181b85d0f359dfae9589825ac146', 'report_api', 'qwerty123', '2021-09-28 19:22:31', NULL),
('2ad9abd273d686f390451ba611e04f0c5c30f738', 'report_api', 'qwerty123', '2021-12-21 09:58:47', NULL),
('2cbe8a16475af98c0caff58cb4a5f5d54c48f8b1', 'report_api', 'qwerty123', '2021-09-22 20:48:37', NULL),
('2d1b4338156bab79787d38658944498b1f9e7786', 'report_api', 'qwerty123', '2021-09-19 23:46:22', NULL),
('2d3e6b9bfa202bf217da226a30386f42e3a9500d', 'report_api', 'qwerty123', '2021-09-30 17:29:53', NULL),
('2d42da6c813640b21c457152b4e8381f0c4e1331', 'report_api', 'qwerty123', '2021-12-09 04:31:42', NULL),
('2dd0cfd11ad2d3357f8553aaebd6cea184fda1b3', 'report_api', 'qwerty123', '2021-10-26 07:14:51', NULL),
('2df0a42072172f512ba1f56a82fce2cfe29d8864', 'report_api', 'qwerty123', '2021-12-22 15:29:06', NULL),
('2f4fcdac3ffd41f3a21e3bca76d2e42a2397e0d3', 'report_api', 'qwerty123', '2021-09-29 01:58:20', NULL),
('2fc8de86cfbf96ba78ef30f41e07d6e9fa404558', 'report_api', 'qwerty123', '2021-09-21 00:56:43', NULL),
('2fda5b5511ca2338fb2dc6b782565a5d06ab0a39', 'report_api', 'qwerty123', '2021-10-21 10:38:24', NULL),
('30cd1af8f1f5c4f43be8f74a9ac64e080400e08b', 'report_api', 'qwerty123', '2021-12-21 13:38:43', NULL),
('313630281aac7efb4ef6aaa8be19162a8ca528b2', 'report_api', 'qwerty123', '2021-09-29 22:19:26', NULL),
('318ab2c1e103098942da5b3b4dce910dd0c92d49', 'report_api', 'qwerty123', '2021-09-27 19:42:00', NULL),
('31f05d8a6c133560a270eed274d1cde8022d0a59', 'report_api', 'qwerty123', '2021-09-28 20:46:15', NULL),
('324acd2c021926d28f07a31b8740ad779339afda', 'report_api', 'qwerty123', '2021-10-05 17:58:33', NULL),
('32b66e2ca7febbeca77ca1c431f48c4149d1f10f', 'report_api', 'qwerty123', '2021-11-02 08:15:43', NULL),
('32e0f452875d4147900d9da2f0933c7ff05e7919', 'report_api', 'qwerty123', '2021-12-21 08:07:04', NULL),
('32f2cc5a6b75ae90e1d9c74c3c36a28731d0801e', 'report_api', 'qwerty123', '2021-09-26 01:44:12', NULL),
('33084a0f387c21c1552c06680a56a4f62143f2f5', 'report_api', 'qwerty123', '2021-10-21 06:27:43', NULL),
('335a5175381960861c1ccfaff092cc7672055cf2', 'report_api', 'qwerty123', '2021-09-23 14:54:54', NULL),
('33a736042e9763e7d70a795404c575584fa5e48d', 'report_api', 'qwerty123', '2021-09-25 22:31:12', NULL),
('340b4bfb7670e96cab8b836ae1553efcf7a86849', 'report_api', 'qwerty123', '2021-09-29 20:57:18', NULL),
('34a1171067503f250438d47a27023463c4e44733', 'report_api', 'qwerty123', '2021-09-29 02:09:30', NULL),
('34b656267e5af925db5c8c81e553a68393ae1da5', 'report_api', 'qwerty123', '2021-10-18 06:45:57', NULL),
('3532f9942db264c085c37cde1c4a91eb03e59cc8', 'report_api', 'qwerty123', '2021-09-23 16:19:10', NULL),
('367cac7d88c60348369258793bbe9d30eb65bd27', 'report_api', 'qwerty123', '2021-10-13 13:13:55', NULL),
('368d0cc4931517c63f7bfcaedcd699700d051fcc', 'report_api', 'qwerty123', '2021-10-26 15:18:24', NULL),
('370046b116bd4d5359dd406c3e8cd90e214ae083', 'report_api', 'qwerty123', '2021-12-13 08:44:57', NULL),
('378b814761052f1a261551fbe0223081ccae60ac', 'report_api', 'qwerty123', '2021-10-27 08:36:31', NULL),
('38026d6ec76845babe87243ec065f6e56e6e2c66', 'report_api', 'qwerty123', '2021-09-27 16:14:22', NULL),
('38a29308f9c83f256d96b15fb14142ea3ed89b75', 'report_api', 'qwerty123', '2021-09-23 16:20:19', NULL),
('38ab736e57c8671fd13c08ec12345f30b917b603', 'report_api', 'qwerty123', '2021-09-29 01:36:47', NULL),
('393b7c7fe8eebe799ab853ac81f0d0b0616662f8', 'report_api', 'qwerty123', '2021-12-21 14:48:34', NULL),
('39c4d4672f00176a84500ceb51b38f20d084d733', 'report_api', 'qwerty123', '2021-10-02 19:21:40', NULL),
('3a24400983b92de6982e7a5a456dd75757ef4c10', 'report_api', 'qwerty123', '2021-09-27 16:14:47', NULL),
('3a56ef1435972c0ab19629e380cd5a9c255b82ae', 'report_api', 'qwerty123', '2021-09-19 02:41:38', NULL),
('3adbc9e2f02bf1234db27646f0426898596975c5', 'report_api', 'qwerty123', '2021-11-02 12:22:53', NULL),
('3b54937540b3474294f9f06b09a66cb8382b0afa', 'report_api', 'qwerty123', '2021-10-06 21:34:56', NULL),
('3c2f911f0d28214bdfbe4603619e9a5fa7a4ce62', 'report_api', 'qwerty123', '2021-10-03 20:32:10', NULL),
('3c90cfcc5529f483bb02f0b1e9957126c999ba4b', 'report_api', 'qwerty123', '2021-12-21 07:58:18', NULL),
('3cc7310e4082c93ccb1539384d01ef65677094d3', 'report_api', 'qwerty123', '2021-10-06 01:51:25', NULL),
('3e70e46e5365e85896d4570dad801ed7910f8122', 'report_api', 'qwerty123', '2021-10-06 19:21:22', NULL),
('3ec018e761c7e040569755777d235d56e42db5d9', 'report_api', 'qwerty123', '2021-10-25 09:15:14', NULL),
('411fab3b55b8635aab140c6f5acc2dbacd603e77', 'report_api', 'qwerty123', '2021-10-10 20:24:39', NULL),
('419b065143003e797da9e2dffbee6a612dc91ffd', 'report_api', 'qwerty123', '2021-09-20 16:27:49', NULL),
('427692505032c811ce1fc368b361ee519d83b84e', 'report_api', 'qwerty123', '2021-09-22 23:04:03', NULL),
('4377699377162b79eff42248fc0d9888dcd6696b', 'report_api', 'qwerty123', '2021-10-11 20:19:50', NULL),
('43975631fc892d215bae6fa068c62b22d96add07', 'report_api', 'qwerty123', '2021-10-18 05:09:16', NULL),
('447c33755214388ba10b8b1581e3c4a2d7aebdaf', 'report_api', 'qwerty123', '2021-09-23 16:27:47', NULL),
('45d5b6bedb7fb2e5450f126259520e1ee0fff9df', 'report_api', 'qwerty123', '2021-09-26 22:45:28', NULL),
('463a9fe4a572f082ac0c948666610ae2e43cd7f2', 'report_api', 'qwerty123', '2021-09-19 15:06:11', NULL),
('46e2b9f59786233db73a5f519aedf9b25fb4717a', 'report_api', 'qwerty123', '2021-12-21 09:43:29', NULL),
('4853a89848f5a094c3c4c0917f618bc4d2f66ce6', 'report_api', 'qwerty123', '2021-10-02 23:58:49', NULL),
('48919c9840bb29f7726428df964ed5833ab46faa', 'report_api', 'qwerty123', '2021-12-21 09:33:20', NULL),
('49366535ff795a632a324d80732003fbb26bdf30', 'report_api', 'qwerty123', '2021-10-19 08:25:21', NULL),
('495fba8e513c5363852352e55a6bdd3832798992', 'report_api', 'qwerty123', '2021-10-25 08:58:50', NULL),
('497f9773263ea5da2db998fd2aa558669b38f94a', 'report_api', 'qwerty123', '2021-10-02 23:58:57', NULL),
('4ae97a7effeb1570728fef4d39bffc4bd71c7708', 'report_api', 'qwerty123', '2021-12-21 04:56:06', NULL),
('4b357127d16031ab65366f07fcab34edaafd3f9f', 'report_api', 'qwerty123', '2021-09-23 16:18:52', NULL),
('4e237939f7273dfb09ed2a252efab4b1cae11c83', 'report_api', 'qwerty123', '2021-09-27 19:45:42', NULL),
('4e70a34745caadfcb2a1700aa53f99fef2fe016d', 'report_api', 'qwerty123', '2021-10-04 23:50:58', NULL),
('4f184f70add7e406ae4a31a0ccd2d95177344fc5', 'report_api', 'qwerty123', '2021-12-21 10:15:20', NULL),
('4fc982b5370d7ef15fdf5c69f77e63861449881f', 'report_api', 'qwerty123', '2021-09-29 22:19:05', NULL),
('517ea8f2124f9d57a7a39a772ae5a0cbfa39ab4c', 'report_api', 'qwerty123', '2021-10-19 10:33:58', NULL),
('5223ba37d4127a13a712e7735ad452d4133a3c5b', 'report_api', 'qwerty123', '2021-09-29 00:32:59', NULL),
('52b5d1b28060bac7ab7e716be66e95d5212ece56', 'report_api', 'qwerty123', '2021-09-23 15:49:40', NULL),
('5370be969e3f9df82e50da70ba866bdd75c87527', 'report_api', 'qwerty123', '2021-09-23 16:30:00', NULL),
('546ba585f29c25cd294ba92c222813f2e18e26b5', 'report_api', 'qwerty123', '2021-10-06 18:15:43', NULL),
('5528acfbd2953ac15ef01c4bc6fe4aa2f5931d9f', 'report_api', 'qwerty123', '2021-09-27 19:09:59', NULL),
('564ebd2a249889c44bafe05fd1e007d571a8b62f', 'report_api', 'qwerty123', '2021-12-14 02:43:31', NULL),
('56d0c60c387a73100fcf392496eb19bf3f9e0413', 'report_api', 'qwerty123', '2021-09-19 01:23:17', NULL),
('57af3ac3d41a297513368f206fafe262f6d0507d', 'report_api', 'qwerty123', '2021-09-27 20:41:21', NULL),
('586747813405e3002d5a0c732155385034b93d4c', 'report_api', 'qwerty123', '2021-09-26 00:32:57', NULL),
('59007925c47d05423e7970b943daa7018c23c93c', 'report_api', 'qwerty123', '2021-09-21 13:45:17', NULL),
('593bd8dff286600fe8b66e14e573a06dd1f46e53', 'report_api', 'qwerty123', '2021-10-12 21:09:31', NULL),
('5a5bd042b8af5536b24aee5e29ce7c9573a86d17', 'report_api', 'qwerty123', '2021-12-14 13:16:12', NULL),
('5af5d2eaf37e2df8fd9ff5af9a436cbb6eee637b', 'report_api', 'qwerty123', '2021-10-12 17:06:08', NULL),
('5b3622a5def6929091361bf41e13822ee43cbc24', 'report_api', 'qwerty123', '2021-10-02 22:56:23', NULL),
('5b851d7b2bdaa145a3c83826b2835305b9229688', 'report_api', 'qwerty123', '2021-10-22 06:53:25', NULL),
('5b95c81ebf91773be28e6d94462eff79a3e15bc0', 'report_api', 'qwerty123', '2021-10-03 01:00:34', NULL),
('5bd3fb123d12ec09fc8d9aad0a0ea05715d616b9', 'report_api', 'qwerty123', '2021-09-21 13:17:58', NULL),
('5c9ced5eeeef9730f3d453f4796b6c7b0ccbbba3', 'report_api', 'qwerty123', '2021-09-27 18:55:13', NULL),
('5cb126f087071d51060f7535774282bc24bb0f11', 'report_api', 'qwerty123', '2021-12-22 08:02:27', NULL),
('5ce0addad984cf20195f712c3dd17a9962fe2d0b', 'report_api', 'qwerty123', '2021-09-28 19:46:32', NULL),
('5d16f10d2335defcf3e7fc528ea0754955a4faea', 'report_api', 'qwerty123', '2021-12-21 10:01:17', NULL),
('5e3d0814b81dec2766023fa040b38d06088dbc52', 'report_api', 'qwerty123', '2021-10-19 06:56:10', NULL),
('5faab5fb89637901d93a81bfa947df6bbf9d1566', 'report_api', 'qwerty123', '2021-10-14 10:44:47', NULL),
('5fc7e504b0242f5cfb27f1558d74267779934f5a', 'report_api', 'qwerty123', '2021-12-14 06:46:52', NULL),
('61841df2ec8385ff45282e89121c5858a38e2a1f', 'report_api', 'qwerty123', '2021-10-06 20:00:49', NULL),
('6242d93ef61f131e05b15be40f6090f3f02ddbf3', 'report_api', 'qwerty123', '2021-10-04 21:10:41', NULL),
('6366d1c38ddc7a945d9711758005a1d894746e6e', 'report_api', 'qwerty123', '2021-09-23 16:24:42', NULL),
('63ad67ff2d25aed6d4ae59f2c1140d8f14dac717', 'report_api', 'qwerty123', '2021-10-06 19:05:40', NULL),
('6513032bd2ad68b61daff295de3d9b3c0b68bdf6', 'report_api', 'qwerty123', '2021-10-21 06:58:27', NULL),
('65374aa16838823623cfe2214c831758386a87ab', 'report_api', 'qwerty123', '2021-10-22 03:34:53', NULL),
('66198125ac358aee495762e1a598d89b7887f8dd', 'report_api', 'qwerty123', '2021-10-10 18:26:07', NULL),
('665c438f8903d7ab49c63ff6bc9a4921142d4c90', 'report_api', 'qwerty123', '2021-10-14 12:44:56', NULL),
('68b713a1ffd30cf82ae0711896272734cfd328f9', 'report_api', 'qwerty123', '2021-12-07 09:55:45', NULL),
('693585181e9d1a9347be8a05ba409bfccd5771ed', 'report_api', 'qwerty123', '2021-12-07 12:13:20', NULL),
('6a049154a64c6963b61c3863febdc4818126d49a', 'report_api', 'qwerty123', '2021-09-22 15:52:42', NULL),
('6ac59ca5e4983d7f2500dd6ec58f029af682ca61', 'report_api', 'qwerty123', '2021-09-23 00:03:11', NULL),
('6b267bfb0f7e2d2159e468a827e0b2f57f8dd5f6', 'report_api', 'qwerty123', '2021-09-23 16:25:44', NULL),
('6b358c631c98b1c771c86a7ef62114edaf4265e2', 'report_api', 'qwerty123', '2021-10-06 01:15:49', NULL),
('6bedafb4987359655d17e441f4236b080518bb04', 'report_api', 'qwerty123', '2021-10-05 17:16:45', NULL),
('6c2bb6ae99a6991ec618b8dbe41849541e8f1273', 'report_api', 'qwerty123', '2021-09-29 18:40:29', NULL),
('6d1a2f86d7f369981ca607ffbd3a4008e0e8d1de', 'report_api', 'qwerty123', '2021-09-19 16:51:33', NULL),
('6eb8d8103d85842fa7d8a9391d9ae07bf206fef7', 'report_api', 'qwerty123', '2021-09-27 16:11:28', NULL),
('6ecf28712e66ef3710280357b448b733079292fc', 'report_api', 'qwerty123', '2021-10-18 06:45:36', NULL),
('7013c0fa9d0ca1c30b97c5869468e23f912f2a88', 'report_api', 'qwerty123', '2021-12-21 13:26:28', NULL),
('7075af49b60aa474109be32c7564eeb4d9be7c10', 'report_api', 'qwerty123', '2021-11-02 13:28:07', NULL),
('70c163754c99974fd0ea73004eebf3d30ecdacd3', 'report_api', 'qwerty123', '2021-09-26 21:44:57', NULL),
('713b484625ecba0407968908460c161a9f932cf7', 'report_api', 'qwerty123', '2021-12-14 08:41:36', NULL),
('71ae167d7c69ae9e6e305eab369f88894a504549', 'report_api', 'qwerty123', '2021-10-05 21:54:33', NULL),
('722fb1af0af3a48be5951bdfbf8cfd1db1f0c6c3', 'report_api', 'qwerty123', '2021-10-02 20:58:35', NULL),
('728847d8dc68b5a27f5684788f9e5327d5081edd', 'report_api', 'qwerty123', '2021-10-14 11:43:13', NULL),
('72c1dfbe74d874239866555f8a471b00d35fb07c', 'report_api', 'qwerty123', '2021-12-21 13:22:44', NULL),
('72ef75d26aeb133fcce17c8cd6f0a584ce5fed0b', 'report_api', 'qwerty123', '2021-09-23 16:29:12', NULL),
('73b08e5368611a761338851d976b5644b3fa8895', 'report_api', 'qwerty123', '2021-10-11 15:36:37', NULL),
('7458bc13d151d392b05177001612123c27f43cb6', 'report_api', 'qwerty123', '2021-09-27 19:06:54', NULL),
('745da0c411bd81ccbce89b113eb2261fcdca6fcd', 'report_api', 'qwerty123', '2021-09-27 19:05:59', NULL),
('763bccb814de1d4e0eef834983bf327d078bb096', 'report_api', 'qwerty123', '2021-10-15 05:33:19', NULL),
('777fd3c94b13cdc35cc0f173208619e0b6b309cf', 'report_api', 'qwerty123', '2021-12-21 07:11:46', NULL),
('779783c3ca8c618eccd9b9835edf41b63716fb31', 'report_api', 'qwerty123', '2021-09-23 20:51:40', NULL),
('78823ed91b52be8780082996d6227f598912df27', 'report_api', 'qwerty123', '2021-10-13 15:15:30', NULL),
('794659bf295291c540de4e0f17834b5509488c49', 'report_api', 'qwerty123', '2021-10-10 18:02:39', NULL),
('799582431de5f76c91501a28f49b8dca00cc1c48', 'report_api', 'qwerty123', '2021-12-13 10:24:24', NULL),
('79d698e81fc289b44f9fd4892910daae6533d0e0', 'report_api', 'qwerty123', '2021-10-11 20:57:24', NULL),
('79d7edaa509fcf4851e88cebcae0ec14c3615ba3', 'report_api', 'qwerty123', '2021-12-07 09:07:47', NULL),
('79d97216dd973a13cdfb46f1fe85a644511a2a3e', 'report_api', 'qwerty123', '2021-09-27 20:42:36', NULL),
('7c8a741738e54f7b74ae30ebf102862cbfc7bac3', 'report_api', 'qwerty123', '2021-10-11 15:53:24', NULL),
('7d1e9ee0fa39427692a73fc85ddf7f721eddfdcf', 'report_api', 'qwerty123', '2021-10-19 05:01:07', NULL),
('7e8bf72d2cabecddc8c8a4a4d30656cd2e6a7377', 'report_api', 'qwerty123', '2021-09-27 18:53:11', NULL),
('7ff9409cc783eecfa5723154664452dcbf18e0c2', 'report_api', 'qwerty123', '2021-09-19 16:53:27', NULL),
('8020e7ca79a060bb5754e58484e52a9a996da76c', 'report_api', 'qwerty123', '2021-10-01 23:32:59', NULL),
('80ad11671bb5f00542ff3b59f7415988bc192303', 'report_api', 'qwerty123', '2021-09-27 16:10:56', NULL),
('8258c55cb7d3944de935b333ec68fea67875e095', 'report_api', 'qwerty123', '2021-09-27 18:55:49', NULL),
('82b852f82d39035405202ebb8b1ea8b3c8aa400e', 'report_api', 'qwerty123', '2021-12-13 16:16:59', NULL),
('8333843a11aa68b59e8a49ae2f91ab11b251890f', 'report_api', 'qwerty123', '2021-10-07 18:42:27', NULL),
('84ab9c7a42307bd93c574c267fd0d446cebb4961', 'report_api', 'qwerty123', '2021-09-21 21:09:03', NULL),
('86990f7127212ade405f227671c69756563ab232', 'report_api', 'qwerty123', '2021-10-06 18:49:06', NULL),
('86a56760d4bdad4e4e97e43227bad4b4322b5811', 'report_api', 'qwerty123', '2021-12-22 11:02:55', NULL),
('86b55c05583abd8a4bc017c8c808cfc9f86cd20f', 'report_api', 'qwerty123', '2021-09-29 00:42:39', NULL),
('885b3ce6e192f14802c094541d76e900d86b1a56', 'report_api', 'qwerty123', '2021-12-21 10:05:47', NULL),
('88614f6724311e48e0528eb1ae65f46a8b98e73f', 'report_api', 'qwerty123', '2021-10-02 00:04:59', NULL),
('88b656177b396f17651534dee5bbe21270a502c2', 'report_api', 'qwerty123', '2021-09-28 20:56:18', NULL),
('8b1e41d5bc4e71492490d8756da7677321dc0226', 'report_api', 'qwerty123', '2021-10-20 08:46:33', NULL),
('8b5786c9649a48c253dd7c8d8d197256d3b7ec0e', 'report_api', 'qwerty123', '2021-09-26 19:35:25', NULL),
('8b90dd10970a03012bd3b2a2072c4364590c5c48', 'report_api', 'qwerty123', '2021-12-15 13:30:52', NULL),
('8bea52898bb705d5d3bada17476a212f006f2149', 'report_api', 'qwerty123', '2021-10-19 03:38:20', NULL),
('8da1f9100ac34a8045a3cd79d40222242042a7f7', 'report_api', 'qwerty123', '2021-10-13 14:08:01', NULL),
('8ddb35465074bbe584ff96d74eaef2689e619a8d', 'report_api', 'qwerty123', '2021-09-29 00:42:13', NULL),
('8deba6608ff99edf0566bb36a1db1d8fd14a0e34', 'report_api', 'qwerty123', '2021-09-23 16:28:11', NULL),
('8df603eb586c3af6d3941a2862bf96c56b6d94a6', 'report_api', 'qwerty123', '2021-10-13 16:18:49', NULL),
('8e3990a60803a4a301f0729194a53f4a1026125b', 'report_api', 'qwerty123', '2021-12-09 05:08:15', NULL),
('8e5262ddf27d7bdecad9e4f7383777766bbc36a8', 'report_api', 'qwerty123', '2021-10-27 06:39:54', NULL),
('8e8ba62485fa5cf21e9abf87158bdedc6d677823', 'report_api', 'qwerty123', '2021-09-19 16:53:21', NULL),
('8fce1ea0f8550a6d1d566ca336327be6e5be3dec', 'report_api', 'qwerty123', '2021-09-27 18:52:59', NULL),
('8fed9a97a0a970b83e5541370eb812b4b4b9f5fd', 'report_api', 'qwerty123', '2021-10-04 22:16:35', NULL),
('903b10fe1f9f6c84ccfa337361f3b72486501ad8', 'report_api', 'qwerty123', '2021-10-10 15:04:56', NULL),
('90acbcdeb1da7811a92f669780f48c1cac029197', 'report_api', 'qwerty123', '2021-10-26 04:57:16', NULL),
('9137eff4a7795e0ac469ae633e56700727e0943d', 'report_api', 'qwerty123', '2021-10-06 02:55:47', NULL),
('914a3a9fff05d4fe13545fe4d2c04e0d70464cef', 'report_api', 'qwerty123', '2021-10-12 16:42:37', NULL),
('92aa3e7ba358cd89641456a59ad1a85b8cc3a134', 'report_api', 'qwerty123', '2021-10-15 10:10:08', NULL),
('934f24fc4456abadaa90c2f0827fa0ecc01b03cb', 'report_api', 'qwerty123', '2021-09-23 16:18:52', NULL),
('936509e1f884782bfd82f2c6bd9856f50e9e3781', 'report_api', 'qwerty123', '2021-12-14 03:32:18', NULL),
('93ca78ae85df6a846847b71965a4d1f63d2a3f1d', 'report_api', 'qwerty123', '2021-10-11 20:58:06', NULL),
('93d3d9b178d4f134d87b660c355dda25f7482a9b', 'report_api', 'qwerty123', '2021-09-19 16:28:32', NULL),
('94c72215bfe8b18b641ab655a94eb2078097fc78', 'report_api', 'qwerty123', '2021-09-27 19:42:59', NULL),
('94d3ba4e68075d21f629ba92a56310324d4739ec', 'report_api', 'qwerty123', '2021-10-04 14:24:20', NULL),
('955f64e6b64d9cb6bc5b5e977054bd8893dc3b58', 'report_api', 'qwerty123', '2021-12-22 14:12:33', NULL),
('96299ffb1de554ab3e55a16e7a313618910c6308', 'report_api', 'qwerty123', '2021-11-02 14:27:05', NULL),
('9720335a45d91838ed6d5f4ba01dd25d6a25b367', 'report_api', 'qwerty123', '2021-10-06 00:19:29', NULL),
('97712047a561f7cea48f721934103a74c1661e8f', 'report_api', 'qwerty123', '2021-12-14 14:35:19', NULL),
('97752c85308a3ead24685403641cefb9c57344fa', 'report_api', 'qwerty123', '2021-09-26 00:33:13', NULL),
('98207f3405374e79ebc7521e9eb6f79495e3ab15', 'report_api', 'qwerty123', '2021-09-19 16:28:32', NULL),
('98a6a1fd9b28a5ed13e3ad046fc6bf36c26e5680', 'report_api', 'qwerty123', '2021-09-23 14:35:01', NULL),
('990c9c597e4c76b69e6a98abd2b465a160a0360d', 'report_api', 'qwerty123', '2021-09-21 23:45:50', NULL),
('9a2b8138f8459af91e71a09dfb267e878da23f9a', 'report_api', 'qwerty123', '2021-11-02 07:43:56', NULL),
('9d1a447890480ced8c16b2836bbe09e8a4253e56', 'report_api', 'qwerty123', '2021-09-22 21:54:09', NULL),
('9d405febc84d366b9a41bcc1cc5e4e05b8bf4acb', 'report_api', 'qwerty123', '2021-12-14 13:17:59', NULL),
('9f11ef3022b3b0703d77f800d6af6f9754536bec', 'report_api', 'qwerty123', '2021-09-28 19:22:05', NULL),
('9f48e132b17444f710a92bf48ab54533801ff774', 'report_api', 'qwerty123', '2021-12-23 02:45:19', NULL),
('9fb43181a2e356436343c07f898145d1e9b3da0a', 'report_api', 'qwerty123', '2021-12-21 09:57:41', NULL),
('9fc83a27cc2579e7105e3480492d197570615959', 'report_api', 'qwerty123', '2021-09-24 23:20:26', NULL),
('9fee0d70c714908003c714a8ab0455f34f790269', 'report_api', 'qwerty123', '2021-10-12 20:46:54', NULL),
('a048811d854a4c40ed98b5f8c669dc288e7d38f4', 'report_api', 'qwerty123', '2021-12-21 14:02:09', NULL),
('a0ceed4911be868073a21c5d71b2bd64439bc7e0', 'report_api', 'qwerty123', '2021-12-21 08:04:45', NULL),
('a0d2dcb4c4a0887b09e92dfe3d7852a19478d1ee', 'report_api', 'qwerty123', '2021-10-27 11:31:31', NULL),
('a11b5f1adac3a563cf05585119022a7907de0e7b', 'report_api', 'qwerty123', '2021-12-14 13:13:48', NULL),
('a18c70168219bfbaa956525e8d6eb0c027940dd9', 'report_api', 'qwerty123', '2021-09-27 00:05:39', NULL),
('a1ca0d233bce9bc294054580b84cc2d71e216c10', 'report_api', 'qwerty123', '2021-09-19 02:28:00', NULL),
('a2421e499dcea123d81bbae970348de0d18b2b56', 'report_api', 'qwerty123', '2021-10-10 17:40:51', NULL),
('a3241f208eeb1450a181c18428f6057b7de490eb', 'report_api', 'qwerty123', '2021-09-27 20:22:55', NULL),
('a41ea29198467627e2f1d9a83b03492882066594', 'report_api', 'qwerty123', '2021-09-30 01:36:40', NULL),
('a4443847351c27c8a02dbab397590e90f7fd7717', 'report_api', 'qwerty123', '2021-12-15 06:00:52', NULL),
('a489a1117e4d3227b5487f7173cf8fed34572dde', 'report_api', 'qwerty123', '2021-12-15 13:12:57', NULL),
('a5164ebe02e542f65e4766bbd61c00b635f2a52b', 'report_api', 'qwerty123', '2021-09-27 16:09:39', NULL),
('a581f71c5232b7f647804552b7dad366dddfe535', 'report_api', 'qwerty123', '2021-09-28 19:22:57', NULL),
('a6ba5ba6bab2f2510f23ee06ef07f2d718f3ca25', 'report_api', 'qwerty123', '2021-10-05 21:54:05', NULL),
('a6f66031c8bf18265990a29374164199bfa20a1e', 'report_api', 'qwerty123', '2021-10-20 06:56:18', NULL),
('a77fbe5b54a615e7d1af28c39861c0503102d00b', 'report_api', 'qwerty123', '2021-09-27 20:21:01', NULL),
('a7a26714320fe577091619f567f9f0ae31adae69', 'report_api', 'qwerty123', '2021-10-15 08:32:29', NULL),
('a89f05cd49017c2cfa1920f7e1f76bf27a94af87', 'report_api', 'qwerty123', '2021-09-28 19:28:59', NULL),
('a907aee445bade7b7e24f18413eeede6c355c856', 'report_api', 'qwerty123', '2021-09-27 15:52:06', NULL),
('a9141eb344929d6ab849b3028135d05fcbc06f30', 'report_api', 'qwerty123', '2021-10-18 04:45:50', NULL),
('a94b7b80fae5347142fb2aef51abf2e725892e17', 'report_api', 'qwerty123', '2021-09-29 00:30:34', NULL),
('a9bae19c1408fae64ba423813f473514ab868b12', 'report_api', 'qwerty123', '2021-10-13 19:39:49', NULL),
('a9d265ed57ba4dd525dd9c885629229ab6ba604f', 'report_api', 'qwerty123', '2021-11-03 08:56:12', NULL),
('ab8ac93260bc0914916a066a2d0536566f9e35c9', 'report_api', 'qwerty123', '2021-10-04 21:25:08', NULL),
('ac652c01f54cbb8cabf99a46a359d0bab83f972b', 'report_api', 'qwerty123', '2021-10-26 13:25:29', NULL),
('ad6766a60264f8fd19a85936e0e102d2a41b73a1', 'report_api', 'qwerty123', '2021-12-21 07:43:04', NULL),
('aeda41d3b1257b6138d0875dfa899f9c7e1c432e', 'report_api', 'qwerty123', '2021-12-13 08:30:52', NULL),
('af3a838bc378e383ae23c4cc4167625d56bbda91', 'report_api', 'qwerty123', '2021-09-21 19:45:49', NULL),
('af7101c06b6bedd464d243365edc2772e869c7ba', 'report_api', 'qwerty123', '2021-09-26 00:33:23', NULL),
('b03b809ee952e7c752173a102449af625b75d752', 'report_api', 'qwerty123', '2021-09-23 16:27:19', NULL),
('b1e60264531ee0263df4d0b0cd89132dd8978147', 'report_api', 'qwerty123', '2021-10-20 09:53:21', NULL),
('b2262476cbb5a3f1643ebcbc924c1ff181518104', 'report_api', 'qwerty123', '2021-11-02 09:17:50', NULL),
('b2820535b0f05ec0a7d7bf67447e9e4a3ecfcb93', 'report_api', 'qwerty123', '2021-09-18 23:28:56', NULL),
('b3289ca510d5d9f09e981d3dee9f86831780186c', 'report_api', 'qwerty123', '2021-09-19 16:51:54', NULL),
('b32b4f7344ffe029ccdc1a817d2ce744fe1a2d4f', 'report_api', 'qwerty123', '2021-10-27 08:21:17', NULL),
('b3359cac4f405d67224732aef33a4dcf6ebf526c', 'report_api', 'qwerty123', '2021-09-21 14:47:29', NULL),
('b3c6b1574ce99023dec77d53fb74afd9b81305df', 'report_api', 'qwerty123', '2021-09-21 00:57:05', NULL),
('b45262d9ecdffc498fe190bc3280f891f6ae6fe7', 'report_api', 'qwerty123', '2021-10-21 09:36:22', NULL),
('b75cc70ce8ad1a71024e83328d66c9d118182dde', 'report_api', 'qwerty123', '2021-12-09 03:55:17', NULL),
('b884455eb445a046b9d391d3ec623181fac860c4', 'report_api', 'qwerty123', '2021-12-21 09:54:00', NULL),
('b8c48a10f4211864722e4cae92a2fed3874d6b3f', 'report_api', 'qwerty123', '2021-12-13 09:27:26', NULL),
('b906692c4d1ee34ff12eb2d553d85298591d74b8', 'report_api', 'qwerty123', '2021-10-26 09:00:01', NULL),
('ba959dfdb8c260dd058c940168a642d8ea8e0ccb', 'report_api', 'qwerty123', '2021-10-22 04:46:03', NULL),
('bb8b7e1da9990fc21218356134d402edae54417c', 'report_api', 'qwerty123', '2021-12-21 03:50:43', NULL),
('bb906893b0a9ba497198069d1eba20d3dd03c1d6', 'report_api', 'qwerty123', '2021-10-11 19:10:56', NULL),
('bc64fa66bb9dfd7616297778eaadaeb6e049ce4b', 'report_api', 'qwerty123', '2021-12-13 07:13:03', NULL),
('bc713a416f4d0e3b1a63c3881e1d037719425a57', 'report_api', 'qwerty123', '2021-10-07 21:13:24', NULL),
('bc8ae4d6c76be92241d147ff078941398c7c64c2', 'report_api', 'qwerty123', '2021-10-25 09:00:51', NULL),
('bcba58e93f80c109285c2ad2197d89450e48c734', 'report_api', 'qwerty123', '2021-09-20 16:27:51', NULL),
('bd653610918d3bbd52f264ff7b332f7bcc1614b3', 'report_api', 'qwerty123', '2021-10-27 09:39:29', NULL),
('be55e7b39c2ef7346471e05bda9f99a4464fa31c', 'report_api', 'qwerty123', '2021-10-27 08:26:40', NULL),
('bed5ef8cdf9212e2c4afed21e3e78d02d64648c5', 'report_api', 'qwerty123', '2021-09-29 01:37:17', NULL),
('bf0c3fd9f9886b5ac74623752eedbea81295b40e', 'report_api', 'qwerty123', '2021-10-10 20:53:38', NULL),
('c10458d0d7c50fa3661e130d963aa1be9140d2ca', 'report_api', 'qwerty123', '2021-09-28 19:47:14', NULL),
('c108ca795d07bf35394617d0a8676c7c420ab724', 'report_api', 'qwerty123', '2021-12-15 07:39:56', NULL),
('c1e8652d156466deb15089b523047290dd2ff2a5', 'report_api', 'qwerty123', '2021-12-22 14:55:52', NULL),
('c29bef76db09b22720a6df0ea4329ee505a5fd46', 'report_api', 'qwerty123', '2021-10-27 09:15:20', NULL),
('c2f69f52c2f7561542eb918c2d1ce04ad4a5f8d2', 'report_api', 'qwerty123', '2021-09-23 01:03:53', NULL),
('c34e8e78a901a9e50b11f5194be2295a59120d91', 'report_api', 'qwerty123', '2021-09-30 19:49:36', NULL),
('c38e7479d98db9e4c73720511ad4433960016516', 'report_api', 'qwerty123', '2021-12-13 15:18:59', NULL),
('c4889de06f88b0f56e1b4eda3115f33a106dc87a', 'report_api', 'qwerty123', '2021-09-18 22:46:39', NULL),
('c55520008bd57925ff9015bbb01318412e58fa81', 'report_api', 'qwerty123', '2021-09-29 01:58:56', NULL),
('c56bfcc4d12b8c4acf0c6a3830f49ae908acf358', 'report_api', 'qwerty123', '2021-10-25 08:33:10', NULL),
('c602b6eb6750268675e2bcf847300ce833384649', 'report_api', 'qwerty123', '2021-10-18 04:16:09', NULL),
('c6752b86a88321a346336bd2449d86222a8084b2', 'report_api', 'qwerty123', '2021-10-18 05:08:38', NULL),
('c68118bc95539366b57ae2195ecc02b0756fe719', 'report_api', 'qwerty123', '2021-10-06 02:28:26', NULL),
('c6dc35ea99b2a3d1089b8f5177f595bf5231c64f', 'report_api', 'qwerty123', '2021-09-21 00:08:14', NULL),
('c7c9fda13af3224d7ea0e77e739620e9bf99254f', 'report_api', 'qwerty123', '2021-10-18 05:05:13', NULL),
('c7e6346de0f3aa67dbb4b3e321378ff7063ba0f5', 'report_api', 'qwerty123', '2021-11-02 10:43:38', NULL),
('c7f48489e03f55c094b57b8c8a36d9a68ac7484c', 'report_api', 'qwerty123', '2021-10-26 14:01:44', NULL),
('c800126cc7a7edb5a8136f4725c7e6226ea12ffb', 'report_api', 'qwerty123', '2021-11-02 15:42:38', NULL),
('c8872f9982e3175914a32080a9ddae443bc4feae', 'report_api', 'qwerty123', '2021-09-28 21:53:21', NULL),
('c9bda19d4f96601549766869fcd91e05236e0ed7', 'report_api', 'qwerty123', '2021-11-02 09:36:22', NULL),
('c9d5b91b5f21941d0a7f4d9e32d479957539a1e5', 'report_api', 'qwerty123', '2021-10-06 20:52:31', NULL),
('c9e54edf9afbec05b6b001ce35865db56f4a2a70', 'report_api', 'qwerty123', '2021-10-18 11:50:04', NULL),
('cb7df1e0764f7353b865f7780c66d829cd138b33', 'report_api', 'qwerty123', '2021-10-02 21:57:59', NULL),
('cba624541ec1ac2971c27a03a035adec61b7a4d5', 'report_api', 'qwerty123', '2021-12-21 08:03:55', NULL),
('cbe17f60887db8fa0fbe8f2ceddba3aa722d5584', 'report_api', 'qwerty123', '2021-12-21 13:15:51', NULL),
('ccdab6af430894414ae467f76d74c7d39ad73ccc', 'report_api', 'qwerty123', '2021-09-24 23:59:26', NULL),
('cd4c0dff0013f664c284ec346afda28a679c2ad7', 'report_api', 'qwerty123', '2021-10-11 18:30:01', NULL),
('cfe92002c9b8a74c60e790b61e2fea073648f910', 'report_api', 'qwerty123', '2021-10-02 01:48:31', NULL),
('d04b4c9bc0e114401e4b4f4a5c07cf3b092b2cc1', 'report_api', 'qwerty123', '2021-10-11 20:34:57', NULL),
('d0b8ea7c2ac50c19779fa25bb2de6154cf9b6f9f', 'report_api', 'qwerty123', '2021-10-12 23:41:17', NULL),
('d3f65a741262675513f3c65ca0417e6f15391f07', 'report_api', 'qwerty123', '2021-10-11 20:57:53', NULL),
('d47367aabe4f3794229f925b41fb55f59bbaf625', 'report_api', 'qwerty123', '2021-09-18 22:20:28', NULL),
('d570a5afbaf714c1909e2a4d711643088cabc3d1', 'report_api', 'qwerty123', '2021-09-21 19:24:54', NULL),
('d59b86a2a9062bbc49b8973fd7c80474a06ad482', 'report_api', 'qwerty123', '2021-09-26 01:40:00', NULL),
('d5bfe3d9e1924d1f162f9a514b037e6c82fb148f', 'report_api', 'qwerty123', '2021-09-28 22:54:08', NULL),
('d6a21b311a033a4b2c6f92e1422fb4197a2230db', 'report_api', 'qwerty123', '2021-10-18 07:59:32', NULL),
('d838f510abbcdfe8704a9b845248785e92c28803', 'report_api', 'qwerty123', '2021-11-02 07:53:46', NULL),
('d8a9a3aaf7797bb0a2734b78cd591bad7130d09d', 'report_api', 'qwerty123', '2021-10-26 08:14:06', NULL),
('d8ae286b1933b9db4b018fbba18974ede9cec24b', 'report_api', 'qwerty123', '2021-10-07 19:28:20', NULL),
('d8cef1c83df1adaab5061a061e0ef4abcdc8e219', 'report_api', 'qwerty123', '2021-10-18 06:47:13', NULL),
('da0340f7be8ba52f60ac99cc0e464822b8331cae', 'report_api', 'qwerty123', '2021-10-03 19:54:24', NULL),
('dadffc1a310e967a050a0e3fd948239b8db65f19', 'report_api', 'qwerty123', '2021-09-27 18:39:19', NULL),
('dae232c6aef5ba708cd0535a720104ab869914f7', 'report_api', 'qwerty123', '2021-10-25 11:07:11', NULL),
('dbe40b7d44aec5bb8009d8399d8d52543510acb6', 'report_api', 'qwerty123', '2021-09-27 16:09:39', NULL),
('dc9d45b82d8578fa45b5b2467b9b5e71b9b1ff5f', 'report_api', 'qwerty123', '2021-09-28 23:13:50', NULL),
('dcf288a4bbbdf470b8b917a03612e58a76a524c6', 'report_api', 'qwerty123', '2021-12-13 14:41:57', NULL),
('dd831f6b09f17fb69f5cb988862f1078336d3c23', 'report_api', 'qwerty123', '2021-10-05 20:24:33', NULL),
('dd8e27da81f2ce1d3bc2da019ea5ade9e4b9ea99', 'report_api', 'qwerty123', '2021-09-23 13:33:38', NULL),
('ddb4e70d73a2d1ce4a94ac9115cc8bbc40270f43', 'report_api', 'qwerty123', '2021-12-22 15:18:27', NULL),
('ddfa50038602070555a6d3e911ffe1e2517b70eb', 'report_api', 'qwerty123', '2021-10-05 21:29:38', NULL),
('de15ccd65dfb7cd974a435d285ce2f930eacfea8', 'report_api', 'qwerty123', '2021-10-25 09:30:23', NULL),
('df175a1e0ce209ff17d0e12625f3581a24e42fb7', 'report_api', 'qwerty123', '2021-10-05 00:56:40', NULL),
('df22cbe549ce2db312b8e0f4eb8e184eebf57cd4', 'report_api', 'qwerty123', '2021-10-20 07:29:36', NULL),
('df7176faba6e20defbbfa494f15efd55eb330730', 'report_api', 'qwerty123', '2021-10-03 18:55:03', NULL),
('e07544f01aed8194a77882593d7f30fba6769212', 'report_api', 'qwerty123', '2021-09-23 16:28:29', NULL),
('e0836e5316b94e1676e7a433902d7a662c5349f8', 'report_api', 'qwerty123', '2021-09-20 16:01:11', NULL),
('e094fddc6490eaefc2ddf547ec49ab9099dd83b1', 'report_api', 'qwerty123', '2021-09-23 17:14:25', NULL),
('e0d0c0fba4abcdc7dbf01c24c887f73c73adb143', 'report_api', 'qwerty123', '2021-10-03 13:04:15', NULL),
('e210b6f0b4d935b22bfed72ba15a33a2e63c85b4', 'report_api', 'qwerty123', '2021-10-04 02:50:08', NULL),
('e23f064fcb3cc952e4004499742453e8394104a7', 'report_api', 'qwerty123', '2021-09-27 20:42:07', NULL),
('e2ec6d6b7264a6917014fc92ed9af7c11cbea4c4', 'report_api', 'qwerty123', '2021-09-23 16:19:10', NULL),
('e6cffc7a706a3e2c8e55e7409ec230ee427a430c', 'report_api', 'qwerty123', '2021-10-04 23:17:12', NULL),
('e82b28d5064e293f072d202e6f1e53b2a0bce9b2', 'report_api', 'qwerty123', '2021-10-04 01:20:47', NULL),
('e99868179e6943aa12a7fc8bc4de9867da26adf1', 'report_api', 'qwerty123', '2021-09-27 16:09:49', NULL),
('eb40f2d76d4c4db9d859399b8eb9913fe92418f5', 'report_api', 'qwerty123', '2021-12-14 13:01:47', NULL),
('ebe15d82627255a01af21e99eb72ec631a7dce96', 'report_api', 'qwerty123', '2021-09-27 19:40:39', NULL),
('eceb83ba28b5b4d6024b5b3b77e897dff00fcbb8', 'report_api', 'qwerty123', '2021-09-28 18:23:14', NULL),
('ed2aafc6c9f907018c04a59d06728b3ec5463336', 'report_api', 'qwerty123', '2021-10-22 04:43:57', NULL),
('ee297b0653aaf9c37d6191a0390e8411c4ba091a', 'report_api', 'qwerty123', '2021-12-13 11:29:06', NULL),
('ef12b34f8eb7fe43c1aaa3d99f9d30653129f8db', 'report_api', 'qwerty123', '2021-10-12 23:18:26', NULL),
('ef7fd61abb7e1cc0d0c4be036077e7b2ed64f82e', 'report_api', 'qwerty123', '2021-10-10 19:13:53', NULL),
('f00661cfc028d889e0dd653aacf0525d0e96a8ea', 'report_api', 'qwerty123', '2021-12-21 10:14:55', NULL),
('f06d1402b38d5cd256ecbadbe70fc1063ae82333', 'report_api', 'qwerty123', '2021-09-30 20:41:27', NULL),
('f07cb15e47dc5a2c65a23ad7b125a41d4da3009c', 'report_api', 'qwerty123', '2021-09-21 22:38:19', NULL),
('f0818621391d2b74266258eb2b83e28468dc87c5', 'report_api', 'qwerty123', '2021-12-09 03:56:18', NULL),
('f1a4fa3924007f497f3141824b7fbb54d00575e5', 'report_api', 'qwerty123', '2021-10-20 06:18:17', NULL),
('f2559cda008acbea5cb37c110e1857e35ac2c1b3', 'report_api', 'qwerty123', '2021-10-27 14:17:58', NULL),
('f2c6cf555ce26f886667c01678e235145863763e', 'report_api', 'qwerty123', '2021-09-21 01:40:14', NULL),
('f3f975d4525cbd707be89a9e7321d8851785e283', 'report_api', 'qwerty123', '2021-09-26 01:56:01', NULL),
('f438a80c7d4ca27b81310ca8252713002677935a', 'report_api', 'qwerty123', '2021-09-25 21:38:16', NULL),
('f4ba5bd95ca3a274d5b78823962c61242506f5b0', 'report_api', 'qwerty123', '2021-09-22 01:10:06', NULL),
('f5be5278f4b36a805440eb0949014e917bca0b1d', 'report_api', 'qwerty123', '2021-10-07 20:12:21', NULL),
('f5e6be51dacbda197b47b9fb1932f90b3c9a9427', 'report_api', 'qwerty123', '2021-09-29 23:18:07', NULL),
('f6291b0d3ef0ba2bec66e6f4a46ae5012679423e', 'report_api', 'qwerty123', '2021-10-10 19:30:24', NULL),
('f62b27ab38d242878d1c26bc55a8c207436c3c9e', 'report_api', 'qwerty123', '2021-10-15 05:12:58', NULL),
('f70cafce5403bc885f60913aa8db7d57d9b952f5', 'report_api', 'qwerty123', '2021-12-14 06:51:27', NULL),
('f75dd7b32a2b9848c3f289b0c3f2b7d67b706058', 'report_api', 'qwerty123', '2021-12-09 05:01:27', NULL),
('f826809ab6f94440bc54c20723f76557d5e92d3b', 'report_api', 'qwerty123', '2021-09-30 01:58:59', NULL),
('f8653f7665c6b1f23bb19b7b4433f1acbf9581fa', 'report_api', 'qwerty123', '2021-09-23 16:30:43', NULL),
('f8f2bc508d33f9a04ede56059905642747c759fd', 'report_api', 'qwerty123', '2021-10-27 10:50:20', NULL),
('fa230931526094501070bac3c064f1f14ee877b2', 'report_api', 'qwerty123', '2021-11-02 12:46:02', NULL),
('fa75f4df516aec76b73675d7a01f041620535beb', 'report_api', 'qwerty123', '2021-10-20 07:16:00', NULL),
('fad56b1c2f18aca474d6cf00eabd58ae828cef10', 'report_api', 'qwerty123', '2021-10-13 18:38:10', NULL),
('fb43c9b64f403247b5a645f9bd98e0ef91786b22', 'report_api', 'qwerty123', '2021-09-19 01:05:50', NULL),
('fb5db24bba903e7c4d46af8f256f60651a49c4ca', 'report_api', 'qwerty123', '2021-10-25 07:26:35', NULL),
('fb6e6e6223b26353e86c5a9a0f501f5bcab21e7e', 'report_api', 'qwerty123', '2021-09-29 19:48:10', NULL),
('fc5d3daa64c56820af0927f17bb2597864351d11', 'report_api', 'qwerty123', '2021-09-20 16:01:11', NULL),
('fca43e00d03e5a9f44ec9846b96e54a87ed19ad1', 'report_api', 'qwerty123', '2021-10-04 16:54:54', NULL),
('fcb783168ca134fb108f6c3a60e78bb13dfe2259', 'report_api', 'qwerty123', '2021-10-21 09:21:34', NULL),
('fd6c908fcef785887baf0d8026cb072aed30e97a', 'report_api', 'qwerty123', '2021-10-26 07:58:41', NULL),
('fd922a725cf0223e756d354ba12e27a296eec666', 'report_api', 'qwerty123', '2021-11-02 09:35:30', NULL),
('fd9e3f6fef0052929cd7156f2fbf6fd6a79bcd44', 'report_api', 'qwerty123', '2021-09-29 00:34:53', NULL),
('fda54812aff03dab9b155e89d754e6b8ebbcc449', 'report_api', 'qwerty123', '2021-09-25 01:37:49', NULL),
('fe4cec880caec18536cb7af79b58e40d4c966e65', 'report_api', 'qwerty123', '2021-09-28 20:17:54', NULL),
('ff4e5a0dfb404cd34291a5271a7ee29e294d28ab', 'report_api', 'qwerty123', '2021-12-14 13:14:09', NULL),
('ffbf41ba3aea3eecb85a4da91c8f40efc8cd29c3', 'report_api', 'qwerty123', '2021-09-29 00:40:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_authorization_codes`
--

CREATE TABLE `oauth_authorization_codes` (
  `authorization_code` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `redirect_uri` varchar(2000) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `scope` varchar(4000) DEFAULT NULL,
  `id_token` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `client_id` varchar(80) NOT NULL,
  `client_secret` varchar(80) DEFAULT NULL,
  `redirect_uri` varchar(2000) DEFAULT NULL,
  `grant_types` varchar(80) DEFAULT NULL,
  `scope` varchar(4000) DEFAULT NULL,
  `user_id` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`client_id`, `client_secret`, `redirect_uri`, `grant_types`, `scope`, `user_id`) VALUES
('report_api', 'Qw123qa!@#$', NULL, 'password', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_jwt`
--

CREATE TABLE `oauth_jwt` (
  `client_id` varchar(80) NOT NULL,
  `subject` varchar(80) DEFAULT NULL,
  `public_key` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `refresh_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `scope` varchar(4000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`refresh_token`, `client_id`, `user_id`, `expires`, `scope`) VALUES
('000a0bd9d430dd11f81ce44d864a6423b4b70ce9', 'report_api', 'qwerty123', '2021-10-03 01:41:38', NULL),
('000c5b18c137bee42523cfc6c66ea13e187cee45', 'report_api', 'qwerty123', '2021-11-03 08:53:21', NULL),
('001d2c92b67ab9c567acac1e9187dfff5a61ea19', 'report_api', 'qwerty123', '2021-10-20 20:34:56', NULL),
('003e45e3800ba122cbd3c5b3693fc5b5a7b568c9', 'report_api', 'qwerty123', '2021-10-13 19:57:18', NULL),
('006fde27e01424bb0c55a32a3e39475acfffe065', 'report_api', 'qwerty123', '2021-10-09 21:31:12', NULL),
('01da2bb87f7d37a4c90e30d736f33460b476a12e', 'report_api', 'qwerty123', '2021-11-01 05:45:36', NULL),
('01e461efd5bc0b2cb1ae7b3b3df72f56e0de75e1', 'report_api', 'qwerty123', '2021-10-24 18:30:24', NULL),
('021842ee45ea831ac6cc041e7f8f7e8f0dbbe406', 'report_api', 'qwerty123', '2022-01-04 08:33:20', NULL),
('0235a3c770731f256766f7ccbaee6ec1ebe8ab1c', 'report_api', 'qwerty123', '2021-11-02 05:56:10', NULL),
('0345e5be7e3f9b4b2c141a41f47994a38f20559d', 'report_api', 'qwerty123', '2021-12-28 12:14:09', NULL),
('03bdac5a16ebdcb13f143c41139473f444c36ef3', 'report_api', 'qwerty123', '2021-11-08 06:26:35', NULL),
('03e9ec5de581a2c7979cc3572b34a0b7bfa008b5', 'report_api', 'qwerty123', '2021-10-11 19:21:01', NULL),
('042d5613b1ce2b1140bd1187c5a53d523f946104', 'report_api', 'qwerty123', '2021-12-29 06:39:56', NULL),
('0555bb31d05ae3ebf2b154c3d267af6189f41ebc', 'report_api', 'qwerty123', '2021-10-05 19:30:28', NULL),
('0593d94e5a46a2e5beffe3c8a8d8e5e8dba10cd5', 'report_api', 'qwerty123', '2021-10-04 15:26:16', NULL),
('06c0f076b75be483064f856a16e99653e7101094', 'report_api', 'qwerty123', '2021-12-21 11:13:20', NULL),
('06d8c13915a9d3313951dfdc1576bc2b88e93bd8', 'report_api', 'qwerty123', '2021-10-24 14:04:56', NULL),
('072cdf24c37483aaedf0f061da676307ada176f1', 'report_api', 'qwerty123', '2021-10-11 15:10:56', NULL),
('0738679aaf23b4439ced9e6bc70e86a2cf65d0dd', 'report_api', 'qwerty123', '2021-12-27 08:27:26', NULL),
('079c1f63191d090ab13103d12cec8b5054603110', 'report_api', 'qwerty123', '2021-11-16 11:46:02', NULL),
('07f7f664e7c5e9b00318202ec0efd4c90610bf1a', 'report_api', 'qwerty123', '2021-10-29 07:32:29', NULL),
('09a8e18d71b7bb4eaceb4f18f743b6bd59fe481a', 'report_api', 'qwerty123', '2021-10-12 18:22:05', NULL),
('0af00c693ce99423e41b6b0c85cec982a14bc3cf', 'report_api', 'qwerty123', '2021-10-26 20:09:31', NULL),
('0af3b7735ad97e1803808286154280be1904542c', 'report_api', 'qwerty123', '2021-10-11 18:40:39', NULL),
('0bbe4556cc5f0fca5284347ab8bbabf33540f5e6', 'report_api', 'qwerty123', '2021-10-08 22:59:26', NULL),
('0ca7fb15b40af1f405588157312033e132d740b8', 'report_api', 'qwerty123', '2021-10-06 00:10:06', NULL),
('0dda05c0c09c6eeadf373695f346baa96302e6a8', 'report_api', 'qwerty123', '2021-10-10 18:15:21', NULL),
('0e4ecb2580a70d6564bfcb67d5840b0fb429860a', 'report_api', 'qwerty123', '2021-10-21 20:13:24', NULL),
('0e79b998738cff47a42407cd732cc96e58dcd9cf', 'report_api', 'qwerty123', '2021-10-26 22:18:26', NULL),
('0f9b853452ac666e1d51359d5b825de92421f9d7', 'report_api', 'qwerty123', '2021-11-10 07:21:17', NULL),
('0fe2c0f70597daee99ddee9965cae6cc50a74ccf', 'report_api', 'qwerty123', '2021-10-12 18:28:59', NULL),
('10021ecc617a8d03f8b4f9859c881389178901b8', 'report_api', 'qwerty123', '2021-11-09 06:58:41', NULL),
('108f8a7f23660f514ff9e88caea4d4347313dc65', 'report_api', 'qwerty123', '2021-10-07 15:28:29', NULL),
('10fcc08b3a7cd1cdf80085afc1ad3ee1aa73d620', 'report_api', 'qwerty123', '2021-12-23 02:55:17', NULL),
('115007c655dcb3cacb32780168833c93d97108b8', 'report_api', 'qwerty123', '2022-01-04 08:54:00', NULL),
('11d4a37c1b7bd5a8188f5cadf7fb7e46b83ba205', 'report_api', 'qwerty123', '2021-10-12 23:40:35', NULL),
('125aefe17727d6720b2375fc59c929fd0ccbfc51', 'report_api', 'qwerty123', '2021-11-16 07:15:43', NULL),
('1410e2d087f540b6edc5ba87dd1bde64c510b91c', 'report_api', 'qwerty123', '2021-10-16 19:58:35', NULL),
('143f9427b5ead0d79a2e5ce10b865eeec1c7aed1', 'report_api', 'qwerty123', '2021-10-24 16:40:51', NULL),
('14cf57a702510e0c7d5c4bae31f4e172de752754', 'report_api', 'qwerty123', '2021-10-20 18:21:22', NULL),
('15f124b348b71e6ce746c542f07d151595d2be6f', 'report_api', 'qwerty123', '2021-10-24 18:13:53', NULL),
('16b5edec4af2b95000043036a775446f3d057c08', 'report_api', 'qwerty123', '2021-10-03 15:28:32', NULL),
('16fb99749126f4c5d7ca4e9a34fbec2241a4d52a', 'report_api', 'qwerty123', '2021-10-07 13:54:54', NULL),
('18515c96d1d12d10eedf5adc5deb5fefad62925f', 'report_api', 'qwerty123', '2021-11-02 07:25:21', NULL),
('18818e540cbb6084d8a53817fa8592f42669c91c', 'report_api', 'qwerty123', '2022-01-06 01:45:19', NULL),
('19567de6cba8dcf1e087a815440db3a98d80e4e9', 'report_api', 'qwerty123', '2022-01-05 13:12:33', NULL),
('1bbe98b086815e6c0a4dfbbfb08f2da281c20701', 'report_api', 'qwerty123', '2021-10-12 23:32:59', NULL),
('1c0e4056592a9741c165448cd3d1493700e6972b', 'report_api', 'qwerty123', '2021-10-04 23:08:14', NULL),
('1c7617dd3c37da2409809fabaab2bf2d93a5eb0b', 'report_api', 'qwerty123', '2021-10-03 01:28:00', NULL),
('1cd6bf5c490e41a5ef6343ddfb953737b32b63f8', 'report_api', 'qwerty123', '2021-11-04 09:38:24', NULL),
('1cf1506cab7072502fc7b6e094ebe9867ad3f746', 'report_api', 'qwerty123', '2021-11-03 07:46:33', NULL),
('1d1da85c5319f4b1d60a1be3075e5f3e3b280ea7', 'report_api', 'qwerty123', '2022-01-04 13:48:34', NULL),
('1d78cdb2d6cac6df4ecc4676e113c00cca4bae5e', 'report_api', 'qwerty123', '2021-10-07 15:27:19', NULL),
('1df2681ed15bcf2139d12ea6d3334bcd960d1d90', 'report_api', 'qwerty123', '2021-11-16 08:36:22', NULL),
('1e5504b4b205b242666d8e865473989100ca7905', 'report_api', 'qwerty123', '2022-01-04 12:24:11', NULL),
('201f892f21866a0bf30f5e4cadb45b8ed809c5b8', 'report_api', 'qwerty123', '2021-10-07 15:18:52', NULL),
('204d8ef7a66a424ff1160270cd01d5461917dd1a', 'report_api', 'qwerty123', '2021-11-16 06:53:46', NULL),
('2232cab7b0c67d4be0e1f39d2285c55594d8d76d', 'report_api', 'qwerty123', '2021-12-21 08:07:47', NULL),
('230ea7379b4e963cd49dd39b85e85dd5b07b03bc', 'report_api', 'qwerty123', '2021-10-03 14:06:11', NULL),
('23f28c5b0581ce5a969d61f7d7bcb3bc1564169b', 'report_api', 'qwerty123', '2021-10-09 23:33:13', NULL),
('244a13c1515b20e406e07e467ce8c910e6d77aa1', 'report_api', 'qwerty123', '2021-10-20 01:55:47', NULL),
('245a149aa44769b71a9cde79deeb622ac0ce1ca6', 'report_api', 'qwerty123', '2021-11-02 09:33:58', NULL),
('245d1448df0874d82fafc353a57b42dbab1ad909', 'report_api', 'qwerty123', '2021-10-07 15:18:52', NULL),
('248732aea5d13c04215966f513717f9f55aeab73', 'report_api', 'qwerty123', '2021-10-13 00:58:20', NULL),
('24b156ce757689f2b2dcb4d7d5f1f5bc905e6523', 'report_api', 'qwerty123', '2022-01-04 06:11:46', NULL),
('25003588be1e4c7d846ca4f6369138b9591bb66e', 'report_api', 'qwerty123', '2021-10-14 00:58:59', NULL),
('27cb2dd46ee4b93be591474e1851064198ae8a7e', 'report_api', 'qwerty123', '2021-12-28 12:17:59', NULL),
('27d5033e38924228858f0967ec0ef7d7cff0df1a', 'report_api', 'qwerty123', '2021-10-12 23:42:39', NULL),
('28a25381ffdb9f2372f9f7d9694f81199e04b86b', 'report_api', 'qwerty123', '2021-10-25 19:34:57', NULL),
('28c9e327471e9ef5996e4976f3e88f1e00e03a44', 'report_api', 'qwerty123', '2021-10-07 15:29:12', NULL),
('28eaa1f19c3aa48ca7aca863af8749db77fc3f75', 'report_api', 'qwerty123', '2021-10-27 13:15:34', NULL),
('28f9d1c634458759a56a0f7109c74d8da116895a', 'report_api', 'qwerty123', '2021-12-28 12:16:12', NULL),
('290b2cde4005e9a61d0f12afaa19ba287f48ac54', 'report_api', 'qwerty123', '2021-10-27 17:38:10', NULL),
('291737bb73c96639317253131982e49e578bcbae', 'report_api', 'qwerty123', '2021-12-28 05:46:52', NULL),
('2a07f60bbd78b95da31c962f9b66230e6e4eb0af', 'report_api', 'qwerty123', '2021-10-05 12:17:58', NULL),
('2b9218d180950abf9237db728595d212ba941146', 'report_api', 'qwerty123', '2022-01-05 14:18:27', NULL),
('2c9bdee29049f8348abea0f7ef6307216d2ccce8', 'report_api', 'qwerty123', '2021-11-02 04:01:07', NULL),
('2ce3430e4188d5014c6381f9ef8870f160177e49', 'report_api', 'qwerty123', '2021-11-05 03:45:36', NULL),
('2d1823f2eebad9cde6e00c6a9f1c423f0c0cf5cc', 'report_api', 'qwerty123', '2021-10-20 19:00:49', NULL),
('2d5d3d5a0694205338170f046ff5e38557b3bf26', 'report_api', 'qwerty123', '2021-10-24 19:24:39', NULL),
('2e9e4a87207fd56857555f3e43c61a97c1b9a3cd', 'report_api', 'qwerty123', '2021-11-17 03:45:14', NULL),
('2f0e6f0cfa00b7b5cce7235d391c7f7600e60595', 'report_api', 'qwerty123', '2021-10-18 21:16:35', NULL),
('2f25e6de32c651843252042a5b19b52582328b4f', 'report_api', 'qwerty123', '2021-10-12 23:42:13', NULL),
('307ed37f9eed73108c5fefa263a9ff956ee10300', 'report_api', 'qwerty123', '2021-11-05 05:53:25', NULL),
('30a252bd50db46c3c8802eb951dd985e2f9879e0', 'report_api', 'qwerty123', '2021-11-03 05:56:18', NULL),
('31dde63d174a79bec72c62ba4724049553ff9bc4', 'report_api', 'qwerty123', '2021-10-09 20:38:16', NULL),
('320e250e5da96c687f96876f427c75f408574abe', 'report_api', 'qwerty123', '2021-10-27 13:08:01', NULL),
('33b08d4b29658c95853df84888d8e20e904fc876', 'report_api', 'qwerty123', '2021-10-18 01:50:08', NULL),
('342e54c12c9efe0ffd56347a4b6a1f501b9a9335', 'report_api', 'qwerty123', '2021-10-03 00:23:17', NULL),
('345b0593be0144fd0c3cd09248f50ec2dff711fa', 'report_api', 'qwerty123', '2021-10-13 21:19:05', NULL),
('34e9fedad1ff861fd1418723809e2950256f9b37', 'report_api', 'qwerty123', '2021-10-15 22:32:59', NULL),
('35483d1b7e71436f7cde73c8c89a8c247054d9a8', 'report_api', 'qwerty123', '2021-10-10 18:35:25', NULL),
('36511b26ea6781ade8347f084d00b9b848b67a74', 'report_api', 'qwerty123', '2021-11-02 02:16:38', NULL),
('36add6175320ac273179ae6a6f8a936ba47f93c1', 'report_api', 'qwerty123', '2021-11-09 03:57:16', NULL),
('36e3c37ce4c72b689cbfcfd4943034d98b22bcca', 'report_api', 'qwerty123', '2021-10-18 20:10:41', NULL),
('370ea72dda1b2ecf41873eeb14cb499cf39d1879', 'report_api', 'qwerty123', '2021-10-10 00:40:00', NULL),
('3730d31ec67a17f804d1d41c42c742b507c9ed91', 'report_api', 'qwerty123', '2021-10-12 23:34:53', NULL),
('37686632adcd28da5467c92daac04aa51d4e00a2', 'report_api', 'qwerty123', '2021-10-11 19:57:10', NULL),
('38f346a7dae11139183246aca57d13210a53de1a', 'report_api', 'qwerty123', '2022-01-05 13:55:52', NULL),
('3a503769c8e4a607be5caa71103a4d83493794a7', 'report_api', 'qwerty123', '2021-10-27 15:18:49', NULL),
('3b47097f6735015f89178141a900f960146b6a16', 'report_api', 'qwerty123', '2021-10-03 15:51:19', NULL),
('3b65f4f1cfe98fcdcae91b1dedb2ff08ebf0ae8b', 'report_api', 'qwerty123', '2021-10-18 15:54:54', NULL),
('3c4d7bbc7bd3898c1bbafabf099bc957b8552a22', 'report_api', 'qwerty123', '2021-11-16 14:42:38', NULL),
('3cb347b5ce583c79719f6c7be285a5d04059832d', 'report_api', 'qwerty123', '2021-12-27 06:42:39', NULL),
('3d37eed405e094383f73338c1a7479ce269d8c01', 'report_api', 'qwerty123', '2021-10-06 19:48:37', NULL),
('3d80e0c8fb2017b8526f2d73787841770f2cbc7d', 'report_api', 'qwerty123', '2021-10-03 00:05:50', NULL),
('3ed4c42a53ccfe16bd35ef3847e6f278a4457a0e', 'report_api', 'qwerty123', '2021-10-25 17:30:01', NULL),
('3fe9fb0b8a49bcf0f64964bbdf19e461f243db8a', 'report_api', 'qwerty123', '2021-10-14 16:29:53', NULL),
('406551df52abb0c23f1372a2f4305b2401e4e4ae', 'report_api', 'qwerty123', '2021-10-11 15:26:15', NULL),
('411089cdf41f19ab0b4533d3aa1f2f1f494cc68c', 'report_api', 'qwerty123', '2021-10-17 17:55:03', NULL),
('412079f3cec77582e8c767a2b7eb54e31bbba774', 'report_api', 'qwerty123', '2021-10-17 00:00:34', NULL),
('414d65711c735994eddf900a9586906210d9b962', 'report_api', 'qwerty123', '2021-10-29 04:33:19', NULL),
('416d177435de930ab1e488c0ac7d3432280ac32b', 'report_api', 'qwerty123', '2021-11-04 08:36:22', NULL),
('4191e4a96fa18958d395e6d6c314797e19d8a6a8', 'report_api', 'qwerty123', '2021-11-10 13:17:58', NULL),
('42b5312a504776fdf5f9be61e60d41ddf1314548', 'report_api', 'qwerty123', '2022-01-04 12:26:28', NULL),
('4308be909b4b616e0d343f23916e80973a4833bc', 'report_api', 'qwerty123', '2021-10-03 15:51:54', NULL),
('431183737c68de0a7107c25638e2b52406fda1f8', 'report_api', 'qwerty123', '2022-01-04 13:00:29', NULL),
('4378a280cdbae4a3d2beeeb9b37ac0367b7bce7a', 'report_api', 'qwerty123', '2021-10-07 15:20:19', NULL),
('4430926291d98bc878b5fc37d64a46865fd7ef4e', 'report_api', 'qwerty123', '2021-10-05 20:09:03', NULL),
('448d4f0720b725e4a9302421a6b3f59b7b13cceb', 'report_api', 'qwerty123', '2021-11-16 09:43:38', NULL),
('45fa36c44553cb0eff7b64a78187bc047e1c7cea', 'report_api', 'qwerty123', '2021-10-07 16:14:25', NULL),
('47ce362f892caf0b62d2350fdc2afbf7f76a0edf', 'report_api', 'qwerty123', '2021-11-08 10:07:11', NULL),
('48c5a371289a466a66a06208e8bf9b0e46b45e00', 'report_api', 'qwerty123', '2021-10-03 15:51:33', NULL),
('4a4ff04584dc0f988382055222ae97ef675e2317', 'report_api', 'qwerty123', '2021-12-29 11:21:02', NULL),
('4a9c4c8420128d729a3f306bc4871fd8407c8f77', 'report_api', 'qwerty123', '2021-10-12 20:53:21', NULL),
('4acefd2b215b50eab1f677fdc5e56ea7292dcf63', 'report_api', 'qwerty123', '2021-10-06 21:39:45', NULL),
('4b8cf0236a93f6f5c152a28e366f8b661b6f038a', 'report_api', 'qwerty123', '2021-11-10 05:39:54', NULL),
('4c72854087bd05c433b122d59c9a4b088a2ae0b4', 'report_api', 'qwerty123', '2021-10-06 22:04:03', NULL),
('4d13ce0adba1c04f097242a449e28419f4e419c8', 'report_api', 'qwerty123', '2021-10-12 18:22:57', NULL),
('4e6a5a9f6d3694391a0e120dedfe459bfe3a6072', 'report_api', 'qwerty123', '2021-12-27 13:41:57', NULL),
('5145caa9ab5e26025a3dce26a9ab2990af249eb9', 'report_api', 'qwerty123', '2021-10-06 23:03:11', NULL),
('51ba4aec697769ef02318e06f97d9ed2aa324cc0', 'report_api', 'qwerty123', '2021-11-05 02:34:53', NULL),
('528f7d3e834ed0f94cf5fb9413dca516edfd2816', 'report_api', 'qwerty123', '2021-10-05 13:47:29', NULL),
('52e781da0893d4c851cd924f2a0ffd60d9a3aaed', 'report_api', 'qwerty123', '2021-11-05 03:43:57', NULL),
('53724d2b99dd213e2d72a69e626411808e36f2dc', 'report_api', 'qwerty123', '2021-10-20 17:33:48', NULL),
('53bee4ca80e2e360b7e0e591e6fe7d84568e679d', 'report_api', 'qwerty123', '2021-11-16 08:17:50', NULL),
('542d7f4c528ed22aaa34dd44d41707b515a14003', 'report_api', 'qwerty123', '2021-10-21 19:12:21', NULL),
('550928447395869efad61c0d6ea18b7688cd369e', 'report_api', 'qwerty123', '2021-10-11 15:09:39', NULL),
('5569830ada4282355f78b02c117725b67c182757', 'report_api', 'qwerty123', '2021-10-04 15:27:49', NULL),
('556a60cb900e8744c005f9b5f7538c3f1e9b124c', 'report_api', 'qwerty123', '2021-10-11 18:09:59', NULL),
('570a1ae5123047c951db49f1340e62f8e3378244', 'report_api', 'qwerty123', '2021-11-17 07:42:37', NULL),
('5826966ba7005b88123ff7cb3f208fb1eb34e250', 'report_api', 'qwerty123', '2021-10-29 02:34:18', NULL),
('5867094c0470793765b6fa30afbcd6037906fc88', 'report_api', 'qwerty123', '2021-10-07 15:24:42', NULL),
('58abed0bc9a59009190cfd6b98cdfb92ba64fc9b', 'report_api', 'qwerty123', '2021-10-28 10:43:13', NULL),
('58b7aaa79bc3fc0f00437d3a4fc599f8ab2d7da2', 'report_api', 'qwerty123', '2021-10-12 22:13:50', NULL),
('58fe595af00878c4f0b279733a8bb55133473f88', 'report_api', 'qwerty123', '2022-01-04 03:56:06', NULL),
('5957549d2bb8400a589560f9d7b94203d453ab33', 'report_api', 'qwerty123', '2021-11-01 06:59:32', NULL),
('59e71f2d873e073cef4607e02b905065355b0711', 'report_api', 'qwerty123', '2022-01-04 09:14:55', NULL),
('5a2ab94a1590e11420e90511eee563d4549e1d2e', 'report_api', 'qwerty123', '2021-10-04 00:05:32', NULL),
('5a3eba57e71f385c5660e1a0877ab03638a36087', 'report_api', 'qwerty123', '2021-12-28 12:01:47', NULL),
('5aa3026ceaf534417986e2eadb0d82db650936c2', 'report_api', 'qwerty123', '2022-01-04 08:43:29', NULL),
('5aa93a875e77792f60020c3492dc2540cd0c986b', 'report_api', 'qwerty123', '2021-11-01 10:50:04', NULL),
('5b62f2fa72f2f87f2d95cb331bbbee9119e9b34b', 'report_api', 'qwerty123', '2021-10-21 19:39:44', NULL),
('5c19bc336532a959a026475ef4e15bdc412cc3d0', 'report_api', 'qwerty123', '2021-10-16 22:58:49', NULL),
('5c6d1878ee7b4f3d78859ca32ebb30e077f86ebd', 'report_api', 'qwerty123', '2022-01-05 14:29:06', NULL),
('5ff1eba36286016904fd1b60cf92e0a33fbbf88d', 'report_api', 'qwerty123', '2021-11-08 08:00:51', NULL),
('604c70618d63b215b8de2fabdc83387eef4034bd', 'report_api', 'qwerty123', '2021-10-13 21:00:35', NULL),
('60c7c5a0ac208888ac86cba6f5e28968aa885643', 'report_api', 'qwerty123', '2021-10-11 18:42:00', NULL),
('60d7140918a984fe55a662197596981763fee919', 'report_api', 'qwerty123', '2021-10-09 23:33:23', NULL),
('60d9be051177d5efc9795286e4355a04a50168ca', 'report_api', 'qwerty123', '2021-11-01 05:45:57', NULL),
('610b8f7a502462a50bdee319f00cb873f4a14ff8', 'report_api', 'qwerty123', '2022-01-04 09:01:17', NULL),
('61377aa4d6c067700508800192a9c34d27b6bfb8', 'report_api', 'qwerty123', '2021-12-29 05:00:52', NULL),
('61f8dac62a8be3763b225c081b668d39279d0259', 'report_api', 'qwerty123', '2021-10-25 20:45:08', NULL),
('6341dbf67c975b71aef0791662620800f726b94d', 'report_api', 'qwerty123', '2021-10-19 20:54:33', NULL),
('63af977f2133680f61f5d071eb777ade1a245f80', 'report_api', 'qwerty123', '2021-10-14 00:36:40', NULL),
('64e5a503c741ca5bdb68c993d0ade7deeb343fb9', 'report_api', 'qwerty123', '2021-11-16 11:22:53', NULL),
('65adba010a9b9c41f9238cd9d19970ba33afc686', 'report_api', 'qwerty123', '2021-10-04 00:31:23', NULL),
('65d5921e24666ace4e2b40aab6514cd1b75e51bf', 'report_api', 'qwerty123', '2021-10-18 00:20:47', NULL),
('65f4a8d50d842cd598e56dac9d302e8d896ec2a4', 'report_api', 'qwerty123', '2021-10-19 22:43:39', NULL),
('661e7e7086a3b19299d7897be395918ed3ffd79d', 'report_api', 'qwerty123', '2022-01-04 09:05:47', NULL),
('667e6d5ce604c5ef234920f7bb2fdb95245b0676', 'report_api', 'qwerty123', '2021-10-04 15:01:11', NULL),
('66f79babc37334c6e1105ad6a01f28485d497336', 'report_api', 'qwerty123', '2021-11-08 08:15:14', NULL),
('672e1b043ae2f02d2224455cde47a89ed277abca', 'report_api', 'qwerty123', '2021-12-28 12:13:48', NULL),
('6845cc2e9e783ab1c99196ff060950332ba44a7f', 'report_api', 'qwerty123', '2021-10-10 23:05:39', NULL),
('689f047a65292ca7cdc4fe8b9ee471a452ae0a48', 'report_api', 'qwerty123', '2021-10-07 15:28:11', NULL),
('69a532e8724975352e604718adf98cffd8d3553c', 'report_api', 'qwerty123', '2021-12-28 02:32:18', NULL),
('69c3afe835fc4f57b8272218fe030cd4127a4354', 'report_api', 'qwerty123', '2021-10-16 20:57:59', NULL),
('69d635083648ba207d0969c8ea0256cfcc6311b2', 'report_api', 'qwerty123', '2021-10-25 18:10:56', NULL),
('6aa313a6b2a650caee83078311be70675ecec6a5', 'report_api', 'qwerty123', '2021-10-11 17:39:19', NULL),
('6b373cc05681e30a6d4251dd16391ffee523bae9', 'report_api', 'qwerty123', '2022-01-04 12:15:51', NULL),
('6b71465e27ee76614ab755ac8cf0f5871d65ad1d', 'report_api', 'qwerty123', '2021-10-11 19:42:36', NULL),
('6c068d2c0d219608f28b62fcd1e5e5b7af18280a', 'report_api', 'qwerty123', '2021-10-13 01:09:30', NULL),
('6c86c024f211049611bd92ad0863285fba0d4961', 'report_api', 'qwerty123', '2021-10-26 16:06:08', NULL),
('6ccffcf207d8c5269c398002ec00b27010415197', 'report_api', 'qwerty123', '2021-11-04 08:21:34', NULL),
('6d0a05bc7e5fffd9a555925b63259ed05cca2077', 'report_api', 'qwerty123', '2021-11-10 07:36:31', NULL),
('6d82a09157ad5ccc3f5e732f4cd54061622272c3', 'report_api', 'qwerty123', '2021-10-07 19:51:40', NULL),
('6edb717b4e52d559841a6f4a10f1a1ff8dad6fc3', 'report_api', 'qwerty123', '2021-10-12 21:54:08', NULL),
('71f42a0a9ec66ed0e17b8b0b9654d716ce7b5a02', 'report_api', 'qwerty123', '2021-11-10 07:26:40', NULL),
('7212b166f613f4a19ba680e0dec58846a3df2cbe', 'report_api', 'qwerty123', '2021-10-05 00:40:14', NULL),
('721ed95966e34a1ed40cf4a132134e189b4c91a8', 'report_api', 'qwerty123', '2022-01-05 07:02:27', NULL),
('72364718be8656fa28ccedc465800808263fd993', 'report_api', 'qwerty123', '2021-10-11 14:52:06', NULL),
('72af3085ab3ff095a938407ab9bd98445cefdeda', 'report_api', 'qwerty123', '2021-11-09 14:18:24', NULL),
('72c94ef56596de5c276d668c3ce86d93d580a587', 'report_api', 'qwerty123', '2021-11-03 06:16:00', NULL),
('739d92dcb9c62a1345fec365799201464ad3f0d8', 'report_api', 'qwerty123', '2021-10-18 20:25:08', NULL),
('7536db4fc53a5ccc9060aeca669f94b7fd67a321', 'report_api', 'qwerty123', '2021-10-03 16:57:33', NULL),
('75722e6b282e7ce5843d6d6601ccb08b865fe80d', 'report_api', 'qwerty123', '2021-10-17 19:32:10', NULL),
('7697dd56107a0d29132f6a85a006885801b6b4a0', 'report_api', 'qwerty123', '2021-12-27 07:30:52', NULL),
('7730fe9ec20ebb9bd7dbeac25fd746eae4fd5a56', 'report_api', 'qwerty123', '2021-10-18 22:50:58', NULL),
('778bcd8d1b4f63279d2370af482907827f9d5e63', 'report_api', 'qwerty123', '2021-10-14 19:41:27', NULL),
('77a179e8543a1921cbaaeb3c6d4a48e85f63f22e', 'report_api', 'qwerty123', '2021-10-16 22:58:57', NULL),
('7804125767d2b244219afc89766b724b3f03ff1a', 'report_api', 'qwerty123', '2021-10-18 22:17:12', NULL),
('7814544232a2a97a1b167b725f3a595dde556285', 'report_api', 'qwerty123', '2021-12-29 05:31:25', NULL),
('78402b0bbab81ea0d0c700ae0b0fdee2f0d923ab', 'report_api', 'qwerty123', '2021-10-03 15:28:32', NULL),
('7a105b3a104663616f97f73ace72c774331a90bc', 'report_api', 'qwerty123', '2021-10-11 15:14:47', NULL),
('7aa744fd56b5db96d8e058c847e97178a903ca1a', 'report_api', 'qwerty123', '2021-10-12 23:33:18', NULL),
('7aabc8ae358815a926a334d7577e65be4a382213', 'report_api', 'qwerty123', '2021-10-11 19:42:07', NULL),
('7b5f85901437ca56bd2daaa3be3b67c724b82202', 'report_api', 'qwerty123', '2021-10-17 19:32:47', NULL),
('7baee9fbb7e41a33a4411d181bcf7c70af7342e3', 'report_api', 'qwerty123', '2021-10-27 14:15:30', NULL),
('7bdc1587f1e98cc5723ce4e0c9e7f1fb0c6b8b20', 'report_api', 'qwerty123', '2021-12-27 09:24:24', NULL),
('7bff6bb0753203da463e226d0abcaad0e4d0d6fe', 'report_api', 'qwerty123', '2021-10-16 18:21:40', NULL),
('7c23a23524b00cf1fdf8e8c5f8c7668e5a8850a6', 'report_api', 'qwerty123', '2021-10-02 19:47:09', NULL),
('7cd30edfc8d4f55d56f6c5f1ed59be7b3294dddd', 'report_api', 'qwerty123', '2021-11-03 06:29:36', NULL),
('7d2392a59e2eac835cd8f963193e49fc83d4c103', 'report_api', 'qwerty123', '2021-12-27 07:53:17', NULL),
('7da338776d56e5bfd5aa8c3d82802315bf0af3e0', 'report_api', 'qwerty123', '2021-11-03 05:18:17', NULL),
('7dbf6511c4a07c88a656ff840e547ed715bec54b', 'report_api', 'qwerty123', '2021-12-23 04:01:27', NULL),
('7f070350d570407acc371f15d4714f3c91beaa47', 'report_api', 'qwerty123', '2021-10-17 01:14:39', NULL),
('80382ddd81e1ddeb5c0d88aa68c67294bd16db0c', 'report_api', 'qwerty123', '2021-10-26 22:41:17', NULL),
('807158a9d999cb74ce362b0a3731c40f2677ad67', 'report_api', 'qwerty123', '2021-12-29 12:30:52', NULL),
('80ca76b71508b3ee85c51f4785429c2074e3f9fc', 'report_api', 'qwerty123', '2021-12-27 06:13:03', NULL),
('8204de90a955f282b8e5205297d3e9d750b147e6', 'report_api', 'qwerty123', '2021-10-07 15:19:10', NULL),
('821c38f9fd99850af65f5e7e89b02879cd4b3eaf', 'report_api', 'qwerty123', '2022-01-04 12:38:43', NULL),
('821dd9ab4773c70800ba4ac9fbdbcf5a770cbad4', 'report_api', 'qwerty123', '2022-01-04 06:43:04', NULL),
('822dd5e146b4517b659fbaf3ffbddce56a4e88ad', 'report_api', 'qwerty123', '2021-11-16 12:28:07', NULL),
('827514e922ed9ebede9575ba18372e3d87c22eac', 'report_api', 'qwerty123', '2021-10-07 12:33:38', NULL),
('82c178771d33924c31f7dde0c3b9dedcb4412a67', 'report_api', 'qwerty123', '2021-11-05 03:46:03', NULL),
('83ac3975e0a2908f92eaa09868ed9c7b49d38172', 'report_api', 'qwerty123', '2021-10-07 14:49:40', NULL),
('85840f6264cb914e0659938ebcb363952031a668', 'report_api', 'qwerty123', '2021-11-01 05:47:13', NULL),
('858c864a54c7201cd1453c9b30f60daf2022c9a6', 'report_api', 'qwerty123', '2021-10-15 22:57:32', NULL),
('86087f4b1daebf44b083cf8512c8540e275f0130', 'report_api', 'qwerty123', '2021-12-27 10:29:06', NULL),
('8611fe88bc05c6458605066f1b2c885f87f4e69b', 'report_api', 'qwerty123', '2021-12-23 04:08:15', NULL),
('868ee3193fab15e4dc0204cf3ec3bda5993ddf58', 'report_api', 'qwerty123', '2021-12-21 08:55:45', NULL),
('8737a64591542b0755ff14517cb057c66aeb0f39', 'report_api', 'qwerty123', '2021-12-28 07:41:36', NULL),
('879fdb195ce5d58fc309c4dc0e390962ab4be123', 'report_api', 'qwerty123', '2021-10-20 00:28:50', NULL),
('87ae4b7bd214ea3299c6f5ecf380aed44fb934cc', 'report_api', 'qwerty123', '2021-10-19 19:24:33', NULL),
('8858a696c53bc609fe93db40ab41fc6ff3f2aa85', 'report_api', 'qwerty123', '2021-10-13 00:36:47', NULL),
('88f136c42131335f327c568295fa5e6621e532f3', 'report_api', 'qwerty123', '2021-10-11 17:55:13', NULL),
('894d383cedb40372730f9b2be941611898463cab', 'report_api', 'qwerty123', '2021-10-11 18:42:59', NULL),
('89662e8cdfed62c911f2d0ab34c9d4585c6c3960', 'report_api', 'qwerty123', '2021-10-02 21:46:39', NULL),
('8b2fee387e353892281025c5865e95266b15b78e', 'report_api', 'qwerty123', '2021-10-11 17:52:59', NULL),
('8c4f88f7a14f77f7f1b7613b6908bd7a99d9bd80', 'report_api', 'qwerty123', '2021-10-14 18:49:36', NULL),
('8d6a228579c65b5941bcf21dfbb1f8d1fa972a0f', 'report_api', 'qwerty123', '2021-10-11 18:05:59', NULL),
('8e9e09a1bb84006c027c7a096ead1d26ac98b6a2', 'report_api', 'qwerty123', '2021-10-04 23:57:05', NULL),
('8ecb2f76245c2bfdb8f0732585bf76ec00878a83', 'report_api', 'qwerty123', '2021-10-25 19:57:24', NULL),
('8ed76dba2565b9093d95c403e6ab95bd0060d891', 'report_api', 'qwerty123', '2021-10-20 17:49:06', NULL),
('8fad58b03c3f1df752d9b170b4bbccf65792f6d3', 'report_api', 'qwerty123', '2021-10-03 22:46:22', NULL),
('9023b304479338c344c9fd148a1ca5800a74fdda', 'report_api', 'qwerty123', '2021-10-13 17:40:29', NULL),
('902a9065dc43e8a05f6ec0ae26dc355b9d0ff419', 'report_api', 'qwerty123', '2022-01-05 08:38:56', NULL),
('9242757ea35d4f6bc3a8bd6f6b0dea5144366acf', 'report_api', 'qwerty123', '2021-10-12 19:17:54', NULL),
('9302fc4eaf3f0bc6c6993fcb1fa8cd39ba0acc9b', 'report_api', 'qwerty123', '2021-11-01 04:05:13', NULL),
('931c5057fac2aa5d7c9f5b9d5e05b3a9f2705068', 'report_api', 'qwerty123', '2021-11-01 03:45:50', NULL),
('966560f5fbeec7ed1123a6e428af841261cec590', 'report_api', 'qwerty123', '2021-10-20 00:15:49', NULL),
('973424e3a34686664b099e3742338f9d6e1bef58', 'report_api', 'qwerty123', '2021-10-03 01:40:43', NULL),
('97700a3266f58b600a0a3b352632eb599bdb6e7c', 'report_api', 'qwerty123', '2021-10-05 22:45:50', NULL),
('9784fb0597b1172841243a181dec5dbce64ff122', 'report_api', 'qwerty123', '2021-10-17 18:54:24', NULL),
('993f6fb512b38c34891391ef64b293ef257dba61', 'report_api', 'qwerty123', '2022-01-05 13:57:41', NULL),
('99f91880a0cd4aaeee4d65a5f2a045374353f87f', 'report_api', 'qwerty123', '2021-10-06 14:52:42', NULL),
('9acf4e2812f5821cf27f53aa0c4cb9d9441698de', 'report_api', 'qwerty123', '2021-10-11 17:55:49', NULL),
('9b6be27359a0d15bf3bdc404eff9d1b4f6688875', 'report_api', 'qwerty123', '2021-10-24 17:02:39', NULL),
('9ba8498df5d6d90d49d1beeb02754ed86be9e09f', 'report_api', 'qwerty123', '2021-10-12 18:22:31', NULL),
('9f4f0a54e23da45a707f41e1ad0bfebf486b113a', 'report_api', 'qwerty123', '2021-10-04 23:56:43', NULL),
('9f7c4d68a0788cecfbf402e1413c2b3b0902342e', 'report_api', 'qwerty123', '2022-01-04 12:22:44', NULL),
('a0095c8700ac6ff2341080232200dc5128c475b9', 'report_api', 'qwerty123', '2021-11-16 06:43:56', NULL),
('a14ccff15b0c78a2d2d3af60a37c9e53a04e15de', 'report_api', 'qwerty123', '2021-10-11 15:09:49', NULL),
('a19d09a16840562620a43b2552c5c9c83e071610', 'report_api', 'qwerty123', '2021-10-06 20:54:09', NULL),
('a19f454c1197d077964532af9b2dfdd4423620c7', 'report_api', 'qwerty123', '2021-12-27 14:18:59', NULL),
('a25f9b0aff74b2d842f938633afc5f10383d87d8', 'report_api', 'qwerty123', '2021-10-07 15:30:00', NULL),
('a2e65e08640b1c00d38d4d80ed1e2aad6cd4a503', 'report_api', 'qwerty123', '2021-10-07 15:27:28', NULL),
('a30ff1e299f8094f97295c3422263cbdcd0fa0eb', 'report_api', 'qwerty123', '2021-10-28 11:44:56', NULL),
('a31089a64b5ece4e0e22f43ab03f58d8820b0c8d', 'report_api', 'qwerty123', '2021-11-09 12:25:29', NULL),
('a3ae5173a6cb4c3c961dfe39b63537e83d8f4f45', 'report_api', 'qwerty123', '2021-11-16 13:27:05', NULL),
('a4846e45e52c55649592e4d1b5a0f719f36fd6e7', 'report_api', 'qwerty123', '2021-10-20 17:15:43', NULL),
('a511a665497e5f9602d20d08c52d51b239a91d90', 'report_api', 'qwerty123', '2021-10-02 22:28:56', NULL),
('a6bc5459143df9f433c67ad9c8b191dce0e834f7', 'report_api', 'qwerty123', '2021-11-10 09:50:20', NULL),
('a7679ef6b313a23c9624fd24e337da93ca304823', 'report_api', 'qwerty123', '2021-10-11 15:09:39', NULL),
('a7745daa22aa06a8fd3e73ca0b3bfc5029afe3d4', 'report_api', 'qwerty123', '2021-10-13 18:48:10', NULL),
('a7df6d7e6312bbe604aa8ed2770e732fb9489165', 'report_api', 'qwerty123', '2021-10-10 00:44:12', NULL),
('a8a10ea9372fb20afe9b75c49e162dae2fa6f04f', 'report_api', 'qwerty123', '2021-10-25 19:58:06', NULL),
('a9875ad50efecc7cfdfeab9cf055954f9b51d939', 'report_api', 'qwerty123', '2021-10-04 15:27:51', NULL),
('a9aace0770fae6744a645bacec4935d42832779b', 'report_api', 'qwerty123', '2021-10-11 19:22:55', NULL),
('aa4af91b9a83c87b1a3db310684ffd4fdcb3215b', 'report_api', 'qwerty123', '2021-10-25 20:29:53', NULL),
('aa71d8150b15729e6a3349eba69abd360d94a0ef', 'report_api', 'qwerty123', '2021-10-12 19:55:55', NULL),
('ab32c7a316a3497d91d5b33d4408494fe00c2a59', 'report_api', 'qwerty123', '2021-10-13 00:58:56', NULL),
('abfe47e3b55248340be760ceb0bafc9cc7117343', 'report_api', 'qwerty123', '2021-10-27 12:13:55', NULL),
('ac97aa36d3c3a3f12d9ddcae3eb30e85b0b6723d', 'report_api', 'qwerty123', '2021-10-12 19:46:15', NULL),
('ad50e774b8251e6099e9bdb0714225811e2bfdaf', 'report_api', 'qwerty123', '2021-10-13 01:08:42', NULL),
('aecdcf641716b1e77080ead37cb833bc957fdc80', 'report_api', 'qwerty123', '2021-10-12 18:46:32', NULL),
('b00d1d40cb5a5cfb756fcb290353fdac0c422dfb', 'report_api', 'qwerty123', '2021-10-12 19:49:04', NULL),
('b11d223f999bc67fd74d533b2a319a1fbb24939c', 'report_api', 'qwerty123', '2021-10-19 16:16:45', NULL),
('b172ef3a95c4ef364e881c37993357659bc76351', 'report_api', 'qwerty123', '2021-10-20 00:51:25', NULL),
('b24458a5b6339ec699f36ef3204fc1d4a6daa6cb', 'report_api', 'qwerty123', '2021-10-07 15:19:49', NULL),
('b261887ae8b2926b596b49b45dbd9f94271f8030', 'report_api', 'qwerty123', '2021-10-07 15:19:10', NULL),
('b2c65ff8866c416c7026daaa2710a8c15e820001', 'report_api', 'qwerty123', '2021-10-24 17:26:07', NULL),
('b2c841e4ee55716abf3666db8cac2800e12b6224', 'report_api', 'qwerty123', '2021-10-11 18:06:54', NULL),
('b32fe54481f5bac1ee4f19230ef858f3fc272d15', 'report_api', 'qwerty123', '2021-10-20 00:29:19', NULL),
('b3b3055e9eb978ccce9d2f18ef535c3bfa524d30', 'report_api', 'qwerty123', '2021-10-03 15:53:21', NULL),
('b3b3e0834249838799ff5fdfc124ccf00e3f0b2f', 'report_api', 'qwerty123', '2021-12-28 05:38:38', NULL),
('b4b00264f392180e7f494fdffb8371f00e1ef8c9', 'report_api', 'qwerty123', '2021-10-29 09:10:08', NULL),
('b550d5f8ad1fb6a2f9b27a0d1f64bfb8aa705781', 'report_api', 'qwerty123', '2022-01-04 09:15:20', NULL),
('b6301f801f0a69ed990b0af43ea9f98ad6bef447', 'report_api', 'qwerty123', '2022-01-04 13:02:09', NULL),
('b6659b9a932b389c10b25d21fe5548a778227bf4', 'report_api', 'qwerty123', '2021-10-07 15:27:47', NULL),
('b798ee048c21339fabb3750a350224dbf66722ba', 'report_api', 'qwerty123', '2022-01-05 10:02:55', NULL),
('b9557caaff13cacb754e0b85e402be70b58b5db5', 'report_api', 'qwerty123', '2021-12-27 07:44:57', NULL),
('bc7b779f87084880fe6a3e8d4c77a42f86e9fe6b', 'report_api', 'qwerty123', '2021-10-07 15:25:44', NULL),
('bcb396efbaecfb2bd024b423702d3efab92e0d02', 'report_api', 'qwerty123', '2021-11-10 08:39:29', NULL),
('bd41c1f80fd9f2811a81a3ada4ea0648d590cabf', 'report_api', 'qwerty123', '2022-01-04 08:57:41', NULL),
('bdaee7f327762dfc9eea209f9e0744ef527dd4b5', 'report_api', 'qwerty123', '2021-10-18 13:24:20', NULL),
('bde48b3bc21034163aaaaaba0b863f38bfb468f5', 'report_api', 'qwerty123', '2021-10-09 21:33:19', NULL),
('bf3d3cdc3852bcc0e45d7c84ddfdb715a1aac48f', 'report_api', 'qwerty123', '2021-10-19 23:19:29', NULL),
('bfdd1a91f245002e95e42be9148d13dfff44a780', 'report_api', 'qwerty123', '2021-10-04 15:01:11', NULL),
('c0276f9765d832d305235ee3207402c6e4a804b1', 'report_api', 'qwerty123', '2021-10-20 01:28:26', NULL),
('c096ad58841fbc3c78959b08befebf62bdf57c7f', 'report_api', 'qwerty123', '2021-10-03 15:53:27', NULL),
('c0f07aca64c6e5595643dce5025427a3a2b6ef11', 'report_api', 'qwerty123', '2021-10-13 22:18:07', NULL),
('c19b68afec79e7e63856fc08da07b791260e898c', 'report_api', 'qwerty123', '2021-10-02 21:20:28', NULL),
('c1d48704ca7582ca1f1723e2de6ac1a4863c64d8', 'report_api', 'qwerty123', '2021-11-02 02:38:21', NULL),
('c1e2b352236b5da4be975e3c2afb507f05677cb0', 'report_api', 'qwerty123', '2021-10-11 19:41:21', NULL),
('c20cb923ec66ce382e6f40bb208e23da1d5777a5', 'report_api', 'qwerty123', '2021-10-12 17:23:14', NULL),
('c22bfe0fdc04e0e44eae57b9dfa4082789a1898a', 'report_api', 'qwerty123', '2021-10-12 18:47:14', NULL),
('c396528fa0a9d1f4d72f756d60911b4e5aeef8f7', 'report_api', 'qwerty123', '2021-10-09 00:37:49', NULL),
('c3c39d99670a9e03e1294a42a89daedd4d43199a', 'report_api', 'qwerty123', '2021-10-26 15:42:37', NULL),
('c4252b4852720924f7c610cc58fac9f3cb256dd4', 'report_api', 'qwerty123', '2021-10-21 17:42:27', NULL),
('c4cd48b298dbc6e0659dfa9a18828fdcf453b7f1', 'report_api', 'qwerty123', '2021-10-11 18:45:42', NULL),
('c50b88335623e9fbfb5ca2081abb81f0754f0309', 'report_api', 'qwerty123', '2021-10-11 15:14:22', NULL),
('c526501bee60266befedf3c5d1f5d7f265ec5fe6', 'report_api', 'qwerty123', '2021-11-01 04:09:16', NULL),
('c54eb3bd56502d5b7555ae60559ae4bc07c1c600', 'report_api', 'qwerty123', '2021-12-23 02:56:18', NULL),
('c5590adec629d8bebf69969aacaa6cbd2417b981', 'report_api', 'qwerty123', '2021-10-29 01:50:27', NULL),
('c56288af0434af25859f7ed230c481433219934d', 'report_api', 'qwerty123', '2022-01-04 08:58:47', NULL),
('c5dca52cb1dfdcac959e5e45eb83613c3370b5f6', 'report_api', 'qwerty123', '2021-12-28 05:51:27', NULL),
('c6055d2982412c3c1475559ea7c15b20cd5079b6', 'report_api', 'qwerty123', '2021-11-08 07:58:50', NULL),
('c7f15b0cbb1e77ed2090ac147f227a3d4dfcdfff', 'report_api', 'qwerty123', '2021-10-18 23:56:40', NULL),
('c8e423337713a7200fcbb1762bdb151bb5386617', 'report_api', 'qwerty123', '2021-11-16 08:35:30', NULL),
('c8f9408b3a70d9dcaef8368100486d3e613c9584', 'report_api', 'qwerty123', '2021-10-20 16:55:00', NULL),
('ca8464e158caca9794f58e6e8110a94dca2b087a', 'report_api', 'qwerty123', '2021-10-20 19:52:32', NULL),
('ca9c5cd5bb630c943df9059084e0959271aea1f2', 'report_api', 'qwerty123', '2021-10-05 20:39:40', NULL),
('cbbf2b12b0127dcb5cb04db6dd8f0ba090a3d3dd', 'report_api', 'qwerty123', '2021-11-08 08:30:23', NULL),
('cc71d396aff089660a22007d5cbb9a0516a723cc', 'report_api', 'qwerty123', '2021-10-15 23:04:59', NULL),
('cdd9185ce29743d06a608d8e78324ef43d429a24', 'report_api', 'qwerty123', '2022-01-05 03:16:34', NULL),
('ce0d866a74608841eff7774d40212b6bfea1681b', 'report_api', 'qwerty123', '2021-11-09 06:14:51', NULL),
('cf4de46ea5fd1210c8bcace46922401878da9425', 'report_api', 'qwerty123', '2021-11-09 08:00:01', NULL),
('cfb83aab249c883b2a590488de14e21d56d9bbcb', 'report_api', 'qwerty123', '2021-10-25 14:36:37', NULL),
('cfba7894fc31c204e7f8d57e8520650196769581', 'report_api', 'qwerty123', '2022-01-04 07:07:04', NULL),
('cff30c0a866d3c6ed3d412cf574513781c56c77b', 'report_api', 'qwerty123', '2022-01-04 08:13:41', NULL),
('d01ef3c51a79e4f6ccc9dac69c871e01ba089e9d', 'report_api', 'qwerty123', '2021-11-02 06:26:39', NULL),
('d057a9e6d58ae1f71f36735bb88a4037f060ee36', 'report_api', 'qwerty123', '2021-10-19 16:58:33', NULL),
('d0b9332f196b2cba3e019ffec189d3da05c58e80', 'report_api', 'qwerty123', '2022-01-04 07:04:45', NULL),
('d14a313b73acd3c77e3ccab469d7d2eb45e3b92d', 'report_api', 'qwerty123', '2021-10-12 19:56:18', NULL),
('d15ec44ab0608c8cdfd6ca6c5fa219ffd72bdd96', 'report_api', 'qwerty123', '2022-01-04 02:50:43', NULL),
('d2e2e17b1212d8c727d20c8f6a8ba92ba9a50412', 'report_api', 'qwerty123', '2021-10-07 00:03:53', NULL),
('d3baf4ae224f1bb01380af66ebdd99e5021206ae', 'report_api', 'qwerty123', '2021-11-08 07:33:10', NULL),
('d533941b8a3d44ef423ad31885a1cbc2f417af22', 'report_api', 'qwerty123', '2021-11-10 08:15:20', NULL),
('d5727335e8da89efbde02224e7f543f7c91c7572', 'report_api', 'qwerty123', '2021-12-29 12:12:57', NULL),
('d6382e1db5faef373daf0b2899e4dca8b90db422', 'report_api', 'qwerty123', '2021-11-17 07:56:12', NULL),
('d6767c160840dfd955f7be2bbe4f5e6a484cfaa2', 'report_api', 'qwerty123', '2021-10-05 18:24:54', NULL),
('d7f0f4d52555b34d2231cb33226258dc42ae6dd4', 'report_api', 'qwerty123', '2021-12-28 01:43:31', NULL),
('da631c7fe4e1978a93153f5f7d467ea185dded26', 'report_api', 'qwerty123', '2021-10-21 18:28:20', NULL),
('db2e90512833f438486a0530952fbba546a60ce5', 'report_api', 'qwerty123', '2021-11-10 10:31:31', NULL),
('dc0c5730465042fb268c5eb33fe02eaa9da07726', 'report_api', 'qwerty123', '2021-10-11 19:29:53', NULL),
('dc8cb2a160d9f674bd550282d4c177dbde83fde0', 'report_api', 'qwerty123', '2021-11-09 13:01:44', NULL),
('dd757681cca9aec217d44cb8afeb379dc383524f', 'report_api', 'qwerty123', '2022-01-04 07:03:55', NULL),
('de32bff061ea1237a5f43ffcb44d75064a5f6fb7', 'report_api', 'qwerty123', '2021-10-27 18:39:49', NULL),
('dee299d323b3ded80fa120a8a6f2a69be608f5dd', 'report_api', 'qwerty123', '2021-11-10 05:17:08', NULL),
('e053582adc113b70bbeaa59f55ae825a48572514', 'report_api', 'qwerty123', '2021-10-19 20:29:38', NULL),
('e24c36104ce420cd19bfcd2b4861feef7d015ef0', 'report_api', 'qwerty123', '2021-10-07 15:27:01', NULL),
('e2a41d57769dca97d06b557820f9505774d84bd6', 'report_api', 'qwerty123', '2021-10-24 19:53:38', NULL),
('e2d6b0444cedfe23abd9c5cc43f2be14f3ea2e6e', 'report_api', 'qwerty123', '2021-11-04 05:58:27', NULL),
('e42e9254764860789a30e2ce9dad0bdcb293c3df', 'report_api', 'qwerty123', '2021-10-10 00:56:01', NULL),
('e491510af0e60e5fd589cc8ac1886a8065a956b4', 'report_api', 'qwerty123', '2021-10-16 21:56:23', NULL),
('e6a823779f837cde2d6ec3b9d99c1866934bb533', 'report_api', 'qwerty123', '2021-10-13 01:07:54', NULL),
('e79bcb30884be1436b87ff9cf322614bf156e09f', 'report_api', 'qwerty123', '2021-10-11 17:53:11', NULL),
('e861368c4560f428466ea28481fae05d87a43fc4', 'report_api', 'qwerty123', '2021-10-20 18:05:40', NULL),
('e87a4c584f1322f2a688823726dd42ee2b4dd00e', 'report_api', 'qwerty123', '2021-10-08 22:20:26', NULL),
('e980a4f0132cb25728cd2abab83bf1447975a6d5', 'report_api', 'qwerty123', '2021-10-05 12:45:17', NULL),
('ea1bda642e65889f08ad7a19eefcbd2e06f7b772', 'report_api', 'qwerty123', '2021-10-10 20:44:57', NULL),
('ea1e5a51a1c6eb7b5eb6cd56e68e6ad2133ed0b7', 'report_api', 'qwerty123', '2022-01-04 08:30:43', NULL),
('eaff2f2071b8cfc5408e7f1a0d0e6082655d66ec', 'report_api', 'qwerty123', '2022-01-04 06:58:18', NULL),
('ec04b328e9f0442d8a7e2f4c9e61b5d13b46b119', 'report_api', 'qwerty123', '2021-10-25 14:53:24', NULL),
('ec7ca878f983f803f3b3d6610fd3272b4436bc81', 'report_api', 'qwerty123', '2022-01-05 13:54:00', NULL),
('ecadc7f5236aea4ef30911b5c174bb5242ddd575', 'report_api', 'qwerty123', '2021-10-11 15:11:28', NULL),
('ed03c30cf002024620e9c7cf01b2bb758addab3e', 'report_api', 'qwerty123', '2021-12-23 03:31:42', NULL),
('edb571de64ce8e9e241f4d96da23a79930c7c6b6', 'report_api', 'qwerty123', '2021-10-28 09:44:47', NULL),
('edd56a9f6310f18f58afffe6a94de8e1b33ce738', 'report_api', 'qwerty123', '2021-10-13 21:19:26', NULL),
('ee2af7117db3bc6c5263a979320d8177509b3e2b', 'report_api', 'qwerty123', '2021-10-25 19:19:50', NULL),
('ee928f01f9561eb52725ac300beb325eac145d80', 'report_api', 'qwerty123', '2021-11-09 07:14:06', NULL),
('eefe975fac2aa7a384b318e9eed133e9db02edbf', 'report_api', 'qwerty123', '2021-10-17 12:04:15', NULL),
('ef2f0c3623ce4f79e98036e66d157ddd0164ea06', 'report_api', 'qwerty123', '2021-11-01 04:08:38', NULL),
('efb1796d53286d4e77ca334edfe6531ab95cbad5', 'report_api', 'qwerty123', '2021-10-13 00:37:17', NULL),
('f0430f18561df37ce0d4ffa7cad4ea0f5b83ed23', 'report_api', 'qwerty123', '2021-10-07 15:30:43', NULL),
('f1c8bfef205237b067faf9fd76f05ec2b646f9fa', 'report_api', 'qwerty123', '2021-10-11 19:32:38', NULL),
('f6fa4fe3f352044d9ec8a2fc232e20c35dce5899', 'report_api', 'qwerty123', '2021-10-26 19:46:54', NULL),
('f7444489bef371976a8f05e729132d89c262875a', 'report_api', 'qwerty123', '2021-12-28 13:35:19', NULL),
('f77b0b7c30c0219f0d3ec2c92540ceb57c8b6c9a', 'report_api', 'qwerty123', '2021-10-25 19:57:53', NULL),
('f79032b6bef020ea050927663de872ee6f981e4a', 'report_api', 'qwerty123', '2021-11-04 05:27:43', NULL),
('f7ac918e5f3ff9cc17bebeaf7bf1c35b1b09410e', 'report_api', 'qwerty123', '2021-10-29 07:32:20', NULL),
('f7fa897f603a460a87cf665a73a531ebfb10ff93', 'report_api', 'qwerty123', '2021-10-29 04:12:58', NULL),
('f9e611b71faabfa5a8680f90b4941b83cd0b67e0', 'report_api', 'qwerty123', '2021-10-19 20:54:05', NULL),
('f9e96359f0045bd51a32d1f2d4d84be2bcd7ce80', 'report_api', 'qwerty123', '2021-11-01 03:16:09', NULL),
('fa8434c5893736379e5f19fab8070202fe3d0765', 'report_api', 'qwerty123', '2021-10-07 13:35:01', NULL),
('fb2676ea99351d25aece0c6ec5987b676dd7124d', 'report_api', 'qwerty123', '2021-10-05 21:38:19', NULL),
('fc0452066ceeb66caaec21dc9fa72e2198ec51d6', 'report_api', 'qwerty123', '2021-10-10 21:45:28', NULL),
('fc16ec6911e1a9f0326c90d88d55cf6dfc2c5073', 'report_api', 'qwerty123', '2021-10-16 00:48:31', NULL),
('fd1c7a010e354192bd8b46b2b9446372c00338d4', 'report_api', 'qwerty123', '2021-10-12 23:30:34', NULL),
('fdd6feedc216a3d9db79fcaf9a031ec2f0b3d79c', 'report_api', 'qwerty123', '2021-12-27 15:16:59', NULL),
('fe1f868333a85ba483a14b83890a478cd26bf54a', 'report_api', 'qwerty123', '2021-10-05 18:45:49', NULL),
('fe76d5be9a9088ed1732dba758dd75b34000d046', 'report_api', 'qwerty123', '2021-10-11 19:24:45', NULL),
('ff8dd41e9de97db13563ffbe3c6d440a8a00a16a', 'report_api', 'qwerty123', '2021-10-09 23:32:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_scopes`
--

CREATE TABLE `oauth_scopes` (
  `scope` varchar(80) NOT NULL,
  `is_default` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_users`
--

CREATE TABLE `oauth_users` (
  `username` varchar(80) NOT NULL,
  `password` varchar(80) DEFAULT NULL,
  `first_name` varchar(80) DEFAULT NULL,
  `last_name` varchar(80) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `email_verified` tinyint(1) DEFAULT NULL,
  `scope` varchar(4000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `oauth_users`
--

INSERT INTO `oauth_users` (`username`, `password`, `first_name`, `last_name`, `email`, `email_verified`, `scope`) VALUES
('qwerty123', '224b36c7e68c1cfb3522caf0554589876e1092c6', 'Joshua dave', 'Tonido', 'joshuadave143@gmail.com', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `office_inventory_d`
--

CREATE TABLE `office_inventory_d` (
  `inv_d_id` int(11) NOT NULL,
  `inv_h_id` int(11) NOT NULL,
  `customer` varchar(255) NOT NULL,
  `date_release` date NOT NULL,
  `date_returned` date NOT NULL,
  `comment` varchar(255) NOT NULL,
  `user_created` varchar(20) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_modified` varchar(20) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `office_inventory_d`
--

INSERT INTO `office_inventory_d` (`inv_d_id`, `inv_h_id`, `customer`, `date_release`, `date_returned`, `comment`, `user_created`, `date_created`, `user_modified`, `date_modified`) VALUES
(1, 5, 'test', '2021-10-27', '2021-11-10', 'sdf', 'office_admin', '2021-11-02 14:56:47', 'office_admin', '2021-11-02 14:56:47'),
(2, 5, '123', '2021-11-02', '2021-11-15', 'asd', 'office_admin', '2021-11-02 15:01:46', 'office_admin', '2021-11-02 15:01:46'),
(3, 5, '234234', '2021-11-02', '2021-11-02', '', 'office_admin', '2021-11-02 15:02:04', 'office_admin', '2021-11-02 15:02:04'),
(4, 5, 'BPI', '2021-11-23', '0000-00-00', '', 'office_admin', '2021-11-03 07:51:50', '', '2021-11-03 07:51:50');

-- --------------------------------------------------------

--
-- Table structure for table `office_inventory_h`
--

CREATE TABLE `office_inventory_h` (
  `inv_h_id` int(11) NOT NULL,
  `item_code` varchar(255) DEFAULT NULL,
  `category` varchar(10) NOT NULL,
  `quantity` int(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `brand` varchar(30) NOT NULL,
  `model` varchar(25) NOT NULL,
  `serial_no` varchar(50) NOT NULL,
  `license` varchar(255) NOT NULL,
  `hard_drive` varchar(20) NOT NULL,
  `ram` varchar(20) NOT NULL,
  `processor` varchar(25) NOT NULL,
  `others` varchar(255) NOT NULL,
  `si_date_received` date NOT NULL,
  `si_date_released` date NOT NULL,
  `si_date_paid` date NOT NULL,
  `user_created` varchar(20) NOT NULL,
  `date_created` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `user_modified` varchar(20) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `office_inventory_h`
--

INSERT INTO `office_inventory_h` (`inv_h_id`, `item_code`, `category`, `quantity`, `type`, `brand`, `model`, `serial_no`, `license`, `hard_drive`, `ram`, `processor`, `others`, `si_date_received`, `si_date_released`, `si_date_paid`, `user_created`, `date_created`, `user_modified`, `date_modified`) VALUES
(1, '5TRES-411', 'For Sale', 1, 'typ', 'brand', 'model', 'serial no', 'SAS 100TB', 'SAS 100TB', '150GB', 'processor', '', '2021-10-14', '2021-10-13', '2021-10-15', 'office_admin', '2021-10-14 07:27:54', 'office_admin', '2021-10-19 08:11:42'),
(3, '99SRES-411', 'For Sale', 0, 'das', 'asd', 'asd', 'asd', 'SSD 1000TB', 'SSD 1000TB', '15GB', 'asd', '', '2021-10-11', '2021-10-11', '2021-10-05', 'office_admin', '2021-10-14 10:14:49', 'office_admin', '2021-10-19 08:30:48'),
(4, '99ZRES-411', 'For Sale', 25, 'server linux', 'dell', 'mod25466', 'sfsdf322', 'SAS 100TB', 'SAS 100TB', '6GB', 'inter 6i', '', '2021-11-05', '2021-11-04', '2021-10-19', 'office_admin', '2021-10-14 11:46:56', 'office_admin', '2021-11-02 10:33:23'),
(5, NULL, 'Demo', 23, 'dell server', 'Dell', 'Dell-2546545', '56456-456456-456', 'SAS 100', 'SAS 120GB', '12GB', 'INTEL i6', '', '0000-00-00', '0000-00-00', '0000-00-00', 'office_admin', '2021-10-15 03:03:21', 'office_admin', '2021-10-15 09:20:03');

-- --------------------------------------------------------

--
-- Table structure for table `office_purchase_order_d`
--

CREATE TABLE `office_purchase_order_d` (
  `opos_id` int(11) NOT NULL,
  `opo_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `vendor` varchar(255) NOT NULL,
  `unit_price` varchar(20) NOT NULL,
  `line_total` varchar(20) NOT NULL,
  `user_created` varchar(20) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_modified` varchar(20) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `office_purchase_order_d`
--

INSERT INTO `office_purchase_order_d` (`opos_id`, `opo_id`, `quantity`, `sku`, `description`, `vendor`, `unit_price`, `line_total`, `user_created`, `date_created`, `user_modified`, `date_modified`) VALUES
(2, 2, 20, 'TRECXC2M14600312-NT- RNW~LPPP', '<div>Trend Micro SW/License Cloud One - Workload</div><div>Security (Enterprise) - antimalware, network &amp; system</div><div>+ XDR - annual subscription per server/VM/instance -</div><div>Renewal - Corporate - 00001-00100 User BracketTrend Micro SW/License Cloud One - Workload</div><div>Security (Enterprise) - antimalware, network &amp; system</div><div>+ XDR - annual subscription per server/VM/instance -</div><div>Renewal - Corporate - 00001-00100 User Bracket</div>', 'TRENDMICRO', '11413.39', '228267.80', 'office_admin', '2021-10-27 07:49:49', 'office_admin', '2021-10-27 07:49:49'),
(3, 1, 40, 'TRECXC2M14600312-NT- RNW~LPPP', '<div>Trend Micro SW/License Cloud One - Workload</div><div>Security (Enterprise) - antimalware, network &amp; system</div><div>+ XDR - annual subscription per server/VM/instance -</div><div>Renewal - Corporate - 00001-00100 User Bracket</div>', 'TRENDMICRO', '11413.39', '456535.60', 'office_admin', '2021-10-27 09:01:26', 'office_admin', '2021-10-27 09:01:26'),
(4, 3, 12, 'asd', 'asd', 'asd', '1', '12.00', 'office_admin', '2021-10-25 09:36:56', '', '2021-10-25 09:36:56'),
(11, 2, 40, 'TRECXC2M14600312-NT- RNW~LPPP', '<div>Trend Micro SW/License Cloud One - Workload</div><div>Security (Enterprise) - antimalware, network &amp; system</div><div>+ XDR - annual subscription per server/VM/instance -</div><div>Renewal - Corporate - 00001-00100 User Bracket</div>', 'TRENDMICRO', '11413.39', '456535.60', 'office_admin', '2021-10-27 07:49:49', 'office_admin', '2021-10-27 07:49:49');

-- --------------------------------------------------------

--
-- Table structure for table `office_purchase_order_h`
--

CREATE TABLE `office_purchase_order_h` (
  `opo_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `po_no` varchar(255) NOT NULL,
  `customer_id` varchar(255) NOT NULL,
  `v_name` varchar(255) NOT NULL,
  `v_address` varchar(255) NOT NULL,
  `v_contact_d` varchar(255) NOT NULL,
  `s_owner_name` varchar(255) NOT NULL,
  `s_c_name` varchar(255) NOT NULL,
  `s_address` varchar(255) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `shipping_method` varchar(255) NOT NULL,
  `payment_terms` varchar(255) NOT NULL,
  `del_pick` varchar(255) NOT NULL,
  `subtotal` varchar(20) NOT NULL,
  `evat` varchar(20) NOT NULL,
  `total` varchar(20) NOT NULL,
  `pdfname` text NOT NULL,
  `auth_name` varchar(50) NOT NULL,
  `auth_sig` text NOT NULL,
  `user_created` varchar(20) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_modified` varchar(20) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `office_purchase_order_h`
--

INSERT INTO `office_purchase_order_h` (`opo_id`, `date`, `po_no`, `customer_id`, `v_name`, `v_address`, `v_contact_d`, `s_owner_name`, `s_c_name`, `s_address`, `vendor_id`, `shipping_method`, `payment_terms`, `del_pick`, `subtotal`, `evat`, `total`, `pdfname`, `auth_name`, `auth_sig`, `user_created`, `date_created`, `user_modified`, `date_modified`) VALUES
(1, '2021-10-27', '100003', 'MCDO007', 'VSTECS PHILS., INC.', 'MSI-ECS -M. Eusebio Ave. San Miguel, Pasig City', 'Tel. No.: 688-3333 Fax No.: 6384932', 'Maconver T. Zafra', 'Netsec Technologies Inc.', '47 East Business Hub, 47 Esteban Abada St, Loyola Heights Quezon City', 1, 'asd', 'PDC45', '1-2 weeks after receipt of Purchase order', '456535.60', '2', '456537.60', '', '', '', 'office_admin', '2021-10-27 09:01:26', 'office_admin', '2021-10-27 09:01:26');
INSERT INTO `office_purchase_order_h` (`opo_id`, `date`, `po_no`, `customer_id`, `v_name`, `v_address`, `v_contact_d`, `s_owner_name`, `s_c_name`, `s_address`, `vendor_id`, `shipping_method`, `payment_terms`, `del_pick`, `subtotal`, `evat`, `total`, `pdfname`, `auth_name`, `auth_sig`, `user_created`, `date_created`, `user_modified`, `date_modified`) VALUES
(2, '2021-10-25', '000001', 'MCDO007', 'VSTECS PHILS., INC.', 'MSI-ECS -M. Eusebio Ave. San Miguel, Pasig City', 'Tel. No.: 688-3333 Fax No.: 6384932', 'Maconver T. Zafra', 'Netsec Technologies Inc.', '47 East Business Hub, 47 Esteban Abada St, Loyola Heights Quezon City', 1, 'N/A', 'PDC45', '1-2 weeks after receipt of Purchase order', '684803.40', '82176.43', '766979.83', '2~2021-12-22 21-31-40.pdf~modified.pdf', 'doctor doctor', 'data:image/png;base64,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', 'office_admin', '2021-12-22 13:31:40', 'office_admin', '2021-12-22 13:31:40');
INSERT INTO `office_purchase_order_h` (`opo_id`, `date`, `po_no`, `customer_id`, `v_name`, `v_address`, `v_contact_d`, `s_owner_name`, `s_c_name`, `s_address`, `vendor_id`, `shipping_method`, `payment_terms`, `del_pick`, `subtotal`, `evat`, `total`, `pdfname`, `auth_name`, `auth_sig`, `user_created`, `date_created`, `user_modified`, `date_modified`) VALUES
(3, '2021-10-20', '100002', 'MCDO007', 'VSTECS PHILS., INC.', 'MSI-ECS -M. Eusebio Ave. San Miguel, Pasig City', 'Tel. No.: 688-3333 Fax No.: 6384932', 'Maconver T. Zafra', 'Netsec Technologies Inc.', '47 East Business Hub, 47 Esteban Abada St, Loyola Heights Quezon City', 1, 'N/A', 'PDC45', '1-2 weeks after receipt of Purchase order', '12.00', '1', '13.00', '3~2021-12-22 21-31-17.pdf~modified.pdf', 'doctor doctor', 'data:image/png;base64,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', 'office_admin', '2021-12-22 13:31:17', 'office_admin', '2021-12-22 13:31:17');

--
-- Triggers `office_purchase_order_h`
--
DELIMITER $$
CREATE TRIGGER `update_po_no_purchase_order` AFTER INSERT ON `office_purchase_order_h` FOR EACH ROW BEGIN
	DECLARE po_no_old INT;
  	set po_no_old = (select lpo.po_no from lib_po_no lpo WHERE lpo.doc_type = 'purchase_order');
    
    UPDATE lib_po_no     
    SET po_no = po_no_old+1   
    WHERE doc_type = 'purchase_order';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_delivery_d`
--

CREATE TABLE `sales_delivery_d` (
  `part_id` int(11) NOT NULL,
  `del_id` int(11) NOT NULL,
  `inv_h_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `item_code` varchar(50) NOT NULL,
  `particulars` text NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_created` varchar(100) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_modified` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales_delivery_d`
--

INSERT INTO `sales_delivery_d` (`part_id`, `del_id`, `inv_h_id`, `quantity`, `item_code`, `particulars`, `date_created`, `user_created`, `date_modified`, `user_modified`) VALUES
(23, 10, 3, 40, '99SRES-411', 'CAS LICENSE AND SERVICES<br><br>1. TREND MICRO CLOUD APP SECURITY LICENSE-TREND MICRO SW/LICENSE HOSTECEMAIL SECURITY 1 YEAR SUBSCRIPTION NEW CORPORATE,01001 05000 USER BRACKET <br>2. INTEGRATION WITH EXISTING TREND MICRO SOLUTION <br>3. IMPLEMENTATION AND MIGRATION SERVICES FROM THE EXISTING EMAIL SECURITY GATEWAY &nbsp;<br>5. IMPLEMENTATION AND MIGRATION SERVICES FROM THE EXISTING EMAIL SECURITY GATEWAY &nbsp;<br>6. IMPLEMENTATION AND MIGRATION SERVICES FROM THE EXISTING EMAIL SECURITY GATEWAY &nbsp;<br><br><b>LICENSE #: NN-JLEE-6P5MN-C7XCG-BSUUM-W5KGF-RHDBC<br><br>NOTE: ATTACHED PAPER LICENSES</b>', '2021-10-19 08:54:01', '', '2021-10-19 08:54:01', 'tonido'),
(27, 10, 1, 2, '5TRES-411', 'CAS LICENSE AND SERVICES', '2021-10-19 08:54:01', 'tonido', '2021-10-19 08:54:01', 'tonido'),
(36, 20, 4, 25, '99ZRES-411', 'zxczxc', '2021-11-02 08:49:35', 'tonido', '2021-11-02 08:49:35', ''),
(37, 21, 4, 25, '99ZRES-411', 'ssss', '2021-11-02 08:56:00', 'tonido', '2021-11-02 08:56:00', ''),
(38, 22, 4, 25, '99ZRES-411', 'asdasd', '2021-11-02 10:33:23', 'tonido', '2021-11-02 10:33:23', '');

-- --------------------------------------------------------

--
-- Table structure for table `sales_delivery_h`
--

CREATE TABLE `sales_delivery_h` (
  `del_id` int(11) NOT NULL,
  `sequence` varchar(20) NOT NULL,
  `delivered_to` varchar(100) DEFAULT NULL,
  `ship_to` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `tin` varchar(15) DEFAULT NULL,
  `business_style` varchar(255) DEFAULT NULL,
  `account_man` varchar(50) DEFAULT NULL,
  `so_no` varchar(50) DEFAULT NULL,
  `contact_p` varchar(50) DEFAULT NULL,
  `contact_no` varchar(100) DEFAULT NULL,
  `po_no` varchar(100) DEFAULT NULL,
  `terms` varchar(10) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'PENDING' COMMENT 'PENDING, CANCEL, DELIVERED',
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_created` varchar(100) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_modified` varchar(100) NOT NULL,
  `pdfname` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales_delivery_h`
--

INSERT INTO `sales_delivery_h` (`del_id`, `sequence`, `delivered_to`, `ship_to`, `address`, `tin`, `business_style`, `account_man`, `so_no`, `contact_p`, `contact_no`, `po_no`, `terms`, `date`, `status`, `date_created`, `user_created`, `date_modified`, `user_modified`, `pdfname`) VALUES
(10, '', '', 'Golden Arches Development Corporation', '17th Floor OtiBank Center Building Paseo de roxas, Makati City', '000-121-242-000', '', 'CMG', '20-16', 'Mr. Bryan Balagtas', '09189289573', '4500120393', '30 Days', '2020-07-17', 'DELIVERED', '2021-10-04 00:33:27', 'tonido', '2021-12-09 03:34:56', 'tonido', '10~2021-12-09 11-34-56~modified.pdf'),
(20, '', 'Delivered', '', 's', '000-121-242-000', 'Business Style', 'Account Managers', '20-16', 'doctor doctor', '09189289573', '100002', '30 Days', '2021-11-02', 'PENDING', '2021-11-02 08:49:35', 'tonido', '2021-12-09 03:35:12', 'tonido', '20~2021-12-09 11-35-12~modified.pdf'),
(21, '', 'Delivered', '', 'sd', '000-121-242-000', 'Business Style', 'Account Manager', '20-16', 'doctor doctor', '09189289573', '100006', '30 Days', '2021-11-22', 'PENDING', '2021-11-02 08:56:00', 'tonido', '2021-11-02 09:58:02', 'tonido', NULL),
(22, '0000006', 'Golden Arches Development Corporation', '', 'seq', '000-121-242-000', 'Business Style', 'Account Manager', '20-16', 'doctor doctor', '09189289573', '100007', '30 Days', '2021-11-17', 'PENDING', '2021-11-02 10:33:23', 'tonido', '2021-11-02 11:45:22', '', '22~2021-11-02 19-45-22~modified.pdf');

--
-- Triggers `sales_delivery_h`
--
DELIMITER $$
CREATE TRIGGER `update_po_no_delivery` AFTER INSERT ON `sales_delivery_h` FOR EACH ROW BEGIN
	DECLARE po_no_old INT;
	DECLARE sequence_old INT;
  	set po_no_old = (select lpo.po_no from lib_po_no lpo WHERE lpo.doc_type = 'delivery_receipt');
    set sequence_old = (select CONVERT(ls.sequence, INTEGER) from lib_po_no ls WHERE ls.doc_type = 'delivery_receipt');
    
    UPDATE lib_po_no     
    SET po_no = po_no_old+1, 
    	sequence = LPAD(sequence_old+1, 7, 0) 
    WHERE doc_type = 'delivery_receipt';


END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoice_d`
--

CREATE TABLE `sales_invoice_d` (
  `part_in_id` int(11) NOT NULL,
  `in_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `particulars` text NOT NULL,
  `unit_price` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_created` varchar(100) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_modified` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales_invoice_d`
--

INSERT INTO `sales_invoice_d` (`part_in_id`, `in_id`, `quantity`, `particulars`, `unit_price`, `amount`, `date_created`, `user_created`, `date_modified`, `user_modified`) VALUES
(1, 1, 1, 'CAS LICENSE AND SERVICES<br><br>1. TREND MICRO CLOUD APP SECURITY LICENSE-TREND MICRO SW/LICENSE HOSTECEMAIL SECURITY 1 YEAR SUBSCRIPTION NEW CORPORATE,01001 05000 USER BRACKET<br>2. INTEGRATION WITH EXISTING TREND MICRO SOLUTION<br>3. IMPLEMENTATION AND MIGRATION SERVICES FROM THE EXISTING EMAIL SECURITY GATEWAY&nbsp;<br>5. IMPLEMENTATION AND MIGRATION SERVICES FROM THE EXISTING EMAIL SECURITY GATEWAY&nbsp;<br>6. IMPLEMENTATION AND MIGRATION SERVICES FROM THE EXISTING EMAIL SECURITY GATEWAY&nbsp;<br><br><b>LICENSE #: NN-JLEE-6P5MN-C7XCG-BSUUM-W5KGF-RHDBC<br><br>NOTE: ATTACHED PAPER LICENSES</b>', '22', '22', '2021-10-12 08:40:06', 'tonido', '2021-10-11 19:40:06', 'tonido'),
(3, 3, 2, 'asd', '2', '4', '2021-10-04 23:08:37', 'tonido', '2021-10-04 23:08:37', ''),
(4, 4, 1, '2', '2', '2', '2021-10-04 23:10:46', 'tonido', '2021-10-04 23:10:46', ''),
(5, 1, 2, 'CAS LICENSE AND SERVICES<br><br>1. TREND MICRO CLOUD APP SECURITY LICENSE-TREND MICRO SW/LICENSE HOSTECEMAIL SECURITY 1 YEAR SUBSCRIPTION NEW CORPORATE,01001 05000 USER BRACKET<br>2. INTEGRATION WITH EXISTING TREND MICRO SOLUTION<br>3. IMPLEMENTATION AND MIGRATION SERVICES FROM THE EXISTING EMAIL SECURITY GATEWAY&nbsp;<br>5. IMPLEMENTATION AND MIGRATION SERVICES FROM THE EXISTING EMAIL SECURITY GATEWAY&nbsp;<br><span>6. IMPLEMENTATION AND MIGRATION SERVICES FROM THE EXISTING EMAIL SECURITY GATEWAY&nbsp;</span>', '254.25', '508.5', '2021-10-12 08:40:06', 'tonido', '2021-10-11 19:40:06', 'tonido'),
(6, 5, 2, 'sad', '223.43', '446.86', '2021-11-02 11:39:12', 'tonido', '2021-11-02 11:39:12', ''),
(7, 6, 2, 'asdasd', '2222', '4444', '2021-11-02 11:41:05', 'tonido', '2021-11-02 11:41:05', '');

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoice_h`
--

CREATE TABLE `sales_invoice_h` (
  `in_id` int(11) NOT NULL,
  `sequence` varchar(20) NOT NULL,
  `sold_to` varchar(100) DEFAULT NULL,
  `ship_to` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `tin` varchar(15) DEFAULT NULL,
  `business_style` varchar(255) DEFAULT NULL,
  `account_man` varchar(50) DEFAULT NULL,
  `so_no` varchar(50) DEFAULT NULL,
  `contact_p` varchar(50) DEFAULT NULL,
  `contact_no` varchar(100) DEFAULT NULL,
  `po_no` varchar(100) DEFAULT NULL,
  `terms` varchar(10) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_created` varchar(100) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_modified` varchar(100) NOT NULL,
  `total_sales` float NOT NULL,
  `added_tax` float NOT NULL,
  `total_payment` float NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'UNPAID' COMMENT 'PAID,UNPAID',
  `total_due` float NOT NULL,
  `date_paid` date NOT NULL,
  `or_no` varchar(25) NOT NULL,
  `pdfname` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales_invoice_h`
--

INSERT INTO `sales_invoice_h` (`in_id`, `sequence`, `sold_to`, `ship_to`, `address`, `tin`, `business_style`, `account_man`, `so_no`, `contact_p`, `contact_no`, `po_no`, `terms`, `date`, `date_created`, `user_created`, `date_modified`, `user_modified`, `total_sales`, `added_tax`, `total_payment`, `status`, `total_due`, `date_paid`, `or_no`, `pdfname`) VALUES
(1, '', 'Sold', '', 'Zone 4', '213', 'Business Style', 'Account Manager', 'asdf', 'doctor doctor', '', '2555', '', '2021-10-20', '2021-10-03 01:22:34', 'tonido', '2021-12-09 03:35:26', 'tonido', 530.5, 2, 532.5, 'UNPAID', 532.5, '0000-00-00', '', '1~2021-12-09 11-35-26~modified.pdf'),
(3, '', 'Sold', '', 's', '', '', '', '', 'doctor doctor', '', NULL, '', '2021-11-02', '2021-10-04 23:08:37', 'tonido', '2021-12-13 15:49:03', 'tonido', 4, 2, 6, 'PAID-', 6, '2021-12-26', 'zxc123', '3~2021-10-12 17-00-54.pdf'),
(4, '', '', '', 'Zone 4', '000-121-242-000', 'asdf', 'CMG', '', '', '', '202101', '', '2021-10-19', '2021-10-04 23:10:46', 'tonido', '2021-12-13 15:45:39', 'tonido', 2, 3, 5, 'PAID-', 5, '2021-12-12', '111', '4~2021-10-12 17-06-56.pdf'),
(5, '000001', '', 'Golden Arches Development Corporation', 'seq', '000-121-242-000', 'Business Style', 'Account Manager', '20-16', 'doctor doctor', '09189289573', '202102', '30 Days', '2021-11-09', '2021-11-02 11:39:12', 'tonido', '2021-12-13 15:43:33', 'tonido', 446.86, 2, 448.86, 'PAID-', 448.86, '2021-12-14', '123123ss', NULL),
(6, '0000002', 'Sold', '', 'saaaa', '000-121-242-000', 'Business Style', 'Account Manager', '20-16', 'test test', '09189289573', '202103', '30 Days', '2021-11-18', '2021-11-02 11:41:05', 'tonido', '2021-12-13 15:39:59', 'tonido', 4444, 25.5, 4469.5, 'UNPAID', 4469.5, '2021-12-14', '', '6~2021-11-02 19-44-46~modified.pdf');

--
-- Triggers `sales_invoice_h`
--
DELIMITER $$
CREATE TRIGGER `update_po_no_invoice` AFTER INSERT ON `sales_invoice_h` FOR EACH ROW BEGIN  


	DECLARE po_no_old INT;
	DECLARE sequence_old INT;
    
  	set po_no_old = (select lpo.po_no from lib_po_no lpo WHERE lpo.doc_type = 'sales_invoice');
    set sequence_old = (select CONVERT(ls.sequence, INTEGER) from lib_po_no ls WHERE ls.doc_type = 'sales_invoice');
    
    UPDATE lib_po_no     
    SET po_no = po_no_old+1, 
    	sequence = LPAD(sequence_old+1, 7, 0) 
    WHERE doc_type = 'sales_invoice';


END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `system_company_name`
--

CREATE TABLE `system_company_name` (
  `company_id` int(11) NOT NULL,
  `owner_name` varchar(50) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_company_name`
--

INSERT INTO `system_company_name` (`company_id`, `owner_name`, `company_name`, `address`) VALUES
(1, 'Maconver T. Zafra', 'Netsec Technologies Inc.', '47 East Business Hub, 47 Esteban Abada St, Loyola Heights Quezon City');

-- --------------------------------------------------------

--
-- Table structure for table `system_doc_type`
--

CREATE TABLE `system_doc_type` (
  `sys_doc_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_name` varchar(50) NOT NULL COMMENT 'short name or url name',
  `user_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_doc_type`
--

INSERT INTO `system_doc_type` (`sys_doc_id`, `name`, `short_name`, `user_type`) VALUES
(1, 'Account', 'accounts', 'admin'),
(2, 'Sales Invoice', 'sales_invoice', 'sales'),
(3, 'Delivery Receipt', 'delivery_receipt', 'sales'),
(4, 'Stock Inventory', 'stock_inventory', 'office'),
(5, 'Asset Inventory', 'asset_inventory', 'office'),
(6, 'Purchase Order', 'purchase_order', 'office');

-- --------------------------------------------------------

--
-- Table structure for table `system_doc_type_column_names`
--

CREATE TABLE `system_doc_type_column_names` (
  `sdtcn_id` int(11) NOT NULL,
  `sys_doc_id` int(11) NOT NULL,
  `col_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_doc_type_column_names`
--

INSERT INTO `system_doc_type_column_names` (`sdtcn_id`, `sys_doc_id`, `col_id`) VALUES
(1, 3, 3),
(2, 3, 4),
(3, 3, 5),
(4, 3, 6),
(5, 3, 7),
(6, 3, 8),
(7, 3, 9),
(8, 3, 10),
(9, 3, 11),
(10, 3, 12),
(11, 3, 13),
(12, 3, 14),
(14, 3, 15),
(15, 3, 16),
(16, 3, 17),
(17, 2, 1),
(18, 2, 4),
(19, 2, 5),
(20, 2, 6),
(21, 2, 7),
(22, 2, 8),
(23, 2, 9),
(24, 2, 10),
(25, 2, 11),
(26, 2, 12),
(27, 2, 13),
(28, 2, 14),
(29, 2, 18),
(30, 2, 19),
(31, 2, 20),
(32, 2, 21),
(33, 2, 15),
(34, 2, 17),
(35, 2, 22),
(36, 2, 23),
(37, 4, 26),
(38, 4, 15),
(39, 4, 27),
(40, 4, 28),
(41, 4, 29),
(42, 4, 30),
(43, 4, 31),
(44, 4, 32),
(45, 4, 33),
(46, 4, 34),
(47, 4, 35),
(48, 4, 36),
(49, 4, 37),
(50, 4, 38),
(51, 5, 26),
(52, 5, 15),
(53, 5, 27),
(54, 5, 28),
(55, 5, 29),
(56, 5, 30),
(57, 5, 31),
(58, 5, 32),
(59, 5, 33),
(60, 5, 34),
(61, 5, 35),
(62, 5, 39),
(63, 5, 40),
(64, 5, 41),
(65, 5, 42),
(66, 4, 43),
(67, 3, 44),
(68, 6, 14),
(69, 6, 12),
(70, 6, 45),
(71, 6, 46),
(72, 6, 4),
(73, 6, 47),
(74, 6, 48),
(75, 6, 49),
(76, 6, 54),
(77, 6, 55),
(78, 6, 56),
(79, 6, 15),
(80, 6, 50),
(81, 6, 51),
(82, 6, 52),
(83, 6, 22),
(84, 6, 53);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `role_id` int(11) NOT NULL,
  `sys_doc_id` int(11) NOT NULL,
  `document_type` varchar(50) NOT NULL,
  `short_name` varchar(50) NOT NULL,
  `user_type` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  `view` int(11) NOT NULL DEFAULT 0,
  `add` int(1) NOT NULL DEFAULT 0,
  `delete` int(1) NOT NULL DEFAULT 0,
  `update` int(1) NOT NULL DEFAULT 0,
  `print` int(1) NOT NULL DEFAULT 0,
  `export` int(11) NOT NULL DEFAULT 0,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_created` varchar(255) NOT NULL,
  `date_modified` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `user_modified` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`role_id`, `sys_doc_id`, `document_type`, `short_name`, `user_type`, `role`, `view`, `add`, `delete`, `update`, `print`, `export`, `date_created`, `user_created`, `date_modified`, `user_modified`) VALUES
(1, 0, 'Account', '0', 'admin', 'admin', 1, 0, 1, 0, 0, 0, '2021-09-22 03:17:36', '', '2021-12-21 13:01:59', NULL),
(14, 3, 'Delivery Receipt', 'delivery_receipt', 'sales', 'Sales Admin', 1, 1, 1, 1, 1, 1, '2021-09-27 15:14:16', '', '2021-09-29 21:19:19', NULL),
(18, 2, 'Sales Invoice', 'sales_invoice', 'sales', 'Sales Admin', 1, 1, 1, 1, 1, 1, '2021-09-27 19:32:02', '', '2021-12-14 12:18:15', NULL),
(19, 4, 'Stock Inventory', 'stock_inventory', 'office', 'Office Admin', 1, 1, 1, 1, 1, 1, '2021-10-12 19:47:49', '', '2021-10-12 19:47:49', NULL),
(20, 5, 'Asset Inventory', 'asset_inventory', 'office', 'Office Admin', 1, 1, 1, 1, 1, 1, '2021-10-12 19:55:25', '', '2021-10-12 19:55:25', NULL),
(21, 6, 'Purchase Order', 'purchase_order', 'office', 'Office Admin', 1, 1, 1, 1, 1, 1, '2021-10-22 03:44:54', '', '2021-10-22 03:45:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles_column_names`
--

CREATE TABLE `user_roles_column_names` (
  `urcn_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `col_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_roles_column_names`
--

INSERT INTO `user_roles_column_names` (`urcn_id`, `role_id`, `col_id`) VALUES
(78, 14, 5),
(80, 14, 7),
(81, 14, 8),
(83, 14, 10),
(84, 14, 11),
(87, 14, 14),
(89, 14, 16),
(92, 14, 17),
(93, 14, 15),
(94, 18, 1),
(95, 18, 4),
(98, 18, 7),
(99, 18, 8),
(100, 18, 9),
(101, 18, 10),
(102, 18, 11),
(103, 18, 12),
(104, 18, 13),
(106, 18, 18),
(107, 18, 19),
(108, 18, 20),
(109, 18, 21),
(110, 18, 15),
(111, 18, 17),
(113, 18, 23),
(114, 14, 3),
(115, 14, 4),
(116, 14, 6),
(117, 14, 9),
(118, 14, 12),
(119, 14, 13),
(120, 19, 26),
(121, 19, 15),
(122, 19, 27),
(123, 19, 28),
(124, 19, 29),
(125, 19, 30),
(126, 19, 31),
(127, 19, 32),
(128, 19, 33),
(129, 19, 34),
(130, 19, 35),
(131, 19, 36),
(132, 19, 37),
(133, 19, 38),
(134, 20, 26),
(135, 20, 15),
(136, 20, 27),
(137, 20, 28),
(138, 20, 29),
(139, 20, 30),
(140, 20, 31),
(141, 20, 32),
(142, 20, 33),
(143, 20, 34),
(144, 20, 35),
(145, 20, 39),
(146, 20, 40),
(147, 20, 41),
(148, 20, 42),
(149, 19, 43),
(150, 14, 44),
(151, 21, 14),
(152, 21, 12),
(153, 21, 45),
(154, 21, 46),
(155, 21, 4),
(156, 21, 47),
(157, 21, 48),
(158, 21, 49),
(159, 21, 54),
(160, 21, 55),
(161, 21, 56),
(162, 21, 15),
(163, 21, 50),
(164, 21, 51),
(165, 21, 52),
(166, 21, 22),
(167, 21, 53);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_inventory`
-- (See below for the actual view)
--
CREATE TABLE `view_inventory` (
`inv_h_id` int(11)
,`category` varchar(10)
,`quantity` bigint(51)
,`type` varchar(50)
,`brand` varchar(30)
,`model` varchar(25)
,`serial_no` varchar(50)
,`license` varchar(255)
,`hard_drive` varchar(20)
,`ram` varchar(20)
,`processor` varchar(25)
,`others` varchar(255)
);

-- --------------------------------------------------------

--
-- Structure for view `view_inventory`
--
DROP TABLE IF EXISTS `view_inventory`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_inventory`  AS  select `oih`.`inv_h_id` AS `inv_h_id`,`oih`.`category` AS `category`,`oih`.`quantity` - (select count(`oid`.`customer`) from `office_inventory_d` `oid` where `oid`.`inv_h_id` = `oih`.`inv_h_id` and `oid`.`date_returned` = '0000-00-00') AS `quantity`,`oih`.`type` AS `type`,`oih`.`brand` AS `brand`,`oih`.`model` AS `model`,`oih`.`serial_no` AS `serial_no`,`oih`.`license` AS `license`,`oih`.`hard_drive` AS `hard_drive`,`oih`.`ram` AS `ram`,`oih`.`processor` AS `processor`,`oih`.`others` AS `others` from `office_inventory_h` `oih` where `oih`.`category` = 'DEMO' ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`acct_id`),
  ADD UNIQUE KEY `Username` (`username`) USING BTREE;

--
-- Indexes for table `column_names`
--
ALTER TABLE `column_names`
  ADD PRIMARY KEY (`col_id`);

--
-- Indexes for table `lib_po_no`
--
ALTER TABLE `lib_po_no`
  ADD PRIMARY KEY (`po_id`);

--
-- Indexes for table `lib_vendors`
--
ALTER TABLE `lib_vendors`
  ADD PRIMARY KEY (`vendor_id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`access_token`);

--
-- Indexes for table `oauth_authorization_codes`
--
ALTER TABLE `oauth_authorization_codes`
  ADD PRIMARY KEY (`authorization_code`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`refresh_token`);

--
-- Indexes for table `oauth_scopes`
--
ALTER TABLE `oauth_scopes`
  ADD PRIMARY KEY (`scope`);

--
-- Indexes for table `oauth_users`
--
ALTER TABLE `oauth_users`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `office_inventory_d`
--
ALTER TABLE `office_inventory_d`
  ADD PRIMARY KEY (`inv_d_id`),
  ADD KEY `inv_h_id_fk` (`inv_h_id`);

--
-- Indexes for table `office_inventory_h`
--
ALTER TABLE `office_inventory_h`
  ADD PRIMARY KEY (`inv_h_id`),
  ADD UNIQUE KEY `item_code_uq` (`item_code`);

--
-- Indexes for table `office_purchase_order_d`
--
ALTER TABLE `office_purchase_order_d`
  ADD PRIMARY KEY (`opos_id`);

--
-- Indexes for table `office_purchase_order_h`
--
ALTER TABLE `office_purchase_order_h`
  ADD PRIMARY KEY (`opo_id`);

--
-- Indexes for table `sales_delivery_d`
--
ALTER TABLE `sales_delivery_d`
  ADD PRIMARY KEY (`part_id`),
  ADD KEY `del_idFK` (`del_id`),
  ADD KEY `inv_h_idfk` (`inv_h_id`);

--
-- Indexes for table `sales_delivery_h`
--
ALTER TABLE `sales_delivery_h`
  ADD PRIMARY KEY (`del_id`);

--
-- Indexes for table `sales_invoice_d`
--
ALTER TABLE `sales_invoice_d`
  ADD PRIMARY KEY (`part_in_id`) USING BTREE,
  ADD KEY `prt_in_id` (`in_id`);

--
-- Indexes for table `sales_invoice_h`
--
ALTER TABLE `sales_invoice_h`
  ADD PRIMARY KEY (`in_id`) USING BTREE;

--
-- Indexes for table `system_company_name`
--
ALTER TABLE `system_company_name`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `system_doc_type`
--
ALTER TABLE `system_doc_type`
  ADD PRIMARY KEY (`sys_doc_id`) USING BTREE;

--
-- Indexes for table `system_doc_type_column_names`
--
ALTER TABLE `system_doc_type_column_names`
  ADD PRIMARY KEY (`sdtcn_id`),
  ADD KEY `sys_doc_id` (`sys_doc_id`),
  ADD KEY `col_id` (`col_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `role_and_user_type` (`user_type`,`role`,`document_type`) USING BTREE;

--
-- Indexes for table `user_roles_column_names`
--
ALTER TABLE `user_roles_column_names`
  ADD PRIMARY KEY (`urcn_id`),
  ADD KEY `col_id_cons` (`col_id`),
  ADD KEY `role_id_cons` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `acct_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `column_names`
--
ALTER TABLE `column_names`
  MODIFY `col_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `lib_po_no`
--
ALTER TABLE `lib_po_no`
  MODIFY `po_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lib_vendors`
--
ALTER TABLE `lib_vendors`
  MODIFY `vendor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `office_inventory_d`
--
ALTER TABLE `office_inventory_d`
  MODIFY `inv_d_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `office_inventory_h`
--
ALTER TABLE `office_inventory_h`
  MODIFY `inv_h_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `office_purchase_order_d`
--
ALTER TABLE `office_purchase_order_d`
  MODIFY `opos_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `office_purchase_order_h`
--
ALTER TABLE `office_purchase_order_h`
  MODIFY `opo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sales_delivery_d`
--
ALTER TABLE `sales_delivery_d`
  MODIFY `part_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `sales_delivery_h`
--
ALTER TABLE `sales_delivery_h`
  MODIFY `del_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `sales_invoice_d`
--
ALTER TABLE `sales_invoice_d`
  MODIFY `part_in_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sales_invoice_h`
--
ALTER TABLE `sales_invoice_h`
  MODIFY `in_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `system_company_name`
--
ALTER TABLE `system_company_name`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `system_doc_type`
--
ALTER TABLE `system_doc_type`
  MODIFY `sys_doc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `system_doc_type_column_names`
--
ALTER TABLE `system_doc_type_column_names`
  MODIFY `sdtcn_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `user_roles_column_names`
--
ALTER TABLE `user_roles_column_names`
  MODIFY `urcn_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `office_inventory_d`
--
ALTER TABLE `office_inventory_d`
  ADD CONSTRAINT `inv_h_id_fk` FOREIGN KEY (`inv_h_id`) REFERENCES `office_inventory_h` (`inv_h_id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_delivery_d`
--
ALTER TABLE `sales_delivery_d`
  ADD CONSTRAINT `del_idFK` FOREIGN KEY (`del_id`) REFERENCES `sales_delivery_h` (`del_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inv_h_idfk` FOREIGN KEY (`inv_h_id`) REFERENCES `office_inventory_h` (`inv_h_id`);

--
-- Constraints for table `sales_invoice_d`
--
ALTER TABLE `sales_invoice_d`
  ADD CONSTRAINT `prt_in_id` FOREIGN KEY (`in_id`) REFERENCES `sales_invoice_h` (`in_id`) ON DELETE CASCADE;

--
-- Constraints for table `system_doc_type_column_names`
--
ALTER TABLE `system_doc_type_column_names`
  ADD CONSTRAINT `col_id` FOREIGN KEY (`col_id`) REFERENCES `column_names` (`col_id`),
  ADD CONSTRAINT `sys_doc_id` FOREIGN KEY (`sys_doc_id`) REFERENCES `system_doc_type` (`sys_doc_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `user_roles_column_names`
--
ALTER TABLE `user_roles_column_names`
  ADD CONSTRAINT `col_id_cons` FOREIGN KEY (`col_id`) REFERENCES `column_names` (`col_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `role_id_cons` FOREIGN KEY (`role_id`) REFERENCES `user_roles` (`role_id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

qwe5 1789-[po.   hhhjklzxcvbnm123456789124563