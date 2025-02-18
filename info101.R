library(ggplot2)
library(marinecs100b)


# Questionable organization choices ---------------------------------------

# P1 Call the function dir() at the console. This lists the files in your
# project's directory. Do you see woa.csv in the list? (If you don't, move it to
# the right place before proceeding.) Yes I have woa.csv


# P2 Critique the organization of woa.csv according to the characteristics of
# tidy data. there are no lables on the left side of the tables and the lables
# on the top of the table aren't very clear. It also confuses the computer and
# the names are inconsistent


# Importing data ----------------------------------------------------------

# P3 P3 Call read.csv() on woa.csv. What error message do you get? What do you
# think that means?
Error in read.csv() : argument "file" is missing, with no default
# I think this means that the file is missing so R is unable to read it


# P4 Re-write the call to read.csv() to avoid the error in P3.
remotes::install_github("MarineCS-100B/marinecs100b")
woa.wide <- read.csv("woa.csv", skip = 1)



# Fix the column names ----------------------------------------------------

# P5 Fill in the blanks below to create a vector of the depth values.


depths <- c(
  seq(0, 100, by = 5),
  seq(125, 550, by = 25),
  seq(550, 2000, by = 50),
  seq(2100, 5500, by = 100)
)

# P6 Create a vector called woa_colnames with clean names for all 104 columns.
# Make them the column names of your WOA data frame.

woa_colnames <- c("latitude", "longitude", paste0("depth_", depths))



# Analyzing wide-format data ----------------------------------------------

# P7 What is the mean water temperature globally in the twilight zone (200-1000m
# depth)?
twilight_rows <- woa.wide[ , 27:49]
sum_twilight_rows <- sum(twilight_rows, na.rm = TRUE)
twilight_non_na <- sum(!is.na(twilight_rows))
mean_temp <- sum_twilight_rows / twilight_non_na



# Find column indices corresponding to twilight zone depths (200m to 1000m)
woa_colnames[which(depths >= 200 & depths <= 1000)] ?????????


# Compute the mean temperature globally, ignoring NAs


#UP TO HERE
mean(which(depths >= 200 & depths <= 1000))      ?????????

mean_temp_twilight <- mean(as.matrix(woa[, twilight_zone_cols]), na.rm = TRUE)

# Print result
mean_temp_twilight




# Analyzing long-format data ----------------------------------------------

# P8 Using woa_long, find the mean water temperature globally in the twilight zone.
View(woa_long)
twilight_temps_long <- woa_long[woa_long$depth_m >= 200 & woa_long$depth_m <= 1000, "temp_c"]
mean(twilight_temps_long)

# Answer 6.57

# P9 Compare and contrast your solutions to P7 and P8.
# the answers are the same, but p8 is more intuative and uses less code


# P10 Create a variable called mariana_temps. Filter woa_long to the rows in the
# location nearest to the coordinates listed in the in-class instructions.
# changed
mariana_temps <- woa_long[woa_long$latitude == 11.5 & woa_long$longitude == 142.5, ]
View(mariana_temps)


# P11 Interpret your temperature-depth profile. What's the temperature at the
# surface? How about in the deepest parts? Over what depth range does
# temperature change the most? the temp at the surface is about 28 degrees C,
# and at the deepest part about 2 degrees C. The depth range where the temp
# changes most over 0 to 1000


# ggplot is a tool for making figures, you'll learn its details in COMM101
ggplot(mariana_temps, aes(temp_c, depth_m)) +
  geom_path() +
  scale_y_reverse()
