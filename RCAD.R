library(RODBC)
library(data.table)
library(reshape2)
library(stringr)
library(xlsx)
library(rJava)
library(plyr)

SEMANA1 <- 20210806
SEMANA2 <- 20210814
SEMANA3 <- 20210821
SEMANA4 <- 20210828
SEMANA5 <- 20210904
SEMANA6 <- 20210918

A_SEMANA1 <- data.frame(fread(paste("C:/Users/elias/Desktop/Limpieza/Asistencia_CAD008/Asistencia_CAD008_",SEMANA1,".csv",sep="")))
colnames(A_SEMANA1)[1] <- "NOMBRE"
colnames(A_SEMANA1)[2] <- "ACCION"
colnames(A_SEMANA1)[3] <- "TIEMPO"
A_SEMANA1$ASISTENCIA_S1 <- "1"
A_SEMANA1_BIND <- A_SEMANA1[,c("NOMBRE","ACCION","TIEMPO")]

A_SEMANA2 <- data.frame(fread(paste("C:/Users/elias/Desktop/Limpieza/Asistencia_CAD008/Asistencia_CAD008_",SEMANA2,".csv",sep="")))
colnames(A_SEMANA2)[1] <- "NOMBRE"
colnames(A_SEMANA2)[2] <- "ACCION"
colnames(A_SEMANA2)[3] <- "TIEMPO"
A_SEMANA2$ASISTENCIA_S2 <- "1"
A_SEMANA2_BIND <- A_SEMANA2[,c("NOMBRE","ACCION","TIEMPO")]

A_SEMANA3 <- data.frame(fread(paste("C:/Users/elias/Desktop/Limpieza/Asistencia_CAD008/Asistencia_CAD008_",SEMANA3,".csv",sep="")))
colnames(A_SEMANA3)[1] <- "NOMBRE"
colnames(A_SEMANA3)[2] <- "ACCION"
colnames(A_SEMANA3)[3] <- "TIEMPO"
A_SEMANA3$ASISTENCIA_S3 <- "1"
A_SEMANA3_BIND <- A_SEMANA3[,c("NOMBRE","ACCION","TIEMPO")]

A_SEMANA4 <- data.frame(fread(paste("C:/Users/elias/Desktop/Limpieza/Asistencia_CAD008/Asistencia_CAD008_",SEMANA4,".csv",sep="")))
colnames(A_SEMANA4)[1] <- "NOMBRE"
colnames(A_SEMANA4)[2] <- "ACCION"
colnames(A_SEMANA4)[3] <- "TIEMPO"
A_SEMANA4$ASISTENCIA_S4 <- "1"
A_SEMANA4_BIND <- A_SEMANA4[,c("NOMBRE","ACCION","TIEMPO")]

A_SEMANA5 <- data.frame(fread(paste("C:/Users/elias/Desktop/Limpieza/Asistencia_CAD008/Asistencia_CAD008_",SEMANA5,".csv",sep="")))
colnames(A_SEMANA5)[1] <- "NOMBRE"
colnames(A_SEMANA5)[2] <- "ACCION"
colnames(A_SEMANA5)[3] <- "TIEMPO"
A_SEMANA5$ASISTENCIA_S5 <- "1"
A_SEMANA5_BIND <- A_SEMANA5[,c("NOMBRE","ACCION","TIEMPO")]

A_SEMANA6 <- data.frame(fread(paste("C:/Users/elias/Desktop/Limpieza/Asistencia_CAD008/Asistencia_CAD008_",SEMANA6,".csv",sep="")))
colnames(A_SEMANA6)[1] <- "NOMBRE"
colnames(A_SEMANA6)[2] <- "ACCION"
colnames(A_SEMANA6)[3] <- "TIEMPO"
A_SEMANA6$ASISTENCIA_S6 <- "1"
A_SEMANA6_BIND <- A_SEMANA6[,c("NOMBRE","ACCION","TIEMPO")]

TOTAL <- rbind(A_SEMANA1_BIND,
               A_SEMANA2_BIND,
               A_SEMANA3_BIND,
               A_SEMANA4_BIND,
               A_SEMANA5_BIND,
               A_SEMANA6_BIND)

TOTAL <- unique(setDT(TOTAL), by='NOMBRE')
TOTAL <- TOTAL[,c("NOMBRE")]

TOTAL_1 <- merge(TOTAL,A_SEMANA1, all.x=T)
TOTAL_1 <- TOTAL_1[,c("NOMBRE","ASISTENCIA_S1")]
TOTAL_1 <- unique(setDT(TOTAL_1), by='NOMBRE')
TOTAL_1_2 <- merge(TOTAL_1,A_SEMANA2, all.x=T)
TOTAL_1_2 <- TOTAL_1_2[,c("NOMBRE","ASISTENCIA_S1","ASISTENCIA_S2")]
TOTAL_1_2 <- unique(setDT(TOTAL_1_2), by='NOMBRE')
TOTAL_1_2_3 <- merge(TOTAL_1_2,A_SEMANA3, all.x=T)
TOTAL_1_2_3 <- TOTAL_1_2_3[,c("NOMBRE","ASISTENCIA_S1","ASISTENCIA_S2","ASISTENCIA_S3")]
TOTAL_1_2_3 <- unique(setDT(TOTAL_1_2_3), by='NOMBRE')
TOTAL_1_2_3_4 <- merge(TOTAL_1_2_3,A_SEMANA4, all.x=T)
TOTAL_1_2_3_4 <- TOTAL_1_2_3_4[,c("NOMBRE","ASISTENCIA_S1","ASISTENCIA_S2","ASISTENCIA_S3","ASISTENCIA_S4")]
TOTAL_1_2_3_4 <- unique(setDT(TOTAL_1_2_3_4), by='NOMBRE')
TOTAL_1_2_3_4_5 <- merge(TOTAL_1_2_3_4,A_SEMANA5, all.x=T)
TOTAL_1_2_3_4_5 <- TOTAL_1_2_3_4_5[,c("NOMBRE","ASISTENCIA_S1","ASISTENCIA_S2","ASISTENCIA_S3","ASISTENCIA_S4","ASISTENCIA_S5")]
TOTAL_1_2_3_4_5 <- unique(setDT(TOTAL_1_2_3_4_5), by='NOMBRE')
TOTAL_1_2_3_4_5_6 <- merge(TOTAL_1_2_3_4_5,A_SEMANA6, all.x=T)
TOTAL_1_2_3_4_5_6 <- TOTAL_1_2_3_4_5_6[,c("NOMBRE","ASISTENCIA_S1","ASISTENCIA_S2","ASISTENCIA_S3","ASISTENCIA_S4","ASISTENCIA_S5","ASISTENCIA_S6")]
TOTAL_1_2_3_4_5_6 <- unique(setDT(TOTAL_1_2_3_4_5_6), by='NOMBRE')

ASISTENCIA_FINAL <- TOTAL_1_2_3_4_5_6
ASISTENCIA_FINAL <- unique(setDT(ASISTENCIA_FINAL), by='NOMBRE')

ASISTENCIA_FINAL[which(is.na(ASISTENCIA_FINAL$ASISTENCIA_S1)),"ASISTENCIA_S1"] <- "0"
ASISTENCIA_FINAL[which(is.na(ASISTENCIA_FINAL$ASISTENCIA_S2)),"ASISTENCIA_S2"] <- "0"
ASISTENCIA_FINAL[which(is.na(ASISTENCIA_FINAL$ASISTENCIA_S3)),"ASISTENCIA_S3"] <- "0"
ASISTENCIA_FINAL[which(is.na(ASISTENCIA_FINAL$ASISTENCIA_S4)),"ASISTENCIA_S4"] <- "0"
ASISTENCIA_FINAL[which(is.na(ASISTENCIA_FINAL$ASISTENCIA_S5)),"ASISTENCIA_S5"] <- "0"
ASISTENCIA_FINAL[which(is.na(ASISTENCIA_FINAL$ASISTENCIA_S6)),"ASISTENCIA_S6"] <- "0"

ASISTENCIA_FINAL$ASISTENCIA_S1 <- as.numeric(ASISTENCIA_FINAL$ASISTENCIA_S1)
ASISTENCIA_FINAL$ASISTENCIA_S2 <- as.numeric(ASISTENCIA_FINAL$ASISTENCIA_S2)
ASISTENCIA_FINAL$ASISTENCIA_S3 <- as.numeric(ASISTENCIA_FINAL$ASISTENCIA_S3)
ASISTENCIA_FINAL$ASISTENCIA_S4 <- as.numeric(ASISTENCIA_FINAL$ASISTENCIA_S4)
ASISTENCIA_FINAL$ASISTENCIA_S5 <- as.numeric(ASISTENCIA_FINAL$ASISTENCIA_S5)
ASISTENCIA_FINAL$ASISTENCIA_S6 <- as.numeric(ASISTENCIA_FINAL$ASISTENCIA_S6)

GRAPH <- colSums(ASISTENCIA_FINAL[,-1])

barplot(GRAPH, main="Asistencia Curso CAD",xlab="Semana")

write.table(ASISTENCIA_FINAL,paste("C:/Users/elias/Desktop/Limpieza/Asistencia_CAD004/ASISTENCIA_FINAL.csv",sep=""),sep=",",row.names=F,col.names=T,na="")

