#!/bin/bash

. /etc/conf.d/mindcrack || echo "can't source /etc/conf.d/mindcrack"

cd $_SRVDIR
screen -dmS mindcrack su mindcrack -c "PATH=/opt/java/bin/:/usr/bin/:$PATH java -Xmx${MAXHEAP} -Xms${MINHEAP} -XX:+UseConcMarkSweepGC -XX:+CMSIncrementalPacing -XX:ParallelGCThreads=${THREADS} -XX:+AggressiveOpts -jar ${_SRVDIR}/${SERVERJAR} nogui"
