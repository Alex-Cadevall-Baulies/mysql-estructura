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
