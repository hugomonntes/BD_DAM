1. Muestra los puntos como el número entero superior al valor obtenido.
    SELECT nombre, Ceil(puntos) FROM `jugadores`;
2. Obtén el valor entero inmediatamente inferior de los minutos jugados.
    SELECT nombre, floor(Minutos) FROM `jugadores`;
3. Haya el número de valoraciones distintas.
    SELECT COUNT(DISTINCT Valoracion) FROM `jugadores`;
4. Calcula en la misma sentencia tres valores aleatorios.
    SELECT RAND() AS 'Aleatorio 1',RAND() AS 'Aleatorio 2',RAND() AS 'Aleatorio 3' FROM `jugadores` LIMIT 1;
5. Redondea con dos decimales el valor de minutos de los jugadores.
    SELECT ROUND(Minutos, 2) FROM `jugadores`;
6. Trunca un número aleatorio a tres decimales.
    SELECT TRUNCATE(RAND(), 3) FROM `jugadores` LIMIT 1;
7. Obtener el nombre, los minutos y el entero superior a los minutos de los jugadores.
    SELECT nombre, minutos, Ceil(Minutos) FROM `jugadores`;
8. La siguiente lista son los posibles dorsales de los jugadores: 33, 32, 44, 22, 24, 42, 34, 4, 25 y 19. Como escogerías el dorsal más alto, y el más bajo.
    SELECT GREATEST(33, 32, 44, 22, 24, 42, 34, 4, 25, 19), LEAST(33, 32, 44, 22, 24, 42, 34, 4, 25, 19) FROM `jugadores` LIMIT 1;
9. Obtén de dos formas diferentes los jugadores que tengan un cinco como parte entera de los rebotes.
    SELECT nombre, rebotes, floor(Rebotes) AS 'Forma 1', TRUNCATE(Rebotes, 0) AS 'Forma 2' FROM 'jugadores' WHERE Rebotes >= 5 AND Rebotes < 6;
10. Como se podría dada una lista devolver el primer valor no nulo. Pon un ejemplo.
    SELECT COALESCE(NULL, NULL, 3, 5) AS 'Valor no nulo';
11. Calcula el valor medio de todos los partidos jugados y el número de jugadores que los han jugado.
    SELECT AVG(Partidos) AS 'Media', COUNT(Nombre) AS 'Total' FROM `jugadores`;
12. Haya la suma de los partidos así como el mayor número de partidos y el menor.
    SELECT SUM(Partidos) AS 'Partidos Totales', MAX(Partidos) AS 'MAX', MIN(Partidos) AS 'MIN' FROM `jugadores`;
13. Obtén con un con redondeo a 2 decimales el mayor de los siguientes valores de los jugadores: puntos/5, rebotes/2 o asistencias.
    SELECT ROUND(GREATEST(Puntos/5, Rebotes/2, Asistencias), 2) AS 'Mayor' FROM `jugadores`;
14. Obtén el nombre de los jugadores en mayúsculas, el numero de caracteres que tiene su nombre y los 5 primeros caracteres de su nombre.
    SELECT UPPER(Nombre) AS 'Mayúsculas', CHAR_LENGTH(Nombre) AS 'Nº Char Nombre', LEFT(Nombre, 5) AS '5 Primeros Chars' FROM jugadores;
15. Haya la representación en binario de la longitud del nombre de los jugadores.
     SELECT BIN(CHAR_LENGTH(Nombre)) AS 'Nº Char Nombre Binario' FROM jugadores;
16. Devuelve en una única columna la cadena "El jugador " junto el nombre del jugador y la cadena al final "jugó en los Lakers":
    SELECT CONCAT("EL jugador ", Nombre, " jugó en los Lakers" ) FROM jugadores;
17. Devuelve los nombres de los jugadores con las "as" substituidas por 1 y los espacios por guiones bajos.
    SELECT REPLACE(REPLACE (Nombre,'a','1'), ' ', '_') AS 'NOMBRE CAMBIADO' FROM `jugadores`;
18. Devuelve los jugadores cuya segunda letra del nombre sea igual a la penúltima.
    SELECT Nombre, substring(Nombre,2,1), substring(Nombre, -2,1) FROM `jugadores` WHERE substring(Nombre,2,1)=substring(Nombre, -2, 1);
19. Obtén la fecha y hora actual
    SELECT CURRENT_DATE() ,NOW();
20. Obtén el nombre del día, mes y el año de la fecha actual.
    SELECT DAYNAME(NOW()) AS 'NOMBRE DIA ACTUAL', MONTH(NOW()) AS 'MES ACTUAL', YEAR(NOW()) AS 'AÑO ACTUAL';
21. Consigue por separado las horas, minutos y segundos actuales.
    SELECT HOUR(NOW()), MINUTE(NOW()), SECOND(NOW());
22. Obtén la fecha actual y la fecha actual más un día.
    SELECT NOW(), DATE_ADD(NOW(), INTERVAL 1 DAY);
23. Obtén la fecha actual con el siguiente formato: Hoy es el día [día] de mes [mes] del año [año].
    SELECT DATE_FORMAT(NOW(), "Hoy es el día %d de mes %M del año %y");
    SELECT CONCAT('Hoy es el dia ', DAY(NOW()), ' del mes ', MONTH(NOW()), ' del año ', YEAR(NOW())) AS 'FECHA';
24. Obtén la hora actual con el siguiente formato: la hora es [hora] y los minutos [minutos].
    SELECT DATE_FORMAT(CURRENT_TIME(), "Hora %h y minuto %i");
    SELECT CONCAT('La hora es ', HOUR(NOW()), ' y los minutos ', MINUTE(NOW())) AS 'HORAS Y MINUTOS';
25. Compara las cadenas "abcdef" y "abcDEF" de forma sensible y no sensible al caso.
    SELECT BINARY "abcdef" = "abcDEF", "abcdef" = "abcDEF";
26. Ejecuta la sentencia: SELECT BENCHMARK(100000000,ENCODE('Hola','Adios')); ¿Qué indica el resultado?.
    SELECT BENCHMARK(100000000,ENCODE('Hola','Adios')); (La consulta tardó 8,1720 segundos.)
27. Obtén el identificador de conexión actual, el usuario actual y el numero de filas obtenidas en la última sentencia select.
    SELECT CURRENT_USER(), FOUND_ROWS();
28. Cifra el nombre del jugador como si fuese una contraseña mediante aes.
    SELECT AES_ENCRYPT(Nombre, '1234') FROM jugadores;
29. Descifra el nombre del jugador cifrado mediante aes.
    SELECT AES_DECRYPT(AES_ENCRYPT(Nombre, '1234'), '1234') FROM jugadores;
30. Comprueba que resultado obtienes cuando descifras mediante aes con la contraseña equivocada.
    SELECT AES_DECRYPT(AES_ENCRYPT(Nombre, '1234'), '0') FROM jugadores; (Devuelve NULL)
31. Formatea el numero 45345234.435 a 4 decimales.
    SELECT FORMAT(45345234.435, 4);


    
