# Maintainer: Philipp Überbacher <murks at lavabit dot com>
pkgname=njl-plugins
pkgver=0.2.1
pkgrel=3
pkgdesc="LADSPA plugins for noise and experimental effects."
arch=('i686' 'x86_64')
url="http://devel.tlrmx.org/audio/"
license=('GPL')
depends=('glibc')
source=(http://devel.tlrmx.org/audio/source/${pkgname}-${pkgver}.tar.gz)
md5sums=('1a5da22b6c2a3f82171cbdd0714b09ab')

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package(){
  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}/usr/lib/ladspa/"
  install -m755 *.so "${pkgdir}/usr/lib/ladspa/"
}
