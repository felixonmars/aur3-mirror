# Maintainer: ValHue <vhuelamo at gmail dot com>

pkgname=cinnamon-applet-quit
pkgver=PRE_FINAL
pkgrel=3
pkgdesc="An applet aimed to make quitting your session a lot easier. Adapted to Arch+systemd."
arch=('i686' 'x86_64')
url="http://cinnamon-spices.linuxmint.com/applets/view/39"
license=('GPL3')
depends=('cinnamon')
install="${pkgname}.install"
source=("http://cinnamon-spices.linuxmint.com/uploads/applets/YVDH-P607-OCJ0.zip")
md5sums=('49ea34e72fa667937d8d74de42dbe796')

_uuid="QuitApplet@bownz"

build() {
    cd "${srcdir}/${_uuid}"

    # Fix for python2.
    sed -i 's_#!/usr/bin/python_#!/usr/bin/python2_' settings.py


    # Fix for use systemd.
    # Replacing UPower by systemd.
    sed -i 's_"dbus-send --print-reply --system --dest=org.freedesktop.UPower /org/freedesktop/UPower org.freedesktop.UPower.Suspend"_"systemctl suspend"_' applet.js
    sed -i 's_"dbus-send --print-reply --system --dest=org.freedesktop.UPower /org/freedesktop/UPower org.freedesktop.UPower.Hibernate"_"systemctl hibernate"_' applet.js

    # Replacing consolekit by systemd.
    sed -i 's_"dbus-send --system --print-reply --system --dest=org.freedesktop.ConsoleKit /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Restart"_"systemctl reboot"_' applet.js
    sed -i 's_"dbus-send --system --print-reply --system --dest=org.freedesktop.ConsoleKit /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Stop"_"systemctl poweroff"_' applet.js


    # Fix for lock screen.
    sed -i 's_("dbus-send --session --type=method\_call --print-reply --dest=org.gnome.ScreenSaver /org/gnome/ScreenSaver org.gnome.ScreenSaver.Lock")_("gnome-screensaver-command -lock")_' applet.js


    # Fix for use in multi-user mode.
    # The original applet is used in local mode (~/.local/share/cinnamon/applets)

    # Fixing settings.py
    sed -i '/import os/i\from os.path import expanduser' settings.py
    sed -i '/config = None/i\userhome = expanduser("~")' settings.py
    sed -i '/config.json/ d' settings.py
    sed -i '/config = None/a\config_file = userhome + "/.cinnamon/QuitApplet@bownz/config.json"' settings.py

    # Fixing applet.js
    sed -i '/const CONFIG_FILE/i\const SETTINGS_FOLDER = GLib.get_home_dir() + "/.cinnamon/QuitApplet@bownz/";' applet.js
    sed -i 's/FILE    = AppletDir/FILE = SETTINGS_FOLDER/; s_/config.json_config.json_' applet.js
}

package() {
    cd "${srcdir}"
    find ${_uuid}/ -type f -exec install -Dm644 '{}' "${pkgdir}/usr/share/cinnamon/applets/{}" \;

    cd "${pkgdir}/usr/share/cinnamon/applets/${_uuid}"
    chmod +755 settings.py 
}
