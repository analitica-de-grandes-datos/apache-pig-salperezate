/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta en SQL.

   SELECT
       color
   FROM 
       u 
   WHERE 
       color 
   LIKE 'b%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        /* >>> Escriba su respuesta a partir de este punto <<< */
*/
fs -rm -f -r output;
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (color:CHARARRAY);

y = FOREACH u GENERATE color;
z = FILTER y BY SUBSTRING($0,0,1) IN ('b'); 
dump z; 
store z into 'output';