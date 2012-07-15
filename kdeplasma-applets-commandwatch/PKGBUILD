# Maintainer: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=kdeplasma-applets-commandwatch
pkgver=0.1.1
pkgrel=1
pkgdesc="Plasmoid which periodically runs a system command and displays its output"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php?content=84523"
license=('GPL2')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('plasma-commandwatch-plasmoid')
replaces=('plasma-commandwatch-plasmoid')
source=("http://www.kde-look.org/CONTENT/content-files/84523-commandwatch-"${pkgver}".tar.bz2")
md5sums=('e9278c96870203b5fcf17a7660bb74da')

build() {
  mkdir build
  cd build
  cmake ../commandwatch-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR=$pkgdir install
}