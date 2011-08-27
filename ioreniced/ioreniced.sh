#!/bin/bash
#
# ioReniceD 0.1.4
#
# GPL - jan.mette@berlin.de



#############################################################################
# SETUP
#############################################################################

# load config
source /etc/conf.d/ioreniced

# initialize pidlist for garbage collection
if [ "${BEHAVIOR}" = "smart" ]
then
	IONICED_LIST=""
fi

# delete old logs
rm -rf ${LOG_FILE} &>/dev/null

# set traps
trap 'echo "source /etc/conf.d/ioreniced' 1
trap 'rm -f /var/run/ioreniced.run; exit' 0
trap 'rm -f /var/run/ioreniced.run; exit' 3
trap 'rm -f /var/run/ioreniced.pid; exit' 15


#############################################################################
# MAIN LOOP
#############################################################################

while :
do
	# update date var
	DATE=`date '+%b%e %H:%M:%S'`

	if [ "${BEHAVIOR}" = "smart" ]
	then
		
		# create logfile if it doesnt exist
		if [ "${ENABLE_LOGGING}" = "yes" ]
		then
			if [ ! -e "${LOG_FILE}" ]
			then
				touch ${LOG_FILE}
				echo " ">>${LOG_FILE}
				echo "-------------------------------------">>${LOG_FILE}
				echo "          ioReniceD Logfile          ">>${LOG_FILE}
				echo "-------------------------------------">>${LOG_FILE}
				echo " ">>${LOG_FILE}
			fi
		fi

		# garbage collection
		if [ "${ENABLE_LOGGING}" = "yes" ]
		then
			echo "${DATE} >>>> Running Garbage Collector">>${LOG_FILE}
		fi
		
		for pid2 in ${IONICED_LIST}
			do
				check_running=`ps -A | grep ${pid2}`
				
				if [ -z "$check_running" ]
				then
					if [ "${ENABLE_LOGGING}" = "yes" ]
					then
						echo "${DATE} >>   PID ${pid2} not running anymore, removing from process list">>${LOG_FILE}
					fi
					
					IONICED_LIST=`echo ${IONICED_LIST} | sed "s/${pid2}//g"`
					
					if [ "${ENABLE_LOGGING}" = "yes" ]
					then
						echo "${DATE} >>   PID LIST: ${IONICED_LIST}">>${LOG_FILE}
					fi
				fi
			done

		# walk through the list of processes we want to ionice
		if [ "${ENABLE_LOGGING}" = "yes" ]
		then
			echo "${DATE} >>>> Ionicing Processes">>${LOG_FILE}
		fi
		
		for item in `echo ${IONICE_ME[*]}` 
			do 
			# filter process list and remove stuff we dont want to ionice. just to be sure we dont hit anything cruicial ;) needs to be simplified
			for pid in `ps -A | grep "${item}" | grep -e "acpi" -e "work_on_cpu" -e "startkde" -v | sed "s/[^ 0-9].*//g"`
				do 
					# check if we already have ionized this process
					PID_TMP=`echo ${IONICED_LIST} | grep -e "${pid}"`
					
					if [ -z "${PID_TMP}" ]
					then
						if [ "${ENABLE_LOGGING}" = "yes" ]
						then
							echo "${DATE} >>   ionicing new process ${item} (PID ${pid}) with PRIO ${IONICE_PRIO}">>${LOG_FILE}
						fi
						
						/usr/bin/ionice -c${IONICE_PRIO} -p${pid} &>/dev/null
						
						IONICED_LIST="${IONICED_LIST} ${pid}"
					else
						if [ "${ENABLE_LOGGING}" = "yes" ]
						then
							echo "${DATE} >>   process ${item} (PID ${pid}) already ioniced with PRIO ${IONICE_PRIO}, skipping">>${LOG_FILE}
						fi
					fi
				done 
			done
			
		# delete logfile it if its size is over 1mib
		if [ -e "${LOG_FILE}" ]
		then
			LOGSIZE=$(stat -c%s "${LOG_FILE}")
			
			if [ "${LOGSIZE}" -gt 1048576 ]
			then
				rm -rf ${LOG_FILE}
			fi
		fi

		# marker
		if [ "${ENABLE_LOGGING}" = "yes" ]
		then
			echo "${DATE} >>>> ---------------------------------MARK">>${LOG_FILE}
		fi
	fi
	
	if [ "${BEHAVIOR}" = "brute" ]
	then	
		# create logfile if it doesnt exist
		if [ "${ENABLE_LOGGING}" = "yes" ]
		then
			if [ ! -e "${LOG_FILE}" ]
			then
				touch ${LOG_FILE}
				echo " ">>${LOG_FILE}
				echo "-------------------------------------">>${LOG_FILE}
				echo "          ioReniceD Logfile          ">>${LOG_FILE}
				echo "-------------------------------------">>${LOG_FILE}
				echo " ">>${LOG_FILE}
			fi
		fi

		# walk through the list of processes we want to ionice
		if [ "${ENABLE_LOGGING}" = "yes" ]
		then
			echo "${DATE} >>>> Ionicing Processes">>${LOG_FILE}
		fi
		
		for item in `echo ${IONICE_ME[*]}` 
		do 
			# filter process list and remove stuff we dont want to ionice. just to be sure we dont hit anything cruicial ;) needs to be simplified
			for pid in `ps -A | grep "${item}" | grep -e "acpi" -e "work_on_cpu" -e "startkde" -v | sed "s/[^ 0-9].*//g"`
			do 
					if [ "${ENABLE_LOGGING}" = "yes" ]
					then
						echo "${DATE} >>   ionicing process ${item} (PID ${pid}) with PRIO ${IONICE_PRIO}">>${LOG_FILE}
					fi
					/usr/bin/ionice -c${IONICE_PRIO} -p${pid} &>/dev/null
			done 
		done

		# delete logfile it if its size is over 1mib
		if [ -e "${LOG_FILE}" ]
		then
			LOGSIZE=$(stat -c%s "${LOG_FILE}")
			
			if [ "${LOGSIZE}" -gt 1048576 ]
			then
				rm -rf ${LOG_FILE}
			fi
		fi

		# marker
		if [ "${ENABLE_LOGGING}" = "yes" ]
		then
			echo "${DATE} >>>> ---------------------------------MARK">>${LOG_FILE}
		fi
	fi	

	# polling interval
	sleep ${POLLING_INTERVAL}
done
