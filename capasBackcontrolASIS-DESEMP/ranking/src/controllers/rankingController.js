const { Router } = require('express');
const router = Router();
const rankingModel = require('../models/rankingModel');

router.get('/api/ranking', async (req, res) => {
try {
const ranking = await rankingModel.obtenerRanking();
res.status(200).json(ranking);
} catch (error) {
console.error("Error al obtener ranking:", error);
res.status(500).json({ error: "Error del servidor al obtener los ranking" });
}
});



module.exports = router;