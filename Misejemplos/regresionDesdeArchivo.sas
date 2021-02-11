%web_drop_table(WORK.IMPORT);


FILENAME REFFILE '/folders/myfolders/CursoSAS/correlacionEdad.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.IMPORT;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.IMPORT; RUN;


%web_open_table(WORK.IMPORT);


PROC CORR data=WORK.IMPORT; 
VAR edad calProductos calCampo calCapacitacion calFinal;

run;