#!/bin/sh
if [[ $1 = "--readme" || ! -f $HOME/.probability0/readme_ind ]]; then
	exec $TERM -title "Probability 0 manual" -e less /usr/share/probability0/probability0.txt &
	mkdir -p $HOME/.probability0
	touch $HOME/.probability0/readme_ind
fi

cd /usr/share/probability0
exec aoss python2 pzero.pyc

