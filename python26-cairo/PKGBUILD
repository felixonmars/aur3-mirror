pkgname=python26-cairo
pkgver=1.10.0
pkgrel=1
pkgdesc="Python2 bindings for the cairo graphics library"
arch=('i686' 'x86_64')
license=('LGPL' 'MPL')
depends=('python2' 'cairo')
options=('!libtool')
source=(http://cairographics.org/releases/py2cairo-${pkgver}.tar.bz2)
url="http://www.cairographics.org/pycairo"
md5sums=('20337132c4ab06c1146ad384d55372c5')

build() {
  cd "${srcdir}/py2cairo-${pkgver}"
  PYTHON=python2.6 ./waf configure --prefix=/usr
  ./waf build
}

package() {
  cd "${srcdir}/py2cairo-${pkgver}"
  ./waf install --destdir="${pkgdir}"
  # Work around a conflict with python2-cairo
  rm "${pkgdir}/usr/include/pycairo/pycairo.h"
  rm "${pkgdir}/usr/lib/pkgconfig/pycairo.pc"
}
