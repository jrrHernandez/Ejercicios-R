#getting started with r
#run a large code wirh ;
#correr todo el script con ctr + a
#si no queremos descargar una libreria
libreria :: funcion()
#descargar librerias importantes
install.packages(c("AER", "car", "censReg","dplyr", "dummies", "dynlm", 
                   "effects", "ggplot2", "lmtest", "maps", "mfx", "orcutt", "plm",
                   "quantmod", "sandwich", "quantreg", "rio", "rmarkdown", "sample selection",
                   "stargazer", "survival", "systemfit", "truncreg", "tseries", 
                   "ulcra", "xtable", "vars", "WDI", "wooldridge", "xts", "zoo"))

#obtener directorio de trabajo y seleccionar uno
getwd()
setwd("C:/Users/richa/Music/Este pc/GIthub/Ejercicios-R/Introducción a R")

########funciones Aritmericas#############
#valor absoluto
x<- -4
abs(x)
#raiz cuadrada
sqrt(abs(x))
#exponencial
exp(x)
#logaritmo
log(abs(x))
#logaritmo de a en base b
a<- 10
b<- 4
log(a,b)
#redondear un numero a con b digitos
round(a,b)
#factorial
factorial(b)
#coeficiente binomial
choose(a,b)
###########Incluir elementos dentro de elementos
x <- 3 + exp(a)
y <- x^2


#####vectores
x <- c(1,2,3,4,5)
y <- x + 1
z <- x+y
w <-z*y
exp(w)

#funciones para 