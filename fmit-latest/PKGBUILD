# Contributor: Patrick Melo <patrick@patrickmelo.eti.br>

pkgname=fmit-latest
_pkgname=fmit
pkgver=0.99.2
pkgrel=1
pkgdesc="Free Music Instrument Tuner (latest version)"
url="http://home.gna.org/fmit/index.html"
makedepends=('cmake')
depends=('glut' 'qt' 'libxi' 'fftw' 'freeglut')
optdepends=('jack-audio-connection-kit: jackd support')
provides=('fmit')
conflicts=('fmit')
license=("GPL")
source=(http://download.gna.org/fmit/$_pkgname-$pkgver-Source.tar.gz)
md5sums=('726e9a16ab92cb512cdc46edac420c26')
arch=('i686', 'x86_64')

build() {
  cd $startdir/src/$_pkgname-$pkgver-Source
  cmake .
  make || return 1
  make DESTDIR=$startdir/pkg install
}
