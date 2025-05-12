SELECT * FROM ALUMNOS, TELF; --PRODUCTO CARTESIANO (PREGUNTA DE EXAMEN)
SELECT empleados.apellido, depart.nombre FROM empleados, depart WHERE empleados.iddepart = depart.iddepart;
SELECT empleados.apellido, depart.nombre FROM empleados, depart WHERE empleados.iddepart = depart.iddepart AND depart.nombre != "Ventas";
SELECT * FROM empleados, depart where empleados.iddepart = depart.IDDEPART and depart.LOC LIKE 'Madrid';

-- JOIN (COMBINACIÓN DE TABLAS)
SELECT empleados.apellido, depart.nombre FROM empleados JOIN depart ON empleados.iddepart = depart.iddepart WHERE nombre != "Ventas";
SELECT empleados.apellido, depart.nombre FROM empleados JOIN depart USING(iddepart);

-- NATURAL JOIN
SELECT empleados.apellido, depart.nombre FROM empleados NATURAL JOIN depart; --Ya iguala automaticacmente por la clave IGUAL

-- OUTER JOIN (ESCOGER TODOS LOS VALORES DE LA TABLA DE LA DERECHA O IZQUIERDA)
SELECT * FROM alumnos LEFT JOIN telf; -- CON LEFT LA TABLA DE LA IZQUIERDA PONE TODOS LOS VALORES
SELECT * FROM alumnos NATURAL RIGHT JOIN telf; -- CON RIGHT LA TALBA DE LA DERECHA PONDRÍA TODOS SUS VALORES