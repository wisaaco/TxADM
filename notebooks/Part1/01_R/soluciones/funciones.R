# 1 
# Definir la función celsius_a_fahrenheit
celsius_a_fahrenheit = function(celsius) {
  fahrenheit = (celsius * 9/5) + 32 
  return(fahrenheit)
}

# Ejemplo de uso
temperatura_celsius = 32
temperatura_fahrenheit = celsius_a_fahrenheit(temperatura_celsius)
cat("La temperatura de", temperatura_celsius, "grados Celsius es equivalente a", temperatura_fahrenheit, "grados Fahrenheit.")






# 2
# Definir la función calcular_descuento
calcular_descuento = function(precio_original, edad_cliente) {
  if (edad_cliente < 18) {
    descuento = 0.20  # 20% de descuento para menores de 18 años
  } else if (edad_cliente <= 60) {
    descuento = 0  # Sin descuento para edades entre 18 y 60 años
  } else {
    descuento = 0.25  # 25% de descuento para mayores de 60 años
  }
  
  precio_con_descuento = precio_original * (1 - descuento)  # Calcular el precio con descuento
  
  return(precio_con_descuento)
}



calcular_descuento2 = function(precio_original, edad_cliente) {
  
  precio_final = precio_original
  
  if (edad_cliente < 18) {
    descuento = 0.20  # 20% de descuento para menores de 18 años
    precio_final = precio_original * (1 - descuento)
    
  } else if (edad_cliente > 60) {
    descuento = 0.25  # Sin descuento para edades entre 18 y 60 años
    precio_final = precio_original * (1 - descuento)
  }
  return(precio_final)
  
}










# Ejemplo de uso
precio_original = 100  # Precio original del producto
edad_cliente = 25  # Edad del cliente

precio_con_descuento <- calcular_descuento(precio_original, edad_cliente)
cat("El precio con descuento para un cliente de", edad_cliente, "años es $", precio_con_descuento, sep = "")





# 3

# Definir la función calcular_impuesto
calcular_impuesto = function(ingreso_anual) {
  if (ingreso_anual <= 10000) {
    impuesto = ingreso_anual * 0.10
  } else if (ingreso_anual <= 50000) {
    impuesto = 10000 * 0.10 + (ingreso_anual - 10000) * 0.20
  } else {
    impuesto = 10000 * 0.10 + 40000 * 0.20 + (ingreso_anual - 50000) * 0.30
  }
  return(impuesto)
}

# Ejemplos de uso
ingreso1 = 8000
impuesto1 = calcular_impuesto(ingreso1)
print(paste("Para un ingreso de $", ingreso1, ", el impuesto es de $", impuesto1, sep = ""))

ingreso2 = 25000
impuesto2 = calcular_impuesto(ingreso2)
print(paste("Para un ingreso de $", ingreso2, ", el impuesto es de $", impuesto2, sep = ""))

ingreso3 = 75000
impuesto3 = calcular_impuesto(ingreso3)
print(paste("Para un ingreso de $", ingreso3, ", el impuesto es de $", impuesto3, sep = ""))

