#!/bin/sh

srvDir="/srv/minecraft"
serverJar="minecraft_server.jar"

cd $srvDir
screen -dmS minecraft su minecraft -c "java -Xmx1024M -Xms512M -jar $srvDir/$serverJar"
