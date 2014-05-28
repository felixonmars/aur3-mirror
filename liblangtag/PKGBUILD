# Maintainer: Thomas Arnhold <thomas at arnhold dot org>

pkgname=liblangtag
pkgver=0.5.4
pkgrel=1
pkgdesc="Library to access tags for language identification."
arch=('i686' 'x86_64')
url="http://tagoh.bitbucket.org/liblangtag/"
license=('LGPL3.0' 'MPL')
depends=('libxml2')
makedepends=()
source=(https://bitbucket.org/tagoh/${pkgname}/downloads/${pkgname}-${pkgver}.tar.bz2)
md5sums=('6bae8919e5322d96b6fa7cd533523b1f')

build() {
    cd ${pkgname}-${pkgver}
    ./configure --prefix=/usr
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR=$pkgdir install
}
