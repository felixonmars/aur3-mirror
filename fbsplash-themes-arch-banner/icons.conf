#!/bin/bash

# /etc/splash/arch-banner-icons/icons.conf
#
# Common Configuration File for all 'arch-banner-*' Themes (except -noicons)

###  Remember to rebuild the initcpio after configuration change
##            if using SPLASH_DAEMON="early" in /etc/conf.d/splash!
#

# Root Directory of Icon-Theme to use
# Subdirs used within this: '32x32' for services/daemons, '16x16' for states
# Generic icons:
ICON_THEME=/usr/share/icons/Tango
# GNOME icons *not tested*:
#ICON_THEME=/usr/share/icons/gnome
# KDE4  icons *broken* because some are colormap instead of RGBA:
#ICON_THEME=/usr/share/icons/oxygen
# If not using the initcpio hook with early splash daemon start and /usr
# is on a separate partition, you should store your icons somewhere else:
#ICON_THEME=/etc/splash/icons/Tango

# Pairs of Service-/Daemon-Name and Icon-Path
# Order of services does not matter.
# If multiple entries for the same service, the first existing icon is used.
SERVICE_ICONS=(
	# rc.sysinit/rc.shutdown Pseudo Services
	# To get a list of possible names, run fbsplash-initscripts-services-get.
	_devices                       'devices/computer.png'
	_devices                       'devices/system.png'
	#_volumes                      'actions/system-lock-screen.png'
	_filesystems                   'devices/drive-harddisk.png'
	# rc.conf DAEMON Services
	gpm                            'devices/mouse.png'
	hwclock                        'apps/clock.png'
	hwclock                        'apps/date.png'
	acpid                          'devices/battery.png'
	alsa                           'status/audio-volume-medium.png'
	sensors                        'apps/utilities-system-monitor.png'
	net-auto-wired                 'devices/network-wired.png'
	net-auto-wireless              'devices/network-wireless.png'
	ntpd                           'apps/clock.png'
	ntpd                           'apps/date.png'
	openntpd                       'apps/clock.png'
	openntpd                       'apps/date.png'
	netfs                          'places/folder-remote.png'
	cups                           'devices/printer.png'
	samba                          'places/network-workgroup.png'
	nfsd                           'places/network-server.png'
)

# Service-/Daemon-Status Emblemes
# Note: If not set, service icons will be greyed instead.
#ICON_start='actions/go-up.png'
#ICON_stop='actions/go-down.png'
ICON_fail='status/dialog-warning.png'

# EOF #
