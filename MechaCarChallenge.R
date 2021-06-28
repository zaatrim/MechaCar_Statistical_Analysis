library(dplyr)

#Read the CSV File 
mecha_data <- read.csv("MechaCar_mpg.csv",stringsAsFactors = F,check.names = F)


# perform a linear regression module
mecha_lm <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mecha_data)

#Determine the p-value and the r-square of the linear regression module 
summary(mecha_lm)

# ### perform summary Analysis on suspension coil data set
#Read in the CSV file 
suspension_data <- read.csv("Suspension_Coil.csv",stringsAsFactors = F, check.names = F)

# Create the total summary 
total_summary <- suspension_data %>%
  summarize(Mean = mean(PSI),Median = median(PSI),Variance = var(PSI),SD = sd(PSI))

# create the summary By Lot
lot_summary <- suspension_data %>% group_by(Manufacturing_Lot) %>%
  summarize(Mean = mean(PSI),Median = median(PSI),Variance = var(PSI),SD = sd(PSI), .groups= 'keep')

### Deliverable 3: T-Tests on Suspension Coils
# perform t-test across all Lots
t.test(suspension_data$PSI,mu = 1500)

# perform t-test on Lot 1
t.test(subset(suspension_data,Manufacturing_Lot=="Lot1")$PSI,mu = 1500)

# perform t-test on Lot 2
t.test(subset(suspension_data,Manufacturing_Lot=="Lot2")$PSI,mu = 1500)

# perform t-test on Lot 3
t.test(subset(suspension_data,Manufacturing_Lot=="Lot3")$PSI,mu = 1500)

