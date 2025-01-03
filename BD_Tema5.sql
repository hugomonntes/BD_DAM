EJERCICIO GRUPAL TEMA5

1. SELECT APELLIDO, OFICIO, CODEMP FROM empleados;
2. SELECT IDDEPART, NOMBRE, LOC FROM `depart`;
3. SELECT * FROM `empleados` ORDER BY APELLIDO;
4. SELECT * FROM `empleados` ORDER BY IDDEPART DESC;
5.
6. SELECT * FROM `

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

