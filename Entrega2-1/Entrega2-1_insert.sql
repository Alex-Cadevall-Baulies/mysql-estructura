-- Òptica

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

-- Pizzeria

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
