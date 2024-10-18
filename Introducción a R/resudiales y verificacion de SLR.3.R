#resuduales, coeficioentes, valores ajustafdos y verificacion SLR.3
require(pacman)
p_load(dplyr, wooldridge, strargazer)

#cargamos una base de dat
data(ceosal1, package='wooldridge') 

#cargamos una regresion
modelo1 <- lm(salary ~ roe, data=ceosal1)
names(modelo1)
#obtenemos los coeficientes
modelo1betas <- modelo1$coefficients
#obtenemos los residuales
modelo1residuals <- modelo1$residuals

#extramos las variables de interes de la base de datos

salario <- ceosal1$salary
roe <- ceosal1$roe
#juntamos 

df_new <- cbind(salario, roe, modelo1residuals) %>% as.data.frame()

#verificacion del supuesto E[u|x]=0

mediacond1<- df_new %>% group_by(roe) %>% summarize(mediacondi = mean(modelo1residuals))
mean(mediacond1$mediacondi)
