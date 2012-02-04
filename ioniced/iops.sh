#!/bin/bash
version=1.0
# This script shows the ionice value for all processes by adding this value
# to the output of ps.
type ionice &>/dev/null || { echo "ionice not available" >&2; exit 1; }
export i=0
/bin/ps -e -o pid,nice,args |
	while read pid nice rest
		do
		if [ $i -eq 0 ]
			then
			#printf %5s'  ' "$pid"
			#printf %13s'  ' IONICE
			#echo "$rest"
			echo "  PID         IONICE   NI COMMAND"
		else
			ionice_value=$(ionice -p "$pid" 2>/dev/null | sed -n 's/:.* /\//p')
			if [ -z "$ionice_value" ]
				then
				ionice_value=exited
			fi
			printf %5i'  ' $pid
			printf %13s'  ' $ionice_value
			printf %3i' ' $nice
			echo "$rest"
		fi
		((i++))
	done
