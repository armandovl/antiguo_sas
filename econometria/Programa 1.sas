data sobre_salario;
input salario productividad;
ln_x = log(productividad);
cards;
3396 9355
3787 8584
4013 7962
4104 8275
4146 8389
4241 9418
4388 9795
4538 10281
4843 11750
; run;

/*primera forma Breusch-Pagan test
proc reg;
model salario= productividad/r;
     output out =salida2    r = residual;
data salida2;
     set salida2;
     ressqr = residual**2;
proc reg;
    model ressqr = productividad;
run;
*/

proc reg;
model salario= productividad/r p;
     output out =step2 r = residual p=valoresPredichos;
data step2;
     set step2;
     /*residualabs=abs(residual);*/
    residualsqr= residual**2;
     ln_r = log(residualsqr);
     
 proc sgplot data=step2;
	scatter x=valoresPredichos y=residual /;
	xaxis grid;
	yaxis grid;
run;    


proc print data=step2; run;

     
proc reg;
    model ln_r = ln_x;
run;


