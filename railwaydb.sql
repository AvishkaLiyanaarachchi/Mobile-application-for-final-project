-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Nov 18, 2020 at 06:01 PM
-- Server version: 8.0.18
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `railwaydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment`
--

DROP TABLE IF EXISTS `tbl_payment`;
CREATE TABLE IF NOT EXISTS `tbl_payment` (
  `paymentId` int(11) NOT NULL AUTO_INCREMENT,
  `paymentType` varchar(45) NOT NULL,
  `cardNumber` varchar(45) NOT NULL,
  `bank_name` varchar(45) NOT NULL,
  `tbl_ticket_ticketId` int(11) NOT NULL,
  `tbl_ticket_tbl_user_user_id` int(11) NOT NULL,
  `tbl_ticket_tbl_timeTable_timeTableId` int(11) NOT NULL,
  `tbl_ticket_tbl_QRcodeGeneration_QRcodeId` int(11) NOT NULL,
  PRIMARY KEY (`paymentId`,`tbl_ticket_ticketId`,`tbl_ticket_tbl_user_user_id`,`tbl_ticket_tbl_timeTable_timeTableId`,`tbl_ticket_tbl_QRcodeGeneration_QRcodeId`),
  KEY `fk_tbl_payment_tbl_ticket1` (`tbl_ticket_ticketId`,`tbl_ticket_tbl_user_user_id`,`tbl_ticket_tbl_timeTable_timeTableId`,`tbl_ticket_tbl_QRcodeGeneration_QRcodeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_payment`
--

INSERT INTO `tbl_payment` (`paymentId`, `paymentType`, `cardNumber`, `bank_name`, `tbl_ticket_ticketId`, `tbl_ticket_tbl_user_user_id`, `tbl_ticket_tbl_timeTable_timeTableId`, `tbl_ticket_tbl_QRcodeGeneration_QRcodeId`) VALUES
(1, 'Debit', 'ag7272828', 'NTB', 1, 2, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_qrcodegeneration`
--

DROP TABLE IF EXISTS `tbl_qrcodegeneration`;
CREATE TABLE IF NOT EXISTS `tbl_qrcodegeneration` (
  `QRcodeId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`QRcodeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_qrcodegeneration`
--

INSERT INTO `tbl_qrcodegeneration` (`QRcodeId`) VALUES
(1),
(2),
(3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reportgeneration`
--

DROP TABLE IF EXISTS `tbl_reportgeneration`;
CREATE TABLE IF NOT EXISTS `tbl_reportgeneration` (
  `reportId` int(11) NOT NULL AUTO_INCREMENT,
  `report_name` varchar(45) NOT NULL,
  `report_type` varchar(45) NOT NULL,
  PRIMARY KEY (`reportId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_reportgeneration`
--

INSERT INTO `tbl_reportgeneration` (`reportId`, `report_name`, `report_type`) VALUES
(1, 'Ticket report', 'CSV file'),
(2, 'Train details report', 'Bar chart'),
(3, 'Timetable report', 'CSV file'),
(4, 'nannan', 'ahhahj');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ticket`
--

DROP TABLE IF EXISTS `tbl_ticket`;
CREATE TABLE IF NOT EXISTS `tbl_ticket` (
  `ticketId` int(11) NOT NULL AUTO_INCREMENT,
  `destination` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `tbl_user_user_id` int(11) NOT NULL,
  `tbl_timeTable_timeTableId` int(11) NOT NULL,
  `tbl_QRcodeGeneration_QRcodeId` int(11) NOT NULL,
  PRIMARY KEY (`ticketId`,`tbl_user_user_id`,`tbl_timeTable_timeTableId`,`tbl_QRcodeGeneration_QRcodeId`),
  KEY `fk_tbl_ticket_tbl_user` (`tbl_user_user_id`),
  KEY `fk_tbl_ticket_tbl_timeTable1` (`tbl_timeTable_timeTableId`),
  KEY `fk_tbl_ticket_tbl_QRcodeGeneration1` (`tbl_QRcodeGeneration_QRcodeId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_ticket`
--

INSERT INTO `tbl_ticket` (`ticketId`, `destination`, `date`, `tbl_user_user_id`, `tbl_timeTable_timeTableId`, `tbl_QRcodeGeneration_QRcodeId`) VALUES
(1, 'Kandy to Colombo Fort', '2020-10-06', 2, 6, 1),
(2, 'Colombo to badulla', '0000-00-00', 2, 1, 2),
(3, 'Colombo Fort to Hatton', '2020-08-20', 3, 3, 1),
(4, 'Colombo Fort to Matale', '2020-07-14', 2, 4, 2),
(5, 'Colombo Fort to Vauniya', '0000-00-00', 3, 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_timetable`
--

DROP TABLE IF EXISTS `tbl_timetable`;
CREATE TABLE IF NOT EXISTS `tbl_timetable` (
  `timeTableId` int(11) NOT NULL AUTO_INCREMENT,
  `destination` varchar(45) NOT NULL,
  `train_type` varchar(45) NOT NULL,
  `arrival_time` varchar(45) NOT NULL,
  `depature_time` varchar(45) NOT NULL,
  PRIMARY KEY (`timeTableId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_timetable`
--

INSERT INTO `tbl_timetable` (`timeTableId`, `destination`, `train_type`, `arrival_time`, `depature_time`) VALUES
(1, 'Colombo Fort to Badulla', 'Express', '16:00', '05:55'),
(2, 'Colombo Fort to Badulla', 'normal', '05:55', '16:00'),
(3, 'Colombo Fort to Hatton', 'Express', '19:52', '12:40'),
(4, 'Colombo Fort to Matale', 'Express', '13:52', '10:35'),
(5, 'Matale to Colombo Fort', 'Express', '09:45', '05:15'),
(6, 'Kandy to Colombo Fort', 'Express', '18:55', '15:30'),
(7, 'Kandy to Colombo Fort', 'Express', '13:40', '10:25'),
(8, 'Colombo Fort to Matara', 'Express', '12:27', '08:35'),
(9, 'Maradana to Galle', 'Express', '20:05', '17:20'),
(10, 'Maradana to Aluthgama', 'Normal', '19.30', '20.30'),
(11, 'Maradana to Panadura', 'Normal', '19.45', '20.20'),
(12, 'Colombo Fort to Vavniya', 'Express', '20:15', '13:45');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_traindetail`
--

DROP TABLE IF EXISTS `tbl_traindetail`;
CREATE TABLE IF NOT EXISTS `tbl_traindetail` (
  `trainId` int(11) NOT NULL AUTO_INCREMENT,
  `train_name` varchar(45) NOT NULL,
  `train_number` varchar(45) NOT NULL,
  `destination` varchar(45) NOT NULL,
  `tbl_timeTable_timeTableId` int(11) NOT NULL,
  `availability_seat` varchar(45) NOT NULL,
  `class_type` varchar(45) NOT NULL,
  PRIMARY KEY (`trainId`) USING BTREE,
  KEY `fk_tbl_trainDetail_tbl_timeTable1` (`tbl_timeTable_timeTableId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_traindetail`
--

INSERT INTO `tbl_traindetail` (`trainId`, `train_name`, `train_number`, `destination`, `tbl_timeTable_timeTableId`, `availability_seat`, `class_type`) VALUES
(1, 'Podi Menike', '1234', 'Colombo Fort to Badulla', 1, '500', 'B'),
(2, 'Udarata Menike', '22hwh', 'Colombo Fort to Badulla', 1, '560', 'A'),
(3, 'Express (B)', '76ty', 'Colombo Fort to Hatton', 3, '450', 'C'),
(4, 'Express (A', '87yy', 'Colombo Fort to Matale', 4, '470', 'A'),
(5, 'Express (B)', '78626', 'Matale to Colombo Fort', 5, '540', 'C'),
(6, 'Express (A)', 'wtwt3636', 'Kandy to Colombo Fort', 6, '500', 'A'),
(7, 'Express (B)', '34353', 'Colombo Fort to Kandy', 5, '430', 'B'),
(8, 'Ruhunu Kumari', 'bv747', 'Maradana to Aluthgama', 10, '370', 'C'),
(9, 'Galu Kumari', '46hshsh', 'Maradana to Galle', 9, '450', 'A'),
(10, 'Sangarika', 'bg56747', 'Maradana to Panadura', 11, '320', 'B'),
(11, 'Udarata Manike', '202bb', 'Colombo Fort to Badulla', 3, '340', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_trainnotification`
--

DROP TABLE IF EXISTS `tbl_trainnotification`;
CREATE TABLE IF NOT EXISTS `tbl_trainnotification` (
  `notificationId` int(11) NOT NULL AUTO_INCREMENT,
  `notification_name` varchar(45) NOT NULL,
  PRIMARY KEY (`notificationId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_trainnotification`
--

INSERT INTO `tbl_trainnotification` (`notificationId`, `notification_name`) VALUES
(1, 'Train accident'),
(2, 'Train strike'),
(3, 'Train delay information'),
(4, 'nannan');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_trains_with_time`
--

DROP TABLE IF EXISTS `tbl_trains_with_time`;
CREATE TABLE IF NOT EXISTS `tbl_trains_with_time` (
  `RecordKey` int(11) NOT NULL AUTO_INCREMENT,
  `TrainId` int(11) NOT NULL,
  `TimetblId` int(11) NOT NULL,
  PRIMARY KEY (`RecordKey`),
  KEY `TimetblId` (`TimetblId`),
  KEY `TrainId` (`TrainId`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_trains_with_time`
--

INSERT INTO `tbl_trains_with_time` (`RecordKey`, `TrainId`, `TimetblId`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 2, 3),
(4, 3, 4),
(5, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE IF NOT EXISTS `tbl_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `user_email` varchar(45) NOT NULL,
  `password` varchar(40) NOT NULL,
  `user_contact` int(11) DEFAULT NULL,
  `user_address` varchar(45) DEFAULT NULL,
  `tbl_userRoles_userRoleId` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`tbl_userRoles_userRoleId`),
  KEY `fk_tbl_user_tbl_userRoles1` (`tbl_userRoles_userRoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `username`, `user_email`, `password`, `user_contact`, `user_address`, `tbl_userRoles_userRoleId`) VALUES
(1, '0', 'dilki@gmail.com', '1234', 266272882, '0', 1),
(2, 'Sameera', 'sameera@gmail.com', 'samee12', 155161667, 'Wallawatta.colombo', 1),
(3, 'Peter', 'peter@gmail.com', '67890', 616627777, 'Dehiwala.Colombo', 1),
(4, 'jhon', 'jhon@gmail.com', '3737eheh', 27272727, 'shshss', 1),
(5, 'sahan', 'sahan@gmail.com', 'san12', 28282828, 'amaam', 1),
(6, 'sahan', 'sahan@gmail.com', 'san12', 28282828, 'amaam', 1),
(11, 'dil', 'dil@gmail.com', 'dil123', 28288292, 'mratuwa', 2),
(18, 'chatura', 'chatura@gmail.com', '123', 2456788, 'kaluthara', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_userroles`
--

DROP TABLE IF EXISTS `tbl_userroles`;
CREATE TABLE IF NOT EXISTS `tbl_userroles` (
  `userRoleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(45) NOT NULL,
  PRIMARY KEY (`userRoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_userroles`
--

INSERT INTO `tbl_userroles` (`userRoleId`, `roleName`) VALUES
(1, 'Passenger'),
(2, 'Admin'),
(3, 'station master');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  ADD CONSTRAINT `fk_tbl_payment_tbl_ticket1` FOREIGN KEY (`tbl_ticket_ticketId`,`tbl_ticket_tbl_user_user_id`,`tbl_ticket_tbl_timeTable_timeTableId`,`tbl_ticket_tbl_QRcodeGeneration_QRcodeId`) REFERENCES `tbl_ticket` (`ticketId`, `tbl_user_user_id`, `tbl_timeTable_timeTableId`, `tbl_QRcodeGeneration_QRcodeId`);

--
-- Constraints for table `tbl_ticket`
--
ALTER TABLE `tbl_ticket`
  ADD CONSTRAINT `fk_tbl_ticket_tbl_QRcodeGeneration1` FOREIGN KEY (`tbl_QRcodeGeneration_QRcodeId`) REFERENCES `tbl_qrcodegeneration` (`QRcodeId`),
  ADD CONSTRAINT `fk_tbl_ticket_tbl_timeTable1` FOREIGN KEY (`tbl_timeTable_timeTableId`) REFERENCES `tbl_timetable` (`timeTableId`),
  ADD CONSTRAINT `fk_tbl_ticket_tbl_user` FOREIGN KEY (`tbl_user_user_id`) REFERENCES `tbl_user` (`user_id`);

--
-- Constraints for table `tbl_traindetail`
--
ALTER TABLE `tbl_traindetail`
  ADD CONSTRAINT `fk_tbl_trainDetail_tbl_timeTable1` FOREIGN KEY (`tbl_timeTable_timeTableId`) REFERENCES `tbl_timetable` (`timeTableId`);

--
-- Constraints for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD CONSTRAINT `fk_tbl_user_tbl_userRoles1` FOREIGN KEY (`tbl_userRoles_userRoleId`) REFERENCES `tbl_userroles` (`userRoleId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
