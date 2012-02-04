# Maintainer: Philipp Überbacher <murks at lavabit dot com>
pkgname=acweight
pkgver=0.0.1
pkgrel=4
pkgdesc="High precision A- and C-weighting filter (LADSPA/jack)."
url="http://kokkinizita.linuxaudio.org/linuxaudio/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gcc-libs' 'jack')
makedepends=('ladspa')
source=(http://kokkinizita.linuxaudio.org/linuxaudio/downloads/${pkgname}.tar.bz2 ${pkgname}.patch)
md5sums=('8522c3836633557f37d4f6b7a1052822'
         'aa0781064ead592a00e1c8451561121a')

build() {
  cd "${srcdir}/${pkgname}"

  patch -p0 -i ${srcdir}/${pkgname}.patch Makefile
  rm acwtest

  make
}

package(){
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}
