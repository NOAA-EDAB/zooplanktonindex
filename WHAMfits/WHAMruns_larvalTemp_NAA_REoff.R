# Run WHAM with covariates
# For Atlantic herring RTWG
# October 2024

library(tidyverse)
library(here)
library(wham)

# Duration of larval temperature in fall

## Setup

config <- "LarvalTempDuration_NAA_REoff"

# name the model directory
name <- paste0("mm192_", config)

write.dir <- here::here(sprintf("WHAMfits/%s/", name))

if(!dir.exists(write.dir)) {
  dir.create(write.dir)
}

mm192mod <- readRDS(here::here("WHAMfits/mm192_nonaa/mm192_nonaa.rds"))

input <- mm192mod$input


# larger set of ecov setups to compare
df.mods <- data.frame(Recruitment = c(rep(2, 8)),
                      ecov_process = c(rep("rw",4),rep("ar1",4)),
                      ecov_how = rep(c("none","controlling-lag-1-linear"), 4),
                      ecovdat = c(rep("mean-est_1", 2),rep("logmean-est_1",2)),
                      stringsAsFactors=FALSE)
n.mods <- dim(df.mods)[1]
df.mods$Model <- paste0("m",1:n.mods)
df.mods <- dplyr::select(df.mods, Model, tidyselect::everything()) # moves Model to first col



## Read environmental index

env.dat <- read.csv(here::here("WHAMfits/Duration.Optimal.SST.Sept-Dec.csv"), header=T)


## Run model

for(m in 1:n.mods){
  
  ecovdat <- dplyr::case_when(df.mods$ecovdat[m] %in% c("logmean-est_1") ~
                                as.matrix(log(env.dat$duration)),
                              TRUE ~as.matrix(env.dat$duration))
  
  ecov <- list(
    label = "LarvalTempDuration",
    mean = ecovdat,
    logsigma = "est_1", 
    year = env.dat$year,
    use_obs =  matrix(1, ncol=1, nrow=dim(env.dat)[1]), # use all obs (all = 1)
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
