#!/bin/bash
#
# Trafic Shaper
#
# See http://www.knowplace.org/ for the origins of this script.

# source application-specific settings
if [ ! -f /etc/conf.d/shaper ]; then
    echo "Cannot load shaper settings!" >&2
fi
. /etc/conf.d/shaper

. /etc/rc.conf
. /etc/rc.d/functions


tc_reset ()
{
    # Reset everything to a known state (cleared)
    for IN in ${DEVS}; do
	read DEV UPLINK DNLINK <<<$(IFS=":"; echo $IN)
	tc qdisc del dev $DEV root 2> /dev/null > /dev/null
    done
}

tc_status ()
{
    if [ -z "$1" ]; then
    	for IN in ${DEVS}; do
	    read DEV UPLINK DNLINK <<<$(IFS=":"; echo $IN)

	    echo
    	    echo "[qdisc - $DEV]"
    	    tc -s qdisc show dev $DEV
    	    echo "------------------------"
    	    echo
    	    echo "[class - $DEV]"
    	    tc -s class show dev $DEV
        done
    else
	echo "[qdisc - $1]"
	tc -s qdisc show dev $1
	echo "------------------------"
	echo
	echo "[class - $1]"
	tc -s class show dev $1
    fi
}

tc_showfilter ()
{
    if [ -z "$1" ]; then
    	for IN in ${DEVS}; do
	    read DEV UPLINK DNLINK <<<$(IFS=":"; echo $IN)
	    echo "[filter - $DEV]"
	    tc -s filter show dev $DEV
    	done
    else
	echo "[filter - $1]"
	tc -s filter show dev $1
    fi
}


case "$1" in
  start)
    stat_busy "Starting traffic shaper"
    tc_reset

    for IN in ${DEVS}; do
	read DEV UPLINK DNLINK <<<$(IFS=":"; echo $IN)

    	stat_append "${DEV}=$UPLINK/$DNLINK "

	# Parts of the code written by Dan Singletary (8/7/02)
	# http://www.tldp.org/HOWTO/ADSL-Bandwidth-Management-HOWTO/implementation.html

	# NOTE: doesn't seem to do much
	# set queue size to give latency of about 2 seconds on low-prio packets
	#ip link set dev $DEV qlen 30

	# NOTE: doesn't seem to do much, tried 500 too.
	# changes mtu on the outbound device.  Lowering the mtu will result
	# in lower latency but will also cause slightly lower throughput due 
	# to IP and TCP protocol overhead.
	#ip link set dev $DEV mtu 1000

	# add HTB root qdisc
    	tc qdisc add dev $DEV root handle 1: htb default 60

	# add main rate limit classes
    	tc class add dev $DEV parent 1:  classid 1:1  htb rate ${UPLINK}kbit

	# add leaf classes - We grant each class at LEAST it's "fair share" of bandwidth.
	#                    this way no class will ever be starved by another class.  Each
	#                    class is also permitted to consume all of the available bandwidth
	#                    if no other classes are in use.
    	tc class add dev $DEV parent 1:1 classid 1:10 htb rate $[1*$UPLINK/12]kbit ceil ${UPLINK}kbit prio 0
    	tc class add dev $DEV parent 1:1 classid 1:20 htb rate $[4*$UPLINK/12]kbit ceil ${UPLINK}kbit prio 1
    	tc class add dev $DEV parent 1:1 classid 1:30 htb rate $[3*$UPLINK/12]kbit ceil ${UPLINK}kbit prio 2
    	tc class add dev $DEV parent 1:1 classid 1:40 htb rate $[2*$UPLINK/12]kbit ceil ${UPLINK}kbit prio 3
    	tc class add dev $DEV parent 1:1 classid 1:50 htb rate $[1*$UPLINK/12]kbit ceil ${UPLINK}kbit prio 4
    	tc class add dev $DEV parent 1:1 classid 1:60 htb rate $[1*$UPLINK/12]kbit ceil ${UPLINK}kbit prio 5

	# Attach qdisc to leaf classes. - here we at SFQ to each priority class.
	# SFQ insures that ithin each class connections will be treated (almost) fairly.
    	tc qdisc add dev $DEV parent 1:10 handle 10: sfq perturb 10
    	tc qdisc add dev $DEV parent 1:20 handle 20: sfq perturb 10
    	tc qdisc add dev $DEV parent 1:30 handle 30: sfq perturb 10
    	tc qdisc add dev $DEV parent 1:40 handle 40: sfq perturb 10
    	tc qdisc add dev $DEV parent 1:50 handle 50: sfq perturb 10
    	tc qdisc add dev $DEV parent 1:60 handle 60: sfq perturb 10

	# filter traffic into classes by fwmark - here we direct traffic into priority class according to
	#                                         the fwmark set on the packet (we set fwmark with iptables
	#                                         later).  Note that above we've set the default priority
	#                                         class to 1:26 so unmarked packets (or packets marked with
	#                                         unfamiliar IDs) will be defaulted to the lowest priority
	#                                         class.
	tc filter add dev $DEV parent 1:0 prio 0 protocol ip handle 10 fw flowid 1:10
	tc filter add dev $DEV parent 1:0 prio 0 protocol ip handle 20 fw flowid 1:20
	tc filter add dev $DEV parent 1:0 prio 0 protocol ip handle 30 fw flowid 1:30
	tc filter add dev $DEV parent 1:0 prio 0 protocol ip handle 40 fw flowid 1:40
	tc filter add dev $DEV parent 1:0 prio 0 protocol ip handle 50 fw flowid 1:50
	tc filter add dev $DEV parent 1:0 prio 0 protocol ip handle 60 fw flowid 1:60

	# Now you can use one of two methods with iptables to select the traffic priority:
        # iptables -t mangle -A POSTROUTING -o $DEV -p tcp --dport 80 -j CLASSIFY --set-class 1:50
	# iptables -t mangle -A POSTROUTING -o $DEV -p tcp --dport 80 -j MARK --set-mark 50
    done

    stat_done 
    add_daemon shaper
    ;;
  stop)
    stat_busy "Stopping traffic shaper"
    tc_reset
    stat_done 
    rm_daemon shaper
    ;;
  status)
    tc_status $2
    ;;
  filter)
    tc_showfilter $2
    ;;
  restart)
    $0 stop
    $0 start ;;
  *)
    echo "usage: $0 {start|stop|restart|status [intf]|filter [intf]}"
esac

exit 0

