# Contributor: Viliam Pucik <viliam dot pucik at gmail dot com>

pkgname=plasmoid-system-status
pkgver=0.6.0
pkgrel=2
pkgdesc="Plasma System Monitor (checks CPU/RAM/Swap)"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/System+Status?content=74891"
license=('GPL')
depends=('kdebase-workspace>=4.1.0')
makedepends=('gcc' 'cmake' 'automoc4')
source=(http://www.kde-look.org/CONTENT/content-files/74891-systemloadviewer.tar.gz)

build() {
  cd $startdir/src/systemloadviewer

  # to compile with KDE 4.2
  sed -i -e "s/find_package(Plasma REQUIRED)//" CMakeLists.txt
  sed -i -e "s/PLASMA_LIBS/KDE4_PLASMA_LIBS/" CMakeLists.txt

  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make || return 1
  make DESTDIR=$pkgdir install
}
md5sums=('de89bf8baba883003976690a9d13e7df')
