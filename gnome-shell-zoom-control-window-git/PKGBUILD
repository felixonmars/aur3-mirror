# Author: Timothy Hobbs <timothyhobbs@seznam.cz>
# Maintainer: Timothy Hobbs <timothyhobbs@seznam.cz>
pkgname=gnome-shell-zoom-control-window-git
url=http://brmlab.cz/user/timthelion
pkgver=0.0.1
pkgrel=1
pkgdesc="A floating window to control zoom levels in gnome3"
arch=('i686' 'x86_64')
url="https://github.com/timthelion/gnome-shell-zoom-control-window"
license=('GPL3')
depends=('python2' 'dbus-python' 'gnome-shell')

build() {
  cd "$srcdir"

  install -D -m755 ${srcdir}/../zoomcontrolwindow.py "${pkgdir}/usr/bin/zoomcontrolwindow.py" || return 1
  install -D -m644 ${srcdir}/../GnomeZoomSettings.py "${pkgdir}/usr/bin/GnomeZoomSettings.py" || return 1
  install -D -m644 ${srcdir}/../zoomcontrolwindow.py.desktop "${pkgdir}/usr/share/applications/zoomcontrolwindow.py.desktop" || return 1
  install -D -m644 ${srcdir}/../zoomcontrolwindow.glade "${pkgdir}/usr/share/zoomcontrolwindow/zoomcontrolwindow.glade" || return 1
}
