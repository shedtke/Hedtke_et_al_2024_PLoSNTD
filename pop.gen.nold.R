library(pegas)
library(adegenet)
library(viridisLite)
library(ggplot2)
library(reshape2)
#sim.maf.nold.vcf<-read.vcf("C:/Users/shann/Documents/Work/Hedtke_et_al_Simulium_RadSeq/sim_nob_populations.snps.maf.nold.recode.vcf",from=1,to=30000)
sim.maf.nold.vcf<-read.vcf("C:/Users/shann/Documents/Work/Hedtke_et_al_Simulium_RadSeq/sim_nob_populations.snps.maf.nold.all.recode.vcf",from=1,to=30000)


loci2genind(sim.maf.nold.vcf)->sim.maf.nold.gi

sim.maf.nold.cluster<-find.clusters(sim.maf.nold.gi,n.pc=300)

sim.maf.nold.X<-tab(sim.maf.nold.gi,NA.method="mean")
sim.maf.nold.xval<-xvalDapc(sim.maf.nold.X,grp=sim.maf.nold.cluster$grp,n.pca.max=300,training.set=.9,result="groupMean",center=TRUE,scale=FALSE,n.pca=NULL,n.rep=100,xval.plot=TRUE)
sim.maf.nold.xval
scatter(sim.maf.nold.xval$DAPC,scree.da=FALSE,legend=FALSE,pch=19,cstar=1,clab=0,cex=1.5,cellipse=1,col=mycol)
compoplot(sim.maf.nold.xval$DAPC,col=mycol)


mycol6<-c("#440154FF","#414487FF","#7AD151FF","#2A788EFF","#22A884FF","#FDE725FF")

as.data.frame(sim.maf.nold.xval$DAPC$posterior)->sim.tmp
sim.tmp$id<-rownames(sim.tmp) #%>% substr(start = 1, stop = 3)

sim.maf.nold.pop<-sim.tmp$id
sim.maf.nold.pop[grep('ALE',sim.maf.nold.pop)]<-"ALE"
sim.maf.nold.pop[grep('AWI',sim.maf.nold.pop)]<-"AWI"
sim.maf.nold.pop[grep('TSE',sim.maf.nold.pop)]<-"TSE"
sim.maf.nold.pop[grep('CW055',sim.maf.nold.pop)]<-"C"
sim.maf.nold.pop[grep('CW038',sim.maf.nold.pop)]<-"C"
sim.maf.nold.pop[grep('CW056',sim.maf.nold.pop)]<-"C"
sim.maf.nold.pop[grep('CW005',sim.maf.nold.pop)]<-"C"
sim.maf.nold.pop[grep('CW093',sim.maf.nold.pop)]<-"C"
sim.maf.nold.pop[grep('CW173',sim.maf.nold.pop)]<-"C"
sim.maf.nold.pop[grep('CW210',sim.maf.nold.pop)]<-"C"
sim.maf.nold.pop[grep('CW175',sim.maf.nold.pop)]<-"C"
sim.maf.nold.pop[grep('CW176',sim.maf.nold.pop)]<-"C"
sim.maf.nold.pop[grep('CW177',sim.maf.nold.pop)]<-"C"
sim.maf.nold.pop[grep('CW178',sim.maf.nold.pop)]<-"C"
sim.maf.nold.pop[grep('CW129',sim.maf.nold.pop)]<-"C"
sim.maf.nold.pop[grep('CW208',sim.maf.nold.pop)]<-"C"
sim.maf.nold.pop[grep('CW078',sim.maf.nold.pop)]<-"D"
sim.maf.nold.pop[grep('CW022',sim.maf.nold.pop)]<-"D"
sim.maf.nold.pop[grep('CW023',sim.maf.nold.pop)]<-"D"
sim.maf.nold.pop[grep('CW039',sim.maf.nold.pop)]<-"D"
sim.maf.nold.pop[grep('CW024',sim.maf.nold.pop)]<-"D"
sim.maf.nold.pop[grep('CW040',sim.maf.nold.pop)]<-"D"
sim.maf.nold.pop[grep('CW058',sim.maf.nold.pop)]<-"D"
sim.maf.nold.pop[grep('CW007',sim.maf.nold.pop)]<-"D"
sim.maf.nold.pop[grep('CW076',sim.maf.nold.pop)]<-"D"
sim.maf.nold.pop[grep('CW008',sim.maf.nold.pop)]<-"D"
sim.maf.nold.pop[grep('CW060',sim.maf.nold.pop)]<-"D"
sim.maf.nold.pop[grep('CW077',sim.maf.nold.pop)]<-"D"
sim.maf.nold.pop[grep('CW114',sim.maf.nold.pop)]<-"D"
sim.maf.nold.pop[grep('CW130',sim.maf.nold.pop)]<-"D"
sim.maf.nold.pop[grep('CW148',sim.maf.nold.pop)]<-"D"
sim.maf.nold.pop[grep('CW149',sim.maf.nold.pop)]<-"D"
sim.maf.nold.pop[grep('CW165',sim.maf.nold.pop)]<-"D"
sim.maf.nold.pop[grep('CW150',sim.maf.nold.pop)]<-"D"
sim.maf.nold.pop[grep('CW211',sim.maf.nold.pop)]<-"D"
sim.maf.nold.pop[grep('CW167',sim.maf.nold.pop)]<-"D"
sim.maf.nold.pop[grep('CW185',sim.maf.nold.pop)]<-"D"
sim.maf.nold.pop[grep('CW212',sim.maf.nold.pop)]<-"D"
sim.maf.nold.pop[grep('CW168',sim.maf.nold.pop)]<-"D"
sim.maf.nold.pop[grep('CW186',sim.maf.nold.pop)]<-"D"
sim.maf.nold.pop[grep('CW187',sim.maf.nold.pop)]<-"D"
sim.maf.nold.pop[grep('CW204',sim.maf.nold.pop)]<-"D"
sim.maf.nold.pop[grep('CW011',sim.maf.nold.pop)]<-"F"
sim.maf.nold.pop[grep('CW028',sim.maf.nold.pop)]<-"F"
sim.maf.nold.pop[grep('CW046',sim.maf.nold.pop)]<-"F"
sim.maf.nold.pop[grep('CW012',sim.maf.nold.pop)]<-"F"
sim.maf.nold.pop[grep('CW029',sim.maf.nold.pop)]<-"F"
sim.maf.nold.pop[grep('CW047',sim.maf.nold.pop)]<-"F"
sim.maf.nold.pop[grep('CW048',sim.maf.nold.pop)]<-"F"
sim.maf.nold.pop[grep('CW066',sim.maf.nold.pop)]<-"F"
sim.maf.nold.pop[grep('CW082',sim.maf.nold.pop)]<-"F"
sim.maf.nold.pop[grep('CW100',sim.maf.nold.pop)]<-"F"
sim.maf.nold.pop[grep('CW083',sim.maf.nold.pop)]<-"F"
sim.maf.nold.pop[grep('CW101',sim.maf.nold.pop)]<-"F"
sim.maf.nold.pop[grep('CW084',sim.maf.nold.pop)]<-"F"
sim.maf.nold.pop[grep('CW156',sim.maf.nold.pop)]<-"F"
sim.maf.nold.pop[grep('CW172',sim.maf.nold.pop)]<-"F"
sim.maf.nold.pop[grep('CW190',sim.maf.nold.pop)]<-"F"
sim.maf.nold.pop[grep('CW118',sim.maf.nold.pop)]<-"F"
sim.maf.nold.pop[grep('CW169',sim.maf.nold.pop)]<-"F"
sim.maf.nold.pop[grep('CW120',sim.maf.nold.pop)]<-"F"
sim.maf.nold.pop[grep('CW137',sim.maf.nold.pop)]<-"F"
sim.maf.nold.pop[grep('CW154',sim.maf.nold.pop)]<-"F"
sim.maf.nold.pop[grep('CW170',sim.maf.nold.pop)]<-"F"
sim.maf.nold.pop[grep('CW188',sim.maf.nold.pop)]<-"F"
sim.maf.nold.pop[grep('CW219',sim.maf.nold.pop)]<-"F"
sim.maf.nold.pop[grep('CW138',sim.maf.nold.pop)]<-"F"
sim.maf.nold.pop[grep('CW155',sim.maf.nold.pop)]<-"F"
sim.maf.nold.pop[grep('CW171',sim.maf.nold.pop)]<-"F"
sim.maf.nold.pop[grep('CW189',sim.maf.nold.pop)]<-"F"
sim.maf.nold.pop[grep('CW119',sim.maf.nold.pop)]<-"F"

sim.maf.nold.pop

sim.tmp$location<-sim.maf.nold.pop

sim.tmp$K<-"K = 2"

sim.tmp3<-melt(sim.tmp,id=c("location","id","K"))

names(sim.tmp3)[4:5]<-c("Group","Posterior")

ggplot(sim.tmp3, aes(x = id, y = Posterior, fill = Group))+geom_bar(stat = "identity")+theme_bw()+ylab("Posterior membership probability")+ theme(legend.position='none')+scale_fill_manual(values=mycol6)+ theme(axis.text.x = element_text(angle = 90, hjust = 1, size = 8))->sim.ggp

sim.ggp+facet_grid(K ~ location, scales = "free_x", space = "free")


sim.maf.nold.fac<-as.factor(sim.maf.nold.pop)

sim.maf.nold.pca<-dudi.pca(sim.maf.nold.X,center=TRUE,scale=FALSE)

s.class(sim.maf.nold.pca$li,fac=sim.maf.nold.fac,col=transp(mycol,.8),cstar=0,clab=0,cellipse=0,axesel=FALSE,cpoint=1.5,grid=FALSE,pch=19)

sim.pca2.pca3.df<-data.frame(sim.maf.nold.pca$li$Axis2,sim.maf.nold.pca$li$Axis3)
s.class(sim.pca2.pca3.df,fac=sim.maf.nold.fac,col=transp(mycol,.8),cstar=0,clab=0,cellipse=0,axesel=FALSE,cpoint=1.5,grid=FALSE,pch=19)

sim.pca1.pca3.df<-data.frame(sim.maf.nold.pca$li$Axis1,sim.maf.nold.pca$li$Axis3)
s.class(sim.pca1.pca3.df,fac=sim.maf.nold.fac,col=transp(mycol,.8),cstar=0,clab=0,cellipse=0,axesel=FALSE,cpoint=1.5,grid=FALSE,pch=19)

sim.maf.nold.pca$eig

sim.maf.nold.pca$eig[1]/sum(sim.maf.nold.pca$eig)
## [1] 0.07165454
sim.maf.nold.pca$eig[2]/sum(sim.maf.nold.pca$eig)
## [1] 0.01252697
sim.maf.nold.pca$eig[3]/sum(sim.maf.nold.pca$eig)
## [1] 0.008878212


mycol6<-c("#440154FF","#414487FF","#7AD151FF","#2A788EFF","#22A884FF","#FDE725FF")

sim.maf.nold.xval<-xvalDapc(sim.maf.nold.X,grp=sim.maf.nold.fac,n.pca.max=300,training.set=.9,result="groupMean",center=TRUE,scale=FALSE,n.pca=NULL,n.rep=100,xval.plot=TRUE)
sim.maf.nold.xval
scatter(sim.maf.nold.xval$DAPC,scree.da=FALSE,legend=FALSE,pch=19,cstar=1,clab=0,cex=1.5,cellipse=1,col=mycol)
compoplot(sim.maf.nold.xval$DAPC,col=mycol)

as.data.frame(sim.maf.nold.xval$DAPC$posterior)->sim.tmp
sim.tmp$id<-rownames(sim.tmp) #%>% substr(start = 1, stop = 3)
sim.tmp$location<-sim.maf.nold.pop

sim.tmp$K<-"K = 6"

sim.tmp3<-melt(sim.tmp,id=c("location","id","K"))

names(sim.tmp3)[4:5]<-c("Group","Posterior")

ggplot(sim.tmp3, aes(x = id, y = Posterior, fill = Group))+geom_bar(stat = "identity")+theme_bw()+ylab("Posterior membership probability")+ theme(legend.position='none')+scale_fill_manual(values=mycol6)+ theme(axis.text.x = element_text(angle = 90, hjust = 1, size = 8))->sim.ggp

sim.ggp+facet_grid(K ~ location, scales = "free_x", space = "free")


