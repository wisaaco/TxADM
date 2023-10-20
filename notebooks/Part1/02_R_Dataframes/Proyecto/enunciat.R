## Este proyecto se debe realizar en una carpeta llamada "proyectoR" en la que inicialmente 
## no puede haber ningún otro fichero.
## En esta carpeta deben estar fichero con el código R y una carpeta llamada data donde se leerán/escribirán los datos
## La entrega consistirá en la carpeta "proyectoR" comprimida. (si tienes problemas avisa al profesor)

library(dplyr)


#1. Empezamos por preparar los datos:
# Eliminar la columna blood pressure, ya que no está en un formato adecuado.
# Substituye el valor None en la columna Sleep.Disorder por el valor "No".
# Transforma las columnas Gender y Occupation a factor
sleep = read.csv("data/sleep.csv")
str(sleep)
View(sleep)

sleep2 = sleep[-c(1,10)]
sleep2[sleep2$Sleep.Disorder == "None", "Sleep.Disorder"] = "No"
sleep2$Gender = as.factor(sleep2$Gender)
sleep2$Occupation = as.factor(sleep2$Occupation)
View(sleep2)

#2. Crea un nuevo dataframe llamado "caminantes" con aquellos sujetos que caminan mas. En este nuevo dataframe
# solamente queremos las columnas: Physical.Activity.Level; Heart.Rate y Sleep.Disorder.
# ¿Que probabilidad hay de ser un caminante y tener un problema de sueño? 
# ¿Podemos decir que caminar es un factor que ayuda a no tener problemas de sueño (Sleep.Disorder)?
# Muestra un mensaje por pantalla indicando si la cuestión anterior se cumple o no.
# Vamos a abandonar el dataframe de caminantes, así que lo guardaremos en la carpeta data de este proyecto.

maximo = max(sleep2$Daily.Steps)
caminantes = sleep2[sleep2$Daily.Steps == maximo, c("Physical.Activity.Level","Heart.Rate","Sleep.Disorder")]

prob_c = sum(caminantes$Sleep.Disorder != "No") / dim(sleep2)[1] *100
prob_no_c = sum(sleep2$Sleep.Disorder != "No" & sleep2$Daily.Steps < maximo) / dim(sleep2)[1] *100

if(prob_c > prob_no_c){
  print("Caminar parece un factor que ayuda no tener problemas de sueño")
}else{
  print("Caminar NO parece un factor que ayuda no tener problemas de sueño")
}

#3. Usando las funciones que proporciona dplyr, guarda en un dataframe llamado resultado.dplyr
# Seleccionar aquellos individuos que son Abogados (Lawyer) con mas de 35 años 
# Añade una nueva columna llamada relation que contenga la relación entre el nivel de actividad física y la calidad del sueño
#Ordena el conjunto de datos de tal manera que este ordenada en primer lugar por la nueva columna que has
#creado y en segundo lugar por el nivel de actividad física.
# Se valorará el uso de pipelines

resultado.dplyr = sleep2 %>% 
  filter(Occupation == "Lawyer" & Age > 35) %>%
  mutate(relation = Physical.Activity.Level / Quality.of.Sleep) %>%
  arrange(relation, Physical.Activity.Level) 


#4. Queremos estudiar factores relacionados con la duración del sueño (Sleep.Duration) según diferentes categorias, así que
# crearemos un dataframe llamado agg.ocu.gen:
# En primer lugar queremos agrupar por la Ocupación y cada ocupación segun el Género. 
# Queremos saber cuantas observaciones hay de cada agrupación, su mediana, máximo y mínimo.
# Añadiremos una columna con la diferencia entre el valor máximo y el valor mínimo (la llamaremos diff)

agg.ocu.gen = sleep2 %>% 
  group_by(Occupation, Gender) %>%
  summarise(numero= n(), media = median(Sleep.Duration), maximo = max(Sleep.Duration), minimo = min(Sleep.Duration)) %>%
  mutate(diff = maximo - minimo)

#5. Queremos añadir una columna al dataframe (max.edad)en el que cada fila sea el tenga el valor maximo de la edad de su categoria

res = sleep2 %>% 
  group_by(Occupation) %>%
  mutate(max.edad = max(Age))
View(res)


#6. Escribe una función llamada calcular_impuesto_que tome el ingreso anual de una persona y el número de hijos:
# Las reglas fiscales son las siguientes:

#El impuesto no se aplica por tramos, se aplica de forma integra según el ingreso:
  #Si el ingreso anual es menor o igual a 15,000 euros, el impuesto es del 5%.
  #Si el ingreso anual está entre 15,001 euros y 40,000 euros, el impuesto es del 15%.
  #Si el ingreso anual es mayor a 40,000 euros, el impuesto es del 25%.

# Una vez tenemos el impuesto anual podemos aplicar las siguientes rebajas:
  
  #Si el contribuyente tiene un hijo o 2, se aplica una rebaja del 10%.
  #Si el contribuyente tiene más de 2 hijos, se aplica una rebaja del 15%.

calcular_impuesto = function(ingreso_anual, num_hijos) {
  # Definimos las tasas de impuestos
  tasa_impuesto1 = 0.05
  tasa_impuesto2 = 0.15
  tasa_impuesto3 = 0.25
  
  # Inicializamos el impuesto
  impuesto <- 0
  
  # Aplicamos las reglas fiscales
  if (ingreso_anual <= 15000) {
    impuesto = ingreso_anual * tasa_impuesto1
  } else if (ingreso_anual <= 40000) {
    impuesto = ingreso_anual * tasa_impuesto2
  } else {
    impuesto <- ingreso_anual * tasa_impuesto3
  }
  
  if ( num_hijos >= 1 & num_hijos <= 2) {
    impuesto <- impuesto * 0.9  # Rebaja del 10% para casados con hijos
  } else if ( num_hijos > 2) {
    impuesto <- impuesto * 0.85  # Rebaja del 15% para solteros con más de 2 hijos
  }
  
  return(impuesto)
}

ingreso_anual = 45000
num_hijos = 2

impuesto_a_pagar <- calcular_impuesto(ingreso_anual, num_hijos)
cat("El impuesto a pagar es:", impuesto_a_pagar, "euros")

