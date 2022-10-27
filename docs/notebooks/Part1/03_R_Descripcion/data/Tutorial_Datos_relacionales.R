library(dplyr)

# Datos
## Descargarlos de https://github.com/coletl/tidy_intro/tree/master/data
##
contrib = readRDS("data/zip_contrib.rds")
flood = readRDS("data/zip_flood.rds")

View(contrib)
View(flood)

# Mutating joins
## Inner Join

datos_ij = inner_join(contrib, flood, by = "zip")
print(paste("Tamaño dataset contrib", dim(contrib)))
print(paste("Tamaño dataset flood", dim(flood)))
print(paste("Tamaño dataset datos_ij", dim(datos_ij)))
View(datos_ij)


## Left / Right Join
existe.na = function(x){sum(is.na(x))}

datos_lj <- left_join(contrib, flood, by = "zip")
print(paste("Tamaño dataset datos_lj", dim(datos_lj)))
sapply(datos_lj, FUN =existe.na) # Generamos NA
View(datos_lj) 


## Full join
data_fj <- full_join(contrib, flood, by = "zip")
print(paste("Tamaño dataset data_fj", dim(data_fj)))
sapply(data_fj, FUN =existe.na)
View(data_fj) 

# Filter joins
#Queremos mantener todas las observaciones en la tabla de contribuciones (contrib) 
#que han tenido alguna inundación (flood), deberíamos ejecutar el siguiente código:

datos_contrib_semi_join = semi_join(contrib, flood, by="zip") # probar anti_join
print(paste("Tamaño dataset datos_semi", dim(datos_contrib_semi_join)))
View(datos_contrib_semi_join)



## Entendiendo el parametro by
flood2 = flood
names(flood2) = c("ZIP", "contrib")

datos_lj <- left_join(contrib, flood2, by = "zip")

datos_lj <- left_join(contrib, flood2, by = "zip=ZIP")
