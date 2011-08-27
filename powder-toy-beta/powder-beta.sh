#!/bin/sh

bitness=""

if [ "`uname -m`" == "x86_64" ]; then
	bitness="64-"
fi

##Prefer x86info over /proc/cpuinfo if installed on system
##/proc/cpuinfo doesen't list all supported features
##on certain cpus
if [ -f /usr/bin/x86info ]; then

        if `x86info -f | grep -q sse3`;then
                sse_version="3"
        elif `x86info -f | grep -q sse2`;then
                sse_version="2"
        else
                sse_version=""
        fi
else
	##Athlon64 cpus support sse3, but they don't report it in /proc/cpuinfo
	if [ `cat /proc/cpuinfo | grep -q sse3` -o `cat /proc/cpuinfo | grep 'Athlon(tm) 64'`];then
		sse_version="3"
	elif `cat /proc/cpuinfo | grep -q sse2`;then
	        sse_version="2"
	else
        	sse_version=""
	fi
fi

/usr/share/powder-beta/powder-${bitness}sse${sse_version}
