# progetto-basi-dati
## Corso di Basi di Dati UNIKORE A.A. 2022/2023 - Progetto di fine semestre

### Database di una concessionaria d'auto

#### Caratteristiche del progetto
Creazione in SQL di tutte le tabelle e creazione di opportuni vincoli di integrità inter-referenziali, intra-referenziali e check.

Si devono prevedere inoltre le seguenti interrogazioni:
- 10 interrogazioni semplici su singola tabella;
- 6 interrogazioni con Join (con almeno tre di esse su più di due relazioni);
- 4 interrogazioni con operatori aggregati, di cui 2 con HAVING;
- 5 interrogazioni nidificate (almeno una che preveda binding e una che preveda due sotto-livelli);
- 2 interrogazioni che impieghino viste;
- 3 interrogazioni con operatori insiemistici.

#### Schema logico
- Impiegato(<ins>Matricola</ins>, Nome, Cognome, DataNascita, CF, Contratto, Stipendio, Sede, Categoria)
- Sede(<ins>NumSede</ins>, Comune, Provincia, Indirizzo)
- Manager(<ins>Impiegato</ins>, Incarico)
- Auto(<ins>NTelaio</ins>, Colore, KM, Venduta, Modello)
- Disponibilità(<ins>Auto</ins>, <ins>Sede</ins>)
- Modello(<ins>Nome</ins>, Marchio, Porte, Posti, PrezzoCons, Motore)
- Motore(<ins>Nome</ins>, Alimentazione, Trasmissione, Trazione, CV)
- Specializzazione(<ins>Impiegato</ins>, <ins>Motore</ins>)
- Riparazione(<ins>Impiegato</ins>, <ins>Auto</ins>, <ins>Data</ins>, <ins>Descrizione</ins>)
- Cliente(<ins>CodCliente</ins>, Nome, Cognome, DataNascita, CF)
- Vendita(<ins>Impiegato</ins>, <ins>Auto</ins>, <ins>Cliente</ins>, Data, Prezzo)
