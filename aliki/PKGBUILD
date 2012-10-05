# Maintainer: Bjoern Lindig <bjoern.lindig at googlemail dot com>
pkgname=aliki
pkgver=0.1.0
pkgrel=3
pkgdesc="An integrated system for Impulse Response measurements."
arch=('i686' 'x86_64')
url="http://www.kokkinizita.net/linuxaudio/downloads/index.html"
license=('GPL')
depends=('jack' 'gcc-libs-multilib' 'fftw' 'clalsadrv' 'clxclient')
source=("http://kokkinizita.linuxaudio.org/linuxaudio/downloads/${pkgname}-${pkgver}.tar.bz2")
md5sums=('820cde2a5095e6d12e311562cb788b58')
build() {
  mkdir -p "${pkgdir}/usr/bin"
  cd "$srcdir/${pkgname}/source"
  make PREFIX="/usr"
  make PREFIX="/usr" DESTDIR=${pkgdir} install || return 1
}
