# Model for Anchoveta Stock sur Peru norte chile - 2017
# year is from Ene-Dic, Sem 1: Ene to Jun, Sem 2: Jul to Dic
1   #_N_Growth_Patterns
1   #_N_Morphs_Within_GrowthPattern
1   # N recruitment assig
0   # recruit interaction
1 2 1 # for area 1

#0 #_N_movement_definitions
#1 # first age that moves (real age at begin of season, not integer)
# seas, GP, source_area,dest_area,minage,maxage
#    1    1      1           2       1      4
#    1    1      2           1       1      4
#    2    1      1           2       1      4
#    2    1      2           1       1      4
 
#_Cond 1 #_Morph_between/within_stdev_ratio (no read if N_morphs=1)
#_Cond  1 #vector_Morphdist_(-1_in_first_val_gives_normal_approx)

#_Cond 0 # N_movement_definitions goes here if N_areas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10

2	#_Nblock_Patterns_set=0
8 7	#_Cond 0 #_blocks_per_pattern_set=NA 
#_begin_and_end_years_of_blocks_set=NA
1984 1988 1989 1992 1994 1995 1996 1997 1998 1999 2001 2007 2008 2013 2014 2017
1984 1986 1987 1990 1991 1997 1998 2000 2001 2008 2009 2014 2015 2017

0.5 #_fracfemale
0   #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate

1    # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=not implemented; 4=not implemented
0    #_Growth_Age_for_L1 (minimum age for growth calcs 
999  #_Growth_Age_for_L2 (999 to use as Linf) (maximum age for growth calcs)
0 #_SD_add_to_LAA 
0   #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A)
1   #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity  
#_placeholder for empirical age-maturity by growth pattern
1   #_First_Mature_Age
1   #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b
0   #hermaphrodite
1   #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
1   #_env/block/dev_adjust_method (1=standard; 2=with logistic trans to keep within base parm bounds)

#_growth_parms
#GP_1_Female
#LO     HI      INIT    PRIOR   PR_type  SD     PHASE   env-var use_dev dev_minyr dev_maxyr dev_stddev  Block   Block_Fxn
0.2      3       1      0.83      -1     0.1     -4      0       0       0           0       0.5         0       0           #1 F_M_young
0        6       2      3.0       -1     0.2     -4      0       0       0           0       0.5         0       0           #2 F_L@Amin (Amin is age entered above)
13      24     18.26    19.21     -1     0.5     -4      0       0       0           0       0.5         0       0           #3 F_L@Amax
0.2     1.5    0.85     0.83      -1     0.5     -4      0       0       0           0       0.5         0       0           #4 F_VBK
0.01    1.0    0.13     0.1       -1     0.01    -4      0       0       0           0       0.5         0       0           #5 CV@LAAFIX
0.01    1.0    0.08     0.1       -1     0.01    -2      0       0       0           0       0.5         0       0           #5 CV@LAAFIX2
#GP_1:::Male offset
#0.5      2      0.8       1      -1     0.1      1      0       0       0           0       0.5         0       0           #1 F_M_young
#1        8        2     2.5      -1     0.2      2      0       0       0           0       0.5         0       0           #2 F_L@Amin (Amin is age entered above)
#15      23       18     19       -1     0.5      2      0       0       0           0       0.5         0       0           #3 F_L@Amax
#0.5     1       0.75     0.8    -1      0.5      2      0       0       0           0       0.5         0       0           #4 F_VBK
#0.01    1.00    0.08    0.1     -1      0.01     -2       0       0       0           0       0.5         0       0           #5 CV@LAAFIX
#0.01    1.00    0.08    0.1     -1      0.01     -2       0       0       0           0       0.5         0       0           #5 CV@LAAFIX2

#LW_female
#LO     HI      INIT            PRIOR       PR_type   SD    PHASE   env-var use_dev dev_minyr dev_maxyr dev_stddev  Block   Block_Fxn
0       3       0.0000051     4.5E-06       -1       0.8    -1      0       0       0   0   0.5 0   0   #WL_intercept_female    
1       5       3.074         3.1426        -1       0.8    -1      0       0       0   0   0.5 0   0   #WL_slope_female    
#Female_maturity
8      14        11.5            11           -1      0.1    -3      0       0   	 0   0   0.5 0   0   #mat_intercept  #L50
-3      0       -0.48             -1.5          -1      0.1    -3      0       0   	 0   0   0.5 0   0   #mat_slope  From Hannah et al 2002
#Fecundity
0       1         1               1          -1       0.8    -3      0       0       0   0   0.5 0   0   #WL_intercept_female    
0       1         0               1          -1       0.8    -3      0       0       0   0   0.5 0   0   #WL_slope_female 

#wt length for males
#0      3       0.004        0.0046       -1       0.8  -1      0       0       0   0   0.5 0   0   #WL_intercept_males    
#1      5       2.8           3.2         -1       0.8  -1      0       0       0   0   0.5 0   0   #WL_slope_males


#LO     HI      INIT    PRIOR   PR_type SD  PHASE   env-var use_dev dev_minyr dev_maxyr dev_stddev Block Block_Fxn
#Allocate_R_by_areas_x_gmorphs
-4   4   1   0   -1   99 -3  0   0   0   0   0 0   0   #frac to GP 1 in area 1
-4   4   1   0   -1   99 -3  0   0   0   0   0 0   0   #frac to GP 1 in area 1
#Allocate_R_by_season_(2seasons_in_this_case)
#LO     HI      INIT        PRIOR       PR_type SD  PHASE   env-var use_dev dev_minyr dev_maxyr dev_stddev  Block   Block_Fxn
-4      4       0           1           -1       99 -3      0       0           0       0           0.5     0   0   #frac R in season 1 
-4      4       1           1           -1       99 -3      0       0           0       0           0.5     0   0   #frac R in season 2

#CohortGrowDev
#SS3 manual says it must be given a value of 1 and a negative phase
#LO    HI   INIT    PRIOR   PR_type    SD     PHASE   env-var   use_dev   dev_minyr  dev_maxyr    dev_stddev   Block    Block_Fxn
 1     1      1       0       -1       99       -3       0         0          0          0              0         0         0

# Movement 
#LO    HI       INIT       PRIOR      PR_type     SD     PHASE   env-var   use_dev   dev_minyr  dev_maxyr    dev_stddev   Block    Block_Fxn
#-5      5       -4           1           -1       99      -3       0          0           0       0           0.5     0   0
#-5      5       -4           1           -1       99      -3       0          0           0       0           0.5     0   0 
 
#_Cond 0  #custom_MG-env_setup (0/1)
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no MG-environ parameters

#1 #_Cond 0  #custom_MG-block_setup (0/1)
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no MG-block parameters
#0.2      3      1.55       1      -1     0.1      5 #1 F_M_young_1
#0.2      3      1         1      -1     0.1      5 #1 F_M_young_2
#0.2      3      0.83       1      -1     0.1      5 #1 F_M_young_3

#_seasonal_effects_on_biology_parms
0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,L1,K,Malewtlen1,malewtlen2,L1,K      
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters

#_Cond -4 #_MGparm_Dev_Phase

#_Spawner-Recruitment
2   #_SR_function
#_LO    HI    INIT      PRIOR    PR_type   SD       PHASE
10      50     13.53        15       -1        5         1        #Ln(R0)	
 0 4 2.1 0.8 -1 0.09 -3 #SR_steep
0       1      0.4       0.8      -1        5         3        #SR_sigmaR 
-4      4      0.2       0        -1        1         -3       #Env_link_parameter
-5      5       0        0         0       0.2        -3       #SR_R1_offset
0       0       0        0        -1        0        -99       #SR_autocorr
0   #_SR_env_link
0   #_SR_env_target_0=none;1=devs;_2=R0;_3=steepness

1   #do_recdev:  0=none; 1=devvector; 2=simple deviations

1984    # first year of main recr_devs; early devs can preceed this era
2017    # last year of main recr_devs; forecast devs start in following year
1       #_recdev phase
0       # (0/1) to read 13 advanced options

#Rec cycles
#-4 # early recr dev start year
#2  # early recr dev phase
#0  # forecast recr phase
#1  # forecast recr devs lambda
#1890 # last year no bias adj
#1983 # first year full bias adj
#2015 # last year full bias adj
#2016 # first year no bias adj
#0.9 # max bias adj
#0 # period recr cycles
#-10 # min rec dev
#10  # max rec dev
#0  # n expl rec dev

#Fishing Mortality info
0.3 # F ballpark for tuning early phases
-2001   # F ballpark year (neg value to disable)
3   # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
5   # max F or harvest rate, depends on F_Method

# no additional F input needed for Fmethod 1
# read overall start F value; overall phase; N detailed inputs to read for Fmethod 2
# NUM ITERATIONS, FOR CONDITION 3
5   # read N iterations for tuning for Fmethod 3 (recommend 3 to 7)
#Fleet Year Seas F_value se phase (for detailed setup of F_Method=2)

#_initial_F_parms
#_LO HI INIT PRIOR PR_type  SD PHASE
0   3   0   0.0001  0       99  -3  #Fleet Peru
0   3   0   0.0001  0       99  -3  #Fleet Chile

#_Q_setup
#D=devtype(<0=mirror, 0/1=none, 2=cons, 3=rand, 4=randwalk)
#E=0=num/1=bio, F=err_type
#DISCUSS WHICH OPTION FOR Q (0 OR 1, OR 2)
#do power, env-var, extra SD, dev type
#do power for commercial CPUE, estimating extra SD, estimating q
0	0	0	0	#_Fishery_Per
0	0	0	0	#_Fishery_Chi
0	0	0	2	#_Survey_Adult_Per
0	0	0	2	#_Survey_Juven_Per
0	0	0	2	#_Survey_Juven_Chi
0	0	0	2	#_Survey_Spawing_Biomass_Chi

##Q para cada indice
-15	1.5	0.0755	0.0755	-1	99	2	#_Survey_Adult_Per
-15	1.5	0.0755	0.0755	-1	99	2	#_Survey_Juven_Per
-15	1.5	0.0755	0.0755	-1	99	2	#_Survey_Juven_Chi
-15	1.5	0.0755	0.0755	-1	99	2	#_Survey_Spawing_Biomass_Chi

#Seltype(1,2*Ntypes,1,4)    #SELEX_&_RETENTION_PARAMETERS
#Size_Slectivity,_enter_4_cols
#N_sel  Do_retain   Do_male Special
1	0	0	0	#_Fishery_Per
1	0	0	0	#_Fishery_Chi
30	0	0	0	#_Survey_Adult_Per_set:0
33	0	0	0	#_Survey_Juven_Per_set:33
1	0	0	0	#_Survey_Juven_Chi_set:33
30	0	0	0	#_Survey_Spawing_biomass_Chi_set:30

#Age_selectivity    #set_to_1
12	0	0	0	#_Fishery_Per
12	0	0	0	#_Fishery_Chi
10	0	0	0	#_Survey_Adult_Per
10	0	0	0	#_Survey_Juven_Per
12	0	0	0	#_Survey_Juven_Chi
10	0	0	0	#_Survey_Spawing_biomass_Chi

# fishery
#LO    HI    INIT    PRIOR    PR_type    SD    PHASE    env-variable    use_dev    dev_minyr    dev_maxyr    dev_stddev    Block_Pattern    Block_Type            
#3		20.3	12.0	12.0	-1	0.05	4	0	0	0	0	0.5	1	2	#
#-5.0	6.0		3		0.7		-1	0.05	-3	0	0	0	0	0.5	0	0	#
#-4.0	12.0	1.2		3.4		-1	0.05	4	0	0	0	0	0.5	1	2	#
#-2.0	10.0	6		0.2		-1	0.05	4	0	0	0	0	0.5	1	2	#
#-16.0	5.0		-15	   -8.9	    -1	0.05	-2	0	0	0	0	0.5	0	0	#
#-5.0	7.0		5.0		5.0		-1	0.05	4	0	0	0	0	0.5	1	2	#

# fishery
#LO      HI     INIT    PRIOR    PR_type    SD    PHASE    env-variable   use_dev  dev_minyr  dev_maxyr   dev_stddev    Block_Pattern    Block_Type            
5		18	12	15	-1	99	4	0	0	0	0	0.5	1	2	#_SizeSel_1P_1_Fishery_Chi
0.01	5	1.2	1.2	-1	99	4	0	0	0	0	0.5	0	0	#_SizeSel_1P_2_Fishery_Chi
5		18	12	7	-1	99	4	0	0	0	0	0.5	2	2	#_SizeSel_1P_1_Fishery_Per
0.01	5	1.2	1.2	-1	99	4	0	0	0	0	0.5	0	0	#_SizeSel_1P_2_Fishery_Per
3		13	7	7	-1	99	-2	0	0	0	0	0.5	0	0	#_SizeSel_1P_1_SurJuv_Chi
0.01	5	1.4	1.4	-1	99	-3	0	0	0	0	0.5	0	0	#_SizeSel_1P_2_SurJuv_Chi
0		1	0.5	0.5	-1	99	-2	0	0	0	0	0.5	0	0	#_AgeSel_1P_1_Fishery_Chi
0.01	1	0.4	1	-1	99	-3	0	0	0	0	0.5	0	0	#_AgeSel_1P_2_Fishery_Chi
0		1	0.5	0.5	-1	99	-2	0	0	0	0	0.5	0	0	#_AgeSel_1P_1_Fishery_Per
0.01	1	0.4	1	-1	99	-3	0	0	0	0	0.5	0	0	#_AgeSel_1P_2_Fishery_Per
0		1	0.5	0.3	-1	99	-2	0	0	0	0	0.5	0	0	#_AgeSel_1P_1_SurJuv_Chi
0.01	1	0.42	1	-1	99	-3	0	0	0	0	0.5	0	0	#_AgeSel_1P_2_SurJuv_Chi


1	#_customblock_setup
# replacement parameters for block periods
# Lo    Hi      Init    Prior   Prior   Prior   Param    
# bnd   bnd     value   mean    type    SD      phase    
5	15	12	15	-1	99	4	 #_SizeSel_1P_1_Fishery_Per
5	15	12	15	-1	99	4	 #_SizeSel_1P_1_Fishery_Per
5	15	12	15	-1	99	4	 #_SizeSel_1P_1_Fishery_Per
5	18	12	15	-1	99	4	 #_SizeSel_1P_1_Fishery_Per
5	15	12	15	-1	99	4	 #_SizeSel_1P_1_Fishery_Per
5	15	12	15	-1	99	4	 #_SizeSel_1P_1_Fishery_Per
5	15	12	15	-1	99	4	 #_SizeSel_1P_1_Fishery_Per
5	15	12	15	-1	99	4	 #_SizeSel_1P_1_Fishery_Per
4	15	12	15	-1	99	4	 #_SizeSel_1P_1_Fishery_Chi
7	15	12	15	-1	99	4	 #_SizeSel_1P_1_Fishery_Chi
7	15	12	15	-1	99	4	 #_SizeSel_1P_1_Fishery_Chi
7	15	12	15	-1	99	4	 #_SizeSel_1P_1_Fishery_Chi
7	15	10	12	-1	99	4	 #_SizeSel_1P_1_Fishery_Chi
7	15	10	12	-1	99	4	 #_SizeSel_1P_1_Fishery_Chi
7	15	10	12	-1	99	4	 #_SizeSel_1P_1_Fishery_Chi

1

###0 #_custom block setup (0/1)

#2   #logistic bounding
# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read; 1=read if tags exist
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters

0 #_Variance_adjustments_to_input_values
#0 0 0 0 0 0 0  #_add_to_survey_CV
#0.02 0.02 0.02 0.02 0 0 0 #_add_to_discard_stddev
#0 0 0 0 0 0 0 #_add_to_bodywt_CV
#2	1.4	1.6	1.2	1.3	1	1	#_mult_by_lencomp_N
#7 1.7 1.9 1.4 1 1 0.3    #_mult_by_agecomp_N
#1 1 1 1 1 1 1  #_mult_by_size-at-age_N

15 #_maxlambdaphase
1 #_sd_offset

0 # number of changes to make to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch;
# 9=init_equ_catch; 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin

0 # (0/1) read specs for more stddev reporting

999
