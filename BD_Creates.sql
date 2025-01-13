    **CREAR BORRAR O COPIAR TABLAS/DATABASES**

1. CREATE DATABASE IF NOT EXISTS OURENSE CHARACTER = LATIN1; /*Crear tabla si no existe*/
2. DROP DATABASE IF EXISTS OURENSE; /*Borrar tabla si existe*/
3. CREATE OR REPLACE DATABASE OURENSE; /*Crear o reemplazar base de datos o tabla*/
4. RENAME TABLE ALUMNOS TO ESTUDIANTES; /*Renombrar tablas o databases*/
5. RENAME TABLE CLASE.ALUMNOS TO COLEGIO.ALUMNOS; /*Mover una tabla a otra base de datos *(NO TRASPASA PRIMARY KEYS NI COLUMNAS AUTO_INCREMENTS, NI FECHAS ACTUALES)*/
6. CREATE TABLE ESTUDIANTES (SELECT * FROM ALUMNOS);
7. CREATE TABLE ESTUDIANTES LIKE ALUMNOS; /*Copia la estructura de la tabla no los datos de dentro*/

    **INDICES** --> Mejoran la velocidad y la eficiencia de las consultas

1. CREATE TABLE ALUMNOS ( --> Forma Optimizada  
    ID INT,
    NOMBRE VARCHAR(30),
    PRIMARY KEY(ID)
)

1.1 CREATE TABLE ALUMNOS ( --> Forma NO Optimizada
    ID INT PRIMARY KEY,
    NOMBRE VARCHAR(30)
)