library(plyr)
library(readxl)
library(stringr)
x <- c("raster", "sf")
lapply(x, library, character.only = TRUE)
library(tidyverse)


muni_map <- st_read("D:/Documentos/EnergySeminar/Proyect/Data_Maps/muni_map/areas_geoestadisticas_municipales.shp")

muni_map <-
  muni_map %>%
  mutate(municode = as.integer(CVE_ENT) * 1000 + as.integer(CVE_MUN)) 
list_municipality <- as.data.frame(muni_map$NOM_MUN)
list_municipality <- cbind(list_municipality, as.data.frame(muni_map$municode))
list_municipality <- cbind(list_municipality, as.data.frame(muni_map$CVE_ENT))
list_municipality <- list_municipality %>%
  rename(municipality=`muni_map$NOM_MUN`, municode=`muni_map$municode`, sta=`muni_map$CVE_ENT`) %>% 
  mutate(mun=str_to_upper(municipality),
         statecode=as.numeric(sta)) %>% 
  select(-municipality, -sta)
list_municipality <- list_municipality %>% 
  mutate(name_mun = chartr("ÁÉÍÓÚ-", "AEIOU ", mun), 
         name_mun = str_replace_all(name_mun, "\\s+", "")) %>% 
  select(-mun)

list_states <- read_xlsx("D:/Documentos/EnergySeminar/Proyect/raw/CatalogoNodosP/CStates.xlsx", col_names = TRUE)
list_states <- list_states %>%
  mutate(name_state=str_to_upper(state),
         name_state = chartr("ÁÉÍÓÚ-", "AEIOU ", name_state), 
         name_state = str_replace_all(name_state, "\\s+", "")) %>% 
  select(-state)

ReadCatalog <- function(x, list_mun, list_sta){
  if (x=="Jan" || x=="Feb" || x=="Mar" || x=="Apr" || x=="May" || x=="Jun" || x=="Jul" || x=="Aug"){
    catalog <- read_xlsx(paste(paste("D:/Documentos/EnergySeminar/Proyect/raw/CatalogoNodosP/CNP_", x, sep=""), ".xlsx", sep=""), skip = 1, col_names = TRUE) 
    catalog <- catalog %>% 
      select(CLAVE, LOCALIDAD, ESTADO) %>%
      rename(id_node=CLAVE, mun=LOCALIDAD, state=ESTADO)
    catalog <- catalog %>% 
      mutate(name_mun = str_to_upper(mun),
             name_mun = chartr("ÁÉÍÓÚ-", "AEIOU ", name_mun), 
             name_mun = str_replace_all(name_mun, "\\s+", "")) %>% 
      select(-mun)
    catalog <- catalog %>% 
      mutate(name_state = str_to_upper(state),
             name_state = chartr("ÁÉÍÓÚ-", "AEIOU ", name_state),
             name_state = str_replace(name_state,"\\CD.","CIUDADDE"),
             name_state = str_replace_all(name_state, "\\s+", "")) %>% 
      select(-state)
    catalog <- left_join(catalog, list_sta, by="name_state")
    catalog <- catalog %>%
      filter(statecode!=is.na(statecode)) %>% 
      select(-name_state)
    catalog <- left_join(catalog, list_mun, by=c("name_mun","statecode"))
    catalog <- catalog %>%
      filter(municode!=is.na(municode)) %>% 
      select(-statecode)
  }else{
    catalog <- read_xlsx(paste(paste("D:/Documentos/EnergySeminar/Proyect/raw/CatalogoNodosP/CNP_", x, sep=""), ".xlsx", sep=""), skip = 1, col_names = TRUE) 
    catalog <- catalog %>% 
      mutate(municode=as.integer(`CLAVE DE ENTIDAD FEDERATIVA (INEGI)`) * 1000 + as.integer(`CLAVE DE MUNICIPIO (INEGI)`)) %>% 
      select(CLAVE, municode, `MUNICIPIO (INEGI)`) 
    catalog <- catalog %>%
      filter(municode!=is.na(municode)) %>%
      rename(id_node=CLAVE, name_mun=`MUNICIPIO (INEGI)`)
  }
  return(catalog)
}

names_catalogues <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec", "2019")

list_catalogues <- lapply(names_catalogues, ReadCatalog, list_mun=list_municipality, list_sta=list_states) 
catalog_nodes <- bind_rows(list_catalogues)
catalog_nodes <- catalog_nodes %>% distinct(id_node, .keep_all = TRUE)
save(catalog_nodes, file = "D:/Documentos/EnergySeminar/Proyect/Data_Maps/catalog_nodes.RData")

ReadPML <- function(x, syst){
  month <- read_csv(paste(paste(paste("D:/Documentos/EnergySeminar/Proyect/raw/BCSUR/2018/PML", syst, sep=""), x, sep = ""), ".csv", sep = ""), skip=7, col_names = TRUE)
  month <- month %>% rename(date=Fecha, time=Hora,
                                          id_node=`Clave del nodo`, 
                                          pml=`Precio marginal local ($/MWh)`,
                                          energy_component=`Componente de energia ($/MWh)`, 
                                          congestion_component=`Componente de congestion ($/MWh)`, 
                                          loss_component=`Componente de perdidas ($/MWh)`)
  month$pml <- month$pml/1000
  month$energy_component <- month$energy_component/1000
  month$congestion_component <- month$congestion_component/1000
  month$loss_component <- month$loss_component/1000
  
  month$time <- month$time*10000
  month$time <- substr(as.POSIXct(sprintf("%06.0f", month$time), format='%H%M%S'), 12, 19)
  month$datetime <- as.POSIXct(paste(month$date, month$time), format='%Y-%m-%d %H:%M:%S')
  
  return(month)
} 

names_pml <- c("Ene1", "Ene2", "Feb1", "Feb2", "Mar1", "Mar2", "Abr1", "Abr2", "May1", "May2", "Jun1", "Jun2",
               "Jul1", "Jul2", "Ago1", "Ago2", "Sep1", "Sep2", "Oct1", "Oct2", "Nov1", "Nov2", "Dic1", "Dic2")

list_pml <- lapply(names_pml, ReadPML, syst="sin") 
data_pml <- bind_rows(list_pml)
save(data_pml, file = "D:/Documentos/EnergySeminar/Proyect/Data_Maps/data_pml.RData")

list_pml_bc <- lapply(names_pml, ReadPML, syst="bc") 
data_pml_bc <- bind_rows(list_pml_bc)
save(data_pml_bc, file = "D:/Documentos/EnergySeminar/Proyect/Data_Maps/data_pml_bc.RData")

list_pml_bcs <- lapply(names_pml, ReadPML, syst="bcs") 
data_pml_bcs <- bind_rows(list_pml_bcs)
save(data_pml_bcs, file = "D:/Documentos/EnergySeminar/Proyect/Data_Maps/data_pml_bcs.RData")

load("D:/Documentos/EnergySeminar/Proyect/Data_Maps/data_pml.RData")
load("D:/Documentos/EnergySeminar/Proyect/Data_Maps/data_pml_bc.RData")
load("D:/Documentos/EnergySeminar/Proyect/Data_Maps/data_pml_bcs.RData")
load("D:/Documentos/EnergySeminar/Proyect/Data_Maps/catalog_nodes.RData")

data_pml_complete <- left_join(data_pml, catalog_nodes, by="id_node") %>% 
  filter(is.na(municode)!=TRUE)
save(data_pml_complete, file = "D:/Documentos/EnergySeminar/Proyect/Data_Maps/data_pml_complete.RData")

data_pml_complete_bc <- left_join(data_pml_bc, catalog_nodes, by="id_node") %>% 
  filter(is.na(municode)!=TRUE)
save(data_pml_complete_bc, file = "D:/Documentos/EnergySeminar/Proyect/Data_Maps/data_pml_complete_bc.RData")

data_pml_complete_bcs <- left_join(data_pml_bcs, catalog_nodes, by="id_node") %>% 
  filter(is.na(municode)!=TRUE)
save(data_pml_complete_bcs, file = "D:/Documentos/EnergySeminar/Proyect/Data_Maps/data_pml_complete_bcs.RData")

load("D:/Documentos/EnergySeminar/Proyect/Data_Maps/data_pml_complete.RData")
load("D:/Documentos/EnergySeminar/Proyect/Data_Maps/data_pml_complete_bc.RData")
load("D:/Documentos/EnergySeminar/Proyect/Data_Maps/data_pml_complete_bcs.RData")

data_pml_mean <- data_pml_complete %>% 
  dplyr::select(datetime, pml, municode)

data_pml_mean <- data_pml_mean %>% 
  group_by(municode, datetime) %>% 
  summarise(mean_pml=base::mean(pml))
save(data_pml_mean, file = "D:/Documentos/EnergySeminar/Proyect/Data_Maps/data_pml_mean.RData")

data_pml_mean_bc <- data_pml_complete_bc %>% 
  dplyr::select(datetime, pml, municode)

data_pml_mean_bc <- data_pml_mean_bc %>% 
  group_by(municode, datetime) %>% 
  summarise(mean_pml=base::mean(pml))
save(data_pml_mean_bc, file = "D:/Documentos/EnergySeminar/Proyect/Data_Maps/data_pml_mean_bc.RData")

data_pml_mean_bcs <- data_pml_complete_bcs %>% 
  dplyr::select(datetime, pml, municode)

data_pml_mean_bcs <- data_pml_mean_bcs %>% 
  group_by(municode, datetime) %>% 
  summarise(mean_pml=base::mean(pml))
save(data_pml_mean_bcs, file = "D:/Documentos/EnergySeminar/Proyect/Data_Maps/data_pml_mean_bcs.RData")

load("D:/Documentos/EnergySeminar/Proyect/Data_Maps/data_pml_mean.RData")
load("D:/Documentos/EnergySeminar/Proyect/Data_Maps/data_pml_mean_bc.RData")
load("D:/Documentos/EnergySeminar/Proyect/Data_Maps/data_pml_mean_bcs.RData")

data_pml_mean <- rbind(data_pml_mean, data_pml_mean_bc, data_pml_mean_bcs)

data_pml_map_1 <- data_pml_mean[data_pml_mean$datetime >= "2018-04-01" & data_pml_mean$datetime <= "2018-10-01",]
data_pml_map_2 <- data_pml_mean[data_pml_mean$datetime <= "2018-04-01" | data_pml_mean$datetime >= "2018-10-01",]

data_pml_map_1 <- data_pml_map_1 %>% 
  group_by(municode) %>% 
  summarise(mean_pml_summer=base::mean(mean_pml))

data_pml_map_2 <- data_pml_map_2 %>% 
  group_by(municode) %>% 
  summarise(mean_pml_winter=base::mean(mean_pml))

muni_map_1 <-
  muni_map %>%
  left_join(data_pml_map_1, by = "municode")

info_missings <- data.frame(CVE_ENT=muni_map_1$CVE_ENT, price=muni_map_1$mean_pml_summer)
mean_state_1  <- info_missings %>% group_by(CVE_ENT) %>% summarise(mean=mean(price, na.rm=TRUE))
muni_map_1 <- muni_map_1 %>% 
  left_join(mean_state_1)
muni_map_1$mean_pml_summer[is.na(muni_map_1$mean_pml_summer)] <- muni_map_1$mean[is.na(muni_map_1$mean_pml_summer)]
muni_map_1 <- muni_map_1 %>% select(-mean)

muni_map_2 <-
  muni_map %>%
  left_join(data_pml_map_2, by = "municode")

info_missings <- data.frame(CVE_ENT=muni_map_2$CVE_ENT, price=muni_map_2$mean_pml_winter)
mean_state_2  <- info_missings %>% group_by(CVE_ENT) %>% summarise(mean=mean(price, na.rm=TRUE))
muni_map_2 <- muni_map_2 %>% 
  left_join(mean_state_2)
muni_map_2$mean_pml_winter[is.na(muni_map_2$mean_pml_winter)] <- muni_map_2$mean[is.na(muni_map_2$mean_pml_winter)]
muni_map_2 <- muni_map_2 %>% select(-mean)


ggplot(data = muni_map_1) +
  geom_sf(aes(fill = mean_pml_summer), color = NA) +
  scale_fill_distiller(palette = "Greens", direction = 1) +
  theme_light() + labs(fill = "$/kWh")
ggsave("D:/Documentos/EnergySeminar/Proyect/Data_Maps/PML_summer.pdf")

ggplot(data = muni_map_2) +
  geom_sf(aes(fill = mean_pml_winter), color = NA) +
  scale_fill_distiller(palette = "Greens", direction = 1) +
  theme_light() + labs(fill = "$/kWh")
ggsave("D:/Documentos/EnergySeminar/Proyect/Data_Maps/PML_winter.pdf")
