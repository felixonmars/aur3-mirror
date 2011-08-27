#!/bin/bash
#
# VLAN management script v2.1
#
# by Bart Kos, bro at fast-stable-secure dot net
#
# http://www.fast-stable-secure.net
#

### devel
# uncomment the line below to see how the script works (e.g. for debugging)
#set -x

### pre-run checks
# check for root privileges
if [ "$UID" != "0" ]
then
    echo "Error: You must be root to run this script."
    exit
fi

### search for required binaries
# search for `ip' binary (iproute2 suite)
if [ `which ip | wc -l` = 1 ]
then
    ip="`which ip`"
else
    echo "Error: You require the 'ip' binary from the iproute2 suite to run this script."
    echo "Install the suite and/or update your PATH setting."
    exit
fi

# see if the `vconfig' binary is present (linux vlan software)
if [ `which vconfig | wc -l` = 1 ]
then
    vconfig="`which vconfig`"
else
    echo "Error: You require the 'vconfig' binary from the Linux VLAN package to run this script."
    echo "Install the missing software and/or update your PATH setting."
    exit
fi

### vars definition
var1="$1" # add/rem or add-addr/rem-addr
var2="$2" # <interface> or <vlan number>
var3="$3" # <vlan number> or <ip address>
var4="$4" # <ip address> or <scope>
var5="$5" # <scope>

### functions
# check if the running Linux kernel supports VLAN architecture
function check_for_vlans()
{
if [ ! -f /proc/net/vlan/config ] && [ ! -f /lib/modules/`uname -r`/kernel/net/8021q/8021q.ko ]
then
    echo "Error: no VLAN kernel capabilities detected."
    echo "You need a VLAN-enabled Linux kernel for this script to work."
    exit
else
    echo "Linux VLAN environment sane."
fi
}

# load the kernel module (if necessary) and set the VLAN naming scheme
function prepare_vlan_env()
{
if [ ! -f /proc/net/vlan/config ]
then
    modprobe -q 8021q
    $vconfig set_name_type VLAN_PLUS_VID_NO_PAD
else
    $vconfig set_name_type VLAN_PLUS_VID_NO_PAD
fi
}

# create a VLAN virtual interface on top of a (physical) host interface
function add_vlan_if()
{
if [ `grep -c "\<VLAN_NAME_TYPE_PLUS_VID_NO_PAD\>" /proc/net/vlan/config` = 0 ]
then
    echo "ERROR: Activate the script with 'vcfg initialise' first."
    exit
fi

if [ "$var5" != "link" ] && [ "$var5" != "global" ] && [ "$var5" != "host" ] && [ "$var5" != "site" ]
then
    echo "ERROR: No or wrong parameters specified."
    echo "See 'vcfg -h' for help on scipt usage."
    echo "See 'man ip' for more info on the <scope> parameter."
    exit
fi

if [ `grep -c "\<$var2\>" /proc/net/dev` = 1 ]
then
    if [ -f /proc/net/vlan/vlan$var3 ]
    then
	echo "ERROR: trying to add VLAN #$var3 to IF -:$var2:-  error: File exists"
	exit
    fi

    if [ "$var3" -gt 4094 ]
    then
	$vconfig add $var2 $var3
	exit
    fi

    if [ `$ip link show dev $var2 | grep -c "\<UP\>"` = 0 ]
    then
	$ip link set $var2 up
	$ip addr flush dev $var2 2> /dev/null > /dev/null
    fi

    $vconfig add $var2 $var3
    $ip link set vlan$var3 up
    $ip addr flush dev $var2 2> /dev/null > /dev/null
    $ip addr add $var4 dev vlan$var3 broadcast + scope $var5
else
    $vconfig add $var2 $var3
    exit
fi
}

# add an address to an existing VLAN interface
function add_vlan_addr()
{
if [ "$var4" != "link" ] && [ "$var4" != "global" ] && [ "$var4" != "host" ] && [ "$var4" != "site" ]
then
    echo "Error: No or wrong parameters specified."
    echo "See 'vcfg -h' for help on scipt usage."
    echo "See 'man ip' for more info on the <scope> parameter."
    exit
fi
	
$ip addr add $var3 dev vlan$var2 broadcast + scope $var4
}

# remove a VLAN interface
function rem_vlan_if()
{
if [ -f /proc/net/vlan/vlan$var2 ]
then
    var100="`grep "Device:" /proc/net/vlan/vlan$var2 | awk '{print $2}'`"
    
    $ip link set vlan$var2 down
    $ip addr flush dev vlan$var2 2> /dev/null > /dev/null
    $vconfig rem vlan$var2
    
    if [ `grep -c "\<$var100\>" /proc/net/vlan/config` = 0 ]
    then
	$ip link set $var100 down
    fi
else
    $vconfig rem vlan$var2
fi
}

# remove an address from a working VLAN interface
# OBSOLETE
#function rem_vlan_addr()
#{
#$ip addr del $var3 dev vlan$var2
#}

# remove all vlan interfaces and shutdown their host interfaces
function rem_all_vlans()
{
# host interfaces list
var100=(`grep "vlan" /proc/net/vlan/config | awk '{print $5}'`)
# vlan interfaces list
var101=(`ls /proc/net/vlan/ | grep "vlan"`)

for vlans in ${var101[*]}
do
    $ip link set $vlans down
    $ip addr flush dev $vlans 2> /dev/null > /dev/null
    $vconfig rem $vlans
done

for hostinterfaces in ${var100[*]}
do
    $ip link set $hostinterfaces down
    $ip addr flush dev $hostinterfaces 2> /dev/null > /dev/null
done
}

## tests
# OBSOLETE, I think ;)
# test the first input var (add, rem, add-addr, rem-addr)
#function test_s1()
#{
#if [ "$var1" != "add" ] && [ "$var1" != "rem" ] && [ "$var1" != "rem-all" ]
#then
#    echo "ERROR: unknown command."
#    echo "The available choices are:"
#    echo "'add'      to create a VLAN interface over a host interface."
#    # OBSOLETE
#    #echo "'add-addr' to add an IP address to an existing vlan address."
#    echo "'rem'      to remove a VLAN interface with its IP addresses."
#    # OBSOLETE
#    #echo "'rem-addr' to remove an IP address from an existing VLAN interface."
#    echo "'rem-all'  to remove all VLAN interfaces and shutdown their host IFs."
#    exit
#fi
#}

### the main part
# print the help text if no command is passed to the script
if [ "$1" = "" ] || [ "$1" = "-h" ] || [ "$1" = "help" ]
then
    echo ""
    echo "Available commands are:"
    echo ""
    echo "add <interface> <vlan number> <ip address> <scope>"
    echo "  Creates a VLAN interface over a desired physical interface."
    echo ""
    echo "add-addr <vlan number> <ip address> <scope>"
    echo "  Adds an IP address to an existing VLAN interface."
    echo ""
    echo "rem <vlan number>"
    echo "  Removes a VLAN interface with all IP addresses attached to it."
    echo ""
    # OBSOLETE
    #echo "rem-addr <vlan number> <ip address>"
    #echo "  Removes an IP address from an existing VLAN interface."
    #echo ""
    echo "rem-all"
    echo "  Removes all VLAN interfaces and brings down their host interfaces."
    echo ""
    echo "initialise"
    echo "  Prepares a working environment for the script to operate."
    echo ""
    echo "check"
    echo "  Checks if the current Linux environment accepts VLANs."
    echo ""

# add a VLAN interface
elif [ "$1" = "add" ]
then
    add_vlan_if

# remove a VLAN interface
elif [ "$1" = "rem" ]
then
    rem_vlan_if

# add an IP address to an existing VLAN interface
elif [ "$1" = "add-addr" ]
then
    add_vlan_addr

# remove an IP address from an existing VLAN interface
# OBSOLETE
#elif [ "$1" = "rem-addr" ]
#then
#    rem_vlan_addr

# initialise the Linux VLAN subsystem
elif [ "$1" = "initialise" ]
then
    prepare_vlan_env

# check VLAN environment sanity
elif [ "$1" = "check" ]
then
    check_for_vlans

# remove all VLANs and shutdown their host interfaces
elif [ "$1" = "rem-all" ]
then
    rem_all_vlans

# if there is no matching command, print an error message
else
    echo "Error: unknown command."
    echo "See 'vcfg -h' for the list of available commands."
fi

# EOF

