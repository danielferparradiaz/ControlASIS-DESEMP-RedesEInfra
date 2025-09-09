# controlASIS-DESEMP-RedesEInfra-grupo4
# controlASIS-DESEMP-RedesEInfra-grupo4

Proyecto universitario - Redes e Infraestructura 2025-03  
Aplicación web basada en **microservicios** que permite el **control de asistencia y desempeño académico**.  

Cada integrante desarrolla su propio microservicio dentro de la carpeta `capasBack/`. El frontend se encuentra en `capasFrontcontrolASIS-DESEMP/`.

---

## 🚀 Estructura del proyecto

controlASIS-DESEMP-RedesEInfra-grupo4/
│
├── capasBack/                     # Carpeta principal de microservicios
│   ├── alertas-DP/                # Microservicio de alertas (ejemplo)
│   │   ├── src/                   # Código fuente (controllers, models, etc.)
│   │   ├── package.json           # Dependencias específicas de este micro
│   │   └── node_modules/          # Se ignora en git
│   │
│   ├── asistencia-JP/             # Otro microservicio (ejemplo)
│   └── ...                        # Microservicios de otros integrantes
│
├── capasFrontcontrolASIS-DESEMP/  # Frontend
│   ├── index.html
│   ├── alertas.html
│   └── ...
│
├── README.md                      # Este archivo
└── .gitignore                     # Ignorar node_modules, logs, etc.



Dentro de la carpeta de tu microservicio:
    npm init -y


Cada integrante debe instalar Express y lo que necesite (mysql cors):
    npm install express



const express = require('express');
const app = express();
const PORT = 3001; // Cambiar puerto por cada microservicio

app.get('/alertas', (req, res) => {
  const data = [
    { estudiante: "Pedro", razon: "Promedio < 3.0" },
    { estudiante: "María", razon: "Asistencia < 70%" }
  ];
  res.json(data);
});

app.listen(PORT, () => {
  console.log(`Microservicio de alertas corriendo en http://localhost:${PORT}/alertas`);
});



Hacer commits descriptivos:

git commit -m "Agrego microservicio de alertas con endpoint /alertas"


👥 Integrantes (Grupo 4)

Daniel Parra – Microservicio Alertas

(Agregar aquí los demás integrantes con su microservicio)