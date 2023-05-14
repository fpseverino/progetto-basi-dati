-- 
--  definition.sql
--  progettoBasiDati
-- 
--  Created by F.P. Severino, R. G. Scolari and D. Campisi on 14/05/23.
-- 

CREATE DATABASE IF NOT EXISTS concessionaria;

CREATE TABLE IF NOT EXISTS Impiegato (
    Matricola INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Cognome VARCHAR(30) NOT NULL,
    DataNascita DATE NOT NULL,
    CF VARCHAR(16) NOT NULL,
    Contratto VARCHAR(30) NOT NULL,
    Stipendio INT NOT NULL,
    Sede INT NOT NULL,
    Categoria VARCHAR(30) NOT NULL,
    PRIMARY KEY (Matricola),
    FOREIGN KEY (Sede) REFERENCES Sede(NumSede)
);

CREATE TABLE IF NOT EXISTS Sede (
    NumSede INT NOT NULL AUTO_INCREMENT,
    Comune VARCHAR(30) NOT NULL,
    Provincia VARCHAR(2) NOT NULL,
    Indirizzo VARCHAR(30) NOT NULL,
    PRIMARY KEY (NumSede)
);

CREATE TABLE IF NOT EXISTS Manager (
    Impiegato INT NOT NULL,
    Incarico VARCHAR(30) NOT NULL,
    PRIMARY KEY (Impiegato),
    FOREIGN KEY (Impiegato) REFERENCES Impiegato(Matricola)
);

CREATE TRIGGER IF NOT EXISTS checkManager
BEFORE INSERT ON Manager
FOR EACH ROW
BEGIN
    IF (SELECT Categoria FROM Impiegato WHERE Matricola = NEW.Impiegato) <> "Manager" THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'L''impiegato non è un manager';
    END IF;
END;

CREATE TABLE IF NOT EXISTS Auto (
    NTelaio INT NOT NULL,
    Colore VARCHAR(30) NOT NULL,
    KM INT NOT NULL,
    Venduta BOOLEAN NOT NULL,
    Modello VARCHAR(30) NOT NULL,
    PRIMARY KEY (NTelaio),
    FOREIGN KEY (Modello) REFERENCES Modello(Nome)
);

CREATE TABLE IF NOT EXISTS Disponibilita (
    Auto INT NOT NULL,
    Sede INT NOT NULL,
    PRIMARY KEY (Auto, Sede),
    FOREIGN KEY (Auto) REFERENCES Auto(NTelaio),
    FOREIGN KEY (Sede) REFERENCES Sede(NumSede)
);

CREATE TRIGGER IF NOT EXISTS checkVenduta
BEFORE INSERT ON Disponibilita
FOR EACH ROW
BEGIN
    IF (SELECT Venduta FROM Auto WHERE NTelaio = NEW.Auto) <> 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'L''auto è già stata venduta';
    END IF;
END;

CREATE TABLE IF NOT EXISTS Modello (
    Nome VARCHAR(30) NOT NULL,
    Marchio VARCHAR(30) NOT NULL,
    Porte INT NOT NULL,
    Posti INT NOT NULL,
    PrezzoCons INT NOT NULL,
    Motore VARCHAR(30) NOT NULL,
    PRIMARY KEY (Nome),
    FOREIGN KEY (Motore) REFERENCES Motore(Nome)
);

CREATE TABLE IF NOT EXISTS Motore (
    Nome VARCHAR(30) NOT NULL,
    Alimentazione VARCHAR(30) NOT NULL,
    Trasmissione VARCHAR(30) NOT NULL,
    Trazione VARCHAR(30) NOT NULL,
    CV INT NOT NULL,
    PRIMARY KEY (Nome)
);

CREATE TABLE IF NOT EXISTS Specializzazione (
    Impiegato INT NOT NULL,
    Motore VARCHAR(30) NOT NULL,
    PRIMARY KEY (Impiegato, Motore),
    FOREIGN KEY (Impiegato) REFERENCES Impiegato(Matricola),
    FOREIGN KEY (Motore) REFERENCES Motore(Nome)
);

CREATE TRIGGER IF NOT EXISTS checkMeccanico
BEFORE INSERT ON Specializzazione
FOR EACH ROW
BEGIN
    IF (SELECT Categoria FROM Impiegato WHERE Matricola = NEW.Impiegato) <> "Meccanico" THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'L''impiegato non è un meccanico';
    END IF;
END;

CREATE TABLE IF NOT EXISTS Riparazione (
    Impiegato INT NOT NULL,
    Auto INT NOT NULL,
    Data DATE NOT NULL,
    Descrizione VARCHAR(30) NOT NULL,
    PRIMARY KEY (Impiegato, Auto, Data, Descrizione),
    FOREIGN KEY (Impiegato) REFERENCES Impiegato(Matricola),
    FOREIGN KEY (Auto) REFERENCES Auto(NTelaio)
);

CREATE TRIGGER IF NOT EXISTS checkRiparazione
BEFORE INSERT ON Riparazione
FOR EACH ROW
BEGIN
    IF (SELECT Categoria FROM Impiegato WHERE Matricola = NEW.Impiegato) <> "Meccanico" THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'L''impiegato non è un meccanico';
    END IF;
END;

CREATE TABLE IF NOT EXISTS Cliente (
    CodCliente INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Cognome VARCHAR(30) NOT NULL,
    DataNascita DATE NOT NULL,
    CF VARCHAR(16) NOT NULL,
    PRIMARY KEY (CodCliente)
);

CREATE TABLE IF NOT EXISTS Vendita (
    Impiegato INT NOT NULL,
    Auto INT NOT NULL,
    Cliente INT NOT NULL,
    Data DATE NOT NULL,
    Prezzo INT NOT NULL,
    PRIMARY KEY (Impiegato, Auto, Cliente, Data),
    FOREIGN KEY (Impiegato) REFERENCES Impiegato(Matricola),
    FOREIGN KEY (Auto) REFERENCES Auto(NTelaio),
    FOREIGN KEY (Cliente) REFERENCES Cliente(CodCliente)
);

CREATE TRIGGER IF NOT EXISTS checkVenditore
BEFORE INSERT ON Vendita
FOR EACH ROW
BEGIN
    IF (SELECT Categoria FROM Impiegato WHERE Matricola = NEW.Impiegato) <> "Venditore" THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'L''impiegato non è un venditore';
    END IF;
END;

CREATE TRIGGER IF NOT EXISTS checkVenduta
BEFORE INSERT ON Vendita
FOR EACH ROW
BEGIN
    IF (SELECT Venduta FROM Auto WHERE NTelaio = NEW.Auto) <> 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'L''auto non è disponibile';
    END IF;
END;