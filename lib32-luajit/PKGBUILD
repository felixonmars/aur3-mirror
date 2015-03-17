_pkgbasename=luajit
pkgname=lib32-${_pkgbasename}
pkgver=2.0.3
pkgrel=1
pkgdesc='A Just-In-Time Compiler for Lua'
arch=('x86_64')
url='http://luajit.org/'
license=('MIT')
depends=('gcc-multilib')
source=(http://luajit.org/download/LuaJIT-$pkgver.tar.gz)
md5sums=('f14e9104be513913810cd59c8c658dc0')

build() {
    export CFLAGS="${CFLAGS} -march=i686 -m32"
    export CXXFLAGS="${CXXFLAGS} -march=i686 -m32"
    export LDFLAGS="${LDFLAGS} -march=i686 -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

    cd $srcdir/LuaJIT-$pkgver
    make amalg PREFIX=/usr
}

package() {
    cd $srcdir/LuaJIT-$pkgver
    make install DESTDIR=$pkgdir PREFIX=/usr
    rm -rf ${pkgdir}/usr/{include,share,bin}
    mv ${pkgdir}/usr/lib ${pkgdir}/usr/lib32
}
