-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


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
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table umkmposdb.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table umkmposdb.migrations: ~7 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(13, '2014_10_12_000000_create_users_table', 1),
	(14, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(15, '2014_10_12_100000_create_password_resets_table', 1),
	(16, '2019_08_19_000000_create_failed_jobs_table', 1),
	(17, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(18, '2024_05_12_053820_create_m_projects_table', 1),
	(19, '2024_05_15_090147_create_m_access_users_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table umkmposdb.m_access_users
DROP TABLE IF EXISTS `m_access_users`;
CREATE TABLE IF NOT EXISTS `m_access_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` varchar(255) NOT NULL,
  `branch_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `actived` int(11) NOT NULL DEFAULT 1,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `modification_at` timestamp NULL DEFAULT NULL,
  `modification_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table umkmposdb.m_access_users: ~1 rows (approximately)
DELETE FROM `m_access_users`;
/*!40000 ALTER TABLE `m_access_users` DISABLE KEYS */;
INSERT INTO `m_access_users` (`id`, `pid`, `branch_id`, `user_id`, `actived`, `deleted`, `modification_at`, `modification_by`, `deleted_at`, `deleted_by`, `created_at`, `updated_at`) VALUES
	(1, 'baa5c94fd97db608f8820a0402d87262b99f4139b5ff7f8d0aa27254a66039ce', '1', '12', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `m_access_users` ENABLE KEYS */;

-- Dumping structure for table umkmposdb.m_projects
DROP TABLE IF EXISTS `m_projects`;
CREATE TABLE IF NOT EXISTS `m_projects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `pid` varchar(255) NOT NULL,
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table umkmposdb.m_projects: ~1 rows (approximately)
DELETE FROM `m_projects`;
/*!40000 ALTER TABLE `m_projects` DISABLE KEYS */;
INSERT INTO `m_projects` (`id`, `owner_id`, `pid`, `name`, `address`, `province`, `city`, `zipcode`, `npwp`, `phone`, `is_headquarters`, `actived`, `deleted`, `deleted_at`, `deleted_by`, `created_at`, `updated_at`) VALUES
	(1, 12, 'baa5c94fd97db608f8820a0402d87262b99f4139b5ff7f8d0aa27254a66039ce', 'Laundry Pasti Bersih', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, NULL, NULL, '2024-05-15 09:33:54', NULL);
/*!40000 ALTER TABLE `m_projects` ENABLE KEYS */;

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
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

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
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;

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
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Dumping structure for procedure umkmposdb.sp_read_master_project
DROP PROCEDURE IF EXISTS `sp_read_master_project`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_read_master_project`(
	IN `PARAM_OWNER_ID` INT
)
BEGIN
    DECLARE sqlQuery VARCHAR(1000);

    SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    SET sqlQuery = 'SELECT usr.email, mp.* FROM m_projects mp join users usr on mp.owner_id = usr.id  WHERE mp.DELETED = 0 AND usr.DELETED=0';

    IF PARAM_OWNER_ID IS NOT NULL AND PARAM_OWNER_ID != 0 THEN
        SET sqlQuery = CONCAT(sqlQuery, ' AND OWNER_ID = ', CAST(PARAM_OWNER_ID AS CHAR));
    END IF;

    PREPARE stmt FROM sqlQuery;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
END//
DELIMITER ;

-- Dumping structure for procedure umkmposdb.sp_read_user_by_email
DROP PROCEDURE IF EXISTS `sp_read_user_by_email`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_read_user_by_email`(IN `PARAM_EMAIL` VARCHAR(255))
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_register_user`(IN `PARAM_FULLNAME` VARCHAR(255), IN `PARAM_USER_EMAIL` VARCHAR(255), IN `PARAM_USER_PASS` TEXT, IN `PARAM_ROLE` VARCHAR(64), IN `PARAM_USER_TOKEN` TEXT, IN `PARAM_PID` TEXT)
BEGIN
    INSERT INTO users (
        name
        , fullname
        , email
        , password
        , role
        , remember_token
        , created_at
        , pid
    )
    VALUES (
        PARAM_FULLNAME
,PARAM_FULLNAME
        , PARAM_USER_EMAIL
		  , PARAM_USER_PASS
		  , PARAM_ROLE
		  , PARAM_USER_TOKEN
		  , NOW()
, PARAM_PID

    );

    
END//
DELIMITER ;

-- Dumping structure for procedure umkmposdb.sp_update_master_project
DROP PROCEDURE IF EXISTS `sp_update_master_project`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_master_project`(IN `PARAM_NAME` VARCHAR(255), IN `PARAM_ADDRESS` TEXT, IN `PARAM_PROVINCE` VARCHAR(255), IN `PARAM_CITY` VARCHAR(255), IN `PARAM_ZIPCODE` INT, IN `PARAM_NPWP` VARCHAR(50), IN `PARAM_PHONE` VARCHAR(50), IN `PARAM_ISHEADQUARTERS` INT, IN `PARAM_ID` INT, IN `PARAM_ACTIVED` INT)
BEGIN
 SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
 
	UPDATE m_projects 
	set
		name = PARAM_NAME
		, address = PARAM_ADDRESS
		, province = PARAM_PROVINCE
		, city = PARAM_CITY
		, zipcode = PARAM_ZIPCODE
		, npwp = PARAM_NPWP
		, phone = PARAM_PHONE
		, is_headquarters  = PARAM_ISHEADQUARTERS
		, updated_at = NOW()
, actived = PARAM_ACTIVED
	WHERE
		id = PARAM_ID
		AND DELETED = 0
		;
	
    
    SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;

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
  `pid` varchar(255) NOT NULL,
  `actived` int(11) NOT NULL DEFAULT 1,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `deleted_on` timestamp NULL DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table umkmposdb.users: ~12 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `fullname`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`, `pid`, `actived`, `deleted`, `deleted_on`, `deleted_by`) VALUES
	(1, 'Theo Ankunding', 'Alva Bailey', 'noconnell@example.net', '2024-05-15 09:32:21', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'eswxsGhuCR', '2024-05-15 09:32:21', '2024-05-15 09:32:21', 'staff', 'bIJymhvy4vXQMfyfOv', 1, 0, NULL, NULL),
	(2, 'Fannie Simonis', 'Miss Modesta Osinski', 'benedict52@example.org', '2024-05-15 09:32:21', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '7gBIS1xTgM', '2024-05-15 09:32:21', '2024-05-15 09:32:21', 'staff', '8THr8XKQU4tRZIXKxc', 1, 0, NULL, NULL),
	(3, 'Sabryna Hill', 'Kim Walsh Jr.', 'xbalistreri@example.com', '2024-05-15 09:32:21', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ZPd34nqQFw', '2024-05-15 09:32:21', '2024-05-15 09:32:21', 'staff', 'FpQsKWHXsAkWyBcNw8', 1, 0, NULL, NULL),
	(4, 'Olga Labadie', 'Mrs. Idella Cartwright', 'stamm.telly@example.com', '2024-05-15 09:32:21', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'qUfOisPQo0', '2024-05-15 09:32:22', '2024-05-15 09:32:22', 'staff', '3WT5nODMXCYMBqtEZG', 1, 0, NULL, NULL),
	(5, 'Royal Powlowski', 'Prof. Jermain Kreiger PhD', 'fkreiger@example.net', '2024-05-15 09:32:21', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'VMHmNlTbAS', '2024-05-15 09:32:22', '2024-05-15 09:32:22', 'staff', 'H5WrXbaZsVONoFRs3J', 1, 0, NULL, NULL),
	(6, 'Dr. Gunnar Johnson', 'Prof. Cathy Abernathy', 'moen.irma@example.net', '2024-05-15 09:32:21', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '70Hs0VEgNp', '2024-05-15 09:32:22', '2024-05-15 09:32:22', 'staff', 'Xdnnqeg2DOhuZoARrI', 1, 0, NULL, NULL),
	(7, 'Dr. Makenna Gutkowski', 'Prof. Michael Kihn PhD', 'nicola64@example.com', '2024-05-15 09:32:21', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Aq7b3GxQ9o', '2024-05-15 09:32:22', '2024-05-15 09:32:22', 'staff', 'eisPNb01zRK4uytEe2', 1, 0, NULL, NULL),
	(8, 'Margarita Schimmel', 'Samson Blanda', 'hrowe@example.com', '2024-05-15 09:32:21', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'sjqEUzwNta', '2024-05-15 09:32:22', '2024-05-15 09:32:22', 'staff', 'eYJ9dClegS0MfootL2', 1, 0, NULL, NULL),
	(9, 'Mr. Rowland Leffler', 'Eino Anderson', 'qheaney@example.net', '2024-05-15 09:32:21', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '8FaNJWB514', '2024-05-15 09:32:22', '2024-05-15 09:32:22', 'staff', 'G6Lz8FOlJtFwBMme44', 1, 0, NULL, NULL),
	(10, 'Geovanny Huels', 'Penelope Upton', 'bernhard.treva@example.org', '2024-05-15 09:32:21', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'HdXJ4usBah', '2024-05-15 09:32:22', '2024-05-15 09:32:22', 'staff', 'MKdpe0EmckhmcOTpGr', 1, 0, NULL, NULL),
	(11, 'Administrator', 'Administrator', 'admin@admin.com', '2024-05-15 09:32:22', '$2y$10$wHIpbO4/AXUhyEMatkPUee6W7j/S.FmwRr1qKGX.3kywMX4xke3D6', 'wTmq8beNP2', '2024-05-15 09:32:22', '2024-05-15 09:32:22', 'owner', 'test', 1, 0, NULL, NULL),
	(12, 'Indrat Saputra', 'Indrat Saputra', 'indrat@mail.com', NULL, '$2y$10$h7zo3Zxme/JLPFnMaeor3uiBq9ol1yt84n4fJiEMx8fuid4Hghq32', 'yhsk1DGuHpn4Ne2hGvEp6rb6P0UV5c25WpA1R7MO', '2024-05-15 16:33:53', NULL, 'owner', 'baa5c94fd97db608f8820a0402d87262b99f4139b5ff7f8d0aa27254a66039ce', 1, 0, NULL, NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
