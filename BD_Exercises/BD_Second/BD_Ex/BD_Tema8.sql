--1
SELECT OFICIO, COUNT(*) AS 'NUM' FROM 'EMPLEADOS' GROUP BY OFICIO ORDER BY NUM DESC;
--2
SELECT COUNT(alumno), asignatura FROM notas GROUP BY asignatura;
--3
SELECT alumno, AVG(NOTA) FROM notas GROUP BY alumno;
--4
SELECT OFICIO FROM empleados GROUP BY OFICIO HAVING COUNT(*) > 2;
--5
SELECT IDDEPART FROM EMPLEADOS GROUP BY IDDEPART HAVING COUNT(*) > 3;
--6
SELECT alumno, AVG(nota) as 'media' FROM `notas`GROUP by alumno HAVING media > 5.7 order by media asc;
--7
SELECT OFICIO, SUM(SALARIO) FROM `empleados` GROUP by OFICIO;
--8
SELECT OFICIO, SUM(SALARIO) FROM `empleados` GROUP by OFICIO order by SUM(SALARIO) DESC LIMIT 1;
--9
SELECT OFICIO, AVG(SALARIO) as 'mediaSalario' FROM empleados GROUP by OFICIO HAVING mediaSalario >2000;
--10
SELECT IDDEPART, SUM(SALARIO) as 'suma', MAX(SALARIO) as 'maximo', MIN(SALARIO) as 'minimo' FROM `empleados` GROUP by IDDEPART;
--11
SELECT IDDEPART, COUNT(*) FROM `empleados` WHERE OFICIO = 'empleado' GROUP BY IDDEPART; --Si ya hay group by utilizas having si aun no agrupaste utilizas where antes.
--12
SELECT OFICIO, IDDEPART, COUNT(*) as 'nº empelados', SUM(salario) as 'suma salarios' FROM `empleados` GROUP by OFICIO, IDDEPART;
--13
SELECT IDDEPART, OFICIO, COUNT(*) as 'numero' FROM `empleados`GROUP by OFICIO, IDDEPART HAVING numero>2;
--14
SELECT IDDEPART, COUNT(DISTINCT OFICIO) as 'numero' FROM `empleados` GROUP BY IDDEPART;
--15
