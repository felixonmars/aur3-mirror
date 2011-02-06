#!/bin/bash
#Created by F0ruD A <fzerorubigd@gmail.com>

if [ $# -eq 0 ]; then
	mkdir ~/.Pojh
	mkdir ~/.Pojh/Saaghar
	cp -n /usr/share/saaghar/* ~/.Pojh/Saaghar/
elif [ $1 == "install" ]; then
	mkdir ~/.Pojh
	mkdir ~/.Pojh/Saaghar
	cp -n /usr/share/saaghar/* ~/.Pojh/Saaghar/
elif [ $1 == "remove" ]; then
	rm -rf ~/.Pojh
else
	echo "Usage : $0 [install|remove]"
	echo "defualt is install"
	exit
fi
