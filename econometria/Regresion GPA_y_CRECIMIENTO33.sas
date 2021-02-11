FILENAME REFFILE '/folders/myfolders/Metodos_2/GPA_Y_CRECIMIENTO.xlsx';
PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.IMPORT;
	GETNAMES=YES;
RUN;
Proc sort;
by descending Estatus;
proc print DATA=WORK.IMPORT (obs=10);
title "Estructura de Datos";
proc reg;
title "Regresión sin México";
where Estatus~="MAL";
model Tasa_Crecimiento = Gasto_Publico/clm;
run;


