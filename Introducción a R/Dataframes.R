##Data Frames

#la diferencia entre un data frame y una matriz es que rstudio los lee diferente
#vamos a crear un data frame a partir de una matriz

require(dplyr)

Matriz <- matrix(c(1,2,3,4,5,6), ncol = 3)
df <- as.data.frame(Matriz) # las columnas las lee como variables y
#las filas como observaciones

#anadir nombres a  un data frame#
#supongamos que las variables son productos y las observaciones son tiendas
productos <- c("producto1","producto2", "producto3")
tiendas  <- c("tienda1", "tienda2")

#le agregamos los nombres respectivos para cada tienda
colnames(df) <- productos
rownames(df) <- tiendas
df


# con el comando rbind y cbind juntamos nuevas observaciones y nuevas variables
#respectivamente
#supongamos que queremos totalizar el numero de productos de cada tienda
df$total <- df$producto1 + df$producto2 + df$producto3

#ahora nos queremos quedar con lsa tienddas cuyo valor total sea mayor a 10

df_m <- subset(df, total>=10)



