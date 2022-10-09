library(ggmap)
library(ggplot2)
# library(rayshader)


# data = read_csv("../AtaquesPoblaciones1988-2012.xlsx")
# Dep_Geo = read.csv("../Lista_Dep_Geo.csv",
#                    encoding = "UTF-8",
#                    dec = ",")
# 
# data$Municipio = as.factor(data$Municipio)
# data$Departamento = as.factor(data$Departamento)
# 
# str(data$Departamento)
# summary(data$Departamento)
# 
# Lista = data$Departamento
# Lista
# 
# write.table(Lista, # aquí solo guarde el primer intento
#             file = "Lista_Dep.csv",
#             row.names = FALSE
# )
# 
# Lista_csv = read.csv("Lista_Dep.csv")
# View(Lista_csv)

register_google(key = "AIzaSyD1X3sw4Lw0WDLXZDzSdYYkxDanvlVgvv0")

data_map = get_map(location = c(lon=-75.640174, lat=4.584566), # la función get_map me permite tomar el mapa
                   zoom = "auto" # nivel de zoom
                   )

plot(data$Departamento)

data_map = col_map

gg = ggmap(data_map,# ingreso el mapa
           extent = "device" # para que el mapa se extienda donde se encuentre
) +
  geom_density2d(data = Dep_Geo, 
                 aes(x = Lon, y = Lat), # coordenadas de los puntos
                 size = 0.3 # tamaño de los puntos
  ) +
  stat_density2d(data = Dep_Geo, 
                 aes(x = Lon, y = Lat,
                     fill = ..level.., # con ..fill.. entre mas concentrados esten los puntos 
                     alpha = ..level..), # coordenadas de los puntos
                 size = 1, # tamaño de los puntos
                 bins = 30, # número de divsiones
                 geom = "polygon" # geometría poligonos
  ) +
  scale_fill_gradient(low = "green", high = "red",
                      guide = "colourbar",
                      labels = NULL,
                      name = "Ataques\nPoblaciones\n1988-2002\nRojo = 120\nVerde = 1") + # fijo un gradiente de color
  scale_alpha(range = c(0, 0.25), # establezco el rango de la transparencia
              guide = FALSE # quito la leyenda de los datos
  ) +
  labs(title = "Incidencia de ataques sufridos 1988-2002")
gg          
# plot_gg(gg, multicore = TRUE, width = 8, height = 8, scale = 250)