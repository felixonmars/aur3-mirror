# Contributor: Viliam Pucik <viliam dot pucik at gmail dot com>

pkgname=kdeplasma-applets-cpuload
pkgver=0.3.2
pkgrel=1
pkgdesc="KDE 4 Plasma applet which displays CPU Load (User, System, Nice, IOWait)"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/cpuload?content=86628"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('plasmoid-cpuload')
replaces=('plasmoid-cpuload')
source=("http://kde-look.org/CONTENT/content-files/86628-cpuload-$pkgver.tar.gz")
md5sums=('b79d7c2ae47d3a9c5886a11cddacf5fb')

build() {
  mkdir build
  cd build
  cmake ../cpuload \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}