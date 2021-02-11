
/*backward: mete todos y saca los que no son significativos. Eliminación hacia atrás*/
Title "Ingenio Los Mochis Sinaloa"; 
Data Mochis_Tadeo;
Input O F S PE RE E;
Cards;
1	15.30	12.29	3.24	9.04	73.56
2	15.56	12.04	3.28	8.76	72.75
3	16.71	11.21	3.12	8.08	72.08
4	18.20	11.14	3.40	7.74	69.48
5	17.63	10.27	3.08	7.18	69.91
6	19.49	10.11	3.11	7.00	69.24
7	17.25	10.97	3.07	7.90	72.01
8	16.88	11.15	3.00	8.15	73.09
9	16.92	10.64	3.10	7.66	71.99
;
proc reg;
model RE= F S PE E/selection=backward;
run; 
quit;

/*stepwise: regresión por pasos*/
Title "Ingenio Los Mochis Sinaloa"; 
Data Mochis_Tadeo;
Input O F S PE RE E;
Cards;
1	15.30	12.29	3.24	9.04	73.56
2	15.56	12.04	3.28	8.76	72.75
3	16.71	11.21	3.12	8.08	72.08
4	18.20	11.14	3.40	7.74	69.48
5	17.63	10.27	3.08	7.18	69.91
6	19.49	10.11	3.11	7.00	69.24
7	17.25	10.97	3.07	7.90	72.01
8	16.88	11.15	3.00	8.15	73.09
9	16.92	10.64	3.10	7.66	71.99
;
proc reg;
model RE= F S PE E/selection=stepwise;
run; 
quit;

/*forward: selección hacia adelante*/
Title "Ingenio Los Mochis Sinaloa"; 
Data Mochis_Tadeo;
Input O F S PE RE E;
Cards;
1	15.30	12.29	3.24	9.04	73.56
2	15.56	12.04	3.28	8.76	72.75
3	16.71	11.21	3.12	8.08	72.08
4	18.20	11.14	3.40	7.74	69.48
5	17.63	10.27	3.08	7.18	69.91
6	19.49	10.11	3.11	7.00	69.24
7	17.25	10.97	3.07	7.90	72.01
8	16.88	11.15	3.00	8.15	73.09
9	16.92	10.64	3.10	7.66	71.99
;
proc reg;
model RE= F S PE E/selection=forward;
run; 
quit;

/*Modelo a estimar una vez que sabemos que variables son las que tienen relación*/
Title "Ingenio Los Mochis Sinaloa"; 
Data Mochis_Tadeo;
Input O F S PE RE E;
Cards;
1	15.30	12.29	3.24	9.04	73.56
2	15.56	12.04	3.28	8.76	72.75
3	16.71	11.21	3.12	8.08	72.08
4	18.20	11.14	3.40	7.74	69.48
5	17.63	10.27	3.08	7.18	69.91
6	19.49	10.11	3.11	7.00	69.24
7	17.25	10.97	3.07	7.90	72.01
8	16.88	11.15	3.00	8.15	73.09
9	16.92	10.64	3.10	7.66	71.99
;
proc reg;
model RE= S PE/clm;
run; 
quit;
