data antes;
set sasuser.florenciaconsumo;
If (PV__Kg_ ne .) and (semana=-1 or semana=-2 or semana=-3 or semana=-4 or semana=-5) then pesoinicial=PV__Kg_;
if 
output;
/*
proc print;
run;
*/
data algo;
set antes;
if pesoinicial=. then delete;
/*
proc print;
run;
*/


proc sort data=algo;
by id_vaca;
run;
data despues;
set sasuser.florenciaconsumo;
if semana>0;
proc sort data=despues;
by id_vaca;
data juntos;
merge algo despues;
by id_vaca;
keep id_vaca semana tratamiento promedio_de_cms_semana promedio_de_C_BTO_Semana PesoAnimal;
/* 
proc print data=juntos;
run;
*/

proc mixed data=juntos method=reml;
class tratamiento id_vaca semana;
model promedio_de_cms_semana= pesoanimal tratamiento semana tratamiento*semana/DDFM=Satterth;
repeated semana/type=vc sub=ID_vaca(Tratamiento);
random id_vaca(Tratamiento);
lsmeans tratamiento semana tratamiento*semana/pdiff adjust=tukey slice=semana;
run;

proc mixed data=juntos method=reml;
class tratamiento id_vaca semana;
model promedio_de_C_BTO_Semana PesoAnimal= pesoanimal tratamiento semana tratamiento*semana/DDFM=Satterth;
repeated semana/type=vc sub=ID_vaca(Tratamiento);
random id_vaca(Tratamiento);
lsmeans tratamiento semana tratamiento*semana/pdiff adjust=tukey slice=semana;
run;



/*
proc sort data=antes;
by ID_VACA semana;
run;

proc means data=antes noprint;
by ID_VACA semana;
var  PV__Kg_;
output out=datosantes mean=pesoanimal;
run;
proc print data=datosantes;
run;
*/
