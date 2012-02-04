#!/bin/sh

# fix broken $UID on some system...
if test "x$UID" = "x"; then
	if test -x /usr/xpg4/bin/id; then
		UID=`/usr/xpg4/bin/id -u`;
	else
		UID=`id -u`;
	fi
fi

if test "x$XDG_CONFIG_HOME" = "x" ; then
  XDG_CONFIG_HOME=$XDG_CONFIG_HOME/.config
fi
[ -d "$XDG_CONFIG_HOME" ] || mkdir "$XDG_CONFIG_HOME"
if test "x$XDG_CACHE_HOME" = "x" ; then
  XDG_CACHE_HOME=$XDG_CONFIG_HOME/.cache
fi
[ -d "$XDG_CACHE_HOME" ] || mkdir "$XDG_CACHE_HOME"

if [ -e $HOME/.xsession-errors.0 ] && [ -e $HOME/.xsession-errors ]; then
	rm $HOME/.xsession-errors.0
	mv $HOME/.xsession-errors $HOME/.xsession-errors.0
elif [ ! -e $HOME/.xsession-errors.0 ] && [ -e $HOME/.xsession-errors ]; then
	mv $HOME/.xsession-errors $HOME/.xsession-errors.0
fi

for errfile in "$HOME/.xsession-errors" "${TMPDIR-/tmp}/xses-$USER" "/tmp/xses-$USER"
do
	if ( cp /dev/null "$errfile" 2> /dev/null ) ; then
		chmod 600 "$errfile"
		exec > "$errfile" 2>&1
		break
	fi
done

echo "$0: Beginning session setup..."

userresources="$HOME/.Xresources"
usermodmap="$HOME/.Xmodmap"
userxkbmap="$HOME/.Xkbmap"

sysresources=/usr/lib/X11/xinit/.Xresources
sysmodmap=/usr/lib/X11/xinit/.Xmodmap
sysxkbmap=/etc/X11/Xkbmap

rh6sysresources=/etc/X11/xinit/Xresources 
rh6sysmodmap=/etc/X11/xinit/Xmodmap 

# merge in defaults
if [ -f "$rh6sysresources" ]; then xrdb -merge "$rh6sysresources"; fi
if [ -f "$sysresources" ]; then xrdb -merge "$sysresources"; fi
if [ -f "$userresources" ]; then xrdb -merge "$userresources"; fi

# merge in keymaps
if [ -f "$sysxkbmap" ]; then
    setxkbmap `cat "$sysxkbmap"`
    XKB_IN_USE=yes
fi

if [ -f "$userxkbmap" ]; then
    setxkbmap `cat "$userxkbmap"`
    XKB_IN_USE=yes
fi

if [ -z "$XKB_IN_USE" -a ! -L /etc/X11/X ]; then
    if grep '^exec.*/Xsun' /etc/X11/X > /dev/null 2>&1 && [ -f /etc/X11/XF86Config ]; then
       xkbsymbols=`sed -n -e 's/^[     ]*XkbSymbols[   ]*"\(.*\)".*$/\1/p' /etc/X11/XF86Config`
       if [ -n "$xkbsymbols" ]; then
           setxkbmap -symbols "$xkbsymbols"
           XKB_IN_USE=yes
       fi
    fi
fi

# xkb and xmodmap don't play nice together
if [ -z "$XKB_IN_USE" ]; then
    if [ -f "$rh6sysmodmap" ]; then
       xmodmap "$rh6sysmodmap"
    fi
    if [ -f "$sysmodmap" ]; then
       xmodmap "$sysmodmap"
    fi
    if [ -f "$usermodmap" ]; then
       xmodmap "$usermodmap"
    fi
fi

unset XKB_IN_USE

# run all system xinitrc shell scripts.
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for i in /etc/X11/xinit/xinitrc.d/* ; do
        if [ -x "$i" ]; then
	    . "$i"
        fi
    done
fi
SESSIONS="/usr/share/xsessions"
Session=xfce		#Default set to xfce
dmrc=/var/state/dm/dmrc
userdmrc=$HOME/.dmrc

if [ -e $dmrc ]; then
	localecmd="$(grep "LANG=" $dmrc 2>/dev/null)"
	keymapcmd="$(grep "loadkeys" $dmrc 2>/dev/null)"
	xkbmapcmd="$(grep "setxkbmap" $dmrc 2>/dev/null)"
	if [ "$localecmd" ]; then 
		if [ "$(grep "LANG=" $userdmrc 2>/dev/null)" ] ; then
			sed -i "s@^.*LANG=.*@$localecmd@" $userdmrc 
		else
			echo "$localecmd" >> $userdmrc
		fi
	fi
	if [ "$keymapcmd" ]; then 
		if [ "$(grep "loadkeys" $userdmrc 2>/dev/null)" ]; then
			sed -i "s@^.*loadkeys.*@$keymapcmd@" $userdmrc 
		else
			echo "$keymapcmd" >> $userdmrc
		fi		
	fi
	if [ "$xkbmapcmd" ]; then 
		if [ "$(grep "setxkbmap" $userdmrc 2>/dev/null)" ]; then
			sed -i "s@^.*setxkbmap.*@$xkbmapcmd@" $userdmrc
		else
			echo "$xkbmapcmd" >> $userdmrc
		fi
	fi
	
	rm -f $dmrc
fi
if [ -e "$userdmrc" ]; then
	source $userdmrc 1> /dev/null 2> /dev/null
	[ "Language" ] && export LANG="$Language"
	export LC_COLLATE="$LANG"
else 
	echo "[Desktop]" >> "$userdmrc"
	echo "Session=" >> "$userdmrc"
	echo "Language=" >> "$userdmrc"
fi

# accept $SESSION and remember Session

if [ "$1" ];then
	Session="$1"
	sed -i "s@^.*Session=.*@Session=$1@" $userdmrc
	if [ ! "$(grep "Session=" $userdmrc 2>/dev/null)" ] ; then
		echo "Session=$Session" >> $userdmrc
	fi
fi

echo "$0: Session=$Session"

profile=/etc/profile
userprofile=$HOME/.profile

if [ -r $profile ]; then
	source $profile 1> /dev/null 2> /dev/null
fi
if [ -r $userprofile ]; then
	source $userprofile 1> /dev/null 2> /dev/null
fi

xprofile=/etc/xprofile
userxprofile=$HOME/.xprofile
if [ -r $xprofile ]; then
	source $xprofile $Session
fi
if [ -r $userxprofile ]; then
	source $userxprofile $Session
fi

echo "$0: Ready to start desktop..."
# We should normally get the session command from desktop files
if [ -e ${SESSIONS}/${Session}.desktop ];then
	COMMAND="$(sed -n 's/Exec[ \t]*=[ \t]*\(.*\)$/\1/p' ${SESSIONS}/${Session}.desktop)"
	echo "$0: Setup done, will start: ${SESSIONS}/${Session}.desktop"
	exec ck-launch-session dbus-launch --auto-syntax --exit-with-session $COMMAND
else echo "$0: Faild to find ${SESSIONS}/${Session}.desktop, try another way..."
fi

case "$Session" in
default)
	xsetroot -solid SteelBlue
	exec xterm -geometry 80x24-0-0
	;;
xfce4)
	startxfce4
	;;
kde)
	ck-launch-session  startkde
	;;
gnome)
	ck-launch-session  gnome-session
	;;
fluxbox)
	ck-launch-session  fluxbox
	;;
fvwm2)
	xsetroot -solid SteelBlue
	ck-launch-session  fvwm2
	;;
fvwm95)
	xsetroot -solid SteelBlue
	ck-launch-session  fvwm95
	;;
blackbox)
	ck-launch-session  blackbox
	;;
windowmaker)
	exec /etc/X11/xinit/xinitrc.wmaker
	;;
afterstep)
	ck-launch-session  afterstep
	;;
enlightenment)
	exec /etc/X11/xinit/xinitrc.enlightenment
	;;
twm)
	#xclock -geometry 50x50-1+1 &
	#xterm -geometry 80x50+494+51 &
	#xterm -geometry 80x20+494-0 &
	#xterm -geometry 80x66+0+0 -name login &
	xsetroot -solid SteelBlue
	ck-launch-session twm
	;;
esac

if [ -x $HOME/.xsession ]; then
        exec $HOME/.xsession $@
fi

if [ -r /etc/X11/xinit/xinitrc.xfce ]; then
	exec /etc/X11/xinit/xinitrc.xfce
fi
