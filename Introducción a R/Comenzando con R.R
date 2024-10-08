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

require(pacman)
p_load(dplyr)
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
u <- c(3,5,2,1,0)
#funciones para analizar vectores
length(x)
max(x)
min(x)
sort(x)
sort(u) ## organiza de menor a mayor
sum(x) ## suma los elementos
prod(x) #aplica el producto
numeric(x)
seq(10) ##secuencia del 1-10
seq(2,10)
seq(1,10,2)#secuencia del 1 hasta 10, sumando de 2



##operadores logicos##
x==y ##le preguntamos si el vector x es igual al de y. respuesta Falso
x<y
x<=y
x>y
x>z
x!=y
!x  #b es falso
a|b ## o a es verdadero o b es verdadero, o los 2
a&b # a y b son verdaderos

##nota: los vectores no necesariamente deben ser numericos, tambien pueden ser strings
ciudades <- c("bogota", "munich", "buenos aires")
ciudades != x

#incluir etiquetas a vectores
xe <- factor(x, labels =c("pequeno", "mediano", "grande", "extra grande", "gigantesco"))


#indexar
x <- seq(1,10)
elemento3dex <- x[3]

#ponerle nombre a vectores
x<- seq(1,3)
equis <- c("uno", "dos", "tres")
names(x) <- equis
sqrt(x)
max(x)

######crear matrices#####
v <- c(1,2,3,4)
A <- matrix(v, nrow=2)
fila1<- c(1,2) ; fila2 <- c(3,4)
A2 <- rbind(fila1, fila2) # por sus siglas: rowbind, incluye filas

col1<- c(1,3) ; col2<-c(2,4)
A3 <- cbind(col1, col2)  # por sus siglas: columbind, incluye columnas

###anadir nombres a filas y columnas###

colnames(A) <- c("columna1", "columna2")
rownames(A) <- c("fila1","fila2")

## Diaogonal de una matrix, identidad, indexar matrices y operaciones ##
A <- diag(c(4,3,2)) %>% cbind(c(4,0,1)) %>% rbind(c(0,3,4))

B <- diag(3)
B
#multiplicacion de matrices

C <- A%*%B

#transpuesta
a <- t(A)
a
##listas##
#en las listas se pueden almacenar nombres, matrices, vectores en un solo listado

lista1 <- list(x=seq(1,10, 2), F=matrix(c(1,2,3,4), nrow=2), 
               ciudades = c("cartagena","medellin", "moscow"))
#extraemos el primer elemento de la lista
lista1$x

#extraemos el segundo elemento de la lista
lista1$F


#extraemos el tercer elemnto de la lista
lista1$ciudades
