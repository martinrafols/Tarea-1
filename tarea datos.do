clear
version 12
set more off
cap log close

clear
use "C:\Users\Martin Rafols\Documents\6to Semestre\censo2017.dta"

gen inmigrantes = 0
replace inmigrantes=1 if p12>2 & p12<10
egen tot=total(inmigrantes)
gen residentes=1
gen pcolumna=inmigrantes/tot
preserve
collapse (sum) residentes inmigrantes pcolumna, by(reg_new)
gen pfila=inmigrantes/residentes
table reg_new, c(sum inmigrantes sum residentes sum pfila sum pcolumna)
clear
use "C:\Users\Martin Rafols\Documents\6to Semestre\censo2017.dta"


gen trabajo=0 if p17>3 & p17<9
replace trabajo=1 if p17<4
gen notrabajo=1-trabajo
table area, c(sum trabajo sum notrabajo)
clear
use "C:\Users\Martin Rafols\Documents\6to Semestre\censo2017.dta"

gen residentes=1
gen inmigrantes = 0
replace inmigrantes=1 if p12>2 & p12<10
collapse (sum) residentes inmigrantes, by(comuna)
gen porcomuna = inmigrantes/residentes
table comuna, c(sum porcomuna)

**PREGUNTA 2***
**1
clear
use "C:\Users\Martin Rafols\Documents\6to Semestre\censo2017.dta"
gen mismacomuna=0
replace mismacomuna=1 if p10==1
sum mismacomuna
**2
gen cambiocomuna=0
replace cambiocomuna=1 if p10==3
sum cambiocomuna
**3
*lo que hice fue crear 2 bases de datos distintas de tal manera que cuando me tocara hacer el merge para ver los cambios de comuna pudiese obtener lma informacion de los ingresos de la comuna anterior*
merge m:1 comuna using "C:\Users\Martin Rafols\Downloads\data_ingresos (1).dta", nogenerate
merge m:1 p10comuna using "C:\Users\Martin Rafols\Documents\6to Semestre\dataingresos2.dta", nogenerate

gen masalto=0
replace masalto=1 if cambiocomuna==1 & ypchtot>ypchtot2
mean (masalto) if cambiocomuna==1
**4
gen sexo=p08-1
reg masalto sexo if cambiocomuna==1
test sexo
**5
reg masalto p14 if cambiocomuna==1
test p14
**6
preserve
collapse (sum) cambiocomuna , by (comuna)
list
preserve 
collapse (sum) cambiocomuna , by (p10comuna)

