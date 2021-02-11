/*Usando la base de datos "1. Base_trigo" (disponible en el aula virtual), efectuar la comparación de medias
con la prueba de Duncan para Rendimiento, Utilidad e INAI (variables continuas) en las siguientes
categorias: Región y Potencial Productivo
Variables:
Trigo (Con o sin innovación
REGION (Lugares)
VARIEDAD_GRUPO (Región), 
COSTO_HA (Costo por hectárea), 
RENDIMIENTO (Producción por superficie), 
UTILIDAD_HA (Utilidad por hectárea),
INAI (Índice de Adopción de Innovaciones), 
POTENCIAL_PRODUCTIVO (Potencial productivo */
 
Title 'Comparación de medias Rendimiento por Región (con Duncan y Anova)'; 
PROC anova data=work.TRIGO_OTBP;
class REGION;
model RENDIMIENTO = REGION;
means REGION/duncan;
options linesize =100 pagesize =300;
run;
quit; 

Title 'Comparación de medias Rendimiento por Potencial_Productivo (con Duncan y Anova)'; 
PROC anova data=work.TRIGO_OTBP;
class POTENCIAL_PRODUCTIVO;
model RENDIMIENTO = POTENCIAL_PRODUCTIVO;
means POTENCIAL_PRODUCTIVO/duncan;
options linesize =100 pagesize =300;
run;
quit; 

Title 'Comparación de medias UTILIDAD_HA por Región (con Duncan y Anova)'; 
PROC anova data=work.TRIGO_OTBP;
class REGION;
model UTILIDAD_HA = REGION;
means REGION/duncan;
options linesize =100 pagesize =300;
run;
quit; 

Title 'Comparación de medias UTILIDAD_HA por Potencial_Productivo (con Duncan y Anova)'; 
PROC anova data=work.TRIGO_OTBP;
class POTENCIAL_PRODUCTIVO;
model UTILIDAD_HA = POTENCIAL_PRODUCTIVO;
means POTENCIAL_PRODUCTIVO/duncan;
options linesize =100 pagesize =300;
run;
quit;

Title 'Comparación de medias IANI por Región (con Duncan y Anova)'; 
PROC anova data=work.TRIGO_OTBP;
class REGION;
model INAI = REGION;
means REGION/duncan;
options linesize =100 pagesize =300;
run;
quit; 

Title 'Comparación de medias INAI por Potencial_Productivo (con Duncan y Anova)'; 
PROC anova data=work.TRIGO_OTBP;
class POTENCIAL_PRODUCTIVO;
model INAI = POTENCIAL_PRODUCTIVO;
means POTENCIAL_PRODUCTIVO/duncan;
options linesize =100 pagesize =300;
run;
quit;
