# Maintainer: Federico Chiacchiaretta <federico.chia at gmail.com>
pkgname=libfunambol
_realver=9.0.0-r2511
pkgver=9.0.0r2511
pkgrel=1
pkgdesc="Library for akunambol."
arch=('i686' 'x86_64')
url="http://akunambol.ruphy.org"
license=('GPL')
depends=('curl')
source=(http://akunambol.ruphy.org/tarballs/funambol/${pkgname}-9.0.2-r2511.tar.bz2)
md5sums=('54475b80271a137fb56c1e39c2e470ad')

build() {
  cd $srcdir/${pkgname}-${_realver}/build/autotools

  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/${pkgname}-${_realver}/build/autotools

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
