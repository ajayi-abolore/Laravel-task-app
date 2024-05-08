-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 06, 2024 at 08:45 PM
-- Server version: 8.0.30
-- PHP Version: 8.2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tasks_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

 
 

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('092d93aba9279e72de4b61f769056550c2f9e808514e4ac5f72592da9b42e6feff72505a05b4694e', 1, 3, 'authToken', '[]', 0, '2024-05-06 19:10:37', '2024-05-06 19:10:37', '2025-05-06 20:10:37'),
('0f00660411acf85509e2dec63aab71acab332bb2d668c9214a2401a234cb4f1b26b2d8c93831fe57', 4, 3, 'authToken', '[]', 0, '2024-05-06 19:36:25', '2024-05-06 19:36:25', '2025-05-06 20:36:25'),
('272e2a35355fcdc6b96f51c10e6f6f09c0b01104cdc4d2afcfa44fb538482a8e0188ae5c6dfb0a0a', 1, 3, 'authToken', '[]', 0, '2024-05-06 19:31:52', '2024-05-06 19:31:52', '2025-05-06 20:31:52'),
('4b10b097fdc60503ff6b1af4361c735d64b622b8ea0e55156736a404b6a26ba21f231c9b74813686', 2, 3, 'authToken', '[]', 0, '2024-05-06 19:04:10', '2024-05-06 19:04:10', '2025-05-06 20:04:10'),
('774f7a569940113e3996e08f291cf88d9fd76ef59c7f7c9e7d61ee45ed0afe111394d15c42e04e39', 2, 3, 'authToken', '[]', 0, '2024-05-06 19:09:53', '2024-05-06 19:09:53', '2025-05-06 20:09:53'),
('89121e0f29fa5835a2a8680df987b63603e550dd8d2b44f8222ddf87c5e0c0fb2245843c6556e0a9', 2, 1, 'authToken', '[]', 0, '2024-05-06 19:00:08', '2024-05-06 19:00:08', '2025-05-06 20:00:08'),
('a87e33cf8213fe1cc241f7bb42eb78ca4e65a098d4b63845466051f85610462e249744e0ad8d0cba', 1, 3, 'authToken', '[]', 0, '2024-05-06 19:44:03', '2024-05-06 19:44:03', '2025-05-06 20:44:03'),
('aac71b8c32a36dd18ecd28f30ea9aa0a3cf514423c8c3eff0151ad1bfb8d33a7509e77f229c8bee1', 1, 3, 'authToken', '[]', 0, '2024-05-06 19:26:39', '2024-05-06 19:26:39', '2025-05-06 20:26:39'),
('b32a4bba31acf1fa7016276ff53afb3493fe611037ae3212391abc667662ad83683f25fd6790146e', 2, 1, 'authToken', '[]', 0, '2024-05-06 18:58:47', '2024-05-06 18:58:47', '2025-05-06 19:58:47'),
('b8224d7a8d81b1d2a369342a8515c5c74d303c5448a4ef39ccb819e1f3eea1b58eced9c33562e6b8', 3, 3, 'authToken', '[]', 0, '2024-05-06 19:17:33', '2024-05-06 19:17:33', '2025-05-06 20:17:33'),
('bbe60f906a7bde90eba789a3bb2e37fb0a1e1556498c6fe2f581af7a6f1f360f82d21b8d791361f0', 1, 3, 'authToken', '[]', 0, '2024-05-06 19:18:14', '2024-05-06 19:18:14', '2025-05-06 20:18:14'),
('e4d7cf7e8bea050d81d881ae7f136d98797f366b5b9e72c804447b8a21bc1027a8674c37e2160132', 1, 1, 'authToken', '[]', 0, '2024-05-06 18:57:36', '2024-05-06 18:57:37', '2025-05-06 19:57:36'),
('fc8af5eac449453b1899be4ac51da3a7adf2b15b3cda6b4485a99fd466ca03f43cfaa61a8da571e1', 4, 3, 'authToken', '[]', 0, '2024-05-06 19:34:53', '2024-05-06 19:34:53', '2025-05-06 20:34:53');

-- --------------------------------------------------------

 

 
--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Task_App Personal Access Client', 'Sm2XwqgGwY4cSvYe1cn6PztqP04O7gqGyTXd1APp', NULL, 'http://localhost', 1, 0, 0, '2024-05-06 18:56:32', '2024-05-06 18:56:32'),
(2, NULL, 'Task_App Password Grant Client', 'LOZPULYDzpCR3ssRE4xaALrYamUVfk3Kl4xpnCL4', 'users', 'http://localhost', 0, 1, 0, '2024-05-06 18:56:32', '2024-05-06 18:56:32'),
(3, NULL, 'Task_App Personal Access Client', 'SkSk8VTiqARoekWR0JEgEjy88xXTheDNnIabtk6t', NULL, 'http://localhost', 1, 0, 0, '2024-05-06 19:03:59', '2024-05-06 19:03:59'),
(4, NULL, 'Task_App Password Grant Client', 'MiBph113q86y6D8CMpFqIPH6eWCMbU5V7S0X8B4U', 'users', 'http://localhost', 0, 1, 0, '2024-05-06 19:03:59', '2024-05-06 19:03:59');

-- --------------------------------------------------------

 
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-05-06 18:56:32', '2024-05-06 18:56:32'),
(2, 3, '2024-05-06 19:03:59', '2024-05-06 19:03:59');

-- --------------------------------------------------------

 
 

 
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`permission_id`, `permission`, `role_id`) VALUES
(1, 'home/index', 1),
(2, 'account/index', 1),
(3, 'account/edit', 1),
(4, 'tasks/view', 1),
(5, 'tasks/add', 1),
(6, 'tasks/edit', 1),
(7, 'tasks/delete', 1),
(8, 'tasks/importdata', 1),
(9, 'users/view', 1),
(10, 'users/add', 1),
(11, 'users/edit', 1),
(12, 'users/delete', 1),
(13, 'users/importdata', 1),
(14, 'tasks/index', 1),
(15, 'users/index', 1),
(16, 'home/index', 2),
(17, 'account/index', 2),
(18, 'account/edit', 2),
(19, 'tasks/index', 2),
(20, 'users/index', 2);

-- --------------------------------------------------------
 

 
--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(1, 'Admin'),
(2, 'User');

-- --------------------------------------------------------

 
--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `due_date`, `due_time`, `status`, `created_at`, `updated_at`, `files`, `assign_to`) VALUES
(1, 'AAP Assignment', 'to create landing page', '2024-05-07', NULL, 'pending', '2024-05-06 18:35:34', '2024-05-06 18:35:34', NULL, 1),
(2, 'Ogitech DB backup', 'to back up ogitech backend and fronend', '2024-05-06', '20:50:49', 'pending', '2024-05-06 18:52:23', '2024-05-06 19:42:58', NULL, 2),
(3, 'Visit Landmark Mall', 'buy food stuff', '2024-05-08', '21:14:46', 'pending', '2024-05-06 19:15:49', '2024-05-06 19:43:03', 'uploads/files/9fe0995c-309a-435d-9ccc-7596cbfe9d60.png,uploads/files/28c2adfc-41cf-422a-bf7e-31762a18d527.png', 2),
(4, 'To create task app', 'my assignment', '2024-05-07', '17:18:25', 'pending', '2024-05-06 19:19:12', '2024-05-06 19:43:08', 'uploads/files/fcbe6aa9-b095-43ee-a93f-86291ec9fe6f.png', 3),
(5, 'Lorem quam magnam se', 'Molestias quia modi', '2024-05-08', '19:48:16', 'pending', '2024-05-06 19:48:46', '2024-05-06 19:48:46', NULL, 3),
(6, 'Ex et quod sed repre', 'Praesentium excepteu', '2024-05-06', '19:49:00', 'pending', '2024-05-06 19:49:13', '2024-05-06 19:49:13', NULL, 3),
(7, 'Ad dicta voluptas in', 'Aspernatur saepe ape', '2024-05-06', '19:49:15', 'pending', '2024-05-06 19:49:29', '2024-05-06 19:49:29', NULL, 1),
(8, 'Nisi tempor aliquid', 'Doloremque ut fugiat', '2024-05-05', '19:49:36', 'pending', '2024-05-06 19:49:51', '2024-05-06 19:49:51', NULL, 3),
(9, 'Deleniti voluptatibu', 'Architecto laudantiu', '2024-05-07', '19:49:54', 'pending', '2024-05-06 19:50:04', '2024-05-06 19:50:04', NULL, 3),
(10, 'Deleniti dolore numq', 'Aliqua Nihil sit e', '2024-05-08', '19:50:10', 'pending', '2024-05-06 19:50:23', '2024-05-06 19:50:23', NULL, 1),
(11, 'Aute proident atque', 'Quo enim commodi sin', '2024-05-06', '19:50:32', 'completed', '2024-05-06 19:50:43', '2024-05-06 19:50:43', NULL, 1),
(12, 'Non quaerat nobis su', 'Et minus quas quaera', '2024-05-06', '19:51:11', 'pending', '2024-05-06 19:51:21', '2024-05-06 19:51:21', NULL, 1),
(13, 'Autem ut dolores eiu', 'Dicta deserunt ut ir', '2024-05-07', '19:51:28', 'pending', '2024-05-06 19:51:38', '2024-05-06 19:51:38', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--
 
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `is_active`, `created_at`, `updated_at`, `user_type`, `user_role_id`) VALUES
(1, 'AJAYI ABOLORE', 'abolorea@gmail.com', '$2y$10$13h3KtOjm2RGuPYAbXIoYePT0hH9k2iNYSBidaORgkZv8RH37ZrCW', 'yes', '2024-05-06 18:57:36', '2024-05-06 19:10:11', 'admin', 1),
(2, 'micheal', 'mike@gmail.com', '$2y$10$7f3cFeMLOtoeNdCwtfIYbu176iQOxE126IFq37U.wAN2yKKJ9Ilfy', 'yes', '2024-05-06 18:58:47', '2024-05-06 19:09:30', 'normal', 2),
(3, 'ayo', 'ayo@gmail.com', '$2y$10$Wzg6YpJQmBlp0Pc53gj2EOOjVFWZIe6.0kt4gc73wtsRlyzI5xy12', 'yes', '2024-05-06 19:17:32', '2024-05-06 19:17:32', 'normal', 2),
(4, 'tope', 'tope@gmail.com', '$2y$10$S.HLNp.375xnk5PkxygSAuJu4/h4/xqHFXCHEbmfJv08g/H7PKUMi', 'yes', '2024-05-06 19:34:53', '2024-05-06 19:34:53', 'normal', 2);

--
-- Indexes for dumped tables
-- 
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
