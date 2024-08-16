# VAST attempt 2 univariate model selection as a script
# modified from https://github.com/James-Thorson-NOAA/VAST/wiki/Index-standardization

# Load packages
library(here)
library(dplyr)
library(VAST)

#Read in data, separate species, annual, spring and fall, and rename columns for VAST:

# this dataset created in VASTzoopindex_processinputs.R

herringfood_stn <- readRDS(here::here("data/herringfood_stn_all_OISST.rds"))

# make SST column that uses surftemp unless missing or 0

herringfood_stn <- herringfood_stn %>%
  dplyr::mutate(sstfill = ifelse((is.na(sfc_temp)|sfc_temp==0), oisst, sfc_temp))

##################################################################################
# calfin model inputs

calfin_stn_ann <- herringfood_stn %>%
  #ungroup() %>%
  filter(#season_ng == "FALL", # Annual model for MRIP index
    year > 1981) %>%
  mutate(AreaSwept_km2 = 1, #Elizabeth's code
         #declon = -declon already done before neamap merge
         Vessel = 1,
         Dayofyear = lubridate::yday(date) #as.numeric(as.factor(vessel))-1
  ) %>% 
  dplyr::select(Catch_g = calfin_100m3, #use megabenwt for individuals input in example
                Year = year,
                Vessel,
                AreaSwept_km2,
                Lat = lat,
                Lon = lon,
                #btm_temp, #this leaves out many stations
                #sfc_temp, #this leaves out many stations
                #oisst,
                sstfill,
                Dayofyear
  ) %>%
  na.omit() %>%
  as.data.frame()


calfin_stn_fall <- herringfood_stn %>%
  #ungroup() %>%
  filter(season_ng == "FALL", 
         year > 1981) %>%
  mutate(AreaSwept_km2 = 1, #Elizabeth's code
         #declon = -declon already done before neamap merge
         Vessel = 1,
         Dayofyear = lubridate::yday(date) #as.numeric(as.factor(vessel))-1
  ) %>% 
  dplyr::select(Catch_g = calfin_100m3, #use megabenwt for individuals input in example
                Year = year,
                Vessel,
                AreaSwept_km2,
                Lat = lat,
                Lon = lon,
                #btm_temp, #this leaves out many stations
                #sfc_temp, #this leaves out many stations
                #oisst,
                sstfill,
                Dayofyear
  ) %>%
  na.omit() %>%
  as.data.frame()

calfin_stn_spring <- herringfood_stn %>%
  #ungroup() %>%
  filter(season_ng == "SPRING", 
         year > 1981) %>%
  mutate(AreaSwept_km2 = 1, #Elizabeth's code
         #declon = -declon already done before neamap merge
         Vessel = 1,
         Dayofyear = lubridate::yday(date) #as.numeric(as.factor(vessel))-1
  ) %>% 
  dplyr::select(Catch_g = calfin_100m3, #use megabenwt for individuals input in example
                Year = year,
                Vessel,
                AreaSwept_km2,
                Lat = lat,
                Lon = lon,
                #btm_temp, #this leaves out many stations
                #sfc_temp, #this leaves out many stations
                #oisst,
                sstfill,
                Dayofyear
  ) %>%
  na.omit() %>%
  as.data.frame()

#######################################################################
# Large copepod model inputs
# (calfin_100m3, mlucens_100m3, calminor_100m3, euc_100m3, calspp_100m3)

lgcopeALL_stn_ann <- herringfood_stn %>%
  #ungroup() %>%
  filter(#season_ng == "FALL", # Annual model for MRIP index
    year > 1981) %>%
  mutate(AreaSwept_km2 = 1, #Elizabeth's code
         #declon = -declon already done before neamap merge
         Vessel = 1,
         Dayofyear = lubridate::yday(date) #as.numeric(as.factor(vessel))-1
  ) %>% 
  dplyr::select(Catch_g = lgcopeALL_100m3, #use megabenwt for individuals input in example
                Year = year,
                Vessel,
                AreaSwept_km2,
                Lat = lat,
                Lon = lon,
                #btm_temp, #this leaves out many stations
                #sfc_temp, #this leaves out many stations
                #oisst,
                sstfill,
                Dayofyear
  ) %>%
  na.omit() %>%
  as.data.frame()


lgcopeALL_stn_fall <- herringfood_stn %>%
  #ungroup() %>%
  filter(season_ng == "FALL", 
         year > 1981) %>%
  mutate(AreaSwept_km2 = 1, #Elizabeth's code
         #declon = -declon already done before neamap merge
         Vessel = 1,
         Dayofyear = lubridate::yday(date) #as.numeric(as.factor(vessel))-1
  ) %>% 
  dplyr::select(Catch_g = lgcopeALL_100m3, #use megabenwt for individuals input in example
                Year = year,
                Vessel,
                AreaSwept_km2,
                Lat = lat,
                Lon = lon,
                #btm_temp, #this leaves out many stations
                #sfc_temp, #this leaves out many stations
                #oisst,
                sstfill,
                Dayofyear
  ) %>%
  na.omit() %>%
  as.data.frame()

lgcopeALL_stn_spring <- herringfood_stn %>%
  #ungroup() %>%
  filter(season_ng == "SPRING", 
         year > 1981) %>%
  mutate(AreaSwept_km2 = 1, #Elizabeth's code
         #declon = -declon already done before neamap merge
         Vessel = 1,
         Dayofyear = lubridate::yday(date) #as.numeric(as.factor(vessel))-1
  ) %>% 
  dplyr::select(Catch_g = lgcopeALL_100m3, #use megabenwt for individuals input in example
                Year = year,
                Vessel,
                AreaSwept_km2,
                Lat = lat,
                Lon = lon,
                #btm_temp, #this leaves out many stations
                #sfc_temp, #this leaves out many stations
                #oisst,
                sstfill,
                Dayofyear
  ) %>%
  na.omit() %>%
  as.data.frame()


########################################################################
# Small copepod model inputs: full list
# (ctyp_100m3, pseudo_100m3, tlong_100m3, cham_100m3, para_100m3, acarspp_100m3, clauso,
# acarlong_100m3, fur_100m3, ost_100m3, temspp_100m3, tort_100m3, paraspp_100m3)

smallcopeALL_stn_ann <- herringfood_stn %>%
  #ungroup() %>%
  filter(#season_ng == "FALL", # Annual model for MRIP index
    year > 1981) %>%
  mutate(AreaSwept_km2 = 1, #Elizabeth's code
         #declon = -declon already done before neamap merge
         Vessel = 1,
         Dayofyear = lubridate::yday(date) #as.numeric(as.factor(vessel))-1
  ) %>% 
  dplyr::select(Catch_g = smallcopeALL_100m3, #use megabenwt for individuals input in example
                Year = year,
                Vessel,
                AreaSwept_km2,
                Lat = lat,
                Lon = lon,
                #btm_temp, #this leaves out many stations
                #sfc_temp, #this leaves out many stations
                #oisst,
                sstfill,
                Dayofyear
  ) %>%
  na.omit() %>%
  as.data.frame()


smallcopeALL_stn_fall <- herringfood_stn %>%
  #ungroup() %>%
  filter(season_ng == "FALL", 
         year > 1981) %>%
  mutate(AreaSwept_km2 = 1, #Elizabeth's code
         #declon = -declon already done before neamap merge
         Vessel = 1,
         Dayofyear = lubridate::yday(date) #as.numeric(as.factor(vessel))-1
  ) %>% 
  dplyr::select(Catch_g = smallcopeALL_100m3, #use megabenwt for individuals input in example
                Year = year,
                Vessel,
                AreaSwept_km2,
                Lat = lat,
                Lon = lon,
                #btm_temp, #this leaves out many stations
                #sfc_temp, #this leaves out many stations
                #oisst,
                sstfill,
                Dayofyear
  ) %>%
  na.omit() %>%
  as.data.frame()

smallcopeALL_stn_spring <- herringfood_stn %>%
  #ungroup() %>%
  filter(season_ng == "SPRING", 
         year > 1981) %>%
  mutate(AreaSwept_km2 = 1, #Elizabeth's code
         #declon = -declon already done before neamap merge
         Vessel = 1,
         Dayofyear = lubridate::yday(date) #as.numeric(as.factor(vessel))-1
  ) %>% 
  dplyr::select(Catch_g = smallcopeALL_100m3, #use megabenwt for individuals input in example
                Year = year,
                Vessel,
                AreaSwept_km2,
                Lat = lat,
                Lon = lon,
                #btm_temp, #this leaves out many stations
                #sfc_temp, #this leaves out many stations
                #oisst,
                sstfill,
                Dayofyear
  ) %>%
  na.omit() %>%
  as.data.frame()

###########################################################################
# small copeopods shortlist SOE: (ctyp_100m3, pseudo_100m3, tlong_100m3, cham_100m3)

smallcopeSOE_stn_ann <- herringfood_stn %>%
  #ungroup() %>%
  filter(#season_ng == "FSOE", # Annual model for MRIP index
    year > 1981) %>%
  mutate(AreaSwept_km2 = 1, #Elizabeth's code
         #declon = -declon already done before neamap merge
         Vessel = 1,
         Dayofyear = lubridate::yday(date) #as.numeric(as.factor(vessel))-1
  ) %>% 
  dplyr::select(Catch_g = smallcopeSOE_100m3, #use megabenwt for individuals input in example
                Year = year,
                Vessel,
                AreaSwept_km2,
                Lat = lat,
                Lon = lon,
                #btm_temp, #this leaves out many stations
                #sfc_temp, #this leaves out many stations
                #oisst,
                sstfill,
                Dayofyear
  ) %>%
  na.omit() %>%
  as.data.frame()


smallcopeSOE_stn_fall <- herringfood_stn %>%
  #ungroup() %>%
  filter(season_ng == "FALL", 
         year > 1981) %>%
  mutate(AreaSwept_km2 = 1, #Elizabeth's code
         #declon = -declon already done before neamap merge
         Vessel = 1,
         Dayofyear = lubridate::yday(date) #as.numeric(as.factor(vessel))-1
  ) %>% 
  dplyr::select(Catch_g = smallcopeSOE_100m3, #use megabenwt for individuals input in example
                Year = year,
                Vessel,
                AreaSwept_km2,
                Lat = lat,
                Lon = lon,
                #btm_temp, #this leaves out many stations
                #sfc_temp, #this leaves out many stations
                #oisst,
                sstfill,
                Dayofyear
  ) %>%
  na.omit() %>%
  as.data.frame()

smallcopeSOE_stn_spring <- herringfood_stn %>%
  #ungroup() %>%
  filter(season_ng == "SPRING", 
         year > 1981) %>%
  mutate(AreaSwept_km2 = 1, #Elizabeth's code
         #declon = -declon already done before neamap merge
         Vessel = 1,
         Dayofyear = lubridate::yday(date) #as.numeric(as.factor(vessel))-1
  ) %>% 
  dplyr::select(Catch_g = smallcopeSOE_100m3, #use megabenwt for individuals input in example
                Year = year,
                Vessel,
                AreaSwept_km2,
                Lat = lat,
                Lon = lon,
                #btm_temp, #this leaves out many stations
                #sfc_temp, #this leaves out many stations
                #oisst,
                sstfill,
                Dayofyear
  ) %>%
  na.omit() %>%
  as.data.frame()

############################################################################
# Make settings (turning off bias.correct to save time for example)
# NEFSC strata limits https://github.com/James-Thorson-NOAA/VAST/issues/302

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


#####################################################################################
# Link distribution

# default for index2: works for calfin and lgcopeALL
ObsModel1  <-  c(2,1) # this is "Index2", Gamma distribution for positive catches and Alternative "Poisson-link delta-model" using log-link for numbers-density and log-link for biomass per number

# alternative for models where we encounter stuff everywhere (zooplankton volume, maybe small copepods)
ObsModel2  <-  c(2,4) # should be Gamma distribution for positive catches and Poisson-link fixing encounter probability=1 for any year where all samples encounter the species

# Model selection 1 (spatial, spatio-temporal effects, no covariates) options and naming:
# selected _alleffectson for all seasons and copeopod groups
# Season_knots + suffix below
# _alleffectson             FieldConfig default (all IID)

# default configs
FieldConfig = matrix( "IID", ncol=2, nrow=3, 
                      dimnames=list(c("Omega","Epsilon","Beta"),c("Component_1","Component_2")))

RhoConfig <- c(
  "Beta1" = 0,      # temporal structure on years (intercepts) 
  "Beta2" = 0, 
  "Epsilon1" = 0,   # temporal structure on spatio-temporal variation
  "Epsilon2" = 0
) 
# not testing alternative RhoConfigs here just noted for completeness
# 0 off (fixed effects)
# 1 independent
# 2 random walk
# 3 constant among years (fixed effect)
# 4 AR1

use_anisotropy <- TRUE

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


# list of data, settings, and directory for output for each option

mod.season <- c("calfin_fall_500", "calfin_spring_500", "calfin_ann_500",
                "lgcopeALL_fall_500", "lgcopeALL_spring_500", "lgcopeALL_ann_500",
                "smallcopeALL_fall_500", "smallcopeALL_spring_500", "smallcopeALL_ann_500",
                "smallcopeSOE_fall_500", "smallcopeSOE_spring_500", "smallcopeSOE_ann_500") #includes n knots

mod.dat <- list(calfin_stn_fall, calfin_stn_spring, calfin_stn_ann,
                lgcopeALL_stn_fall, lgcopeALL_stn_spring, lgcopeALL_stn_ann,
                smallcopeALL_stn_fall, smallcopeALL_stn_spring, smallcopeALL_stn_ann,
                smallcopeSOE_stn_fall, smallcopeSOE_stn_spring, smallcopeSOE_stn_ann)

names(mod.dat) <- mod.season

mod.obsmod <- list(ObsModel1, ObsModel1, ObsModel1, ObsModel1, ObsModel1, ObsModel1,
                   ObsModel2, ObsModel2, ObsModel2, ObsModel2, ObsModel2, ObsModel2)

names(mod.obsmod) <- mod.season


#########################################################
# Run bias corrected models

for(season in mod.season){
  
  season <- season 
  
  dat <- mod.dat[[season]]
  
  for(config in c("biascorrect_doy")) {
    
    name <- paste0(season,"_", config)
    
    working_dir <- here::here(sprintf("pyindex/%s/", name))
    
    if(!dir.exists(working_dir)) {
      dir.create(working_dir)
    }
    
    ObsModel <- mod.obsmod[[season]]
    
    settings <- make_settings( n_x = 500, 
                               Region = "northwest_atlantic",
                               Version = "VAST_v14_0_1", #needed to prevent error from newer dev version number
                               #strata.limits = list('All_areas' = 1:1e5), full area
                               strata.limits = strata.limits,
                               purpose = "index2", 
                               ObsModel = ObsModel,
                               bias.correct = TRUE,
                               use_anisotropy = use_anisotropy,
                               FieldConfig = FieldConfig,
                               RhoConfig = RhoConfig, #always default
                               OverdispersionConfig = OverdispersionConfig
    )
    
    
    fit <- try(fit_model(
      settings = settings, 
      #extrapolation_list = New_Extrapolation_List,
      Lat_i = dat$Lat, 
      Lon_i = dat$Lon, 
      t_i = dat$Year, 
      b_i = as_units(dat[,'Catch_g'], 'g'),
      a_i = rep(1, nrow(dat)),
      v_i = dat$Vessel,
      Q_ik = as.matrix(dat[,c("Dayofyear" #"npiscsp", 
      #                                       "meanpisclen", 
      #                                       "sstfill"
                                            )]),
      #Use_REML = TRUE,
      test_fit = FALSE,
      working_dir = paste0(working_dir, "/"))
    )
    
    saveRDS(fit, file = paste0(working_dir, "/fit.rds"))
    
    # Plot results
    if(!class(fit)=="try-error"){
      plot( fit,
            working_dir = paste0(working_dir, "/"))
    }
    
  } # end config loop
} # end season loop

#########################################################
# Define covariate combinations
# 
# mod.covar <- c("base", "len", 
#                "num", "lennum", 
#                "bt", "lenbt", 
#                "numbt", "lennumbt",
#                "eta10", "eta11")
# 
# OverdispersionConfig	<- c("eta1"=0, "eta2"=0)
# # eta1 = vessel effects on prey encounter rate
# # eta2 = vessel effects on prey weight
# 
# OverdispersionConfig1 <- c("eta1"=1, "eta2"=0)
# OverdispersionConfig2 <- c("eta1"=1, "eta2"=1)
# 
# mod.eta <- list(OverdispersionConfig, OverdispersionConfig, 
#                 OverdispersionConfig, OverdispersionConfig, 
#                 OverdispersionConfig, OverdispersionConfig, 
#                 OverdispersionConfig, OverdispersionConfig,
#                 OverdispersionConfig1, OverdispersionConfig2)
# 
# names(mod.eta) <- mod.covar
# 
# #########################################################
# # Run model selection 2
# 
# for(season in mod.season){
#   
#   season <- season # c("annual_500_lennosst_ALLsplit")
#   
#   dat <- mod.dat[[season]]
#   
#   Q_ikbase  <-  NULL
#   Q_iklen <- as.matrix(dat[,c("meanbenthivorelen")])
#   Q_iknum <- as.matrix(dat[,c("nbenthivoresp")])
#   Q_iklennum <- as.matrix(dat[,c("meanbenthivorelen", "nbenthivoresp")])
#   Q_ikbt <- as.matrix(dat[,c("btfill")])
#   Q_iklenbt <- as.matrix(dat[,c("meanbenthivorelen", "btfill")])
#   Q_iknumbt <- as.matrix(dat[,c("nbenthivoresp", "btfill")])
#   Q_iklennumbt <- as.matrix(dat[,c("meanbenthivorelen", "nbenthivoresp", "btfill")])
#   
#   mod.Qik <- list(Q_ikbase, Q_iklen, 
#                   Q_iknum, Q_iklennum,
#                   Q_ikbt, Q_iklenbt, 
#                   Q_iknumbt, Q_iklennumbt,
#                   Q_ikbase, Q_ikbase)
#   
#   names(mod.Qik) <- mod.covar
#   
#   for(covar in mod.covar) {
#     
#     name <- paste0(season,"_", covar)
#     
#     working_dir <- here::here(sprintf("pyindex_modsel2/%s/", name))
#     
#     if(!dir.exists(working_dir)) {
#       dir.create(working_dir)
#     }
#     
#     # winners of model selection 1
#     use_anisotropy <- TRUE
#     FieldConfig <- FieldConfig1
#      
#     OverdispersionConfig <- mod.eta[[covar]]
#     Q_ik <- mod.Qik[[covar]]
#     
#     settings <- make_settings( n_x = 500, 
#                                Region = "northwest_atlantic",
#                                Version = "VAST_v14_0_1", #needed to prevent error from newer dev version number
#                                #strata.limits = list('All_areas' = 1:1e5), full area
#                                strata.limits = strata.limits,
#                                purpose = "index2", 
#                                bias.correct = FALSE,
#                                use_anisotropy = use_anisotropy,
#                                FieldConfig = FieldConfig,
#                                RhoConfig = RhoConfig, #always default
#                                OverdispersionConfig = OverdispersionConfig
#     )
#     
#     
#     fit <- fit_model(
#       settings = settings, 
#       #extrapolation_list = New_Extrapolation_List,
#       Lat_i = dat$Lat, 
#       Lon_i = dat$Lon, 
#       t_i = dat$Year, 
#       b_i = as_units(dat[,'Catch_g'], 'g'),
#       a_i = rep(1, nrow(dat)),
#       v_i = dat$Vessel,
#       Q_ik = Q_ik,
#       #Use_REML = TRUE,
#       working_dir = paste0(working_dir, "/"))
#     
#     #saveRDS(fit, file = paste0(working_dir, "/fit.rds"))
#     
#     # Plot results
#     plot( fit,
#           working_dir = paste0(working_dir, "/"))
#     
#   } # end covar loop
# } # end season loop
