data momentos;
input anio precio_maiz;
cards;
1965 83.5
1966 87.4
1967 85.2
1968 94
1969 89.8
1970 92.3
1971 95.2
1972 89.5
1973 92.5
1974 145.9
1975 142.3
1976 151
1977 158.6
1978 162
1979 154.2
1980 146.7
1981 141.9
1982 140.5
1983 142.8
; run;
/*creamos la variable momento (antes-despues)*/
data momentos; set momentos;
if anio>=1974 then momento="despues";/*puse primero la variable mayor # de letras*/
else momento="antes";
run;

/*creamos las dummies*/
data momentos; set momentos;
d1_antes=0; if momento="antes" then d1_antes=1;
d2_despues=0; if momento="despues" then d2_despues=1;
run;

/*hacemos un grafico para observar la tendencia*/
ods graphics / attrpriority=none;
proc sgplot data=momentos;
	title 'Evolución del Precio';
	reg  x=anio y=precio_maiz /group=momento markerattrs=(size=5px);
 	styleattrs datasymbols=(TriangleFilled CircleFilled) 
 	datacontrastcolors=(purple orange);
	xaxis grid;
	yaxis grid;
run;

/*visualizamos la estructura de los datos con dummies*/
proc print DATA=momentos(obs=11);
title "Estructura de Datos 11 observaciones";
run;

/*corremos el modelo de regresion*/
proc reg;
title "Modelo de Regresión con Dummies";
model precio_maiz= anio d1_antes d2_despues;
footnote "tomó como origen la categoría 'después de 1974' ";
run; 



