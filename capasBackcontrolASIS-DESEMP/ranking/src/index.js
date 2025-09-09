const express = require('express');
const rankingController = require('./controllers/rankingController');
const morgan = require('morgan');
const cors = require('cors');
const app = express();
app.use(morgan('dev'));
app.use(cors());
app.use(express.json());
app.use(rankingController);
app.listen(3004, () => {
console.log('capasBack ControlASIS-DESEMP ejecutandose en el puerto 3004');
});