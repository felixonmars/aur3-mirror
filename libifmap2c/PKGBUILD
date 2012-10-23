# Maintainer: Bernhard Walle <bernhard@bwalle.de>

pkgname=libifmap2c
pkgver=0.4.0pre
_pkgver=0.4.0-pre
pkgrel=1
pkgdesc="Open Source C++ IF-MAP 2.0 Client Library"
arch=('i686' 'x86_64')
url="http://code.google.com/p/libifmap2c/"
license=('GPL')
makedepends=('cmake')
source=("http://libifmap2c.googlecode.com/files/$pkgname-$_pkgver.tar.bz2")
md5sums=('5b037bd0839bb252e806366f4f276316')

build() {
  cd "$srcdir/home/awelzel/ifmap/libifmap2c_repo2/tags/$_pkgver/$pkgname-$_pkgver/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/home/awelzel/ifmap/libifmap2c_repo2/tags/$_pkgver/$pkgname-$_pkgver/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
