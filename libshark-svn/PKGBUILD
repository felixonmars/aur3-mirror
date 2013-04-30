# Maintainer: Nicolas Stalder <nicolas dot stalder at gmail dot com>
pkgname=libshark-svn
pkgver=3.0beta
pkgrel=1
pkgdesc="SHARK is a fast, modular, feature-rich open-source C++ machine learning library."
arch=('x86_64')
url="http://http://image.diku.dk/shark"
license=('GPL3')
groups=()
depends=('boost-libs')
makedepends=('boost' 'subversion')
changelog=
source=('libshark-svn::svn+https://svn.code.sf.net/p/shark-project/code/trunk/Shark')
md5sums=('SKIP')

build() {
  cd $pkgname
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBoost_NO_SYSTEM_PATHS=TRUE -DBOOST_ROOT=/usr -DBOOST_INCLUDEDIR=/usr/include -DBOOST_LIBRARYDIR=/usr/lib -DBoost_DEBUG=True -DOPT_DYNAMIC_LIBRARY=TRUE -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  make DESTDIR="$pkgdir/" -C $pkgname install
}

# vim:set ts=2 sw=2 et:
