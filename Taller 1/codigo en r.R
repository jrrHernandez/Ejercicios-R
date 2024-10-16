#taller 1 de ecoometria 2 intersemestral


require(pacman)
p_load(rio, dplyr)

getwd()
setwd("C:/Users/richa/Music/Este pc/GIthub/Ejercicios-R/Taller 1/Bases/")
data<-import("20240607_Tarea_01.dta")
#creamos la variable ln de saldos por hora y la incluimos en la base de datos
lnsaldo <- log(data$salarios_hora)
data <- cbind(data, lnsaldo) 

#creamos un histograma
hist(data$lnsaldo)
abline(v=737717)

#b)

modelo_1 <- lm(data$salarios_hora ~ data$esc)

modelo_2 <- lm(data$lnsaldo ~ data$esc)

plot(data$esc, data$salarios_hora)
abline(modelo_1)

stargazer::stargazer(modelo_1, modelo_2, type="text")
#interpretamos los resultados
#==============================================================
#Dependent variable:     
#  ----------------------------
#  salarios_hora    lnsaldo    
#(1)           (2)      
--------------------------------------------------------------
#  esc                                602.120***      0.089***   
# (2.987)       (0.0003)   

#Constant                           -619.227***     7.331***   
#  (32.750)       (0.003)    

#--------------------------------------------------------------
#  Observations                         295,313       295,313    
#R2                                    0.121         0.254     
#Adjusted R2                           0.121         0.254     
#Residual Std. Error (df = 295311)   7,541.263       0.712     
#F Statistic (df = 1; 295311)      40,628.420*** 100,347.500***
#  ==============================================================
#  Note:                              *p<0.1; **p<0.05; ***p<0.01
#
#
# para el modelo 1: un ano adicional de escolaridad aumenta 602.120 pesos adicionales
#lnsaldo : un ano adicional de escolaridad aumenta la prob del salario en un 8.9% 
############################################################
#c) estadisticas descriptivas de las variables
#eliminamos missing values
dataclean <- data %>% 
            filter(salarios_hora != is.na(TRUE))  


density(dataclean$salarios_hora)
#      x                   y            
#Min.   :   -470.6   Min.   :0.000e+00  
#1st Qu.: 291431.3   1st Qu.:0.000e+00  
#Median : 583333.3   Median :0.000e+00  
#Mean   : 583333.3   Mean   :4.953e-06  
#3rd Qu.: 875235.3   3rd Qu.:2.300e-09  
#Max.   :1167137.3   Max.   :9.068e-04  
 
quantile(dataclean$salarios_hora)
