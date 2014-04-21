# Maintainer: Bjoern Lindig <bjoern.lindig at googlemail dot com>
pkgname=aliki
pkgver=0.3.0
pkgrel=1
pkgdesc="An integrated system for Impulse Response measurements."
arch=('i686' 'x86_64')
url="http://www.kokkinizita.net/linuxaudio/downloads/index.html"
license=('GPL')
depends=('jack' 'gcc-libs-multilib' 'fftw' 'clalsadrv' 'clxclient')
source=("http://kokkinizita.linuxaudio.org/linuxaudio/downloads/${pkgname}-${pkgver}.tar.bz2")
md5sums=('b0c3db7dd921bc69be53ef6d0f72c9c0')
build() {
  mkdir -p "$pkgdir/usr/bin"
  cd "$srcdir/$pkgname-$pkgver/source"
  make PREFIX="/usr"
  make PREFIX="/usr" DESTDIR=$pkgdir install || return 1
}
