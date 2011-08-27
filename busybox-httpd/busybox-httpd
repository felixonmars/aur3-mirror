#!/bin/sh

bind='80';
root='/srv/http';
conf='/etc/busybox/httpd.conf';
user='http:http';
realm='Protected Area';
log='/var/log/busybox-httpd.log';
pidfile='/var/run/busybox-httpd.pid';
. /etc/busybox/httpd-rc.conf

if [ ! -z "$1" ]; then
	pidfile="$1";
fi;

echo -e "\n[!] HTTPd restarted: $(date -R)" >> "$log";

/bin/busybox httpd \
	-f -vv \
	-p "$bind" \
	-h "$root" \
	-c "$conf" \
	-u "$user" \
	-r "$realm" \
	>> "$log" 2>&1 &

echo "$!" > "$pidfile";
