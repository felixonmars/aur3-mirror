# Maintainer : Rob McCathie <korrode AT gmail>
# Contributor: zhulik <zhulik.gleb@gmail.com>

pkgname=mathgl-lite
pkgver=2.3.1
pkgrel=1
pkgdesc="A library for scientific data visualization - lite build"
arch=('i686' 'x86_64')
url="http://${pkgname%-*}.sourceforge.net"
license=('GPL3')
depends=('libpng' 'libgl')
makedepends=('cmake')
provides=("${pkgname%-*}=${pkgver}" "udav")
conflicts=("${pkgname%-*}" "udav")
source=("http://downloads.sourceforge.net/project/${pkgname%-*}/${pkgname%-*}/${pkgname%-*}%20${pkgver}/${pkgname%-*}-${pkgver}.tar.gz")
sha1sums=('048e246220b00666eb3262890da1db9f72f5c7cd')

build() {
  cd "${srcdir}/${pkgname%-*}-${pkgver}"
  [[ -d build ]] || mkdir build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname%-*}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}
