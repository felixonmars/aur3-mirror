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
	printf "\e[1;31mBLOCKED: \e[0;37m'$line'. \e[0;32mUnblock? \e[0;37m[y/N]"
        read a
        if [[ $a == "y" || $a == "Y" ]]; then
            echo "Unblocking $line"
            echo " $line" >> "$whitelist"
            sed -i "/$line/d" "$blacklist"
            sed -i "/ $line/d" "$hostsfile"
            changed=1
        fi
    else
        printf "\e[0;32mNOT BLOCKED: \e[0;37m'$line'. \e[1;31mBlock? \e[0;37m[y/N]"
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
if [[ "$@" == "-h" || "$@" == "--help" ]]; then
    echo -e "\nusage: $0 http[s]://[url] \n"
    echo "$0 will first verify that [url] is blocked or unblocked,"
    echo "and then scan that url for further contained subdomains."
else
    changed=0
    echo "Verifying that give page is blocked or unblocked"
    check `echo "$@" | sed -e "s/.*https*:\/\///g" -e "s/[\/?'\" <>\(\)].*//g"`
    [ $changed == 0 ] && postprocess &>/dev/null
    printf "Page domain verified. Scan the whole page for other domains for (un)blocking? [y/N]"
    read a
    if [[ $a == "y" || $a == "Y" ]]; then
        for LINE in `curl -s "$@" | grep -- "http" | sed -e "s/.*https*:\/\///g" -e "s/[\/?'\" <>\(\)].*//g" | sort -u`; do
            check "$LINE"
        done
        echo "Whole-page scan completed."
    fi
    [ $changed == 0 ] && postprocess &>/dev/null
fi
