# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: Tom K <tomk@runbox.com>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Maintainer: Philipp Überbacher <murks at lavabit dot com>
pkgname=clalsadrv
pkgver=2.0.0
pkgrel=1
pkgdesc="Audio library for aeolus, aliki, ams, jaaa and japa."
arch=('i686' 'x86_64')
url="http://kokkinizita.linuxaudio.org/linuxaudio/index.html"
license=('GPL')
depends=('alsa-lib')
install=${pkgname}.install
source=(http://kokkinizita.linuxaudio.org/linuxaudio/downloads/${pkgname}-${pkgver}.tar.bz2 ${pkgname}.patch)
md5sums=('be123e1701e4b6c6300907df949bd71c'
         'cc5a4abbc49590dfbbf942ebfd966b70')
build() {
  cd "${pkgname}-${pkgver}/libs"
  patch < ${srcdir}/${pkgname}.patch
  make DESTDIR=${pkgdir} PREFIX=/usr LIBDIR=lib 
}

package(){
  cd "${pkgname}-${pkgver}/libs"
  make DESTDIR=${pkgdir} PREFIX=/usr LIBDIR=lib install
}
