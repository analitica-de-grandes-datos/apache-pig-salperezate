fs -rm -f -r output;

u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);

y = FOREACH u GENERATE firstname, color;
z = FILTER y BY (SUBSTRING(color,0,1) MATCHES 'b');
dump z;
store z into 'output' USING PigStorage(',');