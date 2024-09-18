const express = require('express');
const app = express();
const mysql = require('mysql');

const db = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME
});

db.connect(err => {
  if (err) throw err;
  console.log('App2 connected to Database');
});

app.get('/', (req, res) => {
  res.send('Hello from App2!');
});

app.listen(3000, () => {
  console.log('App2 running on port 3000');
});
