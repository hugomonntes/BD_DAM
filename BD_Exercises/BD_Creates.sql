CREATE DATABASE IF NOT EXISTS BD2 CHARACTER SET = LATIN1;
CREATE DATABASE IF NOT EXISTS BD3 CHARACTER SET = UTF8;

CREATE TABLE JUEGOS.BD2 (
	IDJUEGO TINYINT AUTO_INCREMENT PRIMARY KEY,
	NOMBRE CHAR(40) NOT NULL UNIQUE,
    PLATAFORMA SET ('PSP', 'WII', 'PLAYSTATION', 'XBOX', 'NINTENDO DS', 'PC') COMMENT 'Plataformas soportadas por el juego',
	PRECIOVENTA FLOAT(10,2) NULL,
    PRECIOALQUILER FLOAT(10,2),
    STOCKVENTA BIGINT DEFAULT 10 NOT NULL,
    STOCKALQUILER TINYINT ZEROFILL,
    INDEX (PRECIOVENTA),
);

/*
4. Crea la tabla juegosNuevos en BD3 con la misma estructura que la tabla
juegos de BD2.
5. Renombra la tabla juegosNuevos a NovosXogos.
6. Mueve la tabla NovosXogos de BD3 a BD2.
7. Borra la base de datos BD3.1. Crea la base de datos BD2 con el juego de caracteres latin1 como defecto.
2. Crea la base de datos BD3 con el juego de caracteres UTF como defecto.
Crea mediante definición de creación las siguientes tablas. Todas tendrán como
motor de almacenamiento InnoDB y como juego de caracteres UTF8. Todas las
claves primarias se deben establecer a not null:
3. Crear en la base de datos BD2 la tabla juegos con los siguientes campos:
a. IDJuego: de tipo entero pequeño, clave principal, autoincrementado.
b. Nombre: de tipo texto de longitud fija máxima 40, no puede ser nulo y
tiene que ser único.
c. Plataforma: puede contener alguno de los siguientes valores: PSP, Wii,
Playstation, XBOX, Nintendo DS, PC a la que le añadimos la descripción
“Plataformas soportadas por el juego”.
d. PrecioVenta: número con 2 decimales. Permite nulos.
e. PrecioAlquiler: número con 2 decimales.
f. StockVenta: de tipo entero grande por defecto son 10 unidades y no
soporta valores nulos.
g. StockAlquiler: de tipo entero muy pequeño rellenando con ceros a la
izquierda.
h. Crea un índice sobre el campo PrecioVenta.
4. Crea la tabla juegosNuevos en BD3 con la misma estructura que la tabla
juegos de BD2.
5. Renombra la tabla juegosNuevos a NovosXogos.
6. Mueve la tabla NovosXogos de BD3 a BD2.
7. Borra la base de datos BD3.
*/