#install.packages("dplyr")
library(dplyr)




#Volvamos a un conjunto de datos ya conocido: Faculty Salary Data (ver enlace) y carga en R su versión de valores separados por comas (extensión .csv) en una variable con nombre salary.

salario = read.table("data/SalaryData.txt", header=TRUE)
View(salario)

#Intentaremos sacar algunas conclusiones de estos datos. 
#Primero eliminaremos las columnas casey id, sirven para identificar las diferentes filas y nosotros no lo necesitaremos.

salario.small = select(salario, 3:dim(salario)[2])

#De momento nos quedaremos con los datos del año 1995, así que construye un nuevo dataframe que solamente contenga estos datos,
#a continuación, usando el operador pipeline elimina la columna year.

salario.1995 = filter(salario.small, year == 95)

#Transforma las columnas de tipo chr a tipo factor. 
#No puedes hacerlo columna a columna, busca información de la función lapply en la ayuda de RStudio. 


columnes = c("gender", "deg", "field", "rank")
# all_of se introducirá en sucesivas versiones
res = sapply(select(salario.1995, columnes), as.factor)  
str(res)
salario.1995[columnes] = res
# Comprobamos que el resultado es correcto
str(salario.1995)

#Ordena el conjunto de datos de manera que primero veremos aquellos sueldos mayores. 
#Como posiblemente tendremos múltiples ocurrencias con el mismo salario, el segundo criterio de
#ordenación será el año de inicio en la universidad.

salario.1995 = salario.1995 %>% arrange(desc(salary), startyr)

#Es recomendable que los guardes en un fichero en tu carpeta de trabajo.

write.csv(salario.1995, "data/my_salario.csv")
