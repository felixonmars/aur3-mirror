#!/bin/bash
# DO NOT MODIFY THIS FILE. MODIFY SETTINGS VIA THE CONFIGURATION FILE /etc/hostsblock.conf
hostsfile=/etc/hosts.block
redirecturl="127.0.0.1"
blacklist=/etc/hostsblock/black.list
whitelist=/etc/hostsblock/white.list

if [ -f /etc/hostsblock/rc.conf ]; then
        . /etc/hostsblock/rc.conf
else
        echo "Config file /etc/hostsblock/rc.conf not found. An example config file can be found at /usr/share/hostsblock/rc.conf."
fi

case $@ in
	*"http"*)
		for LINE in `curl -s "$@" | grep -- "http" | sed -e "s/.*http:\/\///g" -e "s/[\/?'\" <>\(\)].*//g" | sort -u`; do
			line=`echo "$LINE" | sed "s/$redirecturl//g"`
			if grep " $LINE$" "$hostsfile" &>/dev/null; then
				echo -e "BLOCKED: '$line'. Unblock? [y/N]"
				read a
				if [[ $a == "y" || $a == "Y" ]]; then
					echo "Adding $line to whitelist"
					echo " $line" >> "$whitelist"
					sed -i "/$line/d" "$blacklist"
				fi
			else
				echo -e "NOT YET BLOCKED: '$line'. Block? [y/N]"
				read a
				if [[ $a == "y" || $a == "Y" ]]; then
					echo "Adding $line to blacklist"
					echo "$line" >> "$blacklist"
					sed -i "/$line/d" "$whitelist"
				fi
			fi
		done
		echo "Url check finished. Run hostsblock now to apply changes? [y/N]"
		read a
		[[ $a == "y" || $a == "Y" ]] && hostsblock
	;;
	*)
		echo "usage: $0 [url]"
		echo "$0 will scan given [url] for existing subdomains and will prompt as to whether to block or unblock select urls."
	;;
esac
