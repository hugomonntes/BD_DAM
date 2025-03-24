SELECT * FROM ALUMNOS, TELF; --PRODUCTO CARTESIANO (PREGUNTA DE EXAMEN)
SELECT empleados.apellido, depart.nombre FROM empleados, depart WHERE empleados.iddepart = depart.iddepart;
SELECT empleados.apellido, depart.nombre FROM empleados, depart WHERE empleados.iddepart = depart.iddepart AND depart.nombre != "Ventas";
SELECT * FROM empleados, depart where empleados.iddepart = depart.IDDEPART and depart.LOC LIKE 'Madrid';