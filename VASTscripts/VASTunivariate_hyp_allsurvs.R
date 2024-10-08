# VAST attempt 2 univariate model as a script
# modified from https://github.com/James-Thorson-NOAA/VAST/wiki/Index-standardization

# Load packages
library(here)
library(dplyr)
library(VAST)

#Read in data, separate spring and fall, and rename columns for VAST:

# this dataset created in VASTzoopindex_processinputs.R

herringfood_stn <- readRDS(here::here("data/herringfood_stn_all.rds"))

# make SST column that uses surftemp unless missing or 0

#herringfood_stn <- herringfood_stn %>%
#  dplyr::mutate(sstfill = ifelse((is.na(sfc_temp)|sfc_temp==0), oisst, sfc_temp))

# code Vessel as AL=0, HB=1, NEAMAP=2

herringfood_stn_fall <- herringfood_stn %>%
  #ungroup() %>%
  filter(season_ng == "FALL", # Annual model for MRIP index
         year > 1976) %>%
  mutate(AreaSwept_km2 = 1, #Elizabeth's code
         #declon = -declon already done before neamap merge
         Vessel = 1 #as.numeric(as.factor(vessel))-1
  ) %>% 
  dplyr::select(Catch_g = hyper_100m3, #use megabenwt for individuals input in example
                Year = year,
                Vessel,
                AreaSwept_km2,
                Lat = lat,
                Lon = lon #,
                #btm_temp, #this leaves out many stations
                #sfc_temp, #this leaves out many stations
                #oisst,
                #sstfill
  ) %>%
  na.omit() %>%
  as.data.frame()

herringfood_stn_spring <- herringfood_stn %>%
  #ungroup() %>%
  filter(season_ng == "SPRING", # Annual model for MRIP index
         year > 1976) %>%
  mutate(AreaSwept_km2 = 1, #Elizabeth's code
         #declon = -declon already done before neamap merge
         Vessel = 1 #as.numeric(as.factor(vessel))-1
  ) %>% 
  dplyr::select(Catch_g = hyper_100m3, #use megabenwt for individuals input in example
                Year = year,
                Vessel,
                AreaSwept_km2,
                Lat = lat,
                Lon = lon #,
                #btm_temp, #this leaves out many stations
                #sfc_temp, #this leaves out many stations
                #oisst,
                #sstfill
  ) %>%
  na.omit() %>%
  as.data.frame()


# Make settings (turning off bias.correct to save time for example)
# NEFSC strata limits https://github.com/James-Thorson-NOAA/VAST/issues/302

# use only MAB, GB, GOM, SS EPUs 
# leave out south of Cape Hatteras at Elizabeth's suggestion
# could also leave out SS?
# CHECK if these EPUs match what we use in SOE

herring_spring <- c(01010, 01020, 01030, 01040, 01050, 01060, 01070, 01080, 01090, 
                    01100, 01110, 01120, 01130, 01140, 01150, 01160, 01170, 01180, 
                    01190, 01200, 01210, 01220, 01230, 01240, 01250, 01260, 01270, 
                    01280, 01290, 01300, 01360, 01370, 01380, 01390, 01400, 01610, 
                    01620, 01630, 01640, 01650, 01660, 01670, 01680, 01690, 01700, 
                    01710, 01720, 01730, 01740, 01750, 01760)
herring_fall <- c(01050, 01060, 01070, 01080, 01090, 01100, 01110, 01120, 01130, 
                  01140, 01150, 01160, 01170, 01180, 01190, 01200, 01210, 01220, 
                  01230, 01240, 01250, 01260, 01270, 01280, 01290, 01300, 01360, 
                  01370, 01380, 01390, 01400)

MAB <- c(1010:1080, 1100:1120, 1600:1750, 3010:3450, 3470, 3500, 3510)
GB  <- c(1090, 1130:1210, 1230, 1250, 3460, 3480, 3490, 3520:3550)
GOM <- c(1220, 1240, 1260:1290, 1360:1400, 3560:3830)
SS  <- c(1300:1352, 3840:3990)

# spring herring NEFSC BTS
her_spr <- FishStatsUtils::northwest_atlantic_grid %>% 
  dplyr::filter(stratum_number %in% herring_spring) %>%
  dplyr::select(stratum_number) %>%
  dplyr::distinct()

# fall herring NEFSC BTS
her_fall <- FishStatsUtils::northwest_atlantic_grid %>% 
  dplyr::filter(stratum_number %in% herring_fall) %>%
  dplyr::select(stratum_number) %>%
  dplyr::distinct()

# Mid Atlantic Bight EPU
MAB2 <- FishStatsUtils::northwest_atlantic_grid %>% 
  dplyr::filter(stratum_number %in% MAB) %>%
  dplyr::select(stratum_number) %>%
  dplyr::distinct()

# Georges Bank EPU
GB2 <- FishStatsUtils::northwest_atlantic_grid %>% 
  dplyr::filter(stratum_number %in% GB) %>%
  dplyr::select(stratum_number) %>%
  dplyr::distinct()

# gulf of maine EPU (for SOE)
GOM2 <- FishStatsUtils::northwest_atlantic_grid %>% 
  dplyr::filter(stratum_number %in% GOM) %>%
  dplyr::select(stratum_number) %>%
  dplyr::distinct()

# scotian shelf EPU (for SOE)
SS2 <- FishStatsUtils::northwest_atlantic_grid %>%  
  dplyr::filter(stratum_number %in% SS) %>%
  dplyr::select(stratum_number) %>%
  dplyr::distinct()

# needed to cover the whole northwest atlantic grid--lets try without
# allother2 <- coast3nmbuffst %>%
#   dplyr::filter(!stratum_number %in% c(MAB, GB, GOM, SS)) %>%
#   dplyr::select(stratum_number2) %>%
#   dplyr::distinct()

# all epus
allEPU2 <- FishStatsUtils::northwest_atlantic_grid %>%  
  dplyr::filter(stratum_number %in% c(MAB, GB, GOM, SS)) %>%
  dplyr::select(stratum_number) %>%
  dplyr::distinct()

# configs
# older type, below current, should be functionally the same
# FieldConfig <- c(
#   "Omega1"   = 0,   # number of spatial variation factors (0, 1, AR1)
#   "Epsilon1" = 0,   # number of spatio-temporal factors
#   "Omega2"   = 0, 
#   "Epsilon2" = 0
# ) 

# all random effects are on
FieldConfig <- matrix( "IID", ncol=2, nrow=3, 
                       dimnames=list(c("Omega","Epsilon","Beta"),c("Component_1","Component_2")))


RhoConfig <- c(
  "Beta1" = 0,      # temporal structure on years (intercepts) 
  "Beta2" = 0, 
  "Epsilon1" = 0,   # temporal structure on spatio-temporal variation
  "Epsilon2" = 0
) 
# 0 off (fixed effects)
# 1 independent
# 2 random walk
# 3 constant among years (fixed effect)
# 4 AR1

OverdispersionConfig	<- c("eta1"=0, "eta2"=0)
# eta1 = vessel effects on prey encounter rate
# eta2 = vessel effects on prey weight

strata.limits <- as.list(c("AllEPU" = allEPU2, 
                           "her_sp" = her_spr,
                           "her_fa" = her_fall,
                           "MAB" = MAB2,
                           "GB" = GB2,
                           "GOM" = GOM2,
                           "SS" = SS2 
                           ))

settings = make_settings( n_x = 500, 
                          Region = "northwest_atlantic",
                          #Version = "VAST_v14_0_1", #needed to prevent error from newer dev version number
                          #strata.limits = list('All_areas' = 1:1e5), full area
                          strata.limits = strata.limits,
                          purpose = "index2", 
                          bias.correct = FALSE,
                          use_anisotropy = TRUE,
                          #fine_scale = TRUE,
                          FieldConfig = FieldConfig,
                          RhoConfig = RhoConfig,
                          OverdispersionConfig = OverdispersionConfig
                          )


# select dataset and set directory for output

#########################################################
# Run model fall

season <- c("fall_500_test")

working_dir <- here::here(sprintf("pyindex/hyper_%s/", season))

if(!dir.exists(working_dir)) {
  dir.create(working_dir)
}

fit <- fit_model(
  settings = settings, 
  #extrapolation_list = New_Extrapolation_List,
  Lat_i = herringfood_stn_fall$Lat, 
  Lon_i = herringfood_stn_fall$Lon, 
  t_i = herringfood_stn_fall$Year, 
  b_i = as_units(herringfood_stn_fall[,'Catch_g'], 'g'),
  a_i = rep(1, nrow(herringfood_stn_fall)),
  v_i = herringfood_stn_fall$Vessel,
  #Q_ik = as.matrix(herringfood_stn_fall[,c("meanbenthivorelen", 
  #                                        "nbenthivoresp", 
  #                                        "btfill")]),
  #Use_REML = TRUE,
  working_dir = paste0(working_dir, "/"))

saveRDS(fit, file = paste0(working_dir, "/fit.rds"))

# Plot results
plot( fit,
      working_dir = paste0(working_dir, "/"))

######################################################
# Run model spring

season <- c("spring_500_test")

working_dir <- here::here(sprintf("pyindex/hyper_%s/", season))

if(!dir.exists(working_dir)) {
  dir.create(working_dir)
}                         
  
fit <- fit_model( settings = settings,  
                 #extrapolation_list = New_Extrapolation_List,
                 Lat_i = herringfood_stn_spring[,'Lat'], 
                 Lon_i = herringfood_stn_spring[,'Lon'], 
                 t_i = herringfood_stn_spring[,'Year'], 
                 b_i = as_units(herringfood_stn_spring[,'Catch_g'], 'g'), 
                 a_i = rep(1, nrow(herringfood_stn_spring)),
                 v_i = herringfood_stn_spring$Vessel,
                 #Q_ik = as.matrix(herringfood_stn_spring[,c("meanbenthivorelen", 
                 #                                        "nbenthivoresp", 
                 #                                        "btfill")]),
                 # Use_REML = TRUE,
                 working_dir = paste0(working_dir, "/"))

saveRDS(fit, file = paste0(working_dir, "/fit.rds"))

# Plot results
plot( fit,
      working_dir = paste0(working_dir, "/")) 
