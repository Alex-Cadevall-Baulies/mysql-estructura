const mysql = require("mysql");

const mysqlConnection = mysql.createConnection({
  host: "127.0.0.1",
  user: "root",
  database: "",
  password: "Sprint2ITAcademy",
  multipleStatements: true,
});

mysqlConnection.connect((err) => {
  if (!err) {
    console.log("Connected");
  } else {
    console.log("Connection Failed");
  }
});

module.exports = mysqlConnection;