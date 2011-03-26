#!/bin/sh
# A script to control the fan in the eeepc
## yet another dubious Dougal script for Puppy Linux, October 2008
## Licenced under GPL v2 or later
## No BASHisms I'm aware of...
# Update Nov. 2nd: add clean exiting (trap SIGTERM) and VERBOSE_LOGGING

SCRIPT_NAME=$(basename $0)
CONFIG_FILE="/etc/eee-fan.conf"
LOG_FILE="/var/log/eee-fan.log"

# Make sure the eee module is loaded
if [ ! -d /proc/eee ] ; then
  if grep -Fq 'eee ' /proc/modules ; then
    echo "$SCRIPT_NAME: Error: /proc/eee doesn't exist" >&2
    exit
  elif modprobe eee ; then
    # sleep a little, just in case (I don't have an eee, so don't know...)
    sleep 5
    if [ ! -d /proc/eee ] ; then
      echo "$SCRIPT_NAME: Error: /proc/eee doesn't exist" >&2
      exit
    fi
  else
    echo "$SCRIPT_NAME: Error: failed to load module eee.ko" >&2
    exit
  fi
fi

# a function to set fan to auto and exit
exit_script(){
  echo 40 > /proc/eee/fan_speed
  echo 0 > /proc/eee/fan_manual
  $ENABLE_LOGGING && echo "$(date +'%b %d %T ') Set mode to auto ; Exiting" >>$LOG_FILE
  [ "$1" ] && echo "$SCRIPT_NAME: Error: $@" >&2
  exit
}

# a function to read config file and make sure we have everything (or set to default)
read_config(){
  . $CONFIG_FILE || exit_script "failed to read configuration file. Exiting."
  [ "$CONTROL_FAN" = "true" ] || exit_script 
  [ -z "$CONTROL_FAN" -o -z "$SLEEP_TIME" -o -z "$HIGH_TEMP" -o -z "$LOW_TEMP" -o -z "$FAN_SPEED" ] && exit_script "wrong values in configuration file. Exiting."
  # make sure max temp is reasonable and higher than low temp...
  [ $HIGH_TEMP -le $MAX_TEMP -a $HIGH_TEMP -gt $LOW_TEMP ] || exit_script "bad HIGH_TEMP value. Exiting."
  # make sure low temp is reasonable...
  [ $LOW_TEMP -ge $MIN_TEMP ] || exit_script "MIN_TEMP is too low. Exiting."
  # make sure speed is between 0-100
  [ $FAN_SPEED -ge 0 -a $FAN_SPEED -le 100 ] || exit_script "bad FAN_SPEED. Exiting"
  [ $SLEEP_TIME -gt 0 ] || exit_script "bad SLEEP_TIME value. Exiting"
}

# Trap sighup, so we can re-read the configuration without having to terminate
trap "read_config" HUP
trap "exit_script" SIGTERM

# Source config file (also exits if needed)
read_config

# Move old config file
$ENABLE_LOGGING && mv $LOG_FILE $LOG_FILE.old 2>/dev/null

# Change to manual control
echo 1 > /proc/eee/fan_manual
$ENABLE_LOGGING && echo "$(date +'%b %d %T ') Starting ; Set fan to manual" >>$LOG_FILE

# Keep track of the state we're in, so we don't keep checking the fan speed
STATE="off"
# start with off
echo 0 > /proc/eee/fan_speed

# Start the loop
while true ; do
  #TEMP=$(cat /proc/eee/temperature)
  read TEMP < /proc/eee/temperature
  [ -z "$TEMP" ] && exit_script "no temperature value found. Exiting"
  if [ $TEMP -ge $HIGH_TEMP ] && [ "$STATE" = "off" ] ; then
    echo "$FAN_SPEED" > /proc/eee/fan_speed
    STATE="on"
    $ENABLE_LOGGING && echo "$(date +'%b %d %T ') Temperature ${TEMP}C ; Set fan speed to $FAN_SPEED" >>$LOG_FILE
  elif [ $TEMP -lt $LOW_TEMP ] && [ "$STATE" = "on" ] ; then
    echo 0 > /proc/eee/fan_speed
    STATE="off"
    $ENABLE_LOGGING && echo "$(date +'%b %d %T ') Temperature ${TEMP}C ; Set fan speed to 0" >>$LOG_FILE
  fi
  $VERBOSE_LOGGING && echo "$(date +'%b %d %T ') Temperature: ${TEMP}C" >>$LOG_FILE
  sleep $SLEEP_TIME
done

