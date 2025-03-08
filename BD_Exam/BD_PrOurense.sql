-- Examen de Práctica - Bases de Datos (Ourense FC)

-- Parte 1: Creación y Modificación de Base de Datos y Tablas
-- Crear una base de datos llamada ourense_fc.
    CREATE DATABASE IF NOT EXISTS ourense_fc CHARACTER SET = UTF8;
-- Dentro de ourense_fc, crea dos tablas:
-- Jugadores: Debe tener los siguientes campos:
-- id_jugador (INT, clave primaria, autoincremental)
-- nombre (VARCHAR(50), no puede ser nulo)
-- apellido (VARCHAR(50), no puede ser nulo)
-- posicion (ENUM: 'Portero', 'Defensa', 'Centrocampista', 'Delantero')
-- edad (INT, debe ser mayor de 16)
-- dorsal (INT, único)
-- salario (DECIMAL(10,2), por defecto 3000)
    CREATE TABLE ourense_fc.Jugadores (
    id_jugador INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
  	apellido VARCHAR(50) NOT NULL,
  	posicion ENUM('Portero', 'Defensa', 'Centrocampista', 'Delantero'),
  	edad INT CHECK(edad > 16),
  	dorsal INT UNIQUE,
  	salario DECIMAL(10,2) -- Hasta 10 dígitos en total, con 2 decimales 	
    )
-- Partidos: Debe tener los siguientes campos:
-- id_partido (INT, clave primaria, autoincremental)
-- fecha (DATE)
-- rival (VARCHAR(50), no puede ser nulo)
-- resultado (VARCHAR(10), formato "2-1", "1-1", etc.)
-- Modificar las tablas:
    CREATE TABLE Partidos (
        id_partido INT AUTO_INCREMENT PRIMARY KEY,
        fecha DATE NOT NULL,                        
        rival VARCHAR(50) NOT NULL,                 
        resultado VARCHAR(10) NOT NULL     
    );
-- Agrega una columna id_partido en Jugadores para registrar en qué partido jugó cada jugador (clave foránea de Partidos).
    ALTER TABLE ourense_fc.Jugadores 
    ADD COLUMN id_partido INT;

    ALTER TABLE Jugadores
    FOREIGN KEY (id_partido) REFERENCES Paridos(id_partido);
-- Parte 2: Inserción de Datos
-- Inserta algunos jugadores del Ourense FC en la tabla Jugadores:
-- Ejemplo de jugadores reales (puedes buscar más datos si quieres):
-- Raúl Marqueta (Portero, 28 años, dorsal 1)
-- Rubén Sánchez (Defensa, 30 años, dorsal 4)
-- Jaime Cassio (Centrocampista, 26 años, dorsal 8)
-- Renan Zanelli (Delantero, 29 años, dorsal 10)
    INSERT INTO ourense_fc.Jugadores (nombre, apellido, posicion, edad, dorsal) VALUES
    ('Raúl', 'Maqueta', 'Portero', 28, 1),
    ('Ruben', 'Sanchez', 'Defensa', 30, 4),
    ('Jaime', 'Cassio', 'Centrocampista', 26, 8),
    ('Renan', 'Zanelli', 'Delantero', 29, 10)
-- Inserta al menos 3 partidos jugados por el Ourense FC, incluyendo rival y resultado.
    INSERT INTO ourense_fc.Partidos (fecha, rival, resultado) VALUES
    ('2025-03-01', 'Deportivo Fabril', '2-1'),
    ('2025-03-07', 'Arosa SC', '1-1'),
    ('2025-03-14', 'Gran Peña', '3-2')
-- Parte 3: Consultas SQL
-- Consulta fácil:
-- Muestra todos los jugadores del equipo con su nombre, apellido y posición.
    SELECT nombre, apellido, posicion FROM Jugadores;
-- Consulta intermedia:
-- Encuentra a los jugadores que tienen más de 25 años y juegan como defensas o centrocampistas.
	SELECT * FROM Jugadores WHERE edad > 25 AND (posicion LIKE 'defensa' OR posicion LIKE 'centrocampista');
-- Consulta avanzada:
-- Muestra el nombre de los jugadores que jugaron en un partido contra el "Deportivo Fabril" (supongamos que está en la tabla Partidos).
	SELECT nombre FROM Jugadores WHERE id_jugador IN (SELECT id_jugador FROM Partidos WHERE rival LIKE 'Deportivo Fabril')