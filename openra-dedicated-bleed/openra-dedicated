#!/bin/sh
cd /usr/lib/openra

while true; do
    source /etc/openra-dedicated
    mono --debug OpenRA.Game.exe Game.Mod=$Mod Server.Dedicated=$Dedicated Server.DedicatedLoop=$DedicatedLoop \
    Server.Name=$Name Server.ListenPort=$ListenPort Server.ExternalPort=$ExternalPort \
    Server.AdvertiseOnline=$AdvertiseOnline
done
