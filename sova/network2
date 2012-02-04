#!/bin/bash
#
# SOVA networking2 settings.
#
# WARNING! Remember to put '$true' in any function you intend to leave empty
#          (e.g. you don't need to use  the 'custom_variables' function)
#          to make sure the script doesn't break.

binaries_paths()
{
### get full paths
# the 'exit 0' binary
true="`which true`"

ip="`which ip`"
vcfg="`which vcfg`"
sv6="`which stripipv6`"
}

custom_variables()
{
# define whatever you need here

    $true
}

start_networking()
{
    ### loopback
    #$ip addr add 127.0.0.1/8 dev lo broadcast + scope host
    #$ip link set lo up
    
    ### physical interfaces
    # eth0
    $ip addr add 192.168.10.10/24 dev eth0 broadcast +
    $ip link set eth0 up
    $sv6 eth0
    
    ### 802.11q VLAN interfaces (see `vcfg -h' for help)
    ## prepare vlan environment
    $vcfg initialise
    
    # vlan123 hosted by eth1
    $vcfg add eth1 123 10.1.1.10/24
    $vcfg add-addr 123 172.16.1.20/16
    
    #vlan 15 hosted by eth1
    $vcfg add eth1 15 10.9.9.9/24
    $sv6 vlan15
    
    ### default and static route(s)
    $ip route add default via 192.168.10.1
}

stop_networking()
{
    ### loopback
    #$ip link set lo down
    #$ip addr flush dev lo
    
    ### physical interfaces
    # eth0
    $ip link set eth0 down
    $ip addr flush dev eth0
    
    ### 802.11q VLAN interfaces (see `vcfg -h' for help)
	    
    # remove VLANS
    $vcfg rem-all
    
    ### default and static route(s)
    $ip route del default
}

# EOF

