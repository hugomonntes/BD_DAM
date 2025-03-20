-- TEST DE EXISTENCIA 

EXISTS
NOT EXISTS

SELECT Nombre FROM Pilotos WHERE Escu EXISTS (SELECT * FROM escuderias WHERE Victorias < 100 AND pilotos.escu = escuderias.idEscuderia);
SELECT * FROM empleados AS 'e1' WHERE EXISTS (SELECT * FROM empleados AS 'e2' WHERE e1.iddepart = e2.iddepart GROUP BY e2.iddepart HAVING e1.salario < AVG(e2.salario));