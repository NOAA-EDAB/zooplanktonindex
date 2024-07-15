# Process inputs for zooplankton index standardization in VAST
# see decisions in https://noaa-edab.github.io/zooplanktonindex/ZoopVASTworkflow.html

library(tidyverse)
library(here)

# read in file from Scott, also this should be available for download
# but I can't make the ftp site work

#ecomonall <- read_csv(here::here("data/EcoMon_Plankton_Data_v3_8.csv"))

# new dataset from Harvey, not on github
ecomonall <- read_csv(here::here("data/EcoMon Data_NCEI/EcoMon_Plankton_Data_v3_09_Do_Not_Distribute.csv"))

#new dataset names all caps
names(ecomonall) <- stringr::str_to_lower(names(ecomonall))

# get herring specific indices, 

# sum across all copepods

sumcopepods <- ecomonall |>
  dplyr::filter(!is.na(cruise_name)) |>
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
  ),
  smallcopeALL_100m3 = sum(ctyp_100m3,
                           pseudo_100m3,
                           tlong_100m3,
                           cham_100m3,
                           para_100m3,
                           acarspp_100m3,
                           clauso,
                           acarlong_100m3,
                           fur_100m3,
                           ost_100m3,
                           temspp_100m3,
                           tort_100m3,
                           paraspp_100m3,
                           na.rm = TRUE
  ),
  lgcopeALL_100m3 = sum(calfin_100m3,
                        mlucens_100m3,
                        calminor_100m3,
                        euc_100m3,
                        calspp_100m3,
                        na.rm = TRUE
  ),
  smallcopeSOE_100m3 = sum(ctyp_100m3,
                           pseudo_100m3,
                           tlong_100m3,
                           cham_100m3,
                           na.rm = TRUE
  ),
  lgcopeSOE_100m3 = calfin_100m3,
  
  smallcopeALL_10m2 = sum(ctyp_10m2,
                           pseudo_10m2,
                           tlong_10m2,
                           cham_10m2,
                           para_10m2,
                           acarspp_10m2,
                           clauso_10m2,
                           acarlong_10m2,
                           fur_10m2,
                           ost_10m2,
                           temspp_10m2,
                           tort_10m2,
                           paraspp_10m2,
                           na.rm = TRUE
  ),
  lgcopeALL_10m2 = sum(calfin_10m2,
                        mlucens_10m2,
                        calminor_10m2,
                        euc_10m2,
                        calspp_10m2,
                        na.rm = TRUE
  ),
  smallcopeSOE_10m2 = sum(ctyp_10m2,
                           pseudo_10m2,
                           tlong_10m2,
                           cham_10m2,
                           na.rm = TRUE
  ),
  lgcopeSOE_10m2 = calfin_10m2
  ) |>
  dplyr::select(cruise_name, station, lat, lon, date, time, depth, 
                sfc_temp, sfc_salt, btm_temp, btm_salt, volume_1m2, volume_100m3,
                allcopepods_10m2, allcopepods_100m3,
                smallcopeALL_10m2, smallcopeALL_100m3,
                lgcopeALL_10m2, lgcopeALL_100m3,
                smallcopeSOE_10m2, smallcopeSOE_100m3,
                lgcopeSOE_10m2, lgcopeSOE_100m3) # dont really need just placeholder
  
# add summed copepods, fix dates, establish seasons
# also add herring larvae

herringfood <- ecomonall |>
    dplyr::filter(!is.na(cruise_name)) |>
    dplyr::left_join(sumcopepods) |>
    dplyr::select(cruise_name, station, lat, lon, date, time, depth, 
                  sfc_temp, sfc_salt, btm_temp, btm_salt, volume_1m2, volume_100m3,
                  allcopepods_10m2, allcopepods_100m3, euph_10m2, euph_100m3,
                  hyper_10m2, hyper_100m3, calfin_10m2, calfin_100m3,
                  smallcopeALL_10m2, smallcopeALL_100m3,
                  lgcopeALL_10m2, lgcopeALL_100m3,
                  smallcopeSOE_10m2, smallcopeSOE_100m3,
                  cluhar_10m2, cluhar_100m3) |>
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

###############################################################################
#Now match stations to OISST

library(sf)
library(raster)
library(terra)
library(nngeo)

#read sst dataframes from the forage repo

# already have all OISST data as dataframes on this repo

# # Bastille function from https://github.com/kimberly-bastille/ecopull/blob/main/R/utils.R
# 
# nc_to_raster <- function(nc,
#                          varname,
#                          extent = c(0, 360, -90, 90),
#                          crop = raster::extent(280, 300, 30, 50),
#                          show_images = FALSE) {
#   
#   message("Reading .nc as brick...")
#   
#   r <- raster::brick(nc, varname = varname)
#   
#   message("Setting CRS...")
#   raster::crs(r) <- "+proj=longlat +lat_1=35 +lat_2=45 +lat_0=40 +lon_0=-77 +x_0=0 +y_0=0 +datum=NAD83 +no_defs +ellps=GRS80 +towgs84=0,0,0"
#   
#   # not sure if this is necessary?
#   raster::extent(r) <- raster::extent(extent)
#   
#   if(show_images){
#     par(mfrow = c(1,2))
#     raster::plot(r, 1, sub = "Full dataset")
#   }
#   
#   message("Cropping data...")
#   ne_data <- raster::crop(r, crop)
#   #ne_data <- raster::rotate(ne_data) add here for future pulls
#   
#   if(show_images){
#     raster::plot(ne_data, 1, sub = "Cropped dataset")
#     par(mfrow = c(1,1))
#   }
#   
#   message("Done!")
#   
#   return(ne_data)
# }
# 
# # function to convert to dataframe based on
# # https://towardsdatascience.com/transforming-spatial-data-to-tabular-data-in-r-4dab139f311f
# 
# raster_to_sstdf <- function(brick,
#                             rotate=TRUE){
#   
#   if(rotate) brick_r <- raster::rotate(brick)
#   brick_r <- raster::crop(brick_r, raster::extent(-77,-65,35,45))
#   sstdf <- as.data.frame(raster::rasterToPoints(brick_r, spatial = TRUE))
#   sstdf <- sstdf %>%
#     dplyr::rename(Lon = x,
#                   Lat = y) %>%
#     tidyr::pivot_longer(cols = starts_with("X"),
#                         names_to = c("year", "month", "day"),
#                         names_prefix = "X",
#                         names_sep = "\\.",
#                         values_to = "sst",
#     )
#   return(sstdf)
# }
# 
# # pull the OISST data as raster brick, modified from 
# # https://github.com/kimberly-bastille/ecopull/blob/main/.github/workflows/pull_satellite_data.yml
# 
# varname <- "sst"
# 
# # 1985-2021 previously pulled, processed and stored. add 2022.
# # add 1981-1984 to extend back in time. No OISST before 1981.
# # 1981 is only Sept-Dec so don't use
# 
# years <- #1982:1984 # 2022
# for(i in years) {
#   name <- paste0(i, ".nc")
#   dir.create(here::here("data-raw","gridded", "sst_data"), recursive = TRUE)
#   filename <- here::here("data-raw","gridded", "sst_data", paste0("test_", i, ".grd"))
#   url <- paste0("https://downloads.psl.noaa.gov/Datasets/noaa.oisst.v2.highres/sst.day.mean.", i, ".nc")
#   download.file(url, destfile = name)
#   
#   text <- knitr::knit_expand(text = "test_{{year}} <- nc_to_raster(nc = name, varname = varname)
#                                      raster::writeRaster(test_{{year}}, filename = filename, overwrite=TRUE)",
#                              year = i)
#   print(text)
#   try(eval(parse(text = text)))
#   unlink(name) # remove nc file to save space
#   print(paste("finished",i))
# }
# 
# 
# # convert raster to dataframe
# #years <- 2022
# for(i in years) {
#   name <- get(paste0("test_",i))
#   filename <- here::here("data-raw","gridded", "sst_data", paste0("sst", i, ".rds"))
#   text <- knitr::knit_expand(text = "sst{{year}} <- raster_to_sstdf(brick = name)
#                                      saveRDS(sst{{year}}, filename)",
#                              year = i)
#   print(text)
#   try(eval(parse(text = text)))
#}
#read in diet data with month day fields

herringfood_stn_all <- readRDS(here("data/herringfood_stn_all.rds"))

stations <- herringfood_stn_all %>%
  dplyr::mutate(day = str_pad(day, 2, pad='0'),
                month = str_pad(month, 2, pad='0'),
                yrmody = as.numeric(paste0(year, month, day))) %>%
  dplyr::select(stationid, lon, lat, year, yrmody) %>%
  na.omit() %>%
  sf::st_as_sf(coords=c("lon","lat"), crs=4326, remove=FALSE) 


# here can't go back a level so hardcode to get to forageindex folders
#d.name <- "/Users/sarahgaichas/Documents/Work/forageindex/data-raw/gridded/sst_data/"
d.name <- "/Users/sarah.gaichas/Documents/0_Data/forageindex/data-raw/gridded/sst_data/"

#list of SST dataframes
#SSTdfs <- list.files(here("data-raw/gridded/sst_data/"), pattern = "*.rds")

SSTdfs <- list.files(d.name, pattern = "*.rds")


zoopstn_OISST <- tibble()


for(df in SSTdfs){
  #sstdf <- readRDS(paste0(here("data-raw/gridded/sst_data/", df)))
  sstdf <- readRDS(paste0(d.name, df))
  
  # keep only zooplankton dates in SST year
  stationsyr <- stations %>%
    filter(year == unique(sstdf$year))
  
  # keep only sst days in zooplankton dataset
  sstdf_survdays <- sstdf %>%
    dplyr::mutate(yrmody = as.numeric(paste0(year, month, day)) )%>%
    dplyr::filter(yrmody %in% unique(stationsyr$yrmody)) %>%
    dplyr::mutate(year = as.numeric(year),
                  month = as.numeric(month),
                  day = as.numeric(day),
                  lon = Lon,
                  lat = Lat) %>%
    dplyr::select(-Lon, -Lat) %>%
    sf::st_as_sf(coords=c("lon","lat"), crs=4326, remove=FALSE)  
  
  # now join by nearest neighbor and date
  
  #https://stackoverflow.com/questions/71959927/spatial-join-two-data-frames-by-nearest-feature-and-date-in-r      
  
  yrzoopOISST <- do.call('rbind', lapply(split(stationsyr, 1:nrow(stationsyr)), function(x) {
    sf::st_join(x, sstdf_survdays[sstdf_survdays$yrmody == unique(x$yrmody),],
                #join = st_nearest_feature
                join = st_nn, k = 1, progress = FALSE
    )
  }))
  
  #   #datatable solution--works but doesnt seem faster?
  #    df1 <- data.table(stationsyr)
  #   
  #  .nearest_samedate <- function(x) {
  #    st_join(st_as_sf(x), sstdf_survdays[sstdf_survdays$yrmody == unique(x$yrmody),], join = st_nearest_feature)
  #  }
  # # 
  #  yrdietOISST <- df1[, .nearest_samedate(.SD), by = list(1:nrow(df1))]
  
  zoopstn_OISST <- rbind(zoopstn_OISST, yrzoopOISST)
  
}

#saveRDS(dietstn_OISST, here("data-raw/dietstn_OISST.rds"))

# Now join with OISST dataset

#bluepyagg_stn_all <- readRDS(here("fhdat/bluepyagg_stn_all.rds"))
#dietstn_OISST <- readRDS(here("data-raw/dietstn_OISST.rds"))


zoopstn_OISST_merge <- zoopstn_OISST %>%
  dplyr::rename(lon = lon.x,
                lat = lat.x,
                year = year.x,
                oisst = sst) %>%
  dplyr::select(stationid, oisst) %>%
  sf::st_drop_geometry()

herringfood_stn_all_OISST <- left_join(herringfood_stn_all, zoopstn_OISST_merge)

# June 21 2024
# join finds duplicate stationid for cruise DE1012 station 109, Nov 19 2010 at 1600 and 1720
# similarly HB1205 station 25 Aug 9 2012 at 19:31 and 20:04
# and PC2104 stn 122 Aug 17 2921 at 11:35, only difference here is zoop data
# and PC2106 stn 88 Oct 25 2021 at 12:11, only difference here is zoop data

# the OISST applied is the same so get rid of duplicate rows

herringfood_stn_all_OISST <- dplyr::distinct(herringfood_stn_all_OISST)

saveRDS(herringfood_stn_all_OISST, here("data/herringfood_stn_all_OISST.rds"))

