-- 
--  manipulation.sql
--  progettoBasiDati
-- 
--  Created by F.P. Severino, R. G. Scolari and D. Campisi on 14/05/23.
-- 

USE concessionaria_db;

INSERT INTO Sede (Comune, Provincia, Indirizzo) VALUES
    ('Milano', 'MI', 'Piazza del Liberty 1'),
    ('Roma', 'RM', 'Via del Corso 181'),
    ('Napoli', 'NA', 'Via Alessandro Scarlatti 76'),
    ('Catania', 'CT', 'Via Etnea 50'),
    ('Palermo', 'PA', 'Via Notarbartolo 24');

INSERT INTO Impiegato (Nome, Cognome, DataNascita, CF, Contratto, Stipendio, Sede, Categoria) VALUES
    ('Mario', 'Rossi', '1980-01-01', 'RSSMRA80A01H501A', 'Indeterminato', 1700, 1, 'Venditore'),
    ('Giulia', 'Ferrari', '1992-08-12', 'FRRGLI92M52L219X', 'Indeterminato', 1700, 2, 'Venditore'),
    ('Andrea', 'Marino', '1987-06-05', 'MRNDRM87H05H501L', 'Indeterminato', 1700, 3, 'Venditore'),
    ('Francesco', 'Esposito', '1984-04-07', 'SPSFNC84D07H501B', 'Indeterminato', 1700, 4, 'Venditore'),
    ('Matteo', 'Giordano', '1990-09-25', 'GRDMTE90P25L219N', 'Indeterminato', 1700, 5, 'Venditore'),

    ('Valentina', 'Mancini', '1987-07-13', 'MCNVLN87L53H501S', 'Indeterminato', 3000, 1, 'Manager'),
    ('Simone', 'Romano', '1996-08-16', 'RMNSMN96M16H501U', 'Indeterminato', 2200, 2, 'Manager'),
    ('Alessandro', 'Ferrari', '1993-06-12', 'FRRLSN93H12L219A', 'Indeterminato', 3000, 3, 'Manager'),
    ('Martina', 'Conti', '1984-03-15', 'CNTMRT84C55H501D', 'Indeterminato', 2200, 4, 'Manager'),

    ('Chiara', 'Ferrari', '1992-05-13', 'FRRCRA92E13L219R', 'Determinato', 1600, 5, 'Meccanico'),
    ('Maurizio', 'Sostanco', '1986-11-07', 'SSTMRZ86L11A089T', 'Indeterminato', 1600, 1, 'Meccanico'),
    ('Damiano', 'Gentile', '2000-09-17', 'GNTDMN00P17B429B', 'Indeterminato', 1600, 2, 'Meccanico'),
    ('Pietro', 'Macafuso', '1999-08-08', 'MCFPTR99M08G273P', 'Indeterminato', 1600, 3, 'Meccanico'),
    ('Ciro', 'Esposito', '1991-01-10', 'SPSCRI91A10F839A', 'Indeterminato', 1600, 4, 'Meccanico'),

    ('Maura', 'Cavallo', '2000-04-09', 'CVLMRA00D49A944N', 'Indeterminato', 2000, 1, 'Contabile'),
    ('Germano', 'Cristiani', '1980-01-06', 'CRSGMN80A06C351Q', 'Determinato', 2000, 2, 'Contabile');

INSERT INTO Manager (Impiegato, Incarico) VALUES
    (6, 'Direttore'),
    (7, 'Capo Vendite'),
    (8, 'Gestore Sede'),
    (9, 'Vice Direttore');

INSERT INTO Motore (Nome, Alimentazione, Trasmissione, Trazione, CV) VALUES
    ('MultiJet 1.3', 'Diesel', 'Manuale', 'Anteriore', 95),         --Auto: FIAT Punto, FIAT Tipo
    ('FireFly 1.0', 'Benzina', 'Manuale', 'Anteriore', 120),        --Auto: FIAT Tipo, FIAT 500X
    ('MultiAir Turbo 1.4', 'Benzina', 'Manuale', 'Anteriore', 140), --Auto: Alfa Romeo Giulietta, Alfa Romeo MiTo
    ('S55', 'Benzina', 'Manuale', 'Posteriore', 450),               --Auto: BMW M3 e nella BMW M4.
    ('BMW eDrive', 'Ibrida', 'Automatica', 'Posteriore', 252),      --Auto: BMW 330e
    ('Mercedes EQC', 'Elettrica', 'Automatica', 'Integrale', 408);  --Auto: Mercedes EQC.

INSERT INTO Modello (Nome, Marchio, Porte, Posti, PrezzoCons, Motore) VALUES
    ('Punto', 'Fiat', 5, 5, 10000, 'MultiJet 1.3'),
    ('500X', 'Fiat', 5, 5, 28700, 'FireFly 1.0'),
    ('M3', 'BMW', 3, 4, 105000, 'S55');

--SEGNALIBRO DENNY

INSERT INTO Auto VALUES (1, 'Bianco', 1000, FALSE, 'Panda');
INSERT INTO Auto VALUES (2, 'Nero', 1000, FALSE, 'Panda');
INSERT INTO Auto VALUES (3, 'Rosso', 1000, FALSE, 'Panda');

INSERT INTO Disponibilita VALUES (1, 1);
INSERT INTO Disponibilita VALUES (2, 1);
INSERT INTO Disponibilita VALUES (3, 1);

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