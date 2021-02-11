
/*Trigo (Con o sin innovaci�n), REGION (Lugares), VARIEDAD_GRUPO (Regi�n), 
COSTO_HA (Costo por hect�rea), 
RENDIMIENTO (Producci�n por superficie), UTILIDAD_HA (Utilidad por hect�rea),
INAI (�ndice de Adopci�n de Innovaciones), 
POTENCIAL_PRODUCTIVO (Potencial productivo*/

Title 'Estadisticos descriptios para regi�n'; 
PROC means data=work.TRIGO mean stderr cv median maxdec=1;
Var COSTO_HA RENDIMIENTO UTILIDAD_HA INAI;
class region;
run;
quit; 

Title 'Estadisticos descriptios para trigo'; 
PROC means data=work.TRIGO mean stderr cv median maxdec=1;
Var COSTO_HA RENDIMIENTO UTILIDAD_HA INAI;
class trigo;
run;
quit; 

Title 'Estadisticos descriptios para variedad_grupo'; 
PROC means data=work.TRIGO mean stderr cv median maxdec=3;
Var COSTO_HA RENDIMIENTO UTILIDAD_HA INAI;
class variedad_grupo;
run;
quit; 

Title 'Comparaci�n de medias trigo por regi�n (con Duncan y Anova)'; 
PROC anova data=work.TRIGO;
class REGION;
model COSTO_HA = REGION;
means REGION/duncan;
options linesize =100 pagesize =300;
run;
quit; 

Title 'Comparaci�n de medias trigo por trigo (con Duncan y Anova'; 
PROC anova data=work.TRIGO;
class trigo;
model COSTO_HA = trigo;
means trigo/duncan;
options linesize =100 pagesize =300;
run;
quit; 

Title 'Comparaci�n de medias trigo por variedad_grupo (con Duncan y Anova'; 
PROC anova data=work.TRIGO;
class variedad_grupo;
model COSTO_HA = variedad_grupo;
means variedad_grupo/duncan;
options linesize =100 pagesize =300;
run;
quit; 


Title 'Comparaci�n de medias trigo por regi�n (con GLM y SCHEFFE)'; 
PROC glm data=work.TRIGO;
class REGION;
model COSTO_HA = REGION;
means REGION/scheffe;
options linesize =100 pagesize =300;
run;
quit; 



Title 'Comparaci�n de medias trigo por regi�n (con GLM y TUKEY)'; 
PROC glm data=work.TRIGO;
class REGION;
model COSTO_HA = REGION;
Lsmeans REGION/stderr pdiff adjust = tukey;
means REGION/tukey;
run;
quit; 
