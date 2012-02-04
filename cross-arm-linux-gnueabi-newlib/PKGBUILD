# Maintainer: The Lemon Man <segnalazionidalweb@gmail.com>
pkgname=cross-arm-linux-gnueabi-newlib
pkgver=1.18.0
pkgrel=1
pkgdesc="This package provides newlib for the arm-linux-gnueabi toolchain."
url="http://sourceware.org/newlib/"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=()
optdepends=()
makedepends=("cross-arm-linux-gnueabi-binutils" "cross-arm-linux-gnueabi-gcc-base")
conflicts=()
replaces=()
backup=()
source=("ftp://sources.redhat.com/pub/newlib/newlib-${pkgver}.tar.gz")
md5sums=('3dae127d4aa659d72f8ea8c0ff2a7a20')
options=(!buildflags !libtool !emptydirs !strip ccache)

build() {
    cd ${srcdir}/newlib-${pkgver}
 
    ./configure                     \
        --prefix=/usr               \
        --target=arm-linux-gnueabi  \
        --with-float=soft           \
        --enable-interwork          \
        --disable-nls

    make
}

package () {
    cd ${srcdir}/newlib-${pkgver}
    
    make DESTDIR="$pkgdir/" install
    rm -rf ${pkgdir}/usr/share/info
}

