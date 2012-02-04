# Contributor: zoulnix <http://goo.gl/HQaP>
pkgname=alpng
pkgver=1.3
pkgrel=4
pkgdesc="Library for loading PNG files for the Allegro library."
arch=('i686' 'x86_64')
url="http://alpng.sourceforge.net/"
license=('zlib')
depends=('allegro')
makedepends=('gcc' 'make' 'pkg-config')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}${pkgver/./}.tar.gz)
md5sums=('e1e4cf2771663a43c065e04ce5f4efd9')

build() {
  cd ${srcdir}

  ./configure
  make || return 1
}

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/{lib,include} || return 1

  install -m644 lib${pkgname}.a ${pkgdir}/usr/lib/ || return 1
  install -m644 src/${pkgname}.h ${pkgdir}/usr/include/ || return 1
}
