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
  JOIN notas on asignaturas.COD = notas.asignatura
  and alumnos.codigo = notas.alumno
WHERE
  alumnos.nombre like 'Ray';