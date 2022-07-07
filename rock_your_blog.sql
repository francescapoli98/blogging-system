-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Gen 06, 2020 alle 10:27
-- Versione del server: 10.1.38-MariaDB
-- Versione PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rock_your_blog`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `blog`
--

CREATE TABLE `blog` (
  `id_blog` int(11) NOT NULL,
  `id_utente` int(11) NOT NULL,
  `coautore` int(11) DEFAULT NULL,
  `id_cat_blog` int(11) NOT NULL,
  `titolo` varchar(45) CHARACTER SET utf8mb4 NOT NULL,
  `descrizione` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `url_immagine` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `id_sfondo` int(11) DEFAULT NULL,
  `id_cornice` int(11) DEFAULT NULL,
  `data_creazione` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `blog`
--

INSERT INTO `blog` (`id_blog`, `id_utente`, `coautore`, `id_cat_blog`, `titolo`, `descrizione`, `url_immagine`, `id_sfondo`, `id_cornice`, `data_creazione`) VALUES
(2, 22, NULL, 1, 'Il vinile', 'L\'amore per il vinile Ã¨ un sentimento irrazionale.</br></br>In questo blog si parla dei vinili piÃ¹ venduti della storia!', '99920191127095031ian-dooley-1101124-unsplash.jpg', 2, 6, '2019-11-27'),
(59, 22, 21, 10, 'Tim Burton', 'Gotico, atipico e geniale: il regista visionario.', '99920200106100647tim-burton-cinematographe.it_.jpg', 9, 7, '2019-12-04'),
(60, 27, 22, 11, 'The Big Bang Theory', 'La serie TV piÃ¹ amata d\'America', '99920200106101819the-big-bang-theory-stagione-12_11_jpg_960x0_crop_q85.webp', 11, 5, '2020-01-06');

-- --------------------------------------------------------

--
-- Struttura della tabella `carte`
--

CREATE TABLE `carte` (
  `id_carta` int(11) NOT NULL,
  `id_utente` int(11) NOT NULL,
  `scadenza` date NOT NULL,
  `numero` varchar(16) COLLATE utf8_bin NOT NULL,
  `tipo` varchar(45) COLLATE utf8_bin NOT NULL,
  `nominativo` varchar(45) COLLATE utf8_bin NOT NULL,
  `cvv` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `carte`
--

INSERT INTO `carte` (`id_carta`, `id_utente`, `scadenza`, `numero`, `tipo`, `nominativo`, `cvv`) VALUES
(21, 21, '2021-01-01', '1234123412341234', 'Visa', 'Simone Formicola', 123),
(22, 22, '2019-11-30', '7777777777777777', 'Visa', 'Francesca Poli', 222),
(23, 27, '2020-01-26', '3333333333333333', 'Visa', 'Francy98', 333);

-- --------------------------------------------------------

--
-- Struttura della tabella `categorie`
--

CREATE TABLE `categorie` (
  `id_categoria` int(11) NOT NULL,
  `descrizione` varchar(100) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `categorie`
--

INSERT INTO `categorie` (`id_categoria`, `descrizione`) VALUES
(1, 'Musica'),
(7, 'Natura'),
(8, 'Cinema'),
(9, 'Moda'),
(10, 'Arte'),
(11, 'Serie TV'),
(13, 'Animali'),
(14, 'Stile di vita'),
(21, 'Videogames'),
(22, 'Affari');

-- --------------------------------------------------------

--
-- Struttura della tabella `colori`
--

CREATE TABLE `colori` (
  `id_colore` int(11) NOT NULL,
  `nome_colore` varchar(45) COLLATE utf8_bin NOT NULL,
  `codice_html` varchar(45) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `colori`
--

INSERT INTO `colori` (`id_colore`, `nome_colore`, `codice_html`) VALUES
(1, 'Bianco', '#ffffff'),
(2, 'Viola', '#e699ff'),
(3, 'Azzurro', '#b3e6ff'),
(4, 'Verde chiaro', '#80ff80'),
(5, 'Rosa', ' #ffb3e6'),
(6, 'Rosso', '#ff4d4d'),
(7, 'Giallo', '#ffffb3'),
(8, 'Lilla', '#b3b3ff'),
(9, 'Grigio', '#d9d9d9'),
(10, 'Verde acqua', '#b3fff0'),
(11, 'Verde scuro', '#8cd9b3'),
(12, 'Arancione', '#ffbf80'),
(13, 'Beige', '#ecd9c6');

-- --------------------------------------------------------

--
-- Struttura della tabella `commenti`
--

CREATE TABLE `commenti` (
  `id_commenti` int(11) NOT NULL,
  `id_utente` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  `testo` text COLLATE utf8_bin,
  `valutazione` int(11) DEFAULT NULL,
  `data` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `commenti`
--

INSERT INTO `commenti` (`id_commenti`, `id_utente`, `id_post`, `testo`, `valutazione`, `data`) VALUES
(2, 22, 25, 'Il migliore!', NULL, '2020-01-01 11:47:28');

-- --------------------------------------------------------

--
-- Struttura della tabella `post`
--

CREATE TABLE `post` (
  `id_post` int(11) NOT NULL,
  `id_utente` int(11) NOT NULL,
  `id_blog` int(11) NOT NULL,
  `titolo` varchar(45) COLLATE utf8_bin NOT NULL,
  `testo` text COLLATE utf8_bin,
  `url_immagine` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `valutazione` int(11) DEFAULT NULL,
  `data` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `post`
--

INSERT INTO `post` (`id_post`, `id_utente`, `id_blog`, `titolo`, `testo`, `url_immagine`, `valutazione`, `data`) VALUES
(25, 22, 59, 'L\'attenzione al dettaglio', 'L\'opera di Tim Burton Ã¨ fortemente caratterizzata da una minuta costruzione della scenografia e dei costumi, che ricorda l\'atmosfera e la cura per il dettaglio tipica del cinema espressionista tedesco a cavallo tra gli anni \'20 e gli anni \'30 del Novecento.', '10002019121609542746039179_2196263030386505_735714823924350976_n.jpg', 2, '2019-12-16 09:54:19'),
(26, 22, 59, 'Nightmare Before Christmas ', 'Probabilmente uno dei film piÃ¹ associati al nome \"Tim Burton\": un\'opera che perÃ² non Ã¨ stata da lui diretta, ma solo pensata e scritta. Un capolavoro, conosciuto e apprezzato da grandi e piccini, un film intramontabile e non classificabile nelle solite liste di \"film di Natale\", \"film di Halloween\"!', '99920200106101026nightmare-before-christmas-moon.jpg', NULL, '2020-01-06 10:10:26'),
(27, 22, 2, 'The Dark Side of the Moon - Pink Floyd', '#1 nella classifica mondiale dei vinili piÃ¹ apprezzati. </br></br>Classico intramontabile, qualsiasi cultore di musica saprÃ  per certo che un album del genere puÃ² essere migliorato solo se ascoltato su vinile!', '100020200106101405s-l300.jpg', 1, '2020-01-06 10:14:05'),
(28, 27, 60, 'L\'ultima puntata di TBBT!', '</br></br>Ãˆ andato in onda ieri lâ€™ultimo episodio di The Big Bang Theory, la piÃ¹ lunga sitcom multi-camera statunitense, con dodici stagioni e un totale di 279 puntate, che ha appassionato per anni milioni di telespettatori ogni settimana. Chuck Lorre e Bill Prady, i creatori dello show, avevano promesso â€œun finale epicoâ€ e per alcuni versi lo Ã¨ stato. Non perÃ² in termini di fatti eclatanti successi nellâ€™ultima puntata, in realtÃ  due episodi della durata complessiva di unâ€™ora. Da questo punto di vista non ci sono stati fuochi dâ€™artificio, i protagonisti perÃ² hanno portato a termine il processo di crescita iniziato negli anni passati.', '100020200106102115The-Big-Bang-Theory-12.jpg', NULL, '2020-01-06 10:21:15');

-- --------------------------------------------------------

--
-- Struttura della tabella `premium`
--

CREATE TABLE `premium` (
  `id_premium` int(11) NOT NULL,
  `id_utente` int(11) NOT NULL,
  `id_carta` int(11) NOT NULL,
  `data_inizio` date NOT NULL,
  `data_fine` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `premium`
--

INSERT INTO `premium` (`id_premium`, `id_utente`, `id_carta`, `data_inizio`, `data_fine`) VALUES
(10, 21, 21, '2019-11-18', '2020-11-18'),
(11, 22, 22, '2019-11-27', '2020-11-27'),
(12, 27, 23, '2020-01-05', '2021-01-05');

-- --------------------------------------------------------

--
-- Struttura della tabella `profilo`
--

CREATE TABLE `profilo` (
  `id_profilo` int(11) NOT NULL,
  `id_utente` int(11) NOT NULL,
  `nome` varchar(45) COLLATE utf8_bin NOT NULL,
  `cognome` varchar(45) COLLATE utf8_bin NOT NULL,
  `eta` int(11) NOT NULL,
  `citta` varchar(45) COLLATE utf8_bin NOT NULL,
  `bio` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `url_foto` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `profilo`
--

INSERT INTO `profilo` (`id_profilo`, `id_utente`, `nome`, `cognome`, `eta`, `citta`, `bio`, `url_foto`) VALUES
(13, 7, 'Bianca', 'Neve', 16, 'Roma', 'Ciao!', NULL),
(14, 9, 'Chiara', 'Giusti', 21, 'Luino', 'I don\\\'t know... If', NULL),
(16, 10, 'Francesca', 'Poli', 22, 'Pisa', 'Ciao a tutti', '100020191020105527le-iene.jpg'),
(18, 13, 'Mario', 'Rossi', 22, 'Milano', 'ciao', NULL),
(25, 21, 'Simone', 'Formicola', 32, 'Grosseto', 'Agente Immobiliare Gabetti', '99920191118172842gabetti.jpg'),
(26, 22, 'Francesca ', 'Poli', 21, 'Pescara', 'Studentessa di Informatica Umanistica', '10002019122811481869854125_2584310564923914_2070346984551612416_n.jpg'),
(27, 27, 'Francesca', 'Poli', 25, 'Pisa', 'Ciao a tutti!', '10002020010509444046039179_2196263030386505_735714823924350976_n.jpg'),
(28, 28, 'Anna', 'Martinelli', 45, 'Roma', 'Professoressa', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `stili`
--

CREATE TABLE `stili` (
  `id_stile` int(11) NOT NULL,
  `nome_stile` varchar(45) COLLATE utf8_bin NOT NULL,
  `codice_css` varchar(45) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `stili`
--

INSERT INTO `stili` (`id_stile`, `nome_stile`, `codice_css`) VALUES
(1, 'Lineare', 'solid '),
(2, 'Tratti', 'dashed '),
(3, 'Pois', 'dotted '),
(4, 'Doppia linea', 'double '),
(5, 'Scanalato', 'groove '),
(6, 'Ondulato', 'ridge '),
(7, 'Incassato interno', 'inset '),
(8, 'Incassato esterno', 'outset '),
(9, 'Invisibile', 'hidden ');

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE `utenti` (
  `id_utente` int(11) NOT NULL,
  `username` varchar(45) COLLATE utf8_bin NOT NULL,
  `email` varchar(45) COLLATE utf8_bin NOT NULL,
  `password` varchar(45) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`id_utente`, `username`, `email`, `password`) VALUES
(7, 'bianca', 'bianca@gmail.com', '$2y$10$6LNsHkJDDTP2Vz6Uyv5GluwdWbt5OIKr3Pza4T'),
(9, 'chiara98', 'chiaragiusti98@alice.it', '$2y$10$.YCt0000v6EO7ofjqk/nge75ex2xjIFQapPS9T'),
(10, 'francesca', 'francy@gmail.com', '$2y$10$eO9AdQi4x0d7XIywnqJmd.b0NzE8SHm5T4ZlKm'),
(13, 'mario', 'mariorossi@gmail.com', '$2y$10$zqljrrN0pyHaoQ0.sjO7jO2KCrho/dBhr5z03q'),
(21, 'SimoneFormicola', 'simoneformicola@gmail.com', '$2y$10$5FrQtXEyorrkhoONXJfoUOvYKyRLcB8Yu2sKns'),
(22, 'fra', 'fra@gmail.com', '$2y$10$b5kOFGwshVattz1fIWyEee0l2l6KOMa5bZoQnf'),
(27, 'francy', 'francescapoli1998@gmail.com', '$2y$10$asS625qz0qHDZo39DGd3desJNz.CYlA1guLinK'),
(28, 'anna', 'annam@tiscali.it', '$2y$10$5ZD1piR2b2LJFAziTd/DmOpMVEHlj94JknkCq.');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id_blog`),
  ADD UNIQUE KEY `idBlog_UNIQUE` (`id_blog`),
  ADD UNIQUE KEY `titolo_UNIQUE` (`titolo`),
  ADD KEY `fk_blog_utenti1_idx` (`id_utente`),
  ADD KEY `fk_blog_categoria_blog1_idx` (`id_cat_blog`),
  ADD KEY `fk_blog_utenti2_idx` (`coautore`),
  ADD KEY `fk_blog_colori` (`id_sfondo`),
  ADD KEY `fk_blog_stili` (`id_cornice`);

--
-- Indici per le tabelle `carte`
--
ALTER TABLE `carte`
  ADD PRIMARY KEY (`id_carta`),
  ADD UNIQUE KEY `idCarte_UNIQUE` (`id_carta`),
  ADD KEY `fk_carte_utenti1_idx` (`id_utente`);

--
-- Indici per le tabelle `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `id_categoria_blog_UNIQUE` (`id_categoria`);

--
-- Indici per le tabelle `colori`
--
ALTER TABLE `colori`
  ADD PRIMARY KEY (`id_colore`);

--
-- Indici per le tabelle `commenti`
--
ALTER TABLE `commenti`
  ADD PRIMARY KEY (`id_commenti`),
  ADD UNIQUE KEY `idCommenti_UNIQUE` (`id_commenti`),
  ADD KEY `fk_Commenti_Utenti1_idx` (`id_utente`),
  ADD KEY `fk_Commenti_Post1_idx` (`id_post`);

--
-- Indici per le tabelle `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id_post`),
  ADD UNIQUE KEY `idPost_UNIQUE` (`id_post`),
  ADD KEY `fk_Post_Utenti1_idx` (`id_utente`),
  ADD KEY `fk_Post_Blog1_idx` (`id_blog`);

--
-- Indici per le tabelle `premium`
--
ALTER TABLE `premium`
  ADD PRIMARY KEY (`id_premium`),
  ADD UNIQUE KEY `idPremium_UNIQUE` (`id_premium`),
  ADD KEY `fk_Premium_Utenti1_idx` (`id_utente`),
  ADD KEY `fk_premium_carte1_idx` (`id_carta`);

--
-- Indici per le tabelle `profilo`
--
ALTER TABLE `profilo`
  ADD PRIMARY KEY (`id_profilo`),
  ADD UNIQUE KEY `idProfilo_UNIQUE` (`id_profilo`),
  ADD KEY `fk_profilo_utenti1_idx` (`id_utente`);

--
-- Indici per le tabelle `stili`
--
ALTER TABLE `stili`
  ADD PRIMARY KEY (`id_stile`);

--
-- Indici per le tabelle `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`id_utente`),
  ADD UNIQUE KEY `id_utente_UNIQUE` (`id_utente`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `blog`
--
ALTER TABLE `blog`
  MODIFY `id_blog` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT per la tabella `carte`
--
ALTER TABLE `carte`
  MODIFY `id_carta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT per la tabella `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT per la tabella `colori`
--
ALTER TABLE `colori`
  MODIFY `id_colore` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT per la tabella `commenti`
--
ALTER TABLE `commenti`
  MODIFY `id_commenti` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `post`
--
ALTER TABLE `post`
  MODIFY `id_post` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT per la tabella `premium`
--
ALTER TABLE `premium`
  MODIFY `id_premium` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT per la tabella `profilo`
--
ALTER TABLE `profilo`
  MODIFY `id_profilo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT per la tabella `stili`
--
ALTER TABLE `stili`
  MODIFY `id_stile` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT per la tabella `utenti`
--
ALTER TABLE `utenti`
  MODIFY `id_utente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `fk_blog_categoria_blog1` FOREIGN KEY (`id_cat_blog`) REFERENCES `categorie` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_blog_colori` FOREIGN KEY (`id_sfondo`) REFERENCES `colori` (`id_colore`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_blog_stili` FOREIGN KEY (`id_cornice`) REFERENCES `stili` (`id_stile`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_blog_utenti1` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_blog_utenti2` FOREIGN KEY (`coautore`) REFERENCES `utenti` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `carte`
--
ALTER TABLE `carte`
  ADD CONSTRAINT `fk_carte_utenti1` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `commenti`
--
ALTER TABLE `commenti`
  ADD CONSTRAINT `fk_Commenti_Post1` FOREIGN KEY (`id_post`) REFERENCES `post` (`id_post`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Commenti_Utenti1` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `fk_Post_Blog1` FOREIGN KEY (`id_blog`) REFERENCES `blog` (`id_blog`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Post_Utenti1` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `premium`
--
ALTER TABLE `premium`
  ADD CONSTRAINT `fk_Premium_Utenti1` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_premium_carte1` FOREIGN KEY (`id_carta`) REFERENCES `carte` (`id_carta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `profilo`
--
ALTER TABLE `profilo`
  ADD CONSTRAINT `fk_profilo_utenti1` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE;


--
-- Metadati
--
USE `phpmyadmin`;

--
-- Metadati per tabella blog
--

--
-- Dump dei dati per la tabella `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'rock_your_blog', 'blog', '[]', '2019-12-30 10:22:32');

--
-- Dump dei dati per la tabella `pma__tracking`
--

INSERT INTO `pma__tracking` (`db_name`, `table_name`, `version`, `date_created`, `date_updated`, `schema_snapshot`, `schema_sql`, `data_sql`, `tracking`, `tracking_active`) VALUES
('rock_your_blog', 'blog', 1, '2019-07-15 10:52:37', '2019-12-30 11:22:48', 'a:2:{s:7:\"COLUMNS\";a:4:{i:0;a:8:{s:5:\"Field\";s:6:\"titolo\";s:4:\"Type\";s:8:\"char(40)\";s:9:\"Collation\";s:17:\"latin1_swedish_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:3:\"PRI\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:1;a:8:{s:5:\"Field\";s:6:\"sfondo\";s:4:\"Type\";s:8:\"char(50)\";s:9:\"Collation\";s:17:\"latin1_swedish_ci\";s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:2;a:8:{s:5:\"Field\";s:8:\"immagine\";s:4:\"Type\";s:8:\"char(50)\";s:9:\"Collation\";s:17:\"latin1_swedish_ci\";s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:3;a:8:{s:5:\"Field\";s:11:\"descrizione\";s:4:\"Type\";s:8:\"tinytext\";s:9:\"Collation\";s:17:\"latin1_swedish_ci\";s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}}s:7:\"INDEXES\";a:1:{i:0;a:13:{s:5:\"Table\";s:4:\"blog\";s:10:\"Non_unique\";s:1:\"0\";s:8:\"Key_name\";s:7:\"PRIMARY\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:6:\"titolo\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"0\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}}}', '# log 2019-07-15 10:52:37 root\nDROP TABLE IF EXISTS `blog`;\n# log 2019-07-15 10:52:37 root\n\nCREATE TABLE `blog` (\n  `titolo` char(40) NOT NULL,\n  `sfondo` char(50) DEFAULT NULL,\n  `immagine` char(50) DEFAULT NULL,\n  `descrizione` tinytext\n) ENGINE=InnoDB DEFAULT CHARSET=latin1;\n\n# log 2019-07-20 11:05:29 root\nALTER TABLE `blog` CHANGE `descrizione` `descrizione` TEXT CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL;\n# log 2019-07-22 13:52:39 root\n-- --------------------------------------------------------\n\n--\n-- Struttura della tabella `blog`\n--\n\nCREATE TABLE `blog` (\n  `titolo` char(40) NOT NULL,\n  `immagine` char(50) DEFAULT NULL,\n  `descrizione` tinytext,\n  `categoria` char(20) DEFAULT NULL,\n  `sfondo` char(50) DEFAULT NULL\n) ENGINE=InnoDB DEFAULT CHARSET=latin1;\n\n# log 2019-07-22 13:52:40 root\n--\n-- Indici per le tabelle `blog`\n--\nALTER TABLE `blog`\n  ADD PRIMARY KEY (`titolo`),\n  ADD KEY `categoria` (`categoria`);\n\n# log 2019-07-24 22:52:12 root\nALTER TABLE `blog` ;\n# log 2019-07-24 22:52:24 root\nALTER TABLE `blog` CHANGE `immagine` `immagine` VARCHAR(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL;\n# log 2019-09-15 09:07:59 root\n\n            RENAME TABLE `blog`\n                  TO `old_db`.`blog`;\n# log 2019-09-15 10:56:05 root\nALTER TABLE `blog` DROP FOREIGN KEY `fk_blog_categoria_blog1`;\n# log 2019-09-15 10:56:05 root\nALTER TABLE `blog` ADD  CONSTRAINT `fk_blog_categoria_blog1` FOREIGN KEY (`id_cat_blog`) REFERENCES `categoria_blog`(`id_cat_blog`) ON DELETE CASCADE ON UPDATE CASCADE;\n# log 2019-09-15 10:56:05 root\nALTER TABLE `blog` DROP FOREIGN KEY `fk_blog_utenti1`;\n# log 2019-09-15 10:56:05 root\nALTER TABLE `blog` ADD  CONSTRAINT `fk_blog_utenti1` FOREIGN KEY (`id_utente`) REFERENCES `utenti`(`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE;\n# log 2019-09-18 13:04:28 root\nALTER TABLE `blog` CHANGE `url_immagine` `url_immagine` VARCHAR(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;\n# log 2019-09-18 13:10:15 root\nALTER TABLE `blog` CHANGE `url_immagine` `url_immagine` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;\n# log 2019-11-09 19:01:08 root\n\n            RENAME TABLE `blog`\n                  TO `rockyourblog`.`blog`;\n# log 2019-11-10 16:10:27 root\n\n            RENAME TABLE `blog`\n                  TO `newdb`.`blog`;\n# log 2019-11-11 15:10:24 root\n\n            RENAME TABLE `blog`\n                  TO `rockyourblog`.`blog`;\n# log 2019-11-11 15:29:55 root\nALTER TABLE `blog` CHANGE `coautore` `coautore` INT(11) NULL;\n# log 2019-11-20 10:33:57 root\nALTER TABLE `blog`  ADD `sfondo` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL  AFTER `url_immagine`;\n# log 2019-11-26 11:32:49 root\n\n            RENAME TABLE `blog`\n                  TO `ultimodbprimadistile`.`blog`;\n# log 2019-11-26 11:34:00 root\n--\n-- Database: `rock_your_blog`\n--\n\n-- --------------------------------------------------------\n\n--\n-- Struttura della tabella `blog`\n--\n\nCREATE TABLE `blog` (\n  `id_blog` int(11) NOT NULL,\n  `id_utente` int(11) NOT NULL,\n  `coautore` int(11) DEFAULT NULL,\n  `id_cat_blog` int(11) NOT NULL,\n  `titolo` varchar(45) COLLATE utf8_bin NOT NULL,\n  `descrizione` varchar(255) COLLATE utf8_bin DEFAULT NULL,\n  `url_immagine` varchar(255) COLLATE utf8_bin DEFAULT NULL,\n  `id_sfondo` int(11) DEFAULT NULL,\n  `id_cornice` int(11) DEFAULT NULL,\n  `data_creazione` date DEFAULT NULL\n) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;\n\n# log 2019-11-26 11:34:01 root\n--\n-- Indici per le tabelle scaricate\n--\n\n--\n-- Indici per le tabelle `blog`\n--\nALTER TABLE `blog`\n  ADD PRIMARY KEY (`id_blog`),\n  ADD UNIQUE KEY `idBlog_UNIQUE` (`id_blog`),\n  ADD UNIQUE KEY `titolo_UNIQUE` (`titolo`),\n  ADD KEY `fk_blog_utenti1_idx` (`id_utente`),\n  ADD KEY `fk_blog_categoria_blog1_idx` (`id_cat_blog`),\n  ADD KEY `fk_blog_utenti2_idx` (`coautore`),\n  ADD KEY `fk_blog_colori` (`id_sfondo`),\n  ADD KEY `fk_blog_stili` (`id_cornice`);\n\n# log 2019-11-26 11:34:01 root\n--\n-- AUTO_INCREMENT per le tabelle scaricate\n--\n\n--\n-- AUTO_INCREMENT per la tabella `blog`\n--\nALTER TABLE `blog`\n  MODIFY `id_blog` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;\n\n# log 2019-11-26 11:34:02 root\n--\n-- Limiti per le tabelle scaricate\n--\n\n--\n-- Limiti per la tabella `blog`\n--\nALTER TABLE `blog`\n  ADD CONSTRAINT `fk_blog_categoria_blog1` FOREIGN KEY (`id_cat_blog`) REFERENCES `categorie` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE,\n  ADD CONSTRAINT `fk_blog_colori` FOREIGN KEY (`id_sfondo`) REFERENCES `colori` (`id_colore`) ON DELETE CASCADE ON UPDATE CASCADE,\n  ADD CONSTRAINT `fk_blog_stili` FOREIGN KEY (`id_cornice`) REFERENCES `stili` (`id_stile`) ON DELETE CASCADE ON UPDATE CASCADE,\n  ADD CONSTRAINT `fk_blog_utenti1` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE,\n  ADD CONSTRAINT `fk_blog_utenti2` FOREIGN KEY (`coautore`) REFERENCES `utenti` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE;\n\n# log 2019-12-30 11:22:32 root\nALTER TABLE `blog` CHANGE `descrizione` `descrizione` BLOB;\n# log 2019-12-30 11:22:32 root\nALTER TABLE `blog` CHANGE `descrizione` `descrizione` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL;\n# log 2019-12-30 11:22:48 root\nALTER TABLE `blog` CHANGE `titolo` `titolo` VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;', '\n\n# log 2019-07-23 12:09:15 root\nDELETE FROM `blog` WHERE `blog`.`titolo` = \'Game of Thrones\';\n\n# log 2019-07-23 12:09:19 root\nDELETE FROM `blog` WHERE `blog`.`titolo` = \'Big Bang Theory\';\n\n# log 2019-07-23 15:52:04 root\nDELETE FROM `blog` WHERE `blog`.`titolo` = \'AFSGFG\';\n\n# log 2019-07-23 15:52:07 root\nDELETE FROM `blog` WHERE `blog`.`titolo` = \'Barcellona\';\n\n# log 2019-07-23 15:52:09 root\nDELETE FROM `blog` WHERE `blog`.`titolo` = \'blu\';\n\n# log 2019-07-23 15:52:11 root\nDELETE FROM `blog` WHERE `blog`.`titolo` = \'Ciao\';\n\n# log 2019-07-23 15:52:19 root\nDELETE FROM `blog` WHERE `blog`.`titolo` = \'Game of Thrones\';\n\n# log 2019-07-23 15:52:28 root\nDELETE FROM `blog` WHERE `blog`.`titolo` = \'Rosa\';\n\n# log 2019-07-23 15:52:37 root\nDELETE FROM `blog` WHERE `blog`.`titolo` = \'Telefoni Android\';\n\n# log 2019-07-23 15:53:15 root\nDELETE FROM `blog` WHERE `blog`.`titolo` = \'Animali Fantastici\' LIMIT 1;\n# log 2019-07-23 15:53:15 root\nDELETE FROM `blog` WHERE `blog`.`titolo` = \'Fiori e piante\' LIMIT 1;\n# log 2019-07-23 15:53:15 root\nDELETE FROM `blog` WHERE `blog`.`titolo` = \'Gothic\' LIMIT 1;\n# log 2019-07-23 15:53:15 root\nDELETE FROM `blog` WHERE `blog`.`titolo` = \'Murakami\' LIMIT 1;\n# log 2019-07-23 15:53:15 root\nDELETE FROM `blog` WHERE `blog`.`titolo` = \'Occhiali da sole\' LIMIT 1;\n# log 2019-07-23 15:53:15 root\nDELETE FROM `blog` WHERE `blog`.`titolo` = \'Torte\' LIMIT 1;\n# log 2019-07-23 15:53:15 root\nDELETE FROM `blog` WHERE `blog`.`titolo` = \'Wendy\' LIMIT 1;\n# log 2019-07-24 22:51:54 root\nDELETE FROM `blog` WHERE `blog`.`titolo` = \'frnkiero\';\n\n# log 2019-07-28 12:23:45 root\nDELETE FROM `blog` WHERE `blog`.`titolo` = \'Hello it\\\\\\\'s me\';\n\n# log 2019-07-28 12:23:51 root\nDELETE FROM `blog` WHERE `blog`.`titolo` = \'Non so che scrive ao\\\\\\\'\';\n\n# log 2019-07-28 12:23:53 root\nDELETE FROM `blog` WHERE `blog`.`titolo` = \'qw<afsg\';\n\n# log 2019-07-28 12:37:17 root\nDELETE FROM `blog` WHERE `blog`.`titolo` = \'Big Bang Theory\' LIMIT 1;\n# log 2019-07-28 12:37:17 root\nDELETE FROM `blog` WHERE `blog`.`titolo` = \'Come curare il proprio riccio domestico\' LIMIT 1;\n# log 2019-07-28 12:37:17 root\nDELETE FROM `blog` WHERE `blog`.`titolo` = \'Disney\' LIMIT 1;\n# log 2019-07-28 12:37:17 root\nDELETE FROM `blog` WHERE `blog`.`titolo` = \'Fantasy\' LIMIT 1;\n# log 2019-07-28 12:37:17 root\nDELETE FROM `blog` WHERE `blog`.`titolo` = \'Game of Thrones\' LIMIT 1;\n# log 2019-07-28 12:37:17 root\nDELETE FROM `blog` WHERE `blog`.`titolo` = \'Hello everybody\' LIMIT 1;\n# log 2019-07-28 12:37:17 root\nDELETE FROM `blog` WHERE `blog`.`titolo` = \'Justin Bieber\' LIMIT 1;\n# log 2019-07-28 12:37:17 root\nDELETE FROM `blog` WHERE `blog`.`titolo` = \'lol\' LIMIT 1;\n# log 2019-07-28 12:37:17 root\nDELETE FROM `blog` WHERE `blog`.`titolo` = \'Star Wars\' LIMIT 1;\n# log 2019-07-28 12:37:17 root\nDELETE FROM `blog` WHERE `blog`.`titolo` = \'tim burton\' LIMIT 1;\n# log 2019-07-28 18:18:30 root\nDELETE FROM `blog` WHERE `blog`.`titolo` = \'Come prendersi cura di un riccio\';\n\n# log 2019-09-18 10:32:51 root\nDELETE FROM `blog` WHERE `blog`.`id_blog` = 1;\n\n# log 2019-09-18 11:57:25 root\nDELETE FROM `blog` WHERE `blog`.`id_blog` = 9;\n\n# log 2019-09-18 11:57:43 root\nDELETE FROM `blog` WHERE `blog`.`id_blog` = 2;\n\n# log 2019-09-18 11:57:46 root\nDELETE FROM `blog` WHERE `blog`.`id_blog` = 3;\n\n# log 2019-09-18 11:57:49 root\nDELETE FROM `blog` WHERE `blog`.`id_blog` = 4;\n\n# log 2019-09-18 11:57:51 root\nDELETE FROM `blog` WHERE `blog`.`id_blog` = 5;\n\n# log 2019-09-18 11:57:54 root\nDELETE FROM `blog` WHERE `blog`.`id_blog` = 6;\n\n# log 2019-09-18 11:57:56 root\nDELETE FROM `blog` WHERE `blog`.`id_blog` = 7;\n\n# log 2019-09-18 11:57:58 root\nDELETE FROM `blog` WHERE `blog`.`id_blog` = 8;\n\n# log 2019-09-18 13:04:41 root\nDELETE FROM `blog` WHERE `blog`.`id_blog` = 10;\n\n# log 2019-09-18 13:24:02 root\nDELETE FROM `blog` WHERE `blog`.`id_blog` = 12;\n\n# log 2019-09-18 13:24:05 root\nDELETE FROM `blog` WHERE `blog`.`id_blog` = 13;\n\n# log 2019-09-18 17:46:27 root\nUPDATE `blog` SET `descrizione` = \'Regista\' WHERE `blog`.`id_blog` = 14;\n\n# log 2019-11-06 10:03:43 root\nDELETE FROM `blog` WHERE `blog`.`id_blog` = 19;\n\n# log 2019-11-06 10:03:47 root\nDELETE FROM `blog` WHERE `blog`.`id_blog` = 20;\n\n# log 2019-11-06 10:03:53 root\nDELETE FROM `blog` WHERE `blog`.`id_blog` = 27;\n\n# log 2019-11-06 10:28:16 root\nUPDATE `blog` SET `url_immagine` = NULL WHERE `blog`.`id_blog` = 31;\n\n# log 2019-11-06 10:28:49 root\nUPDATE `blog` SET `url_immagine` = NULL WHERE `blog`.`id_blog` = 17;\n\n# log 2019-11-06 10:28:49 root\nUPDATE `blog` SET `url_immagine` = NULL WHERE `blog`.`id_blog` = 18;\n\n# log 2019-11-06 10:28:49 root\nUPDATE `blog` SET `url_immagine` = NULL WHERE `blog`.`id_blog` = 24;\n\n# log 2019-11-14 18:03:51 root\nUPDATE `blog` SET `url_immagine` = NULL WHERE `blog`.`id_blog` = 9;\n\n# log 2019-11-14 18:04:17 root\nUPDATE `blog` SET `url_immagine` = NULL WHERE `blog`.`id_blog` = 10;\n\n# log 2019-11-14 18:04:17 root\nUPDATE `blog` SET `url_immagine` = NULL WHERE `blog`.`id_blog` = 11;\n\n# log 2019-11-14 18:04:17 root\nUPDATE `blog` SET `url_immagine` = NULL WHERE `blog`.`id_blog` = 12;\n\n# log 2019-11-26 17:51:27 root\nUPDATE `blog` SET `titolo` = \'L\\\'amicizia\' WHERE `blog`.`id_blog` = 1;\n\n# log 2019-11-30 11:05:35 root\nUPDATE `blog` SET `id_sfondo` = \'1\' WHERE `blog`.`id_blog` = 1;\n\n# log 2019-11-30 11:09:19 root\nUPDATE `blog` SET `id_sfondo` = \'2\' WHERE `blog`.`id_blog` = 1;\n\n# log 2019-11-30 11:39:57 root\nUPDATE `blog` SET `id_sfondo` = \'3\' WHERE `blog`.`id_blog` = 2;\n\n# log 2019-11-30 11:40:11 root\nUPDATE `blog` SET `id_sfondo` = \'5\' WHERE `blog`.`id_blog` = 2;\n\n# log 2019-12-09 11:37:47 root\nDELETE FROM `blog` WHERE `blog`.`id_blog` = 46;\n', 'UPDATE,INSERT,DELETE,TRUNCATE,CREATE TABLE,ALTER TABLE,RENAME TABLE,DROP TABLE,CREATE INDEX,DROP INDEX,CREATE VIEW,ALTER VIEW,DROP VIEW', 1);

--
-- Metadati per tabella carte
--

--
-- Metadati per tabella categorie
--

--
-- Metadati per tabella colori
--

--
-- Metadati per tabella commenti
--

--
-- Dump dei dati per la tabella `pma__tracking`
--

INSERT INTO `pma__tracking` (`db_name`, `table_name`, `version`, `date_created`, `date_updated`, `schema_snapshot`, `schema_sql`, `data_sql`, `tracking`, `tracking_active`) VALUES
('rock_your_blog', 'commenti', 1, '2019-07-15 10:52:37', '2019-11-26 11:34:03', 'a:2:{s:7:\"COLUMNS\";a:3:{i:0;a:8:{s:5:\"Field\";s:11:\"codice_comm\";s:4:\"Type\";s:11:\"smallint(6)\";s:9:\"Collation\";N;s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:3:\"PRI\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:1;a:8:{s:5:\"Field\";s:6:\"autore\";s:4:\"Type\";s:8:\"char(20)\";s:9:\"Collation\";s:17:\"latin1_swedish_ci\";s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:3:\"MUL\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:2;a:8:{s:5:\"Field\";s:11:\"codice_post\";s:4:\"Type\";s:11:\"smallint(6)\";s:9:\"Collation\";N;s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:3:\"MUL\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}}s:7:\"INDEXES\";a:3:{i:0;a:13:{s:5:\"Table\";s:8:\"commenti\";s:10:\"Non_unique\";s:1:\"0\";s:8:\"Key_name\";s:7:\"PRIMARY\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:11:\"codice_comm\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"0\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}i:1;a:13:{s:5:\"Table\";s:8:\"commenti\";s:10:\"Non_unique\";s:1:\"1\";s:8:\"Key_name\";s:11:\"codice_post\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:11:\"codice_post\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"0\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:3:\"YES\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}i:2;a:13:{s:5:\"Table\";s:8:\"commenti\";s:10:\"Non_unique\";s:1:\"1\";s:8:\"Key_name\";s:15:\"commenti_ibfk_1\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:6:\"autore\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"0\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:3:\"YES\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}}}', '# log 2019-07-15 10:52:37 root\nDROP TABLE IF EXISTS `commenti`;\n# log 2019-07-15 10:52:37 root\n\nCREATE TABLE `commenti` (\n  `codice_comm` smallint(6) NOT NULL,\n  `autore` char(20) DEFAULT NULL,\n  `codice_post` smallint(6) DEFAULT NULL\n) ENGINE=InnoDB DEFAULT CHARSET=latin1;\n\n# log 2019-07-22 13:52:39 root\n-- --------------------------------------------------------\n\n--\n-- Struttura della tabella `commenti`\n--\n\nCREATE TABLE `commenti` (\n  `codice_comm` smallint(6) NOT NULL,\n  `autore` char(20) DEFAULT NULL,\n  `codice_post` smallint(6) DEFAULT NULL\n) ENGINE=InnoDB DEFAULT CHARSET=latin1;\n\n# log 2019-07-22 13:52:40 root\n--\n-- Indici per le tabelle `commenti`\n--\nALTER TABLE `commenti`\n  ADD PRIMARY KEY (`codice_comm`),\n  ADD KEY `codice_post` (`codice_post`),\n  ADD KEY `commenti_ibfk_1` (`autore`);\n\n# log 2019-07-22 13:52:41 root\n--\n-- Limiti per la tabella `commenti`\n--\nALTER TABLE `commenti`\n  ADD CONSTRAINT `commenti_ibfk_1` FOREIGN KEY (`autore`) REFERENCES `utenti` (`user`) ON DELETE NO ACTION ON UPDATE CASCADE,\n  ADD CONSTRAINT `commenti_ibfk_2` FOREIGN KEY (`codice_post`) REFERENCES `post` (`codice_post`) ON DELETE NO ACTION ON UPDATE NO ACTION;\n\n# log 2019-09-15 09:08:00 root\n\n            RENAME TABLE `commenti`\n                  TO `old_db`.`commenti`;\n# log 2019-09-15 10:57:23 root\nALTER TABLE `commenti` DROP FOREIGN KEY `fk_Commenti_Post1`;\n# log 2019-09-15 10:57:23 root\nALTER TABLE `commenti` ADD  CONSTRAINT `fk_Commenti_Post1` FOREIGN KEY (`id_post`) REFERENCES `post`(`id_post`) ON DELETE CASCADE ON UPDATE CASCADE;\n# log 2019-09-15 10:57:23 root\nALTER TABLE `commenti` DROP FOREIGN KEY `fk_Commenti_Utenti1`;\n# log 2019-09-15 10:57:23 root\nALTER TABLE `commenti` ADD  CONSTRAINT `fk_Commenti_Utenti1` FOREIGN KEY (`id_utente`) REFERENCES `utenti`(`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE;\n# log 2019-11-09 19:01:09 root\n\n            RENAME TABLE `commenti`\n                  TO `rockyourblog`.`commenti`;\n# log 2019-11-10 16:10:27 root\n\n            RENAME TABLE `commenti`\n                  TO `newdb`.`commenti`;\n# log 2019-11-11 15:10:25 root\n\n            RENAME TABLE `commenti`\n                  TO `rockyourblog`.`commenti`;\n# log 2019-11-26 11:32:49 root\n\n            RENAME TABLE `commenti`\n                  TO `ultimodbprimadistile`.`commenti`;\n# log 2019-11-26 11:34:00 root\n-- --------------------------------------------------------\n\n--\n-- Struttura della tabella `commenti`\n--\n\nCREATE TABLE `commenti` (\n  `id_commenti` int(11) NOT NULL,\n  `id_utente` int(11) NOT NULL,\n  `id_post` int(11) NOT NULL,\n  `testo` text COLLATE utf8_bin,\n  `valutazione` int(11) DEFAULT NULL,\n  `data` datetime DEFAULT NULL\n) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;\n\n# log 2019-11-26 11:34:01 root\n--\n-- Indici per le tabelle `commenti`\n--\nALTER TABLE `commenti`\n  ADD PRIMARY KEY (`id_commenti`),\n  ADD UNIQUE KEY `idCommenti_UNIQUE` (`id_commenti`),\n  ADD KEY `fk_Commenti_Utenti1_idx` (`id_utente`),\n  ADD KEY `fk_Commenti_Post1_idx` (`id_post`);\n\n# log 2019-11-26 11:34:02 root\n--\n-- AUTO_INCREMENT per la tabella `commenti`\n--\nALTER TABLE `commenti`\n  MODIFY `id_commenti` int(11) NOT NULL AUTO_INCREMENT;\n\n# log 2019-11-26 11:34:03 root\n--\n-- Limiti per la tabella `commenti`\n--\nALTER TABLE `commenti`\n  ADD CONSTRAINT `fk_Commenti_Post1` FOREIGN KEY (`id_post`) REFERENCES `post` (`id_post`) ON DELETE CASCADE ON UPDATE CASCADE,\n  ADD CONSTRAINT `fk_Commenti_Utenti1` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE;\n', '\n', 'UPDATE,INSERT,DELETE,TRUNCATE,CREATE TABLE,ALTER TABLE,RENAME TABLE,DROP TABLE,CREATE INDEX,DROP INDEX,CREATE VIEW,ALTER VIEW,DROP VIEW', 1);

--
-- Metadati per tabella post
--

--
-- Dump dei dati per la tabella `pma__tracking`
--

INSERT INTO `pma__tracking` (`db_name`, `table_name`, `version`, `date_created`, `date_updated`, `schema_snapshot`, `schema_sql`, `data_sql`, `tracking`, `tracking_active`) VALUES
('rock_your_blog', 'post', 1, '2019-07-15 10:52:37', '2019-11-26 11:34:03', 'a:2:{s:7:\"COLUMNS\";a:3:{i:0;a:8:{s:5:\"Field\";s:11:\"codice_post\";s:4:\"Type\";s:11:\"smallint(6)\";s:9:\"Collation\";N;s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:3:\"PRI\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:1;a:8:{s:5:\"Field\";s:6:\"autore\";s:4:\"Type\";s:8:\"char(20)\";s:9:\"Collation\";s:17:\"latin1_swedish_ci\";s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:3:\"MUL\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:2;a:8:{s:5:\"Field\";s:11:\"titolo_blog\";s:4:\"Type\";s:8:\"char(40)\";s:9:\"Collation\";s:17:\"latin1_swedish_ci\";s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:3:\"MUL\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}}s:7:\"INDEXES\";a:3:{i:0;a:13:{s:5:\"Table\";s:4:\"post\";s:10:\"Non_unique\";s:1:\"0\";s:8:\"Key_name\";s:7:\"PRIMARY\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:11:\"codice_post\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"0\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}i:1;a:13:{s:5:\"Table\";s:4:\"post\";s:10:\"Non_unique\";s:1:\"1\";s:8:\"Key_name\";s:11:\"titolo_blog\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:11:\"titolo_blog\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"0\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:3:\"YES\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}i:2;a:13:{s:5:\"Table\";s:4:\"post\";s:10:\"Non_unique\";s:1:\"1\";s:8:\"Key_name\";s:11:\"post_ibfk_1\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:6:\"autore\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"0\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:3:\"YES\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}}}', '# log 2019-07-15 10:52:37 root\nDROP TABLE IF EXISTS `post`;\n# log 2019-07-15 10:52:37 root\n\nCREATE TABLE `post` (\n  `codice_post` smallint(6) NOT NULL,\n  `autore` char(20) DEFAULT NULL,\n  `titolo_blog` char(40) DEFAULT NULL\n) ENGINE=InnoDB DEFAULT CHARSET=latin1;\n\n# log 2019-07-22 13:52:39 root\n-- --------------------------------------------------------\n\n--\n-- Struttura della tabella `post`\n--\n\nCREATE TABLE `post` (\n  `codice_post` smallint(6) NOT NULL,\n  `autore` char(20) DEFAULT NULL,\n  `titolo_blog` char(40) DEFAULT NULL\n) ENGINE=InnoDB DEFAULT CHARSET=latin1;\n\n# log 2019-07-22 13:52:40 root\n--\n-- Indici per le tabelle `post`\n--\nALTER TABLE `post`\n  ADD PRIMARY KEY (`codice_post`),\n  ADD KEY `titolo_blog` (`titolo_blog`),\n  ADD KEY `post_ibfk_1` (`autore`);\n\n# log 2019-07-22 13:52:41 root\n--\n-- Limiti per la tabella `post`\n--\nALTER TABLE `post`\n  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`autore`) REFERENCES `utenti` (`user`) ON DELETE NO ACTION ON UPDATE CASCADE,\n  ADD CONSTRAINT `post_ibfk_2` FOREIGN KEY (`titolo_blog`) REFERENCES `blog` (`titolo`) ON DELETE NO ACTION ON UPDATE CASCADE;\n\n# log 2019-09-09 16:44:21 root\nALTER TABLE `post` ;\n# log 2019-09-09 16:44:25 root\nALTER TABLE `post` ;\n# log 2019-09-15 09:08:00 root\n\n            RENAME TABLE `post`\n                  TO `old_db`.`post`;\n# log 2019-09-15 10:57:42 root\nALTER TABLE `post` DROP FOREIGN KEY `fk_Post_Blog1`;\n# log 2019-09-15 10:57:42 root\nALTER TABLE `post` ADD  CONSTRAINT `fk_Post_Blog1` FOREIGN KEY (`id_blog`) REFERENCES `blog`(`id_blog`) ON DELETE CASCADE ON UPDATE CASCADE;\n# log 2019-09-15 10:57:42 root\nALTER TABLE `post` DROP FOREIGN KEY `fk_Post_Utenti1`;\n# log 2019-09-15 10:57:42 root\nALTER TABLE `post` ADD  CONSTRAINT `fk_Post_Utenti1` FOREIGN KEY (`id_utente`) REFERENCES `utenti`(`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE;\n# log 2019-09-18 13:11:53 root\nALTER TABLE `post` CHANGE `immagine` `immagine` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;\n# log 2019-09-18 13:21:41 root\nALTER TABLE `post` CHANGE `immagine` `url_immagine` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;\n# log 2019-09-20 13:50:31 root\nALTER TABLE `post` DROP `categoria`;\n# log 2019-09-23 21:13:05 root\nALTER TABLE `post` CHANGE `id_post` `id_post` INT NOT NULL AUTO_INCREMENT;\n# log 2019-10-23 11:23:38 root\nALTER TABLE `post` CHANGE `testo` `testo` BLOB;\n# log 2019-10-23 11:23:38 root\nALTER TABLE `post` CHANGE `testo` `testo` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL;\n# log 2019-10-23 11:24:29 root\nALTER TABLE `post` CHANGE `testo` `testo` BLOB;\n# log 2019-10-23 11:24:29 root\nALTER TABLE `post` CHANGE `testo` `testo` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;\n# log 2019-10-24 19:14:04 root\nALTER TABLE `post`  ADD `valutazione` INT(11) NOT NULL  AFTER `url_immagine`;\n# log 2019-10-29 16:28:45 root\nALTER TABLE `post` CHANGE `titolo` `titolo` BLOB;\n# log 2019-10-29 16:28:45 root\nALTER TABLE `post` CHANGE `testo` `testo` BLOB;\n# log 2019-10-29 16:28:45 root\nALTER TABLE `post` CHANGE `url_immagine` `url_immagine` BLOB;\n# log 2019-10-29 16:28:45 root\nALTER TABLE `post` CHANGE `titolo` `titolo` VARCHAR(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL, CHANGE `testo` `testo` TEXT CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL, CHANGE `url_immagine` `url_immagine` VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL;\n# log 2019-10-29 16:56:41 root\nALTER TABLE `post` CHANGE `titolo` `titolo` BLOB;\n# log 2019-10-29 16:56:41 root\nALTER TABLE `post` CHANGE `testo` `testo` BLOB;\n# log 2019-10-29 16:56:41 root\nALTER TABLE `post` CHANGE `url_immagine` `url_immagine` BLOB;\n# log 2019-10-29 16:56:41 root\nALTER TABLE `post` CHANGE `titolo` `titolo` VARCHAR(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `testo` `testo` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL, CHANGE `url_immagine` `url_immagine` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;\n# log 2019-11-09 19:01:09 root\n\n            RENAME TABLE `post`\n                  TO `rockyourblog`.`post`;\n# log 2019-11-10 16:10:27 root\n\n            RENAME TABLE `post`\n                  TO `newdb`.`post`;\n# log 2019-11-11 15:10:25 root\n\n            RENAME TABLE `post`\n                  TO `rockyourblog`.`post`;\n# log 2019-11-26 11:32:49 root\n\n            RENAME TABLE `post`\n                  TO `ultimodbprimadistile`.`post`;\n# log 2019-11-26 11:34:00 root\n-- --------------------------------------------------------\n\n--\n-- Struttura della tabella `post`\n--\n\nCREATE TABLE `post` (\n  `id_post` int(11) NOT NULL,\n  `id_utente` int(11) NOT NULL,\n  `id_blog` int(11) NOT NULL,\n  `titolo` varchar(45) COLLATE utf8_bin NOT NULL,\n  `testo` text COLLATE utf8_bin,\n  `url_immagine` varchar(255) COLLATE utf8_bin DEFAULT NULL,\n  `valutazione` int(11) DEFAULT NULL,\n  `data` datetime DEFAULT NULL\n) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;\n\n# log 2019-11-26 11:34:01 root\n--\n-- Indici per le tabelle `post`\n--\nALTER TABLE `post`\n  ADD PRIMARY KEY (`id_post`),\n  ADD UNIQUE KEY `idPost_UNIQUE` (`id_post`),\n  ADD KEY `fk_Post_Utenti1_idx` (`id_utente`),\n  ADD KEY `fk_Post_Blog1_idx` (`id_blog`);\n\n# log 2019-11-26 11:34:02 root\n--\n-- AUTO_INCREMENT per la tabella `post`\n--\nALTER TABLE `post`\n  MODIFY `id_post` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;\n\n# log 2019-11-26 11:34:03 root\n--\n-- Limiti per la tabella `post`\n--\nALTER TABLE `post`\n  ADD CONSTRAINT `fk_Post_Blog1` FOREIGN KEY (`id_blog`) REFERENCES `blog` (`id_blog`) ON DELETE CASCADE ON UPDATE CASCADE,\n  ADD CONSTRAINT `fk_Post_Utenti1` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE;\n', '\n\n# log 2019-07-29 15:42:57 root\nDELETE FROM `post` WHERE `post`.`codice_post` = 0;\n\n# log 2019-07-29 15:44:40 root\nDELETE FROM `post` WHERE `post`.`codice_post` = 0;\n\n# log 2019-07-29 15:47:49 root\nDELETE FROM `post` WHERE `post`.`codice_post` = 0;\n\n# log 2019-07-31 19:29:35 root\nDELETE FROM `post` WHERE `post`.`codice_post` = 0;\n\n# log 2019-08-01 09:53:21 root\nDELETE FROM `post` WHERE `post`.`codice_post` = 0;\n\n# log 2019-09-23 12:00:44 root\nDELETE FROM `post` WHERE `post`.`id_post` = 1;\n\n# log 2019-09-23 12:00:54 root\nDELETE FROM `post` WHERE `post`.`id_post` = 2;\n\n# log 2019-09-23 12:01:11 root\nDELETE FROM `post` WHERE `post`.`id_post` = 17;\n\n# log 2019-09-23 12:01:38 root\nDELETE FROM `post` WHERE `post`.`id_post` = 3 LIMIT 1;\n# log 2019-09-23 12:01:38 root\nDELETE FROM `post` WHERE `post`.`id_post` = 4 LIMIT 1;\n# log 2019-09-23 12:01:38 root\nDELETE FROM `post` WHERE `post`.`id_post` = 5 LIMIT 1;\n# log 2019-09-23 12:01:38 root\nDELETE FROM `post` WHERE `post`.`id_post` = 6 LIMIT 1;\n# log 2019-09-23 12:01:38 root\nDELETE FROM `post` WHERE `post`.`id_post` = 7 LIMIT 1;\n# log 2019-09-23 12:01:38 root\nDELETE FROM `post` WHERE `post`.`id_post` = 8 LIMIT 1;\n# log 2019-09-23 12:01:38 root\nDELETE FROM `post` WHERE `post`.`id_post` = 9 LIMIT 1;\n# log 2019-09-23 12:01:38 root\nDELETE FROM `post` WHERE `post`.`id_post` = 10 LIMIT 1;\n# log 2019-09-23 12:01:38 root\nDELETE FROM `post` WHERE `post`.`id_post` = 11 LIMIT 1;\n# log 2019-09-23 12:01:38 root\nDELETE FROM `post` WHERE `post`.`id_post` = 12 LIMIT 1;\n# log 2019-09-23 12:01:38 root\nDELETE FROM `post` WHERE `post`.`id_post` = 13 LIMIT 1;\n# log 2019-09-23 12:01:38 root\nDELETE FROM `post` WHERE `post`.`id_post` = 14 LIMIT 1;\n# log 2019-09-23 12:01:38 root\nDELETE FROM `post` WHERE `post`.`id_post` = 15 LIMIT 1;\n# log 2019-09-23 12:01:38 root\nDELETE FROM `post` WHERE `post`.`id_post` = 16 LIMIT 1;\n# log 2019-09-23 15:01:50 root\nDELETE FROM `post` WHERE `post`.`id_post` = 21;\n\n# log 2019-09-23 15:01:53 root\nDELETE FROM `post` WHERE `post`.`id_post` = 20;\n\n# log 2019-09-23 15:01:55 root\nDELETE FROM `post` WHERE `post`.`id_post` = 19;\n\n# log 2019-09-23 15:01:57 root\nDELETE FROM `post` WHERE `post`.`id_post` = 18;\n\n# log 2019-09-24 14:57:27 root\nDELETE FROM `post` WHERE `post`.`id_post` = 1;\n\n# log 2019-09-24 14:57:49 root\nDELETE FROM `post` WHERE `post`.`id_post` = 2 LIMIT 1;\n# log 2019-09-24 14:57:49 root\nDELETE FROM `post` WHERE `post`.`id_post` = 3 LIMIT 1;\n# log 2019-09-24 14:57:49 root\nDELETE FROM `post` WHERE `post`.`id_post` = 4 LIMIT 1;\n# log 2019-09-24 14:57:49 root\nDELETE FROM `post` WHERE `post`.`id_post` = 5 LIMIT 1;\n# log 2019-09-24 14:57:49 root\nDELETE FROM `post` WHERE `post`.`id_post` = 6 LIMIT 1;\n# log 2019-09-24 14:57:49 root\nDELETE FROM `post` WHERE `post`.`id_post` = 7 LIMIT 1;\n# log 2019-09-24 14:57:49 root\nDELETE FROM `post` WHERE `post`.`id_post` = 8 LIMIT 1;\n# log 2019-09-24 14:57:49 root\nDELETE FROM `post` WHERE `post`.`id_post` = 9 LIMIT 1;\n# log 2019-09-24 14:57:49 root\nDELETE FROM `post` WHERE `post`.`id_post` = 10 LIMIT 1;\n# log 2019-09-24 14:57:49 root\nDELETE FROM `post` WHERE `post`.`id_post` = 11 LIMIT 1;\n# log 2019-09-24 14:57:49 root\nDELETE FROM `post` WHERE `post`.`id_post` = 12 LIMIT 1;\n# log 2019-09-24 14:57:49 root\nDELETE FROM `post` WHERE `post`.`id_post` = 13 LIMIT 1;\n# log 2019-09-24 14:57:49 root\nDELETE FROM `post` WHERE `post`.`id_post` = 14 LIMIT 1;\n# log 2019-09-24 14:57:49 root\nDELETE FROM `post` WHERE `post`.`id_post` = 15 LIMIT 1;\n# log 2019-09-24 14:57:49 root\nDELETE FROM `post` WHERE `post`.`id_post` = 16 LIMIT 1;\n# log 2019-09-24 14:57:49 root\nDELETE FROM `post` WHERE `post`.`id_post` = 17 LIMIT 1;\n# log 2019-09-24 14:57:49 root\nDELETE FROM `post` WHERE `post`.`id_post` = 18 LIMIT 1;\n# log 2019-09-24 14:57:49 root\nDELETE FROM `post` WHERE `post`.`id_post` = 19 LIMIT 1;\n# log 2019-09-24 14:57:49 root\nDELETE FROM `post` WHERE `post`.`id_post` = 20 LIMIT 1;\n# log 2019-09-24 14:57:49 root\nDELETE FROM `post` WHERE `post`.`id_post` = 21 LIMIT 1;\n# log 2019-09-24 14:57:49 root\nDELETE FROM `post` WHERE `post`.`id_post` = 22 LIMIT 1;\n# log 2019-09-24 14:57:49 root\nDELETE FROM `post` WHERE `post`.`id_post` = 23 LIMIT 1;\n# log 2019-09-24 14:57:49 root\nDELETE FROM `post` WHERE `post`.`id_post` = 24 LIMIT 1;\n# log 2019-09-25 10:09:39 root\nDELETE FROM `post` WHERE `post`.`id_post` = 28 LIMIT 1;\n# log 2019-09-25 10:09:39 root\nDELETE FROM `post` WHERE `post`.`id_post` = 29 LIMIT 1;\n# log 2019-09-25 10:09:39 root\nDELETE FROM `post` WHERE `post`.`id_post` = 30 LIMIT 1;\n# log 2019-09-26 09:22:58 root\nDELETE FROM `post` WHERE `post`.`id_post` = 27;\n\n# log 2019-09-26 09:41:34 root\nUPDATE `post` SET `testo` = \'Tim Burton Ã¨ tra i miei registi preferiti. Stile unico, atmosfere grottesche, come fare a non amarlo? Ogni storia presenta quell\\\'aura misteriosa che la rende tanto intrigante. Gli attori, poi, sempre azzeccatissimi: a cominciare da Helena Bonham Carter, immancabile e insostituibile, e a finire con Johnny Depp, affascinante e sempre adatto.\' WHERE `post`.`id_post` = 26;\n\n# log 2019-11-06 10:34:36 root\nDELETE FROM `post` WHERE `post`.`id_post` = 46 LIMIT 1;\n# log 2019-11-06 10:34:36 root\nDELETE FROM `post` WHERE `post`.`id_post` = 47 LIMIT 1;\n# log 2019-11-06 10:34:36 root\nDELETE FROM `post` WHERE `post`.`id_post` = 48 LIMIT 1;\n# log 2019-11-06 10:34:36 root\nDELETE FROM `post` WHERE `post`.`id_post` = 49 LIMIT 1;\n# log 2019-11-06 10:34:36 root\nDELETE FROM `post` WHERE `post`.`id_post` = 50 LIMIT 1;\n# log 2019-11-06 10:34:36 root\nDELETE FROM `post` WHERE `post`.`id_post` = 51 LIMIT 1;\n# log 2019-11-06 10:34:36 root\nDELETE FROM `post` WHERE `post`.`id_post` = 52 LIMIT 1;\n# log 2019-11-06 10:34:36 root\nDELETE FROM `post` WHERE `post`.`id_post` = 53 LIMIT 1;\n# log 2019-11-06 10:34:36 root\nDELETE FROM `post` WHERE `post`.`id_post` = 54 LIMIT 1;\n# log 2019-11-06 10:34:36 root\nDELETE FROM `post` WHERE `post`.`id_post` = 55 LIMIT 1;\n# log 2019-11-06 10:34:36 root\nDELETE FROM `post` WHERE `post`.`id_post` = 56 LIMIT 1;\n# log 2019-11-06 10:34:36 root\nDELETE FROM `post` WHERE `post`.`id_post` = 57 LIMIT 1;\n# log 2019-11-06 10:34:36 root\nDELETE FROM `post` WHERE `post`.`id_post` = 58 LIMIT 1;\n# log 2019-11-06 10:34:36 root\nDELETE FROM `post` WHERE `post`.`id_post` = 59 LIMIT 1;\n# log 2019-11-06 10:34:36 root\nDELETE FROM `post` WHERE `post`.`id_post` = 60 LIMIT 1;\n# log 2019-11-06 10:34:36 root\nDELETE FROM `post` WHERE `post`.`id_post` = 61 LIMIT 1;\n# log 2019-11-06 10:34:36 root\nDELETE FROM `post` WHERE `post`.`id_post` = 62 LIMIT 1;\n# log 2019-11-06 10:34:36 root\nDELETE FROM `post` WHERE `post`.`id_post` = 65 LIMIT 1;', 'UPDATE,INSERT,DELETE,TRUNCATE,CREATE TABLE,ALTER TABLE,RENAME TABLE,DROP TABLE,CREATE INDEX,DROP INDEX,CREATE VIEW,ALTER VIEW,DROP VIEW', 1);

--
-- Metadati per tabella premium
--

--
-- Dump dei dati per la tabella `pma__tracking`
--

INSERT INTO `pma__tracking` (`db_name`, `table_name`, `version`, `date_created`, `date_updated`, `schema_snapshot`, `schema_sql`, `data_sql`, `tracking`, `tracking_active`) VALUES
('rock_your_blog', 'premium', 1, '2019-07-15 10:52:37', '2019-11-26 11:34:03', 'a:2:{s:7:\"COLUMNS\";a:3:{i:0;a:8:{s:5:\"Field\";s:14:\"codice_premium\";s:4:\"Type\";s:11:\"smallint(6)\";s:9:\"Collation\";N;s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:3:\"PRI\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:1;a:8:{s:5:\"Field\";s:4:\"user\";s:4:\"Type\";s:8:\"char(20)\";s:9:\"Collation\";s:17:\"latin1_swedish_ci\";s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:3:\"MUL\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:2;a:8:{s:5:\"Field\";s:9:\"num_carta\";s:4:\"Type\";s:10:\"bigint(20)\";s:9:\"Collation\";N;s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:3:\"MUL\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}}s:7:\"INDEXES\";a:3:{i:0;a:13:{s:5:\"Table\";s:7:\"premium\";s:10:\"Non_unique\";s:1:\"0\";s:8:\"Key_name\";s:7:\"PRIMARY\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:14:\"codice_premium\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"0\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}i:1;a:13:{s:5:\"Table\";s:7:\"premium\";s:10:\"Non_unique\";s:1:\"1\";s:8:\"Key_name\";s:14:\"premium_ibfk_3\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:9:\"num_carta\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"0\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:3:\"YES\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}i:2;a:13:{s:5:\"Table\";s:7:\"premium\";s:10:\"Non_unique\";s:1:\"1\";s:8:\"Key_name\";s:14:\"premium_ibfk_2\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:4:\"user\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"0\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:3:\"YES\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}}}', '# log 2019-07-15 10:52:37 root\nDROP TABLE IF EXISTS `premium`;\n# log 2019-07-15 10:52:37 root\n\nCREATE TABLE `premium` (\n  `codice_premium` smallint(6) NOT NULL,\n  `user` char(20) DEFAULT NULL,\n  `num_carta` bigint(20) DEFAULT NULL\n) ENGINE=InnoDB DEFAULT CHARSET=latin1;\n\n# log 2019-07-22 13:52:40 root\n-- --------------------------------------------------------\n\n--\n-- Struttura della tabella `premium`\n--\n\nCREATE TABLE `premium` (\n  `codice_premium` smallint(6) NOT NULL,\n  `user` char(20) DEFAULT NULL,\n  `num_carta` bigint(20) DEFAULT NULL\n) ENGINE=InnoDB DEFAULT CHARSET=latin1;\n\n# log 2019-07-22 13:52:41 root\n--\n-- Indici per le tabelle `premium`\n--\nALTER TABLE `premium`\n  ADD PRIMARY KEY (`codice_premium`),\n  ADD KEY `premium_ibfk_3` (`num_carta`),\n  ADD KEY `premium_ibfk_2` (`user`);\n\n# log 2019-07-22 13:52:42 root\n--\n-- Limiti per la tabella `premium`\n--\nALTER TABLE `premium`\n  ADD CONSTRAINT `premium_ibfk_1` FOREIGN KEY (`codice_premium`) REFERENCES `abbonamenti` (`codice_abb`) ON DELETE NO ACTION ON UPDATE NO ACTION,\n  ADD CONSTRAINT `premium_ibfk_2` FOREIGN KEY (`user`) REFERENCES `utenti` (`user`) ON DELETE NO ACTION ON UPDATE CASCADE,\n  ADD CONSTRAINT `premium_ibfk_3` FOREIGN KEY (`num_carta`) REFERENCES `carta` (`num_carta`) ON DELETE NO ACTION ON UPDATE CASCADE;\n\n# log 2019-09-15 09:08:00 root\n\n            RENAME TABLE `premium`\n                  TO `old_db`.`premium`;\n# log 2019-09-15 10:57:57 root\nALTER TABLE `premium` DROP FOREIGN KEY `fk_Premium_Utenti1`;\n# log 2019-09-15 10:57:57 root\nALTER TABLE `premium` ADD  CONSTRAINT `fk_Premium_Utenti1` FOREIGN KEY (`id_utente`) REFERENCES `utenti`(`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE;\n# log 2019-09-15 10:57:57 root\nALTER TABLE `premium` DROP FOREIGN KEY `fk_premium_carte1`;\n# log 2019-09-15 10:57:57 root\nALTER TABLE `premium` ADD  CONSTRAINT `fk_premium_carte1` FOREIGN KEY (`id_carta`) REFERENCES `carte`(`id_carta`) ON DELETE CASCADE ON UPDATE CASCADE;\n# log 2019-11-09 19:01:09 root\n\n            RENAME TABLE `premium`\n                  TO `rockyourblog`.`premium`;\n# log 2019-11-10 16:10:27 root\n\n            RENAME TABLE `premium`\n                  TO `newdb`.`premium`;\n# log 2019-11-11 15:10:25 root\n\n            RENAME TABLE `premium`\n                  TO `rockyourblog`.`premium`;\n# log 2019-11-26 11:32:49 root\n\n            RENAME TABLE `premium`\n                  TO `ultimodbprimadistile`.`premium`;\n# log 2019-11-26 11:34:00 root\n-- --------------------------------------------------------\n\n--\n-- Struttura della tabella `premium`\n--\n\nCREATE TABLE `premium` (\n  `id_premium` int(11) NOT NULL,\n  `id_utente` int(11) NOT NULL,\n  `id_carta` int(11) NOT NULL,\n  `data_inizio` date NOT NULL,\n  `data_fine` date NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;\n\n# log 2019-11-26 11:34:01 root\n--\n-- Indici per le tabelle `premium`\n--\nALTER TABLE `premium`\n  ADD PRIMARY KEY (`id_premium`),\n  ADD UNIQUE KEY `idPremium_UNIQUE` (`id_premium`),\n  ADD KEY `fk_Premium_Utenti1_idx` (`id_utente`),\n  ADD KEY `fk_premium_carte1_idx` (`id_carta`);\n\n# log 2019-11-26 11:34:02 root\n--\n-- AUTO_INCREMENT per la tabella `premium`\n--\nALTER TABLE `premium`\n  MODIFY `id_premium` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;\n\n# log 2019-11-26 11:34:03 root\n--\n-- Limiti per la tabella `premium`\n--\nALTER TABLE `premium`\n  ADD CONSTRAINT `fk_Premium_Utenti1` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE,\n  ADD CONSTRAINT `fk_premium_carte1` FOREIGN KEY (`id_carta`) REFERENCES `carte` (`id_carta`) ON DELETE CASCADE ON UPDATE CASCADE;\n', '\n\n# log 2019-07-22 13:52:40 root\n--\n-- Dump dei dati per la tabella `premium`\n--\n\nINSERT INTO `premium` (`codice_premium`, `user`, `num_carta`) VALUES\n(1, \'AlessioAdmin\', 1234123412341234);\n\n# log 2019-10-05 19:43:51 root\nDELETE FROM `premium` WHERE `premium`.`id_premium` = 1;\n\n# log 2019-10-05 19:48:46 root\nDELETE FROM `premium` WHERE `premium`.`id_premium` = 3;\n\n# log 2019-11-14 15:40:51 root\nDELETE FROM `premium` WHERE `premium`.`id_premium` = 7;\n\n# log 2019-11-26 11:34:00 root\n--\n-- Dump dei dati per la tabella `premium`\n--\n\nINSERT INTO `premium` (`id_premium`, `id_utente`, `id_carta`, `data_inizio`, `data_fine`) VALUES\n(10, 21, 21, \'2019-11-18\', \'2020-11-18\');\n', 'UPDATE,INSERT,DELETE,TRUNCATE,CREATE TABLE,ALTER TABLE,RENAME TABLE,DROP TABLE,CREATE INDEX,DROP INDEX,CREATE VIEW,ALTER VIEW,DROP VIEW', 1);

--
-- Metadati per tabella profilo
--

--
-- Dump dei dati per la tabella `pma__tracking`
--

INSERT INTO `pma__tracking` (`db_name`, `table_name`, `version`, `date_created`, `date_updated`, `schema_snapshot`, `schema_sql`, `data_sql`, `tracking`, `tracking_active`) VALUES
('rock_your_blog', 'profilo', 1, '2019-07-15 10:52:37', '2019-11-26 11:34:03', 'a:2:{s:7:\"COLUMNS\";a:6:{i:0;a:8:{s:5:\"Field\";s:4:\"user\";s:4:\"Type\";s:8:\"char(20)\";s:9:\"Collation\";s:17:\"latin1_swedish_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:3:\"PRI\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:1;a:8:{s:5:\"Field\";s:6:\"titolo\";s:4:\"Type\";s:8:\"char(30)\";s:9:\"Collation\";s:17:\"latin1_swedish_ci\";s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:2;a:8:{s:5:\"Field\";s:4:\"etÃ \";s:4:\"Type\";s:10:\"tinyint(4)\";s:9:\"Collation\";N;s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:3:\"MUL\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:3;a:8:{s:5:\"Field\";s:6:\"cittÃ \";s:4:\"Type\";s:8:\"char(20)\";s:9:\"Collation\";s:17:\"latin1_swedish_ci\";s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:4;a:8:{s:5:\"Field\";s:4:\"foto\";s:4:\"Type\";s:11:\"varchar(50)\";s:9:\"Collation\";s:17:\"latin1_swedish_ci\";s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:5;a:8:{s:5:\"Field\";s:3:\"bio\";s:4:\"Type\";s:8:\"tinytext\";s:9:\"Collation\";s:17:\"latin1_swedish_ci\";s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}}s:7:\"INDEXES\";a:2:{i:0;a:13:{s:5:\"Table\";s:7:\"profilo\";s:10:\"Non_unique\";s:1:\"0\";s:8:\"Key_name\";s:7:\"PRIMARY\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:4:\"user\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"0\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}i:1;a:13:{s:5:\"Table\";s:7:\"profilo\";s:10:\"Non_unique\";s:1:\"1\";s:8:\"Key_name\";s:4:\"etÃ \";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:4:\"etÃ \";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"0\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:3:\"YES\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}}}', '# log 2019-07-15 10:52:37 root\nDROP TABLE IF EXISTS `profilo`;\n# log 2019-07-15 10:52:37 root\n\nCREATE TABLE `profilo` (\n  `user` char(20) NOT NULL,\n  `titolo` char(30) DEFAULT NULL,\n  `etÃ ` tinyint(4) DEFAULT NULL,\n  `cittÃ ` char(20) DEFAULT NULL,\n  `foto` varchar(50) DEFAULT NULL,\n  `bio` tinytext\n) ENGINE=InnoDB DEFAULT CHARSET=latin1;\n\n# log 2019-07-22 13:52:40 root\n-- --------------------------------------------------------\n\n--\n-- Struttura della tabella `profilo`\n--\n\nCREATE TABLE `profilo` (\n  `user` char(20) NOT NULL,\n  `titolo` char(30) DEFAULT NULL,\n  `etÃ ` tinyint(4) DEFAULT NULL,\n  `cittÃ ` char(20) DEFAULT NULL,\n  `foto` varchar(50) DEFAULT NULL,\n  `bio` tinytext\n) ENGINE=InnoDB DEFAULT CHARSET=latin1;\n\n# log 2019-07-22 13:52:41 root\n--\n-- Indici per le tabelle `profilo`\n--\nALTER TABLE `profilo`\n  ADD PRIMARY KEY (`user`),\n  ADD KEY `etÃ ` (`etÃ `);\n\n# log 2019-07-22 13:52:42 root\n--\n-- Limiti per la tabella `profilo`\n--\nALTER TABLE `profilo`\n  ADD CONSTRAINT `profilo_ibfk_1` FOREIGN KEY (`user`) REFERENCES `utenti` (`user`) ON DELETE NO ACTION ON UPDATE CASCADE,\n  ADD CONSTRAINT `profilo_ibfk_2` FOREIGN KEY (`etÃ `) REFERENCES `utenti` (`etÃ `) ON DELETE NO ACTION ON UPDATE CASCADE;\n\n# log 2019-09-15 09:08:00 root\n\n            RENAME TABLE `profilo`\n                  TO `old_db`.`profilo`;\n# log 2019-09-15 10:58:55 root\nALTER TABLE `profilo` DROP FOREIGN KEY `fk_profilo_utenti1`;\n# log 2019-09-15 10:58:55 root\nALTER TABLE `profilo` ADD  CONSTRAINT `fk_profilo_utenti1` FOREIGN KEY (`id_utente`) REFERENCES `utenti`(`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE;\n# log 2019-09-16 13:27:26 root\nALTER TABLE `profilo` DROP `titolo`;\n# log 2019-09-16 13:27:33 root\nALTER TABLE `profilo` DROP `cognome`;\n# log 2019-09-16 13:27:50 root\nALTER TABLE `profilo` CHANGE `nome` `nome` VARCHAR(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;\n# log 2019-09-16 13:36:26 root\nALTER TABLE `profilo`  ADD `cognome` VARCHAR(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL  AFTER `nome`;\n# log 2019-09-16 13:36:41 root\nALTER TABLE `profilo` CHANGE `nome` `nome` VARCHAR(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;\n# log 2019-11-09 19:01:09 root\n\n            RENAME TABLE `profilo`\n                  TO `rockyourblog`.`profilo`;\n# log 2019-11-10 16:10:27 root\n\n            RENAME TABLE `profilo`\n                  TO `newdb`.`profilo`;\n# log 2019-11-11 15:10:25 root\n\n            RENAME TABLE `profilo`\n                  TO `rockyourblog`.`profilo`;\n# log 2019-11-26 11:32:50 root\n\n            RENAME TABLE `profilo`\n                  TO `ultimodbprimadistile`.`profilo`;\n# log 2019-11-26 11:34:00 root\n-- --------------------------------------------------------\n\n--\n-- Struttura della tabella `profilo`\n--\n\nCREATE TABLE `profilo` (\n  `id_profilo` int(11) NOT NULL,\n  `id_utente` int(11) NOT NULL,\n  `nome` varchar(45) COLLATE utf8_bin NOT NULL,\n  `cognome` varchar(45) COLLATE utf8_bin NOT NULL,\n  `eta` int(11) NOT NULL,\n  `citta` varchar(45) COLLATE utf8_bin NOT NULL,\n  `bio` varchar(255) COLLATE utf8_bin DEFAULT NULL,\n  `url_foto` varchar(255) COLLATE utf8_bin DEFAULT NULL\n) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;\n\n# log 2019-11-26 11:34:01 root\n--\n-- Indici per le tabelle `profilo`\n--\nALTER TABLE `profilo`\n  ADD PRIMARY KEY (`id_profilo`),\n  ADD UNIQUE KEY `idProfilo_UNIQUE` (`id_profilo`),\n  ADD KEY `fk_profilo_utenti1_idx` (`id_utente`);\n\n# log 2019-11-26 11:34:02 root\n--\n-- AUTO_INCREMENT per la tabella `profilo`\n--\nALTER TABLE `profilo`\n  MODIFY `id_profilo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;\n\n# log 2019-11-26 11:34:03 root\n--\n-- Limiti per la tabella `profilo`\n--\nALTER TABLE `profilo`\n  ADD CONSTRAINT `fk_profilo_utenti1` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE;\n', '\n\n# log 2019-07-29 20:18:46 root\nDELETE FROM `profilo` WHERE `profilo`.`user` = \'lollo\';\n\n# log 2019-09-26 11:22:29 root\nDELETE FROM `profilo` WHERE `profilo`.`id_profilo` = 1;\n\n# log 2019-09-26 11:51:46 root\nDELETE FROM `profilo` WHERE `profilo`.`id_profilo` = 2 LIMIT 1;\n# log 2019-09-26 11:51:46 root\nDELETE FROM `profilo` WHERE `profilo`.`id_profilo` = 3 LIMIT 1;\n# log 2019-09-26 11:51:46 root\nDELETE FROM `profilo` WHERE `profilo`.`id_profilo` = 4 LIMIT 1;\n# log 2019-09-26 11:51:46 root\nDELETE FROM `profilo` WHERE `profilo`.`id_profilo` = 5 LIMIT 1;\n# log 2019-09-26 11:51:46 root\nDELETE FROM `profilo` WHERE `profilo`.`id_profilo` = 6 LIMIT 1;\n# log 2019-09-26 11:51:46 root\nDELETE FROM `profilo` WHERE `profilo`.`id_profilo` = 7 LIMIT 1;\n# log 2019-09-26 11:51:46 root\nDELETE FROM `profilo` WHERE `profilo`.`id_profilo` = 8 LIMIT 1;\n# log 2019-11-06 10:39:36 root\nUPDATE `profilo` SET `url_foto` = NULL WHERE `profilo`.`id_profilo` = 10;\n\n# log 2019-11-06 10:39:36 root\nUPDATE `profilo` SET `url_foto` = NULL WHERE `profilo`.`id_profilo` = 13;\n\n# log 2019-11-06 10:39:36 root\nUPDATE `profilo` SET `url_foto` = NULL WHERE `profilo`.`id_profilo` = 14;\n\n# log 2019-11-06 10:39:36 root\nUPDATE `profilo` SET `url_foto` = NULL WHERE `profilo`.`id_profilo` = 15;\n\n# log 2019-11-06 10:39:36 root\nUPDATE `profilo` SET `url_foto` = NULL WHERE `profilo`.`id_profilo` = 17;\n\n# log 2019-11-06 10:39:36 root\nUPDATE `profilo` SET `url_foto` = NULL WHERE `profilo`.`id_profilo` = 18;\n\n# log 2019-11-06 15:45:12 root\nDELETE FROM `profilo` WHERE `profilo`.`id_profilo` = 19;\n\n# log 2019-11-26 11:34:00 root\n--\n-- Dump dei dati per la tabella `profilo`\n--\n\nINSERT INTO `profilo` (`id_profilo`, `id_utente`, `nome`, `cognome`, `eta`, `citta`, `bio`, `url_foto`) VALUES\n(13, 7, \'Bianca\', \'Neve\', 16, \'Roma\', \'Ciao!\', NULL),\n(14, 9, \'Chiara\', \'Giusti\', 21, \'Luino\', \'I don\\\\\\\'t know... If\', NULL),\n(16, 10, \'Francesca\', \'Poli\', 22, \'Pisa\', \'Ciao a tutti\', \'100020191020105527le-iene.jpg\'),\n(17, 11, \'Giada\', \'Giardi\', 16, \'Torino\', \'Ciao a tutti\', NULL),\n(18, 13, \'Mario\', \'Rossi\', 22, \'Milano\', \'ciao\', NULL),\n(25, 21, \'Simone\', \'Formicola\', 32, \'Grosseto\', \'Agente Immobiliare Gabetti\', \'99920191118172842gabetti.jpg\');\n', 'UPDATE,INSERT,DELETE,TRUNCATE,CREATE TABLE,ALTER TABLE,RENAME TABLE,DROP TABLE,CREATE INDEX,DROP INDEX,CREATE VIEW,ALTER VIEW,DROP VIEW', 1);

--
-- Metadati per tabella stili
--

--
-- Metadati per tabella utenti
--

--
-- Dump dei dati per la tabella `pma__tracking`
--

INSERT INTO `pma__tracking` (`db_name`, `table_name`, `version`, `date_created`, `date_updated`, `schema_snapshot`, `schema_sql`, `data_sql`, `tracking`, `tracking_active`) VALUES
('rock_your_blog', 'utenti', 1, '2019-07-15 10:52:37', '2020-01-06 10:16:05', 'a:2:{s:7:\"COLUMNS\";a:6:{i:0;a:8:{s:5:\"Field\";s:4:\"user\";s:4:\"Type\";s:8:\"char(20)\";s:9:\"Collation\";s:17:\"latin1_swedish_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:3:\"PRI\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:1;a:8:{s:5:\"Field\";s:4:\"nome\";s:4:\"Type\";s:8:\"char(20)\";s:9:\"Collation\";s:17:\"latin1_swedish_ci\";s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:2;a:8:{s:5:\"Field\";s:7:\"cognome\";s:4:\"Type\";s:8:\"char(30)\";s:9:\"Collation\";s:17:\"latin1_swedish_ci\";s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:3;a:8:{s:5:\"Field\";s:4:\"etÃ \";s:4:\"Type\";s:10:\"tinyint(3)\";s:9:\"Collation\";N;s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:3:\"MUL\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:4;a:8:{s:5:\"Field\";s:5:\"email\";s:4:\"Type\";s:12:\"varchar(320)\";s:9:\"Collation\";s:17:\"latin1_swedish_ci\";s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:5;a:8:{s:5:\"Field\";s:8:\"password\";s:4:\"Type\";s:12:\"varchar(100)\";s:9:\"Collation\";s:17:\"latin1_swedish_ci\";s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}}s:7:\"INDEXES\";a:2:{i:0;a:13:{s:5:\"Table\";s:6:\"utenti\";s:10:\"Non_unique\";s:1:\"0\";s:8:\"Key_name\";s:7:\"PRIMARY\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:4:\"user\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"2\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}i:1;a:13:{s:5:\"Table\";s:6:\"utenti\";s:10:\"Non_unique\";s:1:\"1\";s:8:\"Key_name\";s:4:\"etÃ \";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:4:\"etÃ \";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"2\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:3:\"YES\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}}}', '# log 2019-07-15 10:52:37 root\nDROP TABLE IF EXISTS `utenti`;\n# log 2019-07-15 10:52:37 root\n\nCREATE TABLE `utenti` (\n  `user` char(20) NOT NULL,\n  `nome` char(20) DEFAULT NULL,\n  `cognome` char(30) DEFAULT NULL,\n  `etÃ ` tinyint(3) DEFAULT NULL,\n  `email` varchar(320) DEFAULT NULL,\n  `password` varchar(100) DEFAULT NULL\n) ENGINE=InnoDB DEFAULT CHARSET=latin1;\n\n# log 2019-07-22 13:52:40 root\n-- --------------------------------------------------------\n\n--\n-- Struttura della tabella `utenti`\n--\n\nCREATE TABLE `utenti` (\n  `user` char(20) NOT NULL,\n  `nome` char(20) DEFAULT NULL,\n  `cognome` char(30) DEFAULT NULL,\n  `etÃ ` tinyint(3) DEFAULT NULL,\n  `email` char(40) DEFAULT NULL,\n  `password` char(20) DEFAULT NULL\n) ENGINE=InnoDB DEFAULT CHARSET=latin1;\n\n# log 2019-07-22 13:52:41 root\n--\n-- Indici per le tabelle `utenti`\n--\nALTER TABLE `utenti`\n  ADD PRIMARY KEY (`user`),\n  ADD KEY `etÃ ` (`etÃ `);\n\n# log 2019-09-15 09:08:00 root\n\n            RENAME TABLE `utenti`\n                  TO `old_db`.`utenti`;\n# log 2019-11-09 19:01:09 root\n\n            RENAME TABLE `utenti`\n                  TO `rockyourblog`.`utenti`;\n# log 2019-11-10 16:10:28 root\n\n            RENAME TABLE `utenti`\n                  TO `newdb`.`utenti`;\n# log 2019-11-11 15:10:25 root\n\n            RENAME TABLE `utenti`\n                  TO `rockyourblog`.`utenti`;\n# log 2019-11-26 11:32:50 root\n\n            RENAME TABLE `utenti`\n                  TO `ultimodbprimadistile`.`utenti`;\n# log 2019-11-26 11:34:00 root\n-- --------------------------------------------------------\n\n--\n-- Struttura della tabella `utenti`\n--\n\nCREATE TABLE `utenti` (\n  `id_utente` int(11) NOT NULL,\n  `username` varchar(45) COLLATE utf8_bin NOT NULL,\n  `email` varchar(45) COLLATE utf8_bin NOT NULL,\n  `password` varchar(45) COLLATE utf8_bin NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;\n\n# log 2019-11-26 11:34:01 root\n--\n-- Indici per le tabelle `utenti`\n--\nALTER TABLE `utenti`\n  ADD PRIMARY KEY (`id_utente`),\n  ADD UNIQUE KEY `id_utente_UNIQUE` (`id_utente`);\n\n# log 2019-11-26 11:34:02 root\n--\n-- AUTO_INCREMENT per la tabella `utenti`\n--\nALTER TABLE `utenti`\n  MODIFY `id_utente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;\n', '\n\n# log 2019-07-15 11:38:25 root\nDELETE FROM `utenti` WHERE `utenti`.`user` = \'FrancescaAdm\';\n\n# log 2019-07-22 13:52:40 root\n--\n-- Dump dei dati per la tabella `utenti`\n--\n\nINSERT INTO `utenti` (`user`, `nome`, `cognome`, `etÃ `, `email`, `password`) VALUES\n(\'AlessioAdmin\', \'Alessio\', \'Formicola\', 34, \'alessio.formicola@gmail.com\', \'AleFor85\'),\n(\'FrancescaAdm\', \'Francesca\', \'Poli\', 21, \'francesca.poli@gmail.com\', \'FraPoli98\');\n\n# log 2019-07-24 20:17:34 root\nDELETE FROM `utenti` WHERE `utenti`.`user` = \'FrancescaAdm\';\n\n# log 2019-09-15 10:18:02 root\nDELETE FROM `utenti` WHERE `utenti`.`id_utente` = 2;\n\n# log 2019-09-16 10:59:33 root\nDELETE FROM `utenti` WHERE `utenti`.`id_utente` = 3;\n\n# log 2019-11-06 15:45:20 root\nDELETE FROM `utenti` WHERE `utenti`.`id_utente` = 15;\n\n# log 2019-11-26 11:34:00 root\n--\n-- Dump dei dati per la tabella `utenti`\n--\n\nINSERT INTO `utenti` (`id_utente`, `username`, `email`, `password`) VALUES\n(7, \'bianca\', \'bianca@gmail.com\', \'$2y$10$6LNsHkJDDTP2Vz6Uyv5GluwdWbt5OIKr3Pza4T\'),\n(9, \'chiara98\', \'chiaragiusti98@alice.it\', \'$2y$10$.YCt0000v6EO7ofjqk/nge75ex2xjIFQapPS9T\'),\n(10, \'francesca\', \'francy@gmail.com\', \'$2y$10$eO9AdQi4x0d7XIywnqJmd.b0NzE8SHm5T4ZlKm\'),\n(11, \'giadina\', \'giadab@gmail.com\', \'$2y$10$NkD0G7aiLN48BLz8qN3xG.u6tBgTix14R1l8dk\'),\n(13, \'mario\', \'mariorossi@gmail.com\', \'$2y$10$zqljrrN0pyHaoQ0.sjO7jO2KCrho/dBhr5z03q\'),\n(21, \'SimoneFormicola\', \'simoneformicola@gmail.com\', \'$2y$10$5FrQtXEyorrkhoONXJfoUOvYKyRLcB8Yu2sKns\');\n\n# log 2020-01-04 16:09:27 root\nDELETE FROM `utenti` WHERE `utenti`.`id_utente` = 24;\n\n# log 2020-01-04 16:09:32 root\nDELETE FROM `utenti` WHERE `utenti`.`id_utente` = 23;\n\n# log 2020-01-04 16:09:35 root\nDELETE FROM `utenti` WHERE `utenti`.`id_utente` = 25;\n\n# log 2020-01-06 10:15:48 root\nDELETE FROM `utenti` WHERE `utenti`.`id_utente` = 26;\n\n# log 2020-01-06 10:16:05 root\nDELETE FROM `utenti` WHERE `utenti`.`id_utente` = 11;\n', 'UPDATE,INSERT,DELETE,TRUNCATE,CREATE TABLE,ALTER TABLE,RENAME TABLE,DROP TABLE,CREATE INDEX,DROP INDEX,CREATE VIEW,ALTER VIEW,DROP VIEW', 1);

--
-- Metadati per database rock_your_blog
--
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
