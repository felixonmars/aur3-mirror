# Maintainer: Thomas Arnhold <thomas at arnhold dot org>

pkgname=libcmis
pkgver=0.5.0
pkgrel=1
pkgdesc="C++ client library for the CMIS interface."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/libcmis/"
license=('GPL2' 'LGPL2.0' 'MPL')
depends=()
makedepends=('boost' 'cppunit')
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('5821b806a98e6c38370970e682ce76e8')

build() {
    cd ${pkgname}-${pkgver}
    ./configure --prefix=/usr --without-man
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR=$pkgdir install
}
