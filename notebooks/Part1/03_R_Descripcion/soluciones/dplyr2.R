#install.packages("gapminder")
library(gapminder)

#1. Cargamos los datos y visualizamos su estructura:
gap = gapminder
str(gap)

#¿En qué fechas fueron tomadas estas mediciones? Realiza una expresión para obtener esta información.
unique(gap$year)
#Obtén un vector con los países ordenados según su renta per capita en orden descendiente el año 1992. 
#¿Qué país tenía la renta menor?

gap.1992.gdp = gap %>% filter(year == 1992) %>% arrange(desc(gdpPercap))  

menor = gap.1992.gdp[dim(gap.1992.gdp)[1],][c("country","gdpPercap")]
print(menor)

#Obtén la renta per cápita media de cada continente.

res = gap.1992.gdp %>% select(continent, gdpPercap) %>% group_by(continent) %>% summarise(mean.gdp=mean(gdpPercap))
res

#Obtén un nuevo dataframe con la esperanza de vida media (llamado vida) de cada continente para cada año en
#el que existen datos. Muestra por pantalla la evolución de esta información para europa.

vida = gap %>% select(continent, lifeExp, year) %>% group_by(continent, year) %>% summarise(vida = mean(lifeExp))
europa = vida %>% filter(continent == "Europe")
europa

#Obtén para un año determinado (por ejemplo 1952) un dataframe en el que 
#obtenemos para cada uno  de los países una columna con su esperanza de vida y
#una nueva columna con la esperanza de vida media de su continente.


resultado = gapminder %>%
  filter(year == 1952) %>%
  group_by(continent) %>%
  mutate(mean_lifeExp = mean(lifeExp)) %>%
  select(country, continent, lifeExp, mean_lifeExp) 

resultado



#Extra: Obtener los 10 primeros países por encima del percentil 90 en esperanza de vida el año 2007) (consulta la ayuda de la función ntile)
