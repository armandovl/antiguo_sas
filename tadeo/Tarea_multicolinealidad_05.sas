Title "Tarea 5";
Data Multicolinealidad;
input Anio dpib PIB_Mill Fa Empleos_Agricolas Empleos_No_Agricolas Total_Empleos;
cards;
1947	83.0	234289	1590	8256	38407	60323
1948	88.5	259426	1456	7960	39241	61122
1949	88.2	258054	1616	7497	39196	61187
1950	89.5	284599	1650	8017	37196	60171
1951	96.2	328975	3099	7048	41460	63221
1952	98.1	346999	3594	6792	42216	63639
1953	99.0	365385	3547	6555	43587	64989
1954	100.0	363112	3350	6495	42271	63761
1955	101.2	397469	3048	6718	43761	66019
1956	104.6	419180	2857	6572	45131	67857
1957	108.4	442769	2798	6222	45278	68169
1958	110.8	444546	2637	5844	43530	66513
1959	112.6	482704	2552	5836	45214	68655
1960	114.2	502601	2514	5723	45850	69564
1961	115.7	518173	2572	5463	45397	69331
1962	116.9	555894	2824	5190	46652	70551
;
Proc reg;
model PIB_Mill = Fa Empleos_Agricolas Empleos_No_Agricolas;
Run;
Quit;

Proc reg;
model PIB_Mill = Fa Empleos_Agricolas Empleos_No_Agricolas/ selection=forward;
model PIB_Mill = Fa Empleos_Agricolas Empleos_No_Agricolas/ selection=backward;
model PIB_Mill = Fa Empleos_Agricolas Empleos_No_Agricolas/ selection=stepwise;
Run;
Quit;

Proc corr;
var PIB_Mill Fa Empleos_Agricolas Empleos_No_Agricolas;
Run;
Quit;


