#!/bin/sh

cat > upgradepic.gnuplot <<EOT
set title 'pacman full system upgrade'
set xlabel 'time'
set ylabel 'upgrade clock'
set autoscale
#set timefmt '%Y-%m%-%d'
set xdata time
set timefmt '%Y-%m-%d'
set format x "%Y-%m'
set terminal svg size 1024,768
set output 'upgradepic.svg'
plot 'upgradepic.dat' using 1:2 title 'x'
EOT
echo "./upgradepic.gnuplot generated"

grep full /var/log/pacman.log | awk '{print substr($1,2), substr($2,1,2)}' \
	> upgradepic.dat
echo "./upgradepic.dat generated"

gnuplot upgradepic.gnuplot
echo "./upgradepic.svg generated"

if [ -x /usr/bin/chromium ] ; then
	chromium upgradepic.svg
fi
