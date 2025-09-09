-- ========================
-- CREACIÓN DE TABLAS BASE
-- ========================

CREATE DATABASE IF NOT EXISTS redes_control_estu_bd;

CREATE TABLE estudiante (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    documento VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE,
    fecha_ingreso DATE
);

CREATE TABLE profesor (
    id_profesor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    departamento VARCHAR(100)
);

CREATE TABLE curso (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    creditos INT DEFAULT 3,
    id_profesor INT,
    FOREIGN KEY (id_profesor) REFERENCES profesor(id_profesor)
);

-- ========================
-- TABLAS DE RELACIÓN
-- ========================

-- Asignación de estudiantes a cursos
CREATE TABLE curso_estudiante (
    id_curso INT,
    id_estudiante INT,
    PRIMARY KEY (id_curso, id_estudiante),
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso),
    FOREIGN KEY (id_estudiante) REFERENCES estudiante(id_estudiante)
);

-- Registro de asistencia
CREATE TABLE asistencia (
    id_asistencia INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT NOT NULL,
    id_curso INT NOT NULL,
    fecha DATE NOT NULL,
    presente BOOLEAN NOT NULL,
    FOREIGN KEY (id_estudiante) REFERENCES estudiante(id_estudiante),
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

-- Registro de calificaciones
CREATE TABLE nota (
    id_nota INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT NOT NULL,
    id_curso INT NOT NULL,
    nota DECIMAL(3,1) CHECK (nota BETWEEN 0 AND 5),
    fecha DATE NOT NULL,
    FOREIGN KEY (id_estudiante) REFERENCES estudiante(id_estudiante),
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);




-- INSERTS
-- ========================
-- Profesores
-- ========================
INSERT INTO profesor (nombre, email, departamento) VALUES
('Carlos Gómez', 'cgomez@uni.edu', 'Matemáticas'),
('Laura Torres', 'ltorres@uni.edu', 'Historia'),
('Andrés Ríos', 'arios@uni.edu', 'Programación');

-- ========================
-- Estudiantes
-- ========================
INSERT INTO estudiante (nombre, documento, email, fecha_ingreso) VALUES
('Ana Martínez', '1001', 'ana@uni.edu', '2024-01-15'),
('Pedro López', '1002', 'pedro@uni.edu', '2024-01-15'),
('Lucía Ramírez', '1003', 'lucia@uni.edu', '2024-01-15'),
('Diego Pérez', '1004', 'diego@uni.edu', '2024-01-15'),
('María Rodríguez', '1005', 'maria@uni.edu', '2024-01-15');

-- ========================
-- Cursos
-- ========================
INSERT INTO curso (nombre, creditos, id_profesor) VALUES
('Matemáticas', 4, 1),
('Historia', 3, 2),
('Programación', 5, 3);

-- ========================
-- Relación curso - estudiante
-- ========================
INSERT INTO curso_estudiante (id_curso, id_estudiante) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5), -- Matemáticas
(2, 1), (2, 2), (2, 3), (2, 5),         -- Historia
(3, 2), (3, 3), (3, 4);                 -- Programación

-- ========================
-- Asistencia (ejemplo: 3 días)
-- ========================
INSERT INTO asistencia (id_estudiante, id_curso, fecha, presente) VALUES
-- Día 1
(1, 1, '2025-01-10', TRUE),
(2, 1, '2025-01-10', FALSE),
(3, 1, '2025-01-10', TRUE),
(4, 1, '2025-01-10', TRUE),
(5, 1, '2025-01-10', TRUE),

-- Día 2
(1, 1, '2025-01-17', TRUE),
(2, 1, '2025-01-17', TRUE),
(3, 1, '2025-01-17', FALSE),
(4, 1, '2025-01-17', TRUE),
(5, 1, '2025-01-17', TRUE),

-- Día 3
(1, 1, '2025-01-24', TRUE),
(2, 1, '2025-01-24', FALSE),
(3, 1, '2025-01-24', TRUE),
(4, 1, '2025-01-24', TRUE),
(5, 1, '2025-01-24', FALSE);

-- ========================
-- Notas
-- ========================
INSERT INTO nota (id_estudiante, id_curso, nota, fecha) VALUES
-- Matemáticas
(1, 1, 4.5, '2025-01-20'),
(2, 1, 2.8, '2025-01-20'),
(3, 1, 4.0, '2025-01-20'),
(4, 1, 3.5, '2025-01-20'),
(5, 1, 3.2, '2025-01-20'),

-- Historia
(1, 2, 3.8, '2025-01-22'),
(2, 2, 2.5, '2025-01-22'),
(3, 2, 4.2, '2025-01-22'),
(5, 2, 3.0, '2025-01-22'),

-- Programación
(2, 3, 4.7, '2025-01-25'),
(3, 3, 4.5, '2025-01-25'),
(4, 3, 2.9, '2025-01-25');
