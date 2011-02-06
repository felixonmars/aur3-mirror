#!/bin/sh

case "$1" in
	set)
	killall xcompmgr
	sed -i 's/#xcompmgr.*$/xcompmgr \&/g' ~/.config/openbox/autostart.sh
	xcompmgr &
	;;
	unset)
	sed -i 's/^xcompmgr.*$/#xcompmgr \&/g' ~/.config/openbox/autostart.sh
	killall xcompmgr
	;;
	setshaded)
	killall xcompmgr
	sed -i 's/#xcompmgr.*$/xcompmgr -CfF \&/g' ~/.config/openbox/autostart.sh
	xcompmgr -CfF &
	;;
	setshadowshade)
	killall xcompmgr
	sed -i 's/#xcompmgr.*$/xcompmgr -CcfF \&/g' ~/.config/openbox/autostart.sh
	xcompmgr -CcfF &
	;;
	*)
		echo "This script accepts the following arguments : set, setshaded, setshadowshade, unset"
esac
