# Maintainer: Christian Bühler <christian.buehler@ipoplan.de>
pkgname=coin-hg
pkgver=11309.abc9f50968c9
pkgrel=1
pkgdesc="High-level, retained-mode toolkit for effective 3D graphics development"
arch=('i686' 'x86_64')
url="https://bitbucket.org/Coin3D/coin"
license=('BSD')
makedepends=('doxygen' 'mercurial')
conflicts=('coin')
provides=('coin=3.1.3-10')
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
  ./configure --prefix=/usr --enable-html
  make
}

package() {
  cd "$srcdir/coin"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
