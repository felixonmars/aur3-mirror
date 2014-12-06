# Maintainer: Thomas Arnhold <thomas at arnhold dot org>

pkgname=libmwaw
pkgver=0.3.3
pkgrel=1
pkgdesc="Import library for some old mac text documents."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/libmwaw/"
license=('LGPL2.0' 'MPL')
depends=('librevenge')
makedepends=('boost' 'doxygen')
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.xz)
md5sums=('de4963d833142ce690ca9518a916e888')

build() {
    cd ${pkgname}-${pkgver}
    ./configure --prefix=/usr
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR=$pkgdir install
}
