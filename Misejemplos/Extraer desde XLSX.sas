%web_drop_table(WORK.IMPORT1);


FILENAME REFFILE '/folders/myshortcuts/Myfolder/Misejemplos/DatosEXP.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.IMPORT1;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.IMPORT1; RUN;


%web_open_table(WORK.IMPORT1);

Proc print data=WORK.IMPORT;
Proc means; var Bloque;
run;