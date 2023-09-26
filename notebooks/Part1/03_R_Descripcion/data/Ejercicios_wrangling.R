library(dplyr)
install.packages("gapminder")
library(gapminder)

# 1. Instala esta librería, carga los datos y realiza una primera exploración.

data(gapminder)
str(gapminder)
View(gapminder)

# 2. En que fechas fueron tomadas estas mediciones? Realiza una expresión para obtener esta información.
años = filter(gapminder, country == "Afghanistan") %>% select(year)
print(años)

# 3 Obten un vector con los países ordenados según su renta per capita en orden descendiente el año 1992. ¿Qué país tenia la renta menor?

paises = gapminder %>% filter(year==1992) %>% arrange(desc(gdpPercap)) %>% select(country,gdpPercap)
print(paises)

# 4. Obtén la renta per cápita media de cada continente.

renta = gapminder %>% group_by(continent) %>% summarise(renta=mean(gdpPercap))
print(renta)

# 5. Obtén un nuevo dataframe con la esperanza de vida media (llamado vida) de cada continente para cada año en el que existen datos. 
#Muestra por pantalla la evolución de esta información para europa.
ungroup(gapminder)
vida = gapminder %>% group_by(continent, year) %>% summarise(vida=mean(lifeExp))
europa = filter(vida, continent=="Europe")
print(europa)

# 6. Obtén para un año determinado (por ejemplo 1952) un dataframe  en el que obtenemos para cada uno de los países
# una columna con su esperanza de vida y una nueva columna con la esperanza de vida media de su continente.
ungroup(gapminder)
resultado = gapminder %>%
  filter(year == 1952) %>%
  group_by(continent) %>%
  mutate(mean_lifeExp = mean(lifeExp))  %>% select(country, continent, lifeExp, mean_lifeExp) 

