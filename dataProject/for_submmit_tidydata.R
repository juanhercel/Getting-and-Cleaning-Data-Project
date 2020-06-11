#for submmit tidy data

tidydata <- read.csv("dataProject/new_tidy_data_project.csv")
write.table(tidydata, "dataProject/new_tidy_data_project.txt", row.names = FALSE)
