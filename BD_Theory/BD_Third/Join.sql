SELECT * FROM ALUMNOS, TELF; --PRODUCTO CARTESIANO (PREGUNTA DE EXAMEN)
SELECT empleados.apellido, depart.nombre FROM empleados, depart WHERE empleados.iddepart = depart.iddepart;
SELECT empleados.apellido, depart.nombre FROM empleados, depart WHERE empleados.iddepart = depart.iddepart AND depart.nombre != "Ventas";
SELECT * FROM empleados, depart where empleados.iddepart = depart.IDDEPART and depart.LOC LIKE 'Madrid';

-- JOIN (COMBINACIÓN DE TABLAS)
SELECT * FROM tabla1 JOIN tabla2 ON tabla1.id = tabla2.id WHERE nombre != "Ventas";
SELECT * FROM tabla1 JOIN tabla2 USING(id);