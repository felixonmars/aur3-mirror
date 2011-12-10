# Maintainer: Philipp Überbacher <murks at lavabit dot com>
pkgname=clalsadrv-apps
pkgver=2.0.0
pkgrel=2
pkgdesc="An alsa loopback and alsa latency testing app."
arch=('i686' 'x86_64')
url="http://kokkinizita.linuxaudio.org/linuxaudio/downloads/index.html"
license=('GPL')
depends=('clthreads' 'clalsadrv>=2.0.0')
source=(http://kokkinizita.linuxaudio.org/linuxaudio/downloads/clalsadrv-${pkgver}.tar.bz2 DSO.patch)
md5sums=('be123e1701e4b6c6300907df949bd71c'
         '61cbe55b3fd31b57d296d4f858a45781')
build() {
  cd "clalsadrv-${pkgver}/apps"
  patch < ${srcdir}/DSO.patch
  make DESTDIR=${pkgdir} PREFIX=/usr LIBDIR=lib
}

package(){
  cd "clalsadrv-${pkgver}/apps"
  make DESTDIR=${pkgdir} PREFIX=/usr LIBDIR=lib install
}
