
#1. Empezamos por preparar los datos:
# Eliminar la columna blood pressure, ya que no está en un formato adecuado.
# Substituye el valor None en la columna Sleep.Disorder por el valor "No".
# Transforma las columnas Gender y Occupation a factor


#2. Crea un nuevo dataframe llamado "caminantes" con aquellos sujetos que caminan mas. En este nuevo dataframe
# solamente queremos las columnas: Physical.Activity.Level; Heart.Rate y Sleep.Disorder.
# ¿Que probabilidad hay de ser un caminante y tener un problema de sueño? 
# ¿Podemos decir que caminar es un factor que ayuda a no tener problemas de sueño (Sleep.Disorder)?
# Muestra un mensaje por pantalla indicando si la cuestión anterior se cumple o no.
# Vamos a abandonar el dataframe de caminantes, así que lo guardaremos en la carpeta data de este proyecto.



#3. Usando las funciones que proporciona dplyr, guarda en un dataframe llamado resultado.dplyr
# Seleccionar aquellos individuos que son Abogados (Lawyer) con mas de 35 años 
# Añade una nueva columna llamada relation que contenga la relación entre el nivel de actividad física y la calidad del sueño
#Ordena el conjunto de datos de tal manera que este ordenada en primer lugar por la nueva columna que has
#creado y en segundo lugar por el nivel de actividad física.
# Se valorará el uso de pipelines



#4. Queremos estudiar factores relacionados con la duración del sueño (Sleep.Duration) según diferentes categorias, así que
# crearemos un dataframe llamado agg.ocu.gen:
# En primer lugar queremos agrupar por la Ocupación y cada ocupación segun el Género. 
# Queremos saber cuantas observaciones hay de cada agrupación, su mediana, máximo y mínimo.
# Añadiremos una columna con la diferencia entre el valor máximo y el valor mínimo (la llamaremos diff)


#5. Queremos añadir una columna al dataframe (max.edad)en el que cada fila sea el tenga el valor maximo de la edad de su categoria



#6. Escribe una función llamada calcular_impuesto_que tome el ingreso anual de una persona y el número de hijos:
# Las reglas fiscales son las siguientes:

#El impuesto no se aplica por tramos, se aplica de forma integra según el ingreso:
  #Si el ingreso anual es menor o igual a 15,000 euros, el impuesto es del 5%.
  #Si el ingreso anual está entre 15,001 euros y 40,000 euros, el impuesto es del 15%.
  #Si el ingreso anual es mayor a 40,000 euros, el impuesto es del 25%.

# Una vez tenemos el impuesto anual podemos aplicar las siguientes rebajas:
  
  #Si el contribuyente tiene un hijo o 2, se aplica una rebaja del 10%.
  #Si el contribuyente tiene más de 2 hijos, se aplica una rebaja del 15%.



