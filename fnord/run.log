#!/bin/sh

if [ ! -d /var/log/fnord ]
then
	mkdir /var/log/fnord
	chown fnordlog:fnord /var/log/fnord
        chmod 700 /var/log/$svname
fi

exec chpst -u fnordlog /sbin/svlogd -t /var/log/fnord
