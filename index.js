const express = require('express');
const cors = require('cors');
const db = require('./dbconfig/dbConfig');
const router = require('./routes');

var app = express()
app.use(cors())

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use('/', router)

app.listen(3000)
