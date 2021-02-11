/*Tres graficas
Rebolledo pagina 102
*/
Data externoEXP;

/*Es un archivo de excel delimitado por espacios .prn, para este sas siempre en la carpeta myfolder*/
infile '/folders/myshortcuts/Myfolder/Misejemplos/DatosEXP.prn' firstobs=2;

Input Tratamiento Bloque Nitrogeno Fosforo Densidad Rendimiento;

Proc plot;
plot rendimiento*nitrogeno;
plot rendimiento*nitrogeno='#';
plot rendimiento*nitrogeno='#' rendimiento*fosforo='X' rendimiento*tratamiento='M'/overlay;
*el overlay es para que esten juntas las tres graficas;
run;