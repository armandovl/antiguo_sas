/*Construir intervalo de confianza: cli: valores observados, clm con valores predichos*/
Title "Modelo de regresion lineal Valdes"; 
Data Valdes_Tadeo;
Input Pais$ GPublico TCPIB;
Cards; 
Colombia 	0.48	0.94
El_Salvador	1.79	0.50
Honduras	4.40	1.00
Venezuela 	3.81	1.38
Paraguay	4.52	1.25
Guatemala	1.55	2.44
Argentina	3.69	2.06
Bolivia		5.41	1.81
Costa_Rica	7.88	3.00
Chile		7.29	3.19
Peru		5.41	4.43
Ecuador		8.24	3.31
Nicaragua	10.87	4.00
Rep_Dom		11.10	5.81
Panama		14.21	5.49
Brasil		12.99	3.56
Mexico		19.88	1.88
Barbados 	5.0 	.
Caiman		6.0 	.
Siria 		15 		.
;
proc reg;
model TCPIB=GPublico/ clm;
run;
quit;


Data multicolinealidad;
Input y x1 x2;
Cards; 
2 3 6
4 4 8
6 7 14
8 9 18
10 12 25
;
proc corr;
var x1 x2;
proc reg;
model Y= x1 x2;
run;
quit;


