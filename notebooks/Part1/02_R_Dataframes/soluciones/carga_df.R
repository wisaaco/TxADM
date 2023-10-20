

#Carga el dataset llamado iris que ya se encuentra en R. Encontraremos más información de este famoso conjunto de datos en el siguiente enlace.
iris.df = iris
#Aplica la función str, ¿de qué tipo de datos son sus columnas?
str(iris)
#¿Cuántas columnas tiene? ¿Cuántas observaciones?
print(paste("Observaciones", dim(iris.df)[1]))
print(paste("Columnas", dim(iris.df)[2]))

#Muestra las tres últimas filas de este dataset.
tail(iris.df)

#Lee la descripción del conjunto de datos llamado Faculty Salary Data (ver enlace) y carga en R su versión de texto (extensión .txt) en una variable con nombre salary.
fsd = read.table("data/SalaryData.txt", header = TRUE)
#Muestra los nombres de las columnas por pantalla. Luego tradúcelos al castellano.
print(names(fsd))
names(fsd) = c("caso", "id", "género", "deg", "yrdeg", "campo","anyoinicio",
               "anyo", "rango", "admin", "salario")
#Verifica que el cambio se ha realizado de forma correcta, aplicando la función View a este dataframe.
View(fsd)

#Guarda el dataframe en tu carpeta de trabajo de la asignatura con el nombre salario.txt. Haz lo mismo, pero ahora guárdalo en el escritorio de tu ordenador.
write.table("data/mi_fsd.txt")

#Descarga la información Municipios y fenómeno demográfico de les Illes Balears de la página correspondiente enlace.
#Descarga el archivo csv separado por ; y crea un dataframe con él.
tabla_balear= read.csv("data/fenomeno_balear.csv",sep=";")

#Haz lo mismo con el fichero en formato json

#install.packages("rjson") 
library("rjson")
myData = fromJSON(file="data/fenomeno_balear.json")
df.json = as.data.frame(myData)




















