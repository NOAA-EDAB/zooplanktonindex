# Run WHAM with covariates
# For Atlantic herring RTWG
# September 2024

library(tidyverse)
library(here)
library(wham)

# Small copepods July-December (Fall) index options

## Setup

config <- "smcopeFall2"

# name the model directory
name <- paste0("mm192_", config)

write.dir <- here::here(sprintf("WHAMfits/%s/", name))

if(!dir.exists(write.dir)) {
  dir.create(write.dir)
}

mm192mod <- readRDS(here::here("WHAMfits/mm192/mm192_meanrecpar.rds"))

input <- mm192mod$input

# larger set of ecov setups to compare
df.mods <- data.frame(Recruitment = c(rep(2, 16)),
                      ecov_process = c(rep("rw",8),rep("ar1",8)),
                      ecov_how = c(rep("none",4), 
                                   rep("controlling-lag-1-linear",4)),
                      ecovdat = rep(c("logmean-logsig", 
                                      "logmean-est_1",
                                      "meanmil-logsigmil",
                                      "meanmil-est_1"),4),
                      stringsAsFactors=FALSE)
n.mods <- dim(df.mods)[1]
df.mods$Model <- paste0("m",1:n.mods)
df.mods <- dplyr::select(df.mods, Model, tidyselect::everything()) # moves Model to first col


## Read environmental index

env.dat <- read.csv(here::here("WHAMfits/fallsmallcopeALLindex.csv"), header=T)

# 2020 is missing
env.dat[env.dat == 0] <- NA

# don't use the NA value
use.obs <- matrix(1, ncol=1, nrow=dim(env.dat)[1])
use.obs[39,] <- 0


## Run model

for(m in 1:n.mods){
  
  ecovdat <- dplyr::case_when(df.mods$ecovdat[m] %in% c("logmean-logsig", "logmean-est_1") ~
                                as.matrix(log(env.dat$her_fa_Estimate)),
                              TRUE ~as.matrix(env.dat$her_fa_Estimate/1000000))
  
  ecovsig <- if(df.mods$ecovdat[m] %in% c("logmean-logsig")){
    as.matrix(log(env.dat$her_fa_SE))
  }else if(df.mods$ecovdat[m] %in% c("meanmil-logsigmil")){
    as.matrix(log(env.dat$her_fa_SE/1000000))
  }else{"est_1"}
  
  ecov <- list(
    label = "smCopeFall2",
    mean = ecovdat,
    logsigma = ecovsig, 
    year = env.dat$Time,
    use_obs =  use.obs, #matrix(1, ncol=1, nrow=dim(env.dat)[1]), # use all obs (all = 1)
    process_model = df.mods$ecov_process[m],  # "rw" or "ar1"
    recruitment_how = as.matrix(df.mods$ecov_how[m])
  ) 
  
  ecovinput <- set_ecov(input, ecov=ecov)
  
  mod <- fit_wham(ecovinput, do.osa = T)
  
  # Save model
  saveRDS(mod, file.path(write.dir, paste0(df.mods$Model[m],".rds")))
  
  # Plot output in new subfolder
  plot_wham_output(mod=mod, dir.main=file.path(write.dir,df.mods$Model[m]), out.type='html')
  
}


