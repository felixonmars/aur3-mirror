#!/bin/bash

#-----------------------------------------------------------------------------
# Path
I2P="/opt/i2p"

# User to run the wrapper as.
# IMPORTANT - Make sure that the user has the required privileges to write
#  the PID file and wrapper.log files and that the directories exist.
I2P_USER="i2p"

# Wrapper
WRAPPER_CMD="/usr/bin/java-service-wrapper"
WRAPPER_CONF="$I2P/wrapper.config"
LOGFILE="$I2P/wrapper.log"
PIDDIR="/run/i2p"
PIDFILE="$PIDDIR/i2p.pid"

# If set, wait for the wrapper to report that the daemon has started
TIMEOUT=30

#-----------------------------------------------------------------------------
fail() {
    printf "\e[1;31m>>> ERROR:\033[0m %s\n" "$*"
    exit 1
}

check_user() {
    if [[ "$(id -un)" != "$I2P_USER" ]]; then
        if [[ ! -d "$PIDDIR" ]]; then
            mkdir -p "$PIDDIR"
            chown ${I2P_USER}:${I2P_USER} "$PIDDIR"
        fi
        SCRIPT_PATH="$(cd $(dirname $0) && pwd)/$(basename $0)"
        su - "$I2P_USER" -c "${SCRIPT_PATH} $@"
        exit $?
    fi
}

init_vars() {
    [[ ! -r "$WRAPPER_CONF" ]] &&
        fail "Unable to read \$WRAPPER_CONF: ${WRAPPER_CONF}"
    [[ ! -x "$WRAPPER_CMD" ]] &&
        fail "Unable to find or execute \$WRAPPER_CMD: ${WRAPPER_CMD}"
    [[ ! $(grep -E ^I2P_USER $0) && "$EUID" = "0" ]] &&
        fail "Attempting to start as root! Please edit $(basename $0) and set the variable \$I2P_USER"
    [[ "$(id -un "$I2P_USER")" != "$I2P_USER" ]] &&
        fail "\$I2P_USER does not exist: $I2P_USER"

    wrapper_ver=$(/usr/bin/java-service-wrapper --version |head -n1|cut -d' ' -f7)
    JAVABINARY=$(awk -F'=' '/^ *wrapper\.java\.command/{print $2}' "$WRAPPER_CONF")
    COMMAND_LINE="\"$WRAPPER_CMD\" \"$WRAPPER_CONF\" wrapper.syslog.ident=\"i2prouter\" wrapper.java.command=\"$JAVABINARY\" wrapper.pidfile=\"$PIDFILE\" wrapper.name=\"i2prouter\" wrapper.logfile=\"$LOGFILE\" wrapper.script.version=${wrapper_ver}"

}

get_pid() {
    pgrep -u "$I2P_USER" -f 'wrapper.name=i2prouter'
}

check_if_running() {
    unset pid
    if [[ -f "$PIDFILE" ]]; then
        if [[ -r "$PIDFILE" ]]; then
            pid=$(cat "$PIDFILE")
            #echo "debug: pid:$pid get_pid:$(get_pid)"
            if [[ ! "$pid" ]]; then
                pid=$(get_pid)
                if [[ ! "$pid" ]]; then
                    echo "Removing stale pid file: $PIDFILE"
                    rm -f "$PIDFILE"
                fi
            else
                [[ "$pid" != "$(get_pid)" ]] &&
                    fail "\$PIDFILE $PIDFILE differs from what is actually running!"
            fi
        else
            fail "Cannot read \$PIDFILE: $PIDFILE"
        fi
    fi
}

_console() {
    if [[ ! "$pid" ]]; then
        trap '' INT QUIT
        eval $COMMAND_LINE
        [[ $? != 0 ]] && fail "Failed to launch the wrapper!"
    else
        echo "I2P Service is already running"
    fi
}

_start() {
    if [[ ! "$pid" ]]; then
        echo -n "Starting I2P Service"
        COMMAND_LINE+=" wrapper.daemonize=TRUE"
        eval $COMMAND_LINE
        [[ $? != 0 ]] && fail "Failed to launch the wrapper!"
        i=0
        while [[ ! "$pid" || $i < $TIMEOUT ]]; do
            echo -n "."
            sleep 1
            check_if_running
            ((i++))
        done
        [[ $(get_pid) ]] &&
            echo " done" || fail "timeout: Failed to start wrapper!"
    else
        echo "I2P Service is already running"
    fi
}

_stop() {
    if [[ "$pid" ]]; then
        echo -n "Stopping I2P Service"
        kill -TERM $pid
        [[ $? != 0 ]] && fail "Unable to stop I2P Service: kill -TERM $pid"
        i=0
        while [[ "$pid" || $i > $TIMEOUT ]]; do
            echo -n "."
            sleep 1
            [[ ! $(get_pid) ]] && unset pid
            ((i++))
        done
        if [[ "$pid" ]]; then
            fail "timeout: Failed to stop wrapper!"
        else
            echo " done"
            [[ "$1" = 'start' ]] && _start
        fi
    else
        echo "I2P Service is not running."
    fi
}

_graceful() {
    if [[ "$pid" ]]; then
        echo "Stopping I2P Service gracefully..."
        kill -HUP $pid
        [[ $? != 0 ]] && fail "Unable to stop I2P Service."
    else
        echo "I2P Service is not running."
    fi
}

_status() {
    [[ "$pid" ]] &&
        echo "I2P Service is running: PID:$pid" ||
        echo "I2P Service is not running."
}

_dump() {
    if [[ "$pid" ]]; then
        echo "Dumping threads..."
        kill -QUIT $pid
        [[ $? != 0 ]] &&
            fail "Failed to dump I2P Service" || echo "Dumped I2P Service."
    else
        echo "I2P Service is not running."
    fi
}
#-----------------------------------------------------------------------------

check_user "$@"
init_vars
check_if_running

case "$1" in
     'console') _console
                ;;
       'start') _start
                ;;
        'stop') _stop
                ;;
    'graceful') _graceful
                ;;
     'restart') _stop "start"
                ;;
      'status') _status
                ;;
        'dump') _dump
                ;;

    *)  echo "Usage: $(basename $0) [command]"
        echo
        echo "Commands:"
        echo "  console     Launch in the current console"
        echo "  start       Start in the background as a daemon process"
        echo "  stop        Stop if running as a daemon or in another console"
        echo "  graceful    Stop gracefully, may take up to 11 minutes for all tunnels to close"
        echo "  restart     Restart only if running"
        echo "  status      Query the current status"
        echo "  dump        Request a Java thread dump if running"
        echo
        ;;
esac
exit 0
