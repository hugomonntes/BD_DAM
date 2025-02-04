-- Los ejercicios se realizarán sobre las tablas empleados y depart del tema 5.
-- 1. Manipulación de datos
-- 1. Añadir el departamento nº 42 que se dedica al desarrollo y está situada
-- en Vigo.
    INSERT INTO DEPART SET IDDEPART = 42, NOMBRE = 'DESARROLLO', LOC = 'VIGO';
-- 2. El departamento 42 ha cambiado su dedicación a enseñanza. Actualiza
-- sus datos.
    UPDATE DEPART SET NOMBRE = 'ENSEÑANZA' WHERE IDDEPART = 42;
-- 3. Aplicar un aumento de sueldo del 10% a todos los empleados del
-- departamento 10.
    UPDATE EMPLEADOS SET SALARIO * 1.10 WHERE IDDEPART = 10;
-- 4. Estamos de crisis. Se le reduce en un 5% a todos los salarios.
    UPDATE EMPLEADOS SET SALARIO * 0.95;
-- 5. Se le aplicara una bonificación de 50€ en el salario a todos aquellos que
-- ganen 1500 o menos.
    UPDATE EMPLEADOS SET SALARIO = SALARIO + 50 WHERE SALARIO <= 1500;
-- 6. Añadir un nuevo departamento: 'Calidad', situado en Noia y con
-- número 50.
    INSERT INTO DEPART SET IDDEPART = 50, NOMBRE = 'CALIDAD', LOC = 'NOIA';
-- 7. Añadir Iglesias como un nuevo presidente en la oficina de calidad con un
-- salario de 6000 y sin comisión. La fecha de alta es la de hoy. Dejar que
-- MySQL especifique de forma automática el código de empleado.
    INSERT INTO EMPLEADOS SET APELLIDO = 'Iglesias', OFICIO = 'Presidente', JEFE = NULL ,SALARIO = 6000 , COMISION = NULL, FECHA_ALT = NOW(), IDDEPART = '50';
-- 8. Reasignar a los empleados del departamento 20 al departamento de calidad.
    UPDATE EMPLEADOS SET IDDEPART = '50' WHERE IDDEPART = '20';
-- 9. La empresa ha cambiado de idea y quiere reasignar a todos los
-- empleados del departamento 50 al departamento 20, a excepción del
-- presidente.
    UPDATE EMPLEADOS SET IDDEPART = '50' WHERE IDDEPART = '20' AND OFICIO != 'PRESIDENTE';
-- 10. El presidente insertado en el punto 7 abandona la empresa. Elimínalo.
    DELETE FROM EMPLEADOS WHERE CODEMP = '15';
-- 11. Se eliminan los empleados del departamento 20 que cobren más de 2000 euros.
    DELETE FROM EMPLEADOS WHERE IDDEPART = '20' AND SALARIO > 2000;
-- 12. Estamos en un ERE y la empresa despide a todos los trabajadores. Elimínalos mediante dos instrucciones distintas. Explica cual es mejor y porque.
    DELETE FROM EMPLEADOS;
    TRUNCATE TABLE EMPLEADOS; --ES MEJOR LA OPCION DEL TRUNCATE YA QUE ELIMINA TODOS DEL GOLPE Y NO VA FILA A FILA
-- 13. La empresa ha conseguido una oferta para realizar un nuevo proyecto.
-- Se vuelven a contratar a todos los trabajadores. Vamos a insertar de
-- nuevo la tabla empleados y la clonamos en la tabla empleados2 (No hay
-- que indicar ningún resultado).
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

        CREATE TABLE EMPLEADOS2 LIKE EMPLEADOS;
-- 14. Actualizamos el código de empleado en empleados2 en 1000 unidades.
    UPDATE EMPLEADOS2 SET CODEMP = CODEMP + 1000;
-- 15. Inserta en empleados2 todos los empleados de la tabla empleados con
-- un código de empleado mayor que 8;
    INSERT INTO EMPLEADOS2 SELECT * FROM EMPLEADOS WHERE CODEMP > 8;
-- 16. Inserta los departamentos publicidad y costes en una única sentencia.
-- Los valores de departamento son 60 y 70, los de ciudad son Ourense y
-- Lugo respectivamente.
    INSERT INTO EMPLEADOS2 (NOMBRE, IDDEPART, LOC) VALUES
    ('PUBLICIDAD', 60, 'OURENSE'),
    ('COSTES', 70, 'LUGO');
-- 17. La dirección de la empresa nos indica que el departamento de costes ha
-- cambiado su nombre a "estudios de mercado" y su localización a
-- Pontevedra. Actualiza su valor sin usar update. ¿Se ha perdido
-- información de algún tipo?. En caso afirmativo indicar el por qué.
    REPLACE INTO DEPART (IDDEPART, NOMBRE, LOC) VALUES (70,'ESTUDIOS DE MERCADO', 'PONTEVEDRA');
-- 18. Elimina todos los empleados de empleados2 con un salario menor que 3000 y mayor que 2000.
    DELETE FROM EMPLEADOS2 WHERE SALARIO < 3000 OR SALARIO > 2000;
-- 19. Asignar a todos los empleados de empleados2 un nuevo jefe con código 5.
    UPDATE EMPLEADOS2 SET JEFE = 5;
-- 20. Despedir a los empleados de empleados2 que tienen comisión.
    DELETE FROM EMPLEADOS2 WHERE COMISION > 0;
-- 21. Hacer constar en la base de datos que el nuevo presidente de la
-- empresa es Susan Calvin y que trabaja en un departamento nuevo con
-- nombre robótica situado en Ferrol. Los demás presidentes dejan la
-- empresa.
    DELETE FROM EMPLEADOS2 WHERE OFICIO = 'Presidente';
    INSERT INTO DEPART (IDDEPART, NOMBRE, LOC) VALUES (
        80, 'ROBOTICA', 'FERROL'
    )
    INSERT INTO EMPLEADOS2(APELLIDO, OFICIO, JEFE) VALUES (
        'Calvin', 'Presidente', 5
    )
-- 22. Pon en una única sentencia el nombre y la localización en minúscula del
-- departamento numero 40.
    UPDATE depart SET NOMBRE = LOWER(NOMBRE), LOC = LOWER(LOC) WHERE IDDEPART = 40;
-- 23. Actualizar el nombre y la localización a minúsculas de las 2 primeras
-- entradas de la tabla depart.
    UPDATE depart SET NOMBRE = LOWER(NOMBRE), LOC = LOWER(LOC) LIMIT 2;
-- 24. Aumenta en 100€ la comisión del empleado que lleve más tiempo en la
-- empresa.
    UPDATE EMPLEADOS2 SET COMISION = COMISION + 100 WHERE FECHA_ALT ORDER BY ASC LIMIT 1;
-- 25. Como premio aumentamos la comisión en 40€ a los dos empleados
-- mas nuevos.
    UPDATE EMPLEADOS2 SET COMISION = COMISION + 40 WHERE FECHA_ALT ORDER BY ASC LIMIT (1, 3);
-- 26. Los dos empleados más veteranos de la tabla empleados2 se jubilan.
-- Elimínalos.
    DELETE FROM EMPLEADOS2 WHERE FECHA_ALT ORDER BY ASC LIMIT 2;
-- 27. Cambia todos los valores NULL en comisión por 0.
    UPDATE EMPLEADOS2 SET COMISION = 0 WHERE COMISION = NULL;
-- 29. Se ha producido un cambio de jefe para los empleados que trabajen en Sevilla y en Madrid. El nuevo jefe tiene como código 8.
    UPDATE EMPLEADOS2 SET JEFE = 8 WHERE IDDEPART = 20 OR IDDEPART = 10;
-- 30. Cambia el salario de los trabajadores del departamento de ventas que
-- cobren menos 2000, a 2000.
    UPDATE EMPLEADOS2 SET SALARIO = 2000 WHERE SALARIO < 2000 AND IDDEPART = 30;
-- 31. Actualiza la fecha de alta a la fecha actual y el número de departamento
-- al departamento Ventas de los empleados cuyo salario sea menor
-- que 2000.
    UPDATE EMPLEADOS2 SET FECHA_ALT = NOW() AND IDDEPART = 70 WHERE SALARIO < 2000;
-- 32. Poner en minúsculas el oficio de todos los empleados de la tabla
-- empleados que tengan un salario menor que la media de salario de los
-- empleados de empleados2.
    SET @media := AVG(SUM(SALARIO));
    UPDATE EMPLEADOS2 SET OFICIO = LOWER(OFICIO) WHERE SALARIO < @media;
-- 33. Añade la columna tipo al final de la tabla empleados 2, con los posibles
-- valores ‘A’,’B’ y ‘C’.
-- 34. Actualiza el tipo de los empleados de la tabla empleados2 a
-- los valores ‘A’ y ‘C’.
-- 35. Hallar los departamentos que no tengan empleados asignados.
-- 36. Poner en minúsculas los dos últimos caracteres de los apellidos de los
-- empleados.
-- 37. Despide a todos los empleados que tengan un director cuyo código
-- termine en 9.
-- 38. Los empleados con el departamento más alto se quedan sin
-- departamento.
-- 39. Para que los empleados disfruten de las vacaciones de semana santa se
-- ha aumentado su comisión en 50 euros para los empleados, 60 para los
-- vendedores, 130 para el presidente y 70 para el resto. Realiza este
-- aumento en una sola consulta teniendo en cuenta los posibles valores
-- nulos.