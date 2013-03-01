
# Maintainer: Jekyll Wu <adaptee [at] gmail [dot] com>
# Contributor: Timothée Ravier <tim [at] siosm [dot] fr>

pkgname=nmapsi4
pkgver=0.4.1
pkgrel=1
pkgdesc="Qt-based GUI for nmap"
arch=('i686' 'x86_64')
url="http://www.nmapsi4.org/"
license=('GPL2')
depends=('nmap' 'qtwebkit')
makedepends=('cmake')
source=(http://nmapsi4.googlecode.com/files/${pkgname}-${pkgver}.tar.xz)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    if [ -d build ] ; then
        rm -rf build
    fi

    mkdir -p build
    cd build

    cmake -DCMAKE_INSTALL_PREFIX=/usr -DQT_QMAKE_EXECUTABLE=qmake-qt4 ../
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    make DESTDIR=${pkgdir} install

    # Fix executable permisions
    chmod 755 ${pkgdir}/usr/bin/*
}

sha1sums=('e2b3188ce3408b90d2acd9afebb86fbe1b4c97f9')
