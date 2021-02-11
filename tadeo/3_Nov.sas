Title 'Grado de estrés de los trabajadores';
Data Estres;
Input x1 x2 x3 x4 y;
lx1= log(x1); lx2=log(x2); lx3=log(x3); lx4= log(x4); ly= log(y);
Cards;
812	15	30	38	101
334	8	20	52	60
377	5	20	27	10
303	10	54	36	27
505	13	52	34	89
401	4	27	45	60
177	6	26	50	16
598	9	52	60	184
412	16	34	44	34
127	2	28	39	17
601	8	42	41	78
297	11	84	58	141
205	4	31	51	11
603	5	38	63	104
484	8	41	30	76
302	9	44	42	.
351	8	65	62	.
381 9	52	53	.
;
proc corr;
var x1 x2 x3 x4;
proc reg;
model ly= lx1 lx3 lx4/clm;
run;
quit;



Title 'Grado de estrés de los trabajadores';
Data Estres;
Input x1 x2 x3 x4 y;
Cards;
812	15	30	38	101
334	8	20	52	60
377	5	20	27	10
303	10	54	36	27
505	13	52	34	89
401	4	27	45	60
177	6	26	50	16
598	9	52	60	184
412	16	34	44	34
127	2	28	39	17
601	8	42	41	78
297	11	84	58	141
205	4	31	51	11
603	5	38	63	104
484	8	41	30	76
302	9	44	42	.
351	8	65	62	.
381 9	52	53	.
;
proc reg;
model y= x1 x3 x4/clm;
run;
quit;






.	302	9	44	42
.	351	8	65	62
.	381 9	52	53

