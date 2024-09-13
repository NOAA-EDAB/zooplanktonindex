---
output:
  html_document:
    df_print: paged
    keep_md: yes
  word_document: default
  pdf_document:
    fig_caption: yes
    includes:
    keep_tex: yes
    number_sections: no
title: "WHAM figures and tables"
header-includes:
  - \usepackage{longtable}
  - \usepackage{booktabs}
  - \usepackage{caption,graphics}
  - \usepackage{makecell}
  - \usepackage{lscape}
  - \renewcommand\figurename{Fig.}
  - \captionsetup{labelsep=period, singlelinecheck=false}
  - \newcommand{\changesize}[1]{\fontsize{#1pt}{#1pt}\selectfont}
  - \renewcommand{\arraystretch}{1.5}
  - \renewcommand\theadfont{}
---



# {.tabset}

## Figures {.tabset}

### Input

<img src="plots_png/input_data/Acoust_region_1_age_comp.png" width="720" style="display: block; margin: auto;" /><img src="plots_png/input_data/catch_age_comp_Fixed_region_1.png" width="720" style="display: block; margin: auto;" /><img src="plots_png/input_data/catch_age_comp_Mobile_region_1.png" width="720" style="display: block; margin: auto;" /><img src="plots_png/input_data/catch_by_fleet.png" width="720" style="display: block; margin: auto;" /><img src="plots_png/input_data/FallAlb85_region_1_age_comp.png" width="720" style="display: block; margin: auto;" /><img src="plots_png/input_data/FallBig_region_1_age_comp.png" width="720" style="display: block; margin: auto;" /><img src="plots_png/input_data/index.png" width="720" style="display: block; margin: auto;" /><img src="plots_png/input_data/maturity_stock_1.png" width="720" style="display: block; margin: auto;" /><img src="plots_png/input_data/Shrimp_region_1_age_comp.png" width="720" style="display: block; margin: auto;" /><img src="plots_png/input_data/SprAlb85_region_1_age_comp.png" width="720" style="display: block; margin: auto;" /><img src="plots_png/input_data/SprBig_region_1_age_comp.png" width="720" style="display: block; margin: auto;" /><img src="plots_png/input_data/weight_at_age_Acoust_index.png" width="720" style="display: block; margin: auto;" /><img src="plots_png/input_data/weight_at_age_FallAlb85_index.png" width="720" style="display: block; margin: auto;" /><img src="plots_png/input_data/weight_at_age_FallBig_index.png" width="720" style="display: block; margin: auto;" /><img src="plots_png/input_data/weight_at_age_Fixed_fleet.png" width="720" style="display: block; margin: auto;" /><img src="plots_png/input_data/weight_at_age_Mobile_fleet.png" width="720" style="display: block; margin: auto;" /><img src="plots_png/input_data/weight_at_age_Shrimp_index.png" width="720" style="display: block; margin: auto;" /><img src="plots_png/input_data/weight_at_age_SprAlb85_index.png" width="720" style="display: block; margin: auto;" /><img src="plots_png/input_data/weight_at_age_SprBig_index.png" width="720" style="display: block; margin: auto;" /><img src="plots_png/input_data/weight_at_age_SSB_stock_1.png" width="720" style="display: block; margin: auto;" />

### Diagnostics

<img src="plots_png/diagnostics/Catch_4panel_fleet_Fixed_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Catch_4panel_fleet_Mobile_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Catch_age_comp_Acoust_region_1_a.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Catch_age_comp_Acoust_region_1_b.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Catch_age_comp_Acoust_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Catch_age_comp_FallAlb85_region_1_a.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Catch_age_comp_FallAlb85_region_1_b.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Catch_age_comp_FallAlb85_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Catch_age_comp_FallBig_region_1_a.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Catch_age_comp_FallBig_region_1_b.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Catch_age_comp_FallBig_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Catch_age_comp_Fixed_region_1_a.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Catch_age_comp_Fixed_region_1_b.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Catch_age_comp_fleet_Fixed_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Catch_age_comp_fleet_Mobile_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Catch_age_comp_Mobile_region_1_a.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Catch_age_comp_Mobile_region_1_b.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Catch_age_comp_resids_FallAlb85.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Catch_age_comp_resids_FallBig.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Catch_age_comp_resids_Fixed.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Catch_age_comp_resids_Mobile.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Catch_age_comp_resids_Shrimp.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Catch_age_comp_resids_SprAlb85.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Catch_age_comp_resids_SprBig.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Catch_age_comp_Shrimp_region_1_a.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Catch_age_comp_Shrimp_region_1_b.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Catch_age_comp_Shrimp_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Catch_age_comp_SprAlb85_region_1_a.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Catch_age_comp_SprAlb85_region_1_b.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Catch_age_comp_SprAlb85_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Catch_age_comp_SprBig_region_1_a.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Catch_age_comp_SprBig_region_1_b.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Catch_age_comp_SprBig_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Index_4panel_Acoust_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Index_4panel_FallAlb85_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Index_4panel_FallBig_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Index_4panel_Shrimp_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Index_4panel_SprAlb85_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Index_4panel_SprBig_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/lgCopeSpr_diagnostic.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/likelihood.png" width="720" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/NAA_4panel_stock_1_region_1_age_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/NAA_4panel_stock_1_region_1_age_2.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/NAA_4panel_stock_1_region_1_age_3.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/NAA_4panel_stock_1_region_1_age_4.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/NAA_4panel_stock_1_region_1_age_5.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/NAA_4panel_stock_1_region_1_age_6.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/NAA_4panel_stock_1_region_1_age_7.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/NAA_4panel_stock_1_region_1_age_8.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/Residuals_time.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/diagnostics/summary_text.png" width="720" style="display: block; margin: auto;" />

### Results

<img src="plots_png/results/Ecov_1_lgCopeSpr.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/results/F_byfleet.png" width="720" style="display: block; margin: auto;" /><img src="plots_png/results/M_at_age_stock_1_.png" width="720" style="display: block; margin: auto;" /><img src="plots_png/results/MAA_tile.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/results/NAA_dev_tile.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/results/Numbers_at_age_proportion_stock_1_region_1.png" width="720" style="display: block; margin: auto;" /><img src="plots_png/results/Numbers_at_age_stock_1_region_1.png" width="720" style="display: block; margin: auto;" /><img src="plots_png/results/q_time_series.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/results/SelAA_tile.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/results/Selectivity_Acoust_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/results/Selectivity_FallAlb85_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/results/Selectivity_FallBig_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/results/Selectivity_Fixed_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/results/Selectivity_Mobile_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/results/Selectivity_Shrimp_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/results/Selectivity_SprAlb85_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/results/Selectivity_SprBig_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/results/SSB_at_age_proportion_stock_1.png" width="720" style="display: block; margin: auto;" /><img src="plots_png/results/SSB_at_age_stock_1.png" width="720" style="display: block; margin: auto;" /><img src="plots_png/results/SSB_F_trend.png" width="720" style="display: block; margin: auto;" /><img src="plots_png/results/SSB_Rec_loglog_stock_1.png" width="720" style="display: block; margin: auto;" /><img src="plots_png/results/SSB_Rec_stock_1.png" width="720" style="display: block; margin: auto;" /><img src="plots_png/results/SSB_Rec_time_stock_1.png" width="720" style="display: block; margin: auto;" />

### Retro

<img src="plots_png/retro/region_1_Fbar_retro_relative.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/retro/region_1_Fbar_retro.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/retro/stock_1_region_1_NAA_age_1_retro_relative.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/retro/stock_1_region_1_NAA_age_1_retro.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/retro/stock_1_region_1_NAA_retro_relative.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/retro/stock_1_region_1_NAA_retro.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/retro/stock_1_SSB_retro_relative.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/retro/stock_1_SSB_retro.png" width="1440" style="display: block; margin: auto;" />

### Reference points

<img src="plots_png/ref_points/FSPR_absolute.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/ref_points/FSPR_annual_time.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/ref_points/FSPR_freq_annual_F.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/ref_points/FSPR_freq_annual_YPR.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/ref_points/FSPR_relative.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/ref_points/SPR_targets_ave_plot.png" width="720" style="display: block; margin: auto;" /><img src="plots_png/ref_points/SPR_targets_ave_table.png" width="720" style="display: block; margin: auto;" /><img src="plots_png/ref_points/YPR_F_curve_table.png" width="1440" style="display: block; margin: auto;" />

### Miscellaneous

<img src="plots_png/misc/catch_at_age_consistency_obs_FallAlb85_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/misc/catch_at_age_consistency_obs_FallBig_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/misc/catch_at_age_consistency_obs_Fixed_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/misc/catch_at_age_consistency_obs_Mobile_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/misc/catch_at_age_consistency_obs_Shrimp_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/misc/catch_at_age_consistency_obs_SprAlb85_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/misc/catch_at_age_consistency_obs_SprBig_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/misc/catch_at_age_consistency_pred_FallAlb85_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/misc/catch_at_age_consistency_pred_FallBig_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/misc/catch_at_age_consistency_pred_Fixed_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/misc/catch_at_age_consistency_pred_Mobile_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/misc/catch_at_age_consistency_pred_Shrimp_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/misc/catch_at_age_consistency_pred_SprAlb85_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/misc/catch_at_age_consistency_pred_SprBig_region_1.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/misc/catch_curves_FallAlb85_region_1_obs.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/misc/catch_curves_FallAlb85_region_1_pred.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/misc/catch_curves_FallBig_region_1_obs.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/misc/catch_curves_FallBig_region_1_pred.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/misc/catch_curves_Fixed_region_1_obs.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/misc/catch_curves_Fixed_region_1_pred.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/misc/catch_curves_Mobile_region_1_obs.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/misc/catch_curves_Mobile_region_1_pred.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/misc/catch_curves_Shrimp_region_1_obs.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/misc/catch_curves_Shrimp_region_1_pred.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/misc/catch_curves_SprAlb85_region_1_obs.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/misc/catch_curves_SprAlb85_region_1_pred.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/misc/catch_curves_SprBig_region_1_obs.png" width="1440" style="display: block; margin: auto;" /><img src="plots_png/misc/catch_curves_SprBig_region_1_pred.png" width="1440" style="display: block; margin: auto;" />

## Tables {.tabset}

### Parameter estimates

<table class="table" style="margin-left: auto; margin-right: auto;">
<caption>Parameter estimates, standard errors, and confidence intervals. Rounded to 3 decimal places.</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> Estimate </th>
   <th style="text-align:right;"> Std. Error </th>
   <th style="text-align:right;"> 95\% CI lower </th>
   <th style="text-align:right;"> 95\% CI upper </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> stock 1 Mean Recruitment </td>
   <td style="text-align:right;"> $2239501.011$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> stock 1 NAA $\sigma$ (age 1) </td>
   <td style="text-align:right;"> $1.023$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> stock 1 NAA $\sigma$ (ages 2-8+) </td>
   <td style="text-align:right;"> $0.162$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> stock 1   NAA AR1 $\rho$ age </td>
   <td style="text-align:right;"> $-0.158$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Shrimp fully selected q </td>
   <td style="text-align:right;"> $1.005\times 10^{-5}$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Acoust fully selected q </td>
   <td style="text-align:right;"> $3.611\times 10^{-5}$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SprAlb85 fully selected q </td>
   <td style="text-align:right;"> $7.393\times 10^{-6}$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FallAlb85 fully selected q </td>
   <td style="text-align:right;"> $1.183\times 10^{-5}$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SprBig fully selected q </td>
   <td style="text-align:right;"> $4.662\times 10^{-5}$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FallBig fully selected q </td>
   <td style="text-align:right;"> $4.860\times 10^{-5}$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 1: Mobile Selectivity for age 1 </td>
   <td style="text-align:right;"> $5.549\times 10^{-4}$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 1: Mobile Selectivity for age 2 </td>
   <td style="text-align:right;"> $0.095$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 1: Mobile Selectivity for age 3 </td>
   <td style="text-align:right;"> $0.343$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 1: Mobile Selectivity for age 4 </td>
   <td style="text-align:right;"> $0.438$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 1: Mobile Selectivity for age 5 </td>
   <td style="text-align:right;"> $0.587$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 1: Mobile Selectivity for age 6 </td>
   <td style="text-align:right;"> $0.772$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 1: Mobile Selectivity for age 7 </td>
   <td style="text-align:right;"> $1.000$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 1: Mobile Selectivity for age 8+ </td>
   <td style="text-align:right;"> $1.000$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 2: Fixed Selectivity for age 1 </td>
   <td style="text-align:right;"> $0.039$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 2: Fixed Selectivity for age 2 </td>
   <td style="text-align:right;"> $1.000$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 2: Fixed Selectivity for age 3 </td>
   <td style="text-align:right;"> $0.228$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 2: Fixed Selectivity for age 4 </td>
   <td style="text-align:right;"> $0.115$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 2: Fixed Selectivity for age 5 </td>
   <td style="text-align:right;"> $0.101$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 2: Fixed Selectivity for age 6 </td>
   <td style="text-align:right;"> $0.110$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 2: Fixed Selectivity for age 7 </td>
   <td style="text-align:right;"> $0.135$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 2: Fixed Selectivity for age 8+ </td>
   <td style="text-align:right;"> $0.305$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 3: Shrimp Selectivity for age 1 </td>
   <td style="text-align:right;"> $0.000$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 3: Shrimp Selectivity for age 2 </td>
   <td style="text-align:right;"> $0.000$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 3: Shrimp Selectivity for age 3 </td>
   <td style="text-align:right;"> $0.156$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 3: Shrimp Selectivity for age 4 </td>
   <td style="text-align:right;"> $1.000$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 3: Shrimp Selectivity for age 5 </td>
   <td style="text-align:right;"> $1.000$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 3: Shrimp Selectivity for age 6 </td>
   <td style="text-align:right;"> $1.000$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 3: Shrimp Selectivity for age 7 </td>
   <td style="text-align:right;"> $1.000$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 3: Shrimp Selectivity for age 8+ </td>
   <td style="text-align:right;"> $1.000$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 4: Acoust Selectivity for age 1 </td>
   <td style="text-align:right;"> $0.000$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 4: Acoust Selectivity for age 2 </td>
   <td style="text-align:right;"> $0.000$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 4: Acoust Selectivity for age 3 </td>
   <td style="text-align:right;"> $1.000$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 4: Acoust Selectivity for age 4 </td>
   <td style="text-align:right;"> $1.000$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 4: Acoust Selectivity for age 5 </td>
   <td style="text-align:right;"> $1.000$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 4: Acoust Selectivity for age 6 </td>
   <td style="text-align:right;"> $1.000$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 4: Acoust Selectivity for age 7 </td>
   <td style="text-align:right;"> $1.000$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 4: Acoust Selectivity for age 8+ </td>
   <td style="text-align:right;"> $1.000$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 5: SprAlb85 Selectivity for age 1 </td>
   <td style="text-align:right;"> $0.000$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 5: SprAlb85 Selectivity for age 2 </td>
   <td style="text-align:right;"> $0.275$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 5: SprAlb85 Selectivity for age 3 </td>
   <td style="text-align:right;"> $0.700$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 5: SprAlb85 Selectivity for age 4 </td>
   <td style="text-align:right;"> $1.000$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 5: SprAlb85 Selectivity for age 5 </td>
   <td style="text-align:right;"> $1.000$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 5: SprAlb85 Selectivity for age 6 </td>
   <td style="text-align:right;"> $1.000$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 5: SprAlb85 Selectivity for age 7 </td>
   <td style="text-align:right;"> $1.000$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 5: SprAlb85 Selectivity for age 8+ </td>
   <td style="text-align:right;"> $1.000$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 6: FallAlb85 $a_{50}$ </td>
   <td style="text-align:right;"> $2.968$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 6: FallAlb85 1/slope (increasing) </td>
   <td style="text-align:right;"> $0.405$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 7: SprBig Selectivity for age 1 </td>
   <td style="text-align:right;"> $0.000$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 7: SprBig Selectivity for age 2 </td>
   <td style="text-align:right;"> $0.149$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 7: SprBig Selectivity for age 3 </td>
   <td style="text-align:right;"> $0.678$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 7: SprBig Selectivity for age 4 </td>
   <td style="text-align:right;"> $1.000$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 7: SprBig Selectivity for age 5 </td>
   <td style="text-align:right;"> $1.000$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 7: SprBig Selectivity for age 6 </td>
   <td style="text-align:right;"> $1.000$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 7: SprBig Selectivity for age 7 </td>
   <td style="text-align:right;"> $1.000$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 7: SprBig Selectivity for age 8+ </td>
   <td style="text-align:right;"> $1.000$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 8: FallBig $a_{50}$ </td>
   <td style="text-align:right;"> $3.035$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Block 8: FallBig 1/slope (increasing) </td>
   <td style="text-align:right;"> $0.387$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mobile in region 1 age comp, logistic-normal: $\sigma$ </td>
   <td style="text-align:right;"> $4.060$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mobile in region 1 age comp, logistic-normal: $\rho$ </td>
   <td style="text-align:right;"> $0.892$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fixed in region 1 age comp, logistic-normal: $\sigma$ </td>
   <td style="text-align:right;"> $2.669$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fixed in region 1 age comp, logistic-normal: $\rho$ </td>
   <td style="text-align:right;"> $0.813$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Shrimp in region 1 age comp, logistic-normal: $\sigma$ </td>
   <td style="text-align:right;"> $8.192$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Shrimp in region 1 age comp, logistic-normal: $\rho$ </td>
   <td style="text-align:right;"> $0.822$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SprAlb85 in region 1 age comp, logistic-normal: $\sigma$ </td>
   <td style="text-align:right;"> $5.142$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SprAlb85 in region 1 age comp, logistic-normal: $\rho$ </td>
   <td style="text-align:right;"> $0.905$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FallAlb85 in region 1 age comp, logistic-normal: $\sigma$ </td>
   <td style="text-align:right;"> $5.812$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FallAlb85 in region 1 age comp, logistic-normal: $\rho$ </td>
   <td style="text-align:right;"> $0.925$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SprBig in region 1 age comp, logistic-normal: $\sigma$ </td>
   <td style="text-align:right;"> $3.161$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SprBig in region 1 age comp, logistic-normal: $\rho$ </td>
   <td style="text-align:right;"> $0.694$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FallBig in region 1 age comp, logistic-normal: $\sigma$ </td>
   <td style="text-align:right;"> $4.261$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FallBig in region 1 age comp, logistic-normal: $\rho$ </td>
   <td style="text-align:right;"> $0.856$ </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
   <td style="text-align:right;"> -- </td>
  </tr>
</tbody>
</table>

### Abundance at age

<table class="table" style="margin-left: auto; margin-right: auto;">
<caption>Abundance at age (1000s) for stock 1 in region 1.</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> 1 </th>
   <th style="text-align:right;"> 2 </th>
   <th style="text-align:right;"> 3 </th>
   <th style="text-align:right;"> 4 </th>
   <th style="text-align:right;"> 5 </th>
   <th style="text-align:right;"> 6 </th>
   <th style="text-align:right;"> 7 </th>
   <th style="text-align:right;"> 8+ </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 1987 </td>
   <td style="text-align:right;"> 4209663 </td>
   <td style="text-align:right;"> 1788847 </td>
   <td style="text-align:right;"> 1043911 </td>
   <td style="text-align:right;"> 1169634 </td>
   <td style="text-align:right;"> 223645 </td>
   <td style="text-align:right;"> 81852 </td>
   <td style="text-align:right;"> 15874 </td>
   <td style="text-align:right;"> 4145 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1988 </td>
   <td style="text-align:right;"> 5392076 </td>
   <td style="text-align:right;"> 2795546 </td>
   <td style="text-align:right;"> 870094 </td>
   <td style="text-align:right;"> 608222 </td>
   <td style="text-align:right;"> 679001 </td>
   <td style="text-align:right;"> 133222 </td>
   <td style="text-align:right;"> 37546 </td>
   <td style="text-align:right;"> 8587 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1989 </td>
   <td style="text-align:right;"> 6820222 </td>
   <td style="text-align:right;"> 3551224 </td>
   <td style="text-align:right;"> 1154003 </td>
   <td style="text-align:right;"> 453523 </td>
   <td style="text-align:right;"> 310026 </td>
   <td style="text-align:right;"> 358080 </td>
   <td style="text-align:right;"> 64771 </td>
   <td style="text-align:right;"> 18252 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1990 </td>
   <td style="text-align:right;"> 7029735 </td>
   <td style="text-align:right;"> 4473201 </td>
   <td style="text-align:right;"> 1654465 </td>
   <td style="text-align:right;"> 638158 </td>
   <td style="text-align:right;"> 226381 </td>
   <td style="text-align:right;"> 151251 </td>
   <td style="text-align:right;"> 166656 </td>
   <td style="text-align:right;"> 34874 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 5614368 </td>
   <td style="text-align:right;"> 5133377 </td>
   <td style="text-align:right;"> 2286469 </td>
   <td style="text-align:right;"> 1069122 </td>
   <td style="text-align:right;"> 351129 </td>
   <td style="text-align:right;"> 121463 </td>
   <td style="text-align:right;"> 75341 </td>
   <td style="text-align:right;"> 94270 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1992 </td>
   <td style="text-align:right;"> 2592758 </td>
   <td style="text-align:right;"> 4065367 </td>
   <td style="text-align:right;"> 3200145 </td>
   <td style="text-align:right;"> 1417329 </td>
   <td style="text-align:right;"> 607942 </td>
   <td style="text-align:right;"> 186920 </td>
   <td style="text-align:right;"> 61040 </td>
   <td style="text-align:right;"> 75762 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1993 </td>
   <td style="text-align:right;"> 2654407 </td>
   <td style="text-align:right;"> 2240734 </td>
   <td style="text-align:right;"> 2124091 </td>
   <td style="text-align:right;"> 1826311 </td>
   <td style="text-align:right;"> 905461 </td>
   <td style="text-align:right;"> 305414 </td>
   <td style="text-align:right;"> 93856 </td>
   <td style="text-align:right;"> 58771 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1994 </td>
   <td style="text-align:right;"> 2843585 </td>
   <td style="text-align:right;"> 2289011 </td>
   <td style="text-align:right;"> 1067009 </td>
   <td style="text-align:right;"> 1313701 </td>
   <td style="text-align:right;"> 1072508 </td>
   <td style="text-align:right;"> 525438 </td>
   <td style="text-align:right;"> 162104 </td>
   <td style="text-align:right;"> 70658 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1995 </td>
   <td style="text-align:right;"> 9467148 </td>
   <td style="text-align:right;"> 2127270 </td>
   <td style="text-align:right;"> 1243090 </td>
   <td style="text-align:right;"> 682608 </td>
   <td style="text-align:right;"> 902508 </td>
   <td style="text-align:right;"> 620625 </td>
   <td style="text-align:right;"> 286416 </td>
   <td style="text-align:right;"> 121259 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1996 </td>
   <td style="text-align:right;"> 4039089 </td>
   <td style="text-align:right;"> 7247403 </td>
   <td style="text-align:right;"> 1220547 </td>
   <td style="text-align:right;"> 708443 </td>
   <td style="text-align:right;"> 418302 </td>
   <td style="text-align:right;"> 513596 </td>
   <td style="text-align:right;"> 285030 </td>
   <td style="text-align:right;"> 163326 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1997 </td>
   <td style="text-align:right;"> 5391778 </td>
   <td style="text-align:right;"> 2814701 </td>
   <td style="text-align:right;"> 4469142 </td>
   <td style="text-align:right;"> 721014 </td>
   <td style="text-align:right;"> 377642 </td>
   <td style="text-align:right;"> 262912 </td>
   <td style="text-align:right;"> 222425 </td>
   <td style="text-align:right;"> 166431 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1998 </td>
   <td style="text-align:right;"> 2098564 </td>
   <td style="text-align:right;"> 3859723 </td>
   <td style="text-align:right;"> 1616001 </td>
   <td style="text-align:right;"> 2365926 </td>
   <td style="text-align:right;"> 454176 </td>
   <td style="text-align:right;"> 199881 </td>
   <td style="text-align:right;"> 138292 </td>
   <td style="text-align:right;"> 149149 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1999 </td>
   <td style="text-align:right;"> 5949452 </td>
   <td style="text-align:right;"> 1579020 </td>
   <td style="text-align:right;"> 2034536 </td>
   <td style="text-align:right;"> 995276 </td>
   <td style="text-align:right;"> 1282806 </td>
   <td style="text-align:right;"> 259484 </td>
   <td style="text-align:right;"> 100128 </td>
   <td style="text-align:right;"> 115517 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2000 </td>
   <td style="text-align:right;"> 2116146 </td>
   <td style="text-align:right;"> 5084447 </td>
   <td style="text-align:right;"> 828298 </td>
   <td style="text-align:right;"> 1036998 </td>
   <td style="text-align:right;"> 709607 </td>
   <td style="text-align:right;"> 632103 </td>
   <td style="text-align:right;"> 127605 </td>
   <td style="text-align:right;"> 84738 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2001 </td>
   <td style="text-align:right;"> 1959321 </td>
   <td style="text-align:right;"> 1457571 </td>
   <td style="text-align:right;"> 3386026 </td>
   <td style="text-align:right;"> 526914 </td>
   <td style="text-align:right;"> 559707 </td>
   <td style="text-align:right;"> 426094 </td>
   <td style="text-align:right;"> 307068 </td>
   <td style="text-align:right;"> 90152 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2002 </td>
   <td style="text-align:right;"> 6821630 </td>
   <td style="text-align:right;"> 1403224 </td>
   <td style="text-align:right;"> 761471 </td>
   <td style="text-align:right;"> 1805335 </td>
   <td style="text-align:right;"> 374579 </td>
   <td style="text-align:right;"> 286920 </td>
   <td style="text-align:right;"> 203003 </td>
   <td style="text-align:right;"> 156458 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2003 </td>
   <td style="text-align:right;"> 5707106 </td>
   <td style="text-align:right;"> 4119363 </td>
   <td style="text-align:right;"> 874650 </td>
   <td style="text-align:right;"> 446403 </td>
   <td style="text-align:right;"> 884315 </td>
   <td style="text-align:right;"> 233752 </td>
   <td style="text-align:right;"> 140868 </td>
   <td style="text-align:right;"> 148755 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2004 </td>
   <td style="text-align:right;"> 2830279 </td>
   <td style="text-align:right;"> 4227078 </td>
   <td style="text-align:right;"> 2301194 </td>
   <td style="text-align:right;"> 490135 </td>
   <td style="text-align:right;"> 276896 </td>
   <td style="text-align:right;"> 357835 </td>
   <td style="text-align:right;"> 125013 </td>
   <td style="text-align:right;"> 103344 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 1521822 </td>
   <td style="text-align:right;"> 1931734 </td>
   <td style="text-align:right;"> 2307259 </td>
   <td style="text-align:right;"> 1110074 </td>
   <td style="text-align:right;"> 286322 </td>
   <td style="text-align:right;"> 157600 </td>
   <td style="text-align:right;"> 149525 </td>
   <td style="text-align:right;"> 88645 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 5092640 </td>
   <td style="text-align:right;"> 1057213 </td>
   <td style="text-align:right;"> 1228506 </td>
   <td style="text-align:right;"> 1182973 </td>
   <td style="text-align:right;"> 599453 </td>
   <td style="text-align:right;"> 152976 </td>
   <td style="text-align:right;"> 75039 </td>
   <td style="text-align:right;"> 89763 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 790978 </td>
   <td style="text-align:right;"> 3440610 </td>
   <td style="text-align:right;"> 684618 </td>
   <td style="text-align:right;"> 576324 </td>
   <td style="text-align:right;"> 573853 </td>
   <td style="text-align:right;"> 286042 </td>
   <td style="text-align:right;"> 66512 </td>
   <td style="text-align:right;"> 56062 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 2728729 </td>
   <td style="text-align:right;"> 534774 </td>
   <td style="text-align:right;"> 1802111 </td>
   <td style="text-align:right;"> 384502 </td>
   <td style="text-align:right;"> 260132 </td>
   <td style="text-align:right;"> 255865 </td>
   <td style="text-align:right;"> 121017 </td>
   <td style="text-align:right;"> 44500 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 10600926 </td>
   <td style="text-align:right;"> 1816603 </td>
   <td style="text-align:right;"> 413534 </td>
   <td style="text-align:right;"> 842610 </td>
   <td style="text-align:right;"> 178888 </td>
   <td style="text-align:right;"> 124109 </td>
   <td style="text-align:right;"> 100886 </td>
   <td style="text-align:right;"> 55507 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 1545067 </td>
   <td style="text-align:right;"> 7858687 </td>
   <td style="text-align:right;"> 1076722 </td>
   <td style="text-align:right;"> 198982 </td>
   <td style="text-align:right;"> 277091 </td>
   <td style="text-align:right;"> 53952 </td>
   <td style="text-align:right;"> 31702 </td>
   <td style="text-align:right;"> 25640 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 2331695 </td>
   <td style="text-align:right;"> 1092991 </td>
   <td style="text-align:right;"> 4401475 </td>
   <td style="text-align:right;"> 578517 </td>
   <td style="text-align:right;"> 105488 </td>
   <td style="text-align:right;"> 95175 </td>
   <td style="text-align:right;"> 19793 </td>
   <td style="text-align:right;"> 15394 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 6005658 </td>
   <td style="text-align:right;"> 1594330 </td>
   <td style="text-align:right;"> 660275 </td>
   <td style="text-align:right;"> 2329706 </td>
   <td style="text-align:right;"> 301762 </td>
   <td style="text-align:right;"> 52308 </td>
   <td style="text-align:right;"> 34326 </td>
   <td style="text-align:right;"> 11951 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 1337711 </td>
   <td style="text-align:right;"> 4440439 </td>
   <td style="text-align:right;"> 905445 </td>
   <td style="text-align:right;"> 424064 </td>
   <td style="text-align:right;"> 1186855 </td>
   <td style="text-align:right;"> 134297 </td>
   <td style="text-align:right;"> 21567 </td>
   <td style="text-align:right;"> 12877 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 1713660 </td>
   <td style="text-align:right;"> 875194 </td>
   <td style="text-align:right;"> 2705435 </td>
   <td style="text-align:right;"> 459138 </td>
   <td style="text-align:right;"> 240766 </td>
   <td style="text-align:right;"> 527327 </td>
   <td style="text-align:right;"> 54453 </td>
   <td style="text-align:right;"> 10777 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 579396 </td>
   <td style="text-align:right;"> 1196580 </td>
   <td style="text-align:right;"> 488654 </td>
   <td style="text-align:right;"> 1539198 </td>
   <td style="text-align:right;"> 237813 </td>
   <td style="text-align:right;"> 141206 </td>
   <td style="text-align:right;"> 230289 </td>
   <td style="text-align:right;"> 25730 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2016 </td>
   <td style="text-align:right;"> 221893 </td>
   <td style="text-align:right;"> 389687 </td>
   <td style="text-align:right;"> 687647 </td>
   <td style="text-align:right;"> 314815 </td>
   <td style="text-align:right;"> 725056 </td>
   <td style="text-align:right;"> 123061 </td>
   <td style="text-align:right;"> 66223 </td>
   <td style="text-align:right;"> 101762 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2017 </td>
   <td style="text-align:right;"> 879829 </td>
   <td style="text-align:right;"> 146682 </td>
   <td style="text-align:right;"> 235723 </td>
   <td style="text-align:right;"> 332058 </td>
   <td style="text-align:right;"> 174001 </td>
   <td style="text-align:right;"> 324296 </td>
   <td style="text-align:right;"> 54448 </td>
   <td style="text-align:right;"> 62489 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2018 </td>
   <td style="text-align:right;"> 428722 </td>
   <td style="text-align:right;"> 605611 </td>
   <td style="text-align:right;"> 87920 </td>
   <td style="text-align:right;"> 117235 </td>
   <td style="text-align:right;"> 143768 </td>
   <td style="text-align:right;"> 80903 </td>
   <td style="text-align:right;"> 120413 </td>
   <td style="text-align:right;"> 40971 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2019 </td>
   <td style="text-align:right;"> 1769015 </td>
   <td style="text-align:right;"> 289876 </td>
   <td style="text-align:right;"> 253845 </td>
   <td style="text-align:right;"> 36406 </td>
   <td style="text-align:right;"> 42684 </td>
   <td style="text-align:right;"> 39154 </td>
   <td style="text-align:right;"> 21009 </td>
   <td style="text-align:right;"> 28350 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2020 </td>
   <td style="text-align:right;"> 735427 </td>
   <td style="text-align:right;"> 951028 </td>
   <td style="text-align:right;"> 137828 </td>
   <td style="text-align:right;"> 101310 </td>
   <td style="text-align:right;"> 17344 </td>
   <td style="text-align:right;"> 17001 </td>
   <td style="text-align:right;"> 12502 </td>
   <td style="text-align:right;"> 12943 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2021 </td>
   <td style="text-align:right;"> 307087 </td>
   <td style="text-align:right;"> 507867 </td>
   <td style="text-align:right;"> 504141 </td>
   <td style="text-align:right;"> 90673 </td>
   <td style="text-align:right;"> 58390 </td>
   <td style="text-align:right;"> 8133 </td>
   <td style="text-align:right;"> 7370 </td>
   <td style="text-align:right;"> 9522 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2022 </td>
   <td style="text-align:right;"> 426001 </td>
   <td style="text-align:right;"> 205024 </td>
   <td style="text-align:right;"> 309680 </td>
   <td style="text-align:right;"> 280563 </td>
   <td style="text-align:right;"> 63095 </td>
   <td style="text-align:right;"> 37670 </td>
   <td style="text-align:right;"> 4256 </td>
   <td style="text-align:right;"> 7946 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2023 </td>
   <td style="text-align:right;"> 2166176 </td>
   <td style="text-align:right;"> 277020 </td>
   <td style="text-align:right;"> 141811 </td>
   <td style="text-align:right;"> 176007 </td>
   <td style="text-align:right;"> 181819 </td>
   <td style="text-align:right;"> 43760 </td>
   <td style="text-align:right;"> 22553 </td>
   <td style="text-align:right;"> 6171 </td>
  </tr>
</tbody>
</table>

### Fishing mortality at age by region

<table class="table" style="margin-left: auto; margin-right: auto;">
<caption>Total fishing mortality at age in region 1.</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> 1 </th>
   <th style="text-align:right;"> 2 </th>
   <th style="text-align:right;"> 3 </th>
   <th style="text-align:right;"> 4 </th>
   <th style="text-align:right;"> 5 </th>
   <th style="text-align:right;"> 6 </th>
   <th style="text-align:right;"> 7 </th>
   <th style="text-align:right;"> 8+ </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 1987 </td>
   <td style="text-align:right;"> 0.014 </td>
   <td style="text-align:right;"> 0.384 </td>
   <td style="text-align:right;"> 0.229 </td>
   <td style="text-align:right;"> 0.231 </td>
   <td style="text-align:right;"> 0.292 </td>
   <td style="text-align:right;"> 0.376 </td>
   <td style="text-align:right;"> 0.484 </td>
   <td style="text-align:right;"> 0.543 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1988 </td>
   <td style="text-align:right;"> 0.021 </td>
   <td style="text-align:right;"> 0.571 </td>
   <td style="text-align:right;"> 0.293 </td>
   <td style="text-align:right;"> 0.282 </td>
   <td style="text-align:right;"> 0.350 </td>
   <td style="text-align:right;"> 0.448 </td>
   <td style="text-align:right;"> 0.576 </td>
   <td style="text-align:right;"> 0.665 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1989 </td>
   <td style="text-align:right;"> 0.018 </td>
   <td style="text-align:right;"> 0.500 </td>
   <td style="text-align:right;"> 0.280 </td>
   <td style="text-align:right;"> 0.278 </td>
   <td style="text-align:right;"> 0.348 </td>
   <td style="text-align:right;"> 0.448 </td>
   <td style="text-align:right;"> 0.577 </td>
   <td style="text-align:right;"> 0.653 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1990 </td>
   <td style="text-align:right;"> 0.012 </td>
   <td style="text-align:right;"> 0.347 </td>
   <td style="text-align:right;"> 0.208 </td>
   <td style="text-align:right;"> 0.211 </td>
   <td style="text-align:right;"> 0.266 </td>
   <td style="text-align:right;"> 0.344 </td>
   <td style="text-align:right;"> 0.443 </td>
   <td style="text-align:right;"> 0.495 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 0.006 </td>
   <td style="text-align:right;"> 0.180 </td>
   <td style="text-align:right;"> 0.187 </td>
   <td style="text-align:right;"> 0.215 </td>
   <td style="text-align:right;"> 0.280 </td>
   <td style="text-align:right;"> 0.366 </td>
   <td style="text-align:right;"> 0.473 </td>
   <td style="text-align:right;"> 0.496 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1992 </td>
   <td style="text-align:right;"> 0.008 </td>
   <td style="text-align:right;"> 0.243 </td>
   <td style="text-align:right;"> 0.194 </td>
   <td style="text-align:right;"> 0.212 </td>
   <td style="text-align:right;"> 0.273 </td>
   <td style="text-align:right;"> 0.354 </td>
   <td style="text-align:right;"> 0.457 </td>
   <td style="text-align:right;"> 0.492 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1993 </td>
   <td style="text-align:right;"> 0.011 </td>
   <td style="text-align:right;"> 0.315 </td>
   <td style="text-align:right;"> 0.179 </td>
   <td style="text-align:right;"> 0.178 </td>
   <td style="text-align:right;"> 0.223 </td>
   <td style="text-align:right;"> 0.287 </td>
   <td style="text-align:right;"> 0.370 </td>
   <td style="text-align:right;"> 0.418 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1994 </td>
   <td style="text-align:right;"> 0.009 </td>
   <td style="text-align:right;"> 0.246 </td>
   <td style="text-align:right;"> 0.146 </td>
   <td style="text-align:right;"> 0.147 </td>
   <td style="text-align:right;"> 0.186 </td>
   <td style="text-align:right;"> 0.239 </td>
   <td style="text-align:right;"> 0.308 </td>
   <td style="text-align:right;"> 0.345 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1995 </td>
   <td style="text-align:right;"> 0.006 </td>
   <td style="text-align:right;"> 0.185 </td>
   <td style="text-align:right;"> 0.196 </td>
   <td style="text-align:right;"> 0.226 </td>
   <td style="text-align:right;"> 0.295 </td>
   <td style="text-align:right;"> 0.385 </td>
   <td style="text-align:right;"> 0.497 </td>
   <td style="text-align:right;"> 0.521 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1996 </td>
   <td style="text-align:right;"> 0.002 </td>
   <td style="text-align:right;"> 0.106 </td>
   <td style="text-align:right;"> 0.199 </td>
   <td style="text-align:right;"> 0.245 </td>
   <td style="text-align:right;"> 0.325 </td>
   <td style="text-align:right;"> 0.426 </td>
   <td style="text-align:right;"> 0.552 </td>
   <td style="text-align:right;"> 0.561 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1997 </td>
   <td style="text-align:right;"> 0.004 </td>
   <td style="text-align:right;"> 0.150 </td>
   <td style="text-align:right;"> 0.190 </td>
   <td style="text-align:right;"> 0.225 </td>
   <td style="text-align:right;"> 0.295 </td>
   <td style="text-align:right;"> 0.386 </td>
   <td style="text-align:right;"> 0.499 </td>
   <td style="text-align:right;"> 0.517 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1998 </td>
   <td style="text-align:right;"> 0.006 </td>
   <td style="text-align:right;"> 0.197 </td>
   <td style="text-align:right;"> 0.200 </td>
   <td style="text-align:right;"> 0.229 </td>
   <td style="text-align:right;"> 0.298 </td>
   <td style="text-align:right;"> 0.389 </td>
   <td style="text-align:right;"> 0.502 </td>
   <td style="text-align:right;"> 0.528 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1999 </td>
   <td style="text-align:right;"> 0.007 </td>
   <td style="text-align:right;"> 0.212 </td>
   <td style="text-align:right;"> 0.215 </td>
   <td style="text-align:right;"> 0.246 </td>
   <td style="text-align:right;"> 0.321 </td>
   <td style="text-align:right;"> 0.419 </td>
   <td style="text-align:right;"> 0.541 </td>
   <td style="text-align:right;"> 0.569 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2000 </td>
   <td style="text-align:right;"> 0.003 </td>
   <td style="text-align:right;"> 0.104 </td>
   <td style="text-align:right;"> 0.178 </td>
   <td style="text-align:right;"> 0.218 </td>
   <td style="text-align:right;"> 0.288 </td>
   <td style="text-align:right;"> 0.378 </td>
   <td style="text-align:right;"> 0.489 </td>
   <td style="text-align:right;"> 0.499 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2001 </td>
   <td style="text-align:right;"> 0.007 </td>
   <td style="text-align:right;"> 0.224 </td>
   <td style="text-align:right;"> 0.216 </td>
   <td style="text-align:right;"> 0.245 </td>
   <td style="text-align:right;"> 0.319 </td>
   <td style="text-align:right;"> 0.416 </td>
   <td style="text-align:right;"> 0.537 </td>
   <td style="text-align:right;"> 0.567 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2002 </td>
   <td style="text-align:right;"> 0.005 </td>
   <td style="text-align:right;"> 0.167 </td>
   <td style="text-align:right;"> 0.194 </td>
   <td style="text-align:right;"> 0.226 </td>
   <td style="text-align:right;"> 0.296 </td>
   <td style="text-align:right;"> 0.387 </td>
   <td style="text-align:right;"> 0.501 </td>
   <td style="text-align:right;"> 0.521 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2003 </td>
   <td style="text-align:right;"> 0.002 </td>
   <td style="text-align:right;"> 0.107 </td>
   <td style="text-align:right;"> 0.217 </td>
   <td style="text-align:right;"> 0.268 </td>
   <td style="text-align:right;"> 0.356 </td>
   <td style="text-align:right;"> 0.468 </td>
   <td style="text-align:right;"> 0.606 </td>
   <td style="text-align:right;"> 0.614 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2004 </td>
   <td style="text-align:right;"> 0.005 </td>
   <td style="text-align:right;"> 0.182 </td>
   <td style="text-align:right;"> 0.221 </td>
   <td style="text-align:right;"> 0.260 </td>
   <td style="text-align:right;"> 0.341 </td>
   <td style="text-align:right;"> 0.446 </td>
   <td style="text-align:right;"> 0.577 </td>
   <td style="text-align:right;"> 0.599 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.005 </td>
   <td style="text-align:right;"> 0.180 </td>
   <td style="text-align:right;"> 0.223 </td>
   <td style="text-align:right;"> 0.262 </td>
   <td style="text-align:right;"> 0.344 </td>
   <td style="text-align:right;"> 0.450 </td>
   <td style="text-align:right;"> 0.582 </td>
   <td style="text-align:right;"> 0.604 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.006 </td>
   <td style="text-align:right;"> 0.220 </td>
   <td style="text-align:right;"> 0.272 </td>
   <td style="text-align:right;"> 0.320 </td>
   <td style="text-align:right;"> 0.421 </td>
   <td style="text-align:right;"> 0.550 </td>
   <td style="text-align:right;"> 0.712 </td>
   <td style="text-align:right;"> 0.738 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.009 </td>
   <td style="text-align:right;"> 0.279 </td>
   <td style="text-align:right;"> 0.280 </td>
   <td style="text-align:right;"> 0.320 </td>
   <td style="text-align:right;"> 0.417 </td>
   <td style="text-align:right;"> 0.544 </td>
   <td style="text-align:right;"> 0.703 </td>
   <td style="text-align:right;"> 0.739 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.005 </td>
   <td style="text-align:right;"> 0.184 </td>
   <td style="text-align:right;"> 0.268 </td>
   <td style="text-align:right;"> 0.322 </td>
   <td style="text-align:right;"> 0.424 </td>
   <td style="text-align:right;"> 0.556 </td>
   <td style="text-align:right;"> 0.719 </td>
   <td style="text-align:right;"> 0.739 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.003 </td>
   <td style="text-align:right;"> 0.177 </td>
   <td style="text-align:right;"> 0.477 </td>
   <td style="text-align:right;"> 0.601 </td>
   <td style="text-align:right;"> 0.802 </td>
   <td style="text-align:right;"> 1.054 </td>
   <td style="text-align:right;"> 1.365 </td>
   <td style="text-align:right;"> 1.373 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.002 </td>
   <td style="text-align:right;"> 0.131 </td>
   <td style="text-align:right;"> 0.313 </td>
   <td style="text-align:right;"> 0.392 </td>
   <td style="text-align:right;"> 0.522 </td>
   <td style="text-align:right;"> 0.686 </td>
   <td style="text-align:right;"> 0.888 </td>
   <td style="text-align:right;"> 0.896 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.002 </td>
   <td style="text-align:right;"> 0.113 </td>
   <td style="text-align:right;"> 0.256 </td>
   <td style="text-align:right;"> 0.319 </td>
   <td style="text-align:right;"> 0.425 </td>
   <td style="text-align:right;"> 0.558 </td>
   <td style="text-align:right;"> 0.722 </td>
   <td style="text-align:right;"> 0.730 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:right;"> 0.080 </td>
   <td style="text-align:right;"> 0.272 </td>
   <td style="text-align:right;"> 0.346 </td>
   <td style="text-align:right;"> 0.464 </td>
   <td style="text-align:right;"> 0.610 </td>
   <td style="text-align:right;"> 0.790 </td>
   <td style="text-align:right;"> 0.791 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:right;"> 0.102 </td>
   <td style="text-align:right;"> 0.277 </td>
   <td style="text-align:right;"> 0.348 </td>
   <td style="text-align:right;"> 0.465 </td>
   <td style="text-align:right;"> 0.611 </td>
   <td style="text-align:right;"> 0.792 </td>
   <td style="text-align:right;"> 0.797 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:right;"> 0.076 </td>
   <td style="text-align:right;"> 0.210 </td>
   <td style="text-align:right;"> 0.265 </td>
   <td style="text-align:right;"> 0.354 </td>
   <td style="text-align:right;"> 0.465 </td>
   <td style="text-align:right;"> 0.603 </td>
   <td style="text-align:right;"> 0.606 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:right;"> 0.069 </td>
   <td style="text-align:right;"> 0.210 </td>
   <td style="text-align:right;"> 0.266 </td>
   <td style="text-align:right;"> 0.356 </td>
   <td style="text-align:right;"> 0.468 </td>
   <td style="text-align:right;"> 0.606 </td>
   <td style="text-align:right;"> 0.608 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2016 </td>
   <td style="text-align:right;"> 0.005 </td>
   <td style="text-align:right;"> 0.187 </td>
   <td style="text-align:right;"> 0.249 </td>
   <td style="text-align:right;"> 0.296 </td>
   <td style="text-align:right;"> 0.389 </td>
   <td style="text-align:right;"> 0.509 </td>
   <td style="text-align:right;"> 0.659 </td>
   <td style="text-align:right;"> 0.680 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2017 </td>
   <td style="text-align:right;"> 0.005 </td>
   <td style="text-align:right;"> 0.189 </td>
   <td style="text-align:right;"> 0.285 </td>
   <td style="text-align:right;"> 0.343 </td>
   <td style="text-align:right;"> 0.453 </td>
   <td style="text-align:right;"> 0.593 </td>
   <td style="text-align:right;"> 0.768 </td>
   <td style="text-align:right;"> 0.788 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2018 </td>
   <td style="text-align:right;"> 0.019 </td>
   <td style="text-align:right;"> 0.582 </td>
   <td style="text-align:right;"> 0.552 </td>
   <td style="text-align:right;"> 0.623 </td>
   <td style="text-align:right;"> 0.811 </td>
   <td style="text-align:right;"> 1.056 </td>
   <td style="text-align:right;"> 1.365 </td>
   <td style="text-align:right;"> 1.443 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2019 </td>
   <td style="text-align:right;"> 0.023 </td>
   <td style="text-align:right;"> 0.657 </td>
   <td style="text-align:right;"> 0.402 </td>
   <td style="text-align:right;"> 0.411 </td>
   <td style="text-align:right;"> 0.520 </td>
   <td style="text-align:right;"> 0.671 </td>
   <td style="text-align:right;"> 0.864 </td>
   <td style="text-align:right;"> 0.963 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2020 </td>
   <td style="text-align:right;"> 0.006 </td>
   <td style="text-align:right;"> 0.198 </td>
   <td style="text-align:right;"> 0.201 </td>
   <td style="text-align:right;"> 0.231 </td>
   <td style="text-align:right;"> 0.301 </td>
   <td style="text-align:right;"> 0.392 </td>
   <td style="text-align:right;"> 0.507 </td>
   <td style="text-align:right;"> 0.533 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2021 </td>
   <td style="text-align:right;"> 0.005 </td>
   <td style="text-align:right;"> 0.144 </td>
   <td style="text-align:right;"> 0.109 </td>
   <td style="text-align:right;"> 0.118 </td>
   <td style="text-align:right;"> 0.152 </td>
   <td style="text-align:right;"> 0.197 </td>
   <td style="text-align:right;"> 0.254 </td>
   <td style="text-align:right;"> 0.275 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2022 </td>
   <td style="text-align:right;"> 0.008 </td>
   <td style="text-align:right;"> 0.213 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.078 </td>
   <td style="text-align:right;"> 0.094 </td>
   <td style="text-align:right;"> 0.119 </td>
   <td style="text-align:right;"> 0.152 </td>
   <td style="text-align:right;"> 0.187 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2023 </td>
   <td style="text-align:right;"> 0.002 </td>
   <td style="text-align:right;"> 0.084 </td>
   <td style="text-align:right;"> 0.121 </td>
   <td style="text-align:right;"> 0.144 </td>
   <td style="text-align:right;"> 0.191 </td>
   <td style="text-align:right;"> 0.250 </td>
   <td style="text-align:right;"> 0.323 </td>
   <td style="text-align:right;"> 0.332 </td>
  </tr>
</tbody>
</table>

### Fishing mortality at age by fleet

<table class="table" style="margin-left: auto; margin-right: auto;">
<caption>Total fishing mortality at age in Mobile.</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> 1 </th>
   <th style="text-align:right;"> 2 </th>
   <th style="text-align:right;"> 3 </th>
   <th style="text-align:right;"> 4 </th>
   <th style="text-align:right;"> 5 </th>
   <th style="text-align:right;"> 6 </th>
   <th style="text-align:right;"> 7 </th>
   <th style="text-align:right;"> 8+ </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 1987 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.041 </td>
   <td style="text-align:right;"> 0.150 </td>
   <td style="text-align:right;"> 0.192 </td>
   <td style="text-align:right;"> 0.257 </td>
   <td style="text-align:right;"> 0.338 </td>
   <td style="text-align:right;"> 0.438 </td>
   <td style="text-align:right;"> 0.438 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1988 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.048 </td>
   <td style="text-align:right;"> 0.174 </td>
   <td style="text-align:right;"> 0.222 </td>
   <td style="text-align:right;"> 0.297 </td>
   <td style="text-align:right;"> 0.391 </td>
   <td style="text-align:right;"> 0.506 </td>
   <td style="text-align:right;"> 0.506 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1989 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.049 </td>
   <td style="text-align:right;"> 0.177 </td>
   <td style="text-align:right;"> 0.226 </td>
   <td style="text-align:right;"> 0.303 </td>
   <td style="text-align:right;"> 0.398 </td>
   <td style="text-align:right;"> 0.516 </td>
   <td style="text-align:right;"> 0.516 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1990 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.038 </td>
   <td style="text-align:right;"> 0.138 </td>
   <td style="text-align:right;"> 0.176 </td>
   <td style="text-align:right;"> 0.235 </td>
   <td style="text-align:right;"> 0.310 </td>
   <td style="text-align:right;"> 0.401 </td>
   <td style="text-align:right;"> 0.401 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.043 </td>
   <td style="text-align:right;"> 0.156 </td>
   <td style="text-align:right;"> 0.199 </td>
   <td style="text-align:right;"> 0.267 </td>
   <td style="text-align:right;"> 0.351 </td>
   <td style="text-align:right;"> 0.454 </td>
   <td style="text-align:right;"> 0.454 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1992 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.041 </td>
   <td style="text-align:right;"> 0.148 </td>
   <td style="text-align:right;"> 0.188 </td>
   <td style="text-align:right;"> 0.252 </td>
   <td style="text-align:right;"> 0.332 </td>
   <td style="text-align:right;"> 0.430 </td>
   <td style="text-align:right;"> 0.430 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1993 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.031 </td>
   <td style="text-align:right;"> 0.114 </td>
   <td style="text-align:right;"> 0.145 </td>
   <td style="text-align:right;"> 0.195 </td>
   <td style="text-align:right;"> 0.256 </td>
   <td style="text-align:right;"> 0.332 </td>
   <td style="text-align:right;"> 0.332 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1994 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.026 </td>
   <td style="text-align:right;"> 0.096 </td>
   <td style="text-align:right;"> 0.122 </td>
   <td style="text-align:right;"> 0.163 </td>
   <td style="text-align:right;"> 0.215 </td>
   <td style="text-align:right;"> 0.279 </td>
   <td style="text-align:right;"> 0.279 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1995 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.045 </td>
   <td style="text-align:right;"> 0.164 </td>
   <td style="text-align:right;"> 0.210 </td>
   <td style="text-align:right;"> 0.281 </td>
   <td style="text-align:right;"> 0.369 </td>
   <td style="text-align:right;"> 0.478 </td>
   <td style="text-align:right;"> 0.478 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1996 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.052 </td>
   <td style="text-align:right;"> 0.187 </td>
   <td style="text-align:right;"> 0.239 </td>
   <td style="text-align:right;"> 0.320 </td>
   <td style="text-align:right;"> 0.420 </td>
   <td style="text-align:right;"> 0.545 </td>
   <td style="text-align:right;"> 0.545 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1997 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.046 </td>
   <td style="text-align:right;"> 0.166 </td>
   <td style="text-align:right;"> 0.213 </td>
   <td style="text-align:right;"> 0.285 </td>
   <td style="text-align:right;"> 0.375 </td>
   <td style="text-align:right;"> 0.485 </td>
   <td style="text-align:right;"> 0.485 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1998 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.046 </td>
   <td style="text-align:right;"> 0.165 </td>
   <td style="text-align:right;"> 0.211 </td>
   <td style="text-align:right;"> 0.283 </td>
   <td style="text-align:right;"> 0.372 </td>
   <td style="text-align:right;"> 0.482 </td>
   <td style="text-align:right;"> 0.482 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1999 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.049 </td>
   <td style="text-align:right;"> 0.178 </td>
   <td style="text-align:right;"> 0.227 </td>
   <td style="text-align:right;"> 0.305 </td>
   <td style="text-align:right;"> 0.401 </td>
   <td style="text-align:right;"> 0.519 </td>
   <td style="text-align:right;"> 0.519 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2000 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.046 </td>
   <td style="text-align:right;"> 0.165 </td>
   <td style="text-align:right;"> 0.211 </td>
   <td style="text-align:right;"> 0.282 </td>
   <td style="text-align:right;"> 0.372 </td>
   <td style="text-align:right;"> 0.481 </td>
   <td style="text-align:right;"> 0.481 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2001 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.049 </td>
   <td style="text-align:right;"> 0.176 </td>
   <td style="text-align:right;"> 0.225 </td>
   <td style="text-align:right;"> 0.301 </td>
   <td style="text-align:right;"> 0.397 </td>
   <td style="text-align:right;"> 0.514 </td>
   <td style="text-align:right;"> 0.514 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2002 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.046 </td>
   <td style="text-align:right;"> 0.166 </td>
   <td style="text-align:right;"> 0.212 </td>
   <td style="text-align:right;"> 0.284 </td>
   <td style="text-align:right;"> 0.374 </td>
   <td style="text-align:right;"> 0.484 </td>
   <td style="text-align:right;"> 0.484 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2003 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.057 </td>
   <td style="text-align:right;"> 0.205 </td>
   <td style="text-align:right;"> 0.262 </td>
   <td style="text-align:right;"> 0.351 </td>
   <td style="text-align:right;"> 0.462 </td>
   <td style="text-align:right;"> 0.599 </td>
   <td style="text-align:right;"> 0.599 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2004 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.053 </td>
   <td style="text-align:right;"> 0.192 </td>
   <td style="text-align:right;"> 0.245 </td>
   <td style="text-align:right;"> 0.328 </td>
   <td style="text-align:right;"> 0.432 </td>
   <td style="text-align:right;"> 0.560 </td>
   <td style="text-align:right;"> 0.560 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.053 </td>
   <td style="text-align:right;"> 0.194 </td>
   <td style="text-align:right;"> 0.247 </td>
   <td style="text-align:right;"> 0.331 </td>
   <td style="text-align:right;"> 0.436 </td>
   <td style="text-align:right;"> 0.565 </td>
   <td style="text-align:right;"> 0.565 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.065 </td>
   <td style="text-align:right;"> 0.237 </td>
   <td style="text-align:right;"> 0.303 </td>
   <td style="text-align:right;"> 0.405 </td>
   <td style="text-align:right;"> 0.533 </td>
   <td style="text-align:right;"> 0.691 </td>
   <td style="text-align:right;"> 0.691 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.064 </td>
   <td style="text-align:right;"> 0.231 </td>
   <td style="text-align:right;"> 0.295 </td>
   <td style="text-align:right;"> 0.395 </td>
   <td style="text-align:right;"> 0.520 </td>
   <td style="text-align:right;"> 0.674 </td>
   <td style="text-align:right;"> 0.674 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.066 </td>
   <td style="text-align:right;"> 0.241 </td>
   <td style="text-align:right;"> 0.308 </td>
   <td style="text-align:right;"> 0.412 </td>
   <td style="text-align:right;"> 0.543 </td>
   <td style="text-align:right;"> 0.703 </td>
   <td style="text-align:right;"> 0.703 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:right;"> 0.128 </td>
   <td style="text-align:right;"> 0.466 </td>
   <td style="text-align:right;"> 0.595 </td>
   <td style="text-align:right;"> 0.797 </td>
   <td style="text-align:right;"> 1.049 </td>
   <td style="text-align:right;"> 1.359 </td>
   <td style="text-align:right;"> 1.359 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.302 </td>
   <td style="text-align:right;"> 0.386 </td>
   <td style="text-align:right;"> 0.517 </td>
   <td style="text-align:right;"> 0.681 </td>
   <td style="text-align:right;"> 0.882 </td>
   <td style="text-align:right;"> 0.882 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.068 </td>
   <td style="text-align:right;"> 0.246 </td>
   <td style="text-align:right;"> 0.314 </td>
   <td style="text-align:right;"> 0.420 </td>
   <td style="text-align:right;"> 0.553 </td>
   <td style="text-align:right;"> 0.716 </td>
   <td style="text-align:right;"> 0.716 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.075 </td>
   <td style="text-align:right;"> 0.271 </td>
   <td style="text-align:right;"> 0.346 </td>
   <td style="text-align:right;"> 0.463 </td>
   <td style="text-align:right;"> 0.609 </td>
   <td style="text-align:right;"> 0.789 </td>
   <td style="text-align:right;"> 0.789 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.075 </td>
   <td style="text-align:right;"> 0.270 </td>
   <td style="text-align:right;"> 0.345 </td>
   <td style="text-align:right;"> 0.462 </td>
   <td style="text-align:right;"> 0.608 </td>
   <td style="text-align:right;"> 0.788 </td>
   <td style="text-align:right;"> 0.788 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.057 </td>
   <td style="text-align:right;"> 0.206 </td>
   <td style="text-align:right;"> 0.263 </td>
   <td style="text-align:right;"> 0.352 </td>
   <td style="text-align:right;"> 0.463 </td>
   <td style="text-align:right;"> 0.600 </td>
   <td style="text-align:right;"> 0.600 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.057 </td>
   <td style="text-align:right;"> 0.207 </td>
   <td style="text-align:right;"> 0.265 </td>
   <td style="text-align:right;"> 0.355 </td>
   <td style="text-align:right;"> 0.467 </td>
   <td style="text-align:right;"> 0.605 </td>
   <td style="text-align:right;"> 0.605 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2016 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.061 </td>
   <td style="text-align:right;"> 0.220 </td>
   <td style="text-align:right;"> 0.281 </td>
   <td style="text-align:right;"> 0.376 </td>
   <td style="text-align:right;"> 0.495 </td>
   <td style="text-align:right;"> 0.642 </td>
   <td style="text-align:right;"> 0.642 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2017 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.071 </td>
   <td style="text-align:right;"> 0.258 </td>
   <td style="text-align:right;"> 0.329 </td>
   <td style="text-align:right;"> 0.441 </td>
   <td style="text-align:right;"> 0.580 </td>
   <td style="text-align:right;"> 0.752 </td>
   <td style="text-align:right;"> 0.752 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2018 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:right;"> 0.123 </td>
   <td style="text-align:right;"> 0.447 </td>
   <td style="text-align:right;"> 0.571 </td>
   <td style="text-align:right;"> 0.764 </td>
   <td style="text-align:right;"> 1.005 </td>
   <td style="text-align:right;"> 1.303 </td>
   <td style="text-align:right;"> 1.303 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2019 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.074 </td>
   <td style="text-align:right;"> 0.269 </td>
   <td style="text-align:right;"> 0.344 </td>
   <td style="text-align:right;"> 0.461 </td>
   <td style="text-align:right;"> 0.606 </td>
   <td style="text-align:right;"> 0.786 </td>
   <td style="text-align:right;"> 0.786 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2020 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.046 </td>
   <td style="text-align:right;"> 0.167 </td>
   <td style="text-align:right;"> 0.213 </td>
   <td style="text-align:right;"> 0.285 </td>
   <td style="text-align:right;"> 0.375 </td>
   <td style="text-align:right;"> 0.486 </td>
   <td style="text-align:right;"> 0.486 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2021 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.023 </td>
   <td style="text-align:right;"> 0.082 </td>
   <td style="text-align:right;"> 0.104 </td>
   <td style="text-align:right;"> 0.140 </td>
   <td style="text-align:right;"> 0.184 </td>
   <td style="text-align:right;"> 0.238 </td>
   <td style="text-align:right;"> 0.238 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2022 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.012 </td>
   <td style="text-align:right;"> 0.043 </td>
   <td style="text-align:right;"> 0.055 </td>
   <td style="text-align:right;"> 0.074 </td>
   <td style="text-align:right;"> 0.097 </td>
   <td style="text-align:right;"> 0.125 </td>
   <td style="text-align:right;"> 0.125 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2023 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.030 </td>
   <td style="text-align:right;"> 0.108 </td>
   <td style="text-align:right;"> 0.138 </td>
   <td style="text-align:right;"> 0.185 </td>
   <td style="text-align:right;"> 0.244 </td>
   <td style="text-align:right;"> 0.316 </td>
   <td style="text-align:right;"> 0.316 </td>
  </tr>
</tbody>
</table>

<table class="table" style="margin-left: auto; margin-right: auto;">
<caption>Total fishing mortality at age in Fixed.</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> 1 </th>
   <th style="text-align:right;"> 2 </th>
   <th style="text-align:right;"> 3 </th>
   <th style="text-align:right;"> 4 </th>
   <th style="text-align:right;"> 5 </th>
   <th style="text-align:right;"> 6 </th>
   <th style="text-align:right;"> 7 </th>
   <th style="text-align:right;"> 8+ </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 1987 </td>
   <td style="text-align:right;"> 0.013 </td>
   <td style="text-align:right;"> 0.343 </td>
   <td style="text-align:right;"> 0.078 </td>
   <td style="text-align:right;"> 0.039 </td>
   <td style="text-align:right;"> 0.035 </td>
   <td style="text-align:right;"> 0.038 </td>
   <td style="text-align:right;"> 0.046 </td>
   <td style="text-align:right;"> 0.104 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1988 </td>
   <td style="text-align:right;"> 0.020 </td>
   <td style="text-align:right;"> 0.523 </td>
   <td style="text-align:right;"> 0.119 </td>
   <td style="text-align:right;"> 0.060 </td>
   <td style="text-align:right;"> 0.053 </td>
   <td style="text-align:right;"> 0.058 </td>
   <td style="text-align:right;"> 0.070 </td>
   <td style="text-align:right;"> 0.159 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1989 </td>
   <td style="text-align:right;"> 0.018 </td>
   <td style="text-align:right;"> 0.451 </td>
   <td style="text-align:right;"> 0.103 </td>
   <td style="text-align:right;"> 0.052 </td>
   <td style="text-align:right;"> 0.046 </td>
   <td style="text-align:right;"> 0.050 </td>
   <td style="text-align:right;"> 0.061 </td>
   <td style="text-align:right;"> 0.138 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1990 </td>
   <td style="text-align:right;"> 0.012 </td>
   <td style="text-align:right;"> 0.309 </td>
   <td style="text-align:right;"> 0.071 </td>
   <td style="text-align:right;"> 0.035 </td>
   <td style="text-align:right;"> 0.031 </td>
   <td style="text-align:right;"> 0.034 </td>
   <td style="text-align:right;"> 0.042 </td>
   <td style="text-align:right;"> 0.094 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 0.005 </td>
   <td style="text-align:right;"> 0.137 </td>
   <td style="text-align:right;"> 0.031 </td>
   <td style="text-align:right;"> 0.016 </td>
   <td style="text-align:right;"> 0.014 </td>
   <td style="text-align:right;"> 0.015 </td>
   <td style="text-align:right;"> 0.018 </td>
   <td style="text-align:right;"> 0.042 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1992 </td>
   <td style="text-align:right;"> 0.008 </td>
   <td style="text-align:right;"> 0.202 </td>
   <td style="text-align:right;"> 0.046 </td>
   <td style="text-align:right;"> 0.023 </td>
   <td style="text-align:right;"> 0.020 </td>
   <td style="text-align:right;"> 0.022 </td>
   <td style="text-align:right;"> 0.027 </td>
   <td style="text-align:right;"> 0.062 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1993 </td>
   <td style="text-align:right;"> 0.011 </td>
   <td style="text-align:right;"> 0.284 </td>
   <td style="text-align:right;"> 0.065 </td>
   <td style="text-align:right;"> 0.033 </td>
   <td style="text-align:right;"> 0.029 </td>
   <td style="text-align:right;"> 0.031 </td>
   <td style="text-align:right;"> 0.038 </td>
   <td style="text-align:right;"> 0.087 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1994 </td>
   <td style="text-align:right;"> 0.009 </td>
   <td style="text-align:right;"> 0.219 </td>
   <td style="text-align:right;"> 0.050 </td>
   <td style="text-align:right;"> 0.025 </td>
   <td style="text-align:right;"> 0.022 </td>
   <td style="text-align:right;"> 0.024 </td>
   <td style="text-align:right;"> 0.030 </td>
   <td style="text-align:right;"> 0.067 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1995 </td>
   <td style="text-align:right;"> 0.005 </td>
   <td style="text-align:right;"> 0.140 </td>
   <td style="text-align:right;"> 0.032 </td>
   <td style="text-align:right;"> 0.016 </td>
   <td style="text-align:right;"> 0.014 </td>
   <td style="text-align:right;"> 0.015 </td>
   <td style="text-align:right;"> 0.019 </td>
   <td style="text-align:right;"> 0.043 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1996 </td>
   <td style="text-align:right;"> 0.002 </td>
   <td style="text-align:right;"> 0.055 </td>
   <td style="text-align:right;"> 0.012 </td>
   <td style="text-align:right;"> 0.006 </td>
   <td style="text-align:right;"> 0.006 </td>
   <td style="text-align:right;"> 0.006 </td>
   <td style="text-align:right;"> 0.007 </td>
   <td style="text-align:right;"> 0.017 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1997 </td>
   <td style="text-align:right;"> 0.004 </td>
   <td style="text-align:right;"> 0.104 </td>
   <td style="text-align:right;"> 0.024 </td>
   <td style="text-align:right;"> 0.012 </td>
   <td style="text-align:right;"> 0.011 </td>
   <td style="text-align:right;"> 0.012 </td>
   <td style="text-align:right;"> 0.014 </td>
   <td style="text-align:right;"> 0.032 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1998 </td>
   <td style="text-align:right;"> 0.006 </td>
   <td style="text-align:right;"> 0.152 </td>
   <td style="text-align:right;"> 0.035 </td>
   <td style="text-align:right;"> 0.017 </td>
   <td style="text-align:right;"> 0.015 </td>
   <td style="text-align:right;"> 0.017 </td>
   <td style="text-align:right;"> 0.020 </td>
   <td style="text-align:right;"> 0.046 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1999 </td>
   <td style="text-align:right;"> 0.006 </td>
   <td style="text-align:right;"> 0.163 </td>
   <td style="text-align:right;"> 0.037 </td>
   <td style="text-align:right;"> 0.019 </td>
   <td style="text-align:right;"> 0.016 </td>
   <td style="text-align:right;"> 0.018 </td>
   <td style="text-align:right;"> 0.022 </td>
   <td style="text-align:right;"> 0.050 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2000 </td>
   <td style="text-align:right;"> 0.002 </td>
   <td style="text-align:right;"> 0.059 </td>
   <td style="text-align:right;"> 0.013 </td>
   <td style="text-align:right;"> 0.007 </td>
   <td style="text-align:right;"> 0.006 </td>
   <td style="text-align:right;"> 0.006 </td>
   <td style="text-align:right;"> 0.008 </td>
   <td style="text-align:right;"> 0.018 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2001 </td>
   <td style="text-align:right;"> 0.007 </td>
   <td style="text-align:right;"> 0.175 </td>
   <td style="text-align:right;"> 0.040 </td>
   <td style="text-align:right;"> 0.020 </td>
   <td style="text-align:right;"> 0.018 </td>
   <td style="text-align:right;"> 0.019 </td>
   <td style="text-align:right;"> 0.024 </td>
   <td style="text-align:right;"> 0.053 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2002 </td>
   <td style="text-align:right;"> 0.005 </td>
   <td style="text-align:right;"> 0.122 </td>
   <td style="text-align:right;"> 0.028 </td>
   <td style="text-align:right;"> 0.014 </td>
   <td style="text-align:right;"> 0.012 </td>
   <td style="text-align:right;"> 0.013 </td>
   <td style="text-align:right;"> 0.016 </td>
   <td style="text-align:right;"> 0.037 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2003 </td>
   <td style="text-align:right;"> 0.002 </td>
   <td style="text-align:right;"> 0.051 </td>
   <td style="text-align:right;"> 0.012 </td>
   <td style="text-align:right;"> 0.006 </td>
   <td style="text-align:right;"> 0.005 </td>
   <td style="text-align:right;"> 0.006 </td>
   <td style="text-align:right;"> 0.007 </td>
   <td style="text-align:right;"> 0.015 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2004 </td>
   <td style="text-align:right;"> 0.005 </td>
   <td style="text-align:right;"> 0.129 </td>
   <td style="text-align:right;"> 0.029 </td>
   <td style="text-align:right;"> 0.015 </td>
   <td style="text-align:right;"> 0.013 </td>
   <td style="text-align:right;"> 0.014 </td>
   <td style="text-align:right;"> 0.017 </td>
   <td style="text-align:right;"> 0.039 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.005 </td>
   <td style="text-align:right;"> 0.127 </td>
   <td style="text-align:right;"> 0.029 </td>
   <td style="text-align:right;"> 0.015 </td>
   <td style="text-align:right;"> 0.013 </td>
   <td style="text-align:right;"> 0.014 </td>
   <td style="text-align:right;"> 0.017 </td>
   <td style="text-align:right;"> 0.039 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.006 </td>
   <td style="text-align:right;"> 0.154 </td>
   <td style="text-align:right;"> 0.035 </td>
   <td style="text-align:right;"> 0.018 </td>
   <td style="text-align:right;"> 0.016 </td>
   <td style="text-align:right;"> 0.017 </td>
   <td style="text-align:right;"> 0.021 </td>
   <td style="text-align:right;"> 0.047 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.008 </td>
   <td style="text-align:right;"> 0.216 </td>
   <td style="text-align:right;"> 0.049 </td>
   <td style="text-align:right;"> 0.025 </td>
   <td style="text-align:right;"> 0.022 </td>
   <td style="text-align:right;"> 0.024 </td>
   <td style="text-align:right;"> 0.029 </td>
   <td style="text-align:right;"> 0.066 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.005 </td>
   <td style="text-align:right;"> 0.118 </td>
   <td style="text-align:right;"> 0.027 </td>
   <td style="text-align:right;"> 0.014 </td>
   <td style="text-align:right;"> 0.012 </td>
   <td style="text-align:right;"> 0.013 </td>
   <td style="text-align:right;"> 0.016 </td>
   <td style="text-align:right;"> 0.036 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.002 </td>
   <td style="text-align:right;"> 0.048 </td>
   <td style="text-align:right;"> 0.011 </td>
   <td style="text-align:right;"> 0.006 </td>
   <td style="text-align:right;"> 0.005 </td>
   <td style="text-align:right;"> 0.005 </td>
   <td style="text-align:right;"> 0.006 </td>
   <td style="text-align:right;"> 0.015 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.002 </td>
   <td style="text-align:right;"> 0.047 </td>
   <td style="text-align:right;"> 0.011 </td>
   <td style="text-align:right;"> 0.005 </td>
   <td style="text-align:right;"> 0.005 </td>
   <td style="text-align:right;"> 0.005 </td>
   <td style="text-align:right;"> 0.006 </td>
   <td style="text-align:right;"> 0.014 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.002 </td>
   <td style="text-align:right;"> 0.045 </td>
   <td style="text-align:right;"> 0.010 </td>
   <td style="text-align:right;"> 0.005 </td>
   <td style="text-align:right;"> 0.005 </td>
   <td style="text-align:right;"> 0.005 </td>
   <td style="text-align:right;"> 0.006 </td>
   <td style="text-align:right;"> 0.014 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.006 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:right;"> 0.002 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:right;"> 0.027 </td>
   <td style="text-align:right;"> 0.006 </td>
   <td style="text-align:right;"> 0.003 </td>
   <td style="text-align:right;"> 0.003 </td>
   <td style="text-align:right;"> 0.003 </td>
   <td style="text-align:right;"> 0.004 </td>
   <td style="text-align:right;"> 0.008 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:right;"> 0.019 </td>
   <td style="text-align:right;"> 0.004 </td>
   <td style="text-align:right;"> 0.002 </td>
   <td style="text-align:right;"> 0.002 </td>
   <td style="text-align:right;"> 0.002 </td>
   <td style="text-align:right;"> 0.003 </td>
   <td style="text-align:right;"> 0.006 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.012 </td>
   <td style="text-align:right;"> 0.003 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:right;"> 0.002 </td>
   <td style="text-align:right;"> 0.004 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2016 </td>
   <td style="text-align:right;"> 0.005 </td>
   <td style="text-align:right;"> 0.126 </td>
   <td style="text-align:right;"> 0.029 </td>
   <td style="text-align:right;"> 0.014 </td>
   <td style="text-align:right;"> 0.013 </td>
   <td style="text-align:right;"> 0.014 </td>
   <td style="text-align:right;"> 0.017 </td>
   <td style="text-align:right;"> 0.038 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2017 </td>
   <td style="text-align:right;"> 0.005 </td>
   <td style="text-align:right;"> 0.118 </td>
   <td style="text-align:right;"> 0.027 </td>
   <td style="text-align:right;"> 0.014 </td>
   <td style="text-align:right;"> 0.012 </td>
   <td style="text-align:right;"> 0.013 </td>
   <td style="text-align:right;"> 0.016 </td>
   <td style="text-align:right;"> 0.036 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2018 </td>
   <td style="text-align:right;"> 0.018 </td>
   <td style="text-align:right;"> 0.459 </td>
   <td style="text-align:right;"> 0.105 </td>
   <td style="text-align:right;"> 0.053 </td>
   <td style="text-align:right;"> 0.046 </td>
   <td style="text-align:right;"> 0.051 </td>
   <td style="text-align:right;"> 0.062 </td>
   <td style="text-align:right;"> 0.140 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2019 </td>
   <td style="text-align:right;"> 0.023 </td>
   <td style="text-align:right;"> 0.582 </td>
   <td style="text-align:right;"> 0.133 </td>
   <td style="text-align:right;"> 0.067 </td>
   <td style="text-align:right;"> 0.059 </td>
   <td style="text-align:right;"> 0.064 </td>
   <td style="text-align:right;"> 0.078 </td>
   <td style="text-align:right;"> 0.177 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2020 </td>
   <td style="text-align:right;"> 0.006 </td>
   <td style="text-align:right;"> 0.152 </td>
   <td style="text-align:right;"> 0.035 </td>
   <td style="text-align:right;"> 0.017 </td>
   <td style="text-align:right;"> 0.015 </td>
   <td style="text-align:right;"> 0.017 </td>
   <td style="text-align:right;"> 0.020 </td>
   <td style="text-align:right;"> 0.046 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2021 </td>
   <td style="text-align:right;"> 0.005 </td>
   <td style="text-align:right;"> 0.121 </td>
   <td style="text-align:right;"> 0.028 </td>
   <td style="text-align:right;"> 0.014 </td>
   <td style="text-align:right;"> 0.012 </td>
   <td style="text-align:right;"> 0.013 </td>
   <td style="text-align:right;"> 0.016 </td>
   <td style="text-align:right;"> 0.037 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2022 </td>
   <td style="text-align:right;"> 0.008 </td>
   <td style="text-align:right;"> 0.201 </td>
   <td style="text-align:right;"> 0.046 </td>
   <td style="text-align:right;"> 0.023 </td>
   <td style="text-align:right;"> 0.020 </td>
   <td style="text-align:right;"> 0.022 </td>
   <td style="text-align:right;"> 0.027 </td>
   <td style="text-align:right;"> 0.061 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2023 </td>
   <td style="text-align:right;"> 0.002 </td>
   <td style="text-align:right;"> 0.054 </td>
   <td style="text-align:right;"> 0.012 </td>
   <td style="text-align:right;"> 0.006 </td>
   <td style="text-align:right;"> 0.005 </td>
   <td style="text-align:right;"> 0.006 </td>
   <td style="text-align:right;"> 0.007 </td>
   <td style="text-align:right;"> 0.017 </td>
  </tr>
</tbody>
</table>
