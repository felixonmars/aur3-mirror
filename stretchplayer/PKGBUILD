# Maintainer: Ray Rashif <schiv@archlinux.org>

pkgname=stretchplayer
pkgver=0.502
pkgrel=2
pkgdesc="Time-stretching and pitch-shifting audio player"
arch=('i686' 'x86_64')
url="http://www.teuton.org/~gabriel/stretchplayer/"
license=('GPL')
depends=('qt4' 'rubberband' 'jack')
makedepends=('cmake')
source=("http://www.teuton.org/~gabriel/$pkgname/${pkgname}_$pkgver.tar.gz")
md5sums=('c42a899a4f6e6e7f3f5c5b33120bcafd')

build() {
  cd "$srcdir/$pkgname"

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir" install
}
