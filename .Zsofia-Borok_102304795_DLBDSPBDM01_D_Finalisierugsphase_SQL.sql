-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               11.3.2-MariaDB - mariadb.org binary distribution
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

-- Dumping structure for table communitylibrarydb.address
CREATE TABLE IF NOT EXISTS `address` (
  `addressID` int(11) NOT NULL AUTO_INCREMENT,
  `street` varchar(100) NOT NULL,
  `houseNumber` varchar(10) NOT NULL,
  `type` enum('Arbeit','zu Hause','sonstiges') NOT NULL,
  `postalCode` varchar(5) NOT NULL,
  PRIMARY KEY (`addressID`),
  KEY `postalCode` (`postalCode`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`postalCode`) REFERENCES `postal_code` (`postalCode`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table communitylibrarydb.address: ~39 rows (approximately)
INSERT INTO `address` (`addressID`, `street`, `houseNumber`, `type`, `postalCode`) VALUES
	(1, 'Hauptstr.', '12', 'zu Hause', '12347'),
	(2, 'Lindenweg', '34', 'zu Hause', '12347'),
	(3, 'Sonnenallee', '56', 'zu Hause', '12347'),
	(4, 'Gartenstr.', '78', 'Arbeit', '12347'),
	(5, 'Kirschweg', '90', 'Arbeit', '12347'),
	(6, 'Blumenstr.', '11', 'sonstiges', '12359'),
	(7, 'Kastanienallee', '23', 'zu Hause', '12359'),
	(8, 'Bahnhofstr.', '45', 'zu Hause', '12359'),
	(9, 'Schulweg', '67', 'zu Hause', '12359'),
	(10, 'Parkstr.', '89', 'Arbeit', '12359'),
	(11, 'Dorfstr.', '10', 'Arbeit', '12349'),
	(12, 'Heckenweg', '32', 'sonstiges', '12349'),
	(13, 'Am See', '54', 'zu Hause', '12349'),
	(14, 'Kastanienweg', '76', 'zu Hause', '12349'),
	(15, 'Rosenallee', '98', 'Arbeit', '12349'),
	(16, 'Franz-Körner-Str.', '12', 'sonstiges', '12351'),
	(17, 'Neuköller Str.', '34', 'zu Hause', '12351'),
	(18, 'Wutzkyallee', '56', 'zu Hause', '12351'),
	(19, 'Lipschitzallee', '78', 'zu Hause', '12353'),
	(20, 'Rudower Str.', '90', 'zu Hause', '12353'),
	(21, 'Fritz-Erler-Allee', '11', 'zu Hause', '12355'),
	(22, 'Johannisthaler Chaussee', '23', 'zu Hause', '12355'),
	(23, 'Britzer Damm', '45', 'Arbeit', '12355'),
	(24, 'Karl-Marx-Str', '12', 'sonstiges', '12043'),
	(25, 'Hermannstr.', '34', 'zu Hause', '12043'),
	(26, 'Sonnenallee', '56', 'zu Hause', '12045'),
	(27, 'Weichelstr.', '78', 'zu Hause', '12047'),
	(28, 'Richardplatz', '90', 'zu Hause', '12049'),
	(29, 'Karl-Marx-Platz', '11', 'zu Hause', '12051'),
	(30, 'Weserstr.', '23', 'zu Hause', '12053'),
	(31, 'Kottbusser Damm', '45', 'zu Hause', '12055'),
	(32, 'Wildenbruchstr.', '89', 'Arbeit', '12059'),
	(33, 'Gross-Ziethener Weg', '12', 'sonstiges', '12357'),
	(34, 'Alt-Rudow', '34', 'zu Hause', '12357'),
	(35, 'Neuköllner Str.', '56', 'zu Hause', '12357'),
	(36, 'Köpenicker Str.', '78', 'zu Hause', '12357'),
	(37, 'Stubenrauchstr.', '90', 'Arbeit', '12357'),
	(41, 'Hermannstr.', '44', 'zu Hause', '12051'),
	(42, 'Hermannstr.', '44', 'Arbeit', '12051');

-- Dumping structure for table communitylibrarydb.book
CREATE TABLE IF NOT EXISTS `book` (
  `bookID` int(11) NOT NULL AUTO_INCREMENT,
  `condition` enum('neu','wie neu','sehr gut','gut','akzeptabel','fehlerhaft') DEFAULT NULL CHECK (`condition` in ('neu','wie neu','sehr gut','gut','akzeptabel','fehlerhaft')),
  `availability` tinyint(1) DEFAULT NULL,
  `deliveryMethod` enum('Versand','Abholung','flexibel') DEFAULT NULL CHECK (`deliveryMethod` in ('Versand','Abholung','flexibel')),
  `userID` int(11) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  PRIMARY KEY (`bookID`),
  KEY `userID` (`userID`),
  KEY `ISBN` (`ISBN`),
  KEY `idx_book_condition` (`condition`),
  KEY `idx_book_availability` (`availability`),
  KEY `idx_book_deliveryMethod` (`deliveryMethod`),
  KEY `idx_book_condition_availability` (`condition`,`availability`),
  KEY `idx_book_condition_deliveryMethod` (`condition`,`deliveryMethod`),
  KEY `idx_book_availability_deliveryMethod` (`availability`,`deliveryMethod`),
  KEY `idx_book_condition_availability_deliveryMethod` (`condition`,`availability`,`deliveryMethod`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`),
  CONSTRAINT `book_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `book_details` (`ISBN`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table communitylibrarydb.book: ~29 rows (approximately)
INSERT INTO `book` (`bookID`, `condition`, `availability`, `deliveryMethod`, `userID`, `ISBN`) VALUES
	(1, 'akzeptabel', 1, 'Versand', 1, '978-0-7432-7356-6'),
	(2, 'akzeptabel', 1, 'Abholung', 1, '978-0-452-28423-5'),
	(3, 'neu', 1, 'Versand', 2, '978-3-518-38958-6'),
	(4, 'wie neu', 1, 'Versand', 3, '978-0-14-118776-1'),
	(5, 'sehr gut', 1, 'flexibel', 4, '978-84-204-8305-5'),
	(6, 'gut', 1, 'flexibel', 5, '978-3-499-23166-8'),
	(7, 'fehlerhaft', 1, 'Abholung', 6, '978-3-16-148410-0'),
	(8, 'fehlerhaft', 1, 'Versand', 8, '978-3-442-54501-6'),
	(9, 'gut', 1, 'Versand', 8, '978-3-423-13548-8'),
	(10, 'neu', 1, 'flexibel', 9, '978-3-423-13062-9'),
	(11, 'wie neu', 1, 'flexibel', 10, '978-3-423-12427-7'),
	(12, 'wie neu', 1, 'flexibel', 10, '978-3-492-26030-0'),
	(13, 'sehr gut', 1, 'Abholung', 11, '978-3-446-23267-4'),
	(14, 'gut', 1, 'Versand', 12, '978-3-518-45720-9'),
	(15, 'gut', 1, 'Versand', 12, '978-3-518-37901-3'),
	(16, 'akzeptabel', 1, 'Versand', 13, '978-3-423-14510-4'),
	(17, 'gut', 1, 'flexibel', 14, '978-3-257-23025-5'),
	(18, 'gut', 2, 'Abholung', 16, '978-0-7432-7356-7'),
	(19, 'akzeptabel', 2, 'Abholung', 17, '978-84-376-0494-8'),
	(20, 'neu', 2, 'flexibel', 18, '978-3-596-29423-7'),
	(21, 'wie neu', 1, 'flexibel', 19, '978-3-257-06558-1'),
	(22, 'wie neu', 1, 'Versand', 20, '978-3-446-26744-6'),
	(23, 'wie neu', 1, 'Versand', 20, '978-3-257-06515-4'),
	(24, 'wie neu', 1, 'Versand', 20, '978-87-638-1377-4'),
	(25, 'wie neu', 1, 'Versand', 20, '978-0-7432-7356-5'),
	(26, 'wie neu', 1, 'Versand', 20, '978-0-316-76995-9'),
	(27, 'wie neu', 1, 'Versand', 20, '978-3-492-26922-8'),
	(28, 'wie neu', 2, 'Versand', 20, '978-3-423-28007-5'),
	(29, 'wie neu', 2, 'Abholung', 8, '978-3-423-28007-5');

-- Dumping structure for table communitylibrarydb.book_details
CREATE TABLE IF NOT EXISTS `book_details` (
  `ISBN` varchar(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `author` varchar(200) NOT NULL,
  `publisher` varchar(100) DEFAULT NULL,
  `publicationYear` year(4) DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `pages` int(11) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ISBN`),
  KEY `idx_book_details_title` (`title`),
  KEY `idx_book_details_author` (`author`),
  KEY `idx_book_details_title_author` (`title`,`author`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table communitylibrarydb.book_details: ~28 rows (approximately)
INSERT INTO `book_details` (`ISBN`, `title`, `author`, `publisher`, `publicationYear`, `genre`, `pages`, `language`) VALUES
	('978-0-14-118776-1', 'Brave New World', 'Aldous Huxley', 'Harper Perennial', '1932', 'Dystopie', 288, 'English'),
	('978-0-316-76995-9', 'The Handmaid\'s Tale', 'Margaret Atwood', 'Houghton Mifflin Harcourt', '1985', 'Dystopie', 311, 'English'),
	('978-0-452-28423-5', 'Animal Farm', 'George Orwell', 'Signet Classics', '1945', 'Allegorie', 112, 'English'),
	('978-0-7432-7356-5', 'The Da Vinci Code', 'Dan Brown', 'Doubleday', '2003', 'Thriller', 454, 'Englisch'),
	('978-0-7432-7356-6', 'Angels & Demons', 'Dan Brown', 'Pocket Books', '2000', 'Thriller', 736, 'English'),
	('978-0-7432-7356-7', 'Inferno', 'Dan Brown', 'Doubleday', '2013', 'Thriller', 480, 'English'),
	('978-3-16-148410-0', 'Der Steppenwolf', 'Hermann Hesse', 'Suhrkamp', '1927', 'Roman', 237, 'Deutsch'),
	('978-3-257-06515-4', 'Siddhartha', 'Hermann Hesse', 'Suhrkamp', '1922', 'Roman', 152, 'Deutsch'),
	('978-3-257-06558-1', 'Narziß und Goldmund', 'Hermann Hesse', 'Suhrkamp', '1930', 'Roman', 320, 'Deutsch'),
	('978-3-257-23025-5', 'Homo Faber', 'Max Frisch', 'Suhrkamp', '1957', 'Roman', 192, 'Deutsch'),
	('978-3-423-12427-7', 'Die Physiker', 'Friedrich Dürenmatt', 'Diogenes Verlag', '1962', 'tragikomödie', 208, 'Deutsch'),
	('978-3-423-13062-9', 'Die Blechtrommel', 'Günter Grass', 'DTV', '1959', 'Roman', 780, 'Deutsch'),
	('978-3-423-13548-8', 'Der Zauberberg', 'Thomas Mann', 'DTV', '1924', 'Roman', 720, 'Deutsch'),
	('978-3-423-14510-4', 'Die Wand', 'Marlen Haushofer', 'DTV', '1963', 'Roman', 288, 'Deutsch'),
	('978-3-423-28007-5', 'Tyll', 'Daniel Kehlmann', 'Rowohlt', '2017', 'Historischer Roman', 480, 'Deutsch'),
	('978-3-442-54501-6', 'Der Vorleser', 'Bernhard Schlink', 'Goldmann Verlag', '1995', 'Roman', 224, 'Deutsch'),
	('978-3-446-23267-4', 'Die Vermessung der Welt', 'Daniel Kehlmann', 'Hanser', '2005', 'Historischer Roman', 304, 'Deutsch'),
	('978-3-446-26744-6', 'Schachnovelle', 'Stefan Zweig', 'Fischer Verlag', '1942', 'Roman', 96, 'Deutsch'),
	('978-3-492-26030-0', 'Die unendliche Geschichte', 'Michael Ende', 'Thienemann', '1979', 'Fantasy', 448, 'Deutsch'),
	('978-3-492-26922-8', 'Tintenherz', 'Cornelia Funke', 'Dressler Verlag', '2003', 'Fantasy', 576, 'Deutsch'),
	('978-3-499-23166-8', 'Das Parfüm', 'Patrick Süsskind', 'Rohwohlt Verlag', '1985', 'Historischer Roman', 320, 'Deutsch'),
	('978-3-518-37901-3', 'Die Verwandlung', 'Franz Kafka', 'Fischer Verlag', '1915', 'Roman', 102, 'Deutsch'),
	('978-3-518-38958-6', 'Ansichten eines Clowns', 'Heinrich Böll', 'Fischer Verlag', '1963', 'expressionistische Literatur', 248, 'Deutsch'),
	('978-3-518-45720-9', 'Die Vermessung der Welt', 'Daniel Kehlmann', 'Rowohlt', '2005', 'Historischer Roman', 304, 'Deutsch'),
	('978-3-596-29423-7', 'Momo', 'Michael Ende', 'Fischer Verlag', '1973', 'Fantasy', 304, 'Deutsch'),
	('978-84-204-8305-5', 'Cien años de soledad', 'Gabriel García Márquez', 'Alfaguara', '1967', 'Roman', 471, 'Spanisch'),
	('978-84-376-0494-8', 'La sombra del viento', 'Carlos Ruiz Zafón', 'Planeta', '2001', 'Krimi', 576, 'Spanish'),
	('978-87-638-1377-4', 'Smilla\'s Sense of Snow', 'Peter Høeg', 'Rosinante', '1992', 'Krimi', 480, 'Danish');

-- Dumping structure for table communitylibrarydb.book_map
CREATE TABLE IF NOT EXISTS `book_map` (
  `mapID` int(11) NOT NULL,
  `bookID` int(11) NOT NULL,
  PRIMARY KEY (`mapID`,`bookID`),
  KEY `bookID` (`bookID`),
  CONSTRAINT `book_map_ibfk_1` FOREIGN KEY (`mapID`) REFERENCES `map` (`mapID`),
  CONSTRAINT `book_map_ibfk_2` FOREIGN KEY (`bookID`) REFERENCES `book` (`bookID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table communitylibrarydb.book_map: ~26 rows (approximately)
INSERT INTO `book_map` (`mapID`, `bookID`) VALUES
	(1, 2),
	(11, 5),
	(12, 5),
	(13, 6),
	(14, 6),
	(2, 7),
	(3, 7),
	(4, 7),
	(15, 10),
	(16, 10),
	(17, 10),
	(25, 11),
	(26, 11),
	(18, 12),
	(19, 12),
	(5, 13),
	(6, 13),
	(20, 17),
	(7, 18),
	(8, 19),
	(21, 20),
	(22, 20),
	(23, 21),
	(24, 21),
	(9, 29),
	(10, 29);

-- Dumping structure for table communitylibrarydb.book_rating
CREATE TABLE IF NOT EXISTS `book_rating` (
  `ratingID` int(11) NOT NULL,
  `loanID` int(11) NOT NULL,
  PRIMARY KEY (`ratingID`),
  UNIQUE KEY `loanID` (`loanID`),
  CONSTRAINT `book_rating_ibfk_1` FOREIGN KEY (`ratingID`) REFERENCES `rating` (`ratingID`),
  CONSTRAINT `book_rating_ibfk_2` FOREIGN KEY (`loanID`) REFERENCES `loan` (`loanID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table communitylibrarydb.book_rating: ~10 rows (approximately)
INSERT INTO `book_rating` (`ratingID`, `loanID`) VALUES
	(1, 2),
	(2, 3),
	(3, 5),
	(4, 6),
	(5, 7),
	(6, 8),
	(7, 9),
	(8, 13),
	(9, 16),
	(10, 17);

-- Dumping structure for table communitylibrarydb.loan
CREATE TABLE IF NOT EXISTS `loan` (
  `loanID` int(11) NOT NULL AUTO_INCREMENT,
  `startDate` date NOT NULL,
  `endDate` date DEFAULT NULL,
  `status` enum('offen','zurueckgegeben','abgebrochen') NOT NULL,
  `type` enum('Abholung','Versand') NOT NULL,
  `requestingUserID` int(11) NOT NULL,
  `bookID` int(11) NOT NULL,
  PRIMARY KEY (`loanID`),
  KEY `idx_loan_status` (`status`),
  KEY `idx_loan_requestingUserID` (`requestingUserID`),
  KEY `idx_loan_bookID` (`bookID`),
  KEY `idx_loan_date_range` (`startDate`,`endDate`),
  KEY `idx_loan_requestingUserID_status` (`requestingUserID`,`status`),
  CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`requestingUserID`) REFERENCES `user` (`userID`),
  CONSTRAINT `loan_ibfk_2` FOREIGN KEY (`bookID`) REFERENCES `book` (`bookID`),
  CONSTRAINT `CONSTRAINT_1` CHECK (to_days(`endDate`) - to_days(`startDate`) <= 60)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table communitylibrarydb.loan: ~20 rows (approximately)
INSERT INTO `loan` (`loanID`, `startDate`, `endDate`, `status`, `type`, `requestingUserID`, `bookID`) VALUES
	(1, '2024-01-02', '2024-02-15', 'abgebrochen', 'Abholung', 1, 19),
	(2, '2024-01-10', '2024-01-22', 'zurueckgegeben', 'Abholung', 15, 7),
	(3, '2024-01-18', '2024-02-05', 'zurueckgegeben', 'Versand', 18, 22),
	(4, '2024-05-04', NULL, 'offen', 'Versand', 18, 21),
	(5, '2024-02-16', '2024-04-16', 'zurueckgegeben', 'Versand', 13, 4),
	(6, '2024-02-18', '2024-02-28', 'zurueckgegeben', 'Versand', 1, 17),
	(7, '2024-05-12', '2024-05-23', 'zurueckgegeben', 'Abholung', 3, 19),
	(8, '2024-06-01', '2024-06-28', 'zurueckgegeben', 'Abholung', 9, 29),
	(9, '2024-06-01', '2024-06-02', 'zurueckgegeben', 'Abholung', 20, 10),
	(10, '2024-05-03', NULL, 'offen', 'Abholung', 11, 21),
	(11, '2024-06-03', NULL, 'offen', 'Abholung', 7, 10),
	(12, '2024-05-30', NULL, 'offen', 'Abholung', 6, 2),
	(13, '2024-04-02', '2024-04-06', 'zurueckgegeben', 'Abholung', 5, 18),
	(16, '2024-03-03', '2024-05-02', 'zurueckgegeben', 'Abholung', 21, 19),
	(17, '2024-04-02', '2024-04-06', 'zurueckgegeben', 'Versand', 8, 1),
	(18, '2024-04-17', '2024-06-01', 'zurueckgegeben', 'Versand', 13, 3),
	(19, '2024-04-17', '2024-05-01', 'zurueckgegeben', 'Versand', 12, 6),
	(20, '2024-05-17', '2024-05-21', 'zurueckgegeben', 'Versand', 13, 12),
	(21, '2024-05-18', '2024-06-01', 'zurueckgegeben', 'Versand', 8, 20),
	(22, '2024-06-05', NULL, 'offen', 'Versand', 12, 25);

-- Dumping structure for table communitylibrarydb.map
CREATE TABLE IF NOT EXISTS `map` (
  `mapID` int(11) NOT NULL AUTO_INCREMENT,
  `addressID` int(11) NOT NULL,
  PRIMARY KEY (`mapID`),
  KEY `idx_map_addressID` (`addressID`),
  CONSTRAINT `map_ibfk_1` FOREIGN KEY (`addressID`) REFERENCES `address` (`addressID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table communitylibrarydb.map: ~26 rows (approximately)
INSERT INTO `map` (`mapID`, `addressID`) VALUES
	(1, 2),
	(20, 5),
	(23, 6),
	(11, 8),
	(21, 9),
	(22, 10),
	(24, 11),
	(13, 13),
	(2, 14),
	(3, 15),
	(9, 16),
	(8, 17),
	(5, 20),
	(18, 22),
	(25, 22),
	(15, 23),
	(16, 24),
	(7, 25),
	(12, 29),
	(14, 30),
	(4, 31),
	(10, 33),
	(17, 34),
	(19, 35),
	(26, 35),
	(6, 36);

-- Dumping structure for table communitylibrarydb.pickup_transaction
CREATE TABLE IF NOT EXISTS `pickup_transaction` (
  `pickupID` int(11) NOT NULL AUTO_INCREMENT,
  `addressID` int(11) NOT NULL,
  `loanID` int(11) NOT NULL,
  PRIMARY KEY (`pickupID`),
  KEY `addressID` (`addressID`),
  KEY `loanID` (`loanID`),
  CONSTRAINT `pickup_transaction_ibfk_1` FOREIGN KEY (`addressID`) REFERENCES `address` (`addressID`),
  CONSTRAINT `pickup_transaction_ibfk_2` FOREIGN KEY (`loanID`) REFERENCES `loan` (`loanID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table communitylibrarydb.pickup_transaction: ~11 rows (approximately)
INSERT INTO `pickup_transaction` (`pickupID`, `addressID`, `loanID`) VALUES
	(1, 2, 12),
	(2, 14, 2),
	(3, 23, 11),
	(4, 23, 9),
	(5, 25, 13),
	(6, 17, 1),
	(7, 17, 7),
	(8, 17, 16),
	(9, 11, 10),
	(10, 16, 8),
	(11, 16, 8);

-- Dumping structure for table communitylibrarydb.postal_address
CREATE TABLE IF NOT EXISTS `postal_address` (
  `postalID` int(11) NOT NULL AUTO_INCREMENT,
  `street` varchar(100) NOT NULL,
  `houseNumber` varchar(10) NOT NULL,
  `postalcode` varchar(10) NOT NULL,
  PRIMARY KEY (`postalID`),
  KEY `postalcode` (`postalcode`),
  CONSTRAINT `postal_address_ibfk_1` FOREIGN KEY (`postalcode`) REFERENCES `postal_code_postal_address` (`postalcode`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table communitylibrarydb.postal_address: ~22 rows (approximately)
INSERT INTO `postal_address` (`postalID`, `street`, `houseNumber`, `postalcode`) VALUES
	(1, 'Hauptstr.', '45', '20095'),
	(3, 'Gartenweg', '12', '80331'),
	(4, 'Schulstraße', '78', '50667'),
	(5, 'Bahnhofstraße', '5', '70173'),
	(6, 'Parkallee', '6', '60311'),
	(7, 'Lindenstraße', '23', '01067'),
	(8, 'Rosenweg', '9', '04109'),
	(9, 'Feldstraße', '11', '30159'),
	(10, 'Sonnenweg', '4', '90402'),
	(11, 'Bergstraße', '19', '28195'),
	(12, 'Kirchweg', '13', '04109'),
	(13, 'Tannenweg', '2', '18055'),
	(14, 'Wiesenstraße', '17', '68159'),
	(15, 'Seeweg', '22', '65183'),
	(16, 'Waldstraße', '8', '34117'),
	(17, 'Hügelweg', '20', '39104'),
	(18, 'Kastanienweg', '14', '99084'),
	(19, 'Blumenstraße', '3', '19053'),
	(20, 'Wasserstraße', '27', '38100'),
	(21, 'Fichtenweg', '15', '24103'),
	(22, 'Amselweg', '18', '93047'),
	(23, 'Birkenweg', '10', '66111');

-- Dumping structure for table communitylibrarydb.postal_code
CREATE TABLE IF NOT EXISTS `postal_code` (
  `postalCode` varchar(5) NOT NULL CHECK (`postalCode` in ('12043','12045','12047','12049','12051','12053','12055','12057','12059','12347','12349','12351','12353','12355','12357','12359')),
  `neighborhood` varchar(50) NOT NULL CHECK (`neighborhood` in ('Neukoelln','Britz','Rudow','Buckow','Gropiusstadt')),
  PRIMARY KEY (`postalCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table communitylibrarydb.postal_code: ~16 rows (approximately)
INSERT INTO `postal_code` (`postalCode`, `neighborhood`) VALUES
	('12043', 'Neukoelln'),
	('12045', 'Neukoelln'),
	('12047', 'Neukoelln'),
	('12049', 'Neukoelln'),
	('12051', 'Neukoelln'),
	('12053', 'Neukoelln'),
	('12055', 'Neukoelln'),
	('12057', 'Neukoelln'),
	('12059', 'Neukoelln'),
	('12347', 'Britz'),
	('12349', 'Buckow'),
	('12351', 'Gropiusstadt'),
	('12353', 'Gropiusstadt'),
	('12355', 'Gropiusstadt'),
	('12357', 'Rudow'),
	('12359', 'Britz');

-- Dumping structure for table communitylibrarydb.postal_code_postal_address
CREATE TABLE IF NOT EXISTS `postal_code_postal_address` (
  `postalcode` varchar(10) NOT NULL,
  `city` varchar(100) NOT NULL,
  PRIMARY KEY (`postalcode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table communitylibrarydb.postal_code_postal_address: ~21 rows (approximately)
INSERT INTO `postal_code_postal_address` (`postalcode`, `city`) VALUES
	('01067', 'Dresden'),
	('04109', 'Leipzig'),
	('18055', 'Rostock'),
	('19053', 'Schwerin'),
	('20095', 'Hamburg'),
	('24103', 'Kiel'),
	('28195', 'Bremen'),
	('30159', 'Hannover'),
	('34117', 'Kassel'),
	('38100', 'Braunschweig'),
	('39104', 'Magdeburg'),
	('50667', 'Köln'),
	('60311', 'Frankfurt am Main'),
	('65183', 'Wiesbaden'),
	('66111', 'Saarbrücken'),
	('68159', 'Mannheim'),
	('70173', 'Stuttgart'),
	('80331', 'München'),
	('90402', 'Nürnberg'),
	('93047', 'Regensburg'),
	('99084', 'Erfurt');

-- Dumping structure for table communitylibrarydb.rating
CREATE TABLE IF NOT EXISTS `rating` (
  `ratingID` int(11) NOT NULL AUTO_INCREMENT,
  `rating` int(11) NOT NULL CHECK (`rating` between 1 and 5),
  `comment` text DEFAULT NULL,
  `date` date DEFAULT NULL,
  `type` enum('Buch','Benutzer') NOT NULL CHECK (`type` in ('Buch','Benutzer')),
  PRIMARY KEY (`ratingID`),
  KEY `idx_rating_rating` (`rating`),
  KEY `idx_rating_comment` (`comment`(3072)),
  KEY `idx_rating_type` (`type`),
  KEY `idx_rating_rating_comment_type` (`rating`,`comment`(100),`type`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table communitylibrarydb.rating: ~20 rows (approximately)
INSERT INTO `rating` (`ratingID`, `rating`, `comment`, `date`, `type`) VALUES
	(1, 5, 'Sehr gutes Buch, nur zu empfehlen', '2024-02-02', 'Buch'),
	(2, 4, 'Interessantes Buch, lesenswert', '2024-01-15', 'Buch'),
	(3, 3, 'Gut, aber etwas langatmig', '2024-03-10', 'Buch'),
	(4, 5, 'Fantastisch, sehr spannend', '2024-04-22', 'Buch'),
	(5, 2, 'Nicht mein Geschmack, enttäuschend', '2024-05-11', 'Buch'),
	(6, 1, 'Schlecht geschrieben, nicht zu empfehlen', '2024-06-01', 'Buch'),
	(7, 4, 'Gut, aber mit einigen Schwächen', '2024-07-17', 'Buch'),
	(8, 5, 'Ein Meisterwerk, absolut genial', '2024-08-25', 'Buch'),
	(9, 3, 'Durchschnittlich, nichts Besonderes', '2024-09-05', 'Buch'),
	(10, 4, 'Sehr unterhaltsam, gut geschrieben', '2024-10-14', 'Buch'),
	(11, 5, 'Sehr zuverlässig und freundlich', '2024-01-20', 'Benutzer'),
	(12, 4, 'Gute Kommunikation, alles bestens', '2024-02-25', 'Benutzer'),
	(13, 3, 'In Ordnung, aber etwas unpünktlich', '2024-03-30', 'Benutzer'),
	(14, 5, 'Perfekt, sehr zu empfehlen', '2024-04-15', 'Benutzer'),
	(15, 2, 'Nicht sehr freundlich, könnte besser sein', '2024-05-20', 'Benutzer'),
	(16, 1, 'Schlechte Erfahrung, nicht zu empfehlen', '2024-06-25', 'Benutzer'),
	(17, 4, 'Alles gut, gerne wieder', '2024-07-30', 'Benutzer'),
	(18, 3, 'Durchschnittlich, nichts Besonderes', '2024-08-10', 'Benutzer'),
	(19, 5, 'Sehr hilfsbereit und zuverlässig', '2024-09-15', 'Benutzer'),
	(20, 4, 'Guter Kontakt, alles in Ordnung', '2024-10-20', 'Benutzer');

-- Dumping structure for table communitylibrarydb.shipping_transaction
CREATE TABLE IF NOT EXISTS `shipping_transaction` (
  `shippingID` int(11) NOT NULL AUTO_INCREMENT,
  `postalID` int(11) NOT NULL,
  `loanID` int(11) NOT NULL,
  PRIMARY KEY (`shippingID`),
  KEY `postalID` (`postalID`),
  KEY `loanID` (`loanID`),
  CONSTRAINT `shipping_transaction_ibfk_1` FOREIGN KEY (`postalID`) REFERENCES `postal_address` (`postalID`),
  CONSTRAINT `shipping_transaction_ibfk_2` FOREIGN KEY (`loanID`) REFERENCES `loan` (`loanID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table communitylibrarydb.shipping_transaction: ~11 rows (approximately)
INSERT INTO `shipping_transaction` (`shippingID`, `postalID`, `loanID`) VALUES
	(1, 13, 3),
	(2, 13, 4),
	(3, 4, 5),
	(4, 23, 6),
	(5, 17, 17),
	(6, 4, 18),
	(7, 3, 19),
	(8, 4, 20),
	(9, 17, 21),
	(10, 3, 22),
	(11, 3, 22);

-- Dumping structure for table communitylibrarydb.user
CREATE TABLE IF NOT EXISTS `user` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `email` (`email`),
  KEY `idx_user_lastName` (`lastName`),
  KEY `idx_user_firstName_lastName` (`firstName`,`lastName`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table communitylibrarydb.user: ~21 rows (approximately)
INSERT INTO `user` (`userID`, `firstName`, `lastName`, `email`, `phone`) VALUES
	(1, 'Liam', 'Müller', 'liam.mueller@communitylibrary.com', '+49 151 23456789'),
	(2, 'Leila', 'Johnson', 'leila.johnson@communitylibrary.com', '+49 160 98765432'),
	(3, 'Emma', 'Schneider', 'emma.scheider@communitylibrary.com', '+49 171 12345678'),
	(4, 'Alejandro', 'Garcia', 'alejandro.garcia@communitylibrary.com', '+49 152 87654321'),
	(5, 'Hiroshi', 'Tanaka', 'hiroshi.tanaka@communitylibrary.com', '+49 162 12349745'),
	(6, 'Noah', 'Schmidt', 'noah.schmidt@communitylibrary.com', '+49 163 45678901'),
	(7, 'Aisha', 'Khan', 'aisha.khan@communitylibrary.com', '+49 172 65432198'),
	(8, 'Olivia', 'Wagner', 'olivia.wagner@communitylibrary.com', '+49 173 78945612'),
	(9, 'James', 'Fischer', 'james.fischer@communitylibrary.com', '+49 175 96325874'),
	(10, 'Carlos', 'Rossi', 'carlos.rossi@communitylibrary.com', '+49 174 32165487'),
	(11, 'Maria', 'Fernandes', 'maria.fernandes@communitylibrary.com', '+49 176 14785236'),
	(12, 'Luca', 'Becker', 'luca.becker@communitylibrary.com', '+49 177 85296341'),
	(13, 'Mia', 'Hoffmann', 'mia.hoffmann@communitylibrary.com', '+49 178 36987412'),
	(14, 'Yasmin', 'Al-Farsi', 'jasmin.al-farsi@communitylibrary.com', '+49 187 32147896'),
	(15, 'Ingrid', 'Larsen', 'ingrid.larsen@communitylibrary.com', '+49 162 78912365'),
	(16, 'Emily', 'Lehmann', 'emily.lehman@communitylibrary.com', '+49 152 14796328'),
	(17, 'Matteo', 'Meyer', 'matteo.meyer@communitylibrary.com', '+49 171 96321458'),
	(18, 'Benjamin', 'Lang', 'bejamin.lang@communitylibrary.com', '+49 160 74185296'),
	(19, 'Samuel', 'Wolf', 'samuel.wolf@communitylibrary.com', '+49 151 65478932'),
	(20, 'Sofia', 'Petrova', 'sofia.petrova@communitylibrary.com', '+49 179 25874136'),
	(21, 'Fernando', 'Lopez', 'fernando.lopez@communitylibrary.com', '+49 178 36987412');

-- Dumping structure for table communitylibrarydb.user_address
CREATE TABLE IF NOT EXISTS `user_address` (
  `userID` int(11) NOT NULL,
  `addressID` int(11) NOT NULL,
  PRIMARY KEY (`userID`,`addressID`),
  KEY `addressID` (`addressID`),
  CONSTRAINT `user_address_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`),
  CONSTRAINT `user_address_ibfk_2` FOREIGN KEY (`addressID`) REFERENCES `address` (`addressID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table communitylibrarydb.user_address: ~37 rows (approximately)
INSERT INTO `user_address` (`userID`, `addressID`) VALUES
	(2, 1),
	(1, 2),
	(21, 3),
	(7, 4),
	(14, 5),
	(19, 6),
	(3, 7),
	(4, 8),
	(18, 9),
	(18, 10),
	(19, 11),
	(20, 12),
	(5, 13),
	(6, 14),
	(6, 15),
	(8, 16),
	(17, 17),
	(15, 18),
	(15, 19),
	(11, 20),
	(12, 21),
	(10, 22),
	(9, 23),
	(9, 24),
	(16, 25),
	(13, 26),
	(2, 27),
	(3, 28),
	(4, 29),
	(5, 30),
	(6, 31),
	(7, 32),
	(8, 33),
	(9, 34),
	(10, 35),
	(11, 36),
	(12, 37);

-- Dumping structure for table communitylibrarydb.user_postal_address
CREATE TABLE IF NOT EXISTS `user_postal_address` (
  `userID` int(11) NOT NULL,
  `postalID` int(11) NOT NULL,
  PRIMARY KEY (`userID`,`postalID`),
  KEY `postalID` (`postalID`),
  CONSTRAINT `user_postal_address_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`),
  CONSTRAINT `user_postal_address_ibfk_2` FOREIGN KEY (`postalID`) REFERENCES `postal_address` (`postalID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table communitylibrarydb.user_postal_address: ~22 rows (approximately)
INSERT INTO `user_postal_address` (`userID`, `postalID`) VALUES
	(12, 1),
	(12, 3),
	(13, 4),
	(19, 5),
	(2, 6),
	(2, 7),
	(19, 8),
	(14, 9),
	(10, 10),
	(10, 11),
	(9, 12),
	(18, 13),
	(19, 14),
	(3, 15),
	(20, 16),
	(8, 17),
	(4, 18),
	(4, 19),
	(18, 20),
	(20, 21),
	(5, 22),
	(1, 23);

-- Dumping structure for table communitylibrarydb.user_rating
CREATE TABLE IF NOT EXISTS `user_rating` (
  `ratingID` int(11) NOT NULL,
  `reviewerUserID` int(11) NOT NULL,
  `reviewedUserID` int(11) NOT NULL,
  `loanID` int(11) NOT NULL,
  PRIMARY KEY (`ratingID`),
  KEY `reviewerUserID` (`reviewerUserID`),
  KEY `reviewedUserID` (`reviewedUserID`),
  KEY `loanID` (`loanID`),
  CONSTRAINT `user_rating_ibfk_1` FOREIGN KEY (`ratingID`) REFERENCES `rating` (`ratingID`),
  CONSTRAINT `user_rating_ibfk_2` FOREIGN KEY (`reviewerUserID`) REFERENCES `user` (`userID`),
  CONSTRAINT `user_rating_ibfk_3` FOREIGN KEY (`reviewedUserID`) REFERENCES `user` (`userID`),
  CONSTRAINT `user_rating_ibfk_4` FOREIGN KEY (`loanID`) REFERENCES `loan` (`loanID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table communitylibrarydb.user_rating: ~10 rows (approximately)
INSERT INTO `user_rating` (`ratingID`, `reviewerUserID`, `reviewedUserID`, `loanID`) VALUES
	(11, 6, 15, 2),
	(12, 18, 20, 3),
	(13, 3, 13, 5),
	(14, 1, 14, 6),
	(15, 17, 3, 7),
	(16, 9, 8, 8),
	(17, 9, 20, 9),
	(18, 5, 16, 13),
	(19, 17, 21, 16),
	(20, 1, 8, 17);

-- Dumping structure for table communitylibrarydb.waitlist
CREATE TABLE IF NOT EXISTS `waitlist` (
  `waitlistID` int(11) NOT NULL AUTO_INCREMENT,
  `requestDate` date NOT NULL,
  `endDate` date DEFAULT NULL,
  `status` enum('offen','erfuellt','abgebrochen') DEFAULT NULL CHECK (`status` in ('offen','erfuellt','abgebrochen')),
  `userID` int(11) NOT NULL,
  `bookID` int(11) NOT NULL,
  PRIMARY KEY (`waitlistID`),
  KEY `idx_waitlist_status` (`status`),
  KEY `idx_waitlist_bookID` (`bookID`),
  KEY `idx_waitlist_userID_bookID` (`userID`,`bookID`),
  CONSTRAINT `waitlist_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`),
  CONSTRAINT `waitlist_ibfk_2` FOREIGN KEY (`bookID`) REFERENCES `book` (`bookID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table communitylibrarydb.waitlist: ~21 rows (approximately)
INSERT INTO `waitlist` (`waitlistID`, `requestDate`, `endDate`, `status`, `userID`, `bookID`) VALUES
	(6, '2024-01-01', NULL, 'offen', 1, 18),
	(7, '2024-01-02', '2024-01-10', 'erfuellt', 1, 19),
	(8, '2024-01-03', NULL, 'offen', 3, 20),
	(9, '2024-01-04', '2024-01-12', 'abgebrochen', 4, 28),
	(10, '2024-01-05', NULL, 'offen', 5, 29),
	(11, '2024-01-06', NULL, 'offen', 8, 2),
	(12, '2024-01-07', NULL, 'offen', 9, 11),
	(13, '2024-01-08', '2024-01-20', 'abgebrochen', 11, 11),
	(14, '2024-01-09', NULL, 'offen', 13, 1),
	(15, '2024-01-10', '2024-01-22', 'erfuellt', 15, 7),
	(16, '2024-01-11', NULL, 'offen', 16, 7),
	(17, '2024-01-12', '2024-01-25', 'abgebrochen', 20, 11),
	(18, '2024-01-13', NULL, 'offen', 13, 13),
	(19, '2024-01-14', NULL, 'offen', 14, 15),
	(20, '2024-01-15', NULL, 'offen', 15, 28),
	(21, '2024-01-16', '2024-02-01', 'abgebrochen', 16, 22),
	(22, '2024-01-17', NULL, 'offen', 17, 22),
	(23, '2024-01-18', '2024-02-05', 'erfuellt', 18, 22),
	(24, '2024-01-19', NULL, 'offen', 19, 27),
	(25, '2024-01-20', '2024-02-10', 'abgebrochen', 19, 27),
	(26, '2024-01-21', NULL, 'offen', 21, 18);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
