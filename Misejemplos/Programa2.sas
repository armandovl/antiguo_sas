
/* MANOVA con Interacciones */
DATA TABLA;
INPUT INAI GRADOS EDAD$ SEXO$ LOCALIDAD$;
CARDS;
10 4 joven Hombre Norte
2 4 mayor Hombre Norte
2 4 mayor Hombre Norte
8 5 joven Hombre Sur
8 4 joven Hombre Sur
9 1 joven Hombre Sur
10 3 joven Hombre Sur
0 3 mayor Hombre Sur
3 3 adulto Hombre Sur
10 4 joven Hombre Sur
2 0 adulto Hombre Sur
4 1 mayor Hombre Sur
10 5 joven Hombre Este
9 2 joven Hombre Este
9 0 joven Hombre Este
10 5 joven Hombre Este
4 2 mayor Hombre Este
0 1 adulto Hombre Este
2 5 adulto Hombre Este
9 0 joven Hombre Oeste
10 3 joven Hombre Oeste
1 1 adulto Hombre Oeste
2 3 adulto Hombre Oeste
4 9 joven Mujer Norte
3 10 joven Mujer Norte
4 9 joven Mujer Norte
0 9 joven Mujer Norte
0 9 joven Mujer Norte
3 9 joven Mujer Norte
2 9 joven Mujer Norte
0 9 joven Mujer Norte
4 10 joven Mujer Norte
2 10 joven Mujer Norte
2 9 joven Mujer Norte
1 10 joven Mujer Norte
0 2 adulto Mujer Norte
3 9 joven Mujer Norte
1 2 mayor Mujer Norte
4 5 mayor Mujer Norte
1 2 joven Mujer Sur
0 2 joven Mujer Sur
2 5 joven Mujer Sur
0 0 adulto Mujer Sur
3 4 mayor Mujer Este
1 2 adulto Mujer Este
4 4 mayor Mujer Oeste
1 5 joven Mujer Oeste
0 3 joven Mujer Oeste
0 2 adulto Mujer Oeste
0 5 mayor Mujer Oeste
;
PROC GLM;
CLASS EDAD SEXO LOCALIDAD;
MODEL INAI GRADOS= EDAD SEXO LOCALIDAD EDAD*SEXO EDAD*LOCALIDAD SEXO*LOCALIDAD EDAD*SEXO*LOCALIDAD;
*means edad /scheffe Lines; /*lines es para agruparlos A B C*/
*means LOCALIDAD/scheffe lines;
means edad*sexo/scheffe lines;
run;