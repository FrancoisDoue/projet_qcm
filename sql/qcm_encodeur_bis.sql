-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 23 sep. 2022 à 13:37
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
-- Structure de la table `administrateur`
--

DROP TABLE IF EXISTS `administrateur`;
CREATE TABLE IF NOT EXISTS `administrateur` (
  `ID_ADMIN` int(5) NOT NULL AUTO_INCREMENT,
  `LOGIN_ADMIN` varchar(50) NOT NULL,
  `PSW_ADMIN` varchar(60) NOT NULL,
  PRIMARY KEY (`ID_ADMIN`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `administrateur`
--

INSERT INTO `administrateur` (`ID_ADMIN`, `LOGIN_ADMIN`, `PSW_ADMIN`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `candidat`
--

DROP TABLE IF EXISTS `candidat`;
CREATE TABLE IF NOT EXISTS `candidat` (
  `ID_CAND` int(5) NOT NULL AUTO_INCREMENT,
  `NOM_CAND` varchar(50) NOT NULL,
  `PRENOM_CAND` varchar(50) NOT NULL,
  `MAIL_CAND` varchar(50) NOT NULL,
  `TEL_CAND` int(11) NOT NULL,
  PRIMARY KEY (`ID_CAND`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `ID_CAT` int(5) NOT NULL AUTO_INCREMENT,
  `LIB_CAT` varchar(25) NOT NULL,
  PRIMARY KEY (`ID_CAT`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`ID_CAT`, `LIB_CAT`) VALUES
(6, 'java');

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `ID_QUESTION` int(5) NOT NULL AUTO_INCREMENT,
  `ENONC_QUEST` varchar(255) NOT NULL,
  `IMG_QUEST` varchar(255) NOT NULL,
  `ID_CAT` int(5) NOT NULL,
  PRIMARY KEY (`ID_QUESTION`),
  KEY `FK_QUESTION_IDCAT` (`ID_CAT`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `question`
--

INSERT INTO `question` (`ID_QUESTION`, `ENONC_QUEST`, `IMG_QUEST`, `ID_CAT`) VALUES
(7, 'question 1', '', 6),
(8, 'question 3', '', 6);

-- --------------------------------------------------------

--
-- Structure de la table `quest_controle`
--

DROP TABLE IF EXISTS `quest_controle`;
CREATE TABLE IF NOT EXISTS `quest_controle` (
  `ID_Q_CONTROL` int(5) NOT NULL AUTO_INCREMENT,
  `ENONC_Q_CONTROL` varchar(255) NOT NULL,
  `ENONC_Q_CONTROLE2` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_Q_CONTROL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `reponse`
--

DROP TABLE IF EXISTS `reponse`;
CREATE TABLE IF NOT EXISTS `reponse` (
  `ID_REP` int(5) NOT NULL AUTO_INCREMENT,
  `TXT_REP` varchar(255) NOT NULL,
  `ID_QUESTION` int(5) NOT NULL,
  `ID_QUESTION_1` int(5) NOT NULL,
  PRIMARY KEY (`ID_REP`),
  KEY `FK_QUESTION_ID` (`ID_QUESTION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `rep_controle`
--

DROP TABLE IF EXISTS `rep_controle`;
CREATE TABLE IF NOT EXISTS `rep_controle` (
  `ID_REP_CONTROL` int(5) NOT NULL AUTO_INCREMENT,
  `REP_CONTROLE` varchar(50) NOT NULL,
  `ID_Q_CONTROL` int(5) NOT NULL,
  `ID_CAND` int(5) NOT NULL,
  PRIMARY KEY (`ID_REP_CONTROL`),
  KEY `FK_REP_CONTROL_CAND` (`ID_CAND`),
  KEY `FK_REP_CONTROL_Q` (`ID_Q_CONTROL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `resultat`
--

DROP TABLE IF EXISTS `resultat`;
CREATE TABLE IF NOT EXISTS `resultat` (
  `ID_RESULT` int(5) NOT NULL AUTO_INCREMENT,
  `DATE_RESULT` datetime NOT NULL,
  `ID_CAND` int(5) NOT NULL,
  PRIMARY KEY (`ID_RESULT`),
  KEY `FK_RESULT_CAND` (`ID_CAND`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `sont_enregistrees`
--

DROP TABLE IF EXISTS `sont_enregistrees`;
CREATE TABLE IF NOT EXISTS `sont_enregistrees` (
  `ID_QUESTION` int(5) NOT NULL,
  `ID_RESULT` int(5) NOT NULL,
  `ID_REP_CONTROL` int(5) NOT NULL,
  `ID_Q_CONTROL` int(5) NOT NULL,
  PRIMARY KEY (`ID_QUESTION`,`ID_RESULT`,`ID_REP_CONTROL`,`ID_Q_CONTROL`),
  KEY `FK_QUESTION_IDR_ENRE` (`ID_RESULT`),
  KEY `FK_QUESTION_IDRP_ENRE` (`ID_REP_CONTROL`),
  KEY `FK_QUESTION_IDQC_ENRE` (`ID_Q_CONTROL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `FK_QUESTION_IDCAT` FOREIGN KEY (`ID_CAT`) REFERENCES `categorie` (`ID_CAT`);

--
-- Contraintes pour la table `reponse`
--
ALTER TABLE `reponse`
  ADD CONSTRAINT `FK_QUESTION_ID` FOREIGN KEY (`ID_QUESTION`) REFERENCES `question` (`ID_QUESTION`);

--
-- Contraintes pour la table `rep_controle`
--
ALTER TABLE `rep_controle`
  ADD CONSTRAINT `FK_REP_CONTROL_CAND` FOREIGN KEY (`ID_CAND`) REFERENCES `candidat` (`ID_CAND`),
  ADD CONSTRAINT `FK_REP_CONTROL_Q` FOREIGN KEY (`ID_Q_CONTROL`) REFERENCES `quest_controle` (`ID_Q_CONTROL`);

--
-- Contraintes pour la table `resultat`
--
ALTER TABLE `resultat`
  ADD CONSTRAINT `FK_RESULT_CAND` FOREIGN KEY (`ID_CAND`) REFERENCES `candidat` (`ID_CAND`);

--
-- Contraintes pour la table `sont_enregistrees`
--
ALTER TABLE `sont_enregistrees`
  ADD CONSTRAINT `FK_QUESTION_IDQC_ENRE` FOREIGN KEY (`ID_Q_CONTROL`) REFERENCES `quest_controle` (`ID_Q_CONTROL`),
  ADD CONSTRAINT `FK_QUESTION_IDQ_ENRE` FOREIGN KEY (`ID_QUESTION`) REFERENCES `question` (`ID_QUESTION`),
  ADD CONSTRAINT `FK_QUESTION_IDRP_ENRE` FOREIGN KEY (`ID_REP_CONTROL`) REFERENCES `rep_controle` (`ID_REP_CONTROL`),
  ADD CONSTRAINT `FK_QUESTION_IDR_ENRE` FOREIGN KEY (`ID_RESULT`) REFERENCES `resultat` (`ID_RESULT`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
