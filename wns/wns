#!/bin/bash
#
# WNS - Wireless Network Scanner
#
# Author:   S.M. Masi
# Date:     6.10.2005
#

. /etc/rc.conf              # include rc.conf script
. /etc/rc.d/functions       # include functions script

# getting wireless settings
[ -f /etc/conf.d/wireless ] && . /etc/conf.d/wireless
# getting dhcpcd settings
[ -f /etc/conf.d/dhcpcd ] && . /etc/conf.d/dhcpcd

# some global variables
network=""
retval=""
device="eth1"

# text color - yellow, in 'functions'-file format
C_TEXT="\033[0;33;1m"

# before we start check if user is root
if [ $EUID -ne 0 ]; then
    # user is not a root, give a message and exit 
    echo "Only root can execute this script!"
    exit
fi

# try to find default wireless interface
for i in $WLAN_INTERFACES ; do
    device=$i
done

# bring up an interface that's down
if [ "`/sbin/ifconfig ${1} 2>/dev/null | grep DOWN`" ]; then
    ifconfig $device up
fi

# find profiles and available networks
profpath="/etc/network-profiles/"
profiles=`ls $profpath`
networks=`iwlist $device scanning | grep ESSID`

# connecting to unknown network
connect() { 
    iwconfig $device enc off
    iwconfig $device mode managed 
    iwconfig $device essid $network
    rm -f /etc/dhcpc/dhcpcd-${device}.{pid,cache} >/dev/null 2>&1
    /usr/sbin/dhcpcd -nS -t 8 $device
    retval=$?
}

# disconnecting and disabling device
disconnect() {
    iwconfig $device essid default
    ifconfig $device down
}

# connecting to preferred network
connect_ex() {
    local profile
    profile="${profpath}${network}"
    [ -f $profile ] && . $profile

    iwconfig $device enc off
    iwconfig $device essid $network
    [ !"$MODE" ] && MODE=managed
    iwconfig $device mode $MODE 
    [ $CHANNEL ] && iwconfig $device channel $CHANNEL
    [ $KEY ] && iwconfig $device enc $KEY

    rm -f /etc/dhcpc/dhcpcd-${device}.{pid,cache} >/dev/null 2>&1
    /usr/sbin/dhcpcd -nS $device
    retval=$?
}

# adding profile
add_profile() {
    echo " "
    echo -ne "${C_TEXT}Enter networks name (ESSID)? $C_MAIN"
    read NAME
    echo -ne "${C_TEXT}Enter networks mode (AUTO) ? $C_MAIN"
    read MODE
    echo -ne "${C_TEXT}Enter encriptions key (off)? $C_MAIN"
    read ENCKEY
    echo -ne "${C_TEXT}Enter networks channel (6) ? $C_MAIN"
    read CHANNEL
    echo -e "$C_CLEAR "
    echo -e "${C_TEXT}essid$C_CLEAR   = $C_MAIN $NAME"
    echo -e "${C_TEXT}mode$C_CLEAR    = $C_MAIN $MODE"
    echo -e "${C_TEXT}key$C_CLEAR     = $C_MAIN $ENCKEY"
    echo -e "${C_TEXT}channel$C_CLEAR = $C_MAIN $CHANNEL"
    echo -e "$C_CLEAR "
    
    echo -e "${C_TEXT}These are your settings. Please note that this will write"
    echo -ne "${C_TEXT}file $C_MAIN'$NAME'${C_TEXT} in your $C_MAIN'$profpath'"
    echo -e "${C_TEXT} folder."
    echo -e "${C_TEXT}If there is any file with such name it will be ${C_FAIL}overwritten!"
    echo " "  
    echo -ne "${C_TEXT}Do you want to write this file (type yes to proceed)? "
    read answer
    echo " "
    if [ "$answer" != "yes" ]; then
        echo -e "${C_FAIL}Operation cancelled by user"
    else
        echo "#"                            >  ${profpath}${NAME}
        echo "# $NAME - Network Profile"    >> ${profpath}${NAME}
        echo "#"                            >> ${profpath}${NAME}
        echo " "                            >> ${profpath}${NAME}
        echo "  ESSID=$NAME"                >> ${profpath}${NAME}
        echo "  MODE=$MODE"                 >> ${profpath}${NAME}
        echo "  KEY=$ENCKEY"                >> ${profpath}${NAME}
        echo "  CHANNEL=$CHANNEL"           >> ${profpath}${NAME}
        echo " "                            >> ${profpath}${NAME}
        echo "# end of $NAME profile"       >> ${profpath}${NAME}

        # setting attrs for profile-file, because of enc key this
        # file cann't be world readable
        chmod 0600 ${profpath}${NAME}

        echo -e "${C_BUSY}Profile created succesfully."    
        echo -e " $C_CLEAR"
    fi
}

# deleting profile
del_profile() {
    stat_busy "Deleting $C_TEXT'${profpath}${1}'"
    [ $1 ] && rm ${profpath}${1} >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        stat_done
    else
        stat_fail
    fi
}

case "$1" in
  start)
    stat_busy "Starting Wireless Network Scanner"
    #
    # searching for preferred networks
    #
    for net in $profiles ; do
        for i in $networks ; do
            if [ "$i" = "ESSID:\"$net\"" ]; then
                network=$net
                connect_ex
                found="yes"
                break
            fi
        done
        
        if [ "$found" = "yes" ]; then
            break
        fi
    done
    #
    # trying to catch a networks 
    #
    if [ "$found" != "yes" ]; then
        ifconfig $device up
        for i in $networks ; do
            ccn=${#i}
            if [ $ccn -gt 8 ]; then
                strval=${i:7:ccn-8}            
            fi 
            network=$strval
            if [ $network ]; then
                connect      
            fi
            if [ $retval -eq 0 ]; then
                found="yes"
                break
            fi
        done
    fi

    if [ "$found" ]; then
        stat_done
    else
        stat_fail
    fi
  ;;
  scan)
    #
    # scanning for available networks
    #
    stat_busy "Scanning ..."
    stat_done
    n=0
    for i in $networks ; do
        n=$(($n + 1))
        stat_busy "$n] WLAN $i"
        stat_done
    done
    if [ "$networks" ]; then
        stat_busy "Found $n networks"
        stat_done
    else
        stat_busy "No networks found."
        stat_done
    fi
  ;;
  try)
    #
    # try to connect to one of available networks
    #    
    network=$2
    stat_busy "Trying to connect $network"
    if [ $network ]; then
        connect      
    fi
    if [ $retval -eq 0 ]; then
        stat_done
    else
        stat_fail
    fi
  ;;
  stop)
    #
    # disconnect and stop wireless device
    #
    stat_busy "Stopping Wireless Network Scanner"
    disconnect
    stat_done
  ;;
  add)
    #
    # add network profile to networks-profile
    #
    add_profile
  ;;
  del)
    #
    # delete network profile
    #
    [ $2 ] && del_profile $2
  ;;
  *)
    echo "usage: $0 {start|stop|scan|try [network]|add|del [network]}"
  ;;
esac

