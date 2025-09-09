# controlASIS-DESEMP-RedesEInfra-grupo4

Proyecto universitario - Redes e Infraestructura 2025-03  
Aplicación web basada en **microservicios** que permite el **control de asistencia y desempeño académico**.  

Cada integrante desarrolla su propio microservicio dentro de la carpeta `capasBack/`.  
El frontend se encuentra en `capasFrontcontrolASIS-DESEMP/`.

---

## 🚀 Estructura del proyecto

```bash
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
