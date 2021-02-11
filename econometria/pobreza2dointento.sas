FILENAME REFFILE '/folders/myfolders/Econometria/pobreza_2010.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=pobreza2010;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=pobreza2010; RUN;
proc corr data=pobreza2010;
run;
proc sgscatter data=pobreza2010;
  matrix a1 b1 b2 b3 b4 c1 c2 d1 d2 e1 f1 /
     transparency=0 markerattrs=graphdata3(symbol=circlefilled);
run;
proc corr data=pobreza2010;
var a1 c1 c2 d1 d2 e1 f1;
with b4 b3 b1 b2;
run;
proc corr data=pobreza2010;
var  b4 b3 b1 b2 a1 c1 c2 d1 d2 e1 f1;
run;
proc reg data=pobreza2010;
title 'educacion';
model b4 b3 b1 b2=a1 c1 c2 d1 d2 e1 f1;
run;
proc reg data=pobreza2010;
title 'educacion';
model a1 = b4 b3 b1 b2 c1 c2 d1 d2 e1 f1/ selection=stepwise;
run;
proc reg data=pobreza2010;
title 'educacion';
model  b3= a1 c1 c2 d1 e1 f1/ selection=backward;
run;
proc sgscatter data=pobreza2010;
  matrix b3 a1 c1 c2 d1 d2 e1 f1 /
     transparency=0 markerattrs=graphdata3(symbol=circlefilled);
run;
proc reg data=pobreza2010;
title 'educacion';
model  b3= a1;
model  b3= d1;
run;
proc corr data=pobreza2010;
var a1 d1;
run;
