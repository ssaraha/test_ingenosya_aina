-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 05 oct. 2021 à 06:23
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `test_ingenosya`
--

-- --------------------------------------------------------

--
-- Structure de la table `codepostales`
--

DROP TABLE IF EXISTS `codepostales`;
CREATE TABLE IF NOT EXISTS `codepostales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codepostal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `codepostales`
--

INSERT INTO `codepostales` (`id`, `codepostal`, `created_at`, `updated_at`) VALUES
(1, '101', '2021-10-05 05:52:00', '2021-10-05 05:52:00'),
(2, '102', '2021-10-05 05:52:00', '2021-10-05 05:52:00');

-- --------------------------------------------------------

--
-- Structure de la table `dirigeants`
--

DROP TABLE IF EXISTS `dirigeants`;
CREATE TABLE IF NOT EXISTS `dirigeants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '(DC2Type:datetime_immutable)',
  `sexe` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `dirigeants`
--

INSERT INTO `dirigeants` (`id`, `nom`, `prenom`, `adresse_email`, `created_at`, `updated_at`, `sexe`) VALUES
(1, 'john', 'doe', 'johndoe@gmail.com', '2021-10-05 02:19:20', NULL, 'homme');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20211004164024', '2021-10-04 16:42:55', 476),
('DoctrineMigrations\\Version20211004170414', '2021-10-04 17:04:36', 229),
('DoctrineMigrations\\Version20211004175317', '2021-10-04 17:54:14', 140),
('DoctrineMigrations\\Version20211004180024', '2021-10-04 18:01:34', 205),
('DoctrineMigrations\\Version20211005001944', '2021-10-05 00:20:17', 948),
('DoctrineMigrations\\Version20211005014830', '2021-10-05 01:48:54', 206),
('DoctrineMigrations\\Version20211005023529', '2021-10-05 02:35:59', 166),
('DoctrineMigrations\\Version20211005025032', '2021-10-05 02:50:51', 165);

-- --------------------------------------------------------

--
-- Structure de la table `societes`
--

DROP TABLE IF EXISTS `societes`;
CREATE TABLE IF NOT EXISTS `societes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '(DC2Type:datetime_immutable)',
  `codepostal_id` int(11) DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `ville` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_AEC76507C9B1D722` (`codepostal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `societe_type_societe`
--

DROP TABLE IF EXISTS `societe_type_societe`;
CREATE TABLE IF NOT EXISTS `societe_type_societe` (
  `societe_id` int(11) NOT NULL,
  `type_societe_id` int(11) NOT NULL,
  PRIMARY KEY (`societe_id`,`type_societe_id`),
  KEY `IDX_FB9E3F15FCF77503` (`societe_id`),
  KEY `IDX_FB9E3F15E1F4A326` (`type_societe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `typesocietes`
--

DROP TABLE IF EXISTS `typesocietes`;
CREATE TABLE IF NOT EXISTS `typesocietes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `typesocietes`
--

INSERT INTO `typesocietes` (`id`, `type`, `created_at`, `updated_at`) VALUES
(1, 'SARL', '2021-10-05 06:53:51', '2021-10-05 06:53:51'),
(2, 'EURL', '2021-10-05 06:53:51', '2021-10-05 06:53:51'),
(3, 'SELARL', '2021-10-05 06:53:55', '2021-10-05 06:54:27'),
(4, 'SA', '2021-10-05 06:54:27', '2021-10-05 06:54:27'),
(5, 'SAS', '2021-10-05 06:54:46', '2021-10-05 06:54:46'),
(6, 'SASU', '2021-10-05 06:54:46', '2021-10-05 06:54:46'),
(7, '', '2021-10-05 06:55:07', '2021-10-05 06:55:07'),
(8, 'SCP', '2021-10-05 06:55:07', '2021-10-05 06:55:07');

-- --------------------------------------------------------

--
-- Structure de la table `villes`
--

DROP TABLE IF EXISTS `villes`;
CREATE TABLE IF NOT EXISTS `villes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '(DC2Type:datetime_immutable)',
  `codepostal_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_19209FD8C9B1D722` (`codepostal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `villes`
--

INSERT INTO `villes` (`id`, `nom`, `created_at`, `updated_at`, `codepostal_id`) VALUES
(1, 'Anosibe', '2021-10-05 05:52:25', '2021-10-05 05:52:25', 1),
(2, 'Anosy', '2021-10-05 05:52:25', '2021-10-05 05:52:25', 1),
(3, 'Anosizato', '2021-10-05 05:52:50', '2021-10-05 05:52:50', 2),
(4, 'Tanjombato', '2021-10-05 05:52:50', '2021-10-05 05:52:50', 2),
(5, 'Analakely', '2021-10-05 05:53:09', '2021-10-05 05:53:09', 1),
(6, 'Itaosy', '2021-10-05 05:53:09', '2021-10-05 05:53:09', 2);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `societes`
--
ALTER TABLE `societes`
  ADD CONSTRAINT `FK_AEC76507C9B1D722` FOREIGN KEY (`codepostal_id`) REFERENCES `codepostales` (`id`);

--
-- Contraintes pour la table `societe_type_societe`
--
ALTER TABLE `societe_type_societe`
  ADD CONSTRAINT `FK_FB9E3F15E1F4A326` FOREIGN KEY (`type_societe_id`) REFERENCES `typesocietes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_FB9E3F15FCF77503` FOREIGN KEY (`societe_id`) REFERENCES `societes` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `villes`
--
ALTER TABLE `villes`
  ADD CONSTRAINT `FK_19209FD8C9B1D722` FOREIGN KEY (`codepostal_id`) REFERENCES `codepostales` (`id`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
