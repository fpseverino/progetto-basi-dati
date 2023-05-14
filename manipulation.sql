-- 
--  manipulation.sql
--  progettoBasiDati
-- 
--  Created by F.P. Severino, R. G. Scolari and D. Campisi on 14/05/23.
-- 

USE concessionaria;

INSERT INTO Sede VALUES (1, 'Milano', 'MI', 'Via Milano 1');
INSERT INTO Sede VALUES (2, 'Roma', 'RM', 'Via Roma 1');
INSERT INTO Sede VALUES (3, 'Torino', 'TO', 'Via Torino 1');
INSERT INTO Sede VALUES (4, 'Napoli', 'NA', 'Via Napoli 1');
INSERT INTO Sede VALUES (5, 'Palermo', 'PA', 'Via Palermo 1');

INSERT INTO Impiegato VALUES (1, 'Mario', 'Rossi', '1980-01-01', 'RSSMRA80A01H501A', 'Indeterminato', 2000, 1, 'Venditore');
INSERT INTO Impiegato VALUES (2, 'Luigi', 'Verdi', '1980-01-01', 'VRDLGU80A01H501A', 'Indeterminato', 2000, 2, 'Venditore');
INSERT INTO Impiegato VALUES (3, 'Giovanni', 'Bianchi', '1980-01-01', 'BNCGVN80A01H501A', 'Indeterminato', 2000, 3, 'Venditore');
INSERT INTO Impiegato VALUES (4, 'Paolo', 'Neri', '1980-01-01', 'NRIPLO80A01H501A', 'Indeterminato', 2000, 4, 'Manager');
INSERT INTO Impiegato VALUES (5, 'Marco', 'Gialli', '1980-01-01', 'GLLMRC80A01H501A', 'Indeterminato', 2000, 5, 'Manager');
INSERT INTO Impiegato VALUES (6, 'Giuseppe', 'Verdi', '1980-01-01', 'VRDGSPP80A01H501A', 'Indeterminato', 2000, 1, 'Meccanico');
INSERT INTO Impiegato VALUES (7, 'Antonio', 'Bianchi', '1980-01-01', 'BNCTNN80A01H501A', 'Indeterminato', 2000, 2, 'Meccanico');
INSERT INTO Impiegato VALUES (8, 'Francesco', 'Neri', '1980-01-01', 'NRIFRN80A01H501A', 'Indeterminato', 2000, 3, 'Meccanico');
INSERT INTO Impiegato VALUES (9, 'Giorgio', 'Verdi', '1980-01-01', 'VRDGRG80A01H501A', 'Indeterminato', 2000, 1, 'Contabile');
INSERT INTO Impiegato VALUES (10, 'Aldo', 'Bianchi', '1980-01-01', 'BNCLDA80A01H501A', 'Indeterminato', 2000, 2, 'Contabile');

INSERT INTO Manager VALUES (4, 'CEO');
INSERT INTO Manager VALUES (5, 'CFO');

INSERT INTO Auto VALUES (1, 'Bianco', 1000, FALSE, 'Panda');
INSERT INTO Auto VALUES (2, 'Nero', 1000, FALSE, 'Panda');
INSERT INTO Auto VALUES (3, 'Rosso', 1000, FALSE, 'Panda');

INSERT INTO Disponibilita VALUES (1, 1);
INSERT INTO Disponibilita VALUES (2, 1);
INSERT INTO Disponibilita VALUES (3, 1);

INSERT INTO Modello VALUES ('Panda', 'Fiat', 5, 5, 10000, '1.2');
INSERT INTO Modello VALUES ('Panda', 'Fiat', 5, 5, 10000, '1.3');
INSERT INTO Modello VALUES ('Panda', 'Fiat', 5, 5, 10000, '1.4');

INSERT INTO Motore VALUES ('1.2', 'Benzina', 'Manuale', 'Anteriore', 60);
INSERT INTO Motore VALUES ('1.3', 'Benzina', 'Manuale', 'Anteriore', 70);
INSERT INTO Motore VALUES ('1.4', 'Benzina', 'Manuale', 'Anteriore', 80);

INSERT INTO Specializzazione VALUES (6, '1.2');
INSERT INTO Specializzazione VALUES (7, '1.3');
INSERT INTO Specializzazione VALUES (8, '1.4');

INSERT INTO Riparazione VALUES (6, 1, '2019-01-01', 'Riparazione 1');
INSERT INTO Riparazione VALUES (7, 1, '2019-01-01', 'Riparazione 2');
INSERT INTO Riparazione VALUES (8, 1, '2019-01-01', 'Riparazione 3');

INSERT INTO Cliente VALUES (1, 'Mario', 'Rossi', '1980-01-01', 'RSSMRA80A01H501A');
INSERT INTO Cliente VALUES (2, 'Luigi', 'Verdi', '1980-01-01', 'VRDLGU80A01H501A');
INSERT INTO Cliente VALUES (3, 'Giovanni', 'Bianchi', '1980-01-01', 'BNCGVN80A01H501A');

INSERT INTO Vendita VALUES (1, 1, 1, '2019-01-01', 10000);
INSERT INTO Vendita VALUES (2, 2, 2, '2019-01-01', 10000);
INSERT INTO Vendita VALUES (3, 3, 3, '2019-01-01', 10000);