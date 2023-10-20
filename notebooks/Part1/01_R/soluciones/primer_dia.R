#1. Realizar un conjunto de expresiones en R que nos calcule el índice de masa corporal (IMC) de una persona que mide 2 m i pesa 60 Kg. Se calcula dividiendo el peso entre la altura al cuadrado (en cm).

imc = (2*100) / (60*60)
print(imc)

#2. Realizar un programa que nos calcule la cantidad de propina a dejar en un restaurante. Se debe declarar una variable con el total de la factura y otra con el porcentaje de propina que desea dejar. Luego, muestra la cantidad de propina a pagar.

factura = 10000
porcentaje = 0.10
total = (factura * porcentaje) + factura


#3. Crea un programa que solicite que defina una variable con el radio de un círculo y calcule el área de ese círculo utilizando la fórmula Área = π radio^2*. A continuación, muestra el resultado en la pantalla

radio = 50
area = pi * (radio**2)

#4. Si hubiéramos empezado a contar segundos a partir de las 12 campanadas que marcan el inicio de 2014, ¿a qué hora de qué día de qué año llegaríamos a los 250 millones de segundos?

minutos = 250000000 %/% 60
horas = minutos %/% 60
dias = horas %/% 24
años = dias %/% 365

dias_sobrantes = dias %% 365
horas_sobrantes = horas %% 24

print(paste("Año: ", 2014 + años, "Dia: ", dias_sobrantes, "Horas:", horas_sobrantes))



#5. Realiza el mismo ejercicio que antes contando los años bisiestos.
#Un año es bisisesto si es divisible por 4 y por 100 o es divisible entre 400.
mi_anyo = 2016

if (mi_anyo %% 4 == 0 & (mi_anyo %% 100 != 0 | mi_anyo %% 400 == 0)) {
  print(paste("El año: ", mi_anyo, " es bisiesto"))
  
}else{
  print("No es bisiesto")
}

num_bisiestos = (años-2) %% 4
print(paste(" En el período calculado hay; ",num_bisiestos, " años bisisestos"))


# 7. Realizar un programa que dados los parámetros: a, b y c. resuelve una ecuación de segundo grado. Ejemplo, la ecuación: 2x^2 + 20x + 3 = 0 debe dar -0.1523201 ; -9.8476799. Para calcular la raíz cuadrada podéis usar la función sqrt.
a = 2
b = 20
c = 3

div = (2 * a)
cte = (b^2 - 4 * a * c)

if(cte > 0){
  raiz = sqrt(cte)
  r1 = (-b + raiz) / div
  r2 = (-b - raiz) / div
  
  print(paste("Sol 1: ", r1))
  print(paste("Sol 2: ", r2))
  
}else if(cte == 0){
  print(-b/div)
  
}else{
  print("No sé calcular la solución")
}


