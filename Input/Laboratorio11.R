

# Hecho con gusto por Leislie Rocio Manjarrez Olmos (UAEH)

##########################################################################################
# LABORATORIO 4: Vision clara del espacio-producto: CASO REAL_exportaciones hidalguenses #
#########################################################################################

# Objetivo: Estimar el Maximum Spanning Tree -arbol de expansion maxima- (asegurar una vision clara del espacio-producto)
# Red troncal: Estructura general de la red: vamos a poder ver redes complejas

# Regla 1: Mantener n-1 conexiones como maximo
# Regla 2: Quitar las conexiones con el peso mas bajo, nos vamos quedar con las del peso maximo (menos conexiones)
# Regla 3: No crear nodos aislados
# ------------------------------------------------------------------------------------------------------


# 1.Como crear una vision clara del espacio-producto: arbol de expansion maxima (MST) 
# Paquete: Balland, P.A. (2017) Economic Geography in R: Introduction to the EconGeo Package, Papers in Evolutionary Economic Geography, 17 (09): 1-75 
# Para instalar: https://www.paballand.com/install-r

# Cargar libreria de EconGeo
library(EconGeo)

# Ubicar archivo a utilizar, al ejecutar señala la ruta la cual debe ser copiada y pegada despues de read.csv
file.choose()


M = as.matrix(
  read.csv("C:\\Users\\leisl\\OneDrive\\Doctorado\\Semestre-3\\Temas-Selectos-1-Complejidad-Económica\\Modulo2\\Semana4-Labs-Salas\\Lab-11\\relatednessbinario.csv", 
           sep = ",", 
           header = T, 
           row.names = 1))

# Comandos para visualizar una parte de la matriz compleja cargada con anterioridad
head (M[,1:10])
dim (M)

# Realizar un primer grafico de la matriz, cargar libreria para ello
library (igraph)

# Comandos para generar grafico denominado red_hidalgo1
red_hidalgo1 <-graph.adjacency(M, mode="undirected", weighted=TRUE)
plot(red_hidalgo1)

# Modificamos la matriz original a una matriz negativa
M <- -M
head (M[,1:6])

# Graficamos la matriz negativa, grafica de adyacencias con un input la matriz invertida a la que se le calcula el MST
red_hidalgo2 <-graph.adjacency(M, mode="undirected", weighted=TRUE)
MST <- minimum.spanning.tree(red_hidalgo2)
plot (MST, vertex.shape= "none", vertex.label.cex=.7)

# Exportar los datos del grafico limpio
write.graph(MST, file = "redhidalgo2.gml", format = "gml")

# Generar matriz de adyacencias
A <- get.adjacency(MST, sparse = F)

# Exportar la matriz de adyacencias creada
write.csv(A, file = "AdyacentesConMST.csv")