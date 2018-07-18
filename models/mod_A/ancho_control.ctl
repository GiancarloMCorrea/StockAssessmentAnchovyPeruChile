#C 2017 Anchovy control file
#_data_and_control_files: ancho_dato.dat // ancho_control.ctl
#_SS-V3.24U-safe;_08/29/2014;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.2_Linux64
1	#_N_Growth_Patterns
1	#_N_Morphs_Within_GrowthPattern 
#_Cond 1 #_Morph_between/within_stdev_ratio (no read if N_morphs=1)
#_Cond 1 #_vector_Morphdist_(-1_in_first_val_gives_normal_approx)
#
2	#_number_of_recruitment_assignments_(overrides_GP*area*seas_parameter_values) 
0	#_recruitment_interaction_requested
#GP seas area for each recruitment assignment
1	1	1
1	2	1
#
3	#_Nblock_Patterns_set=0
7	8	3	#_Cond 0 #_blocks_per_pattern_set=NA 
#_begin_and_end_years_of_blocks_set=NA
1984 1986 1987 1990 1991 1997 1998 2000 2001 2008 2009 2014 2015 2017
1984 1988 1989 1992 1994 1995 1996 1997 1998 1999 2001 2007 2008 2013 2014 2017
1999 2010 2011 2013 2014 2016
0.5	#_fracfemale 
0	#_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
#_no additional input for selected M option; read 1P per morph
1	#_GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_speciific_K; 4=not implemented
0.5	#_Growth_Age_for_L1
999	#_Growth_Age_for_L2 (999 to use as Linf)
0	#_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0	#_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
1	#_maturity_option:_1=length logistic; 2=age logistic; 3=read age-maturity by GP; 4=read age-fecundity by GP; 5=read fec and wt from wtatage.ss; 6=read length-maturity by GP
#_placeholder for empirical age- or length- maturity by growth pattern (female only)
1	#_First_Mature_Age
1	#_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0	#_hermaphroditism option:  0=none; 1=age-specific fxn
1	#_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
2	#_env/block/dev_adjust_method (1=standard; 2=logistic transform keeps in base parm bounds; 3=standard w/ no bound check)
# Lo     Hi     Init    Prior   Prior   Prior   Param   Env     Use     Dev     Dev     Dev     Block   block
# bnd    bnd    value   mean    type    SD      phase   var     dev     minyr   maxyr   SD      design  switch
###_Mortality
1.1	2.5	1.6	1.98	3	0.6	-4	0	0	0	0	0	0	0	#_Mortality
###_Growth parameters ignored in empirical input approach
1	7	5.4	6	-1	0.5	-1	0	0	0	0	0	0	0	#_A0
15	23	17.41	20	-1	99	-1	0	0	0	0	0	0	0	# Linf
0.8	2.5	1.75	1.19	-1	99	-1	0	0	0	0	0	0	0	# VBK
0.03	0.46	0.12	0.1	-1	99	-2	0	0	0	0	0	0	0	# CV of len@age 0
0.03	0.46	0.09	0.1	-1	99	-2	0	0	0	0	0	0	0	# CV of len@age inf
#_W-L,_maturity and fecundity parameters
#_Female placeholders (wtatage overrides these)
-3	3	0.0000051 0.0000051 -1	99	-5	0	0	0	0	0	0	0	# F W-L slope
-3	3	3.074	3.074	-1	99	-5	0	0	0	0	0	0	0	# F W-L exponent
#_Maturity ok from 2010 assessment
10	14	11.5	11.5	-1	99	-5	0	0	0	0	0	0	0	# L at 50% maturity
-3	3	-0.48	-0.48	-1	99	-5	0	0	0	0	0	0	0	# F Logistic maturity slope
#_No fecundity relationship
-3	3	1.0	1.0	-1	99	-5	0	0	0	0	0	0	0	# F Eggs/gm intercept
-3	3	0.0	0.0	-1	99	-5	0	0	0	0	0	0	0	# F Eggs/gm slope
# recruitment interactions
-3	3	1	1	-1	99	-3	0	0	0	0	0.5	0	0	#_RecrDist_GP_1
-3	3	1	1	-1	99	-3	0	0	0	0	0.5	0	0	#_RecrDist_Area_1
-3	3	0	1	-1	99	-3	0	0	0	0	0.5	0	0	#_RecrDist_Seas_1
-3	3	-1	1	-1	99	-3	0	0	0	0	0.5	0	0	#_RecrDist_Seas_2
-1	3	1	1	-1	99	-3	0	0	0	0	0.5	0	0	#_CohortGrowDev
0 0 0 0 0 0 0 0 0 0 # Unused MGparm_seas_effects
#
#_Spawner-recruit parameters
2 #_S-R function: 1=B-H w/flat top, 2=Ricker, 3=standard B-H, 4=no steepness or bias adjustment
# Lo    Hi      Init    Prior   Prior   Prior   Param
# bnd   bnd     value   mean    type    SD      phase
10	50	13.62	15	-1	5	-1	#_Ln(R0)
0	4	1.56	0.8	-1	0.9	-1	#_Steepness_with_Myers_prior_0.1_1_0.9_0.8_-1_0.9_-1
0.2	0.9	0.34	0.5	-1	99	-1	#_Sigma-R
-5	5	0	0	-1	99	-50	#_Env link coefficient
-5	5	0	0	-1	99	-50	#_Initial equilibrium recruitment offset
 0	2	0	1	-1	99	-50	#_Autocorrelation in rec devs
0	#_index of environmental variable to be used
0	#_SR environmental target: 0=none;1=devs;_2=R0;_3=steepness
1	#_Recruitment deviation type: 0=none; 1=devvector; 2=simple deviations
#_Recruitment deviations
1984	#_Start year standard recruitment devs
2017	#_End year standard recruitment devs
3	#_Rec Dev phase
0	#_Read 11 advanced recruitment options: 0=no, 1=yes
#1978	#_Start year for early rec devs
#6	#_Phase for early rec devs
#6	#_Phase for forecast recruit deviations
#1.0	#_Lambda for forecast recr devs before endyr+1
#1956	#_Last recruit dev with no bias_adjustment
#1971	#_First year of full bias correction (linear ramp from year above)
#2011	#_Last year for full bias correction
#2012	#_First_recent_yr_nobias_adj
#0.85	#_Maximum bias adjustment
#0	#_Period of cycles in recruitment (N parms read below)
#-5	#_Lower_bound_recr_dev
#5	#_Upper_bound_recr_dev
#0	#_Read_init_values_for_deviations_in_any_recruitment
#1	1500	500	550	3	0.4	-5	0	0	0	0.5	0	0	#_Recruit_Season_1
#1	1500	500	550	3	0.4	-5	0	0	0	0.5	0	0	#_Recruit_Season_2
#_Fishing_mortality_setup
0.2	#_F ballpark for tuning early phases
-1999	#_F ballpark year
2	#_F method:  1=Pope's; 2=Instan. F; 3=Hybrid
6	#_Max F or harvest rate (depends on F_Method)
0	1	0	#_initial F value, F phase, N_detailed Fsetups to read 
#_Init F parameters by fleet
#LO     HI      INIT    PRIOR   PR_type SD      PHASE
0.01	10	0	0.15	-1	99	-50	#Fishery_Chi
0.01	10	0	0.15	-1	99	-50	#Fishery_Per
# Catchability setup
# A=do power: 0=skip, survey is prop. to abundance, 1= add par for non-linearity
# B=env. link: 0=skip, 1= add par for env. effect on Q
# C=extra SD: 0=skip, 1= add par. for additive constant to input SE (in ln space)
# D=type: <0=mirror lower abs(#) fleet, 0=no par Q is median unbiased, 1=no par Q is mean unbiased, 2=estimate par for ln(Q)
#          3=ln(Q) + set of devs about ln(Q) for all years. 4=ln(Q) + set of devs about Q for indexyr-1
#A      B       C       D
0	0	0	0	#_Fishery_Chi
0	0	0	0	#_Fishery_Per
0	0	0	2	#_Survey_Adult_Per
0	0	0	2	#_Survey_Juven_Per
0	0	0	2	#_Survey_Juven_Chi
0	0	0	2	#_Survey_Spawing_Biomass_Chi
#LO     HI      INIT    PRIOR   PR_type SD      PHASE
-15	1.5	0.0755	0.0755	-1	99	2	#_Survey_Adult_Per
-15	1.5	0.0755	0.0755	-1	99	2	#_Survey_Juven_Per
-15	1.5	0.0755	0.0755	-1	99	2	#_Survey_Juven_Chi
-15	1.5	0.0755	0.0755	-1	99	2	#_Survey_Spawing_Biomass_Chi
#_SELECTIVITY_&_RETENTION_PARAMETERS
#_Size-based setup
#_A=Selex option: 1-24
#_B=Do_retention: 0=no, 1=yes
#_C=Male offset to female: 0=no, 1=yes
#_D=Extra input (#)
#_A B C D
#_Size selectivity
1	0	0	0	#_Fishery_Chi_set:1
1	0	0	0	#_Fishery_Per_set:1
0	0	0	0	#_Survey_Adult_Per_set:0
33	0	0	0	#_Survey_Juven_Per_set:33
1	0	0	0	#_Survey_Juven_Chi_set:33
30	0	0	0	#_Survey_Spawing_biomass_Chi_set:30
#_Age selectivity
12	0	0	0	#_Fishery_Chi
12	0	0	0	#_Fishery_Per
10	0	0	0	#_Survey_Adult_Per
10	0	0	0	#_Survey_Juven_Per
12	0	0	0	#_Survey_Juven_Chi
10	0	0	0	#_Survey_Spawing_biomass_Chi
# Selectivity parameters
# Lo    Hi      Init    Prior   Prior   Prior   Param   Env     Use     Dev     Dev     Dev     Block   block
# bnd   bnd     value   mean    type    SD      phase   var     dev     minyr   maxyr   SD      design  switch
5	20	13.3	15	-1	0.05	2	0	0	0	0	0.5	1	2	#_SizeSel_1P_1_Fishery_Chi
0.01	8	2.5	3	-1	0.05	3	0	0	0	0	0.5	0	0	#_SizeSel_1P_2_Fishery_Chi
5	20	10.1	15	-1	0.05	2	0	0	0	0	0.5	2	2	#_SizeSel_1P_1_Fishery_Per
0.01	8	1.2	3	-1	0.05	3	0	0	0	0	0.5	0	0	#_SizeSel_1P_2_Fishery_Per
2	20	7	7	-1	0.05	-2	0	0	0	0	0.5	3	2	#_SizeSel_1P_1_SurJuv_Chi
0.01	5	3	2	-1	0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_1P_2_SurJuv_Chi
0	1	0.5	0.5	-1	0.05	-2	0	0	0	0	0.5	0	0	#_AgeSel_1P_1_Fishery_Chi
0.01	1	0.4	1	-1	0.05	-3	0	0	0	0	0.5	0	0	#_AgeSel_1P_2_Fishery_Chi
0	1	0.5	0.5	-1	0.05	-2	0	0	0	0	0.5	0	0	#_AgeSel_1P_1_Fishery_Per
0.01	1	0.4	1	-1	0.05	-3	0	0	0	0	0.5	0	0	#_AgeSel_1P_2_Fishery_Per
0	1	0.24	0.3	-1	0.05	-2	0	0	0	0	0.5	0	0	#_AgeSel_1P_1_SurJuv_Chi
0.01	1	0.42	1	-1	0.05	-3	0	0	0	0	0.5	0	0	#_AgeSel_1P_2_SurJuv_Chi
1	#_customblock_setup
# replacement parameters for block periods
# Lo    Hi      Init    Prior   Prior   Prior   Param    
# bnd   bnd     value   mean    type    SD      phase    
8	20	12	15	-1	99	3	#_SizeSel_1P_1_Fishery_Chi
8	20	12	15	-1	99	3	#_SizeSel_1P_1_Fishery_Chi
8	20	12	15	-1	99	3	#_SizeSel_1P_1_Fishery_Chi
8	20	12	15	-1	99	3	#_SizeSel_1P_1_Fishery_Chi
8	20	12	12	-1	99	3	#_SizeSel_1P_1_Fishery_Chi
8	20	12	12	-1	99	3	#_SizeSel_1P_1_Fishery_Chi
8	20	12	12	-1	99	3	#_SizeSel_1P_1_Fishery_Chi
8	20	12	15	-1	99	3	#_SizeSel_1P_1_Fishery_Per
8	20	12	15	-1	99	3	#_SizeSel_1P_1_Fishery_Per
8	20	12	15	-1	99	3	#_SizeSel_1P_1_Fishery_Per
8	20	12	15	-1	99	3	#_SizeSel_1P_1_Fishery_Per
8	20	12	15	-1	99	3	#_SizeSel_1P_1_Fishery_Per
8	20	12	15	-1	99	3	#_SizeSel_1P_1_Fishery_Per
8	20	12	15	-1	99	3	#_SizeSel_1P_1_Fishery_Per
8	20	12	15	-1	99	3	#_SizeSel_1P_1_Fishery_Per
4	15	8	9	-1	99	3	#_SizeSel_1P_1_SurJuv_Chi
4	15	8	9	-1	99	3	#_SizeSel_1P_1_SurJuv_Chi
4	15	8	9	-1	99	3	#_SizeSel_1P_1_SurJuv_Chi
#4       #_sel_parm_dev_PHASE
# turn on line below since blocks have been added 
1       #_env/block/dev_adjust_method (1=standard; 2=logistic trans to keep in base parm bounds; 3=standard w/ no bound check)
0       #_Tagging flag: 0=no tagging parameters,1=read tagging parameters
### Likelihood related quantities ###
1       #_Do variance/sample size adjustments by fleet (1)
# # Component for each fleet (including surveys)
0	0	0	0	0	0	#_Constant added to index CV
0	0	0	0	0	0	#_Constant added to discard SD
0	0	0	0	0	0	#_Constant added to body weight SD
1	1	1	1	1	1	#_multiplicative scalar for length comps
1	1	1	1	1	1	# multiplicative scalar for agecomps
1	1	1	1	1	1	#_multiplicative scalar for length at age obs
1  # Lambda phasing: 1=none, 2+=change beginning in phase 1
1  # Growth offset likelihood constant for Log(s): 1=include, 2=not
0  # N changes to default Lambdas = 1.0
0  # Extra SD reporting switch
999 # End control file

