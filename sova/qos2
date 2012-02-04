#!/bin/bash
#
# SOVA QoS settings.
#
# WARNING! Remember to put '$true' in any function you intend to leave empty
#          (e.g. you don't need to use  the 'custom_variables' function)
#          to make sure the script doesn't break.

binaries_paths()
{
### get full paths
# the 'exit 0' binary
true="`which true`"

tc="`which tc`"
ip="`which ip`"
sv6="`which stripipv6`"
iptables="`which iptables`"
modprobe="`which modprobe`"
}

custom_variables()
{
# define whatever you need here

### interfaces to redirect traffic from
if_to_redir=(vlan334 vlan364 eth1 eth2)

### HTB specific settings
quantum="1514"

### router total uplink and downlink (e.g. 100mbit for FastEthernet)
global_outgoing="100mbit"
global_incoming="100mbit"
}

start_qos()
{
    ###
    ### init part
    ###
    
    ### load the ifb module...
    $modprobe ifb
    
    sleep 1
    
    for ctr1 in ifb0 ifb1
    do
	# ...bring the interfaces up...
        $ip link set $ctr1 up
	$sv6 $ctr1
	
	sleep 1
    
	# ...and set up root queues on them
	$tc qdisc add dev $ctr1 root handle 1:0 htb
    done
    
    # also, set total badwidth available for the interfaces
    $tc class add dev ifb0 parent 1:0 classid 1:1 htb \
	rate $global_incoming quantum $quantum

    $tc class add dev ifb1 parent 1:0 classid 1:1 htb \
        rate $global_outgoing quantum $quantum

    sleep 1
    
    ### redirect all incoming and outgoing traffic to ifb0 and ifb1
    for ctr1 in ${if_to_redir[*]}
    do
        # the incoming (ifb0)
	$tc qdisc add dev $ctr1 ingress handle ffff:
	
	$tc filter add dev $ctr1 parent ffff: protocol ip u32 \
	    match u32 0 0 action mirred egress redirect dev ifb0 \
	    2> /dev/null > /dev/null
	
	# the outgoing (ifb1)
	$tc qdisc add dev $ctr1 root handle 1:0 htb
		
	$tc filter add dev $ctr1 parent 1:0 protocol ip u32 \
	    match u32 0 0 action mirred egress redirect dev ifb1 \
	    2> /dev/null > /dev/null
    done

    sleep 1
    
    ###
    ### specific queues
    ###    
}

stop_qos()
{
    for ctr2 in ifb0 ifb1 ${if_to_redir[*]}
    do
	$tc qdisc del root dev $ctr2
    done
    
    for ctr3 in ${if_to_redir[*]}
    do
	$tc qdisc del dev $ctr3 ingress
    done
}

# EOF

