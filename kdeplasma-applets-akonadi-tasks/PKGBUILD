# Maintainer: Antonio Rojas <nqn1976 @ gmail.com>

pkgname=kdeplasma-applets-akonadi-tasks
pkgver=0.1.3
pkgrel=2
pkgdesc="A plasmoid for displaying tasks from Akonadi resources"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Akonadi+tasks+plasmoid?content=149525"
license=('GPL')
source=('http://kde-apps.org/CONTENT/content-files/149525-akonadi-tasks.tar.bz2')
md5sums=('e2b92b84b88e5ec6fa3b58039e0ae741')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4' 'boost')
install=$pkgname.install

build() {
  cd $srcdir/akonadi-tasks-$pkgver
  mkdir build 
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd $srcdir/akonadi-tasks-$pkgver/build
  make DESTDIR=$pkgdir install
}