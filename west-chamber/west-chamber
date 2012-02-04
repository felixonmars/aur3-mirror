#!/bin/bash

daemon_name="west-chamber"

[ -f /etc/conf.d/${daemon_name} ] && . /etc/conf.d/${daemon_name}

. /etc/rc.conf
. /etc/rc.d/functions

ipset_cmd=`type -p ipset`
iptables_cmd=`type -p iptables`

start() {
    stat_busy "Starting West Chamber"
    if ck_daemon ${daemon_name}; then
        fail=0
        if [ -d /etc/west-chamber ] ; then
            cd /etc/west-chamber
        elif [ -d /usr/share/west-chamber/examples/ ] ; then
            cd /usr/share/west-chamber/examples/
        else 
            stat_fail
        fi

        for set in $ipsets; do
            cat ${set} | $ipset_cmd -R
            [ $? -gt 0 ] && fail=1
        done
        cat NOCLIP | $ipset_cmd -R
        [ $? -gt 0 ] && fail=1

        $iptables_cmd -A INPUT -p tcp --sport 80 --tcp-flags FIN,SYN,RST,ACK SYN,ACK -m state --state ESTABLISHED -m set --match-set NOCLIP src -j ZHANG
        [ $? -gt 0 ] && fail=1
        $iptables_cmd -A INPUT -p tcp --dport 80 --tcp-flags FIN,SYN,RST,ACK SYN -m state --state NEW -m set --match-set CHINA src -j CUI
        [ $? -gt 0 ] && fail=1
        $iptables_cmd -A INPUT -p tcp --sport 80 -m state --state ESTABLISHED -m gfw -j LOG --log-level info --log-prefix "gfw: "
        [ $? -gt 0 ] && fail=1
        $iptables_cmd -A INPUT -p udp --sport 53 -m state --state ESTABLISHED -m gfw -j DROP
        [ $? -gt 0 ] && fail=1

        if [ $fail -gt 0 ]; then
            stat_fail
        else
            add_daemon ${daemon_name}
            stat_done
        fi
    else
        stat_fail
    fi
}

stop() {
    stat_busy "Stoping West Chamber"
    if ! ck_daemon ${daemon_name}; then
        fail=0
        rules=`$iptables_cmd -L INPUT | sed '1,2d' | grep -n gfw | awk -F: '{print $1}' | sort -nr`
        for h in $rules; do
            $iptables_cmd -D INPUT $h
            [ $? -gt 0 ] && fail=1
        done

        rules=`$iptables_cmd -L INPUT | sed '1,2d' | grep -n ZHANG | awk -F: '{print $1}' | sort -nr`
        for h in $rules; do
            $iptables_cmd -D INPUT $h
            [ $? -gt 0 ] && fail=1
        done

        rules=`$iptables_cmd -L INPUT | sed '1,2d' | grep -n CHINA | awk -F: '{print $1}' | sort -nr`
        for h in $rules; do
            $iptables_cmd -D INPUT $h
            [ $? -gt 0 ] && fail=1
        done

        $ipset_cmd -X NOCLIP
        for set in $ipsets; do
            $ipset_cmd -X $set
            [ $? -gt 0 ] && fail=1
        done

        if [ $fail -gt 0 ]; then
            stat_fail
        else
            rm_daemon ${daemon_name}
            stat_done
        fi
    else
        stat_fail
    fi
}


case "$1" in
    start)
    start
    ;;

    stop)
    stop
    ;;

    restart)
    $0 stop
    sleep 2
    $0 start
    ;;

    *)
    echo "usage: $0 {start|stop|restart|save}"
esac
exit 0

