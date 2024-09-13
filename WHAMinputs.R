# originally used for bluefish RTA 2022
# modified for herring RTA 2024
# create csv for WHAM input
# long input best?
# going wide...

library(dplyr)
library(ggplot2)
library(tidyr)

WHAMinputs <- function(infile, strata=NULL, outfile) {
  
  splitoutput <- read.csv(infile)
  
  #defaults to standard zoop model strata
  if(is.null(strata)) {
  stratlook <- data.frame(Stratum = c("Stratum_1",
                                      "Stratum_2",
                                      "Stratum_3",
                                      "Stratum_4",
                                      "Stratum_5",
                                      "Stratum_6",
                                      "Stratum_7"),
                          Region  = c("AllEPU",
                                      "her_sp",
                                      "her_fa",
                                      "MAB",
                                      "GB",
                                      "GOM",
                                      "SS"))
  } else {
    stratlook <- strata
  }
  
  # for herring model, do herring_spring, herring_fall, and herring_larval areas
  zoopindex <- splitoutput |>
    dplyr::left_join(stratlook) |>
    dplyr::select(Time, Region, Estimate, SE=Std..Error.for.Estimate) |>
    tidyr::pivot_longer(c(Estimate, SE), names_to = "Var") |>
    dplyr::group_by(Var) |>
    tidyr::pivot_wider(names_from = Region, values_from = value) |>
    dplyr::select(Time, dplyr::starts_with("her_")) |>
    tidyr::pivot_longer(!c(Time, Var), names_to = "Region", values_to = "value") |>
    tidyr::pivot_wider(names_from = "Var", values_from = "value") |>
    tidyr::pivot_wider(names_from = "Region", values_from = c("Estimate", "SE"),
                       names_glue = "{Region}_{.value}", names_vary = "slowest")
  
  readr::write_csv(zoopindex, outfile)
  
} 


stratlook2 <- data.frame(Stratum = c("Stratum_1",
                                     "Stratum_2",
                                     "Stratum_3",
                                     "Stratum_4",
                                     "Stratum_5",
                                     "Stratum_6",
                                     "Stratum_7",
                                     "Stratum_8",
                                     "Stratum_9"),
                         Region  = c("AllEPU",
                                     "her_sp",
                                     "her_fa",
                                     "her_larv",
                                     "no_larv",
                                     "MAB",
                                     "GB",
                                     "GOM",
                                     "SS"))

# make data files
# fall small copepod doy models did not converge, use without covariates
WHAMinputs(infile = "pyindex/smallcopeALL_fall_500_biascorrect/Index.csv",
           outfile = "WHAMfits/fallsmallcopeALLindex.csv")

# spring large copepod models with doy covariate coverged and doy improved fit
WHAMinputs(infile = "pyindex/lgcopeALL_spring_500_biascorrect_doy/Index.csv",
           outfile = "WHAMfits/springlargecopeindex.csv")

# didn't try covariates in the small copeopods larval area model, outa time
WHAMinputs(infile = "pyindex/smallcopeALL_sepfeb_yrshift_500_larvarea_biascorrect/Index.csv",
           strata = stratlook2,
           outfile = "WHAMfits/sepfebsmallcopeALLlarvareaindex.csv")



# bias corrected fall results
#splitoutput <- read.csv("pyindex/allagg_fall_500_lennosst_ALLsplit_biascorrect/Index.csv")

# # code for visualizing summed SE approximation vs calculated SE
# in2off <- splitoutput %>%
#   left_join(stratlook) %>%
#   dplyr::select(Time, Region, Estimate, Std..Error.for.Estimate) %>%
#   tidyr::pivot_longer(c(Estimate, Std..Error.for.Estimate), names_to = "Var") %>%
#   dplyr::group_by(Var) %>%
#   tidyr::pivot_wider(names_from = Region, values_from = value) %>%
#   dplyr::mutate(AlbInshore = MABGBalbinshore,
#                 NewOffshore = bfoff,
#                 BigOld = bfin,
#                 BigNew = bfall,
#                 CompBigNew = bfin + bfoff,
#                 AlbOld = AlbInshore + BigOld,
#                 AlbNew = AlbInshore + BigNew,
#                 StateWaters = MABGBstate,
#                 FedWaters =   MABGBfed) %>%
#   dplyr::select(Time, AlbInshore, NewOffshore, BigOld, BigNew, CompBigNew, AlbOld, AlbNew, StateWaters, FedWaters) %>%
#   tidyr::pivot_longer(!c(Time, Var), names_to = "Region", values_to = "value") %>%
#   tidyr::pivot_wider(names_from = "Var", values_from = "value")
# 
# ggplot(in2off, aes(x=Time, y=Estimate, colour = Region)) +
#   geom_errorbar(aes(ymin=Estimate+Std..Error.for.Estimate, ymax=Estimate-Std..Error.for.Estimate))+
#   geom_point()+
#   geom_line()
# 
# compare <- in2off %>%
#   filter(Region %in% c("CompBigNew", "BigNew")) 
# 
# ggplot(compare, aes(x=Time, y=Estimate, colour = Region)) +
#   geom_errorbar(aes(ymin=Estimate+Std..Error.for.Estimate, ymax=Estimate-Std..Error.for.Estimate))+
#   geom_point()+
#   geom_line()

