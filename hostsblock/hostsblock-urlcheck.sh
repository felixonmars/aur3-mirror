#!/bin/bash
# DO NOT MODIFY THIS FILE. MODIFY SETTINGS VIA THE CONFIGURATION FILES IN
# /etc/hostsblock.conf

# DEFAULT SETTINGS
hostsfile="/etc/hosts.block"
redirecturl="127.0.0.1"
postprocess(){
    /etc/rc.d/dnsmasq restart
}
USECOLOR="yes"
blacklist="/etc/hostsblock/black.list"
whitelist="/etc/hostsblock/white.list"
hostshead="0"

# SOURCE MAIN CONFIGURATION FILE
if [ -f /etc/hostsblock/rc.conf ]; then
    . /etc/hostsblock/rc.conf
else
    echo "Config file /etc/hostsblock/rc.conf not found. Using defaults."
fi

# CHECK SUBROUTINE
check(){
    line=`echo "$@" | sed "s/$redirecturl//g"`
    if grep " $@$" "$hostsfile" &>/dev/null; then
	echo "BLOCKED: '$line'. Unblock? [y/N]"
        read a
        if [[ $a == "y" || $a == "Y" ]]; then
            echo "Unblocking $line"
            echo " $line" >> "$whitelist"
            sed -i "/$line/d" "$blacklist"
            sed -i "/ $line/d" "$hostsfile"
            changed=1
        fi
    else
        echo "NOT YET BLOCKED: '$line'. Block? [y/N]"
        read a
        if [[ $a == "y" || $a == "Y" ]]; then
            echo "Blocking $line"
            echo "$line" >> "$blacklist"
            sed -i "/$line/d" "$whitelist"
            echo "$redirecturl $line" >> "$hostsfile"
            changed=1
        fi
    fi
}

# MAIN ROUTINE
changed=0
if [[ "$@" == "-h" || "$@" == "--help" ]]; then
    echo -e "usage: $0 http[s]://[url] \n\n"
    echo "$0 will first verify that [url] is blocked or unblocked,"
    echo "and then scan that url for further contained subdomains."
else
    check `echo "$@" | sed -e "s/.*https*:\/\///g" -e "s/[\/?'\" <>\(\)].*//g"`
    echo "Page domain verified. Scan the whole page for other domains? [y/N]"
    read a
    if [[ $a == "y" || $a == "Y" ]]; then
        for LINE in `curl -s "$@" | grep -- "http" | sed -e "s/.*https*:\/\///g" -e "s/[\/?'\" <>\(\)].*//g" | sort -u`; do
            check "$LINE"
        done
        echo "Whole-page scan completed."
    fi
    [ $changed == 0 ] && postprocess
fi
