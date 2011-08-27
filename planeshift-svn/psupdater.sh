#!/bin/bash
cd /opt/PlaneShift
if [ -e updaterinfo.xml ] ; then 
	./psupdater
else
	./psupdater CheckIntegrity
fi
