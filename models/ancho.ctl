#V3.30.08.04-trans;_2017_11_08;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.6
#C 2017 Anchovy control file
#_data_and_control_files: ancho_dato.dat // ancho_control.ctl
#V3.30.08.04-trans;_2017_11_08;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.6
#_user_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_user_info_available_at:https://vlab.ncep.noaa.gov/group/stock-synthesis
0	#_0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
1	#_N_Growth_Patterns
1	#_N_platoons_Within_GrowthPattern 
#_Cond 1 #_Morph_between/within_stdev_ratio (no read if N_morphs=1)
#_Cond 1 #vector_Morphdist_(-1_in_first_val_gives_normal_approx)
#
2	#_recr_dist_method for parameters:  2=main effects for GP, Settle timing, Area; 3=each Settle entity; 4=none when N_GP*Nsettle*pop==1
1	#_not yet implemented; Future usage: Spawner-Recruitment: 1=global; 2=by area
2	#_number of recruitment settlement assignments 
0	#_unused option
#_GPattern month  area  age (for each settlement assignment)
1	7	1	0.5
1	1	1	0.5
#
#_Cond 0 # N_movement_definitions goes here if Nareas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
#
3	#_Nblock_Patterns
7	8	1	#_blocks_per_pattern 
#_begin and end years of blocks
1984 1986 1987 1990 1991 1997 1998 2000 2001 2008 2009 2014 2015 2017
1984 1988 1989 1992 1994 1995 1996 1997 1998 1999 2001 2007 2008 2013 2014 2017
1983 1983
#
#_controls for all timevary parameters 
1	#_env/block/dev_adjust_method for all time-vary parms (1=warn relative to base parm bounds; 3=no bound check)
#_autogen
1	1	1	1	1	#_autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
#_where: 0 = autogen all time-varying parms; 1 = read each time-varying parm line; 2 = read then autogen if parm min==-12345
# 
#
#_setup for M, growth, maturity, fecundity, recruitment distibution, movement 
#
0	#_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
#_no additional input for selected M option; read 1P per morph
1	#_GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K; 4=not implemented
0.5	#_Age(post-settlement)_for_L1;linear growth below this
999	#_Growth_Age_for_L2 (999 to use as Linf)
-999	#_exponential decay for growth above maxage (fixed at 0.2 in 3.24; value should approx initial Z; -999 replicates 3.24)
0	#_placeholder for future growth feature
0	#_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0	#_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
1	#_maturity_option:1=length_logistic;2=age_logistic;3=read_age-maturity_matrix_growth_pattern;4=readage-fecundity;5=disabled;6=read length-maturity
1	#_First_Mature_Age
1	#_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0	#_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1	#_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
1.1	2.5	1.6	1.98	0.6	3	-4	0	0	0	0	0	0	0	#_NatM_p_1_Fem_GP_1
1	7	5.4	6	0.5	0	-1	0	0	0	0	0	0	0	#_L_at_Amin_Fem_GP_1
15	23	17.41	20	99	0	-1	0	0	0	0	0	0	0	#_L_at_Amax_Fem_GP_1
0.8	2.5	1.55	1.19	99	0	-1	0	0	0	0	0	0	0	#_VonBert_K_Fem_GP_1
0.03	0.46	0.21	0.1	99	0	-2	0	0	0	0	0	0	0	#_CV_young_Fem_GP_1
0.03	0.46	0.09	0.1	99	0	-2	0	0	0	0	0	0	0	#_CV_old_Fem_GP_1
-3	3	5.1e-06	5.1e-06	99	0	-5	0	0	0	0	0	0	0	#_Wtlen_1_Fem
-3	3	3.074	3.074	99	0	-5	0	0	0	0	0	0	0	#_Wtlen_2_Fem
10	14	11.5	11.5	99	0	-5	0	0	0	0	0	0	0	#_Mat50%_Fem
-3	3	-0.48	-0.48	99	0	-5	0	0	0	0	0	0	0	#_Mat_slope_Fem
-3	3	1	1	99	0	-5	0	0	0	0	0	0	0	#_Eggs/kg_inter_Fem
-3	3	0	0	99	0	-5	0	0	0	0	0	0	0	#_Eggs/kg_slope_wt_Fem
-3	3	1	1	99	0	-3	0	0	0	0	0.5	0	0	#_RecrDist_GP_1
-3	3	1	1	99	0	-3	0	0	0	0	0.5	0	0	#_RecrDist_Area_1
-3	3	0	1	99	0	-3	0	0	0	0	0.5	0	0	#_RecrDist_timing_1
-3	3	-1	1	99	0	-3	0	0	0	0	0.5	0	0	#_RecrDist_timing_2
1	1	1	1	1	0	-1	0	0	0	0	0	0	0	#_CohortGrowDev
0.000001	0.999999	0.5	0.5	0.5	0	-99	0	0	0	0	0	0	0	#_FracFemale_GP_1
#
#_no timevary MG parameters
#
#_seasonal_effects_on_biology_parms
0	0	0	0	0	0	0	0	0	0	#_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
#_Spawner-Recruitment
2	#_SR_function: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepard_3Parm
0	#_0/1 to use steepness in initial equ recruitment calculation
0	#_future feature:  0/1 to make realized sigmaR a function of SR curvature
#_LO_HI_INIT_PRIOR_PR_SD_PR_type_PHASE_env-var_use_dev_dev_mnyr_dev_mxyr_dev_PH_Block_Blk_Fxn	#_parm_name
10	50	14.16	15	5	0	-1	0	0	0	0	0	0	0	#_SR_LN(R0)
0	4	1.28	0.8	0.9	0	-1	0	0	0	0	0	0	0	#_SR_Ricker
0.2	0.9	0.54	0.5	99	0	-1	0	0	0	0	0	0	0	#_SR_sigmaR
-5	5	0	0	99	0	-50	0	0	0	0	0	0	0	#_SR_regime
0	2	0	1	99	0	-50	0	0	0	0	0	0	0	#_SR_autocorr
1	#do_recdev:  0=none; 1=devvector; 2=simple deviations
1984	#_first year of main recr_devs; early devs can preceed this era
2017	#_last year of main recr_devs; forecast devs start in following year
3	#_recdev phase 
0	#_(0/1) to read 13 advanced options
#_Cond 0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
#_Cond 0 #_recdev_early_phase
#_Cond 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
#_Cond 1 #_lambda for Fcast_recr_like occurring before endyr+1
#_Cond 984 #_last_early_yr_nobias_adj_in_MPD
#_Cond 1980 #_first_yr_fullbias_adj_in_MPD
#_Cond 2017 #_last_yr_fullbias_adj_in_MPD
#_Cond 2018 #_first_recent_yr_nobias_adj_in_MPD
#_Cond 1 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
#_Cond 0 #_period of cycles in recruitment (N parms read below)
#_Cond -5 #min rec_dev
#_Cond 5 #max rec_dev
#_Cond 0 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#
# all recruitment deviations
#  1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013R 2014R 2015R 2016R 2017R 2018F 2019F 2020F 2021F 2022F
#  0.321819 -0.262871 0.39054 0.357602 -0.405758 -0.0190309 -0.315199 -0.110179 0.544128 0.447518 -0.172625 0.139783 0.211583 0.228762 0.208554 -0.40079 0.127187 0.218153 -0.0369305 0.493394 0.203997 0.0682804 -0.495751 -0.221076 -0.270439 0.0923533 0.0422561 -0.40594 -0.421391 -0.765928 0.106389 0.11366 0.324632 -0.336685 0 0 0 0 0
# implementation error by year in forecast:  0 0 0 0 0
#
#Fishing Mortality info 
0.2	#_F ballpark for tuning early phases  
-1999	#_F ballpark year (neg value to disable)
2	#_F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
3	#_max F or harvest rate, depends on F_Method
#_no additional F input needed for Fmethod 1
#_if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
#_if Fmethod=3; read N iterations for tuning for Fmethod 3
0	1	0	#_overall start F value; overall phase; N detailed inputs to read
#Fleet Yr Seas F_value se phase (for detailed setup of F_Method=2; -Yr to fill remaining years)
#
#_initial_F_parms; count = 0
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#2022 2093
# F rates by fleet
# Yr:  1984 1984 1985 1985 1986 1986 1987 1987 1988 1988 1989 1989 1990 1990 1991 1991 1992 1992 1993 1993 1994 1994 1995 1995 1996 1996 1997 1997 1998 1998 1999 1999 2000 2000 2001 2001 2002 2002 2003 2003 2004 2004 2005 2005 2006 2006 2007 2007 2008 2008 2009 2009 2010 2010 2011 2011 2012 2012 2013 2013 2014 2014 2015 2015 2016 2016 2017 2017 2018 2018 2019 2019 2020 2020 2021 2021 2022 2022
# seas:  1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2
# Fish_Chi 0.000210454 1.20323e-05 0.0472306 1.17568e-05 0.278559 1.69666 0.247797 0.0522533 0.270677 0.51459 0.564607 0.972834 0.705322 0.592548 0.759618 0.243016 1.32947 1.27847 1.03189 1.28099 1.05199 1.64694 1.37335 1.00709 0.894137 0.720851 1.5888 0.860692 0.109888 0.0256321 0.393896 0.417555 0.635535 1.75612 2.0792 0.943241 1.12625 3.24555 0.758089 0.152237 1.45027 1.5838 0.196153 0.826783 0.4526 0.594912 1.1204 1.37703 3.37867 3.31007 0.742116 1.00633 1.31281 0.609056 1.28903 0.847352 0.468712 1.53952 0.342823 1.12162 1.14704 2.41759 0.73608 0.954339 0.177535 0.13788 0.371869 0.206065 1.2573 0.696714 1.11467 0.617677 1.23221 0.682806 1.23722 0.685583 1.24337 0.688993
# Fish_Per 0.0109968 0.0128006 0.0347634 0.128606 0.202466 0.162073 0.182728 0.246348 0.154901 0.12314 0.370147 0.186477 0.450515 0.0229712 0.693556 0.108183 0.976865 2.48265 0.896224 0.392975 0.622062 0.381014 1.0752 0.186655 0.262864 0.11653 1.53964 0.602484 0.278044 0.0144521 0.311532 0.191068 0.567508 0.0178149 0.980765 0.0367538 1.00917 1.79259 0.22471 0.0179959 0.656746 0.308832 0.887813 0.0594645 0.67574 0.320596 1.18115 0.592703 2.48514 1.92751 0.57098 1.06046 0.800797 0.0480885 0.525161 0.678821 0.39634 0.135654 0.0695357 0.546809 0.701826 0.0442281 0.735481 0.152204 0.182466 0.00447975 0.15924 0.0113696 0.538397 0.0384412 0.47732 0.0340804 0.527649 0.0376738 0.529795 0.0378271 0.532431 0.0380152
#
#_Q_setup for fleets with cpue or survey data
#_1:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm)
#_2:  extra input for link, i.e. mirror fleet
#_3:  0/1 to select extra sd parameter
#_4:  0/1 for biasadj or not
#_5:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
3	1	0	0	0	0	#_SurAdu_Per
4	1	0	0	0	0	#_SurJuv_Per
5	1	0	0	0	0	#_SurJuv_Chi
6	1	0	0	0	0	#_SurBio_Chi
-9999	0	0	0	0	0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_LO_HI_INIT_PRIOR_PR_SD_PR_type_PHASE_env-var_use_dev_dev_mnyr_dev_mxyr_dev_PH_Block_Blk_Fxn_#_parm_name
-15	1.5	-1.33693	0.0755	99	0	2	0	0	0	0	0	0	0	#_LnQ_SurAdu_Per(3)
-15	1.5	-8.03187	0.0755	99	0	2	0	0	0	0	0	0	0	#_LnQ_SurJuv_Per(4)
-15	1.5	-9.14515	0.0755	99	0	2	0	0	0	0	0	0	0	#_LnQ_SurJuv_Chi(5)
-15	1.5	-0.663397	0.0755	99	0	2	0	0	0	0	0	0	0	#_LnQ_SurBio_Chi(6)
#_no timevary Q parameters
#
#_size_selex_patterns
#Pattern:_0; parm=0; selex=1.0 for all sizes
#Pattern:_1; parm=2; logistic; with 95% width specification
#Pattern:_5; parm=2; mirror another size selex; PARMS pick the min-max bin to mirror
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_6; parm=2+special; non-parm len selex
#Pattern:_43; parm=2+special+2;  like 6, with 2 additional param for scaling (average over bin range)
#Pattern:_8; parm=8; New doublelogistic with smooth transitions and constant above Linf option
#Pattern:_9; parm=6; simple 4-parm double logistic with starting length; parm 5 is first length; parm 6=1 does desc as offset
#Pattern:_21; parm=2+special; non-parm len selex, read as pairs of size, then selex
#Pattern:_22; parm=4; double_normal as in CASAL
#Pattern:_23; parm=6; double_normal where final value is directly equal to sp(6) so can be >1.0
#Pattern:_24; parm=6; double_normal with sel(minL) and sel(maxL), using joiners
#Pattern:_25; parm=3; exponential-logistic in size
#Pattern:_27; parm=3+special; cubic spline 
#Pattern:_42; parm=2+special+3; // like 27, with 2 additional param for scaling (average over bin range)
#_discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead;_4=define_dome-shaped_retention
#_Pattern Discard Male Special
1	0	0	0	#_1 Fish_Chi
1	0	0	0	#_2 Fish_Per
0	0	0	0	#_3 SurAdu_Per
0	0	0	0	#_4 SurJuv_Per
0	0	0	0	#_5 SurJu_Chi
0	0	0	0	#_6 SurBio_Chi
#
#_age_selex_types
#Pattern:_0; parm=0; selex=1.0 for ages 0 to maxage
#Pattern:_10; parm=0; selex=1.0 for ages 1 to maxage
#Pattern:_11; parm=2; selex=1.0  for specified min-max age
#Pattern:_12; parm=2; age logistic
#Pattern:_13; parm=8; age double logistic
#Pattern:_14; parm=nages+1; age empirical
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_16; parm=2; Coleraine - Gaussian
#Pattern:_17; parm=nages+1; empirical as random walk  N parameters to read can be overridden by setting special to non-zero
#Pattern:_41; parm=2+nages+1; // like 17, with 2 additional param for scaling (average over bin range)
#Pattern:_18; parm=8; double logistic - smooth transition
#Pattern:_19; parm=6; simple 4-parm double logistic with starting age
#Pattern:_20; parm=6; double_normal,using joiners
#Pattern:_26; parm=3; exponential-logistic in age
#Pattern:_27; parm=3+special; cubic spline in age
#Pattern:_42; parm=2+nages+1; // cubic spline; with 2 additional param for scaling (average over bin range)
#_Pattern Discard Male Special
12	0	0	0	#_1 Fish_Chi
12	0	0	0	#_2 Fish_Per
10	0	0	0	#_3 SurAdu_Per
10	0	0	0	#_4 SurJuv_Per
10	0	0	0	#_5 SurJuv_Chi
10	0	0	0	#_6 SurBio_Chi
#
#_LO_HI_INIT_PRIOR_PR_SD_PR_type_PHASE_env-var_use_dev_dev_mnyr_dev_mxyr_dev_PH_Block_Blk_Fxn_#_parm_name
8	20	14	15	99	0	2	0	0	0	0	0.5	1	2	#_SizeSel_P1_Fish_Chi(1)
0.01	0.9	0.9	0.5	99	0	3	0	0	0	0	0.5	0	0	#_SizeSel_P2_Fish_Chi(1)
8	20	11.04	15	99	0	2	0	0	0	0	0.5	2	2	#_SizeSel_P1_Fish_Per(2)
0.01	0.9	0.9	0.5	99	0	3	0	0	0	0	0.5	0	0	#_SizeSel_P2_Fish_Per(2)
0.01	1	0.5	0.5	99	0	-2	0	0	0	0	0.5	0	0	#_AgeSel_1P_1_Fishery_Chi
0.01	1	0.1	1	99	0	-3	0	0	0	0	0.5	0	0	#_AgeSel_1P_2_Fishery_Chi
0.01	1	0.5	0.5	99	0	-2	0	0	0	0	0.5	0	0	#_AgeSel_1P_1_Fishery_Per
0.01	1	0.4	1	99	0	-3	0	0	0	0	0.5	0	0	#_AgeSel_1P_2_Fishery_Per
#_timevary selex parameters 
#_LO_HI_INIT_PRIOR_PR_SD_PR_type_PHASE_#_parm_name
10	20	10.0001	15	99	0	3	#_SizeSel_P1_Fish_Chi(1)_BLK1repl_1984
10	20	10.1366	15	99	0	3	#_SizeSel_P1_Fish_Chi(1)_BLK1repl_1987
10	20	11.4838	15	99	0	3	#_SizeSel_P1_Fish_Chi(1)_BLK1repl_1991
10	20	10.6147	15	99	0	3	#_SizeSel_P1_Fish_Chi(1)_BLK1repl_1998
8	15	13.8804	12	99	0	3	#_SizeSel_P1_Fish_Chi(1)_BLK1repl_2001
8	15	12.9667	12	99	0	3	#_SizeSel_P1_Fish_Chi(1)_BLK1repl_2009
8	15	10.6941	12	99	0	3	#_SizeSel_P1_Fish_Chi(1)_BLK1repl_2015
10	20	10.4442	15	99	0	3	#_SizeSel_P1_Fish_Per(2)_BLK2repl_1984
10	20	13.1506	15	99	0	3	#_SizeSel_P1_Fish_Per(2)_BLK2repl_1989
10	20	10.9302	15	99	0	3	#_SizeSel_P1_Fish_Per(2)_BLK2repl_1994
10	20	12.4735	15	99	0	3	#_SizeSel_P1_Fish_Per(2)_BLK2repl_1996
10	20	10.2986	15	99	0	3	#_SizeSel_P1_Fish_Per(2)_BLK2repl_1998
10	20	10.6817	15	99	0	3	#_SizeSel_P1_Fish_Per(2)_BLK2repl_2001
10	20	10.9593	15	99	0	3	#_SizeSel_P1_Fish_Per(2)_BLK2repl_2008
10	20	10.4095	15	99	0	3	#_SizeSel_P1_Fish_Per(2)_BLK2repl_2014
# info on dev vectors created for selex parms are reported with other devs after tag parameter section 
#
0	#_use 2D_AR1 selectivity(0/1):  experimental feature
#_no 2D_AR1 selex offset used
#
# Tag loss and Tag reporting parameters go next
0	#_TG_custom:  0=no read; 1=read if tags exist
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
#_deviation vectors for timevary parameters
#_base   base first block   block  env  env   dev   dev   dev   dev   dev
#_type  index  parm trend pattern link  var  vectr link _mnyr  mxyr phase  dev_vector
#      5     1     1     1     2     2     0     0     0     0     0     0
#      5     3     8     2     2     2     0     0     0     0     0     0
#
# Input variance adjustments factors: 
#_1=add_to_survey_CV
#_2=add_to_discard_stddev
#_3=add_to_bodywt_CV
#_4=mult_by_lencomp_N
#_5=mult_by_agecomp_N
#_6=mult_by_size-at-age_N
#_7=mult_by_generalized_sizecomp
#_Factor  Fleet  Value
-9999	1	0	#_terminator
#
1	#_maxlambdaphase
1	#_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 0 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark
#like_comp fleet  phase  value  sizefreq_method
-9999	1	1	1	1	#_terminator
#
# lambdas (for info only; columns are phases)
#  0 #_CPUE/survey:_1
#  0 #_CPUE/survey:_2
#  1 #_CPUE/survey:_3
#  1 #_CPUE/survey:_4
#  1 #_CPUE/survey:_5
#  1 #_CPUE/survey:_6
#  1 #_lencomp:_1
#  1 #_lencomp:_2
#  0 #_lencomp:_3
#  0 #_lencomp:_4
#  1 #_lencomp:_5
#  0 #_lencomp:_6
#  1 #_init_equ_catch
#  1 #_recruitments
#  1 #_parameter-priors
#  1 #_parameter-dev-vectors
#  1 #_crashPenLambda
#  0 # F_ballpark_lambda
0	#_(0/1) read specs for more stddev reporting 
# 0 1 -1 5 1 5 1 -1 5 # placeholder for selex type, len/age, year, N selex bins, Growth pattern, N growth ages, NatAge_area(-1 for all), NatAge_yr, N Natages
# placeholder for vector of selex bins to be reported
# placeholder for vector of growth ages to be reported
# placeholder for vector of NatAges ages to be reported
999

