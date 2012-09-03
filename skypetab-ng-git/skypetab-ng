#!/bin/sh
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

LIBDIR="@LIBDIR@"

if [[ -e "$LIBDIR/libv4l/v4l2convert.so" ]]; then
        export LD_PRELOAD="$LIBDIR/libv4l/v4l2convert.so:$LD_PRELOAD"
fi

LD_PRELOAD=libskypetab-ng.so:$LD_PRELOAD exec "$LIBDIR/skype/skype" $*
