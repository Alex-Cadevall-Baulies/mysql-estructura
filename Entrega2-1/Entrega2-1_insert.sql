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