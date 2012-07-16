# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=kdeplasma-applets-stocks
pkgver=0.4
pkgrel=1
pkgdesc="Displays stock quotes on your plasma enabled desktop"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/Stocks?content=87047"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
source=("http://pansy.at/gernot/plasma-widget-stocks-$pkgver.tar.gz")
md5sums=('169ef7b51f0ab63ea19b2d45f2053ff2')

build() {
  mkdir build
  cd build
  cmake ../plasma-widget-stocks \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
