-- Exercici 1 - Òptica
CREATE DATABASE òptica_cul_ampolla;

CREATE TABLE
    proveidor_òptica (
        id_proveidor INTEGER NOT NULL AUTO_INCREMENT,
        nom_proveidor TEXT,
        adreça_proveidor TEXT,
        telèfon_proveidor INTEGER,
        fax_proveidor INTEGER,
        nif_proveidor INTEGER,
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

-- Exercici 2 - Pizzeria

CREATE TABLE
    client_pizzeria (
        id INTEGER NOT NULL AUTO_INCREMENT,
        nom TEXT,
        cognom1 TEXT,
        cognom2 TEXT,
        adreça TEXT,
        codi_postal INTEGER,
        id_localitat INTEGER NOT NULL UNIQUE,
        localitat TEXT NOT NULL,
        id_provincia INTEGER NOT NULL UNIQUE,
        provincia TEXT NOT NULL,
        telèfon INTEGER,
        PRIMARY KEY (id)
    );

CREATE TABLE
    categoria_pizzeria (
        id_categoria INTEGER NOT NULL,
        nom_categoria VARCHAR(400) NOT NULL,
        PRIMARY KEY (nom_categoria)
    );

CREATE TABLE
    productes_pizzeria (
        id_producte INTEGER NOT NULL AUTO_INCREMENT,
        nom TEXT,
        categoria_pizza VARCHAR(400),
        FOREIGN KEY (categoria_pizza) REFERENCES categoria_pizzeria(nom_categoria),
        descripció TEXT,
        imatge VARCHAR(2038),
        preu INTEGER,
        PRIMARY KEY (id_producte)
    );

CREATE TABLE
    botigues_pizzeria (
        id_botiga INTEGER NOT NULL AUTO_INCREMENT,
        adreça VARCHAR(400),
        codi_postal INTEGER,
        id_localitat INTEGER NOT NULL UNIQUE,
        localitat TEXT NOT NULL,
        id_provincia INTEGER NOT NULL UNIQUE,
        provincia TEXT NOT NULL,
        PRIMARY KEY(id_botiga)
    );

CREATE TABLE
    empleats_pizzeria(
        id_botiga INTEGER NOT NULL,
        FOREIGN KEY (id_botiga) REFERENCES botigues_pizzeria(id_botiga),
        id_empleat INTEGER NOT NULL AUTO_INCREMENT,
        nom VARCHAR(200),
        cognoms VARCHAR(400),
        NIF INTEGER,
        Telèfon INTEGER,
        posició_laboral VARCHAR(200),
        PRIMARY KEY (id_empleat)
    );
    
    CREATE TABLE
    comandes_pizzeria (
        id_comanda INTEGER NOT NULL AUTO_INCREMENT,
        data_comanda DATE,
        entrega INTEGER,
        productes TEXT,
        quantitat_productes INTEGER,
        preu INTEGER,
        id_cliente INTEGER NOT NULL,
        FOREIGN KEY (id_cliente) REFERENCES client_pizzeria(id),
        id_botiga INTEGER NOT NULL,
        FOREIGN KEY (id_botiga) REFERENCES botigues_pizzeria(id_botiga),
        id_empleat INTEGER NOT NULL,
        FOREIGN KEY (id_empleat) REFERENCES empleats_pizzeria(id_empleat),
        id_producte INTEGER NOT NULL,
        FOREIGN KEY (id_producte) REFERENCES productes_pizzeria(id_producte),
        PRIMARY KEY (id_comanda)
    );

CREATE TABLE
    repartiments (
        id_repartiment INTEGER NOT NULL AUTO_INCREMENT,
        id_botiga INTEGER NOT NULL,
        FOREIGN KEY (id_botiga) REFERENCES botigues_pizzeria(id_botiga),
        id_empleat INTEGER NOT NULL,
        FOREIGN KEY (id_empleat) REFERENCES empleats_pizzeria(id_empleat),
        id_comanda INTEGER NOT NULL,
        FOREIGN KEY (id_comanda) REFERENCES comandes_pizzeria(id_comanda),
        PRIMARY KEY (id_repartiment)
    );