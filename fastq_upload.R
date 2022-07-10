rm(list=ls())

#Set working directory for script to be where the fastq files ares.
wd <- "**ChangeThis**FASTQDirectory"
setwd(wd)

#Get all fastq files in directory.
FASTQFiles <- Sys.glob("*.fastq.gz")

#Get a list of unique forward and reverse fastq file pairs.
FASTQPatterns <- unique(gsub("R1|R2","R",FASTQFiles))

#Create a text file containing the number of reads for each forward and reverse fastq file.
#Output these results, and a check of mismatches, to a text file.
OutputTotal <- data.frame()
for(FASTQPattern in FASTQPatterns){
  ForwardReversePair <- Sys.glob(gsub("R","R*",FASTQPattern))
  Command1 <- paste("gunzip -c ",ForwardReversePair[1]," | echo $((`wc -l`/4))",sep="")
  Command2 <- paste("gunzip -c ",ForwardReversePair[2]," | echo $((`wc -l`/4))",sep="")
  Output <- data.frame(matrix(nrow=1,ncol=5))
  colnames(Output) <- c("FASTQName1","FASTQReads1","FASTQName2","FASTQReads2","ForwardReverseReadMatch")
  Output$FASTQName1 <- ForwardReversePair[1]
  Output$FASTQReads1 <- system(Command1,intern=T)
  Output$FASTQName2 <- ForwardReversePair[2]
  Output$FASTQReads2 <- system(Command2,intern=T)
  Output$ForwardReverseReadMatch <- ifelse(Output$FASTQReads1==Output$FASTQReads1,"Yes","No")
  OutputTotal <- rbind(Output,OutputTotal)
}
write.table(OutputTotal,"FASTQReadCheck.txt",quote=FALSE,sep="/t",row.names = FALSE)
