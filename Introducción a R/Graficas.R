#graficas

#para generar graficos, r se enfoca en la abciisa(funcion) y las observaciones
#curve(function(x), xmin, xmax)
#por ejemplo
curve(exp(x), 0, 1)
#tambien podemos utilizar plot para crear un grafico de dispercion
x<- c(1,2,4,5,6)
y <- c(3,7,3,7,10)
plot(x,y)
# al comando plot le podemos anadir tipos de funcion al grafico de dispercion
plot(x,y,type="l")

plot(x,y,type="b")
plot(x,y,type="o")
plot(x,y, type="s")
plot(x,y,type="h")
#para graficar varias funciones en un mismo grafico podemos utilizar el comando
#curve varias veces para sobreponerlas
#lwd indica la anchura de la linea
#lty el tipo de linea

curve( dnorm(x,0,1), -10, 10, lwd=1, lty=1)
curve( dnorm(x,0,2), add = TRUE, lwd=1, lty=2)
curve(dnorm(x,0,3), add= TRUE, lwd=1,lty=3)
#incluimos una leyenda
legend("topright", c("sigma=1", "sigma2=2", "sigma3=3"), lwd=1:3,lty = 1:3)


#plot
plot(x,y, main="outlier")
points(6,10)
text(5,9, "outlier", pos=3)
arrows(5,10,6,10, length = 0.15)

#con los siguientees datos podemos crear un histograma de lineas del numero ventas
# de los productos por producto
#creamos el eje x
anos <- c("2001", "2002", "2003", "2004", "2005", "2006")
#observaciones para el eje y
p1 <- c(3,2,1,5,7,9)
p2 <- c(3,4,6,7,3,1)
p3 <- c(3,1,0,4,6,2)
#juntamos las columnas en un objeto
sales <- cbind(p1,p2,p3)
matplot(anos,sales, type = "b", lwd=c(1,2,3), col="black")






