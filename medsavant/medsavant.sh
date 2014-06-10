#!/bin/sh
phymem=$(free -m | awk '/^Mem:/{print $2}')
savmem=$(($phymem / 2))

cd /usr/share/java/medsavant
java -Xmx${savmem}m -jar medsavant-client-*.jar
