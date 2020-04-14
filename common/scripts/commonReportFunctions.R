require(ggplot2)
require(plyr)
require(png)
require(gridExtra)
show.pngs.as.grid<-function(file.list,title.fun,zoom=1) {
  preparePng<-function(x) rasterGrob(readPNG(x,native=T,info=T),width=unit(zoom,"npc"),interp=F)
  labelPng<-function(x,title="junk") (qplot(1:300, 1:300, geom="blank",xlab=NULL,ylab=NULL,asp=1)+
                                        annotation_custom(preparePng(x))+
                                        labs(title=title)+theme_bw(24)+
                                        theme(axis.text.x = element_blank(),
                                             axis.text.y = element_blank()))
  imgList<-llply(file.list,function(x) labelPng(x,title.fun(x)) )
  do.call(grid.arrange,imgList)
}
Sys.glob.minsize<-function(...,min.size=1000) {
  cur.list<-Sys.glob(...)
  cur.list[which(sapply(cur.list,function(x) file.info(x)$size>min.size))]
}
rbind.inter<-function(a,b,...) {
  a.nm<-names(a)
  b.nm<-names(b)
  keep.cols<-intersect(a.nm,b.nm)
  rbind(a[,which(a.nm %in% keep.cols)],b[,which(b.nm %in% keep.cols)],...)
}
stdPrint<-function(dig) {function (x) {paste(round(mean(x),dig)," +- ",round(sd(x),dig))}}
# sorted by samples
sort.by.sample<-function(in.bubbles) {in.bubbles[with(in.bubbles, order(sample)), ]}
# no additional first column in ldply
ldply.delfirstcol<-function(...) {
  o.data<-ldply(...)
  o.data[,-1]
}
ddply.cutcols<-function(...,cols=1) {
  # run standard ddply command
  cur.table<-ddply(...)
  cutlabel.fixer<-function(oVal) {
    sapply(oVal,function(x) {
      cnv<-as.character(x)
      mean(as.numeric(strsplit(substr(cnv,2,nchar(cnv)-1),",")[[1]]))
    })
  }
  cutname.fixer<-function(c.str) {
    s.str<-strsplit(c.str,"(",fixed=T)[[1]]
    t.str<-strsplit(paste(s.str[c(2:length(s.str))],collapse="("),",")[[1]]
    paste(t.str[c(1:length(t.str)-1)],collapse=",")
  }
  for(i in c(1:cols)) {
    cur.table[,i]<-cutlabel.fixer(cur.table[,i])
    names(cur.table)[i]<-cutname.fixer(names(cur.table)[i])
  }
  cur.table
}
pathExtFcn<-function(filename,ele=1,spchr="/") { # extract path name from filename
  strList<-strsplit(filename,spchr)[[1]]
  paste(strList[length(strList)-ele])
}
sample.name.fcn<-function(path.pos=9,name.pos=2) {function(x) strsplit(strsplit(x,split="/")[[1]][path.pos],split="_")[[1]][name.pos]}
sample.number.fcn<-function(path.pos=9,name.pos=2) {function(x) as.numeric(sample.name.fcn(path.pos,name.pos)(x))}
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
