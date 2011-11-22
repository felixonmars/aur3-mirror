#!/bin/sh
if [-d ~/.plan9]; then
	unionfs -o cow -o umask=000 ~/.plan9/root=RW:/opt/vx32/plan9root=RO ~/.plan9/temp
	/opt/vx32/bin/9vx -r ~/.plan9/temp -u glenda
	cd ~/
	fusermount -u ~/.plan9/temp
else
	echo "first run, adding directories"
	mkdir -p ~/.plan9/{root/usr/$USER,home,temp}
	unionfs -o cow -o umask=000 ~/.plan9/root=RW:/opt/vx32/plan9root=RO ~/.plan9/temp
	/opt/vx32/bin/9vx -r ~/.plan9/temp -u glenda
	cd ~/
	fusermount -u ~/.plan9/temp
fi
