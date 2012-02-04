#!/bin/bash

if [ "$(id -u)" != 0 ] ; then
	echo "You must be root to start Sedna DB as daemon."
	exit 2
fi

# general config
USECOLOR="YES"
. /etc/rc.d/functions
. /etc/conf.d/sednad
pid="pidof se_gov"
dsc="Sedna XML Database Server"
dsc1="Sedna DB"
log="/var/log/sedna.log"

if [ -z $user ] ; then
	echo "Unable to run $dsc. You must set a user in /etc/conf.d/sednad"
	exit 2
fi
		
# [ -f $log ] && rm -f $log

case "$1" in
	start)
		stat_busy "Starting $dsc"
		if [ `$pid` ]; then
			stat_fail
			printf "${C_FAIL}$dsc already running.${C_OTHER} \n"
			exit 2
		else
			#chown -R $user /opt/sedna/data /opt/sedna/cfg - перенес в install скрипт
			su $user -s /bin/sh -c "/opt/sedna/bin/se_gov &> $log "
			if [ ! -z "$(grep 'ERROR' $log)" ] ; then
				stat_fail
				printf "${C_FAIL}`cat $log`${C_OTHER} \n"
				exit 2
			else
				add_daemon sednad
				stat_done
				# start databases
				if [ ! -z $databases ] ; then
					for db in ${databases[@]}; do
						stat_busy "Starting $dsc1 '$db'"
						su $user -s /bin/sh -c "/opt/sedna/bin/se_sm $db &> $log "
						if [ ! -z "$(grep 'ERROR' $log)" ] ; then
							stat_fail
							printf "${C_FAIL}`cat $log`${C_OTHER} \n"
						else
							stat_done
							#cat $log
						fi
					done
				fi
				exit 0
			fi
		fi
		;;
	stop)
		# stop databases
		if [ ! -z $databases ] ; then
			for db in ${databases[@]}; do
				stat_busy "Stopping $dsc1 '$db'"
				su $user -s /bin/sh -c "/opt/sedna/bin/se_smsd $db &> $log "
				if [ ! -z "$(grep 'ERROR' $log)" ] ; then
					stat_fail
					printf "${C_FAIL}`cat $log`${C_OTHER} \n"
				else
					stat_done
				fi
			done
		fi
		stat_busy "Stopping $dsc"
		su $user -s /bin/sh -c "/opt/sedna/bin/se_stop &> $log "
		if [ ! -z "$(grep 'ERROR' $log)"  ]; then
			stat_fail
			printf "${C_FAIL}`cat $log`${C_OTHER} \n"
			exit 2
		else
			rm_daemon sednad
			stat_done
			exit 0
		fi
		;;
	restart)
		$0 stop
		sleep 3
		$0 start
		;;
	*)
		echo "usage: $0 {start|stop|restart}"  
esac
