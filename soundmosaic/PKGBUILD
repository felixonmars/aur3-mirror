# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=soundmosaic
pkgver=1.2
pkgrel=1
pkgdesc="Constructs an approximation of one sound out of small pieces of other sounds."
arch=(i686 x86_64)
url="http://awesame.org/soundmosaic/"
license=('GPL')
depends=('libx11' 'audiofile')
source=($url$pkgname-$pkgver.tar.gz)
md5sums=('fe1b80c6e9c2254fec5df8b2004b76d0')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
