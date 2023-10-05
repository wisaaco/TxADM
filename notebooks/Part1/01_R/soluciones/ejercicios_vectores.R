
# Ejercicios Vectores

# 1. Cargar los datos contenidos en crimenUSA.txt
# 2. ¿Cuantos valores tiene? Muestra por pantalla los 5 primeros.
# 3. Ahora muestra los 5 últimos.
# 4. ¿ Cuál es el valor medio de este vector? Y su desviación estándar?
#   5. ¿Cual es el máximo valor en estos datos? ¿Se repite alguna vez? ¿Cuantas?
#   6. ¿Que porcentaje de estados tienen mas de 4810 crímenes?
#   7. Substituye el quinto valor por el valor 2000.

# 1.Cargar los datos contenidos en crimenUSA.txt

vector = scan("https://raw.githubusercontent.com/bmalcover/TxADM/main/notebooks/Part1/01_R/data/crimenUSA.txt", sep=",")

# 2.¿Cuantos valores tiene? 

longitud =length(vector)
print(longitud)

# Muestra por pantalla los 5 primeros.

print(vector[1:5])

# Ahora muestra los 5 últimos.

print(c("5 últimos", vector[(longitud-4):longitud]))

# 3. ¿ Cuál es el valor medio de este vector? Y su desviación estándar?
  
media = mean(vector)
std = sd(vector)
print(paste("media: ", media," desviación: ", std))

# 4. ¿Cual es el máximo valor en estos datos? ¿Se repite alguna vez? ¿Cuantas?

valor_maximo = max(vector)

vector_maximos = vector[vector == valor_maximo]
longitud_maximos = length(vector_maximos)
print(longitud_maximos)

# 5. ¿Que porcentaje de estados tienen mas de 4810 crímenes?

mayores_4810 = vector[vector > 4810]
porcentaje = (length(mayores_4810) / longitud) * 100
print(paste(porcentaje, "%"))

# 6. Ejecuta la sentencia que tienes a continuación, esta descargará un vector con los nombres de los estados de USA en la variable `states`. Verifica que se ha cargado correctamente mostrando su contenido en la consola.

states = scan("https://iamattila.com/wp-content/uploads/2021/07/usa-state-codes-abbreviations-names.csv", what=character(), sep="\n", skip = 1)

# 7. Crea un nuevo vector que contenga los nombres de los estados con más crímenes que la media.
nuevo = states[vector > media]
print(nuevo)

# 8. ¿Cuál es el estado con menor criminalidad?

menor_idx = which.min(vector)
menor.criminalidad = states[menor_idx]
menor.criminalidad

# 9. Dad el valor de n en el que la secuencia (2⋅3n−4⋅2.5n)n=0,…,100 toma su valor mínimo

s = seq(0,100)

f = function(n){
  
  return(2*3^n-4*2.5*n)
}

s2 = sapply(s,f)
minimo = min(s2)
which(s2 == minimo)


#10. Haz un programa que diga SI o NO, si la secuencia (4^n−3⋅2^n)n=0,…,200 es creciente o no.
mi_s = seq(1, 200)

f = function(n){
  v_n = (4^n - 3*2^n)
  v_n1 = (4^(n-1) - 3*2^(n-1))
  
  if(v_n >= v_n1){
    return(1)
  }else{
    return(0)
  }
}

evaluacion = sapply(mi_s, f)

if (sum(evaluacion) == 200)
{ 
  print("SI")
}else{
  print("NO")
}

#Ejercicio Factores:  Realizad una instrucción que defina un factor llamado F01 a partir del vector `c(0, 1, 0, 0, 1, 0)`, 
# asignando al 0 y al 1 los niveles No y Yes, respectivamente.
s = c(0, 1, 0, 0, 1, 0)

factor(s, levels=c(0,1), labels=c("No","Si"))


