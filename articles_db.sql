-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 05, 2023 at 03:56 PM
-- Server version: 8.0.32-0ubuntu0.22.04.2
-- PHP Version: 8.1.2-1ubuntu2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `articles_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int NOT NULL,
  `heading` varchar(255) NOT NULL,
  `readTime` int NOT NULL,
  `description` text NOT NULL,
  `categories` text,
  `thumbnailImage` varchar(255) NOT NULL,
  `featuredImage` varchar(255) NOT NULL,
  `verified` tinyint(1) DEFAULT '0',
  `newest` tinyint(1) DEFAULT '0',
  `trending` tinyint(1) DEFAULT '0',
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `heading`, `readTime`, `description`, `categories`, `thumbnailImage`, `featuredImage`, `verified`, `newest`, `trending`, `createdAt`, `updatedAt`) VALUES
(1, 'Heading 1', 20230405, 'Description 1', 'Sports', 'https://images.indianexpress.com/2023/04/Untitled-design-3-2.jpg?w=900', 'https://images.indianexpress.com/2023/04/Untitled-design-2023-04-05T102051.592.jpg?w=316', NULL, NULL, NULL, '2023-04-05 06:41:10', '2023-04-05 06:41:10'),
(2, 'Heading 1', 20230405, 'Description 1', 'Sports', 'https://images.indianexpress.com/2023/04/Untitled-design-3-2.jpg?w=900', 'https://images.indianexpress.com/2023/04/Untitled-design-2023-04-05T102051.592.jpg?w=316', NULL, NULL, NULL, '2023-04-05 06:42:09', '2023-04-05 06:42:09'),
(3, 'Heading 1', 20230405, 'Description 1', 'Sports', 'https://images.indianexpress.com/2023/04/Untitled-design-3-2.jpg?w=900', 'https://images.indianexpress.com/2023/04/Untitled-design-2023-04-05T102051.592.jpg?w=316', 1, 1, 1, '2023-04-05 06:43:23', '2023-04-05 06:43:23'),
(4, 'Heading 1', 20230405, 'Description 1', '[]', 'https://images.indianexpress.com/2023/04/Untitled-design-3-2.jpg?w=900', 'https://images.indianexpress.com/2023/04/Untitled-design-2023-04-05T102051.592.jpg?w=316', 1, 1, 1, '2023-04-05 07:01:56', '2023-04-05 07:01:56'),
(7, 'Heading 1', 20230405, 'Description 1', '[\"arts\"]', 'https://images.indianexpress.com/2023/04/Untitled-design-3-2.jpg?w=900', 'https://images.indianexpress.com/2023/04/Untitled-design-2023-04-05T102051.592.jpg?w=316', 1, 1, 1, '2023-04-05 10:06:13', '2023-04-05 10:06:13');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `category` varchar(255) NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `createdAt`, `updatedAt`) VALUES
(1, 'sports', '2023-04-05 07:17:56', '2023-04-05 07:17:56'),
(2, 'Critic', '2023-04-05 07:18:07', '2023-04-05 07:18:07'),
(3, 'Social', '2023-04-05 07:18:18', '2023-04-05 07:18:18'),
(4, 'reviews', '2023-04-05 07:19:17', '2023-04-05 07:19:17'),
(5, 'advertisements', '2023-04-05 07:19:25', '2023-04-05 07:19:25'),
(6, 'Sports', '2023-04-05 10:05:07', '2023-04-05 10:05:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
