-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 16 مارس 2026 الساعة 12:09
-- إصدار الخادم: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smartplan_ai`
--

-- --------------------------------------------------------

--
-- بنية الجدول `designs`
--

CREATE TABLE `designs` (
  `design_id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `design_image` varchar(255) DEFAULT NULL,
  `space_score` int(11) DEFAULT NULL,
  `lighting_score` int(11) DEFAULT NULL,
  `circulation_score` int(11) DEFAULT NULL,
  `budget_score` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `designs`
--

INSERT INTO `designs` (`design_id`, `project_id`, `design_image`, `space_score`, `lighting_score`, `circulation_score`, `budget_score`, `created_at`) VALUES
(1, 1, '/designs/design1.png', 85, 90, 80, 75, '2026-03-16 10:55:57'),
(2, 1, '/designs/design2.png', 88, 85, 82, 78, '2026-03-16 10:55:57'),
(3, 2, '/designs/office_design.png', 92, 87, 90, 80, '2026-03-16 10:55:57'),
(4, 4, '/designs/kitchen_design1.png', 80, 85, 78, 82, '2026-03-16 11:03:23'),
(5, 4, '/designs/kitchen_design2.png', 84, 88, 80, 79, '2026-03-16 11:03:23'),
(6, 5, '/designs/bedroom_design.png', 90, 87, 85, 88, '2026-03-16 11:03:23'),
(7, 6, '/designs/studio_design.png', 86, 82, 84, 80, '2026-03-16 11:03:23'),
(8, 7, '/designs/cafe_design.png', 91, 89, 90, 85, '2026-03-16 11:03:23'),
(9, 8, '/designs/restaurant_design.png', 93, 90, 88, 87, '2026-03-16 11:03:23'),
(10, 9, '/designs/kidsroom_design.png', 88, 86, 82, 84, '2026-03-16 11:03:23'),
(11, 10, '/designs/garden_design.png', 87, 83, 80, 81, '2026-03-16 11:03:23');

-- --------------------------------------------------------

--
-- بنية الجدول `jobs`
--

CREATE TABLE `jobs` (
  `job_id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `error_message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `jobs`
--

INSERT INTO `jobs` (`job_id`, `project_id`, `status`, `error_message`, `created_at`) VALUES
(1, 1, 'completed', NULL, '2026-03-16 10:55:30'),
(2, 2, 'processing', NULL, '2026-03-16 10:55:30'),
(3, 3, 'failed', 'AI processing error', '2026-03-16 10:55:30'),
(4, 4, 'completed', NULL, '2026-03-16 11:03:09'),
(5, 5, 'processing', NULL, '2026-03-16 11:03:09'),
(6, 6, 'completed', NULL, '2026-03-16 11:03:09'),
(7, 7, 'completed', NULL, '2026-03-16 11:03:09'),
(8, 8, 'failed', 'Lighting analysis error', '2026-03-16 11:03:09'),
(9, 9, 'processing', NULL, '2026-03-16 11:03:09'),
(10, 10, 'completed', NULL, '2026-03-16 11:03:09');

-- --------------------------------------------------------

--
-- بنية الجدول `preferences`
--

CREATE TABLE `preferences` (
  `preference_id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `style` varchar(50) DEFAULT NULL,
  `budget` int(11) DEFAULT NULL,
  `color_theme` varchar(50) DEFAULT NULL,
  `room_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `preferences`
--

INSERT INTO `preferences` (`preference_id`, `project_id`, `style`, `budget`, `color_theme`, `room_type`) VALUES
(1, 1, 'Modern', 5000, 'White & Gray', 'Apartment'),
(2, 2, 'Minimal', 8000, 'Black & White', 'Office'),
(3, 3, 'Luxury', 12000, 'Gold & Cream', 'Living Room'),
(4, 4, 'Modern', 6000, 'Blue & White', 'Kitchen'),
(5, 5, 'Minimal', 4000, 'Gray', 'Bedroom'),
(6, 6, 'Scandinavian', 7000, 'Wood & White', 'Studio'),
(7, 7, 'Industrial', 15000, 'Black & Brown', 'Cafe'),
(8, 8, 'Luxury', 20000, 'Gold & Black', 'Restaurant'),
(9, 9, 'Playful', 3000, 'Bright Colors', 'Kids Room'),
(10, 10, 'Nature', 5000, 'Green', 'Garden');

-- --------------------------------------------------------

--
-- بنية الجدول `projects`
--

CREATE TABLE `projects` (
  `project_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `project_name` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `projects`
--

INSERT INTO `projects` (`project_id`, `user_id`, `project_name`, `description`, `created_at`) VALUES
(1, 1, 'Apartment Design', 'Small apartment layout', '2026-03-16 10:53:52'),
(2, 2, 'Office Space', 'Modern office planning', '2026-03-16 10:53:52'),
(3, 1, 'Living Room Plan', 'Living room redesign', '2026-03-16 10:53:52'),
(4, 2, 'Kitchen Design', 'Modern kitchen layout', '2026-03-16 11:02:14'),
(5, 3, 'Bedroom Layout', 'Minimal bedroom plan', '2026-03-16 11:02:14'),
(6, 4, 'Studio Apartment', 'Small studio optimization', '2026-03-16 11:02:14'),
(7, 5, 'Cafe Interior', 'Coffee shop planning', '2026-03-16 11:02:14'),
(8, 6, 'Restaurant Hall', 'Restaurant seating plan', '2026-03-16 11:02:14'),
(9, 7, 'Kids Room', 'Colorful kids bedroom', '2026-03-16 11:02:14'),
(10, 8, 'Garden Space', 'Outdoor garden planning', '2026-03-16 11:02:14');

-- --------------------------------------------------------

--
-- بنية الجدول `saved_designs`
--

CREATE TABLE `saved_designs` (
  `save_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `design_id` int(11) DEFAULT NULL,
  `saved_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `saved_designs`
--

INSERT INTO `saved_designs` (`save_id`, `user_id`, `design_id`, `saved_at`) VALUES
(1, 1, 1, '2026-03-16 10:56:32'),
(2, 2, 3, '2026-03-16 10:56:32'),
(3, 1, 2, '2026-03-16 10:56:32'),
(4, 3, 4, '2026-03-16 11:03:35'),
(5, 4, 5, '2026-03-16 11:03:35'),
(6, 5, 6, '2026-03-16 11:03:35'),
(7, 6, 7, '2026-03-16 11:03:35'),
(8, 7, 8, '2026-03-16 11:03:35'),
(9, 8, 9, '2026-03-16 11:03:35'),
(10, 2, 10, '2026-03-16 11:03:35');

-- --------------------------------------------------------

--
-- بنية الجدول `uploads`
--

CREATE TABLE `uploads` (
  `upload_id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(50) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `uploads`
--

INSERT INTO `uploads` (`upload_id`, `project_id`, `file_name`, `file_type`, `file_path`, `uploaded_at`) VALUES
(1, 1, 'floorplan1.pdf', 'pdf', '/uploads/floorplan1.pdf', '2026-03-16 10:54:52'),
(2, 2, 'office_layout.jpg', 'image', '/uploads/office_layout.jpg', '2026-03-16 10:54:52'),
(3, 3, 'livingroom.png', 'image', '/uploads/livingroom.png', '2026-03-16 10:54:52'),
(4, 4, 'kitchen_plan.pdf', 'pdf', '/uploads/kitchen_plan.pdf', '2026-03-16 11:02:54'),
(5, 5, 'bedroom_layout.jpg', 'image', '/uploads/bedroom_layout.jpg', '2026-03-16 11:02:54'),
(6, 6, 'studio_blueprint.png', 'image', '/uploads/studio_blueprint.png', '2026-03-16 11:02:54'),
(7, 7, 'cafe_plan.pdf', 'pdf', '/uploads/cafe_plan.pdf', '2026-03-16 11:02:54'),
(8, 8, 'restaurant_layout.jpg', 'image', '/uploads/restaurant_layout.jpg', '2026-03-16 11:02:54'),
(9, 9, 'kidsroom_plan.png', 'image', '/uploads/kidsroom_plan.png', '2026-03-16 11:02:54'),
(10, 10, 'garden_design.jpg', 'image', '/uploads/garden_design.jpg', '2026-03-16 11:02:54');

-- --------------------------------------------------------

--
-- بنية الجدول `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'Ahmad Ali', 'ahmad@mail.com', '123456', 'user', '2026-03-16 10:53:17'),
(2, 'Lina Sami', 'lina@mail.com', '123456', 'user', '2026-03-16 10:53:17'),
(3, 'Omar Khaled', 'omar@mail.com', '123456', 'designer', '2026-03-16 10:53:17'),
(4, 'Admin', 'admin@mail.com', '123456', 'admin', '2026-03-16 10:53:17'),
(5, 'Sara Nabil', 'sara@mail.com', '123456', 'user', '2026-03-16 11:01:56'),
(6, 'Khaled Hassan', 'khaled@mail.com', '123456', 'user', '2026-03-16 11:01:56'),
(7, 'Maya Adel', 'maya@mail.com', '123456', 'designer', '2026-03-16 11:01:56'),
(8, 'Yousef Tarek', 'yousef@mail.com', '123456', 'user', '2026-03-16 11:01:56'),
(9, 'Rana Samer', 'rana@mail.com', '123456', 'user', '2026-03-16 11:01:56'),
(10, 'Hadi Karim', 'hadi@mail.com', '123456', 'designer', '2026-03-16 11:01:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `designs`
--
ALTER TABLE `designs`
  ADD PRIMARY KEY (`design_id`),
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`job_id`),
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `preferences`
--
ALTER TABLE `preferences`
  ADD PRIMARY KEY (`preference_id`),
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`project_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `saved_designs`
--
ALTER TABLE `saved_designs`
  ADD PRIMARY KEY (`save_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `design_id` (`design_id`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`upload_id`),
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `designs`
--
ALTER TABLE `designs`
  MODIFY `design_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `preferences`
--
ALTER TABLE `preferences`
  MODIFY `preference_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `saved_designs`
--
ALTER TABLE `saved_designs`
  MODIFY `save_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `upload_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- قيود الجداول المُلقاة.
--

--
-- قيود الجداول `designs`
--
ALTER TABLE `designs`
  ADD CONSTRAINT `designs_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`);

--
-- قيود الجداول `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `jobs_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`);

--
-- قيود الجداول `preferences`
--
ALTER TABLE `preferences`
  ADD CONSTRAINT `preferences_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`);

--
-- قيود الجداول `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- قيود الجداول `saved_designs`
--
ALTER TABLE `saved_designs`
  ADD CONSTRAINT `saved_designs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `saved_designs_ibfk_2` FOREIGN KEY (`design_id`) REFERENCES `designs` (`design_id`);

--
-- قيود الجداول `uploads`
--
ALTER TABLE `uploads`
  ADD CONSTRAINT `uploads_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
