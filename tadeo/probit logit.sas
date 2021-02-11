/** ESTE PROGRAMA SE USO PARA EJEMPLIFICAR UN MODELO DE REGRESION LOGISTICA                       *
LA VARIABLE DEPENDIENTE ES "ADOPTA UNA INNOVACION 1; NO LA ADPTA =0 
las variables independientes son:si recibe crédito (1= con crédito; 0= sin crédito)
y el número de hectáreas cultivadas---*/

Data adopcion;
input id Adopta	Credito	hectarea;
cards;
1 1 1 45
2 1 1 44
3 1 1 23
4 1 1 22
5 1 1 21
6 1 1 23
7 1 1 34
8 1 1 23
9 1 1 34
10 0 1 11
11 0 1 13
12 0 1 15
13 1 0 23
14 1 0 25
15 1 0 13
16 1 0 12
17 0 0 23
18 0 0 25
19 0 0 22
20 0 0 11
21 0 0 10
22 0 0 9
23 0 0 8
24 0 0 5
25 0 0 7
26 0 0 11
27 0 0 12
28 1 0 11
29 1 0 11
30 1 0 2
31 0 0 11
32 . 0 45 
33 . 1 2 
;

Title 'MODELO LINEAL DE PROBABILIDAD';
PROC reg DATA=adopcion;
MODEL Adopta=Credito hectarea;
RUN;
QUIT;

/** EL PROGRAMA DE ABAJO SE USO PARA  obtener los pronósticos
y poder graficarlos, PARA EL MODELO LINEAL DE PROBABILIDAD---*/
PROC reg DATA=adopcion;
MODEL Adopta=Credito hectarea/p noprint;
OUTPUT OUT=Pronosticos R=Residual P=Pronosticados;
RUN;
QUIT;
TITLE1 'MODELO LINEAL: Gráfica de  pronosticados para explorar rango de valores';
PROC PLOT;
PLOT Pronosticados*id='*';
Run;
quit;



/** Primer modelo LOGIT: Innovación y crédito--*/
/** ----EL PROGRAMA DE ABAJO SE USO PARA  obtener la regresión logística
expb=	 muestra los valores exponenciales estimados
lackfit= Requiere el contraste de bondad de ajuste de Hosmer y Lemeshow
descending= 
scale= Especifíca método para corregir la sobredispersión: None o N la más común;
Perason o P: Williams: Deviance o D.--*/
Title 'REGRESIÓN LOGISTICA EN UN PROCESO DE ADOPCIÓN DE INNOVACIÓN: solo con crédito';
Title2 'Crédito';
PROC LOGISTIC DATA=adopcion DESCENDING;
MODEL adopta = Credito/RISKLIMITS lackfit
expb 
							scale=none
                            outroc=roc1;

output out=pred p=phat lower=lcl upper=ucl;
proc print data=pred;
title2 'probabilidades predichas e intervalos de confianza al 95%';
Title 'REGRESIÓN LOGISTICA:  ANALISIS DE LA CALIDAD DEL MODELO';
RUN;
QUIT;
symbol1 i=join v=none c=GREEN;
   proc gplot data=roc1;
      title 'ROC Curve adopta y crédito';
      plot _sensit_*_1mspec_=1 / vaxis=0 to 1 by .1 cframe=ligr;
   run;

RUN;
QUIT;


/** Segundo modelo: Innovación y hectáreas--*/
Title1 'Número de hectáreas cultivadas';
PROC LOGISTIC DATA=adopcion DESCENDING;
MODEL adopta = hectarea/RISKLIMITS lackfit
expb 
							scale=none
							 outroc=roc2;
output out=pred p=phat lower=lcl upper=ucl;
proc print data=pred;
title2 'probabilidades predichas e intervalos de confianza al 95%';
RUN;
QUIT;
Title 'REGRESIÓN LOGISTICA:  ANALISIS DE LA CALIDAD DEL MODELO';
RUN;
QUIT;
symbol1 i=join v=none c=RED;
   proc gplot data=roc2;
      title 'ROC Curve adopta y hectareas';
      plot _sensit_*_1mspec_=1 / vaxis=0 to 1 by .1 cframe=ligr;
   run;


/** Tercer modelo: Innovación y crédito-hectáreas--*/
Title1 'Crédito y Número de hectáreas cultivadas';
PROC LOGISTIC DATA=adopcion DESCENDING;
MODEL adopta = hectarea credito/RISKLIMITS lackfit
expb scale=none
outroc=roc3;;
output out=pred p=phat lower=lcl upper=ucl;
proc print data=pred;
title2 'probabilidades predichas e intervalos de confianza al 95%';
Title 'REGRESIÓN LOGISTICA:  ANALISIS DE LA CALIDAD DEL MODELO';
RUN;
QUIT;
symbol1 i=join v=none c=blue;
   proc gplot data=roc3;
      title 'ROC Curve adopta y hectáreas';
      plot _sensit_*_1mspec_=1 / vaxis=0 to 1 by .1 cframe=ligr;
   run;

RUN;
QUIT;



   /****---EL PROGRAMA DE ABAJO SE USO PARA  desarrollar el gráfico logistico para hectáreas;---***/

PROC LOGISTIC DATA=adopcion descending;                                                                                                             
   MODEL adopta = hectarea/RISKLIMITS lackfit;    
   OUTPUT OUT=LOGOUT PREDICTED=PROB;  
   TITLE "Simple binary logistic regession with plot.";                                                                                 
RUN;           
*---------------------------------------LOGISTIC PLOT;
*GOPTIONS RESET=ALL; * May be necessary in some SAS installations;
PROC SORT DATA=LOGOUT;BY hectarea;   RUN;                                                                                                        
TITLE 'LOGISTIC PLOT'; 
PROC GPLOT DATA=LOGOUT;
   PLOT PROB*hectarea; 
RUN;   
QUIT;




/** Modelo Probit--*/
Title1 'Crédito y Número de hectáreas cultivadas';
PROC probit DATA=adopcion order=data;
class adopta;
MODEL adopta = hectarea credito;
title1 'MODELO PROBIT ADOPCIÓN';
RUN;
QUIT;

/*

también se puede hacer predicciones

probit variables continuas
logic variables dicotomicas

*/









