-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : db.3wa.io
-- Généré le : mer. 18 fév. 2026 à 22:46
-- Version du serveur :  5.7.33-0ubuntu0.18.04.1-log
-- Version de PHP : 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `princiliatsaguetefouegang_datasAkinator`
--

-- --------------------------------------------------------

--
-- Structure de la table `game`
--

CREATE TABLE `game` (
  `id` int(10) NOT NULL,
  `date_game` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_player` int(10) NOT NULL,
  `id_result` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `game`
--

INSERT INTO `game` (`id`, `date_game`, `id_player`, `id_result`) VALUES
(1, '2026-02-18 22:29:36', 4, 10),
(2, '2026-02-18 22:29:41', 4, 10),
(3, '2026-02-18 22:29:44', 4, 14);

-- --------------------------------------------------------

--
-- Structure de la table `Player`
--

CREATE TABLE `player` (
  `id` int(10) NOT NULL,
  `username` varchar(255) COLLATE utf8_bin NOT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `player`
--

INSERT INTO `player` (`id`, `username`, `email`, `password`) VALUES
(4, 'princilia', 'banane@bana.fr', '$2y$10$W9CShyFDNcc9RZiLdavJquaGX.khBmgw0NlSt2Why8wK8t9VRE/Ly');

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

CREATE TABLE `question` (
  `id` int(10) NOT NULL,
  `question_wording` text COLLATE utf8_bin NOT NULL,
  `is_first` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `question`
--

INSERT INTO `question` (`id`, `question_wording`, `is_first`) VALUES
(1, 'La boisson à laquelle tu penses est-elle servie chaude ?', 1),
(2, 'Cette boisson contient-elle du lait ?', 0),
(3, 'Est-ce une boisson à base de cacao ?', 0),
(4, 'Cette boisson est-elle faite à partir de graines ?', 0),
(5, 'Est-ce qu\'elle est servie dans une grande tasse bien remplie ?', 0),
(6, 'Est-ce que l\'ingrédient principal de cette boisson sont des feuilles ?', 0),
(7, 'Est-ce qu\'il y a du café dedans ?', 0),
(8, 'est-ce qu\'elle est servie froide ?', 0),
(9, 'Cette boisson contient-elle des bulles ?', 0),
(10, 'La texture de la boisson est-elle épaisse ?', 0),
(11, 'Est-elle faite avec des fruits ?', 0);

-- --------------------------------------------------------

--
-- Structure de la table `response`
--

CREATE TABLE `response` (
  `id` int(10) NOT NULL,
  `content` varchar(255) COLLATE utf8_bin NOT NULL,
  `id_result` int(10) DEFAULT NULL,
  `id_question` int(10) NOT NULL,
  `id_next_question` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `response`
--

INSERT INTO `response` (`id`, `content`, `id_result`, `id_question`, `id_next_question`) VALUES
(23, 'oui', NULL, 1, 2),
(24, 'non', NULL, 1, 8),
(25, 'oui', NULL, 2, 3),
(26, 'non', NULL, 2, 4),
(27, 'oui', 10, 3, NULL),
(28, 'non', NULL, 3, 7),
(29, 'oui', 5, 7, NULL),
(30, 'non', 6, 7, NULL),
(31, 'oui', NULL, 4, 5),
(32, 'non', NULL, 4, 6),
(33, 'oui', 1, 5, NULL),
(34, 'non', 2, 5, NULL),
(35, 'oui', 3, 6, NULL),
(36, 'non', 4, 6, NULL),
(37, 'oui', NULL, 8, 9),
(38, 'non', 14, 8, NULL),
(39, 'oui', NULL, 9, 11),
(40, 'non', NULL, 9, 10),
(41, 'oui', 11, 10, NULL),
(42, 'non', 12, 10, NULL),
(43, 'oui', 12, 11, NULL),
(44, 'non', 13, 11, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `result`
--

CREATE TABLE `result` (
  `id` int(10) NOT NULL,
  `noun_drink` varchar(255) COLLATE utf8_bin NOT NULL,
  `picture` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `result`
--

INSERT INTO `result` (`id`, `noun_drink`, `picture`, `description`) VALUES
(1, 'Le café noir lungo', 'lungo.jpg', 'Le café noir lungo est issu des hauts plateaux, ce breuvage à l\'infusion prolongée déploie une force tranquille. Sa robe sombre et ses reflets cuivrés témoignent d\'une torréfaction lente, idéale pour éveiller les sens dès l\'aube.'),
(2, 'Le café noir expresso', 'expresso.jpg', 'Le café noir expresso est un véritable concentré de vitalité, l\'expresso se distingue par sa texture dense et sa crème persistante. Sous son petit volume se cache une structure aromatique complexe, capable de stimuler instantanément le métabolisme.'),
(3, 'Le thé', 'the.jpg', 'Plante ancestrale originaire d\'Asie, le thé se décline en une multitude de variétés aux vertus antioxydantes. Ses feuilles, une fois immergées, libèrent une essence végétale qui favorise la concentration et l\'équilibre intérieur. '),
(4, 'La tisane', 'tisane.jpg', 'Composée d\'un savant mélange de fleurs et de racines, la tisane est une infusion dépourvue de caféine. Elle joue un rôle clé dans le cycle du repos, aidant le corps à décomposer les tensions de la journée par ses arômes herbacés.'),
(5, 'Le Café au lait', 'cafelait.jpg', 'Le café au lait est une préparation hybride  qui fusionne l\'amertume du grain avec douceur des protéines laitières. Il en résulte une solution onctueuse, très prisée pour sa capacité à apporter u réconfort thermique immédiat lors des saisons fraîches.'),
(6, 'Le Matcha Latte', 'matchalatte.jpg', 'Poudre fine obtenue par broyage de jeunes pousses de thé, le Matcha est une source d\'énergie durable. Sa couleur émeraude, riche en chlorophylle, s\'allie au lait pour créer une boisson à la fois terreuse et veloutée.'),
(10, 'Le chocolat chaud', 'chocolatchaud.jpg', 'Le chocolat chaud est dérivé des fèves de cacao tropicales, ce nectar onctueux est une ressource calorique précieuse. Sa viscosité et ses notes sucrées en font un élément essentiel du rituel de détente, agissant positivement sur l\'humeur du consommateur.'),
(11, 'Le Milkshake', 'milkshake.jpg', 'Mélange émulsionné à basse température, le milkshake se caractérise par sa structure aérienne et givrée. Cette boisson gourmande, souvent enrichie d\'arômes naturels, offre une expérience gustative intense et une fraîcheur saisissante.'),
(12, 'Le jus', 'jus.jpg', 'Liquide vital extrait de la puple des fruits, le jus est une réserve naturelle de vitamines et de minéraux. Sa composition riche en sucres naturels en fait un carburant de choix pour revitaliser l\'organisme en un temps record.'),
(13, 'Le soda', 'soda.jpg', 'Solution aqueuse gazéifiée, le soda se reconnaît à son effervescence constante due à la libération de dioxyde de carbone. Ses bulles jouent un rôle de stimulation sensorielle, apportant une sensation de fraîcheur vive et ludique.'),
(14, 'Aucune boisson', 'aucuneboisson.jpg', 'Oups je ne connais pas cette boisson.');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_result` (`id_result`),
  ADD KEY `id_player` (`id_player`);

--
-- Index pour la table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `response`
--
ALTER TABLE `response`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_result` (`id_result`),
  ADD KEY `id_question` (`id_question`),
  ADD KEY `id_next_question` (`id_next_question`);

--
-- Index pour la table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `game`
--
ALTER TABLE `game`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `player`
--
ALTER TABLE `player`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `response`
--
ALTER TABLE `response`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT pour la table `result`
--
ALTER TABLE `result`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `game`
--
ALTER TABLE `game`
  ADD CONSTRAINT `game_ibfk_1` FOREIGN KEY (`id_player`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `game_ibfk_2` FOREIGN KEY (`id_result`) REFERENCES `result` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `response`
--
ALTER TABLE `response`
  ADD CONSTRAINT `response_ibfk_1` FOREIGN KEY (`id_result`) REFERENCES `result` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `response_ibfk_2` FOREIGN KEY (`id_question`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `response_ibfk_3` FOREIGN KEY (`id_next_question`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
