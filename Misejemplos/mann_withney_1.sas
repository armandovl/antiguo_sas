/* 
Preferencia de los consumidores por dos tipos de jamón (A-B) 
1-muy malo
6-muy bueno

Fuente: libro del colegio pag 50
*/

data preferencias_jamon;
/* $ es para poder poner letras y @@ es para acomodar horizontal los valores*/
input jamon $ preferencia @@ ;
cards;
a 5 a 4 a 3 a 3
a 4 a 2 a 5 a 4
a 2 a 3 b 4 b 5
b 2 b 6 b 4 b 5
b 5 b 3    
;
proc npar1way wilcoxon data=preferencias_jamon;
class jamon; var preferencia;
run;

/* no se rechaza la hipótesis nula*/