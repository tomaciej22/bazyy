1)
	SELECT stanowisko.nazwa, pensja.Kwota 
	FROM stanowisko 
	INNER JOIN pensja 
	ON stanowisko.ID_stan = pensja.ID_pen 
	WHERE stanowisko.nazwa IN ('Spawacz','Mechanik') AND pensja.Kwota >=5000
2)
	SELECT pracownik.Imie, wyksztalcenie.Nazwa
	FROM wyksztalcenie
	INNER JOIN pracownik
	ON wyksztalcenie.ID_wyk = pracownik.ID_prac
	WHERE pracownik.Imie LIKE '%T%'
3)
	SELECT ROUND(AVG(wycena_rud.Cena_rudy),2) AS 'Srednia_cena_rudy', numer_jednostki.Numer, wycena_rud.Nazwa_rudy
	FROM wycena_rud
	LEFT JOIN numer_jednostki
	ON wycena_rud.ID_wr = numer_jednostki.ID_nje
	ORDER BY Srednia_cena_rudy
4)
	SELECT sprzedaz_rud.Ilosc_sprzedanych,wycena_rud.Nazwa_rudy
	FROM sprzedaz_rud
	INNER JOIN wycena_rud
	ON sprzedaz_rud.ID_sr = wycena_rud.ID_wr
	WHERE sprzedaz_rud.Ilosc_sprzedanych > 1000
5)
	SELECT miasto.Nazwa, rekrut.Imie, rekrut.Kod_pocztowy 
	FROM miasto
	INNER JOIN rekrut 
	ON miasto.ID_mias = rekrut.ID_re 
	WHERE miasto.ID_mias IN (1,6)
6)
	SELECT Numer
    FROM numer_jednostki
	GROUP BY ID_nje
	HAVING COUNT(*)
7)
	SELECT stanowisko.Nazwa, COUNT(pracownik.ID_prac) AS 'ID_pracownik'
	FROM (stanowisko
	INNER JOIN pracownik ON pracownik.ID_prac = stanowisko.ID_stan)
	GROUP BY stanowisko.Nazwa
	HAVING COUNT(pracownik.ID_prac) < 2
8)
	SELECT stanowisko.Nazwa, pensja.Kwota
	FROM stanowisko
	INNER JOIN pensja ON stanowisko.ID_stan = pensja.ID_pen
	WHERE stanowisko.Nazwa IN ('Slusarz','Geodeta')
	GROUP BY stanowisko.Nazwa
	HAVING COUNT(pensja.Kwota) < 5000
9)
	SELECT Dodatek
	FROM premia
	WHERE Dodatek>(SELECT AVG(Dodatek) FROM premia)
	ORDER BY dodatek DESC
10)
	SELECT pracownik.Nazwisko, pracownik.Imie
	FROM pracownik
	WHERE pracownik.ID_prac<(SELECT MAX(pensja.kwota)
	FROM pensja
	WHERE pracownik.ID_prac = pensja.ID_pen)
	ORDER BY pracownik.Nazwisko ASC