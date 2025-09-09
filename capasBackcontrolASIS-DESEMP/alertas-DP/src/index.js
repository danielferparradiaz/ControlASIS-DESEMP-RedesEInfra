const express = require('express');
const alertasController = require('./controllers/alertasController');
const morgan = require('morgan');
const cors = require('cors');
const app = express();
app.use(morgan('dev'));
app.use(cors());
app.use(express.json());
app.use(alertasController);
app.listen(3003, () => {
console.log('capasBack ControlASIS-DESEMP ejecutandose en el puerto 3003');
});