# Maintainer: Wieland Hoffmann <the_mineo@web.de>
pkgname=chromaprint
pkgver=0.6
pkgrel=1
pkgdesc="Chromaprint is a client library, written in C++, for extracting audio fingerprints. "
arch=('i686' 'x86_64')
url="http://acoustid.org/chromaprint"
license=('LGPL')
provides=('chromaprint')
depends=('ffmpeg')
makedepends=('cmake')
source=(https://github.com/downloads/lalinsky/$pkgname/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_EXAMPLES=ON .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

md5sums=('6b5a4f2685395e68d8abc40d1c2a8785')
# vim:set ts=2 sw=2 et:
