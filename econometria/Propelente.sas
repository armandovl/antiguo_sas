data propelente;
input resistencia edad;
y1=log(resistencia);
x1=log(edad);
cards;
2158.7 15.5
1678.15 23.75
2316 8
2061.3 17
2207.5 5.5
1708.3 19
1784.7 24
2575 2.5
2357.9 7.5
2256.7 11
2165.2 13
2399.55 3.75
1779.8 25
2336.75 9.75
1765.3 22
2053.5 18
2414.4 6
2200.5 12.5
2654.2 2
1753.7 21.5
;
proc reg;
title 'Modelo Nivel-Nivel';
model resistencia=edad/clm p;
run;
proc reg;
title 'Log-Nivel';
model y1=edad/clm p;
run;
proc reg;
title 'Modelo Nivel-log';
model resistencia=x1/clm p;
run;
proc reg;
title 'log-log';
model y1=x1/clm p;
run;


