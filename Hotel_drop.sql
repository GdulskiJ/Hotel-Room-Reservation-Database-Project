-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-06-22 21:59:22.616

-- foreign keys
ALTER TABLE PokojObsluga
    DROP CONSTRAINT PokojObsluzi_Pracownicy;

ALTER TABLE PokojObsluga
    DROP CONSTRAINT Pokoje;

ALTER TABLE Pokoje
    DROP CONSTRAINT Pokoje_Hotel;

ALTER TABLE Rezerwacje
    DROP CONSTRAINT Rezerwacje_Klienci;

ALTER TABLE Rezerwacje
    DROP CONSTRAINT Rezerwacje_Pokoje;

ALTER TABLE ZamowieniaUslugi
    DROP CONSTRAINT ZamowieniaUslugi_Pracownicy;

ALTER TABLE ZamowieniaUslugi
    DROP CONSTRAINT ZamowieniaUslugi_Rezerwacje;

ALTER TABLE ZamowieniaUslugi
    DROP CONSTRAINT ZamowieniaUslugi_Uslugi;

ALTER TABLE ZarobkiHistoria
    DROP CONSTRAINT ZarobkiHistoria_Pracownicy;

-- tables
DROP TABLE Hotel;

DROP TABLE Klienci;

DROP TABLE PokojObsluga;

DROP TABLE Pokoje;

DROP TABLE Pracownicy;

DROP TABLE Rezerwacje;

DROP TABLE Uslugi;

DROP TABLE ZamowieniaUslugi;

DROP TABLE ZarobkiHistoria;

-- End of file.

