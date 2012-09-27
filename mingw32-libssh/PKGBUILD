pkgname=mingw32-libssh
pkgver=0.5.2
pkgrel=3
pkgdesc="Library for accessing ssh client services through C libraries (mingw32)"
arch=('any')
license=('LGPL')
depends=(mingw32-runtime mingw32-zlib mingw32-gcrypt)
makedepends=(mingw32-gcc)
options=(!strip !buildflags)
conflicts=(mingw32-libssh-static-git)
url="http://www.libssh.org/"
source=("http://www.libssh.org/files/0.5/libssh-$pkgver.tar.gz"
"cmake-toolchain.cmake")
md5sums=('38b67c48af7a9204660a3e08f97ceba6'
'dd2b2db48187dff84050fe191d309d81')

build() {
    cd "$srcdir/libssh-$pkgver"
    unset LDFLAGS
    mkdir -p build && cd build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr/i486-mingw32/ \
        -DCMAKE_TOOLCHAIN_FILE=${srcdir}/cmake-toolchain.cmake \
        -DWITH_STATIC_LIB=ON \
        -DWITH_GCRYPT=ON
    make
}

package() {
    cd "$srcdir/libssh-$pkgver/build"
    make DESTDIR=${pkgdir} install
    i486-mingw32-strip -x $pkgdir/usr/i486-mingw32/bin/*.dll
    i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
}
