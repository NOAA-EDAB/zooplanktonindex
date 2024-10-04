# Run WHAM with covariates
# For Atlantic herring RTWG
# October 2024

library(tidyverse)
library(here)
library(wham)

# Run with haddock plus temperature

## Setup

config <- "haddock_larvaltempduration"

# name the model directory
name <- paste0("mm192_", config)

write.dir <- here::here(sprintf("WHAMfits/%s/", name))

if(!dir.exists(write.dir)) {
  dir.create(write.dir)
}

mm192mod <- readRDS(here::here("WHAMfits/mm192/mm192_meanrecpar.rds"))

input <- mm192mod$input

# larger set of ecov setups to compare
# larger set of ecov setups to compare
df.mods <- data.frame(Recruitment = c(rep(2, 4)),
                      ecov_process = c(rep("rw",2),rep("ar1",2)),
                      ecov_how = rep(c("none","controlling-lag-1-linear"), 2),
                      ecovdat = rep("logmean-est_1",2),
                      stringsAsFactors=FALSE)
n.mods <- dim(df.mods)[1]
df.mods$Model <- paste0("m",1:n.mods)
df.mods <- dplyr::select(df.mods, Model, tidyselect::everything()) # moves Model to first col


## Read environmental indices

haddock.dat <- read.csv(here::here("WHAMfits/haddock_eat_herring_eggs_index.csv"), header=T)

larvtemp.dat <- read.csv(here::here("WHAMfits/Duration.Optimal.SST.Sept-Dec.csv"), header=T)

# align years by extending larval temp back to haddock start with NAs
# don't align by starting haddock in 1983, WHAM can't fit it with rw for some reason
addyears <- data.frame(year = c(1963:1982),
                       duration = NA)

larvtemp.dat <- dplyr::bind_rows(addyears, larvtemp.dat)

## Run model

for(m in 1:n.mods){
  
  haddockdat <- as.matrix(haddock.dat$log_est)
  
  larvtempdat <- as.matrix(log(larvtemp.dat$duration))
  
  use.obs.hadd = matrix(1, ncol=1, nrow=dim(haddock.dat)[1])
  
  use.obs.temp = matrix(1, ncol=1, nrow=dim(larvtemp.dat)[1])
  use.obs.temp[1:20,] <- 0
    
  ecov <- list(
    label = c("HaddockPred", "LarvalTempDuration"),
    mean = cbind(haddockdat, larvtempdat),
    logsigma = c("est_1", "est_1"),
    year = haddock.dat$YEAR,
    use_obs =  cbind(use.obs.hadd, use.obs.temp), # use all obs (all = 1)
    process_model = c(df.mods$ecov_process[m], df.mods$ecov_process[m]), # "rw" or "ar1"
    recruitment_how = rbind(as.matrix(df.mods$ecov_how[m]), as.matrix(df.mods$ecov_how[m]))
  ) 
  
  ecovinput <- set_ecov(input, ecov=ecov)
  
  mod <- fit_wham(ecovinput, do.osa = T)
  
  # Save model
  saveRDS(mod, file.path(write.dir, paste0(df.mods$Model[m],".rds")))
  
  # Plot output in new subfolder
  plot_wham_output(mod=mod, dir.main=file.path(write.dir,df.mods$Model[m]), out.type='html')
  
}

# #  Test with only haddock rw, why did it break?
# # Works with full time series 
# 
# haddock.dat <- read.csv(here::here("WHAMfits/haddock_eat_herring_eggs_index.csv"), header=T)
# 
# 
# ecovhadd <- list(
#   label = "HaddockPred",
#   mean = as.matrix(haddock.dat$log_est),
#   logsigma = "est_1",
#   year = haddock.dat$YEAR,
#   use_obs =  matrix(1, ncol=1, nrow=dim(haddock.dat)[1]), # use all obs (all = 1)
#   process_model = "rw", # "rw" or "ar1"
#   recruitment_how = as.matrix("none")
# )
# 
# ecovinput <- set_ecov(input, ecov=ecovhadd)
# 
# mod <- fit_wham(ecovinput, do.osa = T)
# 
# saveRDS(mod, file.path(write.dir, "haddonly.rds"))
# 
# plot_wham_output(mod=mod, dir.main=file.path(write.dir,"haddonly"), out.type='html')
# 
# 
# # is it the shorter time series?
# # YES
# haddock.dat <- haddock.dat |>
#   dplyr::filter(YEAR>1982)
# 
# 
# ecovhadd <- list(
#   label = "HaddockPred",
#   mean = as.matrix(haddock.dat$log_est),
#   logsigma = "est_1",
#   year = haddock.dat$YEAR,
#   use_obs =  matrix(1, ncol=1, nrow=dim(haddock.dat)[1]), # use all obs (all = 1)
#   process_model = "rw", # "rw" or "ar1"
#   recruitment_how = as.matrix("none")
# )
# 
# ecovinput <- set_ecov(input, ecov=ecovhadd)
# 
# mod <- fit_wham(ecovinput, do.osa = T)
# 
# saveRDS(mod, file.path(write.dir, "haddonly_1982.rds"))
# 
# plot_wham_output(mod=mod, dir.main=file.path(write.dir,"haddonly_1982"), out.type='html')
# 
