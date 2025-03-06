CREATE DATABASE IF NOT EXISTS OURENSEFC CHARACTER SET = UTF8;

CREATE TABLE OURENSEFC.jugadores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    edad INT,
    posicion VARCHAR(30),
    dorsal INT,
    nacionalidad VARCHAR(50),
    goles INT
);

INSERT INTO jugadores (nombre, edad, posicion, dorsal, nacionalidad, goles) VALUES
('Patricio Damián Guillén Gandini', 40, 'Portero', 1, 'Argentina', 0),
('Raúl Marqueta Ribagorda', 30, 'Portero', 13, 'España', 0),
('Pedro Alejandro Zalaya Galardón', 26, 'Defensa Central', 4, 'España', 1),
('Fernando Andrada Gómez', 29, 'Lateral Derecho', 2, 'España', 0),
('Francisco Carmona García', 25, 'Defensa Central', 5, 'España', 0),
('Hugo Sanz Pérez', 22, 'Lateral Izquierdo', 3, 'España', 0),
('Miguel del Prado Barrio', 25, 'Defensa Central', 14, 'España', 1),
('Moisés Rodríguez Laínez', 28, 'Defensa Central', 15, 'España', 0),
('Enrique Teijo Rico', 20, 'Lateral Derecho', 16, 'España', 0),
('Raúl Prada Lozano', 23, 'Lateral Izquierdo', 17, 'España', 0),
('Alejandro Fidalgo González', 24, 'Mediocentro', 6, 'España', 0),
('Francesc Fullana Ginard', 35, 'Mediocentro', 8, 'España', 5),
('Jairo Noriega Figueroa', 21, 'Mediocentro', 18, 'España', 2),
('Jerin Marcolino Ramos Santos', 29, 'Mediocentro', 20, 'España', 2),
('Juan Manuel Bravo Alcántara', 27, 'Mediocentro', 21, 'España', 0),
('Alberto Gil Barea', 27, 'Extremo Derecho', 7, 'España', 0),
('Alejandro Gil Rochina', 27, 'Extremo Derecho', 11, 'España', 1),
('Ángel Sánchez Baró', 27, 'Extremo Izquierdo', 10, 'España', 3),
('Javier Carbonell Piserra', 27, 'Delantero Centro', 9, 'España', 9),
('Gonzalo Ignacio di Renzo', 29, 'Delantero Centro', 19, 'Argentina', 2);

CREATE TABLE OURENSEFC.estadisticas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    jugador_id INT,
    partidos_jugados INT,
    asistencias INT,
    tarjetas_amarillas INT,
    tarjetas_rojas INT,
    FOREIGN KEY (jugador_id) REFERENCES jugadores(id) ON DELETE CASCADE
);

INSERT INTO estadisticas (jugador_id, partidos_jugados, asistencias, tarjetas_amarillas, tarjetas_rojas) VALUES
(1, 20, 0, 2, 0),
(2, 18, 0, 1, 0),
(3, 22, 1, 3, 0),
(4, 19, 2, 2, 0),
(5, 21, 0, 4, 1),
(6, 17, 3, 1, 0),
(7, 23, 0, 2, 0),
(8, 20, 1, 3, 1),
(9, 15, 0, 2, 0),
(10, 18, 1, 2, 0),
(11, 25, 4, 3, 0),
(12, 26, 7, 4, 1),
(13, 19, 2, 1, 0),
(14, 22, 3, 2, 0),
(15, 20, 0, 3, 0),
(16, 21, 5, 1, 0),
(17, 23, 6, 2, 0),
(18, 24, 3, 2, 1),
(19, 25, 8, 3, 0),
(20, 20, 2, 1, 0);

