-- Exercici 1 - Òptica

CREATE TABLE
    proveidor_òptica (
        id INTEGER NOT NULL AUTO_INCREMENT,
        nom TEXT,
        adreça TEXT,
        telèfon INTEGER,
        fax INTEGER,
        nif INTEGER,
        PRIMARY KEY (id)
    );

CREATE TABLE
    ulleres_òptica (
        id_proveidor INTEGER NOT NULL AUTO_INCREMENT,
        FOREIGN KEY (id_proveidor) REFERENCES proveidor_òptica(id),
        marca TEXT,
        graduacio INTEGER,
        montura TEXT,
        color_montura TEXT,
        color_vidre TEXT,
        preu INTEGER
    );

CREATE TABLE
    client_òptica (
        id INTEGER NOT NULL AUTO_INCREMENT,
        nom TEXT,
        adreça TEXT,
        telèfon INTEGER,
        email TEXT,
        data_registre DATE,
        recomenat TEXT,
        venta TEXT,
        PRIMARY KEY (id)
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