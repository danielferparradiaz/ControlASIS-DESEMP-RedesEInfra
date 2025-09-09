const { Router } = require('express');
const router = Router();
const productosModel = require('../models/productosModel');

router.get('/api/productos', async (req, res) => {
try {
const productos = await productosModel.obtenerProductos();
res.status(200).json(productos);
} catch (error) {
console.error("Error al obtener productos:", error);
res.status(500).json({ error: "Error del servidor al obtener los productos" });
}
});

router.post('/api/productos', async (req, res) => {
try {
const { nombre, precio, cantidad } = req.body;
const result = await productosModel.crearProducto(nombre, precio,
cantidad);
res.status(201).json({ mensaje: "Producto creado con éxito" });
} catch (error) {
console.error("Error al insertar producto:", error);
res.status(500).json({ error: "Error del servidor al insertar producto"
});
}
});


module.exports = router;