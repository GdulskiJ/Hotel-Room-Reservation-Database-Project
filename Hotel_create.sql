-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-12-25 23:22:31.078

-- tables
-- Table: Hotel
CREATE TABLE Hotel (
    IdHotelu integer  NOT NULL,
    Miasto varchar(20)  NOT NULL,
    Adres varchar(20)  NOT NULL,
    CONSTRAINT Hotel_pk PRIMARY KEY (IdHotelu)
) ;

-- Table: Klienci
CREATE TABLE Klienci (
    IdKlienta integer  NOT NULL,
    Numertelefonu varchar(15)  NOT NULL,
    Imie varchar(20)  NOT NULL,
    Nazwisko varchar(20)  NOT NULL,
    CONSTRAINT Klienci_pk PRIMARY KEY (IdKlienta)
) ;

-- Table: PokojObsluga
CREATE TABLE PokojObsluga (
    Pokoje_IdPokoju integer  NOT NULL,
    Pracownicy_IdPracownika integer  NOT NULL,
    Datasprzatania date  NOT NULL,
    CONSTRAINT PokojObsluga_pk PRIMARY KEY (Pokoje_IdPokoju,Pracownicy_IdPracownika,Datasprzatania)
) ;

-- Table: Pokoje
CREATE TABLE Pokoje (
    IdPokoju integer  NOT NULL,
    Hotel_IdHotelu integer  NOT NULL,
    Numerpokoju integer  NOT NULL,
    Numerpietra integer  NOT NULL,
    Standard varchar(20)  NOT NULL,
    Cena integer  NOT NULL,
    CONSTRAINT Pokoje_pk PRIMARY KEY (IdPokoju)
) ;

-- Table: Pracownicy
CREATE TABLE Pracownicy (
    IdPracownika integer  NOT NULL,
    Numertelefonu varchar(15)  NOT NULL,
    Imie varchar(20)  NOT NULL,
    Nazwisko varchar(20)  NOT NULL,
    Datarozpoczeciapracy date  NOT NULL,
    CONSTRAINT Pracownicy_pk PRIMARY KEY (IdPracownika)
) ;

-- Table: Rezerwacje
CREATE TABLE Rezerwacje (
    IdRezerwacje integer  NOT NULL,
    Klienci_IdKlienta integer  NOT NULL,
    Datarezerwacji date  NOT NULL,
    DataPrzyjazdu date  NOT NULL,
    DataOdjazdu date  NOT NULL,
    Pokoje_IdPokoju integer  NOT NULL,
    Zaplacona integer  NOT NULL,
    CONSTRAINT Rezerwacje_ak_1 UNIQUE (Pokoje_IdPokoju, DataPrzyjazdu),
    CONSTRAINT Rezerwacje_pk PRIMARY KEY (IdRezerwacje)
) ;

-- Table: Uslugi
CREATE TABLE Uslugi (
    IdUslugi integer  NOT NULL,
    cena NUMERIC(6,2)  NOT NULL,
    CONSTRAINT Uslugi_pk PRIMARY KEY (IdUslugi)
) ;

-- Table: ZamowieniaUslugi
CREATE TABLE ZamowieniaUslugi (
    Uslugi_IdUslugi integer  NOT NULL,
    ilosc integer  NOT NULL,
    Rezerwacje_IdRezerwacje integer  NOT NULL,
    Pracownicy_IdPracownika integer  NOT NULL,
    CONSTRAINT ZamowieniaUslugi_pk PRIMARY KEY (Uslugi_IdUslugi)
) ;

-- Table: ZarobkiHistoria
CREATE TABLE ZarobkiHistoria (
    Pracownicy_IdPracownika integer  NOT NULL,
    Data_Od date  NOT NULL,
    Zatobki NUMERIC(6,2)  NOT NULL,
    CONSTRAINT ZarobkiHistoria_pk PRIMARY KEY (Data_Od,Pracownicy_IdPracownika)
) ;

-- foreign keys
-- Reference: PokojObsluzi_Pracownicy (table: PokojObsluga)
ALTER TABLE PokojObsluga ADD CONSTRAINT PokojObsluzi_Pracownicy
    FOREIGN KEY (Pracownicy_IdPracownika)
    REFERENCES Pracownicy (IdPracownika);

-- Reference: Pokoje (table: PokojObsluga)
ALTER TABLE PokojObsluga ADD CONSTRAINT Pokoje
    FOREIGN KEY (Pokoje_IdPokoju)
    REFERENCES Pokoje (IdPokoju);

-- Reference: Pokoje_Hotel (table: Pokoje)
ALTER TABLE Pokoje ADD CONSTRAINT Pokoje_Hotel
    FOREIGN KEY (Hotel_IdHotelu)
    REFERENCES Hotel (IdHotelu);

-- Reference: Rezerwacje_Klienci (table: Rezerwacje)
ALTER TABLE Rezerwacje ADD CONSTRAINT Rezerwacje_Klienci
    FOREIGN KEY (Klienci_IdKlienta)
    REFERENCES Klienci (IdKlienta);

-- Reference: Rezerwacje_Pokoje (table: Rezerwacje)
ALTER TABLE Rezerwacje ADD CONSTRAINT Rezerwacje_Pokoje
    FOREIGN KEY (Pokoje_IdPokoju)
    REFERENCES Pokoje (IdPokoju);

-- Reference: ZamowieniaUslugi_Pracownicy (table: ZamowieniaUslugi)
ALTER TABLE ZamowieniaUslugi ADD CONSTRAINT ZamowieniaUslugi_Pracownicy
    FOREIGN KEY (Pracownicy_IdPracownika)
    REFERENCES Pracownicy (IdPracownika);

-- Reference: ZamowieniaUslugi_Rezerwacje (table: ZamowieniaUslugi)
ALTER TABLE ZamowieniaUslugi ADD CONSTRAINT ZamowieniaUslugi_Rezerwacje
    FOREIGN KEY (Rezerwacje_IdRezerwacje)
    REFERENCES Rezerwacje (IdRezerwacje);

-- Reference: ZamowieniaUslugi_Uslugi (table: ZamowieniaUslugi)
ALTER TABLE ZamowieniaUslugi ADD CONSTRAINT ZamowieniaUslugi_Uslugi
    FOREIGN KEY (Uslugi_IdUslugi)
    REFERENCES Uslugi (IdUslugi);

-- Reference: ZarobkiHistoria_Pracownicy (table: ZarobkiHistoria)
ALTER TABLE ZarobkiHistoria ADD CONSTRAINT ZarobkiHistoria_Pracownicy
    FOREIGN KEY (Pracownicy_IdPracownika)
    REFERENCES Pracownicy (IdPracownika);

-- End of file.

