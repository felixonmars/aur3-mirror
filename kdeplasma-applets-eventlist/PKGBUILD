# Maintainer: (locke87) Felix Mauch
# based on http://kde-apps.org/content/show.php?content=124416

pkgname=kdeplasma-applets-eventlist
pkgver=0.7
pkgrel=1
pkgdesc="This is a plasmoid to show the events from Akonadi resources (KOrganizer, Birthdays etc.)."
url="http://kde-look.org/content/show.php/Eventlist?content=107779"
license=('GPL')
arch=('i686' 'x86_64')
depends=('kdebase-workspace>=4.7.0' 'boost-libs')
conflicts=('plasmoid-eventlist')
makedepends=('gcc' 'cmake' 'automoc4' 'boost')
source=(http://www.kde-look.org/CONTENT/content-files/107779-plasmoid-eventlist-$pkgver.tar.bz2)
md5sums=('3aeed55543cf96d1e98e49e708ddbf75')

 
package() {
  cd $startdir/src/plasmoid-eventlist-$pkgver/
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ../
  make || return 1
  make DESTDIR=$pkgdir install
}