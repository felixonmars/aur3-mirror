#!/bin/bash

cd $HOME/.Skype
if test -e shared.xml
then
	find|grep config.xml|while read line;
	do
		sed -i "s/.UseUniqueConversationsWindow.*//" $line
		sed -i "s/<UI>/<UI>\n    <UseUniqueConversationsWindow>0<\/UseUniqueConversationsWindow>/" $line
		cat $line
	done
fi

LIBDIR="/usr/lib32"

if [[ -e "$LIBDIR/libv4l/v4l2convert.so" ]]; then
	export LD_PRELOAD="${LD_PRELOAD:+$LD_PRELOAD:}$LIBDIR/libv4l/v4l2convert.so"
fi

if [[ -e "/usr/share/skype/lib/libQtWebKit.so.4" ]]; then
	export LD_PRELOAD="${LD_PRELOAD:+$LD_PRELOAD:}/usr/share/skype/lib/libQtWebKit.so.4"
fi

LD_PRELOAD=libskypetab-ng.so:$LD_PRELOAD PULSE_LATENCY_MSEC=30 exec "$LIBDIR/skype/skype" "$@"
