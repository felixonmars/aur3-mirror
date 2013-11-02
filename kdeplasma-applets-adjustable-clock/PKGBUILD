# Contributor: Simone Solinas <ksolsim@gmail.com>

pkgname=kdeplasma-applets-adjustable-clock
pkgver=4.1.4
pkgrel=1
pkgdesc="Customizable kdeplasma clock"
arch=(i686 x86_64)
url="http://www.kde-look.org/content/show.php/Adjustable+Clock?content=92825"
license=('GPL')
conflicts=('adjustable-clock-plasmoid')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
source=(http://kde-look.org/CONTENT/content-files/92825-adjustableclock-$pkgver.tar.bz2)
md5sums=('9dd16be8c1bf520bd8bf49353a82b9c6')
build() {
  cd $srcdir/adjustableclock-$pkgver
  mkdir build
  cd build
  cmake -DQT_QMAKE_EXECUTABLE=qmake-qt4 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ..
  make
}

package() {
  cd $srcdir/adjustableclock-$pkgver/build
  make DESTDIR=$pkgdir install
} 
