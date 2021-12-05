data dietas_borregos;
input id dieta ganacia_peso;
cards;
1 1 350
2 1 320
3 1 380
4 1 405
5 1 390
6 1 360
7 1 350
8 1 410
9 1 320
10 1 370
1 2 460
2 2 410
3 2 395
4 2 460
5 2 490
6 2 395
7 2 455
8 2 430
9 2 480
10 2 420
;
proc ttest;
class dieta;
var ganacia_peso;
title 'Comparacion de dos tipos de dietas en borregos';
run;
