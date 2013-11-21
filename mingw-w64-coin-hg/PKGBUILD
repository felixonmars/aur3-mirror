# Maintainer: Christian Bühler <christian.buehler@ipoplan.de>
pkgname=mingw-w64-coin-hg
pkgver=11309.abc9f50968c9
pkgrel=1
pkgdesc="High-level, retained-mode toolkit for effective 3D graphics development (mingw-w64)"
arch=('any')
url="https://bitbucket.org/Coin3D/coin"
license=('BSD')
makedepends=('mercurial' 'mingw-w64-gcc')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=(hg+https://bitbucket.org/Coin3D/coin
        hg+https://bitbucket.org/Coin3D/generalmsvcgeneration
        hg+https://bitbucket.org/Coin3D/boost-header-libs-full)
md5sums=('SKIP' 'SKIP' 'SKIP')

_architectures="i686-w64-mingw32"

pkgver() {
  cd coin
  echo $(hg identify -n).$(hg identify -i)
}

prepare() {
  # https://bitbucket.org/Coin3D/coin/pull-request/3
  sed -i '/^#include <Inventor\/C\/basic.h>$/i #include <Inventor/C/errors/debugerror.h>' "$srcdir/coin/include/Inventor/SbBasic.h"
}

build() {
  unset LDFLAGS CPPFLAGS
  CXXFLAGS+=' -D__CORRECT_ISO_CPP_STDLIB_H_PROTO'
  cd "$srcdir/coin"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ../configure \
      --prefix=/usr/${_arch} \
      --host=${_arch}
    make
    popd
  done
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  for _arch in ${_architectures}; do
    cd "${srcdir}/coin/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -r $pkgdir/usr/${_arch}/share/man
    ln -s ../${_arch}/bin/coin-config "$pkgdir/usr/bin/${_arch}-coin-config"
  done
}

# vim:set ts=2 sw=2 et:
