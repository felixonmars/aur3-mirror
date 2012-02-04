# Contributor: xnitropl <xnitropl at gmail dot com>
pkgname=nogravity-data
_pkgname=nogravity
pkgver=2.0
pkgrel=1
pkgdesc="Data files for a space shooter in 3D."
url="http://www.realtech-vr.com/nogravity/"
arch=('i686')
license=('GPL')
depends=('nogravity-cvs')
source=(http://sunet.dl.sourceforge.net/project/$_pkgname/Game%20data/2.0/rt-$_pkgname-data.zip)
md5sums=('c7536e907363ea1da63430b49e42931d')

build() {
  install -D -m644 $srcdir/NOGRAVITY.RMX $pkgdir/opt/$_pkgname/NOGRAVITY.RMX
  install -D -m644 $srcdir/GNU.TXT $pkgdir/usr/share/doc/$_pkgname/GNU.TXT
}
# vim:set ts=2 sw=2 et:
