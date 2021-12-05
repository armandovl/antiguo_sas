 /* 
 Concentración de espermatozoides en cerdos antes y despues de enfermarse
 Fuente: Libro Colegio pag 49
 */

data virus_cerdos;
input concentracion_a concentracion_d;
dif= concentracion_a -concentracion_d; /*nueva variable, es la diferencia*/
cards;
60.5 49.2
78.7 38.9
69.3 40.1
59.6 41.3
67.9 39
58.8 39.9
59 42.3
68.9 49.1
69 39.2
58.4 39.6
;
proc print; /*imprimir los datos*/
proc means mean t prt;
var dif;
title "Concentración de espermatozoides en cerdos";
title2 "Antes y después de enfermar con un virus";
run;

/* si disminuyò la cantidad de espermatozoides el haberse enfermado*/