-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 03 nov. 2023 à 07:24
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `laraveldb`
--

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0000_00_00_000000_create_websockets_statistics_entries_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_11_02_060350_create_subjects_table', 1),
(7, '2023_11_02_060702_create_user_subjects_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(2, 'App\\Models\\User', 3, 'Hortense Collins cferry@example.com', '96e721f3bd1403ec43e9898183e4d64a880152dd4eeb5a086427b2845461e335', '[\"*\"]', '2023-11-02 05:07:56', NULL, '2023-11-02 04:30:39', '2023-11-02 05:07:56'),
(3, 'App\\Models\\User', 3, 'Hortense Collins cferry@example.com', '0e2bc07df5c87d6dd9e1eaed4bb3a77a1546528436d0dccbbb75ef5c2c51fdfb', '[\"*\"]', NULL, NULL, '2023-11-02 04:42:54', '2023-11-02 04:42:54'),
(4, 'App\\Models\\User', 3, 'Hortense Collins cferry@example.com', '8755ce4e53725bdf7a7060761384fc0d4142c13e4f390406f8de67b387905bca', '[\"*\"]', NULL, NULL, '2023-11-02 04:43:33', '2023-11-02 04:43:33'),
(5, 'App\\Models\\User', 3, 'Hortense Collins cferry@example.com', 'a85613c8bd13b6bf4f4a3f5b908429abb9579d4ac1884f0514e8ce12ada2938f', '[\"*\"]', NULL, NULL, '2023-11-02 04:44:49', '2023-11-02 04:44:49'),
(6, 'App\\Models\\User', 3, 'Hortense Collins cferry@example.com', 'b04b4b53025bf0481067764824b5ed40d36065a246cc2dc09c086ed8db47a7b6', '[\"*\"]', '2023-11-02 05:10:18', NULL, '2023-11-02 04:47:31', '2023-11-02 05:10:18'),
(7, 'App\\Models\\User', 3, 'Hortense Collins cferry@example.com', '4fe6a42eb4c68cf9ae031b878bc0dc737b5a176b656ff93c20599561a3a23d65', '[\"*\"]', '2023-11-02 05:25:14', NULL, '2023-11-02 05:14:38', '2023-11-02 05:25:14'),
(8, 'App\\Models\\User', 3, 'Hortense Collins cferry@example.com', '8476da8b5acc7e948f1cb46c91d1ef63ff097c7f65b9062b23c30ebcefa60f5a', '[\"*\"]', '2023-11-02 06:48:14', NULL, '2023-11-02 06:48:13', '2023-11-02 06:48:14'),
(9, 'App\\Models\\User', 3, 'Hortense Collins cferry@example.com', '34edd4386125f9575e57171dba31e6e69041a47cc36a7ff7a4c813da6778f96e', '[\"*\"]', '2023-11-02 07:02:55', NULL, '2023-11-02 07:02:55', '2023-11-02 07:02:55'),
(10, 'App\\Models\\User', 3, 'Hortense Collins cferry@example.com', 'fd5a4fdb46fe0cb649f57dd5bb0d20221d810f3f65931fdded564667ec78bb12', '[\"*\"]', '2023-11-02 07:24:33', NULL, '2023-11-02 07:21:49', '2023-11-02 07:24:33'),
(11, 'App\\Models\\User', 3, 'Hortense Collins cferry@example.com', '5c1d2bf6e3a6449ef72b362a5f482921fba90205c92ad1ec1058458a8586099a', '[\"*\"]', '2023-11-02 08:24:36', NULL, '2023-11-02 07:42:01', '2023-11-02 08:24:36'),
(12, 'App\\Models\\User', 3, 'Hortense Collins cferry@example.com', 'd0b3cbbaa731018a9a3de07de4c048da341daf30b0f565d9974ddf3f1fb6998e', '[\"*\"]', '2023-11-02 10:29:23', NULL, '2023-11-02 10:29:22', '2023-11-02 10:29:23'),
(13, 'App\\Models\\User', 3, 'Hortense Collins cferry@example.com', 'ab8a624790f2251d20c2f66db4f94c5f05c812ead6ce9d16bd7a0bc7aedd5184', '[\"*\"]', '2023-11-02 11:00:26', NULL, '2023-11-02 10:58:25', '2023-11-02 11:00:26'),
(14, 'App\\Models\\User', 3, 'Hortense Collins cferry@example.com', '4fc6b071ba1383dbc9921aa4afb9af98ba69b69e200b5267786883d69dddad4f', '[\"*\"]', '2023-11-02 11:35:34', NULL, '2023-11-02 11:21:36', '2023-11-02 11:35:34'),
(15, 'App\\Models\\User', 3, 'Hortense Collins cferry@example.com', 'bcc77a684078daa36e805c9116a2d32a1292d388f3e480292bac97b0cad55ba1', '[\"*\"]', '2023-11-02 12:04:52', NULL, '2023-11-02 11:36:16', '2023-11-02 12:04:52'),
(16, 'App\\Models\\User', 3, 'Hortense Collins cferry@example.com', '88a54f36f0895f6f70d7937d6cc2a541503caa63cc3c4064910dd235d9cd1467', '[\"*\"]', '2023-11-02 11:46:55', NULL, '2023-11-02 11:46:36', '2023-11-02 11:46:55'),
(17, 'App\\Models\\User', 3, 'Hortense Collins cferry@example.com', '93dc0471d47cf5b1e37502d716c62b485e25d0617a0883c4d9493659d5e3b10a', '[\"*\"]', '2023-11-02 14:50:21', NULL, '2023-11-02 14:31:02', '2023-11-02 14:50:21');

-- --------------------------------------------------------

--
-- Structure de la table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
CREATE TABLE IF NOT EXISTS `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Esse repellat quae velit dolorem consequuntur qui.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(2, 'Quo quae tenetur eaque rem aut.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(3, 'Tenetur eos est minima dolorum voluptas odit omnis et.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(4, 'Repudiandae omnis laboriosam harum delectus amet id.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(5, 'Eaque veritatis culpa magni optio non sapiente reprehenderit.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(6, 'Tempora voluptatibus doloribus sapiente labore quos ducimus.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(7, 'Sit id eos rerum libero enim eaque dicta.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(8, 'Eum fuga quas adipisci facere.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(9, 'Accusantium dolorum sed facere provident veritatis voluptatum.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(10, 'Enim fugit reprehenderit ducimus et.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(11, 'Minus velit dignissimos temporibus cupiditate rerum fugit et.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(12, 'Qui voluptates incidunt provident tempore aut cumque et.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(13, 'Ipsam doloremque sunt cupiditate quia quibusdam.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(14, 'Aliquid veniam labore hic aliquam repudiandae dolorum.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(15, 'Id eius dolorem occaecati voluptatem neque.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(16, 'Ab eveniet dolorem nihil expedita veritatis est quas.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(17, 'Molestias natus vel tenetur rerum quidem libero.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(18, 'Voluptatem quisquam omnis rerum sed.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(19, 'Omnis explicabo alias unde nulla quae inventore in enim.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(20, 'Error pariatur beatae iste et quia.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(21, 'Et cum eius a fuga accusantium error.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(22, 'Aliquam ea corporis molestiae.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(23, 'Perferendis odio incidunt porro vitae totam deleniti aut voluptatem.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(24, 'Sed et eius non ab sunt.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(25, 'Et et recusandae voluptas.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(26, 'Nihil aliquam unde nam nemo repudiandae.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(27, 'Temporibus dignissimos neque ut porro in cumque.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(28, 'Aut quos dignissimos quia iste nesciunt et.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(29, 'Saepe a totam rerum repudiandae aperiam commodi libero.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(30, 'Soluta quam reprehenderit veniam sint asperiores architecto temporibus.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(31, 'Ut consectetur quos accusantium non.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(32, 'Iusto rerum ipsum eius sequi sit.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(33, 'Autem cupiditate tempore rem est quo.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(34, 'Est impedit eum nihil alias ut.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(35, 'Quia blanditiis repellat eligendi et quod explicabo fugit.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(36, 'Laborum ex eos aspernatur et.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(37, 'Deserunt quos natus minima inventore eos.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(38, 'Est cupiditate iusto rem voluptate iste soluta cum.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(39, 'Sed tenetur in non saepe sint dolor.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(40, 'Ut autem exercitationem aut debitis nostrum sunt.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(41, 'Cumque illo quis rerum ea.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(42, 'Animi quam velit est amet.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(43, 'Hic inventore laudantium iusto aliquid illum reprehenderit dolor.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(44, 'Aut dolor sint sapiente placeat tenetur possimus sit.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(45, 'Quis pariatur ratione fuga.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(46, 'Tempora corporis et maiores et.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(47, 'Illo recusandae quaerat est quia dignissimos.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(48, 'Id quaerat doloremque culpa illo.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(49, 'Est ex quo et accusamus.', '2023-11-02 03:36:18', '2023-11-02 03:36:18'),
(50, 'Unde quas voluptatem rem corporis.', '2023-11-02 03:36:18', '2023-11-02 03:36:18');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Vaughn Zulauf', 'jody.halvorson@example.com', '2023-11-02 03:22:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1htJ6ouCRw', '2023-11-02 03:22:34', '2023-11-02 03:22:34'),
(2, 'Dr. Veda Crist III', 'madelyn.collins@example.net', '2023-11-02 03:22:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '5kT4RK8ImF', '2023-11-02 03:22:34', '2023-11-02 03:22:34'),
(3, 'Hortense Collins', 'cferry@example.com', '2023-11-02 03:22:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'dtNdAJ8NLq', '2023-11-02 03:22:34', '2023-11-02 03:22:34'),
(4, 'Allen Runolfsdottir', 'fbuckridge@example.org', '2023-11-02 03:22:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '4cRFTqW6P6', '2023-11-02 03:22:34', '2023-11-02 03:22:34'),
(5, 'Dion Medhurst', 'oconnell.fred@example.net', '2023-11-02 03:22:34', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'rSIkkK1AWw', '2023-11-02 03:22:34', '2023-11-02 03:22:34'),
(6, 'Mrs. Eleanora O\'Hara V', 'yfritsch@example.net', '2023-11-02 03:22:34', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Mud3r8zAxw', '2023-11-02 03:22:34', '2023-11-02 03:22:34'),
(7, 'Mrs. Margie Raynor', 'conroy.patrick@example.org', '2023-11-02 03:22:34', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'V39nea7VPC', '2023-11-02 03:22:34', '2023-11-02 03:22:34'),
(8, 'Rosalinda Rohan', 'ila.block@example.net', '2023-11-02 03:22:34', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'KTo8hKb8ke', '2023-11-02 03:22:34', '2023-11-02 03:22:34'),
(9, 'Aditya Hilpert', 'kilback.deja@example.org', '2023-11-02 03:22:34', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'SwEFR0mlvV', '2023-11-02 03:22:34', '2023-11-02 03:22:34'),
(10, 'Makayla Ferry V', 'bartell.margaret@example.net', '2023-11-02 03:22:34', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'dVgwuyeBKY', '2023-11-02 03:22:34', '2023-11-02 03:22:34'),
(11, 'Bertram Nitzsche', 'aliza36@example.net', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'qrxWtGnClI', '2023-11-02 03:22:34', '2023-11-02 03:22:34'),
(17, 'Avotra Flavien', 'flavien@gmail.com', NULL, '$2y$10$YteeAcIfCytKrzp6zUUXL.5jVzB/fevtdJc9LC/leblxuB49kY.ji', NULL, '2023-11-02 03:54:56', '2023-11-02 03:54:56');

-- --------------------------------------------------------

--
-- Structure de la table `user_subjects`
--

DROP TABLE IF EXISTS `user_subjects`;
CREATE TABLE IF NOT EXISTS `user_subjects` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_subjects_user_id_foreign` (`user_id`),
  KEY `user_subjects_subject_id_foreign` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_subjects`
--

INSERT INTO `user_subjects` (`id`, `user_id`, `subject_id`, `created_at`, `updated_at`) VALUES
(1, 5, 22, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(2, 4, 24, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(3, 6, 20, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(4, 8, 31, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(5, 6, 7, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(6, 2, 49, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(7, 4, 37, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(8, 4, 20, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(9, 7, 13, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(10, 5, 19, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(11, 4, 17, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(12, 10, 43, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(13, 8, 38, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(14, 8, 33, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(15, 10, 40, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(16, 1, 39, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(17, 2, 26, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(18, 8, 39, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(19, 3, 9, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(20, 8, 41, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(21, 8, 34, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(22, 2, 7, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(23, 4, 30, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(24, 5, 49, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(25, 8, 27, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(26, 6, 39, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(27, 8, 41, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(28, 8, 39, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(29, 5, 12, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(30, 7, 4, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(31, 3, 41, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(32, 4, 26, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(33, 9, 8, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(34, 1, 28, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(35, 4, 10, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(36, 10, 45, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(37, 6, 7, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(38, 6, 4, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(39, 1, 22, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(40, 7, 15, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(41, 8, 39, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(42, 6, 35, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(43, 5, 24, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(44, 2, 20, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(45, 3, 4, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(46, 8, 41, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(47, 10, 5, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(48, 2, 34, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(49, 2, 3, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(50, 7, 22, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(51, 10, 35, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(52, 3, 48, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(53, 5, 6, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(54, 2, 20, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(55, 8, 49, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(56, 2, 50, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(57, 10, 5, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(58, 10, 30, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(59, 1, 37, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(60, 5, 45, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(61, 8, 47, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(62, 1, 1, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(63, 8, 50, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(64, 8, 35, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(65, 10, 3, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(66, 6, 15, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(67, 10, 48, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(68, 1, 37, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(69, 9, 1, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(70, 10, 21, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(71, 5, 43, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(72, 10, 47, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(73, 4, 41, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(74, 7, 11, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(75, 9, 15, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(76, 5, 44, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(77, 4, 9, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(78, 10, 21, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(79, 3, 38, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(80, 2, 30, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(81, 10, 24, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(82, 4, 4, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(83, 8, 48, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(84, 2, 32, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(85, 9, 30, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(86, 5, 24, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(87, 3, 19, '2023-11-02 03:42:00', '2023-11-02 03:42:00'),
(88, 8, 10, '2023-11-02 03:42:01', '2023-11-02 03:42:01'),
(89, 9, 13, '2023-11-02 03:42:01', '2023-11-02 03:42:01'),
(90, 8, 14, '2023-11-02 03:42:01', '2023-11-02 03:42:01'),
(91, 4, 36, '2023-11-02 03:42:01', '2023-11-02 03:42:01'),
(92, 1, 7, '2023-11-02 03:42:01', '2023-11-02 03:42:01'),
(93, 3, 35, '2023-11-02 03:42:01', '2023-11-02 03:42:01'),
(94, 8, 49, '2023-11-02 03:42:01', '2023-11-02 03:42:01'),
(95, 5, 5, '2023-11-02 03:42:01', '2023-11-02 03:42:01'),
(96, 2, 39, '2023-11-02 03:42:01', '2023-11-02 03:42:01'),
(97, 3, 26, '2023-11-02 03:42:01', '2023-11-02 03:42:01'),
(98, 9, 25, '2023-11-02 03:42:01', '2023-11-02 03:42:01'),
(99, 10, 10, '2023-11-02 03:42:01', '2023-11-02 03:42:01'),
(100, 9, 12, '2023-11-02 03:42:01', '2023-11-02 03:42:01');

-- --------------------------------------------------------

--
-- Structure de la table `websockets_statistics_entries`
--

DROP TABLE IF EXISTS `websockets_statistics_entries`;
CREATE TABLE IF NOT EXISTS `websockets_statistics_entries` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `app_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peak_connection_count` int(11) NOT NULL,
  `websocket_message_count` int(11) NOT NULL,
  `api_message_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `user_subjects`
--
ALTER TABLE `user_subjects`
  ADD CONSTRAINT `user_subjects_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_subjects_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
