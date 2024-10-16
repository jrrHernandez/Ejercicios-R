*************************************************
* 			TALLER PRACTICO 1 					*			
* 	José Ricardo Ricardo Hernández - 202113889  *
*************************************************
clear all
cap log close
*Abrimos la base de datos
use "C:\Users\richa\OneDrive - Universidad de los Andes\Universidad\Intersemestral\ecometria 2\Bases\20240607_Tarea_01.dta"
						********* a) ***************

*generamos el ln(salarios_hora) y su histograma*
gen lsalarios = ln(salarios_hora)
local salario_minimo_mensual = 737717
local salario_minimo_hora = `salario_minimo_mensual'/160
gen temp_salario_minimo_hora = `salario_minimo_hora'
gen temp_log_salario_minimo_hora = log(temp_salario_minimo_hora)
summarize temp_log_salario_minimo_hora
local log_salario_minimo_hora = r(mean)

* Crear el histograma con la línea vertical en el logaritmo del salario mínimo por hora
histogram lsalarios, xline(`log_salario_minimo_hora') title("Histograma de lsalarios")

* Eliminar variables temporales
drop temp_salario_minimo_hora temp_log_salario_minimo_hora

						********* b) ***************
*variable dependiente salario por hora y variable independiente esc (anos de escolaridad)
cd "C:\Users\richa\OneDrive - Universidad de los Andes\Universidad\Intersemestral\ecometria 2\Resultados"
reg salarios_hora esc
outreg2 using resultados.doc, replace excel

*variable dependiente lsalarios y variable independiente esc
reg lsalarios esc
outreg2 using resultadoslsaldo.doc, replace excel

						********* c) ***************
* generamos las estadisticas descriptivas
summarize salarios_hora, detail

* Generar las estadísticas descriptivas sin los percentiles extremos (1 y 99) 
xtile p1_p99 = salarios_hora, nq(100)
drop if p1_p99 <= 1 | p1_p99 >= 100
summarize salarios_hora


						********* d) ***************
*generamos la variable experiencia y experiencia^2 y su reg
gen experiencia = edad - esc - 6
gen experiencia2 = experiencia^2
reg salarios_hora esc experiencia experiencia2
outreg2 using resultadosultimaregresion.doc, replace 
sum experiencia


						
