-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 05 Sty 2021, 15:51
-- Wersja serwera: 10.4.6-MariaDB
-- Wersja PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `kghm`
--

DELIMITER $$
--
-- Procedury
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `premia` (IN `id` INT)  BEGIN
Update premia SET Dodatek = 0.5 * Dodatek where ID_prem = ID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `wycena_rud` (IN `id` INT)  BEGIN
Update wycena_rud SET Cena_rudy = 0.5 * Cena_rudy where ID_wr = ID;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `gmina`
--

CREATE TABLE `gmina` (
  `ID_gmi` int(4) NOT NULL,
  `Nazwa` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `ID_pow` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `gmina`
--

INSERT INTO `gmina` (`ID_gmi`, `Nazwa`, `ID_pow`) VALUES
(1, 'Cedynia', 5),
(2, 'Polkowice', 3),
(3, 'Rudna', 4),
(4, 'Glogowska', 2),
(5, 'Lubinska', 4),
(6, 'Legnicka', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `godziny_pracy`
--

CREATE TABLE `godziny_pracy` (
  `ID_GP` int(4) NOT NULL,
  `Przedzial_godzinowy` varchar(30) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `godziny_pracy`
--

INSERT INTO `godziny_pracy` (`ID_GP`, `Przedzial_godzinowy`) VALUES
(1, '6.00–14.00'),
(2, '14.00–22.00'),
(3, '22.00–6.00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kraje_oddzialy_kghm`
--

CREATE TABLE `kraje_oddzialy_kghm` (
  `ID_krodd` int(4) NOT NULL,
  `Nazwa_kraju` varchar(30) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `kraje_oddzialy_kghm`
--

INSERT INTO `kraje_oddzialy_kghm` (`ID_krodd`, `Nazwa_kraju`) VALUES
(1, 'Polska');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kurs`
--

CREATE TABLE `kurs` (
  `ID_kurs` int(4) NOT NULL,
  `Nazwa` varchar(30) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `kurs`
--

INSERT INTO `kurs` (`ID_kurs`, `Nazwa`) VALUES
(1, 'Slusarz'),
(2, 'Spawacz'),
(3, 'Operator Obrabiarki'),
(4, 'Elektromonter'),
(5, 'Mechanik'),
(6, 'Maszynista'),
(7, 'Oczyszczacz'),
(8, 'Geodeta'),
(9, 'Magazynier');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `miasto`
--

CREATE TABLE `miasto` (
  `ID_mias` int(4) NOT NULL,
  `Nazwa` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `ID_gmi` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `miasto`
--

INSERT INTO `miasto` (`ID_mias`, `Nazwa`, `ID_gmi`) VALUES
(1, 'Cedynia', 1),
(2, 'Lubin', 5),
(3, 'Glogow', 4),
(4, 'Legnica', 6),
(5, 'Polkowice', 2),
(6, 'Rudna', 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `numer_jednostki`
--

CREATE TABLE `numer_jednostki` (
  `ID_nje` int(4) NOT NULL,
  `Numer` int(4) NOT NULL,
  `ID_ZG` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `numer_jednostki`
--

INSERT INTO `numer_jednostki` (`ID_nje`, `Numer`, `ID_ZG`) VALUES
(1, 124, 2),
(2, 678, 3),
(3, 234, 1),
(4, 65, 2),
(5, 456, 3),
(6, 698, 1),
(7, 23, 2),
(8, 523, 3),
(9, 86, 1),
(10, 111, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pensja`
--

CREATE TABLE `pensja` (
  `ID_pen` int(4) NOT NULL,
  `Kwota` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `pensja`
--

INSERT INTO `pensja` (`ID_pen`, `Kwota`) VALUES
(1, 9019),
(2, 7158),
(3, 8490),
(4, 9909),
(5, 11859),
(6, 10745),
(7, 14697),
(8, 19264),
(9, 13208),
(10, 17005);

--
-- Wyzwalacze `pensja`
--
DELIMITER $$
CREATE TRIGGER `pensja_before` BEFORE INSERT ON `pensja` FOR EACH ROW BEGIN
  IF NEW.ID_pen < 3
  THEN
    SET NEW.Kwota = 7890;
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `plec`
--

CREATE TABLE `plec` (
  `ID_plec` int(4) NOT NULL,
  `Nazwa` varchar(9) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `plec`
--

INSERT INTO `plec` (`ID_plec`, `Nazwa`) VALUES
(1, 'Mezczyzna'),
(2, 'Kobieta');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `powiat`
--

CREATE TABLE `powiat` (
  `ID_pow` int(4) NOT NULL,
  `Nazwa` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `ID_woj` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `powiat`
--

INSERT INTO `powiat` (`ID_pow`, `Nazwa`, `ID_woj`) VALUES
(1, 'Legnicki', 1),
(2, 'Glogowski', 1),
(3, 'Polkowicki', 1),
(4, 'Lubinski', 1),
(5, 'Gryfinski', 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownik`
--

CREATE TABLE `pracownik` (
  `ID_prac` int(4) NOT NULL,
  `Imie` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `Nazwisko` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `Ulica` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `Nr_tel` char(9) COLLATE utf8_polish_ci NOT NULL,
  `ID_wyk` int(4) DEFAULT NULL,
  `ID_SP` int(4) DEFAULT NULL,
  `ID_GP` int(4) DEFAULT NULL,
  `ID_NJE` int(4) DEFAULT NULL,
  `ID_plec` int(4) NOT NULL,
  `ID_stan` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `pracownik`
--

INSERT INTO `pracownik` (`ID_prac`, `Imie`, `Nazwisko`, `Ulica`, `Nr_tel`, `ID_wyk`, `ID_SP`, `ID_GP`, `ID_NJE`, `ID_plec`, `ID_stan`) VALUES
(1, 'Nela', 'Witkowska', '16-189', '138746789', 1, 12, 1, 10, 2, 1),
(2, 'Filip', 'Ziolkowski', '20-312', '39934089', 2, 17, 2, 9, 1, 2),
(3, 'Angelika', 'Jakubowska', '30-450', '572593857', 3, 25, 3, 8, 2, 3),
(4, 'Aleksandra', 'Zalewska', '51-484', '322714123', 4, 22, 1, 7, 2, 4),
(5, 'Tomasz', 'Nowacki', '41-513', '549996038', 5, 23, 2, 6, 1, 5),
(6, 'Piotr', 'Witkowski', '67-632', '559475676', 6, 5, 3, 5, 1, 6),
(7, 'Bartek', 'Sadowski', '06-698', '647542890', 1, 9, 1, 4, 1, 7),
(8, 'Wiktor', 'Morawski', '75-722', '882819458', 2, 7, 2, 3, 1, 1),
(9, 'Oliwia', 'Dziedzic', '88-820', '735816001', 3, 10, 3, 2, 2, 2),
(10, 'Julia', 'Zajac', '96-998', '686470407', 4, 21, 1, 1, 2, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `premia`
--

CREATE TABLE `premia` (
  `ID_prem` int(4) NOT NULL,
  `Dodatek` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `premia`
--

INSERT INTO `premia` (`ID_prem`, `Dodatek`) VALUES
(1, 106),
(2, 142),
(3, 186),
(4, 245),
(5, 301),
(6, 317),
(7, 323),
(8, 342),
(9, 369),
(10, 421);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rekrut`
--

CREATE TABLE `rekrut` (
  `ID_re` int(4) NOT NULL,
  `Imie` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `Nazwisko` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `Ulica` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `Kod_pocztowy` varchar(6) COLLATE utf8_polish_ci NOT NULL,
  `Nr_tel` char(9) COLLATE utf8_polish_ci NOT NULL,
  `ID_mias` int(4) DEFAULT NULL,
  `ID_kurs` int(4) DEFAULT NULL,
  `ID_wyk` int(4) DEFAULT NULL,
  `ID_plec` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `rekrut`
--

INSERT INTO `rekrut` (`ID_re`, `Imie`, `Nazwisko`, `Ulica`, `Kod_pocztowy`, `Nr_tel`, `ID_mias`, `ID_kurs`, `ID_wyk`, `ID_plec`) VALUES
(1, 'Jan', 'Dmuchawiec', 'Paderewskiego', '12-934', '123678094', 1, 1, 3, 1),
(2, 'Julia', 'Kania', 'Jagiellonska', '11-456', '123612094', 2, 2, 2, 2),
(3, 'Alicja', 'Sikorska', 'Cicha', '16-661', '123670094', 3, 3, 1, 2),
(4, 'Stefan', 'Jakubowski', 'Owocowa', '14-068', '453678094', 4, 4, 6, 1),
(5, 'Antoni', 'Stepien', 'Szeroka', '13-244', '343678094', 5, 5, 5, 1),
(6, 'Julia', 'Krol', 'Artyleryjska', '15-005', '123678123', 6, 6, 4, 2),
(7, 'Mateusz', 'Wasilewski', 'Mocarna', '11-455', '123688094', 1, 7, 3, 1),
(8, 'Nina', 'Brzozowska', 'Zelazna', '01-884', '123678909', 2, 8, 2, 2),
(9, 'Maciej', 'Wojcik', 'Borowkowa', '08-124', '123648094', 3, 9, 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sprzedaz_rud`
--

CREATE TABLE `sprzedaz_rud` (
  `ID_sr` int(4) NOT NULL,
  `Ilosc_wydobytych` int(5) NOT NULL,
  `Ilosc_sprzedanych` int(5) NOT NULL,
  `ID_wr` int(4) DEFAULT NULL,
  `Miesiac` char(12) COLLATE utf8_polish_ci NOT NULL,
  `Dzien` char(31) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `sprzedaz_rud`
--

INSERT INTO `sprzedaz_rud` (`ID_sr`, `Ilosc_wydobytych`, `Ilosc_sprzedanych`, `ID_wr`, `Miesiac`, `Dzien`) VALUES
(1, 1241, 412, 1, '11', '13'),
(2, 6782, 4253, 2, '01', '09'),
(3, 2343, 645, 3, '05', '05'),
(4, 6545, 321, 1, '08', '29'),
(5, 4566, 890, 2, '10', '31'),
(6, 6987, 2345, 3, '12', '27'),
(7, 2388, 1734, 1, '02', '22'),
(8, 5239, 2287, 2, '03', '20'),
(9, 8697, 3907, 3, '04', '16'),
(10, 1196, 987, 1, '01', '11');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `stanowisko`
--

CREATE TABLE `stanowisko` (
  `ID_stan` int(4) NOT NULL,
  `Nazwa` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `ID_prem` int(4) DEFAULT NULL,
  `ID_pen` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `stanowisko`
--

INSERT INTO `stanowisko` (`ID_stan`, `Nazwa`, `ID_prem`, `ID_pen`) VALUES
(1, 'Slusarz', 1, 2),
(2, 'Mechanik', 3, 4),
(3, 'Spawacz', 5, 6),
(4, 'Elektromonter', 7, 8),
(5, 'Mechanik', 9, 10),
(6, 'Magazynier', 1, 2),
(7, 'Geodeta', 3, 4);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `staz_pracy`
--

CREATE TABLE `staz_pracy` (
  `ID_SP` int(4) NOT NULL,
  `Rok_rozpoczecia` varchar(4) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `staz_pracy`
--

INSERT INTO `staz_pracy` (`ID_SP`, `Rok_rozpoczecia`) VALUES
(1, '2007'),
(2, '2008'),
(3, '2010'),
(4, '2019'),
(5, '2018'),
(6, '2017'),
(7, '2016'),
(8, '2015'),
(9, '2014'),
(10, '2013'),
(11, '2012'),
(12, '2011'),
(13, '2006'),
(14, '2005'),
(15, '2004'),
(16, '2003'),
(17, '2002'),
(18, '2001'),
(19, '1999'),
(20, '1998'),
(21, '1997'),
(22, '1996'),
(23, '1995'),
(24, '1994'),
(25, '1993'),
(26, '1992'),
(27, '1991'),
(28, '1990'),
(29, '1989'),
(30, '1988'),
(31, '1987'),
(32, '1986'),
(33, '1985'),
(34, '1984'),
(35, '1983'),
(36, '2020'),
(37, '2021');

--
-- Wyzwalacze `staz_pracy`
--
DELIMITER $$
CREATE TRIGGER `staz_pracy_before` BEFORE INSERT ON `staz_pracy` FOR EACH ROW BEGIN
  IF NEW.Rok_rozpoczecia < 1984
  THEN
    SET NEW.Rok_rozpoczecia = 1983;
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wojewodztwo`
--

CREATE TABLE `wojewodztwo` (
  `ID_woj` int(4) NOT NULL,
  `Nazwa` varchar(20) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `wojewodztwo`
--

INSERT INTO `wojewodztwo` (`ID_woj`, `Nazwa`) VALUES
(1, 'Dolnyslask'),
(2, 'ZachodnioPomorskie');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wycena_rud`
--

CREATE TABLE `wycena_rud` (
  `ID_wr` int(4) NOT NULL,
  `Cena_rudy` int(5) NOT NULL,
  `Nazwa_rudy` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `ID_nje` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `wycena_rud`
--

INSERT INTO `wycena_rud` (`ID_wr`, `Cena_rudy`, `Nazwa_rudy`, `ID_nje`) VALUES
(1, 10, 'Miedz', 1),
(2, 20, 'Srebro', 2),
(3, 80, 'Zwir', 4);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wyksztalcenie`
--

CREATE TABLE `wyksztalcenie` (
  `ID_wyk` int(4) NOT NULL,
  `Nazwa` varchar(30) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `wyksztalcenie`
--

INSERT INTO `wyksztalcenie` (`ID_wyk`, `Nazwa`) VALUES
(1, 'Podstawowe'),
(2, 'Gimnazjalne'),
(3, 'Srednie'),
(4, 'Licencjat'),
(5, 'Magister'),
(6, 'Profesor');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zaklad_gorniczy`
--

CREATE TABLE `zaklad_gorniczy` (
  `ID_ZG` int(4) NOT NULL,
  `Nazwa` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `ID_zmia` int(4) DEFAULT NULL,
  `ID_krodd` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `zaklad_gorniczy`
--

INSERT INTO `zaklad_gorniczy` (`ID_ZG`, `Nazwa`, `ID_zmia`, `ID_krodd`) VALUES
(1, 'Biuro', 2, 1),
(2, 'Kopalnia', 3, 1),
(3, 'Szyb', 1, 1);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `zapytanie1`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `zapytanie1` (
`nazwa` varchar(30)
,`Kwota` int(5)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `zapytanie2`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `zapytanie2` (
`Imie` varchar(20)
,`Nazwa` varchar(30)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `zapytanie3`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `zapytanie3` (
`Srednia_cena_rudy` decimal(13,2)
,`Numer` int(4)
,`Nazwa_rudy` varchar(30)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `zapytanie4`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `zapytanie4` (
`Ilosc_sprzedanych` int(5)
,`Nazwa_rudy` varchar(30)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `zapytanie5`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `zapytanie5` (
`Nazwa` varchar(30)
,`Imie` varchar(30)
,`Kod_pocztowy` varchar(6)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `zapytanie6`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `zapytanie6` (
`Numer` int(4)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `zapytanie7`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `zapytanie7` (
`Nazwa` varchar(30)
,`ID_pracownik` bigint(21)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `zapytanie8`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `zapytanie8` (
`Nazwa` varchar(30)
,`Kwota` int(5)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `zapytanie9`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `zapytanie9` (
`Dodatek` int(5)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `zapytanie10`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `zapytanie10` (
`Nazwisko` varchar(20)
,`Imie` varchar(20)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zmiany`
--

CREATE TABLE `zmiany` (
  `ID_zmia` int(4) NOT NULL,
  `Ilosc_zmian` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `ID_GP` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `zmiany`
--

INSERT INTO `zmiany` (`ID_zmia`, `Ilosc_zmian`, `ID_GP`) VALUES
(1, 'Trzecia', 3),
(2, 'Druga', 2),
(3, 'Pierwsza', 1);

-- --------------------------------------------------------

--
-- Struktura widoku `zapytanie1`
--
DROP TABLE IF EXISTS `zapytanie1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zapytanie1`  AS  select `stanowisko`.`Nazwa` AS `nazwa`,`pensja`.`Kwota` AS `Kwota` from (`stanowisko` join `pensja` on(`stanowisko`.`ID_stan` = `pensja`.`ID_pen`)) where `stanowisko`.`Nazwa` in ('Spawacz','Mechanik') and `pensja`.`Kwota` >= 5000 ;

-- --------------------------------------------------------

--
-- Struktura widoku `zapytanie2`
--
DROP TABLE IF EXISTS `zapytanie2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zapytanie2`  AS  select `pracownik`.`Imie` AS `Imie`,`wyksztalcenie`.`Nazwa` AS `Nazwa` from (`wyksztalcenie` join `pracownik` on(`wyksztalcenie`.`ID_wyk` = `pracownik`.`ID_prac`)) where `pracownik`.`Imie` like '%T%' ;

-- --------------------------------------------------------

--
-- Struktura widoku `zapytanie3`
--
DROP TABLE IF EXISTS `zapytanie3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zapytanie3`  AS  select round(avg(`wycena_rud`.`Cena_rudy`),2) AS `Srednia_cena_rudy`,`numer_jednostki`.`Numer` AS `Numer`,`wycena_rud`.`Nazwa_rudy` AS `Nazwa_rudy` from (`wycena_rud` left join `numer_jednostki` on(`wycena_rud`.`ID_wr` = `numer_jednostki`.`ID_nje`)) order by round(avg(`wycena_rud`.`Cena_rudy`),2) ;

-- --------------------------------------------------------

--
-- Struktura widoku `zapytanie4`
--
DROP TABLE IF EXISTS `zapytanie4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zapytanie4`  AS  select `sprzedaz_rud`.`Ilosc_sprzedanych` AS `Ilosc_sprzedanych`,`wycena_rud`.`Nazwa_rudy` AS `Nazwa_rudy` from (`sprzedaz_rud` join `wycena_rud` on(`sprzedaz_rud`.`ID_sr` = `wycena_rud`.`ID_wr`)) where `sprzedaz_rud`.`Ilosc_sprzedanych` > 1000 ;

-- --------------------------------------------------------

--
-- Struktura widoku `zapytanie5`
--
DROP TABLE IF EXISTS `zapytanie5`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zapytanie5`  AS  select `miasto`.`Nazwa` AS `Nazwa`,`rekrut`.`Imie` AS `Imie`,`rekrut`.`Kod_pocztowy` AS `Kod_pocztowy` from (`miasto` join `rekrut` on(`miasto`.`ID_mias` = `rekrut`.`ID_re`)) where `miasto`.`ID_mias` in (1,6) ;

-- --------------------------------------------------------

--
-- Struktura widoku `zapytanie6`
--
DROP TABLE IF EXISTS `zapytanie6`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zapytanie6`  AS  select `numer_jednostki`.`Numer` AS `Numer` from `numer_jednostki` group by `numer_jednostki`.`ID_nje` having count(0) ;

-- --------------------------------------------------------

--
-- Struktura widoku `zapytanie7`
--
DROP TABLE IF EXISTS `zapytanie7`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zapytanie7`  AS  select `stanowisko`.`Nazwa` AS `Nazwa`,count(`pracownik`.`ID_prac`) AS `ID_pracownik` from (`stanowisko` join `pracownik` on(`pracownik`.`ID_prac` = `stanowisko`.`ID_stan`)) group by `stanowisko`.`Nazwa` having count(`pracownik`.`ID_prac`) < 2 ;

-- --------------------------------------------------------

--
-- Struktura widoku `zapytanie8`
--
DROP TABLE IF EXISTS `zapytanie8`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zapytanie8`  AS  select `stanowisko`.`Nazwa` AS `Nazwa`,`pensja`.`Kwota` AS `Kwota` from (`stanowisko` join `pensja` on(`stanowisko`.`ID_stan` = `pensja`.`ID_pen`)) where `stanowisko`.`Nazwa` in ('Slusarz','Geodeta') group by `stanowisko`.`Nazwa` having count(`pensja`.`Kwota`) < 5000 ;

-- --------------------------------------------------------

--
-- Struktura widoku `zapytanie9`
--
DROP TABLE IF EXISTS `zapytanie9`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zapytanie9`  AS  select `premia`.`Dodatek` AS `Dodatek` from `premia` where `premia`.`Dodatek` > (select avg(`premia`.`Dodatek`) from `premia`) order by `premia`.`Dodatek` desc ;

-- --------------------------------------------------------

--
-- Struktura widoku `zapytanie10`
--
DROP TABLE IF EXISTS `zapytanie10`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zapytanie10`  AS  select `pracownik`.`Nazwisko` AS `Nazwisko`,`pracownik`.`Imie` AS `Imie` from `pracownik` where `pracownik`.`ID_prac` < (select max(`pensja`.`Kwota`) from `pensja` where `pracownik`.`ID_prac` = `pensja`.`ID_pen`) order by `pracownik`.`Nazwisko` ;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `gmina`
--
ALTER TABLE `gmina`
  ADD PRIMARY KEY (`ID_gmi`),
  ADD KEY `ID_pow` (`ID_pow`);

--
-- Indeksy dla tabeli `godziny_pracy`
--
ALTER TABLE `godziny_pracy`
  ADD PRIMARY KEY (`ID_GP`);

--
-- Indeksy dla tabeli `kraje_oddzialy_kghm`
--
ALTER TABLE `kraje_oddzialy_kghm`
  ADD PRIMARY KEY (`ID_krodd`);

--
-- Indeksy dla tabeli `kurs`
--
ALTER TABLE `kurs`
  ADD PRIMARY KEY (`ID_kurs`);

--
-- Indeksy dla tabeli `miasto`
--
ALTER TABLE `miasto`
  ADD PRIMARY KEY (`ID_mias`),
  ADD KEY `ID_gmi` (`ID_gmi`);

--
-- Indeksy dla tabeli `numer_jednostki`
--
ALTER TABLE `numer_jednostki`
  ADD PRIMARY KEY (`ID_nje`),
  ADD KEY `ID_ZG` (`ID_ZG`);

--
-- Indeksy dla tabeli `pensja`
--
ALTER TABLE `pensja`
  ADD PRIMARY KEY (`ID_pen`);

--
-- Indeksy dla tabeli `plec`
--
ALTER TABLE `plec`
  ADD PRIMARY KEY (`ID_plec`);

--
-- Indeksy dla tabeli `powiat`
--
ALTER TABLE `powiat`
  ADD PRIMARY KEY (`ID_pow`),
  ADD KEY `ID_woj` (`ID_woj`);

--
-- Indeksy dla tabeli `pracownik`
--
ALTER TABLE `pracownik`
  ADD PRIMARY KEY (`ID_prac`),
  ADD KEY `ID_wyk` (`ID_wyk`,`ID_SP`,`ID_GP`,`ID_NJE`),
  ADD KEY `ID_GP` (`ID_GP`),
  ADD KEY `ID_SP` (`ID_SP`),
  ADD KEY `ID_NJE` (`ID_NJE`),
  ADD KEY `ID_plec` (`ID_plec`),
  ADD KEY `ID_stan` (`ID_stan`);

--
-- Indeksy dla tabeli `premia`
--
ALTER TABLE `premia`
  ADD PRIMARY KEY (`ID_prem`);

--
-- Indeksy dla tabeli `rekrut`
--
ALTER TABLE `rekrut`
  ADD PRIMARY KEY (`ID_re`),
  ADD KEY `ID_mias` (`ID_mias`,`ID_kurs`,`ID_wyk`),
  ADD KEY `ID_kurs` (`ID_kurs`),
  ADD KEY `ID_wyk` (`ID_wyk`),
  ADD KEY `ID_plec` (`ID_plec`);

--
-- Indeksy dla tabeli `sprzedaz_rud`
--
ALTER TABLE `sprzedaz_rud`
  ADD PRIMARY KEY (`ID_sr`),
  ADD KEY `ID_wr` (`ID_wr`);

--
-- Indeksy dla tabeli `stanowisko`
--
ALTER TABLE `stanowisko`
  ADD PRIMARY KEY (`ID_stan`),
  ADD KEY `ID_prem` (`ID_prem`,`ID_pen`),
  ADD KEY `ID_pen` (`ID_pen`);

--
-- Indeksy dla tabeli `staz_pracy`
--
ALTER TABLE `staz_pracy`
  ADD PRIMARY KEY (`ID_SP`);

--
-- Indeksy dla tabeli `wojewodztwo`
--
ALTER TABLE `wojewodztwo`
  ADD PRIMARY KEY (`ID_woj`);

--
-- Indeksy dla tabeli `wycena_rud`
--
ALTER TABLE `wycena_rud`
  ADD PRIMARY KEY (`ID_wr`),
  ADD KEY `ID_nje` (`ID_nje`);

--
-- Indeksy dla tabeli `wyksztalcenie`
--
ALTER TABLE `wyksztalcenie`
  ADD PRIMARY KEY (`ID_wyk`);

--
-- Indeksy dla tabeli `zaklad_gorniczy`
--
ALTER TABLE `zaklad_gorniczy`
  ADD PRIMARY KEY (`ID_ZG`),
  ADD KEY `ID_zmia` (`ID_zmia`,`ID_krodd`),
  ADD KEY `ID_krodd` (`ID_krodd`);

--
-- Indeksy dla tabeli `zmiany`
--
ALTER TABLE `zmiany`
  ADD PRIMARY KEY (`ID_zmia`),
  ADD KEY `ID_GP` (`ID_GP`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `gmina`
--
ALTER TABLE `gmina`
  ADD CONSTRAINT `gmina_ibfk_1` FOREIGN KEY (`ID_pow`) REFERENCES `powiat` (`ID_pow`);

--
-- Ograniczenia dla tabeli `miasto`
--
ALTER TABLE `miasto`
  ADD CONSTRAINT `miasto_ibfk_1` FOREIGN KEY (`ID_gmi`) REFERENCES `gmina` (`ID_gmi`);

--
-- Ograniczenia dla tabeli `numer_jednostki`
--
ALTER TABLE `numer_jednostki`
  ADD CONSTRAINT `numer_jednostki_ibfk_1` FOREIGN KEY (`ID_ZG`) REFERENCES `zaklad_gorniczy` (`ID_ZG`);

--
-- Ograniczenia dla tabeli `powiat`
--
ALTER TABLE `powiat`
  ADD CONSTRAINT `powiat_ibfk_1` FOREIGN KEY (`ID_woj`) REFERENCES `wojewodztwo` (`ID_woj`);

--
-- Ograniczenia dla tabeli `pracownik`
--
ALTER TABLE `pracownik`
  ADD CONSTRAINT `pracownik_ibfk_1` FOREIGN KEY (`ID_wyk`) REFERENCES `wyksztalcenie` (`ID_wyk`),
  ADD CONSTRAINT `pracownik_ibfk_2` FOREIGN KEY (`ID_GP`) REFERENCES `godziny_pracy` (`ID_GP`),
  ADD CONSTRAINT `pracownik_ibfk_3` FOREIGN KEY (`ID_SP`) REFERENCES `staz_pracy` (`ID_SP`),
  ADD CONSTRAINT `pracownik_ibfk_4` FOREIGN KEY (`ID_NJE`) REFERENCES `numer_jednostki` (`ID_nje`),
  ADD CONSTRAINT `pracownik_ibfk_5` FOREIGN KEY (`ID_plec`) REFERENCES `plec` (`ID_plec`),
  ADD CONSTRAINT `pracownik_ibfk_6` FOREIGN KEY (`ID_stan`) REFERENCES `stanowisko` (`ID_stan`);

--
-- Ograniczenia dla tabeli `rekrut`
--
ALTER TABLE `rekrut`
  ADD CONSTRAINT `rekrut_ibfk_1` FOREIGN KEY (`ID_mias`) REFERENCES `miasto` (`ID_mias`),
  ADD CONSTRAINT `rekrut_ibfk_2` FOREIGN KEY (`ID_kurs`) REFERENCES `kurs` (`ID_kurs`),
  ADD CONSTRAINT `rekrut_ibfk_3` FOREIGN KEY (`ID_wyk`) REFERENCES `wyksztalcenie` (`ID_wyk`),
  ADD CONSTRAINT `rekrut_ibfk_4` FOREIGN KEY (`ID_plec`) REFERENCES `plec` (`ID_plec`);

--
-- Ograniczenia dla tabeli `sprzedaz_rud`
--
ALTER TABLE `sprzedaz_rud`
  ADD CONSTRAINT `sprzedaz_rud_ibfk_1` FOREIGN KEY (`ID_wr`) REFERENCES `wycena_rud` (`ID_wr`);

--
-- Ograniczenia dla tabeli `stanowisko`
--
ALTER TABLE `stanowisko`
  ADD CONSTRAINT `stanowisko_ibfk_1` FOREIGN KEY (`ID_prem`) REFERENCES `premia` (`ID_prem`),
  ADD CONSTRAINT `stanowisko_ibfk_2` FOREIGN KEY (`ID_pen`) REFERENCES `pensja` (`ID_pen`);

--
-- Ograniczenia dla tabeli `wycena_rud`
--
ALTER TABLE `wycena_rud`
  ADD CONSTRAINT `wycena_rud_ibfk_1` FOREIGN KEY (`ID_nje`) REFERENCES `numer_jednostki` (`ID_nje`);

--
-- Ograniczenia dla tabeli `zaklad_gorniczy`
--
ALTER TABLE `zaklad_gorniczy`
  ADD CONSTRAINT `zaklad_gorniczy_ibfk_1` FOREIGN KEY (`ID_zmia`) REFERENCES `zmiany` (`ID_zmia`),
  ADD CONSTRAINT `zaklad_gorniczy_ibfk_2` FOREIGN KEY (`ID_krodd`) REFERENCES `kraje_oddzialy_kghm` (`ID_krodd`);

--
-- Ograniczenia dla tabeli `zmiany`
--
ALTER TABLE `zmiany`
  ADD CONSTRAINT `zmiany_ibfk_1` FOREIGN KEY (`ID_GP`) REFERENCES `zaklad_gorniczy` (`ID_ZG`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
