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

# MAIN ROUTINE
case $@ in
    *"http"*)
        for LINE in `curl -s "$@" | grep -- "http" | sed -e "s/.*http:\/\///g" -e "s/[\/?'\" <>\(\)].*//g" | sort -u`; do
            line=`echo "$LINE" | sed "s/$redirecturl//g"`
            if grep " $LINE$" "$hostsfile" &>/dev/null; then
                printf "BLOCKED: '$line'. Unblock? [y/N]"
                read a
                if [[ $a == "y" || $a == "Y" ]]; then
                    echo "Adding $line to whitelist"
                    echo " $line" >> "$whitelist"
                    sed -i "/$line/d" "$blacklist"
                    sed -i "/ $line/d" "$hostsfile"
                fi
            else
                printf "NOT YET BLOCKED: '$line'. Block? [y/N]"
                read a
                if [[ $a == "y" || $a == "Y" ]]; then
                    echo "Adding $line to blacklist"
                    echo "$line" >> "$blacklist"
                    sed -i "/$line/d" "$whitelist"
                    echo "$redirecturl $line" >> "$hostsfile"
                fi
            fi
        done
        echo "Url check finished. Run postprocessing subroutine (e.g. dnsmasq)? [y/N]"
        read a
        [[ $a == "y" || $a == "Y" ]] && postprocess
    ;;
    *)
        echo "usage: $0 http://[url]"
        echo "$0 will scan given [url] for existing subdomains and will" 
        echo "prompt as to whether to block or unblock select urls."
    ;;
esac