-- Crear la base de datos universidad
CREATE DATABASE universidad;

-- Tabla para almacenar las carreras
CREATE TABLE carreras (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  creditos INT,
  UNIQUE(nombre)
);

-- Tabla para almacenar las materias
CREATE TABLE materias (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  creditos INT,
  carrera_id INT,
  FOREIGN KEY (carrera_id) REFERENCES carreras(id) ON DELETE CASCADE 
);

-- Tabla para almacenar las especialidades
CREATE TABLE especialidades (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  carrera_id INT,
  FOREIGN KEY (carrera_id) REFERENCES carreras(id) ON DELETE CASCADE 
);

-- Tabla para almacenar las materias de especialidad
CREATE TABLE materias_especialidad (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  carrera_id INT NOT NULL,
  especialidad_id INT NOT NULL,
  FOREIGN KEY (carrera_id) REFERENCES materias(id) ON DELETE CASCADE, -- Establece la relación con la tabla de materias
  FOREIGN KEY (especialidad_id) REFERENCES especialidades(id) ON DELETE CASCADE -- Establece la relación con la tabla de especialidades
);

