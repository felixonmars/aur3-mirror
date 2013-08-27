#!/bin/bash

####################
# Variables
####################
## How many seconds to wait for the ppp to come up each try
TIMEOUT=120
## How many seconds to wait for l2tpd to restart
L2TPD_TIMEOUT=10
## LAC name in config file
L2TPD_LAC=zjuvpn


L2TPD_CONTROL_FILE=/var/run/xl2tpd/l2tp-control
L2TPD_INIT_STYLE="systemV"
if [ -e /etc/init.d/xl2tpd ]; then
    L2TPD_INIT_FILE=/etc/init.d/xl2tpd
elif [ -e /etc/rc.d/xl2tpd ]; then
    L2TPD_INIT_FILE=/etc/rc.d/xl2tpd
else
    L2TPD_INIT_STYLE="systemd"
    L2TPD_SERVICE="xl2tpd.service"
fi
L2TPD_CFG_TMPL=/usr/share/zjuvpn/xl2tpd.conf-example
L2TPD_CFG_FILE=/etc/xl2tpd/xl2tpd.conf
CHAP_SECRET_FILE=/etc/ppp/chap-secrets
VPN_SERVER="10.5.1.9"

####################
# Commands
####################
function usage
{
    echo "$0: A utility for ZJU school L2TP VPN."
    echo "Usage: $0 [ACTION]"
    echo
    echo "Actions: "
    echo "      Default             Connect."
    echo "      -d                  Disconnect."
    echo "      -r                  Reconnect."
    echo "      -c                  Configure."
    echo "      -h                  Show this information."
    echo
}

function connect
{
    if ppp_alive ; then
        echo "[MSG] VPN already connected."
    else
        bring_up_ppp && setup_route
    fi
}

function disconnect
{
    echo -n "[MSG] Disconnecting VPN ... "
    echo "d $L2TPD_LAC" > $L2TPD_CONTROL_FILE
    sleep 1
    echo "Done!"
    return 0
}

function reconnect
{
    disconnect && restart_l2tpd && bring_up_ppp && setup_route
}

function configure
{
    echo "Configure L2TP VPN for ZJU.";
    check_config_template && read_param && write_settings && free_param && reconnect
}

####################
# Internal utility functions
####################
function super_user
{
    if [ "$UID" = "0" ]; then
        return 0         # Yes, super user
    else
        return 1
    fi
}

function check_config_template
{
    if [ ! -e $L2TPD_CFG_TMPL ]; then
        echo "[ERR] Cannot find configure template!"
        return 1
    fi
    return 0
}

function read_param
{
    read -p "Username: " username
    read -s -p "Password: " password
    echo
}

function write_settings
{
    if [ -e $L2TPD_CFG_FILE ]; then
        mv $L2TPD_CFG_FILE $L2TPD_CFG_FILE.old
    fi

    cp $L2TPD_CFG_TMPL $L2TPD_CFG_FILE 
    echo "name = $username" >> $L2TPD_CFG_FILE 

    if [ -e $CHAP_SECRET_FILE ]; then
        mv $CHAP_SECRET_FILE $CHAP_SECRET_FILE.old
    fi

    echo "$username  *  $password  *" >> $CHAP_SECRET_FILE
    chmod 600 $CHAP_SECRET_FILE

    return 0
}

function free_param
{
    unset username
    unset password
    return 0
}

function ppp_alive
{
    if ip addr show | grep 'inet.*ppp' > /dev/null; then
        return 0         # Yes, connected
    else
        return 1
    fi
}

function bring_up_ppp
{
    if [ ! -e $L2TPD_CONTROL_FILE ]; then
        echo "[MSG] L2tpd daemon not running!"
        if ! restart_l2tpd ; then
            return 1        # l2tpd not started
        fi
    fi
    echo "c $L2TPD_LAC" > $L2TPD_CONTROL_FILE
    for i in $(seq 0 $TIMEOUT)
    do
        if ppp_alive; then
            echo " Done!"
            return 0     # Yes, brought up!
        fi
        echo -n -e "\\r[MSG] Trying to bring up vpn... $i secs..."
        sleep 1
    done
    echo
    echo "[ERR] Failed to bring up vpn!"
    return 1
}

function setup_route
{
    GW=$(ip route get $VPN_SERVER 2>/dev/null | grep via | awk '{print $3}')
    PPP=$(ip addr show | grep ppp[0-9]: | cut "-d " -f2 | cut -d: -f1)
    echo "[MSG] Detected gateway: $GW, PPP device: $PPP ."
    echo -n "[MSG] Setting up route table...  "

    ip route add 10.0.0.0/8 via $GW 2>/dev/null
    ip route add 210.32.0.0/20 via $GW 2>/dev/null
    ip route add 210.32.128.0/18 via $GW 2>/dev/null
    ip route add 222.205.0.0/16 via $GW 2>/dev/null
    ip route add 58.206.192.0/19 via $GW 2>/dev/null

    ip route add 0.0.0.0/1 dev $PPP 2>/dev/null
    ip route add 128.0.0.0/1 dev $PPP 2>/dev/null
    echo "Done!"
}

function restart_l2tpd
{
    echo "[MSG] Restarting l2tpd... "
    if [ "$L2TPD_INIT_STYLE" = "systemV" ]; then
	$L2TPD_INIT_FILE restart
    elif [ "$L2TPD_INIT_STYLE" = "systemd" ]; then
	systemctl restart $L2TPD_SERVICE
    fi
    for i in $(seq $L2TPD_TIMEOUT)
    do
        if [ -e $L2TPD_CONTROL_FILE ]; then
            echo "[MSG] Done!"
            return 0         # Successfully restarted!
        fi
        sleep 1
    done
    echo "[ERR] Failed to restart l2tpd!"
    return 1         # Failed to restart l2tpd
}

####################
# Main
####################
if ! super_user ; then
    echo "[ERR] You must be super user to run this utility!"
    exit 1
fi

if [ $# -lt 1 ]; then
    connect
elif [ "$1" = "-d" ]; then
    disconnect
elif [ "$1" = "-r" ]; then
    reconnect
elif [ "$1" = "-c" ]; then
    configure
elif [ "$1" = "-h" ]; then
    usage
else
    echo "[ERR] Unknown parameter.";
fi

