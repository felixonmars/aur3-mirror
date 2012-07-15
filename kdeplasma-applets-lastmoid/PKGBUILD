# Maintainer: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=kdeplasma-applets-lastmoid
pkgver=0.6.5
pkgrel=1
pkgdesc="Shows your Last.fm charts on your desktop"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php?content=98117"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('plasma-lastmoid')
replaces=('plasma-lastmoid')
source=("http://kde-look.org/CONTENT/content-files/98117-vavrusa-lastmoid-2041bf6.tar.gz")
md5sums=('68674e24774f4d029f29e96795b5e8a0')

build() {
  mkdir build
  cd build
  cmake ../vavrusa-lastmoid-2041bf6 \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}