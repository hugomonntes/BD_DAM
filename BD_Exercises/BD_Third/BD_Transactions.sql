-- 56.Crea la tabla transacción con un campo llamado campo de tipo entero y el motor de
-- almacenamiento InnoDB.

-- 57. Inserta en la tabla los valores 10, 11, 12 y 14.

-- 58.Comienza una transacción e inserta el valor 20 en la tabla transación. Muestra los
-- datos.
    START TRANSACTION

    INSERT INTO 


-- 59. Deshaz la transacción y vuelve a mostrar los dados. ¿Qué ha sucedido?.  

-- 60.Comienza una transacción e inserta el valor 20. Muestra los datos. Cierra la conexión
-- con la base de datos. Vuelve a conectarte y muestra los datos. ¿Qué ha sucedido?.
-- 61.Abre dos conexiones contra la base de datos. Las llamaremos conexión1 y conexión2.
-- Comprueba que tienen identificadores distintos mediante los comando: select
-- CONNECTION_ID() y show Processlist
-- 62. En la conexión 1 comienza una transacción e inserta el valor 20. Muestra los datos de
-- la tabla transacción. En la conexión2 muestra los datos de la tabla transacción. ¿Qué
-- ha sucedido?.
-- 63.Confirma los cambios en la conexión1. Muestra los datos tanto en la conexión1 como
-- en la conexión2. ¿Qué ha sucedido?.
-- 64. Desactiva el autocommit es inserta el valor 21 sin utilizar transacciones. Visualiza los
-- datos desde la conexión1 y desde la conexión2. ¿Qué ha sucedido?. Haz un commit.
-- Vuelve a visualizar los datos. ¿Qué ha sucedido?.
-- 65.Activa el autocommit es inserta el valor 22 sin utilizar transacciones. Visualiza los
-- datos desde la conexión1 y desde la conexión2. ¿Qué ha sucedido?.
-- 66.Comenzamos una transacción e insertamos el valor 100 en la tabla transacciones.
-- Realizamos los siguientes pasos visualizando cada uno de ellos:
-- · Creamos el punto de recuperación uno.
-- · Actualizamos el valor de 100 a 101.
-- · Creamos el punto de recuperación dos.
-- · Insertamos el valor 102.
-- · Creamos el punto de recuperación tres.
-- · Insertamos el valor 103.
-- · Volvemos al punto tres.
-- · Volvemos al punto dos.
-- · Realizamos un commit.
-- · Volvemos al punto 1 ¿Qué ha sucedido?.
-- 67.Comienza una transacción e inserta el valor 110. Creamos un punto de recuperación
-- uno. Insertamos el valor 111 y creamos la base de datos tema9 y volvemos al punto
-- de restauración uno. ¿Qué ha pasado?.
-- 68.Comienza una transacción e inserta el valor 120. Creamos un punto de recuperación
-- uno. Insertamos el valor 121 y volvemos a crear el punto de restauración uno.
-- Volvemos al punto de restauración uno. ¿Qué ha pasado?. Inserta el valor 122.
-- Realiza un commit y vuelve al punto de restauración uno. ¿Qué ha pasado?.