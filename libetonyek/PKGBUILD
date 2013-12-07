# Contributor: Yue

pkgname=libetonyek
pkgver=0.0.3
pkgrel=1
pkgdesc="A library and a set of tools for reading and converting Apple Keynote presentations."
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/libetonyek/"
license=('MPL2')
options=(!libtool)
depends=('librevenge' 'libxml2' 'gperf>=3.0' 'zlib')
makedepends=('boost')
source=(http://dev-www.libreoffice.org/src/${pkgname}-${pkgver}.tar.xz)
sha256sums=('b5b96cd0857fc9a740d6ec737d613d95e9524103b9ab5a15bb6e645621d943e6')

build() {
  cd "${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --disable-werror --without-docs --disable-tests --enable-static=no --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
