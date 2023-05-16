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
    ('Carlo', 'Cracco', '1992-08-11', 'CRCCRL92M11E491S', 'Indeterminato', 1600, 3, 'Meccanico'), 
    ('Mimmo', 'Calafiore', '1991-04-10', 'CLFMMO91D10F205Y', 'Determinato', 1600, 5, 'Meccanico'),     
    ('Maura', 'Cavallo', '2000-04-09', 'CVLMRA00D49A944N', 'Indeterminato', 2000, 1, 'Contabile'),
    ('Germano', 'Cristiani', '1980-01-06', 'CRSGMN80A06C351Q', 'Determinato', 2000, 2, 'Contabile');

INSERT INTO Manager (Impiegato, Incarico) VALUES
    (6, 'Direttore'),
    (7, 'Capo Vendite'),
    (8, 'Gestore Sede'),
    (9, 'Vice Direttore');

INSERT INTO Motore (Nome, Alimentazione, Trasmissione, Trazione, CV) VALUES
    ('BMW B38', 'Benzina', 'Manuale', 'Anteriore', 109),          
    ('BMW B47', 'Diesel', 'Manuale', 'Posteriore', 190),           
    ('BMW B48', 'Ibrida', 'Automatico', 'Integrale', 292),        
    ('BMW S58', 'Benzina', 'Manuale', 'Posteriore', 510),         
    ('BMW S63', 'Benzina', 'Manuale', 'Posteriore', 625),        
    ('Porsche 9A2', 'Benzina', 'Automatico', 'Posteriore', 385),   
    ('Porsche PDK', 'Benzina', 'Automatico', 'Posteriore', 330),   
    ('TSI 1.0', 'Benzina', 'Manuale', 'Anteriore', 95), 
    ('TSI 2.0', 'Benzina', 'Automatico', 'Anteriore', 207),  
    ('TDI 2.0', 'Diesel', 'Manuale', 'Anteriore', 150),   
    ('TDI SCR 2.0', 'Diesel', 'Automatico', 'Integrale', 200),  
    ('TFSI 1.5', 'Benzina', 'Automatico', 'Anteriore', 116),   
    ('TDI 3.0', 'Diesel', 'Automatico', 'Integrale', 400),  
    ('50 Quattro', 'Ibrida', 'Automatico', 'Integrale', 340); 

INSERT INTO Modello (Nome, Marchio, Porte, Posti, PrezzoCons, Motore) VALUES
    ('Serie 1 (118i)', 'BMW', 5, 5, 31300, 'BMW B38'),
    ('Serie 3 (320d)', 'BMW', 5, 5, 46400, 'BMW B47'),
    ('Serie 3 (330e xDrive)', 'BMW', 5, 5, 54840, 'BMW B48'),
    ('M3 (Competition)', 'BMW', 3, 5, 109000, 'BMW S58'),
    ('M5 (Competition)', 'BMW', 5, 5, 147250, 'BMW S63'),
    ('911 (Carrera)', 'Porsche', 3, 4, 127420, 'Porsche 9A2'),
    ('Panamera', 'Porsche', 5, 5, 101890, 'Porsche PDK'),
    ('Polo', 'Volkswagen', 5, 5, 23000, 'TSI 1.0'),
    ('Polo GTI', 'Volkswagen', 5, 5, 32000, 'TSI 2.0'),
    ('Golf (8)', 'Volkswagen', 5, 5, 33100, 'TDI 2.0'),
    ('Passat (Variant)', 'Volkswagen', 5, 5, 53000, 'TDI SCR 2.0'),
    ('A3', 'Audi', 5, 5, 30500, 'TFSI 1.5'),
    ('RS4', 'Audi', 5, 5, 99000, 'TDI 3.0'),
    ('Q8 (E-TRON)', 'Audi', 5, 5, 81600, '50 Quattro');    


INSERT INTO Auto (NTelaio, Colore, KM, Venduta, Modello) VALUES 
    (1, 'Blu Opaco', 0, FALSE, 'Serie 1 (118i)'),
    (2, 'Blu Opaco', 0, FALSE, 'Serie 1 (118i)'),
    (3, 'Nero Pastello', 0, FALSE, 'Serie 3 (320d)'),
    (4, 'Nero Pastello', 0, FALSE, 'Serie 3 (320d)'),
    (5, 'Nero Pastello', 13000, FALSE, 'Serie 3 (320d)'),
    (6, 'Grigio Metallizzato', 5000, TRUE, 'Serie 3 (330e xDrive)'),
    (7, 'Rosso Metallizzato', 0, FALSE, 'Serie 3 (330e xDrive)'),
    (8, 'Verde Metallizzato', 0, TRUE, 'M3 (Competition)'),
    (9, 'Nero Opaco', 0, FALSE, 'M5 (Competition)'),
    (10, 'Nero Metallizzato', 0, TRUE, '911 (Carrera)'),
    (11, 'Rosso Metallizzato', 0, TRUE, '911 (Carrera)'),
    (12, 'Nero Metallizzato', 50000, FALSE, 'Panamera'),
    (13, 'Bianco perla', 13000, FALSE, 'Polo'),
    (14, 'Rosso Metallizzato', 0, FALSE, 'Polo GTI'),
    (15, 'Nero Opaco', 0, FALSE, 'Golf (8)'),
    (16, 'Grigio scuro Metallizzato', 9000, FALSE, 'Golf (8)'),
    (17, 'Grigio scuro Metallizzato', 0, TRUE, 'Golf (8)'),
    (18, 'Blu Acquamarina', 0, TRUE, 'Passat (Variant)'),    
    (19, 'Grigio Metallizzato', 40000, FALSE, 'A3'),
    (20, 'Nero Opaco', 0, FALSE, 'A3'),
    (21, 'Nero Opaco', 0, FALSE, 'A3'),
    (22, 'Nero Opaco', 0, FALSE, 'A3'),
    (23, 'Nero Lucido', 0, FALSE, 'RS4'),
    (24, 'Bianco Panna', 0, FALSE, 'Q8 (E-TRON)'),
    (25, 'Bianco Perla', 0, FALSE, 'Serie 3 (320d)'),
    (26, 'Blu Metallizzato', 0, FALSE, 'Serie 3 (320d)'),
    (27, 'Nero Lucido', 0, FALSE, 'M5 (Competition)'),    
    (28, 'Rosso Lucido', 5000, FALSE, 'Polo'),
    (29, 'Viola Metallizzato', 0, FALSE, 'Polo'),
    (30, 'Viola Metallizzato', 1000, FALSE, 'Polo'),
    (31, 'Giallo Racing', 0, FALSE, 'Golf (8)'),
    (32, 'Nero Lucido', 10000, FALSE, 'Passat (Variant)'),
    (33, 'Celeste Pastello', 0, FALSE, 'RS4'),   
    (34, 'Blu Perlato', 23000, TRUE, 'Golf (8)'),
    (35, 'Rosa Pastello', 0, TRUE, 'RS4');   

INSERT INTO Disponibilita (Auto, Sede) VALUES 
    (1, 1), 
    (2, 1),
    (3, 1), 
    (4, 1),
    (5, 1), 
    (7, 1),
    (9, 1), 
    (12, 2),
    (13, 3),
    (14, 3), 
    (15, 3),
    (16, 3),
    (19, 2),
    (20, 4),
    (21, 4), 
    (22, 4),
    (23, 5),
    (24, 5),
    (25, 5),
    (26, 5), 
    (27, 5),
    (28, 5),           
    (29, 4), 
    (30, 4),
    (31, 2),   
    (32, 2),
    (33, 2);   


INSERT INTO Specializzazione (Impiegato, Motore) VALUES 
    (10, 'BMW B47'),  
    (10, 'BMW S63'),  
    (10, 'TSI 1.0'),  
    (10, 'Porsche 9A2'),  
    (11, 'BMW B38'),
    (11, 'BMW B47'),  
    (11, 'BMW B48'),
    (11, 'BMW S58'),        
    (11, 'BMW S63'),
    (12, 'Porsche PDK'),    
    (12, 'TFSI 1.5'),    
    (12, 'TDI 2.0'), 
    (12, 'TDI 3.0'),        
    (12, 'TDI SCR 2.0'),   
    (13, 'TSI 1.0'),   
    (13, 'TSI 2.0'),
    (13, 'TDI 2.0'),
    (13, 'TDI SCR 2.0'),
    (13, '50 Quattro'),  
    (14, 'TSI 1.0'), 
    (14, 'TDI 2.0'),
    (14, 'TFSI 1.5'),   
    (14, 'TDI 3.0'),   
    (15, 'TDI 2.0'),  
    (15, 'BMW S58'),        
    (15, 'BMW S63'),
    (16, 'TSI 1.0'),
    (16, 'TDI 3.0'),    
    (16, '50 Quattro');   

INSERT INTO Riparazione (Impiegato, Auto, Data, Descrizione) VALUES 
    (10, 28, '2022-01-20', 'Cambio olio'),
    (11, 5, '2022-02-18', 'Tagliando completo'),
    (12, 19, '2022-03-03', 'Cambio gomme'),
    (13, 16, '2023-01-22', 'Cambio specchietto destro'),
    (13, 13, '2023-04-12', 'Pulizia iniettori');              

INSERT INTO Cliente (Nome, Cognome, DataNascita, CF) VALUES 
    ('Laura', 'Bianchi', '1990-07-20', 'BNCLRA90L20B456C'),
    ('Federica', 'Gallo', '1991-04-02', 'GLLFDR91D02K654F'),
    ('Valentina', 'Barbieri', '1993-02-17', 'BRBVLN93B17R543L'),
    ('Matteo', 'De Luca', '1991-07-22', 'DLCMTT91L22K876W'),
    ('Roberto', 'Marini', '1992-12-03', 'MRNRTO92T03E543A'),
    ('Erika', 'Marchetti', '1986-07-07', 'MRCERK86L07Z987R'),
    ('Paolo', 'Ricci', '1993-05-02', 'RCCPLA93E02F234L'),
    ('Lucia', 'Millunzi', '1954-12-05', 'MLLZCI54T45E841L');    

INSERT INTO Vendita (Impiegato, Auto, Cliente, Data, Prezzo) VALUES 
    (1, 6, 1, '2021-06-11', 49800),
    (1, 8, 2, '2021-07-12', 109000),
    (2, 10, 3, '2021-08-16', 127420),
    (2, 11, 4, '2022-09-01', 127420),
    (3, 17, 5, '2022-10-20', 33100),
    (3, 18, 6, '2022-11-02', 53000),
    (4, 32, 7, '2023-02-04', 49000),
    (5, 33, 8, '2023-03-09', 99000);                        