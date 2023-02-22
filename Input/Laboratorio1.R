
# Laboratorio - Analisis de redes en R - Algebra matricial

# Objetivo: Explorar las funciones de algebra lineal con un caso hipotetico
# ------------------------------------------------------------------------------------------------------
# En este ejercicio vamos a:
# 1. Cargar nuestra matriz hipotetica de datos
# 2. Hacer diversas operaciones matriciales
# 3. Comprender el algoritmo base de las recomendaciones de AMAZON


#######################################
# LABORATORIO: Algebra matricial      #
#######################################


M = as.matrix(
  read.csv("https://raw.githubusercontent.com/PABalland/ON/master/amz.csv" , 
           sep = ",", 
           header = T, 
           row.names = 1))

# M para poder ver la matriz

# dim(M) para dimensionar la matriz

# Es la estructura de red que AMAZON ocupa para hacer recomendaciones en base a tus compras actuales

M[1:6, 1]
# Ver solo el vector de clientes que compran el producto "corbata" (producto de la columna 1)

M[1:6, 1:2]
#Ver solo un fragmento de la base original, en relacion a los dos productos que me interesan
#Puede ser util para explorar clientes y productos

rowSums (M)
# Computar grado de centralidad, productos relacionados con las personas.

t(M)
# funcion util para enfocarnos en productos y no solo en clientes, matriz transpuesta

M + M
# Suma de matrices


X = M + M
# Crear nuevo un objeto llamado x

M ^ 2 
#matriz al cuadrado

M * M

dim (M)

t(M)

dim (t(M))

M %*% t(M)
#multiplicacion de matrices checar tamanos, solo pueda hacerla si el numero de columnas coincide con el numero de filas por eso primero reviso con dim
#checar tamano de la matriz -dim-


t(M) %*% M
#El algoritmo de recomendacion de AMAZON, hace basicamente lo anterior.
# para tener el numero de veces que 2 productos han sido comprados por el mismo cliente
#identificar productos que van frecuentemente juntos (co ocurrencias par)


P = t(M) %*% M
#similaridad de productos (de gustos) matriz de co ocurrencia de productos



diag (P) = 0
#no es una matriz identidad (como en la correlacion) 


C = M %*% t(M)
#similaridad de clientes - matriz de co ocurrencia de clienes


diag (C) = 0
#no es una matriz identidad (como en la correlacion) 