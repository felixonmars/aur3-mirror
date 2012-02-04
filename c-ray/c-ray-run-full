#!/bin/sh
_threads=`cat /proc/cpuinfo | grep -c processor`
echo "Single thread test"
cat /usr/share/c-ray/scene | c-ray-f > foo_st1.ppm
cat /usr/share/c-ray/sphfract | c-ray-f > foo_st2.ppm
cat /usr/share/c-ray/sphfract | c-ray-f -s 1024x768 -r 8 > foo_st3.ppm
cat /usr/share/c-ray/scene | c-ray-f -s 7500x3500 > foo_st4.ppm
echo
echo "Multi thread test"
cat /usr/share/c-ray/scene | c-ray-mt -t $_threads > foo_mt1.ppm
cat /usr/share/c-ray/sphfract | c-ray-mt -t $_threads > foo_mt2.ppm
cat /usr/share/c-ray/sphfract | c-ray-mt -t $_threads -s 1024x768 -r 8 > foo_mt3.ppm
cat /usr/share/c-ray/scene | c-ray-mt -t $_threads -s 7500x3500 > foo_mt4.ppm