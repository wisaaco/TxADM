library(dplyr)
library(ggplot2)
covid = read.csv("Dades_COVID-19_Casos_Confirmats_Illes_Balears__Per_Municipis_.csv", stringsAsFactors=TRUE)
covid$Data.diagnòsic = sort(as.Date(covid$Data.diagnòsic, "%d/%m/%Y"))
str(covid)
View(covid)




per_dia = covid %>% group_by(Data.diagnòsic)  %>% summarise(sumatori=sum(Nombre.casos))
str(per_dia)
View(per_dia)
ggplot(per_dia) +  geom_col(mapping=aes(x=Data.diagnòsic, y=sumatori),fill = "purple")


## TS
any = format(per_dia$Data.diagnòsic[1],format="%Y")
dia = as.numeric(format(per_dia$Data.diagnòsic[1], "%j"))
mi_primerito = ts(per_dia$sumatori, start= c(any,dia) , frequency=365)
plot(mi_primerito)
start(mi_primerito)