# ** MechaCar_Statistical_Analysis

## *Project Overview*

In This Project I will help AutosRUs’ with its newest prototype,  the MechaCar,  I will use Data analytics tools to run them on production data and review for insights that may help the manufacturing team. I will perform the following analysis:
 1)  Perform multiple linear regression analysis to identify which variables in the dataset predict the mpg of MechaCar prototypes
 2) Collect summary statistics on the pounds per square inch (PSI) of the suspension coils from the manufacturing lots
 3) Run t-tests to determine if the manufacturing lots are statistically different from the mean population.
 4) Design a statistical study to compare the vehicle performance of the MechaCar vehicles against vehicles from other manufacturers. 
 
                  
## *Analysis & Results*
### Analysis
For this analysis, I will  Use R'Studio Analysis tool. R'Studio is powerfull statstical analysis tool. I will read raw Data from CSV files and then run the Linear regression, statstical analysis summary and visulaization, t-Test.

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
        summarize(Mean = mean(PSI),Median = median(PSI),Variance = var(PSI),SD =sd(PSI))

        # create the summary By Lot
        lot_summary <- suspension_data %>% group_by(Manufacturing_Lot) %>%
        summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups='keep')

        ### Deliverable 3: T-Tests on Suspension Coils
        # perform t-test across all Lots
        t.test(suspension_data$PSI,mu = 1500)

        # perform t-test on Lot 1
        t.test(subset(suspension_data,Manufacturing_Lot=="Lot1")$PSI,mu = 1500)

        # perform t-test on Lot 2
        t.test(subset(suspension_data,Manufacturing_Lot=="Lot2")$PSI,mu = 1500)

        # perform t-test on Lot 3
        t.test(subset(suspension_data,Manufacturing_Lot=="Lot3")$PSI,mu = 1500)


### Results

#### Linear Regression to Predict MPG
The hypothesis: MPG is impacted by vehicle_length, vehicle_weight, spoiler_angle,  ground_clearance & AWD. To examine these Hypotsies, we will run Multi Linear Regression Model to Predict the MPG and look at e individual variable p-values to determine which variables provide a significant contribution to the linear model

                Coefficients:
                                 Estimate Std.  Error      t value     Pr(>|t|)    
                (Intercept)      -1.040e+02     1.585e+01  -6.559       5.08e-08 ***
                vehicle_length    6.267e+00     6.553e-01   9.563       2.60e-12 ***
                vehicle_weight    1.245e-03     6.890e-04   1.807       0.0776 .  
                spoiler_angle     6.877e-02     6.653e-02   1.034       0.3069    
                ground_clearance  3.546e+00     5.412e-01   6.551       5.21e-08 ***
                AWD              -3.411e+00     2.535e+00  -1.346       0.1852    
                ---
                Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

                Residual standard error: 8.774 on 44 degrees of freedom
                Multiple R-squared:  0.7149,	Adjusted R-squared:  0.6825 
                F-statistic: 22.07 on 5 and 44 DF,  p-value: 5.35e-11

Model Outcome show that there is strong corrolation between MPG & Ground Clearnace, Veichle Lengt.  

#### Summary Statistics on Suspension Coils

![t_test_on_mfglost](https://user-images.githubusercontent.com/80013773/123591087-68ec7c00-d7a0-11eb-95c0-89962b316607.PNG) 

#### T-Test on Suspension Coils
T-Test for All Lost, Lot 1 & Lot 2 show that P-Values are above 0.05, and therefore we can reject the null hypothesis. It means our Lost are statistically similar. For Lot-3 The P-value is 0.04 (lower than 0.05), leading to the conclusion that we can't reject the null hypothesis. leading to the conclusion that Lot 3 is not statistically identical 

![t_test_on_mfglost](https://user-images.githubusercontent.com/80013773/123591248-933e3980-d7a0-11eb-813f-68d08659e5ee.PNG)



####  Design a Study Comparing the MechaCar to the Competition
for the comparison between MechaCar and competition, I need first to get the Mfg. Data for the competition (similar data set to MechaCar Product Data.)
Once I have the Data, I need to Run Multi Linear Regression on the Two Data sets and as well a statistical summary. 
Then I need to run two data types T-test to evaluate the Null Hypotheses of statistical similarity between the MechCar and the competition.   

    
## *Summary*
### Advantages
 Statistical Analysis is a must for any product line. it's used to evaluate and predict our Production Health, performance, and Quality. R.Studio is a powerful tool and is used for conducting such statistical analysis 
 
