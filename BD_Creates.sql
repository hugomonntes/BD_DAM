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
    REFERENCE PERSONAS(ID),
    ENGINE = INNODB;
)