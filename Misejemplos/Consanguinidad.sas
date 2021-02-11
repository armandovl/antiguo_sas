options ps=80 ls = 80;
data genetics;
input animal$ father$ mother$;
cards;
y11 . .
x11 . .
d11 y11 x11
b11 y11 x11
c11 b11 d11
a11 b11 c11
;
proc inbreed ind covar matrix;
run; quit;
