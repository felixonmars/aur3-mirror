# Maintainer: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=kdeplasma-applets-klicker
pkgver=0.1.1
pkgrel=1
pkgdesc="A plasmoid icon application launcher with zooming"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php?content=99554"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('plasma-klicker-plasmoid')
replaces=('plasma-klicker-plasmoid')
source=("http://www.kde-look.org/CONTENT/content-files/99554-klicker$pkgver.tar.gz")
md5sums=('dc85a5d583c3576dfac57825d7cee567')

build() {
  mkdir build
  cd build
  cmake ../ \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}