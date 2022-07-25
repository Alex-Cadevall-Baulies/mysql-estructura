-- Exercici 1 - Òptica
CREATE TABLE proveïdor (
    id INTEGER NOT NULL AUTO_INCREMENT,
    nom TEXT,
    adreça TEXT,
    telèfon INTEGER,
    fax INTEGER,
    nif INTEGER,
    PRIMARY KEY (id)
);

CREATE TABLE ulleres (

    marca TEXT,
    graduacio INTEGER,
    montura TEXT,
    color_montura TEXT,
    color_vidre TEXT,
    preu INTEGER
);

CREATE TABLE clients (
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
