

# Hecho con gusto por Leislie Rocio Manjarrez Olmos (UAEH)

# video 05 - DENSIDAD DEL RELACIONAMIENTO: CASO HIPOTETICO 

# Objetivo: Estimar la densidad del relacionamiento (rd)
# La densidad varia entre 0 y 1, los valores mas grandes indican que la region ha avanzado a
# una VCR en muchos bienes proximos al bien i y tiene mayor probabilidad de exportarlo en el futuro
# mayor densidad, mayor cercanna. Menor densidad, mayor lejania.
# --------------------------------------------------------------------------------------------------------------------
# En este laboratorio vamos a:
# 1. Cargar una matriz hipotetica de datos
# 2. Estimar la VCR de la matriz hipotetica
# 3. Calcular las co-ocurrencias y el relacionamiento (espacio-producto)
# 4. Estimar la densidad del relacionamiento (rd)
# Buscamos saber si las industrias que estan relacionadas estan presentes en las regiones o no. Nivel de cercania
# 5. Predecir la entrada de una nueva industria
#Econometria usar count(densidad del relacionamiento) como regresora (predictora) de la entrada de una nueva industria

####################################################
# LABORATORIO 5: Densidad del relacionamiento (rd) #
####################################################

# Primero cargar la libreria de EconGeo
library (EconGeo)

# 1.Como se mide la densidad del relacionamiento (rd)?
# Paquete: Balland, P.A. (2017) Economic Geography in R: Introduction to the EconGeo Package, Papers in Evolutionary Economic Geography, 17 (09): 1-75 
# Para instalar: https://www.paballand.com/install-r

# Preguntar que es la Ventaja Comparativa Revelada (VCR)
?RCA

# En la consola Help despues de Examples copiar y pegar el ejemplo para
# generate a region - industry matrix
set.seed(31)
mat <- matrix(sample(0:100,20,replace=T), ncol = 4)
rownames(mat) <- c ("R1", "R2", "R3", "R4", "R5")
colnames(mat) <- c ("I1", "I2", "I3", "I4")

# Con los comandos anteriores se genera una matriz llamada mat
# Visualizar matriz creada que tiene regiones e industrias con una dimensión de 5X4
mat
dim(mat)

# Para sacar la VCR utilizar el siguiente comando
mat = RCA(mat, binary = T)

# Visualizar matriz binarizada
mat

# Recordar que la VCR es basicamente es un indicador de especializacion, produce mas de lo esperado basado en el tamano de la region y de la industria
# A partir de la matriz calcular las co-ocurrencias de la matriz transpuesta y visualizarla
c = co.occurrence(t(mat))
c

# Calcular el relacionamiento con base en las co-ocurrencias detectadas con anterioridad y visualizar resultado
r = relatedness(c)
r

# Con base al resultado aplicar la regla binaria y visualizar resultado
r[r<1] = 0
r[r>1] = 1
r

# Una vez calculado el relacionamiento calcular la densidad del relacionamiento (en relacion a distancia- mas cercano o mas lejana)
# Asegurate que hayas computado la matriz binaria de VCR antes de computar el Relacionamiento-densidad
# Usar la matriz de VCR (mat) y la de espacio-producto (r) para calcular la densidad de relacionamiento. Visualizar ambas previamente
mat
r

# Con las dos matrices previas, calcular la densidad del relacionamiento y visualizar resultado
rd = relatedness.density(mat,r)
rd

# Rango 0-100
# La Industria 1 (I1) esta relacionada con la Industria 2 y 3 (I2, I3) (I1)R = 2 (I2;I3)
# Y la Region 1 (R1) ya tiene la Industria 2 (I2), pero no tiene la Industria 3 (I3)
# Hay 2 industrias relacionadas con la Industria 1, por eso 2
# Pero la Region 1 solo tiene 1 de esas industrias relacionadas
# Entonces 1/2=0.5

# Convertir la matriz a una lista y visualizar resultado
rd = get.list(rd)
rd

# En CE se tiene la hipotesis que la densidad del relacionamiento es una variable explicativa para la entrada o no hacia una industria
# La entrada de una industria depende de la densidad del relacionamiento
# Por último vamos a predecir una entrada para ello ejecutar siguiente comando
?entry.list 

# Mira la seccion de ejemplos y copia-pega los datos a la consola del primer grupo de comandos
# El ejemplo genera una matriz 1. Visualizar resultado
## generate a first region - industry matrix in which cells represent the presence/absence
## of a RCA (period 1)
set.seed(31)
mat1 <- matrix(sample(0:1,20,replace=T), ncol = 4)
rownames(mat1) <- c ("R1", "R2", "R3", "R4", "R5")
colnames(mat1) <- c ("I1", "I2", "I3", "I4")

mat1

# Para predecir entrada se requieren al menos 2 momentos o tiempos por lo cual es necesario otra matriz
# Copiar y pegar de los ejemplos el segundo grupo de comando para crear segunda matriz. Visualizar resultado

## generate a second region - industry matrix in which cells represent the presence/absence
## of a RCA (period 2)
mat2 <- mat1
mat2[3,1] <- 1

mat2

# Evidenciar las entradas con el siguiente comando y visualizar resultado
d = entry.list(mat1, mat2)
d

# Lo anterior permite ver las posibilidades de entrada cuando tienes un 0 de VCR
# Cuando tienes 1 puedes: permanecer o salir, pero no entrar
# NA, no puede entrar
# 1 tiene potencial de entrada y entro
# 0 puede tener potencial de entrada, pero no ha entrado

# Hacer una combinacion de bases: hacer un match entre Region e Industria de las bases 
# densidad del relacionamiento y la tabla region, industria, entrada y periodo
# Visualizar resultado
colnames(d) = c("Region","Industry","Entry","Period")
d = merge(d, rd, by = c("Region", "Industry"))
d

# Fijarse muy bien antes de hacer el merge de que ambas matrices coincidan en cuanto a la estructura
# Ambas matrices deben estar en formato de lista para que coincidan las columnas a unir

# Con estos resultado podemos hacer econometria incipiente como una regresion con el siguiente comando
# lm para referir a un modelo lineal con variable dependendiente Entry e independiente Count
# La entrada dependera de la densidad del relacionamiento
summary(lm(d$Entry ~ d$Count))

