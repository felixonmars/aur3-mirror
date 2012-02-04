#!/bin/sh

cd /usr/share/rubytorrent
if(pacman -Q ruby-gtk2 >/dev/null)
	then ruby gtktorrent.rb
	else ruby torrent.rb
fi
