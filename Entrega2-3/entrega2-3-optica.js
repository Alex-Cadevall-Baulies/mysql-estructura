// optica database + collections
db.dropDatabase()
db.createCollection('proveidor_optica');
db.createCollection('client_optica');

// Inserts optica

// Proveidors Ulleres
db.proveidor_optica.insertOne({
    _id: "1",
    nom_proveidor: "Ulleres Miguelito S.L",
    adreça_proveidor: "Carrer de les acacies 24, 1-2, Barcelona, 08024, Espanya",
    telefon_proveidor: "623765443",
    fax_proveidor: "93456354",
    nif_proveidor: "F98765421",
    marques_ulleres: [
        "Lay Bhan",
        "Barna Blue"
    ]
});

db.proveidor_optica.insertOne({
    _id: "2",
    nom_proveidor: "El Tercer Ull S.C",
    adreça_proveidor: "Poligon la sagrada verge 3, planta, Roses, 17480, Espanya",
    telefon_proveidor: "638743662",
    fax_proveidor: "9324567721",
    nif_proveidor: "D76829445",
    marques_ulleres: [
        "Gutxi",
        "Etnia"
    ]
});

//Clients Ulleres

db.client_optica.insertOne({
    _id: "1",
    nom_client: "Anaxa Sanchez Marchal",
    adreça_client: "Avinguda les roses d'alleli 39, Barcelona, 08035, Espanya",
    telefon_client: "665773882",
    email_client: "Aran_xa_cha_cha@gmail.com",
    data_registre_client: "09-03-2022",
    client_id_recomenat: "",
    compres: [
        {
            marca: "Lay Bhan",
            graduacio: "2.5",
            montura: "Ultra Flex",
            color_montura: "blau estrella de mar",
            color_vidre: "transparent tintat",
            preu: "120€",
            venut_per:
            {
                id_empleat: "1",
                nom_empleat: "Laia Pedrafolca Roncero"
            }
        },

        {
            marca: "Etnia",
            marca: "Gutxi",
            graduacio: "1.25",
            montura: "pasta rigida",
            color_montura: "Negre marbre carbonitzat",
            color_vidre: "verd botella sorra",
            preu: "245€",
            venut_per:
            {
                id_empleat: "2",
                nom_empleat: "Pol Zamora Cadafalch"
            }
        }
    ]
});

db.client_optica.insertOne({
    _id: "2",
    nom_client: "Patricio Lopez Gonzalez",
    adreça_client: "Transversal del litoral 58, Barcelona, 08010, Espanya",
    telefon_client: "675884934",
    email_client: "Pat_LoGonzalez@yahoo.es",
    data_registre_client: "12-03-2022",
    client_id_recomenat: "1",
    compres: [
        {
            marca: "Lay Bhan",
            graduacio: "1.25",
            montura: "Ultra Flex",
            color_montura: "Groc canari cridaner",
            color_vidre: "cian cel tacat",
            preu: "120€",
            venut_per:
            {
                id_empleat: "1",
                nom_empleat: "Laia Pedrafolca Roncero"
            }
        }
    ]
});

