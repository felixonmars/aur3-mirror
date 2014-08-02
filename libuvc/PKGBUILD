# Maintainer: Ken Tossell <ken@tossell.net>
pkgname=libuvc
pkgver=0.0.5
pkgrel=1
pkgdesc="a cross-platform library for USB video devices"
arch=('i686' 'x86_64')
url="https://int80k.com/libuvc/"
license=('BSD')
depends=('libusb')
makedepends=('cmake')
source=(https://github.com/ktossell/libuvc/archive/v$pkgver.tar.gz)
md5sums=('b685fb20122e3430d045cef3befe389a')

build() {
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build"
    cd "${srcdir}/${pkgname}-${pkgver}-build"

    cmake "${srcdir}/${pkgname}-${pkgver}" -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}-build"
    make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:

