# Maintainer: Christian Bühler <christian.buehler@ipoplan.de>
pkgname=quarter-qt5
pkgver=464.a941589f50f9
pkgrel=1
pkgdesc="Light-weight glue library that provides seamless integration between Coin and Qt"
arch=('i686' 'x86_64')
url="https://bitbucket.org/Coin3D/quarter"
license=('BSD')
depends=('coin-hg' 'qt5-tools')
makedepends=('mercurial' 'cmake')
source=(hg+https://bitbucket.org/Coin3D/quarter)
md5sums=('SKIP')

pkgver() {
  cd quarter
  echo $(hg identify -n).$(hg identify -i)
}

build() {
  cd "$srcdir"
  mkdir -p build
  cd build
  cmake ../quarter -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir/" install
  install -D "$srcdir/quarter/COPYING" $pkgdir/usr/share/licenses/$pkgname/COPYING
}

# vim:set ts=2 sw=2 et:
