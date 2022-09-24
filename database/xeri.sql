-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Φιλοξενητής: 127.0.0.1
-- Χρόνος δημιουργίας: 15 Ιαν 2020 στις 20:10:12
-- Έκδοση διακομιστή: 10.4.10-MariaDB
-- Έκδοση PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `xeri`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `board`
--

CREATE TABLE `board` (
  `playerID` int(11) NOT NULL,
  `cardID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cards`
--

CREATE TABLE `cards` (
  `cardName` varchar(15) NOT NULL,
  `cardSymbol` varchar(15) NOT NULL,
  `cardColor` varchar(10) NOT NULL,
  `cardValue` int(11) DEFAULT NULL,
  `cardID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cards`
--

INSERT INTO `cards` (`cardName`, `cardSymbol`, `cardColor`, `cardValue`, `cardID`) VALUES
('Ace', 'hearts', 'red', 1, 1),
('Ace', 'spades', 'black', 1, 2),
('Ace', 'diamonds', 'red', 1, 3),
('Ace', 'clubs', 'black', 1, 4),
('Two', 'hearts', 'red', 2, 5),
('Two', 'spades', 'black', 2, 6),
('Two', 'diamonds', 'red', 2, 7),
('Two', 'clubs', 'black', 2, 8),
('Three', 'hearts', 'red', 3, 9),
('Three', 'spades', 'black', 3, 10),
('Three', 'diamonds', 'red', 3, 11),
('Three', 'clubs', 'black', 3, 12),
('Four', 'hearts', 'red', 4, 13),
('Four', 'spades', 'black', 4, 14),
('Four', 'diamonds', 'red', 4, 15),
('Four', 'clubs', 'black', 4, 16),
('Five', 'hearts', 'red', 5, 17),
('Five', 'spades', 'black', 5, 18),
('Five', 'diamonds', 'red', 5, 19),
('Five', 'clubs', 'black', 5, 20),
('Six', 'hearts', 'red', 6, 21),
('Six', 'spades', 'black', 6, 22),
('Six', 'diamonds', 'red', 6, 23),
('Six', 'clubs', 'black', 6, 24),
('Seven', 'hearts', 'red', 7, 25),
('Seven', 'spades', 'black', 7, 26),
('Seven', 'diamonds', 'red', 7, 27),
('Seven', 'clubs', 'black', 7, 28),
('Eight', 'hearts', 'red', 8, 29),
('Eight', 'spades', 'black', 8, 30),
('Eight', 'diamonds', 'red', 8, 31),
('Eight', 'clubs', 'black', 8, 32),
('Nine', 'hearts', 'red', 9, 33),
('Nine', 'spades', 'black', 9, 34),
('Nine', 'diamonds', 'red', 9, 35),
('Nine', 'clubs', 'black', 9, 36),
('Ten', 'hearts', 'red', 10, 37),
('Ten', 'spades', 'black', 10, 38),
('Ten', 'diamonds', 'red', 10, 39),
('Ten', 'clubs', 'black', 10, 40),
('Jack', 'hearts', 'red', 13, 41),
('Jack', 'spades', 'black', 13, 42),
('Jack', 'diamonds', 'red', 13, 43),
('Jack', 'clubs', 'black', 13, 44),
('Queen', 'hearts', 'red', 11, 45),
('Queen', 'spades', 'black', 11, 46),
('Queen', 'diamonds', 'red', 11, 47),
('Queen', 'clubs', 'black', 11, 48),
('King', 'hearts', 'red', 12, 49),
('King', 'spades', 'black', 12, 50),
('King', 'diamonds', 'red', 12, 51),
('King', 'clubs', 'black', 12, 52);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `game`
--

CREATE TABLE `game` (
  `playerID` int(11) NOT NULL,
  `playerName` varchar(255) DEFAULT NULL,
  `playerScore` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `players`
--

CREATE TABLE `players` (
  `playerName` varchar(255) NOT NULL,
  `totalScore` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `players`
--

INSERT INTO `players` (`playerName`, `totalScore`) VALUES
('testPlayer1', 0),
('testPlayer2', 0);

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `board`
--
ALTER TABLE `board`
  ADD PRIMARY KEY (`playerID`),
  ADD KEY `cardID` (`cardID`);

--
-- Ευρετήρια για πίνακα `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`cardID`);

--
-- Ευρετήρια για πίνακα `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`playerID`),
  ADD KEY `playerName` (`playerName`);

--
-- Ευρετήρια για πίνακα `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`playerName`);

--
-- Περιορισμοί για άχρηστους πίνακες
--

--
-- Περιορισμοί για πίνακα `board`
--
ALTER TABLE `board`
  ADD CONSTRAINT `board_ibfk_1` FOREIGN KEY (`cardID`) REFERENCES `cards` (`cardID`);

--
-- Περιορισμοί για πίνακα `game`
--
ALTER TABLE `game`
  ADD CONSTRAINT `game_ibfk_1` FOREIGN KEY (`playerName`) REFERENCES `players` (`playerName`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
