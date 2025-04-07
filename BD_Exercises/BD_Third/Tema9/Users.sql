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
    * UPDATE 'nombreTabla' SET PASSWORD = PASSWORD('nuevaContraseña') WHERE HOST = 'localhost' AND USER = 'lugonpa';
    * FLUSH PRIVILEGES; -- AÑADIRLO DSPS DE LA ANTERIOR CONSLTA DE UPDATE

-- PRIVILEGIOS
    * GRANT ALL 
    * GRANT SELECT ON *.* TO user@localhost; -- *.* SE ESCOGE LA DATABASE Y LA TABLA
    * GRANT ALTER ON *.* TO user@localhost; 
    * GRANT ALL ON *.* TO user@localhost; 
    * GRANT GRANT OPTION ON *.* TO user@localhost; -- Das los mismo permisos a ese usuario que los que tu tienes y no puede dar privilegios.
    * GRANT ALL, GRANT OPTION ON *.* TO user@localhost; -- Das los mismo permisos a ese usuario que los que tu tienes y puede dar privilegios a otros users.
    * GRANT INSERT, DELETE ON *.* TO user@localhost;

-- ELIMINAR PRIVILEGIOS
    * REVOKE SELECT ON *.* FROM user@localhost;
    * REVOKE SELECT(pilotos.id) ON f1.pilotos FROM user@localhost;