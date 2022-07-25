-- Exercici 1 - Òptica
CREATE TABLE proveïdor_òptica (
    id INTEGER NOT NULL AUTO_INCREMENT,
    nom TEXT,
    adreça TEXT,
    telèfon INTEGER,
    fax INTEGER,
    nif INTEGER,
    PRIMARY KEY (id)
);

CREATE TABLE ulleres_òptica (
    id_proveidor INTEGER,
    marca TEXT,
    graduacio INTEGER,
    montura TEXT,
    color_montura TEXT,
    color_vidre TEXT,
    preu INTEGER
);

CREATE TABLE client_òptica (
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

CREATE TABLE client_pizzeria (
    id INTEGER NOT NULL AUTO_INCREMENT,
    nom TEXT,
    cognom1 TEXT,
    cognom2 TEXT,
    adreça TEXT,
    codi_postal INTEGER,
    id_localitat INTEGER NOT NULL,
    localitat TEXT NOT NULL,
    id_provincia INTEGER NOT NULL,
    provincia TEXT,
    telèfon INTEGER,
    PRIMARY KEY (id, localitat, provincia)
);