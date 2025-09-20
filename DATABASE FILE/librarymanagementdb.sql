-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2021 at 07:24 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `librarymanagementdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(10) UNSIGNED NOT NULL,
  `ISBN_NO` varchar(100) DEFAULT NULL,
  `Book_Title` varchar(200) DEFAULT NULL,
  `Book_Type` int(10) UNSIGNED DEFAULT NULL,
  `Author_Name` varchar(100) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Purchase_Date` date DEFAULT NULL,
  `Edition` varchar(40) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT '0.00',
  `Pages` int(11) DEFAULT NULL,
  `Publisher` varchar(140) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `ISBN_NO`, `Book_Title`, `Book_Type`, `Author_Name`, `Quantity`, `Purchase_Date`, `Edition`, `Price`, `Pages`, `Publisher`) VALUES
(1, '978-969-0011-00-1', 'Raja Gidh', 1, 'Bano Qudsia', 40, '2022-03-10', '5th', '600.00', 331, 'Sang-e-Meel Publications'),
(2, '978-969-0011-00-2', 'Zavia', 1, 'Ashfaq Ahmed', 50, '2021-11-15', '7th', '750.00', 450, 'Sang-e-Meel Publications'),
(3, '978-969-0011-00-3', 'Pir-e-Kamil', 1, 'Umera Ahmed', 35, '2023-01-22', '3rd', '950.00', 505, 'Ilm-o-Irfan Publishers'),
(4, '978-969-0011-00-4', 'Aangan', 2, 'Khadija Mastoor', 20, '2021-06-18', '2nd', '700.00', 390, 'Sang-e-Meel Publications'),
(5, '978-969-0011-00-5', 'Jinnah of Pakistan', 7, 'Stanley Wolpert', 25, '2020-08-30', '1st', '1200.00', 400, 'Oxford University Press Pakistan'),
(6, '978-969-0011-00-6', 'From Plassey to Partition', 7, 'Sekhar Bandyopadhyay', 18, '2022-04-11', '2nd', '1350.00', 600, 'Orient BlackSwan'),
(7, '978-969-0011-00-7', 'Pakistan: A Hard Country', 7, 'Anatol Lieven', 15, '2023-02-14', '1st', '1400.00', 500, 'PublicAffairs'),
(8, '978-969-0011-00-8', 'Himaqatein', 2, 'Anwar Maqsood', 28, '2021-09-25', '1st', '500.00', 220, 'Liberty Books'),
(9, '978-969-0011-00-9', 'Moth Smoke', 3, 'Mohsin Hamid', 30, '2022-10-10', 'Revised', '950.00', 300, 'Penguin Books'),
(10, '978-969-0011-01-0', 'The Reluctant Fundamentalist', 3, 'Mohsin Hamid', 42, '2023-04-01', '2nd', '850.00', 240, 'Riverhead Books'),
(11, '978-969-0011-01-1', 'Shahab Nama', 1, 'Qudrat Ullah Shahab', 35, '2022-06-22', '4th', '950.00', 500, 'Sang-e-Meel Publications'),
(12, '978-969-0011-01-2', 'Mein Ishq Aur Woh', 2, 'Farhat Ishtiaq', 20, '2023-01-01', '1st', '650.00', 340, 'Ilm-o-Irfan Publishers'),
(13, '978-969-0011-01-3', 'Namal', 1, 'Nemrah Ahmed', 45, '2022-09-12', '3rd', '1200.00', 750, 'Ilm-o-Irfan Publishers'),
(14, '978-969-0011-01-4', 'Younas Khan – The Rise of a Legend', 9, 'Qamar Ahmed', 10, '2021-05-14', '1st', '1000.00', 290, 'Jang Publishers'),
(15, '978-969-0011-01-5', 'Iqbal: A Biography', 7, 'Zafar Anjum', 15, '2020-07-19', '1st', '850.00', 310, 'Liberty Books'),
(16, '978-969-0011-01-6', 'Tafseer Ibn-e-Kathir', 8, 'Ismail Ibn Kathir', 12, '2019-08-10', '5th', '1800.00', 800, 'Darussalam Publishers'),
(17, '978-969-0011-01-7', 'Seerat-un-Nabi', 8, 'Shibli Nomani', 25, '2021-03-03', '6th', '950.00', 620, 'Darussalam Publishers'),
(18, '978-969-0011-01-8', 'Mazameen-e-Sir Syed', 7, 'Sir Syed Ahmed Khan', 18, '2022-04-14', '2nd', '550.00', 370, 'Idara-e-Yaadgar-e-Ghalib'),
(19, '978-969-0011-01-9', 'Bano', 1, 'Razia Butt', 32, '2022-05-15', '3rd', '650.00', 390, 'Ilm-o-Irfan Publishers'),
(20, '978-969-0011-02-0', 'Kamyabi Ka Paigham', 6, 'Qasim Ali Shah', 20, '2022-12-01', '1st', '400.00', 180, 'Qasim Ali Shah Foundation'),
(21, '978-969-0011-02-1', 'Reham Khan', 7, 'Reham Khan', 12, '2021-01-22', '1st', '999.00', 450, 'SK Publications'),
(22, '978-969-0011-02-2', 'A Case of Exploding Mangoes', 3, 'Mohammed Hanif', 22, '2020-02-10', '2nd', '950.00', 340, 'Vintage Books'),
(23, '978-969-0011-02-3', 'Diary of a Social Butterfly', 3, 'Moni Mohsin', 18, '2023-01-19', '1st', '799.00', 310, 'Liberty Books'),
(24, '978-969-0011-02-4', 'Bus Ik Lamha', 2, 'Umera Ahmed', 25, '2021-04-21', '1st', '600.00', 300, 'Ilm-o-Irfan Publishers'),
(25, '978-969-0011-02-5', 'Why I Assassinated Gandhi', 7, 'Nathuram Godse', 6, '2023-06-01', '1st', '700.00', 250, 'Ferozsons'),
(26, '978-969-0011-02-6', 'Social Media Marketing Urdu', 6, 'Ali Hassan', 15, '2022-03-10', '1st', '500.00', 180, 'Digiskills.pk'),
(27, '978-969-0011-02-7', 'Taleem-o-Tarbiyat', 5, 'Editorial Board', 30, '2023-02-15', 'Annual', '300.00', 120, 'Ferozsons'),
(28, '978-969-0011-02-8', 'Islamiat for Class 10', 5, 'Punjab Textbook Board', 100, '2023-01-10', '2023', '200.00', 200, 'PTB Lahore');


-- --------------------------------------------------------

--
-- Table structure for table `book_issue`
--

CREATE TABLE `book_issue` (
  `id` int(10) UNSIGNED NOT NULL,
  `Member` int(10) UNSIGNED DEFAULT NULL,
  `Number` int(10) UNSIGNED DEFAULT NULL,
  `Book_Number` int(10) UNSIGNED DEFAULT NULL,
  `Book_Title` int(10) UNSIGNED DEFAULT NULL,
  `Issue_Date` date DEFAULT NULL,
  `Return_Date` date DEFAULT NULL,
  `Status` varchar(40) DEFAULT NULL,
  `issue_id` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book_issue`
--

INSERT INTO `book_issue` (`id`, `Member`, `Number`, `Book_Number`, `Book_Title`, `Issue_Date`, `Return_Date`, `Status`, `issue_id`) VALUES
(1, 1, 1, 1, 1, '2018-02-24', '2018-02-24', 'returned', '1023'),
(8, 9, 9, 10, 10, '2021-04-23', '2021-04-27', 'returned', '602'),
(9, 7, 7, 11, 11, '2021-04-14', '2021-04-23', 'issued', '603'),
(10, 5, 5, 1, 1, '2021-04-20', '2021-04-24', 'issued', '609'),
(11, 3, 3, 10, 10, '2021-04-21', '2021-04-23', 'returned', '612'),
(12, 13, 13, 2, 2, '2021-04-15', '2021-04-18', 'returned', '622'),
(13, 1, 1, 19, 19, '2021-04-22', '2021-05-09', 'issued', '669'),
(14, 8, 8, 21, 21, '2021-04-23', '2021-06-07', 'issued', '660'),
(15, 2, 2, 18, 18, '2021-03-29', '2021-04-23', 'returned', '852'),
(17, 11, 11, 1, 1, '2021-04-10', '2021-04-22', 'issued', '963'),
(18, 15, 15, 6, 6, '2021-02-11', '2021-04-23', 'returned', '888');

-- --------------------------------------------------------

--
-- Table structure for table `magazines`
--

CREATE TABLE `magazines` (
  `id` int(10) UNSIGNED NOT NULL,
  `Type` varchar(40) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Date_Of_Receipt` date DEFAULT NULL,
  `Date_Published` date DEFAULT NULL,
  `Pages` int(11) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT '0.00',
  `Publisher` varchar(140) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `magazines`
--

INSERT INTO `magazines` (`id`, `Type`, `Name`, `Date_Of_Receipt`, `Date_Published`, `Pages`, `Price`, `Publisher`) VALUES
(1, 'Entertainment', 'Mag the Weekly', '2025-06-20', '2025-06-21', 40, '80.00', 'Jang Group of Newspapers'),
(2, 'Fashion, Lifestyle', 'Diva Pakistan', '2025-06-21', '2025-06-22', 48, '100.00', 'Diva Media Pvt. Ltd.'),
(3, 'Current Affairs, Politics', 'Herald', '2025-06-22', '2025-06-23', 50, '120.00', 'Dawn Media Group'),
(4, 'Women, Lifestyle', 'Women’s Own', '2025-06-23', '2025-06-24', 36, '75.00', 'Syed Group Publishers');


-- --------------------------------------------------------

--
-- Table structure for table `membership_grouppermissions`
--

CREATE TABLE `membership_grouppermissions` (
  `permissionID` int(10) UNSIGNED NOT NULL,
  `groupID` int(11) DEFAULT NULL,
  `tableName` varchar(100) DEFAULT NULL,
  `allowInsert` tinyint(4) DEFAULT NULL,
  `allowView` tinyint(4) NOT NULL DEFAULT '0',
  `allowEdit` tinyint(4) NOT NULL DEFAULT '0',
  `allowDelete` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `membership_grouppermissions`
--

INSERT INTO `membership_grouppermissions` (`permissionID`, `groupID`, `tableName`, `allowInsert`, `allowView`, `allowEdit`, `allowDelete`) VALUES
(1, 2, 'books', 1, 3, 3, 3),
(2, 2, 'NewsPapers', 1, 3, 3, 3),
(3, 2, 'Magazines', 1, 3, 3, 3),
(4, 2, 'Users', 1, 3, 3, 3),
(5, 2, 'Book_Issue', 1, 3, 3, 3),
(6, 2, 'Return_Book', 1, 3, 3, 3),
(7, 2, 'Types', 1, 3, 3, 3),
(8, 2, 'Return', 1, 3, 3, 3),
(30, 3, 'books', 0, 3, 0, 0),
(31, 3, 'NewsPapers', 0, 3, 0, 0),
(32, 3, 'Magazines', 0, 3, 0, 0),
(33, 3, 'Users', 0, 3, 0, 0),
(34, 3, 'Book_Issue', 0, 3, 0, 0),
(35, 3, 'Return_Book', 0, 3, 0, 0),
(36, 3, 'Types', 0, 3, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `membership_groups`
--

CREATE TABLE `membership_groups` (
  `groupID` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `description` text,
  `allowSignup` tinyint(4) DEFAULT NULL,
  `needsApproval` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `membership_groups`
--

INSERT INTO `membership_groups` (`groupID`, `name`, `description`, `allowSignup`, `needsApproval`) VALUES
(1, 'anonymous', 'Anonymous group created automatically on 2018-02-24', 0, 0),
(2, 'Admins', 'Admin group created automatically on 2018-02-24', 0, 1),
(3, 'demo', 'demo users', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `membership_userpermissions`
--

CREATE TABLE `membership_userpermissions` (
  `permissionID` int(10) UNSIGNED NOT NULL,
  `memberID` varchar(20) NOT NULL,
  `tableName` varchar(100) DEFAULT NULL,
  `allowInsert` tinyint(4) DEFAULT NULL,
  `allowView` tinyint(4) NOT NULL DEFAULT '0',
  `allowEdit` tinyint(4) NOT NULL DEFAULT '0',
  `allowDelete` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `membership_userrecords`
--

CREATE TABLE `membership_userrecords` (
  `recID` bigint(20) UNSIGNED NOT NULL,
  `tableName` varchar(100) DEFAULT NULL,
  `pkValue` varchar(255) DEFAULT NULL,
  `memberID` varchar(20) DEFAULT NULL,
  `dateAdded` bigint(20) UNSIGNED DEFAULT NULL,
  `dateUpdated` bigint(20) UNSIGNED DEFAULT NULL,
  `groupID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `membership_userrecords`
--

INSERT INTO `membership_userrecords` (`recID`, `tableName`, `pkValue`, `memberID`, `dateAdded`, `dateUpdated`, `groupID`) VALUES
(1, 'Types', '1', 'admin', 1519466337, 1519466337, 2),
(2, 'Types', '2', 'admin', 1519466356, 1519466356, 2),
(3, 'Types', '3', 'admin', 1519466381, 1519466381, 2),
(4, 'books', '1', 'admin', 1519466456, 1619183735, 2),
(5, 'Users', '1', 'admin', 1519466500, 1619182931, 2),
(6, 'Book_Issue', '1', 'admin', 1519466549, 1619196527, 2),
(7, 'Return_Book', '1', 'admin', 1519466780, 1519466780, 2),
(8, 'Users', '2', 'admin', 1519468487, 1619182955, 2),
(9, 'books', '2', 'admin', 1519468656, 1619184073, 2),
(11, 'books', '3', 'admin', 1519479901, 1619185728, 2),
(12, 'NewsPapers', '1', 'admin', 1519479996, 1619186362, 2),
(17, 'Users', '3', 'admin', 1619089939, 1619182980, 2),
(19, 'Users', '4', 'admin', 1619183387, 1619183400, 2),
(20, 'Users', '5', 'admin', 1619183422, 1619183422, 2),
(21, 'Users', '6', 'admin', 1619183446, 1619183446, 2),
(22, 'Users', '7', 'admin', 1619183467, 1619183467, 2),
(23, 'Users', '8', 'admin', 1619183493, 1619183493, 2),
(24, 'Users', '9', 'admin', 1619183513, 1619183513, 2),
(25, 'Users', '10', 'admin', 1619183542, 1619183542, 2),
(26, 'Users', '11', 'admin', 1619183564, 1619183564, 2),
(27, 'Users', '12', 'admin', 1619183585, 1619183585, 2),
(28, 'Users', '13', 'admin', 1619183609, 1619183609, 2),
(29, 'books', '4', 'admin', 1619183892, 1619183892, 2),
(30, 'books', '5', 'admin', 1619183974, 1619183974, 2),
(31, 'books', '6', 'admin', 1619184647, 1619184647, 2),
(32, 'books', '7', 'admin', 1619184743, 1619184743, 2),
(33, 'books', '8', 'admin', 1619185065, 1619185065, 2),
(34, 'books', '9', 'admin', 1619185151, 1619185151, 2),
(35, 'books', '10', 'admin', 1619185243, 1619185243, 2),
(36, 'books', '11', 'admin', 1619185529, 1619185529, 2),
(37, 'books', '12', 'admin', 1619185625, 1619185625, 2),
(38, 'books', '13', 'admin', 1619185813, 1619185813, 2),
(39, 'books', '14', 'admin', 1619185892, 1619185892, 2),
(40, 'books', '15', 'admin', 1619186013, 1619186013, 2),
(41, 'books', '16', 'admin', 1619186138, 1619186138, 2),
(42, 'NewsPapers', '2', 'admin', 1619186289, 1619186289, 2),
(43, 'NewsPapers', '3', 'admin', 1619186339, 1619186339, 2),
(44, 'NewsPapers', '4', 'admin', 1619186407, 1619186407, 2),
(45, 'NewsPapers', '5', 'admin', 1619186465, 1619186465, 2),
(46, 'NewsPapers', '6', 'admin', 1619186561, 1619186561, 2),
(47, 'Magazines', '1', 'admin', 1619186696, 1619186696, 2),
(48, 'Magazines', '2', 'admin', 1619186784, 1619186784, 2),
(49, 'Magazines', '3', 'admin', 1619186855, 1619186855, 2),
(50, 'Book_Issue', '8', 'admin', 1619186928, 1619188225, 2),
(51, 'Book_Issue', '9', 'admin', 1619186953, 1619186953, 2),
(52, 'Book_Issue', '10', 'admin', 1619186991, 1619186991, 2),
(53, 'Book_Issue', '11', 'admin', 1619187027, 1619187071, 2),
(54, 'Book_Issue', '12', 'admin', 1619187048, 1619198333, 2),
(55, 'Return_Book', '2', 'admin', 1619187108, 1619187108, 2),
(56, 'books', '17', 'admin', 1619187655, 1619187655, 2),
(57, 'books', '18', 'admin', 1619187753, 1619187753, 2),
(58, 'books', '19', 'admin', 1619187871, 1619187871, 2),
(59, 'books', '20', 'admin', 1619187965, 1619187965, 2),
(60, 'books', '21', 'admin', 1619188047, 1619188047, 2),
(61, 'Book_Issue', '13', 'admin', 1619188096, 1619188305, 2),
(62, 'Book_Issue', '14', 'admin', 1619188130, 1619188130, 2),
(63, 'Book_Issue', '15', 'admin', 1619188160, 1619188352, 2),
(65, 'Book_Issue', '17', 'admin', 1619188209, 1619188209, 2),
(66, 'Return_Book', '3', 'admin', 1619188281, 1619188281, 2),
(67, 'Return_Book', '4', 'admin', 1619188343, 1619188343, 2),
(68, 'Users', '14', 'admin', 1619197135, 1619197135, 2),
(69, 'Users', '15', 'admin', 1619197769, 1619197769, 2),
(70, 'books', '22', 'admin', 1619197888, 1619197888, 2),
(71, 'NewsPapers', '7', 'admin', 1619198040, 1619198040, 2),
(72, 'Magazines', '4', 'admin', 1619198138, 1619198138, 2),
(73, 'Book_Issue', '18', 'admin', 1619198218, 1619198262, 2),
(74, 'Return_Book', '5', 'admin', 1619198290, 1619198290, 2),
(75, 'Return_Book', '6', 'admin', 1619198359, 1619198359, 2);

-- --------------------------------------------------------

--
-- Table structure for table `membership_users`
--

CREATE TABLE `membership_users` (
  `memberID` varchar(20) NOT NULL,
  `passMD5` varchar(40) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `signupDate` date DEFAULT NULL,
  `groupID` int(10) UNSIGNED DEFAULT NULL,
  `isBanned` tinyint(4) DEFAULT NULL,
  `isApproved` tinyint(4) DEFAULT NULL,
  `custom1` text,
  `custom2` text,
  `custom3` text,
  `custom4` text,
  `comments` text,
  `pass_reset_key` varchar(100) DEFAULT NULL,
  `pass_reset_expiry` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `membership_users`
--

INSERT INTO `membership_users` (`memberID`, `passMD5`, `email`, `signupDate`, `groupID`, `isBanned`, `isApproved`, `custom1`, `custom2`, `custom3`, `custom4`, `comments`, `pass_reset_key`, `pass_reset_expiry`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@pakistan.com', '2023-01-10', 2, 0, 1, 'Ahmed Khan', 'House 23, Street 10, G-11/3', 'Islamabad', 'Punjab', 'Admin member created automatically on 2023-01-10', NULL, NULL),
('demo', 'fe01ce2a7fbac8fafaed7c982a04e229', 'demo@pakistan.com', '2023-02-15', 3, 0, 1, 'Demo User', 'Flat 4-B, Civic Center', 'Karachi', 'Sindh', 'Demo account for testing purpose', NULL, NULL),
('guest', NULL, NULL, '2023-03-01', 1, 0, 1, NULL, NULL, NULL, NULL, 'Anonymous member created automatically on 2023-03-01', NULL, NULL),
('ali123', '5f4dcc3b5aa765d61d8327deb882cf99', 'ali.raza@email.com', '2023-04-05', 2, 0, 1, 'Ali Raza', 'House 17, Street 8, Model Town', 'Lahore', 'Punjab', 'Registered user Ali Raza', NULL, NULL),
('sana456', 'e99a18c428cb38d5f260853678922e03', 'sana.khan@email.com', '2023-04-10', 3, 0, 1, 'Sana Khan', 'Flat 10-C, PECHS Block 6', 'Karachi', 'Sindh', 'Newly signed up user', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `newspapers`
--

CREATE TABLE `newspapers` (
  `id` int(10) UNSIGNED NOT NULL,
  `Language` varchar(40) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Date_Of_Receipt` date DEFAULT NULL,
  `Date_Published` date DEFAULT NULL,
  `Pages` int(11) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT '0.00',
  `Type` varchar(40) DEFAULT NULL,
  `Publisher` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `newspapers`
--

INSERT INTO `newspapers` (`id`, `Language`, `Name`, `Date_Of_Receipt`, `Date_Published`, `Pages`, `Price`, `Type`, `Publisher`) VALUES
(1, 'Urdu', 'Jang', '2025-06-25', '2025-06-25', 20, '30.00', 'News', 'Jang Group of Newspapers'),
(2, 'English', 'Dawn', '2025-06-25', '2025-06-25', 22, '40.00', 'News', 'Dawn Media Group'),
(3, 'Urdu', 'Nawa-i-Waqt', '2025-06-24', '2025-06-24', 18, '25.00', 'News', 'Nawa-i-Waqt Group'),
(4, 'English', 'The News International', '2025-06-23', '2025-06-23', 24, '45.00', 'News', 'Jang Group of Newspapers'),
(5, 'Urdu', 'Express', '2025-06-22', '2025-06-22', 16, '20.00', 'News', 'Express Media Group'),
(6, 'English', 'Business Recorder', '2025-06-21', '2025-06-21', 30, '60.00', 'Business News', 'Business Recorder Group'),
(7, 'Urdu', 'Daily Pakistan', '2025-06-20', '2025-06-20', 19, '25.00', 'News', 'Mujeeb-ur-Rehman Shami');


-- --------------------------------------------------------

--
-- Table structure for table `return_book`
--

CREATE TABLE `return_book` (
  `id` int(10) UNSIGNED NOT NULL,
  `Book_Number` int(10) UNSIGNED DEFAULT NULL,
  `Book_Title` int(10) UNSIGNED DEFAULT NULL,
  `Issue_Date` date DEFAULT NULL,
  `Due_Date` int(10) UNSIGNED DEFAULT '1',
  `Return_Date` date DEFAULT NULL,
  `Member` int(10) UNSIGNED DEFAULT NULL,
  `Number` int(10) UNSIGNED DEFAULT NULL,
  `Fine` decimal(10,2) DEFAULT '0.00',
  `Status` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `return_book`
--

INSERT INTO `return_book` (`id`, `Book_Number`, `Book_Title`, `Issue_Date`, `Due_Date`, `Return_Date`, `Member`, `Number`, `Fine`, `Status`) VALUES
(1, 1, 1, '0000-00-00', 1, '2018-03-04', 1, 1, '50.00', 'cleared'),
(2, 11, 11, '0000-00-00', 11, '2021-04-23', 3, 3, '0.00', 'cleared'),
(3, 8, 8, '0000-00-00', 8, '2021-04-23', 9, 9, '60.00', 'cleared'),
(4, 15, 15, '0000-00-00', 15, '2021-04-23', 2, 2, '0.00', 'pending'),
(5, 18, 18, '0000-00-00', 18, '2021-04-23', 15, 15, '50.00', 'cleared'),
(6, 12, 12, '0000-00-00', 12, '2021-04-23', 13, 13, '100.00', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id` int(10) UNSIGNED NOT NULL,
  `Name` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `Name`) VALUES
(1, 'Urdu Novel'),
(2, 'Afsanay (Short Stories)'),
(3, 'Science Fiction (Ilmi Kahaniyan)'),
(4, 'Fantasy Fiction'),
(5, 'Tareekhi Novel'),
(6, 'Adventure Stories'),
(7, 'Jasoosi Kahaniyan'),
(8, 'Romantic Fiction'),
(9, 'Thriller / Suspense'),
(10, 'Sawanih-e-Umri (Biographies)');


-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `Membership_Number` varchar(40) DEFAULT NULL,
  `Name` varchar(140) DEFAULT NULL,
  `Contact` varchar(40) DEFAULT NULL,
  `ID_Number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `Membership_Number`, `Name`, `Contact`, `ID_Number`) VALUES
(1, '2001', 'Ali Raza', '03001234567', 3520285678901),
(2, '2002', 'Sana Khan', '03111234567', 4210187654321),
(3, '2003', 'Usman Javed', '03219876543', 3740523456789),
(4, '2004', 'Fatima Noor', '03331239876', 6110198765432),
(5, '2005', 'Zain Ahmed', '03451230987', 3520178912345),
(6, '2006', 'Ayesha Malik', '03011239876', 4220123456781),
(7, '2007', 'Hamza Tariq', '03151238976', 6110187654323),
(8, '2008', 'Nida Aftab', '03241234567', 3740198765432),
(9, '2009', 'Bilal Hussain', '03311234567', 4210112345678),
(10, '2010', 'Hira Naveed', '03461239876', 3520212345670),
(11, '2011', 'Rizwan Saeed', '03051231234', 3740112345674),
(12, '2012', 'Mehwish Arif', '03161238900', 6110176543219),
(13, '2013', 'Farhan Ali', '03251239888', 3520187654321),
(14, '2014', 'Amna Yousuf', '03371234567', 4210178912340),
(15, '2015', 'Tariq Mehmood', '03411234567', 3740167890123);


--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Book_Type` (`Book_Type`);

--
-- Indexes for table `book_issue`
--
ALTER TABLE `book_issue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Member` (`Member`),
  ADD KEY `Book_Number` (`Book_Number`);

--
-- Indexes for table `magazines`
--
ALTER TABLE `magazines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `membership_grouppermissions`
--
ALTER TABLE `membership_grouppermissions`
  ADD PRIMARY KEY (`permissionID`);

--
-- Indexes for table `membership_groups`
--
ALTER TABLE `membership_groups`
  ADD PRIMARY KEY (`groupID`);

--
-- Indexes for table `membership_userpermissions`
--
ALTER TABLE `membership_userpermissions`
  ADD PRIMARY KEY (`permissionID`);

--
-- Indexes for table `membership_userrecords`
--
ALTER TABLE `membership_userrecords`
  ADD PRIMARY KEY (`recID`),
  ADD UNIQUE KEY `tableName_pkValue` (`tableName`,`pkValue`),
  ADD KEY `pkValue` (`pkValue`),
  ADD KEY `tableName` (`tableName`),
  ADD KEY `memberID` (`memberID`),
  ADD KEY `groupID` (`groupID`);

--
-- Indexes for table `membership_users`
--
ALTER TABLE `membership_users`
  ADD PRIMARY KEY (`memberID`),
  ADD KEY `groupID` (`groupID`);

--
-- Indexes for table `newspapers`
--
ALTER TABLE `newspapers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `return_book`
--
ALTER TABLE `return_book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Book_Number` (`Book_Number`),
  ADD KEY `Member` (`Member`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `book_issue`
--
ALTER TABLE `book_issue`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `magazines`
--
ALTER TABLE `magazines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `membership_grouppermissions`
--
ALTER TABLE `membership_grouppermissions`
  MODIFY `permissionID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `membership_groups`
--
ALTER TABLE `membership_groups`
  MODIFY `groupID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `membership_userpermissions`
--
ALTER TABLE `membership_userpermissions`
  MODIFY `permissionID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `membership_userrecords`
--
ALTER TABLE `membership_userrecords`
  MODIFY `recID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;
--
-- AUTO_INCREMENT for table `newspapers`
--
ALTER TABLE `newspapers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `return_book`
--
ALTER TABLE `return_book`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
