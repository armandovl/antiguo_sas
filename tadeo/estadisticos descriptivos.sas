
FILENAME REFFILE '/folders/myfolders/Bases Kaggle/honeyproduction.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=MIEL_USA;
	GETNAMES=YES;
RUN;

proc univariate data=miel_usa normal plot ;
var yieldpercol;
run;

proc univariate data=miel_usa normaltest freq ;
var year;
run;

proc means data=miel_usa;
var yieldpercol;
run;

proc univariate data=miel_usa normal normaltest;
var yieldpercol;
run;

proc ttest data=miel_usa;
var yieldpercol;
run;

proc means data=miel_usa n mean median cv lclm uclm min p25 p50 p75 max skewness;
var yieldpercol;
run;

proc ttest data=miel_usa;
var yieldpercol;
run;

proc freq;table year;
run;

proc freq;tables year;
run;

proc freq;table year state;
run;

proc freq; 
table year*state; 
run;

