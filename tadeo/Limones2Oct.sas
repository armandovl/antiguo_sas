/* Folio (Clave), ID (Identificador), Grupo (Categoría), Nombre (Entrevistado), 
Edad (Edad), Escolaridad,(Estudios), Sexo (Género), 
Sup_Limon (Hectáreas), INAIGeneral (Índice de Adopción de Innovacion)*/

Title 'Modelo de regresión lineal del INAi General. base limón'; 
PROC glm data=work.Limones2;
MODEL INAIGeneral = Edad Escolaridad Sup_Limon;
RUN;
quit; 


Title 'Se correra un backward'; 
PROC reg data=work.Limones2;
model INAIGEneral = Edad Escolaridad Sup_Limon/selection = backward;
RUN;
quit; 


Title 'Comparación de medias limon por genéro (con Duncan y Anova)'; 
PROC anova data=work.Limones2;
class sexo;
model INAIGeneral = sexo;
means sexo/duncan;
options linesize =100 pagesize =300;
run;
quit; 


Title 'Comparación de medias limon por genéro (con Scheffe)'; 
PROC anova data=work.Limones2;
class sexo;
model INAIGeneral = sexo;
means sexo/scheffe;
options linesize =100 pagesize =300;
run;
quit; 

Title 'Comparación de medias limon por grupo (con Duncan y Anova)'; 
PROC anova data=work.Limones2;
class grupo;
model INAIGeneral = grupo;
means grupo/duncan;
options linesize =100 pagesize =300;
run;
quit; 
