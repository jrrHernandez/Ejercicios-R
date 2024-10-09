#manipulacion de datos
#utilizamos el paquete pacman para requerir 2 librerias al mismo tiempo
#la librerira ggplot inluye varios paquetes de datos, como mpg
#ggplot, significa grammar of graphics
######FUNCIONES IMPORTANTES#######
#geom_point() son puntos
#geom_line() son lineas
#geom_smooth() una regresion no parametrica
#geom_area() ribbon
#geom_boxplot() boxplot




require(pacman)
p_load(dplyr,ggplot2)
head(mpg)
#toda grafica con la libreria empieza con ggplot

ggplot() + geom_point(data =mpg, mapping= aes(x=displ, y=hwy)) +
  geom_smooth(data=mpg, mapping=aes(x=displ,y=hwy))
# dado que esta forma repite ciertos valores, puede parecer redundante. Para ello
#ggplot tiene la siguiente solucion

