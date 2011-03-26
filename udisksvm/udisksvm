#!/bin/bash
# Name of the script : udisksvm
# Author : Bernard Baeyens (berbae) 2011
#

# Start monitoring
coproc udisks --monitor
#echo "----$COPROC_PID----"
#echo "----${COPROC[0]}----"
#echo "----${COPROC[1]}----"

trap "kill $COPROC_PID 2>/dev/null;echo ------------ Bye! --------------" EXIT SIGINT SIGTERM
# Read the first line header 
if ps -p $COPROC_PID &>/dev/null; then
    read -u ${COPROC[0]}
fi
# Waiting for uevents
while ps -p $COPROC_PID &>/dev/null; do
    read -u ${COPROC[0]}
    event=${REPLY%:*}
    devpath=${REPLY#*:}
    devpath=${devpath/#*\//\/dev\/}
    if [[ -e $devpath ]]; then
	listinfos=$(udisks --show-info $devpath|\
	grep -e "system internal" -e "usage" -e "is mounted" -e "has media" -e "optical disc" -e "num audio tracks"\
	-e "type" -e "partition:" -e "blank")
	listinfos=$(echo "$listinfos"|sed 's/ //g
					   s/:/=/
					   s/opticaldisc=/&1/
					   s/type=\(.*\)/type=${type:-\1}/
					   s/[()]//g
					   s/partition=/&1/')
	# The change for type= is to take only its first value in listinfos
	unset systeminternal usage ismounted hasmedia opticaldisc numaudiotracks type partition blank
	eval "$listinfos"
	# Take only the first character
	hasmedia=${hasmedia:0:1}
	# If "partition:" not find in listinfos, should mean it is not a partition
	partition=${partition:-0}
#	echo "systeminternal : ---$systeminternal---"
#	echo "usage : ---$usage---"
#	echo "ismounted : ---$ismounted---"
#	echo "hasmedia : ---$hasmedia---"
#	echo "opticaldisc : ---$opticaldisc---"
#	echo "numaudiotracks : ---$numaudiotracks---"
#	echo "type : ---$type---"
#	echo "partition : ---$partition---"
#	echo "blank : ---$blank---"
	case $event in
	    added)
		echo "------------ $event --------------"
		if [[ "$systeminternal" == "0" ]] && [[ "$usage" == "filesystem" ]] && [[ "$partition" == "1" ]]; then
		    if [[ "$type" == "vfat" ]]; then
			options="sync,noatime,nodiratime,noexec,utf8=0"
		    else
			options="sync,noatime,nodiratime,noexec"
		    fi
		    if ! pgrep -f "traydevice $devpath" &>/dev/null; then
			udisks --mount $devpath --mount-options $options &>/dev/null
			traydevice $devpath &>/dev/null &
		    fi
		fi
		;;
	    job-changed)
		echo "------------ $event --------------" ;;
	    removed)
		echo "------------ $event --------------" ;;
	    changed)
		echo "------------ $event --------------"
		if [[ "$systeminternal" == "0" ]] && [[ "$opticaldisc" == "1" ]] && [[ "$ismounted" == "0" ]]; then
		    if [[ "$hasmedia" == "1" ]]; then
			if [[ "$usage" == "filesystem" ]] && [[ "$numaudiotracks" == "0" ]]; then
			    if ! pgrep -f "traydevice $devpath" &>/dev/null; then
				if [[ "$blank" == "0" ]]; then
				    udisks --mount $devpath --mount-options ro,noatime,nodiratime,noexec &>/dev/null
				fi
				traydevice $devpath &>/dev/null &
			    fi
			fi
		    else
			pkill -f "traydevice $devpath"
		    fi
		fi
		;;
	esac
    elif [[ "$event" == "removed" ]]; then
	    echo "------------ $event --------------"
    fi
done
