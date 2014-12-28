# Maintainer: Gus deMayo
pkgname=g15
true && pkgname=('gnome15'
                 'gnome15-driver-g19direct'
                 'python2-pylibg19'
                 'gnome15-driver-g15direct'
                 'gnome15-driver-kernel'
                 'gnome15-driver-g930'
                 'gnome15-driver-gtk'
                 'gnome15-systemtray'
                 'gnome15-plugin-fx'
                 'gnome15-plugin-g15daemon-server'
                 'gnome15-plugin-im'
                 'gnome15-plugin-macro-recorder'
                 'gnome15-plugin-macros'
                 'gnome15-plugin-profiles'
                 'gnome15-plugin-menu'
                 'gnome15-plugin-mounts'
                 'gnome15-plugin-mpris'
                 'gnome15-plugin-notify-lcd'
                 'gnome15-plugin-panel')
pkgbase=g15
pkgver=0.9.8
pkgrel=1
pkgdesc="Gnome tools for the Logitech G Series Keyboards And Z-10 Speakers"
arch=('i686' 'x86_64' 'any')
url="http://www.russo79.com/gnome15"
license=('GPL')
depends=('python2'
         'pygtk'
         'python2-keyring'
         'python2-imaging'
         'python2-cairo'
         'python2-dbus'
         'python2-pyinotify'
         'python2-lxml'
         'python2-gobject2'
         'python2-xdg'
         'python2-pyusb'
         'python2-gconf'
         'python2-rsvg'
         'python2-xlib'
         'python2-wnck'
         'python2-setproctitle'
         'python2-pyudev'
         'hicolor-icon-theme'
         'gnome-icon-theme')
makedepends=('gstreamer0.10-python'
             'python2-telepathy'
             'python2-pyalsaaudio'
             'python2-feedparser'
             'python2-vobject'
             'python2-gdata'
             'python2-sensors'
             'fftw'
             'libpulse')
source=(https://dl.dropboxusercontent.com/u/29821993/gnome15.tar.gz)

prepare() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  # Force usage of system python2
  for file in $(find . -type f -name '*' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python2_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/python2_' $file
  done
}

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  ./configure \
    --prefix=/usr --sysconfdir=/etc \
    --enable-driver-kernel \
    --enable-driver-g19direct \
    --enable-driver-g930 \
    --enable-driver-g15direct \
    --disable-indicator \
    --enable-systemtray \
    --enable-gnome-shell-extension \
    --disable-icons-mono \
    --enable-plugin-background \
    --enable-plugin-cairo-clock \
    --enable-plugin-clock \
    --enable-plugin-fx \
    --enable-plugin-g15daemon-server \
    --enable-plugin-im \
    --enable-plugin-macro-recorder \
    --enable-plugin-macros \
    --enable-plugin-profiles \
    --enable-plugin-menu \
    --enable-plugin-mounts \
    --enable-plugin-mpris \
    --enable-plugin-notify-lcd \
    --enable-plugin-panel \
    --enable-plugin-screensaver \
    --enable-plugin-stopwatch \
    --enable-plugin-mediaplayer \
    --enable-plugin-weather \
    --enable-plugin-weather-noaa \
    --enable-plugin-weather-yahoo \
    --disable-plugin-indicator-messages \
    --enable-plugin-volume \
    --enable-plugin-rss \
    --enable-plugin-sysmon \
    --enable-plugin-processes \
    --enable-plugin-debug \
    --enable-plugin-cal \
    --enable-plugin-cal-evolution \
    --enable-plugin-cal-google \
    --enable-plugin-google-analytics \
    --enable-plugin-lcdbiff \
    --enable-plugin-sense \
    --enable-plugin-lcdshot \
    --enable-plugin-tweak \
    --enable-plugin-tails \
    --enable-plugin-display \
    --enable-plugin-voip \
    --enable-plugin-voip-teamspeak3 \
    --enable-plugin-trafficstats \
    --enable-plugin-pommodoro \
    --enable-plugin-impulse15 \
    --disable-plugin-game-nexuiz \
    --disable-plugin-backlight \
    --disable-plugin-notify-lcd2 \
    --disable-plugin-ppastats \
    --disable-plugin-nm \
    --disable-plugin-lens \
    --disable-plugin-webkit-browser \
    --disable-plugin-things \
    UDEV_RULES_PATH=/usr/lib/udev/rules.d \
    DEVICEGROUP=gnome15 \
    PYTHON=python2
  make
}

package_gnome15() {
  true && arch=('any')
  true && optdepends=('joystick: Allows to calibrate the virtual joysticks'
                      'jstest-gtk-git: Allows to calibrate the virtual joysticks')
  cd "${srcdir}/${pkgbase}-${pkgver}"
  install=$pkgname.install

  install -d ${pkgdir}/etc/xdg/autostart
  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/lib/python2.7/site-packages/gnome15
  install -d ${pkgdir}/usr/lib/python2.7/site-packages/gnome15/util
  install -d ${pkgdir}/usr/lib/python2.7/site-packages/gnome15/drivers
  install -d ${pkgdir}/usr/lib/udev/rules.d
  install -d ${pkgdir}/usr/share/applications
  install -d ${pkgdir}/usr/share/dbus-1/services
  install -d ${pkgdir}/usr/share/gnome15/ui
  install -d ${pkgdir}/usr/share/gnome15/i18n/en_GB/LC_MESSAGES
  install -d ${pkgdir}/usr/share/gnome15/images
  install -d ${pkgdir}/usr/share/gnome15/themes
  install -d ${pkgdir}/usr/share/gnome15/themes/default
  install -d ${pkgdir}/usr/share/gnome15/ukeys
  install -d ${pkgdir}/usr/share/icons/hicolor/16x16/status
  install -d ${pkgdir}/usr/share/icons/hicolor/22x22/apps
  install -d ${pkgdir}/usr/share/icons/hicolor/22x24/status
  install -d ${pkgdir}/usr/share/icons/hicolor/24x24/{apps,status}
  install -d ${pkgdir}/usr/share/icons/hicolor/48x48/apps
  install -d ${pkgdir}/usr/share/icons/hicolor/64x64/apps
  install -d ${pkgdir}/usr/share/icons/hicolor/scalable/{apps,devices,status}
  install -d ${pkgdir}/usr/share/man/man1

  install -t ${pkgdir}/etc/xdg/autostart \
          -m644 data/autostart/gnome15.desktop
  install -t ${pkgdir}/usr/bin \
          -m755 src/scripts/g15-config \
                src/scripts/g15-desktop-service \
                src/scripts/g15-diag \
                src/scripts/g15-launch \
                src/scripts/g15-support-dump
  install -t ${pkgdir}/usr/lib/python2.7/site-packages/gnome15 \
          -m644 src/gnome15/*.py
  install -t ${pkgdir}/usr/lib/python2.7/site-packages/gnome15/util \
          -m644 src/gnome15/util/*.py
  install -t ${pkgdir}/usr/lib/python2.7/site-packages/gnome15/drivers \
          -m644 src/gnome15/drivers/__init__.py
  install -t ${pkgdir}/usr/lib/udev/rules.d \
          -m644 data/udev/98-gnome15.rules
  install -t ${pkgdir}/usr/share/applications \
          -m644 data/applications/g15-config.desktop
  install -t ${pkgdir}/usr/share/dbus-1/services \
          -m644 data/dbus/org.gnome15.Gnome15.service
  install -t ${pkgdir}/usr/share/gnome15/ui \
          -m644 data/ui/accounts.ui \
                data/ui/colorpicker.ui \
                data/ui/g15-config.ui \
                data/ui/macro-editor.ui \
                data/ui/password.ui \
                data/ui/script-editor.ui \
                data/ui/redblue.png
  install -t ${pkgdir}/usr/share/gnome15/i18n/en_GB/LC_MESSAGES \
          -m644 i18n/en_GB/LC_MESSAGES/colorpicker.mo \
                i18n/en_GB/LC_MESSAGES/g15-config.mo \
                i18n/en_GB/LC_MESSAGES/gnome15-drivers.mo \
                i18n/en_GB/LC_MESSAGES/gnome15.mo \
                i18n/en_GB/LC_MESSAGES/macro-editor.mo
  install -t ${pkgdir}/usr/share/gnome15/images \
          -m644 data/images/*.{svg,png}
  install -t ${pkgdir}/usr/share/gnome15/themes/default \
          -m644 data/themes/default/*.svg
  install -t ${pkgdir}/usr/share/gnome15/ukeys \
          -m644 data/ukeys/*.keys \
          -m644 data/ukeys/keysym-to-uinput
  install -t ${pkgdir}/usr/share/icons/hicolor/16x16/status \
          -m644 data/icons/hicolor/16x16/status/*.png
  install -t ${pkgdir}/usr/share/icons/hicolor/22x22/apps \
          -m644 data/icons/hicolor/22x22/apps/*.png
  install -t ${pkgdir}/usr/share/icons/hicolor/22x24/status \
          -m644 data/icons/hicolor/22x22/status/*.png
  install -t ${pkgdir}/usr/share/icons/hicolor/24x24/apps \
          -m644 data/icons/hicolor/24x24/apps/*.png
  install -t ${pkgdir}/usr/share/icons/hicolor/24x24/status \
          -m644 data/icons/hicolor/24x24/status/*.png
  install -t ${pkgdir}/usr/share/icons/hicolor/48x48/apps \
          -m644 data/icons/hicolor/48x48/apps/*.png
  install -t ${pkgdir}/usr/share/icons/hicolor/64x64/apps \
          -m644 data/icons/hicolor/64x64/apps/*.png
  install -t ${pkgdir}/usr/share/icons/hicolor/scalable/apps \
          -m644 data/icons/hicolor/scalable/apps/*.svg
  install -t ${pkgdir}/usr/share/icons/hicolor/scalable/devices \
          -m644 data/icons/hicolor/scalable/devices/*.png
  install -t ${pkgdir}/usr/share/icons/hicolor/scalable/status \
          -m644 data/icons/hicolor/scalable/status/*.svg
  install -t ${pkgdir}/usr/share/man/man1 \
          -m644 man/g15-config.1 \
                man/g15-desktop-service.1

  python2 -m compileall ${pkgdir}/usr/lib/python2.7/site-packages/gnome15
  python2 -O -m compileall ${pkgdir}/usr/lib/python2.7/site-packages/gnome15
}

package_python2-pylibg19() {
  true && pkgdesc="Basis for G19 support in Gnome15"
  true && arch=('any')
  true && depends=('python2' 'python2-pyusb' 'python2-imaging')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/pylibg19"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-driver-g19direct() {
  true && pkgdesc="Gnome15 driver for the Logitech G19"
  true && arch=('any')
  true && depends=('gnome15' 'python2-pylibg19')
  true && groups=('gnome15-drivers')

  cd "${srcdir}/${pkgbase}-${pkgver}"

  install -d ${pkgdir}/usr/lib/python2.7/site-packages/gnome15/drivers
  install -d ${pkgdir}/usr/lib/udev/rules.d
  install -d ${pkgdir}/usr/share/gnome15/ui
  install -d ${pkgdir}/usr/share/gnome15/i18n/en_GB/LC_MESSAGES

  install -t ${pkgdir}/usr/lib/python2.7/site-packages/gnome15/drivers \
          -m644 src/gnome15/drivers/driver_g19direct.py
  install -t ${pkgdir}/usr/lib/udev/rules.d \
          -m644 data/udev/99-gnome15-g19direct.rules
  install -t ${pkgdir}/usr/share/gnome15/ui \
          -m644 data/ui/driver_g19direct.ui
  install -t ${pkgdir}/usr/share/gnome15/i18n/en_GB/LC_MESSAGES \
          -m644 i18n/en_GB/LC_MESSAGES/driver_g19direct.mo

  python2 -m compileall ${pkgdir}/usr/lib/python2.7/site-packages/gnome15
  python2 -O -m compileall ${pkgdir}/usr/lib/python2.7/site-packages/gnome15
}

package_gnome15-driver-g15direct() {
  true && pkgdesc="Gnome15 driver for the Logitech G11, G13, G15, G110, Z-10"
  true && arch=('any')
  true && depends=('gnome15' 'libg15-gnome15')
  true && groups=('gnome15-drivers')

  cd "${srcdir}/${pkgbase}-${pkgver}"

  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/lib/python2.7/site-packages/gnome15/drivers
  install -d ${pkgdir}/usr/lib/udev/rules.d
  install -d ${pkgdir}/usr/share/gnome15/ui
  install -d ${pkgdir}/usr/share/gnome15/i18n/en_GB/LC_MESSAGES

  install -t ${pkgdir}/usr/bin \
          -m755 src/scripts/libg15test
  install -t ${pkgdir}/usr/lib/python2.7/site-packages/gnome15/drivers \
          -m644 src/gnome15/drivers/driver_g15direct.py
  install -t ${pkgdir}/usr/lib/python2.7/site-packages/gnome15/drivers \
          -m644 src/gnome15/drivers/pylibg15.py
  install -t ${pkgdir}/usr/lib/udev/rules.d \
          -m644 data/udev/99-gnome15-g15direct.rules
  install -t ${pkgdir}/usr/share/gnome15/ui \
          -m644 data/ui/driver_g15direct.ui
  install -t ${pkgdir}/usr/share/gnome15/i18n/en_GB/LC_MESSAGES \
          -m644 i18n/en_GB/LC_MESSAGES/driver_g15direct.mo

  python2 -m compileall ${pkgdir}/usr/lib/python2.7/site-packages/gnome15
  python2 -O -m compileall ${pkgdir}/usr/lib/python2.7/site-packages/gnome15
}

package_gnome15-driver-kernel() {
  true && pkgdesc="Gnome15 kernel driver"
  true && arch=('any')
  true && depends=('gnome15' 'lg4l' 'python2-pyinputevent')
  true && groups=('gnome15-drivers')

  cd "${srcdir}/${pkgbase}-${pkgver}"

  install -d ${pkgdir}/etc/dbus-1/system.d
  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/lib/python2.7/site-packages/gnome15/drivers
  install -d ${pkgdir}/usr/lib/udev/rules.d
  install -d ${pkgdir}/usr/share/dbus-1/system-services
  install -d ${pkgdir}/usr/share/gnome15/ui
  install -d ${pkgdir}/usr/share/gnome15/i18n/en_GB/LC_MESSAGES
  install -d ${pkgdir}/usr/share/man/man1

  install -t ${pkgdir}/etc/dbus-1/system.d \
          -m644 data/dbus/g15-system-service.conf
  install -t ${pkgdir}/usr/bin \
          -m755 src/scripts/g15-system-service
  install -t ${pkgdir}/usr/lib/python2.7/site-packages/gnome15/drivers \
          -m644 src/gnome15/drivers/driver_kernel.py
  install -t ${pkgdir}/usr/lib/python2.7/site-packages/gnome15/drivers \
          -m644 src/gnome15/drivers/fb.py
  install -t ${pkgdir}/usr/lib/udev/rules.d \
          -m644 data/udev/99-gnome15-kernel.rules
  install -t ${pkgdir}/usr/share/dbus-1/system-services \
          -m644 data/dbus/org.gnome15.SystemService.service
  install -t ${pkgdir}/usr/share/gnome15/ui \
          -m644 data/ui/driver_kernel.ui
  install -t ${pkgdir}/usr/share/gnome15/i18n/en_GB/LC_MESSAGES \
          -m644 i18n/en_GB/LC_MESSAGES/driver_kernel.mo
  install -t ${pkgdir}/usr/share/man/man1 \
          -m644 man/g15-system-service.1

  python2 -m compileall ${pkgdir}/usr/lib/python2.7/site-packages/gnome15
  python2 -O -m compileall ${pkgdir}/usr/lib/python2.7/site-packages/gnome15
}

package_gnome15-driver-g930() {
  true && pkgdesc="Gnome15 driver for the Logitech G930 and G35"
  true && arch=('any')
  true && depends=('gnome15' 'python2-pyinputevent')
  true && groups=('gnome15-drivers')

  cd "${srcdir}/${pkgbase}-${pkgver}"

  install -d ${pkgdir}/usr/lib/python2.7/site-packages/gnome15/drivers
  install -d ${pkgdir}/usr/lib/udev/rules.d
  install -d ${pkgdir}/usr/share/gnome15/ui
  install -d ${pkgdir}/usr/share/gnome15/i18n/en_GB/LC_MESSAGES

  install -t ${pkgdir}/usr/lib/python2.7/site-packages/gnome15/drivers \
          -m644 src/gnome15/drivers/driver_g930.py
  install -t ${pkgdir}/usr/lib/udev/rules.d \
          -m644 data/udev/99-gnome15-g930.rules
  install -t ${pkgdir}/usr/share/gnome15/ui \
          -m644 data/ui/driver_g930.ui
  install -t ${pkgdir}/usr/share/gnome15/i18n/en_GB/LC_MESSAGES \
          -m644 i18n/en_GB/LC_MESSAGES/driver_g930.mo

  python2 -m compileall ${pkgdir}/usr/lib/python2.7/site-packages/gnome15
  python2 -O -m compileall ${pkgdir}/usr/lib/python2.7/site-packages/gnome15
}

package_gnome15-driver-gtk() {
  true && pkgdesc="Gnome15 emulator driver"
  true && arch=('any')
  true && depends=('gnome15')
  true && groups=('gnome15-drivers')

  cd "${srcdir}/${pkgbase}-${pkgver}"

  install -d ${pkgdir}/usr/lib/python2.7/site-packages/gnome15/drivers
  install -d ${pkgdir}/usr/share/gnome15/ui
  install -d ${pkgdir}/usr/share/gnome15/i18n/en_GB/LC_MESSAGES

  install -t ${pkgdir}/usr/lib/python2.7/site-packages/gnome15/drivers \
          -m644 src/gnome15/drivers/driver_gtk.py
  install -t ${pkgdir}/usr/share/gnome15/ui \
          -m644 data/ui/driver_gtk.ui
  install -t ${pkgdir}/usr/share/gnome15/i18n/en_GB/LC_MESSAGES \
          -m644 i18n/en_GB/LC_MESSAGES/driver_gtk.mo

  python2 -m compileall ${pkgdir}/usr/lib/python2.7/site-packages/gnome15
  python2 -O -m compileall ${pkgdir}/usr/lib/python2.7/site-packages/gnome15
}

package_gnome15-systemtray() {
  true && pkgdesc="System tray icon for Gnome15"
  true && arch=('any')
  true && depends=('gnome15')

  cd "${srcdir}/${pkgbase}-${pkgver}"

  install -d ${pkgdir}/etc/xdg/autostart
  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/share/man/man1

  install -t ${pkgdir}/etc/xdg/autostart \
          -m644 data/autostart/g15-systemtray.desktop
  install -t ${pkgdir}/usr/bin \
          -m755 src/scripts/g15-systemtray
  install -t ${pkgdir}/usr/share/man/man1 \
          -m644 man/g15-systemtray.1
}

package_gnome15-gnome-shell() {
  true && pkgdesc="Gnome Shell extension for Gnome15"
  true && arch=('any')
  true && depends=('gnome15' 'gnome-shell')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/gnome-shell-extension"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-background() {
  true && pkgdesc="gnome15 Wallpaper plugin"
  true && arch=('any')
  true && depends=('gnome15')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-cairo-clock() {
  true && pkgdesc="gnome15 Cairo Clock plugin"
  true && arch=('any')
  true && depends=('gnome15')
  true && optdepends=('cairo-clock: Add more skins')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-clock() {
  true && pkgdesc="gnome15 Clock plugin"
  true && arch=('any')
  true && depends=('gnome15')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-fx() {
  true && pkgdesc="gnome15 Special Effect plugin"
  true && arch=('any')
  true && depends=('gnome15')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-g15daemon-server() {
  true && pkgdesc="gnome15 G15Daemon Compatibility plugin"
  true && arch=('any')
  true && depends=('gnome15')
  true && provides=('g15daemon')
  true && conflicts=('g15daemon')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-im() {
  true && pkgdesc="gnome15 Instant Messenger plugin"
  true && arch=('any')
  true && depends=('gnome15' 'python2-telepathy')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-macro-recorder() {
  true && pkgdesc="gnome15 Macro Recorder plugin"
  true && arch=('any')
  true && depends=('gnome15')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-macros() {
  true && pkgdesc="gnome15 Macro Information plugin"
  true && arch=('any')
  true && depends=('gnome15')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-profiles() {
  true && pkgdesc="gnome15 Profile Selector plugin"
  true && arch=('any')
  true && depends=('gnome15')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-menu() {
  true && pkgdesc="gnome15 Menu plugin"
  true && arch=('any')
  true && depends=('gnome15')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-mounts() {
  true && pkgdesc="gnome15 Mounts plugin"
  true && arch=('any')
  true && depends=('gnome15')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-mpris() {
  true && pkgdesc="gnome15 Now Playing plugin"
  true && arch=('any')
  true && depends=('gnome15')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-notify-lcd() {
  true && pkgdesc="gnome15 Notify plugin"
  true && arch=('any')
  true && depends=('gnome15')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-panel() {
  true && pkgdesc="gnome15 Panel plugin"
  true && arch=('any')
  true && depends=('gnome15')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-screensaver() {
  true && pkgdesc="gnome15 Screensaver plugin"
  true && arch=('any')
  true && depends=('gnome15')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-stopwatch() {
  true && pkgdesc="gnome15 Stopwatch plugin"
  true && arch=('any')
  true && depends=('gnome15')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-mediaplayer() {
  true && pkgdesc="gnome15 Media Player plugin"
  true && arch=('any')
  true && depends=('gnome15' 'gstreamer0.10-python')
  groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-weather() {
  true && pkgdesc="gnome15 Weather plugin"
  true && arch=('any')
  true && depends=('gnome15')
  true && optdepends=("gnome15-plugin-weather-noaa:  Use NOAA as weather source"
                      "gnome15-plugin-weather-yahoo: Use Yahoo as weather source")
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-weather-noaa() {
  true && pkgdesc="gnome15 Weather (NOAA support) plugin"
  true && arch=('any')
  true && depends=('gnome15' 'gnome15-plugin-weather')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-weather-yahoo() {
  true && pkgdesc="gnome15 Weather (Yahoo support) plugin"
  true && arch=('any')
  true && depends=('gnome15' 'gnome15-plugin-weather')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-volume() {
  true && pkgdesc="gnome15 Volume Monitor plugin"
  true && arch=('any')
  true && depends=('gnome15' 'python2-pyalsaaudio')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-rss() {
  true && pkgdesc="gnome15 RSS plugin"
  true && arch=('any')
  true && depends=('gnome15' 'python2-feedparser')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-sysmon() {
  true && pkgdesc="gnome15 System Monitor plugin"
  true && arch=('any')
  true && depends=('gnome15' 'python2-cairoplot-gnome15' 'python2-gtop')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-processes() {
  true && pkgdesc="gnome15 Process List plugin"
  true && arch=('any')
  true && depends=('gnome15' 'python2-gtop')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-debug() {
  true && pkgdesc="gnome15 Debug plugin"
  true && arch=('any')
  true && depends=('gnome15')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-cal() {
  true && pkgdesc="gnome15 Calendar plugin"
  true && arch=('any')
  true && depends=('gnome15')
  true && optdepends=('gnome15-plugin-cal-evolution: Use evolution data'
                      'gnome15-plugin-cal-google:    Use Google calendar data')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-cal-evolution() {
  true && pkgdesc="gnome15 Calendar (Evolution support) plugin"
  true && arch=('any')
  true && depends=('gnome15' 'gnome15-plugin-cal' 'python2-vobject')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-cal-google() {
  true && pkgdesc="gnome15 Calendar (Google support) plugin"
  true && arch=('any')
  true && depends=('gnome15' 'gnome15-plugin-cal' 'python2-gdata')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-google-analytics() {
  true && pkgdesc="gnome15 Google Analytics plugin"
  true && arch=('any')
  true && depends=('gnome15' 'python2-gdata' 'python2-cairoplot-gnome15')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-lcdbiff() {
  true && pkgdesc="gnome15 POP3 / IMAP Email Notification plugin"
  true && arch=('any')
  true && depends=('gnome15')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-sense() {
  true && pkgdesc="gnome15 Sensors plugin"
  true && arch=('any')
  true && depends=('gnome15' 'python2-cairoplot-gnome15' 'python2-sensors' 'libatasmart')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-lcdshot() {
  true && pkgdesc="gnome15 LCD Screenshot plugin"
  true && arch=('any')
  true && depends=('gnome15')
  true && optdepents=('mencoder: capture videos of device LCD')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-tweak() {
  true && pkgdesc="gnome15 Tweak Gnome15 plugin"
  true && arch=('any')
  true && depends=('gnome15')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-tails() {
  true && pkgdesc="gnome15 Tails plugin"
  true && arch=('any')
  true && depends=('gnome15')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-display() {
  true && pkgdesc="gnome15 Display Resolution plugin"
  true && arch=('any')
  true && depends=('gnome15')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-voip() {
  true && pkgdesc="gnome15 VoIP plugin"
  true && arch=('any')
  true && depends=('gnome15')
  true && optdepends=('gnome15-plugin-voip-teamspeak3: Add TeamSpeak3 support')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-voip-teamspeak3() {
  true && pkgdesc="gnome15 Teamspeak3 plugin"
  true && arch=('any')
  true && depends=('gnome15' 'gnome15-plugin-voip' 'teamspeak3')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-trafficstats() {
  true && pkgdesc="gnome15 Traffic Stats plugin"
  true && arch=('any')
  true && depends=('gnome15' 'python2-gtop')
  true && optdepends=('vnstat: use vnstat data')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-pommodoro() {
  true && pkgdesc="gnome15 Pommodoro Timer plugin"
  true && arch=('any')
  true && depends=('gnome15')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-impulse15() {
  true && pkgdesc="Gnome15 Impulse plugin"
  true && arch=('i686' 'x86_64')
  true && depends=('gnome15' 'fftw' 'libpulse')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/libimpulse"
  make DESTDIR="${pkgdir}/" install

  cd "${srcdir}/${pkgbase}-${pkgver}/src/plugins/${pkgname:15}"
  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
