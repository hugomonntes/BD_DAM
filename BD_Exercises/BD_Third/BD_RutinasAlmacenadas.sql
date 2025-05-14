## 1. Crea una función que calcule el cuadrado de un número.

DELIMITER $$
CREATE or REPLACE FUNCTION calcularCuadrado(num int) RETURNS double
BEGIN
RETURN num * num;
END $$
DELIMITER ;

# Crea una función que pasándole una cadena de texto nos devuelva la cadena
# concatenada con un guion y su longitud (por ejemplo, con la cadena 'hola'
# devolverá 'hola - 4'). Tendrá que tener el comentario: "Mi primer procedimiento
# almacenado".
DELIMITER $$
CREATE FUNCTION formatearCadena(cadena varchar(255)) RETURNS varchar(255)
COMMENT "Mi primer procedimiento almacenado"
BEGIN
RETURN CONCAT(cadena,' - ',LENGTH(cadena));
END $$
DELIMITER ;

# 4. Crea el procedimiento, sin parámetros, prueba que nos permita listar todos los
# empleados de la tabla emple.
DELIMITER $$
CREATE PROCEDURE mostrarEmpleados()
BEGIN
SELECT * FROM tema5.empleados;
END $$
DELIMITER ;

# 5. Muestra todos los procedimientos creados.
SHOW PROCEDURE STATUS;

# 9. Muestra el código de creación del procedimiento prueba.
SHOW CREATE PROCEDURE mostrarEmpleados;

# 11. Modifica el procedimiento prueba para que tenga el comentario "Procedimiento
# de prueba" y que se ejecute con los permisos del usuario que lo crea.
ALTER PROCEDURE mostrarEmpleados SQL SECURITY DEFINER COMMENT "Procedimiento de prueba";

# 14. Crear un procedimiento que liste un número (pasado como parámetro ) de filas
# de la tabla emple. El procedimiento se ha de ejecutar con los permisos del
# usuario que lo invoca.
DELIMITER $$
CREATE PROCEDURE 