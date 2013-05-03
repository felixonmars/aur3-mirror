#!/bin/bash
#
# hplrun
#
# This file is shared under GPL by milarr <lrmts82@gmail.com>
# http://www.gnu.org/licenses/gpl.html

num_thr=$1

echo -e \
"================================================================================"
echo "hplrun started - help: /usr/share/doc/hpl/quickstart"
echo "                       /usr/share/doc/hpl/TUNING"
echo
echo "=> Hit [ctrl]+[c] to abort."
echo -e \
"================================================================================"
echo

if [ ! "$num_thr" -o "$num_thr" == "1" ] ; then
  echo "  Row(P) x Columns(Q) = 1"
  
  if [ ! "$num_thr" ] ; then
    num_thr=1
  fi
  
else
  echo "  Rows(P) x Columns(Q) = "$num_thr
fi

echo

for i in 4 3 2 1 ; do
  echo "  Tests starting in "$i" sec."
  sleep 1
done

echo

mpirun -np "$num_thr" xhpl
