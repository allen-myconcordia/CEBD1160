CEBD1160
===========


Folder structure:

| Folder  | Contents  |
|---|---|
| Gnuplot  | contains the data and the Gnuplot code  |
| R  | contains the R code  |
| data  | contains the data used for the project  |


How to run Gnuplot code:


| Folder  | Contents  |
|---|---|
| Plot x-axis |
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
  |
| Plot y-axis | contains the R code  |
| data  | contains the data used for the project  |
