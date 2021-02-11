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
 


Title 'MAIZ RUSIA';
Data 'Precio_MAIZ';
Input Anio Precio D;
Cards;
1965	73.5	0
1966	87.4	0
1967	85.2	0
1968	94		0
1969	89.8	0
1970	94.3	0
1971	95.2	0
1972	89.5	0
1973	92.5	0
1974	145.9	1
1975	142.3	1
1976	151		1
1977	158.6	1
1978	162		1
1979	154.2	1
1980	146.7	1
1981	141.9	1
1982	140.5	1
1983	142.8	1
1960	.		0
1990	.		1
;
proc reg;
model Precio= Anio D/clm;
run;
quit;


Title 'Inteligencia';
Data 'Inteligencia';
Input Anio IQ Sueldo;
Cards;
10	95	13880
10	100	15310
10	100	10470
11	105	17280
11	85	12480
11	115	18660
11	95	14720
12	100	19390
12	100	15510
12	110	19590
13	90	15770
13	120	22790
14	110	20910
14	95	16720
15	105	23200
16	110	24690
16	100	23130
17	125	34940
18	105	27780
19	105	30380

;
proc reg;
model Sueldo= Anio;
proc corr;
var IQ Sueldo;
run;
quit;


Title 'Inteligencia';
Data 'Inteligencia';
Input Anio IQ Sueldo;
Cards;
10	95	13880
10	100	15310
10	100	10470
11	105	17280
11	85	12480
11	115	18660
11	95	14720
12	100	19390
12	100	15510
12	110	19590
13	90	15770
13	120	22790
14	110	20910
14	95	16720
15	105	23200
16	110	24690
16	100	23130
17	125	34940
18	105	27780
19	105	30380
19  95   .
19 	120	.
;
proc reg;
model Sueldo= IQ Anio/clm;
run;
quit;


