#!/bin/bash

#-----------------------------------------------------------------------------
# Paths
I2P="/opt/i2p"
I2P_CONFIG_DIR="$I2P/.i2p"
I2PTEMP="/tmp"

# User to run the wrapper as.
# IMPORTANT - Make sure that the user has the required privileges to write
#  the PID file and wrapper.log files and that the directories exist.
I2P_USER="i2p"

# Wrapper
WRAPPER_CMD="$I2P/i2psvc"
WRAPPER_CONF="$I2P/wrapper.config"
LOGDIR="$I2P_CONFIG_DIR"
LOGFILE="$LOGDIR/wrapper.log"

# If set, wait for the wrapper to report that the daemon has started
WAIT_FOR_STARTED_TIMEOUT=120
#-----------------------------------------------------------------------------

fail() {
    for msg in "$@"; do
        printf "\e[1;31m==> ERROR:\033[0m %s\n" "$msg"
    done
    exit 1
}

LOCKDIR="/run/lock/subsys"
LOCKFILE="$LOCKDIR/i2p"

check_user() {
    if [[ "$(id -un)" != "$I2P_USER" ]]; then
        [[ ! -d "$LOCKDIR" ]] &&
            fail "Unable to find LOCKDIR: $LOCKDIR"
        if [[ "$1" = @(*start|console) ]]; then
            touch "$LOCKFILE"
            chmod 600 "$LOCKFILE"
            chown ${I2P_USER}:${I2P_USER} "$LOCKFILE"
        fi

        SCRIPT_PATH="$(cd $(dirname $0) && pwd)/$(basename $0)"
        su - $I2P_USER -c "\"${SCRIPT_PATH}\" \"$@\""
        _EXITCODE=$?

        [[ ! "$(check_if_running)" ]] && rm -f "$LOCKFILE"
        exit $_EXITCODE
    else
        WRAPPER_BASE_CMD=$(basename $WRAPPER_CMD)
        LOGPROP="wrapper.logfile=\"$LOGFILE\""
        PIDDIR="$I2P_CONFIG_DIR"
        PIDFILE="$PIDDIR/i2p.pid"
        LOCKPROP="wrapper.lockfile=\"$LOCKFILE\""
    fi
}

check_vars() {
    [[ ! -d "$I2P" || ! -r "$WRAPPER_CONF" ]] &&
        fail "Unable to find WRAPPER_CONF: ${WRAPPER_CONF}"
    [[ ! -x "$WRAPPER_CMD" ]] &&
        fail "Unable to find or execute WRAPPER_CMD: ${WRAPPER_CMD}"
    [[ ! $(grep -E ^I2P_USER $0) && "$EUID" = "0" ]] &&
        fail "Running I2P as the root user is *not* recommended." \
             "Please edit $(basename $0) and set the variable I2P_USER."
    [[ "$(id -un "$I2P_USER")" != "$I2P_USER" ]] &&
        fail "I2P_USER does not exist: $I2P_USER"
}

check_if_running() {
    unset pid
    if [[ -f "$PIDFILE" ]]; then
        if [[ -r "$PIDFILE" ]]; then
            pid=$(cat "$PIDFILE")
            if [[ ! "$pid" ]]; then
                pid=$(pgrep -u "$I2P_USER" "$WRAPPER_BASE_CMD")
                if [[ ! "$pid" ]]; then
                    rm -f "$PIDFILE"
                    echo "Removed stale pid file: $PIDFILE"
                fi
            else
                (( pid == $(pgrep -u "$I2P_USER" "$WRAPPER_BASE_CMD") )) ||
                    fail "PIDFILE $PIDFILE differs from what is actually running!"
            fi
        else
            fail "Cannot read PIDFILE: $PIDFILE"
        fi
    fi
}

_console() {
    check_if_running
    if [[ ! "$pid" ]]; then
        echo "Running I2P Service in console mode..."
        trap '' INT QUIT
        mkdir -p "$PIDDIR" "$LOGDIR"
        JAVABINARY=$(awk -F'=' '/^ *wrapper\.java\.command/{print $2}' "$WRAPPER_CONF")
        COMMAND_LINE="\"$WRAPPER_CMD\" \"$WRAPPER_CONF\" wrapper.syslog.ident=\"i2p\" wrapper.java.command=\"$JAVABINARY\" wrapper.pidfile=\"$PIDFILE\" wrapper.name=\"i2p\" wrapper.displayname=\"I2P Service\" $LOCKPROP $LOGPROP wrapper.script.version=3.5.17"
        eval $COMMAND_LINE
        [[ $? != 0 ]] &&
            fail "Failed to launch the wrapper!"
    else
        echo "I2P Service is already running"
    fi
}

_start() {
    check_if_running
    if [[ ! "$pid" ]]; then
        echo -n "Starting I2P Service."
        mkdir -p "$PIDDIR" "$LOGDIR"
        JAVABINARY=$(awk -F'=' '/^ *wrapper\.java\.command/{print $2}' "$WRAPPER_CONF")
        COMMAND_LINE="\"$WRAPPER_CMD\" \"$WRAPPER_CONF\" wrapper.syslog.ident=\"i2p\" wrapper.java.command=\"$JAVABINARY\" wrapper.pidfile=\"$PIDFILE\" wrapper.name=\"i2p\" wrapper.displayname=\"I2P Service\" wrapper.daemonize=TRUE $LOCKPROP $LOGPROP wrapper.script.version=3.5.17"
        eval $COMMAND_LINE
        [[ $? != 0 ]] &&
            fail "Failed to launch the wrapper!"

        i=0
        while [[ ! $pid || $i < $WAIT_FOR_STARTED_TIMEOUT ]]; do
            echo -n "."
            sleep 1
            check_if_running
            ((i++))
        done

        [[ $(pgrep -u "$I2P_USER" "$WRAPPER_BASE_CMD") ]] &&
            echo " done" || fail "Failed to stop wrapper!"

    else
        echo "I2P Service is already running"
    fi
}

_stop() {
    check_if_running
    if [[ "$pid" ]]; then
        echo -n "Stopping I2P Service."
        kill -TERM $pid
        [[ $? != 0 ]] && fail "Unable to stop I2P Service: kill -TERM $pid"

        i=0
        while [[ $pid || $i < $WAIT_FOR_STARTED_TIMEOUT ]]; do
            echo -n "."
            sleep 1
            if [[ ! $(pgrep -u "$I2P_USER" "$WRAPPER_BASE_CMD") ]]; then
                rm -f "$PIDFILE"
                unset pid
            fi
            ((i++))
        done

        if [[ "$pid" ]]; then
            fail "Failed to stop wrapper!"
        else
            echo " done"
            [[ "$1" = 'start' ]] && _start
        fi
    else
        echo "I2P Service is not running."
    fi
}

_graceful() {
    check_if_running
    if [[ "$pid" ]]; then
        echo "Stopping I2P Service gracefully..."
        kill -HUP $pid
        [[ $? != 0 ]] && fail "Unable to stop I2P Service."
    else
        echo "I2P Service is not running."
    fi
}

_status() {
    check_if_running
    [[ "$pid" ]] &&
        echo "I2P Service is running: PID:$pid" ||
        echo "I2P Service is not running."
}

_dump() {
    check_if_running
    if [[ "$pid" ]]; then
        echo "Dumping threads..."
        kill -QUIT $pid
        [[ $? != 0 ]] &&
            fail "Failed to dump I2P Service" ||
            echo "Dumped I2P Service."
    else
        echo "I2P Service is not running."
    fi
}

check_user "$@"
check_vars

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
