library (RCurl)

#download <- getURL("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20SIN%20MDA%20Mes%20Ene02%20v2019%2002%2003_08%2000%2007.csv", .opts = list(ssl.verifypeer = FALSE))


month<-c("Dic","Ene","Feb","Mar","Abr","May","Jun","Jul","Ago","Sep","Oct","Nov")
month2<-c("01","02","03","04","05","06","07","08","09","10","11","12")
#Sistema de Interconeccion Nacional 2018
for (m in month){
  for (i in 1:2){
    if (m=="Dic"){fuente<-paste(paste(paste("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20SIN%20MDA%20Mes%20",m, sep=""),paste("0",i,sep=""),sep=""),paste(paste("%20v2019%20",month2[which(month==m)],sep=""),"%2003_08%2000%2006.csv",sep=""),sep="")
    destination<-paste(paste("C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/SIN/2018/PMLsin",m,sep=""),paste(i,".csv",sep=""),sep="")
    download.file(fuente,destination)
    }
    else{
    tryCatch({fuente<-paste(paste(paste("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20SIN%20MDA%20Mes%20",m, sep=""),paste("0",i,sep=""),sep=""),paste(paste("%20v2018%20",month2[which(month==m)],sep=""),"%2003_08%2000%2006.csv",sep=""),sep="")
              destination<-paste(paste("C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/SIN/2018/PMLsin",m,sep=""),paste(i,".csv",sep=""),sep="")
              download.file(fuente,destination)}, error=function(e){})
                }
    }
}
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20SIN%20MDA%20Mes%20Ene01%20v2018%2002%2003_08%2002%2022.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/SIN/2018/PMLsinEne1.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20SIN%20MDA%20Mes%20Ene02%20v2018%2002%2003_08%2002%2022.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/SIN/2018/PMLsinEne2.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20SIN%20MDA%20Mes%20Feb01%20v2018%2003%2003_08%2002%2050.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/SIN/2018/PMLsinFeb1.csv") 
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20SIN%20MDA%20Mes%20Feb02%20v2018%2003%2003_08%2002%2050.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/SIN/2018/PMLsinFeb2.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20SIN%20MDA%20Mes%20Ago01%20v2018%2009%2003_08%2000%2007.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/SIN/2018/PMLsinAgo1.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20SIN%20MDA%20Mes%20Ago02%20v2018%2009%2003_08%2000%2007.csv","D:/Documentos/EnergySeminar/Proyect/raw/SIN/2018PMLsinAgo2.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20SIN%20MDA%20Mes%20Sep01%20v2018%2010%2003_08%2000%2011.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/SIN/2018/PMLsinSep1.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20SIN%20MDA%20Mes%20Sep02%20v2018%2010%2003_08%2000%2011.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/SIN/2018/PMLsinSep2.csv")


#Sistema Interconectado BC 2018
for (m in month){
  for (i in 1:2){
    if (m=="Dic"){fuente<-paste(paste(paste("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCA%20MDA%20Mes%20",m, sep=""),paste("0",i,sep=""),sep=""),paste(paste("%20v2019%20",month2[which(month==m)],sep=""),"%2003_06%2000%2006.csv",sep=""),sep="")
    destination<-paste(paste("C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BC/2018/PMLbc",m,sep=""),paste(i,".csv",sep=""),sep="")
    download.file(fuente,destination)
    }
    else{
      tryCatch({fuente<-paste(paste(paste("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCA%20MDA%20Mes%20",m, sep=""),paste("0",i,sep=""),sep=""),paste(paste("%20v2018%20",month2[which(month==m)],sep=""),"%2003_06%2000%2006.csv",sep=""),sep="")
      destination<-paste(paste("C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BC/2018/PMLbc",m,sep=""),paste(i,".csv",sep=""),sep="")
      download.file(fuente,destination)}, error=function(e){})
    }
  }
}
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCA%20MDA%20Mes%20Ene01%20v2018%2002%2003_06%2002%2022.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BC/2018/PMLbcEne1.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCA%20MDA%20Mes%20Ene02%20v2018%2002%2003_06%2002%2022.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BC/2018/PMLbcEne2.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCA%20MDA%20Mes%20Feb01%20v2018%2003%2003_06%2002%2050.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BC/2018/PMLbcFeb1.csv") 
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCA%20MDA%20Mes%20Feb02%20v2018%2003%2003_06%2002%2050.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BC/2018/PMLbcFeb2.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCA%20MDA%20Mes%20Ago01%20v2018%2009%2003_06%2000%2007.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BC/2018/PMLbcAgo1.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCA%20MDA%20Mes%20Ago02%20v2018%2009%2003_06%2000%2007.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BC/2018/PMLbcAgo2.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCA%20MDA%20Mes%20Sep01%20v2018%2010%2003_06%2000%2011.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BC/2018/PMLbcSep1.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCA%20MDA%20Mes%20Sep02%20v2018%2010%2003_06%2000%2011.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BC/2018/PMLbcSep2.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCA%20MDA%20Mes%20Oct01%20v2018%2011%2003_07%2000%2006.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BC/2018/PMLbcOct1.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCA%20MDA%20Mes%20Oct02%20v2018%2011%2003_07%2000%2006.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BC/2018/PMLbcOct2.csv")


#Sistema Interconectado BCSUR 2018
for (m in month){
  for (i in 1:2){
    if (m=="Dic"){fuente<-paste(paste(paste("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCS%20MDA%20Mes%20",m, sep=""),paste("0",i,sep=""),sep=""),paste(paste("%20v2019%20",month2[which(month==m)],sep=""),"%2003_08%2000%2006.csv",sep=""),sep="")
    destination<-paste(paste("C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BCSUR/2018/PMLbcs",m,sep=""),paste(i,".csv",sep=""),sep="")
    download.file(fuente,destination)
    }
    else{
      tryCatch({fuente<-paste(paste(paste("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCS%20MDA%20Mes%20",m, sep=""),paste("0",i,sep=""),sep=""),paste(paste("%20v2018%20",month2[which(month==m)],sep=""),"%2003_08%2000%2006.csv",sep=""),sep="")
      destination<-paste(paste("C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BCSUR/2018/PMLbcs",m,sep=""),paste(i,".csv",sep=""),sep="")
      download.file(fuente,destination)}, error=function(e){})
    }
  }
}
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCS%20MDA%20Mes%20Ene01%20v2018%2002%2003_08%2002%2022.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BCSUR/2018/PMLbcsEne1.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCS%20MDA%20Mes%20Ene02%20v2018%2002%2003_08%2002%2022.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BCSUR/2018/PMLbcsEne2.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCS%20MDA%20Mes%20Feb01%20v2018%2003%2003_08%2002%2050.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BCSUR/2018/PMLbcsFeb1.csv") 
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCS%20MDA%20Mes%20Feb02%20v2018%2003%2003_08%2002%2050.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BCSUR/2018/PMLbcsFeb2.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCS%20MDA%20Mes%20Ago01%20v2018%2009%2003_08%2000%2007.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BCSUR/2018/PMLbcsAgo1.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCS%20MDA%20Mes%20Ago02%20v2018%2009%2003_08%2000%2007.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BCSUR/2018/PMLbcsAgo2.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCS%20MDA%20Mes%20Sep01%20v2018%2010%2003_08%2000%2011.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BCSUR/2018/PMLbcsSep1.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCS%20MDA%20Mes%20Sep02%20v2018%2010%2003_08%2000%2011.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BCSUR/2018/PMLbcsSep2.csv")


############################################################################################################################

#Sistema de Interconeccion Nacional 2017
for (m in month){
  for (i in 1:2){
    if (m=="Dic"){fuente<-paste(paste(paste("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20SIN%20MDA%20Mes%20",m, sep=""),paste("0",i,sep=""),sep=""),paste(paste("%20v2019%20",month2[which(month==m)],sep=""),"%2003_08%2000%2006.csv",sep=""),sep="")
    destination<-paste(paste("C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/SIN/2018/PMLsin",m,sep=""),paste(i,".csv",sep=""),sep="")
    download.file(fuente,destination)
    }
    else{
      tryCatch({fuente<-paste(paste(paste("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20SIN%20MDA%20Mes%20",m, sep=""),paste("0",i,sep=""),sep=""),paste(paste("%20v2018%20",month2[which(month==m)],sep=""),"%2003_08%2000%2006.csv",sep=""),sep="")
      destination<-paste(paste("C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/SIN/2018/PMLsin",m,sep=""),paste(i,".csv",sep=""),sep="")
      download.file(fuente,destination)}, error=function(e){})
    }
  }
}
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20SIN%20MDA%20Mes%20Ene01%20v2018%2002%2003_08%2002%2022.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/SIN/2018/PMLsinEne1.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20SIN%20MDA%20Mes%20Ene02%20v2018%2002%2003_08%2002%2022.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/SIN/2018/PMLsinEne2.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20SIN%20MDA%20Mes%20Feb01%20v2018%2003%2003_08%2002%2050.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/SIN/2018/PMLsinFeb1.csv") 
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20SIN%20MDA%20Mes%20Feb02%20v2018%2003%2003_08%2002%2050.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/SIN/2018/PMLsinFeb2.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20SIN%20MDA%20Mes%20Ago01%20v2018%2009%2003_08%2000%2007.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/SIN/2018/PMLsinAgo1.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20SIN%20MDA%20Mes%20Ago02%20v2018%2009%2003_08%2000%2007.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/SIN/2018/PMLsinAgo2.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20SIN%20MDA%20Mes%20Sep01%20v2018%2010%2003_08%2000%2011.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/SIN/2018/PMLsinSep1.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20SIN%20MDA%20Mes%20Sep02%20v2018%2010%2003_08%2000%2011.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/SIN/2018/PMLsinSep2.csv")


#Sistema Interconectado BC 2017
for (m in month){
  for (i in 1:2){
    if (m=="Dic"){fuente<-paste(paste(paste("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCA%20MDA%20Mes%20",m, sep=""),paste("0",i,sep=""),sep=""),paste(paste("%20v2019%20",month2[which(month==m)],sep=""),"%2003_06%2000%2006.csv",sep=""),sep="")
    destination<-paste(paste("C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BC/2018/PMLbc",m,sep=""),paste(i,".csv",sep=""),sep="")
    download.file(fuente,destination)
    }
    else{
      tryCatch({fuente<-paste(paste(paste("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCA%20MDA%20Mes%20",m, sep=""),paste("0",i,sep=""),sep=""),paste(paste("%20v2018%20",month2[which(month==m)],sep=""),"%2003_06%2000%2006.csv",sep=""),sep="")
      destination<-paste(paste("C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BC/2018/PMLbc",m,sep=""),paste(i,".csv",sep=""),sep="")
      download.file(fuente,destination)}, error=function(e){})
    }
  }
}
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCA%20MDA%20Mes%20Ene01%20v2018%2002%2003_06%2002%2022.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BC/2018/PMLbcEne1.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCA%20MDA%20Mes%20Ene02%20v2018%2002%2003_06%2002%2022.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BC/2018/PMLbcEne2.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCA%20MDA%20Mes%20Feb01%20v2018%2003%2003_06%2002%2050.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BC/2018/PMLbcFeb1.csv") 
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCA%20MDA%20Mes%20Feb02%20v2018%2003%2003_06%2002%2050.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BC/2018/PMLbcFeb2.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCA%20MDA%20Mes%20Ago01%20v2018%2009%2003_06%2000%2007.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BC/2018/PMLbcAgo1.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCA%20MDA%20Mes%20Ago02%20v2018%2009%2003_06%2000%2007.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BC/2018/PMLbcAgo2.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCA%20MDA%20Mes%20Sep01%20v2018%2010%2003_06%2000%2011.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BC/2018/PMLbcSep1.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCA%20MDA%20Mes%20Sep02%20v2018%2010%2003_06%2000%2011.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BC/2018/PMLbcSep2.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCA%20MDA%20Mes%20Oct01%20v2018%2011%2003_07%2000%2006.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BC/2018/PMLbcOct1.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCA%20MDA%20Mes%20Oct02%20v2018%2011%2003_07%2000%2006.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BC/2018/PMLbcOct2.csv")


#Sistema Interconectado BCSUR 2017
for (m in month){
  for (i in 1:2){
    if (m=="Dic"){fuente<-paste(paste(paste("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCS%20MDA%20Mes%20",m, sep=""),paste("0",i,sep=""),sep=""),paste(paste("%20v2019%20",month2[which(month==m)],sep=""),"%2003_08%2000%2006.csv",sep=""),sep="")
    destination<-paste(paste("C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BCSUR/2018/PMLbcs",m,sep=""),paste(i,".csv",sep=""),sep="")
    download.file(fuente,destination)
    }
    else{
      tryCatch({fuente<-paste(paste(paste("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCS%20MDA%20Mes%20",m, sep=""),paste("0",i,sep=""),sep=""),paste(paste("%20v2018%20",month2[which(month==m)],sep=""),"%2003_08%2000%2006.csv",sep=""),sep="")
      destination<-paste(paste("C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BCSUR/2018/PMLbcs",m,sep=""),paste(i,".csv",sep=""),sep="")
      download.file(fuente,destination)}, error=function(e){})
    }
  }
}
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCS%20MDA%20Mes%20Ene01%20v2018%2002%2003_08%2002%2022.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BCSUR/2018/PMLbcsEne1.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCS%20MDA%20Mes%20Ene02%20v2018%2002%2003_08%2002%2022.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BCSUR/2018/PMLbcsEne2.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCS%20MDA%20Mes%20Feb01%20v2018%2003%2003_08%2002%2050.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BCSUR/2018/PMLbcsFeb1.csv") 
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCS%20MDA%20Mes%20Feb02%20v2018%2003%2003_08%2002%2050.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BCSUR/2018/PMLbcsFeb2.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCS%20MDA%20Mes%20Ago01%20v2018%2009%2003_08%2000%2007.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BCSUR/2018/PMLbcsAgo1.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCS%20MDA%20Mes%20Ago02%20v2018%2009%2003_08%2000%2007.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BCSUR/2018/PMLbcsAgo2.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCS%20MDA%20Mes%20Sep01%20v2018%2010%2003_08%2000%2011.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BCSUR/2018/PMLbcsSep1.csv")
download.file("https://www.cenace.gob.mx/DocsMEM/OpeMdo/PreEner/MargLoc/MDA/Mes/PreciosMargLocales%20BCS%20MDA%20Mes%20Sep02%20v2018%2010%2003_08%2000%2011.csv","C:/Users/Daniel/Documents/EnergySeminar/Proyect/raw/BCSUR/2018/PMLbcsSep2.csv")




