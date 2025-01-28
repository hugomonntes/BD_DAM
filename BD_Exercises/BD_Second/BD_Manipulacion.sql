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
-- 6. Añadir un nuevo departamento: 'Calidad', situado en Noia y con
-- número 50.
-- 7. Añadir Iglesias como un nuevo presidente en la oficina de calidad con un
-- salario de 6000 y sin comisión. La fecha de alta es la de hoy. Dejar que
-- MySQL especifique de forma automática el código de empleado.
-- 8. Reasignar a los empleados del departamento 20 al departamento de
-- calidad.
-- 9. La empresa ha cambiado de idea y quiere reasignar a todos los
-- empleados del departamento 50 al departamento 20, a excepción del
-- presidente.
-- 10. El presidente insertado en el punto 7 abandona la empresa. Elimínalo.
-- 11. Se eliminan los empleados del departamento 20 que cobren más de
-- 2000 euros.
-- 12. Estamos en un ERE y la empresa despide a todos los trabajadores.
-- Elimínalos mediante dos instrucciones distintas. Explica cual es mejor y
-- porque.