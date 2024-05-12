-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for umkmposdb
DROP DATABASE IF EXISTS `umkmposdb`;
CREATE DATABASE IF NOT EXISTS `umkmposdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `umkmposdb`;

-- Dumping structure for table umkmposdb.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table umkmposdb.failed_jobs: ~0 rows (approximately)
DELETE FROM `failed_jobs`;

-- Dumping structure for table umkmposdb.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table umkmposdb.migrations: ~6 rows (approximately)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(3, '2014_10_12_100000_create_password_resets_table', 1),
	(4, '2019_08_19_000000_create_failed_jobs_table', 1),
	(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(6, '2024_05_12_053820_create_m_projects_table', 1);

-- Dumping structure for table umkmposdb.m_projects
DROP TABLE IF EXISTS `m_projects`;
CREATE TABLE IF NOT EXISTS `m_projects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `npwp` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `is_headquarters` int(11) NOT NULL DEFAULT 0,
  `actived` int(11) NOT NULL DEFAULT 1,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table umkmposdb.m_projects: ~0 rows (approximately)
DELETE FROM `m_projects`;
INSERT INTO `m_projects` (`id`, `owner_id`, `name`, `address`, `province`, `city`, `zipcode`, `npwp`, `phone`, `is_headquarters`, `actived`, `deleted`, `created_at`, `updated_at`) VALUES
	(1, 12, 'laundry koin', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, '2024-05-12 02:12:21', NULL);

-- Dumping structure for table umkmposdb.password_resets
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table umkmposdb.password_resets: ~0 rows (approximately)
DELETE FROM `password_resets`;

-- Dumping structure for table umkmposdb.password_reset_tokens
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table umkmposdb.password_reset_tokens: ~0 rows (approximately)
DELETE FROM `password_reset_tokens`;

-- Dumping structure for table umkmposdb.personal_access_tokens
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table umkmposdb.personal_access_tokens: ~0 rows (approximately)
DELETE FROM `personal_access_tokens`;

-- Dumping structure for procedure umkmposdb.sp_read_user_by_email
DROP PROCEDURE IF EXISTS `sp_read_user_by_email`;
DELIMITER //
CREATE PROCEDURE `sp_read_user_by_email`(IN `PARAM_EMAIL` VARCHAR(255))
BEGIN
 SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    SELECT id, fullname, email
FROM users
WHERE email LIKE CONCAT('%', PARAM_EMAIL, '%') AND ACTIVED = 1 AND DELETED = 0;

    
    SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;

END//
DELIMITER ;

-- Dumping structure for procedure umkmposdb.sp_register_user
DROP PROCEDURE IF EXISTS `sp_register_user`;
DELIMITER //
CREATE PROCEDURE `sp_register_user`(IN `PARAM_FULLNAME` VARCHAR(255), IN `PARAM_USER_EMAIL` VARCHAR(255), IN `PARAM_USER_PASS` TEXT, IN `PARAM_ROLE` VARCHAR(64), IN `PARAM_USER_TOKEN` TEXT)
BEGIN
    INSERT INTO users (
        name
        , fullname
        , email
        , password
        , role
        , remember_token
        , created_at
    )
    VALUES (
        PARAM_FULLNAME
,PARAM_FULLNAME
        , PARAM_USER_EMAIL
		  , PARAM_USER_PASS
		  , PARAM_ROLE
		  , PARAM_USER_TOKEN
		  , NOW()
    );

    
END//
DELIMITER ;

-- Dumping structure for table umkmposdb.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'staff',
  `actived` int(11) NOT NULL DEFAULT 1,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `deleted_on` timestamp NULL DEFAULT NULL,
  `deleted_by` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table umkmposdb.users: ~11 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `name`, `fullname`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`, `actived`, `deleted`, `deleted_on`, `deleted_by`) VALUES
	(1, 'Miss Alanna Daniel V', 'Ima Monahan I', 'rogahn.beatrice@example.net', '2024-05-12 02:10:43', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Qnr2CqYRPO', '2024-05-12 02:10:43', '2024-05-12 02:10:43', 'staff', 1, 0, NULL, NULL),
	(2, 'Murray Towne', 'Kaleb Harber', 'becker.eliza@example.net', '2024-05-12 02:10:43', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'qVghtHkhp1', '2024-05-12 02:10:43', '2024-05-12 02:10:43', 'staff', 1, 0, NULL, NULL),
	(3, 'Carley Smith MD', 'Corbin Keebler', 'nader.afton@example.org', '2024-05-12 02:10:43', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'PjtjMYNvkb', '2024-05-12 02:10:43', '2024-05-12 02:10:43', 'staff', 1, 0, NULL, NULL),
	(4, 'Herman Kovacek', 'Zachariah Swaniawski', 'mcglynn.nikki@example.org', '2024-05-12 02:10:43', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Euwe4qHXdI', '2024-05-12 02:10:43', '2024-05-12 02:10:43', 'staff', 1, 0, NULL, NULL),
	(5, 'Ronaldo Rutherford', 'Ms. Thelma Kling', 'beer.kiana@example.com', '2024-05-12 02:10:43', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'pDofPeWsrh', '2024-05-12 02:10:43', '2024-05-12 02:10:43', 'staff', 1, 0, NULL, NULL),
	(6, 'Bulah Jakubowski', 'Ora Collins', 'lucienne76@example.com', '2024-05-12 02:10:43', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'dAX25MyGPB', '2024-05-12 02:10:43', '2024-05-12 02:10:43', 'staff', 1, 0, NULL, NULL),
	(7, 'Dr. Reggie Kling DDS', 'Destiney Renner MD', 'jmorissette@example.net', '2024-05-12 02:10:43', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'bPW0PBvFZl', '2024-05-12 02:10:43', '2024-05-12 02:10:43', 'staff', 1, 0, NULL, NULL),
	(8, 'Elvie Dietrich DVM', 'Kenneth Predovic', 'brandi13@example.net', '2024-05-12 02:10:43', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Bh9VjiJ4JX', '2024-05-12 02:10:43', '2024-05-12 02:10:43', 'staff', 1, 0, NULL, NULL),
	(9, 'Zita Hoppe', 'Janie Pfannerstill', 'fritz36@example.com', '2024-05-12 02:10:43', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'R9dD4H7jmy', '2024-05-12 02:10:43', '2024-05-12 02:10:43', 'staff', 1, 0, NULL, NULL),
	(10, 'Prof. Josiane Okuneva', 'Dr. Johann Rippin V', 'kadin.jerde@example.com', '2024-05-12 02:10:43', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'CgPs1vdNYq', '2024-05-12 02:10:43', '2024-05-12 02:10:43', 'staff', 1, 0, NULL, NULL),
	(11, 'Administrator', 'Administrator', 'admin@admin.com', '2024-05-12 02:10:43', '$2y$10$sEaPqM/rx0K41TPVMYdq8OsesnBgdk1GA50s4uq4iS5eWGPaRihf6', 'EZiQYwVtcr', '2024-05-12 02:10:43', '2024-05-12 02:10:43', 'owner', 1, 0, NULL, NULL),
	(12, 'jojo', 'jojo', 'jojo@mail.com', NULL, '$2y$10$x4jxoNzt.j35PRZo2V.CoemoKvW0WlNFTSNZVNBIdPVJBashOgw8W', 'MfhYjaYSMwH4a3SDxOFb16ItqntRiI1xyNl3zzp18gsRK1VGLHY9kQDUxcHD', '2024-05-12 09:12:21', NULL, 'owner', 1, 0, NULL, NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
