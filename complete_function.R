complete <- function(directory, id = 1:332) {
  num_complete_dataframe <- data.frame(id=numeric(), nobs=numeric())
  for (poll_id in id) {
    name_of_file <- file.path(directory, paste(sprintf("%03d", poll_id), 
                                               ".csv", sep=""))
    dataframe_poll_id <- read.csv(name_of_file)
    compl_cases = sum(complete.cases(dataframe_poll_id))
    num_complete_dataframe <- rbind(num_complete_dataframe, data.frame(
      id=poll_id, nobs=compl_cases))
    }
  num_complete_dataframe
  }
  
  
  