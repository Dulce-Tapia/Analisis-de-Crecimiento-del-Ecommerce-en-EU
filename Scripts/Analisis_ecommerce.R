#-------------------Análisis de Crecimiento del E-commerce en EU-------------------

#Cargar las librerías necesarias 
library(readr)
library(tidyverse)
library(ggplot2)
library(dplyr)

#Cargar la base de datos 
data <- read_csv("usa_online_shopping.csv")
 
#Vista general de los datos 
glimpse(data)
summary(data)

#---------------------------------Limpieza de datos----------------------------------

#Convertir el porcentaje de crecimiento a número ya que se encuentra como string
#Crear una nueva columna solo con el estado (omitiendo la ciudad)
data <- data %>%
  mutate(GrowthRate = as.numeric(str_replace(`Revenue growth`,"%","")),State = str_trim(str_extract(`Headquarters`, "(?<=, ).*"))) 

#Revisar si hay NAs
sum(is.na(data$GrowthRate))

#-------------------------------------Crecimiento por sector-------------------------

#Obtener un arreglo con el promedio de crecimiento por sector
growth_by_sector <- data %>%
  group_by(`Industry`) %>%
  summarise(
    avg_growth=mean(GrowthRate, na.rm = TRUE),
    Num_Comanies = n()
  ) %>%
  arrange(desc(avg_growth))

#Graficar el promedio de crecimiento por sector
ggplot(growth_by_sector, aes(x = reorder(`Industry`, avg_growth), y = avg_growth)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  labs(title = "Crecimiento promedio por tipo de e-commerce",
       x = "Tipo de e-commerce",
       y = "Crecimiento promedio (%)") + 
  theme(axis.text.y = element_text(size = 7), axis.text.x = element_text(size = 7),
        plot.title = element_text(hjust=0.5))

#------------------------------- Crecimiento por estado-----------------------------

#Calcular ingresos y crecimiento por estado 
geo_summary <- data %>%
  group_by(`State`) %>%
  summarise(
    avg_revenue = mean(`Revenue (USD millions)`, na.rm = TRUE),
    avg_growth = mean(GrowthRate, na.rm = TRUE),
    Num_Companies = n()
  ) %>%
  arrange(desc(avg_revenue))

#Graficar para visualizar los estados con mayores ingresos
ggplot(geo_summary, aes(x = reorder(`State`, avg_revenue), y = avg_revenue)) +
  geom_col(fill = "darkgreen") +
  coord_flip() +
  labs(title = "Ingresos promedio por estado",
       x = "Estado",
       y = "Ingresos (Millones USD)") +
  theme(axis.text.y = element_text(size = 7), axis.text.x = element_text(size = 7),
        plot.title = element_text(hjust=0.5))

#------------------------- ¿Qué tipo de negocio hay en cada estado? --------------

sector_geo <- data %>%
  group_by(`State`, `Industry`) %>%
  summarise(
    avg_growth = mean(GrowthRate, na.rm = TRUE),
    avg_revenue = mean(`Revenue (USD millions)`, na.rm = TRUE),
    Num_Companies = n()
  ) %>%
  arrange(desc(avg_growth))

#
ggplot(sector_geo, aes(x = `State`, y =  `Industry`, size = avg_growth, fill = avg_revenue)) +
  geom_point(shape = 21, color = "black") +
  scale_fill_gradient(low = "lightyellow", high = "darkred") +
  labs(title = "Crecimiento e ingresos por sector y estado",
       x = "Estado",
       y = "Tipo de e-commerce",
       size = "Crecimiento (%)",
       fill = "Ingresos (Millones USD)") 
theme_minimal()

