#!/bin/bash

# general config
. /etc/rc.conf
. /etc/rc.d/functions

##################################################
# Some utility functions
##################################################
findDirectory()
{
  local L OP=$1
  shift
  for L in "$@"; do
    [ "$OP" "$L" ] || continue 
    printf %s "$L"
    break
  done 
}

running()
{
  local PID=$(cat "$1" 2>/dev/null) || return 1
  kill -0 "$PID" 2>/dev/null
}

readConfig()
{
  (( DEBUG )) && echo "Reading $1.."
  source "$1"
}



##################################################
# Get the action & configs
##################################################
CONFIGS=()
NO_START=0
DEBUG=0

while [[ $1 = -* ]]; do
  case $1 in
    -d) DEBUG=1 ;;
  esac
  shift
done
ACTION=$1
shift

##################################################
# Read any configuration files
##################################################
for CONFIG in /etc/default/jetty{,6} $HOME/.jettyrc; do
  if [ -f "$CONFIG" ] ; then 
    readConfig "$CONFIG"
  fi
done

if [ -z "$JETTY_HOME" ]; then
  JETTY_HOME=/opt/jetty6
fi

if [ -z "$JAVA_HOME" ]; then
  JAVA_HOME=/usr
fi

##################################################
# Set tmp if not already set.
##################################################
TMPDIR=${TMPDIR:-/tmp}

cd "$JETTY_HOME"

##################################################
# Try to find this script's configuration file,
# but only if no configurations were given on the
# command line.
##################################################
if [ -z "$JETTY_CONF" ] 
then
  if [ -f /etc/jetty.conf ]
  then
    JETTY_CONF=/etc/jetty.conf
  elif [ -f "$JETTY_HOME/etc/jetty.conf" ]
  then
    JETTY_CONF=$JETTY_HOME/etc/jetty.conf
  fi
fi

##################################################
# Get the list of config.xml files from jetty.conf
##################################################
if [ -z "$CONFIGS" ] && [ -f "$JETTY_CONF" ] && [ -r "$JETTY_CONF" ] 
then
  while read -r CONF
  do
    if expr "$CONF" : '#' >/dev/null ; then
      continue
    fi

    if [ -d "$CONF" ] 
    then
      # assume it's a directory with configure.xml files
      # for example: /etc/jetty.d/
      # sort the files before adding them to the list of CONFIGS
      for file in "$CONF/"*.xml
      do
        if [ -r "$FILE" ] && [ -f "$FILE" ] 
        then
          CONFIGS+=("$FILE")
        else
          echo "** WARNING: Cannot read '$FILE' specified in '$JETTY_CONF'" 
        fi
      done
    else
      # assume it's a command line parameter (let start.jar deal with its validity)
      CONFIGS+=("$CONF")
    fi
  done < "$JETTY_CONF"
fi

#####################################################
# Find a location for the pid file
#####################################################
if [ -z "$JETTY_RUN" ] 
then
  JETTY_RUN=$(findDirectory -w /var/run /usr/var/run /tmp)
fi

#####################################################
# Find a PID for the pid file
#####################################################
if [ -z "$JETTY_PID" ] 
then
  JETTY_PID="$JETTY_RUN/jetty.pid"
fi

##################################################
# Determine which JVM of version >1.5
# Try to use JAVA_HOME
##################################################
if [ -z "$JAVA" ] && [ "$JAVA_HOME" ]
then
  if [ "$JAVACMD" ] 
  then
    JAVA="$JAVACMD" 
  else
    [ -x "$JAVA_HOME/bin/jre" -a ! -d "$JAVA_HOME/bin/jre" ] && JAVA=$JAVA_HOME/bin/jre
    [ -x "$JAVA_HOME/bin/java" -a ! -d "$JAVA_HOME/bin/java" ] && JAVA=$JAVA_HOME/bin/java
  fi
fi

if [ -z "$JAVA" ]
then
  echo "Cannot find a JRE or JDK. Please set JAVA_HOME to a >=1.5 JRE" 2>&2
  exit 1
fi

JAVA_VERSION=$("$JAVA" -version 2>&1) || continue
IFS='"_' read _ JAVA_VERSION _ <<< "$JAVA_VERSION"

#####################################################
# See if JETTY_PORT is defined
#####################################################
if [ "$JETTY_PORT" ] 
then
  JAVA_OPTIONS+=("-Djetty.port=$JETTY_PORT")
fi

#####################################################
# See if JETTY_LOGS is defined
#####################################################
if [ "$JETTY_LOGS" ]
then
  JAVA_OPTIONS+=("-Djetty.logs=$JETTY_LOGS")
fi

#####################################################
# Are we running on Windows? Could be, with Cygwin/NT.
#####################################################
case "`uname`" in
CYGWIN*) PATH_SEPARATOR=";";;
*) PATH_SEPARATOR=":";;
esac


#####################################################
# Add jetty properties to Java VM options.
#####################################################
JAVA_OPTIONS+=("-Djetty.home=$JETTY_HOME" "-Djava.io.tmpdir=$TMPDIR")

[ -f "$JETTY_HOME/etc/start.config" ] && JAVA_OPTIONS=("-DSTART=$JETTY_HOME/etc/start.config" "${JAVA_OPTIONS[@]}")

#####################################################
# This is how the Jetty server will be started
#####################################################

JETTY_START=$JETTY_HOME/start.jar
[ ! -f "$JETTY_START" ] && JETTY_START=$JETTY_HOME/lib/start.jar

START_INI=$(dirname $JETTY_START)/start.ini
[ -r "$START_INI" ] || START_INI=""

RUN_ARGS=("${JAVA_OPTIONS[@]}" -jar "$JETTY_START" $JETTY_ARGS "${CONFIGS[@]}")
RUN_CMD=("$JAVA" "${RUN_ARGS[@]}")

#####################################################
# Comment these out after you're happy with what 
# the script is doing.
#####################################################
if (( DEBUG ))
then
  echo "JETTY_HOME     =  $JETTY_HOME"
  echo "JETTY_CONF     =  $JETTY_CONF"
  echo "JETTY_RUN      =  $JETTY_RUN"
  echo "JETTY_PID      =  $JETTY_PID"
  echo "JETTY_ARGS     =  $JETTY_ARGS"
  echo "CONFIGS        =  ${CONFIGS[*]}"
  echo "JAVA_OPTIONS   =  ${JAVA_OPTIONS[*]}"
  echo "JAVA           =  $JAVA"
  echo "RUN_CMD        =  ${RUN_CMD}"
fi
 
case "$ACTION" in
  start)
    stat_busy "Starting Jetty Servlet Container"
      cd $JETTY_HOME
      "$JAVA" "${RUN_ARGS[@]}" &> /dev/null &
      echo $! >$JETTY_PID
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon jetty6
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Jetty Servlet Container"
    cd $JETTY_HOME
    [ -e $JETTY_PID ] && PID=`cat $JETTY_PID`
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon jetty6
      rm -f $JETTY_PID
      stat_done
    fi
    ;;
  restart)
    $0 stop
    sleep 5
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac
