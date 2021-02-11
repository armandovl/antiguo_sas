/*
.......Contrastes Ortogonales con Contrastes.......


*/
Data contrastes;
input tratamiento$ bloque respuesta @@;
cards;
a 1 8 a 2 8 a 3 9 a 4 7 a 5 7 a 6 5
b 1 16 b 2 19 b 3 24 b 4 22 b 5 19 b 6 19
c 1 14 c 2 16 c 3 14 c 4 13 c 5 14 c 6 13
d 1 10 d 2 11 d 3 12 d 4 8 d 5 7 d 6 3
e 1 8 e 2 7 e 3 1 e 4 1 e 5 3 e 6 2
f 1 8 f 2 8 f 3 3 f 4 3 f 5 3 f 6 7
g 1 7 g 2 6 g 3 6 g 4 6 g 5 4 g 6 4
h 1 12 h 2 19 h 3 9 h 4 11 h 5 9 h 6 5
;
*proc print;
proc glm;
class tratamiento bloque;
model respuesta= tratamiento bloque;
/*-------------------A---B--C--D--E--F--G--H---*/
contrast'pregunta1' tratamiento +7 -1 -1 -1 -1 -1 -1 -1;
contrast'pregunta2' tratamiento 0 +5 +5 -2 -2 -2 -2 -2;
contrast'pregunta3' tratamiento 0 +1 -1 0 0 0 0 0;
contrast'pregunta4' tratamiento 0 0 0 +3 -2 -2 -2 +3;
contrast'pregunta5' tratamiento 0 0 0 +1 0 0 0 -1;
contrast'pregunta6' tratamiento 0 0 0 0 +2 -1 -1 0;