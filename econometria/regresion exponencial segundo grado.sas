data leche;
input dias litros @@;
x2=dias**2;
cards;
15 11.9 165 11.30
30 11 180 11
45 12.5 195 10
60 14 210 9.5
75 14.2 225 9
90 14.4 240 8.5
105 13.9 255 8.3
120 13 270 8
135 12.5 285 7.8
150 12 305 7.70
;
proc corr data=leche;
run;
proc sgplot data=leche;
	scatter x=dias y=litros /;
	xaxis grid;
	yaxis grid;
run;
proc glm data=leche;
model litros= dias x2;
run;
proc glm data=leche;
model litros= dias x2/solution;
run;
proc glm data=leche;
model litros= dias;
run;



