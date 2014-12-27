#!/bin/bash

LIBDIR="@LIBDIR@"
PKGNAME="@PKGNAME@"

if [[ -e "$LIBDIR/libv4l/v4l2convert.so" ]]; then
	export LD_PRELOAD="${LD_PRELOAD:+$LD_PRELOAD:}$LIBDIR/libv4l/v4l2convert.so"
fi

if [[ -e "/usr/share/$PKGNAME/lib/libQtWebKit.so.4" ]]; then
	export LD_PRELOAD="${LD_PRELOAD:+$LD_PRELOAD:}/usr/share/$PKGNAME/lib/libQtWebKit.so.4"
fi

exec "$LIBDIR/$PKGNAME/skype" --resources="/usr/share/$PKGNAME" "$@"
