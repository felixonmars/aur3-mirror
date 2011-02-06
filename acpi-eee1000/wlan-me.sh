#! /bin/sh

source /etc/acpi/eee.conf

if [[ -f /var/run/network_is_up ]]; then
    is_up=`cat /var/run/network_is_up`
else
    is_up=1
    echo 1 > /var/run/network_is_up
fi


stop_wicd() {
    /etc/rc.d/wicd stop
    pkill -9 wpa_supplicant
    pkill -9 dhcpcd
    pkill -9 wicd-client
    ifconfig $WIRELESS_DEVICE down
    if [[ "$WIRELESS_MODULE" == "rt2860" ]]; then
        rmmod rt2860sta
    else
        modprobe -r rt2860sta
    fi
}

start_wicd() {
    echo "Loading wlan modules..."
    logger "Loading wlan modules..."
    modprobe $WIRELESS_MODULE
    echo "Creating wlan interface"
    logger "Creating wlan interface"
    ifconfig $WIRELESS_DEVICE up
    /etc/rc.d/wicd start
    su $XUSER --login -c 'wicd-client' &
}

if [[ "x$1" == "x" ]]; then
    if [[ "$is_up" == "1" ]]; then
        # If wifi is on, turn it off
        argument="poweroff"
    else
        # Else turn it on
        argument="poweron"
    fi
else
    argument=$1
fi

logger "Toggling wireless (actual state: $is_up, going to $argument)"
echo "Toggling wireless (actual state: $is_up, going to $argument)"

case $argument in
    on|poweron)
            command_num=${#NETWORK_UP_COMMAND[@]}
            for ((i=0;i<${command_num};i++)); do
                c=${NETWORK_UP_COMMAND[${i}]}
                logger "wifi poweron command #$i: $c"
                echo "wifi poweron command #$i: $c"
                ${cs}
            done
            echo 1 > /var/run/network_is_up
        ;;

    off|poweroff)
            command_num=${#NETWORK_DOWN_COMMAND[@]}
            for ((i=0;i<${command_num};i++)); do
                c=${NETWORK_DOWN_COMMAND[${i}]}
                logger "wifi poweroff command #$i: $c"
                echo "wifi poweroff command #$i: $c"
                ${c} 
            done
            echo 0 > /var/run/network_is_up
        ;;
esac
