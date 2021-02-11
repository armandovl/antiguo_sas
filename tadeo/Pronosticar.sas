/*Este es un ejempleo de predicción con Barbadoss y Caiman CLI
plot es para grafícar*/
Title "Modelo de regresion lineal con México prediccion"; 
Data V2_Tadeo;
Input Nombre $ Pais $ GPublico TCPIB;
Cards; 
Tadeo	Colombia 	0.48	0.94
Tadeo	El_Salvador	1.79	0.50
Tadeo	Honduras	4.40	1.00
Tadeo	Venezuela 	3.81	1.38
Tadeo	Paraguay	4.52	1.25
Tadeo	Guatemala	1.55	2.44
Tadeo	Argentina	3.69	2.06
Tadeo	Bolivia	5.41	1.81
Tadeo	Costa_Rica	7.88	3.00
Tadeo	Chile	7.29	3.19
Tadeo	Peru	5.41	4.43
Tadeo	Ecuador	8.24	3.31
Tadeo	Nicaragua	10.87	4.00
Tadeo	Republica_Dominicana	11.10	5.81
Tadeo	Panama	14.21	5.49
Tadeo	Brasil	12.99	3.56
Tadeo	Mexico	19.88	1.88
Tadeo Barbados 5.0	.
Tadeo Caiman 6.0	.

proc reg;
model TCPIB=GPublico/cli p;
run;
quit;

proc plot;
plot TCPIB*GPublico ='*';
Title 'Modelo sin México';
run;
quit;

/*Este es un ejempleo de predicción con Barbadoss y Caiman CLI se incrementa*/
Title "Modelo de regresion lineal sin México"; 
Data V2_Tadeo;
Input Nombre $ Pais $ GPublico TCPIB;
Cards; 
Tadeo	Colombia 	0.48	0.94
Tadeo	El_Salvador	1.79	0.50
Tadeo	Honduras	4.40	1.00
Tadeo	Venezuela 	3.81	1.38
Tadeo	Paraguay	4.52	1.25
Tadeo	Guatemala	1.55	2.44
Tadeo	Argentina	3.69	2.06
Tadeo	Bolivia	5.41	1.81
Tadeo	Costa_Rica	7.88	3.00
Tadeo	Chile	7.29	3.19
Tadeo	Peru	5.41	4.43
Tadeo	Ecuador	8.24	3.31
Tadeo	Nicaragua	10.87	4.00
Tadeo	Republica_Dominicana	11.10	5.81
Tadeo	Panama	14.21	5.49
Tadeo	Brasil	12.99	3.56
Tadeo Barbados 5.0	.
Tadeo Caiman 6.0	.

proc glm;
model TCPIB=GPublico/cli p;
run;
quit;

/*Este es un ejempleo de predicción con Barbadoss y Caiman CLI se incrementa*/
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
proc corr;
var x y;
run;
quit;

/*Se agrega X2"*/
Title "Modelo X Y"; 
Data V2_Tadeo;
Input x y x2;
Cards; 
3 2 9
2 3 9
2 5 25 
5 10 25
;
proc glm;
model y=x2/cli;
run;
quit;
proc corr;
var x2 y;
run;
quit;
