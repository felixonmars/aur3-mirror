pkgname=python31-cairo
pkgver=1.10.0
pkgrel=1
pkgdesc="Python bindings for the cairo graphics library"
arch=('i686' 'x86_64')
license=('LGPL3')
depends=('python' 'cairo')
makedepends=('pkg-config')
options=('!libtool')
source=(http://cairographics.org/releases/pycairo-${pkgver}.tar.bz2)
url="http://www.cairographics.org/pycairo"
md5sums=('e6fd3f2f1e6a72e0db0868c4985669c5')

build() {
  cd "${srcdir}/pycairo-${pkgver}"
  PYTHON=python3.1 ./waf configure --prefix=/usr
  ./waf build
}

package() {
  cd "${srcdir}/pycairo-${pkgver}"
  ./waf install --destdir="${pkgdir}"
  # Work around a conflict with python-cairo
  rm "${pkgdir}/usr/include/pycairo/py3cairo.h"
  rm "${pkgdir}/usr/lib/pkgconfig/py3cairo.pc"
}
