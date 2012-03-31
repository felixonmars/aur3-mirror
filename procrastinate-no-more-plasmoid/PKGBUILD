# Maintainer: garion < garion @ mailoo.org >

_name=procrastinate-no-more
pkgname=procrastinate-no-more-plasmoid
pkgver=0.2
pkgrel=2
pkgdesc="Plasmoide to keep you from procrastinating"
arch=('i686' 'x86_64')
url="https://gitorious.org/$_name"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
source=(http://kde-apps.org/CONTENT/content-files/142783-$_name-$pkgver.tar.bz2)
md5sums=('0891a144bffc93308fe876d0fa8d7552')

build() {
  cd $srcdir
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ..
  make
}

package(){
  cd $srcdir/build
  make DESTDIR="$pkgdir" install
}
