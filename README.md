# UK National Grid Covariances
In this repo you can find a Shiny R application that plots the model estimated 
using a ***maximum likelihood*** estimation approach.
### How to run it?
First of all, make sure you have already installed the following two libraries
```{r}
if (!require("shiny")) install.packages("shiny")
if (!require("shinythemes")) install.packages("shinythemes")
```
then load them in your console with
```{r}
library("shiny")
library("shinythemes")
```
Eventually, run the following code 
```{r}
runUrl("https://github.com/PeppeSaccardi/UKNationalGridcovariances/archive/main.tar.gz",
subdir = "app/")
```
### How it works?
You can select the results of the estimated model for the covariances within the UK National Grid 
groups of the residuals coming from the errors between prediction and electricity demand.