# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=multimidicast
pkgver=1.3
pkgrel=1
pkgdesc="Sends and receives MIDI from Alsa sequencers over your network."
arch=(i686 x86_64)
url="http://llg.cubic.org/tools/multimidicast/"
license=('GPL')
depends=('alsa-lib')
source=($url$pkgname-$pkgver.tar.gz)
md5sums=('9dccef9df5033d89176ed597a73ac8b6')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
