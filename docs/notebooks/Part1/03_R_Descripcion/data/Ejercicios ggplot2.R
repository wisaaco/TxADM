library(ggplot2)
library(dplyr)
data(mtcars)
View(mtcars)

str(mtcars)
#0. Carga el conjunto de datos `mtcars` y transforma a factores aquellas columnas que representen categorías. 
#Recuerda a cargar las librerías `ggplot2` y `dplyr`

mtcars$am = as.factor(mtcars$am)
mtcars$cyl = as.factor(mtcars$cyl)
mtcars$carb = as.factor(mtcars$carb)

#1. Muestra en un gráfico la relación entre el peso del vehículo (wt) en el eje `y` y la cantidad de millas
#por combustible (mpg) en el eje `x`. Debes usar `geom_point`.

ggplot(data = mtcars) +
  geom_point(mapping = aes(x=mpg,y=wt))

#2. Vamos a añadir color al gráfico anterior, veamos si el hecho que el coche sea automático puede ayudar a tener más información.


ggplot(data = mtcars) +
  geom_point(mapping = aes(x=mpg,y=wt, color=am))


#3. Vamos a cambiar la geometría, usaremos `geom_smooth`. Queremos poner la línea de color verde

ggplot(data = mtcars, mapping = aes(x=mpg,y=wt)) +
  geom_smooth(color="green") 

#3b.  En el mismo gráfico añadiremos los puntos que teníamos antes

ggplot(data = mtcars, mapping = aes(x=mpg,y=wt)) +
  geom_smooth(color="green") +
  geom_point(mapping = aes(color=am))

#4. Dibuja un diagrama de barras en el que veamos el número de coches de cada cilindrada. Cada barra debe ser de un color.
#Para asignar manualmente el color de cada barra se puede usar la función [scale_fill_manual](https://ggplot2.tidyverse.org/reference/scale_manual.html)
mtcars %>% ggplot() + 
  geom_bar(mapping = aes(x=cyl, fill=cyl)) +
             xlab("Número de cilindros") + ylab("Número elementos")

mtcars %>% ggplot() + 
  geom_bar(aes(x=cyl, fill=cyl)) +
  scale_fill_manual(values=c("blue","green","pink"), labels=c("cuatro","seis","ocho"))

# 5. Busca en la documentación oficial de ggplot2 como dibujar un boxplot. Haz un diagrama de este tipo con según el número de carburadores.
# Rellena el boxplot con el color _skyblue_.
ggplot(mtcars) + 
  geom_boxplot(aes(carb,wt), fill="skyblue")

# 5b. Para repasar: Cuantas ocurrencias hay de cada tipo de carb diferente. Usa las funciones `group_by` y `summarise` para mostrarlas.
# Ya que estamos en faena, añadiremos el peso medio de cada categoría

resultado = mtcars %>% group_by(carb) %>% summarise(peso.medio= mean(wt), cont = n())
View(resultado)
