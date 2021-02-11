FILENAME REFFILE '/folders/myfolders/CursoSAS/porGrado.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=porGrado;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=porGrado; RUN;

proc glm;
class grado;
model calProductos calCampo calCapacitacion calFinal= grado/SS3;
means grado/lsd lines;
run;
