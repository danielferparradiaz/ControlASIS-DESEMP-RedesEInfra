const { Router } = require('express');
const router = Router();
const alertasModel = require('../models/alertasModel');

router.get('/alertas', async (req, res) => {
try {
const alertas = await alertasModel.obtenerAlertas();
res.status(200).json(alertas);
} catch (error) {
console.error("Error al obtener alertas:", error);
res.status(500).json({ error: "Error del servidor al obtener los alertas" });
}
});


module.exports = router;