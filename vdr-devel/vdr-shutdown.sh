#!/bin/bash

# Shut the computer down, setting ACPI wakeup time if VDR passes a timer
# event.
#
# Arguments passed by VDR
# $1 = Time (UTC, seconds from epoch) of the next timer event ('0' if none)
# $2 = Number of seconds until the next timer event ('0' if none)
# $3 = Number of the channel that will be recorded
# $4 = File name of the recording as defined in the timer
# $5 = '0' for automatic shutdown or '1' for requested shutdown
#
# 1. To enable this script, pass it to vdr with the -s option.  If using
#    runvdr-extreme then it can be defined in /etc/runvdr.conf:
#      # Call SHUTDOWN to shutdown the computer.
#      SHUTDOWN="/usr/bin/vdr-shutdown.sh"
# 2. If HARDWARECLOCK and TIMEZONE are not set properly in /etc/rc.conf
#    then ACPI wakeup may not work as expected.
# 3. If vdr is being run as a user other than root, e.g. vdr, then this
#    script will not work unless the vdr user is able to run it as root
#    with sudo, without entering a password and without access to a terminal
#    device.  To set all that up in /etc/sudoers, run visudo and enter:
#      Defaults:vdr    !requiretty
#      vdr             ALL=(root) NOPASSWD: /usr/bin/vdr-shutdown.sh

# If not run as root then run as sudo root
if [ "$(id -u)" -ne 0 ]; then
  sudo $0 $*
  exit $?
fi

# Time for the system to start, in seconds
START_BUFFER="300"

# Add debug information to system logs, set to any value to enable logging
DEBUG_LOGGING=

# Set ACPI wakeup time for timer event
if [ "${1:-0}" -gt 0 ] ; then
  BASENAME=$(basename $0)

  ADJTIME_FILE="/var/lib/hwclock/adjtime"
  if [ ! -e "$ADJTIME_FILE" ]; then
    if [ -n "$DEBUG_LOGGING" ]; then
      logger -t $BASENAME File $ADJTIME_FILE not found
    fi
    exit 1
  fi

  WAKEALARM_FILE="/sys/class/rtc/rtc0/wakealarm"
  if [ ! -e "$WAKEALARM_FILE" ]; then
    if [ -n "$DEBUG_LOGGING" ]; then
      logger -t $BASENAME File $WAKEALARM_FILE not found
    fi
    exit 1
  fi
  if [ ! -w "$WAKEALARM_FILE" ]; then
    if [ -n "$DEBUG_LOGGING" ]; then
      logger -t $BASENAME File $WAKEALARM_FILE not writeable
    fi
    exit 1
  fi

  TIMEZONE=$(grep -e LOCAL -e UTC $ADJTIME_FILE)
  if [ "$TIMEZONE" = "LOCAL" ]; then
    UTC_OFFSET=$(($(date "+%::z" | sed -e "s/[+-]/&1*(((/" -e "s/:/)*60+/g" -e "s/$/)/")))
  else
    UTC_OFFSET="0"
  fi
  WAKEUP_TIME=$(($1 + $UTC_OFFSET - $START_BUFFER))
  echo 0 > $WAKEALARM_FILE
  echo $WAKEUP_TIME > $WAKEALARM_FILE

  if [ -n "$DEBUG_LOGGING" ]; then
    logger -t $BASENAME ACPI wakeup: $(grep alrm_date /proc/driver/rtc | cut -c 13-) $(grep alrm_time /proc/driver/rtc | cut -c 13-) $TIMEZONE
    if [ "$TIMEZONE" = "LOCAL" ]; then
      logger -t $BASENAME Timer event: $(date -d "1970-01-01 UTC $1 seconds" "+%F %T %Z")
    else
      logger -t $BASENAME Timer event: $(date -u -d "1970-01-01 UTC $1 seconds" "+%F %T %Z")
    fi
  fi
fi

# Shut the computer down
exec poweroff

