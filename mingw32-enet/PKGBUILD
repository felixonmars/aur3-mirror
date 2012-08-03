# Maintainer: Naelstrof <naelstrof@gmail.com> 
pkgname=mingw32-enet
pkgver=1.3.4
pkgrel=1
pkgdesc="A free, open source, portable framework for networking application development (mingw32)"
arch=('any')
url="http://enet.bespin.org/"
license=('MIT')
makedepends=('mingw32-gcc')
depends=('mingw32-runtime')
options=('!strip')
source=("http://enet.bespin.org/download/enet-${pkgver}.tar.gz")
md5sums=('e5fb0ca3fd3a9fe7eadbcde4d6af1517')

build() {
    cd "${srcdir}/enet-${pkgver}"
    CFLAGS=-I/usr/i486-mingw32/include
    CPPFLAGS=-I/usr/i486-mingw32/include
    LDFLAGS=-L/usr/i486-mingw32/lib
    export CFLAGS CPPFLAGS LDFLAGS
    ./configure \
        --prefix=${pkgdir}/usr/i486-mingw32 \
        --host=i486-mingw32 \
        --build=$CHOST
    make
}

package() {
    cd "${srcdir}/enet-${pkgver}"
    make install

    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    cp "${srcdir}/enet-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
