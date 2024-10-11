#ejercicio con datos del indice de desarrollo#
require(pacman)
p_load(ggplot2, dplyr, WDI)

#antes de correr cualquier regresion, debemos limpiar la base de datos que queremos
#queremos encontrar la expectativa de vida de las mujeres en EEUU.

df <- WDI(indicator = c("SP.DYN.LE00.FE.IN"), start = 1960, end = 2014)

head(df)
tail(df)
#filtramos los resultados para eeuu con la libreria dplyr y usamos la funcion pipes

df_new <- filter(df, iso2c=="US") %>% rename(LE_fem=SP.DYN.LE00.FE.IN) %>%
  select(year, LE_fem, country) %>% arrange(year)

#graficamos la expectativa de vida  de las mujeres desde 1960 hasta 2014

ggplot(df_new, mapping = aes(x=year,y=LE_fem)) + geom_line() + labs(title= "lifeexpectancy of women in EE.UU",
                                                                    subtitle="WDI indicators", 
                                                                    x = "years",
                                                                    y="Expectativa de vida")
setwd("C:/Users/richa/Music/Este pc/GIthub/Ejercicios-R/Introducción a R/graficas")
ggsave(filename = "LE_femInUSA.png")


##ahora vamos a calcular la expectativa de vida de las mujeres en el mundo arabe

df <- WDI(indicator = c("SP.DYN.LE00.FE.IN"), start = 1960, end = 2014)
df_ARAB <- filter(df, iso2c=="1A")

#quedamos con los datos que nos importan; anos y life expectancy

df_ARAB <- rename(df_ARAB, le_fem = SP.DYN.LE00.FE.IN) %>% select(year, le_fem)

#graficamos los resultados

ggplot(df_ARAB, mapping=aes(x=year, y=le_fem)) +geom_line() +labs(title="lifeexpectancy for women in arab world",
                                                                  x="years",
                                                                  y="life expectancy")

ggsave(filename = "expectativa de vida mundo arabe.png")


#ahora vamos a juntar los datos por nivel de ingresos para las mujeres en USA

#primero obtenemos los ingresos por pais
#para ello extraemos de la lista del WDI los paises con nivel de ingresos

df_countryIncome <- as.data.frame(WDI_data$country, stringsAsFactors = FALSE) %>%
  select(country, income) 


#ahora juntamos el vector de expectativa de vida, pais y año por nivel de ingresos

data_completaEEUU <- left_join(df_new, df_countryIncome)

#vamos a crear una nueva variable 
summarize(data_completa, LE_avg= mean(LE_fem, na.rm= TRUE)) 

#ahora supongamos que queremos encontrar el promedio de expectativa de vida para
#todos los paises
#1. encontramos la base de datos de la expectativa de vida  y cambiamos su nombre
df_total <- WDI(indicator = c("SP.DYN.LE00.FE.IN"), start = 1960, end = 2014) %>%
  rename(LE=SP.DYN.LE00.FE.IN)
#2. juntamos el ingreso por pais

dfcompleta <- left_join(df_total,df_countryIncome)


#3. creamos la variable para el promedio de la expectativa de vida para los paises\
promTotal <- dfcompleta %>%
              filter(income!="Aggregates") %>%             #filtrar por aquellos que no tienen la etiqueta aggregates
              filter(income != "Not classified")%>%        # filtar por aquellos que no tienen la etiqueta not classified
              group_by(income, year) %>%                  #agrupar por ingreso y ano
              summarize(LE_prom= mean(LE, na.rm=TRUE)) %>% # promedio por grupo
              ungroup()
#4. graficamos
ggplot(promTotal, mapping= aes(x=year, y= LE_prom, color = income)) + geom_line() 















