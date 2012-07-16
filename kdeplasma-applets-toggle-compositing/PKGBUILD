# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=kdeplasma-applets-toggle-compositing
pkgver=0.2.3
pkgrel=1
pkgdesc="A convenient plasmoid that allows you to toggle between kwin's compositing and traditional modes"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/Toggle-Compositing?content=78299"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('togglecompositing-plasmoid')
replaces=('togglecompositing-plasmoid')
source=("http://ivplasma.googlecode.com/files/toggle-compositing-$pkgver.tar.gz")
md5sums=('c811dd4d9842d1628b748e01855357b5')

build() {
  mkdir build
  cd build
  cmake ../toggle-compositing \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}