FILENAME REFFILE '/folders/myfolders/Econometria/pobreza_2010.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=p2010;
	GETNAMES=YES;
RUN;


PROC CONTENTS DATA=p2010; RUN;
/*
a1 Porcentaje de personas en pobreza
b1 Porcentaje de población de 15 años o más analfabeta en 2010
b2 Porcentaje de población de 6 a 14 años que no asiste a la escuela en 2010
b3 Porcentaje población con educación básica incompleta en 2010	
b4 Porcentaje de la población con rezago educativo_2010	
c1 Porcentaje de población sin derecho-habiencia a los servicios de salud en 2010
c2 Porcentaje de la población con carencia por acceso a los servicios de salud_2010	
d1 Porcentaje de pobreza por ingresos alimentaria_2010
d2 Porcentaje de pobreza por ingresos alimentaria_2010
e1 Coeficiente de Gini_2010
f1 Porcentaje de la población en viviendas con carencia por hacinamiento_2010
*/

proc corr data=p2010;
var a1 c1 c2 d1 d2 e1 f1;
with b1;
run;
proc reg data=p2010;
model b1=a1 c1 c2 d1 d2 e1 f1/selection=stepwise;
run;
proc reg data=p2010;
model b1=a1 c1 c2 d1 d2 e1 f1/selection=backward;
run;
/* sale c2*/
proc reg data=p2010;
model b1=a1 c1 d1 d2 e1 f1;
run;
proc corr data=p2010;
var a1 c1 d1 d2 e1 f1;
run;
proc sgscatter data=p2010;
  matrix b1 a1 c1 d1 d2 e1 f1/
     transparency=0 markerattrs=graphdata3(symbol=circlefilled);
run;


/**********b1 0.69 b2 0.21 b3 0.70 b4  0.61 ******************/
proc sgscatter data=p2010;
  matrix b3 a1 c1 c2 d1 d2 e1 f1 /
     transparency=0 markerattrs=graphdata3(symbol=circlefilled);
run;
/************b1 individual 0.69****************/
proc reg data=p2010;
model  b1= a1; /*0.56 se ve potencial 0.64*/
model  b1= c1; /*0.07*/
model  b1= c2; /*0.07*/
model  b1= d1; /*0.67*/
model  b1= d2; /*0.59 potencial hasta 65*/
model  b1= e1; /*0.2*/
model  b1= f1; /*0.47 no funcionan los logaritmos*/
run;

