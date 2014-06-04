# Maintainer: Thomas Arnhold <thomas at arnhold dot org>

pkgname=libe-book
pkgver=0.1.1
pkgrel=1
pkgdesc="Library for import of reflowable e-book formats."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/libebook/"
license=('LGPL2.1' 'MPL')
depends=('libcss' 'libhubbub' 'libmspack' 'librevenge' 'libxml2' 'zlib')
makedepends=('boost' 'icu')
source=(http://downloads.sourceforge.net/project/${pkgname//-/}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.xz)
md5sums=('3a46f4dedaadd3f1548c4423a6cdaf25')

build() {
    cd ${pkgname}-${pkgver}
    ./configure --prefix=/usr --disable-werror
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR=$pkgdir install
}
