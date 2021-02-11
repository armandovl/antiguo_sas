FILENAME REFFILE '/folders/myfolders/Metodos_2/sas_pobreza.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=pobreza;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=pobreza; 
RUN;
proc corr data=pobreza;
var pobreza gini educacion salud seguro vivienda vivienda2 alimentacion carencia1 carencia3 bienestar;
run;
proc sgscatter data=pobreza;
  matrix pobreza gini educacion salud seguro vivienda vivienda2 alimentacion carencia1 carencia3 bienestar /
     transparency=0 markerattrs=graphdata3(symbol=circlefilled);
run;
proc reg data=pobreza;
model educacion=salud pobreza gini vivienda alimentacion carencia1 carencia3 bienestar/selection=backward;
run;
/*creo que sólo me sirve esta parte*/
proc reg data=pobreza;
model educacion=salud pobreza gini vivienda alimentacion carencia1 carencia3 bienestar/selection=stepwise;
run;
proc sgscatter data=pobreza;
  matrix educacion salud pobreza gini vivienda alimentacion carencia1 carencia3 bienestar /
     transparency=0 markerattrs=graphdata3(symbol=circlefilled);
run;
proc reg data=pobreza;
model educacion=salud gini vivienda alimentacion carencia1 carencia3 bienestar;
run;
proc corr data=pobreza;
var educacion salud gini vivienda alimentacion carencia1 carencia3 bienestar;
run;
/*este es otro depuracion*/
proc corr data=pobreza;
var educacion salud gini vivienda alimentacion;
run;
proc sgscatter data=pobreza;
  matrix educacion salud gini vivienda alimentacion/
     transparency=0 markerattrs=graphdata3(symbol=circlefilled);
run;
proc reg data=pobreza;
model educacion=salud gini vivienda alimentacion;
run;

/*regresiones*/
proc sgscatter data=pobreza;
  matrix salud gini vivienda alimentacion/
     transparency=0 markerattrs=graphdata3(symbol=circlefilled);
run;
proc corr data=pobreza;
var salud gini vivienda alimentacion;
run;
