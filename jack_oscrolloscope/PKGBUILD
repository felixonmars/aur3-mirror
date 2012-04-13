# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=jack_oscrolloscope
pkgver=0.7
pkgrel=2
pkgdesc="A simple waveform viewer for JACK"
arch=('i686' 'x86_64')
url="http://das.nasophon.de/jack_oscrolloscope/"
license=('GPL')
depends=('jack' 'sdl')
makedepends=('mesa')
optdepends=('mesa: for OpenGL visualization')
source=("http://das.nasophon.de/download/$pkgname-$pkgver.tar.gz")
md5sums=('610beeb5044c5017537e43d50bbb803b')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # DSO link fix (libm)
  sed -i "/^LIBS/s/$/ -lm/" Makefile

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # bin
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
