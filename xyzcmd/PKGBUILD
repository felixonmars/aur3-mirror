# Maintainer: Martin Lüthi <mluethi@tnoo.net>
pkgname=xyzcmd
pkgver=0.0.5
pkgrel=1
pkgdesc="File manager written in Python"
arch=('i686' 'x86_64')
url="http://xyzcmd.syhpoon.name/"
depends=('python' 'python-urwid')
makedepends=()
license=('GPL2')
source=(http://xyzcmd.googlecode.com/files/$pkgname-$pkgver.tar.bz2)
md5sums=('b2d1f2c770f9839132dd61ae8ac1d0c5')

build() {
  cd $startdir/src/$pkgname-$pkgver
  python2 setup.py install --root=$startdir/pkg/
}
