37. Listar los apellidos que tienen exactamente 6 caracteres.
    SELECT APELLIDO FROM `empleados` WHERE LENGTH(apellido) = 6;
38. Calcular la fecha de alta más antigua truncada al formato 'Año-Mes-Día'.
    SELECT DATE_FORMAT(MIN(FECHA_ALT), '%Y-%m-%d') FROM `empleados`;
39. Mostrar la longitud del apellido más corto.
    SELECT MIN(LENGTH(apellido)) FROM `empleados`;
40. Obtener los apellidos y sus comisiones truncadas al número entero inferior.
    SELECT APELLIDO, FLOOR(COMISION) FROM `empleados`;
41. Mostrar los empleados cuyo apellido termina con las letras 'ez'.
    SELECT * FROM `empleados` WHERE apellido LIKE '%ez';
42. Concatenar el apellido con los primeros 3 caracteres del oficio.
    SELECT CONCAT(APELLIDO,'', SUBSTRING(OFICIO, 1, 3)) FROM `empleados`;
43. Mostrar el total de días transcurridos desde la fecha de alta de cada empleado.
    SELECT APELLIDO, DATEDIFF(CURDATE(), FECHA_ALT) FROM empleados;
44. Listar los apellidos de los empleados que no tienen jefe asignado.
    SELECT APELLIDO FROM `empleados` WHERE JEFE IS NULL;
45. Determinar los empleados con las comisiones más altas redondeadas al centenar.
    SELECT APELLIDO, ROUND(COMISION, 2) FROM `empleados` ORDER BY comision DESC LIMIT 1;
46. Extraer los últimos cuatro caracteres de los apellidos de los empleados.
47. Obtener el promedio de los salarios truncado a un decimal.
48. Obtener los primeros tres caracteres del apellido de los empleados.
49. Determinar cuántos empleados tienen comisiones nulas.
50. Mostrar el apellido y el día de la semana en que cada empleado fue contratado.
51. Comparar alfabéticamente dos apellidos seleccionados.
52. Mostrar los salarios redondeados hacia abajo a la centena más cercana.
53. Determinar los apellidos que tienen una 'a' en la segunda posición.
54. Mostrar los apellidos de los empleados cuyo salario sea el más bajo truncado a dos
decimales.
