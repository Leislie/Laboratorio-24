# Hecho con gusto por Leislie Rocio Manjarrez Olmos (UAEH)

# Laboratorio 16 -Analisis de redes en R- Indicadores basicos globales

# Cargar libreria de EconGeo
library(EconGeo)

# Cargar data de las interaciones de los personajes de los miserables
EL = read.csv("https://raw.githubusercontent.com/PABalland/ON/master/lesmis-el.csv")

# Ver el encabezado
head(EL)

# Tranformar dataframe en matriz
MM <- get.matrix(EL)

# Visualizar matriz (la red es no dirigida porque si la doblara seria lo mismo)
# El ejemplo para distinguir entre matrices dirigidas y no dirigidas
# Twitter sigo a alguien pero ese alguien no me sigue (unidireccional)
# Facebook mando solicitud amistad y al aceptarme nos hacemos amigos (bidireccional)
head(MM)

# Llamar libreria para graficar
library(igraph)

# Crear objeto g para crear grafico proveniente del dataframe
g <- graph_from_data_frame(d=EL, directed = FALSE)

# Visualizar objeto grafico
plot(g)

# Eliminar el peso de la relacion
EL$Weight = NULL

# Visualizar resultado
head(EL)

# Cargar libreria para visualizaciones
library(networkD3)

# Generar grafico con networkD3. Este tipo de graficos pueden guardar como una pagina web
simpleNetwork(EL)
