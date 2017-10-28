CEBD1160
===========


Folder structure:

| Folder  | Contents  |
|---|---|
| Gnuplot  | contains the data and the Gnuplot code  |
| R  | contains the R code  |
| data  | contains the data used for the project  |


How to run Gnuplot code:
=========================

Requirements:
The following files need to be in the same folder where Gnuplot is being launched.

| Graph  | Data files  |
|---|---|
| Plot age distribution  | FIFA18_v03_age.csv  |
| Plot value distribution | FIFA18_v03_value.csv  |
| Plot scatterplot  | FIFA18_v03.csv  |


1. Plot x-axis -> copy & paste in Gnuplot
```
set key autotitle columnheader
set terminal png
set output 'age_Distribution.png'
set title 'Age Distribution'
set ylabel 'Frequency'
set xlabel 'Age'
bin_width = .1
bin_number(x) = floor(x/bin_width)
rounded(x) = bin_width * ( bin_number(x) + 0.5 )
set yrange [0:2000]
plot 'FIFA18_v03_age.csv' using (rounded($1)):(1) smooth frequency with boxes;
```

![alt text](https://github.com/allen-myconcordia/CEBD1160/blob/master/Gnuplot/age_Distribution.png "Gnuplot 1")


2. Plot y-axis -> copy & paste in Gnuplot
```
set key autotitle columnheader
set terminal png
set output 'value_Distribution.png'
set title 'Value Distribution'
set ylabel 'Frequency'
set xlabel 'Value'
bin_width = .5
bin_number(x) = floor(x/bin_width)
rounded(x) = bin_width * ( bin_number(x) + 0.5 )
set yrange [0:300]
plot 'FIFA18_v03_value.csv' using (rounded($1)):(1) smooth frequency with boxes;
```

3. Plot scatterplot -> copy & paste in Gnuplot

```
set key autotitle columnheader
set title 'Age vs Value'
set ylabel 'Value'
set xlabel 'Age'
set grid
set term png
set output 'Age_vs_Value.png'
set datafile separator ","
plot 'FIFA18_v03.csv' using 2:8 with points
```


How to run R code:
===================

Requirements:

(i) Load packages / libraries
```
install.packages("RCurl")
library(RCurl)
```

(ii) Load csv file from github
```
y <- read.csv("https://raw.githubusercontent.com/allen-myconcordia/CEBD1160/master/Gnuplot/FIFA18_v03.csv")
```

1. Plot x-axis -> copy & paste in R studio
```
hist(y$Age, main = "Histogram of Age", xlab = "Age", ylab = "Frequency")
```

2. Plot y-axis -> copy & paste in R studio
```
hist(y$Value, main = "Histogram of Value", xlab = "Value", ylab = "Frequency")
```

3. Plot scatterplot -> copy & paste in R studio
```
plot(y$Age, y$Value, xlab = "Age", ylab = "Value", main = "Age vs Value")
```
