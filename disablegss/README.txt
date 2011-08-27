From http://ubuntuforums.org/showthread.php?t=284804, Author crazy___cow on
October 26th, 2006

HOWTO disable screensaver and powermanager while mplayer or other apps are
running

I have written a small python daemon to disable gnome-screensaver and
gnome-powermanager while certain specified apps are running.
It works quite well on Ubuntu Edgy. It requires dbus (>= 0.93), python-dbus,
and obviously gnome-screensaver and gnome-powermanager (on gnome 2.16).
The idea is simple: I have seen how Totem is working, and I emulate its
behavior with a small python daemon.
To install it just copy "disablegss.py" in /usr/local/bin, fix its execute
permissions and create a simple config file in your homedir "~/.disablegss".
In this config file add every application name that could stop
gnome-screensaver, one for each line. Example:

Code:

mplayer
gmplayer
vlc
wxvlc
xine
gxine

Please notice you must insert the name of the app how you can see it on
'ps aux': for example if you want to add firefox, you must write a line with
"/usr/lib/firefox/firefox-bin".
Now just launch disablegss.py on a terminal or simply add it on your session!
You can change the config file on fly (I check if someone modify it), adding or
removing apps without restarting it.


HOW IT WORKS
Unfortunately the dbus and gnome development documentation are a bit outdated,
so I have read totem sources to view which methods are called to stop
gnome-screensaver and gnome-powermanager. The idea is if you call the Inhibit
method of gnome-screensaver, you disable the screensaver AND the powermanager.
To enable them again you must call the UnInhibit method. There is a small
terminal app, dbus-send, to comunicate with dbus but it doesn't work well with
these methods, so I decide to use the python dbus interface. This is my first
program in python so please tell me if something is wrong or not well coded!
Every 60 secs the daemon check if there are apps running that are also present
in the config file. If it's true, the screensaver is disabled. If someone
change the config file, the daemon read it again.
I don't think that this small daemon could run on Dapper: the dbus and gnome
API change on every release. But you can modify it to fix things. There are
only two lines that could be problematic:

Line 38: cookie = dev.Inhibit(myprogram, 'Disabled by DisableGSS Daemon')
Line 49: dev.UnInhibit(cookie)

These two methos are different on gnome 2.14 on Dapper. Also dbus has radically
changed. If you want to use disablegss.py on Dapper, find the right methods
(try to see dapper totem sources) and feel free to change what you want!
To do debug, I suggest you to launch disablegss.py on a terminal and
dbus-monitor on another one (you can see all messages from and to dbus daemon).
Also change the sleep time value in seconds (line 121) to debug it faster.
Happy coding!
