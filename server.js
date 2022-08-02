const mysql = require("mysql");
const express = require("express");
const bodyParser = require("body-parser");
const entregaRoutes = require("./routes/entrega");

const app = express();

app.use(bodyParser.json());

app.use(entregaRoutes);

app.listen(4000);