# Maintainer: Antonio Rojas <nqn1976 @ gmail.com>

pkgname=conquirere
pkgver=0.1.git20131025
pkgrel=1
pkgdesc="A Nepomuk powered research tool"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/edu/conquirere"
license=('GPL')
depends=('kdebase-runtime' 'kdepimlibs' 'qjson' 'kbibtex' 'nepomuk-webminer')
makedepends=('cmake' 'automoc4' 'doxygen' 'boost')
install=$pkgname.install
source=("http://quickgit.kde.org/?p=conquirere.git&a=snapshot&h=2b2993a2eb65c48df13c9fe28308ba377b68b2a6&fmt=tgz" $pkgname.install)
md5sums=('c5ac77d70b3bc8bd09c464693f1eb00c'
         'dc1079cf1f785631621386f5dd0948dc')

build() {
  cd $pkgname
  mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make
}

package() {
  cd $pkgname/build
  make DESTDIR=$pkgdir install
}
