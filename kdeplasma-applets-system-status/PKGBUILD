# Contributor: Viliam Pucik <viliam dot pucik at gmail dot com>

pkgname=kdeplasma-applets-system-status
pkgver=0.6.0
pkgrel=1
pkgdesc="Plasma System Monitor (checks CPU/RAM/Swap)"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/System+Status?content=74891"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('plasmoid-system-status')
conflicts=('replaces-system-status')
source=("http://www.kde-look.org/CONTENT/content-files/74891-systemloadviewer.tar.gz")
md5sums=('de89bf8baba883003976690a9d13e7df')

build() {
  # to compile with KDE >= 4.2
  cd systemloadviewer
  sed -i -e "s/find_package(Plasma REQUIRED)//" CMakeLists.txt
  sed -i -e "s/PLASMA_LIBS/KDE4_PLASMA_LIBS/" CMakeLists.txt
  cd ..

  mkdir build
  cd build
  cmake ../systemloadviewer \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}