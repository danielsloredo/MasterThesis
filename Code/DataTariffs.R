library(tidyverse)
library(readxl)
setwd("D:/Documentos/EnergySeminar/Proyect")

data_tariffs <- read_xlsx("./raw/Tarifas/Municipios_Tarifas.xlsx")

data_tariffs <- data_tariffs %>% 
  rename(ID_AGEM=Clave_AGEM, State=Estado,
                                        Municipality=Municipio, Domestic_Tariff=Tarifa_Domestica,
                                        Divisional_Area=Zona_Divisional, DAC_Area=Zona_tarifaria_DAC) %>% 
  mutate(Fixed=3.02,
         January_marginal=3.02, February_marginal=3.02, March_marginal=3.02, April_marginal=3.02,
         May_marginal=3.02, June_marginal=3.02, July_marginal=3.02, Agust_marginal=3.02, September_marginal=3.02,
         October_marginal=3.02, November_marginal=3.02, December_marginal=3.02)

AsignTariffs <- function(data_tariffs, Division, fixed, January_marginal, February_marginal,
                         March_marginal, April_marginal, May_marginal,
                         June_marginal,  July_marginal,  Agust_marginal,
                         September_marginal, October_marginal,
                         November_marginal, December_marginal){
    data_tariffs$Fixed[data_tariffs$Divisional_Area==Division]=fixed
    data_tariffs$January_marginal[data_tariffs$Divisional_Area==Division]=January_marginal
    data_tariffs$February_marginal[data_tariffs$Divisional_Area==Division]=February_marginal
    data_tariffs$March_marginal[data_tariffs$Divisional_Area==Division]=March_marginal
    data_tariffs$April_marginal[data_tariffs$Divisional_Area==Division]=April_marginal
    data_tariffs$May_marginal[data_tariffs$Divisional_Area==Division]=May_marginal
    data_tariffs$June_marginal[data_tariffs$Divisional_Area==Division]=June_marginal
    data_tariffs$July_marginal[data_tariffs$Divisional_Area==Division]=July_marginal
    data_tariffs$Agust_marginal[data_tariffs$Divisional_Area==Division]=Agust_marginal
    data_tariffs$September_marginal[data_tariffs$Divisional_Area==Division]=September_marginal
    data_tariffs$October_marginal[data_tariffs$Divisional_Area==Division]=October_marginal
    data_tariffs$November_marginal[data_tariffs$Divisional_Area==Division]=November_marginal
    data_tariffs$December_marginal[data_tariffs$Divisional_Area==Division]=December_marginal
  return(data_tariffs)
}

data_tariffs <- AsignTariffs(data_tariffs, "Bajio", 43.62, 2.265, 2.428,  2.575, 2.729, 2.916, 3.104, 3.394, 3.723, 4.088, 4.081, 4.012, 3.402)
data_tariffs <- AsignTariffs(data_tariffs, "Baja California", 65.54, 1.608, 1.663, 1.742, 1.836, 1.95, 2.065, 2.243, 2.446, 2.668, 2.665, 2.623, 2.248)
data_tariffs <- AsignTariffs(data_tariffs, "Baja California Sur", 65.54, 2.196, 2.454, 2.548, 2.723, 2.934, 3.148, 3.476, 3.850, 4.263, 4.254, 4.177, 3.485)
data_tariffs <- AsignTariffs(data_tariffs, "Centro Occidente", 38.27, 2.378, 2.546, 2.643, 2.774, 2.934, 3.095, 3.343, 3.625, 3.935, 3.929, 3.871, 3.349)
data_tariffs <- AsignTariffs(data_tariffs, "Centro Oriente", 42.86, 2.311, 2.433, 2.576, 2.707, 2.867, 3.027, 3.274, 3.557, 3.867, 3.861, 3.803, 3.282)
data_tariffs <- AsignTariffs(data_tariffs, "Centro Sur", 47.45, 2.404, 2.539, 2.657, 2.783, 2.935, 3.089, 3.325, 3.594, 3.892, 3.886, 3.831, 3.332)
data_tariffs <- AsignTariffs(data_tariffs, "Golfo Centro", 44.78, 2.557, 2.497, 2.711, 2.861, 3.043, 3.227, 3.509, 3.831, 4.186, 4.180, 4.113, 3.517)
data_tariffs <- AsignTariffs(data_tariffs, "Golfo Norte", 52.47, 2.223, (2.134+2.184)/2, 2.370, 2.515, 2.688, 2.865, 3.136, 3.444, 3.784, 3.777, 3.714, 3.144)
data_tariffs <- AsignTariffs(data_tariffs, "Jalisco", 48.68, 2.841, (2.812+2.825)/2, 3.035, 3.196, 3.392, 3.591, 3.895, 4.241, 4.624, 4.616, 4.545, 3.903)
data_tariffs <- AsignTariffs(data_tariffs, "Noroeste", 59.17, 2.056, (2.064+2.075)/2, 2.251, 2.386, 2.551, 2.717, 2.972, 3.263, 3.584, 3.577, 3.517, 2.980)
data_tariffs <- AsignTariffs(data_tariffs, "Norte", 92.66, 2.369, (2.541+2.459)/2, 2.619, 2.743, 2.894, 3.046, 3.280, 3.546, 3.840, 3.834, 3.779, 3.287)
data_tariffs <- AsignTariffs(data_tariffs, "Oriente", 46.81, 2.420, (2.599+2.515)/2, 2.686, 2.818, 2.978, 3.139, 3.387, 3.670, 3.982, 3.975, 3.917, 3.394)
data_tariffs <- AsignTariffs(data_tariffs, "Peninsular", 49.56, 2.367, (2.536+2.482)/2, 2.690, 2.850, 3.044, 3.241, 3.542, 3.884, 4.263, 4.256, 4.185, 3.549)
data_tariffs <- AsignTariffs(data_tariffs, "Sureste", 72.38, 2.368, (2.470+2.542)/2, 2.654, 2.796, 2.969, 3.143, 3.411, 3.716, 4.052, 4.046, 3.983, 3.419)
data_tariffs <- AsignTariffs(data_tariffs, "Valle de Mexico Centro", 57.16, 2.076, (2.231+2.194)/2, 2.406, 2.57, 2.768, 2.968, 3.277, 3.627, 4.015, 4.007, 3.934, 3.285)
data_tariffs <- AsignTariffs(data_tariffs, "Valle de Mexico Sur", 65.45, 2.178, (2.334+2.292)/2, 2.497, 2.655, 2.847, 3.040, 3.338, 3.676, 4.050, 4.043, 3.973, 3.346)
data_tariffs <- AsignTariffs(data_tariffs, "Valle de Mexico Norte", 64.18, 2.185, (2.329+2.298)/2, 2.499, 2.654, 2.842, 3.032, 3.324, 3.656, 4.023, 4.016, 3.947, 3.332)


write.csv(data_tariffs, "D:/Documentos/EnergySeminar/Proyect/Data_Maps/data_tariffs.csv", row.names = FALSE)
