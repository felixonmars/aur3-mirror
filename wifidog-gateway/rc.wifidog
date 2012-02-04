#!/bin/bash

daemon_name=wifidog
IPT='/usr/sbin/iptables'
WIFIDOG='/usr/bin/wifidog'
WDCTL='/usr/bin/wdctl'

. /etc/rc.conf
. /etc/rc.d/functions

get_pid() {
	pidof -o %PPID $daemon_name
}

case "$1" in
  start)
    stat_busy "Starting $daemon_name daemon"
    
    PID=$(get_pid)
    if [ -z "$PID" ]; then
      [ -f /var/run/$daemon_name.pid ] && rm -f /var/run/$daemon_name.pid
      # Test the ipt modules
      $0 test-module > /dev/null
      if [ $? -gt 0 ]; then
        stat_fail
        exit 1
      fi
      
      # RUN
      $WIFIDOG
      if [ $? -gt 0 ]; then
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
    #
    # Ask the process to stop
    $WDCTL stop
    if [ $? -gt 0 ]; then
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
    $WDCTL status
    ;;

  debug|test-module)
    ### Test ipt_mark with iptables
    test_ipt_mark () {
      IPTABLES_OK=$($IPT -A FORWARD -m mark --mark 2 -j ACCEPT 2>&1 | grep "No chain.target.match")
      if [ -z "$IPTABLES_OK" ]; then
        $IPT -D FORWARD -m mark --mark 2 -j ACCEPT 2>&1
        echo 1
      else
        echo 0
      fi
    }
    
    ### Test ipt_mac with iptables
    test_ipt_mac () {
      IPTABLES_OK=$($IPT -A INPUT -m mac --mac-source 00:00:00:00:00:00 -j ACCEPT 2>&1 | grep "No chain.target.match")
      if [ -z "$IPTABLES_OK" ]; then
        $IPT -D INPUT -m mac --mac-source 00:00:00:00:00:00 -j ACCEPT 2>&1
        echo 1
      else
        echo 0
      fi
    }
    
    ### Find a module on disk
    module_exists () {
      echo " Looking for a module on disk"
      EXIST=$(find /lib/modules/`uname -r` -name $1.*o 2>/dev/null)
      if [ -n "$EXIST" ]; then
        echo 1
      else
        echo 0
      fi
    }
    
    ### Test if a module is in memory
    module_in_memory () {
      MODULE=$(lsmod | grep $1 | awk '{print $1}')
      if [ "$MODULE" = "$1" ]; then
        echo 1
      else
        echo 0
      fi
    }
    
    echo "Testing for iptables modules"
    
    echo "  Testing ipt_mac"
    TEST_IPT_MAC=$(test_ipt_mac)
    if [ "$TEST_IPT_MAC" = "0" ]; then
      echo "   iptables is not working with ipt_mac"
      echo "   Scanning disk for ipt_mac module"
      TEST_IPT_MAC_MODULE_EXISTS=$(module_exists "ipt_mac")
      if [ "$TEST_IPT_MAC_MODULE_EXISTS" = "0" ]; then
        echo "   ipt_mac module is missing, please install it (kernel or module)"
        exit
      else
        echo "   ipt_mac module exists, trying to load"
        insmod ipt_mac > /dev/null
        TEST_IPT_MAC_MODULE_MEMORY=$(module_in_memory "ipt_mac")
        if [ "$TEST_IPT_MAC_MODULE_MEMORY" = "0" ]; then
          echo "  Error: ipt_mac not loaded"
          exit
        else
          echo "  ipt_mac loaded sucessfully"
        fi
      fi
    else
      echo "   ipt_mac  module is working"
    fi
    
    echo "  Testing ipt_mark"
    TEST_IPT_MARK=$(test_ipt_mark)
    if [ "$TEST_IPT_MARK" = "0" ]; then
      echo "   iptables is not working with ipt_mark"
      echo "   Scanning disk for ipt_mark module"
      TEST_IPT_MARK_MODULE_EXISTS=$(module_exists "ipt_mark")
      if [ "$TEST_IPT_MARK_MODULE_EXISTS" = "0" ]; then
        echo "   iptables ipt_mark module missing, please install it (kernel or module)"
        exit
      else
        echo "   ipt_mark module exists, trying to load"
        insmod ipt_mark
        TEST_IPT_MARK_MODULE_MEMORY=$(module_in_memory "ipt_mark")
        if [ "$TEST_IPT_MARK_MODULE_MEMORY" = "0" ]; then
          echo "   Error: ipt_mark not loaded"
          exit
        else
          echo "   ipt_mark loaded sucessfully"
        fi
      fi
    else
      echo "   ipt_mark module is working"
    fi
    ;;

  *)
    echo "usage: $0 {start|stop|restart|status|debug|test-module}"
esac

exit 0

# vim:set ts=2 sw=2 et:
