/* Probando 3 beta agonistas y su efecto en el marmoleo de la carne

control, tratamiento a, tretamiento b, tratamiento c
6 muy abundante   1 practicamente nada de marmoleo
información:
fuente: libro colegio pag 52
prueba:
procedimiento:
Resultado:
ho-ha
significancia

cambiar

*/

 data marmoleo;
 input tratamiento$ marmoleo @@;
 datalines;
 control 1 a 3 b 6 c 5
control 3 a 4 b 5 c 4
control 4 a 3 b 6 c 4
control 3 a 5 b 4 c 3
control 1 a 3 b 6 c 3
control 3 a 3 b 6 c 6
control 2 a 4 b 5 c 5
control 4 a 4 b 5 c 3
control 2 a 3 b 6 c 5
control 3 a 5 b 4 c 4
;
proc npar1way wilcoxon data=marmoleo;
class tratamiento; var marmoleo;
run;

/*al menos 1 es diferente*/
