# Maintainer: Antonio Rojas <nqn1976 @ gmail.com>

pkgname=kdeplasma-applets-akonadi-calendar
pkgver=0.2.2
pkgrel=1
pkgdesc="A plasmoid for displaying events from Akonadi resources"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Akonadi+calendar+plasmoid?content=150034"
license=('GPL')
source=("http://kde-apps.org/CONTENT/content-files/150034-akonadi-calendars-$pkgver.tar.bz2")
md5sums=('af80744a2f5e0064b2520c12ce56b6f1')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4' 'boost')
install=$pkgname.install

build() {
  cd akonadi-calendars-$pkgver
  mkdir build 
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd akonadi-calendars-$pkgver/build
  make DESTDIR=$pkgdir install
}