# Maintainer: Antonio Rojas <nqn1976 @ gmail.com>

pkgname=plasma-applet-google-contacts
pkgver=0.1.5
pkgrel=2
pkgdesc="A plasmoid for displaying contacts from Akonadi google resources"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Google+contacts?content=149182"
license=('GPL')
source=("http://kde-apps.org/CONTENT/content-files/149182-contacts.tar.gz")
md5sums=('4f5f9c45fe42d487af2df66efa723a97')
depends=('kdebase-workspace' 'akonadi-google')
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
