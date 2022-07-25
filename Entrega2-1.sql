-- Exercici 1 - Òptica
CREATE TABLE proveïdor (
    nom TEXT,
    adreça TEXT,
    telèfon INTEGER,
    fax INTEGER,
    nif INTEGER
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
    nom TEXT,
    adreça TEXT,
    telèfon INTEGER,
    email TEXT,
    data_registre INTEGER,
    recomenat TEXT,
    venta TEXT
);
