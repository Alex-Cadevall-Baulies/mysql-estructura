-- Nivell 1 / Exercici 1 - optica
CREATE DATABASE optica_cul_ampolla;

CREATE TABLE
    proveidor_optica (
        id_proveidor INTEGER NOT NULL AUTO_INCREMENT,
        nom_proveidor TEXT,
        adreça_proveidor TEXT,
        telefon_proveidor INTEGER,
        fax_proveidor INTEGER,
        nif_proveidor VARCHAR(9),
        PRIMARY KEY (id_proveidor)
    );

CREATE TABLE
    ulleres_optica (
        id_proveidor INTEGER NOT NULL,
        FOREIGN KEY (id_proveidor) REFERENCES proveidor_optica(id_proveidor),
        id_producte INTEGER NOT NULL AUTO_INCREMENT,
        marca_producte VARCHAR(500),
        graduacio_producte INTEGER,
        montura_producte VARCHAR(500),
        color_montura VARCHAR(500),
        color_vidre VARCHAR(500),
        preu_producte INTEGER,
        PRIMARY KEY (id_producte)
    );

CREATE TABLE
    client_optica (
        id_client INTEGER NOT NULL AUTO_INCREMENT,
        nom_client TEXT,
        data_registre DATE,
        adreça_client TEXT,
        telefon_client INTEGER,
        email_client TEXT,
        id_recomanat INTEGER,
        FOREIGN KEY (id_recomanat) REFERENCES client_optica(id_client),
        PRIMARY KEY (id_client)
    );

CREATE TABLE
    traballadors_optica (
        id_treballador INTEGER NOT NULL AUTO_INCREMENT,
        nom_trebalador VARCHAR(400),
        cognom_trebalador VARCHAR(1000),
        PRIMARY KEY (id_treballador)
    );

CREATE TABLE
    ventes_optica (
        id_venta INTEGER NOT NULL AUTO_INCREMENT,
        id_client INTEGER NOT NULL,
        FOREIGN KEY (id_client) REFERENCES client_optica(id_client),
        data_venta DATE,
        id_producte INTEGER NOT NULL,
        FOREIGN KEY (id_producte) REFERENCES ulleres_optica(id_producte),
        id_treballador INTEGER NOT NULL,
        FOREIGN KEY (id_treballador) REFERENCES traballadors_optica(id_treballador),
        PRIMARY KEY (id_venta)
    );

-- Inserts optica

-- Proveïdors
INSERT INTO proveidor_optica (nom_proveidor, adreça_proveidor, telefon_proveidor, nif_proveidor)
VALUES('Ulleres Manolo', 'Carrer Garrotxa 24', 654748229, 'D29896658');
INSERT INTO proveidor_optica (nom_proveidor, adreça_proveidor, fax_proveidor, nif_proveidor)
VALUES('Fasion View', 'Carrer LeDejun 19', 617328229, 'F56456658');

-- Ulleres
INSERT INTO ulleres_optica (id_proveidor, marca_producte, graduacio_producte, montura_producte, color_montura, color_vidre, preu_producte )
VALUES(1, 'ReiBhan', 1.75, 'flex', 'blava', 'reflectant', 130);
INSERT INTO ulleres_optica (id_proveidor, marca_producte, graduacio_producte, montura_producte, color_montura, color_vidre, preu_producte )
VALUES(1, 'Optifree', 2.75, 'rigid', 'verda', 'solid', 150);
INSERT INTO ulleres_optica (id_proveidor, marca_producte, graduacio_producte, montura_producte, color_montura, color_vidre, preu_producte )
VALUES(2, 'Riomve', 0.50, 'rigid', 'groga', 'solid', 90);

-- Clients
INSERT INTO client_optica (nom_client, data_registre, telefon_client, email_client)
VALUES('Leonardo LePractico', '2002-01-20', 665432212, 'TheRealLeo@gmail.com');
INSERT INTO client_optica (nom_client, data_registre, telefon_client, email_client, id_recomanat)
VALUES('Reenacida Gomez', '2012-01-20', 667652212, 'renata@gmail.com', 1);
INSERT INTO client_optica (nom_client, data_registre, telefon_client, email_client, id_recomanat)
VALUES('Patricia Gomez', '2015-01-20', 652352212, 'repatpatinson@gmail.com', 1);
INSERT INTO client_optica (nom_client, data_registre, telefon_client, email_client)
VALUES('Elenorcio Ricardiano', '2020-01-20', 652352212, 'glassexpert_89@gmail.com');

-- Treballadors
INSERT INTO traballadors_optica (nom_trebalador, cognom_trebalador)
VALUES('Maximilian', 'Gerundio Costelo');
INSERT INTO traballadors_optica (nom_trebalador, cognom_trebalador)
VALUES('Joselina', 'Morena Garcia');

-- Ventes
INSERT INTO ventes_optica (id_client, data_venta, id_producte, id_treballador )
VALUES(1, '2002-04-20', 1, 2);
INSERT INTO ventes_optica (id_client, data_venta, id_producte, id_treballador )
VALUES(1, '2012-04-20', 1, 2);
INSERT INTO ventes_optica (id_client, data_venta, id_producte, id_treballador )
VALUES(2, '2012-04-20', 1, 2);
INSERT INTO ventes_optica (id_client, data_venta, id_producte, id_treballador )
VALUES(3, '2015-05-20', 2, 1);
INSERT INTO ventes_optica (id_client, data_venta, id_producte, id_treballador )
VALUES(4, '2020-05-20', 3, 1);
INSERT INTO ventes_optica (id_client, data_venta, id_producte, id_treballador )
VALUES(1, '2020-05-20', 3, 1);
INSERT INTO ventes_optica (id_client, data_venta, id_producte, id_treballador )
VALUES(1, '2020-07-20', 3, 1);
INSERT INTO ventes_optica (id_client, data_venta, id_producte, id_treballador )
VALUES(1, '2020-12-19', 3, 1);

-- Queries Optica

-- 1. Llista el total de factures d'un client/a en un període determinat.
SELECT c.id_client, c.nom_client, v.* FROM client_optica AS c INNER JOIN ventes_optica AS v ON c.id_client = v.id_client WHERE c.id_client = 1 AND v.data_venta LIKE '2020%';
-- 2. Llista els diferents models d'ulleres que ha venut un empleat/da durant un any.
SELECT t.*, v.id_producte, u.* FROM traballadors_optica AS t INNER JOIN ventes_optica AS v ON t.id_treballador = v.id_treballador INNER JOIN ulleres_optica AS u ON u.id_producte = v.id_producte WHERE t.id_treballador = 1;
-- 3. Llista els diferents proveïdors que han subministrat ulleres venudes amb exit per l'optica.
SELECT p.nom_proveidor, u.id_producte, v.id_venta, v.data_venta FROM proveidor_optica AS p INNER JOIN ulleres_optica AS u ON p.id_proveidor = u.id_proveidor INNER JOIN ventes_optica AS v ON u.id_producte = v.id_producte;

