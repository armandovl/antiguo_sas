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
run;
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
title "Weight vs. Height";
scatter x=experiencia y=ingreso / group=genero
 markerattrs=(symbol=CircleFilled size=15px);
run;


proc sgplot data=ficticias;
title "Weight vs. Height";
scatter x=experiencia y=ingreso / group=genero
 markerattrs=(symbol=CircleFilled size=15px);
run;


ods graphics / attrpriority=none;
proc sgplot data=ficticias;
title "Weight vs. Height";
styleattrs datasymbols=(SquareFilled CircleFilled)
 datacontrastcolors=(purple green);
reg x=experiencia y=ingreso / group=genero markerattrs=(size=10px);
run;


ods graphics / attrpriority=none;
proc sgplot data=ficticias;
	reg  x=experiencia y=ingreso /group=genero markerattrs=(size=30px);
	/*symbolimage name=female image="&path.\female.png";*/

	symbolchar name=female_sign char="2640"x;
 symbolchar name=male_sign char="2642"x;
 styleattrs datasymbols=(male_sign female_sign);

	xaxis grid;
	yaxis grid;
	
run;

