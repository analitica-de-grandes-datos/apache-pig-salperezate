fs -rm -f -r output;

u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);

y = FOREACH u GENERATE firstname, color;
z = FILTER y BY color == 'blue' OR color == 'black';
dump z;
store z into 'output' USING PigStorage(',');
