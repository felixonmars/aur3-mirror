# $Id$
# Maintainer: Sean Bolton sean at smbolton dot com
# Contributor: Jochen Immendörfer <jochen.immendoerfer@gmail.com>
pkgname=fluidsynth-dssi
pkgver=1.0.0
pkgrel=2
pkgdesc="A DSSI wrapper for the FluidSynth synthesizer"
arch=('i686' 'x86_64')
url="http://dssi.sourceforge.net/download.html#FluidSynth-DSSI"
license=('GPL')
depends=('dssi' 'fluidsynth' 'gtk2' 'liblo')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/dssi/${pkgname}-${pkgver}.tar.gz fluidsynth-dssi)
md5sums=('6c9f660f0df4d2aad5076de75b2a0a67' 'b4bb457b3124188069e49a23102edcbc')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=$pkgdir install || return 1
  install -D -m755 ${srcdir}/fluidsynth-dssi ${pkgdir}/usr/bin/fluidsynth-dssi
}
