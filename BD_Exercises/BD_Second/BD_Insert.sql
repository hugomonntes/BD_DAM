--8
INSERT INTO JUEGOS (NOMBRE, PLATAFORMA, PRECIOVENTA, PRECIOALQUILER, STOCKVENTA, STOCKALQUILER) VALUES 
    ('Maniac Mansion', "Nintendo,DS,PC", 40.30, 5, 10, 5),
    ('Indiana Jones and the Last Crusade', "PlayStation, Xbox, PC", 50, NULL, 53, NULL),
    ('Loom', "Wii, PC", NULL, 5, 13, 6),
    ('Monkey Island II: The LeChucks Revenge', "Wii,PSP,PC", 20, NULL , 4 , 2),         
    ('Day of the Tentacle', "XBOX PC", 50, 50, 4, 1),
    ('Sam & Max Hit the Road', "PSP, Wii, PC", 37.30, 5.2, 2, 4),
    ('Full Throttle', "PSP Wii Playstation XBOX PC Nintendo DS", 42.00, 3.50, 4, NULL),
    ('The Dig PC', "PC", 50.2, 4, 5, NULL),
    ('La abadía del crimen PC', "PC", 25, 5, 4, 3
);

--10
INSERT INTO SOCIOS (NOMBRE, APELLIDOS, DNI, PAIS, SEXO, OBSERVACIONES) VALUES
    ('Paco', 'Menéndez', '11111', 'España', 'H', 'Querido Asdo, ¿No confundirás el amor con la lujuria?'), 
    ('Ron', 'Gilbert', '22222', 'EEUU', 'H', 'Miren ¡Un mono de tres cabezas!'),
    ('John', 'Carmack', '33333', 'EEUU', 'H', 'El padre del shooter'),
    ('Shigeru', 'Miyamoto', '44444', 'Japón', 'H', 'Zeruda no Densetsu'),
    ('Alekséi', 'Pázhitnov', '55555', 'Rusia', 'H', 'Demasiadas piezas'),
    ('Nolan', 'Bushnell', '66666', 'EEUU', 'H', 'Dos raquetas y una pelota'),
    ('John', 'Tobias', '77777', 'EEUU', 'H', 'Test your might'),
    ('Peter', 'Molyneux', '88888', 'UK', 'H', 'Juega a ser Dios'
);

--11
INSERT INTO SOCIOS (NOMBRE, APELLIDOS, DNI, PAIS, SEXO, OBSERVACIONES) VALUES
	('Sid', 'Meier', '9999', 'Canadá', 'V', 'Evoluciona tu civilización');

--13
INSERT INTO ALQUILERES (NUMSOCIO, JUEGOS, FECHA_ALQUILER, FECHA_DEVOLUCION) VALUES (
    ('1', '1', DEFAULT, DATE_ADD(FECHA_ALQUILER, INTERVAL 5 DAY)),
    ('2', '2', DEFAULT, DATE_ADD(FECHA_ALQUILER, INTERVAL 3 DAY)),
    ('3', '5', DEFAULT, DATE_ADD(FECHA_ALQUILER, INTERVAL 12 HOUR)),
    ('6', '1', DEFAULT, DATE_ADD(FECHA_ALQUILER, INTERVAL 1 MONTH)),
    ('4', '4', DEFAULT, DATE_ADD(FECHA_ALQUILER, INTERVAL 1 WEEK)),
    ('2', '7', DEFAULT, DATE_ADD(FECHA_ALQUILER, INTERVAL 5 DAYS)),
    ('5', '5', DEFAULT, DATE_ADD(FECHA_ALQUILER, INTERVAL 0)),
    ('7', '3', DEFAULT, DATE_ADD(FECHA_ALQUILER, INTERVAL 1 YEAR)),
);

--14
INSERT INTO ALQUILERES (NUMSOCIO, JUEGOS, FECHA_ALQUILER, FECHA_DEVOLUCION) VALUES (
    ('11', '1', DEFAULT, DATE_ADD(FECHA_ALQUILER, INTERVAL 5 DAY)),
    ('9', '22', DEFAULT, DATE_ADD(FECHA_ALQUILER, INTERVAL 3 DAY)),
    ('4', '8', DEFAULT, DATE_ADD(FECHA_ALQUILER, INTERVAL 12 HOUR))
)
