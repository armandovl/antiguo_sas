
FILENAME REFFILE '/folders/myfolders/CursoSAS/lenguaTest.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=importadoLengua;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=importadoLengua; RUN;

proc npar1way wilcoxon data=importadoLengua;
class lengua; var calCapacitacion calCampo calProductos CalFinal;
run;