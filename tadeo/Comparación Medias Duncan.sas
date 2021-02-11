/*Usando la base de datos "1. Base_trigo" (disponible en el aula virtual), efectuar la comparaci�n de medias
con la prueba de Duncan para Rendimiento, Utilidad e INAI (variables continuas) en las siguientes
categorias: Regi�n y Potencial Productivo
Variables:
Trigo (Con o sin innovaci�n
REGION (Lugares)
VARIEDAD_GRUPO (Regi�n), 
COSTO_HA (Costo por hect�rea), 
RENDIMIENTO (Producci�n por superficie), 
UTILIDAD_HA (Utilidad por hect�rea),
INAI (�ndice de Adopci�n de Innovaciones), 
POTENCIAL_PRODUCTIVO (Potencial productivo */
 
Title 'Comparaci�n de medias Rendimiento por Regi�n (con Duncan y Anova)'; 
PROC anova data=work.TRIGO_OTBP;
class REGION;
model RENDIMIENTO = REGION;
means REGION/duncan;
options linesize =100 pagesize =300;
run;
quit; 

Title 'Comparaci�n de medias Rendimiento por Potencial_Productivo (con Duncan y Anova)'; 
PROC anova data=work.TRIGO_OTBP;
class POTENCIAL_PRODUCTIVO;
model RENDIMIENTO = POTENCIAL_PRODUCTIVO;
means POTENCIAL_PRODUCTIVO/duncan;
options linesize =100 pagesize =300;
run;
quit; 

Title 'Comparaci�n de medias UTILIDAD_HA por Regi�n (con Duncan y Anova)'; 
PROC anova data=work.TRIGO_OTBP;
class REGION;
model UTILIDAD_HA = REGION;
means REGION/duncan;
options linesize =100 pagesize =300;
run;
quit; 

Title 'Comparaci�n de medias UTILIDAD_HA por Potencial_Productivo (con Duncan y Anova)'; 
PROC anova data=work.TRIGO_OTBP;
class POTENCIAL_PRODUCTIVO;
model UTILIDAD_HA = POTENCIAL_PRODUCTIVO;
means POTENCIAL_PRODUCTIVO/duncan;
options linesize =100 pagesize =300;
run;
quit;

Title 'Comparaci�n de medias IANI por Regi�n (con Duncan y Anova)'; 
PROC anova data=work.TRIGO_OTBP;
class REGION;
model INAI = REGION;
means REGION/duncan;
options linesize =100 pagesize =300;
run;
quit; 

Title 'Comparaci�n de medias INAI por Potencial_Productivo (con Duncan y Anova)'; 
PROC anova data=work.TRIGO_OTBP;
class POTENCIAL_PRODUCTIVO;
model INAI = POTENCIAL_PRODUCTIVO;
means POTENCIAL_PRODUCTIVO/duncan;
options linesize =100 pagesize =300;
run;
quit;
