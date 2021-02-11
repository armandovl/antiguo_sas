/*************primer intento general valio madres solo pobreza con educacion r 59***************/

FILENAME REFFILE '/folders/myfolders/Metodos_2/sas_pobreza.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=pobreza;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=pobreza; 
RUN;
/*pobreza gini educacion salud seguro vivienda vivienda2 alimentacion carencia1 carencia3 bienestar*/

proc sgscatter data=pobreza;
  matrix pobreza educacion gini salud seguro alimentacion vivienda vivienda2 bienestar /
     transparency=0 markerattrs=graphdata3(symbol=circlefilled);
run;

/* primer intento la educación en función de lo demás  r2 0.63*/
proc reg data=pobreza;
model educacion =alimentacion gini salud seguro pobreza bienestar vivienda vivienda2/selection=backward;
run;
proc corr data=pobreza;
var alimentacion gini salud seguro pobreza bienestar vivienda vivienda2;
run;
/************r2 0.46******/
proc reg data=pobreza;
model educacion =gini salud vivienda/selection=backward;
run;
/************r2 0.2******/
proc reg data=pobreza;
model educacion =gini salud/selection=backward;
run;
/************educacion en funcion de todas***/
proc reg data=pobreza;
model educacion =alimentacion;
model educacion =gini;
model educacion =salud;
model educacion =seguro;
model educacion =pobreza;
model educacion =bienestar;
model educacion =vivienda;
model educacion =vivienda2;
run;