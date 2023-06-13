u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);

y = FOREACH u GENERATE firstname, color;
z = FILTER y BY (SUBSTRING($0,0,1) MATCHES 'K') OR color == 'blue';
dump z;
store z into 'output' USING PigStorage(','); 