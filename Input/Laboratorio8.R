# Hecho con gusto por Leislie Rocio Manjarrez Olmos

# LABORATORIO - RELACIONAMIENTO "CASO HIPOTETICO" 

# Objetivo: Estimar el relacionamiento (relatedness, proximidad, metrica de distancia entre productos)
# ------------------------------------------------------------------------------------------------------
# En este ejercicio vamos a:
# 1. Cargar nuestra matriz hipotetica de datos
# 2. Calcular co ocurrencias entre personas y productos 
# 3. Estimar el relacionamiento, teniendo como input las co-ocurrencias
# 4. Graficar

#######################################
#LABORATORIO: Relacionamiento (r)     #
#######################################

# 1.Como se mide la proximidad (relatedness) para crear el espacio producto
# Material: Balland, P.A. (2017) Economic Geography in R: Introduction to the EconGeo Package, Papers in Evolutionary Economic Geography, 17 (09): 1-75 
# Para instalar: https://www.paballand.com/install-r

# Una vez instalado EconGeo llamar su libreria
library (EconGeo)

# Llamamos a la matriz M que se encuentra en el link escrito y al ser un archivo cvs decimos que esta separado por comas, la fila inicial va a tener los titulos (header, T) y en la primer columna voy a estrablecer el nombre de mis variables
M = as.matrix(
  read.csv("https://raw.githubusercontent.com/PABalland/ON/master/amz.csv" , 
           sep = ",", 
           header = T, 
           row.names = 1))

# Llamo a la matriz
M

# co-ocurrencia entre personas/paises/estados
co.occurrence (M)

# co-ocurrencia entre productos t es transpuesta
c = co.occurrence (t(M))

# Llamo a la matriz
c

# estima el relacionamiento o proximidad pero normalizado, para asegurar que el numero de co ocurrencias que observamos
# es mayor al numero de co ocurrencias probables (probailidad condicional)
# tie and Surfboard puede que no esten tan relacionados, abajo de  1 no es relacionado mientras que mayor a 1 si es relacionado
r = relatedness(c)

# Llamo a la matriz
r

# Para ver el algoritmo solo ejecutar relatedness
# Ejecutar la regla: si el relacionamiento es menor a 1 = 0 (no habra arista que ligue producto) y si es mayor a 1 = 1 (si habra arista que ligue producto)
r[r<1] = 0
r[r>1] = 1

# Cargar libreria para graficar el espacio-producto
library (igraph)

# Comando para realizar el grafico 1
g1 = graph_from_adjacency_matrix(r, mode = "undirected")

# Para ver el gráfico
plot(g1)

