--5 poleceń SELECT z warunkiem WHERE
--: Wybierz wszystkich klientów o numerze telefonu zaczynającym się od '9'
SELECT *
FROM Klienci
WHERE Numertelefonu LIKE '9%';
-- Wybierz wszystkie rezerwacje z przyjazdem w czerwcu 
SELECT *
FROM Rezerwacje
WHERE DataPrzyjazdu BETWEEN '2023-06-01' AND '2023-06-30';
--Wybierz wszystkich pracowników zatrudnionych po II kwartale roku 2022.
SELECT *
FROM Pracownicy
WHERE Datarozpoczeciapracy > '2022-04-01';
--Wybierz wszystkie pokoje z numerem piętra większym niż 2
SELECT *
FROM Pokoje
WHERE Numerpietra > 2;
--Wybierz wszystkich klientów o imieniu Michał
SELECT *
FROM Klienci k 
WHERE Imie  = 'Michał';

--5 poleceń SELECT ze złączeniem tabel
--Wybierz wszystkie pokoje z miasta "Warszawa" o standardzie "StandardPremium"
SELECT *
FROM Pokoje
JOIN Hotel ON Pokoje.Hotel_IdHotelu = Hotel.IdHotelu
WHERE Hotel.Miasto = 'Warszawa' AND Pokoje.Standard = 'StandardPremium';
--Wybierz wszystkie pokoje z miasta Kraków lub Gdańsk
SELECT *
FROM Pokoje
JOIN Hotel ON Pokoje.Hotel_IdHotelu = Hotel.IdHotelu
WHERE Hotel.Miasto IN ('Kraków', 'Gdańsk');
--Wypisz numery telefonów klientów, date przyjazdu i id hotelu
SELECT Klienci.Numertelefonu, Pokoje.Hotel_IdHotelu, Rezerwacje.DataPrzyjazdu
FROM Rezerwacje
JOIN Klienci ON Rezerwacje.Klienci_IdKlienta = Klienci.IdKlienta
JOIN Pokoje ON Rezerwacje.Pokoje_IdPokoju = Pokoje.IdPokoju;
--Wypisz jak zmieniła się pęsja pracownika Adam Nowak
SELECT ZarobkiHistoria.Data_Od  ,ZarobkiHistoria.Zatobki 
FROM Pracownicy
JOIN ZarobkiHistoria ON Pracownicy.IdPracownika = ZarobkiHistoria.Pracownicy_IdPracownika
WHERE Pracownicy.Imie = 'Adam' AND Pracownicy.Nazwisko = 'Nowak';
--Wypisz numeery pokoje o standardzie Premium wraz z adresem hotelu do którego należą
SELECT Pokoje.Numerpokoju, Hotel.IdHotelu, Hotel.Adres 
FROM Pokoje
JOIN Hotel ON Pokoje.Hotel_IdHotelu = Hotel.IdHotelu
WHERE Pokoje.Standard = 'StandardPremium';

--5 poleceń SELECT z klauzulą GROUP BY, w tym co najmniej 2 z klauzulą HAVING
--Wypisz ilości rezerwacji dla każdego klienta, dla których ilość rezerwacji jest większa niż 2
SELECT Klienci.Imie, Klienci.Nazwisko, COUNT(*) AS IloscRezerwacji
FROM Rezerwacje
JOIN Klienci ON Rezerwacje.Klienci_IdKlienta = Klienci.IdKlienta
GROUP BY  Klienci.Imie, Klienci.Nazwisko
HAVING COUNT(*) >= 2;
-- Wypisz liczbę zrealizowanych zamówień dla kazdego pracownika, podaj ich imiona i nazwiska oraz posortuj je wzgledem ilosci zamówionych usług malejaco
SELECT P.IdPracownika, P.Imie, P.Nazwisko, COUNT(*) AS LiczbaZamowien
FROM ZamowieniaUslugi Z
JOIN Pracownicy P ON Z.Pracownicy_IdPracownika = P.IdPracownika
GROUP BY P.IdPracownika, P.Imie, P.Nazwisko
ORDER BY LiczbaZamowien DESC;
-- Wypisz liczbę zamówionych usług dodatkowych przez każdego klienta, którzy dokonali co najmniej 2 zamówienia
SELECT Klienci.Imie, Klienci.Nazwisko, COUNT(*) AS LiczbaZamowien
FROM Rezerwacje
JOIN ZamowieniaUslugi ON Rezerwacje.IdRezerwacje = ZamowieniaUslugi.Rezerwacje_IdRezerwacje
JOIN Klienci ON Rezerwacje.Klienci_IdKlienta = Klienci.IdKlienta
GROUP BY Klienci.IdKlienta, Klienci.Imie, Klienci.Nazwisko
HAVING COUNT(*) >= 2;
-- Wypisz srednie zaronki kazdego pracownika na przestrzeni lat
SELECT P.Imie, P.Nazwisko, AVG(Z.Zatobki) AS SredniaPensja
FROM ZarobkiHistoria Z
JOIN Pracownicy P ON Z.Pracownicy_IdPracownika = P.IdPracownika
GROUP BY P.Imie, P.Nazwisko;
-- Wypisz ile razy pokój był sprzatany przez obsługe
SELECT Pokoje_IdPokoju, COUNT(*) AS LiczbaSprzatan
FROM PokojObsluga
GROUP BY Pokoje_IdPokoju;

--5 poleceń z podzapytaniem, w tym co najmniej 2 z podzapytaniem skorelowanym
--Wypisz listę usług, których cena przekracza średnią cenę wszystkich usług
SELECT IdUslugi, Cena
FROM Uslugi
WHERE Cena > (SELECT AVG(Cena) 
			  FROM Uslugi);
-- Wypisz listę pokoi, które nie były jeszcze zarezerwowane		 
SELECT P.IdPokoju, P.NumerPokoju, H.Adres
FROM Pokoje P
JOIN Hotel H ON P.Hotel_IdHotelu = H.IdHotelu
WHERE P.IdPokoju NOT IN (SELECT DISTINCT Pokoje_IdPokoju FROM Rezerwacje);
-- Wypisz listę pokoi, które maja ten sam standard co pokój o id 9 
SELECT IdPokoju, NumerPokoju, Standard
FROM Pokoje
WHERE Standard = (SELECT Standard FROM Pokoje WHERE IdPokoju = 9);
--Wyświetl pokoje, które nie są zarezerwowane w czerwcu
SELECT p.NumerPokoju, h.Miasto
FROM Pokoje p
JOIN Hotel h ON p.Hotel_IdHotelu = h.IdHotelu
WHERE p.IdPokoju NOT IN (
    SELECT r.Pokoje_IdPokoju
    FROM Rezerwacje r
    WHERE (r.DataPrzyjazdu BETWEEN '2023-06-01' AND '2023-06-30') AND (r.DataOdjazdu BETWEEN '2023-06-01' AND '2023-06-30'));
--Wyświetl nazwiska klientów, którzy dokonali rezerwacji w hotelu w Warszawie 
SELECT Nazwisko
FROM Klienci
WHERE IdKlienta IN (SELECT Klienci_IdKlienta 
					FROM Rezerwacje 
					WHERE Pokoje_IdPokoju IN (SELECT IdPokoju 
											  FROM Pokoje 
											  WHERE Hotel_IdHotelu IN (SELECT IdHotelu 
											 						   FROM Hotel 
											 						   WHERE Miasto = 'Warszawa')));
