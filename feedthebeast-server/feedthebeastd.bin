#!/bin/bash

. /etc/conf.d/feedthebeast || exit 1

cd $_SRVDIR
screen -dmS feedthebeast su feedthebeast -c "PATH=/opt/java/bin/:/usr/bin/:$PATH java -Xmx${MAXHEAP} -Xms${MINHEAP} -XX:+UseConcMarkSweepGC -XX:+CMSIncrementalPacing -XX:ParallelGCThreads=${THREADS} -XX:+AggressiveOpts -jar ${_SRVDIR}/${SERVERJAR} nogui"
