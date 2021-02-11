options ps=80 ls=80;
data ejer;
input animal padre madre;
cards;
1 . .
2 1 .
3 1 2
4 . 2
5 3 4
6 . 2
7 5 6
;
proc inbreed ind covar matrix;
run; quit;