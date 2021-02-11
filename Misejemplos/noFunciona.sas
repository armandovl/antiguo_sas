FILENAME running url
'https://docs.google.com/spreadsheets/d/1imuF6wDrCcAlLSY4Q4LYhCOpnEyWssnxgLY7qVCWpng/pub?output=csv' debug;
proc import datafile=running out=running
 DBMS=CSV REPLACE;
 GETNAMES=Yes;
 DATAROW=2;
run;
