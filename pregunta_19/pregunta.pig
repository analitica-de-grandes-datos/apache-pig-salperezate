/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT
       firstname,
       color
   FROM 
       u 
   WHERE 
       color REGEXP '^b';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        /* >>> Escriba su respuesta a partir de este punto <<< */

*/

data = LOAD 'data.csv' USING PigStorage(',') AS (
    Id:int,
    Name:chararray,
    LastName:chararray,
    Birth:chararray,
    Color:chararray,
    Value:int
);
s_data = FOREACH data GENERATE Name, Color;
f_data = FILTER s_data BY Color MATCHES 'b.*';
STORE f_data INTO 'output' USING PigStorage(',');