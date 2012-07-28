# Contributor: Uwe Hofmann (karoshiboy) karoshi at archlinux us

pkgname=kdeplasma-applets-ebayitem
pkgver=0.1.7
pkgrel=1
pkgdesc="A plasmoid for ebay item"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php?content=129460"
license=('BSD')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('plasmoid-ebayitem')
replaces=('plasmoid-ebayitem')
source=("http://www.moben.ru/download/plasmoid-for-ebay-item-$pkgver.tgz")
md5sums=('a932f3e0913ea58b012f56c0d98ede50')

build() {
  mkdir build
  cd build
  cmake ../plasmoid-for-ebay-item-$pkgver \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}