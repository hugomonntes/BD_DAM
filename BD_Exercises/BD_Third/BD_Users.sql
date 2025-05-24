-- 2, 4, 7, 8, 9, 10, 11, 15, 18, 19, 20, 22, 23, 24, 27, 28, 30
-- 2. Crea el usuario user1 con clave pass y que pueda conectarse desde la máquina local
CREATE USER user1@localhost IDENTIFIED BY 'pass';

-- 4. Otorga con el usuario user1@localhost permisos de consulta al usuario
-- user1@localhost sobre la tabla emple de la base de datos tema8. ¿Qué ha pasado y
-- por qué?¿Como lo solucionarías?. Solucionalo.
GRANT ALL ON tema8.* TO user1@localhost; -- Solución darle permisos desde otro usuario

-- 7. Cambia la contraseña al usuario user1@localhost a 'password' y reconéctate.
ALTER USER user1@localhost IDENTIFIED BY 'password';

-- 8. Otorga privilegios de consulta a la columna nombre y loc de la taba depart para el
-- usuario user1 desde la maquina local.
GRANT SELECT(nombre, loc) ON tema5.depart TO user1@localhost;

-- 9. Consulta todos los datos disponibles en depart. ¿Qué ha pasado?. Consulta solo los
-- datos a los que se está autorizado. ¿Qué sucede?
SOLO APARECEN LOS DATOS DE LAS CONLUMNAS NOMBRE Y LOC DE LA TABLA DEPART (NO SE PUEDE CONSULTAR CON *)

-- 10.Crea de forma simultánea un usuario, user2, con clave pass2 y que solo puede
-- acceder desde la máquina local y un usuario user3 que puede acceder desde el equipo
-- de un compañero de clase con clave pass3
CREATE USER user2@localhost IDENTIFIED BY 'pass2', user3@"%" IDENTIFIED BY 'pass3';--
CREATE OR REPLACE USER user3@"%" IDENTIFIED BY 'pass3';

-- 11. Permite que user2 tenga todos los privilegios sobre la base de datos tema8 y que
-- user3 tenga los privilegios de consulta e inserción sobre la tabla depart.
GRANT ALL ON tema8.* TO user2@localhost;
GRANT SELECT, INSERT ON tema5.depart TO user3@"%";

-- 15.Conéctate a la base de datos de tu compañero e inserta una fila en su tabla depart y
-- es su tabla emple. ¿Qué sucede?
CREATE OR REPLACE USER invitado@"192.130.0.%" IDENTIFIED BY 'tcpip';
GRANT SELECT ON tema5.depart TO invitado@'%';

-- 18.Renombra los usuarios user2 y user3 a usuario2 y usuario3 con sus correspondientes
-- hosts. Muestra los usuarios de MySQL y comprueba que los cambios se han realizado
-- de forma correcta.
RENAME USER user2@localhost TO usuario2@localhost;
RENAME USER user3@localhost TO usuario3@localhost;

-- 19. Elimina del usuario3 (antes user3) que se conecta desde el equipo de tu compañero la
-- posibilidad de consultar la vista vista.
REVOKE SELECT ON vista FROM usuario3@localhost;

-- 20.Borra este usuario y consulta la tabla de ususarios
DROP USER usuario3@localhost;

-- 22.Añade a usuario2 desde el equipo local la posibilidad de borrar y crear tablas en la
-- base de datos tema8.
GRANT DROP, CREATE ON tema8.* TO usuario2@localhost;

-- 23. Para el usuario2 desde el equipo local, permite que pueda actualizar el valor de la
-- columna jefe de la tabla empleados e insertar en comisión.
GRANT UPDATE(jefe), INSERT(comision) ON tema5.empleados TO usuario2@localhost;

-- 24. Inserta una comisión de 666666 en la tabla empleados de la base de datos tema8.
INSERT INTO tema5.empleados (comision) VALUES (666666);

-- 27. Limita al user1 a tener como mucho dos conexiones simultáneas y comprueba que no
-- se pueden establecer tres conexiones simultáneas.
ALTER USER user1@"%" IDENTIFIED BY 'pass' WITH MAX_USER_CONNECTIONS_PER_HOUR 2;
  
-- 28. Limita al user1 a poder realizar como mucho 10 consultas a la hora y compruébalo.
ALTER USER user1@"%" IDENTIFIED BY 'pass' WITH MAX_QUERIES_PER_HOUR 10;

-- 30. Actualiza los privilegios
FLUSH PRIVILEGES;
