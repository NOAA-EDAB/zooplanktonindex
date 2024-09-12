#devtools::install_github("timjmiller/wham", dependencies=TRUE)
devtools::install_github("timjmiller/wham", dependencies=TRUE,ref="devel")
#pak::pkg_install("timjmiller/wham@devel")

library(wham)
library(dplyr)
library(tidyr)
library(ggplot2)
library(purrr)
#source some functions
source("C:\\Herring\\2022 Assessment\\Assessments\\WHAM\\WHAMfxns.R")
#source the hindcast function for MASE etc.
source("C:\\Herring\\2022 Assessment\\Assessments\\WHAM\\hindcast.R")

asapRun9fit=read_asap3_fit(wd="C:/Herring/2022 Assessment/Assessments/ASAP/Run9", asap.name="RUN9")
asapRun9_87fit=read_asap3_fit(wd="C:/Herring/2022 Assessment/Assessments/ASAP/Run9_87",asap.name="Run9_87")


#############Fit two more while estimating Na in year 1 and with rec iid
naa_cor=rep("ar1_a",2)
M_re=c("iid","none")

combos= cbind("naa_cor" = naa_cor, "M_re" = M_re)
n.mods=nrow(combos)
df.mods <- data.frame(Model=paste0("m",167:(167+n.mods-1)), 
                      combos)
rownames(df.mods) <- NULL

for(m in 1:nrow(df.mods)){  #
  if(exists("mod")){rm(mod)}
  mod.dir=df.mods[m,"Model"]
  write.dir <- paste("C:/Herring/2022 Assessment/Assessments/WHAM",mod.dir,sep="/")
  dir.create(write.dir)
  setwd(write.dir)
  asapRun9_87="C:/Herring/2022 Assessment/Assessments/ASAP/Run9_87/Run9_87.DAT"
  file.copy(from=file.path(asapRun9_87), to=write.dir, overwrite=FALSE)
  
  asapRun9dat<- read_asap3_dat("Run9_87.DAT")
  asapRun9dat=CVfxn(asapRun9dat) #empirical CVs
  asapRun9dat=ESSfxn(asapRun9dat,addnumcatch=150,addnumsurv=150)
  
  Input<-prepare_wham_input(asapRun9dat, model_name=df.mods[m,"Model"],recruit_model = 2,NAA_re = list(sigma="rec+1", cor=df.mods[m,"naa_cor"],N1_model=0,decouple_recruitment=TRUE),
                            age_comp = "logistic-normal-ar1-miss0",
                            selectivity = list(fix_pars=list(
                              7:8,2,c(1:2,4:8),1:8,c(1,3:8),NULL,c(1,4:8),NULL)),
                            M=list(re=df.mods[m,"M_re"]),
                            basic_info = list(bias_correct_process = FALSE,bias_correct_observation=FALSE,bias_correct_BRPs=FALSE,
                                              percentSPR=40,percentFXSPR=100,XSPR_R_avg_yrs=6:33,
                                              XSPR_R_opt = 5,simulate_process_error=rep(FALSE,5))) 
  Input$par$logit_selpars[5,3]=Inf #set this Inf i.e., 1
  #Input$map$trans_NAA_rho=as.factor(c(1,NA,2)) #estimate rho for recruitment if you want rec ar1_y
  
  skip=FALSE
  mod <- tryCatch(fit_wham(Input, do.proj=FALSE,proj.opts=list(n.yrs=0,use.last.F=FALSE,use.FXSPR=TRUE,proj_R_opt=1),
                           do.osa = TRUE,do.retro = TRUE,do.check = T),error=function(e){skip=TRUE})
  if(skip){next}
  if(exists("mod")){
    saveRDS(mod,file=file.path(write.dir,paste0(mod.dir,".rds")))
    if(mod$opt$convergence ==0 & mod$na_sdrep==FALSE & !is.na(mod$na_sdrep) & !is.na(mean(mod$osa$residual))) {
      plot_wham_output(mod,out.type="png")
      
      naaplot=plotNAAfxn(mods=mod,cor="NA")
      ggsave("NAAdevs.jpeg",naaplot,path=write.dir)
    }#close if converged
  } #close if exists mod
} #close m loop



##########get OSA stats for a few mods
fourmods=c("m167","m168")
OSAstats=c()
for(m in 1:length(fourmods)){
  mod.dir=fourmods[m]
  write.dir <- paste("C:/Herring/2022 Assessment/Assessments/WHAM",mod.dir,sep="/")
  setwd(write.dir)
  mod <- readRDS(paste0(fourmods[m],".rds"))
  tempstats=getOSAstats(mod)
  tempstats$Model=mod.dir
  OSAstats=rbind(tempstats,OSAstats)
}
Sig_N=OSAstats[(OSAstats$pval_agg < 0.05 | OSAstats$pval_age < 0.05) & !is.na(OSAstats$pval_age),c("Fleet","Model","pval_agg","pval_age")]
HiSD=OSAstats[(OSAstats$OSAsd_age>1 | OSAstats$OSAsd_agg>1) & !is.na(OSAstats$pval_age),c("Fleet","Model","OSAsd_agg","OSAsd_age")]

######MASE
fourmods=c("m167","m168")
mase=c()
for(m in 1:length(fourmods)){
  mod.dir=fourmods[m]
  write.dir <- paste("C:/Herring/2022 Assessment/Assessments/WHAM",mod.dir,sep="/")
  setwd(write.dir)
  mod <- readRDS(paste0(fourmods[m],".rds"))
  tryhindcast=hindcast(model=mod,peel.max=5,horizon=c(1,3),drop=list(indices=5:6, index_paa=5:6))
  mase.temp=tryhindcast$hindcast$mase
  mase.temp$Model=fourmods[m]
  mase=rbind(mase.temp,mase)
}
write.csv(mase, paste("C:\\Herring\\2025 Assessment RT\\WG Meetings Agendas\\26February2024","MASE_rec_iid.csv",sep="/"), row.names=FALSE)

####self-test
# This uses the fitted model to generate simulated timeseries which the
# model then fits itself to. 
# The convergence rate and bias in SSB and F are reported.
# Note: 
# (1) Convergence is classified as first-order convergence only (i.e.
# check_convergence(fit, ret = T))
# (2) Only observation error is simulated due to 
# basic_info = list(simulate_process_error = rep(FALSE, 5)) in the 
# prepare_wham_input() call.
fourmods=c("m167","m168")
for(m in 1:length(fourmods)){
  mod.dir=fourmods[m]
  write.dir <- paste("C:/Herring/2022 Assessment/Assessments/WHAM",mod.dir,sep="/")
  setwd(write.dir)
  mod <- readRDS(paste0(fourmods[m],".rds"))
  set.seed(9273) # For reproducibility (choose your lucky number)
  
  selffits <- do_selftest_cml(mod = mod, 
                              n_sim = 20, # How many simulations to do
                              n_sim2plot = 5, # Plot a couple of examples
                              ".")
  saveRDS(selffits,file=file.path(write.dir,paste0("selftest",mod.dir,".rds")))
  myfig <- make_simtest_pdf(selffits, paste0(mod.dir,"selftest.pdf"))
  
}