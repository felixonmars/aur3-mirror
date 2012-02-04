# Contributor: Yann Pomarede < yann . pomarede at gmail dot com >
pkgname=brutefir
pkgver=1.0k
pkgrel=1
pkgdesc="BruteFIR is a software convolution engine, a program for applying long FIR filters to multi-channel digital audio, either offline or in realtime."
arch=()
arch=('i686' 'x86_64')
url="http://www.ludd.luth.se/~torger/brutefir.html"
license=('GPL')
groups=()
depends=('fftw' 'alsa-lib' 'jack')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://www.ludd.luth.se/~torger/files/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=(9d7cd60d0e09d75e68a9d4f1fe5af95e)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed 's@/usr/local@/usr@' -i Makefile
  make || return 1
  make DESTDIR="$pkgdir/" install
}

