# here is some code to reproduce the solutions we shared for this exercise. This is NOT the only way to do this, it's just one way. If you had your own approach, that's also fine.

# these are the packages I think you'll want to use
library(foreign) # we're using the foreign package to read in the data
library(dplyr) # I use this package for data manipulation
library(ggplot2) # ggplot2 is useful for making plots

#### Step 1: read in the data ####
# read in the dataset and save it in your working environment; the dropbox link is https://www.dropbox.com/s/lxwy1xc4k1op5j6/afrobarometer.dta?dl=1 and you should be using read.dta
afrobar <- read.dta('afrobarometer.dta')

#### Step 2: select the variables we want ####
# select the subset of variables we want to use. You can include more than the ones I mentioned if you want
afrobar <- afrobar %>% select(Q87A, Q87B, Q87C, Q87D, COUNTRY, Q97) # these are the variables you need, but you can add more

#### Step 3: rename the variables for ease of use ####
# do the renaming and be sure to save the renamed dataset over the original
afrobar <- afrobar %>% rename(country = COUNTRY, educ = Q97, neighbors_religon = Q87A, neighbors_ethnic = Q87B, neighbors_homo = Q87C, neighbors_immigrants = Q87D) # inside rename, the pattern should be newname = oldname. I gave you two examples to get started with; add the others, separating each pair with a comma

#### Step 4: save the smaller dataset on your computer ####
# save the smaller dataset. Don't overwrite the original! Use the write.dta() function. You might want to set the working directory first
write.dta(afrobar, file = 'C:/Data Files/afrobar_small.dta') # put a path to the file inside the '', and be sure that the file name ends with .dta

#### Step 5: read in the smaller version we just created ####
# read in the smaller dataset and save it in the working environment. Use the read.dta function again
afrobar <- read.dta('afrobar_small.dta') # complete this line, just like in line 10

#### Step 6: recode the variables ####
# recode the variables so they have the proper levels. Check your work to be sure it did what it was supposed to. I would use the factor function here
afrobar$educ <- factor(afrobar$educ, levels = 0:9, labels = c('lower', 'lower', 'lower', 'lower', 'lower', 'lower', 'upper', 'upper', 'upper', 'upper')) # here's one example for education.
afrobar$neighbors_religon <- factor(afrobar$neighbors_religon, levels = 1:5, labels = c('intolerant', 'intolerant', 'tolerant', 'tolerant', 'tolerant'))

afrobar$neighbors_ethnic <- factor(afrobar$neighbors_ethnic, levels = 1:5, labels = c('intolerant', 'intolerant', 'tolerant', 'tolerant', 'tolerant'))

afrobar$neighbors_homo <- factor(afrobar$neighbors_homo, levels = 1:5, labels = c('intolerant', 'intolerant', 'tolerant', 'tolerant', 'tolerant'))

afrobar$neighbors_immigrants <- factor(afrobar$neighbors_immigrants, levels = 1:5, labels = c('intolerant', 'intolerant', 'tolerant', 'tolerant', 'tolerant'))

#### Step 7: make some tables ####
# create tables of each variable by itself.

afro_bar_tab_relig <- table(afrobar$neighbors_religon, useNA = 'always')

afro_bar_tab_ethnic <- table(afrobar$neighbors_ethnic, useNA = 'always')

afro_bar_tab_homo <- table(afrobar$neighbors_homo, useNA = 'always')

afro_bar_tab_imm <- table(afrobar$neighbors_immigrants, useNA = 'always')



#### Step 8: create a cross tabulation ####
# create a table and save it in your working environment. Turn it into a proportional table

#### Step 9: create a visualization ####
# convert the table to a dataframe and use ggplot with geom_col to plot it. The useful code files has some examples

#### Step 10: conduct a null-hypothesis test ####
# test the null-hypothesis. Use the table you made in step 8