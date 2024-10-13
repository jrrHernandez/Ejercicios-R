#estadisticas descriptivas y distribuciones de probabilidad

require(pacman)
p_load(dplyr, wooldridge)

#descargamos la bese de datos del paquete de wooldridge
data(affairs, package = 'wooldridge')
#del paquete affairs obtenga las observaciones de la variable kids y pongale una etiqueta
haskids <- factor(affairs$kids, labels = c("no", "yes"))
#cree las etiquetas y por medio del procedimiento anterior obtenga el nivel de felicidad del matrimonio


mlab <- c("very unhappy", "unhappy", "average", "happy", "very happy")

marriage <- factor(affairs$ratemarr, labels = mlab)

##estadisticas descriptivas

#FRECUENCIA DE TENER HIJOS Y PROPORCION DE TENENCIA DE HIJOS
table(haskids)
prop.table(table(haskids))
##PORCENTAJE/PROPORCION DE SATISFACCION DE MARTIMONIO
prop.table(table(marriage))

#tabla de contingencia
tablaCont <- table(marriage, haskids)

#tabla de proporcion de satisfaccion de matrimonio y si tiene hijos
prop.table(tablaCont, margin=1)

##########Distribuciones discretas#######################

#diagrama de pastel
pie(table(marriage), col = gray(seq(0.2,1,0.2)))

#distribucion con una variable
barplot(table(marriage),
        horiz = TRUE, las=1,
        main="Distribution of Happines")

#distribucion con 2 variables
barplot(table(haskids, marriage),
        horiz = TRUE, las= 1, legend = TRUE,
        args.legend=c(x="bottonright"),
        main="felicidad por hijos")
#distribucion horizontal

barplot(table(haskids, marriage),
        beside = TRUE, las=2, legend=TRUE,
        args.legend = c(x="top"))
rm(list=ls())



######Distribuciones Continuas ##########
#cargamos una de las bases de datos de wooldridge
data("ceosal1", package = 'wooldridge')
ROE <- ceosal1$roe
#creamos un histograma

hist(ROE)

#creamos un histograma con la opcion de espaciado 5,10,20,60 (breaks)

hist(ROE,breaks=c(0,5,10,20))

#distribucion del del roe
plot(density(ROE))

#GRAFICAMOS la distribucion de probabilidad acumulada
ecdf(ROE)
plot(ecdf(ROE))


##FUNCIONES DE ESTADISTICAS DESCRIPTIVAS
#MEDIA
mean(ROE)
#MEDIAN
median(ROE)
#VARIANZA MUESTRAL
var(ROE)
#DESVIACION ESTANDAR
sd(ROE)
#COVARIANZA
cov(x,y)
#CORRELACION
cor(x,y)
quantile(x,q) ## q cuantial = 100*q. ejemplo: mitad de cuantil (mediana) quantile(x, 0.5)


########DISTRIBUCIONES DE PROBABILIDAD#############
#PARA CADA DISTRIBUCION SE PUEDE ENCONTRAR  
#  i)su densidad/masa de probabilidad (d)
#  ii) su CDF (p)
#  iii) su quantil(q)
#  iii) numero aleatorio que siga x distribucion (r)

#ejemplo
#p(X=x)= chooseI(n,x)p^x(n-x)
#distribucion de masa de probaabilidad para una bernoulli
x<- dbinom(x,10,prob = 0.2)


#ahora vamos a graficar la pmf
x <- seq(1,100, 2)
fx <- dbinom(x, 100, 0.2)
plot(x,fx,type="h")

#ahora vamos a graficar la cmf


fxd <- pbinom(x, 100, 0.2)
plot(x,fxd, type ="h")

# supongamos que queremos encontrar P(a<x<b) = F(b)- F(a) para una distribucion normal
set.seed(1234)
a<- 3
b<- 5
pnorm(b)- pnorm(a)
rnorm(10,0,1)

#intervalos de confianza
#formula estandar [ybarra - c*se(ybarra),ybarra + c*se(ybarra)]
ybarra <- mean(x)
n <- length(x)
s <- sd(x)
se <- s/sqrt(n)
c <- qt(0.975, n-1)
CI <- c(ybarra - c*se*ybarra,ybarra + c*se*ybarra)



#####PRUEBAS DE HIPOTESIS#######
#BUSCAR EN YT
#en general se utiliza el comando t.test(x)
t.test(x)
#especificaciones: Ho=mu=mu0, H1=mu1>mu0 #alteranative="greater"
#                  Ho=mu=mu0, H1=mu1>mu0 # alternative="less"
#                  nivel de significancia. conf.level=value
#                  mu=value

u<-t.test(x, mean=2, alternative = "greater")


########condicionales, loops y funciones####################
#condicionales
if (x>5) {
   x+3
} else {
  x-3
  
}
#loops
for (i in 1:6){          ##numero de veces de i que se repite
  if (i<6){
    print(i^2)
  } else {
    print(i^3)
  }
}
