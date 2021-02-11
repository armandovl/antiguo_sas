data ficticias;
input ingreso genero experiencia;
/*el genero 0= mujer 1=hombre*/
cards;
14500 1 5
19800 1 20
17500 1 15
9800 1 1
12300 1 4
14800 1 5
21200 1 30
10700 1 7
16400 1 8
15300 1 7
8600 0 15
10350 0 10
9500 0 8
12300 0 20
15600 0 22
14750 0 10
18500 0 35
12750 0 10
9600 0 8
8700 0 7
;
proc reg;
model ingreso= experiencia genero;
run;

proc sgplot data=ficticias;
	reg x=experiencia y=ingreso /markerattrs=(symbol=CircleFilled size=10px) group=genero

	CLM ="95% CI " CLMAttrs =( CLMFillAttrs = ( color = green ) )
	alpha =0.05 CLMTransparency =0.5;
	xaxis grid;
	yaxis grid;
	
run;

proc sgplot data=ficticias;

	scatter  x=experiencia y=ingreso /group=genero markerattrs=(size=10px);
	symbolchar name=female_sign char="2640"x;
 symbolchar name=male_sign char="2642"x;
 styleattrs datasymbols=(female_sign male_sign);

	xaxis grid;
	yaxis grid;
	
run;

