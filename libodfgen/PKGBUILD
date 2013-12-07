# Contributor: Yue

pkgname=libodfgen
pkgver=0.0.4
pkgrel=1
pkgdesc="A library for generating documents in Open Document Format (ODF)."
arch=('i686' 'x86_64')
url="http://sf.net/p/libwpd/libodfgen/"
license=('MPL2')
options=(!libtool)
depends=('libwpd>=0.9.5' 'libwpg>=0.2.0' 'libetonyek' 'librevenge' 'libxml2' 'gperf>=3.0' 'zlib')
makedepends=('boost')
source=(http://dev-www.libreoffice.org/src/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('05c42f00ea60fb93cd97c2d04618711f72c418ee169eaea4f71e47d81df1988d')

build() {
  cd "${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --without-docs --enable-static=no --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
