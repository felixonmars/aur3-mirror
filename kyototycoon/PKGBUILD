# Maintainer: Alexander Duscheleit <jinks@archlinux.us>
pkgname=kyototycoon
pkgver=0.9.52
pkgrel=1
pkgdesc="A lightweight conncurent remote frontend for Kyoto Cabinet."
arch=('i686' 'x86_64')
url="http://fallabs.com/kyototycoon"
license=('GPL3')
depends=('zlib' 'kyotocabinet>=1.2.34')
source=("http://fallabs.com/${pkgname}/pkg/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1c8600fd294ed3ec9f70f8665d79cedec4397c9bb1b32dc4e5f33aa7df46ae01')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
