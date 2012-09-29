# Contributor: Frozen Fox <frozenfoxz@gmail.com>

pkgname=ufw-frontends-gtk
_pkgbasename=ufw-frontends
pkgver=0.3.2
pkgrel=1
pkgdesc="Graphical frontend for Uncomplicated FireWall"
arch=('any')
url="http://code.google.com/p/ufw-frontends/"
license=('GPL3')
depends=('ufw' 'pygtk' 'sudo' 'gksu' 'python2' 'python2-pyinotify')
makedepends=('')
source=(http://${_pkgbasename}.googlecode.com/files/${_pkgbasename}-${pkgver}${_pkgverext}.tar.gz)
install=
conflicts=('ufw-frontends-qt')
sha256sums=('7ff838d1f20a122307ef5e2bc94f6cbb5ea019a1d3d7ec72f7493c5f8c0a7910')

build() {
  cd ${srcdir}/${_pkgbasename}-${pkgver}
  python2 setup.py build install --root=${pkgdir} || return 1
  sed -i 's/su-to-root -X -c/gksu/g' ${pkgdir}/usr/share/applications/ufw-gtk.desktop
}
