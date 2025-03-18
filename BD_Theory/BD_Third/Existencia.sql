-- TEST DE EXISTENCIA 

EXISTS
NOT EXISTS

SELECT Nombre FROM Pilotos WHERE Escu EXISTS (SELECT * FROM escuderias WHERE Victorias < 100 AND pilotos.escu = escuderias.idEscuderia);