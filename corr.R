corr <- function(directory, threshold=0) {
  num_complete_dataframe <- complete(directory)
  overthreshold_df <- subset(num_complete_dataframe, nobs > threshold)
  corr_vector = vector()
  if (nrow(overthreshold_df) != 0) {
    for (id_poll in overthreshold_df$id) {
      name_of_file <- file.path(directory, paste(sprintf("%03d", id_poll), 
                                                 ".csv", sep=""))
      dataframe_poll_id <- read.csv(name_of_file)
      corr_vector <- append(corr_vector, cor(dataframe_poll_id$sulfate, 
                              dataframe_poll_id$nitrate,
                              use="complete.obs"))
      
    }
  }
  corr_vector
}