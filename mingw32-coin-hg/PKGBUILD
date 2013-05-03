# Maintainer: Christian Bühler <christian.buehler@ipoplan.de>
pkgname=mingw32-coin-hg
pkgver=11309.abc9f50968c9
pkgrel=1
pkgdesc="High-level, retained-mode toolkit for effective 3D graphics development (mingw32)"
arch=('any')
url="https://bitbucket.org/Coin3D/coin"
license=('BSD')
depends=('mingw32-runtime')
makedepends=('mercurial' 'mingw32-gcc')
options=('!strip' '!buildflags')
source=(hg+https://bitbucket.org/Coin3D/coin
        hg+https://bitbucket.org/Coin3D/generalmsvcgeneration
        hg+https://bitbucket.org/Coin3D/boost-header-libs-full)
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd coin
  echo $(hg identify -n).$(hg identify -i)
}

prepare() {
  # https://bitbucket.org/Coin3D/coin/pull-request/3
  sed -i '/^#include <Inventor\/C\/basic.h>$/i #include <Inventor/C/errors/debugerror.h>' "$srcdir/coin/include/Inventor/SbBasic.h"
}

build() {
  cd "$srcdir/coin"
  unset LDFLAGS CPPFLAGS
  ./configure --prefix=/usr/i486-mingw32 --host=i486-mingw32
  make
}

package() {
  cd "$srcdir/coin"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
