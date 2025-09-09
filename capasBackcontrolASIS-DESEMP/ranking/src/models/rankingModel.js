const mysql = require('mysql2/promise');

const connection = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'redes_control_estu_bd'
});

async function obtenerRanking(limit = 5) {
  const query = `
    SELECT 
        e.id_estudiante,
        e.nombre AS estudiante,
        ROUND(AVG(n.nota), 2) AS promedio
    FROM estudiante e
    JOIN nota n ON e.id_estudiante = n.id_estudiante
    GROUP BY e.id_estudiante, e.nombre
    ORDER BY promedio DESC
    LIMIT ?;
  `;
  
  const [rows] = await connection.query(query, [limit]);

  // Agregamos puesto (posición en el ranking)
  return rows.map((row, index) => ({
    puesto: index + 1,
    estudiante: row.estudiante,
    promedio: row.promedio
  }));
}

module.exports = {
  obtenerRanking
};
