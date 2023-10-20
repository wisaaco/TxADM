df.iris = iris
#Obtener todas las filas de la especie versicolor en un nuevo dataframe, este debe llamarse: iris.vers.
iris.vers = df.iris[df.iris$Species=="versicolor",]
#Obtener un vector llamado sepal.dif con la diferencia entre Sepal.Length y Sepal.Width de las plantas Versicolor.
sepal.dif = iris.vers$Sepal.Length - iris.vers$Sepal.Width
#Obtener nuevo vector que contenga solo los valores impares de la columna Sepal.Length.
vector.impares = df.iris[seq(1,dim(df.iris)[1],2), c("Sepal.Length")]
#Seleccionar todas las observaciones para las que Sepal.Length sean menor que Sepal.Width.
df.iris[df.iris$Sepal.Length < df.iris$Sepal.Width,]
#Seleccione aquellas observaciones Versicolor cuyo Sepal.Length sea mayor que Sepal.Width promedio entre todas las especies. (+)
media.SL = mean(df.iris$Sepal.Width)

df.iris[df.iris$Species=="versicolor" & df.iris$Sepal.Length > media.SL,]

#Determinar el ancho promedio del sépalo para todas las plantas que son de la especie virginica que tienen Petal.Length menores a 5 centímetros

ancho = df.iris[df.iris$Species == "virginica"& df.iris$Petal.Length < 5, "Sepal.Width"]
mean(ancho)


df.iris$columnanueva = df.iris$Sepal.Length / 10
df.iris$columnanueva = NULL
View(df.iris)



