-- 
--  definition.sql
--  progettoBasiDati
-- 
--  Created by F.P. Severino, R. G. Scolari and D. Campisi on 14/05/23.
-- 

CREATE DATABASE IF NOT EXISTS concessionaria_db;

USE concessionaria_db;

CREATE TABLE IF NOT EXISTS Sede (
    NumSede INT NOT NULL AUTO_INCREMENT,
    Comune VARCHAR(30) NOT NULL,
    Provincia VARCHAR(2) NOT NULL,
    Indirizzo VARCHAR(30) NOT NULL,
    PRIMARY KEY (NumSede)
);

CREATE TABLE IF NOT EXISTS Impiegato (
    Matricola INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Cognome VARCHAR(30) NOT NULL,
    DataNascita DATE NOT NULL,
    CF VARCHAR(16) NOT NULL UNIQUE,
    Contratto ENUM('Determinato', 'Indeterminato') NOT NULL,
    Stipendio INT NOT NULL,
    Sede INT,
    Categoria ENUM('Venditore', 'Manager', 'Meccanico', 'Contabile') NOT NULL, -- enum non necessario, ma rispetta il modello
    CHECK (LENGTH(CF) = 16),
    CHECK (Contratto IN ('Determinato', 'Indeterminato')),
    CHECK (Stipendio > 0),
    CHECK (Categoria IN ('Venditore', 'Manager', 'Meccanico', 'Contabile')),
    PRIMARY KEY (Matricola),
    FOREIGN KEY (Sede) REFERENCES Sede(NumSede) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS Manager (
    Impiegato INT NOT NULL,
    Incarico VARCHAR(30) NOT NULL,
    PRIMARY KEY (Impiegato),
    FOREIGN KEY (Impiegato) REFERENCES Impiegato(Matricola) ON DELETE CASCADE
);

DELIMITER //

CREATE TRIGGER IF NOT EXISTS checkManager
BEFORE INSERT ON Manager
FOR EACH ROW
BEGIN
    IF (SELECT Categoria FROM Impiegato WHERE Matricola = NEW.Impiegato) <> 'Manager' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Lo impiegato non è un manager';
    END IF;
END //

DELIMITER ;

CREATE TABLE IF NOT EXISTS Motore (
    Nome VARCHAR(30) NOT NULL,
    Alimentazione ENUM('Diesel', 'Benzina', 'GPL', 'Ibrida', 'Elettrica') NOT NULL,
    Trasmissione ENUM('Manuale', 'Automatica') NOT NULL,
    Trazione ENUM('Anteriore', 'Posteriore', 'Integrale') NOT NULL,
    CV INT NOT NULL,
    CHECK (Alimentazione IN ('Diesel', 'Benzina', 'GPL', 'Ibrida', 'Elettrica')),
    CHECK (Trasmissione IN ('Manuale', 'Automatica')),
    CHECK (Trazione IN ('Anteriore', 'Posteriore', 'Integrale')),
    CHECK (CV > 0),
    PRIMARY KEY (Nome)
);

CREATE TABLE IF NOT EXISTS Modello (
    Nome VARCHAR(40) NOT NULL,
    Marchio VARCHAR(40) NOT NULL,
    Porte INT NOT NULL,
    Posti INT NOT NULL,
    PrezzoCons INT NOT NULL,
    Motore VARCHAR(30) NOT NULL,
    CHECK (Porte > 0),
    CHECK (Posti > 0),
    CHECK (PrezzoCons > 0),
    PRIMARY KEY (Nome),
    FOREIGN KEY (Motore) REFERENCES Motore(Nome) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Auto (
    NTelaio VARCHAR(17) NOT NULL,
    Colore VARCHAR(30) NOT NULL,
    KM INT NOT NULL,
    Venduta BOOLEAN NOT NULL,
    Modello VARCHAR(40),
    CHECK (LENGTH(NTelaio) = 17),
    CHECK (KM >= 0),
    PRIMARY KEY (NTelaio),
    FOREIGN KEY (Modello) REFERENCES Modello(Nome) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS Disponibilita (
    Auto VARCHAR(17) NOT NULL,
    Sede INT NOT NULL,
    PRIMARY KEY (Auto, Sede),
    FOREIGN KEY (Auto) REFERENCES Auto(NTelaio) ON DELETE CASCADE,
    FOREIGN KEY (Sede) REFERENCES Sede(NumSede) ON DELETE CASCADE
);

DELIMITER //

CREATE TRIGGER IF NOT EXISTS checkDisponibilita
BEFORE INSERT ON Disponibilita
FOR EACH ROW
BEGIN
    IF (SELECT Venduta FROM Auto WHERE NTelaio = NEW.Auto) <> 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La auto è già stata venduta';
    END IF;
END //

DELIMITER ;

CREATE TABLE IF NOT EXISTS Specializzazione (
    Impiegato INT NOT NULL,
    Motore VARCHAR(30) NOT NULL,
    PRIMARY KEY (Impiegato, Motore),
    FOREIGN KEY (Impiegato) REFERENCES Impiegato(Matricola) ON DELETE CASCADE,
    FOREIGN KEY (Motore) REFERENCES Motore(Nome) ON DELETE CASCADE
);

DELIMITER //

CREATE TRIGGER IF NOT EXISTS checkMeccanico
BEFORE INSERT ON Specializzazione
FOR EACH ROW
BEGIN
    IF (SELECT Categoria FROM Impiegato WHERE Matricola = NEW.Impiegato) <> 'Meccanico' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Lo impiegato non è un meccanico';
    END IF;
END //

DELIMITER ;

CREATE TABLE IF NOT EXISTS Riparazione (
    Impiegato INT NOT NULL,
    Auto VARCHAR(17) NOT NULL,
    Data DATE NOT NULL,
    Descrizione VARCHAR(120) NOT NULL,
    PRIMARY KEY (Impiegato, Auto, Data, Descrizione),
    FOREIGN KEY (Impiegato) REFERENCES Impiegato(Matricola),
    FOREIGN KEY (Auto) REFERENCES Auto(NTelaio)
);

DELIMITER //

CREATE TRIGGER IF NOT EXISTS checkRiparazione
BEFORE INSERT ON Riparazione
FOR EACH ROW
BEGIN
    IF (SELECT Categoria FROM Impiegato WHERE Matricola = NEW.Impiegato) <> 'Meccanico' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Lo impiegato non è un meccanico';
    END IF;
END //

DELIMITER ;

CREATE TABLE IF NOT EXISTS Cliente (
    CodCliente INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Cognome VARCHAR(30) NOT NULL,
    DataNascita DATE NOT NULL,
    CF VARCHAR(16) NOT NULL UNIQUE,
    PRIMARY KEY (CodCliente)
);

CREATE TABLE IF NOT EXISTS Vendita (
    Impiegato INT NOT NULL,
    Auto VARCHAR(17) NOT NULL,
    Cliente INT NOT NULL,
    Data DATE NOT NULL,
    Prezzo INT NOT NULL,
    PRIMARY KEY (Impiegato, Auto, Cliente, Data),
    FOREIGN KEY (Impiegato) REFERENCES Impiegato(Matricola),
    FOREIGN KEY (Auto) REFERENCES Auto(NTelaio),
    FOREIGN KEY (Cliente) REFERENCES Cliente(CodCliente)
);

DELIMITER //

CREATE TRIGGER IF NOT EXISTS checkVenditore
BEFORE INSERT ON Vendita
FOR EACH ROW
BEGIN
    IF (SELECT Categoria FROM Impiegato WHERE Matricola = NEW.Impiegato) <> 'Venditore' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Lo impiegato non è un venditore';
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER IF NOT EXISTS checkVenduta
BEFORE INSERT ON Vendita
FOR EACH ROW
BEGIN
    IF (SELECT Venduta FROM Auto WHERE NTelaio = NEW.Auto) <> 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La auto non è disponibile';
    END IF;
END //

DELIMITER ;
