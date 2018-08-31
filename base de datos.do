import delimited "C:\Users\Martin Rafols\Downloads\Microdato_Censo2017-Personas\Microdato_Censo2017-Personas.csv", delimiter(";")

gen reg_new = 2 if region == 1
replace reg_new = 3 if region == 2
replace reg_new = 4 if region == 3
replace reg_new = 5 if region == 4
replace reg_new = 6 if region == 5
replace reg_new = 8 if region == 6
replace reg_new = 9 if region == 7
replace reg_new = 12 if region == 9 
replace reg_new = 14 if region == 10
replace reg_new = 15 if region == 11
replace reg_new = 16 if region == 12
replace reg_new = 7 if region == 13
replace reg_new = 13 if region == 14
replace reg_new = 1 if region == 15
replace reg_new = 11 if region == 8 & provincia != 84
replace reg_new = 10 if region == 8 & provincia == 84
save "C:\Users\Martin Rafols\Documents\6to Semestre\censo2017.dta", replace

use "C:\Users\Martin Rafols\Documents\6to Semestre\dataingresos2.dta"
rename ypchot ypchot2
rename comuna p10comuna
save "C:\Users\Martin Rafols\Documents\6to Semestre\dataingresos2.dta", replace
