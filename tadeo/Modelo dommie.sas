/*Este programa se utiliza para valorar una variable muda. se trata de ver
si el Ingreso de profesores esta influido por su experiencia y genero (1: Hombre, 0: Mujer)*/

Data mudas;
input Ing Exp D;
cards;
41000	25	1
5000	10	0
48000	26	1
44000	30	1
15000	18	0
12000	10	0
24000	20	1
13000	10	0
9500	15	0
36000	14	1
. 		12	0
.		12	1
;
Proc reg;
model Ing= Exp/clm;
run;
quit;



Data mudas sin dummie;
input Ing Exp D;
cards;
41000	25	1
5000	10	0
48000	26	1
44000	30	1
15000	18	0
12000	10	0
24000	20	1
13000	10	0
9500	15	0
36000	14	1
. 		12	0
.		12	1
;
Proc reg;
model Ing= Exp D/clm;
run;
quit;

Title 'Salario profesores';
Data 'Ingreo';
Input Ing Gen Exp;
Cards;
14500	1	5
19800	1	20
17500	1	15
9800	1	1
12300	1	4
14800	1	5
21200	1	30
10700	1	7
16400	1	8
15300	1	7
8600	0	15
10350	0	10
9500	0	8
12300	0	20
15600	0	22
14750	0	10
18500	0	35
12750	0	10
9600	0	8
8700	0	7
;
proc reg;
model Ing= Gen Exp;
run;
quit;


Title 'Limones'; 
PROC GLM data=work.LIMONES;
model INAIGeneral= Edad Sup_Limon Genero;
run;
quit;
 
