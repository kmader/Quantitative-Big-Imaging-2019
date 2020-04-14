library("ggplot2")
library("plyr")
#' Write the matching table from the tracking function as a file that looks like a standard output
#' @author Kevin Mader (kevin.mader@gmail.com)
#' 
#' @param raw.data is the input table
#' @param file.name is the name of the output file
#' @param add.extra.header adds an extra line of header
#' @param rem.char.cols removes character columns
#' @param max.na.col the maximum number of NAs in a column and still keep it
write.tiplcsv<-function(raw.data,file.name,add.extra.header=F,rem.char.cols=T,max.na.col=5,...) {
  f<-file(file.name,"w")
  if (add.extra.header) {  
    writeLines("// Sample: /home/scratch//virtAIM-3534171117255118373, Map: /home/scratch//virtAIM-3534171117255118373, Thickness:(8.191250068658265):/home/scratch//virtAIM-419118365814064047, Neighbors:(1.0):",f)
  }
  num.cols<-which(sapply(raw.data[1,],is.numeric))
  if (rem.char.cols) {
    out.data<-raw.data[,num.cols]
  } else {
    out.data<-raw.data
  }
  
  valid.cols<-which(colSums(is.na(out.data))<max.na.col)
  out.data<-na.omit(out.data[,valid.cols])
  write.csv(out.data,f,row.names=F,quote=F,...)
  close(f)
}
# write to match or at least be clsoe to the old output files
write.csv.chris<-function(raw.in.data,file.name,skip.cols=c("TRIANGLES","D_TRIANGLES","Chain","MChain","Count","Frame"),...) {
  in.data<-ddply(raw.in.data,.(MChain), # calculate the statistics for each chain
        function(c.chunk) {
          data.frame(c.chunk,
                     Count=nrow(c.chunk),
                     Ch.Max.Jump.Z=max(abs(c.chunk$DIR_Z)),
                     Ch.Mean.Jump.Z=mean((c.chunk$DIR_Z)),
                     Ch.Total.Disp.Z=max(c.chunk$POS_Z)-min(c.chunk$POS_Z),
                     Ch.Sd.Jump.Z=sd(c.chunk$DIR_Z),
                     Ch.Max.Jump.R=max(abs(c.chunk$dr)),
                     Ch.Sd.Jump.R=sd(c.chunk$dr))
        })
  in.data<-in.data[with(in.data, order(Frame)), ]
  write.data<-cbind(Frame=in.data$Frame,Chain=in.data$MChain,Chain_Length=in.data$Count,"Component 1"=in.data$LACUNA_NUMBER,
                    "Component 2"=in.data$LACUNA_NUMBER+in.data$D_LACUNA_NUMBER,
                    Match_Quality=in.data$M_MATCH_DIST,
                    in.data[,!(names(in.data) %in% skip.cols)])
  write.data$Matching<-as.numeric(as.factor(write.data$Matching))
  write.data<-colwise(function(x) { # remove true and false and replace with 1 and 0
    if ("logical" %in% class(x)) as.numeric(x)
    else x
  })(write.data)
  write.csv(write.data,file.name,row.names=F,na="",qmethod="double")
}

# Simply define coordinates such that Z is always positive
fix.pca.direction<-function(poros.table,with.density=T,with.volume=T) {
  poros.table$PCA1_X<-poros.table$PCA1_X*sign(poros.table$PCA1_Z)
  poros.table$PCA1_Y<-poros.table$PCA1_Y*sign(poros.table$PCA1_Z)
  poros.table$PCA1_Z<-poros.table$PCA1_Z*sign(poros.table$PCA1_Z)
  poros.table$PCA3_X<-poros.table$PCA3_X*sign(poros.table$PCA3_Z)
  poros.table$PCA3_Y<-poros.table$PCA3_Y*sign(poros.table$PCA3_Z)
  poros.table$PCA3_Z<-poros.table$PCA3_Z*sign(poros.table$PCA3_Z)
  
  # define angles
  poros.table$Theta_1<-180/pi*acos(poros.table$PCA1_Z)
  poros.table$Theta_3<-180/pi*acos(poros.table$PCA3_Z)
  poros.table$Phi_1<-180/pi*atan2(poros.table$PCA1_Y,poros.table$PCA1_X)
  poros.table$Phi_3<-180/pi*atan2(poros.table$PCA3_Y,poros.table$PCA3_X)
  if (with.volume) poros.table$Volume<-poros.table$VOLUME*1e9 # um3
  if (with.density) poros.table$Density<-1/(poros.table$DENSITY_CNT) # per um3
  poros.table
}
# Rescale the correct data columns by the scale factor
scaleData<-function(inData,skip.cols=c(),force.scale=NULL) {
  outData<-inData
  varList<-names(inData)
  varList<-varList[!(varList %in% c("X..LACUNA_NUMBER","TRIANGLES","NEIGHBORS","NEIGHBORS_STD","CANAL_REGION",skip.cols))] # remove value columns
  oVar<-unlist(lapply(varList,function(x) regexpr("PCA\\d_[XYZ]",x)))<0 # remove pca columns
  varList<-varList[oVar]
  oVar<-unlist(lapply(varList,function(x) regexpr("SCALE_[XYZ]",x)))<0 # scale columns
  varList<-varList[oVar]
  oVar<-unlist(lapply(varList,function(x) regexpr("_ANGLE",x)))<0 # angle columns
  varList<-varList[oVar]
  oVar<-unlist(lapply(varList,function(x) regexpr("_GRAD_",x)))<0 # angle columns
  varList<-varList[oVar]
  volVar<-unlist(lapply(varList,function(x) regexpr("VOLUME.?",x)))<0 # remove volume column
  volVar[varList %in% "DENSITY_CNT"]<-F # add the density column
  shapeVar<-unlist(lapply(varList,function(x) regexpr("SHAPET.",x)))<0 # remove shape tensor data
  linList<- varList[volVar & shapeVar]
  areaList<-varList[!shapeVar]
  volList<-varList[!volVar]
  # Scaling Factor
  if (is.null(force.scale)) {
    scaleF<-(inData$SCALE_X*inData$SCALE_Y*inData$SCALE_Z)^0.33
  } else {
    scaleF<-force.scale
    outData$SCALE_X<-force.scale
    outData$SCALE_Y<-force.scale
    outData$SCALE_Z<-force.scale
  }
  
  for(cCol in linList) {
    outData[[cCol]]<-scaleF*inData[[cCol]]
  }
  for(cCol in areaList) {
    outData[[cCol]]<-scaleF^2*inData[[cCol]]
  }
  for(cCol in volList) {
    outData[[cCol]]<-scaleF^3*inData[[cCol]]
  }
  outData
}
# Add radius columns to the data using the given center
addRadiusCols<-function(tracked.data,xcent,ycent,zcent=0,inc.tracking=T) {
  tracked.data$r<-sqrt((tracked.data$POS_X-xcent)^2+(tracked.data$POS_Y-ycent)^2)
  tracked.data$theta<-atan2(tracked.data$POS_Y-ycent,tracked.data$POS_X-xcent)
  if (inc.tracking) tracked.data$dr<-sqrt((tracked.data$POS_X+tracked.data$DIR_X-xcent)^2+(tracked.data$POS_Y+tracked.data$DIR_Y-ycent)^2)-tracked.data$r
  # spherical coordinates
  tracked.data$sr<-sqrt((tracked.data$POS_X-xcent)^2+(tracked.data$POS_Y-ycent)^2+(tracked.data$POS_Z-zcent)^2)
  if (inc.tracking) tracked.data$dsr<-sqrt(tracked.data$DIR_X^2+tracked.data$DIR_Y^2+tracked.data$DIR_Z^2)
  tracked.data
}

# rough combine data function
ggdata<-function(goldData,matchData,colNames) {
  outData<-data.frame(X1=goldData[[colNames[1]]],Y1=matchData[[colNames[1]]])
  for (i in 2:length(colNames)) { 
    outData[[paste("X",i,sep="")]]<-goldData[[colNames[i]]]
    outData[[paste("Y",i,sep="")]]<-matchData[[colNames[i]]]
  }
  outData
}


foam.correct.rotation<-function(in.data,mt.data) {
  x.dist<-quantile(in.data$POS_X)
  y.dist<-quantile(in.data$POS_Y)
  par.guess<-c(x.dist[3],y.dist[3],0)
  par.min<-c(x.dist[2],y.dist[2],-pi)
  par.max<-c(x.dist[4],y.dist[4],pi)
  par.as.tf<-function(in.par) {
    tr.mat<-matrix(0,nrow=4,ncol=3)
    tr.mat[1,c(1,2)]<-in.par[c(1,2)]
    tr.mat[2,1]<-cos(in.par[3])
    tr.mat[2,2]<-sin(in.par[3])
    tr.mat[3,1]<--sin(in.par[3])
    tr.mat[3,2]<-cos(in.par[3])
    tr.mat[4,3]<-1
    tr.mat
  }
  par.distance<-function(in.par) {
    cor.data<-foam.correction.fcn(in.data,par.as.tf(in.par))
    mean(matchBubbles(cor.data,mt.data,do.bij=F)$MATCH_DIST)
  }
  par.best<-optim(par.guess,par.distance,lower=par.min,upper=par.max)
  par.as.tf(par.best$par)
}

#
foam.correction.fcn<-function(in.table,in.matrix,xyz.names=c("POS_X","POS_Y","POS_Z")) {
  out.table<-in.table
  rdat<-as.matrix(in.table[,xyz.names])
  rdat<-sweep(rdat,MARGIN=2,t(in.matrix[1,]),FUN="-")
  rdat<-rdat %*% as.matrix(in.matrix[-1,])
  rdat<-sweep(rdat,MARGIN=2,t(in.matrix[1,]),FUN="+")
  out.table[[xyz.names[1]]]<-rdat[,1]
  out.table[[xyz.names[2]]]<-rdat[,2]
  out.table[[xyz.names[3]]]<-rdat[,3]
  out.table
}
# create an ellipse using the given points (useful for plotting fields using ellipses)
create.ellipse.points<-function(x.off=0,y.off=0,a=1,b=NULL,th.off=0,th.max=2*pi,pts=36,...) {
  if (is.null(b)) b<-a
  th<-seq(0,th.max,length.out=pts)
  data.frame(x=a*cos(th.off)*cos(th)+b*sin(th.off)*sin(th)+x.off,y=-1*a*sin(th.off)*cos(th)+b*cos(th.off)*sin(th)+y.off,id=as.factor(paste(x.off,y.off,a,b,th.off,pts,sep=":")),...)
}
# read in csv file
compare.foam.corrected<-function(lacFile,tf.data=NULL,tf.file=NULL,...) {
  raw.data<-read.csv(lacFile,skip=1) # use the original coordinate system
  if (is.null(tf.data)) { # this can all be skipped if a matrix is supplied for tf.data
    if (is.null(tf.file)) tf.file<-paste(lacFile,"_tf.dat",sep="")
    tf.file<-Sys.glob(tf.file) # is the file really there
    if (length(tf.file)>0) tf.data<-read.csv(tf.file,header=F)
    
  }
  
  if (!is.null(tf.data)) {
    # Store the standard coordinates
    # make sure it has the same size as the simple read file (don't pass other arguments)
    prep.data<-compare.foam.clean(raw.data) 
    
    raw.data$ORIG_POS_X<-prep.data$POS_X
    raw.data$ORIG_POS_Y<-prep.data$POS_Y
    raw.data$ORIG_POS_Z<-prep.data$POS_Z
    # Process the rotation
    raw.data<-foam.correction.fcn(raw.data,tf.data)  
  }
  # Columns to skip by rescaling
  skip.cols<-c("ORIG_POS_X","ORIG_POS_Y","ORIG_POS_Z")
  compare.foam.clean(raw.data,skip.cols=skip.cols,...) # process the input normally
}
compare.foam.clean<-function(ibubs,minMaskDistance=0,minVolCnt=0,checkProj=T,maxProjOfRange=0.7,extCols=T,force.scale=NULL,...) {
  names(ibubs)<-toupper(names(ibubs)) # make everything uppercase
  if ( minVolCnt>=0) ibubs<-ibubs[ibubs$VOLUME>minVolCnt,]
  if (minMaskDistance>0) ibubs<-ibubs[ibubs$MASK_DISTANCE_MEAN>minMaskDistance,]
  # To avoid periodic boundary conditions
  if (checkProj) {
    vRange<-function(iVar) {maxProjOfRange*(summary(iVar)[["Max."]]-summary(iVar)[["Min."]])}
    
    zRange<-vRange(ibubs$POS_Z)
    ibubs<-ibubs[ibubs$PROJ_Z<zRange,]
    yRange<-vRange(ibubs$POS_Y)
    ibubs<-ibubs[ibubs$PROJ_Y<yRange,]
    xRange<-vRange(ibubs$POS_X)
    ibubs<-ibubs[ibubs$PROJ_X<xRange,]
  }
  
  ibubs<-scaleData(ibubs,force.scale=force.scale,...)
  if (extCols) {
    ibubs$AISO<-(ibubs$PCA1_S-ibubs$PCA3_S)/(ibubs$PCA1_S) # add ansiotropy
    ibubs$OBLATENESS<-2*(ibubs$PCA2_S-ibubs$PCA3_S)/(ibubs$PCA1_S-ibubs$PCA3_S)-1 # add oblateness
  }
  names(ibubs)[1]<-"LACUNA_NUMBER"
  ibubs
}

# simData<-compare.foam("/Volumes/VERBATIM/WorkData/Foam/SmallAllBubbleCoarsening/Step_00500/",kevinFile="PostRelax/out_Step_00100.vtk/glpor_1.csv")
# simData600<-compare.foam("/Volumes/VERBATIM/WorkData/Foam/SmallAllBubbleCoarsening/Step_00500/",kevinFile="PostRelax/out_Step_00600.vtk/glpor_1.csv")
#
# Plot Volume vs Volume with Error
# 
volShow<-function(iData) {
  ggplot(iData,aes(x=VOLUME,y=M_VOLUME))+geom_jitter(aes(size=VOLUME,color=M_MASK_DISTANCE_MEAN<40))+scale_fill_brewer(palette="Set1")+geom_smooth()+coord_fixed()+scale_x_log10()+scale_y_log10()
}
neighShow<-function(iData) {
  ggplot(iData,aes(x=NEIGHBORS,y=M_NEIGHBORS))+geom_jitter(aes(size=VOLUME,color=M_MASK_DISTANCE_MEAN<40,alpha=M_MASK_DISTANCE_MEAN/20))+scale_fill_brewer(palette="Set1")+geom_smooth()+coord_fixed()
}

aisoShow<-function(iData) {
  ggplot(iData,aes(x=(PCA1_S-PCA3_S)/PCA1_S,y=(M_PCA1_S-M_PCA3_S)/M_PCA1_S))+geom_jitter(aes(size=VOLUME,color=M_MASK_DISTANCE_MEAN<40,alpha=M_MASK_DISTANCE_MEAN/20))+scale_fill_brewer(palette="Set1")+geom_smooth()+coord_fixed()
}

corTable<-function(iData) {
  cNames<-names(iData)
  oVar<-data.frame(MD=mean(iData$M_MATCH_DIST))
  
  for (cVar in cNames) {
    
    cStd<-sd(iData[[cVar]])
    
    if (!is.na(cStd)) {
      mcVar<-paste("M_",cVar,sep="")
      if ((cVar %in% cNames) & (mcVar %in% cNames) & (cStd!=0)) { 
        oVar[[cVar]]<-cor(iData[[cVar]],iData[[mcVar]])
      }
    }
  }
  oVar
}
ggfactorPlot<-function(inG,inData,fCol) {
  outG<-inG
  for (ij in levels(as.factor(inData[[fCol]]))) {
    outG<-outG+geom_smooth(data=subset(inData,inData[fCol] == ij))
  }
  outG
}


# Simple Histogram plotting function for use with lapply
plotHist<-function(inData,...) {
  hist(inData$VOLUME,...)
  par(new=T)
}
# Turn a wrapping index column into a measurement number column
measureCol<-function(indexData) { 
  measureCol<-indexData
  measureCol[1]<-1
  for (i in 2:length(indexData)) { measureCol[i]<-measureCol[i-1]+(indexData[i]<indexData[i-1])}
  measureCol
}
merge.lists<-function(inData,sampleColFunc=measureCol,indexCol=1) {
  mergeData<-do.call(rbind,inData)
  mergeData$MEASURE<-sampleColFunc(mergeData[[indexCol]])
  mergeData
}
re.extract<-function(regStr,inStr) {
  cRes<-regexpr(regStr,inStr)
  substr(inStr,cRes[1],cRes[1]+attr(cRes,"match.length")-1)
}
stepFromSample<-function(cStr) {
  cRes<-re.extract("Step_\\d+[.]vtk",cStr)
  as.integer(re.extract("\\d+",cRes))
}
# showMatchRes(ggplot(wwMcor))
max_round<-function(in_list,nearest_val,min_val,max_val,round_fun) {
  out_list<-in_list
  out_list[which(out_list>max_val)]<-max_val
  out_list[which(out_list<min_val)]<-min_val
  round_any(out_list,nearest_val,round_fun)
}
showMatchRes<-function(inGplot) {
  outG<-inGplot+geom_jitter(aes(x=STEPS,y=VOLUME,colour="Volume"))
  outG<-outG+geom_jitter(aes(x=STEPS,y=NEIGHBORS,colour="Faces"))
  outG<-outG+geom_jitter(aes(x=STEPS,y=VOLUME_BOX,colour="Bounding Box"))
  outG<-outG+geom_jitter(aes(x=STEPS,y=AISO,colour="Anisotropy"))
  outG<-outG+geom_jitter(aes(x=STEPS,y=PCA1_S,colour="Length"))
  outG<-outG+geom_jitter(aes(x=STEPS,y=PCA2_S,colour="Width"))
  outG<-outG+geom_jitter(aes(x=STEPS,y=PCA3_S,colour="Height"))
  outG<-outG+ylab("Match - Original Correlation Coefficient")
  outG
}
agg.as.mat<-function(...) {
  agg.to.mat(aggregate(...))
}

meanpct=function(...) { 100*mean(...)}
medpct=function(...) { 100*median(...)}
binddata<-function(inData,...) {do.call(rbind,lapply(inData,function(x) { subset(x@match,...)}))}
agg.steplist<-function(xStep,yStep) {
  fx<-function(x) { round_any(x,xStep,round)}
  fy<-function(y) { round_any(y,yStep,round)}
  fz<-function (x) {x}
  function(...) {agg.flist(fx,fy,fz,...)}
}
agg.stepfactorlist<-function(xStep,yStep) {
  fx<-function(x) { as.factor(round_any(x,xStep,round))}
  fy<-function(y) { as.factor(round_any(y,yStep,round))}
  fz<-function (x) {x}
  function(...) {agg.flist(fx,fy,fz,...)}
}
agg.factorlist<-function(is.x=TRUE,is.y=TRUE,is.z=FALSE) {
  temp.norm<-function (x) {x}
  temp.fact<-function (x) {as.factor(x)}
  fx<-function(x) { as.factor(x)}
  fy<-function(y) { as.factor(y)}
  fz<-function (x) {x}
  function(...) {agg.flist(if(is.x) temp.fact else temp.norm ,if(is.y) temp.fact else temp.norm ,if(is.z) temp.fact else temp.norm ,...)}
}
agg.steploglist<-function(xStep,yStep) {
  fx<-function(x) { round_any(log10(x),xStep,round)}
  fy<-function(y) { round_any(log10(y),yStep,round)}
  fz<-function (x) {x}
  function(...) {agg.flist(fx,fy,fz,...)}
}
agg.steplogfactorlist<-function(xStep,yStep,xRound=1,yRound=1) {
  fx<-function(x) { as.factor(round(10^round_any(log10(x),xStep,round),xRound))}
  fy<-function(y) { as.factor(round(10^round_any(log10(y),yStep,round),yRound))}
  fz<-function (x) {x}
  function(...) {agg.flist(fx,fy,fz,...)}
}
agg.list<-function(varX,varY,varZ,data,FUN=mean,varZname="GoodBubbles",roundDigit=1) {
  aggMat<-aggregate(as.formula(paste(varZ,"~", varX,"*",varY)), data=data,FUN=FUN)
  names
  names(aggMat)[3]<-varZname
  aggMat[,4]<-round(aggMat[,3],roundDigit)
  names(aggMat)[4]<-"ROUND"
  aggMat
}
agg.flist<-function(fx=function (x) {x},fy=function (x) {x},fz=function (x) {x},varX,varY,varZ,data,roundDigit=1,...) {
  tempMat<-data
  tempMat[[paste(varX,"ORIGINAL",sep="_")]]<-tempMat[[varX]] # keep the untransformed variables
  tempMat[[varX]]<-fx(tempMat[[varX]])
  tempMat[[paste(varY,"ORIGINAL",sep="_")]]<-tempMat[[varY]]
  tempMat[[varY]]<-fy(tempMat[[varY]])
  aggMat<-agg.list(varX,varY,varZ,data=tempMat,roundDigit=1,...)
  aggMat[,3]<-fz(aggMat[,3])
  aggMat[,4]<-round(aggMat[,3],roundDigit)
  names(aggMat)[4]<-"ROUND"
  aggMat
}

agg.mat<-function(varX,varY,varZ,data,FUN=mean,varZname="GoodBubbles",listFun=agg.list) {
  agg.to.mat(agg.list(varX,varY,varZ,data,FUN=FUN,varZname=varZname))
}
agg.ggplot<-function(varX,varY,varZ,data,FUN=mean,varZname="GoodBubbles",listFun=agg.list,roundDigit=1) {
  aggMat<-listFun(varX,varY,varZ,data,FUN=FUN,varZname=varZname,roundDigit=roundDigit)
  ggplot(aggMat,aes_string(x=varX,y=varY,fill=varZname))
}
# Convet Aggregate Output to a Matrix
agg.to.mat<-function(matchCount) {
  nr<-unique(matchCount[,1])
  nc<-unique(matchCount[,2])
  oMat<-matrix(nr=length(nr),nc=length(nc),dimnames=list(nr,nc))
  for(i in seq(dim(matchCount)[1])) { oMat[as.character(matchCount[i,1]),as.character(matchCount[i,2])]<-matchCount[i,3] }
  oMat
}
# Matrix Plot
plot.matrix<-function(inMat,...) {
  filled.contour(1:nrow(inMat),1:ncol(inMat),inMat,axes=T,...)
  axis(4, at = 1:nrow(oMat), labels=rownames(oMat),tick=F)
  axis(3, at = 1:ncol(oMat), labels=colnames(oMat),tick=FALSE)
}
# more genetic version which requires an x variable
# Plots for the fit quality
showMatchRes2<-function(inG) {
  outG<-inG+geom_jitter(aes(y=VOLUME,colour="Volume"))
  outG<-outG+geom_jitter(aes(y=NEIGHBORS,colour="Faces"))
  outG<-outG+geom_jitter(aes(y=VOLUME_BOX,colour="Bounding Box"))
  outG<-outG+geom_jitter(aes(y=AISO,colour="Anisotropy"))
  outG<-outG+geom_jitter(aes(y=PCA1_S,colour="Length"))
  outG<-outG+geom_jitter(aes(y=PCA2_S,colour="Width"))
  outG<-outG+geom_jitter(aes(y=PCA3_S,colour="Height"))
  outG<-outG+ylab("Match - Original Correlation Coefficient")
  outG
}

showMatchResLine<-function(inG) {
  outG<-inG+geom_line(aes(y=VOLUME,colour="Volume"))
  outG<-outG+geom_line(aes(y=NEIGHBORS,colour="Faces"))
  outG<-outG+geom_line(aes(y=VOLUME_BOX,colour="Bounding Box"))
  outG<-outG+geom_line(aes(y=AISO,colour="Anisotropy"))
  outG<-outG+geom_line(aes(y=PCA1_S,colour="Length"))
  outG<-outG+geom_line(aes(y=PCA2_S,colour="Width"))
  outG<-outG+geom_line(aes(y=PCA3_S,colour="Height"))
  outG<-outG+ylab("Match - Original Correlation Coefficient")
  outG
}

showMatchShape<-function(inGplot) {
  outG<-inGplot+geom_jitter(aes(x=STEPS,y=SHAPET_XX,colour="XX"))
  outG<-outG+geom_jitter(aes(x=STEPS,y=SHAPET_XY,colour="XY"))
  outG<-outG+geom_jitter(aes(x=STEPS,y=SHAPET_XZ,colour="XZ"))
  outG<-outG+geom_jitter(aes(x=STEPS,y=SHAPET_YY,colour="YY"))
  outG<-outG+geom_jitter(aes(x=STEPS,y=SHAPET_YZ,colour="YZ"))
  outG<-outG+geom_jitter(aes(x=STEPS,y=SHAPET_ZZ,colour="ZZ"))
  outG<-outG+ylab("Match - Original Correlation Coefficient")
  outG
}
# showAllHistograms(ggplot(goldData,aes(x=NEIGHBORS)),nwRelax)
showAllHistograms<-function(inGplot,dataList,nameList=c(),...) {
  outG<-inGplot+geom_density(aes(alpha=0.2,fill="Truth"),...)
  if (length(nameList)<length(dataList)) {
    nameList<-sapply(seq(1,length(dataList)),function(x) {paste("Measure",x,sep="")})
  }
  for (i in seq(1,length(dataList))) {
    outG<-outG+geom_density(data=dataList[[i]],aes_string(color=paste("'M",nameList[i],"'",sep="")),...)
  }
  outG
}

addColToDFlist<-function(datalist,colName,colData) {
  outdata<-datalist
  for (i in 1:length(datalist)) {
    cData<-datalist[[i]]
    cData[[colName]]<-rep(colData[i],dim(cData)[1])
    outdata[[i]]<-cData
  }
  outdata
}