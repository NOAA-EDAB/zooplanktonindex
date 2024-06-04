# Process inputs for zooplankton index standardization in VAST
# see decisions in https://noaa-edab.github.io/zooplanktonindex/ZoopVASTworkflow.html

library(tidyverse)
library(here)

# read in file from Scott, also this should be available for download
# but I can't make the ftp site work

ecomonall <- read_csv(here::here("data/EcoMon_Plankton_Data_v3_8.csv"))

# get herring specific indices, 

# sum across all copepods

sumcopepods <- ecomonall |>
  dplyr::rowwise() |>
  dplyr::mutate(allcopepods_10m2 = sum(ctyp_10m2,
                                       calfin_10m2,
                                       pseudo_10m2,
                                       tlong_10m2,
                                       cham_10m2,
                                       para_10m2,
                                       acarspp_10m2,
                                       mlucens_10m2,
                                       calminor_10m2,
                                       clauso_10m2,
                                       acarlong_10m2,
                                       euc_10m2,
                                       fur_10m2,
                                       calspp_10m2,
                                       ost_10m2,
                                       temspp_10m2,
                                       tort_10m2,
                                       paraspp_10m2,
                                       na.rm = TRUE
  ),
  allcopepods_100m3 = sum(ctyp_100m3,
                          calfin_100m3,
                          pseudo_100m3,
                          tlong_100m3,
                          cham_100m3,
                          para_100m3,
                          acarspp_100m3,
                          mlucens_100m3,
                          calminor_100m3,
                          clauso,
                          acarlong_100m3,
                          euc_100m3,
                          fur_100m3,
                          calspp_100m3,
                          ost_100m3,
                          temspp_100m3,
                          tort_100m3,
                          paraspp_100m3,
                          na.rm = TRUE
  ) 
  ) |>
  dplyr::select(cruise_name, station, lat, lon, date, time, depth, 
                sfc_temp, sfc_salt, btm_temp, btm_salt, volume_1m2, volume_100m3,
                allcopepods_10m2, allcopepods_100m3)
  
# add summed copepods, fix dates, establish seasons

herringfood <- ecomonall |>
    dplyr::left_join(sumcopepods) |>
    dplyr::select(cruise_name, station, lat, lon, date, time, depth, 
                  sfc_temp, sfc_salt, btm_temp, btm_salt, volume_1m2, volume_100m3,
                  allcopepods_10m2, allcopepods_100m3, euph_10m2, euph_100m3,
                  hyper_10m2, hyper_100m3, calfin_10m2, calfin_100m3) |>
    dplyr::mutate(date = lubridate::dmy(date),
                  year = lubridate::year(date),
                  month = lubridate::month(date),
                  day = lubridate::day(date),
                  stationid = paste0(cruise_name, "_", station),
                  season_ng = case_when(month <= 6 ~ "SPRING",
                                        month >= 7 ~ "FALL",
                                        TRUE ~ as.character(NA)),
                  season_4 = case_when(month %in% c(12,1,2) ~ "winter",
                                       month %in% c(3,4,5) ~ "spring",
                                       month %in% c(6,7,8) ~ "summer",
                                       month %in% c(9,10,11) ~ "fall",
                                       TRUE ~ as.character(NA)))

saveRDS(herringfood, here("data/herringfood_stn_all.rds"))
  
# merge with OISST to fill gaps


