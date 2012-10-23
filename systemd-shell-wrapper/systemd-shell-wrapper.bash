
if [ -f /etc/systemd/shell-wrapper.conf ]; then
	source /etc/systemd/shell-wrapper.conf
else
	HIDEDAEMONS=()
fi

s.start()       { s_systemctl "start"   $1; }
s.stop()        { s_systemctl "stop"    $1; }
s.restart()     { s_systemctl "restart" $1; }
s.reload()      { s_systemctl "reload"  $1; }
s.enable()      { s_systemctl "enable"  $1; }
s.disable()     { s_systemctl "disable" $1; }
s.status()      { s_systemctl "status"  $1; }
s.listfailed()  { systemctl --failed; }
s.analyze()     { systemd-analyze $*; }
s.wants()       { systemctl show -p "Wants" $1; }
s.logsize()     { s_exec "journalctl --disk-usage"; }
s.list()        { s_list_services "list"; }
s.log()         { s_journalctl "$@"; }
s.tree()        { s_exec "systemd-cgls --all"; }

s_systemctl() {
	daemon="${2/.service/}"
	if [ "$daemon" == "" ] || ! s_daemon_exists $daemon; then echo -e "\e[1;31m:: \e[1;37m $daemon daemon does not exist\e[0m"; return; fi
	case $1 in
		start|stop|restart|reload)
			systemctl -q is-active "${daemon}"".service" >& /dev/null
			if [ $? -eq 0 ]; then
				if [ "$1" == "start" ]; then echo -e "\e[1;31m:: \e[1;37m $daemon daemon is already running\e[0m"; return; fi
			else
				if [ "$1" != "start" ]; then
					echo -e "\e[1;31m:: \e[1;37m $daemon daemon is not running\e[0m"; 
					if [ "$1" != "restart" ]; then return; fi
				fi
			fi
			if [ "$1" == "start" ];   then echo -en "\e[1;34m:: \e[1;37m Starting $daemon daemon\e[0m"; cols=25; fi
			if [ "$1" == "stop" ];    then echo -en "\e[1;34m:: \e[1;37m Stopping $daemon daemon\e[0m"; cols=25; fi
			if [ "$1" == "restart" ]; then echo -en "\e[1;34m:: \e[1;37m Restarting $daemon daemon\e[0m"; cols=27; fi
			if [ "$1" == "reload" ];  then echo -en "\e[1;34m:: \e[1;37m Reloading $daemon daemon\e[0m"; cols=26; fi
			s_exec "systemctl -q ""${1}"" ""${daemon}"".service"
			if [ $? -eq 0 ]; then s_msg $daemon $cols 7 "DONE"; else s_msg $daemon $cols 1 "FAIL"; s_systemctl "status" $daemon; fi
			;;
		enable|disable)
			if [ "${daemon%%@*}" == "${daemon}" ]; then # sadly is-enabled does not work as expected for "@" services like dhcpcd@eth0
				systemctl -q is-enabled "${daemon}"".service" >& /dev/null
				if [ $? -eq 0 ]; then
					if [ "$1" == "enable" ]; then echo -e "\e[1;31m:: \e[1;37m $daemon daemon is already enabled\e[0m"; return; fi
				else
					if [ "$1" == "disable" ]; then echo -e "\e[1;31m:: \e[1;37m $daemon daemon is not enabled\e[0m"; return; fi
				fi
			fi
			f=${1:0:1}
			echo -en "\e[1;34m:: \e[1;37m ""${f^^}""${1:1:${#1}-2}""ing $daemon daemon\e[0m"
			if [ "$1" == "enable" ]; then cols=25; else cols=26; fi
			s_exec "systemctl -q ""${1}"" ""${daemon}"".service"
			if [ $? -eq 0 ]; then s_msg $daemon $cols 7 "DONE"; else s_msg $daemon $cols 1 "FAIL"; fi
			;;
		status)	
			s_exec "systemctl status ""${daemon}"".service"
			;;
	esac
}

s_journalctl() {
	daemon=${@:$#}
	if s_daemon_exists "${daemon/.service/}"; then
		options=""; for ((i=1; i<$#; ++i )) ; do options="${options}""${!i}"" "; done
		s_exec "journalctl --all ""$options"" _SYSTEMD_UNIT=""${daemon/.service/}"".service";
	else
		s_exec "journalctl --all ""$*";
	fi
}

s_list_services () { systemctl --no-legend -t service list-unit-files | grep -v static  \
	|	{ 
			while read -r service daemonstate ; do
				
				# ignore symlinks like crond.service (they dont work anyway, you can start/stop but not enable/disable)
				if [ -h "/usr/lib/systemd/system/$service" ]; then continue; fi
				
				# support for "@" stuff like dhcpcd@eth0 dhcpcd@eth1 ...
				daemon="${service/.service/}"
				if [ "${daemon:${#daemon}-1}" == "@" ]; then
					if s_hidedaemon ${daemon}; then continue; fi;
					daemons=$(systemctl --no-legend -t service | grep -o "${daemon}[A-Za-z0-9_/=:-]*")
					if [ "${daemons[0]}" == "" ]; then daemons=($daemon); fi # when no instance of "@" service is started it appears just as dhcpcd@
				else
					daemons=($daemon)
				fi
				
				for daemon in $daemons; do
					if s_hidedaemon ${daemon}; then continue; fi;
					if [ "${1}" == "list" ]; then
						echo -en "\e[1;34m[";
					elif [ "${1}" == "enabled" ] || [ "${1}" == "disabled" ]; then
						if [ "${1}" == "${daemonstate}" ]; then printf "%s\n" "${daemon}"; fi
						continue
					fi
					systemctl -q is-active "${daemon}"".service" >& /dev/null
					if [ $? -eq 0 ]; then
							if [ "${1}" == "list" ]; then
								echo -en "\e[1;37mSTARTED"
							else
								if [ "${1}" != "stopped" ]; then printf "%s\n" "${daemon}"; fi
							fi
					else
							if [ "${1}" == "list" ]; then
								echo -en "\e[1;31mSTOPPED"
							else
								if [ "${1}" != "started" ]; then printf "%s\n" "${daemon}"; fi
							fi
					fi
					if [ "${1}" != "list" ]; then continue; fi
					echo -en "\e[1;34m][\e[1;37m"

					# !!! in the rare case of having two or more "@" instances (dhcpcd@) from the same service having different states (en/disabled) this actually shows wrong results
					if [ "${daemonstate}" == "enabled" ]; then
							echo -n "AUTO"
					else
							echo -n "    "
					fi
					echo -en "\e[1;34m]\e[0m "
					echo "$daemon"
				done

			done;
		}
}

s_daemon_exists() {
	if systemctl --no-legend -t service list-unit-files | grep -v static | grep -q "^${1%%@*}@*\.service" >& /dev/null; then return 0; else return 1; fi
}

s_msg() {
	printf "%s%*s%s%s%s%s%s%s\n" "$(tput bold ; tput setaf 4)" $(($(tput cols)-${#1}-${2})) "[" "$(tput bold ; tput setaf $3)" "${4}" "$(tput bold ; tput setaf 4)" "]" "$(tput sgr0)"
}

s_exec() {
	if [[ $EUID -ne 0 ]]; then sudo $1; else $1; fi
}

s_hidedaemon() {
	for hidedaemon in ${HIDEDAEMONS[@]}; do if [ "$1" == "$hidedaemon" ]; then return 0; fi; done; return 1;
}

s_bashcompletion_list_targets () { systemctl --no-legend -t target list-unit-files  \
	|	{ while read -r a b  ; do printf "%s\n" "${a}"; done; }
}

s_bashcompletion () {
	local cur=${COMP_WORDS[COMP_CWORD]} prev=${COMP_WORDS[COMP_CWORD-1]}
   local verb comps
	
	if [ "${1}" == "targets" ]; then comps=$( s_bashcompletion_list_targets );	else comps=$( s_list_services "${1}" ); fi
	COMPREPLY=( $(compgen -W '$comps' -- "$cur") )
}

s_bashcompletion_start () { s_bashcompletion "stopped"; return 0; }
s_bashcompletion_stop () { s_bashcompletion "started"; return 0; }
s_bashcompletion_restart () { s_bashcompletion "started"; return 0; }
s_bashcompletion_reload () { s_bashcompletion "started"; return 0; }
s_bashcompletion_enable () { s_bashcompletion "disabled"; return 0; }
s_bashcompletion_disable () { s_bashcompletion "enabled"; return 0; }
s_bashcompletion_status () { s_bashcompletion ""; return 0; }
s_bashcompletion_wants () { s_bashcompletion "targets"; return 0; }
s_bashcompletion_log () { s_bashcompletion ""; return 0; }

complete -F s_bashcompletion_start s.start
complete -F s_bashcompletion_stop s.stop
complete -F s_bashcompletion_restart s.restart
complete -F s_bashcompletion_reload s.reload
complete -F s_bashcompletion_enable s.enable
complete -F s_bashcompletion_disable s.disable
complete -F s_bashcompletion_status s.status
complete -F s_bashcompletion_wants s.wants
complete -F s_bashcompletion_log s.log