/* con este código lo que hago es traer el excel*/
FILENAME REFFILE '/folders/myfolders/1.-Metódos Cuantitativos/Para Ejercicios.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=datosImportados;
	GETNAMES=YES;
RUN;

/*PROC CONTENTS DATA=datosImportados; RUN;
 con este código lo que hago es traer el excel*/

proc ttest data=datosImportados;
	var INAI Edad;
proc sort data=datosImportados;
	by genero;
proc univariate data=datosImportados normal;
	var INAI;
	by genero;
run;