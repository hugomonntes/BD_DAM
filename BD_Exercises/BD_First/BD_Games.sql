1. SELECT DISTINCT plataforma FROM `juegos`;
2. SELECT * FROM `juegos` WHERE precioAlquiler > 4 AND precioAlquiler < 6;
3. SELECT * FROM `juegos` ORDER BY plataforma, nombre DESC;
4. SELECT nombre, precioVenta FROM `juegos` WHERE precioVenta < 40;
5. SELECT * FROM `juegos` WHERE plataforma = 'PC';
6. SELECT DISTINCT plataforma,precioAlquiler FROM `juegos`;
7. SELECT nombre FROM `juegos` WHERE plataforma = "XBOX" ORDER BY precioVenta ASC LIMIT 1;
8. SELECT id,nombre,precioVenta FROM `juegos` WHERE precioVenta < 20 OR precioVenta > 30 ORDER BY precioVenta ASC;
9. SELECT DISTINCT plataforma FROM `juegos` WHERE precioAlquiler = 4;
10. SELECT nombre FROM `juegos` WHERE stockAlquiler IS NULL;
11. SELECT * FROM `juegos` WHERE plataforma != "PSP" AND precioVenta BETWEEN 20 AND 50 ORDER BY nombre DESC; // SELECT * FROM `juegos` WHERE plataforma IN('xbox', 'pc', 'playstation') AND precioVenta BETWEEN 20 AND 50 ORDER BY nombre DESC;
12. SELECT * FROM `juegos` WHERE precioAlquiler IN(3,5,8);
13. SELECT * FROM `juegos` ORDER BY nombre LIMIT 4,3;
14. SELECT nombre, plataforma FROM `juegos` AS Xogos LIMIT 3;
15. SELECT * FROM `juegos` WHERE nombre NOT LIKE('%&%');
16. SELECT DISTINCT plataforma FROM `juegos` WHERE plataforma LIKE('%P%');
17. SELECT DISTINCT nombre FROM `juegos` WHERE nombre LIKE('M%');
18. SELECT nombre, plataforma FROM `juegos` WHERE nombre LIKE('L%') AND (stockVenta + stockAlquiler) > 10;
19. SELECT nombre FROM `juegos` WHERE nombre LIKE('L_N%') OR nombre LIKE('M_N%');
20. SELECT * FROM `juegos` WHERE (stockVenta BETWEEN 1 AND 10 AND precioVenta NOT BETWEEN 30 AND 40) AND nombre LIKE ('%O%');
21. SELECT * FROM `juegos` WHERE nombre LIKE '_a%' OR nombre LIKE '_e%' OR nombre LIKE '_i%' OR nombre LIKE '_o%' OR nombre LIKE '_u%';
22. SELECT * FROM `juegos` WHERE nombre NOT LIKE '_a%' AND nombre NOT LIKE '_e%' AND nombre NOT LIKE '_i%' AND nombre NOT LIKE '_o%' AND nombre NOT LIKE '_u%';
23. SELECT nombre,@sumaStock := stockAlquiler + stockVenta AS 'Stock Total' FROM `juegos` ORDER BY @sumaStock DESC LIMIT 1;
24. SELECT nombre,precioAlquiler,@tripleAlquiler := precioAlquiler*3 AS 'Alquiler * 3' FROM `juegos`;
25. SELECT nombre,precioVenta,stockVenta,@venta := precioVenta * stockVenta AS 'VENTA' FROM `juegos` ORDER BY stockVenta DESC LIMIT 1; /* CORREGIR ORDER BY */
26. SELECT precioAlquiler , precioVenta, ROUND(@alquilerPesetas := precioAlquiler * 166) AS 'pesetasAlquiler', ROUND(@ventaPesetas := precioVenta * 166) AS 'pesetasVenta' FROM `juegos`;
27. /* X */
28. SELECT nombre, stockVenta FROM `juegos` WHERE stockVenta NOT BETWEEN 8 AND 15;
29. SELECT @stock := stockAlquiler AS 'Stock' FROM `juegos` WHERE id = 6;
30. SET @stock := 4; SELECT * FROM `juegos` WHERE stockAlquiler > @stock;
31. SELECT nombre, precioAlquiler FROM `juegos` WHERE precioAlquiler IS NOT NULL; /* The Dig no tiene que aparecer */
32. SELECT nombre , @stockTotal := IFNULL(stockAlquiler, 0) + IFNULL(stockVenta, 0) AS 'stockTotal' FROM `juegos`;
33. SELECT nombre , @stockTotal := IFNULL(stockAlquiler, 0) + IFNULL(stockVenta, 0) AS 'stockTotal', IF(@stockTotal >= 10, 'Suficiente', 'No suficiente') AS 'Suficiencia' FROM `juegos`;
34. SELECT nombre, IF(stockAlquiler > 0, stockAlquiler, 'No queda stock') AS 'Mensaje' FROM `juegos`;
35. SELECT nombre,@sumaStock := IFNULL(stockAlquiler, 0) + IFNULL(stockVenta, 0) AS 'Stock', IF(@sumaStock >= 10, 'Suficiente', 'No suficiente') AS 'Mensaje' FROM `juegos` ORDER BY @sumaStock DESC LIMIT 5;
36. SELECT nombre, plataforma, IF(plataforma = 'PC', 'Varios', IF(plataforma = 'XBOX', 'Microsoft', IF(plataforma = 'PSP' OR plataforma = 'Playstation', 'Sony', ''))) AS 'Fabricante' FROM `juegos`;
37. SELECT nombre, IF(plataforma = 'PC', 'Ordenador', IF(plataforma = 'XBOX' OR plataforma = 'Playstation', 'Consola', IF(plataforma = 'PSP', 'Consola Portátil', ''))) AS 'Fabricante' FROM `juegos`;
37. SELECT nombre, CASE plataforma WHEN plataforma = 'PC' THEN 'Ordenador' WHEN plataforma = 'Xbox' OR plataforma = 'Playstation' THEN 'Consola' WHEN plataforma = 'PSP' THEN 'Consola Portátil' ELSE '' END FROM `juegos`;
38. SELECT nombre, @beneficio := IFNULL(stockAlquiler, 0) * IFNULL(precioAlquiler, 0) + IFNULL(stockVenta, 0) * IFNULL(precioVenta, 0) AS 'Beneficio', IF(@beneficio > 300, 'Rentable', IF(@beneficio BETWEEN 100 AND 300, 'Rentabilidad Media', 'Rentabilidad Baja')) AS 'Rentabilidad' FROM `juegos`;
