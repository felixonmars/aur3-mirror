The netmount script can be used as a replacement for /etc/rc.d/netfs.

The netfs script that comes with Archlinux does not have any timeout
in its stop routine, which means it can potentially freeze up your
system if the NFS server is unreachable at the time of the umount call.

This replacement (netmount) works around the problem because it will
always exit after 30 seconds.

Usage: replace netfs with netmount in /etc/rc.conf.
