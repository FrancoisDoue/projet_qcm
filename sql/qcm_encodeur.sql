-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 21 sep. 2022 à 13:00
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
-- Base de données : `qcm_encodeur`
--
CREATE DATABASE IF NOT EXISTS `qcm_encodeur` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `qcm_encodeur`;

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id_admin` int(2) NOT NULL AUTO_INCREMENT,
  `login_admin` varchar(25) NOT NULL,
  `psw_admin` varchar(60) NOT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id_admin`, `login_admin`, `psw_admin`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `candidat`
--

DROP TABLE IF EXISTS `candidat`;
CREATE TABLE IF NOT EXISTS `candidat` (
  `id_cand` int(5) NOT NULL AUTO_INCREMENT,
  `nom_cand` varchar(50) NOT NULL,
  `prenom_cand` varchar(50) NOT NULL,
  `mail_cand` varchar(50) NOT NULL,
  `tel_cand` int(10) NOT NULL,
  PRIMARY KEY (`id_cand`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `id_question` int(5) NOT NULL AUTO_INCREMENT,
  `enonc_quest` varchar(255) NOT NULL,
  `enonc_quest2` varchar(255) DEFAULT NULL,
  `img_quest` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_question`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `question`
--

INSERT INTO `question` (`id_question`, `enonc_quest`, `enonc_quest2`, `img_quest`) VALUES
(1, 'question test; la réponse est vrai', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `reponse`
--

DROP TABLE IF EXISTS `reponse`;
CREATE TABLE IF NOT EXISTS `reponse` (
  `id_reponse` int(5) NOT NULL,
  `txt_reponse` varchar(255) NOT NULL,
  PRIMARY KEY (`id_reponse`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `reponse`
--

INSERT INTO `reponse` (`id_reponse`, `txt_reponse`) VALUES
(11, 'Vrai'),
(12, 'Faux');

-- --------------------------------------------------------

--
-- Structure de la table `rep_quest`
--

DROP TABLE IF EXISTS `rep_quest`;
CREATE TABLE IF NOT EXISTS `rep_quest` (
  `id_question` int(5) NOT NULL,
  `rep_possible` varchar(255) DEFAULT NULL,
  `reponse` varchar(255) DEFAULT NULL,
  KEY `fk-a-reponses` (`id_question`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `rep_quest`
--

INSERT INTO `rep_quest` (`id_question`, `rep_possible`, `reponse`) VALUES
(1, '11,12', '11');

-- --------------------------------------------------------

--
-- Structure de la table `resultat`
--

DROP TABLE IF EXISTS `resultat`;
CREATE TABLE IF NOT EXISTS `resultat` (
  `id_result` int(5) NOT NULL AUTO_INCREMENT,
  `id_cand` int(5) NOT NULL,
  `date_result` datetime NOT NULL,
  `tab_quest` varchar(255) NOT NULL,
  `tab_rep` varchar(255) NOT NULL,
  PRIMARY KEY (`id_result`),
  KEY `fk-a-pour-result` (`id_cand`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `rep_quest`
--
ALTER TABLE `rep_quest`
  ADD CONSTRAINT `fk-a-reponses` FOREIGN KEY (`id_question`) REFERENCES `question` (`id_question`);

--
-- Contraintes pour la table `resultat`
--
ALTER TABLE `resultat`
  ADD CONSTRAINT `fk-a-pour-result` FOREIGN KEY (`id_cand`) REFERENCES `candidat` (`id_cand`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
