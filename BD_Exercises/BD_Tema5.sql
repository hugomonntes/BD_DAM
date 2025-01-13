1.	SELECT APELLIDO, OFICIO, CODEMP FROM `empleados`;
2.	SELECT IDDEPART, NOMBRE, LOC FROM `depart`;
3.	SELECT * FROM `empleados` ORDER BY APELLIDO;
4.	SELECT * FROM `empleados` ORDER BY IDDEPART DESC;
5.	SELECT * FROM `empleados` ORDER BY IDDEPART DESC, APELLIDO;
6.	SELECT * FROM `empleados` WHERE SALARIO > 2000;
7.	SELECT * FROM `empleados` WHERE OFICIO = 'Analista';
8.	SELECT APELLIDO, OFICIO FROM `empleados` WHERE IDDEPART=20;
9.	SELECT * FROM `empleados` WHERE SALARIO >= 3000 AND IDDEPART !=20 ORDER BY SALARIO, APELLIDO;
10.	SELECT * FROM `empleados` WHERE IDDEPART = 30 AND oficio = 'vendedor' ORDER BY apellido;
11.	SELECT * FROM `empleados` WHERE salario BETWEEN 1000 AND 2000;
12.	SELECT * FROM `empleados` WHERE oficio = 'vendedor' AND comision > 1000;
13.	SELECT CODEMP, APELLIDO FROM `empleados` WHERE apellido LIKE '%Z' AND salario > 1000;
14.	SELECT * FROM `empleados` WHERE oficio = 'empleado' AND salario > 1000 AND IDDEPART = 10;
15.	SELECT APELLIDO FROM `empleados` WHERE comision IS NULL;
16.	SELECT APELLIDO FROM `empleados` WHERE (comision IS NULL OR comision = 0) AND (apellido LIKE 'J%' OR apellido LIKE 'T%');
17.	SELECT APELLIDO, OFICIO FROM `empleados` WHERE oficio IN ('vendedor', 'analista', 'empleado');
18.	SELECT APELLIDO, OFICIO FROM `empleados` WHERE oficio NOT IN ('analista', 'empleado') AND salario > 2000;
19.	SELECT APELLIDO, SALARIO, IDDEPART FROM `empleados` WHERE salario > 2000 AND (IDDEPART = 10 OR IDDEPART = 30);
20.	SELECT APELLIDO, CODEMP FROM `empleados` WHERE SALARIO NOT BETWEEN 1000 AND 2000;
21.	SELECT APELLIDO, IDDEPART  FROM `empleados` WHERE FECHA_ALT < "2011-08-01";
22.	SELECT apellido, BIN(LENGTH(apellido)) AS Binario FROM empleados;
23.	SELECT apellido, LENGTH(apellido) AS longitud FROM empleados ORDER BY LENGTH(apellido) DESC LIMIT 5;
24.	SELECT CONCAT(apellido, ' ', oficio) AS listado FROM empleados;
25.	SELECT * FROM empleados WHERE OFICIO = 'Analista' AND YEAR(FECHA_ALT) = 2011;
26.	SELECT * FROM empleados WHERE YEAR(FECHA_ALT) = 2012;
27.	SELECT * FROM empleados WHERE MONTH(FECHA_ALT) = 3;
28.	SELECT apellido, FECHA_ALT, DATE_FORMAT(FECHA_ALT + INTERVAL 10 YEAR, '%Y-%m-%d') AS "diez_años_mas" FROM empleados;
29. 	SELECT  apellido, (salario + comision) AS cobro FROM empleados WHERE OFICIO IN ('vendedor', 'analista');
   	SELECT apellido, (COALESCE(salario, 0) + COALESCE(comision, 0)) AS cobro FROM empleados WHERE OFICIO IN ('vendedor', 'analista');
30.	SELECT APELLIDO, IFNULL(COMISION, 0) AS 'Comisiones', COALESCE(comision, 0) AS ‘comisiones2’ FROM empleados;
31.	SELECT * FROM empleados WHERE apellido LIKE 'A%' AND YEAR(FECHA_ALT) = 2012;
32.	SELECT apellido, salario * SQRT(5) AS nuevo_salario FROM empleados;
33.	SELECT apellido, FECHA_ALT, DATE_FORMAT(FECHA_ALT, '%W') AS "dia", DAYOFWEEK(FECHA_ALT) AS "nº dia" FROM empleados;
34.	SELECT COUNT(*) AS "nun emple", COUNT(DISTINCT oficio) AS "nun oficios" FROM empleados;
35.	SELECT APELLIDO, GREATEST(codemp,SALARIO, IFNULL(COMISION, 0),IDDEPART) AS "mayor" from empleados;
36.	SELECT  apellido, AES_ENCRYPT(apellido, oficio) AS clave FROM empleados;
37.	SELECT apellido, AES_ENCRYPT(apellido, oficio) AS clave, AES_DECRYPT(AES_ENCRYPT(apellido, oficio), oficio) AS usuario FROM empleados;
38.	SELECT TIME(NOW()) AS "hora", CURRENT_USER() AS "usuario", DATABASE() AS "base de datos";
39.	SELECT REPLACE('hola mundo', 'ola', 'ello') AS “remplazado”;
40.	SELECT MAX(FECHA_ALT) AS "fecha mas alta" FROM empleados;
41.	SELECT apellido, LEFT(apellido, 4) AS "4 carac" FROM empleados;
42.	SELECT FECHA_ALT, DATE_ADD(DATE_ADD(FECHA_ALT, INTERVAL 1 YEAR), INTERVAL 2 MONTH) AS "fecha" FROM empleados;
43.	SELECT LOWER(APELLIDO) AS "minusculas" FROM empleados;
44.	SELECT APELLIDO, SALARIO, FLOOR(SALARIO / 1000) * 1000 AS "miles" FROM empleados;
45.	SELECT * FROM `empleados` WHERE OFICIO LIKE 'Vendedor';
	SELECT * FROM `empleados` WHERE OFICIO = 'Vendedor';
	SELECT * FROM `empleados` WHERE LOCATE(OFICIO,'Vendedor') ;
46.	SELECT * FROM `empleados` WHERE APELLIDO LIKE 'A%';
	SELECT * FROM empleados WHERE SUBSTRING(apellido, 1, 1) = 'A';
47.	SELECT * FROM empleados WHERE apellido LIKE 'F%' OR (oficio LIKE '%E_' AND oficio NOT LIKE '%E');
48.	SELECT * FROM empleados WHERE apellido LIKE 'F%' OR SUBSTRING(oficio, LENGTH(oficio) - 1, 1) = 'E';
49.	SELECT APELLIDO, IDDEPART, HEX(IDDEPART) AS "hexa" FROM empleados;
50.	SELECT GROUP_CONCAT(apellido SEPARATOR ', ') AS apellido, POW(COUNT(*), 3) AS "cubo" FROM empleados;
51.	SELECT apellido, RIGHT(apellido, 3) AS “3carac”, CASE WHEN apellido = REVERSE(apellido) THEN 'Sí' ELSE 'No' END AS palindromo, 
	CASE WHEN RIGHT(apellido, 3) = REVERSE(RIGHT(apellido, 3)) THEN 'Sí' ELSE 'No' END AS "palindromo2" FROM empleados;
52.	SELECT APELLIDO, DATEDIFF(DATE(NOW()), FECHA_ALT) AS "dias", SLEEP(5) AS "dormir" FROM empleados WHERE APELLIDO = 'Arroyo';
53.	SELECT DATEDIFF( (SELECT MAX(FECHA_ALT) FROM empleados), (SELECT MIN(FECHA_ALT) FROM empleados) ) AS "dias";
54.	SELECT apellido FROM empleados WHERE SUBSTRING(apellido, LENGTH(apellido) / 2) LIKE '%E%';
55.	SELECT apellido, STRCMP(binary apellido, UPPER(apellido)) AS "con minuscula" FROM empleados;
56.	SELECT APELLIDO, SALARIO, ROUND(SALARIO,-3) AS “nuevo salario” FROM `empleados`;


CREATE DATABASE IF NOT EXISTS `tema5`;
USE `tema5`;

CREATE TABLE IF NOT EXISTS `empleados` (
`CODEMP` int(4) NOT NULL AUTO_INCREMENT,
`APELLIDO` varchar(15) DEFAULT NULL,
`OFICIO` varchar(10) DEFAULT NULL,
`JEFE` int(4) DEFAULT NULL,
`FECHA_ALT` date DEFAULT NULL,
`SALARIO` int(7) DEFAULT NULL,
`COMISION` int(7) DEFAULT NULL,
`IDDEPART` int(2) NOT NULL,
PRIMARY KEY (`CODEMP`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

INSERT INTO `empleados` (`CODEMP`, `APELLIDO`, `OFICIO`, `JEFE`, `FECHA_ALT`, `SALARIO`, `COMISION`, `IDDEPART`) VALUES
	(2, 'Sanchez', 'Empleado', 5, '2012-12-08', 1040, NULL, 30),
	(3, 'Arroyo', 'Vendedor', 5, '2012-03-08', 1500, 390, 30),
	(4, 'Sala', 'Vendedor', 8, '2012-03-08', 1625, 650, 30),
	(5, 'Jimenez', 'Director', 1, '2011-04-02', 2900, NULL, 20),
	(6, 'Martin', 'Vendedor', 7, '2012-03-08', 1600, 1020, 30),
	(7, 'Negro', 'Director', 1, '2011-05-01', 3005, NULL, 30),
	(8, 'Cerezo', 'Director', 1, '2011-06-09', 13000, NULL, 10),
	(9, 'Gil', 'Analista', 5, '2011-11-09', 3000, NULL, 20),
	(1, 'Rey', 'Presidente', NULL, '2011-11-17', 4100, NULL, 10),
	(10, 'Tovar', 'Vendedor', 7, '2012-03-08', 1350, 0, 30),
	(11, 'Alonso', 'Empleado', 7, '2012-03-08', 1430, NULL, 30),
	(12, 'Jimeno', 'Empleado', 8, '2012-03-08', 1335, NULL, 30),
	(13, 'Fernandez', 'Analista', 5, '2011-12-03', 3000, NULL, 20),
	(14, 'Muñoz', 'Empleado', 7, '2012-01-23', 3000, NULL, 10);


CREATE TABLE IF NOT EXISTS `depart` (
`IDDEPART` int(2) NOT NULL AUTO_INCREMENT,
`NOMBRE` varchar(14) DEFAULT NULL,
`LOC` varchar(14) DEFAULT "No tiene",
PRIMARY KEY (`IDDEPART`)
) ENGINE=MyISAM DEFAULT CHARSET=UTF8;


INSERT INTO `depart` (`IDDEPART`, `NOMBRE`, `LOC`) VALUES
(10, 'Contabilidad', 'Sevilla'),
(20, 'Investigacion', 'Madrid'),
(30, 'Ventas', 'Barcelona'),
(40, 'Produccion', 'Vigo');

