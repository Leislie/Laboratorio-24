
# Hecho con gusto por Leislie Rocio Manjarrez Olmos

# Laboratorio - PIVOTAR A LO LARGO


#############################################
#LABORATORIO: Tidy data (datos ordenados) 1 #
#############################################
#Prerrequisitos

#instalar paquete tidyverse  y readr
install.packages("tidyverse")
install.packages("readr")


#Cargar paquete tidyverse y readr
library(tidyverse)
library(readr)

#CARGAR DATOS en environment seleccionar Import Dataset y seleccionar archivo en csv
#Una vez verificado que la tabla cargo correctamente copiar codigo esquina inferior izquierda e importar datos
#Pegar el codigo copiado y sustituir ICE_2014 por Tabla1

library(readr)
Tabla1 <- read_delim("C:/Users/leisl/OneDrive/Doctorado/Semestre-3/Temas-Selectos-1-Complejidad-Económica/Modulo2/Labs-Semana3/Lab5/ICE_2014.csv", 
                       delim = ";", escape_double = FALSE, trim_ws = TRUE)
Head(ICE_2014)
#Permite ver la tabla


names(Tabla1)
#Permite ver todas las columnas

# 1. Pivotar tabla  "A LO LARGO"
t1_PIVOTANTE = Tabla1 %>%
  pivot_longer(cols = c("Km,0" , "Km,2" , "Km,4" , "Km,6" , "Km,8" , "Km,10" , "Km,12" , "Km,14" , "Km,16" , "Km,18" , "Km,20" , "Km,22" , "Km,24" , "Km,26"), names_to = "iteracion", values_to = "ranking")

# Exportar resultado: tabla ordenada
write.csv(t1_PIVOTANTE, file = "ice_CHARTICULATOR.csv")

#Permite ver la ruta donde guardo el archivo
getwd()
