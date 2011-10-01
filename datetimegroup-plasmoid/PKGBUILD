# Maintainer: Oliver Friedrich

pkgname=datetimegroup-plasmoid
pkgver=0
pkgrel=1
pkgdesc="A plasmoid for those who are using NATO (or armed forces) date time groups."
arch=('any')
url="http://kde-look.org/content/show.php?content=145636"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
source=(http://kde-look.org/CONTENT/content-files/145636-datetimegroup.tar.gz)
md5sums=('4e3f70f23af2ccbb4f0e6a467f4b6991')
build() {
  cd $srcdir/datetimegroup/
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ..
  make
  make DESTDIR=$pkgdir install
}
