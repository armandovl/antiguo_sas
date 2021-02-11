FILENAME REFFILE '/folders/myfolders/CursoSAS/porExperiencia.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=importadoExperiencia;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=importadoExperiencia; RUN;
proc glm;
class experiencia;
model PRODUCTOS CAMPO CAPACITACION FINAL= experiencia/SS3;
means experiencia/scheffe tukey lsd lines;
run;
