# Maintainer: Bernhard Walle <bernhard@bwalle.de>

pkgname=libtnc
pkgver=1.25
pkgrel=1
pkgdesc="OS independent implementation of the Trusted Network Connect (TNC) specification"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/libtnc"
license=('GPL')
makedepends=('cmake')
source=("http://sourceforge.net/projects/libtnc/files/libtnc/$pkgver/$pkgname-$pkgver.tar.gz/download")
sha1sums=('c8f212d36eaf82eb04a70e33f60ece177b9227c5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
