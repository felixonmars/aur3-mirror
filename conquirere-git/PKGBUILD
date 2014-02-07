 
# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=conquirere-git
pkgver=558.2b2993a
pkgrel=1
pkgdesc="Nepomuk-based reference manager for KDE"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/edu/conquirere/"
license=('LGPL')
depends=('kdebase-runtime' 'kbibtex' 'nepomuk-webminer')
makedepends=('git' 'cmake' 'automoc4')
source=('conquirere'::'git://anongit.kde.org/conquirere')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/conquirere
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}


build() {
  cd $srcdir
  rm -rf build
  mkdir build
  cd build
  cmake $srcdir/conquirere -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DCMAKE_BUILD_TYPE=release
  make
}

package() {
  cd $srcdir/build
  make DESTDIR=$pkgdir install
}
 
