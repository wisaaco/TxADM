#1 Queremos obtener un vector que solamente contenga los años.
# Finalmente, puedes usar la función `unique` para eliminar los años duplicados.
fechas <- c("01/01/2023", "15/03/2023", "22/06/2023", "04/09/2023", "10/10/2023", "25/12/2023", "07/04/2024", "19/08/2024", "30/11/2024", "12/05/2025")
fechas2 = strsplit(fechas, "/")

año = function(fecha){
  return(fecha[3])
}

años = sapply(fechas2, año)
print(unique(años))

#2

nombres = c("Juan Pérez", "MARÍA GONZÁLEZ", "pedro López", "Ana Martínez", "jUliA Nuñez", "CARLOS Sánchez", "lUisA RODRÍGUEZ", "Miguel Ángel García", "sOfía ruiz", "Diego Fernández")

miscosas = function(estring){
  dividido = strsplit(estring, " ")
  
  inicial.N = substr(toupper(dividido[[1]][1]), start = 1, stop = 1)
  inicial.A = substr(toupper(dividido[[1]][2]), start = 1, stop = 1)
  
  nombre = paste(inicial.N, substr(dividido[[1]][1], start = 2, stop = nchar(dividido[[1]][1])),sep="")
  apellido = paste(inicial.A, substr(dividido[[1]][2], start = 2, stop = nchar(dividido[[1]][2])),sep="")
  union = paste(nombre,apellido, sep="")
  
  return(union)
}

nombres2 = tolower(nombres)
resultado = sapply(nombres2, miscosas,USE.NAMES = FALSE)
print(resultado)




