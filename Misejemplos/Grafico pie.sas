/*Gráfico de PIE  para universidades*/

Data porcentajeUniversidades;
input universidad$ calProductos;
cards;
unam 45
unam 23
unam 12
unam 90
unam 10
chapingo 70
chapingo 75
chapingo 78
chapingo 69
chapingo 79
chapingo 70
chapingo 76
chapingo 75
chapingo 89
chapingo 79
narro 12
narro 13
narro 70
narro 59
narro 57
;
proc chart;
pie universidad;
run;


