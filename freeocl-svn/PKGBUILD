# Maintainer: Jonathan Scott Tinkham <sctincman@gmail.com>

pkgname=freeocl-svn
_pkgname=freeocl
pkgver=0.3.6.r337
_pkgver=0.3.6
pkgrel=1
pkgdesc='Implementation of OpenCL 1.2 specifications targeting CPUs'
arch=(i686 x86_64)
url='https://code.google.com/p/freeocl/'
license=(GPL)
depends=(libatomic_ops gcc opencl-headers)
provides=(libcl)
conflicts=(libcl)
makedepends=(cmake)
#options=(staticlibs !makeflags !strip)
source=('freeocl::svn+http://freeocl.googlecode.com/svn/trunk/'
        'cmake.patch')
md5sums=(SKIP
         89de8dd7e7086f058e49925feddc83f8)

pkgver() {
    cd "$srcdir/$_pkgname"
    local ver="$(svnversion)"
    printf "%s.r%s" "$_pkgver" "${ver//[[:alpha:]]}"
}

prepare() {
    cd $srcdir/$_pkgname
    patch -p0 < ../cmake.patch

    mkdir -p $srcdir/build
}

build() {
    cd  $srcdir/build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ../$_pkgname
    make
}

package() {
    cd $srcdir/build
    make DESTDIR=${pkgdir} install
}
