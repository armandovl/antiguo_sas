/*Modelo a estimar*/
Title "Grado de Salud"; 
Data Datos_salud;
Input edad peso oxigen tiempo pd pe pm;
Cards;
44	89.47	44.609	11.37	62	178	182
44	85.84	54.297	8.65	45	156	168
38	89.02	49.874	9.22	55	178	180
40	75.98	45.681	11.95	70	176	180
44	81.42	39.442	13.08	63	174	176
44	73.03	50.541	10.13	45	168	168
45	66.45	44.754	11.12	51	176	176
54	83.12	51.855	10.33	50	166	170
51	69.63	40.836	10.95	57	168	172
48	91.63	46.774	10.25	46	162	164
57	73.37	39.407	12.63	58	174	176
52	76.32	45.441	9.63	48	164	166
51	67.25	45.118	11.08	48	172	172
51	73.71	45.79	10.47	59	186	188
49	76.32	48.673	9.4	    56	186	188
52	82.78	47.467	10.5	53	170	172
40	75.07	45.313	10.07	62	185	185
42	68.15	59.571	8.17	40	166	172
47	77.45	44.811	11.63	58	176	176
43	81.19	49.091	10.85	64	162	170
38	81.87	60.055	8.63	48	170	186
45	87.66	37.388	14.03	56	186	192
47	79.15	47.273	10.6	47	162	164
49	81.42	49.156	8.95	44	180	185
51	77.91	46.672	10	48	162	168
49	73.37	50.388	10.08	67	168	168
54	79.38	46.08	11.17	62	156	165
50	70.87	54.625	8.92	48	146	155
54	91.63	39.203	12.88	44	168	172
57	59.08	50.545	9.93	49	148	155
48	61.24	47.92	11.5	52	170	176
;
proc reg;
model oxigen= edad peso tiempo pd pe pm/ selection = forward;
model oxigen= edad peso tiempo pd pe pm/ selection = backward;
model oxigen= edad peso tiempo pd pe pm/ selection = stepwise;
run; 
quit;


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


/*Trigo (Con o sin innovación), REGION (Lugares), VARIEDAD_GRUPO (Región), 
COSTO_HA (Costo por hectárea), 
RENDIMIENTO (Producción por superficie), UTILIDAD_HA (Utilidad por hectárea),
INAI (Índice de Adopción de Innovaciones), 
POTENCIAL_PRODUCTIVO (Potencial productivo*/
Title 'Comparación de medias trigo por región (con GLM y TUKEY)'; 
PROC glm data=work.TRIGO;
class REGION;
model COSTO_HA = REGION;
Lsmeans REGION/stderr pdiff adjust = tukey;
means REGION/tukey;
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
31.2	6.32	5.42	9.4
25.9	6.22	8.41	7.2
38.4	10.52	4.63	8.5
18.4	1.19	11.6	9.4
26.7	1.22	5.85	9.9
26.4	4.1		6.62	8
25.9	6.32	8.72	9.1
32		4.08	4.42	8.7
25.2	4.15	7.6		9.2
39.7	10.15	4.83	9.4
35.7	1.72	3.12	7.6
26.5	1.7		5.3		8.2
.		3		8		9
;
proc reg;
model y= x1 x2 x3/clm dw;
run;
quit;
