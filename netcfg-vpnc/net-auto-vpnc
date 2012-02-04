#!/bin/bash

# Modifed by:     Michael Asher <asherlm [at] gmail dot com
# Last Modified:  06/07/2010 
#    
# This script is heavily inspired from the net-auto-wireless script
# This will allow you to connect at boot time to the VPN.
# You will need to define a netcfg entry (/etc/networks/examples/vpnc.example)
# In order to use the script.

. /etc/rc.conf
. /etc/rc.d/functions
. /usr/lib/network/globals

# Variables
whichroute=`/usr/sbin/ip route | grep default | grep -o "dev\ [a-z0-9]\{3,5\}"|awk '{print $2}'` # Get default route interface
# Is VPNC even installed?
if [[ ! -x /usr/sbin/vpnc ]]; then
   echo "Please install 'vpnc' to use net-auto-vpnc"
   exit 0
fi  
# Check to see if a VPNC Connection has been defined
if [ -z "${VPN_CONNECTION}" ]; then
    report_fail "No VPN_CONNECTION  name set. Set it by adding VPN_CONNECTION=\"NETCFG VPNC configuration\" to rc.conf"
    exit 0
fi
#
if [ -z "${WIRED_INTERFACE}" ]; then
  chkwiredint="NULL"
else
  chkwiredint=`/sbin/ifconfig ${WIRED_INTERFACE} | grep -oi 'RUNNING'` 
fi
#
if [ -z "${WIRELESS_INTERFACE}" ]; then
  chkwirelessint="NULL"
else
  chkwirelessint=`/sbin/ifconfig ${WIRELESS_INTERFACE} | grep -oi 'RUNNING'` 
fi
#
if [ -z "${VPN_ROUTE_WAITTIME}" ]; then 
  VPN_ROUTE_WAITTIME="NULL"
fi
#
if [ -z "${VPN_ROUTE_WAITTIME}" ]; then 
  VPN_INTERFACE_WAITTIME="NULL"
fi
# Additional Variables
whichroute=`/usr/sbin/ip route | grep default | grep -o "dev\ [a-z0-9]\{3,5\}"|awk '{print $2}'` # Get default route interface
#
checkroutes(){
    if [ "$whichroute" == "" ]; then
      if [[ "${VPN_ROUTE_WAITTIME}" == "" || "${VPN_ROUTE_WAITTIME}" == "NULL" ]]; then
        stat_busy "Default route is not defined. Not running VPN."
        stat_fail
        exit 1
      else
        stat_busy "Default route is not defined. Will try again in ${VPN_ROUTE_WAITTIME} seconds" # This is needed to give my wireless time to show up with an IP.
        sleep ${VPN_ROUTE_WAITTIME}
        whichroute=`/usr/sbin/ip route | grep default | grep -o "dev\ [a-z0-9]\{3,5\}"|awk '{print $2}'`
        if [ "$whichroute" == "" ]; then
          stat_busy "Default route is currently not defined. Not running VPN"
          stat_fail
          exit 1
        fi
      fi
    fi
}
#
checkrunninginterfaces(){
  interfaces=0
  donotrunint=0
  if [[ "$chkwiredint" == "" || "$chkwiredint" == "NULL" ]]; then
    if [ "$chkwirelessint" == "" ]; then
        if [[ "${VPN_INTERFACE_WAITTIME}" == "" || "${VPN_INTERFACE_WAITTIME}" == "NULL"  ]]; then
          stat_busy "VPN_INTERFACE_WAITTIME not defined in rc.conf"
          stat_busy "No interfaces are currently available. VPN not established"
          stat_fail
          exit 0
        else
          stat_busy "No interfaces are currently available. Trying again in ${VPN_INTERFACE_WAITTIME} seconds."
          sleep ${VPN_INTERFACE_WAITTIME}
        fi
    elif [ "$chkwirelessint" == "RUNNING" ]; then
      if [ "${VPN_DONOTRUNONTHISINTERFACE}" == "${WIRELESS_INTERFACE}" ]; then
        stat_busy "${WIRELESS_INTERFACE} has been configured to not auto-start VPN"
        donotrunint=$donotrunint+1
      else
          interfaces=$interfaces+1
      fi
    fi
  elif [ "$chkwiredint" == "RUNNING" ]; then
    if [ "${VPN_DONOTRUNONTHISINTERFACE}" == "${WIRED_INTERFACE}" ]; then
        stat_busy "${WIRED_INTERFACE} has been configured to not auto-start VPN"
        donotrunint=$donotrunint+1
    else
        interfaces=$interfaces+1
    fi
  fi
  # Run it again - Assuming items above failed
  chkwiredint=`/sbin/ifconfig ${WIRED_INTERFACE} | grep -oi 'RUNNING'`
  chkwirelessint=`/sbin/ifconfig ${WIRELESS_INTERFACE} | grep -oi 'RUNNING'`
  if [[ "$chkwiredint" == "" || "$chkwiredint" == "NULL" ]]; then
    if [ "$chkwirelessint" == "" ]; then
      stat_busy "No interfaces found running. VPN not established." # No need to try again. Get through to finish booting.
      stat_fail
      exit 0
    elif [ "$chkwirelessint" == "RUNNING" ]; then
      if [ "${VPN_DONOTRUNONTHISINTERFACE}" == "${WIRELESS_INTERFACE}" ]; then
        stat_busy "${WIRED_INTERFACE} has been configured to not auto-start VPN"
        donotrunint=$donotrunint+1
      else
          interfaces=$interfaces+1
      fi
    elif [ "$chkwiredint" == "RUNNING" ]; then
      if [ "${VPN_DONOTRUNONTHISINTERFACE}" == "${WIRED_INTERFACE}" ]; then
        stat_busy "${WIRED_INTERFACE} has been configured to not auto-start VPN"
        donotrunint=$donotrunint+1
      else
        interfaces=$interfaces+1
      fi
    fi
  fi
  
  # Final check
  if [[ "$donotrunint" == "0" ]]; then 
    if [[ "$interfaces" == "0" || $interfaces == "" ]]; then
      stat_busy "No interfaces found running. VPN not established."
      stat_fail
      exit 0
    fi
  else
      exit 0
  fi
} 

case "$1" in
    start)
        if  ! ck_daemon net-auto-vpnc; then
            exit_stderr "net-auto-vpnc has already been started: try \"/etc/rc.d/net-auto-vpnc restart\""
        fi
        checkrunninginterfaces
        checkroutes
        stat_busy "Starting netcfg auto-vpnc connection ${VPN_CONNECTION}"
        /usr/bin/netcfg up "${VPN_CONNECTION}"
        if [ $? -eq 0 ]; then
            add_daemon net-auto-vpnc
            stat_done
        else
            stat_fail
        fi
        ;;
    stop)
        if ! ck_daemon net-auto-vpnc; then
            stat_busy "Stopping netcfg auto-vpnc connection ${VPN_CONNECTION}"
            /usr/bin/netcfg down "${VPN_CONNECTION}" >>/dev/null 2>&1
            if [ $? -eq 0 ]; then
                rm_daemon net-auto-vpnc
                stat_done
            else
                stat_fail
            fi
        fi
        ;;
    restart)
        "$0" stop
        sleep 1
        "$0" start
        ;;
    *)
        echo "Usage: $0 {start|stop|restart|kill}"
        exit 1
        ;;
esac
exit 0
# vim: ft=sh ts=4 et sw=4:
