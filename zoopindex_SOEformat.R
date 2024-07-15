# create rds for ecodata input
# aim for similar structure to other ecodata datasets


library(dplyr)
library(ggplot2)
library(tidyr)

SOEinputs <- function(infile, season, taxa, outfile) {
  
  splitoutput <- read.csv(infile)
  
  # warning, hardcoded. obviously
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
  
  zoopindex <- splitoutput %>%
    left_join(stratlook) %>%
    dplyr::select(Time, 
                  EPU = Region, 
                  "Biomass Index Estimate" = Estimate, 
                  "Biomass Index Estimate SE" = Std..Error.for.Estimate) %>%
    tidyr::pivot_longer(c("Biomass Index Estimate", "Biomass Index Estimate SE"), 
                        names_to = "Var", values_to = "Value") %>%
    dplyr::filter(EPU %in% c("her_sp", "her_fa", "GB", "GOM", "AllEPU")) %>%
    dplyr::mutate(Units = "relative grams per stomach") %>%
    dplyr::select(Time, Var, Value, EPU, Units)
  
  zoopindex$Var <- stringr::str_c(season, taxa, zoopindex$Var, sep = " ")
  
  saveRDS(zoopindex, outfile)
  
} 


# make data files
SOEinputs(infile = "pyindex/calfin_spring_500_biascorrect/Index.csv",
          season = "Spring", 
          taxa = "Calanus finmarchicus",
          outfile = "pyindex/springcalfinindex.rds")

SOEinputs(infile = "pyindex/lgcopeALL_spring_500_biascorrect/Index.csv",
          season = "Spring", 
          taxa = "Large copepods ALL",
          outfile = "pyindex/springlgcopepodALLindex.rds")

SOEinputs(infile = "pyindex/smallcopeALL_fall_500_biascorrect/Index.csv",
          season = "Fall", 
          taxa = "Small copepods ALL",
          outfile = "pyindex/fallsmcopepodALLindex.rds")

SOEinputs(infile = "pyindex/smallcopeSOE_fall_500_biascorrect/Index.csv",
          season = "Fall", 
          taxa = "Small copepods (top 4)",
          outfile = "pyindex/fallsmcopepodSOEindex.rds")


# test plot
# foragewide <- forageindex %>%
#   pivot_wider(names_from = Var, values_from = Value)
# 
# 
# ggplot(foragewide, aes(x=Time, y=`Forage Fish Biomass Estimate`, colour = EPU)) +
#   geom_errorbar(aes(ymin=`Forage Fish Biomass Estimate`+`Forage Fish Biomass Estimate SE`, 
#                     ymax=`Forage Fish Biomass Estimate`-`Forage Fish Biomass Estimate SE`))+
#   geom_point()+
#   geom_line()

calfinwide <- springcalfinindex |> tidyr::pivot_wider(names_from = Var, values_from = Value)

ggplot2::ggplot(calfinwide, ggplot2::aes(x=Time, y=`Spring Calanus finmarchicus Biomass Index Estimate`, colour=EPU)) + 
  ggplot2::geom_ribbon(ggplot2::aes(ymin=`Spring Calanus finmarchicus Biomass Index Estimate`-`Spring Calanus finmarchicus Biomass Index Estimate SE`, 
                                    ymax=`Spring Calanus finmarchicus Biomass Index Estimate`+`Spring Calanus finmarchicus Biomass Index Estimate SE`,
                                    fill=EPU),
                       alpha=0.5)+
  ggplot2::geom_point()+
  ggplot2::geom_line() #+
#ggplot2::facet_wrap(~EPU)

