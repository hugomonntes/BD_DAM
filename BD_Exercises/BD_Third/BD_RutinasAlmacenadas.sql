-- 1
DELIMITER $$
CREATE or REPLACE FUNCTION calcularCuadrado(num int) RETURNS double
BEGIN
RETURN num * num;
END $$
DELIMITER ;

--  Crea una función que pasándole una cadena de texto nos devuelva la cadena
--  concatenada con un guion y su longitud (por ejemplo, con la cadena 'hola'
--  devolverá 'hola - 4'). Tendrá que tener el comentario: "Mi primer procedimiento
--  almacenado".
DELIMITER $$
CREATE FUNCTION formatearCadena(cadena varchar(255)) RETURNS varchar(255)
COMMENT "Mi primer procedimiento almacenado"
BEGIN
RETURN CONCAT(cadena,' - ',LENGTH(cadena));
END $$
DELIMITER ;

--  4. Crea el procedimiento, sin parámetros, prueba que nos permita listar todos los
--  empleados de la tabla emple.
DELIMITER $$
CREATE PROCEDURE mostrarEmpleados()
BEGIN
SELECT * FROM tema5.empleados;
END $$
DELIMITER ;

--  5. Muestra todos los procedimientos creados.
SHOW PROCEDURE STATUS;

--  9. Muestra el código de creación del procedimiento prueba.
SHOW CREATE PROCEDURE mostrarEmpleados;

--  11. Modifica el procedimiento prueba para que tenga el comentario "Procedimiento
--  de prueba" y que se ejecute con los permisos del usuario que lo crea.
ALTER PROCEDURE mostrarEmpleados SQL SECURITY DEFINER COMMENT "Procedimiento de prueba";

--  14. Crear un procedimiento que liste un número (pasado como parámetro ) de filas
--  de la tabla emple. El procedimiento se ha de ejecutar con los permisos del
--  usuario que lo invoca.
DELIMITER $$
CREATE PROCEDURE mostrarListaNumeros(IN numFilas INT) 
SQL SECURITY INVOKER
BEGIN 
SELECT * FROM empleados LIMIT numFilas;
END $$
DELIMITER ;

--  15. Crea un procedimiento que devuelva, como parámetro, el máximo salario de la
--  tabla emple.
DELIMITER $$
CREATE PROCEDURE maximoSalarioEmpleados(OUT SALARIO INT) 
BEGIN
SELECT MAX(SALARIO) INTO SALARIO FROM empleados;
END $$
DELIMITER ;

SET @max = 0;
CALL maximoSalarioEmpleados(@max);
SELECT @max;

--  16. Muestra un procedimiento que devuelva, como parámetro, el número de
--  departamentos distintos hay en la tabla emple. El procedimiento se ha de
--  ejecutar con los permisos del usuario que lo crea
DELIMITER $$
CREATE PROCEDURE numeroDepartamentos(OUT numDepart INT)
SQL SECURITY DEFINER
BEGIN
SELECT DISTINCT IDDEPART INTO numDepart FROM empleados;
END $$
DELIMITER ;


--  17. Crea un procedimiento para insertar un nuevo alumno en la tabla alumnos. El
--  procedimiento se ha de ejecutar con los permisos del usuario que lo invoca.
DELIMITER $$
CREATE OR REPLACE PROCEDURE insertarNuevoAlumno(IN nombreAlu VARCHAR(255), IN apellidoAlu VARCHAR(255), IN alturaAlu INT, IN aulaAlu INT)
SQL SECURITY INVOKER
BEGIN
INSERT INTO alumnos(nombre, apellidos, altura, aula) VALUES (nombreAlu, apellidoAlu, alturaAlu, aulaAlu);
SELECT * FROM alumnos;
END $$
DELIMITER ;

CALL insertarNuevoAlumno("Carlos","Costa",194,11);

--  18. Crea una función que pasándole un oficio nos devuelva el número de empleados
--  con ese oficio. Se ha de crear el procedimiento para el usuario root conectado
--  desde la maquina local.
DELIMITER $$

--  19. Crea un procedimiento, que pasándole un oficio, nos devuelva el número de
--  empleados con ese oficio.
DELIMITER $$
CREATE OR REPLACE PROCEDURE contarEmpleadosOficio(IN oficio1 VARCHAR(255), OUT contadorOficios INT) 
BEGIN 
SELECT COUNT(*) INTO contadorOficios FROM empleados WHERE OFICIO = oficio1;
END $$
DELIMITER ;

SET @contador = 0;
CALL contarEmpleadosOficio("Vendedor", @contador);
SELECT @contador;
--  20. Vamos a crear una función determinista que califica el salario de los empleados
--  con una cadena de texto: si el salario es superior o igual 5000 Alto, si es mayor
--  o igual que 3000 pero menor 5000 Medio y bajo en los demás casos. Luego de la
--  definición del procedimiento muestra los datos de los empleados con su salario
--  calificado.
DELIMITER $$
CREATE OR REPLACE FUNCTION calificarSalario(salario INT) RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
IF salario >= 5000 THEN RETURN "Alto";
ELSEIF salario >= 3000 AND salario < 5000 THEN RETURN "Medio";
ELSE RETURN "Bajo";
END IF;
END $$
DELIMITER ;

SELECT calificarSalario(1);

--  21. Crea un procedimiento que busque en la tabla empleados todos los empleados
--  en que sus apellidos cumpla con un patrón.
DELIMITER $$ 
CREATE PROCEDURE buscarPorApellido(INOUT patron VARCHAR(255))
BEGIN
SELECT * FROM empleados WHERE apellido LIKE 'patron';
END $$
DELIMITER ;

--  22. Crea un procedimiento que indicado un empleado le aumente la comisión en un
--  cifra determinada.
DELIMITER $$
CREATE PROCEDURE aumentarComision(IN empleado INT, IN aumento INT)
BEGIN
UPDATE empleados SET salario = salario + aumento WHERE CODEMP = empleado;
END $$
DELIMITER ;


--  23. Crea un función que dado un empleado calcule el número de años que lleva en la
--  empresa.
DELIMITER $ 
CREATE OR REPLACE FUNCTION numeroAños(TRABAJADOR VARCHAR(255)) RETURNS INT
BEGIN
DECLARE Años INT;
SELECT TIMESTAMPDIFF(YEAR, FECHA_ALT, CURRENT_DATE) INTO Años FROM empleados WHERE APELLIDO = TRABAJADOR;
RETURN Años;
END $
DELIMITER ;

SELECT numeroAños('Sanchez');

--  24. Crea un procedimiento que busque en la tabla empleados todos los empleados
--  en que sus apellidos cumpla con un patrón. Además deberá mostrar el número
--  de empleados que cumple el patrón. Ha de tener el comentario de "busca
--  procedimiento".

--  25. Crea un procedimiento que busque en la tabla empleados todos los empleados
--  en que su apellidos cumpla con dos patrones. Si uno de ellos es nulo no se ha de
--  tener en cuenta.
DELIMITER $$
CREATE PROCEDURE buscar(IN patron1 VARCHAR(255), IN patron2 VARCHAR(255))
BEGIN
IF patron1 IS NULL THEN 
SELECT apellido FROM empleados WHERE apellido LIKE 'patron2';
ELSEIF patron2 IS NULL THEN 
SELECT apellido FROM empleados WHERE apellido LIKE 'patron1';
ELSE THEN 
SELECT apellido FROM empleados WHERE apellido LIKE 'patron1' AND apellido LIKE 'patron2';
END IF;
END $$
DELIMITER ;
