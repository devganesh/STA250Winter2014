freqTableForFile<-function(filename, freqtable, debug=FALSE)
{
  
  con<-file(filename, open="r")
  firstRead=TRUE
  
  fileChunk=0;
  
  while(TRUE)
  {
    txt<-readLines(con,n=30000, ok=TRUE)
    if(length(txt)==0) break;
    
    split.text=strsplit(txt, split=',')
    arrDelay<-sapply(split.text,'[', 15)
    
    if(firstRead)
    {
      arrDelay<-arrDelay[2:length(arrDelay)]
      firstRead=FALSE
    }
    
    arrDelay<-as.integer(arrDelay[arrDelay!="NA"])
    
    arrDelay=arrDelay+10081
    
    for(entry in arrDelay)
    {
      freqtable[entry]=freqtable[entry]+1
    }
    
    if(debug){
      fileChunk = fileChunk + 1
      cat(fileChunk)
      cat("\t")
      cat(length(txt))
      cat("\n")
    }
    
  } 
  if(debug) cat("Closing connection . . . ")
  close(con)
  
  return(freqtable)
}