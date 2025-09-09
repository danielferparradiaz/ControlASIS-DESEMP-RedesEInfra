const mysql = require('mysql2/promise');

const connection = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'redes_control_estu_bd'
});

async function obtenerAlertas() {
    const [rows] = await connection.query(`
        SELECT e.id_estudiante,
               e.nombre AS estudiante,
               c.nombre AS curso,
               'Promedio < 3.0' AS razon
        FROM nota n
        JOIN estudiante e ON e.id_estudiante = n.id_estudiante
        JOIN curso c ON c.id_curso = n.id_curso
        GROUP BY e.id_estudiante, c.id_curso
        HAVING AVG(n.nota) < 3.0

        UNION

        SELECT e.id_estudiante,
               e.nombre AS estudiante,
               c.nombre AS curso,
               'Asistencia < 70%' AS razon
        FROM asistencia a
        JOIN estudiante e ON e.id_estudiante = a.id_estudiante
        JOIN curso c ON c.id_curso = a.id_curso
        GROUP BY e.id_estudiante, c.id_curso
        HAVING (SUM(CASE WHEN a.presente = TRUE THEN 1 ELSE 0 END) / COUNT(*)) * 100 < 70
    `);

    return rows;
}

module.exports = {
    obtenerAlertas
};
