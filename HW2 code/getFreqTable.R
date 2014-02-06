getFreqTable<- function(filenames, debug=FALSE)
{
  source("C:/Users/devganesh/Desktop/STA 250/HW2 code/freqTableForFile.R")
  
  freqtable<-rep(0, 20161)
  
  
  for(filename in filenames){
    
    if(debug) 
    {
      cat(filename)
      cat("\n")
    }
    freqtable<-freqTableForFile(filename, freqtable)        
  }
  
  return(freqtable)
}

