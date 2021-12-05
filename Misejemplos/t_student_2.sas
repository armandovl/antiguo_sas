/*se evaluaron las producciones de dos plantas 
de soya resistentes al ataque de un hongo

Fuente: Libro Sas Parasitología pag 79

*/

data plantas_soya;
input variedad produccion;
cards;
1 1735
1 2002
1 1820
1 2082
1 1894
1 1816
1 2008
1 1754
1 1898
1 2223
1 2873
1 2313
2 3403
2 3294
2 2899
2 3350
2 3212
2 2964
2 3098
2 2984
2 2492
;
proc ttest;
class variedad;
run;

/* 
El valor  Prob>F'=0.754
Se concluye que las varianzas  de producción de
las dos variedades son iguales
*/


