/* Código generado (IMPORT) */
/* Archivo de origen: DatosEXP.xlsx */
/* Ruta de origen: /folders/myshortcuts/Myfolder/Misejemplos */
/* Código generado el: 5/4/17 17:23 */

%web_drop_table(WORK.IMPORT);


FILENAME REFFILE '/folders/myshortcuts/Myfolder/Misejemplos/DatosEXP.csv';


PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.IMPORT;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.IMPORT; RUN;


%web_open_table(WORK.IMPORT);



Proc print data=WORK.IMPORT;
Proc means; var Bloque;
run;