# part 1

pollutantmean <- function(directory, pollutant, id=1:332) {
  collection_c <- vector()
  for (poll_id in id) {
    name_of_file <- file.path(directory, paste(sprintf("%03d", poll_id), 
                                               ".csv", sep=""))
    dataframe_poll_id <- read.csv(name_of_file)
    poll_value <- dataframe_poll_id[ , pollutant]
    collection_c <- append(collection_c, poll_value)
  }
  overall_mean_poll <- mean(collection_c,na.rm = TRUE)
  overall_mean_poll
}