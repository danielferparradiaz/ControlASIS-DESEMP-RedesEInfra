const mysql = require('mysql2/promise');
const connection = mysql.createPool({
host: 'localhost',
user: 'root',
password: ''
,
database: 'capasAlmacen'
});


async function obtenerProductos() {
const result = await connection.query('SELECT * FROM producto');
return result[0];
}
async function crearProducto(nombre, precio, cantidad) {
const result = await connection.query('INSERT INTO producto VALUES(null,?,?,?)', [nombre, precio, cantidad]);
return result;
}
module.exports = {
obtenerProductos, crearProducto
};