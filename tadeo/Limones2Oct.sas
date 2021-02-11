/* Folio (Clave), ID (Identificador), Grupo (Categor�a), Nombre (Entrevistado), 
Edad (Edad), Escolaridad,(Estudios), Sexo (G�nero), 
Sup_Limon (Hect�reas), INAIGeneral (�ndice de Adopci�n de Innovacion)*/

Title 'Modelo de regresi�n lineal del INAi General. base lim�n'; 
PROC glm data=work.Limones2;
MODEL INAIGeneral = Edad Escolaridad Sup_Limon;
RUN;
quit; 


Title 'Se correra un backward'; 
PROC reg data=work.Limones2;
model INAIGEneral = Edad Escolaridad Sup_Limon/selection = backward;
RUN;
quit; 


Title 'Comparaci�n de medias limon por gen�ro (con Duncan y Anova)'; 
PROC anova data=work.Limones2;
class sexo;
model INAIGeneral = sexo;
means sexo/duncan;
options linesize =100 pagesize =300;
run;
quit; 


Title 'Comparaci�n de medias limon por gen�ro (con Scheffe)'; 
PROC anova data=work.Limones2;
class sexo;
model INAIGeneral = sexo;
means sexo/scheffe;
options linesize =100 pagesize =300;
run;
quit; 

Title 'Comparaci�n de medias limon por grupo (con Duncan y Anova)'; 
PROC anova data=work.Limones2;
class grupo;
model INAIGeneral = grupo;
means grupo/duncan;
options linesize =100 pagesize =300;
run;
quit; 
