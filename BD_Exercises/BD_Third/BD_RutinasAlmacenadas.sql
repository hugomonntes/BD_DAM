-- 1. Crea una función que calcule el cuadrado de un número.
DELIMITER $$
CREATE or REPLACE FUNCTION calcularCuadrado(num int) RETURNS double
BEGIN
RETURN num * num;
END $$
DELIMITER ;
-- 2. Crea una función que pasándole una cadena de texto nos devuelva la cadena
-- concatenada con un guion y su longitud (por ejemplo, con la cadena 'hola'
-- devolverá 'hola - 4'). Tendrá que tener el comentario: "Mi primer procedimiento
-- almacenado".