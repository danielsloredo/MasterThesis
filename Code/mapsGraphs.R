x <- c("raster", "tidyverse", "sf", "readxl")
lapply(x, library, character.only = TRUE)
library("rgdal")
library(stringr)
library(directlabels)

muni_map <- st_read("/Users/mb94045/Documents/Daniel/Titulacion_Maestria/Proyect/Shape/areas_geoestadisticas_municipales.shp")

muni_map <-
  muni_map %>%
  mutate(municode = as.integer(CVE_ENT) * 1000 + as.integer(CVE_MUN)) 

tariffs_data <- read_csv("/Users/mb94045/Documents/Daniel/Titulacion_Maestria/Proyect/Data/data_tariffs.csv")

tariffs_data <- tariffs_data %>% mutate(municode=as.integer(municode)) 

muni_map <-
  muni_map %>%
  left_join(tariffs_data, by = "municode") %>%
  mutate(mean_tariff = rowMeans(subset(tariffs_data, select = c(January_marginal:December_marginal))))


ggplot(data = muni_map) +
  geom_sf(aes(fill = mean_tariff), color = NA) +
  scale_fill_distiller(palette = "Greens", direction = 1) +
  theme_light() + labs(fill = "$/kWh")

ggsave("D:/Documentos/EnergySeminar/Proyect/Data_Maps/mean_tariffs.pdf")

ggplot(data = muni_map) +
  geom_sf(aes(fill = Fixed), color = NA) +
  scale_fill_distiller(palette = "Greens", direction = 1) +
  theme_light() + labs(fill = "$")
ggsave("D:/Documentos/EnergySeminar/Proyect/Data_Maps/fixed_tariffs.pdf")

statistics <- as.data.frame(as.array(summary(muni_map$Fixed)))
statistics <- statistics %>% rename(statistic=Var1, Fixed_Charge=Freq) 
statistics$statistic <- as.character(statistics$statistic)
statistics[7, 2]<-sd(muni_map$Fixed)
statistics[7, 1]<-"StDev"
statistics$Marginal_Price <- c(as.vector(summary(muni_map$mean_tariff)), sd(muni_map$mean_tariff))
statistics

load("/Users/mb94045/Documents/Daniel/Titulacion_Maestria/Proyect/Data/data_pml_mean.RData")
load("/Users/mb94045/Documents/Daniel/Titulacion_Maestria/Proyect/Data/data_pml_mean_bc.RData")
load("/Users/mb94045/Documents/Daniel/Titulacion_Maestria/Proyect/Data/data_pml_mean_bcs.RData")


data_pml_mean <- rbind(data_pml_mean, data_pml_mean_bc, data_pml_mean_bcs)


data_pml_map <- data_pml_mean %>% 
  group_by(municode) %>% 
  summarise(mean_pml=base::mean(mean_pml))

muni_map <-
  muni_map %>%
  left_join(data_pml_map, by = "municode")

info_missings <- data.frame(CVE_ENT=muni_map$CVE_ENT, price=muni_map$mean_pml)
mean_state  <- info_missings %>% group_by(CVE_ENT) %>% summarise(mean=mean(price, na.rm=TRUE))

muni_map <- muni_map %>% 
  left_join(mean_state)
muni_map$mean_pml[is.na(muni_map$mean_pml)] <- muni_map$mean[is.na(muni_map$mean_pml)]

muni_map <- muni_map %>% select(-mean)

muni_map <- muni_map %>% mutate(mean_diff = mean_tariff - mean_pml)

ggplot(data = muni_map) +
  geom_sf(aes(fill = mean_diff), color = NA) +
  scale_fill_distiller(palette = "Greens", direction = 1) +
  theme_light() + labs(fill = "$")

ggsave("D:/Documentos/EnergySeminar/Proyect/Data_Maps/difference.pdf")



data_pml_mean$hora <- str_split_fixed(data_pml_mean$datetime, " ", 2)[,2]

data_pml_graph <- data_pml_mean %>% 
  group_by(hora) %>% 
  summarise(mean_pml=base::mean(mean_pml))

data_pml_graph <- data_pml_graph[2:nrow(data_pml_graph),]

min_tariff <- min(tariffs_data$January_marginal)
mean_tariff <- mean(muni_map$January_marginal)
data_pml_graph$min_tariff <- rep(min_tariff, times = nrow(data_pml_graph))

colors <- c('Marginal Cost' = 'darkgreen', 'Marginal Price' = 'darkblue', 'Mean Marginal Cost' = 'blue')

mean_cost <- mean(data_pml_graph$mean_pml)

ggplot(data_pml_graph, aes(hora, mean_pml, group=1))+
  geom_line(aes(col='Marginal Cost'), size=.7) +
  labs(y="pesos/kWh", x="Time of the day", color = "") +
  scale_x_discrete(breaks = data_pml_graph$hora[c(T,F,F,F)]) +
  theme(axis.title.x=element_text(size=12),  # X axis title
        axis.title.y=element_text(size=12),  # Y axis title
        axis.text.x=element_text(size=10), # X axis text
        axis.text.y=element_text(size=10)) +
  geom_line(aes(hora, min_tariff, col='Marginal Price'), size=.7, linetype = 'twodash')+
  geom_line(aes(hora, mean_cost, col='Mean Marginal Cost'), size=.7, linetype = 'twodash')+
  scale_color_manual(values = colors) +
  theme_minimal()

ggsave("D:/Documentos/EnergySeminar/Proyect/Images/cost_price.png")

ggplot(data_pml_graph, aes(hora, mean_pml, group=1))+
  geom_line(size=.7, col='darkgreen') +
  labs(y="pesos/kWh", x="") +
  scale_x_discrete(breaks = data_pml_graph$hora[c(T,F,F,F,F)]) +
  theme_minimal()+
  theme(axis.title.x=element_text(size=16),  # X axis title
        axis.title.y=element_text(size=22),  # Y axis title
        axis.text.x=element_text(size=19), # X axis text
        axis.text.y=element_text(size=19)) +
  geom_text(x=18.5, y=1.81, aes(label="Marginal Cost", family = "sans", fontface="plain"), size=6.5, color='darkgreen')+
  geom_text(x=6, y=1.58, aes(label="Marginal Price", family = "sans", fontface="plain"), size=6.5, color='darkblue')+
  geom_line(aes(hora, min_tariff), size=.7, linetype = 'twodash', col = 'darkblue')

ggsave("/Users/mb94045/Documents/Daniel/Titulacion_Maestria/Proyect/Maps/cost_price2.0.png")

ggplot(data_pml_graph, aes(hora, mean_pml, group=1))+
  geom_line(size=.7, col='darkgreen') +
  labs(y="pesos/kWh", x="Time of the day") +
  scale_x_discrete(breaks = data_pml_graph$hora[c(T,F,F,F)]) +
  geom_line(aes(hora, min_tariff), size=.7, linetype = 'twodash', col = 'darkblue')+
  geom_line(aes(hora, mean_cost), size=.7, linetype = 'twodash', col = 'blue')+
  geom_text(x=18.5, y=1.81, aes(label="Marginal Cost", family = "sans", fontface="plain"), size=4.5, color='darkgreen')+
  geom_text(x=6, y=1.58, aes(label="Marginal Price", family = "sans", fontface="plain"), size=4.5, color='darkblue')+
  geom_text(x=18.5, y=1.66, aes(label="Mean Marginal Cost", family = "sans", fontface="plain"), size=4.5, color='blue')+
  theme_minimal() +
  theme(axis.title.x=element_text(size=16),  # X axis title
        axis.title.y=element_text(size=16),  # Y axis title
        axis.text.x=element_text(size=13), # X axis text
        axis.text.y=element_text(size=13))
ggsave("/Users/mb94045/Documents/Daniel/Titulacion_Maestria/Proyect/Maps/cost_price3.png")
