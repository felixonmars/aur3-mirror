#!/bin/bash
# Start, stop, restart, and rescan a MiniDLNA daemon

cnffile="/home/$USER/.config/minidlna/minidlna.conf"
pidfile="/home/$USER/.config/minidlna/minidlna.pid"
logfile="/home/$USER/.config/minidlna/minidlna.log"

# Program check
hash minidlna 2>&- || \
  { echo >&2 " Program required \"minidlna\" not installed."; exit 1; }

# Check if configuration exists
[ -f "$cnffile" ] || { echo " No config found at \"$cnffile\"."; exit 0; }

dmn_exst () { # existence check
  if [ -s "$pidfile" ]; then
  	pidflvl=$(pgrep -F "$pidfile")           # pid file value
		pidproc=$(pgrep -x minidlna | head -n 1) # pid process value
  	[[ $pidflvl = $pidproc ]] && echo 1
  fi
}

dmn_strt () {
  minidlna -f "$cnffile" -P "$pidfile" > "$logfile" 2>&1
  echo " Started MiniDLNA daemon"
}

dmn_stop () {
    kill $(pgrep -F "$pidfile") && sleep 2
    echo " Stopped MiniDLNA daemon"
}

dmn_rscn () {
  minidlna -f "$cnffile" -P "$pidfile" -R > "$logfile" 2>&1
  echo " Rescaning and starting MiniDLNA daemon (may take a few minutes)"
}

scr_help () {
  echo " ${0##*/} [start|stop|restart|rescan] - actions for the MiniDLNA daemon"
}

case $1 in
  start   ) # Start daemon
            [ $(dmn_exst) ] && \
              { echo " MiniDLNA daemon already running"  ; exit 1; }
            dmn_strt ;;
  stop    ) # Stop daemon
            [ $(dmn_exst) ] || \
              { echo " MiniDLNA daemon process not found"; exit 0; }
					  dmn_stop ;;
  restart ) # Restart daemon
            [ $(dmn_exst) ] && dmn_stop
            dmn_strt ;;
  rescan  ) # Rescan for new files (file detection only works when running)
            [ $(dmn_exst) ] && dmn_stop
            dmn_rscn ;;
  *       ) # Display usage if no parameters given
            scr_help
esac