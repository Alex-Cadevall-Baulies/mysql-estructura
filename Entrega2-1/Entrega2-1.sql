-- Nivell 1 / Exercici 1 - Òptica
CREATE DATABASE òptica_cul_ampolla;

CREATE TABLE
    proveidor_òptica (
        id_proveidor INTEGER NOT NULL AUTO_INCREMENT,
        nom_proveidor TEXT,
        adreça_proveidor TEXT,
        telèfon_proveidor INTEGER,
        fax_proveidor INTEGER,
        nif_proveidor VARCHAR(9),
        PRIMARY KEY (id_proveidor)
    );

CREATE TABLE
    ulleres_òptica (
        id_proveidor INTEGER NOT NULL,
        FOREIGN KEY (id_proveidor) REFERENCES proveidor_òptica(id_proveidor),
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
    client_òptica (
        id_client INTEGER NOT NULL AUTO_INCREMENT,
        nom_client TEXT,
        data_registre DATE,
        adreça_client TEXT,
        telèfon_client INTEGER,
        email_client TEXT,
        id_recomanat INTEGER,
        FOREIGN KEY (id_recomanat) REFERENCES client_òptica(id_client),
        PRIMARY KEY (id_client)
    );

CREATE TABLE
    traballadors_òptica (
        id_treballador INTEGER NOT NULL AUTO_INCREMENT,
        nom_trebalador VARCHAR(400),
        cognom_trebalador VARCHAR(1000),
        PRIMARY KEY (id_treballador)
    );

CREATE TABLE
    ventes_òptica (
        id_venta INTEGER NOT NULL AUTO_INCREMENT,
        id_client INTEGER NOT NULL,
        FOREIGN KEY (id_client) REFERENCES client_òptica(id_client),
        data_venta DATE,
        id_producte INTEGER NOT NULL,
        FOREIGN KEY (id_producte) REFERENCES ulleres_òptica(id_producte),
        id_treballador INTEGER NOT NULL,
        FOREIGN KEY (id_treballador) REFERENCES traballadors_òptica(id_treballador),
        PRIMARY KEY (id_venta)
    );

-- Inserts Òptica

-- Proveïdors
INSERT INTO proveidor_òptica (nom_proveidor, adreça_proveidor, telèfon_proveidor, nif_proveidor)
VALUES('Ulleres Manolo', 'Carrer Garrotxa 24', 654748229, 'D29896658');
INSERT INTO proveidor_òptica (nom_proveidor, adreça_proveidor, fax_proveidor, nif_proveidor)
VALUES('Fasion View', 'Carrer LeDejun 19', 617328229, 'F56456658');

-- Ulleres
INSERT INTO ulleres_òptica (id_proveidor, marca_producte, graduacio_producte, montura_producte, color_montura, color_vidre, preu_producte )
VALUES(1, 'ReiBhan', 1.75, 'flex', 'blava', 'reflectant', 130);
INSERT INTO ulleres_òptica (id_proveidor, marca_producte, graduacio_producte, montura_producte, color_montura, color_vidre, preu_producte )
VALUES(1, 'Optifree', 2.75, 'rigid', 'verda', 'solid', 150);
INSERT INTO ulleres_òptica (id_proveidor, marca_producte, graduacio_producte, montura_producte, color_montura, color_vidre, preu_producte )
VALUES(2, 'Riomve', 0.50, 'rigid', 'groga', 'solid', 90);

-- Clients
INSERT INTO client_òptica (nom_client, data_registre, telèfon_client, email_client)
VALUES('Leonardo LePractico', '2002-01-20', 665432212, 'TheRealLeo@gmail.com');
INSERT INTO client_òptica (nom_client, data_registre, telèfon_client, email_client, id_recomanat)
VALUES('Reenacida Gomez', '2012-01-20', 667652212, 'renata@gmail.com', 1);
INSERT INTO client_òptica (nom_client, data_registre, telèfon_client, email_client, id_recomanat)
VALUES('Patricia Gomez', '2015-01-20', 652352212, 'repatpatinson@gmail.com', 1);
INSERT INTO client_òptica (nom_client, data_registre, telèfon_client, email_client)
VALUES('Elenorcio Ricardiano', '2020-01-20', 652352212, 'glassexpert_89@gmail.com');

-- Treballadors
INSERT INTO traballadors_òptica (nom_trebalador, cognom_trebalador)
VALUES('Maximilian', 'Gerundio Costelo');
INSERT INTO traballadors_òptica (nom_trebalador, cognom_trebalador)
VALUES('Joselina', 'Morena Garcia');

-- Ventes
INSERT INTO ventes_òptica (id_client, data_venta, id_producte, id_treballador )
VALUES(1, '2002-04-20', 1, 2);
INSERT INTO ventes_òptica (id_client, data_venta, id_producte, id_treballador )
VALUES(1, '2012-04-20', 1, 2);
INSERT INTO ventes_òptica (id_client, data_venta, id_producte, id_treballador )
VALUES(2, '2012-04-20', 1, 2);
INSERT INTO ventes_òptica (id_client, data_venta, id_producte, id_treballador )
VALUES(3, '2015-05-20', 2, 1);
INSERT INTO ventes_òptica (id_client, data_venta, id_producte, id_treballador )
VALUES(4, '2020-05-20', 3, 1);
INSERT INTO ventes_òptica (id_client, data_venta, id_producte, id_treballador )
VALUES(1, '2020-05-20', 3, 1);
INSERT INTO ventes_òptica (id_client, data_venta, id_producte, id_treballador )
VALUES(1, '2020-07-20', 3, 1);
INSERT INTO ventes_òptica (id_client, data_venta, id_producte, id_treballador )
VALUES(1, '2020-12-19', 3, 1);

-- Queries Optica

-- 1. Llista el total de factures d'un client/a en un període determinat.
SELECT c.id_client, c.nom_client, v.* FROM client_òptica AS c INNER JOIN ventes_òptica AS v ON c.id_client = v.id_client WHERE c.id_client = 1 AND v.data_venta LIKE '2020%';
-- 2. Llista els diferents models d'ulleres que ha venut un empleat/da durant un any.
SELECT t.*, v.id_producte, u.* FROM traballadors_òptica AS t INNER JOIN ventes_òptica AS v ON t.id_treballador = v.id_treballador INNER JOIN ulleres_òptica AS u ON u.id_producte = v.id_producte WHERE t.id_treballador = 1;
-- 3. Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.
SELECT p.nom_proveidor, u.id_producte, v.id_venta, v.data_venta FROM proveidor_òptica AS p INNER JOIN ulleres_òptica AS u ON p.id_proveidor = u.id_proveidor INNER JOIN ventes_òptica AS v ON u.id_producte = v.id_producte;

-- Nivell 1 / Exercici 2 - Pizzeria
CREATE DATABASE pizzeria;

CREATE TABLE
    localitats_pizzeria (
        nom_localitat VARCHAR (50) UNIQUE,
        nom_provincia VARCHAR (50) UNIQUE
    );

CREATE TABLE
    client_pizzeria (
        id_client INTEGER NOT NULL AUTO_INCREMENT,
        nom_client TEXT,
        cognoms_client TEXT,
        telèfon_client INTEGER,
        adreça_client TEXT,
        codi_postal_client INTEGER,
        nom_localitat VARCHAR (50),
        FOREIGN KEY (nom_localitat) REFERENCES localitats_pizzeria(nom_localitat),
        nom_provincia VARCHAR (50),
        FOREIGN KEY (nom_provincia) REFERENCES localitats_pizzeria(nom_provincia),
        PRIMARY KEY (id_client)
    );

CREATE TABLE
    botigues_pizzeria (
        id_botiga INTEGER NOT NULL AUTO_INCREMENT,
        adreça_botiga TEXT,
        codi_postal_botiga INTEGER,
        nom_localitat VARCHAR (50),
        FOREIGN KEY (nom_localitat) REFERENCES localitats_pizzeria(nom_localitat),
        nom_provincia VARCHAR (50),
        FOREIGN KEY (nom_provincia) REFERENCES localitats_pizzeria(nom_provincia),
        PRIMARY KEY(id_botiga)
    );

CREATE TABLE
    ventes_pizzeria (
        id_client INTEGER NOT NULL,
        FOREIGN KEY (id_client) REFERENCES client_pizzeria(id_client),
        id_botiga INTEGER NOT NULL,
        FOREIGN KEY (id_botiga) REFERENCES botigues_pizzeria(id_botiga),
        id_comanda INTEGER NOT NULL AUTO_INCREMENT,
        data_comanda DATETIME NOT NULL,
        tipus_comanda VARCHAR (200),
        data_entrega DATETIME,
        PRIMARY KEY(id_comanda)
    );

CREATE TABLE
    productes_pizzeria (
        id_producte INTEGER NOT NULL AUTO_INCREMENT,
        nom_producte TEXT,
        categoria_pizza VARCHAR(400),
        descripció_producte TEXT,
        imatge_producte VARBINARY(8000),
        preu_producte INTEGER,
        PRIMARY KEY (id_producte)
    );

CREATE TABLE
    empleats_pizzeria(
        id_botiga INTEGER NOT NULL,
        FOREIGN KEY (id_botiga) REFERENCES botigues_pizzeria(id_botiga),
        id_empleat INTEGER NOT NULL AUTO_INCREMENT,
        nom_empleat VARCHAR(200),
        cognoms_empleat VARCHAR(400),
        nif_empleat INTEGER,
        telèfon_empleat INTEGER,
        posició_laboral VARCHAR(200),
        PRIMARY KEY (id_empleat)
    );

CREATE TABLE
    comandes_pizzeria(
        id_comanda INTEGER NOT NULL,
        FOREIGN KEY (id_comanda) REFERENCES ventes_pizzeria(id_comanda),
        id_botiga INTEGER NOT NULL,
        FOREIGN KEY (id_botiga) REFERENCES botigues_pizzeria(id_botiga),
        id_producte INTEGER NOT NULL,
        FOREIGN KEY (id_producte) REFERENCES productes_pizzeria(id_producte),
        id_empleat INTEGER NOT NULL,
        FOREIGN KEY (id_empleat) REFERENCES empleats_pizzeria(id_empleat)
    );

-- Inserts Pizzeria

-- Localitats
INSERT INTO localitats_pizzeria (nom_localitat, nom_provincia)
VALUES('El Campillar', 'Alava');
INSERT INTO localitats_pizzeria (nom_localitat, nom_provincia)
VALUES('Arzua', 'La Coruña');
INSERT INTO localitats_pizzeria (nom_localitat, nom_provincia)
VALUES('Foyos', 'Valencia');

-- Clients
INSERT INTO client_pizzeria (nom_client, cognoms_client, telèfon_client, nom_localitat, nom_provincia)
VALUES('Elenorcio', 'Ricardiano Maganes', 652352212, 'Foyos', 'Valencia');
INSERT INTO client_pizzeria (nom_client, cognoms_client, telèfon_client, nom_localitat, nom_provincia)
VALUES('Bernardo', 'Gongora Murciano', 652352212, 'Foyos', 'Valencia');
INSERT INTO client_pizzeria (nom_client, cognoms_client, telèfon_client, nom_localitat, nom_provincia)
VALUES('Ostencia', 'Perez Fernandez', 672352212, 'Arzua', 'La Coruña');
INSERT INTO client_pizzeria (nom_client, cognoms_client, telèfon_client, nom_localitat, nom_provincia)
VALUES('Gertrudis', 'Comes Ferrer', 672352212, 'El Campillar', 'Alava');

-- Botigues
INSERT INTO botigues_pizzeria (adreça_botiga, codi_postal_botiga, nom_localitat, nom_provincia)
VALUES('calle maravillas 23', 46134, 'Foyos', 'Valencia');
INSERT INTO botigues_pizzeria (adreça_botiga, codi_postal_botiga, nom_localitat, nom_provincia)
VALUES('avenida monarquica 14', 15810, 'Arzua', 'La Coruña');
INSERT INTO botigues_pizzeria (adreça_botiga, codi_postal_botiga, nom_localitat, nom_provincia)
VALUES('carretera plaza españa', 01308, 'El Campillar', 'Alava');

-- Ventes
INSERT INTO ventes_pizzeria (id_client, id_botiga, data_comanda, tipus_comanda, data_entrega)
VALUES(1, 1, '2022-09-20 13:00', 'domicili', '2022-09-20 13:40' );
INSERT INTO ventes_pizzeria (id_client, id_botiga, data_comanda, tipus_comanda, data_entrega)
VALUES(2, 1, '2022-09-20 13:10', 'recollida', '2022-09-20 13:15' );
INSERT INTO ventes_pizzeria (id_client, id_botiga, data_comanda, tipus_comanda, data_entrega)
VALUES(1, 1, '2022-09-21 13:12', 'domicili', '2022-09-20 13:57' );
INSERT INTO ventes_pizzeria (id_client, id_botiga, data_comanda, tipus_comanda, data_entrega)
VALUES(3, 2, '2022-10-01 21:02', 'domicili', '2022-09-20 22:00' );
INSERT INTO ventes_pizzeria (id_client, id_botiga, data_comanda, tipus_comanda, data_entrega)
VALUES(4, 3, '2022-10-04 22:10', 'recollida', '2022-09-20 22:21' );

-- Productes
INSERT INTO productes_pizzeria (nom_producte, categoria_pizza, descripció_producte, imatge_producte, preu_producte)
VALUES('pizza margarita', 'vegetariana', 'pizza: tomate, queso, oregano', 'https://recetinas.com/wp-content/uploads/2017/09/pizza-margarita.jpg', 10);
INSERT INTO productes_pizzeria (nom_producte, categoria_pizza, descripció_producte, imatge_producte, preu_producte)
VALUES('pizza barbacoa', 'carnica', 'pizza: tomate, queso, oregano, carne picada, especias, cebolla, salsa bbq', 'https://okdiario.com/img/2015/09/08/receta-pizza-barbacoa.jpg', 12);
INSERT INTO productes_pizzeria (nom_producte, descripció_producte, imatge_producte, preu_producte)
VALUES('hamburguesa simple', 'hamburguesa: queso, carne, lechuga, tomate', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSHflbYX39o5ieWh9ZfdduxInWkKXOVpfc8g&usqp=CAU', 8);
INSERT INTO productes_pizzeria (nom_producte, descripció_producte, imatge_producte, preu_producte)
VALUES('coca-cola', 'bebida', 'https://www.cocacola.es/content/dam/one/es/es2/coca-cola/products/productos/dic-2021/CC_Origal.jpg', 1.50);
INSERT INTO productes_pizzeria (nom_producte, descripció_producte, imatge_producte, preu_producte)
VALUES('agua', 'bebida', 'https://img.freepik.com/free-psd/plastic-water-bottle-mockup_439185-2468.jpg?w=2000', 1.00);
INSERT INTO productes_pizzeria (nom_producte, descripció_producte, imatge_producte, preu_producte)
VALUES('cerveza', 'bebida', 'https://static.ulabox.com/media/173824_xl.jpg', 2.00);

--Empleats
INSERT INTO empleats_pizzeria (id_botiga, nom_empleat, cognoms_empleat, posició_laboral)
VALUES(1, 'Renata', 'Gongora Perez', 'cuiner/a');
INSERT INTO empleats_pizzeria (id_botiga, nom_empleat, cognoms_empleat, posició_laboral)
VALUES(1, 'Leandro', 'Vincenço Gomez', 'repartidor/a');
INSERT INTO empleats_pizzeria (id_botiga, nom_empleat, cognoms_empleat, posició_laboral)
VALUES(2, 'Joaquin', 'Vincenço Perez', 'cuiner/a');
INSERT INTO empleats_pizzeria (id_botiga, nom_empleat, cognoms_empleat, posició_laboral)
VALUES(2, 'Romera', 'Perez Gomez', 'repartidor/a');
INSERT INTO empleats_pizzeria (id_botiga, nom_empleat, cognoms_empleat, posició_laboral)
VALUES(3, 'Laura', 'Perez Perez', 'cuiner/a');
INSERT INTO empleats_pizzeria (id_botiga, nom_empleat, cognoms_empleat, posició_laboral)
VALUES(3, 'Carlos', 'Perez Vincenço', 'repartidor/a');

-- Comandes
INSERT INTO comandes_pizzeria (id_comanda, id_botiga, id_producte, id_empleat)
VALUES(1, 1, 1, 2);
INSERT INTO comandes_pizzeria (id_comanda, id_botiga, id_producte, id_empleat)
VALUES(1, 1, 5, 2);
INSERT INTO comandes_pizzeria (id_comanda, id_botiga, id_producte, id_empleat)
VALUES(2, 1, 2, 2);
INSERT INTO comandes_pizzeria (id_comanda, id_botiga, id_producte, id_empleat)
VALUES(2, 1, 3, 2);
INSERT INTO comandes_pizzeria (id_comanda, id_botiga, id_producte, id_empleat)
VALUES(3, 1, 6, 2);
INSERT INTO comandes_pizzeria (id_comanda, id_botiga, id_producte, id_empleat)
VALUES(3, 1, 2, 2);
INSERT INTO comandes_pizzeria (id_comanda, id_botiga, id_producte, id_empleat)
VALUES(4, 2, 2, 4);
INSERT INTO comandes_pizzeria (id_comanda, id_botiga, id_producte, id_empleat)
VALUES(4, 3, 3, 6);

-- Queries Pizzeria

--Llista quants productes de categoria 'Begudes' s'han venut en una determinada localitat.
SELECT l.nom_localitat, p.nom_producte, p.descripció_producte FROM localitats_pizzeria AS l INNER JOIN botigues_pizzeria AS b ON l.nom_localitat = b.nom_localitat INNER JOIN comandes_pizzeria AS c ON  c.id_botiga = b.id_botiga INNER JOIN productes_pizzeria AS p ON c.id_producte = p.id_producte  WHERE p.descripció_producte = 'bebida';
-- Llista quantes comandes ha efectuat un determinat empleat/da.
SELECT e.id_empleat, e.nom_empleat, e.cognoms_empleat, c.id_comanda FROM empleats_pizzeria AS e INNER JOIN comandes_pizzeria AS c ON e.id_empleat = c.id_empleat WHERE e.id_empleat = 2;

