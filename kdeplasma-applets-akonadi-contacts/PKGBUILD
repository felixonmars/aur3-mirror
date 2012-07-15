# Maintainer: Antonio Rojas <nqn1976 @ gmail.com>

pkgname=kdeplasma-applets-akonadi-contacts
pkgver=0.1.7
pkgrel=1
pkgdesc="A plasmoid for displaying contacts from Akonadi resources"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Akonadi+contacts+plasmoid?content=149182"
license=('GPL')
source=("http://kde-apps.org/CONTENT/content-files/149182-contacts.tar.gz")
md5sums=('8b81b7bce1407e3470c3c5ee92a62c6a')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4' 'boost')
install=$pkgname.install

build() {
  cd $srcdir/contacts
  mkdir build 
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DALL_COLLECTIONS=true ..
  make
}

package() {
  cd $srcdir/contacts/build
  make DESTDIR=$pkgdir install
}
