# Contributor: Viliam Pucik <viliam dot pucik at gmail dot com>

pkgname=kdeplasma-applets-simplemonitor
pkgver=0.1
pkgrel=1
pkgdesc="KDE plasma applet which displays the history of CPU usage (shown for all CPUs in the system) and used and disk cache memory"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/Simple+monitor?content=84933"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('plasmoid-simplemonitor')
replaces=('plasmoid-simplemonitor')
source=("http://www.kde-look.org/CONTENT/content-files/84933-simplemonitor.tar.gz")
md5sums=('e37d206a7e45cebd6c62c717e008215d')

build() {
  mkdir build
  cd build
  cmake ../simplemonitor \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}