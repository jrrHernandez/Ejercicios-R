#simulacion de montecarlo
set.seed(666)

#definimos el tamaño de la muestra
n <- 10000
#definimos los parametros reales
b0<- 1 ; b1 <- 0.5 ; su <- 2

x <- rnorm(n,4,1)
u <- rnorm(n,0,su)
y <- b0+b1*x+u

regresion <- lm(y~x)

rm(list=ls())


#2. simulacion de montecarlo
set.seed(1234567)
n<-1000 ; r<- 10000
b0 <- 1 ; b1 <- 0.5 ; su <- 2
#inicializamos: creamos un vector de tamano r para que los valores en el loop se guarden ahi
b0hat <- numeric(r)
b1hat <- numeric(r)
x <- rnorm(n,4,1)

#loop#
for(j in 1:r){ #0.
#1. 
  #extraiga una muestra de y
  u<-rnorm(n,0,su)
  y<- b0 + b1*x+u
  bhat <- coefficients(lm(y~x))
  #2.
  b0hat[j]=bhat["(Intercept)"]
  b1hat[j]=bhat["x"]  
  #3.
}
#explicacion del loop en palabras: #0. para cada j desde 1 hasta r realiza el siguiente proceso
#1. obtenga una muestra de y; donde y es una linea de regresion. Igualmente, obtenga los coeficientes
# y guardelos en el vector bhat
#2. adicionalmente, guarde el resultado de cada coeficioente en su respectivo vector de la interaccion j
#3. repita para el siguiente j.

plot(NULL, xlim= c(0,8), ylim=c(1,6))
for(j in 1:10) abline(b0hat[j],b1hat[j], col="gray")
abline(b0,b1, lwd=2)

