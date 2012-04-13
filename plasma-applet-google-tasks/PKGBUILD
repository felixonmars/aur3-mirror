# Maintainer: Antonio Rojas <nqn1976 @ gmail.com>

pkgname=plasma-applet-google-tasks
pkgver=0.1.3
pkgrel=2
pkgdesc="A plasmoid for displaying tasks from Akonadi google resources"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Google+tasks?content=149525"
license=('GPL')
source=('http://kde-apps.org/CONTENT/content-files/149525-tasks_plasmoid.tar.gz')
md5sums=('84bc1c0ef57efe5fd0ef614866339d54')
depends=('kdebase-workspace' 'akonadi-google')
makedepends=('cmake' 'automoc4' 'boost')
install=$pkgname.install

build() {
  cd $srcdir/tasks
  mkdir build 
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DALL_COLLECTIONS=true ..
  make
}

package() {
  cd $srcdir/tasks/build
  make DESTDIR=$pkgdir install
}