Data losmochis;
input zafra por_fibra por_saca por_per_sac rend efi;
Cards;
25 15.3 12.29 3.24 8.99 73.56
26 15.56 12.04 3.28 8.76 72.75
27 16.71 11.21 3.12 8.08 72.08
28 18.2 11.14 3.4 7.74 69.48
29 17.63 10.27 3.08 7.18 69.91
30 19.49 10.11 3.11 7 69.24
31 17.25 10.97 3.07 7.9 72.01
32 16.88 11.15 3 8.15 73.09
33 16.92 10.64 3.1 7.33 71.99
;
proc corr;
title 'Correlación entre todas las variables';
footnote 'Aquí se ve que hay multicolinealidad';
var por_fibra por_saca por_per_sac rend efi;
run;

proc sgscatter data=losmochis;
  matrix por_fibra por_saca por_per_sac rend efi /
     transparency=0 markerattrs=graphdata3(symbol=circlefilled);
run;
proc corr;
title 'Correlación de la variable independiente';
var por_fibra por_saca por_per_sac efi;
with rend;
run;
proc reg;
title 'Correlación entre todas las variables';
footnote 'También se obtienen los intervalos de confianza';
model rend = por_fibra/clm;
run;
proc sgplot data=losmochis;
	reg x=por_fibra y=rend / nomarkers cli alpha=0.05;
	scatter x=por_fibra y=rend /;
	xaxis grid;
	yaxis grid;
run;




