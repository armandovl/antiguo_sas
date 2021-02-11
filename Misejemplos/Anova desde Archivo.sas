Data aVarianza;
Title "Analisis de varianza";
/*Es un archivo de excel por espacios*/
infile '/folders/myshortcuts/Myfolder/Misejemplos/paraAnovaDatos.prn' firstobs=2;

input Tratamiento$ Presion;

/*estadísticos descriptivos*/
proc means data=aVarianza;
by tratamiento;

/*análisis de varianza*/
Proc anova;
classes tratamiento;
Model presion=tratamiento;

/*Prueba Post hoc*/
Means tratamiento/ tukey alpha=0.01;

/*Imprimir los datos*/
Proc Print;
run;