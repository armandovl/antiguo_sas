data datos;
input group1 group2 group3;
cards;
9 26 17
5 20 6
15 20 33
16 40 20
20 58 27
10 11 50
6 15 12
24 20 10
30 32 33
23 12 40
29 45 22
8 18 40
22 22 80
25 8 55
35 60 70
18 115 15
16 42 17
10 4 34
13 12 99
14 18 26
13 22 30
13 37 27
4 26 92
13 6 48
;
proc univariate normal;
var group1 group2 group3;
run;

proc transreg test detail;
model boxcox(group3)=identity(group1);
run;