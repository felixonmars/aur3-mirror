#!/bin/bash
. /usr/lib/network/network

fail()
{
    report_fail "$*"
    exit 1
}

int_setup() {
    int=$1
    addr=$2
    route=$3

    report_debug iproute_up ifup $int
    ip link set up dev "$int" up || \
        fail "Could not bring interface $int up"

    while read str; do
        [[ -n "$str" ]] || continue
        report_debug iproute_up ip addr add dev "$int" $str
        ip addr add dev "$int" $str || \
            fail "Adding address \"$str\" to $int failed"
    done <<<"$addr"

    while read str; do
        [[ -n "$str" ]] || continue
        report_debug iproute_up ip route add dev "$int" $str
        ip route add dev "$int" $str || \
            fail "Adding route \"$str\" to $int failed"
    done <<<"$route"
}

vlan_create() {
    int=$1
    vlan=$2
    ip link add link "$int" name "vlan$vlan" type vlan id "$vlan"
}

vlan_drop() {
    vlan=$1
    ip link delete "vlan$vlan"
}

iproute_up() {
    load_profile "$1"

    [[ -e /sys/class/net/"$INTERFACE" ]] || \
        fail "Interface $INTERFACE does not exist"

    if [[ -n "$GATEWAY" ]]; then
        ROUTE="$ROUTE"$'\n'"default via $GATEWAY"
    fi
    int_setup "$INTERFACE" "$ADDR" "$ROUTE"

    # setup vlans
    [[ -n "$VLANS" ]] && for vlan in $VLANS; do
        report_debug iproute_up add vlan "$INTERFACE" "$vlan"
        vlan_create "$INTERFACE" "$vlan"
        addr="ADDR_vlan$vlan"
        route="ROUTE_vlan$vlan"
        int_setup "vlan$vlan" "${!addr}" "${!route}"
    done

    # set the hostname
    if [[ -n "$HOSTNAME" ]]; then
        report_debug iproute_up hostname "$HOSTNAME"
        hostname "$HOSTNAME" || \
            fail "Cannot set hostname to $HOSTNAME"
    fi

    # Generate a new resolv.conf
    if [[ -n "$DNS" ]]; then
        : >/etc/resolv.conf 
        [[ -n "$DOMAIN" ]] && echo "domain $DOMAIN" >>/etc/resolv.conf
        [[ -n "$SEARCH" ]] && echo "search $SEARCH" >>/etc/resolv.conf

        for str in $DNS; do
            echo "nameserver $str" >>/etc/resolv.conf
        done
    fi
    return 0
}

iproute_down() {
    load_profile "$1"

    # drop vlans
    [[ -n "$VLANS" ]] && for vlan in $VLANS; do
        report_debug iproute_up drop vlan "$vlan"
        vlan_drop "$vlan"
    done

    report_debug ethernet_down if_down
    ip addr flush dev "$INTERFACE"
    quirk "nodown" || ip link set down dev "$INTERFACE"
}

iproute_status() {
    [[ -e /var/run/network/profiles/"$1" ]] && return 0
    return 1
}

iproute_$1 "$2"
exit $?

# vim: ts=4:et:sw=4:
