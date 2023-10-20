df.iris = iris
#1. Construye un nuevo dataframe que solamente contenga muestras del tipo Setosa y su Petal.Width sea menor a 0.4. 
# A continuación concatena aquellas muestras del tipo Versicolor con el Petal.Width menor a 1.
s_pw = df.iris[df.iris$Species =="setosa" & df.iris$Petal.Width < 0.4, ]
v_pw = df.iris[df.iris$Species =="versicolor" & df.iris$Petal.Width < 1, ]

union = rbind(s_pw, v_pw)

#2. Actualizar el dataframe original con una nueva columna llamada sepal.dif con el vector de las diferencias absolutas entre la longitud del sépalo y la del pétalo.
df.iris$sepal.dif = abs(df.iris$Sepal.Length -df.iris$Sepal.Width )
#3. Añadir las columnas con los datos en el rango de que hemos obtenido en el ejemplo de la sección Definición de funciones. El nombre de las columnas debe ser el mismo que las originales, pero debemos añadirle .01 al final.

rango_01 = function(x){(x-min(x))/(max(x)-min(x))}
df.norm = as.data.frame(sapply(df.iris[c(1:4,6)], rango_01))
result = cbind(df.iris,df.norm )

nombres.01 = sapply(colnames(result)[c(1:4,6)],paste,"01",sep="")
nombres = c(colnames(result)[1:6], nombres.01)
colnames(result) = nombres

#4. Crea una nueva versión del dataframe iris, llamada siri que tenga las columnas en orden inverso al original.
columns= rev(colnames(df.iris))
siri.fd = df.iris[columns]
View(siri.fd)
