# rm(list=ls())
# library(r4ss)

#LEE ARCHIVO .REP

getSummaryOne = function(pathmod = "models", LabAxLineX = 2.5, LabAxLineY = 2.5,
                         LabAxCex = 0.8, AxCex = 0.8, BioFac = 1000000){

# pathmod <- "models" # no se debe cambiar
allModels = list.files(path = pathmod)
# LabAxLineX = 2.5
# LabAxLineY = 2.5
# LabAxCex = 0.8
# AxCex = 0.8
# BioFac = 1000000
i = 1

out <- SS_output(dir = file.path(pathmod, allModels[i]),
               printstats=FALSE,verbose=FALSE)

dat <- out$timeseries
a1 <- which(dat$Era=="TIME")
yrs <- dat$Yr[a1];bios<-dat$Bio_all[a1];spaw<-dat$SpawnBio[a1]
ano <- seq(yrs[1],yrs[length(yrs)]+0.5,by=0.5)
#LEE ARCHIVO .STD
year <- out$startyr:out$endyr
yy <- length(year)

std <- read.table(file.path(pathmod, paste0(allModels[i], "/SS3.std")),
                  header=T,sep="",na="NA",fill=T) #take care other names

#EXTRAE BIOMASA DESOVANTE CON STD
spo.me = spo.sd=vector()
spo.me <- std[which(std$name == "SPB_std"),3]
spo.me2 = spo.me[(length(spo.me) - length(year) + 1):length(spo.me)]
spo.sd <- std[which(std$name == "SPB_std"),4]
spo.sup <- spo.me+2*spo.sd
spo.inf <- spo.me-2*spo.sd
spo.sup2 = spo.sup[(length(spo.sup) - length(year) + 1):length(spo.sup)]
spo.inf2 = spo.inf[(length(spo.inf) - length(year) + 1):length(spo.inf)]
spo.pol <- rbind(cbind(year,spo.sup2),
               cbind(rev(year),rev(spo.inf2)))


#EXTRAE RECLUTAMIENTOS CON STD
#r0<-as.numeric(strsplit(sso[315]," ")[[1]][1])
r0 <- exp(out$parameters["SR_LN(R0)", "Value"]) # R0 estimado?
rec.me=rec.sd=vector()
rec.me <- std[which(std$name == "recr_std"),3]
rec.me2 = rec.me[(length(rec.me) - length(year) + 1):length(rec.me)]
rec.sd <- std[which(std$name == "recr_std"),4]
rec.sd2 = rec.sd[(length(rec.sd) - length(year) + 1):length(rec.sd)]
rec.sup<-rec.me2+2*rec.sd2
rec.inf<-rec.me2-2*rec.sd2

#EXTRAE LOS DESVIOS DE RECLUTAMIENTOS
dev.me=dev.sd=vector()
dev.me<-std[which(std$name == "recdev1"),3]
dev.sd<-std[which(std$name == "recdev1"),4]
dev.sup<-dev.me+2*dev.sd
dev.inf<-dev.me-2*dev.sd
#

#EXTRAE MORTALIDADES POR PESCA CON STD
morf1.me=morf1.sd=vector()
morf1.me<-std[which(std$name == "F_std"),3]
morf1.sd<-std[which(std$name == "F_std"),4]
morf1.sup<-morf1.me+2*morf1.sd
morf1.inf<-morf1.me-2*morf1.sd
# morf2.me=morf2.sd=vector()
# morf2.me<-std[108:175,3];morf2.sd<-std[108:175,4]
# morf2.sup<-morf2.me+2*morf2.sd;morf2.inf<-morf2.me-2*morf2.sd
#
#EXTRAE LAS SELECTIVIDADES POR BLOQUES
# sizesel<-out[[55]];talla<-seq(3.25,23.25,by=0.5);tt<-length(talla)
# sel.f1=sel.f2=sel.cr=matrix();sel.f1<-sizesel[2:14,6:46]
# sel.f2<-sizesel[18:35,6:46];sel.cr<-sizesel[42,6:46]
# f1<-dim(sel.f1);f2<-dim(sel.f2)
# agesel<-out[[56]];age<-seq(0,4,by=1)
# age.f1<-agesel[3,8:12];age.f2<-agesel[7,8:12];age.cr<-agesel[14,8:12]
#

#GRAFICA FIGURA UNO
azul0<-adjustcolor("#0000FF",alpha.f=0.3)
azul1<-"#00008B"
m<-matrix(c(1:4),ncol=2,byrow=T)
# ay1<-seq(0, maxBio, by=500)
# ay2<-seq(0,2000000,by=500000)
# ay3<-seq(0,3,by=0.5);ay4<-seq(-2.5,2.5,by=0.5)

name1 <- "outFiles/resumen1.png"

png(file=name1, width=850, height=650, units = "px", res = 130)

layout(m,widths=c(1,1),heights=c(1,1))
par(oma=c(4,4,0.5,4))

par(mar = c(0,0,0,0))
Biovec = bios/BioFac
plot(ano, Biovec, type="l", col=4, xlab="", ylab="", axes=F)
points(ano, Biovec, pch=21, col=4)
axis(2, at=pretty(Biovec),  las=1, cex.axis = AxCex)
axis(1, at=pretty(year), labels = NA, cex.axis = AxCex)
# mtext("Años",side=1,line=3.4,cex=1.3)
mtext("Biomasa total (mt)", side=2, cex=LabAxCex, line = LabAxLineY)
legend("topright", legend = "a)", bty = "n")
box()


Biovec2 = spo.me2/BioFac
spo.pol2 = spo.pol
spo.pol2[,2] = spo.pol[,2]/BioFac
plot(spo.pol2[,1],spo.pol2[,2],type="l",col=0,xlab="",ylab="",axes = FALSE)
polygon(spo.pol2, col=azul0,border=azul0)
lines(year,spo.me2/BioFac,col=azul1)
points(year,spo.me2/BioFac,pch=21,col=azul1)
axis(4,at=pretty(spo.pol2[,2]),las=1, cex.axis = AxCex)
axis(1, at=pretty(year), labels = NA, cex.axis = AxCex)
# mtext("Años",side=1,line=3.4,cex=1.3)
mtext("Biomasa desovante (mt)", side=4, line=LabAxLineY, cex=LabAxCex)
legend("topright", legend = "b)", bty = "n")
box()


plot(year,dev.me,col=0,xlab="",ylab="",axes = FALSE, 
     ylim = c(min(dev.inf), max(dev.sup)))
points(year,dev.me, pch=21, col=4, bg=4)
segments(year,dev.sup,year,dev.inf,col=4)
#points(year[1]-1,r0,pch=21,col=4)
abline(h=0,lty=2,col=4)
axis(2, at=pretty(dev.me), las=1, cex.axis = AxCex)
axis(1, at=pretty(year), labels = pretty(year), cex.axis = AxCex)
mtext("Años",side=1,line=LabAxLineX,cex=LabAxCex)
mtext("Desvios de reclutamiento",side=2,line = LabAxLineY, cex=LabAxCex)
# text(year[yy]+2.6,r0,expression(R[paste("0")]),cex=1.4,pos=1,xpd=T,col=4)
legend("topright", legend = "c)", bty = "n")
box()



plot(year,morf1.me,col=0,xlab="", ylab="", axes = FALSE, 
     ylim = c(min(morf1.inf), max(morf1.sup)))
points(year,morf1.me, col=2, pch = 19)
segments(year, morf1.sup, year, morf1.inf, col=2)
# lines(ano,morf2.me,col=4,lwd=2)
axis(4, at=pretty(morf1.me), las=1, cex.axis = AxCex)
axis(1, at=pretty(year), labels = pretty(year), cex.axis = AxCex)
mtext("Años",side=1,line=LabAxLineX, cex=LabAxCex)
mtext("Mortalidad por pesca", side=4, line=LabAxLineY, cex=LabAxCex)
legend("topright", legend = "d)", bty = "n")
box()

dev.off()

}