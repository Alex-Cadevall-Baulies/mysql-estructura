-- Exercici 1 - Òptica
CREATE TABLE proveidor_òptica (
    id INTEGER NOT NULL AUTO_INCREMENT,
    nom TEXT,
    adreça TEXT,
    telèfon INTEGER,
    fax INTEGER,
    nif INTEGER,
    PRIMARY KEY (id)
);

CREATE TABLE ulleres_òptica (
    id_proveidor INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_proveidor) REFERENCES proveidor_òptica(id),
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
    id_localitat INTEGER NOT NULL UNIQUE,
    localitat TEXT NOT NULL,
    id_provincia INTEGER NOT NULL UNIQUE,
    provincia TEXT NOT NULL,
    telèfon INTEGER,
    PRIMARY KEY (id)
);

CREATE TABLE comandes_pizzeria (
    id_comanda INTEGER NOT NULL,
    data_comanda DATE,
    entrega INTEGER,
    productes TEXT,
    quantitat_productes INTEGER,
    preu INTEGER,
    id_cliente INTEGER NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES client_pizzeria(id)
);

CREATE TABLE productes_pizzeria (
    id_producte INTEGER NOT NULL AUTO_INCREMENT,
    nom TEXT,
    descripció TEXT,
    imatge VARCHAR(2038),
    preu INTEGER,
    PRIMARY KEY (id_producte)
);
