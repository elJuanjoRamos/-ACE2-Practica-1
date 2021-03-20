const express = require('express')
var bodyParser = require('body-parser');
var cors = require('cors');
var path = require('path');


const app = express()
const port = 3000



//Body-Parser Config
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cors())

//Headers
app.use(function(req, res, next) {
    
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Authorization');
    res.setHeader('Access-Control-Allow-Credentials', true);
    if (req.methods == "OPTIONS") {
        res.sendStatus(200);
    } else {
        next();
    }
});


var usuario = require('./routes/usuario.routes');
var temperatura = require('./routes/usuario_temperatura.routes');
var frecuencia = require('./routes/usuario_cardiaco.routes');

app.use("/", usuario);
app.use("/", temperatura);
app.use("/", frecuencia);


app.listen(port, () => {
  console.log(`El servidor esta corriendo en http://localhost:${port}`)
})

