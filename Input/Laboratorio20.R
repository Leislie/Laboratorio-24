# Hecho con gusto por Leislie Rocio Manjarrez Olmos (UAEH)

# LABORATORIO 20- Facting (romper un gráfico en varias dentro de una cuadrícula)

# Instala paquetería ggplot2
install.packages("ggplot2")

# Llamar libreria de la paquetería ggplot2
library(ggplot2)

# Ubicar ruta de los datos a cargar datos
file.choose()

# Crear objeto con datos
densidad_verde <- read.csv("C:\\Users\\leisl\\OneDrive\\Doctorado\\Semestre-3\\Temas-Selectos-1-Complejidad-Económica\\Modulo2\\Semana5-Labs-Salas\\Lab-20\\PARA FACETING.csv")

# Ver nombres dataframe
names(densidad_verde)

# Crear un gráfico (aes son elementos estéticos)
p <- ggplot(data = densidad_verde,
            mapping = aes(x = DENSITY,
                          y = PCI.2018,
                          color = Region)) +
  geom_point()

# Manipulando número de columnas
p + facet_wrap(~ Region, ncol = 5)

# Manipulando número de filas
p + facet_wrap(~ Region, nrow = 3)