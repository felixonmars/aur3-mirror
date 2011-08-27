#!/bin/bash

. /etc/conf.d/teamspeak3-server

cd /var/lib/teamspeak3-server/
LD_LIBRARY_PATH="${LIB_PATH}:${LD_LIBRARY_PATH}" /opt/teamspeak3-server/ts3server_linux_x86 $@
exit $?
