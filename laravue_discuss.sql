-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2022 at 03:30 PM
-- Server version: 8.0.28
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravue_discuss`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `post_id` int NOT NULL,
  `comment` text COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `post_id`, `comment`, `created_at`, `updated_at`) VALUES
(17, 1, 22, 'anjir', '2022-06-11 07:37:25', '2022-06-11 07:37:25');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int NOT NULL,
  `model_id` int NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `ext` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth-token', '9db2548f94f0ecbd67d3c85e3fbf5ae7a818b43e390ee1d333c1e4ec238da0c0', '[\"*\"]', NULL, '2022-05-22 00:36:38', '2022-05-22 00:36:38'),
(2, 'App\\Models\\User', 1, 'auth-token', '3f359ce2f1c50d29c34da73e6ace1d9c23379fe483393a38ffa0d6c5c23ceade', '[\"*\"]', NULL, '2022-05-22 00:39:12', '2022-05-22 00:39:12'),
(3, 'App\\Models\\User', 1, 'auth-token', '9bd8a58dd01f63c2bbb4a4797ae0091ce8b48e41053780a41fb31d2806b5d490', '[\"*\"]', NULL, '2022-05-22 00:40:05', '2022-05-22 00:40:05'),
(4, 'App\\Models\\User', 1, 'auth-token', '76fee6f51f5f57341ea4fb9a70cdccac55a45a1574c4fc01ad3adac7f2e7f0aa', '[\"*\"]', NULL, '2022-05-22 04:42:42', '2022-05-22 04:42:42'),
(5, 'App\\Models\\User', 1, 'auth-token', 'f0fd2a753cf7947296fbe0e5b18de49561125b8b20c5738ff5a6821ce7a647d8', '[\"*\"]', NULL, '2022-05-22 04:45:03', '2022-05-22 04:45:03'),
(6, 'App\\Models\\User', 1, 'auth-token', '63cb8c7b55613a94bcf1c86972a43b83cbd15eaf7491a15c8192faa601c5f3b2', '[\"*\"]', NULL, '2022-05-22 04:47:12', '2022-05-22 04:47:12'),
(7, 'App\\Models\\User', 1, 'auth-token', '6e477e3381f789c3ad8b8805977cb2d3b059abc1131fe23fa288b354931b1522', '[\"*\"]', NULL, '2022-05-22 04:47:25', '2022-05-22 04:47:25'),
(8, 'App\\Models\\User', 1, 'auth-token', '683cb78ca1e4f9d16650d88affca89e532bdb43e3fe2f85f2d0a1113062da4aa', '[\"*\"]', NULL, '2022-05-22 05:27:44', '2022-05-22 05:27:44'),
(9, 'App\\Models\\User', 1, 'auth-token', 'dbe0d5e2eb8473df449a4f2d60d76c60a23ed73426f4f06e01fe96a5a5785ae8', '[\"*\"]', NULL, '2022-05-22 05:31:27', '2022-05-22 05:31:27'),
(10, 'App\\Models\\User', 1, 'auth-token', 'f6c379745d3b3ea351e5b82f3a3eb155dbe93827df1a79a8f9859401c4e69d1d', '[\"*\"]', NULL, '2022-05-22 05:31:45', '2022-05-22 05:31:45'),
(11, 'App\\Models\\User', 1, 'auth-token', '3a6ca74bf5ef6115de144780bd5c25eef967bcedd400ebbe22bb8fe6c9810a19', '[\"*\"]', NULL, '2022-05-22 05:32:01', '2022-05-22 05:32:01'),
(12, 'App\\Models\\User', 1, 'auth-token', '7155ddb153592edbb442ba78ea5e2e17c9e2cd2b41320036b8ba0aa2b6d9991a', '[\"*\"]', NULL, '2022-05-23 20:52:01', '2022-05-23 20:52:01'),
(13, 'App\\Models\\User', 1, 'auth-token', 'e9856f816253b912d28a7b11520ee4ab50da523b2595fec6dfbc7acfa92fac2d', '[\"*\"]', NULL, '2022-05-23 22:56:33', '2022-05-23 22:56:33'),
(14, 'App\\Models\\User', 1, 'auth-token', 'b6dc96a1135557439d88a789334707762f5654917b9f56e9a371ee9ee419b40c', '[\"*\"]', NULL, '2022-05-24 02:25:50', '2022-05-24 02:25:50'),
(15, 'App\\Models\\User', 1, 'auth-token', 'ceddab73980e0be8dccc42a56630d7746e4dbcccd40f46e0c37f15918d58795c', '[\"*\"]', NULL, '2022-05-24 02:31:59', '2022-05-24 02:31:59'),
(16, 'App\\Models\\User', 1, 'auth-token', 'c5e124d334f5156db9093a77390fe82b2b86419dbef0bbf132458be28b444d1f', '[\"*\"]', NULL, '2022-05-24 02:45:25', '2022-05-24 02:45:25'),
(17, 'App\\Models\\User', 1, 'auth-token', '08ce1a65363e857ea0ec4f0073002b5b5eb25e88cdf662465e06f62b5c772bb6', '[\"*\"]', NULL, '2022-05-29 01:31:27', '2022-05-29 01:31:27'),
(18, 'App\\Models\\User', 1, 'auth-token', 'f23c5fe14cfc5b06c6b6e1b95ab9676eac20b5ddcfb7a3340df066323b7a48e2', '[\"*\"]', NULL, '2022-05-29 01:31:28', '2022-05-29 01:31:28'),
(19, 'App\\Models\\User', 1, 'auth-token', '420841390aa73bd02faf2f30cf9ee6130564ba3d142f78173f81c5bf57100255', '[\"*\"]', NULL, '2022-05-29 01:31:28', '2022-05-29 01:31:28'),
(20, 'App\\Models\\User', 1, 'auth-token', 'a7dccf0ffca7c184f6ab636895e67444c13c05ec2a89749b6a8437a083999ae1', '[\"*\"]', NULL, '2022-05-29 02:32:56', '2022-05-29 02:32:56'),
(21, 'App\\Models\\User', 1, 'auth-token', '80589d86008151a82e22b78ed1985780a448b9d92de18d1324303ee2412f3820', '[\"*\"]', NULL, '2022-06-01 01:44:52', '2022-06-01 01:44:52'),
(22, 'App\\Models\\User', 1, 'auth-token', '7a1c01154ef6bb003daffbef8dee57554b13cda005252b38e2749222386b1b87', '[\"*\"]', NULL, '2022-06-01 02:04:06', '2022-06-01 02:04:06'),
(23, 'App\\Models\\User', 1, 'auth-token', '6e366cc93735c08f11b2b1ebcda983d9de091ae352e3e112f2f24b07a5ff634d', '[\"*\"]', NULL, '2022-06-01 02:09:33', '2022-06-01 02:09:33'),
(24, 'App\\Models\\User', 1, 'auth-token', '98e1462da06d5eccd3c0a8ed4bc1c472f6026c3c41a25195880836a24b417d6a', '[\"*\"]', NULL, '2022-06-06 06:51:04', '2022-06-06 06:51:04'),
(25, 'App\\Models\\User', 1, 'auth-token', '9bac398f7b8991d0efc58de6b2d673a8bd346fb1a7d67d17db12fa8efe9789a3', '[\"*\"]', NULL, '2022-06-07 01:13:31', '2022-06-07 01:13:31'),
(26, 'App\\Models\\User', 1, 'auth-token', '5135af06854bde3974cb7a5ce42e1369e79f54caf683f00d37808cc68a288778', '[\"*\"]', NULL, '2022-06-07 01:14:56', '2022-06-07 01:14:56'),
(27, 'App\\Models\\User', 1, 'auth-token', '1316a4808310cf559385f1d518312d08987948fada5a5580f8f4bf18f267b936', '[\"*\"]', NULL, '2022-06-07 01:19:22', '2022-06-07 01:19:22'),
(28, 'App\\Models\\User', 1, 'auth-token', '2e436507c8a6fb92e0f61d78263a81fd73741ad595ce286d8be470f4ed50ad04', '[\"*\"]', NULL, '2022-06-07 01:20:26', '2022-06-07 01:20:26'),
(29, 'App\\Models\\User', 1, 'auth-token', 'c2d82ea1db2018ab92be30d6a83c126d1f6c3cb6423a477360c40d9a885f5cce', '[\"*\"]', NULL, '2022-06-07 01:45:51', '2022-06-07 01:45:51'),
(30, 'App\\Models\\User', 1, 'auth-token', 'd1bb22ce2f1b4da9f44971f81f62668c23a249d7cee4a8daa663820b16acadc8', '[\"*\"]', NULL, '2022-06-07 02:25:28', '2022-06-07 02:25:28'),
(31, 'App\\Models\\User', 1, 'auth-token', '21f4535bdbf56f1c75bb46870ccb3b39db9be8473e5af192c5567087c56abe13', '[\"*\"]', NULL, '2022-06-07 03:41:07', '2022-06-07 03:41:07'),
(32, 'App\\Models\\User', 1, 'auth-token', '1d5b41a9f37678c607f9472d282f89315944c0d307bab9d3fba2a0e062c183f2', '[\"*\"]', NULL, '2022-06-07 22:03:05', '2022-06-07 22:03:05'),
(33, 'App\\Models\\User', 1, 'auth-token', 'bfb3d94033df04335c3e1e9b3e0d03197e7f973a4e3afab8039ba01706291168', '[\"*\"]', NULL, '2022-06-08 00:43:36', '2022-06-08 00:43:36'),
(34, 'App\\Models\\User', 1, 'auth-token', '06a66b95017533d6dc4ffcc3ae79f629e7a074500566e64230217a09ad0b19c6', '[\"*\"]', '2022-06-11 00:07:07', '2022-06-08 05:59:47', '2022-06-11 00:07:07'),
(35, 'App\\Models\\User', 1, 'auth-token', '8d3272366067a40387e1396b3267a92c8a3c717971bae24b5940c0ed15ef17af', '[\"*\"]', '2022-06-08 07:13:14', '2022-06-08 06:25:00', '2022-06-08 07:13:14'),
(36, 'App\\Models\\User', 1, 'auth-token', 'b4c287cadd089c25263d14de5e5454331094a6b45e2cc7c644e0fddfaa861e43', '[\"*\"]', '2022-06-08 07:46:41', '2022-06-08 07:24:01', '2022-06-08 07:46:41'),
(37, 'App\\Models\\User', 1, 'auth-token', '34a436811e1fec1c68c0614fbe3c9522233959d53bd6cfd5a7549fe12bbe9ad3', '[\"*\"]', '2022-06-08 07:58:31', '2022-06-08 07:47:08', '2022-06-08 07:58:31'),
(38, 'App\\Models\\User', 1, 'auth-token', '62777b8cafc75a0846b51df572f563d49b278aefe195af4f05aae880f63c5ab1', '[\"*\"]', '2022-06-09 07:07:35', '2022-06-09 06:44:46', '2022-06-09 07:07:35'),
(39, 'App\\Models\\User', 1, 'auth-token', '2be01f0faa957d5e099554aad0860c40d05b67e48eec183a2d5843148f9a164d', '[\"*\"]', '2022-06-10 05:28:31', '2022-06-09 07:08:09', '2022-06-10 05:28:31'),
(40, 'App\\Models\\User', 2, 'auth-token', '333ec73f0e6735823580465d66802beea4a849ff87d3f5878fe3ee55e29a6b18', '[\"*\"]', NULL, '2022-06-10 05:22:57', '2022-06-10 05:22:57'),
(41, 'App\\Models\\User', 2, 'auth-token', 'a63ff1dfceb580b39048a11dcfaa639e7d313f430571a0831eb500ad9b7f15f2', '[\"*\"]', NULL, '2022-06-10 05:25:03', '2022-06-10 05:25:03'),
(42, 'App\\Models\\User', 2, 'auth-token', '3108cfad3420d6a4b035d63df0008a4e19dd7234358953f56e5fcbde11f468cf', '[\"*\"]', '2022-06-10 05:42:33', '2022-06-10 05:30:48', '2022-06-10 05:42:33'),
(43, 'App\\Models\\User', 1, 'auth-token', '6e7388b431b90b485aee274102e2a1720fb3573c338523be801b01c60616cf76', '[\"*\"]', '2022-06-10 07:20:55', '2022-06-10 05:31:03', '2022-06-10 07:20:55'),
(44, 'App\\Models\\User', 1, 'auth-token', '21e0bfa4d8507f419d5724f258521192ef26dda6773cae633a4017f97a4d6bd5', '[\"*\"]', '2022-06-10 22:50:59', '2022-06-10 07:21:38', '2022-06-10 22:50:59'),
(45, 'App\\Models\\User', 2, 'auth-token', 'b85b46024f767e24b448bde9844a8da0b3321171f5c22ae37ecd534fe1941845', '[\"*\"]', '2022-06-10 23:06:34', '2022-06-10 22:47:04', '2022-06-10 23:06:34'),
(46, 'App\\Models\\User', 2, 'auth-token', 'fd7636168dedafb61c3e03cdfd85d3e6fe1a3c59f0faa899e98bc8e2c741557a', '[\"*\"]', '2022-06-11 04:29:28', '2022-06-10 23:08:36', '2022-06-11 04:29:28'),
(47, 'App\\Models\\User', 1, 'auth-token', 'e5a18be86c2b75f5e6469f79eb38770cc2d4872bce609015f56ccb39732a0425', '[\"*\"]', '2022-06-11 07:37:25', '2022-06-11 04:29:26', '2022-06-11 07:37:25'),
(48, 'App\\Models\\User', 1, 'auth-token', '21ad799d5070fbae7c32b2488c04bcde0320946268689b8efc1bb4ce51b62bbe', '[\"*\"]', '2022-06-12 00:51:09', '2022-06-12 00:40:00', '2022-06-12 00:51:09'),
(49, 'App\\Models\\User', 1, 'auth-token', '6bf39cd9ddc6f7285f370b3999e2ce51555a0687748dbbf25307d998b5affbc3', '[\"*\"]', '2022-06-12 06:03:06', '2022-06-12 00:51:07', '2022-06-12 06:03:06'),
(50, 'App\\Models\\User', 2, 'auth-token', 'f14e3a161fac1ddf8e50189015084f591767bb5a9d093c83438ba10c8a177ccc', '[\"*\"]', '2022-06-12 06:03:06', '2022-06-12 01:22:37', '2022-06-12 06:03:06');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `body` text COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `body`, `created_at`, `updated_at`) VALUES
(22, 1, 'Amazing', '2022-06-11 07:37:17', '2022-06-11 07:37:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Prof. Cesar Collier MD', 'zhessel@example.org', '2022-05-21 21:55:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'EOv0EAWOsj', '2022-05-21 21:55:12', '2022-05-21 21:55:12'),
(2, 'Jay Zulauf', 'jan.damore@example.org', '2022-05-21 21:55:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2MqNmVbobj', '2022-05-21 21:55:12', '2022-05-21 21:55:12'),
(3, 'Prof. Jarod Hettinger', 'nella36@example.com', '2022-05-21 21:55:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'pyONSkUZhf', '2022-05-21 21:55:12', '2022-05-21 21:55:12'),
(4, 'Mr. Arely Breitenberg', 'jonas87@example.net', '2022-05-21 21:55:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'uA7dWxdodK', '2022-05-21 21:55:12', '2022-05-21 21:55:12'),
(5, 'Rosina Wehner', 'mara.schuster@example.org', '2022-05-21 21:55:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '4voFW7XTEw', '2022-05-21 21:55:12', '2022-05-21 21:55:12'),
(6, 'Felicity Strosin', 'frank62@example.com', '2022-05-21 21:55:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2hRN7yjBZz', '2022-05-21 21:55:12', '2022-05-21 21:55:12'),
(7, 'Joey Huel', 'lucas88@example.org', '2022-05-21 21:55:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'xYPCu2rfWz', '2022-05-21 21:55:12', '2022-05-21 21:55:12'),
(8, 'Prof. Luciano Adams III', 'roberts.sidney@example.com', '2022-05-21 21:55:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'uOLjJ6JzXS', '2022-05-21 21:55:12', '2022-05-21 21:55:12'),
(9, 'Verna Volkman', 'clint.moen@example.net', '2022-05-21 21:55:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f7nrE0gGId', '2022-05-21 21:55:12', '2022-05-21 21:55:12'),
(10, 'Maximo Schumm Sr.', 'ayundt@example.net', '2022-05-21 21:55:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Lf6IgfTsJm', '2022-05-21 21:55:12', '2022-05-21 21:55:12'),
(11, 'Tavares Hodkiewicz DVM', 'heidenreich.jaycee@example.net', '2022-05-21 21:55:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'WPsdHXKc0i', '2022-05-21 21:55:12', '2022-05-21 21:55:12'),
(12, 'Dr. Jaren Pfeffer', 'elyssa.schulist@example.com', '2022-05-21 21:55:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'cXD20oZRkX', '2022-05-21 21:55:12', '2022-05-21 21:55:12'),
(13, 'Saige Koss', 'gwiegand@example.org', '2022-05-21 21:55:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '7GX7Mgk507', '2022-05-21 21:55:12', '2022-05-21 21:55:12'),
(14, 'Ray Stroman', 'gmccullough@example.org', '2022-05-21 21:55:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'X2M4wEp7S9', '2022-05-21 21:55:12', '2022-05-21 21:55:12'),
(15, 'Lonnie Crona', 'korey05@example.net', '2022-05-21 21:55:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'JkLDu6NohF', '2022-05-21 21:55:12', '2022-05-21 21:55:12'),
(16, 'Dr. Oran Schulist', 'sschuppe@example.org', '2022-05-21 21:55:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '8QVugMWkGG', '2022-05-21 21:55:12', '2022-05-21 21:55:12'),
(17, 'Ella Jacobi PhD', 'fahey.janae@example.org', '2022-05-21 21:55:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'OOaLnTm74z', '2022-05-21 21:55:12', '2022-05-21 21:55:12'),
(18, 'Amie Sipes', 'aliya46@example.net', '2022-05-21 21:55:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'VxXPK23ZmD', '2022-05-21 21:55:12', '2022-05-21 21:55:12'),
(19, 'Jess Yost', 'kris.wanda@example.org', '2022-05-21 21:55:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'TrUaaMcSSH', '2022-05-21 21:55:12', '2022-05-21 21:55:12'),
(20, 'Mr. Madison Block IV', 'aaliyah60@example.org', '2022-05-21 21:55:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'mN9QkoE7HB', '2022-05-21 21:55:12', '2022-05-21 21:55:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
