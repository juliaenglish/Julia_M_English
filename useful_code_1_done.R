# here is some code you might find useful. All of this has been covered in the Canvas materials already. This document is intended as a resource for you, but as the course goes on you'll want to become more confident in generating code on your own.

#### packages ####
# here are some packages you'll want to load in order to do the exercises for today. If any of them are NOT already installed on your computer, you'll need to do that first with the install.packages() function. We'll use these in basically every analysis

library(foreign) # for reading in other datasets
library(dplyr) # for data manipulation
library(ggplot2) # for data visualization

# read in a data file with read.dta
wvs <- read.dta('https://www.dropbox.com/s/w1qhwjsatsxl16m/wvs_class.dta?dl=1')

# write a file to disk with write.dta
write.dta(wvs, "c:/path/to/somewhere/on/my/computer/file.dta") # this won't work because this is not a path to a folder on my computer

# select VARIABLES with select
wvs <- wvs %>% select(country, important_family, educ, age, health) # select some variables

# select OBSERVATIONS with filter
wvs <- wvs %>% filter(country == 'Yemen')

# create a table with table()
tab <- table(wvs$important_family)

tab

# recode a variable with factor (can also use recode)
wvs$important_family <- factor(wvs$important_family,
                               levels = c('Very important', 'Rather important', 'Not very important', 'Not at all important'), # levels are the EXISTING values and have to match EXACTLY (including capitalization)
                               labels = c('Important', 'Important', 'Not important', 'Not important')) # labels are the NEW values
table(wvs$important_family)

wvs$age <- factor(wvs$age <= 60, levels = c(TRUE, FALSE), labels = c('Younger', 'Older'))

# create a cross-tabulation with table
tab <- table(wvs$age, wvs$important_family)
tab

# create a proportional table with prop.table AND AN EXISTING TABLE
prop.table(tab, margin = 1)

# conduct a null-hypothesis test using chisq.test AND AN EXISTING TABLE OF COUNTS; use the correct = FALSE option to match Stata results
chisq.test(tab, correct = FALSE)

# when expected cell cunts are low, use fisher.test to get exact p-values
fisher.test(tab)

# make a barplot by first converting the cross tabulation to a data.frame
plot_dat <- tab %>% prop.table(margin = 1) %>% data.frame()
head(plot_dat)

# and then using ggplot and geom_col
plot_dat %>% ggplot(aes(x = Var1, y = Freq, fill = Var2)) + geom_col(position = 'dodge')