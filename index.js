const express = require('express');
const cors = require('cors');

var app = express()
app.use(cors())

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use('/', (req,res) =>{
    res.json({
        Project: "Puma"
    })
})

app.listen(3000)