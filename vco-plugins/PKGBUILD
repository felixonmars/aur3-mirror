# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Maintainer: Philipp Überbacher <murks at lavabit dot com>
pkgname=vco-plugins
_pkgname=VCO-plugins
pkgver=0.3.0
pkgrel=4
pkgdesc="LADSPA anti-aliased oscillator plugins"
arch=('i686' 'x86_64')
url="http://kokkinizita.linuxaudio.org/linuxaudio/"
license=('GPL')
depends=('gcc-libs')
source=(http://kokkinizita.linuxaudio.org/linuxaudio/downloads/${_pkgname}-${pkgver}.tar.bz2)
md5sums=('6fdf4a7e3c716abbb89721645427cd52')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/lib/ladspa/"
  install -m755 *.so "${pkgdir}/usr/lib/ladspa/"
}
