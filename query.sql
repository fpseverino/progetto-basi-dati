-- 
--  query.sql
--  progettoBasiDati
-- 
--  Created by F.P. Severino, R. G. Scolari and D. Campisi on 14/05/23.
-- 

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
WHERE KM <> 0;

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

-- 6 interrogazioni con Join (con almeno tre di esse su più di due relazioni);

SELECT Nome, Cognome
FROM Impiegato JOIN Manager ON Impiegato.Matricola = Manager.Impiegato
WHERE Incarico = 'Direttore';

SELECT Nome, Cognome, Categoria
FROM Impiegato JOIN Sede ON Impiegato.Sede = Sede.NumSede
WHERE Comune = 'Milano';

SELECT DISTINCT Nome, Cognome
FROM Impiegato JOIN Vendita ON Impiegato.Matricola = Vendita.Venditore
WHERE Prezzo > 100000;

SELECT Motore.Nome
FROM Motore 
JOIN Modello ON Motore.Nome = Modello.Motore
JOIN Auto ON Modello.Nome = Auto.Modello
WHERE Auto.Colore = 'Rosso Metallizzato';

SELECT Impiegato.Nome, Impiegato.Cognome
FROM Impiegato
JOIN Specializzazione ON Impiegato.Matricola = Specializzazione.Impiegato
JOIN Motore ON Specializzazione.Motore = Motore.Nome
JOIN Modello ON Motore.Nome = Modello.Motore
JOIN Auto ON Modello.Nome = Auto.Modello
JOIN Vendita ON Auto.NTelaio = Vendita.Auto
JOIN Cliente ON Vendita.Cliente = Cliente.CodCliente
WHERE Cliente.Nome = 'Laura' AND Cliente.Cognome = 'Bianchi';

SELECT Impiegato.Nome, Impiegato.Cognome, Manager.Incarico, Sede.Comune, Sede.NumSede
FROM Manager
JOIN Impiegato ON Manager.Impiegato = Impiegato.Matricola
RIGHT JOIN Sede ON Impiegato.Sede = Sede.NumSede;

-- 4 interrogazioni con operatori aggregati, di cui 2 con HAVING;

SELECT Marchio, MAX(PrezzoCons) AS PrezzoConsMassimo
FROM Modello
GROUP BY Marchio
HAVING PrezzoMassimo > 100000;

SELECT SUM(Prezzo) AS Ricavi2023
FROM Vendita
WHERE Data >= '2023-01-01';

SELECT Categoria, AVG(Stipendio) AS StipendioMedioSopra2000
FROM Impiegato
GROUP BY Categoria
HAVING StipendioMedio >= 2000;

SELECT COUNT(*) AS NumMotoriBenzina
FROM Motore
WHERE Alimentazione = 'Benzina';

-- 5 interrogazioni nidificate (almeno una che preveda binding e una che preveda due sotto-livelli);

-- 2 interrogazioni che impieghino viste;

CREATE OR REPLACE VIEW SedeVenditori AS
SELECT Impiegato.Nome, Impiegato.Cognome, Sede.Comune
FROM Impiegato JOIN Sede ON Impiegato.Sede = Sede.NumSede
WHERE Impiegato.Categoria = 'Venditore';

SELECT * FROM SedeVenditori;

CREATE OR REPLACE VIEW ModelliSopraMedia AS
SELECT Modello.Nome, Modello.Marchio, Modello.PrezzoCons
FROM Modello
WHERE Modello.PrezzoCons > (SELECT AVG(PrezzoCons) FROM Modello);

SELECT * FROM ModelliSopraMedia;

-- 3 interrogazioni con operatori insiemistici.

SELECT Nome, Cognome
FROM Impiegato
    INTERSECT
SELECT Nome, Cognome
FROM Cliente;

SELECT NTelaio
FROM Auto
    EXCEPT
SELECT Auto
FROM Riparazione;