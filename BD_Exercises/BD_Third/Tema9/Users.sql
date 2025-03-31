-- LA CUENTA DE USER & PASSWORD
    * Cuenta de User: nombreUser@UbicacionConexion  -- Compuesta por dos parámetros (nombreUser@localhost) (nombreUser@192.0.0.1) ('_roo%'@'%')
    * Privilegios: Acciones que puede realizar cada usuario sobre la base de datos
    * CREATE USER -- Crear Usuario 
    * DROP USER -- Borrar Usuario
    * RENAME USER -- Renombrar Usuario
    * ALTER USER -- Modificar Usuario
    * SET PASSWORD -- Aplicar Contraseña
    * GRANT -- Añadir privilegios
    * REVOKE -- Quitar privilegios
    * USER() -- Función para ver desde que usuario estas trabajando (SELECT USER())
    * CURRENT_USER() -- Función que devuelve solo ususarios creados (PREGUNTA EXAMEN DIFERENCIA CON USER)

-- CREAR CUENTAS DE USUARIO 
    * CREATE OR REPLACE USER diego@localhost IDENTIFIED BY 'contraseña'; -- OPCION 1
    * SELECT PASSWORD ('contraseña'); -- OPCION 2 PASSWORD HASHEADA
    * CREATE OR REPLACE USER diego@localhost IDENTIFIED BY PASSWORD "Digitos que devuelve SELECT PASSWORD ('contraseña')";
    * SHOW CREATE USER nombre@localhost -- VER USUARIO
    * SHOW GRANTS -- VER NUESTROS PRIVILEGIOS
    * SHOW GRANTS FOR 'Hugo' -- VER PRIVILEGIOS DE HUGO

-- ELIMINAR CUENTAS DE USUARIO
    * DROP USER 'nombre@%';

-- RENOMBRAR CUENTAS DE USUARIO
    * RENAME USER 'nombre@%' TO 'nombre2@localhost', 'Más users a cambiar';

-- MODIFICAR CUENTAS DE USUARIO
    * ALTER USER 'nombre@localhost' IDENTIFIED BY 'contraseña';

-- CAMBIAR CONTRASEÑA
    * SET PASSWORD = PASSWORD('nuevaContraseña');
    * SET PASSWORD FOR 'nombre@localhost' = PASSWORD('nuevaContraseña');