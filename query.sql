-- 
--  query.sql
--  progettoBasiDati
-- 
--  Created by F.P. Severino, R. G. Scolari and D. Campisi on 14/05/23.
-- 

-- 1.	Impiegati che hanno acquistato una macchina
-- 2.	Venditori/Meccanici/Contabili sottoposti di un Manager specifico
-- 3.	Quali meccanici possono lavorare sulla macchina del cliente X
-- 4.	Quante macchine ha venduto il venditore X
-- 5.	Chi ha venduto le macchine a cui ha lavorato il meccanico X
-- 6.	Auto vendute nella sede X


USE concessionaria_db;

-- 10 interrogazioni semplici su singola tabella;

SELECT Nome
FROM Motore
WHERE CV > 199;

SELECT Nome
FROM Modello
WHERE Porte < 5;

SELECT CF
FROM Impiegato
WHERE Contratto = 'Determinato';

SELECT Modello
FROM Auto
WHERE KM = 0;

SELECT Data
FROM Riparazione
WHERE Descrizione = 'Cambio olio';

SELECT Data
FROM Vendita
WHERE Prezzo > 100000;

SELECT Modello
FROM Auto
WHERE Colore = 'Rosso' AND Venduta = 0;

SELECT Nome, Cognome
FROM Impiegato
WHERE Categoria = 'Contabile';

SELECT Indirizzo
FROM Sede
WHERE Provincia = 'MI';

SELECT DataNascita
FROM Impiegato
WHERE Stipendio > 2000;