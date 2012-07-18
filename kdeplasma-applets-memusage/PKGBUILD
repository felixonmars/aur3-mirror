# Contributor: Viliam Pucik <viliam dot pucik at gmail dot com>

pkgname=kdeplasma-applets-memusage
pkgver=0.3.3
pkgrel=1
pkgdesc="KDE plasma applet which displays RAM and swap usage"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/memusage?content=86630"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('plasmoid-memusage')
replaces=('plasmoid-memusage')
source=("http://kde-look.org/CONTENT/content-files/86630-memusage-$pkgver.tar.gz")
md5sums=('d919e2a9157753ba44b6d040e4dd652d')

build() {
  mkdir build
  cd build
  cmake ../memusage \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}