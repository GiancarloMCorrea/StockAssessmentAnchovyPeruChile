#install.packages("devtools")
#devtools::install_github("r4ss/r4ss")
#
options(browser="/usr/bin/google-chrome-stable")
library(r4ss)
out<-SS_output(dir=getwd())
SS_plots(out)
#LIMPIA LA CARPETA DE FIGURAS
#path1<-paste("rm ",getwd(),"/plots/*.*",sep="")
#system(path1)
break
# Time-varying fishery selectivity
selex <- out$ageselex[out$ageselex$year>=1990 & out$ageselex$factor=="Asel" & out$ageselex$fleet==1,as.character(1:8)]
mountains(selex,yvec=1990:2015)

#Create a folder call PacifiHakeNoExtraSE and turn off extra SE parameter on index of abundance
#delete the plots folder within this new folder
myDir <- "C:/2015/CAPAM/SS/PacificHakeNoExtraSE"
out2 <- SS_output(dir=myDir,covar=F)
SS_plots(out2,uncertainty=F)

#Create a directory called PacificHakeRemoveAcYrs
#Now remove the two survey years that seem biased (2001 and 2009)
#and estimate the extra SE
#Not receommended unless obvious reason to remove data
myDir <- "C:/NOAA2016/CAPAM/Examples/PacificHakeRemoveAcYrs"
out3 <- SS_output(dir=myDir,covar=F)
SS_plots(out3,uncertainty=F)

#Try the Francis weighting recommendation for fishery
myDir <- "C:/NOAA2016/CAPAM/Examples/PacificHakeFrancisWt"
out4 <- SS_output(dir=myDir,covar=F)
SS_plots(out4,uncertainty=F)

#compare the 4 hake models just run
mymodels <- list(out,out2,out3,out4)
mysummary <- SSsummarize(mymodels)
modelnames <- c("PHbase","noExtraSE","RemoveAcYrs","FrancisWt")
SSplotComparisons(mysummary, legendlabels=modelnames,endyr=2015, densitynames = c("SPB_Virgin","R0","Recr_2010"))

