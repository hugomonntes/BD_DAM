-- TEST DE EXISTENCIA 

EXISTS
NOT EXISTS

SELECT Nombre FROM Pilotos WHERE Escu EXISTS (SELECT * FROM escuderias WHERE Victorias < 100 AND pilotos.escu = escuderias.idEscuderia);
SELECT * FROM empleados AS 'e1' WHERE EXISTS (SELECT * FROM empleados AS 'e2' WHERE e1.iddepart = e2.iddepart GROUP BY e2.iddepart HAVING e1.salario < AVG(e2.salario));

-- Las cláusulas EXISTS y NOT EXISTS se utilizan en consultas SQL para verificar si una subconsulta devuelve filas o no. Se usan generalmente en combinación con WHERE para aplicar condiciones basadas en la existencia de registros en otra tabla.

-- EXISTS
-- Retorna TRUE si la subconsulta devuelve al menos una fila.
-- Si la subconsulta no devuelve filas, retorna FALSE.
-- Se usa cuando queremos verificar si hay datos relacionados en otra tabla.
-- NOT EXISTS
-- Retorna TRUE si la subconsulta NO devuelve filas.
-- Si la subconsulta devuelve al menos una fila, retorna FALSE.
-- Se usa para encontrar registros que no tienen coincidencias en otra tabla.