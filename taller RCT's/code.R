#taller Random controll trials 
#NOTA: Este ejercicio es exclusivo de la Universidad de los Andes y se realiza con
#      fines pedagogicos
#cargamos las librerias con pacman y seleccionamos el directorio
require(pacman)
p_load(rio, dplyr)

setwd("C:/Users/richa/Music/Este pc/GIthub/Ejercicios-R/taller RCT's")
###################PRIMERA PARTE##################################

#cargar bases de datos#
df <-import("C:/Users/richa/Music/Este pc/GIthub/Ejercicios-R/taller RCT's/bases/NHIS.dta")
#realizamos estadisticas descriptivas para cada una de las variables continuas
                          #age#
mean(df$age)
var(df$age)
sd(df$age)
min(df$age)
max(df$age)
# la media de la edad para los encuestados es de aproximadamente 35 años. su varianza
# es de 495 aproximadamente y su desviacion estandar es de 22 años. el minimo es 0 y la edad maxima 85
                  #famsize; tamaño de la familia#
mean(df$famsize)
var(df$famsize)
sd(df$famsize)
min(df$famsize)
max(df$famsize)
#En promedio, el total de los encuestados, conforman una familia de 3 personas.
#adicionalmente, la varianza es de 3 y su desviacion estandar es de 1 personas.
#la conformacion minima de familia es de 1 y la mayor de 18

                       #educ#
mean(df$educ)
var(df$educ)
sd(df$educ)
min(df$educ)
max(df$educ)
# los años promedio de educacion de los encuestados son 14 años aproximadamente.
#la variabilidad en los años de educación son 6 años de educación. Y su varianza 
#es de 38 años. el minimo de educacion son cero y el maximo 24.
                      #inc; ingreso#

mean(df$inc)
var(df$inc)
sd(df$inc)
min(df$inc)
max(df$inc)
#la media de ingreso para un nucleo familiar es de 68.452,72 pesos mensuales. 
#si nos movemos 1 desviación estandar serían 68452.72+54493.7= 122945.7 pesos mensuales
#igualmente, la varianza es 2969562811. El minimo es de 19282 pesos y el maximo 167844


                      #health_index
mean(df$health_index)
var(df$health_index)
sd(df$health_index)
min(df$health_index)
max(df$health_index)
# la media del indice de salud es de 38. Su varainza es de 111 puntos y su desviacion estandar de 10
# la persona con menor indice es de 6.39 puntos y la persona con mayor indice es 54


# realizamos estadísticas descriptivas para variables dummy
                      #sex 
table(df$sex)
prop.table(table(df$sex))
# de las 80.634 observaciones, 38997 son mujeres y 41637 son hombres. En porcentaje, el 48.3629% son mujeres 
# y el 51.63% son hombres.

                     #nwhite
table(df$nwhite)
prop.table(table(df$nwhite))

#de las 80.634 observaciones 60151 son blancas y 20483 son no blancas. En porcentaje, 74.9% son blancas y el 25.1% son no blancas.


                      #Insurance 
table(df$insurance)
prop.table(table(df$insurance))

#14037 no cuentan con seguro de salud y 66597 si cuentan con un seguro de salud. Esto equivale a 17.6% no tiene seguro de salud y el 82.6% si tiene un seguro de salud.


#################SEGUNDA PARTE##################################

#a) prueba de hipotesis 

t_test_result <- t.test(health_index ~ insurance, data = df, var.equal = FALSE)

##resultados:

#             Welch Two Sample t-test

#       data:  health_index by insurance
#       t = -14.819, df = 20606, p-value < 2.2e-16
#     alternative hypothesis: true difference in means between group 0 and group 1 is not equal to 0
#     95 percent confidence interval:
#     -1.628442 -1.247983
#     sample estimates:
#       mean in group 0 mean in group 1 
#     37.65650        39.09472 


#la hipotesis alternativa nos dice que la diferencia de medias entre el grupo que tiene seguro de salud no es igual
# a la media de los que no tienen seguro de salud. Al ver el el p valor tan bajo, se puede concluir que hay hay 
#diferencia significativa entre el indice de salud de quienes tienen un seguro y quienes no.


  










