-- 40. Seleccionar los empleados cuyo salario sea menor que la media de su departamento.
SELECT * FROM empleados AS 'e1' WHERE EXISTS (SELECT * FROM empleados AS 'e2' WHERE e1.iddepart = e2.iddepart GROUP BY e2.iddepart HAVING e1.salario < AVG(e2.salario));
-- 41. Empleados que no son jefes de algún otro empleado.
SELECT * FROM empleados AS 'e1' WHERE EXISTS (SELECT * FROM empleados AS 'e2' WHERE e1.IDDEPART = e2.IDDEPART HAVING e1.JEFE IS NOT NULL);
-- 42. Empleados que son jefes de algún empleado que cobre más de 3000€.
SELECT * FROM empleados AS e1 WHERE EXISTS (SELECT * FROM empleados AS e2 WHERE e1.IDDEPART = e2.IDDEPART HAVING e1.JEFE IS NULL AND SALARIO > 3000);
-- 43. Obtén la nota más alta.
SELECT * FROM alumnos AS alumn WHERE EXISTS (SELECT * FROM notas AS nota WHERE alumn.codigo = nota.alumno ORDER BY notas DESC LIMIT 1);
-- 44. Listar las asignaturas que tienen alumnos y que contengan en su nombre la cadena “os”.
-- 45. Obtener las asignaturas que no tienen alumnos ordenadas por código descendentemente.