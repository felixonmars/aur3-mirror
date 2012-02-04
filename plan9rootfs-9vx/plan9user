#!/bin/sh
if [-d ~/.plan9]; then

	unionfs -o cow -o umask=000 ~/.plan9/root=RW:/opt/vx32/plan9root=RO ~/.plan9/temp
	unionfs -o cow -o umask=000 ~/.plan9/home=RW:~/.plan9/root/usr/$USER=RW ~/.plan9/temp/usr/$USER
	/opt/vx32/bin/9vx -r ~/.plan9/temp
	cd ~/
	fusermount -u ~/.plan9/temp/usr/$USER
	fusermount -u ~/.plan9/temp

else
	echo "==> First run, setting up environment"
	mkdir -p ~/.plan9/{root/usr/$USER,home,temp}
	unionfs -o cow -o umask=000 ~/.plan9/root=RW:/opt/vx32/plan9root=RO ~/.plan9/temp
	unionfs -o cow -o umask=000 ~/.plan9/home=RW:~/.plan9/root/usr/$USER=RW ~/.plan9/temp/usr/$USER

	cmd="386/bin/bind -a /386/bin /bin;
	bind -a /rc/bin /bin;
	cd $home;
	rc /sys/lib/newuser;
	echo reboot > '#c/reboot'"
	cmd=`echo $cmd | sed "s;';'';g"`
	/opt/vx32/bin/9vx -r ~/.plan9/temp -g "init=/386/bin/rc -c $cmd" -u $USER

	cd ~/
	fusermount -u ~/.plan9/temp/usr/$USER
	fusermount -u ~/.plan9/temp
fi