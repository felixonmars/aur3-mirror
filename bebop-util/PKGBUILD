# Maintainer: Vladimir Gorbunov <truedaemon@gmail.com>
pkgname=bebop-util
pkgver=2008_07_01
pkgrel=1
pkgdesc="BeBOP Utility Library"
arch=('x86_64' 'i686')
url="http://bebop.cs.berkeley.edu/smc/"
license=('BSD')
groups=()
depends=('glibc')
source=("http://bebop.cs.berkeley.edu/smc/tarballs/bebop_make.tar.gz"
    "http://bebop.cs.berkeley.edu/smc/tarballs/bebop_util.tar.gz")
noextract=()
md5sums=('8757e67dc432b2ff0a42397b69ad7226'
    'b512b9f390219ea535c57ff3b4387e98')

build() {
    cd "${srcdir}/bebop_util"
    make
}

package() {
    cd "${srcdir}/bebop_util"
    mkdir -p "${pkgdir}/usr/include/"
    cp -R include/* "${pkgdir}/usr/include/"
    install -D libbebop_util.a "${pkgdir}/usr/lib/libbebop_util.a"
    install -D libbebop_util.so "${pkgdir}/usr/lib/libbebop_util.so"
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
