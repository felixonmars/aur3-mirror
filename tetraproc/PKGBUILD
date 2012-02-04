# Maintainer: Bjoern Lindig <bjoern.lindig at googlemail dot com>
pkgname=tetraproc
pkgver=0.6.2
pkgrel=0
pkgdesc="Tetrahedral Microphone Processor"
arch=('i686' 'x86_64')
url="http://www.kokkinizita.net/linuxaudio/downloads/index.html"
license=('GPL')
depends=('clthreads' 'clxclient' 'fftw' 'libsndfile')
install=$pkgname.install
source=(http://www.kokkinizita.net/linuxaudio/downloads/${pkgname}-${pkgver}.tar.bz2 ${pkgname}.patch)
md5sums=('b1f6130661e2f5eff0ef0ffc5d371706'
         '15d7adcc10312247a1515aee6cabc53b')
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -dDm 644 HOME/.${pkgname} ${pkgdir}/etc/${pkgname}/${pkgname}
  install -Dm 644 HOME/.${pkgname}rc ${pkgdir}/etc/${pkgname}/${pkgname}rc
  cd "source"
  patch < ${srcdir}/${pkgname}.patch || return 1
  make PREFIX="/usr" DESTDIR=${pkgdir} install || return 1
}
