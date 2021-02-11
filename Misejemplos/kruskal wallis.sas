FILENAME REFFILE '/folders/myfolders/CursoSAS/porGrado.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=porGrado;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=porGrado; RUN;

proc npar1way wilcoxon data=porGrado;
class grado;var calProductos calCampo calCapacitacion calFinal;
run;
