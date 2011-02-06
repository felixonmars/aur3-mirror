- ArchAssistant v0.4 -
----------------------

ABOUT:
------
 ArchAssistant is a systray docking app that lets you have quick access to various administration aspects of the Arch Linux distro. The main feature is a gui for the Arch's network profiles system (using the netcfg command line), which is very useful for laptop users.

FEATURES:
---------
- quick access to the main system files (ie rc.conf, profile, pacman.conf, xorg.conf ...) via a built-in simple text editor.
- netcfg2 front-end : quite complete GUI for the Arch's network profile system. You can connect to, create and edit network profiles in a few clicks. ArchAssistant has an autostart functionality that lets the app connect to the first wifi network discovered upon start.
- the pacman part has been mostly disabled (didn't work as expected).
- collection of the most useful command lines to check system informations.
- custom app launcher from menu
- download clipboard's url with your favorite download manager
- load/eject CD-ROM tray
- instant connection wizard
- english, french, german translations

REQUIREMENTS:
-------------
- arch linux distro !
- QT (I mean qt4)
- netcfg2


CHANGELOG:
----------
  Version 0.1 (launched 2007/10/04)
  Version 0.2 (released 2008/03/11)
  Version 0.3 (released 2008/03/24)
  Version 0.4 (released 2008/05/08)

INSTALL:
--------
  - cd in the uncompressed source tarball's directory : # cd archassistant-0.4
  - # qmake archassitant.pro
  - # make
  - run the provided install.sh script : # ./install.sh
  - type 'archassistant' from the command line or click 'ArchAssistant' from the 'System' menu

UNINSTALL:
----------
  - # ./uninstall.sh

READ NON-ROOT USERS:
--------------------
  Archassistant uses 'netcfg2' as a backend to connect the networks. Unfortunately, netcfg2 cannot be run by non-root users. This is a problem. Another one is that '/etc/network.d' folder, where profiles are stored, cannot be written by non-root users. What can be done :

  1/ edit '/etc/sudoers' file as root and insert entries like these :

     # User alias specification
     User_Alias	NETPROFILERS=lisa, homer, marge, bart

     # Cmnd alias specification
     Cmnd_Alias NETPROFILES=/sbin/ifconfig,/usr/bin/iwconfig,/usr/sbin/iwlist,/usr/bin/netcfg2,/bin/hostname,/usr/sbin/lspci

     # User privilege specification
     NETPROFILERS	ALL=NOPASSWD: NETPROFILES

  2/ change permissions for '/etc/network.d' directory. For instance, you may change the group owner to a group where your users belong (for example, the group 'network'). Example :

     chgrp -R network /etc/network.d/

LICENSE:
--------
 G.P.L. 2.0

CONTACT:
--------
 - author : thierry deseez
 - e-mail : pizza.tony@free.fr
 - website : www.qt-apps.org or kde-apps.org
