# Maintainer: Thomas Arnhold <thomas at arnhold dot org>

pkgname=libfreehand
pkgver=0.1.0
pkgrel=1
pkgdesc="Library for Adobe/Macromedia drawings import."
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/libfreehand/"
license=('MPL')
depends=('librevenge' 'zlib')
makedepends=()
source=(http://dev-www.libreoffice.org/src/${pkgname}-${pkgver}.tar.xz)
md5sums=('f50cee10fd59d50f1f350f9e817a0ab3')

build() {
    cd ${pkgname}-${pkgver}
    ./configure --prefix=/usr
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR=$pkgdir install
}
