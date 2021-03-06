pollutantmean <- function(directory,pollutant,id = 1:332){
    filename <-as.character(id)
    for (i in 1:length(filename)) {
        filename[i]<- paste(filename[i],"csv",sep = ".")
        
        if(nchar(filename[i])==5){
            filename[i] <- paste("00",filename[i],sep = "")
        }
        else if(nchar(filename[i])==6){
            filename[i] <- paste("0",filename[i],sep = "")
        }
    }
    
    total = 0
    items =0
    for(i in 1:length(id)){
        datapath <- paste(getwd(),directory,filename[i],sep = "/")
        data <- read.csv(datapath)[[pollutant]]
        total <- total + sum(data,na.rm = TRUE)
        items <- items + sum(!is.na(data))
    }
    total/items
}
