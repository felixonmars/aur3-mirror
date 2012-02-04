#!/bin/sh

basedir=/usr/share/java/blogbridge
cd $basedir

for name in ./*.jar
do
	CP=${CP}:${name}
done

java -Dsun.net.client.defaultConnectTimeout=30000 \
-Dsun.net.client.defaultReadTimeout=60000 \
-Dworking.folder=final \
-Drelease.type=final \
-Dreport.errors \
-Dapple.laf.useScreenMenuBar=true \
-Xms256M -Xmx256M -XX:NewRatio=2 -XX:SurvivorRatio=3 -Xverify:none \
-cp ${CP} \
com.salas.bb.core.ApplicationLauncher
