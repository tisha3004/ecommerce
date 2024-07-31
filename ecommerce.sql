-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2024 at 07:33 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Upgrade Your Wardrobe: Fashion Finds Await!', 'lorem-ipsum-is', '/storage/photos/1/slider-1.jpg', '<h2><span style=\"font-weight: bold; color: rgb(99, 99, 99);\">Get Up to 10% on your every purchase!</span></h2>', 'active', '2020-08-14 01:47:38', '2023-11-22 17:15:21'),
(2, 'Staycation Essentials: Create Your Haven!', 'lorem-ipsum', '/storage/photos/1/banner-07.jpg', '<p>Get Up to 35% OFF</p>', 'active', '2020-08-14 01:50:23', '2023-11-22 17:23:12'),
(4, 'Exclusive Online Offers', 'banner', '/storage/photos/1/banner-06.jpg', '<span style=\"color: rgb(15, 15, 15); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; white-space-collapse: preserve;\">Online Offers: Yours to Discover!</span><br>', 'active', '2020-08-17 20:46:59', '2023-11-22 17:23:59');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Adidas', 'adidas', 'active', '2020-08-14 04:23:00', '2020-08-14 04:23:00'),
(2, 'Nike', 'nike', 'active', '2020-08-14 04:23:08', '2020-08-14 04:23:08'),
(3, 'Kappa', 'kappa', 'active', '2020-08-14 04:23:48', '2020-08-14 04:23:48'),
(4, 'Prada', 'prada', 'active', '2020-08-14 04:24:08', '2020-08-14 04:24:08'),
(6, 'Brand', 'brand', 'active', '2020-08-17 20:50:31', '2020-08-17 20:50:31'),
(7, 'Other', 'other', 'active', '2023-11-26 14:44:56', '2023-11-26 14:44:56'),
(8, 'Realme', 'realme', 'active', NULL, NULL),
(9, 'Voltas', 'new-voltas', 'active', NULL, NULL),
(10, 'Boat', 'new-boat-buds', 'active', NULL, NULL),
(11, 'Vivo', 'vivo', 'active', NULL, NULL),
(12, 'Samsung', 'samsung', 'active', '2024-06-28 08:43:44', NULL),
(13, 'LG', 'lg', 'active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('admin@gmail.com|127.0.0.1', 'i:2;', 1719912605),
('admin@gmail.com|127.0.0.1:timer', 'i:1719912605;', 1719912605);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double NOT NULL,
  `status` enum('new','progress','delivered','cancel') NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(9, 14, 2, 3, 63, 'new', 1, 70, '2024-06-27 05:59:08', '2024-06-27 06:41:35'),
(10, 14, 3, 3, 63, 'new', 1, 63, '2024-06-27 06:50:54', '2024-06-27 06:51:49'),
(11, 19, NULL, 3, 9500, 'new', 1, 9500, '2024-06-28 01:55:16', '2024-06-28 01:59:52'),
(12, 15, 5, 3, 24000, 'new', 1, 24000, '2024-06-28 06:55:18', '2024-06-28 06:56:05'),
(15, 47, 9, 5, 760, 'new', 1, 800, '2024-07-10 03:32:15', '2024-07-10 03:56:57'),
(16, 17, 9, 5, 1800, 'new', 1, 1800, '2024-07-10 03:45:16', '2024-07-10 03:56:57'),
(17, 47, 10, 5, 760, 'new', 1, 760, '2024-07-10 03:57:20', '2024-07-10 04:00:22'),
(19, 47, 11, 5, 760, 'new', 1, 800, '2024-07-10 04:33:24', '2024-07-10 04:34:46'),
(20, 42, 12, 5, 1164, 'new', 1, 1164, '2024-07-10 04:37:02', '2024-07-10 04:38:31'),
(21, 45, 13, 5, 1000, 'new', 1, 1000, '2024-07-10 04:59:14', '2024-07-10 05:00:00'),
(22, 42, 14, 5, 1164, 'new', 1, 1164, '2024-07-10 05:01:06', '2024-07-10 05:02:33'),
(23, 42, 15, 5, 1164, 'new', 1, 1164, '2024-07-10 05:08:31', '2024-07-10 05:12:45'),
(24, 19, 16, 5, 9500, 'new', 1, 10000, '2024-07-10 05:14:40', '2024-07-10 05:15:26'),
(25, 45, 17, 5, 1000, 'new', 1, 1000, '2024-07-10 05:16:18', '2024-07-10 05:16:33'),
(26, 39, 18, 5, 1900, 'new', 1, 1900, '2024-07-10 05:22:23', '2024-07-10 05:22:34'),
(27, 39, 19, 5, 1900, 'new', 1, 1900, '2024-07-10 05:23:18', '2024-07-10 05:23:29'),
(28, 45, 20, 5, 1000, 'new', 1, 1000, '2024-07-10 05:26:35', '2024-07-10 05:26:47'),
(29, 41, 21, 5, 900, 'new', 1, 900, '2024-07-10 05:30:42', '2024-07-10 05:30:59'),
(30, 25, 22, 5, 285, 'new', 1, 285, '2024-07-10 05:32:57', '2024-07-10 05:33:08'),
(31, 27, 23, 5, 495, 'new', 1, 495, '2024-07-10 05:49:27', '2024-07-10 05:49:40'),
(32, 46, 24, 5, 970, 'new', 1, 970, '2024-07-10 06:47:16', '2024-07-10 06:50:02'),
(33, 27, 24, 5, 495, 'new', 1, 495, '2024-07-10 06:47:54', '2024-07-10 06:50:02');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `summary` text DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT 1,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Men\'s Fashion', 'mens-fashion', NULL, '/storage/photos/1/mini-banner1.jpg', 1, NULL, NULL, 'active', '2020-08-14 04:26:15', '2022-11-27 12:15:13'),
(2, 'Women\'s Fashion', 'womens-fashion', NULL, '/storage/photos/1/mini-banner2.jpg', 1, NULL, NULL, 'active', '2020-08-14 04:26:40', '2022-11-27 12:15:32'),
(3, 'Kid\'s', 'kids', NULL, '/storage/photos/1/mini-banner3.jpg', 1, NULL, NULL, 'active', '2020-08-14 04:27:10', '2022-11-27 12:15:49'),
(4, 'T-shirt\'s', 't-shirts', NULL, NULL, 0, 1, NULL, 'active', '2020-08-14 04:32:14', '2020-08-14 04:32:14'),
(5, 'Jeans pants', 'jeans-pants', NULL, NULL, 0, 1, NULL, 'active', '2020-08-14 04:32:49', '2020-08-14 04:32:49'),
(6, 'Sweater & Jackets', 'sweater-jackets', NULL, NULL, 0, 1, NULL, 'active', '2020-08-14 04:33:37', '2020-08-14 04:33:37'),
(7, 'Rain Coats & Trenches', 'rain-coats-trenches', NULL, NULL, 0, 1, NULL, 'active', '2020-08-14 04:34:04', '2020-08-14 04:34:04'),
(8, 'Dress', 'dress', NULL, NULL, 0, 2, NULL, 'active', '2023-11-26 14:59:14', '2023-11-26 14:59:14'),
(9, 'Hoodies and Sweatshirts', 'hoodies-and-sweatshirts', NULL, NULL, 0, 2, NULL, 'active', '2023-11-26 15:04:36', '2023-11-26 15:04:36'),
(10, 'Tops and Tshirt', 'tops-and-tshirt', NULL, NULL, 0, 2, NULL, 'active', '2023-11-26 15:04:52', '2023-11-26 15:04:52'),
(11, 'Pants', 'pants', NULL, NULL, 0, 2, NULL, 'active', '2023-11-26 15:05:14', '2023-11-26 15:05:14'),
(12, 'Shoes', 'shoes', NULL, NULL, 0, 1, NULL, 'active', '2023-11-28 21:19:07', '2023-11-28 21:19:07'),
(13, 'Cardigans', 'cardigans', NULL, NULL, 0, 2, NULL, 'active', '2023-11-29 15:04:54', '2023-11-29 15:04:54'),
(14, 'AC', 'new-ac', NULL, '/storage/photos/1/AC/AC(1).png', 1, NULL, NULL, 'active', NULL, NULL),
(16, 'Buds', 'new-buds', NULL, '/storage/photos/1/Buds/buds(1).png', 1, NULL, NULL, 'active', NULL, NULL),
(17, 'Oven', 'new-oven', NULL, '/storage/photos/1/Oven/oven(1).png', 1, NULL, NULL, 'active', NULL, NULL),
(18, 'Phone', 'smart-phone', NULL, '/storage/photos/1/Phone/phone(1).png', 1, NULL, NULL, 'active', NULL, NULL),
(19, 'Smart Watch', 'smart-watch', NULL, '/storage/photos/1/Smart  watch/SW(1).png', 1, NULL, NULL, 'active', NULL, NULL),
(20, 'Speaker', 'new-speaker', NULL, '/storage/photos/1/Speaker/s1(1).png', 1, NULL, NULL, 'active', NULL, NULL),
(21, 'Washing Machine', 'washing-machine', NULL, '/storage/photos/1/Washing Machine/WM1(1).png', 1, NULL, NULL, 'active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `type` enum('fixed','percent') NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'LKPL690', 'fixed', 30.00, 'inactive', NULL, '2023-11-27 18:40:23'),
(2, '111111', 'percent', 10.00, 'active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `message` longtext NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `subject`, `email`, `photo`, `phone`, `message`, `read_at`, `created_at`, `updated_at`) VALUES
(1, 'Tisha', 'ksfvnd', 'mehtatisha35@gmail.com', NULL, '8866563459', 'zXdfvb sawklkjh efdgrt klwqskaj wla;l', NULL, '2024-06-26 07:48:04', '2024-06-26 07:48:04'),
(2, 'smbjds', 'bewjm', 'abc@gmail.com', NULL, '947032355423', 'fdnbzjbjkbcdxkb fhwjvbsdm ejfdbs kj', NULL, '2024-07-10 03:39:16', '2024-07-10 03:39:16');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('04a9b33a-7b70-42ae-9ea7-45918ed200c3', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/3\",\"fas\":\"fa-file-alt\"}', NULL, '2023-11-27 12:58:24', '2023-11-27 12:58:24'),
('15fbc0e9-44e4-403f-8fbf-aa45667bee46', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/mens-carnaby-evo-tri1-sma-trainers\",\"fas\":\"fa-star\"}', NULL, '2023-11-28 21:58:53', '2023-11-28 21:58:53'),
('18365bcb-3478-43f4-8f86-d3b84bf06557', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/2\",\"fas\":\"fa-file-alt\"}', NULL, '2023-11-26 16:48:51', '2023-11-26 16:48:51'),
('1a8549ef-109a-4e2d-8c2b-7b55baa7287a', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/womens-breton-stripes-sleeveless-v-neck-stretch-cotton-polo-dress\",\"fas\":\"fa-star\"}', NULL, '2023-11-28 22:01:51', '2023-11-28 22:01:51'),
('2145a8e3-687d-444a-8873-b3b2fb77a342', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-15 07:31:21', '2020-08-15 07:31:21'),
('2689e352-a41a-4d13-989c-0e48aa2cf15c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/mens-relaxed-fit\",\"fas\":\"fa-star\"}', NULL, '2023-11-27 13:37:49', '2023-11-27 13:37:49'),
('32eafa9c-f8e7-4228-b59a-edb6da181c93', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/womens-casual-pants-high-waist-business-casual-ankle-pants\",\"fas\":\"fa-star\"}', NULL, '2023-11-27 13:31:22', '2023-11-27 13:31:22'),
('3a65729c-5dce-422c-82bb-67fe66b553b4', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/4\",\"fas\":\"fa-file-alt\"}', NULL, '2023-11-27 15:20:07', '2023-11-27 15:20:07'),
('3af39f84-cab4-4152-9202-d448435c67de', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/4\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-15 07:54:52', '2020-08-15 07:54:52'),
('3ef12213-1e36-42be-935d-19ce6505dade', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/11\",\"fas\":\"fa-file-alt\"}', NULL, '2023-11-29 15:19:31', '2023-11-29 15:19:31'),
('40bff82e-3992-4cc5-8662-0eb3d88a814c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/1\",\"fas\":\"fa-file-alt\"}', NULL, '2023-11-22 16:57:58', '2023-11-22 16:57:58'),
('4a0afdb0-71ad-4ce6-bc70-c92ef491a525', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-17 21:13:51', '2020-08-17 21:13:51'),
('4e3cf8f7-bb81-4d22-98b2-70ef6aeafb2d', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/6\",\"fas\":\"fa-file-alt\"}', NULL, '2023-11-27 16:54:13', '2023-11-27 16:54:13'),
('540ca3e9-0ff9-4e2e-9db3-6b5abc823422', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', '2020-08-15 07:30:44', '2020-08-14 07:12:28', '2020-08-15 07:30:44'),
('572a5a95-970f-4a70-9ae1-ee3b77875b9b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/mens-iconic-trench-coat\",\"fas\":\"fa-star\"}', NULL, '2023-11-28 21:54:20', '2023-11-28 21:54:20'),
('57ce035a-35fe-4d76-a320-5f5e6a54ce1e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/10\",\"fas\":\"fa-file-alt\"}', NULL, '2023-11-28 22:28:29', '2023-11-28 22:28:29'),
('5da09dd1-3ffc-43b0-aba2-a4260ba4cc76', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-15 07:51:02', '2020-08-15 07:51:02'),
('5e91e603-024e-45c5-b22f-36931fef0d90', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/white-sports-casual-t\",\"fas\":\"fa-star\"}', NULL, '2020-08-15 07:44:07', '2020-08-15 07:44:07'),
('67574a9e-d626-42d6-8f05-ebbf214bef20', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/womens-v-neck-floral-summer-tops\",\"fas\":\"fa-star\"}', NULL, '2023-11-27 13:25:44', '2023-11-27 13:25:44'),
('67fe672c-7384-4ded-b609-d2261671f7ec', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/mens-classic-zip-front-polar-fleece-jacket\",\"fas\":\"fa-star\"}', NULL, '2023-11-27 13:17:47', '2023-11-27 13:17:47'),
('6cec98cf-bf3e-4e7b-b9a1-0ff9ce8f0a5e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/8\",\"fas\":\"fa-file-alt\"}', NULL, '2023-11-28 15:01:35', '2023-11-28 15:01:35'),
('73a3b51a-416a-4e7d-8ca2-53b216d9ad8e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-14 07:11:03', '2020-08-14 07:11:03'),
('7be7d736-a6fb-4988-87e5-5ad39f933731', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/mens-retro-slim-fit-straight-jean\",\"fas\":\"fa-star\"}', NULL, '2023-11-28 22:00:23', '2023-11-28 22:00:23'),
('8605db5d-1462-496e-8b5f-8b923d88912c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/1\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-14 07:20:44', '2020-08-14 07:20:44'),
('8a76c3b0-1f7d-4767-97f7-0da561f0948d', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/mens-carnaby-evo-tri1-sma-trainers\",\"fas\":\"fa-star\"}', NULL, '2023-11-28 21:50:28', '2023-11-28 21:50:28'),
('9b1ab868-89d3-4a72-8b9b-5667c4b3fc71', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/mens-retro-slim-fit-straight-jean\",\"fas\":\"fa-star\"}', NULL, '2023-11-28 14:50:44', '2023-11-28 14:50:44'),
('9f7dd99f-85f0-4525-91f2-9c30a6f3db7f', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/9\",\"fas\":\"fa-file-alt\"}', NULL, '2023-11-28 22:04:35', '2023-11-28 22:04:35'),
('a6ec5643-748c-4128-92e2-9a9f293f53b5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/5\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-17 21:17:03', '2020-08-17 21:17:03'),
('ac00a3f2-683b-455a-965f-80774e4f6367', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/womens-casual-pants-high-waist-business-casual-ankle-pants\",\"fas\":\"fa-star\"}', NULL, '2023-11-27 13:19:45', '2023-11-27 13:19:45'),
('b08b5a74-76b9-4ed2-a753-c41472ef004b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/7\",\"fas\":\"fa-file-alt\"}', NULL, '2023-11-27 17:55:16', '2023-11-27 17:55:16'),
('b186a883-42f2-4a05-8fc5-f0d3e10309ff', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/2\",\"fas\":\"fa-file-alt\"}', '2020-08-15 04:17:24', '2020-08-14 22:14:55', '2020-08-15 04:17:24'),
('ba9ac0a5-a8c3-4fb3-92bc-08d0fafbff6a', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/5\",\"fas\":\"fa-file-alt\"}', NULL, '2023-11-27 16:48:05', '2023-11-27 16:48:05'),
('d2fd7c33-b0fe-47d6-8bc6-f377d404080d', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-14 07:08:50', '2020-08-14 07:08:50'),
('d8e1f84b-a9f2-4c12-bfde-156c4045003c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/mens-iconic-trench-coat\",\"fas\":\"fa-star\"}', NULL, '2023-11-28 21:49:05', '2023-11-28 21:49:05'),
('dfefca63-1751-47f0-88d7-72e25c9404d0', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/womens-v-neck-floral-summer-tops\",\"fas\":\"fa-star\"}', NULL, '2023-11-27 13:32:59', '2023-11-27 13:32:59'),
('dff78b90-85c8-42ee-a5b1-de8ad0b21be4', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/3\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-15 06:40:54', '2020-08-15 06:40:54'),
('e16827cb-89d7-473b-86d2-119070479970', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/mens-classic-zip-front-polar-fleece-jacket\",\"fas\":\"fa-star\"}', NULL, '2023-11-26 16:39:34', '2023-11-26 16:39:34'),
('e28b0a73-4819-4016-b915-0e525d4148f5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/lorem-ipsum-is-simply\",\"fas\":\"fa-star\"}', NULL, '2020-08-17 21:08:16', '2020-08-17 21:08:16'),
('e5faa63a-6cd0-4d4c-8ce3-4fa26b44d1de', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/womens-v-neck-floral-summer-tops\",\"fas\":\"fa-star\"}', NULL, '2023-11-27 13:22:49', '2023-11-27 13:22:49'),
('e9f89140-4ad2-4fbb-a8b6-2a7285609671', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/mens-relaxed-fit\",\"fas\":\"fa-star\"}', NULL, '2023-11-27 12:55:31', '2023-11-27 12:55:31'),
('f90ca287-1221-417f-9210-249f3e70533a', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/mens-iconic-trench-coat\",\"fas\":\"fa-star\"}', NULL, '2023-11-29 15:20:32', '2023-11-29 15:20:32'),
('ffd9fb5c-c436-4ac0-96ce-35e8f3e51877', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/womens-casual-pants-high-waist-business-casual-ankle-pants\",\"fas\":\"fa-star\"}', NULL, '2023-11-27 13:28:06', '2023-11-27 13:28:06'),
('ffffa177-c54e-4dfe-ba43-27c466ff1f4b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-17 21:13:29', '2020-08-17 21:13:29');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_total` double NOT NULL,
  `shipping_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon` double DEFAULT NULL,
  `total_amount` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('cod','paypal') NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') NOT NULL DEFAULT 'new',
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `post_code` varchar(255) DEFAULT NULL,
  `address1` text NOT NULL,
  `address2` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`) VALUES
(1, 'ORD-2WVHCGVUS2', 3, 63, NULL, NULL, 63, 1, 'cod', 'paid', 'delivered', 'Tisha', 'Mehta', 'tisha@gmail.com', '8866563459', 'IN', '12435', 'fdgvcx', 'ddfdx', '2024-06-27 06:37:45', '2024-06-27 06:37:45'),
(2, 'ORD-WSTFZBS0SK', 3, 63, NULL, NULL, 63, 1, 'cod', 'unpaid', 'new', 'Tisha', 'Mehta', 'tisha@gmail.com', '8866563459', 'IN', '12435', 'fdgvcx', 'ddfdx', '2024-06-27 06:41:35', '2024-06-27 06:41:35'),
(3, 'ORD-GPHMG6G1SJ', 3, 63, NULL, NULL, 63, 1, 'cod', 'unpaid', 'new', 'abc', 'lkds', 'tisha@adi.com', '8866563459', 'IN', '12435', 'dwefrgf', 'ascxv b', '2024-06-27 06:51:49', '2024-06-27 06:51:49'),
(5, 'ORD-6U2EZZCZSK', 3, 24000, NULL, NULL, 24000, 1, 'cod', 'paid', 'delivered', 'Tisha', 'Mehta', 'tisha@gmail.com', '8866563459', 'IN', '12435', 'fdgvcx', 'ddfdx', '2024-06-28 06:56:05', '2024-06-28 06:56:05'),
(6, 'ORD-XMSJGNVN5C', 5, 760, NULL, NULL, 760, 1, 'cod', 'unpaid', 'cancel', 'Tisha', 'Mehta', 'tisha@gmail.com', '8866563459', 'IN', '435', 'fedjks', 'bfjkwsdbz', '2024-07-10 03:33:11', '2024-07-10 03:33:11'),
(7, 'ORD-YH5ENXJBQA', 5, 2560, NULL, NULL, 2560, 2, 'cod', 'unpaid', 'new', 'kewj,f', 'jdks,', 'abc@gmail.com', '8866563459', 'IN', '3245', 'fnwek,', 'kdvmn', '2024-07-10 03:46:00', '2024-07-10 03:46:00'),
(8, 'ORD-GSARM8LWVQ', 5, 2560, NULL, NULL, 2560, 2, 'cod', 'unpaid', 'new', 'fzxcv', 'fxcb', 'abc@gmail.com', '8866563459', 'IN', '12435', 'fnwek', 'ddfdx', '2024-07-10 03:55:32', '2024-07-10 03:55:32'),
(9, 'ORD-YN8D8VHQHA', 5, 2560, NULL, NULL, 2560, 2, 'cod', 'unpaid', 'new', 'fzxcv', 'fxcb', 'abc@gmail.com', '8866563459', 'IN', '12435', 'fnwek', 'ddfdx', '2024-07-10 03:56:57', '2024-07-10 03:56:57'),
(10, 'ORD-CYPCBSYWPF', 5, 760, NULL, NULL, 760, 1, 'cod', 'unpaid', 'new', 'abc', 'lkds', 'abc@gmail.com', '8866563459', 'IN', '352qw', 'rfejk', 'kldfnc', '2024-07-10 04:00:22', '2024-07-10 04:00:22'),
(11, 'ORD-BOQGEXSVYU', 5, 760, NULL, NULL, 760, 1, 'cod', 'unpaid', 'new', 'abc', 'lkds', 'abc@gmail.com', '8866563459', 'IN', '435', 'dwefrgf', 'bfjkwsdbz', '2024-07-10 04:34:46', '2024-07-10 04:34:46'),
(12, 'ORD-UQ0RDDBBKF', 5, 1164, NULL, NULL, 1164, 1, 'cod', 'unpaid', 'new', 'ew,smdz', 'fem k', 'jem@email.com', '3259839', 'IN', NULL, 'hsdbc', NULL, '2024-07-10 04:38:31', '2024-07-10 04:38:31'),
(13, 'ORD-LFZMGUJ6PI', 5, 1000, NULL, NULL, 1000, 1, 'cod', 'unpaid', 'new', 'Tisha', 'fxcb', 'tisha@gmail.com', '8866563459', 'IN', '352', 'fnwek,', 'kldfnc', '2024-07-10 05:00:00', '2024-07-10 05:00:00'),
(14, 'ORD-6AHKBXSQUV', 5, 1164, NULL, NULL, 1164, 1, 'cod', 'unpaid', 'new', 'fzxcv', 'fxcb', 'desf@gmail.com', '3489928934', 'IN', '21443', 'fdgvcx', 'ddfdx', '2024-07-10 05:02:33', '2024-07-10 05:02:33'),
(15, 'ORD-S3ZVLTZCKH', 5, 1164, NULL, NULL, 1164, 1, 'cod', 'unpaid', 'new', 'fzxcv', 'fxcb', 'abc@gmail.com', '8866563459', 'IN', '12435', 'fdgvcx', 'ddfdx', '2024-07-10 05:12:45', '2024-07-10 05:12:45'),
(16, 'ORD-VMAEOKX2VC', 5, 9500, NULL, NULL, 9500, 1, 'cod', 'unpaid', 'new', 'Tisha', 'Mehta', 'tisha@gmail.com', '8866563459', 'IN', NULL, 'fdgvcx', NULL, '2024-07-10 05:15:26', '2024-07-10 05:15:26'),
(17, 'ORD-JH2QPUF0DL', 5, 1000, NULL, NULL, 1000, 1, 'cod', 'unpaid', 'process', 'Tisha', 'Mehta', 'tisha@gmail.com', '8866563459', 'IN', NULL, 'fdgvcx', NULL, '2024-07-10 05:16:33', '2024-07-10 05:16:33'),
(18, 'ORD-XOOZNSK3YM', 5, 1900, NULL, NULL, 1900, 1, 'cod', 'unpaid', 'new', 'Tisha', 'Mehta', 'tisha@gmail.com', '8866563459', 'IN', NULL, 'fdgvcx', NULL, '2024-07-10 05:22:34', '2024-07-10 05:22:34'),
(19, 'ORD-QZKIADXVKR', 5, 1900, NULL, NULL, 1900, 1, 'cod', 'unpaid', 'new', 'Tisha', 'Mehta', 'tisha@gmail.com', '8866563459', 'IN', NULL, 'fdgvcx', NULL, '2024-07-10 05:23:29', '2024-07-10 05:23:29'),
(20, 'ORD-UIX3EUNXFE', 5, 1000, NULL, NULL, 1000, 1, 'cod', 'unpaid', 'new', 'Tisha', 'Mehta', 'tisha@gmail.com', '8866563459', 'IN', NULL, 'fdgvcx', NULL, '2024-07-10 05:26:47', '2024-07-10 05:26:47'),
(21, 'ORD-OUXSHR1637', 5, 900, NULL, NULL, 900, 1, 'cod', 'unpaid', 'new', 'Tisha', 'Mehta', 'tisha@gmail.com', '8866563459', 'IN', NULL, 'fdgvcx', NULL, '2024-07-10 05:30:59', '2024-07-10 05:30:59'),
(22, 'ORD-Y0XZLEIUVK', 5, 285, NULL, NULL, 285, 1, 'cod', 'unpaid', 'new', 'Tisha', 'Mehta', 'tisha@gmail.com', '8866563459', 'IN', NULL, 'fdgvcx', NULL, '2024-07-10 05:33:08', '2024-07-10 05:33:08'),
(23, 'ORD-JOZDUOP9EX', 5, 495, NULL, NULL, 495, 1, 'cod', 'unpaid', 'new', 'Tisha', 'Mehta', 'tisha@gmail.com', '8866563459', 'IN', NULL, 'fdgvcx', NULL, '2024-07-10 05:49:40', '2024-07-10 05:49:40'),
(24, 'ORD-LTW8INQV17', 5, 1465, NULL, NULL, 1465, 2, 'cod', 'unpaid', 'new', 'Tisha', 'Mehta', 'tisha@gmail.com', '8866563459', 'IN', 'dsx', 'fwsdx', 'dsxfv', '2024-07-10 06:50:02', '2024-07-10 06:50:02');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('mehtatisha35@gmail.com', '$2y$12$wvth21eX/1Os4ZDIccb79.zg3Gr/2NflAwBwOkcB5JaJN1Um1yJOa', '2024-07-08 00:38:19');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `summary` text NOT NULL,
  `description` longtext DEFAULT NULL,
  `quote` text DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `post_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_tag_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(4, 'ksdnczk', 'blog-added-2', ' cxnzckxz kdjcn jk.\r\ndcn xk;nscabxz\r\ncmskjxn .mf,m cx, knfclx  jmczxl nm', 'wefrgthmbn   wertyujkil,mnvcxsdefertyuykijmn bvcxzsdfvbgvc cxsweddkxmlz;ksacsz', NULL, NULL, 'mnfxc ', 3, 1, 4, 'active', '2024-07-03 08:20:22', NULL),
(5, 'dkmsv', 'fmadj', 'kdsv,  fjdksn kiwef lkbefw creuinhsjklrenisu', 'rekal rejhfisd rewniituieh', 'gekjn', '/storage/photos/slider-1.jpg', 'xcdlksn', 1, 2, 3, 'active', '2024-07-05 04:35:11', '2024-07-05 04:35:11'),
(7, 'grdsxc', 'building-a-real-time-app-hire-react-native-developers-with-strong-websocket-skills', 'hntrgfkl', 'lmfdlzx c fdslnk fsdknzk fsknlzfn', 'fnksd,mk', '/storage/photos/1/admin-icon1.jpg', 'dsinvsL', 4, 1, 3, 'active', '2024-07-05 04:48:05', '2024-07-05 04:48:05'),
(8, 'vashnzv', 'fhvds', 'vnsahcshajvu', 'vdjsav z qwdsyuav wdjashjy qdajhvdqw asjyq', 'jv', '/storage/photos/oKMKHa3jz8hSYKfUOJaRDtzIdu4OTkKVEIpmIICp.jpg', 'fdkxnc', 3, 1, NULL, 'active', '2024-07-05 04:52:21', '2024-07-05 04:52:21'),
(9, 'dfnjm', 'rgjdkx', 'fvsdkjx', 'djskxmn', 'f dskxj', '/storage/blogs/hxQpg5qoqXBA59yDtBx7aSk5sns993DmEAoC3ASh.jpg', 'xcdlksn', 1, 4, NULL, 'active', '2024-07-10 07:41:58', '2024-07-10 07:41:58'),
(10, 'first blog', 'abc-blog', 'this is first blog of this website', 'I hope You like this website. Kindly give reviews', '103', '/storage/blogs/hxQpg5qoqXBA59yDtBx7aSk5sns993DmEAoC3ASh.jpg', 'dsinvsL', 2, 2, NULL, 'active', '2024-07-10 07:45:25', '2024-07-10 07:45:25'),
(12, 'jvm jz bsz', 'rfjmb', 'kjnvfdx rsndvknrel jvkdfc vdnxi', 'vf czkc kdjv ncx d c edloszx x vdikor kngros', 'rndsn', '/storage/blogs/0P346T4KSAr6zHznufR6LX3tbvL65DP6VDP1hy3V.jpg', 'cfldkn', 4, 1, NULL, 'active', '2024-07-10 23:32:58', '2024-07-10 23:32:58');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Travel', 'contrary', 'active', '2020-08-14 01:51:03', '2020-08-14 01:51:39'),
(2, 'Electronics', 'richard', 'active', '2020-08-14 01:51:22', '2020-08-14 01:52:00'),
(3, 'Cloths', 'cloths', 'active', '2020-08-14 01:52:22', '2020-08-14 01:52:22'),
(4, 'enjoy', 'enjoy', 'active', '2020-08-14 03:16:10', '2020-08-14 03:16:10'),
(5, 'Post Category', 'post-category', 'active', '2020-08-15 06:59:04', '2020-08-15 06:59:04');

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` text NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `replied_comment` text DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_comments`
--

INSERT INTO `post_comments` (`id`, `user_id`, `post_id`, `comment`, `status`, `replied_comment`, `parent_id`, `created_at`, `updated_at`) VALUES
(2, 4, NULL, 'vdlfklxcm', 'active', NULL, NULL, '2024-07-03 01:35:53', '2024-07-03 01:35:53'),
(3, 4, NULL, 'vdlfklxcm', 'active', NULL, NULL, '2024-07-03 01:36:28', '2024-07-03 01:36:28'),
(4, 4, NULL, 'nc vxmn m', 'active', NULL, NULL, '2024-07-03 02:45:30', '2024-07-03 02:45:30');

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Enjoy', 'enjoy', 'active', '2020-08-14 01:53:52', '2020-08-14 01:53:52'),
(2, '2020', '2020', 'active', '2020-08-14 01:54:09', '2020-08-14 01:54:09'),
(4, 'Tag', 'tag', 'active', '2020-08-15 06:59:31', '2020-08-15 06:59:31');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `summary` text NOT NULL,
  `description` longtext DEFAULT NULL,
  `photo` text NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 1,
  `size` varchar(255) DEFAULT 'M',
  `condition` enum('default','new','hot') NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `price` double NOT NULL,
  `discount` double NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `child_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(14, 'Men\'s Retro Slim Fit Straight Jean', 'mens-retro-slim-fit-straight-jean', 'dvkc xk dvklcxn', 'nfrkldvx', '/storage/photos/1/mjns.jpg', 18, '', 'hot', 'active', 700, 10, 1, 1, NULL, 6, '2024-06-28 05:42:32', '2024-07-09 04:09:04'),
(15, 'Realme AC', 'realme-ac', '', NULL, '/storage/photos/1/AC/AC(2).png', 10, '', 'default', 'active', 30000, 20, 1, 14, 14, 8, NULL, NULL),
(16, 'Voltas AC', 'new-voltas-ac', '', NULL, '/storage/photos/1/AC/AC(3).png', 20, '', 'new', 'active', 31000, 10, 1, 14, 14, 9, NULL, NULL),
(17, 'Boat-buds', 'new-boat-buds', '', NULL, '/storage/photos/1/Buds/buds(1).png', 10, '', 'default', 'active', 2000, 10, 1, 16, 16, 10, NULL, NULL),
(18, 'Voltas Oven ', 'new-voltas-oven', '', NULL, '/storage/photos/1/Oven/oven(1).png', 20, '', 'new', 'active', 15000, 10, 1, 17, 14, NULL, NULL, NULL),
(19, 'Realme C51', 'new-realme-c51', '', NULL, '/storage/photos/1/Phone/phone(1).png', 1, '', 'new', 'active', 10000, 5, 0, 18, 18, 8, NULL, NULL),
(20, 'Vivo T2X', 'new-vivo-t2x', '', NULL, '/storage/photos/1/Phone/phone(2).png', 20, '', 'new', 'active', 12000, 5, 1, 18, 18, 8, NULL, NULL),
(21, 'Samsung F14', 'samsung-f-14', '', NULL, '/storage/photos/1/Phone/phone(5).png', 10, '', 'default', 'active', 20000, 2, 0, 18, 18, 12, '2024-06-28 08:44:23', NULL),
(22, 'Smart Watch', 'smart-watch', '', NULL, '/storage/photos/1/Smart watch/SW(1).png', 12, '', 'new', 'active', 2000, 5, 1, 19, 19, 7, '2024-06-28 08:50:33', NULL),
(23, 'Speakers', 'boat-speaker', '', NULL, '/storage/photos/1/Speaker/s(2).png', 10, '', 'default', 'active', 5000, 5, 0, 20, 20, 10, '2024-06-28 09:05:26', NULL),
(24, 'LG Washing Machine', 'lg-washing-machine', '', NULL, '/storage/photos/1/Washing Machine/WM(1).png ', 10, '', 'new', 'active', 40000, 5, 1, 21, 21, 13, '2024-06-28 09:17:37', NULL),
(25, 'Jacket-1', 'new-jacket-1', '', NULL, '/storage/photos/1/men\'s fashion/jacket1.jpg', 30, 'M,L,XL', 'hot', 'active', 300, 5, 1, 1, 6, 7, '2024-06-28 11:21:11', NULL),
(26, 'Jacket-2', 'new-jacket-2', '', '', '/storage/photos/1/men\'s fashion/jacket2.jpg', 10, 'M,L,XL', 'default', 'active', 300, 6, 1, 1, 6, 7, NULL, NULL),
(27, 'Sweater1', 'new-sweater-1', '', NULL, '/storage/photos/1/men\'s fashion/sweater1.jpg', 30, 'M,L,XL', 'hot', 'active', 500, 1, 1, 1, 6, 7, '2024-06-28 11:32:36', NULL),
(28, 'Sweater2', '', '', NULL, '/storage/photos/1/men\'s fashion/sweater2.jpg', 17, 'M,L,XL', 'hot', 'active', 800, 3, 1, 1, 6, NULL, NULL, NULL),
(29, 'Men\'s Jeans Pants', 'mens-jeans-pant-1', '', NULL, '/storage/photos/1/men\'s fashion/pants(1).jpg', 1, 'M,L,XL', 'hot', 'active', 1000, 5, 1, 1, 5, 7, NULL, NULL),
(30, 'Men\'s Jeans Pants\n2', 'mens-jeans-pant-2', '', NULL, '/storage/photos/1/men\'s fashion/pants(2).jpg', 10, 'M,L,XL', 'default', 'active', 1000, 5, 1, 1, 5, 7, '2024-06-28 11:44:05', NULL),
(31, 'T-shirt\'s', 'new-t-shirts', '', NULL, '/storage/photos/1/men\'s fashion/t-shirt.jpg', 100, 'M,L,XL', 'default', 'active', 500, 2, 1, 1, 4, 7, '2024-06-28 12:28:35', NULL),
(32, 'T-shirt\'s', 'new-t-shirts-2', '', NULL, '/storage/photos/1/men\'s fashion/t-shirt(2).jpg', 100, 'M,L,XL,XXL', 'default', 'active', 800, 6, 1, 1, 4, 6, '2024-06-28 11:44:05', NULL),
(35, 'Rain Coat For Men', 'rain-coat-for-men', '', NULL, '/storage/photos/1/men\'s fashion/rainCoat1.jpg', 10, 'M,L,XL', 'new', 'active', 900, 2, 1, 1, 7, 3, '2024-06-28 12:33:44', NULL),
(36, 'Rain Coat For Men', 'rain-coat-for-men-2', '', NULL, '/storage/photos/1/men\'s fashion/rainCoat2.jpg', 25, 'M,L,XL,XXL', 'default', 'active', 990, 2, 1, 1, 7, 7, '2024-06-28 12:33:44', NULL),
(37, 'Trenches For Men', 'trenches-for-men-1', '', NULL, '/storage/photos/1/men\'s fashion/trenches1.jpg', 10, 'M,L,XL,XXL', 'default', 'active', 2000, 10, 1, 1, 7, 7, '2024-06-28 12:47:53', NULL),
(38, 'Trenches', 'trenches-for-men-2', '', NULL, '/storage/photos/1/men\'s fashion/trenches2.jpg', 100, 'M,L,XL,XXL', 'default', 'active', 800, 2, 1, 1, NULL, NULL, NULL, NULL),
(39, 'Normal Shoes', 'mens-normal-shoes', '', NULL, '/storage/photos/1/men\'s fashion/shoes1.jpg', 1, 'M,L,XL,XXL', 'default', 'active', 2000, 5, 1, 1, 12, 7, '2024-06-28 12:53:08', NULL),
(40, 'Sports Shoes', 'mens-sports-shoes', '', NULL, '/storage/photos/1/men\'s fashion/shoes3.jpg', 30, 'M,L,XL,XXL', 'default', 'active', 3000, 5, 1, 1, 12, 1, NULL, NULL),
(41, 'Simple Dress For Women', 'simple-dress-for-women', '', NULL, '/storage/photos/1/women\'s/Dress2.jpg', 10, 'M,XL,XXL', 'default', 'active', 1000, 10, 1, 2, 8, 7, '2024-06-28 13:07:50', NULL),
(42, 'Long Dress ', 'long-dress-for-women', '', NULL, '/storage/photos/1/women\'s/Dress3.jpg', 1, 'M,L,XL', 'default', 'active', 1200, 3, 1, 2, 8, 7, '2024-06-28 13:07:50', NULL),
(45, 'Pants for Women', 'new-pants', '', NULL, '/storage/photos/1/women\'s/pants(1).jpg', 100, 'M,L,XL', 'default', 'active', 1000, 0, 1, 2, 11, 7, '2024-06-28 13:25:33', NULL),
(46, 'Pants For OutDoor', 'pants-for-women', '', NULL, '/storage/photos/1/women\'s/pants(2).jpg', 100, 'M,L,XL,XXL', 'default', 'active', 1000, 3, 1, 2, 11, 7, '2024-06-28 13:17:59', NULL),
(47, 'T-shirts For Womens', 't-shirt-for-women', '', NULL, '/storage/photos/1/women\'s/tshirt(2).jpg', 1, 'M', 'default', 'active', 800, 5, 1, 2, 10, 7, '2024-06-28 13:26:35', NULL),
(48, 'Tshirt For Womens', 'tshirt-for-womens-2', 'abcdsjkbvik', 'vhbsD z sac hjubhucsa juhbfukwdabiufsca iufidcs', '/storage/photos/1/women\'s/tshirt2.jpg', 1, 'M,L,XL,XXL', 'default', 'active', 1000, 5, 1, 2, 10, 7, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT 0,
  `review` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rate`, `review`, `status`, `created_at`, `updated_at`) VALUES
(2, NULL, 24, 5, 'Great product, It is very easy to use', 'active', '2024-07-01 04:27:07', '2024-07-01 04:27:07'),
(3, 4, 17, 5, NULL, 'active', '2024-07-01 06:47:27', '2024-07-01 06:47:27');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('fJRCXlBstCXzedD4gmEorP20CIUiOahp7DrbB3V3', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV2JqTm14dFN0Z0t5TkkzY0tzc1N3Z0xiSzZDYVlvNEZkMkVUaE16NSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1721107861),
('ThKoW99M7Z4DQ0fA0lQv6D5txpEuWLXNvdFUUv5C', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiNmg1NVZMUk01UTJBdjZ4T0FxYkFXQ0pDUXFRVWxKT3VXeGtiUnNYUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjU7czo0OiJ1c2VyIjtzOjEzOiJhYmNAZ21haWwuY29tIjt9', 1720780035);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext NOT NULL,
  `short_des` text NOT NULL,
  `logo` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis unde sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis unde omnis iste natus error sit voluptatem Excepteu\r\n\r\n                            sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspi deserunt mollit anim id est laborum. sed ut perspi.', 'Welcome to Ecommerce Website, your premier destination for products. Discover a curated collection of product types designed to elevate your needs or lifestyle. Dive into a world of quality, style, innovation where every purchase guarantees satisfaction.', '/storage/photos/1/logo.png', '/storage/photos/1/blog3.jpg', '115B/88 Test Address, Test', '+1000000001', 'mehtatisha35@gmail.com', NULL, '2023-11-22 17:36:59');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Address A', 12.00, 'active', '2020-08-14 04:22:17', '2023-11-22 16:55:42'),
(2, 'Address B', 25.00, 'active', '2020-08-14 04:22:41', '2023-11-22 16:55:50'),
(3, 'Address C', 30.00, 'active', '2020-08-15 06:54:04', '2023-11-22 16:55:59'),
(4, 'Address D', 35.00, 'active', '2020-08-17 20:50:48', '2023-11-22 16:56:06');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `provider` varchar(255) DEFAULT NULL,
  `provider_id` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'Tisha Mehta', 'mehtatisha36@gmail.com', NULL, '$2y$12$XNXfTq1UFDpc.qowLWan6.DE7bJaFRPdZMf4G/BSxlONDPb/f0dPi', '/storage/photos/1/admin-icon1.jpg', 'user', NULL, NULL, 'active', NULL, '2024-06-25 04:31:30', '2024-07-10 00:57:19'),
(4, 'Tisha Mehta', 'admin123@gmail.com', NULL, '$2y$12$wj3JNc3ZvUJXjZAtqY86Ru0WM/Z1Ai4PMBQ3n7rT2HnezgH99SWHe', '/storage/photos/1/admin-icon1.jpg', 'admin', NULL, NULL, 'active', '8YvtheiVFbKsVGtexZVBgjbN39p1s9I7oyh8LymK0296lYrflIuTcWnJmRat', '2024-07-01 06:43:08', '2024-07-01 06:43:08'),
(5, 'abc', 'abc@gmail.com', NULL, '$2y$12$4uXinvO6hcdIlX9zXt5kuumr37QfRFOU2wJ3CRQG7/MXRUQwgLtte', 'top10SaudiArabia.jpg', 'user', NULL, NULL, 'active', NULL, '2024-07-03 23:47:13', '2024-07-11 23:35:36');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `product_id`, `cart_id`, `user_id`, `price`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(3, 42, 16, 5, 1164, 1, 1164, '2024-07-10 03:31:41', '2024-07-10 03:45:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_added_by_foreign` (`added_by`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  ADD KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  ADD KEY `posts_added_by_foreign` (`added_by`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_slug_unique` (`slug`);

--
-- Indexes for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_user_id_foreign` (`user_id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_tags_slug_unique` (`slug`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`),
  ADD KEY `products_child_cat_id_foreign` (`child_cat_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_cart_id_foreign` (`cart_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
