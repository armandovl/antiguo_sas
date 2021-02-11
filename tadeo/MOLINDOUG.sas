Title "Modelo Regresión lineal"; 
Data Regresion;
Input Anio Prod Cap Sup Trab;
Cards; 
1970      31515     0.8546     14975        5436
1971      33862     0.8964     15454        5790
1972      33423     1.0042     15237        6435
1973      34633     0.9608     15903        6578
1974      35463     1.0000     14829        6700
1975      35679     1.1124     15686        6945
1976      35338     1.0826     14972        7100
1977      38977     1.1909     16234        7649
1978      42140     1.1583     16554        7840
1979      39656     1.2534     15022        7940
1980      43628     1.3794     16825        8067
1981      47138     1.6590     18576        8123
1982      45768     1.7092     15536        8120
1983      47674     1.4817     17343        8245
1984      48770     1.6516     17451        8300
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
1973      34633     0.9608     15903        6578
1974      35463     1.0000     14829        6700
1975      35679     1.1124     15686        6945
1976      35338     1.0826     14972        7100
1977      38977     1.1909     16234        7649
1978      42140     1.1583     16554        7840
1979      39656     1.2534     15022        7940
1980      43628     1.3794     16825        8067
1981      47138     1.6590     18576        8123
1982      45768     1.7092     15536        8120
1983      47674     1.4817     17343        8245
1984      48770     1.6516     17451        8300
;
proc glm;
model LProd= LCap LSup LTrab; 
options linesize =100 pagesize =300;
run;
quit;


