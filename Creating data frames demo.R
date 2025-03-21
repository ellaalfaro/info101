# How to create a data frame manually
noaa_survey <- data.frame(latitude = c(45, 45, 30, 30),
                          depth_m = c(5, 100, 5, 100),
                          temp_c = c(10.6, 7.1, 21.8, 18.3))

# Print data frame directly to the console
noaa_survey

# View() function to use RStudio's viewer
View(noaa_survey)

# Alternatively, we can import using read.csv()
write.csv("noaa_survey.csv", row.names = FALSE)

# Check the contents of your directory
dir()

# Read a data frame from a CSV file
noaa_survey2 <- read.csv("noaa_survey.csv")

# How to see and modify column names
colnames(noaa_survey2)
colnames(noaa_survey2) <- c("Latitude", "DepthM", "TempC")
noaa_survey2



