# Hecho con gusto por Leislie Rocio Manjarrez Olmos (UAEH)

# T1_04_REDES COMPLEJAS(1) - Vision de redes complejas - Parte 1

# Objetivo: Estimar el Maximum Spanning Tree -arbol de expansion maxima- (asegurar una vision clara del espacio-producto)
# Red troncal: Estructura general de la red: vamos a poder ver redes complejas

# Regla 1: mantener n-1 conexiones como maximo
# Regla 2: Quitar las conexiones con el peso mas bajo, nos vamos quedar con las del peso maximo (menos conexiones)
# Regla 3: No crear nodos aislados
# ------------------------------------------------------------------------------------------------------
# En este ejercicio vamos a:
# 1. Usar un matriz hipotetica de datos
# 2. Graficar sus proximos adyacentes


##################################################################
# practica 3: Vision clara del espacio-producto: CASO HIPOTETICO #
##################################################################

# 1)La visualizacion del espacio - producto sea una red conectada: evitar islas de productos aislados. 
# 2)PROBLEMA: tratar de visualizar demasiados enlaces puede crear una complejidad visual innecesaria 
# donde se obstruiran las conexiones mas relevantes.
# Calculamos el arbol de expansion maxima (MST) de la matriz de proximidad. 
# MST es el conjunto de enlaces que conecta todos los nodos de la red utilizando un numero minimo de conexiones
# y la suma maxima posible de proximidades. 
# Calculamos el MST usando el algoritmo de Kruskal: Basicamente, el algoritmo clasifica los valores de la matriz
# de proximidad en orden descendente y luego incluye enlaces en el MST si y solo si conectan un producto aislado. 
# Por definicion, el MST incluye todos los productos, pero el numero de enlaces es el minimo posible.
# Despues de seleccionar los enlaces utilizando los criterios mencionados anteriormente, 
# construimos una visualizacion utilizando un algoritmo de dise?o dirigido por la fuerza. 


# Primero crear una matriz aleatoria de 200*200
M <- matrix(runif(200*200, min=0, max=100), ncol=200)
diag(M)<-0
head (M[,1:6])
dim (M)

# Llamar la libreria para graficar la matriz anterior
library (igraph)

# Comando para graficar la matriz anterior, obteniendo un grafico saturado por lo cual se usa el MST
# igraph calcula el arbol de expansion minima
g <- graph.adjacency(M, mode="undirected", weighted =TRUE)
plot (g)

# Transformamos la matriz en NEGATIVA para identificar los maximos
M <- -M
head (M[,1:6])

# Grafica nueva red con la matriz negativa, ver el espacio-producto, tecnologico 
g <- graph.adjacency(M, mode="undirected", weighted =TRUE)
MST <- minimum.spanning.tree(g)
plot(MST, vertex.shape="none", vertex.label.cex=.7)

# matriz de adyacencias (nuevo relacionamiento)
# ver las aristas que hay entre los nodos
A <- get.adjacency(MST, sparse = F)

# VER LAS ARISTAS(PESOS)
head(A)

# Exportar el grafico en gml
write.graph(MST, file = "g.gml", format = "gml")

# Exportar resultados para cytoscape o gephi
write.csv(A, file="Adyacentes.csv")