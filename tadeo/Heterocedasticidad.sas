
/* ---ESTE ES EL EJEMPLO para HETEROCEDASTICIDAD. La siguiente es información cruzada de 33 países en donde 
se registra el gasto per cápita en educación (EE), el ingreso bruto personal disponible (GDP)
y la población (POP)

Al respecto se pide:
a.	Especificar y estimar el modelo:
b.	Evaluar el modelo estimado con las pruebas F, t y R2. Interpretar los resultados.
c.	Detectar la presencia de heterocedasticidad. ¿Cuál es la posible causa?
d.	Corra el modelo sin incluir los datos de Países extremos. Compare los resultados.
e.	Corrija la presencia de heterocedasticidad.

La heterocedasticidad se manifiesta en el gráfico con un valor atípico en la gráfica cuando
se gráfican los valores predichos con los valores residuales

---*/
DATA heteros;
INPUT pais $ ee gdp pop; 
cards;
Luxembourg		0.34	5.67	0.36
Uruguay			0.22	10.13	2.90
Singapore		0.32	11.34	2.39
Ireland			1.23	18.88	3.44
Israel			1.81	20.94	3.87
Hungary			1.02	22.16	10.71
New_Zealand		1.27	23.83	3.10
Portugal		1.07	24.67	9.93
Hong_Kong		0.67	27.56	5.07
Chile			1.25	27.57	11.10
Greece			0.75	40.15	9.60
Finland			2.80	51.62	4.78
Norway			4.90	57.71	4.09
Yugoslavia		3.50	63.03	22.34
Denmark			4.45	66.32	5.12
Turkey			1.60	66.97	44.92
Austria			4.26	76.88	7.51
Switzerland		5.31	101.65	6.37
Saudi_Arabia	6.40	115.97	8.37
Belgium			7.15	119.49	9.86
Sweden			11.22	124.15	8.31
Australia		8.66	140.98	14.62
Argentina		5.56	153.85	27.06
Netherlands		13.41	169.38	14.14
Mexico			5.46	186.33	67.40
Spain			4.79	211.78	37.43
Brazil			8.92	249.72	123.03
Canada			18.90	261.41	23.94
Italy			15.95	395.52	57.04
United_Kingdom	29.90	534.97	55.95
France			33.59	655.29	53.71
West_Germany	38.62	815.00	61.56
;
proc print;
run;
proc glm;
model ee = gdp pop/p;
Run;
OUTPUT OUT=DOS R=R2 P=P1;
RUN;
PROC PLOT;
PLOT R2*P1='*';
Run;


Japan			61.61	1040.45	116.78
USA				181.30	2586.40	227.64
