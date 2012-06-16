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
        fi
    else
        echo "NOT YET BLOCKED: '$line'. Block? [y/N]"
        read a
        if [[ $a == "y" || $a == "Y" ]]; then
            echo "Blocking $line"
            echo "$line" >> "$blacklist"
            sed -i "/$line/d" "$whitelist"
            echo "$redirecturl $line" >> "$hostsfile"
        fi
    fi
}

# MAIN ROUTINE
case $1 in
    scan)
        for LINE in `curl -s "$@" | grep -- "http" | sed -e "s/.*http:\/\///g" -e "s/[\/?'\" <>\(\)].*//g" | sort -u`; do
            check "$LINE"
        done
        echo "Url scan finished. Run postprocessing subroutine (e.g. dnsmasq)? [y/N]"
        read a
        [[ $a == "y" || $a == "Y" ]] && postprocess
    ;;
    page)
        check `echo "$@" | sed -e "s/.*http:\/\///g" -e "s/[\/?'\" <>\(\)].*//g"`
        echo "Page check finished. Run postprocessing subroutine (e.g. dnsmasq)? [y/N]"
        read a
        [[ $a == "y" || $a == "Y" ]] && postprocess
    ;;
    *)
        echo -e "usage: $0 [scan|page] http://[url] \n"
	echo "'$0 page' will determine whether the given page is"
        echo "blocked or unblocked and prompt as to whether it should"
	echo -e "be blocked or unblocked. \n"
        echo "'$0 scan' will scan the whole page at [url] for subdomains"
        echo "referenced by the page and prompt as to whether these"
	echo "subdomains should be blocked or unblocked ."
    ;;
esac
