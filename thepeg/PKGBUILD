# Maintainer: Daniel Mendler <mail at daniel-mendler.de>
# Contributor: Daniel Mendler <mail at daniel-mendler.de>
pkgname=thepeg
pkgver=1.6.1
pkgrel=3
pkgdesc="Toolkit for High Energy Physics Event Generation"
arch=(i686 x86_64)
url="http://home.thep.lu.se/ThePEG/"
license=('GPL')
depends=(gsl hepmc)
source=(http://home.thep.lu.se/~leif/ThePEG/ThePEG-$pkgver.tar.bz2)
sha256sums=('5bc074b78f8b663a6a33df9c94dcaa3100269f8da59f9553a565298e55af270f')

build() {
  cd $srcdir/ThePEG-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  make prefix=$pkgdir/usr install
  rm $pkgdir/usr/lib/ThePEG/Makefile* $pkgdir/usr/lib/ThePEG/libtool
}
