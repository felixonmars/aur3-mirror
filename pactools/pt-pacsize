#!/bin/bash

##AUTHOR: hads
##See: http://bbs.archlinux.org/viewtopic.php?t=20971

for i in /var/lib/pacman/local/*; do
        PKG=`echo $i | cut -d '/' -f 6`
        SIZE=`grep -A 1 SIZE $i/desc | tail -1`
        if [ -x /usr/bin/bc ]; then
                if [ $SIZE -gt 1024 ]; then
                        if [ $SIZE -gt 1048576 ]; then
                                SIZE=`echo "scale=1;$SIZE/1048576" | bc`M
                        else
                                SIZE=`echo "scale=1;$SIZE/1024" | bc`K
                        fi
                else
                        SIZE={$SIZE}B
                fi
        fi
        echo "$PKG | $SIZE"
done 
