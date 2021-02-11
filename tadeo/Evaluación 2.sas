/*Seguna Evaluació*/
Title "Ingenio Los Mochis Sinaloa"; 
Data Mochis_Tadeo;
Input O F S SC RF EP;
Cards;
1	15.30	12.29	3.24	9.04	73.56
;
proc reg;
model RF= F S EP/selection = backward;
proc corr;
var F S;
run; 
quit;
 

/*Así es como se explican procedimientos*/
proc reg;
model oxigen= edad peso tiempo pd pe pm/ selection = forward;
model oxigen= edad peso tiempo pd pe pm/ selection = backward;
model oxigen= edad peso tiempo pd pe pm/ selection = stepwise;

/*Modelos cuando se jala una base de datos externa, 
se especifican las variables: Folio (Clave), ID (Identificador), Grupo (Categoría), Nombre (Entrevistado), 
Edad (Edad), Escolaridad,(Estudios), Sexo (Género), 
Sup_Limon (Hectáreas), INAIGeneral (Índice de Adopción de Innovacion)*/
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

/*Modelos de regresión lineal y cobb douglas*/
/*Se coloca en la ecuación las mismas variables obtenidas de log para correr el modelo
a) Primero se sacan los Logaritmos con la siguiente formula: L(var)= log(var);
Ecuación del modelo propuesto:
model LProd= LCap LSup LTrab
Para hacer predicciones se hace clm y cli; construye intervalos valores promedio predichos
*/
Title "Modelo Regresión lineal"; 
Data Regresion;
Input Anio Prod Cap Sup Trab;
Cards; 
1970      31515     0.8546     14975        5436
1971      33862     0.8964     15454        5790
1972      33423     1.0042     15237        6435
;
proc corr;
var Cap Sup Trab;
proc glm;
model Prod= Cap Sup Trab; 
options linesize =100 pagesize =300;
run;
quit;

Title "Modelo Douglas (transformación de variables Transformación de logaritmos)"; 
Data Regresion;
Input Anio Prod Cap Sup Trab;
LProd= log(Prod); LCap=log(Cap); LSup= log(Sup); LTrab = log(Trab); 
;
Cards; 
1970      31515     0.8546     14975        5436
1971      33862     0.8964     15454        5790
1972      33423     1.0042     15237        6435
;
proc glm;
model LProd= LCap LSup LTrab; 
options linesize =100 pagesize =300;
run;
quit;

/*Pueba Durwin Watson y predicciones, 
El valor de DW si es cercano a 2 no hay autocorrelación,
si es cercano a 1 o 4 si hay autocorrelacción
la variable que se predice es la dependiente*/
Title 'Supervivencia de las Plantas';
Data Plantas;
Input y x1 x2 x3;
Cards;
25.5	1.74	5.3		10.8
;
proc reg;
model y= x1 x2 x3/clm dw;
run;
quit;



/*Variabels midas, se pueden escoger en funci´n de 1 y 0 */
Data 'Tarea_11';
input Obs Salario Gasto D2 D3 D1;
cards;
1	19583	3346	1	0	0
2	20263	3114	1	0	0
3	20325	3554	1	0	0
21	22644	3914	1	0	0
22	24624	4517	0	1	0
23	27186	4349	0	1	0
24	33990	5020	0	1	0
25	23382	3594	0	1	0
;
Proc reg;
model Salario= D3 D2;
options linesize =100 pagesize =300;
run;
quit;
