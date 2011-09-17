#!/bin/bash

# use bash for "exec -l", howto run login shell by /bin/sh ?
PROGNAME=/etc/lxdm/Xsession

message () {
  # pretty-print messages of arbitrary length; use xmessage if it
  # is available and $DISPLAY is set
  MESSAGE="$PROGNAME: $*"
  echo "$MESSAGE" | fold -s -w ${COLUMNS:-80} >&2
  if [ -n "$DISPLAY" ] && which xmessage > /dev/null 2>&1; then
    echo "$MESSAGE" | fold -s -w ${COLUMNS:-80} | xmessage -center -file -
  fi
}

message_nonl () {
  # pretty-print messages of arbitrary length (no trailing newline); use
  # xmessage if it is available and $DISPLAY is set
  MESSAGE="$PROGNAME: $*"
  echo -n "$MESSAGE" | fold -s -w ${COLUMNS:-80} >&2;
  if [ -n "$DISPLAY" ] && which xmessage > /dev/null 2>&1; then
    echo -n "$MESSAGE" | fold -s -w ${COLUMNS:-80} | xmessage -center -file -
  fi
}

errormsg () {
  # exit script with error
  message "$*"
  exit 1
}

# attempt to create an error file; abort if we cannot
ERRFILE=$HOME/.xsession-errors
if (umask 077 && touch "$ERRFILE") 2> /dev/null && [ -w "$ERRFILE" ] &&
  [ ! -L "$ERRFILE" ]; then
  chmod 600 "$ERRFILE"
elif ERRFILE=$(tempfile 2> /dev/null); then
  if ! ln -sf "$ERRFILE" "${TMPDIR:=/tmp}/xsession-$USER"; then
    message "warning: unable to symlink \"$TMPDIR/xsession-$USER\" to" \
             "\"$ERRFILE\"; look for session log/errors in" \
             "\"$TMPDIR/xsession-$USER\"."
  fi
else
  errormsg "unable to create X session log/error file; aborting."
fi
echo -n >"$ERRFILE" 2>&1
exec >>"$ERRFILE" 2>&1

# attempt to launch an xsession
if [ $# -eq 1 -a -n "$1" ]; then
	# previously saved or default session
	LXSESSION=$(which $1 >/dev/null 2>&1)
	if [ -z "$LXSESSION" ]; then
		if [ -x /usr/bin/startxfce4 ]; then
			# try startxfce4
			LXSESSION=/usr/bin/startxfce4
		elif [ -x $HOME/.xsession ]; then
			# user's default
			LXSESSION=$HOME/.xsession
		fi
	fi
fi

if [ -x /etc/X11/xinit/xinitrc-common ]; then
# fedora
	. /etc/X11/xinit/xinitrc-common
	if ! [ -z "$XDG_SESSION_COOKIE" ]; then
		CK_XINIT_SESSION=
	elif [ -x /usr/bin/ck-launch-session -a -z "$CK_XINIT_SESSION" ]; then
		CK_XINIT_SESSION="/usr/bin/ck-launch-session"
	fi
	exec -l $SHELL -c "$CK_XINIT_SESSION \"$LXSESSION\""
elif [ -x /etc/X11/xinit/Xsession ]; then
# fedora
	exec /etc/X11/xinit/Xsession $LXSESSION
elif [ -x /etc/X11/Xsession ]; then
# debian, mandriva, ubuntu
	exec /etc/X11/Xsession $LXSESSION
elif [ -x /etc/X11/xinit/xinitrc ]; then
#suse
	export WINDOWMANAGER=$LXSESSION
	exec -l $SHELL -c /etc/X11/xinitrc
else
# unknown, user should custom /etc/lxdm/xinitrc self
	if [ -x /etc/lxdm/xinitrc ]; then
		. /etc/lxdm/xinitrc
	fi
	if ! [ -z "$XDG_SESSION_COOKIE" ]; then
		CK_XINIT_SESSION=
	elif [ -x /usr/bin/ck-launch-session ]; then
		CK_XINIT_SESSION="/usr/bin/ck-launch-session"
	fi
	exec -l $SHELL -c "$CK_XINIT_SESSION \"$LXSESSION\""
fi
