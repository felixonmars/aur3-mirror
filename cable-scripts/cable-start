#!/bin/bash
#Made by Marcelo A.

ME=`basename $0`
# Set to "C" locale so we can parse messages from commands
LANG=C
export LANG
# Must be root
if test "`id -u`" != 0 ; then
    echo "$0: You must be root to run this script" >& 2
    exit 1
fi

CONFIG=/etc/ppp/pptp.conf
USER=""
ETH=""
if test ! -f "$CONFIG" -o ! -r "$CONFIG" ; then
    echo "$0: Cannot read configuration file '$CONFIG'" >& 2
    exit 1
fi

. $CONFIG

for i in /etc/ppp/ppp-cable.pid /var/run/ppp-cable.pid ; do
  if [ -r $i ] ; then
     PID="`head -n1 $i`"
     #Check if still running
   kill -0 $PID > /dev/null 2>&1
   if [ $? = 0 ] ; then
          echo "$ME: There already seems to be a connection up (PID $PID)" >& 2
  exit 1
  fi
  rm -f $i
fi  
done    

# pptp invocation
for i in /usr/sbin/pptp-linux ./pptp-linux "`which pptp`" ; do
   if test -x "$i" ; then
 PPTP_CMD="$i"
 break
 fi
done
  if [ ! -x "$i" ] ; then
 echo "Couldn't find any pptp executable , please reinstall."
    exit 1
  fi

# Check for command-line overriding of USER and ETH
case "$#" in
    1)
      USER="$1"
      ;;
    2)
      USER="$1"
      ETH="$2"
      ;;
esac
	
##Check if ethx NIC is up and running.
netstat -rn |grep " ${ETH}\$" > /dev/null
/sbin/ifconfig $ETH | grep "UP.*RUNNING" > /dev/null
 if [ "$?" != "0" ] ; then
        echo "Your $ETH interface isn't UP and/or RUNNING"
	exit 1
fi   
 
DGW=$(route -n |grep "^0.*eth"| awk '{ print $2 }')
 if [ "$DGW" = "" ] ; then
   DGW1=$(route -n|grep "UGH.*eth"|awk '{ print $2 }' )
      if [ "$DGW1" = "" ] ; then
    echo ""
    echo "Something is Fishy with your routing table, no Default Gateway"
    echo "Aborting..."
    echo ""
    exit 1
      else
      DGW="$DGW1"
  route add default gw $DGW 2> /dev/null
      fi
 fi      
	
# Check that config file is sane
if test "$USER" = "" ; then
    echo "$0: Check '$CONFIG' -- no setting for USER" >& 2
    exit 1
fi
if test "$ETH" = "" ; then
    echo "$0: Check '$CONFIG' -- no setting for ETH" >& 2
    exit 1
fi
if test "$SERVERADDR" = "" ; then
    echo "$0: Check '$CONFIG' -- no setting for SERVERADDR" >& 2
    exit 1
fi
#PPPD_PID=0

       
# MTU of Ethernet card attached to modem MUST be 1500.
ifconfig $ETH up mtu 1500
modprobe ppp_generic > /dev/null 2>&1
modprobe ppp_async > /dev/null 2>&1
    
# If DNSTYPE is SERVER, we must use "usepeerdns" option to pppd.
if test "$DNSTYPE" = "SERVER" ; then
    PEERDNS=yes
fi

if test "$PEERDNS" = "yes" ; then
    PEERDNS="usepeerdns"
else
    PEERDNS=""
fi

if test "$PERSIST" != "no" ; then
    PERSIST="persist"
else
    PERSIST=""
fi

if test "$DEFAULTROUTE" != "no" ; then
    DEFAULTROUTE="defaultroute"
else
    DEFAULTROUTE="nodefaultroute"
fi
	
# Standard PPP options we always use
PPP_STD_OPTIONS="noipdefault noauth default-asyncmap noipx $DEFAULTROUTE hide-password nodetach maxfail 1 lcp-max-configure 6 linkname cable ipparam cable-pptp $PEERDNS $PERSIST mtu 1460 mru 1460 noproxyarp noaccomp  nobsdcomp nodeflate nopcomp  user $USER lcp-echo-interval $LCP_INTERVAL lcp-echo-failure $LCP_FAILURE $PPPD_EXTRA"


    if test "$OVERRIDE_PPPD_COMMAND" != "" ; then
       setsid $OVERRIDE_PPPD_COMMAND &
    else
        setsid pppd $PPP_STD_OPTIONS \
	pty "$PPTP_CMD $SERVERADDR $PPTP_EXTRA --nolaunchpppd" &
    fi
    sleep 4
