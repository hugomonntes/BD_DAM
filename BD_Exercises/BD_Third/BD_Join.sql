 -- 52
SELECT
  empleados.apellido,
  depart.nombre
FROM
  empleados,
  depart
WHERE
  empleados.iddepart = depart.iddepart;

-- 53
SELECT
  empleados.apellido,
  depart.nombre
FROM
  empleados,
  depart
WHERE
  empleados.iddepart = depart.iddepart
  AND depart.nombre != "Ventas";

-- 54
SELECT
  *
FROM
  empleados,
  depart
where
  empleados.iddepart = depart.IDDEPART
  and depart.LOC LIKE 'Madrid';

-- 55 
SELECT
  asignaturas.nombre,
  alumnos.nombre,
  notas.nota
FROM
  asignaturas,
  alumnos,
  notas
WHERE
  asignaturas.COD = alumnos.codigo
  and notas.asignatura = asignaturas.COD;

-- 56
SELECT
  asignaturas.nombre,
  alumnos.nombre,
  alumnos.apellidos
FROM
  asignaturas
  JOIN alumnos
  JOIN notas ON asignaturas.COD = notas.asignatura
  and alumnos.codigo = notas.alumno
WHERE
  asignaturas.nombre like 'FOL';

-- 57
SELECT
  notas.nota
FROM
  asignaturas
  JOIN alumnos
  JOIN notas ON asignaturas.COD = notas.asignatura
  AND alumnos.codigo = notas.alumno
WHERE
  alumnos.nombre like 'Ray';

-- 58 Mostrar el apellido, salario y nombre del departamento de los empleados que tengan
-- el mismo oficio que GIL y que no tengan comisión
SELECT
  empleados.apellido,
  empleados.salario,
  depart.nombre
FROM
  empleados
  JOIN depart USING (iddepart)
WHERE
  empleados.OFICIO = (
    SELECT
      empleados.OFICIO
    FROM
      empleados
    WHERE
      empleados.APELLIDO = "Gil"
      AND empleados.comision IS NULL
  );

-- 59. Calcula la media de los salario de los empleados del departamento de
-- 'CONTABILIDAD'.
SELECT
  AVG(empleados.SALARIO)
FROM
  empleados
  JOIN depart USING (iddepart)
WHERE
  depart.nombre = (
    SELECT
      depart.nombre
    FROM
      depart
    WHERE
      depart.nombre = "Contabilidad"
  );

-- 60. Los empleados que ganan más que cualquier empleado del departamento de ventas.
SELECT
  empleados.apellido
FROM
  empleados
  JOIN depart USING (iddepart)
WHERE
  empleados.salario > ALL (
    SELECT
      empleados.salario
    FROM
      empleados
      JOIN depart USING (iddepart)
    WHERE
      depart.nombre = "Ventas"
  );

-- 61. Listar los datos de los departamentos que tengan empleados así como el número de
-- trabajadores que trabajan en ellos. 
SELECT
  nombre,
  COUNT(empleados.codemp)
FROM
  depart
  JOIN empleados USING (iddepart)
GROUP BY
  depart.iddepart;

-- 62. Seleccionar el salario máximo, el mínimo y el salario medio del departamento
-- ventas.
SELECT
  MAX(empleados.salario),
  MIN(empleados.salario),
  AVG(empleados.salario)
FROM
  empleados
  JOIN depart USING (iddepart)
WHERE
  depart.nombre = "Ventas";

-- 63. Seleccionar nombre, código, salario máximo, salario mínimo y el salario medio de
-- cada departamento.
SELECT
  depart.iddepart,
  depart.nombre,
  MAX(empleados.salario),
  MIN(empleados.salario),
  AVG(empleados.salario)
FROM
  depart
  JOIN empleados USING (iddepart)
GROUP BY
  depart.iddepart,
  depart.nombre;

-- 64. Seleccionar nombre, código, oficio, salario máximo, salario mínimo y el salario
-- medio de cada departamento por oficios. Compara el resultado con la consulta
-- anterior. ¿Qué habría que añadir si queremos listar solo los que tienen un salario
-- máximo menor que 2000 euros?.
SELECT
  depart.iddepart,
  depart.nombre,
  empleados.oficio,
  MAX(empleados.salario),
  MIN(empleados.salario),
  AVG(empleados.salario)
FROM
  depart
  JOIN empleados USING (iddepart)
GROUP BY
  empleados.oficio
ORDER BY
  nombre;

-- 64B
SELECT
  depart.iddepart,
  depart.nombre,
  empleados.oficio,
  MAX(empleados.salario),
  MIN(empleados.salario),
  AVG(empleados.salario)
FROM
  depart
  JOIN empleados USING (iddepart)
GROUP BY
  empleados.oficio
HAVING
  MAX(empleados.salario) > 2000
ORDER BY
  nombre;

-- 65. Mostrar los datos del empleado que tiene el salario más alto en el departamento de
-- 'VENTAS'
SELECT
  *
FROM
  depart
  JOIN empleados USING (iddepart)
WHERE
  Nombre = "Ventas"
ORDER BY
  salario DESC
LIMIT
  1;

-- 66. Mostrar el departamento con más empleados
SELECT
  depart.NOMBRE,
  COUNT(*) AS "totalEmpleados"
FROM
  depart
  JOIN empleados USING (iddepart)
GROUP BY
  depart.IDDEPART
ORDER BY
  totalEmpleados DESC
LIMIT
  1;

-- 68. Muestra el apellido de los empleados junto al nombre de su departamento.
SELECT
  empleados.APELLIDO,
  depart.NOMBRE
FROM
  depart
  JOIN empleados USING (iddepart);

-- 69. Muestra el apellido de los empleados junto al nombre de su departamento de los
-- empleados que trabajen en el departamento 30.
SELECT
  empleados.APELLIDO,
  depart.NOMBRE
FROM
  depart
  JOIN empleados USING (iddepart)
WHERE
  depart.IDDEPART = 30;

-- 70. Muestra el apellido de los empleados junto al nombre de su departamento,
-- incluyendo aquellos que no tienen departamento asignado.
SELECT
  empleados.APELLIDO,
  depart.NOMBRE
FROM
  depart
  JOIN empleados USING (iddepart);

-- 71. Muestra los nombres de los departamentos junto con los usuarios que lo forman
-- aunque no tengas empleados asociados.
SELECT
  depart.NOMBRE,
  empleados.APELLIDO
FROM
  depart
  JOIN empleados USING (iddepart)
GROUP BY
  depart.NOMBRE,
  empleados.APELLIDO;

-- 72. Mostrar los nombres de los alumnos, el nombre de la asignatura y su nota siempre
-- que esta sea mayor que 5.
SELECT
  alumnos.nombre AS nombre_alumno,
  asignaturas.nombre AS nombre_asignatura,
  notas.NOTA
FROM
  notas
  JOIN alumnos ON notas.alumno = alumnos.codigo
  JOIN asignaturas ON notas.asignatura = asignaturas.codigo
WHERE
  notas.NOTA > 5;

-- 73. Obtener el nombre del departamento donde trabaja el empleado con el salario más
-- alto
SELECT
  depart.NOMBRE
FROM
  depart
  JOIN empleados USING (iddepart)
ORDER BY
  empleados.SALARIO DESC
LIMIT
  1;
