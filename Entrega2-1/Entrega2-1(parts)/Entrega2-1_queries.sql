-- Òptica:
-- 1. Llista el total de factures d'un client/a en un període determinat.
SELECT c.id_client, c.nom_client, v.* FROM client_òptica AS c INNER JOIN ventes_òptica AS v ON c.id_client = v.id_client WHERE c.id_client = 1 AND v.data_venta LIKE '2020%';
-- 2. Llista els diferents models d'ulleres que ha venut un empleat/da durant un any.
SELECT t.*, v.id_producte, u.* FROM traballadors_òptica AS t INNER JOIN ventes_òptica AS v ON t.id_treballador = v.id_treballador INNER JOIN ulleres_òptica AS u ON u.id_producte = v.id_producte WHERE t.id_treballador = 1;
-- 3. Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.
SELECT p.nom_proveidor, u.id_producte, v.id_venta, v.data_venta FROM proveidor_òptica AS p INNER JOIN ulleres_òptica AS u ON p.id_proveidor = u.id_proveidor INNER JOIN ventes_òptica AS v ON u.id_producte = v.id_producte;

-- Pizzeria
--Llista quants productes de categoria 'Begudes' s'han venut en una determinada localitat.
SELECT l.nom_localitat, p.nom_producte, p.descripció_producte FROM localitats_pizzeria AS l INNER JOIN botigues_pizzeria AS b ON l.nom_localitat = b.nom_localitat INNER JOIN comandes_pizzeria AS c ON  c.id_botiga = b.id_botiga INNER JOIN productes_pizzeria AS p ON c.id_producte = p.id_producte  WHERE p.descripció_producte = 'bebida';
-- Llista quantes comandes ha efectuat un determinat empleat/da.
SELECT e.id_empleat, e.nom_empleat, e.cognoms_empleat, c.id_comanda FROM empleats_pizzeria AS e INNER JOIN comandes_pizzeria AS c ON e.id_empleat = c.id_empleat WHERE e.id_empleat = 2;
