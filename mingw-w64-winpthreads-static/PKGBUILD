# Maintainer: Никола Вукосављевић <hauzer@gmx.com>
# Contributor: rubenvb vanboxem <dottie> ruben <attie> gmail <dottie> com

pkgname=mingw-w64-winpthreads-static
pkgver=3.0.0
pkgrel=1
pkgdesc='MinGW-w64 winpthreads library (static)'
arch=('any')
url='http://mingw-w64.sourceforge.net'
license=('custom')
groups=('mingw-w64-toolchain' 'mingw-w64')
depends=()
makedepends=('mingw-w64-gcc-base' 'mingw-w64-binutils' 'mingw-w64-crt')
optdepends=()
provides=('mingw-w64-headers-bootstrap' 'mingw-w64-winpthreads')
conflicts=('mingw-w64-headers-bootstrap' 'mingw-w64-winpthreads')
replaces=('mingw-w64-headers-bootstrap')
backup=()
options=('!strip' '!buildflags' '!emptydirs' 'staticlibs')
source=(http://sourceforge.net/projects/mingw-w64/files/mingw-w64/mingw-w64-release/mingw-w64-v${pkgver}.tar.bz2)
md5sums=('22b0030702fe00927daf1ae6ddfb526e')

_targets="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _target in ${_targets}; do
    msg "Building ${_target} winpthreads..."
    mkdir -p ${srcdir}/winpthreads-build-${_target} && cd ${srcdir}/winpthreads-build-${_target}
    ${srcdir}/mingw-w64-v${pkgver}/mingw-w64-libraries/winpthreads/configure --prefix=/usr/${_target} \
        --host=${_target} --enable-static --disable-shared
    make
  done
}

package() {
  for _target in ${_targets}; do
    cd ${srcdir}/winpthreads-build-${_target}
    make DESTDIR=${pkgdir} install
  done
}

