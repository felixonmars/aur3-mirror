# Maintainer: Laurent Hofer <laurenth at laurenth dot net>
pkgname=cocoalib
_pkgname=CoCoALib
pkgver=0.99533
pkgrel=2
pkgdesc="Computations in Commutative Algebra Library"
arch=('i686' 'x86_64')
url="http://cocoa.dima.unige.it/"
license=('GPL3')
provides=('CoCoA')
options=('staticlibs')
depends=('bash')
makedepends=('boost')
source=(http://cocoa.dima.unige.it/cocoalib/tgz/$_pkgname-$pkgver.tgz)
md5sums=('3cb5dc07bffe4431ed621ca867a17bb0')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  CXXFLAGS="${CXXFLAGS} -fPIC"
  ./configure
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  # Install documentation
  mkdir -p $pkgdir/usr/share/doc
  mv -v doc $pkgdir/usr/share/doc/$_pkgname

  # Install headers
  mkdir -p $pkgdir/usr/include
  mv -v include/CoCoA $pkgdir/usr/include/

  # Install the lib
  mkdir -p $pkgdir/usr/lib
  install -m 644 -D lib/libcocoa.a $pkgdir/usr/lib
}

