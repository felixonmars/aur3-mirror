#!/bin/bash
#
# SOVA iptables2 settings.
#
# WARNING! Remember to put '$true' in any function you intend to leave empty
#          (e.g. you don't need to use  the 'custom_variables' function)
#          to make sure the script doesn't break.

binaries_paths()
{
### get full paths
# the 'exit 0' binary
true="`which true`"

iptables="`which iptables`"
ip6tables="`which ip6tables`"
}

custom_variables()
{
# define whatever you need here

ext_int=(eth0)
}

start_iptables()
{
    ### init part
    # clear tables
    $iptables --flush
    $iptables -t nat --flush
    $iptables -t mangle --flush
    	    
    #$ip6tables --flush
    #$ip6tables -t mangle --flush
    
    $iptables --delete-chain
    $iptables -t mangle --delete-chain
    
    ## install default policies
    # for IPv4
    $iptables --policy INPUT ACCEPT
    $iptables --policy OUTPUT ACCEPT
    $iptables --policy FORWARD DROP

    $iptables -t nat --policy PREROUTING ACCEPT
    $iptables -t nat --policy POSTROUTING ACCEPT

    # for IPv6
    #$ip6tables --policy INPUT DROP
    #$ip6tables --policy OUTPUT DROP
    #$ip6tables --policy FORWARD DROP

    ### firewall part
    # allow traffic to/from the loopback interface (IPv4 and IPv6)
    $iptables -A INPUT  -i lo -j ACCEPT
    $iptables -A OUTPUT -o lo -j ACCEPT
	
    #$ip6tables -A INPUT  -i lo -j ACCEPT
    #$ip6tables -A OUTPUT -o lo -j ACCEPT

    # drop invalid packets immediately
    $iptables -A INPUT -m state --state INVALID -j DROP
    $iptables -A FORWARD -m state --state INVALID -j DROP
    $iptables -A OUTPUT -m state --state INVALID -j DROP

    # ping-flood defense (this machine)
    $iptables -A INPUT -p icmp -m icmp --icmp-type address-mask-request -j DROP
    $iptables -A INPUT -p icmp -m icmp --icmp-type timestamp-request -j DROP
    $iptables -A INPUT -p icmp -m icmp -m limit --limit 1/second -j ACCEPT
    $iptables -A INPUT -p icmp -j DROP

    # reject packets from RFC1918 class networks (i.e., spoofed)
    for ctr1 in $ext_int
    do
	$iptables -A INPUT -i $ctr1 -s 10.0.0.0/8 -j DROP
	$iptables -A INPUT -i $ctr1 -s 169.254.0.0/16 -j DROP
	$iptables -A INPUT -i $ctr1 -s 172.16.0.0/12 -j DROP
	$iptables -A INPUT -i $ctr1 -s 127.0.0.0/8 -j DROP
	$iptables -A INPUT -i $ctr1 -s 224.0.0.0/4 -j DROP
	$iptables -A INPUT -i $ctr1 -d 224.0.0.0/4 -j DROP
	$iptables -A INPUT -i $ctr1 -s 240.0.0.0/5 -j DROP
	$iptables -A INPUT -i $ctr1 -d 240.0.0.0/5 -j DROP
	$iptables -A INPUT -i $ctr1 -s 0.0.0.0/8 -j DROP
	$iptables -A INPUT -i $ctr1 -d 0.0.0.0/8 -j DROP
	$iptables -A INPUT -i $ctr1 -d 239.255.255.0/24 -j DROP
	$iptables -A INPUT -i $ctr1 -d 255.255.255.255 -j DROP
    done
						
    # drop bogus TCP packets
    $iptables -A INPUT -p tcp -m tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
    $iptables -A INPUT -p tcp -m tcp --tcp-flags SYN,RST SYN,RST -j DROP

    # smurf defense
    $iptables -A INPUT -p tcp -m tcp --tcp-flags RST RST -m limit \
	--limit 2/second --limit-burst 2 -j ACCEPT
    $iptables -A INPUT -p tcp -m tcp --tcp-flags RST RST -j DROP

    # SYN flood defense
    $iptables -A INPUT -m state --state NEW -p tcp -m tcp \
	--syn -m recent --name synflood --set
    $iptables -A INPUT -m state --state NEW -p tcp -m tcp \
	--syn -m recent --name synflood --update --seconds 1 \
	--hitcount 60 -j DROP
}

stop_iptables()
{
    ### flush everyting out
    $iptables --flush
    $iptables -t nat --flush
    $iptables -t mangle --flush
    
    #$ip6tables --flush
    #$ip6tables -t mangle --flush	
}

# EOF

