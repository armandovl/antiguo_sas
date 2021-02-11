data ficticias;
input ingreso genero$ experiencia;
/*el genero 0= mujer 1=hombre*/
cards;
14500 h 5
19800 h 20
17500 h 15
9800 h 1
12300 h 4
14800 h 5
21200 h 30
10700 h 7
16400 h 8
15300 h 7
8600 m 15
10350 m 10
9500 m 8
12300 m 20
15600 m 22
14750 m 10
18500 m 35
12750 m 10
9600 m 8
8700 m 7
;


proc sgplot data=ficticias;
	reg x=experiencia y=ingreso /markerattrs=(symbol=CircleFilled size=10px) group=genero

	CLM ="95% CI " CLMAttrs =( CLMFillAttrs = ( color = green ) )
	alpha =0.05 CLMTransparency =0.5;
	xaxis grid;
	yaxis grid;
	
run;

proc sgplot data=ficticias;

	reg x=experiencia y=ingreso /group=genero markerattrs=(size=20px);
	symbolchar name=female_sign char="2640"x;
 symbolchar name=male_sign char="2642"x;
 styleattrs datasymbols=(male_sign female_sign);

	xaxis grid;
	yaxis grid;
	
run;

data ficticias2; set ficticias;
d1_mujer=0; if genero="m" then d1_mujer=1 ;
run;


proc contents data=ficticias2; run;
proc print DATA=ficticias2(obs=10);
title "Estructura de Datos";
run;

proc reg data=ficticias2;

model ingreso= d1_mujer experiencia;
run;

