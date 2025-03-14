-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 14 mars 2025 à 11:22
-- Version du serveur : 9.1.0
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `vehicloc`
--

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20250307115850', '2025-03-07 11:59:31', 90);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `voiture`
--

DROP TABLE IF EXISTS `voiture`;
CREATE TABLE IF NOT EXISTS `voiture` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix_mensuel` double(10,2) NOT NULL,
  `prix_journalier` double(10,2) NOT NULL,
  `places` int NOT NULL,
  `transmission` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `voiture`
--

INSERT INTO `voiture` (`id`, `nom`, `description`, `prix_mensuel`, `prix_journalier`, `places`, `transmission`) VALUES
(1, 'Renault Twingo', 'BMW est connu pour ses voitures puissantes et luxueuses - la BMW iX ne fait pas exception. Avec une puissance allant de 326 ch (BMW iX 40) à 523 ch (BMW iX 50) et une autonomie de 408 (BMW iX 40) à 590 kilomètres (BMW iX 50), la BMW iX offre tout ce que l\'on peut attendre d\'une voiture électrique.', 900.00, 39.14, 4, 0),
(2, 'Renault Clio', 'BMW est connu pour ses voitures puissantes et luxueuses - la BMW iX ne fait pas exception. Avec une puissance allant de 326 ch (BMW iX 40) à 523 ch (BMW iX 50) et une autonomie de 408 (BMW iX 40) à 590 kilomètres (BMW iX 50), la BMW iX offre tout ce que l\'on peut attendre d\'une voiture électrique.', 850.00, 38.64, 4, 1),
(3, 'BMX IX (Electric)', 'BMW est connu pour ses voitures puissantes et luxueuses - la BMW iX ne fait pas exception. Avec une puissance allant de 326 ch (BMW iX 40) à 523 ch (BMW iX 50) et une autonomie de 408 (BMW iX 40) à 590 kilomètres (BMW iX 50), la BMW iX offre tout ce que l\'on peut attendre d\'une voiture électrique.', 950.00, 42.40, 4, 1),
(4, 'Renault Zoé', 'BMW est connu pour ses voitures puissantes et luxueuses - la BMW iX ne fait pas exception. Avec une puissance allant de 326 ch (BMW iX 40) à 523 ch (BMW iX 50) et une autonomie de 408 (BMW iX 40) à 590 kilomètres (BMW iX 50), la BMW iX offre tout ce que l\'on peut attendre d\'une voiture électrique.', 900.00, 39.14, 4, 1),
(5, 'Citroën Ami', 'BMW est connu pour ses voitures puissantes et luxueuses - la BMW iX ne fait pas exception. Avec une puissance allant de 326 ch (BMW iX 40) à 523 ch (BMW iX 50) et une autonomie de 408 (BMW iX 40) à 590 kilomètres (BMW iX 50), la BMW iX offre tout ce que l\'on peut attendre d\'une voiture électrique.', 799.00, 28.59, 4, 1),
(6, 'Opel Corsa', 'BMW est connu pour ses voitures puissantes et luxueuses - la BMW iX ne fait pas exception. Avec une puissance allant de 326 ch (BMW iX 40) à 523 ch (BMW iX 50) et une autonomie de 408 (BMW iX 40) à 590 kilomètres (BMW iX 50), la BMW iX offre tout ce que l\'on peut attendre d\'une voiture électrique.', 820.00, 36.38, 4, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
