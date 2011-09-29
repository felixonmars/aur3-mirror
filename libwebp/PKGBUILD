# Maintainer: Jon Nordby <jononor@gmail.com>

pkgname=libwebp
pkgver=0.1.3
pkgrel=1
pkgdesc="the WebP library. Includes conversion tools."
arch=('i686' 'x86_64')
url="http://code.google.com/intl/en/speed/webp/"
license=('BSD')
depends=('libpng' 'libjpeg')
makedepends=()
optdepends=()
conflicts=()
source=(http://webp.googlecode.com/files/$pkgname-$pkgver.tar.gz)
sha1sums=('f46aff9f1aeb8620d7ca4b9afc54e6df6d4de313')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
