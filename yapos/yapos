#!/bin/sh
# Script limpiador de /var/log/pacman.log y optimizador de la base de datos de pacman
# Usese bajo su responsabilidad.
# Script creado con los aportes aparecidos en https://bbs.archlinux.org/viewtopic.php?id=96652
# Y algun otro aporte propio
FILE1=/var/lib/pacman/db.lck
FILE2=/var/lib/pacman.db
if [ -f $FILE1 ]; then
 echo "==> Pacman db is blocked, next check in 60 secs."
 sleep 60
 sh /usr/bin/yapos &
 else
 echo "==> Deleting pacman front-end related entries"
 sed -i '/ Running / d' /var/log/pacman.log
 sed -i '/ synchronizing package lists/ d' /var/log/pacman.log
 sed -i '/ starting full system upgrade/ d' /var/log/pacman.log
 echo "==> Deleting mime-type related entries"
 sed -i '/ Unknown media type/ d' /var/log/pacman.log
 echo "==> Deleting unnecessary post-installation messages"
 sed -i '/ >>/ d' /var/log/pacman.log
 sed -i '/ ::/ d' /var/log/pacman.log
 sed -i '/ ==/ d' /var/log/pacman.log
 sed -i '/ "/ d' /var/log/pacman.log
 sed -i '/ warning:/ d' /var/log/pacman.log
 sed -i '/ Updating / d' /var/log/pacman.log
 sed -i '/ Removing / d' /var/log/pacman.log
 sed -i '/ Installing / d' /var/log/pacman.log
 sed -i '/ update mime database.../ d' /var/log/pacman.log
 sed -i '/ update desktop mime database.../ d' /var/log/pacman.log
fi
if [ -f $FILE2 ]; then
 echo "==> Your database was optimized previously"
 else
 pt-pacman-cage 60
 sync
fi
