    **CREAR BORRAR O COPIAR TABLAS/DATABASES**

1. CREATE DATABASE IF NOT EXISTS OURENSE CHARACTER = LATIN1; /*Crear tabla si no existe*/
2. DROP DATABASE IF EXISTS OURENSE; /*Borrar tabla si existe*/
3. CREATE OR REPLACE DATABASE OURENSE; /*Crear o reemplazar base de datos o tabla*/
4. RENAME TABLE ALUMNOS TO ESTUDIANTES; /*Renombrar tablas o databases*/
5. RENAME TABLE CLASE.ALUMNOS TO COLEGIO.ALUMNOS; /*Mover una tabla a otra base de datos *(NO TRASPASA PRIMARY KEYS NI COLUMNAS AUTO_INCREMENTS, NI FECHAS ACTUALES)*/
6. CREATE TABLE ESTUDIANTES (SELECT * FROM ALUMNOS);
7. CREATE TABLE ESTUDIANTES LIKE ALUMNOS; /*Copia la estructura de la tabla no los datos de dentro*/

    **INDICES PRIMARY KEY** --> Mejoran la velocidad y la eficiencia de las consultas

1. CREATE TABLE ALUMNOS ( --> Forma Optimizada  
    ID INT,
    NOMBRE VARCHAR(30),
    PRIMARY KEY(ID, NOMBRE) --> Clave primaria compuesta entre esas dos columnas
)

1.1 CREATE TABLE ALUMNOS ( --> Forma NO Optimizada
    ID INT PRIMARY KEY,
    NOMBRE VARCHAR(30)
)

    **INDICES NORMALES** --> INDEX O KEY

2. CREATE TABLE ALUMNOS ( 
    ID INT,
    NOMBRE VARCHAR(30),
    INDEX(NOMBRE) --> Mejora la eficiencia de la consulta
)

2.1 CREATE TABLE ALUMNOS (
    ID INT,
    NOMBRE VARCHAR(30),
    KEY(NOMBRE(4)) --> Hace lo mismo que index() el parámetro acota los nombres al número de letras introducido Pedro --> Pedr
)

2.2 CREATE TABLE ALUMNOS ( 
    ID INT,
    NOMBRE VARCHAR(30),
    UNIQUE(NOMBRE) --> Crea un índice y es único
)

    **FOREIGN KEYS**

3. CREATE TABLE PERSONAS ( 
    ID INT PRIMARY KEY,
    NOMBRE VARCHAR(40),
    ENGINE = INNODB;
)

3.1 CREATE TABLE TELEFONOS ( 
    ID INT NOT NULL,
    NUM CHAR(12),
    PERSONA INT NOT NULL,
    FOREIGN KEY(PERSONA),
    REFERENCES PERSONAS(ID),
    ENGINE = INNODB;
)

    **OPCIONES**

4. ON DELETE RESTRICT --> Se puede eliminar si no tiene datos en la tabla, si no esta en uso el ID
5. ON UPDATE RESTRICT / CASCADE
6. ON DELETE CASCADE --> Elimina a un usuario de la tabla si ya no lo tienes para que sus datos no ocupen
7. ON DELETE SET NULL --> Si eliminas a alguien se cambia la FK por NULL

    **MODIFICACION DE TABLAS**

8.  ALTER TABLE ALUMNOS RENAME TO ESTUDIANTES; --> Cambiar nombre de tabla
9.  ALTER TABLE ALUMNOS ADD EDAD INT; --> Añadir nueva columna
10. ALTER TABLE ALUMNOS ADD (EDAD INT, PESO FLOAT); --> Añadir nueva columna
11. ALTER TABLE ALUMNOS ADD EDAD INT FIRST; --> Colocar de primera la columna
11. ALTER TABLE ALUMNOS ADD EDAD INT AFTER NOMBRE; --> Colocar despues la columna
12. ALTER TABLE ALUMNOS CHANGE EDAD AÑOS INT; --> Cambiar nombre de la columna
13. ALTER TABLE ALUMNOS MODIFY EDAD CHAR; --> Modificar datos columna de tabla
14. ALTER TABLE ALUMNOS DROP NOMBRE; --> Borrar columna de una tabla
15. ALTER TABLE ALUMNOS ADD PRIMARY KEY(ID); --> Añadir clave primaria a una columna
15. ALTER TABLE ALUMNOS DROP PRIMARY KEY(ID); --> Borrar clave primaria a una columna
16. ALTER TABLE ALUMNOS ADD FOREIGN KEY(ID); --> Añadir clave foranea a una columna
17. ALTER TABLE ALUMNOS DROP FOREIGN KEY(ID); --> Borrar clave foranea a una columna
18. ALTER TABLE ALUMNOS ENGINE = INNODB; --> Cambiar motor de busqueda