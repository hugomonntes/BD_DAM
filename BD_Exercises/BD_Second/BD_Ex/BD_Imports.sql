--40
LOAD DATA INFILE "/home/hmontes/Documentos/BD_DAM/BD_Exercises/BD_Second/BD_Imports/jugadores1.txt"
INTO TABLE jugadores1
    COLUMNS TERMINATED BY '\t'
    LINES TERMINATED BY '\n'
    IGNORE 2 LINES;
--41
LOAD DATA INFILE "/home/hmontes/Documentos/BD_DAM/BD_Exercises/BD_Second/BD_Imports/jugadores2.txt"
INTO TABLE jugadores2
    COLUMNS TERMINATED BY '#'
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
--42
LOAD DATA INFILE "/home/hmontes/Documentos/BD_DAM/BD_Exercises/BD_Second/BD_Imports/jugadores3.txt"
INTO TABLE jugadores3
    COLUMNS TERMINATED BY '\t'
    LINES TERMINATED BY '\n'
    IGNORE 3 LINES
    (Partidos, Minutos, Puntos, Rebotes, Tapones, Asistencias, Valoracion, NOMBRE);
--43
LOAD DATA INFILE "/home/hmontes/Documentos/BD_DAM/BD_Exercises/BD_Second/BD_Imports/jugadores4.txt"
INTO TABLE jugadores4
    COLUMNS TERMINATED BY '|'
    LINES
    STARTING BY "JUG\t"
    TERMINATED BY "\n"
    IGNORE 1 LINES


