# Maintainer: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=box-gui
_pkgname=boxer
pkgver=0.3.1
pkgrel=1
pkgdesc="A graphical user interface for the Box vector graphics language"
arch=('any')
url="http://boxc.sourceforge.net"
license=('GPL')
depends=('python2' 'pygtk' 'box-core')
changelog='ChangeLog'
source=(http://downloads.sourceforge.net/boxc/$_pkgname-$pkgver.tar.gz)
md5sums=('b02eb6c163c737cc5d972d3c63b6ffcc')

build() {
  :
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}

# vim:set ts=2 sw=2 et:
