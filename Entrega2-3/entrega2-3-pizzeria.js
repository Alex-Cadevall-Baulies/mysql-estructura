// Pizzeria database + collections
db.dropDatabase()
db.createCollection('clients_pizzeria');
db.createCollection('productes_pizzeria');
db.createCollection('botigues_pizzeria');

// Inserts Pizzeria

// Clients Pizzeria
db.clients_pizzeria.insertOne({
    _id: "1",
    nom_client: "Lola",
    cognom_client: "Jerez del Castillo",
    adreça_client: "Carrer Lorega 12",
    codi_postal_client: "08090",
    localitat_client: "Barcelona",
    província_client: "Barcelona",
    telefon_client: "657787377",
    comandes: [
        {
            tipus_comanda: "recollida",
            informacio_tenda: {
                id_tenda: "1",
                id_empleat: "2"
            },
            data_comanda: "03-07-2022, 13:10",
            productes_comanda: ["1", "3", "4"],
            preu: "19.50"
        }
    ]
});

db.clients_pizzeria.insertOne({
    _id: "2",
    nom_client: "Julian",
    cognom_client: "Romero Gomez",
    adreça_client: "Carrer Rosalia 122",
    codi_postal_client: "08014",
    localitat_client: "Cornella",
    província_client: "Barcelona",
    telefon_client: "657787377",
    comandes: [
        {
            tipus_comanda: "domicili",
            informacio_tenda: {
                id_tenda: "1",
                id_empleat: "2"
            },
            data_comanda: "05-07-2022, 14:10",
            lliurament_comanda: "03-07-2022, 14:50",
            productes_comanda: ["1", "2", "4", "4"],
            preu: "25"
        }
    ]
});

// Productes Pizzeria
db.productes_pizzeria.insertOne({
    _id: "1",
    nom_producte: "Pizza Barbacoa",
    tipus_producte: "pizza",
    categoria_producte: "regular",
    descripcio_producte: ["carn picada", "formatge", "ceba", "baco", "salsa bbq"],
    imatge_poducte: "shorturl.at/FLMX0",
    preu_producte: "10.50"
});

db.productes_pizzeria.insertOne({
    _id: "2",
    nom_producte: "Pizza Vegetal",
    tipus_producte: "pizza",
    categoria_producte: "vegana",
    descripcio_producte: ["formatge vega", "pebrot", "ceba", "salsa tomaquet", "seitan"],
    imatge_producte: "shorturl.at/ehiZ7",
    preu_producte: "12.50"
});

db.productes_pizzeria.insertOne({
    _id: "3",
    nom_producte: "Hamburguesa simple",
    tipus_producte: "hamburguesa",
    descripcio_producte: ["carn", "formatge"],
    imatge_producte: "shorturl.at/dqyPY",
    preu_producte: "8"
});

db.productes_pizzeria.insertOne({
    _id: "4",
    nom_producte: "Aigua",
    tipus_producte: "beguda",
    descripcio_producte: "aigua",
    imatge_producte: "shorturl.at/ahN67",
    preu_producte: "1"
});

// Botigues Pizzeria
db.botiga_pizzeria.insertOne({
    _id: "1",
    nom_botiga: "Roberto Pizzeria Mamma Mia S.L",
    adreça_botiga: "Carrer de les moreres 154",
    codi_postal_botiga: "08001",
    localitat_botiga: "Barcelona",
    província_botiga: "Barcelona",
    empleats: [
        {
            id_empleat: "1",
            nom_empleat: "Roberto",
            cognoms_empleat: "Romero Garcia",
            posicio_empleat: "cuiner/a",
            telefon_empleat: "643532771",
            nif_empleat: "25434523D"
        },
        {
            id_empleat: "2",
            nom_empleat: "Lucrecia",
            cognoms_empleat: "VenPiacere Casadevila",
            posicio_empleat: "repartidor/a",
            telefon_empleat: "644455771",
            nif_empleat: "26914523D"
        }
    ]
});
