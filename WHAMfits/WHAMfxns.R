############
#plot NAAdevs
plotNAAfxn=function(mods=NULL,cor=NULL){
  library(tidyverse)
  df <- as.data.frame(mods$rep$NAA_devs)
  df$Year <- mods$input$years_full[2:length(mods$input$years_full)] #no devs in year 1
  colnames(df) <- c(paste0("Age_",1:(mods$input$data$n_ages)),"Year")
  df$Model <- mods$model_name
  df$NAA_mod = mods$model_name
  df$NAA_cor = cor
  #df.NAA <- rbind(df.NAA, df)
  
  df.new <- df %>% tidyr::pivot_longer(-c(Year,Model,NAA_mod,NAA_cor),
                                       names_to = "Age",
                                       names_prefix = "Age_",
                                       names_transform = list(Age = as.integer),
                                       values_to = "NAA_Dev")
  #df.new$Age <- as.integer(df$Age)
  #df.new$NAA_cor <- factor(df$NAA_cor, levels=c("IID","AR1_year","AR1_age","2D_AR1"))
  #df.new$NAA_mod <- factor(df$NAA_mod, levels=c("Model 8","Model 11","Model 12","Model 13"))
  naadevplot=ggplot(df.new, aes(x=Year, y=Age)) +
    geom_tile(aes(fill=NAA_Dev)) +
    #facet_wrap(~ NAA_cor) +
    scale_y_continuous(breaks=seq(1,10,by=1)) +
    #scale_fill_viridis_c() +
    #coord_equal() + 
    scale_fill_gradient2(low="royalblue", mid = "white", high="red", midpoint = 0) +
    theme_bw() +
    theme(axis.text=element_text(size=12,face="bold"),
          axis.title=element_text(size=15,face="bold"),
          plot.title=element_text(size=15,face="bold"),
          strip.text = element_text(size=15,face="bold"))
  
  return(naadevplot)
}


#Get empirical CVs
CVfxn=function(asapRun9dat){
  newESSsurv=read.csv("C:\\Herring\\2022 Assessment\\Survey\\ADIOS_SV_161722_UNIT_NONE_percent_positive.csv")
  newCVsurv=read.csv("C:\\Herring\\2022 Assessment\\Survey\\ADIOS_SV_161722_UNIT_NONE_strat_mean.csv")
  newCVacoustic=read.csv("C:\\Herring\\2022 Assessment\\Survey\\Acoustic\\Acoustic.csv")
  newCVacoustic$SD=-999
  newCVacoustic[newCVacoustic$offshore_var>0,"SD"]=sqrt(newCVacoustic[newCVacoustic$offshore_var>0,"offshore_var"])
  newCVacoustic$CV=-999
  newCVacoustic[newCVacoustic$offshore_var>0,"CV"]=newCVacoustic[newCVacoustic$offshore_var>0,"SD"]/newCVacoustic[newCVacoustic$offshore_var>0,"offshore_mean"]
  
  #Change survey CVs to empirical
  useindexptr=which(asapRun9dat$dat$use_index==1)
  #indexnames_order=c("SPRING","FALL","SUMMER","ACOUSTIC","SPRING","FALL","SPRING","FALL") #(spring pre85, fall pre85;summer/shrimp; acoustic; spring alb, fall alb, spring big, fall big)
  indexnames_order=c("SUMMER","ACOUSTIC","SPRING","FALL","SPRING","FALL") #(spring pre85, fall pre85;summer/shrimp; acoustic; spring alb, fall alb, spring big, fall big)
  for(i in 1:length(indexnames_order)){
    if(indexnames_order[i]=="ACOUSTIC"){ #acoustic info is in a separate file
      repl=newCVacoustic[newCVacoustic$year %in% asapRun9dat$dat$IAA_mats[[useindexptr[i]]][which(asapRun9dat$dat$IAA_mats[[useindexptr[i]]][,2]>0),1]
                         ,"CV"]
      #get block of data for a given survey - useindexptr; extract only rows with >0CV and only row 3 which is CV; replace with repl
      asapRun9dat$dat$IAA_mats[[useindexptr[i]]][asapRun9dat$dat$IAA_mats[[useindexptr[i]]][,2]>0,3]=repl
    } else {
      #Find the replacement values in the necessary season and years
      repl=(newCVsurv[newCVsurv$SEASON == indexnames_order[i] &
                        newCVsurv$INDEX_TYPE=="Abundance (numbers/tow)"  &
                        newCVsurv$YEAR %in% asapRun9dat$dat$IAA_mats[[useindexptr[i]]][which(asapRun9dat$dat$IAA_mats[[useindexptr[i]]][,2]>0),1]
                      ,"CV"])
      #get block of data for a given survey - useindexptr; extract only rows with >0CV and only row 3 which is CV; replace with repl
      asapRun9dat$dat$IAA_mats[[useindexptr[i]]][asapRun9dat$dat$IAA_mats[[useindexptr[i]]][,2]>0,3]=repl
    }
  }
  return(asapRun9dat)
}

#put ESS number changing into a function
ESSfxn=function(asapRun9dat,addnumcatch=100,addnumsurv=100){
  #change fleet ESS
  newESS=read.csv("C:\\Herring\\2022 Assessment\\CatchData\\NumberofTripsSampled_Sum.csv")
  asapRun9dat$dat$catch_Neff=as.matrix(newESS[,2:3]+addnumcatch) #add 100 so self weighting likelihoods work better but retain relative scaling sort of
  
  newESSsurv=read.csv("C:\\Herring\\2022 Assessment\\Survey\\ADIOS_SV_161722_UNIT_NONE_percent_positive.csv")
  newCVsurv=read.csv("C:\\Herring\\2022 Assessment\\Survey\\ADIOS_SV_161722_UNIT_NONE_strat_mean.csv")
  newCVacoustic=read.csv("C:\\Herring\\2022 Assessment\\Survey\\Acoustic\\Acoustic.csv")
  newCVacoustic$SD=-999
  newCVacoustic[newCVacoustic$offshore_var>0,"SD"]=sqrt(newCVacoustic[newCVacoustic$offshore_var>0,"offshore_var"])
  newCVacoustic$CV=-999
  newCVacoustic[newCVacoustic$offshore_var>0,"CV"]=newCVacoustic[newCVacoustic$offshore_var>0,"SD"]/newCVacoustic[newCVacoustic$offshore_var>0,"offshore_mean"]
  
  #change survey ESS and add 100
  indexnames_in_order=c("SUMMER","SPRING","FALL","SPRING","FALL") #(summer/shrimp, spring alb, fall alb, spring big, fall big)
  useindexpt=which(asapRun9dat$dat$use_index_acomp==1)
  for(i in 1:length(useindexpt)){
    #Find the replacement values in the necessary season and years and add 100
    repl=(newESSsurv[newESSsurv$SEASON == indexnames_in_order[i] &
                       newESSsurv$YEAR %in% asapRun9dat$dat$IAA_mats[[useindexpt[i]]][which(asapRun9dat$dat$IAA_mats[[useindexpt[i]]][,12]>0),1]
                     ,"POSITIVE_STATIONS"])+addnumsurv
    #get block of data for a given survey - useindexpt; extract only rows with >0ESS and only row 12 which is ESS; replace with repl
    asapRun9dat$dat$IAA_mats[[useindexpt[i]]][asapRun9dat$dat$IAA_mats[[useindexpt[i]]][,12]>0,12]=repl
  }
  return(asapRun9dat)
}

##extract OSA stats from WHAM fit
getOSAstats=function(mod,fleet=NULL){
  #fleet is used if you only want to use a subset of your fleets/indices
  #eg fleet=c(1,3,5) use only the fleet 1 and certain indices (check which with unique(mod$osa$fleet))
  osa=mod$osa
  if(is.null(fleet)) {
    names = unique(osa$fleet) # extract fleet name and index name
  } else names = unique(osa$fleet)[fleet]
  rez <- c()
  for (nm in names){
    if(length(osa[osa$fleet == nm & is.na(osa$age),]$residual)>0){
    #stats for the annual observations, whether they be index or fleet catch
    meanOSA_agg = mean(osa[osa$fleet == nm & is.na(osa$age),]$residual, na.rm = T)
    sdOSA_agg = sd(osa[osa$fleet == nm & is.na(osa$age),]$residual, na.rm = T)
    #extract p-value from Shapiro-Wilks test for normality (more power than K-S test)
    swTest_agg <- shapiro.test(osa[osa$fleet == nm & is.na(osa$age),]$residual)
    pVal_agg <- swTest_agg$p.value #This will be <=0.05 if residuals are non-normal
    } else {
      meanOSA_agg=NA
      sdOSA_agg =NA
      swTest_agg=NA
      pVal_agg=NA
      }
    
    #stats just for age comp
    if(length(osa[osa$fleet == nm & !is.na(osa$age),]$residual)>0){
    meanOSA_age = mean(osa[osa$fleet == nm & !is.na(osa$age),]$residual, na.rm = T)
    sdOSA_age = sd(osa[osa$fleet == nm & !is.na(osa$age),]$residual, na.rm = T)
    #extract p-value from Shapiro-Wilks test for normality (more power than K-S test)
    swTest_age <- shapiro.test(osa[osa$fleet == nm & !is.na(osa$age),]$residual)
    pVal_age <- swTest_age$p.value #This will be <=0.05 if residuals are non-normal
    } else {
      meanOSA_age=NA
      sdOSA_age =NA
      swTest_age=NA
      pVal_age=NA
    }
    rez <- rbind(rez,data.frame("Fleet"=nm,"OSAmean_agg"=round(meanOSA_agg,3),"OSAsd_agg"=round(sdOSA_agg,3),"pval_agg"=round(pVal_agg,3),
                                "OSAmean_age"=round(meanOSA_age,3),"OSAsd_age"=round(sdOSA_age,3),"pval_age"=round(pVal_age,3)))
  }
  return(rez)
}

##############self-test
# This runs the self-test and makes plots

do_selftest <- function(mod, n_sim, n_sim2plot, dir_figures) {
  set.seed(123)
  sim_inputs <- replicate(n_sim, sim_fn(mod), simplify=F)
  res = list(reps = list(), par.est = list(), par.se = list(), 
             adrep.est = list(), adrep.se =list())
  #fits = list()
  j <- 1
  for(i in 1:length(sim_inputs)){
    cat(paste0("sim ", i, " of ", n_sim, "\n"))
    sim_inputs[[i]]$SIM_ID <- i
    tfit <- NULL
    tryCatch(expr = {tfit <- fit_wham(sim_inputs[[i]], do.osa = F,
                                      do.retro = F, MakeADFun.silent = T, do.sdrep = F);},
             error = function(e){
               message("An error occurred:\n", e)
             },
             finally = {
               if (is.null(tfit)) {
                 
               } else {
                 
                 conv <- check_convergence(tfit, ret = T)
                 if(conv$convergence == 0){ #& conv$is_sdrep & isFALSE(conv$na_sdrep)){
                   conv$converged <- TRUE
                 } else conv$converged <- FALSE
                 res$reps[[j]] = tfit$rep
                 res$reps[[j]]$converged <- conv$converged
                 res$reps[[j]]$SIM_ID <- i
                 res$reps[[j]]$years <- tfit$years
                 j <- j + 1
               }
               
             })
    
    
    #fits[[i]] <- tfit
    #res$par.est[[i]] = as.list(tfit$sdrep, "Estimate")
    #res$par.se[[i]] = as.list(tfit$sdrep, "Std. Error")
    #res$adrep.est[[i]] = as.list(tfit$sdrep, "Estimate", report = TRUE)
    #res$adrep.se[[i]] = as.list(tfit$sdrep, "Std. Error", report = TRUE)
  }
  
  
  true_ssb = map_df(sim_inputs, function(x) data.frame(SIM_ID = x$SIM_ID, 
                                                       YEAR   = x$years, 
                                                       VAR    = "SSB", 
                                                       TRU    = x$data$SSB))
  true_f  = map_df(sim_inputs, function(x) data.frame(SIM_ID = x$SIM_ID, 
                                                      YEAR   = x$years, 
                                                      VAR    = "F", 
                                                      TRU    = x$data$`F`))
  
  true_r  = map_df(sim_inputs, function(x) data.frame(SIM_ID = x$SIM_ID, 
                                                      YEAR   = x$years, 
                                                      VAR    = "R", 
                                                      TRU    = x$data$NAA[,1]))
  
  est_ssb  = map_df(res$reps, function(x) data.frame(SIM_ID = x$SIM_ID,
                                                     YEAR   = x$years,
                                                     VAR    = "SSB",
                                                     EST    = x$SSB))
  est_f  = map_df(res$reps, function(x) data.frame(SIM_ID = x$SIM_ID,
                                                   YEAR   = x$years,
                                                   VAR    = "F",
                                                   EST    = x$`F`))
  
  est_r  = map_df(res$reps, function(x) data.frame(SIM_ID = x$SIM_ID,
                                                   YEAR   = x$years,
                                                   VAR    = "R",
                                                   EST    = x$NAA[,1]))
  
  conv_df <- map_df(res$reps, function(x) data.frame(SIM_ID = x$SIM_ID,
                                                     converged = x$converged))
  
  # Join all sims
  sim_out <- 
    left_join(true_ssb, est_ssb) %>%
    bind_rows({left_join(true_f, est_f)}) %>%
    bind_rows({left_join(true_r, est_r)}) %>%
    left_join(conv_df)
  
  selffits_converged <- sim_out %>% filter(converged)
  
  (convergence_rate <- length(unique(selffits_converged$SIM_ID))/n_sim)
  
  bias <- 
    selffits_converged %>%
    #filter(VAR == "F") %>%
    # mutate(EST = EST.1 + EST.2,
    #        TRU = TRU.1 + TRU.2) %>%
    select(SIM_ID, YEAR, VAR, TRU, EST) %>%
    bind_rows({selffits_converged %>% filter(VAR == "SSB") %>%
        select(SIM_ID, YEAR, VAR, TRU, EST)}) %>%
    mutate(percent_err = 100 * (EST - TRU)/TRU) %>%
    group_by(VAR, YEAR) %>%
    summarise(mpe = mean(percent_err),
              se  = sd(percent_err)/n()) %>%
    mutate(mpe_90lo = mpe - 1.645 * se,
           mpe_90hi = mpe + 1.645 * se)
  
  (bias_mean <- 
      bias %>%
      group_by(VAR) %>%
      summarise(`Mean Percent Bias` = round(mean(mpe),2)))
  
  write.csv(bias_mean, 
            file = paste0(dir_figures, "/self-test mean bias ", deparse(substitute(mod)), ".csv"), 
            row.names = F)
  
  # Plot example true vs estimated
  p <- ggplot(sim_out %>%
                select(-converged) %>%
                gather(SOURCE, VALUE, -SIM_ID, -YEAR, -VAR) %>%
                filter(SIM_ID %in% unique(SIM_ID)[1:n_sim2plot]) %>%
                mutate(SIM_ID = paste0("Simulation ", SIM_ID)),
              aes(x = YEAR, y = VALUE, color = SOURCE)) +
    geom_line() +
    facet_grid(VAR~SIM_ID, scales = "free_y") +
    theme_bw() +
    xlab("Year") +
    ylab("Value") +
    ggtitle(paste0("Example estimated vs. true (", 
                   deparse(substitute(mod)),
                   ")"))
  
  print(p)
  
  ggsave(p, filename = paste0(dir_figures, "/selftest_est_vs_tru_examples_", 
                              deparse(substitute(mod)), ".png"), 
         h = 6, w = 7)
  
  
  # Plot mean true vs mean estimated
  selffits_converged_mean <-
    selffits_converged %>%
    group_by(VAR, YEAR) %>%
    summarise(`Mean estimate w/90% CI` = mean(EST),
              True = mean(TRU),
              EST_90HIGH = `Mean estimate w/90% CI` + 1.645 * sd(EST),
              EST_90LOW  = `Mean estimate w/90% CI` - 1.645 * sd(EST)) %>%
    gather(output, value, -VAR, -YEAR, -EST_90HIGH, -EST_90LOW)
  
  p <-
    ggplot(selffits_converged_mean,
           aes(x = YEAR, y = value, color = output)) +
    geom_line() +
    scale_color_manual(values = c("blue", "black")) +
    geom_ribbon(aes(x = YEAR, ymin = EST_90LOW, ymax = EST_90HIGH), 
                alpha = 0.1, fill = "blue", color = NA) +
    facet_wrap(~VAR, scales = "free", ncol = 1) +
    theme_bw() +
    theme(legend.title = element_blank()) +
    ggtitle(paste0("Mean estimated vs. true (", 
                   deparse(substitute(mod)),
                   ")")) +
    ylab("") +
    xlab("Year")
  
  print(p)
  
  ggsave(p, filename = paste0(dir_figures, "/selftest_est_vs_tru_mean_", deparse(substitute(mod)), ".png"), 
         h = 6, w = 7)
  
  
  # Plot overall bias
  p <- ggplot(bias, aes(x = YEAR, y = mpe)) +
    geom_line() +
    geom_ribbon(aes(ymin = mpe_90lo, ymax = mpe_90hi), alpha = 0.2) +
    geom_hline(yintercept = 0) +
    geom_hline(data = bias_mean, 
               aes(yintercept = `Mean Percent Bias`),
               color = "red") +
    facet_wrap(~VAR) +
    theme_bw() +
    ylab("Mean percent error (Est. - True)") +
    xlab("Year") +
    ggtitle(paste0("Self-test mean bias (", deparse(substitute(mod)), ")"))
  
  print(p)
  
  ggsave(p, filename = paste0(dir_figures, "/selftest_bias_", 
                              deparse(substitute(mod)), ".png"), 
         h = 6, w = 7)
  
  
  return(sim_out)
}
##needed for selftest above
# Simple simultation function for WHAM model

sim_fn <- function(om, self.fit = FALSE){
  input <- om$input
  input$data = om$simulate(complete=TRUE)
  if(self.fit) {
    fit <- fit_wham(input, do.osa = F, do.retro = F, MakeADFun.silent = T)
    return(fit)
  } else return(input) 
}

# modified selftest code to not make plots and not save any files
# kept the function call the same to make it easier to find
do_selftest_cml <- function(mod, n_sim, n_sim2plot, dir_figures) {
  set.seed(123)
  sim_inputs <- replicate(n_sim, sim_fn(mod), simplify=F)
  res = list(reps = list(), par.est = list(), par.se = list(), 
             adrep.est = list(), adrep.se =list())
  j <- 1
  for(i in 1:length(sim_inputs)){
    cat(paste0("sim ", i, " of ", n_sim, "\n"))
    sim_inputs[[i]]$SIM_ID <- i
    tfit <- NULL
    tryCatch(expr = {tfit <- fit_wham(sim_inputs[[i]], do.osa = F,
                                      do.retro = F, MakeADFun.silent = T, do.sdrep = F);},
             error = function(e){
               message("An error occurred:\n", e)
             },
             finally = {
               if (is.null(tfit)) {
                 
               } else {
                 
                 conv <- check_convergence(tfit, ret = T)
                 if(conv$convergence == 0){ #& conv$is_sdrep & isFALSE(conv$na_sdrep)){
                   conv$converged <- TRUE
                 } else conv$converged <- FALSE
                 res$reps[[j]] = tfit$rep
                 res$reps[[j]]$converged <- conv$converged
                 res$reps[[j]]$SIM_ID <- i
                 res$reps[[j]]$years <- tfit$years
                 j <- j + 1
               }
               
             })
  }
  
  true_ssb = map_df(sim_inputs, function(x) data.frame(SIM_ID = x$SIM_ID, 
                                                       YEAR   = x$years, 
                                                       VAR    = "SSB", 
                                                       TRU    = x$data$SSB))
  
  true_f  = map_df(sim_inputs, function(x) data.frame(SIM_ID = x$SIM_ID, 
                                                      YEAR   = x$years, 
                                                      VAR    = "F", 
                                                      TRU    = x$data$`F`))
  
  true_r  = map_df(sim_inputs, function(x) data.frame(SIM_ID = x$SIM_ID, 
                                                      YEAR   = x$years, 
                                                      VAR    = "R", 
                                                      TRU    = x$data$NAA[,1]))
  
  est_ssb  = map_df(res$reps, function(x) data.frame(SIM_ID = x$SIM_ID,
                                                     YEAR   = x$years,
                                                     VAR    = "SSB",
                                                     EST    = x$SSB))
  
  est_f  = map_df(res$reps, function(x) data.frame(SIM_ID = x$SIM_ID,
                                                   YEAR   = x$years,
                                                   VAR    = "F",
                                                   EST    = x$`F`))
  
  est_r  = map_df(res$reps, function(x) data.frame(SIM_ID = x$SIM_ID,
                                                   YEAR   = x$years,
                                                   VAR    = "R",
                                                   EST    = x$NAA[,1]))
  
  conv_df <- map_df(res$reps, function(x) data.frame(SIM_ID = x$SIM_ID,
                                                     converged = x$converged))
  
  # Join all sims
  sim_out <- 
    left_join(true_ssb, est_ssb) %>%
    bind_rows({left_join(true_f, est_f)}) %>%
    bind_rows({left_join(true_r, est_r)}) %>%
    left_join(conv_df)
  
  return(sim_out)
}

#--------------
#' @description
#' Automated creation of a pdf showing the old (mean and se) and new (median and quantiles) approach to estimating bias
#' a WHAM self-test. Also shows a number of realizations for F, R, and SSB for both percent error and true vs estimated.
#' 
#' @param mod_selftest result of do_selftest function, contains annual true and estimated F, R, and SSB for a number of realizations
#' @param myfilename name (including filepath if so desired) for pdf to be created
#' 
#' @ return list of 7 figures that are contained in the pdf 

make_simtest_pdf <- function(mod_selftest, myfilename){
  
  myfig <- list()
  
  # current approach to look for bias using mean and standard error (divide sd by number of realization)
  bias <- mod_selftest %>%
    filter(converged == TRUE) %>%
    mutate(percent_err = 100 * (EST - TRU)/TRU) %>%
    group_by(VAR, YEAR) %>%
    summarise(mpe = mean(percent_err),
              se  = sd(percent_err)/n()) %>%
    mutate(mpe_90lo = mpe - 1.645 * se,
           mpe_90hi = mpe + 1.645 * se)
  
  myfig[[1]] <- ggplot(bias, aes(x = YEAR, y = mpe)) +
    geom_line() +
    geom_ribbon(aes(ymin = mpe_90lo, ymax = mpe_90hi), alpha = 0.2) +
    geom_hline(yintercept = 0, col="red") +
    facet_wrap(~VAR) +
    theme_bw() +
    ylab("Mean percent error (Est. - True)") +
    xlab("Year") +
    ggtitle("Self-test mean bias")
  
  # proposed alternative based on median and quantiles
  mod_conv <- mod_selftest %>% 
    filter(converged == TRUE) %>%
    mutate(percent_err = 100 * (EST - TRU)/TRU)
  
  mod_quants <- mod_conv %>%
    group_by(VAR, YEAR) %>%
    summarize(q05 = quantile(percent_err, 0.05,na.rm=TRUE),
              q25 = quantile(percent_err, 0.25,na.rm=TRUE),
              median = median(percent_err,na.rm=TRUE),
              q75 = quantile(percent_err, 0.75,na.rm=TRUE),
              q95 = quantile(percent_err, 0.95,na.rm=TRUE))
  
  myfig[[2]] <- ggplot(mod_quants, aes(x=YEAR, y=median)) +
    geom_line() +
    geom_ribbon(aes(ymin = q05, ymax = q95), alpha = 0.2) +
    geom_ribbon(aes(ymin = q25, ymax = q75), alpha = 0.2) +
    geom_hline(yintercept = 0, col="red") +
    facet_wrap(~VAR, ncol = 3) +
    ylab("Percent error") +
    ggtitle("Self-test median bias and 5%, 25%, 75%, 90% quantiles") +
    theme_bw()
  
  mod_conv_means <- mod_conv %>%
    group_by(VAR, SIM_ID) %>%
    mutate(meanval = mean(percent_err), medianval = median(percent_err))
  
  # take a look at some of the realizations  
  myfig[[3]] <- ggplot(filter(mod_conv, SIM_ID <= 10), aes(x=YEAR, y=percent_err, col=as.factor(SIM_ID))) +
    geom_line() +
    facet_wrap(~VAR, ncol = 3) +
    ggtitle("10 realizations") +
    theme_bw() +
    theme(legend.position = "none")
  
  make_plots <- function(mod_conv, mod_conv_means, myvar, maxplots){
    convid <- unique(mod_conv$SIM_ID)
    if (maxplots > length(convid)){
      maxid <- max(convid)
    }else{
      maxid <- convid[maxplots]
    }
    p1 <- ggplot(filter(mod_conv, VAR==myvar, SIM_ID <= maxid), aes(x=YEAR, y=percent_err)) +
      geom_line() +
      facet_wrap(~SIM_ID, ncol=3) +
      geom_hline(yintercept = 0, col="red") +
      geom_hline(data=filter(mod_conv_means, VAR==myvar, SIM_ID <= maxid), 
                 aes(yintercept = meanval), col="blue", linetype="dashed") +
      ggtitle(myvar) +
      theme_bw()
    return(p1)  
  }
  
  myfig[[4]] <- make_plots(mod_conv, mod_conv_means, "SSB", 12)
  myfig[[5]] <- make_plots(mod_conv, mod_conv_means, "F", 12)
  myfig[[6]] <- make_plots(mod_conv, mod_conv_means, "R", 12)
  
  myfig[[7]] <- ggplot(mod_selftest %>% 
                         filter(converged == TRUE) %>%
                         select(-converged) %>%
                         pivot_longer(cols = c(TRU, EST), names_to = "SOURCE", values_to = "VALUE") %>%
                         filter(SIM_ID %in% unique(SIM_ID)[1:10]), 
                       aes(x = YEAR, y = VALUE, color = SOURCE)) +
    geom_line() +
    facet_grid(VAR~SIM_ID, scales = "free_y") +
    theme_bw() +
    xlab("Year") +
    ylab("Value") +
    ggtitle("Example estimated vs. true ")
  
  
  pdf(file = myfilename)
  print(myfig)
  dev.off()
  
  return(myfig)
}