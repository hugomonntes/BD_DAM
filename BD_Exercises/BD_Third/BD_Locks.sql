-- 4. Bloqueos
-- 69.Bloquear la tabla transacción para lectura en la conexión1. Visualizar los datos en la
-- conexion1 y la conexion2. Intenta insertar en ambas conexiones. ¿Qué sucede?.
-- Libera el bloqueo.
LOCK TABLE prueba READ;
SELECT * FROM prueba;
UNLOCK TABLES;
-- 70.Bloquear la tabla transacción para escritura. Visualiza los datos en la conexion1 y la
-- conexion2. Intenta insertar un valor en la conexion1 y la conexion2. ¿Qué sucede?.
-- Libera el bloqueo.
LOCK TABLE prueba WRITE;
INSERT INTO prueba(id) VALUES(10);
UNLOCK TABLES;
-- 71.Vamos a crear tres conexiones contra el servidor MySQL. En la primera creamos un
-- bloqueo de lectura sobre la tabla transacción, en la segunda un bloqueo de escritura y
-- en la tercera un bloqueo de lectura. Consulta los datos en las tres conexiones. ¿Qué
-- sucede?.
LOCK TABLE prueba READ;
LOCK TABLE prueba WRITE;
LOCK TABLE prueba READ;
-- 72. En dos conexiones obtén dos bloqueos de lectura para la tabla transacción. Visualiza
-- los datos desde las dos conexiones ¿Qué sucede?. Ahora, desde una tercera conexión,
-- obtén un bloqueo de escritura. ¿Qué sucede?. ¿Cuándo, la conexión 3, puede obtener
-- el bloqueo?









