#!/usr/bin/gnuplot
set terminal png transparent nocrop enhanced font arial 8 size 1300,600
set output 'sleep.png'

set title "My Sleep Time"

set xdata time
set ydata time

set timefmt x "%s"
set timefmt y "%s"

set format x "%F"
set format y "%H:%M"
set xtics 345600 rotate by -60 # 24*60*60*4
set mxtics 4
set ytics 3600
set grid ytics lt 0 lw 1 lc rgb "#bbbbbb"
set grid xtics lt 0 lw 1 lc rgb "#bbbbbb"

set xlabel "Date"
set ylabel "Time"

#set xrange [ -1000.00 : 1000.00 ] noreverse nowriteback
#set yrange [ -178.000 : 86.0000 ] noreverse nowriteback

plot      'sleep.dat' using 1:2:(0):3:4 notitle with vectors lc variable linewidth 2.000 nohead
