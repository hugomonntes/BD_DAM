-----------------------TRANSACCIONES--------------------------
58, 59, 60, 62, 63, 66, 67, 68, 69, 70, 71

-- 58.Comienza una transacción e inserta el valor 20 en la tabla transación. Muestra los datos.
START TRANSACTION;
INSERT INTO transacción VALUES (20);
SELECT * FROM transacción;

-- 59. Deshaz la transacción y vuelve a mostrar los dados. ¿Qué ha sucedido?.
ROLLBACK;
SELECT * FROM transacción;

-- 60.Comienza una transacción e inserta el valor 20. Muestra los datos. Cierra la conexión con la base de datos. Vuelve a conectarte y muestra los datos. ¿Qué ha sucedido?.
START TRANSACTION;
INSERT INTO transacción VALUES (20);
SELECT * FROM transacción;

--62. En la conexión 1 comienza una transacción e inserta el valor 20. Muestra los datos de la tabla transacción. En la conexión2 muestra los datos de la tabla transacción. ¿Qué ha sucedido?.
No se ve el dato introducido por no realizar el COMMIT.

-- 63.Confirma los cambios en la conexión1. Muestra los datos tanto en la conexión1 como en la conexión2. ¿Qué ha sucedido?.
Se ven los cambios por haber realizado el COMMIT.

-- 66.Comenzamos una transacción e insertamos el valor 100 en la tabla transacciones.
-- Realizamos los siguientes pasos visualizando cada uno de ellos:
-- · Creamos el punto de recuperación uno.
-- · Actualizamos el valor de 100 a 101.
-- · Creamos el punto de recuperación dos.
-- · Insertamos el valor 102.
-- · Creamos el punto de recuperación tres.
-- · Insertamos el valor 103.
-- · Volvemos al punto tres.
-- · Volvemos al punto dos.
-- · Realizamos un commit.
-- · Volvemos al punto 1 ¿Qué ha sucedido?. Da error porque con el COMMIT estamos fuera de la transaccion
START TRANSACTION;
INSERT INTO transacción VALUES (100);
SELECT * FROM transacción;
SAVEPOINT punto1;
SELECT * FROM transacción;
UPDATE transacción SET valores = 101 WHERE valores = 100;
SELECT * FROM transacción;
SAVEPOINT punto2;
SELECT * FROM transacción;
INSERT INTO transacción VALUES (102)
SELECT * FROM transacción;
SAVEPOINT punto3;
SELECT * FROM transacción;
INSERT INTO transacción VALUES (103)
SELECT * FROM transacción;
ROLLBACK TO punto3;
SELECT * FROM transacción;
ROLLBACK TO punto2;
SELECT * FROM transacción;
COMMIT;
SELECT * FROM transacción;
 
ROLLBACK TO punto1;
SELECT * FROM transacción;


67.Comienza una transacción e inserta el valor 110. Creamos un punto de recuperación uno. Insertamos el valor 111 y creamos la base de datos tema9 y volvemos al punto de restauración uno. ¿Qué ha pasado?.
-- Da error porque con la creación de una base de datos es como con el  COMMIT, estamos fuera de la transaccion
START TRANSACTION;
INSERT INTO transacción VALUES(110);
SAVEPOINT punto1;
INSERT INTO transacción VALUES(111);
CREATE DATABASE tema9;
ROLLBACK TO punto1;


68.Comienza una transacción e inserta el valor 120. Creamos un punto de recuperación  uno. Insertamos el valor 121 y volvemos a crear el punto de restauración uno. Volvemos al punto de restauración uno. ¿Qué ha pasado?. Inserta el valor 122. Realiza un commit y vuelve al punto de restauración uno. ¿Qué ha pasado?. --Da error porque con el COMMIT estamos fuera de la transaccion
START TRANSACTION;
INSERT INTO transacción VALUES(120);
SAVEPOINT punto1;
INSERT INTO transacción VALUES(121);
SAVEPOINT punto1;
ROLLBACK TO punto1;
INSERT INTO transacción VALUES(122);
COMMIT;
ROLLBACK TO punto1;

69.Bloquear la tabla transacción para lectura en la conexión1. Visualizar los datos en la conexion1 y la conexion2. Intenta insertar en ambas conexiones. ¿Qué sucede?. Libera el bloqueo.

70.Bloquear la tabla transacción para escritura. Visualiza los datos en la conexion1 y la conexion2. Intenta insertar un valor en la conexion1 y la conexion2. ¿Qué sucede?. Libera el bloqueo.

71.Vamos a crear tres conexiones contra el servidor MySQL. En la primera creamos un bloqueo de lectura sobre la tabla transacción, en la segunda un bloqueo de escritura y en la tercera un bloqueo de lectura. Consulta los datos en las tres conexiones. ¿Qué sucede?.