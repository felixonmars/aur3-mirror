#!/bin/sh
# mmtyping start-up script
prev=`pwd`
mkdir -p ~/.MMtyping
cd ~/.MMtyping
/usr/bin/wine /usr/share/mmtyping/Binary/TBOOK.EXE /usr/share/mmtyping/Binary/MMtype.tbk
ret=$?
cd "$prev"
exit $ret
