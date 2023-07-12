-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 27, 2023 at 07:54 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `name` varchar(100) NOT NULL,
  `admin_id` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `designation` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`name`, `admin_id`, `password`, `designation`) VALUES
('नरेश गोडिया', 'admin@gmail.com', 'admin@123', 'Librarian');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `ac_no` varchar(100) NOT NULL,
  `book_name` varchar(100) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `publisher` varchar(100) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `purchase_year` int(4) DEFAULT NULL,
  `book_price` int(7) DEFAULT NULL,
  `issue_status` varchar(100) NOT NULL DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`ac_no`, `book_name`, `author`, `publisher`, `category`, `purchase_year`, `book_price`, `issue_status`) VALUES
('H-01', 'रक्षा विज्ञान (आयुध तथा टेकनोलॉजी)', 'बाला डाँ.मन मोहन विंग कमा.', 'प्रभात प्रकाशन ,दिल्ली  ', '', NULL, NULL, 'Available'),
('H-02', 'परिष्कृत हिन्दी व्याकरण', 'कपूर बदरीनाथ', 'प्रभात प्रकाशन ,दिल्ली', NULL, NULL, NULL, 'Available'),
('H-03', 'अतंरिक्ष की रोचक बातें ', 'मिश्र शिव गोपाल एवं आशुतोष  ', 'प्रतिभा प्रतिष्ठान , नई दिल्ली ', NULL, NULL, NULL, 'Available'),
('H-04', 'कंम्प्यूटर और पुस्तकालय  ', 'शर्मा डा. पांडेय एस.के  ', 'ग्रंथ अकादमी नई दिल्ली ', NULL, NULL, NULL, 'Available'),
('H-05', 'माधव जी सिंधिया', 'वर्मा वृन्दावनलाल ', 'प्रभात प्रकाशन ,दिल्ली', NULL, NULL, NULL, 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `issue_books`
--

CREATE TABLE `issue_books` (
  `ac_no` varchar(100) NOT NULL,
  `book_name` varchar(100) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `issue_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  `SNo` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `issue_books`
--

INSERT INTO `issue_books` (`ac_no`, `book_name`, `user_id`, `issue_date`, `return_date`, `SNo`) VALUES
('7777', 'मेरी कहानी', 'user@gmail.com', '2023-06-27', '2023-06-27', 14);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_name` varchar(100) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `designation` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_name`, `user_id`, `designation`) VALUES
('Praveen', 'user@gmail.com', 'Web Developer'),
('Amal', 'user2@gmail.com', 'Database Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`ac_no`);

--
-- Indexes for table `issue_books`
--
ALTER TABLE `issue_books`
  ADD PRIMARY KEY (`SNo`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `issue_books`
--
ALTER TABLE `issue_books`
  MODIFY `SNo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
