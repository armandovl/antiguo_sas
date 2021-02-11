/*Este es un ejempleo de Modelo univariado deterministico con X Y*/
Title "Modelo X Y"; 
Data V2_Tadeo;
Input x y x2;
Cards; 
3 6 
2 4
2 4
5 10
;
proc glm;
model y=x/cli;
run;
quit;
/*Este es un modelo multivariado (Se agrega X2), es decir, cuando en el modelo las variables endógenas dependen 
directamente de las exogenas y se estiman valores cercanos o iguales a uno de "r" se puede caer en un modelo deterministico 
ocasionado por la multicolinealidad entre variables (variables exogenas)*/
Title "Modelo X Y"; 
Data V2_Tadeo;
Input x y x2;
Cards; 
3 6 9
2 4 8
2 4 8 
5 10 20
;
proc glm;
model y=x2/cli;
run;
quit;
