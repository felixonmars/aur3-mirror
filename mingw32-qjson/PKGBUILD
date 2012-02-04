# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: mosra <mosra@centrum.cz>

_pkgname=qjson

pkgname=mingw32-qjson
pkgver=0.7.1
pkgrel=1
pkgdesc="A qt-based library that maps JSON data to QVariant objects (mingw32)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://qjson.sourceforge.net"
depends=('mingw32-qt>=4.6' 'mingw32-gcc')
makedepends=('cmake')
options=('!strip' '!buildflags')
source=(
    "http://downloads.sourceforge.net/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2"
    "Toolchain-Qt4-mingw32.cmake"
)
md5sums=('5a833ad606c164ed8aa69f0873366ace'
         '778cd621a6281c643d52c0e9adf47fb3')

build() {

    unset CFLAGS        # march=native and other nonsenses
    unset CXXFLAGS
    unset LDFLAGS       # or fails on '--hash-style=gnu' or similar

    # Fix place for CMake modules
    sed -i 's#/share/apps/cmake/modules#/share/cmake-2.8/Modules#' \
        "$srcdir/qjson/CMakeLists.txt"

    mkdir -p "$srcdir/build"
    cd "$srcdir/build"

    cmake ../${_pkgname} \
        -DCMAKE_INSTALL_PREFIX=/usr/i486-mingw32 \
        -DCMAKE_TOOLCHAIN_FILE=${srcdir}/Toolchain-Qt4-mingw32.cmake

    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR=${pkgdir} install || return 1
}
