#!/bin/bash

daemon_name=rss2imap
password_file=/etc/rss2imap/password
feeds_file=/etc/rss2imap/feeds.url

. /etc/rc.conf
. /etc/rc.d/functions

get_pid() {
  # We can't use the regular `pidof` because our process name is perl.
  # The brackets of [p]erl prevents grep from grep'ing its own process.
  ps ax | grep '[p]erl /usr/bin/rss2imap' | tr -s ' ' | cut -f2 -d' ' | tr '\n' ' '
}

case "$1" in
  start)
    stat_busy "Starting $daemon_name daemon"

    PID=$(get_pid)
    if [ -z "$PID" ]; then
      [ -f /var/run/$daemon_name.pid ] && rm -f /var/run/$daemon_name.pid
      # RUN
      if [ ! -s "$feeds_file" ]; then
        stat_append "- $feeds_file is empty."
        stat_fail
        exit 1
      fi
      if [ -f "$password_file" ]; then
        if /bin/ls -l "$password_file" | cut -c5-10 | grep -q '[^\-]'; then
          printhl "Warning insecure permissions on $password_file! Fixing..."
          chmod og= "$password_file"
        fi
      fi
      if [ -s "$password_file" ]; then
        cat "$password_file" | $daemon_name "$feeds_file">/dev/null 2>&1
      else
        printhl "$daemon_name is going to prompt for your IMAP password."
        printhl "To automate this step, write your password in $password_file."
        touch "$password_file"
        chmod og= "$password_file"
        $daemon_name "$feeds_file"
      fi
      #
      if [ $? -ne 0 ]; then
        stat_fail
        exit 1
      else
        echo $(get_pid) > /var/run/$daemon_name.pid
        add_daemon $daemon_name
        stat_done
      fi
    else
      stat_fail
      exit 1
    fi
    ;;

  stop)
    stat_busy "Stopping $daemon_name daemon"
    PID=$(get_pid)
    # KILL
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    #
    if [ $? -ne 0 ]; then
      stat_fail
      exit 1
    else
      rm -f /var/run/$daemon_name.pid &> /dev/null
      rm_daemon $daemon_name
      stat_done
    fi
    ;;

  restart)
    $0 stop
    sleep 1
    $0 start
    ;;

  status)
    stat_busy "Checking $daemon_name status";
    ck_status $daemon_name
    ;;

  *)
    echo "usage: $0 {start|stop|restart|status}"
esac

exit 0
