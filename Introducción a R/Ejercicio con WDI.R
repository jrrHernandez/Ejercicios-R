#ejercicio con datos del indice de desarrollo#
require(pacman)
p_load(ggplot2, dplyr, WDI)

#antes de correr cualquier regresion, debemos limpiar la base de datos que queremos
#queremos encontrar la expectativa de vida de las mujeres en EEUU.

df <- WDI(indicator = c("SP.DYN.LE00.FE.IN"), start = 1960, end = 2014)

head(df)
tail(df)
#filtramos los resultados para eeuu

df_new <- filter(df, iso2c=="US") %>% rename(LE_fem=SP.DYN.LE00.FE.IN) %>%
  select(year, LE_fem) %>% arrange(year)

#graficamos la expectativa de vida  de las mujeres desde 1960 hasta 2014

ggplot(df_new, mapping = aes(x=year,y=LE_fem)) + geom_line() + labs(title= "lifeexpectancy of women in EE.UU",
                                                                    subtitle="WDI indicators", 
                                                                    x = "years",
                                                                    y="Expectativa de vida")
setwd("C:/Users/richa/Music/Este pc/GIthub/Ejercicios-R/Introducción a R/graficas")
ggsave(filename = "LE_femInUSA.png")




