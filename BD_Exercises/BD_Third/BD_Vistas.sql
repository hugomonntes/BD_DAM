 -- 31,32,33,34,35,36,39,,40,42,43,45,47,49,53,55
-- 31.Crea una vista con nombre ed que muestre toda la información de la tabla empleados
-- relacionada con la información de la tabla departamentos.
CREATE VIEW
  ed AS
SELECT
  *
FROM
  empleados
  JOIN depart USING (iddepart);

-- 32. Muestra a partir de la vista creada en el ejercicio anterior las siguientes columnas: el
-- apellido de los empleados, su oficio y el nombre del departamento al que pertenecen.
SELECT
  apellido,
  oficio,
  nombre
FROM
  ed;

-- 33. Modifica la vista ed con replace para que tenga las columnas: apellido, oficio y
-- nombre del departamento cambiando sus nombres a los siguientes: nombre, oficio y
-- departamento.
CREATE OR REPLACE VIEW
  ed (nombre, oficio, departamento) AS
SELECT
  apellido,
  oficio,
  nombre
FROM
  empleados
  JOIN depart USING (iddepart);

-- 34.A partir de la vista anterior define la vista ed2 que muestre el nombre del empleado y
-- el nombre del departamento.
CREATE OR REPLACE VIEW
  ed2 AS
SELECT
  NOMBRE,
  departamento
FROM
  ed;

-- 35. Elimina la vista ed.
DROP VIEW
  ed;

-- 36.Consulta los datos de la vista ed2. ¿Que sucede?.
SELECT
  *
FROM
  ed2;

-- 37.Vuelve a crear la vista ed (la misma que en el ejercicio 33) para que solo posea los
-- campos apellido como nombre, oficio y el nombre del departamento cono
-- departamento.
CREATE OR REPLACE VIEW
  ed (nombre, oficio, departamento) AS
SELECT
  apellido,
  oficio,
  nombre
FROM
  empleados
  JOIN depart USING (iddepart);

-- 38.Vuelve a consultar los datos de la vista ed2. ¿Qué sucede ahora?.
SELECT
  *
FROM
  ed2;

-- 39.Crea la vista notas_asig_alu que relacione los alumnos con sus asignaturas y notas.
CREATE OR REPLACE VIEW
  notas_asig_alu AS
SELECT
  alumno,
  asignatura,
  nota,
  fecha,
  alumnos.nombre,
  codigo,
  apellidos,
  altura,
  aula,
  cod,
  asignaturas.nombre AS NOME
FROM
  asignaturas
  JOIN alumnos
  JOIN notas on asignaturas.COD = notas.asignatura
  and alumnos.codigo = notas.alumno;

-- 40.Consulta los datos de la vista notas_asig_alu
SELECT
  *
FROM
  notas_asig_alu;

-- 42. Muestra la sentencia de creación de la vista notas_asig_alu.
SHOW CREATE VIEW
  notas_asig_alu;

-- 43.Crea la vista notasAlu a partir de la vista notas_asig_alu que muestre los
-- siguientes campos: el nombre como nombre, la asignatura como materia y la nota
-- como calificación de aquellos alumnos que han aprobado. 
CREATE VIEW
  notasAlu (nombre, materia, calificaciones) AS
SELECT
  nombre,
  asignatura,
  nota
FROM
  notas_asig_alu
WHERE
  nota >= 5;

-- 45. Modifica la vista notasAlu con alter view y añádele el campo Apellido.
ALTER VIEW
  notasAlu AS
SELECT
  (nombre, asignatura, nota, apellidos)
FROM
  notas_asig_alu;

-- 47.Crea la vista salarios que muestre el apellido y la localización de los empleados
-- que tienen salario mayor que 1200 menos los que tienen comisión mayor que 100.
CREATE VIEW
  salarios (apellido, localización) AS
SELECT
  apellido,
  loc
FROM
  empleados
  JOIN depart USING (IDDEPART)
WHERE
  salario > 1200
  AND ifnull(comision, 0) < 100;

-- 49.Crea la vista empleados que muestra los departamentos de los empleados. ¿Qué sucede?
CREATE VIEW
  empleados (empleado, departamentos) AS
SELECT
  apellido,
  nombre
FROM
  empleados
  JOIN depart USING (iddepart);
-- no se puede crear una vista con el nombre de la tabla ya creada

-- 53.Crea la vista led que relacione los usuarios con sus departamentos 
-- incluyendo los departamentos que no tengan usuarios asignados. Consulta los datos que contiene.
CREATE VIEW
  led AS
SELECT
  *
FROM
  empleados
  JOIN depart USING (IDDEPART);