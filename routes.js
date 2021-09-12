const { response } = require('express');
const express = require('express');
const dbConfig = require('./dbconfig/dbConfig');
const router = express.Router();
const db = require('./dbconfig/dbConfig');

router.get('/', (req, res) =>{
    res.json({
        Project: "Puma"
    });
});

router.post('/aluno', (req, res) =>{//Falta tratamento dos dados
    var body = req.body;
    res.status = 200

    db.query("INSERT INTO ALUNO(nome,matricula,email,sobrenome,senha) VALUES ($1,$2,$3,$4,$5) RETURNING *", [body.nome,body.matricula,body.email,body.sobrenome,body.senha]).then( response => res.json({"created": response.rows})).catch(response => res.json)
})

router.get('/aluno/:matriculaId', (req, res) =>{

    var response = db.query("SELECT a.nome,a.matricula,a.sobrenome,a.email FROM ALUNO as a WHERE matricula=$1", [req.params.matriculaId]).then(response =>{
        res.json(response.rows)
    })
})

module.exports = router