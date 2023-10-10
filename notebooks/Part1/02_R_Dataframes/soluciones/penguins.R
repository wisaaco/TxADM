#install.packages("palmerpenguins")

library(palmerpenguins)
# Exploración inicial
View(penguins)
str(penguins)
dim(penguins)
#Esta base de datos analiza las caracteristicas de los pinguinos dependiendo de la especie, 
#su origen, la longitud y la anchura del pico,  la longitud de la aleta, el peso y el year-

#Apartado 2: debemos de eliminar todas las filas en las que se encuentren algun valor NA.

penguins1 = na.omit(penguins)
penguins1
any(is.na(penguins1)) #con esta formula, vemos que la base de datos no contiene ninguna fila con un valor no definido.
dim(penguins1)
dim(penguins)
#El nuevo dataframe consta de 333 filas y 8 columnas. Se han eliminado 11 filas respecto de el dataframe original.
View(penguins1)

#apartado 2: añadir una nueva columna con el nombre de "bill_r" que relacione la longitud y la anchura del pico.
bill_r=penguins1$bill_length_mm/penguins1$bill_depth_mm
penguins2=cbind(penguins1,bill_r)
View(penguins2)

#apartado 3: añadir una nueva columna "sex_weight" que relacione el peso de cada individuo y el individuo que más pesa de su mismo peso.
#se va a trabajar con kg. Crear una nueva columna)

sex_weight=penguins2$body_mass_g
penguins3=cbind(penguins2,sex_weight)

max_male=max(penguins3[penguins3$sex=="male", ]$body_mass_g)
max_female=max(penguins3[penguins3$sex=="female", ]$body_mass_g)

penguins3[penguins3$sex=="male", "sex_weight"]=penguins3[penguins3$sex=="male", ]$body_mass_g/max_male
penguins3[penguins3$sex=="female", "sex_weight"]=penguins3[penguins3$sex=="female", ]$body_mass_g/max_female

#Modificar la variable body_mass_g (de gramos a kilos) y cambiar el nombre.
penguins3$body_mass_g=penguins3$body_mass_g/1000
names(penguins3)
names(penguins3)=c("species","island", "bill_length_mm", "bill_depth_mm","flipper_length_mm", "body_mass_kg", "sex","year","bill_r","sex_weight")
View(penguins3)

# En el dataframe "penguins4" hemos eliminado la columna year.
penguins4=penguins3[1:333,c("species","island", "bill_length_mm", "bill_depth_mm","flipper_length_mm", "body_mass_kg", "sex","bill_r","sex_weight")]

View(penguins4)

# SELECCIONES
# Selecciona la columna “species” del dataframe “penguins”. ¿Cuántas especies diferentes de pingüinos hay en el conjunto de datos?
especies = unique(penguins1$species)
# Selecciona las columnas “species”, “island” y “bill_length_mm” del dataframe “penguins”. ¿Cuál es la especie de pingüino más común en la isla de “Torgersen”?
mini.df = penguins1[c("species", "island", "bill_length_mm")]
row1 = nrow(mini.df[mini.df$species == especies[1] & (mini.df$island == "Torgersen"),])
row2 = nrow(mini.df[mini.df$species == especies[2] & (mini.df$island == "Torgersen"),])
row3 = nrow(mini.df[mini.df$species == especies[3] & (mini.df$island == "Torgersen"),])

idx = which.max(c(row1,row2, row3))
print(paste("La especie que mas hay en Torgersen es: ",especies[idx]))

## EXTRA: también se pueden obtener conteos de manera muy senzilla usando la función table, 
?table # consultamos la ayuda
tabla = table(mini.df$species)   
tabla[which.max(tabla)]

# Encuentra todos los pingüinos que tienen un “bill_length_mm” mayor a 10. ¿Cuántos pingüinos cumplen con esta condición?

penguins1[penguins1$bill_depth_mm > 10,]

# Encuentra todos los pingüinos de la especie “Gentoo” que tienen un “bill_length_mm” mayor a 5 ¿Cuál es la isla en la que se encuentran?
unique(penguins1[penguins1$species == "Gentoo" & penguins1$bill_depth_mm > 5,]$island)
# Selecciona las filas desde la 20 hasta la 30 en el dataframe “penguins”. ¿Cuál es el promedio de “bill_length_mm” en este rango?
ok = penguins1[20:30, "bill_length_mm"]
sapply(ok, mean) # no se puede aplicar directamente sobre la columna

write.csv(penguins4, "mis_pinguinos.csv")
