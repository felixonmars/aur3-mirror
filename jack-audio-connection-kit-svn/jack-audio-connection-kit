#!/bin/bash 

. /etc/rc.conf
. /etc/rc.d/functions

# source application-specific settings
[ -f /etc/conf.d/jack-audio-connection-kit ] && . /etc/conf.d/jack-audio-connection-kit

PID=`pidof -o %PPID /usr/bin/jackd`

[ -n "$JACKUSER" ] && HOME="/home/$JACKUSER"
[ -z "$JACK_PARAMS" ] && JACK_PARAMS=$(sed 's:/usr/bin/jackd ::' $HOME/.jackdrc)

case "$1" in
  start)
    stat_busy "Starting JACK"
    if [ -z "$PID" ]; then
      if [ -n "$JACKUSER" ]; then
        su - $JACKUSER -c 'export JACK_PROMISCUOUS_SERVER="" && . /etc/conf.d/jack-audio-connection-kit && umask 0000 && /usr/bin/jackd $JACK_PARAMS &> /dev/null &'
      else
	export JACK_PROMISCUOUS_SERVER=""
	umask 0000
        /usr/bin/jackd $JACK_PARAMS &> /dev/null &
      fi
    fi

    if [ ! -z "$PID" -o $? -gt 0 ]; then
      stat_fail
    else
      add_daemon jack
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping JACK"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon jack
      stat_done
    fi
    ;;
  restart)
    $0 stop
    sleep 1
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart|sleep|wake}"
                ;;
esac
exit 0

 
