/* con este código lo que hago es traer el excel*/
FILENAME REFFILE '/folders/myfolders/1.-Metódos Cuantitativos/Para Ejercicios.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=datosImportados;
	GETNAMES=YES;
RUN;

proc sort;
by Municipio;

proc sgplot data=datosImportados;
vBox Inai;
By Municipio;
run;
