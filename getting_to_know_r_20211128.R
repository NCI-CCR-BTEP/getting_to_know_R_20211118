# getting to know R - 11/18/2021
# note that in R, when we include # in the beginning of a line, then it will be considered as a comment and will not run

# use setwd() to set working directory, this is the directory where our input files are located and where we would write output
# the syntax for constructing directory path for Mac is different from Windows
setwd("/Users/wuz8/Documents/sample_data_coursera_2021118")
# setwd("drive_name:/folder/subfolder/") this is how you enter directory path for Windows
getwd() # this prints out your current working directory 

# to assign a value to variable in R use "<-"
a <- 5 

# this command clears the global environment
rm(list=ls()) 

# this command will list files in the working directory in the console
list.files() 

# use install.packages to install packages
# as example, we will install rcompanion
install.packages('rcompanion') 
# to activate a package use the library command
library(rcompanion)
# to deactivate a package, use detach("package:package_name", unload=TRUE)
# use remove.packages to remove a package
remove.packages('rcompanion') 

# importing csv file
sample_data_1 <- read.csv("sample_data_1.csv")

# importing tab delimited file
# use sep to indicate the separator, where \t indicates tab
sample_data_2 <- read.delim("sample_data_2.txt", sep="\t")

# importing xlsx using the readxl package
# install the readxl package if you have not installed yet
install.packages('readxl')
library(readxl)
sample_data_3 <- read_xlsx("sample_data_3.xlsx", col_names = TRUE)

# using rbind to combine the rows in sample_data_1 and sample_data_3 into one table stored as sample_data_4
# note that sample_data_4 will have 4 rows (2 from sample_data_1 and 2 from sample_data_3 )
sample_data_4 <- rbind(sample_data_1,sample_data_3)
# extracting the METABOLITE column from sample_data_4
sample_data_4$METABOLITE
# getting the element in row 2, column 1 of sample data 4
# in R data frames, elements are indexed by the row and column number so [2,1] means row 2 and column 1
sample_data_4[2,1]
# removing the 3rd and 4th columns in sample_data_4
sample_data_4 <- sample_data_4[,-c(3,4)]
# creating new column, COUNT_2 in sample_data_4 where the values are double those in the COUNT column
sample_data_4$COUNT_2 <- sample_data_4$COUNT*2

# filtering using dplyr filter command
library(dplyr)
sample_data_5 <- filter(sample_data_4, GENE_NAME=="ADA")

# create a vector b containing elements 5, 8, 10 and then constructing bar plot
b <- c(5,8,10)
barplot(b, col="orange", names=c("sample a", "sample b", "sample c"),
        ylab="gene count", xlab="sample", las=1, axis.lty = 1, cex.axis=1.5,
        cex.lab=1.25, cex.names=1.5, main="gene counts in 3 samples")
