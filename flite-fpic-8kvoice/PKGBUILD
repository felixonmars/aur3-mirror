# Maintainer: Till Hofmann <hofmann@kbsg.rwth-aachen.de>

pkgname=flite-fpic-8kvoice
_pkgname=flite
pkgver=1.4
pkgrel=4
pkgdesc="A lighweight version of festival speech synthesis compiled with -fPIC and 8k voice"
arch=('i686' 'x86_64')
url="http://www.speech.cs.cmu.edu/flite/"
license=('custom')
depends=('glibc' 'alsa-lib')
provides=('flite' 'flite-fpic')
conflicts=('flite' 'flite-fpic')
source=(http://www.speech.cs.cmu.edu/flite/packed/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}-release.tar.bz2)
md5sums=('b7c3523b3bbc6f29ce61e6650cd9a428')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}-release"
  CFLAGS="-fPIC" ./configure --prefix=/usr
  
  #when multithreaded - there is some trouble when compiling
  MAKEFLAGS="-j1" make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}-release"
  make prefix="${pkgdir}/usr" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
