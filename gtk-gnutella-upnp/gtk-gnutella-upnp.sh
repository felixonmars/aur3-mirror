#!/bin/bash
gtk-gnutella-listen-port() {
	grep listen_port ~/.gtk-gnutella/config_gnet | grep -o [0-9]* | head -n 1;
}

gtk-gnutella-upnpc() {
	upnpc="$(which upnpc)";
	test "$(echo $@ | grep -o [0-9]* | head -n 1)" -gt 1 || upnpc=true;
	"$upnpc" $@ > ~/.gtk-gnutella/upnpc.log;
}

gtk-gnutella-upnp-daemon() {
	sleep 1;
	echo ======= gtk-gnutella-upnp-daemon started ========
	while pgrep -x gtk-gnutella -u "$UID" >/dev/null; do
		gnet_port="$(gtk-gnutella-listen-port)";
		gtk-gnutella-upnpc -r "$gnet_port" TCP "$gnet_port" UDP;
		sleep 60;
	done;
	echo Shutting down gtk-gnutella-upnp-daemon...
	gnet_port="$(gtk-gnutella-listen-port)";
	gtk-gnutella-upnpc -d "$gnet_port" TCP "$gnet_port" UDP;
	echo ======= gtk-gnutella-upnp-daemon  exited ========
}

gtk-gnutella-upnp-daemon &
gtk-gnutella $@; echo;
pkill -x sleep -P $!;
wait $!;
