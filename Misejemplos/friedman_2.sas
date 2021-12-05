/*diferente tipo de dieta y u efecto en condición corporal de vacas

Información:
Fuente:  
Prueba: Prueba de Friedman
Procedimiento: Proc Rank
ho-ha
Resultado:
Significancia

*/

data condicion;
input bloque tratamiento$ calificacion @@;
cards;
1 a 2.5 1 b 3.5
1 c 3.5 1 d 5
2 a 3 2 b 2.5
2 c 3.5 2 d 4.5
3 a 2 3 b 3
3 c 4.5 3 d 4
4 a 3.5 4 b 3.5
4 c 4 4 d 5
;

proc rank data=condicion out=RNK;
var calificacion; ranks RNKcalificacion;
run;

proc glm data=RNK;
class tratamiento bloque;
model RNKcalificacion= bloque tratamiento/ss3;
means tratamiento/tukey lines;
run;

