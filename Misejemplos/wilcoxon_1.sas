/*
Cantidad de anomalías en células de cerdo , antes y después de una dieta con zinc
Fuente: libro del colegio pag 51
proc univariate
*/

data dieta_zinc;
input num_cerdo antes despues @@;
dif=antes-despues; /* nueva variable, diferencia entre antes y despues*/
cards;
1 18 8 2 9 10 3 5 5 4 19 11
5 13 15 6 6 2 7 10 11 8 5 5
9 22 17 10 8 5 11 16 9 12 10 13
13 9 5 14 14 6 15 17 8   
;
proc univariate normal data=dieta_zinc;
var dif;
run;

/*
Pr >= |S| 0.0110 
se rechaza la hipótesis nula
al agregar zinc a la dieta  disminuye la cantidad de anomalías


*/

