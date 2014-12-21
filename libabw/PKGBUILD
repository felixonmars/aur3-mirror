# Maintainer: Thomas Arnhold <thomas at arnhold dot org>

pkgname=libabw
pkgver=0.1.1
pkgrel=1
pkgdesc="Import library for AbiWord documents."
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/libabw/"
license=('MPL')
depends=('librevenge' 'libxml2' 'zlib')
makedepends=('boost' 'gperf')
source=(http://dev-www.libreoffice.org/src/${pkgname}-${pkgver}.tar.bz2)
md5sums=('7a3815b506d064313ba309617b6f5a0b')

build() {
    cd ${pkgname}-${pkgver}
    ./configure --prefix=/usr
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR=$pkgdir install
}
