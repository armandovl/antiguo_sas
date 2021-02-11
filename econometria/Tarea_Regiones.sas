data regiones;
input salario gasto region$ 11-34;
cards;
19583 3346 Noroeste y Norte Centro
20263 3114 Noroeste y Norte Centro
20325 3554 Noroeste y Norte Centro
26800 4642 Noroeste y Norte Centro
29470 4669 Noroeste y Norte Centro
26610 4888 Noroeste y Norte Centro
30678 5710 Noroeste y Norte Centro
27170 5536 Noroeste y Norte Centro
25853 4168 Noroeste y Norte Centro
24500 3547 Noroeste y Norte Centro
24274 3159 Noroeste y Norte Centro
27170 3621 Noroeste y Norte Centro
30168 3782 Noroeste y Norte Centro
26525 4247 Noroeste y Norte Centro
27360 3982 Noroeste y Norte Centro
21690 3568 Noroeste y Norte Centro
21974 3155 Noroeste y Norte Centro
20816 3059 Noroeste y Norte Centro
18095 2967 Noroeste y Norte Centro
20939 3285 Noroeste y Norte Centro
22644 3914 Noroeste y Norte Centro
24624 4517 Sur
27186 4349 Sur
33990 5020 Sur
23382 3594 Sur
20627 2821 Sur
22795 3366 Sur
21570 2920 Sur
22080 2980 Sur
22250 3731 Sur
20940 2853 Sur
21800 2533 Sur
22934 2729 Sur
18443 2305 Sur
19538 2642 Sur
20460 3124 Sur
21419 2752 Sur
25160 3429 Sur
22482 3947 Oeste
20969 2509 Oeste
27224 5440 Oeste
25892 4042 Oeste
22644 3402 Oeste
24640 2829 Oeste
22341 2297 Oeste
25610 2932 Oeste
26015 3705 Oeste
25788 4123 Oeste
29132 3608 Oeste
41480 8349 Oeste
25845 3766 Oeste
;


/*hacemos los graficos separados*/
Proc sort data=regiones out=regiones_ordenadas;
by region;
run;
proc sgplot data=regiones_ordenadas;
	by region;
	title 'Gráficos SEPARADOS';
	reg x=salario y=gasto /markerattrs=(symbol=CircleFilled size=10px color=red)
	CLM ="95% CI " CLMAttrs =( CLMFillAttrs = ( color = yellow ) )
	alpha =0.05 CLMTransparency =0.5;
	xaxis grid;
	yaxis grid;
run;

/*hacemos un grafico para observar la tendencia*/
ods graphics / attrpriority=none;
proc sgplot data=regiones;
	title 'Gráfico 1';
	reg  x=salario y=gasto /group=region markerattrs=(size=5px);
 	styleattrs datasymbols=(TriangleFilled SquareFilled CircleFilled) 
 	datacontrastcolors=(purple green blue);
	xaxis grid;
	yaxis grid;
run;
/*oeste sur norte*/


data regionesF; set regiones;
d1_norte=0; if region="Noroeste y Norte Centro" then d1_norte=1 ;
d1_oeste=0; if region="Oeste" then d1_oeste=1 ;
d1_sur=0; if region="Sur" then d1_sur=1 ;
run;


/*visualizamos la estructura de los datos con dummies*/
proc contents data=regionesF; run;
proc print DATA=regionesF/*(obs=10)*/;
title "Estructura de Datos";
run;

proc reg;
model gasto= salario d1_oeste d1_sur d1_norte;
run; 



