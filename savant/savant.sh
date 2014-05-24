#!/bin/sh
phymem=$(free -m | awk '/^Mem:/{print $2}')
savmem=$(($phymem / 2))

cd /usr/share/java/savant
java -Xmx${savmem}m -jar savant-core-*.jar
