# Hecho con gusto por Leislie Rocio Manjarrez Olmos (UAEH)


# LABORATORIO - Gráficos en R con ggplot2 

# Instalar primero las paqueterías necesarias
install.packages("tidyverse")
install.packages("readr")
install.packages("ggplot2")

# Llamar a la libreria de ggplot2
library(ggplot2)

# Cargar las BD desde Files / Upload
# Leer los datos en la nube
green_data <- read.csv("REGESIONES FINALES.csv")

# Para visualizar los datos ejecutar el siguiente comando
names(green_data)

# Generar primer grafico
p1 <-ggplot (data =  green_data,
             mapping = aes (x = ICE_index,
                            y = GCI_index,))+
  geom_point()+
  geom_text(label = green_data$STATE,
            color = "black",
            size = 4) +
  geom_point()+
  geom_smooth(method = lm,
              se = FALSE,
              fullrange = TRUE)

# Visualizar p1
p1

# Generar un segundo grafico reciclando el codigo anterior
p2 <-ggplot (data =  green_data,
             mapping = aes (x = ICE_rank,
                            y = GCI_rank,))+
  geom_point()+
  geom_text(label = green_data$STATE,
            color = "black",
            size = 4) +
  geom_point()+
  geom_smooth(method = lm,
              se = FALSE,
              fullrange = TRUE)

# Visualizar p2
p2

# Generar un tercer grafico reciclando el codigo anterior
p3 <-ggplot (data =  green_data,
             mapping = aes (x = LPIBE,
                            y = GCI_index,))+
  geom_point()+
  geom_text(label = green_data$STATE,
            color = "black",
            size = 4) +
  geom_point()+
  geom_smooth(method = lm,
              se = FALSE,
              fullrange = TRUE)

# Visualizar p3
p3

# Para conocer la correlacion entre las variables primero instalar el siguiente paquete
install.packages("psych")

# Cargar posteriormente la libreria
library(psych)

# Luego cargar la libreria de readr y posteriormente crear 
# un dataframe denominado correl
library(readr)
correl <- read_csv("correl.csv")

# Visualizar la tabla anterior
head(correl)

# Para correlacionar de forma pariada las variables de la tabla generada
# con anterioridad ejecutar el siguiente comando
attach(correl)
names(correl)
pairs(correl)
pairs.panels(correl)

# Generar otra correlacion ahora con el metodo pearson
# con las medidas de complejidad
complex_corr <- cor(correl, method = "pearson")

# Visualizar resultado
complex_corr

# Redondear el coeficiente de correlacion y visualizar resultado
complex_corr = round(complex_corr, digits = 2)
complex_corr

# Para generar un mapa de calor instalar primero paquete ggcorrplot
install.packages("ggcorrplot")

# Llamar las siguientes librerias
library(ggcorrplot)
library(ggplot2)

# Generar un grafico mas
p4 <- ggcorrplot(complex_corr, method = "circle", type = "lower", lab = TRUE)+
  ggtitle("Matriz de correlación")+
  theme_minimal()

# Visualizar resultado
p4

# Para generar un conjunto de graficos en una sola cuadricula instalar el siguiente paquete
install.packages("ggpubr")

# Mandar llamar al paquete
require(ggpubr)
ggpubr :: ggarrange (p1, p2, p3, p4, etiquetas = c ("A", "B", "C" , "D"))

# Para arreglar la visualización en un grid de 2X2 instalar el siguiente paquete y llamarlo
install.packages("gridExtra")
require (gridExtra)
F1 <- grid.arrange (p1, p2, p3, p4, nrow = 2)