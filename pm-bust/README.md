Hibernating after a kernel update is one of the biggest mistakes one can make in linux. Hibernated machine fails to load from the image causing data/session and sometimes even hair loss.

pm-bust is a simple wrapper around pm-hibernate to detect and warn you about this situation. It's intended to work with Archlinux and won't work in any other distribution.

Installation
------------

    echo "touch /var/run/pm-bust" >> /etc/rc.local
    sudo ln -s pm-bust/pm-hibernate /usr/sbin/hibernate


Do not rename the original pm-hibernate - it's a symlink to a shell script which depends on it's name.

Pro tip
-------

If you hibernate with a hotkey, bind it to `hibernate -gui` - you'll get a gtk dialog window

Optional dependencies
-------------
`zenity` or `xdialog` for GUI.

Uninstallation
--------------
    sudo rm /usr/sbin/hibernate
