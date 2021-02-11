Data uriza;
Input GAP TCPib Pais $;
logTCPib = log(TCPib);
logGPA = log (GPA);
Cards;
0.60   0.94  Colombia
1.73   0.50  Salv
4.05   1.00  Hond
3.69   1.38  Vene
3.57   2.06  Arg
5.36   1.81  Boliv
7.62   2.00  LAC 
1.67   2.44  Guat
7.50   2.88  Costa_Rica
7.38   3.13  Chile
5.36   4.38  Peru
7.98   3.31  Ecua
12.98  3.50  Bras
10.83  3.94  Nica
14.29  5.31  Pana
11.19  5.63  RepDom
4.40   1.25  Para
proc glm;
model TCPib = GAP;
quit;

Data uriza2;
Input GAP TCPib Pais $;
logTCPib = log(TCPib);
logGPA = log (GPA);
Cards;
0.60   0.94  Colombia
1.73   0.50  Salv
4.05   1.00  Hond
3.69   1.38  Vene
3.57   2.06  Arg
5.36   1.81  Boliv
7.62   2.00  LAC 
1.67   2.44  Guat
7.50   2.88  Costa_Rica
7.38   3.13  Chile
5.36   4.38  Peru
7.98   3.31  Ecua
12.98  3.50  Bras
10.83  3.94  Nica
14.29  5.31  Pana
11.19  5.63  RepDom
22.98  1.81  Mx
4.40   1.25  Para
proc glm;
model TCPib = GAP;
quit;


Data uriza3;
Input GAP TCPib Pais $;
logTCPib = log(TCPib);
logGPA = log (GPA);
Cards;
0.60   0.94  Colombia
1.73   0.50  Salv
4.05   1.00  Hond
3.69   1.38  Vene
3.57   2.06  Arg
5.36   1.81  Boliv
7.62   2.00  LAC 
1.67   2.44  Guat
7.50   2.88  Costa_Rica
7.38   3.13  Chile
5.36   4.38  Peru
7.98   3.31  Ecua
12.98  3.50  Bras
10.83  3.94  Nica
14.29  5.31  Pana
11.19  5.63  RepDom
4.40   1.25  Para
5.0     .    Barbados
6.0     .    Caiman
23.94    .    Ecuador2
proc glm;
model TCPib=GAP / cli;
quit;

Data uriza;
Input GAP TCPib Pais $;
logTCPib = log(TCPib);
logGPA = log (GPA);
Cards;
0.60   0.94  Colombia
1.73   0.50  Salv
4.05   1.00  Hond
3.69   1.38  Vene
3.57   2.06  Arg
5.36   1.81  Boliv
7.62   2.00  LAC 
1.67   2.44  Guat
7.50   2.88  Costa_Rica
7.38   3.13  Chile
5.36   4.38  Peru
7.98   3.31  Ecua
12.98  3.50  Bras
10.83  3.94  Nica
14.29  5.31  Pana
11.19  5.63  RepDom
4.40   1.25  Para
proc reg;
model TCPib = GAP;
quit;
/* Irving llego tarde */
