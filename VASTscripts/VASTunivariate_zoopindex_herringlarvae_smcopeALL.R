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
  dplyr::mutate(sstfill = ifelse((is.na(sfc_temp)|sfc_temp==0), oisst, sfc_temp),
                season_larv = month %in% c(1:2, 9:12))


########################################################################
# herring larvae for comparisons with small copeopods

herringlarvae_stn_sepfeb <- herringfood_stn %>%
  #ungroup() %>%
  dplyr::filter(season_larv == TRUE) %>%
  dplyr::mutate(AreaSwept_km2 = 1, #Elizabeth's code
         #declon = -declon already done before neamap merge
         Vessel = 1,
         Dayofyear = lubridate::yday(date),
         yearshift = ifelse(month < 3, year-1, year)#as.numeric(as.factor(vessel))-1
  ) %>% 
  dplyr::filter(yearshift>1981) |>
  dplyr::select(Catch_g = cluhar_100m3, #use megabenwt for individuals input in example
                Year = yearshift,
                Month = month,
                Dayofyear,
                Vessel,
                AreaSwept_km2,
                Lat = lat,
                Lon = lon,
                #btm_temp, #this leaves out many stations
                #sfc_temp, #this leaves out many stations
                #oisst,
                sstfill
  ) %>%
  na.omit() %>%
  as.data.frame()

smallcopeALL_stn_sepfeb <- herringfood_stn %>%
  #ungroup() %>%
  dplyr::filter(season_larv == TRUE) %>%
  dplyr::mutate(AreaSwept_km2 = 1, #Elizabeth's code
                #declon = -declon already done before neamap merge
                Vessel = 1,
                Dayofyear = lubridate::yday(date),
                yearshift = ifelse(month < 3, year-1, year)#as.numeric(as.factor(vessel))-1
  ) %>% 
  dplyr::filter(yearshift>1981) |>
  dplyr::select(Catch_g = smallcopeALL_100m3, #use megabenwt for individuals input in example
                Year = yearshift,
                Month = month,
                Dayofyear,
                Vessel,
                AreaSwept_km2,
                Lat = lat,
                Lon = lon,
                #btm_temp, #this leaves out many stations
                #sfc_temp, #this leaves out many stations
                #oisst,
                sstfill
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

# Try setting Omega1 to 0
#FieldConfig[1,1] <- 0

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

mod.season <- c("herringlarvae_sepfeb_yrshift_500", "smallcopeALL_sepfeb_yrshift_500") #includes n knots

mod.dat <- list(herringlarvae_stn_sepfeb, smallcopeALL_stn_sepfeb)

names(mod.dat) <- mod.season

mod.obsmod <- list(ObsModel1, ObsModel2)

names(mod.obsmod) <- mod.season


#########################################################
# Run bias corrected models

for(season in mod.season){
  
  season <- season 
  
  dat <- mod.dat[[season]]
  
  for(config in c("biascorrect")) {
    
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
      #Q_ik = as.matrix(dat[,c("npiscsp", 
      #                                       "meanpisclen", 
      #                                       "sstfill"
      #                                      )]),
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
