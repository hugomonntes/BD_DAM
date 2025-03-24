SELECT * FROM ALUMNOS, TELF; --PRODUCTO CARTESIANO (PREGUNTA DE EXAMEN)
SELECT empleados.apellido, depart.nombre FROM empleados, depart WHERE empleados.iddepart = depart.iddepart;
SELECT empleados.apellido, depart.nombre FROM empleados, depart WHERE empleados.iddepart = depart.iddepart AND depart.nombre != "Ventas";
SELECT * FROM empleados, depart where empleados.iddepart = depart.IDDEPART and depart.LOC LIKE 'Madrid';

-- JOIN (COMBINACIÓN DE TABLAS)
SELECT empleados.apellido, depart.nombre FROM empleados JOIN depart ON empleados.iddepart = depart.iddepart WHERE nombre != "Ventas";
SELECT empleados.apellido, depart.nombre FROM empleados JOIN depart USING(iddepart);