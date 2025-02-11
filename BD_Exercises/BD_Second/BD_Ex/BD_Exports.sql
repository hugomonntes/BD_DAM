--44
SELECT * INTO OUTFILE "/home/hmontes/Documentos/jugadores1.txt"
    FIELDS TERMINATED BY '\t'
    LINES TERMINATED BY '\n'
FROM jugadores1;
--45
SELECT * INTO OUTFILE "Documentos/jugadores2.txt"
    FIELDS TERMINATED BY '|'
    LINES TERMINATED BY '\n'
FROM jugadores2;
--46
SELECT * INTO OUTFILE "Documentos/jugadores3.txt"
    FIELDS TERMINATED BY '|'
    LINES TERMINATED BY '\n'
FROM jugadores2;