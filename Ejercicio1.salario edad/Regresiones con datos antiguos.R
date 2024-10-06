#Regresiones en r sturio 
#cargamos la base de datos

setwd("C:/Users/richa/Music/R practica")
df <- import("Input/20240607_Tarea_01.dta")
df_clean<- subset(df, !is.na(salario))

#creamos el modelo1 donde la variable dependiente es el salario y
#la independiente la edad.

require(pacman)
p_load(stargazer, dplyr)
modelo1 <- lm(salario ~ edad, data = df_clean)

#creamos el modelo 2: regresión multiple salario = a0edad + a1esc+ a2edad
modelo2<- lm(salario ~ edad + esc + area, data = df_clean)

#presentamos los resultados#
stargazer(modelo1, modelo2, 
          type = "text",out = "output/resultados_regresión.xlsx")
#presentamos el grafico de dispercioon del modelo1
  #eliminamos missinvalues en salario
plot(df_clean$edad, df_clean$salario,
     main = "grafico de dispersion",
     xlab = "edad",
     ylab = "salario")


# Agregar la línea de regresión y leyenda
abline(modelo1, col = "blue", lwd = 2)



