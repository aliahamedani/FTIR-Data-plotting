# We have a Nicolet iS10 FTIR Spectrometer instrument from which we export the data as .CSV format 
# Put the exported XRD data (.CSV files) in the same directory as the script and go on
setwd("C:/Users/Ali/Desktop/FTIR-plotting") #directory name has to be adjusted (https://youtu.be/zyAFFsUkXec?t=47)
library(tidyverse)
library(ggplot2)
FTIRdata <- read.csv('AN06P27-3.csv', sep=',', header = TRUE) #Here the name of my file was "BAM-1-a.csv". ".csv" has to be in the end of the name in the script.
head(FTIRdata)

FTIRdata2<- filter(FTIRdata, `wavenumber`>=650 & `Transmittance`<=3900) # I only want to plot the data in the 600-4000 wavenumber range

head(FTIRdata2)
ggplot(FTIRdata2, aes(x=`wavenumber`, y=`Transmittance`)) +
  geom_line(colour="navy", size= 0.2)+ 
  ylim(0,120) + #feel free to play with the y scale
  xlim(3900,650)+
  xlab("Wavenumber (cm -1)") + ylab("Transmittance (%)") + 
  
  theme_bw() +  #There could be problems with saving the Greek character Theta ?? 
  theme(panel.grid.major.y = element_blank(),panel.grid.minor.y = element_blank())+
  theme(panel.grid.major.x = element_blank(),panel.grid.minor.x = element_blank())+
  #theme(axis.ticks.y = element_blank())+ #warnings are only about finding fonts in some databases (There is no problem)
  theme(
    axis.title.x = element_text(size = 14),
    axis.text.x = element_text(size = 12, face="bold", colour = "black"),
    axis.title.y = element_text(size = 14),
    axis.text.y = element_text(size= 12, face="bold", colour = "black"))

