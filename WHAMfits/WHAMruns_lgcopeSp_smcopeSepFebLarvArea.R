# Run WHAM with covariates
# For Atlantic herring RTWG
# September 2024

library(tidyverse)
library(here)
library(wham)

# Large copepods Jan-June (Spring) index options

## Setup

config <- "lgcopeSpring_smcopeSepFeb"

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
                      ecov_how = c(rep("none" ,4), 
                                   rep("controlling-lag-0-linear",4)),
                      ecovdat = rep(c("logmean-logsig", 
                                      "logmean-est_1",
                                      "meanmil-logsigmil",
                                      "meanmil-est_1"),4),
                      stringsAsFactors=FALSE)
n.mods <- dim(df.mods)[1]
df.mods$Model <- paste0("m",1:n.mods)
df.mods <- dplyr::select(df.mods, Model, tidyselect::everything()) # moves Model to first col

# make smaller
df.mods <- data.frame(Recruitment = c(rep(2, 4)),
                      ecov_process = c(rep(c("rw","ar"),2)),
                      ecov_how = c(rep("none" ,2), 
                                   rep("controlling-lag-0-linear",2)),
                      ecovdat = rep("logmean-est_1",4),
                      stringsAsFactors=FALSE)
n.mods <- dim(df.mods)[1]
df.mods$Model <- paste0("m",1:n.mods)
df.mods <- dplyr::select(df.mods, Model, tidyselect::everything()) # moves Model to first col


## Read environmental indices

lgcope.dat <- read.csv(here::here("WHAMfits/springlargecopeindex.csv"), header=T)

smcope.dat <- read.csv(here::here("WHAMfits/sepfebsmallcopeALLlarvareaindex.csv"), header=T)

# 2020 is missing for fall small copepods
smcope.dat[smcope.dat == 0] <- NA

# don't use the NA value
use.obs <- matrix(1, ncol=1, nrow=dim(smcope.dat)[1])
use.obs[39,] <- 0


## Run model

for(m in 1:n.mods){
  
  lgcopedat <- dplyr::case_when(df.mods$ecovdat[m] %in% c("logmean-logsig", "logmean-est_1") ~
                                as.matrix(log(lgcope.dat$her_sp_Estimate)),
                              TRUE ~as.matrix(lgcope.dat$her_sp_Estimate/1000000))
  
  lgcopesig <- if(df.mods$ecovdat[m] %in% c("logmean-logsig")){
    as.matrix(log(lgcope.dat$her_sp_SE))
  }else if(df.mods$ecovdat[m] %in% c("meanmil-logsigmil")){
    as.matrix(log(lgcope.dat$her_sp_SE/1000000))
  }else{"est_1"}
  
  smcopedat <- dplyr::case_when(df.mods$ecovdat[m] %in% c("logmean-logsig", "logmean-est_1") ~
                                  as.matrix(log(smcope.dat$her_larv_Estimate)),
                                TRUE ~as.matrix(smcope.dat$her_larv_Estimate/1000000))
  
  smcopesig <- if(df.mods$ecovdat[m] %in% c("logmean-logsig")){
    as.matrix(log(smcope.dat$her_larv_SE))
  }else if(df.mods$ecovdat[m] %in% c("meanmil-logsigmil")){
    as.matrix(log(smcope.dat$her_larv_SE/1000000))
  }else{"est_1"}
  
  smcopehow <- ifelse(df.mods$ecov_how[m]=="controlling-lag-0-linear", #lgcope
                      "controlling-lag-1-linear", #if yes
                      "none") #if no
  
  
  ecov <- list(
    label = c("lgCopeSpring2", "smCopeSepFeb2"),
    mean = cbind(lgcopedat, smcopedat),
    logsigma = cbind(lgcopesig, smcopesig), 
    year = lgcope.dat$Time,
    use_obs =  cbind(matrix(1, ncol=1, nrow=dim(lgcope.dat)[1]), use.obs), # use all obs (all = 1)
    process_model = c(df.mods$ecov_process[m], df.mods$ecov_process[m]), # "rw" or "ar1"
    recruitment_how = rbind(as.matrix(df.mods$ecov_how[m]), as.matrix(smcopehow))
  ) 
  
  ecovinput <- set_ecov(input, ecov=ecov)
  
  mod <- fit_wham(ecovinput, do.osa = T)
  
  # Save model
  saveRDS(mod, file.path(write.dir, paste0(df.mods$Model[m],".rds")))
  
  # Plot output in new subfolder
  plot_wham_output(mod=mod, dir.main=file.path(write.dir,df.mods$Model[m]), out.type='html')
  
}

## Try just running a model with both turned off and both turned on, log scale and est_1
## having issues getting the correct class of objects in this loop

#1: rw none logmean-est1 both
#2: ar1 none logmean-est1 both

#3: rw controlling-lag-0-linear and controlling-lag-1-linear logmean-est1 both
#4: ar1 controlling-lag-0-linear and controlling-lag-1-linear logmean-est1 both

ecov1 <- list(
  label = c("lgCopeSpring2", "smCopeSepFeb2"),
  mean = cbind(as.matrix(log(lgcope.dat$her_sp_Estimate)), 
               as.matrix(log(smcope.dat$her_larv_Estimate))),
  logsigma = c("est_1", "est_1"), 
  year = lgcope.dat$Time,
  use_obs =  cbind(matrix(1, ncol=1, nrow=dim(lgcope.dat)[1]), use.obs), # use all obs (all = 1)
  process_model = c("rw","rw"), # "rw" or "ar1"
  recruitment_how = rbind(as.matrix("none"), as.matrix("none"))
) 

ecov2 <- list(
  label = c("lgCopeSpring2", "smCopeSepFeb2"),
  mean = cbind(as.matrix(log(lgcope.dat$her_sp_Estimate)), 
               as.matrix(log(smcope.dat$her_larv_Estimate))),
  logsigma = c("est_1", "est_1"), 
  year = lgcope.dat$Time,
  use_obs =  cbind(matrix(1, ncol=1, nrow=dim(lgcope.dat)[1]), use.obs), # use all obs (all = 1)
  process_model = c("ar1","ar1"), # "rw" or "ar1"
  recruitment_how = rbind(as.matrix("none"), as.matrix("none"))
) 

ecov3 <- list(
  label = c("lgCopeSpring2", "smCopeSepFeb2"),
  mean = cbind(as.matrix(log(lgcope.dat$her_sp_Estimate)), 
               as.matrix(log(smcope.dat$her_larv_Estimate))),
  logsigma = c("est_1", "est_1"), 
  year = lgcope.dat$Time,
  use_obs =  cbind(matrix(1, ncol=1, nrow=dim(lgcope.dat)[1]), use.obs), # use all obs (all = 1)
  process_model = c("rw","rw"), # "rw" or "ar1"
  recruitment_how = rbind(as.matrix("controlling-lag-0-linear"), as.matrix("controlling-lag-1-linear"))
) 

ecov4 <- list(
  label = c("lgCopeSpring2", "smCopeSepFeb2"),
  mean = cbind(as.matrix(log(lgcope.dat$her_sp_Estimate)), 
               as.matrix(log(smcope.dat$her_larv_Estimate))),
  logsigma = c("est_1", "est_1"), 
  year = lgcope.dat$Time,
  use_obs =  cbind(matrix(1, ncol=1, nrow=dim(lgcope.dat)[1]), use.obs), # use all obs (all = 1)
  process_model = c("ar1","ar1"), # "rw" or "ar1"
  recruitment_how = rbind(as.matrix("controlling-lag-0-linear"), as.matrix("controlling-lag-1-linear"))
)

# run mod 1
ecovinput <- set_ecov(input, ecov=ecov1)

mod <- fit_wham(ecovinput, do.osa = T)

saveRDS(mod, file.path(write.dir, "m1.rds"))

plot_wham_output(mod=mod, dir.main=file.path(write.dir,"m1"), out.type='html')

# run mod 2
ecovinput <- set_ecov(input, ecov=ecov2)

mod <- fit_wham(ecovinput, do.osa = T)

saveRDS(mod, file.path(write.dir, "m2.rds"))

plot_wham_output(mod=mod, dir.main=file.path(write.dir,"m2"), out.type='html')

# run mod 3
ecovinput <- set_ecov(input, ecov=ecov3)

mod <- fit_wham(ecovinput, do.osa = T)

saveRDS(mod, file.path(write.dir, "m3.rds"))

plot_wham_output(mod=mod, dir.main=file.path(write.dir,"m3"), out.type='html')

# run mod 4
ecovinput <- set_ecov(input, ecov=ecov4)

mod <- fit_wham(ecovinput, do.osa = T)

saveRDS(mod, file.path(write.dir, "m4.rds"))

plot_wham_output(mod=mod, dir.main=file.path(write.dir,"m4"), out.type='html')
