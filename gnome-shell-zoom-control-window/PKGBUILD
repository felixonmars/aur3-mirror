# Author: Timothy Hobbs <timothyhobbs@seznam.cz>
# Maintainer: Timothy Hobbs <timothyhobbs@seznam.cz>
pkgname=gnome-shell-zoom-control-window
url=http://brmlab.cz/user/timthelion
pkgver=0.O.1
pkgrel=1
pkgdesc="A floating window to control zoom levels in gnome3"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('python2' 'dbus-python' 'gnome-shell')
provides=('gnome-shell-zoom-control-window')

package() {
  install -D -m755 ${srcdir}/zoomcontrolwindow.py "${pkgdir}/usr/bin/zoomcontrolwindow.py" || return 1
  install -D -m644 ${srcdir}/zoomcontrolwindow.glade "$pkgdir/usr/share/zoomcontrolwindow/zoomcontrolwindow.glade" || return 1
  install -D -m644 ${srcdir}/zoomcontrolwindow.py.desktop "$pkgdir/usr/share/applications/zoomcontrolwindow.py.desktop" || return 1
}

# vim:set ts=2 sw=2 et:
