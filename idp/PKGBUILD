# Maintainer: buhman <zack[at]buhman[dot]org>
pkgname=idp
pkgver=3.1.3
pkgrel=1
pkgdesc="a system for representing knowledge in the logic FO(IDP) and applying reasoning on it."
url="http://dtai.cs.kuleuven.be/krr/software/idp"
arch=('x86_64' 'i686')
license=('GPLv3')
makedepends=('texlive-bin' 'texlive-latexextra' 'latex2html' 'cmake' 'doxygen')
depends=('lua51')
source=("http://dtai.cs.kuleuven.be/krr/files/software/${pkgname}3/${pkgname}-${pkgver}-Source.tar.gz")
md5sums=('0c25c0ae1ed6f54e04a78f2918199aa0')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}-Source"
    mkdir build && cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE="Release" \
        -DWITH_LUA=system
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}-Source/build"
    make DESTDIR="${pkgdir}" install

    cd ${pkgdir}/usr
    find {lib,include} -name '*lua*' -exec rm {} \;
    rm include/lauxlib.h
}
