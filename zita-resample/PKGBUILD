# Maintainer: Philipp Überbacher <murks at lavabit dot com>
pkgname=zita-resample
_pkgname=zita-resampler
pkgver=0.4.0
_pkgver=0.1.1
pkgrel=2 
pkgdesc="A commandline resampling application using the zita-resampler library"
url="http://kokkinizita.linuxaudio.org/linuxaudio"
arch=('i686' 'x86_64')
license=('GPL')
depends=('zita-resampler' 'libsndfile')
source=(http://kokkinizita.linuxaudio.org/linuxaudio/downloads/${_pkgname}-${_pkgver}.tar.bz2)
md5sums=('cbf0da8b7ace593082a5f01eed828109')

build() {
    cd "${srcdir}/${_pkgname}-${_pkgver}/apps"
  
    sed -i "s|/usr/bin/install|/bin/install|" Makefile
  
    make PREFIX="${pkgdir}/usr" install
}

package() {
    cd "${srcdir}/${_pkgname}-${_pkgver}/apps"

    make PREFIX="${pkgdir}/usr" install
}
