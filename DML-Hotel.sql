
INSERT INTO Klienci (IdKlienta, Numertelefonu, Imie, Nazwisko)
VALUES
    (1, '123456789', 'Jan', 'Kowalski'),
    (2, '987654321', 'Anna', 'Nowak'),
    (3, '115553355', 'Michał', 'Wiśniewski'),
    (4, '444444444', 'Maria', 'Lewandowska'),
    (5, '555555555', 'Piotr', 'Kaczmarek'),
    (6, '666222666', 'Alicja', 'Wójcik'),
    (7, '775777777', 'Marek', 'Zając'),
    (8, '554332454', 'Ela', 'Bombala'),
    (9, '987654321', 'Anna', 'Nowak'),
    (10, '111222333', 'Tomasz', 'Kowalczyk'),
    (11, '444555666', 'Magda', 'Wójcik'),
    (12, '999888777', 'Michał', 'Kowalski');


INSERT INTO Hotel (IdHotelu, Miasto, Adres)
VALUES (1, 'Warszawa', 'ul. Nowa 20'),
       (2, 'Kraków', 'ul. Stara 22'),
       (3, 'Gdańsk', 'ul. Główna 11');

INSERT INTO Pokoje (IdPokoju, Hotel_IdHotelu, Numerpokoju, Numerpietra, Standard, Cena)
VALUES
  (1, 1, 101, 1, 'Standard', 100),
  (7, 1, 201, 2, 'Standard', 100),
  (8, 1, 202, 2, 'StandardPremium',200),
  (9, 1, 301, 3, 'Apartament', 150),
  (2, 1, 102, 1, 'StandardPremium', 300),
  (3, 2, 201, 2, 'Apartament', 100),
  (4, 2, 202, 2, 'StandardPremium', 500),
  (5, 3, 301, 3, 'Standard', 150),
  (6, 3, 302, 3, 'Standard', 100);

INSERT INTO Pracownicy (IdPracownika, Numertelefonu, Imie, Nazwisko, Datarozpoczeciapracy)
VALUES
  (1, '111111111', 'Adam', 'Nowak', '2022-01-01'),
  (2, '555122222', 'Ewa', 'Kowalska', '2022-02-01'),
  (3, '335839433', 'Tomasz', 'Wiśniewski', '2022-03-01'),
  (4, '447391932', 'Leon', 'Praski', '2022-01-04'),
  (5, '859439274', 'Kuba', 'Rozterka', '2022-04-06'),
  (6, '335839433', 'Janusz', 'Lewandowski', '2022-03-07');

INSERT INTO Uslugi (IdUslugi, cena)
VALUES
  (1, 50.00),
  (2, 20.00),
  (3, 80.00),
  (4, 90.00);

INSERT INTO Rezerwacje (IdRezerwacje, Klienci_IdKlienta, Datarezerwacji, DataPrzyjazdu, DataOdjazdu, Pokoje_IdPokoju, Zaplacona)
VALUES
  (1, 1, '2023-05-01', '2023-06-01', '2023-06-10', 1, 1000),
  (2, 2, '2023-05-02', '2023-06-02', '2023-06-09', 2, 500),
  (3, 3, '2023-05-03', '2023-06-03', '2023-06-08', 3, NULL),
  (4, 4, '2023-07-01', '2023-07-01', '2023-07-10', 1, NULL),
  (5, 5, '2023-07-02', '2023-07-12', '2023-07-22', 2, NULL),
  (6, 6, '2023-07-04', '2023-07-07', '2023-07-10', 3, 2000),
  (7, 2, '2023-08-02', '2023-08-11', '2023-08-13', 2, NULL),
  (8, 2, '2023-09-03', '2023-09-21', '2023-09-22', 5, 3000),
  (9, 5, '2023-09-02', '2023-09-12', '2023-09-22', 2, NULL);

INSERT INTO PokojObsluga (Pokoje_IdPokoju, Pracownicy_IdPracownika, Datasprzatania)
VALUES
  (1, 1, '2023-05-01'),
  (2, 2, '2023-05-02'),
  (3, 1, '2023-05-03'),
  (4, 1, '2023-05-01'),
  (5, 2, '2023-05-02'),
  (6, 1, '2023-05-03'),
  (4, 1, '2023-06-01'),
  (4, 1, '2023-07-01');

INSERT INTO ZarobkiHistoria (Pracownicy_IdPracownika, Data_Od, Zatobki)
VALUES
  (1, '2022-01-01', 2000.00),
  (2, '2022-02-01', 1800.00),
  (3, '2022-03-01', 2200.00),
  (4, '2022-01-04', 1900.00),
  (5, '2022-04-06', 2100.00),
  (6, '2022-03-07', 1950.00),
  (1, '2023-02-01', 2200.00),
  (2, '2023-02-02', 2300.00),
  (3, '2023-02-01', 2100.00),
  (1, '2023-05-02', 4000.00);

INSERT INTO ZamowieniaUslugi (Uslugi_IdUslugi, ilosc, Rezerwacje_IdRezerwacje, Pracownicy_IdPracownika)
VALUES
  (1, 2, 1, 1),
  (2, 1, 2, 3),
  (3, 1, 3, 2),
  (4, 3, 1, 1),
  (5, 1, 5, 6),
  (7, 1, 5, 6),
  (8, 1, 5, 6),
  (6, 1, 4, 6);