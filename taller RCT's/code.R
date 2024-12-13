#taller Random controll trials 
#NOTA: Este ejercicio es exclusivo de la Universidad de los Andes y se realiza con
#      fines pedagogicos
#cargamos las librerias con pacman y seleccionamos el directorio
require(pacman)
p_load(rio, dplyr, stargazer)

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

#b) regresion lineal

modelo1 <- lm(health_index ~ insurance, data = df)
stargazer(modelo1, type = "text")
  

#resultados


#==============================================
#               Dependent variable:    
#  ---------------------------
#                        health_index        
#-----------------------------------------------
#  insurance                    1.438***          
#                               (0.098)          

#Constant                     37.657***         
#                              (0.089)          

#-----------------------------------------------
#  Observations                  80,634           
#R2                             0.003           
#Adjusted R2                    0.003           
#Residual Std. Error     10.560 (df = 80632)    
#F Statistic         215.041*** (df = 1; 80632) 
#===============================================
#  Note:               *p<0.1; **p<0.05; ***p<0.01

#interpretacion

# Primero debemos corroborar si es estadisticamente significativo, para ello.
# 2*error_estandar < |b1|. lo cual 0.19 < |1.4|. Se concluye que es estadisticamente significativo.
# Se interpreta b1 como: En promedio, si la persona cuenta con seguro de salud, su indice de salud aumenta 1.43 puntos


#c) para verificar si eiste una diferencia sistematica debemos comparar aquellos que tienen seguro de salud con aquellos que no
# para ello realizamos una prueba de hipotesis. Pero primero extraemos variables

conS <- df %>% filter(insurance==1)
sinS <- df %>% filter(insurance==0)
#realizamos un loop para que realice la prueba de hipotesis para cada observacion en 
variables_to_compare <- c("age", "famsize", "sex", "educ", "inc", "nwhite", "health_index")
resultados <- list()

for (var in variables_to_compare) {
  conSe <- conS[[var]]
  sinSe <- sinS[[var]]
  t_test <- t.test(conSe, sinSe, na.rm=TRUE)
  resultados[[var]] <- list(
    media_con_seguro = mean(conSe, na.rm = TRUE),
    media_sin_seguro = mean(sinSe, na.rm = TRUE),
    t_stat = t_test$statistic,
    p_value = t_test$p.value
  )
}
resultados
resultados$age
resultados$famsize

#age p valor    |  
# 2.097508e-82  | 1.076379e-53


#d) regresion con todas las variables\


modelototal <- lm(health_index ~ insurance + nwhite + inc + educ + sex + famsize + age, data = df)

stargazer(modelototal, type = "text")

#================================================
#  Dependent variable:     
#  ----------------------------
# health_index        
#------------------------------------------------
#  insurance                     0.417***          
#                               (0.090)           

#nwhite                       -1.273***          
#                               (0.077)           

#inc                          0.00004***         
#                               (0.00000)          
#
#educ                          0.215***          
#                               (0.007)           

#sex                          -0.229***          
#                               (0.067)           

#famsize                      -0.331***          
#                               (0.022)           

#age                          -0.225***          
#                               (0.002)           

#Constant                     42.372***          
#                             (0.156)           

------------------------------------------------
#  Observations                   80,634           
#R2                             0.204            
#Adjusted R2                    0.204            
#Residual Std. Error      9.437 (df = 80626)     
#F Statistic         2,945.656*** (df = 7; 80626)
#================================================
#  Note:                *p<0.1; **p<0.05; ***p<0.01
