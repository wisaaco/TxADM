
# Scan tambien nos permite leer un fichero.

#1. Cargar los datos contenidos en crimenUSA.txt
#2. ¿Cuantos valores tiene? Muestra por pantalla los 5 primeros.
#3. Ahora muestra los 5 últimos.
#4. ¿ Cuál es el valor medio de este vector? Y su desviación estándar?
#5. ¿Cual es el máximo valor en estos datos? ¿Se repite alguna vez? ¿Cuantas?
#6. ¿Que porcentaje de estados tienen mas de 4810 crímenes?
#7. Substituye el quinto valor por el valor 2000.

# 1.Cargar los datos contenidos en crimenUSA.txt
vector = scan("crimenUSA.txt", sep=",")

# 2.¿Cuantos valores tiene? 

print("El vector tiene una longitud de")
longitud =length(vector)
print(longitud)
# Muestra por pantalla los 5 primeros.
print("5 primeros")
vector[0:5]

# 3. Ahora muestra los 5 últimos.

print("5 últimos")
vector[(longitud-4):longitud]

# 4 ¿ Cuál es el valor medio de este vector? Y su desviación estándar?

media = mean(vector)
std = sd(vector)

#5. ¿Cual es el máximo valor en estos datos? ¿Se repite alguna vez? ¿Cuantas?
valor_maximo = max(vector)

vector_maximos = vector[vector == valor_maximo]
longitud_maximos = length(vector_maximos)



#6. ¿Que porcentaje de estados tienen mas de 4810 crímenes?

mayores_4810 = vector[vector > 4810]
porcentaje = (length(mayores_4810) / longitud) * 100

#7. Ejecuta la sentencia que tienes a continuación, esta descargará un vector con los nombres de los estados de USA en la variable `states`. Verifica que se ha cargado correctamente mostrando su contenido en la consola.

states = scan("https://iamattila.com/wp-content/uploads/2021/07/usa-state-codes-abbreviations-names.csv", what=character(), sep="\n", skip = 1)


#8. Crea un nuevo vector que contenga los nombres de los estados con más crímenes que la media.

nuevo = states[vector > media]

#9. ¿Cuál es el estado con menor criminalidad?

menor_idx = which.min(vector)
menor.criminalidad = states[menor_idx]
menor.criminalidad
