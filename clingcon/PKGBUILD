pkgname=clingcon
pkgver=2.0.3
pkgrel=1
pkgdesc="an answer set solver for (extended) constraint normal logic programs."
arch=('x86_64' 'i686')
url="http://www.cs.uni-potsdam.de/clingcon/"
license=('GPL3')
makedepends=('boost>=1.37' 'cmake>=2.6')
depends=('re2c' 'lua51' 'boost-libs>=1.37')
optdepends=('sqlite3' 'mysql')
source=("http://downloads.sourceforge.net/project/potassco/${pkgname}/${pkgver}/${pkgname}-${pkgver}-source.tar.gz")
md5sums=('05f5a89bd84e08a6e0f6e94d4099240e')

build() {
    cd "${srcdir}/temp"
    cmake_options="-DWITH_LUA=system -DCMAKE_CXX_FLAGS=-fpermissive \
        -DLUA_INCLUDE_DIR=/usr/include/lua5.1 -DLUA_LIBRARY=/usr/lib/liblua5.1.so \
        -DLUA_LIBRARIES='/usr/lib/liblua5.1.so;/usr/lib/libm.so;/usr/lib/libdl.so'" make $MAKEFLAGS
}

package() {
    cd "${srcdir}/temp/build/release/bin"
    install -D gringo ${pkgdir}/usr/bin/${pkgname}
}
