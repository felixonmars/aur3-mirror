# Maintainer: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: philacs

pkgname=libvisio
pkgver=0.0.31
pkgrel=2
pkgdesc="A library providing ability to interpret and import visio diagrams"
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/libvisio"
license=('LGPL')
options=(!libtool)
depends=('libwpd>=0.9.5' 'libwpg>=0.2.0' 'libxml2' 'gperf>=3.0' 'icu')
makedepends=('boost')
source=(http://dev-www.libreoffice.org/src/${pkgname}-${pkgver}.tar.xz)
sha1sums=('c494799dac0931c97ec3e45569f92dcae2969b89')

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
