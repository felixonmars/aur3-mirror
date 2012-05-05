#!/bin/bash

# DO NOT MODIFY THIS FILE. MODIFY SETTINGS VIA THE CONFIGURATION FILE /etc/hostsblock.conf
tmpdir=/dev/shm
hostsfile=/etc/hosts.block
redirecturl="127.0.0.1"
dnsmasq=1
dnsmasqconf=/etc/dnsmasq.conf
pixelserv=1
blacklists=( 'http://support.it-mate.co.uk/downloads/hphosts.zip' )
whitelist=( '  ' )

[ -f /etc/hostsblock.conf ] && . /etc/hostsblock.conf

mkdir -p $tmpdir/hostsblock/hosts.block.d
cp $hostsfile $tmpdir/hostsblock/hosts.block.d/hosts.block.0
echo "ADDING OVERTLY SPECIFIED BLOCKED SUBDOMAINS..."
for sub in ${blacklist[*]}; do
	echo "$redirecturl $sub" >> $tmpdir/hostsblock/hosts.block.d/hosts.block.0
done
n=1

echo "DOWNLOADING AND EXTRACTING BLOCKLISTS..."
for url in ${blocklists[*]}; do
	echo "$n: $url..."
	if echo "$url " | grep -- ".zip " &>/dev/null; then
		mkdir $tmpdir/hostsblock/tmp
		curl -s -o $tmpdir/hostsblock/tmp/hosts.block.zip "$url"
		cd $tmpdir/hostsblock/tmp
		echo "     Extracting..."
		unzip -jq hosts.block.zip
		grep -Ih -- "^[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}" ./* > $tmpdir/hostsblock/hosts.block.d/hosts.block.$n
		cd $tmpdir/hostsblock
		rm -r $tmpdir/hostsblock/tmp
	else
		curl -s -o $tmpdir/hostsblock/hosts.block.d/hosts.block.$n "$url"
	fi
	let "n+=1"
done

echo "PROCESSING FILES..."
grep -Ih -- "^[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}" $tmpdir/hostsblock/hosts.block.d/* |\
sed -e 's/[[:space:]][[:space:]]*/ /g' -e "s/\r//g" -e "s/\#.*//g" -e "s/ $//g" -e "s|0.0.0.0|$redirecturl|g" -e "s|127.0.0.1|$redirecturl|g"|\
sort -u > $hostsfile

echo "APPLYING WHITELIST..."
for pattern in ${whitelist[*]}; do
	pattern=`echo $pattern | sed 's/\./\\./g'`
	sed -i "/$pattern/d" $hostsfile
done

totalhosts=`grep -c -- "^[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}" $hostsfile`
echo "$totalhosts urls modified or blocked"

if [ $dnsmasq == 1 ]; then
	echo "(RE)STARTING DNSMASQ"
	grep -- "addn-hosts=$hostsfile" $dnsmasqconf &>/dev/null || echo "addn-hosts=$hostsfile" >> $dnsmasqconf
	pidof dnsmasq &>/dev/null && begin=restart || begin=start
	/etc/rc.d/dnsmasq $begin
fi

if [ $pixelserv == 1 ]; then
	echo "(RE)STARTING PIXELSERV"
	ps aux | grep -v grep | grep pixelserv.pl &>/dev/null || /etc/rc.d/pixelserv restart
fi
