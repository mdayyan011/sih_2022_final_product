-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2022 at 02:53 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vvgnli_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `article_comments`
--

CREATE TABLE `general_customer` (
  `general_user_Id` int(11) NOT NULL,
  `general_user_language_Id` int(11) NOT NULL,
  `general_user_first_name` varchar(255) NOT NULL,
  `general_user_last_name` varchar(255) NOT NULL,
  `general_user_email` varchar(255) NOT NULL,
  `general_user_mobile` int(11) DEFAULT NULL,
  `general_email_verification_code` int(11) DEFAULT NULL,
  `general_password_verification_code` int(11) DEFAULT NULL,
  `general_user_dob` date NOT NULL,
  `is_admin` int(11) NOT NULL DEFAULT 0,
  `is_email_verified` int(11) NOT NULL DEFAULT 0,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `general_customer`
--
ALTER TABLE `general_customer`
  ADD PRIMARY KEY (`general_user_Id`),
  ADD UNIQUE KEY `general_user_email` (`general_user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `general_customer`
--
ALTER TABLE `general_customer`
  MODIFY `general_user_Id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;





CREATE TABLE `general_article` (
  `general_article_Id` int(11) NOT NULL,
  `general_customer_Id` int(11) NOT NULL,
  `article_thumbnail_url` varchar(255) DEFAULT NULL,
  `article_title` varchar(255) NOT NULL,
  `article_body` varchar(255) DEFAULT NULL,
  `article_language_Id` int(11) NOT NULL,
  `article_hash` varchar(255) DEFAULT NULL,
  `article_status` varchar(255) NOT NULL,
  `article_total_likes` int(11) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `general_article`
--
ALTER TABLE `general_article`
  ADD PRIMARY KEY (`general_article_Id`),
  ADD UNIQUE KEY `general_customer_Id` (`general_customer_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `general_article`
--
ALTER TABLE `general_article`
  MODIFY `general_article_Id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;



CREATE TABLE `article_comments` (
  `article_comment_Id` int(11) NOT NULL,
  `general_article_Id` int(11) NOT NULL,
  `general_user_Id` int(11) NOT NULL,
  `comment_body` varchar(255) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `article_likes`
--

CREATE TABLE `article_likes` (
  `article_likes_Id` int(11) NOT NULL,
  `general_article_Id` int(11) NOT NULL,
  `general_user_Id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `general_article`
--
-- Error reading structure for table vvgnli_db.general_article: #1932 - Table &#039;vvgnli_db.general_article&#039; doesn&#039;t exist in engine
-- Error reading data for table vvgnli_db.general_article: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `vvgnli_db`.`general_article`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `general_customer`
--
-- Error reading structure for table vvgnli_db.general_customer: #1932 - Table &#039;vvgnli_db.general_customer&#039; doesn&#039;t exist in engine
-- Error reading data for table vvgnli_db.general_customer: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `vvgnli_db`.`general_customer`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `general_faq`
--

CREATE TABLE `general_faq` (
  `general_faq_Id` int(11) NOT NULL,
  `general_user_Id` int(11) NOT NULL,
  `faq_question` varchar(255) NOT NULL,
  `faq_answer` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `udpated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `general_language`
--

CREATE TABLE `general_language` (
  `general_language_Id` int(11) NOT NULL,
  `general_language_name` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `general_platform_review`
--

CREATE TABLE `general_platform_review` (
  `general_platform_Id` int(11) NOT NULL,
  `general_user_Id` int(11) NOT NULL,
  `review_body` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article_comments`
--
ALTER TABLE `article_comments`
  ADD PRIMARY KEY (`article_comment_Id`),
  ADD UNIQUE KEY `general_article_Id` (`general_article_Id`),
  ADD UNIQUE KEY `general_user_Id` (`general_user_Id`);

--
-- Indexes for table `article_likes`
--
ALTER TABLE `article_likes`
  ADD PRIMARY KEY (`article_likes_Id`),
  ADD UNIQUE KEY `general_article_Id` (`general_article_Id`),
  ADD UNIQUE KEY `general_user_Id` (`general_user_Id`);

--
-- Indexes for table `general_faq`
--
ALTER TABLE `general_faq`
  ADD PRIMARY KEY (`general_faq_Id`),
  ADD UNIQUE KEY `general_user_Id` (`general_user_Id`);

--
-- Indexes for table `general_language`
--
ALTER TABLE `general_language`
  ADD PRIMARY KEY (`general_language_Id`);

--
-- Indexes for table `general_platform_review`
--
ALTER TABLE `general_platform_review`
  ADD PRIMARY KEY (`general_platform_Id`),
  ADD UNIQUE KEY `general_user_Id` (`general_user_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article_comments`
--
ALTER TABLE `article_comments`
  MODIFY `article_comment_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `article_likes`
--
ALTER TABLE `article_likes`
  MODIFY `article_likes_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_faq`
--
ALTER TABLE `general_faq`
  MODIFY `general_faq_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_language`
--
ALTER TABLE `general_language`
  MODIFY `general_language_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_platform_review`
--
ALTER TABLE `general_platform_review`
  MODIFY `general_platform_Id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;



ALTER TABLE `vgnli_db`.`general_customer` 
ADD COLUMN `general_customer_password` VARCHAR(45) NOT NULL AFTER `general_password_verification_code`;


INSERT INTO `vgnli_db`.`general_language` (`general_language_name`) VALUES ('English');
INSERT INTO `vgnli_db`.`general_language` (`general_language_name`) VALUES ('Hindi');
INSERT INTO `vgnli_db`.`general_language` (`general_language_name`) VALUES ('Bengali');
INSERT INTO `vgnli_db`.`general_language` (`general_language_name`) VALUES ('Marathi');
INSERT INTO `vgnli_db`.`general_language` (`general_language_name`) VALUES ('Punjabi');

ALTER TABLE `vgnli_db`.`general_customer` 
CHANGE COLUMN `general_customer_password` `general_customer_password` VARCHAR(255) NOT NULL ;

ALTER TABLE `vgnli_db`.`general_customer` 
CHANGE COLUMN `general_user_mobile` `general_user_mobile` VARCHAR(255) NULL DEFAULT NULL ,
CHANGE COLUMN `general_user_dob` `general_user_dob` VARCHAR(255) NOT NULL ;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



-- Last update by Ayyan on 17-08-22 at 05:13 pm as the first commit 