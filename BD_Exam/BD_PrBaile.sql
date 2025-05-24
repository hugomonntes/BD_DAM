--  1.
--  Muestra los nombres de los participantes, el nombre del evento al que asisten y el nombre del tipo de baile.
SELECT
  participantes.nombre AS 'Nombre Participante',
  eventos.nombre AS 'Nombre Evento',
  tipos_baile.nombre AS 'Tipo Baile'
FROM
  participantes
  JOIN eventos ON participantes.id_evento = eventos.id_evento
  JOIN tipos_baile ON participantes.id_baile = tipos_baile.id_baile;

--  2.
--  Lista los nombres y apellidos de los participantes que están registrados en eventos donde se baila “Salsa”.
SELECT
  participantes.nombre,
  participantes.apellido
FROM
  participantes
  JOIN eventos ON participantes.id_evento = eventos.id_evento
  JOIN tipos_baile ON participantes.id_baile = tipos_baile.id_baile
WHERE
  tipos_baile.nombre = "Salsa";

--  3.
--  ¿Cuántos participantes hay registrados por cada tipo de baile? Muestra el nombre del baile y la cantidad.
SELECT
  tipos_baile.nombre,
  COUNT(participantes.id_participante)
FROM
  tipos_baile
  JOIN participantes USING (id_baile)
GROUP BY
  tipos_baile.nombre;

--  4.
--  Muestra los eventos que se celebran en Barcelona y tienen un precio mayor a 10 euros.
SELECT
  eventos.nombre
FROM
  eventos
WHERE
  ciudad LIKE "Barcelona"
  AND precio > 10;

--  5.
--  Lista todos los tipos de baile que no requieren pareja y tienen una popularidad mayor o igual a 8.
--  6.
--  Crea una vista llamada v_participantes_eventos que muestre: nombre, apellido, evento, ciudad y tipo de baile de cada participante.
CREATE VIEW
  v_participantes_eventos AS
SELECT
  participantes.nombre,
  participantes.apellido,
  eventos.nombre,
  eventos.ciudad,
  tipos_baile.nombre
FROM
  participantes
  JOIN eventos ON participantes.id_baile = eventos.id_baile;
  JOIN tipos_baile ON participantes.id_baile = tipos_baile.id_baile;
--  7.
--  Crea un procedimiento almacenado llamado añadir_participante que reciba: nombre, apellido, edad, email, evento y baile, y lo inserte en la tabla participantes.
DELIMITER $$ 
CREATE PROCEDURE añadirParticipante (IN nombre1 VARCHAR(255), IN apellido1 VARCHAR(255), IN edad1 INT, IN email1 VARCHAR(255), IN evento INT, IN baile INT)
BEGIN 
INSERT INTO eventos_baile.participantes(nombre, apellido, edad, email, id_evento, id_baile) VALUES (nombre1, apellido1, edad1, email1, evento, baile);
END $$
DELIMITER ;

CALL añadirParticipante("Fran", "Rojas", 32, "f@fukin.pro", 2, 2);
--  8.
--  Escribe una transacción que registre un nuevo evento y un participante dentro del mismo bloque, y que se cancele todo si hay error.
START TRANSACTION;

--  9.
--  Muestra los participantes que tienen nivel de experiencia “Avanzada” y bailan “Tango”.
SELECT * FROM participantes JOIN tipos_baile USING(id_baile) WHERE experiencia = "Avanzada" AND tipos_baile.nombre = "Tango";
--  10.
--  Crea un nuevo usuario llamado lector_baile con contraseña baile123, que solo tenga permisos de lectura sobre todas las tablas.
CREATE USER lector_baile IDENTIFIED BY "baile123";
GRANT SELECT ON eventos_baile.* TO lector_baile;
--  11.
--  Modifica los permisos del usuario lector_baile para que también pueda ver las vistas (SELECT sobre todas las vistas existentes).
--  12.
--  Bloquea la tabla participantes para que ningún otro usuario pueda escribir mientras tú haces una modificación.
--  13.
--  Escribe una consulta que muestre el número total de eventos por ciudad.
--  14.
--  Muestra todos los eventos donde participan personas de 30 años o más.
--  15.
--  Elimina todos los participantes cuyo nivel de experiencia sea “Ninguna” y no tengan email registrado.